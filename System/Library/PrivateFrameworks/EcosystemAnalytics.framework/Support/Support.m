int main(int argc, const char **argv, const char **envp)
{
  sub_10000487C();
}

void sub_10000487C()
{
  sub_100008EBC(&qword_1000105E0);
  __chkstk_darwin();
  v1 = (char *)&aBlock - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105E8);
  __chkstk_darwin();
  v3 = (char *)&aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105F0);
  __chkstk_darwin();
  v5 = (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105F8);
  __chkstk_darwin();
  v7 = (char *)&aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (getppid() == 1)
  {
    static os_log_type_t.default.getter();
    sub_100009AD0(0, &qword_1000105C8);
    v8 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();

    type metadata accessor for EcosystemAnalyticsd();
    uint64_t v9 = swift_allocObject();
    sub_100005564();
    static os_log_type_t.default.getter();
    v10 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();

    if (sub_1000050D0())
    {
      static os_log_type_t.info.getter();
      v11 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();

      NSString v12 = String._bridgeToObjectiveC()();
      int IsEventUsed = AnalyticsIsEventUsed();

      if (IsEventUsed)
      {
        static os_log_type_t.default.getter();
        v14 = (void *)static OS_os_log.default.getter();
        os_log(_:dso:log:_:_:)();

        uint64_t v15 = swift_allocObject();
        *(void *)(v15 + 16) = 0xD00000000000002DLL;
        *(void *)(v15 + 24) = 0x800000010000A9E0;
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 16) = v15;
        *(unsigned char *)(v16 + 24) = 0;
        *(void *)(v16 + 32) = v9;
        v39 = sub_100009B34;
        uint64_t v40 = v16;
        aBlock = _NSConcreteStackBlock;
        uint64_t v36 = 1107296256;
        v37 = sub_100008254;
        v38 = &unk_10000C708;
        v17 = _Block_copy(&aBlock);
        swift_retain();
        swift_retain();
        swift_release();
        uint64_t v18 = String.utf8CString.getter();
        xpc_activity_register((const char *)(v18 + 32), XPC_ACTIVITY_CHECK_IN, v17);
        swift_release();
        _Block_release(v17);
        swift_release();
      }
    }
    if (sub_1000050D0())
    {
      static os_log_type_t.info.getter();
      v19 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();

      NSString v20 = String._bridgeToObjectiveC()();
      int v21 = AnalyticsIsEventUsed();

      if (v21)
      {
        static os_log_type_t.default.getter();
        v22 = (void *)static OS_os_log.default.getter();
        os_log(_:dso:log:_:_:)();

        uint64_t v23 = swift_allocObject();
        *(void *)(v23 + 16) = 0xD00000000000002ELL;
        *(void *)(v23 + 24) = 0x800000010000A8D0;
        uint64_t v24 = swift_allocObject();
        *(void *)(v24 + 16) = v23;
        *(unsigned char *)(v24 + 24) = 1;
        *(void *)(v24 + 32) = v9;
        v39 = sub_100009874;
        uint64_t v40 = v24;
        aBlock = _NSConcreteStackBlock;
        uint64_t v36 = 1107296256;
        v37 = sub_100008254;
        v38 = &unk_10000C6B8;
        v25 = _Block_copy(&aBlock);
        swift_retain();
        swift_retain();
        swift_release();
        uint64_t v26 = String.utf8CString.getter();
        xpc_activity_register((const char *)(v26 + 32), XPC_ACTIVITY_CHECK_IN, v25);
        swift_release();
        _Block_release(v25);
        swift_release();
      }
    }
    if (sub_1000050D0())
    {
      static os_log_type_t.info.getter();
      v27 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();
    }
    dispatch_main();
  }
  static os_log_type_t.error.getter();
  sub_100009AD0(0, &qword_1000105C8);
  v28 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  uint64_t v29 = type metadata accessor for AnalysisTypeForCA();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v7, 1, 1, v29);
  uint64_t v30 = type metadata accessor for TargetType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v5, 1, 1, v30);
  uint64_t v31 = enum case for AnalysisFailureType.xpcError(_:);
  uint64_t v32 = type metadata accessor for AnalysisFailureType();
  uint64_t v33 = *(void *)(v32 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 104))(v3, v31, v32);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v3, 0, 1, v32);
  uint64_t v34 = type metadata accessor for AnalysisFailureState();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v1, 1, 1, v34);
  static AnalysisFailure.send(analysisType:targetType:retries:targetPath:targetName:targetBundleID:targetBundleVersion:failureType:failureDescription:daemonState:)();
  sub_1000097DC((uint64_t)v1, &qword_1000105E0);
  sub_1000097DC((uint64_t)v3, &qword_1000105E8);
  sub_1000097DC((uint64_t)v5, &qword_1000105F0);
  sub_1000097DC((uint64_t)v7, &qword_1000105F8);
  exit(-1);
}

uint64_t sub_1000050D0()
{
  uint64_t v0 = self;
  id v1 = [v0 standardUserDefaults];
  id v2 = [v1 dictionaryRepresentation];
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!*(void *)(v3 + 16))
  {

    swift_bridgeObjectRelease();
    return 1;
  }
  sub_100009558(0x64656C62616E65, 0xE700000000000000);
  char v5 = v4;
  swift_bridgeObjectRelease();
  if ((v5 & 1) == 0)
  {

    return 1;
  }
  id v6 = [v0 standardUserDefaults];
  NSString v7 = String._bridgeToObjectiveC()();
  id v8 = [v6 BOOLForKey:v7];

  static os_log_type_t.default.getter();
  sub_100008EBC(&qword_1000105D0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10000A2E0;
  *(void *)(v9 + 56) = &type metadata for Bool;
  *(void *)(v9 + 64) = &protocol witness table for Bool;
  *(unsigned char *)(v9 + 32) = (_BYTE)v8;
  sub_100009AD0(0, &qword_1000105C8);
  v10 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  swift_bridgeObjectRelease();
  return (uint64_t)v8;
}

