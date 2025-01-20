int main(int argc, const char **argv, const char **envp)
{
  main()();
}

uint64_t sub_100001D94(uint64_t a1, uint64_t a2)
{
  uint64_t v18 = a2;
  uint64_t v19 = a1;
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = v2 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon12Dependencies_container;
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v11(v2 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon12Dependencies_container, a1, v5);
  sub_1000033E4();
  uint64_t v12 = *(void *)(a2 + 16);
  swift_getObjectType();
  swift_unknownObjectRetain();
  id v13 = sub_100003424(0xD000000000000020, 0x800000010002D1F0, v12);
  type metadata accessor for ASEMetrics();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  id v15 = v13;
  objc_msgSend(v15, "setFlushTimerEnabled:", 0, v18);
  [v15 setIncludeMMeClientInfoAndDeviceHeaders:1];
  [v15 setMetricsSigningFlavour:1];
  v11((uint64_t)v9, v10, v5);
  type metadata accessor for InstallationEventManager();
  uint64_t v16 = swift_allocObject();
  swift_defaultActor_initialize();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v16 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon24InstallationEventManager_container, v9, v5);
  *(void *)(v16 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon24InstallationEventManager_aseMetrics) = v14;

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v19, v5);
  *(void *)(v2 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon12Dependencies_eventManager) = v16;
  return v2;
}

uint64_t sub_100001FD0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon12Dependencies_container;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return swift_deallocClassInstance();
}

void sub_100002080(uint64_t a1@<X8>)
{
  uint64_t v45 = a1;
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v4 = __chkstk_darwin(v1, v3);
  uint64_t v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v7);
  v9 = (char *)&v40 - v8;
  uint64_t v10 = sub_1000034A8(&qword_1000398E0);
  __chkstk_darwin(v10 - 8, v11);
  id v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for URL();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14, v16);
  uint64_t v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v48 = 0;
  uint64_t v19 = container_system_path_for_identifier();
  v46 = (void *)v19;
  if (v48 <= 1 && v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
    URL.init(fileURLWithFileSystemRepresentation:isDirectory:relativeTo:)();
    sub_1000034EC((uint64_t)v13);
    if ((sub_10000F600() & 1) == 0)
    {
      static Logger.general.getter();
      v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.default.getter();
      int v22 = v21;
      if (os_log_type_enabled(v20, v21))
      {
        os_log_t v44 = v20;
        uint64_t v23 = swift_slowAlloc();
        int v42 = v22;
        v24 = (uint8_t *)v23;
        uint64_t v43 = swift_slowAlloc();
        v49[0] = v43;
        v41 = v24;
        *(_DWORD *)v24 = 136315138;
        v40 = v24 + 4;
        swift_beginAccess();
        sub_100002FB4(&qword_1000398F0, (void (*)(uint64_t))&type metadata accessor for URL);
        uint64_t v25 = dispatch thunk of CustomStringConvertible.description.getter();
        id v47 = (id)sub_10001FB10(v25, v26, (uint64_t *)v49);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v44, (os_log_type_t)v42, "Updating %s to exclude from backup", v41, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(char *, uint64_t))(v2 + 8))(v9, v1);
      swift_beginAccess();
      sub_10000FA94(1);
      swift_endAccess();
    }
    id v33 = [self defaultManager];
    swift_beginAccess();
    URL._bridgeToObjectiveC()(v34);
    v36 = v35;
    id v47 = 0;
    unsigned __int8 v37 = [v33 createDirectoryAtURL:v35 withIntermediateDirectories:1 attributes:0 error:&v47];

    id v38 = v47;
    if (v37)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 16))(v45, v18, v14);
    }
    else
    {
      v39 = v38;
      _convertNSErrorToError(_:)();

      swift_willThrow();
    }
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    v32 = v46;
LABEL_16:
    free(v32);
    return;
  }
  static Logger.general.getter();
  v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v29 = 134217984;
    swift_beginAccess();
    v49[0] = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Unable to obtain container path: error %llu", v29, 0xCu);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v2 + 8))(v6, v1);
  swift_beginAccess();
  unint64_t v30 = v48;
  type metadata accessor for container_error_t(0);
  sub_100002FB4(&qword_1000398E8, type metadata accessor for container_error_t);
  swift_allocError();
  unint64_t *v31 = v30;
  swift_willThrow();
  v32 = v46;
  if (v46) {
    goto LABEL_16;
  }
}

uint64_t sub_1000026BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002FB4(&qword_1000398C8, type metadata accessor for container_error_t);
  unint64_t v5 = sub_100003390();
  return Error<>._code.getter(a1, a2, v4, v5);
}

uint64_t sub_10000274C()
{
  return type metadata accessor for Dependencies();
}

