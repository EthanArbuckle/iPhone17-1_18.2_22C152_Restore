uint64_t sub_1000044E4()
{
  uint64_t v0;
  id v1;

  v0 = type metadata accessor for Logger();
  sub_1000064D0(v0, qword_100014A38);
  sub_100006498(v0, (uint64_t)qword_100014A38);
  if (qword_100014A50 != -1) {
    swift_once();
  }
  v1 = (id)qword_100014E30;
  return Logger.init(_:)();
}

id sub_100004570()
{
  v1 = v0;
  if (qword_100014A30 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006498(v2, (uint64_t)qword_100014A38);
  v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Tearing down Reader", v5, 2u);
    swift_slowDealloc();
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for Reader();
  return objc_msgSendSuper2(&v7, "dealloc");
}

void sub_100004808(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
  _Block_release(v6);
}

int main(int argc, const char **argv, const char **envp)
{
}

id sub_100004928(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, double a9, uint64_t a10, unsigned char *a11)
{
  v27[3] = type metadata accessor for LocalAuthenticationWrapper();
  v27[4] = &off_1000106B0;
  v27[0] = a8;
  *(_DWORD *)&a11[OBJC_IVAR____TtC21automationmode_writer6Writer_lock] = 0;
  *(void *)&a11[OBJC_IVAR____TtC21automationmode_writer6Writer_userPreferencesScope] = kCFPreferencesAnyUser;
  v20 = &a11[OBJC_IVAR____TtC21automationmode_writer6Writer_dataVaultPath];
  void *v20 = a1;
  v20[1] = a2;
  v21 = &a11[OBJC_IVAR____TtC21automationmode_writer6Writer_stateFilePath];
  void *v21 = a3;
  v21[1] = a4;
  v22 = &a11[OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath];
  void *v22 = a5;
  v22[1] = a6;
  a11[OBJC_IVAR____TtC21automationmode_writer6Writer_enforcesClientEntitlement] = a7;
  sub_1000066E0((uint64_t)v27, (uint64_t)&a11[OBJC_IVAR____TtC21automationmode_writer6Writer_authorizationManager]);
  *(double *)&a11[OBJC_IVAR____TtC21automationmode_writer6Writer_credentialTimeout] = a9;
  sub_100006578(a10, (uint64_t)&a11[OBJC_IVAR____TtC21automationmode_writer6Writer_bootSessionUUID]);
  v26.receiver = a11;
  v26.super_class = (Class)type metadata accessor for Writer();
  CFStringRef v23 = (id)kCFPreferencesAnyUser;
  id v24 = objc_msgSendSuper2(&v26, "init");
  sub_1000065E0(a10);
  sub_100006690((uint64_t)v27);
  return v24;
}

uint64_t sub_100004AA0(void *a1, uint64_t a2)
{
  uint64_t v71 = a2;
  sub_100006534((uint64_t *)&unk_100014BB0);
  __chkstk_darwin();
  os_log_type_t v4 = (char *)&v66 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for String.Encoding();
  __chkstk_darwin();
  v69 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100014A30 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = sub_100006498(v6, (uint64_t)qword_100014A38);
  v8 = a1;
  v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  v12 = &Writer;
  v70 = v4;
  if (v11)
  {
    v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)v13 = 136446210;
    v77[0] = v14;
    uint64_t v15 = *(void *)&v8[OBJC_IVAR____TtC21automationmode_writer6Reader_stateFilePath];
    unint64_t v16 = *(void *)&v8[OBJC_IVAR____TtC21automationmode_writer6Reader_stateFilePath + 8];
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_10000AF6C(v15, v16, v77);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    v12 = &Writer;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Reader client asked if automation mode is enabled, checking for state file at %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  v17 = self;
  id v18 = [v17 defaultManager];
  v19 = (uint64_t *)&v8[v12[337].count];
  uint64_t v21 = *v19;
  unint64_t v20 = v19[1];
  NSString v22 = String._bridgeToObjectiveC()();
  unsigned int v23 = [v18 fileExistsAtPath:v22];

  id v24 = v8;
  v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.info.getter();
  BOOL v27 = os_log_type_enabled(v25, v26);
  if (v23)
  {
    uint64_t v68 = v21;
    id v66 = v17;
    if (v27)
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v77[0] = swift_slowAlloc();
      *(_DWORD *)v28 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v75 = sub_10000AF6C(v68, v20, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "State file exists at path %{public}s", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    uint64_t v73 = 0;
    unint64_t v74 = 0xE000000000000000;
    static String.Encoding.utf8.getter();
    uint64_t v30 = String.init(contentsOfFile:encoding:)();
    uint64_t v67 = v7;
    uint64_t v73 = v30;
    unint64_t v74 = v32;
    v33 = Logger.logObject.getter();
    uint64_t v34 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v33, (os_log_type_t)v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      v77[0] = swift_slowAlloc();
      *(_DWORD *)v35 = 136446210;
      swift_beginAccess();
      uint64_t v36 = v73;
      unint64_t v37 = v74;
      swift_bridgeObjectRetain();
      id v76 = (id)sub_10000AF6C(v36, v37, v77);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)v34, "Read boot session id from automation mode state file: %{public}s", v35, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    uint64_t v38 = (uint64_t)v70;
    swift_beginAccess();
    uint64_t v40 = v73;
    unint64_t v39 = v74;
    sub_100006578((uint64_t)&v24[OBJC_IVAR____TtC21automationmode_writer6Reader_bootSessionUUID], v38);
    uint64_t v41 = type metadata accessor for UUID();
    uint64_t v42 = *(void *)(v41 - 8);
    int v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v38, 1, v41);
    swift_bridgeObjectRetain();
    if (v43 == 1)
    {
      sub_1000065E0(v38);
      uint64_t v44 = v73;
      unint64_t v45 = v74;
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v44 = UUID.uuidString.getter();
      unint64_t v45 = v46;
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v38, v41);
    }
    if (v40 == v44 && v39 == v45)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      char v47 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v47 & 1) == 0)
      {
        v49 = v24;
        v50 = Logger.logObject.getter();
        os_log_type_t v51 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v50, v51))
        {
          v52 = (uint8_t *)swift_slowAlloc();
          id v76 = (id)swift_slowAlloc();
          *(_DWORD *)v52 = 136446210;
          swift_bridgeObjectRetain();
          uint64_t v72 = sub_10000AF6C(v68, v20, (uint64_t *)&v76);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "Removing expired state file at path %{public}s", v52, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
        }
        else
        {
        }
        id v53 = objc_msgSend(v66, "defaultManager", v66, v67);
        NSString v54 = String._bridgeToObjectiveC()();
        id v76 = 0;
        unsigned int v55 = [v53 removeItemAtPath:v54 error:&v76];

        if (v55)
        {
          id v56 = v76;
        }
        else
        {
          id v57 = v76;
          uint64_t v58 = _convertNSErrorToError(_:)();

          swift_willThrow();
          v59 = v49;
          swift_errorRetain();
          v60 = v59;
          swift_errorRetain();
          v61 = Logger.logObject.getter();
          os_log_type_t v62 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v61, v62))
          {
            uint64_t v63 = swift_slowAlloc();
            id v76 = (id)swift_slowAlloc();
            *(_DWORD *)uint64_t v63 = 136446466;
            swift_bridgeObjectRetain();
            uint64_t v72 = sub_10000AF6C(v68, v20, (uint64_t *)&v76);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();

            swift_bridgeObjectRelease();
            *(_WORD *)(v63 + 12) = 2082;
            uint64_t v72 = v58;
            swift_errorRetain();
            sub_100006534(&qword_100014DF0);
            uint64_t v64 = String.init<A>(describing:)();
            uint64_t v72 = sub_10000AF6C(v64, v65, (uint64_t *)&v76);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            swift_bridgeObjectRelease();
            swift_errorRelease();
            swift_errorRelease();
            _os_log_impl((void *)&_mh_execute_header, v61, v62, "Failed to remove expired automation mode state file at %{public}s: %{public}s", (uint8_t *)v63, 0x16u);
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
        }
        v48 = *(void (**)(void))(v71 + 16);
        goto LABEL_34;
      }
    }
    v48 = *(void (**)(void))(v71 + 16);
LABEL_34:
    v48();
    return swift_bridgeObjectRelease();
  }
  if (v27)
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v77[0] = swift_slowAlloc();
    *(_DWORD *)v29 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v75 = sub_10000AF6C(v21, v20, v77);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "State file does not exist at path %{public}s", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(uint64_t, void))(v71 + 16))(v71, 0);
}

