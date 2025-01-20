uint64_t start()
{
  void *v0;
  NSObject *v1;
  void *v2;
  void *v3;
  BOOL v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v18;
  CFStringRef v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;

  if (+[_HKBehavior processHasLoadedUIKit])
  {
    _HKInitializeLogging();
    v1 = HKLogDefault;
    if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_FAULT)) {
      sub_100009BEC(v1);
    }
  }
  +[HKHealthStore disallowHKHealthStoreCreation];
  if (+[_HKBehavior isAppleInternalInstall])
  {
    v2 = +[NSUserDefaults standardUserDefaults];
    v3 = [v2 objectForKey:@"HealthHomeDirectory"];

    if (v3)
    {
      v4 = 0;
LABEL_9:
      v6 = [objc_alloc((Class)HDDaemon) initWithHealthDirectoryPath:v3 medicalIDDirectoryPath:v3];
      _HKInitializeLogging();
      v7 = (void *)HKLogDefault;
      if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v7;
        v9 = +[_HKBehavior currentOSBuild];
        v18 = 138543874;
        v19 = &stru_10000C8D8;
        v20 = 2114;
        v21 = v9;
        v22 = 2114;
        v23 = v3;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "healthd launched%{public}@ on %{public}@ with custom Health directory %{public}@", (uint8_t *)&v18, 0x20u);
      }
      if (v4)
      {
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterAddObserver(DarwinNotifyCenter, v6, (CFNotificationCallback)sub_100004768, @"SignificantTimeChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
      }
      goto LABEL_16;
    }
  }
  v5 = +[HDDemoData demoDataDirectory];
  v4 = v5 != 0;
  if (v5)
  {
    v3 = (void *)v5;
    goto LABEL_9;
  }
  v11 = NSHomeDirectory();
  v12 = [v11 stringByAppendingPathComponent:@"Library"];

  v6 = [objc_alloc((Class)HDDaemon) initWithContainerDirectoryPath:v12];
  _HKInitializeLogging();
  v13 = (void *)HKLogDefault;
  if (os_log_type_enabled(HKLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    v15 = +[_HKBehavior currentOSBuild];
    v18 = 138543618;
    v19 = &stru_10000C8D8;
    v20 = 2114;
    v21 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "healthd launched%{public}@ on %{public}@", (uint8_t *)&v18, 0x16u);
  }
  v3 = 0;
LABEL_16:
  [v6 start];

  v16 = +[NSRunLoop mainRunLoop];
  [v16 run];

  return 0;
}

id sub_100004768(uint64_t a1, void *a2)
{
  return _[a2 terminateClean:0 reason:@"significant time change in demo data mode"];
}

id sub_10000477C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, double a8)
{
  uint64_t v57 = a6;
  id v58 = a7;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v15 = type metadata accessor for URL();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = ((uint64_t (*)(void))__chkstk_darwin)();
  v51 = (char *)&v49 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17);
  v20 = (char *)&v49 - v19;
  v21 = &v8[OBJC_IVAR___HRLDLogArchiveProcessor_deviceName];
  *(void *)v21 = a2;
  *((void *)v21 + 1) = a3;
  v55 = v21;
  uint64_t v59 = v16;
  v22 = *(void (**)(void))(v16 + 16);
  v56 = &v8[OBJC_IVAR___HRLDLogArchiveProcessor_logArchiveURL];
  uint64_t v63 = a4;
  uint64_t v23 = a1;
  v22();
  uint64_t v60 = a5;
  uint64_t v64 = v15;
  v50 = v22;
  ((void (*)(char *, uint64_t, uint64_t))v22)(v20, a5, v15);
  id v24 = objc_allocWithZone((Class)type metadata accessor for LogEntryWriter());
  v25 = v8;
  id v26 = sub_1000087DC((uint64_t)v20);
  uint64_t v54 = OBJC_IVAR___HRLDLogArchiveProcessor_logWriter;
  *(void *)&v25[OBJC_IVAR___HRLDLogArchiveProcessor_logWriter] = v26;
  v27 = &v25[OBJC_IVAR___HRLDLogArchiveProcessor_archiveStartDate];
  uint64_t v28 = type metadata accessor for Date();
  uint64_t v29 = *(void *)(v28 - 8);
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v29 + 16);
  v53 = v27;
  v30(v27, a1, v28);
  v31 = &v25[OBJC_IVAR___HRLDLogArchiveProcessor_redactedToken];
  id v32 = v58;
  *(void *)v31 = v57;
  *((void *)v31 + 1) = v32;
  *(double *)&v25[OBJC_IVAR___HRLDLogArchiveProcessor_windowSize] = a8;
  id v33 = objc_allocWithZone((Class)NSDataDetector);
  id v66 = 0;
  id v34 = [v33 initWithTypes:2096 error:&v66];
  id v35 = v34;
  id v36 = v66;
  uint64_t v61 = v23;
  if (v34)
  {
    *(void *)&v25[OBJC_IVAR___HRLDLogArchiveProcessor_dataDetector] = v34;
    sub_1000062F8(0, &qword_100010A98);
    uint64_t v37 = (uint64_t)v51;
    ((void (*)(char *, uint64_t, uint64_t))v50)(v51, v63, v64);
    id v38 = v36;
    uint64_t v39 = v52;
    id v40 = sub_100005E1C(v37, (SEL *)&selRef_storeWithURL_error_);
    if (!v39)
    {
      *(void *)&v25[OBJC_IVAR___HRLDLogArchiveProcessor_osStore] = v40;

      v65.receiver = v25;
      v65.super_class = ObjectType;
      id v45 = objc_msgSendSuper2(&v65, "init");
      v46 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
      uint64_t v47 = v64;
      v46(v60, v64);
      v46(v63, v47);
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v61, v28);
      return v45;
    }
    id v58 = v35;
  }
  else
  {
    id v58 = 0;
    id v41 = v66;
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  v42 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
  uint64_t v43 = v64;
  v42(v60, v64);
  v42(v63, v43);
  v44 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
  v44(v61, v28);
  v44((uint64_t)v53, v28);
  swift_bridgeObjectRelease();
  v42((uint64_t)v56, v64);
  swift_bridgeObjectRelease();

  id v45 = v25;
  if (v58)
  {
    id v45 = *(id *)&v25[OBJC_IVAR___HRLDLogArchiveProcessor_dataDetector];
  }
  swift_deallocPartialClassInstance();
  return v45;
}

