uint64_t sub_100004044()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger();
  sub_100006300(v0, qword_1000270C8);
  sub_1000062C8(v0, (uint64_t)qword_1000270C8);
  return Logger.init(subsystem:category:)();
}

id sub_1000040C0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super init];
}

uint64_t sub_100004118(uint64_t a1, uint64_t a2)
{
  if (qword_100026670 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_1000062C8(v3, (uint64_t)qword_1000270C8);
  swift_bridgeObjectRetain_n();
  v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 67109379;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v6 + 8) = 2113;
    if (!a2) {
      Dictionary.init(dictionaryLiteral:)();
    }
    swift_bridgeObjectRetain();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v7 = isa;
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "applicationDidFinishLaunching: suspended=%{BOOL}d, options=%{private}@", (uint8_t *)v6, 0x12u);
    sub_10000646C(&qword_100026830);
    swift_arrayDestroy();
    sub_100006AFC();
    sub_100006AFC();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return SidecarRegisterServicePresenter();
}

uint64_t sub_100004334()
{
  if (qword_100026678 != -1) {
    swift_once();
  }
  return 1;
}

uint64_t sub_100004438(uint64_t a1, uint64_t a2)
{
  if (a2) {
    uint64_t v2 = sub_100004484(a2);
  }
  else {
    uint64_t v2 = 0;
  }
  sub_100004118(0, v2);
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_100004484(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_10000646C(&qword_100026828);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
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
    v15 = *(void **)(*(void *)(a1 + 48) + 8 * v10);
    sub_100006728(*(void *)(a1 + 56) + 32 * v10, (uint64_t)v39 + 8);
    *(void *)&v39[0] = v15;
    v37[0] = v39[0];
    v37[1] = v39[1];
    uint64_t v38 = v40;
    *(void *)&v36[0] = v15;
    type metadata accessor for LaunchOptionsKey(0);
    id v16 = v15;
    swift_dynamicCast();
    sub_100006718((_OWORD *)((char *)v37 + 8), v31);
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_100006718(v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_100006718(v35, v36);
    sub_100006718(v36, &v32);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v17 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v18 = result & ~v17;
    unint64_t v19 = v18 >> 6;
    if (((-1 << v18) & ~*(void *)&v6[8 * (v18 >> 6)]) == 0)
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v17) >> 6;
      while (++v19 != v22 || (v21 & 1) == 0)
      {
        BOOL v23 = v19 == v22;
        if (v19 == v22) {
          unint64_t v19 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)&v6[8 * v19];
        if (v24 != -1)
        {
          unint64_t v20 = __clz(__rbit64(~v24)) + (v19 << 6);
          goto LABEL_34;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    unint64_t v20 = __clz(__rbit64((-1 << v18) & ~*(void *)&v6[8 * (v18 >> 6)])) | v18 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(void *)&v6[(v20 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v20;
    uint64_t v25 = v2[6] + 40 * v20;
    *(_OWORD *)uint64_t v25 = v28;
    *(_OWORD *)(v25 + 16) = v29;
    *(void *)(v25 + 32) = v30;
    uint64_t result = (uint64_t)sub_100006718(&v32, (_OWORD *)(v2[7] + 32 * v20));
    ++v2[2];
    if (v5) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v11 = v8 + 1;
    if (__OFADD__(v8, 1)) {
      goto LABEL_38;
    }
    if (v11 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v11);
    int64_t v13 = v8 + 1;
    if (!v12)
    {
      int64_t v13 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_36;
      }
      unint64_t v12 = *(void *)(v27 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_36;
        }
        unint64_t v12 = *(void *)(v27 + 8 * v13);
        if (!v12)
        {
          int64_t v13 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_36;
          }
          unint64_t v12 = *(void *)(v27 + 8 * v13);
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
  if (v8 + 5 >= v26)
  {
LABEL_36:
    swift_release();
    sub_100006798();
    return (uint64_t)v2;
  }
  unint64_t v12 = *(void *)(v27 + 8 * v14);
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
    if (v13 >= v26) {
      goto LABEL_36;
    }
    unint64_t v12 = *(void *)(v27 + 8 * v13);
    ++v14;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_100004910()
{
  if (qword_100026678 != -1) {
    swift_once();
  }
  *(unsigned char *)(qword_1000270E0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_inBackground) = 1;
  sub_100007F60();
}

void sub_1000049D4()
{
  if (qword_100026678 != -1) {
    swift_once();
  }
  *(unsigned char *)(qword_1000270E0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_inBackground) = 0;
  sub_100007F60();
}

uint64_t sub_100004A90()
{
  if (qword_100026670 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000062C8(v0, (uint64_t)qword_1000270C8);
  v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    sub_100006ADC((void *)&_mh_execute_header, v3, v4, "=== Application Will Terminate ===");
    sub_100006AFC();
  }

  if (qword_100026678 != -1) {
    swift_once();
  }
  return sub_10000ED4C();
}

id sub_100004BE0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

uint64_t sub_100004C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for DispatchWorkItemFlags();
  sub_100006A48();
  __chkstk_darwin(v9);
  uint64_t v21 = sub_100006A64();
  sub_100006A48();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_100006AC4();
  sub_1000065E4(0, (unint64_t *)&qword_1000267F8);
  int64_t v13 = (void *)static OS_dispatch_queue.main.getter();
  int64_t v14 = (void *)swift_allocObject();
  v14[2] = v4;
  v14[3] = a1;
  v14[4] = a2;
  v14[5] = a3;
  v14[6] = a4;
  aBlock[4] = sub_1000065D4;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100015900;
  aBlock[3] = &unk_100020B08;
  v15 = _Block_copy(aBlock);
  id v16 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000067A0((unint64_t *)&qword_100026800, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000646C(&qword_100026808);
  sub_1000064B0();
  sub_100006AA8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v15);

  uint64_t v17 = sub_100006A8C();
  v18(v17);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(v5, v21);
}

void sub_100004E64(uint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v33 = a2;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100026670 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_1000062C8(v8, (uint64_t)qword_1000270C8);
  swift_bridgeObjectRetain_n();
  long long v32 = (void (*)(void))v12;
  int64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v30 = v11;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v31 = a5;
    id v16 = (uint8_t *)v15;
    uint64_t v35 = swift_slowAlloc();
    *(_DWORD *)id v16 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v34 = sub_100016C28(v33, a3, &v35);
    uint64_t v11 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "=== Starting Service Extension '%{public}s' ===", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a5 = v31;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (qword_100026678 != -1) {
    swift_once();
  }
  uint64_t v17 = v33;
  sub_1000086C8();
  if (v18)
  {
    uint64_t v19 = v18;
    swift_bridgeObjectRetain_n();
    unint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      long long v32 = a4;
      unint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      *(_DWORD *)unint64_t v22 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v34 = sub_100016C28(v17, a3, &v35);
      a4 = v32;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "=== Activating Service Extension '%{public}s' ===", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_100008A00(v19, (uint64_t)a4, a5);
    swift_release();
  }
  else
  {
    sub_1000065E4(0, &qword_100026818);
    uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v25 = sub_100005C6C(v23, v24, -103, 0, 0, 0);
    uint64_t v26 = (*(uint64_t (**)(char *, void (*)(void), uint64_t))(v9 + 16))(v11, v32, v8);
    uint64_t v27 = __chkstk_darwin(v26);
    __chkstk_darwin(v27);
    sub_100006FD0(sub_100006620, v28, (void (*)(void))sub_100006628);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    id v29 = v25;
    a4(v25);
  }
}

uint64_t sub_10000539C(uint64_t a1, void *a2)
{
  uint64_t v8 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  v4._object = (void *)0x800000010001ACC0;
  v4._countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v4);
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  String.append(_:)(v5);
  v6._countAndFlagsBits = 0x64656C6961462027;
  v6._object = (void *)0xEC0000003D3D3D20;
  String.append(_:)(v6);
  return v8;
}

void sub_1000054F0(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v3 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);
}

uint64_t sub_100005554(uint64_t a1)
{
  type metadata accessor for DispatchWorkItemFlags();
  sub_100006A48();
  uint64_t v23 = v3;
  __chkstk_darwin(v4);
  sub_100006A64();
  sub_100006A48();
  uint64_t v21 = v6;
  uint64_t v22 = v5;
  __chkstk_darwin(v5);
  sub_100006AC4();
  uint64_t v7 = type metadata accessor for UUID();
  sub_100006A48();
  uint64_t v9 = v8;
  uint64_t v11 = *(void *)(v10 + 64);
  __chkstk_darwin(v12);
  sub_1000065E4(0, (unint64_t *)&qword_1000267F8);
  int64_t v13 = (void *)static OS_dispatch_queue.main.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  unint64_t v14 = (*(unsigned __int8 *)(v9 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  uint64_t v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v15 + v14, (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  aBlock[4] = sub_1000063F4;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100015900;
  aBlock[3] = &unk_100020A90;
  id v16 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000067A0((unint64_t *)&qword_100026800, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000646C(&qword_100026808);
  sub_1000064B0();
  sub_100006AA8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);

  uint64_t v17 = sub_100006A8C();
  v18(v17);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 8))(v1, v22);
}

void sub_100005800()
{
  if (qword_100026678 != -1) {
    swift_once();
  }
  sub_10000A748();
}

id sub_100005948()
{
  if (qword_100026670 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000062C8(v0, (uint64_t)qword_1000270C8);
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    *(_WORD *)swift_slowAlloc() = 0;
    sub_100006ADC((void *)&_mh_execute_header, v3, v4, "=== Terminate (from Relay) ===");
    sub_100006AFC();
  }

  if (qword_100026678 != -1) {
    swift_once();
  }
  return sub_10000AC14(0);
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

void type metadata accessor for SidecarCompletionAnimation(uint64_t a1)
{
}

void type metadata accessor for UIBackgroundStyle(uint64_t a1)
{
}

void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
}

void type metadata accessor for UIDeviceOrientation(uint64_t a1)
{
}

uint64_t sub_100005B54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_100006718((_OWORD *)a1, v6);
    sub_100012EA8(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000066B8(a1);
    sub_100012C1C(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_1000066B8((uint64_t)v6);
  }
}

uint64_t sub_100005BD8()
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

BOOL sub_100005C60(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

id sub_100005C6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = Dictionary.init(dictionaryLiteral:)();
  if (a5)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v23 = &type metadata for String;
    v22[0] = a4;
    v22[1] = a5;
    sub_100005B54((uint64_t)v22, v10, v11);
  }
  if (a6)
  {
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v13;
    swift_getErrorValue();
    uint64_t v23 = v21;
    uint64_t v15 = sub_100006654(v22);
    (*(void (**)(uint64_t *))(*((void *)v21 - 1) + 16))(v15);
    sub_100005B54((uint64_t)v22, v12, v14);
  }
  id v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v19 = [v16 initWithDomain:v17 code:a3 userInfo:isa];

  swift_errorRelease();
  return v19;
}

uint64_t sub_100005E3C()
{
  return sub_100005F74(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005E6C()
{
  return sub_100005E74();
}

uint64_t sub_100005E74()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005EC8()
{
  return sub_100005ED0();
}

Swift::Int sub_100005ED0()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100005F44()
{
  return sub_100005F74(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005F74(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_100005FB8(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100006034(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_1000060B4@<X0>(void *a1@<X8>)
{
  NSString result = sub_1000060DC();
  *a1 = result;
  return result;
}

NSString sub_1000060DC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v0 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v0;
}

BOOL sub_100006114(uint64_t *a1, uint64_t *a2)
{
  return sub_100005C60(*a1, *a2);
}

void sub_100006120(uint64_t a1@<X8>)
{
  sub_100006154();
  *(void *)a1 = v2;
  *(unsigned char *)(a1 + 8) = v3 & 1;
}

uint64_t sub_10000615C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_100006188()
{
  return sub_100005BD8();
}

uint64_t sub_100006194@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000061DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000620C(uint64_t a1)
{
  uint64_t v2 = sub_1000067A0(&qword_100026838, type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_1000067A0(&qword_100026868, type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000062C8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100006300(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006364()
{
  uint64_t v1 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_1000063F4()
{
  type metadata accessor for UUID();

  sub_100005800();
}

uint64_t sub_100006454(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100006464()
{
  return swift_release();
}

uint64_t sub_10000646C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000064B0()
{
  unint64_t result = qword_100026810;
  if (!qword_100026810)
  {
    sub_100006504(&qword_100026808);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026810);
  }
  return result;
}

uint64_t sub_100006504(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000654C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100006584(uint64_t a1)
{
  sub_1000054F0(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000658C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_1000065D4()
{
  sub_100004E64(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(void (**)(void))(v0 + 40), *(void *)(v0 + 48));
}

uint64_t sub_1000065E4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100006620()
{
  return sub_10000539C(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100006628()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_errorRetain();
  return v1;
}

uint64_t *sub_100006654(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000066B8(uint64_t a1)
{
  uint64_t v2 = sub_10000646C(&qword_100026820);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_100006718(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006728(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

uint64_t sub_100006798()
{
  return swift_release();
}

uint64_t sub_1000067A0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000067E8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_100006820(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000682C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000684C(uint64_t result, int a2, int a3)
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

uint64_t sub_10000688C()
{
  return sub_1000067A0(&qword_100026850, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_1000068D4()
{
  return sub_1000067A0(&qword_100026858, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_10000691C()
{
  return sub_1000067A0(&qword_100026860, type metadata accessor for LaunchOptionsKey);
}

__n128 sub_100006964(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100006970(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100006990(uint64_t result, int a2, int a3)
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

void sub_1000069E0(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100006A64()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100006A8C()
{
  return v0;
}

uint64_t sub_100006AA8()
{
  return v0 - 128;
}

void sub_100006ADC(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_100006AFC()
{
  return swift_slowDealloc();
}

uint64_t sub_100006B18(uint64_t (*a1)(void))
{
  uint64_t v2 = (void *)_convertErrorToNSError(_:)();
  id v3 = [v2 localizedDescription];
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;

  uint64_t v7 = a1();
  if (v8)
  {
    uint64_t v9 = v7;
    unint64_t v10 = v8;
    id v11 = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136446979;
      swift_bridgeObjectRetain();
      sub_100016C28(v9, v10, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v14 + 12) = 2082;
      id v15 = [v11 domain];
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v18 = v17;

      sub_100016C28(v16, v18, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v14 + 22) = 2048;
      [v11 code];

      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v14 + 32) = 2081;
      swift_bridgeObjectRetain();
      sub_100016C28(v4, v6, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%{public}s: %{public}s (%ld) %{private}s", (uint8_t *)v14, 0x2Au);
      swift_arrayDestroy();
LABEL_6:
      sub_100006AFC();
      sub_100006AFC();

      return swift_errorRelease();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    id v11 = v2;
    swift_bridgeObjectRetain();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v19))
    {
      uint64_t v20 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136446723;
      uint64_t v26 = v4;
      id v21 = [v11 domain];
      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v24 = v23;

      sub_100016C28(v22, v24, &v27);
      sub_1000074D8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v20 + 12) = 2048;
      [v11 code];

      sub_1000074D8();
      *(_WORD *)(v20 + 22) = 2081;
      swift_bridgeObjectRetain();
      sub_100016C28(v26, v6, &v27);
      sub_1000074D8();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v12, v19, "%{public}s (%ld) %{private}s", (uint8_t *)v20, 0x20u);
      swift_arrayDestroy();
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease_n();

  return swift_errorRelease();
}

void sub_100006FD0(uint64_t (*a1)(void), uint64_t a2, void (*a3)(void))
{
  a3();
  uint64_t v4 = (void *)_convertErrorToNSError(_:)();
  swift_errorRelease();
  id v5 = [v4 localizedDescription];
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  uint64_t v9 = a1();
  if (v10)
  {
    uint64_t v11 = v9;
    unint64_t v12 = v10;
    id v27 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    os_log_type_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v15 = 136446979;
      swift_bridgeObjectRetain();
      sub_100016C28(v11, v12, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 12) = 2082;
      id v16 = [v27 domain];
      uint64_t v17 = v6;
      uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v20 = v19;

      sub_100016C28(v18, v20, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      *(_WORD *)(v15 + 22) = 2048;
      [v27 code];

      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v15 + 32) = 2081;
      swift_bridgeObjectRetain();
      sub_100016C28(v17, v8, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}s: %{public}s (%ld) %{private}s", (uint8_t *)v15, 0x2Au);
      swift_arrayDestroy();
LABEL_6:
      sub_100006AFC();
      sub_100006AFC();

      return;
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    id v27 = v4;
    swift_bridgeObjectRetain();
    os_log_type_t v13 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v21))
    {
      uint64_t v22 = swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136446723;
      id v23 = [v27 domain];
      uint64_t v24 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v26 = v25;

      sub_100016C28(v24, v26, &v28);
      sub_1000074BC();

      swift_bridgeObjectRelease();
      *(_WORD *)(v22 + 12) = 2048;
      [v27 code];

      sub_1000074BC();
      *(_WORD *)(v22 + 22) = 2081;
      swift_bridgeObjectRetain();
      sub_100016C28(v6, v8, &v28);
      sub_1000074BC();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v13, v21, "%{public}s (%ld) %{private}s", (uint8_t *)v22, 0x20u);
      swift_arrayDestroy();
      goto LABEL_6;
    }
  }
  swift_bridgeObjectRelease_n();
}

uint64_t sub_1000074BC()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000074D8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000074F4()
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_100026678 != -1) {
      swift_once();
    }
    sub_10000AEDC();
    return swift_release();
  }
  return result;
}

id sub_100007624(void *a1)
{
  id v1 = [self interfaceWithProtocol:*a1];

  return v1;
}

id sub_1000076AC(uint64_t a1, uint64_t a2, void *a3)
{
  swift_weakInit();
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for HostRemoteViewController();
  [super initWithNibName:v6 bundle:a3];

  return v7;
}

id sub_1000077AC(void *a1)
{
  swift_weakInit();
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for HostRemoteViewController();
  [super initWithCoder:a1];

  return v3;
}

id sub_100007838()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for HostRemoteViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for HostRemoteViewController()
{
  return self;
}

void sub_1000078A0(uint64_t a1, uint64_t a2, void (**a3)(void))
{
  if (swift_weakLoadStrong())
  {
    _Block_copy(a3);
    if (qword_100026678 != -1) {
      swift_once();
    }
    _Block_copy(a3);
    sub_10000C1B8();
    swift_release();
    _Block_release(a3);
  }
  else
  {
    a3[2](a3);
  }

  _Block_release(a3);
}

uint64_t sub_1000079F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_1000079FC(char a1)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    if (qword_100026678 != -1) {
      swift_once();
    }
    *(unsigned char *)(v3 + 64) = a1 & 1;
    sub_10000D7AC();
    return swift_release();
  }
  return result;
}

uint64_t sub_100007AF8(uint64_t a1)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    if (qword_100026678 != -1) {
      swift_once();
    }
    *(void *)(v3 + 72) = a1;
    sub_10000D860();
    return swift_release();
  }
  return result;
}

uint64_t sub_100007BF0()
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v1 = result;
    if (qword_100026678 != -1) {
      swift_once();
    }
    sub_10000EFA0(v1);
    return swift_release();
  }
  return result;
}

uint64_t sub_100007CCC(char a1)
{
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    uint64_t v3 = result;
    if (qword_100026678 != -1) {
      swift_once();
    }
    sub_10000F094(v3, a1 & 1);
    return swift_release();
  }
  return result;
}

id sub_100007E14()
{
  v8.receiver = v0;
  v8.super_class = (Class)sub_1000158A0();
  return sub_1000156FC((uint64_t)v8.super_class, "initWithFrame:", v1, v2, v3, v4, v5, v6, v8);
}

id sub_100007EB4()
{
  v8.receiver = v0;
  v8.super_class = (Class)sub_1000158A0();
  return sub_1000156FC((uint64_t)v8.super_class, "initWithContentRect:", v1, v2, v3, v4, v5, v6, v8);
}

id sub_100007F18(uint64_t a1)
{
  return sub_100012030(a1, type metadata accessor for SecureWindow);
}

id sub_100007F30()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for ServiceManager()) init];
  qword_1000270E0 = (uint64_t)result;
  return result;
}

void sub_100007F60()
{
  uint64_t v2 = v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions;
  sub_100015414();
  sub_100015888();
  if (v3)
  {
    sub_1000155C0();
    uint64_t v1 = _CocoaArrayWrapper.endIndex.getter();
    if (v1) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    return;
  }
  sub_1000156AC();
  if (!v1) {
    goto LABEL_10;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    uint64_t v1 = sub_1000157D4();
  }
  else
  {
    sub_10001587C();
    if (!v4)
    {
      __break(1u);
      return;
    }
    sub_100015858();
  }
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(v1 + 56);
  id v6 = v5;
  swift_release();
  if (v5)
  {
    id v7 = [v6 serviceViewControllerProxy];

    swift_unknownObjectRelease();
    if (v7)
    {
      [v7 sidecarServiceSetBackgrounded:*(unsigned __int8 *)(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_inBackground)];
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_100008074(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__secureScreen) = a1;
  return _objc_release_x1();
}

id sub_100008088()
{
  uint64_t v1 = OBJC_IVAR____TtC7Sidecar14ServiceManager____lazy_storage____showDebugColors;
  int v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager____lazy_storage____showDebugColors);
  if (v2 != 2) {
    return (id)(v2 & 1);
  }
  id v3 = [self standardUserDefaults];
  NSString v4 = String._bridgeToObjectiveC()();
  uint64_t v5 = (void *)sub_10001582C();
  id v7 = [v5 v6];

  *(unsigned char *)(v0 + v1) = (_BYTE)v7;
  return v7;
}

uint64_t sub_10000813C()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100006300(v0, qword_1000270E8);
  sub_1000062C8(v0, (uint64_t)qword_1000270E8);
  return Logger.init(subsystem:category:)();
}

char *sub_1000081B8()
{
  v0[OBJC_IVAR____TtC7Sidecar14ServiceManager_inBackground] = 0;
  *(void *)&v0[OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions] = &_swiftEmptyArrayStorage;
  *(void *)&v0[OBJC_IVAR____TtC7Sidecar14ServiceManager__secureScreen] = 0;
  uint64_t v1 = OBJC_IVAR____TtC7Sidecar14ServiceManager__baseViewController;
  type metadata accessor for ColorUIViewController();
  id v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v3 = v0;
  *(void *)&v0[v1] = [v2 init];
  v3[OBJC_IVAR____TtC7Sidecar14ServiceManager____lazy_storage____showDebugColors] = 2;
  *(void *)&v3[OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices] = &_swiftEmptyDictionarySingleton;
  *(void *)&v3[OBJC_IVAR____TtC7Sidecar14ServiceManager_readyServiceUUIDs] = &_swiftEmptySetSingleton;
  v3[OBJC_IVAR____TtC7Sidecar14ServiceManager__wantsVolumeButtonEvents] = 0;
  *(void *)&v3[OBJC_IVAR____TtC7Sidecar14ServiceManager__backgroundStyle] = 0;
  NSString v4 = &v3[OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig];
  v4[1] = 0;
  v4[2] = 0;
  void *v4 = 0;
  id v5 = [self mainScreen];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v14 = [objc_allocWithZone((Class)type metadata accessor for SecureWindow()) initWithFrame:v7, v9, v11, v13];
  *(void *)&v3[OBJC_IVAR____TtC7Sidecar14ServiceManager_window] = v14;
  [v14 setHidden:0];
  id v15 = [objc_allocWithZone((Class)type metadata accessor for ServiceNavigationController()) initWithRootViewController:*(void *)&v0[v1]];
  *(void *)&v3[OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController] = v15;
  id v16 = [v15 navigationBar];
  [v16 setHidden:1];

  id v17 = [self currentDevice];
  [v17 beginGeneratingDeviceOrientationNotifications];

  v50.receiver = v3;
  v50.super_class = (Class)type metadata accessor for ServiceManager();
  uint64_t v18 = (char *)[super init];
  unint64_t v19 = *(void **)&v18[OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController];
  unint64_t v20 = v18;
  [v19 setDelegate:v20];
  id v21 = [self defaultCenter];
  uint64_t v22 = OBJC_IVAR____TtC7Sidecar14ServiceManager_window;
  [*(id *)&v20[OBJC_IVAR____TtC7Sidecar14ServiceManager_window] setRootViewController:v19];
  if ((sub_100008088() & 1) == 0) {
    goto LABEL_4;
  }
  id result = (char *)[*(id *)&v20[OBJC_IVAR____TtC7Sidecar14ServiceManager__baseViewController] view];
  if (result)
  {
    uint64_t v24 = result;
    id v25 = [self greenColor];
    unint64_t v26 = (void *)sub_10001582C();
    [v26 v27];

LABEL_4:
    id v28 = [*(id *)&v20[v22] makeKeyAndVisible];
    id v31 = sub_100015760((uint64_t)v28, v29, v30, (uint64_t)"_screenDidConnectWithNote:", (uint64_t)UIScreenDidConnectNotification);
    id v34 = sub_100015760((uint64_t)v31, v32, v33, (uint64_t)"_screenDidDisconnectWithNote:", (uint64_t)UIScreenDidDisconnectNotification);
    id v38 = sub_100015460((uint64_t)v34, v35, v36, v37, _UIApplicationVolumeDownButtonDownNotification);
    id v42 = sub_100015460((uint64_t)v38, v39, v40, v41, _UIApplicationVolumeDownButtonUpNotification);
    id v46 = sub_100015460((uint64_t)v42, v43, v44, v45, _UIApplicationVolumeUpButtonDownNotification);
    sub_100015460((uint64_t)v46, v47, v48, v49, _UIApplicationVolumeUpButtonUpNotification);

    return v20;
  }
  __break(1u);
  return result;
}

id sub_100008578()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for ServiceManager();
  return [super dealloc];
}

void sub_1000086C8()
{
  sub_1000153FC();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = type metadata accessor for Logger();
  sub_100006A48();
  __chkstk_darwin();
  sub_100015584();
  uint64_t v7 = v6 - v5;
  sub_1000065E4(0, &qword_100026D90);
  swift_bridgeObjectRetain();
  id v8 = sub_10000891C(v3, v1);
  double v9 = v8;
  if (v8)
  {
    if (qword_100026680 != -1) {
      swift_once();
    }
    sub_1000062C8(v4, (uint64_t)qword_1000270E8);
    sub_100015720();
    v10();
    type metadata accessor for ServiceExtension();
    swift_allocObject();
    id v11 = v9;
    uint64_t v12 = sub_100015944(v7, v11);
    swift_retain();
    double v13 = (void *)Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.default.getter();
    if (sub_1000155E0(v14))
    {
      id v15 = (_DWORD *)sub_10001556C();
      uint64_t v20 = sub_10001553C();
      _DWORD *v15 = 136446210;
      uint64_t v16 = *(void *)(v12 + 16);
      unint64_t v17 = *(void *)(v12 + 24);
      swift_bridgeObjectRetain();
      sub_100016C28(v16, v17, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      sub_1000158C0((void *)&_mh_execute_header, v18, v19, "Found Service Extension '%{public}s'");
      swift_arrayDestroy();
      sub_100006AFC();
      sub_100006AFC();
    }
    else
    {

      swift_release();
    }
  }
  sub_100015430();
}

id sub_10000891C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }
  id v7 = 0;
  id v3 = [(id)swift_getObjCClassFromMetadata() extensionWithIdentifier:v2 error:&v7];

  if (v3)
  {
    id v4 = v7;
  }
  else
  {
    id v5 = v7;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return v3;
}

uint64_t sub_100008A00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = (void *)swift_allocObject();
  v7[2] = a1;
  v7[3] = a2;
  v7[4] = a3;
  v7[5] = v3;
  swift_retain();
  swift_retain();
  id v8 = v3;
  sub_100015BB8((uint64_t)sub_100014F94, (uint64_t)v7);

  return swift_release();
}

uint64_t sub_100008AA0(char a1, void *a2, void (*a3)(uint64_t), uint64_t a4, char *a5)
{
  id v38 = a3;
  uint64_t v39 = a5;
  uint64_t v8 = sub_10000646C(&qword_100026D40);
  __chkstk_darwin(v8 - 8);
  double v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for UUID();
  uint64_t v12 = *(void *)(*(void *)(v11 - 8) + 64);
  uint64_t v13 = __chkstk_darwin(v11);
  os_log_type_t v14 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  unint64_t v17 = (char *)&v33 - v16;
  uint64_t v19 = a2[2];
  unint64_t v18 = a2[3];
  if ((a1 & 1) == 0)
  {
    swift_bridgeObjectRetain();
    goto LABEL_5;
  }
  uint64_t v37 = v15;
  uint64_t v20 = (uint64_t)a2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  swift_beginAccess();
  sub_100014C1C(v20, (uint64_t)v10, &qword_100026D40);
  if (sub_100014BF0((uint64_t)v10, 1, v11) == 1)
  {
    swift_bridgeObjectRetain();
    sub_100014EB0((uint64_t)v10, &qword_100026D40);
LABEL_5:
    sub_100008E94(0, v38, a4, (uint64_t)v39, (uint64_t)a2, v19, v18);
    return swift_bridgeObjectRelease();
  }
  uint64_t v36 = a4;
  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
  v22(v17, v10, v11);
  id v23 = (void *)a2[7];
  if (!v23)
  {
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  id v34 = v22;
  swift_bridgeObjectRetain();
  id v35 = v23;
  id v24 = [v35 serviceViewControllerProxy];

  swift_unknownObjectRelease();
  id v35 = v24;
  if (!v24)
  {
LABEL_10:
    sub_10000935C(v39, v19, v18, (uint64_t)v17, (uint64_t)a2, (uint64_t (*)(void))v38, v36);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v17, v11);
  }
  uint64_t v25 = v37 + 16;
  (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v14, v17, v11);
  unint64_t v26 = (*(unsigned __int8 *)(v25 + 64) + 40) & ~(unint64_t)*(unsigned __int8 *)(v25 + 64);
  unint64_t v27 = (v12 + v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v33 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  id v28 = (char *)swift_allocObject();
  *((void *)v28 + 2) = v39;
  *((void *)v28 + 3) = v19;
  *((void *)v28 + 4) = v18;
  v34(&v28[v26], v14, v11);
  uint64_t v29 = &v28[v27];
  uint64_t v30 = v36;
  *(void *)uint64_t v29 = v38;
  *((void *)v29 + 1) = v30;
  *(void *)&v28[v33] = a2;
  aBlock[4] = sub_100015060;
  aBlock[5] = v28;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A08C;
  aBlock[3] = &unk_100020F80;
  id v31 = _Block_copy(aBlock);
  uint64_t v32 = v39;
  swift_retain();
  swift_retain();
  swift_release();
  [v35 sidecarServiceShouldPresentWithCompletion:v31];
  _Block_release(v31);
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v37 + 8))(v17, v11);
}

uint64_t sub_100008E94(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v37 = a6;
  sub_10000646C(&qword_100026D40);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for UUID();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  id v38 = (char *)&v35 - v19;
  a2(a1);
  uint64_t v20 = (unint64_t *)(a4 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  uint64_t result = swift_beginAccess();
  unint64_t v22 = *v20;
  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v34 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    if (v34) {
      return result;
    }
  }
  else if (*(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    return result;
  }
  uint64_t v23 = a5 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  swift_beginAccess();
  sub_100014C1C(v23, (uint64_t)v13, &qword_100026D40);
  if (sub_100014BF0((uint64_t)v13, 1, v14) == 1)
  {
    id v24 = v38;
    if (qword_100026688 != -1) {
      swift_once();
    }
    uint64_t v25 = sub_1000062C8(v14, (uint64_t)qword_100026A30);
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v24, v25, v14);
    sub_100014EB0((uint64_t)v13, &qword_100026D40);
  }
  else
  {
    id v24 = v38;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v38, v13, v14);
  }
  if (qword_100026680 != -1) {
    swift_once();
  }
  uint64_t v36 = a5;
  uint64_t v26 = type metadata accessor for Logger();
  sub_1000062C8(v26, (uint64_t)qword_1000270E8);
  (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v18, v24, v14);
  swift_bridgeObjectRetain_n();
  unint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v35 = a4;
    uint64_t v30 = v29;
    uint64_t v40 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v39 = sub_100016C28(v37, a7, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 12) = 2082;
    uint64_t v31 = UUID.uuidString.getter();
    uint64_t v39 = sub_100016C28(v31, v32, &v40);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    unint64_t v33 = *(void (**)(char *, uint64_t))(v15 + 8);
    v33(v18, v14);
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Service Extension '%{public}s' %{public}s Activation Failed", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    id v24 = v38;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    unint64_t v33 = *(void (**)(char *, uint64_t))(v15 + 8);
    v33(v18, v14);
  }

  sub_10000AC14(v36);
  return ((uint64_t (*)(char *, uint64_t))v33)(v24, v14);
}

uint64_t sub_10000935C(char *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void), uint64_t a7)
{
  uint64_t v49 = a7;
  uint64_t v50 = a2;
  uint64_t v51 = a5;
  v52 = a6;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v47 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v15 = (char *)&v41 - v14;
  if (qword_100026680 != -1) {
    swift_once();
  }
  uint64_t v16 = type metadata accessor for Logger();
  sub_1000062C8(v16, (uint64_t)qword_1000270E8);
  uint64_t v45 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  uint64_t v46 = v11 + 16;
  v45(v15, a4, v10);
  swift_bridgeObjectRetain_n();
  uint64_t v17 = Logger.logObject.getter();
  uint64_t v18 = v10;
  os_log_type_t v19 = static os_log_type_t.default.getter();
  BOOL v20 = os_log_type_enabled(v17, v19);
  unint64_t v48 = a3;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v44 = a4;
    uint64_t v22 = v21;
    uint64_t v43 = swift_slowAlloc();
    v54[0] = v43;
    *(_DWORD *)uint64_t v22 = 136446466;
    uint64_t v42 = v18;
    swift_bridgeObjectRetain();
    uint64_t v53 = sub_100016C28(v50, a3, v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 12) = 2082;
    uint64_t v23 = UUID.uuidString.getter();
    uint64_t v53 = sub_100016C28(v23, v24, v54);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v25 = v11;
    uint64_t v18 = v42;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v42);
    _os_log_impl((void *)&_mh_execute_header, v17, v19, "Loading Service Extension '%{public}s' %{public}s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a4 = v44;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    uint64_t v25 = v11;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v15, v18);
  }

  uint64_t v26 = v18;
  unint64_t v27 = (uint64_t *)&a1[OBJC_IVAR____TtC7Sidecar14ServiceManager_readyServiceUUIDs];
  swift_beginAccess();
  uint64_t v28 = *v27;
  swift_bridgeObjectRetain();
  char v29 = sub_100009834(a4, v28);
  swift_bridgeObjectRelease();
  if (v29)
  {
    sub_10000A0F8();
  }
  else
  {
    sub_1000065E4(0, (unint64_t *)&qword_1000267F8);
    uint64_t v30 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v31 = v47;
    v45(v47, a4, v26);
    unint64_t v32 = (*(unsigned __int8 *)(v25 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
    unint64_t v33 = a1;
    uint64_t v34 = (char *)swift_allocObject();
    uint64_t v35 = v50;
    *((void *)v34 + 2) = v33;
    *((void *)v34 + 3) = v35;
    *((void *)v34 + 4) = v48;
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(&v34[v32], v31, v26);
    uint64_t v36 = v51;
    *(void *)&v34[(v12 + v32 + 7) & 0xFFFFFFFFFFFFFFF8] = v51;
    swift_bridgeObjectRetain();
    v33;
    swift_retain();
    OS_dispatch_queue.once(_:closure:)();
    uint64_t v38 = v37;
    swift_release();

    *(void *)(v36 + 88) = v38;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
    swift_beginAccess();
    uint64_t v39 = swift_retain();
    sub_100012F38(v39, a4);
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  return v52(0);
}

uint64_t sub_100009834(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_100014F08(&qword_100026D78),
        uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(),
        uint64_t v8 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v9 = v7 & ~v8,
        uint64_t v10 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    uint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_100014F08(&qword_100026D68);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

void sub_100009A20(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  v21[3] = a1;
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100026680 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_1000062C8(v13, (uint64_t)qword_1000270E8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a4, v9);
  swift_bridgeObjectRetain_n();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    v21[1] = a5;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    v21[2] = a4;
    uint64_t v23 = v18;
    *(_DWORD *)uint64_t v17 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_100016C28(a2, a3, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v17 + 12) = 2082;
    uint64_t v19 = UUID.uuidString.getter();
    uint64_t v22 = sub_100016C28(v19, v20, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Service Extension '%{public}s' %{public}s Timed Out (Activating Anyway)", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }

  sub_10000A0F8();
}

uint64_t sub_100009CFC(uint64_t a1, char *a2, uint64_t a3, unint64_t a4, uint64_t a5, void (*a6)(uint64_t), uint64_t a7, uint64_t a8)
{
  uint64_t v40 = a6;
  uint64_t v15 = type metadata accessor for UUID();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v33 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v38 = a2;
    uint64_t v39 = a3;
    swift_errorRetain();
    if (qword_100026680 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_1000062C8(v19, (uint64_t)qword_1000270E8);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a5, v15);
    swift_bridgeObjectRetain_n();
    unint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    int v22 = v21;
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v37 = a8;
      uint64_t v24 = v23;
      uint64_t v35 = swift_slowAlloc();
      uint64_t v42 = v35;
      *(_DWORD *)uint64_t v24 = 136446466;
      int v34 = v22;
      swift_bridgeObjectRetain();
      os_log_t v33 = v20;
      uint64_t v25 = v39;
      uint64_t v41 = sub_100016C28(v39, a4, &v42);
      uint64_t v36 = a7;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v24 + 12) = 2082;
      uint64_t v26 = UUID.uuidString.getter();
      uint64_t v41 = sub_100016C28(v26, v27, &v42);
      a7 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v28 = v25;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      os_log_t v29 = v33;
      _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)v34, "Service Extension '%{public}s' %{public}s Declined Presentation", (uint8_t *)v24, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      a8 = v37;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);

      uint64_t v28 = v39;
    }
    uint64_t v32 = (uint64_t)v38;
    swift_errorRetain();
    sub_100008E94(a1, v40, a7, v32, a8, v28, a4);
    swift_errorRelease();
    return swift_errorRelease();
  }
  else
  {
    uint64_t v30 = v40;
    return sub_10000935C(a2, a3, a4, a5, a8, (uint64_t (*)(void))v30, a7);
  }
}

void sub_10000A08C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10000A0F8()
{
  sub_1000153FC();
  uint64_t v2 = v1;
  id v4 = v3;
  uint64_t v5 = sub_10000646C(&qword_100026D40);
  uint64_t v6 = sub_100015560(v5);
  __chkstk_darwin(v6);
  uint64_t v7 = sub_100015624();
  sub_100006A48();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_100015584();
  uint64_t v13 = v12 - v11;
  if (v4[11])
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    OS_dispatch_source.cancel()();
    swift_unknownObjectRelease();
    v4[11] = 0;
    swift_unknownObjectRelease();
  }
  if (qword_100026680 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_100015660(v14, (uint64_t)qword_1000270E8);
  sub_100015484();
  v15();
  swift_retain();
  uint64_t v16 = v7;
  uint64_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v25 = v0;
    uint64_t v19 = sub_1000154B8();
    v27[0] = sub_1000154A0();
    *(_DWORD *)uint64_t v19 = 136446466;
    uint64_t v26 = v2;
    uint64_t v20 = v4[2];
    unint64_t v21 = v4[3];
    swift_bridgeObjectRetain();
    sub_100016C28(v20, v21, v27);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    uint64_t v22 = UUID.uuidString.getter();
    sub_100016C28(v22, v23, v27);
    uint64_t v2 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100015894();
    v24();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Service Extension '%{public}s' %{public}s Activated", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    sub_100006AFC();
    uint64_t v0 = v25;
    sub_100006AFC();
  }
  else
  {
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v13, v16);
  }

  sub_100015508();
  sub_1000133C8(v2, v0);
  sub_100014EB0(v0, &qword_100026D40);
  swift_endAccess();
  sub_10000A400((uint64_t)v4);
  sub_100015430();
}

void sub_10000A400(uint64_t a1)
{
  uint64_t v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  swift_beginAccess();
  uint64_t v4 = *v3;
  if ((unint64_t)*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  if (!v5)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if ((v4 & 0xC000000000000001) != 0) {
    goto LABEL_29;
  }
  if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v6 = *(void *)(v4 + 32);
  swift_retain();
  while (1)
  {
    swift_bridgeObjectRelease();
    uint64_t v7 = *(void **)(v6 + 56);
    id v8 = v7;
    swift_release();
    if (v7)
    {
      id v9 = [v8 serviceViewControllerProxy];

      swift_unknownObjectRelease();
      if (v9)
      {
        [v9 sidecarServiceSetActive:0];
        swift_unknownObjectRelease();
      }
    }
LABEL_11:
    uint64_t v10 = *v3;
    if ((unint64_t)*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      if (!_CocoaArrayWrapper.endIndex.getter())
      {
LABEL_21:
        swift_bridgeObjectRelease();
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v11) {
        goto LABEL_21;
      }
    }
    if ((v10 & 0xC000000000000001) != 0)
    {
      uint64_t v12 = specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else
    {
      if (!*(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        goto LABEL_32;
      }
      uint64_t v12 = *(void *)(v10 + 32);
      swift_retain();
    }
    swift_bridgeObjectRelease();
    uint64_t v13 = *(void **)(v12 + 56);
    id v14 = v13;
    swift_release();
    if (v13)
    {
      id v15 = [v14 serviceViewControllerProxy];

      swift_unknownObjectRelease();
      if (v15)
      {
        [v15 sidecarServiceSetBackgrounded:1];
        swift_unknownObjectRelease();
      }
    }
LABEL_22:
    swift_beginAccess();
    if (!((unint64_t)*v3 >> 62)) {
      break;
    }
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v17 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if ((v17 & 0x8000000000000000) == 0) {
      goto LABEL_24;
    }
    __break(1u);
LABEL_29:
    uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  swift_retain();
LABEL_24:
  sub_1000143A0(0, 0, a1);
  swift_endAccess();
  uint64_t v16 = *(void **)(a1 + 56);
  if (!v16 || ((unint64_t)[v16 supportedInterfaceOrientations] & 0x8000000000000000) == 0)
  {
    SidecarServicePresenterReady();
    sub_1000103BC(a1);
    return;
  }
LABEL_33:
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_10000A748()
{
  sub_1000153FC();
  uint64_t v2 = v1;
  uint64_t v3 = type metadata accessor for UUID();
  sub_100006A48();
  uint64_t v5 = v4;
  uint64_t v7 = __chkstk_darwin(v6);
  id v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v41 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  id v15 = (char *)&v41 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v41 - v16;
  sub_100015508();
  uint64_t v18 = sub_100012D54(v2);
  swift_endAccess();
  if (v18)
  {
    if (qword_100026680 != -1) {
      swift_once();
    }
    uint64_t v19 = type metadata accessor for Logger();
    sub_100015660(v19, (uint64_t)qword_1000270E8);
    sub_100015484();
    v20();
    swift_retain();
    unint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = sub_1000154B8();
      uint64_t v43 = sub_1000154A0();
      v48[0] = (uint64_t)v43;
      *(_DWORD *)uint64_t v23 = 136446466;
      uint64_t v45 = v2;
      uint64_t v46 = v0;
      uint64_t v24 = *(void *)(v18 + 16);
      unint64_t v25 = *(void *)(v18 + 24);
      swift_bridgeObjectRetain();
      uint64_t v47 = sub_100016C28(v24, v25, v48);
      uint64_t v44 = v3;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2082;
      uint64_t v26 = UUID.uuidString.getter();
      uint64_t v47 = sub_100016C28(v26, v27, v48);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100015754();
      v28();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Service Extension '%{public}s' %{public}s Ready", (uint8_t *)v23, 0x16u);
      sub_100015800();
      sub_100006AFC();
      sub_100006AFC();
    }
    else
    {
      swift_release();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v17, v3);
    }

    sub_10000A0F8();
    swift_release();
  }
  else
  {
    uint64_t v46 = v0;
    if (qword_100026680 != -1) {
      swift_once();
    }
    uint64_t v29 = type metadata accessor for Logger();
    sub_100015660(v29, (uint64_t)qword_1000270E8);
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    uint64_t v45 = v2;
    v30(v15, v2, v3);
    uint64_t v31 = Logger.logObject.getter();
    uint64_t v32 = v3;
    os_log_type_t v33 = static os_log_type_t.default.getter();
    uint64_t v43 = v31;
    if (os_log_type_enabled(v31, v33))
    {
      uint64_t v44 = v32;
      uint64_t v34 = sub_10001556C();
      uint64_t v42 = v30;
      uint64_t v35 = v34;
      uint64_t v41 = sub_10001553C();
      v48[0] = v41;
      *(_DWORD *)uint64_t v35 = 136446210;
      uint64_t v31 = (v35 + 12);
      uint64_t v36 = UUID.uuidString.getter();
      uint64_t v38 = sub_100016C28(v36, v37, v48);
      sub_1000157AC(v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100015740();
      uint64_t v39 = v44;
      sub_100015754();
      ((void (*)(void))(v35 + 12))();
      uint64_t v40 = v43;
      _os_log_impl((void *)&_mh_execute_header, v43, v33, "Service Extension %{public}s Ready (Not Loaded)", (uint8_t *)v35, 0xCu);
      swift_arrayDestroy();
      sub_100006AFC();
      uint64_t v30 = v42;
      sub_100006AFC();
    }
    else
    {
      sub_100015740();
      sub_100015754();
      ((void (*)(void))v31)();

      uint64_t v39 = v32;
    }
    v30(v9, v45, v39);
    sub_100015508();
    sub_100014610((uint64_t)v12, v9);
    ((void (*)(char *, uint64_t))v31)(v12, v39);
    swift_endAccess();
  }
  sub_100015430();
}

id sub_10000AC14(uint64_t a1)
{
  uint64_t v2 = v1;
  if (SBSGetScreenLockStatus())
  {
    uint64_t v4 = 0xD000000000000018;
    unint64_t v5 = 0x800000010001B370;
LABEL_3:
    SBSLockDevice();
    goto LABEL_10;
  }
  uint64_t v4 = 0xD000000000000010;
  if (a1
    && (*(void *)(a1 + 16) == 0xD000000000000023 && *(void *)(a1 + 24) == 0x800000010001B3B0
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    && (*(unsigned char *)(v2 + OBJC_IVAR____TtC7Sidecar14ServiceManager_inBackground) & 1) == 0)
  {
    uint64_t v4 = 0xD000000000000021;
    unint64_t v5 = 0x800000010001B3E0;
    goto LABEL_3;
  }
  unint64_t v5 = 0x800000010001B390;
LABEL_10:
  if (qword_100026680 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100015660(v6, (uint64_t)qword_1000270E8);
  swift_bridgeObjectRetain();
  uint64_t v7 = (void *)Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (sub_1000156E0(v8))
  {
    id v9 = (_DWORD *)sub_10001556C();
    uint64_t v15 = sub_10001553C();
    *id v9 = 136446210;
    swift_bridgeObjectRetain();
    sub_100016C28(v4, v5, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    sub_1000158E0((void *)&_mh_execute_header, v10, v11, "Idle Exiting: %{public}s");
    swift_arrayDestroy();
    sub_100006AFC();
    sub_100006AFC();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v12 = *(void **)(v2 + OBJC_IVAR____TtC7Sidecar14ServiceManager_window);
  id v13 = [self mainScreen];
  [v12 setScreen:v13];

  if (!UIApp) {
    __break(1u);
  }
  return [UIApp terminateWithSuccess];
}

void sub_10000AEDC()
{
  sub_1000153FC();
  uint64_t v43 = v0;
  uint64_t v3 = v2;
  unint64_t v5 = v4;
  uint64_t v6 = type metadata accessor for Logger();
  sub_100006A48();
  __chkstk_darwin(v7);
  sub_100015584();
  uint64_t v10 = v9 - v8;
  uint64_t v11 = sub_10000646C(&qword_100026D40);
  uint64_t v12 = sub_100015560(v11);
  __chkstk_darwin(v12);
  uint64_t v13 = sub_100015624();
  sub_100006A48();
  uint64_t v15 = v14;
  __chkstk_darwin(v16);
  sub_100015594();
  uint64_t v42 = v17;
  sub_100015870();
  __chkstk_darwin(v18);
  uint64_t v20 = &v39[-v19];
  uint64_t v44 = v5;
  uint64_t v21 = (uint64_t)v5 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  sub_100015414();
  sub_100014C1C(v21, v1, &qword_100026D40);
  sub_100015838(v1);
  if (v22)
  {
    if (qword_100026688 != -1) {
      swift_once();
    }
    sub_1000062C8(v13, (uint64_t)qword_100026A30);
    sub_100015820();
    sub_100015484();
    v23();
    sub_100014EB0(v1, &qword_100026D40);
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v15 + 32))(v20, v1, v13);
  }
  uint64_t v24 = v44;
  if (v3)
  {
    swift_errorRetain();
    if (qword_100026680 != -1) {
      swift_once();
    }
    sub_1000062C8(v6, (uint64_t)qword_1000270E8);
    sub_100015484();
    uint64_t v26 = v25();
    __chkstk_darwin(v26);
    *(void *)&v39[-16] = v24;
    *(void *)&v39[-8] = v20;
    swift_errorRetain();
    sub_100006B14(sub_100014CE8, &v39[-32], v10, v3);
    sub_100015894();
    v27();
    swift_errorRelease();
  }
  else
  {
    if (qword_100026680 != -1) {
      swift_once();
    }
    sub_100015660(v6, (uint64_t)qword_1000270E8);
    sub_100015820();
    uint64_t v28 = v42;
    sub_100015720();
    sub_100015484();
    v29();
    swift_retain();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    int v32 = v31;
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v33 = sub_1000154B8();
      uint64_t v41 = sub_1000154A0();
      v46[0] = v41;
      *(_DWORD *)uint64_t v33 = 136446466;
      int v40 = v32;
      uint64_t v34 = v24[2];
      unint64_t v35 = v44[3];
      swift_bridgeObjectRetain();
      uint64_t v45 = sub_100016C28(v34, v35, v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      uint64_t v24 = v44;
      swift_bridgeObjectRelease();
      *(_WORD *)(v33 + 12) = 2082;
      uint64_t v36 = UUID.uuidString.getter();
      uint64_t v45 = sub_100016C28(v36, v37, v46);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100015554();
      v38();
      _os_log_impl((void *)&_mh_execute_header, v30, (os_log_type_t)v40, "Service Extension '%{public}s' %{public}s Terminated", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      sub_100006AFC();
      sub_100006AFC();
    }
    else
    {
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v28, v13);
    }
  }
  sub_10000B39C(v24, 0, v43);
  (*(void (**)(unsigned char *, uint64_t))(v15 + 8))(v20, v13);
  sub_100015430();
}

void sub_10000B39C(void *a1, uint64_t a2, char *a3)
{
  uint64_t v6 = sub_10000646C(&qword_100026D40);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  v102 = (char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v96 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v96 - v16;
  uint64_t v18 = (uint64_t)a1 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  swift_beginAccess();
  sub_100014C1C(v18, (uint64_t)v8, &qword_100026D40);
  if (sub_100014BF0((uint64_t)v8, 1, v9) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v17, v8, v9);
    swift_beginAccess();
    unint64_t v27 = (void *)sub_100012D54((uint64_t)v17);
    swift_endAccess();
    v101 = a3;
    uint64_t v98 = a2;
    if (v27)
    {
      if (qword_100026680 != -1) {
        swift_once();
      }
      uint64_t v28 = type metadata accessor for Logger();
      sub_1000062C8(v28, (uint64_t)qword_1000270E8);
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v15, v17, v9);
      swift_retain();
      uint64_t v29 = Logger.logObject.getter();
      os_log_type_t v30 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = swift_slowAlloc();
        v99 = v17;
        uint64_t v32 = v31;
        uint64_t v33 = swift_slowAlloc();
        uint64_t v100 = v9;
        v105[0] = v33;
        *(_DWORD *)uint64_t v32 = 136446466;
        uint64_t v97 = v10;
        uint64_t v34 = v27[2];
        unint64_t v35 = v27[3];
        swift_bridgeObjectRetain();
        v104[0] = sub_100016C28(v34, v35, v105);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v32 + 12) = 2082;
        uint64_t v36 = UUID.uuidString.getter();
        v104[0] = sub_100016C28(v36, v37, v105);
        uint64_t v10 = v97;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v100);
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Service Extension '%{public}s' %{public}s Deactivated (Not Active)", (uint8_t *)v32, 0x16u);
        swift_arrayDestroy();
        uint64_t v9 = v100;
        swift_slowDealloc();
        uint64_t v17 = v99;
        swift_slowDealloc();
      }
      else
      {
        swift_release();
        (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
      }

      a3 = v101;
      if (v27[11])
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        OS_dispatch_source.cancel()();
        swift_unknownObjectRelease();
      }
      v27[11] = 0;
      swift_release();
      swift_unknownObjectRelease();
    }
    uint64_t v38 = (unint64_t *)&a3[OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions];
    uint64_t v39 = swift_beginAccess();
    unint64_t v40 = *v38;
    __chkstk_darwin(v39);
    *(&v96 - 2) = (unint64_t *)v17;
    swift_bridgeObjectRetain();
    unint64_t v41 = sub_10000D364(sub_100014D24, (uint64_t)(&v96 - 4), v40);
    char v43 = v42;
    swift_bridgeObjectRelease();
    if (v43)
    {
      sub_10001666C();
      sub_10000E1D0();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v9);
      return;
    }
    v96 = v38;
    if (qword_100026680 != -1) {
      swift_once();
    }
    uint64_t v44 = type metadata accessor for Logger();
    sub_1000062C8(v44, (uint64_t)qword_1000270E8);
    uint64_t v45 = v102;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v102, v17, v9);
    swift_retain();
    uint64_t v46 = Logger.logObject.getter();
    os_log_type_t v47 = static os_log_type_t.default.getter();
    BOOL v48 = os_log_type_enabled(v46, v47);
    v99 = v17;
    if (v48)
    {
      uint64_t v49 = swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t v100 = v41;
      v104[0] = v50;
      *(_DWORD *)uint64_t v49 = 136446466;
      uint64_t v97 = v10;
      uint64_t v51 = v9;
      uint64_t v52 = a1[2];
      unint64_t v53 = a1[3];
      swift_bridgeObjectRetain();
      uint64_t v103 = sub_100016C28(v52, v53, v104);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v49 + 12) = 2082;
      uint64_t v54 = UUID.uuidString.getter();
      uint64_t v103 = sub_100016C28(v54, v55, v104);
      uint64_t v9 = v51;
      uint64_t v56 = v97;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v102 = *(char **)(v56 + 8);
      ((void (*)(char *, uint64_t))v102)(v45, v9);
      _os_log_impl((void *)&_mh_execute_header, v46, v47, "Service Extension '%{public}s' %{public}s Deactivated", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      unint64_t v41 = v100;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release();
      v102 = *(char **)(v10 + 8);
      ((void (*)(char *, uint64_t))v102)(v45, v9);
    }

    v57 = v96;
    swift_beginAccess();
    sub_10000D484(v41);
    swift_endAccess();
    swift_release();
    v58 = v101;
    v59 = *(void **)&v101[OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController];
    id v60 = [v59 topViewController];
    v61 = (void *)a1[7];
    if (v60)
    {
      v62 = v60;
      if (!v61)
      {

        goto LABEL_38;
      }
      sub_1000065E4(0, &qword_100026D30);
      id v63 = v61;
      id v64 = v62;
      char v65 = static NSObject.== infix(_:_:)();

      if ((v65 & 1) == 0)
      {
LABEL_38:
        uint64_t v71 = v9;
        id v72 = [v59 viewControllers];
        sub_1000065E4(0, &qword_100026D30);
        unint64_t v73 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        v104[0] = v73;
        v74 = (void *)a1[7];
        if (v74)
        {
          swift_bridgeObjectRetain();
          id v75 = v74;
          sub_10000E034((uint64_t)v75, v73);
          unint64_t v77 = v76;
          char v79 = v78;
          swift_bridgeObjectRelease();

          if (v79)
          {
            swift_bridgeObjectRelease();
          }
          else
          {

            Class isa = Array._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
            [v59 setViewControllers:isa];
          }
          sub_10001666C();
          sub_10000E1D0();
          v81 = v99;
          uint64_t v82 = v71;
          goto LABEL_62;
        }
        goto LABEL_65;
      }
    }
    else
    {
      if (v61) {
        goto LABEL_38;
      }
      id v66 = 0;
    }
    if (!UIApp)
    {
LABEL_66:
      __break(1u);
      return;
    }
    id v67 = [UIApp applicationState];
    uint64_t v68 = v98;
    if (!v98 || v67)
    {

      sub_10001666C();
      sub_10000E1D0();
    }
    else
    {
      uint64_t v100 = v9;
      v69 = (void *)swift_allocObject();
      v69[2] = v58;
      v69[3] = a1;
      v69[4] = nullsub_1;
      v69[5] = 0;
      swift_retain();
      v58;
      sub_10000F56C(v68, (uint64_t)sub_100014D48, (uint64_t)v69);
      id v70 = [v59 popViewControllerAnimated:1];
      sub_10000F56C(0, 0, 0);
      if (v70)
      {
      }
      else
      {
        sub_10001666C();
        sub_10000E1D0();
      }
      uint64_t v9 = v100;
    }
    id v83 = [v59 topViewController:v96];
    if (v83)
    {
      v84 = v83;
      sub_10000D560((unint64_t)[v83 supportedInterfaceOrientations]);
    }
    sub_10000D7AC();
    sub_10000D860();
    sub_10000F0A0();
    unint64_t v85 = *v57;
    v86 = v99;
    if (*v57 >> 62)
    {
      swift_bridgeObjectRetain();
      if (_CocoaArrayWrapper.endIndex.getter())
      {
LABEL_50:
        if ((v85 & 0xC000000000000001) != 0)
        {
          uint64_t v88 = v9;
          uint64_t v89 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if (!*(void *)((v85 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_65:
            __break(1u);
            goto LABEL_66;
          }
          uint64_t v88 = v9;
          uint64_t v89 = *(void *)(v85 + 32);
          swift_retain();
        }
        swift_bridgeObjectRelease();
        v90 = *(void **)(v89 + 56);
        if (v90)
        {
          id v91 = v90;
          id v92 = [v91 serviceViewControllerProxy];

          swift_unknownObjectRelease();
          if (v92)
          {
            [v92 sidecarServiceSetActive:1];
            swift_unknownObjectRelease();
          }
          v93 = *(void **)(v89 + 56);
          if (v93)
          {
            id v94 = v93;
            id v95 = [v94 serviceViewControllerProxy];

            swift_unknownObjectRelease();
            if (v95)
            {
              [v95 sidecarServiceSetBackgrounded:0];
              swift_unknownObjectRelease();
            }
          }
        }
        SBSUndimScreen();
        sub_10000D914();
        swift_release();
        v81 = v86;
        uint64_t v82 = v88;
        goto LABEL_62;
      }
    }
    else
    {
      uint64_t v87 = *(void *)((v85 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v87) {
        goto LABEL_50;
      }
    }
    swift_bridgeObjectRelease();
    v81 = v86;
    uint64_t v82 = v9;
LABEL_62:
    ((void (*)(char *, uint64_t))v102)(v81, v82);
    return;
  }
  sub_100014EB0((uint64_t)v8, &qword_100026D40);
  if (qword_100026680 != -1) {
    swift_once();
  }
  uint64_t v19 = type metadata accessor for Logger();
  sub_1000062C8(v19, (uint64_t)qword_1000270E8);
  swift_retain();
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v100 = v9;
    uint64_t v22 = swift_slowAlloc();
    v105[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136446466;
    uint64_t v23 = a1[2];
    unint64_t v24 = a1[3];
    swift_bridgeObjectRetain();
    v104[0] = sub_100016C28(v23, v24, v105);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 12) = 2082;
    if (qword_100026688 != -1) {
      swift_once();
    }
    sub_1000062C8(v100, (uint64_t)qword_100026A30);
    uint64_t v25 = UUID.uuidString.getter();
    v104[0] = sub_100016C28(v25, v26, v105);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Service Extension '%{public}s' %{public}s Deactivated (Not Loaded)", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release();
  }
  sub_10001666C();
  sub_10000E1D0();
}

void sub_10000C1B8()
{
  sub_1000153FC();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v109 = v5;
  uint64_t v7 = v6;
  uint64_t v8 = sub_10000646C(&qword_100026D40);
  uint64_t v9 = sub_100015560(v8);
  __chkstk_darwin(v9);
  uint64_t v10 = (void (**)(void))sub_1000155FC();
  sub_100006A48();
  uint64_t v12 = v11;
  __chkstk_darwin(v13);
  sub_100015594();
  uint64_t v113 = v14;
  sub_100015870();
  uint64_t v16 = __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v108 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v108 - v19;
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v2;
  v117 = v7;
  uint64_t v22 = (uint64_t)v7 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  sub_100015448();
  sub_100014C1C(v22, v0, &qword_100026D40);
  uint64_t v23 = &off_100026000;
  if (sub_100014BF0(v0, 1, (uint64_t)v10) == 1)
  {
    v114 = v10;
    v112 = v2;
    _Block_copy(v2);
    sub_100014EB0(v0, &qword_100026D40);
    if (qword_100026680 != -1) {
      swift_once();
    }
    uint64_t v24 = type metadata accessor for Logger();
    sub_100015660(v24, (uint64_t)qword_1000270E8);
    uint64_t v25 = v117;
    swift_retain();
    unint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v115 = v21;
      uint64_t v28 = sub_1000154B8();
      v120[0] = sub_1000154A0();
      *(_DWORD *)uint64_t v28 = 136446466;
      uint64_t v29 = v25[2];
      unint64_t v30 = v25[3];
      swift_bridgeObjectRetain();
      v119[0] = sub_100016C28(v29, v30, v120);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 12) = 2082;
      if (qword_100026688 != -1) {
        swift_once();
      }
      sub_100015660((uint64_t)v114, (uint64_t)qword_100026A30);
      uint64_t v31 = UUID.uuidString.getter();
      v119[0] = sub_100016C28(v31, v32, v120);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Service Extension '%{public}s' %{public}s Deactivated (Not Loaded)", (uint8_t *)v28, 0x16u);
      swift_arrayDestroy();
      sub_100006AFC();
      sub_100006AFC();
    }
    else
    {

      swift_release();
    }
    sub_10001666C();
    sub_10000E1D0();
    BOOL v48 = v112;
    ((void (*)(unint64_t *))v112[2])(v112);
    swift_release();
    uint64_t v49 = v48;
    goto LABEL_63;
  }
  uint64_t v115 = v21;
  uint64_t v116 = v12;
  (*(void (**)(char *, uint64_t, void (**)(void)))(v12 + 32))(v20, v0, v10);
  sub_100015508();
  _Block_copy(v2);
  uint64_t v33 = (void *)sub_100012D54((uint64_t)v20);
  swift_endAccess();
  uint64_t v34 = v2;
  v110 = v20;
  if (v33)
  {
    if (qword_100026680 != -1) {
      swift_once();
    }
    uint64_t v35 = type metadata accessor for Logger();
    sub_100015660(v35, (uint64_t)qword_1000270E8);
    uint64_t v36 = v116;
    sub_100015484();
    v37();
    swift_retain();
    uint64_t v38 = Logger.logObject.getter();
    uint64_t v39 = (uint64_t)v10;
    os_log_type_t v40 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v38, v40))
    {
      unint64_t v41 = (uint8_t *)sub_1000154B8();
      unint64_t v108 = sub_1000154A0();
      v120[0] = v108;
      *(_DWORD *)unint64_t v41 = 136446466;
      v114 = (void (**)(void))v39;
      v111 = v4;
      v112 = v2;
      uint64_t v42 = v33[2];
      unint64_t v43 = v33[3];
      swift_bridgeObjectRetain();
      v119[0] = sub_100016C28(v42, v43, v120);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      sub_1000157A0();
      uint64_t v44 = UUID.uuidString.getter();
      v119[0] = sub_100016C28(v44, v45, v120);
      uint64_t v4 = v111;
      uint64_t v34 = v112;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v46 = (uint64_t)v114;
      sub_100015554();
      v47();
      _os_log_impl((void *)&_mh_execute_header, v38, v40, "Service Extension '%{public}s' %{public}s Deactivated (Not Active)", v41, 0x16u);
      swift_arrayDestroy();
      sub_100006AFC();
      uint64_t v23 = &off_100026000;
      sub_100006AFC();

      uint64_t v10 = (void (**)(void))v46;
    }
    else
    {
      swift_release();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v18, v39);

      uint64_t v10 = (void (**)(void))v39;
    }
    uint64_t v20 = v110;
    if (v33[11])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      OS_dispatch_source.cancel()();
      swift_unknownObjectRelease();
    }
    v33[11] = 0;
    swift_release();
    swift_unknownObjectRelease();
  }
  uint64_t v50 = v34;
  uint64_t v51 = (unint64_t *)&v4[OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions];
  uint64_t v52 = sub_100015414();
  v112 = v51;
  unint64_t v53 = *v51;
  __chkstk_darwin(v52);
  *(&v108 - 2) = (unint64_t)v20;
  swift_bridgeObjectRetain();
  uint64_t v54 = sub_10000D364(sub_100015398, (uint64_t)(&v108 - 4), v53);
  char v56 = v55;
  swift_bridgeObjectRelease();
  if (v56)
  {
    sub_10001666C();
    sub_10000E1D0();
    ((void (*)(unint64_t *))v34[2])(v34);
    sub_100015678();
    v72();
    swift_release();
    uint64_t v49 = v34;
LABEL_63:
    _Block_release(v49);
    sub_100015430();
    return;
  }
  unint64_t v108 = v54;
  uint64_t v57 = v116;
  v58 = v117;
  if (v23[208] != (_UNKNOWN *)-1) {
    swift_once();
  }
  v111 = v4;
  uint64_t v59 = type metadata accessor for Logger();
  sub_100015660(v59, (uint64_t)qword_1000270E8);
  uint64_t v60 = v113;
  sub_100015484();
  v61();
  swift_retain();
  v62 = Logger.logObject.getter();
  os_log_type_t v63 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v62, v63))
  {
    id v64 = (uint8_t *)sub_1000154B8();
    uint64_t v65 = sub_1000154A0();
    v114 = v10;
    v119[0] = v65;
    *(_DWORD *)id v64 = 136446466;
    uint64_t v66 = v58[2];
    unint64_t v67 = v58[3];
    swift_bridgeObjectRetain();
    uint64_t v118 = sub_100016C28(v66, v67, v119);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    uint64_t v34 = v50;
    swift_bridgeObjectRelease();
    sub_1000157A0();
    uint64_t v68 = UUID.uuidString.getter();
    uint64_t v118 = sub_100016C28(v68, v69, v119);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    id v70 = *(void (**)(uint64_t))(v116 + 8);
    sub_100015554();
    v70(v71);
    _os_log_impl((void *)&_mh_execute_header, v62, v63, "Service Extension '%{public}s' %{public}s Deactivated", v64, 0x16u);
    swift_arrayDestroy();
    uint64_t v10 = v114;
    sub_100006AFC();
    sub_100006AFC();
  }
  else
  {
    swift_release();
    id v70 = *(void (**)(uint64_t))(v57 + 8);
    ((void (*)(uint64_t, void (**)(void)))v70)(v60, v10);
  }

  sub_100015508();
  sub_10000D484(v108);
  swift_endAccess();
  swift_release();
  unint64_t v73 = *(void **)&v111[OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController];
  id v74 = [v73 topViewController];
  id v75 = (void *)v58[7];
  if (v74)
  {
    unint64_t v76 = v74;
    if (!v75)
    {

      goto LABEL_38;
    }
    sub_1000065E4(0, &qword_100026D30);
    id v77 = v75;
    id v78 = v76;
    char v79 = static NSObject.== infix(_:_:)();

    if ((v79 & 1) == 0)
    {
LABEL_38:
      uint64_t v10 = (void (**)(void))v34;
      id v87 = [v73 viewControllers:v108];
      sub_1000065E4(0, &qword_100026D30);
      unint64_t v88 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      v119[0] = v88;
      uint64_t v89 = (void *)v58[7];
      if (v89)
      {
        swift_bridgeObjectRetain();
        id v90 = v89;
        sub_10000E034((uint64_t)v90, v88);
        unint64_t v92 = v91;
        char v94 = v93;
        swift_bridgeObjectRelease();

        if (v94)
        {
          swift_bridgeObjectRelease();
        }
        else
        {

          Class isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v73 setViewControllers:isa];
        }
        sub_10001666C();
        sub_10000E1D0();
        v10[2](v10);
        sub_100015554();
        ((void (*)(void))v70)();
        swift_release();
        uint64_t v49 = (unint64_t *)v10;
        goto LABEL_63;
      }
      goto LABEL_66;
    }
  }
  else
  {
    if (v75) {
      goto LABEL_38;
    }
    id v80 = 0;
  }
  if (UIApp)
  {
    id v81 = [UIApp applicationState];
    uint64_t v82 = v109;
    if (!v109 || v81)
    {

      sub_10001666C();
      sub_10000E1D0();
      ((void (*)(unint64_t *))v34[2])(v34);
    }
    else
    {
      v114 = (void (**)(void))v70;
      id v83 = (void *)swift_allocObject();
      v84 = v111;
      v83[2] = v111;
      v83[3] = v58;
      uint64_t v85 = v115;
      v83[4] = sub_1000152F4;
      v83[5] = v85;
      swift_retain();
      v84;
      swift_retain();
      sub_10000F56C(v82, (uint64_t)sub_1000153B4, (uint64_t)v83);
      id v86 = [v73 popViewControllerAnimated:1];
      sub_10000F56C(0, 0, 0);
      if (v86)
      {
      }
      else
      {
        sub_10001666C();
        sub_10000E1D0();
        ((void (*)(unint64_t *))v34[2])(v34);
      }
      id v70 = (void (*)(uint64_t))v114;
    }
    id v96 = [v73 topViewController:v108];
    if (v96)
    {
      uint64_t v97 = v96;
      sub_10000D560((unint64_t)[v96 supportedInterfaceOrientations]);
    }
    uint64_t v98 = v111;
    sub_10000D7AC();
    sub_10000D860();
    sub_10000F0A0();
    unint64_t v99 = *v112;
    uint64_t v100 = (uint64_t)v110;
    if (*v112 >> 62)
    {
      sub_1000154E8();
      if (_CocoaArrayWrapper.endIndex.getter()) {
        goto LABEL_50;
      }
    }
    else
    {
      sub_100015690();
      if (v98)
      {
LABEL_50:
        if ((v99 & 0xC000000000000001) != 0)
        {
          uint64_t v100 = sub_1000157D4();
        }
        else
        {
          sub_10001587C();
          if (!v101)
          {
            __break(1u);
LABEL_66:
            _Block_release(v10);
            __break(1u);
            goto LABEL_67;
          }
          sub_100015858();
        }
        swift_bridgeObjectRelease();
        v102 = *(void **)(v100 + 56);
        if (v102)
        {
          id v103 = v102;
          id v104 = [v103 serviceViewControllerProxy];

          swift_unknownObjectRelease();
          if (v104)
          {
            [v104 sidecarServiceSetActive:1];
            swift_unknownObjectRelease();
          }
          v105 = *(void **)(v100 + 56);
          if (v105)
          {
            id v106 = v105;
            id v107 = [v106 serviceViewControllerProxy];

            swift_unknownObjectRelease();
            if (v107)
            {
              [v107 sidecarServiceSetBackgrounded:0];
              swift_unknownObjectRelease();
            }
          }
        }
        SBSUndimScreen();
        sub_10000D914();
        swift_release();
        goto LABEL_62;
      }
    }
    swift_bridgeObjectRelease();
LABEL_62:
    sub_100015554();
    ((void (*)(void))v70)();
    swift_release();
    uint64_t v49 = v34;
    goto LABEL_63;
  }