uint64_t sub_100005754(char *a1, uint64_t a2)
{
  id v4 = [self defaultManager];
  uint64_t v6 = *(void *)&a1[OBJC_IVAR____TtC21automationmode_writer6Reader_noAuthRequiredFilePath];
  unint64_t v5 = *(void *)&a1[OBJC_IVAR____TtC21automationmode_writer6Reader_noAuthRequiredFilePath + 8];
  NSString v7 = String._bridgeToObjectiveC()();
  unsigned int v8 = [v4 fileExistsAtPath:v7];

  if (qword_100014A30 != -1) {
    swift_once();
  }
  uint64_t v9 = type metadata accessor for Logger();
  sub_100006498(v9, (uint64_t)qword_100014A38);
  os_log_type_t v10 = a1;
  BOOL v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v13 = 136446466;
    swift_bridgeObjectRetain();
    sub_10000AF6C(v6, v5, &v15);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 1024;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Reader client asked if automation mode requires user authentication, checked for file at %{public}s, exists: %{BOOL}d", (uint8_t *)v13, 0x12u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  return (*(uint64_t (**)(uint64_t, void))(a2 + 16))(a2, v8 ^ 1);
}

uint64_t sub_10000598C(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100014A30 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100006498(v4, (uint64_t)qword_100014A38);
  unint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    NSString v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Received reader connection request", v7, 2u);
    swift_slowDealloc();
  }

  [a1 setExportedObject:v2];
  id v8 = [self interfaceWithProtocol:&OBJC_PROTOCOL___AutomationModeReaderProtocol];
  [a1 setExportedInterface:v8];

  [a1 resume];
  return 1;
}

id sub_100005AE4()
{
  uint64_t v0 = sub_100006534((uint64_t *)&unk_100014BB0);
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v58 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v3 = (id)XAMAutomationModeDataVaultPath();
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v59 = v5;
  id v60 = (id)v4;

  id v6 = (id)XAMAutomationModeStateFilePath();
  uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  id v9 = (id)XAMAutomationModeDoesNotRequireAuthenticationFilePath();
  uint64_t v63 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v65 = v10;

  id v11 = (id)XAMAutomationModeWriterMachServiceName();
  uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  if (qword_100014A30 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  uint64_t v15 = sub_100006498(v14, (uint64_t)qword_100014A38);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v62 = v15;
  unint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = swift_slowAlloc();
    v68[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136446466;
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_10000AF6C(v64, v8, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_10000AF6C(v61, v13, v68);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "AutomationMode writer daemon launched with state file %{public}s, mach service name %{public}s.", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  uint64_t v19 = type metadata accessor for LocalAuthenticationWrapper();
  uint64_t v20 = swift_allocObject();
  uint64_t v21 = qword_100014A70;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v21 != -1) {
    swift_once();
  }
  double v22 = *(double *)&qword_100014E48;
  if (qword_100014A80 != -1) {
    swift_once();
  }
  uint64_t v58 = sub_100006498(v0, (uint64_t)qword_100014E58);
  sub_100006578(v58, (uint64_t)v2);
  uint64_t v69 = v19;
  v70 = &off_1000106B0;
  v68[0] = v20;
  unsigned int v23 = objc_allocWithZone((Class)type metadata accessor for Writer());
  uint64_t v24 = sub_100006640((uint64_t)v68, v69);
  __chkstk_darwin(v24);
  os_log_type_t v26 = (uint64_t *)((char *)&v58 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v27 + 16))(v26);
  uint64_t v28 = *v26;
  swift_retain();
  id v29 = sub_100004928((uint64_t)v60, v59, v64, v8, v63, v65, 1, v28, v22, (uint64_t)v2, v23);
  sub_100006690((uint64_t)v68);
  swift_release();
  uint64_t v30 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  id v31 = objc_allocWithZone((Class)NSXPCListener);
  id v32 = v29;
  NSString v33 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v34 = [v31 initWithMachServiceName:v33];

  id v35 = v34;
  [v35 setDelegate:v32];

  [v35 resume];
  id v36 = (id)XAMAutomationModeReaderMachServiceName();
  uint64_t v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v38 = v37;

  swift_bridgeObjectRetain_n();
  unint64_t v39 = Logger.logObject.getter();
  os_log_type_t v40 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v39, v40))
  {
    uint64_t v41 = swift_slowAlloc();
    id v60 = v32;
    uint64_t v42 = (uint8_t *)v41;
    v68[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v42 = 136446210;
    swift_bridgeObjectRetain();
    uint64_t v66 = sub_10000AF6C(v61, v38, v68);
    uint64_t v30 = &_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v39, v40, "AutomationMode reader listening to mach service name %{public}s", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    id v32 = v60;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  sub_100006578(v58, (uint64_t)v2);
  int v43 = (objc_class *)type metadata accessor for Reader();
  uint64_t v44 = (char *)objc_allocWithZone(v43);
  unint64_t v45 = &v44[OBJC_IVAR____TtC21automationmode_writer6Reader_stateFilePath];
  *(void *)unint64_t v45 = v64;
  *((void *)v45 + 1) = v8;
  unint64_t v46 = &v44[OBJC_IVAR____TtC21automationmode_writer6Reader_noAuthRequiredFilePath];
  uint64_t v47 = v65;
  *(void *)unint64_t v46 = v63;
  *((void *)v46 + 1) = v47;
  sub_100006578((uint64_t)v2, (uint64_t)&v44[OBJC_IVAR____TtC21automationmode_writer6Reader_bootSessionUUID]);
  v67.receiver = v44;
  v67.super_class = v43;
  id v48 = objc_msgSendSuper2(&v67, "init");
  sub_1000065E0((uint64_t)v2);
  id v49 = objc_allocWithZone((Class)v30[170]);
  id v50 = v48;
  NSString v51 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v52 = [v49 initWithMachServiceName:v51];

  id v53 = v52;
  [v53 setDelegate:v50];

  [v53 resume];
  NSString v54 = Logger.logObject.getter();
  os_log_type_t v55 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v54, v55))
  {
    id v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v56 = 0;
    _os_log_impl((void *)&_mh_execute_header, v54, v55, "Waiting for connections", v56, 2u);
    swift_slowDealloc();
  }

  return v32;
}

uint64_t sub_1000062E0()
{
  return type metadata accessor for Reader();
}