uint64_t type metadata accessor for Dependencies()
{
  uint64_t result = qword_100039798;
  if (!qword_100039798) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000027A0()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

__n128 sub_10000283C(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000284C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10000286C(uint64_t result, int a2, int a3)
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

void type metadata accessor for os_activity_scope_state_s(uint64_t a1)
{
}

void type metadata accessor for AMSBagKey(uint64_t a1)
{
}

void type metadata accessor for container_error_t(uint64_t a1)
{
}

uint64_t sub_1000028D0(uint64_t a1, uint64_t a2)
{
  return sub_1000031B0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_1000028F4(uint64_t a1, uint64_t a2)
{
  return sub_1000031B0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100002914(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_10000298C(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100002A0C@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100002A50(uint64_t a1)
{
  uint64_t v2 = sub_100002FB4(&qword_100039950, type metadata accessor for AMSError);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100002ABC(uint64_t a1)
{
  uint64_t v2 = sub_100002FB4(&qword_100039950, type metadata accessor for AMSError);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_100002B28(uint64_t a1)
{
  uint64_t v2 = sub_100002FB4(&qword_100039948, type metadata accessor for AMSError);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

id sub_100002B94()
{
  return *v0;
}

uint64_t sub_100002B9C@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_100002BA8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100002BB8(uint64_t a1)
{
  uint64_t v2 = sub_100002FB4(&qword_100039948, type metadata accessor for AMSError);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100002C24(uint64_t a1)
{
  uint64_t v2 = sub_100002FB4(&qword_100039948, type metadata accessor for AMSError);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100002C90(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_100002FB4(&qword_100039948, type metadata accessor for AMSError);
  id v5 = a1;
  return _BridgedStoredNSError.init(_bridgedNSError:)(v5, a2, v4);
}

uint64_t sub_100002D20()
{
  id v1 = *v0;
  uint64_t v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100002D58(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002FB4(&qword_100039948, type metadata accessor for AMSError);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_100002DD4()
{
  return Hasher._finalize()();
}

void *sub_100002E34@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_100002E44(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_100002E50(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_100002E68(uint64_t a1)
{
  uint64_t v2 = sub_100002FB4(&qword_1000398B8, type metadata accessor for AMSBagKey);
  uint64_t v3 = sub_100002FB4(&qword_1000398C0, type metadata accessor for AMSBagKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100002F24()
{
  return sub_100002FB4(&qword_1000398A0, type metadata accessor for AMSBagKey);
}

uint64_t sub_100002F6C()
{
  return sub_100002FB4(&qword_1000398A8, type metadata accessor for AMSBagKey);
}

uint64_t sub_100002FB4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100002FFC@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003044@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003070(uint64_t a1)
{
  uint64_t v2 = sub_100002FB4((unint64_t *)&qword_100039990, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_100002FB4(&qword_100039998, type metadata accessor for URLResourceKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000312C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100002FB4(&qword_100039948, type metadata accessor for AMSError);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_1000031B0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1000031F4()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003248()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000032BC()
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

uint64_t sub_100003348()
{
  return sub_100002FB4(&qword_1000398B0, type metadata accessor for AMSBagKey);
}

unint64_t sub_100003390()
{
  unint64_t result = qword_1000398D0;
  if (!qword_1000398D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000398D0);
  }
  return result;
}

unint64_t sub_1000033E4()
{
  unint64_t result = qword_1000398D8;
  if (!qword_1000398D8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000398D8);
  }
  return result;
}

id sub_100003424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithContainerID:v5 bag:a3];

  swift_unknownObjectRelease();
  return v6;
}

uint64_t sub_1000034A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000034EC(uint64_t a1)
{
  uint64_t v2 = sub_1000034A8(&qword_1000398E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t initializeBufferWithCopyOfBuffer for EntitlementVerification.Entitlement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_1000035E4(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000035F0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100003610(uint64_t result, int a2, int a3)
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

void type metadata accessor for audit_token_t(uint64_t a1)
{
}

uint64_t sub_100003650()
{
  return sub_100002FB4(&qword_100039928, type metadata accessor for URLResourceKey);
}

uint64_t sub_100003698()
{
  return sub_100002FB4(&qword_100039930, type metadata accessor for URLResourceKey);
}

uint64_t sub_1000036E0()
{
  return sub_100002FB4(&qword_100039938, type metadata accessor for URLResourceKey);
}

uint64_t sub_100003728()
{
  return sub_100002FB4(&qword_100039940, type metadata accessor for Code);
}

uint64_t sub_100003770()
{
  return sub_100002FB4(&qword_100039948, type metadata accessor for AMSError);
}

void type metadata accessor for AMSError(uint64_t a1)
{
}

void sub_1000037CC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100003814()
{
  return sub_100002FB4(&qword_100039950, type metadata accessor for AMSError);
}

uint64_t sub_10000385C()
{
  return sub_100002FB4(&qword_100039958, type metadata accessor for AMSError);
}

uint64_t sub_1000038A4()
{
  return sub_100002FB4((unint64_t *)&unk_100039960, type metadata accessor for AMSError);
}

uint64_t sub_1000038EC()
{
  return sub_100002FB4(&qword_10003A5A0, type metadata accessor for Code);
}

uint64_t sub_100003934()
{
  return sub_100002FB4(&qword_100039970, type metadata accessor for Code);
}

unint64_t sub_100003980()
{
  unint64_t result = qword_100039978;
  if (!qword_100039978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039978);
  }
  return result;
}

uint64_t sub_1000039D4()
{
  return sub_100002FB4(&qword_100039980, type metadata accessor for AMSError);
}

uint64_t sub_100003A1C()
{
  return sub_100002FB4(&qword_100039988, type metadata accessor for AMSError);
}

void sub_100003A74()
{
  qword_100039A10 = 0x40F5180000000000;
}

uint64_t sub_100003A88(uint64_t a1, uint64_t a2)
{
  v3[26] = a2;
  v3[27] = v2;
  v3[25] = a1;
  uint64_t v4 = sub_1000034A8(&qword_100039B58);
  v3[28] = v4;
  v3[29] = *(void *)(v4 - 8);
  v3[30] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for Logger();
  v3[31] = v5;
  v3[32] = *(void *)(v5 - 8);
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  v3[35] = swift_task_alloc();
  v3[36] = swift_task_alloc();
  return _swift_task_switch(sub_100003BD4, 0, 0);
}

uint64_t sub_100003BD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0 + 25;
  char v3 = v0 + 22;
  uint64_t v4 = (void *)v0[26];
  static Logger.metrics.getter();
  id v5 = v4;
  swift_bridgeObjectRetain_n();
  id v6 = v5;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v57 = v7;
    unint64_t v10 = v1[25];
    v9 = (void *)v1[26];
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412546;
    v1[24] = v9;
    id v13 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v12 = v9;

    *(_WORD *)(v11 + 12) = 2050;
    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v14 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v14 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v7 = v57;
    swift_bridgeObjectRelease();
    *(v2 - 4) = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v57, v8, "[%@] Preparing to enqueue %{public}ld events", (uint8_t *)v11, 0x16u);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v15 = (void *)v1[26];
    swift_bridgeObjectRelease_n();
  }
  uint64_t v16 = v1[36];
  uint64_t v17 = v1[31];
  uint64_t v18 = v1[32];
  uint64_t v19 = (void *)v1[26];
  unint64_t v20 = v1[25];
  os_log_type_t v21 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v1[37] = v21;
  v1[38] = (v18 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v21(v16, v17);
  id v22 = v19;
  swift_retain();
  unint64_t v23 = (unint64_t)sub_10000A278(v20, v22);

  swift_release();
  if (v23 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v43 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    v24 = (void *)v1[26];
    if (v43) {
      goto LABEL_8;
    }
  }
  else
  {
    v24 = (void *)v1[26];
    if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_8:
      v58 = v21;
      static Logger.metrics.getter();
      id v25 = v24;
      swift_bridgeObjectRetain_n();
      id v26 = v25;
      v27 = Logger.logObject.getter();
      os_log_type_t v28 = static os_log_type_t.default.getter();
      BOOL v29 = os_log_type_enabled(v27, v28);
      unint64_t v30 = (void *)v1[26];
      if (v29)
      {
        os_log_type_t v55 = v28;
        log = v27;
        uint64_t v31 = swift_slowAlloc();
        v32 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v31 = 138412546;
        v1[18] = v30;
        id v33 = v30;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v32 = v30;

        *(_WORD *)(v31 + 12) = 2050;
        if (v23 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v34 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v34 = *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        *char v3 = v34;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v27 = log;
        _os_log_impl((void *)&_mh_execute_header, log, v55, "[%@] Enqueueing %{public}ld events", (uint8_t *)v31, 0x16u);
        sub_1000034A8(&qword_10003A3A0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
      }
      uint64_t v35 = v1[30];
      uint64_t v36 = v1[28];
      uint64_t v37 = v1[29];
      uint64_t v38 = v1[27];
      v58(v1[34], v1[31]);
      v39 = *(void **)(v38 + 16);
      sub_10000D48C(0, &qword_100039B60);
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      id v41 = [v39 promiseForEnqueueingEvents:isa];
      v1[39] = v41;

      v1[2] = v1;
      v1[7] = v1 + 42;
      v1[3] = sub_1000043CC;
      swift_continuation_init();
      v1[17] = v36;
      int v42 = sub_10000D090(v1 + 14);
      sub_1000034A8(&qword_10003A390);
      CheckedContinuation.init(continuation:function:)();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v37 + 32))(v42, v35, v36);
      v1[10] = _NSConcreteStackBlock;
      v1[11] = 1107296256;
      v1[12] = sub_100006E90;
      v1[13] = &unk_100035918;
      [v41 resultWithTimeout:v1 + 10 completion:120.0];
      return _swift_continuation_await(v1 + 2);
    }
  }
  swift_bridgeObjectRelease();
  static Logger.metrics.getter();
  id v44 = v24;
  uint64_t v45 = Logger.logObject.getter();
  os_log_type_t v46 = static os_log_type_t.default.getter();
  BOOL v47 = os_log_type_enabled(v45, v46);
  unint64_t v48 = (void *)v1[26];
  if (v47)
  {
    v49 = (uint8_t *)swift_slowAlloc();
    v59 = (void *)swift_slowAlloc();
    *(_DWORD *)v49 = 138412290;
    v1[23] = v48;
    id v50 = v48;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v59 = v48;

    _os_log_impl((void *)&_mh_execute_header, v45, v46, "[%@] No AMSMetricsEvents to enqueue", v49, 0xCu);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    uint64_t v45 = v1[26];
  }
  uint64_t v51 = v1[35];
  uint64_t v52 = v1[31];

  v21(v51, v52);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v53 = (uint64_t (*)(void))v1[1];
  return v53();
}

uint64_t sub_1000043CC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 320) = v1;
  if (v1) {
    uint64_t v2 = sub_100004704;
  }
  else {
    uint64_t v2 = sub_1000044DC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000044DC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 328) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100004570;
  uint64_t v2 = *(void *)(v0 + 208);
  return sub_100020BB0(v2);
}

uint64_t sub_100004570()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_10000466C, 0, 0);
}

uint64_t sub_10000466C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100004704()
{
  uint64_t v1 = *(void **)(v0 + 208);
  swift_willThrow();
  static Logger.metrics.getter();
  id v2 = v1;
  swift_errorRetain();
  id v3 = v2;
  swift_errorRetain();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v15 = *(void **)(v0 + 312);
    id v6 = *(void **)(v0 + 208);
    log = v4;
    uint64_t v7 = swift_slowAlloc();
    os_log_type_t v8 = (void *)swift_slowAlloc();
    *(void *)(v0 + 152) = v6;
    *(_DWORD *)uint64_t v7 = 138412546;
    id v9 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_type_t v8 = v6;

    *(_WORD *)(v7 + 12) = 2114;
    swift_errorRetain();
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 160) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v8[1] = v10;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v5, "[%@] Failed to enqueue events due to error: %{public}@", (uint8_t *)v7, 0x16u);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    uint64_t v11 = *(void **)(v0 + 208);

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(void, void))(v0 + 296))(*(void *)(v0 + 264), *(void *)(v0 + 248));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
  return v12();
}

uint64_t sub_100004994()
{
  *(void *)(v1 + 40) = v0;
  return _swift_task_switch(sub_1000049B4, v0, 0);
}

uint64_t sub_1000049B4()
{
  uint64_t v1 = (objc_class *)type metadata accessor for LogKey();
  id v2 = objc_allocWithZone(v1);
  v0[2].receiver = 0;
  id v3 = (char *)v2;
  swift_stdlib_random();
  uint64_t v4 = &v3[OBJC_IVAR____TtC28AppInstallationMetricsDaemon6LogKey_representation];
  *(void *)uint64_t v4 = ((uint64_t)v0[2].receiver << 32) | 1;
  *((void *)v4 + 1) = 0;
  v4[16] = 0;

  v0[1].receiver = v3;
  v0[1].super_class = v1;
  id v5 = objc_msgSendSuper2(v0 + 1, "init");
  v0[3].receiver = v5;
  id v6 = (objc_class *)swift_task_alloc();
  v0[3].super_class = v6;
  *(void *)id v6 = v0;
  *((void *)v6 + 1) = sub_100004AD0;
  return sub_100020BB0((uint64_t)v5);
}

uint64_t sub_100004AD0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 40);
  swift_task_dealloc();
  return _swift_task_switch(sub_100004BE0, v1, 0);
}

uint64_t sub_100004BE0()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100004C40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v6[22] = a5;
  v6[23] = v5;
  v6[20] = a2;
  v6[21] = a3;
  v6[19] = a1;
  uint64_t v7 = type metadata accessor for AppInstallationEvent();
  v6[24] = v7;
  v6[25] = *(void *)(v7 - 8);
  v6[26] = swift_task_alloc();
  v6[27] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for Logger();
  v6[28] = v8;
  v6[29] = *(void *)(v8 - 8);
  v6[30] = swift_task_alloc();
  v6[31] = swift_task_alloc();
  v6[32] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for AppInstallationEligibility();
  v6[33] = v9;
  v6[34] = *(void *)(v9 - 8);
  v6[35] = swift_task_alloc();
  v6[36] = swift_task_alloc();
  v6[37] = swift_task_alloc();
  v6[38] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for InstallationEvent();
  v6[39] = v10;
  v6[40] = *(void *)(v10 - 8);
  v6[41] = swift_task_alloc();
  v6[42] = swift_task_alloc();
  v6[43] = swift_task_alloc();
  uint64_t v11 = type metadata accessor for Date();
  v6[44] = v11;
  v6[45] = *(void *)(v11 - 8);
  v6[46] = swift_task_alloc();
  v6[47] = swift_task_alloc();
  v6[48] = swift_task_alloc();
  uint64_t v12 = type metadata accessor for UUID();
  v6[49] = v12;
  v6[50] = *(void *)(v12 - 8);
  v6[51] = swift_task_alloc();
  uint64_t v13 = type metadata accessor for AppInstallType();
  v6[52] = v13;
  v6[53] = *(void *)(v13 - 8);
  v6[54] = swift_task_alloc();
  return _swift_task_switch(sub_100004FBC, v5, 0);
}

uint64_t sub_100004FBC()
{
  v53 = v0;
  uint64_t v2 = v0[53];
  uint64_t v1 = v0[54];
  uint64_t v3 = v0[52];
  AppInstallationEvent.installType.getter();
  char v4 = sub_10000F378();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[55] = v5;
  v0[56] = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v5(v1, v3);
  if (v4)
  {
    id v6 = (void *)swift_task_alloc();
    v0[57] = v6;
    *id v6 = v0;
    v6[1] = sub_10000553C;
    uint64_t v7 = v0[22];
    uint64_t v8 = v0[19];
    return sub_10000B874((uint64_t)(v0 + 2), v8, v7);
  }
  else
  {
    id v50 = v5;
    uint64_t v11 = v0[26];
    uint64_t v10 = v0[27];
    uint64_t v12 = v0[24];
    uint64_t v13 = v0[25];
    uint64_t v14 = (void *)v0[22];
    uint64_t v15 = v0[19];
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    static Logger.events.getter();
    uint64_t v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16);
    v16(v10, v15, v12);
    v16(v11, v15, v12);
    id v17 = v14;
    uint64_t v18 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v18, v19))
    {
      uint64_t v45 = v0[52];
      uint64_t v47 = v0[29];
      uint64_t v20 = v0[27];
      uint64_t v48 = v0[28];
      uint64_t v49 = v0[30];
      uint64_t v41 = v0[26];
      uint64_t v42 = v0[54];
      uint64_t v51 = v0[25];
      uint64_t v40 = v0[24];
      log = v18;
      os_log_type_t v21 = (void *)v0[22];
      uint64_t v22 = swift_slowAlloc();
      uint64_t v43 = (void *)swift_slowAlloc();
      uint64_t v52 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 138412802;
      os_log_type_t type = v19;
      v0[15] = v21;
      id v23 = v21;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v43 = v21;

      *(_WORD *)(v22 + 12) = 2080;
      uint64_t v24 = AppInstallationEvent.bundleID.getter();
      v0[13] = sub_10001FB10(v24, v25, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      id v26 = *(void (**)(uint64_t, uint64_t))(v51 + 8);
      v26(v20, v40);
      *(_WORD *)(v22 + 22) = 2080;
      AppInstallationEvent.installType.getter();
      uint64_t v27 = sub_10000EEEC(0);
      unint64_t v29 = v28;
      v50(v42, v45);
      v0[12] = sub_10001FB10(v27, v29, &v52);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v26(v41, v40);
      _os_log_impl((void *)&_mh_execute_header, log, type, "[%@] Skipping installation event for bundleID: %s with non valid installType: %s", (uint8_t *)v22, 0x20u);
      sub_1000034A8(&qword_10003A3A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v49, v48);
    }
    else
    {
      uint64_t v31 = v0[29];
      uint64_t v30 = v0[30];
      uint64_t v33 = v0[27];
      uint64_t v32 = v0[28];
      uint64_t v35 = v0[25];
      uint64_t v34 = v0[26];
      uint64_t v36 = v0[24];
      uint64_t v37 = (void *)v0[22];

      uint64_t v38 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      v38(v33, v36);
      v38(v34, v36);

      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v39 = (uint64_t (*)(void))v0[1];
    return v39();
  }
}

uint64_t sub_10000553C()
{
  uint64_t v1 = *(_OWORD **)v0;
  uint64_t v2 = *(void *)(*(void *)v0 + 184);
  long long v3 = *(_OWORD *)(*(void *)v0 + 32);
  v1[29] = v1[1];
  v1[30] = v3;
  v1[31] = v1[3];
  swift_task_dealloc();
  return _swift_task_switch(sub_10000565C, v2, 0);
}

uint64_t sub_10000565C()
{
  uint64_t v68 = v0;
  if (*(void *)(*(void *)(v0 + 160) + 16)
    && (unint64_t v1 = sub_100015254(0xD00000000000002CLL, 0x800000010002D290), (v2 & 1) != 0))
  {
    sub_10000D330(*(void *)(*(void *)(v0 + 160) + 56) + 32 * v1, v0 + 64);
  }
  else
  {
    *(_OWORD *)(v0 + 64) = 0u;
    *(_OWORD *)(v0 + 80) = 0u;
  }
  uint64_t v4 = *(void *)(v0 + 400);
  uint64_t v3 = *(void *)(v0 + 408);
  uint64_t v5 = *(void *)(v0 + 392);
  sub_1000034A8(&qword_100039B40);
  int v6 = swift_dynamicCast();
  char v7 = *(unsigned char *)(v0 + 552);
  if (!v6) {
    char v7 = 2;
  }
  char v51 = (v7 == 2) | v7;
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  static Date.now.getter();
  if (qword_100039750 != -1) {
    swift_once();
  }
  uint64_t v8 = (void *)(v0 + 152);
  uint64_t v47 = *(void (**)(uint64_t, uint64_t))(v0 + 440);
  uint64_t v45 = *(void *)(v0 + 432);
  uint64_t v46 = *(void *)(v0 + 416);
  uint64_t v9 = *(void *)(v0 + 376);
  uint64_t v52 = *(void *)(v0 + 384);
  uint64_t v10 = *(void *)(v0 + 360);
  uint64_t v53 = *(void *)(v0 + 368);
  uint64_t v11 = *(void *)(v0 + 352);
  uint64_t v50 = v11;
  uint64_t v54 = *(void *)(v0 + 344);
  uint64_t v63 = *(void *)(v0 + 328);
  uint64_t v56 = *(void *)(v0 + 320);
  uint64_t v12 = *(void *)(v0 + 304);
  uint64_t v58 = *(void *)(v0 + 312);
  uint64_t v60 = *(void *)(v0 + 336);
  uint64_t v13 = *(void *)(v0 + 288);
  uint64_t v14 = *(void *)(v0 + 296);
  uint64_t v15 = *(void *)(v0 + 272);
  uint64_t v48 = *(void *)(v0 + 280);
  uint64_t v49 = (void *)v0;
  uint64_t v16 = *(void *)(v0 + 264);
  v61 = (void *)v8[3];
  Date.addingTimeInterval(_:)();
  id v17 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v8[45] = v17;
  v8[46] = (v10 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v17(v9, v11);
  AppInstallationEvent.eligibility.getter();
  AppInstallationEligibility.accountID.getter();
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v18(v12, v16);
  AppInstallationEvent.eligibility.getter();
  AppInstallationEligibility.billingStorefront.getter();
  v18(v14, v16);
  AppInstallationEvent.bundleID.getter();
  AppInstallationEvent.eligibility.getter();
  AppInstallationEligibility.billingCountryCode.getter();
  v18(v13, v16);
  AppInstallationEvent.externalVersionID.getter();
  AppInstallationEvent.installDate.getter();
  AppInstallationEvent.installType.getter();
  sub_10000EEEC(v51 & 1);
  v47(v45, v46);
  AppInstallationEvent.isBeta.getter();
  AppInstallationEvent.itemID.getter();
  AppInstallationEvent.osVersion.getter();
  AppInstallationEvent.platform.getter();
  AppInstallationEvent.source.getter();
  AppInstallationEvent.eligibility.getter();
  AppInstallationEligibility.storefront.getter();
  v18(v48, v16);
  AppInstallationEvent.token.getter();
  AppInstallationEvent.webDomain.getter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v53, v52, v50);
  InstallationEvent.init(altDsid:dsid:billingStorefront:bundleID:clientID:countryCode:eventVersion:evid:installDate:installType:isBeta:itemID:osVersion:platform:source:storefront:token:webDomain:postTargetDate:gsToken:jwtGSToken:)();
  static Logger.events.getter();
  os_log_type_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t))(v56 + 16);
  v19(v60, v54, v58);
  v19(v63, v54, v58);
  id v20 = v61;
  os_log_type_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  BOOL v23 = os_log_type_enabled(v21, v22);
  uint64_t v24 = v8[23];
  uint64_t v25 = v8[20];
  uint64_t v26 = v8[21];
  uint64_t v27 = v8[13];
  uint64_t v28 = v8[10];
  uint64_t v64 = v8[22];
  uint64_t v65 = v8[9];
  unint64_t v29 = (void *)v8[3];
  if (v23)
  {
    uint64_t v55 = v8[20];
    uint64_t v30 = v49;
    v59 = v21;
    uint64_t v31 = swift_slowAlloc();
    uint64_t v32 = (void *)swift_slowAlloc();
    v67[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v31 = 138412802;
    os_log_type_t v57 = v22;
    v49[17] = v29;
    uint64_t v62 = v27;
    id v33 = v29;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v32 = v29;

    *(_WORD *)(v31 + 12) = 2080;
    uint64_t v34 = InstallationEvent.bundleID.getter();
    v49[18] = sub_10001FB10(v34, v35, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v36(v24, v55);
    *(_WORD *)(v31 + 22) = 2080;
    uint64_t v37 = InstallationEvent.clientID.getter();
    v49[14] = sub_10001FB10(v37, v38, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    v36(v64, v55);
    _os_log_impl((void *)&_mh_execute_header, v59, v57, "[%@] Enqueuing event with bundleID: %s clientEventID: %s", (uint8_t *)v31, 0x20u);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v39 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v39(v62, v65);
  }
  else
  {

    uint64_t v36 = *(void (**)(uint64_t, uint64_t))(v26 + 8);
    v36(v24, v25);
    v36(v64, v25);

    v39 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v39(v27, v65);
    uint64_t v30 = v49;
  }
  v30[67] = v39;
  v30[66] = v36;
  v66 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_100039B48 + dword_100039B48);
  uint64_t v40 = (void *)swift_task_alloc();
  v30[68] = v40;
  void *v40 = v30;
  v40[1] = sub_100005E74;
  uint64_t v41 = v30[43];
  uint64_t v42 = v30[22];
  uint64_t v43 = v30[20];
  return v66(v41, v43, v42);
}

uint64_t sub_100005E74()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 184);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return _swift_task_switch(sub_100005FC4, v1, 0);
}

uint64_t sub_100005FC4()
{
  uint64_t v1 = (void *)v0[22];
  static Logger.events.getter();
  id v2 = v1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (void *)v0[22];
    int v6 = (uint8_t *)swift_slowAlloc();
    char v7 = (void *)swift_slowAlloc();
    *(_DWORD *)int v6 = 138412290;
    v0[16] = v5;
    id v8 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *char v7 = v5;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Enqueue complete", v6, 0xCu);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v10 = (void *)v0[22];
  }
  uint64_t v9 = v3;
  uint64_t v11 = (void (*)(uint64_t, uint64_t))v0[67];
  id v20 = (void (*)(uint64_t, uint64_t))v0[66];
  os_log_type_t v21 = (void (*)(uint64_t, uint64_t))v0[64];
  uint64_t v12 = v0[48];
  uint64_t v14 = v0[43];
  uint64_t v13 = v0[44];
  uint64_t v15 = v0[39];
  uint64_t v16 = v0[31];
  uint64_t v17 = v0[28];

  v11(v16, v17);
  v20(v14, v15);
  v21(v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

void sub_1000062A4(uint64_t a1, void *a2, void *a3)
{
  sub_10000D170((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v5 = a3;
    sub_1000034A8(&qword_100039BD8);
    CheckedContinuation.resume(throwing:)();
  }
  else
  {
    id v6 = a2;
    sub_1000034A8(&qword_100039BD8);
    CheckedContinuation.resume(returning:)();
  }
}

void sub_100006340(uint64_t a1, uint64_t a2, void *a3)
{
  sub_10000D170((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v5 = a3;
    sub_1000034A8(&qword_100039BD0);
    CheckedContinuation.resume(throwing:)();
  }
  else
  {
    if (a2)
    {
      sub_10000D48C(0, &qword_100039BF8);
      static Array._unconditionallyBridgeFromObjectiveC(_:)();
    }
    sub_1000034A8(&qword_100039BD0);
    CheckedContinuation.resume(returning:)();
  }
}

uint64_t sub_100006408()
{
  v1[19] = v0;
  uint64_t v2 = sub_1000034A8(&qword_100039BC0);
  v1[20] = v2;
  v1[21] = *(void *)(v2 - 8);
  v1[22] = swift_task_alloc();
  return _swift_task_switch(sub_1000064CC, 0, 0);
}

uint64_t sub_1000064CC()
{
  uint64_t v2 = v0[21];
  uint64_t v1 = v0[22];
  uint64_t v3 = (void *)v0[19];
  uint64_t v4 = v0[20];
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_100006670;
  swift_continuation_init();
  v0[17] = v4;
  id v5 = sub_10000D090(v0 + 14);
  sub_10000D48C(0, &qword_100039BC8);
  sub_1000034A8(&qword_10003A390);
  CheckedContinuation.init(continuation:function:)();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v2 + 32))(v5, v1, v4);
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 1107296256;
  v0[12] = sub_100006C70;
  v0[13] = &unk_100035940;
  [v3 resultWithCompletion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100006670()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 184) = v1;
  if (v1) {
    uint64_t v2 = sub_100006810;
  }
  else {
    uint64_t v2 = sub_100006780;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100006780()
{
  uint64_t v1 = *(void **)(v0 + 144);
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;

  swift_task_dealloc();
  id v5 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8);
  return v5(v2, v4);
}

uint64_t sub_100006810()
{
  swift_willThrow();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t InstallationEventManager.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon24InstallationEventManager_container;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t InstallationEventManager.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon24InstallationEventManager_container;
  uint64_t v2 = type metadata accessor for URL();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return _swift_defaultActor_deallocate(v0);
}

uint64_t InstallationEventManager.unownedExecutor.getter()
{
  return v0;
}

uint64_t static InstallationEvent.== infix(_:_:)()
{
  uint64_t v0 = InstallationEvent.clientID.getter();
  uint64_t v2 = v1;
  if (v0 == InstallationEvent.clientID.getter() && v2 == v3) {
    char v4 = 1;
  }
  else {
    char v4 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t InstallationEvent.hash(into:)()
{
  InstallationEvent.id.getter();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int InstallationEvent.hashValue.getter()
{
  return Hasher._finalize()();
}

Swift::Int sub_100006AD4()
{
  return Hasher._finalize()();
}

uint64_t sub_100006B2C()
{
  return sub_10000D39C(&qword_100039A28, (void (*)(uint64_t))&type metadata accessor for InstallationEvent);
}

uint64_t sub_100006B74()
{
  return type metadata accessor for InstallationEventManager();
}

uint64_t type metadata accessor for InstallationEventManager()
{
  uint64_t result = qword_100039A58;
  if (!qword_100039A58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100006BC8()
{
  uint64_t result = type metadata accessor for URL();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_100006C70(uint64_t a1, void *a2, void *a3)
{
  sub_10000D170((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v5 = a3;
    sub_1000034A8(&qword_100039BC0);
    CheckedContinuation.resume(throwing:)();
  }
  else if (a2)
  {
    id v6 = a2;
    sub_1000034A8(&qword_100039BC0);
    CheckedContinuation.resume(returning:)();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100006D14(void *a1)
{
  v11[1] = a1;
  type metadata accessor for ASEEvent();
  sub_10000D39C((unint64_t *)&qword_100039B98, (void (*)(uint64_t))type metadata accessor for ASEEvent);
  uint64_t result = dispatch thunk of JSONEncoder.encode<A>(_:)();
  if (!v1)
  {
    uint64_t v4 = result;
    unint64_t v5 = v3;
    id v6 = self;
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    v11[0] = 0;
    id v8 = [v6 JSONObjectWithData:isa options:4 error:v11];

    id v9 = v11[0];
    if (v8)
    {
      _bridgeAnyObjectToAny(_:)();
      sub_10000D3E4(v4, v5);
      return swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v10 = v9;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      return sub_10000D3E4(v4, v5);
    }
  }
  return result;
}

void sub_100006E90(uint64_t a1, uint64_t a2, void *a3)
{
  sub_10000D170((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v4 = a3;
    sub_1000034A8(&qword_100039B58);
    CheckedContinuation.resume(throwing:)();
  }
  else
  {
    sub_1000034A8(&qword_100039B58);
    CheckedContinuation.resume(returning:)();
  }
}

uint64_t sub_100006F28(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000034A8(&qword_100039B88);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v26 = a1 + 64;
  uint64_t v3 = 1 << *(unsigned char *)(a1 + 32);
  if (v3 < 64) {
    uint64_t v4 = ~(-1 << v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(v3 + 63) >> 6;
  id v6 = (char *)(v2 + 8);
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
      goto LABEL_26;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v13 >= v27) {
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v13);
    ++v8;
    if (!v14)
    {
      int64_t v8 = v13 + 1;
      if (v13 + 1 >= v27) {
        goto LABEL_35;
      }
      unint64_t v14 = *(void *)(v26 + 8 * v8);
      if (!v14)
      {
        int64_t v8 = v13 + 2;
        if (v13 + 2 >= v27) {
          goto LABEL_35;
        }
        unint64_t v14 = *(void *)(v26 + 8 * v8);
        if (!v14) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v8 << 6);
LABEL_26:
    uint64_t v16 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = *v16;
    uint64_t v17 = v16[1];
    sub_10000D330(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v39);
    *(void *)&long long v38 = v18;
    *((void *)&v38 + 1) = v17;
    v36[2] = v38;
    v37[0] = v39[0];
    v37[1] = v39[1];
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_10000D38C(v37, v36);
    sub_1000034A8(&qword_100039B90);
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_10000D38C(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_10000D38C(v35, v36);
    sub_10000D38C(v36, &v32);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v19 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_10000D38C(&v32, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v27)
  {
LABEL_35:
    swift_release();
    swift_release();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v26 + 8 * v15);
  if (v14)
  {
    int64_t v8 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v8 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v8 >= v27) {
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v26 + 8 * v8);
    ++v15;
    if (v14) {
      goto LABEL_25;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_1000072E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = a1 + 40;
  uint64_t v3 = a2 + 40;
  sub_10000D208(a1, a2);
  return sub_10000D330(v2, v3);
}

uint64_t sub_100007318(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
  uint64_t v8 = ~v7;
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = -v7;
  uint64_t v40 = a1;
  uint64_t v41 = a1 + 64;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  else {
    uint64_t v11 = -1;
  }
  uint64_t v42 = v8;
  uint64_t v43 = 0;
  uint64_t v44 = v11 & v9;
  uint64_t v45 = a2;
  uint64_t v46 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_100007CCC((uint64_t)&v36);
  if (!*((void *)&v37 + 1))
  {
LABEL_19:
    swift_release();
    swift_bridgeObjectRelease();
    sub_10000D264();
    return swift_release();
  }
  while (1)
  {
    long long v33 = v36;
    long long v34 = v37;
    uint64_t v35 = v38;
    sub_10000D38C(&v39, v32);
    uint64_t v13 = *a5;
    unint64_t v15 = sub_1000152CC((uint64_t)&v33);
    uint64_t v16 = *(void *)(v13 + 16);
    BOOL v17 = (v14 & 1) == 0;
    uint64_t v18 = v16 + v17;
    if (__OFADD__(v16, v17)) {
      break;
    }
    char v19 = v14;
    if (*(void *)(v13 + 24) >= v18)
    {
      if (a4)
      {
        if (v14) {
          goto LABEL_6;
        }
      }
      else
      {
        sub_100012D94();
        if (v19) {
          goto LABEL_6;
        }
      }
    }
    else
    {
      sub_10001235C(v18, a4 & 1);
      unint64_t v20 = sub_1000152CC((uint64_t)&v33);
      if ((v19 & 1) != (v21 & 1)) {
        goto LABEL_22;
      }
      unint64_t v15 = v20;
      if (v19)
      {
LABEL_6:
        sub_10000D330(*(void *)(*a5 + 56) + 32 * v15, (uint64_t)v30);
        sub_10000D330((uint64_t)v30, (uint64_t)v31);
        sub_10000D120((uint64_t)v30);
        sub_10000D120((uint64_t)v32);
        sub_10000D1B4((uint64_t)&v33);
        unint64_t v12 = (_OWORD *)(*(void *)(*a5 + 56) + 32 * v15);
        sub_10000D120((uint64_t)v12);
        sub_10000D38C(v31, v12);
        goto LABEL_7;
      }
    }
    char v22 = (void *)*a5;
    *(void *)(*a5 + 8 * (v15 >> 6) + 64) |= 1 << v15;
    uint64_t v23 = v22[6] + 40 * v15;
    long long v24 = v33;
    long long v25 = v34;
    *(void *)(v23 + 32) = v35;
    *(_OWORD *)uint64_t v23 = v24;
    *(_OWORD *)(v23 + 16) = v25;
    sub_10000D38C(v32, (_OWORD *)(v22[7] + 32 * v15));
    uint64_t v26 = v22[2];
    BOOL v27 = __OFADD__(v26, 1);
    uint64_t v28 = v26 + 1;
    if (v27) {
      goto LABEL_21;
    }
    v22[2] = v28;
LABEL_7:
    sub_100007CCC((uint64_t)&v36);
    a4 = 1;
    if (!*((void *)&v37 + 1)) {
      goto LABEL_19;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
LABEL_22:
  uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

_OWORD *sub_100007594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6)
{
  uint64_t v28 = &type metadata for String;
  *(void *)&long long v27 = a1;
  *((void *)&v27 + 1) = a2;
  uint64_t v10 = (void *)*a6;
  unint64_t v12 = sub_100015254(a3, a4);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 >= v15 && (a5 & 1) != 0)
  {
LABEL_7:
    uint64_t v18 = (void *)*a6;
    if (v16)
    {
LABEL_8:
      char v19 = (_OWORD *)(v18[7] + 32 * v12);
      sub_10000D120((uint64_t)v19);
      return sub_10000D38C(&v27, v19);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a5 & 1) == 0)
  {
    sub_100012D74();
    goto LABEL_7;
  }
  sub_10001233C(v15, a5 & 1);
  unint64_t v21 = sub_100015254(a3, a4);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*a6;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v23 = sub_10000D43C((uint64_t)&v27, (uint64_t)&type metadata for String);
  __chkstk_darwin(v23, v23);
  long long v25 = (uint64_t *)((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  sub_100007C48(v12, a3, a4, *v25, v25[1], v18);
  sub_10000D120((uint64_t)&v27);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_100007778(char a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  LOBYTE(v26) = a1;
  long long v27 = &type metadata for Bool;
  uint64_t v9 = (void *)*a5;
  unint64_t v11 = sub_100015254(a2, a3);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v15 = v10;
  uint64_t v16 = v9[3];
  if (v16 >= v14 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v17 = (void *)*a5;
    if (v15)
    {
LABEL_8:
      uint64_t v18 = (_OWORD *)(v17[7] + 32 * v11);
      sub_10000D120((uint64_t)v18);
      return sub_10000D38C(&v26, v18);
    }
    goto LABEL_11;
  }
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_100012D74();
    goto LABEL_7;
  }
  sub_10001233C(v14, a4 & 1);
  unint64_t v20 = sub_100015254(a2, a3);
  if ((v15 & 1) != (v21 & 1))
  {
LABEL_14:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v11 = v20;
  uint64_t v17 = (void *)*a5;
  if (v15) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v22 = sub_10000D43C((uint64_t)&v26, (uint64_t)&type metadata for Bool);
  __chkstk_darwin(v22, v22);
  uint64_t v24 = (char *)&v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v25 + 16))(v24);
  sub_100007BC4(v11, a2, a3, *v24, v17);
  sub_10000D120((uint64_t)&v26);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_10000795C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  *(void *)&long long v26 = a1;
  long long v27 = &type metadata for Int64;
  uint64_t v9 = (void *)*a5;
  unint64_t v11 = sub_100015254(a2, a3);
  uint64_t v12 = v9[2];
  BOOL v13 = (v10 & 1) == 0;
  uint64_t v14 = v12 + v13;
  if (__OFADD__(v12, v13))
  {
    __break(1u);
    goto LABEL_14;
  }
  char v15 = v10;
  uint64_t v16 = v9[3];
  if (v16 >= v14 && (a4 & 1) != 0)
  {
LABEL_7:
    uint64_t v17 = (void *)*a5;
    if (v15)
    {
LABEL_8:
      uint64_t v18 = (_OWORD *)(v17[7] + 32 * v11);
      sub_10000D120((uint64_t)v18);
      return sub_10000D38C(&v26, v18);
    }
    goto LABEL_11;
  }
  if (v16 >= v14 && (a4 & 1) == 0)
  {
    sub_100012D74();
    goto LABEL_7;
  }
  sub_10001233C(v14, a4 & 1);
  unint64_t v20 = sub_100015254(a2, a3);
  if ((v15 & 1) != (v21 & 1))
  {
LABEL_14:
    uint64_t result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v11 = v20;
  uint64_t v17 = (void *)*a5;
  if (v15) {
    goto LABEL_8;
  }
LABEL_11:
  uint64_t v22 = sub_10000D43C((uint64_t)&v26, (uint64_t)&type metadata for Int64);
  __chkstk_darwin(v22, v22);
  uint64_t v24 = (uint64_t *)((char *)&v26 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v25 + 16))(v24);
  sub_100007B40(v11, a2, a3, *v24, v17);
  sub_10000D120((uint64_t)&v26);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_100007B40(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  *(void *)&long long v11 = a4;
  uint64_t v12 = &type metadata for Int64;
  a5[(a1 >> 6) + 8] |= 1 << a1;
  id v6 = (void *)(a5[6] + 16 * a1);
  *id v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10000D38C(&v11, (_OWORD *)(a5[7] + 32 * a1));
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

_OWORD *sub_100007BC4(unint64_t a1, uint64_t a2, uint64_t a3, char a4, void *a5)
{
  LOBYTE(v11) = a4;
  uint64_t v12 = &type metadata for Bool;
  a5[(a1 >> 6) + 8] |= 1 << a1;
  id v6 = (void *)(a5[6] + 16 * a1);
  *id v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10000D38C(&v11, (_OWORD *)(a5[7] + 32 * a1));
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

_OWORD *sub_100007C48(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  BOOL v13 = &type metadata for String;
  *(void *)&long long v12 = a4;
  *((void *)&v12 + 1) = a5;
  a6[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v7 = (void *)(a6[6] + 16 * a1);
  *uint64_t v7 = a2;
  v7[1] = a3;
  uint64_t result = sub_10000D38C(&v12, (_OWORD *)(a6[7] + 32 * a1));
  uint64_t v9 = a6[2];
  BOOL v10 = __OFADD__(v9, 1);
  uint64_t v11 = v9 + 1;
  if (v10) {
    __break(1u);
  }
  else {
    a6[2] = v11;
  }
  return result;
}

uint64_t sub_100007CCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v6 = v1[2];
  int64_t v5 = v1[3];
  int64_t v7 = v5;
  unint64_t v8 = v1[4];
  if (v8)
  {
    uint64_t v9 = (v8 - 1) & v8;
    unint64_t v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    sub_10000D208(*(void *)(v3 + 48) + 40 * v10, (uint64_t)v25);
    sub_10000D330(*(void *)(v3 + 56) + 32 * v10, (uint64_t)&v25[2] + 8);
    goto LABEL_23;
  }
  int64_t v11 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  int64_t v12 = (unint64_t)(v6 + 64) >> 6;
  if (v11 < v12)
  {
    unint64_t v13 = *(void *)(v4 + 8 * v11);
    if (v13)
    {
LABEL_7:
      uint64_t v9 = (v13 - 1) & v13;
      unint64_t v10 = __clz(__rbit64(v13)) + (v11 << 6);
      int64_t v7 = v11;
      goto LABEL_3;
    }
    int64_t v14 = v5 + 2;
    int64_t v7 = v5 + 1;
    if (v5 + 2 < v12)
    {
      unint64_t v13 = *(void *)(v4 + 8 * v14);
      if (v13)
      {
LABEL_10:
        int64_t v11 = v14;
        goto LABEL_7;
      }
      int64_t v7 = v5 + 2;
      if (v5 + 3 < v12)
      {
        unint64_t v13 = *(void *)(v4 + 8 * (v5 + 3));
        if (v13)
        {
          int64_t v11 = v5 + 3;
          goto LABEL_7;
        }
        int64_t v14 = v5 + 4;
        int64_t v7 = v5 + 3;
        if (v5 + 4 < v12)
        {
          unint64_t v13 = *(void *)(v4 + 8 * v14);
          if (v13) {
            goto LABEL_10;
          }
          int64_t v11 = v5 + 5;
          int64_t v7 = v5 + 4;
          if (v5 + 5 < v12)
          {
            unint64_t v13 = *(void *)(v4 + 8 * v11);
            if (v13) {
              goto LABEL_7;
            }
            int64_t v7 = v12 - 1;
            int64_t v15 = v5 + 6;
            while (v12 != v15)
            {
              unint64_t v13 = *(void *)(v4 + 8 * v15++);
              if (v13)
              {
                int64_t v11 = v15 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  uint64_t v9 = 0;
  uint64_t v26 = 0;
  memset(v25, 0, sizeof(v25));
LABEL_23:
  *uint64_t v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  uint64_t v16 = (void (*)(_OWORD *))v1[5];
  uint64_t result = sub_10000D26C((uint64_t)v25, (uint64_t)&v20);
  if (*((void *)&v21 + 1))
  {
    v18[2] = v22;
    v18[3] = v23;
    uint64_t v19 = v24;
    v18[0] = v20;
    v18[1] = v21;
    v16(v18);
    return sub_10000D2D4((uint64_t)v18, &qword_100039B80);
  }
  else
  {
    *(void *)(a1 + 64) = 0;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_100007EC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v159 = a3;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v160 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v5);
  v162 = (char *)&v159 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Calendar.Component();
  uint64_t v164 = *(void *)(v7 - 8);
  uint64_t v165 = v7;
  __chkstk_darwin(v7, v8);
  v163 = (char *)&v159 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Date();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  int64_t v14 = (char *)&v159 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000034A8(&qword_100039BA0);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10002C510;
  *(void *)(v15 + 32) = 0x6449656C646E7562;
  *(void *)(v15 + 40) = 0xE800000000000000;
  *(void *)(v15 + 48) = InstallationEvent.bundleID.getter();
  *(void *)(v15 + 56) = v16;
  *(void *)(v15 + 72) = &type metadata for String;
  strcpy((char *)(v15 + 80), "clientEventId");
  *(_WORD *)(v15 + 94) = -4864;
  *(void *)(v15 + 96) = InstallationEvent.clientID.getter();
  *(void *)(v15 + 104) = v17;
  *(void *)(v15 + 120) = &type metadata for String;
  strcpy((char *)(v15 + 128), "eventVersion");
  *(unsigned char *)(v15 + 141) = 0;
  *(_WORD *)(v15 + 142) = -5120;
  *(void *)(v15 + 144) = 1;
  *(void *)(v15 + 168) = &type metadata for Int;
  *(void *)(v15 + 176) = 0x6F6973726556736FLL;
  *(void *)(v15 + 184) = 0xE90000000000006ELL;
  *(void *)(v15 + 192) = InstallationEvent.osVersion.getter();
  *(void *)(v15 + 200) = v18;
  *(void *)(v15 + 216) = &type metadata for String;
  *(void *)(v15 + 224) = 0x656372756F73;
  *(void *)(v15 + 232) = 0xE600000000000000;
  uint64_t v19 = InstallationEvent.source.getter();
  *(void *)(v15 + 264) = &type metadata for String;
  *(void *)(v15 + 240) = v19;
  *(void *)(v15 + 248) = v20;
  unint64_t v21 = sub_100014778(v15);
  uint64_t v22 = InstallationEvent.webDomain.getter();
  uint64_t v161 = v4;
  uint64_t v167 = v10;
  if (v23)
  {
    *((void *)&v172 + 1) = &type metadata for String;
    *(void *)&long long v171 = v22;
    *((void *)&v171 + 1) = v23;
    sub_10000D38C(&v171, &v169);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v168 = v21;
    uint64_t v25 = sub_10000D43C((uint64_t)&v169, v170);
    __chkstk_darwin(v25, v25);
    long long v27 = (uint64_t *)((char *)&v159 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v28 + 16))(v27);
    sub_100007594(*v27, v27[1], 0x69616D6F44626577, 0xE90000000000006ELL, isUniquelyReferenced_nonNull_native, &v168);
    sub_10000D120((uint64_t)&v169);
    unint64_t v21 = v168;
    swift_bridgeObjectRelease();
  }
  uint64_t v29 = InstallationEvent.installType.getter();
  *((void *)&v172 + 1) = &type metadata for String;
  *(void *)&long long v171 = v29;
  *((void *)&v171 + 1) = v30;
  sub_10000D38C(&v171, &v169);
  char v31 = swift_isUniquelyReferenced_nonNull_native();
  unint64_t v168 = v21;
  uint64_t v32 = sub_10000D43C((uint64_t)&v169, v170);
  __chkstk_darwin(v32, v32);
  long long v34 = (uint64_t *)((char *)&v159 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v35 + 16))(v34);
  sub_100007594(*v34, v34[1], 0x546C6C6174736E69, 0xEB00000000657079, v31, &v168);
  sub_10000D120((uint64_t)&v169);
  uint64_t v36 = v168;
  swift_bridgeObjectRelease();
  if (InstallationEvent.isBeta.getter())
  {
    *((void *)&v172 + 1) = &type metadata for Bool;
    LOBYTE(v171) = 1;
    sub_10000D38C(&v171, &v169);
    char v37 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v168 = v36;
    uint64_t v38 = sub_10000D43C((uint64_t)&v169, v170);
    __chkstk_darwin(v38, v38);
    uint64_t v40 = (char *)&v159 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v41 + 16))(v40);
    sub_100007778(*v40, 0x617465427369, 0xE600000000000000, v37, &v168);
    sub_10000D120((uint64_t)&v169);
    uint64_t v36 = v168;
    swift_bridgeObjectRelease();
  }
  uint64_t v42 = InstallationEvent.countryCode.getter();
  if (v43)
  {
    *((void *)&v172 + 1) = &type metadata for String;
    *(void *)&long long v171 = v42;
    *((void *)&v171 + 1) = v43;
    sub_10000D38C(&v171, &v169);
    char v44 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v168 = v36;
    uint64_t v45 = sub_10000D43C((uint64_t)&v169, v170);
    __chkstk_darwin(v45, v45);
    uint64_t v47 = (uint64_t *)((char *)&v159 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v48 + 16))(v47);
    sub_100007594(*v47, v47[1], 0x437972746E756F63, 0xEB0000000065646FLL, v44, &v168);
    sub_10000D120((uint64_t)&v169);
    uint64_t v36 = v168;
    swift_bridgeObjectRelease();
  }
  uint64_t v49 = InstallationEvent.storefront.getter();
  if (v50)
  {
    *((void *)&v172 + 1) = &type metadata for String;
    *(void *)&long long v171 = v49;
    *((void *)&v171 + 1) = v50;
    sub_10000D38C(&v171, &v169);
    char v51 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v168 = v36;
    uint64_t v52 = sub_10000D43C((uint64_t)&v169, v170);
    __chkstk_darwin(v52, v52);
    uint64_t v54 = (uint64_t *)((char *)&v159 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v55 + 16))(v54);
    sub_100007594(*v54, v54[1], 0x6F726665726F7473, 0xEA0000000000746ELL, v51, &v168);
    sub_10000D120((uint64_t)&v169);
    uint64_t v36 = v168;
    swift_bridgeObjectRelease();
  }
  uint64_t v56 = InstallationEvent.altDsid.getter();
  if (v57)
  {
    *((void *)&v172 + 1) = &type metadata for String;
    *(void *)&long long v171 = v56;
    *((void *)&v171 + 1) = v57;
    sub_10000D38C(&v171, &v169);
    char v58 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v168 = v36;
    uint64_t v59 = sub_10000D43C((uint64_t)&v169, v170);
    __chkstk_darwin(v59, v59);
    v61 = (uint64_t *)((char *)&v159 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v62 + 16))(v61);
    sub_100007594(*v61, v61[1], 0x64497344746C61, 0xE700000000000000, v58, &v168);
    sub_10000D120((uint64_t)&v169);
    uint64_t v36 = v168;
    swift_bridgeObjectRelease();
  }
  uint64_t v63 = 0xD000000000000011;
  uint64_t v64 = *(void *)(a2 + 16);
  uint64_t v166 = v11;
  if (v64 && (unint64_t v65 = sub_100015254(0xD000000000000017, 0x800000010002D310), (v66 & 1) != 0))
  {
    sub_10000D330(*(void *)(a2 + 56) + 32 * v65, (uint64_t)&v171);
  }
  else
  {
    long long v171 = 0u;
    long long v172 = 0u;
  }
  sub_1000034A8(&qword_100039B40);
  int v67 = swift_dynamicCast();
  int v68 = v169;
  uint64_t v69 = InstallationEvent.dsid.getter();
  if (v70 & 1) == 0 && (!v67 ? (int v71 = 2) : (int v71 = v68), v71 == 2 || (v71))
  {
    *((void *)&v172 + 1) = &type metadata for Int64;
    *(void *)&long long v171 = v69;
    sub_10000D38C(&v171, &v169);
    char v74 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v168 = v36;
    uint64_t v75 = sub_10000D43C((uint64_t)&v169, v170);
    __chkstk_darwin(v75, v75);
    v77 = (uint64_t *)((char *)&v159 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v78 + 16))(v77);
    sub_10000795C(*v77, 1682535268, 0xE400000000000000, v74, &v168);
    sub_10000D120((uint64_t)&v169);
    uint64_t v36 = v168;
    swift_bridgeObjectRelease();
    if (!*(void *)(a2 + 16)) {
      goto LABEL_25;
    }
  }
  else if (!*(void *)(a2 + 16))
  {
    goto LABEL_25;
  }
  unint64_t v72 = sub_100015254(0xD00000000000001ALL, 0x800000010002D330);
  if (v73)
  {
    sub_10000D330(*(void *)(a2 + 56) + 32 * v72, (uint64_t)&v171);
    goto LABEL_26;
  }
LABEL_25:
  long long v171 = 0u;
  long long v172 = 0u;
LABEL_26:
  if (swift_dynamicCast() & 1) == 0 || v169 == 2 || (v169)
  {
    uint64_t v79 = InstallationEvent.gsToken.getter();
    if (v80)
    {
      *((void *)&v172 + 1) = &type metadata for String;
      *(void *)&long long v171 = v79;
      *((void *)&v171 + 1) = v80;
      sub_10000D38C(&v171, &v169);
      char v81 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v168 = v36;
      uint64_t v82 = sub_10000D43C((uint64_t)&v169, v170);
      __chkstk_darwin(v82, v82);
      v84 = (uint64_t *)((char *)&v159 - ((v83 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v85 + 16))(v84);
      sub_100007594(*v84, v84[1], 0x6E656B6F547367, 0xE700000000000000, v81, &v168);
      sub_10000D120((uint64_t)&v169);
      uint64_t v36 = v168;
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v86 = InstallationEvent.jwtGSToken.getter();
  if (v87)
  {
    *((void *)&v172 + 1) = &type metadata for String;
    *(void *)&long long v171 = v86;
    *((void *)&v171 + 1) = v87;
    sub_10000D38C(&v171, &v169);
    char v88 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v168 = v36;
    uint64_t v89 = sub_10000D43C((uint64_t)&v169, v170);
    __chkstk_darwin(v89, v89);
    v91 = (uint64_t *)((char *)&v159 - ((v90 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v92 + 16))(v91);
    sub_100007594(*v91, v91[1], 0x6B6F54534774776ALL, 0xEA00000000006E65, v88, &v168);
    sub_10000D120((uint64_t)&v169);
    uint64_t v36 = v168;
    swift_bridgeObjectRelease();
  }
  uint64_t v93 = InstallationEvent.token.getter();
  if (v94)
  {
    *((void *)&v172 + 1) = &type metadata for String;
    *(void *)&long long v171 = v93;
    *((void *)&v171 + 1) = v94;
    sub_10000D38C(&v171, &v169);
    char v95 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v168 = v36;
    uint64_t v96 = sub_10000D43C((uint64_t)&v169, v170);
    __chkstk_darwin(v96, v96);
    v98 = (uint64_t *)((char *)&v159 - ((v97 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v99 + 16))(v98);
    sub_100007594(*v98, v98[1], 0x6E656B6F74, 0xE500000000000000, v95, &v168);
    sub_10000D120((uint64_t)&v169);
    uint64_t v36 = v168;
    swift_bridgeObjectRelease();
  }
  if (*(void *)(a2 + 16) && (unint64_t v100 = sub_100015254(0xD000000000000019, 0x800000010002D350), (v101 & 1) != 0))
  {
    sub_10000D330(*(void *)(a2 + 56) + 32 * v100, (uint64_t)&v171);
  }
  else
  {
    long long v171 = 0u;
    long long v172 = 0u;
  }
  sub_1000034A8(&qword_100039BA8);
  if ((swift_dynamicCast() & 1) != 0 && (v102 = (void *)v169) != 0)
  {
    if (!*(void *)(a2 + 16)) {
      goto LABEL_46;
    }
  }
  else
  {
    v102 = &off_1000351D8;
    if (!*(void *)(a2 + 16)) {
      goto LABEL_46;
    }
  }
  unint64_t v103 = sub_100015254(0xD000000000000020, 0x800000010002D370);
  if (v104)
  {
    sub_10000D330(*(void *)(a2 + 56) + 32 * v103, (uint64_t)&v171);
    goto LABEL_47;
  }
LABEL_46:
  long long v171 = 0u;
  long long v172 = 0u;
LABEL_47:
  int v105 = swift_dynamicCast();
  uint64_t v107 = *((void *)&v169 + 1);
  uint64_t v106 = v169;
  if (!v105)
  {
    uint64_t v107 = 0;
    uint64_t v106 = 0;
  }
  if (v107)
  {
    uint64_t v63 = v106;
    uint64_t v108 = v107;
  }
  else
  {
    uint64_t v108 = 0x800000010002D050;
  }
  uint64_t v109 = InstallationEvent.billingStorefront.getter();
  if (v110)
  {
    uint64_t v111 = v109;
    uint64_t v112 = v110;
    if (sub_100014908(v63, v108, v102))
    {
      *((void *)&v172 + 1) = &type metadata for String;
      *(void *)&long long v171 = v111;
      *((void *)&v171 + 1) = v112;
      sub_10000D38C(&v171, &v169);
      char v113 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v168 = v36;
      uint64_t v114 = sub_10000D43C((uint64_t)&v169, v170);
      __chkstk_darwin(v114, v114);
      v116 = (uint64_t *)((char *)&v159 - ((v115 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v117 + 16))(v116);
      sub_100007594(*v116, v116[1], v63, v108, v113, &v168);
      sub_10000D120((uint64_t)&v169);
      uint64_t v36 = v168;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  if (sub_100014908(0x6D726F6674616C70, 0xE800000000000000, v102))
  {
    uint64_t v118 = InstallationEvent.platform.getter();
    *((void *)&v172 + 1) = &type metadata for String;
    *(void *)&long long v171 = v118;
    *((void *)&v171 + 1) = v119;
    sub_10000D38C(&v171, &v169);
    char v120 = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v168 = v36;
    uint64_t v121 = sub_10000D43C((uint64_t)&v169, v170);
    __chkstk_darwin(v121, v121);
    v123 = (uint64_t *)((char *)&v159 - ((v122 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v124 + 16))(v123);
    sub_100007594(*v123, v123[1], 0x6D726F6674616C70, 0xE800000000000000, v120, &v168);
    sub_10000D120((uint64_t)&v169);
    uint64_t v36 = v168;
    swift_bridgeObjectRelease();
  }
  if (sub_100014908(0x64496D616461, 0xE600000000000000, v102))
  {
    uint64_t v125 = InstallationEvent.itemID.getter();
    if ((v126 & 1) == 0)
    {
      *((void *)&v172 + 1) = &type metadata for Int64;
      *(void *)&long long v171 = v125;
      sub_10000D38C(&v171, &v169);
      char v127 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v168 = v36;
      uint64_t v128 = sub_10000D43C((uint64_t)&v169, v170);
      __chkstk_darwin(v128, v128);
      v130 = (uint64_t *)((char *)&v159 - ((v129 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v131 + 16))(v130);
      sub_10000795C(*v130, 0x64496D616461, 0xE600000000000000, v127, &v168);
      sub_10000D120((uint64_t)&v169);
      uint64_t v36 = v168;
      swift_bridgeObjectRelease();
    }
  }
  if (sub_100014908(0xD000000000000011, 0x800000010002D3A0, v102))
  {
    uint64_t v132 = InstallationEvent.evid.getter();
    if ((v133 & 1) == 0)
    {
      *((void *)&v172 + 1) = &type metadata for Int64;
      *(void *)&long long v171 = v132;
      sub_10000D38C(&v171, &v169);
      char v134 = swift_isUniquelyReferenced_nonNull_native();
      unint64_t v168 = v36;
      uint64_t v135 = sub_10000D43C((uint64_t)&v169, v170);
      __chkstk_darwin(v135, v135);
      v137 = (uint64_t *)((char *)&v159 - ((v136 + 15) & 0xFFFFFFFFFFFFFFF0));
      (*(void (**)(uint64_t *))(v138 + 16))(v137);
      sub_10000795C(*v137, 0xD000000000000011, 0x800000010002D3A0, v134, &v168);
      sub_10000D120((uint64_t)&v169);
      uint64_t v36 = v168;
      swift_bridgeObjectRelease();
    }
  }
  uint64_t v140 = v164;
  uint64_t v139 = v165;
  uint64_t v141 = (uint64_t)v163;
  char v142 = sub_100014908(0x646C697562, 0xE500000000000000, v102);
  swift_bridgeObjectRelease();
  if (v142)
  {
    id v143 = objc_msgSend(self, "buildVersion", v159);
    uint64_t v144 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v146 = v145;

    *((void *)&v172 + 1) = &type metadata for String;
    *(void *)&long long v171 = v144;
    *((void *)&v171 + 1) = v146;
    sub_10000D38C(&v171, &v169);
    LOBYTE(v143) = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v168 = v36;
    uint64_t v147 = sub_10000D43C((uint64_t)&v169, v170);
    __chkstk_darwin(v147, v147);
    v149 = (uint64_t *)((char *)&v159 - ((v148 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(uint64_t *))(v150 + 16))(v149);
    sub_100007594(*v149, v149[1], 0x646C697562, 0xE500000000000000, (char)v143, &v168);
    sub_10000D120((uint64_t)&v169);
    uint64_t v36 = v168;
    swift_bridgeObjectRelease();
  }
  Date.init()();
  (*(void (**)(uint64_t, void, uint64_t))(v140 + 104))(v141, enum case for Calendar.Component.hour(_:), v139);
  id v151 = sub_1000246F0((uint64_t)v14, v141);
  (*(void (**)(uint64_t, uint64_t))(v140 + 8))(v141, v139);
  (*(void (**)(char *, uint64_t))(v166 + 8))(v14, v167);
  if (v151)
  {
    type metadata accessor for ASEEvent();
    swift_allocObject();
    return sub_10000E5D4(v36, (uint64_t)v151);
  }
  else
  {
    swift_bridgeObjectRelease();
    static Logger.events.getter();
    v153 = v159;
    v154 = Logger.logObject.getter();
    os_log_type_t v155 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v154, v155))
    {
      v156 = (uint8_t *)swift_slowAlloc();
      v157 = (void *)swift_slowAlloc();
      *(_DWORD *)v156 = 138412290;
      *(void *)&long long v171 = v153;
      v158 = v153;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v157 = v153;

      _os_log_impl((void *)&_mh_execute_header, v154, v155, "[%@] Failed to derezz event", v156, 0xCu);
      sub_1000034A8(&qword_10003A3A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v154 = v153;
    }

    (*(void (**)(char *, uint64_t))(v160 + 8))(v162, v161);
    return 0;
  }
}

uint64_t sub_100009618(void *a1)
{
  type metadata accessor for Logger();
  __chkstk_darwin();
  type metadata accessor for DictionaryEncoder();
  uint64_t inited = swift_initStackObject();
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  *(void *)(inited + 16) = JSONEncoder.init()();
  sub_100006D14(a1);
  swift_release();
  sub_1000034A8(&qword_100039B70);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  uint64_t v3 = v8;
  if (a1[14])
  {
    uint64_t v4 = swift_bridgeObjectRetain();
    uint64_t v5 = sub_100006F28(v4);
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9[0] = v8;
    sub_100007318(v5, (uint64_t)sub_1000072E0, 0, isUniquelyReferenced_nonNull_native, v9);
    uint64_t v3 = v9[0];
    swift_bridgeObjectRelease();
  }
  return v3;
}

id sub_100009A74(uint64_t a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = (id)sub_100009618((void *)a1);
  if (v8)
  {
    static Logger.metrics.getter();
    id v9 = a2;
    swift_retain();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    int v12 = v11;
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v51 = v5;
      uint64_t v14 = v13;
      uint64_t v15 = swift_slowAlloc();
      int v48 = v12;
      uint64_t v16 = (void *)v15;
      uint64_t v49 = swift_slowAlloc();
      v54[0] = v49;
      *(_DWORD *)uint64_t v14 = 138412546;
      *(void *)&long long v55 = v9;
      uint64_t v50 = v4;
      id v17 = v9;
      os_log_t v47 = v10;
      id v18 = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v16 = v9;

      *(_WORD *)(v14 + 12) = 2082;
      uint64_t v19 = *(void *)(a1 + 16);
      unint64_t v20 = *(void *)(a1 + 24);
      swift_bridgeObjectRetain();
      *(void *)&long long v55 = sub_10001FB10(v19, v20, v54);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      swift_bridgeObjectRelease();
      os_log_t v21 = v47;
      _os_log_impl((void *)&_mh_execute_header, v47, (os_log_type_t)v48, "[%@] Building AMSMetricsEvent for topic: %{public}s", (uint8_t *)v14, 0x16u);
      sub_1000034A8(&qword_10003A3A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v51 + 8))(v7, v50);
    }
    else
    {

      swift_release();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    id v22 = objc_allocWithZone((Class)AMSMetricsEvent);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v8 = [v22 initWithUnderlyingDictionary:isa];

    if (*(void *)(a1 + 104)) {
      objc_msgSend(v8, "setEventTime:");
    }
    if (*(void *)(a1 + 80))
    {
      swift_bridgeObjectRetain();
      NSString v24 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v8 setDiagnosticsSubmissionBugType:v24];
    }
    int v25 = *(unsigned __int8 *)(a1 + 88);
    if (v25 != 2) {
      [v8 setPreventSampling:v25 & 1];
    }
    uint64_t v26 = *(void *)(a1 + 96);
    if (v26)
    {
      int64_t v27 = *(void *)(v26 + 16);
      uint64_t v28 = &_swiftEmptyArrayStorage;
      if (v27)
      {
        v54[0] = (uint64_t)&_swiftEmptyArrayStorage;
        swift_bridgeObjectRetain();
        sub_10001318C(0, v27, 0);
        uint64_t v29 = 0;
        uint64_t v28 = (void *)v54[0];
        do
        {
          unint64_t v30 = 0xE300000000000000;
          uint64_t v31 = 7368801;
          switch(*(unsigned char *)(v26 + v29 + 32))
          {
            case 1:
              uint64_t v31 = 0x6973726556707061;
              unint64_t v30 = 0xEA00000000006E6FLL;
              break;
            case 2:
              unint64_t v30 = 0xEB000000006E6F69;
              uint64_t v31 = 0x7372655665736162;
              break;
            case 3:
              unint64_t v30 = 0xEC0000006E6F6973;
              uint64_t v31 = 0x726556746E657665;
              break;
            case 4:
              unint64_t v30 = 0xEE006E6F69737265;
              uint64_t v31 = 0x56646C697542736FLL;
              break;
            case 5:
              unint64_t v30 = 0xE600000000000000;
              uint64_t v31 = 0x656D614E736FLL;
              break;
            case 6:
              unint64_t v30 = 0xE90000000000006ELL;
              uint64_t v31 = 0x6F6973726556736FLL;
              break;
            case 7:
              unint64_t v30 = 0xEE0074657366664FLL;
              uint64_t v31 = 0x656E6F7A656D6974;
              break;
            default:
              break;
          }
          v54[0] = (uint64_t)v28;
          unint64_t v33 = v28[2];
          unint64_t v32 = v28[3];
          if (v33 >= v32 >> 1)
          {
            sub_10001318C(v32 > 1, v33 + 1, 1);
            uint64_t v28 = (void *)v54[0];
          }
          ++v29;
          v28[2] = v33 + 1;
          long long v34 = (char *)&v28[2 * v33];
          *((void *)v34 + 4) = v31;
          *((void *)v34 + 5) = v30;
        }
        while (v27 != v29);
        swift_bridgeObjectRelease();
      }
      sub_100024AE8((uint64_t)v28);
      swift_bridgeObjectRelease();
      Class v35 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v8 removePropertiesForKeys:v35];
    }
    sub_1000034A8(&qword_100039B68);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_10002C520;
    *(void *)(v36 + 32) = 0x6973726556707061;
    *(void *)(v36 + 40) = 0xEA00000000006E6FLL;
    *(void *)(v36 + 56) = &type metadata for String;
    strcpy((char *)(v36 + 64), "hardwareFamily");
    *(unsigned char *)(v36 + 79) = -18;
    *(void *)(v36 + 120) = &type metadata for String;
    *(void *)(v36 + 88) = &type metadata for String;
    *(void *)(v36 + 96) = 29551;
    *(void *)(v36 + 104) = 0xE200000000000000;
    Class v37 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v8 removePropertiesForKeys:v37];

    if (isAppInstallationMetricsEnabled()())
    {
      id v38 = [v8 underlyingDictionary];
      uint64_t v39 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v52 = 0x64497344746C61;
      unint64_t v53 = 0xE700000000000000;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v39 + 16) && (unint64_t v40 = sub_1000152CC((uint64_t)v54), (v41 & 1) != 0))
      {
        sub_10000D330(*(void *)(v39 + 56) + 32 * v40, (uint64_t)&v55);
      }
      else
      {
        long long v55 = 0u;
        long long v56 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10000D1B4((uint64_t)v54);
      if (*((void *)&v56 + 1))
      {
        if (swift_dynamicCast())
        {
          id v42 = [self defaultStore];
          if (!v42)
          {
            __break(1u);
            JUMPOUT(0x10000A258);
          }
          uint64_t v43 = v42;
          NSString v44 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          id v45 = objc_msgSend(v43, "ams_iTunesAccountWithAltDSID:", v44);

          if (v45)
          {
            [v8 setAccount:v45];
          }
        }
      }
      else
      {
        sub_10000D2D4((uint64_t)&v55, &qword_100039B40);
      }
    }
    else
    {
      [v8 setAnonymous:1];
    }
  }
  return v8;
}

void *sub_10000A278(unint64_t a1, void *a2)
{
  if (a1 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v4 = _CocoaArrayWrapper.endIndex.getter();
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      uint64_t v5 = 4;
      do
      {
        uint64_t v6 = v5 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          uint64_t v7 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1)) {
            goto LABEL_15;
          }
        }
        else
        {
          uint64_t v7 = *(void *)(a1 + 8 * v5);
          swift_retain();
          uint64_t v8 = v5 - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
        }
        id v9 = sub_100009A74(v7, a2);
        swift_release();
        if (v9)
        {
          specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
          if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          }
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
        }
        ++v5;
      }
      while (v8 != v4);
    }
  }
  swift_bridgeObjectRelease();
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10000A400(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[6] = a3;
  v4[7] = v3;
  v4[4] = a1;
  v4[5] = a2;
  uint64_t v5 = type metadata accessor for Logger();
  v4[8] = v5;
  v4[9] = *(void *)(v5 - 8);
  v4[10] = swift_task_alloc();
  return _swift_task_switch(sub_10000A4C4, v3, 0);
}

uint64_t sub_10000A4C4()
{
  unint64_t v1 = (unint64_t)&_swiftEmptyArrayStorage;
  *(void *)(v0 + 16) = &_swiftEmptyArrayStorage;
  uint64_t v2 = (unint64_t *)(v0 + 16);
  if (sub_100007EC8(*(void *)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48)))
  {
    swift_retain();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_release();
    unint64_t v1 = *v2;
  }
  *(void *)(v0 + 88) = v1;
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v6) {
      goto LABEL_7;
    }
  }
  else if (*(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_7:
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100039B50 + dword_100039B50);
    uint64_t v3 = (void *)swift_task_alloc();
    *(void *)(v0 + 96) = v3;
    *uint64_t v3 = v0;
    v3[1] = sub_10000A7E4;
    uint64_t v4 = *(void *)(v0 + 48);
    return v16(v1, v4);
  }
  uint64_t v7 = *(void **)(v0 + 48);
  swift_bridgeObjectRelease();
  static Logger.events.getter();
  id v8 = v7;
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  int v12 = *(void **)(v0 + 48);
  if (v11)
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    id v17 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 138412290;
    *(void *)(v0 + 24) = v12;
    id v14 = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *id v17 = v12;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "[%@] Failed to generate an AMS metrics event", v13, 0xCu);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(void, void))(*(void *)(v0 + 72) + 8))(*(void *)(v0 + 80), *(void *)(v0 + 64));
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t sub_10000A7E4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 56);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_10000A910, v1, 0);
}

uint64_t sub_10000A910()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10000A970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[40] = a4;
  v5[41] = a5;
  v5[38] = a2;
  v5[39] = a3;
  v5[37] = a1;
  uint64_t v6 = sub_1000034A8(&qword_100039BD0);
  v5[42] = v6;
  v5[43] = *(void *)(v6 - 8);
  v5[44] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Logger();
  v5[45] = v7;
  v5[46] = *(void *)(v7 - 8);
  v5[47] = swift_task_alloc();
  uint64_t v8 = sub_1000034A8(&qword_100039BD8);
  v5[48] = v8;
  v5[49] = *(void *)(v8 - 8);
  v5[50] = swift_task_alloc();
  return _swift_task_switch(sub_10000AAF8, 0, 0);
}

uint64_t sub_10000AAF8()
{
  if (v0[39])
  {
    uint64_t v1 = v0 + 10;
    uint64_t v2 = v0[49];
    uint64_t v3 = v0[50];
    uint64_t v4 = v0[48];
    id v29 = (id)v0[40];
    NSString v5 = String._bridgeToObjectiveC()();
    v0[51] = v5;
    v0[10] = v0;
    v0[15] = v0 + 34;
    v0[11] = sub_10000AFB0;
    swift_continuation_init();
    v0[25] = v4;
    uint64_t v6 = sub_10000D090(v0 + 22);
    sub_1000034A8(&qword_100039BF0);
    sub_1000034A8(&qword_10003A390);
    CheckedContinuation.init(continuation:function:)();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v2 + 32))(v6, v3, v4);
    v0[18] = _NSConcreteStackBlock;
    v0[19] = 1107296256;
    v0[20] = sub_1000062A4;
    v0[21] = &unk_100035990;
    [v29 accountWithIdentifier:v5 completion:v0 + 18];
  }
  else
  {
    uint64_t v7 = (void *)v0[41];
    static Logger.events.getter();
    id v8 = v7;
    id v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    BOOL v11 = os_log_type_enabled(v9, v10);
    int v12 = (void *)v0[41];
    if (v11)
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      id v14 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 138412290;
      v0[36] = v12;
      id v15 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v14 = v12;

      _os_log_impl((void *)&_mh_execute_header, v9, v10, "[%@] Falling back to lookup by DSID", v13, 0xCu);
      sub_1000034A8(&qword_10003A3A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      id v9 = v0[41];
    }
    uint64_t v1 = v0 + 2;
    uint64_t v17 = v0[46];
    uint64_t v16 = v0[47];
    uint64_t v18 = v0[44];
    uint64_t v19 = v0[45];
    uint64_t v21 = v0[42];
    uint64_t v20 = v0[43];
    id v30 = (id)v0[40];

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v19);
    sub_1000034A8(&qword_100039BE0);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_10002C530;
    *(void *)(v22 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v22 + 40) = v23;
    *(void *)(v22 + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v22 + 56) = v24;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    v0[53] = isa;
    swift_bridgeObjectRelease();
    Class v26 = Array._bridgeToObjectiveC()().super.isa;
    v0[54] = v26;
    v0[2] = v0;
    v0[7] = v0 + 35;
    v0[3] = sub_10000B4A0;
    swift_continuation_init();
    v0[33] = v21;
    int64_t v27 = sub_10000D090(v0 + 30);
    sub_1000034A8(&qword_100039BE8);
    sub_1000034A8(&qword_10003A390);
    CheckedContinuation.init(continuation:function:)();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v20 + 32))(v27, v18, v21);
    v0[26] = _NSConcreteStackBlock;
    v0[27] = 1107296256;
    v0[28] = sub_100006340;
    v0[29] = &unk_100035968;
    objc_msgSend(v30, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", isa, v26);
  }
  return _swift_continuation_await(v1);
}

uint64_t sub_10000AFB0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 112);
  *(void *)(*(void *)v0 + 416) = v1;
  if (v1) {
    uint64_t v2 = sub_10000B74C;
  }
  else {
    uint64_t v2 = sub_10000B0C0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000B0C0()
{
  uint64_t v1 = *(void *)(v0 + 272);

  if (v1)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v2(v1);
  }
  else
  {
    uint64_t v4 = *(void **)(v0 + 328);
    static Logger.events.getter();
    id v5 = v4;
    uint64_t v6 = Logger.logObject.getter();
    os_log_type_t v7 = static os_log_type_t.default.getter();
    BOOL v8 = os_log_type_enabled(v6, v7);
    id v9 = *(void **)(v0 + 328);
    if (v8)
    {
      os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
      BOOL v11 = (void *)swift_slowAlloc();
      *(_DWORD *)os_log_type_t v10 = 138412290;
      *(void *)(v0 + 288) = v9;
      id v12 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *BOOL v11 = v9;

      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Falling back to lookup by DSID", v10, 0xCu);
      sub_1000034A8(&qword_10003A3A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v6 = *(NSObject **)(v0 + 328);
    }
    uint64_t v14 = *(void *)(v0 + 368);
    uint64_t v13 = *(void *)(v0 + 376);
    uint64_t v15 = *(void *)(v0 + 352);
    uint64_t v16 = *(void *)(v0 + 360);
    uint64_t v18 = *(void *)(v0 + 336);
    uint64_t v17 = *(void *)(v0 + 344);
    int v25 = *(void **)(v0 + 320);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v16);
    sub_1000034A8(&qword_100039BE0);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_10002C530;
    *(void *)(v19 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v19 + 40) = v20;
    *(void *)(v19 + 48) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v19 + 56) = v21;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    *(void *)(v0 + 424) = isa;
    swift_bridgeObjectRelease();
    Class v23 = Array._bridgeToObjectiveC()().super.isa;
    *(void *)(v0 + 432) = v23;
    *(void *)(v0 + 16) = v0;
    *(void *)(v0 + 56) = v0 + 280;
    *(void *)(v0 + 24) = sub_10000B4A0;
    swift_continuation_init();
    *(void *)(v0 + 264) = v18;
    uint64_t v24 = sub_10000D090((uint64_t *)(v0 + 240));
    sub_1000034A8(&qword_100039BE8);
    sub_1000034A8(&qword_10003A390);
    CheckedContinuation.init(continuation:function:)();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 32))(v24, v15, v18);
    *(void *)(v0 + 208) = _NSConcreteStackBlock;
    *(void *)(v0 + 216) = 1107296256;
    *(void *)(v0 + 224) = sub_100006340;
    *(void *)(v0 + 232) = &unk_100035968;
    objc_msgSend(v25, "accountsWithAccountTypeIdentifiers:preloadedProperties:completion:", isa, v23);
    return _swift_continuation_await(v0 + 16);
  }
}

uint64_t sub_10000B4A0()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 440) = v1;
  if (v1) {
    uint64_t v2 = sub_10000B7DC;
  }
  else {
    uint64_t v2 = sub_10000B5B0;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10000B5B0()
{
  uint64_t v1 = *(void **)(v0 + 424);
  unint64_t v2 = *(void *)(v0 + 280);

  if (v2)
  {
    if (v2 >> 62) {
      goto LABEL_14;
    }
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v3; uint64_t v3 = _CocoaArrayWrapper.endIndex.getter())
    {
      uint64_t v4 = 0;
      while (1)
      {
        id v5 = (v2 & 0xC000000000000001) != 0
           ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
           : *(id *)(v2 + 8 * v4 + 32);
        uint64_t v6 = v5;
        uint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          break;
        }
        id v8 = objc_msgSend(v5, "ams_DSID");
        if (v8)
        {
          id v9 = v8;
          id v10 = *(id *)(v0 + 296);
          id v11 = [v8 longLongValue];

          if (v11 == v10)
          {
            swift_bridgeObjectRelease_n();
            goto LABEL_17;
          }
        }

        ++v4;
        if (v7 == v3) {
          goto LABEL_15;
        }
      }
      __break(1u);
LABEL_14:
      swift_bridgeObjectRetain();
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
  }
  uint64_t v6 = 0;
LABEL_17:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v12 = *(uint64_t (**)(void *))(v0 + 8);
  return v12(v6);
}

uint64_t sub_10000B74C()
{
  uint64_t v1 = *(void **)(v0 + 408);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_10000B7DC()
{
  uint64_t v1 = (void *)v0[54];
  unint64_t v2 = (void *)v0[53];
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10000B874(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[11] = a2;
  v3[12] = a3;
  v3[10] = a1;
  uint64_t v4 = type metadata accessor for Logger();
  v3[13] = v4;
  v3[14] = *(void *)(v4 - 8);
  v3[15] = swift_task_alloc();
  v3[16] = swift_task_alloc();
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for AppInstallationEligibility();
  v3[20] = v5;
  v3[21] = *(void *)(v5 - 8);
  v3[22] = swift_task_alloc();
  v3[23] = swift_task_alloc();
  return _swift_task_switch(sub_10000B9D8, 0, 0);
}

uint64_t sub_10000B9D8()
{
  uint64_t v1 = v0[23];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[21];
  AppInstallationEvent.eligibility.getter();
  uint64_t v4 = AppInstallationEligibility.accountID.getter();
  char v6 = v5;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v7(v1, v2);
  if (v6)
  {
    uint64_t v17 = (void *)v0[12];
    static Logger.events.getter();
    id v18 = v17;
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    BOOL v21 = os_log_type_enabled(v19, v20);
    uint64_t v22 = (void *)v0[12];
    if (v21)
    {
      Class v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v24 = (void *)swift_slowAlloc();
      *(_DWORD *)Class v23 = 138412290;
      v0[2] = v22;
      id v25 = v22;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v24 = v22;

      _os_log_impl((void *)&_mh_execute_header, v19, v20, "[%@] GS lookup failed due to missing accountID", v23, 0xCu);
      sub_1000034A8(&qword_10003A3A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(void, void))(v0[14] + 8))(v0[17], v0[13]);
    uint64_t v26 = (_OWORD *)v0[10];
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v26[1] = 0u;
    v26[2] = 0u;
    *uint64_t v26 = 0u;
    int64_t v27 = (uint64_t (*)(void))v0[1];
    return v27();
  }
  else
  {
    uint64_t v8 = v0[22];
    uint64_t v9 = v0[20];
    id v10 = objc_msgSend(self, "ams_sharedAccountStoreForMediaType:", AMSAccountMediaTypeProduction);
    v0[24] = v10;
    AppInstallationEvent.eligibility.getter();
    uint64_t v11 = AppInstallationEligibility.accountIdentifier.getter();
    uint64_t v13 = v12;
    v0[25] = v12;
    v7(v8, v9);
    uint64_t v14 = (void *)swift_task_alloc();
    v0[26] = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_10000BD10;
    uint64_t v15 = v0[12];
    return sub_10000A970(v4, v11, v13, (uint64_t)v10, v15);
  }
}

uint64_t sub_10000BD10(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 216) = a1;
  *(void *)(v3 + 224) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  if (v1) {
    uint64_t v4 = sub_10000C2A4;
  }
  else {
    uint64_t v4 = sub_10000BE44;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000BE44()
{
  uint64_t v1 = *(void **)(v0 + 216);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 192);
    id v3 = v1;
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = objc_allocWithZone((Class)AMSServiceTokenTask);
    id v6 = v2;
    id v7 = [v5 initWithAccount:v3 accountStore:v6 serviceIdentifier:v4 useCachedServiceToken:1];
    *(void *)(v0 + 232) = v7;

    *(void *)(v0 + 240) = [v7 perform];
    uint64_t v8 = (void *)swift_task_alloc();
    *(void *)(v0 + 248) = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_10000C170;
    return sub_100006408();
  }
  else
  {
    id v10 = *(void **)(v0 + 96);
    static Logger.events.getter();
    id v11 = v10;
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.error.getter();
    BOOL v14 = os_log_type_enabled(v12, v13);
    uint64_t v15 = *(void **)(v0 + 96);
    if (v14)
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 138412290;
      *(void *)(v0 + 24) = v15;
      id v18 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v17 = v15;

      _os_log_impl((void *)&_mh_execute_header, v12, v13, "[%@] GS lookup failed due to missing account", v16, 0xCu);
      sub_1000034A8(&qword_10003A3A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      uint64_t v12 = *(NSObject **)(v0 + 96);
    }
    uint64_t v19 = *(void *)(v0 + 144);
    uint64_t v20 = *(void *)(v0 + 104);
    uint64_t v21 = *(void *)(v0 + 112);

    (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
    uint64_t v22 = *(_OWORD **)(v0 + 80);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v22[1] = 0u;
    v22[2] = 0u;
    *uint64_t v22 = 0u;
    Class v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23();
  }
}

uint64_t sub_10000C170(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 256) = v2;
  swift_task_dealloc();
  if (v2)
  {
    id v7 = sub_10000CA58;
  }
  else
  {
    *(void *)(v6 + 264) = a2;
    *(void *)(v6 + 272) = a1;
    id v7 = sub_10000C68C;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_10000C2A4()
{
  uint64_t v1 = *(void **)(v0 + 96);
  static Logger.events.getter();
  id v2 = v1;
  swift_errorRetain();
  id v3 = v2;
  swift_errorRetain();
  NSString v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 96);
    log = v4;
    uint64_t v7 = swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(void *)(v0 + 32) = v6;
    *(_DWORD *)uint64_t v7 = 138412546;
    id v9 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v8 = v6;

    *(_WORD *)(v7 + 12) = 2114;
    swift_errorRetain();
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v8[1] = v10;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v5, "[%@] GS lookup failed due to account lookup error: %{public}@", (uint8_t *)v7, 0x16u);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    id v11 = *(void **)(v0 + 96);
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(void, void))(*(void *)(v0 + 112) + 8))(*(void *)(v0 + 152), *(void *)(v0 + 104));
  uint64_t v12 = *(void **)(v0 + 96);
  static Logger.events.getter();
  id v13 = v12;
  BOOL v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v17 = *(void **)(v0 + 96);
  if (v16)
  {
    id v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v19 = (void *)swift_slowAlloc();
    *(_DWORD *)id v18 = 138412290;
    *(void *)(v0 + 24) = v17;
    id v20 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v19 = v17;

    _os_log_impl((void *)&_mh_execute_header, v14, v15, "[%@] GS lookup failed due to missing account", v18, 0xCu);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    BOOL v14 = *(NSObject **)(v0 + 96);
  }
  uint64_t v21 = *(void *)(v0 + 144);
  uint64_t v22 = *(void *)(v0 + 104);
  uint64_t v23 = *(void *)(v0 + 112);

  (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v21, v22);
  uint64_t v24 = *(_OWORD **)(v0 + 80);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v24[1] = 0u;
  v24[2] = 0u;
  _OWORD *v24 = 0u;
  id v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

uint64_t sub_10000C68C()
{
  uint64_t v1 = *(void *)(v0 + 264);
  id v2 = *(void **)(v0 + 232);

  *(void *)(v0 + 280) = *(void *)(v0 + 272);
  *(void *)(v0 + 288) = v1;
  id v3 = *(void **)(v0 + 192);
  id v4 = *(id *)(v0 + 216);
  NSString v5 = String._bridgeToObjectiveC()();
  id v6 = objc_allocWithZone((Class)AMSServiceTokenTask);
  id v7 = v3;
  id v8 = [v6 initWithAccount:v4 accountStore:v7 serviceIdentifier:v5 useCachedServiceToken:1];
  *(void *)(v0 + 296) = v8;

  *(void *)(v0 + 304) = [v8 perform];
  id v9 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v9;
  void *v9 = v0;
  v9[1] = sub_10000C7D4;
  return sub_100006408();
}

uint64_t sub_10000C7D4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 320) = v2;
  swift_task_dealloc();
  if (v2)
  {
    id v7 = sub_10000CD84;
  }
  else
  {
    *(void *)(v6 + 328) = a2;
    *(void *)(v6 + 336) = a1;
    id v7 = sub_10000C908;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_10000C908()
{
  uint64_t v16 = *(void *)(v0 + 328);
  uint64_t v1 = *(void **)(v0 + 296);

  uint64_t v15 = *(void *)(v0 + 336);
  id v2 = objc_msgSend(*(id *)(v0 + 216), "ams_altDSID");
  id v3 = *(void **)(v0 + 216);
  id v4 = *(void **)(v0 + 192);
  if (v2)
  {
    NSString v5 = v2;
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = v7;
    uint64_t v14 = v6;
  }
  else
  {

    uint64_t v13 = 0;
    uint64_t v14 = 0;
  }
  uint64_t v8 = *(void *)(v0 + 280);
  uint64_t v9 = *(void *)(v0 + 288);
  uint64_t v10 = *(uint64_t **)(v0 + 80);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  *uint64_t v10 = v14;
  v10[1] = v13;
  v10[2] = v15;
  v10[3] = v16;
  v10[4] = v8;
  v10[5] = v9;
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_10000CA58()
{
  uint64_t v1 = *(void **)(v0 + 240);
  id v2 = *(void **)(v0 + 96);

  static Logger.events.getter();
  id v3 = v2;
  swift_errorRetain();
  id v4 = v3;
  swift_errorRetain();
  NSString v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void **)(v0 + 96);
    log = v5;
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(void *)(v0 + 64) = v7;
    *(_DWORD *)uint64_t v8 = 138412546;
    id v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v9 = v7;

    *(_WORD *)(v8 + 12) = 2114;
    swift_errorRetain();
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 72) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v9[1] = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v6, "[%@] GS lookup failed while getting grandSlamJWT token due to error: %{public}@", (uint8_t *)v8, 0x16u);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    uint64_t v12 = *(void **)(v0 + 96);
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(void, void))(*(void *)(v0 + 112) + 8))(*(void *)(v0 + 128), *(void *)(v0 + 104));
  *(void *)(v0 + 280) = 0;
  *(void *)(v0 + 288) = 0;
  uint64_t v13 = *(void **)(v0 + 192);
  id v14 = *(id *)(v0 + 216);
  NSString v15 = String._bridgeToObjectiveC()();
  id v16 = objc_allocWithZone((Class)AMSServiceTokenTask);
  id v17 = v13;
  id v18 = [v16 initWithAccount:v14 accountStore:v17 serviceIdentifier:v15 useCachedServiceToken:1];
  *(void *)(v0 + 296) = v18;

  *(void *)(v0 + 304) = [v18 perform];
  uint64_t v19 = (void *)swift_task_alloc();
  *(void *)(v0 + 312) = v19;
  *uint64_t v19 = v0;
  v19[1] = sub_10000C7D4;
  return sub_100006408();
}

