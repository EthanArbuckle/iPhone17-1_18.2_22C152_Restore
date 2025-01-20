uint64_t sub_1000024C8()
{
  return 1;
}

id sub_100002560(int a1, id a2)
{
  id v2 = [a2 role];
  id v3 = objc_allocWithZone((Class)UISceneConfiguration);
  return sub_100002824(0xD000000000000015, 0x80000001000135C0, v2);
}

id sub_1000026D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super init];
}

void sub_10000272C()
{
  type metadata accessor for AppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v1 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v1) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v1);
}

id sub_1000027B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

id sub_100002824(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  id v6 = [v3 initWithName:v5 sessionRole:a3];

  return v6;
}

unint64_t sub_100002894()
{
  unint64_t result = qword_10001E2A0;
  if (!qword_10001E2A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001E2A0);
  }
  return result;
}

void type metadata accessor for LaunchOptionsKey()
{
  if (!qword_10001E2B8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001E2B8);
    }
  }
}

uint64_t sub_100002920()
{
  return sub_100002A58(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100002950()
{
  return sub_100002958();
}

uint64_t sub_100002958()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000029AC()
{
  return sub_1000029B4();
}

Swift::Int sub_1000029B4()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100002A28()
{
  return sub_100002A58(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100002A58(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100002A9C(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100002B18(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_100002B98@<X0>(void *a1@<X8>)
{
  NSString result = sub_100002BC0();
  *a1 = result;
  return result;
}

NSString sub_100002BC0()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v0 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100002BF8()
{
  return sub_100004EEC();
}

uint64_t sub_100002C04@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100002C4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100002C7C(uint64_t a1)
{
  uint64_t v2 = sub_100002E10(&qword_10001E2B0, (void (*)(uint64_t))type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_100002E10(&qword_10001E2D8, (void (*)(uint64_t))type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100002D38()
{
  return sub_100002E10(&qword_10001E2C0, (void (*)(uint64_t))type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100002D80()
{
  return sub_100002E10(&qword_10001E2C8, (void (*)(uint64_t))type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100002DC8()
{
  return sub_100002E10(&qword_10001E2D0, (void (*)(uint64_t))type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100002E10(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100002E58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  URL.scheme.getter();
  if (!v6) {
    return 0;
  }
  char v7 = sub_100003594();
  swift_bridgeObjectRelease();
  if ((v7 & 1) == 0) {
    return 1;
  }
  uint64_t v8 = sub_1000032BC(a1, a2, a3);
  uint64_t v9 = sub_100002EF8(v8);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_100002EF8(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100003650(&qword_10001E410);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  if (!v5) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v9 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  unint64_t v10 = v9 | (v8 << 6);
  while (1)
  {
    v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    sub_100003AC8(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(void *)&long long v39 = v17;
    *((void *)&v39 + 1) = v16;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v17;
    *((void *)&v37[0] + 1) = v16;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10000382C(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_10000382C(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_10000382C(v36, v37);
    sub_10000382C(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v18 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)]) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v20];
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)])) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v21 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v21;
    uint64_t v26 = v2[6] + 40 * v21;
    *(_OWORD *)uint64_t v26 = v29;
    *(_OWORD *)(v26 + 16) = v30;
    *(void *)(v26 + 32) = v31;
    uint64_t result = (uint64_t)sub_10000382C(&v33, (_OWORD *)(v2[7] + 32 * v21));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v28 + 8 * v13);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v5 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
    int64_t v8 = v13;
  }
  int64_t v14 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_36:
    swift_release();
    sub_100003B24();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v14);
  if (v12)
  {
    int64_t v13 = v8 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v13 = v14 + 1;
    if (__OFADD__(v14, 1)) {
      break;
    }
    if (v13 >= v27) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1000032BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100003650(&qword_10001E3F8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100012E70;
  strcpy((char *)(inited + 32), "nativeHandling");
  *(unsigned char *)(inited + 47) = -18;
  uint64_t v6 = URL.scheme.getter();
  char v8 = sub_1000034F8(v6, v7);
  swift_bridgeObjectRelease();
  *(unsigned char *)(inited + 48) = v8 & 1;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(void *)(inited + 80) = 0x656372756F73;
  *(void *)(inited + 88) = 0xE600000000000000;
  *(void *)(inited + 96) = 0xD000000000000018;
  *(void *)(inited + 104) = 0x8000000100012E60;
  *(void *)(inited + 120) = &type metadata for String;
  *(void *)(inited + 128) = 0x707954746E657665;
  *(void *)(inited + 136) = 0xE900000000000065;
  *(void *)(inited + 144) = 1802398060;
  *(void *)(inited + 152) = 0xE400000000000000;
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 176) = 7107189;
  *(void *)(inited + 184) = 0xE300000000000000;
  uint64_t v9 = URL.absoluteString.getter();
  *(void *)(inited + 216) = &type metadata for String;
  *(void *)(inited + 192) = v9;
  *(void *)(inited + 200) = v10;
  uint64_t v14 = Dictionary.init(dictionaryLiteral:)();
  if (a3)
  {
    *((void *)&v13 + 1) = &type metadata for String;
    *(void *)&long long v12 = a2;
    *((void *)&v12 + 1) = a3;
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  swift_bridgeObjectRetain();
  sub_100003474((uint64_t)&v12, 0x7250656372756F73, 0xED0000737365636FLL);
  return v14;
}

uint64_t sub_100003474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_10000382C((_OWORD *)a1, v6);
    sub_10000383C(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_100003694(a1);
    sub_1000036F4(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_100003694((uint64_t)v6);
  }
}

uint64_t sub_1000034F8(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0;
  }
  sub_100003B78();
  BOOL v5 = v5 && v4 == 0xE600000000000000;
  if (v5) {
    return 0;
  }
  char v6 = sub_100003B2C();
  uint64_t result = 0;
  if ((v6 & 1) == 0)
  {
    if (a1 == 0x69752D736D61 && a2 == 0xE600000000000000)
    {
      return 1;
    }
    else
    {
      sub_100003B58();
      return _stringCompareWithSmolCheck(_:_:expecting:)();
    }
  }
  return result;
}

uint64_t sub_100003594()
{
  sub_100003B78();
  BOOL v2 = v2 && v1 == 0xE600000000000000;
  if (v2) {
    return 1;
  }
  uint64_t v3 = v1;
  uint64_t v4 = v0;
  char v5 = sub_100003B2C();
  BOOL v6 = v4 == 0x69752D736D61 && v3 == 0xE600000000000000;
  BOOL v7 = v6;
  if ((v5 & 1) != 0 || v7) {
    return 1;
  }
  sub_100003B58();

  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000361C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for EngagementDeepLinkController()
{
  return self;
}

uint64_t sub_100003650(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003694(uint64_t a1)
{
  uint64_t v2 = sub_100003650(&qword_10001E400);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_1000036F4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1000079E4(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v4;
    uint64_t v11 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_100003650(&qword_10001E408);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v12);
    swift_bridgeObjectRelease();
    sub_10000382C((_OWORD *)(*(void *)(v14 + 56) + 32 * v8), a3);
    _NativeDictionary._delete(at:)();
    *uint64_t v4 = v14;
    swift_bridgeObjectRelease();
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

_OWORD *sub_10000382C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000383C(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_1000038CC(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;

  return swift_bridgeObjectRelease();
}

_OWORD *sub_1000038CC(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_1000079E4(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_13;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100003650(&qword_10001E408);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000079E4(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    double result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  unint64_t v20 = *v5;
  if (v17)
  {
    unint64_t v21 = (_OWORD *)(v20[7] + 32 * v16);
    sub_100003A78((uint64_t)v21);
    return sub_10000382C(a1, v21);
  }
  else
  {
    sub_100003A0C(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

_OWORD *sub_100003A0C(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  BOOL v6 = (void *)(a5[6] + 16 * a1);
  *BOOL v6 = a2;
  v6[1] = a3;
  double result = sub_10000382C(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

uint64_t sub_100003A78(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100003AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100003B24()
{
  return swift_release();
}

uint64_t sub_100003B2C()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100003B58()
{
  return 0x69752D736D61;
}

id sub_100003B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = type metadata accessor for LogMessage.StringInterpolation();
  __chkstk_darwin(v7 - 8);
  objc_allocWithZone((Class)_UIContentUnavailableView);
  uint64_t v8 = v3;
  uint64_t v9 = sub_100004AD4();
  id result = sub_100004964(v12, v13, v14, v15, v9, v10, v11);
  if (result)
  {
    *(void *)&v8[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView] = result;
    *(void *)&v8[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_error] = a1;
    char v17 = (uint64_t *)&v8[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_retryAction];
    *char v17 = a2;
    v17[1] = a3;
    swift_errorRetain();
    sub_100004A00(a2);

    unint64_t v18 = (objc_class *)type metadata accessor for ErrorViewController();
    v38.receiver = v8;
    v38.super_class = v18;
    id v19 = [super initWithNibName:0 bundle:0];
    sub_100003650((uint64_t *)&unk_10001E740);
    type metadata accessor for LogMessage();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012EC0;
    v37 = v18;
    v36[0] = v19;
    id v20 = v19;
    id v21 = (id)AMSLogKey();
    if (v21)
    {
      char v22 = v21;
      uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v25 = v24;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v26._countAndFlagsBits = 0;
      v26._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v26);
      sub_100004B14();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      sub_100004AF4(MetatypeMetadata);
      sub_100003694((uint64_t)v35);
      v28._countAndFlagsBits = 5972026;
      v28._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v28);
      v35[3] = &type metadata for String;
      v35[0] = v23;
      v35[1] = v25;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100003694((uint64_t)v35);
      uint64_t v29 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v30._countAndFlagsBits = 0;
      v30._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v30);
      sub_100004B14();
      uint64_t v31 = swift_getMetatypeMetadata();
      sub_100004AF4(v31);
      sub_100003694((uint64_t)v35);
      uint64_t v29 = 58;
    }
    unint64_t v32 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v29);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_100003A78((uint64_t)v36);
    LogMessage.init(stringLiteral:)();
    swift_getErrorValue();
    uint64_t v33 = Error.localizedDescription.getter();
    v37 = (objc_class *)&type metadata for String;
    v36[0] = v33;
    v36[1] = v34;
    static LogMessage.safe(_:)();
    sub_100003694((uint64_t)v36);
    sub_100004C08();
    sub_100004A54(a2);
    swift_errorRelease();
    swift_bridgeObjectRelease();

    return v20;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100003F04()
{
  id v1 = objc_allocWithZone((Class)_UIContentUnavailableView);
  uint64_t v2 = sub_100004AD4();
  id v9 = sub_100004964(v5, v6, v7, v8, v2, v3, v4);
  if (!v9) {
    __break(1u);
  }
  *(void *)&v0[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView] = v9;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

id sub_100004000()
{
  id v1 = [v0 parentViewController];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [v1 navigationItem];

    return v3;
  }
  else
  {
    v6.receiver = v0;
    v6.super_class = (Class)type metadata accessor for ErrorViewController();
    [super navigationItem];
    return v5;
  }
}

void sub_1000040A0()
{
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for ErrorViewController();
  [super loadView];
  id v1 = [v0 view];
  id v2 = [self ams_primaryBackground];
  sub_100004ABC((uint64_t)v2, "setBackgroundColor:");
}

void sub_100004178()
{
  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for ErrorViewController();
  [super viewDidLoad];
  sub_1000042F4();
}

id sub_1000041F8()
{
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for ErrorViewController();
  [super viewWillLayoutSubviews];
  objc_super v1 = *(void **)&v0[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView];
  id v2 = [v0 view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  return [v1 setFrame:v4, v6, v8, v10];
}

void sub_1000042F4()
{
  id v1 = [v0 navigationItem];
  [v1 ams_configureWithTransparentBackground];

  sub_10000434C();
}

void sub_10000434C()
{
  type metadata accessor for Localizations();
  uint64_t v1 = sub_100004B4C(0xD000000000000015, (void *)0x8000000100013700);
  uint64_t v3 = v2;
  uint64_t v4 = sub_100004B4C(0xD000000000000014, (void *)0x8000000100013720);
  sub_100004450(v1, v3, 0, 0, v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v6 = [v0 view];
  [v6 addSubview:*(void *)&v0[OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView]];
}

void sub_100004450(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_super v12 = *(void **)(v6 + OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_contentUnavailableView);
  id v13 = [v12 buttonTitle];
  if (v13)
  {
    double v14 = v13;
    uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = v16;

    if (!a6)
    {
LABEL_31:
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
    if (v15 == a5 && v17 == a6)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0) {
        goto LABEL_32;
      }
    }
  }
  else if (a6)
  {
    goto LABEL_32;
  }
  id v20 = [v12 message];
  if (!v20)
  {
    if (!a4) {
      goto LABEL_23;
    }
LABEL_32:
    uint64_t v34 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_100004A9C;
    aBlock[5] = v34;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100008308;
    aBlock[3] = &unk_100018B78;
    uint64_t v35 = _Block_copy(aBlock);
    uint64_t v36 = swift_release();
    sub_100004ABC(v36, "setButtonAction:");
    _Block_release(v35);
    if (a6)
    {
      NSString v37 = String._bridgeToObjectiveC()();
      objc_super v38 = v37;
    }
    else
    {
      objc_super v38 = 0;
    }
    sub_100004ABC((uint64_t)v37, "setButtonTitle:");

    if (a4)
    {
      NSString v39 = String._bridgeToObjectiveC()();
      v40 = v39;
    }
    else
    {
      v40 = 0;
    }
    sub_100004ABC((uint64_t)v39, "setMessage:");

    if (a2)
    {
      NSString v41 = String._bridgeToObjectiveC()();
      v42 = v41;
    }
    else
    {
      v42 = 0;
    }
    sub_100004ABC((uint64_t)v41, "setTitle:");

    return;
  }
  id v21 = v20;
  uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v24 = v23;

  if (!a4) {
    goto LABEL_31;
  }
  if (v22 == a3 && v24 == a4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v26 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0) {
      goto LABEL_32;
    }
  }
LABEL_23:
  id v27 = [v12 title];
  if (!v27)
  {
    if (!a2) {
      return;
    }
    goto LABEL_32;
  }
  Swift::String v28 = v27;
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v31 = v30;

  if (!a2) {
    goto LABEL_31;
  }
  if (v29 != a1 || v31 != a2)
  {
    char v33 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v33) {
      return;
    }
    goto LABEL_32;
  }

  swift_bridgeObjectRelease();
}

void sub_100004788()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = *(void (**)(void))(Strong + OBJC_IVAR____TtC24AMSEngagementViewService19ErrorViewController_retryAction);
    sub_100004A00((uint64_t)v2);

    if (v2)
    {
      v2();
      sub_100004A54((uint64_t)v2);
    }
  }
}

void sub_100004814()
{
}

void sub_100004854()
{
}

id sub_1000048AC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ErrorViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for ErrorViewController()
{
  return self;
}

id sub_100004964(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a6)
  {
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  id v14 = [v7 initWithFrame:v13 title:a7 style:a1, a2, a3, a4];

  return v14;
}

uint64_t sub_100004A00(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void *sub_100004A10(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100004A54(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100004A64()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100004A9C()
{
}

uint64_t sub_100004AA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100004AB4()
{
  return swift_release();
}

id sub_100004ABC(uint64_t a1, const char *a2)
{
  return [v2 a2:v3];
}

uint64_t sub_100004AD4()
{
  return 0;
}

uint64_t sub_100004AF4(uint64_t a1)
{
  *(void *)(v2 - 136) = a1;
  *(void *)(v2 - 160) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

uint64_t sub_100004B14()
{
  sub_100004A10((void *)(v0 - 128), *(void *)(v0 - 104));
  return swift_getDynamicType();
}

uint64_t sub_100004B4C(uint64_t a1, void *a2)
{
  id v4 = [self mainBundle];
  v9._object = (void *)0xE000000000000000;
  v5._uint64_t countAndFlagsBits = a1;
  v5._object = a2;
  v6._uint64_t countAndFlagsBits = 0;
  v6._object = (void *)0xE000000000000000;
  v9._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v5, (Swift::String_optional)0, (NSBundle)v4, v6, v9)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t type metadata accessor for Localizations()
{
  return self;
}

uint64_t sub_100004C08()
{
  os_log_type_t v0 = static os_log_type_t.error.getter();

  return sub_100004CA0(v0);
}

uint64_t sub_100004C40()
{
  sub_100004EAC();
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_10001E4F0 = result;
  return result;
}

uint64_t sub_100004CA0(os_log_type_t a1)
{
  if (qword_10001E0F0 != -1) {
    swift_once();
  }
  uint64_t result = os_log_type_enabled((os_log_t)qword_10001E4F0, a1);
  if (result)
  {
    static LogMessage.isRedactionEnabled.getter();
    uint64_t v3 = static LogMessage.describe(contentsOf:withRedaction:separator:)();
    uint64_t v5 = v4;
    sub_100003650(&qword_10001E590);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_100012F10;
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = sub_100004E60();
    *(void *)(v6 + 32) = v3;
    *(void *)(v6 + 40) = v5;
    os_log(_:dso:log:type:_:)();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100004DCC()
{
  os_log_type_t v0 = static os_log_type_t.default.getter();

  return sub_100004CA0(v0);
}

uint64_t sub_100004E04()
{
  os_log_type_t v0 = static os_log_type_t.info.getter();

  return sub_100004CA0(v0);
}

uint64_t type metadata accessor for Log()
{
  return self;
}

unint64_t sub_100004E60()
{
  unint64_t result = qword_10001E598;
  if (!qword_10001E598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E598);
  }
  return result;
}

unint64_t sub_100004EAC()
{
  unint64_t result = qword_10001E5A0;
  if (!qword_10001E5A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001E5A0);
  }
  return result;
}

uint64_t sub_100004EEC()
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

BOOL sub_100004F74(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_100004F80(int a1, Swift::UInt a2)
{
}

Swift::Int sub_100004FA8(Swift::UInt a1)
{
  return Hasher._finalize()();
}

Swift::Int sub_100004FF0()
{
  return sub_100004FA8(*v0);
}

void sub_100004FF8(int a1)
{
  sub_100004F80(a1, *v1);
}

Swift::Int sub_100005000()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL sub_100005044(uint64_t *a1, uint64_t *a2)
{
  return sub_100004F74(*a1, *a2);
}

unint64_t sub_100005054()
{
  unint64_t result = qword_10001E5A8;
  if (!qword_10001E5A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E5A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for RemoteAlertButtonAction()
{
  return &type metadata for RemoteAlertButtonAction;
}

unint64_t sub_1000050B4()
{
  unint64_t result = qword_10001E5B0;
  if (!qword_10001E5B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E5B0);
  }
  return result;
}

Swift::Int sub_100005100(uint64_t a1, Swift::UInt a2)
{
  return Hasher._finalize()();
}

uint64_t sub_100005144(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = (uint64_t *)(a1 + 32);
    do
    {
      uint64_t v5 = *v3++;
      uint64_t v4 = v5;
      if ((v5 & ~v2) == 0) {
        uint64_t v4 = 0;
      }
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    uint64_t v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

void *sub_100005198@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1000051A4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_1000051CC();
  *a1 = result;
  return result;
}

uint64_t sub_1000051CC()
{
  return 0;
}

uint64_t sub_1000051D4(void *a1)
{
  return sub_1000080FC(*a1, *v1);
}

uint64_t sub_1000051E0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100005210(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100005210(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

uint64_t sub_100005218@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100005588(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100005248@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100005278(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_100005278(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_100005280(void *a1, uint64_t *a2)
{
  return sub_100005288(a1, *a2);
}

BOOL sub_100005288(void *a1, uint64_t a2)
{
  uint64_t v3 = *v2 & a2;
  if (v3 != a2) {
    *v2 |= a2;
  }
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1000052B4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_1000052E8(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_1000052E8(uint64_t a1)
{
  uint64_t result = *v1 & a1;
  if (result) {
    *v1 &= ~a1;
  }
  return result;
}

uint64_t sub_10000530C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result = sub_100005340(*a1);
  *(void *)a2 = result;
  *(unsigned char *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_100005340(uint64_t a1)
{
  uint64_t v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

uint64_t sub_100005358(uint64_t *a1)
{
  return sub_100005360(*a1);
}

uint64_t sub_100005360(uint64_t result)
{
  *v1 |= result;
  return result;
}

uint64_t sub_100005370(uint64_t *a1)
{
  return sub_100005590(*a1);
}

uint64_t sub_100005378(uint64_t *a1)
{
  return sub_100005380(*a1);
}

uint64_t sub_100005380(uint64_t result)
{
  *v1 ^= result;
  return result;
}

uint64_t sub_100005390@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_1000053C0(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_1000053C0(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_1000053C8(uint64_t *a1)
{
  return sub_1000055A0(*a1, *v1);
}

BOOL sub_1000053D4(uint64_t *a1)
{
  return sub_1000053E0(*a1, *v1);
}

BOOL sub_1000053E0(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1000053EC(uint64_t *a1)
{
  return sub_1000055AC(*a1, *v1);
}

BOOL sub_1000053F8()
{
  return sub_100005400(*v0);
}

BOOL sub_100005400(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_10000540C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

uint64_t sub_100005424(uint64_t *a1)
{
  return sub_10000542C(*a1);
}

uint64_t sub_10000542C(uint64_t result)
{
  *v1 &= ~result;
  return result;
}

void *sub_10000543C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10000544C(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100005458@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_100005144(a1);
  *a2 = result;
  return result;
}

Swift::Int sub_100005480(uint64_t a1)
{
  return sub_100005100(a1, *v1);
}

ValueMetadata *type metadata accessor for RemoteAlertButtonActionEvents()
{
  return &type metadata for RemoteAlertButtonActionEvents;
}

unint64_t sub_10000549C()
{
  unint64_t result = qword_10001E5B8;
  if (!qword_10001E5B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E5B8);
  }
  return result;
}

unint64_t sub_1000054EC()
{
  unint64_t result = qword_10001E5C0;
  if (!qword_10001E5C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E5C0);
  }
  return result;
}

unint64_t sub_10000553C()
{
  unint64_t result = qword_10001E5C8;
  if (!qword_10001E5C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E5C8);
  }
  return result;
}

uint64_t sub_100005588(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

uint64_t sub_100005590(uint64_t result)
{
  *v1 &= result;
  return result;
}

BOOL sub_1000055A0(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1000055AC(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

BOOL sub_1000055B8(char a1, char a2)
{
  return a1 == a2;
}

void sub_1000055C8(uint64_t a1, unsigned __int8 a2)
{
}

Swift::Int sub_1000055F0(unsigned __int8 a1)
{
  return Hasher._finalize()();
}

BOOL sub_100005638(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_100005648(uint64_t a1, char a2)
{
}

Swift::Int sub_100005670(char a1)
{
  return Hasher._finalize()();
}

BOOL sub_1000056B8(char *a1, char *a2)
{
  return sub_1000055B8(*a1, *a2);
}

Swift::Int sub_1000056C4()
{
  return sub_1000055F0(*v0);
}

void sub_1000056CC(uint64_t a1)
{
  sub_1000055C8(a1, *v1);
}

Swift::Int sub_1000056D4()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

BOOL sub_10000572C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100005638(*a1, *a2);
}

Swift::Int sub_100005738()
{
  return sub_100005670(*v0);
}

void sub_100005754(uint64_t a1)
{
  sub_100005648(a1, *v1);
}

uint64_t sub_10000575C(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation();
  uint64_t v4 = sub_100008284(v3);
  __chkstk_darwin(v4);
  sub_100008224();
  if (!a1)
  {
    int v5 = 1;
    goto LABEL_5;
  }
  if (a1 == 1)
  {
    int v5 = 0;
LABEL_5:
    int v6 = 1;
    return v5 | (v6 << 8);
  }
  sub_100003650((uint64_t *)&unk_10001E740);
  uint64_t v7 = type metadata accessor for LogMessage();
  sub_100008110(v7);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012EC0;
  uint64_t v21 = type metadata accessor for RemoteEngagementPresenter();
  v20[0] = v1;
  swift_retain();
  sub_100007CA8(a1);
  id v8 = (id)AMSLogKey();
  if (v8)
  {
    Swift::String v9 = v8;
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v12 = v11;

    sub_10000820C();
    sub_100008254();
    sub_100004A10(v20, v21);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_100003694((uint64_t)v18);
    sub_10000819C();
    uint64_t MetatypeMetadata = &type metadata for String;
    v18[0] = v10;
    v18[1] = v12;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_100003694((uint64_t)v18);
    uint64_t v14 = 93;
  }
  else
  {
    sub_1000081F4();
    sub_100008254();
    sub_100004A10(v20, v21);
    uint64_t v15 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = v15;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_100003694((uint64_t)v18);
    uint64_t v14 = 58;
  }
  unint64_t v16 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v14);
  LogMessage.init(stringInterpolation:)();
  type metadata accessor for Log();
  sub_100003A78((uint64_t)v20);
  LogMessage.init(stringLiteral:)();
  uint64_t v21 = sub_100003650(&qword_10001E798);
  v20[0] = a1;
  static LogMessage.safe(_:)();
  sub_100003694((uint64_t)v20);
  sub_100004DCC();
  swift_bridgeObjectRelease();
  int v5 = 0;
  int v6 = 0;
  return v5 | (v6 << 8);
}

uint64_t sub_1000059E8(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation();
  uint64_t v5 = sub_100008284(v4);
  __chkstk_darwin(v5);
  if (!a1)
  {
    int v7 = 1;
    int v6 = 3;
    return v6 | (v7 << 8);
  }
  if (a1 == 1)
  {
    int v6 = 1;
LABEL_4:
    int v7 = 1;
    return v6 | (v7 << 8);
  }
  v43[0] = (id)0xD000000000000015;
  v43[1] = (id)0x8000000100013A70;
  sub_10000826C();
  sub_1000081D8();
  sub_1000078FC((uint64_t)&v44);
  if (!v47)
  {
    sub_100003694((uint64_t)v46);
    goto LABEL_10;
  }
  if ((sub_1000081B8() & 1) == 0)
  {
LABEL_10:
    int v7 = 1;
    int v6 = 2;
    return v6 | (v7 << 8);
  }
  sub_1000079A8(0, &qword_10001E778);
  uint64_t v8 = sub_1000079A8(0, &qword_10001E780);
  uint64_t v9 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  id v41 = v43[0];
  id v42 = v43[1];
  if (!v9)
  {
    sub_100007950((uint64_t)v43[0], (unint64_t)v43[1]);
    goto LABEL_10;
  }
  v40 = (void *)v9;
  strcpy((char *)v43, "bagData");
  v43[1] = (id)0xE700000000000000;
  sub_10000826C();
  sub_1000081D8();
  sub_1000078FC((uint64_t)&v44);
  if (!v47)
  {
    sub_100003694((uint64_t)v46);
LABEL_19:
    id v13 = [self createBagForSubProfile];
    goto LABEL_20;
  }
  if ((sub_1000081B8() & 1) == 0) {
    goto LABEL_19;
  }
  id v11 = v43[0];
  id v12 = v43[1];
  sub_1000079A8(0, &qword_10001E790);
  id v13 = sub_1000061C8((uint64_t)v11, (unint64_t)v12);
  if (!v13) {
    goto LABEL_19;
  }
LABEL_20:
  strcpy((char *)v43, "clientInfoData");
  HIBYTE(v43[1]) = -18;
  sub_10000826C();
  sub_1000081D8();
  sub_1000078FC((uint64_t)&v44);
  id v39 = v13;
  if (!v47)
  {
    sub_100003694((uint64_t)v46);
    goto LABEL_24;
  }
  if ((sub_1000081B8() & 1) == 0)
  {
LABEL_24:
    objc_super v38 = 0;
    goto LABEL_25;
  }
  id v15 = v43[0];
  id v14 = v43[1];
  sub_1000079A8(0, &qword_10001E788);
  unint64_t v16 = (unint64_t)v14;
  uint64_t v36 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  sub_100007950((uint64_t)v15, v16);
  objc_super v38 = (void *)v36;
  id v13 = v39;
  if (!v36)
  {
    sub_100007950((uint64_t)v41, (unint64_t)v42);

    swift_unknownObjectRelease();
    int v6 = 0;
    goto LABEL_4;
  }
LABEL_25:
  strcpy((char *)v43, "attachedToApp");
  HIWORD(v43[1]) = -4864;
  sub_10000826C();
  sub_1000081D8();
  sub_1000078FC((uint64_t)&v44);
  if (!v47)
  {
    sub_100003694((uint64_t)v46);
    goto LABEL_29;
  }
  sub_1000079A8(0, &qword_10001E770);
  if ((sub_1000081B8() & 1) == 0)
  {
LABEL_29:
    unsigned __int8 v18 = 0;
    goto LABEL_30;
  }
  id v17 = v43[0];
  unsigned __int8 v18 = [v43[0] BOOLValue];

LABEL_30:
  sub_100003650((uint64_t *)&unk_10001E740);
  uint64_t v19 = type metadata accessor for LogMessage();
  sub_100008110(v19);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131C0;
  *((void *)&v45 + 1) = type metadata accessor for RemoteEngagementPresenter();
  *(void *)&long long v44 = v2;
  swift_retain();
  id v20 = (id)AMSLogKey();
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v23 = v22;

    sub_10000820C();
    v24._uint64_t countAndFlagsBits = 0;
    v24._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v24);
    sub_1000082D0();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_1000082B0(MetatypeMetadata);
    sub_100003694((uint64_t)v46);
    sub_10000819C();
    v47 = &type metadata for String;
    v46[0] = v37;
    v46[1] = v23;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_100003694((uint64_t)v46);
    uint64_t v26 = 93;
  }
  else
  {
    sub_1000081F4();
    v27._uint64_t countAndFlagsBits = 0;
    v27._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v27);
    sub_1000082D0();
    uint64_t v28 = swift_getMetatypeMetadata();
    sub_1000082B0(v28);
    sub_100003694((uint64_t)v46);
    uint64_t v26 = 58;
  }
  unint64_t v29 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v26);
  LogMessage.init(stringInterpolation:)();
  sub_100003A78((uint64_t)&v44);
  LogMessage.init(stringLiteral:)();
  LogMessage.init(stringLiteral:)();
  *((void *)&v45 + 1) = v8;
  *(void *)&long long v44 = v40;
  id v30 = v40;
  static LogMessage.safe(_:)();
  sub_100003694((uint64_t)&v44);
  LogMessage.init(stringLiteral:)();
  if (v13)
  {
    *((void *)&v45 + 1) = swift_getObjectType();
    *(void *)&long long v44 = v13;
  }
  else
  {
    long long v44 = 0u;
    long long v45 = 0u;
  }
  swift_unknownObjectRetain();
  static LogMessage.safe(_:)();
  sub_100003694((uint64_t)&v44);
  LogMessage.init(stringLiteral:)();
  unsigned __int8 v31 = v18;
  if (v38)
  {
    *((void *)&v45 + 1) = sub_1000079A8(0, &qword_10001E788);
    *(void *)&long long v44 = v38;
    unint64_t v32 = v38;
  }
  else
  {
    unint64_t v32 = 0;
    long long v44 = 0u;
    long long v45 = 0u;
  }
  type metadata accessor for Log();
  id v33 = v32;
  static LogMessage.safe(_:)();
  sub_100003694((uint64_t)&v44);
  LogMessage.init(stringLiteral:)();
  *((void *)&v45 + 1) = &type metadata for Bool;
  LOBYTE(v44) = v31;
  static LogMessage.safe(_:)();
  sub_100003694((uint64_t)&v44);
  sub_100004DCC();
  sub_100007950((uint64_t)v41, (unint64_t)v42);
  swift_bridgeObjectRelease();
  *(unsigned char *)(v2 + 24) = v31;
  *(void *)(v2 + 32) = v39;
  swift_unknownObjectRelease();
  uint64_t v34 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = v38;

  uint64_t v35 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = v40;

  int v6 = 0;
  int v7 = 0;
  return v6 | (v7 << 8);
}

double sub_100006164@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100007A5C(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_100003AC8(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

id sub_1000061C8(uint64_t a1, unint64_t a2)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v6 = [v4 initWithData:isa];
  sub_100007950(a1, a2);

  return v6;
}

void sub_100006240(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation();
  uint64_t v5 = sub_100008284(v4);
  __chkstk_darwin(v5);
  sub_100003650((uint64_t *)&unk_10001E740);
  uint64_t v6 = type metadata accessor for LogMessage();
  sub_100008110(v6);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012EC0;
  uint64_t v63 = type metadata accessor for RemoteEngagementPresenter();
  v62[0] = v1;
  swift_retain();
  id v7 = (id)AMSLogKey();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v11 = v10;

    sub_10000820C();
    sub_100008180();
    sub_100008128();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_100008160(MetatypeMetadata);
    sub_100003694((uint64_t)&v66);
    sub_10000819C();
    v68 = &type metadata for String;
    uint64_t v66 = v9;
    uint64_t v67 = v11;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_100003694((uint64_t)&v66);
    uint64_t v13 = 93;
  }
  else
  {
    sub_1000081F4();
    sub_100008180();
    sub_100008128();
    uint64_t v14 = swift_getMetatypeMetadata();
    sub_100008160(v14);
    sub_100003694((uint64_t)&v66);
    uint64_t v13 = 58;
  }
  unint64_t v15 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v13);
  LogMessage.init(stringInterpolation:)();
  type metadata accessor for Log();
  sub_100003A78((uint64_t)v62);
  LogMessage.init(stringLiteral:)();
  uint64_t v63 = sub_100003650((uint64_t *)&unk_10001E760);
  v62[0] = a1;
  swift_bridgeObjectRetain();
  static LogMessage.safe(_:)();
  sub_100003694((uint64_t)v62);
  sub_100004DCC();
  swift_bridgeObjectRelease();
  uint64_t v60 = a1 + 56;
  uint64_t v16 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v17 = -1;
  if (v16 < 64) {
    uint64_t v17 = ~(-1 << v16);
  }
  unint64_t v18 = v17 & *(void *)(a1 + 56);
  int64_t v61 = (unint64_t)(v16 + 63) >> 6;
  v58 = (void *)AMSErrorDomain;
  swift_bridgeObjectRetain();
  int64_t v19 = 0;
  uint64_t v59 = a1;
  uint64_t v57 = v2;
  while (v18)
  {
    unint64_t v20 = __clz(__rbit64(v18));
    v18 &= v18 - 1;
    unint64_t v21 = v20 | (v19 << 6);
LABEL_23:
    if ((*(void *)(*(void *)(a1 + 48) + 8 * v21) & 0x10) != 0)
    {
      char v28 = *(unsigned char *)(v2 + 24);
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
      if (v28)
      {
        sub_100008290((uint64_t)&v69);
        id v36 = (id)AMSLogKey();
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v40 = v39;

          sub_10000820C();
          sub_100008180();
          sub_100008128();
          uint64_t v41 = swift_getMetatypeMetadata();
          sub_100008160(v41);
          sub_100003694((uint64_t)&v66);
          sub_10000819C();
          v68 = &type metadata for String;
          uint64_t v66 = v38;
          uint64_t v67 = v40;
          LogMessage.StringInterpolation.appendInterpolation(safe:)();
          sub_100003694((uint64_t)&v66);
          uint64_t v42 = 93;
        }
        else
        {
          sub_1000081F4();
          sub_100008180();
          sub_100008128();
          uint64_t v55 = swift_getMetatypeMetadata();
          sub_100008160(v55);
          sub_100003694((uint64_t)&v66);
          uint64_t v42 = 58;
        }
        unint64_t v56 = 0xE100000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v42);
        LogMessage.init(stringInterpolation:)();
        sub_100003A78((uint64_t)v62);
        LogMessage.init(stringLiteral:)();
        sub_100004DCC();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_100008290((uint64_t)&v69);
        id v29 = (id)AMSLogKey();
        if (v29)
        {
          id v30 = v29;
          uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v33 = v32;

          sub_10000820C();
          sub_100008180();
          sub_100008128();
          uint64_t v34 = swift_getMetatypeMetadata();
          sub_100008160(v34);
          sub_100003694((uint64_t)&v66);
          sub_10000819C();
          v68 = &type metadata for String;
          uint64_t v66 = v31;
          uint64_t v67 = v33;
          LogMessage.StringInterpolation.appendInterpolation(safe:)();
          sub_100003694((uint64_t)&v66);
          uint64_t v35 = 93;
        }
        else
        {
          sub_1000081F4();
          sub_100008180();
          sub_100008128();
          uint64_t v43 = swift_getMetatypeMetadata();
          sub_100008160(v43);
          sub_100003694((uint64_t)&v66);
          uint64_t v35 = 58;
        }
        unint64_t v44 = 0xE100000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v35);
        LogMessage.init(stringInterpolation:)();
        sub_100003A78((uint64_t)v62);
        LogMessage.init(stringLiteral:)();
        sub_100004DCC();
        swift_bridgeObjectRelease();
        id v45 = v58;
        NSString v46 = String._bridgeToObjectiveC()();
        NSString v47 = String._bridgeToObjectiveC()();
        sub_100003650(&qword_10001E3F8);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_100012F10;
        *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
        *(void *)(inited + 40) = v49;
        uint64_t v50 = sub_1000079A8(0, &qword_10001E770);
        v51.super.super.Class isa = NSNumber.init(BOOLeanLiteral:)(1).super.super.isa;
        *(void *)(inited + 72) = v50;
        *(NSNumber *)(inited + 48) = v51;
        Dictionary.init(dictionaryLiteral:)();
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        id v53 = (id)AMSCustomError();

        uint64_t v2 = v57;
        v62[0] = 0;
        v62[1] = v53;
        uint64_t v63 = 0;
        uint64_t v64 = 0;
        v62[2] = 0;
        char v65 = 0;
        id v54 = v53;
        SyncEvent.post(_:)();

        a1 = v59;
      }
    }
  }
  int64_t v22 = v19 + 1;
  if (__OFADD__(v19, 1))
  {
    __break(1u);
    goto LABEL_35;
  }
  if (v22 >= v61) {
    goto LABEL_33;
  }
  unint64_t v23 = *(void *)(v60 + 8 * v22);
  ++v19;
  if (v23) {
    goto LABEL_22;
  }
  int64_t v19 = v22 + 1;
  if (v22 + 1 >= v61) {
    goto LABEL_33;
  }
  sub_100008244();
  if (v23) {
    goto LABEL_22;
  }
  int64_t v19 = v24 + 2;
  if (v24 + 2 >= v61) {
    goto LABEL_33;
  }
  sub_100008244();
  if (v23)
  {
LABEL_22:
    unint64_t v18 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v19 << 6);
    goto LABEL_23;
  }
  int64_t v26 = v25 + 3;
  if (v26 >= v61)
  {
LABEL_33:
    swift_release();
    return;
  }
  unint64_t v23 = *(void *)(v60 + 8 * v26);
  if (v23)
  {
    int64_t v19 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v19 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v19 >= v61) {
      goto LABEL_33;
    }
    sub_100008244();
    int64_t v26 = v27 + 1;
    if (v23) {
      goto LABEL_22;
    }
  }
LABEL_35:
  __break(1u);
}

void sub_100006A80()
{
  uint64_t v1 = type metadata accessor for LogMessage.StringInterpolation();
  uint64_t v2 = sub_100008284(v1);
  __chkstk_darwin(v2);
  sub_100008224();
  uint64_t v3 = (uint64_t (*)())v0[4];
  if (v3 && (uint64_t v4 = (void *)v0[7]) != 0)
  {
    uint64_t v5 = (void *)v0[5];
    uint64_t v6 = swift_allocObject();
    swift_weakInit();
    int64_t v22 = v4;
    unint64_t v23 = v3;
    uint64_t v24 = (uint64_t)v5;
    uint64_t v25 = (uint64_t)sub_100007890;
    uint64_t v26 = v6;
    char v27 = 1;
    id v7 = v5;
    swift_retain();
    swift_unknownObjectRetain();
    uint64_t v8 = v4;
    SyncEvent.post(_:)();
    swift_release_n();

    swift_unknownObjectRelease();
  }
  else
  {
    sub_100003650((uint64_t *)&unk_10001E740);
    uint64_t v9 = type metadata accessor for LogMessage();
    sub_100008110(v9);
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
    uint64_t v25 = type metadata accessor for RemoteEngagementPresenter();
    int64_t v22 = v0;
    swift_retain();
    id v10 = (id)AMSLogKey();
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v14 = v13;

      sub_10000820C();
      sub_100008254();
      sub_100004A10(&v22, v25);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v28[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100003694((uint64_t)v28);
      sub_10000819C();
      uint64_t MetatypeMetadata = &type metadata for String;
      v28[0] = v12;
      v28[1] = v14;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100003694((uint64_t)v28);
      uint64_t v16 = 93;
    }
    else
    {
      sub_1000081F4();
      sub_100008254();
      sub_100004A10(&v22, v25);
      uint64_t v17 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v28[0] = v17;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100003694((uint64_t)v28);
      uint64_t v16 = 58;
    }
    unint64_t v18 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v16);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_100003A78((uint64_t)&v22);
    LogMessage.init(stringLiteral:)();
    sub_100004C08();
    swift_bridgeObjectRelease();
    sub_100007804();
    uint64_t v19 = swift_allocError();
    *unint64_t v20 = 1;
    uint64_t v21 = swift_allocObject();
    swift_weakInit();
    int64_t v22 = (void *)v19;
    unint64_t v23 = sub_100007888;
    uint64_t v24 = v21;
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    char v27 = 2;
    swift_retain();
    SyncEvent.post(_:)();
    swift_errorRelease();
    swift_release_n();
  }
}

uint64_t sub_100006DE4()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_100007804();
    swift_allocError();
    unsigned char *v1 = 1;
    SyncEvent.post(_:)();
    swift_errorRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_100006E8C(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation();
  __chkstk_darwin(v4 - 8);
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v6 = result;
    sub_100003650((uint64_t *)&unk_10001E740);
    type metadata accessor for LogMessage();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131E0;
    *((void *)&v24 + 1) = type metadata accessor for RemoteEngagementPresenter();
    *(void *)&long long v23 = v6;
    swift_retain();
    id v7 = (id)AMSLogKey();
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v11 = v10;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v12._uint64_t countAndFlagsBits = 0;
      v12._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v12);
      sub_100004A10(&v23, *((uint64_t *)&v24 + 1));
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v27[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100003694((uint64_t)v27);
      v14._uint64_t countAndFlagsBits = 5972026;
      v14._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v14);
      uint64_t MetatypeMetadata = &type metadata for String;
      v27[0] = v9;
      v27[1] = v11;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100003694((uint64_t)v27);
      uint64_t v15 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v16._uint64_t countAndFlagsBits = 0;
      v16._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v16);
      sub_100004A10(&v23, *((uint64_t *)&v24 + 1));
      uint64_t v17 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v27[0] = v17;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100003694((uint64_t)v27);
      uint64_t v15 = 58;
    }
    unint64_t v18 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v15);
    LogMessage.init(stringInterpolation:)();
    sub_100003A78((uint64_t)&v23);
    LogMessage.init(stringLiteral:)();
    if (a1)
    {
      *((void *)&v24 + 1) = sub_1000079A8(0, &qword_10001E758);
      *(void *)&long long v23 = a1;
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
    }
    id v19 = a1;
    static LogMessage.safe(_:)();
    sub_100003694((uint64_t)&v23);
    LogMessage.init(stringLiteral:)();
    if (a2)
    {
      swift_getErrorValue();
      *((void *)&v24 + 1) = v22;
      unint64_t v20 = sub_100007898((uint64_t *)&v23);
      (*(void (**)(uint64_t *))(*(void *)(v22 - 8) + 16))(v20);
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
    }
    type metadata accessor for Log();
    static LogMessage.safe(_:)();
    sub_100003694((uint64_t)&v23);
    sub_100004DCC();
    swift_bridgeObjectRelease();
    *(void *)&long long v23 = a1;
    *((void *)&v23 + 1) = a2;
    uint64_t v25 = 0;
    long long v24 = 0uLL;
    char v26 = 0;
    id v21 = v19;
    swift_errorRetain();
    SyncEvent.post(_:)();

    swift_errorRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_100007274()
{
  swift_release();
  swift_unknownObjectRelease();

  return v0;
}

uint64_t sub_1000072AC()
{
  sub_100007274();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RemoteEngagementPresenter()
{
  return self;
}

uint64_t sub_100007304(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

void *sub_100007338(void *result, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  id v7 = result;
  switch(a6)
  {
    case 2:
      swift_errorRetain();
      return (void *)sub_100004A00(a2);
    case 1:
      id v9 = a3;
      swift_retain();
      id v10 = v7;
      return (void *)swift_unknownObjectRetain();
    case 0:
      id v8 = result;
      return (void *)swift_errorRetain();
  }
  return result;
}

void sub_100007410(uint64_t a1)
{
}

void sub_100007428(void *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 2:
      swift_errorRelease();
      sub_100004A54(a2);
      break;
    case 1:

      swift_unknownObjectRelease();
      swift_release();

      break;
    case 0:

      swift_errorRelease();
      break;
  }
}

uint64_t sub_100007500(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_100007338(*(void **)a2, v4, v5, v6, v7, v8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  *(unsigned char *)(a1 + 40) = v8;
  return a1;
}

uint64_t sub_100007578(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  uint64_t v5 = *(void **)(a2 + 16);
  uint64_t v6 = *(void *)(a2 + 24);
  uint64_t v7 = *(void *)(a2 + 32);
  char v8 = *(unsigned char *)(a2 + 40);
  sub_100007338(*(void **)a2, v4, v5, v6, v7, v8);
  id v9 = *(void **)a1;
  uint64_t v10 = *(void *)(a1 + 8);
  uint64_t v11 = *(void **)(a1 + 16);
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(void *)(a1 + 16) = v5;
  *(void *)(a1 + 24) = v6;
  *(void *)(a1 + 32) = v7;
  char v14 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v8;
  sub_100007428(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 sub_100007604(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_100007618(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 32);
  char v4 = *(unsigned char *)(a2 + 40);
  uint64_t v5 = *(void **)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  uint64_t v6 = *(void **)(a1 + 16);
  uint64_t v8 = *(void *)(a1 + 24);
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(void *)(a1 + 32) = v3;
  char v11 = *(unsigned char *)(a1 + 40);
  *(unsigned char *)(a1 + 40) = v4;
  sub_100007428(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t sub_10000766C(uint64_t a1, unsigned int a2)
{
  if (a2)
  {
    if (a2 >= 0xFE && *(unsigned char *)(a1 + 41))
    {
      int v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
      if (v3 <= 2) {
        int v2 = -1;
      }
      else {
        int v2 = v3 ^ 0xFF;
      }
    }
  }
  else
  {
    int v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1000076AC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1000076FC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_100007704(uint64_t result, char a2)
{
  *(unsigned char *)(result + 40) = a2;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.State()
{
}

unint64_t sub_10000771C()
{
  unint64_t result = qword_10001E730;
  if (!qword_10001E730)
  {
    type metadata accessor for RemoteEngagementPresenter();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E730);
  }
  return result;
}

uint64_t sub_100007768()
{
  sub_100003650(&qword_10001E8A0);
  swift_allocObject();
  *(void *)(v0 + 16) = SyncEvent.init()();
  *(unsigned char *)(v0 + 24) = 2;
  *(void *)(v0 + 56) = 0;
  *(void *)(v0 + 32) = 0;
  *(void *)(v0 + 40) = 0;
  *(unsigned char *)(v0 + 48) = 0;
  return v0;
}

void sub_1000077C4()
{
  if ((*(unsigned char *)(v0 + 48) & 1) == 0)
  {
    sub_100006A80();
    *(unsigned char *)(v0 + 48) = 1;
  }
}

unint64_t sub_100007804()
{
  unint64_t result = qword_10001E750;
  if (!qword_10001E750)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E750);
  }
  return result;
}

uint64_t sub_100007850()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007888()
{
  return sub_100006DE4();
}

uint64_t sub_100007890(void *a1, uint64_t a2)
{
  return sub_100006E8C(a1, a2);
}

uint64_t *sub_100007898(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000078FC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007950(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000079A8(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1000079E4(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100007AA0(a1, a2, v4);
}

unint64_t sub_100007A5C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100007B84(a1, v4);
}

unint64_t sub_100007AA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    long long v10 = (void *)(v9 + 16 * v6);
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

unint64_t sub_100007B84(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100007C4C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_1000078FC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100007C4C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100007CA8(uint64_t result)
{
  if (result != 1) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

unsigned char *sub_100007CB8(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t sub_100007CD0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100007CD8(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.CompletionError()
{
}

uint64_t sub_100007CF0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v5 = v6 - 2;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_100007D78(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 1;
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
        JUMPOUT(0x100007E44);
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
          *uint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.ConfigurationError()
{
}

uint64_t sub_100007E78(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 3) >> 8 < 0xFF) {
      int v3 = 1;
    }
    else {
      int v3 = v2;
    }
    if (v3 == 4)
    {
      int v4 = *(_DWORD *)(a1 + 1);
      if (!v4) {
        goto LABEL_17;
      }
    }
    else if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *sub_100007F00(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *uint64_t result = a2 + 3;
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
        JUMPOUT(0x100007FCCLL);
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
          *uint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

unsigned char *sub_100007FF4(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

void type metadata accessor for RemoteEngagementPresenter.ActivationError()
{
}

unint64_t sub_10000800C()
{
  unint64_t result = qword_10001E7A0;
  if (!qword_10001E7A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E7A0);
  }
  return result;
}

unint64_t sub_10000805C()
{
  unint64_t result = qword_10001E7A8;
  if (!qword_10001E7A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E7A8);
  }
  return result;
}

unint64_t sub_1000080AC()
{
  unint64_t result = qword_10001E7B0;
  if (!qword_10001E7B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E7B0);
  }
  return result;
}

uint64_t sub_100008110(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100008128()
{
  sub_100004A10((void *)(v0 - 248), *(void *)(v0 - 224));
  return swift_getDynamicType();
}

uint64_t sub_100008160(uint64_t a1)
{
  *(void *)(v2 - 96) = a1;
  *(void *)(v2 - 120) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

void sub_100008180()
{
  uint64_t v1 = 0;
  unint64_t v2 = 0xE000000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v1);
}

void sub_10000819C()
{
  uint64_t v1 = 5972026;
  unint64_t v2 = 0xE300000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v1);
}

uint64_t sub_1000081B8()
{
  return swift_dynamicCast();
}

double sub_1000081D8()
{
  return sub_100006164(v1 - 176, v0, (_OWORD *)(v1 - 128));
}

uint64_t sub_1000081F4()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_10000820C()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

void sub_100008254()
{
  uint64_t v1 = 0;
  unint64_t v2 = 0xE000000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v1);
}

uint64_t sub_10000826C()
{
  return AnyHashable.init<A>(_:)(v0 - 192);
}

uint64_t sub_100008284(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_100008290@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 224) = *(void *)(a1 - 256);
  *(void *)(v2 - 248) = v1;
  return swift_retain();
}

uint64_t sub_1000082B0(uint64_t a1)
{
  *(void *)(v2 - 104) = a1;
  *(void *)(v2 - 128) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

uint64_t sub_1000082D0()
{
  sub_100004A10((void *)(v0 - 176), *(void *)(v0 - 152));
  return swift_getDynamicType();
}

uint64_t sub_100008308(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_10000834C(uint64_t a1)
{
  return sub_10000E9D0(a1, OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection);
}

uint64_t sub_100008358()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = sub_10000E950();
  *(void *)(v2 + 16) = v0;
  aBlock[4] = sub_10000DB08;
  aBlock[5] = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000087B4;
  aBlock[3] = &unk_100019128;
  uint64_t v3 = _Block_copy(aBlock);
  id v4 = v1;
  uint64_t v5 = v0;
  swift_release();
  id v6 = [v4 remoteObjectProxyWithErrorHandler:v3];
  _Block_release(v3);

  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  sub_100003650(&qword_10001E8B8);
  if (swift_dynamicCast()) {
    return v8;
  }
  else {
    return 0;
  }
}

uint64_t sub_1000084A0(uint64_t a1, void *a2)
{
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation();
  __chkstk_darwin(v3 - 8);
  sub_100003650((uint64_t *)&unk_10001E740);
  type metadata accessor for LogMessage();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012EC0;
  uint64_t v23 = type metadata accessor for RemoteEngagementViewController();
  v22[0] = (uint64_t)a2;
  id v4 = a2;
  id v5 = (id)AMSLogKey();
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v10._uint64_t countAndFlagsBits = 0;
    v10._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v10);
    sub_100004A10(v22, v23);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v20[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v20, &qword_10001E400);
    v12._uint64_t countAndFlagsBits = 5972026;
    v12._object = (void *)0xE300000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v12);
    uint64_t MetatypeMetadata = &type metadata for String;
    v20[0] = v7;
    v20[1] = v9;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v20, &qword_10001E400);
    uint64_t v13 = 93;
  }
  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v14._uint64_t countAndFlagsBits = 0;
    v14._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v14);
    sub_100004A10(v22, v23);
    uint64_t v15 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v20[0] = v15;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v20, &qword_10001E400);
    uint64_t v13 = 58;
  }
  unint64_t v16 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v13);
  LogMessage.init(stringInterpolation:)();
  type metadata accessor for Log();
  sub_100003A78((uint64_t)v22);
  LogMessage.init(stringLiteral:)();
  swift_getErrorValue();
  uint64_t v23 = v19;
  uint64_t v17 = sub_100007898(v22);
  (*(void (**)(uint64_t *))(*(void *)(v19 - 8) + 16))(v17);
  static LogMessage.safe(_:)();
  sub_10000D6E8((uint64_t)v22, &qword_10001E400);
  sub_100004C08();
  return swift_bridgeObjectRelease();
}

void sub_1000087B4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10000881C()
{
  uint64_t v1 = sub_10000E950();
  *(void *)(v1 + 16) = v0;
  Swift::String v10 = sub_10000DA98;
  uint64_t v11 = v1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100008CA0;
  uint64_t v9 = &unk_1000190D8;
  uint64_t v2 = _Block_copy(aBlock);
  id v3 = v0;
  swift_release();
  id v4 = [v3 _remoteViewControllerProxyWithErrorHandler:v2];
  _Block_release(v2);
  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_10000DAA0((uint64_t)v7, (uint64_t)aBlock);
  if (v9)
  {
    sub_100003650(&qword_10001E8B0);
    if (swift_dynamicCast()) {
      return v6;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_10000D6E8((uint64_t)aBlock, &qword_10001E400);
    return 0;
  }
}

uint64_t sub_100008980(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for LogMessage.StringInterpolation();
  __chkstk_darwin(v4 - 8);
  sub_100003650((uint64_t *)&unk_10001E740);
  type metadata accessor for LogMessage();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012EC0;
  *((void *)&v24 + 1) = type metadata accessor for RemoteEngagementViewController();
  *(void *)&long long v23 = a2;
  id v5 = a2;
  id v6 = (id)AMSLogKey();
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v11._uint64_t countAndFlagsBits = 0;
    v11._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v11);
    sub_100004A10(&v23, *((uint64_t *)&v24 + 1));
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v21[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v21, &qword_10001E400);
    v13._uint64_t countAndFlagsBits = 5972026;
    v13._object = (void *)0xE300000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v13);
    uint64_t MetatypeMetadata = &type metadata for String;
    v21[0] = v8;
    v21[1] = v10;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v21, &qword_10001E400);
    uint64_t v14 = 93;
  }
  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v15._uint64_t countAndFlagsBits = 0;
    v15._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v15);
    sub_100004A10(&v23, *((uint64_t *)&v24 + 1));
    uint64_t v16 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v21[0] = v16;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v21, &qword_10001E400);
    uint64_t v14 = 58;
  }
  unint64_t v17 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v14);
  LogMessage.init(stringInterpolation:)();
  sub_100003A78((uint64_t)&v23);
  LogMessage.init(stringLiteral:)();
  if (a1)
  {
    swift_getErrorValue();
    *((void *)&v24 + 1) = v20;
    unint64_t v18 = sub_100007898((uint64_t *)&v23);
    (*(void (**)(uint64_t *))(*(void *)(v20 - 8) + 16))(v18);
  }
  else
  {
    long long v23 = 0u;
    long long v24 = 0u;
  }
  type metadata accessor for Log();
  static LogMessage.safe(_:)();
  sub_10000D6E8((uint64_t)&v23, &qword_10001E400);
  sub_100004C08();
  return swift_bridgeObjectRelease();
}

void sub_100008CA0(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100008D0C(uint64_t a1)
{
  return sub_10000E9D0(a1, OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task);
}

void sub_100008D18()
{
  sub_10000E980();
  uint64_t v2 = sub_10000EAC8();
  uint64_t v3 = sub_100008284(v2);
  __chkstk_darwin(v3);
  sub_10000E968();
  if (v1 && (id v4 = [v1 xpcEndpoint]) != 0)
  {
    uint64_t v5 = (uint64_t)v4;
    uint64_t v6 = sub_10000E614(v1);
    __int16 v7 = sub_10000575C(v6);
    swift_bridgeObjectRelease();
    sub_100003650((uint64_t *)&unk_10001E740);
    uint64_t v8 = type metadata accessor for LogMessage();
    sub_100008110(v8);
    sub_10000EAA0();
    if ((v7 & 0x100) != 0)
    {
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012EC0;
      NSString v46 = (void *)type metadata accessor for RemoteEngagementViewController();
      id v45 = v1;
      id v28 = v1;
      id v29 = (id)AMSLogKey();
      if (v29)
      {
        id v30 = v29;
        uint64_t v31 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v40 = v32;
        uint64_t v33 = v31;

        sub_10000820C();
        sub_100008180();
        sub_10000E854();
        uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
        sub_10000E8D8(MetatypeMetadata);
        sub_10000EB14();
        sub_10000819C();
        unint64_t v44 = &type metadata for String;
        uint64_t v42 = v33;
        uint64_t v43 = v40;
        LogMessage.StringInterpolation.appendInterpolation(safe:)();
        sub_10000EB14();
        uint64_t v35 = 93;
      }
      else
      {
        sub_1000081F4();
        sub_100008180();
        sub_10000E854();
        uint64_t v38 = swift_getMetatypeMetadata();
        sub_10000E8D8(v38);
        sub_10000D6E8((uint64_t)&v42, &qword_10001E400);
        uint64_t v35 = 58;
      }
      unint64_t v39 = 0xE100000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v35);
      LogMessage.init(stringInterpolation:)();
      type metadata accessor for Log();
      sub_10000E9DC();
      LogMessage.init(stringLiteral:)();
      NSString v46 = &unk_100018DB8;
      LOBYTE(v45) = v7 & 1;
      static LogMessage.safe(_:)();
      sub_10000D6E8((uint64_t)&v45, &qword_10001E400);
      sub_100004C08();
    }
    else
    {
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
      NSString v46 = (void *)type metadata accessor for RemoteEngagementViewController();
      id v45 = v1;
      id v9 = v1;
      id v10 = (id)AMSLogKey();
      if (v10)
      {
        Swift::String v11 = v10;
        uint64_t v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v13 = v12;

        sub_10000820C();
        sub_100008180();
        sub_10000E854();
        uint64_t v14 = swift_getMetatypeMetadata();
        sub_10000E8D8(v14);
        sub_10000EB14();
        sub_10000819C();
        unint64_t v44 = &type metadata for String;
        uint64_t v42 = v41;
        uint64_t v43 = v13;
        LogMessage.StringInterpolation.appendInterpolation(safe:)();
        sub_10000EB14();
        uint64_t v15 = 93;
      }
      else
      {
        sub_1000081F4();
        sub_100008180();
        sub_10000E854();
        uint64_t v36 = swift_getMetatypeMetadata();
        sub_10000E8D8(v36);
        sub_10000D6E8((uint64_t)&v42, &qword_10001E400);
        uint64_t v15 = 58;
      }
      unint64_t v37 = 0xE100000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v15);
      LogMessage.init(stringInterpolation:)();
      type metadata accessor for Log();
      sub_10000E9DC();
      sub_10000EA6C();
      LogMessage.init(stringLiteral:)();
      sub_100004DCC();
    }
    swift_bridgeObjectRelease();
    sub_10000AA88(v5);
    sub_10000A340();
    sub_10000A554();
    if (v0) {
      v0();
    }
    swift_unknownObjectRelease();
  }
  else
  {
    sub_100003650((uint64_t *)&unk_10001E740);
    uint64_t v16 = type metadata accessor for LogMessage();
    sub_100008110(v16);
    sub_10000EAA0();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
    NSString v46 = (void *)type metadata accessor for RemoteEngagementViewController();
    id v45 = v1;
    id v17 = v1;
    id v18 = (id)AMSLogKey();
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v22 = v21;

      sub_10000820C();
      sub_100008180();
      sub_10000E854();
      uint64_t v23 = swift_getMetatypeMetadata();
      sub_10000E8D8(v23);
      sub_10000EAFC();
      sub_10000819C();
      unint64_t v44 = &type metadata for String;
      uint64_t v42 = v20;
      uint64_t v43 = v22;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000EAFC();
      uint64_t v24 = 93;
    }
    else
    {
      sub_1000081F4();
      sub_100008180();
      sub_10000E854();
      uint64_t v25 = swift_getMetatypeMetadata();
      sub_10000E8D8(v25);
      sub_10000D6E8((uint64_t)&v42, &qword_10001E400);
      uint64_t v24 = 58;
    }
    unint64_t v26 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v24);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_10000E9DC();
    LogMessage.init(stringLiteral:)();
    sub_100004C08();
    uint64_t v27 = swift_bridgeObjectRelease();
    if (v0) {
      ((void (*)(uint64_t))v0)(v27);
    }
  }
  sub_10000E8F8();
}

void sub_100009318()
{
  sub_10000E980();
  uint64_t v2 = sub_10000EAC8();
  uint64_t v3 = sub_100008284(v2);
  __chkstk_darwin(v3);
  sub_10000EA40();
  if (v1) {
    uint64_t v4 = sub_10000E614(v1);
  }
  else {
    uint64_t v4 = 0;
  }
  __int16 v5 = sub_1000059E8(v4);
  swift_bridgeObjectRelease();
  sub_100003650((uint64_t *)&unk_10001E740);
  uint64_t v6 = type metadata accessor for LogMessage();
  sub_100008110(v6);
  if ((v5 & 0x100) != 0)
  {
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012EC0;
    uint64_t v32 = (void *)type metadata accessor for RemoteEngagementViewController();
    uint64_t v31 = v1;
    id v15 = v1;
    id v16 = (id)AMSLogKey();
    if (v16)
    {
      id v17 = v16;
      uint64_t v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v19 = v18;

      sub_10000820C();
      sub_10000E9B4();
      sub_10000E854();
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      sub_10000E930(MetatypeMetadata);
      sub_10000EAFC();
      sub_10000819C();
      id v30 = &type metadata for String;
      uint64_t v28 = v27;
      uint64_t v29 = v19;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000EAFC();
      uint64_t v21 = 93;
    }
    else
    {
      sub_1000081F4();
      sub_10000E9B4();
      sub_10000E854();
      uint64_t v24 = swift_getMetatypeMetadata();
      sub_10000E930(v24);
      sub_10000D6E8((uint64_t)&v28, &qword_10001E400);
      uint64_t v21 = 58;
    }
    unint64_t v25 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v21);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_10000E9DC();
    LogMessage.init(stringLiteral:)();
    uint64_t v32 = &unk_100018E48;
    LOBYTE(v31) = v5;
    static LogMessage.safe(_:)();
    sub_10000D6E8((uint64_t)&v31, &qword_10001E400);
    sub_100004C08();
  }
  else
  {
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
    uint64_t v32 = (void *)type metadata accessor for RemoteEngagementViewController();
    uint64_t v31 = v1;
    id v7 = v1;
    id v8 = (id)AMSLogKey();
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v12 = v11;

      sub_10000820C();
      sub_10000E9B4();
      sub_10000E854();
      uint64_t v13 = swift_getMetatypeMetadata();
      sub_10000E930(v13);
      sub_10000D6E8((uint64_t)&v28, &qword_10001E400);
      sub_10000819C();
      id v30 = &type metadata for String;
      uint64_t v28 = v10;
      uint64_t v29 = v12;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000D6E8((uint64_t)&v28, &qword_10001E400);
      uint64_t v14 = 93;
    }
    else
    {
      sub_1000081F4();
      sub_10000E9B4();
      sub_10000E854();
      uint64_t v22 = swift_getMetatypeMetadata();
      sub_10000E930(v22);
      sub_10000D6E8((uint64_t)&v28, &qword_10001E400);
      uint64_t v14 = 58;
    }
    unint64_t v23 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v14);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_10000E9DC();
    sub_10000EA6C();
    LogMessage.init(stringLiteral:)();
    sub_100004DCC();
  }
  uint64_t v26 = swift_bridgeObjectRelease();
  if (v0) {
    v0(v26);
  }
  sub_10000E8F8();
}

uint64_t sub_10000978C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = swift_bridgeObjectRetain();
    uint64_t v3 = sub_10000EDE8(v2);
    if (!v3)
    {
      swift_bridgeObjectRelease();
      id v7 = &_swiftEmptyArrayStorage;
LABEL_20:
      uint64_t v32 = sub_1000099F8((uint64_t)v7);
      sub_100006240(v32);
      return swift_bridgeObjectRelease();
    }
    uint64_t v4 = v3;
    unint64_t v37 = &_swiftEmptyArrayStorage;
    sub_10000E4FC(0, v3 & ~(v3 >> 63), 0);
    if ((v1 & 0xC000000000000001) != 0)
    {
      unint64_t result = __CocoaSet.startIndex.getter();
      char v6 = 1;
    }
    else
    {
      unint64_t result = sub_100011B74(v1);
      char v6 = v8 & 1;
    }
    uint64_t v34 = result;
    uint64_t v35 = v5;
    char v36 = v6;
    if ((v4 & 0x8000000000000000) == 0)
    {
      do
      {
        uint64_t v10 = v34;
        uint64_t v9 = v35;
        char v11 = v36;
        uint64_t v12 = sub_10000EAE8();
        sub_100011944(v12, v13, v14, v15);
        id v17 = v16;
        id v18 = [v16 events];

        uint64_t v19 = v37;
        unint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          unint64_t result = (uint64_t)sub_10000E4FC(0, v19[2] + 1, 1);
          uint64_t v19 = v37;
        }
        unint64_t v21 = v19[2];
        unint64_t v20 = v19[3];
        if (v21 >= v20 >> 1)
        {
          unint64_t result = (uint64_t)sub_10000E4FC((char *)(v20 > 1), v21 + 1, 1);
          uint64_t v19 = v37;
        }
        v19[2] = v21 + 1;
        v19[v21 + 4] = v18;
        if ((v1 & 0xC000000000000001) != 0)
        {
          if ((v11 & 1) == 0) {
            goto LABEL_22;
          }
          if (__CocoaSet.Index.handleBitPattern.getter()) {
            swift_isUniquelyReferenced_nonNull_native();
          }
          sub_100003650(&qword_10001E8D8);
          uint64_t v31 = (void (*)(char *, void))Set.Index._asCocoa.modify();
          __CocoaSet.formIndex(after:isUnique:)();
          v31(v33, 0);
        }
        else
        {
          int64_t v22 = sub_10000EAE8();
          int64_t v26 = sub_10000E680(v22, v23, v24, v25);
          uint64_t v28 = v27;
          char v30 = v29;
          sub_10000E764(v10, v9, v11);
          uint64_t v34 = v26;
          uint64_t v35 = v28;
          char v36 = v30 & 1;
        }
        --v4;
      }
      while (v4);
      sub_10000E764(v34, v35, v36);
      swift_bridgeObjectRelease();
      id v7 = v37;
      goto LABEL_20;
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1000099F8(uint64_t a1)
{
  sub_10000E770();
  uint64_t v2 = Set.init(minimumCapacity:)();
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      Swift::UInt v5 = *(void *)(a1 + 8 * i + 32);
      sub_10000DBD4(&v8, v5);
    }
    swift_bridgeObjectRelease();
    return v9;
  }
  else
  {
    uint64_t v6 = v2;
    swift_bridgeObjectRelease();
  }
  return v6;
}

void sub_100009B28()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  [super loadView];
  id v1 = [v0 view];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [self clearColor];
    [v2 setBackgroundColor:v3];
  }
  else
  {
    __break(1u);
  }
}

void sub_100009C10()
{
  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  [super viewDidLoad];
  sub_10000A170();
  type metadata accessor for RemoteEngagementPresenter();
  sub_10000DB10(&qword_10001E8C0, (void (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  ViewControllerPresenter.viewDidLoad()();
}

void sub_100009D60(char a1)
{
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  [super viewDidAppear:a1 & 1];
  sub_10000A768();
  sub_1000077C4();
}

uint64_t sub_100009E0C(char a1)
{
  uint64_t v4 = type metadata accessor for ViewWillDisappearReason();
  sub_10000E88C();
  uint64_t v6 = v5;
  __chkstk_darwin(v7);
  sub_10000E968();
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  [super viewWillDisappear:a1 & 1];
  static ViewWillDisappearReason.inferred(for:)();
  type metadata accessor for RemoteEngagementPresenter();
  sub_10000DB10(&qword_10001E8C0, (void (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  ViewControllerPresenter.viewWillDisappear(forReason:)();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v2, v4);
}

uint64_t sub_100009F78(char a1, SEL *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  v10.receiver = v3;
  v10.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  [super a1 & 1];
  uint64_t v7 = type metadata accessor for RemoteEngagementPresenter();
  uint64_t v8 = sub_10000DB10(&qword_10001E8C0, (void (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  return a3(v7, v8);
}

void sub_10000A094()
{
  v1.receiver = v0;
  v1.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  [super didReceiveMemoryWarning];
  type metadata accessor for RemoteEngagementPresenter();
  sub_10000DB10(&qword_10001E8C0, (void (*)(uint64_t))type metadata accessor for RemoteEngagementPresenter);
  ViewControllerPresenter.viewDidReceiveMemoryWarning()();
}

void sub_10000A170()
{
  uint64_t v0 = sub_100003650(&qword_10001E898);
  sub_10000E88C();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  uint64_t v5 = &v7[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  sub_10000E950();
  sub_10000EA78();
  sub_100003650(&qword_10001E8A0);
  sub_10000DA54(&qword_10001E8A8, &qword_10001E8A0);
  swift_retain();
  dispatch thunk of static EventEmitter.defaultScheduler.getter();
  EventEmitter.addObserver(on:singleUse:_:)();
  swift_release();
  swift_release();
  sub_100003A78((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  sub_10000EA58();
}

void sub_10000A2DC(uint64_t a1)
{
  sub_10000D62C(a1, (uint64_t)v3);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    sub_10000D00C();
  }
}

void sub_10000A340()
{
  uint64_t v1 = type metadata accessor for LogMessage.StringInterpolation();
  uint64_t v2 = sub_100008284(v1);
  __chkstk_darwin(v2);
  uint64_t v3 = (void *)sub_10000EA1C();
  if (v3)
  {
    [v3 setAllowsAlertStacking:1];
    sub_10000EA58();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_100003650((uint64_t *)&unk_10001E740);
    uint64_t v5 = type metadata accessor for LogMessage();
    sub_100008110(v5);
    *(_OWORD *)(sub_10000E9F4() + 16) = xmmword_1000131D0;
    v17[3] = type metadata accessor for RemoteEngagementViewController();
    v17[0] = v0;
    id v6 = v0;
    id v7 = (id)AMSLogKey();
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v11 = v10;

      sub_10000820C();
      sub_10000E998();
      sub_10000E8A8(v17);
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      sub_10000E910(MetatypeMetadata);
      sub_10000EAB0();
      sub_10000819C();
      v16[3] = &type metadata for String;
      v16[0] = v9;
      v16[1] = v11;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000EAB0();
      uint64_t v13 = 93;
    }
    else
    {
      sub_1000081F4();
      sub_10000E998();
      sub_10000E8A8(v17);
      uint64_t v14 = swift_getMetatypeMetadata();
      sub_10000E910(v14);
      sub_10000D6E8((uint64_t)v16, &qword_10001E400);
      uint64_t v13 = 58;
    }
    unint64_t v15 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v13);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_100003A78((uint64_t)v17);
    sub_10000EA6C();
    LogMessage.init(stringLiteral:)();
    sub_100004C08();
    swift_bridgeObjectRelease();
    sub_10000EA58();
  }
}

void sub_10000A554()
{
  uint64_t v1 = type metadata accessor for LogMessage.StringInterpolation();
  uint64_t v2 = sub_100008284(v1);
  __chkstk_darwin(v2);
  uint64_t v3 = (void *)sub_10000EA1C();
  if (v3)
  {
    [v3 setDesiredHardwareButtonEvents:16];
    sub_10000EA58();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_100003650((uint64_t *)&unk_10001E740);
    uint64_t v5 = type metadata accessor for LogMessage();
    sub_100008110(v5);
    *(_OWORD *)(sub_10000E9F4() + 16) = xmmword_1000131D0;
    v17[3] = type metadata accessor for RemoteEngagementViewController();
    v17[0] = v0;
    id v6 = v0;
    id v7 = (id)AMSLogKey();
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v11 = v10;

      sub_10000820C();
      sub_10000E998();
      sub_10000E8A8(v17);
      uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
      sub_10000E910(MetatypeMetadata);
      sub_10000EAB0();
      sub_10000819C();
      v16[3] = &type metadata for String;
      v16[0] = v9;
      v16[1] = v11;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000EAB0();
      uint64_t v13 = 93;
    }
    else
    {
      sub_1000081F4();
      sub_10000E998();
      sub_10000E8A8(v17);
      uint64_t v14 = swift_getMetatypeMetadata();
      sub_10000E910(v14);
      sub_10000D6E8((uint64_t)v16, &qword_10001E400);
      uint64_t v13 = 58;
    }
    unint64_t v15 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v13);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_100003A78((uint64_t)v17);
    sub_10000EA6C();
    LogMessage.init(stringLiteral:)();
    sub_100004C08();
    swift_bridgeObjectRelease();
    sub_10000EA58();
  }
}

void sub_10000A768()
{
  uint64_t v1 = type metadata accessor for LogMessage.StringInterpolation();
  uint64_t v2 = sub_100008284(v1);
  __chkstk_darwin(v2);
  sub_100008224();
  id v3 = [v0 view];
  if (!v3)
  {
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v4 = v3;
  id v5 = [v3 window];

  if (v5)
  {
    id v6 = self;
    id v7 = v5;
    id v8 = [v6 systemBlueColor];
    [v7 setTintColor:v8];

    id v9 = [v7 _rootSheetPresentationController];
    if (v9)
    {
      [v9 _setShouldScaleDownBehindDescendantSheets:0];

      sub_10000EA58();

      return;
    }
LABEL_12:
    __break(1u);
    return;
  }
  sub_100003650((uint64_t *)&unk_10001E740);
  uint64_t v12 = type metadata accessor for LogMessage();
  sub_100008110(v12);
  sub_10000EAA0();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
  uint64_t v26 = type metadata accessor for RemoteEngagementViewController();
  v25[0] = v0;
  id v13 = v0;
  id v14 = (id)AMSLogKey();
  if (v14)
  {
    unint64_t v15 = v14;
    uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = v17;

    sub_10000820C();
    sub_100008254();
    sub_100004A10(v25, v26);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v23[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v23, &qword_10001E400);
    sub_10000819C();
    uint64_t MetatypeMetadata = &type metadata for String;
    v23[0] = v16;
    v23[1] = v18;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v23, &qword_10001E400);
    uint64_t v20 = 93;
  }
  else
  {
    sub_1000081F4();
    sub_100008254();
    sub_100004A10(v25, v26);
    uint64_t v21 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v23[0] = v21;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v23, &qword_10001E400);
    uint64_t v20 = 58;
  }
  unint64_t v22 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v20);
  LogMessage.init(stringInterpolation:)();
  type metadata accessor for Log();
  sub_100003A78((uint64_t)v25);
  sub_10000EA6C();
  LogMessage.init(stringLiteral:)();
  sub_100004C08();
  swift_bridgeObjectRelease();
  sub_10000EA58();
}

void sub_10000AA88(uint64_t a1)
{
  id v3 = [objc_allocWithZone((Class)NSXPCListenerEndpoint) init];
  [v3 _setEndpoint:a1];
  sub_10000834C((uint64_t)[objc_allocWithZone((Class)NSXPCConnection) initWithListenerEndpoint:v3]);
  uint64_t v4 = OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection;
  id v5 = *(void **)(v1 + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection);
  if (!v5) {
    goto LABEL_7;
  }
  id v6 = self;
  id v7 = v5;
  id v8 = [v6 interfaceWithProtocol:&OBJC_PROTOCOL___AMSSystemEngagementTaskRemoteInterface];
  sub_10000EB2C((uint64_t)v8, "setExportedInterface:");

  id v9 = *(void **)(v1 + v4);
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v10 = self;
  id v11 = v9;
  id v12 = [v10 interfaceWithProtocol:&OBJC_PROTOCOL___AMSSystemEngagementTaskClientInterface];
  sub_10000EB2C((uint64_t)v12, "setRemoteObjectInterface:");

  id v13 = *(void **)(v1 + v4);
  if (!v13) {
    goto LABEL_8;
  }
  [v13 setExportedObject:v1];
  id v14 = *(void **)(v1 + v4);
  if (!v14) {
    goto LABEL_7;
  }
  uint64_t v15 = sub_10000E950();
  sub_10000EA78();
  char v29 = sub_10000DA3C;
  uint64_t v30 = v15;
  uint64_t v25 = _NSConcreteStackBlock;
  uint64_t v26 = 1107296256;
  uint64_t v27 = sub_100008308;
  uint64_t v28 = &unk_100019060;
  uint64_t v16 = _Block_copy(&v25);
  id v17 = v14;
  uint64_t v18 = swift_release();
  sub_10000EB2C(v18, "setInvalidationHandler:");
  _Block_release(v16);

  uint64_t v19 = *(void **)(v1 + v4);
  if (v19)
  {
    uint64_t v20 = sub_10000E950();
    sub_10000EA78();
    char v29 = sub_10000DA44;
    uint64_t v30 = v20;
    uint64_t v25 = _NSConcreteStackBlock;
    uint64_t v26 = 1107296256;
    uint64_t v27 = sub_100008308;
    uint64_t v28 = &unk_100019088;
    uint64_t v21 = _Block_copy(&v25);
    id v22 = v19;
    uint64_t v23 = swift_release();
    sub_10000EB2C(v23, "setInterruptionHandler:");
    _Block_release(v21);

    id v13 = *(void **)(v1 + v4);
  }
  else
  {
LABEL_7:
    id v13 = 0;
  }
LABEL_8:
  [v13 resume];
  char v24 = (void *)sub_100008358();
  if (v24)
  {
    [v24 initializeClientToViewServiceConnection];
    swift_unknownObjectRelease();
  }
}

void sub_10000AD70()
{
  uint64_t v0 = type metadata accessor for LogMessage.StringInterpolation();
  __chkstk_darwin(v0 - 8);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    sub_100003650((uint64_t *)&unk_10001E740);
    type metadata accessor for LogMessage();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
    uint64_t v19 = type metadata accessor for RemoteEngagementViewController();
    v18[0] = v2;
    id v3 = v2;
    id v4 = (id)AMSLogKey();
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v8 = v7;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v9._uint64_t countAndFlagsBits = 0;
      v9._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v9);
      sub_100004A10(v18, v19);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v16[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000D6E8((uint64_t)v16, &qword_10001E400);
      v11._uint64_t countAndFlagsBits = 5972026;
      v11._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v11);
      uint64_t MetatypeMetadata = &type metadata for String;
      v16[0] = v6;
      v16[1] = v8;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000D6E8((uint64_t)v16, &qword_10001E400);
      uint64_t v12 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v13._uint64_t countAndFlagsBits = 0;
      v13._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v13);
      sub_100004A10(v18, v19);
      uint64_t v14 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v16[0] = v14;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000D6E8((uint64_t)v16, &qword_10001E400);
      uint64_t v12 = 58;
    }
    unint64_t v15 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v12);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_100003A78((uint64_t)v18);
    LogMessage.init(stringLiteral:)();
    sub_100004C08();
    swift_bridgeObjectRelease();
    sub_10000834C(0);
  }
}

void sub_10000B048()
{
  uint64_t v0 = type metadata accessor for LogMessage.StringInterpolation();
  __chkstk_darwin(v0 - 8);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    sub_100003650((uint64_t *)&unk_10001E740);
    type metadata accessor for LogMessage();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
    uint64_t v19 = type metadata accessor for RemoteEngagementViewController();
    v18[0] = v2;
    id v3 = v2;
    id v4 = (id)AMSLogKey();
    if (v4)
    {
      id v5 = v4;
      uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v8 = v7;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v9._uint64_t countAndFlagsBits = 0;
      v9._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v9);
      sub_100004A10(v18, v19);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v16[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000D6E8((uint64_t)v16, &qword_10001E400);
      v11._uint64_t countAndFlagsBits = 5972026;
      v11._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v11);
      uint64_t MetatypeMetadata = &type metadata for String;
      v16[0] = v6;
      v16[1] = v8;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000D6E8((uint64_t)v16, &qword_10001E400);
      uint64_t v12 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v13._uint64_t countAndFlagsBits = 0;
      v13._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v13);
      sub_100004A10(v18, v19);
      uint64_t v14 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v16[0] = v14;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000D6E8((uint64_t)v16, &qword_10001E400);
      uint64_t v12 = 58;
    }
    unint64_t v15 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v12);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_100003A78((uint64_t)v18);
    LogMessage.init(stringLiteral:)();
    sub_100004C08();
    swift_bridgeObjectRelease();
    [*(id *)&v3[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection] invalidate];
    sub_10000834C(0);
  }
}

id sub_10000B338()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task];
  if (v1) {
    [v1 cancel];
  }
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  return [super dealloc];
}

void sub_10000B40C(char a1, void *a2, uint64_t a3)
{
  id v7 = [v3 presentedViewController];
  if (v7)
  {
    uint64_t v8 = v7;
    if (a2)
    {
      v9[4] = a2;
      v9[5] = a3;
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 1107296256;
      v9[2] = sub_100008308;
      v9[3] = &unk_100019038;
      a2 = _Block_copy(v9);
      swift_retain();
      swift_release();
    }
    [v8 dismissViewControllerAnimated:a1 & 1 completion:a2];
    _Block_release(a2);
  }
  else if (a2)
  {
    ((void (*)(void))a2)();
  }
}

void sub_10000B510()
{
  sub_10000E980();
  char v2 = v1;
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation();
  uint64_t v4 = sub_100008284(v3);
  __chkstk_darwin(v4);
  sub_100008224();
  sub_100003650((uint64_t *)&unk_10001E740);
  uint64_t v5 = type metadata accessor for LogMessage();
  sub_100008110(v5);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
  uint64_t v21 = (void *)type metadata accessor for RemoteEngagementViewController();
  v20[0] = v0;
  v0;
  id v6 = (id)AMSLogKey();
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;

    sub_10000820C();
    sub_100008254();
    sub_100004A10(v20, (uint64_t)v21);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v18, &qword_10001E400);
    sub_10000819C();
    uint64_t MetatypeMetadata = &type metadata for String;
    v18[0] = v8;
    v18[1] = v10;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v18, &qword_10001E400);
    uint64_t v12 = 93;
  }
  else
  {
    sub_1000081F4();
    sub_100008254();
    sub_100004A10(v20, (uint64_t)v21);
    uint64_t v13 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v18[0] = v13;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v18, &qword_10001E400);
    uint64_t v12 = 58;
  }
  unint64_t v14 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v12);
  LogMessage.init(stringInterpolation:)();
  type metadata accessor for Log();
  sub_10000E9DC();
  uint64_t v21 = &type metadata for String;
  v20[0] = 0xD000000000000026;
  v20[1] = 0x8000000100013C20;
  static LogMessage.safe(_:)();
  sub_10000D6E8((uint64_t)v20, &qword_10001E400);
  sub_100004E04();
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_10000E950();
  swift_unknownObjectWeakInit();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  char v17 = v2 & 1;
  *(unsigned char *)(v16 + 24) = v17;
  swift_retain();
  sub_10000B40C(v17, sub_10000DA28, v16);
  swift_release();
  swift_release();
  sub_10000E8F8();
}

