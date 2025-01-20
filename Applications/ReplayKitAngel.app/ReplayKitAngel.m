uint64_t start(int a1, char **a2)
{
  void *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  uint64_t v8;

  v4 = +[RPAngelConnectionManager sharedInstance];
  [v4 activateMachService];

  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

void sub_100004904(id a1)
{
  qword_100047A30 = objc_alloc_init(RPAngelConnectionManager);

  _objc_release_x1();
}

void sub_100004A2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"com.apple.ReplayKitAngel"];
  [v3 setService:@"com.apple.ReplayKitAngel.session"];
  [v3 setDelegate:*(void *)(a1 + 32)];
}

void sub_100004C4C(id a1)
{
  qword_100047A40 = (uint64_t)dispatch_queue_create("com.replaykitangel.connectionManagerQueue", 0);

  _objc_release_x1();
}

void sub_100004E14(id a1)
{
  id v5 = +[BSMutableServiceInterface interfaceWithIdentifier:@"com.apple.ReplayKitAngel.session"];
  v1 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___RPAngelServerProtocol];
  [v5 setServer:v1];

  v2 = +[BSObjCProtocol protocolForProtocol:&OBJC_PROTOCOL___RPAngelClientProtocol];
  [v5 setClient:v2];

  [v5 setClientMessagingExpectation:0];
  id v3 = [v5 copy];
  v4 = (void *)qword_100047A50;
  qword_100047A50 = (uint64_t)v3;
}

void sub_100004EE0(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v6 = a2;
  v4 = [v3 connectionManagerQueue];
  [v6 setTargetQueue:v4];

  id v5 = +[BSServiceQuality userInitiated];
  [v6 setServiceQuality:v5];

  [v6 setInterface:qword_100047A50];
  [v6 setInterfaceTarget:*(void *)(a1 + 32)];
  [v6 setActivationHandler:&stru_10003CF70];
  [v6 setInvalidationHandler:&stru_10003CF90];
  [v6 setInterruptionHandler:&stru_10003CFB0];
}

void sub_100004FB8(id a1, BSServiceConnectionContext *a2)
{
  v2 = a2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136446466;
    v4 = "-[RPAngelConnectionManager listener:didReceiveConnection:withContext:]_block_invoke_3";
    __int16 v5 = 1024;
    int v6 = 109;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel Server: Activation Handler", (uint8_t *)&v3, 0x12u);
  }
}

void sub_10000508C(id a1, BSServiceConnectionContext *a2)
{
  v2 = a2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    __int16 v5 = "-[RPAngelConnectionManager listener:didReceiveConnection:withContext:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 113;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel Server: Invalidation handler", (uint8_t *)&v4, 0x12u);
  }
  int v3 = +[RPRemoteAlertManager sharedInstance];
  [v3 clearRemoteHandle];
}

void sub_10000517C(id a1, BSServiceConnectionContext *a2)
{
  v2 = a2;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136446466;
    __int16 v5 = "-[RPAngelConnectionManager listener:didReceiveConnection:withContext:]_block_invoke";
    __int16 v6 = 1024;
    int v7 = 118;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d RPAngel Server: Interruption handler", (uint8_t *)&v4, 0x12u);
  }
  int v3 = +[RPRemoteAlertManager sharedInstance];
  [v3 clearRemoteHandle];
}

id sub_10000526C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) addConnection:*(void *)(a1 + 40)];
  if (result)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 136446722;
      __int16 v5 = "-[RPAngelConnectionManager listener:didReceiveConnection:withContext:]_block_invoke";
      __int16 v6 = 1024;
      int v7 = 126;
      __int16 v8 = 2048;
      uint64_t v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Activating Connection=%p", (uint8_t *)&v4, 0x1Cu);
    }
    return [*(id *)(a1 + 40) activate];
  }
  return result;
}

void sub_1000060EC(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 32))
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136446466;
      int v7 = "-[RPAngelConnectionManager enableCameraPip]_block_invoke";
      __int16 v8 = 1024;
      int v9 = 216;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pip is already active", (uint8_t *)&v6, 0x12u);
    }
  }
  else
  {
    v2 = objc_alloc_init(RPAngelCameraPipViewController);
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 32);
    *(void *)(v3 + 32) = v2;

    __int16 v5 = *(void **)(*(void *)(a1 + 32) + 32);
    _[v5 startPipSession];
  }
}

void sub_100006344(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) stopPipSession];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

void sub_1000077C0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) startPictureInPicture];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPAngelCameraPipViewController startPipSession]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 96;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pip started", (uint8_t *)&v1, 0x12u);
  }
}

void sub_1000083B0(void *a1)
{
}

void sub_1000083B8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) startPictureInPicture];
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v1 = 136446466;
    uint64_t v2 = "-[RPAngelCameraPipViewController observeValueForKeyPath:ofObject:change:context:]_block_invoke";
    __int16 v3 = 1024;
    int v4 = 197;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d pegasus started", (uint8_t *)&v1, 0x12u);
  }
}

void sub_100008A9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100008C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008C5C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100008C6C(uint64_t a1)
{
}

void sub_100008C74(uint64_t a1, char a2)
{
  if (a2)
  {
    __int16 v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    int v4 = (void *)v3[5];
    __int16 v5 = [v3 rpLocalizedStatusStringForPaused:0];
    [v4 setStatusString:v5];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: failed to acquire assertion", v6, 2u);
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) invalidateStatusBar];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

id sub_100008D34(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) invalidateStatusBar];
}

void sub_100008E30(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    NSInteger v4 = [(NSError *)a2 code];
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "RPStatusBarAssertion: registered. If there was an error it was: %li", (uint8_t *)&v3, 0xCu);
  }
}

uint64_t sub_100008F50(uint64_t a1)
{
  uint64_t v2 = +[NSDate date];
  uint64_t v3 = *(void *)(a1 + 32);
  NSInteger v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  [*(id *)(*(void *)(a1 + 32) + 56) invalidate];
  *(void *)(*(void *)(a1 + 32) + 56) = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"updateDelegateRecordingTimer:" selector:0 userInfo:1 repeats:0.5];

  return _objc_release_x1();
}

void sub_10000909C(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2 && __RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_10002CD2C((uint64_t)v2);
  }
}

void sub_1000096D8(id a1)
{
  qword_100047A60 = objc_alloc_init(RPRemoteAlertManager);

  _objc_release_x1();
}

uint64_t sub_100009CE8()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role);
}

uint64_t sub_100009CF8()
{
  return 0;
}

void *sub_100009D00()
{
  int v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_100009D50(void *a1)
{
}

uint64_t (*sub_100009D5C())()
{
  return j__swift_endAccess;
}

uint64_t sub_100009DBC()
{
  uint64_t v0 = *(void *)sub_10002A6B4();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_100009DF0(uint64_t a1)
{
  int v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100009E34()
{
  int v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_100009E8C(uint64_t a1, uint64_t a2)
{
  __int16 v5 = &v2[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState];
  swift_beginAccess();
  uint64_t v6 = *(void *)v5;
  uint64_t v7 = *((void *)v5 + 1);
  *(void *)__int16 v5 = a1;
  *((void *)v5 + 1) = a2;
  BOOL v8 = v6 == a1 && v7 == a2;
  if (v8 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
    return swift_bridgeObjectRelease();
  }
  id v10 = [v2 systemApertureElementContext];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v2;
  aBlock[4] = sub_10000B490;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009DF0;
  aBlock[3] = &unk_10003D288;
  v12 = _Block_copy(aBlock);
  v13 = v2;
  swift_release();
  [v10 setElementNeedsUpdateWithCoordinatedAnimations:v12];
  _Block_release(v12);
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

void (*sub_100009FF4(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  NSInteger v4 = (void *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState);
  swift_beginAccess();
  uint64_t v5 = v4[1];
  v3[3] = *v4;
  v3[4] = v5;
  swift_bridgeObjectRetain();
  return sub_10000A07C;
}

void sub_10000A07C(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v4 = *(void *)(*(void *)a1 + 32);
  if (a2)
  {
    swift_bridgeObjectRetain();
    sub_100009E8C(v3, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100009E8C(*(void *)(*(void *)a1 + 24), v4);
  }

  free(v2);
}

uint64_t sub_10000A0F8(char a1)
{
  return *(void *)&aLeading_1[8 * a1];
}

uint64_t sub_10000A118(char *a1, char *a2)
{
  return sub_10000A1AC(*a1, *a2);
}

uint64_t sub_10000A124(char a1, char a2)
{
  if (*(void *)&aIdle_1[8 * a1] == *(void *)&aIdle_1[8 * a2]
    && *(void *)&aSavedtop[8 * a1 + 8] == *(void *)&aSavedtop[8 * a2 + 8])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_10000A1AC(char a1, char a2)
{
  if (*(void *)&aLeading_1[8 * a1] == *(void *)&aLeading_1[8 * a2] && qword_10002FEF8[a1] == qword_10002FEF8[a2]) {
    char v3 = 1;
  }
  else {
    char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int sub_10000A234()
{
  return sub_10000A23C();
}

Swift::Int sub_10000A23C()
{
  return Hasher._finalize()();
}

uint64_t sub_10000A2A8()
{
  return sub_10000A304();
}

uint64_t sub_10000A2B0()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10000A304()
{
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000A358()
{
  return sub_10000A360();
}

Swift::Int sub_10000A360()
{
  return Hasher._finalize()();
}

Swift::Int sub_10000A3C8()
{
  return Hasher._finalize()();
}

unint64_t sub_10000A430@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10001D730(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000A460@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000A0F8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

char *sub_10000A48C(int a1)
{
  id v3 = objc_allocWithZone(v1);
  return sub_10000A4C0(a1);
}

char *sub_10000A4C0(int a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  p_info = RPAngelCameraPipViewController.info;
  *(void *)&v1[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package] = 0;
  BOOL v8 = &v1[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState];
  uint64_t v9 = v1;
  id v10 = sub_10002A6B4();
  uint64_t v12 = *(void *)v10;
  uint64_t v11 = *((void *)v10 + 1);
  *(void *)BOOL v8 = v12;
  *((void *)v8 + 1) = v11;
  v9[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role] = a1;
  swift_bridgeObjectRetain();

  v13 = (objc_class *)type metadata accessor for RPSessionAccessoryView();
  v33.receiver = v9;
  v33.super_class = v13;
  id v14 = [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v15 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v15, v3);
  v16 = (char *)v14;
  v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v20 = swift_slowAlloc();
    int v30 = a1;
    v32[0] = v20;
    *(_DWORD *)uint64_t v19 = 136315394;
    uint64_t v31 = sub_10001CEC4(0x6C6F722874696E69, 0xEB00000000293A65, v32);
    uint64_t v29 = v3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v31 = sub_10001CEC4(*(void *)&aLeading_1[8 * v16[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role]], qword_10002FEF8[v16[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role]], v32);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s role=%s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    p_info = (__objc2_class_ro **)(RPAngelCameraPipViewController + 32);
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v29);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v22 = [self bundleForClass:ObjCClassFromMetadata];
  id v23 = objc_allocWithZone((Class)BSUICAPackageView);
  NSString v24 = String._bridgeToObjectiveC()();
  id v25 = [v23 initWithPackageName:v24 inBundle:v22];

  v26 = (void **)((char *)p_info[509] + (void)v16);
  swift_beginAccess();
  v27 = *v26;
  *v26 = v25;

  return v16;
}

id sub_10000A944(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

void sub_10000A988()
{
  *(void *)&v0[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_package] = 0;
  uint64_t v1 = &v0[OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_viewState];
  uint64_t v2 = sub_10002A6B4();
  uint64_t v4 = *(void *)v2;
  uint64_t v3 = *((void *)v2 + 1);
  *(void *)uint64_t v1 = v4;
  *((void *)v1 + 1) = v3;
  swift_bridgeObjectRetain();

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_10000AA88()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  uint64_t v6 = v0;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v28 = swift_slowAlloc();
    uint64_t v30 = v28;
    *(_DWORD *)uint64_t v9 = 136315650;
    uint64_t v29 = sub_10001CEC4(0xD000000000000010, 0x8000000100036A10, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v29 = sub_10001CEC4(*(void *)&aLeading_1[8 * *((char *)v6 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role)], qword_10002FEF8[*((char *)v6 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role)], &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    uint64_t v10 = swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 22) = 2080;
    uint64_t v11 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v6) + 0x80))(v10);
    uint64_t v29 = sub_10001CEC4(v11, v12, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s role=%s viewState=%s", (uint8_t *)v9, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v13 = (objc_class *)type metadata accessor for RPSessionAccessoryView();
  v31.receiver = v6;
  v31.super_class = v13;
  [super layoutSubviews];
  uint64_t v15 = *(uint64_t (**)(void))((swift_isaMask & *v6) + 0x68);
  uint64_t v16 = ((uint64_t (*)(id))v15)(v14);
  if (v16)
  {
    v17 = (void *)v16;
    (*(void (**)(void))((swift_isaMask & *v6) + 0x80))();
    NSString v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v17 setState:v18];
  }
  uint64_t v19 = (void *)v15();
  if (v19)
  {
    uint64_t v20 = v19;
    [v19 sizeToFit];
  }
  uint64_t v21 = v15();
  if (v21)
  {
    id v22 = (void *)v21;
    [v6 bounds];
    double MidX = CGRectGetMidX(v32);
    [v6 bounds];
    [v22 setCenter:MidX, CGRectGetMidY(v33)];
  }
  NSString v24 = (void *)v15();
  if (v24)
  {
    id v25 = v24;
    [v24 setAlpha:*(double *)sub_10002A144()];
  }
  v26 = (void *)v15();
  [v6 insertSubview:v26 above:v6];
}

double sub_10000AFC4()
{
  int v1 = *((unsigned __int8 *)v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role);
  if (*((unsigned char *)v0 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role) && v1 != 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
    uint64_t v3 = swift_bridgeObjectRelease();
    if ((v2 & 1) == 0)
    {
      uint64_t v4 = *(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x80);
      uint64_t v5 = v4(v3);
      uint64_t v7 = v6;
      os_log_type_t v8 = sub_10002A744();
      if (v5 == *(void *)v8 && v7 == *((void *)v8 + 1)) {
        goto LABEL_17;
      }
      char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
      uint64_t v11 = swift_bridgeObjectRelease();
      if (v10) {
        goto LABEL_18;
      }
      uint64_t v12 = v4(v11);
      uint64_t v14 = v13;
      uint64_t v15 = sub_10002A768();
      if (v12 == *(void *)v15 && v14 == *((void *)v15 + 1))
      {
LABEL_17:
        swift_bridgeObjectRelease();
      }
      else
      {
        char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v17 & 1) == 0)
        {
LABEL_20:
          if (v1)
          {
            char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
            uint64_t v21 = swift_bridgeObjectRelease();
            if ((v20 & 1) == 0)
            {
LABEL_22:
              uint64_t v22 = v4(v21);
              uint64_t v24 = v23;
              id v25 = sub_10002A724();
              if (v22 == *(void *)v25 && v24 == *((void *)v25 + 1))
              {
                swift_bridgeObjectRelease();
              }
              else
              {
                char v27 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                if ((v27 & 1) == 0) {
                  goto LABEL_46;
                }
              }
              if (v1 == 1)
              {
                swift_bridgeObjectRelease();
              }
              else
              {
                char v42 = _stringCompareWithSmolCheck(_:_:expecting:)();
                swift_bridgeObjectRelease();
                if ((v42 & 1) == 0)
                {
LABEL_46:
                  double v18 = *(double *)sub_10002A00C();
                  goto LABEL_47;
                }
              }
              double v28 = *(double *)sub_10002A00C();
              uint64_t v29 = (double *)sub_10002A040();
              goto LABEL_30;
            }
          }
          else
          {
            uint64_t v21 = swift_bridgeObjectRelease();
          }
          uint64_t v30 = v4(v21);
          uint64_t v32 = v31;
          CGRect v33 = sub_10002A70C();
          if (v30 != *v33 || v32 != v33[1])
          {
            char v35 = _stringCompareWithSmolCheck(_:_:expecting:)();
            uint64_t v36 = swift_bridgeObjectRelease();
            if (v35) {
              goto LABEL_40;
            }
            uint64_t v37 = v4(v36);
            uint64_t v39 = v38;
            v40 = sub_10002A6F4();
            if (v37 != *v40 || v39 != v40[1])
            {
              char v44 = _stringCompareWithSmolCheck(_:_:expecting:)();
              uint64_t v45 = swift_bridgeObjectRelease();
              if (v44) {
                goto LABEL_40;
              }
              uint64_t v46 = v4(v45);
              uint64_t v48 = v47;
              v49 = sub_10002A6DC();
              if (v46 != *v49 || v48 != v49[1])
              {
                char v50 = _stringCompareWithSmolCheck(_:_:expecting:)();
                uint64_t v51 = swift_bridgeObjectRelease();
                if (v50) {
                  goto LABEL_40;
                }
                uint64_t v52 = v4(v51);
                uint64_t v54 = v53;
                v55 = sub_10002A724();
                if (v52 != *(void *)v55 || v54 != *((void *)v55 + 1))
                {
                  char v56 = _stringCompareWithSmolCheck(_:_:expecting:)();
                  uint64_t v21 = swift_bridgeObjectRelease();
                  if ((v56 & 1) == 0) {
                    goto LABEL_22;
                  }
LABEL_40:
                  double v41 = *(double *)sub_10002A00C();
                  double v18 = v41 + *(double *)sub_10002A02C();
                  goto LABEL_47;
                }
              }
            }
          }
          swift_bridgeObjectRelease();
          goto LABEL_40;
        }
      }
LABEL_18:
      if (v1)
      {
        char v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v19 & 1) == 0) {
          goto LABEL_20;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      double v28 = *(double *)sub_10002A00C();
      uint64_t v29 = (double *)sub_10002A02C();
LABEL_30:
      double v18 = v28 - *v29;
LABEL_47:
      sub_10002A020();
      return v18;
    }
  }
  double v18 = *(double *)sub_10002A068();
  sub_10002A074();
  return v18;
}

uint64_t sub_10000B458()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_10000B490()
{
  return [*(id *)(v0 + 16) invalidateIntrinsicContentSize];
}

uint64_t sub_10000B4A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000B4B0()
{
  return swift_release();
}

id sub_10000B4B8(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return [v9 initWithFrame:a1, a2, a3, a4];
}

void sub_10000B51C()
{
}

id sub_10000B57C(uint64_t a1)
{
  return sub_10001C5B0(a1, type metadata accessor for RPSessionAccessoryView);
}

uint64_t sub_10000B5E8(char a1)
{
  return *(void *)&aIdle_1[8 * a1];
}

uint64_t sub_10000B608(char *a1, char *a2)
{
  return sub_10000A124(*a1, *a2);
}

Swift::Int sub_10000B614()
{
  return sub_10000A3C8();
}

uint64_t sub_10000B620()
{
  return sub_10000A2B0();
}

Swift::Int sub_10000B628()
{
  return sub_10000A3C8();
}

unint64_t sub_10000B630@<X0>(Swift::String *a1@<X0>, unsigned char *a2@<X8>)
{
  unint64_t result = sub_10001D7A0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10000B660@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10000B5E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_10000B690()
{
  return v0;
}

uint64_t sub_10000B6E0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10000B774(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_10000B7C0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000B81C()
{
  return 2;
}

uint64_t sub_10000B86C()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10000B900(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_10000B94C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000B9A8()
{
  return 3;
}

uint64_t sub_10000B9F8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10000BA8C(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_10000BAD8())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000BB34()
{
  return 4;
}

uint64_t sub_10000BB84()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10000BC18(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_10000BC64())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000BCC0()
{
  return 0x100000;
}

uint64_t sub_10000BD10()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10000BDA4(uint64_t a1)
{
  uint64_t v3 = (void *)(v1
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_10000BDF0())()
{
  return j_j__swift_endAccess;
}

double sub_10000BE4C()
{
  return *(double *)sub_10002A0F4();
}

double sub_10000BEB0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_10000BF4C(double a1)
{
  uint64_t v3 = (double *)(v1
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_10000BFA0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000BFFC()
{
  return 0;
}

uint64_t sub_10000C008()
{
  return sub_10000D230(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_sessionID);
}

uint64_t sub_10000C014(uint64_t a1, uint64_t a2)
{
  return sub_10000D30C(a1, a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_sessionID);
}

uint64_t (*sub_10000C020())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000C07C()
{
  return 666;
}

uint64_t sub_10000C0CC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10000C160(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors);
  uint64_t result = swift_beginAccess();
  *uint64_t v3 = a1;
  return result;
}

uint64_t (*sub_10000C1AC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000C208()
{
  uint64_t v0 = SBUISystemApertureElementIdentifierScreenRecording;
  id v1 = SBUISystemApertureElementIdentifierScreenRecording;
  return v0;
}

void *sub_10000C244()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_elementIdentifier);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_10000C2A0(void *a1)
{
}

uint64_t (*sub_10000C2AC())()
{
  return j_j__swift_endAccess;
}

char *sub_10000C308()
{
  return sub_10000C3A0(0);
}

void *sub_10000C320()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView);
  id v2 = v1;
  return v1;
}

char *sub_10000C350()
{
  return sub_10000C3A0(1);
}

void *sub_10000C368()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView);
  id v2 = v1;
  return v1;
}

char *sub_10000C398()
{
  return sub_10000C3A0(2);
}

char *sub_10000C3A0(int a1)
{
  id v2 = objc_allocWithZone((Class)type metadata accessor for RPSessionAccessoryView());
  return sub_10000A4C0(a1);
}

void *sub_10000C3E4()
{
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView);
  id v2 = v1;
  return v1;
}

id sub_10000C414()
{
  id v0 = objc_allocWithZone((Class)UILabel);

  return [v0 init];
}

id sub_10000C44C()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_timerLabel);
  swift_beginAccess();
  id v2 = *v1;

  return v2;
}

void sub_10000C4A4(void *a1)
{
}

uint64_t (*sub_10000C4B0())()
{
  return j_j__swift_endAccess;
}

id sub_10000C50C()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel));
}

void *sub_10000C51C()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingPackageView);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_10000C56C(void *a1)
{
}

uint64_t (*sub_10000C578())()
{
  return j_j__swift_endAccess;
}

void *sub_10000C5D4()
{
  id v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingPackageView);
  swift_beginAccess();
  id v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_10000C624(void *a1)
{
}

uint64_t (*sub_10000C630())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000C68C()
{
  return 1;
}

uint64_t sub_10000C694()
{
  id v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_recordingState);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_10000C6DC(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_recordingState);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_10000C728())()
{
  return j_j__swift_endAccess;
}

id sub_10000C784()
{
  return sub_10000C9F8(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___buttonStackView, (Class *)UIStackView_ptr);
}

uint64_t sub_10000C798(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___buttonStackView) = a1;
  return _objc_release_x1();
}

void (*sub_10000C7AC(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_10000C784();
  return sub_10000C7F4;
}

void sub_10000C7F4(uint64_t *a1, uint64_t a2)
{
}

id sub_10000C800()
{
  return sub_10000C9F8(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___viewButton, (Class *)SBUISystemApertureButton_ptr);
}

uint64_t sub_10000C814(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___viewButton) = a1;
  return _objc_release_x1();
}

void (*sub_10000C828(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_10000C800();
  return sub_10000C870;
}

void sub_10000C870(uint64_t *a1, uint64_t a2)
{
}

id sub_10000C87C()
{
  return sub_10000C9F8(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___deleteButton, (Class *)SBUISystemApertureButton_ptr);
}

uint64_t sub_10000C890(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___deleteButton) = a1;
  return _objc_release_x1();
}

void (*sub_10000C8A4(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_10000C87C();
  return sub_10000C8EC;
}

void sub_10000C8EC(uint64_t *a1, uint64_t a2)
{
}

uint64_t sub_10000C8FC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D580(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosURL, a1);
}

uint64_t sub_10000C908(uint64_t a1)
{
  return sub_10000D724(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosURL);
}

uint64_t (*sub_10000C914())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000C970()
{
  return sub_10000D230(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosIdentifier);
}

uint64_t sub_10000C97C(uint64_t a1, uint64_t a2)
{
  return sub_10000D30C(a1, a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosIdentifier);
}

uint64_t (*sub_10000C988())()
{
  return j_j__swift_endAccess;
}

id sub_10000C9E4()
{
  return sub_10000C9F8(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___stopButton, (Class *)UIButton_ptr);
}

id sub_10000C9F8(uint64_t *a1, Class *a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v6 = [objc_allocWithZone(*a2) init];
    uint64_t v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    uint64_t v4 = 0;
  }
  id v8 = v4;
  return v5;
}

uint64_t sub_10000CA64(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___stopButton) = a1;
  return _objc_release_x1();
}

void (*sub_10000CA78(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_10000C9E4();
  return sub_10000CAC0;
}

void sub_10000CAC0(uint64_t *a1, uint64_t a2)
{
}

id sub_10000CACC()
{
  uint64_t v1 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint;
  uint64_t v2 = *(void **)((char *)v0
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint);
  if (v2)
  {
    id v3 = *(id *)((char *)v0
               + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint);
  }
  else
  {
    uint64_t v4 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x350))();
    id v5 = [v4 heightAnchor];

    id v6 = [v5 constraintEqualToConstant:*(double *)sub_10002A0C4()];
    uint64_t v7 = *(void **)((char *)v0 + v1);
    *(void *)((char *)v0 + v1) = v6;
    id v3 = v6;

    uint64_t v2 = 0;
  }
  id v8 = v2;
  return v3;
}

uint64_t sub_10000CBAC(uint64_t a1)
{
  *(void *)(v1
            + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint) = a1;
  return _objc_release_x1();
}

void (*sub_10000CBC0(id *a1))(uint64_t *a1, uint64_t a2)
{
  a1[1] = v1;
  *a1 = sub_10000CACC();
  return sub_10000CC08;
}

void sub_10000CC08(uint64_t *a1, uint64_t a2)
{
}

void sub_10000CC14(uint64_t *a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *a1;
  uint64_t v3 = a1[1];
  id v5 = *(void **)(v3 + *a3);
  *(void *)(v3 + *a3) = v4;
}

id sub_10000CC28()
{
  id v0 = objc_allocWithZone((Class)UIView);

  return [v0 init];
}

id sub_10000CC60()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customView);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_10000CCB8(void *a1)
{
}

void sub_10000CCC4(void *a1, void *a2)
{
  uint64_t v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  id v5 = *v4;
  void *v4 = a1;
}

uint64_t (*sub_10000CD14())()
{
  return j_j__swift_endAccess;
}

void *sub_10000CD70()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10000CD7C()
{
  return sub_10000CEE4();
}

uint64_t sub_10000CD88(uint64_t a1)
{
  return sub_10000CF38(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewLayoutConstraints);
}

uint64_t (*sub_10000CD94())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000CDF0()
{
  return sub_10000CEE4();
}

uint64_t sub_10000CDFC(uint64_t a1)
{
  return sub_10000CF38(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_accessoryViewLayoutConstraints);
}

uint64_t (*sub_10000CE08())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000CE64()
{
  return sub_10000CEE4();
}

uint64_t sub_10000CE70(uint64_t a1)
{
  return sub_10000CF38(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalViewLayoutConstraints);
}

uint64_t (*sub_10000CE7C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000CED8()
{
  return sub_10000CEE4();
}

uint64_t sub_10000CEE4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000CF2C(uint64_t a1)
{
  return sub_10000CF38(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewElementLayoutConstraints);
}

uint64_t sub_10000CF38(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  void *v4 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_10000CF88())()
{
  return j_j__swift_endAccess;
}

id sub_10000CFE4()
{
  id v0 = [self grayColor];

  return v0;
}

id sub_10000D030(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *sub_10000D078()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_keyColor);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_10000D0D4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  id v6 = *v5;
  *id v5 = a3;
  id v7 = a3;
}

void sub_10000D130(void *a1)
{
}

uint64_t (*sub_10000D13C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000D224()
{
  return sub_10000D230(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_associatedAppBundleIdentifier);
}

uint64_t sub_10000D230(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_10000D300(uint64_t a1, uint64_t a2)
{
  return sub_10000D30C(a1, a2, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_associatedAppBundleIdentifier);
}

uint64_t sub_10000D30C(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = (void *)(v3 + *a3);
  swift_beginAccess();
  *id v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_10000D368())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000D3C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for URL();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t sub_10000D574@<X0>(uint64_t a1@<X8>)
{
  return sub_10000D580(&OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL, a1);
}

uint64_t sub_10000D580@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *a1;
  swift_beginAccess();
  return sub_10001EC30(v4, a2, &qword_100047098);
}

uint64_t sub_10000D718(uint64_t a1)
{
  return sub_10000D724(a1, &OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL);
}

uint64_t sub_10000D724(uint64_t a1, void *a2)
{
  uint64_t v4 = v2 + *a2;
  swift_beginAccess();
  sub_10001D830(a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_10000D77C())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000D7D8()
{
  return 0;
}

void sub_10000D7E0(char a1)
{
  int v2 = a1 & 1;
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  id v9 = (char *)&v22 - v8;
  char v10 = (unsigned __int8 *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused);
  swift_beginAccess();
  int v11 = *v10;
  if (v11 != v2)
  {
    uint64_t v12 = sub_100023C44();
    uint64_t v13 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    if (v11)
    {
      v13(v9, v12, v3);
      uint64_t v14 = Logger.logObject.getter();
      os_log_type_t v15 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v14, v15))
      {
        uint64_t v16 = (uint8_t *)swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 136315138;
        uint64_t v23 = sub_10001CEC4(0x776F64746E756F63, 0xEF6465737561506ELL, &v24);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s RPControlCenter pause", v16, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
      id v17 = [self sharedInstance];
      sub_10002A1F0();
    }
    else
    {
      v13(v7, v12, v3);
      double v18 = Logger.logObject.getter();
      os_log_type_t v19 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v18, v19))
      {
        char v20 = (uint8_t *)swift_slowAlloc();
        uint64_t v24 = swift_slowAlloc();
        *(_DWORD *)char v20 = 136315138;
        uint64_t v23 = sub_10001CEC4(0x776F64746E756F63, 0xEF6465737561506ELL, &v24);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "%s RPControlCenter resume", v20, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      id v17 = [self sharedInstance];
      sub_10002A218();
    }
    swift_bridgeObjectRetain();
    NSString v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v17 countdownInterruptWithStatus:v21];
  }
}

uint64_t sub_10000DBF4()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused);
  swift_beginAccess();
  return *v1;
}

void sub_10000DC3C(char a1)
{
  uint64_t v3 = (char *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused);
  swift_beginAccess();
  char v4 = *v3;
  *uint64_t v3 = a1;
  sub_10000D7E0(v4);
}

void (*sub_10000DC98(void *a1))(uint64_t a1)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused;
  v3[3] = v1;
  v3[4] = v4;
  uint64_t v5 = (unsigned char *)(v1 + v4);
  swift_beginAccess();
  *((unsigned char *)v3 + 40) = *v5;
  return sub_10000DD18;
}

void sub_10000DD18(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  uint64_t v3 = *(void *)(*(void *)a1 + 24);
  uint64_t v2 = *(void *)(*(void *)a1 + 32);
  char v4 = *(unsigned char *)(*(void *)a1 + 40);
  char v5 = *(unsigned char *)(v3 + v2);
  *(unsigned char *)(v3 + v2) = v4;
  sub_10000D7E0(v5);

  free(v1);
}

void *sub_10000DD60()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_completionTimer);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_10000DDB0(void *a1)
{
}

uint64_t (*sub_10000DDBC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000DE18()
{
  uint64_t v1 = (unsigned __int8 *)(v0
                         + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_inExpandedButtonView);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_10000DE60(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_inExpandedButtonView);
  uint64_t result = swift_beginAccess();
  *id v3 = a1;
  return result;
}

uint64_t (*sub_10000DEAC())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10000DF08(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = os_variant_allows_internal_security_policies();
  if (result)
  {
    uint64_t v8 = (__CFString *)String._bridgeToObjectiveC()();
    id v9 = (__CFString *)String._bridgeToObjectiveC()();
    CFPropertyListRef v10 = CFPreferencesCopyAppValue(v8, v9);

    if (v10)
    {
      swift_beginAccess();
      *(unsigned char *)(a2 + 16) = 1;
    }
    uint64_t v11 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v11, v3);
    swift_retain();
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = swift_slowAlloc();
      uint64_t v15 = swift_slowAlloc();
      v16[1] = v10;
      uint64_t v19 = v15;
      *(_DWORD *)uint64_t v14 = 136315394;
      uint64_t v18 = sub_10001CEC4(0xD000000000000034, 0x8000000100037470, &v19);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v14 + 12) = 1024;
      swift_beginAccess();
      int v17 = *(unsigned __int8 *)(a2 + 16);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s hideStatusBar=%{BOOL}d", (uint8_t *)v14, 0x12u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_unknownObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
      swift_release();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  return result;
}