uint64_t sub_10000CD84()
{
  uint64_t v1 = *(void **)(v0 + 296);
  id v2 = *(void **)(v0 + 96);

  static Logger.events.getter();
  id v3 = v2;
  swift_errorRetain();
  id v4 = v3;
  swift_errorRetain();
  NSString v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = *(void **)(v0 + 96);
    loga = v5;
    uint64_t v8 = swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(void *)(v0 + 48) = v7;
    *(_DWORD *)uint64_t v8 = 138412546;
    id v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v9 = v7;

    *(_WORD *)(v8 + 12) = 2114;
    swift_errorRetain();
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 56) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v9[1] = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, loga, v6, "[%@]GS lookup failed while getting grandSlam token due to error: %{public}@", (uint8_t *)v8, 0x16u);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    uint64_t v12 = *(void **)(v0 + 96);
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(void, void))(*(void *)(v0 + 112) + 8))(*(void *)(v0 + 120), *(void *)(v0 + 104));
  id v13 = objc_msgSend(*(id *)(v0 + 216), "ams_altDSID");
  id v14 = *(void **)(v0 + 216);
  NSString v15 = *(void **)(v0 + 192);
  if (v13)
  {
    id v16 = v13;
    uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v18;
    os_log_t log = (os_log_t)v17;
  }
  else
  {

    uint64_t v24 = 0;
    os_log_t log = 0;
  }
  uint64_t v19 = *(NSObject **)(v0 + 280);
  id v20 = *(NSObject **)(v0 + 288);
  uint64_t v21 = *(os_log_t **)(v0 + 80);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  *uint64_t v21 = log;
  v21[1] = v24;
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = v19;
  v21[5] = v20;
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t *sub_10000D090(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10000D0F4(uint64_t a1, uint64_t a2)
{
  return sub_10000D330(a2 + 32, a1 + 32);
}

uint64_t sub_10000D118(uint64_t a1)
{
  return sub_10000D120(a1 + 32);
}

uint64_t sub_10000D120(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void *sub_10000D170(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000D1B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000D208(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000D264()
{
  return swift_release();
}

uint64_t sub_10000D26C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000034A8(&qword_100039B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D2D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000034A8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D330(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10000D38C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D39C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000D3E4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D43C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_10000D48C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000D4E0(unsigned __int8 *a1, char *a2)
{
  return sub_1000108EC(*a1, *a2);
}

Swift::Int sub_10000D4EC()
{
  return Hasher._finalize()();
}

uint64_t sub_10000D5AC()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000D654()
{
  return Hasher._finalize()();
}

unint64_t sub_10000D710@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10000E588(*a1);
  *a2 = result;
  return result;
}

void sub_10000D740(uint64_t *a1@<X8>)
{
  uint64_t v2 = 5129543;
  switch(*v1)
  {
    case 1:
      uint64_t v2 = 5064002;
      goto LABEL_3;
    case 2:
      *a1 = 5525065;
      a1[1] = 0xE300000000000000;
      break;
    case 3:
      *a1 = 4144959;
      a1[1] = 0xE300000000000000;
      break;
    case 4:
      *a1 = 0;
      a1[1] = 0xE000000000000000;
      break;
    default:
LABEL_3:
      *a1 = v2;
      a1[1] = 0xE300000000000000;
      break;
  }
}

uint64_t sub_10000D7C4(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v4 = 0xE000000000000000;
    uint64_t v5 = 0;
    switch((char)a1)
    {
      case 1:
        unint64_t v4 = 0xE300000000000000;
        uint64_t v5 = 5064002;
        break;
      case 2:
        unint64_t v4 = 0xE300000000000000;
        uint64_t v5 = 5525065;
        break;
      case 3:
        unint64_t v4 = 0xE300000000000000;
        uint64_t v5 = 4144959;
        break;
      case 4:
        break;
      default:
        unint64_t v4 = 0xE300000000000000;
        uint64_t v5 = 5129543;
        break;
    }
    unint64_t v6 = v4;
    String.append(_:)(*(Swift::String *)&v5);
    swift_bridgeObjectRelease();
    sub_10000E32C();
    v7._countAndFlagsBits = String.init<A>(_:radix:uppercase:)();
    String.append(_:)(v7);
    swift_bridgeObjectRelease();
    return 0;
  }
  return a1;
}

uint64_t sub_10000D8E4()
{
  return sub_10000D7C4(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_10000D8F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10000D170(a1, a1[3]);
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2) {
    return sub_10000D120((uint64_t)a1);
  }
  sub_10000D170(v9, v9[3]);
  uint64_t v5 = dispatch thunk of SingleValueDecodingContainer.decode(_:)();
  uint64_t v7 = v6;
  sub_10000D120((uint64_t)v9);
  uint64_t result = sub_10000D120((uint64_t)a1);
  *(void *)a2 = v5;
  *(void *)(a2 + 8) = v7;
  *(unsigned char *)(a2 + 16) = 1;
  return result;
}

uint64_t sub_10000D9C4(void *a1)
{
  uint64_t v2 = *(void *)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  char v4 = *(unsigned char *)(v1 + 16);
  sub_10000D170(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  sub_10000D7C4(v2, v3, v4);
  sub_10000D43C((uint64_t)v6, v7);
  dispatch thunk of SingleValueEncodingContainer.encode(_:)();
  swift_bridgeObjectRelease();
  return sub_10000D120((uint64_t)v6);
}

id sub_10000DA8C(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_10000D170(a1, a1[3]);
  uint64_t v6 = v1;
  id v7 = v5;
  dispatch thunk of Decoder.singleValueContainer()();
  if (v2)
  {

    sub_10000D120((uint64_t)a1);
    swift_deallocPartialClassInstance();
  }
  else
  {
    sub_10000D170(v13, v13[3]);
    sub_10000E284();
    dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
    char v9 = v12;
    id v10 = (objc_super *)&v6[OBJC_IVAR____TtC28AppInstallationMetricsDaemon6LogKey_representation];
    *id v10 = v11[1];
    LOBYTE(v10[1].receiver) = v9;

    sub_10000D120((uint64_t)v13);
    v11[0].receiver = v6;
    v11[0].super_class = ObjectType;
    id v7 = [(objc_super *)v11 init];
    sub_10000D120((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_10000DBF8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon6LogKey_representation;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon6LogKey_representation);
  if (*(unsigned char *)(v1 + 16) == 1)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v3 = 0xE000000000000000;
    uint64_t v4 = 0;
    switch((char)v2)
    {
      case 1:
        unint64_t v3 = 0xE300000000000000;
        uint64_t v4 = 5064002;
        break;
      case 2:
        unint64_t v3 = 0xE300000000000000;
        uint64_t v4 = 5525065;
        break;
      case 3:
        unint64_t v3 = 0xE300000000000000;
        uint64_t v4 = 4144959;
        break;
      case 4:
        break;
      default:
        unint64_t v3 = 0xE300000000000000;
        uint64_t v4 = 5129543;
        break;
    }
    unint64_t v5 = v3;
    String.append(_:)(*(Swift::String *)&v4);
    swift_bridgeObjectRelease();
    sub_10000E32C();
    v6._countAndFlagsBits = String.init<A>(_:radix:uppercase:)();
    String.append(_:)(v6);
    swift_bridgeObjectRelease();
    return 0;
  }
  return v2;
}

id sub_10000DD44(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4 = a1;
  a3();

  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10000DDB4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon6LogKey_representation;
  uint64_t v2 = *(void *)(v0 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon6LogKey_representation);
  if (*(unsigned char *)(v1 + 16) == 1)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    unint64_t v3 = 0xE000000000000000;
    uint64_t v4 = 0;
    switch((char)v2)
    {
      case 1:
        unint64_t v3 = 0xE300000000000000;
        uint64_t v4 = 5064002;
        break;
      case 2:
        unint64_t v3 = 0xE300000000000000;
        uint64_t v4 = 5525065;
        break;
      case 3:
        unint64_t v3 = 0xE300000000000000;
        uint64_t v4 = 4144959;
        break;
      case 4:
        break;
      default:
        unint64_t v3 = 0xE300000000000000;
        uint64_t v4 = 5129543;
        break;
    }
    unint64_t v5 = v3;
    String.append(_:)(*(Swift::String *)&v4);
    swift_bridgeObjectRelease();
    sub_10000E32C();
    v6._countAndFlagsBits = String.init<A>(_:radix:uppercase:)();
    String.append(_:)(v6);
    swift_bridgeObjectRelease();
    return 0;
  }
  return v2;
}

id sub_10000DF18()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for LogKey()
{
  return self;
}

uint64_t sub_10000DF90(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for LogKey.Representation(uint64_t a1)
{
  return sub_10000DFB0(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16));
}

uint64_t sub_10000DFB0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t _s28AppInstallationMetricsDaemon6LogKeyC14RepresentationOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000DF90(*(void *)a2, v4, v5);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for LogKey.Representation(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  sub_10000DF90(*(void *)a2, v4, v5);
  uint64_t v6 = *(void *)a1;
  uint64_t v7 = *(void *)(a1 + 8);
  char v8 = *(unsigned char *)(a1 + 16);
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_10000DFB0(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for LogKey.Representation(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for LogKey.Representation(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  uint64_t v4 = *(void *)a1;
  uint64_t v5 = *(void *)(a1 + 8);
  char v6 = *(unsigned char *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_10000DFB0(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for LogKey.Representation(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for LogKey.Representation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_10000E14C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_10000E158(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for LogKey.Representation()
{
  return &type metadata for LogKey.Representation;
}

id sub_10000E174@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  id result = sub_10000DA8C(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10000E1C4(void *a1)
{
  sub_10000D170(a1, a1[3]);
  dispatch thunk of Encoder.singleValueContainer()();
  sub_10000D43C((uint64_t)v2, v3);
  sub_10000E2D8();
  dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
  return sub_10000D120((uint64_t)v2);
}

unint64_t sub_10000E284()
{
  unint64_t result = qword_100039C30;
  if (!qword_100039C30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039C30);
  }
  return result;
}

unint64_t sub_10000E2D8()
{
  unint64_t result = qword_100039C38;
  if (!qword_100039C38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039C38);
  }
  return result;
}

unint64_t sub_10000E32C()
{
  unint64_t result = qword_100039C40;
  if (!qword_100039C40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039C40);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for LogKey.Prefix(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LogKey.Prefix(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
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
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for LogKey.Prefix(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
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
        JUMPOUT(0x10000E4E8);
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
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_10000E510(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000E518(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LogKey.Prefix()
{
  return &type metadata for LogKey.Prefix;
}

unint64_t sub_10000E534()
{
  unint64_t result = qword_100039C48;
  if (!qword_100039C48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039C48);
  }
  return result;
}

unint64_t sub_10000E588(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100035300, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 5) {
    return 5;
  }
  else {
    return v3;
  }
}

uint64_t sub_10000E5D4(uint64_t a1, uint64_t a2)
{
  strcpy((char *)(v2 + 16), "xp_app_install");
  *(unsigned char *)(v2 + 31) = -18;
  *(void *)(v2 + 32) = &_swiftEmptyArrayStorage;
  *(void *)(v2 + 40) = 0x40F5180000000000;
  *(unsigned char *)(v2 + 48) = 0;
  *(void *)(v2 + 56) = 0;
  *(unsigned char *)(v2 + 64) = 1;
  *(void *)(v2 + 72) = 0;
  *(void *)(v2 + 80) = 0;
  *(unsigned char *)(v2 + 88) = 2;
  *(void *)(v2 + 96) = &off_100035238;
  *(void *)(v2 + 104) = a2;
  *(void *)(v2 + 112) = a1;
  return v2;
}

uint64_t sub_10000E640(char *a1, char *a2)
{
  return sub_100010844(*a1, *a2);
}

Swift::Int sub_10000E64C()
{
  return Hasher._finalize()();
}

uint64_t sub_10000E6D0()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000E740()
{
  return Hasher._finalize()();
}

uint64_t sub_10000E7C0@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100035398, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void sub_10000E820(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x6369706F74;
  if (*v1) {
    uint64_t v2 = 0x707954746E657665;
  }
  unint64_t v3 = 0xE500000000000000;
  if (*v1) {
    unint64_t v3 = 0xE900000000000065;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_10000E860()
{
  if (*v0) {
    return 0x707954746E657665;
  }
  else {
    return 0x6369706F74;
  }
}

uint64_t sub_10000E89C@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  Swift::Int v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100035398, v3);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

uint64_t sub_10000E900()
{
  return 0;
}

void sub_10000E90C(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000E918(uint64_t a1)
{
  unint64_t v2 = sub_10000EBF0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000E954(uint64_t a1)
{
  unint64_t v2 = sub_10000EBF0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000E990()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10000E9E0()
{
  sub_10000E990();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ASEEvent()
{
  return self;
}

uint64_t sub_10000EA38(void *a1)
{
  uint64_t v2 = sub_1000034A8(&qword_100039D40);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  unsigned int v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000D170(a1, a1[3]);
  sub_10000EBF0();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v9 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

unint64_t sub_10000EB74(uint64_t a1)
{
  unint64_t result = sub_10000EB9C();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000EB9C()
{
  unint64_t result = qword_100039B98;
  if (!qword_100039B98)
  {
    type metadata accessor for ASEEvent();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039B98);
  }
  return result;
}

unint64_t sub_10000EBF0()
{
  unint64_t result = qword_100039D48;
  if (!qword_100039D48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039D48);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for SupplementalField(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for ASEEvent.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000EDA0);
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

unsigned char *sub_10000EDC8(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ASEEvent.CodingKeys()
{
  return &type metadata for ASEEvent.CodingKeys;
}

unint64_t sub_10000EDE8()
{
  unint64_t result = qword_100039D50;
  if (!qword_100039D50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039D50);
  }
  return result;
}

unint64_t sub_10000EE40()
{
  unint64_t result = qword_100039D58;
  if (!qword_100039D58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039D58);
  }
  return result;
}

unint64_t sub_10000EE98()
{
  unint64_t result = qword_100039D60;
  if (!qword_100039D60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039D60);
  }
  return result;
}

uint64_t sub_10000EEEC(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for AppInstallType();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  int v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v2, v4);
  int v9 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v8, v4);
  if (v9 == enum case for AppInstallType.autoDownload(_:)) {
    return 0x6E776F446F747561;
  }
  int v11 = v9;
  if (v9 == enum case for AppInstallType.buy(_:)) {
    return 7959906;
  }
  if (v9 == enum case for AppInstallType.clipBuy(_:)) {
    return 0x79754270696C63;
  }
  if (v9 == enum case for AppInstallType.promotion(_:)) {
    return 0x6F69746F6D6F7270;
  }
  if (v9 == enum case for AppInstallType.queue(_:)) {
    return 0x6575657571;
  }
  if (v9 == enum case for AppInstallType.redownload(_:)) {
    return 0x6F6C6E776F646572;
  }
  if (v9 == enum case for AppInstallType.restore(_:)) {
    return 0x65726F74736572;
  }
  if (v9 == enum case for AppInstallType.restoreUpdate(_:)) {
    return 0x5565726F74736572;
  }
  uint64_t result = 0x64705565726F7473;
  if (v11 != enum case for AppInstallType.storeUpdate(_:))
  {
    if (v11 == enum case for AppInstallType.updateAutomatic(_:))
    {
      if ((a1 & 1) == 0) {
        return 0x7541657461647075;
      }
    }
    else if (v11 == enum case for AppInstallType.betaInstall(_:))
    {
      return 0x74736E4961746562;
    }
    else if (v11 == enum case for AppInstallType.betaUpdate(_:))
    {
      return 0x6164705561746562;
    }
    else
    {
      uint64_t result = 0xD000000000000010;
      if (v11 == enum case for AppInstallType.deviceManagedInstall(_:))
      {
        return 0xD000000000000014;
      }
      else if (v11 == enum case for AppInstallType.deviceManagedUpdate(_:))
      {
        return 0xD000000000000013;
      }
      else if (v11 == enum case for AppInstallType.userManagedInstall(_:))
      {
        return 0xD000000000000012;
      }
      else if (v11 == enum case for AppInstallType.tvProviderBuy(_:))
      {
        return 0x6469766F72507674;
      }
      else if (v11 != enum case for AppInstallType.tvProviderUpdate(_:))
      {
        if (v11 == enum case for AppInstallType.upp(_:))
        {
          return 7368821;
        }
        else if (v11 == enum case for AppInstallType.web(_:))
        {
          return 6448503;
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
          return 0x6E776F6E6B6E75;
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000F378()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for AppInstallType();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v1, v2);
  int v7 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
  uint64_t result = 1;
  if (v7 != enum case for AppInstallType.autoDownload(_:)
    && v7 != enum case for AppInstallType.buy(_:)
    && v7 != enum case for AppInstallType.clipBuy(_:)
    && v7 != enum case for AppInstallType.promotion(_:)
    && v7 != enum case for AppInstallType.queue(_:)
    && v7 != enum case for AppInstallType.redownload(_:)
    && v7 != enum case for AppInstallType.restore(_:)
    && v7 != enum case for AppInstallType.restoreUpdate(_:)
    && v7 != enum case for AppInstallType.storeUpdate(_:)
    && v7 != enum case for AppInstallType.updateAutomatic(_:)
    && v7 != enum case for AppInstallType.betaInstall(_:)
    && v7 != enum case for AppInstallType.betaUpdate(_:)
    && v7 != enum case for AppInstallType.deviceManagedInstall(_:)
    && v7 != enum case for AppInstallType.deviceManagedUpdate(_:)
    && v7 != enum case for AppInstallType.userManagedInstall(_:))
  {
    uint64_t result = 0;
    if (v7 != enum case for AppInstallType.tvProviderBuy(_:) && v7 != enum case for AppInstallType.tvProviderUpdate(_:))
    {
      uint64_t result = 1;
      if (v7 != enum case for AppInstallType.upp(_:) && v7 != enum case for AppInstallType.web(_:))
      {
        (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_10000F600()
{
  uint64_t v0 = type metadata accessor for URL();
  __chkstk_darwin(v0, v1);
  uint64_t v2 = type metadata accessor for Logger();
  v14[3] = *(void *)(v2 - 8);
  v14[4] = v2;
  __chkstk_darwin(v2, v3);
  v14[5] = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URLResourceValues();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  uint64_t v9 = (char *)v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000034A8(&qword_100039D68);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10002C9D0;
  *(void *)(inited + 32) = NSURLIsExcludedFromBackupKey;
  int v11 = NSURLIsExcludedFromBackupKey;
  sub_10000FE50(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  URL.resourceValues(forKeys:)();
  swift_bridgeObjectRelease();
  char v12 = URLResourceValues.isExcludedFromBackup.getter();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v12 & 1;
}

uint64_t sub_10000FA94(char a1)
{
  int v1 = a1 & 1;
  uint64_t v2 = type metadata accessor for Logger();
  __chkstk_darwin(v2, v3);
  uint64_t v4 = type metadata accessor for URLResourceValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_10000F600();
  if ((result & 1) != v1)
  {
    URLResourceValues.init()();
    URLResourceValues.isExcludedFromBackup.setter();
    URL.setResourceValues(_:)();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  return result;
}

uint64_t sub_10000FE50(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  type metadata accessor for URLResourceKey(0);
  sub_10000FEDC();
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = (void **)(a1 + 32);
    do
    {
      uint64_t v5 = *v4++;
      sub_100021DA4(&v6, v5);

      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

unint64_t sub_10000FEDC()
{
  unint64_t result = qword_100039990;
  if (!qword_100039990)
  {
    type metadata accessor for URLResourceKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039990);
  }
  return result;
}

uint64_t sub_10000FF34()
{
  os_activity_scope_state_s v2 = *(os_activity_scope_state_s *)(v0 + 16);
  os_activity_scope_leave(&v2);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for LogActivity()
{
  return self;
}

uint64_t sub_10000FFC0()
{
  qword_100039D70 = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "_os_activity_current");
  return swift_unknownObjectRetain();
}

os_activity_t sub_10000FFFC(os_activity_t description, char a2, void *dso)
{
  uint64_t v4 = (const char *)description;
  if (a2)
  {
    if ((unint64_t)description >> 32)
    {
LABEL_16:
      __break(1u);
      goto LABEL_17;
    }
    if (description >> 11 == 27)
    {
      __break(1u);
      return description;
    }
    if (description >> 16 > 0x10)
    {
      __break(1u);
    }
    else if ((description & 0xFFFFFF80) == 0)
    {
      if (description > 0xFF)
      {
        __break(1u);
        goto LABEL_26;
      }
      unsigned int v6 = ((_BYTE)description + 1);
LABEL_13:
      *(void *)descriptiona = (v6 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << ((32 - (__clz(v6) & 0x38)) & 0x38));
      if (qword_100039758 == -1) {
        return _os_activity_create(dso, descriptiona, (os_activity_t)qword_100039D70, OS_ACTIVITY_FLAG_DEFAULT);
      }
LABEL_26:
      swift_once();
      return _os_activity_create(dso, descriptiona, (os_activity_t)qword_100039D70, OS_ACTIVITY_FLAG_DEFAULT);
    }
    int v7 = (description & 0x3F) << 8;
    unsigned int v8 = (v7 | (description >> 6)) + 33217;
    unsigned int v9 = (v7 | (description >> 6) & 0x3F) << 8;
    unsigned int v10 = (((v9 | (description >> 12) & 0x3F) << 8) | (description >> 18)) - 2122219023;
    unsigned int v11 = (v9 | (description >> 12)) + 8487393;
    if (description >> 16) {
      unsigned int v6 = v10;
    }
    else {
      unsigned int v6 = v11;
    }
    if (description < 0x800) {
      unsigned int v6 = v8;
    }
    goto LABEL_13;
  }
  if (!description)
  {
    __break(1u);
    goto LABEL_16;
  }
  if (qword_100039758 != -1) {
LABEL_17:
  }
    swift_once();
  uint64_t v5 = qword_100039D70;
  return _os_activity_create(dso, v4, v5, OS_ACTIVITY_FLAG_DEFAULT);
}

uint64_t type metadata accessor for ServiceListenerDelegate()
{
  return self;
}

uint64_t sub_1000102BC(void *a1)
{
  id v3 = [self interfaceWithProtocol:&OBJC_PROTOCOL____TtP22AppInstallationMetrics15ServiceProtocol_];
  [a1 setExportedInterface:v3];
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon23ServiceListenerDelegate_dependencies);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon23ServiceListenerDelegate_bag);
  unsigned int v6 = (objc_class *)type metadata accessor for Service();
  int v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR____TtC28AppInstallationMetricsDaemon7Service_dependencies] = v4;
  *(void *)&v7[OBJC_IVAR____TtC28AppInstallationMetricsDaemon7Service_bag] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  swift_retain();
  swift_retain();
  id v8 = objc_msgSendSuper2(&v10, "init");
  objc_msgSend(a1, "setExportedObject:", v8, v10.receiver, v10.super_class);

  [a1 setRemoteObjectInterface:v3];
  [a1 resume];

  return 1;
}

uint64_t _s14BasePropertiesOwet(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s14BasePropertiesOwst(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100010544);
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

ValueMetadata *_s14BasePropertiesOMa()
{
  return &_s14BasePropertiesON;
}

uint64_t sub_10001057C(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 7368801;
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 7368801;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 0x6973726556707061;
      unint64_t v3 = 0xEA00000000006E6FLL;
      break;
    case 2:
      uint64_t v5 = 0x7372655665736162;
      unint64_t v3 = 0xEB000000006E6F69;
      break;
    case 3:
      uint64_t v5 = 0x726556746E657665;
      unint64_t v3 = 0xEC0000006E6F6973;
      break;
    case 4:
      uint64_t v5 = 0x56646C697542736FLL;
      uint64_t v6 = 0x6E6F69737265;
      goto LABEL_9;
    case 5:
      unint64_t v3 = 0xE600000000000000;
      uint64_t v5 = 0x656D614E736FLL;
      break;
    case 6:
      uint64_t v5 = 0x6F6973726556736FLL;
      unint64_t v3 = 0xE90000000000006ELL;
      break;
    case 7:
      uint64_t v5 = 0x656E6F7A656D6974;
      uint64_t v6 = 0x74657366664FLL;
LABEL_9:
      unint64_t v3 = v6 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
      break;
    default:
      break;
  }
  unint64_t v7 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0xEA00000000006E6FLL;
      if (v5 == 0x6973726556707061) {
        goto LABEL_25;
      }
      goto LABEL_27;
    case 2:
      unint64_t v7 = 0xEB000000006E6F69;
      if (v5 != 0x7372655665736162) {
        goto LABEL_27;
      }
      goto LABEL_25;
    case 3:
      unint64_t v7 = 0xEC0000006E6F6973;
      if (v5 != 0x726556746E657665) {
        goto LABEL_27;
      }
      goto LABEL_25;
    case 4:
      uint64_t v8 = 0x56646C697542736FLL;
      uint64_t v9 = 0x6E6F69737265;
      goto LABEL_24;
    case 5:
      unint64_t v7 = 0xE600000000000000;
      if (v5 != 0x656D614E736FLL) {
        goto LABEL_27;
      }
      goto LABEL_25;
    case 6:
      uint64_t v2 = 0x6F6973726556736FLL;
      unint64_t v7 = 0xE90000000000006ELL;
      goto LABEL_21;
    case 7:
      uint64_t v8 = 0x656E6F7A656D6974;
      uint64_t v9 = 0x74657366664FLL;
LABEL_24:
      unint64_t v7 = v9 & 0xFFFFFFFFFFFFLL | 0xEE00000000000000;
      if (v5 == v8) {
        goto LABEL_25;
      }
      goto LABEL_27;
    default:
LABEL_21:
      if (v5 != v2) {
        goto LABEL_27;
      }
LABEL_25:
      if (v3 == v7) {
        char v10 = 1;
      }
      else {
LABEL_27:
      }
        char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10 & 1;
  }
}

uint64_t sub_100010844(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x707954746E657665;
  }
  else {
    uint64_t v3 = 0x6369706F74;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xE900000000000065;
  }
  if (a2) {
    uint64_t v5 = 0x707954746E657665;
  }
  else {
    uint64_t v5 = 0x6369706F74;
  }
  if (a2) {
    unint64_t v6 = 0xE900000000000065;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1000108EC(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 5129543;
  unint64_t v3 = 0xE300000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 5129543;
  switch(v4)
  {
    case 1:
      uint64_t v5 = 5064002;
      break;
    case 2:
      uint64_t v5 = 5525065;
      break;
    case 3:
      uint64_t v5 = 4144959;
      break;
    case 4:
      uint64_t v5 = 0;
      unint64_t v3 = 0xE000000000000000;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE300000000000000;
  switch(a2)
  {
    case 1:
      if (v5 == 5064002) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      if (v5 != 5525065) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      uint64_t v2 = 4144959;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE000000000000000;
      if (v5) {
        goto LABEL_16;
      }
      goto LABEL_13;
    default:
LABEL_12:
      if (v5 != v2) {
        goto LABEL_16;
      }
LABEL_13:
      if (v3 == v6) {
        char v7 = 1;
      }
      else {
LABEL_16:
      }
        char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v7 & 1;
  }
}

uint64_t sub_100010A48(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x6F724665726F7473;
  }
  else {
    uint64_t v3 = 0x4E646C697542736FLL;
  }
  if (v2) {
    unint64_t v4 = 0xED00007265626D75;
  }
  else {
    unint64_t v4 = 0xEC0000006449746ELL;
  }
  if (a2) {
    uint64_t v5 = 0x6F724665726F7473;
  }
  else {
    uint64_t v5 = 0x4E646C697542736FLL;
  }
  if (a2) {
    unint64_t v6 = 0xEC0000006449746ELL;
  }
  else {
    unint64_t v6 = 0xED00007265626D75;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_100010B04()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_100010C60()
{
  return Hasher._finalize()();
}

uint64_t sub_100010DCC(unsigned __int8 *a1, char *a2)
{
  return sub_10001057C(*a1, *a2);
}

Swift::Int sub_100010DD8()
{
  return sub_100010C60();
}

uint64_t sub_100010DE4()
{
  return sub_100010B04();
}

Swift::Int sub_100010DEC()
{
  return sub_100010C60();
}

unint64_t sub_100010DF4@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100010FBC(*a1);
  *a2 = result;
  return result;
}

void sub_100010E24(uint64_t a1@<X8>)
{
  unint64_t v2 = 0xE300000000000000;
  uint64_t v3 = 7368801;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xEA00000000006E6FLL;
      uint64_t v3 = 0x6973726556707061;
      goto LABEL_3;
    case 2:
      *(void *)a1 = 0x7372655665736162;
      *(void *)(a1 + 8) = 0xEB000000006E6F69;
      break;
    case 3:
      strcpy((char *)a1, "eventVersion");
      *(unsigned char *)(a1 + 13) = 0;
      *(_WORD *)(a1 + 14) = -5120;
      break;
    case 4:
      strcpy((char *)a1, "osBuildVersion");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    case 5:
      *(void *)a1 = 0x656D614E736FLL;
      *(void *)(a1 + 8) = 0xE600000000000000;
      break;
    case 6:
      *(void *)a1 = 0x6F6973726556736FLL;
      *(void *)(a1 + 8) = 0xE90000000000006ELL;
      break;
    case 7:
      strcpy((char *)a1, "timezoneOffset");
      *(unsigned char *)(a1 + 15) = -18;
      break;
    default:
LABEL_3:
      *(void *)a1 = v3;
      *(void *)(a1 + 8) = v2;
      break;
  }
}

unint64_t sub_100010F68()
{
  unint64_t result = qword_100039EC0;
  if (!qword_100039EC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039EC0);
  }
  return result;
}

unint64_t sub_100010FBC(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000353E8, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 8) {
    return 8;
  }
  else {
    return v3;
  }
}

uint64_t sub_100011008(const char *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = v4;
  int v48 = a3;
  uint64_t v47 = a2;
  uint64_t v8 = type metadata accessor for OSSignpostID();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v45 = v8;
  uint64_t v46 = v9;
  uint64_t v11 = __chkstk_darwin(v8, v10);
  id v42 = &v39[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11, v13);
  NSString v15 = &v39[-v14];
  uint64_t v16 = type metadata accessor for Logger();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16, v18);
  id v20 = &v39[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = type metadata accessor for OSSignposter();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v23);
  id v25 = &v39[-((v24 + 15) & 0xFFFFFFFFFFFFFFF0)];
  char v41 = a1;
  *(void *)(v5 + 16) = a1;
  char v26 = v48;
  *(void *)(v5 + 24) = v47;
  *(unsigned char *)(v5 + 32) = v26;
  uint64_t v43 = v17;
  uint64_t v44 = v16;
  uint64_t v27 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v17 + 16);
  uint64_t v47 = a4;
  v27(v20, a4, v16);
  OSSignposter.init(logger:)();
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v22 + 32))(v5 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon16SignpostInterval_signposter, v25, v21);
  static OSSignpostID.exclusive.getter();
  uint64_t v28 = OSSignposter.logHandle.getter();
  int v29 = static os_signpost_type_t.begin.getter();
  uint64_t result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v31 = v46;
  int v40 = v29;
  if ((v26 & 1) == 0)
  {
    uint64_t v32 = v45;
    unint64_t v33 = v41;
    if (!v41)
    {
      __break(1u);
LABEL_5:

      uint64_t v32 = v45;
      uint64_t v31 = v46;
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v46 + 16))(v42, v15, v45);
LABEL_11:
      type metadata accessor for OSSignpostIntervalState();
      swift_allocObject();
      uint64_t v38 = OSSignpostIntervalState.init(id:isOpen:)();
      (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v47, v44);
      (*(void (**)(unsigned char *, uint64_t))(v31 + 8))(v15, v32);
      *(void *)(v5 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon16SignpostInterval_interval) = v38;
      return v5;
    }
LABEL_10:
    long long v34 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v46 + 16);
    Class v35 = v42;
    v34(v42, v15, v32);
    uint64_t v36 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v36 = 0;
    os_signpost_id_t v37 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v28, (os_signpost_type_t)v40, v37, v33, "", v36, 2u);
    swift_slowDealloc();

    (*(void (**)(unsigned char *, uint64_t))(v31 + 8))(v35, v32);
    v34(v35, v15, v32);
    goto LABEL_11;
  }
  uint64_t v32 = v45;
  if ((unint64_t)v41 >> 32)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v41 >> 11 != 27)
  {
    if (v41 >> 16 <= 0x10)
    {
      unint64_t v33 = &v49;
      goto LABEL_10;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_100011410()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for OSSignpostError();
  uint64_t v29 = *(void *)(v2 - 8);
  uint64_t v30 = v2;
  __chkstk_darwin(v2, v3);
  uint64_t v5 = &v27[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for OSSignpostID();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = &v27[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9, v12);
  uint64_t v14 = &v27[-v13];
  NSString v15 = *(const char **)(v0 + 16);
  char v16 = *(unsigned char *)(v0 + 32);
  uint64_t v32 = OBJC_IVAR____TtC28AppInstallationMetricsDaemon16SignpostInterval_interval;
  unint64_t v33 = (char *)v15;
  uint64_t v31 = v0 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon16SignpostInterval_signposter;
  uint64_t v17 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter();
  int v28 = static os_signpost_type_t.end.getter();
  uint64_t result = OS_os_log.signpostsEnabled.getter();
  if ((result & 1) == 0) {
    goto LABEL_5;
  }
  if ((v16 & 1) == 0)
  {
    if (!v33)
    {
      __break(1u);
LABEL_5:

      (*(void (**)(unsigned char *, uint64_t))(v7 + 8))(v14, v6);
      uint64_t v19 = v31;
LABEL_14:
      uint64_t v26 = type metadata accessor for OSSignposter();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v26 - 8) + 8))(v19, v26);
      swift_release();
      return v1;
    }
LABEL_10:
    swift_retain();
    checkForErrorAndConsumeState(state:)();
    swift_release();
    uint64_t v21 = v29;
    uint64_t v20 = v30;
    if ((*(unsigned int (**)(unsigned char *, uint64_t))(v29 + 88))(v5, v30) == enum case for OSSignpostError.doubleEnd(_:))
    {
      uint64_t v22 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v21 + 8))(v5, v20);
      uint64_t v22 = "";
    }
    uint64_t v19 = v31;
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v7 + 16))(v11, v14, v6);
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v23 = 0;
    os_signpost_id_t v24 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, (os_signpost_type_t)v28, v24, v33, v22, v23, 2u);
    swift_slowDealloc();

    id v25 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
    v25(v14, v6);
    v25(v11, v6);
    goto LABEL_14;
  }
  if ((unint64_t)v33 >> 32)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v33 >> 11 != 27)
  {
    if (v33 >> 16 <= 0x10)
    {
      unint64_t v33 = &v34;
      goto LABEL_10;
    }
    goto LABEL_16;
  }
LABEL_17:
  __break(1u);
  return result;
}

uint64_t sub_10001178C()
{
  sub_100011410();
  return swift_deallocClassInstance();
}

uint64_t sub_1000117E4()
{
  return type metadata accessor for SignpostInterval();
}

uint64_t type metadata accessor for SignpostInterval()
{
  uint64_t result = qword_100039EF0;
  if (!qword_100039EF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100011838()
{
  uint64_t result = type metadata accessor for OSSignposter();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AppInstallationMetricsBagKeys()
{
  return &type metadata for AppInstallationMetricsBagKeys;
}

uint64_t sub_1000118F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a1 + 24))
  {
    sub_10000D38C((_OWORD *)a1, v9);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v8 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_100012B7C(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1000141B0(a1);
    sub_10001221C(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_1000141B0((uint64_t)v9);
  }
}

unint64_t sub_1000119B0()
{
  return 0xD000000000000017;
}

unint64_t sub_1000119D0()
{
  return 0xD000000000000019;
}

unint64_t sub_1000119F4()
{
  return 0xD000000000000020;
}

unint64_t sub_100011A28()
{
  return 0xD00000000000002CLL;
}

unint64_t sub_100011A48()
{
  return 0xD000000000000012;
}

uint64_t sub_100011A68(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return _swift_task_switch(sub_100011A88, 0, 0);
}

uint64_t sub_100011A88()
{
  swift_getAtKeyPath();
  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  NSString v2 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 72) = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100011B6C;
  return sub_100024E48((uint64_t)v2, ObjectType);
}

uint64_t sub_100011B6C(uint64_t a1)
{
  uint64_t v3 = *(void **)(*(void *)v2 + 72);
  *(void *)(*(void *)v2 + 88) = a1;
  swift_task_dealloc();

  if (v1)
  {
    swift_errorRelease();
    uint64_t v4 = sub_100011D40;
  }
  else
  {
    uint64_t v4 = sub_100011CA4;
  }
  return _swift_task_switch(v4, 0, 0);
}

uint64_t sub_100011CA4()
{
  if (v0[11] && (uint64_t v1 = sub_1000120D4(v0[11]), swift_bridgeObjectRelease(), v1))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v1 = (void *)v0[8];
  }
  uint64_t v2 = (uint64_t (*)(void *))v0[1];
  return v2(v1);
}

uint64_t sub_100011D40()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

uint64_t sub_100011DA4(uint64_t a1)
{
  *(void *)(v2 + 48) = a1;
  *(void *)(v2 + 56) = v1;
  return _swift_task_switch(sub_100011DC4, 0, 0);
}

uint64_t sub_100011DC4()
{
  swift_getAtKeyPath();
  uint64_t v1 = v0[4];
  uint64_t v2 = v0[5];
  v0[8] = v0[3];
  v0[9] = v1;
  v0[10] = v2;
  uint64_t ObjectType = swift_getObjectType();
  NSString v4 = String._bridgeToObjectiveC()();
  v0[11] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[12] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_100011EA4;
  return sub_1000265C8((uint64_t)v4, ObjectType);
}

uint64_t sub_100011EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v3;
  uint64_t v5 = *(void **)(*v3 + 88);
  *(void *)(v4 + 104) = a1;
  *(void *)(v4 + 112) = a2;
  swift_task_dealloc();

  if (v2)
  {
    swift_errorRelease();
    uint64_t v6 = sub_100012070;
  }
  else
  {
    uint64_t v6 = sub_100011FDC;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_100011FDC()
{
  uint64_t v1 = v0[14];
  swift_bridgeObjectRelease();
  if (v1)
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = 13;
  }
  else
  {
    uint64_t v1 = v0[10];
    uint64_t v2 = 9;
  }
  uint64_t v3 = v0[v2];
  uint64_t v4 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v4(v3, v1);
}

uint64_t sub_100012070()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[10];
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v1, v2);
}

void *sub_1000120D4(uint64_t a1)
{
  int64_t v2 = *(void *)(a1 + 16);
  uint64_t v12 = &_swiftEmptyArrayStorage;
  sub_10001318C(0, v2, 0);
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (v2)
  {
    for (uint64_t i = a1 + 32; ; i += 32)
    {
      sub_10000D330(i, (uint64_t)v11);
      if (!swift_dynamicCast()) {
        break;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10001318C(0, v3[2] + 1, 1);
        uint64_t v3 = v12;
      }
      unint64_t v6 = v3[2];
      unint64_t v5 = v3[3];
      if (v6 >= v5 >> 1)
      {
        sub_10001318C(v5 > 1, v6 + 1, 1);
        uint64_t v3 = v12;
      }
      v3[2] = v6 + 1;
      uint64_t v7 = (char *)&v3[2 * v6];
      *((void *)v7 + 4) = v9;
      *((void *)v7 + 5) = v10;
      if (!--v2) {
        return v3;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

double sub_10001221C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_100015254(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v13 = *v4;
    *uint64_t v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100012F7C(&qword_100039FA0, (void (*)(unsigned char *, uint64_t))sub_10000D38C);
      uint64_t v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_10000D38C((_OWORD *)(*(void *)(v11 + 56) + 32 * v8), a3);
    sub_1000129A4(v8, v11);
    *uint64_t v4 = v11;
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

uint64_t sub_10001233C(uint64_t a1, char a2)
{
  return sub_100012674(a1, a2, &qword_100039FA8, (void (*)(uint64_t, unsigned char *))sub_10000D38C);
}

uint64_t sub_10001235C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_1000034A8(&qword_100039B88);
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_41;
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
      unint64_t v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      int64_t v14 = v21 + 1;
      if (v21 + 1 >= v11) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v36 + 8 * v14);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v14 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v14 >= v11) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v36 + 8 * v14);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v14 = v24;
      }
    }
LABEL_21:
    unint64_t v10 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    uint64_t v25 = *(void *)(v5 + 48) + 40 * v20;
    if (a2)
    {
      long long v26 = *(_OWORD *)v25;
      long long v27 = *(_OWORD *)(v25 + 16);
      uint64_t v40 = *(void *)(v25 + 32);
      long long v38 = v26;
      long long v39 = v27;
      sub_10000D38C((_OWORD *)(*(void *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_10000D208(v25, (uint64_t)&v38);
      sub_10000D330(*(void *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    uint64_t result = AnyHashable._rawHashValue(seed:)(*(void *)(v7 + 40));
    uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v29 = result & ~v28;
    unint64_t v30 = v29 >> 6;
    if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      unint64_t v15 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v31 = 0;
      unint64_t v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v33 = v30 == v32;
        if (v30 == v32) {
          unint64_t v30 = 0;
        }
        v31 |= v33;
        uint64_t v34 = *(void *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      unint64_t v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(void *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    uint64_t v16 = *(void *)(v7 + 48) + 40 * v15;
    long long v17 = v38;
    long long v18 = v39;
    *(void *)(v16 + 32) = v40;
    *(_OWORD *)uint64_t v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    uint64_t result = (uint64_t)sub_10000D38C(v37, (_OWORD *)(*(void *)(v7 + 56) + 32 * v15));
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v5 + 64);
  if ((a2 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
  if (v35 >= 64) {
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v35;
  }
  *(void *)(v5 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100012674(uint64_t a1, char a2, uint64_t *a3, void (*a4)(uint64_t, unsigned char *))
{
  uint64_t v6 = v4;
  uint64_t v8 = *v4;
  sub_1000034A8(a3);
  char v39 = a2;
  uint64_t v9 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v10 = v9;
  if (!*(void *)(v8 + 16)) {
    goto LABEL_41;
  }
  uint64_t v11 = 1 << *(unsigned char *)(v8 + 32);
  uint64_t v38 = v8 + 64;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & *(void *)(v8 + 64);
  int64_t v37 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v14 = v9 + 64;
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v16 << 6);
      goto LABEL_22;
    }
    int64_t v21 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v37) {
      break;
    }
    uint64_t v22 = (void *)(v8 + 64);
    unint64_t v23 = *(void *)(v38 + 8 * v21);
    ++v16;
    if (!v23)
    {
      int64_t v16 = v21 + 1;
      if (v21 + 1 >= v37) {
        goto LABEL_34;
      }
      unint64_t v23 = *(void *)(v38 + 8 * v16);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v37)
        {
LABEL_34:
          swift_release();
          if ((v39 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v38 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v16 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_43;
            }
            if (v16 >= v37) {
              goto LABEL_34;
            }
            unint64_t v23 = *(void *)(v38 + 8 * v16);
            ++v24;
            if (v23) {
              goto LABEL_21;
            }
          }
        }
        int64_t v16 = v24;
      }
    }
LABEL_21:
    unint64_t v13 = (v23 - 1) & v23;
    unint64_t v20 = __clz(__rbit64(v23)) + (v16 << 6);
LABEL_22:
    uint64_t v25 = (uint64_t *)(*(void *)(v8 + 48) + 16 * v20);
    uint64_t v27 = *v25;
    uint64_t v26 = v25[1];
    uint64_t v28 = *(void *)(v8 + 56) + 32 * v20;
    if (v39)
    {
      a4(v28, v40);
    }
    else
    {
      sub_10000D330(v28, (uint64_t)v40);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v29 = -1 << *(unsigned char *)(v10 + 32);
    unint64_t v30 = result & ~v29;
    unint64_t v31 = v30 >> 6;
    if (((-1 << v30) & ~*(void *)(v14 + 8 * (v30 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v30) & ~*(void *)(v14 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v32 = 0;
      unint64_t v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v34 = v31 == v33;
        if (v31 == v33) {
          unint64_t v31 = 0;
        }
        v32 |= v34;
        uint64_t v35 = *(void *)(v14 + 8 * v31);
      }
      while (v35 == -1);
      unint64_t v17 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(void *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    long long v18 = (void *)(*(void *)(v10 + 48) + 16 * v17);
    *long long v18 = v27;
    v18[1] = v26;
    uint64_t result = ((uint64_t (*)(unsigned char *, unint64_t))a4)(v40, *(void *)(v10 + 56) + 32 * v17);
    ++*(void *)(v10 + 16);
  }
  swift_release();
  uint64_t v22 = (void *)(v8 + 64);
  if ((v39 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v36 = 1 << *(unsigned char *)(v8 + 32);
  if (v36 >= 64) {
    bzero(v22, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v36;
  }
  *(void *)(v8 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  *uint64_t v6 = v10;
  return result;
}

unint64_t sub_1000129A4(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v10 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8) {
            goto LABEL_5;
          }
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          uint64_t v12 = *(void *)(a2 + 48);
          unint64_t v13 = (_OWORD *)(v12 + 16 * v3);
          uint64_t v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1) {
            *unint64_t v13 = *v14;
          }
          uint64_t v15 = *(void *)(a2 + 56);
          int64_t v16 = (_OWORD *)(v15 + 32 * v3);
          unint64_t v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v16 >= v17 + 2))
          {
            long long v9 = v17[1];
            *int64_t v16 = *v17;
            v16[1] = v9;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    long long v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v19 = *v18;
    uint64_t v20 = (-1 << v3) - 1;
  }
  else
  {
    long long v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v20 = *v18;
    uint64_t v19 = (-1 << result) - 1;
  }
  *long long v18 = v20 & v19;
  uint64_t v21 = *(void *)(a2 + 16);
  BOOL v22 = __OFSUB__(v21, 1);
  uint64_t v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_100012B7C(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  Swift::Int v10 = (void *)*v4;
  unint64_t v12 = sub_100015254(a2, a3);
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
      sub_100012F7C(&qword_100039FA0, (void (*)(unsigned char *, uint64_t))sub_10000D38C);
      goto LABEL_7;
    }
    sub_100012674(v15, a4 & 1, &qword_100039FA0, (void (*)(uint64_t, unsigned char *))sub_10000D38C);
    unint64_t v21 = sub_100015254(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      long long v18 = *v5;
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
  long long v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_10000D120((uint64_t)v19);
    return sub_10000D38C(a1, v19);
  }
LABEL_13:
  sub_100012D08(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_100012D08(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v6 = (void *)(a5[6] + 16 * a1);
  *unint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_10000D38C(a4, (_OWORD *)(a5[7] + 32 * a1));
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

void *sub_100012D74()
{
  return sub_100012F7C(&qword_100039FA8, (void (*)(unsigned char *, uint64_t))sub_10000D38C);
}

void *sub_100012D94()
{
  uint64_t v1 = v0;
  sub_1000034A8(&qword_100039B88);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      int64_t v9 = v21 + 1;
      if (v21 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v22 = *(void *)(v6 + 8 * v9);
      if (!v22) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v22 - 1) & v22;
    unint64_t v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    sub_10000D208(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    uint64_t v17 = 32 * v15;
    sub_10000D330(*(void *)(v2 + 56) + v17, (uint64_t)v24);
    uint64_t v18 = *(void *)(v4 + 48) + v16;
    long long v19 = v25[0];
    long long v20 = v25[1];
    *(void *)(v18 + 32) = v26;
    *(_OWORD *)uint64_t v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    uint64_t result = sub_10000D38C(v24, (_OWORD *)(*(void *)(v4 + 56) + v17));
  }
  int64_t v23 = v21 + 2;
  if (v23 >= v13) {
    goto LABEL_26;
  }
  unint64_t v22 = *(void *)(v6 + 8 * v23);
  if (v22)
  {
    int64_t v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v22 = *(void *)(v6 + 8 * v9);
    ++v23;
    if (v22) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100012F7C(uint64_t *a1, void (*a2)(unsigned char *, uint64_t))
{
  uint64_t v4 = v2;
  sub_1000034A8(a1);
  uint64_t v5 = *v2;
  uint64_t v6 = static _DictionaryStorage.copy(original:)();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v4 = v7;
    return result;
  }
  uint64_t v27 = v4;
  uint64_t result = (void *)(v6 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9) {
    uint64_t result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  }
  uint64_t v28 = v5 + 64;
  int64_t v11 = 0;
  *(void *)(v7 + 16) = *(void *)(v5 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v5 + 64);
  int64_t v15 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    int64_t v24 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v24 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v24);
    ++v11;
    if (!v25)
    {
      int64_t v11 = v24 + 1;
      if (v24 + 1 >= v15) {
        goto LABEL_26;
      }
      unint64_t v25 = *(void *)(v28 + 8 * v11);
      if (!v25) {
        break;
      }
    }
LABEL_25:
    unint64_t v14 = (v25 - 1) & v25;
    unint64_t v17 = __clz(__rbit64(v25)) + (v11 << 6);
LABEL_12:
    uint64_t v18 = 16 * v17;
    long long v19 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    uint64_t v22 = 32 * v17;
    sub_10000D330(*(void *)(v5 + 56) + 32 * v17, (uint64_t)v29);
    int64_t v23 = (void *)(*(void *)(v7 + 48) + v18);
    *int64_t v23 = v20;
    v23[1] = v21;
    a2(v29, *(void *)(v7 + 56) + v22);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v15)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v4 = v27;
    goto LABEL_28;
  }
  unint64_t v25 = *(void *)(v28 + 8 * v26);
  if (v25)
  {
    int64_t v11 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v11 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v11 >= v15) {
      goto LABEL_26;
    }
    unint64_t v25 = *(void *)(v28 + 8 * v11);
    ++v26;
    if (v25) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10001316C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000131AC(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10001318C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10001331C(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000131AC(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000034A8(&qword_100039B68);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
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

uint64_t sub_10001331C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000034A8(&qword_100039BE0);
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
  unint64_t v14 = a4 + 32;
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

uint64_t sub_100013488()
{
  sub_1000222CC(&v1, 0xD00000000000002CLL, 0x800000010002D290);
  swift_bridgeObjectRelease();
  sub_1000222CC(&v1, 0xD000000000000012, 0x800000010002D910);
  swift_bridgeObjectRelease();
  sub_1000222CC(&v1, 0xD000000000000017, 0x800000010002D310);
  swift_bridgeObjectRelease();
  sub_1000222CC(&v1, 0xD000000000000019, 0x800000010002D350);
  swift_bridgeObjectRelease();
  sub_1000222CC(&v1, 0xD000000000000020, 0x800000010002D370);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100013580(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 336) = a1;
  *(void *)(v2 + 344) = a2;
  return _swift_task_switch(sub_1000135A0, 0, 0);
}

uint64_t sub_1000135A0()
{
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 352) = KeyPath;
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&dword_10003A380 + dword_10003A380);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 360) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_100013660;
  return v4(KeyPath);
}

uint64_t sub_100013660(char a1)
{
  *(unsigned char *)(*(void *)v1 + 456) = a1;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100013780, 0, 0);
}

uint64_t sub_100013780()
{
  char v1 = *(unsigned char *)(v0 + 456);
  *(void *)(v0 + 40) = &type metadata for Bool;
  *(unsigned char *)(v0 + 16) = v1;
  sub_100014148(v0 + 16, v0 + 48);
  sub_1000118F0(v0 + 48, 0xD00000000000002CLL, 0x800000010002D290);
  sub_1000141B0(v0 + 16);
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 368) = KeyPath;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10003A380 + dword_10003A380);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 376) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100013898;
  return v5(KeyPath);
}

uint64_t sub_100013898(char a1)
{
  *(unsigned char *)(*(void *)v1 + 457) = a1;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_1000139B8, 0, 0);
}

uint64_t sub_1000139B8()
{
  char v1 = *(unsigned char *)(v0 + 457);
  *(void *)(v0 + 104) = &type metadata for Bool;
  *(unsigned char *)(v0 + 80) = v1;
  sub_100014148(v0 + 80, v0 + 112);
  sub_1000118F0(v0 + 112, 0xD000000000000012, 0x800000010002D910);
  sub_1000141B0(v0 + 80);
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 384) = KeyPath;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_10003A380 + dword_10003A380);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 392) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100013AD0;
  return v5(KeyPath);
}

uint64_t sub_100013AD0(char a1)
{
  *(unsigned char *)(*(void *)v1 + 458) = a1;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100013BF0, 0, 0);
}

uint64_t sub_100013BF0()
{
  char v1 = *(unsigned char *)(v0 + 458);
  *(void *)(v0 + 168) = &type metadata for Bool;
  *(unsigned char *)(v0 + 144) = v1;
  sub_100014148(v0 + 144, v0 + 176);
  sub_1000118F0(v0 + 176, 0xD000000000000017, 0x800000010002D310);
  sub_1000141B0(v0 + 144);
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 400) = KeyPath;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100039F90 + dword_100039F90);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 408) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100013D08;
  return v5(KeyPath);
}

uint64_t sub_100013D08(uint64_t a1)
{
  *(void *)(*(void *)v1 + 416) = a1;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100013E28, 0, 0);
}

uint64_t sub_100013E28()
{
  uint64_t v1 = v0[52];
  v0[29] = sub_1000034A8(&qword_100039BA8);
  v0[26] = v1;
  sub_100014148((uint64_t)(v0 + 26), (uint64_t)(v0 + 30));
  sub_1000118F0((uint64_t)(v0 + 30), 0xD000000000000019, 0x800000010002D350);
  sub_1000141B0((uint64_t)(v0 + 26));
  uint64_t KeyPath = swift_getKeyPath();
  v0[53] = KeyPath;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)&dword_100039F98 + dword_100039F98);
  uint64_t v3 = (void *)swift_task_alloc();
  v0[54] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_100013F48;
  return v5(KeyPath);
}

uint64_t sub_100013F48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 440) = a1;
  *(void *)(v3 + 448) = a2;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100014068, 0, 0);
}

uint64_t sub_100014068()
{
  uint64_t v2 = v0[55];
  uint64_t v1 = v0[56];
  v0[37] = &type metadata for String;
  v0[34] = v2;
  v0[35] = v1;
  sub_100014148((uint64_t)(v0 + 34), (uint64_t)(v0 + 38));
  sub_1000118F0((uint64_t)(v0 + 38), 0xD000000000000020, 0x800000010002D370);
  sub_1000141B0((uint64_t)(v0 + 34));
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

void sub_100014120(uint64_t a1@<X8>)
{
  *(void *)a1 = 0xD00000000000002CLL;
  *(void *)(a1 + 8) = 0x800000010002D290;
  *(unsigned char *)(a1 + 16) = 1;
}

uint64_t sub_100014148(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000034A8(&qword_100039B40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000141B0(uint64_t a1)
{
  uint64_t v2 = sub_1000034A8(&qword_100039B40);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100014214(uint64_t a1@<X8>)
{
  *(void *)a1 = 0xD000000000000017;
  *(void *)(a1 + 8) = 0x800000010002D310;
  *(unsigned char *)(a1 + 16) = 1;
}

void sub_10001423C(void *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x800000010002D350;
  a1[2] = &off_100035260;
}

void sub_100014268(void *a1@<X8>)
{
  *a1 = 0xD000000000000020;
  a1[1] = 0x800000010002D370;
  a1[2] = 0xD000000000000011;
  a1[3] = 0x800000010002D050;
}

uint64_t sub_1000142A4()
{
  sub_1000034A8(&qword_100039FB8);
  swift_allocObject();
  uint64_t result = TaskLocal.init(wrappedValue:)();
  qword_100039FB0 = result;
  return result;
}

uint64_t sub_100014300(const char *a1, uint64_t a2, int a3, char a4, char a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v33 = a8;
  uint64_t v31 = a6;
  uint64_t v32 = a2;
  int v36 = a3;
  uint64_t v35 = a1;
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v15 = __chkstk_darwin(v12, v14);
  unint64_t v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v18);
  uint64_t v20 = (char *)&v31 - v19;
  uint64_t v21 = sub_1000034A8(&qword_10003A350);
  __chkstk_darwin(v21 - 8, v22);
  int64_t v24 = (char *)&v31 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v25 = 0;
  if (a4)
  {
    type metadata accessor for LogActivity();
    unint64_t v25 = (os_activity_scope_state_s *)swift_allocObject();
    int64_t v26 = sub_10000FFFC(v35, v36, a7);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v26, &state);
    swift_unknownObjectRelease();
    v25[1] = state;
  }
  if (a5)
  {
    type metadata accessor for Transaction();
    swift_allocObject();
    uint64_t v27 = sub_100017C84();
  }
  else
  {
    uint64_t v27 = 0;
  }
  sub_10001468C(v31, (uint64_t)v24);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v24, 1, v12) == 1)
  {
    uint64_t v28 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v20, v24, v12);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v20, v12);
    type metadata accessor for SignpostInterval();
    swift_allocObject();
    uint64_t v28 = sub_100011008((const char *)v35, v32, v36, (uint64_t)v17);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v20, v12);
  }
  if (qword_100039760 != -1) {
    swift_once();
  }
  state.opaque[0] = (uint64_t)v25;
  state.opaque[1] = v27;
  uint64_t v39 = v28;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000034A8(&qword_100039FC0);
  swift_task_localValuePush();
  uint64_t v29 = v34;
  sub_1000292D4(v33, a9, &v37);
  swift_task_localValuePop();
  swift_release();
  swift_release();
  if (v29) {
    return swift_release();
  }
  swift_release();
  return v37;
}

