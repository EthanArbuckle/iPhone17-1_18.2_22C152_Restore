void sub_100005A50(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5;
  uint64_t vars8;

  v5 = a2;
  if ([v5 status] == (id)1)
  {
    *a3 = 1;
    [*(id *)(a1 + 32) adoptConnection:v5];
  }
}

void sub_10000625C(id a1, NSError *a2)
{
  v2 = a2;
  v3 = os_log_create("com.apple.camera.overlay", "Angel");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(NSError *)v2 localizedDescription];
    int v5 = 138543362;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v5, 0xCu);
  }
}

uint64_t sub_100006918(uint64_t a1)
{
  qword_100023538 = (uint64_t)[objc_alloc(*(Class *)(a1 + 32)) _init];

  return _objc_release_x1();
}

void sub_100006A98(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.CameraOverlayAngel"];
  v3 = +[CAMOverlayServiceSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

BOOL sub_100006C48(id a1, CAMOverlayClientConnection *a2)
{
  return (id)[(CAMOverlayClientConnection *)a2 status] == (id)1;
}

void sub_100006D30(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  [a3 bs_array];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObjectsFromArray:v4];
}

id sub_100007124(uint64_t a1, void *a2)
{
  return _[a2 setUserInfo:*(void *)(a1 + 32)];
}

void sub_100007130(uint64_t a1)
{
  [*(id *)(a1 + 32) addObserver:*(void *)(a1 + 40)];
  v2 = [*(id *)(a1 + 40) _connectionsByProcessID];
  v3 = +[NSNumber numberWithLongLong:*(void *)(a1 + 48)];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    [v4 addObject:*(void *)(a1 + 32)];
  }
  else
  {
    id v5 = [objc_alloc((Class)NSMutableSet) initWithObjects:*(void *)(a1 + 32), 0];
    v6 = [*(id *)(a1 + 40) _connectionsByProcessID];
    v7 = +[NSNumber numberWithLongLong:*(void *)(a1 + 48)];
    [v6 setObject:v5 forKeyedSubscript:v7];
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007294;
  v11[3] = &unk_10001C978;
  v8 = *(void **)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 48);
  id v12 = v9;
  uint64_t v13 = v10;
  [v8 _enumerateObserversWithBlock:v11];
}

id sub_100007294(uint64_t a1, void *a2)
{
  return _[a2 serverReceivedConnection:*(void *)(a1 + 32) fromProcessID:*(void *)(a1 + 40)];
}

void sub_10000733C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4 == 2)
  {
    id v10 = v3;
    id v5 = [*(id *)(a1 + 32) auditToken];
    v6 = +[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", [v5 versionedPID]);

    v7 = [*(id *)(a1 + 40) _connectionsByProcessID];
    v8 = [v7 objectForKeyedSubscript:v6];

    [v8 removeObject:*(void *)(a1 + 32)];
    if (![v8 count])
    {
      id v9 = [*(id *)(a1 + 40) _connectionsByProcessID];
      [v9 setObject:0 forKeyedSubscript:v6];
    }
    [v10 serverLostConnectionFromProcessID:[v6 longLongValue]];
  }
  else
  {
    if (v4 != 1) {
      goto LABEL_8;
    }
    id v10 = v3;
    [v3 serverActivatedConnection:*(void *)(a1 + 32)];
  }
  id v3 = v10;
LABEL_8:
}

__CFString *CAMStringForOverlayClientConnectionStatus(unint64_t a1)
{
  if (a1 > 2) {
    return 0;
  }
  else {
    return off_10001CB78[a1];
  }
}

void sub_100007A44(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[CAMOverlayServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = +[CAMOverlayServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setTargetQueue:*(void *)(a1 + 32)];
  [v3 setInterfaceTarget:*(void *)(a1 + 40)];
  objc_initWeak(&location, *(id *)(a1 + 40));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100007C4C;
  v10[3] = &unk_10001C9F0;
  objc_copyWeak(&v11, &location);
  [v3 setActivationHandler:v10];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007CA8;
  v8[3] = &unk_10001C9F0;
  objc_copyWeak(&v9, &location);
  [v3 setInterruptionHandler:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007D04;
  v6[3] = &unk_10001C9F0;
  objc_copyWeak(&v7, &location);
  [v3 setInvalidationHandler:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void sub_100007C10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_100007C4C(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleConnectionDidActivate:v3];
}

void sub_100007CA8(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleConnectionDidInterrupt:v3];
}

void sub_100007D04(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleConnectionDidInvalidate:v3];
}

id sub_1000080D4(uint64_t a1, void *a2)
{
  return _[a2 clientConnection:*(void *)(a1 + 32) didChangeStatus:*(void *)(a1 + 40)];
}

id sub_1000083C8(uint64_t a1)
{
  v2 = [*(id *)(a1 + 40) remoteTarget];
  [*(id *)(a1 + 32) _setClientProxy:v2];

  id v3 = *(void **)(a1 + 32);

  return _[v3 _updateStatusWithReason:2];
}

id sub_100008494(uint64_t a1)
{
  [*(id *)(a1 + 32) _setClientProxy:0];
  v2 = *(void **)(a1 + 32);

  return _[v2 _updateStatusWithReason:2];
}

id sub_10000854C(uint64_t a1)
{
  [*(id *)(a1 + 32) set_connection:0];
  [*(id *)(a1 + 32) _setClientProxy:0];
  v2 = *(void **)(a1 + 32);

  return _[v2 _updateStatusWithReason:2];
}

id sub_100009850(uint64_t a1)
{
  [*(id *)(a1 + 32) _setControls:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _setControlsByID:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _setUpdatesByID:*(void *)(a1 + 56)];
  v2 = *(void **)(a1 + 32);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000098EC;
  v4[3] = &unk_10001CAB8;
  v4[4] = v2;
  return [v2 _enumerateObserversWithBlock:v4];
}

id sub_1000098EC(uint64_t a1, void *a2)
{
  return _[a2 clientConnectionDidChangeControls:*(void *)(a1 + 32)];
}

void sub_100009AB8(uint64_t a1)
{
  uint64_t v2 = a1 + 32;
  id v3 = [*(id *)(a1 + 32) controlsByID];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(v2 + 8)];

  if (v4)
  {
    id v5 = [v4 validateUpdate:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v6 = CAMOverlayErrorDomain;
    NSErrorUserInfoKey v20 = NSDebugDescriptionErrorKey;
    CFStringRef v21 = @"InvalidIdentifier";
    id v7 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v5 = +[NSError errorWithDomain:v6 code:-100 userInfo:v7];
  }
  if (v5)
  {
    v8 = os_log_create("com.apple.camera.overlay", "Angel");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100013C8C((id *)v2);
    }
  }
  else
  {
    if ([*(id *)(a1 + 48) isValueUpdate])
    {
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = [*(id *)(a1 + 32) _updatesByID];
      [v10 setObject:v9 forKeyedSubscript:*(void *)(a1 + 40)];
    }
    id v11 = *(void **)(a1 + 32);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100009D38;
    v18[3] = &unk_10001CB08;
    v18[4] = v11;
    id v19 = *(id *)(a1 + 48);
    [v11 _enumerateObserversWithBlock:v18];
  }
  id v12 = [*(id *)(a1 + 32) _connectionQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009D44;
  block[3] = &unk_10001CB30;
  id v13 = *(id *)(a1 + 56);
  id v16 = v5;
  id v17 = v13;
  id v14 = v5;
  dispatch_async(v12, block);
}

id sub_100009D38(uint64_t a1, void *a2)
{
  return _[a2 clientConnection:*(void *)(a1 + 32) didApplyControlUpdate:*(void *)(a1 + 40)];
}

uint64_t sub_100009D44(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100009EB4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

int main(int argc, const char **argv, const char **envp)
{
  uint64_t v6 = +[CAMOverlayServer sharedInstance];
  [v6 start];

  id v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  LODWORD(argv) = UIApplicationMain(argc, (char **)argv, 0, v8);

  return (int)argv;
}

void sub_10000A068(void *a1)
{
  id v3 = [a1 _stage];
  id v4 = [a1 _numberOfStages];
  id v5 = [a1 _contact];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = [v5 isTouching];
  }
  else
  {
    unsigned int v7 = 0;
  }
  BOOL v33 = sub_10000A7F8((unint64_t)v3, (unint64_t)v4, v7) == 4 && [a1 _stagePhase] == 0;
  id v8 = [a1 _stage];
  id v9 = [a1 _numberOfStages];
  id v10 = [a1 _contact];
  if (v10)
  {
    id v11 = v10;
    unsigned int v12 = [v10 isTouching];
  }
  else
  {
    unsigned int v12 = 0;
  }
  BOOL v13 = sub_10000A7F8((unint64_t)v8, (unint64_t)v9, v12) == 3 && [a1 _stagePhase] == 0;
  id v14 = [a1 _stage];
  id v15 = [a1 _numberOfStages];
  id v16 = [a1 _contact];
  if (v16)
  {
    id v17 = v16;
    unsigned int v18 = [v16 isTouching];
  }
  else
  {
    unsigned int v18 = 0;
  }
  if (sub_10000A7F8((unint64_t)v14, (unint64_t)v15, v18) == 3)
  {
    int v19 = sub_10000C95C([a1 _stagePhase], &off_10001CCF0);
    if (!v13) {
      goto LABEL_24;
    }
  }
  else
  {
    int v19 = 0;
    if (!v13) {
      goto LABEL_24;
    }
  }
  uint64_t v20 = OBJC_IVAR___CAMFocusLockGestureRecognizer_halfPressTimer;
  CFStringRef v21 = *(void **)(v1 + OBJC_IVAR___CAMFocusLockGestureRecognizer_halfPressTimer);
  if (v21) {
    [v21 invalidate];
  }
  uint64_t v22 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10000A86C;
  aBlock[5] = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000C9C4;
  aBlock[3] = &unk_10001CF18;
  v23 = _Block_copy(aBlock);
  v24 = self;
  swift_retain();
  id v25 = [v24 timerWithTimeInterval:0 repeats:v23 block:0.4];
  _Block_release(v23);
  swift_release();
  swift_release();
  v26 = *(void **)(v1 + v20);
  *(void *)(v1 + v20) = v25;

  id v27 = [self currentRunLoop];
  uint64_t v28 = *(void *)(v1 + v20);
  if (!v28)
  {
    __break(1u);
    return;
  }
  v29 = v27;
  [v27 addTimer:v28 forMode:NSRunLoopCommonModes];

LABEL_24:
  uint64_t v30 = OBJC_IVAR___CAMFocusLockGestureRecognizer_halfPressTimer;
  v31 = *(void **)(v1 + OBJC_IVAR___CAMFocusLockGestureRecognizer_halfPressTimer);
  if (v31)
  {
    id v32 = v31;
    if ([v32 isValid])
    {
      if ((v19 | v33))
      {
        [v32 invalidate];

        id v32 = *(id *)(v1 + v30);
        *(void *)(v1 + v30) = 0;
      }
    }
  }
}

void sub_10000A424(void *a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v3 = (unsigned char *)Strong;
    uint64_t v4 = OBJC_IVAR___CAMFocusLockGestureRecognizer_halfPressTimer;
    id v5 = *(void **)(Strong + OBJC_IVAR___CAMFocusLockGestureRecognizer_halfPressTimer);
    if (v5)
    {
      sub_10000A88C();
      id v6 = a1;
      id v7 = v5;
      char v8 = static NSObject.== infix(_:_:)();

      if (v8)
      {
        v3[OBJC_IVAR___CAMFocusLockGestureRecognizer_active] = 1;
        id v9 = *(void (**)(uint64_t))&v3[OBJC_IVAR___CAMFocusLockGestureRecognizer_beganHandler];
        uint64_t v10 = swift_retain();
        v9(v10);
        swift_release();
        id v11 = *(void **)&v3[v4];
        if (v11)
        {
          [v11 invalidate];
          unsigned int v12 = *(unsigned char **)&v3[v4];
        }
        else
        {
          unsigned int v12 = 0;
        }
        *(void *)&v3[v4] = 0;

        id v3 = v12;
      }
    }
  }
}

id sub_10000A630()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t type metadata accessor for FocusLockGestureRecognizer()
{
  return self;
}

void type metadata accessor for SliderType()
{
  if (!qword_100023080)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100023080);
    }
  }
}

void *sub_10000A748@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10000A758(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_10000A764(void *a1, void *a2)
{
  return *a1 == *a2;
}

void sub_10000A778()
{
  uint64_t v1 = v0;
  if (*(unsigned char *)(v0 + OBJC_IVAR___CAMFocusLockGestureRecognizer_active) == 1) {
    (*(void (**)(void))(v0 + OBJC_IVAR___CAMFocusLockGestureRecognizer_endedHandler))();
  }
  uint64_t v2 = OBJC_IVAR___CAMFocusLockGestureRecognizer_halfPressTimer;
  id v3 = *(void **)(v1 + OBJC_IVAR___CAMFocusLockGestureRecognizer_halfPressTimer);
  if (v3)
  {
    [v3 invalidate];
    id v3 = *(void **)(v1 + v2);
  }
  *(void *)(v1 + v2) = 0;
}

uint64_t sub_10000A7F8(unint64_t a1, unint64_t a2, unsigned int a3)
{
  uint64_t v3 = 4;
  uint64_t v4 = 3;
  uint64_t v5 = 2;
  if (a1 == 1) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = a3;
  }
  if (a1 <= 1) {
    uint64_t v5 = v6;
  }
  if (a1 != 3) {
    uint64_t v4 = v5;
  }
  if (a1 <= 3) {
    uint64_t v3 = v4;
  }
  if (a2 <= 1) {
    return 4 * (a1 != 0);
  }
  else {
    return v3;
  }
}