LABEL_67:
  _Block_release(v34);
  __break(1u);
}

uint64_t sub_10000CF9C(void *a1, uint64_t a2)
{
  uint64_t v31 = a2;
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v30 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000646C(&qword_100026D60);
  uint64_t v7 = v6 - 8;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10000646C(&qword_100026D40);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v29 - v15;
  __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v29 - v17;
  uint64_t v19 = *a1 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  swift_beginAccess();
  uint64_t v20 = v19;
  uint64_t v21 = v4;
  sub_100014C1C(v20, (uint64_t)v18, &qword_100026D40);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v16, v31, v3);
  sub_1000126C8((uint64_t)v16, 0, 1, v3);
  uint64_t v22 = (uint64_t)&v9[*(int *)(v7 + 56)];
  sub_100014C1C((uint64_t)v18, (uint64_t)v9, &qword_100026D40);
  sub_100014C1C((uint64_t)v16, v22, &qword_100026D40);
  if (sub_100014BF0((uint64_t)v9, 1, v3) == 1)
  {
    sub_100014EB0((uint64_t)v16, &qword_100026D40);
    sub_100014EB0((uint64_t)v18, &qword_100026D40);
    int v23 = sub_100014BF0(v22, 1, v3);
    if (v23 == 1) {
      uint64_t v24 = &qword_100026D40;
    }
    else {
      uint64_t v24 = &qword_100026D60;
    }
    if (v23 == 1) {
      char v25 = -1;
    }
    else {
      char v25 = 0;
    }
  }
  else
  {
    sub_100014C1C((uint64_t)v9, (uint64_t)v13, &qword_100026D40);
    if (sub_100014BF0(v22, 1, v3) == 1)
    {
      sub_100014EB0((uint64_t)v16, &qword_100026D40);
      sub_100014EB0((uint64_t)v18, &qword_100026D40);
      (*(void (**)(char *, uint64_t))(v21 + 8))(v13, v3);
      char v25 = 0;
      uint64_t v24 = &qword_100026D60;
    }
    else
    {
      unint64_t v26 = v30;
      (*(void (**)(char *, uint64_t, uint64_t))(v21 + 32))(v30, v22, v3);
      sub_100014F08(&qword_100026D68);
      char v25 = dispatch thunk of static Equatable.== infix(_:_:)();
      os_log_type_t v27 = *(void (**)(char *, uint64_t))(v21 + 8);
      v27(v26, v3);
      uint64_t v24 = &qword_100026D40;
      sub_100014EB0((uint64_t)v16, &qword_100026D40);
      sub_100014EB0((uint64_t)v18, &qword_100026D40);
      v27(v13, v3);
    }
  }
  sub_100014EB0((uint64_t)v9, v24);
  return v25 & 1;
}

