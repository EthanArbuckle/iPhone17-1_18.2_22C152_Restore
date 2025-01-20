id sub_100003C20(uint64_t a1)
{
  return _[*(id *)(a1 + 32) donePressed:0];
}

void sub_1000047FC(id a1, NSError *a2)
{
  v2 = a2;
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  v4 = (void *)os_log_GKHosted;
  if (os_log_type_enabled(os_log_GKHosted, OS_LOG_TYPE_DEBUG)) {
    sub_100016058(v4, v2);
  }
}

BOOL sub_1000058D8(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

double variable initialization expression of MultiplayerModeSelectionViewController.edgeInsets()
{
  return 16.0;
}

double variable initialization expression of MultiplayerModeSelectionViewController.chicletSpacing()
{
  int ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
  double result = 16.0;
  if (ShouldUsePadUI) {
    return 24.0;
  }
  return result;
}

double variable initialization expression of MultiplayerModeSelectionViewController.chicletSpacingIPhonePotrait()
{
  return 10.0;
}

void *variable initialization expression of MultiplayerModeSelectionViewController.chiclets()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t variable initialization expression of MultiplayerModeSelectionViewController.dismissHandler()
{
  return 0;
}

double variable initialization expression of MultiplayerModeSelectionViewController.startTime()
{
  return 0.0;
}

uint64_t variable initialization expression of MultiplayerModeSelectionViewController.cellReuseIdentifier()
{
  return 0x4374656C63696843;
}

uint64_t variable initialization expression of MultiplayerModeSelectionViewController.cellReuseIdentifierAX()
{
  return 0x4374656C63696843;
}

uint64_t sub_100005994(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_1000059CC(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000059D8(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000059F8(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
}

void type metadata accessor for GKMatchmakingMode(uint64_t a1)
{
}

void sub_100005A4C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005A94()
{
  uint64_t v1 = sub_100005BD4();
  uint64_t result = nullsub_2(v1);
  uint64_t *v0 = result;
  return result;
}

BOOL sub_100005ABC(uint64_t *a1, uint64_t *a2)
{
  return sub_1000058D8(*a1, *a2);
}

void sub_100005AC8(uint64_t a1@<X8>)
{
  sub_100005AFC();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_100005B04()
{
  return sub_100015898();
}

uint64_t sub_100005B10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = _s29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewControllerC8kvoToken10Foundation21NSKeyValueObservationCSgvpfi_0();
  *a1 = result;
  return result;
}

uint64_t sub_100005B38@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100014F4C(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_100005B68(void *a1, uint64_t *a2)
{
  return sub_100014F54(a1, *a2);
}

uint64_t sub_100005B70(uint64_t *a1)
{
  return sub_100014F80(*a1);
}

uint64_t sub_100005B78(uint64_t *a1)
{
  return sub_100014F90(*a1);
}

uint64_t sub_100005B80()
{
  sub_100005BD4();
  uint64_t result = sub_100014FA0();
  uint64_t *v0 = result;
  v0[1] = v2;
  return result;
}

void *sub_100005BA8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100005BB4(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t _s29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewControllerC8kvoToken10Foundation21NSKeyValueObservationCSgvpfi_0()
{
  return 0;
}

uint64_t _s29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewControllerC30isEntitledToUseGroupActivitiesSbvpfi_0()
{
  return 0;
}

uint64_t sub_100005BD4()
{
  return *(void *)v0;
}

uint64_t sub_100005BE0(uint64_t a1, uint64_t a2)
{
  char v3 = (void *)(v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_messagesGroupPhotoData);
  uint64_t v4 = *(void *)(v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_messagesGroupPhotoData);
  unint64_t v5 = *(void *)(v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_messagesGroupPhotoData + 8);
  *char v3 = a1;
  v3[1] = a2;
  return sub_10000736C(v4, v5);
}

unsigned char *sub_100005C00(void *a1, char a2)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for SharePlayModeChiclet());
  uint64_t result = sub_100005C4C(a1);
  result[OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_isEligibleForGroupSession] = a2;
  return result;
}

id sub_100005C4C(void *a1)
{
  uint64_t v22 = sub_100016380();
  uint64_t v2 = *(void *)(v22 - 8);
  __chkstk_darwin(v22);
  sub_100007B8C();
  uint64_t v5 = v4 - v3;
  uint64_t v6 = sub_100016360();
  __chkstk_darwin(v6);
  sub_100007B8C();
  uint64_t v7 = sub_100016210();
  __chkstk_darwin(v7 - 8);
  sub_100007B8C();
  v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_isEligibleForGroupSession] = 0;
  uint64_t v8 = (uint64_t)&v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_activeConversationUUID];
  uint64_t v9 = sub_100016130();
  sub_100007B00(v8, 1, 1, v9);
  *(_OWORD *)&v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_messagesGroupPhotoData] = xmmword_100017F60;
  v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_startStagedActivity] = 0;
  uint64_t v21 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_imageLoadQueue;
  sub_100007618(0, &qword_100029380);
  v10 = v1;
  sub_100016200();
  sub_100007524(&qword_100029388, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100007328(&qword_100029390);
  sub_100007B28(&qword_100029398, &qword_100029390);
  sub_100016440();
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v22);
  *(void *)&v1[v21] = sub_1000163B0();

  id v11 = a1;
  sub_10000DF1C(v11);
  id v13 = v12;
  uint64_t v14 = sub_100016290();
  sub_10000E6B0(v14, v15);
  id v16 = v13;
  uint64_t v17 = sub_100016290();
  sub_10000E6BC(v17, v18);

  id v19 = v16;
  sub_10000E6D0(0x616C706572616873, 0xE900000000000079);

  return v19;
}

void sub_100005F94(char a1)
{
  sub_10000DF7C(a1);
  uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController];
  if (v2)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    v7[4] = sub_100007410;
    v7[5] = v3;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256;
    v7[2] = sub_100006F00;
    v7[3] = &unk_100020C40;
    uint64_t v4 = _Block_copy(v7);
    id v5 = v2;
    uint64_t v6 = v1;
    swift_release();
    [v5 sharePlayFetchFirstActiveConversationWithHandler:v4];
    _Block_release(v4);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100006090(void *a1, char *a2)
{
  uint64_t v4 = sub_1000161F0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100016210();
  uint64_t v53 = *(void *)(v8 - 8);
  __chkstk_darwin();
  v10 = (char *)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000161C0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v50 = v8;
    uint64_t v51 = v5;
    uint64_t v52 = v4;
    id v49 = a1;
    id v15 = [v49 activeRemoteParticipants];
    sub_100007618(0, &qword_100029348);
    sub_100007430();
    uint64_t v16 = sub_100016320();

    uint64_t v17 = sub_100006788(v16);
    swift_bridgeObjectRelease();
    sub_100016290();
    sub_100007328(&qword_100029358);
    uint64_t v18 = swift_allocObject();
    long long v48 = xmmword_100017F70;
    *(_OWORD *)(v18 + 16) = xmmword_100017F70;
    sub_100016290();
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = v48;
    *(void *)(v19 + 56) = &type metadata for Int;
    *(void *)(v19 + 64) = &protocol witness table for Int;
    *(void *)(v19 + 32) = v17;
    uint64_t v20 = sub_100016260();
    uint64_t v22 = v21;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(void *)(v18 + 56) = &type metadata for String;
    *(void *)(v18 + 64) = sub_100007490();
    *(void *)(v18 + 32) = v20;
    *(void *)(v18 + 40) = v22;
    uint64_t v23 = sub_100016260();
    uint64_t v25 = v24;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000E6B0(v23, v25);
    v26 = *(void **)&a2[OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_primaryMetadata];
    if (v26)
    {
      uint64_t v27 = *(void *)&a2[OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_subtitle];
      uint64_t v28 = *(void *)&a2[OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_subtitle + 8];
      id v29 = v26;
      swift_bridgeObjectRetain();
      sub_10000903C(0, 0xE000000000000000, 0, 0xE000000000000000, v27, v28);

      swift_bridgeObjectRelease();
    }
    uint64_t v30 = swift_allocObject();
    id v31 = v49;
    *(void *)(v30 + 16) = a2;
    *(void *)(v30 + 24) = v31;
    aBlock[4] = (uint64_t)sub_10000751C;
    aBlock[5] = v30;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100006EBC;
    aBlock[3] = (uint64_t)&unk_100020C90;
    v32 = _Block_copy(aBlock);
    id v33 = v31;
    v34 = a2;
    sub_100016200();
    v55 = &_swiftEmptyArrayStorage;
    sub_100007524((unint64_t *)&qword_100029368, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100007328(&qword_100029370);
    sub_100007B28((unint64_t *)&qword_100029378, &qword_100029370);
    uint64_t v35 = v52;
    sub_100016440();
    sub_1000163A0();
    _Block_release(v32);

    (*(void (**)(char *, uint64_t))(v51 + 8))(v7, v35);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v10, v50);
    return swift_release();
  }
  else
  {
    os_log_type_t v37 = sub_100016330();
    sub_100016190();
    v38 = sub_1000161B0();
    os_log_type_t v39 = v37;
    if (os_log_type_enabled(v38, v37))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)v40 = 136315138;
      v55 = (void *)sub_100014FA4(0xD00000000000002ELL, 0x800000010001B7B0, aBlock);
      sub_100016400();
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "SharePlay - %s", v40, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    uint64_t v41 = sub_100016290();
    uint64_t result = sub_10000E6B0(v41, v42);
    v43 = *(void **)&a2[OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_primaryMetadata];
    if (v43)
    {
      v44 = &a2[OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_subtitle];
      uint64_t v45 = *(void *)&a2[OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_subtitle];
      uint64_t v46 = *((void *)v44 + 1);
      id v47 = v43;
      swift_bridgeObjectRetain();
      sub_10000903C(0, 0xE000000000000000, 0, 0xE000000000000000, v45, v46);

      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_100006788(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) == 0) {
    return *(void *)(a1 + 16);
  }
  if (a1 < 0) {
    return __CocoaSet.count.getter(a1);
  }
  return __CocoaSet.count.getter(a1 & 0xFFFFFFFFFFFFFF8);
}

uint64_t sub_1000067A8(char *a1, void *a2)
{
  uint64_t v4 = sub_1000161F0();
  uint64_t v38 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100016210();
  uint64_t v39 = *(void *)(v7 - 8);
  uint64_t v40 = v7;
  __chkstk_darwin();
  uint64_t v9 = (char *)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000075B4(a2);
  sub_100005BE0(v10, v11);
  uint64_t v12 = (uint64_t *)&a1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_messagesGroupPhotoData];
  unint64_t v13 = *(void *)&a1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_messagesGroupPhotoData + 8];
  if (v13 >> 60 != 15) {
    goto LABEL_13;
  }
  id v14 = [a2 activeRemoteParticipants];
  sub_100007618(0, &qword_100029348);
  sub_100007430();
  uint64_t v15 = sub_100016320();

  uint64_t v16 = sub_100006788(v15);
  swift_bridgeObjectRelease();
  if (v16 == 1)
  {
    id v17 = [a2 activeRemoteParticipants];
    uint64_t v18 = sub_100016320();

    uint64_t v19 = (void *)sub_100006CA0(v18);
    swift_bridgeObjectRelease();
    if (v19)
    {
      id v20 = [v19 handle];

      if (v20)
      {
        NSString v21 = [v20 value];
        if (!v21)
        {
          sub_100016270();
          NSString v21 = sub_100016250();
          swift_bridgeObjectRelease();
        }
        uint64_t v22 = self;
        id v23 = [objc_allocWithZone((Class)CNContactStore) init];
        id v24 = [v22 contactFromEmailOrPhoneNumber:v21 fromContactStore:v23];

        if (v24)
        {
          uint64_t v25 = sub_100007704(v24);
        }
        else
        {
          uint64_t v25 = 0;
          uint64_t v26 = 0xF000000000000000;
        }
        sub_100005BE0(v25, v26);
      }
    }
  }
  unint64_t v13 = v12[1];
  if (v13 >> 60 == 15)
  {
    id v27 = 0;
  }
  else
  {
LABEL_13:
    uint64_t v28 = *v12;
    id v29 = self;
    sub_1000076AC(v28, v13);
    id v27 = sub_10000765C(v28, v13, v29);
    sub_10000736C(v28, v13);
  }
  uint64_t v30 = v38;
  sub_100007618(0, &qword_100029380);
  id v31 = (void *)sub_100016390();
  uint64_t v32 = swift_allocObject();
  *(void *)(v32 + 16) = v27;
  *(void *)(v32 + 24) = a1;
  aBlock[4] = sub_100007654;
  aBlock[5] = v32;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006EBC;
  aBlock[3] = &unk_100020CE0;
  id v33 = _Block_copy(aBlock);
  id v34 = v27;
  uint64_t v35 = a1;
  swift_release();
  sub_100016200();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100007524((unint64_t *)&qword_100029368, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100007328(&qword_100029370);
  sub_100007B28((unint64_t *)&qword_100029378, &qword_100029370);
  sub_100016440();
  sub_1000163A0();
  _Block_release(v33);

  (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v9, v40);
}

uint64_t sub_100006CA0(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_100016450();
    uint64_t v4 = v3;
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v2 = sub_100007A40(a1);
    uint64_t v4 = v6;
    uint64_t v5 = v7 & 1;
  }
  uint64_t v8 = sub_100007774(a1);
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  char v13 = sub_100007AC0(v2, v4, v5, v8, v9, v11 & 1);
  sub_100007AF4(v8, v10, v12);
  if (v13)
  {
    sub_100007AF4(v2, v4, v5);
    return 0;
  }
  else
  {
    sub_1000077C8(v2, v4, v5, a1);
    uint64_t v14 = v15;
    sub_100007AF4(v2, v4, v5);
  }
  return v14;
}

void sub_100006DA0(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_primaryMetadata);
  if (a1)
  {
    if (v2)
    {
      sub_100007328(&qword_1000296C0);
      unint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_100017F80;
      id v5 = objc_allocWithZone((Class)UIImageView);
      id v6 = a1;
      id v7 = v2;
      *(void *)(inited + 32) = [v5 initWithImage:v6];
      sub_1000162F0();
      sub_100008CB4(inited);
      swift_bridgeObjectRelease();
    }
  }
  else if (v2)
  {
    id v8 = v2;
    sub_100008CB4((unint64_t)&_swiftEmptyArrayStorage);
  }
}

uint64_t sub_100006EBC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100006F00(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_100006F6C(void *a1, char a2, char a3, char a4)
{
  uint64_t v6 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController;
  id v7 = *(void **)(v4
                + OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController);
  if (!v7)
  {
    __break(1u);
    goto LABEL_13;
  }
  [v7 setCanStartGroupActivities:1];
  char v11 = *(void **)(v4 + v6);
  if (!v11)
  {
LABEL_13:
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  [v11 setOrigin:0];
  char v12 = *(void **)(v4 + v6);
  if (*(unsigned char *)(v4 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_isEligibleForGroupSession) == 1)
  {
    if (v12)
    {
      [v12 setStartStagedActivity:*(unsigned __int8 *)(v4+ OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_startStagedActivity)];
      sub_10000E258(a1, a2 & 1, a3 & 1, a4 & 1, 0, 0);
      return;
    }
    goto LABEL_14;
  }
  if (!v12)
  {
LABEL_15:
    __break(1u);
    return;
  }

  [v12 presentSharePlaySharingController];
}

void sub_100007080()
{
  sub_1000072C8(v0 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_activeConversationUUID);
  sub_10000736C(*(void *)(v0 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_messagesGroupPhotoData), *(void *)(v0 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_messagesGroupPhotoData + 8));
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_imageLoadQueue);
}

id sub_1000070D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharePlayModeChiclet();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000716C()
{
  return type metadata accessor for SharePlayModeChiclet();
}

uint64_t type metadata accessor for SharePlayModeChiclet()
{
  uint64_t result = qword_100029328;
  if (!qword_100029328) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000071BC()
{
  sub_100007270();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100007270()
{
  if (!qword_100029338)
  {
    sub_100016130();
    unint64_t v0 = sub_1000163F0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100029338);
    }
  }
}

uint64_t sub_1000072C8(uint64_t a1)
{
  uint64_t v2 = sub_100007328(&qword_100029340);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007328(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000736C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100007380(a1, a2);
  }
  return a1;
}

uint64_t sub_100007380(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000073D8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007410(void *a1)
{
  return sub_100006090(a1, *(char **)(v1 + 16));
}

uint64_t sub_100007418(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100007428()
{
  return swift_release();
}

unint64_t sub_100007430()
{
  unint64_t result = qword_100029350;
  if (!qword_100029350)
  {
    sub_100007618(255, &qword_100029348);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029350);
  }
  return result;
}

unint64_t sub_100007490()
{
  unint64_t result = qword_100029360;
  if (!qword_100029360)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029360);
  }
  return result;
}