uint64_t sub_10000A834()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000A86C(void *a1)
{
}

uint64_t sub_10000A874(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A884()
{
  return swift_release();
}

unint64_t sub_10000A88C()
{
  unint64_t result = qword_100023470;
  if (!qword_100023470)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100023470);
  }
  return result;
}

uint64_t sub_10000A8CC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A904()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_10000A924()
{
  id v0 = objc_allocWithZone((Class)NSUserDefaults);
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 initWithSuiteName:v1];

  qword_100023650 = (uint64_t)v2;
}

id sub_10000A994()
{
  id result = [self standardUserDefaults];
  qword_100023658 = (uint64_t)result;
  return result;
}

uint64_t sub_10000A9D0()
{
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    sub_10000AAA0((uint64_t)v6);
    NSString v3 = String._bridgeToObjectiveC()();
    id v4 = [v0 BOOLForKey:v3];
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    sub_10000AAA0((uint64_t)v6);
    return 2;
  }
  return (uint64_t)v4;
}

uint64_t sub_10000AAA0(uint64_t a1)
{
  uint64_t v2 = sub_10000AB00(&qword_1000230F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000AB00(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000AB44()
{
  if (qword_100022FC8 != -1) {
    swift_once();
  }
  id v0 = (void *)qword_100023658;
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_10000ACD8((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    sub_10000AAA0((uint64_t)v8);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  sub_10000AD40(0, &qword_1000230F8);
  sub_10000AD40(0, &qword_100023100);
  uint64_t v4 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  sub_10000AD7C(v5, v6);
  return v4;
}

uint64_t sub_10000ACD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000AB00(&qword_1000230F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000AD40(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000AD7C(uint64_t a1, unint64_t a2)
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

void sub_10000ADD4(void *a1)
{
  if (a1)
  {
    id v2 = self;
    id v17 = 0;
    id v3 = a1;
    id v4 = [v2 archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v17];
    id v5 = v17;
    if (v4)
    {
      uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v8 = v7;

      if (qword_100022FC8 != -1) {
        swift_once();
      }
      uint64_t v9 = (void *)qword_100023658;
      Class isa = Data._bridgeToObjectiveC()().super.isa;
      NSString v11 = String._bridgeToObjectiveC()();
      [v9 setObject:isa forKey:v11];

      sub_10000AD7C(v6, v8);
      goto LABEL_12;
    }
    unsigned int v12 = v5;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
  }
  if (qword_100022FD0 != -1) {
    swift_once();
  }
  uint64_t v13 = type metadata accessor for Logger();
  sub_10000B01C(v13, (uint64_t)qword_100023660);
  id v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v14, v15))
  {
    id v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Failed to archive lastUsedControl in writeLastUsedControl", v16, 2u);
    swift_slowDealloc();
  }

  id v3 = a1;
LABEL_12:
}

uint64_t sub_10000B01C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

id sub_10000B094()
{
  self;
  id v1 = (id)swift_dynamicCastObjCClass();
  id result = v0;
  id v3 = result;
  if (!v1) {
    return result;
  }
  if ((sub_10000C95C([v1 sliderType], &off_10001CD20) & 1) == 0) {
    goto LABEL_8;
  }
  id v4 = [v1 captureDeviceUniqueID];
  if (!v4) {
    goto LABEL_8;
  }
  id v5 = v4;
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_10000B7F4(v6);

  uint64_t v52 = v7;
  if (!v7)
  {
LABEL_8:
    if ((sub_10000C95C([v1 sliderType], &off_10001CD88) & 1) == 0)
    {
LABEL_11:
      id v21 = [v1 sliderUnpackingDisplayValuesIfNeeded];

      return v21;
    }
    sub_10000AB00(&qword_100023130);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100016370;
    sub_10000B75C();
    *(NSNumber *)(inited + 32) = NSNumber.init(integerLiteral:)(-1);
    *(NSNumber *)(inited + 40) = NSNumber.init(integerLiteral:)(-100);
    *(NSNumber *)(inited + 48) = NSNumber.init(integerLiteral:)(1);
    *(NSNumber *)(inited + 56) = NSNumber.init(integerLiteral:)(100);
    sub_10000C9CC(inited);
    sub_10000B79C();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v1 setDisplayValuesByValue:isa];

    id v19 = [objc_allocWithZone((Class)CAMOverlayDiscreteFloatRange) initWithMinimum:-100.0 maximum:100.0 step:50.0];
    id v20 = [v1 sliderWithPrimaryValues:v19];
LABEL_10:
    id v1 = v20;

    goto LABEL_11;
  }
  BOOL v51 = [v1 sliderType] == (id)6;
  Class v8 = (Class)[v1 displayValuesByValue];
  if (v8)
  {
LABEL_32:

LABEL_33:
    id v3 = v3;
    char v42 = sub_10000C95C([v1 sliderType], &off_10001CD58);

    if ((v42 & 1) == 0) {
      goto LABEL_11;
    }
    id v43 = [v1 primaryValues];

    if (v43) {
      goto LABEL_11;
    }
    uint64_t v44 = sub_10000C6D4(v51, v52, 0, 0);
    unint64_t v45 = *(void *)(v44 + 16);
    if (v45 >= 2)
    {
      uint64_t v46 = (v45 - 1) & 0x7FFFFFFFFFFFFFFFLL;
      if (v46)
      {
        v54 = _swiftEmptyArrayStorage;
        specialized ContiguousArray.reserveCapacity(_:)();
        uint64_t v47 = 40;
        do
        {
          id v48 = *(id *)(v44 + v47);
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
          v47 += 16;
          --v46;
        }
        while (v46);
      }
    }
    swift_unknownObjectRelease();
    id v49 = objc_allocWithZone((Class)CAMOverlayDiscreteFloatRange);
    sub_10000B75C();
    Class v50 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v19 = [v49 initWithValues:v50];

    id v20 = [v1 sliderWithPrimaryValues:v19];
    goto LABEL_10;
  }
  id v9 = [v1 valueRange];
  if (!v9) {
    goto LABEL_33;
  }
  uint64_t v10 = v9;
  [v9 minimum];
  v53[0] = v11;
  [v10 maximum];
  v53[1] = v12;
  uint64_t v13 = sub_10000C9CC((uint64_t)_swiftEmptyArrayStorage);
  id v14 = self;
  char v15 = 0;
  uint64_t v16 = 0;
  while (1)
  {
    char v24 = v15;
    [v14 zoomControlDisplayValueForZoomFactor:v51 mode:v52 device:0 videoConfiguration:*(double *)&v53[v16]];
    v25.super.super.Class isa = CGFloat._bridgeToObjectiveC()().super.super.isa;
    v26.super.super.Class isa = CGFloat._bridgeToObjectiveC()().super.super.isa;
    if ((v13 & 0xC000000000000001) != 0)
    {
      if (v13 >= 0) {
        v13 &= 0xFFFFFFFFFFFFFF8uLL;
      }
      uint64_t v27 = __CocoaDictionary.count.getter();
      if (__OFADD__(v27, 1)) {
        goto LABEL_41;
      }
      uint64_t v13 = sub_10000BAAC(v13, v27 + 1);
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v54 = (void *)v13;
    unint64_t v30 = sub_10001115C((uint64_t)v25.super.super.isa);
    uint64_t v31 = *(void *)(v13 + 16);
    BOOL v32 = (v29 & 1) == 0;
    uint64_t v33 = v31 + v32;
    if (__OFADD__(v31, v32)) {
      break;
    }
    char v34 = v29;
    if (*(void *)(v13 + 24) >= v33)
    {
      if (isUniquelyReferenced_nonNull_native)
      {
        uint64_t v13 = (uint64_t)v54;
        if (v29) {
          goto LABEL_12;
        }
      }
      else
      {
        sub_10000BF80();
        uint64_t v13 = (uint64_t)v54;
        if (v34) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      sub_10000BCD0(v33, isUniquelyReferenced_nonNull_native);
      unint64_t v35 = sub_10001115C((uint64_t)v25.super.super.isa);
      if ((v34 & 1) != (v36 & 1)) {
        goto LABEL_43;
      }
      unint64_t v30 = v35;
      uint64_t v13 = (uint64_t)v54;
      if (v34)
      {
LABEL_12:
        uint64_t v22 = *(void *)(v13 + 56);
        v23 = *(void **)(v22 + 8 * v30);
        *(NSNumber *)(v22 + 8 * v30) = v26;

        goto LABEL_13;
      }
    }
    *(void *)(v13 + 8 * (v30 >> 6) + 64) |= 1 << v30;
    uint64_t v37 = 8 * v30;
    *(NSNumber *)(*(void *)(v13 + 48) + v37) = v25;
    *(NSNumber *)(*(void *)(v13 + 56) + v37) = v26;
    uint64_t v38 = *(void *)(v13 + 16);
    BOOL v39 = __OFADD__(v38, 1);
    uint64_t v40 = v38 + 1;
    if (v39) {
      goto LABEL_42;
    }
    *(void *)(v13 + 16) = v40;
    v41 = v25.super.super.isa;
LABEL_13:

    swift_bridgeObjectRelease();
    char v15 = 1;
    uint64_t v16 = 1;
    if (v24)
    {
      sub_10000B75C();
      sub_10000B79C();
      Class v8 = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      [v1 setDisplayValuesByValue:v8];
      swift_unknownObjectRelease();
      goto LABEL_32;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  sub_10000B75C();
  id result = (id)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for OverlayServiceControlHelpers()
{
  return self;
}

unint64_t sub_10000B75C()
{
  unint64_t result = qword_100023138;
  if (!qword_100023138)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100023138);
  }
  return result;
}

unint64_t sub_10000B79C()
{
  unint64_t result = qword_100023140;
  if (!qword_100023140)
  {
    sub_10000B75C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100023140);
  }
  return result;
}

uint64_t sub_10000B7F4(void *a1)
{
  uint64_t v1 = kFigCaptureVideoSourceUniqueID_BackWide;
  id v2 = a1;
  if ([v2 isEqualToString:v1])
  {
    uint64_t v3 = 2;
  }
  else if ([v2 isEqualToString:kFigCaptureVideoSourceUniqueID_FrontWide])
  {
    uint64_t v3 = 8;
  }
  else if ([v2 isEqualToString:kFigCaptureVideoSourceUniqueID_Telephoto])
  {
    uint64_t v3 = 3;
  }
  else if ([v2 isEqualToString:kFigCaptureVideoSourceUniqueID_Bravo])
  {
    uint64_t v3 = 4;
  }
  else if ([v2 isEqualToString:kFigCaptureVideoSourceUniqueID_Pearl])
  {
    uint64_t v3 = 9;
  }
  else if ([v2 isEqualToString:kFigCaptureVideoSourceUniqueID_BackSuperWide])
  {
    uint64_t v3 = 5;
  }
  else if ([v2 isEqualToString:kFigCaptureVideoSourceUniqueID_WideBravo])
  {
    uint64_t v3 = 6;
  }
  else if ([v2 isEqualToString:kFigCaptureVideoSourceUniqueID_SuperBravo])
  {
    uint64_t v3 = 7;
  }
  else if ([v2 isEqualToString:kFigCaptureVideoSourceUniqueID_FrontSuperWide])
  {
    uint64_t v3 = 10;
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void *sub_10000B940(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100011524(0, v1, 0);
    uint64_t v3 = (id *)(a1 + 32);
    do
    {
      long long v11 = *(_OWORD *)v3;
      id v4 = *v3;
      id v5 = *((id *)&v11 + 1);
      id v6 = v4;
      id v7 = v5;
      sub_10000AB00(&qword_100023148);
      sub_10000AB00((uint64_t *)&unk_100023150);
      swift_dynamicCast();

      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100011524(0, *((void *)&_swiftEmptyArrayStorage + 2) + 1, 1);
      }
      unint64_t v9 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v9 >= v8 >> 1) {
        sub_100011524(v8 > 1, v9 + 1, 1);
      }
      *((void *)&_swiftEmptyArrayStorage + 2) = v9 + 1;
      *((_OWORD *)&_swiftEmptyArrayStorage + v9 + 2) = v12;
      v3 += 2;
      --v1;
    }
    while (v1);
  }
  return &_swiftEmptyArrayStorage;
}

Swift::Int sub_10000BAAC(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_10000AB00((uint64_t *)&unk_100023520);
    uint64_t v2 = static _DictionaryStorage.convert(_:capacity:)();
    uint64_t v18 = v2;
    __CocoaDictionary.makeIterator()();
    uint64_t v3 = __CocoaDictionary.Iterator.next()();
    if (v3)
    {
      uint64_t v4 = v3;
      sub_10000B75C();
      do
      {
        swift_dynamicCast();
        swift_dynamicCast();
        uint64_t v2 = v18;
        unint64_t v12 = *(void *)(v18 + 16);
        if (*(void *)(v18 + 24) <= v12)
        {
          sub_10000BCD0(v12 + 1, 1);
          uint64_t v2 = v18;
        }
        Swift::Int result = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));
        uint64_t v6 = v2 + 64;
        uint64_t v7 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v8 = result & ~v7;
        unint64_t v9 = v8 >> 6;
        if (((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          unint64_t v10 = __clz(__rbit64((-1 << v8) & ~*(void *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v13 = 0;
          unint64_t v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v15 = v9 == v14;
            if (v9 == v14) {
              unint64_t v9 = 0;
            }
            v13 |= v15;
            uint64_t v16 = *(void *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          unint64_t v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(void *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        uint64_t v11 = 8 * v10;
        *(void *)(*(void *)(v2 + 48) + v11) = v17;
        *(void *)(*(void *)(v2 + 56) + v11) = v4;
        ++*(void *)(v2 + 16);
        uint64_t v4 = __CocoaDictionary.Iterator.next()();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptyDictionarySingleton;
  }
  return v2;
}

uint64_t sub_10000BCD0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000AB00((uint64_t *)&unk_100023520);
  char v37 = a2;
  uint64_t v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    char v36 = v2;
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    unint64_t v9 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v10 = ~(-1 << v8);
    }
    else {
      uint64_t v10 = -1;
    }
    unint64_t v11 = v10 & *(void *)(v5 + 64);
    int64_t v12 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v13 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v15 = 0;
    while (1)
    {
      if (v11)
      {
        unint64_t v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        unint64_t v22 = v21 | (v15 << 6);
      }
      else
      {
        if (__OFADD__(v15++, 1)) {
          goto LABEL_38;
        }
        if (v15 >= v12)
        {
LABEL_31:
          swift_release();
          uint64_t v3 = v36;
          if (v37)
          {
            uint64_t v35 = 1 << *(unsigned char *)(v5 + 32);
            if (v35 >= 64) {
              bzero((void *)(v5 + 64), ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            }
            else {
              *unint64_t v9 = -1 << v35;
            }
            *(void *)(v5 + 16) = 0;
          }
          break;
        }
        unint64_t v24 = v9[v15];
        if (!v24)
        {
          int64_t v25 = v15 + 1;
          if (v15 + 1 >= v12) {
            goto LABEL_31;
          }
          unint64_t v24 = v9[v25];
          if (!v24)
          {
            while (1)
            {
              int64_t v15 = v25 + 1;
              if (__OFADD__(v25, 1)) {
                break;
              }
              if (v15 >= v12) {
                goto LABEL_31;
              }
              unint64_t v24 = v9[v15];
              ++v25;
              if (v24) {
                goto LABEL_20;
              }
            }
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
            return result;
          }
          ++v15;
        }
LABEL_20:
        unint64_t v11 = (v24 - 1) & v24;
        unint64_t v22 = __clz(__rbit64(v24)) + (v15 << 6);
      }
      uint64_t v26 = 8 * v22;
      uint64_t v27 = *(void **)(*(void *)(v5 + 48) + v26);
      uint64_t v28 = *(void **)(*(void *)(v5 + 56) + v26);
      if ((v37 & 1) == 0)
      {
        id v29 = v27;
        id v30 = v28;
      }
      uint64_t result = NSObject._rawHashValue(seed:)(*(void *)(v7 + 40));
      uint64_t v16 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v17 = result & ~v16;
      unint64_t v18 = v17 >> 6;
      if (((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        unint64_t v19 = __clz(__rbit64((-1 << v17) & ~*(void *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v31 = 0;
        unint64_t v32 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v32 && (v31 & 1) != 0)
          {
            __break(1u);
            goto LABEL_37;
          }
          BOOL v33 = v18 == v32;
          if (v18 == v32) {
            unint64_t v18 = 0;
          }
          v31 |= v33;
          uint64_t v34 = *(void *)(v13 + 8 * v18);
        }
        while (v34 == -1);
        unint64_t v19 = __clz(__rbit64(~v34)) + (v18 << 6);
      }
      *(void *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      uint64_t v20 = 8 * v19;
      *(void *)(*(void *)(v7 + 48) + v20) = v27;
      *(void *)(*(void *)(v7 + 56) + v20) = v28;
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v3 = v7;
  return result;
}

id sub_10000BF80()
{
  int64_t v1 = v0;
  sub_10000AB00((uint64_t *)&unk_100023520);
  uint64_t v2 = *v0;
  uint64_t v3 = static _DictionaryStorage.copy(original:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_24:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
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
    if (__OFADD__(v9++, 1)) {
      goto LABEL_26;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    if (!v21) {
      break;
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    unint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    unint64_t v18 = *(void **)(*(void *)(v2 + 56) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    *(void *)(*(void *)(v4 + 56) + v16) = v18;
    id v19 = v17;
    id result = v18;
  }
  int64_t v22 = v9 + 1;
  if (v9 + 1 >= v13) {
    goto LABEL_24;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_24;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void sub_10000C110(unint64_t a1, unint64_t a2)
{
  uint64_t v6 = a1;
  unint64_t v7 = (void *)(a1 >> 62);
  if (a1 >> 62) {
    goto LABEL_103;
  }
  uint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v9 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (v9 >= v8) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = v9;
  }
  uint64_t v51 = v6;
  unint64_t v52 = a2;
  unint64_t v43 = a2 >> 62;
  if ((uint64_t)v10 > 0)
  {
    sub_10000AB00(&qword_100023130);
    uint64_t v11 = (void *)swift_allocObject();
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 17;
    }
    uint64_t v8 = v13 >> 4;
    v11[2] = v10;
    v11[3] = 2 * (v13 >> 4);
    uint64_t v47 = v11;
    if (v7)
    {
      if (v6 < 0) {
        uint64_t v2 = (void *)v6;
      }
      else {
        uint64_t v2 = (void *)(v6 & 0xFFFFFFFFFFFFFF8);
      }
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v9 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    if (v9)
    {
      uint64_t v45 = v10;
      unint64_t v10 = v6 & 0xC000000000000001;
      if ((v6 & 0xC000000000000001) == 0)
      {
        if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_109:
          id v20 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          goto LABEL_50;
        }
        id v14 = *(id *)(v6 + 32);
LABEL_27:
        uint64_t v2 = v14;
        v41 = v7;
        if (a2 >> 62)
        {
          swift_bridgeObjectRetain();
          unint64_t v7 = (void *)_CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
        }
        else
        {
          unint64_t v7 = *(void **)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        if (!v7) {
          goto LABEL_113;
        }
        unint64_t v15 = 0;
        unint64_t v16 = a2;
        a2 &= 0xC000000000000001;
        unint64_t v48 = v16 + 32;
        unint64_t v50 = v16 & 0xFFFFFFFFFFFFFF8;
        uint64_t v4 = v6 & 0xFFFFFFFFFFFFFF8;
        uint64_t v46 = (v8 & 0x7FFFFFFFFFFFFFFFLL) - v45;
        uint64_t v3 = v47 + 6;
        uint64_t v17 = v6 + 40;
        uint64_t v6 = v9 - 1;
        while (1)
        {
          if (a2)
          {
            id v19 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if (v15 >= *(void *)(v50 + 16)) {
              goto LABEL_94;
            }
            id v19 = *(id *)(v48 + 8 * v15);
          }
          *(v3 - 2) = v2;
          *(v3 - 1) = v19;
          if (v45 - 1 == v15) {
            break;
          }
          if (v6 == v15)
          {
            __break(1u);
LABEL_94:
            __break(1u);
LABEL_95:
            __break(1u);
LABEL_96:
            __break(1u);
LABEL_97:
            __break(1u);
LABEL_98:
            __break(1u);
LABEL_99:
            __break(1u);
LABEL_100:
            __break(1u);
LABEL_101:
            __break(1u);
LABEL_102:
            __break(1u);
LABEL_103:
            swift_bridgeObjectRetain();
            uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            goto LABEL_3;
          }
          if (v10)
          {
            id v18 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          }
          else
          {
            if (v15 + 1 >= *(void *)(v4 + 16)) {
              goto LABEL_95;
            }
            id v18 = *(id *)(v17 + 8 * v15);
          }
          uint64_t v2 = v18;
          v3 += 2;
          if (v7 == (void *)++v15) {
            goto LABEL_113;
          }
        }
        uint64_t v6 = v51;
        a2 = v52;
        uint64_t v8 = (uint64_t)v47;
        unint64_t v10 = v45;
        if (!v41) {
          goto LABEL_44;
        }
        goto LABEL_15;
      }
LABEL_107:
      id v14 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      goto LABEL_27;
    }
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  if ((v10 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_106;
  }
  uint64_t v8 = (uint64_t)_swiftEmptyArrayStorage;
  uint64_t v46 = _swiftEmptyArrayStorage[3] >> 1;
  uint64_t v4 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v3 = &_swiftEmptyArrayStorage[4];
  if (!v7)
  {
LABEL_44:
    uint64_t v9 = *(void *)(v4 + 16);
    goto LABEL_45;
  }
LABEL_15:
  if (v6 < 0) {
    uint64_t v2 = (void *)v6;
  }
  else {
    uint64_t v2 = (void *)v4;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
LABEL_45:
  uint64_t v4 = v46;
  if (v10 == v9)
  {
LABEL_46:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_89;
  }
  unint64_t v50 = v6 & 0xC000000000000001;
  if ((v6 & 0xC000000000000001) != 0) {
    goto LABEL_109;
  }
  if (v10 >= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
    goto LABEL_111;
  }
  id v20 = *(id *)(v6 + 8 * v10 + 32);
LABEL_50:
  unint64_t v7 = v20;
  unint64_t v21 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
LABEL_111:
    __break(1u);
LABEL_112:
    __break(1u);
LABEL_113:

    __break(1u);
    return;
  }
  if (!v43)
  {
    uint64_t v2 = *(void **)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if ((void *)v10 == v2) {
      goto LABEL_88;
    }
    goto LABEL_55;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = (void *)_CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if ((void *)v10 != v2)
  {
LABEL_55:
    uint64_t v47 = (void *)v9;
    unint64_t v49 = a2 & 0xC000000000000001;
    unint64_t v44 = a2 + 32;
    uint64_t v45 = a2 & 0xFFFFFFFFFFFFFF8;
    uint64_t v40 = v6 + 32;
    uint64_t v42 = v6 & 0xFFFFFFFFFFFFFF8;
    do
    {
      if (v49)
      {
        id v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        if (!v4) {
          goto LABEL_64;
        }
      }
      else
      {
        if ((v10 & 0x8000000000000000) != 0) {
          goto LABEL_98;
        }
        if (v10 >= *(void *)(v45 + 16)) {
          goto LABEL_99;
        }
        id v22 = *(id *)(v44 + 8 * v10);
        if (!v4)
        {
LABEL_64:
          unint64_t v24 = *(void *)(v8 + 24);
          if ((uint64_t)((v24 >> 1) + 0x4000000000000000) < 0) {
            goto LABEL_100;
          }
          int64_t v25 = v24 & 0xFFFFFFFFFFFFFFFELL;
          if (v25 <= 1) {
            uint64_t v26 = 1;
          }
          else {
            uint64_t v26 = v25;
          }
          sub_10000AB00(&qword_100023130);
          uint64_t v27 = (void *)swift_allocObject();
          int64_t v28 = j__malloc_size(v27);
          uint64_t v29 = v28 - 32;
          if (v28 < 32) {
            uint64_t v29 = v28 - 17;
          }
          uint64_t v30 = v29 >> 4;
          v27[2] = v26;
          v27[3] = 2 * (v29 >> 4);
          unint64_t v31 = (unint64_t)(v27 + 4);
          uint64_t v32 = *(void *)(v8 + 24) >> 1;
          if (*(void *)(v8 + 16))
          {
            if (v27 != (void *)v8 || v31 >= v8 + 32 + 16 * v32) {
              memmove(v27 + 4, (const void *)(v8 + 32), 16 * v32);
            }
            *(void *)(v8 + 16) = 0;
          }
          uint64_t v3 = (void *)(v31 + 16 * v32);
          uint64_t v34 = (v30 & 0x7FFFFFFFFFFFFFFFLL) - v32;
          swift_release();
          uint64_t v8 = (uint64_t)v27;
          uint64_t v6 = v51;
          a2 = v52;
          BOOL v23 = __OFSUB__(v34, 1);
          uint64_t v4 = v34 - 1;
          if (v23) {
            goto LABEL_96;
          }
          goto LABEL_79;
        }
      }
      BOOL v23 = __OFSUB__(v4--, 1);
      if (v23) {
        goto LABEL_96;
      }
LABEL_79:
      void *v3 = v7;
      v3[1] = v22;
      if ((void *)v21 == v47) {
        goto LABEL_46;
      }
      if (v50)
      {
        id v35 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        if ((v21 & 0x8000000000000000) != 0) {
          goto LABEL_101;
        }
        if (v21 >= *(void *)(v42 + 16)) {
          goto LABEL_102;
        }
        id v35 = *(id *)(v40 + 8 * v21);
      }
      unint64_t v7 = v35;
      if (__OFADD__(v21, 1)) {
        goto LABEL_97;
      }
      v3 += 2;
      unint64_t v10 = v21;
    }
    while (v21++ != (void)v2);
  }
LABEL_88:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

LABEL_89:
  unint64_t v37 = *(void *)(v8 + 24);
  if (v37 < 2) {
    return;
  }
  unint64_t v38 = v37 >> 1;
  BOOL v23 = __OFSUB__(v38, v4);
  unint64_t v39 = v38 - v4;
  if (v23) {
    goto LABEL_112;
  }
  *(void *)(v8 + 16) = v39;
}

uint64_t sub_10000C6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v30 = 0;
  unint64_t v31 = 0;
  [self shouldApplyContinuousZoomForMode:a1 device:a2 videoConfiguration:a3 videoStabilizationStrength:a4 zoomFactors:&v31 displayZoomFactors:&v30];
  id v5 = v30;
  uint64_t v6 = v31;
  if (v31)
  {
    unint64_t v31 = 0;
    sub_10000B75C();
    id v7 = v6;
    id v8 = v5;
    id v9 = v7;
    static Array._conditionallyBridgeFromObjectiveC(_:result:)();

    unint64_t v10 = (unint64_t)v31;
    if (v31)
    {
      if (v8)
      {
        unint64_t v31 = 0;
        id v11 = v8;
        static Array._conditionallyBridgeFromObjectiveC(_:result:)();

        unint64_t v12 = (unint64_t)v31;
        if (v31)
        {
          if (v10 >> 62)
          {
            id v28 = v5;
            swift_bridgeObjectRetain();
            uint64_t v18 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            uint64_t v13 = v18;
            id v5 = v28;
          }
          else
          {
            uint64_t v13 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          if (v12 >> 62)
          {
            uint64_t v27 = v13;
            id v29 = v5;
            swift_bridgeObjectRetain();
            uint64_t v19 = _CocoaArrayWrapper.endIndex.getter();
            swift_bridgeObjectRelease();
            uint64_t v20 = v19;
            id v5 = v29;
            if (v27 == v20) {
              goto LABEL_9;
            }
          }
          else if (v13 == *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
LABEL_9:
            sub_10000C110(v10, v12);
            uint64_t v15 = v14;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v16 = (uint64_t)sub_10000B940(v15);

            swift_release();
            return v16;
          }
          swift_bridgeObjectRelease();
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    id v17 = v30;
  }
  sub_10000B75C();
  v21.super.super.Class isa = NSNumber.init(floatLiteral:)(1.0).super.super.isa;
  double v22 = 3.0;
  if (!a1) {
    double v22 = 5.0;
  }
  Class isa = NSNumber.init(floatLiteral:)(v22).super.super.isa;
  sub_10000AB00((uint64_t *)&unk_100023510);
  uint64_t v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_100016370;
  *(NSNumber *)(v16 + 32) = v21;
  *(NSNumber *)(v16 + 40) = v21;
  *(void *)(v16 + 48) = isa;
  *(void *)(v16 + 56) = isa;
  unint64_t v24 = v21.super.super.isa;
  int64_t v25 = isa;

  return v16;
}

uint64_t sub_10000C960(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 16);
  if (!v2) {
    return 0;
  }
  if (*(void *)(a2 + 32) == result) {
    return 1;
  }
  if (v2 == 1) {
    return 0;
  }
  for (uint64_t i = 5; ; ++i)
  {
    uint64_t v4 = i - 3;
    if (__OFADD__(i - 4, 1)) {
      break;
    }
    BOOL v6 = *(void *)(a2 + 8 * i) == result;
    BOOL v5 = v6;
    BOOL v6 = v6 || v4 == v2;
    if (v6) {
      return v5;
    }
  }
  __break(1u);
  return result;
}

void sub_10000C9C4(uint64_t a1, void *a2)
{
}

unint64_t sub_10000C9CC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000AB00((uint64_t *)&unk_100023520);
  uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void **)(a1 + 40);
  while (1)
  {
    BOOL v5 = *v4;
    id v6 = *(v4 - 1);
    id v7 = v5;
    unint64_t result = sub_10001115C((uint64_t)v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v6;
    *(void *)(v2[7] + v10) = v7;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v2[2] = v13;
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

unint64_t sub_10000CAD8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000AB00(&qword_1000234F8);
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
    sub_1000139D8(v6, (uint64_t)v15);
    unint64_t result = sub_1000111A0((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_100013A40(&v17, (_OWORD *)(v3[7] + 32 * result));
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

id sub_10000CD90()
{
  return sub_10001049C(0, type metadata accessor for OverlayWindow);
}

uint64_t type metadata accessor for OverlayWindow()
{
  return self;
}

void sub_10000CE60(void *a1)
{
  uint64_t v2 = v1;
  if (qword_100022FD0 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_10000B01C(v4, (uint64_t)qword_100023660);
  id v5 = a1;
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    char v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)char v8 = 138543362;
    id v10 = v5;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *uint64_t v9 = v5;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, "SceneDelegate: Disconnected scene: %{public}@", v8, 0xCu);
    sub_10000AB00(&qword_100023468);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  long long v11 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window);
  *(void *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window) = 0;

  uint64_t v12 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController);
  *(void *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController) = 0;

  [*(id *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientMonitor) endMonitoring];
  id v13 = [self sharedInstance];
  [v13 removeObserver:v2];
}

void sub_10000D0E4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window);
  if (v2
    && (id v3 = [v2 windowScene]) != 0
    && (v3, !*(void *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken))
    && (uint64_t v4 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer,
        !*(void *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer)))
  {
    if (qword_100022FD0 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_10000B01C(v11, (uint64_t)qword_100023660);
    uint64_t v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      uint64_t v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "SceneDelegate: Waiting for scene teardown", v14, 2u);
      swift_slowDealloc();
    }

    if (qword_100022FC0 != -1) {
      swift_once();
    }
    uint64_t v15 = (void *)qword_100023650;
    if (!qword_100023650
      || (NSString v16 = String._bridgeToObjectiveC()(),
          [v15 doubleForKey:v16],
          double v18 = v17,
          v16,
          v18 <= 0.0))
    {
      double v18 = 5.0;
    }
    uint64_t v19 = self;
    uint64_t v20 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v24[4] = sub_1000138E8;
    v24[5] = v20;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 1107296256;
    v24[2] = sub_10000C9C4;
    v24[3] = &unk_10001D008;
    NSNumber v21 = _Block_copy(v24);
    swift_release();
    id v22 = [v19 scheduledTimerWithTimeInterval:0 repeats:v21 block:v18];
    _Block_release(v21);
    BOOL v23 = *(void **)(v1 + v4);
    *(void *)(v1 + v4) = v22;
  }
  else
  {
    uint64_t v5 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer;
    if (*(void *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer))
    {
      if (qword_100022FD0 != -1) {
        swift_once();
      }
      uint64_t v6 = type metadata accessor for Logger();
      sub_10000B01C(v6, (uint64_t)qword_100023660);
      os_log_type_t v7 = Logger.logObject.getter();
      os_log_type_t v8 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v7, v8))
      {
        uint64_t v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "SceneDelegate: Canceling teardown", v9, 2u);
        swift_slowDealloc();
      }

      [*(id *)(v1 + v5) invalidate];
      id v10 = *(void **)(v1 + v5);
      *(void *)(v1 + v5) = 0;
    }
  }
}

void sub_10000D488(void *a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v3 = (void *)Strong;
    sub_10000D4E4(a1);
  }
}

void sub_10000D4E4(void *a1)
{
  id v3 = [self sharedApplication];
  uint64_t v4 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window);
  if (v4)
  {
    id v17 = v3;
    id v5 = [v4 windowScene];
    if (v5)
    {
      uint64_t v6 = v5;
      if ([a1 isValid])
      {
        os_log_type_t v7 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer);
        if (v7)
        {
          sub_10000AD40(0, (unint64_t *)&qword_100023470);
          id v8 = a1;
          id v9 = v7;
          char v10 = static NSObject.== infix(_:_:)();

          if (v10)
          {
            if (qword_100022FD0 != -1) {
              swift_once();
            }
            uint64_t v11 = type metadata accessor for Logger();
            sub_10000B01C(v11, (uint64_t)qword_100023660);
            uint64_t v12 = Logger.logObject.getter();
            os_log_type_t v13 = static os_log_type_t.default.getter();
            if (os_log_type_enabled(v12, v13))
            {
              uint64_t v14 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)uint64_t v14 = 0;
              _os_log_impl((void *)&_mh_execute_header, v12, v13, "SceneDelegate: Committing teardown", v14, 2u);
              swift_slowDealloc();
            }

            id v15 = [v6 session];
            aBlock[4] = sub_10000D78C;
            aBlock[5] = 0;
            aBlock[0] = _NSConcreteStackBlock;
            aBlock[1] = 1107296256;
            aBlock[2] = sub_10000D968;
            aBlock[3] = &unk_10001CFE0;
            NSString v16 = _Block_copy(aBlock);
            [v17 requestSceneSessionDestruction:v15 options:0 errorHandler:v16];

            _Block_release(v16);
            return;
          }
        }
      }
    }
  }
  else
  {
    _objc_release_x1();
  }
}

void sub_10000D78C()
{
  if (qword_100022FD0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000B01C(v0, (uint64_t)qword_100023660);
  swift_errorRetain();
  swift_errorRetain();
  oslog = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(oslog, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    id v3 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 138543362;
    swift_errorRetain();
    uint64_t v5 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v3 = v5;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "SceneDelegate: Failed teardown: %{public}@", v2, 0xCu);
    sub_10000AB00(&qword_100023468);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }
}

void sub_10000D968(uint64_t a1, void *a2)
{
}

void sub_10000D970(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_10000DA54(void *a1)
{
  uint64_t v2 = v1;
  id v3 = a1;
  uint64_t v4 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection;
  uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v5)
  {
    if (!a1)
    {
LABEL_7:
      [v5 addObserver:v2];
      goto LABEL_8;
    }
    sub_10000AD40(0, &qword_1000234A0);
    id v6 = v5;
    id v3 = v3;
    char v7 = static NSObject.== infix(_:_:)();

    if (v7) {
      return;
    }
  }
  else if (!a1)
  {
    return;
  }
  id v8 = v3;
  [v8 setFocusLocked:0];
  [v8 setQuietUIActive:0];
  [v8 sendOverlayVisibility:0 activeControlIdentifier:0];

  [v8 removeObserver:v2];
  uint64_t v5 = *(void **)(v2 + v4);
  if (v5) {
    goto LABEL_7;
  }
LABEL_8:

  sub_10000E4A8();
}

void sub_10000DB88()
{
  uint64_t v1 = v0;
  v68 = 0;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken);
  p_superclass = &OBJC_METACLASS___CAMFocusLockGestureRecognizer.superclass;
  if (!v2 || !*(void *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window)) {
    goto LABEL_38;
  }
  uint64_t v4 = self;
  id v5 = v2;
  id v6 = [v4 sharedInstance];
  char v7 = (__objc2_class *)[v6 activeConnectionForProcess:[v5 versionedPID]];

  v68 = v7;
  id v8 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  v62 = v7;
  if (v7)
  {
    if (v8)
    {
      sub_10000AD40(0, &qword_1000234A0);
      id v9 = v7;
      id v10 = v8;
      char v11 = static NSObject.== infix(_:_:)();

      if (v11)
      {

LABEL_8:
        goto LABEL_38;
      }
    }
    else
    {
      uint64_t v12 = v7;
    }
  }
  else if (!v8)
  {
    goto LABEL_8;
  }
  v61 = v5;
  id v13 = [v4 sharedInstance];
  id v14 = [v13 allConnections];

  sub_10000AD40(0, &qword_1000234A0);
  sub_100013780();
  uint64_t v15 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

  unint64_t v16 = v15 & 0xC000000000000001;
  if ((v15 & 0xC000000000000001) != 0)
  {
    uint64_t v17 = __CocoaSet.count.getter();
    uint64_t v60 = v1;
    if (v17)
    {
LABEL_12:
      sub_100011544(0, v17 & ~(v17 >> 63), 0);
      if (v16)
      {
        uint64_t v18 = __CocoaSet.startIndex.getter();
        char v20 = 1;
      }
      else
      {
        uint64_t v18 = sub_100011BB8(v15);
        char v20 = v21 & 1;
      }
      uint64_t v65 = v18;
      uint64_t v66 = v19;
      char v67 = v20;
      if (v17 < 0)
      {
        __break(1u);
LABEL_40:
        __break(1u);
      }
      do
      {
        while (1)
        {
          sub_100011940(v65, v66, v67, v15);
          unint64_t v31 = v30;
          uint64_t v63 = 2314;
          unint64_t v64 = 0xE200000000000000;
          id v32 = [v30 description];
          uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          id v35 = v34;

          v36._countAndFlagsBits = v33;
          v36._object = v35;
          String.append(_:)(v36);

          swift_bridgeObjectRelease();
          uint64_t v37 = v63;
          unint64_t v38 = v64;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_100011544(0, _swiftEmptyArrayStorage[2] + 1, 1);
          }
          unint64_t v40 = _swiftEmptyArrayStorage[2];
          unint64_t v39 = _swiftEmptyArrayStorage[3];
          if (v40 >= v39 >> 1) {
            sub_100011544(v39 > 1, v40 + 1, 1);
          }
          _swiftEmptyArrayStorage[2] = v40 + 1;
          v41 = &_swiftEmptyArrayStorage[2 * v40];
          v41[4] = v37;
          v41[5] = v38;
          if (v16) {
            break;
          }
          uint64_t v22 = v65;
          uint64_t v23 = v66;
          char v24 = v67;
          int64_t v25 = sub_10001185C(v65, v66, v67, v15);
          uint64_t v27 = v26;
          char v29 = v28;
          sub_1000137E8(v22, v23, v24);
          uint64_t v65 = v25;
          uint64_t v66 = v27;
          char v67 = v29 & 1;
          if (!--v17) {
            goto LABEL_29;
          }
        }
        if ((v67 & 1) == 0) {
          goto LABEL_40;
        }
        if (__CocoaSet.Index.handleBitPattern.getter()) {
          swift_isUniquelyReferenced_nonNull_native();
        }
        sub_10000AB00(&qword_1000234B0);
        uint64_t v42 = (void (*)(uint64_t *, void))Set.Index._asCocoa.modify();
        __CocoaSet.formIndex(after:isUnique:)();
        v42(&v63, 0);
        --v17;
      }
      while (v17);
LABEL_29:
      sub_1000137E8(v65, v66, v67);
      swift_bridgeObjectRelease();
      uint64_t v1 = v60;
      goto LABEL_30;
    }
  }
  else
  {
    uint64_t v17 = *(void *)(v15 + 16);
    uint64_t v60 = v1;
    if (v17) {
      goto LABEL_12;
    }
  }
  swift_bridgeObjectRelease();
LABEL_30:
  uint64_t v63 = (uint64_t)_swiftEmptyArrayStorage;
  sub_10000AB00(&qword_1000234B8);
  sub_10001398C(&qword_1000234C0, &qword_1000234B8);
  uint64_t v43 = BidirectionalCollection<>.joined(separator:)();
  unint64_t v45 = v44;
  swift_bridgeObjectRelease();
  uint64_t v63 = v43;
  unint64_t v64 = v45;
  swift_bridgeObjectRetain();
  v46._countAndFlagsBits = 10;
  v46._object = (void *)0xE100000000000000;
  String.append(_:)(v46);
  swift_bridgeObjectRelease();
  uint64_t v47 = v63;
  unint64_t v48 = v64;
  p_superclass = (__objc2_class **)(&OBJC_METACLASS___CAMFocusLockGestureRecognizer + 8);
  if (qword_100022FD0 != -1) {
    swift_once();
  }
  uint64_t v49 = type metadata accessor for Logger();
  sub_10000B01C(v49, (uint64_t)qword_100023660);
  unint64_t v50 = v62;
  swift_bridgeObjectRetain();
  uint64_t v51 = Logger.logObject.getter();
  os_log_type_t v52 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v51, v52))
  {
    uint64_t v53 = swift_slowAlloc();
    v59 = (void *)swift_slowAlloc();
    uint64_t v63 = swift_slowAlloc();
    *(_DWORD *)uint64_t v53 = 138543618;
    if (v62)
    {
      uint64_t v65 = (uint64_t)v50;
      v54 = v50;
    }
    else
    {
      uint64_t v65 = 0;
    }
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v59 = v62;

    *(_WORD *)(v53 + 12) = 2082;
    swift_bridgeObjectRetain();
    uint64_t v65 = sub_100010B04(v47, v48, &v63);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v51, v52, "SceneDelegate: Adopting connection %{public}@ out of [%{public}s]", (uint8_t *)v53, 0x16u);
    sub_10000AB00(&qword_100023468);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v1 = v60;
    p_superclass = &OBJC_METACLASS___CAMFocusLockGestureRecognizer.superclass;
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
LABEL_38:
  swift_beginAccess();
  v55 = v68;
  v56 = p_superclass[55];
  v57 = *(__objc2_class **)((char *)&v56->isa + v1);
  *(__objc2_class **)((char *)&v56->isa + v1) = v68;
  v58 = v55;
  sub_10000DA54(v57);
}

id sub_10000E2EC()
{
  uint64_t v1 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate____lazy_storage___focusLockContactRecognizer;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate____lazy_storage___focusLockContactRecognizer);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate____lazy_storage___focusLockContactRecognizer);
  }
  else
  {
    uint64_t v4 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v6 = (objc_class *)type metadata accessor for FocusLockGestureRecognizer();
    char v7 = objc_allocWithZone(v6);
    *(void *)&v7[OBJC_IVAR___CAMFocusLockGestureRecognizer_halfPressTimer] = 0;
    v7[OBJC_IVAR___CAMFocusLockGestureRecognizer_active] = 0;
    id v8 = (void (**)())&v7[OBJC_IVAR___CAMFocusLockGestureRecognizer_beganHandler];
    void *v8 = sub_100013740;
    v8[1] = (void (*)())v4;
    id v9 = (void (**)())&v7[OBJC_IVAR___CAMFocusLockGestureRecognizer_endedHandler];
    *id v9 = sub_100013760;
    v9[1] = (void (*)())v5;
    v14.receiver = v7;
    v14.super_class = v6;
    id v10 = [super init];
    char v11 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v10;
    id v3 = v10;

    uint64_t v2 = 0;
  }
  id v12 = v2;
  return v3;
}

void sub_10000E41C(uint64_t a1, char a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    uint64_t v5 = *(void **)(Strong + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
    id v6 = v5;

    if (v5)
    {
      [v6 setFocusLocked:a2 & 1];
    }
  }
}

void sub_10000E4A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection;
  id v3 = *(void **)&v0[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection];
  if (!v3)
  {
    uint64_t v6 = 0;
    goto LABEL_13;
  }
  id v4 = [v3 updatesByID];
  if (!v4)
  {
    uint64_t v6 = 0;
    char v7 = *(void **)&v0[v2];
    if (v7) {
      goto LABEL_7;
    }
LABEL_13:
    id v38 = 0;
    unint64_t v10 = 0;
    goto LABEL_14;
  }
  uint64_t v5 = v4;
  sub_10000AD40(0, &qword_100023478);
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  char v7 = *(void **)&v1[v2];
  if (!v7) {
    goto LABEL_13;
  }
LABEL_7:
  id v8 = [v7 controls];
  if (!v8) {
    goto LABEL_13;
  }
  id v9 = v8;
  sub_10000AD40(0, &qword_100023100);
  unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    if (_CocoaArrayWrapper.endIndex.getter() >= 1) {
      goto LABEL_10;
    }
LABEL_48:
    swift_bridgeObjectRelease();
    id v38 = 0;
    goto LABEL_14;
  }
  uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v11 < 1) {
    goto LABEL_48;
  }
LABEL_10:
  id v12 = *(void **)&v1[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl];
  if (v12 && (id v13 = v12, v38 = sub_10000E958(v10), v13, v38))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    int64_t v25 = v1;
    id v38 = sub_1000120B8(v10, (uint64_t)v25);
    swift_bridgeObjectRelease();
  }
LABEL_14:
  uint64_t v14 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController;
  uint64_t v15 = *(void **)&v1[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController];
  if (!v15)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  if (!v10)
  {
    id v19 = v15;
    v17.super.Class isa = 0;
    if (v6) {
      goto LABEL_17;
    }
LABEL_20:
    v18.super.Class isa = 0;
    goto LABEL_21;
  }
  sub_10000AD40(0, &qword_100023100);
  id v16 = v15;
  v17.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_20;
  }
LABEL_17:
  sub_10000AD40(0, &qword_100023478);
  v18.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
LABEL_21:
  [v15 setControls:v17.super.isa updatesByID:v18.super.isa activeControl:v38];

LABEL_22:
  char v20 = *(void **)&v1[v14];
  if (!v20) {
    goto LABEL_30;
  }
  uint64_t v21 = qword_100022FC0;
  id v22 = v20;
  if (v21 != -1)
  {
    swift_once();
    if (qword_100023650) {
      goto LABEL_25;
    }
LABEL_28:
    char v24 = 1;
    goto LABEL_29;
  }
  if (!qword_100023650) {
    goto LABEL_28;
  }
LABEL_25:
  char v23 = sub_10000A9D0();
  char v24 = (v23 == 2) | v23;
LABEL_29:
  [v22 setSwipeForOverlaySupported:v24 & 1, v38];

LABEL_30:
  if (qword_100022FC0 == -1)
  {
    uint64_t v26 = (void *)qword_100023650;
    if (!qword_100023650) {
      goto LABEL_37;
    }
  }
  else
  {
    swift_once();
    uint64_t v26 = (void *)qword_100023650;
    if (!qword_100023650) {
      goto LABEL_37;
    }
  }
  NSString v27 = String._bridgeToObjectiveC()();
  unsigned int v28 = [v26 BOOLForKey:v27];

  if (v28)
  {
    char v29 = *(void **)&v1[v14];
    if (v29)
    {
      id v30 = v29;
      id v31 = sub_10000E2EC();
      [v30 addContactRecognizer:v31];
    }
    v1[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_isFocusLockContactRecognizerInstalled] = 1;
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v32 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_isFocusLockContactRecognizerInstalled;
  if (v1[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_isFocusLockContactRecognizerInstalled] == 1)
  {
    uint64_t v33 = *(void **)&v1[v14];
    if (v33)
    {
      id v34 = v33;
      id v35 = sub_10000E2EC();
      [v34 removeContactRecognizer:v35];
    }
    v1[v32] = 0;
  }
LABEL_41:
  if (!*(void *)&v1[v2])
  {
    Swift::String v36 = *(void **)&v1[v14];
    if (v36)
    {
      id v37 = v36;
      [v37 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

id sub_10000E958(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_41;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = _CocoaArrayWrapper.endIndex.getter())
  {
    unint64_t v48 = v1 & 0xC000000000000001;
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = v48 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)() : *(id *)(v1 + 8 * v3);
      id v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      unint64_t v7 = v1;
      id v8 = [v4 identifier];
      uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v11 = v10;

      id v12 = [v49 identifier];
      uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      uint64_t v15 = v14;

      if (v9 == v13 && v11 == v15)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_21:
        swift_bridgeObjectRelease();
        return v5;
      }
      char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v17) {
        goto LABEL_21;
      }

      ++v3;
      unint64_t v1 = v7;
      if (v6 == v2) {
        goto LABEL_14;
      }
    }
    __break(1u);
LABEL_41:
    swift_bridgeObjectRetain();
  }
LABEL_14:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  id v18 = v49;
  sub_100011C40(v1, v18);
  swift_bridgeObjectRelease();

  os_log_type_t v52 = v18;
  id v19 = v18;
  swift_bridgeObjectRetain();
  sub_10000AB00(&qword_100023480);
  sub_10000AB00(&qword_100023488);
  if (!swift_dynamicCast())
  {

    swift_bridgeObjectRelease();
    os_log_type_t v52 = v19;
    id v21 = v19;
    swift_bridgeObjectRetain();
    sub_10000AB00(&qword_100023490);
    if (swift_dynamicCast())
    {

      swift_bridgeObjectRelease();
      unint64_t v22 = v50;
      id v23 = v51;
      char v24 = &selRef_pickerType;
    }
    else
    {

      swift_bridgeObjectRelease();
      os_log_type_t v52 = v21;
      sub_10000AB00(&qword_100023498);
      if (!swift_dynamicCast())
      {
LABEL_66:

        swift_bridgeObjectRelease();
        goto LABEL_67;
      }
      unint64_t v22 = v50;
      id v23 = v51;
      char v24 = &selRef_toggleType;
    }
    id v5 = sub_100011DAC(v22, v23, (SEL *)v24);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    if (v5) {
      return v5;
    }
LABEL_67:
    id v45 = v19;
    id v5 = (id)sub_100011EF4(v1, v45);

    return v5;
  }

  swift_bridgeObjectRelease();
  id v20 = v51;
  id v5 = sub_100011DAC(v50, v20, (SEL *)&selRef_sliderType);

  if (!v5)
  {
    self;
    uint64_t v25 = swift_dynamicCastObjCClass();
    if (v25)
    {
      uint64_t v26 = (void *)v25;
      id v27 = v20;
      char v28 = sub_10000C960((uint64_t)[v26 sliderType], (uint64_t)&off_10001CDC0);

      unint64_t v47 = v1;
      if (v28)
      {
        if (v50 >> 62) {
          goto LABEL_44;
        }
        uint64_t v29 = *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        for (; v29; uint64_t v29 = _CocoaArrayWrapper.endIndex.getter())
        {
          uint64_t v30 = 4;
          while (1)
          {
            id v31 = (v50 & 0xC000000000000001) != 0
                ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
                : *(id *)(v50 + 8 * v30);
            id v5 = v31;
            uint64_t v32 = v30 - 3;
            if (__OFADD__(v30 - 4, 1)) {
              break;
            }
            self;
            uint64_t v33 = (void *)swift_dynamicCastObjCClass();
            if (v33 && (char *)[v33 sliderType] - 5 < (char *)2)
            {

              swift_bridgeObjectRelease_n();
              goto LABEL_17;
            }

            ++v30;
            if (v32 == v29) {
              goto LABEL_45;
            }
          }
          __break(1u);
LABEL_44:
          swift_bridgeObjectRetain();
        }
LABEL_45:
        swift_bridgeObjectRelease();
        unint64_t v1 = v47;
      }
      id v34 = v27;
      char v35 = sub_10000C960((uint64_t)[v26 sliderType], (uint64_t)&off_10001CDF0);

      if (v35)
      {
        if (v50 >> 62) {
          goto LABEL_64;
        }
        uint64_t v36 = *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        for (; v36; uint64_t v36 = _CocoaArrayWrapper.endIndex.getter())
        {
          uint64_t v37 = 4;
          while (1)
          {
            id v38 = (v50 & 0xC000000000000001) != 0
                ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
                : *(id *)(v50 + 8 * v37);
            unint64_t v39 = v38;
            uint64_t v40 = v37 - 3;
            if (__OFADD__(v37 - 4, 1)) {
              break;
            }
            self;
            uint64_t v41 = swift_dynamicCastObjCClass();
            if (v41)
            {
              uint64_t v42 = (void *)v41;
              id v5 = v39;
              uint64_t v43 = (char *)[v42 sliderType];

              if ((unint64_t)(v43 - 5) < 2 || v43 == (char *)7)
              {
                swift_bridgeObjectRelease_n();

                goto LABEL_17;
              }
            }

            ++v37;
            if (v40 == v36) {
              goto LABEL_65;
            }
          }
          __break(1u);
LABEL_64:
          swift_bridgeObjectRetain();
        }
LABEL_65:

        swift_bridgeObjectRelease_n();
        unint64_t v1 = v47;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    goto LABEL_66;
  }
  swift_bridgeObjectRelease();

LABEL_17:
  swift_bridgeObjectRelease();
  return v5;
}

void sub_10000F0E0()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer;
  [*(id *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer) invalidate];
  if (qword_100022FC0 != -1) {
    swift_once();
  }
  if (!qword_100023650 || ((v3 = sub_10000A9D0(), v3 != 2) ? (BOOL v4 = (v3 & 1) == 0) : (BOOL v4 = 0), !v4))
  {
    uint64_t v5 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v13[4] = sub_100013720;
    v13[5] = v5;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 1107296256;
    v13[2] = sub_10000C9C4;
    v13[3] = &unk_10001CFB8;
    uint64_t v6 = _Block_copy(v13);
    unint64_t v7 = self;
    swift_retain();
    id v8 = [v7 timerWithTimeInterval:0 repeats:v6 block:0.5];
    _Block_release(v6);
    swift_release();
    swift_release();
    uint64_t v9 = *(void **)(v1 + v2);
    *(void *)(v1 + v2) = v8;

    id v10 = [self currentRunLoop];
    uint64_t v11 = *(void *)(v1 + v2);
    if (v11)
    {
      id v12 = v10;
      [v10 addTimer:v11 forMode:NSRunLoopCommonModes];
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10000F2D8(void *a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    char v3 = (char *)Strong;
    BOOL v4 = *(void **)(Strong + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
    if (v4
      && (uint64_t v5 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer,
          (uint64_t v6 = *(void **)(Strong + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer)) != 0))
    {
      sub_10000AD40(0, (unint64_t *)&qword_100023470);
      id v7 = v4;
      id v8 = a1;
      id v9 = v6;
      char v10 = static NSObject.== infix(_:_:)();

      if (v10)
      {
        if ([v7 overlayVisible]) {
          [v7 setQuietUIActive:1];
        }
        uint64_t v11 = *(void **)&v3[v5];
        *(void *)&v3[v5] = 0;

        id v7 = v11;
      }
      else
      {
      }
    }
    else
    {
      id v7 = (id)Strong;
    }
  }
}

void sub_10000F404(void *a1, char a2)
{
  if (a2)
  {
    sub_10000F0E0();
  }
  else
  {
    uint64_t v5 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer;
    [*(id *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer) invalidate];
    uint64_t v6 = *(void **)(v2 + v5);
    *(void *)(v2 + v5) = 0;

    id v7 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
    if (v7) {
      [v7 setQuietUIActive:0];
    }
  }
  id v8 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v8)
  {
    id v9 = v8;
    id v10 = [a1 activeControl];
    if (v10)
    {
      uint64_t v11 = v10;
      id v12 = [v10 identifier];

      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v13 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v13 = 0;
    }
    [v9 sendOverlayVisibility:a2 & 1 activeControlIdentifier:v13];
  }
}

void sub_10000F5CC(void *a1, id a2)
{
  uint64_t v3 = v2;
  id v6 = [a2 controlIdentifier];
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;

  id v10 = [a1 controlsByID];
  if (v10)
  {
    uint64_t v11 = v10;
    sub_10000AD40(0, &qword_100023100);
    uint64_t v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    if (*(void *)(v12 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v13 = sub_1000111E4(v7, v9);
      if (v14)
      {
        uint64_t v15 = *(void **)(*(void *)(v12 + 56) + 8 * v13);
        id v16 = v15;
      }
      else
      {
        uint64_t v15 = 0;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v17 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection;
  id v18 = *(void **)(v3 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v18)
  {
    id v19 = [v18 controlsByID];
    sub_10000AD40(0, &qword_100023100);
    uint64_t v20 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    if (*(void *)(v20 + 16))
    {
      unint64_t v21 = sub_1000111E4(v7, v9);
      if (v22)
      {
        id v46 = *(id *)(*(void *)(v20 + 56) + 8 * v21);
        id v23 = v46;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v24 = v46;
        if (!v15) {
          goto LABEL_20;
        }
        goto LABEL_17;
      }
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  id v24 = 0;
  id v46 = 0;
  if (!v15)
  {
LABEL_20:
    id v25 = sub_1000135FC();
    sub_10000FB88();

    goto LABEL_43;
  }
LABEL_17:
  if (!v24) {
    goto LABEL_20;
  }
  id v25 = v15;
  id v26 = [v25 validateUpdate:a2];
  if (!v26)
  {
    [*(id *)(v3 + v17) applyControlUpdate:a2];
    char v28 = *(void **)(v3 + v17);
    if (v28)
    {
      id v29 = v28;
      if (([v29 quietUIActive] & 1) == 0
        && !*(void *)(v3 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer))
      {
        sub_10000F0E0();
      }
    }
    self;
    uint64_t v30 = swift_dynamicCastObjCClass();
    if (!v30
      || (id v31 = (void *)v30,
          id v25 = v25,
          LOBYTE(v31) = sub_10000C960((uint64_t)[v31 sliderType], (uint64_t)&off_10001CE98),
          v25,
          (v31 & 1) == 0)
      || (id v32 = [a1 controls]) == 0)
    {

      goto LABEL_43;
    }
    uint64_t v33 = v32;
    sub_10000AD40(0, &qword_100023100);
    unint64_t v34 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    id v25 = v25;
    unint64_t v35 = (unint64_t)sub_100012AC8(v34);
    swift_bridgeObjectRelease();

    if (v35 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v36 = _CocoaArrayWrapper.endIndex.getter();
      if (!v36) {
        goto LABEL_48;
      }
    }
    else
    {
      uint64_t v36 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v36) {
        goto LABEL_48;
      }
    }
    if (v36 < 1)
    {
      __break(1u);
      goto LABEL_59;
    }
    uint64_t v37 = 0;
    unint64_t v45 = v35 & 0xC000000000000001;
    do
    {
      if (v45) {
        id v38 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v38 = *(id *)(v35 + 8 * v37 + 32);
      }
      unint64_t v39 = v38;
      self;
      if (swift_dynamicCastObjCClass())
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        if (*(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
        }
        specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized Array._endMutation()();
      }
      else
      {
      }
      ++v37;
    }
    while (v36 != v37);
LABEL_48:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((unint64_t)_swiftEmptyArrayStorage >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v40 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v40)
      {
LABEL_50:
        if (v40 >= 1)
        {
          uint64_t v41 = 0;
          do
          {
            if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0) {
              id v42 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v42 = (id)_swiftEmptyArrayStorage[v41 + 4];
            }
            uint64_t v43 = v42;
            ++v41;
            [a2 floatValue:v45];
            id v44 = [v43 updateWithFloatValue:];
            [a1 applyControlUpdate:v44];
          }
          while (v40 != v41);
          goto LABEL_57;
        }
LABEL_59:
        __break(1u);
        return;
      }
    }
    else
    {
      uint64_t v40 = *(void *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v40) {
        goto LABEL_50;
      }
    }
LABEL_57:

    swift_bridgeObjectRelease();
    goto LABEL_43;
  }
  id v27 = v26;
  sub_10000FB88();

  id v25 = v27;
LABEL_43:
}

void sub_10000FB88()
{
  if (qword_100022FD0 != -1) {
    swift_once();
  }
  uint64_t v0 = type metadata accessor for Logger();
  sub_10000B01C(v0, (uint64_t)qword_100023660);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    BOOL v4 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v3 = 138543362;
    swift_errorRetain();
    uint64_t v8 = _swift_stdlib_bridgeErrorToNSError();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v4 = v8;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "SceneDelegate: Invalid control update from overlay: %{public}@", v3, 0xCu);
    sub_10000AB00(&qword_100023468);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  id v5 = [self capabilities];
  if (!v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  id v6 = v5;
  unsigned int v7 = [v5 isInternalInstall];

  if (v7)
  {
LABEL_10:
    sub_10000AB00(&qword_100023460);
    _print_unlocked<A, B>(_:_:)();
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
}

void sub_10000FF3C(void *a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (char *)Strong;
    BOOL v4 = *(void **)(Strong + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
    if (v4
      && (uint64_t v5 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer,
          (id v6 = *(void **)(Strong + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer)) != 0))
    {
      sub_10000AD40(0, (unint64_t *)&qword_100023470);
      id v7 = v4;
      id v8 = a1;
      id v9 = v6;
      char v10 = static NSObject.== infix(_:_:)();

      if (v10)
      {
        [v7 setQuietUIActive:0];
        uint64_t v11 = *(void **)&v3[v5];
        *(void *)&v3[v5] = 0;

        id v7 = v11;
      }
      else
      {
      }
    }
    else
    {
      id v7 = (id)Strong;
    }
  }
}

void sub_100010140(uint64_t a1, int a2)
{
  os_log_type_t v2 = *(void **)(a1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v2)
  {
    BOOL v4 = *(void **)(a1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController);
    if (v4)
    {
      id v6 = v2;
      id v15 = v4;
      id v7 = [v15 overlayView];
      unsigned int v8 = [v7 isSliderVisible];

      if (v8)
      {
        id v9 = [v6 auditToken];
        unsigned int v10 = [v9 pid];

        if (v10 == a2)
        {
          [v15 dismissOverlayForced:0];
          uint64_t v11 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer;
          [*(id *)(a1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer) invalidate];
          uint64_t v12 = *(void **)(a1 + v11);
          *(void *)(a1 + v11) = 0;

          uint64_t v13 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer;
          [*(id *)(a1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer) invalidate];
          char v14 = *(void **)(a1 + v13);
          *(void *)(a1 + v13) = 0;

          [v6 setQuietUIActive:0];
        }
      }
    }
  }
}

uint64_t sub_1000102B0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_100010348()
{
  *(void *)&v0[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController] = 0;
  uint64_t v1 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientMonitor;
  id v2 = objc_allocWithZone((Class)CAMOverlayClientMonitor);
  uint64_t v3 = v0;
  *(void *)&v0[v1] = [v2 init];
  *(void *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_sceneTeardownTimer] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection] = 0;
  uint64_t v4 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl;
  *(void *)&v3[v4] = sub_10000AB44();
  *(void *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_defaultSliderType] = 5;
  v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_isFocusLockContactRecognizerInstalled] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate____lazy_storage___focusLockContactRecognizer] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer] = 0;
  *(void *)&v3[OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer] = 0;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for OverlaySceneDelegate();
  return [super init];
}

id sub_100010484(uint64_t a1)
{
  return sub_10001049C(a1, type metadata accessor for OverlaySceneDelegate);
}

id sub_10001049C(uint64_t a1, uint64_t (*a2)(void))
{
  v4.receiver = v2;
  v4.super_class = (Class)a2();
  [super dealloc];
}

uint64_t type metadata accessor for OverlaySceneDelegate()
{
  return self;
}

void sub_100010764(void *a1, const char *a2, char a3, const char *a4)
{
  if (a1)
  {
    uint64_t v8 = v4;
    [a1 clientAuditToken];
    long long v23 = v26;
    long long v24 = v25;
    id v9 = objc_allocWithZone((Class)BSAuditToken);
    long long v25 = v24;
    long long v26 = v23;
    id v10 = [v9 initWithAuditToken:&v25];
    uint64_t v11 = *(void **)(v8 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken);
    if (v11)
    {
      uint64_t v12 = v11;
      if ([v12 hasSameProcessAsAuditToken:v10])
      {
        if (qword_100022FD0 != -1) {
          swift_once();
        }
        uint64_t v13 = type metadata accessor for Logger();
        sub_10000B01C(v13, (uint64_t)qword_100023660);
        char v14 = v10;
        id v15 = Logger.logObject.getter();
        os_log_type_t v16 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v15, v16))
        {
          uint64_t v17 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v17 = 67240192;
          LODWORD(v25) = [v14 pid];
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          _os_log_impl((void *)&_mh_execute_header, v15, v16, a2, v17, 8u);
          swift_slowDealloc();
        }
        else
        {

          id v15 = v14;
        }

        unint64_t v21 = *(void **)(v8 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController);
        if (v21)
        {
          id v22 = v21;
          [v22 updateUIForCapturingMovieRecording:a3 & 1];
        }
LABEL_17:

        return;
      }
    }
    if (qword_100022FD0 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_10000B01C(v18, (uint64_t)qword_100023660);
    uint64_t v12 = v10;
    char v14 = Logger.logObject.getter();
    os_log_type_t v19 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v14, v19))
    {
      uint64_t v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 67240192;
      LODWORD(v25) = [v12 pid];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v14, v19, a4, v20, 8u);
      swift_slowDealloc();
    }
    else
    {

      char v14 = v12;
    }
    goto LABEL_17;
  }
  __break(1u);
}

uint64_t sub_100010B04(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100010BD8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001388C((uint64_t)v12, *a3);
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
      sub_10001388C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10001383C((uint64_t)v12);
  return v7;
}

uint64_t sub_100010BD8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_100010D94(a5, a6);
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

uint64_t sub_100010D94(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100010E2C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10001100C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10001100C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100010E2C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100010FA4(v2, 0);
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

void *sub_100010FA4(uint64_t a1, uint64_t a2)
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
  sub_10000AB00(&qword_1000234C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10001100C(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000AB00(&qword_1000234C8);
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

unint64_t sub_10001115C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = NSObject._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10001125C(a1, v4);
}

unint64_t sub_1000111A0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100011378(a1, v4);
}

unint64_t sub_1000111E4(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100011440(a1, a2, v4);
}

unint64_t sub_10001125C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    sub_10000AD40(0, (unint64_t *)&qword_100023138);
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

unint64_t sub_100011378(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100013A50(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100013AAC((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_100011440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * v6);
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

uint64_t sub_100011524(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100011564(a1, a2, a3, (void *)*v3);
  uint64_t *v3 = result;
  return result;
}

uint64_t sub_100011544(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000116F0(a1, a2, a3, *v3);
  uint64_t *v3 = (char *)result;
  return result;
}

uint64_t sub_100011564(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_10000AB00((uint64_t *)&unk_100023510);
    char v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    char v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    sub_10000AB00((uint64_t *)&unk_100023150);
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

uint64_t sub_1000116F0(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000AB00(&qword_1000234D0);
    char v10 = (char *)swift_allocObject();
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
    char v10 = (char *)_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
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

int64_t sub_10001185C(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

void sub_100011940(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      __CocoaSet.element(at:)();
      sub_10000AD40(0, &qword_1000234A0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_24;
  }
  if (a3) {
    goto LABEL_10;
  }
  if (a1 < 0 || 1 << *(unsigned char *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_21;
  }
  if (((*(void *)(a4 + 8 * ((unint64_t)a1 >> 6) + 56) >> a1) & 1) == 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (*(_DWORD *)(a4 + 36) == a2) {
    goto LABEL_17;
  }
  __break(1u);
LABEL_10:
  if (__CocoaSet.Index.age.getter() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  __CocoaSet.Index.element.getter();
  sub_10000AD40(0, &qword_1000234A0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  unint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = NSObject._rawHashValue(seed:)(*(void *)(a4 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(a4 + 32);
  unint64_t v6 = v7 & ~v8;
  if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
  {
LABEL_23:

    __break(1u);
LABEL_24:
    __break(1u);
    return;
  }
  id v9 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
  char v10 = static NSObject.== infix(_:_:)();

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = ~v8;
    do
    {
      unint64_t v6 = (v6 + 1) & v11;
      if (((*(void *)(a4 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
        goto LABEL_23;
      }
      id v12 = *(id *)(*(void *)(a4 + 48) + 8 * v6);
      char v13 = static NSObject.== infix(_:_:)();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  unint64_t v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_100011BB8(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2) {
    unint64_t v7 = 2;
  }
  unint64_t v8 = v7 - 2;
  id v9 = (unint64_t *)(a1 + 72);
  uint64_t v2 = 64;
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

void *sub_100011C40(unint64_t a1, void *a2)
{
  if (a1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      uint64_t v5 = a1 & 0xFFFFFFFFFFFFFF8;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_9:
        unint64_t v7 = v6;
        unint64_t v8 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_15;
        }
        id v9 = [v6 controlType];
        if (v9 == [a2 controlType])
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          uint64_t v5 = a1 & 0xFFFFFFFFFFFFFF8;
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {
        }
        ++v4;
        if (v8 == v3) {
          return _swiftEmptyArrayStorage;
        }
      }
      if (v4 < *(void *)(v5 + 16)) {
        break;
      }
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
      if (!v3) {
        return _swiftEmptyArrayStorage;
      }
    }
    id v6 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return _swiftEmptyArrayStorage;
}

void *sub_100011DAC(unint64_t a1, void *a2, SEL *a3)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v6 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v7 = 4;
    while (1)
    {
      id v8 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v7);
      id v9 = v8;
      uint64_t v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      id v11 = [v8 *a3];
      if (v11 == [a2 *a3] && objc_msgSend(v9, *a3))
      {
        swift_bridgeObjectRelease();
        return v9;
      }

      ++v7;
      if (v10 == v6) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_15:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_100011EF4(unint64_t a1, void *a2)
{
  if (a1 >> 62)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
    if (v3) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v5 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          id v6 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
          uint64_t v7 = i - 3;
          if (__OFADD__(v5, 1)) {
            goto LABEL_18;
          }
        }
        else
        {
          id v6 = *(id *)(a1 + 8 * i);
          uint64_t v7 = i - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_18:
            __break(1u);
            goto LABEL_19;
          }
        }
        uint64_t v20 = v6;
        id v8 = [v6 title];
        uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v11 = v10;

        id v12 = [a2 title];
        uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v15 = v14;

        if (v9 == v13 && v11 == v15)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_17:
          uint64_t v3 = (uint64_t)v20;
          swift_bridgeObjectRelease();
          return v3;
        }
        char v17 = _stringCompareWithSmolCheck(_:_:expecting:)();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v17) {
          goto LABEL_17;
        }

        if (v7 == v3)
        {
          swift_bridgeObjectRelease();
          return 0;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return v3;
}

void *sub_1000120B8(unint64_t a1, uint64_t a2)
{
  if (a1 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = _CocoaArrayWrapper.endIndex.getter())
  {
    uint64_t v5 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_defaultSliderType;
    uint64_t v6 = 4;
    while (1)
    {
      id v7 = (a1 & 0xC000000000000001) != 0
         ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)()
         : *(id *)(a1 + 8 * v6);
      id v8 = v7;
      uint64_t v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1)) {
        break;
      }
      self;
      uint64_t v10 = (void *)swift_dynamicCastObjCClass();
      if (v10 && [v10 sliderType] == *(id *)(a2 + v5))
      {
        swift_bridgeObjectRelease();
        return v8;
      }

      ++v6;
      if (v9 == v4) {
        goto LABEL_15;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_15:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_100012204(char **a1)
{
  uint64_t v2 = v1;
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (!v4) {
    goto LABEL_21;
  }
  uint64_t v5 = v4;
  uint64_t v6 = qword_100022FD0;
  id v7 = a1;
  if (v6 != -1) {
    swift_once();
  }
  uint64_t v8 = type metadata accessor for Logger();
  sub_10000B01C(v8, (uint64_t)qword_100023660);
  uint64_t v9 = v7;
  uint64_t v10 = Logger.logObject.getter();
  os_log_type_t v11 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    unint64_t v47 = (void *)swift_slowAlloc();
    *(_DWORD *)id v12 = 138543362;
    uint64_t v13 = v9;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *unint64_t v47 = v5;

    _os_log_impl((void *)&_mh_execute_header, v10, v11, "SceneDelegate: Connecting new scene %{public}@", v12, 0xCu);
    sub_10000AB00(&qword_100023468);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  id v14 = [objc_allocWithZone((Class)CAMSystemOverlayViewController) init];
  [v14 setDelegate:v2];
  uint64_t v15 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController);
  *(void *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController) = v14;
  id v16 = v14;

  if (qword_100022FC0 != -1) {
    swift_once();
  }
  char v17 = (void *)qword_100023650;
  if (!qword_100023650) {
    goto LABEL_16;
  }
  NSString v18 = String._bridgeToObjectiveC()();
  unsigned int v19 = [v17 BOOLForKey:v18];

  if (!v19) {
    goto LABEL_16;
  }
  id v20 = [objc_allocWithZone((Class)CAMOverlayDebugViewController) init];
  [v16 addChildViewController:v20];
  a1 = &selRef_dictionaryWithObjects_forKeys_count_;
  id v21 = [v16 view];
  if (!v21)
  {
    __break(1u);
    goto LABEL_18;
  }
  id v22 = v21;
  id v23 = [v20 view];
  if (!v23)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  long long v24 = v23;
  [v22 addSubview:v23];

  id v25 = [v20 view];
  if (v25)
  {
    long long v26 = v25;
    id v27 = [v16 view];
    if (v27)
    {
      char v28 = v27;
      [v27 bounds];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;

      [v26 setFrame:v30, v32, v34, v36];
      [v20 didMoveToParentViewController:v16];

LABEL_16:
      id v37 = [objc_allocWithZone((Class)type metadata accessor for OverlayWindow()) initWithWindowScene:v5];
      [v37 setRootViewController:v16];
      id v38 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window);
      *(void *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_window) = v37;
      id v39 = v37;

      [v39 makeKeyAndVisible];
      id v40 = [self sharedInstance];
      [v40 addObserver:v2];

      [*(id *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientMonitor) beginMonitoringScene:v5 delegate:v2];
      sub_10000DB88();
      sub_10000D0E4();
      id v41 = [self sharedInstance];
      [v41 addObserver:v2];

      return;
    }
    goto LABEL_20;
  }
LABEL_19:
  __break(1u);
LABEL_20:
  __break(1u);
LABEL_21:
  _StringGuts.grow(_:)(43);
  swift_bridgeObjectRelease();
  id v42 = [a1 description];
  uint64_t v43 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v45 = v44;

  v46._countAndFlagsBits = v43;
  v46._object = v45;
  String.append(_:)(v46);
  swift_bridgeObjectRelease();
  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_100012798(void *a1)
{
  uint64_t v2 = v1;
  if (a1)
  {
    uint64_t v4 = qword_100022FD0;
    id v5 = a1;
    if (v4 != -1) {
      swift_once();
    }
    uint64_t v6 = type metadata accessor for Logger();
    sub_10000B01C(v6, (uint64_t)qword_100023660);
    id v7 = v5;
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v10 = 67240192;
      [v7 pid];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v8, v9, "SceneDelegate: Client monitor PID: %{public}d", v10, 8u);
      swift_slowDealloc();
    }
    else
    {
    }
    id v17 = [objc_allocWithZone((Class)FigCameraViewfinder) init];
    NSString v18 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder);
    *(void *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder) = v17;
    id v19 = v17;

    sub_10000AD40(0, &qword_1000234D8);
    id v20 = (void *)static OS_dispatch_queue.main.getter();
    [v19 setDelegate:v2 queue:v20];

    sub_10000CAD8((uint64_t)_swiftEmptyArrayStorage);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v19 startWithOptions:isa];
  }
  else
  {
    if (qword_100022FD0 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_10000B01C(v11, (uint64_t)qword_100023660);
    id v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "SceneDelegate: Client monitor reported no button client", v14, 2u);
      swift_slowDealloc();
    }

    uint64_t v15 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder;
    [*(id *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_figCameraViewfinder) stop];
    id v16 = *(void **)(v2 + v15);
    *(void *)(v2 + v15) = 0;

    id v7 = 0;
  }
  id v22 = *(void **)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken);
  *(void *)(v2 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken) = a1;
  id v23 = v7;

  sub_10000DB88();
  sub_10000D0E4();
}

void *sub_100012AC8(unint64_t a1)
{
  uint64_t v1 = a1;
  id v16 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_25;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      unint64_t v4 = v1 & 0xC000000000000001;
      uint64_t v5 = v1 & 0xFFFFFFFFFFFFFF8;
      uint64_t v6 = v1 + 32;
      while (1)
      {
        if (v4)
        {
          id v7 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
        }
        else
        {
          if (v3 >= *(void *)(v5 + 16)) {
            goto LABEL_23;
          }
          id v7 = *(id *)(v6 + 8 * v3);
        }
        uint64_t v1 = (uint64_t)v7;
        if (__OFADD__(v3++, 1)) {
          goto LABEL_24;
        }
        self;
        uint64_t v9 = swift_dynamicCastObjCClass();
        if (v9) {
          break;
        }

LABEL_5:
        if (v3 == v2) {
          return v16;
        }
      }
      uint64_t v10 = (void *)v9;
      id v11 = (id)v1;
      id v12 = [v10 sliderType];
      if (v12 == (id)5) {
        break;
      }
      uint64_t v13 = 5;
      while (1)
      {
        uint64_t v14 = v13 - 3;
        if (__OFADD__(v13 - 4, 1)) {
          break;
        }
        if (*(&off_10001CE60 + v13) == v12) {
          goto LABEL_12;
        }
        ++v13;
        if (v14 == 3)
        {

          goto LABEL_19;
        }
      }
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
      if (!v2) {
        return _swiftEmptyArrayStorage;
      }
    }
LABEL_12:

    uint64_t v1 = sub_10000AD40(0, &qword_100023100);
    if (static NSObject.== infix(_:_:)())
    {
LABEL_19:
    }
    else
    {
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      uint64_t v1 = (uint64_t)&v16;
      specialized ContiguousArray._endMutation()();
    }
    goto LABEL_5;
  }
  return _swiftEmptyArrayStorage;
}

void sub_100012CC8()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v1)
  {
    id v2 = v1;
    if (([v2 quietUIActive] & 1) == 0
      && !*(void *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer))
    {
      sub_10000F0E0();
    }
  }
}

void sub_100012D40(void *a1)
{
  uint64_t v2 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl;
  unint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl);
  *(void *)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_lastUsedControl) = a1;
  id v4 = a1;

  uint64_t v5 = *(void **)(v1 + v2);
  id v6 = v5;
  sub_10000ADD4(v5);
  id v7 = *(void **)(v1 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v7)
  {
    id v8 = v7;
    id v9 = [v4 identifier];
    if (!v9)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();
      NSString v10 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      id v9 = v10;
    }
    id v11 = v9;
    [v8 sendActiveControlIdentifier:];
  }
}

void sub_100012E2C()
{
  uint64_t v1 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer;
  [*(id *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUITimer) invalidate];
  uint64_t v2 = *(void **)(v0 + v1);
  *(void *)(v0 + v1) = 0;

  unint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_connection);
  if (v3)
  {
    id v13 = v3;
    if ([v13 quietUIActive])
    {
      uint64_t v4 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_1000139D0;
      aBlock[5] = v4;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_10000C9C4;
      aBlock[3] = &unk_10001D080;
      uint64_t v5 = _Block_copy(aBlock);
      id v6 = self;
      swift_retain();
      id v7 = [v6 timerWithTimeInterval:0 repeats:v5 block:1.0];
      _Block_release(v5);
      swift_release();
      swift_release();
      uint64_t v8 = OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer;
      id v9 = *(void **)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer);
      *(void *)(v0 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_quietUIEndTimer) = v7;

      id v10 = [self currentRunLoop];
      uint64_t v11 = *(void *)(v0 + v8);
      if (v11)
      {
        id v12 = v10;
        [v10 addTimer:v11 forMode:NSRunLoopCommonModes];
      }
      else
      {
        __break(1u);
      }
    }
    else
    {
    }
  }
}