uint64_t sub_10000E1FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    _StringGuts._slowWithCString<A>(_:)();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0) {
      uint64_t v3 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
    }
    else {
      uint64_t v3 = _StringObject.sharedUTF8.getter();
    }
    sub_10001F088(v3);
    return swift_release();
  }
  v5[0] = a1;
  v5[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  sub_10000DF08((uint64_t)v5, a3);
  return swift_release();
}

void sub_10000E2F0()
{
  uint64_t v1 = type metadata accessor for UIButton.Configuration();
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v315 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v315 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  CFPropertyListRef v10 = *(void **)((char *)v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView);
  if (v10)
  {
    uint64_t v11 = *(void **)((char *)v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView);
    if (v11)
    {
      uint64_t v12 = *(void **)((char *)v0 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView);
      if (v12)
      {
        v336 = (char *)&v315 - v9;
        v337 = v0;
        v328 = v3;
        swift_getObjectType();
        uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
        uint64_t v14 = self;
        id v333 = v10;
        id v334 = v11;
        uint64_t v15 = v12;
        id v16 = [v14 bundleForClass:ObjCClassFromMetadata];
        id v17 = objc_allocWithZone((Class)BSUICAPackageView);
        NSString v18 = String._bridgeToObjectiveC()();
        uint64_t v19 = (uint64_t (*)(void))[v17 initWithPackageName:v18 inBundle:v16];

        if (v19)
        {
          v329 = v19;
          v330 = v15;
          id v20 = [v14 bundleForClass:ObjCClassFromMetadata];
          id v21 = objc_allocWithZone((Class)BSUICAPackageView);
          NSString v22 = String._bridgeToObjectiveC()();
          id v23 = [v21 initWithPackageName:v22 inBundle:v20];

          if (v23)
          {
            id v326 = v14;
            id v327 = v23;
            uint64_t v24 = *(uint64_t (**)(uint64_t))(*(void *)*sub_10001FBD4() + 128);
            uint64_t v25 = swift_retain();
            uint64_t v26 = v24(v25);
            uint64_t v28 = v27;
            swift_release();
            uint64_t v29 = v337;
            (*(void (**)(uint64_t, uint64_t))((swift_isaMask & *v337) + 0x208))(v26, v28);
            uint64_t v30 = sub_100023C44();
            uint64_t v31 = v336;
            (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v336, v30, v4);
            uint64_t v32 = v29;
            CGRect v33 = Logger.logObject.getter();
            os_log_type_t v34 = static os_log_type_t.default.getter();
            int v35 = v34;
            if (os_log_type_enabled(v33, v34))
            {
              uint64_t v36 = swift_slowAlloc();
              uint64_t v37 = (void *)swift_slowAlloc();
              v335 = (uint64_t (*)(void))swift_slowAlloc();
              v340[0] = (uint64_t)v335;
              *(_DWORD *)uint64_t v36 = 136315650;
              LODWORD(v332) = v35;
              uint64_t v339 = sub_10001CEC4(0x4C64694477656976, 0xED0000292864616FLL, v340);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *(_WORD *)(v36 + 12) = 2112;
              uint64_t v339 = (uint64_t)v32;
              uint64_t v38 = v32;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              *uint64_t v37 = v337;

              *(_WORD *)(v36 + 22) = 2080;
              uint64_t v39 = (*(uint64_t (**)(void))((swift_isaMask & *v38) + 0x200))();
              if (v40)
              {
                unint64_t v41 = v40;
              }
              else
              {
                uint64_t v39 = 1819047246;
                unint64_t v41 = 0xE400000000000000;
              }
              uint64_t v339 = sub_10001CEC4(v39, v41, v340);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();

              swift_bridgeObjectRelease();
              _os_log_impl((void *)&_mh_execute_header, v33, (os_log_type_t)v332, "%s self=%@ sessionID=%s", (uint8_t *)v36, 0x20u);
              sub_10001D7EC(&qword_1000470C0);
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_arrayDestroy();
              swift_slowDealloc();
              swift_slowDealloc();

              (*(void (**)(char *, uint64_t))(v5 + 8))(v336, v4);
            }
            else
            {

              (*(void (**)(char *, uint64_t))(v5 + 8))(v31, v4);
            }
            id v49 = v333;
            id v48 = v334;
            char v50 = (objc_class *)type metadata accessor for RPSystemApertureElementViewController();
            v338.receiver = v32;
            v338.super_class = v50;
            v325 = v50;
            [super viewDidLoad];
            SBUISystemApertureControlEdgeSpacing();
            double v52 = v51;
            id v53 = [v32 view];
            uint64_t v54 = v330;
            if (v53)
            {
              v55 = v53;
              [v53 setTranslatesAutoresizingMaskIntoConstraints:0];

              uint64_t v56 = (swift_isaMask & *v32) + 848;
              v57 = *(uint64_t (**)(void))((swift_isaMask & *v32) + 0x350);
              v58 = (void *)v57();
              [v58 setTranslatesAutoresizingMaskIntoConstraints:0];

              [v49 setTranslatesAutoresizingMaskIntoConstraints:0];
              [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
              [v54 setTranslatesAutoresizingMaskIntoConstraints:0];
              id v59 = [v32 view];
              if (v59)
              {
                v60 = v59;
                v61 = (void *)v57();
                [v60 addSubview:v61];

                id v62 = [v32 view];
                if (v62)
                {
                  v63 = v62;
                  [v62 addSubview:v49];

                  id v64 = [v32 view];
                  if (v64)
                  {
                    v65 = v64;
                    [v64 addSubview:v48];

                    id v66 = [v32 view];
                    if (v66)
                    {
                      v67 = v66;
                      [v66 addSubview:v330];

                      v68 = (void *)v57();
                      v336 = (char *)v56;
                      v69 = v68;
                      id v70 = [v68 centerXAnchor];

                      id v71 = [v32 view];
                      if (v71)
                      {
                        v72 = v71;
                        id v73 = [v71 centerXAnchor];

                        id v74 = [v70 constraintEqualToAnchor:v73];
                        [v74 setActive:1];

                        v75 = (void *)v57();
                        id v76 = [v75 topAnchor];

                        id v77 = [v32 view];
                        v335 = v57;
                        if (v77)
                        {
                          v78 = v77;
                          id v79 = [v77 topAnchor];

                          id v80 = [v76 constraintEqualToAnchor:v79];
                          [v80 setActive:1];

                          uint64_t v81 = (swift_isaMask & *v32) + 800;
                          v82 = *(uint64_t (**)(void))((swift_isaMask & *v32) + 0x320);
                          v83 = (void *)v82();
                          [v83 setTranslatesAutoresizingMaskIntoConstraints:0];

                          v84 = (void *)v82();
                          id v85 = [v326 bundleForClass:swift_getObjCClassFromMetadata()];
                          NSString v86 = String._bridgeToObjectiveC()();
                          NSString v87 = String._bridgeToObjectiveC()();
                          id v88 = [v85 localizedStringForKey:v86 value:0 table:v87];

                          static String._unconditionallyBridgeFromObjectiveC(_:)();
                          NSString v89 = String._bridgeToObjectiveC()();
                          swift_bridgeObjectRelease();
                          [v84 setAccessibilityLabel:v89];

                          v90 = (void *)v82();
                          [v90 addTarget:v32 action:"stopButtonTapped" forControlEvents:64];

                          v91 = (void *)v82();
                          id v92 = [v91 layer];

                          [v92 setHitTestsAsOpaque:1];
                          v93 = (void *)v335();
                          uint64_t v331 = v81;
                          uint64_t v94 = v82();
                          v332 = v82;
                          v95 = (void *)v94;
                          [v93 addSubview:v94];

                          v96 = v329;
                          [v329 setTranslatesAutoresizingMaskIntoConstraints:0];
                          [v96 setUserInteractionEnabled:0];
                          v97 = *(uint64_t (**)(uint64_t (*)(void)))((swift_isaMask & *v32) + 0x268);
                          v98 = v96;
                          v325 = v98;
                          uint64_t v99 = v97(v96);
                          v100 = (void *)((uint64_t (*)(uint64_t))v82)(v99);
                          [v100 addSubview:v98];

                          id v101 = v327;
                          [v327 setTranslatesAutoresizingMaskIntoConstraints:0];
                          id v102 = v101;
                          [v102 setAlpha:*(double *)sub_10002A144()];

                          [v102 setUserInteractionEnabled:0];
                          v103 = *(uint64_t (**)(id))((swift_isaMask & *v32) + 0x280);
                          id v104 = v102;
                          id v324 = v104;
                          uint64_t v105 = v103(v101);
                          v106 = v335;
                          v107 = (void *)((uint64_t (*)(uint64_t))v335)(v105);
                          [v107 addSubview:v104];

                          uint64_t v108 = (swift_isaMask & *v32) + 584;
                          v109 = *(uint64_t (**)(void))((swift_isaMask & *v32) + 0x248);
                          v110 = (void *)v109();
                          [v110 setTranslatesAutoresizingMaskIntoConstraints:0];

                          v111 = (void *)v109();
                          sub_10002A3F4();
                          swift_bridgeObjectRetain();
                          NSString v112 = String._bridgeToObjectiveC()();
                          swift_bridgeObjectRelease();
                          [v111 setText:v112];

                          v113 = (void *)v109();
                          v114 = self;
                          id v115 = [v114 systemFontOfSize:*(double *)sub_10002A514() weight:UIFontWeightMedium];
                          [v113 setFont:v115];

                          v321 = v109;
                          v116 = (void *)v109();
                          [v116 setTextColor:*sub_10002A46C()];

                          v117 = (void *)v109();
                          [v117 setHidden:1];

                          v118 = (void *)v109();
                          [v118 sizeToFit];

                          v119 = (void *)v109();
                          uint64_t v320 = v108;
                          v120 = v119;
                          id v121 = [v119 layer];

                          [v121 setAllowsHitTesting:0];
                          v122 = (void *)v106();
                          v123 = (void *)v109();
                          [v122 addSubview:v123];

                          v124 = *(void **)((char *)v32
                                          + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel);
                          [v124 setTranslatesAutoresizingMaskIntoConstraints:0];
                          id v319 = self;
                          id v125 = [v319 whiteColor];
                          [v124 setTextColor:v125];

                          sub_10002A300();
                          swift_bridgeObjectRetain();
                          NSString v126 = String._bridgeToObjectiveC()();
                          swift_bridgeObjectRelease();
                          [v124 setText:v126];

                          id v127 = [v114 systemFontOfSize:*(double *)sub_10002A38C() weight:UIFontWeightMedium];
                          [v124 setFont:v127];

                          [v124 sizeToFit];
                          [v124 setHidden:1];
                          id v322 = v124;
                          id v128 = [v124 layer];
                          [v128 setAllowsHitTesting:0];

                          v129 = (void *)v106();
                          [v129 addSubview:v124];

                          v130 = (void *)((swift_isaMask & *v32) + 680);
                          v131 = *(uint64_t (**)(void))((swift_isaMask & *v32) + 0x2A8);
                          v132 = (void *)v131();
                          [v132 setTranslatesAutoresizingMaskIntoConstraints:0];

                          v133 = (void *)v131();
                          [v133 setAxis:0];

                          v134 = (void *)v131();
                          SBUISystemApertureInterItemSpacing();
                          [v134 setSpacing];

                          v135 = (void *)v131();
                          [v135 setAlignment:3];

                          v136 = (void *)v131();
                          id v326 = v130;
                          v137 = v136;
                          [v136 setHidden:1];

                          v138 = (void *)v106();
                          uint64_t v139 = v131();
                          v140 = v131;
                          v329 = v131;
                          v141 = (void *)v139;
                          [v138 addSubview:v139];

                          v142 = self;
                          id v143 = [v142 sbui_systemApertureTextButtonConfiguration];
                          sub_10002A7F0();
                          swift_bridgeObjectRetain();
                          NSString v144 = String._bridgeToObjectiveC()();
                          swift_bridgeObjectRelease();
                          [v143 setTitle:v144];

                          v318 = (double *)sub_10001F0B4(0, &qword_1000470A0);
                          id v317 = v143;
                          static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)();
                          sub_10001F0B4(0, &qword_1000470A8);
                          *(void *)(swift_allocObject() + 16) = v32;
                          v145 = v32;
                          UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
                          uint64_t v146 = UIButton.init(configuration:primaryAction:)();
                          uint64_t v147 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v145) + 0x2C8))(v146);
                          v148 = (void *)((swift_isaMask & *v145) + 704);
                          v149 = *(uint64_t (**)(void))((swift_isaMask & *v145) + 0x2C0);
                          v150 = (void *)((uint64_t (*)(uint64_t))v149)(v147);
                          [v150 setTranslatesAutoresizingMaskIntoConstraints:0];

                          v151 = (void *)v149();
                          LODWORD(v152) = 1148846080;
                          [v151 setContentHuggingPriority:0 forAxis:v152];

                          v153 = (void *)v149();
                          LODWORD(v154) = 1148846080;
                          [v153 setContentCompressionResistancePriority:0 forAxis:v154];

                          id v327 = v148;
                          v155 = (void *)v149();
                          v323 = v149;
                          v156 = v155;
                          [v155 setEnabled:0];

                          v157 = (void *)v140();
                          v158 = (void *)v149();
                          [v157 addArrangedSubview:v158];

                          id v159 = [v142 sbui_systemApertureTextButtonConfiguration];
                          sub_10002A928();
                          swift_bridgeObjectRetain();
                          NSString v160 = String._bridgeToObjectiveC()();
                          swift_bridgeObjectRelease();
                          [v159 setTitle:v160];

                          id v161 = v319;
                          id v162 = [v319 redColor];
                          [v159 setBaseBackgroundColor:v162];

                          id v163 = [v161 redColor];
                          [v159 setBaseForegroundColor:v163];

                          id v316 = v159;
                          static UIButton.Configuration._unconditionallyBridgeFromObjectiveC(_:)();
                          *(void *)(swift_allocObject() + 16) = v145;
                          v164 = v145;
                          UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)();
                          uint64_t v165 = UIButton.init(configuration:primaryAction:)();
                          uint64_t v166 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v164) + 0x2E0))(v165);
                          v167 = *(uint64_t (**)(void))((swift_isaMask & *v164) + 0x2D8);
                          uint64_t v168 = (swift_isaMask & *v164) + 728;
                          v169 = (void *)((uint64_t (*)(uint64_t))v167)(v166);
                          [v169 setTranslatesAutoresizingMaskIntoConstraints:0];

                          v170 = (void *)v167();
                          LODWORD(v171) = 1148846080;
                          [v170 setContentHuggingPriority:0 forAxis:v171];

                          v172 = (void *)v167();
                          LODWORD(v173) = 1148846080;
                          [v172 setContentCompressionResistancePriority:0 forAxis:v173];

                          v174 = (void *)v167();
                          [v174 setEnabled:0];

                          id v319 = v167;
                          v175 = (void *)v167();
                          v328 = (char *)v168;
                          v176 = v175;
                          [v175 setRole:3];

                          v177 = (void *)v329();
                          v178 = (void *)v167();
                          [v177 addArrangedSubview:v178];

                          sub_10001D7EC((uint64_t *)&unk_1000470B0);
                          uint64_t v179 = swift_allocObject();
                          *(_OWORD *)(v179 + 16) = xmmword_10002F7D0;
                          v180 = (void *)v179;
                          v181 = v332;
                          v182 = (void *)v332();
                          id v183 = [v182 topAnchor];

                          v184 = v335;
                          v185 = (void *)v335();
                          id v186 = [v185 topAnchor];

                          id v187 = [v183 constraintEqualToAnchor:v186 constant:*(double *)sub_10002A3CC()];
                          v180[4] = v187;
                          v188 = (void *)v181();
                          id v189 = [v188 widthAnchor];

                          id v190 = [v189 constraintEqualToConstant:*(double *)sub_10002A3A8()];
                          v180[5] = v190;
                          v191 = (void *)v181();
                          id v192 = [v191 heightAnchor];

                          id v193 = [v192 constraintEqualToConstant:*(double *)sub_10002A3C0()];
                          v180[6] = v193;
                          v194 = (void *)v181();
                          id v195 = [v194 trailingAnchor];

                          v196 = (void *)v184();
                          id v197 = [v196 trailingAnchor];

                          id v198 = [v195 constraintEqualToAnchor:v197 constant:-*(double *)sub_10002A3E0()];
                          v180[7] = v198;
                          v199 = v325;
                          id v200 = [(objc_class *)v325 trailingAnchor];
                          v201 = (void *)v181();
                          id v202 = [v201 trailingAnchor];

                          id v203 = [v200 constraintEqualToAnchor:v202];
                          v180[8] = v203;
                          id v204 = [(objc_class *)v199 topAnchor];
                          v205 = (void *)v181();
                          id v206 = [v205 topAnchor];

                          id v207 = [v204 constraintEqualToAnchor:v206];
                          v180[9] = v207;
                          id v208 = [(objc_class *)v199 leadingAnchor];
                          v209 = (void *)v181();
                          id v210 = [v209 leadingAnchor];

                          id v211 = [v208 constraintEqualToAnchor:v210];
                          v180[10] = v211;
                          id v212 = [(objc_class *)v199 bottomAnchor];
                          v213 = (void *)v181();
                          id v214 = [v213 bottomAnchor];

                          id v215 = [v212 constraintEqualToAnchor:v214];
                          v180[11] = v215;
                          id v216 = v324;
                          id v217 = [v324 topAnchor];
                          v218 = v335;
                          v219 = (void *)v335();
                          id v220 = [v219 topAnchor];

                          id v221 = [v217 constraintEqualToAnchor:v220 constant:*(double *)sub_10002A25C()];
                          v180[12] = v221;
                          id v222 = [v216 widthAnchor];
                          id v223 = [v222 constraintEqualToConstant:*(double *)sub_10002A520()];

                          v180[13] = v223;
                          v224 = v180;
                          id v225 = [v216 heightAnchor];
                          id v226 = [v225 constraintEqualToConstant:*(double *)sub_10002A52C()];

                          v180[14] = v226;
                          id v227 = [v216 leadingAnchor];
                          v228 = (void *)v218();
                          id v229 = [v228 leadingAnchor];

                          v318 = (double *)sub_10002A240();
                          id v230 = [v227 constraintEqualToAnchor:v229 constant:*v318];

                          v180[15] = v230;
                          v231 = v321;
                          v232 = (void *)v321();
                          id v233 = [v232 centerYAnchor];

                          id v234 = [v216 centerYAnchor];
                          id v235 = [v233 constraintEqualToAnchor:v234];

                          v224[16] = v235;
                          v236 = (void *)v231();
                          id v237 = [v236 leadingAnchor];

                          id v238 = [v216 trailingAnchor];
                          id v239 = [v237 constraintEqualToAnchor:v238 constant:*(double *)sub_10002A278()];

                          v224[17] = v239;
                          v240 = (void *)v231();
                          id v241 = [v240 trailingAnchor];

                          v242 = (void *)v332();
                          id v243 = [v242 leadingAnchor];

                          double v244 = -v52;
                          id v245 = [v241 constraintEqualToAnchor:v243 constant:v244];

                          v224[18] = v245;
                          id v246 = v322;
                          id v247 = [v322 bottomAnchor];
                          v248 = v335;
                          v249 = (void *)v335();
                          id v250 = [v249 topAnchor];

                          id v251 = [v247 constraintEqualToAnchor:v250 constant:*(double *)sub_10002A374()];
                          v224[19] = v251;
                          id v252 = [v246 leadingAnchor];
                          v253 = (void *)v248();
                          id v254 = [v253 leadingAnchor];

                          id v255 = [v252 constraintEqualToAnchor:v254 constant:*v318];
                          v224[20] = v255;
                          id v256 = [v246 trailingAnchor];
                          v257 = (void *)v332();
                          id v258 = [v257 leadingAnchor];

                          id v259 = [v256 constraintEqualToAnchor:v258 constant:v244];
                          v224[21] = v259;
                          v260 = v329;
                          v261 = (void *)v329();
                          id v262 = [v261 centerXAnchor];

                          v263 = (void *)v335();
                          id v264 = [v263 centerXAnchor];

                          id v265 = [v262 constraintEqualToAnchor:v264];
                          v224[22] = v265;
                          v266 = (void *)v260();
                          id v267 = [v266 widthAnchor];

                          id v268 = [v267 constraintEqualToConstant:*(double *)sub_10002AA04()];
                          v224[23] = v268;
                          v269 = v224;
                          v270 = (void *)v260();
                          id v271 = [v270 topAnchor];

                          v272 = v164;
                          v273 = (void *)v332();
                          id v274 = [v273 bottomAnchor];

                          id v275 = [v271 constraintEqualToAnchor:v274 constant:*(double *)sub_10002A9F0()];
                          v269[24] = v275;
                          v276 = v323;
                          v277 = (void *)v323();
                          id v278 = [v277 bottomAnchor];

                          v279 = v329;
                          v280 = (void *)v329();
                          id v281 = [v280 bottomAnchor];

                          id v282 = [v278 constraintEqualToAnchor:v281];
                          v269[25] = v282;
                          v283 = v269;
                          v284 = (void *)v276();
                          id v285 = [v284 topAnchor];

                          v286 = (void *)v279();
                          id v287 = [v286 topAnchor];

                          id v288 = [v285 constraintEqualToAnchor:v287];
                          v269[26] = v288;
                          v289 = (void *)v276();
                          id v290 = [v289 leadingAnchor];

                          v291 = (void *)v279();
                          id v292 = [v291 leadingAnchor];

                          id v293 = [v290 constraintEqualToAnchor:v292];
                          v269[27] = v293;
                          v294 = (uint64_t (*)(void))v319;
                          v295 = (void *)((uint64_t (*)(void))v319)();
                          id v296 = [v295 bottomAnchor];

                          v297 = (void *)v279();
                          id v298 = [v297 bottomAnchor];

                          id v299 = [v296 constraintEqualToAnchor:v298];
                          v283[28] = v299;
                          v300 = (void *)v294();
                          id v301 = [v300 topAnchor];

                          v302 = (void *)v279();
                          id v303 = [v302 topAnchor];

                          id v304 = [v301 constraintEqualToAnchor:v303];
                          v283[29] = v304;
                          v305 = (void *)v294();
                          id v306 = [v305 trailingAnchor];

                          v307 = (void *)v279();
                          id v308 = [v307 trailingAnchor];

                          id v309 = [v306 constraintEqualToAnchor:v308];
                          v283[30] = v309;
                          v340[0] = (uint64_t)v283;
                          specialized Array._endMutation()();
                          (*(void (**)(uint64_t))((swift_isaMask & *v272) + 0x3B8))(v340[0]);
                          v310 = self;
                          (*(void (**)(void))((swift_isaMask & *v272) + 0x3B0))();
                          sub_10001F0B4(0, (unint64_t *)&qword_1000476A0);
                          Class isa = Array._bridgeToObjectiveC()().super.isa;
                          swift_bridgeObjectRelease();
                          [v310 activateConstraints:isa];

                          id v312 = [v272 view];
                          if (v312)
                          {
                            v313 = v312;
                            v314 = (void *)v332();
                            [v313 bringSubviewToFront:v314];

                            return;
                          }
                          goto LABEL_34;
                        }
LABEL_33:
                        __break(1u);
LABEL_34:
                        __break(1u);
                        return;
                      }
LABEL_32:
                      __break(1u);
                      goto LABEL_33;
                    }
LABEL_31:
                    __break(1u);
                    goto LABEL_32;
                  }
LABEL_30:
                  __break(1u);
                  goto LABEL_31;
                }
LABEL_29:
                __break(1u);
                goto LABEL_30;
              }
            }
            else
            {
              __break(1u);
            }
            __break(1u);
            goto LABEL_29;
          }

          id v42 = v334;
          uint64_t v15 = v329;
          v43 = v330;
        }
        else
        {
          id v42 = v333;
          v43 = (uint64_t (*)(void))v334;
        }
      }
    }
  }
  uint64_t v44 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v44, v4);
  uint64_t v45 = Logger.logObject.getter();
  os_log_type_t v46 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v45, v46))
  {
    uint64_t v47 = (uint8_t *)swift_slowAlloc();
    v340[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v47 = 136315138;
    uint64_t v339 = sub_10001CEC4(0x4C64694477656976, 0xED0000292864616FLL, v340);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v45, v46, "%s error loading sub views", v47, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

id sub_100010AE4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v13 = sub_10001CEC4(0xD000000000000020, 0x8000000100036AB0, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  switch((*(unsigned __int8 (**)(uint64_t))((swift_isaMask & *v1) + 0x290))(v10))
  {
    case 7u:
      swift_bridgeObjectRelease();
      return sub_1000196B8();
    default:
      char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
      id result = (id)swift_bridgeObjectRelease();
      if (v11) {
        return sub_1000196B8();
      }
      return result;
  }
}

void sub_100010EAC(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView);
  if (v7)
  {
    os_log_type_t v8 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView);
    if (v8)
    {
      uint64_t v9 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView);
      if (v9)
      {
        id v33 = a1;
        uint64_t v10 = *(uint64_t (**)(void))((swift_isaMask & *v1) + 0x278);
        id v11 = v7;
        id v12 = v8;
        id v13 = v9;
        uint64_t v14 = v10();
        if (v14)
        {
          uint64_t v15 = (void *)v14;
          uint64_t v16 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x260))();
          if (v16)
          {
            id v17 = (void *)v16;
            NSString v18 = (void *)swift_allocObject();
            v18[2] = v1;
            v18[3] = v17;
            v18[4] = v15;
            v18[5] = v13;
            v18[6] = v11;
            v18[7] = v12;
            uint64_t v38 = sub_10001D98C;
            uint64_t v39 = v18;
            uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
            uint64_t v35 = 1107296256;
            uint64_t v36 = sub_100013668;
            uint64_t v37 = &unk_10003D328;
            uint64_t v19 = _Block_copy(&aBlock);
            id v32 = v11;
            id v31 = v12;
            id v20 = v13;
            id v21 = v1;
            id v22 = v17;
            id v23 = v15;
            swift_release();
            uint64_t v24 = swift_allocObject();
            *(void *)(v24 + 16) = v21;
            uint64_t v38 = sub_10001D99C;
            uint64_t v39 = (void *)v24;
            uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
            uint64_t v35 = 1107296256;
            uint64_t v36 = sub_100013668;
            uint64_t v37 = &unk_10003D378;
            uint64_t v25 = _Block_copy(&aBlock);
            uint64_t v26 = v21;
            swift_release();
            [v33 animateAlongsideTransition:v19 completion:v25];
            _Block_release(v25);
            _Block_release(v19);

            return;
          }

          id v11 = v12;
          id v12 = v13;
          id v13 = v15;
        }
      }
    }
  }
  uint64_t v27 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v27, v3);
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v30 = (uint8_t *)swift_slowAlloc();
    uint64_t aBlock = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315138;
    uint64_t v40 = sub_10001CEC4(0xD00000000000001DLL, 0x8000000100036AE0, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v28, v29, "%s error loading sub views", v30, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_100011324(void *a1, void *a2, void *a3, uint64_t a4, void *a5, void *a6)
{
  id v188 = a3;
  id v189 = a2;
  uint64_t v191 = type metadata accessor for Logger();
  uint64_t v190 = *(void *)(v191 - 8);
  uint64_t v10 = __chkstk_darwin(v191);
  id v192 = (char *)&v184 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v184 - v13;
  uint64_t v15 = *(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x170);
  uint64_t v16 = v15(v12);
  if (v16 == 4)
  {
    switch((*(unsigned __int8 (**)(void))((swift_isaMask & *a1) + 0x290))())
    {
      case 4u:
        swift_bridgeObjectRelease();
        goto LABEL_5;
      default:
        char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
        uint64_t v16 = swift_bridgeObjectRelease();
        if (v17)
        {
LABEL_5:
          uint64_t v18 = sub_100023C44();
          (*(void (**)(char *, uint64_t, uint64_t))(v190 + 16))(v14, v18, v191);
          uint64_t v19 = Logger.logObject.getter();
          os_log_type_t v20 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v19, v20))
          {
            id v21 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)id v21 = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, v20, "pause system session", v21, 2u);
            swift_slowDealloc();
          }

          (*(void (**)(char *, uint64_t))(v190 + 8))(v14, v191);
          id v22 = [self sharedInstance];
          [v22 pauseCurrentSystemSession];

          (*(void (**)(uint64_t))((swift_isaMask & *a1) + 0x298))(5);
          sub_10002A768();
          swift_bridgeObjectRetain();
          NSString v23 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          [v189 setState:v23];

          sub_10002A724();
          swift_bridgeObjectRetain();
          NSString v24 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          [v188 setState:v24];
        }
        break;
    }
  }
  uint64_t v25 = v15(v16);
  uint64_t v26 = v192;
  switch(v25)
  {
    case 1:
      switch((*(unsigned __int8 (**)(void))((swift_isaMask & *a1) + 0x290))())
      {
        case 7u:
          swift_bridgeObjectRelease();
          goto LABEL_40;
        default:
          char v81 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v81 & 1) == 0) {
            return;
          }
LABEL_40:
          uint64_t v82 = sub_100023C44();
          (*(void (**)(char *, uint64_t, uint64_t))(v190 + 16))(v26, v82, v191);
          v83 = (void *)swift_allocObject();
          v83[2] = a1;
          id v189 = a1;
          v84 = Logger.logObject.getter();
          LODWORD(v188) = static os_log_type_t.default.getter();
          uint64_t v85 = swift_allocObject();
          *(unsigned char *)(v85 + 16) = 32;
          uint64_t v86 = swift_allocObject();
          *(unsigned char *)(v86 + 16) = 8;
          uint64_t v87 = swift_allocObject();
          *(unsigned char *)(v87 + 16) = 64;
          uint64_t v88 = swift_allocObject();
          *(unsigned char *)(v88 + 16) = 8;
          uint64_t v89 = swift_allocObject();
          *(void *)(v89 + 16) = sub_10001F2D4;
          *(void *)(v89 + 24) = v83;
          uint64_t v90 = swift_allocObject();
          *(void *)(v90 + 16) = sub_10001F368;
          *(void *)(v90 + 24) = v89;
          sub_10001D7EC(&qword_1000473E0);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = xmmword_10002F7E0;
          *(void *)(inited + 32) = sub_10001F2EC;
          *(void *)(inited + 40) = v85;
          *(void *)(inited + 48) = sub_10001F570;
          *(void *)(inited + 56) = v86;
          *(void *)(inited + 64) = sub_10001CE5C;
          *(void *)(inited + 72) = 0;
          *(void *)(inited + 80) = sub_10001F570;
          *(void *)(inited + 88) = v87;
          *(void *)(inited + 96) = sub_10001F570;
          *(void *)(inited + 104) = v88;
          *(void *)(inited + 112) = sub_10001F390;
          *(void *)(inited + 120) = v90;
          id v187 = v83;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          swift_bridgeObjectRelease();
          int v92 = v188;
          if (os_log_type_enabled(v84, (os_log_type_t)v188))
          {
            uint64_t v93 = swift_slowAlloc();
            int v186 = v92;
            uint64_t v94 = (uint8_t *)v93;
            v185 = (void *)swift_slowAlloc();
            id v188 = (id)swift_slowAlloc();
            v194[0] = v188;
            *(_WORD *)uint64_t v94 = 514;
            v94[2] = 32;
            swift_release();
            v94[3] = 8;
            swift_release();
            id v193 = (void *)sub_10001CEC4(0xD00000000000001DLL, 0x8000000100036AE0, (uint64_t *)v194);
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            v94[12] = 64;
            swift_release();
            v94[13] = 8;
            swift_release();
            id v193 = v189;
            v95 = v189;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            void *v185 = a1;

            swift_release();
            swift_release();
            swift_release();
            _os_log_impl((void *)&_mh_execute_header, v84, (os_log_type_t)v186, "%s self=%@ inactive and recording completed, ending session", v94, 0x16u);
            sub_10001D7EC(&qword_1000470C0);
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_arrayDestroy();
            swift_slowDealloc();
            swift_slowDealloc();
          }
          else
          {

            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
            swift_release();
          }
          (*(void (**)(char *, uint64_t))(v190 + 8))(v192, v191);
          uint64_t v96 = *sub_10001FBD4();
          v97 = *(uint64_t (**)(uint64_t))((swift_isaMask & *v189) + 0x200);
          uint64_t v98 = swift_retain();
          uint64_t v99 = v97(v98);
          break;
      }
      goto LABEL_68;
    case 2:
      id v27 = [(id)a4 setHidden:0];
      switch((*(unsigned __int8 (**)(id))((swift_isaMask & *a1) + 0x290))(v27))
      {
        case 1u:
          swift_bridgeObjectRelease();
          goto LABEL_45;
        default:
          char v100 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if (v100)
          {
LABEL_45:
            sub_100014A90();
          }
          else if (sub_100013B70())
          {
            (*(void (**)(void))((swift_isaMask & *a1) + 0x418))(0);
          }
          id v31 = (char *)self;
          (*(void (**)(void))((swift_isaMask & *a1) + 0x368))();
          uint64_t v101 = sub_10001F0B4(0, (unint64_t *)&qword_1000476A0);
          Class isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v31 deactivateConstraints:isa];

          (*(void (**)(void))((swift_isaMask & *a1) + 0x380))();
          Class v103 = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v31 deactivateConstraints:v103];

          uint64_t v35 = *(uint64_t (**)(void))((swift_isaMask & *a1) + 0x398);
          unint64_t v104 = v35();
          uint64_t v105 = sub_10001CDFC(v104);
          uint64_t v106 = swift_bridgeObjectRelease();
          if (v105) {
            goto LABEL_59;
          }
          uint64_t v191 = v101;
          id v192 = v31;
          sub_10001D7EC((uint64_t *)&unk_1000470B0);
          uint64_t v107 = swift_allocObject();
          *(_OWORD *)(v107 + 16) = xmmword_10002F800;
          uint64_t v108 = (void *)a4;
          id v109 = [(id)a4 centerXAnchor];
          id v110 = [a1 view];
          if (!v110) {
            goto LABEL_109;
          }
          v111 = v110;
          id v112 = [v110 centerXAnchor];

          id v113 = [v109 constraintEqualToAnchor:v112];
          *(void *)(v107 + 32) = v113;
          id v114 = [v108 centerYAnchor];
          id v115 = [a1 view];
          if (!v115) {
            goto LABEL_110;
          }
          v116 = v115;
          id v117 = [v115 centerYAnchor];

          a4 = (uint64_t)[v114 constraintEqualToAnchor:v117];
          *(void *)(v107 + 40) = a4;
          v194[0] = (id)v107;
          specialized Array._endMutation()();
          uint64_t v118 = (*(uint64_t (**)(id))((swift_isaMask & *a1) + 0x3A0))(v194[0]);
          uint64_t v119 = ((uint64_t (*)(uint64_t))v35)(v118);
          unint64_t v120 = swift_bridgeObjectRetain();
          uint64_t v121 = sub_10001CDFC(v120);
          if (!v121) {
            goto LABEL_58;
          }
          uint64_t v122 = v121;
          if (v121 < 1) {
            goto LABEL_104;
          }
          a4 = 0;
          do
          {
            if ((v119 & 0xC000000000000001) != 0) {
              id v123 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v123 = *(id *)(v119 + 8 * a4 + 32);
            }
            id v125 = v123;
            ++a4;
            LODWORD(v124) = 1144750080;
            [v123 setPriority:v124];
          }
          while (v122 != a4);