uint64_t sub_1000074DC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000751C()
{
  return sub_1000067A8(*(char **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100007524(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000756C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000075B4(void *a1)
{
  id v1 = [a1 messagesGroupPhotoData];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_100016120();

  return v3;
}

uint64_t sub_100007618(uint64_t a1, unint64_t *a2)
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

void sub_100007654()
{
  sub_100006DA0(*(void **)(v0 + 16), *(void *)(v0 + 24));
}

id sub_10000765C(uint64_t a1, uint64_t a2, void *a3)
{
  Class isa = sub_100016110().super.isa;
  id v5 = [a3 _gkImageWithCheckedData:isa];

  return v5;
}

uint64_t sub_1000076AC(uint64_t a1, unint64_t a2)
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

uint64_t sub_100007704(void *a1)
{
  id v2 = [a1 thumbnailImageData];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = sub_100016120();

  return v3;
}

uint64_t sub_100007774(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return sub_1000164B0();
  }
  else {
    return 1 << *(unsigned char *)(a1 + 32);
  }
}

void sub_1000077C8(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_1000164A0();
      sub_100007618(0, &qword_100029348);
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
  if (sub_100016470() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_100016480();
  sub_100007618(0, &qword_100029348);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_1000163D0(*(void *)(a4 + 40));
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
  char v10 = sub_1000163E0();

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
      char v13 = sub_1000163E0();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  uint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_100007A40(uint64_t a1)
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
  uint64_t v2 = 64;
  for (uint64_t i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_100007AC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if ((a3 & 1) == 0)
  {
    if ((a6 & 1) == 0)
    {
      if (a2 == a5) {
        return a1 == a4;
      }
      __break(1u);
    }
    goto LABEL_8;
  }
  if ((a6 & 1) == 0)
  {
LABEL_8:
    __break(1u);
    return static __CocoaSet.Index.== infix(_:_:)(a1, a2, a3, a4);
  }
  a3 = a4;
  a4 = a5;
  return static __CocoaSet.Index.== infix(_:_:)(a1, a2, a3, a4);
}

uint64_t sub_100007AF4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100007B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_100007B28(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000756C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100007B9C(id a1, char a2, uint64_t a3)
{
  uint64_t v4 = v3;
  if (a3) {
    objc_msgSend(a1, "setTransitioningDelegate:");
  }
  id v7 = [v4 navigationController];
  [v7 pushViewController:a1 animated:a2 & 1];
}

uint64_t View.GKFocusable(_:)()
{
  uint64_t v0 = sub_1000161D0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5[1] = &_swiftEmptyArrayStorage;
  sub_100007D78();
  sub_100007328(&qword_1000293A8);
  sub_100007DC8();
  sub_100016440();
  sub_1000161E0();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

unint64_t sub_100007D78()
{
  unint64_t result = qword_1000293A0;
  if (!qword_1000293A0)
  {
    sub_1000161D0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000293A0);
  }
  return result;
}

unint64_t sub_100007DC8()
{
  unint64_t result = qword_1000293B0;
  if (!qword_1000293B0)
  {
    sub_10000756C(&qword_1000293A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000293B0);
  }
  return result;
}

uint64_t sub_100007E1C()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_100007E60()
{
  sub_10000A12C();
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for ChicletMetadataShimView();
  return sub_10000A0EC((uint64_t)v8.super_class, "initWithFrame:", v1, v2, v3, v4, v5, v6, v8);
}

id sub_100007EC8(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ChicletMetadataShimView();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_100007F40()
{
  return sub_100009DEC(type metadata accessor for ChicletMetadataShimView);
}

uint64_t type metadata accessor for ChicletMetadataShimView()
{
  return self;
}

void *sub_100007FB0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint);
  id v2 = v1;
  return v1;
}

uint64_t sub_10000803C(uint64_t a1)
{
  return sub_10000A0BC(a1, OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint);
}

uint64_t sub_10000807C()
{
  return sub_10000A064();
}

void sub_1000080E4()
{
  sub_10000A0C8();
  swift_unknownObjectWeakAssign();
}

uint64_t sub_10000815C()
{
  return sub_10000A064();
}

void sub_1000081C4()
{
  sub_10000A0C8();
  swift_unknownObjectWeakAssign();
}

uint64_t sub_10000823C()
{
  return sub_10000A064();
}

void sub_1000082A4()
{
  sub_10000A0C8();
  swift_unknownObjectWeakAssign();
}

uint64_t sub_10000831C()
{
  return sub_10000A064();
}

void sub_100008384()
{
  sub_10000A0C8();
  swift_unknownObjectWeakAssign();
}

uint64_t sub_1000083FC()
{
  return sub_10000A064();
}

void sub_100008464()
{
  sub_10000A0C8();
  swift_unknownObjectWeakAssign();
}

uint64_t sub_1000084DC()
{
  return sub_10000A064();
}

void sub_100008544()
{
  sub_10000A0C8();
  swift_unknownObjectWeakAssign();
}

void *sub_1000085BC()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView);
  id v2 = v1;
  return v1;
}

uint64_t sub_100008648(uint64_t a1)
{
  return sub_10000A0BC(a1, OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView);
}

void sub_100008654()
{
  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for ChicletMetadata();
  objc_msgSendSuper2(&v20, "awakeFromNib");
  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
LABEL_12:
      __break(1u);
      goto LABEL_13;
    }
    id v2 = (void *)Strong;
    id v3 = [self preferredFontForTextStyle:UIFontTextStyleBody];
    id v4 = v3;
    objc_super v5 = "setFont:";
LABEL_7:
    sub_10000A0D4((uint64_t)v3, v5);

    uint64_t v11 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView;
    id v12 = *(void **)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView];
    if (v12)
    {
      char v13 = self;
      id v14 = v12;
      id v15 = [v13 _gkGameLayerContentVibrancyEffect];
      [v14 setEffect:v15];

      uint64_t v16 = *(void **)&v0[v11];
      if (v16)
      {
        uint64_t v17 = *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_visualEffectGroupName];
        uint64_t v18 = *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_visualEffectGroupName + 8];
        id v19 = v16;
        swift_bridgeObjectRetain();
        sub_10000DC20(v17, v18, v19);

        swift_bridgeObjectRelease();
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v6 = swift_unknownObjectWeakLoadStrong();
  if (!v6)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v7 = (void *)v6;
  id v8 = [self _preferredFontForTextStyle:UIFontTextStyleTitle1 variant:0x10000];
  sub_10000A0D4((uint64_t)v8, "setFont:");

  uint64_t v9 = swift_unknownObjectWeakLoadStrong();
  if (v9)
  {
    id v2 = (void *)v9;
    id v10 = [self whiteColor];
    id v4 = [v10 colorWithAlphaComponent:0.4];

    objc_super v5 = "setTextColor:";
    goto LABEL_7;
  }
LABEL_14:
  __break(1u);
}

void sub_1000088C8()
{
  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for ChicletMetadata();
  objc_msgSendSuper2(&v20, "layoutSubviews");
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_6;
  }
  id v2 = Strong;
  id v3 = [Strong layer];

  id v4 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  objc_super v5 = v4;
  [v4 frame];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v21.origin.x = v7;
  v21.origin.y = v9;
  v21.size.width = v11;
  v21.size.height = v13;
  [v3 setCornerRadius:CGRectGetHeight(v21) * 0.5];

  id v14 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v14)
  {
    id v15 = v14;
    id v16 = [v14 layer];

    id v17 = [self systemRedColor];
    id v18 = [v17 CGColor];

    sub_10000A0D4(v19, "setBackgroundColor:");
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_100008A84(uint64_t a1)
{
  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for ChicletMetadata();
  objc_msgSendSuper2(&v6, "traitCollectionDidChange:", a1);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (void *)Strong;
    id v5 = [self _preferredFontForTextStyle:UIFontTextStyleTitle1 variant:0x10000];
    [v4 setFont:v5];
  }
  else
  {
    __break(1u);
  }
}

void sub_100008BA0(char a1, char a2)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_12;
  }
  objc_super v6 = Strong;
  [Strong setHidden:a1 & 1];

  CGFloat v7 = *(void **)(v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView);
  if ((a1 & 1) != 0 || (a2 & 1) == 0)
  {
    if (v7)
    {
      id v11 = objc_allocWithZone((Class)UIVisualEffect);
      id v9 = v7;
      id v10 = [v11 init];
      goto LABEL_8;
    }
LABEL_13:
    __break(1u);
    return;
  }
  if (!v7)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  double v8 = self;
  id v9 = v7;
  id v10 = [v8 _gkGameLayerContentVibrancyEffect];
LABEL_8:
  id v12 = v10;
  objc_msgSend(v9, "setEffect:");
}

void *sub_100008CB4(unint64_t a1)
{
  unint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  id v3 = result;
  [result setHidden:0];

  sub_100008BA0(1, 0);
  unint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    id v4 = result;
    id v5 = [result arrangedSubviews];

    sub_100009F6C();
    unint64_t v6 = sub_1000162E0();

    if (v6 >> 62) {
      goto LABEL_27;
    }
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v7) {
      goto LABEL_5;
    }
    do
    {
LABEL_12:
      swift_bridgeObjectRelease();
      unint64_t v13 = a1;
      if (a1 >> 62)
      {
        swift_bridgeObjectRetain();
        unint64_t v6 = sub_100016530();
        if (!v6)
        {
LABEL_22:
          return (void *)swift_bridgeObjectRelease();
        }
      }
      else
      {
        unint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v6) {
          goto LABEL_22;
        }
      }
      uint64_t v14 = 4;
      while (1)
      {
        id v15 = (a1 & 0xC000000000000001) != 0 ? (id)sub_1000164E0() : *(id *)(v13 + 8 * v14);
        id v16 = v15;
        uint64_t v17 = v14 - 3;
        if (__OFADD__(v14 - 4, 1)) {
          break;
        }
        [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
        unint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
        if (!result) {
          goto LABEL_32;
        }
        id v18 = result;
        [result frame];
        double v20 = v19;

        [v16 intrinsicContentSize];
        double v22 = v21;
        [v16 intrinsicContentSize];
        double v24 = v20 * (v22 / v23);
        id v25 = [v16 heightAnchor];
        id v26 = [v25 constraintEqualToConstant:v20];

        [v26 setActive:1];
        id v27 = [v16 widthAnchor];
        id v28 = [v27 constraintEqualToConstant:v24];

        [v28 setActive:1];
        unint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
        if (!result) {
          goto LABEL_33;
        }
        id v29 = result;
        [result addArrangedSubview:v16];

        ++v14;
        unint64_t v13 = a1;
        if (v17 == v6) {
          goto LABEL_22;
        }
      }
LABEL_26:
      __break(1u);
LABEL_27:
      swift_bridgeObjectRetain();
      uint64_t v7 = sub_100016530();
      swift_bridgeObjectRelease();
    }
    while (!v7);
LABEL_5:
    uint64_t v8 = 4;
    while (1)
    {
      if ((v6 & 0xC000000000000001) != 0) {
        id v9 = (id)sub_1000164E0();
      }
      else {
        id v9 = *(id *)(v6 + 8 * v8);
      }
      id v10 = v9;
      uint64_t v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1))
      {
        __break(1u);
        goto LABEL_26;
      }
      unint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
      if (!result) {
        break;
      }
      id v12 = result;
      [result removeArrangedSubview:v10];

      [v10 removeFromSuperview];
      ++v8;
      if (v11 == v7) {
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
LABEL_35:
  __break(1u);
  return result;
}

void sub_10000903C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v11 = Strong;
  [Strong setHidden:1];

  id v12 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v12)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v13 = v12;
  [v12 setHidden:1];

  sub_100008BA0(0, 1);
  uint64_t v14 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v14)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v15 = v14;
  sub_10000DBC8(a1, a2, v14);

  uint64_t v16 = swift_unknownObjectWeakLoadStrong();
  if (!v16)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t v17 = (void *)v16;
  sub_10000A018();
  uint64_t v18 = sub_100016420();
  sub_1000157A8(v18, v19, v17);

  double v20 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v20)
  {
    double v21 = v20;
    sub_10000DBC8(a5, a6, v20);

    sub_1000097E8(0, 0);
    return;
  }
LABEL_11:
  __break(1u);
}

void sub_1000091BC(char *a1)
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  id v4 = (void *)Strong;
  id v5 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v5)
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  unint64_t v6 = v5;
  id v7 = [v5 isHidden];

  [v4 setHidden:v7];
  uint64_t v8 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v8)
  {
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  id v9 = v8;
  unsigned int v10 = [v8 isHidden];

  if (v10)
  {
    sub_100008BA0(1, 0);
  }
  else
  {
    sub_100008BA0(0, 0);
    uint64_t v11 = *(char **)((char *)v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView);
    if (!v11)
    {
LABEL_81:
      __break(1u);
      goto LABEL_82;
    }
    id v12 = *(void **)&a1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView];
    if (!v12)
    {
LABEL_82:
      __break(1u);
      return;
    }
    id v13 = v11;
    id v14 = [v12 effect];
    [v13 setEffect:v14];
  }
  uint64_t v15 = swift_unknownObjectWeakLoadStrong();
  if (!v15) {
    goto LABEL_68;
  }
  uint64_t v16 = (void *)v15;
  uint64_t v17 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v17)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  uint64_t v18 = v17;
  id v19 = [v17 isHidden];

  [v16 setHidden:v19];
  uint64_t v20 = swift_unknownObjectWeakLoadStrong();
  if (!v20)
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  double v21 = (void *)v20;
  double v22 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v22)
  {
LABEL_71:
    __break(1u);
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  sub_100009FAC(v22, (SEL *)&selRef_text);
  if (v23)
  {
    NSString v24 = sub_100016250();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v24 = 0;
  }
  [v21 setText:v24];

  uint64_t v25 = swift_unknownObjectWeakLoadStrong();
  if (!v25) {
    goto LABEL_72;
  }
  id v26 = (void *)v25;
  id v27 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v27)
  {
LABEL_73:
    __break(1u);
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  sub_100009FAC(v27, (SEL *)&selRef_text);
  if (v28)
  {
    NSString v29 = sub_100016250();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v29 = 0;
  }
  sub_10000A110();

  uint64_t v30 = swift_unknownObjectWeakLoadStrong();
  if (!v30) {
    goto LABEL_74;
  }
  id v31 = (void *)v30;
  uint64_t v32 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v32)
  {
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  sub_100009FAC(v32, (SEL *)&selRef_text);
  if (v33)
  {
    NSString v34 = sub_100016250();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v34 = 0;
  }
  sub_10000A110();

  uint64_t v35 = swift_unknownObjectWeakLoadStrong();
  if (!v35) {
    goto LABEL_76;
  }
  v36 = (void *)v35;
  uint64_t v37 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v37)
  {
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  sub_100009FAC(v37, (SEL *)&selRef_text);
  if (v38)
  {
    NSString v39 = sub_100016250();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v39 = 0;
  }
  sub_10000A110();

  uint64_t v40 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v40) {
    goto LABEL_78;
  }
  uint64_t v41 = v40;
  v72 = a1;
  id v42 = [v40 arrangedSubviews];

  sub_100009F6C();
  unint64_t v43 = sub_1000162E0();

  v73 = v1;
  if (v43 >> 62) {
    goto LABEL_59;
  }
  uint64_t v44 = *(void *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v45 = v1;
  swift_bridgeObjectRetain();
  while (1)
  {
    uint64_t v1 = &selRef_multiplayerP2PViewController_didFinishWithError_;
    if (v44)
    {
      uint64_t v46 = 4;
      while (1)
      {
        if ((v43 & 0xC000000000000001) != 0) {
          id v47 = (id)sub_1000164E0();
        }
        else {
          id v47 = *(id *)(v43 + 8 * v46);
        }
        long long v48 = v47;
        uint64_t v49 = v46 - 3;
        if (__OFADD__(v46 - 4, 1))
        {
          __break(1u);
          goto LABEL_58;
        }
        uint64_t v50 = (void *)swift_unknownObjectWeakLoadStrong();
        if (!v50) {
          break;
        }
        uint64_t v51 = v50;
        [v50 removeArrangedSubview:v48];

        [v48 removeFromSuperview];
        ++v46;
        if (v49 == v44) {
          goto LABEL_42;
        }
      }
      __break(1u);
LABEL_63:
      __break(1u);
LABEL_64:
      __break(1u);
      goto LABEL_65;
    }
LABEL_42:

    swift_bridgeObjectRelease_n();
    uint64_t v52 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v52) {
      goto LABEL_79;
    }
    uint64_t v53 = v52;
    id v54 = [v52 arrangedSubviews];

    unint64_t v55 = sub_1000162E0();
    if (v55 >> 62) {
      break;
    }
    unint64_t v43 = *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10);
    v56 = v73;
    id v57 = v72;
    swift_bridgeObjectRetain();
    if (!v43) {
      goto LABEL_53;
    }
LABEL_45:
    uint64_t v58 = 4;
    while (1)
    {
      id v59 = (v55 & 0xC000000000000001) != 0 ? (id)sub_1000164E0() : *(id *)(v55 + 8 * v58);
      v60 = v59;
      uint64_t v61 = v58 - 3;
      if (__OFADD__(v58 - 4, 1)) {
        break;
      }
      v62 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v62) {
        goto LABEL_63;
      }
      v63 = v62;
      [v62 removeArrangedSubview:v60];

      [v60 removeFromSuperview];
      v64 = (void *)swift_unknownObjectWeakLoadStrong();
      if (!v64) {
        goto LABEL_64;
      }
      v65 = v64;
      [v64 addArrangedSubview:v60];

      ++v58;
      if (v61 == v43) {
        goto LABEL_53;
      }
    }
LABEL_58:
    __break(1u);
LABEL_59:
    v69 = v1;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_100016530();
  }
  v70 = v73;
  id v71 = v72;
  swift_bridgeObjectRetain();
  unint64_t v43 = sub_100016530();
  if (v43) {
    goto LABEL_45;
  }
LABEL_53:

  swift_bridgeObjectRelease_n();
  v66 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v66) {
    goto LABEL_80;
  }
  uint64_t v67 = sub_100009FAC(v66, (SEL *)&selRef_accessibilityLabel);
  sub_1000097E8(v67, v68);

  swift_bridgeObjectRelease();
}

void sub_1000097E8(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    unint64_t v3 = a2;
  }
  else
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (!Strong)
    {
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
    id v5 = Strong;
    a1 = (uint64_t)[Strong attributedText];

    if (a1)
    {
      id v6 = [(id)a1 string];

      a1 = sub_100016270();
      unint64_t v3 = v7;
    }
    else
    {
      unint64_t v3 = 0xE000000000000000;
    }
  }
  if ((v3 & 0x2000000000000000) != 0) {
    uint64_t v8 = HIBYTE(v3) & 0xF;
  }
  else {
    uint64_t v8 = a1 & 0xFFFFFFFFFFFFLL;
  }
  swift_bridgeObjectRetain();
  if (!v8)
  {
    swift_bridgeObjectRelease();
    id v9 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v9)
    {
LABEL_45:
      __break(1u);
      return;
    }
    uint64_t v10 = sub_100009FAC(v9, (SEL *)&selRef_text);
    if (v11) {
      a1 = v10;
    }
    else {
      a1 = 0;
    }
    if (v11) {
      unint64_t v3 = v11;
    }
    else {
      unint64_t v3 = 0xE000000000000000;
    }
  }
  id v12 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v12)
  {
    __break(1u);
    goto LABEL_38;
  }
  id v13 = v12;
  sub_100009F08(a1, v3, v12);

  uint64_t v14 = swift_unknownObjectWeakLoadStrong();
  if (!v14)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  uint64_t v15 = (void *)v14;
  uint64_t v16 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v16)
  {
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v17 = sub_100009FAC(v16, (SEL *)&selRef_text);
  if (v18)
  {
    NSString v19 = sub_100016250();
    uint64_t v17 = swift_bridgeObjectRelease();
  }
  else
  {
    NSString v19 = 0;
  }
  sub_10000A0D4(v17, "setAccessibilityLabel:");

  uint64_t v20 = swift_unknownObjectWeakLoadStrong();
  if (!v20) {
    goto LABEL_40;
  }
  double v21 = (void *)v20;
  double v22 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v22)
  {
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  uint64_t v23 = sub_100009FAC(v22, (SEL *)&selRef_text);
  if (v24)
  {
    NSString v25 = sub_100016250();
    uint64_t v23 = swift_bridgeObjectRelease();
  }
  else
  {
    NSString v25 = 0;
  }
  sub_10000A0D4(v23, "setAccessibilityLabel:");

  uint64_t v26 = swift_unknownObjectWeakLoadStrong();
  if (!v26) {
    goto LABEL_42;
  }
  id v27 = (void *)v26;
  uint64_t v28 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v28)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  sub_100009FAC(v28, (SEL *)&selRef_text);
  if (v29)
  {
    NSString v30 = sub_100016250();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v30 = 0;
  }
  [v27 setAccessibilityLabel:v30];
}

uint64_t sub_100009ABC()
{
  return sub_100009B48();
}

uint64_t sub_100009AFC()
{
  return sub_100009B48();
}

uint64_t sub_100009B3C()
{
  return sub_100009B48();
}

uint64_t sub_100009B48()
{
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (!result) {
    __break(1u);
  }
  return result;
}

id sub_100009B70()
{
  sub_10000A12C();
  *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint] = 0;
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView] = 0;
  v8.receiver = v0;
  v8.super_class = (Class)sub_10000A084(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_visualEffectGroupName);
  return sub_10000A0EC((uint64_t)v8.super_class, "initWithFrame:", v1, v2, v3, v4, v5, v6, v8);
}

id sub_100009C40(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint] = 0;
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  *(void *)&v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_vibrancyView] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)sub_10000A084(OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_visualEffectGroupName);
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

uint64_t sub_100009D20()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension15ChicletMetadata_subtitleToBadgeTrailingConstraint));
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();

  return swift_bridgeObjectRelease();
}

id sub_100009DD4()
{
  return sub_100009DEC(type metadata accessor for ChicletMetadata);
}

id sub_100009DEC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for ChicletMetadata()
{
  return self;
}

void sub_100009F08(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100016250();
  swift_bridgeObjectRelease();
  [a3 setAccessibilityLabel:v4];
}

unint64_t sub_100009F6C()
{
  unint64_t result = qword_100029450;
  if (!qword_100029450)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100029450);
  }
  return result;
}

uint64_t sub_100009FAC(void *a1, SEL *a2)
{
  id v3 = [a1 *a2];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = sub_100016270();

  return v4;
}

unint64_t sub_10000A018()
{
  unint64_t result = qword_100029458;
  if (!qword_100029458)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029458);
  }
  return result;
}

uint64_t sub_10000A064()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_10000A06C()
{
  return swift_unknownObjectWeakInit();
}

uint64_t sub_10000A084@<X0>(uint64_t a1@<X8>)
{
  id v3 = (char *)(v1 + a1);
  strcpy(v3, "gameLayerGroup");
  v3[15] = -18;
  return type metadata accessor for ChicletMetadata();
}

uint64_t sub_10000A0BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return _objc_release_x1();
}

id sub_10000A0D4(uint64_t a1, const char *a2)
{
  return objc_msgSend(v2, a2, v3);
}

id sub_10000A0EC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2, v13, v12, v11, v10);
}

id sub_10000A110()
{
  uint64_t v4 = *(const char **)(v0 + 640);
  return objc_msgSend(v1, v4, v2);
}