uint64_t sub_10001468C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000034A8(&qword_10003A350);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for DictionaryEncoder()
{
  return self;
}

uint64_t sub_10001471C()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DictionaryDecoder()
{
  return self;
}

unint64_t sub_100014778(uint64_t a1)
{
  return sub_1000147C8(a1, &qword_100039FA8, &qword_10003A130, (uint64_t (*)(uint64_t *, unint64_t))sub_10000D38C);
}

unint64_t sub_1000147A0(uint64_t a1)
{
  return sub_1000147C8(a1, &qword_100039FA0, &qword_10003A128, (uint64_t (*)(uint64_t *, unint64_t))sub_10000D38C);
}

unint64_t sub_1000147C8(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t *, unint64_t))
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v8 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000034A8(a2);
  uint64_t v7 = static _DictionaryStorage.allocate(capacity:)();
  uint64_t v8 = (void *)v7;
  uint64_t v9 = *(void *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  uint64_t v10 = v7 + 64;
  uint64_t v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100015754(v11, (uint64_t)&v20, a3);
    uint64_t v12 = v20;
    uint64_t v13 = v21;
    unint64_t result = sub_100015254(v20, v21);
    if (v15) {
      break;
    }
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v16 = (uint64_t *)(v8[6] + 16 * result);
    *uint64_t v16 = v12;
    v16[1] = v13;
    unint64_t result = a4(&v22, v8[7] + 32 * result);
    uint64_t v17 = v8[2];
    BOOL v18 = __OFADD__(v17, 1);
    uint64_t v19 = v17 + 1;
    if (v18) {
      goto LABEL_11;
    }
    v8[2] = v19;
    v11 += 48;
    if (!--v9)
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

uint64_t sub_100014908(uint64_t a1, uint64_t a2, void *a3)
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

unint64_t sub_1000149D0(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  __chkstk_darwin(v3, v4);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    return sub_1000147C8((uint64_t)&_swiftEmptyArrayStorage, &qword_100039FA0, &qword_10003A128, (uint64_t (*)(uint64_t *, unint64_t))sub_10000D38C);
  }
  uint64_t v22 = v5;
  CFErrorRef error = 0;
  int64_t v24 = &_swiftEmptyArrayStorage;
  specialized ContiguousArray.reserveCapacity(_:)();
  uint64_t v9 = a1 + 56;
  do
  {
    v9 += 32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
    specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
    specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized ContiguousArray._endMutation()();
    --v8;
  }
  while (v8);
  type metadata accessor for CFString(0);
  CFArrayRef isa = Array._bridgeToObjectiveC()().super.isa;
  swift_release();
  CFDictionaryRef v11 = SecTaskCopyValuesForEntitlements(v1, isa, &error);

  if (!v11
    || (int64_t v24 = 0,
        static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)(),
        v11,
        (unint64_t result = (unint64_t)v24) == 0))
  {
    static Logger.daemon.getter();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      char v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)char v15 = 136315138;
      swift_beginAccess();
      if (error)
      {
        uint64_t v16 = error;
        uint64_t v23 = (uint64_t)v16;
        type metadata accessor for CFError(0);
        sub_1000153F4(&qword_10003A120, type metadata accessor for CFError);
        uint64_t v17 = Error.localizedDescription.getter();
        unint64_t v19 = v18;
      }
      else
      {
        uint64_t v17 = 0;
        unint64_t v19 = 0xE000000000000000;
      }
      uint64_t v23 = sub_10001FB10(v17, v19, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Error obtaining entitlements: %s", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v3);
    uint64_t v20 = type metadata accessor for AppInstallationMetricsError();
    sub_1000153F4(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v20 - 8) + 104))(v21, enum case for AppInstallationMetricsError.unknown(_:), v20);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_100014E44(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10, v12);
  os_log_type_t v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a1 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v15 = sub_100015254(a2, a3);
    if (v16)
    {
      sub_10000D330(*(void *)(a1 + 56) + 32 * v15, (uint64_t)&v33);
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    long long v33 = 0u;
    long long v34 = 0u;
  }
  if (a5)
  {
    sub_100015754((uint64_t)&v33, (uint64_t)&v30, &qword_100039B40);
    if (v32)
    {
      sub_1000034A8(&qword_100039BA8);
      if ((swift_dynamicCast() & 1) == 0) {
        goto LABEL_17;
      }
      char v17 = sub_100014908(a4, (uint64_t)a5, v29);
      swift_bridgeObjectRelease();
      if ((v17 & 1) == 0) {
        goto LABEL_17;
      }
LABEL_15:
      sub_1000141B0((uint64_t)&v33);
      return 1;
    }
  }
  else
  {
    sub_100015754((uint64_t)&v33, (uint64_t)&v30, &qword_100039B40);
    if (v32)
    {
      if (!swift_dynamicCast() || (v29 & 1) == 0) {
        goto LABEL_17;
      }
      goto LABEL_15;
    }
  }
  sub_1000141B0((uint64_t)&v30);
