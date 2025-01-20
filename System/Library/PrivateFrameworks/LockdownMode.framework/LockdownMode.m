int main(int argc, const char **argv, const char **envp)
{
  sub_100005C00();
  return 0;
}

uint64_t sub_1000045CC()
{
  return _swift_deallocClassInstance(v0, 24, 7);
}

unint64_t sub_100004604(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005E0C(&qword_100041F18);
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
    sub_10000602C(v6, (uint64_t)&v13, &qword_100041F20);
    uint64_t v7 = v13;
    unint64_t result = sub_10001B4B4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100005F18(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100004734(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005E0C(&qword_100041E78);
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
    sub_10000602C(v6, (uint64_t)v15, &qword_100041E80);
    unint64_t result = sub_10001B568((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_100005F18(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100004878(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005E0C(&qword_100041EA0);
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
    sub_10000602C(v6, (uint64_t)&v13, &qword_100041EA8);
    uint64_t v7 = v13;
    unint64_t result = sub_10001B5F4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100005F18(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1000049A8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005E0C(&qword_100041F28);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 40);
  while (1)
  {
    unsigned __int8 v5 = *((unsigned char *)v4 - 8);
    uint64_t v6 = *v4;
    swift_retain();
    unint64_t result = sub_10001B700(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_100004AAC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005E0C(&qword_100041E98);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10001B688(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    BOOL v10 = (uint64_t *)(v2[6] + 16 * result);
    *BOOL v10 = v5;
    v10[1] = v6;
    *(void *)(v2[7] + 8 * result) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_100004BC8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005E0C(&qword_100041E88);
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
    sub_10000602C(v6, (uint64_t)&v15, &qword_100041E90);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10001B688(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_100005F18(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_100004D00(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005E0C(&qword_100041F10);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_10001B688(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

uint64_t variable initialization expression of RestrictionsManager.version()
{
  return 0;
}

id variable initialization expression of LockdownModeServer.listener()
{
  static Constants.serviceName.getter();
  id v0 = objc_allocWithZone((Class)NSXPCListener);
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 initWithMachServiceName:v1];

  return v2;
}

uint64_t variable initialization expression of LockdownModeServer.eventsQueue()
{
  uint64_t v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  sub_100005DCC();
  static DispatchQoS.utility.getter();
  v5[1] = &_swiftEmptyArrayStorage;
  sub_100006128((unint64_t *)&qword_100041DA8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005E0C(&qword_100041DB0);
  sub_100005E50();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t variable initialization expression of RestrictionsManager.hasExistingRestrictions()
{
  return 0;
}

uint64_t variable initialization expression of LockdownModeServer.$__lazy_storage_$_deviceKVSKey()
{
  return 0;
}

unint64_t variable initialization expression of RestrictionsManager.restrictions()
{
  return sub_1000049A8((uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t sub_1000050E4()
{
  swift_getWitnessTable();

  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_100005150()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_10000519C()
{
  return _CFObject.hash(into:)();
}

Swift::Int sub_1000051F4()
{
  return Hasher._finalize()();
}

void sub_10000525C(void *a1@<X8>)
{
  *a1 = *v1;
}

id sub_100005268()
{
  return *v0;
}

uint64_t sub_100005270@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100005278(uint64_t a1, uint64_t a2)
{
  return sub_100005A68(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000529C(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100005314(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100005394@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000053D8(uint64_t a1, uint64_t a2)
{
  return sub_100005A68(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000053F8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100005408(uint64_t a1)
{
  uint64_t v2 = sub_100006128(&qword_100041F90, type metadata accessor for LAError);

  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100005474(uint64_t a1)
{
  uint64_t v2 = sub_100006128(&qword_100041F90, type metadata accessor for LAError);

  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_1000054E0(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100006128(&qword_100041F90, type metadata accessor for LAError);
  id v5 = a1;

  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100005570()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_1000055A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006128(&qword_100041F90, type metadata accessor for LAError);

  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100005624()
{
  return Hasher._finalize()();
}

void *sub_100005684@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

BOOL sub_100005694(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1000056AC(uint64_t a1)
{
  uint64_t v2 = sub_100006128(&qword_100041F98, type metadata accessor for LAError);

  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100005718(uint64_t a1)
{
  uint64_t v2 = sub_100006128(&qword_100041F98, type metadata accessor for LAError);

  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100005788(uint64_t a1)
{
  uint64_t v2 = sub_100006128(&qword_100041F90, type metadata accessor for LAError);

  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_1000057F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100006128(&qword_100041F90, type metadata accessor for LAError);

  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_10000587C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000058A8(uint64_t a1)
{
  uint64_t v2 = sub_100006128((unint64_t *)&qword_100042000, type metadata accessor for FileAttributeKey);
  uint64_t v3 = sub_100006128(&qword_100042008, type metadata accessor for FileAttributeKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005964@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000059AC(uint64_t a1)
{
  uint64_t v2 = sub_100006128(&qword_100041FF0, type metadata accessor for FileProtectionType);
  uint64_t v3 = sub_100006128(&qword_100041FF8, type metadata accessor for FileProtectionType);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005A68(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100005AAC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100005B00()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100005B74()
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

void sub_100005C00()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemonLogger.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Starting lockdownmoded…", v6, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (_set_user_dir_suffix())
  {
    if (qword_100041D88 != -1) {
      swift_once();
    }
    CFRunLoopRun();
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

unint64_t sub_100005DCC()
{
  unint64_t result = qword_100041DA0;
  if (!qword_100041DA0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100041DA0);
  }
  return result;
}

uint64_t sub_100005E0C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005E50()
{
  unint64_t result = qword_100041DB8;
  if (!qword_100041DB8)
  {
    sub_100005EAC(&qword_100041DB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041DB8);
  }
  return result;
}

uint64_t sub_100005EAC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for LockdownModeDaemon()
{
  return self;
}

_OWORD *sub_100005F18(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_100005F28(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100005E0C(&qword_100041F30);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
    for (uint64_t i = a1 + 32; ; i += 40)
    {
      sub_10000602C(i, (uint64_t)&v11, &qword_100041F38);
      int v5 = v11;
      unint64_t result = sub_10001B5AC(v11);
      if (v7) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v3[6] + 4 * result) = v5;
      unint64_t result = (unint64_t)sub_100005F18(&v12, (_OWORD *)(v3[7] + 32 * result));
      uint64_t v8 = v3[2];
      BOOL v9 = __OFADD__(v8, 1);
      uint64_t v10 = v8 + 1;
      if (v9) {
        goto LABEL_10;
      }
      v3[2] = v10;
      if (!--v1) {
        return (unint64_t)v3;
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

uint64_t sub_10000602C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005E0C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void type metadata accessor for Code(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for FileProtectionType(uint64_t a1)
{
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
}

uint64_t sub_1000060E0()
{
  return sub_100006128(&qword_100041F60, type metadata accessor for FileAttributeKey);
}

uint64_t sub_100006128(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100006170()
{
  return sub_100006128(&qword_100041F68, type metadata accessor for FileAttributeKey);
}

uint64_t sub_1000061B8()
{
  return sub_100006128(&qword_100041F70, type metadata accessor for FileProtectionType);
}

uint64_t sub_100006200()
{
  return sub_100006128(&qword_100041F78, type metadata accessor for FileProtectionType);
}

uint64_t sub_100006248()
{
  return sub_100006128(&qword_100041F80, type metadata accessor for FileProtectionType);
}

uint64_t sub_100006290()
{
  return sub_100006128(&qword_100041F88, type metadata accessor for Code);
}

uint64_t sub_1000062D8()
{
  return sub_100006128(&qword_100041F90, type metadata accessor for LAError);
}

void type metadata accessor for LAError(uint64_t a1)
{
}

void sub_100006334(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10000637C()
{
  return sub_100006128(&qword_100041F98, type metadata accessor for LAError);
}

uint64_t sub_1000063C4()
{
  return sub_100006128(&qword_100041FA0, type metadata accessor for LAError);
}

uint64_t sub_10000640C()
{
  return sub_100006128(&qword_100041FA8, type metadata accessor for LAError);
}

uint64_t sub_100006454()
{
  return sub_100006128(&qword_100041FB0, type metadata accessor for Code);
}

uint64_t sub_10000649C()
{
  return sub_100006128(&qword_100041FB8, type metadata accessor for Code);
}

unint64_t sub_1000064E8()
{
  unint64_t result = qword_100041FC0;
  if (!qword_100041FC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041FC0);
  }
  return result;
}

uint64_t sub_10000653C()
{
  return sub_100006128(&qword_100041FC8, type metadata accessor for LAError);
}

uint64_t sub_100006584()
{
  return sub_100006128(&qword_100041FD0, type metadata accessor for LAError);
}

uint64_t sub_1000065CC()
{
  return sub_100006128(&qword_100041FD8, type metadata accessor for CFString);
}

uint64_t sub_100006614()
{
  return sub_100006128(&qword_100041FE0, type metadata accessor for CFString);
}

uint64_t sub_10000665C()
{
  return sub_100006128(&qword_100041FE8, type metadata accessor for FileAttributeKey);
}

uint64_t sub_1000066B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  uint64_t v6 = type metadata accessor for Logger();
  v5[18] = v6;
  v5[19] = *(void *)(v6 - 8);
  v5[20] = swift_task_alloc();
  v5[21] = swift_task_alloc();
  return _swift_task_switch(sub_100006780, 0, 0);
}

uint64_t sub_100006780()
{
  long long v2 = (void *)v0[16];
  uint64_t v1 = v0[17];
  v0[2] = v0;
  v0[7] = v0 + 23;
  v0[3] = sub_100006888;
  uint64_t v3 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_100006C98;
  v0[13] = &unk_10003D1F0;
  v0[14] = v3;
  [v2 saveAccount:v1 withDataclassActions:0 doVerify:0 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100006888()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 176) = v1;
  if (v1) {
    long long v2 = sub_100006AA0;
  }
  else {
    long long v2 = sub_100006998;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100006998()
{
  if ((*(unsigned char *)(v0 + 184) & 1) == 0)
  {
    static Logger.daemonLogger.getter();
    uint64_t v1 = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Could not set state of Shared Albums due to an unknown error", v3, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(void, void))(*(void *)(v0 + 152) + 8))(*(void *)(v0 + 168), *(void *)(v0 + 144));
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100006AA0()
{
  swift_willThrow();
  static Logger.daemonLogger.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    v0[15] = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Could not set state of Shared Albums: %@", v3, 0xCu);
    sub_100005E0C(&qword_1000421F8);
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
  (*(void (**)(void, void))(v0[19] + 8))(v0[20], v0[18]);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100006C98(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_100005E0C((uint64_t *)&unk_100042440);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    **(unsigned char **)(*(void *)(v3 + 64) + 40) = a2;
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t LockdownModeSharing.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for LockdownModePhotos()
{
  return self;
}

NSString sub_100006D80()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100042200 = (uint64_t)result;
  return result;
}

NSString sub_100006DB8()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100042208 = (uint64_t)result;
  return result;
}

NSString sub_100006DF0()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100042210 = (uint64_t)result;
  return result;
}

uint64_t LockdownModeSharing.deinit()
{
  return v0;
}

uint64_t type metadata accessor for LockdownModeSharing()
{
  return self;
}

void sub_100006E54()
{
  CFStringRef v0 = (const __CFString *)kSFOperationDiscoverableModeKey;
  if (!kSFOperationDiscoverableModeKey)
  {
    __break(1u);
    return;
  }
  if (qword_100041D80 != -1) {
    swift_once();
  }
  if (CFPreferencesCopyAppValue(v0, (CFStringRef)qword_100042210))
  {
    type metadata accessor for CFString(0);
    id v1 = (id)swift_dynamicCastUnknownClassUnconditional();
  }
  else
  {
    id v1 = (id)kSFOperationDiscoverableModeOff;
    id v2 = kSFOperationDiscoverableModeOff;
  }
  uint64_t v3 = (void *)kSFOperationDiscoverableModeContactsOnly;
  if (kSFOperationDiscoverableModeContactsOnly)
  {
    if (!v1) {
      return;
    }
    type metadata accessor for CFString(0);
    sub_1000070FC();
    id v4 = v1;
    id v5 = v3;
    char v6 = static _CFObject.== infix(_:_:)();

    if (v6)
    {

      return;
    }
  }
  else if (!v1)
  {
    return;
  }
  id v7 = (void *)kSFOperationDiscoverableModeEveryone;
  if (kSFOperationDiscoverableModeEveryone)
  {
    type metadata accessor for CFString(0);
    sub_1000070FC();
    id v8 = v7;
    id v1 = v1;
    id v9 = v8;
    static _CFObject.== infix(_:_:)();
  }
}

void sub_100007008(char a1)
{
  if (a1)
  {
    if (a1 != 1) {
      goto LABEL_7;
    }
    id v1 = (void *)kSFOperationDiscoverableModeContactsOnly;
    if (kSFOperationDiscoverableModeContactsOnly) {
      goto LABEL_8;
    }
    __break(1u);
  }
  id v1 = (void *)kSFOperationDiscoverableModeOff;
  if (kSFOperationDiscoverableModeOff) {
    goto LABEL_8;
  }
  __break(1u);
LABEL_7:
  id v1 = (void *)kSFOperationDiscoverableModeEveryone;
  if (!kSFOperationDiscoverableModeEveryone)
  {
LABEL_15:
    __break(1u);
    return;
  }
LABEL_8:
  id v2 = v1;
  CFStringRef v3 = (const __CFString *)kSFOperationDiscoverableModeKey;
  if (!kSFOperationDiscoverableModeKey)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v4 = qword_100041D80;
  id v5 = v2;
  id v6 = v5;
  if (v4 != -1)
  {
    swift_once();
    id v5 = v6;
  }
  CFPreferencesSetAppValue(v3, v5, (CFStringRef)qword_100042210);
}

unint64_t sub_1000070FC()
{
  unint64_t result = qword_100042750;
  if (!qword_100042750)
  {
    type metadata accessor for CFString(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042750);
  }
  return result;
}

id sub_100007154()
{
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];

  return v1;
}

char *sub_1000071B0()
{
  v44 = (void *)type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v1 = *(v44 - 1);
  __chkstk_darwin();
  CFStringRef v3 = (char *)v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  uint64_t v4 = (char *)v0 + OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_delegate;
  *(_OWORD *)uint64_t v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(void *)((char *)v0 + OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_notificationCenter) = 0;
  v43 = (char *)OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_queue;
  v42[1] = sub_10000B404(0, (unint64_t *)&qword_100041DA0);
  id v5 = v0;
  static DispatchQoS.userInitiated.getter();
  unint64_t v46 = (unint64_t)&_swiftEmptyArrayStorage;
  sub_10000B250((unint64_t *)&qword_100041DA8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005E0C(&qword_100041DB0);
  sub_10000B3B4((unint64_t *)&qword_100041DB8, &qword_100041DB0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, void *))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v44);
  *(void *)&v43[(void)v0] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();

  id v6 = (objc_class *)type metadata accessor for NotificationsManager();
  v45.receiver = v5;
  v45.super_class = v6;
  id v7 = objc_msgSendSuper2(&v45, "init");
  id v8 = objc_allocWithZone((Class)UNUserNotificationCenter);
  id v9 = (char *)v7;
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v8 initWithBundleIdentifier:v10];

  uint64_t v12 = OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_notificationCenter;
  BOOL v13 = *(void **)&v9[OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_notificationCenter];
  *(void *)&v9[OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_notificationCenter] = v11;

  NSString v14 = String._bridgeToObjectiveC()();
  sub_10000B404(0, &qword_100042450);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  Class v16 = Array._bridgeToObjectiveC()().super.isa;
  long long v17 = self;
  v44 = [v17 categoryWithIdentifier:v14 actions:isa intentIdentifiers:v16 options:0];

  NSString v18 = String._bridgeToObjectiveC()();
  Class v19 = Array._bridgeToObjectiveC()().super.isa;
  Class v20 = Array._bridgeToObjectiveC()().super.isa;
  v43 = (char *)[v17 categoryWithIdentifier:v18 actions:v19 intentIdentifiers:v20 options:0];

  NSString v21 = String._bridgeToObjectiveC()();
  Class v22 = Array._bridgeToObjectiveC()().super.isa;
  Class v23 = Array._bridgeToObjectiveC()().super.isa;
  id v24 = [v17 categoryWithIdentifier:v21 actions:v22 intentIdentifiers:v23 options:0];

  unint64_t result = *(char **)&v9[v12];
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  [result setDelegate:v9];
  unint64_t result = *(char **)&v9[v12];
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  unint64_t result = (char *)[result setWantsNotificationResponsesDelivered];
  v26 = *(void **)&v9[v12];
  if (v26)
  {
    sub_100005E0C(&qword_100042428);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100033230;
    v29 = v43;
    v28 = v44;
    *(void *)(inited + 32) = v44;
    *(void *)(inited + 40) = v29;
    *(void *)(inited + 48) = v24;
    unint64_t v46 = inited;
    specialized Array._endMutation()();
    unint64_t v30 = v46;
    if (v46 >> 62)
    {
      id v36 = v26;
      id v37 = v28;
      id v38 = v29;
      id v39 = v24;
      swift_bridgeObjectRetain();
      uint64_t v40 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v40) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v31 = *(void *)((v46 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v32 = v26;
      id v33 = v28;
      id v34 = v29;
      id v35 = v24;
      if (!v31)
      {
LABEL_8:
        swift_bridgeObjectRelease();
        sub_10000B404(0, &qword_100042458);
        sub_10000B440();
        Class v41 = Set._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v26 setNotificationCategories:v41];

        return v9;
      }
    }
    sub_10002FED4(v30);
    goto LABEL_8;
  }
LABEL_11:
  __break(1u);
  return result;
}

void sub_100007804(char a1, uint64_t a2, int a3)
{
  int v81 = a3;
  double v79 = *(double *)&a2;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v84 = *(void *)(v5 - 8);
  uint64_t v85 = v5;
  __chkstk_darwin(v5);
  v83 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100005E0C((uint64_t *)&unk_1000423F8);
  __chkstk_darwin(v7 - 8);
  v80 = (char *)&v78 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v78 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = type metadata accessor for DispatchQoS();
  uint64_t v13 = *(void *)(v88 - 8);
  __chkstk_darwin(v88);
  uint64_t v15 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = v3;
  uint64_t v82 = OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_notificationCenter;
  Class v16 = *(void **)&v3[OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_notificationCenter];
  if (!v16)
  {
    __break(1u);
LABEL_24:

    __break(1u);
    JUMPOUT(0x1000086B4);
  }
  [v16 removeAllDeliveredNotifications];
  if ((void)xmmword_1000422E0)
  {
    long long v17 = (void *)*((void *)&xmmword_1000422E0 + 1);
    NSString v18 = (__CFRunLoopSource *)(id)xmmword_1000422E0;
    Class v19 = v17;
    swift_retain();
    CFRunLoopSourceInvalidate(v18);
    CFUserNotificationCancel(v19);
    long long v20 = xmmword_1000422E0;
    xmmword_1000422E0 = 0u;
    *(_OWORD *)&qword_1000422F0 = 0u;
    sub_10000B208((void *)v20, *((void **)&v20 + 1));
    swift_release();
  }
  v86 = "wnMode.turnOnSignIn";
  unint64_t v87 = 0xD00000000000001ELL;
  switch(a1)
  {
    case 1:
      goto LABEL_10;
    case 4:
      if (0x8000000100033B80 != 0x8000000100033C10) {
        goto LABEL_6;
      }
LABEL_10:
      swift_bridgeObjectRelease();
      goto LABEL_11;
    default:
LABEL_6:
      char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v21)
      {
LABEL_11:
        sub_10000B404(0, (unint64_t *)&qword_100041DA0);
        Class v23 = (void *)static OS_dispatch_queue.main.getter();
        uint64_t v24 = swift_allocObject();
        uint64_t v25 = ObjectType;
        v26 = v90;
        *(void *)(v24 + 16) = v90;
        *(unsigned char *)(v24 + 24) = a1;
        *(void *)(v24 + 32) = v25;
        v95 = sub_10000B1F8;
        uint64_t v96 = v24;
        aBlock = _NSConcreteStackBlock;
        uint64_t v92 = 1107296256;
        v93 = sub_10000C410;
        v94 = &unk_10003D2F8;
        v27 = _Block_copy(&aBlock);
        v28 = v26;
        swift_release();
        static DispatchQoS.unspecified.getter();
        aBlock = (void **)&_swiftEmptyArrayStorage;
        sub_10000B250(&qword_100042408, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_100005E0C(&qword_100042410);
        sub_10000B3B4(&qword_100042418, &qword_100042410);
        dispatch thunk of SetAlgebra.init<A>(_:)();
        OS_dispatch_queue.async(group:qos:flags:execute:)();
        _Block_release(v27);

        (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v88);
      }
      else
      {
        switch(a1)
        {
          case 0:
          case 1:
          case 2:
          case 4:
          case 5:
            v78 = "wnMode.turnOnFailed";
            char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if (v22) {
              goto LABEL_11;
            }
            switch(a1)
            {
              case 0:
              case 1:
              case 3:
              case 4:
              case 5:
                char v29 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                if (v29) {
                  goto LABEL_11;
                }
                id v30 = [objc_allocWithZone((Class)UNMutableNotificationContent) init];
                switch(a1)
                {
                  case 0:
                    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
                    id v32 = self;
                    id v33 = [v32 bundleForClass:ObjCClassFromMetadata];
                    v97._countAndFlagsBits = 0xD000000000000012;
                    v97._object = (void *)0x8000000100033CF0;
                    v34._countAndFlagsBits = 0x4E574F444B434F4CLL;
                    v34._object = (void *)0xED000045444F4D5FLL;
                    v35._countAndFlagsBits = 0;
                    v35._object = (void *)0xE000000000000000;
                    NSLocalizedString(_:tableName:bundle:value:comment:)(v34, (Swift::String_optional)0, (NSBundle)v33, v35, v97);

                    NSString v36 = String._bridgeToObjectiveC()();
                    swift_bridgeObjectRelease();
                    [v30 setTitle:v36];

                    id v37 = [v32 bundleForClass:ObjCClassFromMetadata];
                    v98._countAndFlagsBits = 0xD000000000000011;
                    v38._countAndFlagsBits = 0xD000000000000016;
                    v98._object = (void *)0x8000000100033D30;
                    v38._object = (void *)0x8000000100033D90;
                    v39._countAndFlagsBits = 0;
                    v39._object = (void *)0xE000000000000000;
                    NSLocalizedString(_:tableName:bundle:value:comment:)(v38, (Swift::String_optional)0, (NSBundle)v37, v39, v98);

                    NSString v40 = String._bridgeToObjectiveC()();
                    swift_bridgeObjectRelease();
                    [v30 setBody:v40];

                    [v30 setInterruptionLevel:1];
                    goto LABEL_17;
                  case 1:
                  case 2:
                  case 3:
                    goto LABEL_17;
                  case 4:
                    uint64_t v41 = swift_getObjCClassFromMetadata();
                    v42 = self;
                    id v43 = [v42 bundleForClass:v41];
                    v99._countAndFlagsBits = 0xD000000000000012;
                    v44._countAndFlagsBits = 0xD00000000000001ALL;
                    v99._object = (void *)0x8000000100033CF0;
                    v44._object = (void *)0x8000000100033D50;
                    v45._countAndFlagsBits = 0;
                    v45._object = (void *)0xE000000000000000;
                    NSLocalizedString(_:tableName:bundle:value:comment:)(v44, (Swift::String_optional)0, (NSBundle)v43, v45, v99);

                    NSString v46 = String._bridgeToObjectiveC()();
                    swift_bridgeObjectRelease();
                    [v30 setTitle:v46];

                    id v47 = [v42 bundleForClass:v41];
                    v100._countAndFlagsBits = 0xD000000000000011;
                    v48._countAndFlagsBits = 0xD00000000000001CLL;
                    v100._object = (void *)0x8000000100033D30;
                    v48._object = (void *)0x8000000100033D70;
                    v49._countAndFlagsBits = 0;
                    v49._object = (void *)0xE000000000000000;
                    NSLocalizedString(_:tableName:bundle:value:comment:)(v48, (Swift::String_optional)0, (NSBundle)v47, v49, v100);

                    NSString v50 = String._bridgeToObjectiveC()();
                    swift_bridgeObjectRelease();
                    [v30 setBody:v50];

                    [v30 setInterruptionLevel:3];
                    goto LABEL_17;
                  case 5:
                    uint64_t v51 = swift_getObjCClassFromMetadata();
                    v52 = self;
                    id v53 = [v52 bundleForClass:v51];
                    v101._countAndFlagsBits = 0xD000000000000012;
                    v54._countAndFlagsBits = 0xD00000000000001BLL;
                    v101._object = (void *)0x8000000100033CF0;
                    v54._object = (void *)0x8000000100033CD0;
                    v55._countAndFlagsBits = 0;
                    v55._object = (void *)0xE000000000000000;
                    NSLocalizedString(_:tableName:bundle:value:comment:)(v54, (Swift::String_optional)0, (NSBundle)v53, v55, v101);

                    NSString v56 = String._bridgeToObjectiveC()();
                    swift_bridgeObjectRelease();
                    [v30 setTitle:v56];

                    id v57 = [v52 bundleForClass:v51];
                    v102._countAndFlagsBits = 0xD000000000000011;
                    v58._countAndFlagsBits = 0xD00000000000001DLL;
                    v102._object = (void *)0x8000000100033D30;
                    v58._object = (void *)0x8000000100033D10;
                    v59._countAndFlagsBits = 0;
                    v59._object = (void *)0xE000000000000000;
                    NSLocalizedString(_:tableName:bundle:value:comment:)(v58, (Swift::String_optional)0, (NSBundle)v57, v59, v102);

                    NSString v60 = String._bridgeToObjectiveC()();
                    swift_bridgeObjectRelease();
                    [v30 setBody:v60];

                    [v30 setInterruptionLevel:3];
LABEL_17:
                    NSString v61 = String._bridgeToObjectiveC()();
                    swift_bridgeObjectRelease();
                    [v30 setCategoryIdentifier:v61];

                    v62 = v80;
                    URL.init(string:)();
                    uint64_t v63 = type metadata accessor for URL();
                    uint64_t v64 = *(void *)(v63 - 8);
                    v66 = 0;
                    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v64 + 48))(v62, 1, v63) != 1)
                    {
                      URL._bridgeToObjectiveC()(v65);
                      v66 = v67;
                      (*(void (**)(char *, uint64_t))(v64 + 8))(v62, v63);
                    }
                    [v30 setDefaultActionURL:v66];

                    NSString v68 = String._bridgeToObjectiveC()();
                    id v69 = [self iconForApplicationIdentifier:v68];

                    [v30 setIcon:v69];
                    [v30 setSound:0];
                    [v30 setShouldIgnoreDowntime:1];
                    [v30 setShouldIgnoreDoNotDisturb:1];
                    [v30 setShouldShowSubordinateIcon:1];
                    [v30 setShouldBackgroundDefaultAction:1];
                    id v70 = 0;
                    if ((v81 & 1) == 0) {
                      id v70 = [self triggerWithTimeInterval:0 repeats:v79];
                    }
                    v71 = v83;
                    UUID.init()();
                    UUID.uuidString.getter();
                    (*(void (**)(char *, uint64_t))(v84 + 8))(v71, v85);
                    id v72 = v30;
                    CFStringRef v3 = (char *)v70;
                    NSString v73 = String._bridgeToObjectiveC()();
                    swift_bridgeObjectRelease();
                    id v74 = [self requestWithIdentifier:v73 content:v72 trigger:v3];

                    v75 = *(void **)&v90[v82];
                    if (!v75) {
                      goto LABEL_24;
                    }
                    v95 = sub_1000099B4;
                    uint64_t v96 = 0;
                    aBlock = _NSConcreteStackBlock;
                    uint64_t v92 = 1107296256;
                    v93 = sub_10000C454;
                    v94 = &unk_10003D2A8;
                    v76 = _Block_copy(&aBlock);
                    id v77 = v75;
                    [v77 addNotificationRequest:v74 withCompletionHandler:v76];

                    _Block_release(v76);
                    break;
                  default:
                    goto LABEL_25;
                }
                break;
              case 2:
                goto LABEL_10;
              default:
                goto LABEL_25;
            }
            break;
          case 3:
            goto LABEL_10;
          default:
LABEL_25:
            JUMPOUT(0);
        }
      }
      return;
  }
}

void sub_100008714(void *a1, int a2, uint64_t a3)
{
  uint64_t v132 = a3;
  int v131 = a2;
  v134 = (void *)type metadata accessor for Logger();
  uint64_t v4 = *(v134 - 1);
  uint64_t v5 = __chkstk_darwin(v134);
  v129 = (char *)&v129 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v135 = (char *)&v129 - v7;
  uint64_t v138 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v138 - 8);
  uint64_t v9 = __chkstk_darwin(v138);
  uint64_t v11 = (char *)&v129 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v139 = (char *)&v129 - v12;
  sub_100005E0C(&qword_100042420);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_100033240;
  if (!kCFUserNotificationAlertHeaderKey)
  {
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v14 = v13;
  *(void *)(v13 + 32) = kCFUserNotificationAlertHeaderKey;
  CFStringRef v15 = (id)kCFUserNotificationAlertHeaderKey;
  id v16 = sub_100007154();
  v144._countAndFlagsBits = 0xD000000000000012;
  v144._object = (void *)0x8000000100033CF0;
  v17._countAndFlagsBits = 0x4E574F444B434F4CLL;
  v17._object = (void *)0xED000045444F4D5FLL;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  Swift::String v19 = NSLocalizedString(_:tableName:bundle:value:comment:)(v17, (Swift::String_optional)0, (NSBundle)v16, v18, v144);

  *(void *)(v14 + 64) = &type metadata for String;
  *(Swift::String *)(v14 + 40) = v19;
  if (!kCFUserNotificationAlertMessageKey)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  uint64_t v133 = v4;
  *(void *)(v14 + 72) = kCFUserNotificationAlertMessageKey;
  CFStringRef v20 = (id)kCFUserNotificationAlertMessageKey;
  id v21 = sub_100007154();
  v145._countAndFlagsBits = 0xD000000000000011;
  v145._object = (void *)0x8000000100033D30;
  v22._object = (void *)0x8000000100033DB0;
  v22._countAndFlagsBits = 0xD000000000000015;
  v23._countAndFlagsBits = 0;
  v23._object = (void *)0xE000000000000000;
  Swift::String v24 = NSLocalizedString(_:tableName:bundle:value:comment:)(v22, (Swift::String_optional)0, (NSBundle)v21, v23, v145);

  *(void *)(v14 + 104) = &type metadata for String;
  *(Swift::String *)(v14 + 80) = v24;
  if (!kCFUserNotificationDefaultButtonTitleKey)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  *(void *)(v14 + 112) = kCFUserNotificationDefaultButtonTitleKey;
  CFStringRef v25 = (id)kCFUserNotificationDefaultButtonTitleKey;
  id v26 = sub_100007154();
  v27._countAndFlagsBits = 0xD000000000000013;
  v146._object = (void *)0xEC000000656C7469;
  v27._object = (void *)0x8000000100033DD0;
  v28._countAndFlagsBits = 0;
  v28._object = (void *)0xE000000000000000;
  v146._countAndFlagsBits = 0x74206E6F74747542;
  Swift::String v29 = NSLocalizedString(_:tableName:bundle:value:comment:)(v27, (Swift::String_optional)0, (NSBundle)v26, v28, v146);

  *(void *)(v14 + 144) = &type metadata for String;
  *(Swift::String *)(v14 + 120) = v29;
  if (!kCFUserNotificationAlternateButtonTitleKey)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  *(void *)(v14 + 152) = kCFUserNotificationAlternateButtonTitleKey;
  CFStringRef v30 = (id)kCFUserNotificationAlternateButtonTitleKey;
  v130 = a1;
  id v31 = sub_100007154();
  v147._object = (void *)0xEC000000656C7469;
  v32._countAndFlagsBits = 0x524554414CLL;
  v32._object = (void *)0xE500000000000000;
  v33._countAndFlagsBits = 0;
  v33._object = (void *)0xE000000000000000;
  v147._countAndFlagsBits = 0x74206E6F74747542;
  Swift::String v34 = NSLocalizedString(_:tableName:bundle:value:comment:)(v32, (Swift::String_optional)0, (NSBundle)v31, v33, v147);

  *(void *)(v14 + 184) = &type metadata for String;
  *(Swift::String *)(v14 + 160) = v34;
  if (!kCFUserNotificationAlertTopMostKey)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  *(void *)(v14 + 192) = kCFUserNotificationAlertTopMostKey;
  *(void *)(v14 + 224) = &type metadata for Bool;
  *(unsigned char *)(v14 + 200) = 1;
  CFStringRef v35 = (id)kCFUserNotificationAlertTopMostKey;
  unint64_t v36 = sub_100004604(v14);
  id v37 = (void *)SBUserNotificationWakeDisplay;
  if (!SBUserNotificationWakeDisplay)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  unint64_t v38 = v36;
  uint64_t v39 = v8;
  v143 = &type metadata for Bool;
  LOBYTE(v142._countAndFlagsBits) = 1;
  sub_100005F18(&v142, error);
  id v40 = v37;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v140 = v38;
  sub_10001B744(error, v40, isUniquelyReferenced_nonNull_native);
  unint64_t v42 = v140;

  swift_bridgeObjectRelease();
  id v43 = (void *)SBUserNotificationDismissOnLock;
  if (!SBUserNotificationDismissOnLock)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v143 = &type metadata for Bool;
  LOBYTE(v142._countAndFlagsBits) = 0;
  sub_100005F18(&v142, error);
  id v44 = v43;
  char v45 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v140 = v42;
  sub_10001B744(error, v44, v45);
  unint64_t v46 = v140;

  swift_bridgeObjectRelease();
  id v47 = (void *)SBUserNotificationIgnoresQuietMode;
  if (!SBUserNotificationIgnoresQuietMode)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v143 = &type metadata for Bool;
  LOBYTE(v142._countAndFlagsBits) = 1;
  sub_100005F18(&v142, error);
  id v48 = v47;
  char v49 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v140 = v46;
  sub_10001B744(error, v48, v49);
  unint64_t v50 = v140;

  swift_bridgeObjectRelease();
  uint64_t v51 = (void *)SBUserNotificationAllowInLoginWindow;
  if (!SBUserNotificationAllowInLoginWindow)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v143 = &type metadata for Bool;
  LOBYTE(v142._countAndFlagsBits) = 1;
  sub_100005F18(&v142, error);
  id v52 = v51;
  char v53 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v140 = v50;
  sub_10001B744(error, v52, v53);
  unint64_t v54 = v140;

  swift_bridgeObjectRelease();
  Swift::String v55 = (void *)SBUserNotificationDontDismissOnUnlock;
  if (!SBUserNotificationDontDismissOnUnlock)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v143 = &type metadata for Bool;
  LOBYTE(v142._countAndFlagsBits) = 1;
  sub_100005F18(&v142, error);
  id v56 = v55;
  char v57 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v140 = v54;
  sub_10001B744(error, v56, v57);
  unint64_t v58 = v140;

  swift_bridgeObjectRelease();
  Swift::String v59 = (void *)SBUserNotificationAllowMenuButtonDismissal;
  if (!SBUserNotificationAllowMenuButtonDismissal)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v143 = &type metadata for Bool;
  LOBYTE(v142._countAndFlagsBits) = 0;
  sub_100005F18(&v142, error);
  id v60 = v59;
  char v61 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v140 = v58;
  sub_10001B744(error, v60, v61);
  unint64_t v62 = v140;

  swift_bridgeObjectRelease();
  uint64_t v63 = (void *)SBUserNotificationPendWhileKeyBagLockedKey;
  if (!SBUserNotificationPendWhileKeyBagLockedKey)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  v143 = &type metadata for Bool;
  LOBYTE(v142._countAndFlagsBits) = 0;
  sub_100005F18(&v142, error);
  id v64 = v63;
  char v65 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v140 = v62;
  sub_10001B744(error, v64, v65);
  unint64_t v66 = v140;

  swift_bridgeObjectRelease();
  v67 = (void *)SBUserNotificationPendInSetupIfNotAllowedKey;
  if (!SBUserNotificationPendInSetupIfNotAllowedKey)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  v143 = &type metadata for Bool;
  LOBYTE(v142._countAndFlagsBits) = 1;
  sub_100005F18(&v142, error);
  id v68 = v67;
  char v69 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v140 = v66;
  sub_10001B744(error, v68, v69);
  unint64_t v70 = v140;

  swift_bridgeObjectRelease();
  v71 = (void *)SBUserNotificationAllowLockscreenDismissalKey;
  if (!SBUserNotificationAllowLockscreenDismissalKey)
  {
LABEL_44:
    __break(1u);
LABEL_45:
    __break(1u);
  }
  v143 = &type metadata for Bool;
  LOBYTE(v142._countAndFlagsBits) = 0;
  sub_100005F18(&v142, error);
  id v72 = v71;
  char v73 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v140 = v70;
  sub_10001B744(error, v72, v73);
  unint64_t v74 = v140;

  swift_bridgeObjectRelease();
  v75 = (void *)SBUserNotificationDisplayActionButtonOnLockScreen;
  if (!SBUserNotificationDisplayActionButtonOnLockScreen) {
    goto LABEL_45;
  }
  v143 = &type metadata for Bool;
  LOBYTE(v142._countAndFlagsBits) = 1;
  sub_100005F18(&v142, error);
  id v76 = v75;
  char v77 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v140 = v74;
  sub_10001B744(error, v76, v77);
  unint64_t v78 = v140;

  swift_bridgeObjectRelease();
  id v79 = objc_allocWithZone((Class)ISIcon);
  NSString v80 = String._bridgeToObjectiveC()();
  id v81 = [v79 initWithBundleIdentifier:v80];

  id v82 = objc_allocWithZone((Class)ISIconDecoration);
  id v83 = v81;
  NSString v84 = String._bridgeToObjectiveC()();
  id v85 = [v82 initWithType:v84];

  [v85 setPosition:3];
  sub_100005E0C(&qword_100042428);
  uint64_t v86 = swift_allocObject();
  *(_OWORD *)(v86 + 16) = xmmword_100033250;
  *(void *)(v86 + 32) = v85;
  v142._countAndFlagsBits = v86;
  specialized Array._endMutation()();
  id v137 = v85;
  sub_100005E0C((uint64_t *)&unk_100042430);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v88 = [v83 iconWithDecorations:isa];

  id v89 = objc_allocWithZone((Class)ISImageDescriptor);
  id v90 = v88;
  id v136 = objc_msgSend(v89, "initWithSize:scale:", 128.0, 128.0, 2.0);
  id v91 = objc_msgSend(v90, "prepareImageForDescriptor:");

  uint64_t v92 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:)();
  swift_bridgeObjectRelease();
  v93 = v139;
  URL.appendingPathComponent(_:)();
  uint64_t v96 = *(void (**)(void, void))(v39 + 8);
  v95 = (char *)(v39 + 8);
  v94 = v96;
  v96(v11, v138);
  if (v91)
  {
    id v97 = v91;
    URL._bridgeToObjectiveC()(v98);
    Swift::String v100 = v99;
    unsigned int v101 = [v97 writeToURL:v99];

    if (v101)
    {
      if (!SBUserNotificationIconImagePath)
      {
        __break(1u);
        return;
      }
      id v102 = SBUserNotificationIconImagePath;
      v93 = v139;
      Swift::String v103 = URL.path(percentEncoded:)(1);
      v143 = &type metadata for String;
      Swift::String v142 = v103;
      sub_100005F18(&v142, error);
      char v104 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v140 = v78;
      sub_10001B744(error, v102, v104);

      swift_bridgeObjectRelease();
    }
    else
    {
      v93 = v139;
    }
  }
  error[0] = 0;
  type metadata accessor for CFString(0);
  sub_10000B250(&qword_100041FD8, type metadata accessor for CFString);
  CFDictionaryRef v105 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  CFUserNotificationRef v106 = CFUserNotificationCreate(0, 0.0, 3uLL, error, v105);

  if (v106)
  {
    v135 = v95;
    v107 = v106;
    CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, v107, (CFUserNotificationCallBack)sub_1000095AC, 0);
    if (RunLoopSource)
    {
      CFRunLoopSourceRef v109 = RunLoopSource;
      uint64_t v110 = swift_allocObject();
      v134 = v90;
      v111 = v94;
      v112 = v130;
      *(void *)(v110 + 16) = v130;
      *(unsigned char *)(v110 + 24) = v131;
      *(void *)(v110 + 32) = v132;
      v114 = (void *)*((void *)&xmmword_1000422E0 + 1);
      v113 = (void *)xmmword_1000422E0;
      *(void *)&xmmword_1000422E0 = v109;
      *((void *)&xmmword_1000422E0 + 1) = v106;
      qword_1000422F0 = (uint64_t)sub_10000B298;
      qword_1000422F8 = v110;
      v115 = v109;
      v116 = v107;
      v117 = v115;
      id v118 = v112;
      v94 = v111;
      v119 = v114;
      v93 = v139;
      sub_10000B208(v113, v119);
      v120 = CFRunLoopGetMain();
      v121 = v117;
      CFRunLoopAddSource(v120, v121, kCFRunLoopCommonModes);
    }
    else
    {
      v125 = v129;
      static Logger.daemonLogger.getter();
      v126 = Logger.logObject.getter();
      os_log_type_t v127 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v126, v127))
      {
        v128 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v128 = 0;
        _os_log_impl((void *)&_mh_execute_header, v126, v127, "Could not create RunLoopSource", v128, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, void *))(v133 + 8))(v125, v134);
    }
  }
  else
  {
    static Logger.daemonLogger.getter();
    v122 = Logger.logObject.getter();
    os_log_type_t v123 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v122, v123))
    {
      v124 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v124 = 67109120;
      swift_beginAccess();
      LODWORD(v140) = error[0];
      v93 = v139;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v122, v123, "Could not create UserNotification: %d", v124, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, void *))(v133 + 8))(v135, v134);
  }
  v94(v93, v138);
}

void *sub_1000095AC(void *result, char a2)
{
  uint64_t v2 = (void *)xmmword_1000422E0;
  if ((void)xmmword_1000422E0)
  {
    uint64_t v4 = (void (*)(void))qword_1000422F0;
    uint64_t v5 = (void *)*((void *)&xmmword_1000422E0 + 1);
    id v6 = result;
    sub_10000B36C(v2, v5);
    swift_release();

    swift_retain();
    v4(a2 & 3);

    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_10000966C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v25 - v11;
  uint64_t v13 = a2 + OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_delegate;
  swift_beginAccess();
  sub_10000B0E4(v13, (uint64_t)&v26);
  if (v27)
  {
    sub_10000B2A8(&v26, (uint64_t)v28);
    if (a1)
    {
      if ((void)xmmword_1000422E0)
      {
        uint64_t v14 = (void *)*((void *)&xmmword_1000422E0 + 1);
        CFStringRef v15 = (__CFRunLoopSource *)(id)xmmword_1000422E0;
        id v16 = v14;
        swift_retain();
        CFRunLoopSourceInvalidate(v15);
        CFUserNotificationCancel(v16);
        swift_release();
      }
      *(unsigned char *)(*sub_10000B2C0(v28, v29) + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_enablementPromptShown) = 0;
    }
    else
    {
      static Logger.daemonLogger.getter();
      id v21 = Logger.logObject.getter();
      uint64_t v22 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v21, (os_log_type_t)v22))
      {
        Swift::String v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)Swift::String v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, (os_log_type_t)v22, "Received UserNotification response to turn on Lockdown Mode. Turning on…", v23, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      sub_10000B2C0(v28, v29);
      uint64_t v24 = swift_allocObject();
      *(unsigned char *)(v24 + 16) = a3;
      sub_100013454(1, 0, 1, 1, 1, 0, 0, 0, 0, sub_10000B364, v24);
      swift_release();
    }
    return sub_10000B304((uint64_t)v28);
  }
  else
  {
    sub_10000B14C((uint64_t)&v26, &qword_1000423F0);
    static Logger.daemonLogger.getter();
    Swift::String v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v17, v18))
    {
      Swift::String v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "No delegate set for NotificationsManager", v19, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
}

uint64_t sub_1000099B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t result = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v7 = Logger.logObject.getter();
    os_log_type_t v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      uint64_t v10 = swift_slowAlloc();
      uint64_t v14 = a1;
      uint64_t v15 = v10;
      *(_DWORD *)uint64_t v9 = 136315138;
      v13[1] = v9 + 4;
      swift_errorRetain();
      sub_100005E0C((uint64_t *)&unk_100042440);
      uint64_t v11 = String.init<A>(describing:)();
      uint64_t v14 = sub_10001AE5C(v11, v12, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "Error posting notification: %s", v9, 0xCu);
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
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

id sub_100009BF8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationsManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for NotificationsManager()
{
  return self;
}

uint64_t sub_100009E38(void *a1, void *a2, void *aBlock, void *a4)
{
  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  unint64_t v12 = (uint64_t (*)(id))((char *)&dword_1000423E8 + dword_1000423E8);
  id v8 = a1;
  id v9 = a2;
  a4;
  uint64_t v10 = (void *)swift_task_alloc();
  v4[6] = v10;
  *uint64_t v10 = v4;
  v10[1] = sub_100009F20;
  return v12(v9);
}

uint64_t sub_100009F20()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 40);
  objc_super v2 = *(void **)(*v0 + 32);
  uint64_t v3 = *(void **)(*v0 + 24);
  uint64_t v4 = *(void **)(*v0 + 16);
  uint64_t v7 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_10000A090()
{
  _Block_release(*(const void **)(v0 + 32));

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000A0E0()
{
  objc_super v2 = (void *)v0[2];
  uint64_t v3 = (void *)v0[3];
  uint64_t v5 = (void *)v0[4];
  uint64_t v4 = (void *)v0[5];
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  *uint64_t v6 = v1;
  v6[1] = sub_10000A1A0;
  uint64_t v7 = (uint64_t (*)(void *, void *, void *, void *))((char *)&dword_1000423A8 + dword_1000423A8);
  return v7(v2, v3, v5, v4);
}

uint64_t sub_10000A1A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000A294(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000B4B4;
  return v6();
}

uint64_t sub_10000A364()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000B4B4;
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000423B8 + dword_1000423B8);
  return v6(v2, v3, v4);
}

uint64_t sub_10000A424(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000B4B4;
  return v7();
}

uint64_t sub_10000A4F4()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000A534(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000B4B4;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000423C8 + dword_1000423C8);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10000A600(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000B14C(a1, &qword_1000423A0);
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

uint64_t sub_10000A7AC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000A888;
  return v6(a1);
}

uint64_t sub_10000A888()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000A980()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A9B8(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000A1A0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000423D8 + dword_1000423D8);
  return v6(a1, v4);
}

uint64_t sub_10000AA70(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  return _swift_task_switch(sub_10000AB58, 0, 0);
}

uint64_t sub_10000AB58()
{
  uint64_t v38 = v0;
  uint64_t v1 = v0 + 16;
  id v2 = [*(id *)(v0 + 96) actionIdentifier];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v5 = v4;

  static Logger.daemonLogger.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  uint64_t v36 = v3;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v33 = *(void *)(v0 + 120);
    uint64_t v34 = *(void *)(v0 + 112);
    uint64_t v35 = *(void *)(v0 + 152);
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136446210;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 88) = sub_10001AE5C(v3, v5, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Received notification: %{public}s", v8, 0xCu);
    swift_arrayDestroy();
    uint64_t v1 = v0 + 16;
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
    v9(v35, v34);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 152);
    uint64_t v12 = *(void *)(v0 + 112);
    uint64_t v11 = *(void *)(v0 + 120);
    swift_bridgeObjectRelease_n();

    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
    v9(v10, v12);
  }
  uint64_t v13 = *(void *)(v0 + 104) + OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_delegate;
  swift_beginAccess();
  sub_10000B0E4(v13, v1);
  if (!*(void *)(v0 + 40))
  {
    swift_bridgeObjectRelease();
    sub_10000B14C(v1, &qword_1000423F0);
    static Logger.daemonLogger.getter();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v15, v16))
    {
      Swift::String v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)Swift::String v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "No delegate set for NotificationsManager", v17, 2u);
      swift_slowDealloc();
    }
    uint64_t v18 = *(void *)(v0 + 128);
    goto LABEL_15;
  }
  sub_10000B14C(v1, &qword_1000423F0);
  if (static String._unconditionallyBridgeFromObjectiveC(_:)() == v36 && v14 == v5)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    static Logger.daemonLogger.getter();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v20))
    {
      id v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v20, "Opening settings…", v21, 2u);
      swift_slowDealloc();
    }
    uint64_t v18 = *(void *)(v0 + 144);
LABEL_15:
    uint64_t v22 = *(void *)(v0 + 112);

    uint64_t v23 = v18;
    uint64_t v24 = v22;
    goto LABEL_16;
  }
  char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  if (v19) {
    goto LABEL_12;
  }
  static Logger.daemonLogger.getter();
  swift_bridgeObjectRetain();
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.fault.getter();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v30 = *(void *)(v0 + 136);
  uint64_t v31 = *(void *)(v0 + 112);
  if (v29)
  {
    Swift::String v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)Swift::String v32 = 136380675;
    swift_bridgeObjectRetain();
    *(void *)(v0 + 80) = sub_10001AE5C(v36, v5, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Unknown notification actionIdentifier: %{private}s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v24 = v31;
    uint64_t v23 = v30;
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v23 = v30;
    uint64_t v24 = v31;
  }
LABEL_16:
  v9(v23, v24);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

uint64_t sub_10000B0E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E0C(&qword_1000423F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B14C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100005E0C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000B1A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B1B8()
{
  return swift_release();
}

uint64_t sub_10000B1C0()
{
  return _swift_deallocObject(v0, 40, 7);
}

void sub_10000B1F8()
{
  sub_100008714(*(void **)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(void *)(v0 + 32));
}

void *sub_10000B208(void *result, void *a2)
{
  if (result)
  {

    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_10000B250(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000B298(uint64_t a1)
{
  return sub_10000966C(a1, *(void *)(v1 + 16), *(unsigned char *)(v1 + 24));
}

uint64_t sub_10000B2A8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_10000B2C0(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000B304(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000B354()
{
  return _swift_deallocObject(v0, 17, 7);
}

void sub_10000B364(uint64_t a1)
{
  sub_1000192BC(a1, *(unsigned char *)(v1 + 16));
}

void *sub_10000B36C(void *result, void *a2)
{
  if (result)
  {
    id v3 = result;
    id v4 = a2;
    return (void *)swift_retain();
  }
  return result;
}

uint64_t sub_10000B3B4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100005EAC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000B404(uint64_t a1, unint64_t *a2)
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

unint64_t sub_10000B440()
{
  unint64_t result = qword_100042460;
  if (!qword_100042460)
  {
    sub_10000B404(255, &qword_100042458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042460);
  }
  return result;
}

uint64_t type metadata accessor for LockdownModeAMFI()
{
  return self;
}

void sub_10000B4E0(char a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005DCC();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for DispatchQoS.QoSClass.default(_:), v6);
  uint64_t v10 = static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  mach_service = xpc_connection_create_mach_service("com.apple.amfi.xpc", v10, 0);

  aBlock[4] = (uint64_t)LockdownModeServer.LockdownModeState.rawValue.getter;
  aBlock[5] = 0;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_10000C4C0;
  aBlock[3] = (uint64_t)&unk_10003D370;
  uint64_t v12 = _Block_copy(aBlock);
  xpc_connection_set_event_handler(mach_service, v12);
  _Block_release(v12);
  xpc_connection_resume(mach_service);
  if (a1) {
    int v13 = 2;
  }
  else {
    int v13 = 1;
  }
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  aBlock[0] = (uint64_t)&_swiftEmptyDictionarySingleton;
  sub_10001BB14(v13, 0x6E6F69746361, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  os_log_type_t v16 = (void *)_CFXPCCreateXPCMessageWithCFObject();

  if (v16)
  {
    swift_bridgeObjectRelease();
    xpc_object_t v17 = xpc_connection_send_message_with_reply_sync(mach_service, v16);
    xpc_type_t type = xpc_get_type(v17);
    if (type == (xpc_type_t)XPC_TYPE_ERROR.getter())
    {
      static Logger.daemonLogger.getter();
      swift_unknownObjectRetain_n();
      char v19 = Logger.logObject.getter();
      os_log_type_t v20 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v19, v20))
      {
        id v21 = (uint8_t *)swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        aBlock[0] = v29;
        os_log_type_t v28 = v21;
        *(_DWORD *)id v21 = 136315138;
        id v22 = objc_msgSend(v17, "description", v21 + 4);
        uint64_t v23 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v30 = v3;
        uint64_t v31 = v2;
        uint64_t v24 = v23;
        unint64_t v26 = v25;

        uint64_t v32 = sub_10001AE5C(v24, v26, aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_unknownObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Received an XPC error when setting Developer Mode: %s", v28, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_unknownObjectRelease();

        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v5, v31);
      }
      else
      {

        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      }
    }
    else
    {
      if (xpc_dictionary_get_value(v17, "cfreply")) {
        swift_unknownObjectRelease();
      }
      else {
        xpc_connection_cancel(mach_service);
      }
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_10000B9F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000BA00()
{
  return swift_release();
}

double sub_10000BA08@<D0>(NSString a1@<X1>, _OWORD *a2@<X8>)
{
  char v19 = a2;
  uint64_t v3 = sub_100005E0C((uint64_t *)&unk_1000423F8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v18 - v7;
  id v9 = [self standardUserDefaults];
  if (a1) {
    a1 = String._bridgeToObjectiveC()();
  }
  sub_10002D894(v6);
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v6, 1, v10) == 1)
  {
    sub_10000BCC8((uint64_t)v6);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v8, 1, 1, v10);
LABEL_6:
    sub_10000BCC8((uint64_t)v8);
    NSString v14 = 0;
    goto LABEL_8;
  }
  URL.appendingPathComponent(_:)();
  int v13 = *(void (**)(char *, uint64_t))(v11 + 8);
  v13(v6, v10);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  if (v12(v8, 1, v10) == 1) {
    goto LABEL_6;
  }
  URL.path.getter();
  v13(v8, v10);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
LABEL_8:
  id v15 = [v9 objectForKey:a1 inDomain:v14];

  if (v15)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    double result = 0.0;
    xpc_object_t v17 = v19;
    *char v19 = 0u;
    v17[1] = 0u;
  }
  return result;
}

uint64_t sub_10000BCC8(uint64_t a1)
{
  uint64_t v2 = sub_100005E0C((uint64_t *)&unk_1000423F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000BD28(uint64_t a1, NSString a2)
{
  uint64_t v3 = sub_100005E0C((uint64_t *)&unk_1000423F8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v15 - v7;
  id v9 = [self standardUserDefaults];
  if (a2) {
    a2 = String._bridgeToObjectiveC()();
  }
  sub_10002D894(v6);
  uint64_t v10 = type metadata accessor for URL();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v6, 1, v10) == 1)
  {
    sub_10000BCC8((uint64_t)v6);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v8, 1, 1, v10);
  }
  else
  {
    URL.appendingPathComponent(_:)();
    int v13 = *(void (**)(char *, uint64_t))(v11 + 8);
    v13(v6, v10);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    if (v12(v8, 1, v10) != 1)
    {
      URL.path.getter();
      v13(v8, v10);
      NSString v14 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
  }
  sub_10000BCC8((uint64_t)v8);
  NSString v14 = 0;
LABEL_8:
  [v9 removeObjectForKey:a2 inDomain:v14];
}

void sub_10000BFAC(uint64_t a1, uint64_t a2, NSString a3)
{
  uint64_t v5 = sub_100005E0C((uint64_t *)&unk_1000423F8);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v23 - v9;
  id v24 = [self standardUserDefaults];
  sub_10000C338(a1, (uint64_t)v25);
  uint64_t v11 = v26;
  if (v26)
  {
    uint64_t v12 = sub_10000B2C0(v25, v26);
    uint64_t v13 = *(void *)(v11 - 8);
    __chkstk_darwin(v12);
    uint64_t v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = _bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_10000B304((uint64_t)v25);
    if (!a3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v16 = 0;
  if (a3) {
LABEL_3:
  }
    a3 = String._bridgeToObjectiveC()();
LABEL_4:
  sub_10002D894(v8);
  uint64_t v17 = type metadata accessor for URL();
  uint64_t v18 = *(void *)(v17 - 8);
  char v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
  if (v19(v8, 1, v17) == 1)
  {
    sub_10000BCC8((uint64_t)v8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v10, 1, 1, v17);
  }
  else
  {
    URL.appendingPathComponent(_:)();
    os_log_type_t v20 = *(void (**)(char *, uint64_t))(v18 + 8);
    v20(v8, v17);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v10, 0, 1, v17);
    if (v19(v10, 1, v17) != 1)
    {
      URL.path.getter();
      v20(v10, v17);
      NSString v21 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  sub_10000BCC8((uint64_t)v10);
  NSString v21 = 0;
LABEL_11:
  id v22 = v24;
  [v24 setObject:v16 forKey:a3 inDomain:v21];

  swift_unknownObjectRelease();
}

uint64_t sub_10000C338(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E0C(&qword_1000425E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for LockdownModeManagedConfiguration()
{
  return self;
}

uint64_t *LockdownModeServer.shared.unsafeMutableAddressor()
{
  if (qword_100041D88 != -1) {
    swift_once();
  }
  return &static LockdownModeServer.shared;
}

uint64_t sub_10000C410(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10000C454(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_10000C4C0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

id sub_10000C520()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for LockdownModeServer()) init];
  static LockdownModeServer.shared = (uint64_t)result;
  return result;
}

id static LockdownModeServer.shared.getter()
{
  if (qword_100041D88 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)static LockdownModeServer.shared;

  return v0;
}

id sub_10000C5AC()
{
  uint64_t v1 = OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___notificationsManager;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___notificationsManager];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___notificationsManager];
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)type metadata accessor for NotificationsManager()) init];
    v10[3] = type metadata accessor for LockdownModeServer();
    v10[4] = &off_10003D410;
    v10[0] = v0;
    uint64_t v5 = (uint64_t)v4 + OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_delegate;
    swift_beginAccess();
    uint64_t v6 = v0;
    sub_100020FFC((uint64_t)v10, v5, &qword_1000423F0);
    swift_endAccess();
    uint64_t v7 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id sub_10000C684()
{
  uint64_t v1 = OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___keyValueStore;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___keyValueStore);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___keyValueStore);
  }
  else
  {
    id v4 = objc_allocWithZone((Class)NSUbiquitousKeyValueStore);
    NSString v5 = String._bridgeToObjectiveC()();
    id v6 = [v4 initWithStoreIdentifier:v5 type:2];

    uint64_t v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id sub_10000C730()
{
  uint64_t v1 = OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___idsManager;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___idsManager];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___idsManager];
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)type metadata accessor for IDSManager()) init];
    v10[3] = type metadata accessor for LockdownModeServer();
    v10[4] = &off_10003D430;
    v10[0] = v0;
    uint64_t v5 = (uint64_t)v4 + OBJC_IVAR____TtC13lockdownmoded10IDSManager_delegate;
    swift_beginAccess();
    id v6 = v0;
    sub_100020FFC((uint64_t)v10, v5, &qword_1000426E0);
    swift_endAccess();
    uint64_t v7 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

uint64_t LockdownModeServer.LockdownModeState.description.getter(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      return 6710895;
    case 2:
      return 28271;
    case 1:
      return 0x646567617473;
  }
  uint64_t result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
  __break(1u);
  return result;
}

unint64_t LockdownModeServer.LockdownModeState.init(rawValue:)(unint64_t result)
{
  if (result > 2) {
    return 0;
  }
  return result;
}

Swift::Int sub_10000C890()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000C8D8()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000C904()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t *sub_10000C948@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *result;
  BOOL v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2) {
    uint64_t v2 = 0;
  }
  *(void *)a2 = v2;
  *(unsigned char *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_10000C964()
{
  uint64_t v1 = *v0;
  if (!*v0) {
    return 6710895;
  }
  if (v1 == 2) {
    return 28271;
  }
  if (v1 == 1) {
    return 0x646567617473;
  }
  uint64_t result = _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
  __break(1u);
  return result;
}

uint64_t sub_10000C9E0()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___deviceKVSKey);
  if (*(void *)(v0 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___deviceKVSKey + 8))
  {
    uint64_t v2 = *v1;
  }
  else
  {
    NSString v3 = String._bridgeToObjectiveC()();
    id v4 = (void *)MGGetStringAnswer();

    if (v4)
    {
      uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v7 = v6;
    }
    else
    {
      uint64_t v5 = 0;
      uint64_t v7 = (void *)0xE000000000000000;
    }
    v8._countAndFlagsBits = v5;
    v8._object = v7;
    String.append(_:)(v8);
    swift_bridgeObjectRelease();
    uint64_t v2 = 0x3A656369766564;
    *uint64_t v1 = 0x3A656369766564;
    v1[1] = 0xE700000000000000;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_10000CADC()
{
  id v0 = sub_10000C684();
  sub_10000C9E0();
  NSString v1 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v2 = [v0 dictionaryForKey:v1];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!*(void *)(v3 + 16) || (unint64_t v4 = sub_10001B688(0x6574617473, 0xE500000000000000), (v5 & 1) == 0))
  {
    long long v8 = 0u;
    long long v9 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  sub_100020BCC(*(void *)(v3 + 56) + 32 * v4, (uint64_t)&v8);
  swift_bridgeObjectRelease();
  if (!*((void *)&v9 + 1))
  {
LABEL_10:
    sub_100020B10((uint64_t)&v8);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  if (v7 == 2) {
    return 2;
  }
  else {
    return v7 == 1;
  }
}

void sub_10000CC14(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = sub_10000C684();
  sub_10000C9E0();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v8 = [v6 dictionaryForKey:v7];

  if (v8)
  {
    unint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    unint64_t v9 = sub_100004BC8((uint64_t)&_swiftEmptyArrayStorage);
  }
  id v24 = &type metadata for Int;
  *(void *)&long long v23 = a1;
  sub_100005F18(&v23, v22);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v21 = v9;
  sub_10001B9C0(v22, 0x6574617473, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
  unint64_t v11 = v21;
  swift_bridgeObjectRelease();
  Date.init()();
  Date.timeIntervalSince1970.getter();
  uint64_t v13 = v12;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v24 = &type metadata for Double;
  *(void *)&long long v23 = v13;
  sub_100005F18(&v23, v22);
  char v14 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v21 = v11;
  sub_10001B9C0(v22, 0x7441746573, 0xE500000000000000, v14);
  unint64_t v15 = v21;
  swift_bridgeObjectRelease();
  id v24 = &type metadata for Double;
  *(void *)&long long v23 = v13;
  sub_100005F18(&v23, v22);
  char v16 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v21 = v15;
  sub_10001B9C0(v22, 0x616470557473616CLL, 0xEB00000000646574, v16);
  swift_bridgeObjectRelease();
  id v17 = sub_10000C684();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  sub_10000C9E0();
  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v17 setDictionary:isa forKey:v19];
}

void sub_10000CF04()
{
  uint64_t v41 = type metadata accessor for Date();
  uint64_t v1 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  id v40 = (char *)&v39 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = sub_10000C684();
  id v4 = [v3 dictionaryRepresentation];

  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v43 = v0;
  uint64_t v6 = sub_10000C9E0();
  uint64_t v8 = v7;
  uint64_t v9 = v5 + 64;
  uint64_t v10 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v5 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v39 = (void (**)(char *, uint64_t))(v1 + 8);
  swift_bridgeObjectRetain();
  int64_t v14 = 0;
  uint64_t v42 = v6;
  while (v12)
  {
    unint64_t v15 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    unint64_t v16 = v15 | (v14 << 6);
LABEL_25:
    uint64_t v20 = (void *)(*(void *)(v5 + 48) + 16 * v16);
    BOOL v21 = *v20 == v6 && v20[1] == v8;
    if (!v21 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v22._countAndFlagsBits = 0x656369766564;
      v22._object = (void *)0xE600000000000000;
      if (!String.hasPrefix(_:)(v22)) {
        goto LABEL_4;
      }
      id v23 = sub_10000C684();
      uint64_t v24 = v8;
      uint64_t v25 = v5;
      uint64_t v26 = v9;
      int64_t v27 = v13;
      NSString v28 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v29 = [v23 dictionaryForKey:v28];

      int64_t v13 = v27;
      uint64_t v9 = v26;
      uint64_t v5 = v25;
      uint64_t v8 = v24;
      uint64_t v6 = v42;
      if (v29)
      {
        uint64_t v30 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        if (*(void *)(v30 + 16)
          && (unint64_t v31 = sub_10001B688(0x6574617473, 0xE500000000000000), (v32 & 1) != 0)
          && (sub_100020BCC(*(void *)(v30 + 56) + 32 * v31, (uint64_t)&v45), (swift_dynamicCast() & 1) != 0)
          && (unint64_t)(*(void *)&v44 - 1) <= 1)
        {
          if (*(void *)(v30 + 16)
            && (unint64_t v33 = sub_10001B688(0x616470557473616CLL, 0xEB00000000646574), (v34 & 1) != 0))
          {
            sub_100020BCC(*(void *)(v30 + 56) + 32 * v33, (uint64_t)&v45);
          }
          else
          {
            long long v45 = 0u;
            long long v46 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((void *)&v46 + 1))
          {
            if (swift_dynamicCast())
            {
              double v35 = v44;
              uint64_t v36 = v40;
              Date.init()();
              Date.timeIntervalSince1970.getter();
              double v38 = v37;
              (*v39)(v36, v41);
              if (v38 - v35 <= 1209600.0) {
                goto LABEL_46;
              }
            }
          }
          else
          {
            sub_100020B10((uint64_t)&v45);
          }
        }
        else
        {
LABEL_4:
          swift_bridgeObjectRelease();
        }
      }
    }
  }
  int64_t v17 = v14 + 1;
  if (__OFADD__(v14, 1))
  {
    __break(1u);
LABEL_46:
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  if (v17 >= v13) {
    goto LABEL_46;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v17);
  ++v14;
  if (v18) {
    goto LABEL_24;
  }
  int64_t v14 = v17 + 1;
  if (v17 + 1 >= v13) {
    goto LABEL_46;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v14);
  if (v18) {
    goto LABEL_24;
  }
  int64_t v14 = v17 + 2;
  if (v17 + 2 >= v13) {
    goto LABEL_46;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v14);
  if (v18) {
    goto LABEL_24;
  }
  int64_t v14 = v17 + 3;
  if (v17 + 3 >= v13) {
    goto LABEL_46;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v14);
  if (v18) {
    goto LABEL_24;
  }
  int64_t v14 = v17 + 4;
  if (v17 + 4 >= v13) {
    goto LABEL_46;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v14);
  if (v18)
  {
LABEL_24:
    unint64_t v12 = (v18 - 1) & v18;
    unint64_t v16 = __clz(__rbit64(v18)) + (v14 << 6);
    goto LABEL_25;
  }
  int64_t v19 = v17 + 5;
  if (v19 >= v13) {
    goto LABEL_46;
  }
  unint64_t v18 = *(void *)(v9 + 8 * v19);
  if (v18)
  {
    int64_t v14 = v19;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v14 = v19 + 1;
    if (__OFADD__(v19, 1)) {
      break;
    }
    if (v14 >= v13) {
      goto LABEL_46;
    }
    unint64_t v18 = *(void *)(v9 + 8 * v14);
    ++v19;
    if (v18) {
      goto LABEL_24;
    }
  }
  __break(1u);
}

char *sub_10000D3D0()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v52 = *(void *)(v1 - 8);
  uint64_t v53 = v1;
  uint64_t v2 = __chkstk_darwin(v1);
  Swift::String v55 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  unint64_t v54 = (char *)&v48 - v5;
  __chkstk_darwin(v4);
  uint64_t v51 = (char *)&v48 - v6;
  uint64_t v7 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v49 = *(void *)(v7 - 8);
  uint64_t v50 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v10);
  uint64_t v11 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v11 - 8);
  *(void *)&v0[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___notificationsManager] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___keyValueStore] = 0;
  uint64_t v12 = OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_listener;
  int64_t v13 = v0;
  static Constants.serviceName.getter();
  id v14 = objc_allocWithZone((Class)NSXPCListener);
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v16 = [v14 initWithMachServiceName:v15];

  *(void *)&v0[v12] = v16;
  *(void *)&v13[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___idsManager] = 0;
  uint64_t v17 = OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_eventsQueue;
  sub_10000B404(0, (unint64_t *)&qword_100041DA0);
  static DispatchQoS.utility.getter();
  unint64_t v58 = &_swiftEmptyArrayStorage;
  sub_100023F74((unint64_t *)&qword_100041DA8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100005E0C(&qword_100041DB0);
  sub_10000B3B4((unint64_t *)&qword_100041DB8, &qword_100041DB0);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v49 + 104))(v9, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v50);
  *(void *)&v13[v17] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v13[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_enablementPromptShown] = 0;
  v13[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_pendingEnablementPrompt] = 0;
  v13[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_skipNextKVSSync] = 0;
  v13[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled] = 0;
  unint64_t v18 = &v13[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer____lazy_storage___deviceKVSKey];
  *(void *)unint64_t v18 = 0;
  *((void *)v18 + 1) = 0;

  int64_t v19 = (objc_class *)type metadata accessor for LockdownModeServer();
  v57.receiver = v13;
  v57.super_class = v19;
  uint64_t v20 = (char *)objc_msgSendSuper2(&v57, "init");
  BOOL v21 = v51;
  static Logger.daemonLogger.getter();
  Swift::String v22 = v21;
  id v23 = Logger.logObject.getter();
  os_log_type_t v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v23, v24))
  {
    uint64_t v25 = swift_slowAlloc();
    unint64_t v58 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136446466;
    type metadata accessor for LockdownModeXNU();
    char v26 = static LockdownModeXNU.lockdownModeEnabled.getter();
    BOOL v27 = (v26 & 1) == 0;
    if (v26) {
      uint64_t v28 = 28271;
    }
    else {
      uint64_t v28 = 6710895;
    }
    if (v27) {
      unint64_t v29 = 0xE300000000000000;
    }
    else {
      unint64_t v29 = 0xE200000000000000;
    }
    uint64_t v56 = sub_10001AE5C(v28, v29, (uint64_t *)&v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v25 + 12) = 2082;
    id v30 = [objc_allocWithZone((Class)LAStorage) init];
    unsigned int v31 = [v30 BOOLForKey:6];

    if (v31) {
      uint64_t v32 = 28271;
    }
    else {
      uint64_t v32 = 6710895;
    }
    if (v31) {
      unint64_t v33 = 0xE200000000000000;
    }
    else {
      unint64_t v33 = 0xE300000000000000;
    }
    uint64_t v56 = sub_10001AE5C(v32, v33, (uint64_t *)&v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "Setting up lockdownmoded… (sysctl: %{public}s, ACM: %{public}s)", (uint8_t *)v25, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  char v34 = *(void (**)(char *, uint64_t))(v52 + 8);
  double v35 = v22;
  uint64_t v36 = v53;
  v34(v35, v53);
  double v37 = v54;
  static Logger.daemonLogger.getter();
  double v38 = Logger.logObject.getter();
  os_log_type_t v39 = static os_log_type_t.default.getter();
  BOOL v40 = os_log_type_enabled(v38, v39);
  uint64_t v41 = v55;
  if (v40)
  {
    uint64_t v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v42 = 0;
    _os_log_impl((void *)&_mh_execute_header, v38, v39, "Setting up observers…", v42, 2u);
    swift_slowDealloc();
  }

  v34(v37, v36);
  sub_10000DC88();
  static Logger.daemonLogger.getter();
  uint64_t v43 = Logger.logObject.getter();
  os_log_type_t v44 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v43, v44))
  {
    long long v45 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)long long v45 = 0;
    _os_log_impl((void *)&_mh_execute_header, v43, v44, "Setting up the XPC server…", v45, 2u);
    swift_slowDealloc();
  }

  v34(v41, v36);
  uint64_t v46 = OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_listener;
  [*(id *)&v20[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_listener] setDelegate:v20];
  [*(id *)&v20[v46] resume];

  return v20;
}

id LockdownModeServer.__deallocating_deinit()
{
  [*(id *)&v0[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_listener] invalidate];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LockdownModeServer();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LockdownModeServer()
{
  return self;
}

void sub_10000DC88()
{
  id v1 = sub_10000C730();
  id v16 = (void *)type metadata accessor for LockdownModeServer();
  uint64_t v17 = &off_10003D430;
  aBlock = v0;
  uint64_t v2 = (uint64_t)v1 + OBJC_IVAR____TtC13lockdownmoded10IDSManager_delegate;
  swift_beginAccess();
  uint64_t v3 = v0;
  sub_100020FFC((uint64_t)&aBlock, v2, &qword_1000426E0);
  swift_endAccess();

  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t v5 = (void *)swift_allocObject();
  void v5[2] = 0xD000000000000023;
  v5[3] = 0x8000000100034260;
  v5[4] = sub_100020F98;
  v5[5] = v4;
  uint64_t v17 = (_UNKNOWN **)sub_100020FE0;
  unint64_t v18 = v5;
  aBlock = _NSConcreteStackBlock;
  uint64_t v14 = 1107296256;
  NSString v15 = sub_10000C4C0;
  id v16 = &unk_10003D630;
  uint64_t v6 = _Block_copy(&aBlock);
  uint64_t v7 = v3;
  swift_retain();
  swift_release();
  xpc_activity_register("com.apple.lockdownmoded.updateState", XPC_ACTIVITY_CHECK_IN, v6);
  _Block_release(v6);
  swift_release();
  uint64_t v8 = *(NSObject **)((char *)v7 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_eventsQueue);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  uint64_t v17 = (_UNKNOWN **)sub_100020FEC;
  unint64_t v18 = (void *)v9;
  aBlock = _NSConcreteStackBlock;
  uint64_t v14 = 1107296256;
  NSString v15 = sub_10000C4C0;
  id v16 = &unk_10003D680;
  uint64_t v10 = _Block_copy(&aBlock);
  uint64_t v11 = v7;
  swift_release();
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v8, v10);
  _Block_release(v10);
  id v12 = [self defaultCenter];
  [v12 addObserver:v11 selector:"deviceIsSetup" name:NRPairedDeviceRegistryDeviceIsSetupNotification object:0];
}

void sub_10000DF38(_xpc_activity_s *a1, uint64_t a2)
{
  uint64_t v36 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v36 - 8);
  uint64_t v5 = __chkstk_darwin(v36);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v34 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v34 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v34 - v13;
  __chkstk_darwin(v12);
  id v16 = (char *)&v34 - v15;
  if ((*(unsigned char *)(a2 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) & 1) != 0
    || (type metadata accessor for LockdownModeXNU(), (static LockdownModeXNU.lockdownModeEnabled.getter() & 1) != 0))
  {
    if (qword_100041D98 != -1) {
      swift_once();
    }
    if (off_100044150())
    {
      static Logger.daemonLogger.getter();
      uint64_t v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v17, v18))
      {
        double v35 = v11;
        int64_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        uint64_t v20 = v4;
        *(_DWORD *)int64_t v19 = 136315138;
        uint64_t v37 = sub_10001AE5C(0xD000000000000023, 0x8000000100034260, &v38);
        uint64_t v11 = v35;
        uint64_t v21 = v36;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "We're in Buddy. Skipping activity for now: %s", v19, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v22 = v21;
        uint64_t v4 = v20;
        (*(void (**)(char *, uint64_t))(v20 + 8))(v16, v22);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v4 + 8))(v16, v36);
      }
    }
    else
    {
      if (qword_100041D90 != -1) {
        swift_once();
      }
      sub_10002990C();
      sub_1000100E8();
    }
    static Logger.daemonLogger.getter();
    char v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315138;
      uint64_t v37 = sub_10001AE5C(0xD000000000000023, 0x8000000100034260, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "Done running activity: %s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    unint64_t v29 = *(void (**)(char *, uint64_t))(v4 + 8);
    v29(v14, v36);
    if (!xpc_activity_set_state(a1, 5))
    {
      static Logger.daemonLogger.getter();
      id v30 = Logger.logObject.getter();
      unsigned int v31 = v11;
      os_log_type_t v32 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v30, v32))
      {
        unint64_t v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v38 = swift_slowAlloc();
        *(_DWORD *)unint64_t v33 = 136315138;
        uint64_t v37 = sub_10001AE5C(0xD000000000000023, 0x8000000100034260, &v38);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v30, v32, "Could not set activity state to Done: %s", v33, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      v29(v31, v36);
    }
  }
  else
  {
    static Logger.daemonLogger.getter();
    id v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315138;
      uint64_t v37 = sub_10001AE5C(0xD000000000000023, 0x8000000100034260, &v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Lockdown Mode is off. Unregistering activity: %s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v36);
    xpc_activity_unregister("com.apple.lockdownmoded.updateState");
  }
}

void sub_10000E774(void *a1, unsigned char *a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v87 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v85 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = type metadata accessor for DispatchQoS();
  uint64_t v84 = *(void *)(v86 - 8);
  __chkstk_darwin(v86);
  id v83 = (char *)&v72 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v88 = (void (*)(char *, uint64_t))type metadata accessor for DispatchTime();
  uint64_t v82 = *((void *)v88 - 1);
  uint64_t v7 = __chkstk_darwin(v88);
  NSString v80 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  id v81 = (char *)&v72 - v9;
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v72 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v72 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v72 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  id v23 = (char *)&v72 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  id v79 = (char *)&v72 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  id v89 = (char *)&v72 - v27;
  __chkstk_darwin(v26);
  unint64_t v29 = (char *)&v72 - v28;
  id v30 = (const char *)XPC_EVENT_KEY_NAME.getter();
  if (!xpc_dictionary_get_string(a1, v30)) {
    return;
  }
  id v76 = v23;
  char v73 = v17;
  v75 = v20;
  uint64_t v77 = v4;
  uint64_t v31 = String.init(cString:)();
  unint64_t v33 = v32;
  static Logger.daemonLogger.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v34 = Logger.logObject.getter();
  os_log_type_t v35 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v34, v35))
  {
    uint64_t v72 = v11;
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    unint64_t v74 = v14;
    uint64_t v78 = v10;
    *(void *)&long long aBlock = v37;
    *(_DWORD *)uint64_t v36 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&v94[0] = sub_10001AE5C(v31, v33, (uint64_t *)&aBlock);
    uint64_t v11 = v72;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_arrayDestroy();
    uint64_t v10 = v78;
    uint64_t v14 = v74;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v38 = *(void (**)(char *, uint64_t))(v11 + 8);
  v38(v29, v10);
  if (v31 == 0xD000000000000035 && v33 == 0x80000001000342B0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    if (qword_100041D98 != -1) {
      swift_once();
    }
    char v39 = off_100044150();
    BOOL v40 = v89;
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      sub_10001032C(0);
      return;
    }
    static Logger.daemonLogger.getter();
    swift_bridgeObjectRetain();
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v78 = v10;
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v44 = swift_slowAlloc();
      id v88 = v38;
      *(void *)&long long aBlock = v44;
      *(_DWORD *)uint64_t v43 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&v94[0] = sub_10001AE5C(v31, v33, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      long long v45 = "Not handling %s because we're in Buddy";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v41, v42, v45, v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v88(v40, v78);
      return;
    }
    goto LABEL_53;
  }
  if (v31 == 0xD000000000000025 && v33 == 0x80000001000342F0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    sub_100012538();
    a2[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_skipNextKVSSync] = 1;
    sub_10001032C(1);
    return;
  }
  if (v31 == 0xD000000000000021 && v33 == 0x8000000100034320
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v46 = v77;
    if (a2[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_pendingEnablementPrompt] == 1)
    {
      id v47 = v79;
      static Logger.daemonLogger.getter();
      uint64_t v48 = Logger.logObject.getter();
      os_log_type_t v49 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v48, v49))
      {
        uint64_t v50 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v50 = 0;
        _os_log_impl((void *)&_mh_execute_header, v48, v49, "Buddy exited and we have pendingEnablementPrompt set. Scheduling turnOnAlert notification…", v50, 2u);
        swift_slowDealloc();
      }

      v38(v47, v10);
      sub_10000B404(0, (unint64_t *)&qword_100041DA0);
      uint64_t v51 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v52 = v80;
      static DispatchTime.now()();
      uint64_t v53 = v81;
      + infix(_:_:)();
      id v89 = *(char **)(v82 + 8);
      ((void (*)(char *, void))v89)(v52, v88);
      uint64_t v54 = swift_allocObject();
      *(void *)(v54 + 16) = a2;
      uint64_t v92 = sub_100020FF4;
      uint64_t v93 = v54;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v91 = sub_10000C410;
      *((void *)&v91 + 1) = &unk_10003D6D0;
      Swift::String v55 = _Block_copy(&aBlock);
      uint64_t v56 = a2;
      swift_release();
      objc_super v57 = v83;
      static DispatchQoS.unspecified.getter();
      *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
      sub_100023F74(&qword_100042408, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_100005E0C(&qword_100042410);
      sub_10000B3B4(&qword_100042418, &qword_100042410);
      unint64_t v58 = v85;
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
      _Block_release(v55);

      (*(void (**)(char *, uint64_t))(v87 + 8))(v58, v46);
      (*(void (**)(char *, uint64_t))(v84 + 8))(v57, v86);
      ((void (*)(char *, void))v89)(v53, v88);
    }
    return;
  }
  if ((v31 != 0xD000000000000038 || v33 != 0x8000000100034350)
    && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0
    && (v31 != 0xD000000000000033 || v33 != 0x8000000100034390)
    && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
  {
    BOOL v40 = v73;
    static Logger.daemonLogger.getter();
    swift_bridgeObjectRetain();
    uint64_t v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v41, v42))
    {
      uint64_t v78 = v10;
      uint64_t v43 = (uint8_t *)swift_slowAlloc();
      uint64_t v71 = swift_slowAlloc();
      id v88 = v38;
      *(void *)&long long aBlock = v71;
      *(_DWORD *)uint64_t v43 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)&v94[0] = sub_10001AE5C(v31, v33, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      long long v45 = "Unhandled notification: %s";
      goto LABEL_13;
    }
LABEL_53:

    swift_bridgeObjectRelease_n();
    v38(v40, v10);
    return;
  }
  id v89 = (char *)v31;
  static Logger.daemonLogger.getter();
  Swift::String v59 = Logger.logObject.getter();
  os_log_type_t v60 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v59, v60))
  {
    char v61 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)char v61 = 0;
    _os_log_impl((void *)&_mh_execute_header, v59, v60, "Checking if the active paired device is setup…", v61, 2u);
    swift_slowDealloc();
  }

  v38(v76, v10);
  id v62 = [self sharedInstance];
  if (!v62)
  {
    __break(1u);
    return;
  }
  uint64_t v63 = v62;
  id v64 = [v62 getActivePairedDevice];

  if (!v64)
  {
    long long aBlock = 0u;
    long long v91 = 0u;
    swift_bridgeObjectRelease();
LABEL_48:
    sub_100020B10((uint64_t)&aBlock);
    return;
  }
  if ([v64 valueForProperty:NRDevicePropertyIsSetup])
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v94, 0, 32);
  }
  sub_100020ED8((uint64_t)v94, (uint64_t)&aBlock, &qword_1000425E0);
  if (!*((void *)&v91 + 1))
  {
    swift_bridgeObjectRelease();

    goto LABEL_48;
  }
  sub_10000B404(0, &qword_100042748);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_50:
    swift_bridgeObjectRelease();

    return;
  }
  char v65 = a2;
  unint64_t v66 = *(void **)&v94[0];
  if (![*(id *)&v94[0] BOOLValue])
  {

    goto LABEL_50;
  }
  static Logger.daemonLogger.getter();
  v67 = Logger.logObject.getter();
  os_log_type_t v68 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v67, v68))
  {
    char v69 = (uint8_t *)swift_slowAlloc();
    unint64_t v74 = v14;
    *(_WORD *)char v69 = 0;
    _os_log_impl((void *)&_mh_execute_header, v67, v68, "Paired device is setup. Turning on Lockdown Mode (if not Tinker)…", v69, 2u);
    swift_slowDealloc();
  }

  v38(v75, v10);
  if (v65[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled])
  {
    char v70 = 1;
  }
  else
  {
    type metadata accessor for LockdownModeXNU();
    char v70 = static LockdownModeXNU.lockdownModeEnabled.getter();
  }
  sub_100014EA0(v70 & 1);
  swift_bridgeObjectRelease();
}

void sub_10000F874()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemonLogger.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Posting scheduled turnOnPostBuddy notification…", v6, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_100012DF4(2, 0, 1);
}

uint64_t sub_10000F9C8(_xpc_activity_s *a1, uint64_t a2, unint64_t a3, uint64_t (*a4)(_xpc_activity_s *), uint64_t a5)
{
  xpc_activity_t v48 = a1;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v43 = (char *)v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)v40 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  id v47 = (char *)v40 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v44 = (char *)v40 - v19;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)v40 - v20;
  static Logger.daemonLogger.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.default.getter();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v45 = a2;
  uint64_t v46 = v10;
  uint64_t v41 = a4;
  os_log_type_t v42 = v15;
  v40[1] = a5;
  if (v24)
  {
    uint64_t v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v50 = swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v49 = sub_10001AE5C(a2, a3, &v50);
    uint64_t v10 = v46;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Received an XPC activity: %s", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v26 = *(void (**)(char *, uint64_t))(v10 + 8);
  v26(v21, v9);
  uint64_t v28 = v47;
  uint64_t v27 = v48;
  xpc_activity_state_t state = xpc_activity_get_state(v48);
  if (state == 2)
  {
    static Logger.daemonLogger.getter();
    swift_bridgeObjectRetain_n();
    os_log_type_t v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_10001AE5C(v45, a3, &v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Running activity: %s", v37, 0xCu);
      swift_arrayDestroy();
      uint64_t v27 = v48;
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v38 = v47;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      uint64_t v38 = v28;
    }
    v26(v38, v9);
    id v30 = v42;
    if (xpc_activity_set_state(v27, 4)) {
      return v41(v27);
    }
    static Logger.daemonLogger.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      *(_DWORD *)unint64_t v33 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_10001AE5C(v45, a3, &v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      uint64_t v34 = "Could not set activity state to Continue: %s";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (state)
  {
    id v30 = v43;
    static Logger.daemonLogger.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      *(_DWORD *)unint64_t v33 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v49 = sub_10001AE5C(v45, a3, &v50);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      uint64_t v34 = "Error handling activity: %s";
      goto LABEL_17;
    }
LABEL_18:

    swift_bridgeObjectRelease_n();
    return ((uint64_t (*)(char *, uint64_t))v26)(v30, v9);
  }
  id v30 = v44;
  static Logger.daemonLogger.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v31 = Logger.logObject.getter();
  os_log_type_t v32 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v31, v32)) {
    goto LABEL_18;
  }
  unint64_t v33 = (uint8_t *)swift_slowAlloc();
  uint64_t v50 = swift_slowAlloc();
  *(_DWORD *)unint64_t v33 = 136315138;
  swift_bridgeObjectRetain();
  uint64_t v49 = sub_10001AE5C(v45, a3, &v50);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  uint64_t v34 = "Checked-in activity: %s";
LABEL_17:
  _os_log_impl((void *)&_mh_execute_header, v31, v32, v34, v33, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  return ((uint64_t (*)(char *, uint64_t))v26)(v30, v9);
}

void sub_1000100E8()
{
  uint64_t v0 = type metadata accessor for Date();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v4 = sub_10000C684();
  sub_10000C9E0();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [v4 dictionaryForKey:v5];

  if (v6)
  {
    uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    Date.init()();
    Date.timeIntervalSince1970.getter();
    uint64_t v9 = v8;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    uint64_t v17 = &type metadata for Double;
    *(void *)&long long v16 = v9;
    sub_100005F18(&v16, v15);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14[1] = v7;
    sub_10001B9C0(v15, 0x616470557473616CLL, 0xEB00000000646574, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    id v11 = sub_10000C684();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    sub_10000C9E0();
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v11 setDictionary:isa forKey:v13];
  }
}

void sub_10001032C(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  id v11 = (char *)v32 - v10;
  __chkstk_darwin(v9);
  NSString v13 = (char *)v32 - v12;
  sub_10001C5BC();
  if (v14)
  {
    int v15 = a1 & 1;
    if ((a1 & 1) != 0 || *((unsigned char *)v2 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_skipNextKVSSync) != 1)
    {
      static Logger.daemonLogger.getter();
      uint64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v22, v23))
      {
        BOOL v24 = (uint8_t *)swift_slowAlloc();
        uint64_t v25 = swift_slowAlloc();
        v32[1] = v25;
        *(_DWORD *)BOOL v24 = 136446210;
        aBlock[0] = v25;
        if (v15) {
          uint64_t v26 = 0x53746E756F636361;
        }
        else {
          uint64_t v26 = 0x6168436574617473;
        }
        if (v15) {
          unint64_t v27 = 0xED00006E496E6769;
        }
        else {
          unint64_t v27 = 0xEB0000000065676ELL;
        }
        int v33 = v15;
        uint64_t v34 = sub_10001AE5C(v26, v27, aBlock);
        LOBYTE(v15) = v33;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Fetching state from KVS (source: %{public}s)…", v24, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
      id v28 = sub_10000C684();
      uint64_t v29 = swift_allocObject();
      *(void *)(v29 + 16) = v2;
      *(unsigned char *)(v29 + 24) = v15;
      aBlock[4] = (uint64_t)sub_100020F7C;
      aBlock[5] = v29;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_10000C454;
      aBlock[3] = (uint64_t)&unk_10003D590;
      id v30 = _Block_copy(aBlock);
      id v31 = v2;
      swift_release();
      [v28 synchronizeWithCompletionHandler:v30];
      _Block_release(v30);
    }
    else
    {
      *((unsigned char *)v2 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_skipNextKVSSync) = 0;
      static Logger.daemonLogger.getter();
      long long v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.info.getter();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "skipNextKVSSync is set. skipping KVS sync…", v18, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
    }
  }
  else
  {
    static Logger.daemonLogger.getter();
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "No Apple account available. Not syncing with KVS", v21, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
}

uint64_t sub_10001078C(uint64_t a1, _WORD *a2, int a3)
{
  int v208 = a3;
  v212 = a2;
  uint64_t v209 = type metadata accessor for Logger();
  uint64_t v210 = *(void *)(v209 - 8);
  uint64_t v4 = __chkstk_darwin(v209);
  v211 = (char *)&v186 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  v206 = (char *)&v186 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  v205 = (char *)&v186 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  v204 = (char *)&v186 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  v207 = (char *)&v186 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  long long v16 = (char *)&v186 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v186 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v186 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v25 = (char *)&v186 - v24;
  uint64_t v26 = __chkstk_darwin(v23);
  id v28 = (char *)&v186 - v27;
  uint64_t v29 = __chkstk_darwin(v26);
  id v31 = (char *)&v186 - v30;
  uint64_t v32 = __chkstk_darwin(v29);
  uint64_t v34 = (char *)&v186 - v33;
  uint64_t v35 = __chkstk_darwin(v32);
  uint64_t v37 = (char *)&v186 - v36;
  __chkstk_darwin(v35);
  char v39 = (char *)&v186 - v38;
  uint64_t v40 = type metadata accessor for Date();
  uint64_t v41 = __chkstk_darwin(v40);
  uint64_t v44 = (char *)&v186 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      id v47 = (uint8_t *)swift_slowAlloc();
      xpc_activity_t v48 = (void *)swift_slowAlloc();
      *(_DWORD *)id v47 = 138412290;
      swift_errorRetain();
      uint64_t v49 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&long long v216 = v49;
      uint64_t v50 = v210;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *xpc_activity_t v48 = v49;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "Could not sync the state with KVS: %@", v47, 0xCu);
      sub_100005E0C(&qword_1000421F8);
      swift_arrayDestroy();
      uint64_t v51 = v209;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      uint64_t v50 = v210;
      uint64_t v51 = v209;
    }

    return (*(uint64_t (**)(char *, uint64_t))(v50 + 8))(v211, v51);
  }
  v191 = v25;
  uint64_t v203 = v42;
  v198 = v44;
  uint64_t v199 = v41;
  v196 = v39;
  v186 = v34;
  v194 = v31;
  v187 = v37;
  v201 = v28;
  v188 = v19;
  v190 = v16;
  v189 = v22;
  id v52 = sub_10000C684();
  sub_10000C9E0();
  NSString v53 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v54 = [v52 dictionaryForKey:v53];

  if (v54 && (uint64_t v55 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(), v54, v55))
  {
    if (*(void *)(v55 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v56 = sub_10001B688(0x7441746573, 0xE500000000000000);
      if (v57)
      {
        sub_100020BCC(*(void *)(v55 + 56) + 32 * v56, (uint64_t)&v216);
        swift_bridgeObjectRelease();
        if (*((void *)&v217 + 1))
        {
          uint64_t v202 = v55;
          int v58 = swift_dynamicCast();
          int v192 = 0;
          double v59 = *(double *)&v214;
          if (!v58) {
            double v59 = 0.0;
          }
          double v193 = v59;
          int v60 = v58 ^ 1;
          goto LABEL_19;
        }
      }
      else
      {
        long long v216 = 0u;
        long long v217 = 0u;
        swift_bridgeObjectRelease();
      }
      int v192 = 0;
    }
    else
    {
      int v192 = 0;
      long long v216 = 0u;
      long long v217 = 0u;
    }
  }
  else
  {
    uint64_t v55 = 0;
    long long v216 = 0u;
    long long v217 = 0u;
    int v192 = 1;
  }
  uint64_t v202 = v55;
  sub_100020B10((uint64_t)&v216);
  double v193 = 0.0;
  int v60 = 1;
LABEL_19:
  int v195 = v60;
  id v62 = sub_10000C684();
  id v63 = [v62 dictionaryRepresentation];

  uint64_t v64 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v65 = 0;
  unint64_t v200 = 0;
  uint64_t v66 = 0;
  uint64_t v67 = v64 + 64;
  uint64_t v68 = 1;
  uint64_t v69 = 1 << *(unsigned char *)(v64 + 32);
  uint64_t v70 = -1;
  if (v69 < 64) {
    uint64_t v70 = ~(-1 << v69);
  }
  unint64_t v71 = v70 & *(void *)(v64 + 64);
  v211 = (char *)((unint64_t)(v69 + 63) >> 6);
  v197 = (void (**)(_WORD *, uint64_t))(v203 + 8);
  double v72 = 0.0;
  double v73 = 0.0;
  LODWORD(v203) = 1;
  while (1)
  {
    unint64_t v74 = (void (*)(char *, uint64_t))v68;
    uint64_t v75 = v65;
    double v76 = v72;
    if (v71)
    {
      unint64_t v77 = __clz(__rbit64(v71));
      v71 &= v71 - 1;
      unint64_t v78 = v77 | (v66 << 6);
      goto LABEL_44;
    }
    uint64_t v79 = v66 + 1;
    if (__OFADD__(v66, 1))
    {
      __break(1u);
      goto LABEL_170;
    }
    if (v79 >= (uint64_t)v211) {
      goto LABEL_78;
    }
    unint64_t v80 = *(void *)(v67 + 8 * v79);
    ++v66;
    if (!v80)
    {
      uint64_t v66 = v79 + 1;
      if (v79 + 1 >= (uint64_t)v211) {
        goto LABEL_78;
      }
      unint64_t v80 = *(void *)(v67 + 8 * v66);
      if (!v80)
      {
        uint64_t v66 = v79 + 2;
        if (v79 + 2 >= (uint64_t)v211) {
          goto LABEL_78;
        }
        unint64_t v80 = *(void *)(v67 + 8 * v66);
        if (!v80)
        {
          uint64_t v66 = v79 + 3;
          if (v79 + 3 >= (uint64_t)v211) {
            goto LABEL_78;
          }
          unint64_t v80 = *(void *)(v67 + 8 * v66);
          if (!v80)
          {
            uint64_t v66 = v79 + 4;
            if (v79 + 4 >= (uint64_t)v211) {
              goto LABEL_78;
            }
            unint64_t v80 = *(void *)(v67 + 8 * v66);
            if (!v80) {
              break;
            }
          }
        }
      }
    }
LABEL_43:
    unint64_t v71 = (v80 - 1) & v80;
    unint64_t v78 = __clz(__rbit64(v80)) + (v66 << 6);
LABEL_44:
    uint64_t v82 = (uint64_t *)(*(void *)(v64 + 48) + 16 * v78);
    uint64_t v83 = *v82;
    uint64_t v34 = (char *)v82[1];
    swift_bridgeObjectRetain();
    id v62 = v212;
    if (v83 == sub_10000C9E0() && v34 == v84)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_23;
    }
    id v62 = v84;
    char v86 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v86 & 1) != 0
      || (v87._countAndFlagsBits = 0x656369766564,
          v87._object = (void *)0xE600000000000000,
          !String.hasPrefix(_:)(v87)))
    {
LABEL_61:
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    id v88 = sub_10000C684();
    NSString v89 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v62 = [v88 dictionaryForKey:v89];

    double v72 = v76;
    uint64_t v65 = v75;
    uint64_t v68 = (uint64_t)v74;
    if (v62)
    {
      uint64_t v34 = (char *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      if (!*((void *)v34 + 2)) {
        goto LABEL_61;
      }
      id v62 = v34;
      unint64_t v90 = sub_10001B688(0x616470557473616CLL, 0xEB00000000646574);
      if ((v91 & 1) == 0) {
        goto LABEL_61;
      }
      sub_100020BCC(*((void *)v34 + 7) + 32 * v90, (uint64_t)&v216);
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_61;
      }
      double v92 = *(double *)&v214;
      id v62 = v198;
      Date.init()();
      Date.timeIntervalSince1970.getter();
      double v94 = v93;
      (*v197)(v62, v199);
      if (v94 - v92 > 1209600.0) {
        goto LABEL_61;
      }
      if (!*((void *)v34 + 2)) {
        goto LABEL_61;
      }
      id v62 = v34;
      unint64_t v95 = sub_10001B688(0x7441746573, 0xE500000000000000);
      if ((v96 & 1) == 0) {
        goto LABEL_61;
      }
      sub_100020BCC(*((void *)v34 + 7) + 32 * v95, (uint64_t)&v216);
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_61;
      }
      double v97 = *(double *)&v214;
      if (*((void *)v34 + 2)
        && (v62 = v34, unint64_t v98 = sub_10001B688(0x6574617473, 0xE500000000000000), (v99 & 1) != 0))
      {
        sub_100020BCC(*((void *)v34 + 7) + 32 * v98, (uint64_t)&v216);
      }
      else
      {
        long long v216 = 0u;
        long long v217 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((void *)&v217 + 1))
      {
        sub_100020B10((uint64_t)&v216);
        goto LABEL_23;
      }
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_23;
      }
      double v72 = v76;
      uint64_t v65 = v75;
      uint64_t v68 = (uint64_t)v74;
      if (v214 <= 2)
      {
        BOOL v100 = v73 < v97;
        BOOL v101 = v73 >= v97;
        if (v73 < v97) {
          double v73 = v97;
        }
        unint64_t v102 = v200;
        if (v100) {
          unint64_t v102 = v214;
        }
        unint64_t v200 = v102;
        LODWORD(v203) = v101 & v203;
        if (v214 == 1)
        {
          uint64_t v68 = 0;
          double v72 = v97;
          uint64_t v65 = 1;
          if (v76 >= v97) {
            goto LABEL_23;
          }
        }
        else
        {
          double v72 = v76;
          uint64_t v65 = v75;
          uint64_t v68 = (uint64_t)v74;
          if (v214 == 2)
          {
            uint64_t v68 = 0;
            double v72 = v97;
            uint64_t v65 = 2;
            if (v76 >= v97)
            {
LABEL_23:
              double v72 = v76;
              uint64_t v65 = v75;
              uint64_t v68 = (uint64_t)v74;
            }
          }
        }
      }
    }
  }
  uint64_t v81 = v79 + 5;
  if (v81 < (uint64_t)v211)
  {
    unint64_t v80 = *(void *)(v67 + 8 * v81);
    if (!v80)
    {
      while (1)
      {
        uint64_t v66 = v81 + 1;
        if (__OFADD__(v81, 1)) {
          break;
        }
        if (v66 >= (uint64_t)v211) {
          goto LABEL_78;
        }
        unint64_t v80 = *(void *)(v67 + 8 * v66);
        ++v81;
        if (v80) {
          goto LABEL_43;
        }
      }
      __break(1u);
LABEL_194:
      swift_release();
      unint64_t v214 = (unint64_t)v34;
      goto LABEL_196;
    }
    uint64_t v66 = v81;
    goto LABEL_43;
  }
LABEL_78:
  swift_release();
  if ((v203 & 1) == 0)
  {
    uint64_t v107 = swift_allocObject();
    *(void *)(v107 + 16) = v200;
    v108 = (uint64_t *)(v107 + 16);
    double v215 = v73;
    uint64_t v109 = v202;
    if ((v195 & 1) != 0 || (double v110 = v193, v73 >= v193))
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      if (v192)
      {
        long long v216 = 0u;
        long long v217 = 0u;
LABEL_105:
        sub_100020B10((uint64_t)&v216);
        goto LABEL_87;
      }
      if (*(void *)(v202 + 16) && (unint64_t v117 = sub_10001B688(0x6574617473, 0xE500000000000000), (v118 & 1) != 0))
      {
        sub_100020BCC(*(void *)(v109 + 56) + 32 * v117, (uint64_t)&v216);
      }
      else
      {
        long long v216 = 0u;
        long long v217 = 0u;
      }
      swift_bridgeObjectRelease();
      if (!*((void *)&v217 + 1)) {
        goto LABEL_105;
      }
      if (swift_dynamicCast())
      {
        unint64_t v119 = v214;
        if (v214 <= 2)
        {
          if (v208)
          {
            double v215 = v110;
            v173 = v186;
            static Logger.daemonLogger.getter();
            v174 = Logger.logObject.getter();
            os_log_type_t v175 = static os_log_type_t.default.getter();
            BOOL v176 = os_log_type_enabled(v174, v175);
            uint64_t v177 = v209;
            if (v176)
            {
              v178 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v178 = 0;
              swift_slowDealloc();
            }

            (*(void (**)(char *, uint64_t))(v210 + 8))(v173, v177);
          }
          else
          {
            uint64_t *v108 = v214;
            double v215 = v110;
            v120 = v187;
            static Logger.daemonLogger.getter();
            v121 = Logger.logObject.getter();
            os_log_type_t v122 = static os_log_type_t.default.getter();
            BOOL v123 = os_log_type_enabled(v121, v122);
            uint64_t v124 = v209;
            if (!v123)
            {

              (*(void (**)(char *, uint64_t))(v210 + 8))(v120, v124);
              goto LABEL_115;
            }
            uint64_t v125 = swift_slowAlloc();
            uint64_t v64 = swift_slowAlloc();
            *(void *)&long long v216 = v64;
            *(_DWORD *)uint64_t v125 = 136446978;
            unint64_t v114 = v200;
            v211 = (char *)v107;
            if (v200)
            {
              if (v200 == 2)
              {
                unint64_t v126 = 0xE200000000000000;
                uint64_t v127 = 28271;
              }
              else
              {
                if (v200 != 1) {
                  goto LABEL_195;
                }
                unint64_t v126 = 0xE600000000000000;
                uint64_t v127 = 0x646567617473;
              }
            }
            else
            {
              unint64_t v126 = 0xE300000000000000;
              uint64_t v127 = 6710895;
            }
            *(double *)&unint64_t v214 = COERCE_DOUBLE(sub_10001AE5C(v127, v126, (uint64_t *)&v216));
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            *(_WORD *)(v125 + 12) = 2082;
            uint64_t v179 = Double.description.getter();
            *(double *)&unint64_t v214 = COERCE_DOUBLE(sub_10001AE5C(v179, v180, (uint64_t *)&v216));
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            *(_WORD *)(v125 + 22) = 2082;
            uint64_t v181 = Double.description.getter();
            *(double *)&unint64_t v214 = COERCE_DOUBLE(sub_10001AE5C(v181, v182, (uint64_t *)&v216));
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            *(_WORD *)(v125 + 32) = 2082;
            if (v119)
            {
              uint64_t v183 = v209;
              if (v119 == 2)
              {
                unint64_t v184 = 0xE200000000000000;
                uint64_t v185 = 28271;
              }
              else
              {
                if (v119 != 1)
                {
                  unint64_t v214 = v119;
                  goto LABEL_196;
                }
                unint64_t v184 = 0xE600000000000000;
                uint64_t v185 = 0x646567617473;
              }
            }
            else
            {
              unint64_t v184 = 0xE300000000000000;
              uint64_t v183 = v209;
              uint64_t v185 = 6710895;
            }
            *(double *)&unint64_t v214 = COERCE_DOUBLE(sub_10001AE5C(v185, v184, (uint64_t *)&v216));
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            (*(void (**)(char *, uint64_t))(v210 + 8))(v187, v183);
          }
LABEL_115:
          v130 = v201;
          static Logger.daemonLogger.getter();
          swift_retain_n();
          int v131 = Logger.logObject.getter();
          os_log_type_t v132 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v131, v132))
          {
            uint64_t v133 = swift_slowAlloc();
            uint64_t v64 = swift_slowAlloc();
            *(void *)&long long v216 = v64;
            *(_DWORD *)uint64_t v133 = 136446722;
            if (v208) {
              uint64_t v134 = 0x53746E756F636361;
            }
            else {
              uint64_t v134 = 0x6168436574617473;
            }
            if (v208) {
              unint64_t v135 = 0xED00006E496E6769;
            }
            else {
              unint64_t v135 = 0xEB0000000065676ELL;
            }
            *(double *)&unint64_t v214 = COERCE_DOUBLE(sub_10001AE5C(v134, v135, (uint64_t *)&v216));
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            *(_WORD *)(v133 + 12) = 2082;
            swift_beginAccess();
            uint64_t v34 = (char *)*v108;
            if (*v108)
            {
              if (v34 == (char *)2)
              {
                unint64_t v136 = 0xE200000000000000;
                uint64_t v137 = 28271;
              }
              else
              {
                if (v34 != (char *)1) {
                  goto LABEL_194;
                }
                unint64_t v136 = 0xE600000000000000;
                uint64_t v137 = 0x646567617473;
              }
            }
            else
            {
              uint64_t v137 = 6710895;
              unint64_t v136 = 0xE300000000000000;
            }
            *(double *)&unint64_t v214 = COERCE_DOUBLE(sub_10001AE5C(v137, v136, (uint64_t *)&v216));
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_release_n();
            swift_bridgeObjectRelease();
            *(_WORD *)(v133 + 22) = 2082;
            uint64_t v139 = Double.description.getter();
            *(double *)&unint64_t v214 = COERCE_DOUBLE(sub_10001AE5C(v139, v140, (uint64_t *)&v216));
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            _os_log_impl((void *)&_mh_execute_header, v131, v132, "syncWithKVS calculated kvsState (source: %{public}s) is: %{public}s (kvsSetAt: %{public}s)", (uint8_t *)v133, 0x20u);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();

            unint64_t v74 = *(void (**)(char *, uint64_t))(v210 + 8);
            uint64_t v138 = v201;
          }
          else
          {

            swift_release_n();
            unint64_t v74 = *(void (**)(char *, uint64_t))(v210 + 8);
            uint64_t v138 = v130;
          }
          uint64_t v75 = v209;
          v74(v138, v209);
          if ((v208 & 1) == 0)
          {
            id v141 = [self standardUserDefaults];
            sub_10000BA08((NSString)0xEC00000074417465, &v216);

            if (*((void *)&v217 + 1))
            {
              if (swift_dynamicCast())
              {
                double v142 = *(double *)&v214;
                swift_beginAccess();
                if (v215 == v142)
                {
                  v143 = v191;
                  static Logger.daemonLogger.getter();
                  swift_retain_n();
                  unint64_t v71 = Logger.logObject.getter();
                  LOBYTE(v66) = static os_log_type_t.debug.getter();
                  if (os_log_type_enabled((os_log_t)v71, (os_log_type_t)v66))
                  {
                    id v62 = (_WORD *)swift_slowAlloc();
                    *(double *)&unint64_t v214 = COERCE_DOUBLE(swift_slowAlloc());
                    *(_DWORD *)id v62 = 136446466;
                    swift_beginAccess();
                    uint64_t v64 = *v108;
                    if (*v108)
                    {
                      if (v64 == 2)
                      {
                        uint64_t v144 = v75;
                        unint64_t v145 = 0xE200000000000000;
                        uint64_t v146 = 28271;
                      }
                      else
                      {
                        if (v64 != 1)
                        {
                          while (1)
                          {
                            swift_release();
                            uint64_t v213 = v64;
LABEL_196:
                            _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
                            __break(1u);
                          }
                        }
                        uint64_t v144 = v75;
                        unint64_t v145 = 0xE600000000000000;
                        uint64_t v146 = 0x646567617473;
                      }
                      goto LABEL_173;
                    }
LABEL_170:
                    uint64_t v144 = v75;
                    uint64_t v146 = 6710895;
                    unint64_t v145 = 0xE300000000000000;
LABEL_173:
                    uint64_t v213 = sub_10001AE5C(v146, v145, (uint64_t *)&v214);
                    UnsafeMutableRawBufferPointer.copyMemory(from:)();
                    swift_release_n();
                    swift_bridgeObjectRelease();
                    v62[6] = 2082;
                    uint64_t v171 = Double.description.getter();
                    uint64_t v213 = sub_10001AE5C(v171, v172, (uint64_t *)&v214);
                    UnsafeMutableRawBufferPointer.copyMemory(from:)();
                    swift_bridgeObjectRelease();
                    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v71, (os_log_type_t)v66, "We handled the calculated KVS state before (%{public}s, skippedSetAt: %{public}s). Skipping syncWithKVS…", (uint8_t *)v62, 0x16u);
                    swift_arrayDestroy();
                    swift_slowDealloc();
                    swift_slowDealloc();

                    v74(v191, v144);
                    return swift_release();
                  }

                  swift_release_n();
                  v154 = v143;
                  goto LABEL_146;
                }
              }
            }
            else
            {
              sub_100020B10((uint64_t)&v216);
            }
          }
          id v147 = [self standardUserDefaults];
          swift_beginAccess();
          *((void *)&v217 + 1) = &type metadata for Double;
          *(double *)&long long v216 = v215;
          sub_10000BFAC((uint64_t)&v216, 0x5364657070696B73, (NSString)0xEC00000074417465);

          sub_100020B10((uint64_t)&v216);
          swift_beginAccess();
          if ((unint64_t)(*v108 - 1) >= 2)
          {
            v155 = v212;
            if (*v108) {
              return swift_release();
            }
            if ((*((unsigned char *)v212 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) & 1) == 0)
            {
              type metadata accessor for LockdownModeXNU();
              if ((static LockdownModeXNU.lockdownModeEnabled.getter() & 1) == 0)
              {
                sub_10001336C();
                *((unsigned char *)v155 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_enablementPromptShown) = 0;
                static Logger.daemonLogger.getter();
                v161 = Logger.logObject.getter();
                os_log_type_t v162 = static os_log_type_t.default.getter();
                if (os_log_type_enabled(v161, v162))
                {
                  v163 = (uint8_t *)swift_slowAlloc();
                  *(_WORD *)v163 = 0;
                  swift_slowDealloc();
                }

                v154 = v206;
                goto LABEL_146;
              }
            }
            if (v208)
            {
              v149 = v204;
              static Logger.daemonLogger.getter();
              v150 = Logger.logObject.getter();
              os_log_type_t v151 = static os_log_type_t.default.getter();
              if (!os_log_type_enabled(v150, v151)) {
                goto LABEL_145;
              }
              v152 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v152 = 0;
              goto LABEL_144;
            }
            v156 = v205;
            static Logger.daemonLogger.getter();
            v157 = Logger.logObject.getter();
            os_log_type_t v158 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v157, v158))
            {
              v159 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v159 = 0;
              swift_slowDealloc();
            }

            v74(v156, v75);
            char v160 = 0;
LABEL_177:
            sub_100012DF4(v160, 0, 1);
            return swift_release();
          }
          v148 = v212;
          if ((*((unsigned char *)v212 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) & 1) != 0
            || (type metadata accessor for LockdownModeXNU(),
                (static LockdownModeXNU.lockdownModeEnabled.getter() & 1) != 0))
          {
            v149 = v207;
            static Logger.daemonLogger.getter();
            v150 = Logger.logObject.getter();
            os_log_type_t v151 = static os_log_type_t.default.getter();
            if (!os_log_type_enabled(v150, v151))
            {
LABEL_145:

              v154 = v149;
LABEL_146:
              v74(v154, v75);
              return swift_release();
            }
            v152 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v152 = 0;
LABEL_144:
            _os_log_impl((void *)&_mh_execute_header, v150, v151, v153, v152, 2u);
            swift_slowDealloc();
            goto LABEL_145;
          }
          if (*((unsigned char *)v148 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_enablementPromptShown))
          {
            v149 = v190;
            static Logger.daemonLogger.getter();
            v150 = Logger.logObject.getter();
            os_log_type_t v151 = static os_log_type_t.default.getter();
            if (!os_log_type_enabled(v150, v151)) {
              goto LABEL_145;
            }
            v152 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v152 = 0;
            v153 = "enablementPromptShown is already set. No need to show a prompt again";
            goto LABEL_144;
          }
          *((unsigned char *)v148 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_enablementPromptShown) = 1;
          if (v208)
          {
            v164 = v189;
            static Logger.daemonLogger.getter();
            v165 = Logger.logObject.getter();
            os_log_type_t v169 = static os_log_type_t.default.getter();
            if (!os_log_type_enabled(v165, v169))
            {
              char v168 = 1;
              goto LABEL_176;
            }
            v170 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v170 = 0;
            _os_log_impl((void *)&_mh_execute_header, v165, v169, "Posting a turnOnSignIn notification…", v170, 2u);
            char v168 = 1;
          }
          else
          {
            v164 = v188;
            static Logger.daemonLogger.getter();
            v165 = Logger.logObject.getter();
            os_log_type_t v166 = static os_log_type_t.default.getter();
            if (!os_log_type_enabled(v165, v166))
            {
              char v168 = 3;
              goto LABEL_176;
            }
            v167 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v167 = 0;
            _os_log_impl((void *)&_mh_execute_header, v165, v166, "Posting a turnOnStateChange notification…", v167, 2u);
            char v168 = 3;
          }
          swift_slowDealloc();
LABEL_176:

          v74(v164, v75);
          char v160 = v168;
          goto LABEL_177;
        }
      }
    }
LABEL_87:
    if (((v208 & 1) == 0) | v74 & 1) {
      goto LABEL_115;
    }
    uint64_t *v108 = v75;
    double v215 = v73;
    v111 = v194;
    static Logger.daemonLogger.getter();
    v112 = Logger.logObject.getter();
    uint64_t v64 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v112, (os_log_type_t)v64))
    {

      (*(void (**)(char *, uint64_t))(v210 + 8))(v111, v209);
      goto LABEL_115;
    }
    uint64_t v113 = swift_slowAlloc();
    *(void *)&long long v216 = swift_slowAlloc();
    *(_DWORD *)uint64_t v113 = 136446466;
    unint64_t v114 = v200;
    switch(v200)
    {
      case 0uLL:
        unint64_t v115 = 0xE300000000000000;
        uint64_t v116 = 6710895;
        goto LABEL_109;
      case 2uLL:
        unint64_t v115 = 0xE200000000000000;
        uint64_t v116 = 28271;
LABEL_109:
        *(double *)&unint64_t v214 = COERCE_DOUBLE(sub_10001AE5C(v116, v115, (uint64_t *)&v216));
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        *(_WORD *)(v113 + 12) = 2082;
        if (v75)
        {
          if (v75 == 2)
          {
            unint64_t v128 = 0xE200000000000000;
            uint64_t v129 = 28271;
          }
          else
          {
            unint64_t v128 = 0xE600000000000000;
            uint64_t v129 = 0x646567617473;
          }
        }
        else
        {
          unint64_t v128 = 0xE300000000000000;
          uint64_t v129 = 6710895;
        }
        *(double *)&unint64_t v214 = COERCE_DOUBLE(sub_10001AE5C(v129, v128, (uint64_t *)&v216));
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v112, (os_log_type_t)v64, "Latest state on other devices: %{public}s. Latest enabled state on other devices: %{public}s", (uint8_t *)v113, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v210 + 8))(v194, v209);
        goto LABEL_115;
      case 1uLL:
        unint64_t v115 = 0xE600000000000000;
        uint64_t v116 = 0x646567617473;
        goto LABEL_109;
    }
LABEL_195:
    unint64_t v214 = v114;
    goto LABEL_196;
  }
  swift_bridgeObjectRelease();
  Swift::String v103 = v196;
  static Logger.daemonLogger.getter();
  char v104 = Logger.logObject.getter();
  os_log_type_t v105 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v104, v105))
  {
    CFUserNotificationRef v106 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)CFUserNotificationRef v106 = 0;
    _os_log_impl((void *)&_mh_execute_header, v104, v105, "There's no Lockdown Mode state on other devices. Skipping syncWithKVS…", v106, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v210 + 8))(v103, v209);
}

void sub_100012538()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&aBlock - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&aBlock - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&aBlock - v13;
  static Logger.daemonLogger.getter();
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Storing device KVS state (if needed)…", v17, 2u);
    swift_slowDealloc();
  }

  uint64_t v18 = *(void (**)(char *, uint64_t))(v3 + 8);
  v18(v14, v2);
  id v19 = sub_10000C684();
  sub_10000C9E0();
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v21 = [v19 objectForKey:v20];

  if (v21)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_100020B10((uint64_t)&aBlock);
    static Logger.daemonLogger.getter();
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Device state is already set in KVS for this device. No need to store it again", v24, 2u);
      swift_slowDealloc();
    }

    uint64_t v25 = v6;
LABEL_14:
    v18(v25, v2);
    return;
  }
  long long aBlock = 0u;
  long long v38 = 0u;
  sub_100020B10((uint64_t)&aBlock);
  sub_10001C5BC();
  if ((v26 & 1) == 0)
  {
    static Logger.daemonLogger.getter();
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "No Apple account available. Not setting the default device state", v36, 2u);
      swift_slowDealloc();
    }

    uint64_t v25 = v9;
    goto LABEL_14;
  }
  static Logger.daemonLogger.getter();
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v29 = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Synchronizing KVS state to check if device state is already stored…", v29, 2u);
    swift_slowDealloc();
  }

  v18(v12, v2);
  id v30 = sub_10000C684();
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = v1;
  char v39 = sub_100020F3C;
  uint64_t v40 = v31;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v38 = sub_10000C454;
  *((void *)&v38 + 1) = &unk_10003D540;
  uint64_t v32 = _Block_copy(&aBlock);
  id v33 = v1;
  swift_release();
  [v30 synchronizeWithCompletionHandler:v32];
  _Block_release(v32);
}

void sub_1000129BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v29 - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v29 - v12;
  if (a1)
  {
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v14 = Logger.logObject.getter();
    os_log_type_t v15 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v14, v15))
    {
      os_log_type_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = (void *)swift_slowAlloc();
      uint64_t v30 = v5;
      *(_DWORD *)os_log_type_t v16 = 138543362;
      swift_errorRetain();
      uint64_t v18 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)&v31[0] = v18;
      uint64_t v5 = v30;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v17 = v18;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "Could not synchronize to set default device state in KVS: %{public}@", v16, 0xCu);
      sub_100005E0C(&qword_1000421F8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    uint64_t v19 = sub_10000CADC();
    if ((*(unsigned char *)(a2 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) & 1) != 0
      || (type metadata accessor for LockdownModeXNU(), (static LockdownModeXNU.lockdownModeEnabled.getter() & 1) != 0))
    {
      if ((unint64_t)(v19 - 1) >= 2) {
        sub_10000CC14(1);
      }
    }
    else
    {
      id v20 = sub_10000C684();
      sub_10000C9E0();
      NSString v21 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v22 = [v20 objectForKey:v21];

      if (v22)
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
        sub_100020B10((uint64_t)v31);
        static Logger.daemonLogger.getter();
        os_log_type_t v23 = Logger.logObject.getter();
        os_log_type_t v24 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v25 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v25 = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "Device state is already set in KVS. No need to store it again", v25, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
      }
      else
      {
        memset(v31, 0, sizeof(v31));
        sub_100020B10((uint64_t)v31);
        sub_10000CC14(0);
        static Logger.daemonLogger.getter();
        char v26 = Logger.logObject.getter();
        os_log_type_t v27 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v26, v27))
        {
          os_log_type_t v28 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v28 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "Set the default state in KVS for device to off", v28, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v5 + 8))(v13, v4);
      }
    }
  }
}

void sub_100012DF4(char a1, uint64_t a2, char a3)
{
  uint64_t v5 = 0xD000000000000023;
  int v6 = a3 & 1;
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v20 = *(void *)(v7 - 8);
  uint64_t v21 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v19 = 0xD00000000000001ELL;
  switch(a1)
  {
    case 1:
      goto LABEL_7;
    case 4:
      if (0x8000000100033B80 != 0x8000000100033C10) {
        goto LABEL_3;
      }
LABEL_7:
      swift_bridgeObjectRelease();
      break;
    default:
LABEL_3:
      char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        switch(a1)
        {
          case 0:
          case 1:
          case 3:
          case 4:
          case 5:
            char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
            swift_bridgeObjectRelease();
            if ((v11 & 1) == 0)
            {
              switch(a1)
              {
                case 0:
                case 1:
                case 2:
                case 4:
                case 5:
                  char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
                  swift_bridgeObjectRelease();
                  if ((v17 & 1) == 0) {
                    goto LABEL_22;
                  }
                  goto LABEL_8;
                case 3:
                  goto LABEL_7;
                default:
                  goto LABEL_25;
              }
            }
            goto LABEL_8;
          case 2:
            goto LABEL_7;
          default:
LABEL_25:
            JUMPOUT(0);
        }
      }
      return;
  }
LABEL_8:
  if (qword_100041D98 != -1) {
    swift_once();
  }
  if (off_100044150())
  {
    static Logger.daemonLogger.getter();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 136315138;
      unint64_t v15 = 0x8000000100033C10;
      switch(a1)
      {
        case 1:
          break;
        case 2:
          uint64_t v5 = 0xD000000000000026;
          os_log_type_t v16 = "com.apple.LockdownMode.turnOnPostBuddy";
          goto LABEL_18;
        case 3:
          uint64_t v5 = 0xD000000000000028;
          os_log_type_t v16 = "com.apple.LockdownMode.turnOnStateChange";
          goto LABEL_18;
        case 4:
          os_log_type_t v16 = "com.apple.LockdownMode.turnOnFailed";
          goto LABEL_18;
        case 5:
          uint64_t v5 = 0xD000000000000024;
          os_log_type_t v16 = "com.apple.LockdownMode.turnOffFailed";
LABEL_18:
          unint64_t v15 = (unint64_t)(v16 - 32) | 0x8000000000000000;
          break;
        default:
          unint64_t v15 = 0x8000000100033C40;
          uint64_t v5 = v19;
          break;
      }
      uint64_t v23 = sub_10001AE5C(v5, v15, &v24);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Delaying %s notification because we're in Buddy…", v14, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v20 + 8))(v9, v21);
    v22[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_pendingEnablementPrompt] = 1;
  }
  else
  {
LABEL_22:
    id v22 = sub_10000C5AC();
    sub_100007804(a1, a2, v6);
    uint64_t v18 = v22;
  }
}

void sub_10001336C()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer_pendingEnablementPrompt) = 0;
  uint64_t v8 = (char *)sub_10000C5AC();
  uint64_t v1 = *(void **)&v8[OBJC_IVAR____TtC13lockdownmoded20NotificationsManager_notificationCenter];
  if (v1)
  {
    [v1 removeAllDeliveredNotifications];
    if ((void)xmmword_1000422E0)
    {
      uint64_t v2 = (void *)*((void *)&xmmword_1000422E0 + 1);
      uint64_t v3 = (__CFRunLoopSource *)(id)xmmword_1000422E0;
      uint64_t v4 = v2;
      swift_retain();
      CFRunLoopSourceInvalidate(v3);
      CFUserNotificationCancel(v4);
      int v6 = (void *)*((void *)&xmmword_1000422E0 + 1);
      uint64_t v5 = (void *)xmmword_1000422E0;
      xmmword_1000422E0 = 0u;
      *(_OWORD *)&qword_1000422F0 = 0u;
      sub_10000B208(v5, v6);

      swift_release();
      uint64_t v7 = v3;
    }
    else
    {
      uint64_t v7 = (__CFRunLoopSource *)v8;
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_100013454(uint64_t a1, int a2, int a3, int a4, int a5, void *a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, void (*a10)(uint64_t), uint64_t a11)
{
  uint64_t v123 = a7;
  uint64_t v113 = a6;
  int v124 = a5;
  int v127 = a4;
  int v131 = a3;
  LODWORD(v128) = a2;
  uint64_t v132 = a1;
  uint64_t v125 = a11;
  int v129 = a9;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v13 = type metadata accessor for DispatchTime();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  unint64_t v115 = (char *)&v105 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v116 = (char *)&v105 - v17;
  uint64_t v18 = type metadata accessor for Logger();
  uint64_t v19 = *(void *)(v18 - 8);
  uint64_t v20 = __chkstk_darwin(v18);
  v112 = (char *)&v105 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v109 = (char *)&v105 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  v120 = (char *)&v105 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  v108 = (char *)&v105 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  unint64_t v119 = (char *)&v105 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  double v110 = (char *)&v105 - v31;
  uint64_t v32 = __chkstk_darwin(v30);
  unint64_t v114 = (char *)&v105 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  v121 = (char *)&v105 - v35;
  uint64_t v36 = __chkstk_darwin(v34);
  v111 = (char *)&v105 - v37;
  __chkstk_darwin(v36);
  char v39 = (char *)&v105 - v38;
  static Logger.daemonLogger.getter();
  swift_bridgeObjectRetain_n();
  id v40 = v11;
  uint64_t v41 = Logger.logObject.getter();
  int v42 = static os_log_type_t.default.getter();
  BOOL v43 = os_log_type_enabled(v41, (os_log_type_t)v42);
  uint64_t v130 = v19;
  unint64_t v126 = a10;
  uint64_t v133 = v18;
  uint64_t v118 = v13;
  uint64_t v117 = v14;
  if (!v43)
  {

    swift_bridgeObjectRelease_n();
    unint64_t v128 = *(void (**)(char *, uint64_t))(v19 + 8);
    v128(v39, v18);
    char v51 = v132;
    uint64_t v49 = v40;
    char v52 = v131;
    if (v127) {
      goto LABEL_26;
    }
LABEL_17:
    NSString v53 = 0;
    goto LABEL_18;
  }
  int v107 = v42;
  CFUserNotificationRef v106 = v41;
  uint64_t v44 = swift_slowAlloc();
  aBlock[0] = swift_slowAlloc();
  *(_DWORD *)uint64_t v44 = 136447746;
  if (v132) {
    uint64_t v45 = 28271;
  }
  else {
    uint64_t v45 = 6710895;
  }
  if (v132) {
    unint64_t v46 = 0xE200000000000000;
  }
  else {
    unint64_t v46 = 0xE300000000000000;
  }
  uint64_t v135 = sub_10001AE5C(v45, v46, aBlock);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease();
  *(_WORD *)(v44 + 12) = 1026;
  LODWORD(v135) = v128 & 1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v44 + 18) = 1026;
  LODWORD(v135) = v131 & 1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v44 + 24) = 1026;
  LODWORD(v135) = v124 & 1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v44 + 30) = 2082;
  if (a8) {
    uint64_t v47 = 7628147;
  }
  else {
    uint64_t v47 = 0x74657320746F6ELL;
  }
  if (a8) {
    unint64_t v48 = 0xE300000000000000;
  }
  else {
    unint64_t v48 = 0xE700000000000000;
  }
  uint64_t v135 = sub_10001AE5C(v47, v48, aBlock);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
  *(_WORD *)(v44 + 40) = 1026;
  LODWORD(v135) = v129 & 1;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *(_WORD *)(v44 + 46) = 1026;
  uint64_t v49 = v40;
  if (*((unsigned char *)v40 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) == 1)
  {

    int v50 = 1;
  }
  else
  {
    type metadata accessor for LockdownModeXNU();
    char v56 = static LockdownModeXNU.lockdownModeEnabled.getter();

    int v50 = v56 & 1;
  }
  char v52 = v131;
  char v57 = v127;
  int v58 = v106;
  os_log_type_t v59 = v107;
  LODWORD(v135) = v50;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  _os_log_impl((void *)&_mh_execute_header, v58, v59, "Setting Lockdown Mode state to: %{public}s, forAllDevices: %{BOOL,public}d, includePaired: %{BOOL,public}d, setRestrictions: %{BOOL,public}d, passcode: %{public}s, skipAccount: %{BOOL,public}d. Current state: %{BOOL,public}d", (uint8_t *)v44, 0x34u);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  unint64_t v128 = *(void (**)(char *, uint64_t))(v130 + 8);
  v128(v39, v133);
  char v51 = v132;
  if ((v57 & 1) == 0) {
    goto LABEL_17;
  }
LABEL_26:
  int v60 = v49;
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v62 = self;
  id v63 = [v62 bundleForClass:ObjCClassFromMetadata];
  v136._object = (void *)0xEC000000656D616ELL;
  v64._countAndFlagsBits = 0x4E574F444B434F4CLL;
  v64._object = (void *)0xED000045444F4D5FLL;
  v65._countAndFlagsBits = 0;
  v65._object = (void *)0xE000000000000000;
  v136._countAndFlagsBits = 0x2065727574616546;
  Swift::String v66 = NSLocalizedString(_:tableName:bundle:value:comment:)(v64, (Swift::String_optional)0, (NSBundle)v63, v65, v136);

  id v67 = [v62 bundleForClass:ObjCClassFromMetadata];
  v137._object = (void *)0xEB00000000656C74;
  v68._countAndFlagsBits = 0x41505F5245544E45;
  v68._object = (void *)0xEE0045444F435353;
  v69._countAndFlagsBits = 0;
  v69._object = (void *)0xE000000000000000;
  v137._countAndFlagsBits = 0x6974207472656C41;
  Swift::String v70 = NSLocalizedString(_:tableName:bundle:value:comment:)(v68, (Swift::String_optional)0, (NSBundle)v67, v69, v137);

  NSString v53 = sub_10002449C(v66._countAndFlagsBits, (uint64_t)v66._object, v70._countAndFlagsBits, (uint8_t *)v70._object, v123, a8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v49 = v60;
  if (!v53)
  {
    unint64_t v71 = v111;
    static Logger.daemonLogger.getter();
    double v72 = Logger.logObject.getter();
    os_log_type_t v73 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v72, v73))
    {
      unint64_t v74 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v74 = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "Could not get authentication context. Unknown error", v74, 2u);
      swift_slowDealloc();
    }

    v128(v71, v133);
    sub_100020ABC();
    uint64_t v75 = swift_allocError();
    *(void *)uint64_t v76 = 0;
    *(void *)(v76 + 8) = 0;
    *(unsigned char *)(v76 + 16) = 2;
    v126(v75);
    swift_errorRelease();
    return;
  }
LABEL_18:
  if ((v129 & 1) == 0)
  {
    sub_10001C5BC();
    char v54 = v55;
    if ((v52 & 1) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  char v54 = 0;
  if (v52) {
LABEL_22:
  }
    sub_100014EA0(v51 & 1);
LABEL_23:
  sub_100024EF4(v51 & 1, (uint64_t)v53);
  *((unsigned char *)v49 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) = v51 & 1;
  uint64_t v132 = sub_10002C8D8();
  os_log_type_t v105 = v49;
  if (v124)
  {
    if (v51) {
      sub_100029204();
    }
    char v77 = v54;
    unint64_t v78 = v53;
    if (v113) {
      uint64_t v79 = v113;
    }
    else {
      uint64_t v79 = &_swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRetain();
    sub_100028564(v51 & 1, (uint64_t)v79);
    swift_bridgeObjectRelease();
  }
  else
  {
    char v77 = v54;
    unint64_t v78 = v53;
  }
  unint64_t v80 = self;
  id v81 = [v80 standardUserDefaults];
  Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  static Constants.userDefaultsKey.getter();
  NSString v83 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v81 setObject:isa forKey:v83 inDomain:NSGlobalDomain];

  id v84 = [v80 standardUserDefaults];
  [v84 synchronize];

  id v85 = [v80 standardUserDefaults];
  sub_10000BD28(0x5364657070696B73, (NSString)0xEC00000074417465);

  char v86 = v78;
  if ((v124 & 1) != 0 && (v51 & 1) == 0) {
    sub_100029674();
  }
  if (v77)
  {
    sub_10000CC14(v51 & 1);
    dispatch_semaphore_t v87 = dispatch_semaphore_create(0);
    id v88 = v114;
    static Logger.daemonLogger.getter();
    NSString v89 = Logger.logObject.getter();
    os_log_type_t v90 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v89, v90))
    {
      char v91 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)char v91 = 67240192;
      LODWORD(aBlock[0]) = v51 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v89, v90, "Synchronizing the new state with KVS… (enabled: %{BOOL,public}d)", v91, 8u);
      swift_slowDealloc();
    }

    v128(v88, v133);
    id v92 = sub_10000C684();
    uint64_t v93 = swift_allocObject();
    *(void *)(v93 + 16) = v87;
    aBlock[4] = (uint64_t)sub_100023F6C;
    aBlock[5] = v93;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10000C454;
    aBlock[3] = (uint64_t)&unk_10003D978;
    double v94 = _Block_copy(aBlock);
    unint64_t v95 = v87;
    swift_release();
    [v92 synchronizeWithCompletionHandler:v94];
    _Block_release(v94);

    char v96 = v115;
    static DispatchTime.now()();
    double v97 = v116;
    + infix(_:_:)();
    unint64_t v98 = *(void (**)(char *, uint64_t))(v117 + 8);
    uint64_t v99 = v118;
    v98(v96, v118);
    OS_dispatch_semaphore.wait(timeout:)();
    v98(v97, v99);
    if (static DispatchTimeoutResult.== infix(_:_:)())
    {
      BOOL v100 = v110;
      static Logger.daemonLogger.getter();
      BOOL v101 = Logger.logObject.getter();
      os_log_type_t v102 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v101, v102))
      {
        Swift::String v103 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)Swift::String v103 = 0;
        _os_log_impl((void *)&_mh_execute_header, v101, v102, "Could not synchronize after setting key in KVS in setEnabled. Waited too long. Continuing anyways…", v103, 2u);
        BOOL v100 = v110;
        swift_slowDealloc();
        char v104 = v95;
      }
      else
      {
        char v104 = v101;
        BOOL v101 = v95;
      }

      v128(v100, v133);
    }
    else
    {
    }
  }
  v126(0);
  swift_release();
}

Swift::Int sub_100014C7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v17 = a2;
      uint64_t v10 = swift_slowAlloc();
      uint64_t v16 = v4;
      char v11 = (uint8_t *)v10;
      uint64_t v12 = (void *)swift_slowAlloc();
      *(_DWORD *)char v11 = 138543362;
      swift_errorRetain();
      uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v18 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v12 = v13;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Could not synchronize after setting key in KVS in setEnabled: %{public}@. Continuing anyways…", v11, 0xCu);
      sub_100005E0C(&qword_1000421F8);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v4 = v16;
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return OS_dispatch_semaphore.signal()();
}

void sub_100014EA0(char a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = sub_10000C730();
  uint64_t v8 = sub_10002F990();

  if (v8)
  {
    static Logger.daemonLogger.getter();
    os_log_type_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      char v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v19 = v1;
      char v12 = a1;
      uint64_t v13 = v11;
      *(_DWORD *)char v11 = 67240192;
      LODWORD(v17) = v12 & 1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Sending setState message to Watch… (enabled: %{BOOL,public}d)", v13, 8u);
      a1 = v12;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    id v14 = sub_10000C730();
    sub_100005E0C(&qword_1000426D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1000333A0;
    uint64_t v17 = 1701869940;
    unint64_t v18 = 0xE400000000000000;
    AnyHashable.init<A>(_:)();
    *(void *)(inited + 96) = &type metadata for Int;
    *(void *)(inited + 72) = 0;
    uint64_t v17 = 0x64656C62616E65;
    unint64_t v18 = 0xE700000000000000;
    AnyHashable.init<A>(_:)();
    *(void *)(inited + 168) = &type metadata for Bool;
    *(unsigned char *)(inited + 144) = a1 & 1;
    sub_100004734(inited);
    sub_10002FAF4();

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_10001514C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v16 = a2;
      uint64_t v10 = swift_slowAlloc();
      uint64_t v15 = v4;
      char v11 = (uint8_t *)v10;
      id v14 = (void *)swift_slowAlloc();
      *(_DWORD *)char v11 = 138543362;
      swift_errorRetain();
      uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v17 = v12;
      a2 = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v14 = v12;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Could not migrate from NSUserDefaults. Failed to turn on Lockdown Mode: %{public}@", v11, 0xCu);
      sub_100005E0C(&qword_1000421F8);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v4 = v15;
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return a2(a1);
}

Swift::Bool __swiftcall LockdownModeServer.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  return sub_100020370(shouldAcceptNewConnection.super.isa);
}

uint64_t sub_100015388(void *a1, const char *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemonLogger.getter();
  uint64_t v8 = a1;
  os_log_type_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v17 = v4;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v16 = a2;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v15 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    unint64_t v18 = v8;
    uint64_t v13 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v15 = v8;

    uint64_t v4 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v16, v12, 0xCu);
    sub_100005E0C(&qword_1000421F8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    os_log_type_t v9 = v8;
  }

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void LockdownModeServer.setEnabled(enabled:options:completion:)(int a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  v108 = a3;
  uint64_t v109 = a4;
  uint64_t v110 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v110 - 8);
  uint64_t v8 = __chkstk_darwin(v110);
  os_log_type_t v10 = (char *)&v96 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  int v107 = (char *)&v96 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  CFUserNotificationRef v106 = (char *)&v96 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  os_log_type_t v105 = (char *)&v96 - v16;
  __chkstk_darwin(v15);
  unint64_t v18 = (char *)&v96 - v17;
  id v19 = [self currentConnection];
  if (!v19) {
    goto LABEL_14;
  }
  uint64_t v20 = v19;
  int v104 = a1;
  Swift::String v103 = v4;
  NSString v21 = String._bridgeToObjectiveC()();
  id v22 = [v20 valueForEntitlement:v21];

  if (v22)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v114 = 0u;
    long long v115 = 0u;
  }
  sub_100020ED8((uint64_t)&v114, (uint64_t)v113, &qword_1000425E0);
  if (!v113[3])
  {

    sub_100020B10((uint64_t)v113);
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0 || v111 != 1)
  {

LABEL_14:
    static Logger.daemonLogger.getter();
    uint64_t v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      v113[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 136315138;
      *(void *)&long long v114 = sub_10001AE5C(0xD00000000000002ALL, 0x8000000100033F40, v113);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Client is missing entitlement: %s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v110);
    uint64_t v30 = v108;
    sub_100020ABC();
    swift_allocError();
    *(void *)uint64_t v31 = 0xD00000000000002ALL;
    *(void *)(v31 + 8) = 0x8000000100033F40;
    *(unsigned char *)(v31 + 16) = 0;
    v30();
    goto LABEL_17;
  }
  if (!a2)
  {
    long long v114 = 0u;
    long long v115 = 0u;
    sub_100020B10((uint64_t)&v114);
    long long v114 = 0u;
    long long v115 = 0u;
    sub_100020B10((uint64_t)&v114);
    long long v114 = 0u;
    long long v115 = 0u;
    sub_100020B10((uint64_t)&v114);
    long long v114 = 0u;
    long long v115 = 0u;
    sub_100020B10((uint64_t)&v114);
    long long v114 = 0u;
    long long v115 = 0u;
    sub_100020B10((uint64_t)&v114);
    long long v114 = 0u;
    long long v115 = 0u;
    sub_100020B10((uint64_t)&v114);
    uint64_t v102 = 0;
    uint64_t v101 = 0;
    int v100 = 0;
    int v33 = 0;
    long long v114 = 0u;
    long long v115 = 0u;
    int v34 = 1;
    int v99 = 1;
    char v32 = 1;
    uint64_t v24 = v110;
LABEL_89:
    uint64_t v58 = sub_100020B10((uint64_t)&v114);
    goto LABEL_91;
  }
  uint64_t v111 = static Constants.stateOptionReboot.getter();
  uint64_t v112 = v23;
  AnyHashable.init<A>(_:)();
  uint64_t v24 = v110;
  if (*(void *)(a2 + 16) && (unint64_t v25 = sub_10001B568((uint64_t)v113), (v26 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v25, (uint64_t)&v114);
  }
  else
  {
    long long v114 = 0u;
    long long v115 = 0u;
  }
  sub_100020B78((uint64_t)v113);
  if (!*((void *)&v115 + 1))
  {
    sub_100020B10((uint64_t)&v114);
    goto LABEL_24;
  }
  if (!swift_dynamicCast())
  {
LABEL_24:
    char v32 = 1;
    goto LABEL_25;
  }
  char v32 = v113[0];
LABEL_25:
  uint64_t v111 = static Constants.stateOptionPasscode.getter();
  uint64_t v112 = v35;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v36 = sub_10001B568((uint64_t)v113), (v37 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v36, (uint64_t)&v114);
  }
  else
  {
    long long v114 = 0u;
    long long v115 = 0u;
  }
  sub_100020B78((uint64_t)v113);
  if (*((void *)&v115 + 1))
  {
    int v38 = swift_dynamicCast();
    uint64_t v39 = v113[0];
    if (!v38) {
      uint64_t v39 = 0;
    }
    uint64_t v101 = v39;
    if (v38) {
      uint64_t v40 = v113[1];
    }
    else {
      uint64_t v40 = 0;
    }
    uint64_t v102 = v40;
  }
  else
  {
    sub_100020B10((uint64_t)&v114);
    uint64_t v102 = 0;
    uint64_t v101 = 0;
  }
  uint64_t v111 = static Constants.stateOptionAllDevices.getter();
  uint64_t v112 = v41;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v42 = sub_10001B568((uint64_t)v113), (v43 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v42, (uint64_t)&v114);
  }
  else
  {
    long long v114 = 0u;
    long long v115 = 0u;
  }
  sub_100020B78((uint64_t)v113);
  if (!*((void *)&v115 + 1))
  {
    sub_100020B10((uint64_t)&v114);
    goto LABEL_45;
  }
  if (!swift_dynamicCast())
  {
LABEL_45:
    int v100 = 0;
    goto LABEL_46;
  }
  int v100 = LOBYTE(v113[0]);
LABEL_46:
  uint64_t v111 = static Constants.stateOptionIncludePaired.getter();
  uint64_t v112 = v44;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v45 = sub_10001B568((uint64_t)v113), (v46 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v45, (uint64_t)&v114);
  }
  else
  {
    long long v114 = 0u;
    long long v115 = 0u;
  }
  sub_100020B78((uint64_t)v113);
  if (!*((void *)&v115 + 1))
  {
    sub_100020B10((uint64_t)&v114);
    goto LABEL_54;
  }
  if (!swift_dynamicCast())
  {
LABEL_54:
    int v47 = 1;
    goto LABEL_55;
  }
  int v47 = LOBYTE(v113[0]);
LABEL_55:
  int v99 = v47;
  uint64_t v111 = static Constants.stateOptionAcknowledgementOnly.getter();
  uint64_t v112 = v48;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v49 = sub_10001B568((uint64_t)v113), (v50 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v49, (uint64_t)&v114);
  }
  else
  {
    long long v114 = 0u;
    long long v115 = 0u;
  }
  sub_100020B78((uint64_t)v113);
  if (!*((void *)&v115 + 1))
  {
    sub_100020B10((uint64_t)&v114);
    goto LABEL_63;
  }
  if (!swift_dynamicCast())
  {
LABEL_63:
    int v33 = 0;
    goto LABEL_64;
  }
  int v33 = LOBYTE(v113[0]);
LABEL_64:
  uint64_t v111 = static Constants.stateOptionRequireAuthentication.getter();
  uint64_t v112 = v51;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v52 = sub_10001B568((uint64_t)v113), (v53 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v52, (uint64_t)&v114);
  }
  else
  {
    long long v114 = 0u;
    long long v115 = 0u;
  }
  sub_100020B78((uint64_t)v113);
  if (*((void *)&v115 + 1))
  {
    if (swift_dynamicCast())
    {
      int v34 = LOBYTE(v113[0]);
      goto LABEL_73;
    }
  }
  else
  {
    sub_100020B10((uint64_t)&v114);
  }
  int v34 = 1;
LABEL_73:
  uint64_t v111 = static Constants.stateOptionExcludeRestrictions.getter();
  uint64_t v112 = v54;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16))
  {
    unint64_t v55 = sub_10001B568((uint64_t)v113);
    if (v56)
    {
      sub_100020BCC(*(void *)(a2 + 56) + 32 * v55, (uint64_t)&v114);
    }
    else
    {
      long long v114 = 0u;
      long long v115 = 0u;
    }
  }
  else
  {
    long long v114 = 0u;
    long long v115 = 0u;
  }
  sub_100020B78((uint64_t)v113);
  uint64_t v57 = v102;
  if (!*((void *)&v115 + 1)) {
    goto LABEL_89;
  }
  sub_100005E0C(&qword_1000425F0);
  uint64_t v58 = swift_dynamicCast();
  if ((v58 & 1) == 0)
  {
    uint64_t v102 = v57;
LABEL_91:
    id v63 = 0;
    Swift::String v70 = v103;
    if (v104) {
      goto LABEL_101;
    }
    goto LABEL_92;
  }
  char v59 = v32;
  uint64_t v60 = v113[0];
  uint64_t v61 = *(void *)(v113[0] + 16);
  if (v61)
  {
    int v97 = v34;
    int v98 = v33;
    swift_bridgeObjectRetain();
    uint64_t v96 = v60;
    id v62 = (void **)(v60 + 40);
    id v63 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      uint64_t v64 = (uint64_t)*(v62 - 1);
      Swift::String v65 = *v62;
      swift_bridgeObjectRetain();
      v66._countAndFlagsBits = v64;
      v66._object = v65;
      unint64_t v67 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10003D020, v66);
      swift_bridgeObjectRelease();
      if (v67 <= 7)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v63 = sub_10001AD60(0, *((void *)v63 + 2) + 1, 1, v63);
        }
        unint64_t v69 = *((void *)v63 + 2);
        unint64_t v68 = *((void *)v63 + 3);
        if (v69 >= v68 >> 1) {
          id v63 = sub_10001AD60((char *)(v68 > 1), v69 + 1, 1, v63);
        }
        *((void *)v63 + 2) = v69 + 1;
        v63[v69 + 32] = v67;
      }
      v62 += 2;
      --v61;
    }
    while (v61);
    swift_bridgeObjectRelease();
    uint64_t v24 = v110;
    int v33 = v98;
    int v34 = v97;
  }
  else
  {
    id v63 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v58 = swift_bridgeObjectRelease();
  Swift::String v70 = v103;
  char v32 = v59;
  if (v104)
  {
LABEL_101:
    if (v33)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v104) {
        goto LABEL_105;
      }
      goto LABEL_103;
    }
LABEL_108:
    if (qword_100041D98 != -1) {
      uint64_t v58 = swift_once();
    }
    int v82 = v34;
    int v83 = off_100044150(v58);
    char v84 = v83;
    if ((v104 & 1) != 0 && v83)
    {
      static Logger.daemonLogger.getter();
      id v85 = Logger.logObject.getter();
      os_log_type_t v86 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v85, v86))
      {
        dispatch_semaphore_t v87 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)dispatch_semaphore_t v87 = 0;
        _os_log_impl((void *)&_mh_execute_header, v85, v86, "Client requested to turn on Lockdown Mode while in Buddy. Clearing all notifications…", v87, 2u);
        Swift::String v70 = v103;
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v7 + 8))(v107, v24);
      sub_10001336C();
    }
    id v88 = v70;
    uint64_t v89 = swift_allocObject();
    *(void *)(v89 + 16) = v108;
    *(void *)(v89 + 24) = v109;
    uint64_t v90 = v104 & 1;
    *(unsigned char *)(v89 + 32) = v104 & 1;
    *(unsigned char *)(v89 + 33) = v84;
    *(void *)(v89 + 40) = v88;
    *(unsigned char *)(v89 + 48) = v32;
    swift_retain();
    id v91 = v88;
    sub_100013454(v90, v100, v99, v82, 1, v63, v101, v102, 0, (void (*)(uint64_t))sub_100020B74, v89);
    swift_release();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_92:
  if (v34) {
    goto LABEL_101;
  }
  char v71 = v32;
  int v72 = v33;
  static Logger.daemonLogger.getter();
  os_log_type_t v73 = Logger.logObject.getter();
  os_log_type_t v74 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v73, v74))
  {
    uint64_t v75 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v75 = 0;
    _os_log_impl((void *)&_mh_execute_header, v73, v74, "Client requested to turn off Lockdown Mode without authentication. Ignoring override…", v75, 2u);
    Swift::String v70 = v103;
    swift_slowDealloc();
  }

  uint64_t v58 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v18, v24);
  if (!v72)
  {
    int v34 = 1;
    char v32 = v71;
    goto LABEL_108;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_103:
  if ((*((unsigned char *)v70 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) & 1) != 0
    || (type metadata accessor for LockdownModeXNU(), (static LockdownModeXNU.lockdownModeEnabled.getter() & 1) != 0))
  {
LABEL_105:
    uint64_t v76 = v106;
    static Logger.daemonLogger.getter();
    char v77 = Logger.logObject.getter();
    os_log_type_t v78 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v77, v78))
    {
      uint64_t v79 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v79 = 0;
      _os_log_impl((void *)&_mh_execute_header, v77, v78, "Client requested acknowledgementOnly but Lockdown Mode is either already on or client wants to turn it on. Ignoring acknowledgementOnly…", v79, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v76, v24);
    sub_100020ABC();
    uint64_t v80 = swift_allocError();
    *(void *)uint64_t v81 = 0;
    *(void *)(v81 + 8) = 0;
    *(unsigned char *)(v81 + 16) = 2;
    ((void (*)(uint64_t))v108)(v80);

LABEL_17:
    swift_errorRelease();
    return;
  }
  id v92 = v105;
  static Logger.daemonLogger.getter();
  uint64_t v93 = Logger.logObject.getter();
  os_log_type_t v94 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v93, v94))
  {
    unint64_t v95 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v95 = 0;
    _os_log_impl((void *)&_mh_execute_header, v93, v94, "Client requested acknowledgementOnly. Clearing Lockdown Mode notifications…", v95, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v92, v24);
  sub_10001336C();
  ((void (*)(void))v108)(0);
}

uint64_t sub_10001645C(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, char a4, char a5, uint64_t a6, char a7)
{
  uint64_t v50 = a3;
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v48 = *(void *)(v12 - 8);
  uint64_t v49 = v12;
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  unint64_t v18 = (char *)&v47 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  NSString v21 = (char *)&v47 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v47 - v22;
  if (a1)
  {
    uint64_t v54 = a1;
    swift_errorRetain();
    sub_100005E0C((uint64_t *)&unk_100042440);
    if (swift_dynamicCast())
    {
      if (v53 == 2 && v51 == 1 && !v52)
      {
        static Logger.daemonLogger.getter();
        uint64_t v24 = Logger.logObject.getter();
        os_log_type_t v25 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v24, v25))
        {
          char v26 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)char v26 = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "Cancelled setting Lockdown Mode state", v26, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v48 + 8))(v18, v49);
        a1 = 0;
        return a2(a1);
      }
      sub_100020CEC(v51, v52, v53);
    }
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v40, v41))
    {
      uint64_t v42 = swift_slowAlloc();
      char v43 = (void *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      *(_DWORD *)uint64_t v42 = 136446466;
      if (a4) {
        uint64_t v44 = 28271;
      }
      else {
        uint64_t v44 = 6710895;
      }
      if (a4) {
        unint64_t v45 = 0xE200000000000000;
      }
      else {
        unint64_t v45 = 0xE300000000000000;
      }
      int v47 = a2;
      uint64_t v54 = sub_10001AE5C(v44, v45, &v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v42 + 12) = 2114;
      swift_errorRetain();
      uint64_t v46 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v54 = v46;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v43 = v46;
      a2 = v47;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v40, v41, "Could not set the Lockdown Mode state to %{public}s: %{public}@", (uint8_t *)v42, 0x16u);
      sub_100005E0C(&qword_1000421F8);
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

    (*(void (**)(char *, uint64_t))(v48 + 8))(v15, v49);
    return a2(a1);
  }
  int v47 = a2;
  if (a5) {
    uint64_t v27 = 0;
  }
  else {
    uint64_t v27 = 2;
  }
  sub_10002E9E8(a4 & 1, v27);
  sub_10001336C();
  static Logger.daemonLogger.getter();
  os_log_type_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t v31 = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136446210;
    uint64_t v51 = v31;
    if (a4) {
      uint64_t v32 = 28271;
    }
    else {
      uint64_t v32 = 6710895;
    }
    if (a4) {
      unint64_t v33 = 0xE200000000000000;
    }
    else {
      unint64_t v33 = 0xE300000000000000;
    }
    uint64_t v54 = sub_10001AE5C(v32, v33, &v51);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "Successfully set the Lockdown Mode state to %{public}s", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v34 = v49;
  uint64_t v35 = *(void (**)(char *, uint64_t))(v48 + 8);
  v35(v23, v49);
  if (a7)
  {
    static Logger.daemonLogger.getter();
    unint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v36, v37))
    {
      int v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "Rebooting…", v38, 2u);
      swift_slowDealloc();
    }

    v35(v21, v34);
    sub_10002E488(0xD000000000000016, (void *)0x80000001000344B0);
  }
  return v47(0);
}

void sub_100016B38(uint64_t a1, uint64_t a2)
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

void LockdownModeServer.getEnabledInAccount(synchronize:completion:)(char a1, void (*a2)(void), uint64_t a3)
{
  id v4 = v3;
  uint64_t v30 = a2;
  uint64_t v31 = a3;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  os_log_type_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v29 - v11;
  id v13 = [self currentConnection];
  if (v13)
  {
    uint64_t v14 = v13;
    NSString v15 = String._bridgeToObjectiveC()();
    id v16 = [v14 valueForEntitlement:v15];

    if (v16)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v37, 0, sizeof(v37));
    }
    sub_100020ED8((uint64_t)v37, (uint64_t)aBlock, &qword_1000425E0);
    if (v33)
    {
      if ((swift_dynamicCast() & 1) != 0 && v36 == 1)
      {
        if (a1)
        {
          static Logger.daemonLogger.getter();
          uint64_t v17 = Logger.logObject.getter();
          os_log_type_t v18 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v17, v18))
          {
            uint64_t v19 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v19 = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, v18, "Client requested to fetch the state from KVS…", v19, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
          id v20 = sub_10000C684();
          NSString v21 = (void *)swift_allocObject();
          uint64_t v22 = v31;
          v21[2] = v30;
          v21[3] = v22;
          v21[4] = v4;
          uint64_t v34 = sub_100020C30;
          uint64_t v35 = v21;
          aBlock[0] = (uint64_t)_NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          aBlock[2] = (uint64_t)sub_10000C454;
          unint64_t v33 = &unk_10003D3E8;
          uint64_t v23 = _Block_copy(aBlock);
          swift_retain();
          id v24 = v4;
          swift_release();
          [v20 synchronizeWithCompletionHandler:v23];
          _Block_release(v23);
        }
        else
        {
          sub_10000CF04();
          v30(v28 & 1);
        }
        return;
      }
    }
    else
    {

      sub_100020B10((uint64_t)aBlock);
    }
  }
  static Logger.daemonLogger.getter();
  os_log_type_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v27 = 136315138;
    *(void *)&v37[0] = sub_10001AE5C(0xD00000000000002ALL, 0x8000000100033F40, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "Client is missing entitlement: %s", v27, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v30(0);
}

uint64_t sub_10001701C(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v20 = a3;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = swift_slowAlloc();
      uint64_t v19 = a2;
      uint64_t v12 = (uint8_t *)v11;
      id v13 = (void *)swift_slowAlloc();
      uint64_t v18 = v5;
      *(_DWORD *)uint64_t v12 = 138412290;
      v17[1] = v12 + 4;
      swift_errorRetain();
      uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v21 = v14;
      uint64_t v5 = v18;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v13 = v14;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Could not synchronize state with KVS: %@", v12, 0xCu);
      sub_100005E0C(&qword_1000421F8);
      swift_arrayDestroy();
      swift_slowDealloc();
      a2 = v19;
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_10000CF04();
  return a2(v15 & 1);
}

void LockdownModeServer.notifyRestrictionChanged(_:completion:)(uint64_t a1, void *a2, void (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v54 = a4;
  unint64_t v55 = a3;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v53 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)v50 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v50 - v13;
  if (qword_100041D90 != -1) {
    swift_once();
  }
  uint64_t v15 = static RestrictionsManager.shared;
  id v16 = [self currentConnection];
  swift_bridgeObjectRetain();
  v60._countAndFlagsBits = a1;
  v60._object = a2;
  unsigned __int8 v17 = _s13lockdownmoded19RestrictionsManagerC14RestrictionKeyO8rawValueAESgSS_tcfC_0(v60);
  if (v17 == 8) {
    goto LABEL_11;
  }
  unsigned __int8 v18 = v17;
  swift_beginAccess();
  uint64_t v19 = *(void *)(v15 + 24);
  if (!*(void *)(v19 + 16)) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v20 = sub_10001B700(v18);
  if ((v21 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    sub_100020ABC();
    uint64_t v30 = swift_allocError();
    *(void *)uint64_t v31 = a1;
    *(void *)(v31 + 8) = a2;
    *(unsigned char *)(v31 + 16) = 1;
    swift_bridgeObjectRetain();
    v55(v30);
    swift_errorRelease();

    return;
  }
  uint64_t v22 = *(void *)(*(void *)(v19 + 56) + 8 * v20);
  swift_retain();
  swift_bridgeObjectRelease();
  uint64_t v23 = *(void *)(v22 + 128);
  uint64_t v52 = v22;
  if (!v23)
  {
    static Logger.daemonLogger.getter();
    swift_bridgeObjectRetain_n();
    uint64_t v32 = Logger.logObject.getter();
    os_log_type_t v33 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v58 = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 136315138;
      uint64_t v51 = v34 + 4;
      swift_bridgeObjectRetain();
      *(void *)&long long v56 = sub_10001AE5C(a1, (unint64_t)a2, (uint64_t *)&v58);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "Could not update restriction because it is not set as updatable: %s", v34, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v53 + 8))(v9, v6);
    uint64_t v35 = v55;
    sub_100020ABC();
    uint64_t v36 = swift_allocError();
    *(void *)uint64_t v37 = a1;
    *(void *)(v37 + 8) = a2;
    *(unsigned char *)(v37 + 16) = 1;
    swift_bridgeObjectRetain();
    uint64_t v38 = v36;
    goto LABEL_38;
  }
  uint64_t v24 = *(void *)(v22 + 120);
  *(void *)&long long v58 = 0xD000000000000020;
  *((void *)&v58 + 1) = 0x8000000100033F70;
  String.append(_:)(*(Swift::String *)(&v23 - 1));
  unint64_t v25 = *((void *)&v58 + 1);
  uint64_t v51 = (uint8_t *)v58;
  if (!v16)
  {
    unint64_t v27 = *((void *)&v58 + 1);
    long long v58 = 0u;
    long long v59 = 0u;
    sub_100020B10((uint64_t)&v58);
    long long v58 = 0u;
    long long v59 = 0u;
LABEL_33:
    sub_100020B10((uint64_t)&v58);
    goto LABEL_34;
  }
  id v26 = v16;
  unint64_t v27 = v25;
  NSString v28 = String._bridgeToObjectiveC()();
  id v29 = [v26 valueForEntitlement:v28];

  if (v29)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
  }
  sub_100020ED8((uint64_t)&v56, (uint64_t)&v58, &qword_1000425E0);
  if (*((void *)&v59 + 1))
  {
    if (swift_dynamicCast())
    {
      if (v56 != 1) {
        goto LABEL_34;
      }
LABEL_29:
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v52 + 112))
      {
        static Logger.daemonLogger.getter();
        os_log_type_t v41 = Logger.logObject.getter();
        os_log_type_t v42 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v41, v42))
        {
          char v43 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)char v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, v42, "Restriction is already set to changed. No need to update", v43, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v53 + 8))(v14, v6);
      }
      else
      {
        *(unsigned char *)(v52 + 112) = 1;
        sub_100029204();
      }
      v55(0);

      goto LABEL_39;
    }
  }
  else
  {
    sub_100020B10((uint64_t)&v58);
  }
  NSString v39 = String._bridgeToObjectiveC()();
  id v40 = [v26 valueForEntitlement:v39];

  if (v40)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
  }
  sub_100020ED8((uint64_t)&v56, (uint64_t)&v58, &qword_1000425E0);
  if (!*((void *)&v59 + 1)) {
    goto LABEL_33;
  }
  if (swift_dynamicCast() & 1) != 0 && (v56) {
    goto LABEL_29;
  }
LABEL_34:
  static Logger.daemonLogger.getter();
  unint64_t v44 = v27;
  swift_bridgeObjectRetain_n();
  unint64_t v45 = Logger.logObject.getter();
  os_log_type_t v46 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v45, v46))
  {
    int v47 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v58 = swift_slowAlloc();
    *(_DWORD *)int v47 = 136315138;
    v50[1] = v47 + 4;
    swift_bridgeObjectRetain();
    uint64_t v48 = (uint64_t)v51;
    *(void *)&long long v56 = sub_10001AE5C((uint64_t)v51, v44, (uint64_t *)&v58);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "Client is missing entitlement: %s", v47, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v53 + 8))(v12, v6);
    uint64_t v35 = v55;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v12, v6);
    uint64_t v35 = v55;
    uint64_t v48 = (uint64_t)v51;
  }
  sub_100020ABC();
  uint64_t v38 = swift_allocError();
  *(void *)uint64_t v49 = v48;
  *(void *)(v49 + 8) = v44;
  *(unsigned char *)(v49 + 16) = 0;
LABEL_38:
  v35(v38);
  swift_errorRelease();

LABEL_39:
  swift_release();
}

void LockdownModeServer.enableIfNeeded(reboot:completion:)(char a1, void (*a2)(void, uint64_t), uint64_t a3)
{
  os_log_type_t v33 = a2;
  uint64_t v32 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v32 - 8);
  uint64_t v7 = __chkstk_darwin(v32);
  uint64_t v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v29 - v10;
  id v12 = [self currentConnection];
  if (v12)
  {
    uint64_t v13 = v12;
    id v30 = v3;
    NSString v14 = String._bridgeToObjectiveC()();
    id v15 = [v13 valueForEntitlement:v14];

    if (v15)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
    }
    sub_100020ED8((uint64_t)&v35, (uint64_t)v37, &qword_1000425E0);
    if (v38)
    {
      if swift_dynamicCast() && (v34)
      {
LABEL_16:
        static Logger.daemonLogger.getter();
        unsigned __int8 v18 = Logger.logObject.getter();
        os_log_type_t v19 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v18, v19))
        {
          unint64_t v20 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)unint64_t v20 = 67109120;
          LODWORD(v37[0]) = a1 & 1;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v18, v19, "Client requested to enableIfNeeded (reboot: %{BOOL}d)", v20, 8u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v32);
        swift_retain();
        id v21 = v30;
        sub_10001D798(0, (uint64_t)v21, v33, a3, v21, a1 & 1);

        swift_release();
        return;
      }
    }
    else
    {
      sub_100020B10((uint64_t)v37);
    }
    NSString v16 = String._bridgeToObjectiveC()();
    id v17 = [v13 valueForEntitlement:v16];

    if (v17)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
    }
    sub_100020ED8((uint64_t)&v35, (uint64_t)v37, &qword_1000425E0);
    if (v38)
    {
      if (swift_dynamicCast() & 1) != 0 && (v34) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_100020B10((uint64_t)v37);
    }
  }
  static Logger.daemonLogger.getter();
  uint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.error.getter();
  BOOL v24 = os_log_type_enabled(v22, v23);
  uint64_t v31 = a3;
  if (v24)
  {
    unint64_t v25 = (uint8_t *)swift_slowAlloc();
    v37[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v25 = 136315138;
    *(void *)&long long v35 = sub_10001AE5C(0xD000000000000027, 0x8000000100033FA0, v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Client is missing entitlement: %s", v25, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v32);
  id v26 = v33;
  sub_100020ABC();
  uint64_t v27 = swift_allocError();
  *(void *)uint64_t v28 = 0xD000000000000027;
  *(void *)(v28 + 8) = 0x8000000100033FA0;
  *(unsigned char *)(v28 + 16) = 0;
  v26(0, v27);
  swift_errorRelease();
}

uint64_t sub_100018084(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v22 = a2;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    type metadata accessor for LockdownModeXNU();
    if (static LockdownModeXNU.lockdownModeEnabled.getter())
    {
      char v16 = 0;
LABEL_13:
      uint64_t v17 = v16 & 1;
      uint64_t v18 = 0;
      return v22(v17, v18);
    }
    if (*(unsigned char *)(a4 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled))
    {
      char v16 = 1;
    }
    else
    {
      char v16 = static LockdownModeXNU.lockdownModeEnabled.getter();
      if ((v16 & 1) == 0) {
        goto LABEL_13;
      }
    }
    if (a5)
    {
      sub_10002E488(0xD00000000000001ALL, (void *)0x80000001000343D0);
      char v16 = 1;
    }
    goto LABEL_13;
  }
  static Logger.daemonLogger.getter();
  swift_errorRetain();
  swift_errorRetain();
  id v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v12, v13))
  {
    NSString v14 = (uint8_t *)swift_slowAlloc();
    id v21 = (void *)swift_slowAlloc();
    *(_DWORD *)NSString v14 = 138412290;
    unint64_t v20 = v14 + 4;
    swift_errorRetain();
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    uint64_t v23 = v15;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v21 = v15;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Could not enableIfNeeded: %@", v14, 0xCu);
    sub_100005E0C(&qword_1000421F8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v17 = 0;
  uint64_t v18 = a1;
  return v22(v17, v18);
}

void sub_100018354(void *a1, int a2, uint64_t a3, void *aBlock, void (*a5)(uint64_t, id, void *))
{
  uint64_t v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  id v9 = a1;
  a5(a3, v9, v8);
  _Block_release(v8);
  _Block_release(v8);
}

void sub_1000183DC(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

uint64_t LockdownModeServer.migrateIfNeeded(completion:)(void (*a1)(void), uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v26 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  id v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v24 - v10;
  id v12 = [self currentConnection];
  if (v12)
  {
    os_log_type_t v13 = v12;
    NSString v14 = String._bridgeToObjectiveC()();
    id v15 = [v13 valueForEntitlement:v14];

    if (v15)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v28, 0, sizeof(v28));
    }
    sub_100020ED8((uint64_t)v28, (uint64_t)v29, &qword_1000425E0);
    if (v29[3])
    {
      if ((swift_dynamicCast() & 1) != 0 && v27 == 1)
      {
        static Logger.daemonLogger.getter();
        char v16 = Logger.logObject.getter();
        os_log_type_t v17 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v16, v17))
        {
          uint64_t v18 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v18 = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, v17, "Client requested to migrateIfNeeded", v18, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v6);
        swift_retain();
        sub_10001F5D0(1u, v3, (void (*)(void))a1, a2);

        return swift_release();
      }
    }
    else
    {

      sub_100020B10((uint64_t)v29);
    }
  }
  static Logger.daemonLogger.getter();
  unint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v25 = v6;
    uint64_t v22 = (uint8_t *)swift_slowAlloc();
    v29[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315138;
    *(void *)&v28[0] = sub_10001AE5C(0xD000000000000027, 0x8000000100033FA0, v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Client is missing entitlement: %s", v22, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v25);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v6);
  }
  sub_100020ABC();
  swift_allocError();
  *(void *)uint64_t v23 = 0xD000000000000027;
  *(void *)(v23 + 8) = 0x8000000100033FA0;
  *(unsigned char *)(v23 + 16) = 0;
  a1();
  return swift_errorRelease();
}

uint64_t sub_100018880(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  os_log_type_t v19 = a2;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)&v17 - v8;
  if (a1)
  {
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      id v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v18 = (void *)swift_slowAlloc();
      *(_DWORD *)id v12 = 138412290;
      os_log_type_t v17 = v12 + 4;
      swift_errorRetain();
      uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v20 = v13;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v18 = v13;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Could not migrateIfNeeded: %@", v12, 0xCu);
      sub_100005E0C(&qword_1000421F8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }
    id v9 = v7;
  }
  else
  {
    static Logger.daemonLogger.getter();
    uint64_t v10 = Logger.logObject.getter();
    uint64_t v14 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, (os_log_type_t)v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, (os_log_type_t)v14, "Successfully ran migrateIfNeeded", v15, 2u);
      swift_slowDealloc();
    }
    a1 = 0;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  return v19(a1);
}

void LockdownModeServer.rebootIfNeeded(completion:)(void (*a1)(void), uint64_t a2)
{
  uint64_t v39 = a2;
  id v40 = a1;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v38 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  id v9 = (char *)&v36 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  id v12 = (char *)&v36 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v36 - v13;
  id v15 = [self currentConnection];
  if (v15)
  {
    char v16 = v15;
    uint64_t v36 = v2;
    uint64_t v37 = v3;
    NSString v17 = String._bridgeToObjectiveC()();
    id v18 = [v16 valueForEntitlement:v17];

    if (v18)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v42 = 0u;
      long long v43 = 0u;
    }
    sub_100020ED8((uint64_t)&v42, (uint64_t)v44, &qword_1000425E0);
    if (v45)
    {
      if swift_dynamicCast() && (v41) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_100020B10((uint64_t)v44);
    }
    NSString v19 = String._bridgeToObjectiveC()();
    id v20 = [v16 valueForEntitlement:v19];

    if (v20)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v42 = 0u;
      long long v43 = 0u;
    }
    sub_100020ED8((uint64_t)&v42, (uint64_t)v44, &qword_1000425E0);
    if (v45)
    {
      if (swift_dynamicCast() & 1) != 0 && (v41)
      {
LABEL_16:
        static Logger.daemonLogger.getter();
        os_log_type_t v21 = Logger.logObject.getter();
        os_log_type_t v22 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v21, v22))
        {
          uint64_t v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v23 = 0;
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "Checking if a reboot is needed…", v23, 2u);
          swift_slowDealloc();
        }

        uint64_t v24 = v37;
        uint64_t v25 = *(void (**)(char *, uint64_t))(v38 + 8);
        v25(v14, v37);
        if (qword_100041D90 != -1) {
          swift_once();
        }
        if (*(unsigned char *)(static RestrictionsManager.shared + 32) == 1
          && ((*(unsigned char *)(v36 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) & 1) != 0
           || (type metadata accessor for LockdownModeXNU(),
               (static LockdownModeXNU.lockdownModeEnabled.getter() & 1) != 0)
           || (static LockdownModeXNU.lockdownModeEnabled.getter() & 1) == 0))
        {
          static Logger.daemonLogger.getter();
          os_log_type_t v33 = Logger.logObject.getter();
          os_log_type_t v34 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v33, v34))
          {
            long long v35 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)long long v35 = 0;
            _os_log_impl((void *)&_mh_execute_header, v33, v34, "Lockdown Mode was turned on by a migrator. Rebooting…", v35, 2u);
            swift_slowDealloc();
          }

          v25(v12, v24);
          sub_10002E488(0xD00000000000001ALL, (void *)0x8000000100033FD0);
        }
        else
        {
          static Logger.daemonLogger.getter();
          uint64_t v26 = Logger.logObject.getter();
          os_log_type_t v27 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v26, v27))
          {
            uint64_t v28 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v28 = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, v27, "Lockdown Mode was not turned on by a migrator. No need to reboot", v28, 2u);
            swift_slowDealloc();
          }

          v25(v9, v24);
        }
        ((void (*)(void))v40)(0);

        return;
      }
    }
    else
    {
      sub_100020B10((uint64_t)v44);
    }

    uint64_t v3 = v37;
  }
  static Logger.daemonLogger.getter();
  uint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, v30))
  {
    uint64_t v31 = (uint8_t *)swift_slowAlloc();
    v44[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 136315138;
    *(void *)&long long v42 = sub_10001AE5C(0xD000000000000027, 0x8000000100033FA0, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Client is missing entitlement: %s", v31, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v38 + 8))(v6, v3);
  sub_100020ABC();
  swift_allocError();
  *(void *)uint64_t v32 = 0xD000000000000027;
  *(void *)(v32 + 8) = 0x8000000100033FA0;
  *(unsigned char *)(v32 + 16) = 0;
  v40();
  swift_errorRelease();
}

void sub_100019240(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  uint64_t v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
  _Block_release(v6);
}

void sub_1000192BC(uint64_t a1, char a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v20 - v9;
  if (a1)
  {
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v20[0] = v4;
      id v15 = (void *)v14;
      *(_DWORD *)uint64_t v13 = 138412290;
      swift_errorRetain();
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      v20[1] = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v15 = v16;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Could not turn on Lockdown Mode due to an error: %@", v13, 0xCu);
      sub_100005E0C(&qword_1000421F8);
      swift_arrayDestroy();
      uint64_t v4 = v20[0];
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  else
  {
    if ((a2 - 1) >= 3u)
    {
      static Logger.daemonLogger.getter();
      NSString v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v17, v18))
      {
        NSString v19 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)NSString v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Unhandled category", v19, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    }
    else
    {
      sub_10002E9E8(1, 0x40301u >> (8 * (a2 - 1)));
    }
    sub_10002E488(0xD00000000000001DLL, (void *)0x80000001000343F0);
  }
}

void sub_1000195D0()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  v42[1] = (char *)v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)v42 - v5;
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)v42 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)v42 - v10;
  uint64_t v12 = sub_100005E0C(&qword_1000426D0);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  id v15 = (char *)v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  NSString v17 = (char *)v42 - v16;
  os_log_type_t v18 = [self sharedInstance];
  id v19 = [v18 getActivePairedDevice];
  id v20 = v19;
  if (!v18) {
    goto LABEL_15;
  }
  uint64_t v43 = v1;
  if (v19)
  {
    uint64_t v21 = v0;
    os_log_type_t v22 = v18;
    id v23 = [v20 pairingID];
    if (v23)
    {
      uint64_t v24 = v23;
      static UUID._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v25 = type metadata accessor for UUID();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v15, 0, 1, v25);
    }
    else
    {
      uint64_t v25 = type metadata accessor for UUID();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v15, 1, 1, v25);
    }
    sub_100020ED8((uint64_t)v15, (uint64_t)v17, &qword_1000426D0);
    type metadata accessor for UUID();
    uint64_t v29 = *(void *)(v25 - 8);
    Class isa = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v17, 1, v25) != 1)
    {
      Class isa = UUID._bridgeToObjectiveC()().super.isa;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v25);
    }
  }
  else
  {
    id v20 = 0;
    uint64_t v21 = v0;
    uint64_t v26 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v17, 1, 1, v26);
    os_log_type_t v27 = v18;
    Class isa = 0;
  }
  unsigned __int8 v30 = [v18 hasCompletedInitialSyncForPairingID:isa];

  uint64_t v0 = v21;
  uint64_t v1 = v43;
  if (v30)
  {
    if ((*(unsigned char *)(v44 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) & 1) != 0
      || (type metadata accessor for LockdownModeXNU(), (static LockdownModeXNU.lockdownModeEnabled.getter() & 1) != 0))
    {
      static Logger.daemonLogger.getter();
      uint64_t v31 = Logger.logObject.getter();
      os_log_type_t v32 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v31, v32))
      {
        os_log_type_t v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v33 = 0;
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "deviceIsSetup called. Turning on Lockdown Mode on paired device (if not Tinker)…", v33, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
      sub_100014EA0(1);
    }
    else
    {
      static Logger.daemonLogger.getter();
      uint64_t v38 = Logger.logObject.getter();
      os_log_type_t v39 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v38, v39))
      {
        id v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v40 = 0;
        _os_log_impl((void *)&_mh_execute_header, v38, v39, "deviceIsSetup called but Lockdown Mode is off. No action needed", v40, 2u);
        uint64_t v1 = v43;
        swift_slowDealloc();
        char v41 = v18;
      }
      else
      {
        char v41 = v38;
        uint64_t v38 = v18;
      }

      (*(void (**)(char *, uint64_t))(v1 + 8))(v6, v0);
    }
  }
  else
  {
LABEL_15:
    static Logger.daemonLogger.getter();
    os_log_type_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "deviceIsSetup called but paired device hasn't completed initial sync. Skipping for now…", v36, 2u);
      swift_slowDealloc();
      uint64_t v37 = v18;
    }
    else
    {
      uint64_t v37 = v34;
      os_log_type_t v34 = v18;
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v11, v0);
  }
}

void sub_100019D70(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  os_log_type_t v73 = (void (*)(char *, uint64_t))((char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v71 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v71 - v10;
  uint64_t v12 = __chkstk_darwin(v9);
  os_log_type_t v74 = (char *)&v71 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v71 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  int v72 = (char *)&v71 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v71 - v20;
  __chkstk_darwin(v19);
  id v23 = (char *)&v71 - v22;
  static Logger.daemonLogger.getter();
  uint64_t v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v76 = v2;
  if (v26)
  {
    os_log_type_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Received IDS message", v27, 2u);
    uint64_t v2 = v76;
    swift_slowDealloc();
  }

  unsigned __int8 v30 = *(char **)(v3 + 8);
  uint64_t v29 = (unsigned char *)(v3 + 8);
  uint64_t v28 = v30;
  ((void (*)(char *, uint64_t))v30)(v23, v2);
  uint64_t v77 = 1701869940;
  unint64_t v78 = 0xE400000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v31 = sub_10001B568((uint64_t)v79), (v32 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a1 + 56) + 32 * v31, (uint64_t)&v80);
  }
  else
  {
    long long v80 = 0u;
    long long v81 = 0u;
  }
  sub_100020B78((uint64_t)v79);
  if (!*((void *)&v81 + 1))
  {
    sub_100020B10((uint64_t)&v80);
LABEL_17:
    id v40 = v8;
    static Logger.daemonLogger.getter();
    swift_bridgeObjectRetain_n();
    char v41 = Logger.logObject.getter();
    os_log_type_t v42 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v41, v42))
    {

      swift_bridgeObjectRelease_n();
      ((void (*)(char *, uint64_t))v28)(v40, v76);
      return;
    }
    uint64_t v43 = swift_slowAlloc();
    os_log_type_t v74 = v40;
    uint64_t v44 = (uint8_t *)v43;
    uint64_t v45 = swift_slowAlloc();
    uint64_t v75 = v29;
    v79[0] = v45;
    os_log_type_t v73 = (void (*)(char *, uint64_t))v28;
    *(_DWORD *)uint64_t v44 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v46 = Dictionary.description.getter();
    unint64_t v48 = v47;
    swift_bridgeObjectRelease();
    *(void *)&long long v80 = sub_10001AE5C(v46, v48, v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v41, v42, "Incoming message is missing a type: %{public}s", v44, 0xCu);
    swift_arrayDestroy();
LABEL_19:
    swift_slowDealloc();
    swift_slowDealloc();

    v73(v74, v76);
    return;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_17;
  }
  if (v77 == 1)
  {
    uint64_t v49 = v75;
    uint64_t v50 = (void (*)(char *, uint64_t))v28;
    static Logger.daemonLogger.getter();
    uint64_t v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v52))
    {
      uint64_t v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v53 = 0;
      swift_slowDealloc();
    }

    v50(v11, v76);
    if (v49[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled])
    {
      char v54 = 1;
    }
    else
    {
      type metadata accessor for LockdownModeXNU();
      char v54 = static LockdownModeXNU.lockdownModeEnabled.getter();
    }
    sub_100014EA0(v54 & 1);
    return;
  }
  if (v77) {
    goto LABEL_17;
  }
  os_log_type_t v33 = v75;
  os_log_type_t v34 = (void (*)(char *, uint64_t))v28;
  static Logger.daemonLogger.getter();
  os_log_type_t v35 = Logger.logObject.getter();
  os_log_type_t v36 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v35, v36))
  {
    uint64_t v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v37 = 0;
    swift_slowDealloc();
  }

  v34(v21, v76);
  uint64_t v77 = 0x64656C62616E65;
  unint64_t v78 = 0xE700000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v38 = sub_10001B568((uint64_t)v79), (v39 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a1 + 56) + 32 * v38, (uint64_t)&v80);
  }
  else
  {
    long long v80 = 0u;
    long long v81 = 0u;
  }
  sub_100020B78((uint64_t)v79);
  if (!*((void *)&v81 + 1))
  {
    uint64_t v75 = v29;
    sub_100020B10((uint64_t)&v80);
LABEL_38:
    long long v59 = v74;
    static Logger.daemonLogger.getter();
    swift_bridgeObjectRetain_n();
    char v41 = Logger.logObject.getter();
    os_log_type_t v60 = static os_log_type_t.error.getter();
    if (!os_log_type_enabled(v41, v60))
    {

      swift_bridgeObjectRelease_n();
      v34(v59, v76);
      return;
    }
    uint64_t v61 = (uint8_t *)swift_slowAlloc();
    v79[0] = swift_slowAlloc();
    os_log_type_t v73 = v34;
    *(_DWORD *)uint64_t v61 = 136446210;
    int v72 = (char *)(v61 + 4);
    swift_bridgeObjectRetain();
    uint64_t v62 = Dictionary.description.getter();
    unint64_t v64 = v63;
    swift_bridgeObjectRelease();
    *(void *)&long long v80 = sub_10001AE5C(v62, v64, v79);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v41, v60, "Incoming setState message is invalid: %{public}s", v61, 0xCu);
    swift_arrayDestroy();
    goto LABEL_19;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    uint64_t v75 = v29;
    goto LABEL_38;
  }
  uint64_t v55 = v77;
  if (v33[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled] == 1)
  {
    if (v77)
    {
LABEL_31:
      static Logger.daemonLogger.getter();
      long long v56 = Logger.logObject.getter();
      os_log_type_t v57 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v56, v57))
      {
        long long v58 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)long long v58 = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "Local state matches the one in the IDS message. No action needed", v58, 2u);
        swift_slowDealloc();
      }

      v34(v16, v76);
      return;
    }
  }
  else
  {
    type metadata accessor for LockdownModeXNU();
    if (v55 == (static LockdownModeXNU.lockdownModeEnabled.getter() & 1)) {
      goto LABEL_31;
    }
  }
  Swift::String v65 = v72;
  static Logger.daemonLogger.getter();
  Swift::String v66 = Logger.logObject.getter();
  os_log_type_t v67 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v66, v67))
  {
    unint64_t v68 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)unint64_t v68 = 67109120;
    LODWORD(v79[0]) = v55;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v66, v67, "Setting Lockdown Mode state to: %{BOOL}d from IDS message…", v68, 8u);
    swift_slowDealloc();
  }

  v34(v65, v76);
  uint64_t v69 = swift_allocObject();
  *(void *)(v69 + 16) = v33;
  Swift::String v70 = v33;
  sub_100013454(v55, 0, 0, v55 ^ 1, 1, 0, 0, 0, 0, sub_100020ED0, v69);
  swift_release();
}

void sub_10001A8D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v20 - v9;
  if (a1)
  {
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v20[1] = a2;
      uint64_t v13 = swift_slowAlloc();
      uint64_t v21 = v4;
      uint64_t v14 = (uint8_t *)v13;
      uint64_t v15 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 138412290;
      swift_errorRetain();
      uint64_t v16 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v22 = v16;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v15 = v16;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Could not turn on Lockdown Mode due to an error: %@", v14, 0xCu);
      sub_100005E0C(&qword_1000421F8);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v4 = v21;
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    sub_100012DF4(5, 0, 1);
  }
  else
  {
    static Logger.daemonLogger.getter();
    uint64_t v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Rebooting…", v19, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    sub_10002E488(0xD000000000000014, (void *)0x8000000100034240);
  }
}

unint64_t ServerError.errorDescription.getter(uint64_t a1, void *a2, char a3)
{
  if (!a3)
  {
    _StringGuts.grow(_:)(23);
    swift_bridgeObjectRelease();
    unint64_t v5 = 0xD000000000000015;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    _StringGuts.grow(_:)(25);
    swift_bridgeObjectRelease();
    unint64_t v5 = 0xD000000000000017;
LABEL_5:
    unint64_t v8 = v5;
    v6._countAndFlagsBits = a1;
    v6._object = a2;
    String.append(_:)(v6);
    return v8;
  }
  unint64_t result = 0x206E776F6E6B6E55;
  switch(a1)
  {
    case 1:
      unint64_t result = 0xD000000000000018;
      break;
    case 2:
      unint64_t result = 0xD000000000000026;
      break;
    case 3:
      unint64_t result = 0xD00000000000001ALL;
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_10001AD48()
{
  return ServerError.errorDescription.getter(*(void *)v0, *(void **)(v0 + 8), *(unsigned char *)(v0 + 16));
}

char *sub_10001AD60(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    int64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    int64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      int64_t v9 = *((void *)a4 + 2);
    }
    else {
      int64_t v9 = v7;
    }
    if (v9)
    {
      sub_100005E0C(&qword_100042758);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * v11 - 64;
      os_log_type_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[v8 + 32]) {
          memmove(v12, a4 + 32, v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      os_log_type_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100021060(0, v8, v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001AE5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001AF30(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100020BCC((uint64_t)v12, *a3);
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
      sub_100020BCC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000B304((uint64_t)v12);
  return v7;
}

uint64_t sub_10001AF30(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001B0EC(a5, a6);
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

uint64_t sub_10001B0EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001B184(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001B364(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001B364(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001B184(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001B2FC(v2, 0);
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

void *sub_10001B2FC(uint64_t a1, uint64_t a2)
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
  sub_100005E0C((uint64_t *)&unk_100042760);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001B364(char a1, int64_t a2, char a3, char *a4)
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
    sub_100005E0C((uint64_t *)&unk_100042760);
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

unint64_t sub_10001B4B4(uint64_t a1)
{
  Hasher.init(_seed:)();
  type metadata accessor for CFString(0);
  sub_100023F74((unint64_t *)&qword_100042750, type metadata accessor for CFString);
  _CFObject.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();

  return sub_10001BD4C(a1, v2);
}

unint64_t sub_10001B568(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10001BEA8(a1, v4);
}

unint64_t sub_10001B5AC(int a1)
{
  uint64_t v2 = static Hasher._hash(seed:bytes:count:)();

  return sub_10001BF70(a1, v2);
}

unint64_t sub_10001B5F4(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_10001C00C(a1, v2);
}

unint64_t sub_10001B688(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10001C184(a1, a2, v4);
}

unint64_t sub_10001B700(unsigned __int8 a1)
{
  Swift::Int v2 = sub_100026EEC();

  return sub_10001C268(a1, v2);
}

_OWORD *sub_10001B744(_OWORD *a1, void *a2, char a3)
{
  Swift::Int v4 = (void **)v3;
  int64_t v7 = (void *)*v3;
  unint64_t v9 = sub_10001B4B4((uint64_t)a2);
  uint64_t v10 = v7[2];
  BOOL v11 = (v8 & 1) == 0;
  uint64_t v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v13 = v8;
  uint64_t v14 = v7[3];
  if (v14 < v12 || (a3 & 1) == 0)
  {
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_10002B494();
      goto LABEL_7;
    }
    sub_10002A444(v12, a3 & 1);
    unint64_t v18 = sub_10001B4B4((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      unint64_t v9 = v18;
      uint64_t v15 = *v4;
      if (v13) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    type metadata accessor for CFString(0);
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  uint64_t v15 = *v4;
  if (v13)
  {
LABEL_8:
    uint64_t v16 = (_OWORD *)(v15[7] + 32 * v9);
    sub_10000B304((uint64_t)v16);
    return sub_100005F18(a1, v16);
  }
LABEL_13:
  sub_10001BC78(v9, (uint64_t)a2, a1, v15);

  return a2;
}

uint64_t sub_10001B888(uint64_t a1, unsigned __int8 a2, char a3)
{
  Swift::Int v4 = v3;
  uint64_t v8 = *v3;
  unint64_t v10 = sub_10001B700(a2);
  uint64_t v11 = *(void *)(v8 + 16);
  BOOL v12 = (v9 & 1) == 0;
  uint64_t result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  char v14 = v9;
  uint64_t v15 = *(void *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0) {
    goto LABEL_7;
  }
  if (v15 >= result && (a3 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10002B65C();
LABEL_7:
    uint64_t v16 = (void *)*v4;
    if (v14)
    {
LABEL_8:
      uint64_t v17 = v16[7];
      uint64_t result = swift_release();
      *(void *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(unsigned char *)(v16[6] + v10) = a2;
    *(void *)(v16[7] + 8 * v10) = a1;
    uint64_t v19 = v16[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (!v20)
    {
      v16[2] = v21;
      return result;
    }
    goto LABEL_14;
  }
  sub_10002A750(result, a3 & 1);
  uint64_t result = sub_10001B700(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    unint64_t v10 = result;
    uint64_t v16 = (void *)*v4;
    if (v14) {
      goto LABEL_8;
    }
    goto LABEL_11;
  }
LABEL_15:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

_OWORD *sub_10001B9C0(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  size_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10001B688(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10002B9B8();
      goto LABEL_7;
    }
    sub_10002AE88(v15, a4 & 1);
    unint64_t v21 = sub_10001B688(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      char v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  char v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_10000B304((uint64_t)v19);
    return sub_100005F18(a1, v19);
  }
LABEL_13:
  sub_10001BCE0(v12, a2, a3, a1, v18);

  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_10001BB14(int a1, uint64_t a2, uint64_t a3, char a4)
{
  size_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10001B688(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= result && (a4 & 1) == 0)
  {
    uint64_t result = (uint64_t)sub_10002BBA0();
LABEL_7:
    char v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      *(_DWORD *)(v18[7] + 4 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10002B188(result, a4 & 1);
  uint64_t result = sub_10001B688(a2, a3);
  if ((v16 & 1) != (v19 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = result;
  char v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  BOOL v20 = (uint64_t *)(v18[6] + 16 * v12);
  *BOOL v20 = a2;
  v20[1] = a3;
  *(_DWORD *)(v18[7] + 4 * v12) = a1;
  uint64_t v21 = v18[2];
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v23;

  return swift_bridgeObjectRetain();
}

_OWORD *sub_10001BC78(unint64_t a1, uint64_t a2, _OWORD *a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(void *)(a4[6] + 8 * a1) = a2;
  uint64_t result = sub_100005F18(a3, (_OWORD *)(a4[7] + 32 * a1));
  uint64_t v6 = a4[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a4[2] = v8;
  }
  return result;
}

_OWORD *sub_10001BCE0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_100005F18(a4, (_OWORD *)(a5[7] + 32 * a1));
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

unint64_t sub_10001BD4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    uint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_100023F74((unint64_t *)&qword_100042750, type metadata accessor for CFString);
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

unint64_t sub_10001BEA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100023ED8(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100020B78((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10001BF70(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_10001C00C(uint64_t a1, uint64_t a2)
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

unint64_t sub_10001C184(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10001C268(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0xEB0000000056546FLL;
      unint64_t v8 = 0x5479616C50726941;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v8 = 0x766572506B6E694CLL;
          unint64_t v7 = 0xEC00000073776569;
          break;
        case 2:
          unint64_t v7 = 0xE300000000000000;
          unint64_t v8 = 5067348;
          break;
        case 3:
          unint64_t v8 = 0x6C41646572616853;
          unint64_t v7 = 0xEC000000736D7562;
          break;
        case 4:
          unint64_t v8 = 0x5279616C50726941;
          unint64_t v7 = 0xEF72657669656365;
          break;
        case 5:
          unint64_t v7 = 0x8000000100033890;
          unint64_t v8 = 0xD000000000000011;
          break;
        case 6:
          unint64_t v8 = 0xD000000000000017;
          unint64_t v7 = 0x80000001000338B0;
          break;
        case 7:
          unint64_t v8 = 0x65706F6C65766544;
          unint64_t v7 = 0xED000065646F4D72;
          break;
        default:
          break;
      }
      uint64_t v9 = 0x5479616C50726941;
      unint64_t v10 = 0xEB0000000056546FLL;
      switch(v6)
      {
        case 1:
          uint64_t v11 = 0x766572506B6E694CLL;
          uint64_t v12 = 1937204585;
          goto LABEL_16;
        case 2:
          unint64_t v10 = 0xE300000000000000;
          if (v8 != 5067348) {
            goto LABEL_25;
          }
          goto LABEL_24;
        case 3:
          uint64_t v11 = 0x6C41646572616853;
          uint64_t v12 = 1936553314;
LABEL_16:
          unint64_t v10 = v12 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
          if (v8 != v11) {
            goto LABEL_25;
          }
          goto LABEL_24;
        case 4:
          unint64_t v10 = 0xEF72657669656365;
          if (v8 != 0x5279616C50726941) {
            goto LABEL_25;
          }
          goto LABEL_24;
        case 5:
          unint64_t v10 = 0x8000000100033890;
          if (v8 != 0xD000000000000011) {
            goto LABEL_25;
          }
          goto LABEL_24;
        case 6:
          unint64_t v10 = 0x80000001000338B0;
          if (v8 != 0xD000000000000017) {
            goto LABEL_25;
          }
          goto LABEL_24;
        case 7:
          uint64_t v9 = 0x65706F6C65766544;
          unint64_t v10 = 0xED000065646F4D72;
          goto LABEL_23;
        default:
LABEL_23:
          if (v8 != v9) {
            goto LABEL_25;
          }
LABEL_24:
          if (v7 == v10)
          {
            swift_bridgeObjectRelease_n();
            return v4;
          }
LABEL_25:
          char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v13) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

void sub_10001C5BC()
{
  uint64_t v1 = self;
  id v2 = [v1 defaultStore];
  if (!v2)
  {
    __break(1u);
    goto LABEL_13;
  }
  uint64_t v3 = v2;
  id v4 = objc_msgSend(v2, "aa_primaryAppleAccount");

  if (!v4) {
    return;
  }
  id v5 = objc_msgSend(v4, "aa_altDSID");
  if (!v5) {
    goto LABEL_8;
  }
  uint64_t v0 = v5;
  id v6 = [v1 defaultStore];
  if (!v6)
  {
LABEL_13:

    __break(1u);
    return;
  }
  unint64_t v7 = v6;
  id v8 = objc_msgSend(v6, "aa_authKitAccountForAltDSID:", v0);

  if (v8)
  {
    if ((objc_msgSend(v8, "aa_needsToVerifyTerms") & 1) == 0)
    {
      id v9 = [self sharedInstance];
      [v9 securityLevelForAccount:v8];

      return;
    }

    goto LABEL_9;
  }
LABEL_8:
  id v8 = v4;
LABEL_9:
}

void sub_10001C718(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v22 = v8;
      BOOL v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      uint64_t v23 = a4;
      uint64_t v16 = (void *)v15;
      *(_DWORD *)BOOL v14 = 138412290;
      swift_errorRetain();
      uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v24 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v16 = v17;
      uint64_t v8 = v22;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Could not enableIfNeeded: %@", v14, 0xCu);
      sub_100005E0C(&qword_1000421F8);
      swift_arrayDestroy();
      a4 = v23;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    char v19 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void, void *))(a4 + 16))(a4, 0, v19);

    return;
  }
  type metadata accessor for LockdownModeXNU();
  if ((static LockdownModeXNU.lockdownModeEnabled.getter() & 1) == 0)
  {
    if (*(unsigned char *)(a2 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) == 1)
    {
      char v18 = 1;
    }
    else
    {
      char v18 = static LockdownModeXNU.lockdownModeEnabled.getter();
      if ((v18 & 1) == 0) {
        goto LABEL_13;
      }
    }
    if (a3)
    {
      sub_10002E488(0xD00000000000001ALL, (void *)0x80000001000343D0);
      char v18 = 1;
    }
    goto LABEL_13;
  }
  char v18 = 0;
LABEL_13:
  BOOL v20 = *(void (**)(uint64_t, void, void))(a4 + 16);

  v20(a4, v18 & 1, 0);
}

void sub_10001CA10(unsigned __int8 a1, uint64_t a2, void *a3, int a4, void (**a5)(void, void, void))
{
  uint64_t v85 = a2;
  int v8 = a1;
  uint64_t v84 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v84 - 8);
  uint64_t v10 = __chkstk_darwin(v84);
  uint64_t v77 = (char *)v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  BOOL v14 = (char *)v73 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v76 = (char *)v73 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  v73[1] = (char *)v73 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  os_log_type_t v74 = (char *)v73 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v75 = (char *)v73 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v79 = (char *)v73 - v24;
  __chkstk_darwin(v23);
  BOOL v26 = (char *)v73 - v25;
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = a5;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = sub_100023D74;
  *(void *)(v28 + 24) = v27;
  *(void *)(v28 + 32) = a3;
  int v78 = a4;
  *(unsigned char *)(v28 + 40) = a4;
  _Block_copy(a5);
  _Block_copy(a5);
  _Block_copy(a5);
  _Block_copy(a5);
  uint64_t v83 = v27;
  swift_retain();
  long long v81 = a3;
  static Logger.daemonLogger.getter();
  uint64_t v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.default.getter();
  BOOL v31 = os_log_type_enabled(v29, v30);
  LODWORD(v82) = v8;
  long long v80 = v14;
  if (v31)
  {
    v73[0] = a5;
    char v32 = (uint8_t *)swift_slowAlloc();
    uint64_t v33 = swift_slowAlloc();
    *(_DWORD *)char v32 = 136446210;
    v88[0] = v33;
    if (v8) {
      uint64_t v34 = 0x726F74617267696DLL;
    }
    else {
      uint64_t v34 = 0x617267694D657270;
    }
    if (v8) {
      unint64_t v35 = 0xE800000000000000;
    }
    else {
      unint64_t v35 = 0xEC0000006E6F6974;
    }
    *(void *)&v87[0] = sub_10001AE5C(v34, v35, v88);
    a5 = (void (**)(void, void, void))v73[0];
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Requested to migrateIfNeeded. Migration source: %{public}s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v36 = v9;
  }
  else
  {

    uint64_t v36 = v9;
  }
  uint64_t v37 = *(void (**)(char *, uint64_t))(v36 + 8);
  uint64_t v38 = v84;
  v37(v26, v84);
  if (*(unsigned char *)(v85 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled))
  {
    char v39 = 1;
  }
  else
  {
    type metadata accessor for LockdownModeXNU();
    char v39 = static LockdownModeXNU.lockdownModeEnabled.getter();
  }
  if (qword_100041D90 != -1) {
    swift_once();
  }
  uint64_t v40 = static RestrictionsManager.shared;
  if (v39)
  {
    if (v82)
    {
      if ((*(unsigned char *)(static RestrictionsManager.shared + 32) & 1) == 0)
      {
        long long v59 = v76;
        static Logger.daemonLogger.getter();
        os_log_type_t v60 = Logger.logObject.getter();
        os_log_type_t v61 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v60, v61))
        {
          uint64_t v62 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v62 = 0;
          _os_log_impl((void *)&_mh_execute_header, v60, v61, "Lockdown Mode is turned on but there's no state stored, re-turning on Lockdown Mode…", v62, 2u);
          swift_slowDealloc();
        }

        v37(v59, v38);
        sub_100013454(1, 0, 1, 0, 1, 0, 0, 0, 0, (void (*)(uint64_t))sub_100023D84, v28);
        goto LABEL_57;
      }
      if ((*(void *)(static RestrictionsManager.shared + 16) & 0x8000000000000000) == 0)
      {
        uint64_t v85 = v9;
        char v41 = v74;
        static Logger.daemonLogger.getter();
        os_log_type_t v42 = Logger.logObject.getter();
        os_log_type_t v43 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v42, v43))
        {
          uint64_t v44 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v44 = 134217984;
          v88[0] = 0;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v42, v43, "Lockdown Mode is turned on and the version of the state matches the current one (%ld). No need to migrate", v44, 0xCu);
          swift_slowDealloc();
        }

        uint64_t v45 = v41;
LABEL_46:
        v37(v45, v38);
        type metadata accessor for LockdownModeXNU();
        _Block_copy(a5);
        if (static LockdownModeXNU.lockdownModeEnabled.getter()) {
          goto LABEL_47;
        }
        if (v81[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled] == 1)
        {
          char v55 = 1;
        }
        else
        {
          char v55 = static LockdownModeXNU.lockdownModeEnabled.getter();
          if ((v55 & 1) == 0) {
            goto LABEL_56;
          }
        }
        goto LABEL_54;
      }
      static Logger.daemonLogger.getter();
      swift_retain();
      uint64_t v69 = Logger.logObject.getter();
      os_log_type_t v70 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v69, v70))
      {
        uint64_t v71 = (_DWORD *)swift_slowAlloc();
        uint64_t v85 = v9;
        int v72 = v71;
        _DWORD *v71 = 134218240;
        v88[0] = *(void *)(v40 + 16);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        *((_WORD *)v72 + 6) = 2048;
        v88[0] = 0;
        uint64_t v38 = v84;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v69, v70, "Migrating from version %ld to version %ld", (uint8_t *)v72, 0x16u);
        swift_slowDealloc();
      }
      else
      {

        swift_release();
      }
      v37(v75, v38);
      sub_100029204();
    }
    else
    {
      uint64_t v51 = v79;
      static Logger.daemonLogger.getter();
      os_log_type_t v52 = Logger.logObject.getter();
      os_log_type_t v53 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v52, v53))
      {
        char v54 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v54 = 0;
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "Migration is not needed", v54, 2u);
        swift_slowDealloc();
      }

      v37(v51, v38);
    }
    type metadata accessor for LockdownModeXNU();
    _Block_copy(a5);
    if (static LockdownModeXNU.lockdownModeEnabled.getter())
    {
LABEL_47:
      char v55 = 0;
LABEL_56:
      a5[2](a5, v55 & 1, 0);
      _Block_release(a5);
LABEL_57:
      swift_release();
      goto LABEL_58;
    }
    if (v81[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled] == 1) {
      char v55 = 1;
    }
    else {
      char v55 = static LockdownModeXNU.lockdownModeEnabled.getter();
    }
    if ((v55 & 1) == 0) {
      goto LABEL_56;
    }
LABEL_54:
    if (v78)
    {
      sub_10002E488(0xD00000000000001ALL, (void *)0x80000001000343D0);
      char v55 = 1;
    }
    goto LABEL_56;
  }
  if (*(unsigned char *)(static RestrictionsManager.shared + 32))
  {
    uint64_t v46 = v80;
    static Logger.daemonLogger.getter();
    unint64_t v47 = Logger.logObject.getter();
    os_log_type_t v48 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v47, v48))
    {
      uint64_t v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v49 = 0;
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Lockdown Mode isn't turned on but previous state exists, turning on Lockdown Mode…", v49, 2u);
      swift_slowDealloc();
    }
    int v50 = v82 & 1;

    v37(v46, v38);
    sub_100013454(1, 0, v50, 0, v50, 0, 0, 0, 1u, (void (*)(uint64_t))sub_100023D84, v28);
    goto LABEL_57;
  }
  id v56 = [self standardUserDefaults];
  static Constants.userDefaultsKey.getter();
  NSString v57 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v58 = [v56 objectForKey:v57 inDomain:NSGlobalDomain];

  if (v58)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v87, 0, sizeof(v87));
  }
  sub_100020ED8((uint64_t)v87, (uint64_t)v88, &qword_1000425E0);
  if (!v88[3])
  {
    sub_100020B10((uint64_t)v88);
LABEL_43:
    Swift::String v65 = v77;
    static Logger.daemonLogger.getter();
    Swift::String v66 = Logger.logObject.getter();
    os_log_type_t v67 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v66, v67))
    {
      unint64_t v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Lockdown Mode is turned off and there's no previous state. No need to migrate", v68, 2u);
      swift_slowDealloc();
    }

    uint64_t v45 = v65;
    goto LABEL_46;
  }
  if ((swift_dynamicCast() & 1) == 0 || (v86 & 1) == 0) {
    goto LABEL_43;
  }
  int v63 = v82 & 1;
  uint64_t v64 = swift_allocObject();
  *(void *)(v64 + 16) = sub_100023D84;
  *(void *)(v64 + 24) = v28;
  swift_retain();
  sub_100013454(1, 0, v63, 0, v63, 0, 0, 0, 1u, (void (*)(uint64_t))sub_100024094, v64);
  swift_release();
  swift_release();
LABEL_58:
  swift_release();
  _Block_release(a5);
  _Block_release(a5);
  _Block_release(a5);
}

uint64_t sub_10001D798(unsigned __int8 a1, uint64_t a2, void (*a3)(void, void), uint64_t a4, void *a5, int a6)
{
  uint64_t v90 = a2;
  int v10 = a1;
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  char v86 = (char *)v76 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v84 = (char *)v76 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v82 = (char *)v76 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  int v78 = (char *)v76 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v83 = (char *)v76 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  long long v80 = (char *)v76 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  dispatch_semaphore_t v87 = (char *)v76 - v26;
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)v76 - v27;
  uint64_t v29 = swift_allocObject();
  id v88 = a3;
  *(void *)(v29 + 16) = a3;
  *(void *)(v29 + 24) = a4;
  *(void *)(v29 + 32) = a5;
  *(unsigned char *)(v29 + 40) = a6;
  swift_retain();
  uint64_t v85 = a5;
  static Logger.daemonLogger.getter();
  os_log_type_t v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.default.getter();
  BOOL v32 = os_log_type_enabled(v30, v31);
  LODWORD(v89) = v10;
  if (v32)
  {
    uint64_t v79 = v12;
    uint64_t v81 = v11;
    uint64_t v33 = (uint8_t *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    v76[1] = a4;
    uint64_t v77 = v29;
    *(_DWORD *)uint64_t v33 = 136446210;
    v93[0] = v34;
    if (v10) {
      uint64_t v35 = 0x726F74617267696DLL;
    }
    else {
      uint64_t v35 = 0x617267694D657270;
    }
    int v36 = a6;
    if (v10) {
      unint64_t v37 = 0xE800000000000000;
    }
    else {
      unint64_t v37 = 0xEC0000006E6F6974;
    }
    *(void *)&v92[0] = sub_10001AE5C(v35, v37, v93);
    uint64_t v11 = v81;
    uint64_t v38 = v79;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    a6 = v36;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Requested to migrateIfNeeded. Migration source: %{public}s", v33, 0xCu);
    swift_arrayDestroy();
    uint64_t v29 = v77;
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v12 = v38;
    uint64_t v39 = v38;
  }
  else
  {

    uint64_t v39 = v12;
  }
  uint64_t v40 = *(void (**)(char *, uint64_t))(v39 + 8);
  v40(v28, v11);
  if (*(unsigned char *)(v90 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled))
  {
    char v41 = 1;
  }
  else
  {
    type metadata accessor for LockdownModeXNU();
    char v41 = static LockdownModeXNU.lockdownModeEnabled.getter();
  }
  if (qword_100041D90 != -1) {
    swift_once();
  }
  uint64_t v42 = static RestrictionsManager.shared;
  if (v41)
  {
    if ((v89 & 1) == 0)
    {
      static Logger.daemonLogger.getter();
      char v54 = Logger.logObject.getter();
      os_log_type_t v55 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v54, v55))
      {
        id v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v56 = 0;
        _os_log_impl((void *)&_mh_execute_header, v54, v55, "Migration is not needed", v56, 2u);
        swift_slowDealloc();
      }

      os_log_type_t v48 = v87;
      goto LABEL_43;
    }
    if (*(unsigned char *)(static RestrictionsManager.shared + 32))
    {
      if ((*(void *)(static RestrictionsManager.shared + 16) & 0x8000000000000000) != 0)
      {
        static Logger.daemonLogger.getter();
        swift_retain();
        int v72 = Logger.logObject.getter();
        os_log_type_t v73 = static os_log_type_t.default.getter();
        BOOL v74 = os_log_type_enabled(v72, v73);
        uint64_t v81 = v11;
        if (v74)
        {
          uint64_t v75 = swift_slowAlloc();
          *(_DWORD *)uint64_t v75 = 134218240;
          v93[0] = *(void *)(v42 + 16);
          LODWORD(v90) = a6;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_release();
          *(_WORD *)(v75 + 12) = 2048;
          v93[0] = 0;
          LOBYTE(a6) = v90;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v72, v73, "Migrating from version %ld to version %ld", (uint8_t *)v75, 0x16u);
          uint64_t v11 = v81;
          swift_slowDealloc();
        }
        else
        {

          swift_release();
        }
        v40(v80, v11);
        sub_100029204();
LABEL_44:
        type metadata accessor for LockdownModeXNU();
        if (static LockdownModeXNU.lockdownModeEnabled.getter())
        {
          char v70 = 0;
LABEL_51:
          v88(v70 & 1, 0);
          return swift_release();
        }
        if (v85[OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled] == 1)
        {
          char v70 = 1;
        }
        else
        {
          char v70 = static LockdownModeXNU.lockdownModeEnabled.getter();
          if ((v70 & 1) == 0) {
            goto LABEL_51;
          }
        }
        if (a6)
        {
          sub_10002E488(0xD00000000000001ALL, (void *)0x80000001000343D0);
          char v70 = 1;
        }
        goto LABEL_51;
      }
      static Logger.daemonLogger.getter();
      os_log_type_t v43 = Logger.logObject.getter();
      os_log_type_t v44 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        uint64_t v79 = v12;
        uint64_t v46 = v11;
        unint64_t v47 = v45;
        *(_DWORD *)uint64_t v45 = 134217984;
        v93[0] = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "Lockdown Mode is turned on and the version of the state matches the current one (%ld). No need to migrate", v47, 0xCu);
        uint64_t v11 = v46;
        swift_slowDealloc();
      }

      os_log_type_t v48 = v83;
LABEL_43:
      v40(v48, v11);
      goto LABEL_44;
    }
    os_log_type_t v61 = v82;
    static Logger.daemonLogger.getter();
    uint64_t v62 = Logger.logObject.getter();
    os_log_type_t v63 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v62, v63))
    {
      uint64_t v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v64 = 0;
      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Lockdown Mode is turned on but there's no state stored, re-turning on Lockdown Mode…", v64, 2u);
      swift_slowDealloc();
    }

    v40(v61, v11);
    sub_100013454(1, 0, 1, 0, 1, 0, 0, 0, 0, (void (*)(uint64_t))sub_10002400C, v29);
  }
  else
  {
    if ((*(unsigned char *)(static RestrictionsManager.shared + 32) & 1) == 0)
    {
      uint64_t v57 = v11;
      id v58 = [self standardUserDefaults];
      static Constants.userDefaultsKey.getter();
      NSString v59 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v60 = [v58 objectForKey:v59 inDomain:NSGlobalDomain];

      if (v60)
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v92, 0, sizeof(v92));
      }
      sub_100020ED8((uint64_t)v92, (uint64_t)v93, &qword_1000425E0);
      uint64_t v11 = v57;
      if (v93[3])
      {
        if (swift_dynamicCast() & 1) != 0 && (v91)
        {
          int v65 = v89 & 1;
          uint64_t v66 = swift_allocObject();
          *(void *)(v66 + 16) = sub_10002400C;
          *(void *)(v66 + 24) = v29;
          swift_retain();
          sub_100013454(1, 0, v65, 0, v65, 0, 0, 0, 1u, (void (*)(uint64_t))sub_100024094, v66);
          swift_release();
          return swift_release();
        }
      }
      else
      {
        sub_100020B10((uint64_t)v93);
      }
      static Logger.daemonLogger.getter();
      os_log_type_t v67 = Logger.logObject.getter();
      os_log_type_t v68 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v67, v68))
      {
        uint64_t v69 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v69 = 0;
        _os_log_impl((void *)&_mh_execute_header, v67, v68, "Lockdown Mode is turned off and there's no previous state. No need to migrate", v69, 2u);
        uint64_t v11 = v57;
        swift_slowDealloc();
      }

      os_log_type_t v48 = v86;
      goto LABEL_43;
    }
    uint64_t v49 = v84;
    static Logger.daemonLogger.getter();
    int v50 = Logger.logObject.getter();
    os_log_type_t v51 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v50, v51))
    {
      os_log_type_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "Lockdown Mode isn't turned on but previous state exists, turning on Lockdown Mode…", v52, 2u);
      swift_slowDealloc();
    }
    int v53 = v89 & 1;

    v40(v49, v11);
    sub_100013454(1, 0, v53, 0, v53, 0, 0, 0, 1u, (void (*)(uint64_t))sub_10002400C, v29);
  }
  return swift_release();
}

void sub_10001E468(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  int v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  int v10 = (char *)&v22 - v9;
  if (a1)
  {
    static Logger.daemonLogger.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v24 = a2;
      uint64_t v14 = (uint8_t *)v13;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v23 = v4;
      uint64_t v16 = (void *)v15;
      *(_DWORD *)uint64_t v14 = 138412290;
      swift_errorRetain();
      uint64_t v17 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v25 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v16 = v17;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Could not migrateIfNeeded: %@", v14, 0xCu);
      sub_100005E0C(&qword_1000421F8);
      swift_arrayDestroy();
      uint64_t v4 = v23;
      swift_slowDealloc();
      a2 = v24;
      swift_slowDealloc();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    uint64_t v21 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v21);
  }
  else
  {
    static Logger.daemonLogger.getter();
    uint64_t v18 = Logger.logObject.getter();
    uint64_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, (os_log_type_t)v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, (os_log_type_t)v19, "Successfully ran migrateIfNeeded", v20, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, 0);
  }
}

void sub_10001E770(unsigned __int8 a1, uint64_t a2, void (**a3)(void, void))
{
  int v5 = a1;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  id v88 = (char *)v77 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  dispatch_semaphore_t v87 = (char *)v77 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  char v91 = (char *)v77 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  char v86 = (char *)v77 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v83 = (char *)v77 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v82 = (char *)v77 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v85 = (char *)v77 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v84 = (char *)v77 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v90 = (char *)v77 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v89 = (char *)v77 - v27;
  __chkstk_darwin(v26);
  uint64_t v29 = (char *)v77 - v28;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = a3;
  uint64_t v31 = swift_allocObject();
  *(void *)(v31 + 16) = sub_100023D5C;
  *(void *)(v31 + 24) = v30;
  _Block_copy(a3);
  _Block_copy(a3);
  _Block_copy(a3);
  _Block_copy(a3);
  swift_retain();
  static Logger.daemonLogger.getter();
  BOOL v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v81 = v7;
    uint64_t v34 = swift_slowAlloc();
    uint64_t v80 = v6;
    uint64_t v35 = (uint8_t *)v34;
    uint64_t v36 = swift_slowAlloc();
    v77[1] = v36;
    uint64_t v79 = a2;
    *(_DWORD *)uint64_t v35 = 136446210;
    v94[0] = v36;
    if (v5) {
      uint64_t v37 = 0x726F74617267696DLL;
    }
    else {
      uint64_t v37 = 0x617267694D657270;
    }
    if (v5) {
      unint64_t v38 = 0xE800000000000000;
    }
    else {
      unint64_t v38 = 0xEC0000006E6F6974;
    }
    int v78 = v5;
    *(void *)&v93[0] = sub_10001AE5C(v37, v38, v94);
    LOBYTE(v5) = v78;
    a2 = v79;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    uint64_t v7 = v81;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Requested to migrateIfNeeded. Migration source: %{public}s", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v80;
    swift_slowDealloc();
  }

  uint64_t v39 = *(void (**)(char *, uint64_t))(v7 + 8);
  v39(v29, v6);
  if (*(unsigned char *)(a2 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled))
  {
    char v40 = 1;
  }
  else
  {
    type metadata accessor for LockdownModeXNU();
    char v40 = static LockdownModeXNU.lockdownModeEnabled.getter();
  }
  if (qword_100041D90 != -1) {
    swift_once();
  }
  uint64_t v41 = static RestrictionsManager.shared;
  char v42 = *(unsigned char *)(static RestrictionsManager.shared + 32);
  if (v40)
  {
    if (v5)
    {
      if ((*(unsigned char *)(static RestrictionsManager.shared + 32) & 1) == 0)
      {
        os_log_type_t v61 = v86;
        static Logger.daemonLogger.getter();
        uint64_t v62 = Logger.logObject.getter();
        os_log_type_t v63 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v62, v63))
        {
          uint64_t v64 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v64 = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, v63, "Lockdown Mode is turned on but there's no state stored, re-turning on Lockdown Mode…", v64, 2u);
          os_log_type_t v61 = v86;
          swift_slowDealloc();
        }

        v39(v61, v6);
        sub_100013454(1, 0, 1, 0, 1, 0, 0, 0, 0, (void (*)(uint64_t))sub_100023D64, v31);
        goto LABEL_48;
      }
      if ((*(void *)(static RestrictionsManager.shared + 16) & 0x8000000000000000) == 0)
      {
        static Logger.daemonLogger.getter();
        os_log_type_t v43 = Logger.logObject.getter();
        os_log_type_t v44 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v43, v44))
        {
          uint64_t v45 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v45 = 134217984;
          v94[0] = 0;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v43, v44, "Lockdown Mode is turned on and the version of the state matches the current one (%ld). No need to migrate", v45, 0xCu);
          swift_slowDealloc();
        }

        v39(v85, v6);
        _Block_copy(a3);
        uint64_t v46 = v83;
LABEL_45:
        static Logger.daemonLogger.getter();
        os_log_type_t v55 = Logger.logObject.getter();
        os_log_type_t v72 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v55, v72))
        {
          os_log_type_t v73 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v73 = 0;
          _os_log_impl((void *)&_mh_execute_header, v55, v72, "Successfully ran migrateIfNeeded", v73, 2u);
          swift_slowDealloc();
        }
LABEL_47:

        v39(v46, v6);
        a3[2](a3, 0);
        _Block_release(a3);
LABEL_48:
        swift_release();
        goto LABEL_49;
      }
      static Logger.daemonLogger.getter();
      swift_retain();
      BOOL v74 = Logger.logObject.getter();
      os_log_type_t v75 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v74, v75))
      {
        uint64_t v76 = swift_slowAlloc();
        *(_DWORD *)uint64_t v76 = 134218240;
        v94[0] = *(void *)(v41 + 16);
        uint64_t v81 = v7;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        *(_WORD *)(v76 + 12) = 2048;
        v94[0] = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v74, v75, "Migrating from version %ld to version %ld", (uint8_t *)v76, 0x16u);
        swift_slowDealloc();
      }
      else
      {

        swift_release();
      }
      v39(v84, v6);
      sub_100029204();
      uint64_t v46 = v90;
    }
    else
    {
      os_log_type_t v51 = v89;
      static Logger.daemonLogger.getter();
      os_log_type_t v52 = Logger.logObject.getter();
      os_log_type_t v53 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v52, v53))
      {
        char v54 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v54 = 0;
        _os_log_impl((void *)&_mh_execute_header, v52, v53, "Migration is not needed", v54, 2u);
        swift_slowDealloc();
      }

      v39(v51, v6);
      uint64_t v46 = v90;
    }
    _Block_copy(a3);
    static Logger.daemonLogger.getter();
    os_log_type_t v55 = Logger.logObject.getter();
    os_log_type_t v56 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v55, v56))
    {
      uint64_t v57 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v57 = 0;
      _os_log_impl((void *)&_mh_execute_header, v55, v56, "Successfully ran migrateIfNeeded", v57, 2u);
      swift_slowDealloc();
    }
    goto LABEL_47;
  }
  uint64_t v90 = (char *)v39;
  char v47 = v5;
  if (v42)
  {
    static Logger.daemonLogger.getter();
    os_log_type_t v48 = Logger.logObject.getter();
    os_log_type_t v49 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v48, v49))
    {
      int v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v50 = 0;
      _os_log_impl((void *)&_mh_execute_header, v48, v49, "Lockdown Mode isn't turned on but previous state exists, turning on Lockdown Mode…", v50, 2u);
      swift_slowDealloc();
    }

    ((void (*)(char *, uint64_t))v90)(v91, v6);
    sub_100013454(1, 0, v47 & 1, 0, v47 & 1, 0, 0, 0, 1u, (void (*)(uint64_t))sub_100023D64, v31);
    goto LABEL_48;
  }
  id v58 = [self standardUserDefaults];
  static Constants.userDefaultsKey.getter();
  NSString v59 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v60 = [v58 objectForKey:v59 inDomain:NSGlobalDomain];

  if (v60)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v93, 0, sizeof(v93));
  }
  sub_100020ED8((uint64_t)v93, (uint64_t)v94, &qword_1000425E0);
  if (!v94[3])
  {
    sub_100020B10((uint64_t)v94);
    uint64_t v46 = v88;
LABEL_42:
    os_log_type_t v67 = v87;
    static Logger.daemonLogger.getter();
    os_log_type_t v68 = Logger.logObject.getter();
    os_log_type_t v69 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v68, v69))
    {
      char v70 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v70 = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, v69, "Lockdown Mode is turned off and there's no previous state. No need to migrate", v70, 2u);
      swift_slowDealloc();
    }

    uint64_t v71 = v67;
    uint64_t v39 = (void (*)(char *, uint64_t))v90;
    ((void (*)(char *, uint64_t))v90)(v71, v6);
    _Block_copy(a3);
    goto LABEL_45;
  }
  char v65 = swift_dynamicCast();
  uint64_t v46 = v88;
  if ((v65 & 1) == 0 || (v92 & 1) == 0) {
    goto LABEL_42;
  }
  uint64_t v66 = swift_allocObject();
  *(void *)(v66 + 16) = sub_100023D64;
  *(void *)(v66 + 24) = v31;
  swift_retain();
  sub_100013454(1, 0, v47 & 1, 0, v47 & 1, 0, 0, 0, 1u, (void (*)(uint64_t))sub_100023D6C, v66);
  swift_release();
  swift_release();
LABEL_49:
  swift_release();
  _Block_release(a3);
  _Block_release(a3);
  _Block_release(a3);
}

uint64_t sub_10001F5D0(unsigned __int8 a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  int v7 = a1;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v96 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v89 = (char *)&v81 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  id v88 = (char *)&v81 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  char v91 = (char *)&v81 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  dispatch_semaphore_t v87 = (char *)&v81 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v85 = (char *)&v81 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v83 = (char *)&v81 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v84 = (char *)&v81 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  char v86 = (char *)&v81 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  char v92 = (char *)&v81 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v90 = (char *)&v81 - v28;
  __chkstk_darwin(v27);
  uint64_t v30 = (char *)&v81 - v29;
  uint64_t v31 = swift_allocObject();
  uint64_t v93 = a4;
  os_log_type_t v94 = a3;
  *(void *)(v31 + 16) = a3;
  *(void *)(v31 + 24) = a4;
  swift_retain();
  static Logger.daemonLogger.getter();
  BOOL v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.default.getter();
  BOOL v34 = os_log_type_enabled(v32, v33);
  int v95 = v7;
  if (v34)
  {
    uint64_t v35 = swift_slowAlloc();
    uint64_t v81 = v8;
    uint64_t v36 = (uint8_t *)v35;
    uint64_t v37 = swift_slowAlloc();
    uint64_t v82 = v31;
    *(_DWORD *)uint64_t v36 = 136446210;
    v99[0] = v37;
    if (v7) {
      uint64_t v38 = 0x726F74617267696DLL;
    }
    else {
      uint64_t v38 = 0x617267694D657270;
    }
    if (v7) {
      unint64_t v39 = 0xE800000000000000;
    }
    else {
      unint64_t v39 = 0xEC0000006E6F6974;
    }
    *(void *)&v98[0] = sub_10001AE5C(v38, v39, v99);
    uint64_t v40 = v96;
    uint64_t v31 = v82;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "Requested to migrateIfNeeded. Migration source: %{public}s", v36, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v8 = v81;
    swift_slowDealloc();

    uint64_t v41 = v40;
  }
  else
  {

    uint64_t v41 = v96;
  }
  char v42 = *(void (**)(char *, uint64_t))(v41 + 8);
  v42(v30, v8);
  if (*(unsigned char *)(a2 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled))
  {
    char v43 = 1;
  }
  else
  {
    type metadata accessor for LockdownModeXNU();
    char v43 = static LockdownModeXNU.lockdownModeEnabled.getter();
  }
  if (qword_100041D90 != -1) {
    swift_once();
  }
  uint64_t v44 = static RestrictionsManager.shared;
  if (v43)
  {
    if ((v95 & 1) == 0)
    {
      os_log_type_t v55 = v90;
      static Logger.daemonLogger.getter();
      os_log_type_t v56 = Logger.logObject.getter();
      os_log_type_t v57 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v56, v57))
      {
        id v58 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v58 = 0;
        _os_log_impl((void *)&_mh_execute_header, v56, v57, "Migration is not needed", v58, 2u);
        swift_slowDealloc();
      }

      v42(v55, v8);
      goto LABEL_29;
    }
    if (*(unsigned char *)(static RestrictionsManager.shared + 32))
    {
      if ((*(void *)(static RestrictionsManager.shared + 16) & 0x8000000000000000) == 0)
      {
        uint64_t v45 = v84;
        static Logger.daemonLogger.getter();
        uint64_t v46 = Logger.logObject.getter();
        os_log_type_t v47 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v46, v47))
        {
          os_log_type_t v48 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)os_log_type_t v48 = 134217984;
          v99[0] = 0;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v46, v47, "Lockdown Mode is turned on and the version of the state matches the current one (%ld). No need to migrate", v48, 0xCu);
          swift_slowDealloc();
        }

        v42(v45, v8);
        os_log_type_t v49 = v85;
LABEL_46:
        static Logger.daemonLogger.getter();
        NSString v59 = Logger.logObject.getter();
        os_log_type_t v75 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v59, v75))
        {
          uint64_t v76 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v76 = 0;
          _os_log_impl((void *)&_mh_execute_header, v59, v75, "Successfully ran migrateIfNeeded", v76, 2u);
          swift_slowDealloc();
        }
LABEL_48:

        v42(v49, v8);
        v94(0);
        return swift_release();
      }
      static Logger.daemonLogger.getter();
      swift_retain();
      int v78 = Logger.logObject.getter();
      os_log_type_t v79 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v78, v79))
      {
        uint64_t v80 = swift_slowAlloc();
        *(_DWORD *)uint64_t v80 = 134218240;
        v99[0] = *(void *)(v44 + 16);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_release();
        *(_WORD *)(v80 + 12) = 2048;
        v99[0] = 0;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v78, v79, "Migrating from version %ld to version %ld", (uint8_t *)v80, 0x16u);
        swift_slowDealloc();
      }
      else
      {

        swift_release();
      }
      v42(v86, v8);
      sub_100029204();
LABEL_29:
      os_log_type_t v49 = v92;
      static Logger.daemonLogger.getter();
      NSString v59 = Logger.logObject.getter();
      os_log_type_t v60 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v59, v60))
      {
        os_log_type_t v61 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)os_log_type_t v61 = 0;
        _os_log_impl((void *)&_mh_execute_header, v59, v60, "Successfully ran migrateIfNeeded", v61, 2u);
        swift_slowDealloc();
      }
      goto LABEL_48;
    }
    char v65 = v87;
    static Logger.daemonLogger.getter();
    uint64_t v66 = Logger.logObject.getter();
    os_log_type_t v67 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v66, v67))
    {
      os_log_type_t v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v68 = 0;
      _os_log_impl((void *)&_mh_execute_header, v66, v67, "Lockdown Mode is turned on but there's no state stored, re-turning on Lockdown Mode…", v68, 2u);
      swift_slowDealloc();
    }

    v42(v65, v8);
    sub_100013454(1, 0, 1, 0, 1, 0, 0, 0, 0, (void (*)(uint64_t))sub_100024098, v31);
  }
  else
  {
    if ((*(unsigned char *)(static RestrictionsManager.shared + 32) & 1) == 0)
    {
      id v62 = [self standardUserDefaults];
      static Constants.userDefaultsKey.getter();
      NSString v63 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v64 = [v62 objectForKey:v63 inDomain:NSGlobalDomain];

      if (v64)
      {
        _bridgeAnyObjectToAny(_:)();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v98, 0, sizeof(v98));
      }
      sub_100020ED8((uint64_t)v98, (uint64_t)v99, &qword_1000425E0);
      char v69 = v95;
      if (v99[3])
      {
        if (swift_dynamicCast() & 1) != 0 && (v97)
        {
          uint64_t v70 = swift_allocObject();
          *(void *)(v70 + 16) = sub_100024098;
          *(void *)(v70 + 24) = v31;
          swift_retain();
          sub_100013454(1, 0, v69 & 1, 0, v69 & 1, 0, 0, 0, 1u, (void (*)(uint64_t))sub_100024094, v70);
          swift_release();
          return swift_release();
        }
      }
      else
      {
        sub_100020B10((uint64_t)v99);
      }
      uint64_t v71 = v88;
      static Logger.daemonLogger.getter();
      os_log_type_t v72 = Logger.logObject.getter();
      os_log_type_t v73 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v72, v73))
      {
        BOOL v74 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)BOOL v74 = 0;
        _os_log_impl((void *)&_mh_execute_header, v72, v73, "Lockdown Mode is turned off and there's no previous state. No need to migrate", v74, 2u);
        swift_slowDealloc();
      }

      v42(v71, v8);
      os_log_type_t v49 = v89;
      goto LABEL_46;
    }
    int v50 = v91;
    static Logger.daemonLogger.getter();
    os_log_type_t v51 = Logger.logObject.getter();
    os_log_type_t v52 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v51, v52))
    {
      os_log_type_t v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v53 = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, v52, "Lockdown Mode isn't turned on but previous state exists, turning on Lockdown Mode…", v53, 2u);
      swift_slowDealloc();
    }
    int v54 = v95 & 1;

    v42(v50, v8);
    sub_100013454(1, 0, v54, 0, v54, 0, 0, 0, 1u, (void (*)(uint64_t))sub_100024098, v31);
  }
  return swift_release();
}

uint64_t sub_100020370(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v39 - v7;
  NSString v9 = String._bridgeToObjectiveC()();
  id v10 = [a1 valueForEntitlement:v9];

  if (v10)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
  }
  sub_100020ED8((uint64_t)&v51, (uint64_t)&aBlock, &qword_1000425E0);
  if (v47)
  {
    if swift_dynamicCast() && (v50)
    {
LABEL_15:
      uint64_t v42 = v3;
      static Logger.daemonLogger.getter();
      uint64_t v13 = a1;
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v17 = swift_slowAlloc();
        uint64_t v41 = a1;
        uint64_t v18 = (void *)v17;
        uint64_t v40 = v2;
        *(_DWORD *)uint64_t v16 = 138412290;
        long long aBlock = v13;
        uint64_t v19 = v13;
        uint64_t v2 = v40;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v18 = v13;

        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Handling incoming connection: %@", v16, 0xCu);
        sub_100005E0C(&qword_1000421F8);
        swift_arrayDestroy();
        a1 = v41;
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        uint64_t v14 = v13;
      }

      (*(void (**)(char *, uint64_t))(v42 + 8))(v8, v2);
      id v31 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP12LockdownMode20LockdownModeProtocol_];
      [v13 setExportedInterface:v31];

      [v13 setExportedObject:v43];
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = v13;
      os_log_type_t v48 = sub_100023FBC;
      uint64_t v49 = v32;
      long long aBlock = _NSConcreteStackBlock;
      uint64_t v45 = 1107296256;
      uint64_t v46 = sub_10000C410;
      os_log_type_t v47 = &unk_10003D9C8;
      os_log_type_t v33 = _Block_copy(&aBlock);
      BOOL v34 = v13;
      swift_release();
      [v34 setInterruptionHandler:v33];
      _Block_release(v33);
      uint64_t v35 = swift_allocObject();
      *(void *)(v35 + 16) = v34;
      os_log_type_t v48 = sub_100023FE0;
      uint64_t v49 = v35;
      long long aBlock = _NSConcreteStackBlock;
      uint64_t v45 = 1107296256;
      uint64_t v46 = sub_10000C410;
      os_log_type_t v47 = &unk_10003DA18;
      uint64_t v36 = _Block_copy(&aBlock);
      uint64_t v37 = v34;
      swift_release();
      [v37 setInvalidationHandler:v36];
      _Block_release(v36);
      uint64_t v29 = 1;
      uint64_t v30 = &selRef_resume;
      goto LABEL_24;
    }
  }
  else
  {
    sub_100020B10((uint64_t)&aBlock);
  }
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [a1 valueForEntitlement:v11];

  if (v12)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
  }
  sub_100020ED8((uint64_t)&v51, (uint64_t)&aBlock, &qword_1000425E0);
  if (v47)
  {
    if (swift_dynamicCast() & 1) != 0 && (v50) {
      goto LABEL_15;
    }
  }
  else
  {
    sub_100020B10((uint64_t)&aBlock);
  }
  uint64_t v20 = v6;
  static Logger.daemonLogger.getter();
  id v21 = a1;
  uint64_t v22 = Logger.logObject.getter();
  os_log_type_t v23 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    uint64_t v25 = swift_slowAlloc();
    uint64_t v41 = a1;
    uint64_t v26 = (void *)v25;
    uint64_t v27 = (void **)swift_slowAlloc();
    uint64_t v42 = v3;
    *(_DWORD *)uint64_t v24 = 136315394;
    char v43 = v20;
    long long aBlock = v27;
    *(void *)&long long v51 = sub_10001AE5C(0xD00000000000002ALL, 0x8000000100033F40, (uint64_t *)&aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v24 + 12) = 2112;
    uint64_t v40 = v2;
    *(void *)&long long v51 = v21;
    id v28 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v26 = v21;

    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Client is missing entitlement: %s. (%@)", (uint8_t *)v24, 0x16u);
    sub_100005E0C(&qword_1000421F8);
    swift_arrayDestroy();
    a1 = v41;
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v40);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v20, v2);
  }
  uint64_t v29 = 0;
  uint64_t v30 = &selRef_invalidate;
LABEL_24:
  [a1 *v30];
  return v29;
}

unint64_t sub_100020ABC()
{
  unint64_t result = qword_1000425D8;
  if (!qword_1000425D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000425D8);
  }
  return result;
}

uint64_t sub_100020B10(uint64_t a1)
{
  uint64_t v2 = sub_100005E0C(&qword_1000425E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100020B78(uint64_t a1)
{
  return a1;
}

uint64_t sub_100020BCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100020C28()
{
  return sub_100023E88(40);
}

uint64_t sub_100020C30(uint64_t a1)
{
  return sub_10001701C(a1, *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100020C3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100020C4C()
{
  return swift_release();
}

unint64_t sub_100020C58()
{
  unint64_t result = qword_1000425F8;
  if (!qword_1000425F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000425F8);
  }
  return result;
}

ValueMetadata *type metadata accessor for LockdownModeServer.LockdownModeState()
{
  return &type metadata for LockdownModeServer.LockdownModeState;
}

uint64_t sub_100020CC4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for ServerError(uint64_t a1)
{
  return sub_100020CEC(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_100020CEC(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  if (a3 <= 1u) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s13lockdownmoded11ServerErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100020CC4(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ServerError(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  unsigned __int8 v5 = *(unsigned char *)(a2 + 16);
  sub_100020CC4(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  unsigned __int8 v8 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v5;
  sub_100020CEC(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for ServerError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ServerError(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  unsigned __int8 v6 = *(unsigned char *)(a1 + 16);
  *(unsigned char *)(a1 + 16) = v3;
  sub_100020CEC(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ServerError(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ServerError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 254;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_100020E90(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u) {
    return *(unsigned __int8 *)(a1 + 16);
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_100020EA8(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(void *)__n128 result = a2 - 2;
    *(void *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(unsigned char *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ServerError()
{
  return &type metadata for ServerError;
}

void sub_100020ED0(uint64_t a1)
{
  sub_10001A8D4(a1, *(void *)(v1 + 16));
}

uint64_t sub_100020ED8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005E0C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_100020F3C(uint64_t a1)
{
  sub_1000129BC(a1, *(void *)(v1 + 16));
}

uint64_t sub_100020F44()
{
  return _swift_deallocObject(v0, 25, 7);
}

uint64_t sub_100020F7C(uint64_t a1)
{
  return sub_10001078C(a1, *(_WORD **)(v1 + 16), *(unsigned __int8 *)(v1 + 24));
}

uint64_t sub_100020F88()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100020F98(_xpc_activity_s *a1)
{
  sub_10000DF38(a1, *(void *)(v1 + 16));
}

uint64_t sub_100020FA0()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100020FE0(_xpc_activity_s *a1)
{
  return sub_10000F9C8(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(uint64_t (**)(_xpc_activity_s *))(v1 + 32), *(void *)(v1 + 40));
}

void sub_100020FEC(void *a1)
{
  sub_10000E774(a1, *(unsigned char **)(v1 + 16));
}

void sub_100020FF4()
{
}

uint64_t sub_100020FFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100005E0C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

char *sub_100021060(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v5 = (char *)(a4 + a1 + 32);
    unsigned __int8 v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  __n128 result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

void sub_100021148(int a1, uint64_t a2, void *a3, void (**a4)(void, void))
{
  int v106 = a1;
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v108 = v7;
  uint64_t v109 = v8;
  uint64_t v9 = __chkstk_darwin(v7);
  NSString v11 = (char *)&v95 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v95 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  os_log_type_t v105 = (char *)&v95 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  int v104 = (char *)&v95 - v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v95 - v19;
  uint64_t v107 = swift_allocObject();
  *(void *)(v107 + 16) = a4;
  id v21 = self;
  _Block_copy(a4);
  id v22 = [v21 currentConnection];
  if (!v22) {
    goto LABEL_14;
  }
  os_log_type_t v23 = v22;
  Swift::String v103 = a3;
  NSString v24 = String._bridgeToObjectiveC()();
  id v25 = [v23 valueForEntitlement:v24];

  if (v25)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
  }
  sub_100020ED8((uint64_t)&v113, (uint64_t)v112, &qword_1000425E0);
  if (!v112[3])
  {

    sub_100020B10((uint64_t)v112);
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0 || (v110 & 1) == 0)
  {

LABEL_14:
    static Logger.daemonLogger.getter();
    uint64_t v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      v112[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315138;
      *(void *)&long long v113 = sub_10001AE5C(0xD00000000000002ALL, 0x8000000100033F40, v112);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Client is missing entitlement: %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v109 + 8))(v11, v108);
    sub_100020ABC();
    swift_allocError();
    *(void *)uint64_t v33 = 0xD00000000000002ALL;
    *(void *)(v33 + 8) = 0x8000000100033F40;
    *(unsigned char *)(v33 + 16) = 0;
    BOOL v34 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))a4)[2](a4, v34);

    swift_errorRelease();
    goto LABEL_17;
  }
  if (!a2)
  {
    long long v113 = 0u;
    long long v114 = 0u;
    sub_100020B10((uint64_t)&v113);
    long long v113 = 0u;
    long long v114 = 0u;
    sub_100020B10((uint64_t)&v113);
    long long v113 = 0u;
    long long v114 = 0u;
    sub_100020B10((uint64_t)&v113);
    long long v113 = 0u;
    long long v114 = 0u;
    sub_100020B10((uint64_t)&v113);
    long long v113 = 0u;
    long long v114 = 0u;
    sub_100020B10((uint64_t)&v113);
    long long v113 = 0u;
    long long v114 = 0u;
    sub_100020B10((uint64_t)&v113);
    uint64_t v101 = 0;
    uint64_t v102 = 0;
    int v100 = 0;
    int v36 = 0;
    long long v113 = 0u;
    long long v114 = 0u;
    int v37 = 1;
    int v99 = 1;
    int v35 = 1;
    uint64_t v27 = v108;
LABEL_89:
    uint64_t v61 = sub_100020B10((uint64_t)&v113);
LABEL_90:
    char v65 = 0;
    os_log_type_t v72 = v103;
    if (v106) {
      goto LABEL_100;
    }
    goto LABEL_91;
  }
  uint64_t v110 = static Constants.stateOptionReboot.getter();
  uint64_t v111 = v26;
  AnyHashable.init<A>(_:)();
  uint64_t v27 = v108;
  if (*(void *)(a2 + 16) && (unint64_t v28 = sub_10001B568((uint64_t)v112), (v29 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v28, (uint64_t)&v113);
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
  }
  sub_100020B78((uint64_t)v112);
  if (!*((void *)&v114 + 1))
  {
    sub_100020B10((uint64_t)&v113);
    goto LABEL_24;
  }
  if (!swift_dynamicCast())
  {
LABEL_24:
    int v35 = 1;
    goto LABEL_25;
  }
  int v35 = LOBYTE(v112[0]);
LABEL_25:
  uint64_t v110 = static Constants.stateOptionPasscode.getter();
  uint64_t v111 = v38;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v39 = sub_10001B568((uint64_t)v112), (v40 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v39, (uint64_t)&v113);
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
  }
  sub_100020B78((uint64_t)v112);
  if (*((void *)&v114 + 1))
  {
    int v41 = swift_dynamicCast();
    if (v41) {
      uint64_t v42 = v112[0];
    }
    else {
      uint64_t v42 = 0;
    }
    if (v41) {
      uint64_t v43 = v112[1];
    }
    else {
      uint64_t v43 = 0;
    }
    uint64_t v101 = v42;
    uint64_t v102 = v43;
  }
  else
  {
    sub_100020B10((uint64_t)&v113);
    uint64_t v101 = 0;
    uint64_t v102 = 0;
  }
  uint64_t v110 = static Constants.stateOptionAllDevices.getter();
  uint64_t v111 = v44;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v45 = sub_10001B568((uint64_t)v112), (v46 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v45, (uint64_t)&v113);
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
  }
  sub_100020B78((uint64_t)v112);
  if (!*((void *)&v114 + 1))
  {
    sub_100020B10((uint64_t)&v113);
    goto LABEL_46;
  }
  if (!swift_dynamicCast())
  {
LABEL_46:
    int v100 = 0;
    goto LABEL_47;
  }
  int v100 = LOBYTE(v112[0]);
LABEL_47:
  uint64_t v110 = static Constants.stateOptionIncludePaired.getter();
  uint64_t v111 = v47;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v48 = sub_10001B568((uint64_t)v112), (v49 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v48, (uint64_t)&v113);
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
  }
  sub_100020B78((uint64_t)v112);
  if (!*((void *)&v114 + 1))
  {
    sub_100020B10((uint64_t)&v113);
    goto LABEL_55;
  }
  if (!swift_dynamicCast())
  {
LABEL_55:
    int v50 = 1;
    goto LABEL_56;
  }
  int v50 = LOBYTE(v112[0]);
LABEL_56:
  int v99 = v50;
  uint64_t v110 = static Constants.stateOptionAcknowledgementOnly.getter();
  uint64_t v111 = v51;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v52 = sub_10001B568((uint64_t)v112), (v53 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v52, (uint64_t)&v113);
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
  }
  sub_100020B78((uint64_t)v112);
  if (!*((void *)&v114 + 1))
  {
    sub_100020B10((uint64_t)&v113);
    goto LABEL_64;
  }
  if (!swift_dynamicCast())
  {
LABEL_64:
    int v36 = 0;
    goto LABEL_65;
  }
  int v36 = LOBYTE(v112[0]);
LABEL_65:
  uint64_t v110 = static Constants.stateOptionRequireAuthentication.getter();
  uint64_t v111 = v54;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v55 = sub_10001B568((uint64_t)v112), (v56 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v55, (uint64_t)&v113);
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
  }
  sub_100020B78((uint64_t)v112);
  if (!*((void *)&v114 + 1))
  {
    sub_100020B10((uint64_t)&v113);
    goto LABEL_73;
  }
  if (!swift_dynamicCast())
  {
LABEL_73:
    int v57 = 1;
    goto LABEL_74;
  }
  int v57 = LOBYTE(v112[0]);
LABEL_74:
  int v98 = v57;
  uint64_t v110 = static Constants.stateOptionExcludeRestrictions.getter();
  uint64_t v111 = v58;
  AnyHashable.init<A>(_:)();
  if (*(void *)(a2 + 16) && (unint64_t v59 = sub_10001B568((uint64_t)v112), (v60 & 1) != 0))
  {
    sub_100020BCC(*(void *)(a2 + 56) + 32 * v59, (uint64_t)&v113);
  }
  else
  {
    long long v113 = 0u;
    long long v114 = 0u;
  }
  sub_100020B78((uint64_t)v112);
  int v37 = v98;
  if (!*((void *)&v114 + 1)) {
    goto LABEL_89;
  }
  sub_100005E0C(&qword_1000425F0);
  uint64_t v61 = swift_dynamicCast();
  if (!v61) {
    goto LABEL_90;
  }
  int v96 = v36;
  uint64_t v62 = v112[0];
  uint64_t v63 = *(void *)(v112[0] + 16);
  if (v63)
  {
    int v97 = v35;
    swift_bridgeObjectRetain();
    uint64_t v95 = v62;
    id v64 = (void **)(v62 + 40);
    char v65 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      uint64_t v66 = (uint64_t)*(v64 - 1);
      os_log_type_t v67 = *v64;
      swift_bridgeObjectRetain();
      v68._countAndFlagsBits = v66;
      v68._object = v67;
      unint64_t v69 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10003D020, v68);
      swift_bridgeObjectRelease();
      if (v69 <= 7)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          char v65 = sub_10001AD60(0, *((void *)v65 + 2) + 1, 1, v65);
        }
        unint64_t v71 = *((void *)v65 + 2);
        unint64_t v70 = *((void *)v65 + 3);
        if (v71 >= v70 >> 1) {
          char v65 = sub_10001AD60((char *)(v70 > 1), v71 + 1, 1, v65);
        }
        *((void *)v65 + 2) = v71 + 1;
        v65[v71 + 32] = v69;
      }
      v64 += 2;
      --v63;
    }
    while (v63);
    swift_bridgeObjectRelease();
    uint64_t v27 = v108;
    int v35 = v97;
    int v37 = v98;
  }
  else
  {
    char v65 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v61 = swift_bridgeObjectRelease();
  os_log_type_t v72 = v103;
  int v36 = v96;
  if (v106)
  {
LABEL_100:
    if (v36)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v106) {
        goto LABEL_104;
      }
      goto LABEL_102;
    }
LABEL_107:
    if (qword_100041D98 != -1) {
      uint64_t v61 = swift_once();
    }
    int v81 = v37;
    int v82 = off_100044150(v61);
    char v83 = v82;
    if ((v106 & 1) != 0 && v82)
    {
      static Logger.daemonLogger.getter();
      uint64_t v84 = Logger.logObject.getter();
      os_log_type_t v85 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v84, v85))
      {
        char v86 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v86 = 0;
        _os_log_impl((void *)&_mh_execute_header, v84, v85, "Client requested to turn on Lockdown Mode while in Buddy. Clearing all notifications…", v86, 2u);
        os_log_type_t v72 = v103;
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v109 + 8))(v105, v27);
      sub_10001336C();
    }
    uint64_t v87 = swift_allocObject();
    uint64_t v88 = v107;
    *(void *)(v87 + 16) = sub_100024004;
    *(void *)(v87 + 24) = v88;
    uint64_t v89 = v106 & 1;
    *(unsigned char *)(v87 + 32) = v106 & 1;
    *(unsigned char *)(v87 + 33) = v83;
    *(void *)(v87 + 40) = v72;
    *(unsigned char *)(v87 + 48) = v35;
    swift_retain();
    id v90 = v72;
    sub_100013454(v89, v100, v99, v81, 1, v65, v101, v102, 0, (void (*)(uint64_t))sub_100020B74, v87);
    swift_release();
    swift_release();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
LABEL_91:
  if (v37) {
    goto LABEL_100;
  }
  int v97 = v35;
  static Logger.daemonLogger.getter();
  os_log_type_t v73 = Logger.logObject.getter();
  os_log_type_t v74 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v73, v74))
  {
    os_log_type_t v75 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v75 = 0;
    _os_log_impl((void *)&_mh_execute_header, v73, v74, "Client requested to turn off Lockdown Mode without authentication. Ignoring override…", v75, 2u);
    os_log_type_t v72 = v103;
    swift_slowDealloc();
  }

  uint64_t v61 = (*(uint64_t (**)(char *, uint64_t))(v109 + 8))(v14, v27);
  if (!v36)
  {
    int v37 = 1;
    LOBYTE(v35) = v97;
    goto LABEL_107;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_102:
  if ((*((unsigned char *)v72 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) & 1) != 0
    || (type metadata accessor for LockdownModeXNU(), (static LockdownModeXNU.lockdownModeEnabled.getter() & 1) != 0))
  {
LABEL_104:
    static Logger.daemonLogger.getter();
    uint64_t v76 = Logger.logObject.getter();
    os_log_type_t v77 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v76, v77))
    {
      int v78 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v78 = 0;
      _os_log_impl((void *)&_mh_execute_header, v76, v77, "Client requested acknowledgementOnly but Lockdown Mode is either already on or client wants to turn it on. Ignoring acknowledgementOnly…", v78, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v109 + 8))(v20, v27);
    sub_100020ABC();
    swift_allocError();
    *(void *)uint64_t v79 = 0;
    *(void *)(v79 + 8) = 0;
    *(unsigned char *)(v79 + 16) = 2;
    uint64_t v80 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))a4)[2](a4, v80);

    swift_errorRelease();
LABEL_17:
    swift_release();
    return;
  }
  char v91 = v104;
  static Logger.daemonLogger.getter();
  char v92 = Logger.logObject.getter();
  os_log_type_t v93 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v92, v93))
  {
    os_log_type_t v94 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v94 = 0;
    _os_log_impl((void *)&_mh_execute_header, v92, v93, "Client requested acknowledgementOnly. Clearing Lockdown Mode notifications…", v94, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v109 + 8))(v91, v27);
  sub_10001336C();
  a4[2](a4, 0);
  swift_release();
}

void sub_100021FEC(char a1, void *a2, void (**a3)(void, void))
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&aBlock[-1] - v11;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = a3;
  uint64_t v13 = self;
  _Block_copy(a3);
  id v14 = [v13 currentConnection];
  if (v14)
  {
    uint64_t v15 = v14;
    NSString v16 = String._bridgeToObjectiveC()();
    id v17 = [v15 valueForEntitlement:v16];

    if (v17)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v36, 0, sizeof(v36));
    }
    sub_100020ED8((uint64_t)v36, (uint64_t)aBlock, &qword_1000425E0);
    if (v32)
    {
      if (swift_dynamicCast() & 1) != 0 && (v35)
      {
        if (a1)
        {
          static Logger.daemonLogger.getter();
          uint64_t v18 = Logger.logObject.getter();
          os_log_type_t v19 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v18, v19))
          {
            uint64_t v20 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)uint64_t v20 = 0;
            _os_log_impl((void *)&_mh_execute_header, v18, v19, "Client requested to fetch the state from KVS…", v20, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
          id v21 = sub_10000C684();
          id v22 = (void *)swift_allocObject();
          uint64_t v23 = v30;
          _OWORD v22[2] = sub_100023E04;
          v22[3] = v23;
          v22[4] = a2;
          uint64_t v33 = sub_100024008;
          BOOL v34 = v22;
          aBlock[0] = (uint64_t)_NSConcreteStackBlock;
          aBlock[1] = 1107296256;
          aBlock[2] = (uint64_t)sub_10000C454;
          uint64_t v32 = &unk_10003D838;
          NSString v24 = _Block_copy(aBlock);
          swift_retain();
          id v25 = a2;
          swift_release();
          [v21 synchronizeWithCompletionHandler:v24];
          _Block_release(v24);
          swift_release();
        }
        else
        {
          sub_10000CF04();
          a3[2](a3, v29 & 1);
          swift_release();
        }
        return;
      }
    }
    else
    {

      sub_100020B10((uint64_t)aBlock);
    }
  }
  static Logger.daemonLogger.getter();
  uint64_t v26 = Logger.logObject.getter();
  os_log_type_t v27 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v26, v27))
  {
    unint64_t v28 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)unint64_t v28 = 136315138;
    *(void *)&v36[0] = sub_10001AE5C(0xD00000000000002ALL, 0x8000000100033F40, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v26, v27, "Client is missing entitlement: %s", v28, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  a3[2](a3, 0);
  swift_release();
}

void sub_1000224D0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v53 = v6;
  uint64_t v54 = v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)&v50 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v50 - v14;
  if (qword_100041D90 != -1) {
    swift_once();
  }
  uint64_t v16 = static RestrictionsManager.shared;
  id v17 = [self currentConnection];
  swift_bridgeObjectRetain();
  v59._countAndFlagsBits = a1;
  v59._object = a2;
  unsigned __int8 v18 = _s13lockdownmoded19RestrictionsManagerC14RestrictionKeyO8rawValueAESgSS_tcfC_0(v59);
  if (v18 == 8) {
    goto LABEL_11;
  }
  unsigned __int8 v19 = v18;
  swift_beginAccess();
  uint64_t v20 = *(void *)(v16 + 24);
  if (!*(void *)(v20 + 16)) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v21 = sub_10001B700(v19);
  if ((v22 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    sub_100020ABC();
    swift_allocError();
    *(void *)uint64_t v33 = a1;
    *(void *)(v33 + 8) = a2;
    *(unsigned char *)(v33 + 16) = 1;
    swift_bridgeObjectRetain();
    BOOL v34 = (void *)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v34);

    swift_errorRelease();
    return;
  }
  uint64_t v23 = *(void *)(*(void *)(v20 + 56) + 8 * v21);
  swift_retain();
  swift_bridgeObjectRelease();
  uint64_t v24 = *(void *)(v23 + 128);
  uint64_t v52 = v23;
  if (!v24)
  {
    static Logger.daemonLogger.getter();
    swift_bridgeObjectRetain_n();
    char v35 = Logger.logObject.getter();
    os_log_type_t v36 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v35, v36))
    {
      int v37 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v57 = swift_slowAlloc();
      *(_DWORD *)int v37 = 136315138;
      uint64_t v51 = v37 + 4;
      swift_bridgeObjectRetain();
      *(void *)&long long v55 = sub_10001AE5C(a1, (unint64_t)a2, (uint64_t *)&v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Could not update restriction because it is not set as updatable: %s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v54 + 8))(v15, v53);
    sub_100020ABC();
    swift_allocError();
    *(void *)uint64_t v38 = a1;
    *(void *)(v38 + 8) = a2;
    *(unsigned char *)(v38 + 16) = 1;
    swift_bridgeObjectRetain();
    goto LABEL_38;
  }
  uint64_t v25 = *(void *)(v23 + 120);
  *(void *)&long long v57 = 0xD000000000000020;
  *((void *)&v57 + 1) = 0x8000000100033F70;
  String.append(_:)(*(Swift::String *)(&v24 - 1));
  unint64_t v27 = *((void *)&v57 + 1);
  uint64_t v26 = v57;
  if (!v17)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    sub_100020B10((uint64_t)&v57);
    long long v57 = 0u;
    long long v58 = 0u;
LABEL_33:
    sub_100020B10((uint64_t)&v57);
    goto LABEL_34;
  }
  id v28 = v17;
  uint64_t v29 = v27;
  uint64_t v30 = v26;
  uint64_t v51 = (uint8_t *)v29;
  NSString v31 = String._bridgeToObjectiveC()();
  id v32 = [v28 valueForEntitlement:v31];

  if (v32)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
  }
  sub_100020ED8((uint64_t)&v55, (uint64_t)&v57, &qword_1000425E0);
  if (*((void *)&v58 + 1))
  {
    uint64_t v26 = v30;
    if (swift_dynamicCast())
    {
      unint64_t v27 = (unint64_t)v51;
      if (v55 != 1) {
        goto LABEL_34;
      }
LABEL_29:
      swift_bridgeObjectRelease();
      if (*(unsigned char *)(v52 + 112) == 1)
      {
        static Logger.daemonLogger.getter();
        int v41 = Logger.logObject.getter();
        os_log_type_t v42 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v41, v42))
        {
          uint64_t v43 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v43 = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, v42, "Restriction is already set to changed. No need to update", v43, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v54 + 8))(v13, v53);
      }
      else
      {
        *(unsigned char *)(v52 + 112) = 1;
        sub_100029204();
      }
      (*(void (**)(uint64_t, void))(a3 + 16))(a3, 0);

      goto LABEL_39;
    }
  }
  else
  {
    sub_100020B10((uint64_t)&v57);
  }
  NSString v39 = String._bridgeToObjectiveC()();
  id v40 = [v28 valueForEntitlement:v39];

  if (v40)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v55 = 0u;
    long long v56 = 0u;
  }
  uint64_t v26 = v30;
  sub_100020ED8((uint64_t)&v55, (uint64_t)&v57, &qword_1000425E0);
  unint64_t v27 = (unint64_t)v51;
  if (!*((void *)&v58 + 1)) {
    goto LABEL_33;
  }
  if swift_dynamicCast() && (v55) {
    goto LABEL_29;
  }
LABEL_34:
  static Logger.daemonLogger.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v44 = Logger.logObject.getter();
  os_log_type_t v45 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v44, v45))
  {
    char v46 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    uint64_t v51 = (uint8_t *)v26;
    *(void *)&long long v57 = v47;
    *(_DWORD *)char v46 = 136315138;
    swift_bridgeObjectRetain();
    *(void *)&long long v55 = sub_10001AE5C((uint64_t)v51, v27, (uint64_t *)&v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v44, v45, "Client is missing entitlement: %s", v46, 0xCu);
    swift_arrayDestroy();
    uint64_t v26 = (uint64_t)v51;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v54 + 8))(v10, v53);
  sub_100020ABC();
  swift_allocError();
  *(void *)uint64_t v48 = v26;
  *(void *)(v48 + 8) = v27;
  *(unsigned char *)(v48 + 16) = 0;
LABEL_38:
  char v49 = (void *)_convertErrorToNSError(_:)();
  (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v49);

  swift_errorRelease();
LABEL_39:
  swift_release();
}

void sub_100022D0C(char a1, void *a2, id a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v29 - v11;
  uint64_t v13 = self;
  _Block_copy(a3);
  id v14 = [v13 currentConnection];
  if (!v14)
  {
LABEL_21:
    static Logger.daemonLogger.getter();
    uint64_t v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = (uint8_t *)swift_slowAlloc();
      v33[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136315138;
      id v29 = a3;
      *(void *)&long long v31 = sub_10001AE5C(0xD000000000000027, 0x8000000100033FA0, v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Client is missing entitlement: %s", v26, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      a3 = v29;
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    sub_100020ABC();
    swift_allocError();
    *(void *)uint64_t v27 = 0xD000000000000027;
    *(void *)(v27 + 8) = 0x8000000100033FA0;
    *(unsigned char *)(v27 + 16) = 0;
    id v28 = (void *)_convertErrorToNSError(_:)();
    (*((void (**)(id, void, void *))a3 + 2))(a3, 0, v28);

    swift_errorRelease();
    goto LABEL_25;
  }
  uint64_t v15 = v14;
  id v29 = a2;
  NSString v16 = String._bridgeToObjectiveC()();
  id v17 = [v15 valueForEntitlement:v16];

  if (v17)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  sub_100020ED8((uint64_t)&v31, (uint64_t)v33, &qword_1000425E0);
  if (v34)
  {
    if (swift_dynamicCast() & 1) != 0 && (v30) {
      goto LABEL_16;
    }
  }
  else
  {
    sub_100020B10((uint64_t)v33);
  }
  NSString v18 = String._bridgeToObjectiveC()();
  id v19 = [v15 valueForEntitlement:v18];

  if (v19)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
  }
  sub_100020ED8((uint64_t)&v31, (uint64_t)v33, &qword_1000425E0);
  if (!v34)
  {
    sub_100020B10((uint64_t)v33);
LABEL_20:

    goto LABEL_21;
  }
  if ((swift_dynamicCast() & 1) == 0 || (v30 & 1) == 0) {
    goto LABEL_20;
  }
LABEL_16:
  static Logger.daemonLogger.getter();
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    char v22 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)char v22 = 67109120;
    LODWORD(v33[0]) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Client requested to enableIfNeeded (reboot: %{BOOL}d)", v22, 8u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  _Block_copy(a3);
  id v23 = v29;
  sub_10001CA10(0, (uint64_t)v23, v23, a1 & 1, (void (**)(void, void, void))a3);
  _Block_release(a3);

LABEL_25:
  _Block_release(a3);
}

void sub_10002326C(uint64_t a1, void (**a2)(void, void))
{
  uint64_t v23 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v23 - 8);
  uint64_t v5 = __chkstk_darwin(v23);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v23 - v8;
  uint64_t v10 = self;
  _Block_copy(a2);
  id v11 = [v10 currentConnection];
  if (v11)
  {
    uint64_t v12 = v11;
    NSString v13 = String._bridgeToObjectiveC()();
    id v14 = [v12 valueForEntitlement:v13];

    if (v14)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v25, 0, sizeof(v25));
    }
    sub_100020ED8((uint64_t)v25, (uint64_t)v26, &qword_1000425E0);
    if (v26[3])
    {
      if (swift_dynamicCast() & 1) != 0 && (v24)
      {
        static Logger.daemonLogger.getter();
        uint64_t v15 = Logger.logObject.getter();
        os_log_type_t v16 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v15, v16))
        {
          id v17 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v17 = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "Client requested to migrateIfNeeded", v17, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v23);
        _Block_copy(a2);
        sub_10001E770(1u, a1, a2);
        _Block_release(a2);

        goto LABEL_16;
      }
    }
    else
    {

      sub_100020B10((uint64_t)v26);
    }
  }
  static Logger.daemonLogger.getter();
  NSString v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    v26[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315138;
    *(void *)&v25[0] = sub_10001AE5C(0xD000000000000027, 0x8000000100033FA0, v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Client is missing entitlement: %s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v23);
  sub_100020ABC();
  swift_allocError();
  *(void *)uint64_t v21 = 0xD000000000000027;
  *(void *)(v21 + 8) = 0x8000000100033FA0;
  *(unsigned char *)(v21 + 16) = 0;
  char v22 = (void *)_convertErrorToNSError(_:)();
  ((void (**)(void, void *))a2)[2](a2, v22);

  swift_errorRelease();
LABEL_16:
  _Block_release(a2);
}

void sub_100023698(uint64_t a1, uint64_t a2)
{
  uint64_t v40 = a2;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v38 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  NSString v13 = (char *)&v38 - v12;
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v38 - v14;
  id v16 = [self currentConnection];
  if (v16)
  {
    id v17 = v16;
    uint64_t v38 = a1;
    uint64_t v39 = v3;
    NSString v18 = String._bridgeToObjectiveC()();
    id v19 = [v17 valueForEntitlement:v18];

    if (v19)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v42 = 0u;
      long long v43 = 0u;
    }
    sub_100020ED8((uint64_t)&v42, (uint64_t)v44, &qword_1000425E0);
    if (v45)
    {
      if (swift_dynamicCast() & 1) != 0 && (v41) {
        goto LABEL_16;
      }
    }
    else
    {
      sub_100020B10((uint64_t)v44);
    }
    NSString v20 = String._bridgeToObjectiveC()();
    id v21 = [v17 valueForEntitlement:v20];

    if (v21)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v42 = 0u;
      long long v43 = 0u;
    }
    sub_100020ED8((uint64_t)&v42, (uint64_t)v44, &qword_1000425E0);
    if (v45)
    {
      if (swift_dynamicCast() & 1) != 0 && (v41)
      {
LABEL_16:
        static Logger.daemonLogger.getter();
        char v22 = Logger.logObject.getter();
        os_log_type_t v23 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v22, v23))
        {
          char v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)char v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "Checking if a reboot is needed…", v24, 2u);
          swift_slowDealloc();
        }

        os_log_type_t v25 = *(void (**)(char *, uint64_t))(v4 + 8);
        uint64_t v26 = v39;
        v25(v15, v39);
        if (qword_100041D90 != -1) {
          swift_once();
        }
        if (*(unsigned char *)(static RestrictionsManager.shared + 32) == 1
          && ((*(unsigned char *)(v38 + OBJC_IVAR____TtC13lockdownmoded18LockdownModeServer__cachedEnabled) & 1) != 0
           || (type metadata accessor for LockdownModeXNU(),
               (static LockdownModeXNU.lockdownModeEnabled.getter() & 1) != 0)
           || (static LockdownModeXNU.lockdownModeEnabled.getter() & 1) == 0))
        {
          static Logger.daemonLogger.getter();
          char v35 = Logger.logObject.getter();
          os_log_type_t v36 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v35, v36))
          {
            int v37 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)int v37 = 0;
            _os_log_impl((void *)&_mh_execute_header, v35, v36, "Lockdown Mode was turned on by a migrator. Rebooting…", v37, 2u);
            swift_slowDealloc();
          }

          v25(v13, v26);
          sub_10002E488(0xD00000000000001ALL, (void *)0x8000000100033FD0);
        }
        else
        {
          static Logger.daemonLogger.getter();
          uint64_t v27 = Logger.logObject.getter();
          os_log_type_t v28 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v27, v28))
          {
            id v29 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v29 = 0;
            _os_log_impl((void *)&_mh_execute_header, v27, v28, "Lockdown Mode was not turned on by a migrator. No need to reboot", v29, 2u);
            swift_slowDealloc();
          }

          v25(v10, v26);
        }
        (*(void (**)(uint64_t, void))(v40 + 16))(v40, 0);

        return;
      }
    }
    else
    {
      sub_100020B10((uint64_t)v44);
    }

    uint64_t v3 = v39;
  }
  static Logger.daemonLogger.getter();
  char v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v30, v31))
  {
    long long v32 = (uint8_t *)swift_slowAlloc();
    v44[0] = swift_slowAlloc();
    *(_DWORD *)long long v32 = 136315138;
    *(void *)&long long v42 = sub_10001AE5C(0xD000000000000027, 0x8000000100033FA0, v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Client is missing entitlement: %s", v32, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  sub_100020ABC();
  swift_allocError();
  *(void *)uint64_t v33 = 0xD000000000000027;
  *(void *)(v33 + 8) = 0x8000000100033FA0;
  *(unsigned char *)(v33 + 16) = 0;
  uint64_t v34 = (void *)_convertErrorToNSError(_:)();
  (*(void (**)(uint64_t, void *))(v40 + 16))(v40, v34);

  swift_errorRelease();
}

void sub_100023D5C(uint64_t a1)
{
  sub_100016B38(a1, *(void *)(v1 + 16));
}

uint64_t sub_100023D64(uint64_t a1)
{
  return sub_100018880(a1, *(uint64_t (**)(uint64_t))(v1 + 16));
}

uint64_t sub_100023D6C(uint64_t a1)
{
  return sub_10001514C(a1, *(uint64_t (**)(void))(v1 + 16));
}

void sub_100023D74(char a1, uint64_t a2)
{
  sub_1000183DC(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100023D7C()
{
  return sub_100023E88(41);
}

uint64_t sub_100023D84(uint64_t a1)
{
  return sub_100018084(a1, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(unsigned char *)(v1 + 40));
}

uint64_t sub_100023D94()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100023DCC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100023E04(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_100023E1C()
{
  return sub_100023E88(40);
}

uint64_t sub_100023E28()
{
  swift_release();

  return _swift_deallocObject(v0, 49, 7);
}

uint64_t sub_100023E68(uint64_t a1)
{
  return sub_10001645C(a1, *(uint64_t (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), *(unsigned char *)(v1 + 32), *(unsigned char *)(v1 + 33), *(void *)(v1 + 40), *(unsigned char *)(v1 + 48));
}

uint64_t sub_100023E80()
{
  return sub_100023E88(41);
}

uint64_t sub_100023E88(uint64_t a1)
{
  swift_release();

  return _swift_deallocObject(v1, a1, 7);
}

uint64_t sub_100023ED8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100023F34()
{
  return _swift_deallocObject(v0, 24, 7);
}

Swift::Int sub_100023F6C(uint64_t a1)
{
  return sub_100014C7C(a1, *(void *)(v1 + 16));
}

uint64_t sub_100023F74(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100023FBC()
{
  return sub_100015388(*(void **)(v0 + 16), "Connection interrupted: %@");
}

uint64_t sub_100023FE0()
{
  return sub_100015388(*(void **)(v0 + 16), "Connection invalidated: %@");
}

uint64_t sub_10002409C(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_100005E0C(&qword_100041E78);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v26 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v25 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v25) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v25) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v26 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v25) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v26 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v25) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v26 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    int v17 = *(_DWORD *)(*(void *)(a1 + 48) + 4 * v12);
    sub_100020BCC(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v38 + 8);
    LODWORD(v38[0]) = v17;
    v36[0] = v38[0];
    v36[1] = v38[1];
    uint64_t v37 = v39;
    LODWORD(v35[0]) = v17;
    swift_dynamicCast();
    sub_100005F18((_OWORD *)((char *)v36 + 8), v30);
    long long v31 = v27;
    long long v32 = v28;
    uint64_t v33 = v29;
    sub_100005F18(v30, v34);
    long long v27 = v31;
    long long v28 = v32;
    uint64_t v29 = v33;
    sub_100005F18(v34, v35);
    sub_100005F18(v35, &v31);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v18 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v19 = result & ~v18;
    unint64_t v20 = v19 >> 6;
    if (((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v19) & ~*(void *)&v6[8 * (v19 >> 6)])) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v21 = 0;
      unint64_t v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v23 = v20 == v22;
        if (v20 == v22) {
          unint64_t v20 = 0;
        }
        v21 |= v23;
        uint64_t v24 = *(void *)&v6[8 * v20];
      }
      while (v24 == -1);
      unint64_t v9 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v27;
    *(_OWORD *)(v10 + 16) = v28;
    *(void *)(v10 + 32) = v29;
    uint64_t result = (uint64_t)sub_100005F18(&v31, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v25)
  {
LABEL_37:
    swift_release();
    sub_100024EEC();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v26 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v25) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for LockdownModeACM()
{
  return self;
}

uint64_t type metadata accessor for LockdownModeACM.TRM()
{
  return self;
}

NSObject *sub_10002449C(uint64_t a1, uint64_t a2, uint64_t a3, uint8_t *a4, uint64_t a5, uint64_t a6)
{
  os_log_type_t v72 = a4;
  uint64_t v70 = a3;
  uint64_t v71 = a2;
  uint64_t v69 = a1;
  uint64_t v7 = type metadata accessor for String.Encoding();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = type metadata accessor for Logger();
  uint64_t v73 = *(void *)(v74 - 8);
  uint64_t v11 = __chkstk_darwin(v74);
  Swift::String v68 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  int64_t v15 = (char *)&v67 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v67 - v17;
  __chkstk_darwin(v16);
  unint64_t v20 = (char *)&v67 - v19;
  char v21 = [objc_allocWithZone((Class)LAContext) init];
  v78[0] = 0;
  uint64_t v76 = v21;
  unsigned __int8 v22 = [v21 canEvaluatePolicy:1007 error:v78];
  id v23 = v78[0];
  if ((v22 & 1) != 0 || !v78[0])
  {
    if (a6)
    {
      id v28 = v78[0];
      static String.Encoding.utf8.getter();
      uint64_t v29 = String.data(using:allowLossyConversion:)();
      unint64_t v31 = v30;
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      if (v31 >> 60 == 15)
      {
        Class isa = 0;
      }
      else
      {
        Class isa = Data._bridgeToObjectiveC()().super.isa;
        sub_100024E80(v29, v31);
      }
      uint64_t v26 = v76;
      unsigned __int8 v54 = [v76 setCredential:isa type:-1];

      if (v54)
      {

        return v26;
      }
      static Logger.daemonLogger.getter();
      long long v55 = Logger.logObject.getter();
      os_log_type_t v56 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v55, v56))
      {
        long long v57 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)long long v57 = 0;
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "Could not setCredential with the user-provided passcode", v57, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v73 + 8))(v15, v74);
    }
    else
    {
      sub_100005E0C(&qword_100042918);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1000335B0;
      *(_DWORD *)(inited + 32) = 1021;
      *(void *)(inited + 64) = &type metadata for String;
      uint64_t v42 = v71;
      *(void *)(inited + 40) = v69;
      *(void *)(inited + 48) = v42;
      *(_DWORD *)(inited + 72) = 1030;
      *(void *)(inited + 104) = &type metadata for String;
      long long v43 = v72;
      *(void *)(inited + 80) = v70;
      *(void *)(inited + 88) = v43;
      *(_DWORD *)(inited + 112) = 1042;
      *(void *)(inited + 144) = &type metadata for String;
      *(void *)(inited + 120) = 0xD00000000000001DLL;
      *(void *)(inited + 128) = 0x8000000100034820;
      unint64_t v44 = sub_100005F28(inited);
      swift_setDeallocating();
      uint64_t v45 = v23;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_100005E0C(&qword_100041F38);
      swift_arrayDestroy();
      sub_10002409C(v44);
      swift_bridgeObjectRelease();
      Class v46 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      v78[0] = 0;
      uint64_t v26 = v76;
      id v47 = [v76 evaluatePolicy:1007 options:v46 error:v78];

      id v48 = v78[0];
      if (!v47)
      {
        id v62 = v78[0];
        _convertNSErrorToError(_:)();

        swift_willThrow();
LABEL_26:

        return v26;
      }
      uint64_t v49 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
      id v50 = v48;

      int v77 = 3;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v49 + 16))
      {
        unint64_t v51 = sub_10001B568((uint64_t)v78);
        uint64_t v52 = v68;
        if (v53)
        {
          sub_100020BCC(*(void *)(v49 + 56) + 32 * v51, (uint64_t)&v79);
        }
        else
        {
          long long v80 = 0u;
          long long v79 = 0u;
        }
      }
      else
      {
        long long v80 = 0u;
        long long v79 = 0u;
        uint64_t v52 = v68;
      }
      swift_bridgeObjectRelease();
      sub_100020B78((uint64_t)v78);
      if (*((void *)&v80 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0 && v77 == 1)
        {

          return v26;
        }
      }
      else
      {
        sub_100020B10((uint64_t)&v79);
      }
      static Logger.daemonLogger.getter();
      uint64_t v63 = Logger.logObject.getter();
      os_log_type_t v64 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v63, v64))
      {
        char v65 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)char v65 = 0;
        _os_log_impl((void *)&_mh_execute_header, v63, v64, "Could not evaluatePolicy. Unknown error", v65, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v73 + 8))(v52, v74);
    }
    return 0;
  }
  uint64_t v24 = v78[0];
  if ([v24 code] != (id)-5)
  {
    static Logger.daemonLogger.getter();
    uint64_t v33 = v24;
    uint64_t v34 = Logger.logObject.getter();
    os_log_type_t v35 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v34, v35))
    {
      os_log_type_t v36 = (uint8_t *)swift_slowAlloc();
      os_log_type_t v75 = (void *)swift_slowAlloc();
      v78[0] = v75;
      *(_DWORD *)os_log_type_t v36 = 136315138;
      os_log_type_t v72 = v36 + 4;
      id v37 = [v33 localizedDescription];
      uint64_t v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v40 = v39;

      *(void *)&long long v79 = sub_10001AE5C(v38, v40, (uint64_t *)v78);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "Could not canEvaluatePolicy: %s", v36, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(char *, uint64_t))(v73 + 8))(v18, v74);
    uint64_t v45 = v33;
    swift_willThrow();

    uint64_t v26 = v76;
    goto LABEL_26;
  }
  Class v25 = Data._bridgeToObjectiveC()().super.isa;
  uint64_t v26 = v76;
  unsigned __int8 v27 = [v76 setCredential:v25 type:-1];

  if (v27)
  {
  }
  else
  {
    static Logger.daemonLogger.getter();
    long long v58 = Logger.logObject.getter();
    os_log_type_t v59 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v58, v59))
    {
      char v60 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v60 = 0;
      _os_log_impl((void *)&_mh_execute_header, v58, v59, "Could not setCredential with an empty passcode", v60, 2u);
      swift_slowDealloc();
      uint64_t v61 = v24;
    }
    else
    {
      uint64_t v61 = v58;
      long long v58 = v26;
      uint64_t v26 = v24;
    }

    (*(void (**)(char *, uint64_t))(v73 + 8))(v20, v74);
    return 0;
  }
  return v26;
}

uint64_t sub_100024E80(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100024E94(a1, a2);
  }
  return a1;
}

uint64_t sub_100024E94(uint64_t a1, unint64_t a2)
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

uint64_t sub_100024EEC()
{
  return swift_release();
}

void sub_100024EF4(char a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemonLogger.getter();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 67109120;
    LODWORD(v16) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Setting BOOLean value via LAStorage: %{BOOL}d", v10, 8u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  id v11 = objc_allocWithZone((Class)LAStorage);
  if (a1) {
    id v12 = [v11 init];
  }
  else {
    id v12 = [v11 initWithDomain:0 authenticationContext:a2];
  }
  uint64_t v13 = v12;
  id v16 = 0;
  if ([v12 setBool:a1 & 1 forKey:6 error:&v16])
  {
    id v14 = v16;
  }
  else
  {
    id v15 = v16;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
}

BOOL sub_10002512C()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v13 = 2;
  int v4 = sub_100026634(&v13);
  if (v4)
  {
    int v5 = v4;
    static Logger.daemonLogger.getter();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 67109120;
      int v12 = v5;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error getting TRM Profile: %d", v8, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1000262A0();
    swift_allocError();
    *os_log_type_t v9 = v5;
    swift_willThrow();
  }
  else
  {
    return v13 == 1;
  }
  return v10;
}

uint64_t sub_100025320(uint64_t (*a1)(unsigned int *), const char *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unsigned int v16 = 2;
  int v8 = a1(&v16);
  if (!v8) {
    return v16;
  }
  int v9 = v8;
  static Logger.daemonLogger.getter();
  BOOL v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    int v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)int v12 = 67109120;
    int v15 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, a2, v12, 8u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1000262A0();
  swift_allocError();
  *int v13 = v9;
  return swift_willThrow();
}

BOOL sub_100025518()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v13 = 2;
  int v4 = sub_100026744(&v13);
  if (v4)
  {
    int v5 = v4;
    static Logger.daemonLogger.getter();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      int v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)int v8 = 67109120;
      int v12 = v5;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error getting TRM GracePeriod: %d", v8, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1000262A0();
    swift_allocError();
    *int v9 = v5;
    swift_willThrow();
  }
  else
  {
    return v13 == 3;
  }
  return v10;
}

uint64_t sub_10002570C(uint64_t a1, uint64_t (*a2)(uint64_t), const char *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = a2(a1);
  if (result)
  {
    int v11 = result;
    static Logger.daemonLogger.getter();
    int v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)uint64_t v14 = 67109376;
      int v18 = a1;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v14 + 8) = 1024;
      int v17 = v11;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, a3, (uint8_t *)v14, 0xEu);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_1000262A0();
    swift_allocError();
    *int v15 = v11;
    return swift_willThrow();
  }
  return result;
}

BOOL sub_1000258E8()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  int v13 = 0;
  int v4 = sub_10002654C((uint64_t)&v13);
  if (v4)
  {
    int v5 = v4;
    static Logger.daemonLogger.getter();
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v6, v7))
    {
      uint64_t v8 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v8 = 67109120;
      int v12 = v5;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Error getting TRM FeatureFlags: %d", v8, 8u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_1000262A0();
    swift_allocError();
    *int v9 = v5;
    swift_willThrow();
  }
  else
  {
    return (~v13 & 6) == 0;
  }
  return v10;
}

BOOL sub_100025ADC()
{
  uint64_t v0 = type metadata accessor for Logger();
  __chkstk_darwin(v0);
  sub_1000258E8();
  return sub_10002512C();
}

uint64_t sub_100025D28(char a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v5 = __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v21 - v6;
  __chkstk_darwin(v5);
  int v9 = (char *)&v21 - v8;
  if (sub_1000258E8())
  {
    if (a1) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = sub_100025320(sub_1000262F4, "Error getting default TRM Profile: %d");
    }
    int v11 = "Error setting TRM Profile (value=%u: %d";
    int v12 = sub_100026268;
  }
  else
  {
    if (a1) {
      uint64_t v10 = 3;
    }
    else {
      uint64_t v10 = sub_100025320(sub_10002643C, "Error getting default TRM GracePeriod: %d");
    }
    int v11 = "Error setting TRM GracePeriod (value=%u: %d";
    int v12 = sub_100026404;
  }
  uint64_t result = sub_10002570C(v10, (uint64_t (*)(uint64_t))v12, v11);
  if (a1)
  {
    int v24 = lockdown_reset_pairing();
    if (v24)
    {
      static Logger.daemonLogger.getter();
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 67109120;
        swift_beginAccess();
        LODWORD(v23) = v24;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "Error resetting Pairing Records: %d", v16, 8u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
    }
    int v17 = sub_100026254();
    uint64_t result = swift_beginAccess();
    int v24 = v17;
    if (v17)
    {
      static Logger.daemonLogger.getter();
      int v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v18, v19))
      {
        unint64_t v20 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)unint64_t v20 = 67109120;
        int v22 = v17;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Error clearing acessory cache: %d", v20, 8u);
        swift_slowDealloc();
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    }
  }
  return result;
}

uint64_t sub_100026254()
{
  return ACMKernelControl(14);
}

uint64_t sub_100026268()
{
  return ACMKernelControl(19);
}

unint64_t sub_1000262A0()
{
  unint64_t result = qword_100042920;
  if (!qword_100042920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042920);
  }
  return result;
}

uint64_t sub_1000262F4(_DWORD *a1)
{
  if (!a1) {
    return 4294967293;
  }
  int v4 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = -5;
  int v11 = 10;
  uint64_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  os_log_type_t v7 = sub_1000268BC;
  uint64_t v8 = &unk_10003DAD8;
  int v9 = &v12;
  uint64_t v10 = &v4;
  uint64_t v2 = ACMKernelControl(18);
  if (v2)
  {
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v2 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
    if (!v2) {
      *a1 = v4;
    }
  }
  return v2;
}

void sub_1000263EC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026404()
{
  return ACMKernelControl(19);
}

uint64_t sub_10002643C(_DWORD *a1)
{
  if (!a1) {
    return 4294967293;
  }
  int v4 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = -5;
  int v11 = 9;
  uint64_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  os_log_type_t v7 = sub_1000268BC;
  uint64_t v8 = &unk_10003DAD8;
  int v9 = &v12;
  uint64_t v10 = &v4;
  uint64_t v2 = ACMKernelControl(18);
  if (v2)
  {
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v2 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
    if (!v2) {
      *a1 = v4;
    }
  }
  return v2;
}

void sub_100026534(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002654C(uint64_t a1)
{
  if (!a1) {
    return 4294967293;
  }
  uint64_t v3 = 0;
  int v4 = &v3;
  uint64_t v5 = 0x2020000000;
  int v6 = -5;
  uint64_t v1 = ACMKernelControl(18);
  if (!v1) {
    uint64_t v1 = *((unsigned int *)v4 + 6);
  }
  _Block_object_dispose(&v3, 8);
  return v1;
}

void sub_10002661C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026634(_DWORD *a1)
{
  if (!a1) {
    return 4294967293;
  }
  int v4 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = -5;
  int v11 = 5;
  uint64_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  os_log_type_t v7 = sub_1000268BC;
  uint64_t v8 = &unk_10003DAD8;
  int v9 = &v12;
  uint64_t v10 = &v4;
  uint64_t v2 = ACMKernelControl(18);
  if (v2)
  {
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v2 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
    if (!v2) {
      *a1 = v4;
    }
  }
  return v2;
}

void sub_10002672C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026744(_DWORD *a1)
{
  if (!a1) {
    return 4294967293;
  }
  int v4 = 0;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  int v15 = -5;
  int v11 = 4;
  uint64_t v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  os_log_type_t v7 = sub_1000268BC;
  uint64_t v8 = &unk_10003DAD8;
  int v9 = &v12;
  uint64_t v10 = &v4;
  uint64_t v2 = ACMKernelControl(18);
  if (v2)
  {
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v2 = *((unsigned int *)v13 + 6);
    _Block_object_dispose(&v12, 8);
    if (!v2) {
      *a1 = v4;
    }
  }
  return v2;
}

void sub_10002683C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

_DWORD *initializeBufferWithCopyOfBuffer for LockdownModeACM.TRM.ACMError(_DWORD *result, _DWORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LockdownModeACM.TRM.ACMError(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 4)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for LockdownModeACM.TRM.ACMError(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_DWORD *)unint64_t result = a2 - 1;
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
  *(unsigned char *)(result + 4) = v3;
  return result;
}

ValueMetadata *type metadata accessor for LockdownModeACM.TRM.ACMError()
{
  return &type metadata for LockdownModeACM.TRM.ACMError;
}

uint64_t sub_1000268BC(uint64_t result, _DWORD *a2, uint64_t a3)
{
  int v3 = -5;
  if (a2 && a3 == 4)
  {
    int v3 = 0;
    **(_DWORD **)(result + 40) = *a2;
  }
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = v3;
  return result;
}

uint64_t sub_1000268EC(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000B14C(a1, &qword_1000423A0);
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

uint64_t sub_100026A98(unsigned __int8 a1, char a2)
{
  unint64_t v2 = 0xEB0000000056546FLL;
  unint64_t v3 = 0x5479616C50726941;
  uint64_t v4 = a1;
  unint64_t v5 = 0x5479616C50726941;
  unint64_t v6 = 0xEB0000000056546FLL;
  switch(v4)
  {
    case 1:
      unint64_t v5 = 0x766572506B6E694CLL;
      unint64_t v6 = 0xEC00000073776569;
      break;
    case 2:
      unint64_t v6 = 0xE300000000000000;
      unint64_t v5 = 5067348;
      break;
    case 3:
      unint64_t v5 = 0x6C41646572616853;
      unint64_t v6 = 0xEC000000736D7562;
      break;
    case 4:
      unint64_t v5 = 0x5279616C50726941;
      unint64_t v6 = 0xEF72657669656365;
      break;
    case 5:
      unint64_t v6 = 0x8000000100033890;
      unint64_t v5 = 0xD000000000000011;
      break;
    case 6:
      unint64_t v5 = 0xD000000000000017;
      unint64_t v6 = 0x80000001000338B0;
      break;
    case 7:
      unint64_t v5 = 0x65706F6C65766544;
      unint64_t v6 = 0xED000065646F4D72;
      break;
    default:
      break;
  }
  switch(a2)
  {
    case 1:
      uint64_t v7 = 0x766572506B6E694CLL;
      uint64_t v8 = 1937204585;
      goto LABEL_14;
    case 2:
      unint64_t v2 = 0xE300000000000000;
      if (v5 != 5067348) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 3:
      uint64_t v7 = 0x6C41646572616853;
      uint64_t v8 = 1936553314;
LABEL_14:
      unint64_t v2 = v8 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
      if (v5 != v7) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 4:
      unint64_t v2 = 0xEF72657669656365;
      if (v5 != 0x5279616C50726941) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 5:
      unint64_t v2 = 0x8000000100033890;
      if (v5 != 0xD000000000000011) {
        goto LABEL_25;
      }
      goto LABEL_22;
    case 6:
      unint64_t v3 = 0xD000000000000017;
      unint64_t v2 = 0x80000001000338B0;
      goto LABEL_21;
    case 7:
      unint64_t v2 = 0xED000065646F4D72;
      if (v5 != 0x65706F6C65766544) {
        goto LABEL_25;
      }
      goto LABEL_22;
    default:
LABEL_21:
      if (v5 != v3) {
        goto LABEL_25;
      }
LABEL_22:
      if (v6 == v2) {
        char v9 = 1;
      }
      else {
LABEL_25:
      }
        char v9 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v9 & 1;
  }
}

uint64_t sub_100026D80()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100026EEC()
{
  return Hasher._finalize()();
}

uint64_t *RestrictionsManager.shared.unsafeMutableAddressor()
{
  if (qword_100041D90 != -1) {
    swift_once();
  }
  return &static RestrictionsManager.shared;
}

uint64_t sub_1000270B8()
{
  uint64_t result = sub_10002C8D8();
  static RestrictionsManager.shared = result;
  return result;
}

uint64_t static RestrictionsManager.shared.getter()
{
  if (qword_100041D90 != -1) {
    swift_once();
  }

  return swift_retain();
}

_UNKNOWN **static RestrictionsManager.RestrictionKey.allCases.getter()
{
  return &off_10003D100;
}

unint64_t RestrictionsManager.RestrictionKey.rawValue.getter(char a1)
{
  unint64_t result = 0x5479616C50726941;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x766572506B6E694CLL;
      break;
    case 2:
      unint64_t result = 5067348;
      break;
    case 3:
      unint64_t result = 0x6C41646572616853;
      break;
    case 4:
      unint64_t result = 0x5279616C50726941;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
      unint64_t result = 0xD000000000000017;
      break;
    case 7:
      unint64_t result = 0x65706F6C65766544;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100027278(unsigned __int8 *a1, char *a2)
{
  return sub_100026A98(*a1, *a2);
}

Swift::Int sub_100027284()
{
  return sub_100026EEC();
}

uint64_t sub_100027290()
{
  return sub_100026D80();
}

Swift::Int sub_100027298()
{
  return sub_100026EEC();
}

unint64_t sub_1000272A0@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = _s13lockdownmoded19RestrictionsManagerC14RestrictionKeyO8rawValueAESgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

unint64_t sub_1000272D0@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = RestrictionsManager.RestrictionKey.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_1000272FC(void *a1@<X8>)
{
  *a1 = &off_10003D100;
}

uint64_t sub_10002730C(uint64_t a1)
{
  uint64_t v2 = v1;
  *(void *)(v2 + 16) = 0;
  *(void *)(v2 + 24) = sub_1000049A8((uint64_t)&_swiftEmptyArrayStorage);
  unint64_t v4 = (uint64_t *)(v2 + 24);
  *(unsigned char *)(v2 + 32) = 0;
  unint64_t v5 = sub_100004AAC((uint64_t)&_swiftEmptyArrayStorage);
  if (!a1) {
    goto LABEL_17;
  }
  if (*(void *)(a1 + 16)
    && (unint64_t v6 = sub_10001B688(0x7463697274736552, 0xEC000000736E6F69), (v7 & 1) != 0)
    && (sub_100020BCC(*(void *)(a1 + 56) + 32 * v6, (uint64_t)&v53),
        sub_100005E0C(&qword_100042A70),
        (swift_dynamicCast() & 1) != 0))
  {
    swift_bridgeObjectRelease();
    unint64_t v5 = v44;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_10;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v5 = 0;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_10;
    }
  }
  unint64_t v8 = sub_10001B688(0x6E6F6973726556, 0xE700000000000000);
  if (v9)
  {
    sub_100020BCC(*(void *)(a1 + 56) + 32 * v8, (uint64_t)&v53);
    goto LABEL_11;
  }
LABEL_10:
  long long v53 = 0u;
  long long v54 = 0u;
LABEL_11:
  swift_bridgeObjectRelease();
  if (*((void *)&v54 + 1))
  {
    if (swift_dynamicCast())
    {
      unint64_t v10 = v44;
      goto LABEL_16;
    }
  }
  else
  {
    sub_10000B14C((uint64_t)&v53, &qword_1000425E0);
  }
  unint64_t v10 = 0;
LABEL_16:
  *(void *)(v2 + 16) = v10;
  *(unsigned char *)(v2 + 32) = 1;
  if (!v5)
  {
LABEL_20:
    uint64_t v12 = 0;
    goto LABEL_21;
  }
LABEL_17:
  if (!*(void *)(v5 + 16)) {
    goto LABEL_20;
  }
  sub_10001B688(0x5479616C50726941, 0xEB0000000056546FLL);
  if ((v11 & 1) == 0) {
    goto LABEL_20;
  }
  uint64_t v12 = swift_bridgeObjectRetain();
LABEL_21:
  *((void *)&v54 + 1) = &type metadata for Int;
  *(void *)&long long v53 = 0;
  uint64_t v13 = sub_10002F374(v12, (uint64_t)&v53, (uint64_t)sub_100027C8C, 0, (uint64_t)sub_100027CC4, 0, 0x5479616C50726941, 0xEB0000000056546FLL, 1);
  swift_beginAccess();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v45 = *v4;
  *unint64_t v4 = 0x8000000000000000;
  sub_10001B888(v13, 0, isUniquelyReferenced_nonNull_native);
  *unint64_t v4 = v45;
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (v5 && *(void *)(v5 + 16) && (sub_10001B688(0x766572506B6E694CLL, 0xEC00000073776569), (v15 & 1) != 0)) {
    uint64_t v16 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v16 = 0;
  }
  *((void *)&v54 + 1) = &type metadata for Bool;
  LOBYTE(v53) = 0;
  uint64_t v17 = sub_10002F374(v16, (uint64_t)&v53, (uint64_t)sub_100027CDC, 0, (uint64_t)sub_100027D58, 0, 0x766572506B6E694CLL, 0xEC00000073776569, 1);
  swift_beginAccess();
  char v18 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v46 = *v4;
  *unint64_t v4 = 0x8000000000000000;
  sub_10001B888(v17, 1u, v18);
  *unint64_t v4 = v46;
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (v5 && *(void *)(v5 + 16) && (sub_10001B688(5067348, 0xE300000000000000), (v19 & 1) != 0)) {
    uint64_t v20 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v20 = 0;
  }
  *((void *)&v54 + 1) = &type metadata for Bool;
  LOBYTE(v53) = 1;
  uint64_t v21 = sub_10002F374(v20, (uint64_t)&v53, (uint64_t)sub_100027DFC, 0, (uint64_t)sub_100027E34, 0, 0, 0, 0);
  swift_beginAccess();
  char v22 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v47 = *v4;
  *unint64_t v4 = 0x8000000000000000;
  sub_10001B888(v21, 2u, v22);
  *unint64_t v4 = v47;
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (v5 && *(void *)(v5 + 16) && (sub_10001B688(0x6C41646572616853, 0xEC000000736D7562), (v23 & 1) != 0)) {
    uint64_t v24 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v24 = 0;
  }
  *((void *)&v54 + 1) = &type metadata for Bool;
  LOBYTE(v53) = 0;
  uint64_t v25 = sub_10002F374(v24, (uint64_t)&v53, (uint64_t)sub_100027E8C, 0, (uint64_t)sub_100027F34, 0, 0, 0, 1);
  swift_beginAccess();
  char v26 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v48 = *v4;
  *unint64_t v4 = 0x8000000000000000;
  sub_10001B888(v25, 3u, v26);
  *unint64_t v4 = v48;
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (v5 && *(void *)(v5 + 16) && (sub_10001B688(0x5279616C50726941, 0xEF72657669656365), (v27 & 1) != 0)) {
    uint64_t v28 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v28 = 0;
  }
  *((void *)&v54 + 1) = &type metadata for Bool;
  LOBYTE(v53) = 0;
  uint64_t v29 = sub_10002F374(v28, (uint64_t)&v53, (uint64_t)sub_1000280D0, 0, (uint64_t)sub_100028170, 0, 0x5279616C50726941, 0xEF72657669656365, 1);
  swift_beginAccess();
  char v30 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v49 = *v4;
  *unint64_t v4 = 0x8000000000000000;
  sub_10001B888(v29, 4u, v30);
  *unint64_t v4 = v49;
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (v5 && *(void *)(v5 + 16) && (sub_10001B688(0xD000000000000011, 0x8000000100033890), (v31 & 1) != 0)) {
    uint64_t v32 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v32 = 0;
  }
  *((void *)&v54 + 1) = &type metadata for Bool;
  LOBYTE(v53) = 1;
  uint64_t v33 = sub_10002F374(v32, (uint64_t)&v53, (uint64_t)sub_10002823C, 0, (uint64_t)sub_1000282F0, 0, 0, 0, 0);
  swift_beginAccess();
  char v34 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v50 = *v4;
  *unint64_t v4 = 0x8000000000000000;
  sub_10001B888(v33, 5u, v34);
  *unint64_t v4 = v50;
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (v5 && *(void *)(v5 + 16) && (sub_10001B688(0xD000000000000017, 0x80000001000338B0), (v35 & 1) != 0)) {
    uint64_t v36 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v36 = 0;
  }
  *((void *)&v54 + 1) = &type metadata for Int;
  *(void *)&long long v53 = 0;
  uint64_t v37 = sub_10002F374(v36, (uint64_t)&v53, (uint64_t)sub_1000283D8, 0, (uint64_t)sub_100028410, 0, 0xD000000000000017, 0x80000001000338B0, 1);
  swift_beginAccess();
  char v38 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v51 = *v4;
  *unint64_t v4 = 0x8000000000000000;
  sub_10001B888(v37, 6u, v38);
  *unint64_t v4 = v51;
  swift_bridgeObjectRelease();
  swift_endAccess();
  if (v5 && *(void *)(v5 + 16) && (sub_10001B688(0x65706F6C65766544, 0xED000065646F4D72), (v39 & 1) != 0)) {
    uint64_t v40 = swift_bridgeObjectRetain();
  }
  else {
    uint64_t v40 = 0;
  }
  *((void *)&v54 + 1) = &type metadata for Bool;
  LOBYTE(v53) = 0;
  uint64_t v41 = sub_10002F374(v40, (uint64_t)&v53, (uint64_t)sub_10002849C, 0, (uint64_t)sub_1000284D0, 0, 0, 0, 0);
  swift_beginAccess();
  char v42 = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v52 = *(void *)(v2 + 24);
  *(void *)(v2 + 24) = 0x8000000000000000;
  sub_10001B888(v41, 7u, v42);
  *(void *)(v2 + 24) = v52;
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_100027C8C@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_10002E7AC();
  a1[3] = &type metadata for Int;
  *a1 = result;
  return result;
}

uint64_t sub_100027CC4(uint64_t a1)
{
  return sub_100028428(a1, (uint64_t (*)(uint64_t))sub_10002E89C);
}

void sub_100027CDC(uint64_t a1@<X8>)
{
  uint64_t v2 = (__CFString *)String._bridgeToObjectiveC()();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v2, kCFPreferencesAnyApplication, 0);

  *(void *)(a1 + 24) = &type metadata for Bool;
  *(unsigned char *)a1 = AppBooleanValue != 0;
}

void sub_100027D58(uint64_t a1)
{
  sub_100020BCC(a1, (uint64_t)v3);
  swift_dynamicCast();
  uint64_t v1 = (__CFString *)String._bridgeToObjectiveC()();
  Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  CFPreferencesSetAppValue(v1, isa, kCFPreferencesAnyApplication);
}

BOOL sub_100027DFC@<W0>(uint64_t a1@<X8>)
{
  BOOL result = sub_100025ADC();
  *(void *)(a1 + 24) = &type metadata for Bool;
  *(unsigned char *)a1 = result;
  return result;
}

uint64_t sub_100027E34(uint64_t a1)
{
  sub_100020BCC(a1, (uint64_t)v4);
  char v1 = swift_dynamicCast();
  return sub_100025D28(v3 & 1u | ((v1 & 1) == 0));
}

void sub_100027E8C(uint64_t a1@<X8>)
{
  id v2 = objc_msgSend(self, "pl_sharedAccountStore");
  id v3 = [v2 cachedPrimaryAppleAccount];
  if (v3)
  {
    id v4 = v3;
    unsigned __int8 v5 = [v3 isEnabledForDataclass:ACAccountDataclassSharedStreams];

    id v2 = v4;
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  *(void *)(a1 + 24) = &type metadata for Bool;
  *(unsigned char *)a1 = v5;
}

void sub_100027F34(uint64_t a1)
{
  uint64_t v2 = sub_100005E0C(&qword_1000423A0);
  __chkstk_darwin(v2 - 8);
  id v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100020BCC(a1, (uint64_t)v13);
  int v5 = swift_dynamicCast();
  unsigned int v6 = v12[15];
  id v7 = objc_msgSend(self, "pl_sharedAccountStore");
  id v8 = [v7 cachedPrimaryAppleAccount];
  if (v8)
  {
    id v9 = v8;
    [v8 setEnabled:v5 & v6 forDataclass:ACAccountDataclassSharedStreams];
    uint64_t v10 = type metadata accessor for TaskPriority();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v4, 1, 1, v10);
    char v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v7;
    v11[5] = v9;
    sub_1000268EC((uint64_t)v4, (uint64_t)&unk_100042A88, (uint64_t)v11);
    swift_release();
  }
  else
  {
  }
}

void sub_1000280D0(uint64_t a1@<X8>)
{
  uint64_t v2 = (__CFString *)String._bridgeToObjectiveC()();
  uint64_t v3 = (__CFString *)String._bridgeToObjectiveC()();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v2, v3, 0);

  *(void *)(a1 + 24) = &type metadata for Bool;
  *(unsigned char *)a1 = AppBooleanValue != 0;
}

void sub_100028170(uint64_t a1)
{
  sub_100020BCC(a1, (uint64_t)v4);
  swift_dynamicCast();
  char v1 = (__CFString *)String._bridgeToObjectiveC()();
  Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  uint64_t v3 = (__CFString *)String._bridgeToObjectiveC()();
  CFPreferencesSetAppValue(v1, isa, v3);
}

uint64_t sub_10002823C@<X0>(uint64_t a1@<X8>)
{
  if (qword_100041D78 != -1) {
    swift_once();
  }
  CFStringRef v2 = (const __CFString *)qword_100042208;
  if (qword_100041D70 != -1) {
    swift_once();
  }
  uint64_t result = CFPreferencesGetAppBooleanValue(v2, (CFStringRef)qword_100042200, 0);
  *(void *)(a1 + 24) = &type metadata for Bool;
  *(unsigned char *)a1 = result != 0;
  return result;
}

void sub_1000282F0(uint64_t a1)
{
  sub_100020BCC(a1, (uint64_t)v3);
  swift_dynamicCast();
  if (qword_100041D78 != -1) {
    swift_once();
  }
  CFStringRef v1 = (const __CFString *)qword_100042208;
  v2.super.super.Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  if (qword_100041D70 != -1) {
    swift_once();
  }
  CFPreferencesSetAppValue(v1, v2.super.super.isa, (CFStringRef)qword_100042200);
}

void sub_1000283D8(void *a1@<X8>)
{
  sub_100006E54();
  a1[3] = &type metadata for Int;
  *a1 = v2;
}

uint64_t sub_100028410(uint64_t a1)
{
  return sub_100028428(a1, (uint64_t (*)(uint64_t))sub_100007008);
}

uint64_t sub_100028428(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  sub_100020BCC(a1, (uint64_t)v6);
  swift_dynamicCast();
  if (v5 == 2) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = v5 == 1;
  }
  return a2(v3);
}

uint64_t sub_10002849C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = AMFIIsDeveloperModeEnabled();
  *(void *)(a1 + 24) = &type metadata for Bool;
  *(unsigned char *)a1 = result;
  return result;
}

void sub_1000284D0(uint64_t a1)
{
  sub_100020BCC(a1, (uint64_t)v4);
  if (!swift_dynamicCast() || (v3 & 1) == 0)
  {
    sub_100020BCC(a1, (uint64_t)v4);
    char v2 = swift_dynamicCast();
    sub_10000B4E0(v2 & v3);
  }
}

uint64_t sub_100028564(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v74 = (char *)&v72 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v87 = (char *)&v72 - v10;
  __chkstk_darwin(v9);
  char v86 = (char *)&v72 - v11;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  uint64_t v12 = swift_bridgeObjectRetain();
  uint64_t v13 = (char *)sub_10002D138(v12, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  os_log_type_t v93 = v13;
  uint64_t v85 = v6;
  uint64_t v73 = (uint64_t *)(v2 + 24);
  if (a1)
  {
    uint64_t v72 = 0;
  }
  else
  {
    uint64_t v14 = swift_retain();
    char v15 = (char *)sub_10002BD50(v14);
    uint64_t v72 = 0;
    swift_release_n();
    os_log_type_t v93 = v15;
    uint64_t v13 = v15;
  }
  static Logger.daemonLogger.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  BOOL v18 = os_log_type_enabled(v16, v17);
  char v19 = &unk_100033000;
  uint64_t v82 = v5;
  unsigned int v81 = a1;
  if (v18)
  {
    uint64_t v20 = swift_slowAlloc();
    *(void *)&long long v92 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315394;
    if (a1) {
      uint64_t v21 = 0x7463697274736572;
    }
    else {
      uint64_t v21 = 0x6972747365726E75;
    }
    if (a1) {
      unint64_t v22 = 0xE800000000000000;
    }
    else {
      unint64_t v22 = 0xEA00000000007463;
    }
    *(void *)&long long v90 = sub_10001AE5C(v21, v22, (uint64_t *)&v92);
    a1 = v81;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v20 + 12) = 2048;
    uint64_t v23 = *((void *)v13 + 2);
    swift_bridgeObjectRelease();
    *(void *)&long long v90 = v23;
    char v19 = (void *)&unk_100033000;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Will %s %ld restrictions…", (uint8_t *)v20, 0x16u);
    swift_arrayDestroy();
    uint64_t v5 = v82;
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v85 = *(void *)(v85 + 8);
    ((void (*)(char *, uint64_t))v85)(v86, v5);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    uint64_t v85 = *(void *)(v85 + 8);
    ((void (*)(char *, uint64_t))v85)(v86, v5);
  }
  swift_beginAccess();
  int64_t v25 = 0;
  uint64_t v26 = *((void *)v93 + 8);
  char v83 = v93 + 64;
  char v86 = v93;
  uint64_t v27 = 1 << v93[32];
  uint64_t v28 = -1;
  if (v27 < 64) {
    uint64_t v28 = ~(-1 << v27);
  }
  unint64_t v29 = v28 & v26;
  int64_t v84 = (unint64_t)(v27 + 63) >> 6;
  uint64_t v30 = 0x6972747365726E55;
  if (a1) {
    uint64_t v30 = 0x7463697274736552;
  }
  uint64_t v79 = v30;
  unint64_t v31 = 0xED0000676E697463;
  if (a1) {
    unint64_t v31 = 0xEB00000000676E69;
  }
  unint64_t v80 = v31;
  *(void *)&long long v24 = v19[106];
  long long v78 = v24;
  int v77 = (char *)&type metadata for Any + 8;
  unint64_t v76 = (unint64_t)"redAlbums";
  unint64_t v75 = (unint64_t)"AirDropAutoAccept";
  while (1)
  {
    if (v29)
    {
      uint64_t v33 = v5;
      uint64_t v34 = a1;
      unint64_t v35 = __clz(__rbit64(v29));
      v29 &= v29 - 1;
      unint64_t v36 = v35 | (v25 << 6);
      goto LABEL_36;
    }
    BOOL v37 = __OFADD__(v25++, 1);
    if (v37) {
      goto LABEL_92;
    }
    if (v25 >= v84)
    {
LABEL_57:
      uint64_t v48 = v74;
      uint64_t v49 = v73;
      goto LABEL_58;
    }
    unint64_t v38 = *(void *)&v83[8 * v25];
    if (!v38) {
      break;
    }
    uint64_t v34 = a1;
LABEL_35:
    uint64_t v33 = v5;
    unint64_t v29 = (v38 - 1) & v38;
    unint64_t v36 = __clz(__rbit64(v38)) + (v25 << 6);
LABEL_36:
    uint64_t v40 = *(unsigned __int8 *)(*((void *)v86 + 6) + v36);
    uint64_t v41 = *(void *)(*((void *)v86 + 7) + 8 * v36);
    swift_retain();
    char v42 = v87;
    static Logger.daemonLogger.getter();
    long long v43 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = swift_slowAlloc();
      *(void *)&long long v92 = swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = v78;
      *(void *)(v45 + 4) = sub_10001AE5C(v79, v80, (uint64_t *)&v92);
      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 12) = 2080;
      unint64_t v46 = 0xEB0000000056546FLL;
      uint64_t v47 = 0x5479616C50726941;
      switch(v40)
      {
        case 1:
          unint64_t v46 = 0xEC00000073776569;
          uint64_t v47 = 0x766572506B6E694CLL;
          break;
        case 2:
          unint64_t v46 = 0xE300000000000000;
          uint64_t v47 = 5067348;
          break;
        case 3:
          unint64_t v46 = 0xEC000000736D7562;
          uint64_t v47 = 0x6C41646572616853;
          break;
        case 4:
          unint64_t v46 = 0xEF72657669656365;
          uint64_t v47 = 0x5279616C50726941;
          break;
        case 5:
          unint64_t v46 = v76 | 0x8000000000000000;
          uint64_t v47 = 0xD000000000000011;
          break;
        case 6:
          uint64_t v47 = 0xD000000000000017;
          unint64_t v46 = v75 | 0x8000000000000000;
          break;
        case 7:
          unint64_t v46 = 0xED000065646F4D72;
          uint64_t v47 = 0x65706F6C65766544;
          break;
        default:
          break;
      }
      *(void *)(v45 + 14) = sub_10001AE5C(v47, v46, (uint64_t *)&v92);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "%s %s…", (uint8_t *)v45, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v5 = v82;
      ((void (*)(char *, uint64_t))v85)(v87, v82);
      a1 = v81;
      if (v81)
      {
LABEL_20:
        swift_beginAccess();
        sub_10000C338(v41 + 48, (uint64_t)&v90);
        if (!v91) {
          goto LABEL_95;
        }
LABEL_21:
        sub_100005F18(&v90, &v92);
        goto LABEL_22;
      }
    }
    else
    {

      uint64_t v5 = v33;
      ((void (*)(char *, uint64_t))v85)(v42, v33);
      a1 = v34;
      if (v34) {
        goto LABEL_20;
      }
    }
    swift_beginAccess();
    sub_10000C338(v41 + 80, (uint64_t)&v90);
    if (v91) {
      goto LABEL_21;
    }
    swift_beginAccess();
    sub_10000C338(v41 + 48, (uint64_t)&v88);
    if (!v89) {
      goto LABEL_96;
    }
    sub_100005F18(&v88, &v92);
    sub_10000B14C((uint64_t)&v90, &qword_1000425E0);
LABEL_22:
    uint64_t v32 = *(void (**)(long long *))(v41 + 32);
    swift_retain();
    v32(&v92);
    swift_release();
    sub_10000B304((uint64_t)&v92);
    *(unsigned char *)(v41 + 112) = 0;
    swift_release();
  }
  int64_t v39 = v25 + 1;
  if (v25 + 1 >= v84) {
    goto LABEL_57;
  }
  unint64_t v38 = *(void *)&v83[8 * v39];
  if (v38) {
    goto LABEL_33;
  }
  int64_t v39 = v25 + 2;
  if (v25 + 2 >= v84) {
    goto LABEL_57;
  }
  unint64_t v38 = *(void *)&v83[8 * v39];
  if (v38)
  {
LABEL_33:
    uint64_t v34 = a1;
LABEL_34:
    int64_t v25 = v39;
    goto LABEL_35;
  }
  int64_t v39 = v25 + 3;
  if (v25 + 3 >= v84) {
    goto LABEL_57;
  }
  uint64_t v34 = a1;
  unint64_t v38 = *(void *)&v83[8 * v39];
  if (v38) {
    goto LABEL_34;
  }
  while (1)
  {
    int64_t v25 = v39 + 1;
    if (__OFADD__(v39, 1)) {
      goto LABEL_93;
    }
    if (v25 >= v84) {
      break;
    }
    unint64_t v38 = *(void *)&v83[8 * v25];
    ++v39;
    if (v38) {
      goto LABEL_35;
    }
  }
  uint64_t v48 = v74;
  uint64_t v49 = v73;
LABEL_58:
  swift_release();
  int64_t v50 = 0;
  uint64_t v51 = *v49;
  uint64_t v52 = *v49 + 64;
  uint64_t v53 = 1 << *(unsigned char *)(*v49 + 32);
  uint64_t v54 = -1;
  if (v53 < 64) {
    uint64_t v54 = ~(-1 << v53);
  }
  unint64_t v55 = v54 & *(void *)(*v49 + 64);
  int64_t v56 = (unint64_t)(v53 + 63) >> 6;
  while (2)
  {
    if (v55)
    {
      unint64_t v57 = __clz(__rbit64(v55));
      v55 &= v55 - 1;
      unint64_t v58 = v57 | (v50 << 6);
      goto LABEL_62;
    }
    BOOL v37 = __OFADD__(v50++, 1);
    if (v37)
    {
      __break(1u);
LABEL_92:
      __break(1u);
LABEL_93:
      __break(1u);
      goto LABEL_94;
    }
    if (v50 >= v56) {
      break;
    }
    unint64_t v59 = *(void *)(v52 + 8 * v50);
    if (v59) {
      goto LABEL_76;
    }
    int64_t v60 = v50 + 1;
    if (v50 + 1 >= v56) {
      break;
    }
    unint64_t v59 = *(void *)(v52 + 8 * v60);
    if (v59) {
      goto LABEL_75;
    }
    int64_t v60 = v50 + 2;
    if (v50 + 2 >= v56) {
      break;
    }
    unint64_t v59 = *(void *)(v52 + 8 * v60);
    if (v59) {
      goto LABEL_75;
    }
    int64_t v60 = v50 + 3;
    if (v50 + 3 >= v56) {
      break;
    }
    unint64_t v59 = *(void *)(v52 + 8 * v60);
    if (v59) {
      goto LABEL_75;
    }
    int64_t v60 = v50 + 4;
    if (v50 + 4 < v56)
    {
      unint64_t v59 = *(void *)(v52 + 8 * v60);
      if (!v59)
      {
        while (1)
        {
          int64_t v50 = v60 + 1;
          if (__OFADD__(v60, 1)) {
            break;
          }
          if (v50 >= v56) {
            goto LABEL_81;
          }
          unint64_t v59 = *(void *)(v52 + 8 * v50);
          ++v60;
          if (v59) {
            goto LABEL_76;
          }
        }
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
LABEL_96:
        __break(1u);
        JUMPOUT(0x1000291E4);
      }
LABEL_75:
      int64_t v50 = v60;
LABEL_76:
      unint64_t v61 = __clz(__rbit64(v59));
      unint64_t v55 = (v59 - 1) & v59;
      unint64_t v58 = v61 + (v50 << 6);
LABEL_62:
      *(unsigned char *)(*(void *)(*(void *)(v51 + 56) + 8 * v58) + 112) = 0;
      continue;
    }
    break;
  }
LABEL_81:
  id v62 = [self sharedConnection];
  if (v62)
  {
    uint64_t v63 = v62;
    [v62 setBoolValue:a1 & 1 forSetting:MCFeatureLockdownModeAllowed];
  }
  static Logger.daemonLogger.getter();
  os_log_type_t v64 = Logger.logObject.getter();
  os_log_type_t v65 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v66 = v5;
    char v67 = a1;
    Swift::String v68 = v48;
    uint64_t v69 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v92 = swift_slowAlloc();
    *(_DWORD *)uint64_t v69 = 136315138;
    if (v67) {
      uint64_t v70 = 0x7463697274736572;
    }
    else {
      uint64_t v70 = 0x6972747365726E75;
    }
    *(void *)&long long v90 = sub_10001AE5C(v70, v80, (uint64_t *)&v92);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v64, v65, "Finished %s restrictions…", v69, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return ((uint64_t (*)(char *, uint64_t))v85)(v68, v66);
  }
  else
  {

    return ((uint64_t (*)(char *, uint64_t))v85)(v48, v5);
  }
}

id sub_100029204()
{
  void (*v19)(_OWORD *__return_ptr, uint64_t);
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSDictionary v24;
  unsigned int (*v25)(char *, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t);
  NSURL *v27;
  void *v28;
  void *v29;
  unsigned __int8 v30;
  id result;
  void *v32;
  char *v33;
  uint64_t v34;
  unsigned char v35[32];
  _OWORD v36[2];
  _OWORD v37[2];

  char v3 = v1;
  uint64_t v4 = sub_100005E0C((uint64_t *)&unk_1000423F8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v33 - v8;
  char v10 = *(unsigned char *)(v0 + 32);
  uint64_t v34 = v0;
  if ((v10 & 1) == 0)
  {
    uint64_t v33 = v7;
    swift_beginAccess();
    uint64_t v11 = *(void *)(v0 + 24);
    uint64_t v12 = v11 + 64;
    uint64_t v13 = 1 << *(unsigned char *)(v11 + 32);
    uint64_t v14 = -1;
    if (v13 < 64) {
      uint64_t v14 = ~(-1 << v13);
    }
    unint64_t v15 = v14 & *(void *)(v11 + 64);
    uint64_t v7 = (char *)((unint64_t)(v13 + 63) >> 6);
    swift_bridgeObjectRetain();
    uint64_t v16 = 0;
    while (1)
    {
      if (v15)
      {
        unint64_t v17 = __clz(__rbit64(v15));
        v15 &= v15 - 1;
        unint64_t v18 = v17 | (v16 << 6);
      }
      else
      {
        uint64_t v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
          __break(1u);
          goto LABEL_31;
        }
        if (v21 >= (uint64_t)v7) {
          goto LABEL_24;
        }
        unint64_t v22 = *(void *)(v12 + 8 * v21);
        ++v16;
        if (!v22)
        {
          uint64_t v16 = v21 + 1;
          if (v21 + 1 >= (uint64_t)v7) {
            goto LABEL_24;
          }
          unint64_t v22 = *(void *)(v12 + 8 * v16);
          if (!v22)
          {
            uint64_t v16 = v21 + 2;
            if (v21 + 2 >= (uint64_t)v7) {
              goto LABEL_24;
            }
            unint64_t v22 = *(void *)(v12 + 8 * v16);
            if (!v22)
            {
              uint64_t v16 = v21 + 3;
              if (v21 + 3 >= (uint64_t)v7) {
                goto LABEL_24;
              }
              unint64_t v22 = *(void *)(v12 + 8 * v16);
              if (!v22)
              {
                uint64_t v23 = v21 + 4;
                if (v23 >= (uint64_t)v7)
                {
LABEL_24:
                  swift_release();
                  uint64_t v7 = v33;
                  break;
                }
                unint64_t v22 = *(void *)(v12 + 8 * v23);
                if (!v22)
                {
                  while (1)
                  {
                    uint64_t v16 = v23 + 1;
                    if (__OFADD__(v23, 1)) {
                      break;
                    }
                    if (v16 >= (uint64_t)v7) {
                      goto LABEL_24;
                    }
                    unint64_t v22 = *(void *)(v12 + 8 * v16);
                    ++v23;
                    if (v22) {
                      goto LABEL_23;
                    }
                  }
LABEL_31:
                  __break(1u);
LABEL_32:
                  sub_10000B14C((uint64_t)v7, (uint64_t *)&unk_1000423F8);
                  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v9, 1, 1, v2);
                  goto LABEL_33;
                }
                uint64_t v16 = v23;
              }
            }
          }
        }
LABEL_23:
        unint64_t v15 = (v22 - 1) & v22;
        unint64_t v18 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      uint64_t v2 = *(void *)(*(void *)(v11 + 56) + 8 * v18);
      char v19 = *(void (**)(_OWORD *__return_ptr, uint64_t))(v2 + 16);
      swift_retain();
      uint64_t v20 = swift_retain();
      v19(v37, v20);
      swift_release();
      sub_100005F18(v37, v36);
      sub_10002D5CC((uint64_t)v36, (uint64_t)v35);
      swift_beginAccess();
      sub_10002D634((uint64_t)v35, v2 + 80);
      swift_endAccess();
      *(unsigned char *)(v2 + 112) = 0;
      swift_release();
    }
  }
  uint64_t v33 = v3;
  sub_100029DEC();
  v24.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  sub_10002D894(v7);
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v16 = *(void *)(v2 - 8);
  int64_t v25 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
  if (v25(v7, 1, v2) == 1) {
    goto LABEL_32;
  }
  URL.appendingPathComponent(_:)();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v16 + 8);
  v26(v7, v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v9, 0, 1, v2);
  if (v25(v9, 1, v2) == 1) {
LABEL_33:
  }
    __break(1u);
  URL._bridgeToObjectiveC()(v27);
  unint64_t v29 = v28;
  v26(v9, v2);
  *(void *)&v37[0] = 0;
  uint64_t v30 = [(objc_class *)v24.super.isa writeToURL:v29 error:v37];

  uint64_t result = *(id *)&v37[0];
  if (v30)
  {
    *(unsigned char *)(v34 + 32) = 1;
  }
  else
  {
    uint64_t v32 = result;
    _convertNSErrorToError(_:)();

    return (id)swift_willThrow();
  }
  return result;
}

id sub_100029674()
{
  uint64_t v0 = sub_100005E0C((uint64_t *)&unk_1000423F8);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  char v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v17 - v4;
  id v6 = [self defaultManager];
  sub_10002D894(v3);
  uint64_t v7 = type metadata accessor for URL();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  if (v9(v3, 1, v7) == 1)
  {
    sub_10000B14C((uint64_t)v3, (uint64_t *)&unk_1000423F8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v5, 1, 1, v7);
LABEL_8:
    __break(1u);
  }
  URL.appendingPathComponent(_:)();
  char v10 = *(void (**)(char *, uint64_t))(v8 + 8);
  v10(v3, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  if (v9(v5, 1, v7) == 1) {
    goto LABEL_8;
  }
  URL._bridgeToObjectiveC()(v11);
  uint64_t v13 = v12;
  v10(v5, v7);
  id v18 = 0;
  unsigned __int8 v14 = [v6 removeItemAtURL:v13 error:&v18];

  id result = v18;
  if (v14)
  {
    *(unsigned char *)(v17 + 32) = 0;
  }
  else
  {
    uint64_t v16 = result;
    _convertNSErrorToError(_:)();

    return (id)swift_willThrow();
  }
  return result;
}

id sub_10002990C()
{
  uint64_t v41 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  char v42 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t v35 = v0;
  uint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_10002C168(v4);
  uint64_t v38 = v1;
  swift_bridgeObjectRelease();
  char v7 = 0;
  int64_t v8 = 0;
  uint64_t v9 = v5 + 64;
  uint64_t v10 = 1 << v5[32];
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *((void *)v5 + 8);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v40 = (void (**)(char *, uint64_t))(v2 + 8);
  *(void *)&long long v6 = 136315138;
  long long v37 = v6;
  unint64_t v36 = (char *)&type metadata for Any + 8;
  unint64_t v31 = (unint64_t)"AirDropAutoAccept";
  unint64_t v32 = (unint64_t)"redAlbums";
  int64_t v39 = v13;
  while (v12)
  {
    unint64_t v14 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    unint64_t v15 = v14 | (v8 << 6);
LABEL_5:
    uint64_t v16 = *(unsigned __int8 *)(*((void *)v5 + 6) + v15);
    uint64_t v17 = *(void *)(*((void *)v5 + 7) + 8 * v15);
    swift_retain();
    if (sub_10002EFA8())
    {
      *(unsigned char *)(v17 + 112) = 1;
      uint64_t v21 = v42;
      static Logger.daemonLogger.getter();
      unint64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v22, v23))
      {
        os_log_t v33 = v22;
        long long v24 = (_DWORD *)swift_slowAlloc();
        uint64_t v43 = swift_slowAlloc();
        uint64_t v34 = v24;
        *long long v24 = v37;
        unint64_t v25 = 0xEB0000000056546FLL;
        uint64_t v26 = 0x5479616C50726941;
        switch(v16)
        {
          case 1:
            unint64_t v25 = 0xEC00000073776569;
            uint64_t v26 = 0x766572506B6E694CLL;
            break;
          case 2:
            unint64_t v25 = 0xE300000000000000;
            uint64_t v26 = 5067348;
            break;
          case 3:
            unint64_t v25 = 0xEC000000736D7562;
            uint64_t v26 = 0x6C41646572616853;
            break;
          case 4:
            unint64_t v25 = 0xEF72657669656365;
            uint64_t v26 = 0x5279616C50726941;
            break;
          case 5:
            unint64_t v25 = v32 | 0x8000000000000000;
            uint64_t v26 = 0xD000000000000011;
            break;
          case 6:
            uint64_t v26 = 0xD000000000000017;
            unint64_t v25 = v31 | 0x8000000000000000;
            break;
          case 7:
            unint64_t v25 = 0xED000065646F4D72;
            uint64_t v26 = 0x65706F6C65766544;
            break;
          default:
            break;
        }
        uint64_t v27 = sub_10001AE5C(v26, v25, &v43);
        uint64_t v28 = (uint8_t *)v34;
        *(void *)(v34 + 1) = v27;
        swift_bridgeObjectRelease();
        os_log_t v29 = v33;
        _os_log_impl((void *)&_mh_execute_header, v33, v23, "Value of restriction changed: %s", v28, 0xCu);
        char v7 = 1;
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        swift_release();
        (*v40)(v42, v41);
        int64_t v13 = v39;
      }
      else
      {

        swift_release();
        (*v40)(v21, v41);
        char v7 = 1;
        int64_t v13 = v39;
      }
    }
    else
    {
      swift_release();
    }
  }
  int64_t v18 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v18 >= v13) {
    goto LABEL_33;
  }
  unint64_t v19 = *(void *)&v9[8 * v18];
  ++v8;
  if (v19) {
    goto LABEL_21;
  }
  int64_t v8 = v18 + 1;
  if (v18 + 1 >= v13) {
    goto LABEL_33;
  }
  unint64_t v19 = *(void *)&v9[8 * v8];
  if (v19) {
    goto LABEL_21;
  }
  int64_t v8 = v18 + 2;
  if (v18 + 2 >= v13) {
    goto LABEL_33;
  }
  unint64_t v19 = *(void *)&v9[8 * v8];
  if (v19)
  {
LABEL_21:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v8 << 6);
    goto LABEL_5;
  }
  int64_t v20 = v18 + 3;
  if (v20 < v13)
  {
    unint64_t v19 = *(void *)&v9[8 * v20];
    if (!v19)
    {
      while (1)
      {
        int64_t v8 = v20 + 1;
        if (__OFADD__(v20, 1)) {
          break;
        }
        if (v8 >= v13) {
          goto LABEL_33;
        }
        unint64_t v19 = *(void *)&v9[8 * v8];
        ++v20;
        if (v19) {
          goto LABEL_21;
        }
      }
LABEL_37:
      __break(1u);
      JUMPOUT(0x100029DCCLL);
    }
    int64_t v8 = v20;
    goto LABEL_21;
  }
LABEL_33:
  id result = (id)swift_release();
  if (v7) {
    return sub_100029204();
  }
  return result;
}

unint64_t sub_100029DEC()
{
  sub_100005E0C(&qword_100042A68);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000333A0;
  *(void *)(inited + 32) = 0x6E6F6973726556;
  *(void *)(inited + 40) = 0xE700000000000000;
  *(void *)(inited + 48) = 0;
  *(void *)(inited + 72) = &type metadata for Int;
  strcpy((char *)(inited + 80), "Restrictions");
  *(unsigned char *)(inited + 93) = 0;
  *(_WORD *)(inited + 94) = -5120;
  swift_beginAccess();
  uint64_t v2 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  uint64_t v3 = (void *)sub_100004AAC((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v35 = inited;
  *(void *)(inited + 120) = sub_100005E0C(&qword_100042A70);
  uint64_t v36 = v2 + 64;
  uint64_t v4 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v5 = -1;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  unint64_t v6 = v5 & *(void *)(v2 + 64);
  int64_t v37 = (unint64_t)(v4 + 63) >> 6;
  uint64_t v38 = v2;
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (1)
  {
    if (v6)
    {
      unint64_t v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v10 = v9 | (v7 << 6);
      goto LABEL_26;
    }
    int64_t v11 = v7 + 1;
    if (__OFADD__(v7, 1)) {
      goto LABEL_52;
    }
    if (v11 >= v37) {
      break;
    }
    unint64_t v12 = *(void *)(v36 + 8 * v11);
    ++v7;
    if (!v12)
    {
      int64_t v7 = v11 + 1;
      if (v11 + 1 >= v37) {
        break;
      }
      unint64_t v12 = *(void *)(v36 + 8 * v7);
      if (!v12)
      {
        int64_t v7 = v11 + 2;
        if (v11 + 2 >= v37) {
          break;
        }
        unint64_t v12 = *(void *)(v36 + 8 * v7);
        if (!v12)
        {
          int64_t v7 = v11 + 3;
          if (v11 + 3 >= v37) {
            break;
          }
          unint64_t v12 = *(void *)(v36 + 8 * v7);
          if (!v12)
          {
            int64_t v7 = v11 + 4;
            if (v11 + 4 >= v37) {
              break;
            }
            unint64_t v12 = *(void *)(v36 + 8 * v7);
            if (!v12)
            {
              int64_t v13 = v11 + 5;
              if (v13 >= v37) {
                break;
              }
              unint64_t v12 = *(void *)(v36 + 8 * v13);
              if (!v12)
              {
                while (1)
                {
                  int64_t v7 = v13 + 1;
                  if (__OFADD__(v13, 1)) {
                    goto LABEL_53;
                  }
                  if (v7 >= v37) {
                    goto LABEL_49;
                  }
                  unint64_t v12 = *(void *)(v36 + 8 * v7);
                  ++v13;
                  if (v12) {
                    goto LABEL_25;
                  }
                }
              }
              int64_t v7 = v13;
            }
          }
        }
      }
    }
LABEL_25:
    unint64_t v6 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v7 << 6);
LABEL_26:
    uint64_t v14 = *(void *)(*(void *)(v38 + 56) + 8 * v10);
    uint64_t v15 = 0xEB0000000056546FLL;
    uint64_t v16 = 0x5479616C50726941;
    switch(*(unsigned char *)(*(void *)(v38 + 48) + v10))
    {
      case 1:
        uint64_t v15 = 0xEC00000073776569;
        uint64_t v16 = 0x766572506B6E694CLL;
        break;
      case 2:
        uint64_t v15 = 0xE300000000000000;
        uint64_t v16 = 5067348;
        break;
      case 3:
        uint64_t v15 = 0xEC000000736D7562;
        uint64_t v16 = 0x6C41646572616853;
        break;
      case 4:
        uint64_t v15 = 0xEF72657669656365;
        uint64_t v16 = 0x5279616C50726941;
        break;
      case 5:
        uint64_t v15 = 0x8000000100033890;
        uint64_t v16 = 0xD000000000000011;
        break;
      case 6:
        uint64_t v16 = 0xD000000000000017;
        uint64_t v15 = 0x80000001000338B0;
        break;
      case 7:
        uint64_t v15 = 0xED000065646F4D72;
        uint64_t v16 = 0x65706F6C65766544;
        break;
      default:
        break;
    }
    uint64_t v17 = swift_initStackObject();
    *(_OWORD *)(v17 + 16) = xmmword_1000333A0;
    int64_t v18 = (_OWORD *)(v17 + 48);
    *(void *)(v17 + 32) = 0x65756C6156;
    *(void *)(v17 + 40) = 0xE500000000000000;
    swift_beginAccess();
    sub_10000C338(v14 + 80, (uint64_t)&v41);
    if (v42)
    {
      sub_100005F18(&v41, v18);
      swift_retain();
    }
    else
    {
      swift_beginAccess();
      sub_10000C338(v14 + 48, (uint64_t)&v39);
      if (!v40) {
        goto LABEL_54;
      }
      sub_100005F18(&v39, v18);
      swift_retain();
      sub_10000B14C((uint64_t)&v41, &qword_1000425E0);
    }
    *(void *)(v17 + 80) = 0x6465676E616843;
    *(void *)(v17 + 88) = 0xE700000000000000;
    char v19 = *(unsigned char *)(v14 + 112);
    *(void *)(v17 + 120) = &type metadata for Bool;
    *(unsigned char *)(v17 + 96) = v19;
    unint64_t v20 = sub_100004BC8(v17);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(void *)&long long v41 = v3;
    unint64_t v23 = sub_10001B688(v16, v15);
    uint64_t v24 = v3[2];
    BOOL v25 = (v22 & 1) == 0;
    uint64_t v26 = v24 + v25;
    if (__OFADD__(v24, v25))
    {
      __break(1u);
LABEL_51:
      __break(1u);
LABEL_52:
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
      JUMPOUT(0x10002A3CCLL);
    }
    char v27 = v22;
    if (v3[3] >= v26)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v3 = (void *)v41;
        if (v22) {
          goto LABEL_4;
        }
      }
      else
      {
        sub_10002B800();
        uint64_t v3 = (void *)v41;
        if (v27) {
          goto LABEL_4;
        }
      }
    }
    else
    {
      sub_10002AB70(v26, isUniquelyReferenced_nonNull_native);
      unint64_t v28 = sub_10001B688(v16, v15);
      if ((v27 & 1) != (v29 & 1)) {
        goto LABEL_55;
      }
      unint64_t v23 = v28;
      uint64_t v3 = (void *)v41;
      if (v27)
      {
LABEL_4:
        uint64_t v8 = v3[7];
        swift_bridgeObjectRelease();
        *(void *)(v8 + 8 * v23) = v20;
        goto LABEL_5;
      }
    }
    v3[(v23 >> 6) + 8] |= 1 << v23;
    uint64_t v30 = (uint64_t *)(v3[6] + 16 * v23);
    *uint64_t v30 = v16;
    v30[1] = v15;
    *(void *)(v3[7] + 8 * v23) = v20;
    uint64_t v31 = v3[2];
    BOOL v32 = __OFADD__(v31, 1);
    uint64_t v33 = v31 + 1;
    if (v32) {
      goto LABEL_51;
    }
    v3[2] = v33;
    swift_bridgeObjectRetain();
LABEL_5:
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_49:
  swift_release();
  *(void *)(v35 + 96) = v3;
  swift_bridgeObjectRelease();
  return sub_100004BC8(v35);
}

uint64_t RestrictionsManager.deinit()
{
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t RestrictionsManager.__deallocating_deinit()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 33, 7);
}

uint64_t sub_10002A444(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005E0C(&qword_100041F18);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v33 = v2;
  uint64_t v34 = v5 + 64;
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
      unint64_t v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v17 = v16 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v18 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v11) {
      break;
    }
    char v19 = (void *)(v5 + 64);
    unint64_t v20 = *(void *)(v34 + 8 * v18);
    ++v14;
    if (!v20)
    {
      int64_t v14 = v18 + 1;
      if (v18 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v20 = *(void *)(v34 + 8 * v14);
      if (!v20)
      {
        int64_t v21 = v18 + 2;
        if (v21 >= v11)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v33;
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v20 = *(void *)(v34 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            int64_t v14 = v21 + 1;
            if (__OFADD__(v21, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v20 = *(void *)(v34 + 8 * v14);
            ++v21;
            if (v20) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v21;
      }
    }
LABEL_21:
    unint64_t v10 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v14 << 6);
LABEL_22:
    char v22 = *(void **)(*(void *)(v5 + 48) + 8 * v17);
    unint64_t v23 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
    if (a2)
    {
      sub_100005F18(v23, v35);
    }
    else
    {
      sub_100020BCC((uint64_t)v23, (uint64_t)v35);
      id v24 = v22;
    }
    Hasher.init(_seed:)();
    type metadata accessor for CFString(0);
    sub_1000070FC();
    _CFObject.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v26 = result & ~v25;
    unint64_t v27 = v26 >> 6;
    if (((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v26) & ~*(void *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v28 = 0;
      unint64_t v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v30 = v27 == v29;
        if (v27 == v29) {
          unint64_t v27 = 0;
        }
        v28 |= v30;
        uint64_t v31 = *(void *)(v12 + 8 * v27);
      }
      while (v31 == -1);
      unint64_t v15 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    *(void *)(*(void *)(v7 + 48) + 8 * v15) = v22;
    uint64_t result = (uint64_t)sub_100005F18(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v33;
  char v19 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
  if (v32 >= 64) {
    bzero(v19, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v19 = -1 << v32;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_10002A750(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005E0C(&qword_100041F28);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_39;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v32 = (void *)(v5 + 64);
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v31 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  swift_retain();
  int64_t v12 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v18 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v19 = v18 | (v12 << 6);
      goto LABEL_31;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_40;
    }
    if (v20 >= v31) {
      break;
    }
    unint64_t v21 = v32[v20];
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v31) {
        break;
      }
      unint64_t v21 = v32[v12];
      if (!v21)
      {
        int64_t v22 = v20 + 2;
        if (v22 >= v31) {
          break;
        }
        unint64_t v21 = v32[v22];
        if (!v21)
        {
          while (1)
          {
            int64_t v12 = v22 + 1;
            if (__OFADD__(v22, 1)) {
              goto LABEL_41;
            }
            if (v12 >= v31) {
              goto LABEL_34;
            }
            unint64_t v21 = v32[v12];
            ++v22;
            if (v21) {
              goto LABEL_30;
            }
          }
        }
        int64_t v12 = v22;
      }
    }
LABEL_30:
    unint64_t v10 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_31:
    char v27 = *(unsigned char *)(*(void *)(v5 + 48) + v19);
    uint64_t v28 = *(void *)(*(void *)(v5 + 56) + 8 * v19);
    if ((a2 & 1) == 0) {
      swift_retain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    swift_bridgeObjectRelease();
    Swift::Int v13 = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = v13 & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_8;
    }
    char v23 = 0;
    unint64_t v24 = (unint64_t)(63 - v14) >> 6;
    do
    {
      if (++v16 == v24 && (v23 & 1) != 0)
      {
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        JUMPOUT(0x10002AB50);
      }
      BOOL v25 = v16 == v24;
      if (v16 == v24) {
        unint64_t v16 = 0;
      }
      v23 |= v25;
      uint64_t v26 = *(void *)(v11 + 8 * v16);
    }
    while (v26 == -1);
    unint64_t v17 = __clz(__rbit64(~v26)) + (v16 << 6);
LABEL_8:
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    *(unsigned char *)(*(void *)(v7 + 48) + v17) = v27;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v28;
    ++*(void *)(v7 + 16);
  }
LABEL_34:
  swift_release();
  uint64_t v3 = v2;
  if (a2)
  {
    uint64_t v29 = 1 << *(unsigned char *)(v5 + 32);
    if (v29 >= 64) {
      bzero(v32, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
    }
    else {
      *uint64_t v32 = -1 << v29;
    }
    *(void *)(v5 + 16) = 0;
  }
LABEL_39:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_10002AB70(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005E0C(&qword_100041E98);
  char v36 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v35 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  int64_t v34 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34) {
      break;
    }
    int64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v34) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v35 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v34) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v35 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    unint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *unint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  int64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *int64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_10002AE88(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005E0C(&qword_100041E88);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    int64_t v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *int64_t v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      int64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      int64_t v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_100005F18(v24, v35);
      }
      else
      {
        sub_100020BCC((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      unint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      *unint64_t v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_100005F18(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

uint64_t sub_10002B188(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100005E0C(&qword_100042A80);
  char v37 = a2;
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
  int64_t v34 = v2;
  int64_t v35 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v35) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v34;
          if ((v37 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v35) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v13);
            ++v24;
            if (v23) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v24;
      }
    }
LABEL_30:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    unint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    int v32 = *(_DWORD *)(*(void *)(v5 + 56) + 4 * v20);
    if ((v37 & 1) == 0) {
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v27 = v16 == v26;
        if (v16 == v26) {
          unint64_t v16 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      unint64_t v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    int64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *int64_t v18 = v31;
    v18[1] = v30;
    *(_DWORD *)(*(void *)(v7 + 56) + 4 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v34;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v37 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

id sub_10002B494()
{
  uint64_t v1 = v0;
  sub_100005E0C(&qword_100041F18);
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
    int64_t v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      int64_t v9 = v19 + 1;
      if (v19 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v9);
      if (!v20) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v20 - 1) & v20;
    unint64_t v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t v18 = 32 * v15;
    sub_100020BCC(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    sub_100005F18(v22, (_OWORD *)(*(void *)(v4 + 56) + v18));
    id result = v17;
  }
  int64_t v21 = v19 + 2;
  if (v21 >= v13) {
    goto LABEL_26;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v9);
    ++v21;
    if (v20) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10002B65C()
{
  uint64_t v1 = v0;
  sub_100005E0C(&qword_100041F28);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    id result = (void *)swift_retain();
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

void *sub_10002B800()
{
  uint64_t v1 = v0;
  sub_100005E0C(&qword_100041E98);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10002B9B8()
{
  uint64_t v1 = v0;
  sub_100005E0C(&qword_100041E88);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    id result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  char v25 = v1;
  id result = (void *)(v3 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_100020BCC(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    sub_100005F18(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    id result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10002BBA0()
{
  uint64_t v1 = v0;
  sub_100005E0C(&qword_100042A80);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 64);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    int64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 4 * v15;
    LODWORD(v17) = *(_DWORD *)(*(void *)(v2 + 56) + v20);
    int64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v21 = v19;
    v21[1] = v18;
    *(_DWORD *)(*(void *)(v4 + 56) + v20) = v17;
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10002BD50(uint64_t isStackAllocationSafe)
{
  uint64_t v1 = isStackAllocationSafe;
  char v2 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v36 = (unint64_t)((1 << v2) + 63) >> 6;
  size_t v3 = 8 * v36;
  if ((v2 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    v35[1] = v35;
    __chkstk_darwin(isStackAllocationSafe);
    char v37 = (char *)v35 - ((v3 + 15) & 0x3FFFFFFFFFFFFFF0);
    bzero(v37, v3);
    uint64_t v4 = 0;
    int64_t v5 = 0;
    uint64_t v6 = v1 + 64;
    uint64_t v7 = 1 << *(unsigned char *)(v1 + 32);
    uint64_t v8 = -1;
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    unint64_t v9 = v8 & *(void *)(v1 + 64);
    int64_t v10 = (unint64_t)(v7 + 63) >> 6;
    while (1)
    {
      if (v9)
      {
        unint64_t v12 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        unint64_t v13 = v12 | (v5 << 6);
      }
      else
      {
        int64_t v14 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
          __break(1u);
          goto LABEL_56;
        }
        if (v14 >= v10) {
          return sub_10002C508((unint64_t *)v37, v36, v4, v1);
        }
        unint64_t v15 = *(void *)(v6 + 8 * v14);
        ++v5;
        if (!v15)
        {
          int64_t v5 = v14 + 1;
          if (v14 + 1 >= v10) {
            return sub_10002C508((unint64_t *)v37, v36, v4, v1);
          }
          unint64_t v15 = *(void *)(v6 + 8 * v5);
          if (!v15)
          {
            int64_t v5 = v14 + 2;
            if (v14 + 2 >= v10) {
              return sub_10002C508((unint64_t *)v37, v36, v4, v1);
            }
            unint64_t v15 = *(void *)(v6 + 8 * v5);
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v10) {
                return sub_10002C508((unint64_t *)v37, v36, v4, v1);
              }
              unint64_t v15 = *(void *)(v6 + 8 * v16);
              if (!v15)
              {
                while (1)
                {
                  int64_t v5 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    break;
                  }
                  if (v5 >= v10) {
                    return sub_10002C508((unint64_t *)v37, v36, v4, v1);
                  }
                  unint64_t v15 = *(void *)(v6 + 8 * v5);
                  ++v16;
                  if (v15) {
                    goto LABEL_22;
                  }
                }
LABEL_57:
                __break(1u);
LABEL_58:
                __break(1u);
LABEL_59:
                __break(1u);
LABEL_60:
                __break(1u);
              }
              int64_t v5 = v16;
            }
          }
        }
LABEL_22:
        unint64_t v9 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v5 << 6);
      }
      uint64_t v17 = *(void *)(*(void *)(v1 + 56) + 8 * v13);
      if ((*(unsigned char *)(v17 + 112) & 1) == 0)
      {
        if (*(unsigned char *)(v17 + 114) != 1 || (swift_retain(), char v18 = sub_10002EFA8(), swift_release(), (v18 & 1) == 0))
        {
          *(void *)&v37[(v13 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v13;
          BOOL v11 = __OFADD__(v4++, 1);
          if (v11) {
            goto LABEL_59;
          }
        }
      }
    }
  }
  char v37 = (char *)swift_slowAlloc();
  bzero(v37, v3);
  uint64_t v20 = 0;
  int64_t v21 = 0;
  uint64_t v22 = v1 + 64;
  uint64_t v23 = 1 << *(unsigned char *)(v1 + 32);
  if (v23 < 64) {
    uint64_t v24 = ~(-1 << v23);
  }
  else {
    uint64_t v24 = -1;
  }
  unint64_t v25 = v24 & *(void *)(v1 + 64);
  int64_t v26 = (unint64_t)(v23 + 63) >> 6;
  while (v25)
  {
    unint64_t v27 = __clz(__rbit64(v25));
    v25 &= v25 - 1;
    unint64_t v28 = v27 | (v21 << 6);
LABEL_49:
    uint64_t v32 = *(void *)(*(void *)(v1 + 56) + 8 * v28);
    if ((*(unsigned char *)(v32 + 112) & 1) == 0)
    {
      if (*(unsigned char *)(v32 + 114) != 1 || (swift_retain(), char v33 = sub_10002EFA8(), swift_release(), (v33 & 1) == 0))
      {
        *(void *)&v37[(v28 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v28;
        BOOL v11 = __OFADD__(v20++, 1);
        if (v11) {
          goto LABEL_60;
        }
      }
    }
  }
  int64_t v29 = v21 + 1;
  if (__OFADD__(v21, 1))
  {
LABEL_56:
    __break(1u);
    goto LABEL_57;
  }
  if (v29 >= v26) {
    goto LABEL_53;
  }
  unint64_t v30 = *(void *)(v22 + 8 * v29);
  ++v21;
  if (v30) {
    goto LABEL_48;
  }
  int64_t v21 = v29 + 1;
  if (v29 + 1 >= v26) {
    goto LABEL_53;
  }
  unint64_t v30 = *(void *)(v22 + 8 * v21);
  if (v30) {
    goto LABEL_48;
  }
  int64_t v21 = v29 + 2;
  if (v29 + 2 >= v26) {
    goto LABEL_53;
  }
  unint64_t v30 = *(void *)(v22 + 8 * v21);
  if (v30)
  {
LABEL_48:
    unint64_t v25 = (v30 - 1) & v30;
    unint64_t v28 = __clz(__rbit64(v30)) + (v21 << 6);
    goto LABEL_49;
  }
  int64_t v31 = v29 + 3;
  if (v31 >= v26) {
    goto LABEL_53;
  }
  unint64_t v30 = *(void *)(v22 + 8 * v31);
  if (v30)
  {
    int64_t v21 = v31;
    goto LABEL_48;
  }
  while (1)
  {
    int64_t v21 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      goto LABEL_58;
    }
    if (v21 >= v26) {
      break;
    }
    unint64_t v30 = *(void *)(v22 + 8 * v21);
    ++v31;
    if (v30) {
      goto LABEL_48;
    }
  }
LABEL_53:
  int64_t v34 = sub_10002C508((unint64_t *)v37, v36, v20, v1);
  swift_slowDealloc();
  return v34;
}

void *sub_10002C168(uint64_t isStackAllocationSafe)
{
  uint64_t v1 = isStackAllocationSafe;
  char v2 = *(unsigned char *)(isStackAllocationSafe + 32);
  unint64_t v3 = (unint64_t)((1 << v2) + 63) >> 6;
  size_t v4 = 8 * v3;
  if ((v2 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v35 - ((v4 + 15) & 0x3FFFFFFFFFFFFFF0), v4);
    uint64_t v5 = 0;
    int64_t v6 = 0;
    uint64_t v7 = v1 + 64;
    uint64_t v8 = 1 << *(unsigned char *)(v1 + 32);
    uint64_t v9 = -1;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    unint64_t v10 = v9 & *(void *)(v1 + 64);
    int64_t v11 = (unint64_t)(v8 + 63) >> 6;
    while (1)
    {
      if (v10)
      {
        unint64_t v12 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v13 = v12 | (v6 << 6);
      }
      else
      {
        BOOL v14 = __OFADD__(v6++, 1);
        if (v14)
        {
          __break(1u);
          goto LABEL_58;
        }
        if (v6 >= v11) {
          return sub_10002C508((unint64_t *)((char *)&v35 - ((v4 + 15) & 0x3FFFFFFFFFFFFFF0)), v3, v5, v1);
        }
        unint64_t v15 = *(void *)(v7 + 8 * v6);
        if (!v15)
        {
          int64_t v16 = v6 + 1;
          if (v6 + 1 >= v11) {
            return sub_10002C508((unint64_t *)((char *)&v35 - ((v4 + 15) & 0x3FFFFFFFFFFFFFF0)), v3, v5, v1);
          }
          unint64_t v15 = *(void *)(v7 + 8 * v16);
          if (!v15)
          {
            int64_t v16 = v6 + 2;
            if (v6 + 2 >= v11) {
              return sub_10002C508((unint64_t *)((char *)&v35 - ((v4 + 15) & 0x3FFFFFFFFFFFFFF0)), v3, v5, v1);
            }
            unint64_t v15 = *(void *)(v7 + 8 * v16);
            if (!v15)
            {
              int64_t v16 = v6 + 3;
              if (v6 + 3 >= v11) {
                return sub_10002C508((unint64_t *)((char *)&v35 - ((v4 + 15) & 0x3FFFFFFFFFFFFFF0)), v3, v5, v1);
              }
              unint64_t v15 = *(void *)(v7 + 8 * v16);
              if (!v15)
              {
                while (1)
                {
                  int64_t v6 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    break;
                  }
                  if (v6 >= v11) {
                    return sub_10002C508((unint64_t *)((char *)&v35 - ((v4 + 15) & 0x3FFFFFFFFFFFFFF0)), v3, v5, v1);
                  }
                  unint64_t v15 = *(void *)(v7 + 8 * v6);
                  ++v16;
                  if (v15) {
                    goto LABEL_18;
                  }
                }
LABEL_59:
                __break(1u);
LABEL_60:
                __break(1u);
LABEL_61:
                __break(1u);
LABEL_62:
                __break(1u);
              }
            }
          }
          int64_t v6 = v16;
        }
LABEL_18:
        unint64_t v17 = __clz(__rbit64(v15));
        unint64_t v10 = (v15 - 1) & v15;
        unint64_t v13 = v17 + (v6 << 6);
      }
      uint64_t v18 = *(void *)(*(void *)(v1 + 56) + 8 * v13);
      if ((*(unsigned char *)(v18 + 112) & 1) == 0 && *(unsigned char *)(v18 + 114) == 1)
      {
        *(uint64_t *)((char *)&v35 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8) - ((v4 + 15) & 0x3FFFFFFFFFFFFFF0)) |= 1 << v13;
        BOOL v14 = __OFADD__(v5++, 1);
        if (v14) {
          goto LABEL_61;
        }
      }
    }
  }
  uint64_t v20 = (char *)swift_slowAlloc();
  bzero(v20, v4);
  uint64_t v21 = 0;
  int64_t v22 = 0;
  uint64_t v23 = v1 + 64;
  uint64_t v24 = 1 << *(unsigned char *)(v1 + 32);
  if (v24 < 64) {
    uint64_t v25 = ~(-1 << v24);
  }
  else {
    uint64_t v25 = -1;
  }
  unint64_t v26 = v25 & *(void *)(v1 + 64);
  int64_t v27 = (unint64_t)(v24 + 63) >> 6;
  while (1)
  {
    if (v26)
    {
      unint64_t v28 = __clz(__rbit64(v26));
      v26 &= v26 - 1;
      unint64_t v29 = v28 | (v22 << 6);
      goto LABEL_46;
    }
    BOOL v14 = __OFADD__(v22++, 1);
    if (v14)
    {
LABEL_58:
      __break(1u);
      goto LABEL_59;
    }
    if (v22 >= v27) {
      goto LABEL_55;
    }
    unint64_t v30 = *(void *)(v23 + 8 * v22);
    if (!v30) {
      break;
    }
LABEL_45:
    unint64_t v32 = __clz(__rbit64(v30));
    unint64_t v26 = (v30 - 1) & v30;
    unint64_t v29 = v32 + (v22 << 6);
LABEL_46:
    uint64_t v33 = *(void *)(*(void *)(v1 + 56) + 8 * v29);
    if ((*(unsigned char *)(v33 + 112) & 1) == 0 && *(unsigned char *)(v33 + 114) == 1)
    {
      *(void *)&v20[(v29 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v29;
      BOOL v14 = __OFADD__(v21++, 1);
      if (v14) {
        goto LABEL_62;
      }
    }
  }
  int64_t v31 = v22 + 1;
  if (v22 + 1 >= v27) {
    goto LABEL_55;
  }
  unint64_t v30 = *(void *)(v23 + 8 * v31);
  if (v30) {
    goto LABEL_44;
  }
  int64_t v31 = v22 + 2;
  if (v22 + 2 >= v27) {
    goto LABEL_55;
  }
  unint64_t v30 = *(void *)(v23 + 8 * v31);
  if (v30) {
    goto LABEL_44;
  }
  int64_t v31 = v22 + 3;
  if (v22 + 3 >= v27) {
    goto LABEL_55;
  }
  unint64_t v30 = *(void *)(v23 + 8 * v31);
  if (v30)
  {
LABEL_44:
    int64_t v22 = v31;
    goto LABEL_45;
  }
  while (1)
  {
    int64_t v22 = v31 + 1;
    if (__OFADD__(v31, 1)) {
      goto LABEL_60;
    }
    if (v22 >= v27) {
      break;
    }
    unint64_t v30 = *(void *)(v23 + 8 * v22);
    ++v31;
    if (v30) {
      goto LABEL_45;
    }
  }
LABEL_55:
  int64_t v34 = sub_10002C508((unint64_t *)v20, v3, v21, v1);
  swift_slowDealloc();
  return v34;
}

void *sub_10002C508(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a3) {
    return &_swiftEmptyDictionarySingleton;
  }
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) != a3)
  {
    sub_100005E0C(&qword_100041F28);
    uint64_t v8 = static _DictionaryStorage.allocate(capacity:)();
    uint64_t v9 = v8;
    int64_t v31 = a1;
    uint64_t v32 = a2;
    if (a2 < 1) {
      unint64_t v10 = 0;
    }
    else {
      unint64_t v10 = *a1;
    }
    uint64_t v11 = 0;
    uint64_t v12 = v8 + 64;
    while (1)
    {
      if (v10)
      {
        unint64_t v13 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v14 = v13 | (v11 << 6);
      }
      else
      {
        uint64_t v15 = v11 + 1;
        if (__OFADD__(v11, 1)) {
          goto LABEL_40;
        }
        if (v15 >= v32) {
          return (void *)v9;
        }
        unint64_t v16 = v31[v15];
        ++v11;
        if (!v16)
        {
          uint64_t v11 = v15 + 1;
          if (v15 + 1 >= v32) {
            return (void *)v9;
          }
          unint64_t v16 = v31[v11];
          if (!v16)
          {
            uint64_t v11 = v15 + 2;
            if (v15 + 2 >= v32) {
              return (void *)v9;
            }
            unint64_t v16 = v31[v11];
            if (!v16)
            {
              uint64_t v17 = v15 + 3;
              if (v17 >= v32) {
                return (void *)v9;
              }
              unint64_t v16 = v31[v17];
              if (!v16)
              {
                while (1)
                {
                  uint64_t v11 = v17 + 1;
                  if (__OFADD__(v17, 1)) {
                    goto LABEL_41;
                  }
                  if (v11 >= v32) {
                    return (void *)v9;
                  }
                  unint64_t v16 = v31[v11];
                  ++v17;
                  if (v16) {
                    goto LABEL_24;
                  }
                }
              }
              uint64_t v11 = v17;
            }
          }
        }
LABEL_24:
        unint64_t v10 = (v16 - 1) & v16;
        unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
      }
      char v18 = *(unsigned char *)(*(void *)(v4 + 48) + v14);
      uint64_t v19 = *(void *)(*(void *)(v4 + 56) + 8 * v14);
      Hasher.init(_seed:)();
      swift_retain();
      String.hash(into:)();
      swift_bridgeObjectRelease();
      Swift::Int v20 = Hasher._finalize()();
      uint64_t v21 = -1 << *(unsigned char *)(v9 + 32);
      unint64_t v22 = v20 & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v24 = __clz(__rbit64((-1 << v22) & ~*(void *)(v12 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
        goto LABEL_35;
      }
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          JUMPOUT(0x10002C8B8);
        }
        BOOL v27 = v23 == v26;
        if (v23 == v26) {
          unint64_t v23 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v12 + 8 * v23);
      }
      while (v28 == -1);
      unint64_t v24 = __clz(__rbit64(~v28)) + (v23 << 6);
LABEL_35:
      *(void *)(v12 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
      *(unsigned char *)(*(void *)(v9 + 48) + v24) = v18;
      *(void *)(*(void *)(v9 + 56) + 8 * v24) = v19;
      ++*(void *)(v9 + 16);
      if (__OFSUB__(v5--, 1)) {
        goto LABEL_39;
      }
      if (!v5) {
        return (void *)v9;
      }
    }
  }
  swift_retain();
  return (void *)v4;
}

uint64_t sub_10002C8D8()
{
  uint64_t v0 = sub_100005E0C((uint64_t *)&unk_1000423F8);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  unint64_t v3 = (char *)v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)v21 - v4;
  sub_10002D894(v3);
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v8(v3, 1, v6) == 1)
  {
    sub_10000B14C((uint64_t)v3, (uint64_t *)&unk_1000423F8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
LABEL_10:
    __break(1u);
  }
  URL.appendingPathComponent(_:)();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v7 + 8);
  v9(v3, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if (v8(v5, 1, v6) == 1) {
    goto LABEL_10;
  }
  uint64_t v10 = Data.init(contentsOf:options:)();
  unint64_t v12 = v11;
  v9(v5, v6);
  unint64_t v13 = self;
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  v22[0] = 0;
  id v15 = [v13 propertyListWithData:isa options:0 format:0 error:v22];

  if (v15)
  {
    id v16 = v22[0];
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_100005E0C(&qword_100042A78);
    if (swift_dynamicCast()) {
      uint64_t v17 = v21[1];
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    id v18 = v22[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    uint64_t v17 = 0;
  }
  type metadata accessor for RestrictionsManager();
  uint64_t v19 = swift_allocObject();
  sub_10002730C(v17);
  sub_100024E94(v10, v12);
  return v19;
}

void *sub_10002CC38(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v31 = 0;
  int64_t v5 = 0;
  uint64_t v29 = a3 + 64;
  uint64_t v6 = 1 << *(unsigned char *)(a3 + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(a3 + 64);
  int64_t v30 = (unint64_t)(v6 + 63) >> 6;
  while (2)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v10 = v9 | (v5 << 6);
      uint64_t v11 = *(void *)(a4 + 16);
      if (!v11) {
        goto LABEL_52;
      }
    }
    else
    {
      int64_t v12 = v5 + 1;
      if (__OFADD__(v5, 1))
      {
        __break(1u);
        goto LABEL_57;
      }
      if (v12 >= v30) {
        return sub_10002C508(a1, a2, v31, a3);
      }
      unint64_t v13 = *(void *)(v29 + 8 * v12);
      ++v5;
      if (!v13)
      {
        int64_t v5 = v12 + 1;
        if (v12 + 1 >= v30) {
          return sub_10002C508(a1, a2, v31, a3);
        }
        unint64_t v13 = *(void *)(v29 + 8 * v5);
        if (!v13)
        {
          int64_t v5 = v12 + 2;
          if (v12 + 2 >= v30) {
            return sub_10002C508(a1, a2, v31, a3);
          }
          unint64_t v13 = *(void *)(v29 + 8 * v5);
          if (!v13)
          {
            int64_t v14 = v12 + 3;
            if (v14 >= v30) {
              return sub_10002C508(a1, a2, v31, a3);
            }
            unint64_t v13 = *(void *)(v29 + 8 * v14);
            if (!v13)
            {
              while (1)
              {
                int64_t v5 = v14 + 1;
                if (__OFADD__(v14, 1)) {
                  break;
                }
                if (v5 >= v30) {
                  return sub_10002C508(a1, a2, v31, a3);
                }
                unint64_t v13 = *(void *)(v29 + 8 * v5);
                ++v14;
                if (v13) {
                  goto LABEL_22;
                }
              }
LABEL_57:
              __break(1u);
              JUMPOUT(0x10002D0F8);
            }
            int64_t v5 = v14;
          }
        }
      }
LABEL_22:
      unint64_t v8 = (v13 - 1) & v13;
      unint64_t v10 = __clz(__rbit64(v13)) + (v5 << 6);
      uint64_t v11 = *(void *)(a4 + 16);
      if (!v11) {
        goto LABEL_52;
      }
    }
    unint64_t v33 = v8;
    int64_t v34 = v5;
    uint64_t v15 = *(unsigned __int8 *)(*(void *)(a3 + 48) + v10);
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v16 = 0;
LABEL_24:
    uint64_t v17 = a4 + v16++;
    unint64_t v18 = 0xEB0000000056546FLL;
    unint64_t v19 = 0x5479616C50726941;
    switch(*(unsigned char *)(v17 + 32))
    {
      case 1:
        unint64_t v19 = 0x766572506B6E694CLL;
        unint64_t v18 = 0xEC00000073776569;
        break;
      case 2:
        unint64_t v18 = 0xE300000000000000;
        unint64_t v19 = 5067348;
        break;
      case 3:
        unint64_t v19 = 0x6C41646572616853;
        unint64_t v18 = 0xEC000000736D7562;
        break;
      case 4:
        unint64_t v19 = 0x5279616C50726941;
        unint64_t v18 = 0xEF72657669656365;
        break;
      case 5:
        unint64_t v18 = 0x8000000100033890;
        unint64_t v19 = 0xD000000000000011;
        break;
      case 6:
        unint64_t v19 = 0xD000000000000017;
        unint64_t v18 = 0x80000001000338B0;
        break;
      case 7:
        unint64_t v19 = 0x65706F6C65766544;
        unint64_t v18 = 0xED000065646F4D72;
        break;
      default:
        break;
    }
    unint64_t v20 = 0x5479616C50726941;
    unint64_t v21 = 0xEB0000000056546FLL;
    switch(v15)
    {
      case 1:
        uint64_t v22 = 0x766572506B6E694CLL;
        uint64_t v23 = 1937204585;
        goto LABEL_37;
      case 2:
        unint64_t v21 = 0xE300000000000000;
        if (v19 != 5067348) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 3:
        uint64_t v22 = 0x6C41646572616853;
        uint64_t v23 = 1936553314;
LABEL_37:
        unint64_t v21 = v23 & 0xFFFFFFFFFFFFLL | 0xEC00000000000000;
        if (v19 != v22) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 4:
        unint64_t v21 = 0xEF72657669656365;
        if (v19 != 0x5279616C50726941) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 5:
        unint64_t v21 = 0x8000000100033890;
        if (v19 != 0xD000000000000011) {
          goto LABEL_46;
        }
        goto LABEL_45;
      case 6:
        unint64_t v20 = 0xD000000000000017;
        unint64_t v21 = 0x80000001000338B0;
        goto LABEL_44;
      case 7:
        unint64_t v21 = 0xED000065646F4D72;
        if (v19 != 0x65706F6C65766544) {
          goto LABEL_46;
        }
        goto LABEL_45;
      default:
LABEL_44:
        if (v19 != v20) {
          goto LABEL_46;
        }
LABEL_45:
        if (v18 == v21)
        {
          swift_release();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          goto LABEL_5;
        }
LABEL_46:
        char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v24)
        {
          swift_release();
          swift_bridgeObjectRelease();
LABEL_5:
          unint64_t v8 = v33;
          int64_t v5 = v34;
          continue;
        }
        if (v11 != v16) {
          goto LABEL_24;
        }
        swift_release();
        swift_bridgeObjectRelease();
        unint64_t v8 = v33;
        int64_t v5 = v34;
LABEL_52:
        *(unint64_t *)((char *)a1 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        if (!__OFADD__(v31++, 1)) {
          continue;
        }
        __break(1u);
        return sub_10002C508(a1, a2, v31, a3);
    }
  }
}

void *sub_10002D138(uint64_t a1, uint64_t a2)
{
  char v5 = *(unsigned char *)(a1 + 32);
  unsigned int v6 = v5 & 0x3F;
  unint64_t v7 = (unint64_t)((1 << v5) + 63) >> 6;
  size_t v8 = 8 * v7;
  uint64_t isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (uint64_t isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    bzero((char *)&v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0), v8);
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_10002CC38((unint64_t *)((char *)&v13 - ((v8 + 15) & 0x3FFFFFFFFFFFFFF0)), v7, a1, a2);
    swift_bridgeObjectRelease();
    if (v2) {
      swift_willThrow();
    }
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v11 = (void *)swift_slowAlloc();
    bzero(v11, v8);
    swift_bridgeObjectRetain();
    unint64_t v10 = sub_10002CC38((unint64_t *)v11, v7, a1, a2);
    swift_bridgeObjectRelease();
    swift_slowDealloc();
    swift_bridgeObjectRelease_n();
  }
  return v10;
}

unint64_t _s13lockdownmoded19RestrictionsManagerC14RestrictionKeyO8rawValueAESgSS_tcfC_0(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10003D020, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 8) {
    return 8;
  }
  else {
    return v3;
  }
}

unint64_t sub_10002D344()
{
  unint64_t result = qword_100042928;
  if (!qword_100042928)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042928);
  }
  return result;
}

unint64_t sub_10002D39C()
{
  unint64_t result = qword_100042930;
  if (!qword_100042930)
  {
    sub_100005EAC(&qword_100042938);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042930);
  }
  return result;
}

uint64_t type metadata accessor for RestrictionsManager()
{
  return self;
}

unsigned char *initializeBufferWithCopyOfBuffer for RestrictionsManager.RestrictionKey(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RestrictionsManager.RestrictionKey(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for RestrictionsManager.RestrictionKey(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *unint64_t result = a2 + 7;
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
        JUMPOUT(0x10002D584);
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
          *unint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_10002D5AC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10002D5B4(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RestrictionsManager.RestrictionKey()
{
  return &type metadata for RestrictionsManager.RestrictionKey;
}

uint64_t sub_10002D5CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E0C(&qword_1000425E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002D634(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E0C(&qword_1000425E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002D69C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002D6E4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  int v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *int v8 = v2;
  v8[1] = sub_10000A1A0;
  return sub_1000066B0(a1, v4, v5, v7, v6);
}

uint64_t sub_10002D7A4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002D7DC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000A1A0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100042A90 + dword_100042A90);
  return v6(a1, v4);
}

uint64_t sub_10002D894@<X0>(char *a1@<X8>)
{
  long long v88 = a1;
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v85 = v1;
  uint64_t v86 = v2;
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v78 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v78 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  char v83 = (uint8_t *)&v78 - v10;
  __chkstk_darwin(v9);
  int64_t v12 = (char *)&v78 - v11;
  uint64_t v13 = sub_100005E0C((uint64_t *)&unk_1000423F8);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v78 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for URL();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v82 = (char *)&v78 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  int64_t v84 = (char *)&v78 - v21;
  __chkstk_darwin(v20);
  uint64_t v87 = (char *)&v78 - v22;
  uint64_t v23 = self;
  id v24 = [v23 defaultManager];
  id v25 = [v24 URLsForDirectory:5 inDomains:1];

  uint64_t v26 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v26 + 16))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v17 + 16))(v15, v26 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80)), v16);
    BOOL v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    v27(v15, 0, 1, v16);
  }
  else
  {
    BOOL v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
    v27(v15, 1, 1, v16);
  }
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1)
  {
    sub_10000BCC8((uint64_t)v15);
    static Logger.daemonLogger.getter();
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v29))
    {
      int64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int64_t v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Could not get Library path for user", v30, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v86 + 8))(v8, v85);
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v27)(v88, 1, 1, v16);
  }
  uint64_t v79 = v5;
  unsigned int v81 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v27;
  unint64_t v80 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
  v80(v87, v15, v16);
  uint64_t v32 = v84;
  URL.appendingPathComponent(_:)();
  char v90 = 0;
  id v33 = [v23 defaultManager];
  URL.path(percentEncoded:)(0);
  NSString v34 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unsigned int v35 = [v33 fileExistsAtPath:v34 isDirectory:&v90];

  if (v35)
  {
    unint64_t v36 = v32;
    if (v90)
    {
LABEL_17:
      (*(void (**)(char *, uint64_t))(v17 + 8))(v87, v16);
      os_log_type_t v65 = v88;
      v80(v88, v36, v16);
      return v81((uint64_t)v65, 0, 1, v16);
    }
    static Logger.daemonLogger.getter();
    char v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v37, v38))
    {
      long long v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v39 = 0;
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "LockdownMode exists but as a file instead of a directory. Replacing with a directory…", v39, 2u);
      unint64_t v36 = v84;
      swift_slowDealloc();
    }

    uint64_t v40 = v86 + 8;
    long long v41 = *(void (**)(char *, uint64_t))(v86 + 8);
    v41(v12, v85);
    id v42 = [v23 defaultManager];
    URL._bridgeToObjectiveC()(v43);
    uint64_t v45 = v44;
    id v91 = 0;
    unsigned __int8 v46 = [v42 removeItemAtURL:v44 error:&v91];

    id v47 = v91;
    uint64_t v48 = v79;
    if ((v46 & 1) == 0)
    {
      uint64_t v86 = v40;
      id v49 = v91;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      static Logger.daemonLogger.getter();
      swift_errorRetain();
      swift_errorRetain();
      int64_t v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = (uint8_t *)swift_slowAlloc();
        uint64_t v53 = (void *)swift_slowAlloc();
        char v83 = v52;
        *(_DWORD *)uint64_t v52 = 138739971;
        swift_errorRetain();
        uint64_t v54 = (void *)_swift_stdlib_bridgeErrorToNSError();
        id v91 = v54;
        uint64_t v48 = v79;
        unint64_t v36 = v84;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *uint64_t v53 = v54;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "Could not remove LockdownMode file: %{sensitive}@", v83, 0xCu);
        sub_100005E0C(&qword_1000421F8);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_errorRelease();
        swift_errorRelease();
      }
      unint64_t v76 = v81;
      swift_errorRelease();
      v41(v48, v85);
      int v77 = *(void (**)(char *, uint64_t))(v17 + 8);
      v77(v36, v16);
      v77(v87, v16);
      return v76((uint64_t)v88, 1, 1, v16);
    }
LABEL_16:
    id v64 = v47;
    goto LABEL_17;
  }
  id v55 = [v23 defaultManager];
  URL._bridgeToObjectiveC()(v56);
  unint64_t v58 = v57;
  sub_100005E0C(&qword_100042AA0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100033750;
  *(void *)(inited + 32) = NSFileProtectionKey;
  type metadata accessor for FileProtectionType(0);
  *(void *)(inited + 64) = v60;
  *(void *)(inited + 40) = NSFileProtectionCompleteUntilFirstUserAuthentication;
  unint64_t v61 = NSFileProtectionKey;
  id v62 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  sub_100004878(inited);
  type metadata accessor for FileAttributeKey(0);
  sub_10002E430();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v91 = 0;
  LOBYTE(inited) = [v55 createDirectoryAtURL:v58 withIntermediateDirectories:1 attributes:isa error:&v91];

  id v47 = v91;
  unint64_t v36 = v32;
  if (inited) {
    goto LABEL_16;
  }
  id v66 = v91;
  _convertNSErrorToError(_:)();

  swift_willThrow();
  swift_errorRelease();
  char v67 = v83;
  static Logger.daemonLogger.getter();
  Swift::String v68 = v82;
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v82, v36, v16);
  uint64_t v69 = Logger.logObject.getter();
  os_log_type_t v70 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v69, v70))
  {
    uint64_t v71 = (uint8_t *)swift_slowAlloc();
    id v91 = (id)swift_slowAlloc();
    *(_DWORD *)uint64_t v71 = 136642819;
    unint64_t v80 = (void (*)(char *, char *, uint64_t))(v71 + 4);
    uint64_t v72 = URL.path.getter();
    uint64_t v89 = sub_10001AE5C(v72, v73, (uint64_t *)&v91);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v74 = *(void (**)(char *, uint64_t))(v17 + 8);
    v74(v68, v16);
    _os_log_impl((void *)&_mh_execute_header, v69, v70, "Could not create directory at %{sensitive}s", v71, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint8_t *, uint64_t))(v86 + 8))(v83, v85);
    v74(v84, v16);
    v74(v87, v16);
  }
  else
  {

    unint64_t v75 = *(void (**)(char *, uint64_t))(v17 + 8);
    v75(v68, v16);
    (*(void (**)(uint8_t *, uint64_t))(v86 + 8))(v67, v85);
    v75(v36, v16);
    v75(v87, v16);
  }
  return v81((uint64_t)v88, 1, 1, v16);
}

void *sub_10002E3F4()
{
  unint64_t result = dlopen("/System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant", 2);
  if (result) {
    unint64_t result = dlsym(result, "BYSetupAssistantNeedsToRun");
  }
  off_100044150 = result;
  return result;
}

unint64_t sub_10002E430()
{
  unint64_t result = qword_100042000;
  if (!qword_100042000)
  {
    type metadata accessor for FileAttributeKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042000);
  }
  return result;
}

void sub_10002E488(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemonLogger.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    v17[0] = a1;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    v17[1] = sub_10001AE5C(v17[0], (unint64_t)a2, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "reboot called (reason: %s)", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v17[0];
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v18 = 0;
  unint64_t v19 = 0xE000000000000000;
  _StringGuts.grow(_:)(17);
  swift_bridgeObjectRelease();
  uint64_t v18 = 0x6E776F646B636F4CLL;
  unint64_t v19 = 0xEF203A65646F4D20;
  v12._countAndFlagsBits = a1;
  v12._object = a2;
  String.append(_:)(v12);
  id v13 = objc_allocWithZone((Class)FBSShutdownOptions);
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v15 = [v13 initWithReason:v14];

  [v15 setSource:1];
  [v15 setRebootType:1];
  id v16 = [self sharedService];
  [v16 shutdownWithOptions:v15];
}

uint64_t type metadata accessor for LockdownModeCoreMedia()
{
  return self;
}

uint64_t sub_10002E7AC()
{
  uint64_t v0 = (__CFString *)String._bridgeToObjectiveC()();
  uint64_t v1 = (__CFString *)String._bridgeToObjectiveC()();
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(v0, v1, 0);

  uint64_t v3 = (__CFString *)String._bridgeToObjectiveC()();
  uint64_t v4 = (__CFString *)String._bridgeToObjectiveC()();
  int v5 = CFPreferencesGetAppBooleanValue(v3, v4, 0);

  if (AppBooleanValue) {
    unsigned int v6 = 2;
  }
  else {
    unsigned int v6 = 1;
  }
  if (v5) {
    return v6;
  }
  else {
    return 0;
  }
}

void sub_10002E89C()
{
  uint64_t v0 = (__CFString *)String._bridgeToObjectiveC()();
  Class isa = Bool._bridgeToObjectiveC()().super.super.isa;
  uint64_t v2 = (__CFString *)String._bridgeToObjectiveC()();
  CFPreferencesSetAppValue(v0, isa, v2);

  uint64_t v3 = (__CFString *)String._bridgeToObjectiveC()();
  Class v4 = Bool._bridgeToObjectiveC()().super.super.isa;
  int v5 = (__CFString *)String._bridgeToObjectiveC()();
  CFPreferencesSetAppValue(v3, v4, v5);
}

uint64_t type metadata accessor for AnalyticsManager()
{
  return self;
}

void sub_10002E9E8(int a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Logger.daemonLogger.getter();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.debug.getter();
  BOOL v10 = os_log_type_enabled(v8, v9);
  int v19 = a1;
  if (v10)
  {
    uint64_t v11 = 0x7964647562;
    uint64_t v12 = a2;
    a2 = swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    *(_DWORD *)a2 = 67240450;
    LODWORD(v20) = a1 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(a2 + 8) = 2082;
    unint64_t v13 = 0xE500000000000000;
    uint64_t v18 = v12;
    switch((char)v12)
    {
      case 1:
        unint64_t v13 = 0xE600000000000000;
        uint64_t v11 = 0x6E496E676973;
        break;
      case 2:
        unint64_t v13 = 0xE800000000000000;
        uint64_t v11 = 0x73676E6974746573;
        break;
      case 3:
        uint64_t v11 = 0x6464754274736F70;
        unint64_t v13 = 0xE900000000000079;
        break;
      case 4:
        unint64_t v13 = 0x8000000100034A70;
        uint64_t v11 = 0xD000000000000016;
        break;
      default:
        break;
    }
    uint64_t v20 = sub_10001AE5C(v11, v13, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Sending status event (enabled: %{BOOL,public}d, source: %{public}s)", (uint8_t *)a2, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    LOBYTE(a2) = v18;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  NSString v14 = String._bridgeToObjectiveC()();
  sub_100005E0C(&qword_100042C10);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000333A0;
  *(void *)(inited + 32) = 0x746C75736572;
  *(void *)(inited + 40) = 0xE600000000000000;
  *(NSNumber *)(inited + 48) = Bool._bridgeToObjectiveC()();
  *(void *)(inited + 56) = 0x656372756F73;
  *(void *)(inited + 64) = 0xE600000000000000;
  switch((char)a2)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      NSString v16 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      *(void *)(inited + 72) = v16;
      sub_100004D00(inited);
      sub_10002EE58();
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      AnalyticsSendEvent();

      return;
    default:
      JUMPOUT(0);
  }
}

unint64_t sub_10002EE58()
{
  unint64_t result = qword_100042C18;
  if (!qword_100042C18)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100042C18);
  }
  return result;
}

uint64_t type metadata accessor for LockdownModeSafari()
{
  return self;
}

uint64_t sub_10002EEBC(_OWORD *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  *(unsigned char *)(v10 + 113) = 0;
  *(_OWORD *)(v10 + 64) = 0u;
  *(_OWORD *)(v10 + 96) = 0u;
  *(_OWORD *)(v10 + 80) = 0u;
  *(_OWORD *)(v10 + 48) = 0u;
  *(void *)(v10 + 120) = 0;
  *(void *)(v10 + 128) = 0;
  *(void *)(v10 + 16) = a4;
  *(void *)(v10 + 24) = a5;
  *(void *)(v10 + 32) = a6;
  *(void *)(v10 + 40) = a7;
  sub_100005F18(a1, v15);
  swift_beginAccess();
  sub_10002D634((uint64_t)v15, v10 + 48);
  swift_endAccess();
  *(unsigned char *)(v10 + 114) = a10;
  swift_beginAccess();
  sub_10002D634(a2, v10 + 80);
  swift_endAccess();
  *(unsigned char *)(v10 + 112) = a3;
  *(void *)(v10 + 120) = a8;
  *(void *)(v10 + 128) = a9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10002EFA8()
{
  void (*v14)(void *__return_ptr, uint64_t);
  uint64_t v15;
  int v16;
  void (*v17)(void *__return_ptr, uint64_t);
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  unsigned int v21;
  uint64_t v22;
  void v23[3];
  uint64_t v24;

  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
  swift_beginAccess();
  sub_10000C338(v1 + 48, (uint64_t)v23);
  if (v24)
  {
    if (swift_dynamicCast())
    {
      sub_10000C338(v1 + 48, (uint64_t)v23);
      if (v24)
      {
        if (swift_dynamicCast()) {
          int v6 = v22;
        }
        else {
          int v6 = 2;
        }
      }
      else
      {
        sub_100020B10((uint64_t)v23);
        int v6 = 2;
      }
      NSString v14 = *(void (**)(void *__return_ptr, uint64_t))(v1 + 16);
      id v15 = swift_retain();
      v14(v23, v15);
      swift_release();
      LODWORD(result) = swift_dynamicCast();
      NSString v16 = result;
      if (v6 == 2) {
        uint64_t result = result;
      }
      else {
        uint64_t result = 1;
      }
      if (v6 != 2)
      {
        if (v16) {
          uint64_t result = v22 ^ (v6 != 0);
        }
        else {
          uint64_t result = result;
        }
      }
LABEL_35:
      *(unsigned char *)(v1 + 113) = result;
      return result;
    }
  }
  else
  {
    sub_100020B10((uint64_t)v23);
  }
  sub_10000C338(v1 + 48, (uint64_t)v23);
  if (v24)
  {
    if (swift_dynamicCast())
    {
      sub_10000C338(v1 + 48, (uint64_t)v23);
      if (v24)
      {
        int v7 = swift_dynamicCast();
        if (v7) {
          uint64_t v8 = v22;
        }
        else {
          uint64_t v8 = 0;
        }
        char v9 = v7 ^ 1;
      }
      else
      {
        sub_100020B10((uint64_t)v23);
        uint64_t v8 = 0;
        char v9 = 1;
      }
      uint64_t v17 = *(void (**)(void *__return_ptr, uint64_t))(v1 + 16);
      uint64_t v18 = swift_retain();
      v17(v23, v18);
      swift_release();
      LODWORD(result) = swift_dynamicCast();
      int v19 = v22;
      if (!result) {
        int v19 = 0;
      }
      uint64_t v20 = v8 == v19;
      uint64_t v21 = result ^ 1;
      if (!v20) {
        uint64_t v21 = 1;
      }
      if (v9) {
        uint64_t result = result;
      }
      else {
        uint64_t result = v21;
      }
      goto LABEL_35;
    }
  }
  else
  {
    sub_100020B10((uint64_t)v23);
  }
  static Logger.daemonLogger.getter();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Could not get currentChanged. Unhandled type", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return *(unsigned __int8 *)(v1 + 113);
}

uint64_t sub_10002F2F8()
{
  swift_release();
  swift_release();
  sub_100020B10(v0 + 48);
  sub_100020B10(v0 + 80);
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 136, 7);
}

uint64_t type metadata accessor for Restriction()
{
  return self;
}

uint64_t sub_10002F374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (!a1)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
LABEL_16:
    sub_100020B10((uint64_t)&v25);
    goto LABEL_17;
  }
  if (*(void *)(a1 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v17 = sub_10001B688(0x65756C6156, 0xE500000000000000);
    if (v18)
    {
      sub_100020BCC(*(void *)(a1 + 56) + 32 * v17, (uint64_t)&v27);
    }
    else
    {
      long long v27 = 0u;
      long long v28 = 0u;
    }
    swift_bridgeObjectRelease();
    if (!*(void *)(a1 + 16)) {
      goto LABEL_12;
    }
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_12;
    }
  }
  unint64_t v19 = sub_10001B688(0x6465676E616843, 0xE700000000000000);
  if (v20)
  {
    sub_100020BCC(*(void *)(a1 + 56) + 32 * v19, (uint64_t)&v25);
    goto LABEL_13;
  }
LABEL_12:
  long long v25 = 0u;
  long long v26 = 0u;
LABEL_13:
  swift_bridgeObjectRelease();
  if (!*((void *)&v26 + 1)) {
    goto LABEL_16;
  }
  if (!swift_dynamicCast())
  {
LABEL_17:
    char v21 = 0;
    goto LABEL_18;
  }
  char v21 = v24[0];
LABEL_18:
  sub_100020BCC(a2, (uint64_t)&v25);
  sub_10000C338((uint64_t)&v27, (uint64_t)v24);
  type metadata accessor for Restriction();
  uint64_t v22 = swift_allocObject();
  sub_10002EEBC(&v25, (uint64_t)v24, v21, a3, a4, a5, a6, a7, a8, a9 & 1);
  sub_10000B304(a2);
  sub_100020B10((uint64_t)&v27);
  return v22;
}

char *sub_10002F550()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v30 = *(void *)(v1 - 8);
  uint64_t v31 = v1;
  __chkstk_darwin(v1);
  long long v28 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v3 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v6);
  uint64_t v7 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v7 - 8);
  *(void *)&v0[OBJC_IVAR____TtC13lockdownmoded10IDSManager_idsService] = 0;
  long long v26 = v0;
  uint64_t v27 = OBJC_IVAR____TtC13lockdownmoded10IDSManager_dispatchQueue;
  sub_10000B404(0, (unint64_t *)&qword_100041DA0);
  uint64_t v8 = v0;
  static DispatchQoS.userInitiated.getter();
  id v33 = &_swiftEmptyArrayStorage;
  sub_10003090C();
  sub_100005E0C(&qword_100041DB0);
  sub_100005E50();
  char v9 = v28;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v29);
  *(void *)&v26[v27] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v10 = &v8[OBJC_IVAR____TtC13lockdownmoded10IDSManager_delegate];
  *((void *)v10 + 4) = 0;
  *(_OWORD *)uint64_t v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;

  os_log_type_t v11 = (objc_class *)type metadata accessor for IDSManager();
  v32.receiver = v8;
  v32.super_class = v11;
  uint64_t v12 = (char *)objc_msgSendSuper2(&v32, "init");
  static Logger.daemonLogger.getter();
  unint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Initializing IDSManager…", v15, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v31);
  id v16 = objc_allocWithZone((Class)IDSService);
  NSString v17 = String._bridgeToObjectiveC()();
  id v18 = [v16 initWithService:v17];

  uint64_t v19 = OBJC_IVAR____TtC13lockdownmoded10IDSManager_idsService;
  char v20 = *(void **)&v12[OBJC_IVAR____TtC13lockdownmoded10IDSManager_idsService];
  *(void *)&v12[OBJC_IVAR____TtC13lockdownmoded10IDSManager_idsService] = v18;

  char v21 = *(void **)&v12[v19];
  if (v21)
  {
    uint64_t v22 = *(void *)&v12[OBJC_IVAR____TtC13lockdownmoded10IDSManager_dispatchQueue];
    id v23 = v21;
    [v23 addDelegate:v12 queue:v22];
  }
  return v12;
}

void *sub_10002F990()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13lockdownmoded10IDSManager_idsService);
  if (v1)
  {
    id v2 = [v1 devices];
    if (v2)
    {
      uint64_t v3 = v2;
      sub_10000B404(0, &qword_100042F88);
      unint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v4 >> 62) {
        goto LABEL_15;
      }
      uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      for (; v5; uint64_t v5 = _CocoaArrayWrapper.endIndex.getter())
      {
        uint64_t v6 = 4;
        while (1)
        {
          id v7 = (v4 & 0xC000000000000001) != 0
             ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
             : *(id *)(v4 + 8 * v6);
          uint64_t v8 = v7;
          uint64_t v9 = v6 - 3;
          if (__OFADD__(v6 - 4, 1)) {
            break;
          }
          if ([v7 isDefaultPairedDevice] && objc_msgSend(v8, "isActive"))
          {
            swift_bridgeObjectRelease_n();
            return v8;
          }

          ++v6;
          if (v9 == v5) {
            goto LABEL_16;
          }
        }
        __break(1u);
LABEL_15:
        swift_bridgeObjectRetain();
      }
LABEL_16:
      swift_bridgeObjectRelease_n();
    }
  }
  return 0;
}

void sub_10002FAF4()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC13lockdownmoded10IDSManager_idsService);
  if (v1)
  {
    id v2 = v1;
    v3.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    sub_100005E0C(&qword_100042F68);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100033750;
    uint64_t v5 = IDSCopyIDForDevice();
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v8 = v7;
    }
    else
    {
      uint64_t v8 = 0;
    }
    v18[1] = v8;
    sub_100005E0C(&qword_100042F70);
    sub_1000308A0();
    AnyHashable.init<A>(_:)();
    sub_100030230(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    Class isa = Set._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    sub_100004734((uint64_t)&_swiftEmptyArrayStorage);
    Class v10 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v17 = 0;
    v18[0] = 0;
    unsigned int v11 = [v2 sendMessage:v3.super.isa toDestinations:isa priority:300 options:v10 identifier:v18 error:&v17];

    uint64_t v12 = (void *)v18[0];
    if (v11)
    {
      id v13 = v17;
      id v14 = v12;
    }
    else
    {
      id v15 = v17;
      id v16 = v12;
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
  }
}

id sub_10002FD2C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IDSManager();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for IDSManager()
{
  return self;
}

void sub_10002FED4(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100005E0C(&qword_100042F90);
      NSDictionary v3 = (void *)static _SetStorage.allocate(capacity:)();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  NSDictionary v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = (char *)(v3 + 7);
  uint64_t v43 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)();
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        Swift::Int v12 = NSObject._rawHashValue(seed:)(v3[5]);
        uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)&v7[8 * v15] = v17 | v16;
        *(void *)(v3[6] + 8 * v14) = v11;
        uint64_t v23 = v3[2];
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        v3[2] = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_10000B404(0, &qword_100042458);
      id v18 = *(id *)(v3[6] + 8 * v14);
      char v19 = static NSObject.== infix(_:_:)();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(v3[6] + 8 * v14);
          char v22 = static NSObject.== infix(_:_:)();

          if (v22) {
            goto LABEL_11;
          }
        }
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v41 = a1 + 32;
  uint64_t v42 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(v41 + 8 * v25);
    Swift::Int v28 = NSObject._rawHashValue(seed:)(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_10000B404(0, &qword_100042458);
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = static NSObject.== infix(_:_:)();

      if (v35)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v36 = ~v29;
      while (1)
      {
        unint64_t v30 = (v30 + 1) & v36;
        unint64_t v31 = v30 >> 6;
        uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
        uint64_t v33 = 1 << v30;
        if ((v32 & (1 << v30)) == 0) {
          break;
        }
        id v37 = *(id *)(v3[6] + 8 * v30);
        char v38 = static NSObject.== infix(_:_:)();

        if (v38) {
          goto LABEL_24;
        }
      }
    }
    *(void *)&v7[8 * v31] = v33 | v32;
    *(void *)(v3[6] + 8 * v30) = v27;
    uint64_t v39 = v3[2];
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_38;
    }
    v3[2] = v40;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

Swift::Int sub_100030230(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100005E0C(&qword_100042F80);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      sub_100023ED8(v6 + 40 * v4, (uint64_t)v21);
      Swift::Int result = AnyHashable._rawHashValue(seed:)(*(void *)(v3 + 40));
      uint64_t v8 = ~(-1 << *(unsigned char *)(v3 + 32));
      unint64_t v9 = result & v8;
      unint64_t v10 = (result & (unint64_t)v8) >> 6;
      uint64_t v11 = *(void *)(v5 + 8 * v10);
      uint64_t v12 = 1 << (result & v8);
      if ((v12 & v11) != 0)
      {
        while (1)
        {
          sub_100023ED8(*(void *)(v3 + 48) + 40 * v9, (uint64_t)v20);
          char v13 = static AnyHashable.== infix(_:_:)();
          Swift::Int result = sub_100020B78((uint64_t)v20);
          if (v13) {
            break;
          }
          unint64_t v9 = (v9 + 1) & v8;
          unint64_t v10 = v9 >> 6;
          uint64_t v11 = *(void *)(v5 + 8 * (v9 >> 6));
          uint64_t v12 = 1 << v9;
          if ((v11 & (1 << v9)) == 0) {
            goto LABEL_8;
          }
        }
        sub_100020B78((uint64_t)v21);
      }
      else
      {
LABEL_8:
        *(void *)(v5 + 8 * v10) = v12 | v11;
        uint64_t v14 = *(void *)(v3 + 48) + 40 * v9;
        long long v15 = v21[0];
        long long v16 = v21[1];
        *(void *)(v14 + 32) = v22;
        *(_OWORD *)uint64_t v14 = v15;
        *(_OWORD *)(v14 + 16) = v16;
        uint64_t v17 = *(void *)(v3 + 16);
        BOOL v18 = __OFADD__(v17, 1);
        uint64_t v19 = v17 + 1;
        if (v18)
        {
          __break(1u);
          return result;
        }
        *(void *)(v3 + 16) = v19;
      }
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_100030398(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v34 = a1;
  uint64_t v35 = a2;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  char v13 = (char *)&v33 - v12;
  __chkstk_darwin(v11);
  long long v15 = (char *)&v33 - v14;
  static Logger.daemonLogger.getter();
  long long v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    BOOL v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Handling incoming message…", v18, 2u);
    swift_slowDealloc();
  }

  uint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v15, v6);
  uint64_t v20 = *(void **)(v4 + OBJC_IVAR____TtC13lockdownmoded10IDSManager_idsService);
  if (!v20
    || ((id v21 = v20, !a3) ? (v22 = 0) : (v22 = String._bridgeToObjectiveC()()),
        id v23 = [v20 deviceForFromID:v22],
        v20,
        v22,
        !v23))
  {
    Swift::Int v26 = (uint64_t (*)(char *, uint64_t))v19;
    static Logger.daemonLogger.getter();
    swift_bridgeObjectRetain_n();
    id v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      uint64_t result = swift_slowAlloc();
      v38[0] = result;
      *(_DWORD *)uint64_t v29 = 136446210;
      if (!a3)
      {
        __break(1u);
LABEL_20:
        __break(1u);
        return result;
      }
      swift_bridgeObjectRetain();
      *(void *)&long long v36 = sub_10001AE5C(v35, a3, v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Incoming message is from an unknown device: %{public}s", v29, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return v26(v13, v6);
  }

  uint64_t v24 = v4 + OBJC_IVAR____TtC13lockdownmoded10IDSManager_delegate;
  swift_beginAccess();
  sub_1000307D8(v24, (uint64_t)&v36);
  if (v37)
  {
    sub_10000B2A8(&v36, (uint64_t)v38);
    uint64_t result = (uint64_t)sub_10000B2C0(v38, v38[3]);
    if (v34)
    {
      sub_100019D70(v34);
      return sub_10000B304((uint64_t)v38);
    }
    goto LABEL_20;
  }
  sub_100030840((uint64_t)&v36);
  static Logger.daemonLogger.getter();
  unint64_t v30 = Logger.logObject.getter();
  os_log_type_t v31 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v32 = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, v31, "Incoming message is not handled because delegate is not set", v32, 2u);
    swift_slowDealloc();
  }

  return ((uint64_t (*)(char *, uint64_t))v19)(v10, v6);
}

uint64_t sub_1000307D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100005E0C(&qword_1000426E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100030840(uint64_t a1)
{
  uint64_t v2 = sub_100005E0C(&qword_1000426E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000308A0()
{
  unint64_t result = qword_100042F78;
  if (!qword_100042F78)
  {
    sub_100005EAC(&qword_100042F70);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100042F78);
  }
  return result;
}

unint64_t sub_10003090C()
{
  unint64_t result = qword_100041DA8;
  if (!qword_100041DA8)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100041DA8);
  }
  return result;
}

void *acm_mem_alloc_data(size_t size)
{
  unint64_t result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result) {
    qword_100044128 += size;
  }
  return result;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    uint64_t v4 = qword_100044128 - __n;
    if (qword_100044128 < __n) {
      uint64_t v4 = 0;
    }
    qword_100044128 = v4;
  }
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2) {
    qword_100044120 += a3;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    uint64_t v6 = "NULL";
    if (result) {
      uint64_t v7 = result;
    }
    else {
      uint64_t v7 = "NULL";
    }
    if (a4) {
      uint64_t v8 = a4;
    }
    else {
      uint64_t v8 = "NULL";
    }
    if (a6) {
      uint64_t v6 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, qword_100044120, 0, qword_100044128, qword_100044130, v8, a5, v6);
  }
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  if (a2)
  {
    uint64_t v6 = qword_100044120 - a3;
    if (qword_100044120 < a3) {
      uint64_t v6 = 0;
    }
    qword_100044120 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    uint64_t v7 = "NULL";
    if (result) {
      uint64_t v8 = result;
    }
    else {
      uint64_t v8 = "NULL";
    }
    if (a4) {
      uint64_t v9 = a4;
    }
    else {
      uint64_t v9 = "NULL";
    }
    if (a6) {
      uint64_t v7 = a6;
    }
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, qword_100044120, 0, qword_100044128, qword_100044130, v9, a5, v7);
  }
  return result;
}

uint64_t LibCall_ACMKernelControl_Block(uint64_t a1)
{
  uint64_t v1 = __chkstk_darwin(a1);
  uint64_t v3 = v2;
  size_t v5 = v4;
  uint64_t v7 = v6;
  int v9 = v8;
  uint64_t v11 = v10;
  uint64_t v12 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))v1;
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl_Block");
  }
  uint64_t v17 = 0x2000;
  uint64_t v13 = LibCall_ACMKernelControl(v12, v11, v9, v7, v5, (uint64_t)v18, (uint64_t)&v17);
  if (v3)
  {
    if (v17) {
      uint64_t v14 = v18;
    }
    else {
      uint64_t v14 = 0;
    }
    (*(void (**)(uint64_t, unsigned char *))(v3 + 16))(v3, v14);
  }
  if (v13) {
    unsigned int v15 = 70;
  }
  else {
    unsigned int v15 = 10;
  }
  if (v15 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl_Block", (int)v13);
  }
  return v13;
}

uint64_t sub_100030CBC(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  if (byte_100042F99 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315394;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    id v21 = "ioKitTransport";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    uint64_t v14 = sub_100030E9C();
    unsigned int v15 = 70;
    if (v14)
    {
      uint64_t v16 = v14;
    }
    else
    {
      uint64_t v16 = sub_100031080(*a1, a2, a3, a4, a5, a6, a7);
      if (v16) {
        unsigned int v15 = 70;
      }
      else {
        unsigned int v15 = 10;
      }
    }
  }
  else
  {
    unsigned int v15 = 70;
    uint64_t v16 = 4294967293;
  }
  if (v15 >= byte_100042F99 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v18 = 136315650;
    uint64_t v19 = "ACMLib";
    __int16 v20 = 2080;
    id v21 = "ioKitTransport";
    __int16 v22 = 2048;
    uint64_t v23 = (int)v16;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

uint64_t sub_100030E9C()
{
  if (byte_100042F99 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    uint64_t v7 = "ACMLib";
    __int16 v8 = 2080;
    int v9 = "init";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v6, 0x16u);
  }
  if (byte_10004413C)
  {
    uint64_t v0 = 0;
  }
  else
  {
    CFDictionaryRef v1 = IOServiceMatching("AppleCredentialManager");
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v1);
    if (!MatchingService)
    {
      unsigned int v4 = 70;
      uint64_t v0 = 4294967291;
      goto LABEL_10;
    }
    io_object_t v3 = MatchingService;
    uint64_t v0 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_100044138);
    if (v0)
    {
      unsigned int v4 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v3);
    byte_10004413C = 1;
  }
  unsigned int v4 = 10;
LABEL_10:
  if (v4 >= byte_100042F99 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    uint64_t v7 = "ACMLib";
    __int16 v8 = 2080;
    int v9 = "init";
    __int16 v10 = 2048;
    uint64_t v11 = (int)v0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v6, 0x20u);
  }
  return v0;
}

uint64_t sub_100031080(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  if (byte_100042F99 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v25 = "ACMLib";
    __int16 v26 = 2080;
    id v27 = "performCommand";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  size_t inputStructCnt = 0;
  uint64_t v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    unsigned int v15 = v14;
    if (!a6 && a7)
    {
      uint64_t v18 = 4294967293;
    }
    else
    {
      if (a7) {
        size_t v16 = *a7;
      }
      else {
        size_t v16 = 0;
      }
      size_t v22 = v16;
      uint64_t v17 = IOConnectCallStructMethod(dword_100044138, 0, v14, inputStructCnt, a6, &v22);
      uint64_t v18 = v17;
      if (a1) {
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      }
      if (v17)
      {
        if (byte_100042F99 <= 0x46u
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v25 = "ACMLib";
          __int16 v26 = 2080;
          id v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)uint64_t v29 = a2;
          *(_WORD *)&uint64_t v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          __int16 v30 = 1024;
          int v31 = v18;
          __int16 v32 = 1024;
          int v33 = v18;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (byte_100042F99 <= 0x28u
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v25 = "ACMLib";
          __int16 v26 = 2080;
          id v27 = "performCommand";
          __int16 v28 = 1024;
          *(_DWORD *)uint64_t v29 = a2;
          *(_WORD *)&uint64_t v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        uint64_t v18 = 0;
        if (a7) {
          *a7 = v22;
        }
      }
    }
    size_t v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if (v18) {
      unsigned int v20 = 70;
    }
    else {
      unsigned int v20 = 10;
    }
  }
  else
  {
    unsigned int v20 = 70;
    uint64_t v18 = 4294967291;
  }
  if (v20 >= byte_100042F99 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v25 = "ACMLib";
    __int16 v26 = 2080;
    id v27 = "performCommand";
    __int16 v28 = 2048;
    *(void *)uint64_t v29 = (int)v18;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

uint64_t ACMKernelControl(int a1)
{
  if (byte_100042F99 <= 0xAu && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    __int16 v8 = "ACMKernelControl";
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  uint64_t v2 = LibCall_ACMKernelControl_Block((uint64_t)sub_100030CBC);
  if (v2) {
    unsigned int v3 = 70;
  }
  else {
    unsigned int v3 = 10;
  }
  if (v3 >= byte_100042F99 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    int v6 = "ACMLib";
    __int16 v7 = 2080;
    __int16 v8 = "ACMKernelControl";
    __int16 v9 = 2048;
    uint64_t v10 = (int)v2;
    __int16 v11 = 1024;
    int v12 = a1;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld, code=%u.\n", buf, 0x26u);
  }
  return v2;
}

unsigned char *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, void *a6)
{
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  }
  int v12 = 0;
  if (a5) {
    BOOL v13 = a4 == 0;
  }
  else {
    BOOL v13 = 0;
  }
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      int v12 = 0;
    }
    else
    {
      int v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)int v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5) {
          memcpy(v12 + 8, a4, a5);
        }
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu) {
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  }
  return v12;
}

uint64_t LibCall_ACMKernelControl(uint64_t (*a1)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t), uint64_t a2, int a3, const void *a4, size_t a5, uint64_t a6, uint64_t a7)
{
  BOOL v13 = a1;
  if (gACMLoggingLevel <= 0xAu) {
    a1 = (uint64_t (*)(uint64_t, uint64_t, void, char *, size_t, uint64_t, uint64_t))printf("%s: %s: called.\n", "ACM", "LibCall_ACMKernelControl");
  }
  if (!v13) {
    goto LABEL_16;
  }
  BOOL v14 = a5 != 0;
  if (a4) {
    BOOL v14 = a5 - 4097 < 0xFFFFFFFFFFFFF000;
  }
  if (v14)
  {
LABEL_16:
    unsigned int v18 = 70;
    uint64_t v17 = 4294967293;
  }
  else
  {
    uint64_t v20 = (uint64_t)&v20;
    __chkstk_darwin(a1);
    unsigned int v15 = (_DWORD *)((char *)&v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0));
    *unsigned int v15 = a3;
    size_t v16 = v15 + 1;
    if (a5)
    {
      memcpy(v15 + 1, a4, a5);
      size_t v16 = (_DWORD *)((char *)v16 + a5);
    }
    if (v16 != (_DWORD *)((char *)v15 + a5 + 4)) {
      sub_1000318E4();
    }
    uint64_t v17 = v13(a2, 26, 0, (char *)&v20 - ((a5 + 19) & 0xFFFFFFFFFFFFFFF0), a5 + 4, a6, a7);
    if (v17) {
      unsigned int v18 = 70;
    }
    else {
      unsigned int v18 = 10;
    }
  }
  if (v18 >= gACMLoggingLevel) {
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMKernelControl", (int)v17);
  }
  return v17;
}

void sub_1000318E4()
{
  __assert_rtn("LibCall_ACMKernelControl", "LibCall.c", 373, "commandCursor == commandBuffer + sizeof(commandBuffer)");
}

uint64_t LocalizedError.helpAnchor.getter()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t LocalizedError.failureReason.getter()
{
  return LocalizedError.failureReason.getter();
}

uint64_t LocalizedError.recoverySuggestion.getter()
{
  return LocalizedError.recoverySuggestion.getter();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._countAndFlagsBits = v5;
  return result;
}

uint64_t static _ErrorCodeProtocol.~= infix(_:_:)()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t URL.path.getter()
{
  return URL.path.getter();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Data.init(contentsOf:options:)()
{
  return Data.init(contentsOf:options:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t Date.timeIntervalSince1970.getter()
{
  return Date.timeIntervalSince1970.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
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

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t static LockdownModeXNU.lockdownModeEnabled.getter()
{
  return static LockdownModeXNU.lockdownModeEnabled.getter();
}

uint64_t type metadata accessor for LockdownModeXNU()
{
  return type metadata accessor for LockdownModeXNU();
}

uint64_t static Constants.serviceName.getter()
{
  return static Constants.serviceName.getter();
}

uint64_t static Constants.userDefaultsKey.getter()
{
  return static Constants.userDefaultsKey.getter();
}

uint64_t static Constants.stateOptionReboot.getter()
{
  return static Constants.stateOptionReboot.getter();
}

uint64_t static Constants.stateOptionPasscode.getter()
{
  return static Constants.stateOptionPasscode.getter();
}

uint64_t static Constants.stateOptionAllDevices.getter()
{
  return static Constants.stateOptionAllDevices.getter();
}

uint64_t static Constants.stateOptionIncludePaired.getter()
{
  return static Constants.stateOptionIncludePaired.getter();
}

uint64_t static Constants.stateOptionAcknowledgementOnly.getter()
{
  return static Constants.stateOptionAcknowledgementOnly.getter();
}

uint64_t static Constants.stateOptionExcludeRestrictions.getter()
{
  return static Constants.stateOptionExcludeRestrictions.getter();
}

uint64_t static Constants.stateOptionRequireAuthentication.getter()
{
  return static Constants.stateOptionRequireAuthentication.getter();
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

uint64_t static Logger.daemonLogger.getter()
{
  return static Logger.daemonLogger.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t XPC_TYPE_ERROR.getter()
{
  return XPC_TYPE_ERROR.getter();
}

uint64_t XPC_EVENT_KEY_NAME.getter()
{
  return XPC_EVENT_KEY_NAME.getter();
}

uint64_t static DispatchTimeoutResult.== infix(_:_:)()
{
  return static DispatchTimeoutResult.== infix(_:_:)();
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

uint64_t static DispatchQoS.userInitiated.getter()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t static DispatchQoS.utility.getter()
{
  return static DispatchQoS.utility.getter();
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

uint64_t + infix(_:_:)()
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

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
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

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
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

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

Swift::Bool __swiftcall String.hasPrefix(_:)(Swift::String a1)
{
  return String.hasPrefix(_:)(a1._countAndFlagsBits, a1._object);
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

NSNumber __swiftcall Bool._bridgeToObjectiveC()()
{
  return (NSNumber)Bool._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t Double.description.getter()
{
  return Double.description.getter();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
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

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t OS_dispatch_semaphore.wait(timeout:)()
{
  return OS_dispatch_semaphore.wait(timeout:)();
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
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

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)()
{
  return _diagnoseUnexpectedEnumCaseValue<A, B>(type:rawValue:)();
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

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return static Hasher._hash(seed:bytes:count:)();
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

uint64_t AMFIIsDeveloperModeEnabled()
{
  return _AMFIIsDeveloperModeEnabled();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
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

uint64_t IDSCopyIDForDevice()
{
  return _IDSCopyIDForDevice();
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return _IOConnectCallStructMethod(connection, selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return _IOServiceOpen(service, owningTask, type, connect);
}

uint64_t MGGetStringAnswer()
{
  return _MGGetStringAnswer();
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return __CFXPCCreateXPCMessageWithCFObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
}

uint64_t lockdown_reset_pairing()
{
  return _lockdown_reset_pairing();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return _memset_s(__s, __smax, __c, __n);
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

int printf(const char *a1, ...)
{
  return _printf(a1);
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return _swift_dynamicCastUnknownClassUnconditional();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return _swift_stdlib_isStackAllocationSafe();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}