id sub_10000A140(void *a1)
{
  id v1 = a1;
  sub_10000DF1C(v1);
  id v3 = v2;
  uint64_t v4 = sub_100016290();
  sub_10000E6B0(v4, v5);
  uint64_t v6 = sub_100016290();
  sub_10000E6BC(v6, v7);
  sub_10000E6D0(0x322E6E6F73726570, 0xED00006C6C69662ELL);

  return v3;
}

void sub_10000A1E4(void *a1, char a2, char a3, char a4)
{
  uint64_t v6 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController;
  uint64_t v7 = *(void **)(v4
                + OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController);
  if (!v7)
  {
    __break(1u);
    goto LABEL_7;
  }
  [v7 setCanStartGroupActivities:0];
  double v11 = *(void **)(v4 + v6);
  if (!v11)
  {
LABEL_7:
    __break(1u);
    return;
  }
  [v11 setOrigin:1];

  sub_10000E258(a1, a2 & 1, a3 & 1, a4 & 1, 0, 0);
}

id sub_10000A28C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InviteFriendsModeChiclet();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for InviteFriendsModeChiclet()
{
  return self;
}

uint64_t sub_10000A2E4(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_metadataViews);
  swift_beginAccess();
  *id v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000A338(uint64_t a1)
{
  return sub_10000A0BC(a1, OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_chiclet);
}

id sub_10000A344(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = [a1 imageWithRenderingMode:2];
    id v4 = [objc_allocWithZone((Class)UIImageView) initWithImage:v3];
    [v4 setTintColor:a2];
    id v5 = v4;
    [v5 setContentMode:4];

    return v5;
  }
  else
  {
    id v7 = objc_allocWithZone((Class)UIImageView);
    return [v7 init];
  }
}

void sub_10000A414(double a1)
{
  objc_super v2 = v1;
  id v4 = (void *)((char *)v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_metadataViews);
  swift_beginAccess();
  if ((unint64_t)*v4 >> 62)
  {
    sub_10000DE74();
    uint64_t v5 = sub_100016530();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v5 < 1)
  {
    uint64_t v18 = *(void **)((char *)v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_chiclet);
    if (!v18) {
      goto LABEL_24;
    }
    id v16 = v18;
    sub_10000BC24();
    goto LABEL_23;
  }
  uint64_t v6 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_currentMetadataIndex;
  if ((*(void *)((char *)v2
                  + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_currentMetadataIndex) & 0x8000000000000000) != 0)
  {
    *(void *)((char *)v2
              + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_currentMetadataIndex) = 0;
    NSString v19 = *(void **)((char *)v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_chiclet);
    if (!v19) {
      goto LABEL_24;
    }
    uint64_t v20 = *v4;
    sub_100015780(0, (v20 & 0xC000000000000001) == 0, v20);
    if ((v20 & 0xC000000000000001) == 0)
    {
      double v21 = *(void **)(v20 + 32);
      id v16 = v19;
      id v17 = v21;
      goto LABEL_21;
    }
    id v16 = v19;
    swift_bridgeObjectRetain();
LABEL_33:
    double v22 = (void *)sub_1000164E0();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  if ((unint64_t)*v4 >> 62)
  {
    sub_10000DE74();
    uint64_t v7 = sub_100016530();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v7 >= 2)
  {
    uint64_t v8 = *(void *)((char *)v2 + v6);
    BOOL v9 = __OFADD__(v8, 1);
    uint64_t v10 = v8 + 1;
    if (v9)
    {
      __break(1u);
    }
    else
    {
      *(void *)((char *)v2 + v6) = v10;
      if (!((unint64_t)*v4 >> 62))
      {
        uint64_t v11 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
        goto LABEL_11;
      }
    }
    uint64_t v23 = v10;
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100016530();
    swift_bridgeObjectRelease();
    uint64_t v10 = v23;
LABEL_11:
    if (v10 >= v11) {
      *(void *)((char *)v2 + v6) = 0;
    }
    double v12 = *(void **)((char *)v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_chiclet);
    if (v12)
    {
      uint64_t v13 = *(void *)((char *)v2 + v6);
      uint64_t v14 = *v4;
      sub_100015780(v13, (v14 & 0xC000000000000001) == 0, v14);
      if ((v14 & 0xC000000000000001) == 0)
      {
        uint64_t v15 = *(void **)(v14 + 8 * v13 + 32);
        id v16 = v12;
        id v17 = v15;
LABEL_21:
        double v22 = v17;
LABEL_22:
        sub_10000BD60(v22, a1);

LABEL_23:
        goto LABEL_24;
      }
      id v16 = v12;
      swift_bridgeObjectRetain();
      goto LABEL_33;
    }
  }
LABEL_24:
  if (*((unsigned char *)v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_reloadRequested) == 1)
  {
    *((unsigned char *)v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_reloadRequested) = 0;
    (*(void (**)(void))((swift_isaMask & *v2) + 0xF8))(0);
  }
}

uint64_t sub_10000A6C0()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_metadataViews);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return sub_10000A2E4((uint64_t)&_swiftEmptyArrayStorage);
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_100016530();
  uint64_t v3 = result;
  if (!result) {
    goto LABEL_15;
  }
LABEL_3:
  uint64_t v5 = *(uint64_t (**)(void))((swift_isaMask & *v12) + 0x130);
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0) {
        uint64_t v7 = (char *)sub_1000164E0();
      }
      else {
        uint64_t v7 = (char *)*(id *)(v2 + 8 * i + 32);
      }
      uint64_t v8 = v7;
      uint64_t v9 = v5();
      if (v9)
      {
        uint64_t v10 = (void *)v9;
        sub_1000091BC(v8);
        id v11 = v10;
        sub_1000162C0();
        if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100016300();
        }
        sub_100016310();
        sub_1000162F0();
        [v8 removeFromSuperview];
      }
    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void sub_10000A8AC()
{
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = sub_100016250();
  id v3 = [v1 loadNibNamed:v2 owner:0 options:0];

  if (v3)
  {
    uint64_t v4 = sub_1000162E0();

    if (*(void *)(v4 + 16))
    {
      sub_10000D918(v4 + 32, (uint64_t)v5);
      swift_bridgeObjectRelease();

      type metadata accessor for ChicletMetadata();
      sub_10000DDDC();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
  }
}

id sub_10000A9C8()
{
  sub_10000A12C();
  v8.receiver = v0;
  v8.super_class = (Class)type metadata accessor for DashboardCollectionViewCell();
  return sub_10000A0EC((uint64_t)v8.super_class, "initWithFrame:", v1, v2, v3, v4, v5, v6, v8);
}

id sub_10000AA30(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DashboardCollectionViewCell();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_10000AAA8()
{
  return sub_10000D8AC(type metadata accessor for DashboardCollectionViewCell);
}

uint64_t type metadata accessor for DashboardCollectionViewCell()
{
  return self;
}

uint64_t sub_10000AAE4()
{
  uint64_t result = GKIsXRUIIdiomShouldUsePadUI();
  double v1 = 14.0;
  if (result) {
    double v1 = 16.0;
  }
  qword_100029A38 = *(void *)&v1;
  return result;
}

uint64_t sub_10000AB48()
{
  return sub_10000A064();
}

void sub_10000ABB0()
{
  sub_10000A0C8();
  swift_unknownObjectWeakAssign();
}

uint64_t sub_10000AC28()
{
  return sub_10000A064();
}

void sub_10000AC90()
{
  sub_10000A0C8();
  swift_unknownObjectWeakAssign();
}

uint64_t sub_10000AD08()
{
  return sub_10000A064();
}

void sub_10000AD70()
{
  sub_10000A0C8();
  swift_unknownObjectWeakAssign();
}

uint64_t sub_10000ADE8()
{
  return sub_10000A064();
}

void sub_10000AE50()
{
  sub_10000A0C8();
  swift_unknownObjectWeakAssign();
}

uint64_t sub_10000AE94(uint64_t a1)
{
  return sub_10000A0BC(a1, OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectView);
}

uint64_t sub_10000AEA0(uint64_t a1)
{
  return sub_10000A0BC(a1, OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView);
}

void sub_10000AEAC()
{
  v59.receiver = v0;
  v59.super_class = (Class)type metadata accessor for ChicletCell();
  objc_msgSendSuper2(&v59, "awakeFromNib");
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v2 = (void *)Strong;
  id v3 = [self _gkPreferredFontForTextStyle:UIFontTextStyleBody symbolicTraits:2];
  [v2 setFont:v3];

  id v4 = [objc_allocWithZone((Class)UIVisualEffectView) init];
  sub_100007618(0, &qword_100029850);
  Class isa = sub_1000162D0().super.isa;
  [v4 setBackgroundEffects:isa];

  uint64_t v6 = *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName];
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName + 8];
  swift_bridgeObjectRetain();
  sub_10000DC20(v6, v7, v4);
  swift_bridgeObjectRelease();
  id v8 = v4;
  sub_10000AE94((uint64_t)v4);
  id v9 = [v0 contentView];
  [v9 insertSubview:v8 atIndex:0];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v10 = [v8 leadingAnchor];
  id v11 = sub_10000DDC0();
  id v12 = [v11 leadingAnchor];

  id v13 = sub_10000DDA4();
  sub_10000DD88();

  id v14 = [v8 trailingAnchor];
  id v15 = sub_10000DDC0();
  id v16 = [v15 trailingAnchor];

  id v17 = sub_10000DDA4();
  sub_10000DD88();

  id v18 = [v8 topAnchor];
  id v19 = sub_10000DDC0();
  id v20 = [v19 topAnchor];

  id v21 = sub_10000DDA4();
  sub_10000DD88();

  id v22 = [v8 bottomAnchor];
  id v23 = sub_10000DDC0();
  id v24 = [v23 bottomAnchor];

  id v25 = sub_10000DDA4();
  sub_10000DD88();

  id v26 = [v8 layer];
  if (qword_100029210 != -1) {
    swift_once();
  }
  [v26 setCornerRadius:*(double *)&qword_100029A38];

  id v27 = [v8 layer];
  [v27 setCornerCurve:kCACornerCurveContinuous];

  id v28 = [v8 layer];
  [v28 setMasksToBounds:1];

  id v29 = [objc_allocWithZone((Class)UIVisualEffect) init];
  id v30 = [objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:v29];

  sub_10000AEA0((uint64_t)v30);
  id v31 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v31) {
    goto LABEL_17;
  }
  uint64_t v32 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView;
  if (!*(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView])
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v33 = v31;
  objc_msgSend(v31, "addSubview:");

  NSString v34 = *(void **)&v0[v32];
  if (!v34)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  [v34 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v35 = *(void **)&v0[v32];
  if (!v35)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v36 = [v35 leadingAnchor];
  uint64_t v37 = (void *)sub_10000DE94();
  if (!v37)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v38 = v37;
  id v39 = [v37 leadingAnchor];

  id v40 = sub_10000DE54();
  sub_10000DE00();

  uint64_t v41 = *(void **)&v0[v32];
  if (!v41)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v42 = [v41 trailingAnchor];
  unint64_t v43 = (void *)sub_10000DE94();
  if (!v43)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v44 = v43;
  id v45 = [v43 trailingAnchor];

  id v46 = [v33 constraintEqualToAnchor:v45 constant:15.0];
  sub_10000DE00();

  id v47 = *(void **)&v0[v32];
  if (!v47)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v48 = [v47 topAnchor];
  uint64_t v49 = (void *)sub_10000DE94();
  if (!v49)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v50 = v49;
  id v51 = [v49 topAnchor];

  id v52 = sub_10000DE54();
  sub_10000DE00();

  uint64_t v53 = *(void **)&v0[v32];
  if (!v53)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  id v54 = [v53 bottomAnchor];
  unint64_t v55 = (void *)sub_10000DE94();
  if (v55)
  {
    v56 = v55;
    id v57 = [v55 bottomAnchor];

    id v58 = [v33 constraintEqualToAnchor:v57 constant:15.0];
    [v58 setActive:1];

    [v0 _gkDisableDefaultFocusEffect];
    return;
  }
LABEL_27:
  __break(1u);
}

void sub_10000B580(uint64_t a1)
{
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for ChicletCell();
  objc_msgSendSuper2(&v12, "traitCollectionDidChange:", a1);
  id v3 = [v1 traitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  LOBYTE(v3) = sub_1000163C0();
  if ((v3 & 1) == 0)
  {
    id v5 = [v1 traitCollection];
    id v6 = [v5 horizontalSizeClass];

    if (v6 == (id)1
      && (id v7 = [v1 traitCollection],
          id v8 = [v7 verticalSizeClass],
          v7,
          v8 == (id)2))
    {
      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        id v10 = Strong;
        [Strong setTextAlignment:0];
LABEL_8:

        return;
      }
    }
    else
    {
      id v11 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v11)
      {
        id v10 = v11;
        [v11 setTextAlignment:1];
        goto LABEL_8;
      }
      __break(1u);
    }
    __break(1u);
  }
}

void sub_10000B748(uint64_t a1, uint64_t a2, id a3)
{
  [a3 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v6 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView;
  id v7 = *(void **)(v3 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView);
  if (!v7) {
    goto LABEL_29;
  }
  id v8 = [v7 contentView];
  id v9 = [v8 subviews];

  sub_100007618(0, (unint64_t *)&qword_100029450);
  unint64_t v10 = sub_1000162E0();

  uint64_t v51 = a2;
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100016530();
    if (!v11) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v11) {
      goto LABEL_10;
    }
  }
  if (v11 < 1)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  for (uint64_t i = 0; i != v11; ++i)
  {
    if ((v10 & 0xC000000000000001) != 0) {
      id v13 = (id)sub_1000164E0();
    }
    else {
      id v13 = *(id *)(v10 + 8 * i + 32);
    }
    id v14 = v13;
    [v13 removeFromSuperview];
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  id v15 = *(void **)(v3 + v6);
  if (!v15)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  id v16 = [v15 contentView];
  [v16 addSubview:a3];

  id v17 = *(void **)(v3 + v6);
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrantIcon))
  {
    if (!v17)
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    id v18 = self;
    id v19 = v17;
    id v20 = [v18 _gkGameLayerContentVibrancyEffect];
  }
  else
  {
    if (!v17)
    {
LABEL_39:
      __break(1u);
      return;
    }
    id v21 = objc_allocWithZone((Class)UIVisualEffect);
    id v19 = v17;
    id v20 = [v21 init];
  }
  id v22 = v20;
  [v19 setEffect:v20];

  id v23 = *(void **)(v3 + v6);
  if (!v23) {
    goto LABEL_31;
  }
  uint64_t v24 = *(void *)(v3 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName);
  uint64_t v25 = *(void *)(v3 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName + 8);
  swift_bridgeObjectRetain();
  id v26 = v23;
  sub_10000DC20(v24, v25, v26);

  swift_bridgeObjectRelease();
  id v27 = [a3 centerXAnchor];
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  id v29 = Strong;
  id v30 = [Strong centerXAnchor];

  id v31 = sub_10000DE1C();
  sub_10000DE38();

  id v32 = [a3 centerYAnchor];
  uint64_t v33 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v33)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  NSString v34 = v33;
  id v35 = [v33 centerYAnchor];

  id v36 = sub_10000DE1C();
  sub_10000DE38();

  id v37 = [a3 heightAnchor];
  uint64_t v38 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v38)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  id v39 = v38;
  id v40 = [v38 heightAnchor];

  id v41 = sub_10000DE1C();
  sub_10000DE38();

  id v42 = [a3 widthAnchor];
  unint64_t v43 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v43)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  uint64_t v44 = v43;
  id v45 = [v43 widthAnchor];

  id v46 = [v42 constraintEqualToAnchor:v45];
  [v46 setActive:1];

  sub_10000BC24();
  id v47 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v47)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  id v48 = v47;
  sub_10000DBC8(a1, v51, v47);

  uint64_t v49 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v49)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  id v50 = v49;
  sub_10000DC78(a1, v51, v49);
}

void sub_10000BC24()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    goto LABEL_16;
  }
  double v1 = Strong;
  id v2 = [Strong subviews];

  sub_100007618(0, (unint64_t *)&qword_100029450);
  unint64_t v3 = sub_1000162E0();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100016530();
    swift_bridgeObjectRelease();
    if (v4) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4)
    {
LABEL_4:
      if (v4 >= 1)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if ((v3 & 0xC000000000000001) != 0) {
            id v6 = (id)sub_1000164E0();
          }
          else {
            id v6 = *(id *)(v3 + 8 * i + 32);
          }
          id v7 = v6;
          [v6 removeFromSuperview];
        }
        goto LABEL_10;
      }
      __break(1u);
LABEL_16:
      __break(1u);
      return;
    }
  }
LABEL_10:

  swift_bridgeObjectRelease();
}

id sub_10000BD60(void *a1, double a2)
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  *(void *)(v5 + 24) = a1;
  *(double *)(v5 + 32) = a2;
  id v6 = v2;
  id v7 = a1;
  sub_10000C0C8((uint64_t)sub_10000DBBC, v5, a2);
  swift_release();

  return [v6 accessibilityPresentMetadata];
}

void sub_10000BE04(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_8;
  }
  id v7 = Strong;
  [Strong addSubview:a4];

  [a4 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v8 = [a4 topAnchor];
  id v9 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v9)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  unint64_t v10 = v9;
  id v11 = [v9 topAnchor];

  id v12 = [v8 constraintLessThanOrEqualToAnchor:v11];
  [v12 setActive:1];

  id v13 = [a4 bottomAnchor];
  id v14 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v14)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  id v15 = v14;
  id v16 = [v14 bottomAnchor];

  id v17 = [v13 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  id v18 = [a4 leftAnchor];
  id v19 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v19)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v20 = v19;
  id v21 = [v19 leftAnchor];

  id v22 = [v18 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  id v23 = [a4 rightAnchor];
  uint64_t v24 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v24)
  {
    uint64_t v25 = v24;
    id v26 = [v24 rightAnchor];

    id v27 = [v23 constraintEqualToAnchor:v26];
    [v27 setActive:1];

    sub_10000C5A8(a4, 1, (uint64_t)nullsub_2, 0, a1);
    return;
  }
LABEL_11:
  __break(1u);
}

void *sub_10000C0C8(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  uint64_t v4 = sub_1000161F0();
  sub_10000DD44();
  uint64_t v44 = v5;
  ((void (*)(void))__chkstk_darwin)();
  id v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016210();
  sub_10000DD44();
  uint64_t v42 = v9;
  uint64_t v43 = v8;
  ((void (*)(void))__chkstk_darwin)();
  id v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016230();
  sub_10000DD44();
  uint64_t v40 = v13;
  uint64_t v41 = v12;
  uint64_t v14 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  id v18 = (char *)&v39 - v17;
  uint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (!result)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    return result;
  }
  id v20 = result;
  id v21 = [result subviews];

  sub_100007618(0, (unint64_t *)&qword_100029450);
  unint64_t v22 = sub_1000162E0();

  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_100016530();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v23 < 1)
  {
    sub_100007618(0, &qword_100029380);
    uint64_t v33 = (void *)sub_100016390();
    sub_100016220();
    sub_100016240();
    uint64_t v40 = *(void *)(v40 + 8);
    NSString v34 = v16;
    uint64_t v35 = v41;
    ((void (*)(char *, uint64_t))v40)(v34, v41);
    uint64_t v36 = swift_allocObject();
    uint64_t v37 = v46;
    *(void *)(v36 + 16) = v45;
    *(void *)(v36 + 24) = v37;
    aBlock[4] = sub_10000DA30;
    aBlock[5] = v36;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006EBC;
    aBlock[3] = &unk_100020DD0;
    uint64_t v38 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_100016200();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_10000DA5C();
    sub_100007328(&qword_100029370);
    sub_10000DAAC();
    sub_100016440();
    sub_100016370();
    _Block_release(v38);

    (*(void (**)(char *, uint64_t))(v44 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v42 + 8))(v11, v43);
    return (void *)((uint64_t (*)(char *, uint64_t))v40)(v18, v35);
  }
  uint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (!result) {
    goto LABEL_15;
  }
  uint64_t v24 = result;
  id v25 = [result subviews];

  uint64_t v26 = sub_1000162E0();
  sub_100015780(0, (v26 & 0xC000000000000001) == 0, v26);
  if ((v26 & 0xC000000000000001) != 0) {
    id v27 = (id)sub_1000164E0();
  }
  else {
    id v27 = *(id *)(v26 + 32);
  }
  id v28 = v27;
  swift_bridgeObjectRelease();
  id v29 = (void *)swift_allocObject();
  uint64_t v30 = v45;
  uint64_t v31 = v46;
  v29[2] = v28;
  v29[3] = v30;
  v29[4] = v31;
  id v32 = v28;
  swift_retain();
  sub_10000C5A8(v32, 0, (uint64_t)sub_10000DB40, (uint64_t)v29, a3);

  return (void *)swift_release();
}