void sub_10000B7D8(uint64_t a1, char a2)
{
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation();
  __chkstk_darwin(v3 - 8);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_100003650((uint64_t *)&unk_10001E740);
    type metadata accessor for LogMessage();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
    uint64_t v23 = (void *)type metadata accessor for RemoteEngagementViewController();
    aBlock[0] = v5;
    id v6 = v5;
    id v7 = (id)AMSLogKey();
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v11 = v10;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v12._uint64_t countAndFlagsBits = 0;
      v12._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v12);
      sub_100004A10(aBlock, (uint64_t)v23);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v26[0] = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000D6E8((uint64_t)v26, &qword_10001E400);
      v14._uint64_t countAndFlagsBits = 5972026;
      v14._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v14);
      uint64_t MetatypeMetadata = &type metadata for String;
      v26[0] = v9;
      v26[1] = v11;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000D6E8((uint64_t)v26, &qword_10001E400);
      uint64_t v15 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v16._uint64_t countAndFlagsBits = 0;
      v16._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v16);
      sub_100004A10(aBlock, (uint64_t)v23);
      uint64_t v17 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      v26[0] = v17;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_10000D6E8((uint64_t)v26, &qword_10001E400);
      uint64_t v15 = 58;
    }
    unint64_t v18 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v15);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_100003A78((uint64_t)aBlock);
    LogMessage.init(stringLiteral:)();
    sub_100004E04();
    swift_bridgeObjectRelease();
    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v6;
    char v24 = sub_10000DA34;
    uint64_t v25 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100008308;
    uint64_t v23 = &unk_100019010;
    uint64_t v20 = _Block_copy(aBlock);
    id v21 = v6;
    swift_release();
    [v21 dismissViewControllerAnimated:a2 & 1 completion:v20];
    _Block_release(v20);
  }
}