uint64_t type metadata accessor for Reader()
{
  uint64_t result = qword_100014B88;
  if (!qword_100014B88) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100006334()
{
  sub_1000063D0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_1000063D0()
{
  if (!qword_100014D50)
  {
    type metadata accessor for UUID();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100014D50);
    }
  }
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void sub_100006450(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100006498(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_1000064D0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100006534(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006578(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006534((uint64_t *)&unk_100014BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000065E0(uint64_t a1)
{
  uint64_t v2 = sub_100006534((uint64_t *)&unk_100014BB0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006640(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100006690(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000066E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006744()
{
  sub_10000CFAC(0, &qword_100014DC0);
  uint64_t result = OS_os_log.init(subsystem:category:)();
  qword_100014E30 = result;
  return result;
}

uint64_t sub_1000067B4()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000064D0(v0, qword_100014C20);
  sub_100006498(v0, (uint64_t)qword_100014C20);
  if (qword_100014A50 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100014E30;
  return Logger.init(_:)();
}

unint64_t sub_100006840(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006534(&qword_100014DF8);
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
    sub_10000D2CC(v6, (uint64_t)v15, &qword_100014E00);
    unint64_t result = sub_10000B63C((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_10000D20C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100006984(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100006534(&qword_100014E08);
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
    sub_10000D2CC(v6, (uint64_t)&v15, (uint64_t *)&unk_100014E10);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10000B5C4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    long long v11 = (uint64_t *)(v3[6] + 16 * result);
    *long long v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000D20C(&v17, (_OWORD *)(v3[7] + 32 * result));
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

id sub_100006ABC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, void *a5)
{
  if (a2)
  {
    swift_errorRetain();
    if (qword_100014A58 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100006498(v8, (uint64_t)qword_100014C20);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v9 = Logger.logObject.getter();
    os_log_type_t v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      long long v11 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      *(_DWORD *)long long v11 = 136446210;
      swift_errorRetain();
      sub_100006534(&qword_100014DF0);
      uint64_t v12 = String.init<A>(describing:)();
      sub_10000AF6C(v12, v13, &v15);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Provided authorization failed evaluation of device owner policy with error %{public}s", v11, 0xCu);
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
  }
  a3(a2);
  return [a5 invalidate];
}

uint64_t sub_100006CE0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100006D8C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for LocalAuthenticationWrapper()
{
  return self;
}

id sub_100006DC0()
{
  id v1 = v0;
  if (qword_100014A58 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for Logger();
  sub_100006498(v2, (uint64_t)qword_100014C20);
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Tearing down Writer", v5, 2u);
    swift_slowDealloc();
  }

  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for Writer();
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t sub_100007064()
{
  return type metadata accessor for Writer();
}

uint64_t type metadata accessor for Writer()
{
  uint64_t result = qword_100014D40;
  if (!qword_100014D40) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000070B8(int a1)
{
  int v143 = a1;
  uint64_t v1 = type metadata accessor for String.Encoding();
  uint64_t v130 = *(void *)(v1 - 8);
  id v131 = (id)v1;
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v119 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100006534((uint64_t *)&unk_100014BB0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v125 = (uint64_t)&v119 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v132 = (char *)&v119 - v7;
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v119 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v119 - v13;
  uint64_t v15 = type metadata accessor for Logger();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  v126 = (char *)&v119 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  v127 = (char *)&v119 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  v139 = (char *)&v119 - v22;
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v119 - v23;
  if (qword_100014A58 != -1) {
    swift_once();
  }
  v140 = v14;
  uint64_t v25 = sub_100006498(v15, (uint64_t)qword_100014C20);
  os_log_type_t v26 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  uint64_t v142 = v25;
  v136 = v26;
  uint64_t v137 = v16 + 16;
  ((void (*)(char *))v26)(v24);
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.default.getter();
  BOOL v29 = os_log_type_enabled(v27, v28);
  uint64_t v134 = v8;
  uint64_t v135 = v9;
  uint64_t v138 = v16;
  v128 = v12;
  v133 = v3;
  if (v29)
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    id v31 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136446210;
    v145[0] = v31;
    if (v143) {
      uint64_t v32 = 0x454C42414E45;
    }
    else {
      uint64_t v32 = 0x656C6261736964;
    }
    if (v143) {
      unint64_t v33 = 0xE600000000000000;
    }
    else {
      unint64_t v33 = 0xE700000000000000;
    }
    uint64_t v144 = sub_10000AF6C(v32, v33, (uint64_t *)v145);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Executing request to %{public}s automation mode", v30, 0xCu);
    swift_arrayDestroy();
    uint64_t v16 = v138;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  id v34 = *(void (**)(char *, uint64_t))(v16 + 8);
  v34(v24, v15);
  id v35 = v141;
  id v36 = (os_unfair_lock_s *)((char *)v141 + OBJC_IVAR____TtC21automationmode_writer6Writer_lock);
  swift_beginAccess();
  v141 = v36;
  os_unfair_lock_lock(v36);
  swift_endAccess();
  unint64_t v37 = (char *)self;
  id v38 = [v37 defaultManager];
  uint64_t v39 = *(void *)((char *)&v35->_os_unfair_lock_opaque + OBJC_IVAR____TtC21automationmode_writer6Writer_stateFilePath);
  unint64_t v40 = *(void *)((char *)&v35[2]._os_unfair_lock_opaque + OBJC_IVAR____TtC21automationmode_writer6Writer_stateFilePath);
  NSString v41 = String._bridgeToObjectiveC()();
  unsigned int v42 = [v38 fileExistsAtPath:v41];

  if ((v42 ^ v143))
  {
    v129 = v34;
    int v43 = v140;
    URL.init(fileURLWithPath:)();
    uint64_t v44 = v35;
    unint64_t v45 = Logger.logObject.getter();
    os_log_type_t v46 = static os_log_type_t.debug.getter();
    BOOL v47 = os_log_type_enabled(v45, v46);
    v139 = v37;
    uint64_t v123 = v39;
    v124 = v44;
    if (v47)
    {
      id v48 = (uint8_t *)swift_slowAlloc();
      v145[0] = (id)swift_slowAlloc();
      *(_DWORD *)id v48 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v144 = sub_10000AF6C(v39, v40, (uint64_t *)v145);
      int v43 = v140;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v45, v46, "State file path %{public}s", v48, 0xCu);
      swift_arrayDestroy();
      unint64_t v37 = v139;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    id v57 = v132;
    uint64_t v58 = v133;
    unint64_t v59 = v40;
    id v60 = v141;
    if (v143)
    {
      unint64_t v121 = v59;
      uint64_t v122 = v15;
      v119 = &v124[OBJC_IVAR____TtC21automationmode_writer6Writer_bootSessionUUID];
      sub_10000D2CC((uint64_t)&v124[OBJC_IVAR____TtC21automationmode_writer6Writer_bootSessionUUID], (uint64_t)v132, (uint64_t *)&unk_100014BB0);
      uint64_t v61 = type metadata accessor for UUID();
      uint64_t v62 = *(void *)(v61 - 8);
      uint64_t v63 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v62 + 48);
      int v64 = v63(v57, 1, v61);
      uint64_t v120 = v61;
      if (v64 == 1)
      {
        uint64_t v65 = 0x6E776F6E6B6E75;
        sub_10000D330((uint64_t)v57, (uint64_t *)&unk_100014BB0);
        uint64_t v66 = (void *)0xE700000000000000;
      }
      else
      {
        uint64_t v65 = UUID.uuidString.getter();
        uint64_t v66 = v75;
        (*(void (**)(void *, uint64_t))(v62 + 8))(v57, v61);
      }
      v145[0] = (id)v65;
      v145[1] = v66;
      static String.Encoding.utf8.getter();
      sub_10000D050();
      StringProtocol.write(to:atomically:encoding:)();
      (*(void (**)(char *, id))(v130 + 8))(v58, v131);
      swift_bridgeObjectRelease();
      v83 = v127;
      uint64_t v84 = v122;
      v136(v127, v142, v122);
      uint64_t v85 = v135;
      v86 = v43;
      uint64_t v87 = v134;
      (*(void (**)(char *, char *, uint64_t))(v135 + 16))(v128, v86, v134);
      v88 = v124;
      v89 = Logger.logObject.getter();
      LODWORD(v133) = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v89, (os_log_type_t)v133))
      {
        id v131 = v88;
        uint64_t v91 = swift_slowAlloc();
        v132 = (char *)swift_slowAlloc();
        v145[0] = v132;
        *(_DWORD *)uint64_t v91 = 136446466;
        sub_10000D38C(&qword_100014E20, (void (*)(uint64_t))&type metadata accessor for URL);
        v92 = v128;
        uint64_t v93 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v144 = sub_10000AF6C(v93, v94, (uint64_t *)v145);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        v95 = *(void (**)(char *, uint64_t))(v85 + 8);
        uint64_t v135 = v85 + 8;
        v95(v92, v87);
        *(_WORD *)(v91 + 12) = 2082;
        uint64_t v96 = v125;
        sub_10000D2CC((uint64_t)v119, v125, (uint64_t *)&unk_100014BB0);
        uint64_t v97 = v120;
        if (v63((void *)v96, 1, v120) == 1)
        {
          uint64_t v98 = 0x6E776F6E6B6E75;
          sub_10000D330(v96, (uint64_t *)&unk_100014BB0);
          unint64_t v99 = 0xE700000000000000;
        }
        else
        {
          uint64_t v98 = UUID.uuidString.getter();
          unint64_t v99 = v101;
          (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v96, v97);
        }
        v102 = v127;
        v103 = v131;
        uint64_t v144 = sub_10000AF6C(v98, v99, (uint64_t *)v145);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v89, (os_log_type_t)v133, "Created state file for automation mode at %{public}s with boot session id %{public}s", (uint8_t *)v91, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v15 = v122;
        v129(v102, v122);
        v95(v140, v134);
        id v60 = v141;
      }
      else
      {

        v100 = *(void (**)(char *, uint64_t))(v85 + 8);
        v100(v128, v87);
        v129(v83, v84);
        v100(v140, v87);
        uint64_t v15 = v84;
      }
    }
    else
    {
      id v68 = [v37 defaultManager];
      URL._bridgeToObjectiveC()(v69);
      uint64_t v71 = v70;
      v145[0] = 0;
      unsigned int v72 = [v68 removeItemAtURL:v70 error:v145];

      if (!v72)
      {
        id v76 = v145[0];
        uint64_t v77 = _convertNSErrorToError(_:)();

        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v135 + 8))(v43, v134);
        swift_errorRetain();
        swift_errorRetain();
        v78 = Logger.logObject.getter();
        int v79 = static os_log_type_t.fault.getter();
        if (os_log_type_enabled(v78, (os_log_type_t)v79))
        {
          v80 = (uint8_t *)swift_slowAlloc();
          v145[0] = (id)swift_slowAlloc();
          *(_DWORD *)v80 = 136446210;
          uint64_t v144 = v77;
          swift_errorRetain();
          sub_100006534(&qword_100014DF0);
          uint64_t v81 = String.init<A>(describing:)();
          uint64_t v144 = sub_10000AF6C(v81, v82, (uint64_t *)v145);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl((void *)&_mh_execute_header, v78, (os_log_type_t)v79, "Failed to change automation mode: %{public}s", v80, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          swift_errorRelease();
LABEL_54:
          swift_beginAccess();
          objc_super v67 = v60;
          goto LABEL_55;
        }
        swift_errorRelease();
        swift_errorRelease();
        swift_errorRelease();
LABEL_44:

        goto LABEL_54;
      }
      uint64_t v73 = *(void (**)(char *, uint64_t))(v135 + 8);
      id v74 = v145[0];
      v73(v43, v134);
    }
    id v104 = [v139 defaultManager];
    NSString v105 = String._bridgeToObjectiveC()();
    unsigned int v106 = [v104 fileExistsAtPath:v105];

    if (((v106 ^ v143) & 1) == 0)
    {
      v109 = v126;
      v136(v126, v142, v15);
      v110 = Logger.logObject.getter();
      os_log_type_t v111 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v110, v111))
      {
        v112 = (uint8_t *)swift_slowAlloc();
        v113 = (void *)swift_slowAlloc();
        *(_DWORD *)v112 = 136446210;
        v145[0] = v113;
        if (v143) {
          uint64_t v114 = 0x44454C42414E45;
        }
        else {
          uint64_t v114 = 0x64656C6261736964;
        }
        if (v143) {
          unint64_t v115 = 0xE700000000000000;
        }
        else {
          unint64_t v115 = 0xE800000000000000;
        }
        uint64_t v144 = sub_10000AF6C(v114, v115, (uint64_t *)v145);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v110, v111, "Successfully set automation mode to %{public}s", v112, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      v129(v109, v15);
      id v116 = (id)XAMAutomationModeStateChangedNotificationName();
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v117 = String.utf8CString.getter();
      swift_bridgeObjectRelease();
      notify_post((const char *)(v117 + 32));
      swift_release();
      goto LABEL_54;
    }
    v78 = Logger.logObject.getter();
    os_log_type_t v107 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v78, v107))
    {
      v108 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v108 = 0;
      _os_log_impl((void *)&_mh_execute_header, v78, v107, "Failed to change automation mode", v108, 2u);
      swift_slowDealloc();
    }
    goto LABEL_44;
  }
  id v49 = v139;
  v136(v139, v142, v15);
  id v50 = Logger.logObject.getter();
  os_log_type_t v51 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v50, v51))
  {
    v129 = v34;
    id v52 = (uint8_t *)swift_slowAlloc();
    id v53 = (void *)swift_slowAlloc();
    *(_DWORD *)id v52 = 136446210;
    v145[0] = v53;
    if (v143) {
      uint64_t v54 = 0x44454C42414E45;
    }
    else {
      uint64_t v54 = 0x64656C6261736964;
    }
    if (v143) {
      unint64_t v55 = 0xE700000000000000;
    }
    else {
      unint64_t v55 = 0xE800000000000000;
    }
    uint64_t v144 = sub_10000AF6C(v54, v55, (uint64_t *)v145);
    id v56 = v141;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v50, v51, "Requested automation mode state matches current state (%{public}s), nothing to do.", v52, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    v129(v139, v15);
  }
  else
  {

    v34(v49, v15);
    id v56 = v141;
  }
  swift_beginAccess();
  objc_super v67 = v56;
LABEL_55:
  os_unfair_lock_unlock(v67);
  return swift_endAccess();
}

void sub_100008300()
{
  sub_1000063D0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_1000083DC()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 valueForEntitlement:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
  }
  sub_10000CFE8((uint64_t)&v11, (uint64_t)v13);
  sub_10000D2CC((uint64_t)v13, (uint64_t)&v11, &qword_100014DC8);
  if (!*((void *)&v12 + 1))
  {
    sub_10000D330((uint64_t)&v11, &qword_100014DC8);
LABEL_9:
    NSString v5 = String._bridgeToObjectiveC()();
    id v6 = [v0 valueForEntitlement:v5];

    if (v6)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)uint64_t v9 = 0u;
      long long v10 = 0u;
    }
    sub_10000CFE8((uint64_t)v9, (uint64_t)&v11);
    sub_10000D2CC((uint64_t)&v11, (uint64_t)v9, &qword_100014DC8);
    if (*((void *)&v10 + 1))
    {
      sub_10000CFAC(0, &qword_100014DD0);
      if (swift_dynamicCast())
      {
        id v4 = [v8 BOOLValue];

LABEL_17:
        sub_10000D330((uint64_t)&v11, &qword_100014DC8);
        sub_10000D330((uint64_t)v13, &qword_100014DC8);
        return (uint64_t)v4;
      }
    }
    else
    {
      sub_10000D330((uint64_t)v9, &qword_100014DC8);
    }
    id v4 = 0;
    goto LABEL_17;
  }
  sub_10000CFAC(0, &qword_100014DD0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_9;
  }
  unsigned int v3 = [v9[0] BOOLValue];

  if (!v3) {
    goto LABEL_9;
  }
  sub_10000D330((uint64_t)v13, &qword_100014DC8);
  return 1;
}

void sub_100008724(uint64_t a1, uint64_t a2)
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

NSString sub_100008788()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100014E38 = (uint64_t)result;
  return result;
}

NSString sub_1000087C0()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100014E40 = (uint64_t)result;
  return result;
}

void sub_1000087F8()
{
  qword_100014E48 = sub_100008818();
}

double sub_100008818()
{
  id v0 = [self processInfo];
  id v1 = [v0 environment];

  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v2 + 16) && (unint64_t v3 = sub_10000B5C4(0xD00000000000002ELL, 0x800000010000E6C0), (v4 & 1) != 0))
  {
    NSString v5 = (uint64_t *)(*(void *)(v2 + 56) + 16 * v3);
    uint64_t v7 = *v5;
    unint64_t v6 = v5[1];
    swift_bridgeObjectRetain();
  }
  else
  {
    uint64_t v7 = 0;
    unint64_t v6 = 0xE000000000000000;
  }
  uint64_t v8 = swift_bridgeObjectRelease();
  uint64_t v9 = __chkstk_darwin(v8);
  if ((v6 & 0x1000000000000000) != 0 || !(v6 & 0x2000000000000000 | v7 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    swift_bridgeObjectRelease();
    if ((v18 & 1) == 0) {
      goto LABEL_15;
    }
    return 0.0;
  }
  __chkstk_darwin(v9);
  if ((v6 & 0x2000000000000000) != 0)
  {
    if (v7 <= 0x20u && ((1 << v7) & 0x100003E01) != 0
      || (uint64_t v16 = (unsigned __int8 *)_swift_stdlib_strtod_clocale()) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_15;
    }
    int v17 = *v16;
    swift_bridgeObjectRelease();
    if (v17) {
      goto LABEL_15;
    }
    return 0.0;
  }
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v10 = (v6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    uint64_t v11 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v10 = _StringObject.sharedUTF8.getter();
  }
  char v12 = sub_10000B82C(v10, v11, (void (*)(uint64_t *__return_ptr))sub_10000D444);
  swift_bridgeObjectRelease();
  if (v12) {
    return 0.0;
  }
LABEL_15:
  if (qword_100014A68 != -1) {
    swift_once();
  }
  CFStringRef v14 = (const __CFString *)qword_100014E40;
  uint64_t v15 = (__CFString *)sub_10000B88C();
  LODWORD(v14) = CFPreferencesGetAppBooleanValue(v14, v15, 0);

  double result = 2419200.0;
  if (!v14) {
    return 28800.0;
  }
  return result;
}

uint64_t sub_100008B10()
{
  if (qword_100014A60 != -1) {
    swift_once();
  }
  NSString v0 = sub_10000B88C();
  NSString v1 = String._bridgeToObjectiveC()();
  uint64_t v2 = _CFPreferencesCopyValueWithContainer();

  if (v2)
  {
    self;
    unint64_t v3 = (void *)swift_dynamicCastObjCClass();
    if (v3)
    {
      [v3 doubleValue];
      uint64_t v5 = v4;
      swift_unknownObjectRelease();
      return v5;
    }
    swift_unknownObjectRelease();
  }
  return 0;
}

void sub_100008C2C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    if (qword_100014A58 != -1) {
      swift_once();
    }
    uint64_t v3 = type metadata accessor for Logger();
    sub_100006498(v3, (uint64_t)qword_100014C20);
    uint64_t v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v4, v5))
    {
      unint64_t v6 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)unint64_t v6 = 134217984;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Storing credential creation time:  %f", v6, 0xCu);
      swift_slowDealloc();
    }

    if (qword_100014A60 != -1) {
      swift_once();
    }
    id v7 = [objc_allocWithZone((Class)NSNumber) initWithDouble:*(double *)&a1];
    NSString v8 = sub_10000B88C();
    NSString v9 = String._bridgeToObjectiveC()();
    _CFPreferencesSetValueWithContainer();
  }
}