void sub_100004DD8(uint64_t a1, uint64_t a2, void (**a3)(void, __n128))
{
  uint64_t v56 = a1;
  id v58 = a3;
  uint64_t v55 = type metadata accessor for Date();
  uint64_t v53 = *(void *)(v55 - 8);
  uint64_t v4 = __chkstk_darwin(v55);
  v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  v9 = (char *)&v46 - v8;
  __chkstk_darwin(v7);
  uint64_t v54 = (char *)&v46 - v10;
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v51 = a2;
  uint64_t v15 = *(void *)(a2 + OBJC_IVAR___HRLDLogArchiveProcessor_logWriter);
  id v16 = [self defaultManager];
  uint64_t v52 = v15;
  uint64_t v17 = v15 + OBJC_IVAR____TtC7healthd14LogEntryWriter_fileURL;
  URL.path(percentEncoded:)(1);
  NSString v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v16 createFileAtPath:v18 contents:0 attributes:0];

  uint64_t v19 = v58;
  sub_1000062F8(0, &qword_100010998);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v17, v11);
  uint64_t v20 = v57;
  id v21 = sub_100005E1C((uint64_t)v14, (SEL *)&selRef_fileHandleForWritingToURL_error_);
  if (!v20)
  {
    v22 = *(void **)(v52 + OBJC_IVAR____TtC7healthd14LogEntryWriter_fileHandle);
    *(void *)(v52 + OBJC_IVAR____TtC7healthd14LogEntryWriter_fileHandle) = v21;

    uint64_t v23 = v54;
    Date.init()();
    uint64_t v24 = v51;
    uint64_t v25 = v53;
    id v26 = *(void (**)(char *))(v53 + 16);
    uint64_t v57 = v51 + OBJC_IVAR___HRLDLogArchiveProcessor_archiveStartDate;
    uint64_t v27 = v55;
    v26(v9);
    if (static Date.< infix(_:_:)())
    {
      uint64_t v28 = v25;
      uint64_t v29 = v24;
      uint64_t v30 = *(void *)(v56 + 16);
      uint64_t v49 = v30;
      v50 = (void (**)(char *, uint64_t))(v28 + 8);
      uint64_t v47 = (void (**)(char *, char *, uint64_t))(v28 + 32);
      v48 = v19 + 2;
      v46 = (uint64_t *)(v56 + 40);
      do
      {
        Date.addingTimeInterval(_:)();
        if (v30)
        {
          swift_bridgeObjectRetain();
          uint64_t v39 = v46;
          uint64_t v40 = v30;
          do
          {
            uint64_t v42 = *(v39 - 1);
            uint64_t v41 = *v39;
            swift_bridgeObjectRetain();
            sub_1000053B4(v29, (uint64_t)v9, v42, v41);
            v39 += 2;
            swift_bridgeObjectRelease();
            --v40;
          }
          while (v40);
          swift_bridgeObjectRelease();
          uint64_t v19 = v58;
          uint64_t v23 = v54;
          uint64_t v27 = v55;
        }
        Date.timeIntervalSinceReferenceDate.getter();
        double v32 = v31;
        Date.timeIntervalSinceReferenceDate.getter();
        double v34 = v32 - v33;
        Date.timeIntervalSinceReferenceDate.getter();
        double v36 = v35;
        Date.timeIntervalSinceReferenceDate.getter();
        v37.n128_f64[0] = v34 / (v36 - v37.n128_f64[0]);
        if (v37.n128_f64[0] > 1.0) {
          v37.n128_f64[0] = 1.0;
        }
        v19[2](v19, v37);
        (*v50)(v9, v27);
        (*v47)(v9, v6, v27);
        char v38 = static Date.< infix(_:_:)();
        uint64_t v30 = v49;
      }
      while ((v38 & 1) != 0);
    }
    v44 = v23;
    sub_100008548();
    id v45 = *(void (**)(char *, uint64_t))(v53 + 8);
    v45(v9, v27);
    v45(v44, v27);
  }
  _Block_release(v19);
}

void sub_1000053B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + OBJC_IVAR___HRLDLogArchiveProcessor_osStore);
  Class isa = Date._bridgeToObjectiveC()().super.isa;
  id v9 = [v7 positionWithDate:isa];

  sub_1000062F8(0, &qword_1000109A0);
  sub_100005F74();
  uint64_t v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_10000A740;
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 64) = sub_100006024();
  *(void *)(v10 + 32) = a3;
  *(void *)(v10 + 40) = a4;
  swift_bridgeObjectRetain();
  Class v11 = Date._bridgeToObjectiveC()().super.isa;
  *(void *)(v10 + 96) = sub_1000062F8(0, &qword_1000109C0);
  *(void *)(v10 + 104) = sub_100006078();
  *(void *)(v10 + 72) = v11;
  uint64_t v12 = NSPredicate.init(format:_:)();
  unint64_t v18 = (unint64_t)&_swiftEmptyArrayStorage;
  OSLogStore.getEntries(with:at:matching:)();
  if (v16)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_retain();
    dispatch thunk of _AnySequenceBox._makeIterator()();
    swift_release();
    swift_retain();
    while (1)
    {
      dispatch thunk of _AnyIteratorBoxBase.next()();
      if (!v17) {
        break;
      }
      id v14 = v17;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
      if (*(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v18 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
      }
      specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized Array._endMutation()();
    }
    swift_release();
    swift_release_n();
    sub_100005650((uint64_t *)&v18, a1);

    swift_bridgeObjectRelease();
  }
}