void sub_10000C5A8(id a1, char a2, uint64_t a3, uint64_t a4, double a5)
{
  if (a2)
  {
    id v10 = [a1 layer];
    [v10 setOpacity:0.0];

    id v11 = [a1 layer];
    CGAffineTransformMakeScale(&v18, 0.9, 0.9);
    [v11 setAffineTransform:&v18];
  }
  uint64_t v12 = self;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a1;
  *(unsigned char *)(v13 + 24) = a2 & 1;
  *(void *)&v18.tx = sub_10000D9AC;
  *(void *)&v18.ty = v13;
  *(void *)&v18.a = _NSConcreteStackBlock;
  *(void *)&v18.b = 1107296256;
  *(void *)&v18.c = sub_100006EBC;
  *(void *)&v18.d = &unk_100020D30;
  uint64_t v14 = _Block_copy(&v18);
  id v15 = a1;
  swift_release();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = a3;
  *(void *)(v16 + 24) = a4;
  *(void *)&v18.tx = sub_10000DA08;
  *(void *)&v18.ty = v16;
  *(void *)&v18.a = _NSConcreteStackBlock;
  *(void *)&v18.b = 1107296256;
  *(void *)&v18.c = sub_10000C8C8;
  *(void *)&v18.d = &unk_100020D80;
  uint64_t v17 = _Block_copy(&v18);
  swift_retain();
  swift_release();
  [v12 animateWithDuration:0 delay:v14 options:v17 animations:0.15 completion:a5];
  _Block_release(v17);
  _Block_release(v14);
}

void sub_10000C7E4(void *a1, char a2)
{
  id v4 = [a1 layer];
  uint64_t v5 = v4;
  int v6 = a2 & 1;
  double v7 = 0.0;
  if (a2) {
    *(float *)&double v7 = 1.0;
  }
  [v4 setOpacity:v7];

  id v8 = [a1 layer];
  if (v6)
  {
    long long v9 = xmmword_1000180F0;
    long long v10 = xmmword_100018100;
    long long v11 = 0uLL;
  }
  else
  {
    CGAffineTransformMakeScale(&v12, 0.9, 0.9);
    long long v10 = *(_OWORD *)&v12.a;
    long long v9 = *(_OWORD *)&v12.c;
    long long v11 = *(_OWORD *)&v12.tx;
  }
  *(_OWORD *)&v12.a = v10;
  *(_OWORD *)&v12.c = v9;
  *(_OWORD *)&v12.tx = v11;
  [v8 setAffineTransform:&v12];
}

uint64_t sub_10000C8C8(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_10000C91C(uint64_t a1, void *a2)
{
  v9.receiver = v2;
  v9.super_class = (Class)type metadata accessor for ChicletCell();
  objc_msgSendSuper2(&v9, "didUpdateFocusInContext:withAnimationCoordinator:", a1, a2);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v2;
  v8[4] = sub_10000DD14;
  v8[5] = v5;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100006EBC;
  v8[3] = &unk_100020EC0;
  int v6 = _Block_copy(v8);
  id v7 = v2;
  swift_release();
  [a2 addCoordinatedAnimations:v6 completion:0];
  _Block_release(v6);
}

void sub_10000CA1C(char *a1)
{
  if ([a1 isFocused])
  {
    uint64_t v12 = *(void *)&a1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_customBackgroundBlur];
    id v2 = self;
    swift_bridgeObjectRetain();
    id v3 = [v2 whiteColor];
    id v4 = [v3 colorWithAlphaComponent:0.22];

    id v5 = [self effectCompositingColor:v4];
    if (!v5)
    {
      __break(1u);
      return;
    }
    sub_1000162C0();
    if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100016300();
    }
    sub_100016310();
    sub_1000162F0();
    int v6 = *(void **)&a1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectView];
    if (v6)
    {
      sub_100007618(0, &qword_100029850);
      id v7 = v6;
      Class isa = sub_1000162D0().super.isa;
      swift_bridgeObjectRelease();
      [v7 setBackgroundEffects:isa];
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    objc_super v9 = *(void **)&a1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectView];
    if (v9)
    {
      sub_100007618(0, &qword_100029850);
      id v10 = v9;
      Class v11 = sub_1000162D0().super.isa;
      [v10 setBackgroundEffects:v11];
    }
  }

  [a1 layoutIfNeeded];
}

id sub_10000CCFC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ChicletCell();
  return objc_msgSendSuper2(&v2, "isHighlighted");
}

void sub_10000CD84(char a1)
{
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for ChicletCell();
  objc_msgSendSuper2(&v8, "setHighlighted:", a1 & 1);
  id v3 = self;
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v1;
  *(unsigned char *)(v4 + 24) = a1;
  v7[4] = sub_10000DCD0;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_100006EBC;
  v7[3] = &unk_100020E70;
  id v5 = _Block_copy(v7);
  id v6 = v1;
  swift_release();
  [v3 animateWithDuration:v5 animations:0.1];
  _Block_release(v5);
}

void sub_10000CE94(void *a1, char a2)
{
  id v3 = [a1 layer];
  id v5 = v3;
  LODWORD(v4) = 1.0;
  if (a2) {
    *(float *)&double v4 = 0.5;
  }
  [v3 setOpacity:v4];
}

uint64_t sub_10000CF38()
{
  return sub_100009B48();
}

uint64_t sub_10000CF78()
{
  return sub_100009B48();
}

id sub_10000CF88()
{
  sub_10000A12C();
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  uint64_t v1 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_customBackgroundBlur;
  objc_super v2 = self;
  id v3 = v0;
  id v4 = [v2 _gkGameLayerModuleVisualEffect];
  sub_100007618(0, &qword_100029850);
  uint64_t v5 = sub_1000162E0();

  *(void *)&v0[v1] = v5;
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_transitionDuration] = 0x3FC3333333333333;
  *(void *)&v3[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView] = 0;
  v3[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrantIcon] = 1;
  sub_10000DD60(&v3[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName]);

  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for ChicletCell();
  return sub_10000A0EC((uint64_t)v13.super_class, "initWithFrame:", v6, v7, v8, v9, v10, v11, v13);
}

id sub_10000D108(void *a1)
{
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  sub_10000A06C();
  uint64_t v3 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_customBackgroundBlur;
  id v4 = self;
  uint64_t v5 = v1;
  id v6 = [v4 _gkGameLayerModuleVisualEffect];
  sub_100007618(0, &qword_100029850);
  uint64_t v7 = sub_1000162E0();

  *(void *)&v1[v3] = v7;
  swift_unknownObjectWeakInit();
  *(void *)&v5[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectView] = 0;
  *(void *)&v5[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_transitionDuration] = 0x3FC3333333333333;
  *(void *)&v5[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrancyView] = 0;
  v5[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_vibrantIcon] = 1;
  sub_10000DD60(&v5[OBJC_IVAR____TtC29GameCenterMatchmakerExtension11ChicletCell_visualEffectGroupName]);

  v10.receiver = v5;
  v10.super_class = (Class)type metadata accessor for ChicletCell();
  id v8 = objc_msgSendSuper2(&v10, "initWithCoder:", a1);

  return v8;
}

uint64_t sub_10000D290()
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();

  return swift_bridgeObjectRelease();
}

id sub_10000D344()
{
  return sub_10000D8AC(type metadata accessor for ChicletCell);
}

uint64_t type metadata accessor for ChicletCell()
{
  return self;
}

uint64_t sub_10000D440(void *a1)
{
  swift_unknownObjectWeakAssign();
  *(void *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_currentMetadataIndex) = -1;
  id v3 = a1;

  return sub_10000A338((uint64_t)a1);
}

void sub_10000D49C()
{
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  id v2 = [self currentTraitCollection];
  id v3 = [v2 preferredContentSizeCategory];

  sub_1000163C0();
  NSString v4 = sub_100016250();
  swift_bridgeObjectRelease();
  id v5 = [v1 loadNibNamed:v4 owner:0 options:0];

  if (v5)
  {
    uint64_t v6 = sub_1000162E0();

    if (*(void *)(v6 + 16))
    {
      sub_10000D918(v6 + 32, (uint64_t)v7);
      swift_bridgeObjectRelease();

      type metadata accessor for ChicletMetadata();
      sub_10000DDDC();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
  }
}

id sub_10000D634()
{
  *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_metadataViews] = &_swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_currentMetadataIndex] = -1;
  v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_initialAppearance] = 1;
  *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_chiclet] = 0;
  v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_reloadRequested] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BasicChicletCoordinator();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_10000D6D8()
{
  return sub_10000D8AC(type metadata accessor for BasicChicletCoordinator);
}

uint64_t type metadata accessor for BasicChicletCoordinator()
{
  return self;
}

void sub_10000D760(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController] = 0;
  id v3 = &v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_originalMatchmakingMode];
  *(void *)id v3 = 0;
  v3[8] = 1;
  v13.receiver = v1;
  v13.super_class = (Class)type metadata accessor for MultiplayerModeSelectionChicletCoordinator();
  NSString v4 = (char *)objc_msgSendSuper2(&v13, "init");
  uint64_t v5 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController;
  uint64_t v6 = *(void **)&v4[OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController];
  *(void *)&v4[OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController] = a1;
  uint64_t v7 = v4;
  id v8 = a1;

  uint64_t v9 = *(void **)&v4[v5];
  if (v9)
  {
    id v10 = v9;
    id v11 = [v10 matchmakingMode];

    uint64_t v12 = &v7[OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_originalMatchmakingMode];
    *(void *)uint64_t v12 = v11;
    v12[8] = 0;
  }
  else
  {
    __break(1u);
  }
}

void sub_10000D844()
{
}

void sub_10000D884()
{
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController));
}

id sub_10000D894()
{
  return sub_10000D8AC(type metadata accessor for MultiplayerModeSelectionChicletCoordinator);
}

id sub_10000D8AC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for MultiplayerModeSelectionChicletCoordinator()
{
  return self;
}

uint64_t sub_10000D918(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D974()
{
  return _swift_deallocObject(v0, 25, 7);
}

void sub_10000D9AC()
{
  sub_10000C7E4(*(void **)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_10000D9B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000D9C8()
{
  return swift_release();
}

uint64_t sub_10000D9D0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000DA08()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000DA30()
{
  return (*(uint64_t (**)(void))(v0 + 16))(0);
}

unint64_t sub_10000DA5C()
{
  unint64_t result = qword_100029368;
  if (!qword_100029368)
  {
    sub_1000161F0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029368);
  }
  return result;
}

unint64_t sub_10000DAAC()
{
  unint64_t result = qword_100029378;
  if (!qword_100029378)
  {
    sub_10000756C(&qword_100029370);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100029378);
  }
  return result;
}

uint64_t sub_10000DB00()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000DB40()
{
  id v1 = *(uint64_t (**)(uint64_t))(v0 + 24);
  [*(id *)(v0 + 16) removeFromSuperview];
  return v1(1);
}

uint64_t sub_10000DB7C()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000DBBC(uint64_t a1)
{
  sub_10000BE04(*(double *)(v1 + 32), a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

void sub_10000DBC8(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100016250();
  [a3 setText:v4];
}

void sub_10000DC20(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100016250();
  [a3 _setGroupName:v4];
}

void sub_10000DC78(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100016250();
  [a3 setAccessibilityLabel:v4];
}

void sub_10000DCD0()
{
  sub_10000CE94(*(void **)(v0 + 16), *(unsigned char *)(v0 + 24));
}

uint64_t sub_10000DCDC()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000DD14()
{
  sub_10000CA1C(*(char **)(v0 + 16));
}

void sub_10000DD60(char *a1@<X8>)
{
  a1[15] = -18;
}

id sub_10000DD88()
{
  uint64_t v3 = *(const char **)(v1 + 728);
  return objc_msgSend(v0, v3, 1);
}

id sub_10000DDA4()
{
  NSString v4 = *(const char **)(v2 + 976);
  return objc_msgSend(v0, v4, v1);
}

id sub_10000DDC0()
{
  uint64_t v3 = *(const char **)(v1 + 1000);
  return [v0 v3];
}

uint64_t sub_10000DDDC()
{
  return swift_dynamicCast();
}

id sub_10000DE00()
{
  uint64_t v3 = *(const char **)(v1 + 728);
  return objc_msgSend(v0, v3, 1);
}

id sub_10000DE1C()
{
  NSString v4 = *(const char **)(v2 + 976);
  return objc_msgSend(v0, v4, v1);
}

id sub_10000DE38()
{
  uint64_t v3 = *(const char **)(v1 + 728);
  return objc_msgSend(v0, v3, 1);
}

id sub_10000DE54()
{
  NSString v4 = *(const char **)(v2 + 1200);
  return objc_msgSend(v0, v4, v1, -15.0);
}

uint64_t sub_10000DE74()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000DE94()
{
  return swift_unknownObjectWeakLoadStrong();
}

id sub_10000DEAC(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100016250();
  swift_bridgeObjectRelease();
  id v5 = [(id)swift_getObjCClassFromMetadata() systemImageNamed:v4 withConfiguration:a3];

  return v5;
}

void sub_10000DF1C(void *a1)
{
  *(unsigned char *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_navigateTofriendsList) = 0;
  *(void *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_primaryMetadata) = 0;
  uint64_t v2 = (void *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_subtitle);
  void *v2 = 0;
  v2[1] = 0xE000000000000000;
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_title);
  *uint64_t v3 = 0;
  v3[1] = 0xE000000000000000;
  NSString v4 = (void *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_imageName);
  void *v4 = 0;
  v4[1] = 0;
  *(void *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet____lazy_storage___iconImage) = 1;
  sub_10000D760(a1);
}

void sub_10000DF7C(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_primaryMetadata;
  id v5 = *(void **)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_primaryMetadata);
  if (!v5)
  {
    sub_10000A8AC();
    if (!v6) {
      return;
    }
    uint64_t v7 = v6;
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (!Strong) {
      goto LABEL_19;
    }
    uint64_t v9 = Strong;
    id v10 = [Strong layer];

    id v11 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v11)
    {
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
    uint64_t v12 = v11;
    [v11 bounds];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v38.origin.x = v14;
    v38.origin.y = v16;
    v38.size.width = v18;
    v38.size.height = v20;
    [v10 setCornerRadius:CGRectGetWidth(v38) * 0.5];

    id v21 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v21)
    {
LABEL_21:
      __break(1u);
      return;
    }
    unint64_t v22 = v21;
    [v21 setClipsToBounds:1];

    id v23 = v7;
    sub_10000E69C((uint64_t)v7);

    id v5 = *(void **)(v2 + v4);
    if (!v5) {
      goto LABEL_16;
    }
  }
  uint64_t v24 = *(void *)(v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_subtitle);
  uint64_t v25 = *(void *)(v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_subtitle + 8);
  id v26 = v5;
  swift_bridgeObjectRetain();
  sub_10000903C(0, 0xE000000000000000, 0, 0xE000000000000000, v24, v25);

  swift_bridgeObjectRelease();
  id v27 = *(void **)(v2 + v4);
  if (!v27) {
    goto LABEL_16;
  }
  uint64_t v28 = *(void *)(v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_subtitle);
  unint64_t v29 = *(void *)(v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_subtitle + 8);
  id v30 = v27;
  swift_bridgeObjectRetain();
  sub_1000097E8(v28, v29);

  swift_bridgeObjectRelease();
  if (!*(void *)(v2 + v4)) {
    goto LABEL_16;
  }
  uint64_t v31 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v31)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v32 = v31;
  [v31 setNumberOfLines:3];

  if (!*(void *)(v2 + v4)) {
    goto LABEL_16;
  }
  uint64_t v33 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v33)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  NSString v34 = v33;
  [v33 setHidden:1];

  uint64_t v35 = *(void **)(v2 + v4);
  if (!v35)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v36 = (void *)(v2 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_metadataViews);
  swift_beginAccess();
  id v37 = v35;
  sub_1000162C0();
  sub_10000EBF4(*(void *)((*v36 & 0xFFFFFFFFFFFFFF8) + 0x10));
  sub_100016310();
  sub_1000162F0();
  swift_endAccess();
  if (a1) {
    sub_10000A414(0.0);
  }
}

void sub_10000E258(void *a1, char a2, uint64_t a3, char a4, void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v36 = a6;
  id v37 = a5;
  uint64_t v10 = sub_1000161F0();
  sub_10000DD44();
  uint64_t v35 = v11;
  __chkstk_darwin(v12);
  CGFloat v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100016210();
  sub_10000DD44();
  uint64_t v17 = v16;
  __chkstk_darwin(v18);
  CGFloat v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController;
  unint64_t v22 = *(void **)(v6
                 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController);
  if (!v22)
  {
    __break(1u);
    goto LABEL_13;
  }
  if ((*(unsigned char *)(v6
                 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_originalMatchmakingMode
                 + 8) & 1) != 0)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  [v22 setMatchmakingMode:*(void *)(v6+ OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_originalMatchmakingMode)];
  id v23 = *(void **)(v6 + v21);
  if (!v23)
  {
LABEL_14:
    __break(1u);
    return;
  }
  id v24 = v23;
  [v24 setShowNavigationBar:a2 & 1];
  if (a2)
  {
    id v25 = [a1 navigationController];
    if (v25)
    {
      id v26 = v25;
      [v25 pushViewController:v24 animated:1];
    }
  }
  else
  {
    sub_100007618(0, &qword_100029380);
    id v27 = (void *)sub_100016390();
    uint64_t v28 = swift_allocObject();
    *(void *)(v28 + 16) = a1;
    *(void *)(v28 + 24) = v24;
    *(unsigned char *)(v28 + 32) = a4 & 1;
    aBlock[4] = sub_10000EBAC;
    aBlock[5] = v28;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006EBC;
    aBlock[3] = &unk_100020F10;
    unint64_t v29 = _Block_copy(aBlock);
    id v30 = v24;
    id v31 = a1;
    swift_release();
    sub_100016200();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_10000DA5C();
    sub_100007328(&qword_100029370);
    sub_10000DAAC();
    sub_100016440();
    sub_1000163A0();
    _Block_release(v29);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v14, v10);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v15);
  }
  id v32 = v37;
  if (v37)
  {
    uint64_t v33 = swift_retain();
    v32(v33);

    sub_10000EBD0((uint64_t)v32);
  }
  else
  {
  }
}

void sub_10000E58C(void *a1)
{
  sub_10000D440(a1);
  id v3 = sub_10000E6DC();
  id v4 = [self labelColor];
  id v12 = sub_10000A344(v3, (uint64_t)v4);

  id v5 = (uint64_t *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_title);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_title);
  uint64_t v7 = v5[1];
  swift_bridgeObjectRetain();
  sub_10000B748(v6, v7, v12);
  swift_bridgeObjectRelease();
  uint64_t v8 = *v5;
  uint64_t v9 = v5[1];
  swift_bridgeObjectRetain();
  sub_100009F08(v8, v9, v12);
  uint64_t v10 = *v5;
  uint64_t v11 = v5[1];
  swift_bridgeObjectRetain();
  sub_100009F08(v10, v11, a1);
  sub_10000A414(0.0);
}

uint64_t sub_10000E69C(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_primaryMetadata) = a1;
  return _objc_release_x1();
}

uint64_t sub_10000E6B0(uint64_t a1, uint64_t a2)
{
  return sub_10000E6C8(a1, a2, &OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_subtitle);
}

uint64_t sub_10000E6BC(uint64_t a1, uint64_t a2)
{
  return sub_10000E6C8(a1, a2, &OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_title);
}

uint64_t sub_10000E6C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000EC20(a1, a2, *a3);
}