NSString sub_100008E0C()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_100014E50 = (uint64_t)result;
  return result;
}

uint64_t sub_100008E44()
{
  if (qword_100014A78 != -1) {
    swift_once();
  }
  NSString v0 = sub_10000B88C();
  NSString v1 = String._bridgeToObjectiveC()();
  uint64_t v2 = _CFPreferencesCopyValueWithContainer();

  if (!v2) {
    return 0;
  }
  if (swift_dynamicCast()) {
    return v4;
  }
  return 0;
}

void sub_100008F54(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (qword_100014A58 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100006498(v4, (uint64_t)qword_100014C20);
    swift_bridgeObjectRetain_n();
    os_log_type_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v5, v6))
    {
      id v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v11 = swift_slowAlloc();
      *(_DWORD *)id v7 = 136315138;
      swift_bridgeObjectRetain();
      sub_10000AF6C(a1, a2, &v11);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Storing credential boot session UUID:  %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    if (qword_100014A78 != -1) {
      swift_once();
    }
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    NSString v9 = sub_10000B88C();
    NSString v10 = String._bridgeToObjectiveC()();
    _CFPreferencesSetValueWithContainer();
  }
}

BOOL sub_1000091BC()
{
  uint64_t v1 = sub_100006534((uint64_t *)&unk_100014BB0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  NSString v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  NSString v10 = (char *)&v50 - v9;
  *(double *)&uint64_t v11 = COERCE_DOUBLE(sub_100008B10());
  if (v12)
  {
    if (qword_100014A58 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_100006498(v18, (uint64_t)qword_100014C20);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v19, v20)) {
      goto LABEL_14;
    }
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    uint64_t v22 = "No previous credential exists";
    goto LABEL_13;
  }
  double v13 = *(double *)&v11;
  uint64_t v14 = sub_100008E44();
  if (!v15)
  {
    if (qword_100014A58 != -1) {
      swift_once();
    }
    uint64_t v23 = type metadata accessor for Logger();
    sub_100006498(v23, (uint64_t)qword_100014C20);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v19, v20)) {
      goto LABEL_14;
    }
    uint64_t v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v21 = 0;
    uint64_t v22 = "Previous credential did not record boot session, will require new authorization";