LABEL_58:
          uint64_t v106 = swift_bridgeObjectRelease_n();
          id v31 = v192;
LABEL_59:
          unint64_t v126 = ((uint64_t (*)(uint64_t))v35)(v106);
          if (!sub_10001CDFC(v126)) {
            goto LABEL_95;
          }
          if ((v126 & 0xC000000000000001) != 0)
          {
            id v127 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if (!*(void *)((v126 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_100;
            }
            id v127 = *(id *)(v126 + 32);
          }
          id v128 = v127;
          swift_bridgeObjectRelease();
          unsigned __int8 v129 = [v128 isActive];

          if ((v129 & 1) == 0) {
            goto LABEL_64;
          }
          return;
      }
    case 3:
      id v28 = objc_msgSend(objc_msgSend(a1, "systemApertureElementContext"), "transitionContext");
      swift_unknownObjectRelease();
      if (v28)
      {
        unsigned int v29 = [v28 isUserInitiated];
      }
      else
      {
        unsigned int v29 = 0;
      }
      v65 = *(unsigned __int8 (**)(void))((swift_isaMask & *a1) + 0x290);
      switch(v65())
      {
        case 7u:
          swift_bridgeObjectRelease();
          if ((v29 & 1) == 0) {
            goto LABEL_70;
          }
          goto LABEL_67;
        default:
          int v131 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v131 & v29) == 1)
          {
LABEL_67:
            uint64_t v96 = *sub_10001FBD4();
            v132 = *(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x200);
            uint64_t v133 = swift_retain();
            uint64_t v99 = v132(v133);
LABEL_68:
            (*(void (**)(uint64_t))(*(void *)v96 + 200))(v99);
            swift_release();
            goto LABEL_95;
          }
LABEL_70:
          [(id)a4 setHidden:1];
          [a5 setHidden:0];
          [a6 setHidden:0];
          [v189 setHidden:1];
          [v188 setHidden:1];
          id v134 = [*(id *)((char *)a1+ OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel) setHidden:1];
          v135 = (void *)(*(uint64_t (**)(id))((swift_isaMask & *a1) + 0x248))(v134);
          [v135 setHidden:1];

          uint64_t v136 = v65();
          id v187 = a6;
          switch(v136)
          {
            case 1:
              swift_bridgeObjectRelease();
              goto LABEL_73;
            default:
              char v137 = _stringCompareWithSmolCheck(_:_:expecting:)();
              swift_bridgeObjectRelease();
              if (v137)
              {
LABEL_73:
                sub_100014A90();
              }
              else if ((sub_100013B70() & 1) == 0)
              {
                goto LABEL_76;
              }
              (*(void (**)(void))((swift_isaMask & *a1) + 0x418))(0);
LABEL_76:
              a4 = self;
              (*(void (**)(void))((swift_isaMask & *a1) + 0x368))();
              uint64_t v138 = sub_10001F0B4(0, (unint64_t *)&qword_1000476A0);
              Class v139 = Array._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease();
              [(id)a4 deactivateConstraints:v139];

              (*(void (**)(void))((swift_isaMask & *a1) + 0x398))();
              Class v140 = Array._bridgeToObjectiveC()().super.isa;
              swift_bridgeObjectRelease();
              [(id)a4 deactivateConstraints:v140];

              uint64_t v35 = *(uint64_t (**)(void))((swift_isaMask & *a1) + 0x380);
              unint64_t v141 = v35();
              uint64_t v142 = sub_10001CDFC(v141);
              uint64_t v143 = swift_bridgeObjectRelease();
              if (v142) {
                goto LABEL_89;
              }
              uint64_t v191 = v138;
              id v192 = (char *)a4;
              sub_10001D7EC((uint64_t *)&unk_1000470B0);
              uint64_t v144 = swift_allocObject();
              *(_OWORD *)(v144 + 16) = xmmword_10002F7F0;
              id v145 = [a5 centerXAnchor];
              id v146 = [a1 view];
              if (!v146) {
                goto LABEL_111;
              }
              uint64_t v147 = v146;
              v148 = a5;
              id v149 = [v146 SBUISA_systemApertureLeadingConcentricContentLayoutGuide];

              id v150 = [v149 centerXAnchor];
              id v151 = [v145 constraintEqualToAnchor:v150];

              *(void *)(v144 + 32) = v151;
              id v152 = [v148 centerYAnchor];
              id v153 = [a1 view];
              if (!v153) {
                goto LABEL_112;
              }
              double v154 = v153;
              id v155 = [v153 SBUISA_systemApertureLeadingConcentricContentLayoutGuide];

              id v156 = [v155 centerYAnchor];
              id v157 = [v152 constraintEqualToAnchor:v156];

              *(void *)(v144 + 40) = v157;
              id v158 = v187;
              id v159 = [v187 centerXAnchor];
              id v160 = [a1 view];
              if (!v160) {
                goto LABEL_113;
              }
              id v161 = v160;
              id v162 = [v160 SBUISA_systemApertureTrailingConcentricContentLayoutGuide];

              id v163 = [v162 centerXAnchor];
              id v164 = [v159 constraintEqualToAnchor:v163];

              *(void *)(v144 + 48) = v164;
              id v165 = [v158 centerYAnchor];
              id v166 = [a1 view];
              if (!v166) {
                goto LABEL_114;
              }
              v167 = v166;
              id v168 = [v166 SBUISA_systemApertureTrailingConcentricContentLayoutGuide];

              id v169 = [v168 centerYAnchor];
              id v170 = [v165 constraintEqualToAnchor:v169];

              *(void *)(v144 + 56) = v170;
              v194[0] = (id)v144;
              specialized Array._endMutation()();
              uint64_t v171 = (*(uint64_t (**)(id))((swift_isaMask & *a1) + 0x388))(v194[0]);
              uint64_t v172 = ((uint64_t (*)(uint64_t))v35)(v171);
              unint64_t v173 = swift_bridgeObjectRetain();
              uint64_t v174 = sub_10001CDFC(v173);
              if (!v174) {
                goto LABEL_88;
              }
              uint64_t v175 = v174;
              if (v174 < 1) {
                goto LABEL_105;
              }
              uint64_t v176 = 0;
              do
              {
                if ((v172 & 0xC000000000000001) != 0) {
                  id v177 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
                }
                else {
                  id v177 = *(id *)(v172 + 8 * v176 + 32);
                }
                uint64_t v179 = v177;
                ++v176;
                LODWORD(v178) = 1144750080;
                [v177 setPriority:v178];
              }
              while (v175 != v176);
LABEL_88:
              uint64_t v143 = swift_bridgeObjectRelease_n();
              a4 = (uint64_t)v192;
LABEL_89:
              unint64_t v180 = ((uint64_t (*)(uint64_t))v35)(v143);
              if (!sub_10001CDFC(v180)) {
                goto LABEL_95;
              }
              if ((v180 & 0xC000000000000001) != 0) {
                goto LABEL_101;
              }
              if (!*(void *)((v180 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                __break(1u);
LABEL_103:
                __break(1u);
LABEL_104:
                __break(1u);
LABEL_105:
                __break(1u);
LABEL_106:
                __break(1u);
LABEL_107:
                __break(1u);
LABEL_108:
                __break(1u);
LABEL_109:
                __break(1u);
LABEL_110:
                __break(1u);
LABEL_111:
                __break(1u);
LABEL_112:
                __break(1u);
LABEL_113:
                __break(1u);
LABEL_114:
                __break(1u);
                JUMPOUT(0x1000135B8);
              }
              id v181 = *(id *)(v180 + 32);
              break;
          }
          break;
      }
      goto LABEL_93;
    case 4:
      if (sub_100013B70())
      {
        (*(void (**)(uint64_t))((swift_isaMask & *a1) + 0x418))(1);
      }
      else
      {
        uint64_t v30 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *a1) + 0x248))();
        [v30 setHidden:0];

        [v188 setHidden:0];
      }
      [(id)a4 setHidden:1];
      [a5 setHidden:1];
      [a6 setHidden:1];
      [v189 setHidden:0];
      [*(id *)((char *)a1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel) setHidden:0];
      id v31 = (char *)self;
      (*(void (**)(void))((swift_isaMask & *a1) + 0x380))();
      uint64_t v32 = sub_10001F0B4(0, (unint64_t *)&qword_1000476A0);
      Class v33 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v31 deactivateConstraints:v33];

      (*(void (**)(void))((swift_isaMask & *a1) + 0x398))();
      Class v34 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v31 deactivateConstraints:v34];

      uint64_t v35 = *(uint64_t (**)(void))((swift_isaMask & *a1) + 0x368);
      unint64_t v36 = v35();
      uint64_t v37 = sub_10001CDFC(v36);
      uint64_t v38 = swift_bridgeObjectRelease();
      if (v37) {
        goto LABEL_30;
      }
      uint64_t v191 = v32;
      id v192 = v31;
      sub_10001D7EC((uint64_t *)&unk_1000470B0);
      uint64_t v39 = swift_allocObject();
      *(_OWORD *)(v39 + 16) = xmmword_10002F7F0;
      id v40 = [a1 view];
      if (!v40) {
        goto LABEL_107;
      }
      unint64_t v41 = v40;
      id v42 = [v40 widthAnchor];

      v43 = *(uint64_t (**)(void))((swift_isaMask & *a1) + 0x350);
      uint64_t v44 = (void *)v43();
      id v45 = [v44 widthAnchor];

      id v46 = [v42 constraintEqualToAnchor:v45];
      *(void *)(v39 + 32) = v46;
      id v47 = [a1 view];
      if (!v47) {
        goto LABEL_108;
      }
      id v48 = v47;
      id v49 = [v47 heightAnchor];

      char v50 = (void *)v43();
      id v51 = [v50 heightAnchor];

      id v52 = [v49 constraintEqualToAnchor:v51];
      *(void *)(v39 + 40) = v52;
      id v53 = (void *)v43();
      id v54 = [v53 widthAnchor];

      id v55 = [v54 constraintEqualToConstant:*(double *)sub_10002A0A8()];
      *(void *)(v39 + 48) = v55;
      *(void *)(v39 + 56) = (*(uint64_t (**)(void))((swift_isaMask & *a1) + 0x338))();
      v194[0] = (id)v39;
      specialized Array._endMutation()();
      uint64_t v56 = (*(uint64_t (**)(id))((swift_isaMask & *a1) + 0x370))(v194[0]);
      uint64_t v57 = ((uint64_t (*)(uint64_t))v35)(v56);
      unint64_t v58 = swift_bridgeObjectRetain();
      uint64_t v59 = sub_10001CDFC(v58);
      if (!v59) {
        goto LABEL_29;
      }
      uint64_t v60 = v59;
      if (v59 < 1) {
        goto LABEL_103;
      }
      uint64_t v61 = 0;
      do
      {
        if ((v57 & 0xC000000000000001) != 0) {
          id v62 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else {
          id v62 = *(id *)(v57 + 8 * v61 + 32);
        }
        id v64 = v62;
        ++v61;
        LODWORD(v63) = 1144750080;
        [v62 setPriority:v63];
      }
      while (v60 != v61);
LABEL_29:
      uint64_t v38 = swift_bridgeObjectRelease_n();
      id v31 = v192;
LABEL_30:
      id v66 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x338))(v38);
      id v67 = [a1 view];
      if (!v67) {
        goto LABEL_106;
      }
      v68 = v67;
      a4 = (uint64_t)[v67 SBUISA_systemApertureLeadingConcentricContentLayoutGuide];

      [(id)a4 layoutFrame];
      CGFloat v70 = v69;
      CGFloat v72 = v71;
      CGFloat v74 = v73;
      CGFloat v76 = v75;

      v195.origin.x = v70;
      v195.origin.y = v72;
      v195.size.width = v74;
      v195.size.height = v76;
      [v66 setConstant:CGRectGetHeight(v195)];

      unint64_t v77 = v35();
      if (sub_10001CDFC(v77))
      {
        if ((v77 & 0xC000000000000001) != 0)
        {
          id v78 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          goto LABEL_35;
        }
        if (*(void *)((v77 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          id v78 = *(id *)(v77 + 32);
LABEL_35:
          id v79 = v78;
          swift_bridgeObjectRelease();
          unsigned __int8 v80 = [v79 isActive];

          if (v80) {
            return;
          }
LABEL_64:
          v35();
          v130.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [v31 activateConstraints:v130.super.isa];
          goto LABEL_65;
        }
        __break(1u);
LABEL_100:
        __break(1u);
LABEL_101:
        id v181 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_93:
        v182 = v181;
        swift_bridgeObjectRelease();
        unsigned __int8 v183 = [v182 isActive];

        if ((v183 & 1) == 0)
        {
          v35();
          v130.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          [(id)a4 activateConstraints:v130.super.isa];
LABEL_65:
        }
      }
      else
      {
LABEL_95:
        swift_bridgeObjectRelease();
      }
      return;
    default:
      return;
  }
}

uint64_t sub_100013668(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

uint64_t sub_1000136C8(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = (uint64_t)[a1 isCancelled];
  if ((result & 1) == 0)
  {
    uint64_t v9 = *(uint64_t (**)(void))((swift_isaMask & *a2) + 0x170);
    if (v9() == 3 || (uint64_t result = v9(), result == 2))
    {
      switch((*(unsigned __int8 (**)(void))((swift_isaMask & *a2) + 0x290))())
      {
        case 5u:
          swift_bridgeObjectRelease();
          goto LABEL_7;
        default:
          char v10 = _stringCompareWithSmolCheck(_:_:expecting:)();
          uint64_t result = swift_bridgeObjectRelease();
          if (v10)
          {
LABEL_7:
            uint64_t v19 = v9;
            uint64_t v11 = sub_100023C44();
            (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v11, v4);
            uint64_t v12 = a2;
            uint64_t v13 = Logger.logObject.getter();
            os_log_type_t v14 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v13, v14))
            {
              uint64_t v15 = (uint8_t *)swift_slowAlloc();
              uint64_t v18 = v5;
              *(_DWORD *)uint64_t v15 = 134217984;
              char v17 = v15 + 4;
              uint64_t v20 = ((uint64_t (*)(uint8_t *))v19)(v15);
              uint64_t v5 = v18;
              UnsafeMutableRawBufferPointer.copyMemory(from:)();

              _os_log_impl((void *)&_mh_execute_header, v13, v14, "resume system session in layout mode=%ld", v15, 0xCu);
              swift_slowDealloc();
            }
            else
            {

              uint64_t v13 = v12;
            }

            (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
            id v16 = [self sharedInstance];
            [v16 resumeCurrentSystemSession];

            uint64_t result = (*(uint64_t (**)(uint64_t))((swift_isaMask & (uint64_t)v12->isa) + 0x298))(4);
          }
          break;
      }
    }
  }
  return result;
}

uint64_t sub_100013B70()
{
  uint64_t v1 = *(unsigned __int8 (**)(void))((swift_isaMask & *v0) + 0x290);
  char v2 = 1;
  switch(v1())
  {
    case 1u:
      goto LABEL_8;
    default:
      char v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
      uint64_t v4 = swift_bridgeObjectRelease();
      if (v3)
      {
LABEL_5:
        char v2 = 1;
      }
      else
      {
        char v2 = 1;
        switch(((unsigned __int8 (*)(uint64_t))v1)(v4))
        {
          case 2u:
            break;
          default:
            char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
            uint64_t v6 = swift_bridgeObjectRelease();
            if (v5) {
              goto LABEL_5;
            }
            char v2 = 1;
            switch(((unsigned __int8 (*)(uint64_t))v1)(v6))
            {
              case 3u:
                goto LABEL_8;
              default:
                char v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
                break;
            }
            break;
        }
LABEL_8:
        swift_bridgeObjectRelease();
      }
      return v2 & 1;
  }
}

void sub_100013F74()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  char v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  os_log_type_t v8 = (char *)&v30 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v30 - v10;
  uint64_t v12 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x260))(v9);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    char v14 = sub_100013B70();
    uint64_t v15 = sub_100023C44();
    id v16 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    if (v14)
    {
      v16(v11, v15, v1);
      char v17 = Logger.logObject.getter();
      os_log_type_t v18 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v17, v18))
      {
        uint64_t v19 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        *(_DWORD *)uint64_t v19 = 136315138;
        uint64_t v32 = sub_10001CEC4(0xD000000000000012, 0x80000001000373F0, &v33);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s cancel countdown", v19, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v11, v1);
      id v20 = [self sharedInstance];
    }
    else
    {
      v16(v8, v15, v1);
      uint64_t v25 = Logger.logObject.getter();
      os_log_type_t v26 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v25, v26))
      {
        id v31 = v13;
        id v27 = (uint8_t *)swift_slowAlloc();
        uint64_t v33 = swift_slowAlloc();
        *(_DWORD *)id v27 = 136315138;
        uint64_t v32 = sub_10001CEC4(0xD000000000000012, 0x80000001000373F0, &v33);
        uint64_t v13 = v31;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s stop recording", v27, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v8, v1);
      sub_10002AA80();
      swift_bridgeObjectRetain();
      NSString v28 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v13 setState:v28 animated:1];

      sub_10001456C();
      id v20 = [self sharedInstance];
    }
    id v29 = v20;
    [v29 stopCurrentSession];
  }
  else
  {
    uint64_t v21 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v21, v1);
    id v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      NSString v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      *(_DWORD *)NSString v24 = 136315138;
      uint64_t v32 = sub_10001CEC4(0xD000000000000012, 0x80000001000373F0, &v33);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s error loading views", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
}

uint64_t sub_10001456C()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v30 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v28 = *(void *)(v8 - 8);
  uint64_t v29 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x260))(v9);
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = (*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x278))();
    if (v14)
    {
      uint64_t v15 = (void *)v14;
      sub_10001F0B4(0, &qword_100047128);
      id v16 = (void *)static OS_dispatch_queue.main.getter();
      char v17 = (void *)swift_allocObject();
      v17[2] = v15;
      v17[3] = v0;
      v17[4] = v13;
      aBlock[4] = (uint64_t)sub_10001ED10;
      aBlock[5] = (uint64_t)v17;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_100009DF0;
      aBlock[3] = (uint64_t)&unk_10003D990;
      os_log_type_t v18 = _Block_copy(aBlock);
      id v19 = v15;
      id v20 = v0;
      id v21 = v13;
      swift_release();
      static DispatchQoS.unspecified.getter();
      aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
      sub_10001E928(&qword_100047130, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_10001D7EC(&qword_100047138);
      sub_10001DABC();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v18);

      (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v5);
      return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v11, v29);
    }
  }
  uint64_t v23 = sub_100023C44();
  uint64_t v24 = v1;
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v23, v1);
  uint64_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    id v27 = (uint8_t *)swift_slowAlloc();
    aBlock[0] = swift_slowAlloc();
    *(_DWORD *)id v27 = 136315138;
    void aBlock[6] = sub_10001CEC4(0xD000000000000019, 0x8000000100037430, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s error loading views", v27, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v24);
}

uint64_t sub_100014A90()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v29 = *(void *)(v6 - 8);
  uint64_t v30 = v6;
  __chkstk_darwin(v6);
  uint64_t v28 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v27 = v2;
    id v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v25 = v1;
    aBlock[0] = v17;
    os_log_type_t v26 = v5;
    *(_DWORD *)id v16 = 136315138;
    uint64_t v31 = sub_10001CEC4(0xD00000000000001ALL, 0x80000001000373D0, aBlock);
    uint64_t v5 = v26;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v1 = v25;
    swift_slowDealloc();
    uint64_t v2 = v27;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_10001F0B4(0, &qword_100047128);
  os_log_type_t v18 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v1;
  aBlock[4] = (uint64_t)sub_10001ECA4;
  aBlock[5] = v19;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100009DF0;
  aBlock[3] = (uint64_t)&unk_10003D940;
  id v20 = _Block_copy(aBlock);
  id v21 = v1;
  swift_release();
  id v22 = v28;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_10001E928(&qword_100047130, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10001D7EC(&qword_100047138);
  sub_10001DABC();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v22, v30);
}

uint64_t sub_100014F1C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v57 - v7;
  uint64_t v9 = (void *)sub_100023C44();
  uint64_t v10 = *(void (**)(char *, void *, uint64_t))(v3 + 16);
  v10(v8, v9, v2);
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  BOOL v13 = os_log_type_enabled(v11, v12);
  uint64_t v59 = v3;
  uint64_t v60 = (void (*)(id, id, uint64_t))v10;
  id v61 = v9;
  id v62 = v6;
  if (v13)
  {
    uint64_t v57 = v1;
    os_log_type_t v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v64 = swift_slowAlloc();
    *(_DWORD *)os_log_type_t v14 = 136315138;
    uint64_t v63 = sub_10001CEC4(0xD000000000000016, 0x80000001000373B0, &v64);
    uint64_t v1 = v57;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s", v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  unint64_t v58 = *(void (**)(char *, uint64_t))(v3 + 8);
  v58(v8, v2);
  uint64_t v15 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView);
  if (!v15) {
    goto LABEL_11;
  }
  type metadata accessor for RPSessionAccessoryView();
  uint64_t v16 = swift_dynamicCastClass();
  if (!v16) {
    goto LABEL_11;
  }
  uint64_t v17 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView);
  if (v17
    && (os_log_type_t v18 = (void *)v16, (v19 = swift_dynamicCastClass()) != 0)
    && (id v20 = *(void **)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView)) != 0
    && (v21 = (void *)v19, (uint64_t v22 = swift_dynamicCastClass()) != 0))
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = v21;
    uint64_t v25 = *(unsigned __int8 (**)(void))((swift_isaMask & *v1) + 0x290);
    id v62 = v15;
    os_log_type_t v26 = v1;
    id v61 = v17;
    id v27 = v20;
    uint64_t v28 = v26;
    switch(v25())
    {
      case 1u:
        id v46 = (uint64_t *)sub_10002A6DC();
        goto LABEL_19;
      case 2u:
        id v46 = (uint64_t *)sub_10002A6F4();
        goto LABEL_19;
      case 3u:
        id v46 = (uint64_t *)sub_10002A70C();
        goto LABEL_19;
      case 4u:
      case 5u:
        uint64_t v29 = (uint64_t *)sub_10002A744();
        uint64_t v30 = *v29;
        unint64_t v31 = v29[1];
        swift_bridgeObjectRetain();
        sub_1000155FC(v18, v30, v31);
        swift_bridgeObjectRelease();
        uint64_t v32 = (uint64_t *)sub_10002A724();
        uint64_t v33 = *v32;
        unint64_t v34 = v32[1];
        swift_bridgeObjectRetain();
        sub_1000155FC(v24, v33, v34);
        swift_bridgeObjectRelease();
        uint64_t v36 = *v29;
        unint64_t v35 = v29[1];
        swift_bridgeObjectRetain();
        sub_1000155FC(v23, v36, v35);
        swift_bridgeObjectRelease();
        double v37 = *(double *)sub_10002AA20();
        double v38 = *(double *)sub_10002AA38();
        double v39 = *(double *)sub_10002AA50();
        id v40 = [objc_allocWithZone((Class)UIColor) initWithRed:v37 green:v38 blue:v39 alpha:*(double *)sub_10002AA68()];
        (*(void (**)(id))((swift_isaMask & *v28) + 0x3D0))(v40);
        goto LABEL_21;
      case 6u:
        id v47 = (uint64_t *)sub_10002A768();
        uint64_t v48 = *v47;
        unint64_t v49 = v47[1];
        swift_bridgeObjectRetain();
        sub_1000155FC(v18, v48, v49);
        swift_bridgeObjectRelease();
        char v50 = (uint64_t *)sub_10002A788();
        uint64_t v51 = *v50;
        unint64_t v52 = v50[1];
        goto LABEL_20;
      case 7u:
        goto LABEL_21;
      default:
        id v46 = (uint64_t *)sub_10002A6B4();
LABEL_19:
        char v50 = v46;
        uint64_t v53 = *v46;
        unint64_t v54 = v46[1];
        swift_bridgeObjectRetain();
        sub_1000155FC(v18, v53, v54);
        swift_bridgeObjectRelease();
        uint64_t v51 = *v50;
        unint64_t v52 = v50[1];
LABEL_20:
        swift_bridgeObjectRetain();
        sub_1000155FC(v24, v51, v52);
        swift_bridgeObjectRelease();
        uint64_t v56 = *v50;
        unint64_t v55 = v50[1];
        swift_bridgeObjectRetain();
        sub_1000155FC(v23, v56, v55);
        swift_bridgeObjectRelease();
LABEL_21:
        [v18 layoutSubviews];
        [v24 layoutSubviews];
        [v23 layoutSubviews];
        objc_msgSend(objc_msgSend(v28, "systemApertureElementContext"), "setElementNeedsUpdate");

        uint64_t result = swift_unknownObjectRelease();
        break;
    }
  }
  else
  {
LABEL_11:
    id v41 = v62;
    v60(v62, v61, v2);
    id v42 = Logger.logObject.getter();
    os_log_type_t v43 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v42, v43))
    {
      uint64_t v44 = (uint8_t *)swift_slowAlloc();
      uint64_t v64 = swift_slowAlloc();
      *(_DWORD *)uint64_t v44 = 136315138;
      uint64_t v63 = sub_10001CEC4(0xD000000000000016, 0x80000001000373B0, &v64);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "%s cannot get leading, trailing, and minimal views", v44, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return ((uint64_t (*)(id, uint64_t))v58)(v41, v2);
  }
  return result;
}

uint64_t sub_1000155FC(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  id v13 = a1;
  swift_bridgeObjectRetain_n();
  os_log_type_t v14 = v13;
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  int v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v29 = v4;
    uint64_t v19 = v18;
    uint64_t v27 = swift_slowAlloc();
    uint64_t v31 = v27;
    *(_DWORD *)uint64_t v19 = 136315650;
    uint64_t v28 = v8;
    uint64_t v30 = sub_10001CEC4(0xD00000000000001ELL, 0x8000000100037390, &v31);
    HIDWORD(v26) = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v19 + 12) = 2080;
    uint64_t v30 = sub_10001CEC4(*(void *)&aLeading_1[8 * *((char *)v14 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role)], qword_10002FEF8[*((char *)v14 + OBJC_IVAR____TtC14ReplayKitAngel22RPSessionAccessoryView_role)], &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_10001CEC4(a2, a3, &v31);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v15, BYTE4(v26), "%s role=%s viewState=%s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v28);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  id v20 = *(uint64_t (**)(uint64_t, unint64_t))((swift_isaMask & *v14) + 0x88);
  swift_bridgeObjectRetain();
  uint64_t v21 = v20(a2, a3);
  uint64_t v22 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v14) + 0x68))(v21);
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    NSString v24 = String._bridgeToObjectiveC()();
    [v23 setState:v24];
  }
  return sub_10001B858(v14, a2, a3);
}

uint64_t sub_1000159BC(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v20 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch((*(unsigned __int8 (**)(uint64_t))((swift_isaMask & *v2) + 0x290))(v10))
  {
    case 4u:
      swift_bridgeObjectRelease();
      goto LABEL_4;
    default:
      char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
      uint64_t result = swift_bridgeObjectRelease();
      if (v13)
      {
LABEL_4:
        sub_10001F0B4(0, &qword_100047128);
        uint64_t v15 = (void *)static OS_dispatch_queue.main.getter();
        os_log_type_t v16 = (void *)swift_allocObject();
        void v16[2] = v2;
        v16[3] = a1;
        v16[4] = a2;
        aBlock[4] = sub_10001D9A8;
        aBlock[5] = v16;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100009DF0;
        aBlock[3] = &unk_10003D3C8;
        int v17 = _Block_copy(aBlock);
        uint64_t v18 = v2;
        swift_bridgeObjectRetain();
        swift_release();
        static DispatchQoS.unspecified.getter();
        aBlock[0] = &_swiftEmptyArrayStorage;
        sub_10001E928(&qword_100047130, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_10001D7EC(&qword_100047138);
        sub_10001DABC();
        dispatch thunk of SetAlgebra.init<A>(_:)();
        OS_dispatch_queue.async(group:qos:flags:execute:)();
        _Block_release(v17);

        (*(void (**)(char *, uint64_t))(v20 + 8))(v7, v5);
        return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
      }
      return result;
  }
}

void sub_100015E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&aBlock[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v2) + 0x260))(v7);
  if (v10)
  {
    id v30 = v10;
    uint64_t v11 = swift_allocObject();
    *(unsigned char *)(v11 + 16) = 0;
    uint64_t v12 = self;
    sub_10001D7EC(&qword_100047148);
    uint64_t v13 = swift_allocObject();
    *(_OWORD *)(v13 + 16) = xmmword_10002F810;
    *(void *)(v13 + 32) = a1;
    *(void *)(v13 + 40) = a2;
    swift_bridgeObjectRetain();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v15 = [v12 fetchAssetsWithLocalIdentifiers:isa options:0];

    id v16 = [v15 firstObject];
    if (v16)
    {
      id v17 = [objc_allocWithZone((Class)PHImageRequestOptions) init];
      [v17 setVersion:2];
      [v17 setSynchronous:0];
      id v18 = [self defaultManager];
      uint64_t v19 = (void *)swift_allocObject();
      id v20 = v30;
      v19[2] = v11;
      v19[3] = v20;
      v19[4] = v2;
      aBlock[4] = (uint64_t)sub_10001DBB8;
      aBlock[5] = (uint64_t)v19;
      aBlock[0] = (uint64_t)_NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_1000162E0;
      aBlock[3] = (uint64_t)&unk_10003D440;
      uint64_t v21 = _Block_copy(aBlock);
      id v22 = v17;
      swift_retain();
      id v23 = v30;
      NSString v24 = v2;
      swift_release();
      [v18 requestImageForAsset:v16 targetSize:0 contentMode:v22 options:v21 resultHandler:0.0 0.0];

      _Block_release(v21);
      swift_release();
    }
    else
    {
      swift_release();
      id v29 = v30;
    }
  }
  else
  {
    uint64_t v25 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v25, v5);
    uint64_t v26 = Logger.logObject.getter();
    os_log_type_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315138;
      void aBlock[6] = sub_10001CEC4(0xD000000000000024, 0x8000000100036B40, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "%s error loading views", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
}