uint64_t sub_10000D364(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62)
  {
LABEL_14:
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v7 = 0;
  if (v6)
  {
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        uint64_t v8 = *(void *)(a3 + 8 * v7 + 32);
        swift_retain();
      }
      uint64_t v12 = v8;
      char v9 = a1(&v12);
      swift_release();
      if (v3 || (v9 & 1) != 0) {
        break;
      }
      uint64_t v10 = v7 + 1;
      if (__OFADD__(v7, 1))
      {
        __break(1u);
        goto LABEL_14;
      }
      ++v7;
      if (v10 == v6) {
        return 0;
      }
    }
  }
  return v7;
}

uint64_t sub_10000D484(unint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v1 = v3;
  if (!result || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
  {
    uint64_t result = sub_100014B84(v3);
    unint64_t v3 = result;
    unint64_t *v1 = result;
  }
  uint64_t v5 = v3 & 0xFFFFFFFFFFFFFF8;
  unint64_t v6 = *(void *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    unint64_t v7 = v6 - 1;
    uint64_t v8 = v6 - 1 - a1;
    uint64_t v9 = v5 + 8 * a1;
    uint64_t v10 = *(void *)(v9 + 32);
    sub_1000126F0((char *)(v9 + 40), v8, (char *)(v9 + 32));
    *(void *)(v5 + 16) = v7;
    specialized Array._endMutation()();
    return v10;
  }
  return result;
}

uint64_t sub_10000D510(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_10000D560(unint64_t a1)
{
  char v2 = a1;
  if ((sub_100012068(a1) & 1) == 0)
  {
    uint64_t v3 = 2;
    uint64_t v4 = 3;
    if ((v2 & 0x10) == 0) {
      uint64_t v4 = 4;
    }
    uint64_t v5 = 3;
    if ((~v2 & 0x18) != 0) {
      uint64_t v5 = v4;
    }
    if ((v2 & 4) == 0) {
      uint64_t v3 = v5;
    }
    if ((v2 & 2) != 0) {
      uint64_t v6 = 1;
    }
    else {
      uint64_t v6 = v3;
    }
    if (qword_100026680 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_1000062C8(v7, (uint64_t)qword_1000270E8);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (sub_1000155E0(v9))
    {
      uint64_t v10 = sub_10001553C();
      uint64_t v18 = sub_1000154A0();
      *(_DWORD *)uint64_t v10 = 136446722;
      id v11 = [self currentDevice];
      id v12 = [v11 orientation];

      uint64_t v13 = UIDeviceOrientation.description.getter((uint64_t)v12);
      sub_100016C28(v13, v14, &v18);
      sub_1000156C8();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_1000157A0();
      uint64_t v15 = UIDeviceOrientation.description.getter(v6);
      sub_100016C28(v15, v16, &v18);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v10 + 22) = 2048;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v8, v1, "Forcing Orientation: %{public}s -> %{public}s (extension mask %lx)", (uint8_t *)v10, 0x20u);
      swift_arrayDestroy();
      sub_100006AFC();
      sub_100006AFC();
    }

    id v17 = [self currentDevice];
    [v17 setOrientation:v6 animated:0];
  }
}

void sub_10000D7AC()
{
  uint64_t v2 = v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions;
  sub_100015414();
  sub_100015888();
  if (!v3)
  {
    sub_1000156AC();
    if (v1) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    char v5 = 0;
    goto LABEL_9;
  }
  sub_1000155C0();
  uint64_t v1 = _CocoaArrayWrapper.endIndex.getter();
  if (!v1) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    uint64_t v1 = sub_1000157D4();
    goto LABEL_6;
  }
  sub_10001587C();
  if (v4)
  {
    sub_100015858();
LABEL_6:
    swift_bridgeObjectRelease();
    char v5 = *(unsigned char *)(v1 + 64);
    swift_release();
LABEL_9:
    sub_10000F434(v5);
    return;
  }
  __break(1u);
}