uint64_t sub_1000052AC(char a1)
{
  uint64_t v3 = *(NSObject **)(v1 + 24);
  uint64_t v4 = swift_allocObject();
  swift_weakInit();
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = a1;
  *(void *)(v5 + 24) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_100009780;
  *(void *)(v6 + 24) = v5;
  v9[4] = sub_10000979C;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10000553C;
  v9[3] = &unk_10000C640;
  NSString v7 = _Block_copy(v9);
  swift_retain();
  swift_release();
  dispatch_sync(v3, v7);
  _Block_release(v7);
  LOBYTE(v3) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v3) {
    __break(1u);
  }
  return result;
}

uint64_t sub_100005420(char a1)
{
  os_log_type_t v2 = static os_log_type_t.default.getter();
  sub_100009AD0(0, &qword_1000105C8);
  uint64_t v3 = static OS_os_log.default.getter();
  if (os_log_type_enabled(v3, v2))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 67109120;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v3, v2, "ecosystemanalyticsd: _memoryPressureDetected value set to: %{BOOL}d", v4, 8u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    *(unsigned char *)(result + 16) = a1 & 1;
    return swift_release();
  }
  return result;
}

uint64_t sub_10000553C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100005564()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v38 = *(void *)(v1 - 8);
  uint64_t v39 = v1;
  __chkstk_darwin();
  v37 = (char *)v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for OS_dispatch_source.MemoryPressureEvent();
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  __chkstk_darwin();
  uint64_t v32 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v5 = *(void *)(v45 - 8);
  __chkstk_darwin();
  NSString v7 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  uint64_t v9 = type metadata accessor for DispatchQoS();
  uint64_t v35 = *(void *)(v9 - 8);
  uint64_t v36 = v9;
  __chkstk_darwin();
  v11 = (char *)v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v0 + 16) = 0;
  uint64_t v30 = sub_100009AD0(0, &qword_1000106E8);
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  uint64_t v43 = sub_100009A38(&qword_1000106F0, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  uint64_t v44 = sub_100008EBC(&qword_1000106F8);
  uint64_t v42 = sub_100009A80(&qword_100010700, &qword_1000106F8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v31 = *(void (**)(char *))(v5 + 104);
  uint64_t v40 = v7;
  uint64_t v41 = v5 + 104;
  NSString v12 = v7;
  uint64_t v13 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  unsigned int v29 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  uint64_t v14 = v45;
  v31(v12);
  uint64_t v15 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v28[0] = v0;
  *(void *)(v0 + 24) = v15;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  v28[1] = v8;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v16 = v13;
  v17 = v31;
  ((void (*)(char *, uint64_t, uint64_t))v31)(v40, v16, v14);
  *(void *)(v0 + 32) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v18 = v40;
  uint64_t v19 = v29;
  uint64_t v20 = v45;
  ((void (*)(char *, void, uint64_t))v17)(v40, v29, v45);
  uint64_t v21 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  uint64_t v22 = v28[0];
  *(void *)(v28[0] + 40) = v21;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  ((void (*)(char *, uint64_t, uint64_t))v17)(v18, v19, v20);
  *(void *)(v22 + 48) = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  sub_100009AD0(0, &qword_100010708);
  uint64_t v23 = v32;
  static OS_dispatch_source.MemoryPressureEvent.procLimitWarn.getter();
  static OS_dispatch_source.makeMemoryPressureSource(eventMask:queue:)();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v23, v34);
  swift_getObjectType();
  uint64_t v24 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_100009B0C;
  aBlock[5] = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006738;
  aBlock[3] = &unk_10000C820;
  v25 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v26 = v37;
  sub_10000673C();
  OS_dispatch_source.setEventHandler(qos:flags:handler:)();
  _Block_release(v25);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v26, v39);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v36);
  swift_release();
  swift_release();
  OS_dispatch_source.resume()();
  swift_unknownObjectRelease();
  return v22;
}