uint64_t sub_10000E6D0(uint64_t a1, uint64_t a2)
{
  return sub_10000EC20(a1, a2, OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_imageName);
}

id sub_10000E6DC()
{
  uint64_t v1 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet____lazy_storage___iconImage;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet____lazy_storage___iconImage);
  id v3 = v2;
  if (v2 == (void *)1)
  {
    id v3 = sub_10000E74C(v0);
    id v4 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v3;
    id v5 = v3;
    sub_10000EB5C(v4);
  }
  sub_10000EBE4(v2);
  return v3;
}

id sub_10000E74C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_imageName + 8);
  if (!v1) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet_imageName);
  id v3 = self;
  swift_bridgeObjectRetain();
  id v4 = [v3 tintColor];
  id v5 = self;
  id v6 = [v5 configurationWithHierarchicalColor:v4];

  sub_100007618(0, &qword_100029610);
  id v7 = v6;
  id v8 = sub_10000DEAC(v2, v1, v6);
  if (!GKIsXRUIIdiom())
  {
    if (v8)
    {
      CGFloat v20 = self;
      id v21 = v8;
      id v22 = [v20 configurationWithTextStyle:UIFontTextStyleTitle1 scale:3];
      id v19 = [v21 imageWithConfiguration:v22];

      goto LABEL_9;
    }
    goto LABEL_11;
  }
  int ShouldUsePhoneUI = GKIsXRUIIdiomShouldUsePhoneUI();
  uint64_t v10 = (id *)&UIFontTextStyleTitle1;
  if (!ShouldUsePhoneUI) {
    uint64_t v10 = (id *)&UIFontTextStyleExtraLargeTitle;
  }
  id v11 = *v10;
  id v12 = v11;
  if (!v8)
  {

LABEL_11:
    return 0;
  }
  uint64_t v13 = self;
  id v14 = v8;
  id v15 = [v13 configurationWithTextStyle:v12 scale:3];
  id v16 = [v14 imageWithConfiguration:v15];

  id v17 = [v3 labelColor];
  id v18 = [v5 configurationWithHierarchicalColor:v17];

  id v19 = [v16 imageByApplyingSymbolConfiguration:v18];
LABEL_9:

  return v19;
}

void sub_10000E9D0(int a1, id a2, char a3)
{
}

void sub_10000EA00()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void **)(v0
                + OBJC_IVAR____TtC29GameCenterMatchmakerExtension22MultiplayerModeChiclet____lazy_storage___iconImage);

  sub_10000EB5C(v1);
}

id sub_10000EA7C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MultiplayerModeChiclet();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MultiplayerModeChiclet()
{
  return self;
}

void sub_10000EB5C(id a1)
{
  if (a1 != (id)1) {
}
  }

uint64_t sub_10000EB6C()
{
  return _swift_deallocObject(v0, 33, 7);
}

void sub_10000EBAC()
{
  sub_10000E9D0(*(void *)(v0 + 16), *(id *)(v0 + 24), *(unsigned char *)(v0 + 32));
}

uint64_t sub_10000EBB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000EBC8()
{
  return swift_release();
}

uint64_t sub_10000EBD0(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

id sub_10000EBE4(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

uint64_t sub_10000EBF4(uint64_t result)
{
  if (result + 1 > *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    return sub_100016300();
  }
  return result;
}

uint64_t sub_10000EC20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v4 = (void *)(v3 + a3);
  void *v4 = a1;
  v4[1] = a2;
  return swift_bridgeObjectRelease();
}

id sub_10000EC34(void *a1)
{
  id v1 = a1;
  sub_10000DF1C(v1);
  id v3 = v2;
  uint64_t v4 = sub_100016290();
  sub_10000E6B0(v4, v5);
  uint64_t v6 = sub_100016290();
  sub_10000E6BC(v6, v7);
  sub_10000E6D0(0x656C6666756873, 0xE700000000000000);

  return v3;
}

id sub_10000ECCC(void *a1, char a2, char a3, char a4)
{
  uint64_t v6 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController;
  id result = *(id *)(v4
                 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension42MultiplayerModeSelectionChicletCoordinator_multiplayerViewController);
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  [result setCanStartGroupActivities:0];
  id result = *(id *)(v4 + v6);
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  [result setOrigin:2];
  sub_10000E258(a1, a2 & 1, a3 & 1, a4 & 1, 0, 0);
  id result = *(id *)(v4 + v6);
  if (!result)
  {
LABEL_9:
    __break(1u);
    return result;
  }

  return [result setMatchmakingMode:2];
}

id sub_10000ED90()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for QuickMatchModeChiclet();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for QuickMatchModeChiclet()
{
  return self;
}

id MultiplayerModeSelectionShimViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_100016250();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for MultiplayerModeSelectionShimViewController();
  id v6 = objc_msgSendSuper2(&v8, "initWithNibName:bundle:", v5, a3);

  return v6;
}

uint64_t type metadata accessor for MultiplayerModeSelectionShimViewController()
{
  return self;
}

id MultiplayerModeSelectionShimViewController.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for MultiplayerModeSelectionShimViewController();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id MultiplayerModeSelectionShimViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MultiplayerModeSelectionShimViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000EF54(uint64_t a1)
{
  return sub_10000A0BC(a1, OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_matchRequest);
}

uint64_t sub_10000EF60(uint64_t a1)
{
  return sub_10000A0BC(a1, OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_game);
}

uint64_t sub_10000EF6C(uint64_t a1)
{
  return sub_10000A0BC(a1, OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_multiplayerViewController);
}

uint64_t MultiplayerModeSelectionViewController.skipModeSelection.getter()
{
  id v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_skipModeSelection);
  sub_100015B58();
  return *v1;
}

uint64_t MultiplayerModeSelectionViewController.skipModeSelection.setter(char a1)
{
  id v3 = (unsigned char *)(v1
               + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_skipModeSelection);
  uint64_t result = sub_100015F44();
  *id v3 = a1;
  return result;
}

uint64_t (*MultiplayerModeSelectionViewController.skipModeSelection.modify())()
{
  return j__swift_endAccess;
}

uint64_t MultiplayerModeSelectionViewController.originalMatchmakingMode.getter()
{
  uint64_t v1 = v0
     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_originalMatchmakingMode;
  sub_100015B58();
  return *(void *)v1;
}

void MultiplayerModeSelectionViewController.originalMatchmakingMode.setter(uint64_t a1)
{
  id v3 = (uint64_t *)(v1
                 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_originalMatchmakingMode);
  sub_100015F44();
  uint64_t v4 = *v3;
  *id v3 = a1;
  sub_10000F1B8(v4);
}

void sub_10000F1B8(uint64_t a1)
{
  uint64_t v3 = sub_1000161C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = &v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_originalMatchmakingMode];
  swift_beginAccess();
  if (*(void *)v7 != a1)
  {
    sub_100016190();
    os_log_type_t v8 = sub_100016350();
    uint64_t v9 = v1;
    uint64_t v10 = sub_1000161B0();
    os_log_type_t v11 = v8;
    if (os_log_type_enabled(v10, v8))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)id v12 = 134217984;
      uint64_t v13 = *(void *)v7;
      sub_100016400();

      _os_log_impl((void *)&_mh_execute_header, v10, v11, "MultiplayerModeSelectionViewController did set original matchmaking mode: %ld", v12, 0xCu);
      swift_slowDealloc();
    }
    else
    {

      uint64_t v10 = v9;
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_100011CC0();
  }
}

void (*MultiplayerModeSelectionViewController.originalMatchmakingMode.modify(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  uint64_t v4 = (void *)(v1
                + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_originalMatchmakingMode);
  sub_100015B58();
  v3[3] = *v4;
  return sub_10000F3F8;
}

void sub_10000F3F8(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  MultiplayerModeSelectionViewController.originalMatchmakingMode.setter(*(void *)(*(void *)a1 + 24));

  free(v1);
}

uint64_t MultiplayerModeSelectionViewController.isEligibleForGroupSession.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_isEligibleForGroupSession);
  sub_100015B58();
  return *v1;
}

void MultiplayerModeSelectionViewController.isEligibleForGroupSession.setter(char a1)
{
}

void (*MultiplayerModeSelectionViewController.isEligibleForGroupSession.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = (unsigned char *)(v1
               + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_isEligibleForGroupSession);
  sub_100015B58();
  *((unsigned char *)v3 + 32) = *v4;
  return sub_10000F574;
}

void sub_10000F574(uint64_t a1, uint64_t a2)
{
}

uint64_t MultiplayerModeSelectionViewController.isEntitledToUseGroupActivities.getter()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_isEntitledToUseGroupActivities);
  sub_100015B58();
  return *v1;
}

void MultiplayerModeSelectionViewController.isEntitledToUseGroupActivities.setter(char a1)
{
}

void sub_10000F654(char a1, void *a2)
{
  uint64_t v5 = (char *)(v2 + *a2);
  sub_100015F44();
  char v6 = *v5;
  *uint64_t v5 = a1;
  sub_10000F6AC(v6, a2);
}

void sub_10000F6AC(char a1, void *a2)
{
  int v3 = a1 & 1;
  uint64_t v4 = (unsigned __int8 *)(v2 + *a2);
  sub_100015B58();
  if (*v4 != v3) {
    sub_100011CC0();
  }
}

void (*MultiplayerModeSelectionViewController.isEntitledToUseGroupActivities.modify(void *a1))(uint64_t a1, uint64_t a2)
{
  int v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[3] = v1;
  uint64_t v4 = (unsigned char *)(v1
               + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_isEntitledToUseGroupActivities);
  sub_100015B58();
  *((unsigned char *)v3 + 32) = *v4;
  return sub_10000F778;
}

void sub_10000F778(uint64_t a1, uint64_t a2)
{
}

void sub_10000F790(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  int v3 = *(void **)a1;
  a3(*(unsigned __int8 *)(*(void *)a1 + 32));

  free(v3);
}

Swift::Void __swiftcall MultiplayerModeSelectionViewController.launchSharePlayChiclet()()
{
  sub_100015CC0();
  uint64_t v1 = sub_1000161C0();
  sub_10000DD44();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  char v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(unsigned char **)(v0
                 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_sharePlayModeChiclet);
  if (v7)
  {
    v7[OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_isEligibleForGroupSession] = 1;
    v7[OBJC_IVAR____TtC29GameCenterMatchmakerExtension20SharePlayModeChiclet_startStagedActivity] = 1;
    v19[1] = v7;
    sub_100015C60();
    sub_100006F6C(v8, v9, v10, v11);
    sub_100015C08();
  }
  else
  {
    os_log_type_t v14 = sub_100016340();
    sub_100016190();
    id v15 = sub_1000161B0();
    os_log_type_t v16 = v14;
    if (os_log_type_enabled(v15, v14))
    {
      id v17 = (uint8_t *)sub_100015E54();
      uint64_t v20 = sub_100015E18();
      *(_DWORD *)id v17 = 136315138;
      sub_100015CD8();
      v19[2] = sub_100014FA4(0xD00000000000001BLL, v18, &v20);
      sub_100016400();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "SharePlay - %s", v17, 0xCu);
      swift_arrayDestroy();
      sub_100015BF0();
      sub_100015BF0();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v1);
    sub_100015C08();
  }
}

Swift::Void __swiftcall MultiplayerModeSelectionViewController.showLobbyWithOriginalRequest()()
{
  sub_100015CC0();
  uint64_t v2 = (void *)sub_1000161C0();
  sub_10000DD44();
  uint64_t v4 = v3;
  uint64_t v6 = __chkstk_darwin(v5);
  os_log_type_t v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  char v10 = (char *)&v38 - v9;
  char v11 = (uint64_t *)(v0
                  + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_originalMatchmakingMode);
  sub_100015B58();
  if (*v11 != 2)
  {
    unint64_t v18 = *(void **)(v0
                   + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_inviteFriendsModeChiclet);
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = (void *)sub_100015CE4();
      sub_10000A1E4(v20, v21, v22, v23);
      goto LABEL_6;
    }
    sub_100016340();
    sub_100015EBC();
    sub_1000164C0(73);
    sub_100015CD8();
    sub_1000162A0(v44);
    uint64_t v40 = *v11;
    type metadata accessor for GKMatchmakingMode(0);
    sub_100016500();
    uint64_t v32 = v41;
    unint64_t v31 = v42;
    sub_100016190();
    swift_bridgeObjectRetain_n();
    uint64_t v33 = sub_1000161B0();
    if (os_log_type_enabled(v33, v1))
    {
      uint64_t v34 = sub_100015E54();
      uint64_t v39 = v32;
      uint64_t v35 = (_DWORD *)v34;
      uint64_t v41 = sub_100015E18();
      *uint64_t v35 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v36 = sub_100014FA4(v39, v31, &v41);
      sub_100015D9C(v36);
      swift_bridgeObjectRelease_n();
      sub_100015E88((void *)&_mh_execute_header, v33, v37, "SharePlay - %s");
      swift_arrayDestroy();
      sub_100015BF0();
      sub_100015BF0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, void *))(v4 + 8))(v8, v2);
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  id v12 = *(void **)(v0
                 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_quickMatchModeChiclet);
  if (!v12)
  {
    sub_100016340();
    sub_100015EBC();
    sub_1000164C0(70);
    sub_100015CD8();
    v43._countAndFlagsBits = 0xD000000000000044;
    sub_1000162A0(v43);
    uint64_t v40 = *v11;
    type metadata accessor for GKMatchmakingMode(0);
    sub_100016500();
    uint64_t v25 = v41;
    unint64_t v24 = v42;
    sub_100016190();
    swift_bridgeObjectRetain_n();
    id v26 = sub_1000161B0();
    if (os_log_type_enabled(v26, v1))
    {
      uint64_t v27 = sub_100015E54();
      uint64_t v39 = v25;
      uint64_t v28 = (_DWORD *)v27;
      uint64_t v41 = sub_100015E18();
      *uint64_t v28 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v29 = sub_100014FA4(v39, v24, &v41);
      sub_100015D9C(v29);
      swift_bridgeObjectRelease_n();
      sub_100015E88((void *)&_mh_execute_header, v26, v30, "SharePlay - %s");
      swift_arrayDestroy();
      sub_100015BF0();
      sub_100015BF0();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, void *))(v4 + 8))(v10, v2);
    goto LABEL_15;
  }
  id v13 = v12;
  os_log_type_t v14 = (void *)sub_100015CE4();
  sub_10000ECCC(v14, v15, v16, v17);
LABEL_6:

LABEL_16:
  sub_100015C08();
}

uint64_t sub_10000FE38(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (void *)(v2
                + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_dismissHandler);
  uint64_t v4 = *(void *)(v2
                 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_dismissHandler);
  *uint64_t v3 = a1;
  v3[1] = a2;
  return sub_10000EBD0(v4);
}

UIScrollView_optional __swiftcall MultiplayerModeSelectionViewController.contentScrollView()()
{
  uint64_t v0 = (objc_class *)sub_10000A064();
  result.value.super.super.super.Class isa = v0;
  result.is_nil = v1;
  return result;
}

void sub_10000FEF4(void *a1)
{
  swift_unknownObjectWeakAssign();
}

uint64_t sub_10000FF3C(uint64_t a1)
{
  return sub_10000A0BC(a1, OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_sharePlayModeChiclet);
}

uint64_t sub_10000FF48(uint64_t a1)
{
  return sub_10000A0BC(a1, OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_inviteFriendsModeChiclet);
}

uint64_t sub_10000FF54(uint64_t a1)
{
  return sub_10000A0BC(a1, OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_quickMatchModeChiclet);
}

void sub_10000FF60()
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_matchRequest));

  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_multiplayerViewController));
  sub_10000EBD0(*(void *)(v0
                          + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_dismissHandler));
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_kvoToken));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_sharePlayModeChiclet));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_inviteFriendsModeChiclet));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_quickMatchModeChiclet));
  Swift::Bool v1 = *(void **)(v0
                + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_emptyStateView);
}

id MultiplayerModeSelectionViewController.__deallocating_deinit()
{
  Swift::Bool v1 = v0;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_kvoToken];
  if (v2)
  {
    id v3 = v2;
    sub_100016100();
  }
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
  return objc_msgSendSuper2(&v5, "dealloc");
}

void sub_100010220()
{
  id v1 = [objc_allocWithZone((Class)UIVisualEffectView) init];
  Class isa = (Class)[self _gkGameLayerBackgroundVisualEffect];
  if (!isa)
  {
    sub_100007618(0, &qword_100029850);
    sub_1000162E0();
    Class isa = sub_1000162D0().super.isa;
    swift_bridgeObjectRelease();
  }
  [v1 setBackgroundEffects:isa];

  sub_10001582C(0x6579614C656D6167, 0xEE0070756F724772, v1, (SEL *)&selRef__setGroupName_);
  id v3 = [v0 view];
  if (v3)
  {
    uint64_t v4 = v3;
    [v3 insertSubview:v1 atIndex:0];

    [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
    objc_super v5 = self;
    id v6 = v1;
    id v7 = [v0 view];
    [v5 _gkInstallEdgeConstraintsForView:v6 containedWithinParentView:v7];
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall MultiplayerModeSelectionViewController.viewDidLoad()()
{
  id v1 = v0;
  swift_getObjectType();
  v45.receiver = v0;
  v45.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
  objc_msgSendSuper2(&v45, "viewDidLoad");
  uint64_t v2 = self;
  id v3 = [v2 defaultCenter];
  [v3 addObserver:v1 selector:"didEnterBackgroundWithNotif:" name:UIApplicationDidEnterBackgroundNotification object:0];

  id v4 = [v2 defaultCenter];
  [v4 addObserver:v1 selector:"willEnterForegroundWithNotif:" name:UIApplicationWillEnterForegroundNotification object:0];

  sub_100010220();
  id v5 = [v1 navigationController];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 navigationBar];

    [v7 setForceFullHeightInLandscape:1];
  }
  sub_100011CC0();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v9 = Strong;
  [Strong setDataSource:v1];

  char v10 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v10)
  {
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  char v11 = v10;
  [v10 setDelegate:v1];

  LODWORD(v11) = GKIsXRUIIdiomShouldUsePadUI();
  uint64_t v12 = swift_unknownObjectWeakLoadStrong();
  id v13 = (void *)v12;
  if (v11)
  {
    if (!v12)
    {
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    sub_100007618(0, &qword_100029688);
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v15 = [self bundleForClass:ObjCClassFromMetadata];
    sub_100015CD8();
    id v18 = sub_100010928(0xD000000000000010, v16, v17);
    NSString v19 = sub_100016250();
    [v13 registerNib:v18 forCellWithReuseIdentifier:v19];
  }
  else
  {
    if (!v12)
    {
LABEL_20:
      __break(1u);
      return;
    }
    sub_100007618(0, &qword_100029688);
    type metadata accessor for MultiplayerModeSelectionShimViewController();
    uint64_t v20 = (void *)swift_getObjCClassFromMetadata();
    NSString v21 = sub_100016250();
    id v22 = [v20 _gkPlatformNibNameForBaseName:v21];

    uint64_t v23 = sub_100016270();
    uint64_t v25 = v24;

    uint64_t v26 = swift_getObjCClassFromMetadata();
    id v27 = [self bundleForClass:v26];
    id v18 = sub_100010928(v23, v25, v27);
    NSString v19 = sub_100016250();
    [v13 registerNib:v18 forCellWithReuseIdentifier:v19];
  }

  uint64_t v28 = swift_unknownObjectWeakLoadStrong();
  if (!v28) {
    goto LABEL_17;
  }
  uint64_t v29 = (void *)v28;
  sub_100007618(0, &qword_100029688);
  uint64_t v30 = swift_getObjCClassFromMetadata();
  id v31 = [self bundleForClass:v30];
  sub_100015CD8();
  id v35 = sub_100010928(v32, v33, v34);
  NSString v36 = sub_100016250();
  [v29 registerNib:v35 forCellWithReuseIdentifier:v36];

  uint64_t v37 = swift_unknownObjectWeakLoadStrong();
  if (!v37)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v38 = (void *)v37;
  id v39 = [self clearColor];
  [v38 setBackgroundColor:v39];

  sub_1000111F8();
  sub_100011124();
  id v40 = [v1 navigationController];
  if (v40)
  {
    uint64_t v41 = v40;
    id v42 = [v40 navigationBar];

    [v42 setRequestedContentSize:2];
  }
  id v43 = [v1 navigationItem];
  [v43 _setAutoScrollEdgeTransitionDistance:40.0];

  id v44 = [v1 navigationItem];
  [v44 _setManualScrollEdgeAppearanceEnabled:1];

  sub_1000109E0();
}

id sub_100010928(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4 = sub_100016250();
  swift_bridgeObjectRelease();
  id v5 = [(id)swift_getObjCClassFromMetadata() nibWithNibName:v4 bundle:a3];

  return v5;
}

void sub_1000109E0()
{
  sub_100015CC0();
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000161C0();
  sub_10000DD44();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100015BAC();
  id v6 = (unsigned char *)(v0
               + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_skipModeSelection);
  sub_100015B58();
  if (*v6 != 1)
  {
    uint64_t v12 = (uint64_t *)(v0
                    + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_originalMatchmakingMode);
    sub_100015B58();
    uint64_t v13 = *v12;
    if (*v12 == 1 || v13 == 3)
    {
      id v15 = *(void **)(v1
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_inviteFriendsModeChiclet);
      if (!v15) {
        goto LABEL_16;
      }
      id v16 = v15;
      sub_100015C60();
      sub_10000A1E4(v17, v18, v19, v20);
    }
    else
    {
      if (v13 != 2) {
        goto LABEL_16;
      }
      NSString v21 = *(void **)(v1
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_quickMatchModeChiclet);
      if (!v21) {
        goto LABEL_16;
      }
      id v16 = v21;
      sub_100015C60();
      sub_10000ECCC(v22, v23, v24, v25);
    }

    goto LABEL_16;
  }
  os_log_type_t v7 = sub_100016330();
  sub_100016190();
  os_log_type_t v8 = sub_1000161B0();
  if (os_log_type_enabled(v8, v7))
  {
    uint64_t v9 = (_DWORD *)sub_100015E54();
    uint64_t v26 = sub_100015E18();
    *uint64_t v9 = 136315138;
    sub_100015CD8();
    sub_100014FA4(0xD00000000000001ELL, v10, &v26);
    sub_100016400();
    sub_100015E88((void *)&_mh_execute_header, v8, v11, "SharePlay - %s");
    swift_arrayDestroy();
    sub_100015BF0();
    sub_100015BF0();
  }

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v2);
  MultiplayerModeSelectionViewController.showLobbyWithOriginalRequest()();
LABEL_16:
  sub_100015C08();
}

Swift::Void __swiftcall MultiplayerModeSelectionViewController.viewWillAppear(_:)(Swift::Bool a1)
{
  uint64_t v2 = v1;
  v14.receiver = v2;
  v14.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
  objc_msgSendSuper2(&v14, "viewWillAppear:", a1);
  uint64_t v4 = &v2[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chiclets];
  sub_100015B58();
  uint64_t v5 = *(void *)v4;
  if (!(*(void *)v4 >> 62))
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_3;
    }
LABEL_9:
    swift_bridgeObjectRelease();
    sub_100011B5C();
    id v10 = [objc_allocWithZone((Class)GKAPIReporter) init];
    NSString v11 = sub_100015C9C();
    NSString v12 = sub_100016250();
    NSString v13 = sub_100015BC4();
    [v10 recordPageWithID:v11 pageContext:v12 pageType:v13];

    return;
  }
  sub_100015ED0();
  uint64_t v6 = sub_100016530();
  if (!v6) {
    goto LABEL_9;
  }
