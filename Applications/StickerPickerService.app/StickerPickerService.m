id sub_100005708()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerPickerServiceViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for StickerPickerServiceViewController()
{
  return self;
}

BOOL sub_100005760(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_100005774(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005780()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000788C(v0, qword_1000157A0);
  sub_1000070A4(v0, (uint64_t)qword_1000157A0);
  return Logger.init(subsystem:category:)();
}

id sub_10000598C()
{
  return sub_100007038(0, type metadata accessor for SecureWindow);
}

uint64_t type metadata accessor for SecureWindow()
{
  return self;
}

void sub_100005AB4(void *a1, int a2)
{
  uint64_t v3 = v2;
  sub_100007848(&qword_1000158D8);
  __chkstk_darwin();
  v7 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  UIScene.hostStorage.getter();
  uint64_t v8 = sub_100007848(&qword_1000158E0);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1000078F0((uint64_t)v7);
    return;
  }
  type metadata accessor for ActivitityTypeConfiguration.ConfigurationSetting();
  swift_getOpaqueTypeConformance2();
  sub_100007950();
  v10 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
  SecTaskRef v11 = (SecTaskRef)ActivitityTypeConfiguration.activityType.getter();
  unint64_t v13 = v12;

  v14 = *(void **)(v3 + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window);
  if (!v14)
  {
    swift_bridgeObjectRelease();
    return;
  }
  LODWORD(v88) = a2;
  v15 = v14;
  objc_msgSend(objc_msgSend(a1, "coordinateSpace"), "bounds");
  double v17 = v16;
  double v19 = v18;
  swift_unknownObjectRelease();
  id v20 = [a1 _FBSScene];
  id v21 = [v20 hostHandle];

  if (!v21)
  {
    __break(1u);
    return;
  }
  id v22 = [v21 auditToken];

  [v22 realToken];
  SecTaskRef v90 = sub_1000079A8((uint64_t)v93, v94, v95, v96);
  uint64_t v24 = v23;
  if (qword_100015750 != -1) {
    swift_once();
  }
  uint64_t v25 = type metadata accessor for Logger();
  uint64_t v26 = sub_1000070A4(v25, (uint64_t)qword_1000157A0);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.debug.getter();
  BOOL v29 = os_log_type_enabled(v27, v28);
  id v91 = v22;
  if (!v29)
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    if (v19 == 0.0) {
      goto LABEL_18;
    }
    goto LABEL_12;
  }
  uint64_t v30 = swift_slowAlloc();
  uint64_t v86 = swift_slowAlloc();
  uint64_t v92 = v86;
  *(_DWORD *)uint64_t v30 = 136315650;
  uint64_t v87 = v26;
  uint64_t v31 = String.debugDescription.getter();
  os_log_t v89 = v15;
  os_log_t v93 = (os_log_t)sub_100007128(v31, v32, &v92);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v30 + 12) = 2080;
  uint64_t v33 = CGSize.debugDescription.getter();
  os_log_t v93 = (os_log_t)sub_100007128(v33, v34, &v92);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  *(_WORD *)(v30 + 22) = 2080;
  os_log_t v93 = (os_log_t)v90;
  uint64_t v94 = v24;
  swift_bridgeObjectRetain();
  sub_100007848(&qword_1000158F0);
  uint64_t v35 = String.init<A>(describing:)();
  os_log_t v93 = (os_log_t)sub_100007128(v35, v36, &v92);
  v15 = v89;
  id v22 = v91;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  uint64_t v26 = v87;
  swift_bridgeObjectRelease();
  _os_log_impl((void *)&_mh_execute_header, v27, v28, "activityType: %s window size: %s host app: %s", (uint8_t *)v30, 0x20u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  if (v19 != 0.0)
  {
LABEL_12:
    if (v17 == 0.0) {
      goto LABEL_18;
    }
    id v37 = [v15 rootViewController];

    if (!v37) {
      goto LABEL_22;
    }
    if (v88)
    {
      if (v11 == (SecTaskRef)static String._unconditionallyBridgeFromObjectiveC(_:)() && v13 == v38)
      {
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      char v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v46)
      {
LABEL_22:
        id v47 = v22;
        swift_bridgeObjectRetain_n();
        id v48 = a1;
        v49 = Logger.logObject.getter();
        os_log_type_t v50 = static os_log_type_t.default.getter();
        int v51 = v50;
        BOOL v52 = os_log_type_enabled(v49, v50);
        uint64_t v87 = v26;
        if (v52)
        {
          uint64_t v53 = swift_slowAlloc();
          os_log_t v88 = v49;
          uint64_t v54 = v53;
          v85 = (void *)swift_slowAlloc();
          os_log_t v89 = (os_log_t)swift_slowAlloc();
          uint64_t v92 = (uint64_t)v48;
          os_log_t v93 = v89;
          *(_DWORD *)uint64_t v54 = 138412546;
          LODWORD(v86) = v51;
          id v55 = v48;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          void *v85 = v48;

          *(_WORD *)(v54 + 12) = 2080;
          swift_bridgeObjectRetain();
          uint64_t v92 = sub_100007128((uint64_t)v11, v13, (uint64_t *)&v93);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          os_log_t v56 = v88;
          _os_log_impl((void *)&_mh_execute_header, v88, (os_log_type_t)v86, "configure %@ with %s", (uint8_t *)v54, 0x16u);
          sub_100007848(&qword_1000158D0);
          swift_arrayDestroy();
          id v22 = v91;
          swift_slowDealloc();
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {

          swift_bridgeObjectRelease_n();
          id v22 = v47;
        }
        if ((SecTaskRef)static String._unconditionallyBridgeFromObjectiveC(_:)() == v11 && v60 == v13)
        {
          swift_bridgeObjectRelease();
LABEL_32:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          type metadata accessor for LocalEmojiAndStickerCollectionViewController();
LABEL_33:
          v62 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
          [v15 setRootViewController:v62];
LABEL_34:

LABEL_35:
          [v15 makeKeyAndVisible];
LABEL_36:

          return;
        }
        char v61 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v61) {
          goto LABEL_32;
        }
        if ((SecTaskRef)static String._unconditionallyBridgeFromObjectiveC(_:)() == v11 && v63 == v13)
        {
          swift_bridgeObjectRelease();
LABEL_41:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          type metadata accessor for LocalCategoryViewController();
          goto LABEL_33;
        }
        char v64 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v64) {
          goto LABEL_41;
        }
        if ((SecTaskRef)static String._unconditionallyBridgeFromObjectiveC(_:)() == v11 && v65 == v13)
        {
          swift_bridgeObjectRelease();
LABEL_46:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          type metadata accessor for StickerPickerInProcessViewController();
          goto LABEL_33;
        }
        char v66 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v66) {
          goto LABEL_46;
        }
        if ((SecTaskRef)static String._unconditionallyBridgeFromObjectiveC(_:)() == v11 && v67 == v13)
        {
          swift_bridgeObjectRelease();
LABEL_51:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          type metadata accessor for StickerSearchViewController();
          goto LABEL_33;
        }
        char v68 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v68) {
          goto LABEL_51;
        }
        if ((SecTaskRef)static String._unconditionallyBridgeFromObjectiveC(_:)() == v11 && v69 == v13)
        {
          swift_bridgeObjectRelease();
LABEL_56:
          if (static StickersFeatureFlags.isEmojiCreationEnabledForOS.getter())
          {
            swift_bridgeObjectRelease();
            type metadata accessor for EmojiGenerationController();
            id v71 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
            dispatch thunk of EmojiGenerationController.hostAppID.setter();
            v62 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v71];
            [v15 setRootViewController:v62];

            goto LABEL_34;
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          v62 = Logger.logObject.getter();
          os_log_type_t v72 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v62, v72))
          {
            v73 = (uint8_t *)swift_slowAlloc();
            os_log_t v93 = (os_log_t)swift_slowAlloc();
            *(_DWORD *)v73 = 136315138;
            swift_bridgeObjectRetain();
            uint64_t v92 = sub_100007128((uint64_t)v11, v13, (uint64_t *)&v93);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease_n();
            _os_log_impl((void *)&_mh_execute_header, v62, v72, "Unsupported activity type: %s", v73, 0xCu);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
            goto LABEL_34;
          }
