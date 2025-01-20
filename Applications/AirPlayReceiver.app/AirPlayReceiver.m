uint64_t sub_100004FA0()
{
  uint64_t v0;
  uint64_t vars8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for PINViewModel()
{
  return self;
}

void type metadata accessor for CFRunLoopSource(uint64_t a1)
{
}

void *sub_100005018()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100005024@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for PINViewModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100005060()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_1000050AC()
{
  return _CFObject.hash(into:)();
}

Swift::Int sub_100005104()
{
  return sub_100005644();
}

uint64_t sub_10000511C()
{
  swift_getWitnessTable();

  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_100005188(uint64_t a1, uint64_t a2)
{
  return sub_100005280(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000051A0()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000051F4()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100005268(uint64_t a1, uint64_t a2)
{
  return sub_100005280(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005280(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000052C4(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_10000533C(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000053BC@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void sub_100005400(void *a1@<X8>)
{
  *a1 = *v1;
}

void type metadata accessor for CFUserNotification(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

void sub_100005448(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100005490()
{
  swift_getWitnessTable();

  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_1000054FC()
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

uint64_t sub_100005588()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_1000055D4()
{
  return _CFObject.hash(into:)();
}

Swift::Int sub_10000562C()
{
  return sub_100005644();
}

Swift::Int sub_100005644()
{
  return Hasher._finalize()();
}

uint64_t sub_1000056A8@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000056F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000571C(uint64_t a1)
{
  uint64_t v2 = sub_100005868((unint64_t *)&qword_100022180, type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_100005868(&qword_100022188, type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000057D8()
{
  return sub_100005868(&qword_100022148, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100005820()
{
  return sub_100005868(&qword_100022150, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100005868(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000058B0()
{
  return sub_100005868(&qword_100022158, type metadata accessor for CFUserNotification);
}

uint64_t sub_1000058F8()
{
  return sub_100005868(&qword_100022160, type metadata accessor for CFString);
}

uint64_t sub_100005940()
{
  return sub_100005868(&qword_100022168, type metadata accessor for CFUserNotification);
}

uint64_t sub_100005988()
{
  return sub_100005868(&qword_100022170, type metadata accessor for CFString);
}

uint64_t sub_1000059D0()
{
  return sub_100005868(&qword_100022178, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100005A34(uint64_t a1)
{
  unint64_t v2 = sub_100007C04();

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100005A70(uint64_t a1)
{
  unint64_t v2 = sub_100007C04();

  return Error<>._code.getter(a1, v2);
}

void sub_100005AB4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, CFTimeInterval a5)
{
  BSDispatchQueueAssertMain();
  uint64_t v11 = OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_isShowing;
  if (*(unsigned char *)(v5 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_isShowing))
  {
    __break(1u);
    swift_once();
    uint64_t v12 = type metadata accessor for Logger();
    sub_100007B14(v12, (uint64_t)qword_1000238A8);
    swift_errorRetain();
    swift_errorRetain();
    oslog = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = swift_slowAlloc();
      *(_DWORD *)v14 = 136315138;
      swift_getErrorValue();
      uint64_t v15 = Error.localizedDescription.getter();
      sub_100014B64(v15, v16, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v13, "Unable to show accept dialog due to error: %s", v14, 0xCu);
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
  }
  else
  {
    sub_100005DBC(a1, a2, a3, a4, a5);
    *(unsigned char *)(v5 + v11) = 1;
  }
}

void sub_100005D18()
{
  BSDispatchQueueAssertMain();
  *(unsigned char *)(v0 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_isShowing) = 0;
  uint64_t v1 = off_100022198;
  off_100022198 = 0;
  qword_1000221A0 = 0;
  sub_100007688((uint64_t)v1);
  unint64_t v2 = *(__CFRunLoopSource **)(v0 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController__pendingResultRunloopSource);
  if (v2)
  {
    *(void *)(v0 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController__pendingResultRunloopSource) = 0;
    CFRunLoopSourceInvalidate(v2);
  }
  uint64_t v3 = (__CFUserNotification *)qword_100022190;
  if (qword_100022190)
  {
    qword_100022190 = 0;
    uint64_t v4 = v3;
    CFUserNotificationCancel(v3);
  }
}

void sub_100005DBC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, CFTimeInterval a5)
{
  uint64_t v94 = a4;
  uint64_t v93 = a3;
  uint64_t v103 = a1;
  id v104 = a2;
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v98 = *(void *)(v6 - 8);
  uint64_t v99 = v6;
  __chkstk_darwin(v6);
  v96 = (char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000716C(&qword_1000222D0);
  __chkstk_darwin(v8 - 8);
  v97 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  v10 = self;
  id v11 = [v10 mainBundle];
  NSString v12 = String._bridgeToObjectiveC()();
  NSString v13 = String._bridgeToObjectiveC()();
  id v14 = [v11 localizedStringForKey:v12 value:0 table:v13];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v15 = objc_allocWithZone((Class)SBSMutableUserNotificationButtonDefinition);
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v17 = [v15 initWithTitle:v16];

  [v17 setPresentationStyle:0];
  [v17 setIsPreferredButton:1];
  id v18 = [v10 mainBundle];
  NSString v19 = String._bridgeToObjectiveC()();
  NSString v20 = String._bridgeToObjectiveC()();
  id v21 = [v18 localizedStringForKey:v19 value:0 table:v20];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v22 = objc_allocWithZone((Class)SBSMutableUserNotificationButtonDefinition);
  NSString v23 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v24 = [v22 initWithTitle:v23];

  [v24 setPresentationStyle:2];
  sub_10000716C(&qword_100022910);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000166D0;
  *(void *)(inited + 32) = v24;
  *(void *)(inited + 40) = v17;
  sub_10000716C(&qword_1000222D8);
  uint64_t v26 = swift_initStackObject();
  *(_OWORD *)(v26 + 16) = xmmword_1000166E0;
  if (!kCFUserNotificationAlertHeaderKey)
  {
    swift_release();
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v27 = v26;
  *(void *)(v26 + 32) = kCFUserNotificationAlertHeaderKey;
  id v100 = v24;
  id v101 = v17;
  CFStringRef v28 = (id)kCFUserNotificationAlertHeaderKey;
  id v29 = [v10 mainBundle];
  NSString v30 = String._bridgeToObjectiveC()();
  NSString v31 = String._bridgeToObjectiveC()();
  id v32 = [v29 localizedStringForKey:v30 value:0 table:v31];

  uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v35 = v34;

  *(void *)(v27 + 64) = &type metadata for String;
  *(void *)(v27 + 40) = v33;
  *(void *)(v27 + 48) = v35;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_23:
    swift_release();
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v102 = inited;
  *(void *)(v27 + 72) = kCFUserNotificationAlertMessageKey;
  CFStringRef v36 = (id)kCFUserNotificationAlertMessageKey;
  id v95 = v10;
  id v37 = [v10 mainBundle];
  NSString v38 = String._bridgeToObjectiveC()();
  NSString v39 = String._bridgeToObjectiveC()();
  id v40 = [v37 localizedStringForKey:v38 value:0 table:v39];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000716C(&qword_1000222E0);
  uint64_t v41 = swift_allocObject();
  *(_OWORD *)(v41 + 16) = xmmword_1000166F0;
  *(void *)(v41 + 56) = &type metadata for String;
  *(void *)(v41 + 64) = sub_1000071B0();
  id v42 = v104;
  *(void *)(v41 + 32) = v103;
  *(void *)(v41 + 40) = v42;
  swift_bridgeObjectRetain();
  uint64_t v43 = String.init(format:_:)();
  uint64_t v45 = v44;
  swift_bridgeObjectRelease();
  *(void *)(v27 + 104) = &type metadata for String;
  *(void *)(v27 + 80) = v43;
  *(void *)(v27 + 88) = v45;
  v46 = (void *)SBSUserNotificationButtonDefinitionsKey;
  if (!SBSUserNotificationButtonDefinitionsKey)
  {
LABEL_24:
    swift_release();
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  *(void *)(v27 + 112) = SBSUserNotificationButtonDefinitionsKey;
  *(void *)v105 = &_swiftEmptyArrayStorage;
  id v47 = v46;
  sub_100007570(0, 2, 0);
  v48 = *(void **)v105;
  id v49 = v100;
  id v50 = [v49 build];
  uint64_t v51 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v104 = v49;

  unint64_t v53 = v48[2];
  unint64_t v52 = v48[3];
  if (v53 >= v52 >> 1)
  {
    sub_100007570(v52 > 1, v53 + 1, 1);
    v48 = *(void **)v105;
  }
  v48[2] = v53 + 1;
  v48[v53 + 4] = v51;
  id v54 = v101;
  id v55 = [v54 build];
  uint64_t v56 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v58 = v48[2];
  unint64_t v57 = v48[3];
  if (v58 >= v57 >> 1)
  {
    sub_100007570(v57 > 1, v58 + 1, 1);
    v48 = *(void **)v105;
  }
  v48[2] = v58 + 1;
  v48[v58 + 4] = v56;
  swift_release();
  *(void *)(v27 + 144) = sub_10000716C(&qword_1000222F0);
  *(void *)(v27 + 120) = v48;
  if (!kCFUserNotificationAlertTopMostKey) {
    goto LABEL_25;
  }
  *(void *)(v27 + 152) = kCFUserNotificationAlertTopMostKey;
  *(void *)(v27 + 184) = &type metadata for Bool;
  *(unsigned char *)(v27 + 160) = 1;
  v59 = (void *)SBUserNotificationDismissOnLock;
  if (!SBUserNotificationDismissOnLock)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  *(void *)(v27 + 192) = SBUserNotificationDismissOnLock;
  *(void *)(v27 + 224) = &type metadata for Bool;
  *(unsigned char *)(v27 + 200) = 1;
  v60 = (void *)SBUserNotificationDontDismissOnUnlock;
  if (!SBUserNotificationDontDismissOnUnlock)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  *(void *)(v27 + 232) = SBUserNotificationDontDismissOnUnlock;
  *(void *)(v27 + 264) = &type metadata for Bool;
  *(unsigned char *)(v27 + 240) = 1;
  v61 = (void *)SBUserNotificationIgnoresQuietMode;
  if (!SBUserNotificationIgnoresQuietMode)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  *(void *)(v27 + 272) = SBUserNotificationIgnoresQuietMode;
  *(void *)(v27 + 304) = &type metadata for Bool;
  *(unsigned char *)(v27 + 280) = 1;
  if (!kCFUserNotificationLocalizationURLKey)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  *(void *)(v27 + 312) = kCFUserNotificationLocalizationURLKey;
  sub_1000076F8(0, &qword_1000222F8);
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  CFStringRef v63 = (id)kCFUserNotificationAlertTopMostKey;
  id v64 = v59;
  id v65 = v60;
  id v66 = v61;
  CFStringRef v67 = (id)kCFUserNotificationLocalizationURLKey;
  id v68 = [v95 bundleForClass:ObjCClassFromMetadata];
  id v69 = [v68 resourceURL];

  if (!v69)
  {
LABEL_30:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v98 + 56))(v97, 1, 1, v99);
LABEL_31:
    __break(1u);
  }
  v70 = v96;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v72 = v97;
  uint64_t v71 = v98;
  v73 = *(void (**)(char *, char *, uint64_t))(v98 + 32);
  v74 = v70;
  uint64_t v75 = v99;
  v73(v97, v74, v99);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v71 + 56))(v72, 0, 1, v75);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v71 + 48))(v72, 1, v75) == 1) {
    goto LABEL_31;
  }
  *(void *)(v27 + 344) = v75;
  v76 = sub_100007590((uint64_t *)(v27 + 320));
  v73((char *)v76, v72, v75);
  sub_100006934(v27);
  v105[0] = 0;
  type metadata accessor for CFString(0);
  sub_10000793C(&qword_100022160, type metadata accessor for CFString);
  CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  CFUserNotificationRef v78 = CFUserNotificationCreate(kCFAllocatorDefault, a5, 3uLL, v105, isa);

  SInt32 v79 = v105[0];
  if (!v78 || v105[0])
  {
    sub_1000075F4();
    swift_allocError();
    *(_DWORD *)uint64_t v89 = v79;
    *(unsigned char *)(v89 + 4) = 0;
    swift_willThrow();
  }
  else
  {
    v80 = (void *)qword_100022190;
    qword_100022190 = (uint64_t)v78;
    CFUserNotificationRef v78 = v78;

    CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v78, (CFUserNotificationCallBack)sub_100006A50, 0);
    if (RunLoopSource)
    {
      v82 = *(void **)(v92 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController__pendingResultRunloopSource);
      *(void *)(v92 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController__pendingResultRunloopSource) = RunLoopSource;
      v83 = RunLoopSource;

      uint64_t v84 = swift_allocObject();
      uint64_t v85 = v94;
      *(void *)(v84 + 16) = v93;
      *(void *)(v84 + 24) = v85;
      v86 = off_100022198;
      off_100022198 = sub_100007680;
      qword_1000221A0 = v84;
      swift_retain();
      sub_100007688((uint64_t)v86);
      v87 = CFRunLoopGetCurrent();
      v88 = v83;
      CFRunLoopAddSource(v87, v88, kCFRunLoopCommonModes);

      return;
    }
    sub_1000075F4();
    swift_allocError();
    *(_DWORD *)uint64_t v90 = 0;
    *(unsigned char *)(v90 + 4) = 1;
    swift_willThrow();
  }
}

unint64_t sub_100006934(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000716C(&qword_100022320);
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
    sub_1000078C4(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_100007204(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_10000792C(&v14, (_OWORD *)(v3[7] + 32 * result));
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

void sub_100006A50(void *a1, uint64_t a2)
{
  id v4 = a1;
  sub_100006AA4(a1, a2);
}

void sub_100006AA4(void *a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v2 = (void (*)(uint64_t, void))off_100022198;
    if (off_100022198)
    {
      uint64_t v3 = (void *)qword_100022190;
      if (qword_100022190)
      {
        uint64_t v5 = a1;
        type metadata accessor for CFUserNotification(0);
        userNotification = v5;
        sub_1000078B4((uint64_t)v2);
        sub_10000793C(&qword_100022318, type metadata accessor for CFUserNotification);
        id v6 = v3;
        LOBYTE(v5) = static _CFObject.== infix(_:_:)();

        if (v5)
        {
          CFDictionaryRef v7 = CFUserNotificationGetResponseDictionary(userNotification);
          if (v7)
          {
            CFDictionaryRef v8 = v7;
            static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
          }
          v2(a2, 0);
          swift_bridgeObjectRelease();
        }
        sub_100007688((uint64_t)v2);
      }
    }
  }
}

uint64_t sub_100006C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  id v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = v13;
  if (!a2)
  {
    long long aBlock = 0u;
    long long v30 = 0u;
    goto LABEL_15;
  }
  uint64_t result = SBSUserNotificationButtonDefinitionResponseIndexKey;
  if (SBSUserNotificationButtonDefinitionResponseIndexKey)
  {
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    if (*(void *)(a2 + 16) && (unint64_t v19 = sub_1000072B8(v17, v18), (v20 & 1) != 0))
    {
      sub_100007858(*(void *)(a2 + 56) + 32 * v19, (uint64_t)&aBlock);
      swift_bridgeObjectRelease();
      if (*((void *)&v30 + 1))
      {
        uint64_t v21 = a3;
        if (swift_dynamicCast())
        {
          if (v28) {
            char v22 = 2;
          }
          else {
            char v22 = 1;
          }
          if (v28 == 1) {
            char v23 = 0;
          }
          else {
            char v23 = v22;
          }
          goto LABEL_17;
        }
LABEL_16:
        char v23 = 2;
LABEL_17:
        sub_1000076F8(0, (unint64_t *)&unk_1000228B0);
        id v24 = (void *)static OS_dispatch_queue.main.getter();
        uint64_t v25 = swift_allocObject();
        *(void *)(v25 + 16) = v21;
        *(void *)(v25 + 24) = a4;
        *(unsigned char *)(v25 + 32) = v23;
        NSString v31 = sub_10000776C;
        uint64_t v32 = v25;
        *(void *)&long long aBlock = _NSConcreteStackBlock;
        *((void *)&aBlock + 1) = 1107296256;
        *(void *)&long long v30 = sub_10000A59C;
        *((void *)&v30 + 1) = &unk_10001D058;
        uint64_t v26 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
        static DispatchQoS.unspecified.getter();
        *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
        sub_10000793C((unint64_t *)&unk_1000228C0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_10000716C(&qword_100022310);
        sub_1000077B4();
        dispatch thunk of SetAlgebra.init<A>(_:)();
        OS_dispatch_queue.async(group:qos:flags:execute:)();
        _Block_release(v26);

        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
        return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v27);
      }
    }
    else
    {
      long long aBlock = 0u;
      long long v30 = 0u;
      swift_bridgeObjectRelease();
    }
LABEL_15:
    uint64_t v21 = a3;
    sub_100007698((uint64_t)&aBlock);
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006FC4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_identifier;
  uint64_t v2 = type metadata accessor for UUID();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_100007074()
{
  return type metadata accessor for AcceptDialogController();
}

uint64_t type metadata accessor for AcceptDialogController()
{
  uint64_t result = qword_1000221D8;
  if (!qword_1000221D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000070C8()
{
  uint64_t result = type metadata accessor for UUID();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10000716C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000071B0()
{
  unint64_t result = qword_1000222E8;
  if (!qword_1000222E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000222E8);
  }
  return result;
}

unint64_t sub_100007204(uint64_t a1)
{
  Hasher.init(_seed:)();
  type metadata accessor for CFString(0);
  sub_10000793C(&qword_100022330, type metadata accessor for CFString);
  _CFObject.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();

  return sub_100007330(a1, v2);
}

unint64_t sub_1000072B8(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10000748C(a1, a2, v4);
}

unint64_t sub_100007330(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    id v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_10000793C(&qword_100022330, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = static _CFObject.== infix(_:_:)();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = static _CFObject.== infix(_:_:)();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_10000748C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
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

uint64_t sub_100007570(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100007984(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t *sub_100007590(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t sub_1000075F4()
{
  unint64_t result = qword_100022300;
  if (!qword_100022300)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022300);
  }
  return result;
}

uint64_t sub_100007648()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007680(uint64_t a1, uint64_t a2)
{
  return sub_100006C2C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

uint64_t sub_100007688(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100007698(uint64_t a1)
{
  uint64_t v2 = sub_10000716C(&qword_100022308);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000076F8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100007734()
{
  swift_release();

  return _swift_deallocObject(v0, 33, 7);
}

uint64_t sub_10000776C()
{
  return (*(uint64_t (**)(void))(v0 + 16))(*(unsigned __int8 *)(v0 + 32));
}

uint64_t sub_10000779C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000077AC()
{
  return swift_release();
}

unint64_t sub_1000077B4()
{
  unint64_t result = qword_1000228D0;
  if (!qword_1000228D0)
  {
    sub_100007810(&qword_100022310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000228D0);
  }
  return result;
}

uint64_t sub_100007810(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007858(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000078B4(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000078C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000716C(&qword_100022328);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000792C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000793C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100007984(char a1, int64_t a2, char a3, void *a4)
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
    sub_10000716C(&qword_100022338);
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
    id v10 = &_swiftEmptyArrayStorage;
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
    sub_10000716C(&qword_100022340);
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

uint64_t sub_100007B14(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for AcceptDialogError(uint64_t result, int *a2)
{
  int v2 = *a2;
  *(unsigned char *)(result + 4) = *((unsigned char *)a2 + 4);
  *(_DWORD *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AcceptDialogError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 5)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AcceptDialogError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(unsigned char *)(result + 4) = 0;
    *(_DWORD *)uint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 5) = v3;
  return result;
}

uint64_t sub_100007BB0(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100007BD0(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)uint64_t result = a2 - 1;
    *(unsigned char *)(result + 4) = 1;
  }
  else
  {
    *(unsigned char *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for AcceptDialogError()
{
  return &type metadata for AcceptDialogError;
}

unint64_t sub_100007C04()
{
  unint64_t result = qword_100022348;
  if (!qword_100022348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022348);
  }
  return result;
}

void sub_100007C58(void *a1)
{
  int v2 = a1;
  char v3 = (void *)v1[4];
  v1[4] = a1;
  id v4 = a1;

  id v5 = [v4 mirroringLayer];
  unint64_t v6 = v5;
  if (v5)
  {
    [v5 setContentsGravity:kCAGravityCenter];
    [v6 setNeedsDisplayOnBoundsChange:0];
  }
  int64_t v7 = (void *)v1[3];
  v1[3] = v6;
  id v8 = v6;

  if (v2)
  {
    id v9 = [v4 HUDLayer];
    int v2 = v9;
    if (v9)
    {
      [v9 setContentsGravity:kCAGravityCenter];
      id v10 = v2;
      [v10 setNeedsDisplayOnBoundsChange:0];
    }
  }

  int64_t v11 = (void *)v1[2];
  v1[2] = v2;
}

uint64_t sub_100007D70()
{
  sub_100007688(*(void *)(v0 + 40));

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for MirroringViewModel()
{
  return self;
}

uint64_t sub_100007DEC@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for MirroringViewModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

id sub_100007EF0()
{
  unint64_t v1 = self;
  [v1 begin];
  [v1 setDisableActions:1];
  id v2 = [v0 layer];
  id v3 = [v2 sublayers];

  if (v3)
  {
    sub_100008198();
    unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)_CocoaArrayWrapper.endIndex.getter();
      uint64_t v5 = (uint64_t)result;
      if (result) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain();
      if (v5)
      {
LABEL_4:
        if (v5 < 1)
        {
          __break(1u);
          return result;
        }
        uint64_t v7 = 0;
        do
        {
          if ((v4 & 0xC000000000000001) != 0) {
            id v8 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v8 = *(id *)(v4 + 8 * v7 + 32);
          }
          id v9 = v8;
          ++v7;
          [v0 bounds];
          [v9 setFrame:];
        }
        while (v5 != v7);
      }
    }
    swift_bridgeObjectRelease_n();
  }

  return [v1 commit];
}

id sub_100008140()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LayerResizableUIView();
  return [super dealloc];
}

uint64_t type metadata accessor for LayerResizableUIView()
{
  return self;
}

unint64_t sub_100008198()
{
  unint64_t result = qword_1000224B0;
  if (!qword_1000224B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000224B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for CALayerView()
{
  return &type metadata for CALayerView;
}

void *sub_1000081E8()
{
  return &protocol witness table for Never;
}

void sub_1000081F4(void *a1, uint64_t a2, void *a3)
{
  id v5 = [a1 layer];
  id v6 = [v5 sublayers];

  if (!v6) {
    return;
  }
  sub_100008198();
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v8 = a3;
  char v9 = sub_100008404((uint64_t)v8, v7);
  swift_bridgeObjectRelease();

  if (v9) {
    return;
  }
  id v10 = [a1 layer];
  id v11 = [v10 sublayers];

  if (v11)
  {
    unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    if (v12 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
      if (v13) {
        goto LABEL_7;
      }
    }
    else
    {
      uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v13)
      {
LABEL_7:
        if (v13 < 1)
        {
          __break(1u);
          return;
        }
        for (uint64_t i = 0; i != v13; ++i)
        {
          if ((v12 & 0xC000000000000001) != 0) {
            id v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else {
            id v15 = *(id *)(v12 + 8 * i + 32);
          }
          NSString v16 = v15;
          [v15 removeFromSuperlayer];
        }
      }
    }
    swift_bridgeObjectRelease_n();
  }
  id v17 = [a1 layer];
  [v17 addSublayer:v8];
}

uint64_t sub_100008404(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      id v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_5:
      id v6 = v5;
      sub_100008198();
      char v7 = static NSObject.== infix(_:_:)();

      if (v7)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1) {
        goto LABEL_18;
      }
      if (v4) {
        break;
      }
      unint64_t v4 = 5;
      while (1)
      {
        unint64_t v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1)) {
          break;
        }
        id v13 = *(id *)(a2 + 8 * v4);
        char v14 = static NSObject.== infix(_:_:)();

        if (v14) {
          goto LABEL_6;
        }
        ++v4;
        if (v12 == v3) {
          goto LABEL_18;
        }
      }
      __break(1u);
    }
    uint64_t v9 = 1;
    while (1)
    {
      specialized _ArrayBuffer._getElementSlowPath(_:)();
      uint64_t v10 = v9 + 1;
      if (__OFADD__(v9, 1)) {
        break;
      }
      char v11 = static NSObject.== infix(_:_:)();
      swift_unknownObjectRelease();
      if (v11) {
        goto LABEL_6;
      }
      ++v9;
      if (v10 == v3) {
        goto LABEL_18;
      }
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

id sub_10000857C()
{
  uint64_t v1 = *v0;
  id v2 = [objc_allocWithZone((Class)type metadata accessor for LayerResizableUIView()) initWithFrame:0.0, 0.0, 0.0, 0.0];
  id v3 = [v2 layer];
  [v3 addSublayer:v1];

  return v2;
}

void sub_1000085FC(void *a1, uint64_t a2)
{
  sub_1000081F4(a1, a2, *v2);
}

uint64_t sub_100008614()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_100008658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000087BC();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000086BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_1000087BC();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100008720()
{
  return static View._viewListCount(inputs:)();
}

void sub_10000873C()
{
}

unint64_t sub_100008768()
{
  unint64_t result = qword_1000224B8;
  if (!qword_1000224B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000224B8);
  }
  return result;
}

unint64_t sub_1000087BC()
{
  unint64_t result = qword_1000224C0;
  if (!qword_1000224C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000224C0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for MirroringView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for MirroringView()
{
  return swift_release();
}

void *assignWithCopy for MirroringView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for MirroringView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void *assignWithTake for MirroringView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for MirroringView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MirroringView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MirroringView()
{
  return &type metadata for MirroringView;
}

uint64_t sub_100008960()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000897C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_10000716C(&qword_1000224E0);
  ((void (*)(void))__chkstk_darwin)();
  char v7 = (char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000716C(&qword_1000224E8);
  uint64_t v9 = *(void *)(v8 - 8);
  ((void (*)(void))__chkstk_darwin)();
  char v11 = (char *)&v64 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10000716C(&qword_1000224F0);
  ((void (*)(void))__chkstk_darwin)();
  char v14 = (char *)&v64 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000716C(&qword_1000224F8);
  uint64_t v15 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v21 = *(void **)(a2 + 24);
  if (v21)
  {
    uint64_t v67 = v20;
    uint64_t v68 = v17;
    uint64_t v71 = (uint64_t)&v64 - v18;
    uint64_t v72 = v19;
    uint64_t v73 = a3;
    id v22 = v21;
    uint64_t v66 = v12;
    id v23 = v22;
    uint64_t v24 = static SafeAreaRegions.all.getter();
    char v25 = static Edge.Set.all.getter();
    uint64_t v65 = v8;
    uint64_t v26 = a1;
    char v27 = v25;
    uint64_t v28 = static Alignment.center.getter();
    id v70 = v23;
    sub_100009184(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v87, 0.0, 1, INFINITY, 0, v28, v29, v23, v24, v27);
    long long v30 = *(void **)(a2 + 16);
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v26;
    *(void *)(v31 + 24) = a2;
    id v69 = v30;
    swift_retain();
    sub_10000716C(&qword_100022508);
    sub_1000097B0();
    Button.init(action:label:)();
    uint64_t v32 = v65;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v14, v11, v65);
    uint64_t v33 = &v14[*(int *)(v66 + 36)];
    *(void *)uint64_t v33 = 0;
    *((void *)v33 + 1) = 0;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v32);
    unsigned __int8 v34 = static Edge.Set.top.getter();
    unsigned __int8 v35 = static Edge.Set.leading.getter();
    char v36 = Edge.Set.init(rawValue:)();
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v34) {
      char v36 = Edge.Set.init(rawValue:)();
    }
    Edge.Set.init(rawValue:)();
    if (Edge.Set.init(rawValue:)() != v35) {
      char v36 = Edge.Set.init(rawValue:)();
    }
    EdgeInsets.init(_all:)();
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    uint64_t v44 = v43;
    uint64_t v45 = v67;
    sub_1000098F0((uint64_t)v14, v67, &qword_1000224F0);
    uint64_t v46 = v45 + *(int *)(v68 + 36);
    *(unsigned char *)uint64_t v46 = v36;
    *(void *)(v46 + 8) = v38;
    *(void *)(v46 + 16) = v40;
    *(void *)(v46 + 24) = v42;
    *(void *)(v46 + 32) = v44;
    *(unsigned char *)(v46 + 40) = 0;
    sub_100009A10((uint64_t)v14, &qword_1000224F0);
    uint64_t v47 = v45;
    uint64_t v48 = v71;
    sub_1000099AC(v47, v71, &qword_1000224F8);
    long long v80 = v87[6];
    long long v81 = v87[7];
    uint64_t v82 = v88;
    long long v76 = v87[2];
    long long v77 = v87[3];
    long long v78 = v87[4];
    long long v79 = v87[5];
    long long v74 = v87[0];
    long long v75 = v87[1];
    uint64_t v49 = v72;
    sub_1000098F0(v48, v72, &qword_1000224F8);
    long long v50 = v81;
    v83[6] = v80;
    v83[7] = v81;
    long long v51 = v76;
    long long v52 = v77;
    v83[2] = v76;
    v83[3] = v77;
    long long v54 = v78;
    long long v53 = v79;
    v83[4] = v78;
    v83[5] = v79;
    long long v56 = v74;
    long long v55 = v75;
    v83[0] = v74;
    v83[1] = v75;
    *((_OWORD *)v7 + 6) = v80;
    *((_OWORD *)v7 + 7) = v50;
    *((_OWORD *)v7 + 2) = v51;
    *((_OWORD *)v7 + 3) = v52;
    *((_OWORD *)v7 + 4) = v54;
    *((_OWORD *)v7 + 5) = v53;
    uint64_t v57 = v82;
    uint64_t v84 = v82;
    *(_OWORD *)char v7 = v56;
    *((_OWORD *)v7 + 1) = v55;
    *((void *)v7 + 16) = v57;
    *((void *)v7 + 17) = v30;
    uint64_t v58 = sub_10000716C(&qword_100022548);
    sub_1000098F0(v49, (uint64_t)&v7[*(int *)(v58 + 64)], &qword_1000224F8);
    sub_100009954((id *)v83);
    id v59 = v69;
    sub_100009954((id *)v87);

    sub_100009A10(v48, &qword_1000224F8);
    sub_100009980((id *)v87);
    sub_100009A10(v49, &qword_1000224F8);

    v85[6] = v80;
    v85[7] = v81;
    uint64_t v86 = v82;
    v85[2] = v76;
    v85[3] = v77;
    v85[4] = v78;
    v85[5] = v79;
    v85[0] = v74;
    v85[1] = v75;
    sub_100009980((id *)v85);
    uint64_t v60 = sub_10000716C(&qword_100022500);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v7, 0, 1, v60);
    return sub_1000099AC((uint64_t)v7, v73, &qword_1000224E0);
  }
  else
  {
    uint64_t v62 = sub_10000716C(&qword_100022500);
    CFStringRef v63 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v62 - 8) + 56);
    return v63(a3, 1, 1, v62);
  }
}

__n128 sub_100008FC4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    id v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  sub_1000098F0(v13, a9, &qword_1000224C8);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_10000716C(&qword_1000224D8) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

id sub_100009184@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, char a18)
{
  char v19 = a18;
  uint64_t v20 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    __n128 v29 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    char v19 = a18;
    uint64_t v20 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(_OWORD *)(a9 + 72) = v34;
  *(_OWORD *)(a9 + 88) = v35;
  *(_OWORD *)(a9 + 104) = v36;
  *(_OWORD *)(a9 + 120) = v37;
  *(_OWORD *)(a9 + 24) = v31;
  *(_OWORD *)(a9 + 40) = v32;
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v20;
  *(unsigned char *)(a9 + 16) = v19;
  *(_OWORD *)(a9 + 56) = v33;

  return a16;
}

void sub_100009360(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void (**)(uint64_t))(a2 + 40);
  if (v2)
  {
    uint64_t v3 = swift_retain();
    v2(v3);
    sub_100007688((uint64_t)v2);
  }
}

uint64_t sub_1000093BC@<X0>(uint64_t *a1@<X8>)
{
  sub_10000716C(&qword_100022550);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Font.TextStyle();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  char v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000716C(&qword_100022558);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  Image.init(systemName:)();
  static SymbolRenderingMode.hierarchical.getter();
  uint64_t v10 = type metadata accessor for SymbolRenderingMode();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 0, 1, v10);
  uint64_t v11 = Image.symbolRenderingMode(_:)();
  swift_release();
  sub_100009A10((uint64_t)v9, &qword_100022558);
  uint64_t v12 = static Color.white.getter();
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Font.TextStyle.largeTitle(_:), v4);
  uint64_t v13 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v3, 1, 1, v13);
  uint64_t v14 = static Font.system(_:design:weight:)();
  sub_100009A10((uint64_t)v3, &qword_100022550);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t result = swift_getKeyPath();
  *a1 = v11;
  a1[1] = v12;
  a1[2] = result;
  a1[3] = v14;
  return result;
}

uint64_t sub_100009664@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10000716C(&qword_1000224C8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (uint64_t *)((char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *v1;
  uint64_t v6 = v1[1];
  *uint64_t v5 = static Alignment.center.getter();
  v5[1] = v8;
  uint64_t v9 = sub_10000716C(&qword_1000224D0);
  sub_10000897C(v7, v6, (uint64_t)v5 + *(int *)(v9 + 44));
  static Alignment.center.getter();
  sub_100008FC4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a1, 0.0, 1, INFINITY, 0);
  return sub_100009A10((uint64_t)v5, &qword_1000224C8);
}

uint64_t sub_100009770()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000097A8()
{
  sub_100009360(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

unint64_t sub_1000097B0()
{
  unint64_t result = qword_100022510;
  if (!qword_100022510)
  {
    sub_100007810(&qword_100022508);
    sub_100009850();
    sub_100009B68(&qword_100022538, &qword_100022540);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022510);
  }
  return result;
}

unint64_t sub_100009850()
{
  unint64_t result = qword_100022518;
  if (!qword_100022518)
  {
    sub_100007810(&qword_100022520);
    sub_100009B68(&qword_100022528, &qword_100022530);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022518);
  }
  return result;
}

uint64_t sub_1000098F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000716C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

id *sub_100009954(id *a1)
{
  id v2 = *a1;
  return a1;
}

id *sub_100009980(id *a1)
{
  return a1;
}

uint64_t sub_1000099AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000716C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009A10(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000716C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009A6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100009A98()
{
  return EnvironmentValues.font.setter();
}

unint64_t sub_100009AC8()
{
  unint64_t result = qword_100022560;
  if (!qword_100022560)
  {
    sub_100007810(&qword_1000224D8);
    sub_100009B68(&qword_100022568, &qword_1000224C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022560);
  }
  return result;
}

uint64_t sub_100009B68(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100007810(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for RootView()
{
  return &type metadata for RootView;
}

uint64_t sub_100009BC0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100009BDC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v3 = sub_10000716C(&qword_100022570);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10000716C(&qword_100022578);
  __chkstk_darwin(v21);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static Alignment.center.getter();
  uint64_t v11 = v10;
  sub_100009E00(a1, &v23);
  uint64_t v12 = v23;
  uint64_t v13 = v24;
  uint64_t v14 = v25;
  uint64_t v15 = v26;
  uint64_t v23 = v9;
  uint64_t v24 = v11;
  uint64_t v25 = v12;
  uint64_t v26 = v13;
  uint64_t v27 = v14;
  uint64_t v28 = v15;
  sub_10000716C(&qword_100022580);
  sub_100009B68(&qword_100022588, &qword_100022580);
  View.statusBar(hidden:)();
  swift_release();
  swift_release();
  if (*(void *)(a1 + 24)) {
    uint64_t v16 = static Color.clear.getter();
  }
  else {
    uint64_t v16 = static Color.black.getter();
  }
  uint64_t v17 = v16;
  char v18 = static Edge.Set.all.getter();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v8, v6, v3);
  char v19 = &v8[*(int *)(v21 + 36)];
  *(void *)char v19 = v17;
  v19[8] = v18;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_100009F14((uint64_t)v8, v22);
}

uint64_t sub_100009E00@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  type metadata accessor for MirroringViewModel();
  sub_100009F7C(&qword_100022590, (void (*)(uint64_t))type metadata accessor for MirroringViewModel);
  swift_retain();
  uint64_t v4 = ObservedObject.init(wrappedValue:)();
  uint64_t v6 = v5;
  if (*(void *)(a1 + 24))
  {
    type metadata accessor for PINViewModel();
    sub_100009F7C(&qword_100022598, (void (*)(uint64_t))type metadata accessor for PINViewModel);
    swift_retain();
    uint64_t result = ObservedObject.init(wrappedValue:)();
  }
  else
  {
    uint64_t result = 0;
    uint64_t v8 = 0;
  }
  *a2 = v4;
  a2[1] = v6;
  a2[2] = result;
  a2[3] = v8;
  return result;
}

uint64_t sub_100009F0C@<X0>(uint64_t a1@<X8>)
{
  return sub_100009BDC(*(void *)(v1 + 8), a1);
}

uint64_t sub_100009F14(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000716C(&qword_100022578);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009F7C(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100009FC8()
{
  unint64_t result = qword_1000225A0;
  if (!qword_1000225A0)
  {
    sub_100007810(&qword_100022578);
    sub_100007810(&qword_100022580);
    sub_100009B68(&qword_100022588, &qword_100022580);
    swift_getOpaqueTypeConformance2();
    sub_100009B68(&qword_1000225A8, (uint64_t *)&unk_1000225B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000225A0);
  }
  return result;
}

id sub_10000A294()
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

uint64_t sub_10000A378()
{
  if (qword_100022020 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_100007B14(v0, (uint64_t)qword_100023860);
  swift_bridgeObjectRetain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000716C((uint64_t *)&unk_100022650);
    uint64_t v4 = String.init<A>(describing:)();
    sub_100014B64(v4, v5, &v7);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "didFinishLaunching: options=%s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 1;
}

unint64_t sub_10000A544()
{
  unint64_t result = qword_100022180;
  if (!qword_100022180)
  {
    type metadata accessor for LaunchOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100022180);
  }
  return result;
}

uint64_t sub_10000A59C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10000A5E0(uint64_t a1)
{
  [*(id *)(a1 + 32) stop];
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    sub_100011E8C(0x6D73694472657375, 0xED00006465737369);
  }
}

uint64_t sub_10000A664()
{
  v0[2] = type metadata accessor for MainActor();
  v0[3] = static MainActor.shared.getter();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[4] = v1;
  void *v1 = v0;
  v1[1] = sub_10000A710;
  return sub_10000E610();
}

uint64_t sub_10000A710()
{
  swift_task_dealloc();
  uint64_t v1 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000A84C, v1, v0);
}

uint64_t sub_10000A84C()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000A8AC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100009A10(a1, &qword_1000228E0);
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

id sub_10000AC44()
{
  uint64_t v1 = v0;
  uint64_t state64 = 0;
  if (qword_100022040 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007B14(v2, (uint64_t)qword_1000238C0);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    unint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Received device locked notification", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t v6 = (int *)(v0 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__deviceLockedNotificationToken);
  swift_beginAccess();
  notify_get_state(*v6, &state64);
  uint64_t v7 = state64;
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  if (v7 == 1)
  {
    if (!v10) {
      goto LABEL_11;
    }
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    os_log_type_t v12 = v9;
    uint64_t v13 = "Received device locked notification, device is now locked. Forcing permission dialog";
  }
  else
  {
    if (!v10) {
      goto LABEL_11;
    }
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v11 = 0;
    os_log_type_t v12 = v9;
    uint64_t v13 = "Received device locked notification, device is now unlocked. Disabling force permission";
  }
  _os_log_impl((void *)&_mh_execute_header, v8, v12, v13, v11, 2u);
  swift_slowDealloc();
LABEL_11:

  id result = *(id *)(v1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager);
  if (result) {
    return [result setForcePermissionDialog:v7 == 1];
  }
  return result;
}

id sub_10000AE58()
{
  uint64_t v1 = v0;
  BSDispatchQueueAssertMain();
  uint64_t v2 = getpid();
  id v3 = [self targetWithPid:v2];
  sub_10000716C(&qword_100022910);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100016B30;
  NSString v5 = String._bridgeToObjectiveC()();
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [self attributeWithDomain:v5 name:v6];

  *(void *)(v4 + 32) = v7;
  specialized Array._endMutation()();
  id v8 = objc_allocWithZone((Class)RBSAssertion);
  NSString v9 = String._bridgeToObjectiveC()();
  sub_1000076F8(0, &qword_100022918);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v11 = [v8 initWithExplanation:v9 target:v3 attributes:isa];

  id v35 = 0;
  if (![v11 acquireWithError:&v35])
  {
    id v25 = v35;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    if (qword_100022020 != -1) {
      swift_once();
    }
    uint64_t v26 = type metadata accessor for Logger();
    sub_100007B14(v26, (uint64_t)qword_100023860);
    swift_errorRetain();
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v27, v28))
    {
      __n128 v29 = (uint8_t *)swift_slowAlloc();
      id v35 = (id)swift_slowAlloc();
      *(_DWORD *)__n128 v29 = 136315138;
      swift_getErrorValue();
      uint64_t v30 = Error.localizedDescription.getter();
      sub_100014B64(v30, v31, (uint64_t *)&v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "FATAL: Unable to acquire domain assertion for airplay receiver: %s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    exit(-1);
  }
  uint64_t v12 = qword_100022040;
  id v13 = v35;
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_100007B14(v14, (uint64_t)qword_1000238C0);
  id v15 = v11;
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    char v18 = (uint8_t *)swift_slowAlloc();
    id v35 = (id)swift_slowAlloc();
    uint64_t v33 = v1;
    *(_DWORD *)char v18 = 136315138;
    long long v32 = v18 + 4;
    id v19 = v15;
    id v20 = [v19 description];
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v23 = v22;

    uint64_t v34 = sub_100014B64(v21, v23, (uint64_t *)&v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Acquired background runtime assertion: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  [v15 addObserver:v1, v32, v33, v34];
  return v15;
}

void sub_10000B3B4(uint64_t a1, unint64_t a2)
{
  id v3 = *(void **)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion);
  if (v3)
  {
    *(void *)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion) = 0;
    id v6 = v3;
    [v6 removeObserver:v2];
    p_imp = &stru_100020FF0.imp;
    [v6 invalidate];

    if (qword_100022040 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100007B14(v8, (uint64_t)qword_1000238C0);
    id v9 = v6;
    swift_bridgeObjectRetain_n();
    id v10 = v9;
    id v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v20 = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315394;
      uint64_t v19 = v13 + 4;
      id v14 = v10;
      id v15 = [v14 description];
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v18 = v17;

      sub_100014B64(v16, v18, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_100014B64(a1, a2, &v20);
      p_imp = (IMP *)(&stru_100020FF0 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Invalidating background runtime assertion: %s, reason: %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    [v10 p_imp[320]:v19];
  }
}

void sub_10000B650(uint64_t a1)
{
  uint64_t v3 = sub_10000716C(&qword_1000228E0);
  __chkstk_darwin(v3 - 8);
  uint64_t v94 = (char *)&v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v106 - 8);
  uint64_t v6 = __chkstk_darwin(v106);
  uint64_t v103 = (char *)&v94 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v9 = (char *)&v94 - v8;
  id v10 = sub_10000AE58();
  id v11 = *(void **)&v1[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion];
  *(void *)&v1[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion] = v10;
  id v12 = v10;
  if (v11) {
    [v11 removeObserver:v1];
  }
  [v11 invalidate];

  unint64_t v95 = a1 & 0xC000000000000001;
  uint64_t v98 = v1;
  v96 = (void **)a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_1000076F8(0, &qword_1000228E8);
    sub_100012FE4();
    Set.Iterator.init(_cocoa:)();
    a1 = v116;
    uint64_t v102 = v117;
    uint64_t v13 = v118;
    id v14 = v119;
    unint64_t v15 = v120;
  }
  else
  {
    uint64_t v16 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 56);
    uint64_t v102 = a1 + 56;
    uint64_t v13 = ~v16;
    uint64_t v18 = -v16;
    if (v18 < 64) {
      uint64_t v19 = ~(-1 << v18);
    }
    else {
      uint64_t v19 = -1;
    }
    unint64_t v15 = v19 & v17;
    swift_bridgeObjectRetain();
    id v14 = 0;
  }
  char v20 = 0;
  id v100 = (id)(a1 & 0x7FFFFFFFFFFFFFFFLL);
  uint64_t v97 = v13;
  id v101 = (char *)((unint64_t)(v13 + 64) >> 6);
  v105 = (void (**)(char *, uint64_t))(v5 + 8);
  unint64_t v104 = 0x8000000100017470;
  uint64_t v99 = (char *)&type metadata for Swift.AnyObject + 8;
  while ((a1 & 0x8000000000000000) == 0)
  {
    if (v15)
    {
      uint64_t v22 = (v15 - 1) & v15;
      unint64_t v23 = __clz(__rbit64(v15)) | ((void)v14 << 6);
      uint64_t v24 = v14;
    }
    else
    {
      uint64_t v27 = (uint64_t)(v14 + 1);
      if (__OFADD__(v14, 1))
      {
        __break(1u);
LABEL_83:
        __break(1u);
        goto LABEL_84;
      }
      if (v27 >= (uint64_t)v101) {
        goto LABEL_36;
      }
      unint64_t v28 = *(void *)(v102 + 8 * v27);
      uint64_t v24 = v14 + 1;
      if (!v28)
      {
        uint64_t v24 = v14 + 2;
        if ((uint64_t)(v14 + 2) >= (uint64_t)v101) {
          goto LABEL_36;
        }
        unint64_t v28 = *(void *)(v102 + 8 * (void)v24);
        if (!v28)
        {
          uint64_t v24 = v14 + 3;
          if ((uint64_t)(v14 + 3) >= (uint64_t)v101) {
            goto LABEL_36;
          }
          unint64_t v28 = *(void *)(v102 + 8 * (void)v24);
          if (!v28)
          {
            uint64_t v24 = v14 + 4;
            if ((uint64_t)(v14 + 4) >= (uint64_t)v101) {
              goto LABEL_36;
            }
            unint64_t v28 = *(void *)(v102 + 8 * (void)v24);
            if (!v28)
            {
              __n128 v29 = v14 + 5;
              do
              {
                if (v101 == v29) {
                  goto LABEL_36;
                }
                unint64_t v28 = *(void *)(v102 + 8 * (void)v29++);
              }
              while (!v28);
              uint64_t v24 = v29 - 1;
            }
          }
        }
      }
      uint64_t v22 = (v28 - 1) & v28;
      unint64_t v23 = __clz(__rbit64(v28)) + ((void)v24 << 6);
    }
    uint64_t v26 = (void **)*(id *)(*(void *)(a1 + 48) + 8 * v23);
    if (!v26) {
      goto LABEL_36;
    }
LABEL_33:
    id v30 = [v26 URL];
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v31 = URL.absoluteString.getter();
    uint64_t v33 = v32;
    (*v105)(v9, v106);
    if (v31 == 0xD00000000000001FLL && v33 == v104)
    {
      swift_bridgeObjectRelease();

      char v20 = 1;
    }
    else
    {
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();

      v20 |= v21;
    }
    id v14 = v24;
    unint64_t v15 = v22;
  }
  uint64_t v25 = __CocoaSet.Iterator.next()();
  if (v25)
  {
    uint64_t v115 = v25;
    sub_1000076F8(0, &qword_1000228E8);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    uint64_t v26 = aBlock;
    swift_unknownObjectRelease();
    uint64_t v24 = v14;
    uint64_t v22 = v15;
    if (v26) {
      goto LABEL_33;
    }
  }
LABEL_36:
  sub_10001304C();
  NSString v34 = String._bridgeToObjectiveC()();
  id v35 = (char *)[self defaultCenter];
  long long v36 = v98;
  uint64_t v37 = (uint64_t)&v98[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__notificationToken];
  swift_beginAccess();
  sub_1000098F0(v37, (uint64_t)&aBlock, &qword_100022308);
  uint64_t v38 = ObjectType;
  sub_100009A10((uint64_t)&aBlock, &qword_100022308);
  if (!v38) {
    goto LABEL_39;
  }
  sub_1000098F0(v37, (uint64_t)&aBlock, &qword_100022308);
  uint64_t v39 = ObjectType;
  if (!ObjectType)
  {
LABEL_84:
    __break(1u);
    return;
  }
  uint64_t v40 = sub_1000132C8(&aBlock, (uint64_t)ObjectType);
  uint64_t v41 = *(v39 - 1);
  __chkstk_darwin(v40);
  uint64_t v43 = (char *)&v94 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v41 + 16))(v43);
  uint64_t v44 = _bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, void *))(v41 + 8))(v43, v39);
  sub_10001330C((uint64_t)&aBlock);
  [v35 removeObserver:v44];
  swift_unknownObjectRelease();
  long long v36 = v98;
LABEL_39:
  uint64_t v45 = *(void **)&v36[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager];
  uint64_t v46 = self;
  id v47 = v45;
  id v48 = v34;
  id v49 = [v46 mainQueue];
  uint64_t v50 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v113 = sub_100013054;
  uint64_t v114 = v50;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v110 = 1107296256;
  v111 = sub_10000C598;
  ObjectType = &unk_10001D5D0;
  long long v51 = _Block_copy(&aBlock);
  swift_release();
  long long v52 = (void **)[v35 addObserverForName:v48 object:v47 queue:v49 usingBlock:v51];
  _Block_release(v51);
  id v100 = v48;

  ObjectType = (void *)swift_getObjectType();
  long long aBlock = v52;
  swift_beginAccess();
  sub_10001305C((uint64_t)&aBlock, v37, &qword_100022308);
  swift_endAccess();
  long long v53 = (const char *)kSBSLockStateNotifyKey;
  sub_1000076F8(0, (unint64_t *)&unk_1000228B0);
  long long v54 = static OS_dispatch_queue.main.getter();
  uint64_t v55 = swift_allocObject();
  *(void *)(v55 + 16) = v36;
  v113 = sub_1000130F8;
  uint64_t v114 = v55;
  long long aBlock = _NSConcreteStackBlock;
  uint64_t v110 = 1107296256;
  v111 = sub_10000C68C;
  ObjectType = &unk_10001D620;
  long long v56 = _Block_copy(&aBlock);
  uint64_t v57 = v36;
  swift_release();
  uint64_t v58 = (int *)&v57[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__deviceLockedNotificationToken];
  swift_beginAccess();
  notify_register_dispatch(v53, v58, v54, v56);
  swift_endAccess();
  _Block_release(v56);

  id v59 = v96;
  if (v20)
  {
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (!Strong) {
      goto LABEL_43;
    }
    v61 = Strong;
    if ([Strong activationState])
    {
      id v62 = [v61 activationState];

      if (v62 != (id)1) {
LABEL_43:
      }
        sub_10000CEF8(0x4C52556D6F7266, 0xE700000000000000);
    }
    else
    {
    }
  }
  if (![self isGuestUserHandoverEnabled]) {
    goto LABEL_81;
  }
  uint64_t v98 = v57;
  uint64_t v99 = v35;
  if (v95)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_1000076F8(0, &qword_1000228E8);
    sub_100012FE4();
    Set.Iterator.init(_cocoa:)();
    id v59 = aBlock;
    unint64_t v104 = v110;
    uint64_t v63 = (uint64_t)v111;
    uint64_t v64 = (char *)ObjectType;
    unint64_t v65 = (unint64_t)v113;
  }
  else
  {
    uint64_t v66 = -1 << *((unsigned char *)v59 + 32);
    unint64_t v67 = (unint64_t)v59[7];
    unint64_t v104 = (unint64_t)(v59 + 7);
    uint64_t v63 = ~v66;
    uint64_t v68 = -v66;
    if (v68 < 64) {
      uint64_t v69 = ~(-1 << v68);
    }
    else {
      uint64_t v69 = -1;
    }
    unint64_t v65 = v69 & v67;
    swift_bridgeObjectRetain();
    uint64_t v64 = 0;
  }
  char v70 = 0;
  uint64_t v102 = (unint64_t)v59 & 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v97 = v63;
  int64_t v71 = (unint64_t)(v63 + 64) >> 6;
  id v101 = (char *)&type metadata for Swift.AnyObject + 8;
  uint64_t v72 = v59;
  while (2)
  {
    if (((unint64_t)v59 & 0x8000000000000000) != 0)
    {
      uint64_t v77 = __CocoaSet.Iterator.next()();
      if (!v77) {
        goto LABEL_79;
      }
      uint64_t v107 = v77;
      sub_1000076F8(0, &qword_1000228E8);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      id v78 = v108;
      swift_unknownObjectRelease();
      long long v76 = v64;
      uint64_t v74 = v65;
      if (!v78) {
        goto LABEL_79;
      }
      goto LABEL_76;
    }
    if (v65)
    {
      uint64_t v74 = (v65 - 1) & v65;
      unint64_t v75 = __clz(__rbit64(v65)) | ((void)v64 << 6);
      long long v76 = v64;
LABEL_75:
      id v78 = *((id *)v59[6] + v75);
      if (!v78) {
        goto LABEL_79;
      }
LABEL_76:
      id v82 = [v78 URL];
      v83 = v103;
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v84 = URL.absoluteString.getter();
      uint64_t v86 = v85;
      (*v105)(v83, v106);
      if (v84 == static AirPlayReceiverCoordinator.requestViewMirroringLaunchURLString.getter() && v86 == v87)
      {
        swift_bridgeObjectRelease_n();

        char v70 = 1;
      }
      else
      {
        char v73 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        v70 |= v73;
      }
      uint64_t v64 = v76;
      unint64_t v65 = v74;
      id v59 = v72;
      continue;
    }
    break;
  }
  int64_t v79 = (int64_t)(v64 + 1);
  if (__OFADD__(v64, 1)) {
    goto LABEL_83;
  }
  if (v79 >= v71) {
    goto LABEL_79;
  }
  unint64_t v80 = *(void *)(v104 + 8 * v79);
  long long v76 = v64 + 1;
  if (v80) {
    goto LABEL_74;
  }
  long long v76 = v64 + 2;
  if ((uint64_t)(v64 + 2) >= v71) {
    goto LABEL_79;
  }
  unint64_t v80 = *(void *)(v104 + 8 * (void)v76);
  if (v80) {
    goto LABEL_74;
  }
  long long v76 = v64 + 3;
  if ((uint64_t)(v64 + 3) >= v71) {
    goto LABEL_79;
  }
  unint64_t v80 = *(void *)(v104 + 8 * (void)v76);
  if (v80) {
    goto LABEL_74;
  }
  long long v76 = v64 + 4;
  if ((uint64_t)(v64 + 4) >= v71) {
    goto LABEL_79;
  }
  unint64_t v80 = *(void *)(v104 + 8 * (void)v76);
  if (v80)
  {
LABEL_74:
    uint64_t v74 = (v80 - 1) & v80;
    unint64_t v75 = __clz(__rbit64(v80)) + ((void)v76 << 6);
    goto LABEL_75;
  }
  long long v81 = v64 + 5;
  while ((char *)v71 != v81)
  {
    unint64_t v80 = *(void *)(v104 + 8 * (void)v81++);
    if (v80)
    {
      long long v76 = v81 - 1;
      id v59 = v72;
      goto LABEL_74;
    }
  }
LABEL_79:
  sub_10001304C();
  id v35 = v99;
  uint64_t v88 = v98;
  if (v70)
  {
    uint64_t v89 = type metadata accessor for TaskPriority();
    uint64_t v90 = (uint64_t)v94;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v89 - 8) + 56))(v94, 1, 1, v89);
    type metadata accessor for MainActor();
    uint64_t v91 = v88;
    uint64_t v92 = static MainActor.shared.getter();
    uint64_t v93 = (void *)swift_allocObject();
    v93[2] = v92;
    v93[3] = &protocol witness table for MainActor;
    v93[4] = v91;
    sub_10000CD70(v90, (uint64_t)&unk_100022908, (uint64_t)v93);
    swift_release();
  }
LABEL_81:
  sub_10000AC44();
}

void sub_10000C45C()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    if (qword_100022040 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100007B14(v2, (uint64_t)qword_1000238C0);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      uint64_t v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "Received APRKAlternateBonjourBrowsingDisabled notification, stopping receiver server", v5, 2u);
      swift_slowDealloc();
    }

    uint64_t v6 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager;
    uint64_t v7 = *(void **)&v1[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager];
    if (v7)
    {
      [v7 setDelegate:0];
      uint64_t v7 = *(void **)&v1[v6];
    }
    [v7 stopReceiverServer];
  }
}

uint64_t sub_10000C598(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Notification();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10000C68C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_10000C6E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  uint64_t v5 = type metadata accessor for GuestUserHandoverService();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  sub_10000716C(&qword_1000228D8);
  v4[9] = swift_task_alloc();
  v4[10] = type metadata accessor for MainActor();
  v4[11] = static MainActor.shared.getter();
  uint64_t v6 = (void *)swift_task_alloc();
  v4[12] = v6;
  *uint64_t v6 = v4;
  v6[1] = sub_10000C81C;
  return sub_10000E610();
}

uint64_t sub_10000C81C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  *(void *)(v1 + 104) = v3;
  *(void *)(v1 + 112) = v2;
  return _swift_task_switch(sub_10000C960, v3, v2);
}

uint64_t sub_10000C960()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v4 = v0[5] + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate_guestUserHandoverService;
  swift_beginAccess();
  sub_1000098F0(v4, v1, &qword_1000228D8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2))
  {
    uint64_t v5 = v0[9];
    swift_release();
    sub_100009A10(v5, &qword_1000228D8);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v6 = (uint64_t (*)(void))v0[1];
    return v6();
  }
  else
  {
    uint64_t v8 = v0[9];
    (*(void (**)(void, uint64_t, void))(v0[7] + 16))(v0[8], v8, v0[6]);
    sub_100009A10(v8, &qword_1000228D8);
    id v9 = (void *)swift_task_alloc();
    v0[15] = v9;
    *id v9 = v0;
    v9[1] = sub_10000CAEC;
    return GuestUserHandoverService.requestViewMirroring()();
  }
}

uint64_t sub_10000CAEC()
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void *)(*v1 + 64);
  uint64_t v4 = *(void *)(*v1 + 56);
  uint64_t v5 = *(void *)(*v1 + 48);
  *(void *)(*v1 + 128) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v6 = *(void *)(v2 + 112);
  uint64_t v7 = *(void *)(v2 + 104);
  if (v0) {
    uint64_t v8 = sub_10000CCF8;
  }
  else {
    uint64_t v8 = sub_10000CC84;
  }
  return _swift_task_switch(v8, v7, v6);
}

uint64_t sub_10000CC84()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000CCF8()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000CD70(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_100009A10(a1, &qword_1000228E0);
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

id sub_10000CEF8(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  BSDispatchQueueAssertMain();
  uint64_t v6 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager;
  uint64_t v7 = *(void **)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager);
  if (v7 && [v7 delegate])
  {
    return (id)swift_unknownObjectRelease();
  }
  else
  {
    if (qword_100022048 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_100007B14(v9, (uint64_t)qword_1000238D8);
    swift_bridgeObjectRetain_n();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)id v12 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_100014B64(a1, a2, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Start receiver server for reason: %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      id result = *(id *)(v3 + v6);
      if (!result) {
        return result;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      id result = *(id *)(v3 + v6);
      if (!result) {
        return result;
      }
    }
    [result setDelegate:v3 v13, v14];
    id result = *(id *)(v3 + v6);
    if (result) {
      return [result startReceiverServerWithSupportedRenderingModes:1];
    }
  }
  return result;
}

void sub_10000D140()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel);
  if (v1)
  {
    uint64_t v2 = *(void (**)(uint64_t))(*(void *)(v1 + 16) + 40);
    if (v2)
    {
      uint64_t v3 = swift_retain();
      v2(v3);
      sub_100007688((uint64_t)v2);
    }
    *(void *)(v0 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootWindowController) = 0;
    swift_release();
    sub_10000D204();
    if (*(void *)(v0 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController))
    {
      swift_retain();
      sub_100005D18();
      swift_release();
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_10000D204()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer;
  [*(id *)(v0 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer) invalidate];
  uint64_t v3 = *(void **)(v0 + v2);
  *(void *)(v1 + v2) = 0;
  [v3 invalidate];

  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel);
  if (v4)
  {
    *(void *)(v4 + 24) = 0;
    swift_retain();
    swift_release();
    type metadata accessor for RootViewModel();
    sub_1000114FC(&qword_1000228A8, (void (*)(uint64_t))type metadata accessor for RootViewModel);
    ObservableObject<>.objectWillChange.getter();
    ObservableObjectPublisher.send()();
    swift_release();
    swift_release();
    uint64_t v5 = (void *)(v1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName);
    *uint64_t v5 = 0;
    v5[1] = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

void sub_10000D314(uint64_t a1, unint64_t a2)
{
  id v5 = sub_10000AE58();
  uint64_t v6 = *(void **)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion);
  *(void *)(v2 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion) = v5;
  id v7 = v5;
  if (v6) {
    [v6 removeObserver:v2];
  }
  [v6 invalidate];

  if (qword_100022030 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100007B14(v8, (uint64_t)qword_100023890);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v11 = 136315138;
    swift_bridgeObjectRetain();
    sub_100014B64(a1, a2, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Foreground requested for reason: %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v12 = (id)SBSCreateOpenApplicationService();
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = String._bridgeToObjectiveC()();
    aBlock[4] = (uint64_t)sub_10000D640;
    aBlock[5] = 0;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000D904;
    aBlock[3] = (uint64_t)&unk_10001D5A8;
    unint64_t v15 = _Block_copy(aBlock);
    [v13 openApplication:v14 withOptions:0 completion:v15];
    _Block_release(v15);
  }
  else
  {
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v14, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v16, "Unable to foreground because open application service could not be created.", v17, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10000D640(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_100022030 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100007B14(v2, (uint64_t)qword_100023890);
    swift_errorRetain();
    swift_errorRetain();
    oslog = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 136315138;
      swift_getErrorValue();
      uint64_t v5 = Error.localizedDescription.getter();
      sub_100014B64(v5, v6, &v11);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, oslog, v3, "Unable to foreground ourself due to error: %s", v4, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return;
    }
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    if (qword_100022030 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100007B14(v7, (uint64_t)qword_100023890);
    oslog = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(oslog, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v8, "Foreground request completed.", v9, 2u);
      swift_slowDealloc();
    }
  }
}

void sub_10000D904(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_10000D990(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v6 = v5;
  uint64_t v12 = type metadata accessor for UUID();
  os_log_t v51 = *(os_log_t *)(v12 - 8);
  Class isa = v51[8].isa;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v44 - (((unint64_t)isa + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v15 = *(void **)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName + 8];
  if (v15
    && (*(void *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName] == a2
      ? (BOOL v16 = v15 == a3)
      : (BOOL v16 = 0),
        v16 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    if (qword_100022048 != -1) {
      swift_once();
    }
    uint64_t v17 = type metadata accessor for Logger();
    sub_100007B14(v17, (uint64_t)qword_1000238D8);
    os_log_t v51 = (os_log_t)Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v18, "Another request is already in-flight, skip this request", v19, 2u);
      swift_slowDealloc();
    }
    os_log_t v20 = v51;
  }
  else
  {
    Class v45 = isa;
    uint64_t v49 = a2;
    if (qword_100022048 != -1) {
      swift_once();
    }
    uint64_t v21 = type metadata accessor for Logger();
    sub_100007B14(v21, (uint64_t)qword_1000238D8);
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Presenting alert with request to begin stream...", v24, 2u);
      swift_slowDealloc();
    }
    uint64_t v47 = a4;
    uint64_t v48 = a5;
    uint64_t v50 = a3;

    id v25 = sub_10000AE58();
    uint64_t v26 = *(void **)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion];
    *(void *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion] = v25;
    id v27 = v25;
    if (v26) {
      [v26 removeObserver:v6];
    }
    [v26 invalidate];

    os_log_t v28 = v51;
    Class v29 = v51[2].isa;
    uint64_t v46 = a1;
    ((void (*)(char *, uint64_t, uint64_t))v29)(v14, a1, v12);
    type metadata accessor for AcceptDialogController();
    uint64_t v30 = swift_allocObject();
    *(unsigned char *)(v30 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_isShowing) = 0;
    *(void *)(v30 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController__pendingResultRunloopSource) = 0;
    uint64_t v31 = (void (*)(uint64_t, char *, uint64_t))v28[4].isa;
    v31(v30 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_identifier, v14, v12);
    uint64_t v32 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController;
    uint64_t v33 = *(void *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController];
    *(void *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController] = v30;
    swift_retain();
    if (v33)
    {
      sub_100005D18();
      swift_release();
    }
    swift_release();
    if (*(void *)&v6[v32])
    {
      ((void (*)(char *, uint64_t, uint64_t))v29)(v14, v46, v12);
      unint64_t v34 = (LOBYTE(v51[10].isa) + 24) & ~(unint64_t)LOBYTE(v51[10].isa);
      unint64_t v35 = ((unint64_t)v45 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
      uint64_t v36 = swift_allocObject();
      *(void *)(v36 + 16) = v6;
      v31(v36 + v34, v14, v12);
      uint64_t v37 = (uint64_t *)(v36 + v35);
      uint64_t v39 = v49;
      uint64_t v38 = v50;
      *uint64_t v37 = v49;
      v37[1] = (uint64_t)v38;
      uint64_t v40 = (uint64_t *)(v36 + ((v35 + 23) & 0xFFFFFFFFFFFFFFF8));
      uint64_t v42 = v47;
      uint64_t v41 = v48;
      *uint64_t v40 = v47;
      v40[1] = v41;
      swift_retain();
      uint64_t v43 = v6;
      swift_bridgeObjectRetain();
      sub_1000078B4(v42);
      sub_100005AB4(v39, v38, (uint64_t)sub_100012D88, v36, 240.0);
      swift_release();
      swift_release();
    }
  }
}

void sub_10000DE38(int a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v23 = a4;
  uint64_t v24 = a7;
  int v22 = a1;
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = *(void *)(v12 + 64);
  __chkstk_darwin(v11);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v12 + 16))(&v21[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], a3, v11);
  unint64_t v14 = (*(unsigned __int8 *)(v12 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  (*(void (**)(unint64_t, unsigned char *, uint64_t))(v12 + 32))(v15 + v14, &v21[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)], v11);
  unint64_t v16 = v15 + ((v14 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(void *)unint64_t v16 = v23;
  *(void *)(v16 + 8) = a5;
  *(unsigned char *)(v16 + 16) = v22;
  uint64_t v17 = (uint64_t *)(v15 + ((v14 + v13 + 31) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v18 = v24;
  *uint64_t v17 = a6;
  v17[1] = v18;
  aBlock[4] = sub_100012F3C;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A59C;
  aBlock[3] = &unk_10001D580;
  uint64_t v19 = _Block_copy(aBlock);
  id v20 = a2;
  swift_bridgeObjectRetain();
  sub_1000078B4(a6);
  swift_release();
  BSDispatchMain();
  _Block_release(v19);
}

void sub_10000E03C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void (*a6)(BOOL), uint64_t a7)
{
  uint64_t v50 = a7;
  os_log_t v51 = a6;
  int v47 = a5;
  uint64_t v45 = a3;
  uint64_t v46 = a4;
  uint64_t v52 = a2;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v43 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000716C(&qword_100022890);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000716C(&qword_100022898);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v49 = (uint64_t)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v43 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v43 - v20;
  uint64_t v48 = a1;
  uint64_t v44 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController;
  uint64_t v22 = *(void *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController);
  if (v22)
  {
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v23((char *)&v43 - v20, v22 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_identifier, v8);
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v24(v21, 0, 1, v8);
  }
  else
  {
    uint64_t v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v24((char *)&v43 - v20, 1, 1, v8);
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  }
  v23(v19, v52, v8);
  v24(v19, 0, 1, v8);
  uint64_t v25 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_1000098F0((uint64_t)v21, (uint64_t)v13, &qword_100022898);
  sub_1000098F0((uint64_t)v19, v25, &qword_100022898);
  uint64_t v26 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v26((uint64_t)v13, 1, v8) != 1)
  {
    uint64_t v28 = v49;
    sub_1000098F0((uint64_t)v13, v49, &qword_100022898);
    if (v26(v25, 1, v8) != 1)
    {
      Class v29 = v43;
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v43, v25, v8);
      sub_1000114FC(&qword_1000228A0, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v30 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v31 = *(void (**)(char *, uint64_t))(v9 + 8);
      v31(v29, v8);
      sub_100009A10((uint64_t)v19, &qword_100022898);
      sub_100009A10((uint64_t)v21, &qword_100022898);
      v31((char *)v28, v8);
      sub_100009A10((uint64_t)v13, &qword_100022898);
      id v27 = v51;
      if (v30) {
        goto LABEL_13;
      }
LABEL_10:
      if (v27) {
        v27(0);
      }
      return;
    }
    sub_100009A10((uint64_t)v19, &qword_100022898);
    sub_100009A10((uint64_t)v21, &qword_100022898);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v28, v8);
LABEL_9:
    sub_100009A10((uint64_t)v13, &qword_100022890);
    id v27 = v51;
    goto LABEL_10;
  }
  sub_100009A10((uint64_t)v19, &qword_100022898);
  sub_100009A10((uint64_t)v21, &qword_100022898);
  if (v26(v25, 1, v8) != 1) {
    goto LABEL_9;
  }
  sub_100009A10((uint64_t)v13, &qword_100022898);
  id v27 = v51;
LABEL_13:
  uint64_t v32 = v48;
  uint64_t v33 = *(void *)(v48 + v44);
  *(void *)(v48 + v44) = 0;
  if (v33)
  {
    sub_100005D18();
    swift_release();
  }
  unint64_t v34 = (void *)(v32 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName);
  uint64_t v35 = v46;
  *unint64_t v34 = v45;
  v34[1] = v35;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  char v36 = v47;
  if (v47 != 2)
  {
    id v37 = sub_10000AE58();
    uint64_t v38 = *(void **)(v32 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion);
    *(void *)(v32 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion) = v37;
    id v39 = v37;
    if (v38) {
      [v38 removeObserver:v32];
    }
    [v38 invalidate];
  }
  if (v27) {
    v27(v36 == 0);
  }
  if (v36)
  {
    *unint64_t v34 = 0;
    v34[1] = 0;
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_26:
    sub_10000D314(0xD000000000000010, 0x80000001000173A0);
    return;
  }
  uint64_t v41 = Strong;
  if ([Strong activationState])
  {
    id v42 = [v41 activationState];

    if (v42 == (id)1) {
      return;
    }
    goto LABEL_26;
  }
}

uint64_t sub_10000E610()
{
  v1[8] = v0;
  uint64_t v2 = type metadata accessor for GuestUserHandoverService();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  sub_10000716C(&qword_1000228D8);
  v1[12] = swift_task_alloc();
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[15] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[16] = v4;
  v1[17] = v3;
  return _swift_task_switch(sub_10000E750, v4, v3);
}

uint64_t sub_10000E750()
{
  if (![self isGuestUserHandoverEnabled])
  {
    swift_release();
LABEL_8:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
    return v11();
  }
  uint64_t v1 = v0[14];
  uint64_t v2 = v0[9];
  uint64_t v3 = v0[10];
  uint64_t v4 = v0[8] + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate_guestUserHandoverService;
  swift_beginAccess();
  sub_1000098F0(v4, v1, &qword_1000228D8);
  uint64_t v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v5(v1, 1, v2) != 1)
  {
    uint64_t v10 = v0[14];
    goto LABEL_7;
  }
  uint64_t v6 = v0[13];
  uint64_t v7 = v0[12];
  uint64_t v8 = v0[9];
  uint64_t v9 = v0[10];
  sub_100009A10(v0[14], &qword_1000228D8);
  GuestUserHandoverService.init()();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  swift_beginAccess();
  sub_10001305C(v6, v4, &qword_1000228D8);
  swift_endAccess();
  sub_1000098F0(v4, v7, &qword_1000228D8);
  if (v5(v7, 1, v8))
  {
    uint64_t v10 = v0[12];
LABEL_7:
    swift_release();
    sub_100009A10(v10, &qword_1000228D8);
    goto LABEL_8;
  }
  uint64_t v13 = v0[12];
  (*(void (**)(void, uint64_t, void))(v0[10] + 16))(v0[11], v13, v0[9]);
  sub_100009A10(v13, &qword_1000228D8);
  uint64_t v14 = (void *)swift_task_alloc();
  v0[18] = v14;
  void *v14 = v0;
  v14[1] = sub_10000E9E4;
  return GuestUserHandoverService.activate()();
}

uint64_t sub_10000E9E4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 88);
  uint64_t v3 = *(void *)(*v0 + 80);
  uint64_t v4 = *(void *)(*v0 + 72);
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 136);
  uint64_t v6 = *(void *)(v1 + 128);
  return _swift_task_switch(sub_10000EB68, v6, v5);
}

uint64_t sub_10000EB68()
{
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

id sub_10000EBF4()
{
  swift_unknownObjectWeakInit();
  uint64_t v1 = &v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootWindowController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeExpirationTimer] = 0;
  *(void *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer] = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  uint64_t v3 = &v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__notificationToken];
  *(_OWORD *)uint64_t v3 = 0u;
  *((_OWORD *)v3 + 1) = 0u;
  *(_DWORD *)&v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__deviceLockedNotificationToken] = 0;
  uint64_t v4 = &v0[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate_guestUserHandoverService];
  uint64_t v5 = type metadata accessor for GuestUserHandoverService();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super init];
}