void sub_100005650(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Date();
  __chkstk_darwin(v6 - 8);
  uint64_t v64 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *a1;
  if ((unint64_t)*a1 >> 62) {
    goto LABEL_24;
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v9; uint64_t v9 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v62 = OBJC_IVAR___HRLDLogArchiveProcessor_dataDetector;
    uint64_t v61 = (uint64_t *)(a2 + OBJC_IVAR___HRLDLogArchiveProcessor_redactedToken);
    uint64_t v60 = (uint64_t *)(a2 + OBJC_IVAR___HRLDLogArchiveProcessor_deviceName);
    uint64_t v59 = OBJC_IVAR___HRLDLogArchiveProcessor_logWriter;
    unint64_t v65 = v8 & 0xC000000000000001;
    uint64_t v10 = 4;
    uint64_t v58 = v8;
    uint64_t v63 = a2;
    uint64_t v57 = v9;
    while (1)
    {
      id v11 = v65 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v8 + 8 * v10);
      uint64_t v12 = v11;
      if (__OFADD__(v10 - 4, 1)) {
        break;
      }
      v81 = &OBJC_PROTOCOL___OSLogEntryFromProcess;
      v82 = &OBJC_PROTOCOL___OSLogEntryWithPayload;
      uint64_t v13 = swift_dynamicCastObjCProtocolConditional();
      if (!v13 || (v14 = (void *)v13, self, (uint64_t v15 = swift_dynamicCastObjCClass()) == 0))
      {
        swift_bridgeObjectRelease();

        return;
      }
      uint64_t v16 = (void *)v15;
      id v83 = v12;
      if (sub_1000060E0(v14))
      {
        id v55 = v83;

        goto LABEL_21;
      }
      uint64_t v66 = v10 - 3;
      uint64_t v67 = v10;
      uint64_t v74 = v3;
      id v17 = [v14 category];
      uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v72 = v19;
      uint64_t v73 = v18;

      id v20 = [v16 composedMessage];
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      id v21 = *(void **)(a2 + v62);
      NSString v22 = String._bridgeToObjectiveC()();
      uint64_t v23 = String.count.getter();
      uint64_t v24 = *v61;
      uint64_t v25 = v61[1];
      NSString v26 = String._bridgeToObjectiveC()();
      id v27 = objc_msgSend(v21, "stringByReplacingMatchesInString:options:range:withTemplate:", v22, 0, 0, v23, v26);

      uint64_t v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v30 = v29;

      uint64_t v31 = *v60;
      unint64_t v32 = v60[1];
      uint64_t v33 = HIBYTE(v32) & 0xF;
      if ((v32 & 0x2000000000000000) == 0) {
        uint64_t v33 = v31 & 0xFFFFFFFFFFFFLL;
      }
      if (v33)
      {
        uint64_t v79 = v28;
        uint64_t v80 = v30;
        uint64_t v77 = v31;
        unint64_t v78 = v32;
        uint64_t v75 = v24;
        uint64_t v76 = v25;
        sub_1000062A4();
        uint64_t v69 = StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
        uint64_t v35 = v34;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v68 = v35;
      }
      else
      {
        swift_bridgeObjectRelease();
        uint64_t v68 = v30;
        uint64_t v69 = v28;
      }
      id v36 = v83;
      id v37 = [v83 date];
      uint64_t v38 = (uint64_t)v64;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      id v39 = [v14 formatString];
      uint64_t v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v70 = v41;
      uint64_t v71 = v40;

      id v42 = [v16 level];
      uint64_t v43 = (int)[v14 processIdentifier];
      id v44 = [v14 process];
      uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v47 = v46;

      id v48 = [v14 subsystem];
      uint64_t v49 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v51 = v50;

      id v52 = objc_allocWithZone((Class)type metadata accessor for LogEntry());
      id v53 = sub_1000068FC(v73, v72, v69, v68, v38, v71, v70, (unint64_t)v42, v43, v45, v47, v49, v51);
      a2 = v63;
      uint64_t v54 = v74;
      sub_100008668();

      uint64_t v3 = v54;
      if (!v54)
      {
        uint64_t v10 = v67 + 1;
        uint64_t v8 = v58;
        if (v66 != v57) {
          continue;
        }
      }
      goto LABEL_21;
    }
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
}

id sub_100005B94()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100005CD8()
{
  return type metadata accessor for LogArchiveProcessor();
}

uint64_t type metadata accessor for LogArchiveProcessor()
{
  uint64_t result = qword_100010988;
  if (!qword_100010988) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100005D2C()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for URL();
    if (v2 <= 0x3F) {
      return swift_updateClassMetadata2();
    }
  }
  return result;
}

id sub_100005E1C(uint64_t a1, SEL *a2)
{
  URL._bridgeToObjectiveC()(__stack_chk_guard);
  uint64_t v5 = v4;
  id v14 = 0;
  id v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, v4, &v14);

  id v7 = v14;
  if (v6)
  {
    uint64_t v8 = type metadata accessor for URL();
    uint64_t v9 = *(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8);
    id v10 = v7;
    v9(a1, v8);
  }
  else
  {
    id v11 = v14;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    uint64_t v12 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(a1, v12);
  }
  return v6;
}

void sub_100005F74()
{
  if (!qword_1000109A8)
  {
    sub_100005FCC();
    unint64_t v0 = type metadata accessor for _ContiguousArrayStorage();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000109A8);
    }
  }
}

unint64_t sub_100005FCC()
{
  unint64_t result = qword_1000109B0;
  if (!qword_1000109B0)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1000109B0);
  }
  return result;
}

unint64_t sub_100006024()
{
  unint64_t result = qword_1000109B8;
  if (!qword_1000109B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000109B8);
  }
  return result;
}

unint64_t sub_100006078()
{
  unint64_t result = qword_1000109C8;
  if (!qword_1000109C8)
  {
    sub_1000062F8(255, &qword_1000109C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000109C8);
  }
  return result;
}

uint64_t sub_1000060E0(void *a1)
{
  id v2 = [a1 subsystem];
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;

  if (v3 == 0xD000000000000013 && v5 == 0x800000010000ACD0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    char v7 = 0;
    if ((v6 & 1) == 0) {
      return v7 & 1;
    }
  }
  id v8 = [a1 formatString];
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  sub_1000062A4();
  LOBYTE(v8) = StringProtocol.contains<A>(_:)();
  swift_bridgeObjectRelease();
  if (v8)
  {
    char v7 = 1;
  }
  else
  {
    id v12 = objc_msgSend(a1, "formatString", 0x3A656369766564, 0xE700000000000000, v9, v11);
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    char v7 = StringProtocol.contains<A>(_:)();
    swift_bridgeObjectRelease();
  }
  return v7 & 1;
}

unint64_t sub_1000062A4()
{
  unint64_t result = qword_100010A90;
  if (!qword_100010A90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010A90);
  }
  return result;
}

uint64_t sub_1000062F8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100006334(unsigned __int8 *a1, char *a2)
{
  return sub_100006340(*a1, *a2);
}