void *sub_10000BB60(void *a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation();
  __chkstk_darwin(v2 - 8);
  sub_100003650((uint64_t *)&unk_10001E740);
  type metadata accessor for LogMessage();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
  uint64_t v20 = type metadata accessor for RemoteEngagementViewController();
  v19[0] = a1;
  a1;
  id v3 = (id)AMSLogKey();
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v8._uint64_t countAndFlagsBits = 0;
    v8._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v8);
    sub_100004A10(v19, v20);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v17[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v17, &qword_10001E400);
    v10._uint64_t countAndFlagsBits = 5972026;
    v10._object = (void *)0xE300000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v10);
    uint64_t MetatypeMetadata = &type metadata for String;
    v17[0] = v5;
    v17[1] = v7;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v17, &qword_10001E400);
    uint64_t v11 = 93;
  }
  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v12._uint64_t countAndFlagsBits = 0;
    v12._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v12);
    sub_100004A10(v19, v20);
    uint64_t v13 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v17[0] = v13;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v17, &qword_10001E400);
    uint64_t v11 = 58;
  }
  unint64_t v14 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v11);
  LogMessage.init(stringInterpolation:)();
  type metadata accessor for Log();
  sub_100003A78((uint64_t)v19);
  LogMessage.init(stringLiteral:)();
  sub_100004E04();
  swift_bridgeObjectRelease();
  uint64_t v15 = (void *)sub_10000881C();
  if (v15)
  {
    [v15 dismiss];
    swift_unknownObjectRelease();
  }
  unint64_t result = (void *)sub_10000881C();
  if (result)
  {
    [result invalidate];
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void sub_10000BE48(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_100008358();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    if (a2) {
      a2 = (void *)_convertErrorToNSError(_:)();
    }
    uint64_t v6 = sub_10000E950();
    sub_10000EA78();
    v8[4] = sub_10000D9E8;
    v8[5] = v6;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 1107296256;
    v8[2] = sub_100008308;
    v8[3] = &unk_100018F98;
    uint64_t v7 = _Block_copy(v8);
    swift_release();
    [v5 engagementTaskDidFinishWithResult:a1 error:a2 completion:v7];
    _Block_release(v7);

    sub_100008D0C(0);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_10000BFD4();
  }
}