void sub_10000D860()
{
  uint64_t v2 = v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions;
  sub_100015414();
  sub_100015888();
  if (!v3)
  {
    sub_1000156AC();
    if (v1) {
      goto LABEL_3;
    }
LABEL_8:
    swift_bridgeObjectRelease();
    uint64_t v5 = 0;
    goto LABEL_9;
  }
  sub_1000155C0();
  uint64_t v1 = _CocoaArrayWrapper.endIndex.getter();
  if (!v1) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    uint64_t v1 = sub_1000157D4();
    goto LABEL_6;
  }
  sub_10001587C();
  if (v4)
  {
    sub_100015858();
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v5 = *(void *)(v1 + 72);
    swift_release();
LABEL_9:
    sub_10000F554(v5);
    return;
  }
  __break(1u);
}

void sub_10000D914()
{
  sub_1000153FC();
  os_log_type_t v63 = (void *)v0;
  uint64_t v2 = v1;
  uint64_t v3 = type metadata accessor for Logger();
  sub_100006A48();
  uint64_t v67 = v4;
  __chkstk_darwin(v5);
  sub_10001572C();
  id v68 = v6;
  uint64_t v7 = sub_10000646C(&qword_100026D40);
  uint64_t v8 = sub_100015560(v7);
  __chkstk_darwin(v8);
  uint64_t v9 = sub_1000155FC();
  sub_100006A48();
  uint64_t v11 = v10;
  uint64_t v13 = __chkstk_darwin(v12);
  v61 = (char *)v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v60[3] = v16;
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)v60 - v17;
  int v65 = SBSGetScreenLockStatus();
  uint64_t v19 = v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  sub_100015448();
  sub_100014C1C(v19, v0, &qword_100026D40);
  sub_100015838(v0);
  if (v20)
  {
    if (qword_100026688 != -1) {
      swift_once();
    }
    sub_1000062C8(v9, (uint64_t)qword_100026A30);
    sub_100015820();
    sub_100015484();
    v21();
    sub_100014EB0(v0, &qword_100026D40);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v18, v0, v9);
  }
  if (qword_100026680 != -1) {
    swift_once();
  }
  sub_1000062C8(v3, (uint64_t)qword_1000270E8);
  sub_100015484();
  v22();
  sub_100015820();
  v60[1] = v24;
  v60[2] = v23;
  sub_100015484();
  v25();
  swift_retain();
  uint64_t v26 = Logger.logObject.getter();
  uint64_t v64 = v3;
  os_log_type_t v27 = v26;
  uint64_t v28 = v9;
  os_log_type_t v29 = static os_log_type_t.default.getter();
  BOOL v30 = os_log_type_enabled(v27, v29);
  uint64_t v62 = v2;
  if (v30)
  {
    uint64_t v31 = sub_10001553C();
    v60[0] = swift_slowAlloc();
    uint64_t v71 = v60[0];
    *(_DWORD *)uint64_t v31 = 136446722;
    uint64_t v66 = v18;
    uint64_t v69 = v11;
    uint64_t v33 = *(void *)(v2 + 16);
    unint64_t v32 = *(void *)(v2 + 24);
    swift_bridgeObjectRetain();
    uint64_t v70 = sub_100016C28(v33, v32, &v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    sub_1000157A0();
    uint64_t v34 = UUID.uuidString.getter();
    uint64_t v70 = sub_100016C28(v34, v35, &v71);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v36 = *(void (**)(void))(v69 + 8);
    sub_100015554();
    v36();
    *(_WORD *)(v31 + 22) = 2082;
    int v37 = v65;
    if (v65) {
      uint64_t v38 = 0x64656B636F4CLL;
    }
    else {
      uint64_t v38 = 0x64656B636F6C6E55;
    }
    if (v65) {
      unint64_t v39 = 0xE600000000000000;
    }
    else {
      unint64_t v39 = 0xE800000000000000;
    }
    uint64_t v70 = sub_100016C28(v38, v39, &v71);
    uint64_t v18 = v66;
    uint64_t v11 = v69;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v29, "Launching Service Extension '%{public}s' %{public}s (Screen %{public}s)", (uint8_t *)v31, 0x20u);
    swift_arrayDestroy();
    sub_100006AFC();
    sub_100006AFC();

    sub_100015678();
    v40();
    if (!v37) {
      goto LABEL_18;
    }
  }
  else
  {
    swift_release();
    uint64_t v36 = *(void (**)(void))(v11 + 8);
    sub_100015554();
    v36();

    sub_100015754();
    v41();
    if (!v65)
    {
LABEL_18:
      id v68 = [objc_allocWithZone((Class)FBSOpenApplicationService) init];
      uint64_t v69 = v11;
      sub_1000065E4(0, &qword_100026D50);
      sub_10000646C(&qword_100026D58);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10001A9F0;
      uint64_t v71 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v72 = v43;
      sub_100015780();
      uint64_t v66 = v18;
      *(void *)(inited + 96) = &type metadata for Bool;
      *(unsigned char *)(inited + 72) = 0;
      uint64_t v71 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v72 = v44;
      sub_100015780();
      *(void *)(inited + 168) = &type metadata for Bool;
      *(unsigned char *)(inited + 144) = 1;
      uint64_t v45 = Dictionary.init(dictionaryLiteral:)();
      id v46 = sub_100010734(v45);
      NSString v47 = String._bridgeToObjectiveC()();
      BOOL v48 = v61;
      sub_100015484();
      v49();
      unint64_t v50 = (*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
      uint64_t v51 = swift_allocObject();
      uint64_t v52 = v62;
      unint64_t v53 = v63;
      *(void *)(v51 + 16) = v63;
      *(void *)(v51 + 24) = v52;
      uint64_t v54 = v69 + 32;
      (*(void (**)(unint64_t, char *, uint64_t))(v69 + 32))(v51 + v50, v48, v28);
      id v75 = sub_100014DF0;
      uint64_t v76 = v51;
      uint64_t v71 = (uint64_t)_NSConcreteStackBlock;
      uint64_t v72 = 1107296256;
      unint64_t v73 = sub_100010A1C;
      id v74 = &unk_100020F08;
      char v55 = _Block_copy(&v71);
      swift_retain();
      id v56 = v53;
      swift_release();
      uint64_t v57 = v68;
      v58 = (void *)sub_10001582C();
      [v58 v59];
      _Block_release(v55);

      uint64_t v36 = *(void (**)(void))(v54 - 24);
    }
  }
  sub_100015554();
  v36();
  sub_100015430();
}

void sub_10000E034(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_21;
  }
  uint64_t v3 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        id v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if (!*(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        id v4 = *(id *)(a2 + 32);
      }
      uint64_t v5 = v4;
      sub_1000065E4(0, &qword_100026D30);
      char v6 = static NSObject.== infix(_:_:)();

      if ((v6 & 1) == 0)
      {
        for (uint64_t i = 0; ; ++i)
        {
          unint64_t v8 = i + 1;
          if (__OFADD__(i, 1)) {
            break;
          }
          if (v8 == v3) {
            return;
          }
          if ((a2 & 0xC000000000000001) != 0)
          {
            id v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if ((v8 & 0x8000000000000000) != 0) {
              goto LABEL_19;
            }
            if (v8 >= *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_20;
            }
            id v9 = *(id *)(a2 + 32 + 8 * v8);
          }
          uint64_t v10 = v9;
          char v11 = static NSObject.== infix(_:_:)();

          if (v11) {
            return;
          }
        }
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        swift_bridgeObjectRetain();
        uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v3) {
          continue;
        }
      }
      return;
    }
  }
}

