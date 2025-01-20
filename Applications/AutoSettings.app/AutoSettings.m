char *sub_100004B4C()
{
  void *v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint32_t *p_align;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  id v34;
  Swift::String v35;
  Swift::String_optional v36;
  Swift::String v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  Swift::String v47;

  v3 = v0;
  v4 = [v0 historicalNotificationUserActions];
  if (v4)
  {
    v5 = v4;
    v6 = [v4 historicalNotificationUserActions];

    sub_1000076B0(0, (unint64_t *)&unk_10002BF70);
    v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v7 >> 62)
    {
      swift_bridgeObjectRetain();
      v8 = _CocoaArrayWrapper.endIndex.getter();
      v43 = v3;
      if (v8) {
        goto LABEL_4;
      }
    }
    else
    {
      v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      v43 = v3;
      if (v8)
      {
LABEL_4:
        if (v8 < 1)
        {
          __break(1u);
LABEL_39:
          v46 = sub_100015C18(0, *((void *)v46 + 2) + 1, 1, v46);
          goto LABEL_34;
        }
        v9 = 0;
        v10 = v7 & 0xC000000000000001;
        v45 = v8;
        v46 = (char *)&_swiftEmptyArrayStorage;
        p_align = &stru_100029FE8.align;
        v44 = v7 & 0xC000000000000001;
        do
        {
          if (v10) {
            v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            v12 = *(id *)(v7 + 8 * v9 + 32);
          }
          v13 = v12;
          v14 = [v12 *((SEL *)p_align + 286)];
          if (v14)
          {
            v15 = v14;
            v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            v18 = v17;

            v19 = HIBYTE(v18) & 0xF;
            if ((v18 & 0x2000000000000000) == 0) {
              v19 = v16 & 0xFFFFFFFFFFFFLL;
            }
            if (v19)
            {
              v20 = [v13 symbolName];
              if (v20)
              {
                v21 = v20;
                v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                v24 = v23;
              }
              else
              {
                v22 = 0;
                v24 = 0;
              }
              v25 = v7;
              v26 = [v13 contentURLAction];
              if (v26)
              {
                v27 = v26;
                v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                v30 = v29;
              }
              else
              {

                v28 = 0;
                v30 = 0xE000000000000000;
              }
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                v46 = sub_100015C18(0, *((void *)v46 + 2) + 1, 1, v46);
              }
              v32 = *((void *)v46 + 2);
              v31 = *((void *)v46 + 3);
              if (v32 >= v31 >> 1) {
                v46 = sub_100015C18((char *)(v31 > 1), v32 + 1, 1, v46);
              }
              *((void *)v46 + 2) = v32 + 1;
              v33 = &v46[56 * v32];
              *((void *)v33 + 4) = v16;
              *((void *)v33 + 5) = v18;
              *((void *)v33 + 6) = v22;
              *((void *)v33 + 7) = v24;
              *((void *)v33 + 8) = v28;
              *((void *)v33 + 9) = v30;
              v33[80] = 0;
              v7 = v25;
              v10 = v44;
              v8 = v45;
              p_align = (_DWORD *)(&stru_100029FE8 + 24);
            }
            else
            {

              swift_bridgeObjectRelease();
            }
          }
          else
          {
          }
          ++v9;
        }
        while (v8 != v9);
        goto LABEL_30;
      }
    }
    v46 = (char *)&_swiftEmptyArrayStorage;
LABEL_30:
    swift_bridgeObjectRelease_n();
    v3 = v43;
    goto LABEL_31;
  }
  v46 = (char *)&_swiftEmptyArrayStorage;
LABEL_31:
  if (![v3 hasUserDismissible] || !objc_msgSend(v3, "userDismissible")) {
    return v46;
  }
  v1 = 0xD000000000000011;
  v34 = [self mainBundle];
  v35._countAndFlagsBits = 0xD000000000000013;
  v47._object = (void *)0xE000000000000000;
  v35._object = (void *)0x800000010001C3B0;
  v36.value._countAndFlagsBits = 0x747465536F747541;
  v36.value._object = (void *)0xEC00000073676E69;
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  v47._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v35, v36, (NSBundle)v34, v37, v47);

  v3 = (void *)String.init(format:_:)();
  v6 = v38;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v2 = (unint64_t)"NOTIFICATION_DELETE";
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    goto LABEL_39;
  }
LABEL_34:
  v40 = *((void *)v46 + 2);
  v39 = *((void *)v46 + 3);
  if (v40 >= v39 >> 1) {
    v46 = sub_100015C18((char *)(v39 > 1), v40 + 1, 1, v46);
  }
  *((void *)v46 + 2) = v40 + 1;
  v41 = &v46[56 * v40];
  *((void *)v41 + 4) = v3;
  *((void *)v41 + 5) = v6;
  *((void *)v41 + 6) = v1;
  *((void *)v41 + 7) = v2 | 0x8000000000000000;
  *((void *)v41 + 8) = 0;
  *((void *)v41 + 9) = 0xE000000000000000;
  v41[80] = 1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v46;
}

id sub_100004FC8()
{
  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for VSNotificationDetailViewController();
  [super viewDidLoad];
  id v1 = [self mainBundle];
  v15._object = (void *)0xE000000000000000;
  v2._object = (void *)0x800000010001C530;
  v2._countAndFlagsBits = 0xD000000000000013;
  v3.value._countAndFlagsBits = 0x747465536F747541;
  v3.value._object = (void *)0xEC00000073676E69;
  v4._countAndFlagsBits = 0;
  v4._object = (void *)0xE000000000000000;
  v15._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v2, v3, (NSBundle)v1, v4, v15);

  String.init(format:_:)();
  swift_bridgeObjectRelease();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v0 setTitle:v5];

  v6 = *(void **)&v0[direct field offset for CAFUITableViewController.tableView];
  type metadata accessor for VSNotificationActionTableCell();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v8 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v6 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v9];

  type metadata accessor for VSNotificationHeaderView();
  v10 = (objc_class *)swift_getObjCClassFromMetadata();
  v11 = NSStringFromClass(v10);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v6 registerClass:v10 forHeaderFooterViewReuseIdentifier:v12];

  [v6 setDelegate:v0];
  [v6 setDataSource:v0];
  return [*(id *)&v0[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification] registerObserver:v0];
}

void sub_10000528C(void *a1, uint64_t a2, uint64_t a3, const char **a4, void (*a5)(id))
{
  v11.receiver = a1;
  v11.super_class = (Class)type metadata accessor for VSNotificationDetailViewController();
  v8 = *a4;
  id v9 = v11.receiver;
  [super a3];
  a5(v10);
}

uint64_t sub_100005318(void *a1)
{
  type metadata accessor for VSNotificationActionTableCell();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  Swift::String v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  id v7 = [a1 dequeueReusableCellWithIdentifier:v5 forIndexPath:isa];

  uint64_t v8 = swift_dynamicCastClass();
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = IndexPath.row.getter();
    if ((v10 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else
    {
      uint64_t v11 = *(void *)(v1 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions);
      if (v10 < *(void *)(v11 + 16))
      {
        uint64_t v12 = v11 + 56 * v10;
        uint64_t v13 = *(void *)(v12 + 40);
        uint64_t v14 = *(void *)(v12 + 48);
        uint64_t v15 = *(void *)(v12 + 72);
        char v16 = *(unsigned char *)(v12 + 80);
        uint64_t v17 = v9 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction;
        uint64_t v18 = *(void *)(v9 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction);
        uint64_t v19 = *(void *)(v9 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 8);
        long long v20 = *(_OWORD *)(v12 + 56);
        *(void *)uint64_t v17 = *(void *)(v12 + 32);
        *(void *)(v17 + 8) = v13;
        *(void *)(v17 + 16) = v14;
        *(_OWORD *)(v17 + 24) = v20;
        *(void *)(v17 + 40) = v15;
        *(unsigned char *)(v17 + 48) = v16;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_100007660(v18, v19);
        sub_100018EB4();
        return v9;
      }
    }
    __break(1u);
  }

  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100005758(void *a1)
{
  Swift::String v2 = v1;
  unint64_t v4 = IndexPath.row.getter();
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v5 = OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions;
  uint64_t v6 = *(void *)&v1[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions];
  if (v4 >= *(void *)(v6 + 16))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (*(unsigned char *)(v6 + 56 * v4 + 80) == 1)
  {
    if (qword_10002BDE0 == -1)
    {
LABEL_5:
      id v7 = qword_10002D1D0;
      uint64_t v8 = v1;
      os_log_type_t v9 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v7, v9))
      {
        unint64_t v10 = (uint8_t *)swift_slowAlloc();
        uint64_t v11 = (void *)swift_slowAlloc();
        *(_DWORD *)unint64_t v10 = 138412290;
        v38 = *(void **)&v8[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification];
        id v12 = v38;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v11 = v38;

        _os_log_impl((void *)&_mh_execute_header, v7, v9, "Hiding notification %@", v10, 0xCu);
        sub_10000761C(&qword_10002C790);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      [*(id *)&v8[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification] setHidden:1];
      Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
      [a1 deselectRowAtIndexPath:isa animated:1];

      return;
    }
LABEL_29:
    swift_once();
    goto LABEL_5;
  }
  id v13 = [v1 view];
  if (!v13)
  {
    __break(1u);
LABEL_34:
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  uint64_t v14 = v13;
  id v15 = [v13 window];

  if (!v15) {
    goto LABEL_24;
  }
  id v16 = [v15 windowScene];

  if (!v16) {
    goto LABEL_24;
  }
  unint64_t v17 = IndexPath.row.getter();
  if ((v17 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v18 = *(void *)&v2[v5];
  if (v17 >= *(void *)(v18 + 16))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v19 = v18 + 56 * v17;
  uint64_t v21 = *(void *)(v19 + 64);
  unint64_t v20 = *(void *)(v19 + 72);
  type metadata accessor for CAFUIRequestContentManager();
  swift_bridgeObjectRetain();
  uint64_t v22 = static CAFUIRequestContentManager.inputStreamIdentifier(from:)();
  uint64_t v24 = v23;
  v25 = *(void **)&v2[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification];
  unint64_t v26 = IndexPath.row.getter();
  if ((v26 & 0x8000000000000000) != 0 || v26 >= 0x100) {
    goto LABEL_34;
  }
  [v25 setUserAction:v26];
  uint64_t v27 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0) {
    uint64_t v27 = v21 & 0xFFFFFFFFFFFFLL;
  }
  if (!v27)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_10002BDE0 == -1)
    {
LABEL_21:
      v34 = qword_10002D1D0;
      os_log_type_t v35 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v36 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, v35, "Empty content URL; not opening.", v36, 2u);
        swift_slowDealloc();
      }

      goto LABEL_24;
    }
LABEL_32:
    swift_once();
    goto LABEL_21;
  }
  uint64_t v28 = *(void *)&v2[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_requestContentManager];
  v29 = (void *)swift_allocObject();
  v29[2] = v21;
  v29[3] = v20;
  v29[4] = v22;
  v29[5] = v24;
  v29[6] = v2;
  v30 = a1;
  v31 = *(void (**)(uint64_t, unint64_t, id, void (*)(char), void *))(*(void *)v28
                                                                                                  + 104);
  v32 = v2;
  swift_bridgeObjectRetain();
  v31(v21, v20, v16, sub_10000760C, v29);
  a1 = v30;
  swift_release();

  swift_bridgeObjectRelease();
LABEL_24:
  os_log_t log = (os_log_t)IndexPath._bridgeToObjectiveC()().super.isa;
  [a1 deselectRowAtIndexPath:log animated:1];
}

void sub_100005CB0(char a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1)
  {
    if (qword_10002BDE0 != -1) {
      swift_once();
    }
    uint64_t v11 = qword_10002D1D0;
    swift_bridgeObjectRetain_n();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)id v13 = 136315138;
      swift_bridgeObjectRetain();
      sub_100012E98(a2, a3, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Opened url %s successfully", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      if (!a5) {
        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease_n();
      if (!a5) {
        return;
      }
    }
    unint64_t v17 = (void *)(a6 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier);
    *unint64_t v17 = a4;
    v17[1] = a5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_1000060C4();
    return;
  }
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_10002D1D0;
  swift_bridgeObjectRetain_n();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    id v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)id v16 = 136315138;
    swift_bridgeObjectRetain();
    sub_100012E98(a2, a3, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Opening url %s was not successful", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

void sub_1000060C4()
{
  if (*(void *)&v0[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier + 8]
    && (uint64_t v1 = (void *)CAFUIPunchthroughState.buttonForCurrentState(title:)((Swift::String_optional)0)) != 0)
  {
    Swift::String v2 = v1;
    [v1 addTarget:v0 action:"dismissPT" forControlEvents:64];
    id v3 = [v0 navigationItem];
    id v4 = [objc_allocWithZone((Class)UIBarButtonItem) initWithCustomView:v2];
    [v3 setRightBarButtonItem:];
  }
  else
  {
    id v4 = [v0 navigationItem];
    [v4 setRightBarButtonItem:0];
  }
}

uint64_t sub_1000061CC()
{
  unint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier + 8];
  if (v1)
  {
    uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier];
    uint64_t v3 = qword_10002BDE0;
    swift_bridgeObjectRetain();
    if (v3 != -1) {
      swift_once();
    }
    id v4 = qword_10002D1D0;
    swift_bridgeObjectRetain_n();
    os_log_type_t v5 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v4, v5))
    {
      uint64_t v6 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)uint64_t v6 = 136315138;
      swift_bridgeObjectRetain();
      sub_100012E98(v2, v1, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Requesting dismissal of PT with identifier %s", v6, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    uint64_t v11 = *(void *)&v0[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_requestContentManager];
    uint64_t v12 = swift_allocObject();
    *(void *)(v12 + 16) = v0;
    id v13 = *(void (**)(uint64_t, unint64_t, void (*)(char), uint64_t))(*(void *)v11 + 120);
    uint64_t v14 = v0;
    v13(v2, v1, sub_1000075BC, v12);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    if (qword_10002BDE0 != -1) {
      swift_once();
    }
    id v7 = qword_10002D1D0;
    os_log_type_t v8 = static os_log_type_t.default.getter();
    uint64_t result = os_log_type_enabled(v7, v8);
    if (result)
    {
      unint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Not dismissing PT - it wasn't visible.", v10, 2u);
      return swift_slowDealloc();
    }
  }
  return result;
}

