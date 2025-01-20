uint64_t sub_100004CB8(int a1)
{
  if ((a1 - 1) > 2) {
    return 0x6E776F6E6B6E55;
  }
  else {
    return qword_100010FB0[a1 - 1];
  }
}

void sub_100004CF8()
{
  byte_100019200 = 1;
  qword_100019210 = 0xEA00000000005832;
}

void variable initialization expression of CKDMain_Swift.serialQueue()
{
  sub_10000CAE4();
  uint64_t v1 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  sub_10000CA2C();
  uint64_t v3 = v2;
  ((void (*)(void))__chkstk_darwin)();
  sub_10000CE50();
  type metadata accessor for OS_dispatch_queue.Attributes();
  sub_10000CA60();
  ((void (*)(void))__chkstk_darwin)();
  sub_10000CB58();
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = sub_10000CBC8(v4);
  __chkstk_darwin(v5);
  sub_10000CE68();
  sub_10000C80C(0, &qword_100018B80);
  static DispatchQoS.unspecified.getter();
  sub_10000C150(&qword_100018B88, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100004ED8(&qword_100018B90);
  sub_100004F1C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v0, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v1);
  OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  sub_10000CACC();
}

uint64_t sub_100004ED8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100004F1C()
{
  unint64_t result = qword_100018B98;
  if (!qword_100018B98)
  {
    sub_100004F70(&qword_100018B90);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018B98);
  }
  return result;
}

uint64_t sub_100004F70(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t variable initialization expression of CKDMain_Swift.systemAvailableForCacheDelete()
{
  return 0;
}

Swift::Void __swiftcall CKDMain_Swift.markSystemAvailableForCacheDelete()()
{
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_serialQueue];
  uint64_t v2 = sub_10000CF20();
  *(void *)(v2 + 16) = v0;
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = sub_100005150;
  *(void *)(v3 + 24) = v2;
  v8[4] = sub_10000516C;
  v8[5] = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 1107296256;
  v8[2] = sub_100005194;
  v8[3] = &unk_100014B78;
  uint64_t v4 = _Block_copy(v8);
  uint64_t v5 = v1;
  v6 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v5, v4);

  _Block_release(v4);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if (isEscapingClosureAtFileLocation) {
    __break(1u);
  }
}

uint64_t sub_100005118()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100005150()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_systemAvailableForCacheDelete) = 1;
}

uint64_t sub_10000516C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100005194(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1000051BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000051CC()
{
  return swift_release();
}

unint64_t variable initialization expression of CKDMain_Swift.CACHE_DELETE_LISTENER()
{
  return 0xD00000000000001DLL;
}

unint64_t variable initialization expression of CKDMain_Swift.CACHE_DELETE_SYSTEM_LISTENER()
{
  return 0xD000000000000024;
}

uint64_t variable initialization expression of CKDMain_Swift.cloudAssetsServiceListener()
{
  return 0;
}

uint64_t sub_10000525C(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_cloudAssetsServiceListener) = a1;
  return swift_release();
}

void sub_100005274()
{
  sub_10000CAE4();
  uint64_t v22 = v0;
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v18 = sub_100004ED8(&qword_100018C58);
  uint64_t v19 = sub_10000CBC8(v18);
  __chkstk_darwin(v19);
  sub_10000CE20();
  uint64_t v20 = type metadata accessor for TaskPriority();
  sub_100009CBC(v1, 1, 1, v20);
  v21 = (void *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = v17;
  v21[5] = v15;
  v21[6] = v13;
  v21[7] = v11;
  v21[8] = v9;
  v21[9] = v7;
  v21[10] = v5;
  v21[11] = v3;
  v21[12] = v22;
  swift_bridgeObjectRetain();
  sub_100005D48(v1, (uint64_t)&unk_100018C68, (uint64_t)v21);
  swift_release();
  sub_10000CACC();
}

uint64_t sub_10000537C()
{
  sub_10000CF38();
  *(void *)(v0 + 88) = v12;
  *(_OWORD *)(v0 + 72) = v11;
  *(void *)(v0 + 56) = v1;
  *(void *)(v0 + 64) = v2;
  *(void *)(v0 + 40) = v3;
  *(void *)(v0 + 48) = v4;
  *(void *)(v0 + 32) = v5;
  uint64_t v6 = sub_100004ED8(&qword_100018C80);
  sub_10000CBC8(v6);
  *(void *)(v0 + 96) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Logger();
  *(void *)(v0 + 104) = v7;
  sub_10000CB90(v7);
  *(void *)(v0 + 112) = v8;
  *(void *)(v0 + 120) = swift_task_alloc();
  *(void *)(v0 + 128) = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10000546C, 0, 0);
}

uint64_t sub_10000546C()
{
  uint64_t v64 = v0;
  uint64_t v1 = (void *)(v0 + 32);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v59 = v1[7];
  uint64_t v56 = v1[5];
  uint64_t v57 = v1[6];
  uint64_t v54 = v1[3];
  uint64_t v55 = v1[4];
  uint64_t v3 = v1[1];
  uint64_t v53 = v1[2];
  sub_100004ED8(&qword_100018C88);
  uint64_t v4 = (int *)(sub_100004ED8(&qword_100018C90) - 8);
  uint64_t v5 = *(void *)(*(void *)v4 + 72);
  unint64_t v6 = (*(unsigned __int8 *)(*(void *)v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)v4 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100010D80;
  uint64_t v8 = (void *)(v7 + v6);
  uint64_t v9 = (void *)((char *)v8 + v4[14]);
  *uint64_t v8 = 0x79636E65677275;
  v8[1] = 0xE700000000000000;
  *uint64_t v9 = v2;
  v9[1] = v3;
  uint64_t v10 = enum case for EventValue.string(_:);
  uint64_t v11 = type metadata accessor for EventValue();
  sub_10000CA60();
  uint64_t v13 = *(void (**)(void))(v12 + 104);
  ((void (*)(void *, uint64_t, uint64_t))v13)(v9, v10, v11);
  uint64_t v14 = (void *)((char *)v8 + v5);
  uint64_t v15 = (void *)((char *)v8 + v5 + v4[14]);
  *uint64_t v14 = 0x756F437365747962;
  v14[1] = 0xEA0000000000746ELL;
  *uint64_t v15 = v53;
  v13();
  uint64_t v16 = (void *)sub_10000CDF8((uint64_t)v8 + 2 * v5);
  *uint64_t v17 = 0xD000000000000010;
  v17[1] = v18;
  uint64_t v19 = sub_10000CAB4(v16, v54);
  ((void (*)(void *))v13)(v19);
  uint64_t v20 = (void *)((char *)v8 + 3 * v5);
  v21 = (void *)((char *)v20 + v4[14]);
  *uint64_t v20 = 0xD000000000000013;
  v20[1] = 0x80000001000111E0;
  uint64_t v22 = sub_10000CAB4(v21, v55);
  ((void (*)(void *))v13)(v22);
  v23 = (void *)((char *)v8 + 4 * v5);
  v24 = (void *)((char *)v23 + v4[14]);
  void *v23 = 0x756F4373656C6966;
  v23[1] = 0xEA0000000000746ELL;
  v25 = sub_10000CAB4(v24, v56);
  ((void (*)(void *))v13)(v25);
  v26 = (void *)sub_10000CDF8((uint64_t)v8 + 5 * v5);
  void *v27 = 0xD000000000000010;
  v27[1] = v28;
  v29 = sub_10000CAB4(v26, v57);
  ((void (*)(void *))v13)(v29);
  v30 = (void *)sub_10000CDF8((uint64_t)v8 + 6 * v5);
  void *v31 = 0xD000000000000013;
  v31[1] = v32;
  v33 = sub_10000CAB4(v30, v59);
  ((void (*)(void *))v13)(v33);
  swift_bridgeObjectRetain();
  uint64_t v34 = Dictionary.init(dictionaryLiteral:)();
  v1[13] = v34;
  CKLog.getter();
  swift_bridgeObjectRetain_n();
  v35 = Logger.logObject.getter();
  os_log_type_t v36 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = v62;
    uint64_t v58 = v62[14];
    uint64_t v60 = v62[13];
    uint64_t v61 = v62[16];
    v38 = (uint8_t *)sub_10000CD18();
    uint64_t v63 = sub_10000CC98();
    *(_DWORD *)v38 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v39 = Dictionary.description.getter();
    unint64_t v41 = v40;
    swift_bridgeObjectRelease();
    v62[3] = sub_100009F70(v39, v41, &v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v35, v36, "reporting asset cache metrics %s", v38, 0xCu);
    swift_arrayDestroy();
    sub_10000CA70();
    sub_10000CA70();

    v42 = *(void (**)(uint64_t, uint64_t))(v58 + 8);
    v42(v61, v60);
  }
  else
  {
    uint64_t v43 = v62[16];
    uint64_t v45 = v62[13];
    uint64_t v44 = v62[14];
    swift_bridgeObjectRelease_n();

    v42 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
    v42(v43, v45);
    v37 = v62;
  }
  v37[18] = v42;
  type metadata accessor for Reporter();
  if (qword_100019208 != -1) {
    swift_once();
  }
  uint64_t v46 = v37[12];
  if (byte_100019200) {
    uint64_t v47 = 0x51424A3241394B34;
  }
  else {
    uint64_t v47 = 0;
  }
  uint64_t v48 = qword_100019210;
  uint64_t v49 = type metadata accessor for TransportConfiguration();
  sub_100009CBC(v46, 1, 1, v49);
  v50 = (void *)swift_task_alloc();
  v37[19] = v50;
  void *v50 = v37;
  v50[1] = sub_100005A04;
  uint64_t v51 = v37[12];
  return static Reporter.report(teamID:eventType:event:transportConfiguration:)(v47, v48, 0xD000000000000010, 0x8000000100011240, v34, v51);
}

uint64_t sub_100005A04()
{
  sub_10000CA48();
  uint64_t v3 = v2;
  uint64_t v5 = *(void *)(v4 + 96);
  uint64_t v6 = *v1;
  sub_10000CC14();
  *uint64_t v7 = v6;
  *(void *)(v3 + 160) = v0;
  swift_task_dealloc();
  sub_10000C7A8(v5, &qword_100018C80);
  swift_bridgeObjectRelease();
  if (!v0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_10000CEE0();
    __asm { BRAA            X1, X16 }
  }
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_100005B70, 0, 0);
}

uint64_t sub_100005B70()
{
  CKLog.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)sub_10000CD18();
    uint64_t v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138412290;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "failed to report asset cache metrics due to error %@", v3, 0xCu);
    sub_100004ED8(&qword_100018C98);
    swift_arrayDestroy();
    sub_10000CA70();
    sub_10000CA70();

    swift_errorRelease();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
  }
  sub_10000CC08();
  v6();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_10000CEE0();
  return v7();
}