void sub_10000E1D0()
{
  sub_1000153FC();
  uint64_t v2 = v1;
  uint64_t v3 = sub_10000646C(&qword_100026D38);
  uint64_t v4 = sub_100015560(v3);
  __chkstk_darwin(v4);
  sub_100015594();
  uint64_t v87 = v5;
  sub_100015870();
  __chkstk_darwin(v6);
  id v90 = (void *)((char *)v76 - v7);
  uint64_t v8 = sub_10000646C(&qword_100026D40);
  uint64_t v9 = sub_100015560(v8);
  __chkstk_darwin(v9);
  sub_10001572C();
  char v93 = v10;
  uint64_t v11 = type metadata accessor for UUID();
  sub_100006A48();
  uint64_t v86 = v12;
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v16 = (char *)v76 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (void (**)(void))((char *)v76 - v18);
  __chkstk_darwin(v17);
  uint64_t v89 = (void (**)(void (**)(void), uint64_t *, uint64_t))((char *)v76 - v20);
  sub_100015870();
  __chkstk_darwin(v21);
  uint64_t v22 = (uint64_t *)(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  sub_100015448();
  if ((unint64_t)*v22 >> 62)
  {
LABEL_66:
    swift_bridgeObjectRetain();
    uint64_t v23 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v23 = *(void *)((*v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v23)
  {
    uint64_t v24 = v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices;
    sub_100015448();
    if (!*(void *)(*(void *)v24 + 16))
    {
      sub_10000D7AC();
      sub_10000D860();
      sub_10000AC14(v2);
LABEL_64:
      sub_100015430();
      return;
    }
  }
  uint64_t v2 = *v22;
  if ((unint64_t)*v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v25 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v25 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v26 = v87;
  uint64_t v27 = v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager_pendingActiveServices;
  sub_100015414();
  v76[0] = v27;
  uint64_t v28 = *(void *)(*(void *)v27 + 16);
  uint64_t v29 = v25 + v28;
  if (__OFADD__(v25, v28))
  {
    __break(1u);
  }
  else if (qword_100026680 == -1)
  {
    goto LABEL_9;
  }
  swift_once();
LABEL_9:
  uint64_t v30 = type metadata accessor for Logger();
  uint64_t v92 = sub_1000062C8(v30, (uint64_t)qword_1000270E8);
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.default.getter();
  BOOL v33 = sub_1000155E0(v32);
  uint64_t v91 = v11;
  if (v33)
  {
    uint64_t v2 = sub_10001556C();
    *(_DWORD *)uint64_t v2 = 134217984;
    uint64_t v11 = v91;
    v95[1] = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v31, (os_log_type_t)v25, "Continuing with %ld Active Services", (uint8_t *)v2, 0xCu);
    sub_100006AFC();
  }

  uint64_t v0 = *v22;
  if ((unint64_t)*v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v34 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v34 = *(void *)((v0 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  char v94 = v16;
  if (v34)
  {
    uint64_t v35 = *v22;
    if ((unint64_t)*v22 >> 62)
    {
      sub_1000154E8();
      uint64_t v0 = _CocoaArrayWrapper.endIndex.getter();
    }
    else
    {
      sub_100015690();
    }
    uint64_t v37 = (uint64_t)v93;
    if (v0)
    {
      if (v0 < 1)
      {
        __break(1u);
        goto LABEL_73;
      }
      uint64_t v38 = 0;
      id v83 = (char *)(v35 & 0xC000000000000001);
      uint64_t v78 = v86 + 32;
      id v81 = (void (**)(void))(v86 + 8);
      uint64_t v82 = (void (**)(void))(v86 + 16);
      unint64_t v80 = (v86 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
      *(void *)&long long v36 = 136446466;
      long long v77 = v36;
      v76[1] = (char *)&type metadata for Any + 8;
      unint64_t v88 = v19;
      uint64_t v85 = v35;
      *(void *)&long long v84 = v0;
      do
      {
        if (v83)
        {
          uint64_t v2 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          uint64_t v2 = *(void *)(v35 + 8 * v38 + 32);
          swift_retain();
        }
        uint64_t v39 = v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
        sub_100015448();
        sub_100014C1C(v39, v37, &qword_100026D40);
        sub_100015838(v37);
        if (v40)
        {
          if (qword_100026688 != -1) {
            swift_once();
          }
          sub_1000062C8(v11, (uint64_t)qword_100026A30);
          uint64_t v42 = *v82;
          sub_10001582C();
          sub_100015484();
          v42();
          sub_100014EB0(v37, &qword_100026D40);
        }
        else
        {
          sub_100015720();
          v41();
          uint64_t v42 = *v82;
        }
        sub_100015720();
        v42();
        swift_retain_n();
        uint64_t v43 = Logger.logObject.getter();
        os_log_type_t v44 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v43, v44))
        {
          uint64_t v45 = sub_1000154B8();
          uint64_t v79 = sub_1000154A0();
          v95[0] = v79;
          *(_DWORD *)uint64_t v45 = v77;
          uint64_t v47 = *(void *)(v2 + 16);
          unint64_t v46 = *(void *)(v2 + 24);
          swift_bridgeObjectRetain();
          *(void *)(v45 + 4) = sub_100016C28(v47, v46, v95);
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v45 + 12) = 2082;
          uint64_t v48 = UUID.uuidString.getter();
          *(void *)(v45 + 14) = sub_100016C28(v48, v49, v95);
          swift_bridgeObjectRelease();
          uint64_t v0 = (uint64_t)v81;
          unint64_t v50 = *v81;
          sub_100015490();
          v50();
          _os_log_impl((void *)&_mh_execute_header, v43, v44, "- Service Extension '%{public}s' %{public}s Active", (uint8_t *)v45, 0x16u);
          swift_arrayDestroy();
          sub_100006AFC();
          uint64_t v26 = v87;
          sub_100006AFC();
          swift_release();
        }
        else
        {

          uint64_t v0 = (uint64_t)v81;
          unint64_t v50 = *v81;
          sub_100015490();
          v50();
          swift_release_n();
        }
        sub_100015490();
        v50();
        ++v38;
        uint64_t v19 = v88;
        uint64_t v11 = v91;
        uint64_t v35 = v85;
        uint64_t v37 = (uint64_t)v93;
        uint64_t v16 = v94;
      }
      while ((void)v84 != v38);
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v51 = *(void *)v76[0];
  if (!*(void *)(*(void *)v76[0] + 16)) {
    goto LABEL_64;
  }
  uint64_t v52 = *(void *)(v51 + 64);
  id v81 = (void (**)(void))(v51 + 64);
  uint64_t v53 = 1 << *(unsigned char *)(v51 + 32);
  uint64_t v54 = -1;
  if (v53 < 64) {
    uint64_t v54 = ~(-1 << v53);
  }
  unint64_t v55 = v54 & v52;
  char v93 = (void (**)(char *, char *, uint64_t))(v86 + 16);
  unint64_t v88 = (void (**)(void))(v86 + 8);
  uint64_t v89 = (void (**)(void (**)(void), uint64_t *, uint64_t))(v86 + 32);
  uint64_t v82 = (void (**)(void))((unint64_t)(v53 + 63) >> 6);
  unint64_t v80 = (unint64_t)v82 - 1;
  uint64_t v85 = v51;
  swift_bridgeObjectRetain();
  uint64_t v91 = 0;
  *(void *)&long long v56 = 136446466;
  long long v84 = v56;
  id v83 = (char *)&type metadata for Any + 8;
  while (1)
  {
    uint64_t v22 = v90;
    if (v55)
    {
      unint64_t v57 = __clz(__rbit64(v55));
      v55 &= v55 - 1;
      unint64_t v58 = v57 | (v91 << 6);
LABEL_38:
      uint64_t v59 = v85;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v86 + 16))(v26, *(void *)(v85 + 48) + *(void *)(v86 + 72) * v58, v11);
      uint64_t v60 = *(void *)(v59 + 56);
      uint64_t v61 = sub_10000646C(&qword_100026D48);
      *(void *)(v26 + *(int *)(v61 + 48)) = *(void *)(v60 + 8 * v58);
      sub_1000126C8(v26, 0, 1, v61);
      swift_retain();
      goto LABEL_57;
    }
    uint64_t v62 = v91 + 1;
    if (__OFADD__(v91, 1))
    {
      __break(1u);
      goto LABEL_66;
    }
    if (v62 < (uint64_t)v82)
    {
      unint64_t v63 = (unint64_t)v81[v62];
      if (v63) {
        goto LABEL_42;
      }
      uint64_t v64 = v91 + 2;
      ++v91;
      if (v62 + 1 < (uint64_t)v82)
      {
        unint64_t v63 = (unint64_t)v81[v64];
        if (v63) {
          goto LABEL_45;
        }
        uint64_t v91 = v62 + 1;
        if (v62 + 2 < (uint64_t)v82)
        {
          unint64_t v63 = (unint64_t)v81[v62 + 2];
          if (v63)
          {
            v62 += 2;
            goto LABEL_42;
          }
          uint64_t v64 = v62 + 3;
          uint64_t v91 = v62 + 2;
          if (v62 + 3 < (uint64_t)v82) {
            break;
          }
        }
      }
    }
LABEL_56:
    uint64_t v65 = sub_10000646C(&qword_100026D48);
    sub_1000126C8(v26, 1, 1, v65);
    unint64_t v55 = 0;
LABEL_57:
    sub_100014C80(v26, (uint64_t)v22);
    uint64_t v66 = sub_10000646C(&qword_100026D48);
    if (sub_100014BF0((uint64_t)v22, 1, v66) == 1)
    {
      swift_release();
      goto LABEL_64;
    }
    uint64_t v2 = *(uint64_t *)((char *)v22 + *(int *)(v66 + 48));
    (*v89)(v19, v22, v11);
    (*v93)(v16, (char *)v19, v11);
    swift_retain_n();
    uint64_t v67 = Logger.logObject.getter();
    id v68 = v19;
    os_log_type_t v69 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v67, v69))
    {
      uint64_t v70 = sub_1000154B8();
      v95[0] = sub_1000154A0();
      *(_DWORD *)uint64_t v70 = v84;
      uint64_t v71 = *(void *)(v2 + 16);
      unint64_t v72 = *(void *)(v2 + 24);
      swift_bridgeObjectRetain();
      *(void *)(v70 + 4) = sub_100016C28(v71, v72, v95);
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v70 + 12) = 2082;
      uint64_t v73 = UUID.uuidString.getter();
      *(void *)(v70 + 14) = sub_100016C28(v73, v74, v95);
      swift_bridgeObjectRelease();
      uint64_t v0 = (uint64_t)v88;
      id v75 = *v88;
      sub_100015490();
      v75();
      _os_log_impl((void *)&_mh_execute_header, v67, v69, "- Service Extension '%{public}s' %{public}s Loaded", (uint8_t *)v70, 0x16u);
      swift_arrayDestroy();
      uint64_t v16 = v94;
      sub_100006AFC();
      uint64_t v26 = v87;
      sub_100006AFC();
      swift_release();
    }
    else
    {

      uint64_t v0 = (uint64_t)v88;
      id v75 = *v88;
      sub_100015490();
      v75();
      swift_release_n();
    }
    sub_100015490();
    v75();
    uint64_t v19 = v68;
  }
  unint64_t v63 = (unint64_t)v81[v64];
  if (v63)
  {
LABEL_45:
    uint64_t v62 = v64;
LABEL_42:
    unint64_t v55 = (v63 - 1) & v63;
    unint64_t v58 = __clz(__rbit64(v63)) + (v62 << 6);
    uint64_t v91 = v62;
    goto LABEL_38;
  }
  while (1)
  {
    uint64_t v62 = v64 + 1;
    if (__OFADD__(v64, 1)) {
      break;
    }
    if (v62 >= (uint64_t)v82)
    {
      uint64_t v91 = v80;
      goto LABEL_56;
    }
    unint64_t v63 = (unint64_t)v81[v62];
    ++v64;
    if (v63) {
      goto LABEL_42;
    }
  }
LABEL_73:
  __break(1u);
}

uint64_t sub_10000ED4C()
{
  unint64_t v1 = v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions;
  uint64_t result = sub_100015414();
  if (*(void *)v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((*(void *)v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v3 >= 1)
  {
    if (qword_100026680 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_1000062C8(v4, (uint64_t)qword_1000270E8);
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled((os_log_t)v5, v6))
    {
      uint64_t v7 = (uint8_t *)sub_10001556C();
      *(_DWORD *)uint64_t v7 = 134217984;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v5, v6, "Canceling %ld Services", v7, 0xCu);
      sub_100006AFC();
    }

    sub_100015888();
    if (v8)
    {
      sub_1000154E8();
      uint64_t result = _CocoaArrayWrapper.endIndex.getter();
      uint64_t v5 = result;
      if (result) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t result = sub_100015690();
      if (v5)
      {
LABEL_10:
        if (v5 < 1)
        {
          __break(1u);
          return result;
        }
        for (uint64_t i = 0; i != v5; ++i)
        {
          if ((v1 & 0xC000000000000001) != 0)
          {
            sub_100015684();
            uint64_t v10 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            uint64_t v10 = *(void *)(v1 + 8 * i + 32);
            swift_retain();
          }
          uint64_t v11 = *(void **)(v10 + 56);
          if (v11
            && (id v12 = v11,
                id v13 = [v12 serviceViewControllerProxy],
                v12,
                swift_unknownObjectRelease(),
                v13))
          {
            [v13 sidecarServiceCancel];
            swift_release();
            swift_unknownObjectRelease();
          }
          else
          {
            swift_release();
          }
        }
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_10000EFA0(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 56);
  if (v2)
  {
    uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController);
    id v8 = v2;
    id v4 = [v3 topViewController];
    if (v4)
    {
      uint64_t v5 = v4;
      sub_1000065E4(0, &qword_100026D30);
      id v6 = v8;
      id v7 = v5;
      LOBYTE(v5) = static NSObject.== infix(_:_:)();

      if (v5) {
        sub_10000D560((unint64_t)[v6 supportedInterfaceOrientations]);
      }
    }
  }
}

void sub_10000F094(uint64_t a1, char a2)
{
  *(unsigned char *)(a1 + 80) = a2 ^ 1;
  sub_10000F0A0();
}

void sub_10000F0A0()
{
  sub_1000153FC();
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006A48();
  __chkstk_darwin(v3);
  id v4 = (uint64_t *)(v0 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  sub_100015448();
  uint64_t v5 = *v4;
  if (!((unint64_t)*v4 >> 62))
  {
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6) {
      goto LABEL_3;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v5 = 0;
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
  if (!v6) {
    goto LABEL_17;
  }
LABEL_3:
  if ((v5 & 0xC000000000000001) != 0)
  {
    uint64_t v6 = specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_6:
    swift_bridgeObjectRelease();
    int v1 = *(unsigned __int8 *)(v6 + 80);
    uint64_t v5 = v1 ^ 1u;
    if (qword_100026680 == -1) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
  if (*(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v6 = *(void *)(v5 + 32);
    swift_retain();
    goto LABEL_6;
  }
  __break(1u);
LABEL_22:
  swift_once();
LABEL_7:
  sub_1000062C8(v2, (uint64_t)qword_1000270E8);
  sub_100015484();
  v7();
  swift_retain();
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = sub_1000154B8();
    v18[0] = sub_1000154A0();
    *(_DWORD *)uint64_t v10 = 136446466;
    unsigned int v17 = v5;
    uint64_t v12 = *(void *)(v6 + 16);
    unint64_t v11 = *(void *)(v6 + 24);
    swift_bridgeObjectRetain();
    sub_100016C28(v12, v11, v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2082;
    if (v1) {
      uint64_t v13 = 0x6465776F6C6C41;
    }
    else {
      uint64_t v13 = 0x64656C6261736944;
    }
    if (v1) {
      unint64_t v14 = 0xE700000000000000;
    }
    else {
      unint64_t v14 = 0xE800000000000000;
    }
    sub_100016C28(v13, v14, v18);
    uint64_t v5 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Service %{public}s %{public}s Sleep", (uint8_t *)v10, 0x16u);
    sub_100015800();
    sub_100006AFC();
    sub_100006AFC();
    swift_release();

    sub_100015678();
    v15();
  }
  else
  {

    swift_release_n();
    sub_100015894();
    v16();
  }
LABEL_18:
  if (UIApp)
  {
    [UIApp setIdleTimerDisabled:v5];
    sub_100015430();
  }
  else
  {
    __break(1u);
  }
}

id sub_10000F3F8(id result)
{
  if (*(unsigned char *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__wantsVolumeButtonEvents) != (result & 1))
  {
    uint64_t result = (id)UIApp;
    if (UIApp) {
      return [UIApp setWantsVolumeButtonEvents:];
    }
    else {
      __break(1u);
    }
  }
  return result;
}

id sub_10000F434(char a1)
{
  uint64_t v2 = (void *)*(unsigned __int8 *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__wantsVolumeButtonEvents);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__wantsVolumeButtonEvents) = a1;
  return sub_10000F3F8(v2);
}

void sub_10000F44C(uint64_t a1)
{
  uint64_t v2 = OBJC_IVAR____TtC7Sidecar14ServiceManager__backgroundStyle;
  if (*(void *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__backgroundStyle) == a1) {
    return;
  }
  if (!UIApp)
  {
    __break(1u);
    goto LABEL_10;
  }
  [UIApp _setBackgroundStyle:];
  id v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController), "view"));
  if (!v3)
  {
LABEL_10:
    __break(1u);
    return;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)(v1 + v2);
  uint64_t v6 = self;
  id v7 = &selRef_blackColor;
  if (v5) {
    id v7 = &selRef_clearColor;
  }
  id v8 = [v6 *v7];
  [v4 setBackgroundColor:v8];
}

void sub_10000F554(uint64_t a1)
{
  uint64_t v2 = *(void *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__backgroundStyle);
  *(void *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__backgroundStyle) = a1;
  sub_10000F44C(v2);
}

uint64_t sub_10000F56C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (void *)(v3 + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig);
  uint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig);
  uint64_t v6 = *(void *)(v3 + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig + 8);
  void *v4 = a1;
  v4[1] = a2;
  v4[2] = a3;
  return sub_100012640(v5, v6);
}

void sub_10000F598()
{
  uint64_t v1 = v0;
  if (qword_100026680 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000062C8(v2, (uint64_t)qword_1000270E8);
  uint64_t v3 = (void *)Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (sub_1000156E0(v4))
  {
    uint64_t v5 = (_DWORD *)sub_10001556C();
    v20[0] = sub_10001553C();
    *uint64_t v5 = 136446210;
    sub_100016C28(0xD000000000000018, 0x800000010001B2A0, v20);
    sub_1000157C0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_1000158E0((void *)&_mh_execute_header, v6, v7, "%{public}s");
    swift_arrayDestroy();
    sub_100006AFC();
    sub_100006AFC();
  }

  Notification.object.getter();
  if (!v20[3])
  {
    sub_100014EB0((uint64_t)v20, &qword_100026820);
    return;
  }
  sub_1000065E4(0, &qword_100026D28);
  if (swift_dynamicCast())
  {
    id v8 = [v19 displayIdentity];
    if (!v8)
    {
      __break(1u);
LABEL_19:
      __break(1u);
      return;
    }
    os_log_type_t v9 = v8;
    unsigned int v10 = [v8 expectsSecureRendering];

    if (v10)
    {
      id v11 = v19;
      sub_100008074((uint64_t)v19);
      uint64_t v12 = Logger.logObject.getter();
      os_log_type_t v13 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v12, v13))
      {
        unint64_t v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, v13, "Moving window to Secure Screen", v14, 2u);
        sub_100006AFC();
      }

      uint64_t v15 = *(void **)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager_window);
      [v15 setScreen:v11];
      [v15 makeKeyAndVisible];
      if ((sub_100008088() & 1) == 0) {
        goto LABEL_14;
      }
      id v16 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                                  + OBJC_IVAR____TtC7Sidecar14ServiceManager__baseViewController), "view"));
      if (v16)
      {
        unsigned int v17 = v16;
        id v18 = [self redColor];
        [v17 setBackgroundColor:v18];

LABEL_14:
        return;
      }
      goto LABEL_19;
    }
  }
}

void sub_10000F8C4()
{
  uint64_t v1 = v0;
  if (qword_100026680 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_1000062C8(v2, (uint64_t)qword_1000270E8);
  uint64_t v3 = (void *)Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (sub_1000155E0(v4))
  {
    uint64_t v5 = (_DWORD *)sub_10001556C();
    v17[0] = sub_10001553C();
    *uint64_t v5 = 136446210;
    sub_100016C28(0xD00000000000001BLL, 0x800000010001B280, v17);
    sub_1000157C0();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    sub_1000158C0((void *)&_mh_execute_header, v6, v7, "%{public}s");
    swift_arrayDestroy();
    sub_100006AFC();
    sub_100006AFC();
  }

  Notification.object.getter();
  if (v17[3])
  {
    sub_1000065E4(0, &qword_100026D28);
    if (swift_dynamicCast())
    {
      id v8 = [v16 displayIdentity];
      if (v8)
      {
        os_log_type_t v9 = v8;
        unsigned int v10 = [v8 expectsSecureRendering];

        if (!v10) {
          goto LABEL_12;
        }
        sub_100008074(0);
        id v11 = *(void **)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager_window);
        id v12 = [self mainScreen];
        [v11 setScreen:v12];

        if ((sub_100008088() & 1) == 0) {
          goto LABEL_12;
        }
        id v13 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                                    + OBJC_IVAR____TtC7Sidecar14ServiceManager__baseViewController), "view"));
        if (v13)
        {
          unint64_t v14 = v13;
          id v15 = [self greenColor];
          [v14 setBackgroundColor:v15];

LABEL_12:
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
  else
  {
    sub_100014EB0((uint64_t)v17, &qword_100026820);
  }
}

uint64_t sub_10000FB8C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  type metadata accessor for Notification();
  sub_100006A48();
  __chkstk_darwin(v7);
  sub_100006AC4();
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  id v8 = a1;
  a4(v4);

  sub_100015894();
  return v9();
}

void sub_10000FC40()
{
  if (qword_100026680 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000062C8(v0, (uint64_t)qword_1000270E8);
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 136446210;
    sub_100016C28(0xD00000000000001FLL, 0x800000010001B260, &v4);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "%{public}s", v2, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
}

void sub_10000FEEC()
{
  sub_1000153FC();
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = v0;
  uint64_t v12 = v11;
  uint64_t v13 = sub_10000646C((uint64_t *)&unk_100026D18);
  uint64_t v14 = sub_100015560(v13);
  __chkstk_darwin(v14);
  sub_100006AC4();
  if (qword_100026680 != -1) {
    swift_once();
  }
  uint64_t v15 = type metadata accessor for Logger();
  sub_1000062C8(v15, (uint64_t)qword_1000270E8);
  id v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v38 = v10;
    id v18 = (uint8_t *)sub_10001556C();
    uint64_t v39 = sub_10001553C();
    *(_DWORD *)id v18 = 136446210;
    uint64_t v19 = sub_100016C28(v9, v7, &v39);
    sub_1000157AC(v19);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%{public}s", v18, 0xCu);
    swift_arrayDestroy();
    sub_100006AFC();
    uint64_t v10 = v38;
    sub_100006AFC();
  }

  sub_100014C1C(v12, v1, (uint64_t *)&unk_100026D18);
  uint64_t v20 = type metadata accessor for Notification();
  if (sub_100014BF0(v1, 1, v20) == 1)
  {
    sub_100014EB0(v1, (uint64_t *)&unk_100026D18);
    char v21 = 0;
  }
  else
  {
    uint64_t v22 = (void *)Notification.name.getter();
    sub_100015678();
    v23();
    uint64_t v24 = *v5;
    uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v27 = v26;
    if (v25 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v27 == v28) {
      char v21 = 1;
    }
    else {
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    id v30 = v24;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  uint64_t v31 = (uint64_t *)(v10 + OBJC_IVAR____TtC7Sidecar14ServiceManager__activeExtensions);
  sub_100015414();
  uint64_t v32 = *v31;
  if (!((unint64_t)*v31 >> 62))
  {
    uint64_t v33 = *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v33) {
      goto LABEL_16;
    }
LABEL_23:
    swift_bridgeObjectRelease();
LABEL_24:
    sub_100015430();
    return;
  }
  swift_bridgeObjectRetain();
  if (!_CocoaArrayWrapper.endIndex.getter()) {
    goto LABEL_23;
  }
LABEL_16:
  if ((v32 & 0xC000000000000001) != 0)
  {
    uint64_t v34 = specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_19:
    swift_bridgeObjectRelease();
    uint64_t v35 = *(void **)(v34 + 56);
    id v36 = v35;
    swift_release();
    if (v35)
    {
      id v37 = [v36 serviceViewControllerProxy];

      swift_unknownObjectRelease();
      if (v37)
      {
        [v37 *v3 v21 & 1];
        swift_unknownObjectRelease();
      }
    }
    goto LABEL_24;
  }
  if (*(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    uint64_t v34 = *(void *)(v32 + 32);
    swift_retain();
    goto LABEL_19;
  }
  __break(1u);
}

uint64_t sub_1000102C0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10000646C((uint64_t *)&unk_100026D18);
  uint64_t v6 = sub_100015560(v5);
  __chkstk_darwin(v6);
  sub_100015584();
  uint64_t v9 = v8 - v7;
  if (a3)
  {
    static Notification._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for Notification();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = type metadata accessor for Notification();
    uint64_t v11 = 1;
  }
  sub_1000126C8(v9, v11, 1, v10);
  id v12 = a1;
  sub_100015720();
  sub_10000FEEC();

  return sub_100014EB0(v9, (uint64_t *)&unk_100026D18);
}

void sub_1000103BC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager_window);
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__secureScreen);
  if (v5)
  {
    id v6 = *(id *)(v1 + OBJC_IVAR____TtC7Sidecar14ServiceManager__secureScreen);
  }
  else
  {
    id v6 = [self mainScreen];
    uint64_t v5 = 0;
  }
  id v7 = v5;
  [v4 setScreen:v6];

  uint64_t v8 = *(void **)(a1 + 56);
  if (!v8) {
    goto LABEL_27;
  }
  uint64_t v9 = *(void **)(v2 + OBJC_IVAR____TtC7Sidecar14ServiceManager_navigationController);
  id v27 = v8;
  id v10 = [v9 viewControllers];
  sub_1000065E4(0, &qword_100026D30);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v12 = _CocoaArrayWrapper.endIndex.getter();
  }
  else
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  sub_10000F56C(1, (uint64_t)nullsub_1, 0);
  id v13 = [v27 supportedInterfaceOrientations];
  swift_bridgeObjectRetain();
  sub_10000E034((uint64_t)v27, v11);
  unint64_t v15 = v14;
  char v17 = v16;
  swift_bridgeObjectRelease_n();
  if (v17)
  {
    id v18 = *(void **)(a1 + 56);
    if (v18)
    {
      BOOL v19 = v12 > 1;
LABEL_15:
      id v20 = v18;
      swift_bridgeObjectRelease();
      [v9 pushViewController:v20 animated:v19];

      goto LABEL_16;
    }
    goto LABEL_28;
  }
  if (__OFSUB__(v12, 1))
  {
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  if (v15 != v12 - 1)
  {

    id v18 = *(void **)(a1 + 56);
    if (v18)
    {
      BOOL v19 = v12 > 1;
      goto LABEL_15;
    }
LABEL_29:
    __break(1u);
    return;
  }
  swift_bridgeObjectRelease();
LABEL_16:
  [v9 setNeedsStatusBarAppearanceUpdate];
  sub_10000D560((unint64_t)v13);
  SBSUndimScreen();
  sub_10000D914();
  sub_10000F56C(0, 0, 0);
  [v4 makeKeyAndVisible];
  char v21 = *(void **)(a1 + 56);
  if (v21)
  {
    id v22 = v21;
    id v23 = [v22 serviceViewControllerProxy];

    swift_unknownObjectRelease();
    if (v23)
    {
      [v23 sidecarServiceActive];
      swift_unknownObjectRelease();
    }
    uint64_t v24 = *(void **)(a1 + 56);
    if (v24)
    {
      id v25 = v24;
      id v26 = [v25 serviceViewControllerProxy];

      swift_unknownObjectRelease();
      if (v26)
      {
        [v26 sidecarServiceSetActive:1];
        swift_unknownObjectRelease();
      }
    }
  }
  sub_10000D7AC();
  sub_10000D860();
  sub_10000F0A0();
}

id sub_100010734(uint64_t a1)
{
  if (a1)
  {
    v1.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v1.super.Class isa = 0;
  }
  id v2 = [(id)swift_getObjCClassFromMetadata() optionsWithDictionary:v1.super.isa];

  return v2;
}

uint64_t sub_1000107C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    if (qword_100026680 != -1) {
      swift_once();
    }
    uint64_t v13 = sub_1000062C8(v8, (uint64_t)qword_1000270E8);
    uint64_t v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v13, v8);
    __chkstk_darwin(v14);
    *(&v15 - 2) = a4;
    *(&v15 - 1) = a5;
    swift_errorRetain();
    sub_100006B14(sub_100014E70, &v15 - 4, v12, a2);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    return swift_errorRelease();
  }
  return result;
}

uint64_t sub_100010960(Swift::String *a1)
{
  uint64_t v7 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  v2._object = (void *)0x800000010001B2C0;
  v2._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v2);
  String.append(_:)(a1[1]);
  v3._countAndFlagsBits = 8231;
  v3._object = (void *)0xE200000000000000;
  String.append(_:)(v3);
  v4._countAndFlagsBits = UUID.uuidString.getter();
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = sub_100015684();
  String.append(_:)(v5);
  return v7;
}

void sub_100010A1C(uint64_t a1, void *a2, void *a3)
{
  Swift::String v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

id sub_100010AA8(uint64_t a1, uint64_t a2)
{
  Swift::String v3 = (void *)(v2 + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig);
  Swift::String v4 = *(void (**)(uint64_t))(v2 + OBJC_IVAR____TtC7Sidecar14ServiceManager__animationConfig + 8);
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v3[2];
  if (*v3 != 1)
  {
    if (*v3 == 2)
    {
      if (a2 == 1) {
        id v6 = (objc_class *)type metadata accessor for SlideIn();
      }
      else {
        id v6 = (objc_class *)type metadata accessor for SlideOut();
      }
      goto LABEL_10;
    }
    uint64_t v7 = swift_retain();
    v4(v7);
    uint64_t v8 = sub_100015684();
    sub_100012640(v8, v9);
    return 0;
  }
  id v6 = (objc_class *)type metadata accessor for Fade();
LABEL_10:
  objc_allocWithZone(v6);
  swift_retain();
  return sub_100010BF0((uint64_t)v4, v5);
}

id sub_100010BF0(uint64_t a1, uint64_t a2)
{
  v2[OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_sentCompletion] = 0;
  Swift::String v3 = &v2[OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_completion];
  *Swift::String v3 = a1;
  v3[1] = a2;
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for Animation();
  return [super init];
}

id sub_100010C44()
{
  if ((v0[OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_sentCompletion] & 1) == 0)
  {
    NSDictionary v1 = *(void (**)(uint64_t))&v0[OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_completion];
    uint64_t v2 = swift_retain();
    v1(v2);
    swift_release();
  }
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for Animation();
  [super dealloc];
}

double sub_100010D04()
{
  return 0.25;
}

uint64_t sub_100010D5C()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_sentCompletion) = 1;
  return (*(uint64_t (**)(void))(v0 + OBJC_IVAR____TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation_completion))();
}

void sub_100010DF4()
{
}