id sub_10000ED4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t sub_10000EE7C()
{
  return type metadata accessor for SceneDelegate();
}

uint64_t type metadata accessor for SceneDelegate()
{
  uint64_t result = qword_1000227B0;
  if (!qword_1000227B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000EED0()
{
  sub_10000EFA4();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000EFA4()
{
  if (!qword_1000227C8)
  {
    type metadata accessor for GuestUserHandoverService();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000227C8);
    }
  }
}

void sub_10000EFFC(uint64_t a1)
{
  if (qword_100022040 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100007B14(v2, (uint64_t)qword_1000238C0);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Runtime assertion will invalidate! Dismissing all UI...", v5, 2u);
    swift_slowDealloc();
  }

  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_8:
    uint64_t v8 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager;
    uint64_t v9 = *(void **)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager);
    if (v9)
    {
      [v9 setDelegate:0];
      uint64_t v9 = *(void **)(a1 + v8);
    }
    [v9 stopReceiverServer];
    sub_10000D140();
    return;
  }
  id v10 = Strong;
  if ([Strong activationState])
  {
    id v7 = [v10 activationState];

    if (v7 == (id)1) {
      return;
    }
    goto LABEL_8;
  }
}

void sub_10000F30C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100022048 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007B14(v4, (uint64_t)qword_1000238D8);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "didStartStreaming", v7, 2u);
    swift_slowDealloc();
  }

  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v2;
  *(void *)(v8 + 24) = a1;
  v12[4] = sub_100012C78;
  v12[5] = v8;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_10000A59C;
  v12[3] = &unk_10001D4B8;
  uint64_t v9 = _Block_copy(v12);
  id v10 = v2;
  id v11 = a1;
  swift_release();
  BSDispatchMain();
  _Block_release(v9);
}