void sub_10000BF80()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    char v1 = (void *)Strong;
    sub_10000BFD4();
  }
}

void sub_10000BFD4()
{
  sub_10000E980();
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  sub_10000E88C();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_10000E968();
  uint64_t v7 = type metadata accessor for DispatchQoS();
  sub_10000E88C();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_10000EA40();
  if ([self isMainThread])
  {
    sub_10000E8F8();
    sub_10000B510();
  }
  else
  {
    sub_1000079A8(0, &qword_10001E818);
    uint64_t v15 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v12 = sub_10000E950();
    *(void *)(v12 + 16) = v0;
    void v16[4] = sub_10000D998;
    v16[5] = v12;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    v16[2] = sub_100008308;
    void v16[3] = &unk_100018F70;
    uint64_t v13 = _Block_copy(v16);
    id v14 = v0;
    swift_release();
    static DispatchQoS.unspecified.getter();
    v16[0] = &_swiftEmptyArrayStorage;
    sub_10000DB10(&qword_10001E820, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100003650(&qword_10001E828);
    sub_10000DA54(&qword_10001E830, &qword_10001E828);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v13);

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v7);
    sub_10000E8F8();
  }
}

void sub_10000C274()
{
}

uint64_t sub_10000C29C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000E950();
  sub_10000EA78();
  uint64_t v7 = (void *)swift_allocObject();
  _OWORD v7[2] = v6;
  v7[3] = a1;
  v7[4] = a2;
  v7[5] = a3;
  swift_retain();
  swift_errorRetain();
  sub_100004A00(a2);
  sub_10000B40C(1, sub_10000D95C, (uint64_t)v7);
  swift_release();

  return swift_release();
}

