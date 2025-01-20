int main(int argc, const char **argv, const char **envp)
{
  int v3;
  char **v4;
  objc_class *ObjCClassFromMetadata;
  NSString *v6;
  objc_class *v7;
  NSString *v8;

  v3 = static CommandLine.argc.getter();
  v4 = (char **)static CommandLine.unsafeArgv.getter();
  type metadata accessor for IntelligentLightApp();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  v6 = NSStringFromClass(ObjCClassFromMetadata);
  if (!v6)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for IntelligentLightAppDelegate();
  v7 = (objc_class *)swift_getObjCClassFromMetadata();
  v8 = NSStringFromClass(v7);
  if (!v8)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = (NSString *)String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  UIApplicationMain(v3, v4, v6, v8);

  return 0;
}

uint64_t sub_10000370C(uint64_t a1, uint64_t a2)
{
  return sub_100003804(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100003724()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003778()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000037EC(uint64_t a1, uint64_t a2)
{
  return sub_100003804(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003804(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100003848(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000038C0(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100003940@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003984@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000039B4()
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

uint64_t sub_100003A40@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003A88(uint64_t a1)
{
  uint64_t v2 = sub_100003C40(&qword_10001A440);
  uint64_t v3 = sub_100003C40(&qword_10001A448);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for LightLayerDisplayContext(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100003B6C(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003B78(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100003B98(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
}

uint64_t sub_100003BD8()
{
  return sub_100003C40(&qword_10001A428);
}

uint64_t sub_100003C0C()
{
  return sub_100003C40(&qword_10001A430);
}

uint64_t sub_100003C40(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for LaunchOptionsKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100003C84()
{
  return sub_100003C40(&qword_10001A438);
}

__n128 sub_100003CB8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003CC4(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100003CE4(uint64_t result, int a2, int a3)
{
  if (a2)
  {
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
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_100003D34(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

id sub_100003DE0()
{
  return sub_1000044BC(type metadata accessor for IntelligentLightApp);
}

uint64_t type metadata accessor for IntelligentLightApp()
{
  return self;
}

uint64_t sub_100003F90(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_100004574();
    sub_1000049BC((unint64_t *)&unk_10001A530, (void (*)(uint64_t))sub_100004574);
    uint64_t result = Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v26;
    uint64_t v24 = v27;
    uint64_t v4 = v28;
    uint64_t v3 = v29;
    unint64_t v5 = v30;
  }
  else
  {
    uint64_t v6 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v24 = a1 + 56;
    uint64_t v4 = ~v6;
    uint64_t v7 = -v6;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    unint64_t v5 = v8 & *(void *)(a1 + 56);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  int64_t v23 = (unint64_t)(v4 + 64) >> 6;
  if (v1 < 0) {
    goto LABEL_10;
  }
  while (1)
  {
    if (v5)
    {
      uint64_t v9 = (v5 - 1) & v5;
      unint64_t v10 = __clz(__rbit64(v5)) | (v3 << 6);
      uint64_t v11 = v3;
      goto LABEL_29;
    }
    int64_t v13 = v3 + 1;
    if (__OFADD__(v3, 1)) {
      break;
    }
    if (v13 >= v23) {
      return sub_1000045B4();
    }
    unint64_t v14 = *(void *)(v24 + 8 * v13);
    uint64_t v11 = v3 + 1;
    if (!v14)
    {
      uint64_t v11 = v3 + 2;
      if (v3 + 2 >= v23) {
        return sub_1000045B4();
      }
      unint64_t v14 = *(void *)(v24 + 8 * v11);
      if (!v14)
      {
        uint64_t v11 = v3 + 3;
        if (v3 + 3 >= v23) {
          return sub_1000045B4();
        }
        unint64_t v14 = *(void *)(v24 + 8 * v11);
        if (!v14)
        {
          uint64_t v11 = v3 + 4;
          if (v3 + 4 >= v23) {
            return sub_1000045B4();
          }
          unint64_t v14 = *(void *)(v24 + 8 * v11);
          if (!v14)
          {
            uint64_t v11 = v3 + 5;
            if (v3 + 5 >= v23) {
              return sub_1000045B4();
            }
            unint64_t v14 = *(void *)(v24 + 8 * v11);
            if (!v14)
            {
              uint64_t v15 = v3 + 6;
              while (v23 != v15)
              {
                unint64_t v14 = *(void *)(v24 + 8 * v15++);
                if (v14)
                {
                  uint64_t v11 = v15 - 1;
                  goto LABEL_28;
                }
              }
              return sub_1000045B4();
            }
          }
        }
      }
    }
LABEL_28:
    uint64_t v9 = (v14 - 1) & v14;
    unint64_t v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_29:
    id v12 = *(id *)(*(void *)(v1 + 48) + 8 * v10);
    if (!v12) {
      return sub_1000045B4();
    }
    while (1)
    {
      _StringGuts.grow(_:)(23);
      swift_bridgeObjectRelease();
      unint64_t v25 = 0xD000000000000015;
      id v16 = [v12 persistentIdentifier];
      uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v19 = v18;

      v20._countAndFlagsBits = v17;
      v20._object = v19;
      String.append(_:)(v20);
      swift_bridgeObjectRelease();
      if (qword_10001A410 != -1) {
        swift_once();
      }
      uint64_t v21 = type metadata accessor for Logger();
      sub_1000045BC(v21, (uint64_t)qword_10001A630);
      os_log_type_t v22 = static os_log_type_t.info.getter();
      sub_100005134(v22, 8, 0xD000000000000027, 0x8000000100010E00, 0xD000000000000015, 0x8000000100010E30);

      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v3 = v11;
      unint64_t v5 = v9;
      if ((v1 & 0x8000000000000000) == 0) {
        break;
      }
LABEL_10:
      if (__CocoaSet.Iterator.next()())
      {
        sub_100004574();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        id v12 = (id)v25;
        swift_unknownObjectRelease();
        uint64_t v11 = v3;
        uint64_t v9 = v5;
        if (v25) {
          continue;
        }
      }
      return sub_1000045B4();
    }
  }
  __break(1u);
  return result;
}

id sub_1000044A4()
{
  return sub_1000044BC(type metadata accessor for IntelligentLightAppDelegate);
}

id sub_1000044BC(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for IntelligentLightAppDelegate()
{
  return self;
}

unint64_t sub_100004574()
{
  unint64_t result = qword_10001A528;
  if (!qword_10001A528)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001A528);
  }
  return result;
}

uint64_t sub_1000045B4()
{
  return swift_release();
}

uint64_t sub_1000045BC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_1000045F4(void *a1)
{
  id v2 = [a1 role];
  _StringGuts.grow(_:)(44);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x3D6469203BLL;
  v4._object = (void *)0xE500000000000000;
  String.append(_:)(v4);
  id v5 = [a1 persistentIdentifier];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;

  v9._countAndFlagsBits = v6;
  v9._object = v8;
  String.append(_:)(v9);
  swift_bridgeObjectRelease();
  if (qword_10001A410 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_1000045BC(v10, (uint64_t)qword_10001A630);
  os_log_type_t v11 = static os_log_type_t.info.getter();
  sub_100005134(v11, 8, 0xD000000000000032, 0x8000000100010E50, 0xD000000000000023, 0x8000000100010E90);
  swift_bridgeObjectRelease();
  id v12 = [objc_allocWithZone((Class)UISceneConfiguration) initWithName:0 sessionRole:v2];
  id v13 = v2;
  unint64_t v14 = (void *)static UISceneSessionRole.intelligenceLight.getter();
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;
  if (v15 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v17 == v18)
  {

    swift_bridgeObjectRelease_n();
LABEL_7:
    type metadata accessor for LightSceneDelegate();
    goto LABEL_8;
  }
  char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v19) {
    goto LABEL_7;
  }
  id v21 = v13;
  NSString v22 = String._bridgeToObjectiveC()();
  uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v25 = v24;
  if (v23 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v25 == v26)
  {

    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v27 & 1) == 0)
    {
      _StringGuts.grow(_:)(89);
      v28._countAndFlagsBits = 0xD000000000000035;
      v28._object = (void *)0x8000000100010EF0;
      String.append(_:)(v28);
      v29._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
      String.append(_:)(v29);
      swift_bridgeObjectRelease();
      v30._countAndFlagsBits = 0xD000000000000022;
      v30._object = (void *)0x8000000100010F30;
      String.append(_:)(v30);
      os_log_type_t v31 = static os_log_type_t.error.getter();
      sub_100005134(v31, 8, 0xD000000000000032, 0x8000000100010E50, 0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      type metadata accessor for EmptySceneDelegate();
      goto LABEL_8;
    }
  }
  type metadata accessor for NoiseSceneDelegate();
LABEL_8:
  [v12 setDelegateClass:swift_getObjCClassFromMetadata()];

  return v12;
}

uint64_t sub_1000049BC(unint64_t *a1, void (*a2)(uint64_t))
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

id sub_100004A48()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmptySceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for EmptySceneDelegate()
{
  return self;
}

void *Log.LogType.scene.unsafeMutableAddressor()
{
  return &static Log.LogType.scene;
}

void static Log.info(_:callingMethod:_:)(char a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
}

void static Log.error(_:callingMethod:_:)(char a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
}

uint64_t sub_100004ADC()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006DF0(v0, qword_10001A630);
  sub_1000045BC(v0, (uint64_t)qword_10001A630);
  sub_100006E54();
  OS_os_log.init(subsystem:category:)();
  return Logger.init(_:)();
}

void *Log.LogType.light.unsafeMutableAddressor()
{
  return &static Log.LogType.light;
}

uint64_t static Log.LogType.light.getter()
{
  return 1;
}

void *Log.LogType.audio.unsafeMutableAddressor()
{
  return &static Log.LogType.audio;
}

uint64_t static Log.LogType.audio.getter()
{
  return 2;
}

void *Log.LogType.noise.unsafeMutableAddressor()
{
  return &static Log.LogType.noise;
}

uint64_t static Log.LogType.noise.getter()
{
  return 4;
}

uint64_t static Log.LogType.scene.getter()
{
  return 8;
}

uint64_t sub_100004BB8(char a1)
{
  if ((a1 & 1) == 0)
  {
    objc_super v2 = (char *)_swiftEmptyArrayStorage;
    if ((a1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  objc_super v2 = sub_1000055B4(0, 1, 1, (char *)_swiftEmptyArrayStorage);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    objc_super v2 = sub_1000055B4((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  id v5 = &v2[16 * v4];
  *((void *)v5 + 4) = 0x746867696C23;
  *((void *)v5 + 5) = 0xE600000000000000;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      objc_super v2 = sub_1000055B4(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v7 = *((void *)v2 + 2);
    unint64_t v6 = *((void *)v2 + 3);
    if (v7 >= v6 >> 1) {
      objc_super v2 = sub_1000055B4((char *)(v6 > 1), v7 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v7 + 1;
    uint64_t v8 = &v2[16 * v7];
    *((void *)v8 + 4) = 0x6F6964756123;
    *((void *)v8 + 5) = 0xE600000000000000;
  }
LABEL_12:
  if ((a1 & 4) == 0)
  {
    if ((a1 & 8) == 0) {
      goto LABEL_14;
    }
LABEL_21:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      objc_super v2 = sub_1000055B4(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v14 = *((void *)v2 + 2);
    unint64_t v13 = *((void *)v2 + 3);
    if (v14 >= v13 >> 1) {
      objc_super v2 = sub_1000055B4((char *)(v13 > 1), v14 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v14 + 1;
    uint64_t v15 = &v2[16 * v14];
    *((void *)v15 + 4) = 0x656E65637323;
    *((void *)v15 + 5) = 0xE600000000000000;
    goto LABEL_26;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    objc_super v2 = sub_1000055B4(0, *((void *)v2 + 2) + 1, 1, v2);
  }
  unint64_t v11 = *((void *)v2 + 2);
  unint64_t v10 = *((void *)v2 + 3);
  if (v11 >= v10 >> 1) {
    objc_super v2 = sub_1000055B4((char *)(v10 > 1), v11 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v11 + 1;
  id v12 = &v2[16 * v11];
  *((void *)v12 + 4) = 0x6573696F6E23;
  *((void *)v12 + 5) = 0xE600000000000000;
  if ((a1 & 8) != 0) {
    goto LABEL_21;
  }
LABEL_14:
  if (*((void *)v2 + 2))
  {
LABEL_26:
    uint64_t v17 = v2;
    swift_bridgeObjectRetain();
    sub_100005D1C((uint64_t *)&v17);
    swift_bridgeObjectRelease();
    sub_100006D04(&qword_10001A670);
    sub_100006D4C();
    uint64_t v9 = BidirectionalCollection<>.joined(separator:)();
    swift_release();
    return v9;
  }
  swift_bridgeObjectRelease();
  return 0;
}

void *sub_100004E74@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

Swift::Int sub_100004E80()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100004EC8()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100004EF4()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100004F38(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_100004F40@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100004F54@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100004F68@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100004F7C(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100004FAC@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_100004FD8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_100004FFC(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_100005010(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100005024(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100005038@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10000504C(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_100005060(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100005074(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100005088()
{
  return *v0 == 0;
}

uint64_t sub_100005098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_1000050B0(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_1000050C4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000050D4(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1000050E0(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000050F4@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_100006C20(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void sub_100005134(os_log_type_t a1, char a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v24 = a3;
  unint64_t v25 = a4;
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_100004BB8(a2);
  if (v11)
  {
    unint64_t v22 = 0xE100000000000000;
    String.append(_:)(*(Swift::String *)&v10);
    swift_bridgeObjectRelease();
    v12._countAndFlagsBits = 32;
    v12._object = (void *)0xE100000000000000;
    String.append(_:)(v12);
    swift_bridgeObjectRelease();
  }
  if (a6)
  {
    uint64_t v13 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v13 = a5 & 0xFFFFFFFFFFFFLL;
    }
    if (v13)
    {
      unint64_t v22 = 0xE100000000000000;
      v14._countAndFlagsBits = a5;
      v14._object = (void *)a6;
      String.append(_:)(v14);
      v15._countAndFlagsBits = 32;
      v15._object = (void *)0xE100000000000000;
      String.append(_:)(v15);
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v17 = v24;
  unint64_t v16 = v25;
  swift_bridgeObjectRetain();
  os_log_type_t v18 = a1;
  log = Logger.logObject.getter();
  if (os_log_type_enabled(log, a1))
  {
    char v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)char v19 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_1000056C4(v17, v16, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, log, v18, "%s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
}

void static Log.fault(_:callingMethod:_:)(char a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
}

void sub_10000537C(char a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t (*a6)(void))
{
  if (qword_10001A410 != -1) {
    swift_once();
  }
  uint64_t v12 = type metadata accessor for Logger();
  sub_1000045BC(v12, (uint64_t)qword_10001A630);
  os_log_type_t v13 = a6();
  sub_100005134(v13, a1, a2, a3, a4, a5);
}

unint64_t sub_100005438()
{
  unint64_t result = qword_10001A648;
  if (!qword_10001A648)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A648);
  }
  return result;
}

unint64_t sub_100005490()
{
  unint64_t result = qword_10001A650;
  if (!qword_10001A650)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A650);
  }
  return result;
}

unint64_t sub_1000054E8()
{
  unint64_t result = qword_10001A658;
  if (!qword_10001A658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A658);
  }
  return result;
}

unint64_t sub_100005540()
{
  unint64_t result = qword_10001A660;
  if (!qword_10001A660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A660);
  }
  return result;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

ValueMetadata *type metadata accessor for Log.LogType()
{
  return &type metadata for Log.LogType;
}

char *sub_1000055B4(char *result, int64_t a2, char a3, char *a4)
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
      sub_100006D04(&qword_10001A680);
      uint64_t v10 = (char *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 4);
      os_log_type_t v13 = v10 + 32;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      os_log_type_t v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[16 * v8 + 32]) {
          memmove(v13, a4 + 32, 16 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_100006B2C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000056C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100005798(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006CA8((uint64_t)v12, *a3);
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
      sub_100006CA8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006C58((uint64_t)v12);
  return v7;
}

uint64_t sub_100005798(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100005954(a5, a6);
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

uint64_t sub_100005954(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000059EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100005BCC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100005BCC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000059EC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100005B64(v2, 0);
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
        return _swiftEmptyArrayStorage;
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
    return _swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100005B64(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  sub_100006D04(&qword_10001A668);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100005BCC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006D04(&qword_10001A668);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
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

Swift::Int sub_100005D1C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006B18(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_100005D88(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_100005D88(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int result = _minimumMergeRunLength(_:)(v3);
  if (result >= v3)
  {
    if (v3 < 0) {
      goto LABEL_152;
    }
    if (v3) {
      return sub_100006474(0, v3, 1, a1);
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
    goto LABEL_160;
  }
  Swift::Int v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    int64_t v8 = &_swiftEmptyArrayStorage;
    __dst = (char *)&_swiftEmptyArrayStorage + 32;
    if (v3 != 1)
    {
      unint64_t v12 = *((void *)&_swiftEmptyArrayStorage + 2);
      size_t v11 = (char *)&_swiftEmptyArrayStorage;
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        uint64_t v95 = *v102;
        do
        {
          unint64_t v96 = v12 - 2;
          if (v12 < 2) {
            goto LABEL_147;
          }
          if (!v95) {
            goto LABEL_159;
          }
          v97 = v94;
          uint64_t v98 = *(void *)&v94[16 * v96 + 32];
          uint64_t v99 = *(void *)&v94[16 * v12 + 24];
          sub_100006544((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(void *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1) {
            break;
          }
          if (v99 < v98) {
            goto LABEL_148;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v97 = sub_100006998((uint64_t)v97);
          }
          if (v96 >= *((void *)v97 + 2)) {
            goto LABEL_149;
          }
          v100 = &v97[16 * v96 + 32];
          *(void *)v100 = v98;
          *((void *)v100 + 1) = v99;
          unint64_t v101 = *((void *)v97 + 2);
          if (v12 > v101) {
            goto LABEL_150;
          }
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((void *)v97 + 2) = v101 - 1;
          unint64_t v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      v104[2] = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = &_swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v6 = v5 >> 1;
    uint64_t v7 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(void *)(v7 + 16) = v6;
    v104 = (void *)v7;
    __dst = (char *)(v7 + 32);
  }
  Swift::Int v9 = 0;
  uint64_t v10 = *a1;
  uint64_t v103 = v10 + 8;
  size_t v11 = (char *)&_swiftEmptyArrayStorage;
  Swift::Int v106 = v3;
  while (1)
  {
    Swift::Int v13 = v9++;
    if (v9 >= v3) {
      goto LABEL_46;
    }
    Swift::String v14 = (uint64_t *)(v10 + 16 * v9);
    uint64_t v15 = *v14;
    uint64_t v16 = v14[1];
    uint64_t v17 = (void *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_45;
      }
      int v19 = 0;
    }
    else
    {
      int v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
      Swift::Int v20 = v13 + 2;
      if (v13 + 2 >= v3) {
        goto LABEL_36;
      }
    }
    uint64_t v21 = (void *)(v103 + 16 * v20);
    do
    {
      uint64_t v23 = (void *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if (v19) {
          goto LABEL_37;
        }
      }
      else if ((v19 ^ _stringCompareWithSmolCheck(_:_:expecting:)()))
      {
        goto LABEL_36;
      }
      v21 += 2;
      Swift::Int v22 = v20 + 1;
      Swift::Int v9 = v20;
      Swift::Int v20 = v22;
    }
    while (v22 < v3);
    Swift::Int v20 = v22;
LABEL_36:
    Swift::Int v9 = v20;
    if (v19)
    {
LABEL_37:
      if (v20 < v13) {
        goto LABEL_155;
      }
      if (v13 < v20)
      {
        uint64_t v25 = 16 * v20;
        uint64_t v26 = 16 * v13;
        Swift::Int v27 = v20;
        Swift::Int v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10) {
              goto LABEL_158;
            }
            uint64_t v29 = v10 + v25;
            uint64_t v30 = *(void *)(v10 + v26);
            uint64_t v31 = *(void *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(void *)(v29 - 16) = v30;
            *(void *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      Swift::Int v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13)) {
        goto LABEL_151;
      }
      if (v9 - v13 < v105) {
        break;
      }
    }
LABEL_67:
    if (v9 < v13) {
      goto LABEL_146;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      size_t v11 = sub_1000067E0(0, *((void *)v11 + 2) + 1, 1, v11);
    }
    unint64_t v41 = *((void *)v11 + 2);
    unint64_t v40 = *((void *)v11 + 3);
    unint64_t v12 = v41 + 1;
    if (v41 >= v40 >> 1) {
      size_t v11 = sub_1000067E0((char *)(v40 > 1), v41 + 1, 1, v11);
    }
    *((void *)v11 + 2) = v12;
    v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(void *)v43 = v13;
    *((void *)v43 + 1) = v9;
    if (v41)
    {
      Swift::Int v107 = v9;
      while (1)
      {
        unint64_t v44 = v12 - 1;
        if (v12 >= 4)
        {
          v49 = &v42[16 * v12];
          uint64_t v50 = *((void *)v49 - 8);
          uint64_t v51 = *((void *)v49 - 7);
          BOOL v55 = __OFSUB__(v51, v50);
          uint64_t v52 = v51 - v50;
          if (v55) {
            goto LABEL_135;
          }
          uint64_t v54 = *((void *)v49 - 6);
          uint64_t v53 = *((void *)v49 - 5);
          BOOL v55 = __OFSUB__(v53, v54);
          uint64_t v47 = v53 - v54;
          char v48 = v55;
          if (v55) {
            goto LABEL_136;
          }
          unint64_t v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          uint64_t v59 = *(void *)v57;
          uint64_t v58 = *((void *)v57 + 1);
          BOOL v55 = __OFSUB__(v58, v59);
          uint64_t v60 = v58 - v59;
          if (v55) {
            goto LABEL_138;
          }
          BOOL v55 = __OFADD__(v47, v60);
          uint64_t v61 = v47 + v60;
          if (v55) {
            goto LABEL_141;
          }
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            uint64_t v81 = *(void *)v79;
            uint64_t v80 = *((void *)v79 + 1);
            BOOL v55 = __OFSUB__(v80, v81);
            uint64_t v82 = v80 - v81;
            if (v55) {
              goto LABEL_145;
            }
            BOOL v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            uint64_t v73 = *((void *)v11 + 4);
            uint64_t v74 = *((void *)v11 + 5);
            BOOL v55 = __OFSUB__(v74, v73);
            uint64_t v66 = v74 - v73;
            char v67 = v55;
            goto LABEL_99;
          }
          uint64_t v46 = *((void *)v11 + 4);
          uint64_t v45 = *((void *)v11 + 5);
          BOOL v55 = __OFSUB__(v45, v46);
          uint64_t v47 = v45 - v46;
          char v48 = v55;
        }
        if (v48) {
          goto LABEL_137;
        }
        unint64_t v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        uint64_t v64 = *(void *)v62;
        uint64_t v63 = *((void *)v62 + 1);
        BOOL v65 = __OFSUB__(v63, v64);
        uint64_t v66 = v63 - v64;
        char v67 = v65;
        if (v65) {
          goto LABEL_140;
        }
        v68 = &v42[16 * v44];
        uint64_t v70 = *(void *)v68;
        uint64_t v69 = *((void *)v68 + 1);
        BOOL v55 = __OFSUB__(v69, v70);
        uint64_t v71 = v69 - v70;
        if (v55) {
          goto LABEL_143;
        }
        if (__OFADD__(v66, v71)) {
          goto LABEL_144;
        }
        if (v66 + v71 >= v47)
        {
          BOOL v72 = v47 < v71;
LABEL_105:
          if (v72) {
            unint64_t v44 = v56;
          }
          goto LABEL_107;
        }
LABEL_99:
        if (v67) {
          goto LABEL_139;
        }
        v75 = &v42[16 * v44];
        uint64_t v77 = *(void *)v75;
        uint64_t v76 = *((void *)v75 + 1);
        BOOL v55 = __OFSUB__(v76, v77);
        uint64_t v78 = v76 - v77;
        if (v55) {
          goto LABEL_142;
        }
        if (v78 < v66) {
          goto LABEL_15;
        }
LABEL_107:
        unint64_t v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        uint64_t v84 = v10;
        if (!v10) {
          goto LABEL_157;
        }
        v85 = v11;
        v86 = &v42[16 * v83];
        uint64_t v87 = *(void *)v86;
        v88 = v42;
        unint64_t v89 = v44;
        v90 = &v42[16 * v44];
        uint64_t v91 = *((void *)v90 + 1);
        uint64_t v92 = v84;
        sub_100006544((char *)(v84 + 16 * *(void *)v86), (char *)(v84 + 16 * *(void *)v90), v84 + 16 * v91, __dst);
        if (v1) {
          goto LABEL_115;
        }
        if (v91 < v87) {
          goto LABEL_132;
        }
        if (v89 > *((void *)v85 + 2)) {
          goto LABEL_133;
        }
        *(void *)v86 = v87;
        *(void *)&v88[16 * v83 + 8] = v91;
        unint64_t v93 = *((void *)v85 + 2);
        if (v89 >= v93) {
          goto LABEL_134;
        }
        size_t v11 = v85;
        unint64_t v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        v42 = v88;
        *((void *)v85 + 2) = v93 - 1;
        uint64_t v10 = v92;
        Swift::Int v9 = v107;
        if (v93 <= 2) {
          goto LABEL_15;
        }
      }
    }
    unint64_t v12 = 1;
LABEL_15:
    Swift::Int v3 = v106;
    if (v9 >= v106)
    {
      int64_t v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105)) {
    goto LABEL_153;
  }
  if (v13 + v105 >= v3) {
    Swift::Int v32 = v3;
  }
  else {
    Swift::Int v32 = v13 + v105;
  }
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      v33 = (void *)(v10 + 16 * v9);
      do
      {
        v34 = (uint64_t *)(v10 + 16 * v9);
        uint64_t v35 = *v34;
        uint64_t v36 = v34[1];
        Swift::Int v37 = v13;
        v38 = v33;
        do
        {
          BOOL v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0) {
            break;
          }
          if (!v10) {
            goto LABEL_156;
          }
          uint64_t v35 = *v38;
          uint64_t v36 = v38[1];
          *(_OWORD *)v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      Swift::Int v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  Swift::Int result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100006474(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v6 = result;
    uint64_t v7 = *a4;
    uint64_t v8 = *a4 + 16 * a3;
LABEL_5:
    Swift::Int v9 = (uint64_t *)(v7 + 16 * v4);
    Swift::Int result = *v9;
    uint64_t v10 = v9[1];
    uint64_t v11 = v6;
    unint64_t v12 = (uint64_t *)v8;
    while (1)
    {
      BOOL v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2) {
          return result;
        }
        goto LABEL_5;
      }
      if (!v7) {
        break;
      }
      Swift::Int result = *v12;
      uint64_t v10 = v12[1];
      *(_OWORD *)unint64_t v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_100006544(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v4 = __dst;
  uint64_t v6 = a2;
  uint64_t v7 = __src;
  int64_t v8 = a2 - __src;
  int64_t v9 = a2 - __src + 15;
  if (a2 - __src >= 0) {
    int64_t v9 = a2 - __src;
  }
  uint64_t v10 = v9 >> 4;
  uint64_t v11 = a3 - (void)a2;
  uint64_t v12 = a3 - (void)a2 + 15;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v12 = a3 - (void)a2;
  }
  uint64_t v13 = v12 >> 4;
  Swift::Int v27 = __src;
  uint64_t v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst) {
        memmove(__dst, a2, 16 * v13);
      }
      uint64_t v17 = &v4[16 * v13];
      uint64_t v25 = v17;
      Swift::Int v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        os_log_type_t v18 = (char *)(a3 - 16);
        int v19 = v6;
        while (1)
        {
          Swift::Int v20 = v18 + 16;
          uint64_t v21 = *((void *)v19 - 2);
          uint64_t v22 = *((void *)v19 - 1);
          v19 -= 16;
          BOOL v23 = *((void *)v17 - 2) == v21 && *((void *)v17 - 1) == v22;
          if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
          {
            uint64_t v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17) {
              *(_OWORD *)os_log_type_t v18 = *((_OWORD *)v17 - 1);
            }
            int v19 = v6;
            v17 -= 16;
            if (v6 <= v7) {
              goto LABEL_50;
            }
          }
          else
          {
            if (v20 != v6 || v18 >= v6) {
              *(_OWORD *)os_log_type_t v18 = *(_OWORD *)v19;
            }
            Swift::Int v27 = v19;
            if (v19 <= v7) {
              goto LABEL_50;
            }
          }
          v18 -= 16;
          uint64_t v6 = v19;
          if (v17 <= v4) {
            goto LABEL_50;
          }
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst) {
      memmove(__dst, __src, 16 * v10);
    }
    Swift::String v14 = &v4[16 * v10];
    uint64_t v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        BOOL v15 = *(void *)v6 == *(void *)v4 && *((void *)v6 + 1) == *((void *)v4 + 1);
        if (v15 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          if (v7 != v4) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v4;
          }
          v4 += 16;
          uint64_t v26 = v4;
          uint64_t v16 = v6;
        }
        else
        {
          uint64_t v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6) {
            *(_OWORD *)uint64_t v7 = *(_OWORD *)v6;
          }
        }
        v7 += 16;
        if (v4 >= v14) {
          break;
        }
        uint64_t v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      Swift::Int v27 = v7;
    }
LABEL_50:
    sub_1000068DC((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *sub_1000067E0(char *result, int64_t a2, char a3, char *a4)
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
    sub_100006D04(&qword_10001A688);
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
  Swift::String v14 = a4 + 32;
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

char *sub_1000068DC(void **a1, const void **a2, void *a3)
{
  Swift::Int v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 15;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -16)
  {
    uint64_t result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
    {
      return (char *)memmove(result, v3, 16 * v7);
    }
  }
  return result;
}

char *sub_100006998(uint64_t a1)
{
  return sub_1000067E0(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000069AC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006D04(&qword_10001A680);
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
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  Swift::String v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
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

uint64_t sub_100006B18(uint64_t a1)
{
  return sub_1000069AC(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100006B2C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100006C20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_100006C58(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006CA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006D04(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100006D4C()
{
  unint64_t result = qword_10001A678;
  if (!qword_10001A678)
  {
    sub_100006DA8(&qword_10001A670);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001A678);
  }
  return result;
}

uint64_t sub_100006DA8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_100006DF0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100006E54()
{
  unint64_t result = qword_10001A690;
  if (!qword_10001A690)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001A690);
  }
  return result;
}

void sub_100006E98(void *a1)
{
  id v1 = [a1 session];
  id v29 = [v1 role];
  uint64_t v2 = (void *)static UISceneSessionRole.intelligenceLight.getter();
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  if (v3 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v5 == v6)
  {

    swift_bridgeObjectRelease_n();
LABEL_17:
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v22 = (void *)Strong;
      sub_10000A6A4(0);
    }
    goto LABEL_23;
  }
  char v8 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8) {
    goto LABEL_17;
  }
  uint64_t v9 = (void *)static UISceneSessionRole.intelligenceNoise.getter();
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {

    swift_bridgeObjectRelease_n();
LABEL_21:
    uint64_t v23 = swift_unknownObjectWeakLoadStrong();
    if (v23)
    {
      uint64_t v24 = (void *)v23;
      sub_10000A6A4(0);
    }
LABEL_23:
    id v25 = objc_msgSend(v1, "persistentIdentifier", v29);
    Swift::Int v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    Swift::Int v28 = v27;

    swift_beginAccess();
    sub_1000077AC(&v31, v26, v28);
    swift_endAccess();

    swift_bridgeObjectRelease();
    return;
  }
  char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v15) {
    goto LABEL_21;
  }
  _StringGuts.grow(_:)(99);
  v16._countAndFlagsBits = 0xD000000000000036;
  v16._object = (void *)0x8000000100011440;
  String.append(_:)(v16);
  v17._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.append(_:)(v17);
  swift_bridgeObjectRelease();
  v18._countAndFlagsBits = 0xD00000000000002BLL;
  v18._object = (void *)0x8000000100011480;
  String.append(_:)(v18);
  if (qword_10001A410 != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  sub_1000045BC(v19, (uint64_t)qword_10001A630);
  os_log_type_t v20 = static os_log_type_t.error.getter();
  sub_100005134(v20, 8, 0xD000000000000011, 0x8000000100011420, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
}

void sub_10000720C(void *a1)
{
  uint64_t v2 = v1;
  id v3 = [a1 session];
  id v35 = [v3 role];
  uint64_t v4 = (void *)static UISceneSessionRole.intelligenceLight.getter();
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  if (v5 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v7 == v8)
  {

    swift_bridgeObjectRelease_n();
LABEL_17:
    id v23 = objc_msgSend(v3, "persistentIdentifier", v35);
    uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v26 = v25;

    uint64_t v27 = v2 + OBJC_IVAR____TtC16IntelligentLight11SceneModule_activeLightSceneSessionIds;
    swift_beginAccess();
    sub_10000823C(v24, v26);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*(void *)(*(void *)v27 + 16))
    {
LABEL_21:
      uint64_t Strong = swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        v34 = (void *)Strong;
        sub_10000A6A4(1);
      }
    }
LABEL_23:

    return;
  }
  char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v10) {
    goto LABEL_17;
  }
  uint64_t v11 = (void *)static UISceneSessionRole.intelligenceNoise.getter();
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {

    swift_bridgeObjectRelease_n();
LABEL_20:
    id v28 = objc_msgSend(v3, "persistentIdentifier", v35);
    uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v31 = v30;

    uint64_t v32 = v2 + OBJC_IVAR____TtC16IntelligentLight11SceneModule_activeNoiseSceneSessionIds;
    swift_beginAccess();
    sub_10000823C(v29, v31);
    swift_endAccess();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!*(void *)(*(void *)v32 + 16)) {
      goto LABEL_21;
    }
    goto LABEL_23;
  }
  char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v17) {
    goto LABEL_20;
  }
  _StringGuts.grow(_:)(54);
  v18._countAndFlagsBits = 0xD000000000000033;
  v18._object = (void *)0x80000001000113E0;
  String.append(_:)(v18);
  v19._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.append(_:)(v19);
  swift_bridgeObjectRelease();
  v20._countAndFlagsBits = 46;
  v20._object = (void *)0xE100000000000000;
  String.append(_:)(v20);
  if (qword_10001A410 != -1) {
    swift_once();
  }
  uint64_t v21 = type metadata accessor for Logger();
  sub_1000045BC(v21, (uint64_t)qword_10001A630);
  os_log_type_t v22 = static os_log_type_t.error.getter();
  sub_100005134(v22, 8, 0xD000000000000013, 0x80000001000113C0, 0, 0xE000000000000000);
  swift_bridgeObjectRelease();
}

id sub_10000765C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SceneModule()
{
  return self;
}

void sub_100007734(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  uint64_t ObjectType = swift_getObjectType();

  sub_100008594(a2, v6, ObjectType, a3);
}

uint64_t sub_10000778C()
{
  return 0x646F4D656E656373;
}

uint64_t sub_1000077AC(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      Swift::String v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *id v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100007C3C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *id v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10000795C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006D04(&qword_10001A6E8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_100007C3C(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10000795C();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100007DD8();
      goto LABEL_22;
    }
    sub_100007F8C();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_100007DD8()
{
  uint64_t v1 = v0;
  sub_100006D04(&qword_10001A6E8);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    void *v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_100007F8C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100006D04(&qword_10001A6E8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000823C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *v2;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v6 = Hasher._finalize()();
  uint64_t v7 = -1 << *(unsigned char *)(v5 + 32);
  unint64_t v8 = v6 & ~v7;
  if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  uint64_t v9 = *(void *)(v5 + 48);
  uint64_t v10 = (void *)(v9 + 16 * v8);
  BOOL v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    uint64_t v15 = ~v7;
    do
    {
      unint64_t v8 = (v8 + 1) & v15;
      if (((*(void *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
        goto LABEL_18;
      }
      int64_t v16 = (void *)(v9 + 16 * v8);
      BOOL v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v19 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_100007DD8();
    uint64_t v13 = v19;
  }
  uint64_t v14 = *(void *)(*(void *)(v13 + 48) + 16 * v8);
  sub_1000083CC(v8);
  *uint64_t v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_1000083CC(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v10 = Hasher._finalize()();
        swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(v3 + 48);
          uint64_t v13 = (_OWORD *)(v12 + 16 * v2);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (int64_t v2 = v6, v13 >= v14 + 1))
          {
            *uint64_t v13 = *v14;
            int64_t v2 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v15 = *(void *)(v3 + 16);
  BOOL v16 = __OFSUB__(v15, 1);
  uint64_t v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void sub_100008594(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  void (*v12)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  char *v21;
  uint64_t v22;
  void *v23;
  void v24[3];
  uint64_t v25;
  char **v26;
  void *v27;

  uint64_t ObjectType = swift_getObjectType();
  uint64_t v7 = &a2[OBJC_IVAR____TtC16IntelligentLight11SceneModule_moduleAccessor];
  *(void *)&a2[OBJC_IVAR____TtC16IntelligentLight11SceneModule_moduleAccessor + 8] = a4;
  swift_unknownObjectWeakAssign();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v9 = *((void *)v7 + 1);
    uint64_t v10 = swift_getObjectType();
    char v25 = ObjectType;
    unint64_t v26 = &off_100014AE8;
    v24[0] = a2;
    uint64_t v11 = type metadata accessor for LightLayerModule();
    uint64_t v12 = *(void (**)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 8);
    uint64_t v13 = a2;
    v12(&v27, v24, v11, v11, v10, v9);

    sub_10000876C((uint64_t)v24);
    uint64_t Strong = v27;
  }
  swift_unknownObjectWeakAssign();

  uint64_t v14 = swift_unknownObjectWeakLoadStrong();
  if (v14)
  {
    uint64_t v15 = (void *)v14;
    sub_10000A6A4(1);
  }
  BOOL v16 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v16)
  {
    uint64_t v17 = *((void *)v7 + 1);
    int64_t v18 = swift_getObjectType();
    char v25 = ObjectType;
    unint64_t v26 = &off_100014AE8;
    v24[0] = a2;
    uint64_t v19 = type metadata accessor for NoiseLayerModule();
    uint64_t v20 = *(void (**)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 8);
    uint64_t v21 = a2;
    v20(&v27, v24, v19, v19, v18, v17);

    sub_10000876C((uint64_t)v24);
    BOOL v16 = v27;
  }
  swift_unknownObjectWeakAssign();

  uint64_t v22 = swift_unknownObjectWeakLoadStrong();
  if (v22)
  {
    unint64_t v23 = (void *)v22;
    sub_10000A6A4(1);
  }
}

uint64_t sub_10000876C(uint64_t a1)
{
  uint64_t v2 = sub_100006D04((uint64_t *)&unk_10001A880);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000087CC(uint64_t a1)
{
  return a1;
}

id sub_10000884C()
{
  uint64_t v1 = OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_moduleManager;
  *(void *)&v0[OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_moduleManager] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_window] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_contentView] = 0;
  uint64_t v2 = self;
  uint64_t v3 = v0;
  id v4 = [v2 sharedApplication];
  id v5 = [v4 delegate];

  if (v5)
  {
    type metadata accessor for IntelligentLightAppDelegate();
    uint64_t v6 = swift_dynamicCastClass();
    if (v6)
    {
      uint64_t v7 = *(void **)(v6 + OBJC_IVAR____TtC16IntelligentLight27IntelligentLightAppDelegate_moduleManager);
      id v8 = v7;
    }
    else
    {
      uint64_t v7 = 0;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    uint64_t v7 = 0;
  }
  uint64_t v9 = *(void **)&v0[v1];
  *(void *)&v0[v1] = v7;

  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for LightSceneDelegate();
  return objc_msgSendSuper2(&v11, "init");
}

void sub_100008988(void *a1, void *a2, void *a3)
{
  id v4 = v3;
  self;
  uint64_t v8 = swift_dynamicCastObjCClass();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    id v51 = a1;
    _StringGuts.grow(_:)(48);
    swift_bridgeObjectRelease();
    *(void *)&long long v52 = 0xD00000000000001CLL;
    *((void *)&v52 + 1) = 0x80000001000115F0;
    id v10 = [a2 persistentIdentifier];
    uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v12;

    v14._countAndFlagsBits = v11;
    v14._object = v13;
    String.append(_:)(v14);
    swift_bridgeObjectRelease();
    v15._object = (void *)0x8000000100011590;
    v15._countAndFlagsBits = 0xD000000000000010;
    String.append(_:)(v15);
    id v16 = a3;
    id v17 = [v16 description];
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v20 = v19;

    v21._countAndFlagsBits = v18;
    v21._object = v20;
    String.append(_:)(v21);
    swift_bridgeObjectRelease();
    if (qword_10001A410 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_1000045BC(v22, (uint64_t)qword_10001A630);
    os_log_type_t v23 = static os_log_type_t.info.getter();
    sub_100005134(v23, 1, 0xD00000000000001FLL, 0x80000001000115D0, v52, *((unint64_t *)&v52 + 1));
    swift_bridgeObjectRelease();
    uint64_t v24 = OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_moduleManager;
    uint64_t v25 = *(void *)&v4[OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_moduleManager];
    if (v25)
    {
      id v26 = *(id *)(v25 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_lightLayerModule);
      id v27 = [v9 screen];
      sub_100009B0C(v27);
    }
    if (UISceneConnectionOptions.prefersAudioReactivity.getter())
    {
      uint64_t v28 = *(void *)&v4[v24];
      if (v28)
      {
        int64_t v29 = (char *)*(id *)(v28 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_audioPowerModule);
        os_log_type_t v30 = static os_log_type_t.info.getter();
        sub_100005134(v30, 2, 0xD000000000000017, 0x8000000100011610, 0x747261747323, 0xE600000000000000);
        [*(id *)&v29[OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_audioPowerUpdater] startObservingUpdates];
      }
    }
    id v31 = [objc_allocWithZone((Class)type metadata accessor for SiriLightHostWindow()) initWithWindowScene:v9];
    [v31 bounds];
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    double v39 = v38;
    id v40 = [v31 screen];
    [v40 nativeBounds];

    id v41 = [v31 screen];
    id v42 = [v41 displayIdentity];

    if (v42)
    {
      uint64_t v43 = *(void *)&v4[v24];
      if (v43)
      {
        unint64_t v44 = *(void **)(v43 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_lightLayerModule);
        *((void *)&v53 + 1) = type metadata accessor for LightLayerModule();
        uint64_t v54 = &off_100014C00;
        *(void *)&long long v52 = v44;
        id v45 = v44;
      }
      else
      {
        uint64_t v54 = 0;
        long long v52 = 0u;
        long long v53 = 0u;
      }
      id v46 = objc_allocWithZone((Class)type metadata accessor for SiriLightHostView());
      id v47 = sub_10000DF2C(v42, (uint64_t)&v52, v33, v35, v37, v39);
      [v47 setAutoresizingMask:18];
      [v31 addSubview:v47];
      char v48 = *(void **)&v4[OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_contentView];
      *(void *)&v4[OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_contentView] = v47;
      id v49 = v47;

      [v4 setWindow:v31];
      id v50 = *(id *)&v4[OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_window];
      [v50 makeKeyAndVisible];
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_100008EA8(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_moduleManager;
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_moduleManager);
  if (v3)
  {
    uint64_t v4 = v1;
    uint64_t v6 = qword_10001A410;
    uint64_t v12 = (char *)*(id *)(v3 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_audioPowerModule);
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_1000045BC(v7, (uint64_t)qword_10001A630);
    os_log_type_t v8 = static os_log_type_t.info.getter();
    sub_100005134(v8, 2, 0xD000000000000016, 0x80000001000115B0, 1886352499, 0xE400000000000000);
    [*(id *)&v12[OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_audioPowerUpdater] stopObservingUpdates];

    uint64_t v9 = *(void *)(v4 + v2);
    if (v9)
    {
      id v10 = *(id *)(v9 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_sceneModule);
      sub_10000720C(a1);
    }
    uint64_t v11 = v12;
  }
  else
  {
    uint64_t v11 = 0;
  }
}

void sub_10000907C(char *a1, uint64_t a2, void *a3, void (*a4)(id))
{
  uint64_t v4 = *(void *)&a1[OBJC_IVAR____TtC16IntelligentLight18LightSceneDelegate_moduleManager];
  if (v4)
  {
    uint64_t v7 = *(void **)(v4 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_sceneModule);
    id v8 = a3;
    uint64_t v9 = a1;
    id v10 = v7;
    a4(v8);
  }
}

id sub_100009134()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LightSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LightSceneDelegate()
{
  return self;
}

_UNKNOWN **sub_1000091EC()
{
  return &off_100014C10;
}

uint64_t sub_1000091F8(void *a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for _UIIntelligenceLightSourceConfiguration();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = 0;
  unint64_t v23 = 0xE000000000000000;
  _StringGuts.grow(_:)(62);
  v8._countAndFlagsBits = 0xD00000000000002ALL;
  v8._object = (void *)0x8000000100011560;
  String.append(_:)(v8);
  id v9 = [a1 session];
  id v10 = [v9 persistentIdentifier];

  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;

  v14._countAndFlagsBits = v11;
  v14._object = v13;
  String.append(_:)(v14);
  swift_bridgeObjectRelease();
  v15._object = (void *)0x8000000100011590;
  v15._countAndFlagsBits = 0xD000000000000010;
  String.append(_:)(v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  v16._countAndFlagsBits = String.init<A>(describing:)();
  String.append(_:)(v16);
  swift_bridgeObjectRelease();
  uint64_t v18 = v22;
  unint64_t v17 = v23;
  if (qword_10001A410 != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  sub_1000045BC(v19, (uint64_t)qword_10001A630);
  os_log_type_t v20 = static os_log_type_t.info.getter();
  sub_100005134(v20, 1, 0xD000000000000025, 0x8000000100011530, v18, v17);
  return swift_bridgeObjectRelease();
}

id sub_100009550()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AudioPowerModule();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AudioPowerModule()
{
  return self;
}

void sub_100009604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  uint64_t ObjectType = swift_getObjectType();

  sub_1000096D4(a2, v6, ObjectType, a3);
}

uint64_t sub_10000965C()
{
  uint64_t v1 = *v0;
  id v2 = [objc_allocWithZone((Class)SRUIFAudioPowerLevelUpdater) initWithDelegate:*v0];
  *(void *)(v1 + OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_audioPowerUpdater) = v2;

  return _objc_release_x1();
}

unint64_t sub_1000096B8()
{
  return 0xD000000000000010;
}

void sub_1000096D4(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  void (*v10)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  char *v11;
  void v12[5];
  void *v13;

  uint64_t v5 = &a2[OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_moduleAccessor];
  *(void *)&a2[OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_moduleAccessor + 8] = a4;
  swift_unknownObjectWeakAssign();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v7 = *((void *)v5 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v12[3] = type metadata accessor for AudioPowerModule();
    v12[4] = &off_100014B10;
    v12[0] = a2;
    uint64_t v9 = type metadata accessor for LightLayerModule();
    id v10 = *(void (**)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8);
    uint64_t v11 = a2;
    v10(&v13, v12, v9, v9, ObjectType, v7);

    sub_10000876C((uint64_t)v12);
    uint64_t Strong = v13;
  }
  swift_unknownObjectWeakAssign();
}

id sub_1000097C4()
{
  *(void *)&v0[OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_moduleAccessor + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayContexts] = &_swiftEmptyDictionarySingleton;
  uint64_t v1 = OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayMonitor;
  id v2 = objc_allocWithZone((Class)FBSDisplayMonitor);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = [v2 init];
  v3[OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_reducedFramerateMode] = 0;

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for LightLayerModule();
  id v4 = objc_msgSendSuper2(&v9, "init");
  uint64_t v5 = self;
  id v6 = v4;
  id v7 = [v5 defaultCenter];
  [v7 addObserver:v6 selector:"thermalStateDidChangeWithNotification:" name:NSProcessInfoThermalStateDidChangeNotification object:0];

  sub_10000ACB0();
  return v6;
}

uint64_t sub_100009914@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayContexts);
  uint64_t result = swift_beginAccess();
  uint64_t v7 = *v5;
  if (*(void *)(v7 + 16))
  {
    id v8 = a1;
    swift_bridgeObjectRetain();
    unint64_t v9 = sub_10000B5A4((uint64_t)v8);
    if (v10)
    {
      uint64_t v11 = *(void *)(v7 + 56) + 48 * v9;
      id v12 = *(id *)v11;
      uint64_t v13 = *(void **)(v11 + 8);
      long long v18 = *(_OWORD *)(v11 + 32);
      long long v19 = *(_OWORD *)(v11 + 16);
      id v14 = *(id *)v11;
      id v15 = v13;
    }
    else
    {
      id v12 = 0;
      uint64_t v13 = 0;
      long long v18 = 0u;
      long long v19 = 0u;
    }

    uint64_t result = swift_bridgeObjectRelease();
    long long v17 = v18;
    long long v16 = v19;
  }
  else
  {
    id v12 = 0;
    uint64_t v13 = 0;
    long long v16 = 0uLL;
    long long v17 = 0uLL;
  }
  *(void *)a2 = v12;
  *(void *)(a2 + 8) = v13;
  *(_OWORD *)(a2 + 16) = v16;
  *(_OWORD *)(a2 + 32) = v17;
  return result;
}

id sub_1000099FC()
{
  [*(id *)&v0[OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayMonitor] removeObserver:v0];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LightLayerModule();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_100009B0C(void *a1)
{
  objc_super v2 = v1;
  id v4 = [a1 displayIdentity];
  if (v4)
  {
    id v5 = v4;
    id v6 = (char *)v1 + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayContexts;
    swift_beginAccess();
    uint64_t v7 = *(void *)v6;
    if (*(void *)(*(void *)v6 + 16))
    {
      id v8 = v5;
      swift_bridgeObjectRetain();
      unint64_t v9 = sub_10000B5A4((uint64_t)v8);
      if (v10)
      {

        swift_bridgeObjectRelease();
        return;
      }

      swift_bridgeObjectRelease();
    }
    id v11 = [a1 traitCollection];
    id v12 = [v11 userInterfaceIdiom];

    if (v12)
    {
      id v13 = [a1 displayConfiguration];
      if (!v13)
      {
        __break(1u);
        return;
      }
      id v14 = v13;
      id v15 = [v13 currentMode];

      [v15 nativePixelSize];
    }
    else
    {
      id v16 = [*(id *)((char *)v2 + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayMonitor) configurationForIdentity:v5];
      if (!v16)
      {
        char v54 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x118))();
        _StringGuts.grow(_:)(47);
        swift_bridgeObjectRelease();
        *(void *)&long long v63 = 0xD00000000000002DLL;
        *((void *)&v63 + 1) = 0x80000001000119B0;
        id v55 = [v5 description];
        uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v58 = v57;

        v59._countAndFlagsBits = v56;
        v59._object = v58;
        String.append(_:)(v59);
        swift_bridgeObjectRelease();
        if (qword_10001A410 != -1) {
          swift_once();
        }
        uint64_t v60 = type metadata accessor for Logger();
        sub_1000045BC(v60, (uint64_t)qword_10001A630);
        os_log_type_t v61 = static os_log_type_t.error.getter();
        sub_100005134(v61, v54, 0xD00000000000001DLL, 0x8000000100011920, 0xD00000000000002DLL, 0x80000001000119B0);
        goto LABEL_23;
      }
      id v15 = v16;
      [v16 pixelSize];
    }

    double v17 = sub_10000C344();
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    id v24 = [objc_allocWithZone((Class)SUICIntelligentLightLayer) initWithScreen:a1 commandQueue:0];
    [v24 setColorPalette:(*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x110))()];
    if (*((unsigned char *)v2 + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_reducedFramerateMode) == 1) {
      [v24 startReducedFramerateForPerformance];
    }
    uint64_t v25 = self;
    sub_100006D04(&qword_10001A978);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10000F5B0;
    *(void *)&long long v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *((void *)&v63 + 1) = v27;
    AnyHashable.init<A>(_:)();
    *(void *)(inited + 96) = &type metadata for Bool;
    *(unsigned char *)(inited + 72) = 1;
    sub_10000A364(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v29 = [v25 remoteContextWithOptions:isa];

    if (v29)
    {
      id v30 = [v29 setLayer:v24];
      char v31 = (*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x118))(v30);
      _StringGuts.grow(_:)(66);
      v32._countAndFlagsBits = 0xD000000000000032;
      v32._object = (void *)0x8000000100011970;
      String.append(_:)(v32);
      id v33 = [v5 description];
      uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      double v36 = v35;

      v37._countAndFlagsBits = v34;
      v37._object = v36;
      String.append(_:)(v37);
      swift_bridgeObjectRelease();
      v38._countAndFlagsBits = 0x747865746E6F6320;
      v38._object = (void *)0xEB00000000206449;
      String.append(_:)(v38);
      [v29 contextId];
      v39._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
      String.append(_:)(v39);
      swift_bridgeObjectRelease();
      v40._countAndFlagsBits = 46;
      v40._object = (void *)0xE100000000000000;
      String.append(_:)(v40);
      if (qword_10001A410 != -1) {
        swift_once();
      }
      uint64_t v41 = type metadata accessor for Logger();
      sub_1000045BC(v41, (uint64_t)qword_10001A630);
      os_log_type_t v42 = static os_log_type_t.info.getter();
      sub_100005134(v42, v31, 0xD00000000000001DLL, 0x8000000100011920, 0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      *(void *)&long long v63 = v24;
      *((void *)&v63 + 1) = v29;
      double v64 = v17;
      uint64_t v65 = v19;
      uint64_t v66 = v21;
      uint64_t v67 = v23;
      swift_beginAccess();
      id v5 = v5;
      id v43 = v24;
      id v44 = v29;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v62 = *(void *)v6;
      *(void *)id v6 = 0x8000000000000000;
      sub_10000BDDC(&v63, v5, isUniquelyReferenced_nonNull_native);
      *(void *)id v6 = v62;

      swift_bridgeObjectRelease();
      swift_endAccess();

      goto LABEL_24;
    }
    char v46 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x118))();
    _StringGuts.grow(_:)(46);
    swift_bridgeObjectRelease();
    *(void *)&long long v63 = 0xD00000000000002CLL;
    *((void *)&v63 + 1) = 0x8000000100011940;
    id v47 = [v5 description];
    uint64_t v48 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v50 = v49;

    v51._countAndFlagsBits = v48;
    v51._object = v50;
    String.append(_:)(v51);
    swift_bridgeObjectRelease();
    if (qword_10001A410 != -1) {
      swift_once();
    }
    uint64_t v52 = type metadata accessor for Logger();
    sub_1000045BC(v52, (uint64_t)qword_10001A630);
    os_log_type_t v53 = static os_log_type_t.error.getter();
    sub_100005134(v53, v46, 0xD00000000000001DLL, 0x8000000100011920, 0xD00000000000002CLL, 0x8000000100011940);

LABEL_23:
    swift_bridgeObjectRelease();
LABEL_24:
  }
}

unint64_t sub_10000A364(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006D04(&qword_10001A980);
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
    sub_10000C358(v6, (uint64_t)v15);
    unint64_t result = sub_10000B5E8((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_10000C3C0(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void sub_10000A494(void *a1)
{
  char v3 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x118))();
  _StringGuts.grow(_:)(50);
  swift_bridgeObjectRelease();
  id v15 = (id)0xD00000000000002FLL;
  unint64_t v16 = 0x80000001000118F0;
  id v4 = [a1 description];
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;

  v8._countAndFlagsBits = v5;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 46;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);
  if (qword_10001A410 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_1000045BC(v10, (uint64_t)qword_10001A630);
  os_log_type_t v11 = static os_log_type_t.info.getter();
  sub_100005134(v11, v3, 0xD00000000000001ALL, 0x80000001000118D0, 0xD00000000000002FLL, 0x80000001000118F0);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_10000B800((uint64_t)a1, (uint64_t)v14);
  swift_endAccess();
  sub_10000B53C((uint64_t)v14, (uint64_t)&v15);
  id v12 = v15;
  if (v15)
  {
    BOOL v13 = (void *)v16;
    [v15 invalidate];
  }
}

unint64_t sub_10000A688()
{
  return 0xD000000000000010;
}

uint64_t sub_10000A6A4(char a1)
{
  uint64_t v2 = v1;
  LOBYTE(v4) = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x118))();
  _StringGuts.grow(_:)(54);
  v5._object = (void *)0x8000000100011890;
  v5._countAndFlagsBits = 0xD000000000000034;
  String.append(_:)(v5);
  if (a1) {
    uint64_t v6 = 1702195828;
  }
  else {
    uint64_t v6 = 0x65736C6166;
  }
  if (a1) {
    unint64_t v7 = 0xE400000000000000;
  }
  else {
    unint64_t v7 = 0xE500000000000000;
  }
  unint64_t v8 = v7;
  String.append(_:)(*(Swift::String *)&v6);
  swift_bridgeObjectRelease();
  uint64_t v9 = 0;
  int64_t v10 = 0xE000000000000000;
  if (qword_10001A410 != -1) {
LABEL_33:
  }
    swift_once();
  uint64_t v11 = type metadata accessor for Logger();
  sub_1000045BC(v11, (uint64_t)qword_10001A630);
  os_log_type_t v12 = static os_log_type_t.info.getter();
  sub_100005134(v12, (char)v4, 0x6573756150746573, 0xED0000293A5F2864, v9, v10);
  swift_bridgeObjectRelease();
  BOOL v13 = (void *)((char *)v2 + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayContexts);
  swift_beginAccess();
  uint64_t v2 = (void *)*v13;
  id v4 = v2 + 8;
  uint64_t v14 = 1 << *((unsigned char *)v2 + 32);
  uint64_t v15 = -1;
  if (v14 < 64) {
    uint64_t v15 = ~(-1 << v14);
  }
  unint64_t v16 = v15 & v2[8];
  int64_t v10 = (unint64_t)(v14 + 63) >> 6;
  swift_bridgeObjectRetain();
  int64_t v17 = 0;
  uint64_t v9 = a1 & 1;
  while (1)
  {
    if (v16)
    {
      unint64_t v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      unint64_t v19 = v18 | (v17 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
      __break(1u);
LABEL_32:
      __break(1u);
      goto LABEL_33;
    }
    if (v20 >= v10) {
      return swift_release();
    }
    unint64_t v21 = v4[v20];
    ++v17;
    if (!v21)
    {
      int64_t v17 = v20 + 1;
      if (v20 + 1 >= v10) {
        return swift_release();
      }
      unint64_t v21 = v4[v17];
      if (!v21)
      {
        int64_t v17 = v20 + 2;
        if (v20 + 2 >= v10) {
          return swift_release();
        }
        unint64_t v21 = v4[v17];
        if (!v21)
        {
          int64_t v17 = v20 + 3;
          if (v20 + 3 >= v10) {
            return swift_release();
          }
          unint64_t v21 = v4[v17];
          if (!v21) {
            break;
          }
        }
      }
    }
LABEL_29:
    unint64_t v16 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v17 << 6);
LABEL_12:
    [*(id *)(v2[7] + 48 * v19) setPaused:a1 & 1];
  }
  int64_t v22 = v20 + 4;
  if (v22 < v10)
  {
    unint64_t v21 = v4[v22];
    if (!v21)
    {
      while (1)
      {
        int64_t v17 = v22 + 1;
        if (__OFADD__(v22, 1)) {
          goto LABEL_32;
        }
        if (v17 >= v10) {
          return swift_release();
        }
        unint64_t v21 = v4[v17];
        ++v22;
        if (v21) {
          goto LABEL_29;
        }
      }
    }
    int64_t v17 = v22;
    goto LABEL_29;
  }
  return swift_release();
}

id sub_10000A98C(float a1)
{
  char v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayContexts);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v4 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(v4 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain();
  int64_t v12 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v14 = v13 | (v12 << 6);
      goto LABEL_5;
    }
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v9) {
      return (id)swift_release();
    }
    unint64_t v16 = *(void *)(v5 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        return (id)swift_release();
      }
      unint64_t v16 = *(void *)(v5 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          return (id)swift_release();
        }
        unint64_t v16 = *(void *)(v5 + 8 * v12);
        if (!v16)
        {
          int64_t v12 = v15 + 3;
          if (v15 + 3 >= v9) {
            return (id)swift_release();
          }
          unint64_t v16 = *(void *)(v5 + 8 * v12);
          if (!v16) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v12 << 6);
LABEL_5:
    *(float *)&double v11 = a1;
    id result = [*(id *)(*(void *)(v4 + 56) + 48 * v14) updateVolumeInputdB:v11];
  }
  int64_t v17 = v15 + 4;
  if (v17 >= v9) {
    return (id)swift_release();
  }
  unint64_t v16 = *(void *)(v5 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v9) {
      return (id)swift_release();
    }
    unint64_t v16 = *(void *)(v5 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_10000AB28()
{
  return 101;
}

uint64_t type metadata accessor for LightLayerModule()
{
  return self;
}

void sub_10000ACB0()
{
  uint64_t v1 = v0;
  id v12 = [self processInfo];
  uint64_t v2 = (char *)[v12 thermalState];
  if ((unint64_t)v2 < 2)
  {
    char v6 = (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x118))();
    if (qword_10001A410 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_1000045BC(v7, (uint64_t)qword_10001A630);
    os_log_type_t v8 = static os_log_type_t.info.getter();
    sub_100005134(v8, v6, 0xD000000000000020, 0x8000000100011780, 0xD00000000000004CLL, 0x80000001000117F0);
    sub_10000AFF0();

    *((unsigned char *)v1 + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_reducedFramerateMode) = 0;
  }
  else if ((unint64_t)(v2 - 2) > 1)
  {
    char v9 = (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x118))();
    if (qword_10001A410 != -1) {
      swift_once();
    }
    uint64_t v10 = type metadata accessor for Logger();
    sub_1000045BC(v10, (uint64_t)qword_10001A630);
    os_log_type_t v11 = static os_log_type_t.info.getter();
    sub_100005134(v11, v9, 0xD000000000000020, 0x8000000100011780, 0xD000000000000033, 0x80000001000117B0);
  }
  else
  {
    char v3 = (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x118))();
    if (qword_10001A410 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_1000045BC(v4, (uint64_t)qword_10001A630);
    os_log_type_t v5 = static os_log_type_t.info.getter();
    sub_100005134(v5, v3, 0xD000000000000020, 0x8000000100011780, 0xD000000000000043, 0x8000000100011840);
    sub_10000AFE4();

    *((unsigned char *)v1 + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_reducedFramerateMode) = 1;
  }
}

id sub_10000AFE4()
{
  return sub_10000AFFC((SEL *)&selRef_startReducedFramerateForPerformance);
}

id sub_10000AFF0()
{
  return sub_10000AFFC((SEL *)&selRef_endReducedFramerateForPerformance);
}

id sub_10000AFFC(SEL *a1)
{
  char v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayContexts);
  swift_beginAccess();
  uint64_t v4 = *v3;
  uint64_t v5 = v4 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(v4 + 64);
  int64_t v9 = (unint64_t)(v6 + 63) >> 6;
  id result = (id)swift_bridgeObjectRetain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v13 = v12 | (v11 << 6);
      goto LABEL_5;
    }
    int64_t v14 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v9) {
      return (id)swift_release();
    }
    unint64_t v15 = *(void *)(v5 + 8 * v14);
    ++v11;
    if (!v15)
    {
      int64_t v11 = v14 + 1;
      if (v14 + 1 >= v9) {
        return (id)swift_release();
      }
      unint64_t v15 = *(void *)(v5 + 8 * v11);
      if (!v15)
      {
        int64_t v11 = v14 + 2;
        if (v14 + 2 >= v9) {
          return (id)swift_release();
        }
        unint64_t v15 = *(void *)(v5 + 8 * v11);
        if (!v15)
        {
          int64_t v11 = v14 + 3;
          if (v14 + 3 >= v9) {
            return (id)swift_release();
          }
          unint64_t v15 = *(void *)(v5 + 8 * v11);
          if (!v15) {
            break;
          }
        }
      }
    }
LABEL_22:
    unint64_t v8 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v11 << 6);
LABEL_5:
    id result = [*(id *)(*(void *)(v4 + 56) + 48 * v13) *a1];
  }
  int64_t v16 = v14 + 4;
  if (v16 >= v9) {
    return (id)swift_release();
  }
  unint64_t v15 = *(void *)(v5 + 8 * v16);
  if (v15)
  {
    int64_t v11 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v11 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v11 >= v9) {
      return (id)swift_release();
    }
    unint64_t v15 = *(void *)(v5 + 8 * v11);
    ++v16;
    if (v15) {
      goto LABEL_22;
    }
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_10000B188@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100009914(a1, (uint64_t)v4);
  return sub_10000B53C((uint64_t)v4, a2);
}

uint64_t sub_10000B1C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *v3;
  uint64_t ObjectType = swift_getObjectType();

  return sub_10000C2E8(a2, v6, ObjectType, a3);
}

id sub_10000B220()
{
  return objc_msgSend(*(id *)(*v0 + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayMonitor), "addObserver:");
}

uint64_t sub_10000B23C()
{
  return (*(uint64_t (**)(void))((swift_isaMask & **v0) + 0xF8))();
}

unint64_t sub_10000B290()
{
  return 0xD000000000000010;
}

uint64_t sub_10000B2AC()
{
  return 500;
}

id sub_10000B2F4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NoiseLayerModule();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NoiseLayerModule()
{
  return self;
}

void destroy for LightLayerDisplayContext(uint64_t a1)
{
  objc_super v2 = *(void **)(a1 + 8);
}

uint64_t initializeWithCopy for LightLayerDisplayContext(uint64_t a1, uint64_t a2)
{
  char v3 = *(void **)a2;
  uint64_t v4 = *(void **)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  long long v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  id v6 = v3;
  id v7 = v4;
  return a1;
}

uint64_t assignWithCopy for LightLayerDisplayContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  long long v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  id v7 = *(void **)(a2 + 8);
  unint64_t v8 = *(void **)(a1 + 8);
  *(void *)(a1 + 8) = v7;
  id v9 = v7;

  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

__n128 initializeWithTake for LightLayerDisplayContext(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for LightLayerDisplayContext(uint64_t a1, _OWORD *a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  long long v5 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v5;
  return a1;
}

uint64_t getEnumTagSinglePayload for LightLayerDisplayContext(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LightLayerDisplayContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LightLayerDisplayContext()
{
  return &type metadata for LightLayerDisplayContext;
}

uint64_t sub_10000B53C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D04(&qword_10001A960);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000B5A4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10000B62C(a1, v4);
}

unint64_t sub_10000B5E8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10000B738(a1, v4);
}

unint64_t sub_10000B62C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_10000C304();
    id v6 = *(id *)(*(void *)(v2 + 48) + 8 * i);
    char v7 = static NSObject.== infix(_:_:)();

    if ((v7 & 1) == 0)
    {
      uint64_t v8 = ~v4;
      for (unint64_t i = (i + 1) & v8; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v8)
      {
        id v9 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v10 = static NSObject.== infix(_:_:)();

        if (v10) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_10000B738(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000C3D0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000C42C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10000B800@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10000B5A4(a1);
  LOBYTE(a1) = v7;
  uint64_t result = swift_bridgeObjectRelease();
  if (a1)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v10 = *v3;
    uint64_t v18 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10000BF64();
      uint64_t v10 = v18;
    }

    uint64_t v11 = *(void *)(v10 + 56) + 48 * v6;
    long long v17 = *(_OWORD *)v11;
    uint64_t v12 = *(void *)(v11 + 16);
    uint64_t v13 = *(void *)(v11 + 24);
    uint64_t v14 = *(void *)(v11 + 32);
    uint64_t v15 = *(void *)(v11 + 40);
    sub_10000BC14(v6, v10);
    *uint64_t v3 = v10;
    uint64_t result = swift_bridgeObjectRelease();
    long long v16 = v17;
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    uint64_t v15 = 0;
    long long v16 = 0uLL;
  }
  *(_OWORD *)a2 = v16;
  *(void *)(a2 + 16) = v12;
  *(void *)(a2 + 24) = v13;
  *(void *)(a2 + 32) = v14;
  *(void *)(a2 + 40) = v15;
  return result;
}

uint64_t sub_10000B908(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100006D04(&qword_10001A968);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
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
      unint64_t v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    int64_t v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11) {
      break;
    }
    uint64_t v23 = (void *)(v5 + 64);
    unint64_t v24 = *(void *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      int64_t v14 = v22 + 1;
      if (v22 + 1 >= v11) {
        goto LABEL_33;
      }
      unint64_t v24 = *(void *)(v36 + 8 * v14);
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v24 = *(void *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            int64_t v14 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_42;
            }
            if (v14 >= v11) {
              goto LABEL_33;
            }
            unint64_t v24 = *(void *)(v36 + 8 * v14);
            ++v25;
            if (v24) {
              goto LABEL_30;
            }
          }
        }
        int64_t v14 = v25;
      }
    }
LABEL_30:
    unint64_t v10 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    id v30 = *(void **)(*(void *)(v5 + 48) + 8 * v21);
    char v31 = (long long *)(*(void *)(v5 + 56) + 48 * v21);
    long long v38 = v31[1];
    long long v39 = *v31;
    long long v37 = v31[2];
    if ((a2 & 1) == 0)
    {
      id v32 = v30;
      id v33 = (id)v39;
      id v34 = *((id *)&v39 + 1);
    }
    uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v7 + 40));
    uint64_t v15 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v16 = result & ~v15;
    unint64_t v17 = v16 >> 6;
    if (((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v16) & ~*(void *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v28 = v17 == v27;
        if (v17 == v27) {
          unint64_t v17 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      unint64_t v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(void *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(void *)(*(void *)(v7 + 48) + 8 * v18) = v30;
    unint64_t v19 = (_OWORD *)(*(void *)(v7 + 56) + 48 * v18);
    _OWORD *v19 = v39;
    v19[1] = v38;
    v19[2] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v23 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v23 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

void sub_10000BC14(unint64_t a1, uint64_t a2)
{
  int64_t v3 = a1;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t v8 = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v12 = *(void *)(a2 + 40);
        id v13 = *(id *)(*(void *)(a2 + 48) + 8 * v6);
        Swift::Int v14 = NSObject._rawHashValue(seed:)(v12);

        Swift::Int v15 = v14 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v15 >= v9 && v3 >= v15)
          {
LABEL_16:
            uint64_t v18 = *(void *)(a2 + 48);
            unint64_t v19 = (void *)(v18 + 8 * v3);
            unint64_t v20 = (void *)(v18 + 8 * v6);
            if (v3 != v6 || v19 >= v20 + 1) {
              void *v19 = *v20;
            }
            uint64_t v21 = *(void *)(a2 + 56);
            int64_t v22 = (long long *)(v21 + 48 * v3);
            uint64_t v23 = (long long *)(v21 + 48 * v6);
            if (v3 != v6 || (int64_t v3 = v6, v22 >= v23 + 3))
            {
              long long v10 = *v23;
              long long v11 = v23[2];
              v22[1] = v23[1];
              v22[2] = v11;
              *int64_t v22 = v10;
              int64_t v3 = v6;
            }
          }
        }
        else if (v15 >= v9 || v3 >= v15)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v24 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v25 = *v24;
    uint64_t v26 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v24 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    uint64_t v26 = *v24;
    uint64_t v25 = (-1 << a1) - 1;
  }
  *unint64_t v24 = v26 & v25;
  uint64_t v27 = *(void *)(a2 + 16);
  BOOL v28 = __OFSUB__(v27, 1);
  uint64_t v29 = v27 - 1;
  if (v28)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v29;
    ++*(_DWORD *)(a2 + 36);
  }
}

void sub_10000BDDC(_OWORD *a1, void *a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = *v3;
  unint64_t v9 = sub_10000B5A4((uint64_t)a2);
  uint64_t v10 = *(void *)(v7 + 16);
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v13 = v8;
  uint64_t v14 = *(void *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_10000BF64();
LABEL_7:
    Swift::Int v15 = (void *)*v4;
    if (v13)
    {
LABEL_8:
      uint64_t v16 = v15[7] + 48 * v9;
      unint64_t v17 = *(void **)v16;

      long long v18 = a1[1];
      *(_OWORD *)uint64_t v16 = *a1;
      *(_OWORD *)(v16 + 16) = v18;
      *(_OWORD *)(v16 + 32) = a1[2];
      return;
    }
    goto LABEL_11;
  }
  sub_10000B908(v12, a3 & 1);
  unint64_t v19 = sub_10000B5A4((uint64_t)a2);
  if ((v13 & 1) != (v20 & 1))
  {
LABEL_17:
    sub_10000C304();
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return;
  }
  unint64_t v9 = v19;
  Swift::Int v15 = (void *)*v4;
  if (v13) {
    goto LABEL_8;
  }
LABEL_11:
  v15[(v9 >> 6) + 8] |= 1 << v9;
  *(void *)(v15[6] + 8 * v9) = a2;
  uint64_t v21 = (_OWORD *)(v15[7] + 48 * v9);
  long long v22 = a1[1];
  *uint64_t v21 = *a1;
  v21[1] = v22;
  v21[2] = a1[2];
  uint64_t v23 = v15[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  _OWORD v15[2] = v25;

  id v26 = a2;
}

id sub_10000BF64()
{
  uint64_t v1 = v0;
  sub_100006D04(&qword_10001A968);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      int64_t v9 = v26 + 1;
      if (v26 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v27 = *(void *)(v6 + 8 * v9);
      if (!v27) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v27 - 1) & v27;
    unint64_t v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 48 * v15;
    unint64_t v19 = (long long *)(*(void *)(v2 + 56) + v18);
    long long v21 = v19[1];
    long long v20 = v19[2];
    long long v29 = *v19;
    long long v22 = *v19;
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    uint64_t v23 = (_OWORD *)(*(void *)(v4 + 56) + v18);
    *uint64_t v23 = v22;
    v23[1] = v21;
    v23[2] = v20;
    id v24 = v17;
    id v25 = (id)v29;
    id result = *((id *)&v29 + 1);
  }
  int64_t v28 = v26 + 2;
  if (v28 >= v13) {
    goto LABEL_26;
  }
  unint64_t v27 = *(void *)(v6 + 8 * v28);
  if (v27)
  {
    int64_t v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v28 + 1;
    if (__OFADD__(v28, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v27 = *(void *)(v6 + 8 * v9);
    ++v28;
    if (v27) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_10000C144(void *a1)
{
  char v3 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x118))();
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease();
  id v4 = [a1 description];
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  v8._countAndFlagsBits = v5;
  v8._object = v7;
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 46;
  v9._object = (void *)0xE100000000000000;
  String.append(_:)(v9);
  if (qword_10001A410 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for Logger();
  sub_1000045BC(v10, (uint64_t)qword_10001A630);
  os_log_type_t v11 = static os_log_type_t.info.getter();
  sub_100005134(v11, v3, 0xD000000000000029, 0x80000001000119E0, 0xD000000000000018, 0x8000000100011A10);
  swift_bridgeObjectRelease();

  sub_10000A494(a1);
}

uint64_t sub_10000C2E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a2 + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_moduleAccessor + 8) = a4;
  return swift_unknownObjectWeakAssign();
}

unint64_t sub_10000C304()
{
  unint64_t result = qword_10001A970;
  if (!qword_10001A970)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001A970);
  }
  return result;
}

double sub_10000C344()
{
  return 0.0;
}

uint64_t sub_10000C358(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D04(&qword_10001A988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000C3C0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000C3D0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000C42C(uint64_t a1)
{
  return a1;
}

id sub_10000C5F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriLightHostWindow();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriLightHostWindow()
{
  return self;
}

void sub_10000C650(uint64_t a1)
{
  objc_super v2 = v1;
  id v3 = [objc_allocWithZone((Class)type metadata accessor for SiriLightHostWindow()) initWithWindowScene:a1];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [v3 screen];
  [v12 nativeBounds];

  id v13 = [v3 screen];
  id v14 = [v13 displayIdentity];

  if (!v14)
  {
    __break(1u);
    return;
  }
  uint64_t v15 = *(void *)&v2[OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_moduleManager];
  if (!v15) {
    goto LABEL_8;
  }
  uint64_t v16 = *(void **)(v15 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_lightLayerModule);
  uint64_t v17 = type metadata accessor for NoiseLayerModule();
  uint64_t v18 = swift_dynamicCastClass();
  if (!v18)
  {
    long long v21 = *(void **)(v15 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_noiseLayerModule);
    id v22 = v21;
    if (v21)
    {
      uint64_t v19 = (uint64_t)v22;
      goto LABEL_7;
    }
LABEL_8:
    long long v29 = 0;
    long long v27 = 0u;
    long long v28 = 0u;
    goto LABEL_9;
  }
  uint64_t v19 = v18;
  id v20 = v16;
LABEL_7:
  *((void *)&v28 + 1) = v17;
  long long v29 = &off_100014C00;
  *(void *)&long long v27 = v19;
LABEL_9:
  id v23 = objc_allocWithZone((Class)type metadata accessor for SiriLightHostView());
  id v24 = sub_10000DF2C(v14, (uint64_t)&v27, v5, v7, v9, v11);
  [v24 setAutoresizingMask:18];
  [v3 addSubview:v24];
  id v25 = *(void **)&v2[OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_contentView];
  *(void *)&v2[OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_contentView] = v24;
  id v26 = v24;

  [v2 setWindow:v3];
}

id sub_10000C8BC()
{
  uint64_t v1 = OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_moduleManager;
  *(void *)&v0[OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_moduleManager] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_window] = 0;
  *(void *)&v0[OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_contentView] = 0;
  objc_super v2 = self;
  id v3 = v0;
  id v4 = [v2 sharedApplication];
  id v5 = [v4 delegate];

  if (v5)
  {
    type metadata accessor for IntelligentLightAppDelegate();
    uint64_t v6 = swift_dynamicCastClass();
    if (v6)
    {
      double v7 = *(void **)(v6 + OBJC_IVAR____TtC16IntelligentLight27IntelligentLightAppDelegate_moduleManager);
      id v8 = v7;
    }
    else
    {
      double v7 = 0;
    }
    swift_unknownObjectRelease();
  }
  else
  {
    double v7 = 0;
  }
  double v9 = *(void **)&v0[v1];
  *(void *)&v0[v1] = v7;

  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for NoiseSceneDelegate();
  return objc_msgSendSuper2(&v11, "init");
}

void sub_10000CAD4(char *a1, uint64_t a2, void *a3, void (*a4)(id))
{
  uint64_t v4 = *(void *)&a1[OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_moduleManager];
  if (v4)
  {
    double v7 = *(void **)(v4 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_sceneModule);
    id v8 = a3;
    double v9 = a1;
    id v10 = v7;
    a4(v8);
  }
}

id sub_10000CB8C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NoiseSceneDelegate();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NoiseSceneDelegate()
{
  return self;
}

void sub_10000CC40(void *a1, void *a2)
{
  uint64_t v3 = v2;
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (!v6) {
    return;
  }
  double v7 = (void *)v6;
  id v24 = a1;
  _StringGuts.grow(_:)(30);
  swift_bridgeObjectRelease();
  id v8 = [a2 persistentIdentifier];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  objc_super v11 = v10;

  v12._countAndFlagsBits = v9;
  v12._object = v11;
  String.append(_:)(v12);
  swift_bridgeObjectRelease();
  if (qword_10001A410 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_1000045BC(v13, (uint64_t)qword_10001A630);
  os_log_type_t v14 = static os_log_type_t.info.getter();
  sub_100005134(v14, 4, 0xD00000000000001FLL, 0x80000001000115D0, 0xD00000000000001CLL, 0x80000001000115F0);
  swift_bridgeObjectRelease();
  uint64_t v15 = *(void *)(v3 + OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_moduleManager);
  if (v15)
  {
    uint64_t v16 = *(void **)(v15 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_lightLayerModule);
    type metadata accessor for NoiseLayerModule();
    uint64_t v17 = swift_dynamicCastClass();
    if (v17)
    {
      uint64_t v18 = (void *)v17;
      id v19 = v16;
LABEL_10:
      id v22 = [v7 screen];
      sub_100009B0C(v22);

      goto LABEL_11;
    }
    id v20 = *(void **)(v15 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_noiseLayerModule);
    id v21 = v20;
    if (v20)
    {
      uint64_t v18 = v21;
      goto LABEL_10;
    }
  }
LABEL_11:
  sub_10000C650((uint64_t)v7);
  id v23 = *(id *)(v3 + OBJC_IVAR____TtC16IntelligentLight18NoiseSceneDelegate_window);
  [v23 makeKeyAndVisible];
}

char *sub_10000CE80()
{
  id v1 = objc_allocWithZone((Class)type metadata accessor for LightLayerModule());
  uint64_t v2 = v0;
  id v3 = [v1 init];
  *(void *)&v2[OBJC_IVAR____TtC16IntelligentLight13ModuleManager_lightLayerModule] = v3;
  *(void *)&v2[OBJC_IVAR____TtC16IntelligentLight13ModuleManager_audioPowerModule] = [objc_allocWithZone((Class)type metadata accessor for AudioPowerModule()) init];
  *(void *)&v2[OBJC_IVAR____TtC16IntelligentLight13ModuleManager_noiseLayerModule] = [objc_allocWithZone((Class)type metadata accessor for NoiseLayerModule()) init];
  *(void *)&v2[OBJC_IVAR____TtC16IntelligentLight13ModuleManager_sceneModule] = [objc_allocWithZone((Class)type metadata accessor for SceneModule()) init];

  v23.receiver = v2;
  v23.super_class = (Class)type metadata accessor for ModuleManager();
  uint64_t v4 = (char *)objc_msgSendSuper2(&v23, "init");
  uint64_t v5 = OBJC_IVAR____TtC16IntelligentLight13ModuleManager_lightLayerModule;
  *(void *)(*(void *)&v4[OBJC_IVAR____TtC16IntelligentLight13ModuleManager_lightLayerModule]
            + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_moduleAccessor
            + 8) = &off_100014C28;
  swift_unknownObjectWeakAssign();
  uint64_t v6 = OBJC_IVAR____TtC16IntelligentLight13ModuleManager_audioPowerModule;
  double v7 = *(void **)&v4[OBJC_IVAR____TtC16IntelligentLight13ModuleManager_audioPowerModule];
  id v8 = v4;
  uint64_t v9 = v7;
  sub_10000D6E8((uint64_t)v8, v9);

  uint64_t v10 = OBJC_IVAR____TtC16IntelligentLight13ModuleManager_noiseLayerModule;
  *(void *)(*(void *)&v8[OBJC_IVAR____TtC16IntelligentLight13ModuleManager_noiseLayerModule]
            + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_moduleAccessor
            + 8) = &off_100014C28;
  swift_unknownObjectWeakAssign();
  objc_super v11 = *(void **)&v8[OBJC_IVAR____TtC16IntelligentLight13ModuleManager_sceneModule];
  Swift::String v12 = v8;
  uint64_t v13 = v11;
  sub_10000D7E4((uint64_t)v12, v13);

  objc_msgSend(*(id *)(*(void *)&v4[v5] + OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayMonitor), "addObserver:");
  os_log_type_t v14 = *(void **)&v4[v6];
  id v15 = objc_allocWithZone((Class)SRUIFAudioPowerLevelUpdater);
  uint64_t v16 = v14;
  id v17 = [v15 initWithDelegate:v16];
  uint64_t v18 = *(void **)&v16[OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_audioPowerUpdater];
  *(void *)&v16[OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_audioPowerUpdater] = v17;

  id v19 = *(char **)&v8[v10];
  id v20 = *(void **)&v19[OBJC_IVAR____TtC16IntelligentLight16LightLayerModule_displayMonitor];
  id v21 = v19;
  [v20 addObserver:v21];

  return v12;
}

uint64_t sub_10000D0CC@<X0>(uint64_t a1@<X2>, char *a2@<X8>)
{
  uint64_t v56 = type metadata accessor for Optional();
  uint64_t v54 = *(void *)(v56 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v52 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  os_log_type_t v53 = (char *)&v48 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  objc_super v11 = (char *)&v48 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  os_log_type_t v14 = (char *)&v48 - v13;
  uint64_t v15 = *(void *)(a1 - 8);
  uint64_t v16 = __chkstk_darwin(v12);
  id v50 = (char *)&v48 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  Swift::String v51 = (char *)&v48 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  id v22 = (char *)&v48 - v21;
  __chkstk_darwin(v20);
  id v24 = (char *)&v48 - v23;
  uint64_t v55 = v2;
  v57 = *(void **)(v2 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_lightLayerModule);
  id v25 = v57;
  type metadata accessor for LightLayerModule();
  id v26 = v25;
  int v27 = swift_dynamicCast();
  long long v28 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  if (v27)
  {
    v28(v14, 0, 1, a1);
    long long v29 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v29(v24, v14, a1);
    v29(a2, v24, a1);
  }
  else
  {
    id v49 = a2;
    v28(v14, 1, 1, a1);
    id v30 = *(void (**)(char *, uint64_t))(v54 + 8);
    v30(v14, v56);
    v57 = *(void **)(v55 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_audioPowerModule);
    char v31 = v57;
    type metadata accessor for AudioPowerModule();
    id v32 = v31;
    if (swift_dynamicCast())
    {
      v28(v11, 0, 1, a1);
      id v33 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
      v33(v22, v11, a1);
      a2 = v49;
      v33(v49, v22, a1);
    }
    else
    {
      v28(v11, 1, 1, a1);
      id v34 = v30;
      v30(v11, v56);
      v57 = *(void **)(v55 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_noiseLayerModule);
      uint64_t v35 = v57;
      type metadata accessor for NoiseLayerModule();
      id v36 = v35;
      long long v37 = v53;
      if (swift_dynamicCast())
      {
        v28(v37, 0, 1, a1);
        long long v38 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
        long long v39 = v51;
        v38(v51, v37, a1);
        a2 = v49;
        v38(v49, v39, a1);
      }
      else
      {
        v28(v37, 1, 1, a1);
        v34(v37, v56);
        v57 = *(void **)(v55 + OBJC_IVAR____TtC16IntelligentLight13ModuleManager_sceneModule);
        Swift::String v40 = v57;
        type metadata accessor for SceneModule();
        id v41 = v40;
        os_log_type_t v42 = v52;
        int v43 = swift_dynamicCast();
        a2 = v49;
        if (!v43)
        {
          uint64_t v46 = 1;
          v28(v42, 1, 1, a1);
          v34(v42, v56);
          return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v28)(a2, v46, 1, a1);
        }
        v28(v42, 0, 1, a1);
        id v44 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
        id v45 = v50;
        v44(v50, v42, a1);
        v44(a2, v45, a1);
      }
    }
  }
  uint64_t v46 = 0;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v28)(a2, v46, 1, a1);
}

id sub_10000D620()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ModuleManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for ModuleManager()
{
  return self;
}

void sub_10000D6E8(uint64_t a1, char *a2)
{
  void (*v8)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  char *v9;
  void v10[5];
  void *v11;

  id v3 = &a2[OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_moduleAccessor];
  *(void *)&a2[OBJC_IVAR____TtC16IntelligentLight16AudioPowerModule_moduleAccessor + 8] = &off_100014C28;
  swift_unknownObjectWeakAssign();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v10[3] = type metadata accessor for AudioPowerModule();
    v10[4] = &off_100014B10;
    v10[0] = a2;
    uint64_t v7 = type metadata accessor for LightLayerModule();
    uint64_t v8 = *(void (**)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 8);
    uint64_t v9 = a2;
    v8(&v11, v10, v7, v7, ObjectType, v5);

    sub_10000876C((uint64_t)v10);
    uint64_t Strong = v11;
  }
  swift_unknownObjectWeakAssign();
}

void sub_10000D7E4(uint64_t a1, char *a2)
{
  void (*v9)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t);
  char *v18;
  uint64_t v19;
  void *v20;
  void v21[3];
  uint64_t v22;
  char **v23;
  void *v24;

  uint64_t ObjectType = swift_getObjectType();
  uint64_t v4 = &a2[OBJC_IVAR____TtC16IntelligentLight11SceneModule_moduleAccessor];
  *(void *)&a2[OBJC_IVAR____TtC16IntelligentLight11SceneModule_moduleAccessor + 8] = &off_100014C28;
  swift_unknownObjectWeakAssign();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = *((void *)v4 + 1);
    uint64_t v7 = swift_getObjectType();
    id v22 = ObjectType;
    uint64_t v23 = &off_100014AE8;
    v21[0] = a2;
    uint64_t v8 = type metadata accessor for LightLayerModule();
    uint64_t v9 = *(void (**)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 8);
    uint64_t v10 = a2;
    v9(&v24, v21, v8, v8, v7, v6);

    sub_10000876C((uint64_t)v21);
    uint64_t Strong = v24;
  }
  swift_unknownObjectWeakAssign();

  objc_super v11 = swift_unknownObjectWeakLoadStrong();
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    sub_10000A6A4(1);
  }
  uint64_t v13 = (void *)swift_unknownObjectWeakLoadStrong();
  if (v13)
  {
    os_log_type_t v14 = *((void *)v4 + 1);
    uint64_t v15 = swift_getObjectType();
    id v22 = ObjectType;
    uint64_t v23 = &off_100014AE8;
    v21[0] = a2;
    uint64_t v16 = type metadata accessor for NoiseLayerModule();
    uint64_t v17 = *(void (**)(void **__return_ptr, void *, uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 8);
    uint64_t v18 = a2;
    v17(&v24, v21, v16, v16, v15, v14);

    sub_10000876C((uint64_t)v21);
    uint64_t v13 = v24;
  }
  swift_unknownObjectWeakAssign();

  uint64_t v19 = swift_unknownObjectWeakLoadStrong();
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    sub_10000A6A4(1);
  }
}

IntelligentLight::IntelligentLightErrors_optional __swiftcall IntelligentLightErrors.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)rawValue >= 3) {
    LOBYTE(rawValue) = 3;
  }
  return (IntelligentLight::IntelligentLightErrors_optional)rawValue;
}

uint64_t IntelligentLightErrors.rawValue.getter(uint64_t result)
{
  return result;
}

BOOL sub_10000D9D8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_10000D9F0()
{
  unint64_t result = qword_10001AA98;
  if (!qword_10001AA98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001AA98);
  }
  return result;
}

Swift::Int sub_10000DA44()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000DA8C()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000DAB8()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t *sub_10000DAFC@<X0>(uint64_t *result@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v2 = *result;
  if ((unint64_t)*result >= 3) {
    LOBYTE(v2) = 3;
  }
  *a2 = v2;
  return result;
}

void sub_10000DB14(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10000DB24(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10000DD34();
  unint64_t v5 = sub_10000DD88();

  return Error<>._code.getter(a1, a2, v4, v5);
}

unsigned char *initializeBufferWithCopyOfBuffer for IntelligentLightErrors(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IntelligentLightErrors(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for IntelligentLightErrors(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x10000DCECLL);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

uint64_t sub_10000DD14(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000DD1C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for IntelligentLightErrors()
{
  return &type metadata for IntelligentLightErrors;
}

unint64_t sub_10000DD34()
{
  unint64_t result = qword_10001AAA0;
  if (!qword_10001AAA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001AAA0);
  }
  return result;
}

unint64_t sub_10000DD88()
{
  unint64_t result = qword_10001AAA8;
  if (!qword_10001AAA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001AAA8);
  }
  return result;
}

id sub_10000DE94()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriLightHostView();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriLightHostView()
{
  return self;
}

unint64_t sub_10000DEEC()
{
  unint64_t result = qword_10001AAD8;
  if (!qword_10001AAD8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001AAD8);
  }
  return result;
}

id sub_10000DF2C(void *a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  v38.receiver = v6;
  v38.super_class = (Class)type metadata accessor for SiriLightHostView();
  id v13 = objc_msgSendSuper2(&v38, "initWithFrame:", a3, a4, a5, a6);
  id v14 = [v13 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() setSequestered:1];

  id v15 = [v13 layer];
  self;
  [(id)swift_dynamicCastObjCClassUnconditional() setTransformsToScreenSpace:1];

  sub_10000E3A4(a2, (uint64_t)v40);
  uint64_t v16 = *(void *)&v41;
  if (v41 == 0.0)
  {
    sub_10000E40C((uint64_t)v40);
  }
  else
  {
    double v17 = v42;
    sub_10000E46C(v40, *(uint64_t *)&v41);
    (*(void (**)(void *__return_ptr, void *, uint64_t, double))(*(void *)&v17 + 8))(v39, a1, v16, COERCE_DOUBLE(*(void *)&v17));
    sub_100006C58((uint64_t)v40);
    sub_10000B53C((uint64_t)v39, (uint64_t)v40);
    uint64_t v18 = (void *)v40[0];
    if (v40[0])
    {
      uint64_t v19 = (void *)v40[1];
      double v20 = *(double *)&v40[2];
      double v21 = v41;
      double v22 = v42;
      double v23 = v43;
      _StringGuts.grow(_:)(49);
      v24._countAndFlagsBits = 0xD000000000000029;
      v24._object = (void *)0x8000000100011C20;
      String.append(_:)(v24);
      id v25 = [a1 description];
      uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      long long v28 = v27;

      v29._countAndFlagsBits = v26;
      v29._object = v28;
      String.append(_:)(v29);
      swift_bridgeObjectRelease();
      v30._countAndFlagsBits = 544175136;
      v30._object = (void *)0xE400000000000000;
      String.append(_:)(v30);
      type metadata accessor for CGRect(0);
      _print_unlocked<A, B>(_:_:)();
      if (qword_10001A410 != -1) {
        swift_once();
      }
      uint64_t v31 = type metadata accessor for Logger();
      sub_1000045BC(v31, (uint64_t)qword_10001A630);
      os_log_type_t v32 = static os_log_type_t.info.getter();
      sub_100005134(v32, 1, 0xD00000000000002CLL, 0x8000000100011BF0, 0, 0xE000000000000000);
      swift_bridgeObjectRelease();
      objc_msgSend(v18, "setFrame:", v20, v21, v22, v23);
      id v33 = [v13 layer];
      self;
      objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), "setContextId:", objc_msgSend(v19, "contextId"));

      goto LABEL_10;
    }
  }
  v34._countAndFlagsBits = 0x203A726F727245;
  v34._object = (void *)0xE700000000000000;
  String.append(_:)(v34);
  _print_unlocked<A, B>(_:_:)();
  if (qword_10001A410 != -1) {
    swift_once();
  }
  uint64_t v35 = type metadata accessor for Logger();
  sub_1000045BC(v35, (uint64_t)qword_10001A630);
  os_log_type_t v36 = static os_log_type_t.error.getter();
  sub_100005134(v36, 1, 0xD00000000000002CLL, 0x8000000100011BF0, 0, 0xE000000000000000);

  swift_bridgeObjectRelease();
LABEL_10:

  sub_10000E40C(a2);
  return v13;
}

uint64_t sub_10000E3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D04((uint64_t *)&unk_10001AAE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000E40C(uint64_t a1)
{
  uint64_t v2 = sub_100006D04((uint64_t *)&unk_10001AAE0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_10000E46C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Logger.init(_:)()
{
  return Logger.init(_:)();
}

uint64_t type metadata accessor for _UIIntelligenceLightSourceConfiguration()
{
  return type metadata accessor for _UIIntelligenceLightSourceConfiguration();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
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

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
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

uint64_t static UISceneSessionRole.intelligenceLight.getter()
{
  return static UISceneSessionRole.intelligenceLight.getter();
}

uint64_t static UISceneSessionRole.intelligenceNoise.getter()
{
  return static UISceneSessionRole.intelligenceNoise.getter();
}

uint64_t UISceneConnectionOptions.prefersAudioReactivity.getter()
{
  return UISceneConnectionOptions.prefersAudioReactivity.getter();
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

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
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

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
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

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

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

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
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