uint64_t sub_100005D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  if (sub_100009C30(a1, 1, v6) == 1)
  {
    sub_10000C7A8(a1, &qword_100018C58);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(void *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100005EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  sub_10000CA2C();
  uint64_t v8 = v7;
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v13 + v12, (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v14 = (void *)(v13 + ((v10 + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v14 = a2;
  v14[1] = a3;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = sub_10000C460;
  *(void *)(v15 + 24) = v13;
  aBlock[4] = sub_10000C9F4;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100005194;
  aBlock[3] = &unk_100014D78;
  uint64_t v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  CKMuckingWithPersonas();
  _Block_release(v16);
  LOBYTE(v16) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (v16) {
    __break(1u);
  }
  return result;
}

void sub_1000060B4(void *a1, void *a2, uint64_t a3, void (*a4)(void), uint64_t a5)
{
  uint64_t v74 = a5;
  v75 = a4;
  uint64_t v79 = a3;
  type metadata accessor for Logger();
  sub_10000CA2C();
  uint64_t v82 = v8;
  uint64_t v83 = v7;
  __chkstk_darwin(v7);
  sub_10000CC24();
  v84 = v9;
  __chkstk_darwin(v10);
  v73 = (char *)&v72 - v11;
  uint64_t v12 = sub_100004ED8(&qword_100018CC0);
  sub_10000CA60();
  __chkstk_darwin(v13);
  sub_10000CC38(v14, v72);
  type metadata accessor for URLResourceValues();
  sub_10000CA2C();
  uint64_t v78 = v15;
  __chkstk_darwin(v16);
  sub_10000CE38();
  uint64_t v17 = sub_100004ED8(&qword_100018CC8);
  uint64_t v18 = sub_10000CBC8(v17);
  __chkstk_darwin(v18);
  sub_10000CBD4(v19, v72);
  uint64_t v21 = __chkstk_darwin(v20);
  v23 = (char *)&v72 - v22;
  __chkstk_darwin(v21);
  v81 = (char *)&v72 - v24;
  type metadata accessor for URL();
  sub_10000CA2C();
  uint64_t v85 = v26;
  uint64_t v86 = v25;
  uint64_t v27 = __chkstk_darwin(v25);
  v29 = (char *)&v72 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v27);
  v87 = (char *)&v72 - v30;
  sub_10000C6D0([a1 appContainerTuple]);
  if (v31)
  {
    NSString v32 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v32 = 0;
  }
  int v33 = CKAdoptPersonaID();

  if (!v33) {
    return;
  }
  sub_10000C80C(0, &qword_100018CD0);
  uint64_t v34 = self;
  id v76 = sub_100006A88(a1, a2, [v34 sharedInternalUseContainers]);
  id v35 = [v76 directoryContext];
  id v36 = [v35 fileDownloadDirectory];

  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100004ED8(&qword_100018CD8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100010D90;
  *(void *)(inited + 32) = NSURLVolumeURLKey;
  v38 = NSURLVolumeURLKey;
  sub_100006AF4(inited);
  uint64_t v39 = v88;
  URL.resourceValues(forKeys:)();
  if (v39)
  {
    swift_bridgeObjectRelease();
    uint64_t v40 = v86;
LABEL_7:
    unint64_t v41 = v84;
    CKLog.getter();
    swift_errorRetain();
    swift_errorRetain();
    v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v88 = 0;
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      id v90 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315138;
      v81 = (char *)(v44 + 4);
      uint64_t ErrorValue = swift_getErrorValue();
      __chkstk_darwin(ErrorValue);
      sub_10000CE20();
      (*(void (**)(uint64_t))(v46 + 16))(v40);
      uint64_t v47 = String.init<A>(describing:)();
      uint64_t v89 = sub_100009F70(v47, v48, (uint64_t *)&v90);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "cache_purge: MMCS setup failed: %s", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      sub_10000CC08();
      v49();
LABEL_17:
      sub_10000CC08();
      v57();
      return;
    }

    swift_errorRelease();
    swift_errorRelease();
    swift_errorRelease();
LABEL_16:
    (*(void (**)(char *, uint64_t))(v82 + 8))(v41, v83);
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  uint64_t v50 = (uint64_t)v81;
  URLResourceValues.volume.getter();
  sub_10000CC08();
  v51();
  uint64_t v52 = v85;
  uint64_t v40 = v86;
  (*(void (**)(char *, uint64_t, uint64_t))(v85 + 16))(v23, v79, v86);
  sub_100009CBC((uint64_t)v23, 0, 1, v40);
  uint64_t v53 = *(int *)(v12 + 48);
  uint64_t v54 = v80;
  uint64_t v55 = v80 + v53;
  sub_10000C740(v50, v80);
  sub_10000C740((uint64_t)v23, v55);
  sub_10000CF64(v54);
  if (!v59)
  {
    uint64_t v58 = v77;
    sub_10000C740(v54, v77);
    sub_10000CF64(v55);
    if (!v59)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v52 + 32))(v29, v55, v40);
      sub_10000C150(&qword_100018CB8, (void (*)(uint64_t))&type metadata accessor for URL);
      char v60 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v61 = v58;
      v62 = *(void (**)(char *, uint64_t))(v85 + 8);
      v62(v29, v40);
      sub_10000C7A8((uint64_t)v23, &qword_100018CC8);
      v62((char *)v61, v40);
      uint64_t v50 = (uint64_t)v81;
      uint64_t v52 = v85;
      sub_10000C7A8(v54, &qword_100018CC8);
      id v56 = v76;
      if (v60) {
        goto LABEL_23;
      }
LABEL_27:

      sub_10000C7A8(v50, &qword_100018CC8);
      (*(void (**)(char *, uint64_t))(v52 + 8))(v87, v40);
      return;
    }
    sub_10000C7A8((uint64_t)v23, &qword_100018CC8);
    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v58, v40);
LABEL_21:
    sub_10000C7A8(v54, &qword_100018CC0);
    id v56 = v76;
    goto LABEL_27;
  }
  sub_10000C7A8((uint64_t)v23, &qword_100018CC8);
  sub_10000CF64(v55);
  if (!v59) {
    goto LABEL_21;
  }
  sub_10000C7A8(v54, &qword_100018CC8);
  id v56 = v76;
LABEL_23:
  id v90 = 0;
  if (![v56 setupAssetTransfers:&v90])
  {
    id v68 = v90;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    sub_10000C7A8(v50, &qword_100018CC8);
    goto LABEL_7;
  }
  id v63 = v90;
  sub_10000C7A8(v50, &qword_100018CC8);
  id v64 = [v56 MMCS];
  if (!v64)
  {
    unint64_t v41 = v73;
    CKLog.getter();
    v69 = Logger.logObject.getter();
    os_log_type_t v70 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v71 = 0;
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "cache_purge: container.MMCS nil", v71, 2u);
      swift_slowDealloc();
    }

    goto LABEL_16;
  }
  uint64_t v65 = v64;
  id v66 = [v64 assetCache];
  if (v66)
  {
    v67 = v66;
    v75();

    goto LABEL_17;
  }
  __break(1u);
}

id sub_100006A88(void *a1, void *a2, void *a3)
{
  id v6 = [(id)swift_getObjCClassFromMetadata() containerWithAppContainerAccountTuple:a1 deviceContext:a2 sharedContainerTable:a3];

  return v6;
}

uint64_t sub_100006AF4(uint64_t a1)
{
  type metadata accessor for URLResourceKey(0);
  sub_10000C150(&qword_100018CE0, type metadata accessor for URLResourceKey);
  uint64_t v2 = Set.init(minimumCapacity:)();
  uint64_t v9 = v2;
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      uint64_t v5 = *(void **)(a1 + 8 * i + 32);
      sub_10000AE5C(&v8, v5);
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

void *variable initialization expression of CKDMain_Swift.cachesByVolume()
{
  return &_swiftEmptyDictionarySingleton;
}

void sub_100006BE4()
{
  sub_10000CAE4();
  int v4 = v3;
  uint64_t v62 = v5;
  v57[2] = swift_getObjectType();
  uint64_t v59 = type metadata accessor for URL();
  sub_10000CA2C();
  uint64_t v58 = v6;
  __chkstk_darwin(v7);
  sub_10000CC38(v8, v57[0]);
  type metadata accessor for Logger();
  sub_10000CA2C();
  uint64_t v63 = v10;
  uint64_t v64 = v9;
  __chkstk_darwin(v9);
  sub_10000CC24();
  uint64_t v61 = v11;
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)v57 - v13;
  uint64_t v15 = sub_100004ED8(&qword_100018C50);
  uint64_t v16 = sub_10000CBC8(v15);
  __chkstk_darwin(v16);
  sub_10000CBD4(v17, v57[0]);
  __chkstk_darwin(v18);
  uint64_t v20 = (char *)v57 - v19;
  uint64_t v21 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
  sub_10000CA60();
  __chkstk_darwin(v22);
  sub_10000CE38();
  uint64_t v23 = type metadata accessor for DispatchPredicate();
  sub_10000CA2C();
  uint64_t v25 = v24;
  __chkstk_darwin(v26);
  sub_10000CE50();
  uint64_t v27 = *(void **)(v1 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_serialQueue);
  *uint64_t v2 = v27;
  (*(void (**)(void *, void, uint64_t))(v25 + 104))(v2, enum case for DispatchPredicate.onQueue(_:), v23);
  id v28 = v27;
  LOBYTE(v27) = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v25 + 8))(v2, v23);
  if (v27)
  {
    if (*(unsigned char *)(v1 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_systemAvailableForCacheDelete) != 1
      || (v4 & 0xFFFFFFFE) != 2)
    {
LABEL_29:
      sub_10000CACC();
      return;
    }
    uint64_t v72 = 0;
    uint64_t v73 = 0;
    uint64_t v70 = 0;
    uint64_t v71 = 0;
    uint64_t v68 = 0;
    uint64_t v69 = 0;
    uint64_t v30 = (uint64_t *)(v1 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_cachesByVolume);
    sub_10000CD00();
    uint64_t v31 = *v30;
    swift_bridgeObjectRetain();
    sub_100007264(v62, v31, (uint64_t)v20);
    swift_bridgeObjectRelease();
    if (sub_100009C30((uint64_t)v20, 1, v21) == 1)
    {
      sub_10000C7A8((uint64_t)v20, &qword_100018C50);
    }
    else
    {
      sub_10000BC30((uint64_t)v20, (uint64_t)v0);
      Date.timeIntervalSinceNow.getter();
      if (fabs(v32) < 60.0)
      {
        uint64_t v33 = *v0;
        sub_10000C310((uint64_t)v0);
        uint64_t v34 = 0;
        uint64_t v35 = 0;
        uint64_t v36 = 0;
        uint64_t v71 = v33;
LABEL_15:
        if (v36 > 0 || v33 > 0 || v35 > 0 || v34 >= 1)
        {
          sub_100004CB8(v4);
          sub_100005274();
          swift_bridgeObjectRelease();
        }
        CKLog.getter();
        uint64_t v51 = Logger.logObject.getter();
        os_log_type_t v52 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v51, v52))
        {
          uint64_t v53 = swift_slowAlloc();
          v67[0] = sub_10000CC98();
          *(_DWORD *)uint64_t v53 = 134218242;
          sub_10000CD00();
          uint64_t v65 = v71;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v53 + 12) = 2080;
          uint64_t v54 = sub_100004CB8(v4);
          uint64_t v65 = sub_100009F70(v54, v55, v67);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "Found %lld purgeable bytes, urgency: %s", (uint8_t *)v53, 0x16u);
          swift_arrayDestroy();
          sub_10000CA70();
          sub_10000CA70();
        }

        sub_10000CC08();
        v56();
        sub_10000CD00();
        goto LABEL_29;
      }
      sub_10000C310((uint64_t)v0);
    }
    CKLog.getter();
    v37 = Logger.logObject.getter();
    os_log_type_t v38 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)sub_10000CD18();
      uint64_t v40 = sub_10000CC98();
      v57[1] = (uint64_t)v30;
      v67[0] = v40;
      *(_DWORD *)uint64_t v39 = 136315138;
      uint64_t v41 = sub_100004CB8(v4);
      uint64_t v66 = sub_100009F70(v41, v42, v67);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Querying purgeable space, urgency: %s", v39, 0xCu);
      swift_arrayDestroy();
      sub_10000CA70();
      sub_10000CA70();
    }

    uint64_t v43 = (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v14, v64);
    __chkstk_darwin(v43);
    sub_10000CAFC();
    uint64_t v44 = v62;
    sub_100005EB8(v62, (uint64_t)sub_10000C198, v45);
    uint64_t v46 = v60;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16))(v60, v44, v59);
    uint64_t v33 = v71;
    uint64_t v47 = (uint64_t *)v57[3];
    Date.init()();
    *uint64_t v47 = v33;
    sub_100009CBC((uint64_t)v47, 0, 1, v21);
    swift_beginAccess();
    sub_100007358((uint64_t)v47, v46);
    swift_endAccess();
    uint64_t v36 = v72;
    uint64_t v34 = v68;
    uint64_t v35 = v69;
    goto LABEL_15;
  }
  __break(1u);
}