LABEL_17:
  if (os_variant_has_internal_content())
  {
    uint64_t v19 = a4;
    static Logger.daemon.getter();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v28 = v11;
      uint64_t v22 = swift_slowAlloc();
      uint64_t v27 = (void *)swift_slowAlloc();
      uint64_t v29 = v27;
      *(_DWORD *)uint64_t v22 = 136446466;
      swift_bridgeObjectRetain();
      uint64_t v30 = sub_10001FB10(a2, a3, (uint64_t *)&v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v22 + 12) = 2082;
      if (a5)
      {
        uint64_t v30 = 47;
        unint64_t v31 = 0xE100000000000000;
        v23._countAndFlagsBits = v19;
        v23._object = a5;
        String.append(_:)(v23);
        uint64_t v24 = v30;
        unint64_t v25 = v31;
      }
      else
      {
        uint64_t v24 = 0;
        unint64_t v25 = 0xE000000000000000;
      }
      uint64_t v30 = sub_10001FB10(v24, v25, (uint64_t *)&v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Missing entitlement %{public}s%{public}s", (uint8_t *)v22, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v28 + 8))(v14, v10);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();

      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    }
  }
  sub_1000141B0((uint64_t)&v33);
  return 0;
}

unint64_t sub_100015254(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_100015310(a1, a2, v4);
}

unint64_t sub_1000152CC(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_10001543C(a1, v4);
}

unint64_t sub_100015310(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_1000153F4(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10001543C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000D208(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000D1B4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

SecTaskRef sub_100015504(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned int v4 = a4;
  unsigned int v5 = a3;
  unsigned int v6 = a2;
  unsigned int v7 = a1;
  unint64_t v8 = HIDWORD(a1);
  unint64_t v9 = HIDWORD(a2);
  unint64_t v10 = HIDWORD(a3);
  unint64_t v25 = HIDWORD(a4);
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v23 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v12);
  BOOL v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  token.val[0] = v7;
  token.val[1] = v8;
  token.val[2] = v6;
  token.val[3] = v9;
  token.val[4] = v5;
  token.val[5] = v10;
  token.val[6] = v4;
  token.val[7] = v25;
  SecTaskRef v15 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
  if (!v15)
  {
    uint64_t v16 = v23;
    static Logger.daemon.getter();
    char v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Error creating security task for entitlement check", v19, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v14, v11);
    uint64_t v20 = type metadata accessor for AppInstallationMetricsError();
    sub_1000153F4(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v20 - 8) + 104))(v21, enum case for AppInstallationMetricsError.unknown(_:), v20);
    swift_willThrow();
  }
  return v15;
}

uint64_t sub_100015754(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000034A8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t destroy for EntitlementVerification.Entitlement()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for EntitlementVerification.Entitlement(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for EntitlementVerification.Entitlement(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for EntitlementVerification.Entitlement(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for EntitlementVerification.Entitlement(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EntitlementVerification.Entitlement(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EntitlementVerification.Entitlement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
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
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for EntitlementVerification.Entitlement()
{
  return &type metadata for EntitlementVerification.Entitlement;
}

void sub_100015990()
{
  qword_10003A138 = 0x40F5180000000000;
}

void sub_1000159A4()
{
  uint64_t v1 = v0;
  uint64_t v19 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v19 - 8);
  __chkstk_darwin(v19, v3);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  unint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void **)(v0 + 16);
  NSString v12 = String._bridgeToObjectiveC()();
  sub_100016824();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for DispatchQoS.QoSClass.utility(_:), v6);
  uint64_t v13 = (void *)static OS_dispatch_queue.global(qos:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  aBlock[4] = sub_100016864;
  aBlock[5] = v1;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100015C9C;
  aBlock[3] = &unk_100035D28;
  BOOL v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  LOBYTE(v1) = [v11 registerForTaskWithIdentifier:v12 usingQueue:v13 launchHandler:v14];
  _Block_release(v14);

  if ((v1 & 1) == 0)
  {
    static Logger.activity.getter();
    SecTaskRef v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v15, v16))
    {
      char v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "[DailyWakeupTask] Error registering task", v17, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v19);
  }
}

void sub_100015C9C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_100015D04()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v4 = __chkstk_darwin(v1, v3);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4, v7);
  uint64_t v9 = (char *)&v24 - v8;
  unint64_t v10 = *(void **)(v0 + 16);
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [v10 taskRequestForIdentifier:v11];

  if (v12)
  {
    static Logger.activity.getter();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v14))
    {
      SecTaskRef v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)SecTaskRef v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "[DailyWakeupTask] Task already scheduled", v15, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = v6;
  }
  else
  {
    id v16 = objc_allocWithZone((Class)BGRepeatingSystemTaskRequest);
    NSString v17 = String._bridgeToObjectiveC()();
    uint64_t v18 = [v16 initWithIdentifier:v17];

    [v18 setRequiresNetworkConnectivity:1];
    [v18 setRequiresExternalPower:0];
    if (qword_100039768 != -1) {
      swift_once();
    }
    [v18 setInterval:*(double *)&qword_10003A138];
    [v18 setExpectedDuration:10.0];
    id v24 = 0;
    if (![v10 submitTaskRequest:v18 error:&v24])
    {
      id v23 = v24;
      _convertNSErrorToError(_:)();

      swift_willThrow();
      return;
    }
    id v19 = v24;
    static Logger.activity.getter();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v20, "[DailyWakeupTask] Task submitted", v21, 2u);
      swift_slowDealloc();
      uint64_t v22 = v18;
    }
    else
    {
      uint64_t v22 = v13;
      uint64_t v13 = v18;
    }
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v9, v1);
}

id sub_10001609C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin(v4 - 8, v5);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  uint64_t v9 = (void *)swift_allocObject();
  _OWORD v9[2] = 0;
  v9[3] = 0;
  void v9[4] = a2;
  swift_retain();
  sub_1000165D4((uint64_t)v7, (uint64_t)&unk_10003A208, (uint64_t)v9);
  swift_release();
  sub_100016A6C((uint64_t)v7);
  return [a1 setTaskCompleted];
}

uint64_t sub_1000161B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = type metadata accessor for Logger();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  v4[6] = swift_task_alloc();
  return _swift_task_switch(sub_100016288, 0, 0);
}

uint64_t sub_100016288()
{
  static Logger.activity.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "[DailyWakeupTask] Wakeup to flush metrics", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[3];
  uint64_t v6 = v0[4];

  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v0[7] = v7;
  v0[8] = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v4, v5);
  uint64_t v8 = (void *)swift_task_alloc();
  v0[9] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_1000163D0;
  return sub_100004994();
}

uint64_t sub_1000163D0()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_1000164CC, 0, 0);
}

uint64_t sub_1000164CC()
{
  static Logger.activity.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "[DailyWakeupTask] Wakeup flush complete", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v4 = (void (*)(uint64_t, uint64_t))v0[7];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[3];

  v4(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_1000165D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016ACC(a1, (uint64_t)v9);
  uint64_t v10 = type metadata accessor for TaskPriority();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_100016A6C((uint64_t)v9);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v14 = v13;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v12 = 0;
  uint64_t v14 = 0;
LABEL_6:
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = a2;
  *(void *)(v15 + 24) = a3;
  if (v14 | v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    v17[2] = v12;
    v17[3] = v14;
  }
  return swift_task_create();
}

uint64_t sub_1000167B8()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DailyWakeupTask()
{
  return self;
}

unint64_t sub_100016824()
{
  unint64_t result = qword_10003A1F0;
  if (!qword_10003A1F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003A1F0);
  }
  return result;
}

id sub_100016864(void *a1)
{
  return sub_10001609C(a1, v1);
}

uint64_t sub_10001686C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001687C()
{
  return swift_release();
}

uint64_t sub_100016884()
{
  swift_unknownObjectRelease();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000168C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100016978;
  return sub_1000161B8(a1, v4, v5, v6);
}

uint64_t sub_100016978()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100016A6C(uint64_t a1)
{
  uint64_t v2 = sub_1000034A8(&qword_10003A1F8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100016ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000034A8(&qword_10003A1F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100016B34()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016B6C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100016978;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10003A340 + dword_10003A340);
  return v6(a1, v4);
}

unint64_t sub_100016C24()
{
  uint64_t v1 = v0;
  uint64_t v44 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v44 - 8);
  __chkstk_darwin(v44, v3);
  uint64_t v5 = (char *)v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000034A8(&qword_10003A2C8);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  uint64_t v11 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v9, v12);
  uint64_t v15 = (char *)v38 - v14;
  __chkstk_darwin(v13, v16);
  uint64_t v45 = (char *)v38 - v17;
  __uint64_t v18 = clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW_APPROX);
  unint64_t result = os_transaction_get_timestamp();
  if (v18 < result)
  {
    __break(1u);
  }
  else
  {
    __int16 v20 = result;
    id v42 = v11;
    uint64_t v21 = self;
    id v22 = [v21 nanoseconds];
    sub_10001712C();
    id v23 = v45;
    Measurement.init(value:unit:)();
    static Logger.general.getter();
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v15, v23, v6);
    swift_retain_n();
    uint64_t v43 = v5;
    id v24 = Logger.logObject.getter();
    os_log_type_t v25 = static os_log_type_t.default.getter();
    int v26 = v25;
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v27 = swift_slowAlloc();
      uint64_t v41 = v2;
      uint64_t v28 = v27;
      uint64_t v40 = swift_slowAlloc();
      uint64_t v47 = v40;
      *(_DWORD *)uint64_t v28 = 33555202;
      LOWORD(v46) = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v28 + 6) = 2080;
      int v39 = v26;
      uint64_t v29 = *(void *)(v1 + 24);
      unint64_t v30 = *(void *)(v1 + 32);
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_10001FB10(v29, v30, &v47);
      v38[2] = &v47;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v28 + 16) = 2080;
      v38[1] = v28 + 18;
      id v31 = [v21 milliseconds];
      uint64_t v32 = v42;
      Measurement<>.converted(to:)();

      uint64_t v33 = Measurement<>.formatted()();
      unint64_t v35 = v34;
      int v36 = *(void (**)(char *, uint64_t))(v7 + 8);
      v36(v32, v6);
      uint64_t v46 = sub_10001FB10(v33, v35, &v47);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v36(v15, v6);
      _os_log_impl((void *)&_mh_execute_header, v24, (os_log_type_t)v39, "[TXN%hx] 🐏 Ending transaction (%s) (%s)", (uint8_t *)v28, 0x1Au);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v44);
      v36(v45, v6);
    }
    else
    {

      uint64_t v37 = *(void (**)(char *, uint64_t))(v7 + 8);
      v37(v15, v6);
      swift_release_n();
      (*(void (**)(char *, uint64_t))(v2 + 8))(v43, v44);
      v37(v45, v6);
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    return v1;
  }
  return result;
}

uint64_t sub_1000170D4()
{
  sub_100016C24();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Transaction()
{
  return self;
}

unint64_t sub_10001712C()
{
  unint64_t result = qword_10003A2D0;
  if (!qword_10003A2D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003A2D0);
  }
  return result;
}

uint64_t sub_10001716C(uint64_t a1)
{
  *(void *)(v2 + 40) = a1;
  *(void *)(v2 + 48) = v1;
  return _swift_task_switch(sub_10001718C, 0, 0);
}

uint64_t sub_10001718C()
{
  swift_getAtKeyPath();
  *(void *)(v0 + 56) = *(void *)(v0 + 24);
  *(unsigned char *)(v0 + 33) = *(unsigned char *)(v0 + 32);
  uint64_t ObjectType = swift_getObjectType();
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  *(void *)(v0 + 64) = v2;
  swift_bridgeObjectRelease();
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v0 + 72) = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_10001727C;
  return sub_100025B18((uint64_t)v2, ObjectType);
}

uint64_t sub_10001727C(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *(void **)(*v2 + 64);
  swift_task_dealloc();

  if (v1)
  {
    swift_errorRelease();
    uint64_t v6 = sub_10001743C;
  }
  else
  {
    *(unsigned char *)(v4 + 34) = a1;
    uint64_t v6 = sub_1000173C8;
  }
  return _swift_task_switch(v6, 0, 0);
}

uint64_t sub_1000173C8()
{
  int v1 = *(unsigned __int8 *)(v0 + 34);
  char v2 = *(unsigned char *)(v0 + 33);
  swift_bridgeObjectRelease();
  if (v1 == 2) {
    char v3 = v2;
  }
  else {
    char v3 = v1;
  }
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4(v3 & 1);
}

uint64_t sub_10001743C()
{
  swift_bridgeObjectRelease();
  uint64_t v1 = *(unsigned __int8 *)(v0 + 33);
  char v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v2(v1);
}

void sub_1000174A0(uint64_t a1@<X8>)
{
  *(void *)a1 = 0xD000000000000012;
  *(void *)(a1 + 8) = 0x800000010002D910;
  *(unsigned char *)(a1 + 16) = 1;
}

uint64_t sub_1000174C8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 96) = v12;
  *(void *)(v8 + 104) = v13;
  *(void *)(v8 + 80) = a7;
  *(void *)(v8 + 88) = a8;
  *(unsigned char *)(v8 + 194) = a6;
  *(unsigned char *)(v8 + 193) = a5;
  *(unsigned char *)(v8 + 192) = a4;
  *(void *)(v8 + 64) = a2;
  *(void *)(v8 + 72) = a3;
  *(void *)(v8 + 56) = a1;
  uint64_t v9 = type metadata accessor for Logger();
  *(void *)(v8 + 112) = v9;
  *(void *)(v8 + 120) = *(void *)(v9 - 8);
  *(void *)(v8 + 128) = swift_task_alloc();
  *(void *)(v8 + 136) = swift_task_alloc();
  sub_1000034A8(&qword_10003A350);
  *(void *)(v8 + 144) = swift_task_alloc();
  return _swift_task_switch(sub_100017614, 0, 0);
}

uint64_t sub_100017614()
{
  if (*(unsigned char *)(v0 + 193) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 104);
    char v2 = *(NSObject **)(v0 + 64);
    char v3 = *(unsigned char *)(v0 + 192);
    type metadata accessor for LogActivity();
    uint64_t v4 = swift_allocObject();
    uint64_t v5 = sub_10000FFFC(v2, v3, v1);
    *(void *)(v0 + 40) = 0;
    *(void *)(v0 + 48) = 0;
    os_activity_scope_enter(v5, (os_activity_scope_state_t)(v0 + 40));
    swift_unknownObjectRelease();
    *(_OWORD *)(v4 + 16) = *(_OWORD *)(v0 + 40);
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(void *)(v0 + 152) = v4;
  if (*(unsigned char *)(v0 + 194) == 1)
  {
    type metadata accessor for Transaction();
    swift_allocObject();
    uint64_t v6 = sub_100017C84();
  }
  else
  {
    uint64_t v6 = 0;
  }
  *(void *)(v0 + 160) = v6;
  uint64_t v7 = *(void *)(v0 + 144);
  uint64_t v8 = *(void *)(v0 + 112);
  uint64_t v9 = *(void *)(v0 + 120);
  sub_100015754(*(void *)(v0 + 80), v7, &qword_10003A350);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 136);
    uint64_t v13 = *(void *)(v0 + 120);
    uint64_t v12 = *(void *)(v0 + 128);
    uint64_t v14 = *(void *)(v0 + 112);
    uint64_t v16 = *(const char **)(v0 + 64);
    uint64_t v15 = *(void *)(v0 + 72);
    int v17 = *(unsigned __int8 *)(v0 + 192);
    (*(void (**)(uint64_t, void, uint64_t))(v13 + 32))(v11, *(void *)(v0 + 144), v14);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v11, v14);
    type metadata accessor for SignpostInterval();
    swift_allocObject();
    uint64_t v10 = sub_100011008(v16, v15, v17, v12);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v14);
  }
  *(void *)(v0 + 168) = v10;
  if (qword_100039760 != -1) {
    swift_once();
  }
  *(void *)(v0 + 16) = v4;
  *(void *)(v0 + 24) = v6;
  *(void *)(v0 + 32) = v10;
  swift_retain();
  swift_retain();
  swift_retain();
  __uint64_t v18 = (void *)swift_task_alloc();
  *(void *)(v0 + 176) = v18;
  *__uint64_t v18 = v0;
  v18[1] = sub_100017940;
  uint64_t v19 = *(void *)(v0 + 88);
  uint64_t v20 = *(void *)(v0 + 96);
  uint64_t v21 = *(void *)(v0 + 56);
  return TaskLocal.withValue<A>(_:operation:isolation:file:line:)(v21, v0 + 16, v19, v20, 0, 0, 0xD00000000000002ALL, 0x800000010002DBC0);
}

uint64_t sub_100017940()
{
  *(void *)(*(void *)v1 + 184) = v0;
  swift_task_dealloc();
  swift_release();
  swift_release();
  swift_release();
  if (v0) {
    char v2 = sub_100017BB4;
  }
  else {
    char v2 = sub_100017AE4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100017AE4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100017BB4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100017C84()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v1[3] = StaticString.description.getter();
  v1[4] = v7;
  String.utf8CString.getter();
  uint64_t v8 = os_transaction_create();
  uint64_t result = swift_release();
  if (v8)
  {
    v1[2] = v8;
    __int16 timestamp = os_transaction_get_timestamp();
    static Logger.general.getter();
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = swift_slowAlloc();
      uint64_t v19 = v2;
      uint64_t v14 = v13;
      uint64_t v15 = swift_slowAlloc();
      uint64_t v18 = v3;
      uint64_t v21 = v15;
      *(_DWORD *)uint64_t v14 = 33554946;
      LOWORD(v20) = timestamp;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v14 + 6) = 2080;
      uint64_t v16 = StaticString.description.getter();
      uint64_t v20 = sub_10001FB10(v16, v17, &v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[TXN%hx] 🐏 Beginning transaction (%s)", (uint8_t *)v14, 0x10u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v18 + 8))(v6, v19);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
    return (uint64_t)v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100017F00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[20] = a6;
  v7[21] = a7;
  v7[18] = a4;
  v7[19] = a5;
  v7[16] = a2;
  v7[17] = a3;
  v7[15] = a1;
  uint64_t v8 = type metadata accessor for Logger();
  v7[22] = v8;
  v7[23] = *(void *)(v8 - 8);
  v7[24] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for AppInstallationEvent();
  v7[25] = v9;
  v7[26] = *(void *)(v9 - 8);
  v7[27] = swift_task_alloc();
  v7[28] = swift_task_alloc();
  return _swift_task_switch(sub_100018038, 0, 0);
}

uint64_t sub_100018038()
{
  uint64_t v44 = v0;
  SecTaskRef v1 = sub_100015504(*(void *)(v0 + 120), *(void *)(v0 + 128), *(void *)(v0 + 136), *(void *)(v0 + 144));
  unint64_t v4 = sub_1000149D0((uint64_t)&off_1000354C8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v5 = sub_100014E44(v4, 0xD000000000000028, (unint64_t)"", 0, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_arrayDestroy();
  if (v5)
  {
    uint64_t v6 = *(void *)(v0 + 224);
    uint64_t v39 = *(void *)(v0 + 200);
    uint64_t v8 = *(void *)(v0 + 152);
    unint64_t v7 = *(void *)(v0 + 160);
    uint64_t v9 = (objc_class *)type metadata accessor for LogKey();
    id v10 = objc_allocWithZone(v9);
    *(void *)(v0 + 64) = 0;
    uint64_t v11 = (char *)v10;
    swift_stdlib_random();
    os_log_type_t v12 = &v11[OBJC_IVAR____TtC28AppInstallationMetricsDaemon6LogKey_representation];
    *(void *)os_log_type_t v12 = (*(void *)(v0 + 64) << 32) | 1;
    *((void *)v12 + 1) = 0;
    v12[16] = 0;

    *(void *)(v0 + 32) = v11;
    *(void *)(v0 + 40) = v9;
    id v13 = objc_msgSendSuper2((objc_super *)(v0 + 32), "init");
    *(void *)(v0 + 232) = v13;
    *(void *)(v0 + 16) = v8;
    *(void *)(v0 + 24) = v7;
    *(void *)(v0 + 48) = v6;
    *(void *)(v0 + 56) = v0 + 16;
    sub_100020A94(v8, v7);
    *(void *)(v0 + 72) = &type metadata for Data;
    *(void *)(v0 + 80) = v39;
    *(void *)(v0 + 88) = sub_100020AEC();
    *(void *)(v0 + 96) = sub_100020B40(&qword_10003A470, (void (*)(uint64_t))&type metadata accessor for AppInstallationEvent);
    decodeXPCValues<each A, B>(from:)();
    uint64_t v17 = *(void *)(v0 + 216);
    uint64_t v16 = *(void *)(v0 + 224);
    uint64_t v18 = *(void *)(v0 + 200);
    uint64_t v19 = *(void *)(v0 + 208);
    sub_10000D3E4(*(void *)(v0 + 16), *(void *)(v0 + 24));
    static Logger.general.getter();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, v16, v18);
    id v20 = v13;
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v25 = *(void *)(v0 + 208);
    uint64_t v24 = *(void *)(v0 + 216);
    uint64_t v26 = *(void *)(v0 + 192);
    uint64_t v42 = *(void *)(v0 + 200);
    uint64_t v28 = *(void *)(v0 + 176);
    uint64_t v27 = *(void *)(v0 + 184);
    if (v23)
    {
      uint64_t v41 = *(void *)(v0 + 192);
      uint64_t v29 = swift_slowAlloc();
      uint64_t v38 = v24;
      unint64_t v30 = (void *)swift_slowAlloc();
      uint64_t v43 = swift_slowAlloc();
      *(_DWORD *)uint64_t v29 = 138412546;
      *(void *)(v0 + 104) = v20;
      uint64_t v40 = v28;
      id v31 = v20;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *unint64_t v30 = v20;

      *(_WORD *)(v29 + 12) = 2080;
      uint64_t v32 = AppInstallationEvent.bundleID.getter();
      *(void *)(v0 + 112) = sub_10001FB10(v32, v33, &v43);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      unint64_t v34 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v34(v38, v42);
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "[%@] Adding install for bundleID: %s", (uint8_t *)v29, 0x16u);
      sub_1000034A8(&qword_10003A3A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v41, v40);
    }
    else
    {

      unint64_t v34 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v34(v24, v42);

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
    }
    *(void *)(v0 + 240) = v34;
    uint64_t v35 = *(void *)(v0 + 168);
    *(void *)(v0 + 248) = *(void *)(*(void *)(v35
                                                  + OBJC_IVAR____TtC28AppInstallationMetricsDaemon7Service_dependencies)
                                      + OBJC_IVAR____TtC28AppInstallationMetricsDaemon12Dependencies_eventManager);
    uint64_t v36 = *(void *)(v35 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon7Service_bag);
    *(void *)(v0 + 256) = v36;
    swift_retain();
    swift_retain();
    uint64_t v37 = (void *)swift_task_alloc();
    *(void *)(v0 + 264) = v37;
    *uint64_t v37 = v0;
    v37[1] = sub_1000186CC;
    v37[3] = v36;
    return _swift_task_switch(sub_10001F55C, 0, 0);
  }
  else
  {
    uint64_t v14 = type metadata accessor for AppInstallationMetricsError();
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v14 - 8) + 104))(v15, enum case for AppInstallationMetricsError.notAuthorized(_:), v14);
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
}

uint64_t sub_1000186CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v8 = (void *)*v4;
  uint64_t v9 = (void *)*v4;
  swift_task_dealloc();
  if (v3)
  {
    swift_errorRelease();
    return _swift_task_switch(sub_100018878, 0, 0);
  }
  else
  {
    id v10 = (void *)swift_task_alloc();
    v8[34] = v10;
    *id v10 = v9;
    v10[1] = sub_100018964;
    uint64_t v11 = v8[29];
    uint64_t v12 = v8[28];
    return sub_100004C40(v12, a1, a2, a3, v11);
  }
}

uint64_t sub_100018878()
{
  SecTaskRef v1 = (void *)v0[32];
  uint64_t v2 = v1[4];
  uint64_t v3 = (os_unfair_lock_s *)(v2 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 24));
  uint64_t v4 = *(void *)(v2 + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v3);
  uint64_t v6 = v1[2];
  uint64_t v5 = v1[3];
  swift_unknownObjectRetain();
  unint64_t v7 = (void *)swift_task_alloc();
  v0[34] = v7;
  *unint64_t v7 = v0;
  v7[1] = sub_100018964;
  uint64_t v9 = v0[28];
  uint64_t v8 = v0[29];
  return sub_100004C40(v9, v4, v6, v5, v8);
}

uint64_t sub_100018964()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100018A7C, 0, 0);
}

uint64_t sub_100018A7C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t))(v0 + 240);
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 200);

  v1(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100018D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = type metadata accessor for Logger();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return _swift_task_switch(sub_100018E18, 0, 0);
}

uint64_t sub_100018E18()
{
  SecTaskRef v1 = sub_100015504(v0[2], v0[3], v0[4], v0[5]);
  unint64_t v3 = sub_1000149D0((uint64_t)&off_100035508);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = sub_100014E44(v3, 0xD00000000000002DLL, (unint64_t)"e.appinstallationmetrics", 0, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_arrayDestroy();
  if (v4)
  {
    static Logger.general.getter();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Clearing events no longer supported", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = v0[7];
    uint64_t v8 = v0[8];
    uint64_t v10 = v0[6];

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v12 = type metadata accessor for AppInstallationMetricsError();
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v12 - 8) + 104))(v13, enum case for AppInstallationMetricsError.notAuthorized(_:), v12);
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_100019234(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v6 = type metadata accessor for Logger();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  return _swift_task_switch(sub_1000192FC, 0, 0);
}

uint64_t sub_1000192FC()
{
  SecTaskRef v1 = sub_100015504(v0[3], v0[4], v0[5], v0[6]);
  unint64_t v3 = sub_1000149D0((uint64_t)&off_100035548);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = sub_100014E44(v3, 0xD00000000000002DLL, (unint64_t)"e.appinstallationmetrics", 0, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_arrayDestroy();
  if (v4)
  {
    static Logger.general.getter();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "ping", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = v0[8];
    uint64_t v8 = v0[9];
    uint64_t v10 = v0[7];
    uint64_t v11 = (void *)v0[2];

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    *uint64_t v11 = 1735290736;
    v11[1] = 0xE400000000000000;
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v13 = type metadata accessor for AppInstallationMetricsError();
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v14, enum case for AppInstallationMetricsError.notAuthorized(_:), v13);
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
  }
  return v12();
}

void sub_1000195B0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v11 = v10;
  uint64_t v29 = a4;
  uint64_t v30 = a7;
  uint64_t v31 = a10;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v18 = sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin(v18 - 8, v19);
  uint64_t v21 = (char *)&ObjectType - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v22 = [self currentConnection];
  BOOL v23 = v22;
  if (v22)
  {
    [v22 auditToken];
    long long v24 = v32;
    long long v25 = v33;
  }
  else
  {
    long long v24 = 0uLL;
    long long v25 = 0uLL;
  }
  long long v32 = v24;
  long long v33 = v25;
  BOOL v34 = v23 == 0;
  sub_100015754(a6, (uint64_t)v21, &qword_10003A1F8);
  uint64_t v26 = swift_allocObject();
  *(void *)(v26 + 16) = 0;
  *(void *)(v26 + 24) = 0;
  *(void *)(v26 + 32) = a1;
  *(void *)(v26 + 40) = a2;
  *(unsigned char *)(v26 + 48) = a3;
  *(void *)(v26 + 56) = v11;
  sub_10001F3C4((uint64_t)&v32, v26 + 64);
  *(void *)(v26 + 104) = v30;
  *(void *)(v26 + 112) = a8;
  *(void *)(v26 + 120) = v29;
  *(void *)(v26 + 128) = a5;
  *(void *)(v26 + 136) = ObjectType;
  id v27 = v11;
  swift_retain();
  swift_retain();
  sub_10001EC44((uint64_t)v21, v31, v26);
  swift_release();
  swift_release();
}

uint64_t sub_1000198D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v6 = type metadata accessor for Logger();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  return _swift_task_switch(sub_1000199A0, 0, 0);
}

uint64_t sub_1000199A0()
{
  SecTaskRef v1 = sub_100015504(v0[2], v0[3], v0[4], v0[5]);
  unint64_t v4 = sub_1000149D0((uint64_t)&off_100035588);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v5 = sub_100014E44(v4, 0xD00000000000002DLL, (unint64_t)"e.appinstallationmetrics", 0, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_arrayDestroy();
  if (v5)
  {
    v0[10] = *(void *)(*(void *)(v0[6] + OBJC_IVAR____TtC28AppInstallationMetricsDaemon7Service_dependencies)
                       + OBJC_IVAR____TtC28AppInstallationMetricsDaemon12Dependencies_eventManager);
    swift_retain();
    uint64_t v6 = (void *)swift_task_alloc();
    v0[11] = v6;
    *uint64_t v6 = v0;
    v6[1] = sub_100019C34;
    return sub_100004994();
  }
  else
  {
    uint64_t v7 = type metadata accessor for AppInstallationMetricsError();
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v7 - 8) + 104))(v8, enum case for AppInstallationMetricsError.notAuthorized(_:), v7);
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
}

uint64_t sub_100019C34()
{
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100019D4C, 0, 0);
}

uint64_t sub_100019D4C()
{
  static Logger.general.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    unint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)unint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "flush complete", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[8];
  uint64_t v4 = v0[9];
  uint64_t v6 = v0[7];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_10001A030(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  uint64_t v5 = type metadata accessor for Logger();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return _swift_task_switch(sub_10001A0F4, 0, 0);
}

uint64_t sub_10001A0F4()
{
  SecTaskRef v1 = sub_100015504(v0[2], v0[3], v0[4], v0[5]);
  unint64_t v3 = sub_1000149D0((uint64_t)&off_1000355C8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = sub_100014E44(v3, 0xD00000000000002DLL, (unint64_t)"e.appinstallationmetrics", 0, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_arrayDestroy();
  if (v4)
  {
    static Logger.general.getter();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Post no longer supported", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = v0[7];
    uint64_t v8 = v0[8];
    uint64_t v10 = v0[6];

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v12 = type metadata accessor for AppInstallationMetricsError();
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v12 - 8) + 104))(v13, enum case for AppInstallationMetricsError.notAuthorized(_:), v12);
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v11 = (uint64_t (*)(void))v0[1];
  }
  return v11();
}

uint64_t sub_10001A510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  uint64_t v6 = type metadata accessor for Logger();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  return _swift_task_switch(sub_10001A5D8, 0, 0);
}

uint64_t sub_10001A5D8()
{
  SecTaskRef v1 = sub_100015504(v0[3], v0[4], v0[5], v0[6]);
  unint64_t v3 = sub_1000149D0((uint64_t)&off_100035608);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  char v4 = sub_100014E44(v3, 0xD00000000000002DLL, (unint64_t)"e.appinstallationmetrics", 0, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_arrayDestroy();
  if (v4)
  {
    static Logger.general.getter();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Installation Events no longer supported", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = v0[8];
    uint64_t v8 = v0[9];
    uint64_t v10 = v0[7];
    uint64_t v11 = (void *)v0[2];

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    *uint64_t v11 = &_swiftEmptyArrayStorage;
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v13 = type metadata accessor for AppInstallationMetricsError();
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    swift_allocError();
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v13 - 8) + 104))(v14, enum case for AppInstallationMetricsError.notAuthorized(_:), v13);
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
  }
  return v12();
}

uint64_t sub_10001AA04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 88) = v13;
  *(_OWORD *)(v8 + 72) = v12;
  *(_OWORD *)(v8 + 56) = v11;
  *(void *)(v8 + 40) = a7;
  *(void *)(v8 + 48) = a8;
  *(unsigned char *)(v8 + 120) = a6;
  *(void *)(v8 + 24) = a4;
  *(void *)(v8 + 32) = a5;
  *(void *)(v8 + 16) = a1;
  sub_1000034A8(&qword_10003A350);
  *(void *)(v8 + 96) = swift_task_alloc();
  return _swift_task_switch(sub_10001AABC, 0, 0);
}

void sub_10001AABC()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  char v3 = *(unsigned char *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v6 = type metadata accessor for Logger();
  long long v9 = *(_OWORD *)(v0 + 56);
  long long v10 = *(_OWORD *)(v0 + 40);
  long long v11 = *(_OWORD *)(v0 + 72);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v2, 1, 1, v6);
  uint64_t v7 = swift_task_alloc();
  *(void *)(v0 + 104) = v7;
  *(_OWORD *)(v7 + 16) = v10;
  *(_OWORD *)(v7 + 32) = v9;
  *(void *)(v7 + 48) = v5;
  *(void *)(v7 + 56) = v4;
  *(unsigned char *)(v7 + 64) = v3;
  *(_OWORD *)(v7 + 72) = v11;
  *(void *)(v7 + 88) = v1;
  long long v12 = (char *)&dword_10003A368 + dword_10003A368;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_100020BAC;
  __asm { BR              X8; sub_1000174C8 }
}

uint64_t sub_10001AC3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 88) = v13;
  *(_OWORD *)(v8 + 72) = v12;
  *(_OWORD *)(v8 + 56) = v11;
  *(void *)(v8 + 40) = a7;
  *(void *)(v8 + 48) = a8;
  *(unsigned char *)(v8 + 120) = a6;
  *(void *)(v8 + 24) = a4;
  *(void *)(v8 + 32) = a5;
  *(void *)(v8 + 16) = a1;
  sub_1000034A8(&qword_10003A350);
  *(void *)(v8 + 96) = swift_task_alloc();
  return _swift_task_switch(sub_10001ACF4, 0, 0);
}

void sub_10001ACF4()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  char v3 = *(unsigned char *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v6 = type metadata accessor for Logger();
  long long v9 = *(_OWORD *)(v0 + 56);
  long long v10 = *(_OWORD *)(v0 + 40);
  long long v11 = *(_OWORD *)(v0 + 72);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v2, 1, 1, v6);
  uint64_t v7 = swift_task_alloc();
  *(void *)(v0 + 104) = v7;
  *(_OWORD *)(v7 + 16) = v10;
  *(_OWORD *)(v7 + 32) = v9;
  *(void *)(v7 + 48) = v5;
  *(void *)(v7 + 56) = v4;
  *(unsigned char *)(v7 + 64) = v3;
  *(_OWORD *)(v7 + 72) = v11;
  *(void *)(v7 + 88) = v1;
  long long v12 = (char *)&dword_10003A368 + dword_10003A368;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_10001AE74;
  __asm { BR              X8; sub_1000174C8 }
}

uint64_t sub_10001AE74()
{
  uint64_t v1 = *(void *)(*v0 + 96);
  uint64_t v4 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000D2D4(v1, &qword_10003A350);
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v4 + 8);
  return v2();
}

uint64_t sub_10001AFB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 88) = v13;
  *(_OWORD *)(v8 + 72) = v12;
  *(_OWORD *)(v8 + 56) = v11;
  *(void *)(v8 + 40) = a7;
  *(void *)(v8 + 48) = a8;
  *(unsigned char *)(v8 + 120) = a6;
  *(void *)(v8 + 24) = a4;
  *(void *)(v8 + 32) = a5;
  *(void *)(v8 + 16) = a1;
  sub_1000034A8(&qword_10003A350);
  *(void *)(v8 + 96) = swift_task_alloc();
  return _swift_task_switch(sub_10001B068, 0, 0);
}