LABEL_63:

          swift_bridgeObjectRelease_n();
          goto LABEL_35;
        }
        char v70 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v70) {
          goto LABEL_56;
        }
        swift_bridgeObjectRelease();
        if ((SecTaskRef)static String._unconditionallyBridgeFromObjectiveC(_:)() == v11 && v74 == v13)
        {
          swift_bridgeObjectRelease();
LABEL_65:
          swift_bridgeObjectRelease();
          type metadata accessor for StickerPhotosViewController();
          id v76 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
          id v77 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v76];

          [v15 setRootViewController:v77];
          goto LABEL_35;
        }
        char v75 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if (v75) {
          goto LABEL_65;
        }
        if ((SecTaskRef)static String._unconditionallyBridgeFromObjectiveC(_:)() == v11 && v78 == v13)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v79 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v79 & 1) == 0)
          {
            if ((SecTaskRef)static String._unconditionallyBridgeFromObjectiveC(_:)() == v11 && v81 == v13)
            {
              swift_bridgeObjectRelease();
            }
            else
            {
              char v82 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              if ((v82 & 1) == 0)
              {
                swift_bridgeObjectRetain();
                v62 = Logger.logObject.getter();
                os_log_type_t v83 = static os_log_type_t.error.getter();
                if (os_log_type_enabled(v62, v83))
                {
                  v84 = (uint8_t *)swift_slowAlloc();
                  os_log_t v93 = (os_log_t)swift_slowAlloc();
                  *(_DWORD *)v84 = 136315138;
                  swift_bridgeObjectRetain();
                  uint64_t v92 = sub_100007128((uint64_t)v11, v13, (uint64_t *)&v93);
                  UnsafeMutableRawBufferPointer.copyMemory(from:)();
                  swift_bridgeObjectRelease_n();
                  _os_log_impl((void *)&_mh_execute_header, v62, v83, "Unsupported activity type: %s", v84, 0xCu);
                  swift_arrayDestroy();
                  swift_slowDealloc();
                  swift_slowDealloc();

                  goto LABEL_35;
                }
                goto LABEL_63;
              }
            }
            swift_bridgeObjectRelease();
            type metadata accessor for LocalStickerEffectEditorViewController();
LABEL_71:
            id v80 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
            [v15 setRootViewController:v80];

            goto LABEL_35;
          }
        }
        swift_bridgeObjectRelease();
        type metadata accessor for AvatarEditorViewController();
        goto LABEL_71;
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v57 = Logger.logObject.getter();
    os_log_type_t v58 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v59 = 0;
      _os_log_impl((void *)&_mh_execute_header, v57, v58, "window already has a rootViewController", v59, 2u);
      swift_slowDealloc();
    }

    goto LABEL_36;
  }