uint64_t sub_100006340(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0x746C7561666564;
  unint64_t v3 = 0xE700000000000000;
  uint64_t v4 = a1;
  uint64_t v5 = 0x746C7561666564;
  switch(v4)
  {
    case 1:
      unint64_t v3 = 0xE400000000000000;
      uint64_t v5 = 1868983913;
      break;
    case 2:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x6775626564;
      break;
    case 3:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x726F727265;
      break;
    case 4:
      unint64_t v3 = 0xE500000000000000;
      uint64_t v5 = 0x746C756166;
      break;
    default:
      break;
  }
  unint64_t v6 = 0xE700000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v6 = 0xE400000000000000;
      if (v5 == 1868983913) {
        goto LABEL_13;
      }
      goto LABEL_16;
    case 2:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x6775626564) {
        goto LABEL_16;
      }
      goto LABEL_13;
    case 3:
      unint64_t v6 = 0xE500000000000000;
      uint64_t v2 = 0x726F727265;
      goto LABEL_12;
    case 4:
      unint64_t v6 = 0xE500000000000000;
      if (v5 != 0x746C756166) {
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

Swift::Int sub_1000064E4()
{
  return Hasher._finalize()();
}

uint64_t sub_1000065C8()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100006694()
{
  return Hasher._finalize()();
}

unint64_t sub_100006774@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_100007E88(*a1);
  *a2 = result;
  return result;
}

void sub_1000067A4(uint64_t *a1@<X8>)
{
  unint64_t v2 = 0xE700000000000000;
  uint64_t v3 = 0x746C7561666564;
  switch(*v1)
  {
    case 1:
      unint64_t v2 = 0xE400000000000000;
      uint64_t v3 = 1868983913;
      goto LABEL_3;
    case 2:
      *a1 = 0x6775626564;
      a1[1] = 0xE500000000000000;
      break;
    case 3:
      *a1 = 0x726F727265;
      a1[1] = 0xE500000000000000;
      break;
    case 4:
      *a1 = 0x746C756166;
      a1[1] = 0xE500000000000000;
      break;
    default:
LABEL_3:
      *a1 = v3;
      a1[1] = v2;
      break;
  }
}

uint64_t sub_10000684C()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_1000068AC()
{
  return RawRepresentable<>.encode(to:)();
}

id sub_1000068FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  ObjectType = (objc_class *)swift_getObjectType();
  NSString v22 = &v13[OBJC_IVAR____TtC7healthd8LogEntry_category];
  void *v22 = a1;
  v22[1] = a2;
  uint64_t v23 = &v13[OBJC_IVAR____TtC7healthd8LogEntry_composedMessage];
  *uint64_t v23 = a3;
  v23[1] = a4;
  uint64_t v24 = &v13[OBJC_IVAR____TtC7healthd8LogEntry_date];
  uint64_t v25 = type metadata accessor for Date();
  uint64_t v26 = *(void *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v24, a5, v25);
  id v27 = &v13[OBJC_IVAR____TtC7healthd8LogEntry_formatString];
  void *v27 = a6;
  v27[1] = a7;
  unint64_t v28 = 0x40305010200uLL >> (8 * a8);
  if (a8 >= 6) {
    LOBYTE(v28) = 5;
  }
  v13[OBJC_IVAR____TtC7healthd8LogEntry_logLevel] = v28;
  *(void *)&v13[OBJC_IVAR____TtC7healthd8LogEntry_processIdentifier] = a9;
  uint64_t v29 = &v13[OBJC_IVAR____TtC7healthd8LogEntry_process];
  *uint64_t v29 = a10;
  v29[1] = a11;
  uint64_t v30 = &v13[OBJC_IVAR____TtC7healthd8LogEntry_subsystem];
  *uint64_t v30 = a12;
  v30[1] = a13;
  v34.receiver = v13;
  v34.super_class = ObjectType;
  id v31 = objc_msgSendSuper2(&v34, "init");
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(a5, v25);
  return v31;
}

unint64_t sub_100006C28(char a1)
{
  unint64_t result = 0x79726F6765746163;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6465736F706D6F63;
      break;
    case 2:
      unint64_t result = 1702125924;
      break;
    case 3:
      unint64_t result = 0x745374616D726F66;
      break;
    case 4:
      unint64_t result = 0x6C6576654C676F6CLL;
      break;
    case 5:
      unint64_t result = 0xD000000000000011;
      break;
    case 6:
      unint64_t result = 0x737365636F7270;
      break;
    case 7:
      unint64_t result = 0x6574737973627573;
      break;
    default:
      return result;
  }
  return result;
}

BOOL sub_100006D3C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_100006D50()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100006D98()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100006DC4()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_100006E08()
{
  return sub_100006C28(*v0);
}

uint64_t sub_100006E10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_1000081C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100006E38()
{
  return 0;
}