void sub_10001B068()
{
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  char v3 = *(unsigned char *)(v0 + 120);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v6 = type metadata accessor for Logger();
  long long v9 = *(_OWORD *)(v0 + 56);
  long long v10 = *(_OWORD *)(v0 + 40);
  long long v11 = *(_OWORD *)(v0 + 72);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v2, 1, 1, v6);
  uint64_t v7 = swift_task_alloc();
  *(void *)(v0 + 104) = v7;
  *(_OWORD *)(v7 + 16) = v10;
  *(_OWORD *)(v7 + 32) = v9;
  *(void *)(v7 + 48) = v5;
  *(void *)(v7 + 56) = v4;
  *(unsigned char *)(v7 + 64) = v3;
  *(_OWORD *)(v7 + 72) = v11;
  *(void *)(v7 + 88) = v1;
  long long v12 = (char *)&dword_10003A368 + dword_10003A368;
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v0 + 112) = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_100020BAC;
  __asm { BR              X8; sub_1000174C8 }
}

uint64_t sub_10001B1E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 152) = v14;
  *(void *)(v8 + 160) = v15;
  *(unsigned char *)(v8 + 49) = a8;
  *(void *)(v8 + 136) = a6;
  *(void *)(v8 + 144) = a7;
  *(void *)(v8 + 120) = a4;
  *(void *)(v8 + 128) = a5;
  *(void *)(v8 + 104) = a2;
  *(void *)(v8 + 112) = a3;
  uint64_t v9 = type metadata accessor for AppInstallationMetricsError();
  *(void *)(v8 + 168) = v9;
  *(void *)(v8 + 176) = *(void *)(v9 - 8);
  *(void *)(v8 + 184) = swift_task_alloc();
  *(void *)(v8 + 192) = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Logger();
  *(void *)(v8 + 200) = v10;
  *(void *)(v8 + 208) = *(void *)(v10 - 8);
  *(void *)(v8 + 216) = swift_task_alloc();
  *(void *)(v8 + 224) = swift_task_alloc();
  *(void *)(v8 + 232) = swift_task_alloc();
  uint64_t v11 = sub_1000034A8(&qword_10003A3D0);
  *(void *)(v8 + 240) = v11;
  *(void *)(v8 + 248) = *(void *)(v11 - 8);
  *(void *)(v8 + 256) = swift_task_alloc();
  *(void *)(v8 + 264) = swift_task_alloc();
  *(void *)(v8 + 272) = swift_task_alloc();
  return _swift_task_switch(sub_10001B3C4, 0, 0);
}

uint64_t sub_10001B3C4()
{
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 280) = KeyPath;
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&dword_10003A380 + dword_10003A380);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10001B490;
  return v4(KeyPath);
}

uint64_t sub_10001B490(char a1)
{
  *(unsigned char *)(*(void *)v1 + 50) = a1;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_10001B5B0, 0, 0);
}

uint64_t sub_10001B5B0()
{
  uint64_t v60 = v0;
  if (*(unsigned char *)(v0 + 50) != 1)
  {
    static Logger.general.getter();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Not enabled", v15, 2u);
      swift_slowDealloc();
    }
    uint64_t v16 = *(void *)(v0 + 232);
    uint64_t v17 = *(void *)(v0 + 200);
    uint64_t v18 = *(void *)(v0 + 208);
    uint64_t v7 = *(void *)(v0 + 168);
    uint64_t v8 = *(void *)(v0 + 176);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    uint64_t v9 = swift_allocError();
    uint64_t v11 = v19;
    long long v12 = (unsigned int *)&enum case for AppInstallationMetricsError.serviceUnavailable(_:);
    goto LABEL_9;
  }
  sub_10001F3C4(*(void *)(v0 + 112), v0 + 16);
  if (*(unsigned char *)(v0 + 48))
  {
    static Logger.general.getter();
    uint64_t v1 = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Unable to obtain audit token", v3, 2u);
      swift_slowDealloc();
    }
    uint64_t v4 = *(void *)(v0 + 224);
    uint64_t v5 = *(void *)(v0 + 200);
    uint64_t v6 = *(void *)(v0 + 208);
    uint64_t v7 = *(void *)(v0 + 168);
    uint64_t v8 = *(void *)(v0 + 176);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    uint64_t v9 = swift_allocError();
    uint64_t v11 = v10;
    long long v12 = (unsigned int *)&enum case for AppInstallationMetricsError.notAuthorized(_:);
LABEL_9:
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v11, *v12, v7);
    swift_willThrow();
    static Logger.general.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v24 = *(void *)(v0 + 208);
    uint64_t v23 = *(void *)(v0 + 216);
    if (v22)
    {
      uint64_t v56 = *(void *)(v0 + 200);
      uint64_t v57 = *(void *)(v0 + 216);
      uint64_t v25 = swift_slowAlloc();
      long long v55 = (void *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315394;
      uint64_t v26 = StaticString.description.getter();
      *(void *)(v0 + 88) = sub_10001FB10(v26, v27, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2114;
      swift_errorRetain();
      uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 96) = v28;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *long long v55 = v28;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Error in %s: %{public}@", (uint8_t *)v25, 0x16u);
      sub_1000034A8(&qword_10003A3A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v57, v56);
    }
    else
    {
      uint64_t v29 = *(void *)(v0 + 200);
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v29);
    }
    *(void *)(v0 + 56) = v9;
    swift_errorRetain();
    sub_1000034A8(&qword_10003A390);
    int v30 = swift_dynamicCast();
    uint64_t v31 = *(void *)(v0 + 192);
    if (v30)
    {
      long long v32 = *(void (**)(uint64_t, void, void))(*(void *)(v0 + 176) + 32);
      v32(*(void *)(v0 + 192), *(void *)(v0 + 184), *(void *)(v0 + 168));
      swift_errorRelease();
      swift_errorRelease();
    }
    else
    {
      uint64_t v33 = *(void *)(v0 + 168);
      uint64_t v34 = *(void *)(v0 + 176);
      swift_errorRelease();
      (*(void (**)(uint64_t, void, uint64_t))(v34 + 104))(v31, enum case for AppInstallationMetricsError.unknown(_:), v33);
      swift_errorRelease();
      long long v32 = *(void (**)(uint64_t, void, void))(v34 + 32);
    }
    uint64_t v35 = *(void *)(v0 + 272);
    uint64_t v36 = *(void *)(v0 + 240);
    uint64_t v37 = *(void *)(v0 + 248);
    v32(v35, *(void *)(v0 + 192), *(void *)(v0 + 168));
    (*(void (**)(uint64_t, void, uint64_t))(v37 + 104))(v35, enum case for ServiceResult.failure<A>(_:), v36);
    uint64_t v38 = *(void *)(v0 + 256);
    uint64_t v39 = *(void *)(v0 + 240);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 + 248) + 16))(v38, *(void *)(v0 + 272), v39);
    *(void *)(v0 + 64) = v38;
    *(void *)(v0 + 72) = v39;
    *(void *)(v0 + 80) = sub_1000208D4(&qword_10003A3D8, &qword_10003A3D0);
    uint64_t v40 = encodeXPCValues<each A>(_:)();
    unint64_t v42 = v41;
    uint64_t v43 = *(void *)(v0 + 272);
    uint64_t v44 = *(void *)(v0 + 240);
    uint64_t v45 = *(void (**)(uint64_t, unint64_t))(v0 + 152);
    uint64_t v46 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 248) + 8);
    v46(*(void *)(v0 + 256), v44);
    v45(v40, v42);
    sub_10000D3E4(v40, v42);
    v46(v43, v44);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
    return v47();
  }
  uint64_t v50 = *(void *)(v0 + 16);
  uint64_t v49 = *(void *)(v0 + 24);
  uint64_t v51 = *(void *)(v0 + 32);
  uint64_t v52 = *(void *)(v0 + 40);
  char v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 120)
                                                                            + **(int **)(v0 + 120));
  unint64_t v53 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v53;
  void *v53 = v0;
  v53[1] = sub_10001BD74;
  uint64_t v54 = *(void *)(v0 + 264);
  return v58(v54, v50, v49, v51, v52);
}

uint64_t sub_10001BD74()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_10001C088;
  }
  else {
    os_log_type_t v2 = sub_10001BE88;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001BE88()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[30];
  uint64_t v4 = v0[31];
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v1, enum case for ServiceResult.success<A>(_:), v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2, v1, v3);
  uint64_t v5 = v0[38];
  uint64_t v6 = v0[32];
  uint64_t v7 = v0[30];
  (*(void (**)(uint64_t, void, uint64_t))(v0[31] + 16))(v6, v0[34], v7);
  v0[8] = v6;
  v0[9] = v7;
  v0[10] = sub_1000208D4(&qword_10003A3D8, &qword_10003A3D0);
  uint64_t v8 = encodeXPCValues<each A>(_:)();
  if (v5)
  {
    swift_errorRelease();
    uint64_t v10 = 0;
    unint64_t v11 = 0xC000000000000000;
  }
  else
  {
    uint64_t v10 = v8;
    unint64_t v11 = v9;
  }
  uint64_t v12 = v0[34];
  uint64_t v13 = v0[30];
  os_log_type_t v14 = (void (*)(uint64_t, unint64_t))v0[19];
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0[31] + 8);
  v15(v0[32], v13);
  v14(v10, v11);
  sub_10000D3E4(v10, v11);
  v15(v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_10001C088()
{
  uint64_t v35 = v0;
  uint64_t v1 = v0[38];
  static Logger.general.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v31 = v0[26];
    uint64_t v32 = v0[25];
    uint64_t v33 = v0[27];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = StaticString.description.getter();
    v0[11] = sub_10001FB10(v6, v7, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2114;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[12] = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v5 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error in %s: %{public}@", (uint8_t *)v4, 0x16u);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v32);
  }
  else
  {
    uint64_t v10 = v0[26];
    uint64_t v9 = v0[27];
    uint64_t v11 = v0[25];
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  v0[7] = v1;
  swift_errorRetain();
  sub_1000034A8(&qword_10003A390);
  int v12 = swift_dynamicCast();
  uint64_t v13 = v0[24];
  if (v12)
  {
    os_log_type_t v14 = *(void (**)(uint64_t, void, void))(v0[22] + 32);
    v14(v0[24], v0[23], v0[21]);
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    uint64_t v15 = v0[21];
    uint64_t v16 = v0[22];
    swift_errorRelease();
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v13, enum case for AppInstallationMetricsError.unknown(_:), v15);
    swift_errorRelease();
    os_log_type_t v14 = *(void (**)(uint64_t, void, void))(v16 + 32);
  }
  uint64_t v17 = v0[34];
  uint64_t v18 = v0[30];
  uint64_t v19 = v0[31];
  v14(v17, v0[24], v0[21]);
  (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))(v17, enum case for ServiceResult.failure<A>(_:), v18);
  uint64_t v20 = v0[32];
  uint64_t v21 = v0[30];
  (*(void (**)(uint64_t, void, uint64_t))(v0[31] + 16))(v20, v0[34], v21);
  v0[8] = v20;
  v0[9] = v21;
  v0[10] = sub_1000208D4(&qword_10003A3D8, &qword_10003A3D0);
  uint64_t v22 = encodeXPCValues<each A>(_:)();
  unint64_t v24 = v23;
  uint64_t v25 = v0[34];
  uint64_t v26 = v0[30];
  unint64_t v27 = (void (*)(uint64_t, unint64_t))v0[19];
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v0[31] + 8);
  v28(v0[32], v26);
  v27(v22, v24);
  sub_10000D3E4(v22, v24);
  v28(v25, v26);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v29 = (uint64_t (*)(void))v0[1];
  return v29();
}

uint64_t sub_10001C55C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 152) = v14;
  *(void *)(v8 + 160) = v15;
  *(unsigned char *)(v8 + 49) = a8;
  *(void *)(v8 + 136) = a6;
  *(void *)(v8 + 144) = a7;
  *(void *)(v8 + 120) = a4;
  *(void *)(v8 + 128) = a5;
  *(void *)(v8 + 104) = a2;
  *(void *)(v8 + 112) = a3;
  uint64_t v9 = type metadata accessor for AppInstallationMetricsError();
  *(void *)(v8 + 168) = v9;
  *(void *)(v8 + 176) = *(void *)(v9 - 8);
  *(void *)(v8 + 184) = swift_task_alloc();
  *(void *)(v8 + 192) = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Logger();
  *(void *)(v8 + 200) = v10;
  *(void *)(v8 + 208) = *(void *)(v10 - 8);
  *(void *)(v8 + 216) = swift_task_alloc();
  *(void *)(v8 + 224) = swift_task_alloc();
  *(void *)(v8 + 232) = swift_task_alloc();
  uint64_t v11 = sub_1000034A8(&qword_10003A430);
  *(void *)(v8 + 240) = v11;
  *(void *)(v8 + 248) = *(void *)(v11 - 8);
  *(void *)(v8 + 256) = swift_task_alloc();
  *(void *)(v8 + 264) = swift_task_alloc();
  *(void *)(v8 + 272) = swift_task_alloc();
  return _swift_task_switch(sub_10001C738, 0, 0);
}

uint64_t sub_10001C738()
{
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 280) = KeyPath;
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&dword_10003A380 + dword_10003A380);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10001C804;
  return v4(KeyPath);
}

uint64_t sub_10001C804(char a1)
{
  *(unsigned char *)(*(void *)v1 + 50) = a1;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_10001C924, 0, 0);
}

uint64_t sub_10001C924()
{
  uint64_t v60 = v0;
  if (*(unsigned char *)(v0 + 50) != 1)
  {
    static Logger.general.getter();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Not enabled", v15, 2u);
      swift_slowDealloc();
    }
    uint64_t v16 = *(void *)(v0 + 232);
    uint64_t v17 = *(void *)(v0 + 200);
    uint64_t v18 = *(void *)(v0 + 208);
    uint64_t v7 = *(void *)(v0 + 168);
    uint64_t v8 = *(void *)(v0 + 176);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    uint64_t v9 = swift_allocError();
    uint64_t v11 = v19;
    int v12 = (unsigned int *)&enum case for AppInstallationMetricsError.serviceUnavailable(_:);
    goto LABEL_9;
  }
  sub_10001F3C4(*(void *)(v0 + 112), v0 + 16);
  if (*(unsigned char *)(v0 + 48))
  {
    static Logger.general.getter();
    uint64_t v1 = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Unable to obtain audit token", v3, 2u);
      swift_slowDealloc();
    }
    uint64_t v4 = *(void *)(v0 + 224);
    uint64_t v5 = *(void *)(v0 + 200);
    uint64_t v6 = *(void *)(v0 + 208);
    uint64_t v7 = *(void *)(v0 + 168);
    uint64_t v8 = *(void *)(v0 + 176);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    uint64_t v9 = swift_allocError();
    uint64_t v11 = v10;
    int v12 = (unsigned int *)&enum case for AppInstallationMetricsError.notAuthorized(_:);
LABEL_9:
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v11, *v12, v7);
    swift_willThrow();
    static Logger.general.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v24 = *(void *)(v0 + 208);
    uint64_t v23 = *(void *)(v0 + 216);
    if (v22)
    {
      uint64_t v56 = *(void *)(v0 + 200);
      uint64_t v57 = *(void *)(v0 + 216);
      uint64_t v25 = swift_slowAlloc();
      long long v55 = (void *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315394;
      uint64_t v26 = StaticString.description.getter();
      *(void *)(v0 + 88) = sub_10001FB10(v26, v27, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2114;
      swift_errorRetain();
      uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 96) = v28;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *long long v55 = v28;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Error in %s: %{public}@", (uint8_t *)v25, 0x16u);
      sub_1000034A8(&qword_10003A3A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v57, v56);
    }
    else
    {
      uint64_t v29 = *(void *)(v0 + 200);
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v29);
    }
    *(void *)(v0 + 56) = v9;
    swift_errorRetain();
    sub_1000034A8(&qword_10003A390);
    int v30 = swift_dynamicCast();
    uint64_t v31 = *(void *)(v0 + 192);
    if (v30)
    {
      uint64_t v32 = *(void (**)(uint64_t, void, void))(*(void *)(v0 + 176) + 32);
      v32(*(void *)(v0 + 192), *(void *)(v0 + 184), *(void *)(v0 + 168));
      swift_errorRelease();
      swift_errorRelease();
    }
    else
    {
      uint64_t v33 = *(void *)(v0 + 168);
      uint64_t v34 = *(void *)(v0 + 176);
      swift_errorRelease();
      (*(void (**)(uint64_t, void, uint64_t))(v34 + 104))(v31, enum case for AppInstallationMetricsError.unknown(_:), v33);
      swift_errorRelease();
      uint64_t v32 = *(void (**)(uint64_t, void, void))(v34 + 32);
    }
    uint64_t v35 = *(void *)(v0 + 272);
    uint64_t v36 = *(void *)(v0 + 240);
    uint64_t v37 = *(void *)(v0 + 248);
    v32(v35, *(void *)(v0 + 192), *(void *)(v0 + 168));
    (*(void (**)(uint64_t, void, uint64_t))(v37 + 104))(v35, enum case for ServiceResult.failure<A>(_:), v36);
    uint64_t v38 = *(void *)(v0 + 256);
    uint64_t v39 = *(void *)(v0 + 240);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 + 248) + 16))(v38, *(void *)(v0 + 272), v39);
    *(void *)(v0 + 64) = v38;
    *(void *)(v0 + 72) = v39;
    *(void *)(v0 + 80) = sub_1000208D4(&qword_10003A438, &qword_10003A430);
    uint64_t v40 = encodeXPCValues<each A>(_:)();
    unint64_t v42 = v41;
    uint64_t v43 = *(void *)(v0 + 272);
    uint64_t v44 = *(void *)(v0 + 240);
    uint64_t v45 = *(void (**)(uint64_t, unint64_t))(v0 + 152);
    uint64_t v46 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 248) + 8);
    v46(*(void *)(v0 + 256), v44);
    v45(v40, v42);
    sub_10000D3E4(v40, v42);
    v46(v43, v44);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
    return v47();
  }
  uint64_t v50 = *(void *)(v0 + 16);
  uint64_t v49 = *(void *)(v0 + 24);
  uint64_t v51 = *(void *)(v0 + 32);
  uint64_t v52 = *(void *)(v0 + 40);
  char v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 120)
                                                                            + **(int **)(v0 + 120));
  unint64_t v53 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v53;
  void *v53 = v0;
  v53[1] = sub_10001D0E8;
  uint64_t v54 = *(void *)(v0 + 264);
  return v58(v54, v50, v49, v51, v52);
}

uint64_t sub_10001D0E8()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_10001D3FC;
  }
  else {
    os_log_type_t v2 = sub_10001D1FC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001D1FC()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[30];
  uint64_t v4 = v0[31];
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v1, enum case for ServiceResult.success<A>(_:), v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2, v1, v3);
  uint64_t v5 = v0[38];
  uint64_t v6 = v0[32];
  uint64_t v7 = v0[30];
  (*(void (**)(uint64_t, void, uint64_t))(v0[31] + 16))(v6, v0[34], v7);
  v0[8] = v6;
  v0[9] = v7;
  v0[10] = sub_1000208D4(&qword_10003A438, &qword_10003A430);
  uint64_t v8 = encodeXPCValues<each A>(_:)();
  if (v5)
  {
    swift_errorRelease();
    uint64_t v10 = 0;
    unint64_t v11 = 0xC000000000000000;
  }
  else
  {
    uint64_t v10 = v8;
    unint64_t v11 = v9;
  }
  uint64_t v12 = v0[34];
  uint64_t v13 = v0[30];
  os_log_type_t v14 = (void (*)(uint64_t, unint64_t))v0[19];
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0[31] + 8);
  v15(v0[32], v13);
  v14(v10, v11);
  sub_10000D3E4(v10, v11);
  v15(v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_10001D3FC()
{
  uint64_t v35 = v0;
  uint64_t v1 = v0[38];
  static Logger.general.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v31 = v0[26];
    uint64_t v32 = v0[25];
    uint64_t v33 = v0[27];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = StaticString.description.getter();
    v0[11] = sub_10001FB10(v6, v7, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2114;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[12] = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v5 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error in %s: %{public}@", (uint8_t *)v4, 0x16u);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v32);
  }
  else
  {
    uint64_t v10 = v0[26];
    uint64_t v9 = v0[27];
    uint64_t v11 = v0[25];
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  v0[7] = v1;
  swift_errorRetain();
  sub_1000034A8(&qword_10003A390);
  int v12 = swift_dynamicCast();
  uint64_t v13 = v0[24];
  if (v12)
  {
    os_log_type_t v14 = *(void (**)(uint64_t, void, void))(v0[22] + 32);
    v14(v0[24], v0[23], v0[21]);
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    uint64_t v15 = v0[21];
    uint64_t v16 = v0[22];
    swift_errorRelease();
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v13, enum case for AppInstallationMetricsError.unknown(_:), v15);
    swift_errorRelease();
    os_log_type_t v14 = *(void (**)(uint64_t, void, void))(v16 + 32);
  }
  uint64_t v17 = v0[34];
  uint64_t v18 = v0[30];
  uint64_t v19 = v0[31];
  v14(v17, v0[24], v0[21]);
  (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))(v17, enum case for ServiceResult.failure<A>(_:), v18);
  uint64_t v20 = v0[32];
  uint64_t v21 = v0[30];
  (*(void (**)(uint64_t, void, uint64_t))(v0[31] + 16))(v20, v0[34], v21);
  v0[8] = v20;
  v0[9] = v21;
  v0[10] = sub_1000208D4(&qword_10003A438, &qword_10003A430);
  uint64_t v22 = encodeXPCValues<each A>(_:)();
  unint64_t v24 = v23;
  uint64_t v25 = v0[34];
  uint64_t v26 = v0[30];
  unint64_t v27 = (void (*)(uint64_t, unint64_t))v0[19];
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v0[31] + 8);
  v28(v0[32], v26);
  v27(v22, v24);
  sub_10000D3E4(v22, v24);
  v28(v25, v26);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v29 = (uint64_t (*)(void))v0[1];
  return v29();
}

uint64_t sub_10001D8D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 152) = v14;
  *(void *)(v8 + 160) = v15;
  *(unsigned char *)(v8 + 49) = a8;
  *(void *)(v8 + 136) = a6;
  *(void *)(v8 + 144) = a7;
  *(void *)(v8 + 120) = a4;
  *(void *)(v8 + 128) = a5;
  *(void *)(v8 + 104) = a2;
  *(void *)(v8 + 112) = a3;
  uint64_t v9 = type metadata accessor for AppInstallationMetricsError();
  *(void *)(v8 + 168) = v9;
  *(void *)(v8 + 176) = *(void *)(v9 - 8);
  *(void *)(v8 + 184) = swift_task_alloc();
  *(void *)(v8 + 192) = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Logger();
  *(void *)(v8 + 200) = v10;
  *(void *)(v8 + 208) = *(void *)(v10 - 8);
  *(void *)(v8 + 216) = swift_task_alloc();
  *(void *)(v8 + 224) = swift_task_alloc();
  *(void *)(v8 + 232) = swift_task_alloc();
  uint64_t v11 = sub_1000034A8(&qword_10003A378);
  *(void *)(v8 + 240) = v11;
  *(void *)(v8 + 248) = *(void *)(v11 - 8);
  *(void *)(v8 + 256) = swift_task_alloc();
  *(void *)(v8 + 264) = swift_task_alloc();
  *(void *)(v8 + 272) = swift_task_alloc();
  return _swift_task_switch(sub_10001DAAC, 0, 0);
}

uint64_t sub_10001DAAC()
{
  uint64_t KeyPath = swift_getKeyPath();
  *(void *)(v0 + 280) = KeyPath;
  uint64_t v4 = (uint64_t (*)(uint64_t))((char *)&dword_10003A380 + dword_10003A380);
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10001DB78;
  return v4(KeyPath);
}

uint64_t sub_10001DB78(char a1)
{
  *(unsigned char *)(*(void *)v1 + 50) = a1;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_10001DC98, 0, 0);
}

uint64_t sub_10001DC98()
{
  uint64_t v60 = v0;
  if (*(unsigned char *)(v0 + 50) != 1)
  {
    static Logger.general.getter();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Not enabled", v15, 2u);
      swift_slowDealloc();
    }
    uint64_t v16 = *(void *)(v0 + 232);
    uint64_t v17 = *(void *)(v0 + 200);
    uint64_t v18 = *(void *)(v0 + 208);
    uint64_t v7 = *(void *)(v0 + 168);
    uint64_t v8 = *(void *)(v0 + 176);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    uint64_t v9 = swift_allocError();
    uint64_t v11 = v19;
    int v12 = (unsigned int *)&enum case for AppInstallationMetricsError.serviceUnavailable(_:);
    goto LABEL_9;
  }
  sub_10001F3C4(*(void *)(v0 + 112), v0 + 16);
  if (*(unsigned char *)(v0 + 48))
  {
    static Logger.general.getter();
    uint64_t v1 = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v1, v2))
    {
      uint64_t v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Unable to obtain audit token", v3, 2u);
      swift_slowDealloc();
    }
    uint64_t v4 = *(void *)(v0 + 224);
    uint64_t v5 = *(void *)(v0 + 200);
    uint64_t v6 = *(void *)(v0 + 208);
    uint64_t v7 = *(void *)(v0 + 168);
    uint64_t v8 = *(void *)(v0 + 176);

    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    sub_100020B40(&qword_10003A118, (void (*)(uint64_t))&type metadata accessor for AppInstallationMetricsError);
    uint64_t v9 = swift_allocError();
    uint64_t v11 = v10;
    int v12 = (unsigned int *)&enum case for AppInstallationMetricsError.notAuthorized(_:);
LABEL_9:
    (*(void (**)(uint64_t, void, uint64_t))(v8 + 104))(v11, *v12, v7);
    swift_willThrow();
    static Logger.general.getter();
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.error.getter();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v24 = *(void *)(v0 + 208);
    uint64_t v23 = *(void *)(v0 + 216);
    if (v22)
    {
      uint64_t v56 = *(void *)(v0 + 200);
      uint64_t v57 = *(void *)(v0 + 216);
      uint64_t v25 = swift_slowAlloc();
      long long v55 = (void *)swift_slowAlloc();
      uint64_t v59 = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 136315394;
      uint64_t v26 = StaticString.description.getter();
      *(void *)(v0 + 88) = sub_10001FB10(v26, v27, &v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2114;
      swift_errorRetain();
      uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
      *(void *)(v0 + 96) = v28;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *long long v55 = v28;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Error in %s: %{public}@", (uint8_t *)v25, 0x16u);
      sub_1000034A8(&qword_10003A3A0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v57, v56);
    }
    else
    {
      uint64_t v29 = *(void *)(v0 + 200);
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v23, v29);
    }
    *(void *)(v0 + 56) = v9;
    swift_errorRetain();
    sub_1000034A8(&qword_10003A390);
    int v30 = swift_dynamicCast();
    uint64_t v31 = *(void *)(v0 + 192);
    if (v30)
    {
      uint64_t v32 = *(void (**)(uint64_t, void, void))(*(void *)(v0 + 176) + 32);
      v32(*(void *)(v0 + 192), *(void *)(v0 + 184), *(void *)(v0 + 168));
      swift_errorRelease();
      swift_errorRelease();
    }
    else
    {
      uint64_t v33 = *(void *)(v0 + 168);
      uint64_t v34 = *(void *)(v0 + 176);
      swift_errorRelease();
      (*(void (**)(uint64_t, void, uint64_t))(v34 + 104))(v31, enum case for AppInstallationMetricsError.unknown(_:), v33);
      swift_errorRelease();
      uint64_t v32 = *(void (**)(uint64_t, void, void))(v34 + 32);
    }
    uint64_t v35 = *(void *)(v0 + 272);
    uint64_t v36 = *(void *)(v0 + 240);
    uint64_t v37 = *(void *)(v0 + 248);
    v32(v35, *(void *)(v0 + 192), *(void *)(v0 + 168));
    (*(void (**)(uint64_t, void, uint64_t))(v37 + 104))(v35, enum case for ServiceResult.failure<A>(_:), v36);
    uint64_t v38 = *(void *)(v0 + 256);
    uint64_t v39 = *(void *)(v0 + 240);
    (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v0 + 248) + 16))(v38, *(void *)(v0 + 272), v39);
    *(void *)(v0 + 64) = v38;
    *(void *)(v0 + 72) = v39;
    *(void *)(v0 + 80) = sub_1000208D4(&qword_10003A398, &qword_10003A378);
    uint64_t v40 = encodeXPCValues<each A>(_:)();
    unint64_t v42 = v41;
    uint64_t v43 = *(void *)(v0 + 272);
    uint64_t v44 = *(void *)(v0 + 240);
    uint64_t v45 = *(void (**)(uint64_t, unint64_t))(v0 + 152);
    uint64_t v46 = *(void (**)(uint64_t, uint64_t))(*(void *)(v0 + 248) + 8);
    v46(*(void *)(v0 + 256), v44);
    v45(v40, v42);
    sub_10000D3E4(v40, v42);
    v46(v43, v44);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v47 = *(uint64_t (**)(void))(v0 + 8);
    return v47();
  }
  uint64_t v50 = *(void *)(v0 + 16);
  uint64_t v49 = *(void *)(v0 + 24);
  uint64_t v51 = *(void *)(v0 + 32);
  uint64_t v52 = *(void *)(v0 + 40);
  char v58 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 120)
                                                                            + **(int **)(v0 + 120));
  unint64_t v53 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v53;
  void *v53 = v0;
  v53[1] = sub_10001E45C;
  uint64_t v54 = *(void *)(v0 + 264);
  return v58(v54, v50, v49, v51, v52);
}

uint64_t sub_10001E45C()
{
  *(void *)(*(void *)v1 + 304) = v0;
  swift_task_dealloc();
  if (v0) {
    os_log_type_t v2 = sub_10001E770;
  }
  else {
    os_log_type_t v2 = sub_10001E570;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001E570()
{
  uint64_t v1 = v0[33];
  uint64_t v2 = v0[34];
  uint64_t v3 = v0[30];
  uint64_t v4 = v0[31];
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v1, enum case for ServiceResult.success<A>(_:), v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2, v1, v3);
  uint64_t v5 = v0[38];
  uint64_t v6 = v0[32];
  uint64_t v7 = v0[30];
  (*(void (**)(uint64_t, void, uint64_t))(v0[31] + 16))(v6, v0[34], v7);
  v0[8] = v6;
  v0[9] = v7;
  v0[10] = sub_1000208D4(&qword_10003A398, &qword_10003A378);
  uint64_t v8 = encodeXPCValues<each A>(_:)();
  if (v5)
  {
    swift_errorRelease();
    uint64_t v10 = 0;
    unint64_t v11 = 0xC000000000000000;
  }
  else
  {
    uint64_t v10 = v8;
    unint64_t v11 = v9;
  }
  uint64_t v12 = v0[34];
  uint64_t v13 = v0[30];
  os_log_type_t v14 = (void (*)(uint64_t, unint64_t))v0[19];
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0[31] + 8);
  v15(v0[32], v13);
  v14(v10, v11);
  sub_10000D3E4(v10, v11);
  v15(v12, v13);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v16 = (uint64_t (*)(void))v0[1];
  return v16();
}

uint64_t sub_10001E770()
{
  uint64_t v35 = v0;
  uint64_t v1 = v0[38];
  static Logger.general.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = Logger.logObject.getter();
  os_log_type_t v3 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v31 = v0[26];
    uint64_t v32 = v0[25];
    uint64_t v33 = v0[27];
    uint64_t v4 = swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 136315394;
    uint64_t v6 = StaticString.description.getter();
    v0[11] = sub_10001FB10(v6, v7, &v34);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2114;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    v0[12] = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v5 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error in %s: %{public}@", (uint8_t *)v4, 0x16u);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v32);
  }
  else
  {
    uint64_t v10 = v0[26];
    uint64_t v9 = v0[27];
    uint64_t v11 = v0[25];
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  v0[7] = v1;
  swift_errorRetain();
  sub_1000034A8(&qword_10003A390);
  int v12 = swift_dynamicCast();
  uint64_t v13 = v0[24];
  if (v12)
  {
    os_log_type_t v14 = *(void (**)(uint64_t, void, void))(v0[22] + 32);
    v14(v0[24], v0[23], v0[21]);
    swift_errorRelease();
    swift_errorRelease();
  }
  else
  {
    uint64_t v15 = v0[21];
    uint64_t v16 = v0[22];
    swift_errorRelease();
    (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v13, enum case for AppInstallationMetricsError.unknown(_:), v15);
    swift_errorRelease();
    os_log_type_t v14 = *(void (**)(uint64_t, void, void))(v16 + 32);
  }
  uint64_t v17 = v0[34];
  uint64_t v18 = v0[30];
  uint64_t v19 = v0[31];
  v14(v17, v0[24], v0[21]);
  (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))(v17, enum case for ServiceResult.failure<A>(_:), v18);
  uint64_t v20 = v0[32];
  uint64_t v21 = v0[30];
  (*(void (**)(uint64_t, void, uint64_t))(v0[31] + 16))(v20, v0[34], v21);
  v0[8] = v20;
  v0[9] = v21;
  v0[10] = sub_1000208D4(&qword_10003A398, &qword_10003A378);
  uint64_t v22 = encodeXPCValues<each A>(_:)();
  unint64_t v24 = v23;
  uint64_t v25 = v0[34];
  uint64_t v26 = v0[30];
  unint64_t v27 = (void (*)(uint64_t, unint64_t))v0[19];
  uint64_t v28 = *(void (**)(uint64_t, uint64_t))(v0[31] + 8);
  v28(v0[32], v26);
  v27(v22, v24);
  sub_10000D3E4(v22, v24);
  v28(v25, v26);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v29 = (uint64_t (*)(void))v0[1];
  return v29();
}

uint64_t sub_10001EC44(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000D2D4(a1, &qword_10003A1F8);
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

uint64_t sub_10001EDF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_10001EEA8;
  return sub_100018D54(a2, a3, a4, a5);
}

uint64_t sub_10001EEA8()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    os_log_type_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return _swift_task_switch(sub_10001EFD8, 0, 0);
  }
}

uint64_t sub_10001EFD8()
{
  **(_WORD **)(v0 + 16) = 256;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10001EFFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a1;
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v5 + 24) = v10;
  *uint64_t v10 = v5;
  v10[1] = sub_10001F0B4;
  return sub_10001A030(a2, a3, a4, a5);
}

uint64_t sub_10001F0B4()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    os_log_type_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
  else
  {
    return _swift_task_switch(sub_100020BA8, 0, 0);
  }
}

uint64_t sub_10001F1E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6)
{
  *(void *)(v6 + 16) = a1;
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)a6 + *a6);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v6 + 24) = v11;
  *uint64_t v11 = v6;
  v11[1] = sub_10001F0B4;
  return v13(a2, a3, a4, a5);
}

uint64_t type metadata accessor for Service()
{
  return self;
}

uint64_t sub_10001F384()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001F3C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000034A8(&qword_10003A330);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001F42C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 56);
  uint64_t v9 = v1 + 64;
  char v10 = *(unsigned char *)(v1 + 48);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100020B88;
  return sub_10001AFB0(a1, v4, v5, v6, v7, v10, v8, v9);
}

uint64_t sub_10001F53C(uint64_t a1)
{
  *(void *)(v1 + 24) = a1;
  return _swift_task_switch(sub_10001F55C, 0, 0);
}

uint64_t sub_10001F55C()
{
  uint64_t v1 = v0[3];
  v0[4] = *(void *)(v1 + 16);
  v0[5] = *(void *)(v1 + 24);
  swift_unknownObjectRetain_n();
  v0[2] = sub_1000147A0((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v5 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_100039F88 + dword_100039F88);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[6] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_10001F638;
  uint64_t v3 = v0[3];
  return v5(v3, (uint64_t)(v0 + 2));
}

uint64_t sub_10001F638()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_unknownObjectRelease();
    uint64_t v2 = sub_10001F7C8;
  }
  else
  {
    uint64_t v2 = sub_10001F754;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10001F754()
{
  swift_release();
  swift_unknownObjectRelease();
  uint64_t v1 = v0[2];
  uint64_t v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[1];
  uint64_t v3 = v0[4];
  uint64_t v4 = v0[5];
  return v2(v1, v3, v4);
}

uint64_t sub_10001F7C8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001F83C(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10001F918;
  return v6(a1);
}

uint64_t sub_10001F918()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10001FA10(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_100020B88;
  return sub_10001D8D0(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_10001FB10(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001FBE4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000D330((uint64_t)v12, *a3);
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
      sub_10000D330((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000D120((uint64_t)v12);
  return v7;
}

uint64_t sub_10001FBE4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001FDA0(a5, a6);
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

uint64_t sub_10001FDA0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001FE38(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100020018(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100020018(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001FE38(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001FFB0(v2, 0);
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

void *sub_10001FFB0(uint64_t a1, uint64_t a2)
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
  sub_1000034A8(&qword_10003A370);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100020018(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000034A8(&qword_10003A370);
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

void sub_100020168(uint64_t a1@<X8>)
{
  *(void *)a1 = 0xD000000000000012;
  *(void *)(a1 + 8) = 0x800000010002D910;
  *(unsigned char *)(a1 + 16) = 1;
}

uint64_t sub_100020190(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000201DC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 56);
  uint64_t v9 = v1 + 64;
  char v10 = *(unsigned char *)(v1 + 48);
  size_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *size_t v11 = v2;
  v11[1] = sub_100020B88;
  return sub_10001AA04(a1, v4, v5, v6, v7, v10, v8, v9);
}

uint64_t sub_1000202EC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  size_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *size_t v11 = v2;
  v11[1] = sub_100020B88;
  return sub_10001B1E8(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1000203EC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100020424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *(void *)(v4 + 16);
  size_t v11 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v11;
  *size_t v11 = v5;
  v11[1] = sub_100020B88;
  return sub_1000198D8(a1, a2, a3, a4, v10);
}

uint64_t sub_1000204E8()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100020520(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = *(int **)(v5 + 16);
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v6 + 16) = v13;
  *uint64_t v13 = v6;
  v13[1] = sub_100020B88;
  v13[2] = a1;
  uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v12 + *v12);
  uint64_t v14 = (void *)swift_task_alloc();
  v13[3] = v14;
  *uint64_t v14 = v13;
  v14[1] = sub_10001F0B4;
  return v16(a2, a3, a4, a5);
}

uint64_t sub_100020674()
{
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 144, 7);
}

uint64_t sub_1000206C4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 56);
  uint64_t v9 = v1 + 64;
  char v10 = *(unsigned char *)(v1 + 48);
  size_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *size_t v11 = v2;
  v11[1] = sub_100016978;
  return sub_10001AC3C(a1, v4, v5, v6, v7, v10, v8, v9);
}

uint64_t sub_1000207D4(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  size_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *size_t v11 = v2;
  v11[1] = sub_100020B88;
  return sub_10001C55C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1000208D4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100020190(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100020924()
{
  uint64_t v1 = *(void *)(v0 + 16);
  CFArrayRef isa = Data._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, objc_class *))(v1 + 16))(v1, isa);
}

uint64_t sub_10002097C()
{
  sub_10000D3E4(*(void *)(v0 + 16), *(void *)(v0 + 24));

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000209BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = v4[2];
  uint64_t v11 = v4[3];
  uint64_t v12 = v4[4];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v5 + 16) = v13;
  *uint64_t v13 = v5;
  v13[1] = sub_100016978;
  return sub_100017F00(a1, a2, a3, a4, v10, v11, v12);
}

uint64_t sub_100020A94(uint64_t a1, unint64_t a2)
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

unint64_t sub_100020AEC()
{
  unint64_t result = qword_10003A468;
  if (!qword_10003A468)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A468);
  }
  return result;
}