void sub_1000064BC(char a1, uint64_t a2)
{
  if (a1)
  {
    if (qword_10002BDE0 != -1) {
      swift_once();
    }
    uint64_t v3 = qword_10002D1D0;
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      os_log_type_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Dismissal of PT was successful!", v5, 2u);
      swift_slowDealloc();
    }
    uint64_t v6 = (void *)(a2 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier);
    void *v6 = 0;
    v6[1] = 0;
    swift_bridgeObjectRelease();
    sub_1000060C4();
  }
  else
  {
    if (qword_10002BDE0 != -1) {
      swift_once();
    }
    id v7 = qword_10002D1D0;
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      os_log_type_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Dismissal of PT was not successful.", v9, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_100006C14()
{
}

uint64_t sub_100006C44()
{
  swift_release();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

id sub_100006CA8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VSNotificationDetailViewController();
  return [super dealloc];
}

uint64_t variable initialization expression of VSRootViewController.notificationListItem()
{
  return 0;
}

uint64_t type metadata accessor for VSNotificationDetailViewController()
{
  return self;
}

void type metadata accessor for CAFNotificationSeverity(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for CAFNotificationActionRow(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for CAFNotificationActionRow()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CAFNotificationActionRow(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  uint64_t v4 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v4;
  uint64_t v5 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v5;
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CAFNotificationActionRow(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

__n128 initializeWithTake for CAFNotificationActionRow(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for CAFNotificationActionRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for CAFNotificationActionRow(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 49)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CAFNotificationActionRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 48) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 49) = 1;
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
    *(unsigned char *)(result + 49) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CAFNotificationActionRow()
{
  return &type metadata for CAFNotificationActionRow;
}

uint64_t sub_100007020()
{
  return sub_1000078F0(&qword_10002BF68, type metadata accessor for CAFNotificationSeverity);
}

Swift::Int sub_100007068()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000070B0()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_1000070DC()
{
  Swift::UInt8 v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_100007120(uint64_t a1, uint64_t a2)
{
  return sub_100007218(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100007138()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000718C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100007200(uint64_t a1, uint64_t a2)
{
  return sub_100007218(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100007218(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000725C(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000072D4(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100007354@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

BOOL sub_100007398(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unsigned __int8 *sub_1000073AC@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_1000073BC(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000073C8()
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

uint64_t sub_100007454@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100007480@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000074C8(uint64_t a1)
{
  uint64_t v2 = sub_1000078F0((unint64_t *)&qword_10002BFB8, type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_1000078F0((unint64_t *)&unk_10002BFC0, type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100007584()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000075BC(char a1)
{
  sub_1000064BC(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000075C4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10000760C(char a1)
{
  sub_100005CB0(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48));
}

uint64_t sub_10000761C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007660(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000076B0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1000076EC(void *a1)
{
  type metadata accessor for VSNotificationHeaderView();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [a1 dequeueReusableHeaderFooterViewWithIdentifier:v5];

  if (v6)
  {
    uint64_t v7 = swift_dynamicCastClass();
    if (v7)
    {
      uint64_t v8 = v7;
      os_log_type_t v9 = *(void **)(v1 + OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification);
      unint64_t v10 = *(void **)(v7 + OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem);
      *(void *)(v7 + OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem) = v9;
      id v11 = v9;

      sub_1000198F8();
      return v8;
    }
  }
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void type metadata accessor for CAFSettingsCategory(uint64_t a1)
{
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

void sub_100007860(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000078A8()
{
  return sub_1000078F0(&qword_10002BFA0, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_1000078F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100007938()
{
  return sub_1000078F0(&qword_10002BFA8, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100007980()
{
  return sub_1000078F0(&qword_10002BFB0, type metadata accessor for LaunchOptionsKey);
}

void sub_1000079CC()
{
  id v1 = [v0 historicalNotifications];
  if (!v1) {
    return;
  }
  uint64_t v2 = v1;
  sub_1000076B0(0, &qword_10002C150);
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v3 >> 62))
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v4) {
      goto LABEL_4;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v4) {
    goto LABEL_15;
  }
LABEL_4:
  if (v4 < 1)
  {
    __break(1u);
  }
  else
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0) {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v6 = *(id *)(v3 + 8 * i + 32);
      }
      uint64_t v7 = v6;
      if ([v6 hidden])
      {
      }
      else
      {
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
      }
    }
    swift_bridgeObjectRelease();
  }
}

id sub_100007B58()
{
  id v1 = v0;
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for VSNotificationHistoryViewController();
  [super viewDidLoad];
  id v2 = [self mainBundle];
  v19._object = (void *)0xE000000000000000;
  v3._countAndFlagsBits = 0x4143494649544F4ELL;
  v3._object = (void *)0xED0000534E4F4954;
  v4.value._countAndFlagsBits = 0x747465536F747541;
  v4.value._object = (void *)0xEC00000073676E69;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v19._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v3, v4, (NSBundle)v2, v5, v19);

  String.init(format:_:)();
  swift_bridgeObjectRelease();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setTitle:v6];

  uint64_t v7 = *(void **)&v1[direct field offset for CAFUITableViewController.tableView];
  [v7 setDataSource:v1];
  [v7 setDelegate:v1];
  type metadata accessor for VSNotificationTableCell();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  static CAFUICellProtocol.reuseIdentifier.getter();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v7 registerClass:ObjCClassFromMetadata forCellReuseIdentifier:v9];

  id v10 = [*(id *)&v1[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationHistory] historicalNotifications];
  if (!v10) {
    return sub_100007E64();
  }
  id v11 = v10;
  sub_1000076B0(0, &qword_10002C150);
  unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v12 >> 62))
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    id result = (id)swift_bridgeObjectRetain();
    if (v13) {
      goto LABEL_4;
    }
LABEL_11:
    swift_bridgeObjectRelease_n();
    return sub_100007E64();
  }
  swift_bridgeObjectRetain();
  id result = (id)_CocoaArrayWrapper.endIndex.getter();
  uint64_t v13 = (uint64_t)result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_4:
  if (v13 >= 1)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if ((v12 & 0xC000000000000001) != 0) {
        id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v16 = *(id *)(v12 + 8 * i + 32);
      }
      unint64_t v17 = v16;
      [v16 registerObserver:v1];
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

id sub_100007E64()
{
  sub_1000079CC();
  unint64_t v1 = v0;
  v57 = &_swiftEmptyDictionarySingleton;
  if (v0 >> 62) {
    goto LABEL_22;
  }
  uint64_t v2 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    Swift::String v3 = &_swiftEmptyDictionarySingleton;
    uint64_t v4 = 4;
    while (1)
    {
      id v6 = (v1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(v1 + 8 * v4);
      id v7 = v6;
      uint64_t v8 = v4 - 3;
      if (__OFADD__(v4 - 4, 1)) {
        break;
      }
      Swift::UInt8 v9 = [v6 notificationSeverity];
      unint64_t v11 = sub_100013570(v9);
      uint64_t v12 = v3[2];
      BOOL v13 = (v10 & 1) == 0;
      uint64_t v14 = v12 + v13;
      if (__OFADD__(v12, v13)) {
        goto LABEL_20;
      }
      char v15 = v10;
      if (v3[3] < v14)
      {
        sub_100009674(v14, 1);
        Swift::String v3 = v57;
        unint64_t v16 = sub_100013570(v9);
        if ((v15 & 1) != (v17 & 1)) {
          goto LABEL_66;
        }
        unint64_t v11 = v16;
      }
      if (v15)
      {
        Swift::String v5 = (void *)(v3[7] + 8 * v11);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      else
      {
        sub_10000761C(&qword_10002C148);
        uint64_t v18 = swift_allocObject();
        *(_OWORD *)(v18 + 16) = xmmword_10001BE50;
        *(void *)(v18 + 32) = v7;
        v56[0] = v18;
        specialized Array._endMutation()();
        uint64_t v19 = v56[0];
        v3[(v11 >> 6) + 8] |= 1 << v11;
        *(unsigned char *)(v3[6] + v11) = v9;
        *(void *)(v3[7] + 8 * v11) = v19;
        uint64_t v20 = v3[2];
        BOOL v21 = __OFADD__(v20, 1);
        uint64_t v22 = v20 + 1;
        if (v21) {
          goto LABEL_21;
        }
        v3[2] = v22;
      }
      ++v4;
      if (v8 == v2) {
        goto LABEL_24;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  Swift::String v3 = &_swiftEmptyDictionarySingleton;
LABEL_24:
  swift_bridgeObjectRelease();
  uint64_t v23 = (uint64_t *)(v51 + OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity);
  swift_beginAccess();
  *uint64_t v23 = (uint64_t)v3;
  swift_bridgeObjectRelease();
  uint64_t v52 = *v23 + 64;
  uint64_t v24 = 1 << *(unsigned char *)(*v23 + 32);
  uint64_t v25 = -1;
  if (v24 < 64) {
    uint64_t v25 = ~(-1 << v24);
  }
  unint64_t v26 = v25 & *(void *)(*v23 + 64);
  int64_t v53 = (unint64_t)(v24 + 63) >> 6;
  uint64_t v54 = *v23;
  swift_bridgeObjectRetain();
  int64_t v27 = 0;
  while (1)
  {
    if (v26)
    {
      unint64_t v29 = __clz(__rbit64(v26));
      v26 &= v26 - 1;
      unint64_t v30 = v29 | (v27 << 6);
    }
    else
    {
      BOOL v21 = __OFADD__(v27++, 1);
      if (v21) {
        goto LABEL_64;
      }
      if (v27 >= v53)
      {
LABEL_61:
        swift_release();
        return [*(id *)(v51 + direct field offset for CAFUITableViewController.tableView) reloadData];
      }
      unint64_t v31 = *(void *)(v52 + 8 * v27);
      if (!v31)
      {
        int64_t v32 = v27 + 1;
        if (v27 + 1 >= v53) {
          goto LABEL_61;
        }
        unint64_t v31 = *(void *)(v52 + 8 * v32);
        if (!v31)
        {
          int64_t v32 = v27 + 2;
          if (v27 + 2 >= v53) {
            goto LABEL_61;
          }
          unint64_t v31 = *(void *)(v52 + 8 * v32);
          if (!v31)
          {
            int64_t v32 = v27 + 3;
            if (v27 + 3 >= v53) {
              goto LABEL_61;
            }
            unint64_t v31 = *(void *)(v52 + 8 * v32);
            if (!v31)
            {
              while (1)
              {
                int64_t v27 = v32 + 1;
                if (__OFADD__(v32, 1)) {
                  goto LABEL_65;
                }
                if (v27 >= v53) {
                  goto LABEL_61;
                }
                unint64_t v31 = *(void *)(v52 + 8 * v27);
                ++v32;
                if (v31) {
                  goto LABEL_41;
                }
              }
            }
          }
        }
        int64_t v27 = v32;
      }
LABEL_41:
      unint64_t v26 = (v31 - 1) & v31;
      unint64_t v30 = __clz(__rbit64(v31)) + (v27 << 6);
    }
    Swift::UInt8 v33 = *(unsigned char *)(*(void *)(v54 + 48) + v30);
    unint64_t v34 = *(void *)(*(void *)(v54 + 56) + 8 * v30);
    if ((v34 & 0x8000000000000000) != 0 || (v34 & 0x4000000000000000) != 0)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v35 = (uint64_t)sub_1000091C8(v34);
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v35 = v34 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain_n();
    }
    v56[0] = v35;
    sub_100009948(v56);
    swift_bridgeObjectRelease();
    uint64_t v36 = v56[0];
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v38 = *v23;
    v55 = (void *)*v23;
    *uint64_t v23 = 0x8000000000000000;
    unint64_t v40 = sub_100013570(v33);
    uint64_t v41 = *(void *)(v38 + 16);
    BOOL v42 = (v39 & 1) == 0;
    uint64_t v43 = v41 + v42;
    if (__OFADD__(v41, v42)) {
      break;
    }
    char v44 = v39;
    if (*(void *)(v38 + 24) >= v43)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        v47 = v55;
        if (v39) {
          goto LABEL_27;
        }
      }
      else
      {
        sub_100009A30();
        v47 = v55;
        if (v44) {
          goto LABEL_27;
        }
      }
    }
    else
    {
      sub_100009674(v43, isUniquelyReferenced_nonNull_native);
      unint64_t v45 = sub_100013570(v33);
      if ((v44 & 1) != (v46 & 1)) {
        goto LABEL_66;
      }
      unint64_t v40 = v45;
      v47 = v55;
      if (v44)
      {
LABEL_27:
        uint64_t v28 = v47[7];
        swift_bridgeObjectRelease();
        *(void *)(v28 + 8 * v40) = v36;
        goto LABEL_28;
      }
    }
    v47[(v40 >> 6) + 8] |= 1 << v40;
    *(unsigned char *)(v47[6] + v40) = v33;
    *(void *)(v47[7] + 8 * v40) = v36;
    uint64_t v48 = v47[2];
    BOOL v21 = __OFADD__(v48, 1);
    uint64_t v49 = v48 + 1;
    if (v21) {
      goto LABEL_63;
    }
    v47[2] = v49;
LABEL_28:
    *uint64_t v23 = (uint64_t)v47;
    swift_bridgeObjectRelease();
    swift_endAccess();
  }
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
  swift_release();
  __break(1u);
LABEL_66:
  type metadata accessor for CAFNotificationSeverity(0);
  id result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_1000083E8(unint64_t a1)
{
  Swift::String v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity);
  swift_beginAccess();
  uint64_t v4 = *v3;
  swift_bridgeObjectRetain_n();
  Swift::String v5 = sub_1000092C0(v4);
  swift_bridgeObjectRelease();
  Swift::UInt8 v9 = v5;
  sub_1000099C4((uint64_t *)&v9);
  swift_bridgeObjectRelease();
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v9[2] <= a1)
  {
LABEL_9:
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  Swift::UInt8 v6 = *((unsigned char *)v9 + a1 + 32);
  swift_release();
  if (*(void *)(*v3 + 16) && (sub_100013570(v6), (v7 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

void sub_1000084E0(void *a1)
{
  uint64_t v2 = v1;
  unint64_t v4 = IndexPath.section.getter();
  uint64_t v5 = sub_1000083E8(v4);
  if (!v5) {
    return;
  }
  uint64_t v6 = v5;
  unint64_t v7 = IndexPath.row.getter();
  if ((v6 & 0xC000000000000001) == 0)
  {
    if ((v7 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v7 < *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v8 = *(id *)(v6 + 8 * v7 + 32);
      goto LABEL_6;
    }
    __break(1u);
    return;
  }
  id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_6:
  Swift::UInt8 v9 = v8;
  swift_bridgeObjectRelease();
  uint64_t v10 = *((void *)sub_100004B4C() + 2);
  swift_bridgeObjectRelease();
  if (v10 || ([v9 hasUserVisibleFullDescription] & 1) != 0)
  {
    uint64_t v11 = *(void *)&v2[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_requestContentManager];
    uint64_t v12 = objc_allocWithZone((Class)type metadata accessor for VSNotificationDetailViewController());
    v12[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_didHide] = 0;
    BOOL v13 = &v12[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_presentedPTIdentifier];
    *BOOL v13 = 0;
    v13[1] = 0;
    *(void *)&v12[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_requestContentManager] = v11;
    *(void *)&v12[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_notification] = v9;
    swift_retain_n();
    Class isa = v9;
    uint64_t v14 = v12;
    *(void *)&v14[OBJC_IVAR____TtC12AutoSettings34VSNotificationDetailViewController_actions] = sub_100004B4C();

    Swift::UInt8 v9 = (void *)CAFUITableViewController.init(style:)();
    swift_release();
    id v15 = [v2 navigationController];
    if (v15)
    {
      unint64_t v16 = v15;
      [v15 pushViewController:v9 animated:1];
    }
  }
  else
  {
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    [a1 deselectRowAtIndexPath:animated:];
  }
}

uint64_t sub_100008924(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for VSNotificationTableCell();
  static CAFUICellProtocol.reuseIdentifier.getter();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  id v10 = [a1 dequeueReusableCellWithIdentifier:v8 forIndexPath:isa];

  uint64_t v11 = swift_dynamicCastClass();
  if (v11)
  {
    uint64_t v12 = v11;
    unint64_t v13 = IndexPath.section.getter();
    uint64_t v14 = sub_1000083E8(v13);
    if (!v14)
    {
      (*(void (**)(char *, void *, uint64_t))(v5 + 16))(v7, a2, v4);
      unint64_t v23 = 0;
      unint64_t v24 = 0xE000000000000000;
      _StringGuts.grow(_:)(24);
      swift_bridgeObjectRelease();
      unint64_t v23 = 0xD000000000000016;
      unint64_t v24 = 0x800000010001C680;
      sub_100009170();
      v22._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v22);
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    uint64_t v15 = v14;
    id v10 = a2;
    unint64_t v16 = IndexPath.row.getter();
    if ((v15 & 0xC000000000000001) != 0)
    {
      id v17 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      goto LABEL_7;
    }
    if ((v16 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v16 < *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      id v17 = *(id *)(v15 + 8 * v16 + 32);
LABEL_7:
      uint64_t v18 = v17;
      swift_bridgeObjectRelease();
      uint64_t v19 = *(void **)(v12 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem);
      *(void *)(v12 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem) = v18;
      id v20 = v18;

      sub_100017DAC();
      return v12;
    }
    __break(1u);
  }

LABEL_13:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_10000903C()
{
}

uint64_t sub_10000906C()
{
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_1000090BC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VSNotificationHistoryViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for VSNotificationHistoryViewController()
{
  return self;
}

unint64_t sub_100009170()
{
  unint64_t result = qword_10002C130;
  if (!qword_10002C130)
  {
    type metadata accessor for IndexPath();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C130);
  }
  return result;
}

void *sub_1000091C8(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      Swift::String v3 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_10000761C(&qword_10002C148);
      Swift::String v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_10000B9C0((unint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2) {
      return &_swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void *sub_1000092C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_10000761C(&qword_10002C138);
  uint64_t v3 = swift_allocObject();
  size_t v4 = j__malloc_size((const void *)v3);
  *(void *)(v3 + 16) = v1;
  *(void *)(v3 + 24) = 2 * v4 - 64;
  uint64_t v5 = sub_10000BC1C(&v7, (unsigned char *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_10000BDB0();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return (void *)v3;
}

uint64_t sub_100009398(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000761C(&qword_10002C138);
    id v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    id v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  unint64_t v13 = a4 + 32;
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
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_1000094E8(char a1, int64_t a2, char a3, void *a4)
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
    sub_10000761C(&qword_10002C178);
    id v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    id v10 = _swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    sub_10000761C((uint64_t *)&unk_10002C180);
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

uint64_t sub_100009674(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000761C(&qword_10002CB20);
  uint64_t result = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = result;
  if (*(void *)(v5 + 16))
  {
    int64_t v8 = 0;
    unint64_t v30 = (void *)(v5 + 64);
    uint64_t v9 = 1 << *(unsigned char *)(v5 + 32);
    if (v9 < 64) {
      uint64_t v10 = ~(-1 << v9);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v29 = (unint64_t)(v9 + 63) >> 6;
    uint64_t v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        unint64_t v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v18 = v17 | (v8 << 6);
      }
      else
      {
        int64_t v19 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        uint64_t result = v5 + 64;
        if (v19 >= v29) {
          goto LABEL_33;
        }
        unint64_t v20 = v30[v19];
        ++v8;
        if (!v20)
        {
          int64_t v8 = v19 + 1;
          if (v19 + 1 >= v29) {
            goto LABEL_33;
          }
          unint64_t v20 = v30[v8];
          if (!v20)
          {
            int64_t v21 = v19 + 2;
            if (v21 >= v29)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                uint64_t result = swift_release();
                uint64_t v3 = v2;
                goto LABEL_40;
              }
              uint64_t v28 = 1 << *(unsigned char *)(v5 + 32);
              if (v28 >= 64) {
                bzero(v30, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              }
              else {
                void *v30 = -1 << v28;
              }
              uint64_t v3 = v2;
              *(void *)(v5 + 16) = 0;
              break;
            }
            unint64_t v20 = v30[v21];
            if (!v20)
            {
              while (1)
              {
                int64_t v8 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_42;
                }
                if (v8 >= v29) {
                  goto LABEL_33;
                }
                unint64_t v20 = v30[v8];
                ++v21;
                if (v20) {
                  goto LABEL_30;
                }
              }
            }
            int64_t v8 = v21;
          }
        }
LABEL_30:
        unint64_t v11 = (v20 - 1) & v20;
        unint64_t v18 = __clz(__rbit64(v20)) + (v8 << 6);
      }
      Swift::UInt8 v26 = *(unsigned char *)(*(void *)(v5 + 48) + v18);
      uint64_t v27 = *(void *)(*(void *)(v5 + 56) + 8 * v18);
      if ((a2 & 1) == 0) {
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v26);
      uint64_t result = Hasher._finalize()();
      uint64_t v13 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v14 = result & ~v13;
      unint64_t v15 = v14 >> 6;
      if (((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v14) & ~*(void *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          BOOL v24 = v15 == v23;
          if (v15 == v23) {
            unint64_t v15 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v12 + 8 * v15);
        }
        while (v25 == -1);
        unint64_t v16 = __clz(__rbit64(~v25)) + (v15 << 6);
      }
      *(void *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(unsigned char *)(*(void *)(v7 + 48) + v16) = v26;
      *(void *)(*(void *)(v7 + 56) + 8 * v16) = v27;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
LABEL_40:
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100009948(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10000BBF4(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_100009BD4(v6);
  return specialized ContiguousArray._endMutation()();
}

Swift::Int sub_1000099C4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000BC08(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_10000A65C(v5);
  *a1 = v2;
  return result;
}

void *sub_100009A30()
{
  uint64_t v1 = v0;
  sub_10000761C(&qword_10002CB20);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    Swift::Int result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  Swift::Int result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    Swift::Int result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = *(void *)(*(void *)(v2 + 56) + 8 * v15);
    *(unsigned char *)(*(void *)(v4 + 48) + v15) = *(unsigned char *)(*(void *)(v2 + 48) + v15);
    *(void *)(*(void *)(v4 + 56) + 8 * v15) = v16;
    Swift::Int result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v19 = v17 + 2;
  if (v19 >= v13) {
    goto LABEL_26;
  }
  unint64_t v18 = *(void *)(v6 + 8 * v19);
  if (v18)
  {
    int64_t v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_100009BD4(uint64_t *a1)
{
  uint64_t v132 = sub_10000761C((uint64_t *)&unk_10002BF80);
  uint64_t v2 = *(void *)(v132 - 8);
  uint64_t v3 = __chkstk_darwin(v132);
  v134 = (char *)&v120 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v133 = (char *)&v120 - v5;
  Swift::Int v6 = a1[1];
  Swift::Int v124 = _minimumMergeRunLength(_:)(v6);
  if (v124 >= v6)
  {
    if (v6 < 0) {
      goto LABEL_136;
    }
    if (v6) {
      sub_10000ACDC(0, v6, 1, a1);
    }
    return;
  }
  if (v6 >= 0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v6 + 1;
  }
  if (v6 < -1) {
    goto LABEL_144;
  }
  if (v6 < 2)
  {
    uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
    uint64_t v138 = (uint64_t)&_swiftEmptyArrayStorage;
    v129 = (void **)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v6 != 1)
    {
      unint64_t v14 = *((void *)&_swiftEmptyArrayStorage + 2);
LABEL_102:
      uint64_t v111 = v130;
      if (v14 >= 2)
      {
        uint64_t v112 = *a1;
        do
        {
          unint64_t v113 = v14 - 2;
          if (v14 < 2) {
            goto LABEL_131;
          }
          if (!v112) {
            goto LABEL_143;
          }
          v114 = v11;
          v115 = v11 + 32;
          uint64_t v116 = *(void *)&v11[16 * v113 + 32];
          uint64_t v117 = *(void *)&v11[16 * v14 + 24];
          sub_10000AF6C((void **)(v112 + 8 * v116), (id *)(v112 + 8 * *(void *)&v115[16 * v14 - 16]), (id *)(v112 + 8 * v117), v129);
          if (v111) {
            break;
          }
          if (v117 < v116) {
            goto LABEL_132;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v114 = sub_10000B9AC((uint64_t)v114);
          }
          if (v113 >= *((void *)v114 + 2)) {
            goto LABEL_133;
          }
          v118 = &v114[16 * v113 + 32];
          *(void *)v118 = v116;
          *((void *)v118 + 1) = v117;
          unint64_t v119 = *((void *)v114 + 2);
          if (v14 > v119) {
            goto LABEL_134;
          }
          uint64_t v11 = v114;
          memmove(&v114[16 * v14 + 16], &v114[16 * v14 + 32], 16 * (v119 - v14));
          *((void *)v114 + 2) = v119 - 1;
          unint64_t v14 = v119 - 1;
        }
        while (v119 > 2);
      }
LABEL_113:
      swift_bridgeObjectRelease();
      *(void *)((v138 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    int64_t v8 = a1;
    uint64_t v9 = v7 >> 1;
    sub_1000076B0(0, &qword_10002C150);
    uint64_t v10 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    a1 = v8;
    v129 = (void **)((v10 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v138 = v10;
  }
  Swift::Int v12 = 0;
  uint64_t v13 = *a1;
  v131 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v122 = v13 + 16;
  v120 = a1;
  uint64_t v121 = v13 - 8;
  uint64_t v11 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v126 = v6;
  uint64_t v135 = v13;
  while (1)
  {
    uint64_t v15 = v12++;
    uint64_t v127 = v15;
    if (v12 >= v6)
    {
      Swift::Int v38 = v124;
    }
    else
    {
      uint64_t v16 = *(void **)(v13 + 8 * v15);
      id v17 = *(id *)(v13 + 8 * v12);
      unint64_t v18 = v16;
      v123 = v18;
      id v19 = [v17 timestamp];
      unint64_t v20 = (void *)sub_1000076B0(0, &qword_10002CB10);
      int64_t v21 = v133;
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

      id v22 = [v18 timestamp];
      unint64_t v23 = v134;
      id v136 = v20;
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v24 = sub_10000BE04(&qword_10002C170, (uint64_t *)&unk_10002BF80);
      uint64_t v25 = v132;
      uint64_t v128 = v24;
      LODWORD(v137) = dispatch thunk of static Comparable.< infix(_:_:)();
      Swift::UInt8 v26 = *v131;
      (*v131)(v23, v25);
      v125 = v26;
      v26(v21, v25);

      Swift::Int v12 = v15 + 2;
      if (v15 + 2 >= v6)
      {
        Swift::Int v38 = v124;
      }
      else
      {
        v123 = v11;
        uint64_t v27 = (id *)(v122 + 8 * v15);
        while (1)
        {
          Swift::Int v28 = v12;
          int64_t v29 = *(v27 - 1);
          id v30 = *v27;
          id v31 = v29;
          id v32 = [v30 timestamp];
          Swift::UInt8 v33 = v133;
          static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

          id v34 = [v31 timestamp];
          uint64_t v35 = v134;
          static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v36 = v132;
          LODWORD(v34) = dispatch thunk of static Comparable.< infix(_:_:)();
          v37 = v125;
          v125(v35, v36);
          v37(v33, v36);

          if ((v137 ^ v34)) {
            break;
          }
          Swift::Int v12 = v28 + 1;
          ++v27;
          Swift::Int v6 = v126;
          if (v126 == v28 + 1)
          {
            Swift::Int v12 = v126;
            uint64_t v11 = v123;
            goto LABEL_24;
          }
        }
        uint64_t v11 = v123;
        Swift::Int v6 = v126;
        Swift::Int v12 = v28;
LABEL_24:
        Swift::Int v38 = v124;
        uint64_t v15 = v127;
      }
      uint64_t v13 = v135;
      if (v137)
      {
        if (v12 < v15) {
          goto LABEL_137;
        }
        if (v15 < v12)
        {
          char v39 = (uint64_t *)(v121 + 8 * v12);
          Swift::Int v40 = v12;
          Swift::Int v41 = v15;
          BOOL v42 = (uint64_t *)(v135 + 8 * v15);
          do
          {
            if (v41 != --v40)
            {
              if (!v13) {
                goto LABEL_142;
              }
              uint64_t v43 = *v42;
              *BOOL v42 = *v39;
              *char v39 = v43;
            }
            ++v41;
            --v39;
            ++v42;
          }
          while (v41 < v40);
        }
      }
    }
    if (v12 >= v6) {
      goto LABEL_52;
    }
    if (__OFSUB__(v12, v15)) {
      goto LABEL_135;
    }
    if (v12 - v15 >= v38) {
      goto LABEL_52;
    }
    if (__OFADD__(v15, v38)) {
      goto LABEL_138;
    }
    char v44 = (void (*)(char *, uint64_t))(v15 + v38 >= v6 ? v6 : v15 + v38);
    if ((uint64_t)v44 < v15) {
      break;
    }
    if ((void (*)(char *, uint64_t))v12 != v44)
    {
      v123 = v11;
      uint64_t v45 = v121 + 8 * v12;
      v125 = v44;
      do
      {
        char v46 = *(void **)(v13 + 8 * v12);
        uint64_t v47 = v15;
        uint64_t v128 = v45;
        while (1)
        {
          Swift::Int v48 = v12;
          uint64_t v49 = *(void **)v45;
          id v50 = v46;
          id v137 = v50;
          id v51 = v49;
          id v136 = v51;
          id v52 = [v50 timestamp];
          sub_1000076B0(0, &qword_10002CB10);
          int64_t v53 = v133;
          static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

          id v54 = [v51 timestamp];
          v55 = v134;
          static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

          sub_10000BE04(&qword_10002C170, (uint64_t *)&unk_10002BF80);
          uint64_t v56 = v132;
          LOBYTE(v54) = dispatch thunk of static Comparable.< infix(_:_:)();
          v57 = *v131;
          (*v131)(v55, v56);
          v57(v53, v56);

          if ((v54 & 1) == 0) {
            break;
          }
          uint64_t v13 = v135;
          if (!v135) {
            goto LABEL_140;
          }
          Swift::Int v12 = v48;
          v58 = *(void **)v45;
          char v46 = *(void **)(v45 + 8);
          *(void *)uint64_t v45 = v46;
          *(void *)(v45 + 8) = v58;
          v45 -= 8;
          if (v48 == ++v47) {
            goto LABEL_45;
          }
        }
        uint64_t v13 = v135;
        Swift::Int v12 = v48;
LABEL_45:
        ++v12;
        uint64_t v15 = v127;
        uint64_t v45 = v128 + 8;
      }
      while ((void (*)(char *, uint64_t))v12 != v125);
      Swift::Int v12 = (Swift::Int)v125;
      uint64_t v11 = v123;
    }
LABEL_52:
    if (v12 < v15) {
      goto LABEL_130;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_10000B750(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v60 = *((void *)v11 + 2);
    unint64_t v59 = *((void *)v11 + 3);
    unint64_t v14 = v60 + 1;
    uint64_t v13 = v135;
    if (v60 >= v59 >> 1)
    {
      v110 = sub_10000B750((char *)(v59 > 1), v60 + 1, 1, v11);
      uint64_t v13 = v135;
      uint64_t v11 = v110;
    }
    *((void *)v11 + 2) = v14;
    v61 = v11 + 32;
    v62 = &v11[16 * v60 + 32];
    *(void *)v62 = v15;
    *((void *)v62 + 1) = v12;
    if (v60)
    {
      while (1)
      {
        unint64_t v63 = v14 - 1;
        if (v14 >= 4)
        {
          v68 = &v61[16 * v14];
          uint64_t v69 = *((void *)v68 - 8);
          uint64_t v70 = *((void *)v68 - 7);
          BOOL v74 = __OFSUB__(v70, v69);
          uint64_t v71 = v70 - v69;
          if (v74) {
            goto LABEL_119;
          }
          uint64_t v73 = *((void *)v68 - 6);
          uint64_t v72 = *((void *)v68 - 5);
          BOOL v74 = __OFSUB__(v72, v73);
          uint64_t v66 = v72 - v73;
          char v67 = v74;
          if (v74) {
            goto LABEL_120;
          }
          unint64_t v75 = v14 - 2;
          v76 = &v61[16 * v14 - 32];
          uint64_t v78 = *(void *)v76;
          uint64_t v77 = *((void *)v76 + 1);
          BOOL v74 = __OFSUB__(v77, v78);
          uint64_t v79 = v77 - v78;
          if (v74) {
            goto LABEL_122;
          }
          BOOL v74 = __OFADD__(v66, v79);
          uint64_t v80 = v66 + v79;
          if (v74) {
            goto LABEL_125;
          }
          if (v80 >= v71)
          {
            v98 = &v61[16 * v63];
            uint64_t v100 = *(void *)v98;
            uint64_t v99 = *((void *)v98 + 1);
            BOOL v74 = __OFSUB__(v99, v100);
            uint64_t v101 = v99 - v100;
            if (v74) {
              goto LABEL_129;
            }
            BOOL v91 = v66 < v101;
            goto LABEL_89;
          }
        }
        else
        {
          if (v14 != 3)
          {
            uint64_t v92 = *((void *)v11 + 4);
            uint64_t v93 = *((void *)v11 + 5);
            BOOL v74 = __OFSUB__(v93, v92);
            uint64_t v85 = v93 - v92;
            char v86 = v74;
            goto LABEL_83;
          }
          uint64_t v65 = *((void *)v11 + 4);
          uint64_t v64 = *((void *)v11 + 5);
          BOOL v74 = __OFSUB__(v64, v65);
          uint64_t v66 = v64 - v65;
          char v67 = v74;
        }
        if (v67) {
          goto LABEL_121;
        }
        unint64_t v75 = v14 - 2;
        v81 = &v61[16 * v14 - 32];
        uint64_t v83 = *(void *)v81;
        uint64_t v82 = *((void *)v81 + 1);
        BOOL v84 = __OFSUB__(v82, v83);
        uint64_t v85 = v82 - v83;
        char v86 = v84;
        if (v84) {
          goto LABEL_124;
        }
        v87 = &v61[16 * v63];
        uint64_t v89 = *(void *)v87;
        uint64_t v88 = *((void *)v87 + 1);
        BOOL v74 = __OFSUB__(v88, v89);
        uint64_t v90 = v88 - v89;
        if (v74) {
          goto LABEL_127;
        }
        if (__OFADD__(v85, v90)) {
          goto LABEL_128;
        }
        if (v85 + v90 >= v66)
        {
          BOOL v91 = v66 < v90;
LABEL_89:
          if (v91) {
            unint64_t v63 = v75;
          }
          goto LABEL_91;
        }
LABEL_83:
        if (v86) {
          goto LABEL_123;
        }
        v94 = &v61[16 * v63];
        uint64_t v96 = *(void *)v94;
        uint64_t v95 = *((void *)v94 + 1);
        BOOL v74 = __OFSUB__(v95, v96);
        uint64_t v97 = v95 - v96;
        if (v74) {
          goto LABEL_126;
        }
        if (v97 < v85) {
          goto LABEL_14;
        }
LABEL_91:
        v102 = v11;
        unint64_t v103 = v63 - 1;
        if (v63 - 1 >= v14)
        {
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
          goto LABEL_139;
        }
        if (!v13) {
          goto LABEL_141;
        }
        v104 = &v61[16 * v103];
        uint64_t v105 = *(void *)v104;
        v106 = &v61[16 * v63];
        uint64_t v107 = *((void *)v106 + 1);
        uint64_t v108 = v130;
        sub_10000AF6C((void **)(v13 + 8 * *(void *)v104), (id *)(v13 + 8 * *(void *)v106), (id *)(v13 + 8 * v107), v129);
        uint64_t v130 = v108;
        if (v108) {
          goto LABEL_113;
        }
        if (v107 < v105) {
          goto LABEL_116;
        }
        if (v63 > *((void *)v102 + 2)) {
          goto LABEL_117;
        }
        *(void *)v104 = v105;
        *(void *)&v61[16 * v103 + 8] = v107;
        unint64_t v109 = *((void *)v102 + 2);
        if (v63 >= v109) {
          goto LABEL_118;
        }
        uint64_t v11 = v102;
        unint64_t v14 = v109 - 1;
        memmove(&v61[16 * v63], v106 + 16, 16 * (v109 - 1 - v63));
        *((void *)v102 + 2) = v109 - 1;
        uint64_t v13 = v135;
        if (v109 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v14 = 1;
LABEL_14:
    Swift::Int v6 = v126;
    if (v12 >= v126)
    {
      a1 = v120;
      goto LABEL_102;
    }
  }
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

Swift::Int sub_10000A65C(void *a1)
{
  uint64_t v2 = a1;
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_137;
    }
    if ((unint64_t)v3 >= 2)
    {
      uint64_t v78 = 0;
      uint64_t v79 = *v2;
      for (uint64_t i = 1; i != v3; ++i)
      {
        unsigned int v81 = *(unsigned __int8 *)(v79 + i);
        uint64_t v82 = v78;
        do
        {
          unsigned int v83 = *(unsigned __int8 *)(v79 + v82);
          if (v83 >= v81) {
            break;
          }
          if (!v79) {
            goto LABEL_141;
          }
          *(unsigned char *)(v79 + v82 + 1) = v83;
          *(unsigned char *)(v79 + v82--) = v81;
        }
        while (v82 != -1);
        ++v78;
      }
    }
    return result;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_146;
  }
  Swift::Int v94 = result;
  Swift::Int v95 = v3;
  if (v3 < 2)
  {
    int64_t v8 = _swiftEmptyArrayStorage;
    __dst = (unsigned __int8 *)&_swiftEmptyArrayStorage[4];
    if (v3 != 1)
    {
      unint64_t v12 = _swiftEmptyArrayStorage[2];
      uint64_t v11 = (char *)_swiftEmptyArrayStorage;
LABEL_103:
      uint64_t v93 = v8;
      if (v12 >= 2)
      {
        uint64_t v84 = *v2;
        do
        {
          unint64_t v85 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_132;
          }
          if (!v84) {
            goto LABEL_145;
          }
          char v86 = v11;
          v87 = v11 + 32;
          uint64_t v88 = *(void *)&v11[16 * v85 + 32];
          uint64_t v89 = *(void *)&v11[16 * v12 + 24];
          sub_10000B514((unsigned __int8 *)(v84 + v88), (unsigned __int8 *)(v84 + *(void *)&v87[16 * v12 - 16]), v84 + v89, __dst);
          if (v1) {
            break;
          }
          if (v89 < v88) {
            goto LABEL_133;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            char v86 = sub_10000B9AC((uint64_t)v86);
          }
          if (v85 >= *((void *)v86 + 2)) {
            goto LABEL_134;
          }
          uint64_t v90 = &v86[16 * v85 + 32];
          *(void *)uint64_t v90 = v88;
          *((void *)v90 + 1) = v89;
          unint64_t v91 = *((void *)v86 + 2);
          if (v12 > v91) {
            goto LABEL_135;
          }
          memmove(&v86[16 * v12 + 16], &v86[16 * v12 + 32], 16 * (v91 - v12));
          uint64_t v11 = v86;
          *((void *)v86 + 2) = v91 - 1;
          unint64_t v12 = v91 - 1;
        }
        while (v91 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      v93[2] = 0;
      return swift_bridgeObjectRelease();
    }
    uint64_t v93 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    type metadata accessor for CAFNotificationSeverity(0);
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v7 + 16) = v6;
    Swift::Int v3 = v95;
    uint64_t v93 = (void *)v7;
    __dst = (unsigned __int8 *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v92 = v2;
  uint64_t v10 = *v2;
  uint64_t v11 = (char *)_swiftEmptyArrayStorage;
  uint64_t v96 = *v2;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 < v3)
    {
      unsigned int v14 = *(unsigned __int8 *)(v10 + v9);
      unsigned int v15 = *(unsigned __int8 *)(v10 + v13);
      Swift::Int v9 = v13 + 2;
      if (v13 + 2 < v3)
      {
        unsigned int v16 = v14;
        while (1)
        {
          unsigned int v17 = *(unsigned __int8 *)(v10 + v9);
          if (v15 < v14 == v16 >= v17) {
            break;
          }
          ++v9;
          unsigned int v16 = v17;
          if (v3 == v9)
          {
            Swift::Int v9 = v3;
            break;
          }
        }
      }
      if (v15 < v14)
      {
        if (v9 < v13) {
          goto LABEL_138;
        }
        if (v13 < v9)
        {
          Swift::Int v18 = v9 - 1;
          Swift::Int v19 = v13;
          do
          {
            if (v19 != v18)
            {
              if (!v10) {
                goto LABEL_144;
              }
              char v20 = *(unsigned char *)(v10 + v19);
              *(unsigned char *)(v10 + v19) = *(unsigned char *)(v10 + v18);
              *(unsigned char *)(v10 + v18) = v20;
            }
            BOOL v59 = ++v19 < v18--;
          }
          while (v59);
        }
      }
    }
    if (v9 >= v3) {
      goto LABEL_47;
    }
    if (__OFSUB__(v9, v13)) {
      goto LABEL_136;
    }
    if (v9 - v13 >= v94) {
      goto LABEL_47;
    }
    Swift::Int v21 = v13 + v94;
    if (__OFADD__(v13, v94)) {
      goto LABEL_139;
    }
    if (v21 >= v3) {
      Swift::Int v21 = v3;
    }
    if (v21 < v13) {
      break;
    }
    if (v9 != v21)
    {
      id v22 = (unsigned char *)(v10 + v9);
      do
      {
        unsigned int v23 = *(unsigned __int8 *)(v10 + v9);
        Swift::Int v24 = v13;
        uint64_t v25 = v22;
        do
        {
          unsigned int v26 = *(v25 - 1);
          if (v26 >= v23) {
            break;
          }
          if (!v10) {
            goto LABEL_142;
          }
          unsigned char *v25 = v26;
          *--uint64_t v25 = v23;
          ++v24;
        }
        while (v9 != v24);
        ++v9;
        ++v22;
      }
      while (v9 != v21);
      Swift::Int v9 = v21;
    }
LABEL_47:
    if (v9 < v13) {
      goto LABEL_131;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v11 = sub_10000B750(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v28 = *((void *)v11 + 2);
    unint64_t v27 = *((void *)v11 + 3);
    unint64_t v12 = v28 + 1;
    uint64_t v10 = v96;
    if (v28 >= v27 >> 1)
    {
      uint64_t v77 = sub_10000B750((char *)(v27 > 1), v28 + 1, 1, v11);
      uint64_t v10 = v96;
      uint64_t v11 = v77;
    }
    *((void *)v11 + 2) = v12;
    int64_t v29 = v11 + 32;
    id v30 = &v11[16 * v28 + 32];
    *(void *)id v30 = v13;
    *((void *)v30 + 1) = v9;
    if (v28)
    {
      while (1)
      {
        unint64_t v31 = v12 - 1;
        if (v12 >= 4)
        {
          uint64_t v36 = &v29[16 * v12];
          uint64_t v37 = *((void *)v36 - 8);
          uint64_t v38 = *((void *)v36 - 7);
          BOOL v42 = __OFSUB__(v38, v37);
          uint64_t v39 = v38 - v37;
          if (v42) {
            goto LABEL_120;
          }
          uint64_t v41 = *((void *)v36 - 6);
          uint64_t v40 = *((void *)v36 - 5);
          BOOL v42 = __OFSUB__(v40, v41);
          uint64_t v34 = v40 - v41;
          char v35 = v42;
          if (v42) {
            goto LABEL_121;
          }
          unint64_t v43 = v12 - 2;
          char v44 = &v29[16 * v12 - 32];
          uint64_t v46 = *(void *)v44;
          uint64_t v45 = *((void *)v44 + 1);
          BOOL v42 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          if (v42) {
            goto LABEL_123;
          }
          BOOL v42 = __OFADD__(v34, v47);
          uint64_t v48 = v34 + v47;
          if (v42) {
            goto LABEL_126;
          }
          if (v48 >= v39)
          {
            uint64_t v66 = &v29[16 * v31];
            uint64_t v68 = *(void *)v66;
            uint64_t v67 = *((void *)v66 + 1);
            BOOL v42 = __OFSUB__(v67, v68);
            uint64_t v69 = v67 - v68;
            if (v42) {
              goto LABEL_130;
            }
            BOOL v59 = v34 < v69;
            goto LABEL_84;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v60 = *((void *)v11 + 4);
            uint64_t v61 = *((void *)v11 + 5);
            BOOL v42 = __OFSUB__(v61, v60);
            uint64_t v53 = v61 - v60;
            char v54 = v42;
            goto LABEL_78;
          }
          uint64_t v33 = *((void *)v11 + 4);
          uint64_t v32 = *((void *)v11 + 5);
          BOOL v42 = __OFSUB__(v32, v33);
          uint64_t v34 = v32 - v33;
          char v35 = v42;
        }
        if (v35) {
          goto LABEL_122;
        }
        unint64_t v43 = v12 - 2;
        uint64_t v49 = &v29[16 * v12 - 32];
        uint64_t v51 = *(void *)v49;
        uint64_t v50 = *((void *)v49 + 1);
        BOOL v52 = __OFSUB__(v50, v51);
        uint64_t v53 = v50 - v51;
        char v54 = v52;
        if (v52) {
          goto LABEL_125;
        }
        v55 = &v29[16 * v31];
        uint64_t v57 = *(void *)v55;
        uint64_t v56 = *((void *)v55 + 1);
        BOOL v42 = __OFSUB__(v56, v57);
        uint64_t v58 = v56 - v57;
        if (v42) {
          goto LABEL_128;
        }
        if (__OFADD__(v53, v58)) {
          goto LABEL_129;
        }
        if (v53 + v58 >= v34)
        {
          BOOL v59 = v34 < v58;
LABEL_84:
          if (v59) {
            unint64_t v31 = v43;
          }
          goto LABEL_86;
        }
LABEL_78:
        if (v54) {
          goto LABEL_124;
        }
        v62 = &v29[16 * v31];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v42 = __OFSUB__(v63, v64);
        uint64_t v65 = v63 - v64;
        if (v42) {
          goto LABEL_127;
        }
        if (v65 < v53) {
          goto LABEL_15;
        }
LABEL_86:
        unint64_t v70 = v31 - 1;
        if (v31 - 1 >= v12)
        {
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
          goto LABEL_140;
        }
        if (!v10) {
          goto LABEL_143;
        }
        uint64_t v71 = &v29[16 * v70];
        uint64_t v72 = *(void *)v71;
        uint64_t v73 = v29;
        BOOL v74 = &v29[16 * v31];
        uint64_t v75 = *((void *)v74 + 1);
        sub_10000B514((unsigned __int8 *)(v10 + *(void *)v71), (unsigned __int8 *)(v10 + *(void *)v74), v10 + v75, __dst);
        if (v1) {
          goto LABEL_114;
        }
        if (v75 < v72) {
          goto LABEL_117;
        }
        if (v31 > *((void *)v11 + 2)) {
          goto LABEL_118;
        }
        *(void *)uint64_t v71 = v72;
        *(void *)&v73[16 * v70 + 8] = v75;
        unint64_t v76 = *((void *)v11 + 2);
        if (v31 >= v76) {
          goto LABEL_119;
        }
        unint64_t v12 = v76 - 1;
        memmove(v74, v74 + 16, 16 * (v76 - 1 - v31));
        int64_t v29 = v73;
        *((void *)v11 + 2) = v76 - 1;
        uint64_t v10 = v96;
        if (v76 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v95;
    if (v9 >= v95)
    {
      uint64_t v2 = v92;
      int64_t v8 = v93;
      goto LABEL_103;
    }
  }
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_10000ACDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v27 = a1;
  uint64_t v30 = sub_10000761C((uint64_t *)&unk_10002BF80);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v32 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  unint64_t v31 = (char *)&v25 - v10;
  uint64_t v26 = a2;
  if (a3 != a2)
  {
    uint64_t v33 = *a4;
    int64_t v29 = (void (**)(char *, uint64_t))(v9 + 8);
    uint64_t v11 = v33 + 8 * a3 - 8;
    Swift::Int v13 = v31;
    unint64_t v12 = v32;
LABEL_5:
    unsigned int v14 = *(void **)(v33 + 8 * a3);
    uint64_t v15 = v27;
    uint64_t v28 = v11;
    uint64_t v34 = a3;
    while (1)
    {
      unsigned int v16 = *(void **)v11;
      id v17 = v14;
      id v35 = v17;
      id v18 = v16;
      id v19 = [v17 timestamp];
      sub_1000076B0(0, &qword_10002CB10);
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

      id v20 = [v18 timestamp];
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

      sub_10000BE04(&qword_10002C170, (uint64_t *)&unk_10002BF80);
      uint64_t v21 = v30;
      LOBYTE(v16) = dispatch thunk of static Comparable.< infix(_:_:)();
      id v22 = *v29;
      (*v29)(v12, v21);
      v22(v13, v21);

      uint64_t v23 = v34;
      if ((v16 & 1) == 0)
      {
LABEL_4:
        a3 = v23 + 1;
        uint64_t v11 = v28 + 8;
        if (a3 == v26) {
          return;
        }
        goto LABEL_5;
      }
      if (!v33) {
        break;
      }
      Swift::Int v24 = *(void **)v11;
      unsigned int v14 = *(void **)(v11 + 8);
      *(void *)uint64_t v11 = v14;
      *(void *)(v11 + 8) = v24;
      v11 -= 8;
      if (v23 == ++v15) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_10000AF6C(void **a1, id *a2, id *a3, void **a4)
{
  uint64_t v53 = sub_10000761C((uint64_t *)&unk_10002BF80);
  uint64_t v8 = *(void *)(v53 - 8);
  uint64_t v9 = __chkstk_darwin(v53);
  v55 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  char v54 = (char *)&v46 - v11;
  uint64_t v12 = (char *)a2 - (char *)a1;
  uint64_t v13 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0) {
    uint64_t v13 = (char *)a2 - (char *)a1;
  }
  uint64_t v14 = v13 >> 3;
  BOOL v52 = a3;
  uint64_t v15 = (char *)a3 - (char *)a2;
  uint64_t v16 = v15 / 8;
  uint64_t v60 = a1;
  BOOL v59 = a4;
  if (v13 >> 3 >= v15 / 8)
  {
    if (v15 < -7) {
      goto LABEL_43;
    }
    if (a4 != a2 || &a2[v16] <= a4) {
      memmove(a4, a2, 8 * v16);
    }
    uint64_t v30 = &a4[v16];
    uint64_t v58 = v30;
    uint64_t v60 = a2;
    if (v15 < 8 || a1 >= a2) {
      goto LABEL_42;
    }
    uint64_t v47 = (void (**)(char *, uint64_t))(v8 + 8);
    unint64_t v31 = v52 - 1;
    uint64_t v32 = a2;
    uint64_t v56 = a1;
    uint64_t v57 = a4;
    while (1)
    {
      BOOL v52 = a2;
      uint64_t v50 = v30;
      uint64_t v51 = v31 + 1;
      uint64_t v34 = v30 - 1;
      id v35 = *--v32;
      id v36 = *(v30 - 1);
      id v49 = v36;
      id v37 = v35;
      id v48 = v37;
      id v38 = [v36 timestamp];
      sub_1000076B0(0, &qword_10002CB10);
      uint64_t v39 = v54;
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

      id v40 = [v37 timestamp];
      uint64_t v41 = v55;
      static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

      sub_10000BE04(&qword_10002C170, (uint64_t *)&unk_10002BF80);
      uint64_t v42 = v53;
      LOBYTE(v40) = dispatch thunk of static Comparable.< infix(_:_:)();
      unint64_t v43 = *v47;
      (*v47)(v41, v42);
      v43(v39, v42);

      if (v40) {
        break;
      }
      uint64_t v58 = v34;
      uint64_t v32 = v52;
      if (v51 < v50 || v31 >= v50)
      {
        *unint64_t v31 = *v34;
        uint64_t v30 = v34;
        goto LABEL_30;
      }
      uint64_t v33 = v56;
      char v44 = v57;
      if (v51 != v50) {
        *unint64_t v31 = *v34;
      }
      uint64_t v30 = v34;
      if (v34 <= v44) {
        goto LABEL_42;
      }
LABEL_31:
      --v31;
      a2 = v32;
      if (v32 <= v33) {
        goto LABEL_42;
      }
    }
    uint64_t v30 = v50;
    if (v51 != v52 || v31 >= v52) {
      *unint64_t v31 = *v32;
    }
    uint64_t v60 = v32;
LABEL_30:
    uint64_t v33 = v56;
    if (v30 <= v57) {
      goto LABEL_42;
    }
    goto LABEL_31;
  }
  if (v12 >= -7)
  {
    if (a4 != a1 || &a1[v14] <= a4) {
      memmove(a4, a1, 8 * v14);
    }
    uint64_t v51 = &a4[v14];
    uint64_t v58 = v51;
    if (v12 >= 8 && a2 < v52)
    {
      uint64_t v50 = (void **)(v8 + 8);
      id v17 = v55;
      do
      {
        uint64_t v56 = a1;
        uint64_t v57 = a4;
        id v18 = *a4;
        id v19 = *a2;
        id v20 = v18;
        id v21 = [v19 timestamp];
        sub_1000076B0(0, &qword_10002CB10);
        id v22 = a2;
        uint64_t v23 = v54;
        static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

        id v24 = [v20 timestamp];
        static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

        sub_10000BE04(&qword_10002C170, (uint64_t *)&unk_10002BF80);
        uint64_t v25 = v53;
        LOBYTE(v18) = dispatch thunk of static Comparable.< infix(_:_:)();
        uint64_t v26 = (void (*)(char *, uint64_t))*v50;
        ((void (*)(char *, uint64_t))*v50)(v17, v25);
        v26(v23, v25);

        if (v18)
        {
          uint64_t v27 = v22 + 1;
          uint64_t v28 = v56;
          a4 = v57;
          if (v56 < v22 || v56 >= v27 || v56 != v22) {
            *uint64_t v56 = *v22;
          }
        }
        else
        {
          uint64_t v28 = v56;
          int64_t v29 = v57;
          if (v56 != v57) {
            *uint64_t v56 = *v57;
          }
          a4 = v29 + 1;
          BOOL v59 = a4;
          uint64_t v27 = v22;
        }
        a1 = v28 + 1;
        uint64_t v60 = a1;
        if (a4 >= v51) {
          break;
        }
        a2 = v27;
      }
      while (v27 < v52);
    }
LABEL_42:
    sub_10000B84C((void **)&v60, (const void **)&v59, &v58);
    return 1;
  }
LABEL_43:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000B514(unsigned __int8 *__src, unsigned __int8 *a2, unint64_t a3, unsigned __int8 *__dst)
{
  id v22 = __src;
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  size_t v8 = a2 - __src;
  unint64_t v9 = a3 - (void)a2;
  id v21 = __dst;
  if (a2 - __src >= (uint64_t)(a3 - (void)a2))
  {
    if ((v9 & 0x8000000000000000) == 0)
    {
      if (__dst != a2 || a3 <= (unint64_t)__dst) {
        memmove(__dst, a2, a3 - (void)a2);
      }
      uint64_t v14 = &v4[v9];
      id v20 = &v4[v9];
      id v22 = v6;
      if (v7 < v6 && (unsigned __int8 *)a3 != v6)
      {
        uint64_t v15 = (unsigned __int8 *)(a3 - 1);
        while (1)
        {
          uint64_t v16 = v15 + 1;
          id v17 = v6 - 1;
          unsigned int v18 = *(v6 - 1);
          if (v18 >= *(v14 - 1))
          {
            id v20 = v14 - 1;
            if (v16 < v14 || v15 >= v14 || v16 != v14) {
              *uint64_t v15 = *(v14 - 1);
            }
            --v14;
            if (v6 <= v7) {
              goto LABEL_38;
            }
          }
          else
          {
            if (v16 != v6 || v15 >= v6) {
              *uint64_t v15 = v18;
            }
            id v22 = --v6;
            if (v17 <= v7) {
              goto LABEL_38;
            }
          }
          --v15;
          if (v14 <= v4) {
            goto LABEL_38;
          }
        }
      }
      goto LABEL_38;
    }
  }
  else if ((v8 & 0x8000000000000000) == 0)
  {
    if (__dst != __src || a2 <= __dst) {
      memmove(__dst, __src, v8);
    }
    uint64_t v10 = &v4[v8];
    id v20 = &v4[v8];
    if (v6 != v7 && (unint64_t)v6 < a3)
    {
      do
      {
        unsigned int v11 = *v6;
        unsigned int v12 = *v4;
        if (v12 >= v11)
        {
          if (v7 != v4) {
            *uint64_t v7 = v12;
          }
          id v21 = ++v4;
          uint64_t v13 = v6;
        }
        else
        {
          uint64_t v13 = v6 + 1;
          if (v7 < v6 || v7 >= v13 || v7 != v6) {
            *uint64_t v7 = v11;
          }
        }
        ++v7;
        if (v4 >= v10) {
          break;
        }
        uint64_t v6 = v13;
      }
      while ((unint64_t)v13 < a3);
      id v22 = v7;
    }
LABEL_38:
    sub_10000B908((void **)&v22, (const void **)&v21, &v20);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_10000B750(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000761C(&qword_10002C140);
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
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_10000B84C(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 7;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -8)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
    {
      return (char *)memmove(result, v3, 8 * v7);
    }
  }
  return result;
}

char *sub_10000B908(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  int64_t v4 = *a3 - (void)v3;
  if (v4 < 0)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    if (result != v3 || result >= &v3[v4])
    {
      return (char *)memmove(result, v3, v4);
    }
  }
  return result;
}

char *sub_10000B9AC(uint64_t a1)
{
  return sub_10000B750(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10000B9C0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10000BE04((unint64_t *)&unk_10002C160, &qword_10002C158);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_10000761C(&qword_10002C158);
          uint64_t v12 = sub_100016C38(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1000076B0(0, &qword_10002C150);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_10000BBF4(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

uint64_t sub_10000BC08(uint64_t a1)
{
  return sub_100009398(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void *sub_10000BC1C(void *result, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_35:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(unsigned char *)(*(void *)(a4 + 48) + v12);
    if (v9 == a3) {
      goto LABEL_35;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_19;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    int64_t v13 = v8;
LABEL_19:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_8;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_30;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    int64_t v13 = v15;
    goto LABEL_19;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_15;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    unint64_t v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_18;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_34;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_19;
    }
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_10000BDB0()
{
  return swift_release();
}

uint64_t sub_10000BDBC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000BE04(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000BDBC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000BE58()
{
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for AutoSettingsAccountManager()
{
  return self;
}

uint64_t sub_10000BFA0(uint64_t a1)
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
      sub_10000D65C(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_10000C1E8(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_10000D65C(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_10000C460(a1);
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

id sub_10000C190()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SettingsWindowSceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SettingsWindowSceneDelegate()
{
  return self;
}

void sub_10000C1E8(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_1000076B0(0, &qword_10002C2E8);
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
  sub_1000076B0(0, &qword_10002C2E8);
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
  unint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_10000C460(uint64_t a1)
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

void sub_10000C4E8(void *a1, id a2)
{
  id v4 = [a2 role];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  CAFSignpostEmit_Scene();

  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (!v6) {
    goto LABEL_8;
  }
  unint64_t v7 = (void *)v6;
  id v8 = a1;
  id v9 = [a2 role];
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {

    swift_bridgeObjectRelease_n();
LABEL_15:
    id v19 = [v7 _FBSScene];
    id v20 = [v19 settings];

    self;
    uint64_t v21 = swift_dynamicCastObjCClass();

    id v22 = [self sharedApplication];
    id v23 = [v22 delegate];

    if (v21)
    {
      if (v23)
      {
        type metadata accessor for AppDelegate();
        id v24 = (void *)swift_dynamicCastClassUnconditional();
        if (qword_10002BDE0 != -1) {
          swift_once();
        }
        uint64_t v25 = qword_10002D1D0;
        os_log_type_t v26 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v25, v26))
        {
          uint64_t v27 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v27 = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, v26, "AutoSettings is connecting to a cluster scene!", v27, 2u);
          swift_slowDealloc();
        }
LABEL_27:
        id v31 = [objc_allocWithZone((Class)UIWindow) initWithWindowScene:v7];
        [v31 setAutoresizesSubviews:1];
        [v31 setAutoresizingMask:18];
        [v31 makeKeyAndVisible];
        [v31 setHidden:0];
        sub_1000076B0(0, &qword_10002C308);
        id v32 = v31;
        uint64_t v33 = (void *)static UIColor.cafui_tableBackground.getter();
        [v32 setBackgroundColor:v33];

        swift_getKeyPath();
        swift_getKeyPath();
        id v34 = v24;
        static Published.subscript.setter();
        swift_unknownObjectRelease();

        return;
      }
      __break(1u);
    }
    else if (v23)
    {
      type metadata accessor for AppDelegate();
      id v24 = (void *)swift_dynamicCastClassUnconditional();
      if (qword_10002BDE0 != -1) {
        swift_once();
      }
      uint64_t v28 = qword_10002D1D0;
      os_log_type_t v29 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v28, v29))
      {
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "AutoSettings is connecting to a car scene!", v30, 2u);
        swift_slowDealloc();
      }
      goto LABEL_27;
    }
    __break(1u);
    return;
  }
  char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_15;
  }

LABEL_8:
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  unint64_t v16 = qword_10002D1D0;
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    unsigned int v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unsigned int v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Received an unknown scene, ignoring.", v18, 2u);
    swift_slowDealloc();
  }
}

void sub_10000CAE4(void *a1)
{
  self;
  uint64_t v2 = swift_dynamicCastObjCClass();
  if (v2)
  {
    uint64_t v3 = (void *)v2;
    id v12 = a1;
    id v4 = [v3 _FBSScene];
    id v5 = [v4 settings];

    self;
    uint64_t v6 = swift_dynamicCastObjCClass();

    id v7 = [self sharedApplication];
    id v8 = [v7 delegate];

    if (v6)
    {
      if (v8)
      {
        type metadata accessor for AppDelegate();
        swift_dynamicCastClassUnconditional();
        sub_10000E2BC();
LABEL_13:
        swift_unknownObjectRelease();

        return;
      }
      __break(1u);
    }
    else if (v8)
    {
      type metadata accessor for AppDelegate();
      swift_dynamicCastClassUnconditional();
      sub_10000E2A0();
      goto LABEL_13;
    }
    __break(1u);
    return;
  }
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  id v9 = qword_10002D1D0;
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "AutoSettings is disconnecting from an unknown scene!", v11, 2u);
    swift_slowDealloc();
  }
}

void sub_10000CD24()
{
  uint64_t v0 = sub_10000761C(&qword_10002C2F8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  id v7 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  os_log_type_t v10 = (char *)v27 - v9;
  __chkstk_darwin(v8);
  id v12 = (char *)v27 - v11;
  uint64_t v13 = swift_bridgeObjectRetain();
  unint64_t v14 = (void *)sub_10000BFA0(v13);
  swift_bridgeObjectRelease();
  if (!v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
    goto LABEL_8;
  }
  id v15 = [v14 URL];

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v16 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v16(v2, v10, v3);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
LABEL_8:
    sub_10000D5A4((uint64_t)v2);
    return;
  }
  v16(v12, v2, v3);
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  os_log_type_t v17 = qword_10002D1D0;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v12, v3);
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    id v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    *(_DWORD *)id v19 = 136315138;
    v27[1] = v19 + 4;
    sub_10000D604();
    uint64_t v20 = dispatch thunk of CustomStringConvertible.description.getter();
    v27[2] = sub_100012E98(v20, v21, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    id v22 = *(void (**)(char *, uint64_t))(v4 + 8);
    v22(v7, v3);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "AutoSettings received settings URL %s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    id v22 = *(void (**)(char *, uint64_t))(v4 + 8);
    v22(v7, v3);
  }
  id v23 = [self sharedApplication];
  id v24 = [v23 delegate];

  if (v24)
  {
    type metadata accessor for AppDelegate();
    uint64_t v25 = *(void **)(swift_dynamicCastClassUnconditional()
                   + OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager);
    id v26 = v25;
    swift_unknownObjectRelease();
    if (v25)
    {
      sub_100011064();

      v22(v12, v3);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

unint64_t sub_10000D53C()
{
  unint64_t result = qword_10002C2F0;
  if (!qword_10002C2F0)
  {
    sub_1000076B0(255, &qword_10002C2E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C2F0);
  }
  return result;
}

uint64_t sub_10000D5A4(uint64_t a1)
{
  uint64_t v2 = sub_10000761C(&qword_10002C2F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000D604()
{
  unint64_t result = qword_10002C300;
  if (!qword_10002C300)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C300);
  }
  return result;
}

uint64_t sub_10000D65C(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000D678()
{
  id v0 = [self mainBundle];
  id v1 = [v0 bundleIdentifier];

  if (v1)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_10000D740();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_10002D1D0 = result;
  return result;
}

unint64_t sub_10000D740()
{
  unint64_t result = qword_10002C370;
  if (!qword_10002C370)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002C370);
  }
  return result;
}

void sub_10000D780()
{
  qword_10002D1D8 = 0x696669746E656469;
  unk_10002D1E0 = 0xEA00000000007265;
}

uint64_t sub_10000D7A8()
{
  uint64_t v62 = type metadata accessor for URL();
  uint64_t v1 = *(void *)(v62 - 8);
  uint64_t v2 = __chkstk_darwin(v62);
  uint64_t v4 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v52 - v5;
  uint64_t v7 = sub_10000761C(&qword_10002C378);
  __chkstk_darwin(v7 - 8);
  BOOL v59 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URLQueryItem();
  uint64_t v60 = *(void *)(v9 - 8);
  uint64_t v10 = __chkstk_darwin(v9);
  id v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v58 = (char *)&v52 - v13;
  uint64_t v14 = sub_10000761C((uint64_t *)&unk_10002C380);
  __chkstk_darwin(v14 - 8);
  unint64_t v16 = (char *)&v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for URLComponents();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = v0;
  URLComponents.init(url:resolvingAgainstBaseURL:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
  {
    sub_10000E0F8((uint64_t)v16, (uint64_t *)&unk_10002C380);
    if (qword_10002BDE0 != -1) {
      swift_once();
    }
    unint64_t v21 = qword_10002D1D0;
    uint64_t v22 = v62;
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v61, v62);
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v23))
    {
      uint64_t v24 = v1;
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v65 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      sub_10000D604();
      uint64_t v26 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v64 = sub_100012E98(v26, v27, &v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v4, v62);
      _os_log_impl((void *)&_mh_execute_header, v21, v23, "Couldn't parse URL components out of %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v22);
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
    uint64_t v28 = URLComponents.queryItems.getter();
    if (v28)
    {
      uint64_t v53 = v1;
      uint64_t v29 = *(void *)(v28 + 16);
      uint64_t v30 = v60;
      uint64_t v57 = v28;
      if (v29)
      {
        BOOL v52 = v6;
        char v54 = v20;
        uint64_t v55 = v18;
        uint64_t v56 = v17;
        uint64_t v63 = *(void (**)(char *, unint64_t, uint64_t))(v60 + 16);
        unint64_t v31 = v28 + ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80));
        id v32 = (void (**)(char *, uint64_t))(v60 + 8);
        uint64_t v33 = *(void *)(v60 + 72);
        swift_bridgeObjectRetain();
        while (1)
        {
          v63(v12, v31, v9);
          uint64_t v34 = URLQueryItem.name.getter();
          uint64_t v36 = v35;
          if (qword_10002BDE8 != -1) {
            swift_once();
          }
          if (v34 == qword_10002D1D8 && v36 == unk_10002D1E0) {
            break;
          }
          char v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v38) {
            goto LABEL_22;
          }
          (*v32)(v12, v9);
          v31 += v33;
          if (!--v29)
          {
            swift_bridgeObjectRelease();
            uint64_t v39 = 1;
            uint64_t v40 = v62;
            uint64_t v1 = v53;
            uint64_t v20 = v54;
            uint64_t v18 = v55;
            uint64_t v17 = v56;
            uint64_t v6 = v52;
            uint64_t v41 = (uint64_t)v59;
            uint64_t v30 = v60;
            goto LABEL_23;
          }
        }
        swift_bridgeObjectRelease();
LABEL_22:
        swift_bridgeObjectRelease();
        uint64_t v41 = (uint64_t)v59;
        uint64_t v30 = v60;
        (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v59, v12, v9);
        uint64_t v39 = 0;
        uint64_t v40 = v62;
        uint64_t v1 = v53;
        uint64_t v20 = v54;
        uint64_t v18 = v55;
        uint64_t v17 = v56;
        uint64_t v6 = v52;
      }
      else
      {
        uint64_t v39 = 1;
        uint64_t v1 = v53;
        uint64_t v40 = v62;
        uint64_t v41 = (uint64_t)v59;
      }
LABEL_23:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v30 + 56))(v41, v39, 1, v9);
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v41, 1, v9) != 1)
      {
        uint64_t v51 = v58;
        (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v58, v41, v9);
        uint64_t v49 = URLQueryItem.value.getter();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v51, v9);
        (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
        return v49;
      }
    }
    else
    {
      uint64_t v41 = (uint64_t)v59;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v60 + 56))(v59, 1, 1, v9);
      uint64_t v40 = v62;
    }
    sub_10000E0F8(v41, &qword_10002C378);
    if (qword_10002BDE0 != -1) {
      swift_once();
    }
    uint64_t v42 = qword_10002D1D0;
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v61, v40);
    os_log_type_t v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v43))
    {
      char v54 = v20;
      uint64_t v55 = v18;
      uint64_t v56 = v17;
      uint64_t v44 = swift_slowAlloc();
      uint64_t v65 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315394;
      sub_10000D604();
      uint64_t v45 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v64 = sub_100012E98(v45, v46, &v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v40);
      *(_WORD *)(v44 + 12) = 2080;
      if (qword_10002BDE8 != -1) {
        swift_once();
      }
      uint64_t v47 = qword_10002D1D8;
      unint64_t v48 = unk_10002D1E0;
      swift_bridgeObjectRetain();
      uint64_t v64 = sub_100012E98(v47, v48, &v65);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "URL %s doesn't seem to have a %s query parameter.", (uint8_t *)v44, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v54, v56);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v40);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    }
  }
  return 0;
}

uint64_t sub_10000E0F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000761C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000E154()
{
  return sub_10000E17C();
}

uint64_t sub_10000E168()
{
  return sub_10000E17C();
}

uint64_t sub_10000E17C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_10000E2A0()
{
  return sub_10000E2D8("AutoSettings is disconnecting from a car scene!");
}

uint64_t sub_10000E2BC()
{
  return sub_10000E2D8("AutoSettings is disconnecting from a cluster scene!");
}

uint64_t sub_10000E2D8(const char *a1)
{
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10002D1D0;
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, a1, v5, 2u);
    swift_slowDealloc();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v8)
  {
    [v8 setHidden:1];
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v6 = v1;
  return static Published.subscript.setter();
}

id sub_10000E444()
{
  uint64_t v1 = sub_10000761C(&qword_10002C450);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  os_log_type_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC12AutoSettings11AppDelegate_settingsCarManager] = 0;
  uint64_t v5 = &v0[OBJC_IVAR____TtC12AutoSettings11AppDelegate__carWindow];
  uint64_t v13 = 0;
  id v6 = v0;
  sub_10000761C(&qword_10002C448);
  Published.init(initialValue:)();
  uint64_t v7 = *(void (**)(char *, char *, uint64_t))(v2 + 32);
  v7(v5, v4, v1);
  id v8 = &v6[OBJC_IVAR____TtC12AutoSettings11AppDelegate__clusterWindow];
  uint64_t v13 = 0;
  Published.init(initialValue:)();
  v7(v8, v4, v1);

  uint64_t v9 = (objc_class *)type metadata accessor for AppDelegate();
  v12.receiver = v6;
  v12.super_class = v9;
  return [super init];
}

id sub_10000E5D8()
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
  uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  os_log_type_t v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  uint64_t result = qword_10002C430;
  if (!qword_10002C430) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000E7AC()
{
  return type metadata accessor for AppDelegate();
}

void sub_10000E7B4()
{
  sub_10000E850();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000E850()
{
  if (!qword_10002C440)
  {
    sub_10000BDBC(&qword_10002C448);
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10002C440);
    }
  }
}

uint64_t sub_10000E8AC@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000E930(void **a1, void **a2)
{
  objc_super v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return static Published.subscript.setter();
}

unint64_t sub_10000E9B0()
{
  unint64_t result = qword_10002BFB8;
  if (!qword_10002BFB8)
  {
    type metadata accessor for LaunchOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002BFB8);
  }
  return result;
}

id sub_10000EA08(void *a1, uint64_t a2)
{
  id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setFont:a1];
  [v4 setTextAlignment:1];
  id v5 = [self labelColor];
  [v4 setTextColor:v5];

  [v4 setNumberOfLines:a2];
  return v4;
}

objc_class *sub_10000EAFC()
{
  uint64_t v1 = OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController____lazy_storage___cancelButton;
  objc_super v2 = *(void **)(v0
                + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController____lazy_storage___cancelButton);
  if (v2)
  {
    uint64_t v3 = *(objc_class **)(v0
                        + OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController____lazy_storage___cancelButton);
  }
  else
  {
    uint64_t v4 = v0;
    sub_1000076B0(0, &qword_10002C4A0);
    v5._countAndFlagsBits = 0x4C45434E4143;
    v5._object = (void *)0xE600000000000000;
    Class isa = UIButton.init(alertButtonTitle:)(v5).super.super.super.super.isa;
    [(objc_class *)isa addTarget:v4 action:"cancelButtonTapped" forControlEvents:64];
    uint64_t v7 = *(void **)(v4 + v1);
    *(void *)(v4 + v1) = isa;
    uint64_t v3 = isa;

    objc_super v2 = 0;
  }
  id v8 = v2;
  return v3;
}

void sub_10000EBE8()
{
  uint64_t v1 = v0;
  v52.receiver = v0;
  v52.super_class = (Class)type metadata accessor for VSFullScreenActionAlertViewController();
  [super viewDidLoad];
  id v2 = [v0 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v3 = v2;
  sub_1000076B0(0, &qword_10002C308);
  uint64_t v4 = (void *)static UIColor.cafui_tableBackground.getter();
  [v3 setBackgroundColor:v4];

  sub_1000076B0(0, &qword_10002C4A8);
  sub_10000761C(&qword_10002C148);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10001BE50;
  *(void *)(v5 + 32) = sub_10000EAFC();
  specialized Array._endMutation()();
  id v6 = (void *)UIStackView.init(axis:spacing:arrangedSubviews:)();
  [v6 setDistribution:1];
  id v7 = [v1 view];
  if (!v7)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v8 = v7;
  [v7 addSubview:v6];

  if (*(void *)&v1[OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_action])
  {
    sub_1000076B0(0, &qword_10002C4A0);
    v9._countAndFlagsBits = 0x484354495753;
    v9._object = (void *)0xE600000000000000;
    Class isa = UIButton.init(alertButtonTitle:)(v9).super.super.super.super.isa;
    [(objc_class *)isa addTarget:v1 action:"primaryAction" forControlEvents:64];
    [v6 addArrangedSubview:isa];
  }
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10001C050;
  objc_super v12 = *(void **)&v1[OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_titleLabel];
  uint64_t v13 = *(void **)&v1[OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_messageLabel];
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = v13;
  unint64_t v51 = v11;
  specialized Array._endMutation()();
  if (v51 >> 62)
  {
    sub_1000076B0(0, &qword_10002C4B0);
    id v48 = v12;
    id v49 = v13;
    swift_bridgeObjectRetain();
    _bridgeCocoaArray<A>(_:)();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v14 = v12;
    id v15 = v13;
    swift_bridgeObjectRetain();
    dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter();
    sub_1000076B0(0, &qword_10002C4B0);
  }
  swift_bridgeObjectRelease();
  unint64_t v16 = (void *)UIStackView.init(axis:spacing:arrangedSubviews:)();
  id v17 = [v1 view];
  if (!v17) {
    goto LABEL_13;
  }
  uint64_t v18 = v17;
  [v17 addSubview:v16];

  id v19 = [v1 view];
  if (v19)
  {
    uint64_t v20 = v19;
    id v21 = [v19 safeAreaLayoutGuide];

    id v50 = self;
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_10001C060;
    id v23 = [v16 topAnchor];
    id v24 = [v21 topAnchor];
    [v21 layoutFrame];
    id v25 = [v23 constraintEqualToAnchor:v24 constant:CGRectGetHeight(v53) * 0.05];

    *(void *)(v22 + 32) = v25;
    id v26 = [v16 bottomAnchor];
    id v27 = [v6 topAnchor];
    id v28 = [v26 constraintLessThanOrEqualToAnchor:v27 constant:30.0];

    *(void *)(v22 + 40) = v28;
    id v29 = [v16 leadingAnchor];
    id v30 = [v21 leadingAnchor];
    id v31 = [v29 constraintEqualToAnchor:v30 constant:12.0];

    *(void *)(v22 + 48) = v31;
    id v32 = [v16 trailingAnchor];
    id v33 = [v21 trailingAnchor];
    id v34 = [v32 constraintEqualToAnchor:v33 constant:-12.0];

    *(void *)(v22 + 56) = v34;
    id v35 = [v6 bottomAnchor];
    id v36 = [v21 bottomAnchor];
    id v37 = [v35 constraintEqualToAnchor:v36 constant:-24.0];

    *(void *)(v22 + 64) = v37;
    id v38 = [v6 leadingAnchor];
    id v39 = [v21 leadingAnchor];
    id v40 = [v38 constraintEqualToAnchor:v39 constant:12.0];

    *(void *)(v22 + 72) = v40;
    id v41 = [v6 trailingAnchor];
    id v42 = [v21 trailingAnchor];
    id v43 = [v41 constraintEqualToAnchor:v42 constant:-12.0];

    *(void *)(v22 + 80) = v43;
    id v44 = [v6 centerXAnchor];
    id v45 = [v21 centerXAnchor];
    id v46 = [v44 constraintEqualToAnchor:v45];

    *(void *)(v22 + 88) = v46;
    specialized Array._endMutation()();
    sub_1000076B0(0, (unint64_t *)&qword_10002C4B8);
    Class v47 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v50 activateConstraints:v47];

    return;
  }
LABEL_14:
  __break(1u);
}

id sub_10000F3E8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VSFullScreenActionAlertViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for VSFullScreenActionAlertViewController()
{
  return self;
}

void sub_10000F4B0()
{
  uint64_t v1 = OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_titleLabel;
  objc_super v2 = self;
  id v3 = [v2 boldSystemFontOfSize:28.0];
  sub_1000076B0(0, (unint64_t *)&unk_10002C4C0);
  *(void *)&v0[v1] = sub_10000EA08(v3, 1);
  uint64_t v4 = OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController_messageLabel;
  *(void *)&v0[v4] = sub_10000EA08([v2 preferredFontForTextStyle:UIFontTextStyleBody], 3);
  *(void *)&v0[OBJC_IVAR____TtC12AutoSettings37VSFullScreenActionAlertViewController____lazy_storage___cancelButton] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10000F5C4(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

void sub_10000F5D4()
{
  id v1 = [self sharedApplication];
  id v2 = [v1 delegate];

  if (!v2)
  {
    __break(1u);
    return;
  }
  type metadata accessor for AppDelegate();
  swift_dynamicCastClassUnconditional();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  if (v14)
  {
    int v3 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible);
    id v4 = [v14 rootViewController];
    uint64_t v5 = v4;
    if (v3 == 1)
    {
      if (v4)
      {
        type metadata accessor for CAFUILoadingViewController();
        if (swift_dynamicCastClass())
        {

LABEL_21:
          return;
        }
      }
      if (qword_10002BDE0 != -1) {
        swift_once();
      }
      uint64_t v10 = qword_10002D1D0;
      os_log_type_t v11 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v10, v11))
      {
        objc_super v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)objc_super v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "AutoSettings is setting loading spinner visible", v12, 2u);
        swift_slowDealloc();
      }
      id v13 = [objc_allocWithZone((Class)type metadata accessor for CAFUILoadingViewController()) init];
      [v14 setRootViewController:v13];
    }
    else if (v4)
    {
      type metadata accessor for CAFUILoadingViewController();
      uint64_t v6 = swift_dynamicCastClass();

      if (v6)
      {
        if (qword_10002BDE0 != -1) {
          swift_once();
        }
        id v7 = qword_10002D1D0;
        os_log_type_t v8 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v7, v8))
        {
          Swift::String v9 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)Swift::String v9 = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, v8, "AutoSettings is hiding the loading spinner", v9, 2u);
          swift_slowDealloc();
        }
        [v14 setRootViewController:0];
      }
    }
    uint64_t v5 = v14;
    goto LABEL_21;
  }
}

void sub_10000F8C8()
{
  uint64_t v1 = sub_10000761C(&qword_10002C7F0);
  __chkstk_darwin(v1 - 8);
  id v49 = (char *)v41 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10000761C(&qword_10002C7F8);
  uint64_t v51 = *(void *)(v3 - 8);
  uint64_t v52 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000761C((uint64_t *)&unk_10002C800);
  uint64_t v50 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  Swift::String v9 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  os_log_type_t v11 = (char *)v41 - v10;
  uint64_t v12 = OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_cafCarManager;
  id v13 = objc_allocWithZone((Class)CAFCarManager);
  id v14 = v0;
  *(void *)&v0[v12] = [v13 init];
  uint64_t v15 = OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_assetManager;
  type metadata accessor for CAUAssetLibraryManager();
  swift_allocObject();
  *(void *)&v14[v15] = CAUAssetLibraryManager.init()();
  Class v47 = v9;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    unint64_t v16 = (void *)sub_100013A4C((unint64_t)_swiftEmptyArrayStorage);
  }
  else {
    unint64_t v16 = &_swiftEmptySetSingleton;
  }
  *(void *)&v14[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_subscribers] = v16;
  *(void *)&v14[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController] = 0;
  Date.init()();
  *(void *)&v14[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastNotificationCount] = 0;
  v14[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_fireRenderedAndFinalizedSignposts] = 1;
  id v17 = &v14[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier];
  *(void *)id v17 = 0;
  *((void *)v17 + 1) = 0;
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  uint64_t v18 = qword_10002D1D0;
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "AutoSettings is creating a car manager!", v20, 2u);
    swift_slowDealloc();
  }
  v14[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible] = 1;
  id v21 = [objc_allocWithZone((Class)CARSessionStatus) init];
  *(void *)&v14[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_carSessionStatus] = v21;

  uint64_t v22 = (objc_class *)type metadata accessor for SettingsCarManager();
  v54.receiver = v14;
  v54.super_class = v22;
  id v23 = [super init];
  id v24 = *(void **)&v23[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_cafCarManager];
  id v25 = v23;
  [v24 registerObserver:v25];
  id v26 = v24;
  id v27 = [v26 currentCar];
  sub_100013D00(v27);

  [*(id *)&v25[OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_carSessionStatus] addSessionObserver:v25];
  id v48 = self;
  id v28 = [v48 sharedApplication];
  id v29 = [v28 delegate];

  if (v29)
  {
    uint64_t v46 = type metadata accessor for AppDelegate();
    swift_dynamicCastClassUnconditional();
    swift_beginAccess();
    uint64_t v45 = sub_10000761C(&qword_10002C450);
    Published.projectedValue.getter();
    swift_endAccess();
    swift_unknownObjectRelease();
    id v44 = self;
    id v53 = [v44 mainRunLoop];
    uint64_t v30 = type metadata accessor for NSRunLoop.SchedulerOptions();
    uint64_t v31 = *(void *)(v30 - 8);
    uint64_t v32 = (uint64_t)v49;
    id v42 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 56);
    uint64_t v43 = v30;
    v41[4] = v31 + 56;
    v42(v49, 1, 1);
    uint64_t v33 = sub_1000076B0(0, &qword_10002C810);
    uint64_t v34 = sub_10000BE04(&qword_10002C818, &qword_10002C7F8);
    unint64_t v35 = sub_100014680();
    uint64_t v36 = v52;
    v41[2] = v34;
    v41[3] = v33;
    v41[1] = v35;
    Publisher.receive<A>(on:options:)();
    sub_10000E0F8(v32, &qword_10002C7F0);

    uint64_t v51 = *(void *)(v51 + 8);
    ((void (*)(char *, uint64_t))v51)(v5, v36);
    swift_allocObject();
    swift_unknownObjectWeakInit();
    v41[0] = sub_10000BE04(&qword_10002C828, (uint64_t *)&unk_10002C800);
    Publisher<>.sink(receiveValue:)();
    swift_release();
    uint64_t v50 = *(void *)(v50 + 8);
    ((void (*)(char *, uint64_t))v50)(v11, v6);
    swift_beginAccess();
    AnyCancellable.store(in:)();
    swift_endAccess();
    swift_release();
    id v37 = [v48 sharedApplication];
    id v38 = [v37 delegate];

    if (v38)
    {
      swift_dynamicCastClassUnconditional();
      swift_beginAccess();
      Published.projectedValue.getter();
      swift_endAccess();
      swift_unknownObjectRelease();
      id v53 = [v44 mainRunLoop];
      ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v42)(v32, 1, 1, v43);
      id v39 = v47;
      uint64_t v40 = v52;
      Publisher.receive<A>(on:options:)();
      sub_10000E0F8(v32, &qword_10002C7F0);

      ((void (*)(char *, uint64_t))v51)(v5, v40);
      swift_allocObject();
      swift_unknownObjectWeakInit();
      Publisher<>.sink(receiveValue:)();
      swift_release();
      ((void (*)(char *, uint64_t))v50)(v39, v6);
      swift_beginAccess();
      AnyCancellable.store(in:)();
      swift_endAccess();
      swift_release();
      sub_1000101BC();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_100010144()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_1000101BC();
  }
}

void sub_1000101BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000761C(&qword_10002C7A0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)v96 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = [self sharedApplication];
  id v6 = [v5 delegate];

  if (!v6) {
    goto LABEL_84;
  }
  type metadata accessor for AppDelegate();
  swift_dynamicCastClassUnconditional();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  id v7 = (id)v105;
  if (v105)
  {
    id v8 = [(id)v105 rootViewController];
    if (v8)
    {
      Swift::String v9 = v8;
      self;
      if (swift_dynamicCastObjCClass())
      {

        return;
      }
    }
    id v13 = [*(id *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_carSessionStatus) currentSession];
    if (v13)
    {
      id v14 = v13;
      id v15 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                                  + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_cafCarManager), "currentCar"));
      if (v15)
      {
        unint64_t v16 = v15;
        id v17 = [v15 automakerSettings];
        if (v17)
        {
          uint64_t v18 = v17;
          if ([v17 receivedAllValues])
          {
            id v19 = [v16 automakerNotificationHistory];
            if (!v19) {
              goto LABEL_50;
            }
            uint64_t v20 = v19;
            id v101 = v18;
            id v21 = [v19 historicalNotifications];
            if (!v21)
            {

              uint64_t v18 = v101;
              goto LABEL_50;
            }
            uint64_t v22 = v21;
            sub_1000076B0(0, &qword_10002C150);
            unint64_t v23 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

            id v102 = v14;
            id v99 = v20;
            uint64_t v100 = v16;
            if (v23 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
              if (v24) {
                goto LABEL_19;
              }
            }
            else
            {
              uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain();
              if (v24)
              {
LABEL_19:
                if (v24 >= 1)
                {
                  for (uint64_t i = 0; i != v24; ++i)
                  {
                    if ((v23 & 0xC000000000000001) != 0) {
                      id v29 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
                    }
                    else {
                      id v29 = *(id *)(v23 + 8 * i + 32);
                    }
                    uint64_t v30 = v29;
                    [v29 registerObserver:v1];
                  }
                  goto LABEL_49;
                }
                __break(1u);
LABEL_84:
                __break(1u);
                return;
              }
            }
LABEL_49:

            swift_bridgeObjectRelease_n();
            uint64_t v18 = v101;
            id v14 = v102;
            unint64_t v16 = v100;
LABEL_50:
            *(unsigned char *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible) = 0;
            sub_10000F5D4();
            [v18 unregisterObserver:v1];
            id v47 = [v16 automakerNotificationHistory];
            if (v47)
            {
              sub_1000079CC();
              unint64_t v49 = v48;

              if (v49 >> 62)
              {
                swift_bridgeObjectRetain();
                id v47 = (id)_CocoaArrayWrapper.endIndex.getter();
                swift_bridgeObjectRelease();
              }
              else
              {
                id v47 = *(id *)((v49 & 0xFFFFFFFFFFFFFF8) + 0x10);
              }
              swift_bridgeObjectRelease();
            }
            *(void *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastNotificationCount) = v47;
            id v50 = [v7 rootViewController];

            if (v50)
            {
              if (qword_10002BDE0 != -1) {
                swift_once();
              }
              uint64_t v51 = qword_10002D1D0;
              os_log_type_t v52 = static os_log_type_t.default.getter();
              if (os_log_type_enabled(v51, v52))
              {
                id v53 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)id v53 = 0;
                _os_log_impl((void *)&_mh_execute_header, v51, v52, "car window root view controller isn't nil", v53, 2u);
                swift_slowDealloc();
              }

              return;
            }
            if (qword_10002BDE0 != -1) {
              swift_once();
            }
            objc_super v54 = qword_10002D1D0;
            id v55 = v16;
            os_log_type_t v56 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v54, v56))
            {
              os_log_t v98 = v54;
              uint64_t v57 = (uint8_t *)swift_slowAlloc();
              uint64_t v58 = (void *)swift_slowAlloc();
              id v101 = v18;
              *(_DWORD *)uint64_t v57 = 138412290;
              v96[1] = v57 + 4;
              uint64_t v97 = v57;
              uint64_t v105 = (uint64_t)v55;
              id v59 = v55;
              id v99 = v55;
              id v60 = v59;
              uint64_t v18 = v101;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              void *v58 = v16;

              id v55 = v99;
              _os_log_impl((void *)&_mh_execute_header, v98, v56, "Connecting to car main scene for %@", v97, 0xCu);
              sub_10000761C(&qword_10002C790);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();
            }
            else
            {
            }
            id v61 = v14;
            id v62 = [v55 audioSettings];
            objc_allocWithZone((Class)type metadata accessor for VSRootViewController());
            id v63 = v18;
            swift_retain();
            id v101 = v63;
            id v102 = v61;
            uint64_t v64 = VSRootViewController.init(carSession:audioSettings:autoSettings:assetManager:)(v61, v62, v63);
            NSString v65 = String._bridgeToObjectiveC()();
            id v66 = sub_100013984(v65);

            NSString v67 = v66;
            if (!v66)
            {
              static String._unconditionallyBridgeFromObjectiveC(_:)();
              NSString v67 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease();
            }
            uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            unint64_t v70 = v69;
            id v71 = [v55 vehicleResources];
            if (v71)
            {
              uint64_t v72 = v71;
              id v73 = [v71 vehicleInformation];

              if (v73)
              {
                id v99 = v55;
                id v74 = [v73 vehicleUserVisibleLabel];

                uint64_t v75 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                unint64_t v77 = v76;

                uint64_t v78 = HIBYTE(v77) & 0xF;
                if ((v77 & 0x2000000000000000) == 0) {
                  uint64_t v78 = v75 & 0xFFFFFFFFFFFFLL;
                }
                if (v78)
                {

                  uint64_t v105 = v75;
                  unint64_t v106 = v77;
                  uint64_t v103 = v68;
                  v104 = v70;
                  uint64_t v79 = type metadata accessor for Locale();
                  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v79 - 8) + 56))(v4, 1, 1, v79);
                  sub_1000139F8();
                  StringProtocol.range<A>(of:options:range:locale:)();
                  char v81 = v80;
                  sub_10000E0F8((uint64_t)v4, &qword_10002C7A0);
                  if (v81)
                  {
                    uint64_t v105 = 32;
                    unint64_t v106 = 0xE100000000000000;
                    uint64_t v84 = v64;
                    v85._countAndFlagsBits = v68;
                    v85._object = v70;
                    String.append(_:)(v85);
                    swift_bridgeObjectRelease();
                    uint64_t v86 = v105;
                    v87 = (void *)v106;
                    uint64_t v105 = v75;
                    unint64_t v106 = v77;
                    swift_bridgeObjectRetain();
                    v88._countAndFlagsBits = v86;
                    v88._object = v87;
                    String.append(_:)(v88);
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    swift_bridgeObjectRelease();
                    uint64_t v82 = v64;
                  }
                  NSString v67 = String._bridgeToObjectiveC()();
                  swift_bridgeObjectRelease();
                  id v55 = v99;
                  goto LABEL_78;
                }
                swift_bridgeObjectRelease();
                id v55 = v99;
              }
            }
            swift_bridgeObjectRelease();
            unsigned int v83 = v64;
LABEL_78:
            uint64_t v90 = v101;
            uint64_t v89 = v102;
            [v64 setTitle:v67];

            unint64_t v91 = *(void **)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController);
            *(void *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController) = v64;
            uint64_t v92 = v64;

            id v93 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v92];
            [v93 setDelegate:v1];
            [v7 setRootViewController:v93];
            unint64_t v94 = *(void *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier + 8);
            if (v94)
            {
              uint64_t v95 = *(void *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
              swift_bridgeObjectRetain();
              sub_10001119C(v95, v94);
              swift_bridgeObjectRelease();
            }

            return;
          }
          if (qword_10002BDE0 != -1) {
            swift_once();
          }
          id v41 = qword_10002D1D0;
          id v42 = v18;
          os_log_type_t v43 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v41, v43))
          {
            id v44 = v16;
            uint64_t v45 = v14;
            uint64_t v46 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v46 = 67109120;
            LODWORD(v105) = [v42 receivedAllValues];
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            _os_log_impl((void *)&_mh_execute_header, v41, v43, "Waiting for automaker settings to receive all values current... receivedAllValues=%{BOOL}d", v46, 8u);
            id v14 = v45;
            unint64_t v16 = v44;
            swift_slowDealloc();
          }
          else
          {
          }
          *(unsigned char *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible) = 1;
          sub_10000F5D4();
        }
        else
        {
          if (qword_10002BDE0 != -1) {
            swift_once();
          }
          uint64_t v34 = qword_10002D1D0;
          id v35 = v16;
          os_log_type_t v36 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v34, v36))
          {
            uint64_t v37 = swift_slowAlloc();
            *(_DWORD *)uint64_t v37 = 134218240;
            id v101 = (id)(v37 + 4);
            id v38 = [v35 accessories];
            type metadata accessor for UUID();
            sub_1000076B0(0, &qword_10002C7A8);
            id v102 = v14;
            sub_100014638(&qword_10002C7B0, (void (*)(uint64_t))&type metadata accessor for UUID);
            uint64_t v39 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

            uint64_t v40 = *(void *)(v39 + 16);
            swift_bridgeObjectRelease();
            uint64_t v105 = v40;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            *(_WORD *)(v37 + 12) = 1024;
            LODWORD(v39) = [v35 isConfigured];

            LODWORD(v105) = v39;
            id v14 = v102;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            _os_log_impl((void *)&_mh_execute_header, v34, v36, "Waiting for automaker settings to exist... count=%ld isConfigured=%{BOOL}d", (uint8_t *)v37, 0x12u);
            swift_slowDealloc();
          }
          else
          {
          }
          *(unsigned char *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible) = 1;
          sub_10000F5D4();
        }
      }
      else
      {
        if (qword_10002BDE0 != -1) {
          swift_once();
        }
        uint64_t v31 = qword_10002D1D0;
        os_log_type_t v32 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v31, v32))
        {
          uint64_t v33 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v33 = 0;
          _os_log_impl((void *)&_mh_execute_header, v31, v32, "Waiting for a car...", v33, 2u);
          swift_slowDealloc();
        }
        *(unsigned char *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible) = 1;
        sub_10000F5D4();
      }
    }
    else
    {
      if (qword_10002BDE0 != -1) {
        swift_once();
      }
      id v26 = qword_10002D1D0;
      os_log_type_t v27 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v26, v27))
      {
        id v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "Waiting for a car session...", v28, 2u);
        swift_slowDealloc();
      }
      *(unsigned char *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_spinnerVisible) = 1;
      sub_10000F5D4();
    }
  }
  else
  {
    if (qword_10002BDE0 != -1) {
      swift_once();
    }
    uint64_t v10 = qword_10002D1D0;
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Waiting for a car window...", v12, 2u);
      swift_slowDealloc();
    }
  }
}

uint64_t sub_100011064()
{
  uint64_t v0 = sub_10000D7A8();
  if (v1)
  {
    uint64_t v2 = HIBYTE(v1) & 0xF;
    if ((v1 & 0x2000000000000000) == 0) {
      uint64_t v2 = v0 & 0xFFFFFFFFFFFFLL;
    }
    if (v2)
    {
      sub_10001119C(v0, v1);
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_10002D1D0;
  os_log_type_t v5 = static os_log_type_t.default.getter();
  uint64_t result = os_log_type_enabled(v4, v5);
  if (result)
  {
    id v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "No available settings identifier in URL.", v6, 2u);
    return swift_slowDealloc();
  }
  return result;
}

uint64_t sub_10001119C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController;
  uint64_t v7 = *(void *)(v2 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_rootViewController);
  if (v7)
  {
    long long v9 = *(_OWORD *)(v7 + direct field offset for CAFUITileViewController.settingsCache + 16);
    long long v8 = *(_OWORD *)(v7 + direct field offset for CAFUITileViewController.settingsCache + 32);
    long long v10 = *(_OWORD *)(v7 + direct field offset for CAFUITileViewController.settingsCache);
    uint64_t v87 = *(void *)(v7 + direct field offset for CAFUITileViewController.settingsCache + 48);
    long long v85 = v9;
    long long v86 = v8;
    long long v84 = v10;
    if (*(void *)(v7 + direct field offset for CAFUITileViewController.requestContentManager))
    {
      uint64_t v88 = v84;
      if ((unint64_t)v84 >> 62)
      {
        sub_1000134F0((uint64_t)&v84);
        swift_retain();
        sub_1000136FC((uint64_t)&v88);
        uint64_t v74 = _CocoaArrayWrapper.endIndex.getter();
        sub_100013728((uint64_t)&v88);
        if (v74) {
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t v11 = *(void *)((v84 & 0xFFFFFFFFFFFFFF8) + 0x10);
        sub_1000134F0((uint64_t)&v84);
        swift_retain();
        if (v11)
        {
LABEL_5:
          uint64_t v12 = *((void *)&v85 + 1);
          if (*(void *)(*((void *)&v85 + 1) + 16))
          {
            swift_bridgeObjectRetain();
            unint64_t v13 = sub_1000135DC(a1, a2);
            if (v14)
            {
              id v15 = *(id *)(*(void *)(v12 + 56) + 8 * v13);
              swift_bridgeObjectRelease();
              swift_getObjectType();
              uint64_t v16 = swift_conformsToProtocol2();
              if (v16) {
                uint64_t v17 = v16;
              }
              else {
                uint64_t v17 = 0;
              }
              if (v16) {
                id v18 = v15;
              }
              else {
                id v18 = 0;
              }
              id v82 = v15;
              if (v18)
              {
                uint64_t ObjectType = swift_getObjectType();
                uint64_t v20 = *(void *)(v17 + 8);
                id v21 = *(uint64_t (**)(void, void, uint64_t, uint64_t))(v20 + 72);
                id v22 = v15;
                unint64_t v23 = (void *)v21(0, 0, ObjectType, v20);
                uint64_t v25 = v24;
                unsigned __int8 v27 = v26;
                LODWORD(v21) = v26;

                if (!v21) {
                  goto LABEL_49;
                }
                sub_1000136D4(v23, v25, v27);
                id v15 = v82;
              }
              swift_getObjectType();
              uint64_t v28 = swift_conformsToProtocol2();
              if (v28) {
                uint64_t v29 = v28;
              }
              else {
                uint64_t v29 = 0;
              }
              if (v28) {
                id v30 = v15;
              }
              else {
                id v30 = 0;
              }
              if (!v30)
              {
LABEL_25:
                unint64_t v40 = CAFUISettingsCache.visibleChildren(of:)();
                if (v40 >> 62) {
                  uint64_t v41 = _CocoaArrayWrapper.endIndex.getter();
                }
                else {
                  uint64_t v41 = *(void *)((v40 & 0xFFFFFFFFFFFFFF8) + 0x10);
                }
                swift_bridgeObjectRelease();
                if (v41)
                {
                  id v42 = v15;
                  goto LABEL_29;
                }
                uint64_t v58 = *((void *)&v86 + 1);
                if (*(void *)(*((void *)&v86 + 1) + 16))
                {
                  swift_bridgeObjectRetain();
                  unint64_t v59 = sub_1000135DC(a1, a2);
                  if (v60)
                  {
                    id v42 = *(id *)(*(void *)(v58 + 56) + 8 * v59);
                    swift_bridgeObjectRelease();
LABEL_29:
                    id v43 = v42;
                    uint64_t v44 = CAFUISettingsCache.sections(for:)();

                    if (*(void *)(v44 + 16))
                    {
LABEL_30:
                      if ([*(id *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_carSessionStatus) currentSession])
                      {
                        if (qword_10002BDE0 != -1) {
                          swift_once();
                        }
                        uint64_t v45 = qword_10002D1D0;
                        swift_bridgeObjectRetain_n();
                        os_log_type_t v46 = static os_log_type_t.default.getter();
                        if (os_log_type_enabled(v45, v46))
                        {
                          id v80 = v43;
                          id v47 = (uint8_t *)swift_slowAlloc();
                          uint64_t v83 = swift_slowAlloc();
                          *(_DWORD *)id v47 = 136315138;
                          uint64_t v79 = v47 + 4;
                          swift_bridgeObjectRetain();
                          sub_100012E98(a1, a2, &v83);
                          UnsafeMutableRawBufferPointer.copyMemory(from:)();
                          swift_bridgeObjectRelease_n();
                          _os_log_impl((void *)&_mh_execute_header, v45, v46, "Launching modal settings presentation for setting %s", v47, 0xCu);
                          swift_arrayDestroy();
                          swift_slowDealloc();
                          id v43 = v80;
                          swift_slowDealloc();
                        }
                        else
                        {
                          swift_bridgeObjectRelease_n();
                        }
                        uint64_t v57 = v82;
                        objc_allocWithZone((Class)type metadata accessor for CAFUITileViewController());
                        swift_retain();
                        swift_retain();
                        unint64_t v23 = (void *)CAFUITileViewController.init(carSession:prominentCategories:listItems:settingsSections:settingsCache:assetManager:requestContentManager:preventVolumeNotification:)();

                        goto LABEL_59;
                      }
                      swift_bridgeObjectRelease();
                      sub_100013654((uint64_t)&v84);
                      if (qword_10002BDE0 != -1) {
                        swift_once();
                      }
                      id v61 = qword_10002D1D0;
                      os_log_type_t v62 = static os_log_type_t.default.getter();
                      if (!os_log_type_enabled(v61, v62)) {
                        goto LABEL_72;
                      }
                      id v63 = (uint8_t *)swift_slowAlloc();
                      *(_WORD *)id v63 = 0;
                      _os_log_impl((void *)&_mh_execute_header, v61, v62, "Car session not available.", v63, 2u);
                      goto LABEL_70;
                    }
LABEL_66:
                    swift_bridgeObjectRelease();
                    sub_100013654((uint64_t)&v84);
                    if (qword_10002BDE0 != -1) {
                      swift_once();
                    }
                    unint64_t v70 = qword_10002D1D0;
                    swift_bridgeObjectRetain_n();
                    os_log_type_t v71 = static os_log_type_t.default.getter();
                    if (!os_log_type_enabled(v70, v71))
                    {
                      swift_bridgeObjectRelease_n();
                      goto LABEL_72;
                    }
                    id v81 = v43;
                    uint64_t v72 = (uint8_t *)swift_slowAlloc();
                    uint64_t v83 = swift_slowAlloc();
                    *(_DWORD *)uint64_t v72 = 136315138;
                    swift_bridgeObjectRetain();
                    sub_100012E98(a1, a2, &v83);
                    UnsafeMutableRawBufferPointer.copyMemory(from:)();
                    swift_bridgeObjectRelease_n();
                    _os_log_impl((void *)&_mh_execute_header, v70, v71, "No settings sections with setting %s", v72, 0xCu);
                    swift_arrayDestroy();
                    swift_slowDealloc();
                    id v43 = v81;
LABEL_70:
                    swift_slowDealloc();
LABEL_72:
                    id v73 = (void *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
                    *id v73 = 0;
                    v73[1] = 0;

                    swift_release();
                    return swift_bridgeObjectRelease();
                  }
                  swift_bridgeObjectRelease();
                }
                [v15 category];
                id v43 = 0;
                if (*(void *)(CAFUISettingsCache.categorySettings(for:)() + 16)) {
                  goto LABEL_30;
                }
                goto LABEL_66;
              }
              uint64_t v31 = swift_getObjectType();
              uint64_t v32 = *(void *)(v29 + 8);
              uint64_t v33 = *(uint64_t (**)(void, void, uint64_t, uint64_t))(v32 + 72);
              id v34 = v15;
              unint64_t v23 = (void *)v33(0, 0, v31, v32);
              uint64_t v36 = v35;
              unsigned __int8 v38 = v37;
              int v39 = v37;

              if (v39)
              {
                sub_1000136D4(v23, v36, v38);
                id v15 = v82;
                goto LABEL_25;
              }
LABEL_49:
              sub_100013654((uint64_t)&v84);
              uint64_t v57 = v82;
LABEL_59:
              NSString v64 = [v57 userVisibleLabel];
              if (!v64)
              {
                static String._unconditionallyBridgeFromObjectiveC(_:)();
                NSString v64 = String._bridgeToObjectiveC()();
                swift_bridgeObjectRelease();
              }
              [v23 setTitle:v64];

              id v65 = [v23 navigationItem];
              id v66 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:24 target:v3 action:"dismissSettingsModal"];
              [v65 setLeftBarButtonItem:v66];

              id v67 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v23];
              uint64_t v68 = *(void **)(v3 + v6);
              if (v68) {
                [v68 presentViewController:v67 animated:1 completion:0];
              }
              uint64_t v69 = (void *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
              *uint64_t v69 = 0;
              v69[1] = 0;

              swift_release();
              return swift_bridgeObjectRelease();
            }
            swift_bridgeObjectRelease();
          }
          sub_100013654((uint64_t)&v84);
          if (qword_10002BDE0 != -1) {
            swift_once();
          }
          id v53 = qword_10002D1D0;
          swift_bridgeObjectRetain_n();
          os_log_type_t v54 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v53, v54))
          {
            id v55 = (uint8_t *)swift_slowAlloc();
            uint64_t v83 = swift_slowAlloc();
            *(_DWORD *)id v55 = 136315138;
            swift_bridgeObjectRetain();
            sub_100012E98(a1, a2, &v83);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v53, v54, "No known setting with identifier %s.", v55, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {
            swift_bridgeObjectRelease_n();
          }
          os_log_type_t v56 = (void *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
          *os_log_type_t v56 = 0;
          v56[1] = 0;
LABEL_79:
          swift_release();
          return swift_bridgeObjectRelease();
        }
      }
      sub_100013654((uint64_t)&v84);
      if (qword_10002BDE0 != -1) {
        swift_once();
      }
      uint64_t v75 = qword_10002D1D0;
      os_log_type_t v76 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v75, v76))
      {
        unint64_t v77 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v77 = 0;
        _os_log_impl((void *)&_mh_execute_header, v75, v76, "AutoSettings doesn't yet have an automakerSettings accessory.", v77, 2u);
        swift_slowDealloc();
      }
      uint64_t v78 = (uint64_t *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
      *uint64_t v78 = a1;
      v78[1] = a2;
      swift_bridgeObjectRetain();
      goto LABEL_79;
    }
  }
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  unint64_t v48 = qword_10002D1D0;
  os_log_type_t v49 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v48, v49))
  {
    id v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v50 = 0;
    _os_log_impl((void *)&_mh_execute_header, v48, v49, "AutoSettings has no root view controller, and cannot yet show a setting by URL", v50, 2u);
    swift_slowDealloc();
  }
  uint64_t v51 = (uint64_t *)(v3 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_modalSettingsIdentifier);
  *uint64_t v51 = a1;
  v51[1] = a2;
  swift_bridgeObjectRetain();

  return swift_bridgeObjectRelease();
}