LABEL_13:
    _os_log_impl((void *)&_mh_execute_header, v19, v20, v22, v21, 2u);
    swift_slowDealloc();
LABEL_14:

    return 0;
  }
  uint64_t v16 = v14;
  unint64_t v17 = v15;
  sub_10000D2CC((uint64_t)v0 + OBJC_IVAR____TtC21automationmode_writer6Writer_bootSessionUUID, (uint64_t)v3, (uint64_t *)&unk_100014BB0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    swift_bridgeObjectRelease();
    sub_10000D330((uint64_t)v3, (uint64_t *)&unk_100014BB0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
    if (v16 == UUID.uuidString.getter() && v17 == v25)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v27 & 1) == 0)
      {
        if (qword_100014A58 != -1) {
          swift_once();
        }
        uint64_t v28 = type metadata accessor for Logger();
        sub_100006498(v28, (uint64_t)qword_100014C20);
        (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
        swift_bridgeObjectRetain();
        BOOL v29 = Logger.logObject.getter();
        os_log_type_t v30 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v29, v30))
        {
          uint64_t v31 = swift_slowAlloc();
          uint64_t v51 = swift_slowAlloc();
          double v53 = *(double *)&v51;
          *(_DWORD *)uint64_t v31 = 136315394;
          swift_bridgeObjectRetain();
          uint64_t v52 = sub_10000AF6C(v16, v17, (uint64_t *)&v53);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v31 + 12) = 2080;
          uint64_t v32 = UUID.uuidString.getter();
          uint64_t v52 = sub_10000AF6C(v32, v33, (uint64_t *)&v53);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          id v34 = *(void (**)(char *, uint64_t))(v5 + 8);
          v34(v8, v4);
          _os_log_impl((void *)&_mh_execute_header, v29, v30, "Previous credential boot session does not match current (%s != %s, will require new authorization", (uint8_t *)v31, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          v34(v10, v4);
        }
        else
        {

          id v49 = *(void (**)(char *, uint64_t))(v5 + 8);
          v49(v8, v4);
          swift_bridgeObjectRelease_n();
          v49(v10, v4);
        }
        return 0;
      }
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    swift_bridgeObjectRelease();
  }
  if (qword_100014A58 != -1) {
    swift_once();
  }
  uint64_t v35 = type metadata accessor for Logger();
  sub_100006498(v35, (uint64_t)qword_100014C20);
  id v36 = Logger.logObject.getter();
  os_log_type_t v37 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v36, v37))
  {
    id v38 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v38 = 134217984;
    double v53 = v13;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v36, v37, "Last credential created at %f", v38, 0xCu);
    swift_slowDealloc();
  }

  TMGetKernelMonotonicClock();
  uint64_t v40 = *(void *)&v39;
  double v41 = v39 - v13;
  unsigned int v42 = Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = swift_slowAlloc();
    *(_DWORD *)uint64_t v44 = 134218240;
    double v53 = *(double *)&v40;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v44 + 12) = 2048;
    double v53 = v41;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "Credential age based on current time %f is %f", (uint8_t *)v44, 0x16u);
    swift_slowDealloc();
  }

  unint64_t v45 = v0;
  os_log_type_t v46 = Logger.logObject.getter();
  os_log_type_t v47 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v46, v47))
  {
    id v48 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v48 = 134217984;
    double v53 = *(double *)((char *)&v45->isa + OBJC_IVAR____TtC21automationmode_writer6Writer_credentialTimeout);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v46, v47, "Credential timeout: %f", v48, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    os_log_type_t v46 = v45;
  }

  if (v41 < 0.0) {
    return 0;
  }
  return v41 < *(double *)((char *)&v45->isa + OBJC_IVAR____TtC21automationmode_writer6Writer_credentialTimeout);
}

char *sub_1000099C8()
{
  uint64_t v0 = sub_100006534((uint64_t *)&unk_100014BB0);
  sub_1000064D0(v0, qword_100014E58);
  uint64_t v1 = sub_100006498(v0, (uint64_t)qword_100014E58);
  return sub_100009A18(v1);
}

char *sub_100009A18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100006534((uint64_t *)&unk_100014BB0);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for UUID();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v50 - v10;
  uint64_t v12 = type metadata accessor for String.Encoding();
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  size_t v56 = 37;
  uint64_t v15 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(void *)(v15 + 16) = 37;
  *(_OWORD *)(v15 + 48) = 0u;
  *(void *)(v15 + 61) = 0;
  *(_OWORD *)(v15 + 32) = 0u;
  uint64_t v55 = v15;
  if (!sysctlbyname("kern.bootsessionuuid", (void *)(v15 + 32), &v56, 0, 0))
  {
    swift_bridgeObjectRetain();
    static String.Encoding.ascii.getter();
    uint64_t v27 = sub_10000A374(v15, v14);
    if (!v28)
    {
      if (qword_100014A58 != -1) {
        swift_once();
      }
      uint64_t v34 = type metadata accessor for Logger();
      sub_100006498(v34, (uint64_t)qword_100014C20);
      uint64_t v23 = Logger.logObject.getter();
      os_log_type_t v35 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v23, v35))
      {
        id v36 = (uint8_t *)swift_slowAlloc();
        uint64_t v53 = swift_slowAlloc();
        uint64_t v58 = v53;
        *(_DWORD *)id v36 = 136315138;
        uint64_t v52 = v36 + 4;
        swift_beginAccess();
        swift_bridgeObjectRetain();
        uint64_t v37 = a1;
        uint64_t v38 = Array.description.getter();
        unint64_t v40 = v39;
        swift_bridgeObjectRelease();
        uint64_t v41 = v38;
        a1 = v37;
        uint64_t v54 = sub_10000AF6C(v41, v40, &v58);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v23, v35, "Unable to convert kern.bootsessionuuid value %s to ascii string.", v36, 0xCu);
        uint64_t v26 = 1;
        swift_arrayDestroy();
        swift_slowDealloc();
        goto LABEL_13;
      }