uint64_t sub_100020B40(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100020BB0(uint64_t a1)
{
  unsigned char v2[24] = a1;
  v2[25] = v1;
  uint64_t v3 = sub_1000034A8(&qword_10003A538);
  v2[26] = v3;
  v2[27] = *(void *)(v3 - 8);
  v2[28] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Logger();
  v2[29] = v4;
  v2[30] = *(void *)(v4 - 8);
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v2[33] = swift_task_alloc();
  return _swift_task_switch(sub_100020CEC, 0, 0);
}

uint64_t sub_100020CEC()
{
  uint64_t v1 = (void *)v0[24];
  static Logger.metrics.getter();
  id v2 = v1;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (void *)v0[24];
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v20 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    v0[23] = v5;
    id v7 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v20 = v5;

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@] Flushing events", v6, 0xCu);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    uint64_t v8 = (void *)v0[24];
  }
  uint64_t v9 = v0[33];
  uint64_t v10 = v0[29];
  uint64_t v11 = v0[30];
  uint64_t v13 = v0[27];
  uint64_t v12 = v0[28];
  uint64_t v15 = v0[25];
  uint64_t v14 = v0[26];
  uint64_t v16 = *(void (**)(uint64_t, uint64_t))(v11 + 8);
  v0[34] = v16;
  v0[35] = (v11 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v16(v9, v10);
  id v17 = [*(id *)(v15 + 16) flush];
  v0[36] = v17;
  v0[2] = v0;
  v0[7] = v0 + 18;
  v0[3] = sub_100020FE8;
  swift_continuation_init();
  v0[17] = v14;
  uint64_t v18 = sub_10000D090(v0 + 14);
  sub_100021D4C();
  sub_1000034A8(&qword_10003A390);
  CheckedContinuation.init(continuation:function:)();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v13 + 32))(v18, v12, v14);
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 1107296256;
  v0[12] = sub_100021968;
  v0[13] = &unk_1000360F0;
  [v17 resultWithTimeout:v0 + 10 completion:120.0];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_100020FE8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 296) = v1;
  if (v1) {
    id v2 = sub_10002133C;
  }
  else {
    id v2 = sub_1000210F8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000210F8()
{
  uint64_t v1 = *(void **)(v0 + 192);
  id v2 = *(void **)(v0 + 144);
  static Logger.metrics.getter();
  id v3 = v1;
  id v4 = v2;
  id v5 = v3;
  uint64_t v6 = v4;
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *(void **)(v0 + 192);
  if (v9)
  {
    os_log_type_t type = v8;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    *(void *)(v0 + 168) = v10;
    uint64_t v19 = (void *)v12;
    *(_DWORD *)uint64_t v11 = 138412546;
    id v13 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v19 = v10;

    *(_WORD *)(v11 + 12) = 2114;
    *(void *)(v0 + 176) = v6;
    uint64_t v14 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v19[1] = v6;

    _os_log_impl((void *)&_mh_execute_header, v7, type, "[%@] Flushed %{public}@ event(s)", (uint8_t *)v11, 0x16u);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v15 = *(NSObject **)(v0 + 288);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 288);

    id v7 = v6;
    uint64_t v15 = v6;
  }

  (*(void (**)(void, void))(v0 + 272))(*(void *)(v0 + 256), *(void *)(v0 + 232));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_10002133C()
{
  uint64_t v1 = *(void **)(v0 + 288);
  id v2 = *(void **)(v0 + 192);
  swift_willThrow();

  static Logger.metrics.getter();
  id v3 = v2;
  swift_errorRetain();
  id v4 = v3;
  swift_errorRetain();
  id v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    id v7 = *(void **)(v0 + 192);
    os_log_t log = v5;
    uint64_t v8 = swift_slowAlloc();
    BOOL v9 = (void *)swift_slowAlloc();
    *(void *)(v0 + 152) = v7;
    *(_DWORD *)uint64_t v8 = 138412546;
    id v10 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v9 = v7;

    *(_WORD *)(v8 + 12) = 2114;
    swift_errorRetain();
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 160) = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v9[1] = v11;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, log, v6, "[%@] Failed to flush events due to error: %{public}@", (uint8_t *)v8, 0x16u);
    sub_1000034A8(&qword_10003A3A0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    swift_errorRelease();
  }
  else
  {
    uint64_t v12 = *(void **)(v0 + 192);
    swift_errorRelease();

    swift_errorRelease();
    swift_errorRelease();
  }
  (*(void (**)(void, void))(v0 + 272))(*(void *)(v0 + 248), *(void *)(v0 + 232));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v13 = *(uint64_t (**)(void))(v0 + 8);
  return v13();
}

uint64_t sub_1000215B4(char *a1, char *a2)
{
  return sub_100010A48(*a1, *a2);
}

Swift::Int sub_1000215C0()
{
  return Hasher._finalize()();
}

uint64_t sub_100021658()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000216DC()
{
  return Hasher._finalize()();
}

uint64_t sub_100021770@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100035648, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  if (v3 == 1) {
    char v5 = 1;
  }
  else {
    char v5 = 2;
  }
  if (!v3) {
    char v5 = 0;
  }
  *a2 = v5;
  return result;
}

void sub_1000217D0(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x4E646C697542736FLL;
  if (*v1) {
    uint64_t v2 = 0x6F724665726F7473;
  }
  unint64_t v3 = 0xED00007265626D75;
  if (*v1) {
    unint64_t v3 = 0xEC0000006449746ELL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_100021824()
{
  return 1;
}

Swift::Int sub_10002182C()
{
  return Hasher._finalize()();
}

uint64_t sub_100021884()
{
  return String.hash(into:)();
}

Swift::Int sub_1000218A0()
{
  return Hasher._finalize()();
}

uint64_t sub_1000218F4@<X0>(Swift::String *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::Int v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100035698, *a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3 != 0;
  return result;
}

void sub_100021948(void *a1@<X8>)
{
  *a1 = 0xD000000000000031;
  a1[1] = 0x800000010002D160;
}

void sub_100021968(uint64_t a1, void *a2, void *a3)
{
  sub_10000D170((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a3)
  {
    id v5 = a3;
    sub_1000034A8(&qword_10003A538);
    CheckedContinuation.resume(throwing:)();
  }
  else if (a2)
  {
    id v6 = a2;
    sub_1000034A8(&qword_10003A538);
    CheckedContinuation.resume(returning:)();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100021A0C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ASEMetrics()
{
  return self;
}

uint64_t getEnumTagSinglePayload for ManateeDomain(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for ManateeDomain(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x100021B58);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100021B80()
{
  return 0;
}

ValueMetadata *type metadata accessor for ManateeDomain()
{
  return &type metadata for ManateeDomain;
}

unsigned char *storeEnumTagSinglePayload for SupplementalField(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100021C64);
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

ValueMetadata *type metadata accessor for SupplementalField()
{
  return &type metadata for SupplementalField;
}

unint64_t sub_100021CA0()
{
  unint64_t result = qword_10003A520;
  if (!qword_10003A520)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A520);
  }
  return result;
}

unint64_t sub_100021CF8()
{
  unint64_t result = qword_10003A528;
  if (!qword_10003A528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10003A528);
  }
  return result;
}

unint64_t sub_100021D4C()
{
  unint64_t result = qword_10003A540;
  if (!qword_10003A540)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10003A540);
  }
  return result;
}

uint64_t sub_100021D8C(uint64_t a1, uint64_t a2)
{
  return sub_10000D330(a2 + 32, a1 + 32);
}

uint64_t sub_100021D9C(uint64_t a1)
{
  return sub_10000D120(a1 + 32);
}

uint64_t sub_100021DA4(void *a1, void *a2)
{
  int v3 = v2;
  uint64_t v6 = *v2;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v7 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v28 = *v3;
    *int v3 = 0x8000000000000000;
    id v24 = a2;
    sub_100022E58((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *int v3 = v28;
    swift_bridgeObjectRelease();
    *a1 = v24;
    return 1;
  }
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  if (v10 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v12 == v13)
  {
LABEL_16:
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
    {
      uint64_t v16 = ~v8;
      do
      {
        unint64_t v9 = (v9 + 1) & v16;
        if (((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
          goto LABEL_15;
        }
        uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v19 = v18;
        if (v17 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v19 == v20) {
          goto LABEL_16;
        }
        char v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      while ((v22 & 1) == 0);
    }
  }

  swift_bridgeObjectRelease();
  uint64_t v26 = *(void **)(*(void *)(*v3 + 48) + 8 * v9);
  *a1 = v26;
  id v27 = v26;
  return 0;
}

uint64_t sub_100021FD0(uint64_t a1, char *a2)
{
  int v3 = v2;
  uint64_t v6 = type metadata accessor for Calendar.Component();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *v2;
  sub_100024AA4(&qword_10003A558);
  swift_bridgeObjectRetain();
  uint64_t v35 = a2;
  uint64_t v12 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v13 = -1 << *(unsigned char *)(v11 + 32);
  unint64_t v14 = v12 & ~v13;
  uint64_t v34 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
  {
    int v30 = v2;
    uint64_t v31 = a1;
    uint64_t v32 = ~v13;
    uint64_t v29 = v7;
    uint64_t v17 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v16 = v7 + 16;
    char v15 = v17;
    uint64_t v33 = *(void *)(v16 + 56);
    uint64_t v18 = (void (**)(char *, uint64_t))(v16 - 8);
    v28[1] = v16 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v19 = v11;
      unint64_t v20 = v33 * v14;
      unint64_t v21 = *(void *)(v11 + 48) + v33 * v14;
      char v22 = v15;
      v15(v10, v21, v6);
      sub_100024AA4(&qword_10003A560);
      char v23 = dispatch thunk of static Equatable.== infix(_:_:)();
      id v24 = *v18;
      (*v18)(v10, v6);
      if (v23) {
        break;
      }
      unint64_t v14 = (v14 + 1) & v32;
      char v15 = v22;
      uint64_t v11 = v19;
      if (((*(void *)(v34 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        int v3 = v30;
        a1 = v31;
        uint64_t v7 = v29;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v24(v35, v6);
    v22(v31, *(void *)(*v30 + 48) + v20, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    char v15 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v26 = v35;
    v15(v10, v35, v6);
    uint64_t v36 = *v3;
    *int v3 = 0x8000000000000000;
    sub_100023088((uint64_t)v10, v14, isUniquelyReferenced_nonNull_native);
    *int v3 = v36;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v26, v6);
    return 1;
  }
}

uint64_t sub_1000222CC(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
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
      unint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
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
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *int v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100023300(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *int v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10002247C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000034A8(&qword_10003A578);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    id v27 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v29 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v28 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v8 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v10 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v13 = v12 | (v10 << 6);
      }
      else
      {
        int64_t v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v14 >= v28) {
          goto LABEL_33;
        }
        unint64_t v15 = v29[v14];
        ++v10;
        if (!v15)
        {
          int64_t v10 = v14 + 1;
          if (v14 + 1 >= v28) {
            goto LABEL_33;
          }
          unint64_t v15 = v29[v10];
          if (!v15)
          {
            int64_t v10 = v14 + 2;
            if (v14 + 2 >= v28) {
              goto LABEL_33;
            }
            unint64_t v15 = v29[v10];
            if (!v15)
            {
              int64_t v16 = v14 + 3;
              if (v16 >= v28)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v27;
                uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
                if (v26 > 63) {
                  bzero(v29, ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v29 = -1 << v26;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v15 = v29[v16];
              if (!v15)
              {
                while (1)
                {
                  int64_t v10 = v16 + 1;
                  if (__OFADD__(v16, 1)) {
                    goto LABEL_39;
                  }
                  if (v10 >= v28) {
                    goto LABEL_33;
                  }
                  unint64_t v15 = v29[v10];
                  ++v16;
                  if (v15) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v10 = v16;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v15 - 1) & v15;
        unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      uint64_t v17 = *(void *)(*(void *)(v2 + 48) + 8 * v13);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      Hasher.init(_seed:)();
      String.hash(into:)();
      Swift::Int v18 = Hasher._finalize()();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v20 = v18 & ~v19;
      unint64_t v21 = v20 >> 6;
      if (((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6))) != 0)
      {
        unint64_t v11 = __clz(__rbit64((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v22 = 0;
        unint64_t v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v24 = v21 == v23;
          if (v21 == v23) {
            unint64_t v21 = 0;
          }
          v22 |= v24;
          uint64_t v25 = *(void *)(v8 + 8 * v21);
        }
        while (v25 == -1);
        unint64_t v11 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(void *)(*(void *)(v4 + 48) + 8 * v11) = v17;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_100022790()
{
  uint64_t v1 = v0;
  uint64_t v43 = type metadata accessor for Calendar.Component();
  uint64_t v2 = *(void *)(v43 - 8);
  __chkstk_darwin(v43, v3);
  unint64_t v42 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *v0;
  sub_1000034A8(&qword_10003A568);
  uint64_t v6 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    uint64_t v9 = *(void *)(v5 + 56);
    uint64_t v38 = (void *)(v5 + 56);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & v9;
    uint64_t v36 = v0;
    int64_t v37 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v40 = v2;
    uint64_t v12 = v6 + 56;
    uint64_t result = swift_retain();
    int64_t v14 = 0;
    uint64_t v39 = v7;
    unint64_t v15 = v42;
    uint64_t v16 = v43;
    while (1)
    {
      if (v11)
      {
        unint64_t v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        int64_t v41 = v14;
        unint64_t v19 = v18 | (v14 << 6);
      }
      else
      {
        int64_t v20 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v20 >= v37) {
          goto LABEL_33;
        }
        unint64_t v21 = v38[v20];
        int64_t v22 = v14 + 1;
        if (!v21)
        {
          int64_t v22 = v14 + 2;
          if (v14 + 2 >= v37) {
            goto LABEL_33;
          }
          unint64_t v21 = v38[v22];
          if (!v21)
          {
            int64_t v22 = v14 + 3;
            if (v14 + 3 >= v37) {
              goto LABEL_33;
            }
            unint64_t v21 = v38[v22];
            if (!v21)
            {
              uint64_t v23 = v14 + 4;
              if (v14 + 4 >= v37)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v36;
                uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
                if (v35 > 63) {
                  bzero(v38, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v38 = -1 << v35;
                }
                *(void *)(v5 + 16) = 0;
                break;
              }
              unint64_t v21 = v38[v23];
              if (!v21)
              {
                while (1)
                {
                  int64_t v22 = v23 + 1;
                  if (__OFADD__(v23, 1)) {
                    goto LABEL_39;
                  }
                  if (v22 >= v37) {
                    goto LABEL_33;
                  }
                  unint64_t v21 = v38[v22];
                  ++v23;
                  if (v21) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v22 = v14 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v11 = (v21 - 1) & v21;
        int64_t v41 = v22;
        unint64_t v19 = __clz(__rbit64(v21)) + (v22 << 6);
      }
      uint64_t v24 = v5;
      uint64_t v25 = *(void *)(v5 + 48);
      uint64_t v26 = *(void *)(v40 + 72);
      id v27 = *(void (**)(char *, unint64_t, uint64_t))(v40 + 32);
      v27(v15, v25 + v26 * v19, v16);
      uint64_t v7 = v39;
      sub_100024AA4(&qword_10003A558);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v28 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v29 = result & ~v28;
      unint64_t v30 = v29 >> 6;
      if (((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6))) != 0)
      {
        unint64_t v17 = __clz(__rbit64((-1 << v29) & ~*(void *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v28) >> 6;
        do
        {
          if (++v30 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v33 = v30 == v32;
          if (v30 == v32) {
            unint64_t v30 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v12 + 8 * v30);
        }
        while (v34 == -1);
        unint64_t v17 = __clz(__rbit64(~v34)) + (v30 << 6);
      }
      *(void *)(v12 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v27)(*(void *)(v7 + 48) + v17 * v26, v42, v43);
      ++*(void *)(v7 + 16);
      uint64_t v5 = v24;
      int64_t v14 = v41;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v7;
  return result;
}

uint64_t sub_100022B78()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000034A8(&qword_10003A570);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v30 = (void *)(v2 + 56);
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
                  *unint64_t v30 = -1 << v29;
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
      unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
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
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_100022E58(uint64_t result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_22;
  }
  if (a3)
  {
    sub_10002247C();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_10002349C();
LABEL_22:
      uint64_t v25 = *v4;
      *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
      *(void *)(*(void *)(v25 + 48) + 8 * a2) = v6;
      uint64_t v26 = *(void *)(v25 + 16);
      BOOL v27 = __OFADD__(v26, 1);
      uint64_t v28 = v26 + 1;
      if (!v27)
      {
        *(void *)(v25 + 16) = v28;
        return result;
      }
      __break(1u);
      goto LABEL_25;
    }
    sub_100023AA0();
  }
  uint64_t v9 = *v3;
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v10 = Hasher._finalize()();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = v10 & ~v11;
  if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
    goto LABEL_22;
  }
  uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = v13;
  if (v12 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v14 == v15)
  {
LABEL_25:
    swift_bridgeObjectRelease_n();
    goto LABEL_26;
  }
  char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  if ((v17 & 1) == 0)
  {
    uint64_t v18 = ~v11;
    do
    {
      a2 = (a2 + 1) & v18;
      if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v21 = v20;
      if (v19 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v21 == v22) {
        goto LABEL_25;
      }
      char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
    }
    while ((v24 & 1) == 0);
  }
LABEL_26:
  type metadata accessor for URLResourceKey(0);
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t sub_100023088(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v32 = a1;
  uint64_t v6 = type metadata accessor for Calendar.Component();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  Swift::Int v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v11 = *(void *)(*v3 + 16);
  unint64_t v12 = *(void *)(*v3 + 24);
  uint64_t v29 = v3;
  uint64_t v30 = v7;
  if (v12 > v11 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_100022790();
  }
  else
  {
    if (v12 > v11)
    {
      sub_100023648();
      goto LABEL_12;
    }
    sub_100023D80();
  }
  uint64_t v13 = *v3;
  sub_100024AA4(&qword_10003A558);
  uint64_t v14 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v15 = -1 << *(unsigned char *)(v13 + 32);
  a2 = v14 & ~v15;
  uint64_t v31 = v13;
  uint64_t v16 = v13 + 56;
  if ((*(void *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v17 = ~v15;
    uint64_t v20 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v19 = v7 + 16;
    uint64_t v18 = v20;
    uint64_t v21 = *(void *)(v19 + 56);
    do
    {
      v18(v10, *(void *)(v31 + 48) + v21 * a2, v6);
      sub_100024AA4(&qword_10003A560);
      char v22 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v19 - 8))(v10, v6);
      if (v22) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v17;
    }
    while (((*(void *)(v16 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v23 = v30;
  uint64_t v24 = *v29;
  *(void *)(v24 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v23 + 32))(*(void *)(v24 + 48) + *(void *)(v23 + 72) * a2, v32, v6);
  uint64_t v26 = *(void *)(v24 + 16);
  BOOL v27 = __OFADD__(v26, 1);
  uint64_t v28 = v26 + 1;
  if (!v27)
  {
    *(void *)(v24 + 16) = v28;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

Swift::Int sub_100023300(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
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
    sub_100022B78();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_1000238EC();
      goto LABEL_22;
    }
    sub_10002411C();
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
    uint64_t v15 = (void *)(v14 + 16 * a3);
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
        uint64_t v18 = (void *)(v14 + 16 * a3);
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

id sub_10002349C()
{
  uint64_t v1 = v0;
  sub_1000034A8(&qword_10003A578);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    *uint64_t v1 = v4;
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

void *sub_100023648()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Calendar.Component();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000034A8(&qword_10003A568);
  uint64_t v7 = *v0;
  uint64_t v8 = static _SetStorage.copy(original:)();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    id result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v9;
    return result;
  }
  BOOL v23 = v1;
  id result = (void *)(v8 + 56);
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 56 + 8 * v11) {
    id result = memmove(result, (const void *)(v7 + 56), 8 * v11);
  }
  uint64_t v24 = v7 + 56;
  int64_t v12 = 0;
  *(void *)(v9 + 16) = *(void *)(v7 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v7 + 56);
  int64_t v25 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v17 = v16 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v19 >= v25) {
      goto LABEL_25;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v25) {
        goto LABEL_25;
      }
      unint64_t v20 = *(void *)(v24 + 8 * v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v25) {
          goto LABEL_25;
        }
        unint64_t v20 = *(void *)(v24 + 8 * v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v20 - 1) & v20;
    unint64_t v17 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_9:
    unint64_t v18 = *(void *)(v3 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v6, *(void *)(v7 + 48) + v18, v2);
    id result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v9 + 48) + v18, v6, v2);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v25)
  {
LABEL_25:
    id result = (void *)swift_release();
    uint64_t v1 = v23;
    goto LABEL_27;
  }
  unint64_t v20 = *(void *)(v24 + 8 * v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v25) {
      goto LABEL_25;
    }
    unint64_t v20 = *(void *)(v24 + 8 * v12);
    ++v21;
    if (v20) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_1000238EC()
{
  uint64_t v1 = v0;
  sub_1000034A8(&qword_10003A570);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
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
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    int64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v19 = *v17;
    v19[1] = v18;
    id result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_100023AA0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000034A8(&qword_10003A578);
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
  BOOL v27 = v0;
  uint64_t v28 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v8 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v10 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    int64_t v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v14 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v14);
    ++v10;
    if (!v15)
    {
      int64_t v10 = v14 + 1;
      if (v14 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v15 = *(void *)(v28 + 8 * v10);
      if (!v15)
      {
        int64_t v10 = v14 + 2;
        if (v14 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v15 = *(void *)(v28 + 8 * v10);
        if (!v15) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v7 = (v15 - 1) & v15;
    unint64_t v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + 8 * v13);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    id v18 = v17;
    String.hash(into:)();
    Swift::Int v19 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = v19 & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6))) != 0)
    {
      unint64_t v11 = __clz(__rbit64((-1 << v21) & ~*(void *)(v8 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        BOOL v25 = v22 == v24;
        if (v22 == v24) {
          unint64_t v22 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v8 + 8 * v22);
      }
      while (v26 == -1);
      unint64_t v11 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(void *)(*(void *)(v4 + 48) + 8 * v11) = v18;
    ++*(void *)(v4 + 16);
  }
  int64_t v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_35;
  }
  unint64_t v15 = *(void *)(v28 + 8 * v16);
  if (v15)
  {
    int64_t v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v10 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v10 >= v29) {
      goto LABEL_33;
    }
    unint64_t v15 = *(void *)(v28 + 8 * v10);
    ++v16;
    if (v15) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100023D80()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Calendar.Component();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v0;
  sub_1000034A8(&qword_10003A568);
  uint64_t v8 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v9;
    return result;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 56);
  uint64_t v35 = v0;
  uint64_t v36 = v7 + 56;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  int64_t v37 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v38 = v3 + 16;
  uint64_t v14 = v8 + 56;
  uint64_t v39 = v3;
  unint64_t v15 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v19 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v20 = v19 | (v17 << 6);
      goto LABEL_24;
    }
    int64_t v21 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v21 >= v37) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v36 + 8 * v21);
    ++v17;
    if (!v22)
    {
      int64_t v17 = v21 + 1;
      if (v21 + 1 >= v37) {
        goto LABEL_33;
      }
      unint64_t v22 = *(void *)(v36 + 8 * v17);
      if (!v22)
      {
        int64_t v17 = v21 + 2;
        if (v21 + 2 >= v37) {
          goto LABEL_33;
        }
        unint64_t v22 = *(void *)(v36 + 8 * v17);
        if (!v22) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v13 = (v22 - 1) & v22;
    unint64_t v20 = __clz(__rbit64(v22)) + (v17 << 6);
LABEL_24:
    uint64_t v24 = v7;
    uint64_t v25 = *(void *)(v7 + 48);
    uint64_t v26 = *(void *)(v39 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v39 + 16))(v6, v25 + v26 * v20, v2);
    sub_100024AA4(&qword_10003A558);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v27 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v28 = result & ~v27;
    unint64_t v29 = v28 >> 6;
    if (((-1 << v28) & ~*(void *)(v14 + 8 * (v28 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v28) & ~*(void *)(v14 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v30 = 0;
      unint64_t v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v32 = v29 == v31;
        if (v29 == v31) {
          unint64_t v29 = 0;
        }
        v30 |= v32;
        uint64_t v33 = *(void *)(v14 + 8 * v29);
      }
      while (v33 == -1);
      unint64_t v18 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(void *)(v14 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t result = (*v15)(*(void *)(v9 + 48) + v18 * v26, v6, v2);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v24;
  }
  int64_t v23 = v21 + 3;
  if (v23 >= v37)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v35;
    goto LABEL_35;
  }
  unint64_t v22 = *(void *)(v36 + 8 * v23);
  if (v22)
  {
    int64_t v17 = v23;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v17 = v23 + 1;
    if (__OFADD__(v23, 1)) {
      break;
    }
    if (v17 >= v37) {
      goto LABEL_33;
    }
    unint64_t v22 = *(void *)(v36 + 8 * v17);
    ++v23;
    if (v22) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10002411C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000034A8(&qword_10003A570);
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
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
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
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v20;
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

uint64_t sub_1000243CC(uint64_t a1)
{
  v27[1] = a1;
  uint64_t v1 = type metadata accessor for Calendar.Component();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v4 = __chkstk_darwin(v1, v3);
  v27[0] = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  uint64_t v9 = (char *)v27 - v8;
  __chkstk_darwin(v7, v10);
  unint64_t v12 = (char *)v27 - v11;
  sub_1000034A8(&qword_10003A550);
  uint64_t v13 = *(void *)(v2 + 72);
  unint64_t v14 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_10002CD90;
  uint64_t v28 = v15;
  unint64_t v16 = v15 + v14;
  unint64_t v17 = *(void (**)(unint64_t, void, uint64_t))(v2 + 104);
  v17(v15 + v14, enum case for Calendar.Component.year(_:), v1);
  v17(v16 + v13, enum case for Calendar.Component.month(_:), v1);
  v17(v16 + 2 * v13, enum case for Calendar.Component.day(_:), v1);
  v17(v16 + 3 * v13, enum case for Calendar.Component.hour(_:), v1);
  v17(v16 + 4 * v13, enum case for Calendar.Component.minute(_:), v1);
  v17(v16 + 5 * v13, enum case for Calendar.Component.second(_:), v1);
  uint64_t v18 = v13;
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v17)(v16 + 6 * v13, enum case for Calendar.Component.nanosecond(_:), v1);
  unint64_t v20 = 0;
  int64_t v29 = &_swiftEmptySetSingleton;
  uint64_t v21 = (void (**)(char *, unint64_t, uint64_t))(v2 + 16);
  uint64_t v22 = (void (**)(char *, uint64_t))(v2 + 8);
  while (v20 < *(void *)(v28 + 16))
  {
    unint64_t v23 = *v21;
    (*v21)(v12, v16, v1);
    unint64_t v24 = (char *)v27[0];
    v23((char *)v27[0], (unint64_t)v12, v1);
    sub_100021FD0((uint64_t)v9, v24);
    char v25 = *v22;
    (*v22)(v9, v1);
    LOBYTE(v23) = static Calendar.Component.== infix(_:_:)();
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v25)(v12, v1);
    if ((v23 & 1) == 0)
    {
      v16 += v18;
      if (v20++ != 6) {
        continue;
      }
    }
    swift_bridgeObjectRelease();
    return (uint64_t)v29;
  }
  __break(1u);
  return result;
}

id sub_1000246F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_1000034A8(&qword_10003A548);
  __chkstk_darwin(v3 - 8, v4);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  unint64_t v26 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Calendar();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11, v13);
  uint64_t v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = type metadata accessor for DateComponents();
  uint64_t v16 = *(void *)(v27 - 8);
  __chkstk_darwin(v27, v17);
  unint64_t v19 = (char *)&v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Calendar.current.getter();
  sub_1000243CC(a2);
  Calendar.dateComponents(_:from:)();
  swift_bridgeObjectRelease();
  unint64_t v20 = *(void (**)(char *, uint64_t))(v12 + 8);
  v20(v15, v11);
  static Calendar.current.getter();
  Calendar.date(from:)();
  v20(v15, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v27);
    sub_100024A44((uint64_t)v6);
    return 0;
  }
  else
  {
    uint64_t v22 = v26;
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v26, v6, v7);
    unint64_t v23 = self;
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    id v21 = [v23 serverTimeFromDate:isa];

    (*(void (**)(char *, uint64_t))(v8 + 8))(v22, v7);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v27);
  }
  return v21;
}

uint64_t sub_100024A44(uint64_t a1)
{
  uint64_t v2 = sub_1000034A8(&qword_10003A548);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100024AA4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Calendar.Component();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_100024AE8(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v9 = &_swiftEmptyArrayStorage;
    sub_10001316C(0, v1, 0);
    uint64_t v2 = &_swiftEmptyArrayStorage;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10001316C(0, v2[2] + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_10001316C(v5 > 1, v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      v2[2] = v6 + 1;
      sub_10000D38C(&v8, &v2[4 * v6 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_100024C10(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  uint64_t v12 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_10001316C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      uint64_t v5 = 0;
      uint64_t v3 = v12;
      do
      {
        specialized _ArrayBuffer._getElementSlowPath(_:)();
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10001316C(0, v3[2] + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_10001316C(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v12;
        }
        ++v5;
        v3[2] = v7 + 1;
        sub_10000D38C(v11, &v3[4 * v7 + 4]);
      }
      while (v2 != v5);
    }
    else
    {
      unint64_t v8 = a1 + 32;
      uint64_t v3 = v12;
      do
      {
        swift_unknownObjectRetain();
        swift_dynamicCast();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_10001316C(0, v3[2] + 1, 1);
          uint64_t v3 = v12;
        }
        unint64_t v10 = v3[2];
        unint64_t v9 = v3[3];
        if (v10 >= v9 >> 1)
        {
          sub_10001316C(v9 > 1, v10 + 1, 1);
          uint64_t v3 = v12;
        }
        v3[2] = v10 + 1;
        sub_10000D38C(v11, &v3[4 * v10 + 4]);
        v8 += 8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_100024E48(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return _swift_task_switch(sub_100024E6C, 0, 0);
}

uint64_t sub_100024E6C()
{
  uint64_t v1 = v0 + 16;
  uint64_t v2 = *(void *)(v0 + 24);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 48) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 32);
  *(void *)(v3 + 32) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v4;
  uint64_t v5 = sub_1000034A8(&qword_10003A610);
  *uint64_t v4 = v0;
  v4[1] = sub_100024FA0;
  v4[3] = v0 + 16;
  v4[4] = v5;
  unint64_t v8 = (uint64_t (*)(uint64_t))((char *)&dword_10003A608 + dword_10003A608);
  unint64_t v6 = (void *)swift_task_alloc();
  v4[5] = v6;
  *unint64_t v6 = v4;
  v6[1] = sub_1000258E0;
  return v8(v1);
}

uint64_t sub_100024FA0()
{
  *(void *)(*(void *)v1 + 64) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_1000250D8;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_1000250BC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000250BC()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(void *)(v0 + 16));
}

uint64_t sub_1000250D8()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10002513C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_1000251DC;
  return sub_10002534C(a3);
}

uint64_t sub_1000251DC(uint64_t a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(void *)(v4 + 32) = a1;
    return _swift_task_switch(sub_100025328, 0, 0);
  }
}

uint64_t sub_100025328()
{
  **(void **)(v0 + 16) = *(void *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002534C(uint64_t a1)
{
  v2[20] = a1;
  v2[21] = v1;
  uint64_t v3 = sub_1000034A8(&qword_10003A620);
  v2[22] = v3;
  v2[23] = *(void *)(v3 - 8);
  unsigned char v2[24] = swift_task_alloc();
  return _swift_task_switch(sub_100025410, 0, 0);
}

uint64_t sub_100025410()
{
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 176);
  id v4 = [*(id *)(v0 + 168) arrayForKey:*(void *)(v0 + 160)];
  *(void *)(v0 + 200) = v4;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 144;
  *(void *)(v0 + 24) = sub_1000255C8;
  swift_continuation_init();
  *(void *)(v0 + 136) = v3;
  uint64_t v5 = sub_10000D090((uint64_t *)(v0 + 112));
  sub_1000034A8(&qword_10003A628);
  sub_1000034A8(&qword_10003A390);
  CheckedContinuation.init(continuation:function:)();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v2 + 32))(v5, v1, v3);
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 1107296256;
  *(void *)(v0 + 96) = sub_100026F00;
  *(void *)(v0 + 104) = &unk_100036168;
  [v4 valueWithCompletion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_1000255C8()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_100025784;
  }
  else {
    uint64_t v2 = sub_1000256D8;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000256D8()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = (void *)v0[18];
  unint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v4 = sub_100024C10(v3);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(uint64_t))v0[1];
  return v5(v4);
}

uint64_t sub_100025784()
{
  uint64_t v1 = *(void **)(v0 + 200);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100025800(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a1;
  v5[4] = a5;
  uint64_t v9 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v7 = (void *)swift_task_alloc();
  v5[5] = v7;
  *uint64_t v7 = v5;
  v7[1] = sub_1000258E0;
  return v9(a1);
}

uint64_t sub_1000258E0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_100025A14, 0, 0);
  }
  else
  {
    unint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_100025A14()
{
  type metadata accessor for Code(0);
  v0[2] = 204;
  swift_errorRetain();
  sub_1000260D0();
  char v1 = static _ErrorCodeProtocol.~= infix(_:_:)();
  swift_errorRelease();
  if (v1)
  {
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)(v0[4] - 8) + 56))(v0[3], 1, 1);
    swift_errorRelease();
  }
  else
  {
    swift_willThrow();
  }
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

uint64_t sub_100025B18(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return _swift_task_switch(sub_100025B3C, 0, 0);
}

uint64_t sub_100025B3C()
{
  uint64_t v1 = v0 + 64;
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 40) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 24);
  *(void *)(v3 + 32) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 48) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100025C6C;
  v4[3] = v0 + 64;
  v4[4] = &type metadata for Bool;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)&dword_10003A590 + dword_10003A590);
  uint64_t v5 = (void *)swift_task_alloc();
  v4[5] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000258E0;
  return v7(v1);
}

uint64_t sub_100025C6C()
{
  *(void *)(*(void *)v1 + 56) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100025DA4;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_100025D88;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100025D88()
{
  return (*(uint64_t (**)(void))(v0 + 8))(*(unsigned __int8 *)(v0 + 64));
}

uint64_t sub_100025DA4()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100025E08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_100025EA8;
  return sub_100026128(a3);
}

uint64_t sub_100025EA8(char a1)
{
  uint64_t v4 = *v2;
  uint64_t v5 = *v2;
  swift_task_dealloc();
  if (v1)
  {
    unint64_t v6 = *(uint64_t (**)(void))(v5 + 8);
    return v6();
  }
  else
  {
    *(unsigned char *)(v4 + 32) = a1 & 1;
    return _swift_task_switch(sub_100025FF8, 0, 0);
  }
}

uint64_t sub_100025FF8()
{
  **(unsigned char **)(v0 + 16) = *(unsigned char *)(v0 + 32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10002601C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *unint64_t v6 = v2;
  v6[1] = sub_100016978;
  return sub_100025E08(a1, v4, v5);
}

unint64_t sub_1000260D0()
{
  unint64_t result = qword_10003A5A0;
  if (!qword_10003A5A0)
  {
    type metadata accessor for Code(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_10003A5A0);
  }
  return result;
}

uint64_t sub_100026128(uint64_t a1)
{
  v2[20] = a1;
  v2[21] = v1;
  uint64_t v3 = sub_1000034A8(&qword_10003A5B0);
  v2[22] = v3;
  v2[23] = *(void *)(v3 - 8);
  unsigned char v2[24] = swift_task_alloc();
  return _swift_task_switch(sub_1000261EC, 0, 0);
}

uint64_t sub_1000261EC()
{
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 176);
  id v4 = [*(id *)(v0 + 168) BOOLForKey:*(void *)(v0 + 160)];
  *(void *)(v0 + 200) = v4;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 144;
  *(void *)(v0 + 24) = sub_1000263A4;
  swift_continuation_init();
  *(void *)(v0 + 136) = v3;
  uint64_t v5 = sub_10000D090((uint64_t *)(v0 + 112));
  sub_1000034A8((uint64_t *)&unk_10003A5B8);
  sub_1000034A8(&qword_10003A390);
  CheckedContinuation.init(continuation:function:)();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v2 + 32))(v5, v1, v3);
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 1107296256;
  *(void *)(v0 + 96) = sub_100026F0C;
  *(void *)(v0 + 104) = &unk_100036118;
  [v4 valueWithCompletion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_1000263A4()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_100026548;
  }
  else {
    uint64_t v2 = sub_1000264B4;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000264B4()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = (void *)v0[18];
  id v3 = [v2 BOOLValue];

  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(id))v0[1];
  return v4(v3);
}

uint64_t sub_100026548()
{
  uint64_t v1 = *(void **)(v0 + 200);
  swift_willThrow();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2(0);
}

uint64_t sub_1000265C8(uint64_t a1, uint64_t a2)
{
  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  return _swift_task_switch(sub_1000265EC, 0, 0);
}

uint64_t sub_1000265EC()
{
  uint64_t v1 = v0 + 16;
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = swift_task_alloc();
  *(void *)(v0 + 56) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 40);
  *(void *)(v3 + 32) = v2;
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v0 + 64) = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_10002671C;
  v4[3] = v0 + 16;
  v4[4] = &type metadata for String;
  uint64_t v7 = (uint64_t (*)(uint64_t))((char *)&dword_10003A5D8 + dword_10003A5D8);
  uint64_t v5 = (void *)swift_task_alloc();
  v4[5] = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_1000258E0;
  return v7(v1);
}

uint64_t sub_10002671C()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_100026854;
  }
  else
  {
    swift_task_dealloc();
    uint64_t v2 = sub_100026838;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100026838()
{
  return (*(uint64_t (**)(void, void))(v0 + 8))(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_100026854()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000268B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 16) = a1;
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v3 + 24) = v5;
  *uint64_t v5 = v3;
  v5[1] = sub_100026958;
  return sub_100026AD8(a3);
}

uint64_t sub_100026958(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  uint64_t v7 = *v3;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v8 = *(uint64_t (**)(void))(v7 + 8);
    return v8();
  }
  else
  {
    *(void *)(v6 + 32) = a2;
    *(void *)(v6 + 40) = a1;
    return _swift_task_switch(sub_100026AB4, 0, 0);
  }
}

uint64_t sub_100026AB4()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void **)(v0 + 16);
  *uint64_t v2 = *(void *)(v0 + 40);
  v2[1] = v1;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100026AD8(uint64_t a1)
{
  v2[20] = a1;
  v2[21] = v1;
  uint64_t v3 = sub_1000034A8(&qword_10003A5E8);
  v2[22] = v3;
  v2[23] = *(void *)(v3 - 8);
  unsigned char v2[24] = swift_task_alloc();
  return _swift_task_switch(sub_100026B9C, 0, 0);
}

uint64_t sub_100026B9C()
{
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v1 = *(void *)(v0 + 192);
  uint64_t v3 = *(void *)(v0 + 176);
  id v4 = [*(id *)(v0 + 168) stringForKey:*(void *)(v0 + 160)];
  *(void *)(v0 + 200) = v4;
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v0 + 144;
  *(void *)(v0 + 24) = sub_100026D54;
  swift_continuation_init();
  *(void *)(v0 + 136) = v3;
  uint64_t v5 = sub_10000D090((uint64_t *)(v0 + 112));
  sub_1000034A8(&qword_10003A5F0);
  sub_1000034A8(&qword_10003A390);
  CheckedContinuation.init(continuation:function:)();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v2 + 32))(v5, v1, v3);
  *(void *)(v0 + 80) = _NSConcreteStackBlock;
  *(void *)(v0 + 88) = 1107296256;
  *(void *)(v0 + 96) = sub_100026FE4;
  *(void *)(v0 + 104) = &unk_100036140;
  [v4 valueWithCompletion:v0 + 80];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_100026D54()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 208) = v1;
  if (v1) {
    uint64_t v2 = sub_100025784;
  }
  else {
    uint64_t v2 = sub_100026E64;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100026E64()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v2 = (void *)v0[18];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v6(v3, v5);
}

void sub_100026F00(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
}

void sub_100026F0C(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
}

uint64_t sub_100026F18(uint64_t a1, uint64_t a2)
{
  return sub_10000D330(a2 + 32, a1 + 32);
}

uint64_t sub_100026F28(uint64_t a1)
{
  return sub_10000D120(a1 + 32);
}

uint64_t sub_100026F30(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100020B88;
  return sub_1000268B8(a1, v4, v5);
}

void sub_100026FE4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
}

void sub_100026FF0(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t *a5)
{
  sub_10000D170((void *)(a1 + 32), *(void *)(a1 + 56));
  if (a4)
  {
    id v8 = a4;
    sub_1000034A8(a5);
    CheckedContinuation.resume(throwing:)();
  }
  else if (a2)
  {
    id v9 = a2;
    sub_1000034A8(a5);
    CheckedContinuation.resume(returning:)();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000270A0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 24);
  uint64_t v5 = *(void *)(v1 + 32);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v6;
  *uint64_t v6 = v2;
  v6[1] = sub_100020B88;
  return sub_10002513C(a1, v4, v5);
}

void main()()
{
  sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v4 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = 0;
  *(void *)(v3 + 24) = 0;
  sub_100029700((uint64_t)v1, (uint64_t)&unk_10003A638, v3);
  swift_release();
  dispatch_main();
}

uint64_t sub_10002723C()
{
  uint64_t v1 = type metadata accessor for CancellationError();
  v0[4] = v1;
  v0[5] = *(void *)(v1 - 8);
  v0[6] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for Logger();
  v0[7] = v2;
  v0[8] = *(void *)(v2 - 8);
  v0[9] = swift_task_alloc();
  v0[10] = swift_task_alloc();
  v0[11] = swift_task_alloc();
  v0[12] = swift_task_alloc();
  v0[13] = swift_task_alloc();
  v0[14] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for URL();
  v0[15] = v3;
  v0[16] = *(void *)(v3 - 8);
  v0[17] = swift_task_alloc();
  v0[18] = swift_task_alloc();
  return _swift_task_switch(sub_100027400, 0, 0);
}

uint64_t sub_100027400()
{
  if (isAppInstallationMetricsEnabled()())
  {
    sub_100002080(v0[18]);
    uint64_t v1 = self;
    NSString v2 = String._bridgeToObjectiveC()();
    NSString v3 = String._bridgeToObjectiveC()();
    id v4 = [v1 bagForProfile:v2 profileVersion:v3];

    sub_1000034A8(&qword_10003A648);
    uint64_t v5 = (void *)swift_allocObject();
    v0[19] = sub_100029964(v4, v5);
    uint64_t KeyPath = swift_getKeyPath();
    v0[20] = KeyPath;
    uint64_t v34 = (uint64_t (*)(uint64_t))((char *)&dword_10003A380 + dword_10003A380);
    uint64_t v7 = (void *)swift_task_alloc();
    v0[21] = v7;
    *uint64_t v7 = v0;
    v7[1] = sub_1000279D4;
    return v34(KeyPath);
  }
  else
  {
    static Logger.daemon.getter();
    id v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Feature flag is not enabled", v11, 2u);
      swift_slowDealloc();
    }
    uint64_t v12 = v0[11];
    uint64_t v13 = v0[7];
    uint64_t v14 = v0[8];

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    sub_10002990C();
    uint64_t v15 = swift_allocError();
    CancellationError.init()();
    swift_willThrow();
    v0[2] = v15;
    swift_errorRetain();
    sub_1000034A8(&qword_10003A390);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      static Logger.daemon.getter();
      uint64_t v16 = Logger.logObject.getter();
      os_log_type_t v17 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v16, v17))
      {
        uint64_t v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "Exiting daemon due to cancellation", v18, 2u);
        swift_slowDealloc();
      }
      uint64_t v19 = v0[10];
      uint64_t v20 = v0[7];
      uint64_t v21 = v0[8];
      uint64_t v23 = v0[5];
      uint64_t v22 = v0[6];
      uint64_t v24 = v0[4];

      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v19, v20);
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
      swift_errorRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      char v25 = (uint64_t (*)(void))v0[1];
    }
    else
    {
      swift_errorRelease();
      static Logger.daemon.getter();
      swift_errorRetain();
      swift_errorRetain();
      unint64_t v26 = Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = (uint8_t *)swift_slowAlloc();
        uint64_t v35 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = 138412290;
        swift_errorRetain();
        uint64_t v29 = _swift_stdlib_bridgeErrorToNSError();
        v0[3] = v29;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v35 = v29;
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "Unexpected top-level error: %@", v28, 0xCu);
        sub_1000034A8(&qword_10003A3A0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }
      char v30 = v26;
      uint64_t v31 = v0[9];
      uint64_t v32 = v0[7];
      uint64_t v33 = v0[8];

      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v31, v32);
      swift_willThrow();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      char v25 = (uint64_t (*)(void))v0[1];
    }
    return v25();
  }
}