uint64_t sub_100005C6C(uint64_t a1)
{
  uint64_t v32 = a1;
  uint64_t v34 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v37 = *(void *)(v34 - 8);
  __chkstk_darwin();
  uint64_t v33 = (char *)&v30 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = type metadata accessor for DispatchQoS();
  uint64_t v35 = *(void *)(v2 - 8);
  uint64_t v36 = v2;
  __chkstk_darwin();
  uint64_t v31 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105E0);
  __chkstk_darwin();
  uint64_t v30 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105E8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105F0);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105F8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for OSSignpostID();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_log_type_t.error.getter();
  sub_100009AD0(0, &qword_1000105C8);
  uint64_t v15 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  static os_signpost_type_t.event.getter();
  uint64_t v16 = (void *)static OS_os_log.default.getter();
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)();

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v17 = type metadata accessor for AnalysisTypeForCA();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v10, 1, 1, v17);
  uint64_t v18 = type metadata accessor for TargetType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v8, 1, 1, v18);
  uint64_t v19 = enum case for AnalysisFailureType.memoryPressureError(_:);
  uint64_t v20 = type metadata accessor for AnalysisFailureType();
  uint64_t v21 = *(void *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 104))(v6, v19, v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v6, 0, 1, v20);
  uint64_t v22 = type metadata accessor for AnalysisFailureState();
  uint64_t v23 = (uint64_t)v30;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v30, 1, 1, v22);
  static AnalysisFailure.send(analysisType:targetType:retries:targetPath:targetName:targetBundleID:targetBundleVersion:failureType:failureDescription:daemonState:)();
  sub_1000097DC(v23, &qword_1000105E0);
  sub_1000097DC((uint64_t)v6, &qword_1000105E8);
  sub_1000097DC((uint64_t)v8, &qword_1000105F0);
  sub_1000097DC((uint64_t)v10, &qword_1000105F8);
  sub_100009AD0(0, &qword_1000106E8);
  uint64_t v24 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_100009B14;
  aBlock[5] = v32;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006738;
  aBlock[3] = &unk_10000C848;
  v25 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  uint64_t v26 = v31;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100009A38(&qword_100010660, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100008EBC(&qword_100010668);
  sub_100009A80(&qword_100010670, &qword_100010668);
  v27 = v33;
  uint64_t v28 = v34;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v37 + 8))(v27, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v26, v36);
}

uint64_t sub_10000636C()
{
  sub_100008EBC(&qword_1000105E0);
  __chkstk_darwin();
  uint64_t v1 = (char *)&v16 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105E8);
  __chkstk_darwin();
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105F0);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105F8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_log_type_t.error.getter();
  sub_100009AD0(0, &qword_1000105C8);
  uint64_t v8 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    sub_1000052AC(1);
    swift_release();
  }
  uint64_t v9 = type metadata accessor for AnalysisTypeForCA();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  uint64_t v10 = type metadata accessor for TargetType();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
  uint64_t v11 = enum case for AnalysisFailureType.memoryPressureError(_:);
  uint64_t v12 = type metadata accessor for AnalysisFailureType();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v3, v11, v12);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v3, 0, 1, v12);
  uint64_t v14 = type metadata accessor for AnalysisFailureState();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v1, 1, 1, v14);
  static AnalysisFailure.send(analysisType:targetType:retries:targetPath:targetName:targetBundleID:targetBundleVersion:failureType:failureDescription:daemonState:)();
  sub_1000097DC((uint64_t)v1, &qword_1000105E0);
  sub_1000097DC((uint64_t)v3, &qword_1000105E8);
  sub_1000097DC((uint64_t)v5, &qword_1000105F0);
  return sub_1000097DC((uint64_t)v7, &qword_1000105F8);
}