LABEL_3:
  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if ((v5 & 0xC000000000000001) != 0) {
        os_log_type_t v8 = (void *)sub_1000164E0();
      }
      else {
        os_log_type_t v8 = *(id *)(v5 + 8 * i + 32);
      }
      uint64_t v9 = v8;
      (*(void (**)(uint64_t))((swift_isaMask & *v8) + 0xF8))(1);
    }
    goto LABEL_9;
  }
  __break(1u);
}

Swift::Void __swiftcall MultiplayerModeSelectionViewController.viewWillDisappear(_:)(Swift::Bool a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
  objc_msgSendSuper2(&v3, "viewWillDisappear:", a1);
}

Swift::Void __swiftcall MultiplayerModeSelectionViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
  objc_msgSendSuper2(&v3, "viewDidAppear:", a1);
  v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_canUpdateChiclets] = 1;
  *(CFAbsoluteTime *)&v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_startTime] = CFAbsoluteTimeGetCurrent();
}

Swift::Void __swiftcall MultiplayerModeSelectionViewController.viewDidDisappear(_:)(Swift::Bool a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
  objc_msgSendSuper2(&v3, "viewDidDisappear:", a1);
  *((unsigned char *)v1
  + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_canUpdateChiclets) = 0;
}

uint64_t MultiplayerModeSelectionViewController.preferredFocusEnvironments.getter()
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = Strong;
    sub_100007328(&qword_1000296C0);
    uint64_t v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_100017F80;
    *(void *)(v3 + 32) = v2;
    uint64_t v7 = v3;
    sub_1000162F0();
    return v7;
  }
  else
  {
    v8.receiver = v0;
    v8.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
    id v5 = objc_msgSendSuper2(&v8, "preferredFocusEnvironments");
    sub_100007328(&qword_1000296B8);
    uint64_t v4 = sub_1000162E0();
  }
  return v4;
}

void sub_100011124()
{
  id v1 = [self _gkXmarkedCloseButtonWithTarget:v0 action:"donePressed:"];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v0 navigationItem];
    id v4 = [objc_allocWithZone((Class)UIBarButtonItem) initWithCustomView:v2];
    [v3 setRightBarButtonItem:v4];
  }
}

void sub_1000111F8()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v1 = Strong;
  id v19 = [Strong collectionViewLayout];

  uint64_t v2 = self;
  id v10 = (void *)sub_100015E30(v2, v3, v4, v5, v6, v7, v8, v9, v18, (uint64_t)v19);
  if ((sub_100011AD4() & 1) == 0)
  {
    [v10 setScrollDirection:1];
    id v15 = (void *)swift_unknownObjectWeakLoadStrong();
    if (v15)
    {
      id v16 = v15;
      [v15 setAlwaysBounceVertical:0];

      char v17 = (void *)swift_unknownObjectWeakLoadStrong();
      if (v17)
      {
        objc_super v14 = v17;
        [v17 setAlwaysBounceHorizontal:1];
        goto LABEL_9;
      }
LABEL_16:
      __break(1u);
      return;
    }
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  [v10 setScrollDirection:0];
  NSString v11 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v11) {
    goto LABEL_13;
  }
  NSString v12 = v11;
  [v11 setAlwaysBounceVertical:1];

  NSString v13 = (void *)swift_unknownObjectWeakLoadStrong();
  if (!v13)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  objc_super v14 = v13;
  [v13 setAlwaysBounceHorizontal:0];
LABEL_9:
}

Swift::Void __swiftcall MultiplayerModeSelectionViewController.viewSafeAreaInsetsDidChange()()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = Strong;
    id v11 = [Strong collectionViewLayout];

    uint64_t v2 = self;
    objc_msgSend((id)sub_100015E30(v2, v3, v4, v5, v6, v7, v8, v9, v10, (uint64_t)v11), "invalidateLayout");
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall MultiplayerModeSelectionViewController.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  Class isa = a1.value.super.isa;
  v20.receiver = v1;
  v20.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
  objc_msgSendSuper2(&v20, "traitCollectionDidChange:", isa);
  sub_1000111F8();
  if (isa) {
    id v3 = [(objc_class *)isa preferredContentSizeCategory];
  }
  else {
    id v3 = 0;
  }
  id v4 = [v1 traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (!v3)
  {

    goto LABEL_12;
  }
  uint64_t v6 = sub_100016270();
  uint64_t v8 = v7;
  if (v6 == sub_100016270() && v8 == v9)
  {

    goto LABEL_23;
  }
  char v11 = sub_100016550();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v11 & 1) == 0)
  {
LABEL_12:
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (!Strong) {
      goto LABEL_27;
    }
    NSString v13 = Strong;
    [Strong reloadData];

    objc_super v14 = &v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chiclets];
    sub_100015B58();
    unint64_t v15 = *(void *)v14;
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v16 = sub_100016530();
      if (v16) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n();
      if (v16)
      {
LABEL_15:
        if (v16 >= 1)
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if ((v15 & 0xC000000000000001) != 0) {
              id v18 = (id)sub_1000164E0();
            }
            else {
              id v18 = *(id *)(v15 + 8 * i + 32);
            }
            id v19 = v18;
            sub_10000A6C0();
          }
          goto LABEL_23;
        }
        __break(1u);
LABEL_27:
        __break(1u);
        return;
      }
    }
LABEL_23:
    swift_bridgeObjectRelease_n();
  }
}

Swift::Void __swiftcall MultiplayerModeSelectionViewController.viewWillLayoutSubviews()()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
  objc_msgSendSuper2(&v4, "viewWillLayoutSubviews");
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = Strong;
    id v3 = [Strong collectionViewLayout];

    [v3 invalidateLayout];
  }
  else
  {
    __break(1u);
  }
}

void MultiplayerModeSelectionViewController.viewWillTransition(to:with:)(uint64_t a1, double a2, double a3)
{
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
  objc_msgSendSuper2(&v10, "viewWillTransitionToSize:withTransitionCoordinator:", a1, a2, a3);
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = Strong;
    id v9 = [Strong collectionViewLayout];

    [v9 invalidateLayout];
  }
  else
  {
    __break(1u);
  }
}

void sub_10001189C()
{
  id v1 = *(void (**)(void))(v0
                        + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_dismissHandler);
  if (v1)
  {
    id v2 = objc_allocWithZone((Class)GKAPIReporter);
    swift_retain();
    id v3 = [v2 init];
    NSString v4 = sub_100016250();
    NSString v5 = sub_100016250();
    NSString v6 = sub_100016250();
    NSString v7 = sub_100015C9C();
    NSString v8 = sub_100015BC4();
    sub_100015DDC(v3, "recordClickWithAction:targetId:targetType:pageId:pageType:");

    v1();
    sub_10000EBD0((uint64_t)v1);
  }
}

BOOL sub_100011A3C()
{
  id v1 = [v0 traitCollection];
  id v2 = [v1 horizontalSizeClass];

  if (v2 != (id)1) {
    return 0;
  }
  id v3 = [v0 traitCollection];
  id v4 = [v3 verticalSizeClass];

  return v4 == (id)2;
}

uint64_t sub_100011AD4()
{
  if (sub_1000159BC() || sub_100011A3C()) {
    return 1;
  }
  id v1 = [self currentTraitCollection];
  id v2 = [v1 preferredContentSizeCategory];

  LOBYTE(v1) = sub_1000163C0();
  return v1 & 1;
}

void *sub_100011B5C()
{
  UIScrollView_optional result = (void *)swift_unknownObjectWeakLoadStrong();
  if (!result) {
    goto LABEL_17;
  }
  id v1 = result;
  id v2 = [result visibleCells];

  sub_100007618(0, &qword_100029838);
  unint64_t v3 = sub_1000162E0();

  if (v3 >> 62)
  {
    sub_100015D28();
    UIScrollView_optional result = (void *)sub_100016530();
    uint64_t v4 = (uint64_t)result;
    if (result) {
      goto LABEL_4;
    }
    return (void *)swift_bridgeObjectRelease_n();
  }
  uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  UIScrollView_optional result = (void *)swift_bridgeObjectRetain();
  if (!v4) {
    return (void *)swift_bridgeObjectRelease_n();
  }
LABEL_4:
  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v6 = (id)sub_1000164E0();
      }
      else {
        id v6 = *(id *)(v3 + 8 * i + 32);
      }
      NSString v7 = v6;
      type metadata accessor for ChicletCell();
      if (swift_dynamicCastClass())
      {
        uint64_t Strong = swift_unknownObjectWeakLoadStrong();
        if (Strong)
        {
          id v9 = (void *)Strong;
          sub_10000A414(0.0);

          NSString v7 = v9;
        }
      }
    }
    return (void *)swift_bridgeObjectRelease_n();
  }
  __break(1u);
LABEL_17:
  __break(1u);
  return result;
}

void sub_100011CC0()
{
  sub_100015CC0();
  uint64_t v2 = sub_1000161C0();
  sub_10000DD44();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_100015BAC();
  id v6 = &v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chiclets];
  sub_100015F44();
  *(void *)id v6 = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  uint64_t v7 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_matchRequest;
  NSString v8 = *(void **)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_matchRequest];
  if (!v8)
  {
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  unint64_t v9 = sub_1000157B4(v8);
  uint64_t v51 = v7;
  if (v9)
  {
    if (v9 >> 62) {
      uint64_t v10 = sub_100016530();
    }
    else {
      uint64_t v10 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    BOOL v52 = v10 != 0;
  }
  else
  {
    BOOL v52 = 0;
  }
  sub_100016190();
  os_log_type_t v11 = sub_100016350();
  uint64_t v1 = v0;
  id v12 = sub_1000161B0();
  if (os_log_type_enabled(v12, v11))
  {
    uint64_t v50 = v4;
    uint64_t v13 = swift_slowAlloc();
    uint64_t v53 = sub_100015E18();
    *(_DWORD *)uint64_t v13 = 134218498;
    sub_100015B58();
    sub_100016400();
    *(_WORD *)(v13 + 12) = 1024;
    sub_100015B58();
    sub_100016400();
    *(_WORD *)(v13 + 18) = 2080;
    if (v52)
    {
      objc_super v14 = *(void **)&v0[v51];
      if (!v14)
      {
LABEL_58:

        __break(1u);
        goto LABEL_59;
      }
      sub_1000157B4(v14);
      sub_100007328(&qword_100029840);
      uint64_t v15 = sub_100016280();
      unint64_t v17 = v16;
    }
    else
    {
      unint64_t v17 = 0xE400000000000000;
      uint64_t v15 = 1701736270;
    }
    sub_100014FA4(v15, v17, &v53);
    sub_100016400();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v11, "MultiplayerModeSelectionViewController updateChiclets, mode: %ld, isEligibleForGroupSession: %{BOOL}d, has recipients: %s", (uint8_t *)v13, 0x1Cu);
    swift_arrayDestroy();
    sub_100015BF0();
    sub_100015BF0();

    (*(void (**)(char *, uint64_t))(v50 + 8))(v0, v2);
  }
  else
  {

    uint64_t v18 = sub_100015E00();
    v19(v18);
  }
  uint64_t v20 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_multiplayerViewController;
  NSString v21 = *(void **)(v1
                 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_multiplayerViewController);
  if (!v21) {
    goto LABEL_51;
  }
  if ((([v21 isHosted] | v52) & 1) != 0
    || (id v22 = (unsigned char *)(v1
                      + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_isEntitledToUseGroupActivities),
        sub_100015B58(),
        *v22 != 1)
    || (char v23 = (void *)(v1
                       + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_originalMatchmakingMode),
        sub_100015B58(),
        (unint64_t)(*v23 - 1) < 2))
  {
LABEL_21:
    uint64_t v29 = (void *)(v1
                   + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_originalMatchmakingMode);
    sub_100015B58();
    if (*v29 == 2) {
      goto LABEL_25;
    }
    uint64_t v30 = *(void **)(v1 + v20);
    if (!v30)
    {
LABEL_53:
      __break(1u);
      goto LABEL_54;
    }
    id v31 = objc_allocWithZone((Class)type metadata accessor for InviteFriendsModeChiclet());
    id v32 = sub_10000A140(v30);
    sub_10000FF48((uint64_t)v32);
    uint64_t v33 = *(void **)(v1
                   + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_inviteFriendsModeChiclet);
    if (!v33)
    {
LABEL_54:
      __break(1u);
      goto LABEL_55;
    }
    sub_100015E6C();
    v33;
    sub_1000162C0();
    sub_10000EBE0(*(void *)((*(void *)v6 & 0xFFFFFFFFFFFFFF8) + 0x10));
    sub_100016310();
    sub_1000162F0();
    swift_endAccess();
    if ((*v29 | 2) != 3)
    {
LABEL_25:
      id v34 = [self shared];
      if (!v34)
      {
LABEL_52:
        __break(1u);
        goto LABEL_53;
      }
      id v35 = v34;
      id v36 = [v34 multiplayerAllowedPlayerType];

      if (v36 == (id)2)
      {
        uint64_t v37 = *(void **)(v1 + v20);
        if (!v37)
        {
LABEL_55:
          __break(1u);
          goto LABEL_56;
        }
        id v38 = objc_allocWithZone((Class)type metadata accessor for QuickMatchModeChiclet());
        id v39 = sub_10000EC34(v37);
        sub_10000FF54((uint64_t)v39);
        id v40 = *(void **)(v1
                       + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_quickMatchModeChiclet);
        if (!v40)
        {
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          goto LABEL_58;
        }
        sub_100015E6C();
        id v41 = v40;
        sub_1000162C0();
        sub_100015FC0();
        sub_100016310();
        sub_1000162F0();
        swift_endAccess();
      }
    }
    sub_1000127E8(0);
    if (*(void *)v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_100016530();
      swift_bridgeObjectRelease();
      if (v48)
      {
LABEL_32:
        if (*(unsigned char *)(v1
                      + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_canUpdateChiclets) != 1)
        {
LABEL_45:
          sub_100015C08();
          return;
        }
        uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
        if (!Strong) {
          goto LABEL_57;
        }
        id v43 = Strong;
        [Strong reloadData];

        unint64_t v44 = *(void *)v6;
        if (v44 >> 62)
        {
          sub_100015D28();
          uint64_t v1 = sub_100016530();
          if (v1) {
            goto LABEL_36;
          }
        }
        else
        {
          uint64_t v1 = *(void *)((v44 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (v1)
          {
LABEL_36:
            if (v1 >= 1)
            {
              for (uint64_t i = 0; i != v1; ++i)
              {
                if ((v44 & 0xC000000000000001) != 0) {
                  uint64_t v46 = (void *)sub_1000164E0();
                }
                else {
                  uint64_t v46 = *(id *)(v44 + 8 * i + 32);
                }
                id v47 = v46;
                (*(void (**)(uint64_t))((swift_isaMask & *v46) + 0xF8))(1);
              }
              goto LABEL_42;
            }
            __break(1u);
            goto LABEL_50;
          }
        }
LABEL_42:
        swift_bridgeObjectRelease();
        goto LABEL_45;
      }
    }
    else if (*(void *)((*(void *)v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_32;
    }
    id v49 = sub_1000123E0();
    sub_1000127E8(v49);
    goto LABEL_45;
  }
  char v24 = *(void **)(v1 + v20);
  if (!v24)
  {
LABEL_59:
    __break(1u);
    goto LABEL_60;
  }
  type metadata accessor for SharePlayModeChiclet();
  char v25 = (char *)(v1
               + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_isEligibleForGroupSession);
  sub_100015B58();
  uint64_t v26 = sub_100005C00(v24, *v25);
  sub_10000FF3C((uint64_t)v26);
  id v27 = *(void **)(v1
                 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_sharePlayModeChiclet);
  if (v27)
  {
    sub_100015E6C();
    id v28 = v27;
    sub_1000162C0();
    sub_100015FC0();
    sub_100016310();
    sub_1000162F0();
    swift_endAccess();
    goto LABEL_21;
  }
LABEL_60:
  __break(1u);
}

id sub_1000123E0()
{
  id v0 = objc_msgSend(objc_allocWithZone((Class)UILabel), "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  sub_100015CD8();
  uint64_t v1 = sub_100016290();
  sub_10001582C(v1, v2, v0, (SEL *)&selRef_setText_);
  id v3 = [self preferredFontForTextStyle:UIFontTextStyleTitle3];
  [v0 setFont:v3];

  [v0 setTextAlignment:1];
  id v4 = [self tertiaryLabelColor];
  [v0 setTextColor:v4];

  id v5 = [v0 layer];
  [v5 setCompositingFilter:kCAFilterPlusL];

  return v0;
}

void sub_100012524(void *a1)
{
  id v3 = [v1 view];

  if (!v3) {
    return;
  }
  [a1 removeFromSuperview];
  uint64_t v4 = OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_emptyStateView;
  id v5 = *(void **)&v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_emptyStateView];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v1 view];
    if (!v7)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    NSString v8 = v7;
    [v7 addSubview:v6];

    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v9 = [v6 centerXAnchor];
    id v10 = [v1 view];
    if (!v10)
    {
LABEL_17:
      __break(1u);
      goto LABEL_18;
    }
    os_log_type_t v11 = v10;
    id v12 = [v10 centerXAnchor];

    id v13 = [v9 constraintEqualToAnchor:v12];
    [v13 setActive:1];

    id v14 = [v6 centerYAnchor];
    id v15 = [v1 view];
    if (!v15)
    {
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    unint64_t v16 = v15;
    id v17 = [v15 centerYAnchor];

    id v18 = [v14 constraintEqualToAnchor:v17];
    [v18 setActive:1];

    [v6 setAutoresizingMask:18];
  }
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();

  if (Strong)
  {
    uint64_t v20 = (void *)swift_unknownObjectWeakLoadStrong();
    if (!v20)
    {
LABEL_19:
      __break(1u);
      return;
    }
    NSString v21 = v20;
    [v20 setHidden:*(void *)&v1[v4] != 0];
  }
  id v22 = [v1 view];
  if (!v22)
  {
    __break(1u);
    goto LABEL_16;
  }
  id v23 = v22;
  [v22 setNeedsLayout];
}

void sub_1000127E8(void *a1)
{
  uint64_t v2 = *(void **)(v1
                + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_emptyStateView);
  *(void *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_emptyStateView) = a1;
  id v3 = a1;
  sub_100012524(v2);
}

void static MultiplayerModeSelectionViewController.viewController(request:game:multiplayerViewController:dismissHandler:)()
{
  sub_100015CC0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  id v5 = v4;
  id v7 = v6;
  id v9 = v8;
  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v11 = [self bundleForClass:ObjCClassFromMetadata];
  type metadata accessor for MultiplayerModeSelectionViewController();
  sub_100015CD8();
  NSString v12 = sub_100016250();
  id v13 = [ObjCClassFromMetadata _gkPlatformNibNameForBaseName:v12];

  uint64_t v14 = sub_100016270();
  uint64_t v16 = v15;

  id v17 = v11;
  MultiplayerModeSelectionShimViewController.__allocating_init(nibName:bundle:)(v14, v16, v11);
  id v18 = v9;
  sub_10000EF54((uint64_t)v9);
  id v19 = v7;
  sub_10000EF60((uint64_t)v7);
  id v20 = v5;
  sub_10000EF6C((uint64_t)v5);
  MultiplayerModeSelectionViewController.originalMatchmakingMode.setter((uint64_t)[v20 matchmakingMode]);
  if (v3)
  {
    swift_retain();
    sub_10000FE38(v3, v1);
  }

  sub_100015C08();
}

id _s29GameCenterMatchmakerExtension42MultiplayerModeSelectionShimViewControllerC7nibName6bundleACSSSg_So8NSBundleCSgtcfC_0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_100016250();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void sub_100012B04()
{
  *(CFAbsoluteTime *)(v0
                    + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_lastBackgroundTimestamp) = CFAbsoluteTimeGetCurrent();
}

CFAbsoluteTime sub_100012B88()
{
  CFAbsoluteTime result = CFAbsoluteTimeGetCurrent()
         - *(double *)(v0
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_lastBackgroundTimestamp)
         + *(double *)(v0
                     + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_startTime);
  *(CFAbsoluteTime *)(v0
                    + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_startTime) = result;
  return result;
}

void sub_100012C24()
{
  sub_100015CC0();
  uint64_t v2 = v1;
  sub_1000161C0();
  sub_10000DD44();
  __chkstk_darwin(v3);
  sub_100015BAC();
  if ([v2 isEqual:*(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_sharePlayModeChiclet]]|| objc_msgSend(v2, "isEqual:", *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_inviteFriendsModeChiclet])|| objc_msgSend(v2, "isEqual:", *(void *)&v0[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_quickMatchModeChiclet]))
  {
    [objc_allocWithZone((Class)GKAPIReporter) init];
    NSString v4 = sub_100015C20();
    NSString v5 = sub_100016250();
    NSString v6 = sub_100016250();
    NSString v7 = sub_100015C9C();
    NSString v8 = sub_100015BC4();
    sub_100015DDC(v0, "recordClickWithAction:targetId:targetType:pageId:pageType:");
  }
  else
  {
    sub_1000161A0();
    id v10 = v2;
    id v11 = sub_1000161B0();
    os_log_type_t v12 = sub_100016340();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)sub_100015E54();
      id v17 = (void *)swift_slowAlloc();
      id v18 = v13;
      *(_DWORD *)id v13 = 138412290;
      uint64_t v14 = v10;
      sub_100016400();
      *id v17 = v10;

      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Cannot find chiclet: %@", v18, 0xCu);
      sub_100007328(&qword_100029830);
      swift_arrayDestroy();
      sub_100015BF0();
      sub_100015BF0();
    }
    else
    {

      id v11 = v10;
    }

    uint64_t v15 = sub_100015E00();
    v16(v15);
  }
  sub_100015C60();
  v9();
  sub_100015C08();
}

id MultiplayerModeSelectionViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v6 = &v3[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_edgeInsets];
  __asm { FMOV            V0.2D, #16.0 }
  *(_OWORD *)NSString v6 = _Q0;
  *((_OWORD *)v6 + 1) = _Q0;
  os_log_type_t v12 = v3;
  int ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
  double v14 = 16.0;
  if (ShouldUsePadUI) {
    double v14 = 24.0;
  }
  *(double *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chicletSpacing] = v14;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chicletSpacingIPhonePotrait] = 0x4024000000000000;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chiclets] = &_swiftEmptyArrayStorage;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_matchRequest] = 0;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_game] = 0;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_multiplayerViewController] = 0;
  v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_skipModeSelection] = 0;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_originalMatchmakingMode] = 0;
  v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_isEligibleForGroupSession] = 0;
  v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_isEntitledToUseGroupActivities] = 0;
  v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_canUpdateChiclets] = 0;
  uint64_t v15 = &v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_dismissHandler];
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_startTime] = 0;
  swift_unknownObjectWeakInit();
  sub_100015C74(OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_cellReuseIdentifier);
  sub_100015D68(OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_cellReuseIdentifierAX);
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_kvoToken] = 0;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_sharePlayModeChiclet] = 0;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_inviteFriendsModeChiclet] = 0;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_quickMatchModeChiclet] = 0;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_lastBackgroundTimestamp] = 0;
  *(void *)&v12[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_emptyStateView] = 0;

  if (a2)
  {
    NSString v16 = sub_100016250();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v16 = 0;
  }
  v19.receiver = v12;
  v19.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
  id v17 = objc_msgSendSuper2(&v19, "initWithNibName:bundle:", v16, a3);

  return v17;
}

uint64_t sub_10001316C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t, uint64_t, void *))
{
  if (a3)
  {
    uint64_t v7 = sub_100016270();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a4;
  return a5(v7, v9, a4);
}

id MultiplayerModeSelectionViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id MultiplayerModeSelectionViewController.init(coder:)(void *a1)
{
  id v3 = &v1[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_edgeInsets];
  __asm { FMOV            V0.2D, #16.0 }
  *(_OWORD *)id v3 = _Q0;
  *((_OWORD *)v3 + 1) = _Q0;
  uint64_t v9 = v1;
  int ShouldUsePadUI = GKIsXRUIIdiomShouldUsePadUI();
  double v11 = 16.0;
  if (ShouldUsePadUI) {
    double v11 = 24.0;
  }
  *(double *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chicletSpacing] = v11;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chicletSpacingIPhonePotrait] = 0x4024000000000000;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chiclets] = &_swiftEmptyArrayStorage;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_matchRequest] = 0;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_game] = 0;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_multiplayerViewController] = 0;
  v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_skipModeSelection] = 0;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_originalMatchmakingMode] = 0;
  v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_isEligibleForGroupSession] = 0;
  v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_isEntitledToUseGroupActivities] = 0;
  v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_canUpdateChiclets] = 0;
  os_log_type_t v12 = &v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_dismissHandler];
  *(void *)os_log_type_t v12 = 0;
  *((void *)v12 + 1) = 0;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_startTime] = 0;
  swift_unknownObjectWeakInit();
  sub_100015C74(OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_cellReuseIdentifier);
  sub_100015D68(OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_cellReuseIdentifierAX);
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_kvoToken] = 0;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_sharePlayModeChiclet] = 0;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_inviteFriendsModeChiclet] = 0;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_quickMatchModeChiclet] = 0;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_lastBackgroundTimestamp] = 0;
  *(void *)&v9[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_emptyStateView] = 0;

  v15.receiver = v9;
  v15.super_class = (Class)type metadata accessor for MultiplayerModeSelectionViewController();
  id v13 = objc_msgSendSuper2(&v15, "initWithCoder:", a1);

  return v13;
}