uint64_t sub_100007264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*(void *)(a2 + 16) && (unint64_t v5 = sub_10000AAA8(a1), (v6 & 1) != 0))
  {
    unint64_t v7 = v5;
    uint64_t v8 = *(void *)(a2 + 56);
    uint64_t v9 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
    sub_10000C36C(v8 + *(void *)(*(void *)(v9 - 8) + 72) * v7, a3);
    uint64_t v10 = a3;
    uint64_t v11 = 0;
    uint64_t v12 = v9;
  }
  else
  {
    uint64_t v12 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
    uint64_t v10 = a3;
    uint64_t v11 = 1;
  }
  return sub_100009CBC(v10, v11, 1, v12);
}

uint64_t sub_100007314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16) && (sub_10000AB40(a1, a2), (v3 & 1) != 0)) {
    return swift_unknownObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_100007358(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004ED8(&qword_100018C50);
  __chkstk_darwin(v4 - 8);
  char v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_100009C30(a1, 1, v10) == 1)
  {
    sub_10000C7A8(a1, &qword_100018C50);
    sub_10000BA6C(a2, (uint64_t)v6);
    uint64_t v11 = type metadata accessor for URL();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v11 - 8) + 8))(a2, v11);
    return sub_10000C7A8((uint64_t)v6, &qword_100018C50);
  }
  else
  {
    sub_10000BC30(a1, (uint64_t)v9);
    sub_10000BC94((uint64_t)v9, a2);
    uint64_t v13 = type metadata accessor for URL();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a2, v13);
  }
}

void sub_1000074F0()
{
  sub_10000CAE4();
  unint64_t v3 = v2;
  uint64_t v49 = v4;
  int v6 = v5;
  uint64_t v47 = v7;
  swift_getObjectType();
  uint64_t v8 = sub_100004ED8(&qword_100018C50);
  uint64_t v9 = sub_10000CBC8(v8);
  __chkstk_darwin(v9);
  sub_10000CF98();
  unint64_t v48 = v10;
  uint64_t v45 = type metadata accessor for URL();
  sub_10000CA2C();
  uint64_t v44 = v11;
  __chkstk_darwin(v12);
  sub_10000CF98();
  uint64_t v46 = v13;
  type metadata accessor for Logger();
  sub_10000CA2C();
  uint64_t v50 = v14;
  __chkstk_darwin(v15);
  sub_10000CC24();
  __chkstk_darwin(v16);
  uint64_t v17 = type metadata accessor for DispatchPredicate();
  sub_10000CA2C();
  uint64_t v19 = v18;
  __chkstk_darwin(v20);
  sub_10000CE68();
  uint64_t v21 = *(void **)(v0 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_serialQueue);
  *uint64_t v1 = v21;
  (*(void (**)(void *, void, uint64_t))(v19 + 104))(v1, enum case for DispatchPredicate.onQueue(_:), v17);
  id v22 = v21;
  char v23 = _dispatchPreconditionTest(_:)();
  (*(void (**)(void *, uint64_t))(v19 + 8))(v1, v17);
  if (v23)
  {
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_systemAvailableForCacheDelete) == 1
      && (v6 & 0xFFFFFFFE) == 2)
    {
      CKLog.getter();
      swift_bridgeObjectRetain_n();
      unint64_t v25 = v3;
      uint64_t v26 = Logger.logObject.getter();
      os_log_type_t v27 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = sub_10000CC98();
        v51[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = 134218498;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v28 + 12) = 2080;
        uint64_t v29 = sub_100004CB8(v6);
        uint64_t v31 = sub_100009F70(v29, v30, v51);
        sub_10000CFAC(v31);
        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 22) = 2080;
        swift_bridgeObjectRetain();
        uint64_t v32 = sub_100009F70(v49, v25, v51);
        sub_10000CFAC(v32);
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "Purging %lld bytes, urgency: %s, reason: %s", (uint8_t *)v28, 0x20u);
        swift_arrayDestroy();
        sub_10000CA70();
        sub_10000CA70();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      uint64_t v33 = *(uint64_t (**)(void))(v50 + 8);
      sub_10000CF84();
      uint64_t v34 = v33();
      uint64_t v53 = 0;
      uint64_t v54 = 0;
      uint64_t v52 = 0;
      memset(&v51[3], 0, 24);
      __chkstk_darwin(v34);
      sub_10000CAFC();
      sub_100005EB8(v47, (uint64_t)sub_100009DC8, v35);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16))(v46, v47, v45);
      uint64_t v36 = v52;
      uint64_t v37 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
      Date.init()();
      *unint64_t v48 = v36;
      sub_100009CBC((uint64_t)v48, 0, 1, v37);
      swift_beginAccess();
      sub_100007358((uint64_t)v48, v46);
      swift_endAccess();
      if (v53 > 0 || v36 >= 1)
      {
        sub_100004CB8(v6);
        sub_100005274();
        swift_bridgeObjectRelease();
      }
      CKLog.getter();
      swift_bridgeObjectRetain_n();
      uint64_t v39 = Logger.logObject.getter();
      os_log_type_t v40 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v41 = swift_slowAlloc();
        v51[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v41 = 134218754;
        sub_10000CD00();
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v41 + 12) = 2048;
        sub_10000CD00();
        sub_10000CEEC();
        *(_WORD *)(v41 + 22) = 2080;
        uint64_t v42 = sub_100004CB8(v6);
        sub_100009F70(v42, v43, v51);
        sub_10000CEEC();
        swift_bridgeObjectRelease();
        *(_WORD *)(v41 + 32) = 2080;
        swift_bridgeObjectRetain();
        sub_100009F70(v49, v25, v51);
        sub_10000CEEC();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v39, v40, "Purged %lld bytes, still have %lld purgeable bytes, urgency: %s, reason: %s", (uint8_t *)v41, 0x2Au);
        swift_arrayDestroy();
        sub_10000CA70();
        sub_10000CA70();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_10000CF84();
      v33();
      sub_10000CD00();
    }
    sub_10000CACC();
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall CKDMain_Swift.registerWithCacheDelete()()
{
  uint64_t v1 = self;
  id v2 = [v1 currentProcess];
  id v3 = [v2 processType];

  if ((unint64_t)v3 > 1)
  {
    _StringGuts.grow(_:)(26);
    v13._object = (void *)0x80000001000110A0;
    v13._countAndFlagsBits = 0xD000000000000018;
    String.append(_:)(v13);
    id v14 = [v1 currentProcess];
    [v14 processType];

    type metadata accessor for CKDDaemonProcessType(0);
    _print_unlocked<A, B>(_:_:)();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10000CF20();
    *(void *)(v4 + 16) = v0;
    uint64_t v5 = sub_10000CF20();
    *(void *)(v5 + 16) = v0;
    uint64_t v6 = sub_10000CF20();
    *(void *)(v6 + 16) = v0;
    id v7 = v0;
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v19 = sub_100007F84;
    uint64_t v20 = v4;
    aBlock = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_100008BBC;
    uint64_t v18 = &unk_100014C18;
    uint64_t v9 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    uint64_t v19 = sub_1000082B0;
    uint64_t v20 = v5;
    aBlock = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_100008BBC;
    uint64_t v18 = &unk_100014C40;
    uint64_t v10 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    uint64_t v19 = sub_100008708;
    uint64_t v20 = 0;
    aBlock = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_100008C24;
    uint64_t v18 = &unk_100014C68;
    uint64_t v11 = _Block_copy(&aBlock);
    swift_release();
    uint64_t v19 = sub_1000087FC;
    uint64_t v20 = v6;
    aBlock = _NSConcreteStackBlock;
    uint64_t v16 = 1107296256;
    uint64_t v17 = sub_100008BBC;
    uint64_t v18 = &unk_100014C90;
    uint64_t v12 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    CacheDeleteRegisterInfoCallbacks();
    _Block_release(v12);
    _Block_release(v11);
    _Block_release(v10);
    _Block_release(v9);
    swift_release();
    swift_release();
    swift_release();
  }
}

void type metadata accessor for CKDDaemonProcessType(uint64_t a1)
{
}

uint64_t sub_100007F84()
{
  return sub_100008814();
}