void sub_100006E44(unsigned char *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_100006E50(uint64_t a1)
{
  unint64_t v2 = sub_100007C50();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006E8C(uint64_t a1)
{
  unint64_t v2 = sub_100007C50();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100006F9C()
{
  return type metadata accessor for LogEntry();
}

uint64_t type metadata accessor for LogEntry()
{
  uint64_t result = qword_100010AD8;
  if (!qword_100010AD8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100006FF0()
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

unsigned char *initializeBufferWithCopyOfBuffer for LogEntry.LogLevel(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for LogEntry.LogLevel(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LogEntry.LogLevel(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *uint64_t result = a2 + 4;
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
        JUMPOUT(0x100007214);
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
          *uint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

uint64_t sub_10000723C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100007248(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for LogEntry.LogLevel()
{
  return &type metadata for LogEntry.LogLevel;
}

unint64_t sub_100007264()
{
  unint64_t result = qword_100010AE8;
  if (!qword_100010AE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010AE8);
  }
  return result;
}

uint64_t sub_1000072B8(void *a1)
{
  uint64_t v3 = v1;
  sub_100007D8C(0, &qword_100010B10, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for KeyedEncodingContainer);
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v9 = &v11[-v8];
  sub_100007CA4(a1, a1[3]);
  sub_100007C50();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v11[15] = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v2)
  {
    v11[14] = 1;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[13] = 2;
    type metadata accessor for Date();
    sub_100007DF0(&qword_100010B18);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
    v11[12] = 3;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[11] = *(unsigned char *)(v3 + OBJC_IVAR____TtC7healthd8LogEntry_logLevel);
    v11[10] = 4;
    sub_100007E34();
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
    v11[9] = 5;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[8] = 6;
    KeyedEncodingContainer.encode(_:forKey:)();
    v11[7] = 7;
    KeyedEncodingContainer.encode(_:forKey:)();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

id sub_1000075C0(void *a1)
{
  uint64_t v3 = v1;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = type metadata accessor for Date();
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007D8C(0, &qword_100010AF0, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))&type metadata accessor for KeyedDecodingContainer);
  uint64_t v36 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v35 - v10;
  uint64_t v12 = a1[3];
  id v39 = a1;
  sub_100007CA4(a1, v12);
  sub_100007C50();
  uint64_t v13 = v3;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
  {
    id v34 = 0;
    sub_100007CE8((uint64_t)v39);

    swift_deallocPartialClassInstance();
  }
  else
  {
    uint64_t v14 = v9;
    char v43 = 0;
    uint64_t v15 = KeyedDecodingContainer.decode(_:forKey:)();
    id v17 = (uint64_t *)&v13[OBJC_IVAR____TtC7healthd8LogEntry_category];
    *id v17 = v15;
    v17[1] = v18;
    char v43 = 1;
    uint64_t v19 = KeyedDecodingContainer.decode(_:forKey:)();
    id v20 = (uint64_t *)&v13[OBJC_IVAR____TtC7healthd8LogEntry_composedMessage];
    uint64_t *v20 = v19;
    v20[1] = v21;
    char v43 = 2;
    sub_100007DF0(&qword_100010B00);
    uint64_t v22 = v38;
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(char *, char *, uint64_t))(v37 + 32))(&v13[OBJC_IVAR____TtC7healthd8LogEntry_date], v7, v22);
    char v43 = 3;
    uint64_t v23 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v24 = (uint64_t *)&v13[OBJC_IVAR____TtC7healthd8LogEntry_formatString];
    *uint64_t v24 = v23;
    v24[1] = v25;
    char v42 = 4;
    sub_100007D38();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    uint64_t v26 = (uint64_t)v39;
    id v27 = (objc_class *)ObjectType;
    v13[OBJC_IVAR____TtC7healthd8LogEntry_logLevel] = v43;
    char v43 = 5;
    *(void *)&v13[OBJC_IVAR____TtC7healthd8LogEntry_processIdentifier] = KeyedDecodingContainer.decode(_:forKey:)();
    char v43 = 6;
    uint64_t v28 = KeyedDecodingContainer.decode(_:forKey:)();
    uint64_t v29 = (uint64_t *)&v13[OBJC_IVAR____TtC7healthd8LogEntry_process];
    *uint64_t v29 = v28;
    v29[1] = v30;
    char v43 = 7;
    uint64_t v31 = KeyedDecodingContainer.decode(_:forKey:)();
    unint64_t v32 = (uint64_t *)&v13[OBJC_IVAR____TtC7healthd8LogEntry_subsystem];
    *unint64_t v32 = v31;
    v32[1] = v33;

    v41.receiver = v13;
    v41.super_class = v27;
    id v34 = objc_msgSendSuper2(&v41, "init");
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v36);
    sub_100007CE8(v26);
  }
  return v34;
}

id sub_100007BDC@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id v6 = objc_allocWithZone(v2);
  id result = sub_1000075C0(a1);
  if (!v3) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_100007C2C(void *a1)
{
  return sub_1000072B8(a1);
}

unint64_t sub_100007C50()
{
  unint64_t result = qword_100010AF8;
  if (!qword_100010AF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010AF8);
  }
  return result;
}

void *sub_100007CA4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100007CE8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_100007D38()
{
  unint64_t result = qword_100010B08;
  if (!qword_100010B08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B08);
  }
  return result;
}

void sub_100007D8C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  if (!*a2)
  {
    unint64_t v6 = sub_100007C50();
    unint64_t v7 = a3(a1, &type metadata for LogEntry.CodingKeys, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t sub_100007DF0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for Date();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100007E34()
{
  unint64_t result = qword_100010B20;
  if (!qword_100010B20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B20);
  }
  return result;
}

unint64_t sub_100007E88(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10000C700, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 5) {
    return 5;
  }
  else {
    return v3;
  }
}

unint64_t sub_100007ED4()
{
  unint64_t result = qword_100010B28;
  if (!qword_100010B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B28);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for LogEntry.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for LogEntry.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100008084);
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

ValueMetadata *type metadata accessor for LogEntry.CodingKeys()
{
  return &type metadata for LogEntry.CodingKeys;
}

unint64_t sub_1000080C0()
{
  unint64_t result = qword_100010B30;
  if (!qword_100010B30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B30);
  }
  return result;
}

unint64_t sub_100008118()
{
  unint64_t result = qword_100010B38;
  if (!qword_100010B38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B38);
  }
  return result;
}

unint64_t sub_100008170()
{
  unint64_t result = qword_100010B40;
  if (!qword_100010B40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B40);
  }
  return result;
}

uint64_t sub_1000081C4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x79726F6765746163 && a2 == 0xE800000000000000;
  if (v2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6465736F706D6F63 && a2 == 0xEF6567617373654DLL {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1702125924 && a2 == 0xE400000000000000 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x745374616D726F66 && a2 == 0xEC000000676E6972 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C6576654C676F6CLL && a2 == 0xE800000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x800000010000AD80 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x737365636F7270 && a2 == 0xE700000000000000 {
         || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  }
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x6574737973627573 && a2 == 0xE90000000000006DLL)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 7;
    }
    else {
      return 8;
    }
  }
}

void sub_100008548()
{
  uint64_t v2 = OBJC_IVAR____TtC7healthd14LogEntryWriter_fileHandle;
  int v3 = *(void **)(v0 + OBJC_IVAR____TtC7healthd14LogEntryWriter_fileHandle);
  if (v3)
  {
    uint64_t v4 = v0;
    id v5 = v3;
    char v6 = (void *)sub_1000089C4(0x5D0AuLL, 0xE200000000000000);
    unint64_t v8 = (unint64_t)v7;
    v12[0] = v6;
    v12[1] = v7;
    sub_10000910C();
    NSFileHandle.write<A>(contentsOf:)();
    sub_100009160((uint64_t)v6, v8);

    if (!v1)
    {
      uint64_t v9 = *(void **)(v4 + v2);
      if (v9)
      {
        v12[0] = 0;
        if ([v9 closeAndReturnError:v12])
        {
          id v10 = v12[0];
        }
        else
        {
          id v11 = v12[0];
          _convertNSErrorToError(_:)();

          swift_willThrow();
        }
      }
    }
  }
}