void sub_10000F49C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel);
  if (!v2)
  {
    __break(1u);
    return;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  swift_retain();
  id v5 = a2;
  sub_100007C58(a2);
  os_log_type_t v6 = *(void **)(v4 + 56);
  *(void *)(v4 + 56) = a2;
  id v7 = v5;

  type metadata accessor for MirroringViewModel();
  sub_1000114FC(&qword_100022590, (void (*)(uint64_t))type metadata accessor for MirroringViewModel);
  ObservableObject<>.objectWillChange.getter();
  ObservableObjectPublisher.send()();
  swift_release();

  swift_release();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
LABEL_5:
    sub_10000D314(0xD000000000000010, 0x80000001000173A0);
    return;
  }
  id v10 = Strong;
  if ([Strong activationState])
  {
    id v9 = [v10 activationState];

    if (v9 == (id)1) {
      return;
    }
    goto LABEL_5;
  }
}

void sub_10000F688(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel);
  if (v1)
  {
    uint64_t v3 = *(void *)(v1 + 16);
    swift_retain();
    sub_100007C58(0);
    uint64_t v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0;

    type metadata accessor for MirroringViewModel();
    sub_1000114FC(&qword_100022590, (void (*)(uint64_t))type metadata accessor for MirroringViewModel);
    ObservableObject<>.objectWillChange.getter();
    ObservableObjectPublisher.send()();
    swift_release();
    swift_release();
    id v5 = (void *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName);
    *id v5 = 0;
    v5[1] = 0;
    swift_bridgeObjectRelease();
    sub_100011E8C(0xD000000000000010, 0x8000000100017380);
  }
  else
  {
    __break(1u);
  }
}

