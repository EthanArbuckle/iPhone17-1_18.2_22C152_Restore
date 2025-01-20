uint64_t start(int a1, char **a2)
{
  objc_class *v4;
  NSString *v5;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;

  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = UIApplicationMain(a1, a2, v5, v7);

  return v8;
}

void sub_100005208()
{
  v3[0] = FBSOpenApplicationOptionKeyPromptUnlockDevice;
  v3[1] = FBSOpenApplicationOptionKeyUnlockDevice;
  v4[0] = &__kCFBooleanTrue;
  v4[1] = &__kCFBooleanTrue;
  v3[2] = FBSOpenApplicationOptionKeyPayloadURL;
  v4[2] = @"music://show-now-playing";
  v0 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  v1 = SBSCreateOpenApplicationService();
  v2 = +[FBSOpenApplicationOptions optionsWithDictionary:v0];
  [v1 openApplication:@"com.apple.Music" withOptions:v2 completion:&stru_100010A28];
}

uint64_t sub_100005314()
{
  return SceneSettingScopes.ActivitySettings.activityIdentifier.getter();
}

uint64_t sub_100005338()
{
  return SceneSettingScopes.ActivitySettings.activityDescriptor.getter();
}

void sub_10000535C(void *a1)
{
  sub_100007FC4(&qword_100015F30);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000ECE0;
  v3 = (void *)MRGroupSessionEventOptionDiscoveredSessionIdentifier;
  *(void *)(inited + 32) = MRGroupSessionEventOptionDiscoveredSessionIdentifier;
  id v4 = v3;
  id v5 = [a1 identifier];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  *(void *)(inited + 40) = v6;
  *(void *)(inited + 48) = v8;
  v9 = (void *)MRGroupSessionEventOptionEventType;
  *(void *)(inited + 64) = &type metadata for String;
  *(void *)(inited + 72) = v9;
  id v10 = objc_allocWithZone((Class)NSNumber);
  id v11 = v9;
  id v12 = [v10 initWithInteger:1];
  *(void *)(inited + 104) = sub_100008214(0, &qword_100015F38);
  *(void *)(inited + 80) = v12;
  sub_100005548(inited);
  type metadata accessor for MRGroupSessionEventOption(0);
  sub_100008008(&qword_100015F40, type metadata accessor for MRGroupSessionEventOption);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v15[4] = sub_100005664;
  v15[5] = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_100005824;
  v15[3] = &unk_100010B90;
  v14 = _Block_copy(v15);
  MRGroupSessionSendEvent();
  _Block_release(v14);
}

unint64_t sub_100005548(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007FC4(&qword_100015F50);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  v3 = (void *)v2;
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
    sub_10000827C(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_100006D24(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1000080A8(&v14, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_100005664(uint64_t result)
{
  if (result)
  {
    swift_errorRetain();
    os_log_type_t v1 = static os_log_type_t.error.getter();
    if (qword_100015DF8 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_100016790;
    os_log_type_t v3 = v1;
    if (os_log_type_enabled((os_log_t)qword_100016790, v1))
    {
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 138412290;
      swift_errorRetain();
      uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v5 = v6;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "MRGroupSessionSendEvent error: %@", v4, 0xCu);
      sub_100007FC4(&qword_100015F48);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      return swift_errorRelease();
    }
    else
    {
      return swift_errorRelease();
    }
  }
  return result;
}

void sub_100005824(uint64_t a1, void *a2)
{
  os_log_type_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_100005920(void *a1)
{
  uint64_t v2 = v1;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong
    && (uint64_t v5 = (void *)Strong,
        sub_100008214(0, &qword_100015EE8),
        id v6 = a1,
        char v7 = static NSObject.== infix(_:_:)(),
        v6,
        v6,
        v5,
        (v7 & 1) != 0))
  {
    uint64_t v8 = &OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionLowPowerWindow;
  }
  else
  {
    uint64_t v9 = swift_unknownObjectWeakLoadStrong();
    if (!v9) {
      return;
    }
    uint64_t v10 = (void *)v9;
    sub_100008214(0, &qword_100015EE8);
    id v11 = a1;
    char v12 = static NSObject.== infix(_:_:)();

    if ((v12 & 1) == 0) {
      return;
    }
    uint64_t v8 = &OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow;
  }
  uint64_t v13 = *v8;
  long long v14 = *(void **)(v2 + v13);
  *(void *)(v2 + v13) = 0;
}

void sub_100005AB8(void *a1)
{
  uint64_t v2 = v1;
  static os_log_type_t.default.getter();
  if (qword_100015DF8 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_100008214(0, &qword_100015EE8);
    id v6 = a1;
    char v7 = static NSObject.== infix(_:_:)();

    if (v7)
    {
      static os_log_type_t.default.getter();
      os_log(_:dso:log:_:_:)();
      uint64_t v8 = OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow;
      uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow);
      if (v9)
      {
        id v10 = [v9 rootViewController];
        if (v10)
        {
          id v11 = v10;
          [v10 beginAppearanceTransition:1 animated:0];
        }
      }
      id v12 = [*(id *)(v2 + v8) rootViewController];
      [v12 endAppearanceTransition];
    }
  }
}

void sub_100005CE4(void *a1)
{
  uint64_t v2 = v1;
  static os_log_type_t.default.getter();
  if (qword_100015DF8 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_100008214(0, &qword_100015EE8);
    id v6 = a1;
    char v7 = static NSObject.== infix(_:_:)();

    if (v7)
    {
      static os_log_type_t.default.getter();
      os_log(_:dso:log:_:_:)();
      uint64_t v8 = OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow;
      uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow);
      if (v9)
      {
        id v10 = [v9 rootViewController];
        if (v10)
        {
          id v11 = v10;
          [v10 beginAppearanceTransition:0 animated:0];
        }
      }
      id v12 = [*(id *)(v2 + v8) rootViewController];
      [v12 endAppearanceTransition];
    }
  }
}

id sub_100005F10()
{
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionLowPowerWindow] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyViewController] = 0;
  *(void *)&v0[OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyWindow] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ActivitySceneDelegate();
  return [super init];
}

