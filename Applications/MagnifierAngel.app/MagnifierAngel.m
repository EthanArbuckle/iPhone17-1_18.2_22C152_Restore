int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  void *v11;
  int v12;
  char **v13;
  objc_class *ObjCClassFromMetadata;
  NSString *v15;
  objc_class *v16;
  NSString *v17;
  uint64_t v19;

  v3 = type metadata accessor for Logger();
  v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100043EA0 != -1) {
    swift_once();
  }
  v7 = qword_100046AA0;
  static MAGLog.service.getter();
  v8 = Logger.logObject.getter();
  v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Service will start listening for clients", v10, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11 = *(void **)(v7 + OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener);
  if (v11)
  {
    [v11 activate];
    v12 = static CommandLine.argc.getter();
    v13 = (char **)static CommandLine.unsafeArgv.getter();
    type metadata accessor for MAGAngelApp();
    ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    v15 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v15)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      v15 = (NSString *)String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    type metadata accessor for MAGAngelAppDelegate();
    v16 = (objc_class *)swift_getObjCClassFromMetadata();
    v17 = NSStringFromClass(v16);
    if (!v17)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      v17 = (NSString *)String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    UIApplicationMain(v12, v13, v15, v17);

    LODWORD(v11) = 0;
  }
  else
  {
    __break(1u);
  }
  return (int)v11;
}

void *sub_1000031A0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000031B0(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_1000031BC(uint64_t a1, uint64_t a2)
{
  return sub_1000035EC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000031E8(uint64_t a1, uint64_t a2)
{
  return sub_1000035EC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100003204@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100003230(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000032A8(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100003328@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003370(uint64_t a1)
{
  uint64_t v2 = sub_1000038D0(&qword_100044050, type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_1000038D0(&qword_100044058, type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10000342C(uint64_t a1)
{
  uint64_t v2 = sub_1000038D0(&qword_100044040, type metadata accessor for Role);
  uint64_t v3 = sub_1000038D0(&qword_100044048, type metadata accessor for Role);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000034E8@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100003530(uint64_t a1)
{
  uint64_t v2 = sub_1000038D0(&qword_100043FF0, type metadata accessor for SBUISystemApertureElementIdentifier);
  uint64_t v3 = sub_1000038D0(&qword_100043FF8, type metadata accessor for SBUISystemApertureElementIdentifier);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000035EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100003630()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100003684()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000036F8()
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

__n128 sub_100003784(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100003794(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_1000037B4(uint64_t result, int a2, int a3)
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

void type metadata accessor for SBUISystemApertureElementIdentifier(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
}

void type metadata accessor for TorchMode(uint64_t a1)
{
}

uint64_t sub_100003840()
{
  return sub_1000038D0(&qword_100043FD8, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_100003888()
{
  return sub_1000038D0(&qword_100043FE0, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_1000038D0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100003918()
{
  return sub_1000038D0(&qword_100043FE8, type metadata accessor for SBUISystemApertureElementIdentifier);
}

void type metadata accessor for Role(uint64_t a1)
{
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

void sub_100003988(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_1000039D0()
{
  return sub_1000038D0(&qword_100044010, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100003A18()
{
  return sub_1000038D0(&qword_100044018, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100003A60()
{
  return sub_1000038D0(&qword_100044020, type metadata accessor for Role);
}

uint64_t sub_100003AA8()
{
  return sub_1000038D0(&qword_100044028, type metadata accessor for Role);
}

uint64_t sub_100003AF0()
{
  return sub_1000038D0(&qword_100044030, type metadata accessor for Role);
}

uint64_t sub_100003B38()
{
  return sub_1000038D0(&qword_100044038, type metadata accessor for LaunchOptionsKey);
}

id sub_100003B90(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  uint64_t v54 = a6;
  id v40 = a5;
  v47 = a12;
  id v48 = a8;
  uint64_t v46 = a11;
  uint64_t v44 = a7;
  uint64_t v45 = a10;
  uint64_t v43 = a9;
  uint64_t v19 = sub_10000B130(&qword_100044BE0);
  __chkstk_darwin(v19 - 8);
  v53 = (char *)&v40 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v12[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_detectionModeFlashlightDispatchItem] = 0;
  uint64_t v21 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_scene;
  v49 = (char *)OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_scene;
  id v22 = objc_allocWithZone((Class)SCNScene);
  v23 = v12;
  id v50 = v12;
  id v24 = v23;
  *(void *)&v12[v21] = [v22 init];
  uint64_t v25 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_sceneRenderer;
  v42 = (char *)OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_sceneRenderer;
  *(void *)((char *)v24 + v25) = [self rendererWithDevice:0 options:0];
  Date.init()();
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus) = 0;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_arService) = a1;
  uint64_t v51 = a2;
  uint64_t v52 = a3;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_textDetectionService) = a2;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine) = a3;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_angelPreferences) = a4;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_personDetectionManager) = a5;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_anstPersonDetectionManager) = v54;
  uint64_t v26 = v43;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_doorDetectionService) = v44;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService) = a8;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pointAndSpeakService) = v26;
  uint64_t v27 = v46;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_imageCaptionService) = v45;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pointAndSpeakEventHandler) = v27;
  v28 = v47;
  *(void *)((char *)v24 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor) = v47;
  v29 = *(char **)&v49[(void)v50];
  id v41 = *(id *)&v42[(void)v24];
  v42 = v29;
  id v50 = a1;
  swift_retain();
  swift_retain();
  swift_retain();
  v49 = (char *)v40;
  swift_retain();
  swift_retain();
  id v48 = v48;
  swift_retain();
  swift_retain();
  swift_retain();
  id v30 = v28;
  id v31 = v41;
  v32 = v42;
  [v31 setScene:v32];

  v33 = (objc_class *)type metadata accessor for MAGAngelDetectionManager();
  v55.receiver = v24;
  v55.super_class = v33;
  id v34 = [super init];
  uint64_t v35 = type metadata accessor for TaskPriority();
  uint64_t v36 = (uint64_t)v53;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(v53, 1, 1, v35);
  v37 = (void *)swift_allocObject();
  v37[2] = 0;
  v37[3] = 0;
  v37[4] = v34;
  id v38 = v34;
  sub_100004158(v36, (uint64_t)&unk_1000441C0, (uint64_t)v37);
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  return v38;
}

uint64_t sub_100003F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  return _swift_task_switch(sub_100003FA0, 0, 0);
}

uint64_t sub_100003FA0()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 24) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100004034, v2, v1);
}

uint64_t sub_100004034()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  swift_retain();
  id v2 = v1;
  id v3 = [v2 description];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  MAGPointAndSpeakEventHandler.register(_:asActionHandler:)();
  swift_release_n();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100004158(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000BA60(a1, &qword_100044BE0);
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

uint64_t sub_100004304(uint64_t a1)
{
  v2[9] = a1;
  v2[10] = v1;
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  v2[11] = v3;
  v2[12] = *(void *)(v3 - 8);
  v2[13] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for DispatchQoS();
  v2[14] = v4;
  v2[15] = *(void *)(v4 - 8);
  v2[16] = swift_task_alloc();
  return _swift_task_switch(sub_100004420, 0, 0);
}

uint64_t sub_100004420()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[13];
  uint64_t v15 = v0[14];
  uint64_t v4 = v0[11];
  uint64_t v5 = v0[12];
  uint64_t v6 = (void *)v0[9];
  uint64_t v7 = (void *)v0[10];
  swift_retain();
  v14 = (void *)MAGTextDetectionService.queue.getter();
  swift_release();
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  *(void *)(v8 + 24) = v6;
  v0[6] = sub_10000BBD0;
  v0[7] = v8;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10000A36C;
  v0[5] = &unk_10003DCB0;
  v9 = _Block_copy(v0 + 2);
  id v10 = v7;
  id v11 = v6;
  static DispatchQoS.unspecified.getter();
  v0[8] = &_swiftEmptyArrayStorage;
  sub_10000B858();
  sub_10000B130(&qword_100044220);
  sub_10000B8B0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v9);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v15);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

uint64_t sub_100004614(void *a1, void *a2)
{
  swift_retain();
  id v4 = [a2 capturedImage];
  *(void *)(swift_allocObject() + 16) = a1;
  id v5 = a1;
  dispatch thunk of MAGTextDetectionService.detectText(fromPixelBuffer:languageCorrection:completionBlock:)();
  swift_release();

  return swift_release();
}

uint64_t sub_1000046D8(void *a1, char *a2)
{
  uint64_t v4 = type metadata accessor for Date();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v43 - v13;
  uint64_t v15 = sub_10000B130(&qword_100044BE0);
  __chkstk_darwin(v15 - 8);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v45 = v5;
    id v18 = a1;
    uint64_t v19 = detectTextBlocks(forDocument:)();
    if (*(void *)(v19 + 16))
    {
      uint64_t v44 = a2;
      static Log.angel.getter();
      swift_bridgeObjectRetain();
      uint64_t v20 = Logger.logObject.getter();
      os_log_type_t v21 = static os_log_type_t.debug.getter();
      if (os_log_type_enabled(v20, v21))
      {
        id v22 = (uint8_t *)swift_slowAlloc();
        id v43 = v18;
        v23 = v22;
        *(_DWORD *)id v22 = 134217984;
        uint64_t v46 = *(void *)(v19 + 16);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "%ld text blocks detected from document", v23, 0xCu);
        id v18 = v43;
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease();
      }
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
      Date.init()();
      v37 = v44;
      id v38 = &v44[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime];
      swift_beginAccess();
      (*(void (**)(char *, char *, uint64_t))(v45 + 40))(v38, v7, v4);
      swift_endAccess();
      uint64_t v39 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v17, 1, 1, v39);
      id v40 = (void *)swift_allocObject();
      v40[2] = 0;
      v40[3] = 0;
      v40[4] = v37;
      v40[5] = v19;
      id v41 = v37;
      uint64_t v35 = &unk_100044268;
      uint64_t v36 = (uint64_t)v17;
      id v34 = v40;
    }
    else
    {
      swift_bridgeObjectRelease();
      static Log.angel.getter();
      v28 = Logger.logObject.getter();
      os_log_type_t v29 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v28, v29))
      {
        id v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v30 = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, v29, "No text blocks detected from document", v30, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      uint64_t v31 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v31 - 8) + 56))(v17, 1, 1, v31);
      type metadata accessor for MainActor();
      v32 = a2;
      uint64_t v33 = static MainActor.shared.getter();
      id v34 = (void *)swift_allocObject();
      v34[2] = v33;
      v34[3] = &protocol witness table for MainActor;
      v34[4] = v32;
      uint64_t v35 = &unk_100044278;
      uint64_t v36 = (uint64_t)v17;
    }
    sub_100004158(v36, (uint64_t)v35, (uint64_t)v34);
  }
  else
  {
    uint64_t v24 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v17, 1, 1, v24);
    type metadata accessor for MainActor();
    uint64_t v25 = a2;
    uint64_t v26 = static MainActor.shared.getter();
    uint64_t v27 = (void *)swift_allocObject();
    v27[2] = v26;
    v27[3] = &protocol witness table for MainActor;
    v27[4] = v25;
    sub_100004158((uint64_t)v17, (uint64_t)&unk_100044258, (uint64_t)v27);
  }
  return swift_release();
}

uint64_t sub_100004C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000BEFC, v6, v5);
}

uint64_t sub_100004CE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100004D78, v6, v5);
}

uint64_t sub_100004D78()
{
  swift_release();
  swift_retain();
  dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.setter();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100004DFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  uint64_t v6 = type metadata accessor for MAGOutputEventEnvironment();
  v5[4] = v6;
  v5[5] = *(void *)(v6 - 8);
  v5[6] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for MAGOutputEventSource();
  v5[7] = v7;
  v5[8] = *(void *)(v7 - 8);
  v5[9] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for MAGOutputEvent();
  v5[10] = v8;
  v5[11] = *(void *)(v8 - 8);
  v5[12] = swift_task_alloc();
  return _swift_task_switch(sub_100004F74, 0, 0);
}

uint64_t sub_100004F74()
{
  uint64_t v2 = v0[8];
  uint64_t v1 = v0[9];
  uint64_t v4 = v0[6];
  uint64_t v3 = v0[7];
  uint64_t v5 = v0[4];
  uint64_t v6 = v0[5];
  uint64_t v7 = v0[3];
  v0[13] = *(void *)(v0[2] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  sub_10000B130(&qword_100044280);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100032AF0;
  *(void *)(v8 + 32) = v7;
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for MAGOutputEventSource.liveDetection(_:), v3);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v4, enum case for MAGOutputEventEnvironment.angel(_:), v5);
  swift_retain();
  swift_bridgeObjectRetain();
  static MAGOutputEvent.detectedText(_:source:environment:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  type metadata accessor for MainActor();
  v0[14] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100005128, v10, v9);
}

uint64_t sub_100005128()
{
  uint64_t v2 = v0[11];
  uint64_t v1 = v0[12];
  uint64_t v3 = v0[10];
  swift_release();
  dispatch thunk of MAGOutputEngine.schedule(_:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000051E4(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  uint64_t v3 = type metadata accessor for MAGOutputEventEnvironment();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for MAGOutputEventSource();
  v2[17] = v4;
  v2[18] = *(void *)(v4 - 8);
  v2[19] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for MAGOutputEvent();
  v2[20] = v5;
  v2[21] = *(void *)(v5 - 8);
  v2[22] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Date();
  v2[23] = v6;
  v2[24] = *(void *)(v6 - 8);
  v2[25] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  v2[26] = v7;
  v2[27] = *(void *)(v7 - 8);
  v2[28] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for DispatchQoS();
  v2[29] = v8;
  v2[30] = *(void *)(v8 - 8);
  v2[31] = swift_task_alloc();
  return _swift_task_switch(sub_100005470, 0, 0);
}

uint64_t sub_100005470()
{
  uint64_t v1 = v0[13];
  [(id)v0[12] timestamp];
  double v3 = v2;
  uint64_t v4 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_arService;
  id v5 = *(id *)(v1 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_arService);
  dispatch thunk of MAGARService.lastARFrameTimestamp.getter();
  double v7 = v6;

  if (v3 - v7 < 0.1) {
    goto LABEL_21;
  }
  uint64_t v8 = (void *)v0[12];
  uint64_t v9 = v0[13];
  id v10 = *(id *)(v1 + v4);
  [v8 timestamp];
  dispatch thunk of MAGARService.lastARFrameTimestamp.setter();

  uint64_t v11 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_personDetectionManager;
  [*(id *)(v9 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_personDetectionManager) computePersonDetectionFromFrame:v8 interfaceOrientation:1];
  swift_retain();
  dispatch thunk of ANSTPersonDetectionManager.computePersonDetectionFromFrame(frame:interfaceOrientation:)();
  uint64_t v12 = (void *)v0[12];
  swift_release();
  uint64_t v13 = *(void **)(v9 + v11);
  swift_retain();
  id v14 = [v13 detectedPersonArray];
  sub_10000BB08(0, &qword_100044248);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v15 = [v12 capturedImage];
  dispatch thunk of ANSTPersonDetectionManager.matchANSTDetections(to:anstDetections:orientation:capturedImage:)();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (*((unsigned char *)v0 + 280) == 1)
  {
    uint64_t v16 = v0[13];
    id v17 = [*(id *)(v9 + v11) detectedPersonArray];
    sub_10000BB08(0, &qword_100044248);
    static Array._unconditionallyBridgeFromObjectiveC(_:)();

    static SpatialPersonDetection.spatialize(_:frame:orientation:)();
    swift_bridgeObjectRelease();
    id v18 = *(id *)(v16 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
    dispatch thunk of MAGObjectUnderstandingService.updateSeatOccupancy(for:)();

    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (*((unsigned char *)v0 + 281) != 1) {
    goto LABEL_19;
  }
  id v19 = [*(id *)(v9 + v11) detectedPersonArray];
  sub_10000BB08(0, &qword_100044248);
  unint64_t v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v39 = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v21 = swift_bridgeObjectRelease();
    if (v39) {
      goto LABEL_7;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    goto LABEL_19;
  }
  if (!*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
    goto LABEL_18;
  }
LABEL_7:
  if ((v20 & 0xC000000000000001) != 0)
  {
    id v24 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return _swift_task_switch(v21, v22, v23);
    }
    id v24 = *(id *)(v20 + 32);
  }
  uint64_t v25 = v24;
  v0[32] = v24;
  swift_bridgeObjectRelease();
  if ([v25 isEnabled] && objc_msgSend(v25, "isValid"))
  {
    [v25 position];
    int v27 = v26;
    if (v26 >= 1)
    {
      uint64_t v43 = v0[31];
      uint64_t v28 = v0[28];
      uint64_t v47 = v0[30];
      uint64_t v48 = v0[29];
      uint64_t v30 = v0[26];
      uint64_t v29 = v0[27];
      uint64_t v49 = v0[25];
      uint64_t v50 = v0[24];
      uint64_t v51 = v0[23];
      uint64_t v52 = v0[18];
      uint64_t v53 = v0[17];
      uint64_t v54 = v0[19];
      uint64_t v57 = v0[16];
      uint64_t v55 = v0[15];
      uint64_t v56 = v0[14];
      uint64_t v45 = v0[13];
      sub_10000BB08(0, (unint64_t *)&qword_100044218);
      uint64_t v44 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v31 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v32 = swift_allocObject();
      *(void *)(v32 + 16) = v31;
      *(void *)(v32 + 24) = v25;
      *(_DWORD *)(v32 + 32) = v27;
      v0[6] = sub_10000BB84;
      v0[7] = v32;
      v0[2] = _NSConcreteStackBlock;
      v0[3] = 1107296256;
      v0[4] = sub_10000A36C;
      v0[5] = &unk_10003DC60;
      uint64_t v33 = _Block_copy(v0 + 2);
      swift_retain();
      id v46 = v25;
      static DispatchQoS.unspecified.getter();
      v0[11] = &_swiftEmptyArrayStorage;
      sub_10000B858();
      sub_10000B130(&qword_100044220);
      sub_10000B8B0();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v33);

      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v28, v30);
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v43, v48);
      swift_release();
      swift_release();
      Date.init()();
      uint64_t v34 = v45 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 40))(v34, v49, v51);
      swift_endAccess();
      v0[33] = *(void *)(v45 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
      (*(void (**)(uint64_t, void, uint64_t))(v52 + 104))(v54, enum case for MAGOutputEventSource.liveDetection(_:), v53);
      (*(void (**)(uint64_t, void, uint64_t))(v55 + 104))(v57, enum case for MAGOutputEventEnvironment.angel(_:), v56);
      id v35 = v46;
      swift_retain();
      static MAGOutputEvent.peopleDetection(closestPerson:depth:source:environment:)();

      (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v57, v56);
      (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v54, v53);
      type metadata accessor for MainActor();
      v0[34] = static MainActor.shared.getter();
      uint64_t v36 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v38 = v37;
      uint64_t v21 = (uint64_t)sub_100005D1C;
      uint64_t v22 = v36;
      uint64_t v23 = v38;
      return _swift_task_switch(v21, v22, v23);
    }
    goto LABEL_20;
  }

LABEL_19:
  id v40 = *(id *)(v0[13] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor);
  uint64_t v25 = (void *)dispatch thunk of MAGPulseFeedbackProcessor.toneGenerator.getter();

  [v25 stopPulse];
LABEL_20:

LABEL_21:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v41 = (uint64_t (*)(void))v0[1];
  return v41();
}

uint64_t sub_100005D1C()
{
  uint64_t v2 = v0[21];
  uint64_t v1 = v0[22];
  uint64_t v3 = v0[20];
  swift_release();
  dispatch thunk of MAGOutputEngine.schedule(_:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_100005DBC, 0, 0);
}

uint64_t sub_100005DBC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_100005E70()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = *(id *)(Strong + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor);

    dispatch thunk of MAGPulseFeedbackProcessor.processPulseFeedback(nearestPersonData:depth:)();
  }
}

uint64_t sub_100005EF8(uint64_t a1)
{
  v2[12] = a1;
  v2[13] = v1;
  uint64_t v3 = type metadata accessor for MAGOutputEventEnvironment();
  v2[14] = v3;
  v2[15] = *(void *)(v3 - 8);
  v2[16] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for MAGOutputEventSource();
  v2[17] = v4;
  v2[18] = *(void *)(v4 - 8);
  v2[19] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for MAGOutputEvent();
  v2[20] = v5;
  v2[21] = *(void *)(v5 - 8);
  v2[22] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Date();
  v2[23] = v6;
  v2[24] = *(void *)(v6 - 8);
  v2[25] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DispatchWorkItemFlags();
  v2[26] = v7;
  v2[27] = *(void *)(v7 - 8);
  v2[28] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for DispatchQoS();
  v2[29] = v8;
  v2[30] = *(void *)(v8 - 8);
  v2[31] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for DetectedDoor();
  v2[32] = v9;
  v2[33] = *(void *)(v9 - 8);
  v2[34] = swift_task_alloc();
  v2[35] = swift_task_alloc();
  uint64_t v10 = sub_10000B130(&qword_100044230);
  v2[36] = v10;
  v2[37] = *(void *)(v10 - 8);
  v2[38] = swift_task_alloc();
  sub_10000B130(&qword_100044238);
  v2[39] = swift_task_alloc();
  v2[40] = swift_task_alloc();
  sub_10000B130(&qword_100044240);
  v2[41] = swift_task_alloc();
  v2[42] = swift_task_alloc();
  return _swift_task_switch(sub_1000062D0, 0, 0);
}

uint64_t sub_1000062D0()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_doorDetectionService;
  v0[43] = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_doorDetectionService;
  v0[44] = *(void *)(v1 + v2);
  v0[45] = self;
  v0[46] = type metadata accessor for MainActor();
  swift_retain();
  v0[47] = static MainActor.shared.getter();
  uint64_t v4 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100006398, v4, v3);
}

uint64_t sub_100006398()
{
  uint64_t v1 = *(void **)(v0 + 360);
  swift_release();
  *(void *)(v0 + 384) = [v1 mainScreen];
  return _swift_task_switch(sub_100006420, 0, 0);
}

uint64_t sub_100006420()
{
  *(void *)(v0 + 392) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000064AC, v2, v1);
}

uint64_t sub_1000064AC()
{
  uint64_t v1 = (void *)v0[48];
  swift_release();
  [v1 bounds];
  unint64_t v3 = v2;
  unint64_t v5 = v4;

  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t, __n128, __n128))((char *)&async function pointer to dispatch thunk of MAGDoorDetectionService.detectDoorsWithFrame(frame:size:detectDecorations:)
                                                                 + async function pointer to dispatch thunk of MAGDoorDetectionService.detectDoorsWithFrame(frame:size:detectDecorations:));
  uint64_t v6 = (void *)swift_task_alloc();
  v0[50] = v6;
  *uint64_t v6 = v0;
  v6[1] = sub_100006590;
  uint64_t v7 = v0[12];
  v8.n128_u64[0] = v3;
  v9.n128_u64[0] = v5;
  return v11(v7, 1, v8, v9);
}

uint64_t sub_100006590(uint64_t a1)
{
  *(void *)(*(void *)v1 + 408) = a1;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_1000066B0, 0, 0);
}

uint64_t sub_1000066B0()
{
  uint64_t v1 = v0[51];
  if (!v1) {
    goto LABEL_22;
  }
  if (!*(void *)(v1 + 16))
  {
    uint64_t v31 = v0[13];
    swift_bridgeObjectRelease();
    id v32 = *(id *)(v31 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor);
    uint64_t v33 = (void *)dispatch thunk of MAGPulseFeedbackProcessor.doorToneGenerator.getter();

    [v33 stopPulse];
LABEL_22:
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
    uint64_t v34 = (uint64_t (*)(void))v0[1];
    return v34();
  }
  unint64_t v64 = *(void *)(v1 + 16);
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[37];
  uint64_t v66 = v0[36];
  uint64_t v4 = v0[32];
  uint64_t v5 = v0[33];
  uint64_t v58 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  uint64_t v57 = *(void (**)(uint64_t))(v5 + 16);
  v57(v2);
  uint64_t v56 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56);
  v56(v2, 0, 1, v4);
  uint64_t v6 = (void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32);
  v63 = (void (**)(void, void, void, void))(v3 + 56);
  uint64_t v7 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  uint64_t v60 = v1;
  uint64_t v8 = swift_bridgeObjectRetain();
  unint64_t v11 = 0;
  float v12 = 3.4028e38;
  while (1)
  {
    if (v11 == v64)
    {
      (*v63)(v0[39], 1, 1, v0[36]);
      unint64_t v11 = v64;
    }
    else
    {
      if (v11 >= *(void *)(v60 + 16))
      {
        __break(1u);
LABEL_31:
        __break(1u);
        return _swift_task_switch(v8, v9, v10);
      }
      uint64_t v13 = (unint64_t *)v0[39];
      uint64_t v14 = v0[36];
      uint64_t v15 = v0[32];
      uint64_t v16 = v0[38] + *(int *)(v66 + 48);
      ((void (*)(uint64_t, unint64_t, uint64_t))v57)(v16, v58 + *(void *)(v5 + 72) * v11, v15);
      id v17 = (char *)v13 + *(int *)(v66 + 48);
      *uint64_t v13 = v11;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v17, v16, v15);
      (*v63)(v13, 0, 1, v14);
      ++v11;
    }
    uint64_t v18 = v0[40];
    uint64_t v19 = v0[36];
    sub_10000B990(v0[39], v18);
    if ((*v7)(v18, 1, v19) == 1) {
      break;
    }
    unint64_t v20 = *v6;
    (*v6)(v0[35], v0[40] + *(int *)(v66 + 48), v0[32]);
    if ((DetectedDoor.depth.getter() & 0x100000000) != 0) {
      goto LABEL_12;
    }
    uint64_t v8 = DetectedDoor.depth.getter();
    if ((v8 & 0x100000000) != 0) {
      goto LABEL_31;
    }
    if (*(float *)&v8 > 4.0)
    {
LABEL_12:
      swift_retain();
      DetectedDoor.normalizedBbox.getter();
      dispatch thunk of MAGDoorDetectionService.getAverageRectDistance(_:inFrame:)();
      swift_release();
      DetectedDoor.depth.setter();
    }
    uint64_t v21 = DetectedDoor.depth.getter();
    if ((v21 & (unint64_t)&_mh_execute_header) != 0) {
      float v22 = 3.4028e38;
    }
    else {
      float v22 = *(float *)&v21;
    }
    if (v22 < v12)
    {
      uint64_t v23 = v0[42];
      uint64_t v24 = v0[35];
      uint64_t v25 = v0[32];
      sub_10000BA60(v23, &qword_100044240);
      v20(v23, v24, v25);
      uint64_t v8 = ((uint64_t (*)(uint64_t, void, uint64_t, uint64_t))v56)(v23, 0, 1, v25);
      float v12 = v22;
    }
    else
    {
      uint64_t v8 = (*(uint64_t (**)(void, void))(v5 + 8))(v0[35], v0[32]);
    }
  }
  uint64_t v27 = v0[41];
  uint64_t v26 = v0[42];
  uint64_t v29 = v0[32];
  uint64_t v28 = v0[33];
  swift_bridgeObjectRelease();
  sub_10000B9F8(v26, v27);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v27, 1, v29) == 1)
  {
    uint64_t v30 = v0[41];
    sub_10000BA60(v0[42], &qword_100044240);
    swift_bridgeObjectRelease();
    sub_10000BA60(v30, &qword_100044240);
    goto LABEL_22;
  }
  (*v6)(v0[34], v0[41], v0[32]);
  if (v12 < 3.4028e38)
  {
    uint64_t v36 = v0[30];
    uint64_t v37 = v0[31];
    uint64_t v38 = v0[28];
    uint64_t v67 = v0[29];
    uint64_t v40 = v0[26];
    uint64_t v39 = v0[27];
    sub_10000BB08(0, (unint64_t *)&qword_100044218);
    v65 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v41 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v42 = swift_allocObject();
    *(void *)(v42 + 16) = v41;
    *(float *)(v42 + 24) = v12;
    v0[6] = sub_10000BAF4;
    v0[7] = v42;
    v0[2] = _NSConcreteStackBlock;
    v0[3] = 1107296256;
    v0[4] = sub_10000A36C;
    v0[5] = &unk_10003DC10;
    uint64_t v43 = _Block_copy(v0 + 2);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    v0[11] = &_swiftEmptyArrayStorage;
    sub_10000B858();
    sub_10000B130(&qword_100044220);
    sub_10000B8B0();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v43);

    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v38, v40);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v37, v67);
    swift_release();
    swift_release();
  }
  uint64_t v44 = v0[24];
  uint64_t v45 = v0[25];
  uint64_t v46 = v0[23];
  uint64_t v47 = v0[18];
  uint64_t v61 = v0[19];
  uint64_t v48 = v0[16];
  uint64_t v59 = v0[17];
  uint64_t v49 = v0[15];
  uint64_t v62 = v0[14];
  uint64_t v50 = v0[13];
  Date.init()();
  uint64_t v51 = v50 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 40))(v51, v45, v46);
  swift_endAccess();
  v0[52] = *(void *)(v50 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  swift_retain();
  swift_retain();
  uint64_t v52 = (void *)dispatch thunk of MAGDoorDetectionService.openStateConfidenceThreshold.getter();
  swift_release();
  Float.init(truncating:)();

  (*(void (**)(uint64_t, void, uint64_t))(v47 + 104))(v61, enum case for MAGOutputEventSource.liveDetection(_:), v59);
  (*(void (**)(uint64_t, void, uint64_t))(v49 + 104))(v48, enum case for MAGOutputEventEnvironment.angel(_:), v62);
  static MAGOutputEvent.doorDetection(_:_:openStateConfidenceThreshold:source:environment:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v62);
  (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v61, v59);
  v0[53] = static MainActor.shared.getter();
  uint64_t v53 = dispatch thunk of Actor.unownedExecutor.getter();
  uint64_t v55 = v54;
  uint64_t v8 = (uint64_t)sub_100006F5C;
  uint64_t v9 = v53;
  uint64_t v10 = v55;
  return _swift_task_switch(v8, v9, v10);
}

uint64_t sub_100006F5C()
{
  uint64_t v2 = v0[21];
  uint64_t v1 = v0[22];
  uint64_t v3 = v0[20];
  swift_release();
  dispatch thunk of MAGOutputEngine.schedule(_:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  return _swift_task_switch(sub_100006FFC, 0, 0);
}

uint64_t sub_100006FFC()
{
  uint64_t v1 = v0[42];
  (*(void (**)(void, void))(v0[33] + 8))(v0[34], v0[32]);
  sub_10000BA60(v1, &qword_100044240);
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
  uint64_t v2 = (uint64_t (*)(void))v0[1];
  return v2();
}

void sub_100007134(float a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    id v4 = *(id *)(Strong + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor);

    float v5 = a1 * 1000.0;
    if ((~COERCE_INT(a1 * 1000.0) & 0x7F800000) != 0)
    {
      if (v5 > -2147500000.0)
      {
        if (v5 < 2147500000.0)
        {
          dispatch thunk of MAGPulseFeedbackProcessor.processDoorPulseFeedback(depth:)();

          return;
        }
LABEL_9:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_9;
  }
}

uint64_t sub_1000071F8(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  uint64_t v4 = type metadata accessor for MAGOutputEventEnvironment();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for MAGOutputEventSource();
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  sub_10000B130(&qword_100044228);
  v3[14] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for MAGOutputEvent();
  v3[15] = v6;
  v3[16] = *(void *)(v6 - 8);
  v3[17] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Date();
  v3[18] = v7;
  v3[19] = *(void *)(v7 - 8);
  v3[20] = swift_task_alloc();
  return _swift_task_switch(sub_100007400, 0, 0);
}

uint64_t sub_100007400()
{
  uint64_t v1 = v0[19];
  uint64_t v2 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = v0[14];
  uint64_t v5 = v0[12];
  uint64_t v18 = v0[11];
  uint64_t v19 = v0[13];
  uint64_t v6 = v0[9];
  uint64_t v7 = v0[7];
  uint64_t v20 = v0[8];
  uint64_t v21 = v0[10];
  uint64_t v17 = v0[5];
  Date.init()();
  uint64_t v8 = v7 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 40))(v8, v2, v3);
  swift_endAccess();
  v0[21] = *(void *)(v7 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  uint64_t v9 = type metadata accessor for DetectedObject();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v4, v17, v9);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v10 + 56))(v4, 0, 1, v9);
  unint64_t v11 = *(void **)(v7 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
  swift_retain();
  id v12 = v11;
  uint64_t v13 = (void *)dispatch thunk of MAGObjectUnderstandingService.objectPointerParentNode.getter();

  SCNNode.base.getter();
  SIMD3<>.init(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v19, enum case for MAGOutputEventSource.liveDetection(_:), v18);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v21, enum case for MAGOutputEventEnvironment.angel(_:), v20);
  static MAGOutputEvent.objectUnderstanding(detectedObject:cameraPosition:detectedOccupants:source:environment:)();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v21, v20);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v19, v18);
  sub_10000BA60(v4, &qword_100044228);
  type metadata accessor for MainActor();
  v0[22] = static MainActor.shared.getter();
  uint64_t v15 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000076D0, v15, v14);
}

uint64_t sub_1000076D0()
{
  uint64_t v2 = v0[16];
  uint64_t v1 = v0[17];
  uint64_t v3 = v0[15];
  swift_release();
  dispatch thunk of MAGOutputEngine.schedule(_:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_1000077AC(uint64_t a1, uint64_t a2)
{
  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  uint64_t v4 = type metadata accessor for MAGOutputEventEnvironment();
  v3[8] = v4;
  v3[9] = *(void *)(v4 - 8);
  v3[10] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for MAGOutputEventSource();
  v3[11] = v5;
  v3[12] = *(void *)(v5 - 8);
  v3[13] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for MAGOutputEvent();
  v3[14] = v6;
  v3[15] = *(void *)(v6 - 8);
  v3[16] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Date();
  v3[17] = v7;
  v3[18] = *(void *)(v7 - 8);
  v3[19] = swift_task_alloc();
  return _swift_task_switch(sub_100007984, 0, 0);
}

uint64_t sub_100007984()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[19];
  uint64_t v3 = v0[17];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[10];
  uint64_t v15 = v0[11];
  uint64_t v16 = v0[13];
  uint64_t v6 = v0[9];
  uint64_t v7 = v0[7];
  uint64_t v17 = v0[8];
  Date.init()();
  uint64_t v8 = v7 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 40))(v8, v2, v3);
  swift_endAccess();
  v0[20] = *(void *)(v7 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  uint64_t v9 = *(void **)(v7 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
  swift_retain();
  id v10 = v9;
  unint64_t v11 = (void *)dispatch thunk of MAGObjectUnderstandingService.objectPointerParentNode.getter();

  SCNNode.base.getter();
  SIMD3<>.init(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v16, enum case for MAGOutputEventSource.liveDetection(_:), v15);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, enum case for MAGOutputEventEnvironment.angel(_:), v17);
  static MAGOutputEvent.objectUnderstanding(detectedObjectGroup:cameraPosition:detectedOccupants:source:environment:)();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v17);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v16, v15);
  type metadata accessor for MainActor();
  v0[21] = static MainActor.shared.getter();
  uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100007BC0, v13, v12);
}

uint64_t sub_100007BC0()
{
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[14];
  swift_release();
  dispatch thunk of MAGOutputEngine.schedule(_:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100007C90(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  uint64_t v3 = type metadata accessor for MAGOutputEventEnvironment();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for MAGOutputEventSource();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for MAGOutputEvent();
  v2[13] = v5;
  v2[14] = *(void *)(v5 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for Date();
  v2[16] = v6;
  v2[17] = *(void *)(v6 - 8);
  v2[18] = swift_task_alloc();
  return _swift_task_switch(sub_100007E64, 0, 0);
}

uint64_t sub_100007E64()
{
  uint64_t v1 = v0[17];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[16];
  uint64_t v4 = v0[11];
  uint64_t v5 = v0[9];
  uint64_t v15 = v0[10];
  uint64_t v16 = v0[12];
  uint64_t v6 = v0[8];
  uint64_t v17 = v0[7];
  uint64_t v7 = v0[6];
  Date.init()();
  uint64_t v8 = v7 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 40))(v8, v2, v3);
  swift_endAccess();
  v0[19] = *(void *)(v7 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  uint64_t v9 = *(void **)(v7 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
  swift_retain();
  id v10 = v9;
  unint64_t v11 = (void *)dispatch thunk of MAGObjectUnderstandingService.objectPointerParentNode.getter();

  SCNNode.base.getter();
  SIMD3<>.init(_:)();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v16, enum case for MAGOutputEventSource.liveDetection(_:), v15);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v5, enum case for MAGOutputEventEnvironment.angel(_:), v17);
  static MAGOutputEvent.objectUnderstanding(furnitureDetections:cameraPosition:source:environment:)();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v17);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v16, v15);
  type metadata accessor for MainActor();
  v0[20] = static MainActor.shared.getter();
  uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100008098, v13, v12);
}

uint64_t sub_100008098()
{
  uint64_t v2 = v0[14];
  uint64_t v1 = v0[15];
  uint64_t v3 = v0[13];
  swift_release();
  dispatch thunk of MAGOutputEngine.schedule(_:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_100008168(uint64_t a1)
{
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v1;
  return _swift_task_switch(sub_100008188, 0, 0);
}

uint64_t sub_100008188()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 32) == 1)
  {
    uint64_t v1 = *(void **)(v0 + 16);
    uint64_t v2 = *(void *)(v0 + 24);
    id v3 = *(id *)(v2 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
    dispatch thunk of MAGObjectUnderstandingService.understandObjects(frame:)();

    id v4 = *(id *)(v2 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_sceneRenderer);
    [v1 timestamp];
    [v4 updateAtTime:];
  }
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

void sub_1000082B4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService);
  if (v5 == 1)
  {
    uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_scene);
    id v3 = v1;
    id v4 = v2;
    dispatch thunk of MAGObjectUnderstandingService.startService(with:)();
  }
  else
  {
    id v4 = v1;
    dispatch thunk of MAGObjectUnderstandingService.stopService()();
  }
}

uint64_t sub_100008390(uint64_t a1, uint64_t a2)
{
  v2[8] = a1;
  v2[9] = a2;
  uint64_t v3 = type metadata accessor for DetectedTextBlock();
  v2[10] = v3;
  v2[11] = *(void *)(v3 - 8);
  v2[12] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for DetectedTextAndLanguage();
  v2[13] = v4;
  v2[14] = *(void *)(v4 - 8);
  v2[15] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for MAGOutputEventEnvironment();
  v2[16] = v5;
  v2[17] = *(void *)(v5 - 8);
  v2[18] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for MAGOutputEventSource();
  v2[19] = v6;
  v2[20] = *(void *)(v6 - 8);
  v2[21] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for MAGOutputAnnouncement();
  v2[22] = v7;
  v2[23] = *(void *)(v7 - 8);
  v2[24] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for MAGOutputEvent();
  v2[25] = v8;
  v2[26] = *(void *)(v8 - 8);
  v2[27] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType();
  v2[28] = v9;
  v2[29] = *(void *)(v9 - 8);
  v2[30] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for Date();
  v2[31] = v10;
  v2[32] = *(void *)(v10 - 8);
  v2[33] = swift_task_alloc();
  type metadata accessor for MainActor();
  v2[34] = static MainActor.shared.getter();
  uint64_t v12 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100008708, v12, v11);
}

uint64_t sub_100008708()
{
  uint64_t v1 = v0;
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (char *)Strong;
    uint64_t v5 = v0 + 30;
    uint64_t v4 = v1[30];
    uint64_t v6 = v1[32];
    uint64_t v7 = v1[33];
    uint64_t v8 = v1[31];
    uint64_t v9 = v1[29];
    uint64_t v58 = v1[28];
    Date.init()();
    uint64_t v62 = v3;
    uint64_t v10 = &v3[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime];
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 40))(v10, v7, v8);
    swift_endAccess();
    MAGPointAndSpeakEvent.eventType.getter();
    int v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 88))(v4, v58);
    if (v11 == enum case for MAGPointAndSpeakEvent.PointAndSpeakEventType.processPointAndSpeakUpdate(_:))
    {
      uint64_t v5 = v1 + 27;
      uint64_t v12 = v1[20];
      uint64_t v13 = v1[21];
      uint64_t v14 = v1[18];
      uint64_t v15 = v1[19];
      uint64_t v17 = v1[16];
      uint64_t v16 = v1[17];
      (*(void (**)(void, void))(v1[29] + 96))(v1[30], v1[28]);
      (*(void (**)(uint64_t, void, uint64_t))(v12 + 104))(v13, enum case for MAGOutputEventSource.liveDetection(_:), v15);
      (*(void (**)(uint64_t, void, uint64_t))(v16 + 104))(v14, enum case for MAGOutputEventEnvironment.angel(_:), v17);
      swift_retain();
      static MAGOutputEvent.pointAndSpeak(_:source:environment:)();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v17);
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v15);
      dispatch thunk of MAGOutputEngine.schedule(_:)();
    }
    else
    {
      if (v11 == enum case for MAGPointAndSpeakEvent.PointAndSpeakEventType.handDetected(_:))
      {
        uint64_t v5 = v1 + 27;
        uint64_t v53 = v1[24];
        uint64_t v18 = v1[21];
        uint64_t v56 = v1[23];
        uint64_t v59 = v1[22];
        uint64_t v19 = v1[19];
        uint64_t v20 = v1[20];
        uint64_t v21 = v1[17];
        uint64_t v22 = v1[18];
        uint64_t v23 = v1[16];
        (*(void (**)(void))(v56 + 104))();
        (*(void (**)(uint64_t, void, uint64_t))(v20 + 104))(v18, enum case for MAGOutputEventSource.magAction(_:), v19);
        (*(void (**)(uint64_t, void, uint64_t))(v21 + 104))(v22, enum case for MAGOutputEventEnvironment.angel(_:), v23);
        swift_retain();
        static MAGOutputEvent.announcement(_:source:environment:)();
        (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v22, v23);
        (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
        (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v53, v59);
        dispatch thunk of MAGOutputEngine.schedule(_:)();
        swift_release();

LABEL_9:
        uint64_t v30 = v5 - 1;
        uint64_t v31 = v5 - 2;
LABEL_10:
        (*(void (**)(void, void))(*v30 + 8))(*v5, *v31);
        goto LABEL_11;
      }
      if (v11 != enum case for MAGPointAndSpeakEvent.PointAndSpeakEventType.handTooClose(_:))
      {
        if (v11 == enum case for MAGPointAndSpeakEvent.PointAndSpeakEventType.handleNoContentAvailable(_:))
        {
          uint64_t v5 = v1 + 15;
          uint64_t v34 = v1[15];
          uint64_t v49 = v1[27];
          uint64_t v50 = v1[26];
          uint64_t v51 = v1[25];
          uint64_t v55 = v1[20];
          uint64_t v44 = v1[19];
          uint64_t v45 = v1[21];
          uint64_t v46 = v1[17];
          uint64_t v47 = v1[16];
          uint64_t v48 = v1[18];
          uint64_t v35 = v1[14];
          uint64_t v43 = v1[13];
          uint64_t v36 = v1[11];
          uint64_t v52 = v1[12];
          uint64_t v61 = v1[10];
          String.localized.getter();
          id v37 = [self currentLanguageCode];
          static String._unconditionallyBridgeFromObjectiveC(_:)();

          uint64_t v38 = v34;
          DetectedTextAndLanguage.init(text:locale:)();
          sub_10000B130(&qword_1000441E8);
          unint64_t v39 = (*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
          uint64_t v40 = swift_allocObject();
          *(_OWORD *)(v40 + 16) = xmmword_100032AF0;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v35 + 16))(v40 + v39, v38, v43);
          DetectedTextBlock.init(stringLocaleMap:normalizedBbox:confidence:detectLanguages:outputRegion:)();
          sub_10000B130(&qword_1000441F0);
          unint64_t v41 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
          uint64_t v42 = swift_allocObject();
          *(_OWORD *)(v42 + 16) = xmmword_100032AF0;
          (*(void (**)(unint64_t, uint64_t, uint64_t))(v36 + 16))(v42 + v41, v52, v61);
          (*(void (**)(uint64_t, void, uint64_t))(v55 + 104))(v45, enum case for MAGOutputEventSource.liveDetection(_:), v44);
          (*(void (**)(uint64_t, void, uint64_t))(v46 + 104))(v48, enum case for MAGOutputEventEnvironment.app(_:), v47);
          swift_retain();
          static MAGOutputEvent.pointAndSpeak(_:source:environment:)();
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v48, v47);
          (*(void (**)(uint64_t, uint64_t))(v55 + 8))(v45, v44);
          dispatch thunk of MAGOutputEngine.schedule(_:)();

          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
          (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v52, v61);
          uint64_t v31 = v1 + 13;
          uint64_t v30 = v1 + 14;
        }
        else
        {

          uint64_t v31 = v1 + 28;
          uint64_t v30 = v1 + 29;
        }
        goto LABEL_10;
      }
      uint64_t v5 = v1 + 27;
      uint64_t v54 = v1[24];
      uint64_t v24 = v1[21];
      uint64_t v57 = v1[23];
      uint64_t v60 = v1[22];
      uint64_t v25 = v1[19];
      uint64_t v26 = v1[20];
      uint64_t v27 = v1[17];
      uint64_t v28 = v1[18];
      uint64_t v29 = v1[16];
      (*(void (**)(void))(v57 + 104))();
      (*(void (**)(uint64_t, void, uint64_t))(v26 + 104))(v24, enum case for MAGOutputEventSource.magAction(_:), v25);
      (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v28, enum case for MAGOutputEventEnvironment.angel(_:), v29);
      swift_retain();
      static MAGOutputEvent.announcement(_:source:environment:)();
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v28, v29);
      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
      (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v54, v60);
      dispatch thunk of MAGOutputEngine.schedule(_:)();
    }
    swift_release();
    goto LABEL_9;
  }
LABEL_11:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v32 = (uint64_t (*)(void))v1[1];
  return v32();
}

uint64_t sub_100008F90(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[4] = v3;
  v2[5] = *(void *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return _swift_task_switch(sub_100009050, 0, 0);
}

uint64_t sub_100009050()
{
  uint64_t v1 = (void *)v0[2];
  v0[7] = *(void *)(v0[3] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pointAndSpeakService);
  swift_retain();
  id v2 = [v1 capturedImage];
  type metadata accessor for MAGCVPixelBufferWrapper();
  swift_allocObject();
  uint64_t v3 = MAGCVPixelBufferWrapper.init(_:)();
  v0[8] = v3;
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)&async function pointer to dispatch thunk of MAGPointAndSpeakService.predictHandPose(fromPixelBufferWrapper:)
                                       + async function pointer to dispatch thunk of MAGPointAndSpeakService.predictHandPose(fromPixelBufferWrapper:));
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100009160;
  return v6(v3);
}

uint64_t sub_100009160()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return _swift_task_switch(sub_1000092AC, 0, 0);
  }
  else
  {
    swift_release();
    swift_release();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_1000092AC()
{
  swift_release();
  swift_release();
  static Log.angel.getter();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Magnifier Angel requests hand pose prediction, but none could be created", v3, 2u);
    swift_slowDealloc();
  }
  uint64_t v5 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v6 = v0[4];
  swift_errorRelease();

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  uint64_t v7 = (uint64_t (*)(void))v0[1];
  return v7();
}

uint64_t sub_1000093C8(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = type metadata accessor for Logger();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for MAGOutputEventEnvironment();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for MAGOutputEventSource();
  v2[14] = v5;
  v2[15] = *(void *)(v5 - 8);
  v2[16] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for MAGOutputEvent();
  v2[17] = v6;
  v2[18] = *(void *)(v6 - 8);
  v2[19] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Date();
  v2[20] = v7;
  v2[21] = *(void *)(v7 - 8);
  v2[22] = swift_task_alloc();
  return _swift_task_switch(sub_1000095F8, 0, 0);
}

uint64_t sub_1000095F8()
{
  uint64_t v1 = (void *)v0[6];
  v0[23] = *(void *)(v0[7] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_imageCaptionService);
  swift_retain();
  id v2 = [v1 capturedImage];
  type metadata accessor for MAGCVPixelBufferWrapper();
  swift_allocObject();
  uint64_t v3 = MAGCVPixelBufferWrapper.init(_:)();
  v0[24] = v3;
  uint64_t v4 = (void *)swift_task_alloc();
  v0[25] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000096F4;
  return MAGImageCaptionService.generateImageCaption(for:)(v3);
}

uint64_t sub_1000096F4(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *v3;
  *(void *)(*v3 + 208) = v2;
  swift_task_dealloc();
  if (v2)
  {
    uint64_t v7 = sub_100009B14;
  }
  else
  {
    swift_release();
    swift_release();
    *(void *)(v6 + 216) = a2;
    *(void *)(v6 + 224) = a1;
    uint64_t v7 = sub_100009838;
  }
  return _swift_task_switch(v7, 0, 0);
}

uint64_t sub_100009838()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[20];
  uint64_t v4 = v0[15];
  uint64_t v11 = v0[14];
  uint64_t v5 = v0[12];
  uint64_t v14 = v0[13];
  uint64_t v12 = v0[16];
  uint64_t v13 = v0[11];
  uint64_t v6 = v0[7];
  Date.init()();
  uint64_t v7 = v6 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 40))(v7, v2, v3);
  swift_endAccess();
  v0[29] = *(void *)(v6 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  swift_retain();
  String.localized.getter();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, void, uint64_t))(v4 + 104))(v12, enum case for MAGOutputEventSource.liveDetection(_:), v11);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v14, enum case for MAGOutputEventEnvironment.angel(_:), v13);
  static MAGOutputEvent.imageCaptionResult(_:source:environment:)();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v14, v13);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v12, v11);
  type metadata accessor for MainActor();
  v0[30] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100009A40, v9, v8);
}

uint64_t sub_100009A40()
{
  swift_release();
  dispatch thunk of MAGOutputEngine.schedule(_:)();
  swift_release();
  (*(void (**)(void, void))(v0[18] + 8))(v0[19], v0[17]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100009B14()
{
  swift_release();
  swift_release();
  static Log.angel.getter();
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
    v0[5] = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v4 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Magnifier Angel could not generate image descrioption: %@", v3, 0xCu);
    sub_10000B130((uint64_t *)&unk_1000453F0);
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
  (*(void (**)(void, void))(v0[9] + 8))(v0[10], v0[8]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_100009D38()
{
  uint64_t v41 = type metadata accessor for DispatchTimeInterval();
  uint64_t v40 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  unint64_t v39 = (void *)((char *)v38 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v48 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v51 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  uint64_t v3 = (char *)v38 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v49 = *(void *)(v4 - 8);
  uint64_t v50 = (char *)v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchTime();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)v38 - v12;
  uint64_t v52 = OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_detectionModeFlashlightDispatchItem;
  if (*(void *)&v0[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_detectionModeFlashlightDispatchItem])
  {
    swift_retain();
    dispatch thunk of DispatchWorkItem.cancel()();
    swift_release();
  }
  v38[1] = sub_10000BB08(0, (unint64_t *)&qword_100044218);
  uint64_t v45 = static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)();
  uint64_t v46 = *(void (**)(char *, uint64_t))(v8 + 8);
  v46(v11, v7);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v0;
  uint64_t v58 = sub_10000B818;
  uint64_t v59 = v14;
  aBlock = _NSConcreteStackBlock;
  uint64_t v55 = 1107296256;
  uint64_t v56 = sub_10000A36C;
  uint64_t v57 = &unk_10003DB70;
  uint64_t v15 = _Block_copy(&aBlock);
  uint64_t v44 = v7;
  uint64_t v16 = v15;
  uint64_t v17 = v0;
  uint64_t v47 = v0;
  uint64_t v43 = v17;
  swift_release();
  uint64_t v18 = v6;
  static DispatchQoS.unspecified.getter();
  aBlock = (void **)&_swiftEmptyArrayStorage;
  unint64_t v42 = sub_10000B858();
  sub_10000B130(&qword_100044220);
  sub_10000B8B0();
  v38[0] = v11;
  uint64_t v19 = v48;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v20 = (void *)v45;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  uint64_t v21 = v16;
  uint64_t v22 = v44;
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v51 + 8))(v3, v19);
  uint64_t v23 = v46;
  (*(void (**)(char *, char *))(v49 + 8))(v18, v50);
  uint64_t v50 = v13;
  uint64_t v51 = v8 + 8;
  v23(v13, v22);
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = v43;
  *(void *)(v24 + 16) = v43;
  uint64_t v58 = sub_10000B954;
  uint64_t v59 = v24;
  aBlock = _NSConcreteStackBlock;
  uint64_t v55 = 1107296256;
  uint64_t v56 = sub_10000A36C;
  uint64_t v57 = &unk_10003DBC0;
  _Block_copy(&aBlock);
  uint64_t v53 = &_swiftEmptyArrayStorage;
  uint64_t v26 = v25;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  type metadata accessor for DispatchWorkItem();
  swift_allocObject();
  uint64_t v27 = DispatchWorkItem.init(flags:block:)();
  swift_release();
  uint64_t v28 = v52;
  uint64_t v29 = v47;
  *(void *)&v47[v52] = v27;
  uint64_t v30 = v29;
  uint64_t result = swift_release();
  if (*(void *)&v30[v28])
  {
    swift_retain();
    id v32 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v33 = (char *)v38[0];
    static DispatchTime.now()();
    uint64_t v34 = v39;
    *unint64_t v39 = 60;
    uint64_t v35 = v40;
    uint64_t v36 = v41;
    (*(void (**)(void *, void, uint64_t))(v40 + 104))(v34, enum case for DispatchTimeInterval.seconds(_:), v41);
    id v37 = v50;
    + infix(_:_:)();
    (*(void (**)(void *, uint64_t))(v35 + 8))(v34, v36);
    v23(v33, v22);
    OS_dispatch_queue.asyncAfter(deadline:execute:)();
    swift_release();

    return ((uint64_t (*)(char *, uint64_t))v23)(v37, v22);
  }
  return result;
}

uint64_t sub_10000A36C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_10000A3B0(uint64_t a1)
{
  uint64_t v3 = sub_10000B130(&qword_100044BE0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = [self defaultDeviceWithMediaType:AVMediaTypeVideo];
  if (!v6) {
    return;
  }
  uint64_t v7 = v6;
  if ([v6 torchMode] == (id)1 && a1 == 0)
  {
    uint64_t v14 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v5, 1, 1, v14);
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v1;
    id v15 = v1;
    uint64_t v13 = &unk_100044210;
  }
  else
  {
    if ([v7 torchMode]) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = a1 == 1;
    }
    if (!v9) {
      goto LABEL_14;
    }
    uint64_t v10 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
    uint64_t v11 = (void *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v1;
    id v12 = v1;
    uint64_t v13 = &unk_100044200;
  }
  sub_100004158((uint64_t)v5, (uint64_t)v13, (uint64_t)v11);
  swift_release();
LABEL_14:
  id v19 = 0;
  if ([v7 lockForConfiguration:&v19])
  {
    id v16 = v19;
    if ([v7 isTorchModeSupported:a1]) {
      [v7 setTorchMode:a1];
    }
    [v7 unlockForConfiguration];
  }
  else
  {
    id v17 = v19;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
  }
}

uint64_t sub_10000A654(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = type metadata accessor for MAGOutputEventEnvironment();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for MAGOutputEventSource();
  v4[6] = v6;
  v4[7] = *(void *)(v6 - 8);
  v4[8] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for MAGOutputAnnouncement();
  v4[9] = v7;
  v4[10] = *(void *)(v7 - 8);
  v4[11] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for MAGOutputEvent();
  v4[12] = v8;
  v4[13] = *(void *)(v8 - 8);
  v4[14] = swift_task_alloc();
  return _swift_task_switch(sub_10000A828, 0, 0);
}

uint64_t sub_10000A828()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v12 = v0[9];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[3];
  v0[15] = *(void *)(v0[2] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  (*(void (**)(uint64_t, void))(v2 + 104))(v1, enum case for MAGOutputAnnouncement.automaticFlashlightOff(_:));
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v3, enum case for MAGOutputEventSource.magAction(_:), v4);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v7, enum case for MAGOutputEventEnvironment.angel(_:), v8);
  swift_retain();
  static MAGOutputEvent.announcement(_:source:environment:)();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v12);
  type metadata accessor for MainActor();
  v0[16] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000BF00, v10, v9);
}

uint64_t sub_10000A9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  uint64_t v5 = type metadata accessor for MAGOutputEventEnvironment();
  v4[3] = v5;
  v4[4] = *(void *)(v5 - 8);
  v4[5] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for MAGOutputEventSource();
  v4[6] = v6;
  v4[7] = *(void *)(v6 - 8);
  v4[8] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for MAGOutputAnnouncement();
  v4[9] = v7;
  v4[10] = *(void *)(v7 - 8);
  v4[11] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for MAGOutputEvent();
  v4[12] = v8;
  v4[13] = *(void *)(v8 - 8);
  v4[14] = swift_task_alloc();
  return _swift_task_switch(sub_10000ABB4, 0, 0);
}

uint64_t sub_10000ABB4()
{
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v12 = v0[9];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[4];
  uint64_t v7 = v0[5];
  uint64_t v8 = v0[3];
  v0[15] = *(void *)(v0[2] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_outputEngine);
  (*(void (**)(uint64_t, void))(v2 + 104))(v1, enum case for MAGOutputAnnouncement.tooDarkAutomaticFlashlightOn(_:));
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v3, enum case for MAGOutputEventSource.magAction(_:), v4);
  (*(void (**)(uint64_t, void, uint64_t))(v6 + 104))(v7, enum case for MAGOutputEventEnvironment.angel(_:), v8);
  swift_retain();
  static MAGOutputEvent.announcement(_:source:environment:)();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v12);
  type metadata accessor for MainActor();
  v0[16] = static MainActor.shared.getter();
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10000AD6C, v10, v9);
}

uint64_t sub_10000AD6C()
{
  uint64_t v2 = v0[13];
  uint64_t v1 = v0[14];
  uint64_t v3 = v0[12];
  swift_release();
  dispatch thunk of MAGOutputEngine.schedule(_:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

id sub_10000AE6C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MAGAngelDetectionManager();
  [super dealloc];
}

uint64_t sub_10000B004()
{
  return type metadata accessor for MAGAngelDetectionManager();
}

uint64_t type metadata accessor for MAGAngelDetectionManager()
{
  uint64_t result = qword_100044160;
  if (!qword_100044160) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000B058()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t sub_10000B130(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000B178()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_10000BED0;
  v3[2] = v2;
  return _swift_task_switch(sub_100003FA0, 0, 0);
}

uint64_t sub_10000B220(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000B2FC;
  return v6(a1);
}

uint64_t sub_10000B2FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000B3F4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B42C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000BED0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000441C8 + dword_1000441C8);
  return v6(a1, v4);
}

uint64_t sub_10000B4E4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000B51C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000B5B4;
  return sub_100008390(a1, v1);
}

uint64_t sub_10000B5B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000B6AC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000BED0;
  return sub_10000A9E0(a1, v4, v5, v6);
}

uint64_t sub_10000B764(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000BED0;
  return sub_10000A654(a1, v4, v5, v6);
}

void sub_10000B818()
{
}

uint64_t sub_10000B840(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B850()
{
  return swift_release();
}

unint64_t sub_10000B858()
{
  unint64_t result = qword_100044C30;
  if (!qword_100044C30)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044C30);
  }
  return result;
}

unint64_t sub_10000B8B0()
{
  unint64_t result = qword_100044C40;
  if (!qword_100044C40)
  {
    sub_10000B90C(&qword_100044220);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044C40);
  }
  return result;
}

uint64_t sub_10000B90C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_10000B954()
{
  uint64_t v1 = *(void *)(v0 + 16);
  sub_10000A3B0(0);
  *(void *)(v1 + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus) = 0;
}

uint64_t sub_10000B990(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000B130(&qword_100044238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000B130(&qword_100044240);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000BA60(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10000B130(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000BABC()
{
  swift_release();

  return _swift_deallocObject(v0, 28, 7);
}

void sub_10000BAF4()
{
  sub_100007134(*(float *)(v0 + 24));
}

uint64_t sub_10000BB08(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000BB44()
{
  swift_release();

  return _swift_deallocObject(v0, 36, 7);
}

void sub_10000BB84()
{
}

uint64_t sub_10000BB90()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BBD0()
{
  return sub_100004614(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10000BBD8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000BC10(void *a1)
{
  return sub_1000046D8(a1, *(char **)(v1 + 16));
}

uint64_t sub_10000BC1C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000BED0;
  return sub_100004C48(a1, v4, v5, v6);
}

uint64_t sub_10000BCD0()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000BD18(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10000BED0;
  return sub_100004DFC(a1, v4, v5, v7, v6);
}

uint64_t sub_10000BDDC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000BE1C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000B5B4;
  return sub_100004CE0(a1, v4, v5, v6);
}

uint64_t sub_10000BF04()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14MagnifierAngel27MAGAngelClientRequestStream_stream;
  uint64_t v2 = sub_10000B130(&qword_1000443E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC14MagnifierAngel27MAGAngelClientRequestStream_continuation;
  uint64_t v4 = sub_10000B130((uint64_t *)&unk_100044F10);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v6 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v5, v6);
}

uint64_t sub_10000BFF0()
{
  return type metadata accessor for MAGAngelClientRequestStream(0);
}

uint64_t type metadata accessor for MAGAngelClientRequestStream(uint64_t a1)
{
  return sub_10000C13C(a1, (uint64_t *)&unk_1000442C0);
}

void sub_10000C018()
{
  sub_10000C174(319, &qword_1000442D0, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for AsyncStream);
  if (v0 <= 0x3F)
  {
    sub_10000C174(319, (unint64_t *)&unk_1000442D8, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for AsyncStream.Continuation);
    if (v1 <= 0x3F) {
      swift_updateClassMetadata2();
    }
  }
}

uint64_t type metadata accessor for MAGAngelClientRequest(uint64_t a1)
{
  return sub_10000C13C(a1, (uint64_t *)&unk_1000443D0);
}

uint64_t sub_10000C13C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000C174(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for MAGAngelClientRequest(255);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t *sub_10000C1D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    uint64_t v7 = type metadata accessor for MAGSimulatedEvent();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 12, v7))
    {
      memcpy(a1, a2, *(void *)(v6 + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 12, v7);
    }
  }
  return a1;
}

uint64_t sub_10000C320(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MAGSimulatedEvent();
  uint64_t v5 = *(void *)(v2 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 12, v2);
  if (!result)
  {
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
    return v4(a1, v2);
  }
  return result;
}

void *sub_10000C3F0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MAGSimulatedEvent();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 12, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 12, v6);
  }
  return a1;
}

void *sub_10000C500(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MAGSimulatedEvent();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 12, v6);
  int v10 = v8(a2, 12, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 24))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 12, v6);
  return a1;
}

void *sub_10000C674(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MAGSimulatedEvent();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48))(a2, 12, v6))
  {
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 12, v6);
  }
  return a1;
}

void *sub_10000C784(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for MAGSimulatedEvent();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 12, v6);
  int v10 = v8(a2, 12, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(void *, void *, uint64_t))(v7 + 40))(a1, a2, v6);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 12, v6);
  return a1;
}

uint64_t sub_10000C8F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000C90C);
}

uint64_t sub_10000C90C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MAGSimulatedEvent();
  unsigned int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 0xD) {
    return v5 - 12;
  }
  else {
    return 0;
  }
}

uint64_t sub_10000C978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000C98C);
}

uint64_t sub_10000C98C(uint64_t a1, int a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = (a2 + 12);
  }
  else {
    uint64_t v5 = 0;
  }
  uint64_t v6 = type metadata accessor for MAGSimulatedEvent();
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56);

  return v7(a1, v5, a3, v6);
}

uint64_t sub_10000CA10(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MAGSimulatedEvent();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 48);

  return v3(a1, 12, v2);
}

uint64_t sub_10000CA7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MAGSimulatedEvent();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, 12, v4);
}

uint64_t sub_10000CAEC()
{
  uint64_t result = type metadata accessor for MAGSimulatedEvent();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataSinglePayload();
    return 0;
  }
  return result;
}

id sub_10000CB64(void *a1)
{
  uint64_t v3 = type metadata accessor for MAGAngelRootView(0);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (uint64_t *)((char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v20 - v7;
  int v9 = (objc_class *)type metadata accessor for MAGAngelWindow();
  v20.receiver = v1;
  v20.super_class = v9;
  [super initWithWindowScene:a1];
  uint64_t v11 = self;
  id v12 = v10;
  id v13 = [v11 clearColor];
  [v12 setBackgroundColor:v13];

  [v12 setClipsToBounds:1];
  *uint64_t v6 = swift_getKeyPath();
  sub_10000B130(&qword_100044410);
  swift_storeEnumTagMultiPayload();
  uint64_t v14 = (char *)v6 + *(int *)(v3 + 20);
  *(void *)uint64_t v14 = sub_10000EF08;
  *((void *)v14 + 1) = 0;
  v14[16] = 0;
  AccessibilityFocusState.init<>()();
  sub_10000D00C((uint64_t)v6, (uint64_t)v8);
  sub_10000D070((uint64_t)v8, (uint64_t)v6);
  sub_10000D0D4();
  AnyView.init<A>(_:)();
  id v15 = (void *)_makeUIHostingController(_:tracksContentSize:secure:)();
  swift_release();
  self;
  id v16 = (void *)swift_dynamicCastObjCClassUnconditional();
  id result = [v16 view];
  if (result)
  {
    uint64_t v18 = result;
    id v19 = [v11 clearColor];
    [v18 setBackgroundColor:v19];

    [v12 setRootViewController:v16];
    sub_10000D12C((uint64_t)v8);
    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000CEA0()
{
}

id sub_10000CEC4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MAGAngelWindow();
  return [super dealloc];
}

uint64_t type metadata accessor for MAGAngelWindow()
{
  return self;
}

uint64_t sub_10000CF1C()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_10000CF40(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ColorScheme();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_10000D00C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MAGAngelRootView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D070(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MAGAngelRootView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000D0D4()
{
  unint64_t result = qword_100044418;
  if (!qword_100044418)
  {
    type metadata accessor for MAGAngelRootView(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044418);
  }
  return result;
}

uint64_t sub_10000D12C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MAGAngelRootView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D188()
{
  return sub_10000D268();
}

uint64_t sub_10000D19C()
{
  return sub_10000D268();
}

uint64_t sub_10000D1B0()
{
  type metadata accessor for MAGAngelPreferences();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_10000D800();
  qword_100046A90 = v0;
  return result;
}

uint64_t sub_10000D1F0()
{
  return sub_10000D268();
}

uint64_t sub_10000D204@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000DC34(a1);
}

uint64_t sub_10000D218()
{
  return sub_10000DCEC();
}

uint64_t sub_10000D22C()
{
  return sub_10000D268();
}

uint64_t sub_10000D240()
{
  return sub_10000D268();
}

uint64_t sub_10000D254()
{
  return sub_10000D268();
}

uint64_t sub_10000D268()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

unint64_t sub_10000D2D4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v6 == 1)
  {
    v0._object = (void *)0x8000000100038BE0;
    v0._countAndFlagsBits = 0xD000000000000017;
    String.append(_:)(v0);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v6 == 1)
  {
    v1._countAndFlagsBits = 0xD000000000000019;
    v1._object = (void *)0x8000000100038BC0;
    String.append(_:)(v1);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v6 == 1)
  {
    v2._object = (void *)0x8000000100038BA0;
    v2._countAndFlagsBits = 0xD000000000000017;
    String.append(_:)(v2);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v6 == 1)
  {
    v3._countAndFlagsBits = 0xD00000000000001BLL;
    v3._object = (void *)0x8000000100038B80;
    String.append(_:)(v3);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v6 == 1)
  {
    v4._countAndFlagsBits = 0xD000000000000018;
    v4._object = (void *)0x8000000100038B60;
    String.append(_:)(v4);
  }
  swift_bridgeObjectRelease();
  return 0xD000000000000015;
}

uint64_t sub_10000D56C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__textDetectionEnabled;
  uint64_t v2 = sub_10000B130(&qword_100044530);
  Swift::String v3 = *(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__peopleDetectionEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__doorDetectionEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__objectUnderstandingEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__imageDescriptionsEnabled, v2);
  v3(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__pointSpeakEnabled, v2);
  uint64_t v4 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v5 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v4, v5);
}

uint64_t sub_10000D6B0()
{
  return type metadata accessor for MAGAngelPreferences();
}

uint64_t type metadata accessor for MAGAngelPreferences()
{
  uint64_t result = qword_100044478;
  if (!qword_100044478) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000D704()
{
  sub_10000D79C();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10000D79C()
{
  if (!qword_100044488)
  {
    unint64_t v0 = type metadata accessor for Published();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100044488);
    }
  }
}

void *sub_10000D7F4()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000D800()
{
  uint64_t v1 = sub_10000B130(&qword_100044530);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__textDetectionEnabled;
  v13[15] = 0;
  Published.init(initialValue:)();
  char v6 = *(void (**)(uint64_t, unsigned char *, uint64_t))(v2 + 32);
  v6(v5, v4, v1);
  uint64_t v7 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__peopleDetectionEnabled;
  v13[14] = 0;
  Published.init(initialValue:)();
  v6(v7, v4, v1);
  uint64_t v8 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__doorDetectionEnabled;
  v13[13] = 0;
  Published.init(initialValue:)();
  v6(v8, v4, v1);
  uint64_t v9 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__objectUnderstandingEnabled;
  v13[12] = 0;
  Published.init(initialValue:)();
  v6(v9, v4, v1);
  uint64_t v10 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__imageDescriptionsEnabled;
  v13[11] = 0;
  Published.init(initialValue:)();
  v6(v10, v4, v1);
  uint64_t v11 = v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelPreferences__pointSpeakEnabled;
  v13[10] = 0;
  Published.init(initialValue:)();
  v6(v11, v4, v1);
  return v0;
}

uint64_t sub_10000DA18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000DA68@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000DC34(a1);
}

uint64_t sub_10000DA7C@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000DC34(a1);
}

uint64_t sub_10000DAA4()
{
  return sub_10000DCEC();
}

uint64_t sub_10000DAB8()
{
  return sub_10000DCEC();
}

uint64_t sub_10000DAE0@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000DC34(a1);
}

uint64_t sub_10000DB08()
{
  return sub_10000DCEC();
}

uint64_t sub_10000DB30@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000DC34(a1);
}

uint64_t sub_10000DB44@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000DC34(a1);
}

uint64_t sub_10000DB6C()
{
  return sub_10000DCEC();
}

uint64_t sub_10000DB80()
{
  return sub_10000DCEC();
}

uint64_t sub_10000DBA8@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000DC34(a1);
}

uint64_t sub_10000DBBC@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000DC34(a1);
}

uint64_t sub_10000DBE4()
{
  return sub_10000DCEC();
}

uint64_t sub_10000DBF8()
{
  return sub_10000DCEC();
}

uint64_t sub_10000DC20@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000DC34(a1);
}

uint64_t sub_10000DC34@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000DCB0@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000DC34(a1);
}

uint64_t sub_10000DCD8()
{
  return sub_10000DCEC();
}

uint64_t sub_10000DCEC()
{
  return static Published.subscript.setter();
}

uint64_t sub_10000DD5C()
{
  return sub_10000DCEC();
}

uint64_t sub_10000DD8C()
{
  uint64_t v0 = sub_10000B130(&qword_100044538);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  char v3 = (uint64_t *)((char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v14 = sub_10000B130((uint64_t *)&unk_100044F10);
  uint64_t v4 = *(void *)(v14 - 8);
  __chkstk_darwin();
  char v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000B130(&qword_1000443E0);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MAGAngelClientRequestStream(0);
  uint64_t v11 = swift_allocObject();
  type metadata accessor for MAGAngelClientRequest(0);
  *char v3 = 5;
  (*(void (**)(void *, void, uint64_t))(v1 + 104))(v3, enum case for AsyncStream.Continuation.BufferingPolicy.bufferingNewest<A>(_:), v0);
  static AsyncStream.makeStream(of:bufferingPolicy:)();
  (*(void (**)(void *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v11 + OBJC_IVAR____TtC14MagnifierAngel27MAGAngelClientRequestStream_stream, v10, v7);
  uint64_t result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(v11 + OBJC_IVAR____TtC14MagnifierAngel27MAGAngelClientRequestStream_continuation, v6, v14);
  qword_100046A98 = v11;
  return result;
}

uint64_t sub_10000E018()
{
  if (qword_100043E98 != -1) {
    swift_once();
  }
  id v0 = objc_allocWithZone((Class)type metadata accessor for MAGAngelConnectionManager());
  uint64_t v1 = swift_retain();
  uint64_t result = sub_10002B3CC(v1);
  qword_100046AA0 = result;
  return result;
}

uint64_t sub_10000E090()
{
  id v0 = [self sharedInstance];
  type metadata accessor for MAGAudioService();
  swift_allocObject();
  uint64_t result = MAGAudioService.init(audioSession:)();
  qword_100046AA8 = result;
  return result;
}

uint64_t sub_10000E0F8()
{
  if (qword_100043EA8 != -1) {
    swift_once();
  }
  type metadata accessor for MAGOutputEngine();
  swift_allocObject();
  swift_retain();
  uint64_t result = MAGOutputEngine.init(audioService:audioSessionAutomaticallyDeactivatesAfterSpeaking:)();
  qword_100046AB0 = result;
  return result;
}

id sub_10000E17C(uint64_t a1)
{
  return sub_10000EE2C(a1, (uint64_t (*)(void))&type metadata accessor for MAGPulseFeedbackProcessor, &static MAGAngelCompositionRoot.pulseFeedbackProcessor);
}

uint64_t *MAGAngelCompositionRoot.pulseFeedbackProcessor.unsafeMutableAddressor()
{
  if (qword_100043EB8 != -1) {
    swift_once();
  }
  return &static MAGAngelCompositionRoot.pulseFeedbackProcessor;
}

id static MAGAngelCompositionRoot.pulseFeedbackProcessor.getter()
{
  if (qword_100043EB8 != -1) {
    swift_once();
  }
  id v0 = (void *)static MAGAngelCompositionRoot.pulseFeedbackProcessor;

  return v0;
}

uint64_t sub_10000E244(uint64_t a1)
{
  return sub_10000EA38(a1, (void (*)(void))&type metadata accessor for MAGTextDetectionService, (uint64_t (*)(void))&MAGTextDetectionService.init(), &qword_100046AC0);
}

uint64_t sub_10000E278(uint64_t a1)
{
  return sub_10000EA38(a1, (void (*)(void))&type metadata accessor for MAGImageCaptionService, (uint64_t (*)(void))&MAGImageCaptionService.init(), &qword_100046AC8);
}

uint64_t sub_10000E2AC(uint64_t a1)
{
  return sub_10000EA38(a1, (void (*)(void))&type metadata accessor for MAGCaptureEventHandler, (uint64_t (*)(void))&MAGCaptureEventHandler.init(), &qword_100046AD0);
}

uint64_t sub_10000E2E0()
{
  [objc_allocWithZone((Class)AVCaptureSession) init];
  if (qword_100043ED0 != -1) {
    swift_once();
  }
  id v0 = objc_allocWithZone((Class)type metadata accessor for MAGCaptureService());
  swift_retain();
  uint64_t result = MAGCaptureService.init(captureSession:eventHandler:)();
  qword_100046AD8 = result;
  return result;
}

uint64_t sub_10000E388(uint64_t a1)
{
  return sub_10000EA38(a1, (void (*)(void))&type metadata accessor for MAGAREventHandler, (uint64_t (*)(void))&MAGAREventHandler.init(), &qword_100046AE0);
}

uint64_t sub_10000E3BC()
{
  if (qword_100043EE0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100043ED8;
  swift_retain();
  if (v0 != -1) {
    swift_once();
  }
  MAGCaptureService.captureSessionQueue.getter();
  id v1 = objc_allocWithZone((Class)type metadata accessor for MAGARService());
  uint64_t result = MAGARService.init(eventHandler:captureSessionQueue:)();
  qword_100046AE8 = result;
  return result;
}

uint64_t sub_10000E480()
{
  if (qword_100043EC0 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100043EE8;
  swift_retain();
  if (v0 != -1) {
    swift_once();
  }
  id v1 = (void *)qword_100046AE8;
  type metadata accessor for MAGDoorDetectionService();
  swift_allocObject();
  id v2 = v1;
  uint64_t result = MAGDoorDetectionService.init(textDetectionService:arService:)();
  qword_100046AF0 = result;
  return result;
}

uint64_t sub_10000E54C(uint64_t a1)
{
  return sub_10000EA38(a1, (void (*)(void))&type metadata accessor for MAGOUEventHandler, (uint64_t (*)(void))&MAGOUEventHandler.init(), &qword_100046AF8);
}

uint64_t sub_10000E580()
{
  if (qword_100043EE8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100043EF8;
  id v1 = (id)qword_100046AE8;
  if (v0 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100043EB8;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  char v3 = (void *)static MAGAngelCompositionRoot.pulseFeedbackProcessor;
  id v4 = objc_allocWithZone((Class)type metadata accessor for MAGObjectUnderstandingService());
  id v5 = v3;
  uint64_t result = MAGObjectUnderstandingService.init(arService:eventHandler:pulseFeedbackProcessor:)();
  qword_100046B00 = result;
  return result;
}

uint64_t sub_10000E68C(uint64_t a1)
{
  return sub_10000EA38(a1, (void (*)(void))&type metadata accessor for MAGPointAndSpeakEventHandler, (uint64_t (*)(void))&MAGPointAndSpeakEventHandler.init(), &static MAGAngelCompositionRoot.pointAndSpeakEventHandler);
}

uint64_t *MAGAngelCompositionRoot.pointAndSpeakEventHandler.unsafeMutableAddressor()
{
  if (qword_100043F08 != -1) {
    swift_once();
  }
  return &static MAGAngelCompositionRoot.pointAndSpeakEventHandler;
}

uint64_t static MAGAngelCompositionRoot.pointAndSpeakEventHandler.getter()
{
  if (qword_100043F08 != -1) {
    swift_once();
  }

  return swift_retain();
}

ValueMetadata *type metadata accessor for MAGAngelCompositionRoot()
{
  return &type metadata for MAGAngelCompositionRoot;
}

uint64_t sub_10000E778()
{
  if (qword_100043F08 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100043EE8;
  swift_retain();
  if (v0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100043EC0;
  id v2 = (id)qword_100046AE8;
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v3 = qword_100043EB0;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_100043EB8;
  swift_retain();
  if (v4 != -1) {
    swift_once();
  }
  id v5 = (void *)static MAGAngelCompositionRoot.pulseFeedbackProcessor;
  type metadata accessor for MAGPointAndSpeakService();
  swift_allocObject();
  id v6 = v5;
  uint64_t result = MAGPointAndSpeakService.init(eventHandler:arService:textDetectionService:outputEngine:pulseFeedbackProcessor:)();
  qword_100046B10 = result;
  return result;
}

uint64_t sub_10000E91C()
{
  if (qword_100043E90 != -1) {
    swift_once();
  }
  qword_100046B18 = qword_100046A90;

  return swift_retain();
}

id sub_10000E980()
{
  static Detection.centerDetectionRectSize.getter();
  double v1 = v0;
  double v3 = v2;
  static Detection.labellingTolerance.getter();
  int v5 = v4;
  static Detection.significantAreaThresholdMM.getter();
  int v7 = v6;
  static Detection.closeDetectionFactor.getter();
  int v9 = v8;
  id v10 = objc_allocWithZone((Class)PersonDetectionManager);
  LODWORD(v11) = v5;
  LODWORD(v12) = v7;
  LODWORD(v13) = v9;
  id result = [v10 initWithCenterDetectionSize:v1 labellingTolerance:v3 significantAreaThresholdMM:v11 closeDetectionFactor:v12 v13];
  qword_100046B20 = (uint64_t)result;
  return result;
}

uint64_t sub_10000EA04(uint64_t a1)
{
  return sub_10000EA38(a1, (void (*)(void))&type metadata accessor for ANSTPersonDetectionManager, (uint64_t (*)(void))&ANSTPersonDetectionManager.init(), &qword_100046B28);
}

uint64_t sub_10000EA38(uint64_t a1, void (*a2)(void), uint64_t (*a3)(void), uint64_t *a4)
{
  a2(0);
  swift_allocObject();
  uint64_t result = a3();
  *a4 = result;
  return result;
}

id sub_10000EA8C()
{
  if (qword_100043EE8 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_100043EC0;
  id v24 = (id)qword_100046AE8;
  if (v0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_100043EB0;
  uint64_t v23 = qword_100046AC0;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_100046AB0;
  uint64_t v3 = qword_100043F18;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = qword_100046B18;
  uint64_t v5 = qword_100043F20;
  swift_retain();
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_100043F28;
  id v22 = (id)qword_100046B20;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_100046B28;
  uint64_t v8 = qword_100043EF0;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_100046AF0;
  uint64_t v10 = qword_100043F00;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v11 = qword_100043F10;
  id v12 = (id)qword_100046B00;
  if (v11 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_100046B10;
  uint64_t v14 = qword_100043EC8;
  swift_retain();
  if (v14 != -1) {
    swift_once();
  }
  uint64_t v15 = qword_100046AC8;
  uint64_t v16 = qword_100043F08;
  swift_retain();
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v17 = static MAGAngelCompositionRoot.pointAndSpeakEventHandler;
  uint64_t v18 = qword_100043EB8;
  swift_retain();
  if (v18 != -1) {
    swift_once();
  }
  id v19 = (void *)static MAGAngelCompositionRoot.pulseFeedbackProcessor;
  id v20 = objc_allocWithZone((Class)type metadata accessor for MAGAngelDetectionManager());
  id result = sub_100003B90(v24, v23, v2, v4, v22, v7, v9, v12, v13, v15, v17, v19);
  qword_100046B30 = (uint64_t)result;
  return result;
}

id sub_10000EE0C(uint64_t a1)
{
  return sub_10000EE2C(a1, (uint64_t (*)(void))type metadata accessor for MAGAngelProxy, &qword_100046B38);
}

id sub_10000EE2C(uint64_t a1, uint64_t (*a2)(void), void *a3)
{
  id result = [objc_allocWithZone((Class)a2(0)) init];
  *a3 = result;
  return result;
}

id sub_10000EEAC()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for MAGAngelApp()
{
  return self;
}

uint64_t sub_10000EF08()
{
  if (qword_100043F18 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t *sub_10000EF64(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    sub_10000B130(&qword_100044410);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v7 = type metadata accessor for ColorScheme();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    uint64_t v9 = *(int *)(a3 + 20);
    uint64_t v10 = (char *)a1 + v9;
    uint64_t v11 = (char *)a2 + v9;
    uint64_t v12 = *(void *)v11;
    uint64_t v13 = *((void *)v11 + 1);
    char v14 = v11[16];
    sub_10000F1BC();
    *(void *)uint64_t v10 = v12;
    *((void *)v10 + 1) = v13;
    v10[16] = v14;
    uint64_t v15 = *(int *)(a3 + 24);
    uint64_t v16 = (char *)a1 + v15;
    uint64_t v17 = (char *)a2 + v15;
    uint64_t v18 = type metadata accessor for AccessibilityTechnologies();
    uint64_t v19 = *(void *)(v18 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18))
    {
      uint64_t v20 = sub_10000B130(&qword_100044568);
      memcpy(v16, v17, *(void *)(*(void *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
    }
    uint64_t v21 = (int *)sub_10000B130(&qword_100044570);
    v16[v21[9]] = v17[v21[9]];
    *(void *)&v16[v21[10]] = *(void *)&v17[v21[10]];
    v16[v21[11]] = v17[v21[11]];
  }
  swift_retain();
  return a1;
}

uint64_t sub_10000F1BC()
{
  return swift_retain();
}

uint64_t sub_10000F1C4(uint64_t a1, uint64_t a2)
{
  sub_10000B130(&qword_100044410);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v4 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_10000F308();
  uint64_t v5 = a1 + *(int *)(a2 + 24);
  uint64_t v6 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  sub_10000B130(&qword_100044570);

  return swift_release();
}

uint64_t sub_10000F308()
{
  return swift_release();
}

void *sub_10000F310(void *a1, void *a2, uint64_t a3)
{
  sub_10000B130(&qword_100044410);
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
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  char v12 = v9[16];
  sub_10000F1BC();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  uint64_t v13 = *(int *)(a3 + 24);
  char v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = sub_10000B130(&qword_100044568);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v19 = (int *)sub_10000B130(&qword_100044570);
  v14[v19[9]] = v15[v19[9]];
  *(void *)&v14[v19[10]] = *(void *)&v15[v19[10]];
  v14[v19[11]] = v15[v19[11]];
  swift_retain();
  return a1;
}

void *sub_10000F51C(void *a1, void *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000BA60((uint64_t)a1, &qword_100044410);
    sub_10000B130(&qword_100044410);
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
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = *(void *)v9;
  uint64_t v11 = *((void *)v9 + 1);
  char v12 = v9[16];
  sub_10000F1BC();
  *(void *)uint64_t v8 = v10;
  *((void *)v8 + 1) = v11;
  v8[16] = v12;
  sub_10000F308();
  uint64_t v13 = *(int *)(a3 + 24);
  char v14 = (char *)a1 + v13;
  uint64_t v15 = (char *)a2 + v13;
  uint64_t v16 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v17 + 48);
  LODWORD(v11) = v18(v14, 1, v16);
  int v19 = v18(v15, 1, v16);
  if (!v11)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 24))(v14, v15, v16);
      goto LABEL_12;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v14, v16);
    goto LABEL_11;
  }
  if (v19)
  {
LABEL_11:
    uint64_t v20 = sub_10000B130(&qword_100044568);
    memcpy(v14, v15, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_12;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v14, v15, v16);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
LABEL_12:
  uint64_t v21 = (int *)sub_10000B130(&qword_100044570);
  v14[v21[9]] = v15[v21[9]];
  *(void *)&v14[v21[10]] = *(void *)&v15[v21[10]];
  swift_retain();
  swift_release();
  v14[v21[11]] = v15[v21[11]];
  return a1;
}

char *sub_10000F7B4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = sub_10000B130(&qword_100044410);
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
  uint64_t v8 = *(int *)(a3 + 20);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = &a1[v8];
  uint64_t v11 = &a2[v8];
  *(_OWORD *)uint64_t v10 = *(_OWORD *)v11;
  v10[16] = v11[16];
  char v12 = &a1[v9];
  uint64_t v13 = &a2[v9];
  uint64_t v14 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_10000B130(&qword_100044568);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v17 = (int *)sub_10000B130(&qword_100044570);
  v12[v17[9]] = v13[v17[9]];
  *(void *)&v12[v17[10]] = *(void *)&v13[v17[10]];
  v12[v17[11]] = v13[v17[11]];
  return a1;
}

char *sub_10000F9A4(char *a1, char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_10000BA60((uint64_t)a1, &qword_100044410);
    uint64_t v6 = sub_10000B130(&qword_100044410);
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
  char v11 = v10[16];
  *(_OWORD *)uint64_t v9 = *(_OWORD *)v10;
  v9[16] = v11;
  sub_10000F308();
  uint64_t v12 = *(int *)(a3 + 24);
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v15 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      goto LABEL_11;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_10;
  }
  if (v19)
  {
LABEL_10:
    uint64_t v20 = sub_10000B130(&qword_100044568);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_11;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_11:
  uint64_t v21 = (int *)sub_10000B130(&qword_100044570);
  v13[v21[9]] = v14[v21[9]];
  *(void *)&v13[v21[10]] = *(void *)&v14[v21[10]];
  swift_release();
  v13[v21[11]] = v14[v21[11]];
  return a1;
}

uint64_t sub_10000FC2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000FC40);
}

uint64_t sub_10000FC40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000B130(&qword_100044578);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 254)
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 16);
    if (v10 > 1) {
      return (v10 ^ 0xFF) + 1;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v11 = sub_10000B130(&qword_100044570);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_10000FD70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000FD84);
}

uint64_t sub_10000FD84(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10000B130(&qword_100044578);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 254)
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20) + 16) = -(char)a2;
  }
  else
  {
    uint64_t v11 = sub_10000B130(&qword_100044570);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for MAGAngelRootView(uint64_t a1)
{
  return sub_10000C13C(a1, (uint64_t *)&unk_1000445D8);
}

void sub_10000FED8()
{
  sub_10000FFA8();
  if (v0 <= 0x3F)
  {
    sub_100010000();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10000FFA8()
{
  if (!qword_1000445E8)
  {
    type metadata accessor for ColorScheme();
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000445E8);
    }
  }
}

void sub_100010000()
{
  if (!qword_1000445F0)
  {
    unint64_t v0 = type metadata accessor for AccessibilityFocusState();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000445F0);
    }
  }
}

uint64_t sub_100010060()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10001007C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v56 = a1;
  uint64_t v57 = type metadata accessor for AccessibilityActionKind();
  uint64_t v55 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v54 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TaskPriority();
  uint64_t v52 = *(void *)(v4 - 8);
  uint64_t v53 = v4;
  __chkstk_darwin(v4);
  uint64_t v51 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MAGAngelRootView(0);
  uint64_t v50 = *(void *)(v6 - 8);
  uint64_t v49 = *(void *)(v50 + 64);
  __chkstk_darwin(v6);
  uint64_t v48 = (uint64_t)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000B130(&qword_100044628);
  __chkstk_darwin(v8 - 8);
  unsigned int v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10000B130(&qword_100044630);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000B130(&qword_100044638);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_10000B130(&qword_100044640);
  uint64_t v18 = *(void *)(v17 - 8);
  uint64_t v44 = v17;
  uint64_t v45 = v18;
  __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v47 = sub_10000B130(&qword_100044648);
  uint64_t v43 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  id v22 = (char *)&v42 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_10000B130(&qword_100044650);
  __chkstk_darwin(v46);
  id v24 = (char *)&v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100010784(v2, (uint64_t)v10);
  static Alignment.center.getter();
  sub_100012FA4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v13, 0.0, 1, 0.0, 1);
  sub_10000BA60((uint64_t)v10, &qword_100044628);
  static Color.black.getter();
  uint64_t v25 = Color.opacity(_:)();
  swift_release();
  LOBYTE(v10) = static Edge.Set.all.getter();
  sub_100017300((uint64_t)v13, (uint64_t)v16, &qword_100044630);
  uint64_t v26 = &v16[*(int *)(v14 + 36)];
  *(void *)uint64_t v26 = v25;
  v26[8] = (char)v10;
  sub_10000BA60((uint64_t)v13, &qword_100044630);
  unint64_t v27 = sub_100013688();
  View.allowsSecureDrawing()();
  sub_10000BA60((uint64_t)v16, &qword_100044638);
  uint64_t v28 = v42;
  sub_10000B130(&qword_100044570);
  AccessibilityFocusState.projectedValue.getter();
  uint64_t v58 = v14;
  unint64_t v59 = v27;
  swift_getOpaqueTypeConformance2();
  uint64_t v29 = v44;
  View.accessibilityFocused(_:)();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v20, v29);
  uint64_t v30 = v48;
  sub_1000139D8(v28, v48, type metadata accessor for MAGAngelRootView);
  unint64_t v31 = (*(unsigned __int8 *)(v50 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80);
  uint64_t v32 = swift_allocObject();
  sub_100016ED8(v30, v32 + v31, type metadata accessor for MAGAngelRootView);
  uint64_t v33 = v51;
  static TaskPriority.userInitiated.getter();
  uint64_t v34 = &v24[*(int *)(v46 + 36)];
  uint64_t v35 = type metadata accessor for _TaskModifier();
  uint64_t v37 = v52;
  uint64_t v36 = v53;
  (*(void (**)(char *, char *, uint64_t))(v52 + 16))(&v34[*(int *)(v35 + 20)], v33, v53);
  *(void *)uint64_t v34 = &unk_100044698;
  *((void *)v34 + 1) = v32;
  uint64_t v38 = v43;
  uint64_t v39 = v47;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v24, v22, v47);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v33, v36);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v22, v39);
  uint64_t v40 = v54;
  static AccessibilityActionKind.escape.getter();
  sub_1000138BC();
  View.accessibilityAction(_:_:)();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v40, v57);
  return sub_10000BA60((uint64_t)v24, &qword_100044650);
}

uint64_t sub_100010784@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v91 = a2;
  uint64_t v3 = sub_10000B130(&qword_1000446B8);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v90 = (uint64_t)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v75 - v6;
  uint64_t v8 = type metadata accessor for AccessibilityChildBehavior();
  uint64_t v86 = *(void *)(v8 - 8);
  uint64_t v87 = v8;
  __chkstk_darwin(v8);
  v85 = (char *)&v75 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v76);
  uint64_t v11 = (_OWORD *)((char *)&v75 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v81 = type metadata accessor for ContentShapeKinds();
  uint64_t v80 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v13 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10000B130(&qword_1000446C0);
  __chkstk_darwin(v14 - 8);
  uint64_t v16 = (uint64_t *)((char *)&v75 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v17 = sub_10000B130(&qword_1000446C8);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v75 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10000B130(&qword_1000446D0);
  __chkstk_darwin(v20);
  id v22 = (char *)&v75 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_10000B130(&qword_1000446D8);
  uint64_t v82 = *(void *)(v23 - 8);
  uint64_t v83 = v23;
  __chkstk_darwin(v23);
  v78 = (char *)&v75 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10000B130(&qword_1000446E0);
  uint64_t v26 = __chkstk_darwin(v25 - 8);
  uint64_t v84 = (uint64_t)&v75 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = __chkstk_darwin(v26);
  v77 = (char *)&v75 - v29;
  __chkstk_darwin(v28);
  uint64_t v79 = (uint64_t)&v75 - v30;
  uint64_t v31 = sub_10000B130(&qword_1000446E8);
  uint64_t v32 = __chkstk_darwin(v31 - 8);
  uint64_t v34 = (char *)&v75 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v32);
  uint64_t v89 = (uint64_t)&v75 - v35;
  char HasJindo = AXDeviceHasJindo();
  uint64_t v88 = a1;
  if ((HasJindo & 1) == 0)
  {
    *uint64_t v16 = static Alignment.center.getter();
    v16[1] = v40;
    uint64_t v41 = sub_10000B130(&qword_1000446F0);
    sub_100011190(a1, (uint64_t)v16 + *(int *)(v41 + 44));
    AXDeviceIsPad();
    AXDeviceIsPad();
    v75 = v7;
    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    sub_100017300((uint64_t)v16, (uint64_t)v19, &qword_1000446C0);
    uint64_t v42 = &v19[*(int *)(v17 + 36)];
    long long v43 = v97;
    *(_OWORD *)uint64_t v42 = v96;
    *((_OWORD *)v42 + 1) = v43;
    *((_OWORD *)v42 + 2) = v98;
    sub_10000BA60((uint64_t)v16, &qword_1000446C0);
    static ContentShapeKinds.accessibility.getter();
    uint64_t v44 = (char *)v11 + *(int *)(v76 + 20);
    uint64_t v45 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v46 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 104))(v44, v45, v46);
    __asm { FMOV            V0.2D, #13.0 }
    *uint64_t v11 = _Q0;
    uint64_t v52 = (uint64_t)&v22[*(int *)(v20 + 36)];
    sub_1000139D8((uint64_t)v11, v52, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    uint64_t v53 = sub_10000B130(&qword_1000446F8);
    uint64_t v54 = v80;
    uint64_t v55 = v81;
    (*(void (**)(uint64_t, char *, uint64_t))(v80 + 16))(v52 + *(int *)(v53 + 40), v13, v81);
    *(unsigned char *)(v52 + *(int *)(v53 + 36)) = 0;
    sub_100017300((uint64_t)v19, (uint64_t)v22, &qword_1000446C8);
    sub_100013A40((uint64_t)v11, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v13, v55);
    sub_10000BA60((uint64_t)v19, &qword_1000446C8);
    uint64_t v56 = v85;
    static AccessibilityChildBehavior.combine.getter();
    unint64_t v57 = sub_100013AA0();
    uint64_t v58 = v78;
    View.accessibilityElement(children:)();
    (*(void (**)(char *, uint64_t))(v86 + 8))(v56, v87);
    sub_10000BA60((uint64_t)v22, &qword_1000446D0);
    uint64_t v94 = String.localized.getter();
    uint64_t v95 = v59;
    uint64_t v92 = v20;
    unint64_t v93 = v57;
    swift_getOpaqueTypeConformance2();
    sub_100013BE0();
    uint64_t v60 = (uint64_t)v77;
    uint64_t v61 = v83;
    View.accessibilityLabel<A>(_:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v82 + 8))(v58, v61);
    uint64_t v62 = v79;
    sub_100017364(v60, v79, &qword_1000446E0);
    uint64_t v63 = v84;
    sub_100017300(v62, v84, &qword_1000446E0);
    sub_100017300(v63, (uint64_t)v34, &qword_1000446E0);
    unint64_t v64 = &v34[*(int *)(sub_10000B130(&qword_100044728) + 48)];
    *(void *)unint64_t v64 = 0;
    v64[8] = 1;
    uint64_t v7 = v75;
    sub_10000BA60(v62, &qword_1000446E0);
    sub_10000BA60(v63, &qword_1000446E0);
    uint64_t v65 = sub_10000B130(&qword_100044730);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v65 - 8) + 56))(v34, 0, 1, v65);
    uint64_t v38 = v89;
    sub_100017364((uint64_t)v34, v89, &qword_1000446E8);
    if ((static MAGAXUtilities.isVoiceOverRunning.getter() & 1) == 0) {
      goto LABEL_3;
    }
LABEL_5:
    *(void *)uint64_t v7 = static HorizontalAlignment.center.getter();
    *((void *)v7 + 1) = 0;
    v7[16] = 1;
    uint64_t v66 = sub_10000B130(&qword_100044748);
    sub_1000122D8(v88, (uint64_t)&v7[*(int *)(v66 + 44)]);
    uint64_t v67 = sub_10000B130(&qword_100044738);
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v67 - 8) + 56))(v7, 0, 1, v67);
    goto LABEL_6;
  }
  uint64_t v37 = sub_10000B130(&qword_100044730);
  uint64_t v38 = v89;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v89, 1, 1, v37);
  if (static MAGAXUtilities.isVoiceOverRunning.getter()) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v39 = sub_10000B130(&qword_100044738);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v7, 1, 1, v39);
LABEL_6:
  char v68 = AXDeviceHasJindo();
  sub_100017300(v38, (uint64_t)v34, &qword_1000446E8);
  uint64_t v69 = v90;
  sub_100017300((uint64_t)v7, v90, &qword_1000446B8);
  uint64_t v70 = v91;
  sub_100017300((uint64_t)v34, v91, &qword_1000446E8);
  uint64_t v71 = (uint64_t)v7;
  uint64_t v72 = sub_10000B130(&qword_100044740);
  sub_100017300(v69, v70 + *(int *)(v72 + 48), &qword_1000446B8);
  uint64_t v73 = v70 + *(int *)(v72 + 64);
  *(void *)uint64_t v73 = 0;
  *(unsigned char *)(v73 + 8) = v68 ^ 1;
  *(unsigned char *)(v73 + 9) = v68;
  sub_10000BA60(v71, &qword_1000446B8);
  sub_10000BA60(v38, &qword_1000446E8);
  sub_10000BA60(v69, &qword_1000446B8);
  return sub_10000BA60((uint64_t)v34, &qword_1000446E8);
}

uint64_t sub_100011190@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)&long long v88 = a1;
  uint64_t v78 = a2;
  *((void *)&v88 + 1) = type metadata accessor for ColorScheme();
  uint64_t v87 = *(void *)(*((void *)&v88 + 1) - 8);
  __chkstk_darwin(*((void *)&v88 + 1));
  uint64_t v3 = &v67[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = type metadata accessor for RoundedRectangle();
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = &v67[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_10000B130(&qword_100044798);
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = &v67[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v12 = sub_10000B130(&qword_1000447A0);
  uint64_t v13 = v12 - 8;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v84 = &v67[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v14);
  uint64_t v79 = &v67[-v16];
  uint64_t v17 = (char *)v7 + *(int *)(v5 + 28);
  uint64_t v18 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v19 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v19 - 8) + 104))(v17, v18, v19);
  __asm { FMOV            V0.2D, #13.0 }
  *uint64_t v7 = _Q0;
  uint64_t v25 = v88;
  sub_100015F58((uint64_t)v3);
  uint64_t v26 = sub_10001185C((uint64_t)v3);
  (*(void (**)(unsigned char *, void))(v87 + 8))(v3, *((void *)&v88 + 1));
  sub_1000139D8((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  *(void *)&v11[*(int *)(v9 + 60)] = v26;
  *(_WORD *)&v11[*(int *)(v9 + 64)] = 256;
  sub_100013A40((uint64_t)v7, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
  uint64_t v27 = static Color.black.getter();
  uint64_t v28 = v84;
  sub_100017300((uint64_t)v11, (uint64_t)v84, &qword_100044798);
  uint64_t v29 = (uint64_t *)&v28[*(int *)(v13 + 44)];
  uint64_t *v29 = v27;
  v29[1] = 0x4014000000000000;
  v29[2] = 0;
  v29[3] = 0;
  sub_10000BA60((uint64_t)v11, &qword_100044798);
  uint64_t v30 = v79;
  sub_100017364((uint64_t)v28, (uint64_t)v79, &qword_1000447A0);
  uint64_t v81 = static VerticalAlignment.center.getter();
  sub_100011A78(v25, (uint64_t)&v116);
  uint64_t v31 = v117;
  uint64_t v80 = v116;
  uint64_t v32 = v119;
  uint64_t v76 = v119;
  uint64_t v77 = v117;
  uint64_t v69 = v120;
  uint64_t v70 = v118;
  LOBYTE(v3) = v122;
  uint64_t v85 = v121;
  uint64_t v86 = v123;
  uint64_t v87 = v126;
  long long v88 = v127;
  int v82 = v128;
  uint64_t v72 = v125;
  uint64_t v73 = v129;
  char v96 = 1;
  char v94 = v122;
  char v92 = v124;
  char v90 = v128;
  LOBYTE(v27) = v124;
  int v74 = v122;
  int v75 = v124;
  int v71 = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  uint64_t v34 = v33;
  uint64_t v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  unsigned __int8 v97 = 0;
  int v83 = static Edge.Set.horizontal.getter();
  EdgeInsets.init(_all:)();
  uint64_t v42 = v41;
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  int v68 = v97;
  char v99 = 0;
  sub_100017300((uint64_t)v30, (uint64_t)v28, &qword_1000447A0);
  LOBYTE(v25) = v99;
  uint64_t v49 = v78;
  sub_100017300((uint64_t)v28, v78, &qword_1000447A0);
  uint64_t v50 = (_OWORD *)(v49 + *(int *)(sub_10000B130(&qword_1000447A8) + 48));
  v102[0] = v81;
  v102[1] = 0;
  LOBYTE(v103) = 1;
  *(_DWORD *)((char *)&v103 + 1) = *(_DWORD *)v95;
  DWORD1(v103) = *(_DWORD *)&v95[3];
  *((void *)&v103 + 1) = v80;
  *(void *)&long long v104 = v31;
  uint64_t v51 = v70;
  *((void *)&v104 + 1) = v70;
  *(void *)&long long v105 = v32;
  uint64_t v52 = v69;
  *((void *)&v105 + 1) = v69;
  *(void *)&long long v106 = v85;
  BYTE8(v106) = (_BYTE)v3;
  *(_DWORD *)((char *)&v106 + 9) = *(_DWORD *)v93;
  HIDWORD(v106) = *(_DWORD *)&v93[3];
  *(void *)&long long v107 = v86;
  BYTE8(v107) = v27;
  *(_DWORD *)((char *)&v107 + 9) = *(_DWORD *)v91;
  HIDWORD(v107) = *(_DWORD *)&v91[3];
  uint64_t v54 = v72;
  uint64_t v53 = v73;
  *(void *)&long long v108 = v72;
  *((void *)&v108 + 1) = v87;
  long long v109 = v88;
  LOBYTE(v110) = v82;
  *(_DWORD *)((char *)&v110 + 1) = *(_DWORD *)v89;
  DWORD1(v110) = *(_DWORD *)&v89[3];
  *((void *)&v110 + 1) = v73;
  LOBYTE(v27) = v71;
  LOBYTE(v111) = v71;
  DWORD1(v111) = *(_DWORD *)&v98[3];
  *(_DWORD *)((char *)&v111 + 1) = *(_DWORD *)v98;
  *((void *)&v111 + 1) = v34;
  *(void *)&long long v112 = v36;
  *((void *)&v112 + 1) = v38;
  *(void *)&long long v113 = v40;
  LOBYTE(v3) = v68;
  BYTE8(v113) = v68;
  HIDWORD(v113) = *(_DWORD *)&v101[3];
  *(_DWORD *)((char *)&v113 + 9) = *(_DWORD *)v101;
  LOBYTE(v114) = v83;
  DWORD1(v114) = *(_DWORD *)&v100[3];
  *(_DWORD *)((char *)&v114 + 1) = *(_DWORD *)v100;
  *((void *)&v114 + 1) = v42;
  *(void *)&v115[0] = v44;
  *((void *)&v115[0] + 1) = v46;
  *(void *)&v115[1] = v48;
  BYTE8(v115[1]) = v25;
  long long v55 = v103;
  *uint64_t v50 = (unint64_t)v81;
  v50[1] = v55;
  long long v56 = v104;
  long long v57 = v105;
  long long v58 = v107;
  long long v59 = v108;
  v50[4] = v106;
  v50[5] = v58;
  v50[2] = v56;
  v50[3] = v57;
  long long v60 = v109;
  long long v61 = v111;
  long long v62 = v112;
  v50[8] = v110;
  v50[9] = v61;
  v50[6] = v59;
  v50[7] = v60;
  long long v63 = v113;
  long long v64 = v114;
  *(_OWORD *)((char *)v50 + 217) = *(_OWORD *)((char *)v115 + 9);
  long long v65 = v115[0];
  v50[12] = v64;
  v50[13] = v65;
  v50[10] = v62;
  v50[11] = v63;
  sub_100016214((uint64_t)v102);
  sub_10000BA60((uint64_t)v79, &qword_1000447A0);
  uint64_t v116 = v81;
  uint64_t v117 = 0;
  LOBYTE(v118) = 1;
  *(_DWORD *)((char *)&v118 + 1) = *(_DWORD *)v95;
  HIDWORD(v118) = *(_DWORD *)&v95[3];
  uint64_t v119 = v80;
  uint64_t v120 = v77;
  uint64_t v121 = v51;
  uint64_t v122 = v76;
  uint64_t v123 = v52;
  uint64_t v124 = v85;
  LOBYTE(v125) = v74;
  *(_DWORD *)((char *)&v125 + 1) = *(_DWORD *)v93;
  HIDWORD(v125) = *(_DWORD *)&v93[3];
  uint64_t v126 = v86;
  LOBYTE(v127) = v75;
  *(_DWORD *)((char *)&v127 + 1) = *(_DWORD *)v91;
  DWORD1(v127) = *(_DWORD *)&v91[3];
  *((void *)&v127 + 1) = v54;
  uint64_t v128 = v87;
  long long v129 = v88;
  char v130 = v82;
  *(_DWORD *)v131 = *(_DWORD *)v89;
  *(_DWORD *)&v131[3] = *(_DWORD *)&v89[3];
  uint64_t v132 = v53;
  char v133 = v27;
  *(_DWORD *)&v134[3] = *(_DWORD *)&v98[3];
  *(_DWORD *)v134 = *(_DWORD *)v98;
  uint64_t v135 = v34;
  uint64_t v136 = v36;
  uint64_t v137 = v38;
  uint64_t v138 = v40;
  char v139 = (char)v3;
  *(_DWORD *)&v140[3] = *(_DWORD *)&v101[3];
  *(_DWORD *)v140 = *(_DWORD *)v101;
  char v141 = v83;
  *(_DWORD *)&v142[3] = *(_DWORD *)&v100[3];
  *(_DWORD *)v142 = *(_DWORD *)v100;
  uint64_t v143 = v42;
  uint64_t v144 = v44;
  uint64_t v145 = v46;
  uint64_t v146 = v48;
  char v147 = v25;
  sub_1000162BC((uint64_t)&v116);
  return sub_10000BA60((uint64_t)v84, &qword_1000447A0);
}

uint64_t sub_10001185C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for ColorScheme();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  int v10 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v9, v6);
  if (v10 == enum case for ColorScheme.light(_:))
  {
    v15[1] = static Color.white.getter();
    sub_100016414();
    return Color.init<A>(_:)();
  }
  else
  {
    int v12 = v10;
    int v13 = enum case for ColorScheme.dark(_:);
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Color.RGBColorSpace.sRGB(_:), v2);
    uint64_t v11 = Color.init(_:white:opacity:)();
    if (v12 != v13) {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
  return v11;
}

uint64_t sub_100011A78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000B130(&qword_1000447B0);
  __chkstk_darwin(v4 - 8);
  unsigned __int8 v97 = &v68[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = type metadata accessor for Color.RGBColorSpace();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v68[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = type metadata accessor for ColorScheme();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v95 = &v68[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = __chkstk_darwin(v12);
  char v96 = &v68[-v15];
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = &v68[-v17];
  __chkstk_darwin(v16);
  uint64_t v20 = &v68[-v19];
  uint64_t v94 = Image.init(_internalSystemName:)();
  uint64_t v84 = a1;
  sub_100015F58((uint64_t)v20);
  uint64_t v21 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v11 + 16);
  uint64_t v86 = v11 + 16;
  uint64_t v85 = v21;
  v21(v18, v20, v10);
  id v22 = *(uint64_t (**)(unsigned char *, uint64_t))(v11 + 88);
  uint64_t v83 = v11 + 88;
  int v82 = v22;
  int v23 = v22(v18, v10);
  int v81 = enum case for ColorScheme.light(_:);
  uint64_t v91 = v6;
  char v92 = v9;
  uint64_t v89 = v7;
  if (v23 == enum case for ColorScheme.light(_:))
  {
    uint64_t v24 = *(void (**)(void))(v7 + 104);
    unsigned int v80 = enum case for Color.RGBColorSpace.sRGB(_:);
    uint64_t v79 = (void (*)(unsigned char *, void, uint64_t))v24;
    v24(v9);
    uint64_t v93 = Color.init(_:white:opacity:)();
  }
  else
  {
    int v25 = v23;
    int v26 = enum case for ColorScheme.dark(_:);
    uint64_t v27 = *(void (**)(void))(v7 + 104);
    unsigned int v80 = enum case for Color.RGBColorSpace.sRGB(_:);
    uint64_t v79 = (void (*)(unsigned char *, void, uint64_t))v27;
    v27(v9);
    uint64_t v93 = Color.init(_:white:opacity:)();
    if (v25 != v26) {
      (*(void (**)(unsigned char *, uint64_t))(v11 + 8))(v18, v10);
    }
  }
  uint64_t v30 = *(void (**)(void, void))(v11 + 8);
  uint64_t v28 = v11 + 8;
  uint64_t v29 = v30;
  v30(v20, v10);
  uint64_t KeyPath = swift_getKeyPath();
  static Font.Weight.medium.getter();
  uint64_t v31 = type metadata accessor for Font.Design();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v32 + 56);
  uint64_t v34 = (uint64_t)v97;
  uint64_t v78 = v31;
  uint64_t v77 = v33;
  uint64_t v76 = v32 + 56;
  ((void (*)(unsigned char *, uint64_t, uint64_t))v33)(v97, 1, 1);
  uint64_t v88 = static Font.system(size:weight:design:)();
  sub_10000BA60(v34, &qword_1000447B0);
  uint64_t v87 = swift_getKeyPath();
  AXDeviceIsPad();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v75 = v100;
  int v74 = v101;
  uint64_t v73 = v102;
  int v72 = v103;
  uint64_t v70 = v104;
  uint64_t v71 = v105;
  uint64_t v98 = String.localized.getter();
  uint64_t v99 = v35;
  sub_100013BE0();
  uint64_t v36 = Text.init<A>(_:)();
  uint64_t v38 = v37;
  int v69 = v39;
  uint64_t v40 = v96;
  sub_100015F58((uint64_t)v96);
  uint64_t v41 = v95;
  v85(v95, v40, v10);
  int v42 = v82(v41, v10);
  if (v42 == v81)
  {
    v79(v92, v80, v91);
    Color.init(_:white:opacity:)();
  }
  else
  {
    int v43 = v42;
    uint64_t v86 = v28;
    uint64_t v44 = v29;
    int v45 = enum case for ColorScheme.dark(_:);
    v79(v92, v80, v91);
    Color.init(_:white:opacity:)();
    if (v43 == v45)
    {
      uint64_t v29 = v44;
    }
    else
    {
      uint64_t v29 = v44;
      v44(v95, v10);
    }
  }
  char v46 = v69 & 1;
  v29(v96, v10);
  uint64_t v47 = Text.foregroundColor(_:)();
  uint64_t v49 = v48;
  char v51 = v50;
  swift_release();
  sub_100016354(v36, v38, v46);
  swift_bridgeObjectRelease();
  static Font.Weight.medium.getter();
  uint64_t v52 = (uint64_t)v97;
  v77(v97, 1, 1, v78);
  static Font.system(size:weight:design:)();
  sub_10000BA60(v52, &qword_1000447B0);
  uint64_t v53 = Text.font(_:)();
  uint64_t v55 = v54;
  char v57 = v56;
  uint64_t v59 = v58;
  swift_release();
  char v60 = v57 & 1;
  sub_100016354(v47, v49, v51 & 1);
  swift_bridgeObjectRelease();
  uint64_t v61 = v93;
  uint64_t v62 = KeyPath;
  *(void *)a2 = v94;
  *(void *)(a2 + 8) = v62;
  uint64_t v64 = v87;
  uint64_t v63 = v88;
  *(void *)(a2 + 16) = v61;
  *(void *)(a2 + 24) = v64;
  uint64_t v65 = v75;
  *(void *)(a2 + 32) = v63;
  *(void *)(a2 + 40) = v65;
  *(unsigned char *)(a2 + 48) = v74;
  *(void *)(a2 + 56) = v73;
  *(unsigned char *)(a2 + 64) = v72;
  uint64_t v66 = v71;
  *(void *)(a2 + 72) = v70;
  *(void *)(a2 + 80) = v66;
  *(void *)(a2 + 88) = v53;
  *(void *)(a2 + 96) = v55;
  *(unsigned char *)(a2 + 104) = v60;
  *(void *)(a2 + 112) = v59;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000162AC(v53, v55, v60);
  swift_bridgeObjectRetain();
  sub_100016354(v53, v55, v60);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000122D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10000B130(&qword_100044750);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10000B130(&qword_100044758);
  uint64_t v8 = v7 - 8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v26 - v12;
  *(void *)uint64_t v6 = static VerticalAlignment.center.getter();
  *((void *)v6 + 1) = 0;
  v6[16] = 1;
  uint64_t v14 = sub_10000B130(&qword_100044760);
  sub_1000124CC(a1, (uint64_t)&v6[*(int *)(v14 + 44)]);
  LOBYTE(a1) = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  sub_100017300((uint64_t)v6, (uint64_t)v11, &qword_100044750);
  int v23 = &v11[*(int *)(v8 + 44)];
  char *v23 = a1;
  *((void *)v23 + 1) = v16;
  *((void *)v23 + 2) = v18;
  *((void *)v23 + 3) = v20;
  *((void *)v23 + 4) = v22;
  v23[40] = 0;
  sub_10000BA60((uint64_t)v6, &qword_100044750);
  sub_100017364((uint64_t)v11, (uint64_t)v13, &qword_100044758);
  sub_100017300((uint64_t)v13, (uint64_t)v11, &qword_100044758);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  uint64_t v24 = sub_10000B130(&qword_100044768);
  sub_100017300((uint64_t)v11, a2 + *(int *)(v24 + 48), &qword_100044758);
  sub_10000BA60((uint64_t)v13, &qword_100044758);
  return sub_10000BA60((uint64_t)v11, &qword_100044758);
}

uint64_t sub_1000124CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v84 = a2;
  uint64_t v3 = sub_10000B130(&qword_100044770);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  uint64_t v6 = (char *)v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v91 = (uint64_t)v79 - v7;
  uint64_t v8 = type metadata accessor for MAGAngelRootView(0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)v79 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DetectionButton(0);
  uint64_t v13 = __chkstk_darwin(v12);
  int v81 = (uint64_t (*)(uint64_t))((char *)v79 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v88 = (uint64_t)v79 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v86 = (uint64_t)v79 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v87 = (uint64_t)v79 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  int v23 = (char *)v79 - v22;
  uint64_t v24 = __chkstk_darwin(v21);
  uint64_t v26 = (char *)v79 - v25;
  __chkstk_darwin(v24);
  uint64_t v28 = (char *)v79 - v27;
  uint64_t v98 = a1;
  sub_1000139D8(a1, (uint64_t)v11, type metadata accessor for MAGAngelRootView);
  uint64_t v29 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v30 = (v29 + 16) & ~v29;
  uint64_t v93 = v30 + v10;
  uint64_t v96 = v29 | 7;
  uint64_t v31 = swift_allocObject();
  uint64_t v97 = v30;
  sub_100016ED8((uint64_t)v11, v31 + v30, type metadata accessor for MAGAngelRootView);
  uint64_t v94 = v12;
  uint64_t v32 = &v28[*(int *)(v12 + 28)];
  uint64_t v33 = enum case for Control.imageCaption(_:);
  uint64_t v34 = type metadata accessor for Control();
  uint64_t v35 = *(void *)(v34 - 8);
  uint64_t v36 = *(void (**)(char *, void, uint64_t))(v35 + 104);
  uint64_t v95 = v34;
  char v92 = v36;
  uint64_t v89 = v35 + 104;
  ((void (*)(char *, uint64_t))v36)(v32, v33);
  unint64_t v83 = (unint64_t)"control.name.detectionMode";
  *(void *)uint64_t v28 = String.localized.getter();
  *((void *)v28 + 1) = v37;
  int v82 = "control.button.on.value";
  *((void *)v28 + 2) = String.localized.getter();
  *((void *)v28 + 3) = v38;
  *((void *)v28 + 4) = sub_100013E1C;
  *((void *)v28 + 5) = v31;
  char v90 = v28;
  v28[48] = 0;
  char v39 = static Detection.isLidarAvailable.getter();
  uint64_t v85 = v6;
  if (v39)
  {
    v79[0] = type metadata accessor for MAGAngelRootView;
    uint64_t v40 = v98;
    sub_1000139D8(v98, (uint64_t)v11, type metadata accessor for MAGAngelRootView);
    v79[1] = (uint64_t (*)(void))0xD000000000000018;
    uint64_t v41 = swift_allocObject();
    unsigned int v80 = type metadata accessor for MAGAngelRootView;
    sub_100016ED8((uint64_t)v11, v41 + v97, type metadata accessor for MAGAngelRootView);
    v92(&v26[*(int *)(v94 + 28)], enum case for Control.peopleDetection(_:), v95);
    *(void *)uint64_t v26 = String.localized.getter();
    *((void *)v26 + 1) = v42;
    *((void *)v26 + 2) = String.localized.getter();
    *((void *)v26 + 3) = v43;
    *((void *)v26 + 4) = sub_100013E1C;
    *((void *)v26 + 5) = v41;
    v26[48] = 0;
    uint64_t v44 = v40;
    int v45 = v79[0];
    sub_1000139D8(v44, (uint64_t)v11, v79[0]);
    uint64_t v46 = swift_allocObject();
    uint64_t v47 = v97;
    sub_100016ED8((uint64_t)v11, v46 + v97, v80);
    uint64_t v48 = v95;
    v92(&v23[*(int *)(v94 + 28)], enum case for Control.doorDetection(_:), v95);
    *(void *)int v23 = String.localized.getter();
    *((void *)v23 + 1) = v49;
    *((void *)v23 + 2) = String.localized.getter();
    *((void *)v23 + 3) = v50;
    *((void *)v23 + 4) = sub_100013E1C;
    *((void *)v23 + 5) = v46;
    v23[48] = 0;
    sub_1000139D8(v98, (uint64_t)v11, v45);
    uint64_t v51 = swift_allocObject();
    sub_100016ED8((uint64_t)v11, v51 + v47, v80);
    uint64_t v52 = v87;
    v92((char *)(v87 + *(int *)(v94 + 28)), enum case for Control.objectUnderstanding(_:), v48);
    *(void *)uint64_t v52 = String.localized.getter();
    *(void *)(v52 + 8) = v53;
    *(void *)(v52 + 16) = String.localized.getter();
    *(void *)(v52 + 24) = v54;
    *(void *)(v52 + 32) = sub_100013E1C;
    *(void *)(v52 + 40) = v51;
    *(unsigned char *)(v52 + 48) = 0;
    uint64_t v55 = v86;
    sub_1000139D8((uint64_t)v26, v86, type metadata accessor for DetectionButton);
    uint64_t v56 = v88;
    sub_1000139D8((uint64_t)v23, v88, type metadata accessor for DetectionButton);
    char v57 = v81;
    sub_1000139D8(v52, (uint64_t)v81, type metadata accessor for DetectionButton);
    uint64_t v58 = (uint64_t)v85;
    sub_1000139D8(v55, (uint64_t)v85, type metadata accessor for DetectionButton);
    uint64_t v59 = sub_10000B130(&qword_100044788);
    sub_1000139D8(v56, v58 + *(int *)(v59 + 48), type metadata accessor for DetectionButton);
    sub_1000139D8((uint64_t)v57, v58 + *(int *)(v59 + 64), type metadata accessor for DetectionButton);
    sub_100013A40(v52, type metadata accessor for DetectionButton);
    sub_100013A40((uint64_t)v23, type metadata accessor for DetectionButton);
    sub_100013A40((uint64_t)v26, type metadata accessor for DetectionButton);
    sub_100013A40((uint64_t)v57, type metadata accessor for DetectionButton);
    sub_100013A40(v56, type metadata accessor for DetectionButton);
    sub_100013A40(v55, type metadata accessor for DetectionButton);
    uint64_t v60 = sub_10000B130(&qword_100044778);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v60 - 8) + 56))(v58, 0, 1, v60);
    sub_100017364(v58, v91, &qword_100044770);
  }
  else
  {
    uint64_t v61 = sub_10000B130(&qword_100044778);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v91, 1, 1, v61);
  }
  uint64_t v62 = v95;
  int v81 = type metadata accessor for MAGAngelRootView;
  sub_1000139D8(v98, (uint64_t)v11, type metadata accessor for MAGAngelRootView);
  uint64_t v63 = swift_allocObject();
  unsigned int v80 = type metadata accessor for MAGAngelRootView;
  sub_100016ED8((uint64_t)v11, v63 + v97, type metadata accessor for MAGAngelRootView);
  uint64_t v64 = v94;
  uint64_t v65 = v92;
  v92(&v26[*(int *)(v94 + 28)], enum case for Control.textDetection(_:), v62);
  v83 |= 0x8000000000000000;
  *(void *)uint64_t v26 = String.localized.getter();
  *((void *)v26 + 1) = v66;
  *((void *)v26 + 2) = String.localized.getter();
  *((void *)v26 + 3) = v67;
  *((void *)v26 + 4) = sub_100013E1C;
  *((void *)v26 + 5) = v63;
  v26[48] = 0;
  sub_1000139D8(v98, (uint64_t)v11, v81);
  uint64_t v68 = swift_allocObject();
  sub_100016ED8((uint64_t)v11, v68 + v97, v80);
  v65(&v23[*(int *)(v64 + 28)], enum case for Control.pointSpeak(_:), v95);
  *(void *)int v23 = String.localized.getter();
  *((void *)v23 + 1) = v69;
  *((void *)v23 + 2) = String.localized.getter();
  *((void *)v23 + 3) = v70;
  *((void *)v23 + 4) = sub_100013E1C;
  *((void *)v23 + 5) = v68;
  v23[48] = 0;
  uint64_t v71 = v87;
  sub_1000139D8((uint64_t)v90, v87, type metadata accessor for DetectionButton);
  uint64_t v72 = v91;
  uint64_t v73 = (uint64_t)v85;
  sub_100017300(v91, (uint64_t)v85, &qword_100044770);
  uint64_t v74 = v86;
  sub_1000139D8((uint64_t)v26, v86, type metadata accessor for DetectionButton);
  uint64_t v75 = v88;
  sub_1000139D8((uint64_t)v23, v88, type metadata accessor for DetectionButton);
  uint64_t v76 = v84;
  sub_1000139D8(v71, v84, type metadata accessor for DetectionButton);
  uint64_t v77 = (int *)sub_10000B130(&qword_100044780);
  sub_100017300(v73, v76 + v77[12], &qword_100044770);
  sub_1000139D8(v74, v76 + v77[16], type metadata accessor for DetectionButton);
  sub_1000139D8(v75, v76 + v77[20], type metadata accessor for DetectionButton);
  sub_100013A40((uint64_t)v23, type metadata accessor for DetectionButton);
  sub_100013A40((uint64_t)v26, type metadata accessor for DetectionButton);
  sub_10000BA60(v72, &qword_100044770);
  sub_100013A40((uint64_t)v90, type metadata accessor for DetectionButton);
  sub_100013A40(v75, type metadata accessor for DetectionButton);
  sub_100013A40(v74, type metadata accessor for DetectionButton);
  sub_10000BA60(v73, &qword_100044770);
  return sub_100013A40(v71, type metadata accessor for DetectionButton);
}

uint64_t sub_100012F00()
{
  type metadata accessor for MAGAngelRootView(0);
  type metadata accessor for MAGAngelPreferences();
  sub_100016C2C(&qword_100044790, (void (*)(uint64_t))type metadata accessor for MAGAngelPreferences);

  return StateObject.wrappedValue.getter();
}

__n128 sub_100012FA4@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
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
    int v23 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  sub_100017300(v13, a9, &qword_100044628);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_10000B130(&qword_100044630) + 36));
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

uint64_t sub_100013164@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, __int16 a18)
{
  __int16 v19 = a18;
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
    long long v28 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    __int16 v19 = a18;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(_OWORD *)(a9 + 72) = v33;
  *(_OWORD *)(a9 + 88) = v34;
  *(_OWORD *)(a9 + 104) = v35;
  *(_OWORD *)(a9 + 120) = v36;
  *(_OWORD *)(a9 + 24) = v30;
  *(_OWORD *)(a9 + 40) = v31;
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = a17;
  *(unsigned char *)(a9 + 16) = v19 & 1;
  *(unsigned char *)(a9 + 17) = HIBYTE(v19) & 1;
  *(_OWORD *)(a9 + 56) = v32;

  return swift_retain();
}

uint64_t sub_10001334C(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  type metadata accessor for MainActor();
  *(void *)(v1 + 24) = static MainActor.shared.getter();
  uint64_t v3 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000133E4, v3, v2);
}

uint64_t sub_1000133E4()
{
  swift_release();
  type metadata accessor for MAGAngelRootView(0);
  *(unsigned char *)(v0 + 32) = 1;
  sub_10000B130(&qword_100044570);
  AccessibilityFocusState.wrappedValue.setter();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100013478()
{
  uint64_t v0 = sub_10000B130(&qword_1000446B0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MAGAngelClientRequest(0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v12 - v8;
  if (qword_100043E98 != -1) {
    swift_once();
  }
  uint64_t v10 = type metadata accessor for MAGSimulatedEvent();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 3, 12, v10);
  sub_1000139D8((uint64_t)v9, (uint64_t)v7, type metadata accessor for MAGAngelClientRequest);
  sub_10000B130((uint64_t *)&unk_100044F10);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_100013A40((uint64_t)v9, type metadata accessor for MAGAngelClientRequest);
}

unint64_t sub_100013688()
{
  unint64_t result = qword_100044658;
  if (!qword_100044658)
  {
    sub_10000B90C(&qword_100044638);
    sub_100016FD4(&qword_100044660, &qword_100044630, (void (*)(void))sub_100013754);
    sub_1000172BC(&qword_100044680, &qword_100044688);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044658);
  }
  return result;
}

unint64_t sub_100013754()
{
  unint64_t result = qword_100044668;
  if (!qword_100044668)
  {
    sub_10000B90C(&qword_100044628);
    sub_1000172BC(&qword_100044670, &qword_100044678);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044668);
  }
  return result;
}

uint64_t sub_1000137F0()
{
  uint64_t v2 = *(void *)(type metadata accessor for MAGAngelRootView(0) - 8);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10000B5B4;
  return sub_10001334C(v3);
}

unint64_t sub_1000138BC()
{
  unint64_t result = qword_1000446A0;
  if (!qword_1000446A0)
  {
    sub_10000B90C(&qword_100044650);
    sub_10000B90C(&qword_100044640);
    sub_10000B90C(&qword_100044638);
    sub_100013688();
    swift_getOpaqueTypeConformance2();
    swift_getOpaqueTypeConformance2();
    sub_100016C2C(&qword_1000446A8, (void (*)(uint64_t))&type metadata accessor for _TaskModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000446A0);
  }
  return result;
}

uint64_t sub_1000139D8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100013A40(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100013AA0()
{
  unint64_t result = qword_100044700;
  if (!qword_100044700)
  {
    sub_10000B90C(&qword_1000446D0);
    sub_100013B40();
    sub_1000172BC(&qword_100044718, &qword_1000446F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044700);
  }
  return result;
}

unint64_t sub_100013B40()
{
  unint64_t result = qword_100044708;
  if (!qword_100044708)
  {
    sub_10000B90C(&qword_1000446C8);
    sub_1000172BC(&qword_100044710, &qword_1000446C0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044708);
  }
  return result;
}

unint64_t sub_100013BE0()
{
  unint64_t result = qword_100044720;
  if (!qword_100044720)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044720);
  }
  return result;
}

uint64_t type metadata accessor for DetectionButton(uint64_t a1)
{
  return sub_10000C13C(a1, qword_100044818);
}

uint64_t sub_100013C58()
{
  uint64_t v1 = type metadata accessor for MAGAngelRootView(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  sub_10000B130(&qword_100044410);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for ColorScheme();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(v0 + v3, v5);
  }
  else
  {
    swift_release();
  }
  sub_10000F308();
  uint64_t v6 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v7 = type metadata accessor for AccessibilityTechnologies();
  uint64_t v8 = *(void *)(v7 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7)) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  sub_10000B130(&qword_100044570);
  swift_release();

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100013E34()
{
  return sub_100012F00();
}

uint64_t sub_100013E88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v83 = a1;
  uint64_t v3 = type metadata accessor for ButtonBorderShape();
  uint64_t v72 = *(void *)(v3 - 8);
  uint64_t v73 = v3;
  __chkstk_darwin(v3);
  uint64_t v71 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for BorderedProminentButtonStyle();
  uint64_t v68 = *(void *)(v5 - 8);
  uint64_t v69 = v5;
  __chkstk_darwin(v5);
  uint64_t v66 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = type metadata accessor for DetectionButton(0);
  uint64_t v7 = *(void *)(v82 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v82);
  uint64_t v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = sub_10000B130(&qword_1000448C8);
  uint64_t v63 = *(void *)(v64 - 8);
  __chkstk_darwin(v64);
  uint64_t v11 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_10000B130(&qword_1000448D0);
  uint64_t v65 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  uint64_t v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_10000B130(&qword_1000448D8);
  __chkstk_darwin(v62);
  uint64_t v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_10000B130(&qword_1000448E0);
  __chkstk_darwin(v70);
  uint64_t v74 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_10000B130(&qword_1000448E8);
  __chkstk_darwin(v75);
  uint64_t v76 = (uint64_t)&v61 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_10000B130(&qword_1000448F0);
  uint64_t v18 = __chkstk_darwin(v79);
  unsigned int v80 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  int v81 = (char *)&v61 - v20;
  uint64_t v78 = sub_10000B130(&qword_1000448F8);
  __chkstk_darwin(v78);
  uint64_t v77 = (uint64_t)&v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100043E98 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_100046A98;
  sub_1000139D8(v2, (uint64_t)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for DetectionButton);
  unint64_t v23 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v24 = v2;
  unint64_t v25 = (v8 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v26 = swift_allocObject();
  uint64_t v27 = sub_100016ED8((uint64_t)v9, v26 + v23, type metadata accessor for DetectionButton);
  *(void *)(v26 + v25) = v22;
  __chkstk_darwin(v27);
  *(&v61 - 2) = v24;
  swift_retain();
  sub_10000B130(&qword_100044900);
  sub_100016FD4(&qword_100044908, &qword_100044900, (void (*)(void))sub_100017050);
  Button.init(action:label:)();
  long long v28 = v66;
  BorderedProminentButtonStyle.init()();
  sub_1000172BC(&qword_100044930, &qword_1000448C8);
  sub_100016C2C(&qword_1000448B0, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
  uint64_t v29 = v64;
  uint64_t v30 = v69;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v28, v30);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v11, v29);
  long long v31 = v71;
  static ButtonBorderShape.circle.getter();
  uint64_t KeyPath = swift_getKeyPath();
  long long v33 = (uint64_t *)&v15[*(int *)(v62 + 36)];
  uint64_t v34 = sub_10000B130(&qword_1000448B8);
  uint64_t v36 = v72;
  uint64_t v35 = v73;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))((char *)v33 + *(int *)(v34 + 28), v31, v73);
  uint64_t *v33 = KeyPath;
  uint64_t v37 = v24;
  uint64_t v38 = v65;
  uint64_t v39 = v67;
  (*(void (**)(char *, char *, uint64_t))(v65 + 16))(v15, v13, v67);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v31, v35);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v39);
  if (sub_100014FE4())
  {
    id v40 = [self systemYellowColor];
    uint64_t v41 = Color.init(_:)();
  }
  else
  {
    uint64_t v41 = static Color.black.getter();
  }
  uint64_t v42 = v41;
  uint64_t v43 = (uint64_t)v74;
  uint64_t v44 = swift_getKeyPath();
  uint64_t v84 = v42;
  swift_retain();
  uint64_t v45 = AnyShapeStyle.init<A>(_:)();
  sub_100017300((uint64_t)v15, v43, &qword_1000448D8);
  swift_release();
  uint64_t v46 = (uint64_t *)(v43 + *(int *)(v70 + 36));
  *uint64_t v46 = v44;
  v46[1] = v45;
  sub_10000BA60((uint64_t)v15, &qword_1000448D8);
  if (sub_100014FE4())
  {
    uint64_t v47 = static Color.black.getter();
  }
  else
  {
    id v48 = [self systemYellowColor];
    uint64_t v47 = Color.init(_:)();
  }
  uint64_t v49 = v47;
  uint64_t v50 = v76;
  sub_100017300(v43, v76, &qword_1000448E0);
  *(void *)(v50 + *(int *)(v75 + 36)) = v49;
  sub_10000BA60(v43, &qword_1000448E0);
  uint64_t v84 = Control.accessibilityLabel.getter();
  uint64_t v85 = v51;
  sub_10001715C();
  sub_100013BE0();
  uint64_t v52 = (uint64_t)v80;
  View.accessibilityLabel<A>(_:)();
  swift_bridgeObjectRelease();
  sub_10000BA60(v50, &qword_1000448E8);
  char v53 = sub_100014FE4();
  uint64_t v54 = 24;
  if (v53) {
    uint64_t v54 = 8;
  }
  uint64_t v55 = 16;
  if (v53) {
    uint64_t v55 = 0;
  }
  uint64_t v56 = *(void *)(v37 + v54);
  uint64_t v57 = *(void *)(v37 + v55);
  swift_bridgeObjectRetain();
  uint64_t v84 = v57;
  uint64_t v85 = v56;
  uint64_t v58 = (uint64_t)v81;
  ModifiedContent<>.accessibilityValue<A>(_:)();
  swift_bridgeObjectRelease();
  sub_10000BA60(v52, &qword_1000448F0);
  uint64_t v59 = v77;
  sub_100017300(v58, v77, &qword_1000448F0);
  *(unsigned char *)(v59 + *(int *)(v78 + 36)) = 1;
  sub_10000BA60(v58, &qword_1000448F0);
  return sub_100017364(v59, v83, &qword_1000448F8);
}

uint64_t sub_100014834(uint64_t a1)
{
  uint64_t v2 = sub_10000B130(&qword_1000446B0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MAGAngelClientRequest(0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v32 - v10;
  uint64_t v12 = type metadata accessor for Control();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for DetectionButton(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a1 + *(int *)(v16 + 28), v12);
  int v17 = (*(uint64_t (**)(char *, uint64_t))(v13 + 88))(v15, v12);
  if (v17 == enum case for Control.peopleDetection(_:))
  {
    uint64_t v18 = type metadata accessor for MAGSimulatedEvent();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v11, 7, 12, v18);
LABEL_9:
    sub_1000139D8((uint64_t)v11, (uint64_t)v9, type metadata accessor for MAGAngelClientRequest);
    sub_10000B130((uint64_t *)&unk_100044F10);
    AsyncStream.Continuation.yield(_:)();
    unint64_t v23 = *(void (**)(char *, uint64_t))(v3 + 8);
    uint64_t v24 = v5;
    uint64_t v25 = v2;
    goto LABEL_10;
  }
  int v19 = v17;
  if (v17 == enum case for Control.doorDetection(_:))
  {
    uint64_t v20 = type metadata accessor for MAGSimulatedEvent();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v11, 8, 12, v20);
    goto LABEL_9;
  }
  if (v17 == enum case for Control.objectUnderstanding(_:))
  {
    uint64_t v21 = type metadata accessor for MAGSimulatedEvent();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v11, 6, 12, v21);
    goto LABEL_9;
  }
  if (v17 == enum case for Control.imageCaption(_:))
  {
    uint64_t v22 = type metadata accessor for MAGSimulatedEvent();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v11, 9, 12, v22);
    goto LABEL_9;
  }
  uint64_t v33 = v2;
  if (v17 == enum case for Control.pointSpeak(_:))
  {
    uint64_t v27 = type metadata accessor for MAGSimulatedEvent();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v11, 10, 12, v27);
    sub_1000139D8((uint64_t)v11, (uint64_t)v9, type metadata accessor for MAGAngelClientRequest);
    sub_10000B130((uint64_t *)&unk_100044F10);
    AsyncStream.Continuation.yield(_:)();
    unint64_t v23 = *(void (**)(char *, uint64_t))(v3 + 8);
  }
  else
  {
    int v28 = enum case for Control.textDetection(_:);
    uint64_t v29 = type metadata accessor for MAGSimulatedEvent();
    uint64_t v30 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56);
    long long v31 = (void (**)(char *, uint64_t))(v3 + 8);
    if (v19 != v28)
    {
      v30(v11, 2, 12, v29);
      sub_1000139D8((uint64_t)v11, (uint64_t)v9, type metadata accessor for MAGAngelClientRequest);
      sub_10000B130((uint64_t *)&unk_100044F10);
      AsyncStream.Continuation.yield(_:)();
      (*v31)(v5, v33);
      sub_100013A40((uint64_t)v11, type metadata accessor for MAGAngelClientRequest);
      return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    }
    v30(v11, 5, 12, v29);
    sub_1000139D8((uint64_t)v11, (uint64_t)v9, type metadata accessor for MAGAngelClientRequest);
    sub_10000B130((uint64_t *)&unk_100044F10);
    AsyncStream.Continuation.yield(_:)();
    unint64_t v23 = *v31;
  }
  uint64_t v24 = v5;
  uint64_t v25 = v33;
LABEL_10:
  v23(v24, v25);
  return sub_100013A40((uint64_t)v11, type metadata accessor for MAGAngelClientRequest);
}

uint64_t sub_100014DD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Image.ResizingMode();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DetectionButton(0);
  Control.angelIconName.getter();
  Image.init(_internalSystemName:)();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for Image.ResizingMode.stretch(_:), v2);
  uint64_t v6 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v7 = static Alignment.center.getter();
  sub_100013164(0.0, 1, 0.0, 1, 35.0, 0, 0.0, 1, (uint64_t)v22, 0.0, 1, 35.0, 0, v7, v8, v6, 0, 1);
  swift_release();
  char v9 = static Edge.Set.all.getter();
  uint64_t result = EdgeInsets.init(_all:)();
  char v20 = 0;
  long long v11 = v22[7];
  *(_OWORD *)(a1 + 96) = v22[6];
  *(_OWORD *)(a1 + 112) = v11;
  *(void *)(a1 + 128) = v23;
  long long v12 = v22[3];
  *(_OWORD *)(a1 + 32) = v22[2];
  *(_OWORD *)(a1 + 48) = v12;
  long long v13 = v22[5];
  *(_OWORD *)(a1 + 64) = v22[4];
  *(_OWORD *)(a1 + 80) = v13;
  long long v14 = v22[1];
  *(_OWORD *)a1 = v22[0];
  *(_OWORD *)(a1 + 16) = v14;
  *(unsigned char *)(a1 + 136) = v9;
  *(_DWORD *)(a1 + 137) = *(_DWORD *)v21;
  *(_DWORD *)(a1 + 140) = *(_DWORD *)&v21[3];
  *(void *)(a1 + 144) = v15;
  *(void *)(a1 + 152) = v16;
  *(void *)(a1 + 160) = v17;
  *(void *)(a1 + 168) = v18;
  *(unsigned char *)(a1 + 176) = v20;
  return result;
}

uint64_t sub_100014FE4()
{
  uint64_t v1 = type metadata accessor for Control();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v8[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = type metadata accessor for DetectionButton(0);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + *(int *)(v5 + 28), v1);
  int v6 = (*(uint64_t (**)(unsigned char *, uint64_t))(v2 + 88))(v4, v1);
  if (v6 == enum case for Control.peopleDetection(_:))
  {
    type metadata accessor for MAGAngelPreferences();
    sub_100016C2C(&qword_100044790, (void (*)(uint64_t))type metadata accessor for MAGAngelPreferences);
    StateObject.wrappedValue.getter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    return v8[11];
  }
  else if (v6 == enum case for Control.doorDetection(_:))
  {
    type metadata accessor for MAGAngelPreferences();
    sub_100016C2C(&qword_100044790, (void (*)(uint64_t))type metadata accessor for MAGAngelPreferences);
    StateObject.wrappedValue.getter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    return v8[12];
  }
  else if (v6 == enum case for Control.objectUnderstanding(_:))
  {
    type metadata accessor for MAGAngelPreferences();
    sub_100016C2C(&qword_100044790, (void (*)(uint64_t))type metadata accessor for MAGAngelPreferences);
    StateObject.wrappedValue.getter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    return v8[13];
  }
  else if (v6 == enum case for Control.imageCaption(_:))
  {
    type metadata accessor for MAGAngelPreferences();
    sub_100016C2C(&qword_100044790, (void (*)(uint64_t))type metadata accessor for MAGAngelPreferences);
    StateObject.wrappedValue.getter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    return v8[10];
  }
  else if (v6 == enum case for Control.pointSpeak(_:))
  {
    type metadata accessor for MAGAngelPreferences();
    sub_100016C2C(&qword_100044790, (void (*)(uint64_t))type metadata accessor for MAGAngelPreferences);
    StateObject.wrappedValue.getter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    return v8[15];
  }
  else if (v6 == enum case for Control.textDetection(_:))
  {
    type metadata accessor for MAGAngelPreferences();
    sub_100016C2C(&qword_100044790, (void (*)(uint64_t))type metadata accessor for MAGAngelPreferences);
    StateObject.wrappedValue.getter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    return v8[14];
  }
  else
  {
    (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
    return 0;
  }
}

uint64_t sub_1000155B4()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_1000155D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v47 = a1;
  uint64_t v1 = type metadata accessor for ButtonBorderShape();
  uint64_t v45 = *(void *)(v1 - 8);
  uint64_t v46 = v1;
  __chkstk_darwin(v1);
  uint64_t v44 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for BorderedProminentButtonStyle();
  uint64_t v39 = *(void *)(v3 - 8);
  uint64_t v40 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10000B130(&qword_100044870);
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v38 = v6;
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_10000B130(&qword_100044878);
  uint64_t v9 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  long long v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_10000B130(&qword_100044880);
  __chkstk_darwin(v36);
  long long v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = sub_10000B130(&qword_100044888);
  __chkstk_darwin(v43);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_10000B130(&qword_100044890);
  __chkstk_darwin(v42);
  uint64_t v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100043E98 != -1) {
    swift_once();
  }
  swift_retain();
  sub_10000B130(&qword_100044898);
  sub_1000170EC(&qword_1000448A0, &qword_100044898);
  Button.init(action:label:)();
  BorderedProminentButtonStyle.init()();
  sub_1000172BC(&qword_1000448A8, &qword_100044870);
  sub_100016C2C(&qword_1000448B0, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
  uint64_t v18 = v38;
  uint64_t v19 = v40;
  View.buttonStyle<A>(_:)();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v5, v19);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v8, v18);
  char v20 = v44;
  static ButtonBorderShape.roundedRectangle.getter();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v22 = (uint64_t *)&v13[*(int *)(v36 + 36)];
  uint64_t v23 = sub_10000B130(&qword_1000448B8);
  uint64_t v25 = v45;
  uint64_t v24 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))((char *)v22 + *(int *)(v23 + 28), v20, v46);
  *uint64_t v22 = KeyPath;
  uint64_t v26 = v41;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v11, v41);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v20, v24);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v26);
  id v27 = [self systemYellowColor];
  uint64_t v28 = Color.init(_:)();
  uint64_t v29 = swift_getKeyPath();
  uint64_t v48 = v28;
  swift_retain();
  uint64_t v30 = AnyShapeStyle.init<A>(_:)();
  sub_100017300((uint64_t)v13, (uint64_t)v15, &qword_100044880);
  swift_release();
  long long v31 = (uint64_t *)&v15[*(int *)(v43 + 36)];
  *long long v31 = v29;
  v31[1] = v30;
  sub_10000BA60((uint64_t)v13, &qword_100044880);
  uint64_t v32 = static Color.black.getter();
  sub_100017300((uint64_t)v15, (uint64_t)v17, &qword_100044888);
  *(void *)&v17[*(int *)(v42 + 36)] = v32;
  sub_10000BA60((uint64_t)v15, &qword_100044888);
  uint64_t v33 = v47;
  sub_100017300((uint64_t)v17, v47, &qword_100044890);
  *(unsigned char *)(v33 + *(int *)(sub_10000B130(&qword_1000448C0) + 36)) = 1;
  return sub_10000BA60((uint64_t)v17, &qword_100044890);
}

uint64_t sub_100015C2C()
{
  uint64_t v0 = sub_10000B130(&qword_1000446B0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MAGAngelClientRequest(0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v12 - v8;
  uint64_t v10 = type metadata accessor for MAGSimulatedEvent();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 2, 12, v10);
  sub_1000139D8((uint64_t)v9, (uint64_t)v7, type metadata accessor for MAGAngelClientRequest);
  sub_10000B130((uint64_t *)&unk_100044F10);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_100013A40((uint64_t)v9, type metadata accessor for MAGAngelClientRequest);
}

uint64_t sub_100015DFC@<X0>(uint64_t a1@<X8>)
{
  String.localized.getter();
  sub_100013BE0();
  uint64_t v2 = Text.init<A>(_:)();
  uint64_t v4 = v3;
  char v6 = v5 & 1;
  static Font.title2.getter();
  uint64_t v7 = Text.font(_:)();
  uint64_t v9 = v8;
  char v11 = v10;
  swift_release();
  sub_100016354(v2, v4, v6);
  swift_bridgeObjectRelease();
  static Font.Weight.medium.getter();
  uint64_t v12 = Text.fontWeight(_:)();
  uint64_t v14 = v13;
  char v16 = v15;
  uint64_t v18 = v17;
  sub_100016354(v7, v9, v11 & 1);
  swift_bridgeObjectRelease();
  char v19 = static Edge.Set.all.getter();
  uint64_t result = EdgeInsets.init(_all:)();
  *(void *)a1 = v12;
  *(void *)(a1 + 8) = v14;
  *(unsigned char *)(a1 + 16) = v16 & 1;
  *(void *)(a1 + 24) = v18;
  *(unsigned char *)(a1 + 32) = v19;
  *(void *)(a1 + 40) = v21;
  *(void *)(a1 + 48) = v22;
  *(void *)(a1 + 56) = v23;
  *(void *)(a1 + 64) = v24;
  *(unsigned char *)(a1 + 72) = 0;
  return result;
}

uint64_t sub_100015F58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10000B130(&qword_100044410);
  __chkstk_darwin(v8);
  char v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100017300(v2, (uint64_t)v10, &qword_100044410);
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
      char v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      v18[1] = a1;
      uint64_t v19 = v17;
      *(_DWORD *)char v16 = 136315138;
      v18[2] = sub_10002D340(0x686353726F6C6F43, 0xEB00000000656D65, &v19);
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

uint64_t sub_100016214(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  uint64_t v3 = *(void *)(a1 + 120);
  char v4 = *(unsigned char *)(a1 + 128);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000162AC(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000162AC(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000162BC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 112);
  uint64_t v3 = *(void *)(a1 + 120);
  char v4 = *(unsigned char *)(a1 + 128);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_100016354(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100016354(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100016364@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100016390()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000163BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000163E8()
{
  return EnvironmentValues.font.setter();
}

unint64_t sub_100016414()
{
  unint64_t result = qword_1000447B8;
  if (!qword_1000447B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000447B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for StopRecognitionButton()
{
  return &type metadata for StopRecognitionButton;
}

uint64_t sub_100016478(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *(void *)a1 = *a2;
    a1 = v16 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    uint64_t v7 = a2[1];
    *(void *)a1 = *a2;
    *(void *)(a1 + 8) = v7;
    uint64_t v8 = a2[3];
    *(void *)(a1 + 16) = a2[2];
    *(void *)(a1 + 24) = v8;
    uint64_t v9 = a2[4];
    uint64_t v10 = a2[5];
    char v11 = *((unsigned char *)a2 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_10000F1BC();
    *(void *)(a1 + 32) = v9;
    *(void *)(a1 + 40) = v10;
    *(unsigned char *)(a1 + 48) = v11;
    uint64_t v12 = *(int *)(a3 + 28);
    uint64_t v13 = a1 + v12;
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = type metadata accessor for Control();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_100016590(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000F308();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  uint64_t v5 = type metadata accessor for Control();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

uint64_t sub_10001661C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  char v10 = *(unsigned char *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_10000F1BC();
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(unsigned char *)(a1 + 48) = v10;
  uint64_t v11 = *(int *)(a3 + 28);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = a2 + v11;
  uint64_t v14 = type metadata accessor for Control();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  return a1;
}

uint64_t sub_1000166E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 32);
  uint64_t v7 = *(void *)(a2 + 40);
  char v8 = *(unsigned char *)(a2 + 48);
  sub_10000F1BC();
  *(void *)(a1 + 32) = v6;
  *(void *)(a1 + 40) = v7;
  *(unsigned char *)(a1 + 48) = v8;
  sub_10000F308();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for Control();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_1000167D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = *(unsigned char *)(a2 + 48);
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = a1 + v5;
  uint64_t v7 = a2 + v5;
  uint64_t v8 = type metadata accessor for Control();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t sub_100016860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  char v8 = *(unsigned char *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(unsigned char *)(a1 + 48) = v8;
  sub_10000F308();
  uint64_t v9 = *(int *)(a3 + 28);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = a2 + v9;
  uint64_t v12 = type metadata accessor for Control();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_100016918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001692C);
}

uint64_t sub_10001692C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = type metadata accessor for Control();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_1000169DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000169F0);
}

uint64_t sub_1000169F0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = type metadata accessor for Control();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_100016A98()
{
  uint64_t result = type metadata accessor for Control();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_100016B40()
{
  unint64_t result = qword_100044858;
  if (!qword_100044858)
  {
    sub_10000B90C(&qword_100044860);
    sub_1000138BC();
    sub_100016C2C(&qword_100044868, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044858);
  }
  return result;
}

uint64_t sub_100016BEC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100016C08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100016C24()
{
  return sub_100015C2C();
}

uint64_t sub_100016C2C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100016C74()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t sub_100016C98(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for ButtonBorderShape();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return EnvironmentValues._buttonBorderShape.setter();
}

uint64_t sub_100016D64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100016D90()
{
  return EnvironmentValues.tint.setter();
}

uint64_t sub_100016DBC()
{
  unint64_t v1 = (int *)(type metadata accessor for DetectionButton(0) - 8);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)v1 + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = v2 | 7;
  unint64_t v5 = ((*(void *)(*(void *)v1 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  uint64_t v6 = v0 + v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000F308();
  uint64_t v7 = v6 + v1[9];
  uint64_t v8 = type metadata accessor for Control();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v8 - 8) + 8))(v7, v8);
  swift_release();

  return _swift_deallocObject(v0, v5, v4);
}

uint64_t sub_100016ED8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100016F40()
{
  uint64_t v1 = *(void *)(type metadata accessor for DetectionButton(0) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_100014834(v2);
}

uint64_t sub_100016FCC@<X0>(uint64_t a1@<X8>)
{
  return sub_100014DD4(a1);
}

uint64_t sub_100016FD4(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B90C(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100017050()
{
  unint64_t result = qword_100044910;
  if (!qword_100044910)
  {
    sub_10000B90C(&qword_100044918);
    sub_1000170EC(&qword_100044920, &qword_100044928);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044910);
  }
  return result;
}

uint64_t sub_1000170EC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B90C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001715C()
{
  unint64_t result = qword_100044938;
  if (!qword_100044938)
  {
    sub_10000B90C(&qword_1000448E8);
    sub_1000171FC();
    sub_1000172BC(&qword_100044968, &qword_100044970);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044938);
  }
  return result;
}

unint64_t sub_1000171FC()
{
  unint64_t result = qword_100044940;
  if (!qword_100044940)
  {
    sub_10000B90C(&qword_1000448E0);
    sub_100017614(&qword_100044948, &qword_1000448D8, &qword_1000448C8, &qword_100044930);
    sub_1000172BC(&qword_100044958, &qword_100044960);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044940);
  }
  return result;
}

uint64_t sub_1000172BC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B90C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100017300(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000B130(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100017364(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10000B130(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000173F8()
{
  return sub_100017434(&qword_100044978, &qword_1000448C0, (void (*)(void))sub_1000174B4);
}

uint64_t sub_100017434(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B90C(a2);
    a3();
    sub_100017754();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000174B4()
{
  unint64_t result = qword_100044980;
  if (!qword_100044980)
  {
    sub_10000B90C(&qword_100044890);
    sub_100017554();
    sub_1000172BC(&qword_100044968, &qword_100044970);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044980);
  }
  return result;
}

unint64_t sub_100017554()
{
  unint64_t result = qword_100044988;
  if (!qword_100044988)
  {
    sub_10000B90C(&qword_100044888);
    sub_100017614(&qword_100044990, &qword_100044880, &qword_100044870, &qword_1000448A8);
    sub_1000172BC(&qword_100044958, &qword_100044960);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044988);
  }
  return result;
}

uint64_t sub_100017614(unint64_t *a1, uint64_t *a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000B90C(a2);
    sub_10000B90C(a3);
    type metadata accessor for BorderedProminentButtonStyle();
    sub_1000172BC(a4, a3);
    sub_100016C2C(&qword_1000448B0, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
    swift_getOpaqueTypeConformance2();
    sub_1000172BC(&qword_100044950, &qword_1000448B8);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100017754()
{
  unint64_t result = qword_100044998;
  if (!qword_100044998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044998);
  }
  return result;
}

uint64_t sub_1000177A8()
{
  return sub_100017434(&qword_1000449A0, &qword_1000448F8, (void (*)(void))sub_1000177E4);
}

unint64_t sub_1000177E4()
{
  unint64_t result = qword_1000449A8;
  if (!qword_1000449A8)
  {
    sub_10000B90C(&qword_1000448F0);
    sub_10001715C();
    sub_100016C2C(&qword_100044868, (void (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000449A8);
  }
  return result;
}

uint64_t sub_100017894@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100017914()
{
  return static Published.subscript.setter();
}

BOOL sub_100017988(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10001799C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000179E4()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100017A10()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_100017BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[23] = a4;
  uint64_t v5 = type metadata accessor for MAGSimulatedEvent();
  v4[24] = v5;
  v4[25] = *(void *)(v5 - 8);
  v4[26] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for DispatchWorkItemFlags();
  v4[27] = v6;
  v4[28] = *(void *)(v6 - 8);
  v4[29] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DispatchQoS();
  v4[30] = v7;
  v4[31] = *(void *)(v7 - 8);
  v4[32] = swift_task_alloc();
  uint64_t v8 = type metadata accessor for DispatchTime();
  v4[33] = v8;
  v4[34] = *(void *)(v8 - 8);
  v4[35] = swift_task_alloc();
  v4[36] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for Logger();
  v4[37] = v9;
  v4[38] = *(void *)(v9 - 8);
  v4[39] = swift_task_alloc();
  uint64_t v10 = type metadata accessor for MAGAngelClientRequest(0);
  v4[40] = v10;
  v4[41] = *(void *)(v10 - 8);
  v4[42] = swift_task_alloc();
  v4[43] = swift_task_alloc();
  v4[44] = swift_task_alloc();
  v4[45] = swift_task_alloc();
  v4[46] = swift_task_alloc();
  sub_10000B130(&qword_100044C98);
  v4[47] = swift_task_alloc();
  uint64_t v11 = sub_10000B130((uint64_t *)&unk_100044CA0);
  v4[48] = v11;
  v4[49] = *(void *)(v11 - 8);
  v4[50] = swift_task_alloc();
  v4[51] = type metadata accessor for MainActor();
  v4[52] = static MainActor.shared.getter();
  uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[53] = v13;
  v4[54] = v12;
  return _swift_task_switch(sub_100017F38, v13, v12);
}

uint64_t sub_100017F38()
{
  if (qword_100043E98 != -1) {
    swift_once();
  }
  sub_10000B130(&qword_1000443E0);
  AsyncStream.makeAsyncIterator()();
  uint64_t v1 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine;
  v0[55] = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_startedProxy;
  v0[56] = v1;
  uint64_t v2 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneRequestFrameCheckDelay;
  v0[57] = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption;
  v0[58] = v2;
  uint64_t v3 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive;
  v0[59] = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences;
  v0[60] = v3;
  v0[61] = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_figCameraViewFinder;
  swift_beginAccess();
  uint64_t v4 = static MainActor.shared.getter();
  v0[62] = v4;
  uint64_t v5 = (void *)swift_task_alloc();
  v0[63] = v5;
  *uint64_t v5 = v0;
  v5[1] = sub_1000180B8;
  uint64_t v6 = v0[47];
  uint64_t v7 = v0[48];
  return AsyncStream.Iterator.next(isolation:)(v6, v4, &protocol witness table for MainActor, v7);
}

uint64_t sub_1000180B8()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 432);
  uint64_t v3 = *(void *)(v1 + 424);
  return _swift_task_switch(sub_1000181FC, v3, v2);
}

uint64_t sub_1000181FC()
{
  uint64_t v79 = v0;
  uint64_t v1 = v0[47];
  if ((*(unsigned int (**)(uint64_t, uint64_t, void))(v0[41] + 48))(v1, 1, v0[40]) == 1)
  {
    (*(void (**)(void, void))(v0[49] + 8))(v0[50], v0[48]);
    swift_release();
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
    uint64_t v2 = (uint64_t (*)(void))v0[1];
    return v2();
  }
  uint64_t v5 = v0[45];
  uint64_t v4 = v0[46];
  sub_100023204(v1, v4);
  static Log.angel.getter();
  sub_100023268(v4, v5);
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  BOOL v8 = os_log_type_enabled(v6, v7);
  uint64_t v9 = v0[45];
  if (v8)
  {
    uint64_t v10 = v0[44];
    uint64_t v77 = v0[39];
    uint64_t v12 = v0[37];
    uint64_t v11 = v0[38];
    uint64_t v13 = swift_slowAlloc();
    uint64_t v78 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136315138;
    sub_100023268(v9, v10);
    uint64_t v14 = String.init<A>(describing:)();
    *(void *)(v13 + 4) = sub_10002D340(v14, v15, &v78);
    swift_bridgeObjectRelease();
    sub_1000232CC(v9);
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "App delegate did receive client request: %s", (uint8_t *)v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v77, v12);
  }
  else
  {
    uint64_t v17 = v0[38];
    uint64_t v16 = v0[39];
    uint64_t v18 = v0[37];
    sub_1000232CC(v0[45]);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v16, v18);
  }
  uint64_t v19 = v0[43];
  uint64_t v20 = v0[24];
  uint64_t v21 = v0[25];
  sub_100023268(v0[46], v19);
  uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 48);
  v0[64] = v22;
  v0[65] = (v21 + 48) & 0xFFFFFFFFFFFFLL | 0x60F0000000000000;
  unsigned int v23 = v22(v19, 12, v20);
  if (v23 > 0xC || ((1 << v23) & 0x101C) == 0)
  {
    uint64_t v26 = v0[55];
    uint64_t v27 = v0[23];
    sub_1000232CC(v0[43]);
    if (*(unsigned char *)(v27 + v26) != 1)
    {
      uint64_t v28 = (void *)swift_task_alloc();
      v0[66] = v28;
      void *v28 = v0;
      v28[1] = sub_100018DAC;
      return sub_100019B68();
    }
    uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v0[64];
  }
  uint64_t v24 = v0[42];
  uint64_t v25 = v0[24];
  sub_100023268(v0[46], v24);
  switch(v22(v24, 12, v25))
  {
    case 1u:
      sub_10001A570();
      goto LABEL_39;
    case 2u:
    case 3u:
      sub_10001B75C();
      goto LABEL_39;
    case 4u:
      v0[67] = static MainActor.shared.getter();
      uint64_t v33 = dispatch thunk of Actor.unownedExecutor.getter();
      v0[68] = v33;
      v0[69] = v32;
      return _swift_task_switch(sub_100019700, v33, v32);
    case 5u:
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      uint64_t v49 = (void (*)(void *, void))static Published.subscript.modify();
      *uint64_t v50 = !*v50;
      v49(v0 + 12, 0);
      swift_release();
      swift_release();
      swift_release();
      if (sub_10001D9C4())
      {
        uint64_t v51 = v0[60];
        uint64_t v52 = v0[23];
        sub_10001BF68();
        if ((*(unsigned char *)(v52 + v51) & 1) == 0) {
          sub_10001A570();
        }
      }
      sub_10001CD8C();
      sub_10001DC2C();
      goto LABEL_39;
    case 6u:
      sub_10001A8B4();
      goto LABEL_39;
    case 7u:
      uint64_t v34 = &unk_100033458;
      uint64_t v35 = &unk_100033480;
      uint64_t v36 = &dispatch thunk of MAGPulseFeedbackProcessor.toneGenerator.getter;
      goto LABEL_38;
    case 8u:
      uint64_t v34 = &unk_100033380;
      uint64_t v35 = &unk_1000333A8;
      uint64_t v36 = &dispatch thunk of MAGPulseFeedbackProcessor.doorToneGenerator.getter;
      goto LABEL_38;
    case 9u:
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      uint64_t v37 = (void (*)(void *, void))static Published.subscript.modify();
      *uint64_t v38 = !*v38;
      v37(v0 + 8, 0);
      swift_release();
      swift_release();
      swift_release();
      sub_10001CD8C();
      sub_10001DC2C();
      if ((sub_10001D9C4() & 1) != 0 && (*(unsigned char *)(v0[23] + v0[60]) & 1) == 0) {
        sub_10001A570();
      }
      id v39 = [self shared];
      id v40 = [v39 downloadManager];

      [v40 downloadImageCaptionAssets];
      goto LABEL_39;
    case 0xAu:
      uint64_t v34 = &unk_1000333C8;
      uint64_t v35 = &unk_1000333F0;
      uint64_t v36 = &dispatch thunk of MAGPulseFeedbackProcessor.pointSpeakDistanceToneGenerator.getter;
LABEL_38:
      sub_10001AAC0((uint64_t)v34, (uint64_t)v35, (uint64_t (*)(void))v36);
      goto LABEL_39;
    case 0xBu:
      uint64_t v41 = v0[57];
      uint64_t v42 = v0[23];
      if (*(unsigned char *)(v42 + v41)) {
        goto LABEL_39;
      }
      uint64_t v43 = v0[35];
      uint64_t v45 = v0[33];
      uint64_t v44 = v0[34];
      uint64_t v69 = v0[32];
      uint64_t v70 = v0[36];
      uint64_t v75 = v0[31];
      uint64_t v76 = v0[30];
      uint64_t v74 = v0[28];
      uint64_t v72 = v0[27];
      uint64_t v73 = v0[29];
      *(unsigned char *)(v42 + v41) = 1;
      sub_10000BB08(0, (unint64_t *)&qword_100044218);
      uint64_t v71 = (void *)static OS_dispatch_queue.main.getter();
      static DispatchTime.now()();
      + infix(_:_:)();
      uint64_t v46 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v46(v43, v45);
      uint64_t v47 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v0[6] = sub_100023328;
      v0[7] = v47;
      v0[2] = _NSConcreteStackBlock;
      v0[3] = 1107296256;
      v0[4] = sub_10000A36C;
      v0[5] = &unk_10003E0C0;
      uint64_t v48 = _Block_copy(v0 + 2);
      swift_retain();
      static DispatchQoS.unspecified.getter();
      v0[22] = &_swiftEmptyArrayStorage;
      sub_100022F9C((unint64_t *)&qword_100044C30, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10000B130(&qword_100044220);
      sub_10000B8B0();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
      _Block_release(v48);

      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v72);
      (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v69, v76);
      v46(v70, v45);
      swift_release();
LABEL_30:
      swift_release();
LABEL_39:
      uint64_t v53 = v0[61];
      uint64_t v54 = v0[23];
      if (*(void *)(v54 + v53) || (*(unsigned char *)(v54 + v0[60]) & 1) != 0 || *(unsigned char *)(v54 + v0[55]) != 1)
      {
        uint64_t v64 = v0[46];
        goto LABEL_47;
      }
      id v55 = [objc_allocWithZone((Class)FigCameraViewfinder) init];
      uint64_t v56 = *(void **)(v54 + v53);
      *(void *)(v54 + v53) = v55;

      uint64_t v57 = *(void **)(v54 + v53);
      if (v57)
      {
        uint64_t v58 = v0[23];
        sub_10000BB08(0, (unint64_t *)&qword_100044218);
        id v59 = v57;
        uint64_t v60 = (void *)static OS_dispatch_queue.main.getter();
        [v59 setDelegate:v58 queue:v60];
      }
      uint64_t v61 = (void **)(v0[23] + v0[61]);
      swift_beginAccess();
      uint64_t v62 = *v61;
      uint64_t v63 = v0[46];
      if (v62)
      {
        swift_endAccess();
        [v62 startWithOptions:0];
        uint64_t v64 = v63;
LABEL_47:
        sub_1000232CC(v64);
        goto LABEL_48;
      }
      sub_1000232CC(v0[46]);
      swift_endAccess();
LABEL_48:
      uint64_t v65 = static MainActor.shared.getter();
      v0[62] = v65;
      uint64_t v66 = (void *)swift_task_alloc();
      v0[63] = v66;
      *uint64_t v66 = v0;
      v66[1] = sub_1000180B8;
      uint64_t v67 = v0[47];
      uint64_t v68 = v0[48];
      uint64_t result = AsyncStream.Iterator.next(isolation:)(v67, v65, &protocol witness table for MainActor, v68);
      break;
    case 0xCu:
      swift_retain();
      dispatch thunk of MAGOutputEngine.stopSpeechImmediately()();
      swift_release();
      swift_retain();
      dispatch thunk of MAGOutputEngine.clearEventQueue()();
      goto LABEL_30;
    default:
      uint64_t v29 = v0[25];
      uint64_t v30 = v0[26];
      uint64_t v31 = v0[24];
      (*(void (**)(uint64_t, void, uint64_t))(v29 + 32))(v30, v0[42], v31);
      sub_10001B0AC(v30);
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v30, v31);
      goto LABEL_39;
  }
  return result;
}

uint64_t sub_100018DAC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 432);
  uint64_t v3 = *(void *)(v1 + 424);
  return _swift_task_switch(sub_100018ECC, v3, v2);
}

uint64_t sub_100018ECC()
{
  uint64_t v1 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[64];
  uint64_t v2 = v0[42];
  uint64_t v3 = v0[24];
  sub_100023268(v0[46], v2);
  switch(v1(v2, 12, v3))
  {
    case 1u:
      sub_10001A570();
      goto LABEL_25;
    case 2u:
    case 3u:
      sub_10001B75C();
      goto LABEL_25;
    case 4u:
      v0[67] = static MainActor.shared.getter();
      uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
      v0[68] = v8;
      v0[69] = v7;
      return _swift_task_switch(sub_100019700, v8, v7);
    case 5u:
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      uint64_t v9 = (void (*)(void *, void))static Published.subscript.modify();
      *uint64_t v10 = !*v10;
      v9(v0 + 12, 0);
      swift_release();
      swift_release();
      swift_release();
      if (sub_10001D9C4())
      {
        uint64_t v11 = v0[60];
        uint64_t v12 = v0[23];
        sub_10001BF68();
        if ((*(unsigned char *)(v12 + v11) & 1) == 0) {
          sub_10001A570();
        }
      }
      sub_10001CD8C();
      sub_10001DC2C();
      goto LABEL_25;
    case 6u:
      sub_10001A8B4();
      goto LABEL_25;
    case 7u:
      uint64_t v13 = &unk_100033458;
      uint64_t v14 = &unk_100033480;
      unint64_t v15 = &dispatch thunk of MAGPulseFeedbackProcessor.toneGenerator.getter;
      goto LABEL_24;
    case 8u:
      uint64_t v13 = &unk_100033380;
      uint64_t v14 = &unk_1000333A8;
      unint64_t v15 = &dispatch thunk of MAGPulseFeedbackProcessor.doorToneGenerator.getter;
      goto LABEL_24;
    case 9u:
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      uint64_t v16 = (void (*)(void *, void))static Published.subscript.modify();
      BOOL *v17 = !*v17;
      v16(v0 + 8, 0);
      swift_release();
      swift_release();
      swift_release();
      sub_10001CD8C();
      sub_10001DC2C();
      if ((sub_10001D9C4() & 1) != 0 && (*(unsigned char *)(v0[23] + v0[60]) & 1) == 0) {
        sub_10001A570();
      }
      id v18 = [self shared];
      id v19 = [v18 downloadManager];

      [v19 downloadImageCaptionAssets];
      goto LABEL_25;
    case 0xAu:
      uint64_t v13 = &unk_1000333C8;
      uint64_t v14 = &unk_1000333F0;
      unint64_t v15 = &dispatch thunk of MAGPulseFeedbackProcessor.pointSpeakDistanceToneGenerator.getter;
LABEL_24:
      sub_10001AAC0((uint64_t)v13, (uint64_t)v14, (uint64_t (*)(void))v15);
      goto LABEL_25;
    case 0xBu:
      uint64_t v20 = v0[57];
      uint64_t v21 = v0[23];
      if (*(unsigned char *)(v21 + v20)) {
        goto LABEL_25;
      }
      uint64_t v22 = v0[35];
      uint64_t v44 = v0[36];
      uint64_t v23 = v0[33];
      uint64_t v52 = v0[34];
      uint64_t v50 = v0[31];
      uint64_t v51 = v0[30];
      uint64_t v47 = v0[29];
      uint64_t v43 = v0[32];
      uint64_t v49 = v0[28];
      uint64_t v46 = v0[27];
      *(unsigned char *)(v21 + v20) = 1;
      sub_10000BB08(0, (unint64_t *)&qword_100044218);
      uint64_t v45 = (void *)static OS_dispatch_queue.main.getter();
      static DispatchTime.now()();
      + infix(_:_:)();
      uint64_t v48 = *(void (**)(uint64_t, uint64_t))(v52 + 8);
      v48(v22, v23);
      uint64_t v24 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v0[6] = sub_100023328;
      v0[7] = v24;
      v0[2] = _NSConcreteStackBlock;
      v0[3] = 1107296256;
      v0[4] = sub_10000A36C;
      v0[5] = &unk_10003E0C0;
      uint64_t v25 = _Block_copy(v0 + 2);
      swift_retain();
      static DispatchQoS.unspecified.getter();
      v0[22] = &_swiftEmptyArrayStorage;
      sub_100022F9C((unint64_t *)&qword_100044C30, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10000B130(&qword_100044220);
      sub_10000B8B0();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
      _Block_release(v25);

      (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v47, v46);
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v43, v51);
      v48(v44, v23);
      swift_release();
LABEL_20:
      swift_release();
LABEL_25:
      uint64_t v26 = v0[61];
      uint64_t v27 = v0[23];
      if (*(void *)(v27 + v26) || (*(unsigned char *)(v27 + v0[60]) & 1) != 0 || *(unsigned char *)(v27 + v0[55]) != 1)
      {
        uint64_t v37 = v0[46];
        goto LABEL_33;
      }
      id v28 = [objc_allocWithZone((Class)FigCameraViewfinder) init];
      uint64_t v29 = *(void **)(v27 + v26);
      *(void *)(v27 + v26) = v28;

      uint64_t v30 = *(void **)(v27 + v26);
      if (v30)
      {
        uint64_t v31 = v0[23];
        sub_10000BB08(0, (unint64_t *)&qword_100044218);
        id v32 = v30;
        uint64_t v33 = (void *)static OS_dispatch_queue.main.getter();
        [v32 setDelegate:v31 queue:v33];
      }
      uint64_t v34 = (void **)(v0[23] + v0[61]);
      swift_beginAccess();
      uint64_t v35 = *v34;
      uint64_t v36 = v0[46];
      if (v35)
      {
        swift_endAccess();
        [v35 startWithOptions:0];
        uint64_t v37 = v36;
LABEL_33:
        sub_1000232CC(v37);
        goto LABEL_34;
      }
      sub_1000232CC(v0[46]);
      swift_endAccess();
LABEL_34:
      uint64_t v38 = static MainActor.shared.getter();
      v0[62] = v38;
      id v39 = (void *)swift_task_alloc();
      v0[63] = v39;
      *id v39 = v0;
      v39[1] = sub_1000180B8;
      uint64_t v40 = v0[47];
      uint64_t v41 = v0[48];
      return AsyncStream.Iterator.next(isolation:)(v40, v38, &protocol witness table for MainActor, v41);
    case 0xCu:
      swift_retain();
      dispatch thunk of MAGOutputEngine.stopSpeechImmediately()();
      swift_release();
      swift_retain();
      dispatch thunk of MAGOutputEngine.clearEventQueue()();
      goto LABEL_20;
    default:
      uint64_t v5 = v0[25];
      uint64_t v4 = v0[26];
      uint64_t v6 = v0[24];
      (*(void (**)(uint64_t, void, uint64_t))(v5 + 32))(v4, v0[42], v6);
      sub_10001B0AC(v4);
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
      goto LABEL_25;
  }
}

uint64_t sub_100019700()
{
  uint64_t v1 = v0[23];
  if (*(unsigned char *)(v1 + v0[60]) == 1)
  {
    swift_release();
    sub_10001B75C();
LABEL_5:
    uint64_t v2 = v0[53];
    uint64_t v3 = v0[54];
    return _swift_task_switch(sub_100019804, v2, v3);
  }
  if (*(unsigned char *)(v1 + v0[55]))
  {
    swift_release();
    sub_10001A570();
    goto LABEL_5;
  }
  uint64_t v4 = (void *)swift_task_alloc();
  v0[70] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000199DC;
  return sub_100019B68();
}

uint64_t sub_100019804()
{
  uint64_t v1 = v0[61];
  uint64_t v2 = v0[23];
  if (*(void *)(v2 + v1) || (*(unsigned char *)(v2 + v0[60]) & 1) != 0 || *(unsigned char *)(v2 + v0[55]) != 1)
  {
    uint64_t v12 = v0[46];
    goto LABEL_9;
  }
  id v3 = [objc_allocWithZone((Class)FigCameraViewfinder) init];
  uint64_t v4 = *(void **)(v2 + v1);
  *(void *)(v2 + v1) = v3;

  uint64_t v5 = *(void **)(v2 + v1);
  if (v5)
  {
    uint64_t v6 = v0[23];
    sub_10000BB08(0, (unint64_t *)&qword_100044218);
    id v7 = v5;
    uint64_t v8 = (void *)static OS_dispatch_queue.main.getter();
    [v7 setDelegate:v6 queue:v8];
  }
  uint64_t v9 = (void **)(v0[23] + v0[61]);
  swift_beginAccess();
  uint64_t v10 = *v9;
  uint64_t v11 = v0[46];
  if (v10)
  {
    swift_endAccess();
    [v10 startWithOptions:0];
    uint64_t v12 = v11;
LABEL_9:
    sub_1000232CC(v12);
    goto LABEL_10;
  }
  sub_1000232CC(v0[46]);
  swift_endAccess();
LABEL_10:
  uint64_t v13 = static MainActor.shared.getter();
  v0[62] = v13;
  uint64_t v14 = (void *)swift_task_alloc();
  v0[63] = v14;
  void *v14 = v0;
  v14[1] = sub_1000180B8;
  uint64_t v15 = v0[47];
  uint64_t v16 = v0[48];
  return AsyncStream.Iterator.next(isolation:)(v15, v13, &protocol witness table for MainActor, v16);
}

uint64_t sub_1000199DC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 552);
  uint64_t v3 = *(void *)(v1 + 544);
  return _swift_task_switch(sub_100019AFC, v3, v2);
}

uint64_t sub_100019AFC()
{
  swift_release();
  sub_10001A570();
  uint64_t v1 = *(void *)(v0 + 424);
  uint64_t v2 = *(void *)(v0 + 432);
  return _swift_task_switch(sub_100019804, v1, v2);
}

uint64_t sub_100019B68()
{
  v1[8] = v0;
  uint64_t v2 = type metadata accessor for Date();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for MAGOutputEventEnvironment();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for MAGOutputEventSource();
  v1[15] = v4;
  v1[16] = *(void *)(v4 - 8);
  v1[17] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for MAGOutputEvent();
  v1[18] = v5;
  v1[19] = *(void *)(v5 - 8);
  v1[20] = swift_task_alloc();
  type metadata accessor for MainActor();
  v1[21] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v1[22] = v7;
  v1[23] = v6;
  return _swift_task_switch(sub_100019D70, v7, v6);
}

uint64_t sub_100019D70()
{
  uint64_t v1 = v0[20];
  uint64_t v2 = v0[17];
  uint64_t v24 = v0[19];
  uint64_t v25 = v0[18];
  uint64_t v4 = v0[15];
  uint64_t v3 = v0[16];
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[14];
  uint64_t v7 = v0[12];
  MSNMonitorBeginException();
  v0[24] = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine;
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v2, enum case for MAGOutputEventSource.liveDetection(_:), v4);
  (*(void (**)(uint64_t, void, uint64_t))(v5 + 104))(v6, enum case for MAGOutputEventEnvironment.angel(_:), v7);
  swift_retain();
  static MAGOutputEvent.liveRecognitionStarted(source:environment:)();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  dispatch thunk of MAGOutputEngine.schedule(_:)();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v1, v25);
  sub_10001BF68();
  if (AXDeviceHasJindo())
  {
    uint64_t v8 = v0[8];
    *(unsigned char *)(v8 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_startedProxy) = 1;
    uint64_t v9 = *(void **)(v8 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelProxy);
    v0[25] = v9;
    id v10 = v9;
    return _swift_task_switch(sub_10001A130, 0, 0);
  }
  else
  {
    swift_release();
    uint64_t v12 = v0[10];
    uint64_t v11 = v0[11];
    uint64_t v13 = v0[8];
    uint64_t v14 = v0[9];
    id v15 = [self defaultCenter];
    [v15 addObserver:v13 selector:"checkForDeactivationReasonWithNotification:" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

    id v16 = [self sharedInstance];
    [v16 setLiveRecognitionActive:1];

    uint64_t v17 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
    uint64_t v18 = (char *)*(id *)(v13 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager);
    Date.init()();
    id v19 = &v18[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime];
    swift_beginAccess();
    uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 40);
    v20(v19, v11, v14);
    swift_endAccess();

    *(void *)(*(void *)(v13 + v17) + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus) = 0;
    Date.init()();
    uint64_t v21 = (char *)(v13 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelLaunchTime);
    swift_beginAccess();
    v20(v21, v11, v14);
    swift_endAccess();
    swift_retain();
    dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.setter();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = (uint64_t (*)(void))v0[1];
    return v22();
  }
}

uint64_t sub_10001A130()
{
  if (qword_100043F48 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v1;
  void *v1 = v0;
  v1[1] = sub_10001A1F4;
  return sub_100026F34();
}

uint64_t sub_10001A1F4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 200);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 184);
  uint64_t v4 = *(void *)(v1 + 176);
  return _swift_task_switch(sub_10001A334, v4, v3);
}

uint64_t sub_10001A334()
{
  swift_release();
  uint64_t v2 = v0[10];
  uint64_t v1 = v0[11];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[9];
  id v5 = [self defaultCenter];
  [v5 addObserver:v3 selector:"checkForDeactivationReasonWithNotification:" name:UIAccessibilityVoiceOverStatusDidChangeNotification object:0];

  id v6 = [self sharedInstance];
  [v6 setLiveRecognitionActive:1];

  uint64_t v7 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
  uint64_t v8 = (char *)*(id *)(v3 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager);
  Date.init()();
  uint64_t v9 = &v8[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime];
  swift_beginAccess();
  id v10 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 40);
  v10(v9, v1, v4);
  swift_endAccess();

  *(void *)(*(void *)(v3 + v7) + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus) = 0;
  Date.init()();
  uint64_t v11 = (char *)(v3 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelLaunchTime);
  swift_beginAccess();
  v10(v11, v1, v4);
  swift_endAccess();
  swift_retain();
  dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.setter();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v12 = (uint64_t (*)(void))v0[1];
  return v12();
}

void sub_10001A570()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for DispatchQoS();
  uint64_t v4 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  id v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [objc_allocWithZone((Class)SBSUIMagnifierSceneSpecification) init];
  id v8 = [v7 uiSceneSessionRole];

  sub_10000BB08(0, (unint64_t *)&qword_100044218);
  uint64_t v9 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v8;
  aBlock[4] = sub_100023368;
  aBlock[5] = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A36C;
  aBlock[3] = &unk_10003E110;
  uint64_t v11 = _Block_copy(aBlock);
  id v12 = v8;
  static DispatchQoS.unspecified.getter();
  uint64_t v17 = &_swiftEmptyArrayStorage;
  sub_100022F9C((unint64_t *)&qword_100044C30, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000B130(&qword_100044220);
  sub_10000B8B0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v15);
  swift_release();
  *(unsigned char *)(v16 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive) = 1;
  id v13 = [self sharedInstance];
  [v13 setLiveRecognitionOverlayOpen:1];
}

void sub_10001A8B4()
{
  uint64_t v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  uint64_t v2 = (void (*)(unsigned char *, void))static Published.subscript.modify();
  *uint64_t v3 = !*v3;
  v2(v10, 0);
  swift_release();
  swift_release();
  swift_release();
  if (sub_10001D9C4())
  {
    sub_10001BF68();
    if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive) & 1) == 0) {
      sub_10001A570();
    }
  }
  uint64_t v4 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
  id v5 = *(id *)(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager);
  sub_1000082B4();

  sub_10001CD8C();
  sub_10001DC2C();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  int v6 = v10[0];
  id v7 = objc_retain(*(id *)(*(void *)(v1 + v4)
                         + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
  id v8 = (void *)dispatch thunk of MAGPulseFeedbackProcessor.objectUnderstandingToneGenerator.getter();

  if (v6 == 1)
  {
    [v8 setUseHapticFeedback:1];

    id v9 = objc_retain(*(id *)(*(void *)(v1 + v4)
                           + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
    id v8 = (void *)dispatch thunk of MAGPulseFeedbackProcessor.objectUnderstandingToneGenerator.getter();

    [v8 setUseSoundFeedback:1];
  }
  else
  {
    [v8 stopPulse];
  }
}

void sub_10001AAC0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = v3;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  int v6 = (void (*)(unsigned char *, void))static Published.subscript.modify();
  *id v7 = !*v7;
  v6(v13, 0);
  swift_release();
  swift_release();
  swift_release();
  if (sub_10001D9C4())
  {
    sub_10001BF68();
    if ((*(unsigned char *)(v3 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive) & 1) == 0) {
      sub_10001A570();
    }
  }
  sub_10001CD8C();
  sub_10001DC2C();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  uint64_t v8 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
  int v9 = v13[0];
  id v10 = objc_retain(*(id *)(*(void *)(v3 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager)
                          + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
  uint64_t v11 = (void *)a3();

  if (v9 == 1)
  {
    [v11 setUseHapticFeedback:1];

    id v12 = objc_retain(*(id *)(*(void *)(v5 + v8)
                            + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
    uint64_t v11 = (void *)a3();

    [v11 setUseSoundFeedback:1];
  }
  else
  {
    [v11 stopPulse];
  }
}

uint64_t sub_10001ACC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v24 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchTime();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v20 - v15;
  if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption) & 1) == 0)
  {
    *(unsigned char *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption) = 1;
    sub_10000BB08(0, (unint64_t *)&qword_100044218);
    uint64_t v23 = v3;
    uint64_t v21 = static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    + infix(_:_:)();
    uint64_t v22 = *(void (**)(char *, uint64_t))(v10 + 8);
    v22(v13, v9);
    uint64_t v17 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_100023328;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000A36C;
    aBlock[3] = &unk_10003E188;
    uint64_t v18 = _Block_copy(aBlock);
    swift_retain();
    static DispatchQoS.unspecified.getter();
    uint64_t v25 = &_swiftEmptyArrayStorage;
    sub_100022F9C((unint64_t *)&qword_100044C30, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    uint64_t v20 = v6;
    sub_10000B130(&qword_100044220);
    sub_10000B8B0();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    id v19 = (void *)v21;
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v8, v20);
    v22(v16, v9);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_10001B0AC(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for MAGOutputEventEnvironment();
  uint64_t v48 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v47 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = type metadata accessor for MAGOutputEventSource();
  uint64_t v43 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v46 = (char *)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for MAGOutputEvent.EventType();
  uint64_t v38 = *(void *)(v7 - 8);
  uint64_t v39 = v7;
  __chkstk_darwin(v7);
  uint64_t v40 = (void *)((char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v44 = type metadata accessor for MAGOutputEvent();
  uint64_t v42 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v41 = (char *)v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for MAGSimulatedEvent.EventType();
  uint64_t v51 = *(void *)(v10 - 8);
  uint64_t v52 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (void *)((char *)v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v13 = type metadata accessor for MAGSimulatedEvent();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for Logger();
  uint64_t v49 = *(void *)(v17 - 8);
  uint64_t v50 = v17;
  __chkstk_darwin(v17);
  id v19 = (char *)v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.angel.getter();
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  uint64_t v53 = a1;
  v20(v16, a1, v13);
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v37 = v2;
    uint64_t v24 = (uint8_t *)v23;
    uint64_t v35 = swift_slowAlloc();
    uint64_t v55 = v35;
    uint64_t v36 = v4;
    *(_DWORD *)uint64_t v24 = 136315138;
    v34[1] = v24 + 4;
    sub_100022F9C(&qword_100044CC8, (void (*)(uint64_t))&type metadata accessor for MAGSimulatedEvent);
    uint64_t v25 = dispatch thunk of CustomStringConvertible.description.getter();
    uint64_t v54 = sub_10002D340(v25, v26, &v55);
    uint64_t v4 = v36;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Handling simulated event: %s", v24, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }

  (*(void (**)(char *, uint64_t))(v49 + 8))(v19, v50);
  MAGSimulatedEvent.eventType.getter();
  uint64_t v28 = v51;
  uint64_t v27 = v52;
  if ((*(unsigned int (**)(void *, uint64_t))(v51 + 88))(v12, v52) != enum case for MAGSimulatedEvent.EventType.announcement(_:)) {
    return (*(uint64_t (**)(void *, uint64_t))(v28 + 8))(v12, v27);
  }
  (*(void (**)(void *, uint64_t))(v28 + 96))(v12, v27);
  uint64_t v29 = v12[1];
  uint64_t v30 = v39;
  uint64_t v31 = v40;
  *uint64_t v40 = *v12;
  v31[1] = v29;
  (*(void (**)(void *, void, uint64_t))(v38 + 104))(v31, enum case for MAGOutputEvent.EventType.testSpeech(_:), v30);
  (*(void (**)(char *, void, uint64_t))(v43 + 104))(v46, enum case for MAGOutputEventSource.magAction(_:), v45);
  (*(void (**)(char *, void, uint64_t))(v48 + 104))(v47, enum case for MAGOutputEventEnvironment.angel(_:), v4);
  id v32 = v41;
  MAGOutputEvent.init(_:source:environment:)();
  swift_retain();
  dispatch thunk of MAGOutputEngine.schedule(_:)();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v32, v44);
}

void sub_10001B75C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10000B130(&qword_100044BE0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for MAGOutputEventEnvironment();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for MAGOutputEventSource();
  uint64_t v50 = *(void *)(v9 - 8);
  uint64_t v51 = v9;
  __chkstk_darwin(v9);
  uint64_t v47 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for MAGOutputEvent();
  uint64_t v48 = *(void *)(v11 - 8);
  uint64_t v49 = v11;
  __chkstk_darwin(v11);
  uint64_t v46 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v45 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  uint64_t v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  dispatch thunk of MAGOutputEngine.stopSpeechImmediately()();
  swift_release();
  swift_retain();
  dispatch thunk of MAGOutputEngine.clearEventQueue()();
  swift_release();
  swift_retain();
  dispatch thunk of MAGOutputEngine.resetSpeechContent()();
  swift_release();
  static Log.angel.getter();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v44 = v8;
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Deactivating Scene Session and/or Jindo Activity and stopping arSession", v18, 2u);
    uint64_t v8 = v44;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v45);
  uint64_t v20 = v50;
  uint64_t v19 = v51;
  uint64_t v21 = v47;
  (*(void (**)(char *, void, uint64_t))(v50 + 104))(v47, enum case for MAGOutputEventSource.liveDetection(_:), v51);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for MAGOutputEventEnvironment.angel(_:), v5);
  swift_retain();
  os_log_type_t v22 = v46;
  static MAGOutputEvent.liveRecognitionStopped(source:environment:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v19);
  dispatch thunk of MAGOutputEngine.schedule(_:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v22, v49);
  uint64_t v23 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService;
  id v24 = *(id *)&v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService];
  dispatch thunk of MAGARService.stopARSession()();

  id v25 = *(id *)&v1[v23];
  dispatch thunk of MAGARService.arSession.setter();

  unint64_t v26 = (void **)&v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_figCameraViewFinder];
  swift_beginAccess();
  uint64_t v27 = *v26;
  *unint64_t v26 = 0;

  MSNMonitorEndException();
  if (AXDeviceHasJindo())
  {
    uint64_t v28 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v4, 1, 1, v28);
    type metadata accessor for MainActor();
    uint64_t v29 = v1;
    uint64_t v30 = static MainActor.shared.getter();
    uint64_t v31 = (void *)swift_allocObject();
    v31[2] = v30;
    v31[3] = &protocol witness table for MainActor;
    v31[4] = v29;
    sub_100004158((uint64_t)v4, (uint64_t)&unk_100044C18, (uint64_t)v31);
    swift_release();
  }
  sub_10001CAB0();
  v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_startedProxy] = 0;
  swift_getKeyPath();
  swift_getKeyPath();
  char v52 = 0;
  swift_retain();
  static Published.subscript.setter();
  swift_getKeyPath();
  swift_getKeyPath();
  char v52 = 0;
  swift_retain();
  static Published.subscript.setter();
  swift_getKeyPath();
  swift_getKeyPath();
  char v52 = 0;
  swift_retain();
  static Published.subscript.setter();
  swift_getKeyPath();
  swift_getKeyPath();
  char v52 = 0;
  swift_retain();
  static Published.subscript.setter();
  swift_getKeyPath();
  swift_getKeyPath();
  char v52 = 0;
  swift_retain();
  static Published.subscript.setter();
  uint64_t v32 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
  id v33 = objc_retain(*(id *)(*(void *)&v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager]
                          + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
  uint64_t v34 = (void *)dispatch thunk of MAGPulseFeedbackProcessor.toneGenerator.getter();

  [v34 stopPulse];
  id v35 = objc_retain(*(id *)(*(void *)&v1[v32]
                          + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
  uint64_t v36 = (void *)dispatch thunk of MAGPulseFeedbackProcessor.toneGenerator.getter();

  [v36 stopPulse];
  id v37 = objc_retain(*(id *)(*(void *)&v1[v32]
                          + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
  uint64_t v38 = (void *)dispatch thunk of MAGPulseFeedbackProcessor.doorToneGenerator.getter();

  [v38 stopPulse];
  id v39 = objc_retain(*(id *)(*(void *)&v1[v32]
                          + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
  uint64_t v40 = (void *)dispatch thunk of MAGPulseFeedbackProcessor.objectUnderstandingToneGenerator.getter();

  [v40 stopPulse];
  id v41 = objc_retain(*(id *)(*(void *)&v1[v32]
                          + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_pulseFeedbackProcessor));
  uint64_t v42 = (void *)dispatch thunk of MAGPulseFeedbackProcessor.pointSpeakDistanceToneGenerator.getter();

  [v42 stopPulse];
  id v43 = [self sharedInstance];
  [v43 setLiveRecognitionActive:0];

  sub_10001CD8C();
}

void sub_10001BF68()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for MFFeatureFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_isAlternateAppCameraRunning) & 1) == 0)
  {
    uint64_t v6 = *(void **)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService);
    swift_getKeyPath();
    swift_getKeyPath();
    id v7 = v6;
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if ((v8[15] & 1) == 0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      if ((v8[14] & 1) == 0)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        swift_release();
        if (v8[13] == 1)
        {
          (*(void (**)(unsigned char *, void, uint64_t))(v3 + 104))(v5, enum case for MFFeatureFlags.groupTextDetections(_:), v2);
          MFFeatureFlags.isEnabled.getter();
          (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
        }
      }
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if ((v8[12] & 1) == 0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    dispatch thunk of MAGARService.startARSession(sceneDepth:personSegmentation:sceneReconstruction:)();
  }
}

uint64_t sub_10001C2EC(void *a1)
{
  uint64_t v2 = type metadata accessor for UISceneSessionActivationRequest();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.angel.getter();
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "activateUIScene() activateSceneSession", v12, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  id v13 = a1;
  UISceneSessionActivationRequest.init(role:userActivity:options:)();
  id v14 = [self sharedApplication];
  UIApplication.activateSceneSession(for:errorHandler:)();

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_10001C520()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.angel.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    v11[0] = v0;
    uint64_t v7 = (uint8_t *)v6;
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v11[1] = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Could not open scene %@", v7, 0xCu);
    sub_10000B130((uint64_t *)&unk_1000453F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v0 = v11[0];
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10001C72C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a4;
  type metadata accessor for MainActor();
  v4[3] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v4[4] = v6;
  v4[5] = v5;
  return _swift_task_switch(sub_10001C7C4, v6, v5);
}

uint64_t sub_10001C7C4()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 16) + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelProxy);
  *(void *)(v0 + 48) = v1;
  id v2 = v1;
  return _swift_task_switch(sub_10001C840, 0, 0);
}

uint64_t sub_10001C840()
{
  if (qword_100043F48 != -1) {
    swift_once();
  }
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100044F50 + dword_100044F50);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 56) = v1;
  void *v1 = v0;
  v1[1] = sub_10001C910;
  return v3();
}

uint64_t sub_10001C910()
{
  uint64_t v1 = *v0;
  id v2 = *(void **)(*v0 + 48);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 40);
  uint64_t v4 = *(void *)(v1 + 32);
  return _swift_task_switch(sub_10001CA50, v4, v3);
}

uint64_t sub_10001CA50()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_10001CAB0()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BB08(0, (unint64_t *)&qword_100044218);
  uint64_t v8 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_10001D2B4;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A36C;
  aBlock[3] = &unk_10003E020;
  uint64_t v9 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter();
  v11[1] = &_swiftEmptyArrayStorage;
  sub_100022F9C((unint64_t *)&qword_100044C30, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000B130(&qword_100044220);
  sub_10000B8B0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(unsigned char *)(v11[0] + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive) = 0;
  id v10 = [self sharedInstance];
  [v10 setLiveRecognitionOverlayOpen:0];
}

void sub_10001CD8C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v7 == 1)
  {
    UInt32._bridgeToObjectiveC()();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v6 == 1)
  {
    UInt32._bridgeToObjectiveC()();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v5 == 1)
  {
    UInt32._bridgeToObjectiveC()();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v4 == 1)
  {
    UInt32._bridgeToObjectiveC()();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v3 == 1)
  {
    UInt32._bridgeToObjectiveC()();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v2 == 1)
  {
    UInt32._bridgeToObjectiveC()();
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    if (*(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
    }
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
  }
  id v0 = [self sharedInstance];
  sub_10000BB08(0, (unint64_t *)&unk_100044C20);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v0 setEnabledLiveRecognitionModes:isa];
}

void sub_10001D2B4()
{
  id v0 = [objc_allocWithZone((Class)SBSUIMagnifierSceneSpecification) init];
  id v31 = [v0 uiSceneSessionRole];

  id v30 = self;
  id v1 = [v30 sharedApplication];
  id v2 = [v1 connectedScenes];

  sub_10000BB08(0, &qword_100044C48);
  sub_100022F2C();
  uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  if ((v3 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    Set.Iterator.init(_cocoa:)();
    uint64_t v3 = aBlock[6];
    uint64_t v29 = aBlock[7];
    uint64_t v4 = aBlock[8];
    uint64_t v5 = aBlock[9];
    unint64_t v6 = aBlock[10];
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = -1 << *(unsigned char *)(v3 + 32);
    uint64_t v29 = v3 + 56;
    uint64_t v4 = ~v7;
    uint64_t v8 = -v7;
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v6 = v9 & *(void *)(v3 + 56);
  }
  int64_t v28 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_38;
    }
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v13 = (id)aBlock[0];
    swift_unknownObjectRelease();
    uint64_t v16 = v5;
    uint64_t v14 = v6;
    if (!v13) {
      goto LABEL_38;
    }
LABEL_32:
    id v20 = [v13 session];
    id v21 = [v20 role];

    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v23;
    if (v22 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v24 == v25)
    {

      swift_bridgeObjectRelease_n();
LABEL_9:
      id v10 = [v30 sharedApplication];
      id v11 = [v13 session];
      aBlock[4] = sub_10001D730;
      aBlock[5] = 0;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10001D95C;
      aBlock[3] = &unk_10003E048;
      uint64_t v12 = _Block_copy(aBlock);
      [v10 requestSceneSessionDestruction:v11 options:0 errorHandler:v12];
      _Block_release(v12);

      id v13 = v11;
      goto LABEL_10;
    }
    char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v27) {
      goto LABEL_9;
    }
LABEL_10:

    uint64_t v5 = v16;
    unint64_t v6 = v14;
  }
  if (v6)
  {
    uint64_t v14 = (v6 - 1) & v6;
    unint64_t v15 = __clz(__rbit64(v6)) | (v5 << 6);
    uint64_t v16 = v5;
LABEL_31:
    id v13 = *(id *)(*(void *)(v3 + 48) + 8 * v15);
    if (!v13) {
      goto LABEL_38;
    }
    goto LABEL_32;
  }
  int64_t v17 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v17 >= v28) {
      goto LABEL_38;
    }
    unint64_t v18 = *(void *)(v29 + 8 * v17);
    uint64_t v16 = v5 + 1;
    if (!v18)
    {
      uint64_t v16 = v5 + 2;
      if (v5 + 2 >= v28) {
        goto LABEL_38;
      }
      unint64_t v18 = *(void *)(v29 + 8 * v16);
      if (!v18)
      {
        uint64_t v16 = v5 + 3;
        if (v5 + 3 >= v28) {
          goto LABEL_38;
        }
        unint64_t v18 = *(void *)(v29 + 8 * v16);
        if (!v18)
        {
          uint64_t v16 = v5 + 4;
          if (v5 + 4 >= v28) {
            goto LABEL_38;
          }
          unint64_t v18 = *(void *)(v29 + 8 * v16);
          if (!v18)
          {
            uint64_t v19 = v5 + 5;
            while (v28 != v19)
            {
              unint64_t v18 = *(void *)(v29 + 8 * v19++);
              if (v18)
              {
                uint64_t v16 = v19 - 1;
                goto LABEL_30;
              }
            }
LABEL_38:
            sub_100022F94();

            return;
          }
        }
      }
    }
LABEL_30:
    uint64_t v14 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v16 << 6);
    goto LABEL_31;
  }
  __break(1u);
}

void sub_10001D730()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.angel.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = swift_slowAlloc();
    v11[0] = v0;
    uint64_t v7 = (uint8_t *)v6;
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v11[1] = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "~~~~ Could not close scene %@", v7, 0xCu);
    sub_10000B130((uint64_t *)&unk_1000453F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v0 = v11[0];
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v10 = [self sharedInstance];
  [v10 setLiveRecognitionActive:0];

  exit(0);
}

void sub_10001D95C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10001D9C4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v6) {
    return 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v5) {
    return 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v4) {
    return 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v3) {
    return 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (v2) {
    return 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

void sub_10001DC2C()
{
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive) & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if ((v6 & 1) == 0)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      if ((v5 & 1) == 0)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        swift_release();
        if ((v4 & 1) == 0)
        {
          swift_getKeyPath();
          swift_getKeyPath();
          swift_retain();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          swift_release();
          if ((v3 & 1) == 0)
          {
            swift_getKeyPath();
            swift_getKeyPath();
            swift_retain();
            static Published.subscript.getter();
            swift_release();
            swift_release();
            swift_release();
            if ((v2 & 1) == 0)
            {
              swift_getKeyPath();
              swift_getKeyPath();
              swift_retain();
              static Published.subscript.getter();
              swift_release();
              swift_release();
              swift_release();
              if ((v1 & 1) == 0) {
                sub_10001B75C();
              }
            }
          }
        }
      }
    }
  }
}

void sub_10001DEA4()
{
  uint64_t v0 = sub_10000B130(&qword_100044BE0);
  __chkstk_darwin(v0 - 8);
  char v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (id)Strong;
    id v5 = *(id *)(Strong + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService);
    char v6 = (void *)dispatch thunk of MAGARService.arSession.getter();

    if (v6 && (id v7 = [v6 currentFrame], v6, v7))
    {
      uint64_t v8 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v2, 1, 1, v8);
      type metadata accessor for MainActor();
      id v9 = v4;
      id v4 = v7;
      uint64_t v10 = static MainActor.shared.getter();
      id v11 = (void *)swift_allocObject();
      void v11[2] = v10;
      v11[3] = &protocol witness table for MainActor;
      v11[4] = v9;
      v11[5] = v4;
      sub_100004158((uint64_t)v2, (uint64_t)&unk_100044CC0, (uint64_t)v11);
      swift_release();
    }
    else
    {
      *((unsigned char *)v4 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption) = 0;
      sub_10001ACC8();
    }
  }
}

uint64_t sub_10001E064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  uint64_t v6 = type metadata accessor for Date();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[10] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[11] = v8;
  v5[12] = v7;
  return _swift_task_switch(sub_10001E158, v8, v7);
}

uint64_t sub_10001E158()
{
  uint64_t v1 = *(void **)(v0[5] + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager);
  v0[13] = v1;
  v1;
  char v2 = (void *)swift_task_alloc();
  v0[14] = v2;
  *char v2 = v0;
  v2[1] = sub_10001E210;
  uint64_t v3 = v0[6];
  return sub_1000093C8(v3);
}

uint64_t sub_10001E210()
{
  uint64_t v1 = *v0;
  char v2 = *(void **)(*v0 + 104);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 96);
  uint64_t v4 = *(void *)(v1 + 88);
  return _swift_task_switch(sub_10001E350, v4, v3);
}

uint64_t sub_10001E350()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[5];
  swift_release();
  *(unsigned char *)(v4 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption) = 0;
  Date.init()();
  uint64_t v5 = v4 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastDescribeSceneRequestTime;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(v5, v1, v2);
  swift_endAccess();
  sub_10001E430();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_10001E430()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v21 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v17 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for DispatchQoS();
  uint64_t v19 = *(void *)(v3 - 8);
  uint64_t v20 = v3;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchTime();
  uint64_t v18 = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v17 - v11;
  sub_10000BB08(0, (unint64_t *)&qword_100044218);
  id v13 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)();
  int64_t v17 = *(void (**)(char *, uint64_t))(v7 + 8);
  v17(v10, v6);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_100023478;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000A36C;
  aBlock[3] = &unk_10003E160;
  unint64_t v15 = _Block_copy(aBlock);
  swift_retain();
  static DispatchQoS.unspecified.getter();
  uint64_t v22 = &_swiftEmptyArrayStorage;
  sub_100022F9C((unint64_t *)&qword_100044C30, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10000B130(&qword_100044220);
  sub_10000B8B0();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v20);
  v17(v12, v18);
  swift_release();
  return swift_release();
}

uint64_t sub_10001E7EC(uint64_t a1, uint64_t a2)
{
  v2[17] = a1;
  v2[18] = a2;
  uint64_t v3 = type metadata accessor for Logger();
  v2[19] = v3;
  v2[20] = *(void *)(v3 - 8);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for Date();
  v2[23] = v4;
  v2[24] = *(void *)(v4 - 8);
  v2[25] = swift_task_alloc();
  v2[26] = swift_task_alloc();
  uint64_t v5 = type metadata accessor for MAGAREvent.AREventType();
  v2[27] = v5;
  v2[28] = *(void *)(v5 - 8);
  v2[29] = swift_task_alloc();
  type metadata accessor for MainActor();
  v2[30] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[31] = v7;
  v2[32] = v6;
  return _swift_task_switch(sub_10001E9B8, v7, v6);
}

uint64_t sub_10001E9B8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 264) = Strong;
  if (!Strong)
  {
    swift_release();
LABEL_32:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v56 = *(uint64_t (**)(void))(v0 + 8);
    return v56();
  }
  uint64_t v2 = (char *)Strong;
  uint64_t v4 = *(void *)(v0 + 224);
  uint64_t v3 = *(void *)(v0 + 232);
  uint64_t v5 = *(void *)(v0 + 216);
  MAGAREvent.eventType.getter();
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v3, v5);
  if (v6 != enum case for MAGAREvent.AREventType.didReceiveARFrame(_:))
  {
    if (v6 != enum case for MAGAREvent.AREventType.didReceiveARSpatialMappingPointClouds(_:))
    {
      if (v6 == enum case for MAGAREvent.AREventType.sessionWasInterrupted(_:))
      {
        swift_release();
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        swift_release();
        if (*(unsigned char *)(v0 + 394) == 1)
        {
          id v46 = *(id *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_objectUnderstandingService];
          dispatch thunk of MAGObjectUnderstandingService.stopService()();

          goto LABEL_32;
        }
      }
      else
      {
        if (v6 != enum case for MAGAREvent.AREventType.sessionInterruptionEnded(_:))
        {
          uint64_t v54 = *(void *)(v0 + 224);
          uint64_t v53 = *(void *)(v0 + 232);
          uint64_t v55 = *(void *)(v0 + 216);

          swift_release();
          (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v53, v55);
          goto LABEL_32;
        }
        swift_release();
        swift_getKeyPath();
        swift_getKeyPath();
        swift_retain();
        static Published.subscript.getter();
        swift_release();
        swift_release();
        swift_release();
        if (*(unsigned char *)(v0 + 400) == 1)
        {
          uint64_t v47 = *(char **)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager];
          uint64_t v48 = *(void **)&v47[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService];
          uint64_t v49 = *(void **)&v47[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_scene];
          uint64_t v50 = v47;
          id v51 = v48;
          id v52 = v49;
          dispatch thunk of MAGObjectUnderstandingService.startService(with:)();

          goto LABEL_32;
        }
      }

      goto LABEL_32;
    }
    uint64_t v42 = *(void *)(v0 + 232);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 224) + 96))(v42, *(void *)(v0 + 216));
    id v43 = *(void **)v42;
    *(void *)(v0 + 376) = *(void *)(v42 + 8);

    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (*(unsigned char *)(v0 + 392) != 1)
    {
      swift_bridgeObjectRelease();

      swift_release();
      goto LABEL_32;
    }
    uint64_t v44 = *(void **)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager];
    *(void *)(v0 + 384) = v44;
    id v45 = v44;
    uint64_t v29 = sub_1000202DC;
    uint64_t v30 = 0;
    uint64_t v31 = 0;
    return _swift_task_switch(v29, v30, v31);
  }
  uint64_t v7 = *(void *)(v0 + 232);
  (*(void (**)(uint64_t, void))(*(void *)(v0 + 224) + 96))(v7, *(void *)(v0 + 216));
  uint64_t v8 = *(void **)v7;
  uint64_t v9 = *(void **)(v7 + 8);
  *(void *)(v0 + 272) = v9;

  swift_retain();
  char v10 = dispatch thunk of MAGOutputEngine.isSpeaking.getter();
  swift_release();
  if ((v10 & 1) != 0
    || (swift_retain(),
        char v11 = dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.getter(),
        swift_release(),
        (v11 & 1) == 0))
  {

LABEL_21:
    swift_release();

    goto LABEL_32;
  }
  id v98 = v9;
  uint64_t v13 = *(void *)(v0 + 200);
  uint64_t v12 = *(void *)(v0 + 208);
  uint64_t v14 = *(void *)(v0 + 184);
  uint64_t v15 = *(void *)(v0 + 192);
  Date.init()();
  uint64_t v97 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
  uint64_t v16 = *(void *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager]
      + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_lastAnnouncementTime;
  swift_beginAccess();
  uint64_t v99 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v99(v13, v16, v14);
  Date.timeIntervalSince(_:)();
  double v18 = v17;
  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v19(v13, v14);
  v19(v12, v14);
  if (*(double *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelInactiveTimeOut] >= v18) {
    goto LABEL_29;
  }
  uint64_t v21 = *(void *)(v0 + 200);
  uint64_t v20 = *(void *)(v0 + 208);
  uint64_t v22 = *(void *)(v0 + 184);
  Date.init()();
  uint64_t v23 = &v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastPixelBufferCheckTime];
  swift_beginAccess();
  v99(v21, (uint64_t)v23, v22);
  Date.timeIntervalSince(_:)();
  double v25 = v24;
  v19(v21, v22);
  v19(v20, v22);
  if (v25 <= 1.0)
  {
LABEL_29:
    *(void *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_consecutiveSimilarFrames] = 0;
    goto LABEL_37;
  }
  id v26 = [v98 capturedImage];
  [*(id *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_luminanceManager] computeLuminanceFromPixelBuffer:v26];
  double v28 = v27;

  if (v28 < 1.0
    && vabdd_f64(v28, *(double *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastFramePixelValue]) < 0.5)
  {
    uint64_t v32 = *(void *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_consecutiveSimilarFrames];
    BOOL v33 = __OFADD__(v32, 1);
    uint64_t v34 = v32 + 1;
    if (!v33)
    {
      *(void *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_consecutiveSimilarFrames] = v34;
      if (v34 >= 901)
      {
        static Log.angel.getter();
        id v35 = Logger.logObject.getter();
        os_log_type_t v36 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v35, v36))
        {
          id v37 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v37 = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, v36, "Deactivating UIScene because the angel has not been used for an extended period of time", v37, 2u);
          swift_slowDealloc();
        }
        uint64_t v38 = *(void *)(v0 + 176);
        id v39 = v35;
        uint64_t v41 = *(void *)(v0 + 152);
        uint64_t v40 = *(void *)(v0 + 160);

        (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v41);
        sub_10001B75C();
      }
      goto LABEL_36;
    }
    __break(1u);
    return _swift_task_switch(v29, v30, v31);
  }
  *(void *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_consecutiveSimilarFrames] = 0;
LABEL_36:
  uint64_t v58 = *(void *)(v0 + 208);
  uint64_t v59 = *(void *)(v0 + 184);
  uint64_t v60 = *(void *)(v0 + 192);
  *(double *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastFramePixelValue] = v28;
  Date.init()();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 40))(v23, v58, v59);
  swift_endAccess();
LABEL_37:
  uint64_t v62 = *(void *)(v0 + 200);
  uint64_t v61 = *(void *)(v0 + 208);
  uint64_t v63 = *(void *)(v0 + 184);
  Date.init()();
  uint64_t v64 = &v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelLaunchTime];
  swift_beginAccess();
  v99(v62, (uint64_t)v64, v63);
  Date.timeIntervalSince(_:)();
  double v66 = v65;
  v19(v62, v63);
  v19(v61, v63);
  if (*(double *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_maxAngelRuntime] < v66)
  {
    static Log.angel.getter();
    uint64_t v67 = Logger.logObject.getter();
    os_log_type_t v68 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v67, v68))
    {
      uint64_t v69 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v69 = 0;
      _os_log_impl((void *)&_mh_execute_header, v67, v68, "Deactivating angel because it has been active for 30 minutes", v69, 2u);
      swift_slowDealloc();
    }
    uint64_t v70 = *(void *)(v0 + 160);
    uint64_t v71 = *(void *)(v0 + 168);
    uint64_t v72 = *(void *)(v0 + 152);

    (*(void (**)(uint64_t, uint64_t))(v70 + 8))(v71, v72);
    sub_10001B75C();
  }
  if (!*(void *)(*(void *)&v2[v97] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus))
  {
    [v98 estimatedLuminance];
    if (v73 == 0.0)
    {
      id v74 = *(id *)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_luminanceManager];
      id v75 = [v98 capturedImage];
      [v74 computeLuminanceFromPixelBuffer:v75];
      double v77 = v76;

      double v78 = v77 / 96.0;
    }
    else
    {
      [v98 estimatedLuminance];
      double v78 = v79;
    }
    if (v78 > 0.0)
    {
      static Detection.luminanceThreshold.getter();
      if (v78 < v80)
      {
        id v81 = *(id *)&v2[v97];
        sub_100009D38();

        *(void *)(*(void *)&v2[v97] + OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_torchStatus) = 1;
      }
    }
  }
  uint64_t v82 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_nextEligibleDetector;
  int v83 = v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_nextEligibleDetector];
  if (v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_nextEligibleDetector])
  {
    if (v83 == 1)
    {
LABEL_50:
      v2[v82] = 2;
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      if (*(unsigned char *)(v0 + 397))
      {
        uint64_t v84 = *(void **)&v2[v97];
        *(void *)(v0 + 296) = v84;
        v84;
        uint64_t v85 = (void *)swift_task_alloc();
        *(void *)(v0 + 304) = v85;
        void *v85 = v0;
        v85[1] = sub_10001FBF4;
        return sub_100005EF8((uint64_t)v98);
      }
      int v83 = v2[v82];
    }
LABEL_61:
    if (v83 == 2)
    {
      v2[v82] = 3;
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      if (*(unsigned char *)(v0 + 396) == 1)
      {
        uint64_t v88 = *(void **)&v2[v97];
        *(void *)(v0 + 312) = v88;
        v88;
        uint64_t v89 = (void *)swift_task_alloc();
        *(void *)(v0 + 320) = v89;
        *uint64_t v89 = v0;
        v89[1] = sub_10001FD34;
        return sub_100008168((uint64_t)v98);
      }
      int v83 = v2[v82];
    }
    if (v83 == 3)
    {
      swift_retain();
      char v90 = dispatch thunk of MAGOutputEngine.isSpeaking.getter();
      swift_release();
      if (v90)
      {

        swift_release();
        goto LABEL_32;
      }
      v2[v82] = 5;
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      if (*(unsigned char *)(v0 + 395))
      {
        uint64_t v91 = *(void **)&v2[v97];
        *(void *)(v0 + 328) = v91;
        v91;
        char v92 = (void *)swift_task_alloc();
        *(void *)(v0 + 336) = v92;
        *char v92 = v0;
        v92[1] = sub_10001FE74;
        return sub_1000093C8((uint64_t)v98);
      }
      int v83 = v2[v82];
    }
    if (v83 == 5)
    {
      v2[v82] = 4;
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      if (*(unsigned char *)(v0 + 401) == 1)
      {
        uint64_t v93 = *(void **)&v2[v97];
        *(void *)(v0 + 344) = v93;
        v93;
        uint64_t v94 = (void *)swift_task_alloc();
        *(void *)(v0 + 352) = v94;
        *uint64_t v94 = v0;
        v94[1] = sub_10001FFB4;
        return sub_100008F90((uint64_t)v98);
      }
      int v83 = v2[v82];
    }
    if (v83 == 4)
    {
      v2[v82] = 0;
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      swift_release();
      if (*(unsigned char *)(v0 + 393) == 1)
      {
        swift_retain();
        dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.setter();
        swift_release();
        uint64_t v95 = *(void **)&v2[v97];
        *(void *)(v0 + 360) = v95;
        v95;
        uint64_t v96 = (void *)swift_task_alloc();
        *(void *)(v0 + 368) = v96;
        *uint64_t v96 = v0;
        v96[1] = sub_10002019C;
        return sub_100004304((uint64_t)v98);
      }
    }

    goto LABEL_21;
  }
  v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_nextEligibleDetector] = 1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if ((*(unsigned char *)(v0 + 398) & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (*(unsigned char *)(v0 + 399) != 1)
    {
      int v83 = v2[v82];
      if (v83 == 1) {
        goto LABEL_50;
      }
      goto LABEL_61;
    }
  }
  uint64_t v86 = *(void **)&v2[v97];
  *(void *)(v0 + 280) = v86;
  v86;
  uint64_t v87 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v87;
  *uint64_t v87 = v0;
  v87[1] = sub_10001FAB4;
  return sub_1000051E4((uint64_t)v98);
}

uint64_t sub_10001FAB4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 280);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 256);
  uint64_t v4 = *(void *)(v1 + 248);
  return _swift_task_switch(sub_1000234A8, v4, v3);
}

uint64_t sub_10001FBF4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 296);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 256);
  uint64_t v4 = *(void *)(v1 + 248);
  return _swift_task_switch(sub_1000234A8, v4, v3);
}

uint64_t sub_10001FD34()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 312);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 256);
  uint64_t v4 = *(void *)(v1 + 248);
  return _swift_task_switch(sub_1000234A8, v4, v3);
}

uint64_t sub_10001FE74()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 328);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 256);
  uint64_t v4 = *(void *)(v1 + 248);
  return _swift_task_switch(sub_1000234A8, v4, v3);
}

uint64_t sub_10001FFB4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 344);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 256);
  uint64_t v4 = *(void *)(v1 + 248);
  return _swift_task_switch(sub_1000200F4, v4, v3);
}

uint64_t sub_1000200F4()
{
  uint64_t v1 = (void *)v0[33];
  uint64_t v2 = (void *)v0[34];
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(void))v0[1];
  return v3();
}

uint64_t sub_10002019C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 360);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 256);
  uint64_t v4 = *(void *)(v1 + 248);
  return _swift_task_switch(sub_1000234A8, v4, v3);
}

uint64_t sub_1000202DC()
{
  uint64_t v1 = (char *)v0[48];
  id v2 = *(id *)&v1[OBJC_IVAR____TtC14MagnifierAngel24MAGAngelDetectionManager_objectUnderstandingService];
  dispatch thunk of MAGObjectUnderstandingService.understandObjects(spatialMappingPointClouds:)();

  swift_bridgeObjectRelease();
  uint64_t v3 = v0[31];
  uint64_t v4 = v0[32];
  return _swift_task_switch(sub_100020370, v3, v4);
}

uint64_t sub_100020370()
{
  uint64_t v1 = *(void **)(v0 + 264);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100020414(uint64_t a1, uint64_t a2)
{
  v2[5] = a1;
  v2[6] = a2;
  uint64_t v3 = type metadata accessor for DetectedObject();
  v2[7] = v3;
  v2[8] = *(void *)(v3 - 8);
  v2[9] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for MAGOUEvent.MAGOUEventType();
  v2[10] = v4;
  v2[11] = *(void *)(v4 - 8);
  v2[12] = swift_task_alloc();
  type metadata accessor for MainActor();
  v2[13] = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  v2[14] = v6;
  v2[15] = v5;
  return _swift_task_switch(sub_100020564, v6, v5);
}

uint64_t sub_100020564()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 128) = Strong;
  if (!Strong)
  {
    swift_release();
LABEL_23:
    swift_task_dealloc();
    swift_task_dealloc();
    double v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28();
  }
  id v2 = (char *)Strong;
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 80);
  MAGOUEvent.eventType.getter();
  int v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v3, v5);
  if (v6 == enum case for MAGOUEvent.MAGOUEventType.didRecievePointerContactWithObject(_:))
  {
    uint64_t v7 = *(void *)(v0 + 96);
    uint64_t v8 = *(void *)(v0 + 72);
    uint64_t v9 = *(void *)(v0 + 56);
    uint64_t v10 = *(void *)(v0 + 64);
    (*(void (**)(uint64_t, void))(*(void *)(v0 + 88) + 96))(v7, *(void *)(v0 + 80));
    uint64_t v11 = *(void *)(v7 + *(int *)(sub_10000B130(&qword_100044C90) + 48));
    *(void *)(v0 + 136) = v11;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 32))(v8, v7, v9);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (*(unsigned char *)(v0 + 218) == 1)
    {
      uint64_t v12 = *(void **)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager];
      *(void *)(v0 + 144) = v12;
      v12;
      uint64_t v13 = (void *)swift_task_alloc();
      *(void *)(v0 + 152) = v13;
      *uint64_t v13 = v0;
      v13[1] = sub_100020AB8;
      uint64_t v14 = *(void *)(v0 + 72);
      return sub_1000071F8(v14, v11);
    }
    (*(void (**)(void, void))(*(void *)(v0 + 64) + 8))(*(void *)(v0 + 72), *(void *)(v0 + 56));
    goto LABEL_21;
  }
  if (v6 == enum case for MAGOUEvent.MAGOUEventType.didRecievePointerContactWithObjectGroup(_:))
  {
    uint64_t v16 = *(uint64_t **)(v0 + 96);
    (*(void (**)(uint64_t *, void))(*(void *)(v0 + 88) + 96))(v16, *(void *)(v0 + 80));
    uint64_t v17 = *v16;
    *(void *)(v0 + 160) = *v16;
    uint64_t v18 = v16[1];
    *(void *)(v0 + 168) = v18;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    swift_release();
    if (*(unsigned char *)(v0 + 217) != 1)
    {
      swift_release();
      swift_bridgeObjectRelease();
LABEL_22:
      swift_bridgeObjectRelease();

      goto LABEL_23;
    }
    uint64_t v19 = *(void **)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager];
    *(void *)(v0 + 176) = v19;
    v19;
    uint64_t v20 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v20;
    *uint64_t v20 = v0;
    v20[1] = sub_100020CBC;
    return sub_1000077AC(v17, v18);
  }
  if (v6 != enum case for MAGOUEvent.MAGOUEventType.didReceivePointerContactsWithFurnitureDetections(_:))
  {
    uint64_t v25 = *(void *)(v0 + 96);
    uint64_t v26 = *(void *)(v0 + 80);
    uint64_t v27 = *(void *)(v0 + 88);
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
    goto LABEL_23;
  }
  uint64_t v21 = *(uint64_t **)(v0 + 96);
  (*(void (**)(uint64_t *, void))(*(void *)(v0 + 88) + 96))(v21, *(void *)(v0 + 80));
  uint64_t v22 = *v21;
  *(void *)(v0 + 192) = v22;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_release();
  if (*(unsigned char *)(v0 + 216) != 1)
  {
LABEL_21:
    swift_release();
    goto LABEL_22;
  }
  uint64_t v23 = *(void **)&v2[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager];
  *(void *)(v0 + 200) = v23;
  v23;
  double v24 = (void *)swift_task_alloc();
  *(void *)(v0 + 208) = v24;
  *double v24 = v0;
  v24[1] = sub_100020EBC;
  return sub_100007C90(v22);
}

uint64_t sub_100020AB8()
{
  uint64_t v1 = *v0;
  id v2 = *(void **)(*v0 + 144);
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(void *)(v1 + 120);
  uint64_t v4 = *(void *)(v1 + 112);
  return _swift_task_switch(sub_100020C14, v4, v3);
}

uint64_t sub_100020C14()
{
  uint64_t v1 = (void *)v0[16];
  uint64_t v3 = v0[8];
  uint64_t v2 = v0[9];
  uint64_t v4 = v0[7];
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100020CBC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 176);
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(void *)(v1 + 120);
  uint64_t v4 = *(void *)(v1 + 112);
  return _swift_task_switch(sub_100020E3C, v4, v3);
}

uint64_t sub_100020E3C()
{
  uint64_t v1 = *(void **)(v0 + 128);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100020EBC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 200);
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(void *)(v1 + 120);
  uint64_t v4 = *(void *)(v1 + 112);
  return _swift_task_switch(sub_1000234AC, v4, v3);
}

void sub_100021074()
{
  uint64_t v0 = type metadata accessor for Date();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v2);
  uint64_t v6 = &v13[-v5];
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v8 = (char *)Strong;
    Date.init()();
    uint64_t v9 = &v8[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastDescribeSceneRequestTime];
    swift_beginAccess();
    (*(void (**)(unsigned char *, char *, uint64_t))(v1 + 16))(v4, v9, v0);
    Date.timeIntervalSince(_:)();
    double v11 = v10;
    uint64_t v12 = *(void (**)(unsigned char *, uint64_t))(v1 + 8);
    v12(v4, v0);
    v12(v6, v0);
    if (*(double *)&v8[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneRequestDeactivationDelay] <= v11) {
      sub_10001B75C();
    }
  }
}

uint64_t sub_100021214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000212AC, v6, v5);
}

uint64_t sub_1000212AC()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_isAlternateAppCameraRunning) = 1;
  id v2 = *(id *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService);
  uint64_t v3 = (void *)dispatch thunk of MAGARService.arSession.getter();

  [v3 pause];
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1000213E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  type metadata accessor for MainActor();
  *(void *)(v4 + 24) = static MainActor.shared.getter();
  uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10002147C, v6, v5);
}

uint64_t sub_10002147C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  *(unsigned char *)(v1 + OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_isAlternateAppCameraRunning) = 0;
  sub_10001BF68();
  id v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

id sub_100021580()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arService;
  uint64_t v4 = qword_100043EE8;
  uint64_t v5 = v0;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = (void *)qword_100046AE8;
  *(void *)&v1[v3] = qword_100046AE8;
  uint64_t v7 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_objectUnderstandingService;
  uint64_t v8 = qword_100043F00;
  id v9 = v6;
  if (v8 != -1) {
    swift_once();
  }
  double v10 = (void *)qword_100046B00;
  *(void *)&v5[v7] = qword_100046B00;
  uint64_t v11 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_arEventHandler;
  uint64_t v12 = qword_100043EE0;
  id v13 = v10;
  if (v12 != -1) {
    swift_once();
  }
  *(void *)&v5[v11] = qword_100046AE0;
  uint64_t v14 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_ouEventHandler;
  uint64_t v15 = qword_100043EF8;
  swift_retain();
  if (v15 != -1) {
    swift_once();
  }
  *(void *)&v5[v14] = qword_100046AF8;
  uint64_t v16 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_outputEngine;
  uint64_t v17 = qword_100043EB0;
  swift_retain();
  if (v17 != -1) {
    swift_once();
  }
  *(void *)&v5[v16] = qword_100046AB0;
  uint64_t v18 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelPreferences;
  uint64_t v19 = qword_100043F18;
  swift_retain();
  if (v19 != -1) {
    swift_once();
  }
  *(void *)&v5[v18] = qword_100046B18;
  uint64_t v20 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelDetectionManager;
  uint64_t v21 = qword_100043F30;
  swift_retain();
  if (v21 != -1) {
    swift_once();
  }
  uint64_t v22 = (void *)qword_100046B30;
  *(void *)&v5[v20] = qword_100046B30;
  uint64_t v23 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelProxy;
  uint64_t v24 = qword_100043F38;
  id v25 = v22;
  if (v24 != -1) {
    swift_once();
  }
  uint64_t v26 = (void *)qword_100046B38;
  *(void *)&v5[v23] = qword_100046B38;
  v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_startedProxy] = 0;
  v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_generatingImageCaption] = 0;
  v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneActive] = 0;
  id v27 = v26;
  Date.init()();
  Date.init()();
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_maxAngelRuntime] = 0x4082C00000000000;
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_angelInactiveTimeOut] = 0x404E000000000000;
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_lastFramePixelValue] = 0;
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_consecutiveSimilarFrames] = 0;
  uint64_t v28 = OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_luminanceManager;
  *(void *)&v5[v28] = [objc_allocWithZone((Class)ARFrameLuminanceManager) init];
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_figCameraViewFinder] = 0;
  v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_isAlternateAppCameraRunning] = 0;
  v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_nextEligibleDetector] = 0;
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneRequestFrameCheckDelay] = 0x3FD6666666666666;
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_sceneRequestDeactivationDelay] = 0x4024000000000000;
  Date.init()();
  uint64_t v29 = &v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_MagnifierSceneUIShowActivity];
  *(void *)uint64_t v29 = 0xD000000000000027;
  *((void *)v29 + 1) = 0x8000000100038FE0;
  uint64_t v30 = &v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_MagnifierAngelBundleID];
  *(void *)uint64_t v30 = 0xD000000000000026;
  *((void *)v30 + 1) = 0x8000000100039010;
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_clientRequestStreamMonitorTask] = 0;

  v32.receiver = v5;
  v32.super_class = ObjectType;
  return [super init];
}

uint64_t sub_100021B30()
{
  return type metadata accessor for MAGAngelAppDelegate();
}

uint64_t type metadata accessor for MAGAngelAppDelegate()
{
  uint64_t result = qword_100044BC8;
  if (!qword_100044BC8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100021B84()
{
  uint64_t result = type metadata accessor for Date();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for DetectionType(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DetectionType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFB) {
    goto LABEL_17;
  }
  if (a2 + 5 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 5) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 5;
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
      return (*a1 | (v4 << 8)) - 5;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 5;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 6;
  int v8 = v6 - 6;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DetectionType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 5 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 5) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFB) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFA)
  {
    unsigned int v6 = ((a2 - 251) >> 8) + 1;
    *uint64_t result = a2 + 5;
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
        JUMPOUT(0x100021DF8);
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
          *uint64_t result = a2 + 5;
        break;
    }
  }
  return result;
}

uint64_t sub_100021E20(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100021E28(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DetectionType()
{
  return &type metadata for DetectionType;
}

unint64_t sub_100021E44()
{
  unint64_t result = qword_100044BD8;
  if (!qword_100044BD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044BD8);
  }
  return result;
}

uint64_t sub_100021E98()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_10000B130(&qword_100044BE0);
  __chkstk_darwin(v2 - 8);
  unsigned int v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  int v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.angel.getter();
  id v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v23 = v1;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v25 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v24 = sub_10002D340(0xD00000000000002DLL, 0x80000001000390F0, &v25);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    unint64_t v1 = v23;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
  type metadata accessor for MainActor();
  uint64_t v14 = v1;
  uint64_t v15 = static MainActor.shared.getter();
  uint64_t v16 = (void *)swift_allocObject();
  v16[2] = v15;
  v16[3] = &protocol witness table for MainActor;
  v16[4] = v14;
  *(void *)&v14[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelAppDelegate_clientRequestStreamMonitorTask] = sub_100004158((uint64_t)v4, (uint64_t)&unk_100044C68, (uint64_t)v16);
  swift_release();
  uint64_t v17 = v14;
  swift_retain();
  id v18 = [v17 description];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  MAGAREventHandler.register(_:asActionHandler:)();
  swift_release_n();
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v19 = v17;
  swift_retain();
  id v20 = [v19 description];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  MAGOUEventHandler.register(_:handler:)();
  swift_release_n();
  swift_bridgeObjectRelease();
  swift_release();
  return 1;
}

id sub_1000224BC(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Log.angel.getter();
  id v6 = a1;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  p_name = &ActivityStore.name;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v24 = v2;
    uint64_t v11 = v10;
    uint64_t v23 = swift_slowAlloc();
    uint64_t v26 = v23;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v25 = sub_10002D340(0xD000000000000032, 0x8000000100039090, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v11 + 12) = 2080;
    v22[1] = v11 + 14;
    id v12 = [v6 role];
    uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = v3;
    unint64_t v16 = v15;

    p_name = (char **)(&ActivityStore + 24);
    uint64_t v25 = sub_10002D340(v13, v16, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s role=%s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v14 + 8))(v5, v24);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  id v17 = [v6 p_name[403]];
  id v18 = objc_allocWithZone((Class)UISceneConfiguration);
  NSString v19 = String._bridgeToObjectiveC()();
  id v20 = [v18 initWithName:v19 sessionRole:v17];

  return v20;
}

void sub_1000227BC(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v54 = a3;
  uint64_t v7 = v4;
  uint64_t v9 = sub_10000B130(&qword_100044BE0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  unint64_t v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  id v18 = (char *)&v44 - v17;
  if (a1)
  {
    uint64_t v50 = a2;
    [a1 clientAuditToken];
    long long v52 = v56;
    long long v53 = v55;
    id v19 = objc_allocWithZone((Class)BSAuditToken);
    long long v55 = v53;
    long long v56 = v52;
    id v20 = [v19 initWithAuditToken:&v55];
    id v21 = [v20 pid];
    uint64_t v22 = self;
    LODWORD(v53) = v21;
    id v23 = [v22 identifierWithPid:v21];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v51 = v13;
      *(void *)&long long v52 = v12;
      uint64_t v25 = self;
      *(void *)&long long v55 = 0;
      uint64_t v26 = v24;
      id v27 = [v25 handleForIdentifier:v26 error:&v55];
      if (v27)
      {
        uint64_t v28 = v27;
        id v49 = v20;
        id v29 = (id)v55;

        static Log.angel.getter();
        id v30 = v28;
        uint64_t v31 = Logger.logObject.getter();
        os_log_type_t v32 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v31, v32))
        {
          os_log_t v46 = v31;
          uint64_t v33 = swift_slowAlloc();
          uint64_t v48 = a4;
          uint64_t v34 = (uint8_t *)v33;
          id v45 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v34 = 138412290;
          uint64_t v47 = v7;
          *(void *)&long long v55 = v30;
          id v35 = v30;
          uint64_t v7 = v47;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *id v45 = v28;

          os_log_t v36 = v46;
          _os_log_impl((void *)&_mh_execute_header, v46, v32, v50, v34, 0xCu);
          sub_10000B130((uint64_t *)&unk_1000453F0);
          swift_arrayDestroy();
          swift_slowDealloc();
          a4 = v48;
          swift_slowDealloc();
        }
        else
        {

          uint64_t v26 = v31;
        }
        unint64_t v16 = v18;
        id v20 = v49;
      }
      else
      {
        id v37 = (id)v55;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        static Log.angel.getter();
        uint64_t v26 = Logger.logObject.getter();
        os_log_type_t v38 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v26, v38))
        {
          id v39 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)id v39 = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, v38, "Could not find viewfinder process handle", v39, 2u);
          swift_slowDealloc();
        }
        swift_errorRelease();
      }

      (*(void (**)(char *, void))(v51 + 8))(v16, v52);
    }
    if (v53 != getpid())
    {
      uint64_t v40 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v40 - 8) + 56))(v11, 1, 1, v40);
      type metadata accessor for MainActor();
      id v41 = v7;
      uint64_t v42 = static MainActor.shared.getter();
      id v43 = (void *)swift_allocObject();
      v43[2] = v42;
      v43[3] = &protocol witness table for MainActor;
      v43[4] = v41;
      sub_100004158((uint64_t)v11, a4, (uint64_t)v43);
      swift_release();
    }
  }
}

uint64_t sub_100022CC0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000BED0;
  return sub_1000213E4(a1, v4, v5, v6);
}

uint64_t sub_100022DA0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000BED0;
  return sub_100021214(a1, v4, v5, v6);
}

uint64_t sub_100022E60(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000B5B4;
  return sub_10001C72C(a1, v4, v5, v6);
}

uint64_t sub_100022F14(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100022F24()
{
  return swift_release();
}

unint64_t sub_100022F2C()
{
  unint64_t result = qword_100044C50;
  if (!qword_100044C50)
  {
    sub_10000BB08(255, &qword_100044C48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044C50);
  }
  return result;
}

uint64_t sub_100022F94()
{
  return swift_release();
}

uint64_t sub_100022F9C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100022FE8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000BED0;
  return sub_100017BA0(a1, v4, v5, v6);
}

uint64_t sub_10002309C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000230D4(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000B5B4;
  return sub_10001E7EC(a1, v1);
}

uint64_t sub_10002316C(uint64_t a1)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000BED0;
  return sub_100020414(a1, v1);
}

uint64_t sub_100023204(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MAGAngelClientRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100023268(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for MAGAngelClientRequest(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000232CC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for MAGAngelClientRequest(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100023328()
{
}

uint64_t sub_100023330()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100023368()
{
  return sub_10001C2EC(*(void **)(v0 + 16));
}

uint64_t sub_100023370()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000233B8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  os_log_type_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *os_log_type_t v8 = v2;
  v8[1] = sub_10000BED0;
  return sub_10001E064(a1, v4, v5, v7, v6);
}

void sub_100023478()
{
}

void sub_1000236BC()
{
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for MAGAngelSystemApertureViewController();
  [super viewDidLoad];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView];
  if (v1)
  {
    String.localized.getter();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v1 setAccessibilityLabel:v2];

    [v1 setTintColor:*(void *)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor]];
    id v3 = v1;
    id v4 = [v0 view];
    if (!v4)
    {
      __break(1u);
      goto LABEL_9;
    }
    uint64_t v5 = v4;
    [v4 addSubview:v3];
  }
  uint64_t v6 = *(void **)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView];
  if (!v6)
  {
LABEL_7:
    sub_1000238B8();
    return;
  }
  String.localized.getter();
  NSString v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v6 setAccessibilityLabel:v7];

  [v6 setTintColor:*(void *)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor]];
  id v8 = v6;
  id v9 = [v0 view];
  if (v9)
  {
    uint64_t v10 = v9;
    [v9 addSubview:v8];

    goto LABEL_7;
  }
LABEL_9:
  __break(1u);
}

void sub_1000238B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UIButton.Configuration();
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)&v170 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v5 = objc_allocWithZone((Class)type metadata accessor for MAGAngelLeadingView());
  id v6 = sub_10002589C(0);
  uint64_t v7 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView;
  id v8 = *(void **)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView];
  *(void *)&v0[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView] = v6;

  [*(id *)&v0[v7] setHidden:1];
  [*(id *)&v0[v7] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = *(id *)&v0[v7];
  id v10 = [v0 view];
  if (!v10)
  {
    __break(1u);
    goto LABEL_33;
  }
  objc_super v11 = v10;
  [v10 frame];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  [v9 setFrame:v13, v15, v17, v19];
  id v20 = *(id *)&v1[v7];
  String.localized.getter();
  NSString v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v20 setAccessibilityLabel:v21];

  uint64_t v22 = *(void **)&v1[v7];
  uint64_t v171 = *(void *)&v1[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor];
  [v22 setTintColor:];
  id v23 = [v1 view];
  if (!v23)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  uint64_t v24 = v23;
  [v23 addSubview:*(void *)&v1[v7]];

  uint64_t v175 = sub_10000B130(&qword_100044EE8);
  uint64_t v25 = swift_allocObject();
  long long v172 = xmmword_100033530;
  *(_OWORD *)(v25 + 16) = xmmword_100033530;
  id v26 = [*(id *)&v1[v7] leadingAnchor];
  id v27 = [v1 view];
  if (!v27)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  uint64_t v28 = v27;
  id v29 = [v27 leadingAnchor:v4];

  id v30 = [v26 constraintEqualToAnchor:v29 constant:30.0];
  *(void *)(v25 + 32) = v30;
  id v31 = [*(id *)&v1[v7] topAnchor];
  id v32 = [v1 view];
  if (!v32)
  {
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  uint64_t v33 = v32;
  uint64_t v34 = self;
  id v35 = [v33 SBUISA_systemApertureObstructedAreaLayoutGuide];

  id v36 = [v35 bottomAnchor];
  id v37 = [v31 constraintEqualToAnchor:v36];

  *(void *)(v25 + 40) = v37;
  uint64_t v176 = v25;
  specialized Array._endMutation()();
  uint64_t v173 = sub_10000BB08(0, &qword_100044EF0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v174 = v34;
  [v34 activateConstraints:isa];

  uint64_t v39 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel;
  [*(id *)&v1[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v40 = *(id *)&v1[v39];
  String.localized.getter();
  NSString v41 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v40 setText:v41];

  [*(id *)&v1[v39] setTextColor:v171];
  [*(id *)&v1[v39] setHidden:1];
  [*(id *)&v1[v39] sizeToFit];
  uint64_t v42 = *(void **)&v1[v39];
  id v43 = objc_allocWithZone((Class)UIFontMetrics);
  id v44 = v42;
  id v45 = [v43 initForTextStyle:UIFontTextStyleBody];
  os_log_t v46 = self;
  id v47 = [v46 preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
  [v47 pointSize];
  if (v48 <= 20.0) {
    double v49 = v48;
  }
  else {
    double v49 = 20.0;
  }
  uint64_t v50 = self;
  id v51 = [v50 systemFontOfSize:v49 weight:UIFontWeightMedium];
  id v52 = [v45 scaledFontForFont:v51];

  [v44 setFont:v52];
  [*(id *)&v1[v39] setAdjustsFontForContentSizeCategory:1];
  [*(id *)&v1[v39] setUserInteractionEnabled:0];
  id v53 = [v1 view];
  if (!v53) {
    goto LABEL_36;
  }
  uint64_t v54 = v53;
  [v53 addSubview:*(void *)&v1[v39]];

  uint64_t v55 = swift_allocObject();
  *(_OWORD *)(v55 + 16) = v172;
  id v56 = [*(id *)&v1[v39] topAnchor];
  id v57 = [v1 view];
  if (!v57)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  uint64_t v58 = v57;
  id v59 = [v57 SBUISA_systemApertureObstructedAreaLayoutGuide];

  id v60 = [v59 bottomAnchor];
  id v61 = [v56 constraintEqualToAnchor:v60];

  *(void *)(v55 + 32) = v61;
  id v62 = [*(id *)&v1[v39] leadingAnchor];
  id v63 = [v1 view];
  if (!v63)
  {
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  uint64_t v64 = v63;
  id v65 = [v63 leadingAnchor];

  id v66 = [v62 constraintEqualToAnchor:v65 constant:72.0];
  *(void *)(v55 + 40) = v66;
  uint64_t v176 = v55;
  specialized Array._endMutation()();
  Class v67 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v174 activateConstraints:v67];

  uint64_t v68 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel;
  [*(id *)&v1[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v69 = *(id *)&v1[v68];
  String.localized.getter();
  NSString v70 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v69 setText:v70];

  uint64_t v71 = *(void **)&v1[v68];
  uint64_t v72 = self;
  id v73 = v71;
  id v74 = [v72 grayColor];
  [v73 setTextColor:v74];

  [*(id *)&v1[v68] setHidden:1];
  [*(id *)&v1[v68] sizeToFit];
  id v75 = *(void **)&v1[v68];
  id v76 = objc_allocWithZone((Class)UIFontMetrics);
  id v77 = v75;
  id v78 = [v76 initForTextStyle:UIFontTextStyleFootnote];
  id v79 = [v46 preferredFontDescriptorWithTextStyle:UIFontTextStyleFootnote];
  [v79 pointSize];
  if (v80 > 20.0) {
    double v80 = 20.0;
  }
  id v81 = [v50 systemFontOfSize:v80 weight:UIFontWeightMedium];
  id v82 = [v78 scaledFontForFont:v81];

  [v77 setFont:v82];
  [*(id *)&v1[v68] setAdjustsFontForContentSizeCategory:1];
  [*(id *)&v1[v68] setUserInteractionEnabled:0];
  id v83 = [v1 view];
  if (!v83) {
    goto LABEL_39;
  }
  uint64_t v84 = v83;
  [v83 addSubview:*(void *)&v1[v68]];

  uint64_t v85 = swift_allocObject();
  *(_OWORD *)(v85 + 16) = v172;
  id v86 = [*(id *)&v1[v68] leadingAnchor];
  id v87 = [v1 view];
  if (!v87)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v88 = v87;
  id v89 = [v87 leadingAnchor];

  id v90 = [v86 constraintEqualToAnchor:v89 constant:72.0];
  *(void *)(v85 + 32) = v90;
  id v91 = [*(id *)&v1[v68] topAnchor];
  id v92 = [*(id *)&v1[v39] bottomAnchor];
  id v93 = [v91 constraintEqualToAnchor:v92 constant:2.0];

  *(void *)(v85 + 40) = v93;
  uint64_t v176 = v85;
  specialized Array._endMutation()();
  Class v94 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v174 activateConstraints:v94];

  uint64_t v95 = *(void **)&v1[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingCustomView];
  [v95 setTintColor:v171];
  [v95 setHidden:1];
  [v95 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v96 = [v1 view];
  if (!v96)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v97 = v96;
  [v96 frame];
  double v99 = v98;
  double v101 = v100;
  double v103 = v102;
  double v105 = v104;

  [v95 setFrame:v99, v101, v103, v105];
  String.localized.getter();
  NSString v106 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v95 setAccessibilityLabel:v106];

  id v107 = [v1 view];
  if (!v107)
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  long long v108 = v107;
  [v107 addSubview:v95];

  id v109 = [v1 view];
  if (!v109)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  long long v110 = v109;
  [v109 bringSubviewToFront:v95];

  uint64_t v111 = swift_allocObject();
  *(_OWORD *)(v111 + 16) = v172;
  id v112 = [v95 trailingAnchor];
  id v113 = [v1 view];
  if (!v113)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  long long v114 = v113;
  id v115 = [v113 trailingAnchor];

  id v116 = [v112 constraintEqualToAnchor:v115 constant:-34.0];
  *(void *)(v111 + 32) = v116;
  id v117 = [v95 topAnchor];
  id v118 = [v1 view];
  if (!v118)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v119 = v118;
  id v120 = [v118 topAnchor];

  id v121 = [v117 constraintEqualToAnchor:v120 constant:50.0];
  *(void *)(v111 + 40) = v121;
  uint64_t v176 = v111;
  specialized Array._endMutation()();
  Class v122 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v174 activateConstraints:v122];

  uint64_t v123 = self;
  id v124 = [self traitCollectionWithLegibilityWeight:1];
  id v125 = [v123 sbui_systemApertureTextButtonConfigurationCompatibleWithTraitCollection:v124];

  uint64_t v126 = v171;
  [v125 setBaseBackgroundColor:v171];
  [v125 setBaseForegroundColor:v126];
  String.localized.getter();
  NSString v127 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v125 setTitle:v127];

  sub_10000BB08(0, &qword_100044EF8);
  static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)();
  sub_10000BB08(0, (unint64_t *)&unk_100044F00);
  *(void *)(swift_allocObject() + 16) = v1;
  uint64_t v128 = v1;
  UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
  uint64_t v129 = UIButton.init(configuration:primaryAction:)();
  uint64_t v130 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton;
  v131 = *(void **)&v128[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton];
  *(void *)&v128[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton] = v129;

  uint64_t v132 = *(void **)&v128[v130];
  if (!v132) {
    goto LABEL_31;
  }
  [v132 setHidden:1];
  char v133 = *(void **)&v128[v130];
  if (!v133) {
    goto LABEL_31;
  }
  [v133 setTranslatesAutoresizingMaskIntoConstraints:0];
  v134 = *(void **)&v128[v130];
  if (!v134) {
    goto LABEL_31;
  }
  id v135 = v134;
  id v136 = [v128 view];
  if (!v136) {
    goto LABEL_46;
  }
  uint64_t v137 = v136;
  [v136 frame];
  double v139 = v138;
  double v141 = v140;
  double v143 = v142;
  double v145 = v144;

  [v135 setFrame:v139, v141, v143, v145];
  uint64_t v146 = *(void **)&v128[v130];
  if (!v146) {
    goto LABEL_31;
  }
  id v147 = v146;
  String.localized.getter();
  NSString v148 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v147 setAccessibilityLabel:v148];

  v149 = *(void **)&v128[v130];
  if (!v149) {
    goto LABEL_31;
  }
  id v150 = v149;
  id v151 = [v128 view];
  if (!v151) {
    goto LABEL_47;
  }
  v152 = v151;
  [v151 addSubview:v150];

  uint64_t v153 = swift_allocObject();
  *(_OWORD *)(v153 + 16) = xmmword_100033540;
  id v154 = [v150 leadingAnchor];
  id v155 = [v128 view];
  if (!v155)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  v156 = v155;
  id v157 = [v155 leadingAnchor];

  id v158 = [v154 constraintEqualToAnchor:v157 constant:20.0];
  *(void *)(v153 + 32) = v158;
  id v159 = [v150 trailingAnchor];
  id v160 = [v128 view];
  if (!v160)
  {
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  v161 = v160;
  id v162 = [v160 trailingAnchor];

  id v163 = [v159 constraintEqualToAnchor:v162 constant:-20.0];
  *(void *)(v153 + 40) = v163;
  id v164 = [v150 bottomAnchor];
  id v165 = [v128 view];
  if (v165)
  {
    v166 = v165;
    id v167 = [v165 bottomAnchor];

    id v168 = [v164 constraintEqualToAnchor:v167 constant:-20.0];
    *(void *)(v153 + 48) = v168;
    uint64_t v176 = v153;
    specialized Array._endMutation()();
    Class v169 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v174 activateConstraints:v169];

LABEL_31:
    return;
  }
LABEL_50:
  __break(1u);
}

uint64_t sub_100024B4C()
{
  uint64_t v0 = sub_10000B130(&qword_1000446B0);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for MAGAngelClientRequest(0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)&v12 - v8;
  uint64_t v10 = type metadata accessor for MAGSimulatedEvent();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 2, 12, v10);
  sub_100023268((uint64_t)v9, (uint64_t)v7);
  swift_retain();
  sub_10000B130((uint64_t *)&unk_100044F10);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  swift_release();
  return sub_1000232CC((uint64_t)v9);
}

void sub_100024D18(void *a1, double a2, double a3)
{
  v17.receiver = v3;
  v17.super_class = (Class)type metadata accessor for MAGAngelSystemApertureViewController();
  [super viewWillTransitionToSize:a1 withTransitionCoordinator:a2 a3];
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v3;
  double v15 = sub_100026440;
  uint64_t v16 = v7;
  objc_super v11 = _NSConcreteStackBlock;
  uint64_t v12 = 1107296256;
  double v13 = sub_1000250A4;
  double v14 = &unk_10003E200;
  uint64_t v8 = _Block_copy(&v11);
  id v9 = v3;
  swift_release();
  double v15 = (void (*)(uint64_t))MAGAngelContentState.hash(into:);
  uint64_t v16 = 0;
  objc_super v11 = _NSConcreteStackBlock;
  uint64_t v12 = 1107296256;
  double v13 = sub_1000250A4;
  double v14 = &unk_10003E228;
  uint64_t v10 = _Block_copy(&v11);
  [a1 animateAlongsideTransition:v8 completion:v10];
  _Block_release(v10);
  _Block_release(v8);
}

void sub_100024E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_activeLayoutMode);
  switch(v3)
  {
    case 4:
      uint64_t v5 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView);
      if (v5) {
        [v5 setHidden:1];
      }
      uint64_t v6 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingView);
      if (v6) {
        [v6 setHidden:1];
      }
      uint64_t v7 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView);
      if (v7) {
        [v7 setHidden:1];
      }
      [*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView) setHidden:0];
      [*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingCustomView) setHidden:0];
      uint64_t v8 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton);
      if (v8) {
        [v8 setHidden:0];
      }
      [*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel) setHidden:0];
      uint64_t v4 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel);
      break;
    case 3:
      uint64_t v10 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView);
      if (v10) {
        [v10 setHidden:0];
      }
      objc_super v11 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingView);
      if (v11) {
        [v11 setHidden:0];
      }
      [*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView) setHidden:1];
      [*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingCustomView) setHidden:1];
      uint64_t v12 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton);
      if (v12) {
        [v12 setHidden:1];
      }
      [*(id *)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel) setHidden:1];
      uint64_t v4 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel);
      uint64_t v9 = 1;
      goto LABEL_23;
    case 2:
      uint64_t v4 = *(void **)(a2 + OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView);
      if (!v4) {
        return;
      }
      break;
    default:
      return;
  }
  uint64_t v9 = 0;
LABEL_23:

  [v4 setHidden:v9];
}

uint64_t sub_1000250A4(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

id sub_10002518C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_angelPreferences;
  uint64_t v7 = qword_100043F18;
  uint64_t v8 = v3;
  if (v7 != -1) {
    swift_once();
  }
  *(void *)&v3[v6] = qword_100046B18;
  uint64_t v9 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_clientRequestStream;
  uint64_t v10 = qword_100043E98;
  swift_retain();
  if (v10 != -1) {
    swift_once();
  }
  *(void *)&v8[v9] = qword_100046A98;
  *(void *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_activeLayoutMode] = 0;
  *(void *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_contentRole] = 2;
  *(void *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredLayoutMode] = 3;
  *(void *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_maximumLayoutMode] = 4;
  objc_super v11 = (void *)SBUISystemApertureElementIdentifierUnknown;
  *(void *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_elementIdentifier] = SBUISystemApertureElementIdentifierUnknown;
  uint64_t v12 = &v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_associatedAppBundleIdentifier];
  *(void *)uint64_t v12 = 0;
  *((void *)v12 + 1) = 0;
  uint64_t v13 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredHeightForBottomSafeArea;
  swift_retain();
  id v14 = v11;
  *(double *)&v8[v13] = sub_100026004();
  uint64_t v15 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView;
  uint64_t v16 = (objc_class *)type metadata accessor for MAGAngelLeadingView();
  id v17 = objc_allocWithZone(v16);
  *(void *)&v8[v15] = sub_10002589C(1);
  uint64_t v18 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingView;
  *(void *)&v8[v18] = [objc_allocWithZone((Class)type metadata accessor for MAGAngelTrailingView()) init];
  uint64_t v19 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView;
  id v20 = objc_allocWithZone(v16);
  *(void *)&v8[v19] = sub_10002589C(1);
  uint64_t v21 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView;
  *(void *)&v8[v21] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v22 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingCustomView;
  *(void *)&v8[v22] = [objc_allocWithZone((Class)type metadata accessor for MAGAngelCustomTrailingView()) init];
  uint64_t v23 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel;
  *(void *)&v8[v23] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v24 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel;
  *(void *)&v8[v24] = [objc_allocWithZone((Class)UILabel) init];
  *(void *)&v8[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton] = 0;
  uint64_t v25 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor;
  *(void *)&v8[v25] = [self systemYellowColor];

  if (a2)
  {
    NSString v26 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v26 = 0;
  }
  v29.receiver = v8;
  v29.super_class = (Class)type metadata accessor for MAGAngelSystemApertureViewController();
  id v27 = [super initWithNibName:v26 bundle:a3];

  return v27;
}

id sub_1000254B0(void *a1)
{
  uint64_t v3 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_angelPreferences;
  uint64_t v4 = qword_100043F18;
  uint64_t v5 = v1;
  if (v4 != -1) {
    swift_once();
  }
  *(void *)&v1[v3] = qword_100046B18;
  uint64_t v6 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_clientRequestStream;
  uint64_t v7 = qword_100043E98;
  swift_retain();
  if (v7 != -1) {
    swift_once();
  }
  *(void *)&v5[v6] = qword_100046A98;
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_activeLayoutMode] = 0;
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_contentRole] = 2;
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredLayoutMode] = 3;
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_maximumLayoutMode] = 4;
  uint64_t v8 = (void *)SBUISystemApertureElementIdentifierUnknown;
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_elementIdentifier] = SBUISystemApertureElementIdentifierUnknown;
  uint64_t v9 = &v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_associatedAppBundleIdentifier];
  *(void *)uint64_t v9 = 0;
  *((void *)v9 + 1) = 0;
  uint64_t v10 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_preferredHeightForBottomSafeArea;
  swift_retain();
  id v11 = v8;
  *(double *)&v5[v10] = sub_100026004();
  uint64_t v12 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingView;
  uint64_t v13 = (objc_class *)type metadata accessor for MAGAngelLeadingView();
  id v14 = objc_allocWithZone(v13);
  *(void *)&v5[v12] = sub_10002589C(1);
  uint64_t v15 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingView;
  *(void *)&v5[v15] = [objc_allocWithZone((Class)type metadata accessor for MAGAngelTrailingView()) init];
  uint64_t v16 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_minimalView;
  id v17 = objc_allocWithZone(v13);
  *(void *)&v5[v16] = sub_10002589C(1);
  uint64_t v18 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_leadingCustomView;
  *(void *)&v5[v18] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v19 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_trailingCustomView;
  *(void *)&v5[v19] = [objc_allocWithZone((Class)type metadata accessor for MAGAngelCustomTrailingView()) init];
  uint64_t v20 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelLabel;
  *(void *)&v5[v20] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v21 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_magAngelSubtitleLabel;
  *(void *)&v5[v21] = [objc_allocWithZone((Class)UILabel) init];
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_stopButton] = 0;
  uint64_t v22 = OBJC_IVAR____TtC14MagnifierAngel36MAGAngelSystemApertureViewController_keyColor;
  *(void *)&v5[v22] = [self systemYellowColor];

  v25.receiver = v5;
  v25.super_class = (Class)type metadata accessor for MAGAngelSystemApertureViewController();
  id v23 = [super initWithCoder:a1];

  return v23;
}

id sub_100025760()
{
  return sub_100025F68(type metadata accessor for MAGAngelSystemApertureViewController);
}

uint64_t type metadata accessor for MAGAngelSystemApertureViewController()
{
  return self;
}

id sub_10002589C(char a1)
{
  uint64_t v3 = (double *)&v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelLeadingView_compressedElementSize];
  double v4 = MAGAngelContentState.hash(into:)(19.0, 19.0);
  double v6 = v5;
  *uint64_t v3 = v4;
  v3[1] = v5;
  uint64_t v7 = (double *)&v1[OBJC_IVAR____TtC14MagnifierAngel19MAGAngelLeadingView_customElementSize];
  double v8 = MAGAngelContentState.hash(into:)(37.7, 37.7);
  *uint64_t v7 = v8;
  v7[1] = v9;
  if ((a1 & 1) == 0)
  {
    double v4 = v8;
    double v6 = v9;
  }
  v17.receiver = v1;
  v17.super_class = (Class)type metadata accessor for MAGAngelLeadingView();
  id v10 = [super initWithFrame:0.0, 0.0, v4, v6];
  NSString v11 = String._bridgeToObjectiveC()();
  id v12 = [self systemImageNamed:v11];

  if (v12)
  {
    id v13 = [v12 imageWithRenderingMode:2];
  }
  else
  {
    id v13 = 0;
  }
  id v14 = [objc_allocWithZone((Class)UIImageView) initWithImage:v13];
  [v14 setFrame:0.0, 0.0, v4, v6];
  id v15 = [self systemYellowColor];
  [v14 setTintColor:v15];

  [v10 addSubview:v14];
  return v10;
}

id sub_100025B48()
{
  return sub_100025F68(type metadata accessor for MAGAngelLeadingView);
}

uint64_t type metadata accessor for MAGAngelLeadingView()
{
  return self;
}

char *sub_100025B84()
{
  uint64_t v1 = (double *)&v0[OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize];
  double v2 = MAGAngelContentState.hash(into:)(19.0, 19.0);
  double v4 = v3;
  double *v1 = v2;
  v1[1] = v3;
  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for MAGAngelTrailingView();
  double v5 = (char *)objc_msgSendSuper2(&v12, "initWithFrame:", 0.0, 0.0, v2, v4);
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [self systemImageNamed:v6];

  if (v7)
  {
    id v8 = [v7 imageWithRenderingMode:2];
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [objc_allocWithZone((Class)UIImageView) initWithImage:v8];
  [v9 setFrame:0.0, 0.0, *(double *)&v5[OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize], *(double *)&v5[OBJC_IVAR____TtC14MagnifierAngel20MAGAngelTrailingView_compressedElementSize + 8]];
  id v10 = [self systemYellowColor];
  [v9 setTintColor:v10];

  [v5 addSubview:v9];
  return v5;
}

id sub_100025DF4()
{
  return sub_100025F68(type metadata accessor for MAGAngelTrailingView);
}

uint64_t type metadata accessor for MAGAngelTrailingView()
{
  return self;
}

void sub_100025F24()
{
}

id sub_100025F50()
{
  return sub_100025F68(type metadata accessor for MAGAngelCustomTrailingView);
}

id sub_100025F68(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return [super dealloc];
}

uint64_t type metadata accessor for MAGAngelCustomTrailingView()
{
  return self;
}

uint64_t sub_100025FC4()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100025FFC()
{
  return sub_100024B4C();
}

double sub_100026004()
{
  id v0 = [self sharedApplication];
  id v1 = [v0 preferredContentSizeCategory];

  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = v3;
  if (v2 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v4 == v5) {
    goto LABEL_13;
  }
  char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
LABEL_14:

    *(double *)&uint64_t v18 = 160.0;
    return *(double *)&v18;
  }
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  if (v8 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v10 == v11)
  {
LABEL_13:
    swift_bridgeObjectRelease_n();
    goto LABEL_14;
  }
  char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13) {
    goto LABEL_14;
  }
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  if (v14 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v16 == v17) {
    goto LABEL_13;
  }
  char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v20) {
    goto LABEL_14;
  }
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v23 = v22;
  if (v21 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v23 == v24) {
    goto LABEL_13;
  }
  char v25 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25) {
    goto LABEL_14;
  }
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = v27;
  if (v26 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v28 == v29)
  {
    swift_bridgeObjectRelease_n();
LABEL_24:

    uint64_t v31 = 0x200000000000;
LABEL_25:
    uint64_t v18 = v31 & 0xFFFFFFFFFFFFLL | 0x4062000000000000;
    return *(double *)&v18;
  }
  char v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v30) {
    goto LABEL_24;
  }
  uint64_t v32 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v34 = v33;
  if (v32 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v34 == v35)
  {
    swift_bridgeObjectRelease_n();
LABEL_30:

    uint64_t v31 = 0xC00000000000;
    goto LABEL_25;
  }
  char v36 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v36) {
    goto LABEL_30;
  }
  uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v39 = v38;
  if (v37 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v39 == v40)
  {
    swift_bridgeObjectRelease_n();
LABEL_35:

    *(double *)&uint64_t v18 = 140.0;
    return *(double *)&v18;
  }
  char v41 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v41) {
    goto LABEL_35;
  }
  uint64_t v42 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v44 = v43;
  if (v42 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v44 == v45)
  {
    double v49 = 130.0;
  }
  else
  {
    char v46 = _stringCompareWithSmolCheck(_:_:expecting:)();
    double v47 = 120.0;
    if (v46) {
      double v47 = 130.0;
    }
    double v49 = v47;
  }
  id v48 = v1;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v49;
}

void sub_100026440(uint64_t a1)
{
  sub_100024E8C(a1, *(void *)(v1 + 16));
}

uint64_t sub_100026448(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100026458()
{
  return swift_release();
}

uint64_t sub_10002646C(uint64_t a1)
{
  uint64_t result = sub_10002931C(a1);
  if (v4) {
    goto LABEL_8;
  }
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v5 = sub_1000293CC(result, v3, 0, a1);
  swift_bridgeObjectRetain();
  return v5;
}

id MAGAngelProxy.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

uint64_t static MAGAngelContentState.__derived_struct_equals(_:_:)()
{
  return 1;
}

uint64_t sub_100026528()
{
  return 0;
}

uint64_t sub_100026534()
{
  return 0;
}

void sub_100026540(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10002654C(uint64_t a1)
{
  unint64_t v2 = sub_100026718();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100026588(uint64_t a1)
{
  unint64_t v2 = sub_100026718();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t MAGAngelContentState.encode(to:)(void *a1)
{
  uint64_t v2 = sub_10000B130(&qword_100044F28);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000266D4(a1, a1[3]);
  sub_100026718();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

void *sub_1000266D4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100026718()
{
  unint64_t result = qword_100044F30;
  if (!qword_100044F30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044F30);
  }
  return result;
}

Swift::Int MAGAngelContentState.hashValue.getter()
{
  return Hasher._finalize()();
}

uint64_t MAGAngelContentState.init(from:)(uint64_t a1)
{
  return sub_100026800(a1);
}

Swift::Int sub_1000267CC()
{
  return Hasher._finalize()();
}

uint64_t sub_100026800(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100026850(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100026970(a1, a2, a3, &qword_100044F28, (void (*)(void))sub_100026718);
}

uint64_t sub_10002688C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_1000268BC(uint64_t a1)
{
  unint64_t v2 = sub_10002A2C8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000268F8(uint64_t a1)
{
  unint64_t v2 = sub_10002A2C8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100026934(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100026970(a1, a2, a3, &qword_100045160, (void (*)(void))sub_10002A2C8);
}

uint64_t sub_100026970(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v7 = sub_10000B130(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000266D4(a1, a1[3]);
  a5();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_100026A90()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 16) = &_swiftEmptyDictionarySingleton;
  unint64_t v2 = (unint64_t *)(v0 + 16);
  sub_10000B130(&qword_1000451E8);
  unint64_t v3 = static Activity.activities.getter();
  unint64_t v4 = v3;
  if (v3 >> 62)
  {
LABEL_26:
    swift_bridgeObjectRetain();
    uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v5) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v5)
    {
LABEL_3:
      uint64_t v28 = v1;
      uint64_t v29 = (void *)v4;
      unint64_t v30 = v4 & 0xC000000000000001;
      uint64_t v6 = 4;
      while (1)
      {
        uint64_t v8 = v6 - 4;
        if (v30)
        {
          uint64_t v9 = specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v10 = v6 - 3;
          if (__OFADD__(v8, 1)) {
            goto LABEL_23;
          }
        }
        else
        {
          uint64_t v9 = *(void *)(v4 + 8 * v6);
          swift_retain();
          uint64_t v10 = v6 - 3;
          if (__OFADD__(v8, 1))
          {
LABEL_23:
            __break(1u);
LABEL_24:
            __break(1u);
LABEL_25:
            __break(1u);
            goto LABEL_26;
          }
        }
        uint64_t v31 = v10;
        uint64_t v1 = v5;
        uint64_t v11 = Activity.id.getter();
        uint64_t v13 = v12;
        swift_beginAccess();
        swift_retain();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        unint64_t v4 = *v2;
        uint64_t v32 = (void *)*v2;
        *unint64_t v2 = 0x8000000000000000;
        unint64_t v16 = sub_100028B80(v11, v13);
        uint64_t v17 = *(void *)(v4 + 16);
        BOOL v18 = (v15 & 1) == 0;
        uint64_t v19 = v17 + v18;
        if (__OFADD__(v17, v18)) {
          goto LABEL_24;
        }
        char v20 = v15;
        if (*(void *)(v4 + 24) >= v19)
        {
          if (isUniquelyReferenced_nonNull_native)
          {
            unint64_t v4 = (unint64_t)v32;
            if (v15) {
              goto LABEL_4;
            }
          }
          else
          {
            sub_100029164();
            unint64_t v4 = (unint64_t)v32;
            if (v20) {
              goto LABEL_4;
            }
          }
        }
        else
        {
          sub_100028BF8(v19, isUniquelyReferenced_nonNull_native);
          unint64_t v21 = sub_100028B80(v11, v13);
          if ((v20 & 1) != (v22 & 1))
          {
            uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
            __break(1u);
            return result;
          }
          unint64_t v16 = v21;
          unint64_t v4 = (unint64_t)v32;
          if (v20)
          {
LABEL_4:
            uint64_t v7 = *(void *)(v4 + 56);
            swift_release();
            *(void *)(v7 + 8 * v16) = v9;
            goto LABEL_5;
          }
        }
        *(void *)(v4 + 8 * (v16 >> 6) + 64) |= 1 << v16;
        uint64_t v23 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
        uint64_t *v23 = v11;
        v23[1] = v13;
        *(void *)(*(void *)(v4 + 56) + 8 * v16) = v9;
        uint64_t v24 = *(void *)(v4 + 16);
        BOOL v25 = __OFADD__(v24, 1);
        uint64_t v26 = v24 + 1;
        if (v25) {
          goto LABEL_25;
        }
        *(void *)(v4 + 16) = v26;
        swift_bridgeObjectRetain();
LABEL_5:
        *unint64_t v2 = v4;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        swift_release();
        ++v6;
        uint64_t v5 = v1;
        unint64_t v4 = (unint64_t)v29;
        if (v31 == v1)
        {
          swift_bridgeObjectRelease();
          return v28;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v1;
}

void *sub_100026D48()
{
  type metadata accessor for ActivityStore();
  swift_allocObject();
  uint64_t result = (void *)sub_100026A90();
  off_100044F20 = result;
  return result;
}

uint64_t sub_100026D88()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_100026DC0()
{
  type metadata accessor for MAGAngelGateway();
  uint64_t v0 = swift_allocObject();
  uint64_t result = sub_100026E00();
  qword_100046B48 = v0;
  return result;
}

uint64_t sub_100026E00()
{
  uint64_t v1 = v0;
  *(void *)(v0 + 16) = 0;
  Logger.init(subsystem:category:)();
  if (qword_100043F40 != -1) {
    swift_once();
  }
  unint64_t v2 = off_100044F20;
  swift_beginAccess();
  uint64_t v3 = v2[2];
  if (*(void *)(v3 + 16))
  {
    uint64_t v4 = sub_10002646C(v3);
    if (v5)
    {
      uint64_t v6 = v4;
      uint64_t v7 = v5;
      swift_bridgeObjectRetain();
      unint64_t v8 = sub_100028B80(v6, v7);
      if (v9)
      {
        uint64_t v10 = *(void *)(*(void *)(v3 + 56) + 8 * v8);
        swift_retain();
      }
      else
      {
        uint64_t v10 = 0;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(void *)(v1 + 16) = v10;
      swift_release();
    }
  }
  return v1;
}

uint64_t sub_100026F34()
{
  v1[11] = v0;
  sub_10000B130(&qword_1000451D0);
  v1[12] = swift_task_alloc();
  uint64_t v2 = sub_10000B130(&qword_1000451E0);
  v1[13] = v2;
  v1[14] = *(void *)(v2 - 8);
  v1[15] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for ActivityPresentationOptions();
  v1[16] = v3;
  v1[17] = *(void *)(v3 - 8);
  v1[18] = swift_task_alloc();
  return _swift_task_switch(sub_100027084, 0, 0);
}

uint64_t sub_100027084()
{
  uint64_t v26 = v0;
  if (*(void *)(v0[11] + 16))
  {
    uint64_t v24 = (uint64_t (__cdecl *)())((char *)&dword_100044F50 + dword_100044F50);
    uint64_t v1 = (void *)swift_task_alloc();
    v0[19] = v1;
    void *v1 = v0;
    v1[1] = sub_100027758;
    return v24();
  }
  else
  {
    uint64_t v3 = v0[12];
    sub_10000B130(&qword_1000451F8);
    uint64_t v4 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
    uint64_t v5 = *(void *)(v4 - 8);
    unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_100032AF0;
    (*(void (**)(unint64_t, void, uint64_t))(v5 + 104))(v7 + v6, enum case for ActivityPresentationOptions.ActivityPresentationDestination.systemAperture(_:), v4);
    ActivityPresentationOptions.init(destinations:)();
    sub_10000B130(&qword_1000451E8);
    Date.init(timeIntervalSinceNow:)();
    uint64_t v8 = type metadata accessor for Date();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v3, 0, 1, v8);
    sub_10002A114();
    sub_10002A16C();
    sub_10002A1C4();
    ActivityContent.init(state:staleDate:relevanceScore:)();
    uint64_t v9 = static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)();
    (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
    swift_retain_n();
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v25 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      uint64_t v13 = Activity.id.getter();
      v0[10] = sub_10002D340(v13, v14, &v25);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Requested activity (%s) successfully.", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_release_n();
    }
    *(void *)(v0[11] + 16) = v9;
    swift_retain();
    swift_release();
    if (qword_100043F40 != -1) {
      swift_once();
    }
    uint64_t v16 = v0[17];
    uint64_t v15 = v0[18];
    uint64_t v17 = v0[16];
    BOOL v18 = off_100044F20;
    uint64_t v19 = Activity.id.getter();
    uint64_t v21 = v20;
    swift_beginAccess();
    swift_retain();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v25 = v18[2];
    v18[2] = 0x8000000000000000;
    sub_100028F10(v9, v19, v21, isUniquelyReferenced_nonNull_native);
    v18[2] = v25;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
    return v23();
  }
}

uint64_t sub_100027758()
{
  swift_task_dealloc();
  return _swift_task_switch(sub_100027854, 0, 0);
}

uint64_t sub_100027854()
{
  uint64_t v24 = v0;
  uint64_t v1 = v0[12];
  sub_10000B130(&qword_1000451F8);
  uint64_t v2 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
  uint64_t v3 = *(void *)(v2 - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100032AF0;
  (*(void (**)(unint64_t, void, uint64_t))(v3 + 104))(v5 + v4, enum case for ActivityPresentationOptions.ActivityPresentationDestination.systemAperture(_:), v2);
  ActivityPresentationOptions.init(destinations:)();
  sub_10000B130(&qword_1000451E8);
  Date.init(timeIntervalSinceNow:)();
  uint64_t v6 = type metadata accessor for Date();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v1, 0, 1, v6);
  sub_10002A114();
  sub_10002A16C();
  sub_10002A1C4();
  ActivityContent.init(state:staleDate:relevanceScore:)();
  uint64_t v7 = static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)();
  (*(void (**)(void, void))(v0[14] + 8))(v0[15], v0[13]);
  swift_retain_n();
  uint64_t v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v11 = Activity.id.getter();
    v0[10] = sub_10002D340(v11, v12, &v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Requested activity (%s) successfully.", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  *(void *)(v0[11] + 16) = v7;
  swift_retain();
  swift_release();
  if (qword_100043F40 != -1) {
    swift_once();
  }
  uint64_t v14 = v0[17];
  uint64_t v13 = v0[18];
  uint64_t v15 = v0[16];
  uint64_t v16 = off_100044F20;
  uint64_t v17 = Activity.id.getter();
  uint64_t v19 = v18;
  swift_beginAccess();
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v23 = v16[2];
  v16[2] = 0x8000000000000000;
  sub_100028F10(v7, v17, v19, isUniquelyReferenced_nonNull_native);
  v16[2] = v23;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_100027E94()
{
  swift_release();
  uint64_t v1 = v0 + OBJC_IVAR____TtC14MagnifierAngel15MAGAngelGateway_logger;
  uint64_t v2 = type metadata accessor for Logger();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t MAGAngelProxy.start()()
{
  return _swift_task_switch(sub_100027F58, 0, 0);
}

uint64_t sub_100027F58()
{
  if (qword_100043F48 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000B5B4;
  return sub_100026F34();
}

uint64_t sub_100028184(const void *a1, void *a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  id v4 = a2;
  return _swift_task_switch(sub_1000281FC, 0, 0);
}

uint64_t sub_1000281FC()
{
  if (qword_100043F48 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_1000282C0;
  return sub_100026F34();
}

uint64_t sub_1000282C0()
{
  uint64_t v1 = *(void (***)(void))(*v0 + 24);
  uint64_t v2 = *(void **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t MAGAngelProxy.finish()()
{
  return _swift_task_switch(sub_100028414, 0, 0);
}

uint64_t sub_100028414()
{
  if (qword_100043F48 != -1) {
    swift_once();
  }
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100044F50 + dword_100044F50);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_10000BED0;
  return v3();
}

uint64_t sub_10002864C(const void *a1, void *a2)
{
  *(void *)(v2 + 16) = a2;
  *(void *)(v2 + 24) = _Block_copy(a1);
  id v4 = a2;
  return _swift_task_switch(sub_1000286C4, 0, 0);
}

uint64_t sub_1000286C4()
{
  if (qword_100043F48 != -1) {
    swift_once();
  }
  uint64_t v3 = (uint64_t (__cdecl *)())((char *)&dword_100044F50 + dword_100044F50);
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 32) = v1;
  void *v1 = v0;
  v1[1] = sub_10002A848;
  return v3();
}

id MAGAngelProxy.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MAGAngelProxy();
  return [super init];
}

id MAGAngelProxy.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MAGAngelProxy();
  return [super dealloc];
}

uint64_t sub_10002883C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v4;
  *uint64_t v4 = v3;
  v4[1] = sub_10000BED0;
  return v6();
}

uint64_t sub_100028908(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v5;
  *uint64_t v5 = v4;
  v5[1] = sub_10000BED0;
  return v7();
}

uint64_t sub_1000289D4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10000BA60(a1, &qword_100044BE0);
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

unint64_t sub_100028B80(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100029080(a1, a2, v4);
}

uint64_t sub_100028BF8(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000B130(&qword_1000451F0);
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
    char v22 = (void *)(v5 + 64);
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
      swift_retain();
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
    uint64_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *uint64_t v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  char v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *char v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100028F10(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100028B80(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100029164();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_100028BF8(v15, a4 & 1);
  unint64_t v21 = sub_100028B80(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  uint64_t *v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

unint64_t sub_100029080(uint64_t a1, uint64_t a2, uint64_t a3)
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

void *sub_100029164()
{
  uint64_t v1 = v0;
  sub_10000B130(&qword_1000451F0);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t *v1 = v4;
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
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
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

uint64_t sub_10002931C(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4) {
    unint64_t v7 = 4;
  }
  unint64_t v8 = v7 - 4;
  int64_t v9 = (unint64_t *)(a1 + 96);
  uint64_t v2 = 192;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1000293CC(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(unsigned char *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)result >> 6) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    return *(void *)(*(void *)(a4 + 48) + 16 * result);
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_100029420()
{
  uint64_t v1 = type metadata accessor for ActivityUIDismissalPolicy();
  v0[8] = v1;
  v0[9] = *(void *)(v1 - 8);
  v0[10] = swift_task_alloc();
  sub_10000B130(&qword_1000451D0);
  v0[11] = swift_task_alloc();
  sub_10000B130(&qword_1000451D8);
  v0[12] = swift_task_alloc();
  return _swift_task_switch(sub_10002953C, 0, 0);
}

uint64_t sub_10002953C()
{
  if (qword_100043F40 != -1) {
LABEL_36:
  }
    swift_once();
  uint64_t v1 = off_100044F20;
  swift_beginAccess();
  uint64_t v2 = v1[2];
  *(void *)(v0 + 104) = v2;
  char v3 = *(unsigned char *)(v2 + 32);
  *(unsigned char *)(v0 + 144) = v3;
  uint64_t v4 = 1 << v3;
  if (v4 < 64) {
    uint64_t v5 = ~(-1 << v4);
  }
  else {
    uint64_t v5 = -1;
  }
  unint64_t v6 = v5 & *(void *)(v2 + 64);
  swift_bridgeObjectRetain();
  int64_t v7 = 0;
  while (v6)
  {
    unint64_t v8 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    unint64_t v9 = v8 | (v7 << 6);
    uint64_t result = *(void *)(v0 + 104);
LABEL_26:
    *(void *)(v0 + 112) = v6;
    *(void *)(v0 + 120) = v7;
    uint64_t v16 = (uint64_t *)(*(void *)(result + 48) + 16 * v9);
    uint64_t v17 = *v16;
    uint64_t v18 = v16[1];
    uint64_t v19 = off_100044F20;
    swift_beginAccess();
    uint64_t v20 = v19[2];
    if (*(void *)(v20 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v21 = sub_100028B80(v17, v18);
      if (v22)
      {
        uint64_t v24 = *(void *)(v0 + 88);
        uint64_t v23 = *(void *)(v0 + 96);
        *(void *)(v0 + 128) = *(void *)(*(void *)(v20 + 56) + 8 * v21);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        Date.init(timeIntervalSinceNow:)();
        uint64_t v25 = type metadata accessor for Date();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v24, 0, 1, v25);
        sub_10002A114();
        sub_10002A16C();
        sub_10002A1C4();
        ActivityContent.init(state:staleDate:relevanceScore:)();
        uint64_t v26 = sub_10000B130(&qword_1000451E0);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v23, 0, 1, v26);
        static ActivityUIDismissalPolicy.immediate.getter();
        uint64_t v31 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
                                                       + async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:));
        BOOL v27 = (void *)swift_task_alloc();
        *(void *)(v0 + 136) = v27;
        *BOOL v27 = v0;
        v27[1] = sub_10002995C;
        uint64_t v28 = *(void *)(v0 + 96);
        uint64_t v29 = *(void *)(v0 + 80);
        return v31(v28, v29);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  int64_t v11 = v7 + 1;
  if (__OFADD__(v7, 1))
  {
    __break(1u);
    goto LABEL_36;
  }
  int64_t v12 = (unint64_t)((1 << *(unsigned char *)(v0 + 144)) + 63) >> 6;
  uint64_t result = *(void *)(v0 + 104);
  if (v11 >= v12)
  {
LABEL_32:
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v30 = *(uint64_t (**)(void))(v0 + 8);
    return v30();
  }
  uint64_t v13 = result + 64;
  unint64_t v14 = *(void *)(result + 64 + 8 * v11);
  ++v7;
  if (v14) {
    goto LABEL_25;
  }
  int64_t v7 = v11 + 1;
  if (v11 + 1 >= v12) {
    goto LABEL_32;
  }
  unint64_t v14 = *(void *)(v13 + 8 * v7);
  if (v14) {
    goto LABEL_25;
  }
  int64_t v7 = v11 + 2;
  if (v11 + 2 >= v12) {
    goto LABEL_32;
  }
  unint64_t v14 = *(void *)(v13 + 8 * v7);
  if (v14) {
    goto LABEL_25;
  }
  int64_t v7 = v11 + 3;
  if (v11 + 3 >= v12) {
    goto LABEL_32;
  }
  unint64_t v14 = *(void *)(v13 + 8 * v7);
  if (v14) {
    goto LABEL_25;
  }
  int64_t v7 = v11 + 4;
  if (v11 + 4 >= v12) {
    goto LABEL_32;
  }
  unint64_t v14 = *(void *)(v13 + 8 * v7);
  if (v14)
  {
LABEL_25:
    unint64_t v6 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v7 << 6);
    goto LABEL_26;
  }
  int64_t v15 = v11 + 5;
  if (v15 >= v12) {
    goto LABEL_32;
  }
  unint64_t v14 = *(void *)(v13 + 8 * v15);
  if (v14)
  {
    int64_t v7 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v7 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v7 >= v12) {
      goto LABEL_32;
    }
    unint64_t v14 = *(void *)(v13 + 8 * v7);
    ++v15;
    if (v14) {
      goto LABEL_25;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10002995C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 96);
  uint64_t v2 = *(void *)(*(void *)v0 + 80);
  uint64_t v3 = *(void *)(*(void *)v0 + 72);
  uint64_t v4 = *(void *)(*(void *)v0 + 64);
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_10000BA60(v1, &qword_1000451D8);
  return _swift_task_switch(sub_100029AFC, 0, 0);
}

void sub_100029AFC()
{
  unint64_t v2 = *(void *)(v0 + 112);
  int64_t v1 = *(void *)(v0 + 120);
  while (v2)
  {
    unint64_t v3 = __clz(__rbit64(v2));
    v2 &= v2 - 1;
    unint64_t v4 = v3 | (v1 << 6);
    uint64_t v5 = *(void *)(v0 + 104);
LABEL_22:
    *(void *)(v0 + 112) = v2;
    *(void *)(v0 + 120) = v1;
    int64_t v11 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v4);
    uint64_t v12 = *v11;
    uint64_t v13 = v11[1];
    unint64_t v14 = off_100044F20;
    swift_beginAccess();
    uint64_t v15 = v14[2];
    if (*(void *)(v15 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      unint64_t v16 = sub_100028B80(v12, v13);
      if (v17)
      {
        uint64_t v19 = *(void *)(v0 + 88);
        uint64_t v18 = *(void *)(v0 + 96);
        *(void *)(v0 + 128) = *(void *)(*(void *)(v15 + 56) + 8 * v16);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        Date.init(timeIntervalSinceNow:)();
        uint64_t v20 = type metadata accessor for Date();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
        sub_10002A114();
        sub_10002A16C();
        sub_10002A1C4();
        ActivityContent.init(state:staleDate:relevanceScore:)();
        uint64_t v21 = sub_10000B130(&qword_1000451E0);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v18, 0, 1, v21);
        static ActivityUIDismissalPolicy.immediate.getter();
        uint64_t v26 = (void (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
                                                    + async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:));
        char v22 = (void *)swift_task_alloc();
        *(void *)(v0 + 136) = v22;
        *char v22 = v0;
        v22[1] = sub_10002995C;
        uint64_t v23 = *(void *)(v0 + 96);
        uint64_t v24 = *(void *)(v0 + 80);
        v26(v23, v24);
        return;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  int64_t v6 = v1 + 1;
  if (__OFADD__(v1, 1))
  {
    __break(1u);
LABEL_32:
    __break(1u);
    return;
  }
  int64_t v7 = (unint64_t)((1 << *(unsigned char *)(v0 + 144)) + 63) >> 6;
  uint64_t v5 = *(void *)(v0 + 104);
  if (v6 >= v7) {
    goto LABEL_28;
  }
  uint64_t v8 = v5 + 64;
  unint64_t v9 = *(void *)(v5 + 64 + 8 * v6);
  ++v1;
  if (v9) {
    goto LABEL_21;
  }
  int64_t v1 = v6 + 1;
  if (v6 + 1 >= v7) {
    goto LABEL_28;
  }
  unint64_t v9 = *(void *)(v8 + 8 * v1);
  if (v9) {
    goto LABEL_21;
  }
  int64_t v1 = v6 + 2;
  if (v6 + 2 >= v7) {
    goto LABEL_28;
  }
  unint64_t v9 = *(void *)(v8 + 8 * v1);
  if (v9) {
    goto LABEL_21;
  }
  int64_t v1 = v6 + 3;
  if (v6 + 3 >= v7) {
    goto LABEL_28;
  }
  unint64_t v9 = *(void *)(v8 + 8 * v1);
  if (v9) {
    goto LABEL_21;
  }
  int64_t v1 = v6 + 4;
  if (v6 + 4 >= v7) {
    goto LABEL_28;
  }
  unint64_t v9 = *(void *)(v8 + 8 * v1);
  if (v9)
  {
LABEL_21:
    unint64_t v2 = (v9 - 1) & v9;
    unint64_t v4 = __clz(__rbit64(v9)) + (v1 << 6);
    goto LABEL_22;
  }
  int64_t v10 = v6 + 5;
  if (v10 < v7)
  {
    unint64_t v9 = *(void *)(v8 + 8 * v10);
    if (!v9)
    {
      while (1)
      {
        int64_t v1 = v10 + 1;
        if (__OFADD__(v10, 1)) {
          goto LABEL_32;
        }
        if (v1 >= v7) {
          goto LABEL_28;
        }
        unint64_t v9 = *(void *)(v8 + 8 * v1);
        ++v10;
        if (v9) {
          goto LABEL_21;
        }
      }
    }
    int64_t v1 = v10;
    goto LABEL_21;
  }
LABEL_28:
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(void (**)(void))(v0 + 8);
  v25();
}

uint64_t type metadata accessor for MAGAngelProxy()
{
  return self;
}

unint64_t sub_100029EC8()
{
  unint64_t result = qword_100044F58;
  if (!qword_100044F58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100044F58);
  }
  return result;
}

ValueMetadata *type metadata accessor for MAGAngelContentState()
{
  return &type metadata for MAGAngelContentState;
}

uint64_t type metadata accessor for ActivityStore()
{
  return self;
}

uint64_t sub_100029F50()
{
  return type metadata accessor for MAGAngelGateway();
}

uint64_t type metadata accessor for MAGAngelGateway()
{
  uint64_t result = qword_100045048;
  if (!qword_100045048) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100029FA4()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MAGAngelAttributes()
{
  return &type metadata for MAGAngelAttributes;
}

ValueMetadata *type metadata accessor for MAGAngelContentState.CodingKeys()
{
  return &type metadata for MAGAngelContentState.CodingKeys;
}

unint64_t sub_10002A064()
{
  unint64_t result = qword_100045128;
  if (!qword_100045128)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045128);
  }
  return result;
}

unint64_t sub_10002A0BC()
{
  unint64_t result = qword_100045130;
  if (!qword_100045130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045130);
  }
  return result;
}

unint64_t sub_10002A114()
{
  unint64_t result = qword_100045138;
  if (!qword_100045138)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045138);
  }
  return result;
}

unint64_t sub_10002A16C()
{
  unint64_t result = qword_100045140;
  if (!qword_100045140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045140);
  }
  return result;
}

unint64_t sub_10002A1C4()
{
  unint64_t result = qword_100045148;
  if (!qword_100045148)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045148);
  }
  return result;
}

unint64_t sub_10002A21C()
{
  unint64_t result = qword_100045150;
  if (!qword_100045150)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045150);
  }
  return result;
}

unint64_t sub_10002A274()
{
  unint64_t result = qword_100045158;
  if (!qword_100045158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045158);
  }
  return result;
}

unint64_t sub_10002A2C8()
{
  unint64_t result = qword_100045168;
  if (!qword_100045168)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045168);
  }
  return result;
}

uint64_t sub_10002A320()
{
  unint64_t v2 = *(const void **)(v0 + 16);
  unint64_t v3 = *(void **)(v0 + 24);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *unint64_t v4 = v1;
  v4[1] = sub_10000BED0;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_100045170 + dword_100045170);
  return v5(v2, v3);
}

uint64_t sub_10002A3D0()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  unint64_t v4 = (int *)v0[4];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_10000BED0;
  int64_t v6 = (uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100045180 + dword_100045180);
  return v6(v2, v3, v4);
}

uint64_t sub_10002A494(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  int64_t v6 = (int *)v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_10000BED0;
  uint64_t v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100045190 + dword_100045190);
  return v8(a1, v4, v5, v6);
}

uint64_t sub_10002A560()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A598(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000B5B4;
  int64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000451A0 + dword_1000451A0);
  return v6(a1, v4);
}

uint64_t sub_10002A654()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002A694()
{
  uint64_t v2 = *(const void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  *uint64_t v4 = v1;
  v4[1] = sub_10000BED0;
  uint64_t v5 = (uint64_t (*)(const void *, void *))((char *)&dword_1000451B0 + dword_1000451B0);
  return v5(v2, v3);
}

uint64_t sub_10002A748()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

ValueMetadata *type metadata accessor for MAGAngelAttributes.CodingKeys()
{
  return &type metadata for MAGAngelAttributes.CodingKeys;
}

unint64_t sub_10002A79C()
{
  unint64_t result = qword_100045200;
  if (!qword_100045200)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045200);
  }
  return result;
}

unint64_t sub_10002A7F4()
{
  unint64_t result = qword_100045208;
  if (!qword_100045208)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045208);
  }
  return result;
}

uint64_t type metadata accessor for MAGAngelSceneDelegate()
{
  return self;
}

uint64_t type metadata accessor for MAGAngelSystemApertureSceneDelegate()
{
  return self;
}

void sub_10002AAFC(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  int64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v26 - v7;
  static Log.angel.getter();
  unint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v26 = v2;
    int64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)int64_t v11 = 136315138;
    uint64_t v28 = sub_10002D340(0xD00000000000001FLL, 0x8000000100039980, &v29);
    uint64_t v2 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v12 = *(void (**)(char *, uint64_t))(v3 + 8);
  v12(v8, v2);
  self;
  uint64_t v13 = swift_dynamicCastObjCClass();
  if (v13)
  {
    uint64_t v14 = v13;
    id v15 = objc_allocWithZone((Class)type metadata accessor for MAGAngelWindow());
    id v16 = a1;
    id v17 = [v15 initWithWindowScene:v14];
    uint64_t v18 = OBJC_IVAR____TtC14MagnifierAngel21MAGAngelSceneDelegate_window;
    uint64_t v19 = v27;
    uint64_t v20 = *(void **)(v27 + OBJC_IVAR____TtC14MagnifierAngel21MAGAngelSceneDelegate_window);
    *(void *)(v27 + OBJC_IVAR____TtC14MagnifierAngel21MAGAngelSceneDelegate_window) = v17;

    uint64_t v21 = *(void **)(v19 + v18);
    if (v21)
    {
      id v22 = v21;
      [v22 makeKeyAndVisible];
    }
  }
  else
  {
    static Log.angel.getter();
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "SessionSceneDelegate: Received a UIScene that is not of type UIWindowScene.", v25, 2u);
      swift_slowDealloc();
    }

    v12(v6, v2);
  }
}

void sub_10002AE34(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v53 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  os_log_type_t v10 = (char *)v47 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v13 = (char *)v47 - v12;
  __chkstk_darwin(v11);
  id v15 = (char *)v47 - v14;
  static Log.angel.getter();
  id v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v50 = v2;
  id v52 = v10;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    id v51 = v13;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v55 = swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315138;
    uint64_t v54 = sub_10002D340(0xD00000000000001FLL, 0x8000000100039980, &v55);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s", v20, 0xCu);
    swift_arrayDestroy();
    uint64_t v21 = v53;
    swift_slowDealloc();
    uint64_t v13 = v51;
    swift_slowDealloc();

    uint64_t v22 = v21;
  }
  else
  {

    uint64_t v22 = v53;
  }
  uint64_t v23 = *(void (**)(char *, uint64_t))(v22 + 8);
  v23(v15, v4);
  type metadata accessor for ActivityScene();
  uint64_t v24 = swift_dynamicCastClass();
  if (v24)
  {
    uint64_t v25 = (void *)v24;
    id v26 = a1;
    static Log.angel.getter();
    id v27 = v26;
    uint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v49 = v4;
      uint64_t v30 = swift_slowAlloc();
      id v48 = v23;
      uint64_t v31 = (uint8_t *)v30;
      uint64_t v55 = swift_slowAlloc();
      *(_DWORD *)uint64_t v31 = 136315138;
      v47[1] = v31 + 4;
      id v32 = [v25 description];
      id v51 = v13;
      id v33 = v32;
      uint64_t v34 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v36 = v35;

      uint64_t v54 = sub_10002D340(v34, v36, &v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      uint64_t v4 = v49;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "SessionSceneDelegate: Connecting session scene: %s", v31, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v23 = v48;
      swift_slowDealloc();

      uint64_t v37 = v51;
    }
    else
    {

      uint64_t v37 = v13;
    }
    v23(v37, v4);
    char v41 = v52;
    if (objc_msgSend(v25, "SBUI_isHostedBySystemAperture"))
    {
      static Log.angel.getter();
      uint64_t v42 = Logger.logObject.getter();
      os_log_type_t v43 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v44 = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, v43, "Returning system aperture view controller", v44, 2u);
        swift_slowDealloc();
      }

      v23(v41, v4);
      uint64_t v45 = OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_systemApertureElementProvider;
      uint64_t v46 = v50;
      [*(id *)(v50 + OBJC_IVAR____TtC14MagnifierAngel35MAGAngelSystemApertureSceneDelegate_systemApertureElementProvider) loadViewIfNeeded];
      [v25 setSystemApertureElementViewControllerProvider:*(void *)(v46 + v45)];
    }
  }
  else
  {
    static Log.angel.getter();
    uint64_t v38 = Logger.logObject.getter();
    os_log_type_t v39 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v38, v39))
    {
      uint64_t v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v40 = 0;
      _os_log_impl((void *)&_mh_execute_header, v38, v39, "SessionSceneDelegate: Received a UIScene that is not of type SessionScene.", v40, 2u);
      swift_slowDealloc();
    }

    v23(v7, v4);
  }
}

uint64_t sub_10002B3CC(uint64_t a1)
{
  uint64_t v19 = a1;
  uint64_t v18 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  uint64_t v2 = *(void *)(v18 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin();
  type metadata accessor for DispatchQoS();
  __chkstk_darwin();
  *(void *)&v1[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener] = 0;
  *(void *)&v1[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_connection] = 0;
  uint64_t v17 = OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_queue;
  v16[2] = sub_10002E0D0();
  uint64_t v5 = v1;
  static MAGAngelConstants.MachService.dispatchQueueLabel.getter();
  v16[1] = v6;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10002E110();
  sub_10000B130(&qword_100045478);
  sub_10002E168();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v18);
  *(void *)&v1[v17] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  *(void *)&v5[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_clientRequestStream] = v19;
  swift_retain();

  uint64_t v7 = (objc_class *)type metadata accessor for MAGAngelConnectionManager();
  v23.receiver = v5;
  v23.super_class = v7;
  id v8 = [super init];
  id v21 = v8;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = sub_10002E1C4;
  *(void *)(v9 + 24) = &v20;
  aBlock[4] = sub_10002E208;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002B81C;
  aBlock[3] = &unk_10003E578;
  os_log_type_t v10 = _Block_copy(aBlock);
  uint64_t v11 = self;
  uint64_t v12 = (char *)v8;
  swift_retain();
  id v13 = [v11 listenerWithConfigurator:v10];
  _Block_release(v10);
  swift_release();
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();

  swift_release();
  uint64_t result = swift_release();
  if (v8)
  {
    __break(1u);
  }
  else
  {
    id v15 = *(void **)&v12[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener];
    *(void *)&v12[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener] = v13;

    return (uint64_t)v12;
  }
  return result;
}

id sub_10002B770(void *a1, uint64_t a2)
{
  static MAGAngelConstants.MachService.launchAngelMachServiceDomain.getter();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [a1 setDomain:v4];

  static MAGAngelConstants.MachService.launchAngelMachServiceID.getter();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [a1 setService:v5];

  return [a1 setDelegate:a2];
}

id sub_10002B820()
{
  uint64_t v1 = OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener;
  uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_listener];
  if (v2)
  {
    [v2 invalidate];
    uint64_t v3 = *(void **)&v0[v1];
    *(void *)&v0[v1] = 0;
  }
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for MAGAngelConnectionManager();
  return [super dealloc];
}

void sub_10002B970(void *a1, char *a2)
{
  [a1 setTargetQueue:*(void *)&a2[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_queue]];
  id v4 = [self userInitiated];
  [a1 setServiceQuality:v4];

  objc_super v5 = (void *)MAGMakeServiceInterface()();
  [a1 setInterface:v5];

  [a1 setInterfaceTarget:a2];
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  uint64_t v19 = sub_10002E0B8;
  uint64_t v20 = v6;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_10002BE18;
  uint64_t v18 = &unk_10003E488;
  uint64_t v7 = _Block_copy(&v15);
  id v8 = a2;
  swift_release();
  [a1 setActivationHandler:v7];
  _Block_release(v7);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  uint64_t v19 = sub_10002E0C0;
  uint64_t v20 = v9;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_10002BE18;
  uint64_t v18 = &unk_10003E4D8;
  os_log_type_t v10 = _Block_copy(&v15);
  uint64_t v11 = v8;
  swift_release();
  [a1 setInvalidationHandler:v10];
  _Block_release(v10);
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  uint64_t v19 = sub_10002E0C8;
  uint64_t v20 = v12;
  id v15 = _NSConcreteStackBlock;
  uint64_t v16 = 1107296256;
  uint64_t v17 = sub_10002BE18;
  uint64_t v18 = &unk_10003E528;
  id v13 = _Block_copy(&v15);
  uint64_t v14 = v11;
  swift_release();
  [a1 setInterruptionHandler:v13];
  _Block_release(v13);
}

uint64_t sub_10002BC1C(uint64_t a1, void *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static MAGLog.service.getter();
  uint64_t v7 = a2;
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v17 = v3;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v16 = v4;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412290;
    uint64_t v18 = v7;
    id v13 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v12 = v7;

    uint64_t v3 = v17;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ activation handler called", v11, 0xCu);
    sub_10000B130((uint64_t *)&unk_1000453F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v4 = v16;
    swift_slowDealloc();
  }
  else
  {

    id v8 = v7;
  }

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_10002BE18(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_10002BE80(uint64_t a1, void *a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  static MAGLog.service.getter();
  uint64_t v7 = a2;
  id v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v17 = v3;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v16 = v4;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412290;
    uint64_t v18 = v7;
    id v13 = v7;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v12 = v7;

    uint64_t v3 = v17;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "%@ invalidation handler called", v11, 0xCu);
    sub_10000B130((uint64_t *)&unk_1000453F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v4 = v16;
    swift_slowDealloc();
  }
  else
  {

    id v8 = v7;
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t v14 = *(Class *)((char *)&v7->isa + OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_connection);
  *(Class *)((char *)&v7->isa + OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_connection) = 0;
}

id sub_10002C090(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static MAGLog.service.getter();
  id v8 = a2;
  os_log_type_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v17 = a1;
    uint64_t v11 = swift_slowAlloc();
    uint64_t v16 = v5;
    uint64_t v12 = (uint8_t *)v11;
    uint64_t v15 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    uint64_t v18 = v8;
    id v13 = v8;
    a1 = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v15 = v8;

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%@ interruption handler called", v12, 0xCu);
    sub_10000B130((uint64_t *)&unk_1000453F0);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v5 = v16;
    swift_slowDealloc();
  }
  else
  {

    os_log_type_t v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return [a1 activate];
}

uint64_t sub_10002C2A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

uint64_t type metadata accessor for MAGAngelConnectionManager()
{
  return self;
}

uint64_t sub_10002C880(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v28 = a1;
  unint64_t v29 = a2;
  uint64_t v5 = v3;
  uint64_t v6 = sub_10000B130(&qword_1000446B0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  os_log_type_t v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for MAGAngelClientRequest(0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v31 = (uint64_t)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v25 - v13;
  uint64_t v30 = type metadata accessor for Logger();
  uint64_t v15 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  static MAGLog.service.getter();
  uint64_t v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v27 = v6;
    uint64_t v20 = swift_slowAlloc();
    v25[1] = v5;
    id v21 = (uint8_t *)v20;
    uint64_t v22 = swift_slowAlloc();
    v25[0] = v14;
    uint64_t v33 = v22;
    unsigned int v26 = a3;
    *(_DWORD *)id v21 = 136315138;
    uint64_t v32 = sub_10002D340(v28, v29, &v33);
    uint64_t v6 = v27;
    a3 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "Recv client message: '%s'", v21, 0xCu);
    swift_arrayDestroy();
    uint64_t v14 = (char *)v25[0];
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v30);
  uint64_t v23 = type metadata accessor for MAGSimulatedEvent();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v14, a3, 12, v23);
  sub_100023268((uint64_t)v14, v31);
  sub_10000B130((uint64_t *)&unk_100044F10);
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return sub_1000232CC((uint64_t)v14);
}

uint64_t sub_10002CC6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v37 = a1;
  uint64_t v38 = a2;
  uint64_t v4 = sub_10000B130(&qword_1000446B0);
  uint64_t v34 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v35 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for MAGAngelClientRequest(0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v33 = (uint64_t)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v28 - v9;
  uint64_t v11 = type metadata accessor for MAGSimulatedEvent();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  os_log_type_t v39 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v40 = *(void *)(v14 - 8);
  uint64_t v15 = __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  os_log_type_t v19 = (char *)&v28 - v18;
  static MAGLog.service.getter();
  uint64_t v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v20, v21))
  {
    uint64_t v31 = v17;
    uint64_t v22 = swift_slowAlloc();
    uint64_t v32 = v14;
    uint64_t v23 = (uint8_t *)v22;
    uint64_t v24 = swift_slowAlloc();
    uint64_t v29 = v12;
    uint64_t v42 = v24;
    uint64_t v30 = v3;
    *(_DWORD *)uint64_t v23 = 136315138;
    uint64_t v41 = sub_10002D340(0xD000000000000011, 0x8000000100039A00, &v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v20, v21, "Recv client message: '%s'", v23, 0xCu);
    swift_arrayDestroy();
    uint64_t v12 = v29;
    swift_slowDealloc();
    uint64_t v14 = v32;
    swift_slowDealloc();
  }

  unint64_t v36 = *(void (**)(char *, uint64_t))(v40 + 8);
  v36(v19, v14);
  uint64_t v25 = v39;
  static MAGSimulatedEvent.decode(_:)();
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v10, v25, v11);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v10, 0, 12, v11);
  sub_100023268((uint64_t)v10, v33);
  sub_10000B130((uint64_t *)&unk_100044F10);
  unsigned int v26 = v35;
  AsyncStream.Continuation.yield(_:)();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v26, v4);
  sub_1000232CC((uint64_t)v10);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v25, v11);
}

uint64_t sub_10002D2E8(uint64_t a1, unint64_t a2)
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

uint64_t sub_10002D340(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002D414(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10002D5D0((uint64_t)v12, *a3);
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
      sub_10002D5D0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100026800((uint64_t)v12);
  return v7;
}

uint64_t sub_10002D414(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10002D62C(a5, a6);
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

uint64_t sub_10002D5D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10002D62C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002D6C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002D8A4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002D8A4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002D6C4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10002D83C(v2, 0);
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

void *sub_10002D83C(uint64_t a1, uint64_t a2)
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
  sub_10000B130(&qword_100045400);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10002D8A4(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000B130(&qword_100045400);
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

void sub_10002D9F8(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [a1 remoteProcess];
  static MAGAngelConstants.MachService.clientEntitlement.getter();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  unsigned int v9 = [v7 hasEntitlement:v8];

  if (v9)
  {
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v1;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = sub_10002E060;
    *(void *)(v11 + 24) = v10;
    aBlock[4] = (uint64_t)sub_10002E078;
    aBlock[5] = v11;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_10002B81C;
    aBlock[3] = (uint64_t)&unk_10003E438;
    uint64_t v12 = _Block_copy(aBlock);
    uint64_t v13 = v1;
    swift_retain();
    swift_release();
    [a1 configureConnection:v12];
    _Block_release(v12);
    LOBYTE(v12) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (v12)
    {
      __break(1u);
    }
    else
    {
      [a1 activate];
      uint64_t v14 = *(void **)&v13[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_connection];
      *(void *)&v13[OBJC_IVAR____TtC14MagnifierAngel25MAGAngelConnectionManager_connection] = a1;
      id v15 = a1;
      swift_release();
    }
  }
  else
  {
    static MAGLog.service.getter();
    id v16 = a1;
    uint64_t v17 = Logger.logObject.getter();
    int v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, (os_log_type_t)v18))
    {
      os_log_type_t v19 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      uint64_t v27 = v4;
      aBlock[0] = v26;
      *(_DWORD *)os_log_type_t v19 = 136315138;
      id v20 = [v16 remoteProcess:v19 + 4 v26];
      id v21 = [v20 description];

      uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v24 = v23;

      void aBlock[6] = sub_10002D340(v22, v24, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v17, (os_log_type_t)v18, "\"%s\" is not entitled. invalidating connection", v19, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v3);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }
    [v16 invalidate];
  }
}

unint64_t sub_10002DE10()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static MAGLog.service.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    unint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)unint64_t v6 = 136315138;
    uint64_t v8 = sub_10002D340(0x53746E6572727563, 0xEE00292865746174, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "Recv client message: '%s'", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if (qword_100043E90 != -1) {
    swift_once();
  }
  return sub_10000D2D4();
}

uint64_t sub_10002E028()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002E060(void *a1)
{
  sub_10002B970(a1, *(char **)(v1 + 16));
}

uint64_t sub_10002E068()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002E078()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10002E0A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002E0B0()
{
  return swift_release();
}

uint64_t sub_10002E0B8(uint64_t a1)
{
  return sub_10002BC1C(a1, *(void **)(v1 + 16));
}

void sub_10002E0C0(uint64_t a1)
{
  sub_10002BE80(a1, *(void **)(v1 + 16));
}

id sub_10002E0C8(void *a1)
{
  return sub_10002C090(a1, *(void **)(v1 + 16));
}

unint64_t sub_10002E0D0()
{
  unint64_t result = qword_100044218;
  if (!qword_100044218)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100044218);
  }
  return result;
}

unint64_t sub_10002E110()
{
  unint64_t result = qword_100045470;
  if (!qword_100045470)
  {
    type metadata accessor for OS_dispatch_queue.Attributes();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045470);
  }
  return result;
}

unint64_t sub_10002E168()
{
  unint64_t result = qword_100045480;
  if (!qword_100045480)
  {
    sub_10000B90C(&qword_100045478);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100045480);
  }
  return result;
}

id sub_10002E1C4(void *a1)
{
  return sub_10002B770(a1, *(void *)(v1 + 16));
}

uint64_t sub_10002E1CC()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002E20C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.init(timeIntervalSinceNow:)()
{
  return Date.init(timeIntervalSinceNow:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t static Activity.activities.getter()
{
  return static Activity.activities.getter();
}

uint64_t Activity.id.getter()
{
  return Activity.id.getter();
}

uint64_t static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)()
{
  return static Activity.request(attributes:content:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:isUnbounded:)();
}

uint64_t static ActivityUIDismissalPolicy.immediate.getter()
{
  return static ActivityUIDismissalPolicy.immediate.getter();
}

uint64_t type metadata accessor for ActivityUIDismissalPolicy()
{
  return type metadata accessor for ActivityUIDismissalPolicy();
}

uint64_t type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination()
{
  return type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
}

uint64_t ActivityPresentationOptions.init(destinations:)()
{
  return ActivityPresentationOptions.init(destinations:)();
}

uint64_t type metadata accessor for ActivityPresentationOptions()
{
  return type metadata accessor for ActivityPresentationOptions();
}

uint64_t ActivityContent.init(state:staleDate:relevanceScore:)()
{
  return ActivityContent.init(state:staleDate:relevanceScore:)();
}

uint64_t type metadata accessor for MAGAREvent.AREventType()
{
  return type metadata accessor for MAGAREvent.AREventType();
}

uint64_t MAGAREvent.eventType.getter()
{
  return MAGAREvent.eventType.getter();
}

uint64_t type metadata accessor for MAGOUEvent.MAGOUEventType()
{
  return type metadata accessor for MAGOUEvent.MAGOUEventType();
}

uint64_t MAGOUEvent.eventType.getter()
{
  return MAGOUEvent.eventType.getter();
}

uint64_t DetectedDoor.normalizedBbox.getter()
{
  return DetectedDoor.normalizedBbox.getter();
}

uint64_t DetectedDoor.depth.getter()
{
  return DetectedDoor.depth.getter();
}

uint64_t DetectedDoor.depth.setter()
{
  return DetectedDoor.depth.setter();
}

uint64_t type metadata accessor for DetectedDoor()
{
  return type metadata accessor for DetectedDoor();
}

uint64_t MAGARService.init(eventHandler:captureSessionQueue:)()
{
  return MAGARService.init(eventHandler:captureSessionQueue:)();
}

uint64_t dispatch thunk of MAGARService.stopARSession()()
{
  return dispatch thunk of MAGARService.stopARSession()();
}

uint64_t dispatch thunk of MAGARService.startARSession(sceneDepth:personSegmentation:sceneReconstruction:)()
{
  return dispatch thunk of MAGARService.startARSession(sceneDepth:personSegmentation:sceneReconstruction:)();
}

uint64_t dispatch thunk of MAGARService.lastARFrameTimestamp.getter()
{
  return dispatch thunk of MAGARService.lastARFrameTimestamp.getter();
}

uint64_t dispatch thunk of MAGARService.lastARFrameTimestamp.setter()
{
  return dispatch thunk of MAGARService.lastARFrameTimestamp.setter();
}

uint64_t dispatch thunk of MAGARService.arSession.getter()
{
  return dispatch thunk of MAGARService.arSession.getter();
}

uint64_t dispatch thunk of MAGARService.arSession.setter()
{
  return dispatch thunk of MAGARService.arSession.setter();
}

uint64_t type metadata accessor for MAGARService()
{
  return type metadata accessor for MAGARService();
}

uint64_t type metadata accessor for DetectedObject()
{
  return type metadata accessor for DetectedObject();
}

uint64_t static MAGAXUtilities.isVoiceOverRunning.getter()
{
  return static MAGAXUtilities.isVoiceOverRunning.getter();
}

uint64_t type metadata accessor for MAGOutputEvent.EventType()
{
  return type metadata accessor for MAGOutputEvent.EventType();
}

uint64_t static MAGOutputEvent.announcement(_:source:environment:)()
{
  return static MAGOutputEvent.announcement(_:source:environment:)();
}

uint64_t static MAGOutputEvent.detectedText(_:source:environment:)()
{
  return static MAGOutputEvent.detectedText(_:source:environment:)();
}

uint64_t static MAGOutputEvent.doorDetection(_:_:openStateConfidenceThreshold:source:environment:)()
{
  return static MAGOutputEvent.doorDetection(_:_:openStateConfidenceThreshold:source:environment:)();
}

uint64_t static MAGOutputEvent.pointAndSpeak(_:source:environment:)()
{
  return static MAGOutputEvent.pointAndSpeak(_:source:environment:)();
}

uint64_t static MAGOutputEvent.peopleDetection(closestPerson:depth:source:environment:)()
{
  return static MAGOutputEvent.peopleDetection(closestPerson:depth:source:environment:)();
}

uint64_t static MAGOutputEvent.imageCaptionResult(_:source:environment:)()
{
  return static MAGOutputEvent.imageCaptionResult(_:source:environment:)();
}

uint64_t static MAGOutputEvent.objectUnderstanding(detectedObject:cameraPosition:detectedOccupants:source:environment:)()
{
  return static MAGOutputEvent.objectUnderstanding(detectedObject:cameraPosition:detectedOccupants:source:environment:)();
}

uint64_t static MAGOutputEvent.objectUnderstanding(detectedObjectGroup:cameraPosition:detectedOccupants:source:environment:)()
{
  return static MAGOutputEvent.objectUnderstanding(detectedObjectGroup:cameraPosition:detectedOccupants:source:environment:)();
}

uint64_t static MAGOutputEvent.objectUnderstanding(furnitureDetections:cameraPosition:source:environment:)()
{
  return static MAGOutputEvent.objectUnderstanding(furnitureDetections:cameraPosition:source:environment:)();
}

uint64_t static MAGOutputEvent.liveRecognitionStarted(source:environment:)()
{
  return static MAGOutputEvent.liveRecognitionStarted(source:environment:)();
}

uint64_t static MAGOutputEvent.liveRecognitionStopped(source:environment:)()
{
  return static MAGOutputEvent.liveRecognitionStopped(source:environment:)();
}

uint64_t type metadata accessor for MAGOutputEvent()
{
  return type metadata accessor for MAGOutputEvent();
}

uint64_t MAGOutputEvent.init(_:source:environment:)()
{
  return MAGOutputEvent.init(_:source:environment:)();
}

uint64_t MFFeatureFlags.isEnabled.getter()
{
  return MFFeatureFlags.isEnabled.getter();
}

uint64_t type metadata accessor for MFFeatureFlags()
{
  return type metadata accessor for MFFeatureFlags();
}

uint64_t MAGAudioService.init(audioSession:)()
{
  return MAGAudioService.init(audioSession:)();
}

uint64_t type metadata accessor for MAGAudioService()
{
  return type metadata accessor for MAGAudioService();
}

uint64_t dispatch thunk of MAGOutputEngine.isSpeaking.getter()
{
  return dispatch thunk of MAGOutputEngine.isSpeaking.getter();
}

uint64_t MAGOutputEngine.init(audioService:audioSessionAutomaticallyDeactivatesAfterSpeaking:)()
{
  return MAGOutputEngine.init(audioService:audioSessionAutomaticallyDeactivatesAfterSpeaking:)();
}

uint64_t dispatch thunk of MAGOutputEngine.clearEventQueue()()
{
  return dispatch thunk of MAGOutputEngine.clearEventQueue()();
}

uint64_t dispatch thunk of MAGOutputEngine.resetSpeechContent()()
{
  return dispatch thunk of MAGOutputEngine.resetSpeechContent()();
}

uint64_t dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.getter()
{
  return dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.getter();
}

uint64_t dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.setter()
{
  return dispatch thunk of MAGOutputEngine.isElligbleForNewEvent.setter();
}

uint64_t dispatch thunk of MAGOutputEngine.stopSpeechImmediately()()
{
  return dispatch thunk of MAGOutputEngine.stopSpeechImmediately()();
}

uint64_t dispatch thunk of MAGOutputEngine.schedule(_:)()
{
  return dispatch thunk of MAGOutputEngine.schedule(_:)();
}

uint64_t type metadata accessor for MAGOutputEngine()
{
  return type metadata accessor for MAGOutputEngine();
}

uint64_t detectTextBlocks(forDocument:)()
{
  return detectTextBlocks(forDocument:)();
}

uint64_t DetectedTextBlock.init(stringLocaleMap:normalizedBbox:confidence:detectLanguages:outputRegion:)()
{
  return DetectedTextBlock.init(stringLocaleMap:normalizedBbox:confidence:detectLanguages:outputRegion:)();
}

uint64_t type metadata accessor for DetectedTextBlock()
{
  return type metadata accessor for DetectedTextBlock();
}

uint64_t MAGAREventHandler.register(_:asActionHandler:)()
{
  return MAGAREventHandler.register(_:asActionHandler:)();
}

uint64_t MAGCaptureService.init(captureSession:eventHandler:)()
{
  return MAGCaptureService.init(captureSession:eventHandler:)();
}

uint64_t MAGCaptureService.captureSessionQueue.getter()
{
  return MAGCaptureService.captureSessionQueue.getter();
}

uint64_t type metadata accessor for MAGCaptureService()
{
  return type metadata accessor for MAGCaptureService();
}

uint64_t MAGOUEventHandler.register(_:handler:)()
{
  return MAGOUEventHandler.register(_:handler:)();
}

uint64_t type metadata accessor for MAGOutputEventSource()
{
  return type metadata accessor for MAGOutputEventSource();
}

uint64_t type metadata accessor for MAGOutputAnnouncement()
{
  return type metadata accessor for MAGOutputAnnouncement();
}

uint64_t type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType()
{
  return type metadata accessor for MAGPointAndSpeakEvent.PointAndSpeakEventType();
}

uint64_t MAGPointAndSpeakEvent.eventType.getter()
{
  return MAGPointAndSpeakEvent.eventType.getter();
}

uint64_t static SpatialPersonDetection.spatialize(_:frame:orientation:)()
{
  return static SpatialPersonDetection.spatialize(_:frame:orientation:)();
}

uint64_t DetectedTextAndLanguage.init(text:locale:)()
{
  return DetectedTextAndLanguage.init(text:locale:)();
}

uint64_t type metadata accessor for DetectedTextAndLanguage()
{
  return type metadata accessor for DetectedTextAndLanguage();
}

uint64_t type metadata accessor for MAGCVPixelBufferWrapper()
{
  return type metadata accessor for MAGCVPixelBufferWrapper();
}

uint64_t MAGCVPixelBufferWrapper.init(_:)()
{
  return MAGCVPixelBufferWrapper.init(_:)();
}

uint64_t MAGDoorDetectionService.init(textDetectionService:arService:)()
{
  return MAGDoorDetectionService.init(textDetectionService:arService:)();
}

uint64_t dispatch thunk of MAGDoorDetectionService.getAverageRectDistance(_:inFrame:)()
{
  return dispatch thunk of MAGDoorDetectionService.getAverageRectDistance(_:inFrame:)();
}

uint64_t dispatch thunk of MAGDoorDetectionService.openStateConfidenceThreshold.getter()
{
  return dispatch thunk of MAGDoorDetectionService.openStateConfidenceThreshold.getter();
}

uint64_t type metadata accessor for MAGDoorDetectionService()
{
  return type metadata accessor for MAGDoorDetectionService();
}

uint64_t MAGPointAndSpeakService.init(eventHandler:arService:textDetectionService:outputEngine:pulseFeedbackProcessor:)()
{
  return MAGPointAndSpeakService.init(eventHandler:arService:textDetectionService:outputEngine:pulseFeedbackProcessor:)();
}

uint64_t type metadata accessor for MAGPointAndSpeakService()
{
  return type metadata accessor for MAGPointAndSpeakService();
}

uint64_t dispatch thunk of MAGTextDetectionService.detectText(fromPixelBuffer:languageCorrection:completionBlock:)()
{
  return dispatch thunk of MAGTextDetectionService.detectText(fromPixelBuffer:languageCorrection:completionBlock:)();
}

uint64_t MAGTextDetectionService.queue.getter()
{
  return MAGTextDetectionService.queue.getter();
}

uint64_t type metadata accessor for MAGOutputEventEnvironment()
{
  return type metadata accessor for MAGOutputEventEnvironment();
}

uint64_t dispatch thunk of MAGPulseFeedbackProcessor.processPulseFeedback(nearestPersonData:depth:)()
{
  return dispatch thunk of MAGPulseFeedbackProcessor.processPulseFeedback(nearestPersonData:depth:)();
}

uint64_t dispatch thunk of MAGPulseFeedbackProcessor.processDoorPulseFeedback(depth:)()
{
  return dispatch thunk of MAGPulseFeedbackProcessor.processDoorPulseFeedback(depth:)();
}

uint64_t dispatch thunk of MAGPulseFeedbackProcessor.toneGenerator.getter()
{
  return dispatch thunk of MAGPulseFeedbackProcessor.toneGenerator.getter();
}

uint64_t dispatch thunk of MAGPulseFeedbackProcessor.doorToneGenerator.getter()
{
  return dispatch thunk of MAGPulseFeedbackProcessor.doorToneGenerator.getter();
}

uint64_t dispatch thunk of MAGPulseFeedbackProcessor.pointSpeakDistanceToneGenerator.getter()
{
  return dispatch thunk of MAGPulseFeedbackProcessor.pointSpeakDistanceToneGenerator.getter();
}

uint64_t dispatch thunk of MAGPulseFeedbackProcessor.objectUnderstandingToneGenerator.getter()
{
  return dispatch thunk of MAGPulseFeedbackProcessor.objectUnderstandingToneGenerator.getter();
}

uint64_t dispatch thunk of ANSTPersonDetectionManager.computePersonDetectionFromFrame(frame:interfaceOrientation:)()
{
  return dispatch thunk of ANSTPersonDetectionManager.computePersonDetectionFromFrame(frame:interfaceOrientation:)();
}

uint64_t dispatch thunk of ANSTPersonDetectionManager.matchANSTDetections(to:anstDetections:orientation:capturedImage:)()
{
  return dispatch thunk of ANSTPersonDetectionManager.matchANSTDetections(to:anstDetections:orientation:capturedImage:)();
}

uint64_t MAGPointAndSpeakEventHandler.register(_:asActionHandler:)()
{
  return MAGPointAndSpeakEventHandler.register(_:asActionHandler:)();
}

uint64_t MAGObjectUnderstandingService.init(arService:eventHandler:pulseFeedbackProcessor:)()
{
  return MAGObjectUnderstandingService.init(arService:eventHandler:pulseFeedbackProcessor:)();
}

uint64_t dispatch thunk of MAGObjectUnderstandingService.stopService()()
{
  return dispatch thunk of MAGObjectUnderstandingService.stopService()();
}

uint64_t dispatch thunk of MAGObjectUnderstandingService.startService(with:)()
{
  return dispatch thunk of MAGObjectUnderstandingService.startService(with:)();
}

uint64_t dispatch thunk of MAGObjectUnderstandingService.understandObjects(spatialMappingPointClouds:)()
{
  return dispatch thunk of MAGObjectUnderstandingService.understandObjects(spatialMappingPointClouds:)();
}

uint64_t dispatch thunk of MAGObjectUnderstandingService.understandObjects(frame:)()
{
  return dispatch thunk of MAGObjectUnderstandingService.understandObjects(frame:)();
}

uint64_t dispatch thunk of MAGObjectUnderstandingService.updateSeatOccupancy(for:)()
{
  return dispatch thunk of MAGObjectUnderstandingService.updateSeatOccupancy(for:)();
}

uint64_t dispatch thunk of MAGObjectUnderstandingService.objectPointerParentNode.getter()
{
  return dispatch thunk of MAGObjectUnderstandingService.objectPointerParentNode.getter();
}

uint64_t type metadata accessor for MAGObjectUnderstandingService()
{
  return type metadata accessor for MAGObjectUnderstandingService();
}

uint64_t static Log.angel.getter()
{
  return static Log.angel.getter();
}

uint64_t Control.angelIconName.getter()
{
  return Control.angelIconName.getter();
}

uint64_t Control.accessibilityLabel.getter()
{
  return Control.accessibilityLabel.getter();
}

uint64_t type metadata accessor for Control()
{
  return type metadata accessor for Control();
}

uint64_t static Detection.closeDetectionFactor.getter()
{
  return static Detection.closeDetectionFactor.getter();
}

uint64_t static Detection.centerDetectionRectSize.getter()
{
  return static Detection.centerDetectionRectSize.getter();
}

uint64_t static Detection.isLidarAvailable.getter()
{
  return static Detection.isLidarAvailable.getter();
}

uint64_t static Detection.labellingTolerance.getter()
{
  return static Detection.labellingTolerance.getter();
}

uint64_t static Detection.luminanceThreshold.getter()
{
  return static Detection.luminanceThreshold.getter();
}

uint64_t static Detection.significantAreaThresholdMM.getter()
{
  return static Detection.significantAreaThresholdMM.getter();
}

uint64_t static MAGAngelConstants.MachService.launchAngelMachServiceID.getter()
{
  return static MAGAngelConstants.MachService.launchAngelMachServiceID.getter();
}

uint64_t static MAGAngelConstants.MachService.launchAngelMachServiceDomain.getter()
{
  return static MAGAngelConstants.MachService.launchAngelMachServiceDomain.getter();
}

uint64_t static MAGAngelConstants.MachService.clientEntitlement.getter()
{
  return static MAGAngelConstants.MachService.clientEntitlement.getter();
}

uint64_t static MAGAngelConstants.MachService.dispatchQueueLabel.getter()
{
  return static MAGAngelConstants.MachService.dispatchQueueLabel.getter();
}

uint64_t type metadata accessor for MAGSimulatedEvent.EventType()
{
  return type metadata accessor for MAGSimulatedEvent.EventType();
}

uint64_t static MAGSimulatedEvent.decode(_:)()
{
  return static MAGSimulatedEvent.decode(_:)();
}

uint64_t MAGSimulatedEvent.eventType.getter()
{
  return MAGSimulatedEvent.eventType.getter();
}

uint64_t type metadata accessor for MAGSimulatedEvent()
{
  return type metadata accessor for MAGSimulatedEvent();
}

uint64_t MAGMakeServiceInterface()()
{
  return MAGMakeServiceInterface()();
}

uint64_t static MAGLog.service.getter()
{
  return static MAGLog.service.getter();
}

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
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

uint64_t UISceneSessionActivationRequest.init(role:userActivity:options:)()
{
  return UISceneSessionActivationRequest.init(role:userActivity:options:)();
}

uint64_t type metadata accessor for UISceneSessionActivationRequest()
{
  return type metadata accessor for UISceneSessionActivationRequest();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t static Published.subscript.modify()
{
  return static Published.subscript.modify();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t type metadata accessor for ColorScheme()
{
  return type metadata accessor for ColorScheme();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t StateObject.wrappedValue.getter()
{
  return StateObject.wrappedValue.getter();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t AnyShapeStyle.init<A>(_:)()
{
  return AnyShapeStyle.init<A>(_:)();
}

uint64_t type metadata accessor for _TaskModifier()
{
  return type metadata accessor for _TaskModifier();
}

uint64_t ModifiedContent<>.accessibilityValue<A>(_:)()
{
  return ModifiedContent<>.accessibilityValue<A>(_:)();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t static ButtonBorderShape.roundedRectangle.getter()
{
  return static ButtonBorderShape.roundedRectangle.getter();
}

uint64_t static ButtonBorderShape.circle.getter()
{
  return static ButtonBorderShape.circle.getter();
}

uint64_t type metadata accessor for ButtonBorderShape()
{
  return type metadata accessor for ButtonBorderShape();
}

uint64_t static ContentShapeKinds.accessibility.getter()
{
  return static ContentShapeKinds.accessibility.getter();
}

uint64_t type metadata accessor for ContentShapeKinds()
{
  return type metadata accessor for ContentShapeKinds();
}

uint64_t EnvironmentValues.colorScheme.getter()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t EnvironmentValues.colorScheme.setter()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues._buttonBorderShape.getter()
{
  return EnvironmentValues._buttonBorderShape.getter();
}

uint64_t EnvironmentValues._buttonBorderShape.setter()
{
  return EnvironmentValues._buttonBorderShape.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.tint.getter()
{
  return EnvironmentValues.tint.getter();
}

uint64_t EnvironmentValues.tint.setter()
{
  return EnvironmentValues.tint.setter();
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

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t static AccessibilityActionKind.escape.getter()
{
  return static AccessibilityActionKind.escape.getter();
}

uint64_t type metadata accessor for AccessibilityActionKind()
{
  return type metadata accessor for AccessibilityActionKind();
}

uint64_t AccessibilityFocusState.wrappedValue.setter()
{
  return AccessibilityFocusState.wrappedValue.setter();
}

uint64_t AccessibilityFocusState.projectedValue.getter()
{
  return AccessibilityFocusState.projectedValue.getter();
}

uint64_t AccessibilityFocusState.init<>()()
{
  return AccessibilityFocusState.init<>()();
}

uint64_t type metadata accessor for AccessibilityFocusState()
{
  return type metadata accessor for AccessibilityFocusState();
}

uint64_t _makeUIHostingController(_:tracksContentSize:secure:)()
{
  return _makeUIHostingController(_:tracksContentSize:secure:)();
}

uint64_t type metadata accessor for AccessibilityTechnologies()
{
  return type metadata accessor for AccessibilityTechnologies();
}

uint64_t static AccessibilityChildBehavior.combine.getter()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t type metadata accessor for AccessibilityChildBehavior()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t BorderedProminentButtonStyle.init()()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t type metadata accessor for BorderedProminentButtonStyle()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
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

uint64_t static Font.title2.getter()
{
  return static Font.title2.getter();
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

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.accessibilityLabel<A>(_:)()
{
  return View.accessibilityLabel<A>(_:)();
}

uint64_t View.accessibilityAction(_:_:)()
{
  return View.accessibilityAction(_:_:)();
}

uint64_t View.allowsSecureDrawing()()
{
  return View.allowsSecureDrawing()();
}

uint64_t View.accessibilityElement(children:)()
{
  return View.accessibilityElement(children:)();
}

uint64_t View.accessibilityFocused(_:)()
{
  return View.accessibilityFocused(_:)();
}

uint64_t type metadata accessor for Color.RGBColorSpace()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t Color.init(_:white:opacity:)()
{
  return Color.init(_:white:opacity:)();
}

uint64_t Color.init(_:)()
{
  return Color.init(_:)();
}

uint64_t Color.init<A>(_:)()
{
  return Color.init<A>(_:)();
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

uint64_t type metadata accessor for DispatchTimeInterval()
{
  return type metadata accessor for DispatchTimeInterval();
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

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t DispatchWorkItem.init(flags:block:)()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t dispatch thunk of DispatchWorkItem.cancel()()
{
  return dispatch thunk of DispatchWorkItem.cancel()();
}

uint64_t type metadata accessor for DispatchWorkItem()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

{
  return + infix(_:_:)();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
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

uint64_t String.localized.getter()
{
  return String.localized.getter();
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

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static AsyncStream.makeStream(of:bufferingPolicy:)()
{
  return static AsyncStream.makeStream(of:bufferingPolicy:)();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return AsyncStream.Continuation.yield(_:)();
}

uint64_t AsyncStream.makeAsyncIterator()()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t Float.init(truncating:)()
{
  return Float.init(truncating:)();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t UIApplication.activateSceneSession(for:errorHandler:)()
{
  return UIApplication.activateSceneSession(for:errorHandler:)();
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

uint64_t OS_dispatch_queue.asyncAfter(deadline:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:execute:)();
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

uint64_t SCNNode.base.getter()
{
  return SCNNode.base.getter();
}

uint64_t UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)()
{
  return UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
}

uint64_t static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for UIButton.Configuration()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t UIButton.init(configuration:primaryAction:)()
{
  return UIButton.init(configuration:primaryAction:)();
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

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t SIMD3<>.init(_:)()
{
  return SIMD3<>.init(_:)();
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

NSNumber __swiftcall UInt32._bridgeToObjectiveC()()
{
  return (NSNumber)UInt32._bridgeToObjectiveC()();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t AXDeviceHasJindo()
{
  return _AXDeviceHasJindo();
}

uint64_t AXDeviceIsPad()
{
  return _AXDeviceIsPad();
}

uint64_t MSNMonitorBeginException()
{
  return _MSNMonitorBeginException();
}

uint64_t MSNMonitorEndException()
{
  return _MSNMonitorEndException();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void bzero(void *a1, size_t a2)
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return _swift_initEnumMetadataSinglePayload();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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