uint64_t sub_10000673C()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void sub_100006804(_xpc_activity_s *a1, uint64_t a2, int a3, void *a4)
{
  v81 = a4;
  int v80 = a3;
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v71 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  v82 = (char *)&v71 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105E0);
  __chkstk_darwin();
  v79 = (char *)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105E8);
  __chkstk_darwin();
  uint64_t v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105F0);
  __chkstk_darwin();
  v78 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105F8);
  __chkstk_darwin();
  uint64_t v18 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (xpc_activity_get_state(a1))
  {
    if (xpc_activity_get_state(a1) == 2)
    {
      v71 = v9;
      uint64_t v72 = v11;
      uint64_t v73 = v7;
      uint64_t v74 = v10;
      uint64_t v75 = v6;
      static os_log_type_t.default.getter();
      uint64_t v76 = sub_100008EBC(&qword_1000105D0);
      uint64_t v19 = swift_allocObject();
      long long v77 = xmmword_10000A2E0;
      *(_OWORD *)(v19 + 16) = xmmword_10000A2E0;
      swift_beginAccess();
      uint64_t v20 = *(void *)(a2 + 16);
      uint64_t v21 = *(void *)(a2 + 24);
      *(void *)(v19 + 56) = &type metadata for String;
      unint64_t v22 = sub_1000096F4();
      *(void *)(v19 + 64) = v22;
      *(void *)(v19 + 32) = v20;
      *(void *)(v19 + 40) = v21;
      sub_100009AD0(0, &qword_1000105C8);
      swift_bridgeObjectRetain();
      uint64_t v23 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();
      swift_bridgeObjectRelease();

      if (xpc_activity_should_defer(a1))
      {
        static os_log_type_t.default.getter();
        uint64_t v24 = swift_allocObject();
        *(_OWORD *)(v24 + 16) = v77;
        swift_beginAccess();
        uint64_t v26 = *(void *)(a2 + 16);
        uint64_t v25 = *(void *)(a2 + 24);
        *(void *)(v24 + 56) = &type metadata for String;
        *(void *)(v24 + 64) = v22;
        *(void *)(v24 + 32) = v26;
        *(void *)(v24 + 40) = v25;
        swift_bridgeObjectRetain();
        v27 = (void *)static OS_os_log.default.getter();
        os_log(_:dso:log:_:_:)();
        swift_bridgeObjectRelease();

        if (!xpc_activity_set_state(a1, 3))
        {
          static os_log_type_t.fault.getter();
          uint64_t v28 = swift_allocObject();
          *(_OWORD *)(v28 + 16) = v77;
          xpc_activity_state_t state = xpc_activity_get_state(a1);
          *(void *)(v28 + 56) = &type metadata for Int;
          *(void *)(v28 + 64) = &protocol witness table for Int;
          *(void *)(v28 + 32) = state;
          uint64_t v30 = (void *)static OS_os_log.default.getter();
          os_log(_:dso:log:_:_:)();
          swift_bridgeObjectRelease();

          uint64_t v31 = type metadata accessor for AnalysisTypeForCA();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v18, 1, 1, v31);
          uint64_t v32 = type metadata accessor for TargetType();
          uint64_t v33 = (uint64_t)v78;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v32 - 8) + 56))(v78, 1, 1, v32);
          uint64_t v34 = enum case for AnalysisFailureType.xpcError(_:);
          uint64_t v35 = type metadata accessor for AnalysisFailureType();
          uint64_t v36 = *(void *)(v35 - 8);
          (*(void (**)(char *, uint64_t, uint64_t))(v36 + 104))(v15, v34, v35);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v36 + 56))(v15, 0, 1, v35);
          v84 = 0;
          unint64_t v85 = 0xE000000000000000;
          _StringGuts.grow(_:)(29);
          swift_bridgeObjectRelease();
          v84 = (void *)0xD00000000000001BLL;
          unint64_t v85 = 0x800000010000AB20;
          xpc_activity_state_t v83 = xpc_activity_get_state(a1);
          v37._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
          String.append(_:)(v37);
          swift_bridgeObjectRelease();
          swift_unknownObjectRetain();
          uint64_t v38 = (uint64_t)v79;
          AnalysisFailureState.init(xpcActivity:)();
          uint64_t v39 = type metadata accessor for AnalysisFailureState();
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v38, 0, 1, v39);
          static AnalysisFailure.send(analysisType:targetType:retries:targetPath:targetName:targetBundleID:targetBundleVersion:failureType:failureDescription:daemonState:)();
          swift_bridgeObjectRelease();
          sub_1000097DC(v38, &qword_1000105E0);
          sub_1000097DC((uint64_t)v15, &qword_1000105E8);
          sub_1000097DC(v33, &qword_1000105F0);
          sub_1000097DC((uint64_t)v18, &qword_1000105F8);
        }
      }
      else
      {
        if ((_BYTE)v80)
        {
          uint64_t v51 = v73;
          uint64_t v52 = v72;
          v53 = v71;
          v63 = v81;
          if (v80 == 1)
          {
            v64 = (void *)v81[5];
            v54 = (void *)swift_allocObject();
            v54[2] = v63;
            v54[3] = a2;
            v54[4] = a1;
            v90 = sub_100009924;
            v91 = v54;
            aBlock = _NSConcreteStackBlock;
            uint64_t v87 = 1107296256;
            v66 = &unk_10000C7A8;
          }
          else
          {
            v64 = (void *)v81[6];
            v65 = (void *)swift_allocObject();
            v65[2] = v63;
            v65[3] = a2;
            v65[4] = a1;
            v90 = sub_1000098CC;
            v91 = v65;
            aBlock = _NSConcreteStackBlock;
            uint64_t v87 = 1107296256;
            v66 = &unk_10000C758;
          }
          v88 = sub_100006738;
          v89 = v66;
          v67 = _Block_copy(&aBlock);
          swift_unknownObjectRetain();
          swift_retain();
          swift_retain();
          id v68 = v64;
          v69 = v82;
          static DispatchQoS.unspecified.getter();
          v84 = &_swiftEmptyArrayStorage;
          sub_100009A38(&qword_100010660, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
          sub_100008EBC(&qword_100010668);
          sub_100009A80(&qword_100010670, &qword_100010668);
          uint64_t v70 = v75;
          dispatch thunk of SetAlgebra.init<A>(_:)();
          OS_dispatch_queue.async(group:qos:flags:execute:)();
          _Block_release(v67);

          (*(void (**)(char *, uint64_t))(v51 + 8))(v53, v70);
          (*(void (**)(char *, uint64_t))(v52 + 8))(v69, v74);
        }
        else
        {
          v55 = v81;
          v56 = (void *)v81[4];
          v57 = (void *)swift_allocObject();
          v57[2] = v55;
          v57[3] = a2;
          v57[4] = a1;
          v90 = sub_10000997C;
          v91 = v57;
          aBlock = _NSConcreteStackBlock;
          uint64_t v87 = 1107296256;
          v88 = sub_100006738;
          v89 = &unk_10000C7F8;
          v58 = _Block_copy(&aBlock);
          swift_unknownObjectRetain();
          id v59 = v56;
          swift_retain();
          swift_retain();
          v60 = v82;
          static DispatchQoS.unspecified.getter();
          v84 = &_swiftEmptyArrayStorage;
          sub_100009A38(&qword_100010660, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
          sub_100008EBC(&qword_100010668);
          sub_100009A80(&qword_100010670, &qword_100010668);
          v61 = v71;
          uint64_t v62 = v75;
          dispatch thunk of SetAlgebra.init<A>(_:)();
          OS_dispatch_queue.async(group:qos:flags:execute:)();
          _Block_release(v58);

          (*(void (**)(char *, uint64_t))(v73 + 8))(v61, v62);
          (*(void (**)(char *, uint64_t))(v72 + 8))(v60, v74);
        }
        swift_release();
      }
    }
    else
    {
      static os_log_type_t.info.getter();
      sub_100008EBC(&qword_1000105D0);
      uint64_t v46 = swift_allocObject();
      *(_OWORD *)(v46 + 16) = xmmword_10000A2F0;
      xpc_activity_state_t v47 = xpc_activity_get_state(a1);
      *(void *)(v46 + 56) = &type metadata for Int;
      *(void *)(v46 + 64) = &protocol witness table for Int;
      *(void *)(v46 + 32) = v47;
      swift_beginAccess();
      uint64_t v49 = *(void *)(a2 + 16);
      uint64_t v48 = *(void *)(a2 + 24);
      *(void *)(v46 + 96) = &type metadata for String;
      *(void *)(v46 + 104) = sub_1000096F4();
      *(void *)(v46 + 72) = v49;
      *(void *)(v46 + 80) = v48;
      sub_100009AD0(0, &qword_1000105C8);
      swift_bridgeObjectRetain();
      v50 = (void *)static OS_os_log.default.getter();
      os_log(_:dso:log:_:_:)();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    static os_log_type_t.info.getter();
    sub_100008EBC(&qword_1000105D0);
    uint64_t v40 = swift_allocObject();
    *(_OWORD *)(v40 + 16) = xmmword_10000A2E0;
    swift_beginAccess();
    uint64_t v42 = *(void *)(a2 + 16);
    uint64_t v41 = *(void *)(a2 + 24);
    *(void *)(v40 + 56) = &type metadata for String;
    *(void *)(v40 + 64) = sub_1000096F4();
    *(void *)(v40 + 32) = v42;
    *(void *)(v40 + 40) = v41;
    sub_100009AD0(0, &qword_1000105C8);
    swift_bridgeObjectRetain();
    uint64_t v43 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();

    swift_beginAccess();
    uint64_t v44 = *(void *)(a2 + 16);
    uint64_t v45 = *(void *)(a2 + 24);
    swift_bridgeObjectRetain();
    sub_1000074E4(v44, v45, a1);
    swift_bridgeObjectRelease();
  }
}