uint64_t sub_1000162E0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3) {
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a2;
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_10001638C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v6 = v5;
  uint64_t v67 = a5;
  uint64_t v71 = a4;
  uint64_t v59 = a3;
  uint64_t v60 = a2;
  unint64_t v70 = a1;
  uint64_t v73 = type metadata accessor for DispatchTime();
  uint64_t v69 = *(void *)(v73 - 8);
  uint64_t v7 = __chkstk_darwin(v73);
  id v62 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v68 = (char *)&v53 - v9;
  uint64_t v10 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v65 = *(void *)(v10 - 8);
  uint64_t v66 = v10;
  __chkstk_darwin(v10);
  uint64_t v64 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = type metadata accessor for DispatchQoS();
  uint64_t v63 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  id v61 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for URL();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v57 = v15;
  unint64_t v58 = (char *)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10001D7EC(&qword_100047098);
  __chkstk_darwin(v16 - 8);
  id v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = type metadata accessor for Logger();
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  id v22 = (char *)&v53 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v22, v23, v19);
  NSString v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "showSavedToPhotosBanner(withPhotosURL:identifier:sessionID:)", v26, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  (*(void (**)(uint64_t))((swift_isaMask & *v6) + 0x298))(7);
  unint64_t v54 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
  uint64_t v27 = v13;
  v54(v18, v70, v13);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v18, 0, 1, v13);
  (*(void (**)(char *))((swift_isaMask & *v6) + 0x2F8))(v18);
  uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & *v6) + 0x310);
  uint64_t v29 = v59;
  swift_bridgeObjectRetain();
  uint64_t v30 = v60;
  uint64_t v31 = v28(v60, v29);
  uint64_t v32 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v6) + 0x2C0))(v31);
  [v32 setHidden:0];

  uint64_t v33 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v6) + 0x2D8))();
  [v33 setHidden:0];

  uint64_t v56 = sub_10001F0B4(0, &qword_100047128);
  uint64_t v55 = static OS_dispatch_queue.main.getter();
  unint64_t v34 = v58;
  v54(v58, v70, v27);
  unint64_t v35 = (*(unsigned __int8 *)(v14 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  unint64_t v36 = (v57 + v35 + 7) & 0xFFFFFFFFFFFFFFF8;
  double v37 = (char *)swift_allocObject();
  uint64_t v38 = v71;
  *((void *)v37 + 2) = v6;
  *((void *)v37 + 3) = v38;
  uint64_t v39 = v67;
  *((void *)v37 + 4) = v67;
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(&v37[v35], v34, v27);
  id v40 = (uint64_t *)&v37[v36];
  uint64_t *v40 = v30;
  v40[1] = v29;
  id v78 = sub_10001E0FC;
  id v79 = v37;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v75 = 1107296256;
  CGFloat v76 = sub_100009DF0;
  unint64_t v77 = &unk_10003D490;
  id v41 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  id v42 = v6;
  swift_bridgeObjectRetain();
  swift_release();
  os_log_type_t v43 = v61;
  static DispatchQoS.unspecified.getter();
  uint64_t aBlock = (void **)&_swiftEmptyArrayStorage;
  uint64_t v60 = sub_10001E928(&qword_100047130, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  uint64_t v59 = sub_10001D7EC(&qword_100047138);
  unint64_t v70 = sub_10001DABC();
  uint64_t v44 = v64;
  uint64_t v45 = v66;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  id v46 = (void *)v55;
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v41);

  uint64_t v65 = *(void *)(v65 + 8);
  ((void (*)(char *, uint64_t))v65)(v44, v45);
  uint64_t v63 = *(void *)(v63 + 8);
  ((void (*)(char *, uint64_t))v63)(v43, v72);
  unint64_t v58 = (char *)static OS_dispatch_queue.main.getter();
  id v47 = v62;
  static DispatchTime.now()();
  sub_10002A12C();
  uint64_t v48 = v68;
  + infix(_:_:)();
  uint64_t v69 = *(void *)(v69 + 8);
  ((void (*)(char *, uint64_t))v69)(v47, v73);
  uint64_t v49 = swift_allocObject();
  *(void *)(v49 + 16) = v71;
  *(void *)(v49 + 24) = v39;
  id v78 = sub_10001E1CC;
  id v79 = (void *)v49;
  uint64_t aBlock = _NSConcreteStackBlock;
  uint64_t v75 = 1107296256;
  CGFloat v76 = sub_100009DF0;
  unint64_t v77 = &unk_10003D4E0;
  char v50 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  uint64_t aBlock = (void **)&_swiftEmptyArrayStorage;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v51 = v58;
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v50);

  ((void (*)(char *, uint64_t))v65)(v44, v45);
  ((void (*)(char *, uint64_t))v63)(v43, v72);
  return ((uint64_t (*)(char *, uint64_t))v69)(v48, v73);
}

uint64_t sub_100016D50(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v43 = a3;
  uint64_t v44 = a4;
  uint64_t v42 = a2;
  uint64_t v9 = sub_10001D7EC(&qword_100047098);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = swift_allocObject();
  *(unsigned char *)(v16 + 16) = 0;
  swift_retain();
  sub_10000E1FC(0xD000000000000011, 0x8000000100037450, v16);
  swift_beginAccess();
  char v17 = *(unsigned char *)(v16 + 16);
  swift_release();
  if (v17)
  {
    uint64_t v18 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v18, v12);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v39 = v11;
      uint64_t v21 = swift_slowAlloc();
      uint64_t v40 = a5;
      id v22 = (uint8_t *)v21;
      uint64_t v23 = swift_slowAlloc();
      uint64_t v41 = a6;
      uint64_t v46 = v23;
      *(_DWORD *)id v22 = 136315138;
      uint64_t v45 = sub_10001CEC4(0xD00000000000003CLL, 0x80000001000374B0, &v46);
      uint64_t v11 = v39;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s unhide system aperture to show saved to photos banner", v22, 0xCu);
      swift_arrayDestroy();
      a6 = v41;
      swift_slowDealloc();
      a5 = v40;
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    (*(void (**)(uint64_t))((swift_isaMask & *a1) + 0x1A8))(3);
    uint64_t v24 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x1C0))(4);
    os_log_type_t v25 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x248))(v24);
    NSString v26 = String._bridgeToObjectiveC()();
    [v25 setText:v26];

    uint64_t v27 = v44;
  }
  else
  {
    uint64_t v27 = v44;
  }
  uint64_t v28 = self;
  double v29 = *(double *)sub_10002A138();
  NSString v30 = String._bridgeToObjectiveC()();
  id v31 = [v28 scheduledTimerWithTimeInterval:a1 target:"handleCompletionTimeout" selector:v30 userInfo:0 repeats:v29];

  uint64_t v32 = (*(uint64_t (**)(id))((swift_isaMask & *a1) + 0x430))(v31);
  uint64_t v33 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x278))(v32);
  if (v33)
  {
    unint64_t v34 = v33;
    [v33 setAlpha:*(double *)sub_10002A10C()];
  }
  unint64_t v35 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *a1) + 0x248))();
  [v35 setAlpha:*(double *)sub_10002A10C()];

  (*(void (**)(uint64_t))((swift_isaMask & *a1) + 0x220))(682);
  uint64_t v36 = type metadata accessor for URL();
  uint64_t v37 = *(void *)(v36 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v11, v27, v36);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v37 + 56))(v11, 0, 1, v36);
  (*(void (**)(char *))((swift_isaMask & *a1) + 0x400))(v11);
  objc_msgSend(objc_msgSend(a1, "systemApertureElementContext"), "setElementNeedsUpdate");
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t))((swift_isaMask & *a1) + 0x4A8))(a5, a6);
}

uint64_t sub_100017424(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)v40 - v9;
  uint64_t v42 = sub_10001FBD4();
  uint64_t v11 = *(uint64_t (**)(uint64_t))(*(void *)*v42 + 128);
  uint64_t v12 = swift_retain();
  uint64_t v13 = v11(v12);
  uint64_t v15 = v14;
  swift_release();
  if (!v15)
  {
LABEL_7:
    uint64_t v18 = sub_100023C44();
    uint64_t v19 = v4;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v18, v4);
    os_log_type_t v20 = Logger.logObject.getter();
    os_log_type_t v21 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v20, v21))
    {
      id v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v22 = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "dropping previous session alert request", v22, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v19);
  }
  if (v13 == a1 && v15 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0) {
      goto LABEL_7;
    }
  }
  uint64_t v24 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v24, v4);
  os_log_type_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = swift_slowAlloc();
    uint64_t v41 = v4;
    uint64_t v28 = (uint8_t *)v27;
    uint64_t v29 = swift_slowAlloc();
    v40[1] = v29;
    *(_DWORD *)uint64_t v28 = 136315138;
    uint64_t v44 = v29;
    NSString v30 = v42;
    id v31 = *(uint64_t (**)(uint64_t))(*(void *)*v42 + 128);
    uint64_t v32 = swift_retain();
    uint64_t v33 = v31(v32);
    unint64_t v35 = v34;
    swift_release();
    if (v35) {
      uint64_t v36 = v33;
    }
    else {
      uint64_t v36 = 1819047246;
    }
    if (v35) {
      unint64_t v37 = v35;
    }
    else {
      unint64_t v37 = 0xE400000000000000;
    }
    uint64_t v43 = sub_10001CEC4(v36, v37, &v44);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "alert request for session=%s", v28, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v41);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    NSString v30 = v42;
  }
  uint64_t v38 = *(void (**)(uint64_t))(*(void *)*v30 + 192);
  uint64_t v39 = swift_retain();
  v38(v39);
  return swift_release();
}

uint64_t sub_100017970()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v37 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v36 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v33 - v14;
  uint64_t v16 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x278))(v13);
  if (v16)
  {
    char v17 = (void *)v16;
    uint64_t v34 = v2;
    uint64_t v18 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v15, v18, v8);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v19, v20))
    {
      os_log_type_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "startRecording()", v21, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
    sub_10001F0B4(0, &qword_100047128);
    id v22 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v1;
    *(void *)(v23 + 24) = v17;
    aBlock[4] = (uint64_t)sub_10001E1D4;
    aBlock[5] = v23;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100009DF0;
    aBlock[3] = (uint64_t)&unk_10003D530;
    uint64_t v24 = _Block_copy(aBlock);
    id v25 = v1;
    id v26 = v17;
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
    sub_10001E928(&qword_100047130, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10001D7EC(&qword_100047138);
    sub_10001DABC();
    uint64_t v27 = v34;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v24);

    (*(void (**)(char *, uint64_t))(v37 + 8))(v4, v27);
    return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v7, v36);
  }
  else
  {
    uint64_t v29 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v29, v8);
    NSString v30 = Logger.logObject.getter();
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315138;
      void aBlock[6] = sub_10001CEC4(0xD000000000000010, 0x8000000100036BA0, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s error loading views", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
}

void sub_100017F10(void *a1, void *a2)
{
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  *(unsigned char *)(v8 + 16) = 0;
  swift_retain();
  sub_10000E1FC(0xD000000000000011, 0x8000000100037450, v8);
  swift_beginAccess();
  int v9 = *(unsigned __int8 *)(v8 + 16);
  swift_release();
  if (v9 == 1)
  {
    uint64_t v10 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
    uint64_t v11 = Logger.logObject.getter();
    os_log_type_t v12 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      v24[0] = a2;
      aBlock[0] = v14;
      *(_DWORD *)uint64_t v13 = 136315138;
      v24[1] = sub_10001CEC4(0xD000000000000010, 0x8000000100036BA0, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s hide system aperture screen recording element", v13, 0xCu);
      swift_arrayDestroy();
      a2 = (void *)v24[0];
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    uint64_t v15 = swift_isaMask & *a1;
    uint64_t v16 = 1;
    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v15 = swift_isaMask & *a1;
    uint64_t v17 = 4;
    uint64_t v16 = 3;
  }
  (*(void (**)(uint64_t))(v15 + 424))(v16);
  (*(void (**)(uint64_t))((swift_isaMask & *a1) + 0x1C0))(v17);
  objc_msgSend(objc_msgSend(a1, "systemApertureElementContext"), "setElementNeedsUpdate");
  swift_unknownObjectRelease();
  uint64_t v18 = self;
  double v19 = *(double *)sub_10002A290();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = a2;
  *(void *)(v20 + 24) = a1;
  aBlock[4] = (uint64_t)sub_10001EFD0;
  aBlock[5] = v20;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100009DF0;
  aBlock[3] = (uint64_t)&unk_10003D9E0;
  os_log_type_t v21 = _Block_copy(aBlock);
  id v22 = a2;
  uint64_t v23 = a1;
  swift_release();
  [v18 animateWithDuration:24 delay:v21 options:0 animations:v19 completion:0.0];
  _Block_release(v21);
}

uint64_t sub_1000183B8()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "didTapStopButton()", v7, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return sub_10001456C();
}

uint64_t sub_100018564(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F0B4(0, &qword_100047128);
  os_log_type_t v12 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a1;
  v13[3] = a2;
  v13[4] = v2;
  aBlock[4] = sub_10001E21C;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100009DF0;
  aBlock[3] = &unk_10003D580;
  uint64_t v14 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  id v15 = v2;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_10001E928(&qword_100047130, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10001D7EC(&qword_100047138);
  sub_10001DABC();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
}

uint64_t sub_100018834(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  swift_bridgeObjectRetain_n();
  uint64_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v22 = v6;
    uint64_t v14 = v13;
    uint64_t v21 = swift_slowAlloc();
    uint64_t v24 = v21;
    *(_DWORD *)uint64_t v14 = 136315394;
    uint64_t v23 = sub_10001CEC4(0xD000000000000015, 0x8000000100037410, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_10001CEC4(a1, a2, &v24);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v22);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  id v15 = sub_10002A150();
  if (*(void *)v15 == a1 && *((void *)v15 + 1) == a2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v16 = 1;
LABEL_8:
    (*(void (**)(uint64_t))((swift_isaMask & *a3) + 0x298))(v16);
    return sub_100014F1C();
  }
  uint64_t v18 = sub_10002A178();
  if (*(void *)v18 == a1 && *((void *)v18 + 1) == a2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v16 = 2;
    goto LABEL_8;
  }
  double v19 = sub_10002A1A0();
  if (*(void *)v19 == a1 && *((void *)v19 + 1) == a2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v16 = 3;
    goto LABEL_8;
  }
  uint64_t v20 = sub_10002A1C8();
  if (*v20 == a1 && v20[1] == a2 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v16 = 4;
    goto LABEL_8;
  }
  return sub_100014F1C();
}

uint64_t sub_100018BF4(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100018C60()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v30 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v29 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = v1;
    *(_WORD *)id v15 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "handleCompletionTimeout()", v15, 2u);
    uint64_t v1 = v28;
    swift_slowDealloc();
  }

  uint64_t v16 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  uint64_t v17 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x428))(v16);
  if (!v17)
  {
    long long aBlock = 0u;
    long long v32 = 0u;
    return sub_10001E2A0((uint64_t)&aBlock, &qword_100047150);
  }
  uint64_t v18 = v17;
  id v19 = [v17 userInfo];

  if (v19)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v35, 0, sizeof(v35));
  }
  sub_10001E228((uint64_t)v35, (uint64_t)&aBlock);
  if (!*((void *)&v32 + 1)) {
    return sub_10001E2A0((uint64_t)&aBlock, &qword_100047150);
  }
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    long long v21 = v35[0];
    sub_10001F0B4(0, &qword_100047128);
    uint64_t v22 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v23 = swift_allocObject();
    *(void *)(v23 + 16) = v1;
    *(_OWORD *)(v23 + 24) = v21;
    uint64_t v33 = sub_10001E294;
    uint64_t v34 = v23;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v32 = sub_100009DF0;
    *((void *)&v32 + 1) = &unk_10003D5D0;
    uint64_t v24 = _Block_copy(&aBlock);
    id v25 = v1;
    swift_release();
    id v26 = v29;
    static DispatchQoS.unspecified.getter();
    *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
    sub_10001E928(&qword_100047130, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10001D7EC(&qword_100047138);
    sub_10001DABC();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v24);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v26, v6);
  }
  return result;
}

uint64_t sub_100019168(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v51 = a2;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v44 - v11;
  if (((*(uint64_t (**)(uint64_t))((swift_isaMask & *a1) + 0x440))(v10) & 1) != 0
    || (char v50 = sub_10001FBD4(),
        uint64_t v13 = *(uint64_t (**)(uint64_t))(*(void *)*v50 + 128),
        uint64_t v14 = swift_retain(),
        uint64_t v15 = v13(v14),
        uint64_t v17 = v16,
        uint64_t v18 = a3,
        swift_release(),
        !v17))
  {
LABEL_8:
    uint64_t v21 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v21, v5);
    uint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "dropping previous session finish request", v24, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  if (v15 == v51 && v17 == a3)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v20 & 1) == 0) {
      goto LABEL_8;
    }
  }
  uint64_t v26 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v12, v26, v5);
  uint64_t v27 = a1;
  uint64_t v28 = Logger.logObject.getter();
  os_log_type_t v29 = static os_log_type_t.default.getter();
  int v30 = v29;
  if (os_log_type_enabled(v28, v29))
  {
    uint64_t v31 = swift_slowAlloc();
    uint64_t v49 = (void *)swift_slowAlloc();
    uint64_t v48 = swift_slowAlloc();
    uint64_t v52 = (uint64_t)v27;
    uint64_t v53 = v48;
    *(_DWORD *)uint64_t v31 = 138412546;
    os_log_t v47 = v28;
    uint64_t v45 = v31 + 4;
    uint64_t v46 = &v53;
    long long v32 = v27;
    uint64_t v18 = a3;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v49 = a1;

    *(_WORD *)(v31 + 12) = 2080;
    uint64_t v33 = v50;
    uint64_t v34 = *(void *)*v50;
    LODWORD(v45) = v30;
    uint64_t v35 = *(uint64_t (**)(uint64_t))(v34 + 128);
    uint64_t v36 = swift_retain();
    uint64_t v37 = v35(v36);
    unint64_t v39 = v38;
    swift_release();
    if (v39) {
      uint64_t v40 = v37;
    }
    else {
      uint64_t v40 = 1819047246;
    }
    if (v39) {
      unint64_t v41 = v39;
    }
    else {
      unint64_t v41 = 0xE400000000000000;
    }
    uint64_t v52 = sub_10001CEC4(v40, v41, &v53);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    os_log_t v42 = v47;
    _os_log_impl((void *)&_mh_execute_header, v47, (os_log_type_t)v45, "self=%@ finish request for session=%s", (uint8_t *)v31, 0x16u);
    sub_10001D7EC(&qword_1000470C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
    uint64_t v33 = v50;
  }
  uint64_t v43 = *(void (**)(uint64_t, uint64_t))(*(void *)*v33 + 200);
  swift_retain();
  v43(v51, v18);
  return swift_release();
}

id sub_1000196B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v67 = *(void *)(v6 - 8);
  v68 = (uint64_t (*)(uint64_t))v6;
  __chkstk_darwin(v6);
  uint64_t v66 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  uint64_t v13 = Logger.logObject.getter();
  os_log_type_t v14 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v63 = (uint64_t)v1;
    uint64_t v16 = (uint8_t *)v15;
    uint64_t v17 = swift_slowAlloc();
    uint64_t v65 = (uint64_t (*)(void))v2;
    aBlock[0] = v17;
    uint64_t v64 = v5;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v69 = sub_10001CEC4(0x74747542776F6873, 0xED00002928736E6FLL, aBlock);
    uint64_t v5 = v64;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "%s", v16, 0xCu);
    swift_arrayDestroy();
    uint64_t v2 = (uint64_t)v65;
    swift_slowDealloc();
    uint64_t v1 = (void *)v63;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_10001F0B4(0, &qword_100047128);
  uint64_t v18 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v1;
  aBlock[4] = (uint64_t)sub_10001F398;
  aBlock[5] = v19;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100009DF0;
  aBlock[3] = (uint64_t)&unk_10003DBE8;
  char v20 = _Block_copy(aBlock);
  uint64_t v21 = v1;
  swift_release();
  uint64_t v22 = v66;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_10001E928(&qword_100047130, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_10001D7EC(&qword_100047138);
  sub_10001DABC();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t (*)(uint64_t)))(v67 + 8))(v22, v68);
  id v23 = [objc_allocWithZone((Class)UINotificationFeedbackGenerator) init];
  [v23 notificationOccurred:0];

  uint64_t v24 = (swift_isaMask & *v21) + 824;
  id v25 = *(uint64_t (**)(void))((swift_isaMask & *v21) + 0x338);
  uint64_t v26 = (void *)v25();
  uint64_t v27 = (double *)sub_10002A2BC();
  [v26 setConstant:*v27];

  id result = [v21 view];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  os_log_type_t v29 = result;
  uint64_t v65 = v25;
  uint64_t v66 = (char *)v24;
  [result layoutIfNeeded];

  int v30 = (char *)self;
  uint64_t v31 = *(void (**)(void))((swift_isaMask & *v21) + 0x368);
  uint64_t v67 = (swift_isaMask & *v21) + 872;
  v68 = (uint64_t (*)(uint64_t))v31;
  v31();
  uint64_t v63 = sub_10001F0B4(0, (unint64_t *)&qword_1000476A0);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v64 = v30;
  [v30 deactivateConstraints:isa];

  sub_10001D7EC((uint64_t *)&unk_1000470B0);
  uint64_t v33 = swift_allocObject();
  *(_OWORD *)(v33 + 16) = xmmword_10002F820;
  id result = [v21 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v34 = result;
  id v35 = [result widthAnchor];

  uint64_t v36 = *(uint64_t (**)(void))((swift_isaMask & *v21) + 0x350);
  uint64_t v37 = (void *)v36();
  id v38 = [v37 widthAnchor];

  id v39 = [v35 constraintEqualToAnchor:v38];
  *(void *)(v33 + 32) = v39;
  id result = [v21 view];
  if (result)
  {
    uint64_t v40 = result;
    id v41 = [result heightAnchor];

    id v42 = [v41 constraintEqualToConstant:*v27];
    *(void *)(v33 + 40) = v42;
    uint64_t v43 = (void *)v36();
    id v44 = [v43 heightAnchor];

    id v45 = [v44 constraintEqualToConstant:*v27];
    *(void *)(v33 + 48) = v45;
    uint64_t v46 = (void *)v36();
    id v47 = [v46 widthAnchor];

    id v48 = [v47 constraintEqualToConstant:*(double *)sub_10002A0A8()];
    *(void *)(v33 + 56) = v48;
    *(void *)(v33 + 64) = v65();
    aBlock[0] = v33;
    specialized Array._endMutation()();
    uint64_t v49 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v21) + 0x370))(aBlock[0]);
    unint64_t v50 = v68(v49);
    unint64_t v51 = v50;
    if (v50 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)_CocoaArrayWrapper.endIndex.getter();
      uint64_t v52 = (uint64_t)result;
      if (result) {
        goto LABEL_8;
      }
    }
    else
    {
      uint64_t v52 = *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id result = (id)swift_bridgeObjectRetain();
      if (v52)
      {
LABEL_8:
        if (v52 >= 1)
        {
          uint64_t v53 = 0;
          do
          {
            if ((v51 & 0xC000000000000001) != 0) {
              id v54 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v54 = *(id *)(v51 + 8 * v53 + 32);
            }
            uint64_t v56 = v54;
            ++v53;
            LODWORD(v55) = 1144750080;
            [v54 setPriority:v55];
          }
          while (v52 != v53);
          goto LABEL_15;
        }
        __break(1u);
        goto LABEL_17;
      }
    }
LABEL_15:
    uint64_t v57 = swift_bridgeObjectRelease_n();
    v68(v57);
    Class v58 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v64 activateConstraints:v58];

    uint64_t v59 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v21) + 0x2A8))();
    [v59 setHidden:0];

    uint64_t v60 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v21) + 0x2D8))();
    [v60 setEnabled:1];

    id v61 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v21) + 0x2C0))();
    [v61 setEnabled:1];

    objc_msgSend(objc_msgSend(v21, "systemApertureElementContext"), "setElementNeedsUpdate");
    return (id)swift_unknownObjectRelease();
  }
LABEL_19:
  __break(1u);
  return result;
}

id sub_10001A188()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10001D7EC(&qword_100047098);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for URL();
  uint64_t v65 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v64 = (char *)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  os_log_type_t v14 = (char *)&v57 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v57 - v16;
  uint64_t v18 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x260))(v15);
  if (!v18)
  {
    uint64_t v38 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v38, v7);
    uint64_t v39 = v7;
    uint64_t v40 = Logger.logObject.getter();
    os_log_type_t v41 = static os_log_type_t.default.getter();
    if (!os_log_type_enabled(v40, v41))
    {

      return (id)(*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v39);
    }
    id v42 = (uint8_t *)swift_slowAlloc();
    v67[0] = swift_slowAlloc();
    uint64_t v30 = v8;
    *(_DWORD *)id v42 = 136315138;
    uint64_t v66 = sub_10001CEC4(0x746F68506E65706FLL, 0xEC0000002928736FLL, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "%s error loading views", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (id)(*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v11, v39);
  }
  uint64_t v19 = (void *)v18;
  uint64_t v63 = v4;
  uint64_t v62 = v14;
  uint64_t v20 = sub_100023C44();
  uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  uint64_t v61 = v20;
  uint64_t v60 = v21;
  ((void (*)(char *))v21)(v17);
  uint64_t v22 = Logger.logObject.getter();
  uint64_t v23 = v8;
  os_log_type_t v24 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v22, v24))
  {
    uint64_t v59 = v19;
    id v25 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    uint64_t v57 = v5;
    v67[0] = v26;
    uint64_t v58 = v7;
    *(_DWORD *)id v25 = 136315138;
    uint64_t v66 = sub_10001CEC4(0x746F68506E65706FLL, 0xEC0000002928736FLL, v67);
    uint64_t v19 = v59;
    uint64_t v7 = v58;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v22, v24, "%s", v25, 0xCu);
    swift_arrayDestroy();
    uint64_t v5 = v57;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v27 = *(uint64_t (**)(char *, uint64_t))(v23 + 8);
  uint64_t v28 = v27(v17, v7);
  uint64_t v29 = (uint64_t)v63;
  (*(void (**)(uint64_t))((swift_isaMask & *v1) + 0x2F0))(v28);
  uint64_t v30 = v65;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v65 + 48))(v29, 1, v5) != 1)
  {
    uint64_t v11 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v30 + 32))(v64, v29, v5);
    sub_10002AAC0();
    swift_bridgeObjectRetain();
    NSString v43 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v19 setState:v43];

    id result = [self defaultWorkspace];
    if (!result)
    {
      __break(1u);
      return result;
    }
    uint64_t v46 = result;
    uint64_t v39 = v5;
    URL._bridgeToObjectiveC()(v45);
    id v48 = v47;
    sub_10001D7EC(&qword_1000473C0);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_10002F830;
    *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 40) = v50;
    *(void *)(inited + 72) = &type metadata for Bool;
    *(unsigned char *)(inited + 48) = 1;
    *(void *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)(inited + 88) = v51;
    *(void *)(inited + 120) = &type metadata for Bool;
    *(unsigned char *)(inited + 96) = 1;
    sub_10001AA8C(inited);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v46 openSensitiveURL:v48 withOptions:isa];

    uint64_t v53 = *sub_10001FBD4();
    id v54 = *(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x200);
    uint64_t v55 = swift_retain();
    uint64_t v56 = v54(v55);
    (*(void (**)(uint64_t))(*(void *)v53 + 200))(v56);

    swift_release();
    swift_bridgeObjectRelease();
    return (id)(*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v11, v39);
  }
  sub_10001E2A0(v29, &qword_100047098);
  uint64_t v31 = v62;
  v60(v62, v61, v7);
  long long v32 = Logger.logObject.getter();
  os_log_type_t v33 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v32, v33))
  {
    uint64_t v34 = v7;
    id v35 = (uint8_t *)swift_slowAlloc();
    v67[0] = swift_slowAlloc();
    *(_DWORD *)id v35 = 136315138;
    uint64_t v66 = sub_10001CEC4(0x746F68506E65706FLL, 0xEC0000002928736FLL, v67);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s photos URL is nil", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v36 = v62;
    uint64_t v37 = v34;
  }
  else
  {

    uint64_t v36 = v31;
    uint64_t v37 = v7;
  }
  return (id)v27(v36, v37);
}

unint64_t sub_10001AA8C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10001D7EC(&qword_1000473C8);
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
    sub_10001EC30(v6, (uint64_t)&v15, &qword_1000473D0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_10001D5D4(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10001EC94(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_10001AC0C()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v70 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v70 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v73 = (char *)&v70 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  BOOL v13 = (char *)&v70 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v70 - v15;
  uint64_t v17 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v0) + 0x308))(v14);
  if (v18)
  {
    uint64_t v19 = v17;
    unint64_t v20 = v18;
    id v75 = v0;
    uint64_t v21 = sub_100023C44();
    uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
    uint64_t v76 = v21;
    unint64_t v77 = v22;
    id v78 = (void (*)(char *, uint64_t))(v2 + 16);
    ((void (*)(char *))v22)(v16);
    swift_bridgeObjectRetain_n();
    uint64_t v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.default.getter();
    BOOL v25 = os_log_type_enabled(v23, v24);
    CGFloat v74 = v13;
    uint64_t v71 = v5;
    if (v25)
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v27 = (void *)swift_slowAlloc();
      uint64_t v72 = v2;
      aBlock[0] = v27;
      *(_DWORD *)uint64_t v26 = 136315394;
      uint64_t v79 = sub_10001CEC4(0xD000000000000011, 0x8000000100037370, (uint64_t *)aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v26 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v79 = sub_10001CEC4(v19, v20, (uint64_t *)aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "%s start identifier=%s", (uint8_t *)v26, 0x16u);
      swift_arrayDestroy();
      uint64_t v2 = v72;
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    uint64_t v34 = *(void (**)(char *, uint64_t))(v2 + 8);
    v34(v16, v1);
    id v35 = self;
    sub_10001D7EC(&qword_100047148);
    uint64_t v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_10002F810;
    *(void *)(v36 + 32) = v19;
    *(void *)(v36 + 40) = v20;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v38 = [v35 fetchAssetsWithLocalIdentifiers:isa options:0];

    id v39 = [v38 firstObject];
    if (v39)
    {
      id v40 = [self sharedPhotoLibrary];
      os_log_type_t v41 = (void *)swift_allocObject();
      v41[2] = v39;
      aBlock[4] = sub_10001EB58;
      aBlock[5] = v41;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_100009DF0;
      aBlock[3] = &unk_10003D8F0;
      id v42 = _Block_copy(aBlock);
      NSString v43 = (char *)v39;
      swift_release();
      aBlock[0] = 0;
      unsigned int v44 = [v40 performChangesAndWait:v42 error:aBlock];
      _Block_release(v42);

      id v45 = aBlock[0];
      uint64_t v46 = v74;
      if (!v44)
      {
        id v47 = v45;
        _convertNSErrorToError(_:)();

        swift_willThrow();
        id v48 = v71;
        v77(v71, v76, v1);
        uint64_t v49 = Logger.logObject.getter();
        int v50 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v49, (os_log_type_t)v50))
        {
          uint64_t v73 = v43;
          uint64_t v51 = (uint8_t *)swift_slowAlloc();
          aBlock[0] = (id)swift_slowAlloc();
          *(_DWORD *)uint64_t v51 = 136315138;
          uint64_t v79 = sub_10001CEC4(0xD000000000000011, 0x8000000100037370, (uint64_t *)aBlock);
          NSString v43 = v73;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl((void *)&_mh_execute_header, v49, (os_log_type_t)v50, "%s asset deletion failed", v51, 0xCu);
          swift_arrayDestroy();
          uint64_t v46 = v74;
          swift_slowDealloc();
          swift_slowDealloc();
          swift_errorRelease();

          v34(v71, v1);
        }
        else
        {
          swift_errorRelease();

          v34(v48, v1);
        }
      }
      v77(v46, v76, v1);
      uint64_t v58 = v75;
      uint64_t v59 = Logger.logObject.getter();
      os_log_type_t v60 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v59, v60))
      {
        uint64_t v61 = swift_slowAlloc();
        uint64_t v72 = v2;
        uint64_t v62 = v61;
        uint64_t v63 = (void *)swift_slowAlloc();
        unint64_t v77 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc();
        id v78 = v34;
        aBlock[0] = v77;
        *(_DWORD *)uint64_t v62 = 136315394;
        uint64_t v79 = sub_10001CEC4(0xD000000000000011, 0x8000000100037370, (uint64_t *)aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v62 + 12) = 2112;
        uint64_t v79 = (uint64_t)v58;
        uint64_t v64 = v58;
        uint64_t v76 = v1;
        id v65 = v64;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        void *v63 = v75;

        _os_log_impl((void *)&_mh_execute_header, v59, v60, "%s self=%@ done", (uint8_t *)v62, 0x16u);
        sub_10001D7EC(&qword_1000470C0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        v78(v74, v76);
      }
      else
      {

        v34(v46, v1);
      }
      uint64_t v66 = *sub_10001FBD4();
      uint64_t v67 = *(uint64_t (**)(uint64_t))((swift_isaMask & *v58) + 0x200);
      uint64_t v68 = swift_retain();
      uint64_t v69 = v67(v68);
      (*(void (**)(uint64_t))(*(void *)v66 + 200))(v69);

      swift_release();
      return swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v52 = v73;
      v77(v73, v76, v1);
      uint64_t v53 = Logger.logObject.getter();
      os_log_type_t v54 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v53, v54))
      {
        uint64_t v55 = (uint64_t (*)(char *, uint64_t))v34;
        uint64_t v56 = v1;
        uint64_t v57 = (uint8_t *)swift_slowAlloc();
        aBlock[0] = (id)swift_slowAlloc();
        *(_DWORD *)uint64_t v57 = 136315138;
        uint64_t v79 = sub_10001CEC4(0xD000000000000011, 0x8000000100037370, (uint64_t *)aBlock);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v53, v54, "%s photos asset is nil", v57, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        return v55(v52, v56);
      }
      else
      {

        return ((uint64_t (*)(char *, uint64_t))v34)(v52, v1);
      }
    }
  }
  else
  {
    uint64_t v28 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v8, v28, v1);
    uint64_t v29 = Logger.logObject.getter();
    uint64_t v30 = v1;
    os_log_type_t v31 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v29, v31))
    {
      long long v32 = (uint8_t *)swift_slowAlloc();
      aBlock[0] = (id)swift_slowAlloc();
      *(_DWORD *)long long v32 = 136315138;
      uint64_t v79 = sub_10001CEC4(0xD000000000000011, 0x8000000100037370, (uint64_t *)aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v29, v31, "%s photos identifier is nil", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v8, v30);
  }
}