LABEL_21:
      uint64_t v26 = 1;
      goto LABEL_34;
    }
    uint64_t v29 = v27;
    unint64_t v30 = v28;
    UUID.init(uuidString:)();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      swift_bridgeObjectRelease();
      unsigned int v42 = *(uint8_t **)(v6 + 32);
      ((void (*)(char *, char *, uint64_t))v42)(v11, v4, v5);
      if (qword_100014A58 != -1) {
        swift_once();
      }
      uint64_t v43 = type metadata accessor for Logger();
      sub_100006498(v43, (uint64_t)qword_100014C20);
      (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
      uint64_t v44 = Logger.logObject.getter();
      os_log_type_t v45 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = swift_slowAlloc();
        uint64_t v52 = v42;
        os_log_type_t v47 = (uint8_t *)v46;
        uint64_t v51 = swift_slowAlloc();
        v57[0] = v51;
        uint64_t v53 = a1;
        *(_DWORD *)os_log_type_t v47 = 136446210;
        uint64_t v50 = v47 + 4;
        sub_10000D38C(&qword_100014E28, (void (*)(uint64_t))&type metadata accessor for UUID);
        uint64_t v48 = dispatch thunk of CustomStringConvertible.description.getter();
        uint64_t v58 = sub_10000AF6C(v48, v49, v57);
        a1 = v53;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "Boot session UUID is %{public}s", v47, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        unsigned int v42 = v52;
        swift_slowDealloc();
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      }

      ((void (*)(uint64_t, char *, uint64_t))v42)(a1, v11, v5);
      uint64_t v26 = 0;
      goto LABEL_34;
    }
    sub_10000D330((uint64_t)v4, (uint64_t *)&unk_100014BB0);
    if (qword_100014A58 != -1) {
      swift_once();
    }
    uint64_t v31 = type metadata accessor for Logger();
    sub_100006498(v31, (uint64_t)qword_100014C20);
    swift_bridgeObjectRetain();
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v23, v32))
    {
      uint64_t v53 = a1;
      unint64_t v33 = (uint8_t *)swift_slowAlloc();
      v57[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v33 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_10000AF6C(v29, v30, v57);
      a1 = v53;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v23, v32, "Unable to convert kern.bootsessionuuid value %{public}s to UUID", v33, 0xCu);
      uint64_t v26 = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      goto LABEL_34;
    }
LABEL_20:

    swift_bridgeObjectRelease_n();
    goto LABEL_21;
  }
  int v16 = errno.getter();
  NSString result = strerror(v16);
  if (result)
  {
    uint64_t v18 = String.init(utf8String:)();
    if (v19) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = 0x6E776F6E6B6E55;
    }
    if (v19) {
      unint64_t v21 = v19;
    }
    else {
      unint64_t v21 = 0xE700000000000000;
    }
    if (qword_100014A58 != -1) {
      swift_once();
    }
    uint64_t v22 = type metadata accessor for Logger();
    sub_100006498(v22, (uint64_t)qword_100014C20);
    swift_bridgeObjectRetain();
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v23, v24))
    {
      uint64_t v25 = swift_slowAlloc();
      v57[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v25 = 67109378;
      LODWORD(v58) = errno.getter();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v25 + 8) = 2082;
      swift_bridgeObjectRetain();
      uint64_t v58 = sub_10000AF6C(v20, v21, v57);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Error %d from sysctlbyname: %{public}s", (uint8_t *)v25, 0x12u);
      uint64_t v26 = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
LABEL_13:
      swift_slowDealloc();

LABEL_34:
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v26, 1, v5);
      return (char *)swift_bridgeObjectRelease();
    }
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000A374(uint64_t a1, char *a2)
{
  uint64_t v4 = type metadata accessor for String.Encoding();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v24 - v9;
  static String.Encoding.utf8.getter();
  char v11 = static String.Encoding.== infix(_:_:)();
  uint64_t v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v10, v4);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, a2, v4);
  if (v11)
  {
    v12(v8, v4);
    goto LABEL_4;
  }
  static String.Encoding.ascii.getter();
  char v13 = static String.Encoding.== infix(_:_:)();
  v12(v10, v4);
  v12(v8, v4);
  if (v13)
  {
LABEL_4:
    uint64_t v14 = sub_10000AEE4(0, a1);
    if ((v15 & 1) == 0)
    {
      if ((v14 & 0x8000000000000000) == 0)
      {
        swift_bridgeObjectRetain();
        uint64_t v16 = static String._tryFromUTF8(_:)();
        uint64_t v18 = v17;
        swift_unknownObjectRelease();
        if (v18)
        {
          static String.Encoding.utf8.getter();
          char v19 = static String.Encoding.== infix(_:_:)();
          v12(v10, v4);
          if (v19 & 1) != 0 || (_StringGuts._isContiguousASCII.getter())
          {
            swift_bridgeObjectRelease();
LABEL_15:
            v12(a2, v4);
            return v16;
          }
          swift_bridgeObjectRelease();
        }
        goto LABEL_11;
      }
      __break(1u);
    }
    __break(1u);
    goto LABEL_18;
  }
LABEL_11:
  uint64_t v20 = sub_10000AEE4(0, a1);
  if ((v21 & 1) == 0)
  {
    id v22 = [objc_allocWithZone((Class)NSString) initWithBytes:a1 + 32 length:v20 encoding:String.Encoding.rawValue.getter()];
    swift_bridgeObjectRelease();
    if (v22)
    {
      uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    else
    {
      uint64_t v16 = 0;
    }
    goto LABEL_15;
  }
LABEL_18:
  uint64_t result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id sub_10000A698()
{
  if (qword_100014A58 != -1) {
    swift_once();
  }
  uint64_t v1 = type metadata accessor for Logger();
  sub_100006498(v1, (uint64_t)qword_100014C20);
  uint64_t v2 = v0;
  uint64_t v3 = Logger.logObject.getter();
  os_log_type_t v4 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v6 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    uint64_t v13 = v6;
    uint64_t v7 = *(void *)&v2[OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath];
    unint64_t v8 = *(void *)&v2[OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath + 8];
    swift_bridgeObjectRetain();
    sub_10000AF6C(v7, v8, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Checking for '%s'", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v9 = [self defaultManager];
  NSString v10 = String._bridgeToObjectiveC()();
  id v11 = [v9 fileExistsAtPath:v10];

  return v11;
}

uint64_t sub_10000A8A4()
{
  id v0 = [objc_allocWithZone((Class)LAContext) init];
  unsigned __int8 v1 = [v0 canEvaluatePolicy:2 error:0];

  if ((v1 & 1) == 0)
  {
    if (qword_100014A58 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_100006498(v7, (uint64_t)qword_100014C20);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_22;
    }
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    uint64_t v6 = "Unable to evaluate device owner authentication policy, probably no passcode set.";
    goto LABEL_21;
  }
  if (sub_10000BFFC())
  {
    if (qword_100014A58 != -1) {
      swift_once();
    }
    uint64_t v2 = type metadata accessor for Logger();
    sub_100006498(v2, (uint64_t)qword_100014C20);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_22;
    }
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    uint64_t v6 = "Authentication not required for privileged connection";
LABEL_21:
    _os_log_impl((void *)&_mh_execute_header, v3, v4, v6, v5, 2u);
    swift_slowDealloc();
LABEL_22:

    return 0;
  }
  if (sub_1000091BC())
  {
    if (qword_100014A58 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100006498(v8, (uint64_t)qword_100014C20);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_22;
    }
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    uint64_t v6 = "Previous authentication has not expired";
    goto LABEL_21;
  }
  if (sub_10000A698())
  {
    if (qword_100014A58 != -1) {
      swift_once();
    }
    uint64_t v9 = type metadata accessor for Logger();
    sub_100006498(v9, (uint64_t)qword_100014C20);
    uint64_t v3 = Logger.logObject.getter();
    os_log_type_t v4 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v3, v4)) {
      goto LABEL_22;
    }
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    uint64_t v6 = "Waiving the requirement for authentication because of the existence of the no-auth-required cookie";
    goto LABEL_21;
  }
  return 1;
}