uint64_t sub_1000279D4(char a1)
{
  *(unsigned char *)(*(void *)v1 + 220) = a1;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_100027AF4, 0, 0);
}

uint64_t sub_100027AF4()
{
  static Logger.daemon.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = *(unsigned __int8 *)(v0 + 220);
    id v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v4 = 67109120;
    *(_DWORD *)(v0 + 216) = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Daemon launch; Bag enabled: %{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }

  int v5 = *(unsigned __int8 *)(v0 + 220);
  uint64_t v6 = *(void *)(v0 + 112);
  uint64_t v7 = *(void *)(v0 + 56);
  uint64_t v8 = *(void *)(v0 + 64);
  id v9 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  *(void *)(v0 + 176) = v9;
  *(void *)(v0 + 184) = (v8 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v9(v6, v7);
  if (v5 == 1)
  {
    uint64_t v10 = *(void *)(v0 + 152);
    uint64_t v11 = *(void *)(v0 + 136);
    (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 128) + 16))(v11, *(void *)(v0 + 144), *(void *)(v0 + 120));
    type metadata accessor for Dependencies();
    swift_allocObject();
    swift_retain();
    uint64_t v12 = sub_100001D94(v11, v10);
    *(void *)(v0 + 192) = v12;
    sub_1000034A8(&qword_10003A650);
    uint64_t v13 = swift_task_alloc();
    *(void *)(v0 + 200) = v13;
    *(void *)(v13 + 16) = v12;
    *(void *)(v13 + 24) = v10;
    uint64_t v14 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v14;
    *uint64_t v14 = v0;
    v14[1] = sub_1000281A4;
    return withThrowingTaskGroup<A, B>(of:returning:isolation:body:)();
  }
  else
  {
    static Logger.daemon.getter();
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      os_log_type_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Daemon is disabled; canceling launch", v17, 2u);
      swift_slowDealloc();
    }
    uint64_t v18 = *(void *)(v0 + 128);
    uint64_t v41 = *(void *)(v0 + 120);
    uint64_t v42 = *(void *)(v0 + 144);
    uint64_t v19 = *(void *)(v0 + 96);
    uint64_t v20 = *(void *)(v0 + 56);

    v9(v19, v20);
    sub_10002990C();
    uint64_t v21 = swift_allocError();
    CancellationError.init()();
    swift_willThrow();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v42, v41);
    *(void *)(v0 + 16) = v21;
    swift_errorRetain();
    sub_1000034A8(&qword_10003A390);
    if (swift_dynamicCast())
    {
      swift_errorRelease();
      static Logger.daemon.getter();
      uint64_t v22 = Logger.logObject.getter();
      os_log_type_t v23 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v22, v23))
      {
        uint64_t v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "Exiting daemon due to cancellation", v24, 2u);
        swift_slowDealloc();
      }
      uint64_t v25 = *(void *)(v0 + 80);
      uint64_t v26 = *(void *)(v0 + 56);
      uint64_t v27 = *(void *)(v0 + 64);
      uint64_t v29 = *(void *)(v0 + 40);
      uint64_t v28 = *(void *)(v0 + 48);
      uint64_t v30 = *(void *)(v0 + 32);

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      swift_errorRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
    }
    else
    {
      swift_errorRelease();
      static Logger.daemon.getter();
      swift_errorRetain();
      swift_errorRetain();
      uint64_t v32 = Logger.logObject.getter();
      os_log_type_t v33 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v32, v33))
      {
        os_log_t log = v32;
        uint64_t v34 = (uint8_t *)swift_slowAlloc();
        uint64_t v35 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v34 = 138412290;
        swift_errorRetain();
        uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
        *(void *)(v0 + 24) = v36;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v35 = v36;
        swift_errorRelease();
        swift_errorRelease();
        uint64_t v32 = log;
        _os_log_impl((void *)&_mh_execute_header, log, v33, "Unexpected top-level error: %@", v34, 0xCu);
        sub_1000034A8(&qword_10003A3A0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_errorRelease();
        swift_errorRelease();
      }
      uint64_t v37 = *(void *)(v0 + 72);
      uint64_t v38 = *(void *)(v0 + 56);
      uint64_t v39 = *(void *)(v0 + 64);

      (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v37, v38);
      swift_willThrow();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v31 = *(uint64_t (**)(void))(v0 + 8);
    }
    return v31();
  }
}

uint64_t sub_1000281A4()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return _swift_task_switch(sub_1000282BC, 0, 0);
}

uint64_t sub_1000282BC()
{
  static Logger.daemon.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v1, v2))
  {
    int v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Unexpectedly exiting daemon due to completing all tasks", v3, 2u);
    swift_slowDealloc();
  }
  id v4 = (void (*)(uint64_t, uint64_t))v0[22];
  uint64_t v5 = v0[18];
  uint64_t v6 = v0[15];
  uint64_t v7 = v0[16];
  uint64_t v8 = v0[13];
  uint64_t v9 = v0[7];
  swift_release();
  swift_release();

  v4(v8, v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_100028450()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100028488()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100016978;
  return sub_10002723C();
}

uint64_t sub_100028534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a2;
  sub_1000034A8(&qword_10003A1F8);
  v4[5] = swift_task_alloc();
  return _swift_task_switch(sub_1000285CC, 0, 0);
}

uint64_t sub_1000285CC()
{
  uint64_t v2 = v0[4];
  uint64_t v1 = v0[5];
  uint64_t v3 = v0[3];
  uint64_t v4 = type metadata accessor for TaskPriority();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v1, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v3;
  v6[5] = v2;
  swift_retain();
  swift_retain();
  sub_100028AC4(v1, (uint64_t)&unk_10003A670, (uint64_t)v6);
  sub_10000D2D4(v1, &qword_10003A1F8);
  v5(v1, 1, 1, v4);
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v3;
  v7[5] = v2;
  swift_retain();
  swift_retain();
  sub_1000294FC(v1, (uint64_t)&unk_10003A680, (uint64_t)v7);
  sub_10000D2D4(v1, &qword_10003A1F8);
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100028770(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  v5[3] = a1;
  uint64_t v6 = type metadata accessor for Logger();
  v5[6] = v6;
  v5[7] = *(void *)(v6 - 8);
  v5[8] = swift_task_alloc();
  return _swift_task_switch(sub_100028834, 0, 0);
}

uint64_t sub_100028834()
{
  uint64_t v1 = *(void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 40);
  id v3 = [self sharedScheduler];
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR____TtC28AppInstallationMetricsDaemon12Dependencies_eventManager);
  type metadata accessor for DailyWakeupTask();
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = v3;
  v5[3] = v4;
  v5[4] = v2;
  swift_retain();
  swift_retain();
  sub_1000159A4();
  sub_100015D04();
  swift_release();
  **(unsigned char **)(v0 + 24) = 1;
  swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

uint64_t sub_100028AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100016ACC(a1, (uint64_t)v10);
  uint64_t v11 = type metadata accessor for TaskPriority();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_10000D2D4((uint64_t)v10, &qword_10003A1F8);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v13 = 0;
  uint64_t v15 = 0;
LABEL_6:
  uint64_t v16 = *v4;
  sub_1000034A8(&qword_10003A650);
  os_log_type_t v17 = (void *)(v15 | v13);
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    os_log_type_t v17 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  v19[1] = 1;
  v19[2] = v17;
  v19[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_100028CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[4] = a1;
  uint64_t v6 = sub_1000034A8(&qword_10003A688);
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  uint64_t v7 = sub_1000034A8(&qword_10003A690);
  v5[10] = v7;
  v5[11] = *(void *)(v7 - 8);
  v5[12] = swift_task_alloc();
  uint64_t v8 = sub_1000034A8(&qword_10003A698);
  v5[13] = v8;
  v5[14] = *(void *)(v8 - 8);
  v5[15] = swift_task_alloc();
  sub_1000034A8(&qword_10003A350);
  v5[16] = swift_task_alloc();
  return _swift_task_switch(sub_100028E58, 0, 0);
}

uint64_t sub_100028E58()
{
  uint64_t v1 = v0;
  uint64_t v2 = v0[16];
  uint64_t v3 = v0[12];
  uint64_t v14 = v0 + 18;
  uint64_t v5 = v0[10];
  uint64_t v4 = v0[11];
  uint64_t v8 = v0 + 5;
  uint64_t v6 = v0[5];
  uint64_t v7 = v8[1];
  uint64_t v9 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v2, 1, 1, v9);
  swift_retain();
  swift_retain();
  v1[2] = sub_100014300("Starting XPC listener", 21, 2, 1, 1, v2, (void *)&_mh_execute_header, v6, v7);
  v1[3] = v10;
  swift_release();
  swift_release();
  sub_10000D2D4(v2, &qword_10003A350);
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v3, enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:), v5);
  AsyncStream.init(_:bufferingPolicy:_:)();
  AsyncStream.makeAsyncIterator()();
  uint64_t v11 = (void *)swift_task_alloc();
  v1[17] = v11;
  *uint64_t v11 = v1;
  v11[1] = sub_100029048;
  uint64_t v12 = v1[7];
  return AsyncStream.Iterator.next(isolation:)(v14, 0, 0, v12);
}

uint64_t sub_100029048()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100029144, 0, 0);
}

uint64_t sub_100029144()
{
  if (*(unsigned char *)(v0 + 144))
  {
    uint64_t v1 = *(void **)(v0 + 16);
    uint64_t v2 = *(void **)(v0 + 24);
    uint64_t v3 = *(void *)(v0 + 120);
    uint64_t v4 = *(void *)(v0 + 104);
    uint64_t v5 = *(void *)(v0 + 112);
    uint64_t v6 = *(unsigned char **)(v0 + 32);
    (*(void (**)(void, void))(*(void *)(v0 + 64) + 8))(*(void *)(v0 + 72), *(void *)(v0 + 56));
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    *uint64_t v6 = 1;

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
    return v7();
  }
  else
  {
    uint64_t v9 = (void *)swift_task_alloc();
    *(void *)(v0 + 136) = v9;
    void *v9 = v0;
    v9[1] = sub_100029048;
    uint64_t v10 = *(void *)(v0 + 56);
    return AsyncStream.Iterator.next(isolation:)(v0 + 144, 0, 0, v10);
  }
}

uint64_t sub_1000292D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = (objc_class *)type metadata accessor for ServiceListenerDelegate();
  uint64_t v12 = (char *)objc_allocWithZone(v11);
  *(void *)&v12[OBJC_IVAR____TtC28AppInstallationMetricsDaemon23ServiceListenerDelegate_dependencies] = a1;
  *(void *)&v12[OBJC_IVAR____TtC28AppInstallationMetricsDaemon23ServiceListenerDelegate_bag] = a2;
  v21.receiver = v12;
  v21.super_class = v11;
  swift_retain();
  swift_retain();
  id v13 = objc_msgSendSuper2(&v21, "init");
  ServiceMachName.getter();
  id v14 = objc_allocWithZone((Class)NSXPCListener);
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v16 = [v14 initWithMachServiceName:v15];

  [v16 setDelegate:v13];
  [v16 activate];
  static Logger.daemon.getter();
  os_log_type_t v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "XPC listener activated", v19, 2u);
    swift_slowDealloc();
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  *a3 = v16;
  a3[1] = v13;
  return result;
}

uint64_t sub_1000294FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v7 = sub_1000034A8(&qword_10003A1F8);
  __chkstk_darwin(v7 - 8, v8);
  uint64_t v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v11 = swift_taskGroup_addPending();
  if ((v11 & 1) == 0) {
    goto LABEL_11;
  }
  sub_100016ACC(a1, (uint64_t)v10);
  uint64_t v12 = type metadata accessor for TaskPriority();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    if (*(void *)(a3 + 16)) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    goto LABEL_8;
  }
  sub_10000D2D4((uint64_t)v10, &qword_10003A1F8);
  if (!*(void *)(a3 + 16)) {
    goto LABEL_7;
  }
LABEL_4:
  swift_getObjectType();
  swift_unknownObjectRetain();
  uint64_t v14 = dispatch thunk of Actor.unownedExecutor.getter();
  uint64_t v16 = v15;
  swift_unknownObjectRelease();
LABEL_8:
  uint64_t v17 = *v4;
  sub_1000034A8(&qword_10003A650);
  os_log_type_t v18 = (void *)(v16 | v14);
  if (v16 | v14)
  {
    v21[0] = 0;
    v21[1] = 0;
    os_log_type_t v18 = v21;
    v21[2] = v14;
    v21[3] = v16;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v17;
  swift_task_create();
LABEL_11:
  swift_release();
  return v11 & 1;
}

uint64_t sub_100029700(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000D2D4(a1, &qword_10003A1F8);
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

uint64_t sub_100029888(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

unint64_t sub_10002990C()
{
  unint64_t result = qword_10003A640;
  if (!qword_10003A640)
  {
    type metadata accessor for CancellationError();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A640);
  }
  return result;
}

void *sub_100029964(void *a1, void *a2)
{
  a2[2] = a1;
  a2[3] = &off_100036230;
  id v3 = a1;
  unint64_t v4 = sub_1000147A0((uint64_t)&_swiftEmptyArrayStorage);
  sub_1000034A8(qword_10003A6A0);
  uint64_t v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(void *)(v5 + 16) = v4;
  a2[4] = v5;
  sub_100013488();
  uint64_t v13 = 0;
  swift_retain_n();
  id v6 = v3;
  os_unfair_lock_lock((os_unfair_lock_t)(v5 + 24));
  swift_bridgeObjectRelease();
  swift_retain();
  Class isa = Set._bridgeToObjectiveC()().super.isa;
  v12[4] = sub_100029E28;
  v12[5] = v5;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_100029888;
  uint64_t v12[3] = &unk_100036208;
  uint64_t v8 = _Block_copy(v12);
  swift_retain();
  id v9 = [v6 cachedValuesForKeys:isa observationToken:&v13 updateHandler:v8];
  _Block_release(v8);

  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_release();
  swift_release();
  *(void *)(v5 + 16) = v10;
  os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 24));
  swift_release_n();
  swift_bridgeObjectRelease();

  a2[5] = v13;
  return a2;
}

uint64_t sub_100029BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(v2 + 16);
  uint64_t v6 = *(void *)(v2 + 24);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v8;
  *uint64_t v8 = v3;
  v8[1] = sub_100020B88;
  return sub_100028534(a1, a2, v7, v6);
}

uint64_t sub_100029C5C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100020B88;
  return sub_100028770(a1, v4, v5, v7, v6);
}

uint64_t sub_100029D20()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100029D68(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100020B88;
  return sub_100028CA0(a1, v4, v5, v7, v6);
}

void sub_100029E28(uint64_t a1)
{
  sub_100029E48(a1, v1);
}

uint64_t sub_100029E30(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100029E40()
{
  return swift_release();
}

void sub_100029E48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a2 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 24));
  swift_bridgeObjectRelease();
  *(void *)(a2 + 16) = a1;
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v4);
}

uint64_t sub_100029EA8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(void, uint64_t, uint64_t))(v1 + 16))(*(void *)(v0 + 40), ObjectType, v1);
  swift_unknownObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_100029F14()
{
  sub_100029EA8();
  return swift_deallocClassInstance();
}

id sub_100029F48(uint64_t a1)
{
  return [v1 removeObserverWithToken:a1];
}

uint64_t sub_100029F60()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Bag()
{
  return sub_100029FD8();
}

uint64_t sub_100029FD8()
{
  return swift_getGenericMetadata();
}

uint64_t sub_10002A008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

uint64_t sub_10002A010()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_10002A0AC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(_DWORD *)(v5 + 80);
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v6 + 16) & (unint64_t)~v6) + *(void *)(v5 + 64) > 0x18)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v10 = a2[1];
    *a1 = *a2;
    a1[1] = v10;
    uint64_t v11 = ((unint64_t)a1 + v6 + 16) & ~v6;
    uint64_t v12 = ((unint64_t)a2 + v6 + 16) & ~v6;
    uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v13(v11, v12, v4);
  }
  return a1;
}

uint64_t sub_10002A1B4(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = *(uint64_t (**)(unint64_t))(v4 + 8);
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  return v5(v6);
}

void *sub_10002A228(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  uint64_t v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  swift_bridgeObjectRetain();
  v6(v8, v9, v5);
  return a1;
}

void *sub_10002A2B8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

_OWORD *sub_10002A350(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void *sub_10002A3C0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v7 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  return a1;
}

uint64_t sub_10002A448(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  unsigned int v5 = *(_DWORD *)(v4 + 84);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  if (v5 <= 0x7FFFFFFF) {
    unsigned int v7 = 0x7FFFFFFF;
  }
  else {
    unsigned int v7 = *(_DWORD *)(v4 + 84);
  }
  if (!a2) {
    return 0;
  }
  int v8 = a2 - v7;
  if (a2 <= v7) {
    goto LABEL_23;
  }
  uint64_t v9 = ((v6 + 16) & ~v6) + *(void *)(*(void *)(*(void *)(a3 + 16) - 8) + 64);
  char v10 = 8 * v9;
  if (v9 <= 3)
  {
    unsigned int v13 = ((v8 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v13))
    {
      int v11 = *(_DWORD *)((char *)a1 + v9);
      if (!v11) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 > 0xFF)
    {
      int v11 = *(unsigned __int16 *)((char *)a1 + v9);
      if (!*(unsigned __int16 *)((char *)a1 + v9)) {
        goto LABEL_23;
      }
      goto LABEL_15;
    }
    if (v13 < 2)
    {
LABEL_23:
      if ((v5 & 0x80000000) != 0) {
        return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)a1 + v6 + 16) & ~v6);
      }
      unint64_t v15 = *((void *)a1 + 1);
      if (v15 >= 0xFFFFFFFF) {
        LODWORD(v15) = -1;
      }
      return (v15 + 1);
    }
  }
  int v11 = *((unsigned __int8 *)a1 + v9);
  if (!*((unsigned char *)a1 + v9)) {
    goto LABEL_23;
  }
LABEL_15:
  int v14 = (v11 - 1) << v10;
  if (v9 > 3) {
    int v14 = 0;
  }
  if (v9)
  {
    if (v9 > 3) {
      LODWORD(v9) = 4;
    }
    switch((int)v9)
    {
      case 2:
        LODWORD(v9) = *a1;
        break;
      case 3:
        LODWORD(v9) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        LODWORD(v9) = *(_DWORD *)a1;
        break;
      default:
        LODWORD(v9) = *(unsigned __int8 *)a1;
        break;
    }
  }
  return v7 + (v9 | v14) + 1;
}

void sub_10002A5E8(char *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(*(void *)(a4 + 16) - 8);
  unsigned int v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF) {
    unsigned int v8 = 0x7FFFFFFF;
  }
  else {
    unsigned int v8 = *(_DWORD *)(v6 + 84);
  }
  uint64_t v9 = *(unsigned __int8 *)(v6 + 80);
  size_t v10 = ((v9 + 16) & ~v9) + *(void *)(*(void *)(*(void *)(a4 + 16) - 8) + 64);
  BOOL v11 = a3 >= v8;
  unsigned int v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v10 <= 3)
    {
      unsigned int v16 = ((v12 + ~(-1 << (8 * v10))) >> (8 * v10)) + 1;
      if (HIWORD(v16))
      {
        int v13 = 4;
      }
      else if (v16 >= 0x100)
      {
        int v13 = 2;
      }
      else
      {
        int v13 = v16 > 1;
      }
    }
    else
    {
      int v13 = 1;
    }
  }
  else
  {
    int v13 = 0;
  }
  if (v8 < a2)
  {
    unsigned int v14 = ~v8 + a2;
    if (v10 < 4)
    {
      int v15 = (v14 >> (8 * v10)) + 1;
      if (v10)
      {
        int v17 = v14 & ~(-1 << (8 * v10));
        bzero(a1, v10);
        if (v10 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if (v10 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v10);
      *(_DWORD *)a1 = v14;
      int v15 = 1;
    }
    switch(v13)
    {
      case 1:
        a1[v10] = v15;
        return;
      case 2:
        *(_WORD *)&a1[v10] = v15;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v10] = v15;
        return;
      default:
        return;
    }
  }
  switch(v13)
  {
    case 1:
      a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v10] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x10002A848);
    case 4:
      *(_DWORD *)&a1[v10] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if ((v7 & 0x80000000) != 0)
        {
          unint64_t v18 = (unint64_t)&a1[v9 + 16] & ~v9;
          uint64_t v19 = *(void (**)(unint64_t))(v6 + 56);
          v19(v18);
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = a2 - 1;
        }
      }
      return;
  }
}

uint64_t type metadata accessor for BagKey()
{
  return sub_100029FD8();
}

uint64_t sub_10002A888(uint64_t a1, uint64_t a2)
{
  return *(void *)(a2 + 24);
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return dispatch thunk of JSONEncoder.encode<A>(_:)();
}

uint64_t JSONEncoder.init()()
{
  return JSONEncoder.init()();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return type metadata accessor for JSONEncoder();
}

uint64_t Measurement.init(value:unit:)()
{
  return Measurement.init(value:unit:)();
}

uint64_t Measurement<>.converted(to:)()
{
  return Measurement<>.converted(to:)();
}

uint64_t Measurement<>.formatted()()
{
  return Measurement<>.formatted()();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

uint64_t URLResourceValues.isExcludedFromBackup.getter()
{
  return URLResourceValues.isExcludedFromBackup.getter();
}

uint64_t URLResourceValues.isExcludedFromBackup.setter()
{
  return URLResourceValues.isExcludedFromBackup.setter();
}

uint64_t URLResourceValues.init()()
{
  return URLResourceValues.init()();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t static _ErrorCodeProtocol.~= infix(_:_:)()
{
  return static _ErrorCodeProtocol.~= infix(_:_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.absoluteString.getter()
{
  return URL.absoluteString.getter();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t URL.setResourceValues(_:)()
{
  return URL.setResourceValues(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.init(fileURLWithFileSystemRepresentation:isDirectory:relativeTo:)()
{
  return URL.init(fileURLWithFileSystemRepresentation:isDirectory:relativeTo:)();
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

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
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

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Calendar.dateComponents(_:from:)()
{
  return Calendar.dateComponents(_:from:)();
}

uint64_t Calendar.date(from:)()
{
  return Calendar.date(from:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t static Calendar.Component.== infix(_:_:)()
{
  return static Calendar.Component.== infix(_:_:)();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

Swift::Bool __swiftcall isAppInstallationMetricsEnabled()()
{
  return isAppInstallationMetricsEnabled()();
}

uint64_t type metadata accessor for AppInstallType()
{
  return type metadata accessor for AppInstallType();
}

uint64_t InstallationEvent.jwtGSToken.getter()
{
  return InstallationEvent.jwtGSToken.getter();
}

uint64_t InstallationEvent.storefront.getter()
{
  return InstallationEvent.storefront.getter();
}

uint64_t InstallationEvent.countryCode.getter()
{
  return InstallationEvent.countryCode.getter();
}

uint64_t InstallationEvent.installType.getter()
{
  return InstallationEvent.installType.getter();
}

uint64_t InstallationEvent.billingStorefront.getter()
{
  return InstallationEvent.billingStorefront.getter();
}

uint64_t InstallationEvent.id.getter()
{
  return InstallationEvent.id.getter();
}

uint64_t InstallationEvent.dsid.getter()
{
  return InstallationEvent.dsid.getter();
}

uint64_t InstallationEvent.evid.getter()
{
  return InstallationEvent.evid.getter();
}

uint64_t InstallationEvent.token.getter()
{
  return InstallationEvent.token.getter();
}

uint64_t InstallationEvent.isBeta.getter()
{
  return InstallationEvent.isBeta.getter();
}

uint64_t InstallationEvent.itemID.getter()
{
  return InstallationEvent.itemID.getter();
}

uint64_t InstallationEvent.source.getter()
{
  return InstallationEvent.source.getter();
}

uint64_t InstallationEvent.init(altDsid:dsid:billingStorefront:bundleID:clientID:countryCode:eventVersion:evid:installDate:installType:isBeta:itemID:osVersion:platform:source:storefront:token:webDomain:postTargetDate:gsToken:jwtGSToken:)()
{
  return InstallationEvent.init(altDsid:dsid:billingStorefront:bundleID:clientID:countryCode:eventVersion:evid:installDate:installType:isBeta:itemID:osVersion:platform:source:storefront:token:webDomain:postTargetDate:gsToken:jwtGSToken:)();
}

uint64_t InstallationEvent.altDsid.getter()
{
  return InstallationEvent.altDsid.getter();
}

uint64_t InstallationEvent.gsToken.getter()
{
  return InstallationEvent.gsToken.getter();
}

uint64_t InstallationEvent.bundleID.getter()
{
  return InstallationEvent.bundleID.getter();
}

uint64_t InstallationEvent.clientID.getter()
{
  return InstallationEvent.clientID.getter();
}

uint64_t InstallationEvent.platform.getter()
{
  return InstallationEvent.platform.getter();
}

uint64_t InstallationEvent.osVersion.getter()
{
  return InstallationEvent.osVersion.getter();
}

uint64_t InstallationEvent.webDomain.getter()
{
  return InstallationEvent.webDomain.getter();
}

uint64_t type metadata accessor for InstallationEvent()
{
  return type metadata accessor for InstallationEvent();
}

uint64_t AppInstallationEligibility.storefront.getter()
{
  return AppInstallationEligibility.storefront.getter();
}

uint64_t AppInstallationEligibility.accountIdentifier.getter()
{
  return AppInstallationEligibility.accountIdentifier.getter();
}

uint64_t AppInstallationEligibility.billingStorefront.getter()
{
  return AppInstallationEligibility.billingStorefront.getter();
}

uint64_t AppInstallationEligibility.billingCountryCode.getter()
{
  return AppInstallationEligibility.billingCountryCode.getter();
}

uint64_t AppInstallationEligibility.accountID.getter()
{
  return AppInstallationEligibility.accountID.getter();
}

uint64_t type metadata accessor for AppInstallationEligibility()
{
  return type metadata accessor for AppInstallationEligibility();
}

uint64_t AppInstallationEvent.eligibility.getter()
{
  return AppInstallationEvent.eligibility.getter();
}

uint64_t AppInstallationEvent.installDate.getter()
{
  return AppInstallationEvent.installDate.getter();
}

uint64_t AppInstallationEvent.installType.getter()
{
  return AppInstallationEvent.installType.getter();
}

uint64_t AppInstallationEvent.externalVersionID.getter()
{
  return AppInstallationEvent.externalVersionID.getter();
}

uint64_t AppInstallationEvent.token.getter()
{
  return AppInstallationEvent.token.getter();
}

uint64_t AppInstallationEvent.isBeta.getter()
{
  return AppInstallationEvent.isBeta.getter();
}

uint64_t AppInstallationEvent.itemID.getter()
{
  return AppInstallationEvent.itemID.getter();
}

uint64_t AppInstallationEvent.source.getter()
{
  return AppInstallationEvent.source.getter();
}

uint64_t AppInstallationEvent.bundleID.getter()
{
  return AppInstallationEvent.bundleID.getter();
}

uint64_t AppInstallationEvent.platform.getter()
{
  return AppInstallationEvent.platform.getter();
}

uint64_t AppInstallationEvent.osVersion.getter()
{
  return AppInstallationEvent.osVersion.getter();
}

uint64_t AppInstallationEvent.webDomain.getter()
{
  return AppInstallationEvent.webDomain.getter();
}

uint64_t type metadata accessor for AppInstallationEvent()
{
  return type metadata accessor for AppInstallationEvent();
}

uint64_t type metadata accessor for AppInstallationMetricsError()
{
  return type metadata accessor for AppInstallationMetricsError();
}

uint64_t ServiceMachName.getter()
{
  return ServiceMachName.getter();
}

uint64_t decodeXPCValues<each A, B>(from:)()
{
  return decodeXPCValues<each A, B>(from:)();
}

uint64_t encodeXPCValues<each A>(_:)()
{
  return encodeXPCValues<each A>(_:)();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return OSSignpostID.rawValue.getter();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t OSSignposter.init(logger:)()
{
  return OSSignposter.init(logger:)();
}

uint64_t OSSignposter.logHandle.getter()
{
  return OSSignposter.logHandle.getter();
}

uint64_t type metadata accessor for OSSignposter()
{
  return type metadata accessor for OSSignposter();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return type metadata accessor for OSSignpostError();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return OSSignpostIntervalState.signpostID.getter();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return OSSignpostIntervalState.init(id:isOpen:)();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return type metadata accessor for OSSignpostIntervalState();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return checkForErrorAndConsumeState(state:)();
}

uint64_t static Logger.daemon.getter()
{
  return static Logger.daemon.getter();
}

uint64_t static Logger.events.getter()
{
  return static Logger.events.getter();
}

uint64_t static Logger.general.getter()
{
  return static Logger.general.getter();
}

uint64_t static Logger.metrics.getter()
{
  return static Logger.metrics.getter();
}

uint64_t static Logger.activity.getter()
{
  return static Logger.activity.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t CancellationError.init()()
{
  return CancellationError.init()();
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

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of Hashable.hash(into:)()
{
  return dispatch thunk of Hashable.hash(into:)();
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

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
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

uint64_t String.init<A>(_:radix:uppercase:)()
{
  return String.init<A>(_:radix:uppercase:)();
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

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t CheckedContinuation.init(continuation:function:)()
{
  return CheckedContinuation.init(continuation:function:)();
}

uint64_t CheckedContinuation.resume(throwing:)()
{
  return CheckedContinuation.resume(throwing:)();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t type metadata accessor for CancellationError()
{
  return type metadata accessor for CancellationError();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)Set._bridgeToObjectiveC()();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
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

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t static os_signpost_type_t.end.getter()
{
  return static os_signpost_type_t.end.getter();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return static os_signpost_type_t.begin.getter();
}

uint64_t NSObject.hashValue.getter()
{
  return NSObject.hashValue.getter();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return OS_os_log.signpostsEnabled.getter();
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

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t StaticString.description.getter()
{
  return StaticString.description.getter();
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

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode(_:)()
{
  return dispatch thunk of SingleValueDecodingContainer.decode(_:)();
}

uint64_t dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)()
{
  return dispatch thunk of SingleValueDecodingContainer.decode<A>(_:)();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode(_:)()
{
  return dispatch thunk of SingleValueEncodingContainer.encode(_:)();
}

uint64_t dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)()
{
  return dispatch thunk of SingleValueEncodingContainer.encode<A>(_:)();
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

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.singleValueContainer()()
{
  return dispatch thunk of Decoder.singleValueContainer()();
}

uint64_t dispatch thunk of Encoder.singleValueContainer()()
{
  return dispatch thunk of Encoder.singleValueContainer()();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t TaskLocal.init(wrappedValue:)()
{
  return TaskLocal.init(wrappedValue:)();
}

CFDictionaryRef SecTaskCopyValuesForEntitlements(SecTaskRef task, CFArrayRef entitlements, CFErrorRef *error)
{
  return _SecTaskCopyValuesForEntitlements(task, entitlements, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
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

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return _clock_gettime_nsec_np(__clock_id);
}

uint64_t container_system_path_for_identifier()
{
  return _container_system_path_for_identifier();
}

void dispatch_main(void)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_transaction_get_timestamp()
{
  return _os_transaction_get_timestamp();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
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

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
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

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
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

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
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

uint64_t swift_stdlib_random()
{
  return _swift_stdlib_random();
}

uint64_t swift_taskGroup_addPending()
{
  return _swift_taskGroup_addPending();
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

uint64_t swift_task_localValuePop()
{
  return _swift_task_localValuePop();
}

uint64_t swift_task_localValuePush()
{
  return _swift_task_localValuePush();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}