uint64_t sub_10001B858(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_10002A6DC();
  BOOL v9 = *v8 == a2 && v8[1] == a3;
  if (v9
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || ((uint64_t v10 = sub_10002A6F4(), *v10 == a2) ? (v11 = v10[1] == a3) : (v11 = 0),
        v11
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
     || (uint64_t v12 = sub_10002A70C(), *v12 == a2) && v12[1] == a3
     || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0))
  {
    UIAccessibilityNotifications notification = UIAccessibilityAnnouncementNotification;
    type metadata accessor for RPSystemApertureElementViewController();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v14 = [self bundleForClass:ObjCClassFromMetadata];
    NSString v15 = String._bridgeToObjectiveC()();
    NSString v16 = String._bridgeToObjectiveC()();
    uint64_t v17 = a1;
    id v18 = [v14 localizedStringForKey:v15 value:0 table:v16];

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    a1 = v17;
    NSString v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    UIAccessibilityPostNotification(notification, v19);
  }
  type metadata accessor for RPSystemApertureElementViewController();
  uint64_t v20 = swift_getObjCClassFromMetadata();
  id v21 = [self bundleForClass:v20];
  NSString v22 = String._bridgeToObjectiveC()();
  NSString v23 = String._bridgeToObjectiveC()();
  id v24 = [v21 localizedStringForKey:v22 value:0 table:v23];

  uint64_t v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v27 = v26;

  uint64_t v28 = *(void **)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView];
  if (v28)
  {
    sub_10001F0B4(0, &qword_1000473B0);
    id v29 = v28;
    id v30 = a1;
    char v31 = static NSObject.== infix(_:_:)();

    if (v31)
    {
      long long v32 = *(void **)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView];
      if (!v32) {
        goto LABEL_33;
      }
      id v33 = [v32 accessibilityLabel];
      if (!v33) {
        goto LABEL_33;
      }
      uint64_t v34 = v33;
      uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v37 = v36;

      if (v35 == v25 && v37 == v27)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        char v38 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        if ((v38 & 1) == 0) {
          goto LABEL_33;
        }
      }
    }
  }
  id v39 = *(void **)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView];
  if (!v39) {
    goto LABEL_31;
  }
  sub_10001F0B4(0, &qword_1000473B0);
  id v40 = a1;
  id v41 = v39;
  char v42 = static NSObject.== infix(_:_:)();

  if ((v42 & 1) == 0) {
    goto LABEL_31;
  }
  if (!v28 || (id v43 = [v28 accessibilityLabel]) == 0)
  {
LABEL_33:
    NSString v53 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [a1 setAccessibilityLabel:v53];

    if (UIAccessibilityIsVoiceOverRunning()
      || UIAccessibilityIsSwitchControlRunning()
      || (uint64_t result = _AXSCommandAndControlEnabled(), result))
    {
      objc_msgSend(objc_msgSend(v4, "systemApertureElementContext"), "setElementNeedsUpdate");
      return swift_unknownObjectRelease();
    }
    return result;
  }
  unsigned int v44 = v43;
  uint64_t v45 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v47 = v46;

  if (v45 == v25 && v47 == v27)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v48 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if ((v48 & 1) == 0) {
      goto LABEL_33;
    }
  }
LABEL_31:
  uint64_t v49 = *(void **)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView];
  if (v49)
  {
    sub_10001F0B4(0, &qword_1000473B0);
    id v50 = a1;
    id v51 = v49;
    char v52 = static NSObject.== infix(_:_:)();

    if (v52) {
      goto LABEL_33;
    }
  }

  return swift_bridgeObjectRelease();
}

id sub_10001BDA8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id sub_10001BE20(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode] = 0;
  *(void *)&v3[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole] = 2;
  *(void *)&v3[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode] = 3;
  *(void *)&v3[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode] = 4;
  *(void *)&v3[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress] = 0x100000;
  uint64_t v6 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea;
  id v7 = v3;
  *(void *)&v3[v6] = *(void *)sub_10002A0F4();
  uint64_t v8 = &v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_sessionID];
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors] = 666;
  BOOL v9 = (void *)SBUISystemApertureElementIdentifierScreenRecording;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_elementIdentifier] = SBUISystemApertureElementIdentifierScreenRecording;
  uint64_t v10 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView;
  BOOL v11 = (objc_class *)type metadata accessor for RPSessionAccessoryView();
  id v12 = objc_allocWithZone(v11);
  id v13 = v9;
  *(void *)&v7[v10] = sub_10000A4C0(0);
  uint64_t v14 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView;
  id v15 = objc_allocWithZone(v11);
  *(void *)&v7[v14] = sub_10000A4C0(1);
  uint64_t v16 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView;
  id v17 = objc_allocWithZone(v11);
  *(void *)&v7[v16] = sub_10000A4C0(2);
  uint64_t v18 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_timerLabel;
  *(void *)&v7[v18] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v19 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel;
  *(void *)&v7[v19] = [objc_allocWithZone((Class)UILabel) init];
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingPackageView] = 0;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingPackageView] = 0;
  v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_recordingState] = 1;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___buttonStackView] = 0;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___viewButton] = 0;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___deleteButton] = 0;
  uint64_t v20 = &v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosURL];
  uint64_t v21 = type metadata accessor for URL();
  NSString v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  v22(v20, 1, 1, v21);
  NSString v23 = &v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosIdentifier];
  *(void *)NSString v23 = 0;
  *((void *)v23 + 1) = 0;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___stopButton] = 0;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint[0]] = 0;
  uint64_t v24 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customView;
  *(void *)&v7[v24] = [objc_allocWithZone((Class)UIView) init];
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_accessoryViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewElementLayoutConstraints] = &_swiftEmptyArrayStorage;
  uint64_t v25 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_keyColor;
  *(void *)&v7[v25] = [self grayColor];
  uint64_t v26 = &v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_associatedAppBundleIdentifier];
  *(void *)uint64_t v26 = 0;
  *((void *)v26 + 1) = 0;
  v22(&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL], 1, 1, v21);
  v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused] = 0;
  *(void *)&v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_completionTimer] = 0;
  v7[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_inExpandedButtonView] = 0;

  if (a2)
  {
    NSString v27 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v27 = 0;
  }
  v30.receiver = v7;
  v30.super_class = (Class)type metadata accessor for RPSystemApertureElementViewController();
  [super initWithNibName:v27 bundle:a3];

  return v28;
}

id sub_10001C214(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_activeLayoutMode] = 0;
  *(void *)&v1[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_contentRole] = 2;
  *(void *)&v1[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredLayoutMode] = 3;
  *(void *)&v1[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_maximumLayoutMode] = 4;
  *(void *)&v1[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_statusBarStyleOverridesToSuppress] = 0x100000;
  uint64_t v3 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_preferredHeightForBottomSafeArea;
  uint64_t v4 = v1;
  *(void *)&v1[v3] = *(void *)sub_10002A0F4();
  uint64_t v5 = &v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_sessionID];
  *(void *)uint64_t v5 = 0;
  *((void *)v5 + 1) = 0;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_presentationBehaviors] = 666;
  uint64_t v6 = (void *)SBUISystemApertureElementIdentifierScreenRecording;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_elementIdentifier] = SBUISystemApertureElementIdentifierScreenRecording;
  uint64_t v7 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingView;
  uint64_t v8 = (objc_class *)type metadata accessor for RPSessionAccessoryView();
  id v9 = objc_allocWithZone(v8);
  id v10 = v6;
  *(void *)&v4[v7] = sub_10000A4C0(0);
  uint64_t v11 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingView;
  id v12 = objc_allocWithZone(v8);
  *(void *)&v4[v11] = sub_10000A4C0(1);
  uint64_t v13 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalView;
  id v14 = objc_allocWithZone(v8);
  *(void *)&v4[v13] = sub_10000A4C0(2);
  uint64_t v15 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_timerLabel;
  *(void *)&v4[v15] = [objc_allocWithZone((Class)UILabel) init];
  uint64_t v16 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel;
  *(void *)&v4[v16] = [objc_allocWithZone((Class)UILabel) init];
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_trailingPackageView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_leadingPackageView] = 0;
  v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_recordingState] = 1;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___buttonStackView] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___viewButton] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___deleteButton] = 0;
  id v17 = &v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosURL];
  uint64_t v18 = type metadata accessor for URL();
  uint64_t v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  v19(v17, 1, 1, v18);
  uint64_t v20 = &v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_photosIdentifier];
  *(void *)uint64_t v20 = 0;
  *((void *)v20 + 1) = 0;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___stopButton] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController____lazy_storage___customViewHeightConstraint[0]] = 0;
  uint64_t v21 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customView;
  *(void *)&v4[v21] = [objc_allocWithZone((Class)UIView) init];
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_accessoryViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_minimalViewLayoutConstraints] = &_swiftEmptyArrayStorage;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_customViewElementLayoutConstraints] = &_swiftEmptyArrayStorage;
  uint64_t v22 = OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_keyColor;
  *(void *)&v4[v22] = [self grayColor];
  NSString v23 = &v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_associatedAppBundleIdentifier];
  *(void *)NSString v23 = 0;
  *((void *)v23 + 1) = 0;
  v19(&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_launchURL], 1, 1, v18);
  v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_countdownPaused] = 0;
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_completionTimer] = 0;
  v4[OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_inExpandedButtonView] = 0;

  v26.receiver = v4;
  v26.super_class = (Class)type metadata accessor for RPSystemApertureElementViewController();
  [super initWithCoder:a1];

  return v24;
}

id sub_10001C594()
{
  return sub_10001C5B0(0, type metadata accessor for RPSystemApertureElementViewController);
}

id sub_10001C5B0(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return [super dealloc];
}