void sub_10000C360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (void *)Strong;
    objc_allocWithZone((Class)type metadata accessor for ErrorViewController());
    swift_errorRetain();
    sub_100004A00(a3);
    id v9 = sub_100003B8C(a2, a3, a4);
    [v8 presentViewController:v9 animated:1 completion:0];
  }
}

void sub_10000C428()
{
  sub_10000E980();
  uint64_t v35 = v1;
  uint64_t v36 = v0;
  uint64_t v34 = v2;
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v9 = sub_100003650(&qword_10001E800);
  uint64_t v10 = sub_100008284(v9);
  __chkstk_darwin(v10);
  sub_100008224();
  uint64_t v11 = type metadata accessor for URL();
  sub_10000E88C();
  uint64_t v13 = v12;
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v33 - v18;
  id v20 = [v8 URL];
  if (!v20)
  {
    sub_10000D6C0(v0, 1, 1, v11);
    goto LABEL_5;
  }
  id v21 = v20;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  id v22 = *(void (**)(uint64_t, char *, uint64_t))(v13 + 32);
  v22(v0, v17, v11);
  sub_10000D6C0(v0, 0, 1, v11);
  if (sub_10000D7DC(v0, 1, v11) == 1)
  {
LABEL_5:
    sub_10000D6E8(v0, &qword_10001E800);
    goto LABEL_6;
  }
  v22((uint64_t)v19, (char *)v0, v11);
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v19, v11);
  id v23 = objc_allocWithZone((Class)AMSCampaignAttributionTask);
  swift_unknownObjectRetain();
  id v25 = sub_10000D804((uint64_t)v17, v6, v24);
  [v25 setClientInfo:v4];
  id v26 = [v8 account];
  [v25 setAccount:v26];

  id v27 = [v25 perform];
  (*(void (**)(char *, uint64_t))(v13 + 8))(v19, v11);
LABEL_6:
  uint64_t v28 = sub_10000E950();
  swift_unknownObjectWeakInit();
  char v29 = (void *)swift_allocObject();
  v29[2] = v28;
  v29[3] = v8;
  v29[4] = v6;
  v29[5] = v4;
  uint64_t v30 = v35;
  v29[6] = v34;
  v29[7] = v30;
  swift_unknownObjectRetain();
  swift_retain();
  id v31 = v8;
  id v32 = v4;
  swift_retain();
  sub_10000B40C(1, sub_10000D7CC, (uint64_t)v29);
  swift_release();
  swift_release();
  sub_10000E8F8();
}

void sub_10000C72C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = type metadata accessor for LogMessage.StringInterpolation();
  __chkstk_darwin(v11 - 8);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v13 = (void *)Strong;
    uint64_t v14 = *(void **)(Strong + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task);
    if (v14)
    {
      sub_100003650((uint64_t *)&unk_10001E740);
      type metadata accessor for LogMessage();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
      id v53 = (void *)type metadata accessor for RemoteEngagementViewController();
      aBlock[0] = v13;
      id v15 = v13;
      id v16 = v14;
      id v17 = (id)AMSLogKey();
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v20 = a6;
        uint64_t v21 = a5;
        uint64_t v23 = v22;

        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
        v24._uint64_t countAndFlagsBits = 0;
        v24._object = (void *)0xE000000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v24);
        sub_100004A10(aBlock, (uint64_t)v53);
        uint64_t DynamicType = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v56 = DynamicType;
        LogMessage.StringInterpolation.appendInterpolation(safe:)();
        sub_10000D6E8((uint64_t)&v56, &qword_10001E400);
        v26._uint64_t countAndFlagsBits = 5972026;
        v26._object = (void *)0xE300000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v26);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v56 = v19;
        uint64_t v57 = v23;
        a5 = v21;
        a6 = v20;
        LogMessage.StringInterpolation.appendInterpolation(safe:)();
        sub_10000D6E8((uint64_t)&v56, &qword_10001E400);
        uint64_t v27 = 93;
      }
      else
      {
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
        v36._uint64_t countAndFlagsBits = 0;
        v36._object = (void *)0xE000000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v36);
        sub_100004A10(aBlock, (uint64_t)v53);
        uint64_t v37 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v56 = v37;
        LogMessage.StringInterpolation.appendInterpolation(safe:)();
        sub_10000D6E8((uint64_t)&v56, &qword_10001E400);
        uint64_t v27 = 58;
      }
      unint64_t v38 = 0xE100000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v27);
      LogMessage.init(stringInterpolation:)();
      type metadata accessor for Log();
      sub_100003A78((uint64_t)aBlock);
      LogMessage.init(stringLiteral:)();
      sub_100004DCC();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v51 = a5;
      sub_100003650((uint64_t *)&unk_10001E740);
      type metadata accessor for LogMessage();
      *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
      id v53 = (void *)type metadata accessor for RemoteEngagementViewController();
      aBlock[0] = v13;
      id v50 = v13;
      id v28 = (id)AMSLogKey();
      if (v28)
      {
        char v29 = v28;
        uint64_t v30 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v49 = v31;

        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
        v32._uint64_t countAndFlagsBits = 0;
        v32._object = (void *)0xE000000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v32);
        sub_100004A10(aBlock, (uint64_t)v53);
        uint64_t v33 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v56 = v33;
        LogMessage.StringInterpolation.appendInterpolation(safe:)();
        sub_10000D6E8((uint64_t)&v56, &qword_10001E400);
        v34._uint64_t countAndFlagsBits = 5972026;
        v34._object = (void *)0xE300000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v34);
        uint64_t MetatypeMetadata = &type metadata for String;
        uint64_t v56 = v30;
        uint64_t v57 = v49;
        LogMessage.StringInterpolation.appendInterpolation(safe:)();
        sub_10000D6E8((uint64_t)&v56, &qword_10001E400);
        uint64_t v35 = 93;
      }
      else
      {
        LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
        v39._uint64_t countAndFlagsBits = 0;
        v39._object = (void *)0xE000000000000000;
        LogMessage.StringInterpolation.appendLiteral(_:)(v39);
        sub_100004A10(aBlock, (uint64_t)v53);
        uint64_t v40 = swift_getDynamicType();
        uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
        uint64_t v56 = v40;
        LogMessage.StringInterpolation.appendInterpolation(safe:)();
        sub_10000D6E8((uint64_t)&v56, &qword_10001E400);
        uint64_t v35 = 58;
      }
      a5 = v51;
      unint64_t v41 = 0xE100000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v35);
      LogMessage.init(stringInterpolation:)();
      type metadata accessor for Log();
      sub_100003A78((uint64_t)aBlock);
      LogMessage.init(stringLiteral:)();
      sub_100004DCC();
      swift_bridgeObjectRelease();
      sub_1000079A8(0, &qword_10001E808);
      id v42 = v50;
      id v43 = a2;
      swift_unknownObjectRetain();
      id v16 = sub_10000CE00(v43, a3, v42);
      [v16 setAllowMultiplePresentations:1];
      [v16 setClientInfo:a4];
      sub_100008D0C((uint64_t)v16);
    }
    id v44 = [v16 presentEngagement];
    uint64_t v45 = swift_allocObject();
    swift_unknownObjectWeakInit();
    NSString v46 = (void *)swift_allocObject();
    v46[2] = v45;
    void v46[3] = v16;
    v46[4] = a5;
    v46[5] = a6;
    id v54 = sub_10000D8E8;
    uint64_t v55 = v46;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000CF80;
    id v53 = &unk_100018EF8;
    NSString v47 = _Block_copy(aBlock);
    id v48 = v16;
    swift_retain();
    swift_release();
    [v44 addFinishBlock:v47];

    _Block_release(v47);
  }
}