LABEL_18:
  SecTaskRef v90 = v11;
  swift_bridgeObjectRelease();
  id v39 = a1;
  swift_bridgeObjectRetain();
  id v40 = v39;
  v41 = Logger.logObject.getter();
  os_log_type_t v42 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v41, v42))
  {
    uint64_t v43 = swift_slowAlloc();
    v44 = (void *)swift_slowAlloc();
    os_log_t v88 = (os_log_t)swift_slowAlloc();
    uint64_t v92 = (uint64_t)v40;
    os_log_t v93 = v88;
    *(_DWORD *)uint64_t v43 = 138412546;
    os_log_t v89 = v15;
    id v45 = v40;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v44 = v40;

    *(_WORD *)(v43 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v92 = sub_100007128((uint64_t)v90, v13, (uint64_t *)&v93);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "empty window scene: %@ activityType: %s", (uint8_t *)v43, 0x16u);
    sub_100007848(&qword_1000158D0);
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
}

void sub_100006D34(void *a1)
{
  if (qword_100015750 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000070A4(v2, (uint64_t)qword_1000157A0);
  id v3 = a1;
  v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    id v8 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v7 = v3;

    _os_log_impl((void *)&_mh_execute_header, v4, v5, "sceneWillEnterForeground %@", v6, 0xCu);
    sub_100007848(&qword_1000158D0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  self;
  uint64_t v9 = swift_dynamicCastObjCClass();
  if (v9)
  {
    v10 = (void *)v9;
    id v11 = v3;
    sub_100005AB4(v10, 1);
  }
}

id sub_100007020(uint64_t a1)
{
  return sub_100007038(a1, type metadata accessor for StickerPickerServiceSceneDelegate);
}

id sub_100007038(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  [super dealloc];
}

uint64_t type metadata accessor for StickerPickerServiceSceneDelegate()
{
  return self;
}

uint64_t sub_1000070A4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000070DC(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1000070EC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100007128(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000071FC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007AD4((uint64_t)v12, *a3);
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
      sub_100007AD4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007A84((uint64_t)v12);
  return v7;
}

uint64_t sub_1000071FC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_1000073B8(a5, a6);
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

uint64_t sub_1000073B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007450(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007630(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007630(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007450(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000075C8(v2, 0);
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

void *sub_1000075C8(uint64_t a1, uint64_t a2)
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
  sub_100007848(&qword_1000158F8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100007630(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007848(&qword_1000158F8);
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
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unsigned char **sub_100007780(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  unsigned char *v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

void sub_100007790(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
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

uint64_t sub_100007848(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_10000788C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000078F0(uint64_t a1)
{
  uint64_t v2 = sub_100007848(&qword_1000158D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100007950()
{
  unint64_t result = qword_1000158E8;
  if (!qword_1000158E8)
  {
    type metadata accessor for ActivitityTypeConfiguration.ConfigurationSetting();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000158E8);
  }
  return result;
}

SecTaskRef sub_1000079A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)token.val = a1;
  *(void *)&token.val[2] = a2;
  *(void *)&token.val[4] = a3;
  *(void *)&token.val[6] = a4;
  SecTaskRef result = SecTaskCreateWithAuditToken(0, &token);
  if (result)
  {
    size_t v5 = result;
    unint64_t v6 = (__CFString *)String._bridgeToObjectiveC()();
    CFTypeRef v7 = SecTaskCopyValueForEntitlement(v5, v6, 0);

    if (v7 && (swift_dynamicCast() & 1) != 0) {
      return *(SecTaskRef *)token.val;
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100007A84(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_100007B34(void *a1)
{
  uint64_t v2 = v1;
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    size_t v5 = (void *)v4;
    uint64_t v6 = qword_100015750;
    id v7 = a1;
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_1000070A4(v8, (uint64_t)qword_1000157A0);
    id v9 = v7;
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = v2;
      unint64_t v13 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 138412290;
      id v14 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v13 = v9;

      _os_log_impl((void *)&_mh_execute_header, v10, v11, "willConnectTo scene: %@", v12, 0xCu);
      sub_100007848(&qword_1000158D0);
      swift_arrayDestroy();
      uint64_t v2 = v17;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v15 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithWindowScene:v5];
    double v16 = *(void **)(v2 + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window);
    *(void *)(v2 + OBJC_IVAR____TtC20StickerPickerService33StickerPickerServiceSceneDelegate_window) = v15;

    sub_100005AB4(v5, 0);
  }
}

void sub_100007D48(void *a1, void *a2)
{
  if (qword_100015750 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000070A4(v4, (uint64_t)qword_1000157A0);
  id v5 = a1;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v24 = a2;
    id v25 = v5;
    id v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "windowScene didUpdateCoordinateSpace %@", v8, 0xCu);
    sub_100007848(&qword_1000158D0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  if (objc_msgSend(v5, "activationState", v24, v25) != (id)2)
  {
    objc_msgSend(objc_msgSend(v5, "coordinateSpace"), "bounds");
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    swift_unknownObjectRelease();
    [a2 bounds];
    v27.origin.x = v19;
    v27.origin.y = v20;
    v27.size.width = v21;
    v27.size.height = v22;
    v26.origin.x = v12;
    v26.origin.y = v14;
    v26.size.width = v16;
    v26.size.height = v18;
    BOOL v23 = CGRectEqualToRect(v26, v27);
    sub_100005AB4(v5, !v23);
  }
}

void sub_100007FA4(void *a1, const char *a2)
{
  if (qword_100015750 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000070A4(v4, (uint64_t)qword_1000157A0);
  id v10 = a1;
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v7 = 138412290;
    id v9 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v8 = v10;

    _os_log_impl((void *)&_mh_execute_header, v5, v6, a2, v7, 0xCu);
    sub_100007848(&qword_1000158D0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_100008180(void *a1)
{
  sub_100007848(&qword_1000158D8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100015750 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_1000070A4(v4, (uint64_t)qword_1000157A0);
  id v5 = a1;
  os_log_type_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    id v9 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 138412290;
    v27[1] = v5;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "sceneDidEnterBackground %@", v8, 0xCu);
    sub_100007848(&qword_1000158D0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  self;
  uint64_t v11 = swift_dynamicCastObjCClass();
  if (v11)
  {
    CGFloat v12 = (void *)v11;
    id v13 = v5;
    UIScene.hostStorage.getter();
    uint64_t v14 = sub_100007848(&qword_1000158E0);
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v3, 1, v14) == 1)
    {

      sub_1000078F0((uint64_t)v3);
      return;
    }
    type metadata accessor for ActivitityTypeConfiguration.ConfigurationSetting();
    swift_getOpaqueTypeConformance2();
    sub_100007950();
    CGFloat v16 = (void *)dispatch thunk of UISceneKeyValueStorage.subscript.getter();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v3, v14);
    uint64_t v17 = ActivitityTypeConfiguration.activityType.getter();
    uint64_t v19 = v18;

    if (static String._unconditionallyBridgeFromObjectiveC(_:)() != v17 || v20 != v19)
    {
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v21) {
        goto LABEL_13;
      }
      if (static String._unconditionallyBridgeFromObjectiveC(_:)() != v17 || v25 != v19)
      {
        char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v26 & 1) == 0)
        {
LABEL_16:

          return;
        }
LABEL_14:
        id v22 = [v12 keyWindow];
        if (v22)
        {
          BOOL v23 = v22;
          id v24 = [v22 firstResponder];

          [v24 resignFirstResponder];
        }
        goto LABEL_16;
      }
    }
    swift_bridgeObjectRelease();
LABEL_13:
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
}

uint64_t sub_100008590()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000788C(v0, qword_1000159C0);
  sub_1000070A4(v0, (uint64_t)qword_1000159C0);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100008614()
{
  type metadata accessor for StickerStore.PersistenceType();
  __chkstk_darwin();
  (*(void (**)(char *, void))(v1 + 104))((char *)&v3 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0), enum case for StickerStore.PersistenceType.remote(_:));
  type metadata accessor for StickerStore();
  swift_allocObject();
  uint64_t result = StickerStore.init(persistence:)();
  qword_100015C28 = result;
  return result;
}

uint64_t static StickersOnDemandReindexer.reindexStickersIfNecessary()()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000159E0 + dword_1000159E0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100008794;
  return v3();
}

uint64_t sub_100008794()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1000089E8(const void *a1)
{
  *(void *)(v1 + 16) = _Block_copy(a1);
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000159E0 + dword_1000159E0);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v1 + 24) = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_100008A90;
  return v4();
}

uint64_t sub_100008A90()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 16);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  v1[2](v1);
  _Block_release(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

id sub_100008BB0(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100007848(&qword_100015A98);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin();
  os_log_type_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(swift_allocObject() + 16) = a2;
  id v8 = a2;
  uint64_t v20 = a1;
  id v21 = v8;
  AsyncThrowingStream.Continuation.onTermination.setter();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v19(v7, a1, v4);
  uint64_t v9 = *(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = (v9 + 16) & ~v9;
  uint64_t v18 = v9 | 7;
  uint64_t v11 = swift_allocObject();
  CGFloat v12 = *(void (**)(uint64_t, char *, uint64_t))(v5 + 32);
  v12(v11 + v10, v7, v4);
  char v26 = sub_10000B7A4;
  uint64_t v27 = v11;
  aBlock = _NSConcreteStackBlock;
  uint64_t v23 = 1107296256;
  id v24 = sub_100009098;
  uint64_t v25 = &unk_100010840;
  id v13 = _Block_copy(&aBlock);
  swift_release();
  id v14 = v21;
  [v21 setFoundItemsHandler:v13];
  _Block_release(v13);
  v19(v7, v20, v4);
  uint64_t v15 = swift_allocObject();
  v12(v15 + v10, v7, v4);
  char v26 = sub_10000B86C;
  uint64_t v27 = v15;
  aBlock = _NSConcreteStackBlock;
  uint64_t v23 = 1107296256;
  id v24 = sub_100009160;
  uint64_t v25 = &unk_100010890;
  CGFloat v16 = _Block_copy(&aBlock);
  swift_release();
  [v14 setCompletionHandler:v16];
  _Block_release(v16);
  return [v14 start];
}

uint64_t sub_100008E90(unint64_t a1)
{
  uint64_t v2 = sub_100007848(&qword_100015AA8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!(a1 >> 62))
  {
    uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_3;
    }
LABEL_11:
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v6 = result;
  if (!result) {
    goto LABEL_11;
  }
LABEL_3:
  if (v6 >= 1)
  {
    id v8 = (void (**)(char *, uint64_t))(v3 + 8);
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v9 = 0;
      do
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        swift_unknownObjectRelease();
        ++v9;
        uint64_t v11 = 1;
        sub_100007848(&qword_100015A98);
        AsyncThrowingStream.Continuation.yield(_:)();
        (*v8)(v5, v2);
      }
      while (v6 != v9);
    }
    else
    {
      do
      {
        uint64_t v11 = 1;
        sub_100007848(&qword_100015A98);
        AsyncThrowingStream.Continuation.yield(_:)();
        (*v8)(v5, v2);
        --v6;
      }
      while (v6);
    }
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_100009098(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_10000B90C();
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000910C(uint64_t a1)
{
  if (a1) {
    swift_errorRetain();
  }
  sub_100007848(&qword_100015A98);
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

void sub_100009160(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_1000091CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v3;
  return _swift_task_switch(sub_1000091F0, 0, 0);
}

uint64_t sub_1000091F0()
{
  uint64_t v1 = **(char ***)(v0 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v1 = sub_1000098BC(0, *((void *)v1 + 2) + 1, 1, v1);
  }
  unint64_t v3 = *((void *)v1 + 2);
  unint64_t v2 = *((void *)v1 + 3);
  if (v3 >= v2 >> 1) {
    uint64_t v1 = sub_1000098BC((char *)(v2 > 1), v3 + 1, 1, v1);
  }
  uint64_t v5 = *(char ***)(v0 + 16);
  uint64_t v4 = *(void *)(v0 + 24);
  *((void *)v1 + 2) = v3 + 1;
  *(void *)&v1[8 * v3 + 32] = v4;
  *uint64_t v5 = v1;
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

id StickersOnDemandReindexer.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id StickersOnDemandReindexer.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickersOnDemandReindexer();
  return [super init];
}

id StickersOnDemandReindexer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickersOnDemandReindexer();
  return [super dealloc];
}

uint64_t sub_1000093AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  void *v4 = v3;
  v4[1] = sub_10000B954;
  return v6();
}

uint64_t sub_100009478(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000B954;
  return v7();
}

uint64_t sub_100009544(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000B574(a1);
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

uint64_t sub_1000096E8(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000097C4;
  return v6(a1);
}

uint64_t sub_1000097C4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

char *sub_1000098BC(char *result, int64_t a2, char a3, char *a4)
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
      sub_100007848(&qword_100015A90);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      id v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      id v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 32]) {
          memmove(v13, a4 + 32, 8 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100009D34(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000099CC()
{
  uint64_t v1 = type metadata accessor for Sticker.StickerType();
  v0[3] = v1;
  v0[4] = *(void *)(v1 - 8);
  v0[5] = swift_task_alloc();
  return _swift_task_switch(sub_100009A88, 0, 0);
}

uint64_t sub_100009A88()
{
  if (qword_100015760 != -1) {
    swift_once();
  }
  (*(void (**)(void, void, void))(v0[4] + 104))(v0[5], enum case for Sticker.StickerType.userContent(_:), v0[3]);
  uint64_t v1 = dispatch thunk of StickerStore.count(type:)();
  (*(void (**)(void, void))(v0[4] + 8))(v0[5], v0[3]);
  swift_task_dealloc();
  uint64_t v2 = (uint64_t (*)(uint64_t))v0[1];
  return v2(v1);
}

char *sub_100009D34(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100009E20()
{
  uint64_t v1 = sub_100007848(&qword_100015A60);
  v0[7] = v1;
  v0[8] = *(void *)(v1 - 8);
  v0[9] = swift_task_alloc();
  uint64_t v2 = sub_100007848(&qword_100015A68);
  v0[10] = v2;
  v0[11] = *(void *)(v2 - 8);
  v0[12] = swift_task_alloc();
  uint64_t v3 = sub_100007848(&qword_100015A70);
  v0[13] = v3;
  v0[14] = *(void *)(v3 - 8);
  v0[15] = swift_task_alloc();
  v0[16] = swift_task_alloc();
  return _swift_task_switch(sub_100009FB0, 0, 0);
}

uint64_t sub_100009FB0()
{
  static Task<>.checkCancellation()();
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[14];
  uint64_t v6 = v0[11];
  uint64_t v5 = v0[12];
  uint64_t v19 = v0[10];
  id v7 = [self emptySuggestion];
  v0[17] = v7;
  id v8 = [self userQueryContextWithCurrentSuggestion:v7];
  v0[18] = v8;
  id v9 = v8;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  [v9 setFetchAttributes:isa];

  id v11 = objc_allocWithZone((Class)CSSearchQuery);
  id v12 = v9;
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [v11 initWithQueryString:v13 queryContext:v12];
  v0[19] = v14;

  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, enum case for AsyncThrowingStream.Continuation.BufferingPolicy.unbounded<A, B>(_:), v19);
  *(void *)(swift_task_alloc() + 16) = v14;
  AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
  swift_task_dealloc();
  v0[4] = &_swiftEmptyArrayStorage;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  sub_10000B714(&qword_100015A80, &qword_100015A70);
  dispatch thunk of AsyncSequence.makeAsyncIterator()();
  uint64_t v15 = sub_10000B714(&qword_100015A88, &qword_100015A60);
  CGFloat v16 = (void *)swift_task_alloc();
  v0[20] = v16;
  *CGFloat v16 = v0;
  v16[1] = sub_10000A2F8;
  uint64_t v17 = v0[7];
  return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 2, v17, v15);
}

uint64_t sub_10000A2F8()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[8];
    uint64_t v3 = v2[9];
    uint64_t v5 = v2[7];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_10000A60C;
  }
  else
  {
    uint64_t v6 = sub_10000A43C;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_10000A43C()
{
  if (*(unsigned char *)(v0 + 24))
  {
    uint64_t result = (*(uint64_t (**)(void, void))(*(void *)(v0 + 64) + 8))(*(void *)(v0 + 72), *(void *)(v0 + 56));
    uint64_t v2 = *(void *)(v0 + 32);
    uint64_t v3 = *(void *)(v2 + 16);
    if (v3)
    {
      uint64_t v4 = 0;
      uint64_t v5 = (uint64_t *)(v2 + 32);
      while (1)
      {
        uint64_t v6 = *v5++;
        BOOL v7 = __OFADD__(v4, v6);
        v4 += v6;
        if (v7) {
          break;
        }
        if (!--v3) {
          goto LABEL_11;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v4 = 0;
LABEL_11:
      id v9 = *(void **)(v0 + 144);
      uint64_t v10 = *(void *)(v0 + 128);
      id v11 = *(void **)(v0 + 136);
      uint64_t v12 = *(void *)(v0 + 104);
      uint64_t v13 = *(void *)(v0 + 112);

      (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v10, v12);
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      id v14 = *(uint64_t (**)(uint64_t))(v0 + 8);
      return v14(v4);
    }
  }
  else
  {
    *(void *)(v0 + 40) = *(void *)(v0 + 16);
    uint64_t v15 = (uint64_t (*)(uint64_t, uint64_t *))((char *)&dword_100015A78 + dword_100015A78);
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 176) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_10000A86C;
    return v15(v0 + 32, (uint64_t *)(v0 + 40));
  }
  return result;
}

uint64_t sub_10000A60C()
{
  if (qword_100015758 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_1000070A4(v1, (uint64_t)qword_1000159C0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    id v14 = *(void **)(v0 + 152);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 48) = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Could not fetch total sticker count: %@", v4, 0xCu);
    sub_100007848(&qword_1000158D0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = *(void **)(v0 + 136);
  BOOL v7 = *(void **)(v0 + 144);
  uint64_t v9 = *(void *)(v0 + 128);
  uint64_t v10 = *(void *)(v0 + 104);
  uint64_t v11 = *(void *)(v0 + 112);
  swift_errorRelease();

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v12(-1);
}

uint64_t sub_10000A86C()
{
  uint64_t v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v4 = v2[8];
    uint64_t v3 = v2[9];
    uint64_t v5 = v2[7];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    uint64_t v6 = sub_10000AA8C;
  }
  else
  {
    uint64_t v6 = sub_10000A9B0;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_10000A9B0()
{
  uint64_t v1 = sub_10000B714(&qword_100015A88, &qword_100015A60);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 160) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10000A2F8;
  uint64_t v3 = *(void *)(v0 + 56);
  return dispatch thunk of AsyncIteratorProtocol.next()(v0 + 16, v3, v1);
}

uint64_t sub_10000AA8C()
{
  if (qword_100015758 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_1000070A4(v1, (uint64_t)qword_1000159C0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    id v14 = *(void **)(v0 + 152);
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 48) = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Could not fetch total sticker count: %@", v4, 0xCu);
    sub_100007848(&qword_1000158D0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  uint64_t v8 = *(void **)(v0 + 136);
  BOOL v7 = *(void **)(v0 + 144);
  uint64_t v9 = *(void *)(v0 + 128);
  uint64_t v10 = *(void *)(v0 + 104);
  uint64_t v11 = *(void *)(v0 + 112);
  swift_errorRelease();

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v12(-1);
}

uint64_t sub_10000ACEC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v1;
  void *v1 = v0;
  v1[1] = sub_10000AD78;
  return sub_1000099CC();
}

uint64_t sub_10000AD78(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v5 = *v1;
  *(void *)(v2 + 32) = a1;
  swift_task_dealloc();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 40) = v3;
  *uint64_t v3 = v5;
  v3[1] = sub_10000AEA4;
  return sub_100009E20();
}

uint64_t sub_10000AEA4(uint64_t a1)
{
  *(void *)(*(void *)v1 + 48) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_10000AFA4, 0, 0);
}

uint64_t sub_10000AFA4()
{
  if (v0[4] != v0[6])
  {
    if (qword_100015760 != -1) {
      swift_once();
    }
    dispatch thunk of StickerStore.reindexAllStickers()();
    if (qword_100015758 != -1) {
      swift_once();
    }
    uint64_t v1 = type metadata accessor for Logger();
    sub_1000070A4(v1, (uint64_t)qword_1000159C0);
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Finished reindexing all stickers", v4, 2u);
      swift_slowDealloc();
    }
  }
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t type metadata accessor for StickersOnDemandReindexer()
{
  return self;
}

uint64_t sub_10000B2BC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B2F4()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  os_log_type_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *os_log_type_t v3 = v1;
  v3[1] = sub_10000B954;
  uint64_t v4 = (uint64_t (*)(const void *))((char *)&dword_100015A10 + dword_100015A10);
  return v4(v2);
}

uint64_t sub_10000B3A4()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000B954;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100015A20 + dword_100015A20);
  return v6(v2, v3, v4);
}

uint64_t sub_10000B468()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000B4A8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10000B954;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100015A30 + dword_100015A30);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000B574(uint64_t a1)
{
  uint64_t v2 = sub_100007848(&qword_100015B50);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B5D4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B60C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100008794;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100015A40 + dword_100015A40);
  return v6(a1, v4);
}

id sub_10000B6C4(uint64_t a1)
{
  return sub_100008BB0(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000B6CC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000B714(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B6CC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000B758()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10000B790()
{
  return [*(id *)(v0 + 16) cancel];
}

uint64_t sub_10000B7A4(uint64_t a1)
{
  return sub_10000B884(a1, (uint64_t (*)(uint64_t, uint64_t))sub_100008E90);
}

uint64_t sub_10000B7BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B7CC()
{
  return swift_release();
}

uint64_t sub_10000B7D8()
{
  uint64_t v1 = sub_100007848(&qword_100015A98);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10000B86C(uint64_t a1)
{
  return sub_10000B884(a1, (uint64_t (*)(uint64_t, uint64_t))sub_10000910C);
}

uint64_t sub_10000B884(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4 = *(void *)(sub_100007848(&qword_100015A98) - 8);
  uint64_t v5 = v2 + ((*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));

  return a2(a1, v5);
}

unint64_t sub_10000B90C()
{
  unint64_t result = qword_100015AA0;
  if (!qword_100015AA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100015AA0);
  }
  return result;
}

uint64_t sub_10000B958()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000788C(v0, qword_100015AB0);
  sub_1000070A4(v0, (uint64_t)qword_100015AB0);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000B9DC()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 16) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000BA70, v2, v1);
}

uint64_t sub_10000BA70()
{
  swift_release();
  type metadata accessor for ImageGlyphDataSource();
  uint64_t v1 = (void *)static ImageGlyphDataSource.sharedInstance.getter();
  dispatch thunk of ImageGlyphAggregatingDataSource.numberOfSections()();

  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000BAEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100007848(&qword_100015B50);
  __chkstk_darwin();
  uint64_t v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000C408(a1, (uint64_t)v7);
  uint64_t v8 = type metadata accessor for TaskPriority();
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_10000B574((uint64_t)v7);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v10 = 0;
  uint64_t v12 = 0;
LABEL_6:
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a2;
  *(void *)(v13 + 24) = a3;
  if (v12 | v10)
  {
    v15[0] = 0;
    v15[1] = 0;
    v15[2] = v10;
    v15[3] = v12;
  }
  return swift_task_create();
}

uint64_t sub_10000BCD0()
{
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_1000159E0 + dword_1000159E0);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000B954;
  return v3();
}

id sub_10000BE90()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerPickerServiceAppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

void sub_10000BEE0()
{
  sub_100007848(&qword_100015B50);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v20 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for EmojiKeyboardPrewarmAuditor();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100015768 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_1000070A4(v6, (uint64_t)qword_100015AB0);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "StickerPickerService launched", v9, 2u);
    swift_slowDealloc();
  }

  EmojiKeyboardPrewarmAuditor.init()();
  char v10 = EmojiKeyboardPrewarmAuditor.shouldPrewarm.getter();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v10)
  {
    uint64_t v11 = type metadata accessor for TaskPriority();
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    v12(v1, 1, 1, v11);
    type metadata accessor for MainActor();
    uint64_t v13 = static MainActor.shared.getter();
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v13;
    *(void *)(v14 + 24) = &protocol witness table for MainActor;
    sub_10000BAEC((uint64_t)v1, (uint64_t)&unk_100015B60, v14);
    swift_release();
    sub_10000B574((uint64_t)v1);
    v12(v1, 1, 1, v11);
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = 0;
    *(void *)(v15 + 24) = 0;
    sub_10000BAEC((uint64_t)v1, (uint64_t)&unk_100015B70, v15);
    swift_release();
    sub_10000B574((uint64_t)v1);
  }
  int v16 = static CommandLine.argc.getter();
  uint64_t v17 = (char **)static CommandLine.unsafeArgv.getter();
  type metadata accessor for StickerPickerServiceAppDelegate();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v19 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v19)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v19 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  UIApplicationMain(v16, v17, 0, v19);
}

uint64_t type metadata accessor for StickerPickerServiceAppDelegate()
{
  return self;
}

uint64_t sub_10000C240()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C278()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_100008794;
  return sub_10000B9DC();
}

uint64_t sub_10000C324()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000B954;
  uint64_t v4 = (uint64_t (__cdecl *)())((char *)&dword_1000159E0 + dword_1000159E0);
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_10000B954;
  return v4();
}

uint64_t sub_10000C408(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007848(&qword_100015B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C470()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000C4A8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100008794;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100015B78 + dword_100015B78);
  return v6(a1, v4);
}

uint64_t sub_10000C564()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t type metadata accessor for LocalEmojiAndStickerCollectionViewController()
{
  return type metadata accessor for LocalEmojiAndStickerCollectionViewController();
}

uint64_t type metadata accessor for LocalStickerEffectEditorViewController()
{
  return type metadata accessor for LocalStickerEffectEditorViewController();
}

uint64_t type metadata accessor for StickerPhotosViewController()
{
  return type metadata accessor for StickerPhotosViewController();
}

uint64_t type metadata accessor for StickerSearchViewController()
{
  return type metadata accessor for StickerSearchViewController();
}

uint64_t type metadata accessor for StickerPickerInProcessViewController()
{
  return type metadata accessor for StickerPickerInProcessViewController();
}

uint64_t static ImageGlyphDataSource.sharedInstance.getter()
{
  return static ImageGlyphDataSource.sharedInstance.getter();
}

uint64_t type metadata accessor for ImageGlyphDataSource()
{
  return type metadata accessor for ImageGlyphDataSource();
}

uint64_t static StickersFeatureFlags.isEmojiCreationEnabledForOS.getter()
{
  return static StickersFeatureFlags.isEmojiCreationEnabledForOS.getter();
}

uint64_t dispatch thunk of EmojiGenerationController.hostAppID.setter()
{
  return dispatch thunk of EmojiGenerationController.hostAppID.setter();
}

uint64_t type metadata accessor for EmojiGenerationController()
{
  return type metadata accessor for EmojiGenerationController();
}

uint64_t type metadata accessor for AvatarEditorViewController()
{
  return type metadata accessor for AvatarEditorViewController();
}

uint64_t ActivitityTypeConfiguration.activityType.getter()
{
  return ActivitityTypeConfiguration.activityType.getter();
}

uint64_t type metadata accessor for ActivitityTypeConfiguration.ConfigurationSetting()
{
  return type metadata accessor for ActivitityTypeConfiguration.ConfigurationSetting();
}

uint64_t EmojiKeyboardPrewarmAuditor.shouldPrewarm.getter()
{
  return EmojiKeyboardPrewarmAuditor.shouldPrewarm.getter();
}

uint64_t EmojiKeyboardPrewarmAuditor.init()()
{
  return EmojiKeyboardPrewarmAuditor.init()();
}

uint64_t type metadata accessor for EmojiKeyboardPrewarmAuditor()
{
  return type metadata accessor for EmojiKeyboardPrewarmAuditor();
}

uint64_t type metadata accessor for LocalCategoryViewController()
{
  return type metadata accessor for LocalCategoryViewController();
}

uint64_t dispatch thunk of ImageGlyphAggregatingDataSource.numberOfSections()()
{
  return dispatch thunk of ImageGlyphAggregatingDataSource.numberOfSections()();
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

uint64_t dispatch thunk of UISceneKeyValueStorage.subscript.getter()
{
  return dispatch thunk of UISceneKeyValueStorage.subscript.getter();
}

uint64_t dispatch thunk of StickerStore.reindexAllStickers()()
{
  return dispatch thunk of StickerStore.reindexAllStickers()();
}

uint64_t StickerStore.init(persistence:)()
{
  return StickerStore.init(persistence:)();
}

uint64_t type metadata accessor for StickerStore.PersistenceType()
{
  return type metadata accessor for StickerStore.PersistenceType();
}

uint64_t dispatch thunk of StickerStore.count(type:)()
{
  return dispatch thunk of StickerStore.count(type:)();
}

uint64_t type metadata accessor for StickerStore()
{
  return type metadata accessor for StickerStore();
}

uint64_t type metadata accessor for Sticker.StickerType()
{
  return type metadata accessor for Sticker.StickerType();
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

uint64_t String.debugDescription.getter()
{
  return String.debugDescription.getter();
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

uint64_t static Task<>.checkCancellation()()
{
  return static Task<>.checkCancellation()();
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
}

uint64_t AsyncThrowingStream.Continuation.onTermination.setter()
{
  return AsyncThrowingStream.Continuation.onTermination.setter();
}

uint64_t AsyncThrowingStream.Continuation.yield(_:)()
{
  return AsyncThrowingStream.Continuation.yield(_:)();
}

uint64_t AsyncThrowingStream.Continuation.finish(throwing:)()
{
  return AsyncThrowingStream.Continuation.finish(throwing:)();
}

uint64_t AsyncThrowingStream.init<>(_:bufferingPolicy:_:)()
{
  return AsyncThrowingStream.init<>(_:bufferingPolicy:_:)();
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

uint64_t CGSize.debugDescription.getter()
{
  return CGSize.debugDescription.getter();
}

uint64_t UIScene.hostStorage.getter()
{
  return UIScene.hostStorage.getter();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
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