uint64_t sub_100008668()
{
  uint64_t v2 = v0;
  type metadata accessor for LogEntry();
  sub_1000090B4();
  uint64_t result = dispatch thunk of JSONEncoder.encode<A>(_:)();
  if (v1) {
    return result;
  }
  uint64_t v5 = result;
  unint64_t v6 = v4;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC7healthd14LogEntryWriter_isFirstSample) == 1)
  {
    *(unsigned char *)(v0 + OBJC_IVAR____TtC7healthd14LogEntryWriter_isFirstSample) = 0;
    BOOL v7 = *(void **)(v0 + OBJC_IVAR____TtC7healthd14LogEntryWriter_fileHandle);
    if (v7)
    {
      id v8 = v7;
      unint64_t v9 = 2651;
LABEL_7:
      uint64_t v11 = sub_1000089C4(v9, 0xE200000000000000);
      unint64_t v13 = v12;
      sub_10000910C();
      NSFileHandle.write<A>(contentsOf:)();
      sub_100009160(v11, v13);
    }
  }
  else
  {
    id v10 = *(void **)(v0 + OBJC_IVAR____TtC7healthd14LogEntryWriter_fileHandle);
    if (v10)
    {
      id v8 = v10;
      unint64_t v9 = 2604;
      goto LABEL_7;
    }
  }
  uint64_t v14 = *(void **)(v2 + OBJC_IVAR____TtC7healthd14LogEntryWriter_fileHandle);
  if (v14)
  {
    sub_10000910C();
    id v15 = v14;
    NSFileHandle.write<A>(contentsOf:)();
  }
  return sub_100009160(v5, v6);
}

id sub_1000087DC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = type metadata accessor for JSONEncoder.DateEncodingStrategy();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = OBJC_IVAR____TtC7healthd14LogEntryWriter_encoder;
  type metadata accessor for JSONEncoder();
  swift_allocObject();
  id v10 = v1;
  uint64_t v11 = JSONEncoder.init()();
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for JSONEncoder.DateEncodingStrategy.iso8601(_:), v5);
  dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
  *(void *)&v2[v9] = v11;
  *(void *)&v10[OBJC_IVAR____TtC7healthd14LogEntryWriter_fileHandle] = 0;
  v10[OBJC_IVAR____TtC7healthd14LogEntryWriter_isFirstSample] = 1;
  unint64_t v12 = &v10[OBJC_IVAR____TtC7healthd14LogEntryWriter_fileURL];
  uint64_t v13 = type metadata accessor for URL();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v12, a1, v13);

  v17.receiver = v10;
  v17.super_class = ObjectType;
  id v15 = objc_msgSendSuper2(&v17, "init");
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(a1, v13);
  return v15;
}

uint64_t sub_1000089C4(unint64_t a1, unint64_t a2)
{
  *(void *)&long long v40 = a1;
  *((void *)&v40 + 1) = a2;
  sub_1000091B8();
  swift_bridgeObjectRetain();
  if (swift_dynamicCast())
  {
    sub_100009BB4(v38, (uint64_t)&v41);
    sub_100007CA4(&v41, v43);
    dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
    swift_bridgeObjectRelease();
    v38[0] = v40;
    sub_100007CE8((uint64_t)&v41);
    return *(void *)&v38[0];
  }
  uint64_t v39 = 0;
  memset(v38, 0, sizeof(v38));
  sub_100009210((uint64_t)v38);
  unint64_t v2 = a1;
  unint64_t v3 = a2;
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = a1;
      uint64_t v42 = a2 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v6 = (char *)&v41 + (HIBYTE(a2) & 0xF);
      uint64_t v7 = &v41;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        uint64_t v5 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        uint64_t v4 = _StringObject.sharedUTF8.getter();
      }
      if (v4) {
        uint64_t v6 = (unsigned char *)(v4 + v5);
      }
      else {
        uint64_t v6 = 0;
      }
      uint64_t v7 = (uint64_t *)v4;
    }
    id v8 = sub_100009A30(v7, v6);
    unint64_t v10 = v9;
    if (v9 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(void *)&v38[0] = v8;
      *((void *)&v38[0] + 1) = v10;
      return *(void *)&v38[0];
    }
    unint64_t v2 = a1;
    unint64_t v3 = a2;
    if ((a2 & 0x1000000000000000) == 0) {
      goto LABEL_14;
    }
LABEL_70:
    Swift::Int v11 = String.UTF8View._foreignCount()();
    goto LABEL_17;
  }
LABEL_69:
  id v8 = 0;
  unint64_t v10 = 0xF000000000000000;
  if ((v3 & 0x1000000000000000) != 0) {
    goto LABEL_70;
  }
LABEL_14:
  if ((v3 & 0x2000000000000000) != 0) {
    Swift::Int v11 = HIBYTE(v3) & 0xF;
  }
  else {
    Swift::Int v11 = v2 & 0xFFFFFFFFFFFFLL;
  }