id sub_10000CE00(void *a1, uint64_t a2, void *a3)
{
  id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) initWithRequest:a1 bag:a2 presentingViewController:a3];

  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_10000CE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v9 = (void *)Strong;
    uint64_t v10 = *(void **)(Strong + OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task);
    id v11 = v10;

    if (v10)
    {
      sub_1000079A8(0, &qword_10001E810);
      if (static NSObject.== infix(_:_:)())
      {
        swift_beginAccess();
        uint64_t v12 = swift_unknownObjectWeakLoadStrong();
        if (v12)
        {
          uint64_t v13 = (void *)v12;
          sub_100008D0C(0);
        }
      }
    }
  }
  return a5(a1, a2);
}

void sub_10000CF80(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_10000D00C()
{
  sub_10000E980();
  uint64_t v2 = v1;
  uint64_t v3 = type metadata accessor for LogMessage.StringInterpolation();
  uint64_t v4 = sub_100008284(v3);
  __chkstk_darwin(v4);
  sub_100008224();
  sub_100003650((uint64_t *)&unk_10001E740);
  uint64_t v5 = type metadata accessor for LogMessage();
  sub_100008110(v5);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012EC0;
  char v29 = (void *)type metadata accessor for RemoteEngagementViewController();
  id v26 = v0;
  v0;
  id v6 = (id)AMSLogKey();
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;

    sub_10000820C();
    sub_100008254();
    sub_100004A10(&v26, (uint64_t)v29);
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v24[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v24, &qword_10001E400);
    sub_10000819C();
    uint64_t MetatypeMetadata = &type metadata for String;
    v24[0] = v8;
    v24[1] = v10;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v24, &qword_10001E400);
    uint64_t v12 = 93;
  }
  else
  {
    sub_1000081F4();
    sub_100008254();
    sub_100004A10(&v26, (uint64_t)v29);
    uint64_t v13 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v24[0] = v13;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_10000D6E8((uint64_t)v24, &qword_10001E400);
    uint64_t v12 = 58;
  }
  unint64_t v14 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v12);
  LogMessage.init(stringInterpolation:)();
  type metadata accessor for Log();
  sub_100003A78((uint64_t)&v26);
  LogMessage.init(stringLiteral:)();
  char v29 = &unk_100018C70;
  id v26 = (id)swift_allocObject();
  sub_10000D62C(v2, (uint64_t)v26 + 16);
  sub_10000D688(v2);
  static LogMessage.safe(_:)();
  sub_10000D6E8((uint64_t)&v26, &qword_10001E400);
  sub_100004DCC();
  swift_bridgeObjectRelease();
  sub_10000D62C(v2, (uint64_t)&v26);
  if (v30)
  {
    if (v30 == 1)
    {
      id v15 = v26;
      id v16 = v28;
      swift_retain();
      id v17 = v15;
      swift_unknownObjectRetain();
      sub_10000C428();

      swift_unknownObjectRelease();
      swift_release();
    }
    else
    {
      uint64_t v21 = (uint64_t)v26;
      uint64_t v22 = (uint64_t)v27;
      uint64_t v23 = (uint64_t)v28;
      swift_errorRetain();
      sub_100004A00(v22);
      sub_10000C29C(v21, v22, v23);
      sub_100004A54(v22);
      swift_errorRelease();
    }
  }
  else
  {
    uint64_t v18 = (uint64_t)v26;
    uint64_t v19 = v27;
    id v20 = v26;
    swift_errorRetain();
    sub_10000BE48(v18, v19);
    swift_errorRelease();
  }
  sub_10000E8F8();
}

id sub_10000D3A0(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection] = 0;
  uint64_t v6 = OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_presenter;
  type metadata accessor for RemoteEngagementPresenter();
  swift_allocObject();
  id v7 = v3;
  *(void *)&v3[v6] = sub_100007768();
  *(void *)&v7[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task] = 0;

  if (a2)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  [super initWithNibName:v8 bundle:a3];

  return v9;
}

id sub_10000D4EC(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_connection] = 0;
  uint64_t v3 = OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_presenter;
  type metadata accessor for RemoteEngagementPresenter();
  swift_allocObject();
  uint64_t v4 = v1;
  *(void *)&v1[v3] = sub_100007768();
  *(void *)&v4[OBJC_IVAR____TtC24AMSEngagementViewService30RemoteEngagementViewController_task] = 0;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for RemoteEngagementViewController();
  [super initWithCoder:a1];

  return v5;
}

uint64_t type metadata accessor for RemoteEngagementViewController()
{
  return self;
}

uint64_t sub_10000D5E8()
{
  sub_100007428(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(unsigned char *)(v0 + 56));

  return _swift_deallocObject(v0, 57, 7);
}

uint64_t sub_10000D62C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000D688(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000D6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10000D6E8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003650(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D744()
{
  swift_unknownObjectWeakDestroy();
  uint64_t v0 = sub_10000EA90();

  return _swift_deallocObject(v0, v1, v2);
}

uint64_t sub_10000D774()
{
  swift_release();

  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

void sub_10000D7CC()
{
  sub_10000C72C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32), *(void *)(v0 + 40), *(void *)(v0 + 48), *(void *)(v0 + 56));
}

uint64_t sub_10000D7DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

id sub_10000D804@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, NSURL *a3@<X8>)
{
  uint64_t v4 = v3;
  URL._bridgeToObjectiveC()(a3);
  NSString v8 = v7;
  id v9 = [v4 initWithURL:v7 bag:a2];
  swift_unknownObjectRelease();

  uint64_t v10 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(a1, v10);
  return v9;
}

uint64_t sub_10000D8A0()
{
  swift_release();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000D8E8(uint64_t a1, uint64_t a2)
{
  return sub_10000CE6C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24), *(uint64_t (**)(uint64_t, uint64_t))(v2 + 32));
}

uint64_t sub_10000D8F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000D904()
{
  return swift_release();
}