void sub_100010E48(void *a1)
{
  id v2 = [a1 viewControllerForKey:UITransitionContextFromViewControllerKey];
  if (!v2)
  {
    __break(1u);
    goto LABEL_8;
  }
  Swift::String v3 = v2;
  id v4 = [a1 viewControllerForKey:UITransitionContextToViewControllerKey];
  if (!v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  objc_super v5 = v4;
  [a1 finalFrameForViewController:v4];
  CGFloat x = v34.origin.x;
  CGFloat y = v34.origin.y;
  CGFloat width = v34.size.width;
  CGFloat height = v34.size.height;
  CGFloat v10 = -CGRectGetHeight(v34);
  v35.origin.CGFloat x = x;
  v35.origin.CGFloat y = y;
  v35.size.CGFloat width = width;
  v35.size.CGFloat height = height;
  CGRect v36 = CGRectOffset(v35, 0.0, v10);
  double v11 = v36.origin.x;
  double v12 = v36.origin.y;
  double v13 = v36.size.width;
  double v14 = v36.size.height;
  id v15 = [v5 view];
  if (!v15)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  char v16 = v15;
  [v15 setFrame:v11, v12, v13, v14];

  id v17 = [a1 containerView];
  id v18 = [v5 view];
  if (!v18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  BOOL v19 = v18;
  id v20 = [v3 view];
  if (v20)
  {
    char v21 = v20;
    [v17 insertSubview:v19 aboveSubview:v20];

    id v22 = self;
    id v23 = (CGFloat *)swift_allocObject();
    *((void *)v23 + 2) = v5;
    v23[3] = x;
    v23[4] = y;
    v23[5] = width;
    v23[6] = height;
    uint64_t v32 = (id (*)())sub_1000125CC;
    uint64_t v33 = v23;
    uint64_t v28 = _NSConcreteStackBlock;
    uint64_t v29 = 1107296256;
    id v30 = sub_100015900;
    uint64_t v31 = &unk_100020E40;
    uint64_t v24 = _Block_copy(&v28);
    id v25 = v5;
    swift_release();
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = a1;
    uint64_t v32 = sub_10001262C;
    uint64_t v33 = (CGFloat *)v26;
    uint64_t v28 = _NSConcreteStackBlock;
    uint64_t v29 = 1107296256;
    id v30 = sub_100011174;
    uint64_t v31 = &unk_100020E90;
    id v27 = _Block_copy(&v28);
    swift_unknownObjectRetain();
    swift_release();
    [v22 animateWithDuration:v24 animations:v27 completion:0.25];
    _Block_release(v27);
    _Block_release(v24);

    return;
  }
LABEL_11:
  __break(1u);
}

uint64_t sub_100011174(uint64_t a1, uint64_t a2)
{
  Swift::String v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_1000111E0()
{
  return sub_100012030(0, type metadata accessor for SlideIn);
}

void sub_1000111FC(void *a1)
{
  id v2 = [a1 viewControllerForKey:UITransitionContextFromViewControllerKey];
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  Swift::String v3 = v2;
  id v4 = [a1 viewControllerForKey:UITransitionContextToViewControllerKey];
  if (!v4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  objc_super v5 = v4;
  [a1 initialFrameForViewController:v3];
  CGFloat x = v32.origin.x;
  CGFloat y = v32.origin.y;
  CGFloat width = v32.size.width;
  CGFloat height = v32.size.height;
  CGFloat v10 = -CGRectGetHeight(v32);
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  CGRect v34 = CGRectOffset(v33, 0.0, v10);
  CGFloat v11 = v34.origin.x;
  CGFloat v12 = v34.origin.y;
  CGFloat v13 = v34.size.width;
  CGFloat v14 = v34.size.height;
  id v15 = [a1 containerView];
  id v16 = [v5 view];
  if (!v16)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id v17 = v16;
  id v18 = [v3 view];
  if (v18)
  {
    BOOL v19 = v18;
    [v15 insertSubview:v17 belowSubview:v18];

    id v20 = self;
    char v21 = (CGFloat *)swift_allocObject();
    *((void *)v21 + 2) = v3;
    v21[3] = v11;
    void v21[4] = v12;
    v21[5] = v13;
    v21[6] = v14;
    id v30 = (id (*)())sub_1000125CC;
    uint64_t v31 = v21;
    uint64_t v26 = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    uint64_t v28 = sub_100015900;
    uint64_t v29 = &unk_100020DA0;
    id v22 = _Block_copy(&v26);
    id v23 = v3;
    swift_release();
    uint64_t v24 = swift_allocObject();
    *(void *)(v24 + 16) = a1;
    id v30 = sub_1000153B8;
    uint64_t v31 = (CGFloat *)v24;
    uint64_t v26 = _NSConcreteStackBlock;
    uint64_t v27 = 1107296256;
    uint64_t v28 = sub_100011174;
    uint64_t v29 = &unk_100020DF0;
    id v25 = _Block_copy(&v26);
    swift_unknownObjectRetain();
    swift_release();
    [v20 animateWithDuration:v22 animations:v25 completion:0.25];
    _Block_release(v25);
    _Block_release(v22);

    return;
  }
LABEL_9:
  __break(1u);
}

void sub_1000114D8(void *a1, double a2, double a3, double a4, double a5)
{
  id v9 = [a1 view];
  if (v9)
  {
    id v10 = v9;
    [v9 setFrame:a2, a3, a4, a5];
  }
  else
  {
    __break(1u);
  }
}

id sub_10001157C()
{
  return sub_100012030(0, type metadata accessor for SlideOut);
}

void sub_100011598(void *a1)
{
  id v2 = [a1 viewControllerForKey:UITransitionContextFromViewControllerKey];
  if (!v2)
  {
    __break(1u);
    goto LABEL_8;
  }
  Swift::String v3 = v2;
  id v4 = [a1 viewControllerForKey:UITransitionContextToViewControllerKey];
  if (!v4)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  objc_super v5 = v4;
  id v6 = [v4 view];
  if (!v6)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v7 = v6;
  [v6 setAlpha:0.0];

  id v8 = [a1 containerView];
  id v9 = [v5 view];
  if (!v9)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v10 = v9;
  id v11 = [v3 view];
  if (v11)
  {
    CGFloat v12 = v11;
    [v8 insertSubview:v10 belowSubview:v11];

    CGFloat v13 = self;
    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v3;
    *(void *)(v14 + 24) = v5;
    id v25 = sub_10001252C;
    uint64_t v26 = v14;
    char v21 = _NSConcreteStackBlock;
    uint64_t v22 = 1107296256;
    id v23 = sub_100015900;
    uint64_t v24 = &unk_100020D00;
    id v15 = _Block_copy(&v21);
    id v16 = v3;
    id v17 = v5;
    swift_release();
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = v16;
    *(void *)(v18 + 24) = a1;
    id v25 = sub_10001258C;
    uint64_t v26 = v18;
    char v21 = _NSConcreteStackBlock;
    uint64_t v22 = 1107296256;
    id v23 = sub_100011174;
    uint64_t v24 = &unk_100020D50;
    BOOL v19 = _Block_copy(&v21);
    id v20 = v16;
    swift_unknownObjectRetain();
    swift_release();
    [v13 animateWithDuration:v15 animations:v19 completion:0.25];
    _Block_release(v19);
    _Block_release(v15);

    return;
  }
LABEL_11:
  __break(1u);
}

void sub_100011858(void *a1, void *a2)
{
  id v3 = [a1 view];
  if (!v3)
  {
    __break(1u);
    goto LABEL_7;
  }
  id v4 = v3;
  [v3 setAlpha:0.0];

  id v5 = [a2 view];
  if (!v5)
  {
LABEL_7:
    __break(1u);
    return;
  }
  id v6 = v5;
  [v5 setAlpha:1.0];
}

id sub_1000118FC(int a1, id a2, void *a3)
{
  id result = [a2 view];
  if (result)
  {
    id v5 = result;
    [result setAlpha:1.0];

    return [a3 completeTransition:1];
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10001198C(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  swift_unknownObjectRetain();
  id v7 = a1;
  a4(a3);
  swift_unknownObjectRelease();
}

id sub_100011A04()
{
  return sub_100012030(0, type metadata accessor for Fade);
}

void sub_100011A28()
{
  id v1 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v0 setView:v1];
}

id sub_100011B34(uint64_t a1)
{
  return sub_100012030(a1, type metadata accessor for ColorUIViewController);
}

uint64_t sub_100011B88()
{
  id v1 = [v0 topViewController];
  if (!v1) {
    return 1;
  }
  id v2 = v1;
  id v3 = [v1 shouldAutorotate];

  return (uint64_t)v3;
}

uint64_t sub_100011C18()
{
  id v1 = [v0 topViewController];
  if (!v1) {
    return 30;
  }
  id v2 = v1;
  id v3 = [v1 supportedInterfaceOrientations];

  return (uint64_t)v3;
}

id sub_100011CB8()
{
  id v1 = [v0 topViewController];

  return v1;
}

id sub_100011CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (!a1)
  {
    uint64_t ObjCClassFromMetadata = 0;
    if (!a2) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  if (v3) {
LABEL_3:
  }
    uint64_t v3 = swift_getObjCClassFromMetadata();
LABEL_4:
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for ServiceNavigationController();
  return [super initWithNavigationBarClass:ObjCClassFromMetadata toolbarClass:v3];
}

id sub_100011DCC(void *a1, uint64_t (*a2)(void), SEL *a3)
{
  v8.receiver = v3;
  v8.super_class = (Class)a2();
  [super a1];

  return v6;
}

id sub_100011E6C(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t))
{
  if (a2)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    a1 = swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v10.receiver = v4;
  v10.super_class = (Class)a4(a1);
  [super initWithNibName:v7 bundle:a3];

  return v8;
}

id sub_100011F14(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t (*a5)(uint64_t))
{
  if (a3)
  {
    uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  id v10 = a4;
  return sub_100011E6C(v7, v9, a4, a5);
}

id sub_100011F88(void *a1, uint64_t (*a2)(void))
{
  v6.receiver = v2;
  v6.super_class = (Class)a2();
  id v4 = [super initWithCoder:a1];

  return v4;
}

id sub_100012018(uint64_t a1)
{
  return sub_100012030(a1, type metadata accessor for ServiceNavigationController);
}

id sub_100012030(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

uint64_t sub_100012068(unint64_t a1)
{
  if (!UIApp)
  {
    __break(1u);
    JUMPOUT(0x100012248);
  }
  id v3 = [UIApp statusBarOrientation];
  switch((unint64_t)v3)
  {
    case 1uLL:
      uint64_t v4 = (a1 & 6) != 0;
      break;
    case 2uLL:
      uint64_t v4 = (a1 >> 2) & 1;
      break;
    case 3uLL:
      uint64_t v4 = (a1 >> 3) & 1;
      break;
    case 4uLL:
      uint64_t v4 = (a1 >> 4) & 1;
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  if (qword_100026680 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_1000062C8(v5, (uint64_t)qword_1000270E8);
  objc_super v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (sub_1000156E0(v7))
  {
    uint64_t v8 = sub_1000154B8();
    uint64_t v12 = sub_10001553C();
    *(_DWORD *)uint64_t v8 = 136446466;
    uint64_t v9 = UIInterfaceOrientation.description.getter((uint64_t)v3);
    sub_100016C28(v9, v10, &v12);
    sub_1000156C8();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v8 + 12) = 2048;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v1, "Orientation: %{public}s (extension mask %lx)", (uint8_t *)v8, 0x16u);
    swift_arrayDestroy();
    sub_100006AFC();
    sub_100006AFC();
  }

  return v4;
}

uint64_t UIDeviceOrientation.description.getter(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = 0xD000000000000012;
  switch(v1)
  {
    case 0:
      uint64_t result = sub_1000155A8();
      break;
    case 1:
      return result;
    case 2:
    case 3:
      uint64_t result = sub_10001564C();
      break;
    case 4:
      uint64_t result = 0x705565636166;
      break;
    case 5:
      uint64_t result = 0x6E776F4465636166;
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t sub_100012324()
{
  return UIDeviceOrientation.description.getter(*v0);
}

uint64_t UIInterfaceOrientation.description.getter(uint64_t a1)
{
  uint64_t v1 = a1 - 1;
  uint64_t result = 0xD000000000000012;
  switch(v1)
  {
    case 0:
      uint64_t result = sub_1000155A8();
      break;
    case 1:
      return result;
    case 2:
    case 3:
      uint64_t result = sub_10001564C();
      break;
    default:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
  }
  return result;
}

uint64_t sub_1000123C4()
{
  return UIInterfaceOrientation.description.getter(*v0);
}

uint64_t type metadata accessor for SecureWindow()
{
  return self;
}

uint64_t type metadata accessor for ServiceManager()
{
  return self;
}

uint64_t type metadata accessor for Animation()
{
  return self;
}

uint64_t type metadata accessor for SlideIn()
{
  return self;
}

uint64_t type metadata accessor for SlideOut()
{
  return self;
}

uint64_t type metadata accessor for Fade()
{
  return self;
}

uint64_t type metadata accessor for ColorUIViewController()
{
  return self;
}

uint64_t type metadata accessor for ServiceNavigationController()
{
  return self;
}

uint64_t sub_1000124EC()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001252C()
{
  sub_100011858(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100012534(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100012544()
{
  return swift_release();
}

uint64_t sub_10001254C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

id sub_10001258C(int a1)
{
  return sub_1000118FC(a1, *(id *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_100012594()
{
  return _swift_deallocObject(v0, 56, 7);
}

void sub_1000125D0()
{
  sub_1000114D8(*(void **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_1000125F4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

id sub_10001262C()
{
  return [*(id *)(v0 + 16) completeTransition:1];
}

uint64_t sub_100012640(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100012650()
{
  uint64_t v0 = type metadata accessor for UUID();
  sub_100006300(v0, qword_100026A30);
  sub_1000062C8(v0, (uint64_t)qword_100026A30);
  return UUID.init(uuid:)();
}

uint64_t sub_1000126C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

char *sub_1000126F0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

unint64_t sub_100012784(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_1000128C4(a1, v4);
}

unint64_t sub_1000127C8(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10001298C(a1, a2, v4);
}

unint64_t sub_100012840(uint64_t a1)
{
  type metadata accessor for UUID();
  sub_100014F08(&qword_100026D78);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();

  return sub_100012A70(a1, v2);
}

unint64_t sub_1000128C4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10001520C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100015268((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10001298C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
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
        CGFloat v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100012A70(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    CGFloat v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_100014F08(&qword_100026D68);
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

double sub_100012C1C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_1000127C8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v14 = *v4;
    uint64_t v11 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    Swift::Int v12 = *(void *)(v11 + 24);
    sub_10000646C(&qword_100026D98);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v12);
    swift_bridgeObjectRelease();
    sub_100006718((_OWORD *)(*(void *)(v14 + 56) + 32 * v8), a3);
    _NativeDictionary._delete(at:)();
    uint64_t *v4 = v14;
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

uint64_t sub_100012D54(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_100012840(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0) {
    return 0;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v13 = *v2;
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  Swift::Int v8 = *(void *)(v7 + 24);
  sub_10000646C(&qword_100026D70);
  _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v8);
  uint64_t v9 = *(void *)(v13 + 48);
  uint64_t v10 = type metadata accessor for UUID();
  (*(void (**)(unint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * v4, v10);
  uint64_t v11 = *(void *)(*(void *)(v13 + 56) + 8 * v4);
  type metadata accessor for ServiceExtension();
  sub_100014F08(&qword_100026D78);
  _NativeDictionary._delete(at:)();
  *uint64_t v2 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_100012EA8(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  sub_100012FB8(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v9;

  return swift_bridgeObjectRelease();
}

uint64_t sub_100012F38(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_1000130F8(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;

  return swift_bridgeObjectRelease();
}

_OWORD *sub_100012FB8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  char v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_1000127C8(a2, a3);
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
  sub_10000646C(&qword_100026D98);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_1000127C8(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_13:
    double result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  uint64_t v20 = *v5;
  if (v17)
  {
    char v21 = (_OWORD *)(v20[7] + 32 * v16);
    sub_100015348((uint64_t)v21);
    return sub_100006718(a1, v21);
  }
  else
  {
    sub_100013288(v16, a2, a3, a1, v20);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000130F8(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for UUID();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v12 = (void *)*v3;
  unint64_t v13 = sub_100012840(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_10;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_10000646C(&qword_100026D70);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_100012840(a2);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_10:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v18 = v20;
LABEL_5:
  uint64_t v22 = *v4;
  if (v19)
  {
    uint64_t v23 = v22[7];
    uint64_t result = swift_release();
    *(void *)(v23 + 8 * v18) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    return sub_1000132F4(v18, (uint64_t)v11, a1, v22);
  }
  return result;
}

_OWORD *sub_100013288(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100006718(a4, (_OWORD *)(a5[7] + 32 * a1));
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

uint64_t sub_1000132F4(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  *(void *)(a4[7] + 8 * a1) = a3;
  uint64_t v11 = a4[2];
  BOOL v12 = __OFADD__(v11, 1);
  uint64_t v13 = v11 + 1;
  if (v12) {
    __break(1u);
  }
  else {
    a4[2] = v13;
  }
  return result;
}

uint64_t sub_1000133AC(uint64_t result, uint64_t a2, void *a3)
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

uint64_t sub_1000133C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = *v2;
  sub_100014F08(&qword_100026D78);
  swift_bridgeObjectRetain();
  uint64_t v30 = a1;
  uint64_t v10 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  uint64_t v29 = v9 + 56;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v26 = v2;
    uint64_t v27 = a2;
    uint64_t v28 = ~v11;
    uint64_t v25 = v6;
    uint64_t v15 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    uint64_t v14 = v6 + 16;
    uint64_t v13 = v15;
    uint64_t v16 = *(void *)(v14 + 56);
    while (1)
    {
      unint64_t v17 = v16 * v12;
      v13(v8, *(void *)(v9 + 48) + v16 * v12, v5);
      sub_100014F08(&qword_100026D68);
      char v18 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v14 - 8))(v8, v5);
      if (v18) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v28;
      if (((*(void *)(v29 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = 1;
        a2 = v27;
        return sub_1000126C8(a2, v19, 1, v5);
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v20 = v26;
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v22 = *v20;
    uint64_t v31 = *v20;
    *unint64_t v20 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_100013674();
      uint64_t v22 = v31;
    }
    a2 = v27;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v25 + 32))(v27, *(void *)(v22 + 48) + v17, v5);
    sub_1000140A0(v12);
    *unint64_t v20 = v31;
    swift_bridgeObjectRelease();
    uint64_t v19 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v19 = 1;
  }
  return sub_1000126C8(a2, v19, 1, v5);
}

void *sub_100013674()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000646C((uint64_t *)&unk_100026D80);
  uint64_t v6 = *v0;
  uint64_t v7 = static _SetStorage.copy(original:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_30:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  uint64_t v24 = v1;
  uint64_t v25 = (const void *)(v6 + 56);
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, v25, 8 * v10);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = *(void *)(v6 + 56);
  uint64_t v15 = -1;
  if (v13 < 64) {
    uint64_t v15 = ~(-1 << v13);
  }
  unint64_t v16 = v15 & v14;
  int64_t v26 = (unint64_t)(v13 + 63) >> 6;
  if ((v15 & v14) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v17 = __clz(__rbit64(v16));
  v16 &= v16 - 1;
  for (unint64_t i = v17 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v12 << 6))
  {
    unint64_t v22 = *(void *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v22, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v22, v5, v2);
    if (v16) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v19 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v26) {
        goto LABEL_28;
      }
      unint64_t v20 = *((void *)v25 + v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v26) {
          goto LABEL_28;
        }
        unint64_t v20 = *((void *)v25 + v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v16 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v26)
  {
LABEL_28:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v24;
    goto LABEL_30;
  }
  unint64_t v20 = *((void *)v25 + v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v26) {
      goto LABEL_28;
    }
    unint64_t v20 = *((void *)v25 + v12);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_100013924()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_10000646C((uint64_t *)&unk_100026D80);
  uint64_t v7 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
    uint64_t *v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  CGRect v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  uint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  if (!v12) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v17 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v17 | (v16 << 6); ; unint64_t i = __clz(__rbit64(v20)) + (v16 << 6))
  {
    uint64_t v22 = v6;
    uint64_t v23 = *(void *)(v6 + 48);
    uint64_t v24 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v23 + v24 * i, v2);
    sub_100014F08(&qword_100026D78);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v25 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6))) == 0)
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        BOOL v31 = v27 == v30;
        if (v27 == v30) {
          unint64_t v27 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v27);
        if (v32 != -1)
        {
          unint64_t v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v28 = __clz(__rbit64((-1 << v26) & ~*(void *)(v13 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v13 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v28 * v24, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v22;
    if (v12) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v19 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      goto LABEL_36;
    }
    if (v19 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v19);
    ++v16;
    if (!v20)
    {
      int64_t v16 = v19 + 1;
      if (v19 + 1 >= v36) {
        goto LABEL_32;
      }
      unint64_t v20 = *(void *)(v35 + 8 * v16);
      if (!v20)
      {
        int64_t v16 = v19 + 2;
        if (v19 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v20 = *(void *)(v35 + 8 * v16);
        if (!v20) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v12 = (v20 - 1) & v20;
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v36)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_34;
  }
  unint64_t v20 = *(void *)(v35 + 8 * v21);
  if (v20)
  {
    int64_t v16 = v21;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v16 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_32;
    }
    unint64_t v20 = *(void *)(v35 + 8 * v16);
    ++v21;
    if (v20) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100013CBC()
{
  uint64_t v1 = v0;
  uint64_t v42 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin(v42);
  unint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_10000646C((uint64_t *)&unk_100026D80);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    if (!v10) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v16 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    int64_t v40 = v13;
    for (unint64_t i = v16 | (v13 << 6); ; unint64_t i = __clz(__rbit64(v19)) + (v20 << 6))
    {
      uint64_t v22 = v4;
      uint64_t v23 = *(void *)(v4 + 48);
      uint64_t v24 = *(void *)(v39 + 72);
      uint64_t v25 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v25(v14, v23 + v24 * i, v15);
      uint64_t v6 = v38;
      sub_100014F08(&qword_100026D78);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v26 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v27 = result & ~v26;
      unint64_t v28 = v27 >> 6;
      if (((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6))) == 0)
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v26) >> 6;
        while (++v28 != v31 || (v30 & 1) == 0)
        {
          BOOL v32 = v28 == v31;
          if (v28 == v31) {
            unint64_t v28 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v28);
          if (v33 != -1)
          {
            unint64_t v29 = __clz(__rbit64(~v33)) + (v28 << 6);
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
      unint64_t v29 = __clz(__rbit64((-1 << v27) & ~*(void *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(void *)(v6 + 48) + v29 * v24, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v22;
      int64_t v13 = v40;
      if (v10) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v18 = v13 + 1;
      if (__OFADD__(v13, 1)) {
        goto LABEL_38;
      }
      if (v18 >= v36) {
        goto LABEL_32;
      }
      unint64_t v19 = v37[v18];
      int64_t v20 = v13 + 1;
      if (!v19)
      {
        int64_t v20 = v13 + 2;
        if (v13 + 2 >= v36) {
          goto LABEL_32;
        }
        unint64_t v19 = v37[v20];
        if (!v19)
        {
          int64_t v20 = v13 + 3;
          if (v13 + 3 >= v36) {
            goto LABEL_32;
          }
          unint64_t v19 = v37[v20];
          if (!v19)
          {
            uint64_t v21 = v13 + 4;
            if (v13 + 4 >= v36)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v35;
              uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
              if (v34 > 63) {
                sub_1000133AC(0, (unint64_t)(v34 + 63) >> 6, v37);
              }
              else {
                *uint64_t v37 = -1 << v34;
              }
              *(void *)(v4 + 16) = 0;
              break;
            }
            unint64_t v19 = v37[v21];
            if (!v19)
            {
              while (1)
              {
                int64_t v20 = v21 + 1;
                if (__OFADD__(v21, 1)) {
                  goto LABEL_39;
                }
                if (v20 >= v36) {
                  goto LABEL_32;
                }
                unint64_t v19 = v37[v20];
                ++v21;
                if (v19) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v20 = v13 + 4;
          }
        }
      }
LABEL_20:
      unint64_t v10 = (v19 - 1) & v19;
      int64_t v40 = v20;
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v6;
  return result;
}

uint64_t sub_1000140A0(int64_t a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t result = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v1;
  uint64_t v8 = *v1 + 56;
  uint64_t v9 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(void *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    uint64_t v34 = v1;
    uint64_t v11 = ~v9;
    swift_retain();
    uint64_t v12 = v11;
    uint64_t v13 = _HashTable.previousHole(before:)();
    uint64_t v14 = v7;
    if ((*(void *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      uint64_t v15 = v12;
      unint64_t v37 = (v13 + 1) & v12;
      unint64_t v16 = *(void (**)(char *, unint64_t, uint64_t))(v38 + 16);
      uint64_t v17 = *(void *)(v38 + 72);
      v38 += 16;
      uint64_t v39 = v17;
      uint64_t v35 = (void (**)(char *, uint64_t))(v38 - 8);
      int64_t v36 = v16;
      do
      {
        uint64_t v18 = v8;
        int64_t v19 = v39 * v10;
        uint64_t v20 = v15;
        v36(v6, *(void *)(v14 + 48) + v39 * v10, v3);
        sub_100014F08(&qword_100026D78);
        uint64_t v21 = dispatch thunk of Hashable._rawHashValue(seed:)();
        (*v35)(v6, v3);
        uint64_t v15 = v20;
        unint64_t v22 = v21 & v20;
        if (a1 >= (uint64_t)v37)
        {
          if (v22 < v37 || a1 < (uint64_t)v22)
          {
LABEL_20:
            uint64_t v8 = v18;
            goto LABEL_24;
          }
        }
        else if (v22 < v37 && a1 < (uint64_t)v22)
        {
          goto LABEL_20;
        }
        uint64_t v24 = *(void *)(v14 + 48);
        int64_t v25 = v39 * a1;
        unint64_t v26 = v24 + v39 * a1;
        unint64_t v27 = v24 + v19 + v39;
        BOOL v28 = v39 * a1 < v19 || v26 >= v27;
        uint64_t v8 = v18;
        if (v28)
        {
          swift_arrayInitWithTakeFrontToBack();
LABEL_23:
          uint64_t v15 = v20;
          a1 = v10;
          goto LABEL_24;
        }
        a1 = v10;
        if (v25 != v19)
        {
          swift_arrayInitWithTakeBackToFront();
          goto LABEL_23;
        }
LABEL_24:
        unint64_t v10 = (v10 + 1) & v15;
      }
      while (((*(void *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    uint64_t result = swift_release();
    uint64_t v1 = v34;
  }
  else
  {
    *(void *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  uint64_t v30 = *v1;
  uint64_t v31 = *(void *)(*v1 + 16);
  BOOL v32 = __OFSUB__(v31, 1);
  uint64_t v33 = v31 - 1;
  if (v32)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v30 + 16) = v33;
    ++*(_DWORD *)(v30 + 36);
  }
  return result;
}

uint64_t sub_1000143A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v3 = a3;
    uint64_t v5 = a2;
    uint64_t v6 = a1;
    if (!(*v4 >> 62))
    {
      uint64_t v8 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
LABEL_4:
  if (v8 < v5)
  {
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v9 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  uint64_t v7 = 1 - v9;
  if (__OFSUB__(1, v9))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (!(*v4 >> 62))
  {
    uint64_t v10 = *(void *)((*v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_32:
  swift_bridgeObjectRetain();
  uint64_t v10 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
LABEL_9:
  uint64_t v11 = v10 + v7;
  if (__OFADD__(v10, v7))
  {
    __break(1u);
    goto LABEL_34;
  }
  unint64_t v12 = *v4;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  unint64_t *v4 = v12;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v12 & 0x8000000000000000) != 0
    || (v12 & 0x4000000000000000) != 0
    || (uint64_t v14 = v12 & 0xFFFFFFFFFFFFFF8, v11 > *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (!(v12 >> 62))
    {
LABEL_15:
      swift_bridgeObjectRetain();
      unint64_t v12 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
      swift_bridgeObjectRelease();
      unint64_t *v4 = v12;
      uint64_t v14 = v12 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_16;
    }
LABEL_34:
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
LABEL_16:
  uint64_t v15 = v14 + 32 + 8 * v6;
  type metadata accessor for ServiceExtension();
  swift_arrayDestroy();
  if (!v7) {
    goto LABEL_24;
  }
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v16 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v16 = *(void *)(v14 + 16);
  }
  if (__OFSUB__(v16, v5))
  {
    __break(1u);
    goto LABEL_37;
  }
  uint64_t result = (uint64_t)sub_1000126F0((char *)(v14 + 32 + 8 * v5), v16 - v5, (char *)(v15 + 8));
  if (v12 >> 62)
  {
LABEL_37:
    swift_bridgeObjectRetain();
    uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t result = swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  uint64_t v18 = *(void *)(v14 + 16);
LABEL_22:
  if (__OFADD__(v18, v7))
  {
    __break(1u);
    return result;
  }
  *(void *)(v14 + 16) = v18 + v7;
LABEL_24:
  *(void *)uint64_t v15 = v3;

  return specialized Array._endMutation()();
}

uint64_t sub_100014610(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_100014F08(&qword_100026D78);
  swift_bridgeObjectRetain();
  uint64_t v34 = a2;
  uint64_t v11 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v33 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    unint64_t v29 = v2;
    uint64_t v30 = a1;
    uint64_t v31 = ~v12;
    uint64_t v28 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v32 = *(void *)(v15 + 56);
    uint64_t v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v27[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v32 * v13;
      unint64_t v20 = *(void *)(v10 + 48) + v32 * v13;
      uint64_t v21 = v14;
      v14(v9, v20, v6);
      sub_100014F08(&qword_100026D68);
      char v22 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v23 = *v17;
      (*v17)(v9, v6);
      if (v22) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v31;
      uint64_t v14 = v21;
      uint64_t v10 = v18;
      if (((*(void *)(v33 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v29;
        a1 = v30;
        uint64_t v7 = v28;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v23(v34, v6);
    v21(v30, *(void *)(*v29 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    int64_t v25 = v34;
    v14(v9, v34, v6);
    uint64_t v35 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_10001490C((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v35;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_10001490C(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_100013CBC();
  }
  else
  {
    if (v11 > v10)
    {
      sub_100013674();
      goto LABEL_12;
    }
    sub_100013924();
  }
  uint64_t v12 = *v3;
  sub_100014F08(&qword_100026D78);
  uint64_t v13 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    unint64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    uint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_100014F08(&qword_100026D68);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_100014B84(unint64_t a1)
{
  if (a1 >> 62)
  {
    sub_1000154E8();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }

  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100014BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100014C1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000646C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100014C80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000646C(&qword_100026D38);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100014CE8()
{
  return sub_100010960(*(Swift::String **)(v0 + 16));
}

uint64_t sub_100014D24(void *a1)
{
  return sub_10000CF9C(a1, *(void *)(v1 + 16)) & 1;
}

uint64_t sub_100014D48()
{
  return sub_10000D510(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32));
}

uint64_t sub_100014D54()
{
  type metadata accessor for UUID();
  sub_100006A48();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  uint64_t v5 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = ((v5 + 32) & ~v5) + *(void *)(v4 + 64);
  uint64_t v7 = v5 | 7;

  swift_release();
  uint64_t v8 = sub_100015524();
  v9(v8);

  return _swift_deallocObject(v0, v6, v7);
}

uint64_t sub_100014DF0()
{
  type metadata accessor for UUID();
  uint64_t v0 = sub_100015684();

  return sub_1000107C0(v0, v1, v2, v3, v4);
}

uint64_t sub_100014E70()
{
  return sub_100010960(*(Swift::String **)(v0 + 16));
}

uint64_t sub_100014EB0(uint64_t a1, uint64_t *a2)
{
  sub_10000646C(a2);
  sub_100015678();
  v3();
  return a1;
}

uint64_t sub_100014F08(unint64_t *a1)
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

uint64_t sub_100014F4C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100014F94(char a1)
{
  return sub_100008AA0(a1, *(void **)(v1 + 16), *(void (**)(uint64_t))(v1 + 24), *(void *)(v1 + 32), *(char **)(v1 + 40));
}

uint64_t sub_100014FA0()
{
  type metadata accessor for UUID();
  sub_100006A48();
  sub_1000157EC();

  swift_bridgeObjectRelease();
  uint64_t v3 = sub_100015524();
  v4(v3);
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, ((v2 + 23) & 0xFFFFFFFFFFFFFFF8) + 8, v1);
}

uint64_t sub_100015060(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for UUID();
  sub_1000154D0(v3);
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v9 = (*(void *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  unint64_t v10 = (char *)v1[2];
  uint64_t v11 = v1[3];
  unint64_t v12 = v1[4];
  uint64_t v13 = *(void (**)(uint64_t))((char *)v1 + v9);
  uint64_t v14 = *(void *)((char *)v1 + v9 + 8);
  uint64_t v15 = *(void *)((char *)v1 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8));

  return sub_100009CFC(a1, v10, v11, v12, (uint64_t)v1 + v8, v13, v14, v15);
}

uint64_t sub_1000150F0()
{
  type metadata accessor for UUID();
  sub_100006A48();
  sub_1000157EC();

  swift_bridgeObjectRelease();
  uint64_t v3 = sub_100015524();
  v4(v3);
  swift_release();

  return _swift_deallocObject(v0, v2 + 8, v1);
}

void sub_10001519C()
{
  uint64_t v1 = type metadata accessor for UUID();
  sub_1000154D0(v1);
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  unint64_t v6 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v7 = v0[2];
  uint64_t v8 = v0[3];
  unint64_t v9 = v0[4];
  uint64_t v10 = *(void *)((char *)v0 + ((*(void *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));

  sub_100009A20(v7, v8, v9, (uint64_t)v0 + v6, v10);
}

uint64_t sub_10001520C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100015268(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000152BC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000152F4()
{
  return sub_1000079F0(*(void *)(v0 + 16));
}

uint64_t sub_100015300()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100015348(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100015398(void *a1)
{
  return sub_100014D24(a1) & 1;
}

uint64_t sub_100015414()
{
  return swift_beginAccess();
}

uint64_t sub_100015448()
{
  return swift_beginAccess();
}

id sub_100015460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = *(const char **)(v8 + 2936);
  return [v5 v10:v6, v7, a5, 0];
}

uint64_t sub_1000154A0()
{
  return swift_slowAlloc();
}

uint64_t sub_1000154B8()
{
  return swift_slowAlloc();
}

uint64_t sub_1000154D0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_1000154E8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_100015508()
{
  return swift_beginAccess();
}

uint64_t sub_100015524()
{
  return v0 + v1;
}

uint64_t sub_10001553C()
{
  return swift_slowAlloc();
}

uint64_t sub_100015560(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10001556C()
{
  return swift_slowAlloc();
}

uint64_t sub_1000155A8()
{
  return 0x7469617274726F70;
}

uint64_t sub_1000155C0()
{
  return swift_bridgeObjectRetain();
}

BOOL sub_1000155E0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_1000155FC()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100015624()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10001564C()
{
  return 0x70616373646E616CLL;
}

uint64_t sub_100015660(uint64_t a1, uint64_t a2)
{
  return sub_1000062C8(a1, a2);
}

uint64_t sub_100015684()
{
  return v0;
}

uint64_t sub_100015690()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000156AC()
{
  return swift_bridgeObjectRetain();
}

BOOL sub_1000156E0(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

id sub_1000156FC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return [super a2:v13 v12:v12 v11:v11 v10:v10];
}

uint64_t sub_100015740()
{
  return v0;
}

id sub_100015760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9 = *(const char **)(v7 + 2936);
  return [v5 v9:v6 a4:a5];
}

uint64_t sub_100015780()
{
  return AnyHashable.init<A>(_:)();
}

void sub_1000157A0()
{
  *(_WORD *)(v0 + 12) = 2082;
}

uint64_t sub_1000157AC(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t sub_1000157D4()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100015800()
{
  return swift_arrayDestroy();
}

uint64_t sub_10001582C()
{
  return v0;
}

uint64_t sub_100015838(uint64_t a1)
{
  return sub_100014BF0(a1, 1, v1);
}

uint64_t sub_100015858()
{
  return swift_retain();
}

uint64_t sub_1000158A0()
{
  return type metadata accessor for SecureWindow();
}

void sub_1000158C0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void sub_1000158E0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_100015900(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100015944(uint64_t a1, void *a2)
{
  *(void *)(v2 + 56) = 0;
  *(unsigned char *)(v2 + 64) = 0;
  *(void *)(v2 + 72) = 0;
  *(unsigned char *)(v2 + 80) = 1;
  *(void *)(v2 + 88) = 0;
  uint64_t v5 = v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  uint64_t v6 = type metadata accessor for UUID();
  sub_1000126C8(v5, 1, 1, v6);
  *(unsigned char *)(v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loaded) = 0;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loading) = 0;
  uint64_t v7 = v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_logger;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, a1, v8);
  uint64_t result = sub_100017610(a2);
  if (!v11)
  {
    __break(1u);
    goto LABEL_11;
  }
  *(void *)(v2 + 16) = result;
  *(void *)(v2 + 24) = v11;
  *(void *)(v2 + 48) = a2;
  id v12 = a2;
  uint64_t result = sub_100017674(v12);
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v13 = result;
  AnyHashable.init<A>(_:)();
  sub_100015B54((uint64_t)v17, v13, &v18);
  swift_bridgeObjectRelease();
  sub_100015268((uint64_t)v17);
  if (v19)
  {
    if (swift_dynamicCast())
    {

      unint64_t v14 = 0xD000000000000012;
      unint64_t v15 = 0x800000010001B8B0;
LABEL_9:
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
      *(void *)(v2 + 32) = v14;
      *(void *)(v2 + 40) = v15;
      return v2;
    }
  }
  else
  {
    sub_1000176E0((uint64_t)&v18, &qword_100026820);
  }
  uint64_t result = sub_100017610(v12);
  if (v16)
  {
    unint64_t v14 = result;
    unint64_t v15 = v16;

    goto LABEL_9;
  }
LABEL_12:
  __break(1u);
  return result;
}

double sub_100015B54@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_100012784(a1), (v6 & 1) != 0))
  {
    uint64_t v7 = *(void *)(a2 + 56) + 32 * v5;
    sub_100006728(v7, (uint64_t)a3);
  }
  else
  {
    double result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void sub_100015BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  if ((*((unsigned char *)v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loaded) & 1) != 0
    || (uint64_t v4 = OBJC_IVAR____TtC7Sidecar16ServiceExtension_loading,
        *((unsigned char *)v2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loading) == 1))
  {
    _StringGuts.grow(_:)(45);
    swift_bridgeObjectRelease();
    uint64_t aBlock = 0xD000000000000011;
    unint64_t v21 = 0x800000010001B850;
    uint64_t v16 = v2[2];
    unint64_t v15 = (void *)v2[3];
    swift_bridgeObjectRetain();
    v17._countAndFlagsBits = v16;
    v17._object = v15;
    String.append(_:)(v17);
    swift_bridgeObjectRelease();
    v18._countAndFlagsBits = 0xD00000000000001ALL;
    v18._object = (void *)0x800000010001B870;
    String.append(_:)(v18);
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_retain_n();
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v19 = a1;
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t aBlock = swift_slowAlloc();
      *(_DWORD *)uint64_t v9 = 136446210;
      uint64_t v11 = v3[2];
      unint64_t v10 = v3[3];
      swift_bridgeObjectRetain();
      sub_100016C28(v11, v10, &aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      sub_10001774C();
      a1 = v19;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "=== Loading Service %{public}s ===", v9, 0xCu);
      swift_arrayDestroy();
      sub_100006AFC();
      sub_100006AFC();
    }
    else
    {
      sub_10001774C();
    }

    *((unsigned char *)v3 + v4) = 1;
    id v12 = (void *)v3[6];
    uint64_t v13 = (void *)swift_allocObject();
    v13[2] = v3;
    v13[3] = a1;
    v13[4] = a2;
    uint64_t v24 = sub_100017424;
    uint64_t v25 = v13;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    unint64_t v21 = 1107296256;
    uint64_t v22 = sub_1000165CC;
    uint64_t v23 = &unk_100021048;
    unint64_t v14 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    [v12 instantiateViewControllerWithInputItems:0 connectionHandler:v14];
    _Block_release(v14);
  }
}

uint64_t sub_100015EC4(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t (*a5)(void), uint64_t a6)
{
  uint64_t v34 = a6;
  uint64_t v35 = a5;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v33 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  id v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchQoS();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  Swift::String v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(a4 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loading) = 0;
  if (a2 && (type metadata accessor for HostRemoteViewController(), (uint64_t v15 = swift_dynamicCastClass()) != 0))
  {
    uint64_t v18 = v15;
    sub_100017450();
    id v31 = a2;
    uint64_t v32 = static OS_dispatch_queue.main.getter();
    uint64_t v19 = (void *)swift_allocObject();
    v19[2] = v18;
    v19[3] = a4;
    uint64_t v21 = v34;
    uint64_t v20 = v35;
    v19[4] = a1;
    v19[5] = v20;
    v19[6] = v21;
    aBlock[4] = (uint64_t)sub_1000174E0;
    aBlock[5] = (uint64_t)v19;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100015900;
    aBlock[3] = (uint64_t)&unk_100021098;
    uint64_t v22 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    id v23 = v31;
    swift_retain();
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_1000174F0();
    sub_10000646C(&qword_100026808);
    sub_1000064B0();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v24 = (void *)v32;
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v22);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v10);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v17, v13);
  }
  else
  {
    if (a3)
    {
      __chkstk_darwin(v15);
      *(&v31 - 2) = a3;
      swift_errorRetain();
      sub_100006FD0(sub_100017448, a4, (void (*)(void))sub_100006628);
      swift_errorRelease();
    }
    else
    {
      swift_retain_n();
      BOOL v26 = Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        aBlock[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = 136446210;
        uint64_t v29 = *(void *)(a4 + 16);
        unint64_t v30 = *(void *)(a4 + 24);
        swift_bridgeObjectRetain();
        void aBlock[6] = sub_100016C28(v29, v30, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "=== Service '%{public}s' Activation Failed ===", v28, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_release_n();
      }
    }
    return v35(0);
  }
}

uint64_t sub_10001638C(Swift::String *a1)
{
  uint64_t v5 = DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
  v2._countAndFlagsBits = 0x76726553203D3D3DLL;
  v2._object = (void *)0xED00002720656369;
  String.append(_:)(v2);
  String.append(_:)(a1[1]);
  v3._object = (void *)0x800000010001B890;
  v3._countAndFlagsBits = 0xD000000000000017;
  String.append(_:)(v3);
  return v5;
}

uint64_t sub_10001641C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v8 = sub_10000646C(&qword_100026D40);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v22 - v12;
  swift_weakAssign();
  if (a3)
  {
    v22[1] = a3;
    swift_unknownObjectRetain();
    sub_10000646C(&qword_100027008);
    uint64_t v14 = type metadata accessor for UUID();
    uint64_t v15 = swift_dynamicCast() ^ 1;
    uint64_t v16 = (uint64_t)v13;
    uint64_t v17 = v14;
  }
  else
  {
    uint64_t v17 = type metadata accessor for UUID();
    uint64_t v16 = (uint64_t)v13;
    uint64_t v15 = 1;
  }
  sub_1000126C8(v16, v15, 1, v17);
  sub_100017540((uint64_t)v13, (uint64_t)v11);
  uint64_t v18 = a2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
  swift_beginAccess();
  sub_1000175A8((uint64_t)v11, v18);
  swift_endAccess();
  *(unsigned char *)(a2 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loaded) = 1;
  uint64_t v19 = *(void **)(a2 + 56);
  *(void *)(a2 + 56) = a1;
  id v20 = a1;

  return a4(1);
}

uint64_t sub_1000165CC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v7 = *(void (**)(uint64_t, void *, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v8 = a3;
  id v9 = a4;
  v7(a2, a3, a4);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_10001666C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000646C(&qword_100026D40);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = OBJC_IVAR____TtC7Sidecar16ServiceExtension_loaded;
  char v6 = &unk_100027000;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loaded) & 1) != 0
    || *(unsigned char *)(v0 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_loading) == 1)
  {
    swift_retain_n();
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v7, v8))
    {
      id v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v20 = v5;
      v22[0] = v10;
      *(_DWORD *)id v9 = 136446210;
      uint64_t v11 = *(void *)(v1 + 16);
      unint64_t v12 = *(void *)(v1 + 24);
      swift_bridgeObjectRetain();
      uint64_t v21 = sub_100016C28(v11, v12, v22);
      char v6 = (void *)&unk_100027000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      sub_10001774C();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "=== Unloading Service %{public}s ===", v9, 0xCu);
      swift_arrayDestroy();
      uint64_t v5 = v20;
      sub_100006AFC();
      sub_100006AFC();
    }
    else
    {
      sub_10001774C();
    }

    uint64_t v13 = *(void **)(v1 + 56);
    if (v13)
    {
      id v14 = v13;
      id v15 = [v14 disconnect];
    }
    uint64_t v16 = v1 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid;
    swift_beginAccess();
    sub_100016BC0(v16, (uint64_t)v4);
    uint64_t v17 = type metadata accessor for UUID();
    if (sub_100014BF0((uint64_t)v4, 1, v17) != 1)
    {
      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(*(void *)(v17 - 8) + 8))(v4, v17);
      [*(id *)(v1 + 48) cancelExtensionRequestWithIdentifier:isa];
    }
    *(unsigned char *)(v1 + v5) = 0;
    *(unsigned char *)(v1 + v6[34]) = 0;
  }
}

uint64_t sub_10001691C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_logger;
  type metadata accessor for Logger();
  sub_100017738();
  (*(void (**)(uint64_t))(v2 + 8))(v1);
  sub_1000176E0(v0 + OBJC_IVAR____TtC7Sidecar16ServiceExtension_uuid, &qword_100026D40);
  return v0;
}

uint64_t sub_1000169B4()
{
  sub_10001691C();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100016A0C()
{
  return type metadata accessor for ServiceExtension();
}

uint64_t type metadata accessor for ServiceExtension()
{
  uint64_t result = qword_100026DD0;
  if (!qword_100026DD0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100016A5C()
{
  type metadata accessor for Logger();
  if (v0 <= 0x3F)
  {
    sub_100016B68();
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

void sub_100016B68()
{
  if (!qword_100026DE0)
  {
    type metadata accessor for UUID();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100026DE0);
    }
  }
}

uint64_t sub_100016BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000646C(&qword_100026D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100016C28(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100016CFC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006728((uint64_t)v12, *a3);
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
      sub_100006728((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100015348((uint64_t)v12);
  return v7;
}

uint64_t sub_100016CFC(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100016E54((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_100016F2C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      uint64_t result = _assertionFailure(_:_:file:line:flags:)();
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

void *sub_100016E54(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_100016F2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_100016FC4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000171A0(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000171A0((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_100016FC4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = String.UTF8View._foreignCount()();
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
  unint64_t v3 = sub_100017138(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void *sub_100017138(uint64_t a1, uint64_t a2)
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
  sub_10000646C((uint64_t *)&unk_100026F90);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1000171A0(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_10000646C((uint64_t *)&unk_100026F90);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_100017350(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_100017278(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_100017278(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_100017350(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_1000173E4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100017424(uint64_t a1, void *a2, void *a3)
{
  return sub_100015EC4(a1, a2, a3, *(void *)(v3 + 16), *(uint64_t (**)(void))(v3 + 24), *(void *)(v3 + 32));
}

uint64_t sub_100017430(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100017440()
{
  return swift_release();
}

uint64_t sub_100017448()
{
  return sub_10001638C(v0);
}

unint64_t sub_100017450()
{
  unint64_t result = qword_1000267F8;
  if (!qword_1000267F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000267F8);
  }
  return result;
}

uint64_t sub_100017490()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_1000174E0()
{
  return sub_10001641C(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32), *(uint64_t (**)(uint64_t))(v0 + 40));
}

unint64_t sub_1000174F0()
{
  unint64_t result = qword_100026800;
  if (!qword_100026800)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026800);
  }
  return result;
}

uint64_t sub_100017540(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000646C(&qword_100026D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000175A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000646C(&qword_100026D40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_100017610(void *a1)
{
  id v1 = [a1 identifier];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_100017674(void *a1)
{
  id v1 = [a1 infoDictionary];
  if (!v1) {
    return 0;
  }
  uint64_t v2 = v1;
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_1000176E0(uint64_t a1, uint64_t *a2)
{
  sub_10000646C(a2);
  sub_100017738();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_10001774C()
{
  return swift_release_n();
}

uint64_t sub_100017764()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t static DispatchTimeInterval.seconds(_:)@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  if (a2 < 0.0) {
    goto LABEL_39;
  }
  if (a2 >= 9223372040.0)
  {
    if (a2 >= 9.22337204e12)
    {
      if (a2 >= 9.22337204e15)
      {
        sub_100019478();
        if (v6)
        {
          sub_100019488();
          if (v4)
          {
LABEL_37:
            __break(1u);
            goto LABEL_38;
          }
          if (v12 <= -9.22337204e18)
          {
LABEL_38:
            __break(1u);
LABEL_39:
            uint64_t result = _assertionFailure(_:_:file:line:flags:)();
            __break(1u);
            return result;
          }
          sub_10001978C(v12);
          int64_t v7 = (unsigned int *)&enum case for DispatchTimeInterval.seconds(_:);
        }
        else
        {
          int64_t v7 = (unsigned int *)&enum case for DispatchTimeInterval.never(_:);
        }
      }
      else
      {
        sub_100019488();
        if (v4)
        {
LABEL_34:
          __break(1u);
          goto LABEL_35;
        }
        if (v10 <= -9.22337204e18)
        {
LABEL_35:
          __break(1u);
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
        sub_100019478();
        if (!v6) {
          goto LABEL_36;
        }
        sub_10001978C(v11);
        int64_t v7 = (unsigned int *)&enum case for DispatchTimeInterval.milliseconds(_:);
      }
    }
    else
    {
      sub_100019488();
      if (v4)
      {
LABEL_31:
        __break(1u);
        goto LABEL_32;
      }
      if (v8 <= -9.22337204e18)
      {
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
        goto LABEL_34;
      }
      sub_100019478();
      if (!v6) {
        goto LABEL_33;
      }
      sub_10001978C(v9);
      int64_t v7 = (unsigned int *)&enum case for DispatchTimeInterval.microseconds(_:);
    }
    goto LABEL_25;
  }
  sub_100019488();
  if (v4)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  sub_100019478();
  if (!v6) {
    goto LABEL_30;
  }
  sub_10001978C(v5);
  int64_t v7 = (unsigned int *)&enum case for DispatchTimeInterval.nanoseconds(_:);
LABEL_25:
  uint64_t v13 = *v7;
  uint64_t v14 = type metadata accessor for DispatchTimeInterval();
  id v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 104);

  return v15(a1, v13, v14);
}

Swift::Void __swiftcall OS_dispatch_source_timer.reset(_:)(Swift::Double a1)
{
  sub_1000192D0();
  uint64_t v3 = type metadata accessor for DispatchTimeInterval();
  sub_100006A48();
  uint64_t v5 = v4;
  __chkstk_darwin(v6);
  sub_1000194FC();
  __chkstk_darwin(v7);
  sub_10001974C();
  sub_100006A48();
  uint64_t v9 = v8;
  __chkstk_darwin(v10);
  sub_1000194E0();
  __chkstk_darwin(v11);
  sub_10001972C();
  + infix(_:_:)();
  double v12 = *(void (**)(void))(v9 + 8);
  sub_10001943C();
  v12();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v2, enum case for DispatchTimeInterval.never(_:), v3);
  sub_1000189A4(v1);
  sub_1000195A0();
  uint64_t v13 = *(void (**)(void))(v5 + 8);
  sub_100019498();
  v13();
  sub_100019498();
  v13();
  sub_10001943C();
  v12();
  sub_1000192EC();
}

Swift::Void __swiftcall OS_dispatch_source_timer.reset(_:interval:)(Swift::Double _, Swift::Double interval)
{
  sub_1000192D0();
  double v5 = v4;
  type metadata accessor for DispatchTimeInterval();
  sub_100006A48();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  sub_1000194FC();
  __chkstk_darwin(v9);
  sub_10001974C();
  sub_100006A48();
  uint64_t v11 = v10;
  __chkstk_darwin(v12);
  sub_1000194E0();
  __chkstk_darwin(v13);
  sub_10001972C();
  + infix(_:_:)();
  uint64_t v14 = *(void (**)(void))(v11 + 8);
  sub_10001943C();
  v14();
  static DispatchTimeInterval.seconds(_:)(v3, v5);
  sub_1000189A4(v2);
  sub_1000195A0();
  id v15 = *(void (**)(void))(v7 + 8);
  sub_100019498();
  v15();
  sub_100019498();
  v15();
  sub_10001943C();
  v14();
  sub_1000192EC();
}

uint64_t sub_100017C50()
{
  uint64_t v0 = type metadata accessor for DispatchQoS.QoSClass();
  sub_100006A48();
  uint64_t v2 = v1;
  __chkstk_darwin(v3);
  double v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000065E4(0, (unint64_t *)&qword_1000267F8);
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v5, enum case for DispatchQoS.QoSClass.default(_:), v0);
  uint64_t v6 = static OS_dispatch_queue.global(qos:)();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v5, v0);
  static OS_dispatch_queue.defaultPrioritCGFloat y = v6;
  return result;
}

uint64_t *OS_dispatch_queue.defaultPriority.unsafeMutableAddressor()
{
  if (qword_100027720 != -1) {
    swift_once();
  }
  return &static OS_dispatch_queue.defaultPriority;
}

id static OS_dispatch_queue.defaultPriority.getter()
{
  if (qword_100027720 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static OS_dispatch_queue.defaultPriority;

  return v0;
}

void OS_dispatch_queue.after(_:closure:)()
{
  sub_1000192D0();
  uint64_t v1 = v0;
  uint64_t v3 = v2;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  sub_100006A48();
  uint64_t v26 = v5;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DispatchQoS();
  sub_100006A48();
  uint64_t v24 = v10;
  uint64_t v25 = v9;
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DispatchTime();
  sub_100006A48();
  uint64_t v15 = v14;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v23 - v20;
  static DispatchTime.now()();
  + infix(_:_:)();
  id v23 = *(void (**)(char *, uint64_t))(v15 + 8);
  v23(v19, v13);
  v28[4] = v3;
  v28[5] = v1;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 1107296256;
  v28[2] = sub_1000180C4;
  v28[3] = &unk_1000210C0;
  uint64_t v22 = _Block_copy(v28);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  os_log_type_t v27 = &_swiftEmptyArrayStorage;
  sub_10001844C((unint64_t *)&qword_100026800, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000646C(&qword_100026808);
  sub_100018494((unint64_t *)&qword_100026810, &qword_100026808);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v8, v4);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v12, v25);
  v23(v21, v13);
  swift_release();
  sub_1000192EC();
}

uint64_t sub_1000180C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000180D8()
{
  return swift_release();
}

void OS_dispatch_queue.once(_:closure:)()
{
  sub_1000192D0();
  sub_1000195DC(v1, v2);
  sub_100006A48();
  uint64_t v47 = v4;
  uint64_t v48 = v3;
  __chkstk_darwin(v3);
  unint64_t v46 = (uint64_t *)((char *)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100015870();
  uint64_t v7 = __chkstk_darwin(v6);
  sub_100019630(v7, v8, v9, v10, v11, v12, v13, v14, v45[0]);
  v45[9] = type metadata accessor for DispatchTime();
  sub_100006A48();
  uint64_t v49 = v15;
  __chkstk_darwin(v16);
  sub_1000192B0(v17, v45[0]);
  uint64_t v19 = __chkstk_darwin(v18);
  sub_100019330(v19, v20, v21, v22, v23, v24, v25, v26, v45[0]);
  sub_100006A48();
  v45[3] = v28;
  v45[4] = v27;
  __chkstk_darwin(v27);
  v45[2] = sub_100019308();
  sub_100006A48();
  __chkstk_darwin(v29);
  sub_100019518();
  sub_100006A48();
  __chkstk_darwin(v30);
  sub_100019354();
  sub_1000065E4(0, &qword_1000270A8);
  v50[0] = &_swiftEmptyArrayStorage;
  sub_10001844C(&qword_1000270B0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_source.TimerFlags);
  sub_10000646C(&qword_1000270B8);
  sub_100018494(&qword_1000270C0, &qword_1000270B8);
  sub_10001944C();
  sub_10001976C();
  uint64_t v31 = sub_100019568();
  v32(v31);
  swift_getObjectType();
  uint64_t v33 = (void *)swift_allocObject();
  uint64_t v34 = v45[6];
  v33[2] = v45[5];
  v33[3] = v34;
  v33[4] = &qword_1000270B8;
  v50[4] = sub_1000184E8;
  v50[5] = v33;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 1107296256;
  v50[2] = sub_100015900;
  v50[3] = &unk_100021110;
  uint64_t v35 = _Block_copy(v50);
  swift_retain();
  swift_unknownObjectRetain();
  static DispatchQoS.unspecified.getter();
  sub_1000184EC();
  sub_1000196A4();
  _Block_release(v35);
  uint64_t v36 = sub_10001936C();
  v37(v36);
  uint64_t v38 = sub_100019600();
  v39(v38);
  swift_release();
  static DispatchTime.now()();
  sub_1000196F8();
  + infix(_:_:)();
  uint64_t v40 = sub_1000193C8();
  ((void (*)(uint64_t))v35)(v40);
  uint64_t v41 = sub_100019380();
  v42(v41);
  sub_1000189A4(v46);
  sub_1000194C4();
  OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
  uint64_t v43 = *(void (**)(void))(v0 + 8);
  sub_10001941C();
  v43();
  sub_10001941C();
  v43();
  uint64_t v44 = sub_100019648();
  ((void (*)(uint64_t))v35)(v44);
  OS_dispatch_source.resume()();
  sub_100019698();
  sub_1000192EC();
}

uint64_t sub_10001844C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100018494(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100006504(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000184EC()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void OS_dispatch_queue.wallOnce(_:closure:)()
{
  sub_1000192D0();
  sub_1000195DC(v1, v2);
  sub_100006A48();
  uint64_t v47 = v4;
  uint64_t v48 = v3;
  __chkstk_darwin(v3);
  unint64_t v46 = (uint64_t *)((char *)v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100015870();
  uint64_t v7 = __chkstk_darwin(v6);
  sub_100019630(v7, v8, v9, v10, v11, v12, v13, v14, v45[0]);
  v45[9] = type metadata accessor for DispatchWallTime();
  sub_100006A48();
  uint64_t v49 = v15;
  __chkstk_darwin(v16);
  sub_1000192B0(v17, v45[0]);
  uint64_t v19 = __chkstk_darwin(v18);
  sub_100019330(v19, v20, v21, v22, v23, v24, v25, v26, v45[0]);
  sub_100006A48();
  v45[3] = v28;
  v45[4] = v27;
  __chkstk_darwin(v27);
  v45[2] = sub_100019308();
  sub_100006A48();
  __chkstk_darwin(v29);
  sub_100019518();
  sub_100006A48();
  __chkstk_darwin(v30);
  sub_100019354();
  sub_1000065E4(0, &qword_1000270A8);
  v50[0] = &_swiftEmptyArrayStorage;
  sub_10001844C(&qword_1000270B0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_source.TimerFlags);
  sub_10000646C(&qword_1000270B8);
  sub_100018494(&qword_1000270C0, &qword_1000270B8);
  sub_10001944C();
  sub_10001976C();
  uint64_t v31 = sub_100019568();
  v32(v31);
  swift_getObjectType();
  uint64_t v33 = (void *)swift_allocObject();
  uint64_t v34 = v45[6];
  v33[2] = v45[5];
  v33[3] = v34;
  v33[4] = &qword_1000270B8;
  v50[4] = sub_1000184E8;
  v50[5] = v33;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 1107296256;
  v50[2] = sub_100015900;
  v50[3] = &unk_100021160;
  uint64_t v35 = _Block_copy(v50);
  swift_retain();
  swift_unknownObjectRetain();
  static DispatchQoS.unspecified.getter();
  sub_1000184EC();
  sub_1000196A4();
  _Block_release(v35);
  uint64_t v36 = sub_10001936C();
  v37(v36);
  uint64_t v38 = sub_100019600();
  v39(v38);
  swift_release();
  static DispatchWallTime.now()();
  sub_1000196F8();
  + infix(_:_:)();
  uint64_t v40 = sub_1000193C8();
  ((void (*)(uint64_t))v35)(v40);
  uint64_t v41 = sub_100019380();
  v42(v41);
  sub_1000189A4(v46);
  sub_1000194C4();
  OS_dispatch_source_timer.schedule(wallDeadline:repeating:leeway:)();
  uint64_t v43 = *(void (**)(void))(v0 + 8);
  sub_10001941C();
  v43();
  sub_10001941C();
  v43();
  uint64_t v44 = sub_100019648();
  ((void (*)(uint64_t))v35)(v44);
  OS_dispatch_source.resume()();
  sub_100019698();
  sub_1000192EC();
}

uint64_t sub_100018924()
{
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100018964()
{
  (*(void (**)(void))(v0 + 16))();
  swift_getObjectType();
  OS_dispatch_source.cancel()();
}

uint64_t sub_1000189A4@<X0>(void *a1@<X8>)
{
  *a1 = 0;
  uint64_t v2 = enum case for DispatchTimeInterval.nanoseconds(_:);
  uint64_t v3 = type metadata accessor for DispatchTimeInterval();
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v3 - 8) + 104);

  return v4(a1, v2, v3);
}

void OS_dispatch_queue.timer(_:interval:closure:)()
{
  sub_1000192D0();
  sub_100019660(v1, v2);
  sub_100006A48();
  uint64_t v44 = v4;
  uint64_t v45 = v3;
  __chkstk_darwin(v3);
  uint64_t v43 = (uint64_t *)((char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100015870();
  uint64_t v7 = __chkstk_darwin(v6);
  sub_100019618(v7, v8, v9, v10, v11, v12, v13, v14, v42[0]);
  type metadata accessor for DispatchTime();
  sub_100006A48();
  v42[9] = v16;
  v42[10] = v15;
  __chkstk_darwin(v15);
  sub_1000192B0(v17, v42[0]);
  uint64_t v19 = __chkstk_darwin(v18);
  sub_100019330(v19, v20, v21, v22, v23, v24, v25, v26, v42[0]);
  sub_100006A48();
  v42[2] = v28;
  v42[3] = v27;
  __chkstk_darwin(v27);
  v42[1] = sub_100019308();
  sub_100006A48();
  v42[0] = v29;
  __chkstk_darwin(v30);
  sub_100019540();
  sub_100006A48();
  __chkstk_darwin(v31);
  sub_100019354();
  sub_1000065E4(0, &qword_1000270A8);
  v46[0] = &_swiftEmptyArrayStorage;
  sub_10001844C(&qword_1000270B0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_source.TimerFlags);
  sub_10000646C(&qword_1000270B8);
  sub_100018494(&qword_1000270C0, &qword_1000270B8);
  sub_1000193EC();
  static OS_dispatch_source.makeTimerSource(flags:queue:)();
  uint64_t v32 = sub_100019584();
  v33(v32);
  swift_getObjectType();
  uint64_t v46[4] = v42[5];
  v46[5] = v42[6];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 1107296256;
  v46[2] = sub_100015900;
  v46[3] = &unk_100021188;
  uint64_t v34 = _Block_copy(v46);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  sub_1000184EC();
  sub_10001970C();
  _Block_release(v34);
  uint64_t v35 = sub_10001936C();
  v36(v35);
  uint64_t v37 = sub_1000193A4();
  v38(v37);
  swift_release();
  static DispatchTime.now()();
  sub_1000196E4();
  + infix(_:_:)();
  uint64_t v39 = sub_1000194A8();
  v0(v39);
  sub_1000196C4();
  sub_1000189A4(v43);
  sub_1000195C4();
  OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
  uint64_t v40 = *(void (**)(void))(v44 + 8);
  sub_10001942C();
  v40();
  sub_10001942C();
  v40();
  uint64_t v41 = sub_100019684();
  v0(v41);
  OS_dispatch_source.resume()();
  sub_100019698();
  sub_1000192EC();
}

void OS_dispatch_queue.wallTimer(_:interval:closure:)()
{
  sub_1000192D0();
  sub_100019660(v1, v2);
  sub_100006A48();
  uint64_t v44 = v4;
  uint64_t v45 = v3;
  __chkstk_darwin(v3);
  uint64_t v43 = (uint64_t *)((char *)v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100015870();
  uint64_t v7 = __chkstk_darwin(v6);
  sub_100019618(v7, v8, v9, v10, v11, v12, v13, v14, v42[0]);
  type metadata accessor for DispatchWallTime();
  sub_100006A48();
  v42[9] = v16;
  v42[10] = v15;
  __chkstk_darwin(v15);
  sub_1000192B0(v17, v42[0]);
  uint64_t v19 = __chkstk_darwin(v18);
  sub_100019330(v19, v20, v21, v22, v23, v24, v25, v26, v42[0]);
  sub_100006A48();
  v42[2] = v28;
  v42[3] = v27;
  __chkstk_darwin(v27);
  v42[1] = sub_100019308();
  sub_100006A48();
  v42[0] = v29;
  __chkstk_darwin(v30);
  sub_100019540();
  sub_100006A48();
  __chkstk_darwin(v31);
  sub_100019354();
  sub_1000065E4(0, &qword_1000270A8);
  v46[0] = &_swiftEmptyArrayStorage;
  sub_10001844C(&qword_1000270B0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_source.TimerFlags);
  sub_10000646C(&qword_1000270B8);
  sub_100018494(&qword_1000270C0, &qword_1000270B8);
  sub_1000193EC();
  static OS_dispatch_source.makeTimerSource(flags:queue:)();
  uint64_t v32 = sub_100019584();
  v33(v32);
  swift_getObjectType();
  uint64_t v46[4] = v42[5];
  v46[5] = v42[6];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 1107296256;
  v46[2] = sub_100015900;
  v46[3] = &unk_1000211B0;
  uint64_t v34 = _Block_copy(v46);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  sub_1000184EC();
  sub_10001970C();
  _Block_release(v34);
  uint64_t v35 = sub_10001936C();
  v36(v35);
  uint64_t v37 = sub_1000193A4();
  v38(v37);
  swift_release();
  static DispatchWallTime.now()();
  sub_1000196E4();
  + infix(_:_:)();
  uint64_t v39 = sub_1000194A8();
  v0(v39);
  sub_1000196C4();
  sub_1000189A4(v43);
  sub_1000195C4();
  OS_dispatch_source_timer.schedule(wallDeadline:repeating:leeway:)();
  uint64_t v40 = *(void (**)(void))(v44 + 8);
  sub_10001942C();
  v40();
  sub_10001942C();
  v40();
  uint64_t v41 = sub_100019684();
  v0(v41);
  OS_dispatch_source.resume()();
  sub_100019698();
  sub_1000192EC();
}

uint64_t OS_dispatch_semaphore.wait(_:)()
{
  uint64_t v0 = type metadata accessor for DispatchTime();
  sub_100006A48();
  uint64_t v2 = v1;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v12 - v7;
  static DispatchTime.now()();
  + infix(_:_:)();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v2 + 8);
  v9(v6, v0);
  uint64_t v10 = OS_dispatch_semaphore.wait(timeout:)() & 1;
  v9(v8, v0);
  return v10;
}

uint64_t static OS_dispatch_source.makeSignalSourceIgnored(signal:queue:)(int a1)
{
  uint64_t v2 = (void (__cdecl *)(int))SIG_IGN.getter();
  signal(a1, v2);
  sub_1000065E4(0, &qword_1000270A8);
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

double OS_dispatch_source_data_replace.doubleData.getter()
{
  return COERCE_DOUBLE(OS_dispatch_source.data.getter());
}

void OS_dispatch_source_data_replace.doubleData.setter(double a1)
{
}

void (*OS_dispatch_source_data_replace.doubleData.modify(uint64_t *a1, uint64_t a2))(Swift::UInt *a1)
{
  a1[1] = a2;
  a1[2] = v2;
  *a1 = OS_dispatch_source.data.getter();
  return sub_100019268;
}

void sub_100019268(Swift::UInt *a1)
{
}

void sub_1000192B0(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 208) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_100019308()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100019330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 216) = (char *)&a9 - v9;
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10001936C()
{
  return v0;
}

uint64_t sub_100019380()
{
  return *(void *)(v0 - 192);
}

uint64_t sub_1000193A4()
{
  return v0;
}

uint64_t sub_1000193C8()
{
  *(void *)(v1 - 160) += 8;
  return v0;
}

uint64_t sub_1000193EC()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_10001944C()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1000194A8()
{
  return v0;
}

uint64_t sub_1000194C4()
{
  return v0;
}

uint64_t sub_100019518()
{
  return type metadata accessor for OS_dispatch_source.TimerFlags(0);
}

uint64_t sub_100019540()
{
  return type metadata accessor for OS_dispatch_source.TimerFlags(0);
}

uint64_t sub_100019568()
{
  return v0;
}

uint64_t sub_100019584()
{
  return v0;
}

uint64_t sub_1000195A0()
{
  return OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
}

uint64_t sub_1000195C4()
{
  return v0;
}

uint64_t sub_1000195DC(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 - 264) = v2;
  *(void *)(v3 - 232) = a1;
  *(void *)(v3 - 224) = a2;
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_100019600()
{
  return v0;
}

uint64_t sub_100019618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 184) = (char *)&a9 - v9;
  return 0;
}

uint64_t sub_100019630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(void *)(v10 - 192) = (char *)&a9 - v9;
  return 0;
}

uint64_t sub_100019648()
{
  return v0;
}

uint64_t sub_100019660(uint64_t a1, uint64_t a2)
{
  *(void *)(v3 - 240) = v2;
  *(void *)(v3 - 232) = a1;
  *(void *)(v3 - 224) = a2;
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_100019684()
{
  return v0;
}

uint64_t sub_100019698()
{
  return v0;
}

uint64_t sub_1000196A4()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)(v1, v2, v0, v3);
}

uint64_t sub_1000196C4()
{
  uint64_t v3 = *(void *)(v0 - 184);
  return static DispatchTimeInterval.seconds(_:)(v3, v2);
}

double sub_1000196E4()
{
  return v0;
}

double sub_1000196F8()
{
  return v0;
}

uint64_t sub_10001970C()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)(v0, v3, v1, v2);
}

uint64_t sub_10001972C()
{
  return static DispatchTime.now()();
}

uint64_t sub_10001974C()
{
  return type metadata accessor for DispatchTime();
}

uint64_t sub_10001976C()
{
  return static OS_dispatch_source.makeTimerSource(flags:queue:)();
}

void sub_10001978C(double a1)
{
  void *v1 = (uint64_t)a1;
}

uint64_t static Notification._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Notification.name.getter()
{
  return Notification.name.getter();
}

uint64_t Notification.object.getter()
{
  return Notification.object.getter();
}

uint64_t type metadata accessor for Notification()
{
  return type metadata accessor for Notification();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

NSUUID __swiftcall UUID._bridgeToObjectiveC()()
{
  return (NSUUID)UUID._bridgeToObjectiveC()();
}

uint64_t static UUID._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UUID._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t UUID.init(uuid:)()
{
  return UUID.init(uuid:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
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

uint64_t SIG_IGN.getter()
{
  return SIG_IGN.getter();
}

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t static DispatchWallTime.now()()
{
  return static DispatchWallTime.now()();
}

uint64_t type metadata accessor for DispatchWallTime()
{
  return type metadata accessor for DispatchWallTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

{
  return + infix(_:_:)();
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

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t static OS_dispatch_source.makeTimerSource(flags:queue:)()
{
  return static OS_dispatch_source.makeTimerSource(flags:queue:)();
}

uint64_t static OS_dispatch_source.makeSignalSource(signal:queue:)()
{
  return static OS_dispatch_source.makeSignalSource(signal:queue:)();
}

uint64_t OS_dispatch_source.data.getter()
{
  return OS_dispatch_source.data.getter();
}

Swift::Void __swiftcall OS_dispatch_source.cancel()()
{
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

uint64_t OS_dispatch_source_timer.schedule(wallDeadline:repeating:leeway:)()
{
  return OS_dispatch_source_timer.schedule(wallDeadline:repeating:leeway:)();
}

uint64_t OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)()
{
  return OS_dispatch_source_timer.schedule(deadline:repeating:leeway:)();
}

Swift::Void __swiftcall OS_dispatch_source_data_replace.replace(data:)(Swift::UInt data)
{
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

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
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

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
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

uint64_t DefaultStringInterpolation.init(literalCapacity:interpolationCount:)()
{
  return DefaultStringInterpolation.init(literalCapacity:interpolationCount:)();
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

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

uint64_t SBSLockDevice()
{
  return _SBSLockDevice();
}

uint64_t SBSUndimScreen()
{
  return _SBSUndimScreen();
}

uint64_t SidecarRegisterServicePresenter()
{
  return _SidecarRegisterServicePresenter();
}

uint64_t SidecarServicePresenterReady()
{
  return _SidecarServicePresenterReady();
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

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_weakAssign()
{
  return _swift_weakAssign();
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