void sub_100007F9C()
{
  sub_10000CAE4();
  uint64_t v22 = sub_10000CDD4(v1);
  sub_10000CA2C();
  __chkstk_darwin(v2);
  sub_10000CB30();
  sub_10000CA2C();
  __chkstk_darwin(v3);
  sub_10000CB74();
  static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
  if (v24[0])
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10000CBA8((uint64_t)"CACHE_DELETE_AMOUNT");
    swift_bridgeObjectRelease();
    if (v4)
    {
      v24[2] = v4;
      if (sub_10000CDB0())
      {
        sub_10000CF44();
        swift_bridgeObjectRelease();
        sub_100006BE4();
        objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithLongLong:", v5, v22);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_10000CCB0(isUniquelyReferenced_nonNull_native, (uint64_t)"CACHE_DELETE_AMOUNT");
        swift_bridgeObjectRelease();
        v7.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        uint64_t v8 = sub_10000CE9C();
        v9(v8);
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();
  }
  CKLog.getter();
  id v10 = v0;
  uint64_t v11 = (void *)Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.error.getter();
  if (sub_10000CD6C(v12))
  {
    sub_10000CD18();
    v24[0] = sub_10000CC98();
    id v13 = sub_10000CD30(4.8149e-34);
    uint64_t v14 = String.init<A>(describing:)();
    uint64_t v16 = sub_100009F70(v14, v15, v24);
    sub_10000CCD8(v16);

    swift_bridgeObjectRelease();
    sub_10000CC78((void *)&_mh_execute_header, v17, v18, "Info dictionary passed to \"purgeable\" block has unexpected content: %s");
    sub_10000CEC4();
    sub_10000CA70();
    sub_10000CA70();
  }
  else
  {
  }
  uint64_t v19 = sub_10000CF08();
  v20(v19);
  sub_100004ED8(&qword_100018D00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100010D90;
  sub_10000CD98(inited, (uint64_t)"CACHE_DELETE_AMOUNT");
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", 0, v22);
  sub_10000CC58();
  v7.super.isa = sub_10000CE80().super.isa;
  swift_bridgeObjectRelease();
LABEL_10:
  v23->super.isa = v7.super.isa;
  sub_10000CACC();
}

uint64_t sub_1000082B0()
{
  return sub_100008814();
}

void sub_1000082C8()
{
  sub_10000CAE4();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  type metadata accessor for Logger();
  sub_10000CA2C();
  __chkstk_darwin(v5);
  uint64_t v6 = sub_10000CB30();
  sub_10000CA2C();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  sub_10000CB74();
  static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
  if (v28)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_10000CBA8((uint64_t)"CACHE_DELETE_AMOUNT");
    if (v10)
    {
      uint64_t v29 = v10;
      if (swift_dynamicCast())
      {
        uint64_t v11 = sub_10000CBA8((uint64_t)"unknown process ID");
        swift_bridgeObjectRelease();
        if (v11)
        {
          self;
          os_log_type_t v12 = (void *)swift_dynamicCastObjCClass();
          if (v12)
          {
            [v12 longLongValue];
            swift_unknownObjectRelease();
            URL.init(fileURLWithPath:isDirectory:)();
            swift_bridgeObjectRelease();
            sub_1000074F0();
            id v14 = [objc_allocWithZone((Class)NSNumber) initWithLongLong:v13];
            char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            sub_10000BEE8((uint64_t)v14, 0xD000000000000013, 0x8000000100011580, isUniquelyReferenced_nonNull_native);
            swift_bridgeObjectRelease();
            v16.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
            (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0, v6);
            goto LABEL_14;
          }
          swift_unknownObjectRelease();
        }
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  CKLog.getter();
  id v17 = v2;
  uint64_t v18 = (void *)Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.error.getter();
  if (sub_10000CD6C(v19))
  {
    uint64_t v20 = (_DWORD *)sub_10000CD18();
    uint64_t v28 = sub_10000CC98();
    *uint64_t v20 = 136315138;
    uint64_t v29 = (uint64_t)v17;
    type metadata accessor for CFDictionary(0);
    id v21 = v17;
    uint64_t v22 = String.init<A>(describing:)();
    uint64_t v29 = sub_100009F70(v22, v23, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    sub_10000CC78((void *)&_mh_execute_header, v24, v25, "Info dictionary passed to \"purge\" block has unexpected content: %s");
    sub_10000CEC4();
    sub_10000CA70();
    sub_10000CA70();
  }
  else
  {
  }
  sub_10000CC08();
  v26();
  sub_100004ED8(&qword_100018D00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100010D90;
  *(void *)(inited + 32) = 0xD000000000000013;
  *(void *)(inited + 40) = 0x8000000100011580;
  *(void *)(inited + 48) = [objc_allocWithZone((Class)NSNumber) initWithInteger:0];
  sub_10000CC58();
  v16.super.isa = sub_10000CE80().super.isa;
  swift_bridgeObjectRelease();
LABEL_14:
  v4->super.isa = v16.super.isa;
  sub_10000CACC();
}

uint64_t sub_100008708()
{
  uint64_t v1 = type metadata accessor for Logger();
  sub_10000CA2C();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_10000CE08();
  CKLog.getter();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Purge cancel requested. Ignoring.", v7, 2u);
    sub_10000CA70();
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
}

uint64_t sub_1000087FC()
{
  return sub_100008814();
}

uint64_t sub_100008814()
{
  id v1 = *(id *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC6cloudd13CKDMain_Swift_serialQueue);
  sub_100004ED8(&qword_100018CF8);
  OS_dispatch_queue.sync<A>(execute:)();

  return v3;
}

void sub_100008890()
{
  sub_10000CAE4();
  uint64_t v22 = sub_10000CDD4(v1);
  sub_10000CA2C();
  __chkstk_darwin(v2);
  sub_10000CB30();
  sub_10000CA2C();
  __chkstk_darwin(v3);
  sub_10000CB74();
  static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
  if (v24[0])
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_10000CBA8((uint64_t)"CACHE_DELETE_AMOUNT");
    swift_bridgeObjectRelease();
    if (v4)
    {
      v24[2] = v4;
      if (sub_10000CDB0())
      {
        sub_10000CF44();
        swift_bridgeObjectRelease();
        sub_1000074F0();
        objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithLongLong:", v5, v22);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_10000CCB0(isUniquelyReferenced_nonNull_native, (uint64_t)"CACHE_DELETE_AMOUNT");
        swift_bridgeObjectRelease();
        v7.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        uint64_t v8 = sub_10000CE9C();
        v9(v8);
        goto LABEL_10;
      }
    }
    swift_bridgeObjectRelease();
  }
  CKLog.getter();
  id v10 = v0;
  uint64_t v11 = (void *)Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.error.getter();
  if (sub_10000CD6C(v12))
  {
    sub_10000CD18();
    v24[0] = sub_10000CC98();
    id v13 = sub_10000CD30(4.8149e-34);
    uint64_t v14 = String.init<A>(describing:)();
    uint64_t v16 = sub_100009F70(v14, v15, v24);
    sub_10000CCD8(v16);

    swift_bridgeObjectRelease();
    sub_10000CC78((void *)&_mh_execute_header, v17, v18, "Info dictionary passed to \"periodic\" block has unexpected content: %s");
    sub_10000CEC4();
    sub_10000CA70();
    sub_10000CA70();
  }
  else
  {
  }
  uint64_t v19 = sub_10000CF08();
  v20(v19);
  sub_100004ED8(&qword_100018D00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100010D90;
  sub_10000CD98(inited, (uint64_t)"CACHE_DELETE_AMOUNT");
  *(void *)(inited + 48) = objc_msgSend(objc_allocWithZone((Class)NSNumber), "initWithInteger:", 0, v22);
  sub_10000CC58();
  v7.super.isa = sub_10000CE80().super.isa;
  swift_bridgeObjectRelease();
LABEL_10:
  v23->super.isa = v7.super.isa;
  sub_10000CACC();
}

uint64_t sub_100008BBC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(uint64_t (**)(uint64_t, id))(a1 + 32);
  swift_retain();
  id v6 = a3;
  uint64_t v7 = v5(a2, v6);
  swift_release();

  return v7;
}

uint64_t sub_100008C24(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_100008CB0()
{
  swift_bridgeObjectRetain();
  uint64_t v1 = String.init<A>(_:)();
  String.append<A>(contentsOf:)();
  return v1;
}

Swift::Void __swiftcall CKDMain_Swift.startCloudAssetsService()()
{
  sub_10000CAE4();
  type metadata accessor for Logger();
  sub_10000CA2C();
  __chkstk_darwin(v0);
  sub_10000CB58();
  uint64_t v1 = type metadata accessor for XPCListener.InitializationOptions();
  uint64_t v2 = sub_10000CBC8(v1);
  __chkstk_darwin(v2);
  sub_10000CE08();
  uint64_t v3 = self;
  id v4 = [v3 currentProcess];
  id v5 = [v4 processType];

  id v6 = [v3 currentProcess];
  unsigned __int8 v7 = [v6 isSystemInstalledBinary];

  if (v5 == (id)2)
  {
    static XPCServiceNames.testService.getter();
  }
  else if (v5 == (id)1)
  {
    static XPCServiceNames.systemService.getter();
  }
  else
  {
    if (v5)
    {
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return;
    }
    static XPCServiceNames.userService.getter();
  }
  if ((v7 & 1) == 0)
  {
    sub_100008CB0();
    swift_bridgeObjectRelease();
  }
  static XPCListener.InitializationOptions.none.getter();
  type metadata accessor for XPCListener();
  swift_allocObject();
  uint64_t v8 = XPCListener.init(service:targetQueue:options:incomingSessionHandler:)();
  sub_10000525C(v8);
  sub_10000CACC();
}

uint64_t sub_100008FE8()
{
  type metadata accessor for Dispatcher();
  static Dispatcher.shared.getter();
  Dispatcher.dispatchRequest(_:)();
  return swift_release();
}

Swift::Void __swiftcall CKDMain_Swift.setupCloudTelemetryXpcServiceActivities()()
{
}

id CKDMain_Swift.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

void CKDMain_Swift.init()()
{
  sub_10000CAE4();
  uint64_t v13 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  sub_10000CA2C();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_10000CB58();
  type metadata accessor for OS_dispatch_queue.Attributes();
  sub_10000CA60();
  __chkstk_darwin(v5);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = sub_10000CBC8(v6);
  __chkstk_darwin(v7);
  uint64_t v12 = OBJC_IVAR____TtC6cloudd13CKDMain_Swift_serialQueue;
  sub_10000C80C(0, &qword_100018B80);
  uint64_t v8 = v0;
  static DispatchQoS.unspecified.getter();
  unint64_t v15 = &_swiftEmptyArrayStorage;
  sub_10000C150(&qword_100018B88, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100004ED8(&qword_100018B90);
  sub_100004F1C();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v13);
  *(void *)&v0[v12] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v8[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_systemAvailableForCacheDelete] = 0;
  uint64_t v9 = &v8[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_CACHE_DELETE_LISTENER];
  *(void *)uint64_t v9 = 0xD00000000000001DLL;
  *((void *)v9 + 1) = 0x8000000100011010;
  id v10 = &v8[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_CACHE_DELETE_SYSTEM_LISTENER];
  *(void *)id v10 = 0xD000000000000024;
  *((void *)v10 + 1) = 0x8000000100011040;
  *(void *)&v8[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_cloudAssetsServiceListener] = 0;
  *(void *)&v8[OBJC_IVAR____TtC6cloudd13CKDMain_Swift_cachesByVolume] = &_swiftEmptyDictionarySingleton;

  uint64_t v11 = (objc_class *)type metadata accessor for CKDMain_Swift();
  v14.receiver = v8;
  v14.super_class = v11;
  objc_msgSendSuper2(&v14, "init");
  sub_10000CACC();
}

id CKDMain_Swift.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CKDMain_Swift();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000094B8()
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

uint64_t sub_100009540()
{
  return sub_100009678(*v0, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100009570()
{
  return sub_100009578();
}

uint64_t sub_100009578()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000095CC()
{
  return sub_1000095D4();
}

Swift::Int sub_1000095D4()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100009648()
{
  return sub_100009678(*v0, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100009678(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1000096BC(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_100009738(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

NSString sub_1000097B8@<X0>(void *a1@<X8>)
{
  NSString result = sub_1000097E0();
  *a1 = result;
  return result;
}

NSString sub_1000097E0()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v0 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100009818()
{
  return sub_1000094B8();
}

uint64_t sub_100009824@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000986C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000989C(uint64_t a1)
{
  uint64_t v2 = sub_10000C150(&qword_100018CE0, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_10000C150(&qword_100018D38, type metadata accessor for URLResourceKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t type metadata accessor for CKDMain_Swift()
{
  return self;
}

uint64_t *sub_10000997C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v7 = *a2;
    *uint64_t v3 = *a2;
    uint64_t v3 = (uint64_t *)(v7 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    type metadata accessor for Date();
    sub_10000CA60();
    uint64_t v5 = sub_10000CFCC();
    v6(v5);
  }
  return v3;
}

uint64_t sub_100009A34(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 20);
  type metadata accessor for Date();
  sub_10000CA60();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8);
  return v5(v2, v3);
}

uint64_t sub_100009A94(void *a1, void *a2)
{
  sub_10000CA88(a1, a2);
  sub_10000CA60();
  uint64_t v3 = sub_10000CFCC();
  v4(v3);
  return v2;
}

uint64_t sub_100009AE0(void *a1, void *a2)
{
  sub_10000CA88(a1, a2);
  sub_10000CA60();
  uint64_t v3 = sub_10000CEB4();
  v4(v3);
  return v2;
}

uint64_t sub_100009B30(void *a1, void *a2)
{
  sub_10000CA88(a1, a2);
  sub_10000CA60();
  uint64_t v3 = sub_10000CEB4();
  v4(v3);
  return v2;
}

uint64_t sub_100009B80(void *a1, void *a2)
{
  sub_10000CA88(a1, a2);
  sub_10000CA60();
  uint64_t v3 = sub_10000CEB4();
  v4(v3);
  return v2;
}

uint64_t sub_100009BD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009BE4);
}

uint64_t sub_100009BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = a1 + *(int *)(a3 + 20);
  uint64_t v5 = type metadata accessor for Date();
  return sub_100009C30(v4, a2, v5);
}

uint64_t sub_100009C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_100009C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009C6C);
}

uint64_t sub_100009C6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a1 + *(int *)(a4 + 20);
  uint64_t v6 = type metadata accessor for Date();
  return sub_100009CBC(v5, a2, a2, v6);
}

uint64_t sub_100009CBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for CKDMain_Swift.VolumeSizeCache()
{
  uint64_t result = qword_100018EF0;
  if (!qword_100018EF0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100009D2C()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_100009DC8(void *a1)
{
}

uint64_t sub_100009DD0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100009EAC;
  return v6(a1);
}

uint64_t sub_100009EAC()
{
  sub_10000CF38();
  sub_10000CA48();
  uint64_t v1 = *v0;
  sub_10000CC14();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000CEE0();
  return v3();
}

uint64_t sub_100009F70(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000A044(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000AA48((uint64_t)v12, *a3);
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
      sub_10000AA48((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000A9F8((uint64_t)v12);
  return v7;
}

uint64_t sub_10000A044(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_10000A19C((char *)__src, HIBYTE(a6) & 0xF, __dst);
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
    uint64_t result = (uint64_t)sub_10000A274(a5, a6);
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

void *sub_10000A19C(char *__src, size_t __n, char *__dst)
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

void *sub_10000A274(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_10000A30C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000A4E8(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000A4E8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_10000A30C(uint64_t a1, unint64_t a2)
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
  unint64_t v3 = sub_10000A480(v2, 0);
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

void *sub_10000A480(uint64_t a1, uint64_t a2)
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
  sub_100004ED8(&qword_100018CA0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_10000A4E8(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_100004ED8(&qword_100018CA0);
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
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_10000A698(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_10000A5C0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_10000A5C0(char *__src, size_t __n, char *__dst)
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

char *sub_10000A698(char *__src, size_t __len, char *__dst)
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

uint64_t sub_10000A728()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 104, 7);
}

uint64_t sub_10000A768()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_10000A848;
  return sub_10000537C();
}

uint64_t sub_10000A848()
{
  sub_10000CF38();
  sub_10000CA48();
  uint64_t v1 = *v0;
  sub_10000CC14();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_10000CEE0();
  return v3();
}

uint64_t sub_10000A908()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A940(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000A848;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100018C70 + dword_100018C70);
  return v6(a1, v4);
}

uint64_t sub_10000A9F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000AA48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10000AAA8(uint64_t a1)
{
  type metadata accessor for URL();
  sub_10000C150(&qword_100018CB0, (void (*)(uint64_t))&type metadata accessor for URL);
  uint64_t v2 = dispatch thunk of Hashable._rawHashValue(seed:)();
  return sub_10000ABB8(a1, v2);
}

unint64_t sub_10000AB40(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_10000AD78(a1, a2, v4);
}

unint64_t sub_10000ABB8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  int64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    size_t v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_10000C150(&qword_100018CB8, (void (*)(uint64_t))&type metadata accessor for URL);
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

unint64_t sub_10000AD78(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_10000AE5C(void *a1, void *a2)
{
  uint64_t v3 = v2;
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
    *uint64_t v3 = 0x8000000000000000;
    id v24 = a2;
    sub_10000B398((uint64_t)v24, v9, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v28;
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

uint64_t sub_10000B088()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004ED8(&qword_100018CE8);
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
    if (!v7) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
    {
      uint64_t v16 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      Hasher.init(_seed:)();
      String.hash(into:)();
      Swift::Int v17 = Hasher._finalize()();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v18 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v19 = v17 & ~v18;
      unint64_t v20 = v19 >> 6;
      if (((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6))) == 0)
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
          uint64_t v25 = *(void *)(v8 + 8 * v20);
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
      unint64_t v21 = __clz(__rbit64((-1 << v19) & ~*(void *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v8 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
      *(void *)(*(void *)(v4 + 48) + 8 * v21) = v16;
      ++*(void *)(v4 + 16);
      if (v7) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v13 = v10 + 1;
      if (__OFADD__(v10, 1)) {
        goto LABEL_38;
      }
      if (v13 >= v28) {
        goto LABEL_32;
      }
      unint64_t v14 = v29[v13];
      ++v10;
      if (!v14)
      {
        int64_t v10 = v13 + 1;
        if (v13 + 1 >= v28) {
          goto LABEL_32;
        }
        unint64_t v14 = v29[v10];
        if (!v14)
        {
          int64_t v10 = v13 + 2;
          if (v13 + 2 >= v28) {
            goto LABEL_32;
          }
          unint64_t v14 = v29[v10];
          if (!v14)
          {
            int64_t v15 = v13 + 3;
            if (v15 >= v28)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v27;
              uint64_t v26 = 1 << *(unsigned char *)(v2 + 32);
              if (v26 > 63) {
                sub_10000B5C8(0, (unint64_t)(v26 + 63) >> 6, v29);
              }
              else {
                void *v29 = -1 << v26;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v14 = v29[v15];
            if (!v14)
            {
              while (1)
              {
                int64_t v10 = v15 + 1;
                if (__OFADD__(v15, 1)) {
                  goto LABEL_39;
                }
                if (v10 >= v28) {
                  goto LABEL_32;
                }
                unint64_t v14 = v29[v10];
                ++v15;
                if (v14) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v10 = v15;
          }
        }
      }
LABEL_20:
      unint64_t v7 = (v14 - 1) & v14;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_10000B398(uint64_t result, unint64_t a2, char a3)
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
    sub_10000B088();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (uint64_t)sub_10000B5E4();
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
    sub_10000B790();
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

uint64_t sub_10000B5C8(uint64_t result, uint64_t a2, void *a3)
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

id sub_10000B5E4()
{
  uint64_t v1 = v0;
  sub_100004ED8(&qword_100018CE8);
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
  uint64_t v11 = *(void *)(v2 + 56);
  uint64_t v12 = -1;
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  unint64_t v13 = v12 & v11;
  int64_t v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (unint64_t i = v15 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    uint64_t v20 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    *(void *)(*(void *)(v4 + 48) + 8 * i) = v20;
    id result = v20;
    if (v13) {
      goto LABEL_11;
    }
LABEL_12:
    int64_t v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      int64_t v9 = v17 + 1;
      if (v17 + 1 >= v14) {
        goto LABEL_28;
      }
      unint64_t v18 = *(void *)(v6 + 8 * v9);
      if (!v18)
      {
        int64_t v9 = v17 + 2;
        if (v17 + 2 >= v14) {
          goto LABEL_28;
        }
        unint64_t v18 = *(void *)(v6 + 8 * v9);
        if (!v18) {
          break;
        }
      }
    }
LABEL_25:
    unint64_t v13 = (v18 - 1) & v18;
  }
  int64_t v19 = v17 + 3;
  if (v19 >= v14) {
    goto LABEL_28;
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
    if (v9 >= v14) {
      goto LABEL_28;
    }
    unint64_t v18 = *(void *)(v6 + 8 * v9);
    ++v19;
    if (v18) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000B790()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_100004ED8(&qword_100018CE8);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
  if (!v7) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v11 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (unint64_t i = v11 | (v10 << 6); ; unint64_t i = __clz(__rbit64(v14)) + (v10 << 6))
  {
    uint64_t v16 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    Hasher.init(_seed:)();
    id v17 = v16;
    String.hash(into:)();
    Swift::Int v18 = Hasher._finalize()();
    uint64_t result = swift_bridgeObjectRelease();
    uint64_t v19 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v20 = v18 & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6))) == 0)
    {
      char v23 = 0;
      unint64_t v24 = (unint64_t)(63 - v19) >> 6;
      while (++v21 != v24 || (v23 & 1) == 0)
      {
        BOOL v25 = v21 == v24;
        if (v21 == v24) {
          unint64_t v21 = 0;
        }
        v23 |= v25;
        uint64_t v26 = *(void *)(v8 + 8 * v21);
        if (v26 != -1)
        {
          unint64_t v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v22 = __clz(__rbit64((-1 << v20) & ~*(void *)(v8 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v8 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(void *)(*(void *)(v4 + 48) + 8 * v22) = v17;
    ++*(void *)(v4 + 16);
    if (v7) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v13 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      goto LABEL_36;
    }
    if (v13 >= v29) {
      goto LABEL_32;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    ++v10;
    if (!v14)
    {
      int64_t v10 = v13 + 1;
      if (v13 + 1 >= v29) {
        goto LABEL_32;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v10);
      if (!v14)
      {
        int64_t v10 = v13 + 2;
        if (v13 + 2 >= v29) {
          goto LABEL_32;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v10);
        if (!v14) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v7 = (v14 - 1) & v14;
  }
  int64_t v15 = v13 + 3;
  if (v15 >= v29)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v27;
    goto LABEL_34;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v15);
  if (v14)
  {
    int64_t v10 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v10 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v10 >= v29) {
      goto LABEL_32;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v10);
    ++v15;
    if (v14) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000BA6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10000AAA8(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if (a1)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v19 = *v3;
    uint64_t v9 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    Swift::Int v10 = *(void *)(v9 + 24);
    sub_100004ED8(&qword_100018CA8);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v10);
    uint64_t v11 = *(void *)(v19 + 48);
    uint64_t v12 = type metadata accessor for URL();
    (*(void (**)(unint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11 + *(void *)(*(void *)(v12 - 8) + 72) * v6, v12);
    uint64_t v13 = *(void *)(v19 + 56);
    uint64_t v14 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
    sub_10000BC30(v13 + *(void *)(*(void *)(v14 - 8) + 72) * v6, a2);
    sub_10000C150(&qword_100018CB0, (void (*)(uint64_t))&type metadata accessor for URL);
    _NativeDictionary._delete(at:)();
    *uint64_t v3 = v19;
    swift_bridgeObjectRelease();
    uint64_t v15 = a2;
    uint64_t v16 = 0;
    uint64_t v17 = v14;
  }
  else
  {
    uint64_t v17 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
    uint64_t v15 = a2;
    uint64_t v16 = 1;
  }
  return sub_100009CBC(v15, v16, 1, v17);
}

uint64_t sub_10000BC30(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BC94(uint64_t a1, uint64_t a2)
{
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v7 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  sub_10000BD14(a1, a2, isUniquelyReferenced_nonNull_native);
  *uint64_t v2 = v7;
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000BD14(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)*v3;
  unint64_t v13 = sub_10000AAA8(a2);
  uint64_t v15 = v12[2];
  BOOL v16 = (v14 & 1) == 0;
  Swift::Int v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v18 = v13;
  char v19 = v14;
  sub_100004ED8(&qword_100018CA8);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v17)) {
    goto LABEL_5;
  }
  unint64_t v20 = sub_10000AAA8(a2);
  if ((v19 & 1) != (v21 & 1))
  {
LABEL_11:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v18 = v20;
LABEL_5:
  unint64_t v22 = *v4;
  if (v19)
  {
    uint64_t v23 = v22[7];
    uint64_t v24 = v23 + *(void *)(*(void *)(type metadata accessor for CKDMain_Swift.VolumeSizeCache() - 8) + 72) * v18;
    return sub_10000C0EC(a1, v24);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
    return sub_10000C010(v18, (uint64_t)v11, a1, v22);
  }
}

uint64_t sub_10000BEE8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  uint64_t v10 = (void *)*v4;
  unint64_t v11 = sub_10000AB40(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v12 & 1) == 0;
  Swift::Int v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v16 = v11;
  char v17 = v12;
  sub_100004ED8(&qword_100018D08);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15)) {
    goto LABEL_5;
  }
  unint64_t v18 = sub_10000AB40(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_11:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v16 = v18;
LABEL_5:
  unint64_t v20 = *v5;
  if (v17)
  {
    uint64_t v21 = v20[7];
    uint64_t result = swift_unknownObjectRelease();
    *(void *)(v21 + 8 * v16) = a1;
  }
  else
  {
    sub_10000C610(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10000C010(unint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v8 = a4[6];
  uint64_t v9 = type metadata accessor for URL();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v8 + *(void *)(*(void *)(v9 - 8) + 72) * a1, a2, v9);
  uint64_t v10 = a4[7];
  uint64_t v11 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
  uint64_t result = sub_10000BC30(a3, v10 + *(void *)(*(void *)(v11 - 8) + 72) * a1);
  uint64_t v13 = a4[2];
  BOOL v14 = __OFADD__(v13, 1);
  uint64_t v15 = v13 + 1;
  if (v14) {
    __break(1u);
  }
  else {
    a4[2] = v15;
  }
  return result;
}

uint64_t sub_10000C0EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C150(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_10000C198(void *a1)
{
}

void sub_10000C1A0(void *a1, char a2)
{
  uint64_t v4 = (void *)v2[2];
  uint64_t v3 = (void *)v2[3];
  unint64_t v6 = (void *)v2[4];
  uint64_t v5 = (void *)v2[5];
  uint64_t v8 = (void *)v2[6];
  uint64_t v7 = (void *)v2[7];
  id v9 = [a1 clearForced:a2 & 1];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = (unint64_t)[v9 bytesCount];
    if ((v11 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (!__OFADD__(*v4, v11))
    {
      *v4 += v11;
      unint64_t v12 = (unint64_t)[v10 purgedBytesCount];
      if ((v12 & 0x8000000000000000) == 0)
      {
        if (!__OFADD__(*v3, v12))
        {
          *v3 += v12;
          unint64_t v13 = (unint64_t)[v10 purgeableBytesCount];
          if ((v13 & 0x8000000000000000) == 0)
          {
            if (!__OFADD__(*v6, v13))
            {
              *v6 += v13;
              unint64_t v14 = (unint64_t)[v10 filesCount];
              if ((v14 & 0x8000000000000000) == 0)
              {
                if (!__OFADD__(*v5, v14))
                {
                  *v5 += v14;
                  unint64_t v15 = (unint64_t)[v10 purgedFilesCount];
                  if ((v15 & 0x8000000000000000) == 0)
                  {
                    if (!__OFADD__(*v8, v15))
                    {
                      *v8 += v15;
                      unint64_t v16 = (unint64_t)[v10 purgeableFilesCount];

                      if ((v16 & 0x8000000000000000) == 0)
                      {
                        if (!__OFADD__(*v7, v16))
                        {
                          *v7 += v16;
                          return;
                        }
LABEL_27:
                        __break(1u);
                        return;
                      }
LABEL_26:
                      __break(1u);
                      goto LABEL_27;
                    }
LABEL_25:
                    __break(1u);
                    goto LABEL_26;
                  }
LABEL_24:
                  __break(1u);
                  goto LABEL_25;
                }
LABEL_23:
                __break(1u);
                goto LABEL_24;
              }
LABEL_22:
              __break(1u);
              goto LABEL_23;
            }
LABEL_21:
            __break(1u);
            goto LABEL_22;
          }
LABEL_20:
          __break(1u);
          goto LABEL_21;
        }
LABEL_19:
        __break(1u);
        goto LABEL_20;
      }
LABEL_18:
      __break(1u);
      goto LABEL_19;
    }
    __break(1u);
    goto LABEL_18;
  }
}

uint64_t sub_10000C310(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000C36C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CKDMain_Swift.VolumeSizeCache();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C3D0()
{
  type metadata accessor for URL();
  sub_10000CA60();
  v1 += 8;
  uint64_t v2 = *(unsigned __int8 *)(v1 + 72);
  uint64_t v3 = v2 | 7;
  unint64_t v4 = ((*(void *)(v1 + 56) + ((v2 + 16) & ~v2) + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  sub_10000CC08();
  v5();
  return _swift_deallocObject(v0, v4, v3);
}

void sub_10000C460()
{
  uint64_t v1 = type metadata accessor for URL();
  sub_10000CB90(v1);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v5 = v0 + ((*(void *)(v4 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8);
  uint64_t v6 = *(void *)(v5 + 8);
  unint64_t v14 = *(void (**)(void))v5;
  id v15 = [self defaultContext];
  uint64_t v7 = sub_10000C658([v15 metadataCache]);
  if (v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = (unint64_t)&_swiftEmptyArrayStorage;
  }
  if (v8 >> 62) {
    goto LABEL_16;
  }
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v9)
  {
    v0 += v3;
    uint64_t v10 = 4;
    while (1)
    {
      id v11 = (v8 & 0xC000000000000001) != 0
          ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
          : *(id *)(v8 + 8 * v10);
      unint64_t v3 = (unint64_t)v11;
      uint64_t v12 = v10 - 3;
      if (__OFADD__(v10 - 4, 1)) {
        break;
      }
      sub_1000060B4((void *)v3, v15, v0, v14, v6);

      ++v10;
      if (v12 == v9) {
        goto LABEL_12;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
LABEL_12:
  swift_bridgeObjectRelease();
}

unint64_t sub_10000C610(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(result >> 6) + 8] |= 1 << result;
  unint64_t v5 = (void *)(a5[6] + 16 * result);
  *unint64_t v5 = a2;
  v5[1] = a3;
  *(void *)(a5[7] + 8 * result) = a4;
  uint64_t v6 = a5[2];
  BOOL v7 = __OFADD__(v6, 1);
  uint64_t v8 = v6 + 1;
  if (v7) {
    __break(1u);
  }
  else {
    a5[2] = v8;
  }
  return result;
}

uint64_t sub_10000C658(void *a1)
{
  id v2 = [a1 knownAppContainerAccountTuples];

  if (!v2) {
    return 0;
  }
  sub_10000C80C(0, &qword_100018CF0);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_10000C6D0(void *a1)
{
  id v2 = [a1 personaID];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

uint64_t sub_10000C740(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100004ED8(&qword_100018CC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C7A8(uint64_t a1, uint64_t *a2)
{
  sub_100004ED8(a2);
  sub_10000CA60();
  sub_10000CC08();
  v3();
  return a1;
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

uint64_t sub_10000C80C(uint64_t a1, unint64_t *a2)
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

void sub_10000C848()
{
}

void type metadata accessor for CFDictionary(uint64_t a1)
{
}

void sub_10000C884(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

void sub_10000C8CC()
{
}

void sub_10000C8F4()
{
}

uint64_t sub_10000C91C()
{
  return sub_10000C150(&qword_100018D20, type metadata accessor for URLResourceKey);
}

uint64_t sub_10000C964()
{
  return sub_10000C150(&qword_100018D28, type metadata accessor for URLResourceKey);
}

uint64_t sub_10000C9AC()
{
  return sub_10000C150(&qword_100018D30, type metadata accessor for URLResourceKey);
}

uint64_t sub_10000CA70()
{
  return swift_slowDealloc();
}

uint64_t sub_10000CA88(void *a1, void *a2)
{
  *a1 = *a2;
  return type metadata accessor for Date();
}

void *sub_10000CAB4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *uint64_t result = a2;
  return result;
}

uint64_t sub_10000CB30()
{
  return type metadata accessor for URL();
}

uint64_t sub_10000CB58()
{
  return 0;
}

void sub_10000CB74()
{
  *(void *)(v0 - 160) = 0;
}

uint64_t sub_10000CB90(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_10000CBA8@<X0>(uint64_t a1@<X8>)
{
  return sub_100007314(0xD000000000000013, a1 | 0x8000000000000000, v1);
}

uint64_t sub_10000CBC8(uint64_t a1)
{
  return a1 - 8;
}

void sub_10000CBD4(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 280) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_10000CBF8()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CC38@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  *(void *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

uint64_t sub_10000CC58()
{
  return Dictionary.init(dictionaryLiteral:)();
}

void sub_10000CC78(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_10000CC98()
{
  return swift_slowAlloc();
}

uint64_t sub_10000CCB0@<X0>(char a1@<W3>, uint64_t a2@<X8>)
{
  return sub_10000BEE8(v2, 0xD000000000000013, (a2 - 32) | 0x8000000000000000, a1);
}

uint64_t sub_10000CCD8(uint64_t a1)
{
  *(void *)(v1 - 144) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000CD00()
{
  return swift_beginAccess();
}

uint64_t sub_10000CD18()
{
  return swift_slowAlloc();
}

id sub_10000CD30(float a1)
{
  *uint64_t v1 = a1;
  *(void *)(v3 - 144) = v2;
  type metadata accessor for CFDictionary(0);
  return v2;
}

BOOL sub_10000CD6C(os_log_type_t a1)
{
  return os_log_type_enabled(v1, a1);
}

uint64_t sub_10000CD88()
{
  return *(void *)(v0 + 16);
}

uint64_t sub_10000CD98@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(result + 32) = 0xD000000000000013;
  *(void *)(result + 40) = (a2 - 32) | 0x8000000000000000;
  return result;
}

uint64_t sub_10000CDB0()
{
  return swift_dynamicCast();
}

uint64_t sub_10000CDD4@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 168) = a1;
  return type metadata accessor for Logger();
}

uint64_t sub_10000CDF8@<X0>(uint64_t a1@<X8>)
{
  return a1 + v1;
}

NSDictionary sub_10000CE80()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000CE9C()
{
  return v0;
}

uint64_t sub_10000CEB4()
{
  return v0;
}

uint64_t sub_10000CEC4()
{
  return swift_arrayDestroy();
}

uint64_t sub_10000CEE0()
{
  return v0 + 8;
}

uint64_t sub_10000CEEC()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000CF08()
{
  return v0;
}

uint64_t sub_10000CF20()
{
  return swift_allocObject();
}

uint64_t sub_10000CF44()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t sub_10000CF64(uint64_t a1)
{
  return sub_100009C30(a1, 1, v1);
}

uint64_t sub_10000CFAC(uint64_t a1)
{
  *(void *)(v1 - 184) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000CFCC()
{
  return v0;
}

void sub_10000D034(id a1)
{
  qword_100019218 = objc_alloc_init(CKDMain);
  _objc_release_x1();
}

void sub_10000D280(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = _os_activity_create((void *)&_mh_execute_header, "com.apple.notifyd.matching", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
    if (string)
    {
      if (!strcasecmp("com.apple.Preferences.ResetPrivacyWarningsNotification", string))
      {
        uint64_t v5 = +[CKDPrivacyManager sharedManager];
        [v5 resetPrivacySettingsWithCompletionHandler:&stru_100014E98];
LABEL_10:

        goto LABEL_11;
      }
      if (!strcasecmp("com.apple.Preferences.ChangedRestrictionsEnabledStateNotification", string)
        || !strcasecmp("com.apple.managedconfiguration.effectivesettingschanged", string)
        || !strcasecmp("com.apple.ManagedConfiguration.profileListChanged", string))
      {
        uint64_t v5 = +[CKDAccountNotifier sharedNotifier];
        [v5 postAccountChangedNotificationToClients];
        goto LABEL_10;
      }
    }
  }
LABEL_11:
  os_activity_scope_leave(&v6);
}

void sub_10000D3F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000D408(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v3 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    uint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Finished resetting privacy settings with error: %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_10000D500(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = _os_activity_create((void *)&_mh_execute_header, "com.apple.distnoted.matching", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v3, &v10);
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
    uint64_t v5 = xpc_dictionary_get_value(v2, "UserInfo");
    if (v5) {
      os_activity_scope_state_s v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    }
    else {
      os_activity_scope_state_s v6 = 0;
    }
    if (!strcmp(string, "com.apple.cdp.manatee-availability"))
    {
      uint64_t v7 = +[CKDLogicalDeviceContext defaultContext];
      uint64_t v8 = [v7 accountDataSecurityObserver];
      uint64_t v9 = [v6 objectForKeyedSubscript:@"com.apple.cdp.manatee-state"];
      [v8 handleManateeStatusUpdateNotificationWithAvailability:v9];
    }
  }
  os_activity_scope_leave(&v10);
}

void sub_10000D650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
}

void sub_10000D700(id a1, NSString *a2, NSString *a3, int64_t a4, int64_t a5)
{
  os_activity_scope_state_s v6 = a2;
  uint64_t v7 = a3;
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v8 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Notifying clients of authorization change", buf, 2u);
  }
  +[CKAccountInfo invalidateCachedAccountInfo];
  uint64_t v9 = CKTestNotificationPrefix();
  os_activity_scope_state_s v10 = +[NSString stringWithFormat:@"%@%@", v9, kCKAuthorizationChangedNotificationKey];

  notify_post((const char *)[v10 UTF8String]);
}

void sub_10000D820(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count])
  {
    int v4 = CKGetGlobalQueue();
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10000D970;
    v6[3] = &unk_100014F20;
    id v7 = v3;
    id v8 = *(id *)(a1 + 32);
    dispatch_async(v4, v6);
  }
  else
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v5 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "No background tasks need to be cleaned up.", buf, 2u);
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

intptr_t sub_10000D970(uint64_t a1)
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v1 = *(id *)(a1 + 32);
  id v2 = [v1 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v13;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v13 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v5);
        if (ck_log_initialization_predicate != -1) {
          dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
        }
        id v7 = ck_log_facility_ck;
        if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v17 = v6;
          _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Cleaning up background tasks for configuration %@", buf, 0xCu);
        }
        id v8 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:v6];
        if (v8)
        {
          uint64_t v9 = +[NSURLSession sessionWithConfiguration:v8];
          [v9 invalidateAndCancel];
        }
        uint64_t v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v3);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

uint64_t sub_10000DB44(void *a1, void *a2, int a3, uint64_t a4, void *a5)
{
  id v9 = a2;
  id v10 = a5;
  if (a4 == 4)
  {
    if (!a3) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  if (a4 == 3)
  {
    if (!a3) {
      goto LABEL_16;
    }
    if (([v9 isEqualToString:kCKPackageClientDirectoryName] & 1) != 0
      || ([v9 isEqualToString:kCKPackageDaemonDirectoryName] & 1) != 0)
    {
      goto LABEL_15;
    }
LABEL_13:
    uint64_t v11 = kCKFrameworkCachesDirectoryName;
    goto LABEL_14;
  }
  if (a4 != 1)
  {
LABEL_16:
    uint64_t v12 = 0;
    goto LABEL_17;
  }
  if ((a3 & 1) == 0
    && (([v9 hasPrefix:a1[4]] & 1) != 0
     || ([v9 hasPrefix:a1[5]] & 1) != 0))
  {
    goto LABEL_15;
  }
  uint64_t v11 = a1[6];
LABEL_14:
  if (([v9 isEqualToString:v11] & 1) == 0) {
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v12 = 1;
LABEL_17:

  return v12;
}

BOOL sub_10000DC40(id a1, NSString *a2, BOOL a3, unint64_t a4, NSDate *a5)
{
  return !a3;
}

void sub_10000E748(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,os_activity_scope_state_s state)
{
}

id sub_10000E79C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  if (a2 && a3) {
    return _[v3 expungeDataForAccountID:a2];
  }
  else {
    return _objc_msgSend(v3, "expungeOldData", a3);
  }
}

id *sub_10000E7B4(id *result, uint64_t a2, int a3)
{
  if (a3) {
    return (id *)_[result[4] expungeOperationInfoForDeletedAccountID:a2];
  }
  return result;
}

uint64_t start(uint64_t a1, uint64_t a2)
{
  signal(15, 0);
  uint64_t v4 = dispatch_get_global_queue(25, 0);
  uint64_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v4);

  if (v5)
  {
    dispatch_source_set_event_handler(v5, &stru_100014FF8);
    dispatch_activate(v5);
  }
  uint64_t v6 = +[CKSignpost signpost];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 log];
    id v9 = (char *)[v7 identifier];
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v10 = (os_signpost_id_t)v9;
      if (os_signpost_enabled(v8))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "Launch", "", buf, 2u);
      }
    }
  }
  +[CKDXPCConnectionManager clouddStarted];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v59 = _os_activity_create((void *)&_mh_execute_header, "cloudd_main", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v59, &state);
  setCKRunningInClientProcess();
  +[CKDDaemonProcess deriveCurrentProcessWithArgC:a1 argv:a2];
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  uint64_t v11 = ck_log_facility_ck;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    CKBuildVersion();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    CKProductName();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uid_t v14 = getuid();
    *(_DWORD *)buf = 138412802;
    id v63 = v12;
    __int16 v64 = 2112;
    id v65 = v13;
    __int16 v66 = 1024;
    uid_t v67 = v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Welcome to cloudd, running on version %@ (%@). We are running as user %d. Enjoy your stay!", buf, 0x1Cu);
  }
  long long v15 = +[CKBehaviorOptions sharedOptions];
  unsigned int v16 = [v15 isAppleInternalInstall];

  if (v16)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v17 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Device is an AppleInternal install", buf, 2u);
    }
  }
  unint64_t v18 = +[CKBehaviorOptions sharedOptions];
  id v19 = [v18 sandboxCloudD];

  if (v19)
  {
    unint64_t v20 = +[CKDDaemonProcess currentProcess];
    id v21 = [v20 processType];
    if (!v21
      || (+[CKDDaemonProcess currentProcess],
          id v19 = (id)objc_claimAutoreleasedReturnValue(),
          [v19 processType] == (id)1))
    {
      uint64_t v23 = +[CKDDaemonProcess currentProcess];
      unsigned __int8 v24 = [v23 isSystemInstalledBinary];

      if (v21) {
      if ((v24 & 1) == 0)
      }
      {
        BOOL v25 = @"com.apple.cloudd.debug";
        goto LABEL_30;
      }
    }
    else
    {
    }
    BOOL v25 = @"com.apple.cloudd";
LABEL_30:
    if (CKIsRunningInSyncBubble())
    {
      uint64_t v26 = +[CKDDaemonProcess currentProcess];
      BOOL v27 = [v26 processType] == 0;

      if (!v27)
      {
        id v56 = +[NSAssertionHandler currentHandler];
        uint64_t v57 = +[NSString stringWithUTF8String:"void get_in_the_sandbox(void)"];
        uint64_t v58 = +[CKDDaemonProcess currentProcess];
        objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, @"cloudd_main.m", 103, @"Didn't expect to run process type %ld in the sync bubble", objc_msgSend(v58, "processType"));
      }
      BOOL v25 = +[NSString stringWithFormat:@"com.apple.cloudd.%u", getuid()];
    }
    uint64_t v28 = v25;
    [(__CFString *)v28 UTF8String];
    _set_user_dir_suffix();
    bzero(buf, 0x400uLL);
    confstr(65537, (char *)buf, 0x400uLL);

    goto LABEL_35;
  }
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  unint64_t v22 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "cloudd is not sandboxed", buf, 2u);
  }
LABEL_35:
  int64_t v29 = +[CKBehaviorOptions sharedOptions];
  unsigned int v30 = [v29 CFNetworkLogging];

  if (v30)
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v31 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Enabling CFNetwork diagnostics", buf, 2u);
    }
    setenv("CFNETWORK_DIAGNOSTICS", "2", 1);
  }
  if (CKIsRunningInSyncBubble())
  {
    if (ck_log_initialization_predicate != -1) {
      dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
    }
    uint64_t v32 = ck_log_facility_ck;
    if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "cloudd is running in the sync bubble", buf, 2u);
    }
  }
  uint64_t v33 = +[CKDDaemonProcess currentProcess];
  if (![v33 processType])
  {
    uint64_t v34 = +[UMUserManager sharedManager];
    unsigned int v35 = [v34 isSharedIPad];

    if (!v35) {
      goto LABEL_50;
    }
    uint64_t v33 = +[UMUserManager sharedManager];
    uint64_t v36 = +[CKDMain sharedMain];
    [v33 registerUserSyncStakeholder:v36 withMachServiceName:kCKUserManagerMachServiceName];
  }
LABEL_50:
  id v37 = +[CKDMain sharedMain];
  if (v7)
  {
    os_log_type_t v38 = [v7 log];
    uint64_t v39 = (char *)[v7 identifier];
    if ((unint64_t)(v39 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_EVENT, (os_signpost_id_t)v39, "Launch", "Starting services", buf, 2u);
    }
  }
  os_log_type_t v40 = +[CKDXPCConnectionManager sharedConnectionManager];
  [v40 activate];

  uint64_t v41 = +[CKDMain sharedMain];
  uint64_t v42 = [v41 swiftMain];
  [v42 startCloudAssetsService];

  if (objc_opt_respondsToSelector()) {
    unsigned int v43 = +[C2ReportMetrics useCloudTelemetryService];
  }
  else {
    unsigned int v43 = _os_feature_enabled_impl();
  }
  if (v43)
  {
    uint64_t v44 = +[CKDMain sharedMain];
    uint64_t v45 = [v44 swiftMain];
    [v45 setupCloudTelemetryXpcServiceActivities];
  }
  if (v7)
  {
    uint64_t v46 = [v7 log];
    uint64_t v47 = (char *)[v7 identifier];
    if ((unint64_t)(v47 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v46, OS_SIGNPOST_EVENT, (os_signpost_id_t)v47, "Launch", "Started services", buf, 2u);
    }
  }
  unint64_t v48 = +[CKDDaemonProcess currentProcess];
  if ([v48 isSystemInstalledBinary])
  {
    uint64_t v49 = +[CKDDaemonProcess currentProcess];
    BOOL v50 = [v49 processType] == (id)2;

    if (v50) {
      goto LABEL_69;
    }
    unint64_t v48 = +[CKDMain sharedMain];
    uint64_t v51 = [v48 swiftMain];
    [v51 registerWithCacheDelete];
  }
LABEL_69:
  if (v7)
  {
    uint64_t v52 = [v7 log];
    uint64_t v53 = (char *)[v7 identifier];
    if ((unint64_t)(v53 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_INTERVAL_END, (os_signpost_id_t)v53, "Launch", "", buf, 2u);
    }
  }
  os_activity_scope_leave(&state);

  uint64_t v54 = +[NSRunLoop mainRunLoop];
  [v54 run];

  return 0;
}

void sub_10000F23C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, os_activity_scope_state_s state)
{
}

void sub_10000F278(id a1)
{
  if (ck_log_initialization_predicate != -1) {
    dispatch_once((dispatch_once_t *)&ck_log_initialization_predicate, ck_log_initialization_block);
  }
  id v1 = ck_log_facility_ck;
  if (os_log_type_enabled(ck_log_facility_ck, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Received SIGTERM", v2, 2u);
  }
}

uint64_t static XPCServiceNames.testService.getter()
{
  return static XPCServiceNames.testService.getter();
}

uint64_t static XPCServiceNames.userService.getter()
{
  return static XPCServiceNames.userService.getter();
}

uint64_t static XPCServiceNames.systemService.getter()
{
  return static XPCServiceNames.systemService.getter();
}

uint64_t URLResourceValues.volume.getter()
{
  return URLResourceValues.volume.getter();
}

uint64_t type metadata accessor for URLResourceValues()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.resourceValues(forKeys:)()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t URL.init(fileURLWithPath:isDirectory:)()
{
  return URL.init(fileURLWithPath:isDirectory:)();
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Date.timeIntervalSinceNow.getter()
{
  return Date.timeIntervalSinceNow.getter();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t type metadata accessor for EventValue()
{
  return type metadata accessor for EventValue();
}

uint64_t type metadata accessor for TransportConfiguration()
{
  return type metadata accessor for TransportConfiguration();
}

uint64_t type metadata accessor for Reporter()
{
  return type metadata accessor for Reporter();
}

uint64_t static CloudTelemetry.setupXpcServiceActivities()()
{
  return static CloudTelemetry.setupXpcServiceActivities()();
}

uint64_t type metadata accessor for CloudTelemetry()
{
  return type metadata accessor for CloudTelemetry();
}

uint64_t Dispatcher.dispatchRequest(_:)()
{
  return Dispatcher.dispatchRequest(_:)();
}

uint64_t static Dispatcher.shared.getter()
{
  return static Dispatcher.shared.getter();
}

uint64_t type metadata accessor for Dispatcher()
{
  return type metadata accessor for Dispatcher();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t static XPCListener.InitializationOptions.none.getter()
{
  return static XPCListener.InitializationOptions.none.getter();
}

uint64_t type metadata accessor for XPCListener.InitializationOptions()
{
  return type metadata accessor for XPCListener.InitializationOptions();
}

uint64_t XPCListener.init(service:targetQueue:options:incomingSessionHandler:)()
{
  return XPCListener.init(service:targetQueue:options:incomingSessionHandler:)();
}

uint64_t type metadata accessor for XPCListener()
{
  return type metadata accessor for XPCListener();
}

uint64_t CKLog.getter()
{
  return CKLog.getter();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return type metadata accessor for DispatchPredicate();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return _dispatchPreconditionTest(_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
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

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.append<A>(contentsOf:)()
{
  return String.append<A>(contentsOf:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t String.init<A>(_:)()
{
  return String.init<A>(_:)();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t OS_dispatch_queue.sync<A>(execute:)()
{
  return OS_dispatch_queue.sync<A>(execute:)();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
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

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
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

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t CKAdoptPersonaID()
{
  return _CKAdoptPersonaID();
}

uint64_t CKBuildVersion()
{
  return _CKBuildVersion();
}

uint64_t CKGetCacheDir()
{
  return _CKGetCacheDir();
}

uint64_t CKGetGlobalQueue()
{
  return _CKGetGlobalQueue();
}

uint64_t CKIsRunningInSyncBubble()
{
  return _CKIsRunningInSyncBubble();
}

uint64_t CKMuckingWithPersonas()
{
  return _CKMuckingWithPersonas();
}

uint64_t CKProductName()
{
  return _CKProductName();
}

uint64_t CKTestNotificationPrefix()
{
  return _CKTestNotificationPrefix();
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return _CacheDeleteRegisterInfoCallbacks();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

{
}

{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uid_t getuid(void)
{
  return _getuid();
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

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t setCKRunningInClientProcess()
{
  return _setCKRunningInClientProcess();
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return _strcasecmp(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
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

id objc_msgSend_CFNetworkLogging(void *a1, const char *a2, ...)
{
  return _[a1 CFNetworkLogging];
}

id objc_msgSend_CKSanitizedPath(void *a1, const char *a2, ...)
{
  return _[a1 CKSanitizedPath];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__getActiveSessionIdentifiersWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getActiveSessionIdentifiersWithCompletionHandler:");
}

id objc_msgSend__setupDistnotedEventHandler(void *a1, const char *a2, ...)
{
  return _[a1 _setupDistnotedEventHandler];
}

id objc_msgSend__setupNotifydEventHandler(void *a1, const char *a2, ...)
{
  return _[a1 _setupNotifydEventHandler];
}

id objc_msgSend__setupTCCEventHandler(void *a1, const char *a2, ...)
{
  return _[a1 _setupTCCEventHandler];
}

id objc_msgSend_accountDataSecurityObserver(void *a1, const char *a2, ...)
{
  return _[a1 accountDataSecurityObserver];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_applicationContainerPath(void *a1, const char *a2, ...)
{
  return _[a1 applicationContainerPath];
}

id objc_msgSend_applicationMetadataForApplicationID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationMetadataForApplicationID:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_backgroundSessionConfigurationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backgroundSessionConfigurationWithIdentifier:");
}

id objc_msgSend_canRunGivenAvailabilityState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRunGivenAvailabilityState:");
}

id objc_msgSend_clouddStarted(void *a1, const char *a2, ...)
{
  return _[a1 clouddStarted];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentProcess(void *a1, const char *a2, ...)
{
  return _[a1 currentProcess];
}

id objc_msgSend_daemonDatabaseDirectoryName(void *a1, const char *a2, ...)
{
  return _[a1 daemonDatabaseDirectoryName];
}

id objc_msgSend_dbFileName(void *a1, const char *a2, ...)
{
  return _[a1 dbFileName];
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return _[a1 defaultContext];
}

id objc_msgSend_defaultObserver(void *a1, const char *a2, ...)
{
  return _[a1 defaultObserver];
}

id objc_msgSend_deriveCurrentProcessWithArgC_argv_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deriveCurrentProcessWithArgC:argv:");
}

id objc_msgSend_expungeStaleAccountIDs(void *a1, const char *a2, ...)
{
  return _[a1 expungeStaleAccountIDs];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleManateeStatusUpdateNotificationWithAvailability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleManateeStatusUpdateNotificationWithAvailability:");
}

id objc_msgSend_hasMigrated(void *a1, const char *a2, ...)
{
  return _[a1 hasMigrated];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithDirectoryURLs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDirectoryURLs:");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return _[a1 invalidateAndCancel];
}

id objc_msgSend_invalidateCachedAccountInfo(void *a1, const char *a2, ...)
{
  return _[a1 invalidateCachedAccountInfo];
}

id objc_msgSend_isAppleInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isAppleInternalInstall];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return _[a1 isSharedIPad];
}

id objc_msgSend_isSystemInstalledBinary(void *a1, const char *a2, ...)
{
  return _[a1 isSystemInstalledBinary];
}

id objc_msgSend_kickOffPendingLongLivedOperations(void *a1, const char *a2, ...)
{
  return _[a1 kickOffPendingLongLivedOperations];
}

id objc_msgSend_knownContainerizedApplicationIDs(void *a1, const char *a2, ...)
{
  return _[a1 knownContainerizedApplicationIDs];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return _[a1 log];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_markSystemAvailableForCacheDelete(void *a1, const char *a2, ...)
{
  return _[a1 markSystemAvailableForCacheDelete];
}

id objc_msgSend_metadataCache(void *a1, const char *a2, ...)
{
  return _[a1 metadataCache];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_operationInfoCache(void *a1, const char *a2, ...)
{
  return _[a1 operationInfoCache];
}

id objc_msgSend_postAccountChangedNotificationToClients(void *a1, const char *a2, ...)
{
  return _[a1 postAccountChangedNotificationToClients];
}

id objc_msgSend_processType(void *a1, const char *a2, ...)
{
  return _[a1 processType];
}

id objc_msgSend_purge(void *a1, const char *a2, ...)
{
  return _[a1 purge];
}

id objc_msgSend_purgeDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeDirectoryAtURL:");
}

id objc_msgSend_registerCacheEvictionActivity(void *a1, const char *a2, ...)
{
  return _[a1 registerCacheEvictionActivity];
}

id objc_msgSend_registerDeviceCountRefreshActivity(void *a1, const char *a2, ...)
{
  return _[a1 registerDeviceCountRefreshActivity];
}

id objc_msgSend_registerObserver_forAccountChangeNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObserver:forAccountChangeNotification:");
}

id objc_msgSend_registerTokenRefreshActivity(void *a1, const char *a2, ...)
{
  return _[a1 registerTokenRefreshActivity];
}

id objc_msgSend_registerUserSyncStakeholder_withMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerUserSyncStakeholder:withMachServiceName:");
}

id objc_msgSend_registerWatcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerWatcher:");
}

id objc_msgSend_registerWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerWithBlock:");
}

id objc_msgSend_registerWithCacheDelete(void *a1, const char *a2, ...)
{
  return _[a1 registerWithCacheDelete];
}

id objc_msgSend_resetPrivacySettingsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetPrivacySettingsWithCompletionHandler:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _[a1 run];
}

id objc_msgSend_sandboxCloudD(void *a1, const char *a2, ...)
{
  return _[a1 sandboxCloudD];
}

id objc_msgSend_schedulePeriodicPurgesInDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schedulePeriodicPurgesInDirectory:");
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setShouldRemoveFileBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldRemoveFileBlock:");
}

id objc_msgSend_setShouldSkipFileBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldSkipFileBlock:");
}

id objc_msgSend_setUpAndRunning_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpAndRunning:");
}

id objc_msgSend_setupCloudTelemetryXpcServiceActivities(void *a1, const char *a2, ...)
{
  return _[a1 setupCloudTelemetryXpcServiceActivities];
}

id objc_msgSend_sharedConnectionManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnectionManager];
}

id objc_msgSend_sharedMain(void *a1, const char *a2, ...)
{
  return _[a1 sharedMain];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return _[a1 sharedMonitor];
}

id objc_msgSend_sharedNotifier(void *a1, const char *a2, ...)
{
  return _[a1 sharedNotifier];
}

id objc_msgSend_sharedOptions(void *a1, const char *a2, ...)
{
  return _[a1 sharedOptions];
}

id objc_msgSend_signpost(void *a1, const char *a2, ...)
{
  return _[a1 signpost];
}

id objc_msgSend_startCloudAssetsService(void *a1, const char *a2, ...)
{
  return _[a1 startCloudAssetsService];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_swiftMain(void *a1, const char *a2, ...)
{
  return _[a1 swiftMain];
}

id objc_msgSend_tokenRegistrationScheduler(void *a1, const char *a2, ...)
{
  return _[a1 tokenRegistrationScheduler];
}

id objc_msgSend_upAndRunning(void *a1, const char *a2, ...)
{
  return _[a1 upAndRunning];
}

id objc_msgSend_useCloudTelemetryService(void *a1, const char *a2, ...)
{
  return _[a1 useCloudTelemetryService];
}