uint64_t sub_10000D90C()
{
  swift_release();
  swift_errorRelease();
  if (*(void *)(v0 + 32)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10000D95C()
{
  sub_10000C360(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_10000D968()
{
  uint64_t v1 = sub_10000EA90();

  return _swift_deallocObject(v1, v2, v3);
}

void sub_10000D998()
{
}

uint64_t sub_10000D9A0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_10000D9E8()
{
}

uint64_t sub_10000D9F0()
{
  swift_release();

  return _swift_deallocObject(v0, 25, 7);
}

void sub_10000DA28()
{
  sub_10000B7D8(*(void *)(v0 + 16), *(unsigned char *)(v0 + 24));
}

void *sub_10000DA34()
{
  return sub_10000BB60(*(void **)(v0 + 16));
}

void sub_10000DA3C()
{
}

void sub_10000DA44()
{
}

void sub_10000DA4C(uint64_t a1)
{
}

uint64_t sub_10000DA54(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000D9A0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000DA98(uint64_t a1)
{
  return sub_100008980(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000DAA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003650(&qword_10001E400);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000DB08(uint64_t a1)
{
  return sub_1000084A0(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000DB10(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10000DB58()
{
  unint64_t result = qword_10001E8D0;
  if (!qword_10001E8D0)
  {
    sub_1000079A8(255, &qword_10001E8C8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E8D0);
  }
  return result;
}

uint64_t sub_10000DBB8(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_10000DBD4(Swift::UInt *a1, Swift::UInt a2)
{
  uint64_t v5 = *v2;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a2);
  Swift::Int v6 = Hasher._finalize()();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v13 = *v2;
    *uint64_t v2 = 0x8000000000000000;
    sub_10000DF9C(a2, v8, isUniquelyReferenced_nonNull_native);
    *uint64_t v2 = v13;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  if (*(void *)(v9 + 8 * v8) != a2)
  {
    uint64_t v10 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v10;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_7;
      }
    }
    while (*(void *)(v9 + 8 * v8) != a2);
  }
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_10000DCF4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100003650(&qword_10001E8E8);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (*(void *)(v2 + 16))
  {
    int64_t v5 = 0;
    Swift::Int v6 = (void *)(v2 + 56);
    uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v9 = v8 & *(void *)(v2 + 56);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v11 = result + 56;
    if (!v9) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
    {
      Swift::UInt v17 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v17);
      uint64_t result = Hasher._finalize()();
      uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v19 = result & ~v18;
      unint64_t v20 = v19 >> 6;
      if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v18) >> 6;
        while (++v20 != v23 || (v22 & 1) == 0)
        {
          BOOL v24 = v20 == v23;
          if (v20 == v23) {
            unint64_t v20 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v11 + 8 * v20);
          if (v25 != -1)
          {
            unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      *(void *)(*(void *)(v4 + 48) + 8 * v21) = v17;
      ++*(void *)(v4 + 16);
      if (v9) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v14 = v5 + 1;
      if (__OFADD__(v5, 1)) {
        goto LABEL_38;
      }
      if (v14 >= v10) {
        goto LABEL_32;
      }
      unint64_t v15 = v6[v14];
      ++v5;
      if (!v15)
      {
        int64_t v5 = v14 + 1;
        if (v14 + 1 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = v6[v5];
        if (!v15)
        {
          int64_t v5 = v14 + 2;
          if (v14 + 2 >= v10) {
            goto LABEL_32;
          }
          unint64_t v15 = v6[v5];
          if (!v15)
          {
            int64_t v16 = v14 + 3;
            if (v16 >= v10)
            {
LABEL_32:
              uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
              if (v26 > 63) {
                sub_10000DBB8(0, (unint64_t)(v26 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *Swift::Int v6 = -1 << v26;
              }
              uint64_t v1 = v0;
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v15 = v6[v16];
            if (!v15)
            {
              while (1)
              {
                int64_t v5 = v16 + 1;
                if (__OFADD__(v16, 1)) {
                  goto LABEL_39;
                }
                if (v5 >= v10) {
                  goto LABEL_32;
                }
                unint64_t v15 = v6[v5];
                ++v16;
                if (v15) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v5 = v16;
          }
        }
      }
LABEL_20:
      unint64_t v9 = (v15 - 1) & v15;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

Swift::Int sub_10000DF9C(Swift::Int result, unint64_t a2, char a3)
{
  Swift::UInt v5 = result;
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10000DCF4();
  }
  else
  {
    if (v7 > v6)
    {
      uint64_t result = (Swift::Int)sub_10000E0EC();
      goto LABEL_14;
    }
    sub_10000E284();
  }
  uint64_t v8 = *v3;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v5);
  uint64_t result = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v8 + 32);
  a2 = result & ~v9;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v10 = *(void *)(v8 + 48);
    if (*(void *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        if (*(void *)(v10 + 8 * a2) == v5) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v12 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v12 + 48) + 8 * a2) = v5;
  uint64_t v13 = *(void *)(v12 + 16);
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    *(void *)(v12 + 16) = v15;
  }
  return result;
}

void *sub_10000E0EC()
{
  uint64_t v1 = v0;
  sub_100003650(&qword_10001E8E8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(void *)(*(void *)(v4 + 48) + 8 * i) = *(void *)(*(void *)(v2 + 48) + 8 * i);
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000E284()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100003650(&qword_10001E8E8);
  uint64_t result = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = result;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v4;
    return result;
  }
  int64_t v5 = 0;
  uint64_t v6 = v2 + 56;
  uint64_t v7 = 1 << *(unsigned char *)(v2 + 32);
  if (v7 < 64) {
    uint64_t v8 = ~(-1 << v7);
  }
  else {
    uint64_t v8 = -1;
  }
  unint64_t v9 = v8 & *(void *)(v2 + 56);
  int64_t v10 = (unint64_t)(v7 + 63) >> 6;
  uint64_t v11 = result + 56;
  if (!v9) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v12 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  for (unint64_t i = v12 | (v5 << 6); ; unint64_t i = __clz(__rbit64(v15)) + (v5 << 6))
  {
    Swift::UInt v17 = *(void *)(*(void *)(v2 + 48) + 8 * i);
    Hasher.init(_seed:)();
    Hasher._combine(_:)(v17);
    uint64_t result = Hasher._finalize()();
    uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6))) == 0)
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v18) >> 6;
      while (++v20 != v23 || (v22 & 1) == 0)
      {
        BOOL v24 = v20 == v23;
        if (v20 == v23) {
          unint64_t v20 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)(v11 + 8 * v20);
        if (v25 != -1)
        {
          unint64_t v21 = __clz(__rbit64(~v25)) + (v20 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v11 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v11 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    *(void *)(*(void *)(v4 + 48) + 8 * v21) = v17;
    ++*(void *)(v4 + 16);
    if (v9) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v14 = v5 + 1;
    if (__OFADD__(v5, 1)) {
      goto LABEL_36;
    }
    if (v14 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      int64_t v5 = v14 + 1;
      if (v14 + 1 >= v10) {
        goto LABEL_32;
      }
      unint64_t v15 = *(void *)(v6 + 8 * v5);
      if (!v15)
      {
        int64_t v5 = v14 + 2;
        if (v14 + 2 >= v10) {
          goto LABEL_32;
        }
        unint64_t v15 = *(void *)(v6 + 8 * v5);
        if (!v15) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v9 = (v15 - 1) & v15;
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v10)
  {
LABEL_32:
    uint64_t result = swift_release();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v15 = *(void *)(v6 + 8 * v16);
  if (v15)
  {
    int64_t v5 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v5 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v5 >= v10) {
      goto LABEL_32;
    }
    unint64_t v15 = *(void *)(v6 + 8 * v5);
    ++v16;
    if (v15) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

char *sub_10000E4FC(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000E51C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_10000E51C(char *result, int64_t a2, char a3, char *a4)
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
    sub_100003650((uint64_t *)&unk_10001E8F0);
    int64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  int64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || &v13[8 * v8] <= v12) {
      memmove(v12, v13, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 8 * v8);
  }
  swift_release();
  return v10;
}

uint64_t sub_10000E614(void *a1)
{
  id v1 = [a1 userInfo];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

int64_t sub_10000E680(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    unint64_t v10 = *(void *)(v6 + 8 * v9);
    if (v10) {
      return __clz(__rbit64(v10)) + (v9 << 6);
    }
    unint64_t v11 = (unint64_t)(result + 63) >> 6;
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      unint64_t v10 = *(void *)(v6 + 8 * v9);
      if (v10) {
        return __clz(__rbit64(v10)) + (v9 << 6);
      }
      while (v5 + 3 < v11)
      {
        unint64_t v10 = *(void *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000E764(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_10000E770()
{
  unint64_t result = qword_10001E8E0;
  if (!qword_10001E8E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E8E0);
  }
  return result;
}

uint64_t sub_10000E7C0()
{
  _Block_release(*(const void **)(v0 + 16));
  uint64_t v1 = sub_10000EA90();

  return _swift_deallocObject(v1, v2, v3);
}

uint64_t sub_10000E7F0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_10000E854()
{
  sub_100004A10((void *)(v0 - 112), *(void *)(v0 - 88));
  return swift_getDynamicType();
}

uint64_t sub_10000E8A8(void *a1)
{
  sub_100004A10(a1, v1);
  return swift_getDynamicType();
}

uint64_t sub_10000E8D8(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

uint64_t sub_10000E910(uint64_t a1)
{
  *(void *)(v2 - 104) = a1;
  *(void *)(v2 - 128) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

uint64_t sub_10000E930(uint64_t a1)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 144) = v1;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

uint64_t sub_10000E950()
{
  return swift_allocObject();
}

void sub_10000E998()
{
  uint64_t v1 = 0;
  unint64_t v2 = 0xE000000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v1);
}

void sub_10000E9B4()
{
  uint64_t v1 = 0;
  unint64_t v2 = 0xE000000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v1);
}

uint64_t sub_10000E9D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v2 + a2) = a1;
  return _objc_release_x1();
}

uint64_t sub_10000E9DC()
{
  return sub_100003A78(v0 - 112);
}

uint64_t sub_10000E9F4()
{
  return swift_allocObject();
}

uint64_t sub_10000EA1C()
{
  return sub_10000881C();
}

uint64_t sub_10000EA78()
{
  return swift_unknownObjectWeakInit();
}

uint64_t sub_10000EA90()
{
  return v0;
}

uint64_t sub_10000EAB0()
{
  return sub_10000D6E8(v1 - 128, v0);
}

uint64_t sub_10000EAC8()
{
  return type metadata accessor for LogMessage.StringInterpolation();
}

uint64_t sub_10000EAE8()
{
  return v0;
}

uint64_t sub_10000EAFC()
{
  return sub_10000D6E8(v1 - 144, v0);
}

uint64_t sub_10000EB14()
{
  return sub_10000D6E8(v1 - 144, v0);
}

id sub_10000EB2C(uint64_t a1, const char *a2)
{
  return [v3 a2:v2];
}

void *sub_10000EB78()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC24AMSEngagementViewService13SceneDelegate_window);
  id v2 = v1;
  return v1;
}

uint64_t sub_10000EC04(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC24AMSEngagementViewService13SceneDelegate_window) = a1;
  return _objc_release_x1();
}

void sub_10000EC18(int a1, int a2, id a3)
{
  id v4 = [a3 URLContexts];
  sub_100011E28();
  sub_1000079A8(v5, v6);
  sub_100011E28();
  sub_1000118A0(v7, v8);
  uint64_t v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v10 = sub_10000EDEC(v9);
  swift_bridgeObjectRelease();
  if (v10 < 1)
  {
    id v15 = [a3 userActivities];
    sub_1000079A8(0, &qword_10001E9C8);
    sub_1000118A0((unint64_t *)&unk_10001E9D0, &qword_10001E9C8);
    uint64_t v16 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    unint64_t v19 = (void *)sub_10000EE0C(v16);
    swift_bridgeObjectRelease();
    if (v19)
    {
      sub_100010D08(v19);
      sub_100011CB8();
    }
    else
    {
      sub_100011CB8();
    }
  }
  else
  {
    id v11 = [a3 URLContexts];
    uint64_t v12 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    sub_10000EFB0(v13, v12);
    sub_100011CB8();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000EDEC(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) == 0) {
    return *(void *)(a1 + 16);
  }
  if (a1 < 0) {
    return __CocoaSet.count.getter(a1);
  }
  return __CocoaSet.count.getter(a1 & 0xFFFFFFFFFFFFFF8);
}

uint64_t sub_10000EE0C(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = __CocoaSet.startIndex.getter();
    uint64_t v4 = v3;
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v2 = sub_100011B78(a1);
    uint64_t v4 = v6;
    uint64_t v5 = v7 & 1;
  }
  uint64_t v8 = sub_1000118F0(a1);
  uint64_t v10 = v9;
  char v12 = v11 & 1;
  char v13 = sub_100011BF8(v2, v4, v5, v8, v9, v11 & 1);
  sub_10000E764(v8, v10, v12);
  if (v13)
  {
    sub_10000E764(v2, v4, v5);
    return 0;
  }
  else
  {
    sub_100011958(v2, v4, v5, a1, &unk_10001E9C8);
    uint64_t v14 = v15;
    sub_10000E764(v2, v4, v5);
  }
  return v14;
}

uint64_t sub_10000EFB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for URL();
  sub_10000E88C();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_100011D98();
  uint64_t v9 = v8 - v7;
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_1000079A8(0, &qword_10001E9B8);
    sub_1000118A0(&qword_10001E9C0, &qword_10001E9B8);
    uint64_t result = Set.Iterator.init(_cocoa:)();
    a2 = v31;
    uint64_t v29 = v32;
    uint64_t v11 = v33;
    int64_t v12 = v34;
    unint64_t v13 = v35;
  }
  else
  {
    uint64_t v14 = -1 << *(unsigned char *)(a2 + 32);
    uint64_t v29 = a2 + 56;
    uint64_t v11 = ~v14;
    uint64_t v15 = -v14;
    if (v15 < 64) {
      uint64_t v16 = ~(-1 << v15);
    }
    else {
      uint64_t v16 = -1;
    }
    unint64_t v13 = v16 & *(void *)(a2 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    int64_t v12 = 0;
  }
  int64_t v28 = (unint64_t)(v11 + 64) >> 6;
  Swift::UInt v17 = (uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  if (a2 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v13)
    {
      uint64_t v18 = (v13 - 1) & v13;
      unint64_t v19 = __clz(__rbit64(v13)) | (v12 << 6);
      int64_t v20 = v12;
      goto LABEL_27;
    }
    int64_t v22 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      break;
    }
    if (v22 >= v28) {
      return sub_100003B24();
    }
    unint64_t v23 = *(void *)(v29 + 8 * v22);
    int64_t v20 = v12 + 1;
    if (!v23)
    {
      int64_t v20 = v12 + 2;
      if (v12 + 2 >= v28) {
        return sub_100003B24();
      }
      unint64_t v23 = *(void *)(v29 + 8 * v20);
      if (!v23)
      {
        int64_t v20 = v12 + 3;
        if (v12 + 3 >= v28) {
          return sub_100003B24();
        }
        unint64_t v23 = *(void *)(v29 + 8 * v20);
        if (!v23)
        {
          int64_t v20 = v12 + 4;
          if (v12 + 4 >= v28) {
            return sub_100003B24();
          }
          unint64_t v23 = *(void *)(v29 + 8 * v20);
          if (!v23)
          {
            int64_t v24 = v12 + 5;
            while (v24 < v28)
            {
              unint64_t v23 = *(void *)(v29 + 8 * v24++);
              if (v23)
              {
                int64_t v20 = v24 - 1;
                goto LABEL_26;
              }
            }
            return sub_100003B24();
          }
        }
      }
    }
LABEL_26:
    uint64_t v18 = (v23 - 1) & v23;
    unint64_t v19 = __clz(__rbit64(v23)) + (v20 << 6);
LABEL_27:
    id v21 = *(id *)(*(void *)(a2 + 48) + 8 * v19);
    if (!v21) {
      return sub_100003B24();
    }
    while (1)
    {
      id v25 = [v21 URL];
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v26 = sub_100011830([v21 options]);
      sub_10000F480(v9, v26, v27);

      swift_bridgeObjectRelease();
      uint64_t result = (*v17)(v9, v3);
      int64_t v12 = v20;
      unint64_t v13 = v18;
      if ((a2 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (__CocoaSet.Iterator.next()())
      {
        sub_1000079A8(0, &qword_10001E9B8);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v21 = v30;
        swift_unknownObjectRelease();
        int64_t v20 = v12;
        uint64_t v18 = v13;
        if (v30) {
          continue;
        }
      }
      return sub_100003B24();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F404(uint64_t a1, void *a2)
{
  return sub_100010D08(a2);
}

CFNotificationCenterRef sub_10000F480(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v153 = a2;
  uint64_t v155 = a1;
  uint64_t v5 = sub_100003650(&qword_10001E9A0);
  uint64_t v6 = sub_100008284(v5);
  __chkstk_darwin(v6);
  sub_100011CEC();
  sub_100011D58(v7);
  uint64_t v154 = type metadata accessor for URLQueryItem();
  sub_10000E88C();
  uint64_t v146 = v8;
  __chkstk_darwin(v9);
  sub_100011C8C();
  uint64_t v152 = v10;
  sub_100011CD0();
  __chkstk_darwin(v11);
  v144 = (char *)&v142 - v12;
  uint64_t v13 = sub_100003650((uint64_t *)&unk_10001E990);
  uint64_t v14 = sub_100008284(v13);
  __chkstk_darwin(v14);
  sub_100011CEC();
  sub_100011D58(v15);
  uint64_t v149 = type metadata accessor for URLComponents();
  sub_10000E88C();
  uint64_t v148 = v16;
  __chkstk_darwin(v17);
  sub_100011CEC();
  sub_100011D58(v18);
  uint64_t v19 = type metadata accessor for LogMessage.StringInterpolation();
  uint64_t v20 = sub_100008284(v19);
  __chkstk_darwin(v20);
  sub_100011C8C();
  uint64_t v143 = v21;
  sub_100011CD0();
  __chkstk_darwin(v22);
  uint64_t v23 = sub_100003650((uint64_t *)&unk_10001E740);
  uint64_t v24 = type metadata accessor for LogMessage();
  sub_100008110(v24);
  uint64_t v26 = *(void *)(v25 + 72);
  uint64_t v28 = *(unsigned __int8 *)(v27 + 80);
  uint64_t v29 = (v28 + 32) & ~v28;
  uint64_t v156 = v28 | 7;
  uint64_t v157 = v23;
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131E0;
  uint64_t v159 = v29;
  uint64_t v158 = type metadata accessor for SceneDelegate();
  *((void *)&v163 + 1) = v158;
  *(void *)&long long aBlock = v3;
  id v150 = v3;
  id v30 = (id)AMSLogKey();
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v34 = v33;

    sub_100011C70();
    sub_10000E998();
    sub_1000082D0();
    uint64_t MetatypeMetadata = swift_getMetatypeMetadata();
    sub_10000E910(MetatypeMetadata);
    sub_100011CA0();
    sub_10000819C();
    v168 = &type metadata for String;
    uint64_t v166 = v32;
    uint64_t v167 = v34;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_100011CA0();
    uint64_t v36 = 93;
  }
  else
  {
    sub_100011C54();
    sub_10000E998();
    sub_1000082D0();
    uint64_t v37 = swift_getMetatypeMetadata();
    sub_10000E910(v37);
    sub_100011780((uint64_t)&v166, &qword_10001E400);
    uint64_t v36 = 58;
  }
  sub_100011D40(v36);
  LogMessage.init(stringInterpolation:)();
  sub_100003A78((uint64_t)&aBlock);
  sub_100011DB4();
  *((void *)&v163 + 1) = type metadata accessor for URL();
  sub_100007898((uint64_t *)&aBlock);
  uint64_t v38 = v155;
  sub_100011E28();
  v39();
  static LogMessage.safe(_:)();
  sub_100011780((uint64_t)&aBlock, &qword_10001E400);
  LogMessage.init(stringLiteral:)();
  if (a3)
  {
    *((void *)&v163 + 1) = &type metadata for String;
    *(void *)&long long aBlock = v153;
    *((void *)&aBlock + 1) = a3;
  }
  else
  {
    long long aBlock = 0u;
    long long v163 = 0u;
  }
  uint64_t v40 = type metadata accessor for Log();
  swift_bridgeObjectRetain();
  static LogMessage.safe(_:)();
  sub_100011780((uint64_t)&aBlock, &qword_10001E400);
  uint64_t v151 = v40;
  sub_100004DCC();
  swift_bridgeObjectRelease();
  uint64_t v41 = URL.scheme.getter();
  if (v42)
  {
    BOOL v43 = v41 == 0x7564732D736D61 && v42 == 0xE700000000000000;
    if (v43)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v44 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v44 & 1) == 0) {
        goto LABEL_13;
      }
    }
    uint64_t v153 = v159 + 2 * v26;
    uint64_t v58 = swift_allocObject();
    long long v142 = xmmword_1000131D0;
    *(_OWORD *)(v58 + 16) = xmmword_1000131D0;
    id v150 = sub_100011C30();
    id v59 = (id)AMSLogKey();
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v63 = v62;

      sub_100011C70();
      sub_10000E998();
      sub_1000082D0();
      uint64_t v64 = swift_getMetatypeMetadata();
      sub_10000E910(v64);
      sub_100011CA0();
      sub_10000819C();
      v168 = &type metadata for String;
      uint64_t v166 = v61;
      uint64_t v167 = v63;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100011CA0();
      uint64_t v65 = 93;
    }
    else
    {
      sub_100011C54();
      sub_10000E998();
      sub_1000082D0();
      uint64_t v73 = swift_getMetatypeMetadata();
      sub_10000E910(v73);
      sub_100011780((uint64_t)&v166, &qword_10001E400);
      uint64_t v65 = 58;
    }
    sub_100011D40(v65);
    LogMessage.init(stringInterpolation:)();
    sub_100003A78((uint64_t)&aBlock);
    sub_100011DB4();
    sub_100004DCC();
    swift_bridgeObjectRelease();
    CFNotificationCenterRef result = CFNotificationCenterGetDistributedCenter();
    if (result)
    {
      v75 = result;

      v76 = v75;
      v77 = (__CFString *)String._bridgeToObjectiveC()();
      sub_100003650(&qword_10001E9B0);
      uint64_t v78 = swift_allocObject();
      *(_OWORD *)(v78 + 16) = xmmword_100012F10;
      *(void *)(v78 + 32) = 7107189;
      *(void *)(v78 + 40) = 0xE300000000000000;
      *(void *)(v78 + 48) = URL.absoluteString.getter();
      *(void *)(v78 + 56) = v79;
      Dictionary.init(dictionaryLiteral:)();
      CFDictionaryRef isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      CFNotificationCenterPostNotification(v76, v77, 0, isa, 1u);

      uint64_t v81 = v147;
      URLComponents.init(url:resolvingAgainstBaseURL:)();
      if (sub_10000D7DC(v81, 1, v149) == 1)
      {
        sub_100011780(v81, (uint64_t *)&unk_10001E990);
        v82 = v150;
        sub_100011E34();
        goto LABEL_51;
      }
      sub_100011E54();
      v83();
      uint64_t v84 = URLComponents.queryItems.getter();
      if (v84)
      {
        uint64_t v85 = *(void *)(v84 + 16);
        uint64_t v86 = v154;
        if (v85)
        {
          uint64_t v155 = v26;
          v87 = *(void (**)(uint64_t, unint64_t, uint64_t))(v146 + 16);
          unint64_t v88 = v84 + ((*(unsigned __int8 *)(v146 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v146 + 80));
          uint64_t v89 = *(void *)(v146 + 72);
          uint64_t v147 = v84;
          swift_bridgeObjectRetain();
          uint64_t v90 = v152;
          while (1)
          {
            v87(v90, v88, v86);
            if (URLQueryItem.name.getter() == 0x656C646E7562 && v91 == 0xE600000000000000)
            {
              swift_bridgeObjectRelease();
              goto LABEL_47;
            }
            char v93 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if (v93) {
              break;
            }
            uint64_t v90 = v152;
            uint64_t v86 = v154;
            sub_100011DCC();
            v94();
            v88 += v89;
            if (!--v85)
            {
              swift_bridgeObjectRelease();
              sub_100011D20();
              goto LABEL_42;
            }
          }
          uint64_t v86 = v154;
LABEL_47:
          sub_100011E34();
          swift_bridgeObjectRelease();
          uint64_t v100 = v145;
          sub_100011E54();
          v108();
          sub_100011D20();
        }
        else
        {
LABEL_42:
          uint64_t v100 = v145;
          sub_100011E34();
        }
        sub_10000D6C0(v100, v103, 1, v86);
        swift_bridgeObjectRelease();
        sub_100011D00(v100);
        if (!v43)
        {
          sub_100011E54();
          v119();
          v120 = (__n128 *)swift_allocObject();
          sub_100011D68(v120);
          id v121 = sub_100011C30();
          id v122 = (id)AMSLogKey();
          if (v122)
          {
            v123 = v122;
            uint64_t v124 = static String._unconditionallyBridgeFromObjectiveC(_:)();
            uint64_t v126 = v125;

            sub_100011C70();
            sub_10000E998();
            sub_1000082D0();
            uint64_t v127 = swift_getMetatypeMetadata();
            sub_10000E910(v127);
            sub_100011CA0();
            sub_10000819C();
            v168 = &type metadata for String;
            uint64_t v166 = v124;
            uint64_t v167 = v126;
            LogMessage.StringInterpolation.appendInterpolation(safe:)();
            sub_100011CA0();
            uint64_t v128 = 93;
          }
          else
          {
            sub_100011C54();
            sub_10000E998();
            sub_1000082D0();
            uint64_t v129 = swift_getMetatypeMetadata();
            sub_10000E910(v129);
            sub_100011780((uint64_t)&v166, &qword_10001E400);
            uint64_t v128 = 58;
          }
          sub_100011D40(v128);
          LogMessage.init(stringInterpolation:)();
          sub_100003A78((uint64_t)&aBlock);
          LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
          v130._object = (void *)0x80000001000140C0;
          v130._uint64_t countAndFlagsBits = 0xD000000000000027;
          LogMessage.StringInterpolation.appendLiteral(_:)(v130);
          uint64_t v131 = URLQueryItem.value.getter();
          if (v132)
          {
            *((void *)&v163 + 1) = &type metadata for String;
            *(void *)&long long aBlock = v131;
            *((void *)&aBlock + 1) = v132;
          }
          else
          {
            long long aBlock = 0u;
            long long v163 = 0u;
          }
          LogMessage.StringInterpolation.appendInterpolation(safe:)();
          sub_100011780((uint64_t)&aBlock, &qword_10001E400);
          v133._uint64_t countAndFlagsBits = 0;
          v133._object = (void *)0xE000000000000000;
          LogMessage.StringInterpolation.appendLiteral(_:)(v133);
          LogMessage.init(stringInterpolation:)();
          sub_100004DCC();
          swift_bridgeObjectRelease();
          CFNotificationCenterRef result = (CFNotificationCenterRef)[self defaultWorkspace];
          if (result)
          {
            CFNotificationCenterRef v134 = result;
            URLQueryItem.value.getter();
            if (v135)
            {
              NSString v136 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease();
            }
            else
            {
              NSString v136 = 0;
            }
            uint64_t v137 = swift_allocObject();
            *(void *)(v137 + 16) = v121;
            v164 = sub_100011810;
            uint64_t v165 = v137;
            *(void *)&long long aBlock = _NSConcreteStackBlock;
            *((void *)&aBlock + 1) = 1107296256;
            *(void *)&long long v163 = sub_100010C90;
            *((void *)&v163 + 1) = &unk_1000191C8;
            v138 = _Block_copy(&aBlock);
            id v139 = v121;
            swift_release();
            [(__CFNotificationCenter *)v134 openApplicationWithBundleIdentifier:v136 usingConfiguration:0 completionHandler:v138];
            _Block_release(v138);

            sub_100011DA8();
            v140();
            sub_100011D80();
            sub_100011DA8();
            return (CFNotificationCenterRef)v141();
          }
LABEL_68:
          __break(1u);
          return result;
        }
      }
      else
      {
        uint64_t v100 = v145;
        sub_10000D6C0(v145, 1, 1, v154);
        sub_100011E34();
      }
      sub_100011D80();
      sub_100011DA8();
      v109();
      sub_100011780(v100, &qword_10001E9A0);
      v82 = v150;
LABEL_51:
      v110 = (__n128 *)swift_allocObject();
      sub_100011D68(v110);
      *((void *)&v163 + 1) = v158;
      *(void *)&long long aBlock = v82;
      id v111 = v82;
      id v112 = (id)AMSLogKey();
      if (v112)
      {
        v113 = v112;
        uint64_t v114 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v116 = v115;

        sub_100011C70();
        sub_10000E998();
        sub_1000082D0();
        uint64_t v117 = swift_getMetatypeMetadata();
        sub_10000E910(v117);
        sub_100011780((uint64_t)&v166, &qword_10001E400);
        sub_10000819C();
        v168 = &type metadata for String;
        uint64_t v166 = v114;
        uint64_t v167 = v116;
        LogMessage.StringInterpolation.appendInterpolation(safe:)();
        sub_100011780((uint64_t)&v166, &qword_10001E400);
        uint64_t v72 = 93;
        goto LABEL_54;
      }
LABEL_53:
      sub_100011C54();
      sub_10000E998();
      sub_1000082D0();
      uint64_t v118 = swift_getMetatypeMetadata();
      sub_10000E910(v118);
      sub_100011780((uint64_t)&v166, &qword_10001E400);
      uint64_t v72 = 58;
      goto LABEL_54;
    }
    __break(1u);
    goto LABEL_68;
  }
LABEL_13:
  type metadata accessor for EngagementDeepLinkController();
  swift_allocObject();
  uint64_t v45 = sub_100002E58(v38, v153, a3);
  char v47 = v46;
  swift_setDeallocating();
  swift_deallocClassInstance();
  if (v47)
  {
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
    sub_100011C30();
    id v66 = (id)AMSLogKey();
    if (v66)
    {
      uint64_t v67 = v66;
      uint64_t v68 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v70 = v69;

      sub_100011C70();
      sub_10000E998();
      sub_1000082D0();
      uint64_t v71 = swift_getMetatypeMetadata();
      sub_10000E910(v71);
      sub_100011780((uint64_t)&v166, &qword_10001E400);
      sub_10000819C();
      v168 = &type metadata for String;
      uint64_t v166 = v68;
      uint64_t v167 = v70;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100011780((uint64_t)&v166, &qword_10001E400);
      uint64_t v72 = 93;
LABEL_54:
      sub_100011D40(v72);
      LogMessage.init(stringInterpolation:)();
      sub_100003A78((uint64_t)&aBlock);
      sub_100011DB4();
      sub_100004C08();
      return (CFNotificationCenterRef)swift_bridgeObjectRelease();
    }
    goto LABEL_53;
  }
  id v48 = [objc_allocWithZone((Class)AMSEngagement) init];
  Class v49 = Dictionary._bridgeToObjectiveC()().super.isa;
  sub_100011774(v45, 0);
  id v50 = [v48 enqueueData:v49];

  *(void *)&long long aBlock = 0;
  id v51 = [v50 resultWithError:&aBlock];

  v52 = (void *)aBlock;
  if (v51)
  {
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012EC0;
    sub_100011C30();
    id v53 = v52;
    id v54 = (id)AMSLogKey();
    if (v54)
    {
      uint64_t v55 = v54;
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      sub_100011C70();
      sub_10000E998();
      sub_1000082D0();
      uint64_t v56 = swift_getMetatypeMetadata();
      sub_10000E910(v56);
      sub_100011CA0();
      sub_10000819C();
      sub_100011E08((uint64_t)&type metadata for String);
      sub_100011CA0();
      uint64_t v57 = 93;
    }
    else
    {
      sub_100011C54();
      sub_10000E998();
      sub_1000082D0();
      uint64_t v101 = swift_getMetatypeMetadata();
      sub_10000E910(v101);
      sub_100011780((uint64_t)&v166, &qword_10001E400);
      uint64_t v57 = 58;
    }
    sub_100011D40(v57);
    LogMessage.init(stringInterpolation:)();
    sub_100003A78((uint64_t)&aBlock);
    sub_100011DB4();
    *((void *)&v163 + 1) = sub_1000079A8(0, &qword_10001E9A8);
    *(void *)&long long aBlock = v51;
    id v102 = v51;
    static LogMessage.safe(_:)();
    sub_100011780((uint64_t)&aBlock, &qword_10001E400);
    sub_100004DCC();

    return (CFNotificationCenterRef)swift_bridgeObjectRelease();
  }
  id v95 = (id)aBlock;
  _convertNSErrorToError(_:)();

  swift_willThrow();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_100012EC0;
  sub_100011C30();
  id v96 = (id)AMSLogKey();
  if (v96)
  {
    v97 = v96;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    sub_100011C70();
    sub_10000E998();
    sub_1000082D0();
    uint64_t v98 = swift_getMetatypeMetadata();
    sub_10000E910(v98);
    sub_100011CA0();
    sub_10000819C();
    sub_100011E08((uint64_t)&type metadata for String);
    sub_100011CA0();
    uint64_t v99 = 93;
  }
  else
  {
    sub_100011C54();
    sub_10000E998();
    sub_1000082D0();
    uint64_t v104 = swift_getMetatypeMetadata();
    sub_10000E910(v104);
    sub_100011780((uint64_t)&v166, &qword_10001E400);
    uint64_t v99 = 58;
  }
  sub_100011D40(v99);
  LogMessage.init(stringInterpolation:)();
  sub_100003A78((uint64_t)&aBlock);
  LogMessage.init(stringLiteral:)();
  swift_getErrorValue();
  uint64_t v105 = v160;
  uint64_t v106 = v161;
  *((void *)&v163 + 1) = v161;
  v107 = sub_100007898((uint64_t *)&aBlock);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v106 - 8) + 16))(v107, v105, v106);
  static LogMessage.safe(_:)();
  sub_100011780((uint64_t)&aBlock, &qword_10001E400);
  sub_100004C08();
  swift_bridgeObjectRelease();
  return (CFNotificationCenterRef)swift_errorRelease();
}

uint64_t sub_100010720(char a1, uint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for LogMessage.StringInterpolation();
  __chkstk_darwin(v6 - 8);
  if (a2 && (a1 & 1) == 0)
  {
    sub_100003650((uint64_t *)&unk_10001E740);
    type metadata accessor for LogMessage();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
    uint64_t v42 = type metadata accessor for SceneDelegate();
    v41[0] = (uint64_t)a3;
    id v17 = a3;
    swift_errorRetain();
    id v18 = (id)AMSLogKey();
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v22 = v21;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v23._uint64_t countAndFlagsBits = 0;
      v23._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v23);
      sub_100004A10(v41, v42);
      uint64_t DynamicType = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v38 = DynamicType;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100011780((uint64_t)&v38, &qword_10001E400);
      v25._uint64_t countAndFlagsBits = 5972026;
      v25._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v25);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v38 = v20;
      uint64_t v39 = v22;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100011780((uint64_t)&v38, &qword_10001E400);
      uint64_t v26 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v31._uint64_t countAndFlagsBits = 0;
      v31._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v31);
      sub_100004A10(v41, v42);
      uint64_t v32 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v38 = v32;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100011780((uint64_t)&v38, &qword_10001E400);
      uint64_t v26 = 58;
    }
    unint64_t v33 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v26);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_100003A78((uint64_t)v41);
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v34._object = (void *)0x8000000100014150;
    v34._uint64_t countAndFlagsBits = 0xD00000000000002DLL;
    LogMessage.StringInterpolation.appendLiteral(_:)(v34);
    swift_getErrorValue();
    uint64_t v42 = v37;
    unint64_t v35 = sub_100007898(v41);
    (*(void (**)(uint64_t *))(*(void *)(v37 - 8) + 16))(v35);
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_100011780((uint64_t)v41, &qword_10001E400);
    v36._uint64_t countAndFlagsBits = 0;
    v36._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v36);
    LogMessage.init(stringInterpolation:)();
    sub_100004DCC();
    swift_bridgeObjectRelease();
    return swift_errorRelease();
  }
  else
  {
    sub_100003650((uint64_t *)&unk_10001E740);
    type metadata accessor for LogMessage();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000131D0;
    uint64_t v42 = type metadata accessor for SceneDelegate();
    v41[0] = (uint64_t)a3;
    id v7 = a3;
    id v8 = (id)AMSLogKey();
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v12 = v11;

      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v13._uint64_t countAndFlagsBits = 0;
      v13._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v13);
      sub_100004A10(v41, v42);
      uint64_t v14 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v38 = v14;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100011780((uint64_t)&v38, &qword_10001E400);
      v15._uint64_t countAndFlagsBits = 5972026;
      v15._object = (void *)0xE300000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v15);
      uint64_t MetatypeMetadata = &type metadata for String;
      uint64_t v38 = v10;
      uint64_t v39 = v12;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100011780((uint64_t)&v38, &qword_10001E400);
      uint64_t v16 = 93;
    }
    else
    {
      LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
      v27._uint64_t countAndFlagsBits = 0;
      v27._object = (void *)0xE000000000000000;
      LogMessage.StringInterpolation.appendLiteral(_:)(v27);
      sub_100004A10(v41, v42);
      uint64_t v28 = swift_getDynamicType();
      uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
      uint64_t v38 = v28;
      LogMessage.StringInterpolation.appendInterpolation(safe:)();
      sub_100011780((uint64_t)&v38, &qword_10001E400);
      uint64_t v16 = 58;
    }
    unint64_t v29 = 0xE100000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v16);
    LogMessage.init(stringInterpolation:)();
    type metadata accessor for Log();
    sub_100003A78((uint64_t)v41);
    LogMessage.init(stringLiteral:)();
    sub_100004DCC();
    return swift_bridgeObjectRelease();
  }
}