uint64_t sub_10000ABA4(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v7 = sub_100006534((uint64_t *)&unk_100014BB0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    a2(a1);
    return swift_errorRelease();
  }
  else
  {
    TMGetKernelMonotonicClock();
    sub_100008C2C(v11, 0);
    sub_10000D2CC(a4 + OBJC_IVAR____TtC21automationmode_writer6Writer_bootSessionUUID, (uint64_t)v9, (uint64_t *)&unk_100014BB0);
    uint64_t v12 = type metadata accessor for UUID();
    uint64_t v13 = *(void *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v9, 1, v12) == 1)
    {
      sub_10000D330((uint64_t)v9, (uint64_t *)&unk_100014BB0);
      unint64_t v14 = 0xE700000000000000;
      uint64_t v15 = 0x6E776F6E6B6E75;
    }
    else
    {
      uint64_t v15 = UUID.uuidString.getter();
      unint64_t v14 = v16;
      (*(void (**)(char *, uint64_t))(v13 + 8))(v9, v12);
    }
    sub_100008F54(v15, v14);
    sub_1000070B8(1);
    return ((uint64_t (*)(void))a2)(0);
  }
}

void sub_10000AE68(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  uint64_t v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  id v7 = a1;
  a4();
  _Block_release(v6);
  _Block_release(v6);
}

uint64_t sub_10000AEE4(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(unsigned __int8 *)(a2 + 32) == a1) {
    return 0;
  }
  if (v2 == 1) {
    return 0;
  }
  if (*(unsigned __int8 *)(a2 + 33) == a1) {
    return 1;
  }
  uint64_t v4 = 0;
  uint64_t v5 = v2 - 2;
  while (v5 != v4)
  {
    int v6 = *(unsigned __int8 *)(a2 + 34 + v4++);
    if (v6 == a1) {
      return v4 + 1;
    }
  }
  return 0;
}

uint64_t sub_10000AF6C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000B040(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000CF4C((uint64_t)v12, *a3);
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
      sub_10000CF4C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006690((uint64_t)v12);
  return v7;
}

uint64_t sub_10000B040(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10000B1FC(a5, a6);
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

uint64_t sub_10000B1FC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000B294(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000B474(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000B474(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000B294(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000B40C(v2, 0);
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

void *sub_10000B40C(uint64_t a1, uint64_t a2)
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
  sub_100006534(&qword_100014DB8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000B474(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006534(&qword_100014DB8);
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

unint64_t sub_10000B5C4(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_10000B680(a1, a2, v4);
}

unint64_t sub_10000B63C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));
  return sub_10000B764(a1, v4);
}

unint64_t sub_10000B680(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10000B764(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10000D21C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10000D278((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10000B82C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  if (a1)
  {
    a3(&var2);
    if (!v3) {
      char v4 = var2;
    }
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, void, void))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3) {
      char v4 = BYTE1(var2);
    }
  }
  return v4 & 1;
}

NSString sub_10000B88C()
{
  NSString v0 = String._bridgeToObjectiveC()();
  id v1 = [self processInfo];
  id v2 = [v1 environment];

  uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v3 + 16) && (sub_10000B5C4(0xD00000000000002ELL, 0x800000010000E530), (v4 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    NSString v5 = String._bridgeToObjectiveC()();

    swift_bridgeObjectRelease();
    return v5;
  }
  else
  {
    swift_bridgeObjectRelease();
    return v0;
  }
}

void sub_10000B9AC(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a4;
  uint64_t v9 = (void *)swift_allocObject();
  id v9[2] = sub_10000D134;
  v9[3] = v8;
  v9[4] = a3;
  id v10 = objc_allocWithZone((Class)LAContext);
  _Block_copy(a4);
  swift_retain();
  id v11 = a3;
  sub_10000D14C(a1, a2);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10000D0A4(a1, a2);
  id v13 = [v10 initWithExternalizedContext:isa];

  if (v13)
  {
    sub_100006534(&qword_100014DE8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10000DEF0;
    AnyHashable.init<A>(_:)();
    *(void *)(inited + 96) = &type metadata for Bool;
    *(unsigned char *)(inited + 72) = 1;
    sub_100006840(inited);
    v15.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    unint64_t v16 = (void *)swift_allocObject();
    v16[2] = sub_10000D140;
    v16[3] = v9;
    v16[4] = v13;
    aBlock[4] = sub_10000D1E8;
    aBlock[5] = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100006CE0;
    aBlock[3] = &unk_100010740;
    a4 = _Block_copy(aBlock);
    id v17 = v13;
    swift_retain();
    swift_release();
    [v17 evaluatePolicy:2 options:v15.super.isa reply:a4];
  }
  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    sub_100006534(&qword_100014DE0);
    uint64_t v18 = swift_initStackObject();
    *(_OWORD *)(v18 + 16) = xmmword_10000DEF0;
    *(void *)(v18 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(v18 + 40) = v19;
    *(void *)(v18 + 72) = &type metadata for String;
    *(void *)(v18 + 48) = 0xD000000000000036;
    *(void *)(v18 + 56) = 0x800000010000E490;
    sub_100006984(v18);
    id v20 = objc_allocWithZone((Class)NSError);
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    Class v22 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v23 = [v20 initWithDomain:v21 code:2 userInfo:v22];

    id v24 = v23;
    _Block_copy(a4);
    id v17 = v24;
    uint64_t v25 = (void *)_convertErrorToNSError(_:)();
    (*((void (**)(void *, void *))a4 + 2))(a4, v25);

    v15.super.Class isa = (Class)v17;
  }
  _Block_release(a4);
  swift_release();
  swift_release();
}

uint64_t sub_10000BD74(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100014A58 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100006498(v4, (uint64_t)qword_100014C20);
  NSString v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    int64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)int64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Received connection request", v7, 2u);
    swift_slowDealloc();
  }

  if (*(unsigned char *)(v2 + OBJC_IVAR____TtC21automationmode_writer6Writer_enforcesClientEntitlement) == 1
    && (sub_1000083DC() & 1) == 0)
  {
    id v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136446210;
      sub_10000AF6C(0xD000000000000031, 0x800000010000E5C0, &v13);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Rejecting connection from client lacking entitlement %{public}s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return 0;
  }
  else
  {
    [a1 setExportedObject:v2];
    id v8 = [self interfaceWithProtocol:&OBJC_PROTOCOL___AutomationModeWriterProtocol];
    [a1 setExportedInterface:v8];

    [a1 resume];
    return 1;
  }
}

id sub_10000BFFC()
{
  id v0 = [self currentConnection];
  if (v0)
  {
    uint64_t v1 = v0;
    NSString v2 = String._bridgeToObjectiveC()();
    id v3 = [v1 valueForEntitlement:v2];

    if (v3)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      long long v7 = 0u;
      long long v8 = 0u;
    }
    sub_10000CFE8((uint64_t)&v7, (uint64_t)v9);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_10000D2CC((uint64_t)v9, (uint64_t)&v7, &qword_100014DC8);
  if (!*((void *)&v8 + 1))
  {
    sub_10000D330((uint64_t)&v7, &qword_100014DC8);
    goto LABEL_11;
  }
  sub_10000CFAC(0, &qword_100014DD0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    id v4 = 0;
    goto LABEL_12;
  }
  id v4 = [v6 BOOLValue];

LABEL_12:
  sub_10000D330((uint64_t)v9, &qword_100014DC8);
  return v4;
}

void sub_10000C174(uint64_t a1, uint64_t a2)
{
  if (sub_10000A8A4())
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v3 = objc_allocWithZone((Class)NSError);
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v5 = [v3 initWithDomain:v4 code:1 userInfo:0];

    id v6 = v5;
    id v8 = (id)_convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v8);
  }
  else
  {
    sub_1000070B8(1);
    long long v7 = *(void (**)(uint64_t, void))(a2 + 16);
    v7(a2, 0);
  }
}

void sub_10000C28C(uint64_t a1, unint64_t a2, void *a3, void *aBlock)
{
  _Block_copy(aBlock);
  if (qword_100014A58 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_100006498(v8, (uint64_t)qword_100014C20);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Handling request to enable automation mode with serialized authorization.", v11, 2u);
    swift_slowDealloc();
  }

  _Block_copy(aBlock);
  id v12 = a3;
  sub_10000B9AC(a1, a2, v12, aBlock);
  _Block_release(aBlock);

  _Block_release(aBlock);
}

void sub_10000C3D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for String.Encoding();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for URL();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  os_log_type_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_10000BFFC())
  {
    uint64_t v34 = v9;
    uint64_t v36 = v5;
    uint64_t v13 = *(void *)(a1 + OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath);
    unint64_t v12 = *(void *)(a1 + OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath + 8);
    uint64_t v14 = qword_100014A58;
    swift_bridgeObjectRetain();
    if (v14 != -1) {
      swift_once();
    }
    uint64_t v15 = type metadata accessor for Logger();
    uint64_t v16 = sub_100006498(v15, (uint64_t)qword_100014C20);
    swift_bridgeObjectRetain_n();
    uint64_t v33 = v16;
    id v17 = Logger.logObject.getter();
    os_log_type_t v18 = static os_log_type_t.debug.getter();
    BOOL v19 = os_log_type_enabled(v17, v18);
    uint64_t v35 = v8;
    if (v19)
    {
      uint64_t v31 = v4;
      id v20 = (uint8_t *)swift_slowAlloc();
      uint64_t v21 = swift_slowAlloc();
      uint64_t v32 = a2;
      v38[0] = v21;
      *(_DWORD *)id v20 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_10000AF6C(v13, v12, v38);
      uint64_t v4 = v31;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "no-auth-required cookie file path %{public}s", v20, 0xCu);
      swift_arrayDestroy();
      a2 = v32;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v27 = v36;
    v38[0] = 0;
    v38[1] = 0xE000000000000000;
    URL.init(fileURLWithPath:)();
    static String.Encoding.utf8.getter();
    sub_10000D050();
    StringProtocol.write(to:atomically:encoding:)();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v11, v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    unint64_t v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v28, v29))
    {
      unint64_t v30 = (uint8_t *)swift_slowAlloc();
      v38[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v30 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_10000AF6C(v13, v12, v38);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "Created no-auth-required cookie file for automation mode at %{public}s", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(uint64_t, void))(a2 + 16))(a2, 0);
  }
  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v22 = objc_allocWithZone((Class)NSError);
    NSString v23 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v24 = [v22 initWithDomain:v23 code:3 userInfo:0];

    id v25 = v24;
    uint64_t v36 = _convertErrorToNSError(_:)();
    (*(void (**)(uint64_t, uint64_t))(a2 + 16))(a2, v36);

    uint64_t v26 = (void *)v36;
  }
}