void sub_100011D98(void *a1)
{
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_10002D1D0;
  id v4 = a1;
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    id v8 = v4;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v7 = v4;

    _os_log_impl((void *)&_mh_execute_header, v3, v5, "%@ has updated accessories", v6, 0xCu);
    sub_10000761C(&qword_10002C790);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v9 = [v4 automakerSettings];
  if (v9)
  {
    long long v10 = v9;
    [v9 registerObserver:v1];
  }
  id v11 = [v4 automakerNotificationHistory];
  if (v11)
  {
    uint64_t v12 = v11;
    [v11 registerObserver:v1];
  }
  sub_1000101BC();
}

void sub_100012158(void *a1)
{
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_10002D1D0;
  id v3 = a1;
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v4))
  {
    uint64_t v5 = swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412546;
    id v6 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v7 = v3;

    *(_WORD *)(v5 + 12) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v2, v4, "%@ updated receivedAllValues=%{BOOL}d", (uint8_t *)v5, 0x12u);
    sub_10000761C(&qword_10002C790);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_1000101BC();
}

void sub_100012378()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_1000101BC();
  }
}

uint64_t sub_1000123CC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100012470()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&v32 - v7;
  id v9 = [self sharedApplication];
  id v10 = [v9 delegate];

  if (v10)
  {
    type metadata accessor for AppDelegate();
    swift_dynamicCastClassUnconditional();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_unknownObjectRelease();
    swift_release();
    swift_release();
    id v11 = v33;
    if (v33)
    {
      id v12 = [v33 rootViewController];

      if (v12)
      {
        self;
        uint64_t v13 = swift_dynamicCastObjCClass();
        if (v13)
        {
          char v14 = (void *)v13;
          Date.init()();
          uint64_t v15 = v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastBackgroundTime;
          swift_beginAccess();
          (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v15, v2);
          Date.timeIntervalSince(_:)();
          double v17 = v16;
          id v18 = *(void (**)(char *, uint64_t))(v3 + 8);
          v18(v6, v2);
          v18(v8, v2);
          id v19 = [*(id *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_cafCarManager) currentCar];
          if (v19
            && (uint64_t v20 = v19,
                id v21 = [v19 automakerNotificationHistory],
                v20,
                v21))
          {
            sub_1000079CC();
            unint64_t v23 = v22;

            if (v23 >> 62)
            {
              swift_bridgeObjectRetain();
              uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
              swift_bridgeObjectRelease();
            }
            else
            {
              uint64_t v24 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
            }
            swift_bridgeObjectRelease();
            if (v17 >= 420.0)
            {
LABEL_10:
              if (qword_10002BDE0 != -1) {
                swift_once();
              }
              uint64_t v25 = qword_10002D1D0;
              os_log_type_t v26 = static os_log_type_t.default.getter();
              if (os_log_type_enabled(v25, v26))
              {
                unsigned __int8 v27 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)unsigned __int8 v27 = 0;
                _os_log_impl((void *)&_mh_execute_header, v25, v26, "Settings app root timeout; returning to root view",
                  v27,
                  2u);
                swift_slowDealloc();
              }
              goto LABEL_22;
            }
          }
          else
          {
            uint64_t v24 = 0;
            if (v17 >= 420.0) {
              goto LABEL_10;
            }
          }
          if (v17 < 210.0
            || *(void *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastNotificationCount) == v24)
          {
            goto LABEL_23;
          }
          if (qword_10002BDE0 != -1) {
            swift_once();
          }
          uint64_t v28 = qword_10002D1D0;
          os_log_type_t v29 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v28, v29))
          {
            id v30 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v30 = 0;
            _os_log_impl((void *)&_mh_execute_header, v28, v29, "Settings app half timeout due to notification count update; returning to root view",
              v30,
              2u);
            swift_slowDealloc();
          }
LABEL_22:
          id v31 = [v14 popToRootViewControllerAnimated:1];

          id v12 = v31;
          if (!v31)
          {
LABEL_24:
            *(void *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_lastNotificationCount) = v24;
            return;
          }
LABEL_23:

          goto LABEL_24;
        }
      }
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_100012958()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SettingsCarManager();
  return [super dealloc];
}