void sub_100010C90(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100010D08(void *a1)
{
  uint64_t v2 = type metadata accessor for LogMessage.StringInterpolation();
  uint64_t v3 = sub_100008284(v2);
  __chkstk_darwin(v3);
  sub_100011D98();
  uint64_t v4 = sub_100003650((uint64_t *)&unk_10001E990);
  uint64_t v5 = sub_100008284(v4);
  __chkstk_darwin(v5);
  sub_100011D98();
  uint64_t v8 = v7 - v6;
  uint64_t v106 = type metadata accessor for URLComponents();
  sub_10000E88C();
  uint64_t v104 = v9;
  __chkstk_darwin(v10);
  sub_100011C8C();
  uint64_t v103 = v11;
  sub_100011CD0();
  __chkstk_darwin(v12);
  uint64_t v105 = (char *)v96 - v13;
  uint64_t v14 = sub_100003650(&qword_10001E800);
  uint64_t v15 = sub_100008284(v14);
  __chkstk_darwin(v15);
  sub_100011C8C();
  uint64_t v98 = v16;
  sub_100011CD0();
  __chkstk_darwin(v17);
  uint64_t v99 = (uint64_t)v96 - v18;
  sub_100011CD0();
  __chkstk_darwin(v19);
  uint64_t v100 = (char *)v96 - v20;
  sub_100011CD0();
  uint64_t v22 = __chkstk_darwin(v21);
  uint64_t v24 = (char *)v96 - v23;
  uint64_t v25 = __chkstk_darwin(v22);
  Swift::String v27 = (char *)v96 - v26;
  __chkstk_darwin(v25);
  unint64_t v29 = (char *)v96 - v28;
  uint64_t v30 = type metadata accessor for URL();
  sub_10000E88C();
  uint64_t v108 = v31;
  __chkstk_darwin(v32);
  sub_100011C8C();
  uint64_t v102 = v33;
  sub_100011CD0();
  uint64_t v35 = __chkstk_darwin(v34);
  uint64_t v37 = (char *)v96 - v36;
  __chkstk_darwin(v35);
  v107 = (char *)v96 - v38;
  id v109 = a1;
  id v39 = [a1 activityType];
  uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v42 = v41;

  BOOL v44 = v40 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v42 == v43;
  if (v44)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v45 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if ((v45 & 1) == 0) {
      return result;
    }
  }
  id v47 = [v109 webpageURL];
  if (!v47)
  {
    sub_10000D6C0((uint64_t)v29, 1, 1, v30);
    goto LABEL_13;
  }
  id v48 = v47;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v49 = v108;
  id v50 = *(void (**)(char *, char *, uint64_t))(v108 + 32);
  v50(v29, v37, v30);
  sub_10000D6C0((uint64_t)v29, 0, 1, v30);
  sub_100011D00((uint64_t)v29);
  if (v44)
  {
LABEL_13:
    id v53 = &qword_10001E800;
    uint64_t v54 = (uint64_t)v29;
    return sub_100011780(v54, v53);
  }
  v97 = v27;
  id v51 = v50;
  v52 = v107;
  v51(v107, v29, v30);
  URLComponents.init(url:resolvingAgainstBaseURL:)();
  if (sub_10000D7DC(v8, 1, v106) == 1)
  {
    (*(void (**)(char *, uint64_t))(v49 + 8))(v52, v30);
    id v53 = (uint64_t *)&unk_10001E990;
    uint64_t v54 = v8;
    return sub_100011780(v54, v53);
  }
  v96[2] = v51;
  sub_100011E54();
  v55();
  sub_100003650((uint64_t *)&unk_10001E740);
  uint64_t v56 = type metadata accessor for LogMessage();
  sub_100008110(v56);
  unint64_t v59 = (*(unsigned __int8 *)(v58 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
  v96[4] = *(void *)(v57 + 72);
  uint64_t v60 = swift_allocObject();
  *(_OWORD *)(v60 + 16) = xmmword_100012EC0;
  v96[1] = v60;
  v96[3] = v60 + v59;
  *((void *)&v113 + 1) = type metadata accessor for SceneDelegate();
  *(void *)&long long v112 = v101;
  id v61 = v101;
  id v62 = (id)AMSLogKey();
  id v101 = v61;
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v66 = v65;

    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v67._uint64_t countAndFlagsBits = 0;
    v67._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v67);
    sub_100004A10(&v112, *((uint64_t *)&v113 + 1));
    uint64_t DynamicType = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v110[0] = DynamicType;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_100011780((uint64_t)v110, &qword_10001E400);
    sub_10000819C();
    uint64_t MetatypeMetadata = &type metadata for String;
    v110[0] = v64;
    v110[1] = v66;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_100011780((uint64_t)v110, &qword_10001E400);
    uint64_t v69 = 93;
  }
  else
  {
    LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
    v70._uint64_t countAndFlagsBits = 0;
    v70._object = (void *)0xE000000000000000;
    LogMessage.StringInterpolation.appendLiteral(_:)(v70);
    sub_100004A10(&v112, *((uint64_t *)&v113 + 1));
    uint64_t v71 = swift_getDynamicType();
    uint64_t MetatypeMetadata = (void *)swift_getMetatypeMetadata();
    v110[0] = v71;
    LogMessage.StringInterpolation.appendInterpolation(safe:)();
    sub_100011780((uint64_t)v110, &qword_10001E400);
    uint64_t v69 = 58;
  }
  uint64_t v72 = v104;
  uint64_t v73 = (uint64_t)v100;
  uint64_t v74 = (uint64_t)v97;
  unint64_t v75 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&v69);
  LogMessage.init(stringInterpolation:)();
  sub_100003A78((uint64_t)&v112);
  LogMessage.init(stringLiteral:)();
  id v76 = [v109 webpageURL];
  if (v76)
  {
    v77 = v76;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v78 = 0;
  }
  else
  {
    uint64_t v78 = 1;
  }
  sub_10000D6C0((uint64_t)v24, v78, 1, v30);
  sub_10001170C((uint64_t)v24, v74);
  sub_100011D00(v74);
  if (v44)
  {
    sub_100011780(v74, &qword_10001E800);
    long long v112 = 0u;
    long long v113 = 0u;
  }
  else
  {
    *((void *)&v113 + 1) = v30;
    sub_100007898((uint64_t *)&v112);
    sub_100011E40();
    v79();
  }
  type metadata accessor for Log();
  static LogMessage.safe(_:)();
  sub_100011780((uint64_t)&v112, &qword_10001E400);
  sub_100004DCC();
  swift_bridgeObjectRelease();
  sub_100011E28();
  v80();
  URLComponents.scheme.setter();
  URLComponents.url.getter();
  sub_100011D00(v73);
  if (v44)
  {
    uint64_t v81 = *(void (**)(void))(v72 + 8);
    sub_100011CDC();
    v81();
    sub_100011CDC();
    v81();
    sub_100011DA8();
    v82();
    id v53 = &qword_10001E800;
    uint64_t v54 = v73;
    return sub_100011780(v54, v53);
  }
  sub_100011E40();
  v83();
  id v84 = [v109 referrerURL];
  if (v84)
  {
    uint64_t v85 = v84;
    uint64_t v86 = v98;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v87 = 0;
  }
  else
  {
    uint64_t v87 = 1;
    uint64_t v86 = v98;
  }
  sub_10000D6C0(v86, v87, 1, v30);
  uint64_t v88 = v99;
  sub_10001170C(v86, v99);
  if (sub_10000D7DC(v88, 1, v30))
  {
    sub_100011780(v88, &qword_10001E800);
    uint64_t v89 = 0;
    uint64_t v90 = v108;
  }
  else
  {
    uint64_t v90 = v108;
    (*(void (**)(char *, uint64_t, uint64_t))(v108 + 16))(v37, v88, v30);
    sub_100011780(v88, &qword_10001E800);
    URL.absoluteString.getter();
    uint64_t v89 = v91;
    (*(void (**)(char *, uint64_t))(v90 + 8))(v37, v30);
  }
  uint64_t v92 = sub_100011DDC();
  sub_10000F480(v92, v93, v89);
  swift_bridgeObjectRelease();
  v94 = *(void (**)(void))(v90 + 8);
  sub_100011DCC();
  v94();
  id v95 = *(void (**)(void))(v72 + 8);
  sub_100011CDC();
  v95();
  sub_100011CDC();
  v95();
  sub_100011DCC();
  return ((uint64_t (*)(void))v94)();
}

id sub_100011640()
{
  *(void *)&v0[OBJC_IVAR____TtC24AMSEngagementViewService13SceneDelegate_window] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super init];
}

id sub_1000116A4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

uint64_t sub_10001170C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003650(&qword_10001E800);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100011774(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100011780(uint64_t a1, uint64_t *a2)
{
  sub_100003650(a2);
  sub_100011DA8();
  v3();
  return a1;
}

uint64_t sub_1000117D8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100011810(char a1, uint64_t a2)
{
  return sub_100010720(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_100011818(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100011828()
{
  return swift_release();
}

uint64_t sub_100011830(void *a1)
{
  id v2 = [a1 sourceApplication];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_1000118A0(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000079A8(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000118F0(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0) {
    return __CocoaSet.endIndex.getter();
  }
  else {
    return 1 << *(unsigned char *)(a1 + 32);
  }
}

void sub_100011944(uint64_t a1, int a2, char a3, uint64_t a4)
{
}

void sub_100011958(uint64_t a1, int a2, char a3, uint64_t a4, void *a5)
{
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_100011DDC();
      __CocoaSet.element(at:)();
      sub_100011DE8();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      sub_100011CB8();
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
  sub_100011DDC();
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_100011DDC();
  __CocoaSet.Index.element.getter();
  sub_100011DE8();
  swift_unknownObjectRetain();
  swift_dynamicCast();
  a5 = v20;
  swift_unknownObjectRelease();
  Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v9 = v7 & ~v8;
  sub_100011E60();
  if ((v10 & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v11 = *(id *)(*(void *)(a4 + 48) + 8 * v9);
  char v12 = static NSObject.== infix(_:_:)();

  if ((v12 & 1) == 0)
  {
    uint64_t v13 = ~v8;
    do
    {
      uint64_t v9 = (v9 + 1) & v13;
      sub_100011E60();
      if ((v14 & 1) == 0) {
        goto LABEL_23;
      }
      id v15 = *(id *)(*(void *)(a4 + 48) + 8 * v9);
      char v16 = static NSObject.== infix(_:_:)();
    }
    while ((v16 & 1) == 0);
  }

LABEL_17:
  sub_100011CB8();
  id v19 = v17;
}

uint64_t sub_100011B78(uint64_t a1)
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

uint64_t sub_100011BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
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

id sub_100011C30()
{
  *(void *)(v0 - 152) = *(void *)(v0 - 232);
  uint64_t v2 = *(void **)(v0 - 296);
  *(void *)(v0 - 176) = v2;
  return v2;
}

uint64_t sub_100011C54()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100011C70()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100011CA0()
{
  return sub_100011780(v1 - 128, v0);
}

uint64_t sub_100011D00(uint64_t a1)
{
  return sub_10000D7DC(a1, 1, v1);
}

void sub_100011D40(uint64_t a1)
{
  unint64_t v2 = 0xE100000000000000;
  LogMessage.StringInterpolation.appendLiteral(_:)(*(Swift::String *)&a1);
}

uint64_t sub_100011D58@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

__n128 sub_100011D68(__n128 *a1)
{
  __n128 result = *(__n128 *)(v1 - 384);
  a1[1] = result;
  return result;
}

uint64_t sub_100011D80()
{
  return *(void *)(v0 - 320);
}

uint64_t sub_100011DB4()
{
  return LogMessage.init(stringLiteral:)();
}

uint64_t sub_100011DDC()
{
  return v0;
}

uint64_t sub_100011DE8()
{
  return sub_1000079A8(0, v0);
}

uint64_t sub_100011E08@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v3 - 104) = a1;
  *(void *)(v3 - 128) = v1;
  *(void *)(v3 - 120) = v2;
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
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

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.scheme.setter()
{
  return URLComponents.scheme.setter();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.scheme.getter()
{
  return URL.scheme.getter();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
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

uint64_t LogMessage.init(stringLiteral:)()
{
  return LogMessage.init(stringLiteral:)();
}

uint64_t static LogMessage.isRedactionEnabled.getter()
{
  return static LogMessage.isRedactionEnabled.getter();
}

uint64_t LogMessage.StringInterpolation.appendInterpolation(safe:)()
{
  return LogMessage.StringInterpolation.appendInterpolation(safe:)();
}

Swift::Void __swiftcall LogMessage.StringInterpolation.appendLiteral(_:)(Swift::String a1)
{
}

uint64_t LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return LogMessage.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t type metadata accessor for LogMessage.StringInterpolation()
{
  return type metadata accessor for LogMessage.StringInterpolation();
}

uint64_t LogMessage.init(stringInterpolation:)()
{
  return LogMessage.init(stringInterpolation:)();
}

uint64_t static LogMessage.safe(_:)()
{
  return static LogMessage.safe(_:)();
}

uint64_t static LogMessage.describe(contentsOf:withRedaction:separator:)()
{
  return static LogMessage.describe(contentsOf:withRedaction:separator:)();
}

uint64_t type metadata accessor for LogMessage()
{
  return type metadata accessor for LogMessage();
}

uint64_t dispatch thunk of static EventEmitter.defaultScheduler.getter()
{
  return dispatch thunk of static EventEmitter.defaultScheduler.getter();
}

uint64_t EventEmitter.addObserver(on:singleUse:_:)()
{
  return EventEmitter.addObserver(on:singleUse:_:)();
}

Swift::Void __swiftcall ViewControllerPresenter.viewDidLoad()()
{
}

Swift::Void __swiftcall ViewControllerPresenter.viewWillAppear()()
{
}

Swift::Void __swiftcall ViewControllerPresenter.viewDidDisappear()()
{
}

uint64_t ViewControllerPresenter.viewWillDisappear(forReason:)()
{
  return ViewControllerPresenter.viewWillDisappear(forReason:)();
}

Swift::Void __swiftcall ViewControllerPresenter.viewDidReceiveMemoryWarning()()
{
}

uint64_t static ViewWillDisappearReason.inferred(for:)()
{
  return static ViewWillDisappearReason.inferred(for:)();
}

uint64_t type metadata accessor for ViewWillDisappearReason()
{
  return type metadata accessor for ViewWillDisappearReason();
}

uint64_t SyncEvent.post(_:)()
{
  return SyncEvent.post(_:)();
}

uint64_t SyncEvent.init()()
{
  return SyncEvent.init()();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return Dictionary.init(dictionaryLiteral:)();
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

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Index._asCocoa.modify()
{
  return Set.Index._asCocoa.modify();
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

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
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

NSNumber __swiftcall NSNumber.init(BOOLeanLiteral:)(Swift::Bool BOOLeanLiteral)
{
  return (NSNumber)NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t OS_os_log.init(subsystem:category:)()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.Index.handleBitPattern.getter()
{
  return __CocoaSet.Index.handleBitPattern.getter();
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

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t __CocoaSet.endIndex.getter()
{
  return __CocoaSet.endIndex.getter();
}

uint64_t __CocoaSet.formIndex(after:isUnique:)()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
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

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
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

uint64_t AMSCustomError()
{
  return _AMSCustomError();
}

uint64_t AMSLogKey()
{
  return _AMSLogKey();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return _CFNotificationCenterGetDistributedCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
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

id objc_retainAutorelease(id a1)
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

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
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

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
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

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
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