void sub_10000C9B4(uint64_t a1, void (**a2)(void *))
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  long long v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (sub_10000BFFC())
  {
    uint64_t v9 = *(void *)(a1 + OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath);
    unint64_t v8 = *(void *)(a1 + OBJC_IVAR____TtC21automationmode_writer6Writer_noAuthRequiredFilePath + 8);
    uint64_t v10 = qword_100014A58;
    swift_bridgeObjectRetain();
    if (v10 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_100006498(v11, (uint64_t)qword_100014C20);
    swift_bridgeObjectRetain_n();
    unint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v36 = v4;
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      uint64_t v15 = (void *)swift_slowAlloc();
      uint64_t v37 = a2;
      id v39 = v15;
      uint64_t v35 = v5;
      *(_DWORD *)uint64_t v14 = 136446210;
      swift_bridgeObjectRetain();
      uint64_t v38 = sub_10000AF6C(v9, v8, (uint64_t *)&v39);
      uint64_t v5 = v35;
      uint64_t v4 = v36;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "no-auth-required cookie file path %{public}s", v14, 0xCu);
      swift_arrayDestroy();
      a2 = v37;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    id v23 = [self defaultManager];
    URL.init(fileURLWithPath:)();
    URL._bridgeToObjectiveC()(v24);
    uint64_t v26 = v25;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    id v39 = 0;
    unsigned int v27 = [v23 removeItemAtURL:v26 error:&v39];

    id v28 = v39;
    if (v27)
    {
      swift_bridgeObjectRetain();
      os_log_type_t v29 = Logger.logObject.getter();
      os_log_type_t v30 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v29, v30))
      {
        uint64_t v31 = (uint8_t *)swift_slowAlloc();
        id v39 = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v31 = 136446210;
        swift_bridgeObjectRetain();
        uint64_t v38 = sub_10000AF6C(v9, v8, (uint64_t *)&v39);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v29, v30, "Removed no-auth-required cookie file for automation mode at %{public}s", v31, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      ((void (*)(void (**)(void *), void))a2[2])(a2, 0);
    }
    else
    {
      uint64_t v32 = v28;
      swift_bridgeObjectRelease();
      _convertNSErrorToError(_:)();

      swift_willThrow();
      swift_errorRetain();
      uint64_t v33 = (void *)_convertErrorToNSError(_:)();
      ((void (*)(void (**)(void *), void *))a2[2])(a2, v33);

      swift_errorRelease();
      swift_errorRelease();
    }
  }
  else
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v16 = objc_allocWithZone((Class)NSError);
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v18 = [v16 initWithDomain:v17 code:3 userInfo:0];

    id v19 = v18;
    uint64_t v20 = _convertErrorToNSError(_:)();
    uint64_t v21 = a2[2];
    uint64_t v37 = (void (**)(void *))v20;
    v21(a2);

    id v22 = v37;
  }
}

uint64_t sub_10000CF4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000CFAC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000CFE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006534(&qword_100014DC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000D050()
{
  unint64_t result = qword_100014DD8;
  if (!qword_100014DD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100014DD8);
  }
  return result;
}

uint64_t sub_10000D0A4(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D0FC()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000D134(uint64_t a1)
{
  sub_100008724(a1, *(void *)(v1 + 16));
}

uint64_t sub_10000D140(uint64_t a1)
{
  return sub_10000ABA4(a1, *(void (**)(uint64_t))(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32));
}

uint64_t sub_10000D14C(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000D1A8()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

id sub_10000D1E8(uint64_t a1, uint64_t a2)
{
  return sub_100006ABC(a1, a2, *(void (**)(uint64_t))(v2 + 16), *(void *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_10000D1F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000D204()
{
  return swift_release();
}

_OWORD *sub_10000D20C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D21C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000D278(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000D2CC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006534(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000D330(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100006534(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D38C(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *sub_10000D3D4@<X0>(unsigned char *result@<X0>, BOOL *a2@<X8>)
{
  unsigned int v3 = *result;
  BOOL v4 = v3 > 0x20;
  uint64_t v5 = (1 << v3) & 0x100003E01;
  BOOL v6 = v4 || v5 == 0;
  BOOL v7 = v6 && (result = (unsigned char *)_swift_stdlib_strtod_clocale()) != 0 && *result == 0;
  *a2 = v7;
  return result;
}

void *sub_10000D444@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = (*(void *(**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  if (!v2) {
    *a1 = v5;
  }
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

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
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

uint64_t UUID.init(uuidString:)()
{
  return UUID.init(uuidString:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
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

uint64_t errno.getter()
{
  return errno.getter();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.init(utf8String:)()
{
  return String.init(utf8String:)();
}

uint64_t String.init(contentsOfFile:encoding:)()
{
  return String.init(contentsOfFile:encoding:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static String.Encoding.== infix(_:_:)()
{
  return static String.Encoding.== infix(_:_:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t static String.Encoding.ascii.getter()
{
  return static String.Encoding.ascii.getter();
}

uint64_t String.Encoding.rawValue.getter()
{
  return String.Encoding.rawValue.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
}

uint64_t static String._tryFromUTF8(_:)()
{
  return static String._tryFromUTF8(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
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

uint64_t StringProtocol.write(to:atomically:encoding:)()
{
  return StringProtocol.write(to:atomically:encoding:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
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

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
}

uint64_t _StringGuts._isContiguousASCII.getter()
{
  return _StringGuts._isContiguousASCII.getter();
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

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t TMGetKernelMonotonicClock()
{
  return _TMGetKernelMonotonicClock();
}

uint64_t XAMAutomationModeDataVaultPath()
{
  return _XAMAutomationModeDataVaultPath();
}

uint64_t XAMAutomationModeDoesNotRequireAuthenticationFilePath()
{
  return _XAMAutomationModeDoesNotRequireAuthenticationFilePath();
}

uint64_t XAMAutomationModeReaderMachServiceName()
{
  return _XAMAutomationModeReaderMachServiceName();
}

uint64_t XAMAutomationModeStateChangedNotificationName()
{
  return _XAMAutomationModeStateChangedNotificationName();
}

uint64_t XAMAutomationModeStateFilePath()
{
  return _XAMAutomationModeStateFilePath();
}

uint64_t XAMAutomationModeWriterMachServiceName()
{
  return _XAMAutomationModeWriterMachServiceName();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return __CFPreferencesCopyValueWithContainer();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return __CFPreferencesSetValueWithContainer();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return __swift_stdlib_strtod_clocale();
}

void dispatch_main(void)
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

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}