uint64_t sub_100012A64()
{
  return type metadata accessor for SettingsCarManager();
}

uint64_t type metadata accessor for SettingsCarManager()
{
  uint64_t result = qword_10002C780;
  if (!qword_10002C780) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100012AB8()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100012D9C@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100012E20(void **a1, void **a2)
{
  objc_super v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return static Published.subscript.setter();
}

uint64_t sub_100012E98(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100012F6C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000137A4((uint64_t)v12, *a3);
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
      sub_1000137A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100013754((uint64_t)v12);
  return v7;
}

uint64_t sub_100012F6C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100013128(a5, a6);
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

uint64_t sub_100013128(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000131C0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000133A0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000133A0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000131C0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100013338(v2, 0);
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

void *sub_100013338(uint64_t a1, uint64_t a2)
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
  sub_10000761C(&qword_10002C798);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000133A0(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000761C(&qword_10002C798);
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

uint64_t sub_1000134F0(uint64_t a1)
{
  return a1;
}

unint64_t sub_100013570(Swift::UInt8 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  Swift::Int v2 = Hasher._finalize()();

  return sub_100013800(a1, v2);
}

unint64_t sub_1000135DC(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000138A0(a1, a2, v4);
}

uint64_t sub_100013654(uint64_t a1)
{
  return a1;
}

void sub_1000136D4(void *a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 == 2)
  {
    swift_bridgeObjectRelease();
  }
  else if (a3 <= 1u)
  {
  }
}

uint64_t sub_1000136FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100013728(uint64_t a1)
{
  return a1;
}

uint64_t sub_100013754(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000137A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_100013800(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1000138A0(uint64_t a1, uint64_t a2, uint64_t a3)
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

id sub_100013984(void *a1)
{
  id v1 = a1;
  uint64_t v2 = CAFUIFrameworkBundle();
  uint64_t v3 = [v2 localizedStringForKey:v1 value:&stru_100025050 table:@"Localizable"];

  return v3;
}

unint64_t sub_1000139F8()
{
  unint64_t result = qword_10002C7B8;
  if (!qword_10002C7B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C7B8);
  }
  return result;
}

unint64_t sub_100013A4C(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_10000761C(&qword_10002C830);
      unint64_t result = static _SetStorage.allocate(capacity:)();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      unint64_t result = swift_bridgeObjectRelease();
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
    unint64_t result = specialized _ArrayBuffer._getElementSlowPath(_:)();
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_25;
    }
LABEL_18:
    type metadata accessor for AnyCancellable();
    sub_100014638(&qword_10002C838, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    unint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_100014638((unint64_t *)&unk_10002C840, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
      while (1)
      {
        unint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
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
      unint64_t result = swift_release();
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
  unint64_t result = swift_retain();
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

void sub_100013D00(void *a1)
{
  if (a1)
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC12AutoSettings18SettingsCarManager_fireRenderedAndFinalizedSignposts) = 1;
    uint64_t v3 = qword_10002BDE0;
    id v4 = a1;
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v5 = &unk_10002D000;
    uint64_t v6 = qword_10002D1D0;
    id v7 = v4;
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v6, v8))
    {
      unint64_t v9 = (uint8_t *)swift_slowAlloc();
      BOOL v10 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v9 = 138412290;
      os_log_t log = v6;
      id v23 = v7;
      id v11 = v7;
      uint64_t v5 = &unk_10002D000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v10 = a1;

      _os_log_impl((void *)&_mh_execute_header, v6, v8, "%@ has been updated", v9, 0xCu);
      sub_10000761C(&qword_10002C790);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    [v7 registerObserver:v1 log:v23];
    id v12 = [v7 automakerSettings];
    if (v12)
    {
      unint64_t v13 = *((void *)v5 + 58);
      id v14 = v12;
      os_log_type_t v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v13, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 67109120;
        [v14 receivedAllValues];
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        _os_log_impl((void *)&_mh_execute_header, v13, v15, "AutomakerSettings is available... receivedAllValues=%{BOOL}d", v16, 8u);
        swift_slowDealloc();
      }
      else
      {
      }
      [v14 registerObserver:v1];
    }
    id v17 = [v7 automakerNotificationHistory];
    if (v17)
    {
      uint64_t v18 = *((void *)v5 + 58);
      id v19 = v17;
      os_log_type_t v20 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v20))
      {
        unint64_t v21 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v21 = 67109120;
        [v19 receivedAllValues];
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        _os_log_impl((void *)&_mh_execute_header, v18, v20, "NotificationHistory is available... receivedAllValues=%{BOOL}d", v21, 8u);
        swift_slowDealloc();
      }
      else
      {
      }
      [v19 registerObserver:v1];
    }
    sub_1000101BC();
  }
}