void sub_1000074E4(uint64_t a1, uint64_t a2, _xpc_activity_s *a3)
{
  sub_100008EBC(&qword_1000105E0);
  __chkstk_darwin();
  uint64_t v38 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105E8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105F0);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008EBC(&qword_1000105F8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static os_log_type_t.default.getter();
  sub_100008EBC(&qword_1000105D0);
  uint64_t v13 = swift_allocObject();
  long long v36 = xmmword_10000A2E0;
  *(_OWORD *)(v13 + 16) = xmmword_10000A2E0;
  *(void *)(v13 + 56) = &type metadata for String;
  unint64_t v35 = sub_1000096F4();
  *(void *)(v13 + 64) = v35;
  uint64_t v37 = a1;
  *(void *)(v13 + 32) = a1;
  *(void *)(v13 + 40) = a2;
  sub_100009AD0(0, &qword_1000105C8);
  swift_bridgeObjectRetain();
  uint64_t v14 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();
  uint64_t v15 = a3;
  swift_bridgeObjectRelease();

  xpc_object_t v16 = xpc_activity_copy_criteria(a3);
  if (!v16)
  {
    static os_log_type_t.error.getter();
    uint64_t v21 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();

    uint64_t v22 = type metadata accessor for AnalysisTypeForCA();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v12, 1, 1, v22);
    uint64_t v23 = type metadata accessor for TargetType();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v10, 1, 1, v23);
    uint64_t v24 = enum case for AnalysisFailureType.xpcError(_:);
    uint64_t v25 = type metadata accessor for AnalysisFailureType();
    uint64_t v26 = *(void *)(v25 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 104))(v8, v24, v25);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v26 + 56))(v8, 0, 1, v25);
    uint64_t v27 = type metadata accessor for AnalysisFailureState();
    uint64_t v28 = (uint64_t)v38;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v38, 1, 1, v27);
    static AnalysisFailure.send(analysisType:targetType:retries:targetPath:targetName:targetBundleID:targetBundleVersion:failureType:failureDescription:daemonState:)();
    sub_1000097DC(v28, &qword_1000105E0);
    sub_1000097DC((uint64_t)v8, &qword_1000105E8);
    sub_1000097DC((uint64_t)v10, &qword_1000105F0);
    sub_1000097DC((uint64_t)v12, &qword_1000105F8);
    return;
  }
  uint64_t v17 = v16;
  char v18 = sub_100008550();
  static os_log_type_t.default.getter();
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_10000A2F0;
  *(void *)(v19 + 56) = &type metadata for Int;
  *(void *)(v19 + 64) = &protocol witness table for Int;
  if (v18)
  {
    *(void *)(v19 + 32) = 301;
    *(void *)(v19 + 96) = &type metadata for Int;
    *(void *)(v19 + 104) = &protocol witness table for Int;
    *(void *)(v19 + 72) = 301;
    uint64_t v20 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:_:_:)();
    swift_bridgeObjectRelease();

    xpc_dictionary_set_string(v17, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_UTILITY);
    if (XPC_ACTIVITY_EXPECTED_DURATION)
    {
      xpc_dictionary_set_int64(v17, XPC_ACTIVITY_EXPECTED_DURATION, 60);
      xpc_dictionary_set_uint64(v17, XPC_ACTIVITY_DELAY, 0x12DuLL);
      xpc_dictionary_set_uint64(v17, XPC_ACTIVITY_GRACE_PERIOD, 0x12DuLL);
      xpc_activity_set_criteria(a3, v17);
      swift_unknownObjectRelease();
      return;
    }
    __break(1u);
    goto LABEL_18;
  }
  *(void *)(v19 + 32) = 604800;
  *(void *)(v19 + 96) = &type metadata for Int;
  *(void *)(v19 + 104) = &protocol witness table for Int;
  *(void *)(v19 + 72) = 86400;
  unsigned int v29 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();

  if (!XPC_ACTIVITY_EXPECTED_DURATION)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  xpc_dictionary_set_int64(v17, XPC_ACTIVITY_EXPECTED_DURATION, 60);
  xpc_dictionary_set_uint64(v17, XPC_ACTIVITY_DELAY, 0x93A80uLL);
  xpc_dictionary_set_uint64(v17, XPC_ACTIVITY_GRACE_PERIOD, 0x15180uLL);
  uint64_t v30 = v37;
  if (v37 == 0xD00000000000002ELL && a2 == 0x800000010000A8D0
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    if (!XPC_ACTIVITY_REQUIRES_CLASS_B)
    {
LABEL_19:
      __break(1u);
      return;
    }
    xpc_dictionary_set_BOOL(v17, XPC_ACTIVITY_REQUIRES_CLASS_B, 1);
  }
  xpc_activity_set_criteria(v15, v17);
  static os_log_type_t.default.getter();
  uint64_t v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = v36;
  unint64_t v32 = v35;
  *(void *)(v31 + 56) = &type metadata for String;
  *(void *)(v31 + 64) = v32;
  *(void *)(v31 + 32) = v30;
  *(void *)(v31 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v38 = (char *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v33 = v38;
}

uint64_t sub_100007C68(uint64_t a1, uint64_t a2, _xpc_activity_s *a3)
{
  static os_log_type_t.default.getter();
  sub_100009AD0(0, &qword_1000105C8);
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  v15[3] = os_transaction_create();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  uint64_t v7 = static OS_os_log.default.getter();
  os_log_type_t v8 = v6;
  if (os_log_type_enabled(v7, v6))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v15[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_beginAccess();
    swift_unknownObjectRetain();
    sub_100008EBC(&qword_1000106D8);
    uint64_t v10 = String.init<A>(describing:)();
    sub_100008F00(v10, v11, v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "ecosystemanalyticsd: performing static_analysis - %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_1000082B4();
  xpc_transaction_exit_clean();
  swift_beginAccess();
  uint64_t v12 = *(void *)(a2 + 16);
  uint64_t v13 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  sub_1000074E4(v12, v13, a3);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  return swift_unknownObjectRelease();
}

uint64_t sub_100007EAC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100007EF0(uint64_t a1, uint64_t a2, _xpc_activity_s *a3)
{
  static os_log_type_t.default.getter();
  sub_100009AD0(0, &qword_1000105C8);
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  v15[3] = os_transaction_create();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  uint64_t v7 = static OS_os_log.default.getter();
  os_log_type_t v8 = v6;
  if (os_log_type_enabled(v7, v6))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    v15[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    swift_beginAccess();
    swift_unknownObjectRetain();
    sub_100008EBC(&qword_1000106D8);
    uint64_t v10 = String.init<A>(describing:)();
    sub_100008F00(v10, v11, v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "ecosystemanalyticsd: performing runtime_analysis - %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_100008964();
  xpc_transaction_exit_clean();
  swift_beginAccess();
  uint64_t v12 = *(void *)(a2 + 16);
  uint64_t v13 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  sub_1000074E4(v12, v13, a3);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  return swift_unknownObjectRelease();
}

uint64_t sub_100008134(uint64_t a1, uint64_t a2, _xpc_activity_s *a3)
{
  static os_log_type_t.default.getter();
  sub_100009AD0(0, &qword_1000105C8);
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  static os_log_type_t.default.getter();
  os_log_type_t v6 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  xpc_transaction_exit_clean();
  swift_beginAccess();
  uint64_t v7 = *(void *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  sub_1000074E4(v7, v8, a3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100008254(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_1000082B4()
{
  static os_log_type_t.default.getter();
  sub_100009AD0(0, &qword_1000105C8);
  uint64_t v0 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  swift_allocObject();
  swift_weakInit();
  if (sub_100008550())
  {
    sub_1000086FC(0x7041636974617473, 0xED00006874615070);
    if (v1)
    {
      type metadata accessor for AnalysisCoordinator();
      uint64_t v2 = static AnalysisCoordinator.staticallyAnalyzeAppPath(_:interruptCallback:sendEvents:coreSymbolication:printTostdout:)();
LABEL_6:
      uint64_t v4 = v2;
      swift_bridgeObjectRelease();
      goto LABEL_8;
    }
    sub_1000086FC(0x614D636974617473, 0xEF687461506F6863);
    if (v3)
    {
      type metadata accessor for AnalysisCoordinator();
      uint64_t v2 = static AnalysisCoordinator.staticallyAnalyzeMachOPath(_:interruptCallback:sendEvents:coreSymbolication:printTostdout:)();
      goto LABEL_6;
    }
  }
  type metadata accessor for AnalysisCoordinator();
  uint64_t v4 = static AnalysisCoordinator.staticallyAnalyze(interruptCallback:sendEvents:coreSymbolication:printTostdout:)();
LABEL_8:
  static os_log_type_t.default.getter();
  sub_100008EBC(&qword_1000105D0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000A2E0;
  *(void *)(v5 + 56) = &type metadata for Int;
  *(void *)(v5 + 64) = &protocol witness table for Int;
  *(void *)(v5 + 32) = v4;
  os_log_type_t v6 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_100008550()
{
  uint64_t v0 = self;
  id v1 = [v0 standardUserDefaults];
  id v2 = [v1 dictionaryRepresentation];
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v3 + 16))
  {
    sub_100009558(0x6D706F6C65766564, 0xEB00000000746E65);
    char v5 = v4;
    swift_bridgeObjectRelease();
    if (v5)
    {
      id v6 = [v0 standardUserDefaults];
      NSString v7 = String._bridgeToObjectiveC()();
      unsigned int v8 = [v6 BOOLForKey:v7];

      if (v8)
      {
        static os_log_type_t.default.getter();
        sub_100009AD0(0, &qword_1000105C8);
        uint64_t v9 = (void *)static OS_os_log.default.getter();
        os_log(_:dso:log:_:_:)();

        return 1;
      }
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  return 0;
}

uint64_t sub_1000086FC(uint64_t a1, uint64_t a2)
{
  char v4 = self;
  id v5 = [v4 standardUserDefaults];
  id v6 = [v5 dictionaryRepresentation];
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!*(void *)(v7 + 16))
  {

    swift_bridgeObjectRelease();
    return 0;
  }
  sub_100009558(a1, a2);
  char v9 = v8;
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0) {
    goto LABEL_6;
  }
  id v10 = [v4 standardUserDefaults];
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [v10 stringForKey:v11];

  if (!v12
    || (v12,
        id v13 = [v4 standardUserDefaults],
        NSString v14 = String._bridgeToObjectiveC()(),
        id v15 = [v13 stringForKey:v14],
        v13,
        v14,
        !v15))
  {
LABEL_6:

    return 0;
  }
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  swift_bridgeObjectRetain();

  static os_log_type_t.default.getter();
  sub_100008EBC(&qword_1000105D0);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_10000A2E0;
  *(void *)(v19 + 56) = &type metadata for String;
  *(void *)(v19 + 64) = sub_1000096F4();
  *(void *)(v19 + 32) = v16;
  *(void *)(v19 + 40) = v18;
  sub_100009AD0(0, &qword_1000105C8);
  uint64_t v20 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_100008964()
{
  static os_log_type_t.default.getter();
  sub_100009AD0(0, &qword_1000105C8);
  uint64_t v0 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();

  swift_allocObject();
  swift_weakInit();
  if (sub_100008550())
  {
    sub_100008BBC();
    uint64_t v2 = v1;
    type metadata accessor for AnalysisCoordinator();
    if ((v2 & 0x100000000) == 0 && v2)
    {
      uint64_t v3 = static AnalysisCoordinator.runtimeAnalyzePID(_:interruptCallback:sendEvents:printTostdout:)();
      goto LABEL_7;
    }
  }
  else
  {
    type metadata accessor for AnalysisCoordinator();
  }
  uint64_t v3 = static AnalysisCoordinator.runtimeAnalyze(interruptCallback:sendEvents:printTostdout:)();
LABEL_7:
  uint64_t v4 = v3;
  static os_log_type_t.default.getter();
  sub_100008EBC(&qword_1000105D0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10000A2E0;
  *(void *)(v5 + 56) = &type metadata for Int;
  *(void *)(v5 + 64) = &protocol witness table for Int;
  *(void *)(v5 + 32) = v4;
  id v6 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:_:_:)();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_100008B38()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    OS_dispatch_queue.sync<A>(execute:)();
    swift_release();
    return v1;
  }
  return result;
}

void sub_100008BBC()
{
  uint64_t v0 = self;
  id v1 = [v0 standardUserDefaults];
  id v2 = [v1 dictionaryRepresentation];
  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v3 + 16))
  {
    sub_100009558(0x50656D69746E7572, 0xEA00000000006469);
    char v5 = v4;
    swift_bridgeObjectRelease();
    if (v5)
    {
      id v6 = [v0 standardUserDefaults];
      NSString v7 = String._bridgeToObjectiveC()();
      uint64_t v8 = (uint64_t)[v6 integerForKey:v7];

      if (v8 < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
      }
      else if (v8 <= 0x7FFFFFFF)
      {
        static os_log_type_t.default.getter();
        sub_100008EBC(&qword_1000105D0);
        uint64_t v9 = swift_allocObject();
        *(_OWORD *)(v9 + 16) = xmmword_10000A2E0;
        *(void *)(v9 + 56) = &type metadata for Int32;
        *(void *)(v9 + 64) = &protocol witness table for Int32;
        *(_DWORD *)(v9 + 32) = v8;
        sub_100009AD0(0, &qword_1000105C8);
        id v10 = (void *)static OS_os_log.default.getter();
        os_log(_:dso:log:_:_:)();

        swift_bridgeObjectRelease();
        return;
      }
      __break(1u);
    }
    else
    {
    }
  }
  else
  {

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_100008DDC()
{
  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for EcosystemAnalyticsd()
{
  return self;
}

uint64_t sub_100008E50()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008E88()
{
  return sub_100008B38() & 1;
}

uint64_t sub_100008EBC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100008F00(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100008FD4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000099D8((uint64_t)v12, *a3);
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
      sub_1000099D8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100009988((uint64_t)v12);
  return v7;
}

uint64_t sub_100008FD4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100009190(a5, a6);
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

uint64_t sub_100009190(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100009228(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100009408(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100009408(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100009228(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000093A0(v2, 0);
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

void *sub_1000093A0(uint64_t a1, uint64_t a2)
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
  sub_100008EBC(&qword_1000106E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100009408(char a1, int64_t a2, char a3, char *a4)
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
    sub_100008EBC(&qword_1000106E0);
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
  id v13 = a4 + 32;
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

unint64_t sub_100009558(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_1000095D0(a1, a2, v4);
}

unint64_t sub_1000095D0(uint64_t a1, uint64_t a2, uint64_t a3)
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
        id v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void sub_1000096B4(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

uint64_t sub_1000096C0()
{
  return sub_100008B38() & 1;
}

unint64_t sub_1000096F4()
{
  unint64_t result = qword_1000105D8;
  if (!qword_1000105D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000105D8);
  }
  return result;
}

uint64_t sub_100009748()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100009780()
{
  return sub_100005420(*(unsigned char *)(v0 + 16));
}

uint64_t sub_10000978C()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000979C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000097C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000097D4()
{
  return swift_release();
}

uint64_t sub_1000097DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100008EBC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009838()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100009874(_xpc_activity_s *a1)
{
  sub_100006804(a1, *(void *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_100009888()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000098CC()
{
  return sub_100008134(*(void *)(v0 + 16), *(void *)(v0 + 24), *(_xpc_activity_s **)(v0 + 32));
}

uint64_t sub_1000098D8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100009924()
{
  return sub_100007EF0(*(void *)(v0 + 16), *(void *)(v0 + 24), *(_xpc_activity_s **)(v0 + 32));
}

uint64_t sub_100009934()
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000997C()
{
  return sub_100007C68(*(void *)(v0 + 16), *(void *)(v0 + 24), *(_xpc_activity_s **)(v0 + 32));
}

uint64_t sub_100009988(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000099D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100009A38(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100009A80(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000098D8(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009AD0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100009B0C()
{
  return sub_100005C6C(v0);
}

uint64_t sub_100009B14()
{
  return sub_10000636C();
}

void sub_100009B1C(unsigned char *a1@<X8>)
{
}

uint64_t type metadata accessor for TargetType()
{
  return type metadata accessor for TargetType();
}

uint64_t static AnalysisFailure.send(analysisType:targetType:retries:targetPath:targetName:targetBundleID:targetBundleVersion:failureType:failureDescription:daemonState:)()
{
  return static AnalysisFailure.send(analysisType:targetType:retries:targetPath:targetName:targetBundleID:targetBundleVersion:failureType:failureDescription:daemonState:)();
}

uint64_t type metadata accessor for AnalysisTypeForCA()
{
  return type metadata accessor for AnalysisTypeForCA();
}

uint64_t static AnalysisCoordinator.runtimeAnalyze(interruptCallback:sendEvents:printTostdout:)()
{
  return static AnalysisCoordinator.runtimeAnalyze(interruptCallback:sendEvents:printTostdout:)();
}

uint64_t static AnalysisCoordinator.runtimeAnalyzePID(_:interruptCallback:sendEvents:printTostdout:)()
{
  return static AnalysisCoordinator.runtimeAnalyzePID(_:interruptCallback:sendEvents:printTostdout:)();
}

uint64_t static AnalysisCoordinator.staticallyAnalyze(interruptCallback:sendEvents:coreSymbolication:printTostdout:)()
{
  return static AnalysisCoordinator.staticallyAnalyze(interruptCallback:sendEvents:coreSymbolication:printTostdout:)();
}

uint64_t static AnalysisCoordinator.staticallyAnalyzeAppPath(_:interruptCallback:sendEvents:coreSymbolication:printTostdout:)()
{
  return static AnalysisCoordinator.staticallyAnalyzeAppPath(_:interruptCallback:sendEvents:coreSymbolication:printTostdout:)();
}

uint64_t static AnalysisCoordinator.staticallyAnalyzeMachOPath(_:interruptCallback:sendEvents:coreSymbolication:printTostdout:)()
{
  return static AnalysisCoordinator.staticallyAnalyzeMachOPath(_:interruptCallback:sendEvents:coreSymbolication:printTostdout:)();
}

uint64_t type metadata accessor for AnalysisCoordinator()
{
  return type metadata accessor for AnalysisCoordinator();
}

uint64_t type metadata accessor for AnalysisFailureType()
{
  return type metadata accessor for AnalysisFailureType();
}

uint64_t AnalysisFailureState.init(xpcActivity:)()
{
  return AnalysisFailureState.init(xpcActivity:)();
}

uint64_t type metadata accessor for AnalysisFailureState()
{
  return type metadata accessor for AnalysisFailureState();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t os_signpost(_:dso:log:name:signpostID:)()
{
  return os_signpost(_:dso:log:name:signpostID:)();
}

uint64_t static OSSignpostID.exclusive.getter()
{
  return static OSSignpostID.exclusive.getter();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return type metadata accessor for OSSignpostID();
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

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
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

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t static OS_dispatch_source.MemoryPressureEvent.procLimitWarn.getter()
{
  return static OS_dispatch_source.MemoryPressureEvent.procLimitWarn.getter();
}

uint64_t type metadata accessor for OS_dispatch_source.MemoryPressureEvent()
{
  return type metadata accessor for OS_dispatch_source.MemoryPressureEvent();
}

uint64_t static OS_dispatch_source.makeMemoryPressureSource(eventMask:queue:)()
{
  return static OS_dispatch_source.makeMemoryPressureSource(eventMask:queue:)();
}

uint64_t OS_dispatch_source.setEventHandler(qos:flags:handler:)()
{
  return OS_dispatch_source.setEventHandler(qos:flags:handler:)();
}

Swift::Void __swiftcall OS_dispatch_source.resume()()
{
}

uint64_t static os_signpost_type_t.event.getter()
{
  return static os_signpost_type_t.event.getter();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t AnalyticsIsEventUsed()
{
  return _AnalyticsIsEventUsed();
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

void dispatch_main(void)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void exit(int a1)
{
}

pid_t getppid(void)
{
  return _getppid();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return _xpc_activity_should_defer(activity);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}