LABEL_17:
  *(void *)&v38[0] = sub_100009A94(v11);
  *((void *)&v38[0] + 1) = v12;
  __chkstk_darwin(*(void *)&v38[0]);
  unint64_t v13 = (unint64_t)sub_1000092C4((void *(*)(uint64_t *__return_ptr, char *, char *))sub_100009B34);
  uint64_t v16 = *((void *)&v38[0] + 1) >> 62;
  uint64_t v17 = v13;
  uint64_t v18 = v3;
  unint64_t v19 = v14;
  switch(*((void *)&v38[0] + 1) >> 62)
  {
    case 1:
      LODWORD(v20) = DWORD1(v38[0]) - LODWORD(v38[0]);
      if (__OFSUB__(DWORD1(v38[0]), v38[0])) {
        goto LABEL_73;
      }
      uint64_t v20 = (int)v20;
LABEL_23:
      if (v15 != v20)
      {
        if (v16)
        {
          if (v16 == 1) {
            uint64_t v24 = *(uint64_t *)&v38[0] >> 32;
          }
          else {
            uint64_t v24 = *(void *)(*(void *)&v38[0] + 24);
          }
        }
        else
        {
          uint64_t v24 = BYTE14(v38[0]);
        }
LABEL_61:
        if (v24 < v15)
        {
          __break(1u);
LABEL_73:
          __break(1u);
LABEL_74:
          __break(1u);
        }
        Data._Representation.replaceSubrange(_:with:count:)();
LABEL_63:
        swift_bridgeObjectRelease();
        goto LABEL_64;
      }
LABEL_29:
      if ((v3 & 0x2000000000000000) != 0) {
        unint64_t v25 = HIBYTE(v3) & 0xF;
      }
      else {
        unint64_t v25 = v13 & 0xFFFFFFFFFFFFLL;
      }
      *(void *)((char *)&v40 + 7) = 0;
      *(void *)&long long v40 = 0;
      if (4 * v25 == v14 >> 14) {
        goto LABEL_58;
      }
      LOBYTE(v26) = 0;
      uint64_t v27 = (v13 >> 59) & 1;
      if ((v3 & 0x1000000000000000) == 0) {
        LOBYTE(v27) = 1;
      }
      uint64_t v28 = 4 << v27;
      uint64_t v35 = v3 & 0xFFFFFFFFFFFFFFLL;
      uint64_t v33 = (uint64_t)v8;
      uint64_t v34 = (v3 & 0xFFFFFFFFFFFFFFFLL) + 32;
      break;
    case 2:
      uint64_t v22 = *(void *)(*(void *)&v38[0] + 16);
      uint64_t v21 = *(void *)(*(void *)&v38[0] + 24);
      BOOL v23 = __OFSUB__(v21, v22);
      uint64_t v20 = v21 - v22;
      if (!v23) {
        goto LABEL_23;
      }
      goto LABEL_74;
    case 3:
      if (!v15) {
        goto LABEL_29;
      }
      uint64_t v24 = 0;
      goto LABEL_61;
    default:
      uint64_t v20 = BYTE14(v38[0]);
      goto LABEL_23;
  }
  do
  {
    unint64_t v29 = v19 & 0xC;
    unint64_t v2 = v19;
    if (v29 == v28) {
      unint64_t v2 = sub_100009764(v19, v17, v18);
    }
    unint64_t v30 = v2 >> 16;
    if (v2 >> 16 >= v25)
    {
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
      goto LABEL_69;
    }
    if ((v18 & 0x1000000000000000) != 0)
    {
      unint64_t v2 = String.UTF8View._foreignSubscript(position:)();
      char v31 = v2;
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else if ((v18 & 0x2000000000000000) != 0)
    {
      uint64_t v41 = v17;
      uint64_t v42 = v35;
      char v31 = *((unsigned char *)&v41 + v30);
      if (v29 != v28) {
        goto LABEL_47;
      }
    }
    else
    {
      unint64_t v2 = v34;
      if ((v17 & 0x1000000000000000) == 0) {
        unint64_t v2 = _StringObject.sharedUTF8.getter();
      }
      char v31 = *(unsigned char *)(v2 + v30);
      if (v29 != v28)
      {
LABEL_47:
        if ((v18 & 0x1000000000000000) == 0) {
          goto LABEL_48;
        }
        goto LABEL_51;
      }
    }
    unint64_t v2 = sub_100009764(v19, v17, v18);
    unint64_t v19 = v2;
    if ((v18 & 0x1000000000000000) == 0)
    {
LABEL_48:
      unint64_t v19 = (v19 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_53;
    }
LABEL_51:
    if (v25 <= v19 >> 16) {
      goto LABEL_68;
    }
    unint64_t v2 = String.UTF8View._foreignIndex(after:)();
    unint64_t v19 = v2;
LABEL_53:
    *((unsigned char *)&v40 + v26) = v31;
    unsigned int v26 = v26 + 1;
    if ((v26 >> 8)) {
      goto LABEL_67;
    }
    BYTE14(v40) = v26;
    if (v26 == 14)
    {
      uint64_t v41 = v40;
      LODWORD(v42) = DWORD2(v40);
      WORD2(v42) = WORD6(v40);
      Data._Representation.append(contentsOf:)();
      LOBYTE(v26) = 0;
      BYTE14(v40) = 0;
    }
  }
  while (4 * v25 != v19 >> 14);
  id v8 = (unsigned char *)v33;
  if ((_BYTE)v26)
  {
    uint64_t v41 = v40;
    LODWORD(v42) = DWORD2(v40);
    WORD2(v42) = WORD6(v40);
    Data._Representation.append(contentsOf:)();
    sub_100009BA0(v33, v10);
    goto LABEL_63;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  sub_100009BA0((uint64_t)v8, v10);
LABEL_64:
  swift_bridgeObjectRelease();
  return *(void *)&v38[0];
}

uint64_t sub_100008FB0()
{
  return type metadata accessor for LogEntryWriter();
}

uint64_t type metadata accessor for LogEntryWriter()
{
  uint64_t result = qword_100010B88;
  if (!qword_100010B88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100009004()
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

unint64_t sub_1000090B4()
{
  unint64_t result = qword_100010B98;
  if (!qword_100010B98)
  {
    type metadata accessor for LogEntry();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010B98);
  }
  return result;
}

unint64_t sub_10000910C()
{
  unint64_t result = qword_100010BA0;
  if (!qword_100010BA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010BA0);
  }
  return result;
}

uint64_t sub_100009160(uint64_t a1, unint64_t a2)
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

unint64_t sub_1000091B8()
{
  unint64_t result = qword_100010BA8;
  if (!qword_100010BA8)
  {
    unint64_t result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_100010BA8);
  }
  return result;
}

uint64_t sub_100009210(uint64_t a1)
{
  sub_10000926C();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_10000926C()
{
  if (!qword_100010BB0)
  {
    sub_1000091B8();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100010BB0);
    }
  }
}