void sub_10001C7C0(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_10001C7C8@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_10001C7DC@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_10001C7F0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_10001C804(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_10001C834@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_10001C860@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_10001C884(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_10001C898(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_10001C8AC(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_10001C8C0@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_10001C8D4(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_10001C8E8(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_10001C8FC(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_10001C910()
{
  return *v0 == 0;
}

uint64_t sub_10001C920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_10001C938(void *result)
{
  *v1 &= ~*result;
  return result;
}

uint64_t sub_10001C94C(uint64_t a1, uint64_t a2)
{
  return sub_10001CC64(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10001C964(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_10001C9DC(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10001CA5C@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

void *sub_10001CAA0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10001CAB0(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_10001CABC(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10001CAD0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_10001EB20(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

void *sub_10001CB10@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_10001CB1C@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10001CB64@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001CB90(uint64_t a1)
{
  uint64_t v2 = sub_10001E928(&qword_1000473A0, type metadata accessor for SBUISystemApertureElementIdentifier);
  uint64_t v3 = sub_10001E928(&qword_1000473A8, type metadata accessor for SBUISystemApertureElementIdentifier);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10001CC4C(uint64_t a1, uint64_t a2)
{
  return sub_10001CC64(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10001CC64(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10001CCA8()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10001CCFC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10001CD70()
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

uint64_t sub_10001CDFC(unint64_t a1)
{
  if (!(a1 >> 62)) {
    return *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_10001CE5C(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  sub_10001CEC4(0xD00000000000001DLL, 0x8000000100036AE0, a3);
  uint64_t v4 = *a1 + 8;
  uint64_t result = UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v4;
  return result;
}

uint64_t sub_10001CEC4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10001CF98(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001F448((uint64_t)v12, *a3);
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
      sub_10001F448((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001F3F8((uint64_t)v12);
  return v7;
}

uint64_t sub_10001CF98(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10001D154(a5, a6);
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

uint64_t sub_10001D154(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10001D1EC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001D3CC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001D3CC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10001D1EC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10001D364(v2, 0);
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

void *sub_10001D364(uint64_t a1, uint64_t a2)
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
  sub_10001D7EC(&qword_1000473E8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001D3CC(char a1, int64_t a2, char a3, char *a4)
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
    sub_10001D7EC(&qword_1000473E8);
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

void sub_10001D51C(uint64_t *a1, void **a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v6 = (void *)a4();
  uint64_t v7 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  *a1 = v7;
  int64_t v8 = *a2;
  if (*a2)
  {
    *int64_t v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {
  }
}

unint64_t sub_10001D5D4(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10001D64C(a1, a2, v4);
}

unint64_t sub_10001D64C(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10001D730(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10003D118, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3) {
    return 3;
  }
  else {
    return v3;
  }
}

uint64_t type metadata accessor for RPSessionAccessoryView()
{
  return self;
}

unint64_t sub_10001D7A0(Swift::String string)
{
  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  unint64_t v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10003D180, v2);
  swift_bridgeObjectRelease();
  if (v3 >= 8) {
    return 8;
  }
  else {
    return v3;
  }
}

uint64_t sub_10001D7EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001D830(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001D7EC(&qword_100047098);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for RPSystemApertureElementViewController()
{
  uint64_t result = qword_100047D80;
  if (!qword_100047D80) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_10001D8E4()
{
  return sub_10001A188();
}

uint64_t sub_10001D908()
{
  return sub_10001AC0C();
}

uint64_t sub_10001D92C()
{
  return _swift_deallocObject(v0, 64, 7);
}

void sub_10001D98C()
{
  sub_100011324(*(void **)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32), *(void *)(v0 + 40), *(void **)(v0 + 48), *(void **)(v0 + 56));
}

uint64_t sub_10001D99C(void *a1)
{
  return sub_1000136C8(a1, *(void **)(v1 + 16));
}

void sub_10001D9A8()
{
  Swift::String v2 = (void *)v0[2];
  uint64_t v1 = v0[3];
  uint64_t v3 = v0[4];
  uint64_t v4 = self;
  double v5 = *(double *)sub_10002A414();
  unint64_t v6 = (void *)swift_allocObject();
  v6[2] = v2;
  v6[3] = v1;
  v6[4] = v3;
  v9[4] = sub_10001F220;
  v9[5] = v6;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_100009DF0;
  v9[3] = &unk_10003DA80;
  uint64_t v7 = _Block_copy(v9);
  id v8 = v2;
  swift_bridgeObjectRetain();
  swift_release();
  [v4 animateWithDuration:v7 animations:v5];
  _Block_release(v7);
}

unint64_t sub_10001DABC()
{
  unint64_t result = qword_100047140;
  if (!qword_100047140)
  {
    sub_10001DB18(&qword_100047138);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047140);
  }
  return result;
}

uint64_t sub_10001DB18(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001DB60()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001DB70()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10001DBB8(void *a1)
{
  uint64_t v3 = v1[2];
  uint64_t v4 = (void *)v1[3];
  double v5 = (void *)v1[4];
  unint64_t v6 = (unsigned char *)(v3 + 16);
  swift_beginAccess();
  if ((*(unsigned char *)(v3 + 16) & 1) == 0)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    id v8 = [v4 publishedObjectWithName:v7];

    if (v8)
    {
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v31, 0, sizeof(v31));
    }
    sub_10001E228((uint64_t)v31, (uint64_t)aBlock);
    if (v27)
    {
      sub_10001F0B4(0, &qword_1000473D8);
      if (swift_dynamicCast())
      {
        uint64_t v9 = v30;
        swift_beginAccess();
        *unint64_t v6 = 1;
        if (a1)
        {
          id v10 = [a1 CGImage];
          if (v10)
          {
            aBlock[0] = v10;
            type metadata accessor for CGImage(0);
            a1 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
          }
          else
          {
            a1 = 0;
          }
        }
        [v9 setContents:a1];
        swift_unknownObjectRelease();
        [v9 setContentsGravity:kCAGravityResizeAspectFill];
        id v11 = [self clearColor];
        id v12 = [v11 CGColor];

        [v9 setBackgroundColor:v12];
        sub_100014F1C();
        sub_10002AAB4();
        swift_bridgeObjectRetain();
        NSString v13 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
        [v4 setState:v13];

        BOOL v14 = self;
        double v15 = *(double *)sub_10002A12C();
        uint64_t v16 = swift_allocObject();
        *(void *)(v16 + 16) = v5;
        id v28 = sub_10001F0F0;
        uint64_t v29 = v16;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = (id)1107296256;
        aBlock[2] = sub_100009DF0;
        NSString v27 = &unk_10003DA30;
        id v17 = _Block_copy(aBlock);
        id v18 = v5;
        swift_release();
        [v14 animateWithDuration:v17 animations:v15];
        _Block_release(v17);
        if (UIAccessibilityIsVoiceOverRunning())
        {
          UIAccessibilityNotifications v19 = UIAccessibilityAnnouncementNotification;
          type metadata accessor for RPSystemApertureElementViewController();
          uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
          id v21 = [self bundleForClass:ObjCClassFromMetadata];
          NSString v22 = String._bridgeToObjectiveC()();
          NSString v23 = String._bridgeToObjectiveC()();
          id v24 = [v21 localizedStringForKey:v22 value:0 table:v23];

          static String._unconditionallyBridgeFromObjectiveC(_:)();
          NSString v25 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
          UIAccessibilityPostNotification(v19, v25);
        }
        else
        {
        }
      }
    }
    else
    {
      sub_10001E2A0((uint64_t)aBlock, &qword_100047150);
    }
  }
}

uint64_t sub_10001E008()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_10001E0FC()
{
  uint64_t v1 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v3 = (void *)v0[2];
  uint64_t v4 = v0[3];
  uint64_t v5 = v0[4];
  uint64_t v6 = (uint64_t)v0 + v2;
  NSString v7 = (void *)((char *)v0 + ((*(void *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v8 = *v7;
  uint64_t v9 = v7[1];

  return sub_100016D50(v3, v4, v5, v6, v8, v9);
}

uint64_t sub_10001E194()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001E1CC()
{
  return sub_100017424(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_10001E1D4()
{
  sub_100017F10(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10001E1DC()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001E21C()
{
  return sub_100018834(*(void *)(v0 + 16), *(void *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_10001E228(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10001D7EC(&qword_100047150);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001E294()
{
  return sub_100019168(*(void **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_10001E2A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10001D7EC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_10001E300()
{
  unint64_t result = qword_100047158;
  if (!qword_100047158)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047158);
  }
  return result;
}

unint64_t sub_10001E358()
{
  unint64_t result = qword_100047160;
  if (!qword_100047160)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047160);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for RPSessionAccessoryView.Role(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RPSessionAccessoryView.Role(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RPSessionAccessoryView.Role(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001E518);
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

uint64_t sub_10001E540(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001E54C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RPSessionAccessoryView.Role()
{
  return &type metadata for RPSessionAccessoryView.Role;
}

uint64_t sub_10001E564()
{
  return type metadata accessor for RPSystemApertureElementViewController();
}

void sub_10001E56C()
{
  sub_10001E690();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10001E690()
{
  if (!qword_100047338)
  {
    type metadata accessor for URL();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100047338);
    }
  }
}

uint64_t getEnumTagSinglePayload for RPSystemApertureElementViewController.RecordingState(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for RPSystemApertureElementViewController.RecordingState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10001E844);
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

ValueMetadata *type metadata accessor for RPSystemApertureElementViewController.RecordingState()
{
  return &type metadata for RPSystemApertureElementViewController.RecordingState;
}

void type metadata accessor for SBUISystemApertureElementIdentifier(uint64_t a1)
{
}

void type metadata accessor for SBUISystemAperturePresentationBehaviors(uint64_t a1)
{
}

void type metadata accessor for _UIStatusBarStyleOverrides(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureContentRole(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
}

uint64_t sub_10001E8E0()
{
  return sub_10001E928(&qword_100047368, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_10001E928(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10001E970()
{
  return sub_10001E928(&qword_100047370, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_10001E9B8()
{
  return sub_10001E928(&qword_100047378, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_10001EA00()
{
  return sub_10001E928(&qword_100047380, type metadata accessor for SBUISystemAperturePresentationBehaviors);
}

uint64_t sub_10001EA48()
{
  return sub_10001E928(&qword_100047388, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_10001EA90()
{
  return sub_10001E928(&qword_100047390, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_10001EAD8()
{
  return sub_10001E928(&qword_100047398, type metadata accessor for SBUISystemApertureElementIdentifier);
}

uint64_t sub_10001EB20(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  unsigned int v4 = (uint64_t *)(a1 + 32);
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

void sub_10001EB58()
{
  uint64_t v1 = *(void **)(v0 + 16);
  int v2 = self;
  sub_10001D7EC((uint64_t *)&unk_1000470B0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10002F840;
  *(void *)(v3 + 32) = v1;
  specialized Array._endMutation()();
  sub_10001F0B4(0, &qword_1000473B8);
  id v4 = v1;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v2 deleteAssets:isa];
}

uint64_t sub_10001EC30(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10001D7EC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10001EC94(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10001ECA4()
{
  return sub_100014F1C();
}

uint64_t sub_10001ECC8()
{
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10001ED10()
{
  uint64_t v1 = v0;
  long long v2 = *(void **)(v0 + 16);
  uint64_t v3 = *(void **)(v0 + 24);
  id v4 = *(void **)(v1 + 32);
  id v5 = [v2 layer];
  [v5 removeAllAnimations];

  uint64_t v6 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v3) + 0x248))();
  id v7 = [v6 layer];

  [v7 removeAllAnimations];
  uint64_t v8 = (*(uint64_t (**)(uint64_t))((swift_isaMask & *v3) + 0x298))(6);
  uint64_t v9 = *(uint64_t (**)(void))((swift_isaMask & *v3) + 0x320);
  id v10 = (void *)((uint64_t (*)(uint64_t))v9)(v8);
  [v10 setEnabled:0];

  id v11 = (void *)v9();
  [v11 setUserInteractionEnabled:0];

  id v12 = (void *)v9();
  id v13 = [v12 layer];

  [v13 setAllowsHitTesting:0];
  sub_10002AAA8();
  swift_bridgeObjectRetain();
  NSString v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v4 setState:v14 animated:1];

  [v4 setUserInteractionEnabled:0];
  double v15 = *(void **)((char *)v3
                 + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel);
  sub_10002A560();
  swift_bridgeObjectRetain();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v15 setText:v16];

  return sub_100014F1C();
}

uint64_t sub_10001EF90()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10001EFD0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  long long v2 = *(void **)(v0 + 24);
  uint64_t v3 = (double *)sub_10002A2A4();
  id v4 = [v1 setAlpha:*v3];
  id v5 = (id)(*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x248))(v4);
  [v5 setAlpha:*v3];
}

uint64_t sub_10001F088(uint64_t a1)
{
  return sub_10000DF08(a1, v1);
}

uint64_t sub_10001F0B4(uint64_t a1, unint64_t *a2)
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

id sub_10001F0F0()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 16)
                + OBJC_IVAR____TtC14ReplayKitAngel37RPSystemApertureElementViewController_screenRecordingLabel);
  sub_10002A5FC();
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v1 setText:v2];

  return [v1 sizeToFit];
}

void type metadata accessor for CGImage(uint64_t a1)
{
}

void sub_10001F194(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10001F1E0()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10001F220()
{
  id v2 = (id)(*(uint64_t (**)(void))((swift_isaMask & **(void **)(v0 + 16)) + 0x248))();
  NSString v1 = String._bridgeToObjectiveC()();
  [v2 setText:v1];
}

id sub_10001F2D4()
{
  return *(id *)(v0 + 16);
}

uint64_t sub_10001F2DC()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char **sub_10001F2EC(unsigned char **result)
{
  id v2 = *result;
  unsigned char *v2 = *(unsigned char *)(v1 + 16);
  *uint64_t result = v2 + 1;
  return result;
}

uint64_t sub_10001F300()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001F310()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001F320()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10001F330()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001F368()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_10001F390(uint64_t *a1, void **a2, uint64_t a3)
{
  sub_10001D51C(a1, a2, a3, *(uint64_t (**)(void))(v3 + 16));
}

uint64_t sub_10001F398()
{
  return (*(uint64_t (**)(uint64_t))((swift_isaMask & **(void **)(v0 + 16)) + 0x448))(1);
}

uint64_t sub_10001F3F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001F448(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_10001F4A8()
{
}

uint64_t sub_10001F588()
{
  return 0;
}

uint64_t sub_10001F594()
{
  return 0;
}

void sub_10001F5A0(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_10001F5AC(uint64_t a1)
{
  unint64_t v2 = sub_10001F6A4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001F5E8(uint64_t a1)
{
  unint64_t v2 = sub_10001F6A4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001F624(void *a1)
{
  return sub_10001F8AC(a1, &qword_100047460, (void (*)(void))sub_10001F6A4);
}

void *sub_10001F660(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10001F6A4()
{
  unint64_t result = qword_1000483D0;
  if (!qword_1000483D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000483D0);
  }
  return result;
}

Swift::Int sub_10001F6F8()
{
  return Hasher._finalize()();
}

uint64_t sub_10001F730(uint64_t a1)
{
  return sub_10001F3F8(a1);
}

uint64_t sub_10001F758(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001FA5C(a1, a2, a3, &qword_100047460, (void (*)(void))sub_10001F6A4);
}

Swift::Int sub_10001F794()
{
  return Hasher._finalize()();
}

uint64_t sub_10001F7C8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_10001F7F8(uint64_t a1)
{
  unint64_t v2 = sub_10001F9CC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001F834(uint64_t a1)
{
  unint64_t v2 = sub_10001F9CC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001F870(void *a1)
{
  return sub_10001F8AC(a1, &qword_100047468, (void (*)(void))sub_10001F9CC);
}

uint64_t sub_10001F8AC(void *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v5 = sub_10001D7EC(a2);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F660(a1, a1[3]);
  a3();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

unint64_t sub_10001F9CC()
{
  unint64_t result = qword_1000483D8[0];
  if (!qword_1000483D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000483D8);
  }
  return result;
}

uint64_t sub_10001FA20(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_10001FA5C(a1, a2, a3, &qword_100047468, (void (*)(void))sub_10001F9CC);
}

uint64_t sub_10001FA5C(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(void))
{
  uint64_t v7 = sub_10001D7EC(a4);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001F660(a1, a1[3]);
  a5();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10001FB7C()
{
  type metadata accessor for RPSessionGateway();
  uint64_t result = swift_initStaticObject();
  qword_100048C50 = result;
  return result;
}

double sub_10001FBA8()
{
  uint64_t v0 = swift_allocObject();
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  return result;
}

uint64_t *sub_10001FBD4()
{
  if (qword_100048390 != -1) {
    swift_once();
  }
  return &qword_100048C50;
}

uint64_t sub_10001FC20()
{
  type metadata accessor for RPSessionGateway();

  return swift_initStaticObject();
}

uint64_t sub_10001FC50()
{
  return swift_retain();
}

uint64_t sub_10001FC88(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t (*sub_10001FCD0())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10001FD24()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_10001FD70(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(void *)(v2 + 24) = a1;
  *(void *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_10001FDC4())()
{
  return j__swift_endAccess;
}

void *sub_10001FE18()
{
  swift_beginAccess();
  uint64_t v1 = *(void **)(v0 + 40);
  id v2 = v1;
  return v1;
}

void sub_10001FE5C(uint64_t a1)
{
  swift_beginAccess();
  uint64_t v3 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = a1;
}

uint64_t (*sub_10001FEA4())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_10001FEF8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for ActivityPresentationOptions();
  uint64_t v51 = *(void *)(v2 - 8);
  uint64_t v52 = v2;
  __chkstk_darwin(v2);
  NSString v53 = (char *)v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v8 = (char *)v48 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v49 = (char *)v48 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)v48 - v12;
  __chkstk_darwin(v11);
  double v15 = (char *)v48 - v14;
  uint64_t v16 = sub_100023C44();
  id v17 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v55 = v16;
  uint64_t v56 = v17;
  ((void (*)(char *))v17)(v15);
  id v18 = Logger.logObject.getter();
  os_log_type_t v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    uint64_t v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "start()", v20, 2u);
    swift_slowDealloc();
  }
  id v50 = v8;

  uint64_t v57 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  uint64_t v21 = v57(v15, v4);
  uint64_t v22 = (*(uint64_t (**)(uint64_t))(*(void *)v1 + 104))(v21);
  swift_release();
  uint64_t v54 = v5 + 8;
  if (v22)
  {
    v56(v13, v55, v4);
    swift_retain_n();
    NSString v23 = Logger.logObject.getter();
    os_log_type_t v24 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v23, v24))
    {
      NSString v25 = (uint8_t *)swift_slowAlloc();
      uint64_t v26 = swift_slowAlloc();
      v48[1] = v26;
      *(_DWORD *)NSString v25 = 136315138;
      v59[0] = v26;
      uint64_t v27 = (*(uint64_t (**)(void))(*(void *)v1 + 128))();
      if (v28)
      {
        unint64_t v29 = v28;
      }
      else
      {
        uint64_t v27 = 1819047246;
        unint64_t v29 = 0xE400000000000000;
      }
      uint64_t v58 = sub_10001CEC4(v27, v29, v59);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Stop existing session sessionID=%s", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v30 = v57(v13, v4);
    }
    else
    {

      swift_release_n();
      uint64_t v30 = v57(v13, v4);
    }
    (*(void (**)(uint64_t))(*(void *)v1 + 184))(v30);
  }
  sub_10002A68C();
  sub_10001D7EC(&qword_100047470);
  uint64_t v31 = type metadata accessor for ActivityPresentationOptions.ActivityPresentationDestination();
  uint64_t v32 = *(void *)(v31 - 8);
  unint64_t v33 = (*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80);
  uint64_t v34 = swift_allocObject();
  *(_OWORD *)(v34 + 16) = xmmword_10002F810;
  (*(void (**)(unint64_t, void, uint64_t))(v32 + 104))(v34 + v33, enum case for ActivityPresentationOptions.ActivityPresentationDestination.systemAperture(_:), v31);
  swift_bridgeObjectRetain();
  uint64_t v35 = v53;
  ActivityPresentationOptions.init(destinations:)();
  sub_10001D7EC(&qword_100047478);
  static Activity.request(attributes:contentState:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:)();
  swift_bridgeObjectRelease();
  uint64_t v36 = *(void (**)(uint64_t))(*(void *)v1 + 112);
  uint64_t v37 = swift_retain();
  v36(v37);
  uint64_t v38 = Activity.id.getter();
  (*(void (**)(uint64_t))(*(void *)v1 + 136))(v38);
  id v39 = v49;
  v56(v49, v55, v4);
  swift_retain_n();
  id v40 = Logger.logObject.getter();
  os_log_type_t v41 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v40, v41))
  {
    char v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v43 = swift_slowAlloc();
    *(_DWORD *)char v42 = 136315138;
    v59[0] = v43;
    uint64_t v44 = (*(uint64_t (**)(void))(*(void *)v1 + 128))();
    if (v45)
    {
      unint64_t v46 = v45;
    }
    else
    {
      uint64_t v44 = 1819047246;
      unint64_t v46 = 0xE400000000000000;
    }
    uint64_t v58 = sub_10001CEC4(v44, v46, v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "new session sessionID=%s", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();

    v57(v49, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v53, v52);
  }
  else
  {
    swift_release();
    swift_release_n();

    v57(v39, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v35, v52);
  }
}

unint64_t sub_100020874()
{
  uint64_t v1 = sub_10001D7EC(&qword_100047480);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_retain_n();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v39 = v0;
  if (v11)
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v38 = swift_slowAlloc();
    v41[0] = v38;
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v40 = sub_10001CEC4(0x29286873696E6966, 0xE800000000000000, v41);
    uint64_t v13 = UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)v39 + 128))(v13);
    if (v15)
    {
      unint64_t v16 = v15;
    }
    else
    {
      uint64_t v14 = 1819047246;
      unint64_t v16 = 0xE400000000000000;
    }
    uint64_t v40 = sub_10001CEC4(v14, v16, v41);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s currentSessionID=%s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_10001D7EC(&qword_100047478);
  unint64_t result = static Activity.activities.getter();
  uint64_t v18 = result;
  if (result >> 62)
  {
    unint64_t result = _CocoaArrayWrapper.endIndex.getter();
    uint64_t v19 = result;
    if (result) {
      goto LABEL_9;
    }
LABEL_24:
    swift_bridgeObjectRelease();
    id v32 = [self sharedInstance];
    [v32 setDelegate:0];

    uint64_t v33 = v39;
    uint64_t v35 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v39 + 152))(v34);
    [v35 invalidate];

    return (*(uint64_t (**)(void, void))(*(void *)v33 + 136))(0, 0);
  }
  uint64_t v19 = *(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v19) {
    goto LABEL_24;
  }
LABEL_9:
  if (v19 >= 1)
  {
    uint64_t v20 = 0;
    unint64_t v37 = v18 & 0xC000000000000001;
    uint64_t v36 = (char *)&type metadata for () + 8;
    uint64_t v38 = v18;
    uint64_t v21 = v39;
    while (1)
    {
      if (v37)
      {
        uint64_t v22 = specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        uint64_t v22 = *(void *)(v18 + 8 * v20 + 32);
        swift_retain();
      }
      uint64_t v23 = type metadata accessor for TaskPriority();
      uint64_t v24 = *(void *)(v23 - 8);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v3, 1, 1, v23);
      NSString v25 = (void *)swift_allocObject();
      v25[2] = 0;
      uint64_t v26 = v25 + 2;
      v25[3] = 0;
      v25[4] = v22;
      v25[5] = v21;
      int v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48))(v3, 1, v23);
      swift_retain();
      swift_retain();
      if (v27 == 1)
      {
        sub_10001E2A0((uint64_t)v3, &qword_100047480);
        if (!*v26) {
          goto LABEL_20;
        }
      }
      else
      {
        TaskPriority.rawValue.getter();
        (*(void (**)(char *, uint64_t))(v24 + 8))(v3, v23);
        if (!*v26)
        {
LABEL_20:
          uint64_t v28 = 0;
          uint64_t v30 = 0;
          goto LABEL_21;
        }
      }
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v28 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v30 = v29;
      swift_unknownObjectRelease();
LABEL_21:
      uint64_t v31 = swift_allocObject();
      *(void *)(v31 + 16) = &unk_100047490;
      *(void *)(v31 + 24) = v25;
      if (v30 | v28)
      {
        v41[1] = 0;
        v41[2] = 0;
        v41[3] = v28;
        v41[4] = v30;
      }
      ++v20;
      swift_task_create();
      swift_release();
      swift_release();
      uint64_t v18 = v38;
      if (v19 == v20) {
        goto LABEL_24;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_100020E98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  uint64_t v6 = type metadata accessor for ActivityUIDismissalPolicy();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  sub_10001D7EC(&qword_100047638);
  v5[10] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Logger();
  v5[11] = v7;
  v5[12] = *(void *)(v7 - 8);
  v5[13] = swift_task_alloc();
  return _swift_task_switch(sub_100020FE4, 0, 0);
}

uint64_t sub_100020FE4()
{
  uint64_t v30 = v0;
  uint64_t v2 = v0[12];
  uint64_t v1 = v0[13];
  uint64_t v3 = v0[11];
  uint64_t v4 = sub_100023C44();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_retain_n();
  swift_retain_n();
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v25 = v0[12];
    uint64_t v26 = v0[11];
    uint64_t v27 = v0[13];
    uint64_t v7 = v0[6];
    uint64_t v8 = swift_slowAlloc();
    uint64_t v29 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315650;
    v0[2] = sub_10001CEC4(0x29286873696E6966, 0xE800000000000000, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v8 + 12) = 2080;
    os_log_type_t type = v6;
    uint64_t v9 = Activity.id.getter();
    v0[3] = sub_10001CEC4(v9, v10, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    uint64_t v11 = swift_release_n();
    *(_WORD *)(v8 + 22) = 2080;
    uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 128))(v11);
    if (v13)
    {
      unint64_t v14 = v13;
    }
    else
    {
      uint64_t v12 = 1819047246;
      unint64_t v14 = 0xE400000000000000;
    }
    v0[4] = sub_10001CEC4(v12, v14, &v29);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl((void *)&_mh_execute_header, v5, type, "%s end activity=%s currentSessionID=%s", (uint8_t *)v8, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v27, v26);
  }
  else
  {
    uint64_t v16 = v0[12];
    uint64_t v15 = v0[13];
    uint64_t v17 = v0[11];
    swift_release_n();
    swift_release_n();

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  }
  uint64_t v18 = v0[10];
  uint64_t v19 = sub_10001D7EC((uint64_t *)&unk_100047640);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v18, 1, 1, v19);
  static ActivityUIDismissalPolicy.immediate.getter();
  uint64_t v28 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
                                                 + async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:));
  uint64_t v20 = (void *)swift_task_alloc();
  v0[14] = v20;
  *uint64_t v20 = v0;
  v20[1] = sub_100021390;
  uint64_t v21 = v0[9];
  uint64_t v22 = v0[10];
  return v28(v22, v21);
}

uint64_t sub_100021390()
{
  uint64_t v1 = *(void *)(*v0 + 80);
  uint64_t v2 = *(void *)(*v0 + 72);
  uint64_t v3 = *(void *)(*v0 + 64);
  uint64_t v4 = *(void *)(*v0 + 56);
  uint64_t v7 = *v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_10001E2A0(v1, &qword_100047638);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v7 + 8);
  return v5();
}

uint64_t sub_100021538(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10001E2A0(a1, &qword_100047480);
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
  sub_10001D7EC(&qword_100047630);
  return swift_task_create();
}

uint64_t sub_1000216EC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v24 - v7;
  uint64_t v9 = sub_100023C44();
  uint64_t v26 = *(void (**)(char *))(v3 + 16);
  uint64_t v27 = v9;
  v26(v8);
  unint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v24 = v2;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v25 = v3;
    uint64_t v29 = v13;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v28 = sub_10001CEC4(0xD000000000000012, 0x8000000100037780, &v29);
    uint64_t v2 = v24;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s", v12, 0xCu);
    swift_arrayDestroy();
    uint64_t v3 = v25;
    swift_slowDealloc();
    swift_slowDealloc();
  }

  unint64_t v14 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  uint64_t v15 = v14(v8, v2);
  if ((*(uint64_t (**)(uint64_t))(*(void *)v1 + 104))(v15))
  {
    Activity.id.getter();
    swift_release();
    id v16 = objc_allocWithZone((Class)SNAProminentPresentationAssertion);
    NSString v17 = String._bridgeToObjectiveC()();
    NSString v18 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v19 = [v16 initWithExplanation:v17 sessionIdentifier:v18 invalidationHandler:0];

    return (*(uint64_t (**)(id))(*(void *)v1 + 160))(v19);
  }
  else
  {
    ((void (*)(char *, uint64_t, uint64_t))v26)(v6, v27, v2);
    uint64_t v21 = Logger.logObject.getter();
    os_log_type_t v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = (uint8_t *)swift_slowAlloc();
      uint64_t v29 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315138;
      uint64_t v28 = sub_10001CEC4(0xD000000000000012, 0x8000000100037780, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s SessionIdentifier nil", v23, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return v14(v6, v2);
  }
}

uint64_t sub_100021B50(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10001D7EC(&qword_100047480);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  id v16 = (char *)&v46 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  id v19 = (char *)&v46 - v18;
  if (a2)
  {
    uint64_t v20 = *(uint64_t (**)(uint64_t))(*(void *)v3 + 128);
    uint64_t v49 = *(void *)v3 + 128;
    uint64_t v21 = v20(v17);
    if (v22)
    {
      if (v21 == a1 && v22 == a2)
      {
        swift_bridgeObjectRelease();
LABEL_19:
        uint64_t v38 = type metadata accessor for TaskPriority();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v38 - 8) + 56))(v8, 1, 1, v38);
        uint64_t v39 = (void *)swift_allocObject();
        v39[2] = 0;
        v39[3] = 0;
        v39[4] = v3;
        swift_retain();
        sub_100021538((uint64_t)v8, (uint64_t)&unk_1000474A8, (uint64_t)v39);
        uint64_t v40 = swift_release();
        os_log_type_t v41 = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 152))(v40);
        [v41 invalidate];

        (*(void (**)(void, void))(*(void *)v3 + 136))(0, 0);
        uint64_t v42 = sub_100023C44();
        (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v42, v9);
        uint64_t v43 = Logger.logObject.getter();
        os_log_type_t v44 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v43, v44))
        {
          unint64_t v45 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v45 = 0;
          _os_log_impl((void *)&_mh_execute_header, v43, v44, "finishSession(_:)", v45, 2u);
          swift_slowDealloc();
        }

        return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
      }
      char v48 = v20;
      char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if (v24) {
        goto LABEL_19;
      }
    }
    else
    {
      char v48 = v20;
    }
    uint64_t v30 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v16, v30, v9);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v46 = swift_slowAlloc();
      uint64_t v51 = v46;
      *(_DWORD *)uint64_t v33 = 136315650;
      uint64_t v50 = sub_10001CEC4(0xD000000000000011, 0x80000001000377A0, &v51);
      uint64_t v47 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v50 = sub_10001CEC4(a1, a2, &v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      uint64_t v34 = swift_bridgeObjectRelease_n();
      *(_WORD *)(v33 + 22) = 2080;
      uint64_t v35 = v48(v34);
      if (v36)
      {
        unint64_t v37 = v36;
      }
      else
      {
        uint64_t v35 = 1819047246;
        unint64_t v37 = 0xE400000000000000;
      }
      uint64_t v50 = sub_10001CEC4(v35, v37, &v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "%s sessionID=%s not equal to currentSessionID=%s", (uint8_t *)v33, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v16, v47);
    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v16, v9);
    }
  }
  else
  {
    uint64_t v25 = sub_100023C44();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v19, v25, v9);
    uint64_t v26 = Logger.logObject.getter();
    uint64_t v27 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v26, (os_log_type_t)v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      uint64_t v51 = swift_slowAlloc();
      *(_DWORD *)uint64_t v28 = 136315138;
      uint64_t v50 = sub_10001CEC4(0xD000000000000011, 0x80000001000377A0, &v51);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v26, (os_log_type_t)v27, "%s sessionID is nil", v28, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v19, v9);
  }
}

uint64_t sub_100022218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[2] = a1;
  v4[3] = a4;
  uint64_t v5 = type metadata accessor for ActivityUIDismissalPolicy();
  v4[4] = v5;
  v4[5] = *(void *)(v5 - 8);
  v4[6] = swift_task_alloc();
  sub_10001D7EC(&qword_100047638);
  v4[7] = swift_task_alloc();
  return _swift_task_switch(sub_100022308, 0, 0);
}

uint64_t sub_100022308()
{
  uint64_t v1 = (*(uint64_t (**)(void))(**(void **)(v0 + 24) + 104))();
  *(void *)(v0 + 64) = v1;
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 56);
    uint64_t v3 = sub_10001D7EC((uint64_t *)&unk_100047640);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56))(v2, 1, 1, v3);
    static ActivityUIDismissalPolicy.immediate.getter();
    uint64_t v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)&async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:)
                                                  + async function pointer to dispatch thunk of Activity.end(_:dismissalPolicy:));
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 72) = v4;
    void *v4 = v0;
    v4[1] = sub_10002248C;
    uint64_t v5 = *(void *)(v0 + 48);
    uint64_t v6 = *(void *)(v0 + 56);
    return v9(v6, v5);
  }
  else
  {
    **(unsigned char **)(v0 + 16) = 1;
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = *(uint64_t (**)(void))(v0 + 8);
    return v8();
  }
}

uint64_t sub_10002248C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 56);
  uint64_t v2 = *(void *)(*(void *)v0 + 48);
  uint64_t v3 = *(void *)(*(void *)v0 + 40);
  uint64_t v4 = *(void *)(*(void *)v0 + 32);
  swift_task_dealloc();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_10001E2A0(v1, &qword_100047638);
  return _swift_task_switch(sub_10002262C, 0, 0);
}

uint64_t sub_10002262C()
{
  **(unsigned char **)(v0 + 16) = *(void *)(v0 + 64) == 0;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_1000226A8()
{
  swift_release();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_1000226D8()
{
  swift_release();
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 48, 7);
}

double sub_100022720()
{
  double result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  return result;
}

uint64_t type metadata accessor for RPSessionGateway()
{
  return self;
}

id sub_1000227BC()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_1000227F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPSessionProxy();
  return [super init];
}

id sub_100022864()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPSessionProxy();
  return [super dealloc];
}

uint64_t sub_100022898(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100022974;
  return v6(a1);
}

uint64_t sub_100022974()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  id v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100022A6C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100022AB4()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_100023BB4;
  return sub_100020E98((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_100022B4C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100023BB4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100047760 + dword_100047760);
  return v6(a1, v4);
}

uint64_t sub_100022C04()
{
  swift_unknownObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100022C44(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_100022CE4;
  return sub_100022218(a1, v5, v6, v4);
}

uint64_t sub_100022CE4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100022DD8(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_100022EB8;
  return v5(v2 + 32);
}

uint64_t sub_100022EB8()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_100023414()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for RPSessionGateway();
  uint64_t inited = swift_initStaticObject();
  uint64_t v5 = (*(uint64_t (**)(void))(*(void *)inited + 128))();
  unint64_t v7 = v6;
  uint64_t v8 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v8, v0);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v20 = v17;
    *(_DWORD *)uint64_t v11 = 136315394;
    uint64_t v19 = sub_10001CEC4(0xD000000000000012, 0x8000000100037810, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v11 + 12) = 2080;
    if (v7) {
      uint64_t v12 = v5;
    }
    else {
      uint64_t v12 = 1819047246;
    }
    uint64_t v18 = v5;
    if (v7) {
      unint64_t v13 = v7;
    }
    else {
      unint64_t v13 = 0xE400000000000000;
    }
    uint64_t v16 = v0;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_10001CEC4(v12, v13, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    uint64_t v5 = v18;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s sessionID=%s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v16);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return v5;
}

uint64_t type metadata accessor for RPSessionProxy()
{
  return self;
}

unint64_t sub_100023718()
{
  unint64_t result = qword_1000474B0;
  if (!qword_1000474B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000474B0);
  }
  return result;
}

unint64_t sub_100023770()
{
  unint64_t result = qword_1000474B8;
  if (!qword_1000474B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000474B8);
  }
  return result;
}

unint64_t sub_1000237C8()
{
  unint64_t result = qword_1000474C0;
  if (!qword_1000474C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000474C0);
  }
  return result;
}

unint64_t sub_100023820()
{
  unint64_t result = qword_1000474C8;
  if (!qword_1000474C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000474C8);
  }
  return result;
}

unint64_t sub_100023878()
{
  unint64_t result = qword_1000474D0;
  if (!qword_1000474D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000474D0);
  }
  return result;
}

unint64_t sub_1000238D0()
{
  unint64_t result = qword_1000474D8;
  if (!qword_1000474D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000474D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ReplayKitAttributes()
{
  return &type metadata for ReplayKitAttributes;
}

ValueMetadata *type metadata accessor for ReplayKitAttributes.ContentState()
{
  return &type metadata for ReplayKitAttributes.ContentState;
}

ValueMetadata *type metadata accessor for ReplayKitAttributes.CodingKeys()
{
  return &type metadata for ReplayKitAttributes.CodingKeys;
}

ValueMetadata *type metadata accessor for ReplayKitAttributes.ContentState.CodingKeys()
{
  return &type metadata for ReplayKitAttributes.ContentState.CodingKeys;
}

unint64_t sub_100023968()
{
  unint64_t result = qword_100048960;
  if (!qword_100048960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100048960);
  }
  return result;
}

unint64_t sub_1000239C0()
{
  unint64_t result = qword_100048968[0];
  if (!qword_100048968[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_100048968);
  }
  return result;
}

unint64_t sub_100023A18()
{
  unint64_t result = qword_1000489F0;
  if (!qword_1000489F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000489F0);
  }
  return result;
}

unint64_t sub_100023A70()
{
  unint64_t result = qword_1000489F8[0];
  if (!qword_1000489F8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000489F8);
  }
  return result;
}

uint64_t sub_100023AC4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100023AFC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100022CE4;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100047620 + dword_100047620);
  return v6(a1, v4);
}

uint64_t sub_100023BC0()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100023CE0(v0, qword_100048C58);
  sub_100023CA8(v0, (uint64_t)qword_100048C58);
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100023C44()
{
  if (qword_100048A80 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();

  return sub_100023CA8(v0, (uint64_t)qword_100048C58);
}

uint64_t sub_100023CA8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100023CE0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100023D44()
{
  uint64_t v0 = sub_10001D7EC(&qword_100047650);
  sub_100023CE0(v0, qword_100048C70);
  sub_100023CA8(v0, (uint64_t)qword_100048C70);
  sub_10001D7EC((uint64_t *)&unk_1000477F0);
  type metadata accessor for Tips.ParameterOption();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_10002F810;
  static Tips.ParameterOption.transient.getter();
  return Tips.Parameter.init<A>(_:_:_:_:)();
}

uint64_t sub_100023E80()
{
  if (qword_100048A90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001D7EC(&qword_100047650);

  return sub_100023CA8(v0, (uint64_t)qword_100048C70);
}

uint64_t sub_100023EE8@<X0>(uint64_t a1@<X8>)
{
  if (qword_100048A90 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001D7EC(&qword_100047650);
  uint64_t v3 = sub_100023CA8(v2, (uint64_t)qword_100048C70);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_100023FAC(uint64_t a1)
{
  if (qword_100048A90 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10001D7EC(&qword_100047650);
  uint64_t v3 = sub_100023CA8(v2, (uint64_t)qword_100048C70);
  swift_beginAccess();
  uint64_t v4 = *(void *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*sub_1000240A8())()
{
  if (qword_100048A90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001D7EC(&qword_100047650);
  sub_100023CA8(v0, (uint64_t)qword_100048C70);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_100024140()
{
  if (qword_100048A90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001D7EC(&qword_100047650);
  sub_100023CA8(v0, (uint64_t)qword_100048C70);
  swift_beginAccess();
  Tips.Parameter.wrappedValue.getter();
  swift_endAccess();
  return v2;
}

uint64_t sub_1000241E0()
{
  if (qword_100048A90 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10001D7EC(&qword_100047650);
  sub_100023CA8(v0, (uint64_t)qword_100048C70);
  swift_beginAccess();
  Tips.Parameter.wrappedValue.setter();
  return swift_endAccess();
}

void (*sub_100024290(void *a1))(uint64_t a1)
{
  unsigned __int8 v2 = malloc(0x30uLL);
  *a1 = v2;
  if (qword_100048A90 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10001D7EC(&qword_100047650);
  v2[3] = v3;
  v2[4] = sub_100023CA8(v3, (uint64_t)qword_100048C70);
  swift_beginAccess();
  Tips.Parameter.wrappedValue.getter();
  char v4 = *((unsigned char *)v2 + 41);
  swift_endAccess();
  *((unsigned char *)v2 + 40) = v4;
  return sub_10002437C;
}

void sub_10002437C(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  *(unsigned char *)(*(void *)a1 + 41) = *(unsigned char *)(*(void *)a1 + 40);
  swift_beginAccess();
  Tips.Parameter.wrappedValue.setter();
  swift_endAccess();

  free(v1);
}

uint64_t sub_1000243F0(uint64_t a1)
{
  return a1;
}

uint64_t sub_100024424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_10002445C()
{
  return Image.init(_internalSystemName:)(0xD000000000000018, 0x8000000100037850);
}

uint64_t sub_100024478()
{
  uint64_t v0 = self;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v1];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100027AF8();
  return Text.init<A>(_:)();
}

uint64_t sub_10002452C()
{
  uint64_t v0 = self;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 _rpLocalizedStringFromFrameworkBundleWithKey:v1];

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100027AF8();
  return Text.init<A>(_:)();
}

uint64_t sub_1000245E0()
{
  uint64_t v0 = sub_10001D7EC(&qword_100047650);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Tips.Rule();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100048A90 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_100023CA8(v0, (uint64_t)qword_100048C70);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v8, v0);
  Tips.Rule.init<A>(_:_:)();
  static Tips.RuleBuilder.buildExpression(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v9 = static Tips.RuleBuilder.buildPartialBlock(first:)();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1000247F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_10001D7EC(&qword_1000477B0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_10001D7EC(&qword_1000477B8);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10002864C(&qword_1000477C0, &qword_1000477B8);
  static PredicateExpressions.build_Arg<A>(_:)();
  v11[15] = 1;
  static PredicateExpressions.build_Arg<A>(_:)();
  a1[3] = sub_10001D7EC(&qword_1000477C8);
  a1[4] = sub_1000284D4();
  sub_1000285E8(a1);
  sub_10002864C(&qword_1000477E8, &qword_1000477B0);
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100024A3C()
{
  uint64_t v0 = sub_10001D7EC(&qword_100047660);
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Tips.MaxDisplayCount();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10001D7EC(&qword_100047668);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Tips.MaxDisplayCount.init(_:)();
  static Tips.OptionsBuilder.buildExpression<A>(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v15 = v4;
  uint64_t v16 = &protocol witness table for Tips.MaxDisplayCount;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  static Tips.OptionsBuilder.buildPartialBlock<A>(first:)();
  uint64_t v15 = v8;
  uint64_t v16 = (void *)OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v13 = static Tips.OptionsBuilder.buildFinalResult<A>(_:)();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v13;
}

uint64_t sub_100024CD8()
{
  return sub_100027A7C(*(void *)v0, *(void **)(v0 + 8));
}

uint64_t sub_100024CE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100027A7C(*(void *)v1, *(void **)(v1 + 8));
  *a1 = result;
  a1[1] = v4;
  return result;
}

id sub_100024D10(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  id v9 = objc_allocWithZone(v4);
  return sub_100024D6C(a1, a2, a3, a4);
}

id sub_100024D6C(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_layoutConstraints] = &_swiftEmptyArrayStorage;
  uint64_t v13 = v4;
  uint64_t v14 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v14, v9);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  int v17 = v16;
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v28 = a1;
    uint64_t v19 = v18;
    uint64_t v26 = swift_slowAlloc();
    uint64_t v30 = v26;
    *(_DWORD *)uint64_t v19 = 136315650;
    HIDWORD(v25) = v17;
    uint64_t v29 = sub_10001CEC4(0xD000000000000017, 0x80000001000378B0, &v30);
    uint64_t v27 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_10001CEC4(v28, a2, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_10001CEC4(a3, a4, &v30);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v15, BYTE4(v25), "%s appName=%s bundleID=%s", (uint8_t *)v19, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v28;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v27);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  uint64_t v20 = (uint64_t *)&v13[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_appName];
  *uint64_t v20 = a1;
  v20[1] = a2;
  uint64_t v21 = (uint64_t *)&v13[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_bundleID];
  *uint64_t v21 = a3;
  v21[1] = a4;
  id v22 = [objc_allocWithZone((Class)UIView) init];
  *(void *)&v13[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView] = v22;

  uint64_t v23 = (objc_class *)type metadata accessor for RPReactionsTipViewController();
  v31.receiver = v13;
  v31.super_class = v23;
  return [super initWithNibName:0 bundle:0];
}

id sub_100025100(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_layoutConstraints] = &_swiftEmptyArrayStorage;
  uint64_t v3 = &v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_appName];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0xE000000000000000;
  uint64_t v4 = &v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_bundleID];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0xE000000000000000;
  id v5 = objc_allocWithZone((Class)UIView);
  uint64_t v6 = v1;
  id v7 = [v5 init];
  *(void *)&v6[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView] = v7;

  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for RPReactionsTipViewController();
  [super initWithCoder:a1];

  return v8;
}

void sub_100025210()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  uint64_t v6 = v0;
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  uint64_t v9 = &off_100045000;
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v10 = swift_slowAlloc();
    uint64_t v33 = (void *)swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    uint64_t v36 = v34;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v35 = sub_10001CEC4(0x4C64694477656976, 0xED0000292864616FLL, &v36);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v10 + 12) = 2112;
    id v11 = [v6 view];
    if (!v11) {
      goto LABEL_10;
    }
    uint64_t v12 = v11;
    [v11 frame];
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;

    v38.origin.x = v14;
    v38.origin.y = v16;
    v38.size.width = v18;
    v38.size.height = v20;
    CFDictionaryRef DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v38);
    uint64_t v35 = (uint64_t)DictionaryRepresentation;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v33 = DictionaryRepresentation;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s self.view.frame=%@", (uint8_t *)v10, 0x16u);
    sub_10001D7EC(&qword_1000470C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    uint64_t v9 = &off_100045000;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  id v22 = (objc_class *)type metadata accessor for RPReactionsTipViewController();
  v37.receiver = v6;
  v37.super_class = v22;
  [super viewDidLoad];
  id v23 = [v6 v9[259]];
  if (v23)
  {
    char v24 = v23;
    uint64_t v25 = OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView;
    [v23 addSubview:*(void *)((char *)v6 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView)];

    id v26 = [v6 v9[259]];
    if (v26)
    {
      uint64_t v27 = v26;
      [v26 setUserInteractionEnabled:0];

      id v28 = [*(id *)((char *)v6 + v25) setUserInteractionEnabled:0];
      (*(void (**)(id))((swift_isaMask & *v6) + 0x118))(v28);
      uint64_t v29 = self;
      sub_100027B70();
      swift_bridgeObjectRetain();
      Class isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v29 activateConstraints:isa];

      uint64_t v31 = static Tips.configure(_:)();
      (*(void (**)(uint64_t))((swift_isaMask & *v6) + 0x120))(v31);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
LABEL_10:

  __break(1u);
}

uint64_t sub_100025700(int a1)
{
  uint64_t v2 = v1;
  LODWORD(v3) = a1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  uint64_t v9 = Logger.logObject.getter();
  os_log_type_t v10 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    int v16 = (int)v3;
    uint64_t v3 = (uint8_t *)v11;
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 136315138;
    uint64_t v17 = sub_10001CEC4(0xD000000000000015, 0x80000001000378D0, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "%s", v3, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    LOBYTE(v3) = v16;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v12 = (objc_class *)type metadata accessor for RPReactionsTipViewController();
  v19.receiver = v2;
  v19.super_class = v12;
  [super viewWillDisappear:v3 & 1];
  uint64_t v13 = OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask;
  if (*(void *)&v2[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask])
  {
    swift_retain();
    Task.cancel()();
    swift_release();
  }
  *(void *)&v2[v13] = 0;
  return swift_release();
}

id sub_1000259C4()
{
  uint64_t v1 = v0;
  id result = [v0 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v3 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v4 = OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView;
  [*(id *)&v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView] setTranslatesAutoresizingMaskIntoConstraints:0];
  sub_10001D7EC((uint64_t *)&unk_1000470B0);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_10002F7F0;
  id v6 = [*(id *)&v1[v4] topAnchor];
  id result = [v1 view];
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  id v7 = result;
  id v8 = [result topAnchor];

  id v9 = [v6 constraintEqualToAnchor:v8];
  *(void *)(v5 + 32) = v9;
  id v10 = [*(id *)&v1[v4] trailingAnchor];
  id result = [v1 view];
  if (!result)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  uint64_t v11 = result;
  id v12 = [result trailingAnchor];

  id v13 = [v10 constraintEqualToAnchor:v12 constant:10.0];
  *(void *)(v5 + 40) = v13;
  id v14 = [*(id *)&v1[v4] widthAnchor];
  id v15 = [v14 constraintEqualToConstant:150.0];

  *(void *)(v5 + 48) = v15;
  id v16 = [*(id *)&v1[v4] heightAnchor];
  id v17 = [v16 constraintEqualToConstant:45.0];

  *(void *)(v5 + 56) = v17;
  specialized Array._endMutation()();
  *(void *)&v1[OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_layoutConstraints] = v5;

  return (id)swift_bridgeObjectRelease();
}

uint64_t sub_100025C3C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10001D7EC(&qword_100047480);
  __chkstk_darwin(v2 - 8);
  uint64_t v49 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = type metadata accessor for Tips.Status();
  uint64_t v4 = *(void *)(v58 - 8);
  uint64_t v5 = __chkstk_darwin(v58);
  id v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v57 = (char *)&v49 - v8;
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v54 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v14 = (char *)&v49 - v13;
  uint64_t v15 = sub_100023C44();
  id v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  uint64_t v52 = v15;
  uint64_t v53 = v10 + 16;
  uint64_t v51 = v16;
  ((void (*)(char *))v16)(v14);
  id v17 = Logger.logObject.getter();
  os_log_type_t v18 = static os_log_type_t.default.getter();
  BOOL v19 = os_log_type_enabled(v17, v18);
  uint64_t v59 = v1;
  uint64_t v56 = v9;
  if (v19)
  {
    CGFloat v20 = (uint8_t *)swift_slowAlloc();
    uint64_t v21 = swift_slowAlloc();
    uint64_t v55 = v10;
    v61[0] = v21;
    *(_DWORD *)CGFloat v20 = 136315138;
    uint64_t v60 = sub_10001CEC4(0xD00000000000001BLL, 0x80000001000378F0, v61);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v1 = v59;
    swift_slowDealloc();

    id v22 = *(uint64_t (**)(char *, uint64_t))(v55 + 8);
  }
  else
  {

    id v22 = *(uint64_t (**)(char *, uint64_t))(v10 + 8);
  }
  uint64_t v50 = v22;
  v22(v14, v9);
  uint64_t v24 = *(void *)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_bundleID);
  uint64_t v23 = *(void *)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_bundleID + 8);
  uint64_t v25 = *(void *)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_appName);
  uint64_t v26 = *(void *)((char *)v1 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_appName + 8);
  uint64_t v27 = qword_100048A90;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v27 != -1) {
    swift_once();
  }
  uint64_t v28 = sub_10001D7EC(&qword_100047650);
  sub_100023CA8(v28, (uint64_t)qword_100048C70);
  LOBYTE(v60) = 1;
  swift_beginAccess();
  Tips.Parameter.wrappedValue.setter();
  swift_endAccess();
  uint64_t v55 = v24;
  v61[0] = v24;
  v61[1] = v23;
  v61[2] = v25;
  v61[3] = v26;
  sub_100027BB0();
  uint64_t v29 = v57;
  Tip.status.getter();
  uint64_t v30 = enum case for Tips.InvalidationReason.displayCountExceeded(_:);
  uint64_t v31 = type metadata accessor for Tips.InvalidationReason();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v7, v30, v31);
  uint64_t v32 = v58;
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v7, enum case for Tips.Status.invalidated(_:), v58);
  LOBYTE(v30) = static Tips.Status.== infix(_:_:)();
  uint64_t v33 = *(void (**)(char *, uint64_t))(v4 + 8);
  v33(v7, v32);
  v33(v29, v32);
  if (v30)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v34 = v54;
    uint64_t v35 = v56;
    v51(v54, v52, v56);
    uint64_t v36 = Logger.logObject.getter();
    os_log_type_t v37 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v36, v37))
    {
      CGRect v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)CGRect v38 = 0;
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "tip invalidated removing scene", v38, 2u);
      swift_slowDealloc();
    }

    uint64_t v39 = v50(v34, v35);
    return (*(uint64_t (**)(uint64_t))((swift_isaMask & *v59) + 0x138))(v39);
  }
  else
  {
    uint64_t v41 = OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask;
    uint64_t v42 = (char *)v59;
    uint64_t v43 = *(void *)((char *)v59 + OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipObservationTask);
    if (v43)
    {
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v44 = type metadata accessor for TaskPriority();
      uint64_t v45 = (uint64_t)v49;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v44 - 8) + 56))(v49, 1, 1, v44);
      type metadata accessor for MainActor();
      uint64_t v46 = v42;
      uint64_t v47 = static MainActor.shared.getter();
      char v48 = (void *)swift_allocObject();
      void v48[2] = v47;
      v48[3] = &protocol witness table for MainActor;
      v48[4] = v55;
      v48[5] = v23;
      v48[6] = v25;
      v48[7] = v26;
      v48[8] = v46;
      uint64_t v42 = (char *)v59;
      uint64_t v43 = sub_1000272A0(v45, (uint64_t)&unk_1000476C0, (uint64_t)v48);
    }
    *(void *)&v42[v41] = v43;
    return swift_release();
  }
}