id sub_100005FD4()
{
  return sub_10000623C(type metadata accessor for ActivitySceneDelegate);
}

uint64_t type metadata accessor for ActivitySceneDelegate()
{
  return self;
}

id sub_100006224()
{
  return sub_10000623C(type metadata accessor for SecureWindow);
}

id sub_10000623C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for SecureWindow()
{
  return self;
}

uint64_t sub_100006298(uint64_t a1, uint64_t a2)
{
  return sub_100006404(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000062B0(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100006328(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000063A8@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000063EC(uint64_t a1, uint64_t a2)
{
  return sub_100006404(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100006404(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100006448()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000649C()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100006510()
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

uint64_t sub_10000659C@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000065E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006610(uint64_t a1)
{
  uint64_t v2 = sub_100008008(&qword_100015F40, type metadata accessor for MRGroupSessionEventOption);
  uint64_t v3 = sub_100008008(&qword_100015F88, type metadata accessor for MRGroupSessionEventOption);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000066CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1000067A0(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100008334((uint64_t)v12, *a3);
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
      sub_100008334((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000082E4((uint64_t)v12);
  return v7;
}

uint64_t sub_1000067A0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000695C(a5, a6);
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

uint64_t sub_10000695C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000069F4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006BD4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006BD4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000069F4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006B6C(v2, 0);
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

void *sub_100006B6C(uint64_t a1, uint64_t a2)
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
  sub_100007FC4(&qword_100015F60);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  void v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006BD4(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007FC4(&qword_100015F60);
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

unint64_t sub_100006D24(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_100006DB8(a1, v2);
}

unint64_t sub_100006DB8(uint64_t a1, uint64_t a2)
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

void sub_100006F30(void *a1)
{
  sub_100007FC4(&qword_100015EF0);
  ((void (*)(void))__chkstk_darwin)();
  v121 = (char *)&v110 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MediaLiveActivityAttributes();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v120 = (char *)&v110 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v110 - v8;
  uint64_t v10 = sub_100007FC4(&qword_100015EF8);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v110 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v110 - v14;
  uint64_t v16 = type metadata accessor for ActivityDescriptor();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v110 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for ActivityScene();
  uint64_t v20 = swift_dynamicCastClass();
  if (!v20) {
    goto LABEL_9;
  }
  uint64_t v116 = v1;
  uint64_t v119 = v5;
  uint64_t v21 = v20;
  swift_getKeyPath();
  id v22 = a1;
  dispatch thunk of ActivityScene.subscript.getter();
  swift_release();
  if (!*((void *)&v124 + 1))
  {

LABEL_9:
    static os_log_type_t.error.getter();
    if (qword_100015DF8 != -1) {
      swift_once();
    }
    os_log(_:dso:log:_:_:)();
    return;
  }
  uint64_t v117 = *((void *)&v124 + 1);
  id v118 = v22;
  v114 = v19;
  v112 = v9;
  uint64_t v23 = v124;
  swift_getKeyPath();
  uint64_t v113 = v21;
  dispatch thunk of ActivityScene.subscript.getter();
  swift_release();
  v24 = (void *)v124;
  if ((void)v124)
  {
    uint64_t v111 = v4;
    v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    uint64_t v26 = 1;
    v25(v13, 1, 1, v16);
    sub_100008008(&qword_100015F00, (void (*)(uint64_t))&type metadata accessor for ActivityDescriptor);
    dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)();

    uint64_t v115 = v17;
    uint64_t v27 = v17;
    uint64_t v28 = v16;
    v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48);
    if (v29(v13, 1, v16) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v15, v13, v16);
      uint64_t v26 = 0;
    }
    v25(v15, v26, 1, v16);
    if (v29(v15, 1, v16) != 1)
    {
      uint64_t v30 = v23;
      (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v114, v15, v16);
      type metadata accessor for JSONDecoder();
      swift_allocObject();
      JSONDecoder.init()();
      uint64_t v31 = ActivityDescriptor.attributesData.getter();
      unint64_t v33 = v32;
      sub_100008008(&qword_100015F08, (void (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes);
      v34 = v121;
      uint64_t v35 = v111;
      dispatch thunk of JSONDecoder.decode<A>(_:from:)();
      sub_100008050(v31, v33);
      swift_release();
      uint64_t v37 = v119;
      (*(void (**)(char *, void, uint64_t, uint64_t))(v119 + 56))(v34, 0, 1, v35);
      v38 = v112;
      (*(void (**)(char *, char *, uint64_t))(v37 + 32))(v112, v34, v35);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      MediaLiveActivityAttributes.subscript.getter();
      swift_bridgeObjectRelease();
      if (!v123)
      {
        __break(1u);
        goto LABEL_44;
      }
      sub_1000080A8(&v122, &v124);
      swift_dynamicCast();
      v39 = (char *)String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      static os_log_type_t.default.getter();
      if (qword_100015DF8 != -1) {
        swift_once();
      }
      sub_100007FC4(&qword_100015F10);
      uint64_t v40 = swift_allocObject();
      *(_OWORD *)(v40 + 16) = xmmword_10000ECE0;
      *(void *)(v40 + 56) = &type metadata for String;
      unint64_t v41 = sub_1000080B8();
      *(void *)(v40 + 64) = v41;
      uint64_t v42 = v117;
      *(void *)(v40 + 32) = v30;
      *(void *)(v40 + 40) = v42;
      uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      *(void *)(v40 + 96) = &type metadata for String;
      *(void *)(v40 + 104) = v41;
      *(void *)(v40 + 72) = v43;
      *(void *)(v40 + 80) = v44;
      os_log(_:dso:log:_:_:)();
      swift_bridgeObjectRelease();
      uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v47 = v46;
      if (v45 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v47 == v48)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_23;
      }
      char v49 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v49)
      {
LABEL_23:
        id v50 = [self mainScreen];
        [v50 bounds];
        CGFloat v52 = v51;
        CGFloat v54 = v53;
        CGFloat v56 = v55;
        CGFloat v58 = v57;

        v126.origin.x = v52;
        v126.origin.y = v54;
        v126.size.width = v56;
        v126.size.height = v58;
        CGRectGetWidth(v126);
        id v59 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
        ActivitySceneMetrics.init(size:cornerRadius:)();
        dispatch thunk of ActivityScene.resolvedMetrics.setter();
        swift_unknownObjectWeakAssign();
        static String._unconditionallyBridgeFromObjectiveC(_:)();
        MediaLiveActivityAttributes.subscript.getter();
        swift_bridgeObjectRelease();
        if (v125)
        {
          if (swift_dynamicCast())
          {
            uint64_t v60 = Data.init(base64Encoded:options:)();
            unint64_t v62 = v61;
            swift_bridgeObjectRelease();
            if (v62 >> 60 != 15)
            {
              v63 = v39;
              id v64 = objc_allocWithZone((Class)MRDiscoveredGroupSession);
              sub_100008168(v60, v62);
              Class isa = Data._bridgeToObjectiveC()().super.isa;
              id v66 = [v64 initWithData:isa];
              sub_1000081C0(v60, v62);

              if (v66)
              {
                uint64_t v67 = swift_allocObject();
                *(void *)(v67 + 16) = v66;
                v68 = (void (**)())((char *)objc_allocWithZone((Class)type metadata accessor for MRUGroupSessionNearbyViewController())
                                  + qword_100016060);
                *v68 = sub_10000820C;
                v68[1] = (void (*)())v67;
                *(void *)&long long v124 = v66;
                id v69 = v66;
                v70 = (void *)UIHostingController.init(rootView:)();
                uint64_t v71 = v116;
                v72 = *(void **)(v116
                               + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyViewController);
                *(void *)(v116
                          + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyViewController) = v70;
                id v73 = v70;

                id v74 = objc_allocWithZone((Class)type metadata accessor for SecureWindow());
                id v75 = [v74 initWithWindowScene:v113];
                [v75 setRootViewController:v73];
                [v75 makeKeyAndVisible];
                v76 = *(void **)(v71
                               + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyWindow);
                *(void *)(v71 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_groupSessionNearbyWindow) = v75;

                sub_1000081C0(v60, v62);
                (*(void (**)(char *, uint64_t))(v119 + 8))(v112, v35);
LABEL_28:
                (*(void (**)(char *, uint64_t))(v115 + 8))(v114, v28);
                return;
              }
              sub_1000081C0(v60, v62);
            }
          }
          goto LABEL_46;
        }
LABEL_44:
        sub_10000810C((uint64_t)&v124, &qword_100015F20);
LABEL_46:
        *(void *)&long long v124 = 0;
        *((void *)&v124 + 1) = 0xE000000000000000;
        _StringGuts.grow(_:)(54);
        v108._object = (void *)0x800000010000E760;
        v108._countAndFlagsBits = 0xD000000000000034;
        String.append(_:)(v108);
        sub_100008008(&qword_100015F28, (void (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes);
        v109._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
        String.append(_:)(v109);
        swift_bridgeObjectRelease();
        _assertionFailure(_:_:file:line:flags:)();
        __break(1u);
        return;
      }
      uint64_t v77 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v79 = v78;
      if (v77 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v79 == v80)
      {
        swift_bridgeObjectRelease_n();
        id v81 = v118;
      }
      else
      {
        char v82 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v81 = v118;
        if ((v82 & 1) == 0)
        {

          (*(void (**)(char *, uint64_t))(v119 + 8))(v38, v35);
          goto LABEL_28;
        }
      }
      v121 = v39;
      swift_unknownObjectWeakAssign();
      id v83 = [self mainScreen];
      [v83 bounds];
      CGFloat v85 = v84;
      CGFloat v87 = v86;
      CGFloat v89 = v88;
      CGFloat v91 = v90;

      v127.origin.x = v85;
      v127.origin.y = v87;
      v127.size.width = v89;
      v127.size.height = v91;
      CGRectGetWidth(v127);
      id v92 = objc_allocWithZone((Class)type metadata accessor for ActivitySceneMetrics());
      ActivitySceneMetrics.init(size:cornerRadius:)();
      dispatch thunk of ActivityScene.resolvedMetrics.setter();
      os_log_type_t v93 = static os_log_type_t.default.getter();
      v94 = qword_100016790;
      uint64_t v96 = v119;
      v95 = v120;
      (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v120, v38, v35);
      if (os_log_type_enabled(v94, v93))
      {
        v97 = (uint8_t *)swift_slowAlloc();
        uint64_t v117 = swift_slowAlloc();
        *(void *)&long long v124 = v117;
        *(_DWORD *)v97 = 136315138;
        v110 = v97 + 4;
        sub_100008008(&qword_100015F28, (void (*)(uint64_t))&type metadata accessor for MediaLiveActivityAttributes);
        uint64_t v98 = dispatch thunk of CustomStringConvertible.description.getter();
        *(void *)&long long v122 = sub_1000066CC(v98, v99, (uint64_t *)&v124);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v100 = *(void (**)(char *, uint64_t))(v96 + 8);
        v100(v95, v35);
        _os_log_impl((void *)&_mh_execute_header, v94, v93, ">>+ vs attrs are %s", v97, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        id v81 = v118;
        swift_slowDealloc();
      }
      else
      {
        v100 = *(void (**)(char *, uint64_t))(v96 + 8);
        v100(v95, v35);
      }
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      MediaLiveActivityAttributes.subscript.getter();
      swift_bridgeObjectRelease();
      uint64_t v101 = v116;
      v102 = v121;
      if (v125)
      {
        if (swift_dynamicCast())
        {
          NSString v103 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
LABEL_41:
          id v104 = [objc_allocWithZone((Class)MRURouteRecommendationPlatterViewController) initWithRouteIdentifier:v103];

          id v105 = objc_allocWithZone((Class)type metadata accessor for SecureWindow());
          id v106 = [v105 initWithWindowScene:v113];
          [v106 setRootViewController:v104];
          [v106 makeKeyAndVisible];
          v107 = *(void **)(v101
                          + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow);
          *(void *)(v101 + OBJC_IVAR____TtC20MediaRemoteUIService21ActivitySceneDelegate_routeRecommendationWindow) = v106;

          v100(v38, v35);
          goto LABEL_28;
        }
      }
      else
      {
        sub_10000810C((uint64_t)&v124, &qword_100015F20);
      }
      NSString v103 = 0;
      goto LABEL_41;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56))(v15, 1, 1, v16);
  }
  swift_bridgeObjectRelease();
  sub_10000810C((uint64_t)v15, &qword_100015EF8);
  static os_log_type_t.error.getter();
  id v36 = v118;
  if (qword_100015DF8 != -1) {
    swift_once();
  }
  os_log(_:dso:log:_:_:)();
}

uint64_t sub_100007FC4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008008(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100008050(uint64_t a1, unint64_t a2)
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

_OWORD *sub_1000080A8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_1000080B8()
{
  unint64_t result = qword_100015F18;
  if (!qword_100015F18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100015F18);
  }
  return result;
}

uint64_t sub_10000810C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007FC4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100008168(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000081C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100008050(a1, a2);
  }
  return a1;
}

uint64_t sub_1000081D4()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000820C()
{
  sub_10000535C(*(void **)(v0 + 16));
}

uint64_t sub_100008214(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for MRGroupSessionEventOption(uint64_t a1)
{
}

uint64_t sub_100008264(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008274()
{
  return swift_release();
}

uint64_t sub_10000827C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FC4(&qword_100015F58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000082E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100008334(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008394()
{
  return sub_100008008(&qword_100015F70, type metadata accessor for MRGroupSessionEventOption);
}

uint64_t sub_1000083DC()
{
  return sub_100008008(&qword_100015F78, type metadata accessor for MRGroupSessionEventOption);
}

uint64_t sub_100008424()
{
  return sub_100008008(&qword_100015F80, type metadata accessor for MRGroupSessionEventOption);
}

void type metadata accessor for MRGroupSessionRouteType(uint64_t a1)
{
}

void sub_100008480(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t type metadata accessor for MRUGroupSessionNearbyViewController()
{
  uint64_t result = qword_100016068;
  if (!qword_100016068) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100008514()
{
  return swift_initClassMetadata2();
}

uint64_t sub_100008564@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100007FC4(&qword_1000160B8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100007FC4(&qword_1000160C0);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)uint64_t v6 = static VerticalAlignment.center.getter();
  *((void *)v6 + 1) = 0x4028000000000000;
  v6[16] = 0;
  uint64_t v11 = sub_100007FC4(&qword_1000160C8);
  sub_100008708(a1, (uint64_t)&v6[*(int *)(v11 + 44)]);
  LOBYTE(a1) = static Edge.Set.all.getter();
  sub_100009548((uint64_t)v6, (uint64_t)v10, &qword_1000160B8);
  uint64_t v12 = &v10[*(int *)(v8 + 44)];
  *uint64_t v12 = (char)a1;
  *(_OWORD *)(v12 + 8) = 0u;
  *(_OWORD *)(v12 + 24) = 0u;
  v12[40] = 1;
  sub_10000810C((uint64_t)v6, &qword_1000160B8);
  static Alignment.center.getter();
  sub_100008DCC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, a2, 0.0, 1, 0.0, 1);
  return sub_10000810C((uint64_t)v10, &qword_1000160C0);
}

uint64_t sub_100008708@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v3 = type metadata accessor for GroupSessionRouteView();
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3);
  uint64_t v6 = (uint64_t *)((char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_100007FC4(&qword_1000160D8);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100007FC4(&qword_1000160E0);
  uint64_t v12 = v11 - 8;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v44 - v16;
  id v18 = [a1 hostInfo];
  unsigned __int8 v19 = [v18 routeType];

  *uint64_t v6 = swift_getKeyPath();
  sub_100007FC4(&qword_1000160E8);
  swift_storeEnumTagMultiPayload();
  uint64_t v20 = *(int *)(v4 + 28);
  *(void *)&long long v55 = 0;
  sub_100007FC4(&qword_1000160F0);
  State.init(wrappedValue:)();
  *(_OWORD *)((char *)v6 + v20) = v48;
  *((unsigned char *)v6 + *(int *)(v4 + 32)) = v19;
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_100009420((uint64_t)v6, (uint64_t)v10);
  uint64_t v21 = &v10[*(int *)(v8 + 44)];
  long long v22 = v56;
  *(_OWORD *)uint64_t v21 = v55;
  *((_OWORD *)v21 + 1) = v22;
  *((_OWORD *)v21 + 2) = v57;
  sub_100009484((uint64_t)v6);
  LOBYTE(v20) = static Edge.Set.trailing.getter();
  EdgeInsets.init(_all:)();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  sub_100009548((uint64_t)v10, (uint64_t)v15, &qword_1000160D8);
  uint64_t v31 = &v15[*(int *)(v12 + 44)];
  *uint64_t v31 = v20;
  *((void *)v31 + 1) = v24;
  *((void *)v31 + 2) = v26;
  *((void *)v31 + 3) = v28;
  *((void *)v31 + 4) = v30;
  v31[40] = 0;
  sub_10000810C((uint64_t)v10, &qword_1000160D8);
  uint64_t v46 = v15;
  uint64_t v45 = v17;
  sub_1000094E0((uint64_t)v15, (uint64_t)v17);
  uint64_t v44 = static HorizontalAlignment.leading.getter();
  sub_100008AE8(a1, (uint64_t)&v48);
  long long v32 = v48;
  char v33 = v49;
  uint64_t v35 = v50;
  uint64_t v34 = v51;
  uint64_t v36 = v52;
  LOBYTE(v6) = v53;
  uint64_t v37 = v54;
  sub_100009548((uint64_t)v17, (uint64_t)v15, &qword_1000160E0);
  uint64_t v38 = (uint64_t)v15;
  uint64_t v39 = v47;
  sub_100009548(v38, v47, &qword_1000160E0);
  uint64_t v40 = sub_100007FC4(&qword_1000160F8);
  uint64_t v41 = v39 + *(int *)(v40 + 48);
  *(void *)uint64_t v41 = v44;
  *(void *)(v41 + 8) = 0;
  *(unsigned char *)(v41 + 16) = 1;
  *(_OWORD *)(v41 + 24) = v32;
  *(unsigned char *)(v41 + 40) = v33;
  *(void *)(v41 + 48) = v35;
  *(void *)(v41 + 56) = v34;
  *(void *)(v41 + 64) = v36;
  *(unsigned char *)(v41 + 72) = (_BYTE)v6;
  *(void *)(v41 + 80) = v37;
  uint64_t v42 = v39 + *(int *)(v40 + 64);
  *(void *)uint64_t v42 = 0;
  *(unsigned char *)(v42 + 8) = 1;
  sub_1000095AC(v32, *((uint64_t *)&v32 + 1), v33);
  swift_bridgeObjectRetain();
  sub_1000095AC(v34, v36, (char)v6);
  swift_bridgeObjectRetain();
  sub_10000810C((uint64_t)v45, &qword_1000160E0);
  sub_1000095BC(v32, *((uint64_t *)&v32 + 1), v33);
  swift_bridgeObjectRelease();
  sub_1000095BC(v34, v36, (char)v6);
  swift_bridgeObjectRelease();
  return sub_10000810C((uint64_t)v46, &qword_1000160E0);
}

uint64_t sub_100008AE8@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for LocalizedStringKey.StringInterpolation();
  __chkstk_darwin(v4 - 8);
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
  v5._countAndFlagsBits = 0x616C506572616853;
  v5._object = (void *)0xEF20687469772079;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v5);
  id v6 = [a1 hostInfo];
  id v7 = [v6 displayName];

  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;

  v11._countAndFlagsBits = v8;
  v11._object = v10;
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v11);
  swift_bridgeObjectRelease();
  v12._countAndFlagsBits = 0;
  v12._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v12);
  LocalizedStringKey.init(stringInterpolation:)();
  uint64_t v13 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v15 = v14;
  char v17 = v16 & 1;
  uint64_t v18 = Text.bold()();
  uint64_t v35 = v19;
  uint64_t v36 = v18;
  char v21 = v20;
  uint64_t v37 = v22;
  sub_1000095BC(v13, v15, v17);
  swift_bridgeObjectRelease();
  LOBYTE(v13) = v21 & 1;
  LocalizedStringKey.init(stringLiteral:)();
  uint64_t v23 = Text.init(_:tableName:bundle:comment:)();
  uint64_t v25 = v24;
  char v27 = v26 & 1;
  static HierarchicalShapeStyle.secondary.getter();
  uint64_t v28 = Text.foregroundStyle<A>(_:)();
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  LOBYTE(v7) = v33 & 1;
  sub_1000095BC(v23, v25, v27);
  swift_bridgeObjectRelease();
  *(void *)a2 = v36;
  *(void *)(a2 + 8) = v35;
  *(unsigned char *)(a2 + 16) = v13;
  *(void *)(a2 + 24) = v37;
  *(void *)(a2 + 32) = v28;
  *(void *)(a2 + 40) = v30;
  *(unsigned char *)(a2 + 48) = (_BYTE)v7;
  *(void *)(a2 + 56) = v32;
  sub_1000095AC(v36, v35, v13);
  swift_bridgeObjectRetain();
  sub_1000095AC(v28, v30, (char)v7);
  swift_bridgeObjectRetain();
  sub_1000095BC(v28, v30, (char)v7);
  swift_bridgeObjectRelease();
  sub_1000095BC(v36, v35, v13);
  return swift_bridgeObjectRelease();
}

__n128 sub_100008DCC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    uint64_t v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  sub_100009548(v13, a9, &qword_1000160C0);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_100007FC4(&qword_1000160D0) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  _OWORD *v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  v24[3] = v29;
  return result;
}

uint64_t sub_100008F94()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100008FB0@<X0>(uint64_t a1@<X8>)
{
  return sub_100008564(*v1, a1);
}

uint64_t sub_100008FB8()
{
  return 1;
}

void sub_100008FC0()
{
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for MRUGroupSessionNearbyViewController();
  [super viewDidLoad];
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_6;
  }
  uint64_t v2 = v1;
  id v3 = [self clearColor];
  [v2 setBackgroundColor:v3];

  id v4 = [v0 view];
  if (!v4)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  Swift::String v5 = v4;
  id v6 = [objc_allocWithZone((Class)UITapGestureRecognizer) initWithTarget:v0 action:"handleTap:"];
  [v5 addGestureRecognizer:v6];

  id v7 = [v0 view];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = [v7 layer];

    [v9 setHitTestsAsOpaque:1];
    return;
  }
LABEL_7:
  __break(1u);
}

void sub_100009128(void *a1)
{
  id v1 = a1;
  sub_100008FC0();
}

void sub_100009170()
{
}

void sub_1000091CC(char *a1, uint64_t a2, void *a3)
{
  id v4 = *(void (**)(void))&a1[qword_100016060];
  id v5 = a3;
  id v6 = a1;
  v4();
}

uint64_t sub_10000923C()
{
  return swift_release();
}

id sub_100009250()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MRUGroupSessionNearbyViewController();
  return [super dealloc];
}

uint64_t sub_100009288()
{
  return swift_release();
}

void sub_10000929C()
{
}

void sub_1000092CC()
{
}

uint64_t sub_1000092FC()
{
  return type metadata accessor for MRUGroupSessionNearbyViewController();
}

ValueMetadata *type metadata accessor for MRUGroupSessionNearbyView()
{
  return &type metadata for MRUGroupSessionNearbyView;
}

uint64_t sub_100009314(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10000F374, 1);
}

uint64_t sub_100009330()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100009354(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100009420(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupSessionRouteView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009484(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for GroupSessionRouteView();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000094E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FC4(&qword_1000160E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100009548(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100007FC4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000095AC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000095BC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1000095CC()
{
  return sub_100009688(&qword_100016100, &qword_1000160D0, (void (*)(void))sub_100009658);
}

uint64_t sub_100009610(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100009658()
{
  return sub_100009688(&qword_100016108, &qword_1000160C0, (void (*)(void))sub_100009704);
}

uint64_t sub_100009688(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100009610(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100009704()
{
  unint64_t result = qword_100016110;
  if (!qword_100016110)
  {
    sub_100009610(&qword_1000160B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100016110);
  }
  return result;
}

id sub_1000097A0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

void *sub_1000097F8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a1;
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    uint64_t v4 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_100007FC4(&qword_1000160E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *uint64_t v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = *(int *)(a3 + 24);
    Swift::String v11 = (void *)((char *)v4 + v9);
    Swift::String v12 = (char *)a2 + v9;
    uint64_t v13 = *(void **)v12;
    uint64_t v14 = *((void *)v12 + 1);
    *Swift::String v11 = *(void *)v12;
    v11[1] = v14;
    *((unsigned char *)v4 + v10) = *((unsigned char *)a2 + v10);
    id v15 = v13;
  }
  swift_retain();
  return v4;
}

uint64_t sub_10000992C(uint64_t a1, uint64_t a2)
{
  sub_100007FC4(&qword_1000160E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }

  return swift_release();
}

void *sub_1000099D8(void *a1, void *a2, uint64_t a3)
{
  sub_100007FC4(&qword_1000160E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v6 = type metadata accessor for ColorScheme();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (void *)((char *)a1 + v7);
  uint64_t v10 = (char *)a2 + v7;
  Swift::String v11 = *(void **)v10;
  uint64_t v12 = *((void *)v10 + 1);
  void *v9 = *(void *)v10;
  v9[1] = v12;
  *((unsigned char *)a1 + v8) = *((unsigned char *)a2 + v8);
  id v13 = v11;
  swift_retain();
  return a1;
}

void *sub_100009AC0(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100009BDC((uint64_t)a1);
    sub_100007FC4(&qword_1000160E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v6 = type metadata accessor for ColorScheme();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)((char *)a1 + v7);
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void **)((char *)a1 + v7);
  Swift::String v11 = *(void **)((char *)a2 + v7);
  *uint64_t v8 = v11;
  id v12 = v11;

  v8[1] = *((void *)v9 + 1);
  swift_retain();
  swift_release();
  *((unsigned char *)a1 + *(int *)(a3 + 24)) = *((unsigned char *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100009BDC(uint64_t a1)
{
  uint64_t v2 = sub_100007FC4(&qword_1000160E8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_100009C3C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_100007FC4(&qword_1000160E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v7 = type metadata accessor for ColorScheme();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  uint64_t v8 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  a1[v8] = a2[v8];
  return a1;
}

char *sub_100009D18(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100009BDC((uint64_t)a1);
    uint64_t v6 = sub_100007FC4(&qword_1000160E8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
    }
  }
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = &a1[v8];
  uint64_t v10 = &a2[v8];
  Swift::String v11 = *(void **)&a1[v8];
  *(void *)uint64_t v9 = *(void *)v10;

  *((void *)v9 + 1) = *((void *)v10 + 1);
  swift_release();
  a1[*(int *)(a3 + 24)] = a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_100009E30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009E44);
}

uint64_t sub_100009E44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100007FC4(&qword_1000161C8);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    int v11 = v10 - 1;
    if (v11 < 0) {
      int v11 = -1;
    }
    return (v11 + 1);
  }
}

uint64_t sub_100009F14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009F28);
}

uint64_t sub_100009F28(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100007FC4(&qword_1000161C8);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = a2;
  }
  return result;
}

uint64_t type metadata accessor for GroupSessionRouteView()
{
  uint64_t result = qword_100016228;
  if (!qword_100016228) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000A034()
{
  sub_10000A0D8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10000A0D8()
{
  if (!qword_100016238)
  {
    type metadata accessor for ColorScheme();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100016238);
    }
  }
}

uint64_t sub_10000A130(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10000F3F0, 1);
}

void sub_10000A14C()
{
  qword_1000161B0 = 0x4036000000000000;
}

void sub_10000A15C()
{
  qword_1000161B8 = 0x4024000000000000;
}

void sub_10000A16C()
{
  qword_1000161C0 = 0x4014000000000000;
}

uint64_t sub_10000A17C@<X0>(_OWORD *a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for _TaskModifier();
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (uint64_t *)((char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = type metadata accessor for TaskPriority();
  uint64_t v29 = *(void *)(v8 - 8);
  uint64_t v30 = v8;
  __chkstk_darwin(v8);
  unint64_t v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for GroupSessionRouteView();
  uint64_t v28 = *(void *)(v11 - 8);
  uint64_t v12 = *(void *)(v28 + 64);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = static Alignment.bottomTrailing.getter();
  uint64_t v15 = v14;
  sub_10000A4B4(v2, (uint64_t)v31);
  long long v39 = v31[6];
  long long v40 = v31[7];
  long long v41 = v31[8];
  long long v35 = v31[2];
  long long v36 = v31[3];
  long long v38 = v31[5];
  long long v37 = v31[4];
  long long v34 = v31[1];
  long long v33 = v31[0];
  *(void *)&long long v32 = v13;
  *((void *)&v32 + 1) = v15;
  sub_10000B224(v2, (uint64_t)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(void))type metadata accessor for GroupSessionRouteView);
  unint64_t v16 = (*(unsigned __int8 *)(v28 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80);
  uint64_t v17 = swift_allocObject();
  sub_10000B000((uint64_t)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  static TaskPriority.userInitiated.getter();
  uint64_t v18 = (char *)v7 + *(int *)(v5 + 28);
  uint64_t v20 = v29;
  uint64_t v19 = v30;
  (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v18, v10, v30);
  *uint64_t v7 = &unk_100016278;
  v7[1] = v17;
  uint64_t v21 = sub_100007FC4(&qword_100016280);
  sub_10000B224((uint64_t)v7, (uint64_t)a1 + *(int *)(v21 + 36), (uint64_t (*)(void))&type metadata accessor for _TaskModifier);
  long long v22 = v39;
  a1[6] = v38;
  a1[7] = v22;
  long long v23 = v41;
  a1[8] = v40;
  a1[9] = v23;
  long long v24 = v35;
  a1[2] = v34;
  a1[3] = v24;
  long long v25 = v37;
  a1[4] = v36;
  a1[5] = v25;
  long long v26 = v33;
  *a1 = v32;
  a1[1] = v26;
  sub_10000B28C((uint64_t)&v32);
  sub_10000B2D8((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v19);
  return sub_10000B334((uint64_t)v31);
}

uint64_t sub_10000A4B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v25 = a1;
  uint64_t v3 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v29 = *(void *)(v3 - 8);
  uint64_t v30 = v3;
  __chkstk_darwin(v3);
  uint64_t v28 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Image.ResizingMode();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for GroupSessionRouteView();
  id v10 = (id)MRGroupCompositionForMRGroupSessionRouteType();
  id v11 = [self symbolNameForComposition:v10];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  Image.init(_internalSystemName:)();
  uint64_t v12 = enum case for Image.ResizingMode.stretch(_:);
  uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v13(v8, enum case for Image.ResizingMode.stretch(_:), v5);
  uint64_t v27 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v6 + 8);
  v14(v8, v5);
  int v26 = static HierarchicalShapeStyle.secondary.getter();
  long long v35 = *(_OWORD *)(v25 + *(int *)(v9 + 20));
  sub_100007FC4(&qword_100016288);
  State.wrappedValue.getter();
  if (!v34) {
    [objc_allocWithZone((Class)UIImage) init];
  }
  Image.init(uiImage:)();
  v13(v8, v12, v5);
  uint64_t v15 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  v14(v8, v5);
  if (qword_100015DE0 != -1) {
    swift_once();
  }
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v16 = v35;
  char v17 = BYTE8(v35);
  uint64_t v18 = v36;
  char v19 = v37;
  uint64_t v20 = v38;
  uint64_t v21 = v39;
  if (qword_100015DE8 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_1000161B8;
  if (qword_100015DF0 != -1) {
    swift_once();
  }
  uint64_t v23 = qword_1000161C0;
  (*(void (**)(char *, void, uint64_t))(v29 + 104))(v28, enum case for Color.RGBColorSpace.sRGBLinear(_:), v30);
  uint64_t result = Color.init(_:white:opacity:)();
  *(_DWORD *)(a2 + 42) = v32;
  *(_WORD *)(a2 + 46) = v33;
  *(_DWORD *)(a2 + 57) = v34;
  *(_DWORD *)(a2 + 60) = *(_DWORD *)((char *)&v34 + 3);
  *(_DWORD *)(a2 + 76) = *(_DWORD *)&v31[3];
  *(_DWORD *)(a2 + 73) = *(_DWORD *)v31;
  *(void *)a2 = v27;
  *(void *)(a2 + 8) = 0;
  *(_WORD *)(a2 + 16) = 1;
  *(_DWORD *)(a2 + 20) = v26;
  *(void *)(a2 + 24) = v15;
  *(void *)(a2 + 32) = 0;
  *(_WORD *)(a2 + 40) = 1;
  *(void *)(a2 + 48) = v16;
  *(unsigned char *)(a2 + 56) = v17;
  *(void *)(a2 + 64) = v18;
  *(unsigned char *)(a2 + 72) = v19;
  *(void *)(a2 + 80) = v20;
  *(void *)(a2 + 88) = v21;
  *(void *)(a2 + 96) = v22;
  *(void *)(a2 + 104) = v22;
  *(void *)(a2 + 112) = result;
  *(void *)(a2 + 120) = v23;
  *(void *)(a2 + 128) = 0;
  *(void *)(a2 + 136) = 0;
  return result;
}

uint64_t sub_10000A920(uint64_t a1)
{
  v1[22] = a1;
  uint64_t v2 = type metadata accessor for ColorScheme();
  v1[23] = v2;
  v1[24] = *(void *)(v2 - 8);
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[27] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[28] = v4;
  v1[29] = v3;
  return _swift_task_switch(sub_10000AA24, v4, v3);
}

uint64_t sub_10000AA24()
{
  uint64_t v1 = *(void *)(v0 + 176);
  uint64_t v2 = *(int *)(type metadata accessor for GroupSessionRouteView() + 20);
  *(_DWORD *)(v0 + 264) = v2;
  *(_OWORD *)(v0 + 120) = *(_OWORD *)(v1 + v2);
  *(void *)(v0 + 240) = sub_100007FC4(&qword_100016288);
  State.wrappedValue.getter();
  uint64_t v3 = *(void **)(v0 + 152);

  if (v3)
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
    return v4();
  }
  else
  {
    uint64_t v7 = *(void *)(v0 + 200);
    uint64_t v6 = *(void *)(v0 + 208);
    uint64_t v8 = *(void *)(v0 + 184);
    uint64_t v9 = *(void *)(v0 + 192);
    id v10 = [self sharedAssetsProvider];
    *(void *)(v0 + 248) = v10;
    NSString v11 = String._bridgeToObjectiveC()();
    *(void *)(v0 + 256) = v11;
    sub_10000B380(v6);
    (*(void (**)(uint64_t, void, uint64_t))(v9 + 104))(v7, enum case for ColorScheme.dark(_:), v8);
    uint64_t v12 = static ColorScheme.== infix(_:_:)();
    uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v13(v7, v8);
    v13(v6, v8);
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 160;
    *(void *)(v0 + 24) = sub_10000ACB4;
    uint64_t v14 = swift_continuation_init();
    *(void *)(v0 + 80) = _NSConcreteStackBlock;
    *(void *)(v0 + 88) = 0x40000000;
    *(void *)(v0 + 96) = sub_10000AE74;
    *(void *)(v0 + 104) = &unk_100010C50;
    *(void *)(v0 + 112) = v14;
    [v10 applicationIconForBundleIdentifier:v11 appearance:v12 & 1];
    return _swift_continuation_await(v0 + 16);
  }
}

uint64_t sub_10000ACB4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 232);
  uint64_t v2 = *(void *)(*(void *)v0 + 224);
  return _swift_task_switch(sub_10000ADBC, v2, v1);
}

uint64_t sub_10000ADBC()
{
  uint64_t v2 = *(void **)(v0 + 248);
  uint64_t v1 = *(void **)(v0 + 256);
  uint64_t v3 = *(int *)(v0 + 264);
  uint64_t v4 = *(void *)(v0 + 176);
  swift_release();
  uint64_t v5 = *(void *)(v0 + 160);
  *(_OWORD *)(v0 + 136) = *(_OWORD *)(v4 + v3);
  *(void *)(v0 + 168) = v5;
  State.wrappedValue.setter();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_10000AE74(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v6 = a2;
  uint64_t v3 = *(void *)(*(void *)(v2 + 64) + 40);
  id v4 = a2;
  sub_10000B634((uint64_t)&v6, v3);
  return swift_continuation_resume();
}

uint64_t sub_10000AED4()
{
  uint64_t v1 = type metadata accessor for GroupSessionRouteView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_100007FC4(&qword_1000160E8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }

  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_10000B000(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for GroupSessionRouteView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B064()
{
  uint64_t v2 = *(void *)(type metadata accessor for GroupSessionRouteView() - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10000B130;
  return sub_10000A920(v3);
}

uint64_t sub_10000B130()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000B224(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B28C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B2D8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for _TaskModifier();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B334(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000B380@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100007FC4(&qword_1000160E8);
  __chkstk_darwin(v8);
  id v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B69C(v2, (uint64_t)v10);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v11 = type metadata accessor for ColorScheme();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    os_log_type_t v13 = static os_log_type_t.fault.getter();
    uint64_t v14 = static Log.runtimeIssuesLog.getter();
    os_log_type_t v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)uint64_t v16 = 136315138;
      v18[2] = sub_1000066CC(0x686353726F6C6F43, 0xEB00000000656D65, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_10000B634(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FC4(&qword_1000160F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B69C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100007FC4(&qword_1000160E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B708()
{
  unint64_t result = qword_100016290;
  if (!qword_100016290)
  {
    sub_100009610(&qword_100016280);
    sub_10000B784();
    sub_10000B7E0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100016290);
  }
  return result;
}

unint64_t sub_10000B784()
{
  unint64_t result = qword_100016298;
  if (!qword_100016298)
  {
    sub_100009610(&qword_1000162A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100016298);
  }
  return result;
}

unint64_t sub_10000B7E0()
{
  unint64_t result = qword_1000162A8;
  if (!qword_1000162A8)
  {
    type metadata accessor for _TaskModifier();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000162A8);
  }
  return result;
}

uint64_t sub_10000B838()
{
  sub_10000B88C();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_100016790 = result;
  return result;
}

unint64_t sub_10000B88C()
{
  unint64_t result = qword_1000162B0;
  if (!qword_1000162B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000162B0);
  }
  return result;
}

uint64_t sub_10000B8CC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return dispatch thunk of JSONDecoder.decode<A>(_:from:)();
}

uint64_t JSONDecoder.init()()
{
  return JSONDecoder.init()();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return type metadata accessor for JSONDecoder();
}

uint64_t Data.init(base64Encoded:options:)()
{
  return Data.init(base64Encoded:options:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t ActivityDescriptor.attributesData.getter()
{
  return ActivityDescriptor.attributesData.getter();
}

uint64_t type metadata accessor for ActivityDescriptor()
{
  return type metadata accessor for ActivityDescriptor();
}

uint64_t type metadata accessor for MediaLiveActivityAttributes()
{
  return type metadata accessor for MediaLiveActivityAttributes();
}

uint64_t MediaLiveActivityAttributes.subscript.getter()
{
  return MediaLiveActivityAttributes.subscript.getter();
}

uint64_t ActivitySceneMetrics.init(size:cornerRadius:)()
{
  return ActivitySceneMetrics.init(size:cornerRadius:)();
}

uint64_t type metadata accessor for ActivitySceneMetrics()
{
  return type metadata accessor for ActivitySceneMetrics();
}

uint64_t dispatch thunk of ActivityScene.subscript.getter()
{
  return dispatch thunk of ActivityScene.subscript.getter();
}

uint64_t dispatch thunk of ActivityScene.resolvedMetrics.setter()
{
  return dispatch thunk of ActivityScene.resolvedMetrics.setter();
}

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
}

uint64_t SceneSettingScopes.ActivitySettings.activityDescriptor.getter()
{
  return SceneSettingScopes.ActivitySettings.activityDescriptor.getter();
}

uint64_t SceneSettingScopes.ActivitySettings.activityIdentifier.getter()
{
  return SceneSettingScopes.ActivitySettings.activityIdentifier.getter();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t static ColorScheme.== infix(_:_:)()
{
  return static ColorScheme.== infix(_:_:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t type metadata accessor for _TaskModifier()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(Swift::String a1)
{
}

Swift::Void __swiftcall LocalizedStringKey.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for LocalizedStringKey.StringInterpolation()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t LocalizedStringKey.init(stringInterpolation:)()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t static HorizontalAlignment.leading.getter()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t static HierarchicalShapeStyle.secondary.getter()
{
  return static HierarchicalShapeStyle.secondary.getter();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t Text.foregroundStyle<A>(_:)()
{
  return Text.foregroundStyle<A>(_:)();
}

uint64_t Text.bold()()
{
  return Text.bold()();
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

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t Color.init(_:white:opacity:)()
{
  return Color.init(_:white:opacity:)();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.init(_internalSystemName:)()
{
  return Image.init(_internalSystemName:)();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t static Alignment.bottomTrailing.getter()
{
  return static Alignment.bottomTrailing.getter();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
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

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
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

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
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

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return dispatch thunk of static _ObjectiveCBridgeable._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t MRGroupCompositionForMRGroupSessionRouteType()
{
  return _MRGroupCompositionForMRGroupSessionRouteType();
}

uint64_t MRGroupSessionSendEvent()
{
  return _MRGroupSessionSendEvent();
}

uint64_t MRSetUIServiceRelayEndpoint()
{
  return _MRSetUIServiceRelayEndpoint();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSCreateOpenApplicationService()
{
  return _SBSCreateOpenApplicationService();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_storeStrong(id *location, id obj)
{
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_continuation_resume()
{
  return _swift_continuation_resume();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
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

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return _[a1 anonymousListener];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return [a1 openApplication:withOptions:completion:];
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return [a1 optionsWithDictionary:];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}