char *sub_1000092C4(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_10000AA40;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (__DataStorage._bytes.getter() && __OFSUB__((int)v4, __DataStorage._offset.getter())) {
        goto LABEL_24;
      }
      type metadata accessor for __DataStorage();
      swift_allocObject();
      uint64_t v13 = __DataStorage.init(bytes:length:copy:deallocator:offset:)();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      unint64_t result = sub_1000096B0((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      Data.LargeSlice.ensureUniqueReference()();
      unint64_t result = sub_1000096B0(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        unint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

unsigned char *sub_1000095C8@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    unint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    unint64_t result = (unsigned char *)sub_10000986C(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    unint64_t result = (unsigned char *)sub_100009930((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    unint64_t result = (unsigned char *)sub_1000099AC((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void *sub_100009640(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  unint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_1000096B0(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  unint64_t result = (char *)__DataStorage._bytes.getter();
  if (!result) {
    goto LABEL_12;
  }
  uint64_t v8 = result;
  unint64_t result = (char *)__DataStorage._offset.getter();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = __DataStorage._length.getter();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  unint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

uint64_t sub_100009764(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = String.UTF16View.index(_:offsetBy:)();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = String.UTF8View._foreignIndex(_:offsetBy:)();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_1000097E0@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  if (result)
  {
    swift_bridgeObjectRetain();
    unint64_t result = _StringGuts.copyUTF8(into:)();
    if ((v3 & 1) == 0)
    {
      uint64_t v4 = result;
      unint64_t result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000986C(unsigned char *__src, unsigned char *a2)
{
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_100009930(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for Data.RangeReference();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1000099AC(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  type metadata accessor for __DataStorage();
  swift_allocObject();
  uint64_t result = __DataStorage.init(bytes:length:)();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

unsigned char *sub_100009A30(unsigned char *result, unsigned char *a2)
{
  if (result)
  {
    uint64_t v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (unsigned char *)sub_10000986C(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (unsigned char *)sub_100009930((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (unsigned char *)sub_1000099AC((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_100009A94(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      type metadata accessor for __DataStorage();
      swift_allocObject();
      __DataStorage.init(length:)();
      if (v1 >= 0x7FFFFFFF)
      {
        type metadata accessor for Data.RangeReference();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

void *sub_100009B34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  char v5 = *(uint64_t **)(v3 + 16);
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  id v12[2] = v13;
  uint64_t result = sub_100009640((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_100009BCC, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_100009BA0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100009160(a1, a2);
  }
  return a1;
}

uint64_t sub_100009BB4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100009BCC@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  return sub_1000097E0(a1, a2);
}

void sub_100009BEC(os_log_t log)
{
  *(_WORD *)unint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "**** HEALTHD HAS UIKIT AS A DEPENDENCY ****", v1, 2u);
}

uint64_t type metadata accessor for JSONEncoder.DateEncodingStrategy()
{
  return type metadata accessor for JSONEncoder.DateEncodingStrategy();
}

uint64_t dispatch thunk of JSONEncoder.dateEncodingStrategy.setter()
{
  return dispatch thunk of JSONEncoder.dateEncodingStrategy.setter();
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

uint64_t __DataStorage.init(bytes:length:copy:deallocator:offset:)()
{
  return __DataStorage.init(bytes:length:copy:deallocator:offset:)();
}

uint64_t __DataStorage.init(bytes:length:)()
{
  return __DataStorage.init(bytes:length:)();
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage.init(length:)()
{
  return __DataStorage.init(length:)();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t type metadata accessor for __DataStorage()
{
  return type metadata accessor for __DataStorage();
}

uint64_t dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)()
{
  return dispatch thunk of ContiguousBytes.withUnsafeBytes<A>(_:)();
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::String __swiftcall URL.path(percentEncoded:)(Swift::Bool percentEncoded)
{
  uint64_t v1 = URL.path(percentEncoded:)(percentEncoded);
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

Swift::Void __swiftcall Data.LargeSlice.ensureUniqueReference()()
{
}

uint64_t type metadata accessor for Data.RangeReference()
{
  return type metadata accessor for Data.RangeReference();
}

uint64_t Data._Representation.replaceSubrange(_:with:count:)()
{
  return Data._Representation.replaceSubrange(_:with:count:)();
}

uint64_t Data._Representation.append(contentsOf:)()
{
  return Data._Representation.append(contentsOf:)();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return Date.timeIntervalSinceReferenceDate.getter();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)Date._bridgeToObjectiveC()();
}

uint64_t static Date.< infix(_:_:)()
{
  return static Date.< infix(_:_:)();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.UTF8View._foreignIndex(after:)()
{
  return String.UTF8View._foreignIndex(after:)();
}

uint64_t String.UTF8View._foreignIndex(_:offsetBy:)()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t String.UTF8View._foreignSubscript(position:)()
{
  return String.UTF8View._foreignSubscript(position:)();
}

uint64_t String.UTF16View.index(_:offsetBy:)()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t RawRepresentable<>.encode(to:)()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t RawRepresentable<>.init(from:)()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
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

uint64_t OSLogStore.getEntries(with:at:matching:)()
{
  return OSLogStore.getEntries(with:at:matching:)();
}

uint64_t NSPredicate.init(format:_:)()
{
  return NSPredicate.init(format:_:)();
}

uint64_t NSFileHandle.write<A>(contentsOf:)()
{
  return NSFileHandle.write<A>(contentsOf:)();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)()
{
  return StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
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

uint64_t dispatch thunk of _AnySequenceBox._makeIterator()()
{
  return dispatch thunk of _AnySequenceBox._makeIterator()();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t dispatch thunk of _AnyIteratorBoxBase.next()()
{
  return dispatch thunk of _AnyIteratorBoxBase.next()();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t type metadata accessor for _ContiguousArrayStorage()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
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

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

NSString *NSHomeDirectory(void)
{
  return _NSHomeDirectory();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _HKInitializeLogging()
{
  return __HKInitializeLogging();
}

{
}

{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return _swift_getExistentialTypeMetadata();
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

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_currentOSBuild(void *a1, const char *a2, ...)
{
  return _[a1 currentOSBuild];
}

id objc_msgSend_demoDataDirectory(void *a1, const char *a2, ...)
{
  return _[a1 demoDataDirectory];
}

id objc_msgSend_disallowHKHealthStoreCreation(void *a1, const char *a2, ...)
{
  return _[a1 disallowHKHealthStoreCreation];
}

id objc_msgSend_initWithContainerDirectoryPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainerDirectoryPath:");
}

id objc_msgSend_initWithHealthDirectoryPath_medicalIDDirectoryPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHealthDirectoryPath:medicalIDDirectoryPath:");
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isAppleInternalInstall];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_processHasLoadedUIKit(void *a1, const char *a2, ...)
{
  return _[a1 processHasLoadedUIKit];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}