void sub_10000F820(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5 = v4;
  if (qword_100022048 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_100007B14(v10, (uint64_t)qword_1000238D8);
  id v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "shouldShowGlobalPasscode", v13, 2u);
    swift_slowDealloc();
  }

  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = v5;
  v14[3] = a1;
  v14[4] = a2;
  v14[5] = a3;
  v14[6] = a4;
  v17[4] = sub_1000114EC;
  v17[5] = v14;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10000A59C;
  v17[3] = &unk_10001D3C8;
  uint64_t v15 = _Block_copy(v17);
  id v16 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  BSDispatchMain();
  _Block_release(v15);
}

void sub_10000F9D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_10000D314(0x4E4950776F6873, 0xE700000000000000);
  uint64_t v10 = *(void *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel);
  if (v10)
  {
    type metadata accessor for PINViewModel();
    id v11 = (void *)swift_allocObject();
    v11[2] = a2;
    v11[3] = a3;
    v11[4] = a4;
    v11[5] = a5;
    *(void *)(v10 + 24) = v11;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    type metadata accessor for RootViewModel();
    sub_1000114FC(&qword_1000228A8, (void (*)(uint64_t))type metadata accessor for RootViewModel);
    ObservableObject<>.objectWillChange.getter();
    ObservableObjectPublisher.send()();
    swift_release();
    swift_release();
    swift_release();
    id v12 = objc_allocWithZone((Class)BSContinuousMachTimer);
    NSString v13 = String._bridgeToObjectiveC()();
    id v14 = [v12 initWithIdentifier:v13];

    uint64_t v15 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer;
    id v16 = *(void **)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer);
    *(void *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__pinUIExpirationTimer) = v14;
    id v17 = v14;
    [v16 invalidate];

    uint64_t v18 = *(void **)(a1 + v15);
    if (v18)
    {
      sub_1000076F8(0, (unint64_t *)&unk_1000228B0);
      id v19 = v18;
      uint64_t v20 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v21 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v23[4] = sub_10001157C;
      v23[5] = v21;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 1107296256;
      v23[2] = sub_10000FDFC;
      v23[3] = &unk_10001D418;
      uint64_t v22 = _Block_copy(v23);
      swift_release();
      [v19 scheduleWithFireInterval:v20 leewayInterval:v22 queue:30.0 handler:0.0];
      _Block_release(v22);
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_10000FC94()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    if (qword_100022048 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100007B14(v2, (uint64_t)qword_1000238D8);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "PIN UI timed out. Suspending...", v5, 2u);
      swift_slowDealloc();
    }

    sub_10000D204();
    os_log_type_t v6 = &v1[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__lastStreamStartRequestClientName];
    *(void *)os_log_type_t v6 = 0;
    *((void *)v6 + 1) = 0;
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void *)&v1[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel];
    if (v7)
    {
      if (!*(void *)(*(void *)(v7 + 16) + 56)) {
        sub_100011E8C(0xD000000000000010, 0x8000000100017360);
      }
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10000FDFC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_10000FEF4()
{
}

void sub_10000FF9C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  os_log_type_t v6 = v5;
  uint64_t v43 = a5;
  uint64_t v44 = a2;
  uint64_t v45 = a4;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  id v42 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  id v14 = (char *)&v35 - v13;
  if (qword_100022048 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_100007B14(v15, (uint64_t)qword_1000238D8);
  uint64_t v41 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v41(v14, a1, v9);
  swift_bridgeObjectRetain_n();
  id v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  int v18 = v17;
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v39 = a1;
    uint64_t v20 = v19;
    uint64_t v37 = swift_slowAlloc();
    aBlock[0] = v37;
    *(_DWORD *)uint64_t v20 = 136315394;
    uint64_t v38 = v11;
    int v36 = v18;
    os_log_t v35 = v16;
    uint64_t v21 = UUID.uuidString.getter();
    uint64_t v46 = sub_100014B64(v21, v22, aBlock);
    uint64_t v40 = v6;
    uint64_t v11 = v38;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
    *(_WORD *)(v20 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v23 = v44;
    uint64_t v46 = sub_100014B64(v44, a3, aBlock);
    os_log_type_t v6 = v40;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    os_log_t v24 = v35;
    _os_log_impl((void *)&_mh_execute_header, v35, (os_log_type_t)v36, "shouldAskPermission with uuid: %s fromClient: %s", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v39;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);

    swift_bridgeObjectRelease_n();
    uint64_t v23 = v44;
  }
  uint64_t v25 = v42;
  v41(v42, a1, v9);
  unint64_t v26 = (*(unsigned __int8 *)(v10 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v27 = v9;
  unint64_t v28 = (v11 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v6;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v29 + v26, v25, v27);
  char v30 = (uint64_t *)(v29 + v28);
  *char v30 = v23;
  v30[1] = a3;
  uint64_t v31 = (void *)(v29 + ((v28 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v32 = v43;
  *uint64_t v31 = v45;
  v31[1] = v32;
  aBlock[4] = (uint64_t)sub_1000113B4;
  aBlock[5] = v29;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000A59C;
  aBlock[3] = (uint64_t)&unk_10001D300;
  uint64_t v33 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v34 = v6;
  swift_retain();
  swift_release();
  BSDispatchMain();
  _Block_release(v33);
}

uint64_t sub_1000103E0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a5;
  *(void *)(v11 + 24) = a6;
  swift_retain();
  sub_10000D990(a2, a3, a4, (uint64_t)sub_100011458, v11);

  return swift_release();
}

void sub_1000105F0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v22 - v9;
  if (qword_100022048 != -1) {
    swift_once();
  }
  uint64_t v11 = type metadata accessor for Logger();
  sub_100007B14(v11, (uint64_t)qword_1000238D8);
  unint64_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v27 = a1;
  v26(v10, a1, v4);
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v25 = v1;
    uint64_t v15 = (uint8_t *)v14;
    uint64_t v23 = swift_slowAlloc();
    aBlock[0] = v23;
    os_log_t v24 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_DWORD *)uint64_t v15 = 136315138;
    v22[1] = v15 + 4;
    uint64_t v16 = UUID.uuidString.getter();
    uint64_t v28 = sub_100014B64(v16, v17, aBlock);
    uint64_t v8 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "cancelPermission with uuid: %s", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v25;
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }

  v26(v8, v27, v4);
  unint64_t v18 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v2;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v19 + v18, v8, v4);
  aBlock[4] = (uint64_t)sub_100011014;
  aBlock[5] = v19;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000A59C;
  aBlock[3] = (uint64_t)&unk_10001D288;
  uint64_t v20 = _Block_copy(aBlock);
  id v21 = v2;
  swift_release();
  BSDispatchMain();
  _Block_release(v20);
}

uint64_t sub_100010968(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = a2;
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000716C(&qword_100022890);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000716C(&qword_100022898);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v38 = (uint64_t)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v35 - v14;
  __chkstk_darwin(v13);
  unint64_t v17 = (char *)&v35 - v16;
  id v18 = sub_10000AE58();
  uint64_t v19 = *(void **)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion);
  *(void *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion) = v18;
  id v20 = v18;
  if (v19) {
    [v19 removeObserver:a1];
  }
  [v19 invalidate];

  uint64_t v21 = *(void *)(a1 + OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController);
  int v36 = v6;
  uint64_t v37 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__acceptDialogController;
  uint64_t v40 = a1;
  if (v21)
  {
    unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    v22(v17, v21 + OBJC_IVAR____TtC15AirPlayReceiver22AcceptDialogController_identifier, v3);
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v23(v17, 0, 1, v3);
  }
  else
  {
    uint64_t v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    v23(v17, 1, 1, v3);
    unint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  }
  v22(v15, v39, v3);
  v23(v15, 0, 1, v3);
  uint64_t v24 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_1000098F0((uint64_t)v17, (uint64_t)v9, &qword_100022898);
  sub_1000098F0((uint64_t)v15, v24, &qword_100022898);
  uint64_t v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v25((uint64_t)v9, 1, v3) != 1)
  {
    uint64_t v29 = v38;
    sub_1000098F0((uint64_t)v9, v38, &qword_100022898);
    int v30 = v25(v24, 1, v3);
    uint64_t v27 = v40;
    if (v30 != 1)
    {
      uint64_t v31 = v29;
      uint64_t v32 = v36;
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v36, v24, v3);
      sub_1000114FC(&qword_1000228A0, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v33 = dispatch thunk of static Equatable.== infix(_:_:)();
      id v34 = *(void (**)(char *, uint64_t))(v4 + 8);
      v34(v32, v3);
      sub_100009A10((uint64_t)v15, &qword_100022898);
      sub_100009A10((uint64_t)v17, &qword_100022898);
      v34((char *)v31, v3);
      uint64_t result = sub_100009A10((uint64_t)v9, &qword_100022898);
      if ((v33 & 1) == 0) {
        return result;
      }
      goto LABEL_13;
    }
    sub_100009A10((uint64_t)v15, &qword_100022898);
    sub_100009A10((uint64_t)v17, &qword_100022898);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v29, v3);
    return sub_100009A10((uint64_t)v9, &qword_100022890);
  }
  sub_100009A10((uint64_t)v15, &qword_100022898);
  sub_100009A10((uint64_t)v17, &qword_100022898);
  int v26 = v25(v24, 1, v3);
  uint64_t v27 = v40;
  if (v26 != 1) {
    return sub_100009A10((uint64_t)v9, &qword_100022890);
  }
  uint64_t result = sub_100009A10((uint64_t)v9, &qword_100022898);