uint64_t sub_100013018(int a1)
{
  uint64_t v3 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  id v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v16 - 8);
  __chkstk_darwin();
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000AD40(0, &qword_1000234D8);
  id v10 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v1;
  *(_DWORD *)(v11 + 24) = a1;
  aBlock[4] = sub_100013928;
  aBlock[5] = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000102B0;
  aBlock[3] = &unk_10001D058;
  id v12 = _Block_copy(aBlock);
  id v13 = v1;
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_100013934();
  sub_10000AB00(&qword_1000234E8);
  sub_10001398C(&qword_1000234F0, &qword_1000234E8);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v16);
}

void sub_1000132D0(void *a1, const char *a2, const char *a3)
{
  if (a1)
  {
    uint64_t v6 = v3;
    [a1 clientAuditToken];
    long long v21 = v24;
    long long v22 = v23;
    id v7 = objc_allocWithZone((Class)BSAuditToken);
    long long v23 = v22;
    long long v24 = v21;
    id v8 = [v7 initWithAuditToken:&v23];
    id v9 = *(void **)(v6 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_clientAuditToken);
    if (v9)
    {
      id v10 = v9;
      if ([v10 hasSameProcessAsAuditToken:v8])
      {
        if (qword_100022FD0 != -1) {
          swift_once();
        }
        uint64_t v11 = type metadata accessor for Logger();
        sub_10000B01C(v11, (uint64_t)qword_100023660);
        id v12 = v8;
        id v13 = Logger.logObject.getter();
        os_log_type_t v14 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v13, v14))
        {
          uint64_t v15 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)uint64_t v15 = 67240192;
          LODWORD(v23) = [v12 pid];
          UnsafeMutableRawBufferPointer.copyMemory(from:)();

          _os_log_impl((void *)&_mh_execute_header, v13, v14, a2, v15, 8u);
          swift_slowDealloc();
        }
        else
        {

          id v13 = v12;
        }

        id v19 = *(void **)(v6 + OBJC_IVAR____TtC18CameraOverlayAngel20OverlaySceneDelegate_overlayController);
        if (v19)
        {
          id v20 = [v19 overlayView];
          [v20 setSliderFeedbackDisabled:0];
        }
LABEL_17:

        return;
      }
    }
    if (qword_100022FD0 != -1) {
      swift_once();
    }
    uint64_t v16 = type metadata accessor for Logger();
    sub_10000B01C(v16, (uint64_t)qword_100023660);
    id v10 = v8;
    id v12 = Logger.logObject.getter();
    os_log_type_t v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v17))
    {
      NSString v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)NSString v18 = 67240192;
      LODWORD(v23) = [v10 pid];
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      _os_log_impl((void *)&_mh_execute_header, v12, v17, a3, v18, 8u);
      swift_slowDealloc();
    }
    else
    {

      id v12 = v10;
    }
    goto LABEL_17;
  }
  __break(1u);
}