uint64_t sub_100026308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[18] = a7;
  v8[19] = a8;
  v8[16] = a5;
  v8[17] = a6;
  v8[15] = a4;
  sub_10001D7EC(&qword_100047770);
  v8[20] = swift_task_alloc();
  uint64_t v9 = type metadata accessor for Tips.Status();
  v8[21] = v9;
  v8[22] = *(void *)(v9 - 8);
  v8[23] = swift_task_alloc();
  v8[24] = sub_10001D7EC(&qword_100047778);
  v8[25] = swift_task_alloc();
  v8[26] = sub_10001D7EC(&qword_100047780);
  v8[27] = swift_task_alloc();
  uint64_t v10 = sub_10001D7EC(&qword_100047788);
  v8[28] = v10;
  v8[29] = *(void *)(v10 - 8);
  v8[30] = swift_task_alloc();
  uint64_t v11 = sub_10001D7EC(&qword_100047790);
  v8[31] = v11;
  v8[32] = *(void *)(v11 - 8);
  v8[33] = swift_task_alloc();
  v8[34] = swift_task_alloc();
  v8[35] = type metadata accessor for MainActor();
  v8[36] = static MainActor.shared.getter();
  uint64_t v13 = dispatch thunk of Actor.unownedExecutor.getter();
  v8[37] = v13;
  v8[38] = v12;
  return _swift_task_switch(sub_100026570, v13, v12);
}

uint64_t sub_100026570()
{
  *(_OWORD *)(v0 + 56) = *(_OWORD *)(v0 + 120);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v2 = *(void *)(v0 + 240);
  uint64_t v3 = *(void *)(v0 + 224);
  uint64_t v4 = *(void *)(v0 + 144);
  *(void *)(v0 + 72) = *(void *)(v0 + 136);
  *(void *)(v0 + 80) = v4;
  *(void *)(v0 + 312) = sub_100027BB0();
  Tip.shouldDisplayUpdates.getter();
  AsyncMapSequence.base.getter();
  sub_10002864C(&qword_100047798, &qword_100047778);
  dispatch thunk of AsyncSequence.makeAsyncIterator()();
  AsyncMapSequence.transform.getter();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v2, v3);
  AsyncMapSequence.Iterator.init(_:transform:)();
  *(void *)(v0 + 320) = OBJC_IVAR____TtC14ReplayKitAngel28RPReactionsTipViewController_tipAnchorView;
  uint64_t v5 = static MainActor.shared.getter();
  *(void *)(v0 + 328) = v5;
  if (v5)
  {
    swift_getObjectType();
    uint64_t v6 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  *(void *)(v0 + 336) = v6;
  *(void *)(v0 + 344) = v8;
  return _swift_task_switch(sub_10002671C, v6, v8);
}

uint64_t sub_10002671C()
{
  uint64_t v1 = v0[41];
  v0[44] = AsyncMapSequence.Iterator.baseIterator.modify();
  sub_10002864C((unint64_t *)&unk_1000477A0, &qword_100047780);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[45] = v2;
  void *v2 = v0;
  v2[1] = sub_100026818;
  uint64_t v3 = v0[20];
  return __sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v3, v1, &protocol witness table for MainActor);
}

uint64_t sub_100026818()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 336);
    uint64_t v4 = *(void *)(v2 + 344);
    uint64_t v5 = sub_100026B3C;
  }
  else
  {
    (*(void (**)(void))(v2 + 352))();
    uint64_t v3 = *(void *)(v2 + 336);
    uint64_t v4 = *(void *)(v2 + 344);
    uint64_t v5 = sub_100026940;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100026940()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[20];
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_10001E2A0(v3, &qword_100047770);
    swift_release();
    uint64_t v4 = v0[37];
    uint64_t v5 = v0[38];
    return _swift_task_switch(sub_100026D84, v4, v5);
  }
  else
  {
    uint64_t v7 = v0[33];
    uint64_t v6 = v0[34];
    uint64_t v8 = v0[31];
    uint64_t v9 = v0[32];
    (*(void (**)(void, uint64_t, uint64_t))(v2 + 32))(v0[23], v3, v1);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v7, v6, v8);
    uint64_t v10 = (int *)AsyncMapSequence.Iterator.transform.getter();
    v0[46] = v11;
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    uint64_t v15 = (int *)((char *)v10 + *v10);
    uint64_t v12 = (void *)swift_task_alloc();
    v0[47] = v12;
    void *v12 = v0;
    v12[1] = sub_100026B54;
    uint64_t v13 = v0[23];
    return ((uint64_t (*)(void *, uint64_t))v15)(v0 + 50, v13);
  }
}

uint64_t sub_100026B3C()
{
  return (*(uint64_t (**)(void))(v0 + 352))();
}

uint64_t sub_100026B54()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void *)(*v0 + 184);
  uint64_t v3 = *(void *)(*v0 + 176);
  uint64_t v4 = *(void *)(*v0 + 168);
  swift_task_dealloc();
  swift_release();
  *(unsigned char *)(v1 + 401) = *(unsigned char *)(v1 + 400);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  uint64_t v5 = *(void *)(v1 + 344);
  uint64_t v6 = *(void *)(v1 + 336);
  return _swift_task_switch(sub_100026D00, v6, v5);
}

uint64_t sub_100026D00()
{
  int v1 = *(unsigned __int8 *)(v0 + 401);
  swift_release();
  if (v1 == 1) {
    uint64_t v2 = sub_100026E68;
  }
  else {
    uint64_t v2 = sub_10002712C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100026D84()
{
  (*(void (**)(void, void))(v0[32] + 8))(v0[34], v0[31]);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  int v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100026E68()
{
  *(void *)(v0 + 384) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100026EF4, v2, v1);
}

uint64_t sub_100026EF4()
{
  uint64_t v1 = v0[39];
  uint64_t v2 = v0[40];
  uint64_t v4 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v5 = v0[16];
  uint64_t v6 = v0[17];
  uint64_t v7 = v0[15];
  swift_release();
  type metadata accessor for TipUIPopoverViewController();
  v0[5] = &type metadata for ReactionsTip;
  v0[6] = v1;
  uint64_t v8 = (void *)swift_allocObject();
  v0[2] = v8;
  v8[2] = v7;
  v8[3] = v5;
  v8[4] = v6;
  v8[5] = v4;
  uint64_t v9 = *(void **)(v3 + v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v10 = v9;
  uint64_t v11 = (void *)TipUIPopoverViewController.__allocating_init(_:sourceItem:actionHandler:)();
  swift_unknownObjectRetain();
  TipUIPopoverViewController.presentationDelegate.setter();
  uint64_t v12 = (uint64_t (*)())[v11 view];
  if (v12)
  {
    uint64_t v15 = v12;
    uint64_t v16 = (void *)v0[19];
    id v17 = [self darkGrayColor];
    [v15 setTintColor:v17];

    [v16 presentViewController:v11 animated:1 completion:0];
    uint64_t v13 = v0[37];
    uint64_t v14 = v0[38];
    uint64_t v12 = sub_100027094;
  }
  else
  {
    __break(1u);
  }
  return _swift_task_switch(v12, v13, v14);
}

uint64_t sub_100027094()
{
  uint64_t v1 = static MainActor.shared.getter();
  v0[41] = v1;
  if (v1)
  {
    swift_getObjectType();
    uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
    uint64_t v4 = v3;
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v4 = 0;
  }
  v0[42] = v2;
  v0[43] = v4;
  return _swift_task_switch(sub_10002671C, v2, v4);
}

uint64_t sub_10002712C()
{
  *(void *)(v0 + 392) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000271B8, v2, v1);
}

uint64_t sub_1000271B8()
{
  uint64_t v1 = (void *)v0[19];
  swift_release();
  id v2 = [v1 presentedViewController];
  if (v2)
  {
    uint64_t v3 = v2;
    type metadata accessor for TipUIPopoverViewController();
    uint64_t v4 = swift_dynamicCastClass();

    if (v4) {
      (*(void (**)(void))((swift_isaMask & *(void *)v0[19]) + 0x138))();
    }
  }
  uint64_t v5 = v0[37];
  uint64_t v6 = v0[38];
  return _swift_task_switch(sub_100028690, v5, v6);
}

uint64_t sub_1000272A0(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10001E2A0(a1, &qword_100047480);
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

void sub_1000274B8()
{
  id v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v29 - v7;
  uint64_t v9 = sub_100023C44();
  uint64_t v31 = *(void (**)(char *))(v3 + 16);
  uint64_t v32 = v9;
  v31(v8);
  id v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    uint64_t v29 = v3 + 16;
    uint64_t v34 = v13;
    id v30 = v1;
    *(_DWORD *)uint64_t v12 = 136315138;
    uint64_t v33 = sub_10001CEC4(0xD00000000000001CLL, 0x8000000100037910, &v34);
    id v1 = v30;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v8, v2);
  id v15 = [v1 view];
  if (!v15)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v16 = v15;
  id v17 = [v15 window];

  if (v17)
  {
    id v18 = [v17 windowScene];

    if (v18)
    {
      self;
      uint64_t v19 = (void *)swift_dynamicCastObjCClass();
      if (v19)
      {
        [v19 invalidate];

        return;
      }
    }
  }
  ((void (*)(char *, uint64_t, uint64_t))v31)(v6, v32, v2);
  id v1 = v1;
  CGFloat v20 = Logger.logObject.getter();
  os_log_type_t v21 = static os_log_type_t.default.getter();
  if (!os_log_type_enabled(v20, v21))
  {

    uint64_t v28 = v6;
    goto LABEL_13;
  }
  uint64_t v31 = (void (*)(char *))v6;
  uint64_t v32 = v3;
  id v22 = (uint8_t *)swift_slowAlloc();
  uint64_t v34 = swift_slowAlloc();
  *(_DWORD *)id v22 = 136315138;
  id v23 = [v1 view];
  if (!v23)
  {
LABEL_16:

    __break(1u);
    return;
  }
  uint64_t v24 = v23;
  id v25 = [v23 window];

  sub_10001D7EC(&qword_1000476C8);
  uint64_t v26 = _typeName(_:qualified:)();
  uint64_t v33 = sub_10001CEC4(v26, v27, &v34);
  UnsafeMutableRawBufferPointer.copyMemory(from:)();

  swift_bridgeObjectRelease();
  _os_log_impl((void *)&_mh_execute_header, v20, v21, "Expected remote alert scene. scene type=%s", v22, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
  swift_slowDealloc();

  uint64_t v28 = (char *)v31;
LABEL_13:
  v14(v28, v2);
}

void sub_100027950()
{
}

id sub_1000279B4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPReactionsTipViewController();
  return [super dealloc];
}

uint64_t sub_100027A7C(uint64_t a1, void *a2)
{
  strcpy((char *)v6, "ReactionsTip-");
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = a1;
  v4._object = a2;
  String.append(_:)(v4);
  swift_bridgeObjectRelease();
  return v6[0];
}

unint64_t sub_100027AF8()
{
  unint64_t result = qword_100047658;
  if (!qword_100047658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100047658);
  }
  return result;
}

uint64_t type metadata accessor for RPReactionsTipViewController()
{
  return self;
}

unint64_t sub_100027B70()
{
  unint64_t result = qword_1000476A0;
  if (!qword_1000476A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000476A0);
  }
  return result;
}

unint64_t sub_100027BB0()
{
  unint64_t result = qword_1000476B0;
  if (!qword_1000476B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_1000476B0);
  }
  return result;
}

uint64_t sub_100027C04()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_100027C54()
{
  uint64_t v2 = v0[4];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[7];
  uint64_t v6 = v0[8];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_100022CE4;
  return sub_100026308((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_100027F00()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136315138;
    uint64_t v12 = sub_10001CEC4(0xD000000000000024, 0x8000000100037A60, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  uint64_t v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x138))(v10);
}

unint64_t sub_100028138()
{
  unint64_t result = qword_1000476D0;
  if (!qword_1000476D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000476D0);
  }
  return result;
}

void *sub_10002818C()
{
  return &protocol witness table for String;
}

uint64_t initializeBufferWithCopyOfBuffer for ReactionsTip(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ReactionsTip()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for ReactionsTip(void *a1, void *a2)
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

void *assignWithCopy for ReactionsTip(void *a1, void *a2)
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

__n128 initializeWithTake for ReactionsTip(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for ReactionsTip(void *a1, void *a2)
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

uint64_t getEnumTagSinglePayload for ReactionsTip(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ReactionsTip(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ReactionsTip()
{
  return &type metadata for ReactionsTip;
}

uint64_t sub_1000283A4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000283DC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100022CE4;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100047760 + dword_100047760);
  return v6(a1, v4);
}

uint64_t sub_100028494()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

unint64_t sub_1000284D4()
{
  unint64_t result = qword_1000477D0;
  if (!qword_1000477D0)
  {
    sub_10001DB18(&qword_1000477C8);
    sub_10002864C(&qword_1000477D8, &qword_1000477B8);
    sub_100028574();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000477D0);
  }
  return result;
}

unint64_t sub_100028574()
{
  unint64_t result = qword_1000477E0;
  if (!qword_1000477E0)
  {
    sub_10001DB18(&qword_1000477B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000477E0);
  }
  return result;
}

uint64_t *sub_1000285E8(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_10002864C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001DB18(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_1000286E0()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_100028790(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_1000287E4())()
{
  return j__swift_endAccess;
}

id sub_100028840()
{
  uint64_t v1 = OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider);
  }
  else
  {
    type metadata accessor for RPSystemApertureElementViewController();
    id v4 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_1000288B8()
{
  uint64_t v1 = OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)RPStatusBarAssertion) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

uint64_t sub_1000289C0()
{
  return sub_10002977C(0xD000000000000018, 0x8000000100037C40);
}

uint64_t sub_100028ACC()
{
  return sub_10002977C(0xD00000000000001CLL, 0x8000000100037C00);
}

uint64_t sub_100028B74()
{
  return sub_10002977C(0xD00000000000001BLL, 0x8000000100037BE0);
}

id sub_100028C80()
{
  *(void *)&v0[OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate_window] = 0;
  *(void *)&v0[OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___systemApertureElementProvider] = 0;
  *(void *)&v0[OBJC_IVAR____TtC14ReplayKitAngel29RPSessionPlatterSceneDelegate____lazy_storage___statusBarAssertion] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPSessionPlatterSceneDelegate();
  return [super init];
}

id sub_100028D3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPSessionPlatterSceneDelegate();
  return [super dealloc];
}

void sub_100028DCC(void *a1)
{
  id v57 = a1;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4);
  uint64_t v9 = (char *)&v48 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v48 - v10;
  uint64_t v12 = sub_100023C44();
  uint64_t v13 = *(void (**)(char *))(v3 + 16);
  uint64_t v54 = v12;
  uint64_t v56 = v3 + 16;
  v13(v11);
  id v14 = v1;
  id v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.default.getter();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v53 = v9;
  uint64_t v55 = (void (*)(char *, uint64_t, uint64_t))v13;
  if (v17)
  {
    uint64_t v18 = swift_slowAlloc();
    uint64_t v52 = v2;
    uint64_t v19 = v18;
    CGFloat v20 = (void *)swift_slowAlloc();
    uint64_t v49 = swift_slowAlloc();
    uint64_t v59 = v49;
    *(_DWORD *)uint64_t v19 = 136315650;
    uint64_t v58 = sub_10001CEC4(0xD00000000000001FLL, 0x8000000100037C60, &v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v19 + 12) = 2112;
    uint64_t v50 = v6;
    uint64_t v51 = v3;
    uint64_t v58 = (uint64_t)v14;
    id v21 = v14;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *CGFloat v20 = v14;

    *(_WORD *)(v19 + 22) = 2112;
    id v22 = sub_100028840();
    uint64_t v58 = (uint64_t)v22;
    id v6 = v50;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    v20[1] = v22;
    uint64_t v3 = v51;

    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%s %@ connecting PlatterSceneDelegate scene systemApertureElementProvider=%@", (uint8_t *)v19, 0x20u);
    sub_10001D7EC(&qword_1000470C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v52;
    swift_slowDealloc();
  }
  else
  {
  }
  id v23 = *(void (**)(char *, uint64_t))(v3 + 8);
  v23(v11, v2);
  uint64_t v24 = v57;
  type metadata accessor for ActivityScene();
  uint64_t v25 = swift_dynamicCastClass();
  if (v25)
  {
    uint64_t v26 = (void *)v25;
    id v27 = v24;
    if (objc_msgSend(v26, "SBUI_isHostedBySystemAperture"))
    {
      id v28 = sub_1000288B8();
      [v28 showStatusBarWithPid:getpid()];

      id v29 = v27;
      id v30 = sub_100028840();
      [v26 setSystemApertureElementViewControllerProvider:v30];

      uint64_t v31 = v53;
      v55(v53, v54, v2);
      id v32 = v14;
      uint64_t v33 = Logger.logObject.getter();
      os_log_type_t v34 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v33, v34))
      {
        uint64_t v35 = swift_slowAlloc();
        uint64_t v52 = v2;
        uint64_t v36 = v35;
        os_log_type_t v37 = (void *)swift_slowAlloc();
        uint64_t v56 = swift_slowAlloc();
        uint64_t v59 = v56;
        *(_DWORD *)uint64_t v36 = 136315650;
        uint64_t v38 = sub_10001CEC4(0xD00000000000001FLL, 0x8000000100037C60, &v59);
        id v57 = v29;
        uint64_t v58 = v38;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *(_WORD *)(v36 + 12) = 2112;
        uint64_t v51 = v3;
        uint64_t v58 = (uint64_t)v32;
        id v39 = v32;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *os_log_type_t v37 = v32;

        *(_WORD *)(v36 + 22) = 2112;
        id v40 = sub_100028840();
        uint64_t v58 = (uint64_t)v40;
        id v29 = v57;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        v37[1] = v40;

        _os_log_impl((void *)&_mh_execute_header, v33, v34, "%s %@ adding connectionManager delegate=%@", (uint8_t *)v36, 0x20u);
        sub_10001D7EC(&qword_1000470C0);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v41 = v52;
        uint64_t v42 = v53;
      }
      else
      {

        uint64_t v42 = v31;
        uint64_t v41 = v2;
      }
      v23(v42, v41);
      id v46 = [self sharedInstance];
      id v47 = sub_100028840();
      [v46 setDelegate:v47];
    }
    else
    {
    }
  }
  else
  {
    v55(v6, v54, v2);
    uint64_t v43 = Logger.logObject.getter();
    os_log_type_t v44 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v45 = 0;
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "not an Activity scene", v45, 2u);
      swift_slowDealloc();
    }

    v23(v6, v2);
  }
}

void sub_1000294C4()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  id v6 = v0;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v16 = sub_10001CEC4(0xD000000000000019, 0x8000000100037C20, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v9 + 12) = 2112;
    uint64_t v14 = v1;
    uint64_t v16 = (uint64_t)v6;
    id v10 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v13 = v6;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s %@", (uint8_t *)v9, 0x16u);
    sub_10001D7EC(&qword_1000470C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v14);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  id v11 = sub_1000288B8();
  [v11 invalidateStatusBar];
}

uint64_t sub_10002977C(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  os_log_type_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  id v10 = v2;
  id v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v21 = v19;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v20 = sub_10001CEC4(a1, a2, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v13 + 12) = 2112;
    uint64_t v18 = v5;
    uint64_t v20 = (uint64_t)v10;
    id v14 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v17 = v10;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s %@", (uint8_t *)v13, 0x16u);
    sub_10001D7EC(&qword_1000470C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v18);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

void sub_100029A10()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v40 - v6;
  uint64_t v8 = sub_100023C44();
  os_log_type_t v44 = *(void (**)(char *))(v2 + 16);
  uint64_t v45 = v8;
  v44(v7);
  uint64_t v9 = v0;
  id v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  BOOL v12 = os_log_type_enabled(v10, v11);
  id v47 = v5;
  if (v12)
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v46 = v1;
    uint64_t v14 = v13;
    uint64_t v42 = (void *)swift_slowAlloc();
    os_log_t v43 = (os_log_t)swift_slowAlloc();
    os_log_t v49 = v43;
    *(_DWORD *)uint64_t v14 = 136315394;
    os_log_t v41 = v10;
    uint64_t v48 = sub_10001CEC4(0xD000000000000016, 0x8000000100037BC0, (uint64_t *)&v49);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v14 + 12) = 2112;
    uint64_t v48 = (uint64_t)v9;
    uint64_t v15 = v2;
    uint64_t v16 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v42 = v9;

    uint64_t v2 = v15;
    os_log_t v17 = v41;
    _os_log_impl((void *)&_mh_execute_header, v41, v11, "%s %@", (uint8_t *)v14, 0x16u);
    sub_10001D7EC(&qword_1000470C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v1 = v46;
    swift_slowDealloc();

    uint64_t v18 = v15;
  }
  else
  {

    uint64_t v18 = v2;
  }
  uint64_t v19 = *(void (**)(char *, uint64_t))(v18 + 8);
  v19(v7, v1);
  (*(void (**)(void))((swift_isaMask & *v9) + 0x70))(0);
  uint64_t v20 = self;
  uint64_t v21 = &off_100045000;
  id v22 = [v20 sharedInstance];
  id v23 = [v22 delegate];

  id v24 = sub_100028840();
  if (v23)
  {
    swift_unknownObjectRelease();

    if (v23 != v24) {
      return;
    }
    uint64_t v25 = v47;
    ((void (*)(char *, uint64_t, uint64_t))v44)(v47, v45, v1);
    uint64_t v26 = v9;
    id v27 = Logger.logObject.getter();
    os_log_type_t v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = swift_slowAlloc();
      uint64_t v46 = v1;
      uint64_t v30 = v29;
      uint64_t v31 = swift_slowAlloc();
      uint64_t v45 = v2;
      id v32 = (void *)v31;
      os_log_type_t v44 = (void (*)(char *))swift_slowAlloc();
      os_log_t v49 = (os_log_t)v44;
      *(_DWORD *)uint64_t v30 = 136315650;
      os_log_t v43 = v27;
      uint64_t v48 = sub_10001CEC4(0xD000000000000016, 0x8000000100037BC0, (uint64_t *)&v49);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v30 + 12) = 2112;
      uint64_t v48 = (uint64_t)v26;
      uint64_t v33 = v26;
      os_log_type_t v34 = v28;
      id v35 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *id v32 = v9;

      *(_WORD *)(v30 + 22) = 2112;
      id v36 = sub_100028840();
      uint64_t v48 = (uint64_t)v36;
      uint64_t v21 = &off_100045000;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v32[1] = v36;

      os_log_t v37 = v43;
      _os_log_impl((void *)&_mh_execute_header, v43, v34, "%s %@ removing connectionManager delegate=%@", (uint8_t *)v30, 0x20u);
      sub_10001D7EC(&qword_1000470C0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v38 = v46;
      id v39 = v47;
    }
    else
    {

      id v39 = v25;
      uint64_t v38 = v1;
    }
    v19(v39, v38);
    id v24 = [v20 v21[236]];
    [v24 setDelegate:0];
  }
}

uint64_t type metadata accessor for RPSessionPlatterSceneDelegate()
{
  return self;
}

void *sub_10002A00C()
{
  return &unk_100030380;
}

double sub_10002A018()
{
  return 22.0;
}

void *sub_10002A020()
{
  return &unk_100030388;
}

void *sub_10002A02C()
{
  return &unk_100030390;
}

double sub_10002A038()
{
  return 5.0;
}

void *sub_10002A040()
{
  return &unk_100030398;
}

double sub_10002A04C()
{
  return 20.0;
}

void *sub_10002A054()
{
  return &unk_1000303A0;
}

double sub_10002A060()
{
  return -2.0;
}

void *sub_10002A068()
{
  return &unk_1000303A8;
}

void *sub_10002A074()
{
  return &unk_1000303B0;
}

void *sub_10002A080()
{
  return &unk_1000303B8;
}

double sub_10002A08C()
{
  return 7.0;
}

void *sub_10002A094()
{
  return &unk_1000303C0;
}

double sub_10002A0A0()
{
  return -7.0;
}

void *sub_10002A0A8()
{
  return &unk_1000303C8;
}

double sub_10002A0B4()
{
  return 1000.0;
}

void *sub_10002A0C4()
{
  return &unk_1000303D0;
}

double sub_10002A0D0()
{
  return 90.0;
}

void *sub_10002A0E0()
{
  return &unk_1000303D8;
}

double sub_10002A0EC()
{
  return 0.0;
}

void *sub_10002A0F4()
{
  return &unk_1000303E0;
}

double sub_10002A100()
{
  return 47.33;
}

void *sub_10002A10C()
{
  return &unk_1000303E8;
}

double sub_10002A118()
{
  return 1.0;
}

void *sub_10002A120()
{
  return &unk_1000303F0;
}

void *sub_10002A12C()
{
  return &unk_1000303F8;
}

void *sub_10002A138()
{
  return &unk_100030400;
}

void *sub_10002A144()
{
  return &unk_100030408;
}

const char *sub_10002A150()
{
  return "Countdown3";
}

uint64_t sub_10002A15C()
{
  return 0x776F64746E756F43;
}

const char *sub_10002A178()
{
  return "Countdown2";
}

uint64_t sub_10002A184()
{
  return 0x776F64746E756F43;
}

const char *sub_10002A1A0()
{
  return "Countdown1";
}

uint64_t sub_10002A1AC()
{
  return 0x776F64746E756F43;
}

void *sub_10002A1C8()
{
  return &unk_10003DE58;
}

unint64_t sub_10002A1D4()
{
  return 0xD000000000000011;
}

void *sub_10002A1F0()
{
  return &unk_10003DE68;
}

unint64_t sub_10002A1FC()
{
  return 0xD000000000000014;
}

void *sub_10002A218()
{
  return &unk_10003DE78;
}

unint64_t sub_10002A224()
{
  return 0xD000000000000015;
}

void *sub_10002A240()
{
  return &unk_100030440;
}

double sub_10002A24C()
{
  return 28.5;
}

void *sub_10002A25C()
{
  return &unk_100030448;
}

double sub_10002A268()
{
  return 23.5;
}

void *sub_10002A278()
{
  return &unk_100030450;
}

double sub_10002A284()
{
  return 6.36;
}

void *sub_10002A290()
{
  return &unk_100030458;
}

double sub_10002A29C()
{
  return 0.5;
}

void *sub_10002A2A4()
{
  return &unk_100030460;
}

double sub_10002A2B0()
{
  return 0.4;
}

void *sub_10002A2BC()
{
  return &unk_100030468;
}

double sub_10002A2C8()
{
  return 139.0;
}

void sub_10002A2D8(uint64_t a1)
{
}

uint64_t *sub_10002A300()
{
  if (qword_100048BA0 != -1) {
    swift_once();
  }
  return &qword_100048C88;
}

uint64_t sub_10002A34C()
{
  return sub_10002A99C(&qword_100048BA0, &qword_100048C88);
}

void *sub_10002A374()
{
  return &unk_100030470;
}

double sub_10002A380()
{
  return 62.0;
}

void *sub_10002A38C()
{
  return &unk_100030478;
}

double sub_10002A398()
{
  return 17.5;
}

void *sub_10002A3A8()
{
  return &unk_100030480;
}

double sub_10002A3B4()
{
  return 54.0;
}

void *sub_10002A3C0()
{
  return &unk_100030488;
}

void *sub_10002A3CC()
{
  return &unk_100030490;
}

double sub_10002A3D8()
{
  return 15.0;
}

void *sub_10002A3E0()
{
  return &unk_100030498;
}

double sub_10002A3EC()
{
  return 14.0;
}

const char *sub_10002A3F4()
{
  return "00:00";
}

uint64_t sub_10002A400()
{
  return 206967550000;
}

void *sub_10002A414()
{
  return &unk_1000304B0;
}

id sub_10002A420()
{
  id result = [objc_allocWithZone((Class)UIColor) initWithRed:1.0 green:0.2855 blue:0.1814 alpha:1.0];
  qword_100048C98 = (uint64_t)result;
  return result;
}

uint64_t *sub_10002A46C()
{
  if (qword_100048BA8 != -1) {
    swift_once();
  }
  return &qword_100048C98;
}

id sub_10002A4B8()
{
  if (qword_100048BA8 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_100048C98;

  return v0;
}

void *sub_10002A514()
{
  return &unk_1000304B8;
}

void *sub_10002A520()
{
  return &unk_1000304C0;
}

void *sub_10002A52C()
{
  return &unk_1000304C8;
}

void sub_10002A538(uint64_t a1)
{
}

uint64_t *sub_10002A560()
{
  if (qword_100048BB0 != -1) {
    swift_once();
  }
  return &qword_100048CA0;
}

uint64_t sub_10002A5AC()
{
  return sub_10002A99C(&qword_100048BB0, &qword_100048CA0);
}

void sub_10002A5D4(uint64_t a1)
{
}

uint64_t *sub_10002A5FC()
{
  if (qword_100048BB8 != -1) {
    swift_once();
  }
  return &qword_100048CB0;
}

uint64_t sub_10002A648()
{
  return sub_10002A99C(&qword_100048BB8, &qword_100048CB0);
}

void *sub_10002A670()
{
  return &unk_1000304D0;
}

double sub_10002A67C()
{
  return 600.0;
}

void *sub_10002A68C()
{
  return &unk_10003DE88;
}

unint64_t sub_10002A698()
{
  return 0xD000000000000018;
}

const char *sub_10002A6B4()
{
  return "Base State";
}

uint64_t sub_10002A6C0()
{
  return 0x6174532065736142;
}

void *sub_10002A6DC()
{
  return &unk_1000304E8;
}

uint64_t sub_10002A6E8()
{
  return 51;
}

void *sub_10002A6F4()
{
  return &unk_1000304F8;
}

uint64_t sub_10002A700()
{
  return 50;
}

void *sub_10002A70C()
{
  return &unk_100030508;
}

uint64_t sub_10002A718()
{
  return 49;
}

const char *sub_10002A724()
{
  return "start";
}

uint64_t sub_10002A730()
{
  return 0x7472617473;
}

const char *sub_10002A744()
{
  return "breathe";
}

uint64_t sub_10002A750()
{
  return 0x65687461657262;
}

const char *sub_10002A768()
{
  return "saving";
}

uint64_t sub_10002A774()
{
  return 0x676E69766173;
}

const char *sub_10002A788()
{
  return "spinner";
}

uint64_t sub_10002A794()
{
  return 0x72656E6E697073;
}

const char *sub_10002A7AC()
{
  return "done";
}

uint64_t sub_10002A7B8()
{
  return 1701736292;
}

void sub_10002A7C8(uint64_t a1)
{
}

uint64_t *sub_10002A7F0()
{
  if (qword_100048BC0 != -1) {
    swift_once();
  }
  return &qword_100048CC0;
}

uint64_t sub_10002A83C()
{
  return sub_10002A99C(&qword_100048BC0, &qword_100048CC0);
}

void sub_10002A864(uint64_t a1)
{
}

void sub_10002A88C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void *a5)
{
  uint64_t v7 = self;
  NSString v8 = String._bridgeToObjectiveC()();
  id v9 = [v7 _rpLocalizedStringFromFrameworkBundleWithKey:v8];

  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;

  *a4 = v10;
  *a5 = v12;
}