LABEL_13:
  if (*(void *)(v27 + v37))
  {
    swift_retain();
    sub_100005D18();
    return swift_release();
  }
  return result;
}

uint64_t sub_100010F48()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100011014()
{
  uint64_t v1 = *(void *)(type metadata accessor for UUID() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_100010968(v2, v3);
}

uint64_t sub_100011078(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100011088()
{
  return swift_release();
}

uint64_t sub_100011090(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001116C;
  return v6(a1);
}

uint64_t sub_10001116C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100011264()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001129C(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_1000112B4()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_1000113B4()
{
  uint64_t v1 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = (*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v2;
  uint64_t v6 = *(void *)(v0 + v3);
  uint64_t v7 = *(void **)(v0 + v3 + 8);
  uint64_t v8 = (uint64_t *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v9 = *v8;
  uint64_t v10 = v8[1];

  return sub_1000103E0(v4, v5, v6, v7, v9, v10);
}

uint64_t sub_100011458()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_100011480()
{
}

uint64_t sub_1000114A4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_1000114EC()
{
  sub_10000F9D8(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_1000114FC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100011544()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001157C()
{
}

void sub_100011584(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  if (qword_100022028 != -1) {
    swift_once();
  }
  uint64_t v7 = sub_100007B14(v3, (uint64_t)qword_100023878);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, v3);
  uint64_t v8 = v1;
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v9, v10))
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    goto LABEL_7;
  }
  uint64_t v14 = a1;
  uint64_t v11 = (uint8_t *)swift_slowAlloc();
  uint64_t v17 = swift_slowAlloc();
  *(_DWORD *)uint64_t v11 = 136315138;
  id v15 = v8;
  unint64_t v12 = *(void *)&v8[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier + 8];
  if (v12)
  {
    uint64_t v13 = *(void *)&v8[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier];
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100014B64(v13, v12, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "[%s] openURLContexts", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    a1 = v14;
LABEL_7:
    sub_10000B650(a1);
    return;
  }

  __break(1u);
}

void sub_100011824(void *a1, void *a2)
{
  id v46 = a2;
  uint64_t v4 = sub_10000716C(&qword_1000228E0);
  __chkstk_darwin(v4 - 8);
  uint64_t v45 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  id v10 = [a1 _FBSScene];
  id v11 = [v10 identifier];

  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;

  id v15 = (uint64_t *)&v2[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier];
  *id v15 = v12;
  v15[1] = v14;
  swift_bridgeObjectRelease();
  if (qword_100022028 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_100007B14(v6, (uint64_t)qword_100023878);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16, v6);
  uint64_t v17 = v2;
  id v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v43 = v6;
    uint64_t v44 = a1;
    id v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    *(_DWORD *)id v20 = 136315138;
    unint64_t v21 = v15[1];
    if (!v21)
    {

      __break(1u);
      return;
    }
    uint64_t v22 = *v15;
    swift_bridgeObjectRetain();
    uint64_t v47 = sub_100014B64(v22, v21, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%s] sceneWillConnect", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v43);
    a1 = v44;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  self;
  uint64_t v23 = swift_dynamicCastObjCClass();
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    id v25 = a1;
    [v24 _setBackgroundStyle:4];
    swift_unknownObjectWeakAssign();
    id v26 = [self sharedInstance];
    [v26 setPreemptionPolicy:2];
    [v26 setMaxNumberOfConcurrentSessions:1];
    [v26 setAltAdvertisingEnabled:1];
    [v26 setOptimizeAudioRenderingLatency:1];
    [v26 setEnableMixingMediaAudio:1];
    uint64_t v27 = *(void **)&v17[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager];
    *(void *)&v17[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager] = v26;
    id v28 = v26;

    type metadata accessor for MirroringViewModel();
    uint64_t v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = 0u;
    *(_OWORD *)(v29 + 32) = 0u;
    *(_OWORD *)(v29 + 48) = 0u;
    uint64_t v30 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v31 = swift_allocObject();
    *(void *)(v31 + 16) = v29;
    *(void *)(v31 + 24) = v30;
    *(void *)(v29 + 40) = sub_1000133F0;
    *(void *)(v29 + 48) = v31;
    swift_retain();
    sub_100007688(0);
    type metadata accessor for RootViewModel();
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = v29;
    *(void *)(v32 + 24) = 0;
    *(void *)&v17[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel] = v32;
    swift_retain();
    swift_release();
    id v33 = [v46 URLContexts];
    sub_1000076F8(0, &qword_1000228E8);
    sub_100012FE4();
    uint64_t v34 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    if ((v34 & 0xC000000000000001) != 0) {
      uint64_t v35 = __CocoaSet.count.getter();
    }
    else {
      uint64_t v35 = *(void *)(v34 + 16);
    }
    swift_bridgeObjectRelease();
    if (v35)
    {
      id v36 = [v46 URLContexts];
      uint64_t v37 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

      sub_100011584(v37);
      swift_bridgeObjectRelease();
    }
    uint64_t v38 = type metadata accessor for TaskPriority();
    uint64_t v39 = (uint64_t)v45;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v45, 1, 1, v38);
    type metadata accessor for MainActor();
    uint64_t v40 = v17;
    uint64_t v41 = static MainActor.shared.getter();
    id v42 = (void *)swift_allocObject();
    v42[2] = v41;
    v42[3] = &protocol witness table for MainActor;
    v42[4] = v40;
    sub_10000A8AC(v39, (uint64_t)&unk_100022930, (uint64_t)v42);
    swift_release();

    swift_release();
  }
}

void sub_100011E8C(uint64_t a1, unint64_t a2)
{
  if (qword_100022030 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100007B14(v4, (uint64_t)qword_100023890);
  swift_bridgeObjectRetain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    sub_100014B64(a1, a2, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Suspending UI for reason: %s", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v8 = [self sharedApplication];
  [v8 suspend];
}

void sub_100012068()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  if (qword_100022028 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100007B14(v1, (uint64_t)qword_100023878);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  os_log_type_t v6 = v0;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v24[0] = v1;
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v25[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    unint64_t v10 = *(void *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier + 8];
    if (!v10)
    {

      __break(1u);
      goto LABEL_19;
    }
    uint64_t v11 = *(void *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier];
    swift_bridgeObjectRetain();
    v24[1] = sub_100014B64(v11, v10, v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%s] sceneWillEnterForeground", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v1 = v24[0];
    (*(void (**)(char *, void))(v2 + 8))(v4, v24[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  uint64_t v12 = OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootWindowController;
  if (!*(void *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootWindowController])
  {
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v14 = (void *)Strong;
      type metadata accessor for UIWindowController();
      id v15 = (void *)swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_unknownObjectWeakAssign();
      v15[4] = 1852399981;
      v15[5] = 0xE400000000000000;
      id v16 = [objc_allocWithZone((Class)UIWindow) initWithWindowScene:v14];
      v15[3] = v16;
      id v17 = v16;
      [v17 setWindowLevel:1.0];

      if (*(void *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__rootViewModel])
      {
        type metadata accessor for RootViewModel();
        sub_1000114FC(&qword_1000228A8, (void (*)(uint64_t))type metadata accessor for RootViewModel);
        swift_retain();
        v25[0] = ObservedObject.init(wrappedValue:)();
        v25[1] = v18;
        sub_10001335C();
        uint64_t v19 = AnyView.init<A>(_:)();
        sub_100014494(v19);
        swift_release();
        *(void *)&v6[v12] = v15;
        swift_release();
        goto LABEL_11;
      }
LABEL_20:
      __break(1u);
      return;
    }
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
LABEL_11:
  sub_10000B3B4(0x756F726765726F66, 0xEA0000000000646ELL);
  sub_10000CEF8(0x756F726765726F66, 0xEA0000000000646ELL);
  if (qword_100022040 != -1) {
    swift_once();
  }
  sub_100007B14(v1, (uint64_t)qword_1000238C0);
  id v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v22 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "App coming to foreground - disabling Force permission dialog", v22, 2u);
    swift_slowDealloc();
  }

  uint64_t v23 = *(void **)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__renderingManager];
  if (v23) {
    [v23 setForcePermissionDialog:0];
  }
}

void sub_100012534()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  if (qword_100022028 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_100007B14(v1, (uint64_t)qword_100023878);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  os_log_type_t v6 = v0;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    uint64_t v18 = v16;
    *(_DWORD *)uint64_t v9 = 136315138;
    unint64_t v10 = *(void *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier + 8];
    if (!v10)
    {

      __break(1u);
      return;
    }
    uint64_t v11 = *(void *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__logIdentifier];
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_100014B64(v11, v10, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%s] sceneDidEnterBackground", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  id v12 = sub_10000AE58();
  uint64_t v13 = *(void **)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion];
  *(void *)&v6[OBJC_IVAR____TtC15AirPlayReceiver13SceneDelegate__backgroundRuntimeAssertion] = v12;
  id v14 = v12;
  if (v13) {
    [v13 removeObserver:v6];
  }
  [v13 invalidate];

  sub_10000D140();
}

uint64_t sub_1000127F4()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  os_log_type_t v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076F8(0, (unint64_t *)&unk_1000228B0);
  uint64_t v9 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  aBlock[4] = sub_100012C80;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A59C;
  aBlock[3] = &unk_10001D508;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v0;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000114FC((unint64_t *)&unk_1000228C0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000716C(&qword_100022310);
  sub_1000077B4();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_100012AB0(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  os_log_type_t v8 = v4;
  if (qword_100022048 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100007B14(v9, (uint64_t)qword_1000238D8);
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a1, v12, 2u);
    swift_slowDealloc();
  }

  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v8;
  v16[4] = a3;
  v16[5] = v13;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_10000A59C;
  v16[3] = a4;
  id v14 = _Block_copy(v16);
  id v15 = v8;
  swift_release();
  BSDispatchMain();
  _Block_release(v14);
}

void sub_100012C30()
{
  sub_10000F688(*(void *)(v0 + 16));
}

uint64_t sub_100012C38()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_100012C78()
{
  sub_10000F49C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_100012C80()
{
  sub_10000EFFC(*(void *)(v0 + 16));
}

uint64_t sub_100012C88()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  unint64_t v5 = (((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v5)) {
    swift_release();
  }

  return _swift_deallocObject(v0, v5 + 16, v3 | 7);
}

void sub_100012D88(int a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v6 = *(void **)(v1 + 16);
  uint64_t v7 = v1 + v4;
  uint64_t v8 = *(void *)(v1 + v5);
  uint64_t v9 = *(void *)(v1 + v5 + 8);
  uint64_t v10 = (uint64_t *)(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];

  sub_10000DE38(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_100012E3C()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  unint64_t v5 = (v4 + *(void *)(v2 + 64) + 31) & 0xFFFFFFFFFFFFFFF8;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + v5)) {
    swift_release();
  }

  return _swift_deallocObject(v0, v5 + 16, v3 | 7);
}

void sub_100012F3C()
{
  uint64_t v1 = *(void *)(type metadata accessor for UUID() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  unint64_t v3 = v2 + *(void *)(v1 + 64);
  uint64_t v4 = *(void *)(v0 + 16);
  uint64_t v5 = v0 + v2;
  uint64_t v6 = v0 + ((v3 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v7 = *(void *)v6;
  uint64_t v8 = *(void *)(v6 + 8);
  uint64_t v9 = v0 + ((v3 + 31) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v10 = *(void (**)(BOOL))v9;
  uint64_t v11 = *(void *)(v9 + 8);
  int v12 = *(unsigned __int8 *)(v6 + 16);

  sub_10000E03C(v4, v5, v7, v8, v12, v10, v11);
}

unint64_t sub_100012FE4()
{
  unint64_t result = qword_1000228F0;
  if (!qword_1000228F0)
  {
    sub_1000076F8(255, &qword_1000228E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000228F0);
  }
  return result;
}

uint64_t sub_10001304C()
{
  return swift_release();
}

void sub_100013054()
{
}

uint64_t sub_10001305C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000716C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000130C0()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_1000130F8()
{
  return sub_10000AC44();
}

uint64_t sub_100013120(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_1000131D4;
  return sub_10000C6E0(a1, v4, v5, v6);
}

uint64_t sub_1000131D4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_1000132C8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10001330C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10001335C()
{
  unint64_t result = qword_100022920;
  if (!qword_100022920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_100022920);
  }
  return result;
}

uint64_t sub_1000133B0()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_1000133F0()
{
  sub_10000A5E0(*(void *)(v0 + 16));
}

uint64_t sub_1000133FC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001343C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_1000131D4;
  return sub_10000A664();
}

uint64_t sub_1000134F0()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100013528(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000135E0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100022938 + dword_100022938);
  return v6(a1, v4);
}

uint64_t sub_10001364C(uint64_t a1)
{
  return sub_100013768(a1, qword_100023860);
}

uint64_t sub_100013664(uint64_t a1)
{
  return sub_100013768(a1, qword_100023878);
}

uint64_t sub_100013680(uint64_t a1)
{
  return sub_100013768(a1, qword_100023890);
}

uint64_t *sub_100013694(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1000136F8(uint64_t a1)
{
  return sub_100013768(a1, qword_1000238A8);
}

uint64_t sub_100013720(uint64_t a1)
{
  return sub_100013768(a1, qword_1000238C0);
}

uint64_t sub_100013740(uint64_t a1)
{
  return sub_100013768(a1, qword_1000238D8);
}

uint64_t sub_100013768(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  sub_100013694(v3, a2);
  sub_100007B14(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

ValueMetadata *type metadata accessor for PINView()
{
  return &type metadata for PINView;
}

uint64_t sub_1000137F0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001380C@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v110 = a1;
  uint64_t v3 = sub_10000716C(&qword_100022550);
  __chkstk_darwin(v3 - 8);
  v108 = (char *)v100 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v5 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v7 = v6;
  char v9 = v8 & 1;
  static Font.title.getter();
  uint64_t v10 = Text.font(_:)();
  uint64_t v12 = v11;
  char v14 = v13;
  swift_release();
  sub_100014214(v5, v7, v9);
  swift_bridgeObjectRelease();
  static Font.Weight.medium.getter();
  uint64_t v15 = Text.fontWeight(_:)();
  uint64_t v17 = v16;
  char v19 = v18 & 1;
  sub_100014214(v10, v12, v14 & 1);
  swift_bridgeObjectRelease();
  static Color.white.getter();
  uint64_t v20 = Text.foregroundColor(_:)();
  uint64_t v22 = v21;
  LOBYTE(v12) = v23;
  swift_release();
  sub_100014214(v15, v17, v19);
  swift_bridgeObjectRelease();
  static Color.black.getter();
  Color.opacity(_:)();
  swift_release();
  uint64_t v114 = Text.shadow(color:radius:x:y:)();
  uint64_t v113 = v24;
  LOBYTE(v15) = v25;
  uint64_t v115 = v26;
  swift_release();
  int v105 = v15 & 1;
  sub_100014214(v20, v22, v12 & 1);
  swift_bridgeObjectRelease();
  int v107 = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v106 = v27;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v34 = v110[5];
  uint64_t v118 = v110[4];
  uint64_t v119 = v34;
  unint64_t v102 = sub_100014224();
  swift_bridgeObjectRetain();
  uint64_t v35 = Text.init<A>(_:)();
  uint64_t v37 = v36;
  char v39 = v38 & 1;
  static Font.footnote.getter();
  uint64_t v40 = Text.font(_:)();
  uint64_t v42 = v41;
  LOBYTE(v12) = v43;
  swift_release();
  sub_100014214(v35, v37, v39);
  swift_bridgeObjectRelease();
  static Font.Weight.medium.getter();
  uint64_t v44 = Text.fontWeight(_:)();
  uint64_t v46 = v45;
  char v48 = v47 & 1;
  sub_100014214(v40, v42, v12 & 1);
  swift_bridgeObjectRelease();
  static Color.white.getter();
  uint64_t v49 = Text.foregroundColor(_:)();
  uint64_t v51 = v50;
  LOBYTE(v42) = v52;
  swift_release();
  sub_100014214(v44, v46, v48);
  swift_bridgeObjectRelease();
  static Color.black.getter();
  Color.opacity(_:)();
  swift_release();
  uint64_t v112 = Text.shadow(color:radius:x:y:)();
  uint64_t v111 = v53;
  LOBYTE(v44) = v54;
  uint64_t v104 = v55;
  swift_release();
  int v109 = v44 & 1;
  sub_100014214(v49, v51, v42 & 1);
  swift_bridgeObjectRelease();
  int v103 = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  uint64_t v63 = v62;
  uint64_t v64 = v110[3];
  uint64_t v118 = v110[2];
  uint64_t v119 = v64;
  swift_bridgeObjectRetain();
  uint64_t v65 = Text.init<A>(_:)();
  uint64_t v67 = v66;
  char v69 = v68 & 1;
  uint64_t v70 = type metadata accessor for Font.Design();
  uint64_t v71 = (uint64_t)v108;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v108, 1, 1, v70);
  static Font.system(size:weight:design:)();
  sub_100014278(v71);
  uint64_t v72 = Text.font(_:)();
  uint64_t v74 = v73;
  LOBYTE(v12) = v75;
  swift_release();
  LOBYTE(v49) = v12 & 1;
  sub_100014214(v65, v67, v69);
  swift_bridgeObjectRelease();
  static Font.Weight.medium.getter();
  uint64_t v76 = Text.fontWeight(_:)();
  uint64_t v78 = v77;
  LOBYTE(v67) = v79 & 1;
  sub_100014214(v72, v74, v49);
  swift_bridgeObjectRelease();
  uint64_t v80 = Text.tracking(_:)();
  uint64_t v82 = v81;
  v108 = v83;
  LOBYTE(v71) = v84 & 1;
  LODWORD(v102) = v84 & 1;
  sub_100014214(v76, v78, v67);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  v100[1] = KeyPath;
  uint64_t v101 = static Color.white.getter();
  uint64_t v86 = swift_getKeyPath();
  static Color.black.getter();
  uint64_t v110 = (void *)Color.opacity(_:)();
  swift_release();
  char v87 = v105;
  char v117 = v105;
  char v116 = v109;
  char v131 = v105;
  char v129 = 0;
  char v127 = v109;
  char v124 = 0;
  char v122 = v71;
  *(_DWORD *)(a2 + 17) = v118;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)((char *)&v118 + 3);
  *(_DWORD *)(a2 + 33) = *(_DWORD *)v130;
  *(_DWORD *)(a2 + 36) = *(_DWORD *)&v130[3];
  int v88 = *(_DWORD *)v128;
  *(_DWORD *)(a2 + 76) = *(_DWORD *)&v128[3];
  *(_DWORD *)(a2 + 73) = v88;
  LOBYTE(v88) = v127;
  int v89 = *(_DWORD *)v126;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v126[3];
  *(_DWORD *)(a2 + 97) = v89;
  int v90 = *(_DWORD *)v125;
  *(_DWORD *)(a2 + 116) = *(_DWORD *)&v125[3];
  *(_DWORD *)(a2 + 113) = v90;
  LOBYTE(v90) = v124;
  int v91 = *(_DWORD *)v123;
  *(_DWORD *)(a2 + 156) = *(_DWORD *)&v123[3];
  *(_DWORD *)(a2 + 153) = v91;
  LOBYTE(v91) = v122;
  int v92 = *(_DWORD *)v121;
  *(_DWORD *)(a2 + 180) = *(_DWORD *)&v121[3];
  *(_DWORD *)(a2 + 177) = v92;
  int v93 = *(_DWORD *)v120;
  *(_DWORD *)(a2 + 204) = *(_DWORD *)&v120[3];
  *(_DWORD *)(a2 + 201) = v93;
  uint64_t v94 = v114;
  uint64_t v95 = v113;
  *(void *)a2 = v114;
  *(void *)(a2 + 8) = v95;
  *(unsigned char *)(a2 + 16) = v87;
  *(void *)(a2 + 24) = v115;
  *(unsigned char *)(a2 + 32) = v107;
  *(void *)(a2 + 40) = v106;
  *(void *)(a2 + 48) = v29;
  *(void *)(a2 + 56) = v31;
  *(void *)(a2 + 64) = v33;
  *(unsigned char *)(a2 + 72) = 0;
  uint64_t v96 = v112;
  uint64_t v97 = v111;
  *(void *)(a2 + 80) = v112;
  *(void *)(a2 + 88) = v97;
  *(unsigned char *)(a2 + 96) = v88;
  *(void *)(a2 + 104) = v104;
  *(unsigned char *)(a2 + 112) = v103;
  *(void *)(a2 + 120) = v57;
  *(void *)(a2 + 128) = v59;
  *(void *)(a2 + 136) = v61;
  *(void *)(a2 + 144) = v63;
  *(unsigned char *)(a2 + 152) = v90;
  *(void *)(a2 + 160) = v80;
  *(void *)(a2 + 168) = v82;
  *(unsigned char *)(a2 + 176) = v91;
  *(void *)(a2 + 184) = v108;
  *(void *)(a2 + 192) = KeyPath;
  *(unsigned char *)(a2 + 200) = 1;
  uint64_t v98 = v101;
  *(void *)(a2 + 208) = v86;
  *(void *)(a2 + 216) = v98;
  *(void *)(a2 + 224) = v110;
  *(_OWORD *)(a2 + 232) = xmmword_100016BD0;
  *(void *)(a2 + 248) = 0x4010000000000000;
  sub_100014384(v94, v95, v87);
  swift_bridgeObjectRetain();
  sub_100014384(v96, v97, v109);
  swift_bridgeObjectRetain();
  LOBYTE(v96) = v102;
  sub_100014384(v80, v82, v102);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100014214(v80, v82, v96);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_100014214(v112, v111, v116);
  swift_bridgeObjectRelease();
  sub_100014214(v114, v113, v117);
  return swift_bridgeObjectRelease();
}

void *sub_100014138@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void **)(v1 + 8);
  uint64_t v4 = static HorizontalAlignment.center.getter();
  sub_10001380C(v3, (uint64_t)v6);
  *(_OWORD *)&__src[199] = v6[12];
  *(_OWORD *)&__src[215] = v6[13];
  *(_OWORD *)&__src[231] = v6[14];
  *(_OWORD *)&__src[247] = v6[15];
  *(_OWORD *)&__src[135] = v6[8];
  *(_OWORD *)&__src[151] = v6[9];
  *(_OWORD *)&__src[167] = v6[10];
  *(_OWORD *)&__src[183] = v6[11];
  *(_OWORD *)&__src[71] = v6[4];
  *(_OWORD *)&__src[87] = v6[5];
  *(_OWORD *)&__src[103] = v6[6];
  *(_OWORD *)&__src[119] = v6[7];
  *(_OWORD *)&__src[7] = v6[0];
  *(_OWORD *)&__src[23] = v6[1];
  *(_OWORD *)&__src[39] = v6[2];
  *(_OWORD *)&__src[55] = v6[3];
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  return memcpy((void *)(a1 + 17), __src, 0x107uLL);
}

uint64_t sub_100014214(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_100014224()
{
  unint64_t result = qword_1000229B0;
  if (!qword_1000229B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000229B0);
  }
  return result;
}

uint64_t sub_100014278(uint64_t a1)
{
  uint64_t v2 = sub_10000716C(&qword_100022550);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000142D8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100014304()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_10001432C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100014358()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100014384(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_100014398()
{
  unint64_t result = qword_1000229B8;
  if (!qword_1000229B8)
  {
    sub_100007810(&qword_1000229C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000229B8);
  }
  return result;
}

uint64_t sub_1000143F4()
{
  swift_release();
  swift_release();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for RootViewModel()
{
  return self;
}

uint64_t sub_100014458@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for RootViewModel();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

void sub_100014494(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    if (qword_100022030 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_100007B14(v6, (uint64_t)qword_100023890);
    swift_retain();
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      char v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v34 = swift_slowAlloc();
      *(_DWORD *)char v9 = 136315138;
      uint64_t v11 = v2[4];
      unint64_t v10 = v2[5];
      swift_bridgeObjectRetain();
      sub_100014B64(v11, v10, &v34);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Showing [%s] window.", v9, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release();
    }
    uint64_t v15 = (void *)v2[3];
    uint64_t v34 = a1;
    id v16 = objc_allocWithZone((Class)sub_10000716C(&qword_100022B80));
    swift_retain();
    uint64_t v17 = (void *)UIHostingController.init(rootView:)();
    [v15 setRootViewController:v17];

    id v18 = [v15 rootViewController];
    if (v18)
    {
      char v19 = v18;
      id v20 = [v18 view];

      if (!v20)
      {
        __break(1u);
LABEL_22:
        __break(1u);
        return;
      }
      objc_msgSend(objc_msgSend(v5, "coordinateSpace"), "bounds");
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      swift_unknownObjectRelease();
      [v20 setFrame:v22, v24, v26, v28];
    }
    id v29 = [v15 rootViewController];
    if (!v29)
    {
LABEL_20:
      [v15 setHidden:0];
      [v15 makeKeyAndVisible];

      return;
    }
    uint64_t v30 = v29;
    id v31 = [v29 view];

    if (v31)
    {
      id v32 = [self clearColor];
      [v31 setBackgroundColor:v32];

      goto LABEL_20;
    }
    goto LABEL_22;
  }
  if (qword_100022030 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_100007B14(v12, (uint64_t)qword_100023890);
  oslog = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(oslog, v13))
  {
    char v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v13, "Unable to show mirroring content, because no scene exists.", v14, 2u);
    swift_slowDealloc();
  }
}

unint64_t sub_1000148E4()
{
  _StringGuts.grow(_:)(35);
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 40);
  swift_bridgeObjectRetain();
  v3._countAndFlagsBits = v1;
  v3._object = v2;
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x6F646E6977203A5DLL;
  v4._object = (void *)0xEA00000000003D77;
  String.append(_:)(v4);
  id v5 = [*(id *)(v0 + 24) description];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  os_log_type_t v8 = v7;

  v9._countAndFlagsBits = v6;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 62;
  v10._object = (void *)0xE100000000000000;
  String.append(_:)(v10);
  return 0xD000000000000014;
}

uint64_t sub_1000149E8()
{
  swift_unknownObjectWeakDestroy();

  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for UIWindowController()
{
  return self;
}

unint64_t sub_100014A54()
{
  return sub_1000148E4();
}

uint64_t sub_100014A78(uint64_t result, unsigned char **a2)
{
  uint64_t v2 = *a2;
  *uint64_t v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_100014A88(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_100014AC4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100014AEC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4();
  sub_100014B64(v6, v7, a3);
  uint64_t v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_100014B64(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100014C38(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007858((uint64_t)v12, *a3);
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
      sub_100007858((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001330C((uint64_t)v12);
  return v7;
}

uint64_t sub_100014C38(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100014DF4(a5, a6);
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

uint64_t sub_100014DF4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100014E8C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001506C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001506C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100014E8C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100015004(v2, 0);
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

void *sub_100015004(uint64_t a1, uint64_t a2)
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
  sub_10000716C(&qword_100022B88);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001506C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000716C(&qword_100022B88);
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

unsigned char **sub_1000151BC(unsigned char **result, uint64_t a2, uint64_t a3, char a4)
{
  unint64_t v4 = *result;
  *unint64_t v4 = a4;
  *uint64_t result = v4 + 1;
  return result;
}

uint64_t sub_1000151CC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t static CustomNSError.errorDomain.getter()
{
  return static CustomNSError.errorDomain.getter();
}

uint64_t CustomNSError.errorUserInfo.getter()
{
  return CustomNSError.errorUserInfo.getter();
}

uint64_t CustomNSError.errorCode.getter()
{
  return CustomNSError.errorCode.getter();
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.errorDescription.getter()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static _CFObject.== infix(_:_:)()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t _CFObject.hash(into:)()
{
  return _CFObject.hash(into:)();
}

uint64_t _CFObject.hashValue.getter()
{
  return _CFObject.hashValue.getter();
}

uint64_t GuestUserHandoverService.init()()
{
  return GuestUserHandoverService.init()();
}

uint64_t type metadata accessor for GuestUserHandoverService()
{
  return type metadata accessor for GuestUserHandoverService();
}

uint64_t static AirPlayReceiverCoordinator.requestViewMirroringLaunchURLString.getter()
{
  return static AirPlayReceiverCoordinator.requestViewMirroringLaunchURLString.getter();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
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

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

Swift::Void __swiftcall ObservableObjectPublisher.send()()
{
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t ObservedObject.init(wrappedValue:)()
{
  return ObservedObject.init(wrappedValue:)();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static SymbolRenderingMode.hierarchical.getter()
{
  return static SymbolRenderingMode.hierarchical.getter();
}

uint64_t type metadata accessor for SymbolRenderingMode()
{
  return type metadata accessor for SymbolRenderingMode();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Font.title.getter()
{
  return static Font.title.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.medium.getter()
{
  return static Font.Weight.medium.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t static Font.system(_:design:weight:)()
{
  return static Font.system(_:design:weight:)();
}

uint64_t static Font.footnote.getter()
{
  return static Font.footnote.getter();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t Text.fontWeight(_:)()
{
  return Text.fontWeight(_:)();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.shadow(color:radius:x:y:)()
{
  return Text.shadow(color:radius:x:y:)();
}

uint64_t Text.tracking(_:)()
{
  return Text.tracking(_:)();
}

uint64_t Text.init(_:tableName:bundle:comment:)()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
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

uint64_t View.statusBar(hidden:)()
{
  return View.statusBar(hidden:)();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t Image.symbolRenderingMode(_:)()
{
  return Image.symbolRenderingMode(_:)();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
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

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
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

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
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

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
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

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
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

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t BSDispatchMain()
{
  return _BSDispatchMain();
}

uint64_t BSDispatchQueueAssertMain()
{
  return _BSDispatchQueueAssertMain();
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationGetResponseDictionary(userNotification);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSCreateOpenApplicationService()
{
  return _SBSCreateOpenApplicationService();
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

pid_t getpid(void)
{
  return _getpid();
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

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}