void sub_100014080(void *a1)
{
  if (qword_10002BDE0 != -1) {
    swift_once();
  }
  unint64_t v2 = qword_10002D1D0;
  id v3 = a1;
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 138412290;
    id v7 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v6 = v3;

    _os_log_impl((void *)&_mh_execute_header, v2, v4, "%@ has updated receivedAllValues", v5, 0xCu);
    sub_10000761C(&qword_10002C790);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  sub_1000101BC();
}

uint64_t sub_100014200(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v3 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v6 = *(id *)(a1 + 8 * i + 32);
    }
    id v7 = v6;
    [v6 unregisterObserver:v1];
  }
LABEL_10:

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000142E8()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v11 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  unint64_t v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  uint64_t v3 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_1000076B0(0, &qword_10002C7C8);
  id v7 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_100014618;
  aBlock[5] = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000123CC;
  aBlock[3] = &unk_100024F98;
  os_log_type_t v8 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_100014638(&qword_10002C7D0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000761C(&qword_10002C7D8);
  sub_10000BE04(&qword_10002C7E0, &qword_10002C7D8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v8);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v10);
  return swift_release();
}

uint64_t sub_1000145E0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100014618()
{
}

uint64_t sub_100014620(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100014630()
{
  return swift_release();
}

uint64_t sub_100014638(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100014680()
{
  unint64_t result = qword_10002C820;
  if (!qword_10002C820)
  {
    sub_1000076B0(255, &qword_10002C810);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002C820);
  }
  return result;
}

void sub_1000146E8()
{
}

void *VSRootViewController.__allocating_init(carSession:audioSettings:autoSettings:assetManager:)(void *a1, void *a2, void *a3)
{
  id v7 = objc_allocWithZone(v3);
  return VSRootViewController.init(carSession:audioSettings:autoSettings:assetManager:)(a1, a2, a3);
}

void *VSRootViewController.init(carSession:audioSettings:autoSettings:assetManager:)(void *a1, void *a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem;
  *(void *)&v4[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem] = 0;
  uint64_t v9 = OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem;
  *(void *)&v4[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem] = 0;
  uint64_t v10 = OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem;
  *(void *)&v4[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem] = 0;
  type metadata accessor for CAFUIRequestContentManager();
  swift_allocObject();
  uint64_t v11 = v4;
  id v53 = a1;
  uint64_t v57 = CAFUIRequestContentManager.init(session:)();
  *(void *)&v4[v10] = 0;
  swift_release();
  *(void *)&v4[v8] = 0;
  swift_release();
  *(void *)&v4[v9] = 0;
  swift_release();
  *(void *)&v11[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_autoSettings] = a3;
  *(void *)&v11[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioSettings] = a2;
  os_log_type_t v54 = a2;
  id v12 = a2;
  id v56 = a3;

  CAFAutomakerSettings.allSettings.getter();
  id v13 = [v56 settingsSections];
  if (v13)
  {
    id v14 = v13;
    sub_1000076B0(0, (unint64_t *)&unk_10002C8D8);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v55 = v12;
  CAFUISettingsCache.init(settings:sections:)();
  uint64_t v15 = CAFUISettingsCache.categorySettings(for:)();
  uint64_t v16 = CAFUISettingsCache.categorySettings(for:)();
  int64_t v17 = *(void *)(v16 + 16);
  if (v17)
  {
    sub_100015E3C(0, v17, 0);
    uint64_t v18 = (uint64_t *)(v16 + 72);
    do
    {
      uint64_t v19 = *v18;
      unint64_t v20 = _swiftEmptyArrayStorage[2];
      unint64_t v21 = _swiftEmptyArrayStorage[3];
      swift_bridgeObjectRetain();
      if (v20 >= v21 >> 1) {
        sub_100015E3C(v21 > 1, v20 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v20 + 1;
      _swiftEmptyArrayStorage[v20 + 4] = v19;
      v18 += 6;
      --v17;
    }
    while (v17);
  }
  sub_100014F40((uint64_t)_swiftEmptyArrayStorage);
  if ((v22 & 0xC000000000000001) != 0) {
    uint64_t v23 = __CocoaSet.count.getter();
  }
  else {
    uint64_t v23 = *(void *)(v22 + 16);
  }
  swift_bridgeObjectRelease();
  if (v23 <= 9999) {
    swift_bridgeObjectRetain();
  }
  uint64_t v24 = *(void *)(v16 + 16);
  swift_bridgeObjectRelease();
  if (v24)
  {
    uint64_t v25 = sub_100015D40(0, 1, 1, _swiftEmptyArrayStorage);
    unint64_t v27 = v25[2];
    unint64_t v26 = v25[3];
    if (v27 >= v26 >> 1) {
      uint64_t v25 = sub_100015D40((void *)(v26 > 1), v27 + 1, 1, v25);
    }
    v25[2] = v27 + 1;
    *((unsigned char *)v25 + v27 + 32) = 0;
  }
  else
  {
    uint64_t v25 = _swiftEmptyArrayStorage;
  }
  uint64_t v28 = *(void *)(v15 + 16);
  swift_bridgeObjectRelease();
  if (v28)
  {
    os_log_type_t v29 = v56;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v25 = sub_100015D40(0, v25[2] + 1, 1, v25);
    }
    unint64_t v31 = v25[2];
    unint64_t v30 = v25[3];
    if (v31 >= v30 >> 1) {
      uint64_t v25 = sub_100015D40((void *)(v30 > 1), v31 + 1, 1, v25);
    }
    v25[2] = v31 + 1;
    *((unsigned char *)v25 + v31 + 32) = 3;
  }
  else
  {
    os_log_type_t v29 = v56;
  }
  id v32 = v53;
  swift_retain();
  swift_retain();
  id v33 = (id)CAFUITileViewController.init(carSession:prominentCategories:listItems:settingsSections:settingsCache:assetManager:requestContentManager:preventVolumeNotification:)();
  id v34 = [v29 car];
  if (!v34) {
    goto LABEL_38;
  }
  uint64_t v35 = v34;
  id v36 = [v34 automakerNotificationHistory];
  if (!v36)
  {

LABEL_38:
    *(void *)((char *)v33 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem) = 0;
    swift_release();
    id v41 = [self sharedApplication];
    [v41 setApplicationIconBadgeNumber:0];
    goto LABEL_39;
  }
  unsigned __int8 v37 = v36;
  sub_1000079CC();
  unint64_t v39 = v38;

  if (v39 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v43 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v43) {
      goto LABEL_29;
    }
    goto LABEL_37;
  }
  if (!*(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_37:

    swift_bridgeObjectRelease();
    os_log_type_t v29 = v56;
    goto LABEL_38;
  }
LABEL_29:
  type metadata accessor for CAFUINotificationListItem();
  swift_allocObject();
  swift_retain();
  id v40 = v35;
  *(void *)((char *)v33 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem) = sub_1000156B0(v40, v57);
  swift_retain_n();
  swift_release();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  id v41 = [self sharedApplication];
  if (v39 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v42 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v42 = *(void *)((v39 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  [v41 setApplicationIconBadgeNumber:v42];

  swift_release();
  os_log_type_t v29 = v56;
LABEL_39:

  if (v23 >= 10000
    && (uint64_t v44 = v33, v45 = CAFUITileViewController.createGeneralListItem()(), v44, v45))
  {
    swift_retain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    os_log_type_t v46 = v55;
    if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    *(void *)((char *)v44 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem) = v45;
  }
  else
  {
    *(void *)((char *)v33 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem) = 0;
    os_log_type_t v46 = v55;
  }
  swift_release();
  if (!v54) {
    goto LABEL_51;
  }
  id v47 = v46;
  unint64_t v48 = v33;
  uint64_t v49 = CAFUITileViewController.createAudioListItem(audioSettings:)();

  if (!v49)
  {

LABEL_51:
    *(void *)((char *)v33 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem) = 0;
    swift_release();
    goto LABEL_52;
  }
  *(void *)((char *)v48 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem) = v49;
  swift_retain_n();
  swift_release();
  specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
  if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  }
  specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
  specialized Array._endMutation()();
  swift_release();

LABEL_52:
  id v50 = *(void (**)(void *))((swift_isaMask & *v33) + 0x148);
  uint64_t v51 = v33;
  v50(_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  return v51;
}

void sub_100014F40(uint64_t a1)
{
  sub_1000076B0(0, &qword_10002CB30);
  sub_10001749C();
  unint64_t v2 = 0;
  v9[1] = (id)Set.init(minimumCapacity:)();
LABEL_12:
  while (1)
  {
    unint64_t v6 = *(void *)(a1 + 16);
    if (v2 == v6) {
      break;
    }
    if (v2 >= v6) {
      goto LABEL_19;
    }
    unint64_t v7 = *(void *)(a1 + 32 + 8 * v2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    unint64_t v8 = v7;
    ++v2;
    if (v7)
    {
      unint64_t v3 = 0;
      if (v7 >> 62) {
        goto LABEL_9;
      }
      while (v3 != *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        while (1)
        {
          if ((v8 & 0xC000000000000001) != 0)
          {
            id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if (v3 >= *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_18:
              __break(1u);
LABEL_19:
              __break(1u);
              return;
            }
            id v4 = *(id *)(v8 + 8 * v3 + 32);
          }
          if (__OFADD__(v3, 1)) {
            goto LABEL_18;
          }
          sub_100015ECC(v9, v4);

          ++v3;
          if (!(v8 >> 62)) {
            break;
          }
LABEL_9:
          swift_bridgeObjectRetain();
          uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (v3 == v5) {
            goto LABEL_12;
          }
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

uint64_t sub_1000150CC()
{
  swift_release();
  swift_release();

  return swift_release();
}

id VSRootViewController.__deallocating_deinit()
{
  id v1 = [self defaultCenter];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 removeObserver:v2];

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for VSRootViewController();
  return [super dealloc];
}

Swift::Void __swiftcall VSRootViewController.viewDidLoad()()
{
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for VSRootViewController();
  [super viewDidLoad];
  id v1 = [*(id *)&v0[OBJC_IVAR____TtC12AutoSettings20VSRootViewController_autoSettings] car];
  if (v1)
  {
    NSString v2 = v1;
    id v3 = [v1 automakerNotificationHistory];

    if (v3)
    {
      id v4 = [v3 historicalNotifications];
      if (!v4)
      {

        return;
      }
      uint64_t v5 = v4;
      sub_1000076B0(0, &qword_10002C150);
      unint64_t v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v6 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
        if (v7) {
          goto LABEL_6;
        }
      }
      else
      {
        uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v7)
        {
LABEL_6:
          if (v7 < 1)
          {
            __break(1u);
            return;
          }
          for (uint64_t i = 0; i != v7; ++i)
          {
            if ((v6 & 0xC000000000000001) != 0) {
              id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v9 = *(id *)(v6 + 8 * i + 32);
            }
            uint64_t v10 = v9;
            [v9 registerObserver:v0];
          }
        }
      }

      swift_bridgeObjectRelease_n();
    }
  }
}

void VSRootViewController.init(carSession:prominentCategories:listItems:settingsSections:settingsCache:assetManager:requestContentManager:preventVolumeNotification:)()
{
}

uint64_t sub_1000156B0(void *a1, uint64_t a2)
{
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  NSString v4 = String._bridgeToObjectiveC()();
  id v5 = [self systemImageNamed:v4];

  id v6 = [self mainBundle];
  v14._object = (void *)0xE000000000000000;
  v7._countAndFlagsBits = 0x4143494649544F4ELL;
  v7._object = (void *)0xED0000534E4F4954;
  v8.value._countAndFlagsBits = 0x747465536F747541;
  v8.value._object = (void *)0xEC00000073676E69;
  v9._countAndFlagsBits = 0;
  v9._object = (void *)0xE000000000000000;
  v14._countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v7, v8, (NSBundle)v6, v9, v14);

  String.init(format:_:)();
  swift_bridgeObjectRelease();
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  *(void *)(v11 + 24) = a2;
  swift_retain();
  uint64_t v12 = CAFUIDataListItem.init(symbol:text:secondaryText:badgeText:showChevron:enabled:settingsCategory:limitedUI:limitedUIImage:selectionAction:)();
  swift_release();

  return v12;
}

void *sub_1000158AC(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  unint64_t result = (void *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    NSString v4 = result;
    id v5 = [result automakerNotificationHistory];

    if (v5)
    {
      sub_1000079CC();
      if (v6 >> 62) {
        uint64_t v7 = _CocoaArrayWrapper.endIndex.getter();
      }
      else {
        uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v7)
      {
        Swift::String_optional v8 = (char *)objc_allocWithZone((Class)type metadata accessor for VSNotificationHistoryViewController());
        uint64_t v9 = OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationsBySeverity;
        *(void *)&v8[v9] = sub_100016E68((uint64_t)_swiftEmptyArrayStorage);
        *(void *)&v8[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_requestContentManager] = a2;
        *(void *)&v8[OBJC_IVAR____TtC12AutoSettings35VSNotificationHistoryViewController_notificationHistory] = v5;
        swift_retain();
        return (void *)CAFUITableViewController.init(style:)();
      }
    }
    return 0;
  }
  return result;
}

BOOL sub_1000159CC()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  BOOL result = 0;
  if (Strong)
  {
    id v1 = Strong;
    id v2 = [Strong automakerNotificationHistory];

    if (v2)
    {
      sub_1000079CC();
      uint64_t v4 = v3 >> 62 ? _CocoaArrayWrapper.endIndex.getter() : *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();

      if (v4) {
        return 1;
      }
    }
  }
  return result;
}

void *sub_100015A6C()
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  id v1 = Strong;
  if (Strong)
  {
    id v2 = [Strong automakerNotificationHistory];

    if (v2)
    {
      sub_1000079CC();
      if (v3 >> 62) {
        uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
      }
      else {
        uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v4)
      {
        sub_1000079CC();
        if (v5 >> 62) {
          _CocoaArrayWrapper.endIndex.getter();
        }
        swift_bridgeObjectRelease();
        id v1 = (void *)dispatch thunk of CustomStringConvertible.description.getter();
      }
      else
      {

        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

void sub_100015B98()
{
}

uint64_t sub_100015BC8()
{
  return swift_unknownObjectWeakDestroy();
}

uint64_t sub_100015BD0()
{
  uint64_t v0 = CAFUIDataListItem.deinit();
  swift_unknownObjectWeakDestroy();

  return _swift_deallocClassInstance(v0, 120, 7);
}

char *sub_100015C18(char *result, int64_t a2, char a3, char *a4)
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
      sub_10000761C(&qword_10002CB18);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[56 * v8 + 32]) {
          memmove(v12, a4 + 32, 56 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100016D70(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100015D40(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  int64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      int64_t v7 = a2;
    }
LABEL_8:
    int64_t v8 = a4[2];
    if (v7 <= v8) {
      int64_t v9 = a4[2];
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_10000761C(&qword_10002CB28);
      uint64_t v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * v11 - 64;
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= (void *)((char *)a4 + v8 + 32)) {
          memmove(v12, a4 + 4, v8);
        }
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100016F6C(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100015E3C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000094E8(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t type metadata accessor for CAFUINotificationListItem()
{
  return self;
}

uint64_t type metadata accessor for VSRootViewController()
{
  uint64_t result = qword_10002C910;
  if (!qword_10002C910) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100015ECC(void *a1, void *a2)
{
  unint64_t v3 = v2;
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

      sub_1000076B0(0, &qword_10002CB30);
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
    Swift::Int v22 = sub_10001616C(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_100016364();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_100016604((uint64_t)v8, v23);
    *unint64_t v3 = (uint64_t)v23;
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
      sub_1000076B0(0, &qword_10002CB30);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = static NSObject.== infix(_:_:)();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        unint64_t v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
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
    *unint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_100016688((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *unint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

Swift::Int sub_10001616C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000761C((uint64_t *)&unk_10002CB40);
    uint64_t v2 = static _SetStorage.convert(_:capacity:)();
    uint64_t v14 = v2;
    __CocoaSet.makeIterator()();
    if (__CocoaSet.Iterator.next()())
    {
      sub_1000076B0(0, &qword_10002CB30);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_100016364();
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

uint64_t sub_100016364()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_10000761C((uint64_t *)&unk_10002CB40);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
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
                id v1 = v28;
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
  *id v1 = v4;
  return result;
}

unint64_t sub_100016604(uint64_t a1, void *a2)
{
  NSObject._rawHashValue(seed:)(a2[5]);
  unint64_t result = _HashTable.nextHole(atOrAfter:)();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_100016688(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100016364();
  }
  else
  {
    if (v7 > v6)
    {
      sub_100016810();
      goto LABEL_14;
    }
    sub_1000169BC();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = NSObject._rawHashValue(seed:)(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_1000076B0(0, &qword_10002CB30);
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

id sub_100016810()
{
  id v1 = v0;
  sub_10000761C((uint64_t *)&unk_10002CB40);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *id v1 = v4;
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

uint64_t sub_1000169BC()
{
  id v1 = v0;
  uint64_t v2 = *v0;
  sub_10000761C((uint64_t *)&unk_10002CB40);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *id v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
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
    id v1 = v28;
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

void (*sub_100016C38(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  uint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100016CE8(v6, a2, a3);
  return sub_100016CA0;
}

void sub_100016CA0(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100016CE8(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_100016D68;
  }
  __break(1u);
  return result;
}

void sub_100016D68(id *a1)
{
}

uint64_t sub_100016D70(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 56 * a1 + 32;
    unint64_t v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_100016E68(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  sub_10000761C(&qword_10002CB20);
  uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
  Swift::UInt8 v4 = *(unsigned char *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  unint64_t result = sub_100013570(v4);
  if (v7)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  unint64_t v8 = (void *)(a1 + 56);
  while (1)
  {
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v3[6] + result) = v4;
    *(void *)(v3[7] + 8 * result) = v5;
    uint64_t v9 = v3[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      break;
    }
    v3[2] = v11;
    if (!--v1) {
      goto LABEL_8;
    }
    int64_t v12 = v8 + 2;
    Swift::UInt8 v4 = *((unsigned char *)v8 - 8);
    uint64_t v13 = *v8;
    swift_bridgeObjectRetain();
    unint64_t result = sub_100013570(v4);
    unint64_t v8 = v12;
    uint64_t v5 = v13;
    if (v14) {
      goto LABEL_7;
    }
  }
  __break(1u);
  return result;
}

char *sub_100016F6C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    unint64_t v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  unint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void _s12AutoSettings20VSRootViewControllerC29historicalNotificationService_15didUpdateHiddenySo013CAFHistoricalG0C_SbtF_0()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem;
  uint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_notificationListItem);
  size_t v4 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_autoSettings);
  id v5 = [v4 car];
  uint64_t v6 = (uint64_t)v5;
  if (v5)
  {
    id v7 = [v5 automakerNotificationHistory];

    if (v7)
    {
      sub_1000079CC();
      unint64_t v9 = v8;

      if (v9 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v6 = *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  id v10 = [self sharedApplication];
  [v10 setApplicationIconBadgeNumber:v6 & ~(v6 >> 63)];

  if ((v3 != 0) != v6 > 0)
  {
    if (v6 >= 1)
    {
      id v11 = [v4 car];
      if (v11)
      {
        int64_t v12 = v11;
        uint64_t v13 = *(void *)(v1 + direct field offset for CAFUITileViewController.requestContentManager);
        if (v13)
        {
          type metadata accessor for CAFUINotificationListItem();
          swift_allocObject();
          swift_retain_n();
          id v14 = v12;
          *(void *)(v1 + v2) = sub_1000156B0(v14, v13);

          swift_release();
          goto LABEL_19;
        }
      }
    }
    *(void *)(v1 + v2) = 0;
LABEL_19:
    swift_release();
    uint64_t v15 = *(void *)(v1 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_audioListItem);
    if (*(void *)(v1 + OBJC_IVAR____TtC12AutoSettings20VSRootViewController_generalListItem))
    {
      swift_retain();
      swift_retain_n();
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      if (!v15) {
        goto LABEL_28;
      }
    }
    else
    {
      swift_retain();
      if (!v15)
      {
LABEL_28:
        swift_release();
        swift_release();
        CAFUITileViewController.setListItems(_:)((Swift::OpaquePointer)_swiftEmptyArrayStorage);
        swift_bridgeObjectRelease();
        return;
      }
    }
    swift_retain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    goto LABEL_28;
  }
  if (v3)
  {
    CAFUITileViewController.reloadListItem(item:)(0);
  }
}

uint64_t sub_1000173BC()
{
  return type metadata accessor for VSRootViewController();
}

uint64_t sub_1000173C4()
{
  return swift_updateClassMetadata2();
}

uint64_t sub_10001741C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100017454()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void *sub_100017494()
{
  return sub_1000158AC(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_10001749C()
{
  unint64_t result = qword_10002CB38;
  if (!qword_10002CB38)
  {
    sub_1000076B0(255, &qword_10002CB30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10002CB38);
  }
  return result;
}

id sub_1000175D8()
{
  return sub_100019EF8(type metadata accessor for VSTableCell);
}

uint64_t type metadata accessor for VSTableCell()
{
  return self;
}

uint64_t sub_100017614()
{
  uint64_t v1 = type metadata accessor for Calendar();
  uint64_t v38 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  unint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v10 = (char *)&v34 - v9;
  uint64_t v11 = sub_10000761C((uint64_t *)&unk_10002BF80);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem);
  if (!v15) {
    return 0;
  }
  uint64_t v35 = v10;
  uint64_t v36 = v5;
  uint64_t v37 = v4;
  id v39 = v15;
  id v16 = [v39 timestamp];
  sub_1000076B0(0, &qword_10002CB10);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

  Measurement.value.getter();
  double v18 = v17;
  Swift::Int v19 = *(void (**)(char *, uint64_t))(v12 + 8);
  v19(v14, v11);
  if (v18 <= 0.0)
  {

    return 0;
  }
  id v20 = [v39 timestamp];
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

  Measurement.value.getter();
  v19(v14, v11);
  uint64_t v21 = v35;
  Date.init(timeIntervalSince1970:)();
  static Calendar.current.getter();
  LOBYTE(v20) = Calendar.isDateInToday(_:)();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v3, v1);
  uint64_t v23 = v36;
  uint64_t v22 = v37;
  if (v20)
  {
    id v24 = [objc_allocWithZone((Class)NSRelativeDateTimeFormatter) init];
    [v24 setUnitsStyle:2];
    [v24 setDateTimeStyle:1];
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    Date.init()();
    Class v26 = Date._bridgeToObjectiveC()().super.isa;
    uint64_t v27 = *(void (**)(char *, uint64_t))(v23 + 8);
    v27(v8, v22);
    id v28 = [v24 localizedStringForDate:isa relativeToDate:v26];

    uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v27(v21, v22);
  }
  else
  {
    id v31 = [objc_allocWithZone((Class)NSDateFormatter) init];
    [v31 setDateStyle:1];
    [v31 setTimeStyle:0];
    Class v32 = Date._bridgeToObjectiveC()().super.isa;
    id v33 = [v31 stringFromDate:v32];

    uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v21, v22);
  }
  return v29;
}

void sub_100017ABC(void *a1)
{
  if (a1) {
    [a1 removeFromSuperview];
  }
  uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView];
  if (v2)
  {
    id v3 = v2;
    [v1 setAccessoryType:0];
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v4 = [v1 contentView];
    [v4 addSubview:v3];

    uint64_t v5 = self;
    sub_10000761C(&qword_10002C148);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_10001C1F0;
    id v7 = [v3 topAnchor];
    id v8 = [v1 contentView];
    id v9 = [v8 topAnchor];

    id v10 = [v7 constraintEqualToAnchor:v9];
    *(void *)(v6 + 32) = v10;
    id v11 = [v3 trailingAnchor];
    id v12 = [v1 contentView];
    id v13 = [v12 trailingAnchor];

    id v14 = [v11 constraintEqualToAnchor:v13 constant:-12.0];
    *(void *)(v6 + 40) = v14;
    id v15 = [v3 bottomAnchor];
    id v16 = [v1 contentView];
    id v17 = [v16 bottomAnchor];

    id v18 = [v15 constraintEqualToAnchor:v17];
    *(void *)(v6 + 48) = v18;
    specialized Array._endMutation()();
    sub_1000076B0(0, (unint64_t *)&qword_10002C4B8);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v5 activateConstraints:isa];
  }
}

uint64_t sub_100017DAC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000761C((uint64_t *)&unk_10002BF80);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UIListContentConfiguration();
  uint64_t result = __chkstk_darwin(v6);
  id v10 = (char *)&v54 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = *(void **)(v1 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem);
  if (v11)
  {
    uint64_t v57 = v3;
    uint64_t v58 = v2;
    uint64_t v59 = v8;
    uint64_t v60 = result;
    id v12 = v11;
    static UIListContentConfiguration.subtitleCell()();
    uint64_t v13 = sub_1000076B0(0, &qword_10002CC30);
    static UIFont.cafui_titleFont.getter();
    id v14 = (void (*)(uint64_t *, void))UIListContentConfiguration.textProperties.modify();
    UIListContentConfiguration.TextProperties.font.setter();
    v14(v61, 0);
    id v15 = [v12 userVisibleLabel];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    UIListContentConfiguration.text.setter();
    uint64_t v56 = v13;
    static UIFont.cafui_subtitleFont.getter();
    id v16 = (void (*)(uint64_t *, void))UIListContentConfiguration.secondaryTextProperties.modify();
    UIListContentConfiguration.TextProperties.font.setter();
    v16(v61, 0);
    id v17 = self;
    id v18 = [v17 secondaryLabelColor];
    Swift::Int v19 = (void (*)(uint64_t *, void))UIListContentConfiguration.secondaryTextProperties.modify();
    UIListContentConfiguration.TextProperties.color.setter();
    v19(v61, 0);
    id v20 = [v12 userVisibleDescription];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    UIListContentConfiguration.secondaryText.setter();
    uint64_t v21 = (void (*)(uint64_t *, void))UIListContentConfiguration.imageProperties.modify();
    UIListContentConfiguration.ImageProperties.reservedLayoutSize.setter();
    v21(v61, 0);
    id v22 = [self configurationWithWeight:6];
    uint64_t v23 = (void (*)(uint64_t *, void))UIListContentConfiguration.imageProperties.modify();
    UIListContentConfiguration.ImageProperties.preferredSymbolConfiguration.setter();
    v23(v61, 0);
    id v24 = [v12 symbolName];
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v27 = v26;

    swift_bridgeObjectRelease();
    uint64_t v28 = HIBYTE(v27) & 0xF;
    if ((v27 & 0x2000000000000000) == 0) {
      uint64_t v28 = v25 & 0xFFFFFFFFFFFFLL;
    }
    if (v28)
    {
      id v29 = [v12 symbolName];
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    unsigned int v30 = [v12 notificationSeverity];
    id v55 = v17;
    if (v30 <= 2) {
      id v31 = [v17 *(&off_100025038)[(char)v30]];
    }
    Class v32 = (void (*)(uint64_t *, void))UIListContentConfiguration.imageProperties.modify();
    UIListContentConfiguration.ImageProperties.tintColor.setter();
    v32(v61, 0);
    NSString v33 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v34 = (id)CAFUIImageForSymbolName();

    UIListContentConfiguration.image.setter();
    uint64_t v35 = v60;
    v61[3] = v60;
    v61[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
    uint64_t v36 = sub_100019F64(v61);
    uint64_t v37 = v59;
    (*(void (**)(uint64_t *, char *, uint64_t))(v59 + 16))(v36, v10, v35);
    UITableViewCell.contentConfiguration.setter();
    id v38 = [v12 timestamp];
    sub_1000076B0(0, &qword_10002CB10);
    static Measurement._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v39 = v58;
    Measurement.value.getter();
    double v41 = v40;
    (*(void (**)(char *, uint64_t))(v57 + 8))(v5, v39);
    if (v41 <= 0.0)
    {
      id v53 = *(void **)(v1 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView);
      *(void *)(v1 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView) = 0;
      sub_100017ABC(v53);
    }
    else
    {
      v61[0] = (uint64_t)_swiftEmptyArrayStorage;
      id v42 = [objc_allocWithZone((Class)UILabel) init];
      sub_100017614();
      NSString v43 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v42 setText:v43];

      id v44 = [v55 secondaryLabelColor];
      [v42 setTextColor:v44];

      uint64_t v45 = (void *)static UIFont.cafui_subtitleFont.getter();
      [v42 setFont:v45];

      [v42 sizeToFit];
      id v46 = v42;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v61[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v61[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
      uint64_t v47 = *((void *)sub_100004B4C() + 2);
      swift_bridgeObjectRelease();
      if (v47 || [v12 hasUserVisibleFullDescription])
      {
        id v48 = sub_1000185CC();
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)((v61[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v61[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      id v49 = objc_allocWithZone((Class)type metadata accessor for CAFUIStackView());
      id v50 = (void *)CAFUIStackView.init(views:axis:minWidth:)();
      uint64_t v51 = *(void **)(v1 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView);
      *(void *)(v1 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView) = v50;
      id v52 = v50;
      sub_100017ABC(v51);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v10, v35);
  }
  return result;
}

id sub_10001853C()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem);
  if (!v1
    || (unsigned int v2 = [v1 notificationSeverity], v2 > 2)
    || (id result = objc_msgSend(self, *(&off_100025038)[(char)v2])) == 0)
  {
    sub_1000076B0(0, &qword_10002C308);
    return (id)static UIColor.cafui_carSystemFocus.getter();
  }
  return result;
}

id sub_1000185CC()
{
  uint64_t v1 = OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView;
  unsigned int v2 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView);
  }
  else
  {
    id v4 = sub_10001862C();
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    unsigned int v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_10001862C()
{
  id v0 = [self boldSystemFontOfSize:13.0];
  id v1 = [self configurationWithFont:v0 scale:-1];
  NSString v2 = String._bridgeToObjectiveC()();
  id v3 = [self systemImageNamed:v2 withConfiguration:v1];

  if (v3)
  {
    id v4 = [v3 imageWithRenderingMode:2];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = [objc_allocWithZone((Class)UIImageView) initWithImage:v4];
  id v6 = objc_allocWithZone((Class)UIColor);
  v10[4] = sub_100018828;
  v10[5] = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100019FC8;
  v10[3] = &unk_100025010;
  id v7 = _Block_copy(v10);
  id v8 = [v6 initWithDynamicProvider:v7];
  _Block_release(v7);
  swift_release();
  [v5 setTintColor:v8];

  return v5;
}

id sub_100018828(void *a1)
{
  id v1 = [a1 userInterfaceStyle];
  NSString v2 = self;
  id v3 = &selRef_systemDarkGrayColor;
  if (v1 != (id)1) {
    id v3 = &selRef_secondaryLabelColor;
  }
  id v4 = [v2 *v3];

  return v4;
}

uint64_t sub_100018894(char a1, char a2)
{
  id v3 = v2;
  uint64_t v6 = sub_10000761C(&qword_10002CC18);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v24[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UIListContentConfiguration();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v24[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (objc_class *)type metadata accessor for VSNotificationTableCell();
  v27.receiver = v3;
  v27.super_class = v13;
  [super setHighlighted:a1 & 1 animated:a2 & 1];
  UITableViewCell.contentConfiguration.getter();
  if (!v25)
  {
    sub_10000E0F8((uint64_t)v24, &qword_10002CC20);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    return sub_10000E0F8((uint64_t)v8, &qword_10002CC18);
  }
  sub_10000761C(&qword_10002CC28);
  int v14 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, v14 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_10000E0F8((uint64_t)v8, &qword_10002CC18);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  if (a1)
  {
    sub_1000076B0(0, &qword_10002C308);
    static UIColor.cafui_carSystemFocusLabel.getter();
    id v15 = (void (*)(uint64_t *, void))UIListContentConfiguration.textProperties.modify();
    UIListContentConfiguration.TextProperties.color.setter();
    v15(v24, 0);
    static UIColor.cafui_carSystemFocusSecondary.getter();
  }
  else
  {
    id v17 = self;
    id v18 = [v17 labelColor];
    Swift::Int v19 = (void (*)(uint64_t *, void))UIListContentConfiguration.textProperties.modify();
    UIListContentConfiguration.TextProperties.color.setter();
    v19(v24, 0);
    id v20 = [v17 secondaryLabelColor];
  }
  uint64_t v21 = (void (*)(uint64_t *, void))UIListContentConfiguration.secondaryTextProperties.modify();
  UIListContentConfiguration.TextProperties.color.setter();
  v21(v24, 0);
  uint64_t v25 = v9;
  unint64_t v26 = &protocol witness table for UIListContentConfiguration;
  id v22 = sub_100019F64(v24);
  (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 16))(v22, v12, v9);
  UITableViewCell.contentConfiguration.setter();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

id sub_100018C70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&v3[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem] = 0;
  *(void *)&v3[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView] = 0;
  if (a3)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for VSNotificationTableCell();
  [super initWithStyle:a1 reuseIdentifier:v5];

  return v6;
}

uint64_t sub_100018D64()
{
  id v1 = (char *)objc_allocWithZone(v0);
  *(void *)&v1[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_stackView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell_notificationItem] = 0;
  *(void *)&v1[OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView] = 0;
  return CAFUITableCell.init(reuseIdentifier:)();
}

void sub_100018DCC()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings23VSNotificationTableCell____lazy_storage___chevronImageView);
}

id sub_100018E1C()
{
  return sub_100019EF8(type metadata accessor for VSNotificationTableCell);
}

uint64_t type metadata accessor for VSNotificationTableCell()
{
  return self;
}

uint64_t sub_100018EB4()
{
  uint64_t v1 = type metadata accessor for UIListContentConfiguration();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t result = __chkstk_darwin();
  NSString v5 = (char *)v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = &v0[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction];
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 8];
  if (v7)
  {
    id v27 = v0;
    uint64_t v8 = *((void *)v6 + 2);
    unint64_t v9 = *((void *)v6 + 3);
    uint64_t v29 = *(void *)v6;
    uint64_t v30 = v8;
    uint64_t v10 = *((void *)v6 + 5);
    v26[1] = *((void *)v6 + 4);
    int v11 = v6[48];
    swift_bridgeObjectRetain();
    v26[2] = v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    static UIListContentConfiguration.cell()();
    id v12 = [self systemFontOfSize:16.0 weight:UIFontWeightMedium];
    uint64_t v13 = (void (*)(uint64_t *, void))UIListContentConfiguration.textProperties.modify();
    UIListContentConfiguration.TextProperties.font.setter();
    v13(v31, 0);
    int v28 = v11;
    if (v11)
    {
      id v14 = [self systemRedColor];
    }
    else
    {
      sub_1000076B0(0, &qword_10002C308);
      static UIColor.cafui_carSystemFocus.getter();
    }
    id v15 = (void (*)(uint64_t *, void))UIListContentConfiguration.textProperties.modify();
    UIListContentConfiguration.TextProperties.color.setter();
    v15(v31, 0);
    swift_bridgeObjectRetain();
    uint64_t v16 = v29;
    UIListContentConfiguration.text.setter();
    if (!v9) {
      goto LABEL_11;
    }
    uint64_t v17 = HIBYTE(v9) & 0xF;
    if ((v9 & 0x2000000000000000) == 0) {
      uint64_t v17 = v30 & 0xFFFFFFFFFFFFLL;
    }
    if (v17)
    {
      swift_bridgeObjectRetain();
      NSString v18 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v19 = (id)CAFUIImageForSymbolName();

      id v20 = [objc_allocWithZone((Class)UIImageView) initWithImage:v19];
      uint64_t v21 = v7;
      char v22 = v28;
      sub_100007660(v16, v21);
      if (v22) {
        id v23 = [self systemRedColor];
      }
      else {
        id v23 = 0;
      }
      id v24 = v27;
      [v20 setTintColor:v23];

      [v24 setAccessoryView:v20];
    }
    else
    {
LABEL_11:
      sub_100007660(v16, v7);
      [v27 setAccessoryView:0];
    }
    v31[3] = v1;
    v31[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
    uint64_t v25 = sub_100019F64(v31);
    (*(void (**)(uint64_t *, char *, uint64_t))(v2 + 16))(v25, v5, v1);
    UITableViewCell.contentConfiguration.setter();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  return result;
}

uint64_t sub_100019250(char a1, char a2)
{
  id v3 = v2;
  uint64_t v6 = sub_10000761C(&qword_10002CC18);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v34[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UIListContentConfiguration();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  id v12 = (char *)&v34[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = (objc_class *)type metadata accessor for VSNotificationActionTableCell();
  v37.receiver = v3;
  v37.super_class = v13;
  [super setHighlighted:a1 & 1 animated:a2 & 1];
  UITableViewCell.contentConfiguration.getter();
  if (!v35)
  {
    sub_10000E0F8((uint64_t)v34, &qword_10002CC20);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
    return sub_10000E0F8((uint64_t)v8, &qword_10002CC18);
  }
  sub_10000761C(&qword_10002CC28);
  int v14 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, v14 ^ 1u, 1, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_10000E0F8((uint64_t)v8, &qword_10002CC18);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  if ((a1 & 1) == 0)
  {
    char v22 = &v3[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction];
    uint64_t v23 = *(void *)&v3[OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 8];
    if (v23
      && (uint64_t v33 = *((void *)v22 + 4),
          uint64_t v24 = *(void *)v22,
          char v25 = v22[48],
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRetain(),
          swift_bridgeObjectRetain(),
          sub_100007660(v24, v23),
          (v25 & 1) != 0))
    {
      id v27 = [self systemRedColor];
      int v26 = 1;
    }
    else
    {
      sub_1000076B0(0, &qword_10002C308);
      static UIColor.cafui_carSystemFocus.getter();
      int v26 = 0;
    }
    int v28 = (void (*)(uint64_t *, void))UIListContentConfiguration.textProperties.modify();
    UIListContentConfiguration.TextProperties.color.setter();
    v28(v34, 0);
    id v29 = [v3 accessoryView];
    if (!v29) {
      goto LABEL_21;
    }
    uint64_t v17 = v29;
    self;
    uint64_t v30 = swift_dynamicCastObjCClass();
    if (!v30) {
      goto LABEL_20;
    }
    id v31 = (void *)v30;
    if (v26) {
      id v20 = [self systemRedColor];
    }
    else {
      id v20 = 0;
    }
    [v31 setTintColor:v20];
    goto LABEL_19;
  }
  sub_1000076B0(0, &qword_10002C308);
  static UIColor.cafui_carSystemFocusLabel.getter();
  id v15 = (void (*)(uint64_t *, void))UIListContentConfiguration.textProperties.modify();
  UIListContentConfiguration.TextProperties.color.setter();
  v15(v34, 0);
  id v16 = [v3 accessoryView];
  if (v16)
  {
    uint64_t v17 = v16;
    self;
    uint64_t v18 = swift_dynamicCastObjCClass();
    if (!v18)
    {
LABEL_20:

      goto LABEL_21;
    }
    id v19 = (void *)v18;
    id v20 = (id)static UIColor.cafui_carSystemFocusLabel.getter();
    [v19 setTintColor:v20];
LABEL_19:

    uint64_t v17 = v20;
    goto LABEL_20;
  }
LABEL_21:
  uint64_t v35 = v9;
  uint64_t v36 = &protocol witness table for UIListContentConfiguration;
  Class v32 = sub_100019F64(v34);
  (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 16))(v32, v12, v9);
  UITableViewCell.contentConfiguration.setter();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_10001987C()
{
  return sub_100007660(*(void *)(v0 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction), *(void *)(v0 + OBJC_IVAR____TtC12AutoSettings29VSNotificationActionTableCell_notificationAction + 8));
}

id sub_10001989C()
{
  return sub_100019EF8(type metadata accessor for VSNotificationActionTableCell);
}

uint64_t type metadata accessor for VSNotificationActionTableCell()
{
  return self;
}

uint64_t sub_1000198F8()
{
  uint64_t v1 = type metadata accessor for UIListContentConfiguration();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t result = __chkstk_darwin();
  NSString v5 = (char *)&v34[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(v0 + OBJC_IVAR____TtC12AutoSettings24VSNotificationHeaderView_notificationItem);
  if (v6)
  {
    id v7 = v6;
    static UIListContentConfiguration.subtitleCell()();
    sub_1000076B0(0, &qword_10002CC30);
    uint64_t v8 = (void *)static UIFont.cafui_titleFont.getter();
    id v9 = [v8 fontDescriptor];
    id v10 = [v9 fontDescriptorWithSymbolicTraits:2];

    if (v10)
    {
      [self fontWithDescriptor:v10 size:0.0];
    }
    uint64_t v11 = (void (*)(uint64_t *, void))UIListContentConfiguration.textProperties.modify();
    UIListContentConfiguration.TextProperties.font.setter();
    v11(v34, 0);
    id v12 = [v7 userVisibleLabel];
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    UIListContentConfiguration.text.setter();
    static UIFont.cafui_subtitleFont.getter();
    uint64_t v13 = (void (*)(uint64_t *, void))UIListContentConfiguration.secondaryTextProperties.modify();
    UIListContentConfiguration.TextProperties.font.setter();
    v13(v34, 0);
    int v14 = self;
    id v15 = [v14 secondaryLabelColor];
    id v16 = (void (*)(uint64_t *, void))UIListContentConfiguration.secondaryTextProperties.modify();
    UIListContentConfiguration.TextProperties.color.setter();
    v16(v34, 0);
    id v17 = [v7 userVisibleFullDescription];
    if (v17)
    {
      uint64_t v18 = v17;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    UIListContentConfiguration.secondaryText.setter();
    id v19 = [v7 symbolName];
    uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v22 = v21;

    swift_bridgeObjectRelease();
    uint64_t v23 = HIBYTE(v22) & 0xF;
    if ((v22 & 0x2000000000000000) == 0) {
      uint64_t v23 = v20 & 0xFFFFFFFFFFFFLL;
    }
    if (v23)
    {
      unsigned int v24 = [v7 notificationSeverity];
      if (v24 <= 2) {
        id v25 = [v14 *(&off_100025038)[(char)v24]];
      }
      int v26 = (void (*)(uint64_t *, void))UIListContentConfiguration.imageProperties.modify();
      UIListContentConfiguration.ImageProperties.tintColor.setter();
      v26(v34, 0);
      id v27 = (void (*)(uint64_t *, void))UIListContentConfiguration.imageProperties.modify();
      UIListContentConfiguration.ImageProperties.reservedLayoutSize.setter();
      v27(v34, 0);
      id v28 = [self configurationWithTextStyle:UIFontTextStyleTitle3 scale:3];
      id v29 = (void (*)(uint64_t *, void))UIListContentConfiguration.imageProperties.modify();
      UIListContentConfiguration.ImageProperties.preferredSymbolConfiguration.setter();
      v29(v34, 0);
      NSString v30 = [v7 symbolName];
      if (!v30)
      {
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        NSString v30 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
      }
      id v31 = (id)CAFUIImageForSymbolName();
    }
    UIListContentConfiguration.image.setter();
    uint64_t v34[3] = v1;
    v34[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
    Class v32 = sub_100019F64(v34);
    (*(void (**)(uint64_t *, char *, uint64_t))(v2 + 16))(v32, v5, v1);
    UITableViewHeaderFooterView.contentConfiguration.setter();

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  return result;
}

void sub_100019ED0()
{
}

id sub_100019EE0()
{
  return sub_100019EF8(type metadata accessor for VSNotificationHeaderView);
}

id sub_100019EF8(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for VSNotificationHeaderView()
{
  return self;
}

uint64_t *sub_100019F64(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

id sub_100019FC8(uint64_t a1, void *a2)
{
  objc_super v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  NSString v5 = (void *)v3();
  swift_release();

  return v5;
}

uint64_t sub_10001A030(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001A040()
{
  return swift_release();
}

void sub_10001A048()
{
  v20.receiver = v0;
  v20.super_class = (Class)type metadata accessor for VSClusterViewController();
  [super viewDidLoad];
  id v1 = [objc_allocWithZone((Class)UILabel) init];
  NSString v2 = String._bridgeToObjectiveC()();
  [v1 setText:v2];

  id v3 = [self labelColor];
  [v1 setTextColor:v3];

  [v1 setTextAlignment:1];
  [v1 setNumberOfLines:2];
  id v4 = [self systemFontOfSize:24.0];
  [v1 setFont:v4];

  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [v0 view];
  if (!v5)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v6 = v5;
  [v5 addSubview:v1];

  sub_10000761C(&qword_10002C148);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_10001C050;
  id v8 = [v1 centerXAnchor];
  id v9 = [v0 view];
  if (!v9)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  id v10 = v9;
  id v11 = [v9 centerXAnchor];

  id v12 = [v8 constraintEqualToAnchor:v11];
  *(void *)(v7 + 32) = v12;
  id v13 = [v1 centerYAnchor];
  id v14 = [v0 view];
  if (v14)
  {
    id v15 = v14;
    id v16 = self;
    id v17 = [v15 centerYAnchor];

    id v18 = [v13 constraintEqualToAnchor:v17];
    *(void *)(v7 + 40) = v18;
    specialized Array._endMutation()();
    sub_10001A4EC();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v16 activateConstraints:isa];

    return;
  }
LABEL_7:
  __break(1u);
}

id sub_10001A494()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VSClusterViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for VSClusterViewController()
{
  return self;
}

unint64_t sub_10001A4EC()
{
  unint64_t result = qword_10002C4B8;
  if (!qword_10002C4B8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10002C4B8);
  }
  return result;
}

uint64_t sub_10001A52C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static Measurement._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Measurement.value.getter()
{
  return Measurement.value.getter();
}

uint64_t URLQueryItem.name.getter()
{
  return URLQueryItem.name.getter();
}

uint64_t URLQueryItem.value.getter()
{
  return URLQueryItem.value.getter();
}

uint64_t type metadata accessor for URLQueryItem()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t URLComponents.queryItems.getter()
{
  return URLComponents.queryItems.getter();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t Date.init(timeIntervalSince1970:)()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t Calendar.isDateInToday(_:)()
{
  return Calendar.isDateInToday(_:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

NSIndexPath __swiftcall IndexPath._bridgeToObjectiveC()()
{
  return (NSIndexPath)IndexPath._bridgeToObjectiveC()();
}

uint64_t static IndexPath._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t IndexPath.row.getter()
{
  return IndexPath.row.getter();
}

uint64_t IndexPath.section.getter()
{
  return IndexPath.section.getter();
}

uint64_t type metadata accessor for IndexPath()
{
  return type metadata accessor for IndexPath();
}

uint64_t CAUAssetLibraryManager.init()()
{
  return CAUAssetLibraryManager.init()();
}

uint64_t type metadata accessor for CAUAssetLibraryManager()
{
  return type metadata accessor for CAUAssetLibraryManager();
}

uint64_t CAFUIStackView.init(views:axis:minWidth:)()
{
  return CAFUIStackView.init(views:axis:minWidth:)();
}

uint64_t type metadata accessor for CAFUIStackView()
{
  return type metadata accessor for CAFUIStackView();
}

uint64_t CAFUITableCell.init(reuseIdentifier:)()
{
  return CAFUITableCell.init(reuseIdentifier:)();
}

uint64_t static CAFUICellProtocol.reuseIdentifier.getter()
{
  return static CAFUICellProtocol.reuseIdentifier.getter();
}

uint64_t CAFUIDataListItem.init(symbol:text:secondaryText:badgeText:showChevron:enabled:settingsCategory:limitedUI:limitedUIImage:selectionAction:)()
{
  return CAFUIDataListItem.init(symbol:text:secondaryText:badgeText:showChevron:enabled:settingsCategory:limitedUI:limitedUIImage:selectionAction:)();
}

uint64_t CAFUIDataListItem.deinit()
{
  return CAFUIDataListItem.deinit();
}

uint64_t CAFUISettingsCache.visibleChildren(of:)()
{
  return CAFUISettingsCache.visibleChildren(of:)();
}

uint64_t CAFUISettingsCache.categorySettings(for:)()
{
  return CAFUISettingsCache.categorySettings(for:)();
}

uint64_t CAFUISettingsCache.sections(for:)()
{
  return CAFUISettingsCache.sections(for:)();
}

uint64_t CAFUISettingsCache.init(settings:sections:)()
{
  return CAFUISettingsCache.init(settings:sections:)();
}

UIButton_optional __swiftcall CAFUIPunchthroughState.buttonForCurrentState(title:)(Swift::String_optional title)
{
  id v1 = (objc_class *)CAFUIPunchthroughState.buttonForCurrentState(title:)(title.value._countAndFlagsBits, title.value._object);
  result.value.super.super.super.super.Class isa = v1;
  result.is_nil = v2;
  return result;
}

uint64_t CAFUITileViewController.init(carSession:prominentCategories:listItems:settingsSections:settingsCache:assetManager:requestContentManager:preventVolumeNotification:)()
{
  return CAFUITileViewController.init(carSession:prominentCategories:listItems:settingsSections:settingsCache:assetManager:requestContentManager:preventVolumeNotification:)();
}

Swift::Void __swiftcall CAFUITileViewController.setListItems(_:)(Swift::OpaquePointer a1)
{
}

Swift::Void __swiftcall CAFUITileViewController.reloadListItem(item:)(Swift::Int item)
{
}

uint64_t CAFUITileViewController.createAudioListItem(audioSettings:)()
{
  return CAFUITileViewController.createAudioListItem(audioSettings:)();
}

uint64_t CAFUITileViewController.createGeneralListItem()()
{
  return CAFUITileViewController.createGeneralListItem()();
}

uint64_t type metadata accessor for CAFUITileViewController()
{
  return type metadata accessor for CAFUITileViewController();
}

uint64_t CAFUITableViewController.init(style:)()
{
  return CAFUITableViewController.init(style:)();
}

uint64_t type metadata accessor for CAFUILoadingViewController()
{
  return type metadata accessor for CAFUILoadingViewController();
}

uint64_t static CAFUIRequestContentManager.inputStreamIdentifier(from:)()
{
  return static CAFUIRequestContentManager.inputStreamIdentifier(from:)();
}

uint64_t CAFUIRequestContentManager.init(session:)()
{
  return CAFUIRequestContentManager.init(session:)();
}

uint64_t type metadata accessor for CAFUIRequestContentManager()
{
  return type metadata accessor for CAFUIRequestContentManager();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t static UIListContentConfiguration.subtitleCell()()
{
  return static UIListContentConfiguration.subtitleCell()();
}

uint64_t UIListContentConfiguration.secondaryText.setter()
{
  return UIListContentConfiguration.secondaryText.setter();
}

uint64_t UIListContentConfiguration.TextProperties.font.setter()
{
  return UIListContentConfiguration.TextProperties.font.setter();
}

uint64_t UIListContentConfiguration.TextProperties.color.setter()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t UIListContentConfiguration.textProperties.modify()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t UIListContentConfiguration.ImageProperties.preferredSymbolConfiguration.setter()
{
  return UIListContentConfiguration.ImageProperties.preferredSymbolConfiguration.setter();
}

uint64_t UIListContentConfiguration.ImageProperties.reservedLayoutSize.setter()
{
  return UIListContentConfiguration.ImageProperties.reservedLayoutSize.setter();
}

uint64_t UIListContentConfiguration.ImageProperties.tintColor.setter()
{
  return UIListContentConfiguration.ImageProperties.tintColor.setter();
}

uint64_t UIListContentConfiguration.imageProperties.modify()
{
  return UIListContentConfiguration.imageProperties.modify();
}

uint64_t UIListContentConfiguration.secondaryTextProperties.modify()
{
  return UIListContentConfiguration.secondaryTextProperties.modify();
}

uint64_t static UIListContentConfiguration.cell()()
{
  return static UIListContentConfiguration.cell()();
}

uint64_t UIListContentConfiguration.text.setter()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t UIListContentConfiguration.image.setter()
{
  return UIListContentConfiguration.image.setter();
}

uint64_t type metadata accessor for UIListContentConfiguration()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
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

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Comparable.< infix(_:_:)()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
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

uint64_t String.init(format:_:)()
{
  return String.init(format:_:)();
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

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t UITableViewHeaderFooterView.contentConfiguration.setter()
{
  return UITableViewHeaderFooterView.contentConfiguration.setter();
}

uint64_t UIStackView.init(axis:spacing:arrangedSubviews:)()
{
  return UIStackView.init(axis:spacing:arrangedSubviews:)();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t UITableViewCell.contentConfiguration.getter()
{
  return UITableViewCell.contentConfiguration.getter();
}

uint64_t UITableViewCell.contentConfiguration.setter()
{
  return UITableViewCell.contentConfiguration.setter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t CAFAutomakerSettings.allSettings.getter()
{
  return CAFAutomakerSettings.allSettings.getter();
}

uint64_t static UIFont.cafui_titleFont.getter()
{
  return static UIFont.cafui_titleFont.getter();
}

uint64_t static UIFont.cafui_subtitleFont.getter()
{
  return static UIFont.cafui_subtitleFont.getter();
}

uint64_t static UIColor.cafui_carSystemFocus.getter()
{
  return static UIColor.cafui_carSystemFocus.getter();
}

uint64_t static UIColor.cafui_tableBackground.getter()
{
  return static UIColor.cafui_tableBackground.getter();
}

uint64_t static UIColor.cafui_carSystemFocusLabel.getter()
{
  return static UIColor.cafui_carSystemFocusLabel.getter();
}

uint64_t static UIColor.cafui_carSystemFocusSecondary.getter()
{
  return static UIColor.cafui_carSystemFocusSecondary.getter();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

UIButton __swiftcall UIButton.init(alertButtonTitle:)(Swift::String alertButtonTitle)
{
  return (UIButton)UIButton.init(alertButtonTitle:)(alertButtonTitle._countAndFlagsBits, alertButtonTitle._object);
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.range<A>(of:options:range:locale:)()
{
  return StringProtocol.range<A>(of:options:range:locale:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.nextHole(atOrAfter:)()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
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

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.member(for:)()
{
  return __CocoaSet.member(for:)();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
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

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
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

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt8 a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t CAFSignpostEmit_Finalized()
{
  return _CAFSignpostEmit_Finalized();
}

uint64_t CAFSignpostEmit_Launched()
{
  return _CAFSignpostEmit_Launched();
}

uint64_t CAFSignpostEmit_Rendered()
{
  return _CAFSignpostEmit_Rendered();
}

uint64_t CAFSignpostEmit_Scene()
{
  return _CAFSignpostEmit_Scene();
}

uint64_t CAFUIFrameworkBundle()
{
  return _CAFUIFrameworkBundle();
}

uint64_t CAFUIImageForSymbolName()
{
  return _CAFUIImageForSymbolName();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
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

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
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

uint64_t swift_conformsToProtocol2()
{
  return _swift_conformsToProtocol2();
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}