uint64_t *sub_10002A928()
{
  if (qword_100048BC8 != -1) {
    swift_once();
  }
  return &qword_100048CD0;
}

uint64_t sub_10002A974()
{
  return sub_10002A99C(&qword_100048BC8, &qword_100048CD0);
}

uint64_t sub_10002A99C(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

void *sub_10002A9F0()
{
  return &unk_100030568;
}

double sub_10002A9FC()
{
  return 12.5;
}

void *sub_10002AA04()
{
  return &unk_100030570;
}

double sub_10002AA10()
{
  return 327.0;
}

void *sub_10002AA20()
{
  return &unk_100030578;
}

double sub_10002AA2C()
{
  return 0.9988;
}

void *sub_10002AA38()
{
  return &unk_100030580;
}

double sub_10002AA44()
{
  return 0.271;
}

void *sub_10002AA50()
{
  return &unk_100030588;
}

double sub_10002AA5C()
{
  return 0.2263;
}

void *sub_10002AA68()
{
  return &unk_100030590;
}

const char *sub_10002AA74()
{
  return "start";
}

const char *sub_10002AA80()
{
  return "press stop";
}

uint64_t sub_10002AA8C()
{
  return 0x7473207373657270;
}

const char *sub_10002AAA8()
{
  return "spinner";
}

const char *sub_10002AAB4()
{
  return "done";
}

const char *sub_10002AAC0()
{
  return "done-press";
}

uint64_t sub_10002AACC()
{
  return 0x6572702D656E6F64;
}

ValueMetadata *type metadata accessor for RPSessionAccessoryViewConstants()
{
  return &type metadata for RPSessionAccessoryViewConstants;
}

ValueMetadata *type metadata accessor for RPSystemApertureElementConstants()
{
  return &type metadata for RPSystemApertureElementConstants;
}

ValueMetadata *type metadata accessor for CountdownState()
{
  return &type metadata for CountdownState;
}

ValueMetadata *type metadata accessor for CountdownStatus()
{
  return &type metadata for CountdownStatus;
}

ValueMetadata *type metadata accessor for ExpandedViewConstants()
{
  return &type metadata for ExpandedViewConstants;
}

ValueMetadata *type metadata accessor for ScreenRecordingLabelConstants()
{
  return &type metadata for ScreenRecordingLabelConstants;
}

ValueMetadata *type metadata accessor for StopImageConstants()
{
  return &type metadata for StopImageConstants;
}

ValueMetadata *type metadata accessor for TimerLabelConstants()
{
  return &type metadata for TimerLabelConstants;
}

ValueMetadata *type metadata accessor for RecordingDotConstants()
{
  return &type metadata for RecordingDotConstants;
}

ValueMetadata *type metadata accessor for PhotosLabelConstants()
{
  return &type metadata for PhotosLabelConstants;
}

ValueMetadata *type metadata accessor for SessionConstants()
{
  return &type metadata for SessionConstants;
}

ValueMetadata *type metadata accessor for ViewStates()
{
  return &type metadata for ViewStates;
}

ValueMetadata *type metadata accessor for ButtonConstants()
{
  return &type metadata for ButtonConstants;
}

ValueMetadata *type metadata accessor for RedKeyLineConstants()
{
  return &type metadata for RedKeyLineConstants;
}

ValueMetadata *type metadata accessor for ExpandedViewStates()
{
  return &type metadata for ExpandedViewStates;
}

void *sub_10002AC24()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window);
  swift_beginAccess();
  uint64_t v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_10002ACD4(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window);
  swift_beginAccess();
  uint64_t v4 = *v3;
  *id v3 = a1;
}

uint64_t (*sub_10002AD28())()
{
  return j__swift_endAccess;
}

uint64_t sub_10002AE7C()
{
  return sub_10002C114(0xD000000000000019, 0x8000000100037C20);
}

uint64_t sub_10002AF24()
{
  return sub_10002C114(0xD00000000000001CLL, 0x8000000100037C00);
}

uint64_t sub_10002AFCC()
{
  return sub_10002C114(0xD00000000000001BLL, 0x8000000100037BE0);
}

id sub_10002B0D8()
{
  *(void *)&v0[OBJC_IVAR____TtC14ReplayKitAngel26RPRemoteAlertSceneDelegate_window] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPRemoteAlertSceneDelegate();
  return [super init];
}

id sub_10002B164()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RPRemoteAlertSceneDelegate();
  return [super dealloc];
}

unint64_t sub_10002B1A8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10002B1EC(a1, v4);
}

unint64_t sub_10002B1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10002C758(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10002C6A4((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

void sub_10002B2B4(unsigned char *a1)
{
  uint64_t v87 = a1;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  char v6 = &v76[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __chkstk_darwin(v4);
  id v9 = &v76[-v8];
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = &v76[-v11];
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = &v76[-v14];
  __chkstk_darwin(v13);
  os_log_t v17 = &v76[-v16];
  uint64_t v18 = sub_100023C44();
  uint64_t v19 = *(void (**)(void))(v3 + 16);
  uint64_t v84 = v18;
  uint64_t v85 = (void (*)(unsigned char *, uint64_t, uint64_t))v19;
  uint64_t v86 = v3 + 16;
  v19(v17);
  id v20 = v1;
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.default.getter();
  int v23 = v22;
  BOOL v24 = os_log_type_enabled(v21, v22);
  uint64_t v82 = v15;
  v83 = v12;
  if (v24)
  {
    uint64_t v25 = swift_slowAlloc();
    uint64_t v79 = (void *)swift_slowAlloc();
    char v81 = (void *)swift_slowAlloc();
    v90[0] = (uint64_t)v81;
    *(_DWORD *)uint64_t v25 = 136315394;
    os_log_t v78 = v21;
    *(void *)&long long v91 = sub_10001CEC4(0xD00000000000001FLL, 0x8000000100037C60, v90);
    int v77 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v25 + 12) = 2112;
    unsigned __int8 v80 = v17;
    *(void *)&long long v91 = v20;
    uint64_t v26 = v3;
    uint64_t v27 = v2;
    id v28 = v20;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v79 = v20;

    uint64_t v2 = v27;
    uint64_t v3 = v26;
    os_log_t v29 = v78;
    _os_log_impl((void *)&_mh_execute_header, v78, (os_log_type_t)v77, "%s %@ Remote Alert for reactions tip", (uint8_t *)v25, 0x16u);
    sub_10001D7EC(&qword_1000470C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v30 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
    v30(v80, v2);
  }
  else
  {

    uint64_t v30 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
    v30(v17, v2);
  }
  uint64_t v31 = v20;
  id v32 = v87;
  self;
  uint64_t v33 = swift_dynamicCastObjCClass();
  if (v33)
  {
    os_log_type_t v34 = (void *)v33;
    id v35 = objc_allocWithZone((Class)UIWindow);
    id v36 = v32;
    id v37 = [v35 initWithWindowScene:v34];
    (*(void (**)(id))((swift_isaMask & *v31) + 0x60))(v37);
    id v38 = [v34 configurationContext];
    if (!v38
      || (id v39 = v38, v40 = [v38 userInfo], v39, !v40))
    {
      v85(v9, v84, v2);
      os_log_type_t v44 = Logger.logObject.getter();
      os_log_type_t v45 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v44, v45))
      {
        uint64_t v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v46 = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, v45, "user info dictionary missing from remote alert", v46, 2u);
        swift_slowDealloc();
        id v47 = v36;
      }
      else
      {
        id v47 = v44;
        os_log_type_t v44 = v36;
      }

      id v57 = v9;
      goto LABEL_38;
    }
    uint64_t v41 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    unint64_t v88 = 0x746163696C707061;
    unint64_t v89 = 0xEF656D614E6E6F69;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v41 + 16) && (unint64_t v42 = sub_10002B1A8((uint64_t)v90), (v43 & 1) != 0))
    {
      sub_10001F448(*(void *)(v41 + 56) + 32 * v42, (uint64_t)&v91);
    }
    else
    {
      long long v91 = 0u;
      long long v92 = 0u;
    }
    sub_10002C6A4((uint64_t)v90);
    if (*((void *)&v92 + 1))
    {
      if ((swift_dynamicCast() & 1) == 0)
      {
LABEL_32:
        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
      char v81 = v31;
      uint64_t v87 = (unsigned char *)v3;
      uint64_t v59 = v88;
      unint64_t v58 = v89;
      unint64_t v88 = 0xD000000000000010;
      unint64_t v89 = 0x8000000100037E00;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v41 + 16) && (unint64_t v60 = sub_10002B1A8((uint64_t)v90), (v61 & 1) != 0))
      {
        sub_10001F448(*(void *)(v41 + 56) + 32 * v60, (uint64_t)&v91);
      }
      else
      {
        long long v91 = 0u;
        long long v92 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10002C6A4((uint64_t)v90);
      if (*((void *)&v92 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v62 = v88;
          unint64_t v63 = v89;
          type metadata accessor for RPReactionsTipViewController();
          uint64_t v64 = sub_100024D10(v59, v58, v62, v63);
          id v65 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v81) + 0x58))();
          if (v65)
          {
            uint64_t v66 = v65;
            [v65 setRootViewController:v64];
            [v66 makeKeyAndVisible];
            [v34 setAllowsMenuButtonDismissal:1];

            return;
          }
          uint64_t v67 = v82;
          v85(v82, v84, v2);
          uint64_t v72 = Logger.logObject.getter();
          os_log_type_t v73 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v72, v73))
          {
            CGFloat v74 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)CGFloat v74 = 0;
            _os_log_impl((void *)&_mh_execute_header, v72, v73, "window is nil", v74, 2u);
            swift_slowDealloc();
            id v75 = v36;
          }
          else
          {
            id v75 = v72;
            uint64_t v72 = v64;
            uint64_t v64 = v36;
          }

          goto LABEL_37;
        }
        goto LABEL_32;
      }
    }
    swift_bridgeObjectRelease();
    sub_10002C6F8((uint64_t)&v91);
LABEL_33:
    uint64_t v67 = v83;
    v85(v83, v84, v2);
    uint64_t v68 = Logger.logObject.getter();
    os_log_type_t v69 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v68, v69))
    {
      uint64_t v70 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v70 = 0;
      _os_log_impl((void *)&_mh_execute_header, v68, v69, "missing dictionary info", v70, 2u);
      swift_slowDealloc();
      uint64_t v71 = v36;
    }
    else
    {
      uint64_t v71 = v68;
      uint64_t v68 = v36;
    }

LABEL_37:
    id v57 = v67;
LABEL_38:
    v30(v57, v2);
    return;
  }
  v85(v6, v84, v2);
  id v48 = v32;
  os_log_t v49 = Logger.logObject.getter();
  os_log_type_t v50 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v49, v50))
  {
    uint64_t v51 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    uint64_t v87 = v6;
    v90[0] = v52;
    *(_DWORD *)uint64_t v51 = 136315138;
    swift_getObjectType();
    uint64_t v53 = _typeName(_:qualified:)();
    uint64_t v86 = v2;
    *(void *)&long long v91 = sub_10001CEC4(v53, v54, v90);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v49, v50, "Expected remote alert scene. scene type=%s", v51, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v56 = v86;
    uint64_t v55 = v87;
  }
  else
  {

    uint64_t v55 = v6;
    uint64_t v56 = v2;
  }
  v30(v55, v56);
}

void sub_10002BCF8()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  id v35 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  char v6 = (char *)&v28 - v5;
  uint64_t v7 = sub_100023C44();
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  uint64_t v33 = v7;
  uint64_t v34 = v2 + 16;
  id v32 = v8;
  ((void (*)(char *))v8)(v6);
  id v9 = v0;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v12 = swift_slowAlloc();
    uint64_t v31 = v1;
    uint64_t v13 = v12;
    os_log_t v29 = (void *)swift_slowAlloc();
    uint64_t v30 = swift_slowAlloc();
    uint64_t v37 = v30;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v36 = sub_10001CEC4(0xD000000000000018, 0x8000000100037C40, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v13 + 12) = 2112;
    uint64_t v36 = (uint64_t)v9;
    uint64_t v14 = v2;
    uint64_t v15 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *os_log_t v29 = v9;

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "%s %@", (uint8_t *)v13, 0x16u);
    sub_10001D7EC(&qword_1000470C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v1 = v31;
    swift_slowDealloc();

    uint64_t v16 = v14;
  }
  else
  {

    uint64_t v16 = v2;
  }
  os_log_t v17 = *(uint64_t (**)(char *, uint64_t))(v16 + 8);
  uint64_t v18 = v17(v6, v1);
  uint64_t v19 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v9) + 0x58))(v18);
  id v20 = v35;
  if (v19)
  {
    uint64_t v21 = v19;
    id v22 = [v19 rootViewController];

    if (v22)
    {
      type metadata accessor for RPReactionsTipViewController();
      int v23 = (void *)swift_dynamicCastClass();
      if (v23)
      {
        id v24 = [v23 presentedViewController];

        if (!v24) {
          return;
        }
      }
      else
      {
      }
    }
  }
  v32(v20, v33, v1);
  uint64_t v25 = Logger.logObject.getter();
  os_log_type_t v26 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v25, v26))
  {
    uint64_t v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, v26, "rootViewController is not valid", v27, 2u);
    swift_slowDealloc();
  }

  v17(v20, v1);
}

uint64_t sub_10002C114(uint64_t a1, unint64_t a2)
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  id v10 = v2;
  os_log_type_t v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    os_log_t v17 = (void *)swift_slowAlloc();
    uint64_t v19 = swift_slowAlloc();
    uint64_t v21 = v19;
    *(_DWORD *)uint64_t v13 = 136315394;
    uint64_t v20 = sub_10001CEC4(a1, a2, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v13 + 12) = 2112;
    uint64_t v18 = v5;
    uint64_t v20 = (uint64_t)v10;
    id v14 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v17 = v10;

    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s %@", (uint8_t *)v13, 0x16u);
    sub_10001D7EC(&qword_1000470C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v18);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_10002C3A8()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100023C44();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  uint64_t v6 = v0;
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    uint64_t v17 = v15;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v16 = sub_10001CEC4(0xD000000000000016, 0x8000000100037BC0, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v9 + 12) = 2112;
    uint64_t v14 = v1;
    uint64_t v16 = (uint64_t)v6;
    id v10 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v13 = v6;

    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s %@", (uint8_t *)v9, 0x16u);
    sub_10001D7EC(&qword_1000470C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v14);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return (*(uint64_t (**)(void))((swift_isaMask & *v6) + 0x60))(0);
}

uint64_t type metadata accessor for RPRemoteAlertSceneDelegate()
{
  return self;
}

uint64_t sub_10002C6A4(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002C6F8(uint64_t a1)
{
  uint64_t v2 = sub_10001D7EC(&qword_100047150);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10002C758(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10002C7B4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_10002C7C4()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_100048BD8 = (uint64_t)result;
  return result;
}

uint64_t sub_10002C818()
{
  uint64_t v0 = type metadata accessor for ImageResource();
  sub_100023CE0(v0, qword_100048CE0);
  sub_100023CA8(v0, (uint64_t)qword_100048CE0);
  if (qword_100048BD0 != -1) {
    swift_once();
  }
  id v1 = (id)qword_100048BD8;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_10002C8C4()
{
  if (qword_100048BE0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for ImageResource();

  return sub_100023CA8(v0, (uint64_t)qword_100048CE0);
}

uint64_t sub_10002C928@<X0>(uint64_t a1@<X8>)
{
  if (qword_100048BE0 != -1) {
    swift_once();
  }
  uint64_t v2 = type metadata accessor for ImageResource();
  uint64_t v3 = sub_100023CA8(v2, (uint64_t)qword_100048CE0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_10002C9F4()
{
  sub_100006C38();
  int v1 = 92;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Permission Denied", v0, 0x12u);
}

void sub_10002CA80()
{
  sub_100006C38();
  int v1 = 145;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d Unidentifiable application", v0, 0x12u);
}

void sub_10002CB0C()
{
  sub_100006C38();
  sub_100008A9C((void *)&_mh_execute_header, &_os_log_default, v0, " [ERROR] %{public}s:%d Camera not found", v1, v2, v3, v4, v5);
}

void sub_10002CB8C(void *a1)
{
  id v1 = objc_begin_catch(a1);
  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100006C38();
    sub_100008A9C((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d _pegasusProxy removeObserver failed", v3, v4, v5, v6, v7);
  }

  objc_end_catch();
}

void sub_10002CC5C(void *a1)
{
  id v1 = objc_begin_catch(a1);
  if (__RPLogLevel <= 2u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100006C38();
    sub_100008A9C((void *)&_mh_execute_header, &_os_log_default, v2, " [ERROR] %{public}s:%d removeObserver failed", v3, v4, v5, v6, v7);
  }

  objc_end_catch();
}

void sub_10002CD2C(uint64_t a1)
{
  int v1 = 136446722;
  uint64_t v2 = "-[RPStatusBarAssertion invalidateStatusBar]_block_invoke";
  __int16 v3 = 1024;
  int v4 = 104;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, " [ERROR] %{public}s:%d setRegisteredStyleOverrides replied with error: %@", (uint8_t *)&v1, 0x1Cu);
}

uint64_t static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)()
{
  return static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)();
}

uint64_t static PredicateExpressions.build_Arg<A>(_:)()
{
  return static PredicateExpressions.build_Arg<A>(_:)();
}

{
  return static PredicateExpressions.build_Arg<A>(_:)();
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

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t static Activity.activities.getter()
{
  return static Activity.activities.getter();
}

uint64_t Activity.id.getter()
{
  return Activity.id.getter();
}

uint64_t static Activity.request(attributes:contentState:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:)()
{
  return static Activity.request(attributes:contentState:presentationOptions:platterTarget:contentSourceRequests:isEphemeral:)();
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

uint64_t type metadata accessor for ActivityScene()
{
  return type metadata accessor for ActivityScene();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t type metadata accessor for ImageResource()
{
  return type metadata accessor for ImageResource();
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

uint64_t Tip.shouldDisplayUpdates.getter()
{
  return Tip.shouldDisplayUpdates.getter();
}

uint64_t Tip.status.getter()
{
  return Tip.status.getter();
}

uint64_t Tip.actions.getter()
{
  return Tip.actions.getter();
}

uint64_t TipUIPopoverViewController.presentationDelegate.setter()
{
  return TipUIPopoverViewController.presentationDelegate.setter();
}

uint64_t type metadata accessor for TipUIPopoverViewController()
{
  return type metadata accessor for TipUIPopoverViewController();
}

uint64_t TipUIPopoverViewController.__allocating_init(_:sourceItem:actionHandler:)()
{
  return TipUIPopoverViewController.__allocating_init(_:sourceItem:actionHandler:)();
}

uint64_t static Tips.RuleBuilder.buildExpression(_:)()
{
  return static Tips.RuleBuilder.buildExpression(_:)();
}

uint64_t static Tips.RuleBuilder.buildPartialBlock(first:)()
{
  return static Tips.RuleBuilder.buildPartialBlock(first:)();
}

uint64_t static Tips.OptionsBuilder.buildExpression<A>(_:)()
{
  return static Tips.OptionsBuilder.buildExpression<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildFinalResult<A>(_:)()
{
  return static Tips.OptionsBuilder.buildFinalResult<A>(_:)();
}

uint64_t static Tips.OptionsBuilder.buildPartialBlock<A>(first:)()
{
  return static Tips.OptionsBuilder.buildPartialBlock<A>(first:)();
}

uint64_t type metadata accessor for Tips.MaxDisplayCount()
{
  return type metadata accessor for Tips.MaxDisplayCount();
}

uint64_t Tips.MaxDisplayCount.init(_:)()
{
  return Tips.MaxDisplayCount.init(_:)();
}

uint64_t static Tips.ParameterOption.transient.getter()
{
  return static Tips.ParameterOption.transient.getter();
}

uint64_t type metadata accessor for Tips.ParameterOption()
{
  return type metadata accessor for Tips.ParameterOption();
}

uint64_t type metadata accessor for Tips.InvalidationReason()
{
  return type metadata accessor for Tips.InvalidationReason();
}

uint64_t type metadata accessor for Tips.Rule()
{
  return type metadata accessor for Tips.Rule();
}

uint64_t Tips.Rule.init<A>(_:_:)()
{
  return Tips.Rule.init<A>(_:_:)();
}

uint64_t static Tips.Status.== infix(_:_:)()
{
  return static Tips.Status.== infix(_:_:)();
}

uint64_t type metadata accessor for Tips.Status()
{
  return type metadata accessor for Tips.Status();
}

uint64_t Tips.Parameter.wrappedValue.getter()
{
  return Tips.Parameter.wrappedValue.getter();
}

uint64_t Tips.Parameter.wrappedValue.setter()
{
  return Tips.Parameter.wrappedValue.setter();
}

uint64_t Tips.Parameter.init<A>(_:_:_:_:)()
{
  return Tips.Parameter.init<A>(_:_:_:_:)();
}

uint64_t static Tips.configure(_:)()
{
  return static Tips.configure(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
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

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
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

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

Swift::Void __swiftcall Task.cancel()()
{
}

uint64_t dispatch thunk of AsyncSequence.makeAsyncIterator()()
{
  return dispatch thunk of AsyncSequence.makeAsyncIterator()();
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

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
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

uint64_t _StringGuts._slowWithCString<A>(_:)()
{
  return _StringGuts._slowWithCString<A>(_:)();
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

uint64_t AsyncMapSequence.base.getter()
{
  return AsyncMapSequence.base.getter();
}

uint64_t AsyncMapSequence.Iterator.baseIterator.modify()
{
  return AsyncMapSequence.Iterator.baseIterator.modify();
}

uint64_t AsyncMapSequence.Iterator.transform.getter()
{
  return AsyncMapSequence.Iterator.transform.getter();
}

uint64_t AsyncMapSequence.Iterator.init(_:transform:)()
{
  return AsyncMapSequence.Iterator.init(_:transform:)();
}

uint64_t AsyncMapSequence.transform.getter()
{
  return AsyncMapSequence.transform.getter();
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

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return _CGRectCreateDictionaryRepresentation(a1);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBUISystemApertureControlEdgeSpacing()
{
  return _SBUISystemApertureControlEdgeSpacing();
}

uint64_t SBUISystemApertureInterItemSpacing()
{
  return _SBUISystemApertureInterItemSpacing();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return _UIAccessibilityIsSwitchControlRunning();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return _UIAccessibilityIsVoiceOverRunning();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _AXSCommandAndControlEnabled()
{
  return __AXSCommandAndControlEnabled();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
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
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
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

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStaticObject()
{
  return _swift_initStaticObject();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_AVConferencePreviewSingleton(void *a1, const char *a2, ...)
{
  return _[a1 AVConferencePreviewSingleton];
}

id objc_msgSend__rpLocalizedStringFromFrameworkBundleWithKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rpLocalizedStringFromFrameworkBundleWithKey:");
}

id objc_msgSend__rpUserErrorForCode_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rpUserErrorForCode:userInfo:");
}

id objc_msgSend_acquireAssertionWithPid_(void *a1, const char *a2, ...)
{
  return [a1 acquireAssertionWithPid:];
}

id objc_msgSend_acquireAssertionWithPidWaitForCompletion_(void *a1, const char *a2, ...)
{
  return [a1 acquireAssertionWithPidWaitForCompletion];
}

id objc_msgSend_acquireWithHandler_invalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 acquireWithHandler:invalidationHandler:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateMachService(void *a1, const char *a2, ...)
{
  return _[a1 activateMachService];
}

id objc_msgSend_activateWithContext_(void *a1, const char *a2, ...)
{
  return [a1 activateWithContext:];
}

id objc_msgSend_addConnection_(void *a1, const char *a2, ...)
{
  return [a1 addConnection:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return [a1 addSublayer:];
}

id objc_msgSend_beginGeneratingDeviceOrientationNotifications(void *a1, const char *a2, ...)
{
  return _[a1 beginGeneratingDeviceOrientationNotifications];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_camera(void *a1, const char *a2, ...)
{
  return _[a1 camera];
}

id objc_msgSend_cameraWithPosition_(void *a1, const char *a2, ...)
{
  return [a1 cameraWithPosition:];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearRemoteHandle(void *a1, const char *a2, ...)
{
  return _[a1 clearRemoteHandle];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return [a1 configureConnection:];
}

id objc_msgSend_connectionManagerQueue(void *a1, const char *a2, ...)
{
  return _[a1 connectionManagerQueue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countdownInterruptWithStatus_(void *a1, const char *a2, ...)
{
  return [a1 countdownInterruptWithStatus:];
}

id objc_msgSend_createRemoteHandleForApplication_bundleID_(void *a1, const char *a2, ...)
{
  return [a1 createRemoteHandleForApplication:bundleID:];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentSessionID(void *a1, const char *a2, ...)
{
  return _[a1 currentSessionID];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_devicesWithMediaType_(void *a1, const char *a2, ...)
{
  return [a1 devicesWithMediaType:];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didTapStopButton(void *a1, const char *a2, ...)
{
  return _[a1 didTapStopButton];
}

id objc_msgSend_endGeneratingDeviceOrientationNotifications(void *a1, const char *a2, ...)
{
  return _[a1 endGeneratingDeviceOrientationNotifications];
}

id objc_msgSend_finish(void *a1, const char *a2, ...)
{
  return _[a1 finish];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_hasEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 hasEntitlement:];
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return [a1 identityForAngelJobLabel:];
}

id objc_msgSend_initWithControlsStyle_viewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithControlsStyle:viewController:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithSceneProvidingProcess_configurationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithSceneProvidingProcess:configurationIdentifier:];
}

id objc_msgSend_initWithStatusBarStyleOverrides_forPID_exclusive_showsWhenForeground_(void *a1, const char *a2, ...)
{
  return [a1 initWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:];
}

id objc_msgSend_interfaceWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithIdentifier:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateStatusBar(void *a1, const char *a2, ...)
{
  return _[a1 invalidateStatusBar];
}

id objc_msgSend_isConnectingProcessAuthorized_(void *a1, const char *a2, ...)
{
  return [a1 isConnectingProcessAuthorized:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isPictureInPicturePossible(void *a1, const char *a2, ...)
{
  return _[a1 isPictureInPicturePossible];
}

id objc_msgSend_isPictureInPictureSupported(void *a1, const char *a2, ...)
{
  return _[a1 isPictureInPictureSupported];
}

id objc_msgSend_isPreviewRunning(void *a1, const char *a2, ...)
{
  return _[a1 isPreviewRunning];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutPreviewLayer(void *a1, const char *a2, ...)
{
  return _[a1 layoutPreviewLayer];
}

id objc_msgSend_listenerWithConfigurator_(void *a1, const char *a2, ...)
{
  return [a1 listenerWithConfigurator:];
}

id objc_msgSend_localScreenAttributesForVideoAttributes_(void *a1, const char *a2, ...)
{
  return [a1 localScreenAttributesForVideoAttributes:];
}

id objc_msgSend_localVideoAttributes(void *a1, const char *a2, ...)
{
  return _[a1 localVideoAttributes];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_newHandleWithDefinition_configurationContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newHandleWithDefinition:configurationContext:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_pauseCurrentSystemSession(void *a1, const char *a2, ...)
{
  return _[a1 pauseCurrentSystemSession];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSize];
}

id objc_msgSend_protocolForProtocol_(void *a1, const char *a2, ...)
{
  return [a1 protocolForProtocol:];
}

id objc_msgSend_ratio(void *a1, const char *a2, ...)
{
  return _[a1 ratio];
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return [a1 registerObserver:];
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return _[a1 remoteProcess];
}

id objc_msgSend_remoteTarget(void *a1, const char *a2, ...)
{
  return _[a1 remoteTarget];
}

id objc_msgSend_remoteToken(void *a1, const char *a2, ...)
{
  return _[a1 remoteToken];
}

id objc_msgSend_removeObserver_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forKeyPath:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_resumeCurrentSystemSession(void *a1, const char *a2, ...)
{
  return _[a1 resumeCurrentSystemSession];
}

id objc_msgSend_rpLocalizedStatusStringForPaused_(void *a1, const char *a2, ...)
{
  return [a1 rpLocalizedStatusStringForPaused:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:];
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setActivationHandler:];
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedUnits:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setClient_(void *a1, const char *a2, ...)
{
  return [a1 setClient:];
}

id objc_msgSend_setClientMessagingExpectation_(void *a1, const char *a2, ...)
{
  return [a1 setClientMessagingExpectation:];
}

id objc_msgSend_setCountdownState_(void *a1, const char *a2, ...)
{
  return [a1 setCountdownState:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return [a1 setDomain:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setIncludesApproximationPhrase_(void *a1, const char *a2, ...)
{
  return [a1 setIncludesApproximationPhrase:];
}

id objc_msgSend_setIncludesTimeRemainingPhrase_(void *a1, const char *a2, ...)
{
  return [a1 setIncludesTimeRemainingPhrase:];
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return [a1 setInterface:];
}

id objc_msgSend_setInterfaceTarget_(void *a1, const char *a2, ...)
{
  return [a1 setInterfaceTarget:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setLocalCameraWithUID_(void *a1, const char *a2, ...)
{
  return [a1 setLocalCameraWithUID];
}

id objc_msgSend_setLocalVideoLayer_front_(void *a1, const char *a2, ...)
{
  return [a1 setLocalVideoLayer:front:];
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setMasksToBounds:];
}

id objc_msgSend_setMaximumUnitCount_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumUnitCount:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredContentSize:];
}

id objc_msgSend_setRatio_(void *a1, const char *a2, ...)
{
  return [a1 setRatio:];
}

id objc_msgSend_setRegisteredStyleOverrides_reply_(void *a1, const char *a2, ...)
{
  return [a1 setRegisteredStyleOverrides:reply:];
}

id objc_msgSend_setServer_(void *a1, const char *a2, ...)
{
  return [a1 setServer:];
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return [a1 setService:];
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return [a1 setServiceQuality:];
}

id objc_msgSend_setStatusString_(void *a1, const char *a2, ...)
{
  return [a1 setStatusString:];
}

id objc_msgSend_setTargetQueue_(void *a1, const char *a2, ...)
{
  return [a1 setTargetQueue:];
}

id objc_msgSend_setUnitsStyle_(void *a1, const char *a2, ...)
{
  return [a1 setUnitsStyle:];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_setZeroFormattingBehavior_(void *a1, const char *a2, ...)
{
  return [a1 setZeroFormattingBehavior:];
}

id objc_msgSend_setupPreview(void *a1, const char *a2, ...)
{
  return _[a1 setupPreview];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_showSavedToPhotosBannerWithPhotosURL_identifier_sessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSavedToPhotosBannerWithPhotosURL:identifier:sessionID:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startPictureInPicture(void *a1, const char *a2, ...)
{
  return _[a1 startPictureInPicture];
}

id objc_msgSend_startPreview(void *a1, const char *a2, ...)
{
  return _[a1 startPreview];
}

id objc_msgSend_startRecording(void *a1, const char *a2, ...)
{
  return _[a1 startRecording];
}

id objc_msgSend_stopCurrentSession(void *a1, const char *a2, ...)
{
  return _[a1 stopCurrentSession];
}

id objc_msgSend_stopPictureInPictureAndRestoreUserInterface_(void *a1, const char *a2, ...)
{
  return [a1 stopPictureInPictureAndRestoreUserInterface:];
}

id objc_msgSend_stopPipSession(void *a1, const char *a2, ...)
{
  return _[a1 stopPipSession];
}

id objc_msgSend_stopPreview(void *a1, const char *a2, ...)
{
  return _[a1 stopPreview];
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 stringFromTimeInterval:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithTimeInterval_(void *a1, const char *a2, ...)
{
  return [a1 stringWithTimeInterval:];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timerDidUpdate_(void *a1, const char *a2, ...)
{
  return [a1 timerDidUpdate:];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return _[a1 uniqueID];
}

id objc_msgSend_unregisterObserver_(void *a1, const char *a2, ...)
{
  return [a1 unregisterObserver:];
}

id objc_msgSend_updateTimer_(void *a1, const char *a2, ...)
{
  return [a1 updateTimer:];
}

id objc_msgSend_updateViewGeometry(void *a1, const char *a2, ...)
{
  return _[a1 updateViewGeometry];
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return _[a1 userInitiated];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return [a1 valueForEntitlement:];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}