Swift::Int __swiftcall MultiplayerModeSelectionViewController.collectionView(_:numberOfItemsInSection:)(UICollectionView _, Swift::Int numberOfItemsInSection)
{
  id v3 = (unint64_t *)(v2
                          + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chiclets);
  sub_100015B58();
  unint64_t v4 = *v3;
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  sub_100015D28();
  Swift::Int v5 = sub_100016530();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t MultiplayerModeSelectionViewController.indexPathForPreferredFocusedView(in:)@<X0>(uint64_t a1@<X8>)
{
  sub_100016160();
  uint64_t v2 = sub_100016180();

  return sub_100007B00(a1, 0, 1, v2);
}

uint64_t MultiplayerModeSelectionViewController.collectionView(_:cellForItemAt:)(void *a1)
{
  uint64_t v2 = v1;
  id v4 = [self currentTraitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  sub_1000163C0();
  swift_bridgeObjectRetain();
  NSString v6 = sub_100016250();
  swift_bridgeObjectRelease();
  Class isa = sub_100016140().super.isa;
  id v8 = [a1 dequeueReusableCellWithReuseIdentifier:v6 forIndexPath:isa];

  type metadata accessor for ChicletCell();
  uint64_t v9 = swift_dynamicCastClass();
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = v8;
    unint64_t v12 = sub_100016170();
    id v13 = (uint64_t *)(v2
                    + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chiclets);
    sub_100015B58();
    uint64_t v14 = *v13;
    unint64_t v15 = *v13 & 0xC000000000000001;
    sub_100015784(v12, v15 == 0, *v13);
    if (v15)
    {
      swift_bridgeObjectRetain();
      NSString v16 = (void *)sub_1000164E0();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v16 = *(id *)(v14 + 8 * v12 + 32);
    }
    (*(void (**)(void *))((swift_isaMask & *v16) + 0x100))(v10);

    unint64_t v17 = sub_100016170();
    uint64_t v18 = *v13;
    unint64_t v19 = *v13 & 0xC000000000000001;
    sub_100015784(v17, v19 == 0, *v13);
    if (v19)
    {
      swift_bridgeObjectRetain();
      id v20 = (unsigned __int8 *)sub_1000164E0();
      swift_bridgeObjectRelease();
    }
    else
    {
      id v20 = (unsigned __int8 *)*(id *)(v18 + 8 * v17 + 32);
    }
    int v21 = v20[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_initialAppearance];

    if (v21 == 1)
    {
      unint64_t v22 = sub_100016170();
      uint64_t v23 = *v13;
      unint64_t v24 = *v13 & 0xC000000000000001;
      sub_100015784(v22, v24 == 0, v23);
      if (v24)
      {
        swift_bridgeObjectRetain();
        char v25 = (unsigned char *)sub_1000164E0();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v25 = *(id *)(v23 + 8 * v22 + 32);
      }
      v25[OBJC_IVAR____TtC29GameCenterMatchmakerExtension23BasicChicletCoordinator_initialAppearance] = 0;

      id v26 = [v10 layer];
      [v26 position];
      uint64_t v28 = v27;

      id v29 = [v10 layer];
      [v29 setOpacity:0.0];

      id v30 = [v10 layer];
      [v30 position];
      objc_msgSend(v30, "setPosition:");

      self;
      sub_100016170();
      uint64_t v31 = swift_allocObject();
      *(void *)(v31 + 16) = v10;
      uint64_t v46 = sub_100015958;
      uint64_t v47 = v31;
      aBlock = _NSConcreteStackBlock;
      uint64_t v43 = 1107296256;
      unint64_t v44 = sub_100006EBC;
      objc_super v45 = &unk_100020F60;
      id v32 = _Block_copy(&aBlock);
      id v33 = v11;
      swift_release();
      id v34 = (void *)sub_100015F5C();
      [v34 v35];
      _Block_release(v32);
      sub_100016170();
      uint64_t v36 = swift_allocObject();
      *(void *)(v36 + 16) = v10;
      *(void *)(v36 + 24) = v28;
      uint64_t v46 = sub_1000159B0;
      uint64_t v47 = v36;
      aBlock = _NSConcreteStackBlock;
      uint64_t v43 = 1107296256;
      unint64_t v44 = sub_100006EBC;
      objc_super v45 = &unk_100020FB0;
      uint64_t v37 = _Block_copy(&aBlock);
      id v38 = v33;
      swift_release();
      id v39 = (void *)sub_100015F5C();
      [v39 v40];

      _Block_release(v37);
    }
    else
    {
    }
    return (uint64_t)v10;
  }
  else
  {
    uint64_t result = sub_100016520();
    __break(1u);
  }
  return result;
}

void sub_100013B90(void *a1)
{
  id v2 = [a1 layer];
  LODWORD(v1) = 1.0;
  [v2 setOpacity:v1];
}

void sub_100013BE8(void *a1)
{
  id v1 = [a1 layer];
  [v1 position];
  objc_msgSend(v1, "setPosition:");
}

void MultiplayerModeSelectionViewController.collectionView(_:didSelectItemAt:)()
{
  uint64_t v1 = v0;
  unint64_t v2 = sub_100016170();
  id v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chiclets);
  sub_100015B58();
  uint64_t v4 = *v3;
  sub_100015784(v2, (v4 & 0xC000000000000001) == 0, v4);
  if ((v4 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v5 = (id)sub_1000164E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = *(id *)(v4 + 8 * v2 + 32);
  }
  sub_100012C24();
}

void MultiplayerModeSelectionViewController.collectionView(_:layout:sizeForItemAt:)(void *a1)
{
  if (GKIsXRUIIdiomShouldUsePadUI())
  {
    id v3 = [v1 view];
    if (v3)
    {
      [v3 frame];
      sub_100015F88();
      fmin(sub_100015D48() + -20.0, 335.0);
      id v4 = [self currentTraitCollection];
      id v5 = [v4 preferredContentSizeCategory];

      sub_100016270();
      if (&_s10Foundation21NSKeyValueObservationC10invalidateyyFTj_ptr != (_UNKNOWN **)sub_100015B90() || v4 != v6)
      {
        sub_100015B30();
        sub_100015D84();
        swift_bridgeObjectRelease();
        if (&_s10Foundation21NSKeyValueObservationC10invalidateyyFTj_ptr) {
          goto LABEL_70;
        }
        sub_100016270();
        if (&_s10Foundation21NSKeyValueObservationC10invalidateyyFTj_ptr != (_UNKNOWN **)sub_100015B90() || v4 != v8)
        {
          sub_100015B30();
          sub_100015D84();
          swift_bridgeObjectRelease();
          if (&_s10Foundation21NSKeyValueObservationC10invalidateyyFTj_ptr) {
            goto LABEL_70;
          }
          sub_100016270();
          if (&_s10Foundation21NSKeyValueObservationC10invalidateyyFTj_ptr != (_UNKNOWN **)sub_100015B90() || v4 != v10)
          {
            sub_100015B30();
            sub_100015D84();
            swift_bridgeObjectRelease();
            if ((&_s10Foundation21NSKeyValueObservationC10invalidateyyFTj_ptr & 1) == 0)
            {
              sub_100016270();
              if (&_s10Foundation21NSKeyValueObservationC10invalidateyyFTj_ptr != (_UNKNOWN **)sub_100015B90()
                || v4 != v12)
              {
                sub_100015B70();
              }
LABEL_73:

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              return;
            }
            goto LABEL_70;
          }
          goto LABEL_69;
        }
        goto LABEL_63;
      }
      goto LABEL_51;
    }
    __break(1u);
    goto LABEL_76;
  }
  uint64_t v14 = self;
  id v15 = [v14 currentTraitCollection];
  id v16 = [v15 preferredContentSizeCategory];

  uint64_t v17 = sub_1000163C0();
  if (v17)
  {
    if (!sub_1000159BC())
    {
      if (!sub_100011A3C())
      {
        [a1 frame];
        CGRectGetWidth(v49);
        id v45 = [v1 view];
        if (v45)
        {
          uint64_t v46 = v45;
          [v45 safeAreaInsets];

          id v47 = [v1 view];
          if (v47)
          {
            uint64_t v48 = v47;
            [v47 safeAreaInsets];

            return;
          }
          goto LABEL_79;
        }
LABEL_78:
        __break(1u);
LABEL_79:
        __break(1u);
        return;
      }
      id v19 = [v1 view];
      if (v19)
      {
        id v20 = v19;
        [v19 frame];

        fmin(sub_100015D48() + -20.0, 335.0);
        id v21 = [v14 currentTraitCollection];
        id v5 = [v21 preferredContentSizeCategory];

        sub_100016270();
        if (v17 != sub_100015B90() || v21 != v22)
        {
          sub_100015B30();
          sub_100015D84();
          swift_bridgeObjectRelease();
          if (v17) {
            goto LABEL_70;
          }
          sub_100016270();
          if (v17 != sub_100015B90() || v21 != v24)
          {
            sub_100015B30();
            sub_100015D84();
            swift_bridgeObjectRelease();
            if (v17) {
              goto LABEL_70;
            }
            sub_100016270();
            if (v17 != sub_100015B90() || v21 != v26)
            {
              sub_100015B30();
              sub_100015D84();
              swift_bridgeObjectRelease();
              if ((v17 & 1) == 0)
              {
                sub_100016270();
                if (v17 != sub_100015B90() || v21 != v28) {
                  sub_100015B70();
                }
                goto LABEL_73;
              }
LABEL_70:

              return;
            }
LABEL_69:
            sub_100015FA8();
            goto LABEL_70;
          }
LABEL_63:
          sub_100015FA8();
          goto LABEL_70;
        }
LABEL_51:
        sub_100015FA8();
        goto LABEL_70;
      }
LABEL_77:
      __break(1u);
      goto LABEL_78;
    }
  }
  else
  {
    if (sub_100011A3C())
    {
      id v18 = [v1 view];
      if (v18)
      {
        [v18 frame];
        sub_100015F88();
        fmin(sub_100015D48() + -20.0, 335.0);
        return;
      }
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
    id v30 = [v1 traitCollection];
    id v31 = [v30 preferredContentSizeCategory];

    uint64_t v32 = sub_100016270();
    uint64_t v34 = v33;
    if (v32 == sub_100016270() && v34 == v35)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v37 = sub_100016550();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v37 & 1) == 0)
      {
        id v38 = [v1 traitCollection];
        id v39 = [v38 preferredContentSizeCategory];

        uint64_t v40 = sub_100016270();
        uint64_t v42 = v41;
        if (v40 == sub_100016270() && v42 == v43)
        {

          sub_100015FA8();
        }
        else
        {
          sub_100015B30();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
    }
  }
}

double MultiplayerModeSelectionViewController.collectionView(_:layout:minimumLineSpacingForSectionAt:)()
{
  BOOL v1 = sub_100011A3C();
  unint64_t v2 = &OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chicletSpacingIPhonePotrait;
  if (!v1) {
    unint64_t v2 = &OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chicletSpacing;
  }
  return *(double *)(v0 + *v2);
}

void MultiplayerModeSelectionViewController.collectionView(_:layout:insetForSectionAt:)(void *a1, uint64_t a2, uint64_t a3)
{
  id v5 = v3;
  uint64_t v9 = sub_100016180();
  sub_10000DD44();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_100015BAC();
  sub_100016160();
  Class isa = sub_100016140().super.isa;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v3, v9);
  [v3 collectionView:a1 layout:a2 sizeForItemAtIndexPath:isa];
  double v15 = v14;
  double v17 = v16;

  [v3 collectionView:a1 layout:a2 minimumLineSpacingForSectionAtIndex:a3];
  double v19 = v18;
  if (sub_100011A3C())
  {
    id v20 = &v3[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chiclets];
    sub_100015B58();
    unint64_t v21 = *(void *)v20;
    if (*(void *)v20 >> 62)
    {
      sub_100015F24();
      id v22 = (char *)sub_100016530();
      swift_bridgeObjectRelease();
      unint64_t v21 = *(void *)v20;
    }
    else
    {
      id v22 = *(char **)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    if (v21 >> 62)
    {
      sub_100015D08();
      uint64_t v23 = sub_100016530();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v23 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    id v24 = (char **)(v23 - 1);
    if (!__OFSUB__(v23, 1))
    {
      id v25 = sub_100015C48();
      if (v25)
      {
        [v25 frame];
        sub_100015F04();
        v70.origin.x = sub_100015EF0();
        CGRectGetHeight(v70);
        id v26 = sub_100015C48();
        if (v26)
        {
          uint64_t v27 = v26;
          sub_100015DC4(v17 * (double)(uint64_t)v22);
          [v28 safeAreaInsets];

          id v29 = sub_100015C48();
          if (v29)
          {
            sub_100015F70(v29);

            [a1 frame];
            double Width = CGRectGetWidth(v71);
            id v31 = sub_100015C48();
            if (v31)
            {
              sub_100015F70(v31);

              id v32 = sub_100015C48();
              if (v32)
              {
                uint64_t v33 = v32;
                double v34 = (Width - v15) * 0.5;
                [v32 safeAreaInsets];
                double v36 = v35;

                sub_100015EA4(v34 - v36);
                return;
              }
              goto LABEL_49;
            }
LABEL_48:
            __break(1u);
LABEL_49:
            __break(1u);
            goto LABEL_50;
          }
LABEL_47:
          __break(1u);
          goto LABEL_48;
        }
LABEL_46:
        __break(1u);
        goto LABEL_47;
      }
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    __break(1u);
    goto LABEL_41;
  }
  if (sub_100011AD4())
  {
    id v24 = &selRef_multiplayerP2PViewController_didFinishWithError_;
    [a1 frame];
    double v37 = CGRectGetWidth(v72) - (v19 + v19);
    double v38 = floor(v37 / (v15 + v19));
    if (v19 * v38 + v15 * (v38 + 1.0) > v37) {
      double v4 = v38;
    }
    else {
      double v4 = v38 + 1.0;
    }
    id v22 = &v3[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chiclets];
    sub_100015B58();
    if (!(*(void *)v22 >> 62))
    {
      uint64_t v39 = *(void *)((*(void *)v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_19;
    }
LABEL_41:
    sub_100015D08();
    uint64_t v39 = sub_100016530();
    swift_bridgeObjectRelease();
LABEL_19:
    double v40 = (double)v39;
    if (v4 <= (double)v39) {
      double v40 = v4;
    }
    objc_msgSend(a1, v24[87], *(void *)&v40);
    CGRectGetWidth(v73);
    if (*(void *)v22 >> 62)
    {
      sub_100015ED0();
      sub_100016530();
      swift_bridgeObjectRelease();
    }
    id v41 = [v5 view];
    if (v41)
    {
      uint64_t v42 = v41;
      [v41 v24[87]];
      CGFloat v44 = v43;
      CGFloat v46 = v45;
      CGFloat v48 = v47;
      CGFloat v50 = v49;

      v74.origin.x = v44;
      v74.origin.y = v46;
      v74.size.width = v48;
      v74.size.height = v50;
      CGRectGetHeight(v74);
      id v51 = [v5 view];
      if (v51)
      {
        BOOL v52 = v51;
        [v51 safeAreaInsets];

        id v53 = [v5 view];
        if (v53)
        {
          id v54 = v53;
          [v53 safeAreaInsets];

          return;
        }
        goto LABEL_52;
      }
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  unint64_t v55 = &v3[OBJC_IVAR____TtC29GameCenterMatchmakerExtension38MultiplayerModeSelectionViewController_chiclets];
  sub_100015B58();
  unint64_t v56 = *(void *)v55;
  if (*(void *)v55 >> 62)
  {
    sub_100015F24();
    id v57 = (void *)sub_100016530();
    swift_bridgeObjectRelease();
    unint64_t v56 = *(void *)v55;
  }
  else
  {
    id v57 = *(void **)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v56 >> 62)
  {
    sub_100015D08();
    uint64_t v58 = sub_100016530();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v58 = *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (__OFSUB__(v58, 1))
  {
    __break(1u);
    goto LABEL_45;
  }
  id v59 = sub_100015C48();
  if (!v59)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  [v59 frame];
  sub_100015F04();
  v75.origin.x = sub_100015EF0();
  CGRectGetWidth(v75);
  id v60 = sub_100015C48();
  if (!v60)
  {
LABEL_54:
    __break(1u);
    goto LABEL_55;
  }
  uint64_t v61 = v60;
  sub_100015DC4(v15 * (double)(uint64_t)v57);
  [v62 safeAreaInsets];

  id v63 = sub_100015C48();
  if (!v63)
  {
LABEL_55:
    __break(1u);
    goto LABEL_56;
  }
  sub_100015F70(v63);

  [a1 frame];
  double Height = CGRectGetHeight(v76);
  id v65 = sub_100015C48();
  if (!v65)
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  sub_100015F70(v65);

  id v66 = sub_100015C48();
  if (v66)
  {
    uint64_t v67 = v66;
    [v66 safeAreaInsets];
    double v69 = v68;

    sub_100015EA4((Height - v17) * 0.5 - v69);
    return;
  }
LABEL_57:
  __break(1u);
}

uint64_t sub_100014F4C(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

BOOL sub_100014F54(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_100014F80(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_100014F90(uint64_t result)
{
  *v1 &= result;
  return result;
}

uint64_t sub_100014FA4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001509C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000D918((uint64_t)v12, *a3);
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
      sub_10000D918((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100015AD0((uint64_t)v12);
  return v7;
}

uint64_t type metadata accessor for MultiplayerModeSelectionViewController()
{
  return self;
}

uint64_t sub_10001509C(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1000151F4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_100016410();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_1000152CC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_1000164F0();
    if (!v8)
    {
      uint64_t result = sub_100016510();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_1000151F4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100016540();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_1000152CC(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = sub_100015364(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    unint64_t v2 = sub_100015540(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    unint64_t v2 = sub_100015540((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100015364(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_1000162B0();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_1000154D8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_1000164D0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_100016540();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_100016510();
  __break(1u);
  return result;
}

void *sub_1000154D8(uint64_t a1, uint64_t a2)
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
  sub_100007328(&qword_100029858);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_100015540(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100007328(&qword_100029858);
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
  id v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1000156F0(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100015618(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100015618(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_100016540();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_1000156F0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_100016540();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_100015784(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_1000157A8(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t sub_1000157B4(void *a1)
{
  id v2 = [a1 recipients];

  if (!v2) {
    return 0;
  }
  sub_100007618(0, &qword_100029848);
  uint64_t v3 = sub_1000162E0();

  return v3;
}

void sub_10001582C(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  NSString v6 = sub_100016250();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);
}

uint64_t sub_100015898()
{
  uint64_t v0 = sub_100016270();
  uint64_t v2 = v1;
  if (v0 == sub_100016270() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_100016550();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100015920()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100015958()
{
  sub_100013B90(*(void **)(v0 + 16));
}

uint64_t sub_100015960(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100015970()
{
  return swift_release();
}

uint64_t sub_100015978()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000159B0()
{
  sub_100013BE8(*(void **)(v0 + 16));
}

BOOL sub_1000159BC()
{
  uint64_t v0 = +[UIDevice currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  return v1 == (id)1;
}

uint64_t sub_100015A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100015A28(uint64_t a1)
{
  uint64_t v2 = sub_100007328(&qword_100029828);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100015A88()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100015AC0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100015AD0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100015B30()
{
  return sub_100016550();
}

uint64_t sub_100015B58()
{
  return swift_beginAccess();
}

uint64_t sub_100015B70()
{
  return sub_100016550();
}

uint64_t sub_100015B90()
{
  return sub_100016270();
}

NSString sub_100015BC4()
{
  return sub_100016250();
}

uint64_t sub_100015BF0()
{
  return swift_slowDealloc();
}

NSString sub_100015C20()
{
  return sub_100016250();
}

id sub_100015C48()
{
  uint64_t v3 = *(const char **)(v1 + 1576);
  return [v0 v3];
}

void sub_100015C74(uint64_t a1@<X8>)
{
  uint64_t v2 = (void *)(v1 + a1);
  void *v2 = 0x4374656C63696843;
  v2[1] = 0xEB000000006C6C65;
}

NSString sub_100015C9C()
{
  return sub_100016250();
}

uint64_t sub_100015CE4()
{
  return v0;
}

uint64_t sub_100015D08()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100015D28()
{
  return swift_bridgeObjectRetain();
}

double sub_100015D48()
{
  uint64_t v5 = v1;
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  return CGRectGetWidth(*(CGRect *)&v5);
}

void sub_100015D68(uint64_t a1@<X8>)
{
  uint64_t v3 = (void *)(v2 + a1);
  *uint64_t v3 = v1;
  v3[1] = 0xED000058416C6C65;
}

uint64_t sub_100015D84()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100015D9C(uint64_t a1)
{
  *(void *)(v1 - 128) = a1;
  return sub_100016400();
}

double sub_100015DC4(double a1)
{
  return v3 - (a1 + v2 * (double)v1);
}

id sub_100015DDC(id a1, SEL a2)
{
  return objc_msgSend(a1, a2, v2, v3, v4, v5, v6);
}

uint64_t sub_100015E00()
{
  return v0;
}

uint64_t sub_100015E18()
{
  return swift_slowAlloc();
}

uint64_t sub_100015E30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return _swift_dynamicCastObjCClassUnconditional(a10, a1, 0, 0, 0);
}

uint64_t sub_100015E54()
{
  return swift_slowAlloc();
}

uint64_t sub_100015E6C()
{
  return swift_beginAccess();
}

void sub_100015E88(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

double sub_100015EA4(double a1)
{
  return a1 - v1;
}

void sub_100015EBC()
{
  *(void *)(v0 - 120) = 0;
  *(void *)(v0 - 112) = 0xE000000000000000;
}

uint64_t sub_100015ED0()
{
  return swift_bridgeObjectRetain();
}

double sub_100015EF0()
{
  return v0;
}

void sub_100015F04()
{
}

uint64_t sub_100015F24()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100015F44()
{
  return swift_beginAccess();
}

uint64_t sub_100015F5C()
{
  return v0;
}

id sub_100015F70(void *a1)
{
  uint64_t v3 = *(const char **)(v1 + 1584);
  return [a1 v3];
}

void sub_100015F88()
{
}

uint64_t sub_100015FA8()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_100015FC0()
{
  uint64_t v2 = *(void *)((*v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  return sub_10000EBE0(v2);
}

void sub_100015FE0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error while decoding messageFromClient archive:%@", (uint8_t *)&v2, 0xCu);
}

void sub_100016058(void *a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = [a2 localizedDescription];
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "error calling host - %@", (uint8_t *)&v5, 0xCu);
}

uint64_t sub_100016100()
{
  return dispatch thunk of NSKeyValueObservation.invalidate()();
}

NSData sub_100016110()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100016120()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016130()
{
  return type metadata accessor for UUID();
}

NSIndexPath sub_100016140()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_100016150()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016160()
{
  return IndexPath.init(item:section:)();
}

uint64_t sub_100016170()
{
  return IndexPath.item.getter();
}

uint64_t sub_100016180()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_100016190()
{
  return static GKLog.match.getter();
}

uint64_t sub_1000161A0()
{
  return static GKLog.general.getter();
}

uint64_t sub_1000161B0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000161C0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000161D0()
{
  return type metadata accessor for FocusableOptions();
}

uint64_t sub_1000161E0()
{
  return View.focusable(_:options:)();
}

uint64_t sub_1000161F0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100016200()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100016210()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100016220()
{
  return static DispatchTime.now()();
}

uint64_t sub_100016230()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_100016240()
{
  return + infix(_:_:)();
}

NSString sub_100016250()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100016260()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_100016270()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016280()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100016290()
{
  return String.localized.getter();
}

void sub_1000162A0(Swift::String a1)
{
}

Swift::Int sub_1000162B0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1000162C0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1000162D0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1000162E0()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000162F0()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100016300()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100016310()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100016320()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100016330()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100016340()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100016350()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100016360()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100016370()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t sub_100016380()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100016390()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1000163A0()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_1000163B0()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_1000163C0()
{
  return UIContentSizeCategory.isAccessibilityCategory.getter();
}

Swift::Int sub_1000163D0(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_1000163E0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1000163F0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_100016400()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100016410()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100016420()
{
  return StringProtocol.localizedUppercase.getter();
}

uint64_t sub_100016430()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100016440()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100016450()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_100016470()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_100016480()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_1000164A0()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_1000164B0()
{
  return __CocoaSet.endIndex.getter();
}

void sub_1000164C0(Swift::Int a1)
{
}

uint64_t sub_1000164D0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000164E0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000164F0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100016500()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_100016510()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100016520()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100016530()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100016540()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100016550()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t GKExtensionProtocolSecureCodedClasses()
{
  return _GKExtensionProtocolSecureCodedClasses();
}

uint64_t GKIsXRUIIdiom()
{
  return _GKIsXRUIIdiom();
}

uint64_t GKIsXRUIIdiomShouldUsePadUI()
{
  return _GKIsXRUIIdiomShouldUsePadUI();
}

uint64_t GKIsXRUIIdiomShouldUsePhoneUI()
{
  return _GKIsXRUIIdiomShouldUsePhoneUI();
}

uint64_t GKOSLoggers()
{
  return _GKOSLoggers();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return _[a1 _auxiliaryConnection];
}

id objc_msgSend__gkInternalsFromPlayers(void *a1, const char *a2, ...)
{
  return _[a1 _gkInternalsFromPlayers];
}

id objc_msgSend_acceptedInvite(void *a1, const char *a2, ...)
{
  return _[a1 acceptedInvite];
}

id objc_msgSend_applicationWillEnterForeground(void *a1, const char *a2, ...)
{
  return _[a1 applicationWillEnterForeground];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_canStartWithMinimumPlayers(void *a1, const char *a2, ...)
{
  return _[a1 canStartWithMinimumPlayers];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return _[a1 contentViewController];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentGame(void *a1, const char *a2, ...)
{
  return _[a1 currentGame];
}

id objc_msgSend_delegatedContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 delegatedContentViewController];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_excludedPlayers(void *a1, const char *a2, ...)
{
  return _[a1 excludedPlayers];
}

id objc_msgSend_existingPlayers(void *a1, const char *a2, ...)
{
  return _[a1 existingPlayers];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_extensionIsCanceling(void *a1, const char *a2, ...)
{
  return _[a1 extensionIsCanceling];
}

id objc_msgSend_groupActivityJoiningPlayer_devicePushToken_participantServerIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupActivityJoiningPlayer:devicePushToken:participantServerIdentifier:");
}

id objc_msgSend_hostObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 hostObjectProxy];
}

id objc_msgSend_hosted(void *a1, const char *a2, ...)
{
  return _[a1 hosted];
}

id objc_msgSend_initWithAcceptedInvite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAcceptedInvite:");
}

id objc_msgSend_initWithInternalRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInternalRepresentation:");
}

id objc_msgSend_initWithMatchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMatchRequest:");
}

id objc_msgSend_initWithMaxSelectable_hiddenPlayers_nearbyOnly_pickerOrigin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMaxSelectable:hiddenPlayers:nearbyOnly:pickerOrigin:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return _[a1 internal];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_inviteMessage(void *a1, const char *a2, ...)
{
  return _[a1 inviteMessage];
}

id objc_msgSend_inviterCancelled(void *a1, const char *a2, ...)
{
  return _[a1 inviterCancelled];
}

id objc_msgSend_isEligibleForGroupSession(void *a1, const char *a2, ...)
{
  return _[a1 isEligibleForGroupSession];
}

id objc_msgSend_isEntitledToUseGroupActivities(void *a1, const char *a2, ...)
{
  return _[a1 isEntitledToUseGroupActivities];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_launchSharePlayChiclet(void *a1, const char *a2, ...)
{
  return _[a1 launchSharePlayChiclet];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_matchRequest(void *a1, const char *a2, ...)
{
  return _[a1 matchRequest];
}

id objc_msgSend_matchmakingMode(void *a1, const char *a2, ...)
{
  return _[a1 matchmakingMode];
}

id objc_msgSend_maxPlayers(void *a1, const char *a2, ...)
{
  return _[a1 maxPlayers];
}

id objc_msgSend_multiplayerViewController(void *a1, const char *a2, ...)
{
  return _[a1 multiplayerViewController];
}

id objc_msgSend_navigateToSharePlayChiclet(void *a1, const char *a2, ...)
{
  return _[a1 navigateToSharePlayChiclet];
}

id objc_msgSend_nearbyPlayerHandler(void *a1, const char *a2, ...)
{
  return _[a1 nearbyPlayerHandler];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pickerOrigin(void *a1, const char *a2, ...)
{
  return _[a1 pickerOrigin];
}

id objc_msgSend_playerPickerContext(void *a1, const char *a2, ...)
{
  return _[a1 playerPickerContext];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_sendMessageToClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessageToClient:");
}

id objc_msgSend_setAcceptedInvite_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAcceptedInvite:");
}

id objc_msgSend_setAdjustTopConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustTopConstraint:");
}

id objc_msgSend_setAlwaysShowDoneButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysShowDoneButton:");
}

id objc_msgSend_setAutomatchFailedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomatchFailedWithError:");
}

id objc_msgSend_setAutomatchPlayerCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomatchPlayerCount:");
}

id objc_msgSend_setCanStartWithMinimumPlayers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanStartWithMinimumPlayers:");
}

id objc_msgSend_setConnectingStateForPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnectingStateForPlayer:");
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentViewController:");
}

id objc_msgSend_setDefaultInvitationMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultInvitationMessage:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegatedContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegatedContentViewController:");
}

id objc_msgSend_setExistingPlayers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExistingPlayers:");
}

id objc_msgSend_setGame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setGame:");
}

id objc_msgSend_setHosted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHosted:");
}

id objc_msgSend_setInviteMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInviteMessage:");
}

id objc_msgSend_setInvitesFailedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvitesFailedWithError:");
}

id objc_msgSend_setIsEligibleForGroupSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsEligibleForGroupSession:");
}

id objc_msgSend_setIsEntitledToUseGroupActivities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsEntitledToUseGroupActivities:");
}

id objc_msgSend_setMatchRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatchRequest:");
}

id objc_msgSend_setMatchmakingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMatchmakingMode:");
}

id objc_msgSend_setMultiplayerPickerDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultiplayerPickerDelegate:");
}

id objc_msgSend_setNearbyDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyDelegate:");
}

id objc_msgSend_setNearbyPlayer_reachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyPlayer:reachable:");
}

id objc_msgSend_setNearbyPlayerHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNearbyPlayerHandler:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOriginalMatchmakingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalMatchmakingMode:");
}

id objc_msgSend_setPlayer_connected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayer:connected:");
}

id objc_msgSend_setPlayer_responded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayer:responded:");
}

id objc_msgSend_setPlayer_sentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayer:sentData:");
}

id objc_msgSend_setPlayerPickerContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlayerPickerContext:");
}

id objc_msgSend_setSkipModeSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSkipModeSelection:");
}

id objc_msgSend_setSupportsNearby_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsNearby:");
}

id objc_msgSend_shareMatchWithRequest_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shareMatchWithRequest:handler:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_shouldAllowNearbyMultiplayer(void *a1, const char *a2, ...)
{
  return _[a1 shouldAllowNearbyMultiplayer];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}

id objc_msgSend_updateRecipientProperties_forPlayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRecipientProperties:forPlayer:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_viewControllerWithRequest_game_multiplayerViewController_dismissHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllerWithRequest:game:multiplayerViewController:dismissHandler:");
}