id sub_1000135FC()
{
  uint64_t v0 = CAMOverlayErrorDomain;
  NSErrorUserInfoKey v6 = NSDebugDescriptionErrorKey;
  uint64_t v1 = @"InvalidIdentifier";
  uint64_t v2 = @"InvalidIdentifier";
  CFStringRef v7 = @"InvalidIdentifier";
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  uint64_t v4 = +[NSError errorWithDomain:v0 code:-100 userInfo:v3];

  return v4;
}

uint64_t sub_1000136E8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100013720(void *a1)
{
}

uint64_t sub_100013728(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100013738()
{
  return swift_release();
}

void sub_100013740()
{
  sub_10000E41C(v0, 1);
}

void sub_100013760()
{
  sub_10000E41C(v0, 0);
}

unint64_t sub_100013780()
{
  unint64_t result = qword_1000234A8;
  if (!qword_1000234A8)
  {
    sub_10000AD40(255, &qword_1000234A0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000234A8);
  }
  return result;
}

uint64_t sub_1000137E8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000137F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001383C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10001388C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1000138E8(void *a1)
{
}

uint64_t sub_1000138F0()
{
  return _swift_deallocObject(v0, 28, 7);
}

void sub_100013928()
{
  sub_100010140(*(void *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

unint64_t sub_100013934()
{
  unint64_t result = qword_1000234E0;
  if (!qword_1000234E0)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000234E0);
  }
  return result;
}

uint64_t sub_10001398C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000137F4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000139D0(void *a1)
{
}

uint64_t sub_1000139D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000AB00((uint64_t *)&unk_100023500);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100013A40(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100013A50(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100013AAC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100013B24()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_100013B98(v0, qword_100023660);
  sub_10000B01C(v0, (uint64_t)qword_100023660);
  return Logger.init(subsystem:category:)();
}

uint64_t *sub_100013B98(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void sub_100013BFC(void *a1)
{
  uint64_t v1 = [a1 _loggingHeader];
  sub_100009E9C();
  sub_100009EB4((void *)&_mh_execute_header, v2, v3, "%{public}@: Attempted to send invalid active control ID %{public}@", v4, v5, v6, v7, v8);
}

void sub_100013C8C(id *a1)
{
  uint64_t v1 = [*a1 _loggingHeader];
  sub_100009E9C();
  sub_100009EB4((void *)&_mh_execute_header, v2, v3, "%{public}@: %{public}@", v4, v5, v6, v7, v8);
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

NSNumber __swiftcall CGFloat._bridgeToObjectiveC()()
{
  return (NSNumber)CGFloat._bridgeToObjectiveC()();
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

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Array._conditionallyBridgeFromObjectiveC(_:result:)();
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

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.Index._asCocoa.modify()
{
  return Set.Index._asCocoa.modify();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

NSNumber __swiftcall NSNumber.init(floatLiteral:)(Swift::Double floatLiteral)
{
  return (NSNumber)NSNumber.init(floatLiteral:)(floatLiteral);
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

Swift::Int __swiftcall NSObject._rawHashValue(seed:)(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
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

uint64_t __CocoaSet.startIndex.getter()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t __CocoaSet.Index.handleBitPattern.getter()
{
  return __CocoaSet.Index.handleBitPattern.getter();
}

uint64_t __CocoaSet.Index.age.getter()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t __CocoaSet.Index.element.getter()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.element(at:)()
{
  return __CocoaSet.element(at:)();
}

uint64_t __CocoaSet.formIndex(after:isUnique:)()
{
  return __CocoaSet.formIndex(after:isUnique:)();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
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

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t __CocoaDictionary.makeIterator()()
{
  return __CocoaDictionary.makeIterator()();
}

uint64_t __CocoaDictionary.count.getter()
{
  return __CocoaDictionary.count.getter();
}

uint64_t __CocoaDictionary.Iterator.next()()
{
  return __CocoaDictionary.Iterator.next()();
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

uint64_t static _DictionaryStorage.convert(_:capacity:)()
{
  return static _DictionaryStorage.convert(_:capacity:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return _[a1 _FBSScene];
}

id objc_msgSend__clientProxy(void *a1, const char *a2, ...)
{
  return _[a1 _clientProxy];
}

id objc_msgSend__connection(void *a1, const char *a2, ...)
{
  return _[a1 _connection];
}

id objc_msgSend__connectionQueue(void *a1, const char *a2, ...)
{
  return _[a1 _connectionQueue];
}

id objc_msgSend__connectionsByProcessID(void *a1, const char *a2, ...)
{
  return _[a1 _connectionsByProcessID];
}

id objc_msgSend__debugID(void *a1, const char *a2, ...)
{
  return _[a1 _debugID];
}

id objc_msgSend__enumerateObserversWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateObserversWithBlock:");
}

id objc_msgSend__handleConnectionDidActivate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConnectionDidActivate:");
}

id objc_msgSend__handleConnectionDidInterrupt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConnectionDidInterrupt:");
}

id objc_msgSend__handleConnectionDidInvalidate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleConnectionDidInvalidate:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__listener(void *a1, const char *a2, ...)
{
  return _[a1 _listener];
}

id objc_msgSend__loggingHeader(void *a1, const char *a2, ...)
{
  return _[a1 _loggingHeader];
}

id objc_msgSend__registeredObservers(void *a1, const char *a2, ...)
{
  return _[a1 _registeredObservers];
}

id objc_msgSend__setClientProxy_(void *a1, const char *a2, ...)
{
  return [_a1 _setClientProxy:];
}

id objc_msgSend__setControls_(void *a1, const char *a2, ...)
{
  return [a1 _setControls:];
}

id objc_msgSend__setControlsByID_(void *a1, const char *a2, ...)
{
  return [a1 _setControlsByID:];
}

id objc_msgSend__setStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setStatus:");
}

id objc_msgSend__setUpdatesByID_(void *a1, const char *a2, ...)
{
  return [a1 _setUpdatesByID];
}

id objc_msgSend__updatesByID(void *a1, const char *a2, ...)
{
  return _[a1 _updatesByID];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_adoptConnection_(void *a1, const char *a2, ...)
{
  return [a1 adoptConnection];
}

id objc_msgSend_allConnections(void *a1, const char *a2, ...)
{
  return _[a1 allConnections];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_bs_array(void *a1, const char *a2, ...)
{
  return [a1 bs_array];
}

id objc_msgSend_bs_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 bs_firstObjectPassingTest:];
}

id objc_msgSend_cameraOverlaySceneClientMonitor(void *a1, const char *a2, ...)
{
  return _[a1 cameraOverlaySceneClientMonitor];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_clientMonitor_didUpdateWithAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientMonitor:didUpdateWithAuditToken:");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:alpha:];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_configureConnection_(void *a1, const char *a2, ...)
{
  return [a1 configureConnection:];
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _[a1 connectedScenes];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:multiplier:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_controlIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 controlIdentifier];
}

id objc_msgSend_controlType(void *a1, const char *a2, ...)
{
  return _[a1 controlType];
}

id objc_msgSend_controlsByID(void *a1, const char *a2, ...)
{
  return _[a1 controlsByID];
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

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_decodeStringForKey_(void *a1, const char *a2, ...)
{
  return [a1 decodeStringForKey:];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithCapacity:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didChangeInterfaceReduced_(void *a1, const char *a2, ...)
{
  return [a1 didChangeInterfaceReduced:];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_hashTableWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 hashTableWithOptions:];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identifierKey(void *a1, const char *a2, ...)
{
  return _[a1 identifierKey];
}

id objc_msgSend_initWithBoardServiceConnection_queue_(void *a1, const char *a2, ...)
{
  return [a1 initWithBoardServiceConnection:queue:];
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:sessionRole:];
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 initWithObjects:];
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return _[a1 interface];
}

id objc_msgSend_interpretControl_(void *a1, const char *a2, ...)
{
  return [a1 interpretControl:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isValueUpdate(void *a1, const char *a2, ...)
{
  return _[a1 isValueUpdate];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_listenerWithConfigurator_(void *a1, const char *a2, ...)
{
  return [a1 listenerWithConfigurator:];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return [a1 numberWithLongLong:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_overlayRequestingProcessAuditToken(void *a1, const char *a2, ...)
{
  return _[a1 overlayRequestingProcessAuditToken];
}

id objc_msgSend_panning(void *a1, const char *a2, ...)
{
  return _[a1 panning];
}

id objc_msgSend_pid(void *a1, const char *a2, ...)
{
  return _[a1 pid];
}

id objc_msgSend_remoteTarget(void *a1, const char *a2, ...)
{
  return _[a1 remoteTarget];
}

id objc_msgSend_remoteToken(void *a1, const char *a2, ...)
{
  return _[a1 remoteToken];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestSceneSessionDestruction:options:errorHandler:];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_serverActivatedConnection_(void *a1, const char *a2, ...)
{
  return [a1 serverActivatedConnection];
}

id objc_msgSend_serverDidChangeActiveControlIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 serverDidChangeActiveControlIdentifier:];
}

id objc_msgSend_serverDidChangeFocusLocked_(void *a1, const char *a2, ...)
{
  return [a1 serverDidChangeFocusLocked:];
}

id objc_msgSend_serverDidChangeOverlayVisible_activeControlIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 serverDidChangeOverlayVisible:activeControlIdentifier:];
}

id objc_msgSend_serverDidUpdateControl_(void *a1, const char *a2, ...)
{
  return [a1 serverDidUpdateControl:];
}

id objc_msgSend_serverLostConnectionFromProcessID_(void *a1, const char *a2, ...)
{
  return [a1 serverLostConnectionFromProcessID:];
}

id objc_msgSend_serviceQuality(void *a1, const char *a2, ...)
{
  return _[a1 serviceQuality];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActivationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setActivationHandler:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return [a1 setConnection:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDomain_(void *a1, const char *a2, ...)
{
  return [a1 setDomain:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
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

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return [a1 setLabel:];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setNumberOfTouchesRequired_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfTouchesRequired:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setPanning_(void *a1, const char *a2, ...)
{
  return [a1 setPanning:];
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return [a1 setService:];
}

id objc_msgSend_setServiceQuality_(void *a1, const char *a2, ...)
{
  return [a1 setServiceQuality:];
}

id objc_msgSend_setTargetQueue_(void *a1, const char *a2, ...)
{
  return [a1 setTargetQueue:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setTextAlignment:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setTranslation_inView_(void *a1, const char *a2, ...)
{
  return [a1 setTranslation:inView:];
}

id objc_msgSend_setUnderlyingMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setUnderlyingMonitor:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setVisible_(void *a1, const char *a2, ...)
{
  return [a1 setVisible:];
}

id objc_msgSend_set_connection_(void *a1, const char *a2, ...)
{
  return [a1 set_connection:];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_underlyingMonitor(void *a1, const char *a2, ...)
{
  return _[a1 underlyingMonitor];
}

id objc_msgSend_updateLabel(void *a1, const char *a2, ...)
{
  return _[a1 updateLabel];
}

id objc_msgSend_updatesByID(void *a1, const char *a2, ...)
{
  return _[a1 updatesByID];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_validateUpdate_(void *a1, const char *a2, ...)
{
  return [a1 validateUpdate:];
}

id objc_msgSend_valueType(void *a1, const char *a2, ...)
{
  return _[a1 valueType];
}

id objc_msgSend_versionedPID(void *a1, const char *a2, ...)
{
  return _[a1 versionedPID];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_visible(void *a1, const char *a2, ...)
{
  return _[a1 visible];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}