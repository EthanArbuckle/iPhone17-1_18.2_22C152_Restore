void AXMCEnableControlCenterModule()
{
  void *v0;
  unsigned __int8 v1;
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  Class (*v11)(uint64_t);
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v0 = +[NSUserDefaults standardUserDefaults];
  v1 = [v0 BOOLForKey:@"AXMotionCuesNewCCModuleEnabled"];

  if ((v1 & 1) == 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v2 = (void *)qword_30FD0;
    v17 = qword_30FD0;
    if (!qword_30FD0)
    {
      v9 = _NSConcreteStackBlock;
      v10 = 3221225472;
      v11 = sub_3EBC;
      v12 = &unk_28C08;
      v13 = &v14;
      sub_3EBC((uint64_t)&v9);
      v2 = (void *)v15[3];
    }
    v3 = v2;
    _Block_object_dispose(&v14, 8);
    v4 = [[v3 alloc] initWithIntent:0 moduleIdentifier:@"com.apple.accessibility.controlcenter.motioncues" containerBundleIdentifier:@"com.apple.AccessibilityUIServer" size:0];
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v5 = (void *)qword_30FE0;
    v17 = qword_30FE0;
    if (!qword_30FE0)
    {
      v9 = _NSConcreteStackBlock;
      v10 = 3221225472;
      v11 = sub_4084;
      v12 = &unk_28C08;
      v13 = &v14;
      sub_4084((uint64_t)&v9);
      v5 = (void *)v15[3];
    }
    v6 = v5;
    _Block_object_dispose(&v14, 8);
    v7 = [v6 sharedInstance];
    [v7 handleIconElementRequest:v4 completionHandler:&stru_28BE0];

    v8 = +[NSUserDefaults standardUserDefaults];
    [v8 setBool:1 forKey:@"AXMotionCuesNewCCModuleEnabled"];
  }
}

void sub_3DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_3DF8(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  v4 = a3;
  v5 = AXLogHapticMusic();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412546;
    v7 = v4;
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Added Motion Cues: %@ success: %d", (uint8_t *)&v6, 0x12u);
  }
}

Class sub_3EBC(uint64_t a1)
{
  sub_3F14();
  Class result = objc_getClass("CCSIconElementRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1EA70();
  }
  qword_30FD0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_3F14()
{
  v1[0] = 0;
  if (!qword_30FD8)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_4010;
    v1[4] = &unk_28C40;
    v1[5] = v1;
    long long v2 = off_28C28;
    uint64_t v3 = 0;
    qword_30FD8 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_30FD8)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_4010()
{
  uint64_t result = _sl_dlopen();
  qword_30FD8 = result;
  return result;
}

Class sub_4084(uint64_t a1)
{
  sub_3F14();
  Class result = objc_getClass("CCSControlCenterService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_1EA98((uint64_t)result, v3, v4, v5, v6, v7, v8, v9, v10);
  }
  qword_30FE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_40F4()
{
  v1 = v0;
  uint64_t v2 = sub_55DC(&qword_30300);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (uint64_t)v1 + OBJC_IVAR____TtC18AXMotionCuesServer22InVehicleEventListener__continuation;
  swift_beginAccess();
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v6, 1, v2))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
    sub_1ED60();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v7, v1);

  sub_627C(v6, &qword_2FDF8);
  return swift_deallocClassInstance();
}

uint64_t sub_428C@<X0>(uint64_t a1@<X8>)
{
  v24[1] = a1;
  uint64_t v2 = sub_1EB90();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[0] = sub_55DC((uint64_t *)&unk_2FE00);
  uint64_t v6 = *(void *)(v24[0] - 8);
  __chkstk_darwin(v24[0]);
  uint64_t v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_55DC(&qword_2FDF8);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t)v1 + OBJC_IVAR____TtC18AXMotionCuesServer22InVehicleEventListener__continuation;
  swift_beginAccess();
  sub_5620(v12, (uint64_t)v11);
  uint64_t v13 = sub_55DC(&qword_30300);
  LODWORD(v12) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48))(v11, 1, v13);
  sub_627C((uint64_t)v11, &qword_2FDF8);
  if (v12 == 1)
  {
    v14 = CFNotificationCenterGetDarwinNotifyCenter();
    v15 = (__CFString *)sub_1EC10();
    CFNotificationCenterAddObserver(v14, v1, (CFNotificationCallback)sub_46FC, v15, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    v16 = CFNotificationCenterGetDarwinNotifyCenter();
    v17 = (__CFString *)sub_1EC10();
    CFNotificationCenterAddObserver(v16, v1, (CFNotificationCallback)sub_46FC, v17, 0, CFNotificationSuspensionBehaviorDeliverImmediately);

    type metadata accessor for InVehicleEvent(0);
    (*(void (**)(char *, void, void))(v6 + 104))(v8, enum case for AsyncStream.Continuation.BufferingPolicy.unbounded<A>(_:), v24[0]);
    return sub_1ED90();
  }
  else
  {
    if (qword_2FC30 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_5690(v2, (uint64_t)MCLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v19, v2);
    v20 = sub_1EB70();
    os_log_type_t v21 = sub_1EE10();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_0, v20, v21, "Motion activity updates already started.", v22, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_56C8();
    swift_allocError();
    void *v23 = 0xD000000000000028;
    v23[1] = 0x8000000000020960;
    return swift_willThrow();
  }
}

void sub_46FC(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a1;
  id v9 = a3;
  id v10 = a5;
  sub_593C(a2, a3);
}

uint64_t sub_477C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_55DC(&qword_2FDF8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_55DC(&qword_30300);
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v6, a1, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  uint64_t v9 = a2 + OBJC_IVAR____TtC18AXMotionCuesServer22InVehicleEventListener__continuation;
  swift_beginAccess();
  sub_571C((uint64_t)v6, v9);
  swift_endAccess();
  swift_allocObject();
  swift_weakInit();
  return sub_1ED40();
}

void sub_48F4()
{
  swift_beginAccess();
  uint64_t Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = (const void *)Strong;
    uint64_t v2 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(v2, v1);
    swift_release();
  }
}

uint64_t sub_4964()
{
  uint64_t v1 = sub_1EB90();
  uint64_t v23 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_55DC(&qword_2FDF8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v22 - v8;
  uint64_t v10 = sub_55DC(&qword_30300);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = v0 + OBJC_IVAR____TtC18AXMotionCuesServer22InVehicleEventListener__continuation;
  swift_beginAccess();
  sub_5620(v14, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_627C((uint64_t)v9, &qword_2FDF8);
    if (qword_2FC30 != -1) {
      swift_once();
    }
    uint64_t v15 = sub_5690(v1, (uint64_t)MCLog);
    swift_beginAccess();
    uint64_t v16 = v23;
    (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v3, v15, v1);
    v17 = sub_1EB70();
    os_log_type_t v18 = sub_1EE10();
    if (os_log_type_enabled(v17, v18))
    {
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_0, v17, v18, "Motion activity updates already stopped.", v19, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v16 + 8))(v3, v1);
    sub_56C8();
    swift_allocError();
    void *v20 = 0xD000000000000028;
    v20[1] = 0x8000000000020990;
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
    sub_1ED60();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v7, 1, 1, v10);
    swift_beginAccess();
    sub_571C((uint64_t)v7, v14);
    return swift_endAccess();
  }
}

uint64_t variable initialization expression of AXMotionCuesServer.$__lazy_storage_$__displayManager()
{
  return 0;
}

uint64_t variable initialization expression of AXMotionCuesServer._updating()
{
  return 0;
}

double variable initialization expression of AXMotionCuesServer._startTime()
{
  return 0.0;
}

id variable initialization expression of AXMotionCuesServer._motionManager()
{
  id v0 = objc_allocWithZone((Class)CMMotionManager);

  return [v0 init];
}

uint64_t variable initialization expression of AXMotionCuesServer.bannerIdentifier()
{
  return 0;
}

uint64_t variable initialization expression of AXMotionCuesRootViewController.rightEdge()
{
  return 0;
}

void *variable initialization expression of AXMotionCuesRootViewController.rows()
{
  return &_swiftEmptyArrayStorage;
}

id variable initialization expression of AXMotionCuesRootViewController.gridView()
{
  id v0 = objc_allocWithZone((Class)UIView);

  return [v0 init];
}

double variable initialization expression of AXMotionCuesRootViewController.statistics@<D0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0;
  *(void *)(a1 + 8) = 0;
  *(void *)(a1 + 24) = 0;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 16) = 0x7FEFFFFFFFFFFFFFLL;
  double result = 1.79769313e308;
  *(_OWORD *)(a1 + 40) = xmmword_1FE70;
  return result;
}

uint64_t sub_4E18()
{
  return type metadata accessor for InVehicleEventListener(0);
}

uint64_t type metadata accessor for InVehicleEventListener(uint64_t a1)
{
  return sub_54A0(a1, (uint64_t *)&unk_2FCB0);
}

void sub_4E40()
{
  sub_4ED0();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_4ED0()
{
  if (!qword_2FCC0[0])
  {
    sub_4F2C(&qword_30300);
    unint64_t v0 = sub_1EED0();
    if (!v1) {
      atomic_store(v0, qword_2FCC0);
    }
  }
}

uint64_t sub_4F2C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

__n128 initializeWithTake for AXMotionCuesError(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void type metadata accessor for SBUISystemApertureLayoutMode(uint64_t a1)
{
}

void *sub_4FAC(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v8 = *a2;
    *a1 = *a2;
    a1 = (void *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_1EB00();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *((unsigned char *)a1 + *(int *)(a3 + 20)) = *((unsigned char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_5078(uint64_t a1)
{
  uint64_t v2 = sub_1EB00();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t sub_50DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1EB00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_5158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1EB00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_51D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1EB00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_5250(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1EB00();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(unsigned char *)(a1 + *(int *)(a3 + 20)) = *(unsigned char *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_52CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_52E0);
}

uint64_t sub_52E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1EB00();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unsigned int v10 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 2) {
      return ((v10 + 2147483646) & 0x7FFFFFFF) + 1;
    }
    else {
      return 0;
    }
  }
}

uint64_t sub_53B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_53C4);
}

uint64_t sub_53C4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1EB00();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unsigned int v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(unsigned char *)(a1 + *(int *)(a4 + 20)) = a2 + 1;
  }
  return result;
}

uint64_t type metadata accessor for InVehicleEvent(uint64_t a1)
{
  return sub_54A0(a1, qword_2FDB0);
}

uint64_t sub_54A0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_54D8()
{
  uint64_t result = sub_1EB00();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_556C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_558C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)uint64_t result = (a2 - 1);
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

void type metadata accessor for AXMotionCuesMessageIdentifier(uint64_t a1)
{
}

uint64_t sub_55DC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_5620(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_55DC(&qword_2FDF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_5688(uint64_t a1)
{
  return sub_477C(a1, v1);
}

uint64_t sub_5690(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_56C8()
{
  unint64_t result = qword_302B0;
  if (!qword_302B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_302B0);
  }
  return result;
}

uint64_t sub_571C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_55DC(&qword_2FDF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_5784()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_57BC()
{
}

uint64_t sub_57C4()
{
  swift_getWitnessTable();

  return sub_1EB40();
}

uint64_t sub_5830()
{
  return sub_1EB60();
}

uint64_t sub_587C()
{
  return sub_1EB50();
}

Swift::Int sub_58D4()
{
  return sub_1F0F0();
}

uint64_t sub_593C(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_55DC(&qword_30300);
  uint64_t v77 = *(void *)(v4 - 8);
  uint64_t v78 = v4;
  ((void (*)(void))__chkstk_darwin)();
  v72 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_55DC(&qword_2FE10);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v70 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v67 - v8;
  uint64_t v10 = type metadata accessor for InVehicleEvent(0);
  uint64_t v11 = __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v71 = (uint64_t)&v67 - v15;
  __chkstk_darwin(v14);
  v17 = (char *)&v67 - v16;
  uint64_t v18 = sub_1EB90();
  uint64_t v75 = *(void *)(v18 - 8);
  uint64_t v76 = v18;
  uint64_t v19 = __chkstk_darwin(v18);
  os_log_type_t v21 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v19);
  v24 = (char *)&v67 - v23;
  if (a1)
  {
    swift_retain();
    NSString v25 = sub_1EC10();
    NSString v26 = sub_1EC10();
    if (a2)
    {
      id v73 = v26;
      uint64_t v74 = a1;
      v67 = v13;
      v68 = v9;
      type metadata accessor for CFString(0);
      sub_6370(&qword_2FE18);
      id v27 = v25;
      id v28 = a2;
      char v29 = sub_1EB40();

      id v69 = v27;
      if (v29)
      {
        uint64_t v30 = v10;
        if (qword_2FC30 != -1) {
          swift_once();
        }
        uint64_t v31 = v76;
        uint64_t v32 = sub_5690(v76, (uint64_t)MCLog);
        swift_beginAccess();
        uint64_t v33 = v75;
        (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v24, v32, v31);
        v34 = sub_1EB70();
        os_log_type_t v35 = sub_1EE20();
        BOOL v36 = os_log_type_enabled(v34, v35);
        uint64_t v37 = v74;
        if (v36)
        {
          v38 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v38 = 0;
          _os_log_impl(&dword_0, v34, v35, "Received vehicle enter", v38, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v33 + 8))(v24, v31);
        sub_1EAF0();
        v17[*(int *)(v30 + 20)] = 1;
        uint64_t v39 = v37 + OBJC_IVAR____TtC18AXMotionCuesServer22InVehicleEventListener__continuation;
        swift_beginAccess();
        uint64_t v41 = v77;
        uint64_t v40 = v78;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v77 + 48))(v39, 1, v78))
        {
          sub_6220((uint64_t)v17);
          swift_endAccess();
          swift_release();

          uint64_t v42 = sub_55DC(&qword_2FE20);
          v43 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56);
          uint64_t v44 = (uint64_t)v68;
LABEL_17:
          uint64_t v61 = v44;
          uint64_t v62 = 1;
LABEL_24:
          v43(v61, v62, 1, v42);
          return sub_627C(v44, &qword_2FE10);
        }
        v63 = v72;
        (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v72, v39, v40);
        swift_endAccess();
        sub_62D8((uint64_t)v17, v71);
        uint64_t v44 = (uint64_t)v68;
        sub_1ED50();

        swift_release();
        (*(void (**)(char *, uint64_t))(v41 + 8))(v63, v40);
        uint64_t v64 = (uint64_t)v17;
        goto LABEL_23;
      }
      id v45 = v28;
      id v46 = v73;
      id v47 = v73;
      char v48 = sub_1EB40();

      NSString v26 = v46;
      uint64_t v49 = v74;
      uint64_t v50 = v10;
      uint64_t v51 = (uint64_t)v67;
      if (v48)
      {
        if (qword_2FC30 != -1) {
          swift_once();
        }
        uint64_t v52 = v76;
        uint64_t v53 = sub_5690(v76, (uint64_t)MCLog);
        swift_beginAccess();
        uint64_t v54 = v75;
        (*(void (**)(char *, uint64_t, uint64_t))(v75 + 16))(v21, v53, v52);
        v55 = sub_1EB70();
        os_log_type_t v56 = sub_1EE20();
        if (os_log_type_enabled(v55, v56))
        {
          v57 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v57 = 0;
          _os_log_impl(&dword_0, v55, v56, "Received vehicle exit", v57, 2u);
          swift_slowDealloc();
        }

        (*(void (**)(char *, uint64_t))(v54 + 8))(v21, v52);
        sub_1EAF0();
        *(unsigned char *)(v51 + *(int *)(v50 + 20)) = 0;
        uint64_t v58 = v49 + OBJC_IVAR____TtC18AXMotionCuesServer22InVehicleEventListener__continuation;
        swift_beginAccess();
        uint64_t v60 = v77;
        uint64_t v59 = v78;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v77 + 48))(v58, 1, v78))
        {
          sub_6220(v51);
          swift_endAccess();
          swift_release();

          uint64_t v42 = sub_55DC(&qword_2FE20);
          v43 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56);
          uint64_t v44 = (uint64_t)v70;
          goto LABEL_17;
        }
        uint64_t v65 = v51;
        v66 = v72;
        (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v72, v58, v59);
        swift_endAccess();
        sub_62D8(v65, v71);
        uint64_t v44 = (uint64_t)v70;
        sub_1ED50();

        swift_release();
        (*(void (**)(char *, uint64_t))(v60 + 8))(v66, v59);
        uint64_t v64 = v65;
LABEL_23:
        sub_6220(v64);
        uint64_t v42 = sub_55DC(&qword_2FE20);
        v43 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v42 - 8) + 56);
        uint64_t v61 = v44;
        uint64_t v62 = 0;
        goto LABEL_24;
      }
    }

    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void type metadata accessor for CFString(uint64_t a1)
{
}

void sub_61D8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_6220(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for InVehicleEvent(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_627C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_55DC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_62D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InVehicleEvent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_633C()
{
  return sub_6370(&qword_2FE30);
}

uint64_t sub_6370(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for CFString(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_63B4()
{
  return sub_6370(&qword_2FE38);
}

uint64_t MCLog.unsafeMutableAddressor()
{
  if (qword_2FC30 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_1EB90();

  return sub_5690(v0, (uint64_t)MCLog);
}

uint64_t sub_6458()
{
  uint64_t v0 = sub_1EB90();
  sub_11854(v0, MCLog);
  sub_5690(v0, (uint64_t)MCLog);
  return sub_1EB80();
}

Swift::String *ProcessMessageAXMotionCuesServer.unsafeMutableAddressor()
{
  return &ProcessMessageAXMotionCuesServer;
}

Swift::String *ScreenStateChangedAXMotionCuesServer.unsafeMutableAddressor()
{
  return &ScreenStateChangedAXMotionCuesServer;
}

uint64_t sub_64EC()
{
  type metadata accessor for AXMotionCuesActor();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  static AXMotionCuesActor.shared = v0;
  return result;
}

uint64_t *AXMotionCuesActor.shared.unsafeMutableAddressor()
{
  if (qword_2FC38 != -1) {
    swift_once();
  }
  return &static AXMotionCuesActor.shared;
}

uint64_t static AXMotionCuesActor.shared.getter()
{
  if (qword_2FC38 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t AXMotionCuesActor.deinit()
{
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AXMotionCuesActor.__deallocating_deinit()
{
  swift_defaultActor_destroy();

  return _swift_defaultActor_deallocate(v0);
}

uint64_t AXMotionCuesActor.unownedExecutor.getter()
{
  return v0;
}

uint64_t sub_662C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for AXMotionCuesActor();

  return static GlobalActor.sharedUnownedExecutor.getter(v3, a2);
}

id sub_6664()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for AXMotionCuesServer()) init];
  qword_2FFC0 = (uint64_t)result;
  return result;
}

id sub_6694()
{
  uint64_t v1 = OBJC_IVAR___AXMotionCuesServer____lazy_storage____displayManager;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___AXMotionCuesServer____lazy_storage____displayManager);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___AXMotionCuesServer____lazy_storage____displayManager);
LABEL_5:
    id v6 = v2;
    return v3;
  }
  id result = [self sharedDisplayManager];
  if (result)
  {
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = result;
    id v3 = result;

    uint64_t v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_6718()
{
  uint64_t v1 = OBJC_IVAR___AXMotionCuesServer____lazy_storage___bannerManager;
  if (*(void *)(v0 + OBJC_IVAR___AXMotionCuesServer____lazy_storage___bannerManager))
  {
    uint64_t v2 = *(void *)(v0 + OBJC_IVAR___AXMotionCuesServer____lazy_storage___bannerManager);
  }
  else
  {
    uint64_t v3 = v0;
    type metadata accessor for AXMotionCuesBannerManager();
    swift_allocObject();
    sub_1D190();
    uint64_t v2 = v4;
    *(void *)(v3 + v1) = v4;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_6794()
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&v0[OBJC_IVAR___AXMotionCuesServer__mainDisplayViewController] = 0;
  *(void *)&v0[OBJC_IVAR___AXMotionCuesServer____lazy_storage____displayManager] = 0;
  *(void *)&v0[OBJC_IVAR___AXMotionCuesServer____lazy_storage___bannerManager] = 0;
  *(void *)&v0[OBJC_IVAR___AXMotionCuesServer__screenMonitor] = 0;
  v0[OBJC_IVAR___AXMotionCuesServer__isRunning] = 0;
  *(void *)&v0[OBJC_IVAR___AXMotionCuesServer__startTime] = 0;
  v0[OBJC_IVAR___AXMotionCuesServer__updatePending] = 0;
  v0[OBJC_IVAR___AXMotionCuesServer__updating] = 0;
  *(void *)&v0[OBJC_IVAR___AXMotionCuesServer__inVehicleEventListener] = 0;
  *(void *)&v0[OBJC_IVAR___AXMotionCuesServer__inVehicleEventTask] = 0;
  v0[OBJC_IVAR___AXMotionCuesServer__isInVehicle] = 0;
  v0[OBJC_IVAR___AXMotionCuesServer__needsBannerForInVehicleStateChange] = 0;
  v0[OBJC_IVAR___AXMotionCuesServer__didSnoozeCuesFromBanner] = 0;
  uint64_t v2 = OBJC_IVAR___AXMotionCuesServer__motionManager;
  id v3 = objc_allocWithZone((Class)CMMotionManager);
  uint64_t v4 = v0;
  id v5 = [v3 init];
  *(void *)&v0[v2] = v5;
  id v6 = &v4[OBJC_IVAR___AXMotionCuesServer_bannerIdentifier];
  type metadata accessor for DeviceMotionProvider();
  *(void *)id v6 = 0;
  *((void *)v6 + 1) = 0;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v5;
  *(void *)&v4[OBJC_IVAR___AXMotionCuesServer__deviceMotionProvider] = v7;
  type metadata accessor for AXMotionCuesModel();
  swift_allocObject();
  id v8 = v5;
  uint64_t v9 = swift_retain();
  *(void *)&v4[OBJC_IVAR___AXMotionCuesServer__motionCuesModel] = sub_1A54C(v9);

  AXMCEnableControlCenterModule();
  v11.receiver = v4;
  v11.super_class = ObjectType;
  return objc_msgSendSuper2(&v11, "init");
}

id static AXMotionCuesServer.sharedInstance()()
{
  if (qword_2FC40 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)swift_dynamicCastClassUnconditional();

  return v0;
}

id AXMotionCuesServer.processMessage(_:withIdentifier:fromClientWithIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v39 = a3;
  sub_55DC(&qword_2FFC8);
  __chkstk_darwin();
  id v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1EB90();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    sub_7088((uint64_t)&_swiftEmptyArrayStorage);
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_1EBF0();
  unint64_t v14 = v13;
  swift_bridgeObjectRelease();
  if (qword_2FC30 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_5690(v9, (uint64_t)MCLog);
  swift_beginAccess();
  uint64_t v16 = v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v15, v9);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v17 = sub_1EB70();
  uint64_t v18 = v9;
  os_log_type_t v19 = sub_1EE20();
  BOOL v20 = os_log_type_enabled(v17, v19);
  uint64_t v37 = a2;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    os_log_type_t v35 = v8;
    uint64_t v22 = v21;
    uint64_t v33 = swift_slowAlloc();
    uint64_t v41 = v33;
    *(_DWORD *)uint64_t v22 = 134218498;
    uint64_t v40 = a2;
    sub_1EEE0();
    *(_WORD *)(v22 + 12) = 2080;
    uint64_t v34 = v18;
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_F728(v39, a4, &v41);
    sub_1EEE0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v40 = sub_F728(v38, v14, &v41);
    sub_1EEE0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v17, v19, "Service got a message: %ld from client: %s. Payload: %s", (uint8_t *)v22, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    id v8 = v35;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v34);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    (*(void (**)(char *, uint64_t))(v16 + 8))(v12, v18);
  }
  id result = [self sharedServiceManager];
  if (result)
  {
    v24 = result;
    NSString v25 = sub_1EC10();
    NSString v26 = v36;
    [v24 beginTransactionWithIdentifier:v25 forService:v36];

    uint64_t v27 = sub_1ED30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v8, 1, 1, v27);
    sub_1ED10();
    swift_bridgeObjectRetain();
    id v28 = v26;
    uint64_t v29 = sub_1ED00();
    uint64_t v30 = (void *)swift_allocObject();
    v30[2] = v29;
    v30[3] = &protocol witness table for MainActor;
    uint64_t v31 = v37;
    v30[4] = v37;
    v30[5] = v28;
    v30[6] = v39;
    v30[7] = a4;
    uint64_t v32 = v38;
    v30[8] = v31;
    v30[9] = v32;
    v30[10] = v14;
    sub_860C((uint64_t)v8, (uint64_t)&unk_2FFD8, (uint64_t)v30);
    swift_release();
    return (id)sub_7088((uint64_t)&_swiftEmptyArrayStorage);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_6F6C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_55DC(&qword_301F8);
  uint64_t v2 = (void *)sub_1F030();
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
    swift_unknownObjectRetain();
    unint64_t result = sub_FD80(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v10 = v5;
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

unint64_t sub_7088(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_55DC(&qword_30328);
  uint64_t v2 = sub_1F030();
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
    sub_1172C(v6, (uint64_t)v15);
    unint64_t result = sub_FDF8((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_11794(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_71B8(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_55DC(a2);
  uint64_t v3 = (void *)sub_1F030();
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  uint64_t v5 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v6 = (uint64_t)*(v5 - 2);
    uint64_t v7 = (uint64_t)*(v5 - 1);
    char v8 = *v5;
    swift_bridgeObjectRetain();
    id v9 = v8;
    unint64_t result = sub_FD80(v6, v7);
    if (v11) {
      break;
    }
    *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v12 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v12 = v6;
    v12[1] = v7;
    *(void *)(v3[7] + 8 * result) = v9;
    uint64_t v13 = v3[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v3[2] = v15;
    v5 += 3;
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

uint64_t sub_72D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[24] = v14;
  v8[25] = v15;
  v8[22] = a7;
  v8[23] = a8;
  v8[20] = a5;
  v8[21] = a6;
  v8[19] = a4;
  uint64_t v9 = sub_1EB90();
  v8[26] = v9;
  v8[27] = *(void *)(v9 - 8);
  v8[28] = swift_task_alloc();
  v8[29] = swift_task_alloc();
  v8[30] = swift_task_alloc();
  v8[31] = swift_task_alloc();
  sub_1ED10();
  v8[32] = sub_1ED00();
  uint64_t v11 = sub_1ECE0();
  v8[33] = v11;
  v8[34] = v10;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_7400, v11, v10);
}

uint64_t sub_7400()
{
  v57 = v0;
  switch(v0[19])
  {
    case 1:
      if (qword_2FC38 != -1) {
        swift_once();
      }
      uint64_t v1 = static AXMotionCuesActor.shared;
      return ((uint64_t (*)(uint64_t (*)(), uint64_t, void))_swift_task_switch)(sub_7CA4, v1, 0);
    case 2:
      long long v17 = (void *)swift_task_alloc();
      v0[36] = v17;
      void *v17 = v0;
      v17[1] = sub_8090;
      return sub_81B0();
    case 3:
      swift_release();
      if (qword_2FC30 != -1) {
        swift_once();
      }
      uint64_t v18 = v0[30];
      uint64_t v19 = v0[26];
      uint64_t v20 = v0[27];
      uint64_t v21 = sub_5690(v19, (uint64_t)MCLog);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, v21, v19);
      swift_bridgeObjectRetain_n();
      uint64_t v22 = sub_1EB70();
      os_log_type_t v23 = sub_1EE20();
      BOOL v24 = os_log_type_enabled(v22, v23);
      uint64_t v25 = v0[30];
      uint64_t v26 = v0[26];
      uint64_t v27 = v0[27];
      unint64_t v28 = v0[22];
      if (v24)
      {
        uint64_t v52 = v0[21];
        uint64_t v54 = v0[26];
        uint64_t v29 = (uint8_t *)swift_slowAlloc();
        uint64_t v56 = swift_slowAlloc();
        *(_DWORD *)uint64_t v29 = 136315138;
        swift_bridgeObjectRetain();
        v0[17] = sub_F728(v52, v28, &v56);
        sub_1EEE0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v22, v23, "New visible handler client: %s", v29, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v54);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v25, v26);
      }
      break;
    case 4:
      swift_release();
      if (qword_2FC30 != -1) {
        swift_once();
      }
      uint64_t v30 = v0[29];
      uint64_t v32 = v0[26];
      uint64_t v31 = v0[27];
      uint64_t v33 = sub_5690(v32, (uint64_t)MCLog);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v30, v33, v32);
      swift_bridgeObjectRetain_n();
      uint64_t v34 = sub_1EB70();
      os_log_type_t v35 = sub_1EE20();
      BOOL v36 = os_log_type_enabled(v34, v35);
      uint64_t v37 = v0[29];
      uint64_t v39 = v0[26];
      uint64_t v38 = v0[27];
      unint64_t v40 = v0[22];
      if (v36)
      {
        uint64_t v53 = v0[21];
        uint64_t v55 = v0[26];
        uint64_t v41 = (uint8_t *)swift_slowAlloc();
        uint64_t v56 = swift_slowAlloc();
        *(_DWORD *)uint64_t v41 = 136315138;
        swift_bridgeObjectRetain();
        v0[15] = sub_F728(v53, v40, &v56);
        sub_1EEE0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v34, v35, "New moving handler client: %s", v41, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v55);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v37, v39);
      }
      break;
    default:
      swift_release();
      if (qword_2FC30 != -1) {
        swift_once();
      }
      uint64_t v2 = v0[27];
      uint64_t v3 = v0[28];
      uint64_t v4 = v0[26];
      uint64_t v5 = sub_5690(v4, (uint64_t)MCLog);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v5, v4);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v6 = sub_1EB70();
      os_log_type_t v7 = sub_1EE10();
      BOOL v8 = os_log_type_enabled(v6, v7);
      uint64_t v10 = v0[27];
      uint64_t v9 = v0[28];
      unint64_t v12 = v0[25];
      uint64_t v11 = v0[26];
      if (v8)
      {
        uint64_t v48 = v0[24];
        uint64_t v50 = v0[28];
        uint64_t v51 = v0[26];
        unint64_t v14 = v0[22];
        uint64_t v13 = v0[23];
        uint64_t v15 = v0[21];
        os_log_type_t v49 = v7;
        uint64_t v16 = swift_slowAlloc();
        uint64_t v56 = swift_slowAlloc();
        *(_DWORD *)uint64_t v16 = 134218498;
        v0[18] = v13;
        sub_1EEE0();
        *(_WORD *)(v16 + 12) = 2080;
        swift_bridgeObjectRetain();
        v0[16] = sub_F728(v15, v14, &v56);
        sub_1EEE0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v16 + 22) = 2080;
        swift_bridgeObjectRetain();
        v0[14] = sub_F728(v48, v12, &v56);
        sub_1EEE0();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v6, v49, "Unhandled service message: %ld from client: %s. Payload: %s", (uint8_t *)v16, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v50, v51);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
      }
      break;
  }
  id v42 = [self sharedServiceManager];
  if (v42)
  {
    v43 = v42;
    uint64_t v44 = v0[20];
    NSString v45 = sub_1EC10();
    [v43 endTransactionWithIdentifier:v45 forService:v44];

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v46 = v0[1];
    __asm { BRAA            X1, X16 }
  }
  __break(1u);
  JUMPOUT(0x7C94);
}

uint64_t sub_7CA4()
{
  if (qword_2FC30 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[31];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  uint64_t v4 = sub_5690(v2, (uint64_t)MCLog);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  uint64_t v5 = sub_1EB70();
  os_log_type_t v6 = sub_1EE20();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "Turning on the Motion Cues.", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v8 = v0[31];
  uint64_t v9 = v0[26];
  uint64_t v10 = v0[27];

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  sub_10784();
  sub_8904();
  sub_8FC4();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[35] = v11;
  void *v11 = v0;
  v11[1] = sub_7E60;
  return sub_9108();
}

uint64_t sub_7E60()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 272);
  uint64_t v3 = *(void *)(v1 + 264);
  return ((uint64_t (*)(id (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_7F80, v3, v2);
}

id sub_7F80()
{
  swift_release();
  id result = [self sharedServiceManager];
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void *)(v0 + 160);
    NSString v4 = sub_1EC10();
    [v2 endTransactionWithIdentifier:v4 forService:v3];

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v5();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_8090()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 272);
  uint64_t v3 = *(void *)(v1 + 264);
  return ((uint64_t (*)(id (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_118CC, v3, v2);
}

uint64_t sub_81B0()
{
  v1[5] = v0;
  uint64_t v2 = sub_1EB90();
  void v1[6] = v2;
  v1[7] = *(void *)(v2 - 8);
  v1[8] = swift_task_alloc();
  if (qword_2FC38 != -1) {
    swift_once();
  }
  v1[9] = static AXMotionCuesActor.shared;
  return ((uint64_t (*)(uint64_t (*)()))_swift_task_switch)(sub_82A8);
}

uint64_t sub_82A8()
{
  if (qword_2FC30 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[7];
  uint64_t v1 = v0[8];
  uint64_t v3 = v0[6];
  uint64_t v4 = sub_5690(v3, (uint64_t)MCLog);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  uint64_t v5 = sub_1EB70();
  os_log_type_t v6 = sub_1EE20();
  if (os_log_type_enabled(v5, v6))
  {
    os_log_type_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "Disabling the Motion Cues.", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v9 = v0[7];
  uint64_t v8 = v0[8];
  uint64_t v10 = v0[6];

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  sub_10784();
  uint64_t v11 = (void *)swift_task_alloc();
  v0[10] = v11;
  void *v11 = v0;
  v11[1] = sub_8458;
  return sub_A178();
}

uint64_t sub_8458()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 72);
  swift_task_dealloc();
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, void))_swift_task_switch)(sub_8568, v1, 0);
}

uint64_t sub_8568()
{
  uint64_t v1 = *(void *)(v0 + 40);
  sub_B254();
  uint64_t v2 = OBJC_IVAR___AXMotionCuesServer__screenMonitor;
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR___AXMotionCuesServer__screenMonitor);
  if (v3)
  {
    [v3 invalidate];
    uint64_t v4 = *(void **)(v1 + v2);
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(void *)(v1 + v2) = 0;

  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_860C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1ED30();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1ED20();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10634(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1ECE0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_8904()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1EB90();
  uint64_t v38 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v34 - v6;
  uint64_t v8 = sub_55DC(&qword_2FFC8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_55DC(&qword_302F8);
  uint64_t v12 = *(void *)(*(void *)(v11 - 8) + 64);
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v14 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  long long v17 = (char *)&v34 - v16;
  uint64_t v18 = OBJC_IVAR___AXMotionCuesServer__inVehicleEventListener;
  if (*(void *)&v1[OBJC_IVAR___AXMotionCuesServer__inVehicleEventListener])
  {
    if (qword_2FC30 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_5690(v2, (uint64_t)MCLog);
    swift_beginAccess();
    uint64_t v20 = v38;
    (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v7, v19, v2);
    uint64_t v21 = sub_1EB70();
    os_log_type_t v22 = sub_1EE20();
    if (os_log_type_enabled(v21, v22))
    {
      os_log_type_t v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "Already listening for in-vehicle detection updates.", v23, 2u);
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v7, v2);
  }
  else
  {
    uint64_t v36 = v15;
    uint64_t v37 = (uint64_t)v5;
    type metadata accessor for InVehicleEventListener(0);
    uint64_t v25 = swift_allocObject();
    uint64_t v26 = v25 + OBJC_IVAR____TtC18AXMotionCuesServer22InVehicleEventListener__continuation;
    uint64_t v27 = sub_55DC(&qword_30300);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v26, 1, 1, v27);
    sub_428C((uint64_t)v17);
    *(void *)&v1[v18] = v25;
    uint64_t v38 = v25;
    swift_retain();
    swift_release();
    uint64_t v37 = OBJC_IVAR___AXMotionCuesServer__inVehicleEventTask;
    if (*(void *)&v1[OBJC_IVAR___AXMotionCuesServer__inVehicleEventTask])
    {
      swift_retain();
      sub_1EDA0();
      swift_release();
    }
    uint64_t v28 = sub_1ED30();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v28 - 8) + 56))(v10, 1, 1, v28);
    uint64_t v29 = v36;
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v14, v17, v11);
    sub_1ED10();
    os_log_type_t v35 = v1;
    uint64_t v30 = sub_1ED00();
    unint64_t v31 = (*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
    uint64_t v32 = swift_allocObject();
    *(void *)(v32 + 16) = v30;
    *(void *)(v32 + 24) = &protocol witness table for MainActor;
    (*(void (**)(unint64_t, char *, uint64_t))(v29 + 32))(v32 + v31, v14, v11);
    *(void *)(v32 + ((v12 + v31 + 7) & 0xFFFFFFFFFFFFFFF8)) = v35;
    uint64_t v33 = sub_860C((uint64_t)v10, (uint64_t)&unk_30310, v32);
    swift_release();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v17, v11);
    *(void *)&v1[v37] = v33;
    return swift_release();
  }
}

void sub_8FC4()
{
  uint64_t v1 = OBJC_IVAR___AXMotionCuesServer__screenMonitor;
  if (!*(void *)(v0 + OBJC_IVAR___AXMotionCuesServer__screenMonitor))
  {
    id v2 = [self configurationForDefaultMainDisplayMonitor];
    uint64_t v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v7[4] = sub_113A4;
    v7[5] = v3;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256;
    v7[2] = sub_CA3C;
    v7[3] = &unk_294A8;
    uint64_t v4 = _Block_copy(v7);
    swift_release();
    [v2 setTransitionHandler:v4];
    _Block_release(v4);
    id v5 = [self monitorWithConfiguration:v2];

    uint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
  }
}

uint64_t sub_9108()
{
  void v1[6] = v0;
  uint64_t v2 = sub_1EB90();
  v1[7] = v2;
  v1[8] = *(void *)(v2 - 8);
  v1[9] = swift_task_alloc();
  v1[10] = swift_task_alloc();
  if (qword_2FC38 != -1) {
    swift_once();
  }
  v1[11] = static AXMotionCuesActor.shared;
  return ((uint64_t (*)(id (*)()))_swift_task_switch)(sub_9210);
}

id sub_9210()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = OBJC_IVAR___AXMotionCuesServer__updating;
  *(void *)(v0 + 96) = OBJC_IVAR___AXMotionCuesServer__updating;
  if (*(unsigned char *)(v1 + v2))
  {
    uint64_t v3 = (char *)(v1 + OBJC_IVAR___AXMotionCuesServer__updatePending);
    char v4 = 1;
LABEL_45:
    *uint64_t v3 = v4;
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v51 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v51();
  }
  *(unsigned char *)(v1 + v2) = 1;
  id v5 = self;
  *(void *)(v0 + 104) = v5;
  id result = [v5 sharedServiceManager];
  if (!result)
  {
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v7 = result;
  uint64_t v8 = *(void *)(v0 + 48);
  NSString v9 = sub_1EC10();
  [v7 beginTransactionWithIdentifier:v9 forService:v8];

  uint64_t v10 = OBJC_IVAR___AXMotionCuesServer__updatePending;
  uint64_t v11 = OBJC_IVAR___AXMotionCuesServer__isInVehicle;
  *(void *)(v0 + 112) = OBJC_IVAR___AXMotionCuesServer__updatePending;
  *(void *)(v0 + 120) = v11;
  uint64_t v12 = OBJC_IVAR___AXMotionCuesServer__screenMonitor;
  *(void *)(v0 + 128) = OBJC_IVAR___AXMotionCuesServer__didSnoozeCuesFromBanner;
  *(void *)(v0 + 136) = v12;
  *(void *)(v0 + 144) = OBJC_IVAR___AXMotionCuesServer__isRunning;
  uint64_t v13 = *(void *)(v0 + 48);
  do
  {
    uint64_t v15 = *(void *)(v0 + 128);
    uint64_t v14 = *(void *)(v0 + 136);
    uint64_t v16 = *(void *)(v0 + 120);
    *(unsigned char *)(v13 + v10) = 0;
    int v17 = _AXSMotionCuesEnabled();
    int v18 = *(unsigned __int8 *)(v13 + v16);
    int v19 = _AXSMotionCuesMode();
    int v20 = *(unsigned __int8 *)(v13 + v15);
    uint64_t v21 = *(void **)(v13 + v14);
    if (v21 && (id v22 = [v21 currentLayout]) != 0)
    {
      os_log_type_t v23 = v22;
      BOOL v24 = (char *)[v22 backlightState];

      BOOL v25 = v17 == 0;
      if (v24 == (unsigned char *)&dword_0 + 2)
      {
        if (!v17)
        {
          int v26 = 0;
          BOOL v25 = 1;
          goto LABEL_23;
        }
        if (v19 == 1)
        {
          BOOL v25 = 0;
          int v26 = 1;
LABEL_23:
          BOOL v24 = (unsigned char *)(&dword_0 + 2);
          int v27 = 1;
          goto LABEL_30;
        }
        BOOL v25 = 0;
        int v27 = 1;
        if (!v19)
        {
          uint64_t v28 = 2;
          BOOL v24 = (unsigned char *)(&dword_0 + 2);
          int v26 = 0;
          if ((v18 & 1) == 0) {
            goto LABEL_30;
          }
LABEL_26:
          BOOL v25 = 0;
          int v26 = v20 ^ 1;
          BOOL v24 = (char *)v28;
          goto LABEL_30;
        }
        BOOL v24 = (unsigned char *)(&dword_0 + 2);
        goto LABEL_29;
      }
    }
    else
    {
      BOOL v25 = v17 == 0;
      BOOL v24 = (unsigned char *)(&dword_0 + 3);
    }
    int v26 = 0;
    int v27 = v24 == (unsigned char *)&dword_0 + 3 && v25;
    if (!v25 && v24 == (unsigned char *)&dword_0 + 3)
    {
      if (v19 == 1)
      {
        BOOL v25 = 0;
        int v26 = 1;
        BOOL v24 = (unsigned char *)(&dword_0 + 3);
        int v27 = 1;
        goto LABEL_30;
      }
      BOOL v25 = 0;
      int v27 = 1;
      if (v19)
      {
        BOOL v24 = (unsigned char *)(&dword_0 + 3);
LABEL_29:
        int v26 = 0;
        goto LABEL_30;
      }
      uint64_t v28 = 3;
      BOOL v24 = (unsigned char *)(&dword_0 + 3);
      int v26 = 0;
      if (v18) {
        goto LABEL_26;
      }
    }
LABEL_30:
    int v53 = v27;
    BOOL v55 = v25;
    int v59 = v26;
    if (qword_2FC30 != -1) {
      swift_once();
    }
    id v54 = v24;
    int v56 = v18;
    int v57 = v19;
    uint64_t v29 = *(void *)(v0 + 80);
    uint64_t v31 = *(void *)(v0 + 56);
    uint64_t v30 = *(void *)(v0 + 64);
    uint64_t v32 = sub_5690(v31, (uint64_t)MCLog);
    swift_beginAccess();
    uint64_t v58 = *(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16);
    v58(v29, v32, v31);
    uint64_t v33 = sub_1EB70();
    os_log_type_t v34 = sub_1EE20();
    if (os_log_type_enabled(v33, v34))
    {
      os_log_type_t v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v35 = 0;
      _os_log_impl(&dword_0, v33, v34, "Begin transaction", v35, 2u);
      swift_slowDealloc();
    }
    uint64_t v36 = *(void *)(v0 + 144);
    uint64_t v37 = *(void *)(v0 + 80);
    uint64_t v38 = *(void *)(v0 + 56);
    uint64_t v39 = *(void *)(v0 + 64);
    uint64_t v40 = *(void *)(v0 + 48);

    uint64_t v41 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
    v41(v37, v38);
    if (v59 != *(unsigned __int8 *)(v40 + v36))
    {
      v58(*(void *)(v0 + 72), v32, *(void *)(v0 + 56));
      id v42 = sub_1EB70();
      os_log_type_t v43 = sub_1EE20();
      if (os_log_type_enabled(v42, v43))
      {
        uint64_t v44 = swift_slowAlloc();
        *(_DWORD *)uint64_t v44 = 67110400;
        *(_DWORD *)(v0 + 172) = v59;
        sub_1EEE0();
        *(_WORD *)(v44 + 8) = 1024;
        *(_DWORD *)(v0 + 168) = !v55;
        sub_1EEE0();
        *(_WORD *)(v44 + 14) = 1024;
        *(_DWORD *)(v0 + 184) = v56;
        sub_1EEE0();
        *(_WORD *)(v44 + 20) = 1024;
        *(_DWORD *)(v0 + 176) = v57;
        sub_1EEE0();
        *(_WORD *)(v44 + 26) = 1024;
        *(_DWORD *)(v0 + 180) = v53;
        sub_1EEE0();
        *(_WORD *)(v44 + 32) = 2048;
        *(void *)(v0 + 40) = v54;
        sub_1EEE0();
        _os_log_impl(&dword_0, v42, v43, "Updating state: shouldStart=%{BOOL}d, enabled=%{BOOL}d, inVehicle=%{BOOL}d, mode=%d, screenIsOn=%{BOOL}d Backlight state: %ld ", (uint8_t *)v44, 0x2Au);
        swift_slowDealloc();
      }
      uint64_t v45 = *(void *)(v0 + 72);
      uint64_t v46 = *(void *)(v0 + 56);

      v41(v45, v46);
      if (v59)
      {
        id v47 = (void *)swift_task_alloc();
        *(void *)(v0 + 152) = v47;
        *id v47 = v0;
        v47[1] = sub_9924;
        return (id)sub_D690();
      }
      else
      {
        uint64_t v52 = (void *)swift_task_alloc();
        *(void *)(v0 + 160) = v52;
        *uint64_t v52 = v0;
        v52[1] = sub_A068;
        return (id)sub_A178();
      }
    }
    uint64_t v10 = *(void *)(v0 + 112);
    uint64_t v13 = *(void *)(v0 + 48);
  }
  while ((*(unsigned char *)(v13 + v10) & 1) != 0);
  id result = [*(id *)(v0 + 104) sharedServiceManager];
  if (result)
  {
    uint64_t v48 = result;
    uint64_t v49 = *(void *)(v0 + 48);
    NSString v50 = sub_1EC10();
    [v48 endTransactionWithIdentifier:v50 forService:v49];

    char v4 = 0;
    uint64_t v3 = (char *)(*(void *)(v0 + 48) + *(void *)(v0 + 96));
    goto LABEL_45;
  }
LABEL_52:
  __break(1u);
  return result;
}

uint64_t sub_9924()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  return ((uint64_t (*)(id (*)(), uint64_t, void))_swift_task_switch)(sub_9A34, v1, 0);
}

id sub_9A34()
{
  while (1)
  {
    uint64_t v7 = *(void *)(v0 + 112);
    uint64_t v8 = *(void *)(v0 + 48);
    if ((*(unsigned char *)(v8 + v7) & 1) == 0) {
      break;
    }
    uint64_t v10 = *(void *)(v0 + 128);
    uint64_t v9 = *(void *)(v0 + 136);
    uint64_t v11 = *(void *)(v0 + 120);
    *(unsigned char *)(v8 + v7) = 0;
    int v12 = _AXSMotionCuesEnabled();
    int v13 = *(unsigned __int8 *)(v8 + v11);
    int v14 = _AXSMotionCuesMode();
    int v15 = *(unsigned __int8 *)(v8 + v10);
    uint64_t v16 = *(void **)(v8 + v9);
    if (!v16 || (id v17 = [v16 currentLayout]) == 0)
    {
      BOOL v20 = v12 == 0;
      int v19 = (unsigned char *)(&dword_0 + 3);
LABEL_11:
      int v21 = 0;
      int v22 = v19 == (unsigned char *)&dword_0 + 3 && v20;
      if (v20 || v19 != (unsigned char *)&dword_0 + 3) {
        goto LABEL_29;
      }
      if (v14 != 1)
      {
        BOOL v20 = 0;
        int v22 = 1;
        if (v14)
        {
          int v19 = (unsigned char *)(&dword_0 + 3);
LABEL_28:
          int v21 = 0;
          goto LABEL_29;
        }
        uint64_t v23 = 3;
        int v19 = (unsigned char *)(&dword_0 + 3);
        int v21 = 0;
        if (!v13) {
          goto LABEL_29;
        }
LABEL_25:
        BOOL v20 = 0;
        int v21 = v15 ^ 1;
        int v19 = (char *)v23;
        goto LABEL_29;
      }
      BOOL v20 = 0;
      int v21 = 1;
      int v19 = (unsigned char *)(&dword_0 + 3);
      int v22 = 1;
      goto LABEL_29;
    }
    int v18 = v17;
    int v19 = (char *)[v17 backlightState];

    BOOL v20 = v12 == 0;
    if (v19 != (unsigned char *)&dword_0 + 2) {
      goto LABEL_11;
    }
    if (!v12)
    {
      int v21 = 0;
      BOOL v20 = 1;
      goto LABEL_22;
    }
    if (v14 == 1)
    {
      BOOL v20 = 0;
      int v21 = 1;
LABEL_22:
      int v19 = (unsigned char *)(&dword_0 + 2);
      int v22 = 1;
      goto LABEL_29;
    }
    BOOL v20 = 0;
    int v22 = 1;
    if (v14)
    {
      int v19 = (unsigned char *)(&dword_0 + 2);
      goto LABEL_28;
    }
    uint64_t v23 = 2;
    int v19 = (unsigned char *)(&dword_0 + 2);
    int v21 = 0;
    if (v13) {
      goto LABEL_25;
    }
LABEL_29:
    int v43 = v22;
    id v44 = v19;
    BOOL v45 = v20;
    int v49 = v21;
    int v46 = v13;
    if (qword_2FC30 != -1) {
      swift_once();
    }
    int v47 = v14;
    uint64_t v24 = *(void *)(v0 + 80);
    uint64_t v26 = *(void *)(v0 + 56);
    uint64_t v25 = *(void *)(v0 + 64);
    uint64_t v27 = sub_5690(v26, (uint64_t)MCLog);
    swift_beginAccess();
    uint64_t v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 16);
    v48(v24, v27, v26);
    uint64_t v28 = sub_1EB70();
    os_log_type_t v29 = sub_1EE20();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_0, v28, v29, "Begin transaction", v30, 2u);
      swift_slowDealloc();
    }
    uint64_t v1 = *(void *)(v0 + 144);
    uint64_t v2 = *(void *)(v0 + 80);
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v4 = *(void *)(v0 + 64);
    uint64_t v5 = *(void *)(v0 + 48);

    uint64_t v6 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v6(v2, v3);
    if (v49 != *(unsigned __int8 *)(v5 + v1))
    {
      v48(*(void *)(v0 + 72), v27, *(void *)(v0 + 56));
      uint64_t v36 = sub_1EB70();
      os_log_type_t v37 = sub_1EE20();
      if (os_log_type_enabled(v36, v37))
      {
        uint64_t v38 = swift_slowAlloc();
        *(_DWORD *)uint64_t v38 = 67110400;
        *(_DWORD *)(v0 + 172) = v49;
        sub_1EEE0();
        *(_WORD *)(v38 + 8) = 1024;
        *(_DWORD *)(v0 + 168) = !v45;
        sub_1EEE0();
        *(_WORD *)(v38 + 14) = 1024;
        *(_DWORD *)(v0 + 184) = v46;
        sub_1EEE0();
        *(_WORD *)(v38 + 20) = 1024;
        *(_DWORD *)(v0 + 176) = v47;
        sub_1EEE0();
        *(_WORD *)(v38 + 26) = 1024;
        *(_DWORD *)(v0 + 180) = v43;
        sub_1EEE0();
        *(_WORD *)(v38 + 32) = 2048;
        *(void *)(v0 + 40) = v44;
        sub_1EEE0();
        _os_log_impl(&dword_0, v36, v37, "Updating state: shouldStart=%{BOOL}d, enabled=%{BOOL}d, inVehicle=%{BOOL}d, mode=%d, screenIsOn=%{BOOL}d Backlight state: %ld ", (uint8_t *)v38, 0x2Au);
        swift_slowDealloc();
      }
      uint64_t v39 = *(void *)(v0 + 72);
      uint64_t v40 = *(void *)(v0 + 56);

      v6(v39, v40);
      if (v49)
      {
        uint64_t v41 = (void *)swift_task_alloc();
        *(void *)(v0 + 152) = v41;
        *uint64_t v41 = v0;
        v41[1] = sub_9924;
        return (id)sub_D690();
      }
      else
      {
        id v42 = (void *)swift_task_alloc();
        *(void *)(v0 + 160) = v42;
        *id v42 = v0;
        v42[1] = sub_A068;
        return (id)sub_A178();
      }
    }
  }
  id result = [*(id *)(v0 + 104) sharedServiceManager];
  if (result)
  {
    uint64_t v32 = result;
    uint64_t v33 = *(void *)(v0 + 48);
    NSString v34 = sub_1EC10();
    [v32 endTransactionWithIdentifier:v34 forService:v33];

    *(unsigned char *)(*(void *)(v0 + 48) + *(void *)(v0 + 96)) = 0;
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v35 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v35();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_A068()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 88);
  swift_task_dealloc();
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, void))_swift_task_switch)(sub_118BC, v1, 0);
}

uint64_t sub_A178()
{
  v1[47] = v0;
  sub_55DC(&qword_2FFC8);
  v1[48] = swift_task_alloc();
  uint64_t v2 = sub_1EB90();
  v1[49] = v2;
  v1[50] = *(void *)(v2 - 8);
  v1[51] = swift_task_alloc();
  v1[52] = swift_task_alloc();
  v1[53] = swift_task_alloc();
  if (qword_2FC38 != -1) {
    swift_once();
  }
  v1[54] = static AXMotionCuesActor.shared;
  return ((uint64_t (*)(uint64_t (*)()))_swift_task_switch)(sub_A2BC);
}

uint64_t sub_A2BC()
{
  if (_AXSMotionCuesActive()) {
    _AXSSetMotionCuesActive();
  }
  uint64_t v1 = *(void *)(v0 + 376);
  uint64_t v2 = OBJC_IVAR___AXMotionCuesServer__isRunning;
  *(void *)(v0 + 440) = OBJC_IVAR___AXMotionCuesServer__isRunning;
  if ((*(unsigned char *)(v1 + v2) & 1) == 0)
  {
    if (qword_2FC30 != -1) {
      swift_once();
    }
    uint64_t v4 = *(void *)(v0 + 424);
    uint64_t v5 = *(void *)(v0 + 392);
    uint64_t v6 = *(void *)(v0 + 400);
    uint64_t v7 = sub_5690(v5, (uint64_t)MCLog);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    uint64_t v8 = sub_1EB70();
    os_log_type_t v9 = sub_1EE20();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v8, v9, "Not running Motion Cues, no need to stop", v10, 2u);
      swift_slowDealloc();
    }
    uint64_t v11 = *(void *)(v0 + 424);
    uint64_t v12 = *(void *)(v0 + 392);
    uint64_t v13 = *(void *)(v0 + 400);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v14 = *(void *)(v0 + 8);
    __asm { BRAA            X1, X16 }
  }
  uint64_t v3 = *(void **)(*(void *)(v1 + OBJC_IVAR___AXMotionCuesServer__deviceMotionProvider) + 16);
  if ([v3 isDeviceMotionActive])
  {
    [v3 stopDeviceMotionUpdates];
  }
  else
  {
    if (qword_2FC30 != -1) {
      swift_once();
    }
    uint64_t v15 = *(void *)(v0 + 416);
    uint64_t v16 = *(void *)(v0 + 392);
    uint64_t v17 = *(void *)(v0 + 400);
    uint64_t v18 = sub_5690(v16, (uint64_t)MCLog);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v18, v16);
    int v19 = sub_1EB70();
    os_log_type_t v20 = sub_1EE10();
    if (os_log_type_enabled(v19, v20))
    {
      int v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v21 = 0;
      _os_log_impl(&dword_0, v19, v20, "No ongoing capture. No need to stop.", v21, 2u);
      swift_slowDealloc();
    }
    uint64_t v22 = *(void *)(v0 + 416);
    uint64_t v23 = *(void *)(v0 + 392);
    uint64_t v24 = *(void *)(v0 + 400);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
  }
  uint64_t v25 = *(void *)(v0 + 376);
  uint64_t v26 = OBJC_IVAR___AXMotionCuesServer__mainDisplayViewController;
  *(void *)(v0 + 448) = OBJC_IVAR___AXMotionCuesServer__mainDisplayViewController;
  uint64_t v27 = *(void **)(v25 + v26);
  *(void *)(v0 + 456) = v27;
  if (v27)
  {
    *(void *)(v0 + 464) = sub_1ED10();
    id v28 = v27;
    *(void *)(v0 + 472) = sub_1ED00();
    uint64_t v29 = sub_1ECE0();
    uint64_t v31 = v30;
    *(void *)(v0 + 480) = v29;
    *(void *)(v0 + 488) = v30;
    uint64_t v32 = sub_A69C;
    uint64_t v33 = v29;
  }
  else
  {
    *(_OWORD *)(v0 + 624) = 0u;
    *(_OWORD *)(v0 + 640) = xmmword_1FE70;
    *(void *)(v0 + 616) = 0x7FEFFFFFFFFFFFFFLL;
    *(void *)(v0 + 592) = 0;
    *(void *)(v0 + 608) = 0;
    *(void *)(v0 + 600) = 0;
    uint64_t v32 = sub_ABB0;
    uint64_t v33 = 0;
    uint64_t v31 = 0;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v32, v33, v31);
}

uint64_t sub_A69C()
{
  uint64_t v1 = v0[57];
  v0[62] = sub_1ED00();
  uint64_t v2 = swift_task_alloc();
  v0[63] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[64] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_A7A0;
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_A7A0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 488);
  uint64_t v3 = *(void *)(v1 + 480);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_A900, v3, v2);
}

uint64_t sub_A900()
{
  uint64_t v1 = *(void **)(v0 + 456);
  uint64_t v2 = *(void *)(v0 + 432);
  swift_release();

  return ((uint64_t (*)(uint64_t (*)(), uint64_t, void))_swift_task_switch)(sub_A974, v2, 0);
}

uint64_t sub_A974()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 376) + *(void *)(v0 + 448));
  *(void *)(v0 + 520) = v1;
  if (v1)
  {
    sub_1ED10();
    id v2 = v1;
    *(void *)(v0 + 528) = sub_1ED00();
    uint64_t v3 = sub_1ECE0();
    uint64_t v5 = v4;
    uint64_t v6 = sub_AA60;
    uint64_t v7 = v3;
    uint64_t v8 = v5;
  }
  else
  {
    *(_OWORD *)(v0 + 624) = 0u;
    *(_OWORD *)(v0 + 640) = xmmword_1FE70;
    *(void *)(v0 + 616) = 0x7FEFFFFFFFFFFFFFLL;
    *(void *)(v0 + 592) = 0;
    *(void *)(v0 + 608) = 0;
    *(void *)(v0 + 600) = 0;
    uint64_t v6 = sub_ABB0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(v6, v7, v8);
}

uint64_t sub_AA60()
{
  uint64_t v1 = (char *)v0[65];
  uint64_t v2 = v0[54];
  swift_release();
  uint64_t v3 = &v1[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_statistics];
  v0[67] = *(void *)&v1[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_statistics];
  v0[68] = *((void *)v3 + 1);
  v0[69] = *((void *)v3 + 2);
  v0[70] = *((void *)v3 + 3);
  v0[71] = *((void *)v3 + 4);
  v0[72] = *((void *)v3 + 5);
  v0[73] = *((void *)v3 + 6);

  return ((uint64_t (*)(uint64_t (*)(), uint64_t, void))_swift_task_switch)(sub_AB1C, v2, 0);
}

uint64_t sub_AB1C()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 376) + *(void *)(v0 + 448));
  double v2 = (double)*(uint64_t *)(v0 + 536);
  long long v3 = *(_OWORD *)(v0 + 576);
  long long v4 = *(_OWORD *)(v0 + 544);
  *(_OWORD *)(v0 + 624) = *(_OWORD *)(v0 + 560);
  *(_OWORD *)(v0 + 640) = v3;
  *(_OWORD *)(v0 + 608) = v4;
  *(double *)(v0 + 600) = v2;
  *(void *)(v0 + 592) = v1;
  id v5 = v1;
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_ABB0, 0, 0);
}

uint64_t sub_ABB0()
{
  uint64_t v1 = (void *)v0[74];
  uint64_t v2 = v0[54];
  long long v4 = (void *)v0[47];
  uint64_t v3 = v0[48];
  uint64_t v5 = sub_1ED30();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v3, 1, 1, v5);
  sub_1ED10();
  id v6 = v1;
  id v7 = v4;
  uint64_t v8 = sub_1ED00();
  os_log_type_t v9 = (void *)swift_allocObject();
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  v9[5] = v1;
  sub_EE40(v3, (uint64_t)&unk_302D0, (uint64_t)v9);

  swift_release();
  return ((uint64_t (*)(void (*)(), uint64_t, void))_swift_task_switch)(sub_ACE4, v2, 0);
}

void sub_ACE4()
{
  double v1 = *(double *)(v0 + 600);
  uint64_t v2 = *(void *)(v0 + 376);
  double v3 = CFAbsoluteTimeGetCurrent() - *(double *)(v2 + OBJC_IVAR___AXMotionCuesServer__startTime);
  if (v3 <= 0.0) {
    double v4 = 0.0;
  }
  else {
    double v4 = v1 / v3;
  }
  if (qword_2FC30 != -1) {
    swift_once();
  }
  uint64_t v6 = *(void *)(v0 + 400);
  uint64_t v5 = *(void *)(v0 + 408);
  uint64_t v7 = *(void *)(v0 + 392);
  uint64_t v8 = sub_5690(v7, (uint64_t)MCLog);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
  os_log_type_t v9 = sub_1EB70();
  os_log_type_t v10 = sub_1EE20();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = *(void *)(v0 + 648);
    uint64_t v12 = *(void *)(v0 + 640);
    uint64_t v13 = *(void *)(v0 + 632);
    uint64_t v14 = *(void *)(v0 + 624);
    uint64_t v15 = *(void *)(v0 + 616);
    uint64_t v16 = *(void *)(v0 + 608);
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v17 = 134219776;
    *(double *)(v0 + 312) = v3;
    sub_1EEE0();
    *(_WORD *)(v17 + 12) = 2048;
    *(double *)(v0 + 320) = v4;
    sub_1EEE0();
    *(_WORD *)(v17 + 22) = 2048;
    *(void *)(v0 + 328) = v16;
    sub_1EEE0();
    *(_WORD *)(v17 + 32) = 2048;
    *(void *)(v0 + 336) = v15;
    sub_1EEE0();
    *(_WORD *)(v17 + 42) = 2048;
    *(void *)(v0 + 344) = v14;
    sub_1EEE0();
    *(_WORD *)(v17 + 52) = 2048;
    *(void *)(v0 + 352) = v13;
    sub_1EEE0();
    *(_WORD *)(v17 + 62) = 2048;
    *(void *)(v0 + 360) = v12;
    sub_1EEE0();
    *(_WORD *)(v17 + 72) = 2048;
    *(void *)(v0 + 368) = v11;
    sub_1EEE0();
    _os_log_impl(&dword_0, v9, v10, "Motion Cues UI stopped: duration=%f seconds, frameRate=%f, frameTimeAverage=%f, frameTimeMin=%f, frameTimeMax=%f, modelTimeAverage=%f, modelTimeMin=%f, modelTimeMax=%f", (uint8_t *)v17, 0x52u);
    swift_slowDealloc();
  }
  uint64_t v19 = *(void *)(v0 + 440);
  uint64_t v18 = *(void *)(v0 + 448);
  uint64_t v21 = *(void *)(v0 + 400);
  uint64_t v20 = *(void *)(v0 + 408);
  uint64_t v22 = *(void *)(v0 + 392);
  uint64_t v23 = *(void *)(v0 + 376);

  (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v20, v22);
  uint64_t v24 = *(void **)(v23 + v18);
  *(void *)(v23 + v18) = 0;

  *(unsigned char *)(v23 + v19) = 0;
  if (kAXMotionCuesStopNotification)
  {
    uint64_t v25 = (__CFString *)kAXMotionCuesStopNotification;
    uint64_t v26 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v26, v25, 0, 0, 1u);

    sub_55DC(&qword_302D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_20050;
    *(void *)(inited + 32) = sub_1EC20();
    *(void *)(inited + 40) = v28;
    *(NSNumber *)(inited + 48) = sub_1EDC0();
    *(void *)(inited + 56) = 0x746152656D617266;
    *(void *)(inited + 64) = 0xE900000000000065;
    *(NSNumber *)(inited + 72) = sub_1EDC0();
    *(void *)(inited + 80) = 0xD000000000000010;
    *(void *)(inited + 88) = 0x8000000000021010;
    *(NSNumber *)(inited + 96) = sub_1EDC0();
    strcpy((char *)(inited + 104), "frameTimeMin");
    *(unsigned char *)(inited + 117) = 0;
    *(_WORD *)(inited + 118) = -5120;
    *(NSNumber *)(inited + 120) = sub_1EDC0();
    strcpy((char *)(inited + 128), "frameTimeMax");
    *(unsigned char *)(inited + 141) = 0;
    *(_WORD *)(inited + 142) = -5120;
    *(NSNumber *)(inited + 144) = sub_1EDC0();
    *(void *)(inited + 152) = 0xD000000000000010;
    *(void *)(inited + 160) = 0x8000000000021030;
    *(NSNumber *)(inited + 168) = sub_1EDC0();
    strcpy((char *)(inited + 176), "modelTimeMin");
    *(unsigned char *)(inited + 189) = 0;
    *(_WORD *)(inited + 190) = -5120;
    *(NSNumber *)(inited + 192) = sub_1EDC0();
    strcpy((char *)(inited + 200), "modelTimeMax");
    *(unsigned char *)(inited + 213) = 0;
    *(_WORD *)(inited + 214) = -5120;
    *(NSNumber *)(inited + 216) = sub_1EDC0();
    unint64_t v29 = sub_71B8(inited, &qword_302E0);
    id v30 = AXMotionCuesAnalyticsStopEvent;
    sub_E4C4(v29);
    swift_bridgeObjectRelease();
    sub_1124C(0, &qword_30248);
    Class isa = sub_1EBD0().super.isa;
    swift_bridgeObjectRelease();
    AnalyticsSendEvent();

    sub_CADC();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v32 = *(void (**)(void))(v0 + 8);
    v32();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_B254()
{
  uint64_t v1 = sub_1EB90();
  __chkstk_darwin(v1);
  uint64_t v2 = OBJC_IVAR___AXMotionCuesServer__inVehicleEventListener;
  if (*(void *)(v0 + OBJC_IVAR___AXMotionCuesServer__inVehicleEventListener))
  {
    swift_retain();
    sub_4964();
    swift_release();
    *(void *)(v0 + v2) = 0;
    swift_release();
  }
  uint64_t v3 = OBJC_IVAR___AXMotionCuesServer__inVehicleEventTask;
  if (*(void *)(v0 + OBJC_IVAR___AXMotionCuesServer__inVehicleEventTask))
  {
    swift_retain();
    sub_1EDA0();
    swift_release();
  }
  *(void *)(v0 + v3) = 0;
  uint64_t result = swift_release();
  *(unsigned char *)(v0 + OBJC_IVAR___AXMotionCuesServer__isInVehicle) = 0;
  return result;
}

void sub_B5A4(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [self sharedServiceManager];
  if (!v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v7 = v6;
  id v8 = [v6 clientsForService:v4];

  if (v8)
  {
    sub_1124C(0, &qword_302B8);
    unint64_t v9 = sub_1EC80();

    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v10 = sub_1F020();
      swift_bridgeObjectRelease();
      if (v10) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v10 = *(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8));
      if (v10)
      {
LABEL_5:
        uint64_t v11 = self;
        if (v10 >= 1)
        {
          uint64_t v12 = (void *)v11;
          uint64_t v13 = 0;
          char v14 = a1 & 1;
          do
          {
            if ((v9 & 0xC000000000000001) != 0) {
              id v15 = (id)sub_1EFE0();
            }
            else {
              id v15 = *(id *)(v9 + 8 * v13 + 32);
            }
            uint64_t v16 = v15;
            sub_55DC(&qword_302C0);
            uint64_t inited = swift_initStackObject();
            *(_OWORD *)(inited + 16) = xmmword_20060;
            ++v13;
            sub_1EF90();
            *(void *)(inited + 96) = &type metadata for Bool;
            *(unsigned char *)(inited + 72) = v14;
            sub_7088(inited);
            Class isa = sub_1EBD0().super.isa;
            swift_bridgeObjectRelease();
            id v19 = [v12 mainAccessQueue];
            [v16 sendAsynchronousMessage:isa withIdentifier:a4 targetAccessQueue:v19 completion:0];
          }
          while (v10 != v13);
LABEL_15:
          swift_bridgeObjectRelease();
          return;
        }
        __break(1u);
        goto LABEL_17;
      }
    }
    goto LABEL_15;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_B834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  uint64_t v6 = sub_1EB90();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for InVehicleEvent(0);
  v5[10] = v7;
  v5[11] = *(void *)(v7 - 8);
  v5[12] = swift_task_alloc();
  sub_55DC(&qword_30318);
  v5[13] = swift_task_alloc();
  uint64_t v8 = sub_55DC(&qword_30320);
  v5[14] = v8;
  v5[15] = *(void *)(v8 - 8);
  v5[16] = swift_task_alloc();
  v5[17] = sub_1ED10();
  v5[18] = sub_1ED00();
  uint64_t v10 = sub_1ECE0();
  v5[19] = v10;
  v5[20] = v9;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_BA18, v10, v9);
}

uint64_t sub_BA18()
{
  sub_55DC(&qword_302F8);
  sub_1ED70();
  uint64_t v1 = OBJC_IVAR___AXMotionCuesServer__needsBannerForInVehicleStateChange;
  v0[21] = OBJC_IVAR___AXMotionCuesServer__isInVehicle;
  v0[22] = v1;
  v0[23] = OBJC_IVAR___AXMotionCuesServer__didSnoozeCuesFromBanner;
  uint64_t v2 = sub_1ED00();
  v0[24] = v2;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[25] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_BB0C;
  uint64_t v4 = v0[13];
  uint64_t v5 = v0[14];
  return AsyncStream.Iterator.next(isolation:)(v4, v2, &protocol witness table for MainActor, v5);
}

uint64_t sub_BB0C()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_BC50, v3, v2);
}

uint64_t sub_BC50()
{
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 80);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 + 88) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(void, void))(*(void *)(v0 + 120) + 8))(*(void *)(v0 + 128), *(void *)(v0 + 112));
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
    return v3();
  }
  else
  {
    uint64_t v5 = *(void *)(v0 + 168);
    uint64_t v6 = *(void *)(v0 + 96);
    uint64_t v7 = *(void *)(v0 + 48);
    sub_116C8(v1, v6);
    int v8 = *(unsigned __int8 *)(v6 + *(int *)(v2 + 20));
    if (v8 == *(unsigned __int8 *)(v7 + v5))
    {
      sub_6220(*(void *)(v0 + 96));
      uint64_t v23 = sub_1ED00();
      *(void *)(v0 + 192) = v23;
      uint64_t v24 = (void *)swift_task_alloc();
      *(void *)(v0 + 200) = v24;
      void *v24 = v0;
      v24[1] = sub_BB0C;
      uint64_t v25 = *(void *)(v0 + 104);
      uint64_t v26 = *(void *)(v0 + 112);
      return AsyncStream.Iterator.next(isolation:)(v25, v23, &protocol witness table for MainActor, v26);
    }
    else
    {
      uint64_t v10 = *(void *)(v0 + 176);
      uint64_t v9 = *(void *)(v0 + 184);
      uint64_t v11 = *(void *)(v0 + 48);
      *(unsigned char *)(v11 + *(void *)(v0 + 168)) = v8;
      *(unsigned char *)(v11 + v10) = 1;
      *(unsigned char *)(v11 + v9) = 0;
      if (qword_2FC30 != -1) {
        swift_once();
      }
      uint64_t v13 = *(void *)(v0 + 64);
      uint64_t v12 = *(void *)(v0 + 72);
      id v15 = *(void **)(v0 + 48);
      uint64_t v14 = *(void *)(v0 + 56);
      uint64_t v16 = sub_5690(v14, (uint64_t)MCLog);
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v12, v16, v14);
      id v17 = v15;
      uint64_t v18 = sub_1EB70();
      os_log_type_t v19 = sub_1EE20();
      if (os_log_type_enabled(v18, v19))
      {
        uint64_t v20 = *(void *)(v0 + 168);
        uint64_t v21 = *(unsigned __int8 **)(v0 + 48);
        uint64_t v22 = swift_slowAlloc();
        *(_DWORD *)uint64_t v22 = 67109120;
        *(_DWORD *)(v22 + 4) = v21[v20];

        _os_log_impl(&dword_0, v18, v19, "In-vehicle state changed: %{BOOL}d", (uint8_t *)v22, 8u);
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(void, void))(*(void *)(v0 + 64) + 8))(*(void *)(v0 + 72), *(void *)(v0 + 56));
      uint64_t v27 = (void *)swift_task_alloc();
      *(void *)(v0 + 208) = v27;
      *uint64_t v27 = v0;
      v27[1] = sub_BFBC;
      return sub_9108();
    }
  }
}

uint64_t sub_BFBC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_C0DC, v3, v2);
}

uint64_t sub_C0DC()
{
  sub_6220(v0[12]);
  uint64_t v1 = sub_1ED00();
  v0[24] = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  v0[25] = (uint64_t)v2;
  *uint64_t v2 = v0;
  v2[1] = sub_BB0C;
  uint64_t v3 = v0[13];
  uint64_t v4 = v0[14];
  return AsyncStream.Iterator.next(isolation:)(v3, v1, &protocol witness table for MainActor, v4);
}

id sub_C19C(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_55DC(&qword_2FFC8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = &v16[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id result = [self sharedServiceManager];
  if (result)
  {
    uint64_t v7 = result;
    NSString v8 = sub_1EC10();
    swift_beginAccess();
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    [v7 beginTransactionWithIdentifier:v8 forService:Strong];

    uint64_t v10 = sub_1ED30();
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v5, 1, 1, v10);
    uint64_t v11 = swift_allocObject();
    swift_beginAccess();
    uint64_t v12 = (void *)swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectWeakInit();

    sub_1ED10();
    id v13 = a2;
    swift_retain();
    uint64_t v14 = sub_1ED00();
    id v15 = (void *)swift_allocObject();
    _OWORD v15[2] = v14;
    v15[3] = &protocol witness table for MainActor;
    v15[4] = a2;
    v15[5] = v11;
    swift_release();
    sub_860C((uint64_t)v5, (uint64_t)&unk_302F0, (uint64_t)v15);
    return (id)swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_C3B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[12] = a4;
  v5[13] = a5;
  uint64_t v6 = sub_1EB90();
  v5[14] = v6;
  v5[15] = *(void *)(v6 - 8);
  v5[16] = swift_task_alloc();
  sub_1ED10();
  v5[17] = sub_1ED00();
  uint64_t v8 = sub_1ECE0();
  v5[18] = v8;
  v5[19] = v7;
  return ((uint64_t (*)(id (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_C4A8, v8, v7);
}

id sub_C4A8()
{
  if (qword_2FC30 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[12];
  uint64_t v3 = v0[15];
  uint64_t v2 = v0[16];
  uint64_t v4 = v0[14];
  uint64_t v5 = sub_5690(v4, (uint64_t)MCLog);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  uint64_t v6 = v1;
  uint64_t v7 = sub_1EB70();
  os_log_type_t v8 = sub_1EE00();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = v0[12];
    uint64_t v10 = -1;
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 134217984;
    if (v9) {
      uint64_t v10 = (uint64_t)[v6 backlightState];
    }
    v0[11] = v10;
    sub_1EEE0();

    _os_log_impl(&dword_0, v7, v8, "Screen state changed: backlightState=%ld", v11, 0xCu);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v7 = v6;
  }
  uint64_t v13 = v0[15];
  uint64_t v12 = v0[16];
  uint64_t v14 = v0[14];

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[20] = Strong;
  if (Strong)
  {
    uint64_t v16 = (void *)swift_task_alloc();
    v0[21] = v16;
    void *v16 = v0;
    v16[1] = sub_C7E4;
    return (id)sub_9108();
  }
  else
  {
    swift_release();
    id result = [self sharedServiceManager];
    if (result)
    {
      uint64_t v18 = result;
      NSString v19 = sub_1EC10();
      swift_beginAccess();
      uint64_t v20 = (void *)swift_unknownObjectWeakLoadStrong();
      [v18 endTransactionWithIdentifier:v19 forService:v20];

      swift_task_dealloc();
      uint64_t v21 = (uint64_t (*)(void))v0[1];
      return (id)v21();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_C7E4()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void **)(*v0 + 160);
  swift_task_dealloc();

  uint64_t v3 = *(void *)(v1 + 152);
  uint64_t v4 = *(void *)(v1 + 144);
  return ((uint64_t (*)(id (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_C924, v4, v3);
}

id sub_C924()
{
  swift_release();
  id result = [self sharedServiceManager];
  if (result)
  {
    uint64_t v2 = result;
    NSString v3 = sub_1EC10();
    swift_beginAccess();
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    [v2 endTransactionWithIdentifier:v3 forService:Strong];

    swift_task_dealloc();
    uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
    return (id)v5();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_CA3C(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7 = *(void (**)(id, void *, void *))(a1 + 32);
  swift_retain();
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  v7(v10, a3, a4);
  swift_release();
}

void sub_CADC()
{
  swift_getObjectType();
  uint64_t v1 = sub_1EBA0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  uint64_t v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1EBC0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  id v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = *(void **)&v0[OBJC_IVAR___AXMotionCuesServer__screenMonitor];
  if (!v9
    || (id v10 = [v9 currentLayout]) == 0
    || (uint64_t v11 = v10,
        unint64_t v12 = (unint64_t)[v10 backlightState],
        v11,
        (v12 & 0xFFFFFFFFFFFFFFFELL) == 2))
  {
    if ((_AXSMotionCuesShouldShowBanner() || !_AXSMotionCuesMode())
      && (_AXSMotionCuesMode()
       || v0[OBJC_IVAR___AXMotionCuesServer__needsBannerForInVehicleStateChange] == 1))
    {
      uint64_t v39 = v8;
      uint64_t v40 = v6;
      uint64_t v41 = v4;
      uint64_t v42 = v5;
      uint64_t v43 = v2;
      uint64_t v37 = v1;
      _AXSSetMotionCuesShouldShowBanner();
      v0[OBJC_IVAR___AXMotionCuesServer__needsBannerForInVehicleStateChange] = 0;
      int v13 = 0;
      if (!_AXSMotionCuesMode()) {
        int v13 = v0[OBJC_IVAR___AXMotionCuesServer__isRunning];
      }
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v15 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
      v35._countAndFlagsBits = 0xE000000000000000;
      v45._object = (void *)0x8000000000020EE0;
      v45._countAndFlagsBits = 0xD000000000000013;
      v46.value._countAndFlagsBits = 0x617A696C61636F4CLL;
      v46.value._object = (void *)0xEB00000000656C62;
      v16.super.Class isa = v15;
      v47._countAndFlagsBits = 0;
      v47._object = (void *)0xE000000000000000;
      uint64_t v17 = sub_1EAC0(v45, v46, v16, v47, v35);
      uint64_t v19 = v18;

      uint64_t v20 = sub_CFD8();
      uint64_t v22 = v21;
      sub_D1E4();
      uint64_t v24 = v23;
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      if (v13)
      {
        uint64_t v26 = swift_allocObject();
        *(void *)(v26 + 16) = v0;
        uint64_t v27 = v0;
        uint64_t v25 = sub_11004;
      }
      sub_1124C(0, &qword_30260);
      uint64_t v38 = sub_1EE30();
      uint64_t v28 = swift_allocObject();
      swift_unknownObjectWeakInit();
      unint64_t v29 = (void *)swift_allocObject();
      v29[2] = v28;
      v29[3] = v17;
      v29[4] = v19;
      v29[5] = v20;
      v29[6] = v22;
      v29[7] = v24;
      v29[8] = v25;
      v29[9] = v26;
      aBlock[4] = sub_10EE4;
      aBlock[5] = v29;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_14E78;
      aBlock[3] = &unk_293B0;
      id v30 = _Block_copy(aBlock);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      id v36 = v24;
      sub_10F08((uint64_t)v25);
      swift_release();
      uint64_t v31 = v39;
      sub_1EBB0();
      aBlock[0] = &_swiftEmptyArrayStorage;
      sub_10F18(&qword_30268, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      sub_55DC(&qword_30270);
      sub_10F60();
      uint64_t v32 = v41;
      uint64_t v33 = v37;
      sub_1EF00();
      NSString v34 = (void *)v38;
      sub_1EE40();
      _Block_release(v30);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      sub_10FBC((uint64_t)v25);
      (*(void (**)(char *, uint64_t))(v43 + 8))(v32, v33);
      (*(void (**)(char *, uint64_t))(v40 + 8))(v31, v42);
    }
  }
}

uint64_t sub_CFD8()
{
  swift_getObjectType();
  int v1 = _AXSMotionCuesMode();
  if (v1 == 2)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    uint64_t v3 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
    v4._countAndFlagsBits = 0xD000000000000011;
    v13._countAndFlagsBits = 0xE000000000000000;
    v4._object = (void *)0x8000000000020F60;
    goto LABEL_5;
  }
  if (v1 == 1)
  {
    uint64_t v2 = swift_getObjCClassFromMetadata();
    uint64_t v3 = (objc_class *)[self bundleForClass:v2];
    v13._countAndFlagsBits = 0xE000000000000000;
    v4._object = (void *)0x8000000000020F80;
    v4._countAndFlagsBits = 0xD000000000000010;
LABEL_5:
    v15.value._countAndFlagsBits = 0x617A696C61636F4CLL;
    v15.value._object = (void *)0xEB00000000656C62;
    v6.super.Class isa = v3;
    v17._countAndFlagsBits = 0;
    v17._object = (void *)0xE000000000000000;
    uint64_t v7 = sub_1EAC0(v4, v15, v6, v17, v13);
    goto LABEL_13;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR___AXMotionCuesServer__isRunning)) {
    id v8 = (void *)0x8000000000020F80;
  }
  else {
    id v8 = (void *)0x8000000000020F60;
  }
  if (*(unsigned char *)(v0 + OBJC_IVAR___AXMotionCuesServer__isRunning)) {
    uint64_t v9 = 0xD000000000000010;
  }
  else {
    uint64_t v9 = 0xD000000000000011;
  }
  uint64_t v10 = swift_getObjCClassFromMetadata();
  uint64_t v3 = (objc_class *)[self bundleForClass:v10];
  v13._countAndFlagsBits = 0xE000000000000000;
  v14._countAndFlagsBits = v9;
  v14._object = v8;
  v16.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v16.value._object = (void *)0xEB00000000656C62;
  v11.super.Class isa = v3;
  v18._countAndFlagsBits = 0;
  v18._object = (void *)0xE000000000000000;
  uint64_t v7 = sub_1EAC0(v14, v16, v11, v18, v13);
  swift_bridgeObjectRelease();
LABEL_13:

  return v7;
}

void sub_D1E4()
{
  int v1 = _AXSMotionCuesMode();
  if (v1 != 2)
  {
    if (v1 != 1) {
      goto LABEL_7;
    }
    id v2 = [self systemBlueColor];
    id v3 = [self configurationWithHierarchicalColor:v2];

    NSString v4 = sub_1EC10();
    id v5 = [self _systemImageNamed:v4 withConfiguration:v3];

    if (v5) {
      return;
    }
    __break(1u);
  }
  id v6 = [self labelColor];
  uint64_t v0 = (unsigned __int8 *)[self configurationWithHierarchicalColor:v6];

  NSString v7 = sub_1EC10();
  id v8 = [self _systemImageNamed:v7 withConfiguration:v0];

  if (v8) {
    return;
  }
  __break(1u);
LABEL_7:
  int v9 = v0[OBJC_IVAR___AXMotionCuesServer__isRunning];
  uint64_t v10 = self;
  NSBundle v11 = &selRef_systemBlueColor;
  if (!v9) {
    NSBundle v11 = &selRef_labelColor;
  }
  id v12 = [v10 *v11];
  id v13 = [self configurationWithHierarchicalColor:v12];

  NSString v14 = sub_1EC10();
  id v15 = [self _systemImageNamed:v14 withConfiguration:v13];

  if (!v15) {
    __break(1u);
  }
}

uint64_t sub_D44C(unsigned char *a1)
{
  sub_55DC(&qword_2FFC8);
  __chkstk_darwin();
  id v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6718();
  sub_1DAB0();
  swift_release();
  a1[OBJC_IVAR___AXMotionCuesServer__didSnoozeCuesFromBanner] = 1;
  uint64_t v4 = sub_1ED30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  id v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = a1;
  id v6 = a1;
  sub_860C((uint64_t)v3, (uint64_t)&unk_30288, (uint64_t)v5);
  return swift_release();
}

uint64_t sub_D588(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v4 = (void *)result;
    sub_6718();

    sub_1D28C(a2);
    return swift_release();
  }
  return result;
}

uint64_t sub_D600()
{
  int v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_118B8;
  return sub_A178();
}

uint64_t sub_D690()
{
  v1[16] = v0;
  sub_55DC(&qword_2FFC8);
  v1[17] = swift_task_alloc();
  uint64_t v2 = sub_1EB90();
  v1[18] = v2;
  v1[19] = *(void *)(v2 - 8);
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  if (qword_2FC38 != -1) {
    swift_once();
  }
  v1[24] = static AXMotionCuesActor.shared;
  return ((uint64_t (*)(uint64_t (*)()))_swift_task_switch)(sub_D7E0);
}

uint64_t sub_D7E0()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = OBJC_IVAR___AXMotionCuesServer__isRunning;
  v0[25] = OBJC_IVAR___AXMotionCuesServer__isRunning;
  if (*(unsigned char *)(v1 + v2) == 1)
  {
    if (qword_2FC30 != -1) {
      swift_once();
    }
    uint64_t v3 = v0[23];
    uint64_t v4 = v0[18];
    uint64_t v5 = v0[19];
    uint64_t v6 = sub_5690(v4, (uint64_t)MCLog);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v4);
    NSString v7 = sub_1EB70();
    os_log_type_t v8 = sub_1EE20();
    if (os_log_type_enabled(v7, v8))
    {
      int v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_0, v7, v8, "Already running Motion Cues, no need to start", v9, 2u);
      swift_slowDealloc();
    }
    uint64_t v10 = v0[23];
    uint64_t v11 = v0[18];
    uint64_t v12 = v0[19];

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v13 = (uint64_t (*)(void))v0[1];
    return v13();
  }
  else
  {
    sub_1C7AC();
    *(unsigned char *)(v1 + v2) = 1;
    if (!_AXSMotionCuesActive()) {
      _AXSSetMotionCuesActive();
    }
    sub_1A7A8();
    id v15 = (void *)swift_task_alloc();
    v0[26] = v15;
    void *v15 = v0;
    v15[1] = sub_DC50;
    return sub_10894(0);
  }
}

uint64_t sub_DC50(uint64_t a1)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 216) = a1;
  *(void *)(v4 + 224) = v1;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 192);
  if (v1) {
    uint64_t v6 = sub_E0E0;
  }
  else {
    uint64_t v6 = sub_DD84;
  }
  return ((uint64_t (*)(void *, uint64_t, void))_swift_task_switch)(v6, v5, 0);
}

void sub_DD84()
{
  if (qword_2FC30 != -1) {
    swift_once();
  }
  uint64_t v1 = v0[22];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v4 = sub_5690(v2, (uint64_t)MCLog);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  uint64_t v5 = sub_1EB70();
  os_log_type_t v6 = sub_1EE20();
  if (os_log_type_enabled(v5, v6))
  {
    NSString v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)NSString v7 = 0;
    _os_log_impl(&dword_0, v5, v6, "Motion Cues UI started", v7, 2u);
    swift_slowDealloc();
  }
  uint64_t v8 = (void *)v0[27];
  uint64_t v9 = v0[22];
  uint64_t v10 = v0[18];
  uint64_t v11 = v0[19];
  uint64_t v12 = v0[16];

  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  id v13 = *(void **)(v12 + OBJC_IVAR___AXMotionCuesServer__mainDisplayViewController);
  *(void *)(v12 + OBJC_IVAR___AXMotionCuesServer__mainDisplayViewController) = v8;
  id v14 = v8;

  if (kAXMotionCuesStartNotification)
  {
    id v15 = (void *)v0[27];
    uint64_t v16 = v0[16];
    uint64_t v17 = v0[17];
    Swift::String v18 = (__CFString *)kAXMotionCuesStartNotification;
    uint64_t v19 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v19, v18, 0, 0, 1u);

    *(CFAbsoluteTime *)(v16 + OBJC_IVAR___AXMotionCuesServer__startTime) = CFAbsoluteTimeGetCurrent();
    id v20 = AXMotionCuesAnalyticsStartEvent;
    sub_71B8((uint64_t)&_swiftEmptyArrayStorage, &qword_30290);
    sub_1124C(0, &qword_30248);
    Class isa = sub_1EBD0().super.isa;
    swift_bridgeObjectRelease();
    AnalyticsSendEvent();

    uint64_t v22 = sub_1ED30();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v17, 1, 1, v22);
    sub_1ED10();
    id v23 = v15;
    uint64_t v24 = sub_1ED00();
    uint64_t v25 = (void *)swift_allocObject();
    v25[2] = v24;
    v25[3] = &protocol witness table for MainActor;
    v25[4] = v23;
    sub_860C(v17, (uint64_t)&unk_30258, (uint64_t)v25);
    swift_release();
    sub_CADC();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v26 = (void (*)(void))v0[1];
    v26();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_E0E0()
{
  *(unsigned char *)(v0[16] + v0[25]) = 0;
  if (_AXSMotionCuesActive()) {
    _AXSSetMotionCuesActive();
  }
  if (qword_2FC30 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[19];
  uint64_t v1 = v0[20];
  uint64_t v3 = v0[18];
  uint64_t v4 = sub_5690(v3, (uint64_t)MCLog);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v5 = sub_1EB70();
  os_log_type_t v6 = sub_1EE10();
  if (os_log_type_enabled(v5, v6))
  {
    NSString v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)NSString v7 = 138412290;
    swift_errorRetain();
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[14] = v9;
    sub_1EEE0();
    *uint64_t v8 = v9;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl(&dword_0, v5, v6, "Coordinator did not show Motion cues main screen %@", v7, 0xCu);
    sub_55DC(&qword_30240);
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
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_E37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a4;
  sub_1ED10();
  *(void *)(v4 + 24) = sub_1ED00();
  uint64_t v6 = sub_1ECE0();
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_E414, v6, v5);
}

uint64_t sub_E414()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_release();
  id v2 = [v1 view];
  if (v2)
  {
    uint64_t v3 = v2;
    id v4 = [v2 layer];
    [v4 setDisableUpdateMask:18];
  }
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

void sub_E4C4(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_55DC(&qword_30290);
    id v2 = (void *)sub_1F030();
  }
  else
  {
    id v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  swift_bridgeObjectRetain();
  int64_t i = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  int64_t v11 = i + 1;
  if (__OFADD__(i, 1)) {
    goto LABEL_35;
  }
  if (v11 >= v27) {
    goto LABEL_32;
  }
  unint64_t v12 = *(void *)(v28 + 8 * v11);
  int64_t v13 = i + 1;
  if (!v12)
  {
    int64_t v13 = i + 2;
    if (i + 2 >= v27) {
      goto LABEL_32;
    }
    unint64_t v12 = *(void *)(v28 + 8 * v13);
    if (!v12)
    {
      int64_t v13 = i + 3;
      if (i + 3 >= v27) {
        goto LABEL_32;
      }
      unint64_t v12 = *(void *)(v28 + 8 * v13);
      if (!v12)
      {
        int64_t v13 = i + 4;
        if (i + 4 >= v27) {
          goto LABEL_32;
        }
        unint64_t v12 = *(void *)(v28 + 8 * v13);
        if (!v12)
        {
          int64_t v14 = i + 5;
          if (i + 5 < v27)
          {
            unint64_t v12 = *(void *)(v28 + 8 * v14);
            if (v12)
            {
              int64_t v13 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              int64_t v13 = v14 + 1;
              if (__OFADD__(v14, 1)) {
                goto LABEL_36;
              }
              if (v13 >= v27) {
                break;
              }
              unint64_t v12 = *(void *)(v28 + 8 * v13);
              ++v14;
              if (v12) {
                goto LABEL_26;
              }
            }
          }
LABEL_32:
          sub_1139C();
          return;
        }
      }
    }
  }
LABEL_26:
  unint64_t v5 = (v12 - 1) & v12;
  unint64_t v10 = __clz(__rbit64(v12)) + (v13 << 6);
  for (i = v13; ; unint64_t v10 = v9 | (i << 6))
  {
    id v15 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v10);
    uint64_t v17 = *v15;
    uint64_t v16 = v15[1];
    Swift::String v18 = *(void **)(*(void *)(a1 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    id v19 = v18;
    unint64_t v20 = sub_FD80(v17, v16);
    unint64_t v21 = v20;
    if (v22)
    {
      uint64_t v7 = (uint64_t *)(v2[6] + 16 * v20);
      swift_bridgeObjectRelease();
      uint64_t *v7 = v17;
      v7[1] = v16;
      uint64_t v8 = v2[7];

      *(void *)(v8 + 8 * v21) = v19;
      if (!v5) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (v2[2] >= v2[3]) {
      break;
    }
    *(void *)((char *)v2 + ((v20 >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << v20;
    id v23 = (uint64_t *)(v2[6] + 16 * v20);
    uint64_t *v23 = v17;
    v23[1] = v16;
    *(void *)(v2[7] + 8 * v20) = v19;
    uint64_t v24 = v2[2];
    BOOL v25 = __OFADD__(v24, 1);
    uint64_t v26 = v24 + 1;
    if (v25) {
      goto LABEL_34;
    }
    v2[2] = v26;
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    unint64_t v9 = __clz(__rbit64(v5));
    v5 &= v5 - 1;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
}

uint64_t sub_E768(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[16] = a4;
  v5[17] = a5;
  v5[15] = a1;
  sub_1ED10();
  v5[18] = sub_1ED00();
  uint64_t v7 = sub_1ECE0();
  v5[19] = v7;
  v5[20] = v6;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_E804, v7, v6);
}

uint64_t sub_E804()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v3 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v5 = objc_allocWithZone((Class)type metadata accessor for AXMotionCuesRootViewController());
  uint64_t v6 = swift_retain();
  uint64_t v7 = sub_14FF4(v6, (uint64_t)sub_111E8, v3, (uint64_t)sub_11218, v4);
  v0[21] = v7;
  id v8 = sub_6694();
  v0[22] = v8;
  uint64_t v9 = v7;
  NSString v10 = sub_1EC10();
  v0[23] = v10;
  v0[2] = v0;
  v0[7] = v0 + 24;
  v0[3] = sub_EA1C;
  uint64_t v11 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_ECA0;
  v0[13] = &unk_29450;
  v0[14] = v11;
  [v8 addContentViewController:v9 withUserInteractionEnabled:0 forService:v1 forSceneClientIdentifier:v10 context:0 userInterfaceStyle:1 forWindowScene:v2 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_EA1C()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 160);
  uint64_t v2 = *(void *)(*(void *)v0 + 152);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_EB24, v2, v1);
}

uint64_t sub_EB24()
{
  uint64_t v1 = *(void **)(v0 + 176);
  uint64_t v2 = *(void **)(v0 + 184);
  uint64_t v3 = *(void **)(v0 + 168);
  swift_release();
  int v4 = *(unsigned __int8 *)(v0 + 192);

  id v5 = *(void **)(v0 + 168);
  if (v4 == 1)
  {
    **(void **)(v0 + 120) = v5;
  }
  else
  {
    sub_56C8();
    swift_allocError();
    void *v7 = 0xD00000000000002CLL;
    v7[1] = 0x8000000000020FC0;
    swift_willThrow();
  }
  uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

void sub_EC18(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    NSString v10 = (void *)Strong;
    sub_B5A4(a1 & 1, a3, a4, a5);
  }
}

uint64_t sub_ECA0(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return _swift_continuation_resume();
}

uint64_t sub_ECC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1ED30();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1ED20();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10634(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1ECE0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  type metadata accessor for AXMotionCuesRootViewController();
  return swift_task_create();
}

uint64_t sub_EE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1ED30();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1ED20();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      return swift_task_create();
    }
    goto LABEL_3;
  }
  sub_10634(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1ECE0();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_EFC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[15] = a4;
  v5[16] = a5;
  sub_1ED10();
  v5[17] = sub_1ED00();
  uint64_t v7 = sub_1ECE0();
  v5[18] = v7;
  v5[19] = v6;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_F058, v7, v6);
}

uint64_t sub_F058()
{
  uint64_t v1 = v0[15];
  uint64_t v2 = v0[16];
  id v3 = sub_6694();
  v0[20] = v3;
  v0[2] = v0;
  v0[7] = v0 + 21;
  v0[3] = sub_F178;
  uint64_t v4 = swift_continuation_init();
  v0[10] = _NSConcreteStackBlock;
  v0[11] = 0x40000000;
  v0[12] = sub_ECA0;
  v0[13] = &unk_29490;
  v0[14] = v4;
  [v3 removeContentViewController:v2 withUserInteractionEnabled:0 forService:v1 context:0 completion:v0 + 10];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_F178()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 152);
  uint64_t v2 = *(void *)(*(void *)v0 + 144);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_F280, v2, v1);
}

uint64_t sub_F280()
{
  uint64_t v1 = *(void **)(v0 + 160);
  swift_release();
  int v2 = *(unsigned __int8 *)(v0 + 168);

  if (v2 != 1)
  {
    sub_56C8();
    swift_allocError();
    void *v4 = 0xD00000000000002ELL;
    v4[1] = 0x8000000000021050;
    swift_willThrow();
  }
  id v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

UIWindowLevel __swiftcall AXMotionCuesServer.desiredWindowLevel(forContentViewController:userInteractionEnabled:)(UIViewController_optional forContentViewController, Swift::Bool userInteractionEnabled)
{
  return AX_motionCuesWindowLevel;
}

id AXMotionCuesServer.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t AXMotionCuesError.message.getter(uint64_t a1)
{
  return a1;
}

unint64_t AXMotionCuesError.description.getter(uint64_t a1, void *a2)
{
  sub_1EFC0(21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v5._countAndFlagsBits = a1;
  v5._object = a2;
  sub_1EC40(v5);
  swift_bridgeObjectRelease();
  return 0xD000000000000013;
}

unint64_t sub_F54C()
{
  return AXMotionCuesError.description.getter(*(void *)v0, *(void **)(v0 + 8));
}

uint64_t sub_F554(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_F630;
  return v6(a1);
}

uint64_t sub_F630()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_F728(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_F7FC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_105D4((uint64_t)v12, *a3);
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
      sub_105D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10584((uint64_t)v12);
  return v7;
}

uint64_t sub_F7FC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1EEF0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_F9B8(a5, a6);
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
  uint64_t v8 = sub_1EFF0();
  if (!v8)
  {
    sub_1F000();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1F040();
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

uint64_t sub_F9B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_FA50(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_FC30(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_FC30(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_FA50(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_FBC8(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1EFD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1F000();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1EC50();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1F040();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1F000();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_FBC8(uint64_t a1, uint64_t a2)
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
  sub_55DC(&qword_30200);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_FC30(char a1, int64_t a2, char a3, char *a4)
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
    sub_55DC(&qword_30200);
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
  uint64_t result = sub_1F040();
  __break(1u);
  return result;
}

unint64_t sub_FD80(uint64_t a1, uint64_t a2)
{
  sub_1F0E0();
  sub_1EC30();
  Swift::Int v4 = sub_1F0F0();

  return sub_FE3C(a1, a2, v4);
}

unint64_t sub_FDF8(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_1EF70(*(void *)(v2 + 40));

  return sub_FF20(a1, v4);
}

unint64_t sub_FE3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1F060() & 1) == 0)
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
      while (!v14 && (sub_1F060() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_FF20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_117A4(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_1EF80();
      sub_11800((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

Swift::Int sub_FFE8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_55DC((uint64_t *)&unk_30340);
    uint64_t v3 = sub_1EFB0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v6 = a1 + 32;
    while (1)
    {
      sub_117A4(v6 + 40 * v4, (uint64_t)v21);
      Swift::Int result = sub_1EF70(*(void *)(v3 + 40));
      uint64_t v8 = ~(-1 << *(unsigned char *)(v3 + 32));
      unint64_t v9 = result & v8;
      unint64_t v10 = (result & (unint64_t)v8) >> 6;
      uint64_t v11 = *(void *)(v5 + 8 * v10);
      uint64_t v12 = 1 << (result & v8);
      if ((v12 & v11) != 0)
      {
        while (1)
        {
          sub_117A4(*(void *)(v3 + 48) + 40 * v9, (uint64_t)v20);
          char v13 = sub_1EF80();
          Swift::Int result = sub_11800((uint64_t)v20);
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
        sub_11800((uint64_t)v21);
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

Swift::Int _s18AXMotionCuesServerAAC48possibleRequiredEntitlementsForProcessingMessage14withIdentifierShys11AnyHashableVGSgSi_tFZ_0()
{
  sub_55DC(&qword_30338);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20070;
  sub_1EF90();
  sub_1EF90();
  sub_1EF90();
  Swift::Int v1 = sub_FFE8(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  return v1;
}

uint64_t sub_1026C()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 88, 7);
}

uint64_t sub_102BC(uint64_t a1)
{
  uint64_t v4 = v1[3];
  uint64_t v12 = v1[2];
  uint64_t v5 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v7 = v1[6];
  uint64_t v8 = v1[7];
  uint64_t v9 = v1[8];
  unint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *unint64_t v10 = v2;
  v10[1] = sub_118B8;
  return sub_72D0(a1, v12, v4, v5, v6, v7, v8, v9);
}

uint64_t sub_103B0(uint64_t a1, uint64_t a2)
{
  return sub_10F18(&qword_2FFE0, a2, (void (*)(uint64_t))type metadata accessor for AXMotionCuesActor);
}

uint64_t type metadata accessor for AXMotionCuesActor()
{
  return self;
}

uint64_t type metadata accessor for AXMotionCuesServer()
{
  return self;
}

void *initializeBufferWithCopyOfBuffer for AXMotionCuesError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AXMotionCuesError()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for AXMotionCuesError(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for AXMotionCuesError(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AXMotionCuesError(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXMotionCuesError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)Swift::Int result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AXMotionCuesError()
{
  return &type metadata for AXMotionCuesError;
}

uint64_t sub_10584(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_105D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10634(uint64_t a1)
{
  uint64_t v2 = sub_55DC(&qword_2FFC8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10694()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_106CC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_118B8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_30208 + dword_30208);
  return v6(a1, v4);
}

void sub_10784()
{
  _AXSMotionCuesMode();
  _AXSMotionCuesEnabled();
  Class isa = sub_1ECD0().super.super.isa;
  id v1 = [objc_allocWithZone((Class)BMAccessibilityMotionCues) initWithEnabled:isa];

  id v2 = [(id)BiomeLibrary() Accessibility];
  swift_unknownObjectRelease();
  id v3 = [v2 MotionCues];
  swift_unknownObjectRelease();
  id v4 = [v3 source];

  [v4 sendEvent:v1];
}

uint64_t sub_10894(uint64_t a1)
{
  v2[5] = a1;
  v2[6] = v1;
  sub_55DC(&qword_2FFC8);
  v2[7] = swift_task_alloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10928, 0, 0);
}

uint64_t sub_10928()
{
  id v2 = (void *)v0[6];
  uint64_t v1 = v0[7];
  id v3 = (void *)v0[5];
  uint64_t v4 = sub_1ED30();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v1, 1, 1, v4);
  sub_1ED10();
  id v5 = v3;
  id v6 = v2;
  uint64_t v7 = sub_1ED00();
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = v6;
  v8[5] = v3;
  uint64_t v9 = sub_ECC4(v1, (uint64_t)&unk_302A0, (uint64_t)v8);
  v0[8] = v9;
  unint64_t v10 = (void *)swift_task_alloc();
  v0[9] = v10;
  uint64_t v11 = type metadata accessor for AXMotionCuesRootViewController();
  uint64_t v12 = sub_55DC(&qword_302A8);
  v0[10] = v12;
  *unint64_t v10 = v0;
  v10[1] = sub_10ABC;
  return Task.result.getter(v0 + 2, v9, v11, v12, &protocol self-conformance witness table for Error);
}

uint64_t sub_10ABC()
{
  swift_task_dealloc();
  return ((uint64_t (*)(uint64_t (*)(), void, void))_swift_task_switch)(sub_10BB8, 0, 0);
}

uint64_t sub_10BB8()
{
  uint64_t v1 = *(void *)(v0 + 16);
  if (*(unsigned char *)(v0 + 24))
  {
    *(void *)(v0 + 32) = v1;
    swift_willThrowTypedImpl();
    swift_release();
    swift_task_dealloc();
    id v2 = *(uint64_t (**)(void))(v0 + 8);
    return v2();
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v4(v1);
  }
}

uint64_t sub_10CA4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_10D58;
  return sub_E37C(a1, v4, v5, v6);
}

uint64_t sub_10D58()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10E4C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10E84()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (*(void *)(v0 + 64)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_10EE4()
{
  return sub_D588(*(void *)(v0 + 16), v0 + 24);
}

uint64_t sub_10EF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10F00()
{
  return swift_release();
}

uint64_t sub_10F08(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_10F18(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10F60()
{
  unint64_t result = qword_30278;
  if (!qword_30278)
  {
    sub_4F2C(&qword_30270);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_30278);
  }
  return result;
}

uint64_t sub_10FBC(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10FCC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_11004()
{
  return sub_D44C(*(unsigned char **)(v0 + 16));
}

uint64_t sub_11010()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_11050()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  void *v1 = v0;
  v1[1] = sub_118B8;
  uint64_t v2 = (void *)swift_task_alloc();
  v1[2] = v2;
  *uint64_t v2 = v1;
  v2[1] = sub_118B8;
  return sub_A178();
}

uint64_t sub_11128(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10D58;
  return sub_E768(a1, v4, v5, v7, v6);
}

void sub_111E8(char a1)
{
  sub_EC18(a1, v1, 0x676E69766F6DLL, 0xE600000000000000, 6);
}

void sub_11218(char a1)
{
  sub_EC18(a1, v1, 0x656C6269736976, 0xE700000000000000, 5);
}

uint64_t sub_1124C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_11288(uint64_t a1)
{
  return sub_164A4(a1);
}

uint64_t sub_11294()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_112DC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_118B8;
  return sub_EFC0(a1, v4, v5, v7, v6);
}

uint64_t sub_1139C()
{
  return swift_release();
}

id sub_113A4(uint64_t a1, void *a2)
{
  return sub_C19C(a1, a2);
}

uint64_t sub_113AC()
{
  swift_unknownObjectRelease();

  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_113F4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_118B8;
  return sub_C3B4(a1, v4, v5, v7, v6);
}

uint64_t sub_114B4()
{
  uint64_t v1 = sub_55DC(&qword_302F8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_115A0(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_55DC(&qword_302F8) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_118B8;
  return sub_B834(a1, v6, v7, v8, v9);
}

uint64_t sub_116C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for InVehicleEvent(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1172C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_55DC(&qword_30330);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_11794(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_117A4(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_11800(uint64_t a1)
{
  return a1;
}

uint64_t *sub_11854(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for IMUData(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithCopy for FilteredIMUData(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = (__n128)a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 64) = result;
  *(_OWORD *)(a1 + 80) = v6;
  return result;
}

uint64_t getEnumTagSinglePayload for FilteredIMUData(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for FilteredIMUData(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 120) = 0;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 128) = v3;
  return result;
}

ValueMetadata *type metadata accessor for FilteredIMUData()
{
  return &type metadata for FilteredIMUData;
}

id sub_119C8()
{
  swift_bridgeObjectRetain();
  NSString v0 = sub_1EC10();
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t sub_11A30(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = sub_1EC20();
  long long v7 = (uint64_t *)(a1 + *a4);
  uint64_t *v7 = v6;
  v7[1] = v8;

  return swift_bridgeObjectRelease();
}

id sub_11B00()
{
  return sub_1297C(type metadata accessor for AXMotionCuesSystemAperturePresentable);
}

uint64_t type metadata accessor for AXMotionCuesSystemAperturePresentable()
{
  return self;
}

id sub_11C4C()
{
  return sub_11C64(&OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___leadingIcon);
}

id sub_11C58()
{
  return sub_11C64(&OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___minimalIcon);
}

id sub_11C64(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char v3 = *(void **)(v1 + *a1);
  if (v3)
  {
    id v4 = *(id *)(v1 + *a1);
  }
  else
  {
    id v5 = [objc_allocWithZone((Class)type metadata accessor for AXMotionCuesSystemApertureImageView()) initWithImage:*(void *)(v1 + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_content + 32)];
    uint64_t v6 = *(void **)(v1 + v2);
    *(void *)(v1 + v2) = v5;
    id v4 = v5;

    char v3 = 0;
  }
  id v7 = v3;
  return v4;
}

id sub_11CE4()
{
  return sub_11E00(&OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___titleLabel, (uint64_t (*)(uint64_t))sub_11D04);
}

id sub_11D04()
{
  type metadata accessor for AXMotionCuesSystemApertureLabel();
  id v0 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  NSString v1 = sub_1EC10();
  [v0 setText:v1];

  uint64_t v2 = self;
  id v3 = v0;
  id v4 = objc_msgSend(v2, "sbui_systemAperturePreferredFontForTextStyle:", 1);
  [v3 setFont:v4];

  return v3;
}

id sub_11DE0()
{
  return sub_11E00(&OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___subtitleLabel, (uint64_t (*)(uint64_t))sub_11E64);
}

id sub_11E00(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3 = *a1;
  id v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    uint64_t v6 = (void *)a2(v2);
    id v7 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v6;
    id v5 = v6;

    id v4 = 0;
  }
  id v8 = v4;
  return v5;
}

id sub_11E64(uint64_t a1)
{
  type metadata accessor for AXMotionCuesSystemApertureLabel();
  id v2 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  uint64_t v3 = a1 + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_content;
  id v4 = v2;
  NSString v5 = sub_1EC10();
  [v4 setText:v5];

  uint64_t v6 = *(void *)(v3 + 40);
  id v7 = self;
  id v8 = v4;
  if (v6) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = 4;
  }
  if (v6) {
    uint64_t v10 = 4;
  }
  else {
    uint64_t v10 = 1;
  }
  id v11 = objc_msgSend(v7, "sbui_systemAperturePreferredFontForTextStyle:", v9);
  [v8 setFont:v11];

  uint64_t v12 = self;
  id v13 = v8;
  id v14 = [v12 secondaryLabelColor];
  [v13 setTextColor:v14];

  [v13 setTextAlignment:v10];
  return v13;
}

id sub_11FB8()
{
  uint64_t v1 = OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___textStackView;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___textStackView);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___textStackView);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)UIStackView) init];
    id v5 = sub_11CE4();
    [v4 addArrangedSubview:v5];

    id v6 = sub_11DE0();
    [v4 addArrangedSubview:v6];

    [v4 setAxis:1];
    id v7 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v8 = v2;
  return v3;
}

id sub_12088()
{
  uint64_t v1 = OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___undoButton;
  id v2 = *(void **)(v0
                + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___undoButton);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___undoButton);
  }
  else
  {
    swift_getObjectType();
    id v4 = sub_120F8(v0);
    id v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    id v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_120F8(uint64_t a1)
{
  id v2 = [self buttonWithType:1];
  NSString v3 = sub_1EC10();
  id v4 = [self systemImageNamed:v3];

  [v2 setImage:v4 forState:0];
  [v2 addTarget:a1 action:"undoButtonTapped" forControlEvents:64];
  objc_msgSend(v2, "setContentEdgeInsets:", 8.0, 8.0, 8.0, 8.0);
  [v2 _setCornerRadius:20.0];
  id v5 = self;
  id v6 = v2;
  id v7 = [v5 systemBlueColor];
  id v8 = [v7 colorWithAlphaComponent:0.4];

  [v6 setBackgroundColor:v8];
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v10 = self;
  id v11 = v6;
  uint64_t v12 = (objc_class *)[v10 bundleForClass:ObjCClassFromMetadata];
  v16._countAndFlagsBits = 0xE000000000000000;
  v17._object = (void *)0x8000000000021610;
  v17._countAndFlagsBits = 0xD00000000000001DLL;
  v18.value._countAndFlagsBits = 0x617A696C61636F4CLL;
  v18.value._object = (void *)0xEB00000000656C62;
  v13.super.Class isa = v12;
  v19._countAndFlagsBits = 0;
  v19._object = (void *)0xE000000000000000;
  sub_1EAC0(v17, v18, v13, v19, v16);

  NSString v14 = sub_1EC10();
  swift_bridgeObjectRelease();
  [v11 setAccessibilityLabel:v14];

  return v11;
}

id sub_1235C(uint64_t a1)
{
  *(void *)&v1[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_activeLayoutMode] = 0;
  v1[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_needsLayout] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___leadingIcon] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___minimalIcon] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___titleLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___subtitleLabel] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___textStackView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___undoButton] = 0;
  id v2 = &v1[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_content];
  long long v3 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)id v2 = *(_OWORD *)a1;
  *((_OWORD *)v2 + 1) = v3;
  *((_OWORD *)v2 + 2) = *(_OWORD *)(a1 + 32);
  *((void *)v2 + 6) = *(void *)(a1 + 48);
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AXMotionCuesSystemApertureViewController();
  return objc_msgSendSuper2(&v5, "initWithNibName:bundle:", 0, 0);
}

id sub_124D4(char *a1, uint64_t a2, uint64_t (*a3)(void))
{
  if (*(void *)&a1[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_content + 40])
  {
    long long v3 = 0;
  }
  else
  {
    objc_super v5 = a1;
    long long v3 = (void *)a3();
  }

  return v3;
}

id sub_12660()
{
  return sub_1297C(type metadata accessor for AXMotionCuesSystemApertureViewController);
}

uint64_t type metadata accessor for AXMotionCuesSystemApertureViewController()
{
  return self;
}

id sub_1281C()
{
  return sub_1297C(type metadata accessor for AXMotionCuesSystemApertureImageView);
}

uint64_t type metadata accessor for AXMotionCuesSystemApertureImageView()
{
  return self;
}

id sub_1287C(void *a1, double a2, double a3, double a4, double a5, uint64_t a6, uint64_t (*a7)(void))
{
  v12.receiver = a1;
  v12.super_class = (Class)a7();
  return objc_msgSendSuper2(&v12, "initWithFrame:", a2, a3, a4, a5);
}

id sub_12910(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), SEL *a5)
{
  v8.receiver = a1;
  v8.super_class = (Class)a4();
  return objc_msgSendSuper2(&v8, *a5, a3);
}

id sub_12964()
{
  return sub_1297C(type metadata accessor for AXMotionCuesSystemApertureLabel);
}

id sub_1297C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for AXMotionCuesSystemApertureLabel()
{
  return self;
}

id sub_129D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_1EB30();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  long long v11 = *(_OWORD *)a1;
  long long v28 = *(_OWORD *)(a1 + 16);
  long long v29 = v11;
  sub_12BB4(a1 + 32, (uint64_t)&v27);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  NSString v14 = &v3[OBJC_IVAR____TtC18AXMotionCuesServer37AXMotionCuesSystemAperturePresentable_content];
  long long v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)NSString v14 = *(_OWORD *)a1;
  *((_OWORD *)v14 + 1) = v15;
  *((_OWORD *)v14 + 2) = *(_OWORD *)(a1 + 32);
  *((void *)v14 + 6) = v13;
  Swift::String v16 = &v3[OBJC_IVAR____TtC18AXMotionCuesServer37AXMotionCuesSystemAperturePresentable_requesterIdentifier];
  *(void *)Swift::String v16 = a2;
  *((void *)v16 + 1) = a3;
  Swift::String v17 = v3;
  sub_12C1C((uint64_t)&v29);
  sub_12C1C((uint64_t)&v28);
  sub_12C48(&v27);
  sub_10F08(v12);
  sub_1EB20();
  uint64_t v18 = sub_1EB10();
  uint64_t v20 = v19;
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  unint64_t v21 = (uint64_t *)&v17[OBJC_IVAR____TtC18AXMotionCuesServer37AXMotionCuesSystemAperturePresentable_requestIdentifier];
  *unint64_t v21 = v18;
  v21[1] = v20;
  id v22 = objc_allocWithZone((Class)type metadata accessor for AXMotionCuesSystemApertureViewController());
  sub_12C1C((uint64_t)&v29);
  sub_12C1C((uint64_t)&v28);
  sub_12C48(&v27);
  sub_10F08(v12);
  *(void *)&v17[OBJC_IVAR____TtC18AXMotionCuesServer37AXMotionCuesSystemAperturePresentable_bannerViewController] = sub_1235C(a1);

  id v23 = (objc_class *)type metadata accessor for AXMotionCuesSystemAperturePresentable();
  v26.receiver = v17;
  v26.super_class = v23;
  return objc_msgSendSuper2(&v26, "init");
}

uint64_t sub_12BB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_55DC(&qword_30F10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_12C1C(uint64_t a1)
{
  return a1;
}

id *sub_12C48(id *a1)
{
  id v2 = *a1;
  return a1;
}

void sub_12C74()
{
  *(void *)&v0[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_activeLayoutMode] = 0;
  v0[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_needsLayout] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___leadingIcon] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___minimalIcon] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___titleLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___subtitleLabel] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___textStackView] = 0;
  *(void *)&v0[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController____lazy_storage___undoButton] = 0;

  sub_1F010();
  __break(1u);
}

void sub_12D34()
{
  if (v0[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_needsLayout] != 1
    || !*(void *)&v0[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_content + 40])
  {
    return;
  }
  v0[OBJC_IVAR____TtC18AXMotionCuesServer40AXMotionCuesSystemApertureViewController_needsLayout] = 0;
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_18;
  }
  id v2 = v1;
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v3 = sub_11C4C();
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = sub_11FB8();
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = sub_12088();
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [v0 view];
  if (!v6)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v7 = v6;
  id v8 = sub_11C4C();
  [v7 addSubview:v8];

  id v9 = [v0 view];
  if (!v9)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v10 = v9;
  id v11 = sub_11FB8();
  [v10 addSubview:v11];

  id v12 = [v0 view];
  if (!v12)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v13 = v12;
  id v14 = sub_12088();
  [v13 addSubview:v14];

  id v15 = [v0 view];
  if (!v15)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  Swift::String v16 = v15;
  id v17 = objc_msgSend(v15, "SBUISA_systemApertureObstructedAreaLayoutGuide");

  sub_55DC(&qword_30580);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_201E0;
  id v19 = [v0 view];
  if (!v19)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v20 = v19;
  id v21 = [v19 heightAnchor];

  id v22 = [v21 constraintEqualToConstant:80.0];
  *(void *)(v18 + 32) = v22;
  id v23 = sub_11C4C();
  id v24 = [v23 centerYAnchor];

  id v25 = [v0 view];
  if (!v25)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  objc_super v26 = v25;
  id v27 = [v25 centerYAnchor];

  id v28 = [v24 constraintEqualToAnchor:v27];
  *(void *)(v18 + 40) = v28;
  id v29 = sub_11C4C();
  id v30 = [v29 centerXAnchor];

  id v31 = [v0 view];
  if (!v31)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v32 = v31;
  id v33 = [v31 leadingAnchor];

  id v34 = [v30 constraintEqualToAnchor:v33 constant:32.0];
  *(void *)(v18 + 48) = v34;
  id v35 = sub_11C4C();
  id v36 = [v35 widthAnchor];

  id v37 = [v36 constraintEqualToConstant:32.0];
  *(void *)(v18 + 56) = v37;
  id v38 = sub_11C4C();
  id v39 = [v38 heightAnchor];

  id v40 = [v39 constraintEqualToConstant:32.0];
  *(void *)(v18 + 64) = v40;
  id v41 = sub_11FB8();
  id v42 = [v41 leadingAnchor];

  id v43 = [v17 leadingAnchor];
  id v44 = [v42 constraintLessThanOrEqualToAnchor:v43];

  *(void *)(v18 + 72) = v44;
  id v45 = sub_11FB8();
  id v46 = [v45 trailingAnchor];

  id v47 = [v17 trailingAnchor];
  id v48 = [v46 constraintGreaterThanOrEqualToAnchor:v47];

  *(void *)(v18 + 80) = v48;
  id v49 = sub_11FB8();
  id v50 = [v49 topAnchor];

  id v51 = [v17 bottomAnchor];
  id v52 = [v50 constraintEqualToAnchor:v51];

  *(void *)(v18 + 88) = v52;
  id v53 = sub_11FB8();
  id v54 = [v53 leadingAnchor];

  id v55 = sub_11C4C();
  id v56 = [v55 centerXAnchor];

  id v57 = [v54 constraintEqualToAnchor:v56 constant:32.0];
  *(void *)(v18 + 96) = v57;
  id v58 = sub_12088();
  id v59 = [v58 centerYAnchor];

  id v60 = [v0 view];
  if (!v60)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v61 = v60;
  id v62 = [v60 centerYAnchor];

  id v63 = [v59 constraintEqualToAnchor:v62];
  *(void *)(v18 + 104) = v63;
  id v64 = sub_12088();
  id v65 = [v64 trailingAnchor];

  id v66 = [v0 view];
  if (!v66)
  {
LABEL_26:
    __break(1u);
    return;
  }
  v67 = v66;
  v68 = self;
  id v69 = [v67 trailingAnchor];

  id v70 = [v65 constraintEqualToAnchor:v69 constant:-15.0];
  *(void *)(v18 + 112) = v70;
  id v71 = sub_12088();
  id v72 = [v71 leadingAnchor];

  id v73 = [v17 trailingAnchor];
  id v74 = [v72 constraintGreaterThanOrEqualToAnchor:v73];

  *(void *)(v18 + 120) = v74;
  id v75 = sub_12088();
  id v76 = [v75 leadingAnchor];

  id v77 = sub_11FB8();
  id v78 = [v77 trailingAnchor];

  id v79 = [v76 constraintEqualToAnchor:v78 constant:16.0];
  *(void *)(v18 + 128) = v79;
  sub_1EC90();
  sub_13584();
  Class isa = sub_1EC70().super.isa;
  swift_bridgeObjectRelease();
  [v68 activateConstraints:isa];
}

unint64_t sub_13584()
{
  unint64_t result = qword_30588;
  if (!qword_30588)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_30588);
  }
  return result;
}

double sub_135D0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double v6 = *(double *)a1;
  double v5 = *(double *)(a1 + 8);
  uint64_t v7 = *(void *)(a1 + 16);
  double v8 = *(double *)(a1 + 24);
  double v9 = *(double *)(a1 + 32);
  uint64_t v33 = *(void *)(a1 + 40);
  uint64_t v34 = v7;
  double v10 = *(double *)(a1 + 48);
  double v11 = *(double *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 64);
  double v13 = *(double *)(a1 + 72);
  double v14 = *(double *)(a1 + 80);
  uint64_t v31 = *(void *)(a1 + 88);
  uint64_t v32 = v12;
  double v30 = *(double *)(a1 + 96);
  uint64_t v15 = sub_1EB90();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v19 = v6;
  double v20 = v8;
  double v21 = v10;
  double v22 = v13;
  switch(a2)
  {
    case 1:
      break;
    case 2:
      double v19 = -v6;
      double v5 = -v5;
      double v20 = -v8;
      double v9 = -v9;
      double v21 = -v10;
      double v11 = -v11;
      double v22 = -v13;
      double v14 = -v14;
      break;
    case 3:
      double v19 = -v5;
      double v20 = -v9;
      double v21 = -v11;
      double v5 = v6;
      double v9 = v8;
      double v11 = v10;
      double v22 = -v14;
      double v14 = v13;
      break;
    case 4:
      double v19 = v5;
      double v5 = -v6;
      double v20 = v9;
      double v9 = -v8;
      double v21 = v11;
      double v11 = -v10;
      double v22 = v14;
      double v14 = -v13;
      break;
    default:
      if (qword_2FC30 != -1) {
        swift_once();
      }
      uint64_t v23 = sub_5690(v15, (uint64_t)MCLog);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v23, v15);
      id v24 = sub_1EB70();
      os_log_type_t v25 = sub_1EE10();
      if (os_log_type_enabled(v24, v25))
      {
        objc_super v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)objc_super v26 = 0;
        _os_log_impl(&dword_0, v24, v25, "Processing unknown orientation.", v26, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      double v19 = v6;
      double v20 = v8;
      double v21 = v10;
      double v22 = v13;
      break;
  }
  *(double *)a3 = v19;
  *(double *)(a3 + 8) = v5;
  *(void *)(a3 + 16) = v34;
  *(double *)(a3 + 24) = v20;
  uint64_t v27 = v33;
  *(double *)(a3 + 32) = v9;
  *(void *)(a3 + 40) = v27;
  *(double *)(a3 + 48) = v21;
  *(double *)(a3 + 56) = v11;
  *(void *)(a3 + 64) = v32;
  *(double *)(a3 + 72) = v22;
  uint64_t v28 = v31;
  *(double *)(a3 + 80) = v14;
  *(void *)(a3 + 88) = v28;
  double result = v30;
  *(double *)(a3 + 96) = v30;
  return result;
}

double sub_138C4()
{
  sub_55DC(&qword_30658);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 5;
  *(_OWORD *)(v0 + 16) = xmmword_202A0;
  *(void *)(v0 + 32) = &off_28D68;
  *(void *)(v0 + 40) = &off_28DB0;
  *(void *)(v0 + 48) = &off_28DF8;
  *(void *)(v0 + 56) = &off_28E40;
  *(void *)(v0 + 64) = &off_28E88;
  qword_30590 = v0;
  return result;
}

double sub_13938()
{
  sub_55DC(&qword_30658);
  uint64_t v0 = swift_allocObject();
  *(void *)&double result = 5;
  *(_OWORD *)(v0 + 16) = xmmword_202A0;
  *(void *)(v0 + 32) = &off_28ED0;
  *(void *)(v0 + 40) = &off_28F18;
  *(void *)(v0 + 48) = &off_28F60;
  *(void *)(v0 + 56) = &off_28FA8;
  *(void *)(v0 + 64) = &off_28FF0;
  qword_31510 = v0;
  return result;
}

uint64_t sub_139AC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>, double a3@<D0>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  uint64_t v8 = a1[2];
  uint64_t v7 = a1[3];
  uint64_t v10 = a1[4];
  uint64_t v9 = a1[5];
  uint64_t v11 = a1[6];
  uint64_t v12 = a1[7];
  uint64_t v13 = a1[8];
  uint64_t v14 = a1[9];
  uint64_t v16 = a1[10];
  uint64_t v15 = a1[11];
  uint64_t v17 = a1[12];
  uint64_t v103 = v16;
  uint64_t v104 = v15;
  if (*(unsigned char *)(v3 + 120)) {
    goto LABEL_4;
  }
  uint64_t v99 = a1[3];
  uint64_t v101 = a1[5];
  uint64_t v95 = a1[4];
  uint64_t v96 = a1[12];
  uint64_t v97 = a1[6];
  uint64_t v18 = *a1;
  uint64_t v19 = *(void *)(v3 + 16);
  uint64_t v20 = *(void *)(v3 + 24);
  uint64_t v22 = *(void *)(v3 + 32);
  uint64_t v21 = *(void *)(v3 + 40);
  uint64_t v23 = *(void *)(v3 + 56);
  uint64_t v92 = *(void *)(v3 + 72);
  uint64_t v93 = *(void *)(v3 + 64);
  uint64_t v91 = *(void *)(v3 + 80);
  uint64_t v89 = *(void *)(v3 + 48);
  uint64_t v90 = *(void *)(v3 + 88);
  uint64_t v24 = *(void *)(v3 + 104);
  uint64_t v94 = *(void *)(v3 + 96);
  uint64_t v25 = *(void *)(v3 + 112);
  uint64_t v88 = v3 + 128;
  sub_14544(v3 + 128, (uint64_t)v109);
  sub_14544((uint64_t)v109, (uint64_t)&v110);
  if (sub_145AC((uint64_t)&v110) == 1)
  {
    uint64_t v17 = v96;
    uint64_t v11 = v97;
    uint64_t v5 = v18;
    uint64_t v7 = v99;
    uint64_t v9 = v101;
    uint64_t v10 = v95;
LABEL_4:
    *(void *)(v3 + 16) = v5;
    *(void *)(v3 + 24) = v6;
    *(void *)(v3 + 32) = v8;
    *(void *)(v3 + 40) = v7;
    *(void *)(v3 + 48) = v10;
    *(void *)(v3 + 56) = v9;
    *(void *)(v3 + 64) = v11;
    *(void *)(v3 + 72) = v12;
    *(void *)(v3 + 80) = v13;
    *(void *)(v3 + 88) = v14;
    *(void *)(v3 + 96) = v16;
    *(void *)(v3 + 104) = v15;
    *(void *)(v3 + 112) = v17;
    *(unsigned char *)(v3 + 120) = 0;
    *(void *)&long long v110 = v5;
    *((void *)&v110 + 1) = v6;
    *(void *)&long long v111 = v8;
    *((void *)&v111 + 1) = v5;
    *(void *)&long long v112 = v6;
    *((void *)&v112 + 1) = v8;
    *(void *)&long long v113 = v7;
    *((void *)&v113 + 1) = v10;
    *(void *)&long long v114 = v9;
    *((void *)&v114 + 1) = v11;
    *(void *)&long long v115 = v12;
    *((void *)&v115 + 1) = v13;
    *(void *)&long long v116 = v14;
    *((void *)&v116 + 1) = v16;
    *(void *)&long long v117 = v15;
    *((void *)&v117 + 1) = v17;
    uint64_t v26 = v17;
    uint64_t v98 = v12;
    uint64_t v100 = v13;
    uint64_t v102 = v14;
    uint64_t v27 = v5;
    uint64_t v28 = v11;
    uint64_t v29 = v9;
    uint64_t v30 = v10;
    uint64_t v31 = v7;
    sub_1453C((uint64_t)&v110);
    uint64_t result = sub_14544((uint64_t)&v110, v3 + 128);
    uint64_t v33 = v27;
    uint64_t v34 = v26;
    uint64_t v35 = v27;
    uint64_t v36 = v6;
    uint64_t v37 = v8;
    uint64_t v38 = v30;
    uint64_t v39 = v29;
    uint64_t v40 = v28;
    uint64_t v41 = v98;
    uint64_t v42 = v100;
    uint64_t v43 = v102;
    uint64_t v44 = v103;
    uint64_t v45 = v6;
    uint64_t v46 = v104;
    goto LABEL_14;
  }
  uint64_t v47 = v19;
  uint64_t v48 = v20;
  uint64_t v49 = v22;
  if (*(unsigned char *)(v3 + 368))
  {
LABEL_8:
    *(void *)(v3 + 16) = v18;
    *(void *)(v3 + 24) = v6;
    *(void *)(v3 + 32) = v8;
    *(void *)(v3 + 40) = v99;
    *(void *)(v3 + 48) = v95;
    *(void *)(v3 + 56) = v101;
    *(void *)(v3 + 64) = v97;
    *(void *)(v3 + 72) = v12;
    *(void *)(v3 + 80) = v13;
    *(void *)(v3 + 88) = v14;
    *(void *)(v3 + 96) = v16;
    *(void *)(v3 + 104) = v15;
    *(void *)(v3 + 112) = v96;
    *(unsigned char *)(v3 + 120) = 0;
    v107[0] = v18;
    v107[1] = v6;
    v107[2] = v8;
    v107[3] = v18;
    v107[4] = v6;
    v107[5] = v8;
    v107[6] = v99;
    v107[7] = v95;
    v107[8] = v101;
    v107[9] = v97;
    v107[10] = v12;
    v107[11] = v13;
    v107[12] = v14;
    v107[13] = v16;
    v107[14] = v15;
    v107[15] = v96;
    uint64_t v50 = v47;
    uint64_t v51 = v48;
    uint64_t v52 = v49;
    sub_1453C((uint64_t)v107);
    sub_14544((uint64_t)v107, v88);
    *(void *)(v3 + 264) = v19;
    *(void *)(v3 + 272) = v20;
    *(void *)(v3 + 280) = v22;
    *(void *)(v3 + 288) = v21;
    *(void *)(v3 + 296) = v89;
    *(void *)(v3 + 304) = v23;
    *(void *)(v3 + 312) = v93;
    *(void *)(v3 + 320) = v92;
    *(void *)(v3 + 328) = v91;
    *(void *)(v3 + 336) = v90;
    *(void *)(v3 + 344) = v94;
    *(void *)(v3 + 352) = v24;
    *(void *)(v3 + 360) = v25;
    *(unsigned char *)(v3 + 368) = 0;
    v108[2] = v112;
    v108[3] = v113;
    v108[0] = v110;
    v108[1] = v111;
    v108[6] = v116;
    v108[7] = v117;
    v108[4] = v114;
    v108[5] = v115;
    sub_1453C((uint64_t)v108);
    uint64_t result = sub_14544((uint64_t)v108, v3 + 376);
    uint64_t v33 = v50;
    uint64_t v45 = v51;
    uint64_t v8 = v52;
    uint64_t v34 = v25;
    uint64_t v31 = v21;
    uint64_t v39 = v23;
    uint64_t v38 = v89;
    uint64_t v40 = v93;
    uint64_t v42 = v91;
    uint64_t v41 = v92;
    uint64_t v44 = v94;
    uint64_t v43 = v90;
    uint64_t v46 = v24;
    uint64_t v35 = v50;
    uint64_t v36 = v51;
    uint64_t v37 = v52;
    goto LABEL_14;
  }
  sub_14544(v3 + 376, (uint64_t)v107);
  sub_14544((uint64_t)v107, (uint64_t)v108);
  if (sub_145AC((uint64_t)v108) == 1)
  {
    uint64_t v47 = v19;
    uint64_t v48 = v20;
    uint64_t v49 = v22;
    goto LABEL_8;
  }
  if (qword_2FC48 != -1) {
    swift_once();
  }
  uint64_t v53 = sub_14748(qword_30590, a3);
  uint64_t v71 = v21;
  if (qword_2FC50 != -1) {
    swift_once();
  }
  uint64_t v54 = sub_14748(qword_31510, a3);
  sub_148F8(v53);
  uint64_t v73 = v56;
  uint64_t v74 = v55;
  uint64_t v72 = v57;
  sub_148F8(v54);
  uint64_t v75 = v58;
  uint64_t v76 = v59;
  uint64_t v78 = v60;
  swift_bridgeObjectRelease();
  sub_148F8(v53);
  uint64_t v79 = v61;
  uint64_t v85 = v63;
  uint64_t v86 = v62;
  sub_148F8(v53);
  uint64_t v87 = v64;
  uint64_t v83 = v66;
  uint64_t v84 = v65;
  sub_148F8(v53);
  uint64_t v81 = v68;
  uint64_t v82 = v67;
  uint64_t v80 = v69;
  swift_bridgeObjectRelease();
  *(void *)(v3 + 16) = v18;
  *(void *)(v3 + 24) = v6;
  *(void *)(v3 + 32) = v8;
  *(void *)(v3 + 40) = v99;
  *(void *)(v3 + 48) = v95;
  *(void *)(v3 + 56) = v101;
  *(void *)(v3 + 64) = v97;
  uint64_t v70 = v14;
  uint64_t v39 = v85;
  uint64_t v38 = v86;
  *(void *)(v3 + 72) = v12;
  *(void *)(v3 + 80) = v13;
  uint64_t v31 = v79;
  *(void *)(v3 + 88) = v70;
  *(void *)(v3 + 96) = v16;
  *(void *)(v3 + 104) = v15;
  *(void *)(v3 + 112) = v96;
  *(unsigned char *)(v3 + 120) = 0;
  *(void *)(v3 + 264) = v19;
  *(void *)(v3 + 272) = v20;
  *(void *)(v3 + 280) = v22;
  *(void *)(v3 + 288) = v71;
  *(void *)(v3 + 296) = v89;
  *(void *)(v3 + 304) = v23;
  *(void *)(v3 + 312) = v93;
  *(void *)(v3 + 320) = v92;
  *(void *)(v3 + 328) = v91;
  *(void *)(v3 + 336) = v90;
  *(void *)(v3 + 344) = v94;
  *(void *)(v3 + 352) = v24;
  *(void *)(v3 + 360) = v25;
  *(unsigned char *)(v3 + 368) = 0;
  v105[0] = v74;
  v105[1] = v73;
  v105[2] = v72;
  v105[3] = v75;
  v105[4] = v78;
  v105[5] = v76;
  v105[6] = v79;
  v105[7] = v86;
  v105[8] = v85;
  v105[9] = v87;
  v105[10] = v84;
  v105[11] = v83;
  uint64_t v44 = v81;
  v105[12] = v82;
  v105[13] = v81;
  v105[14] = v80;
  v105[15] = v96;
  sub_1453C((uint64_t)v105);
  sub_14544((uint64_t)v105, v88);
  v106[4] = v114;
  v106[5] = v115;
  v106[6] = v116;
  v106[7] = v117;
  v106[0] = v110;
  v106[1] = v111;
  v106[2] = v112;
  v106[3] = v113;
  sub_1453C((uint64_t)v106);
  uint64_t result = sub_14544((uint64_t)v106, v3 + 376);
  uint64_t v40 = v87;
  uint64_t v46 = v80;
  uint64_t v43 = v82;
  uint64_t v42 = v83;
  uint64_t v41 = v84;
  uint64_t v34 = v96;
  uint64_t v36 = v73;
  uint64_t v35 = v74;
  uint64_t v37 = v72;
  uint64_t v33 = v75;
  uint64_t v8 = v76;
  uint64_t v45 = v78;
LABEL_14:
  *a2 = v35;
  a2[1] = v36;
  a2[2] = v37;
  a2[3] = v33;
  a2[4] = v45;
  a2[5] = v8;
  a2[6] = v31;
  a2[7] = v38;
  a2[8] = v39;
  a2[9] = v40;
  a2[10] = v41;
  a2[11] = v42;
  a2[12] = v43;
  a2[13] = v44;
  a2[14] = v46;
  a2[15] = v34;
  return result;
}

char *sub_141F4(unint64_t a1, double a2)
{
  if ((a1 & 0x8000000000000000) != 0)
  {
    uint64_t result = (char *)sub_1F000();
    __break(1u);
    return result;
  }
  if (!a1) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t result = (char *)sub_1ECB0();
  *((void *)result + 2) = a1;
  id v4 = (double *)(result + 32);
  if (a1 < 4)
  {
    unint64_t v5 = 0;
    double v6 = a2;
LABEL_9:
    unint64_t v10 = a1 - v5;
    do
    {
      *v4++ = v6;
      --v10;
    }
    while (v10);
    return result;
  }
  unint64_t v5 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  v4 += a1 & 0xFFFFFFFFFFFFFFFCLL;
  double v6 = a2;
  int64x2_t v7 = vdupq_lane_s64(*(uint64_t *)&a2, 0);
  uint64_t v8 = (int64x2_t *)(result + 48);
  unint64_t v9 = a1 & 0xFFFFFFFFFFFFFFFCLL;
  do
  {
    v8[-1] = v7;
    *uint64_t v8 = v7;
    v8 += 2;
    v9 -= 4;
  }
  while (v9);
  if (v5 != a1) {
    goto LABEL_9;
  }
  return result;
}

double *sub_142E8(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 16);
  unint64_t v5 = *(void *)(a2 + 16);
  if (v5 >= v4) {
    int64_t v6 = *(void *)(a1 + 16);
  }
  else {
    int64_t v6 = *(void *)(a2 + 16);
  }
  sub_145C8(0, v6, 0);
  int64_t v30 = v5;
  unint64_t v31 = v4;
  uint64_t v32 = a1;
  if (v6)
  {
    int64x2_t v7 = (double *)(a1 + 32);
    uint64_t v8 = (double *)(a2 + 32);
    swift_bridgeObjectRetain();
    uint64_t result = (double *)swift_bridgeObjectRetain();
    int64_t v10 = v6;
    uint64_t v11 = a2;
    while (v4)
    {
      if (!v5) {
        goto LABEL_26;
      }
      double v12 = *v7;
      double v13 = *v8;
      unint64_t v15 = *(void *)&_swiftEmptyArrayStorage[2];
      unint64_t v14 = *(void *)&_swiftEmptyArrayStorage[3];
      if (v15 >= v14 >> 1)
      {
        uint64_t v28 = v11;
        uint64_t result = (double *)sub_145C8(v14 > 1, v15 + 1, 1);
        uint64_t v11 = v28;
      }
      --v5;
      *(void *)&_swiftEmptyArrayStorage[2] = v15 + 1;
      _swiftEmptyArrayStorage[v15 + 4] = v12 * v13;
      --v4;
      ++v8;
      ++v7;
      if (!--v10) {
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_26:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t result = (double *)swift_bridgeObjectRetain();
    uint64_t v11 = a2;
LABEL_13:
    if (v31 <= v30)
    {
LABEL_24:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return _swiftEmptyArrayStorage;
    }
    uint64_t v16 = 0;
    if (v6 <= v30) {
      int64_t v17 = v30;
    }
    else {
      int64_t v17 = v6;
    }
    int64_t v18 = v17 - v6;
    unint64_t v19 = v31 - v6;
    int64_t v20 = v30 - v6;
    uint64_t v21 = 8 * v6 + 32;
    uint64_t v22 = v32 + v21;
    uint64_t v23 = v11 + v21;
    while (v19 != v16)
    {
      if (v20 == v16) {
        goto LABEL_24;
      }
      if (v18 == v16) {
        goto LABEL_28;
      }
      double v24 = *(double *)(v22 + 8 * v16);
      double v25 = *(double *)(v23 + 8 * v16);
      unint64_t v27 = *(void *)&_swiftEmptyArrayStorage[2];
      unint64_t v26 = *(void *)&_swiftEmptyArrayStorage[3];
      if (v27 >= v26 >> 1)
      {
        uint64_t v29 = v11;
        uint64_t result = (double *)sub_145C8(v26 > 1, v27 + 1, 1);
        uint64_t v11 = v29;
      }
      *(void *)&_swiftEmptyArrayStorage[2] = v27 + 1;
      _swiftEmptyArrayStorage[v27 + 4] = v24 * v25;
      if (v19 == ++v16) {
        goto LABEL_24;
      }
    }
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_14508()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IMUFilter()
{
  return self;
}

uint64_t sub_1453C(uint64_t result)
{
  *(unsigned char *)(result + 128) = 0;
  return result;
}

uint64_t sub_14544(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_55DC(&qword_30650);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_145AC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 128)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_145C8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_145E8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_145E8(char a1, int64_t a2, char a3, char *a4)
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
    sub_55DC(&qword_30660);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  double v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1F040();
  __break(1u);
  return result;
}

uint64_t sub_14748(uint64_t a1, double a2)
{
  double v3 = 1.0;
  double v4 = 1.0 / a2;
  uint64_t result = sub_1ECB0();
  char v6 = 0;
  *(void *)(result + 16) = 5;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(void *)(result + 64) = 0;
  unint64_t v7 = 4;
LABEL_2:
  for (uint64_t i = v7 - 1; ; uint64_t i = 0)
  {
    if (v7 >= *(void *)(result + 16))
    {
      __break(1u);
      goto LABEL_21;
    }
    *(double *)(result + 32 + 8 * v7) = v3;
    double v3 = v4 * v3;
    unint64_t v7 = i;
    if (i > 0) {
      goto LABEL_2;
    }
    if ((i != 0) | v6 & 1) {
      break;
    }
    char v6 = 1;
  }
  unint64_t v9 = *(void *)(a1 + 16);
  int64_t v10 = sub_141F4(v9, 0.0);
  if (!v9)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
  unint64_t v11 = 0;
  uint64_t v12 = a1 + 32;
  while (1)
  {
    uint64_t v13 = *(void *)(v12 + 8 * v11);
    swift_bridgeObjectRetain();
    uint64_t v14 = swift_bridgeObjectRetain();
    unint64_t v15 = sub_142E8(v14, v13);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v16 = *((void *)v15 + 2);
    if (v16)
    {
      int64_t v17 = v15 + 4;
      double v18 = 0.0;
      do
      {
        double v19 = *v17++;
        double v18 = v18 + v19;
        --v16;
      }
      while (v16);
    }
    else
    {
      double v18 = 0.0;
    }
    swift_bridgeObjectRelease();
    uint64_t result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)sub_1BB10((uint64_t)v10);
      int64_t v10 = (char *)result;
    }
    if (v11 >= *((void *)v10 + 2)) {
      break;
    }
    *(double *)&v10[8 * v11++ + 32] = v18;
    if (v11 == v9) {
      goto LABEL_19;
    }
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_148F8(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (!v1)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v1 == 1)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v1 < 3)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v1 == 3)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v1 < 5) {
LABEL_11:
  }
    __break(1u);
  return result;
}

uint64_t type metadata accessor for AXMotionCuesGridElementView()
{
  return self;
}

uint64_t sub_14AC8(double a1, double a2)
{
  __asm { FMOV            V0.2D, #-1.0 }
  *(_OWORD *)(v2 + 40) = _Q0;
  *(void *)(v2 + 56) = 0xBFF0000000000000;
  *(double *)(v2 + 24) = a1;
  *(double *)(v2 + 32) = a2;
  id v10 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXMotionCuesGridElementView()), "initWithFrame:", 0.5, 0.5, 12.0, 12.0);
  *(void *)(v2 + 16) = v10;
  unint64_t v11 = self;
  id v12 = v10;
  id v13 = [v11 clearColor];
  [v12 setBackgroundColor:v13];

  id v14 = sub_1BEF0();
  *(void *)(v2 + 64) = v14;
  unint64_t v15 = *(void **)(v2 + 16);
  id v16 = v14;
  [v15 bounds];
  objc_msgSend(v16, "setFrame:");

  [*(id *)(v2 + 64) setCornerRadius:6.0];
  id v17 = [*(id *)(v2 + 16) layer];
  [v17 addSublayer:*(void *)(v2 + 64)];

  id v18 = [*(id *)(v2 + 16) layer];
  [v18 setCornerRadius:6.0];

  objc_msgSend(*(id *)(v2 + 16), "setCenter:", a1, a2);
  return v2;
}

id sub_14C4C(double a1, double a2)
{
  if (*(double *)(v2 + 40) == -1.0 && *(double *)(v2 + 48) == -1.0)
  {
    *(double *)(v2 + 40) = a1;
    *(double *)(v2 + 48) = a1;
    objc_msgSend(*(id *)(v2 + 64), "setBounds:", 0.0, 0.0, a1, a1);
    [*(id *)(v2 + 64) frame];
    double v5 = CGRectGetWidth(v15) * 0.5;
    [*(id *)(v2 + 64) cornerRadius];
    if (v5 != v6) {
      [*(id *)(v2 + 64) setCornerRadius:v5];
    }
  }
  double v7 = 1.0 / (1.0 / a2) / (1.0 / (1.0 / a2) + 0.198943679);
  double v8 = v7 * a1 + (1.0 - v7) * *(double *)(v2 + 48);
  if (v8 < 0.0) {
    double v8 = 0.0;
  }
  double v9 = fmin(v8, 12.0);
  *(double *)(v2 + 40) = a1;
  *(double *)(v2 + 48) = v9;
  objc_msgSend(*(id *)(v2 + 64), "setBounds:", 0.0, 0.0, v9, v9);
  [*(id *)(v2 + 64) frame];
  double v10 = CGRectGetWidth(v16) * 0.5;
  id result = [*(id *)(v2 + 64) cornerRadius];
  if (v10 != v12)
  {
    id v13 = *(void **)(v2 + 64);
    return [v13 setCornerRadius:v10];
  }
  return result;
}

uint64_t sub_14DD4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AXMotionCuesGridElement()
{
  return self;
}

unint64_t sub_14E38()
{
  unint64_t result = qword_30758;
  if (!qword_30758)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_30758);
  }
  return result;
}

uint64_t sub_14E78(uint64_t a1)
{
  unint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_14EBC()
{
  qword_30760 = 0x75436E6F69746F4DLL;
  *(void *)algn_30768 = 0xEA00000000007365;
}

uint64_t sub_14EE4(uint64_t a1)
{
  unint64_t v2 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v3 = sub_1EF10();
    uint64_t v5 = v4;
    sub_1EF60();
    char v6 = sub_1EF20();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_18788(v3, v5, v2 != 0);
      return 0;
    }
LABEL_7:
    sub_18288(v3, v5, v2 != 0, a1);
    uint64_t v7 = v11;
    sub_18788(v3, v5, v2 != 0);
    return v7;
  }
  uint64_t result = sub_18500(a1);
  if ((v10 & 1) == 0)
  {
    uint64_t v5 = v9;
    if (*(_DWORD *)(a1 + 36) == v9)
    {
      uint64_t v3 = result;
      if (result == 1 << *(unsigned char *)(a1 + 32)) {
        goto LABEL_3;
      }
      goto LABEL_7;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

char *sub_14FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)&v5[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_displayLink] = 0;
  uint64_t v11 = &v5[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_updateTimestamp];
  *(void *)uint64_t v11 = 0;
  v11[8] = 1;
  *(void *)&v5[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rows] = _swiftEmptyArrayStorage;
  uint64_t v12 = OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_gridView;
  id v13 = objc_allocWithZone((Class)UIView);
  id v14 = v5;
  *(void *)&v5[v12] = [v13 init];
  CGRect v15 = &v14[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_fullWidth];
  *(void *)CGRect v15 = 0;
  v15[8] = 1;
  CGRect v16 = &v14[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_fullHeight];
  *(void *)CGRect v16 = 0;
  v16[8] = 1;
  id v17 = &v14[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_leftEdge];
  *(void *)id v17 = 0;
  v17[8] = 1;
  id v18 = &v14[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rightEdge];
  *(void *)id v18 = 0;
  v18[8] = 1;
  double v19 = &v14[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_topEdge];
  *(void *)double v19 = 0;
  v19[8] = 1;
  int64_t v20 = &v14[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_bottomEdge];
  *(void *)int64_t v20 = 0;
  v20[8] = 1;
  uint64_t v21 = &v14[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_statistics];
  *(_OWORD *)uint64_t v21 = 0u;
  *((void *)v21 + 2) = 0x7FEFFFFFFFFFFFFFLL;
  *(_OWORD *)(v21 + 24) = 0u;
  *(_OWORD *)(v21 + 40) = xmmword_1FE70;
  v14[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_modelReceivingData] = 0;
  *(void *)&v14[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_model] = a1;
  uint64_t v22 = &v14[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_motionCuesMovingHandler];
  *(void *)uint64_t v22 = a2;
  *((void *)v22 + 1) = a3;
  uint64_t v23 = &v14[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_motionCuesVisibleHandler];
  *(void *)uint64_t v23 = a4;
  *((void *)v23 + 1) = a5;
  swift_retain();
  swift_retain();
  swift_retain();

  v36.receiver = v14;
  v36.super_class = (Class)type metadata accessor for AXMotionCuesRootViewController();
  double v24 = (char *)objc_msgSendSuper2(&v36, "initWithNibName:bundle:", 0, 0);
  if (_UIUpdateCycleEnabled())
  {
    if (qword_2FC58 != -1) {
      swift_once();
    }
    uint64_t v25 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v35[4] = sub_18A28;
    v35[5] = v25;
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 1107296256;
    v35[2] = sub_15794;
    v35[3] = &unk_297D8;
    unint64_t v26 = _Block_copy(v35);
    swift_release();
    uint64_t inserted = _UIUpdateSequenceInsertItem();
    _Block_release(v26);
    qword_30770 = inserted;
    swift_beginAccess();
    _UIUpdateRequestActivate();
    swift_endAccess();

    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    id v28 = [self displayLinkWithTarget:v24 selector:"updateLayout"];
    LODWORD(v29) = 1114636288;
    LODWORD(v30) = 1123024896;
    LODWORD(v31) = 1117782016;
    objc_msgSend(v28, "setPreferredFrameRateRange:", v29, v30, v31);
    id v32 = [self mainRunLoop];
    [v28 addToRunLoop:v32 forMode:NSDefaultRunLoopMode];

    swift_release();
    swift_release();
    swift_release();
    uint64_t v33 = *(void **)&v24[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_displayLink];
    *(void *)&v24[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_displayLink] = v28;
  }
  return v24;
}

void sub_15408()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return;
  }
  unint64_t v1 = (unsigned char *)Strong;
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = CACurrentMediaTime();
  uint64_t v4 = (double *)&v1[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_updateTimestamp];
  if (v1[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_updateTimestamp + 8])
  {
    double v5 = 0.0125;
  }
  else
  {
    double v6 = v3 - *v4;
    if (v6 <= 0.00833333333) {
      double v6 = 0.00833333333;
    }
    double v5 = fmin(v6, 0.0333333333);
  }
  double *v4 = v3;
  *((unsigned char *)v4 + 8) = 0;
  id v7 = sub_18588();
  if ((v8 & 1) != 0
    || (uint64_t v9 = (uint64_t)v7,
        sub_18A68((uint64_t)v7, (uint64_t)v36, v5),
        sub_18220((uint64_t)v36, (uint64_t)&v37),
        (v40 & 1) != 0))
  {
    uint64_t v10 = OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_modelReceivingData;
    if (v1[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_modelReceivingData] == 1)
    {
      (*(void (**)(void))&v1[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_motionCuesMovingHandler])(0);
      v1[v10] = 0;
    }
LABEL_29:

    return;
  }
  v41[0] = v37;
  v41[1] = v38;
  uint64_t v31 = v39;
  uint64_t v42 = v39;
  uint64_t v29 = *((void *)&v37 + 1);
  uint64_t v30 = v37;
  uint64_t v27 = *((void *)&v38 + 1);
  uint64_t v28 = v38;
  double v11 = CFAbsoluteTimeGetCurrent();
  uint64_t v12 = &v1[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rows];
  swift_beginAccess();
  uint64_t v34 = *(void *)(*(void *)v12 + 16);
  if (!v34)
  {
LABEL_26:
    uint64_t v25 = OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_modelReceivingData;
    if ((v1[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_modelReceivingData] & 1) == 0) {
      (*(void (**)(uint64_t))&v1[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_motionCuesMovingHandler])(1);
    }
    v1[v25] = 1;
    CFAbsoluteTime v26 = CFAbsoluteTimeGetCurrent();
    sub_18690(v11 - Current, v26 - Current);
    goto LABEL_29;
  }
  uint64_t v13 = OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_gridView;
  uint64_t v33 = *(void *)v12 + 32;
  uint64_t v14 = swift_bridgeObjectRetain();
  unint64_t v15 = 0;
  uint64_t v32 = v14;
  while (v15 < *(void *)(v14 + 16))
  {
    unint64_t v16 = *(void *)(v33 + 8 * v15);
    unint64_t v35 = v15;
    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_1F020();
      if (!v17) {
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v17 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (!v17) {
        goto LABEL_13;
      }
    }
    v43[0] = v30;
    v43[1] = v29;
    v43[2] = v28;
    v43[3] = v27;
    v43[4] = v31;
    char v44 = 0;
    if (v17 < 1) {
      goto LABEL_32;
    }
    uint64_t v18 = 0;
    do
    {
      if ((v16 & 0xC000000000000001) != 0)
      {
        uint64_t v19 = sub_1EFE0();
      }
      else
      {
        uint64_t v19 = *(void *)(v16 + 8 * v18 + 32);
        swift_retain();
      }
      ++v18;
      int64_t v20 = *(void **)(v19 + 16);
      id v21 = *(id *)&v1[v13];
      [v20 center];
      objc_msgSend(v21, "convertPoint:toView:", 0);
      double v23 = v22;

      sub_17924(v9, (uint64_t)v43, v19, v23, v24, v5);
      sub_16CE0(v19, (double *)v41, v5);
      swift_release();
    }
    while (v17 != v18);
LABEL_13:
    unint64_t v15 = v35 + 1;
    swift_bridgeObjectRelease();
    uint64_t v14 = v32;
    if (v35 + 1 == v34)
    {
      swift_bridgeObjectRelease();
      goto LABEL_26;
    }
  }
  __break(1u);
LABEL_32:
  __break(1u);
}

uint64_t sub_15794(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  id v7 = *(void (**)(uint64_t, uint64_t, double))(a1 + 32);
  swift_retain();
  v7(a2, a3, a4);

  return swift_release();
}

id AXMotionCuesRootViewController.__deallocating_deinit()
{
  sub_175C4();
  uint64_t v1 = OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_displayLink;
  unint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_displayLink];
  if (v2)
  {
    [v2 invalidate];
    double v3 = *(void **)&v0[v1];
  }
  else
  {
    double v3 = 0;
  }
  *(void *)&v0[v1] = 0;

  swift_beginAccess();
  _UIUpdateRequestDeactivate();
  swift_endAccess();
  if (qword_30770)
  {
    _UIUpdateSequenceRemoveItem();
    qword_30770 = 0;
  }
  v5.receiver = v0;
  v5.super_class = (Class)type metadata accessor for AXMotionCuesRootViewController();
  return objc_msgSendSuper2(&v5, "dealloc");
}

Swift::Bool __swiftcall AXMotionCuesRootViewController._canShowWhileLocked()()
{
  return 1;
}

Swift::Void __swiftcall AXMotionCuesRootViewController.viewDidLoad()()
{
  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for AXMotionCuesRootViewController();
  objc_msgSendSuper2(&v7, "viewDidLoad");
  id v1 = [v0 view];
  if (v1)
  {
    unint64_t v2 = v1;
    [v1 frame];
    double v4 = v3;
    double v6 = v5;

    sub_16EE0(v4, v6);
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall AXMotionCuesRootViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for AXMotionCuesRootViewController();
  objc_msgSendSuper2(&v7, "viewDidAppear:", a1);
  double v3 = self;
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6[4] = sub_178A0;
  v6[5] = v4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_14E78;
  v6[3] = &unk_295D8;
  double v5 = _Block_copy(v6);
  swift_release();
  [v3 animateWithDuration:0 delay:v5 options:0 animations:1.0 completion:0.0];
  _Block_release(v5);
}

void AXMotionCuesRootViewController.viewWillTransition(to:with:)(void *a1, double a2, double a3)
{
  v18.receiver = v3;
  v18.super_class = (Class)type metadata accessor for AXMotionCuesRootViewController();
  objc_msgSendSuper2(&v18, "viewWillTransitionToSize:withTransitionCoordinator:", a1, a2, a3);
  uint64_t v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v16 = sub_178D8;
  uint64_t v17 = v7;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_15F38;
  unint64_t v15 = &unk_29600;
  char v8 = _Block_copy(&v12);
  swift_release();
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(double *)(v10 + 24) = a2;
  *(double *)(v10 + 32) = a3;
  unint64_t v16 = sub_17918;
  uint64_t v17 = v10;
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_15F38;
  unint64_t v15 = &unk_29650;
  double v11 = _Block_copy(&v12);
  swift_release();
  [a1 animateAlongsideTransition:v8 completion:v11];
  _Block_release(v11);
  _Block_release(v8);
}

void sub_15E14()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    unint64_t v2 = self;
    uint64_t v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_18A04;
    aBlock[5] = v3;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_14E78;
    aBlock[3] = &unk_297B0;
    uint64_t v4 = _Block_copy(aBlock);
    swift_release();
    [v2 animateWithDuration:0 delay:v4 options:0 animations:0.5 completion:0.0];
    _Block_release(v4);
  }
}

uint64_t sub_15F38(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_15F98(double a1, double a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    double v5 = (void *)Strong;
    sub_16EE0(a1, a2);
    double v6 = self;
    uint64_t v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_178A0;
    aBlock[5] = v7;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_14E78;
    aBlock[3] = &unk_29788;
    char v8 = _Block_copy(aBlock);
    swift_release();
    [v6 animateWithDuration:0 delay:v8 options:0 animations:1.0 completion:0.0];
    _Block_release(v8);
  }
}

uint64_t AXMotionCuesRootViewController.prepareForRemoval()()
{
  v1[2] = v0;
  v1[3] = sub_1ED10();
  v1[4] = sub_1ED00();
  uint64_t v3 = sub_1ECE0();
  v1[5] = v3;
  void v1[6] = v2;
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_161E0, v3, v2);
}

uint64_t sub_161E0()
{
  uint64_t v1 = v0[2];
  v0[7] = sub_1ED00();
  uint64_t v2 = swift_task_alloc();
  v0[8] = v2;
  *(void *)(v2 + 16) = v1;
  uint64_t v3 = (void *)swift_task_alloc();
  v0[9] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_162E4;
  return withCheckedContinuation<A>(isolation:function:_:)();
}

uint64_t sub_162E4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 48);
  uint64_t v3 = *(void *)(v1 + 40);
  return ((uint64_t (*)(uint64_t (*)(), uint64_t, uint64_t))_swift_task_switch)(sub_16444, v3, v2);
}

uint64_t sub_16444()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_164A4(uint64_t a1)
{
  uint64_t v2 = sub_55DC(&qword_30858);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(void *)(v3 + 64);
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v6 + v5, (char *)&aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  uint64_t v7 = self;
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  unint64_t v16 = sub_18A04;
  uint64_t v17 = v8;
  aBlock = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_14E78;
  unint64_t v15 = &unk_29738;
  uint64_t v9 = _Block_copy(&aBlock);
  swift_release();
  unint64_t v16 = sub_1899C;
  uint64_t v17 = v6;
  aBlock = _NSConcreteStackBlock;
  uint64_t v13 = 1107296256;
  uint64_t v14 = sub_168E0;
  unint64_t v15 = &unk_29760;
  uint64_t v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  [v7 animateWithDuration:0 delay:v9 options:v10 animations:0.5 completion:0.0];
  _Block_release(v10);
  _Block_release(v9);
  return swift_release();
}

void sub_16710(CGFloat a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return;
  }
  uint64_t v3 = (void *)Strong;
  uint64_t v4 = (uint64_t *)(Strong + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rows);
  swift_beginAccess();
  uint64_t v5 = *v4;
  uint64_t v6 = *(void *)(v5 + 16);
  if (!v6)
  {

    return;
  }
  uint64_t v13 = v3;
  swift_bridgeObjectRetain();
  unint64_t v7 = 0;
  while (v7 < *(void *)(v5 + 16))
  {
    unint64_t v8 = *(void *)(v5 + 32 + 8 * v7);
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_1F020();
      if (!v9) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v9 = *(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (!v9) {
        goto LABEL_4;
      }
    }
    if (v9 < 1) {
      goto LABEL_20;
    }
    uint64_t v10 = 0;
    do
    {
      if ((v8 & 0xC000000000000001) != 0)
      {
        uint64_t v11 = sub_1EFE0();
      }
      else
      {
        uint64_t v11 = *(void *)(v8 + 8 * v10 + 32);
        swift_retain();
      }
      ++v10;
      uint64_t v12 = *(void **)(v11 + 16);
      CGAffineTransformMakeScale(&v14, a1, a1);
      objc_msgSend(v12, "setTransform:", &v14, v13);
      swift_release();
    }
    while (v9 != v10);
LABEL_4:
    ++v7;
    swift_bridgeObjectRelease();
    if (v7 == v6)
    {

      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
LABEL_20:
  __break(1u);
}

uint64_t sub_168E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_16934()
{
  uint64_t v1 = v0;
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = CACurrentMediaTime();
  uint64_t v4 = v0 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_updateTimestamp;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_updateTimestamp + 8))
  {
    double v5 = 0.0125;
  }
  else
  {
    double v6 = v3 - *(double *)v4;
    if (v6 <= 0.00833333333) {
      double v6 = 0.00833333333;
    }
    double v5 = fmin(v6, 0.0333333333);
  }
  *(double *)uint64_t v4 = v3;
  *(unsigned char *)(v4 + 8) = 0;
  id v7 = sub_18588();
  if ((v8 & 1) != 0
    || (uint64_t v9 = (uint64_t)v7,
        sub_18A68((uint64_t)v7, (uint64_t)v36, v5),
        sub_18220((uint64_t)v36, (uint64_t)&v37),
        (v40 & 1) != 0))
  {
    uint64_t v10 = OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_modelReceivingData;
    if (*(unsigned char *)(v0 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_modelReceivingData) == 1)
    {
      (*(void (**)(void))(v0
                                     + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_motionCuesMovingHandler))(0);
      *(unsigned char *)(v0 + v10) = 0;
    }
    return;
  }
  v41[0] = v37;
  v41[1] = v38;
  uint64_t v31 = v39;
  uint64_t v42 = v39;
  uint64_t v29 = *((void *)&v37 + 1);
  uint64_t v30 = v37;
  uint64_t v27 = *((void *)&v38 + 1);
  uint64_t v28 = v38;
  double v11 = CFAbsoluteTimeGetCurrent();
  uint64_t v12 = v0 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rows;
  swift_beginAccess();
  uint64_t v34 = *(void *)(*(void *)v12 + 16);
  if (!v34)
  {
LABEL_25:
    uint64_t v25 = OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_modelReceivingData;
    if ((*(unsigned char *)(v1 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_modelReceivingData) & 1) == 0) {
      (*(void (**)(uint64_t))(v1
    }
                                      + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_motionCuesMovingHandler))(1);
    *(unsigned char *)(v1 + v25) = 1;
    CFAbsoluteTime v26 = CFAbsoluteTimeGetCurrent();
    sub_18690(v11 - Current, v26 - Current);
    return;
  }
  uint64_t v13 = OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_gridView;
  uint64_t v33 = *(void *)v12 + 32;
  uint64_t v14 = swift_bridgeObjectRetain();
  unint64_t v15 = 0;
  uint64_t v32 = v14;
  while (v15 < *(void *)(v14 + 16))
  {
    unint64_t v16 = *(void *)(v33 + 8 * v15);
    unint64_t v35 = v15;
    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_1F020();
      if (!v17) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v17 = *(void *)((char *)&dword_10 + (v16 & 0xFFFFFFFFFFFFFF8));
      swift_bridgeObjectRetain();
      if (!v17) {
        goto LABEL_12;
      }
    }
    v43[0] = v30;
    v43[1] = v29;
    v43[2] = v28;
    v43[3] = v27;
    v43[4] = v31;
    char v44 = 0;
    if (v17 < 1) {
      goto LABEL_30;
    }
    uint64_t v18 = 0;
    do
    {
      if ((v16 & 0xC000000000000001) != 0)
      {
        uint64_t v19 = sub_1EFE0();
      }
      else
      {
        uint64_t v19 = *(void *)(v16 + 8 * v18 + 32);
        swift_retain();
      }
      ++v18;
      int64_t v20 = *(void **)(v19 + 16);
      id v21 = *(id *)(v1 + v13);
      [v20 center];
      objc_msgSend(v21, "convertPoint:toView:", 0);
      double v23 = v22;

      sub_17924(v9, (uint64_t)v43, v19, v23, v24, v5);
      sub_16CE0(v19, (double *)v41, v5);
      swift_release();
    }
    while (v17 != v18);
LABEL_12:
    unint64_t v15 = v35 + 1;
    swift_bridgeObjectRelease();
    uint64_t v14 = v32;
    if (v35 + 1 == v34)
    {
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
}

id sub_16CE0(uint64_t a1, double *a2, double a3)
{
  double v6 = a3 * 80.0;
  if ((*(unsigned char *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_leftEdge + 8) & 1) == 0
    && (*(unsigned char *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rightEdge + 8) & 1) == 0
    && (*(unsigned char *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_fullWidth + 8) & 1) == 0)
  {
    double v7 = *(double *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_leftEdge);
    double v8 = *(double *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_fullWidth);
    double v9 = *(double *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rightEdge);
    id v10 = [self currentDevice];
    double v11 = (char *)[v10 userInterfaceIdiom];

    double v12 = 15.0;
    if (v11 == (unsigned char *)&dword_0 + 1) {
      double v12 = 20.0;
    }
    double v13 = *(double *)(a1 + 24) + v6 * (*a2 * v12);
    *(double *)(a1 + 24) = v13;
    if (v9 <= v13)
    {
      double v14 = v13 - v8;
      goto LABEL_10;
    }
    if (v13 <= v7)
    {
      double v14 = v8 + v13;
LABEL_10:
      *(double *)(a1 + 24) = v14;
    }
  }
  if ((*(unsigned char *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_topEdge + 8) & 1) == 0
    && (*(unsigned char *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_bottomEdge + 8) & 1) == 0
    && (*(unsigned char *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_fullHeight + 8) & 1) == 0)
  {
    double v15 = *(double *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_topEdge);
    double v16 = *(double *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_fullHeight);
    double v17 = *(double *)(v3 + OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_bottomEdge);
    id v18 = [self currentDevice];
    uint64_t v19 = (char *)[v18 userInterfaceIdiom];

    double v20 = -15.0;
    if (v19 == (unsigned char *)&dword_0 + 1) {
      double v20 = -20.0;
    }
    double v21 = *(double *)(a1 + 32) + v6 * (a2[1] * v20);
    *(double *)(a1 + 32) = v21;
    if (v17 <= v21)
    {
      double v22 = v21 - v16;
    }
    else
    {
      if (v21 > v15) {
        goto LABEL_21;
      }
      double v22 = v16 + v21;
    }
    *(double *)(a1 + 32) = v22;
  }
LABEL_21:
  double v23 = *(void **)(a1 + 16);
  double v24 = *(double *)(a1 + 24);
  double v25 = *(double *)(a1 + 32);

  return objc_msgSend(v23, "setCenter:", v24, v25);
}

void sub_16EE0(double a1, double a2)
{
  uint64_t v3 = v2;
  double v6 = (__objc2_ivar_list *)sub_1EB90();
  uint64_t v7 = (uint64_t)v6[-1];
  __chkstk_darwin(v6);
  double v9 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_175C4();
  id v10 = sub_18588();
  if ((v11 & 1) == 0)
  {
    uint64_t v12 = (uint64_t)v10;
    uint64_t v13 = OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_gridView;
    objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_gridView], "setFrame:", 0.5, 0.5, a1, a2);
    id v14 = sub_1BEF0();
    [*(id *)&v2[v13] bounds];
    objc_msgSend(v14, "setFrame:");
    [v14 setCaptureOnly:1];
    id v15 = [*(id *)&v2[v13] layer];
    id v57 = v14;
    [v15 addSublayer:v14];

    id v16 = [v3 view];
    if (!v16)
    {
      __break(1u);
      return;
    }
    double v17 = v16;
    [v16 addSubview:*(void *)&v3[v13]];

    id v18 = self;
    id v19 = [v18 currentDevice];
    [v19 userInterfaceIdiom];

    LODWORD(v19) = sub_18210(v12);
    id v20 = [v18 currentDevice];
    double v21 = (char *)[v20 userInterfaceIdiom];

    BOOL v22 = v19 == 0;
    if (v19) {
      double v9 = (unsigned char *)(&dword_4 + 3);
    }
    else {
      double v9 = (unsigned char *)(&dword_4 + 1);
    }
    double v23 = a2 * 1.1;
    double v24 = a1 * -0.05;
    double v25 = a1 * 1.1 / (double)(uint64_t)v9;
    uint64_t v26 = 10;
    if (!v22) {
      uint64_t v26 = 6;
    }
    uint64_t v27 = 8;
    if (!v22) {
      uint64_t v27 = 4;
    }
    if (v21 == (unsigned char *)&dword_0 + 1) {
      uint64_t v28 = v26;
    }
    else {
      uint64_t v28 = v27;
    }
    double v29 = v23 / (double)v28;
    uint64_t v30 = (double *)&v3[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_fullHeight];
    *uint64_t v30 = v23;
    *((unsigned char *)v30 + 8) = 0;
    uint64_t v31 = (double *)&v3[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_fullWidth];
    *uint64_t v31 = a1 * 1.1;
    *((unsigned char *)v31 + 8) = 0;
    uint64_t v32 = (double *)&v3[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_leftEdge];
    *uint64_t v32 = v24;
    *((unsigned char *)v32 + 8) = 0;
    uint64_t v33 = (double *)&v3[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rightEdge];
    *uint64_t v33 = a1 * 1.05;
    *((unsigned char *)v33 + 8) = 0;
    uint64_t v34 = (double *)&v3[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_topEdge];
    double *v34 = a2 * -0.05;
    *((unsigned char *)v34 + 8) = 0;
    unint64_t v35 = (double *)&v3[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_bottomEdge];
    *unint64_t v35 = a2 * 1.05;
    *((unsigned char *)v35 + 8) = 0;
    double v36 = a2 * 0.5 - ((double)v28 * 0.5 * v29 + v29 * 0.5);
    memset(v63, 0, sizeof(v63));
    uint64_t v64 = 0;
    char v65 = 1;
    uint64_t v59 = (double **)&v3[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rows];
    uint64_t v7 = type metadata accessor for AXMotionCuesGridElement();
    uint64_t v37 = 0;
    double v6 = &OBJC_INSTANCE_VARIABLES__TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable;
    uint64_t v58 = v28;
    while (v37 != v28)
    {
      long long v38 = 0;
      uint64_t v60 = v37 + 1;
      if (v37) {
        double v39 = v25 * 0.5;
      }
      else {
        double v39 = a1 * 1.1 / (double)(uint64_t)v9;
      }
      double v40 = v24 + v39;
      unint64_t v62 = (unint64_t)_swiftEmptyArrayStorage;
      do
      {
        double v41 = v40 + v25 * (double)(uint64_t)++v38;
        swift_allocObject();
        uint64_t v42 = sub_14AC8(v41, v36);
        id v43 = [*(id *)(v42 + 16) layer];
        LODWORD(v44) = 0.75;
        [v43 setOpacity:v44];

        sub_17924(v12, (uint64_t)v63, v42, v41, v45, 0.0);
        uint64_t v46 = *(void **)(v42 + 16);
        CGAffineTransformMakeScale(&v61, 0.01, 0.01);
        [v46 setTransform:&v61];
        [*(id *)&v3[v13] addSubview:*(void *)(v42 + 16)];
        swift_retain();
        sub_1EC60();
        if (*(void *)((char *)&dword_10 + (v62 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                       + (v62 & 0xFFFFFFFFFFFFFF8)) >> 1)
          sub_1ECA0();
        sub_1ECC0();
        sub_1EC90();
        swift_release();
      }
      while (v9 != v38);
      double v47 = *(double *)&v62;
      uint64_t v48 = v59;
      swift_beginAccess();
      uint64_t v49 = *v48;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      *uint64_t v48 = v49;
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        uint64_t v49 = sub_1BA00(0, *((void *)v49 + 2) + 1, 1, v49);
        *uint64_t v59 = v49;
      }
      unint64_t v52 = *((void *)v49 + 2);
      unint64_t v51 = *((void *)v49 + 3);
      if (v52 >= v51 >> 1)
      {
        uint64_t v49 = sub_1BA00((double *)(v51 > 1), v52 + 1, 1, v49);
        *uint64_t v59 = v49;
      }
      *((void *)v49 + 2) = v52 + 1;
      v49[v52 + 4] = v47;
      swift_endAccess();
      double v36 = v29 + v36;
      uint64_t v37 = v60;
      uint64_t v28 = v58;
      if (v60 == v58)
      {
        (*(void (**)(uint64_t))&v3[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_motionCuesVisibleHandler])(1);

        return;
      }
    }
    __break(1u);
    goto LABEL_33;
  }
  if (qword_2FC30 != -1) {
LABEL_33:
  }
    swift_once();
  uint64_t v53 = sub_5690((uint64_t)v6, (uint64_t)MCLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, __objc2_ivar_list *))(v7 + 16))(v9, v53, v6);
  uint64_t v54 = sub_1EB70();
  os_log_type_t v55 = sub_1EE10();
  if (os_log_type_enabled(v54, v55))
  {
    uint64_t v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v56 = 0;
    _os_log_impl(&dword_0, v54, v55, "Failed to setup motion cues UI due to unavailable interface orientation.", v56, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, __objc2_ivar_list *))(v7 + 8))(v9, v6);
}

id sub_175C4()
{
  id v1 = [*(id *)&v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_gridView] subviews];
  sub_1124C(0, &qword_30860);
  unint64_t v2 = sub_1EC80();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    id result = (id)sub_1F020();
    uint64_t v3 = (uint64_t)result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (v2 & 0xFFFFFFFFFFFFFF8));
    id result = (id)swift_bridgeObjectRetain();
    if (!v3) {
      goto LABEL_10;
    }
  }
  if (v3 < 1)
  {
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  for (uint64_t i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v6 = (id)sub_1EFE0();
    }
    else {
      id v6 = *(id *)(v2 + 8 * i + 32);
    }
    uint64_t v7 = v6;
    [v6 removeFromSuperview];
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  id result = [v0 view];
  if (result)
  {
    uint64_t v8 = result;
    id v9 = [result subviews];

    unint64_t v10 = sub_1EC80();
    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      id result = (id)sub_1F020();
      uint64_t v11 = (uint64_t)result;
      if (result)
      {
LABEL_13:
        if (v11 >= 1)
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if ((v10 & 0xC000000000000001) != 0) {
              id v13 = (id)sub_1EFE0();
            }
            else {
              id v13 = *(id *)(v10 + 8 * j + 32);
            }
            id v14 = v13;
            [v13 removeFromSuperview];
          }
          goto LABEL_20;
        }
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v11 = *(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8));
      id result = (id)swift_bridgeObjectRetain();
      if (v11) {
        goto LABEL_13;
      }
    }
LABEL_20:
    swift_bridgeObjectRelease_n();
    id v15 = &v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rows];
    swift_beginAccess();
    *(void *)id v15 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRelease();
    return (id)(*(uint64_t (**)(void))&v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_motionCuesVisibleHandler])(0);
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AXMotionCuesRootViewController()
{
  return self;
}

uint64_t sub_17868()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_178A0()
{
}

uint64_t sub_178C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_178D0()
{
  return swift_release();
}

void sub_178D8()
{
}

uint64_t sub_178E0()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_17918()
{
  sub_15F98(*(double *)(v0 + 24), *(double *)(v0 + 32));
}

id sub_17924(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6)
{
  uint64_t v7 = v6;
  id result = [v7 view];
  if (result)
  {
    id v13 = result;
    [result frame];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v84.origin.x = v15;
    v84.origin.y = v17;
    v84.size.width = v19;
    v84.size.height = v21;
    double Width = CGRectGetWidth(v84);
    double v23 = Width;
    if (Width >= a4) {
      double Width = a4;
    }
    double v24 = 0.0;
    if (Width < 0.0) {
      double v25 = 0.0;
    }
    else {
      double v25 = Width;
    }
    double v26 = v23 * 0.0;
    uint64_t v27 = self;
    id v28 = [v27 currentDevice];
    double v29 = (char *)[v28 userInterfaceIdiom];

    BOOL v30 = sub_18210(a1);
    double v31 = 0.21;
    if (v30) {
      double v31 = 0.23;
    }
    double v32 = 0.09;
    if (v30)
    {
      double v32 = 0.145;
      double v33 = 0.35;
    }
    else
    {
      double v33 = 0.3;
    }
    if (v30) {
      double v34 = 0.25;
    }
    else {
      double v34 = 0.2;
    }
    if (v29 != (unsigned char *)&dword_0 + 1) {
      double v31 = v32;
    }
    double v35 = v23 * v31;
    id v36 = [v27 currentDevice];
    uint64_t v37 = (char *)[v36 userInterfaceIdiom];

    if (v37 == (unsigned char *)&dword_0 + 1) {
      double v38 = v33;
    }
    else {
      double v38 = v34;
    }
    double v39 = v23 * v38;
    sub_18220(a2, (uint64_t)v80);
    double v40 = 0.0;
    if ((v83 & 1) != 0 || (double v40 = v81, v24 = v82, v81 < 0.05))
    {
      double v41 = *(double *)(a3 + 24);
      double v42 = v23 * 0.5;
      double v43 = *(double *)(a3 + 56);
      if (v23 * 0.5 >= v41)
      {
        if (v43 == 0.0)
        {
          double v47 = fabs(v40) * 0.25 / 0.05 + 0.5;
          double v48 = fmin(v47, 2.0);
          if (v47 < 1.0) {
            double v44 = 1.0;
          }
          else {
            double v44 = v48;
          }
        }
        else
        {
          double v44 = 1.0;
        }
      }
      else
      {
        double v44 = 1.0;
        if (v43 == 1.0)
        {
          double v45 = fabs(v40) * 0.5 / 0.05 + 0.5;
          double v46 = fmin(v45, 3.0);
          double v43 = 1.0;
          if (v45 < 1.0) {
            double v44 = 1.0;
          }
          else {
            double v44 = v46;
          }
        }
      }
      if (v40 <= 0.05)
      {
LABEL_45:
        double v52 = v26 + 6.0;
        double v53 = v35 * v44;
        double v54 = v53 + -1.2;
        if (v43 >= 1.0) {
          double v54 = v53;
        }
        if (v54 >= v39) {
          double v55 = v39;
        }
        else {
          double v55 = v54;
        }
        double v56 = fabs(v24);
        double v57 = v56 + v56;
        double v58 = v23 * v57;
        if (v23 * v57 >= v39 * 0.95) {
          double v59 = v39 * 0.95;
        }
        else {
          double v59 = v23 * v57;
        }
        if (v54 > v59) {
          double v59 = v54;
        }
        double v60 = v39 * 0.95 * 0.7;
        double v61 = v58 * 0.7;
        if (v61 < v60) {
          double v60 = v61;
        }
        if (v54 > v60) {
          double v60 = v54;
        }
        double v62 = v40 * -0.75 + 1.0;
        if (v62 >= 0.7)
        {
          double v63 = a6;
          if (v40 > 0.05)
          {
            double v64 = 1.0;
            if (v43 == 100.0)
            {
              double v65 = v62;
              goto LABEL_66;
            }
            if (v25 > v52 && v25 > v52 + v55)
            {
              double v55 = v60;
              double v65 = v62;
              goto LABEL_79;
            }
            goto LABEL_98;
          }
          if (v40 < -0.05)
          {
            double v65 = 1.0;
            if (v43 == 100.0)
            {
              double v64 = v40 * -0.75 + 1.0;
              goto LABEL_73;
            }
            double v66 = 1.0;
            if (v25 <= v52 || (double v78 = v52 + v60, v25 <= v52 + v60))
            {
              double v64 = v62;
              goto LABEL_99;
            }
LABEL_134:
            double v65 = 1.0;
            if (v78 >= v25) {
              goto LABEL_80;
            }
            goto LABEL_79;
          }
        }
        else
        {
          double v63 = a6;
          if (v40 > 0.05)
          {
            if (v43 == 100.0)
            {
              double v64 = 1.0;
              double v65 = 0.7;
LABEL_66:
              double v59 = v60;
LABEL_76:
              double v52 = 6.0;
              double v66 = 1.0;
              if (v25 > 6.0 && v25 > v55 + 0.0 + 6.0)
              {
                double v55 = v59 + 0.0;
                goto LABEL_79;
              }
LABEL_99:
              double v68 = v26 + v35 + v52;
              if (v25 > v68) {
                goto LABEL_100;
              }
              double v76 = 1.0;
              double v77 = 1.0;
              if (v66 >= 1.0) {
                goto LABEL_133;
              }
              goto LABEL_118;
            }
            double v64 = 1.0;
            if (v25 > v52)
            {
              double v67 = v52 + v55;
              if (v25 > v67)
              {
                double v65 = 0.7;
                BOOL v75 = v67 < v25;
                double v55 = v60;
                if (!v75)
                {
LABEL_80:
                  if (v25 > v23 - v52 || (double v66 = 1.0, v23 - (v55 + v52) >= v25))
                  {
                    double v64 = 0.7;
                    if (v23 - v52 < v25) {
                      double v64 = v65;
                    }
                    double v66 = 1.0;
                    if (v23 - v52 >= v25) {
                      double v66 = 0.0;
                    }
                  }
                  else
                  {
                    double v64 = v65;
                  }
                  goto LABEL_99;
                }
LABEL_79:
                if (v25 <= v23 - (v55 + v52))
                {
                  double v68 = v26 + v35 + v52;
                  double v64 = 1.0;
                  double v66 = 0.0;
                  if (v25 > v68)
                  {
LABEL_100:
                    double v69 = v23 * 0.2;
                    double v70 = v23 * 0.2 + v68;
                    if (v68 < v25 && v25 <= v70)
                    {
                      double v77 = (v25 - v68) / v69 * -0.7 + 1.0;
                      goto LABEL_131;
                    }
                    double v72 = v23 - v70;
                    if (v70 < v25 && v25 <= v72)
                    {
                      double v76 = 1.0;
                      double v77 = 0.3;
                      if (v66 >= 1.0) {
                        goto LABEL_133;
                      }
                      goto LABEL_132;
                    }
                    double v74 = v23 - v68;
                    BOOL v75 = v25 <= v74 && v72 < v25;
                    if (v75)
                    {
                      double v77 = (v25 - v72) / v69 * 0.7 + 0.3;
                    }
                    else
                    {
                      if (v74 < v25)
                      {
                        double v77 = 1.0;
                        if (v66 >= 1.0)
                        {
                          double v76 = 1.0;
                          goto LABEL_133;
                        }
LABEL_132:
                        double v76 = v66;
                        goto LABEL_133;
                      }
                      double v77 = 0.0;
                    }
LABEL_131:
                    double v76 = 1.0;
                    if (v66 < 1.0) {
                      goto LABEL_132;
                    }
LABEL_133:
                    *(double *)(a3 + 56) = v76;
                    return sub_14C4C(v77 * (v64 * (v76 * 12.0)), v63);
                  }
LABEL_118:
                  double v77 = 1.0;
                  goto LABEL_132;
                }
                goto LABEL_80;
              }
            }
LABEL_98:
            double v66 = 1.0;
            goto LABEL_99;
          }
          if (v40 < -0.05)
          {
            if (v43 == 100.0)
            {
              double v65 = 1.0;
              double v64 = 0.7;
LABEL_73:
              double v59 = v55;
              double v55 = v60;
              goto LABEL_76;
            }
            double v66 = 1.0;
            if (v25 <= v52 || (double v78 = v52 + v60, v25 <= v52 + v60))
            {
              double v64 = 0.7;
              goto LABEL_99;
            }
            goto LABEL_134;
          }
        }
        double v65 = 1.0;
        if (v43 == 100.0)
        {
          double v64 = 1.0;
          double v55 = v59;
          goto LABEL_76;
        }
        double v64 = 1.0;
        if (v25 > v52 && v25 > v52 + v59)
        {
          double v55 = v59;
          goto LABEL_79;
        }
        goto LABEL_98;
      }
    }
    else
    {
      if (v81 <= 0.05)
      {
        double v43 = *(double *)(a3 + 56);
        double v44 = 1.0;
        goto LABEL_45;
      }
      double v41 = *(double *)(a3 + 24);
      double v42 = v23 * 0.5;
      double v44 = 1.0;
    }
    double v49 = *(double *)(a3 + 56);
    if (v41 >= v42)
    {
      if (v49 == 0.0)
      {
        double v51 = fabs(v40) * 0.25 / 0.05 + 0.5;
        double v44 = fmin(v51, 2.0);
        if (v51 < 1.0) {
          double v44 = 1.0;
        }
      }
    }
    else
    {
      double v43 = 1.0;
      if (v49 == 1.0)
      {
        double v50 = fabs(v40) * 0.5 / 0.05 + 0.5;
        double v44 = fmin(v50, 3.0);
        if (v50 < 1.0) {
          double v44 = 1.0;
        }
        goto LABEL_45;
      }
    }
    double v43 = *(double *)(a3 + 56);
    goto LABEL_45;
  }
  __break(1u);
  return result;
}

id AXMotionCuesRootViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_1EC10();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

void AXMotionCuesRootViewController.init(nibName:bundle:)()
{
}

__n128 initializeWithCopy for AXMotionCuesStatistics(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for AXMotionCuesStatistics(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AXMotionCuesStatistics(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 56) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AXMotionCuesStatistics()
{
  return &type metadata for AXMotionCuesStatistics;
}

BOOL sub_18210(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

uint64_t sub_18220(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_55DC(&qword_30840);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_18288(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v6 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if (a3)
    {
      sub_1EF50();
      sub_1124C(0, &qword_30848);
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
  if (sub_1EF30() != *(_DWORD *)(a4 + 36))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  sub_1EF40();
  sub_1124C(0, &qword_30848);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  uint64_t v4 = v16;
  swift_unknownObjectRelease();
  Swift::Int v7 = sub_1EE60(*(void *)(a4 + 40));
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
  char v10 = sub_1EE70();

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
      char v13 = sub_1EE70();
    }
    while ((v13 & 1) == 0);
  }

LABEL_17:
  double v14 = *(void **)(*(void *)(a4 + 48) + 8 * v6);

  id v15 = v14;
}

uint64_t sub_18500(uint64_t a1)
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

id sub_18588()
{
  id v0 = [self sharedApplication];
  id v1 = [v0 connectedScenes];

  sub_1124C(0, &qword_30848);
  sub_18720();
  uint64_t v2 = sub_1EDE0();

  uint64_t v3 = (void *)sub_14EE4(v2);
  swift_bridgeObjectRelease();
  if (!v3) {
    return 0;
  }
  self;
  uint64_t v4 = (void *)swift_dynamicCastObjCClass();
  if (v4) {
    id v5 = [v4 interfaceOrientation];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

void sub_18690(double a1, double a2)
{
  if (__OFADD__(*(void *)v2, 1))
  {
    __break(1u);
  }
  else
  {
    ++*(void *)v2;
    if (*(double *)(v2 + 40) > a1) {
      *(double *)(v2 + 40) = a1;
    }
    if (*(double *)(v2 + 48) < a1) {
      *(double *)(v2 + 48) = a1;
    }
    *(double *)(v2 + 32) = a1 * 0.25 + *(double *)(v2 + 32) * 0.75;
    if (*(double *)(v2 + 16) > a2) {
      *(double *)(v2 + 16) = a2;
    }
    if (*(double *)(v2 + 24) < a2) {
      *(double *)(v2 + 24) = a2;
    }
    *(double *)(v2 + 8) = a2 * 0.25 + *(double *)(v2 + 8) * 0.75;
  }
}

unint64_t sub_18720()
{
  unint64_t result = qword_30850;
  if (!qword_30850)
  {
    sub_1124C(255, &qword_30848);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_30850);
  }
  return result;
}

uint64_t sub_18788(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_18794()
{
  *(void *)&v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_displayLink] = 0;
  id v1 = &v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_updateTimestamp];
  *(void *)id v1 = 0;
  v1[8] = 1;
  *(void *)&v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rows] = _swiftEmptyArrayStorage;
  uint64_t v2 = OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_gridView;
  *(void *)&v0[v2] = [objc_allocWithZone((Class)UIView) init];
  uint64_t v3 = &v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_fullWidth];
  *(void *)uint64_t v3 = 0;
  v3[8] = 1;
  uint64_t v4 = &v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_fullHeight];
  *(void *)uint64_t v4 = 0;
  v4[8] = 1;
  id v5 = &v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_leftEdge];
  *(void *)id v5 = 0;
  v5[8] = 1;
  unsigned int v6 = &v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_rightEdge];
  *(void *)unsigned int v6 = 0;
  v6[8] = 1;
  unint64_t v7 = &v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_topEdge];
  *(void *)unint64_t v7 = 0;
  v7[8] = 1;
  unint64_t v8 = &v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_bottomEdge];
  *(void *)unint64_t v8 = 0;
  v8[8] = 1;
  id v9 = &v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_statistics];
  *(_OWORD *)id v9 = 0u;
  *((void *)v9 + 2) = 0x7FEFFFFFFFFFFFFFLL;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_OWORD *)(v9 + 40) = xmmword_1FE70;
  v0[OBJC_IVAR____TtC18AXMotionCuesServer30AXMotionCuesRootViewController_modelReceivingData] = 0;

  sub_1F010();
  __break(1u);
}

uint64_t sub_18908()
{
  uint64_t v1 = sub_55DC(&qword_30858);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1899C()
{
  return sub_1ECF0();
}

void sub_18A04()
{
}

void sub_18A28()
{
}

void sub_18A68(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>)
{
  swift_retain();
  sub_1CB08((uint64_t)v92);
  swift_release();
  sub_1A920((uint64_t)v92, (uint64_t)v103, (uint64_t *)&unk_30A50);
  char v7 = v105;
  if (v105)
  {
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    double v12 = 0.0;
    goto LABEL_586;
  }
  v106[4] = v103[4];
  v106[5] = v103[5];
  uint64_t v107 = v104;
  v106[0] = v103[0];
  v106[1] = v103[1];
  v106[2] = v103[2];
  v106[3] = v103[3];
  sub_135D0((uint64_t)v106, a1, (uint64_t)v93);
  sub_1C6B4((uint64_t)v93, (uint64_t)v94);
  sub_139AC(v94, v95, a3);
  sub_1B2B8((uint64_t)v95, (uint64_t)&v96);
  double v13 = v102;
  double v14 = -0.5;
  if (v102 >= 0.5 || (double v14 = 0.5, v102 <= -0.5)) {
    double v15 = v102 + v14;
  }
  else {
    double v15 = 0.0;
  }
  double v16 = 0.1;
  if (v100 >= 0.1)
  {
    double v16 = -0.1;
LABEL_13:
    double v17 = v100 + v16;
    if (v101 < 0.1)
    {
      double v18 = 0.0;
      if (v101 > -0.1) {
        goto LABEL_18;
      }
      goto LABEL_15;
    }
LABEL_16:
    double v19 = -0.1;
    goto LABEL_17;
  }
  if (v100 <= -0.1) {
    goto LABEL_13;
  }
  double v17 = 0.0;
  if (v101 >= 0.1) {
    goto LABEL_16;
  }
  double v18 = 0.0;
  if (v101 <= -0.1)
  {
LABEL_15:
    double v19 = 0.1;
LABEL_17:
    double v18 = v101 + v19;
  }
LABEL_18:
  double v20 = v15 * v15;
  double v21 = v15 * v15 * 0.0 / 9.81;
  double v22 = v96 + v21;
  if (v96 + v21 > 0.0) {
    double v22 = 0.0;
  }
  double v23 = v96 - v21;
  if (v23 <= 0.0) {
    double v23 = 0.0;
  }
  if (v96 <= 0.0) {
    double v23 = v22;
  }
  if (v97 <= 0.0)
  {
    double v24 = v97 + v20 * 8.0 / 9.81;
    if (v24 > 0.0) {
      double v24 = 0.0;
    }
  }
  else
  {
    double v24 = v97 + v20 * -9.0 / 9.81;
    if (v24 <= 0.0) {
      double v24 = 0.0;
    }
  }
  double v25 = fabs(v24);
  double v26 = 0.05;
  if (v25 >= 0.05)
  {
    double v27 = *(double *)(v3 + 64) + a3;
    *(double *)(v3 + 64) = v27;
    if (v27 >= 0.5) {
      *(unsigned char *)(v3 + 82) = 1;
    }
  }
  else
  {
    *(void *)(v3 + 64) = 0;
  }
  if (v25 >= 0.05)
  {
    *(void *)(v3 + 72) = 0;
  }
  else
  {
    double v28 = *(double *)(v3 + 72) + a3;
    *(double *)(v3 + 72) = v28;
    if (v28 >= 0.1) {
      *(unsigned char *)(v3 + 82) = 0;
    }
  }
  if ((*(unsigned char *)(v3 + 82) & 1) == 0)
  {
    double v29 = v17 * v17 * 20.0 / 9.81;
    double v30 = v29 + v24;
    if (v29 + v24 > 0.0) {
      double v30 = 0.0;
    }
    double v31 = v24 - v29;
    if (v31 <= 0.0) {
      double v31 = 0.0;
    }
    if (v24 > 0.0) {
      double v24 = v31;
    }
    else {
      double v24 = v30;
    }
  }
  double v32 = 0.0125;
  if (v23 >= 0.0125)
  {
    double v32 = -0.0125;
    goto LABEL_58;
  }
  if (v23 <= -0.0125)
  {
LABEL_58:
    double v36 = v23 + v32;
    double v34 = 0.0225;
    if (v24 >= 0.0225)
    {
      double v34 = -0.0225;
    }
    else if (v24 > -0.0225)
    {
      double v35 = 0.0;
      if (v98 >= 0.05)
      {
        double v26 = -0.05;
        goto LABEL_82;
      }
      if (v98 <= -0.05)
      {
LABEL_82:
        double v44 = v98 + v26;
        double v38 = 0.06;
        if (v99 >= 0.06)
        {
          double v38 = -0.06;
        }
        else if (v99 > -0.06)
        {
          if (v13 > 0.5)
          {
            double v41 = 0.27;
            if (v36 > 0.27)
            {
              double v41 = 0.27;
              if (v35 > 0.27)
              {
                double v13 = 0.5;
                double v41 = 0.27;
                *(double *)&unint64_t v42 = 0.27;
                double v33 = 0.27;
                if (v44 > 0.27) {
                  goto LABEL_458;
                }
                double v43 = 0.0;
                double v37 = -0.27;
                *(double *)&unint64_t v42 = 0.27;
                double v41 = v44;
                double v33 = 0.27;
                double v35 = 0.27;
                if (v44 > -0.27) {
                  goto LABEL_458;
                }
                goto LABEL_462;
              }
              *(double *)&unint64_t v42 = -0.27;
              if (v35 > -0.27)
              {
                double v37 = 0.27;
                if (v44 <= 0.27)
                {
                  if (v44 > -0.27) {
                    double v37 = v44;
                  }
                  else {
                    double v37 = -0.27;
                  }
                  double v13 = 0.5;
                  double v43 = 0.0;
                  double v33 = 0.27;
                  goto LABEL_462;
                }
                double v13 = 0.5;
                double v43 = 0.0;
                goto LABEL_254;
              }
              double v13 = 0.5;
              double v33 = 0.27;
              if (v44 <= 0.27)
              {
                double v45 = 0.0;
                double v36 = 0.27;
                double v35 = -0.27;
                double v43 = 0.0;
                double v37 = v98 + v26;
                double v33 = 0.27;
                if (v44 > -0.27) {
                  goto LABEL_462;
                }
LABEL_301:
                double v37 = -0.27;
                double v43 = v45;
                double v35 = -0.27;
                double v33 = v36;
                goto LABEL_462;
              }
LABEL_458:
              double v43 = 0.0;
              double v37 = v41;
              double v39 = *(double *)&v42;
              goto LABEL_459;
            }
            double v33 = -0.27;
            if (v36 > -0.27)
            {
              double v41 = 0.27;
              if (v35 > 0.27)
              {
                double v13 = 0.5;
                *(double *)&unint64_t v42 = 0.27;
                if (v44 > 0.27)
                {
                  double v41 = 0.27;
                  double v33 = v36;
                  goto LABEL_458;
                }
                double v37 = -0.27;
                if (v44 > -0.27)
                {
                  double v41 = v44;
                  double v33 = v36;
                  goto LABEL_458;
                }
                double v43 = 0.0;
                double v35 = 0.27;
                goto LABEL_405;
              }
              *(double *)&unint64_t v42 = -0.27;
              if (v35 > -0.27)
              {
                double v37 = 0.27;
                if (v44 > 0.27)
                {
                  double v13 = 0.5;
                  double v43 = 0.0;
                  double v39 = v35;
                  double v33 = v36;
                  goto LABEL_459;
                }
                if (v44 > -0.27) {
                  double v37 = v44;
                }
                else {
                  double v37 = -0.27;
                }
                double v13 = 0.5;
                double v43 = 0.0;
LABEL_405:
                BOOL v52 = v36 <= 0.02;
                goto LABEL_406;
              }
              double v13 = 0.5;
              if (v44 > 0.27)
              {
                double v33 = v36;
                goto LABEL_458;
              }
              double v35 = -0.27;
              if (v44 <= -0.27)
              {
                double v45 = 0.0;
                if (v36 > 0.02) {
                  goto LABEL_301;
                }
                goto LABEL_591;
              }
              double v43 = 0.0;
              BOOL v52 = v36 <= 0.02;
              double v37 = v98 + v26;
LABEL_406:
              double v33 = v36;
              if (v52) {
                goto LABEL_472;
              }
              goto LABEL_462;
            }
            if (v35 > 0.27)
            {
              double v13 = 0.5;
              double v41 = 0.27;
              *(double *)&unint64_t v42 = 0.27;
              if (v44 > 0.27) {
                goto LABEL_458;
              }
              double v43 = 0.0;
              goto LABEL_395;
            }
            if (v35 > -0.27)
            {
              double v37 = 0.27;
              if (v44 <= 0.27)
              {
                double v33 = -0.27;
                if (v44 > -0.27) {
                  double v37 = v44;
                }
                else {
                  double v37 = -0.27;
                }
                double v13 = 0.5;
                double v43 = 0.0;
                goto LABEL_472;
              }
              double v13 = 0.5;
              double v33 = -0.27;
              double v39 = v35;
              goto LABEL_470;
            }
            double v13 = 0.5;
            *(double *)&unint64_t v42 = -0.27;
            if (v44 > 0.27) {
              goto LABEL_458;
            }
            goto LABEL_425;
          }
          double v37 = 0.27;
          if (v13 > -0.5)
          {
            if (v36 > 0.27)
            {
              double v33 = 0.27;
              if (v35 > 0.27)
              {
                double v43 = 0.0;
                double v37 = 0.27;
                if (v44 > 0.27)
                {
                  double v39 = 0.27;
                  double v33 = 0.27;
                  goto LABEL_459;
                }
                if (v44 > -0.27) {
                  double v37 = v44;
                }
                else {
                  double v37 = -0.27;
                }
                double v35 = 0.27;
                BOOL v53 = v13 <= 0.015;
                goto LABEL_226;
              }
              double v39 = -0.27;
              double v43 = 0.0;
              if (v35 <= -0.27)
              {
                if (v44 > 0.27)
                {
                  double v37 = 0.27;
                  goto LABEL_459;
                }
                double v39 = -0.27;
                if (v44 > -0.27)
                {
                  double v37 = v44;
                  goto LABEL_459;
                }
                double v45 = 0.0;
                goto LABEL_300;
              }
              double v37 = 0.27;
              if (v44 <= 0.27)
              {
                if (v44 > -0.27) {
                  double v37 = v44;
                }
                else {
                  double v37 = -0.27;
                }
                double v33 = 0.27;
                goto LABEL_196;
              }
LABEL_254:
              double v39 = v35;
              double v33 = 0.27;
              goto LABEL_459;
            }
            double v33 = -0.27;
            if (v36 <= -0.27)
            {
              double v45 = 0.0;
              if (v35 <= 0.27)
              {
                double v33 = -0.27;
                if (v35 <= -0.27) {
                  double v35 = -0.27;
                }
              }
              else
              {
                double v35 = 0.27;
              }
              goto LABEL_129;
            }
            double v37 = 0.27;
            if (v35 <= 0.27)
            {
              double v45 = 0.0;
              if (v35 <= -0.27)
              {
                double v35 = -0.27;
                double v33 = v36;
                goto LABEL_129;
              }
              if (v44 <= 0.27)
              {
                if (v44 > -0.27) {
                  double v41 = v44;
                }
                else {
                  double v41 = -0.27;
                }
                *(double *)&unint64_t v42 = v35;
                double v33 = v36;
                goto LABEL_458;
              }
              double v43 = 0.0;
              if (v13 <= 0.015)
              {
                double v33 = v36;
                goto LABEL_472;
              }
              goto LABEL_405;
            }
            double v39 = 0.27;
            if (v44 > 0.27)
            {
              double v43 = 0.0;
              double v37 = 0.27;
              if (v13 <= 0.015)
              {
LABEL_592:
                double v35 = v37;
                double v33 = v36;
                goto LABEL_472;
              }
              BOOL v52 = v36 <= 0.02;
              double v35 = 0.27;
              goto LABEL_406;
            }
            if (v44 > -0.27) {
              double v37 = v44;
            }
            else {
              double v37 = -0.27;
            }
            double v43 = 0.0;
            double v33 = v36;
LABEL_459:
            if (v33 > 0.02)
            {
LABEL_460:
              BOOL v55 = v13 <= 0.015;
              goto LABEL_461;
            }
            goto LABEL_471;
          }
          if (v36 > 0.27)
          {
            double v41 = 0.27;
            if (v35 <= 0.27)
            {
              *(double *)&unint64_t v42 = -0.27;
              double v13 = -0.5;
              if (v35 > -0.27)
              {
                double v43 = 0.0;
                double v33 = 0.27;
                if (v44 <= 0.27)
                {
                  double v37 = -0.27;
                  if (v44 > -0.27) {
                    double v37 = v44;
                  }
                }
                else
                {
                  double v37 = 0.27;
                }
                goto LABEL_472;
              }
              double v33 = 0.27;
              if (v44 > 0.27) {
                goto LABEL_458;
              }
              double v45 = 0.0;
              double v36 = 0.27;
              double v35 = -0.27;
              BOOL v58 = v44 > -0.27;
              double v43 = 0.0;
              double v37 = v44;
              goto LABEL_426;
            }
            double v13 = -0.5;
            double v41 = 0.27;
            *(double *)&unint64_t v42 = 0.27;
            double v33 = 0.27;
            if (v44 > 0.27) {
              goto LABEL_458;
            }
            double v43 = 0.0;
            double v37 = -0.27;
            *(double *)&unint64_t v42 = 0.27;
            BOOL v51 = v44 > -0.27;
            double v41 = v44;
            double v33 = 0.27;
LABEL_396:
            double v35 = 0.27;
            if (!v51) {
              goto LABEL_472;
            }
            goto LABEL_458;
          }
          double v33 = -0.27;
          if (v36 <= -0.27)
          {
            if (v35 > 0.27)
            {
              double v41 = 0.27;
              if (v44 > 0.27)
              {
                double v13 = -0.5;
                double v33 = -0.27;
                *(double *)&unint64_t v42 = 0.27;
                goto LABEL_458;
              }
              double v43 = 0.0;
              double v13 = -0.5;
LABEL_395:
              double v33 = -0.27;
              *(double *)&unint64_t v42 = 0.27;
              BOOL v51 = v44 > -0.27;
              double v41 = v44;
              double v37 = -0.27;
              goto LABEL_396;
            }
            double v13 = -0.5;
            if (v35 <= -0.27)
            {
              double v39 = -0.27;
              if (v44 <= 0.27)
              {
LABEL_425:
                double v45 = 0.0;
                double v36 = -0.27;
                BOOL v58 = v44 > -0.27;
                double v43 = 0.0;
                double v37 = v44;
                double v35 = -0.27;
LABEL_426:
                double v33 = v36;
                if (v58) {
                  goto LABEL_472;
                }
                goto LABEL_591;
              }
            }
            else
            {
              double v37 = 0.27;
              if (v44 <= 0.27)
              {
                double v33 = -0.27;
                if (v44 > -0.27) {
                  double v37 = v44;
                }
                else {
                  double v37 = -0.27;
                }
                double v43 = 0.0;
                goto LABEL_472;
              }
              double v39 = v35;
            }
          }
          else
          {
            double v37 = 0.27;
            if (v35 > 0.27)
            {
              double v13 = -0.5;
              double v41 = 0.27;
              if (v44 > 0.27)
              {
                *(double *)&unint64_t v42 = 0.27;
                double v33 = v36;
                goto LABEL_458;
              }
              double v43 = 0.0;
              double v37 = -0.27;
              *(double *)&unint64_t v42 = 0.27;
              BOOL v51 = v44 > -0.27;
              double v41 = v44;
              double v33 = v36;
              goto LABEL_396;
            }
            double v39 = -0.27;
            double v13 = -0.5;
            if (v35 <= -0.27)
            {
              if (v44 <= 0.27)
              {
                double v35 = -0.27;
                if (v44 > -0.27)
                {
                  double v43 = 0.0;
                  double v37 = v44;
                  double v33 = v36;
                  goto LABEL_472;
                }
                double v45 = 0.0;
                goto LABEL_591;
              }
              double v33 = v36;
            }
            else
            {
              double v37 = 0.27;
              if (v44 <= 0.27)
              {
                if (v44 > -0.27) {
                  double v37 = v44;
                }
                else {
                  double v37 = -0.27;
                }
                double v43 = 0.0;
                double v33 = v36;
                goto LABEL_472;
              }
              double v39 = v35;
              double v33 = v36;
            }
          }
LABEL_470:
          double v43 = 0.0;
          goto LABEL_471;
        }
        double v37 = v98 + v26;
        double v39 = v35;
LABEL_92:
        double v33 = v36;
        goto LABEL_93;
      }
      double v37 = 0.0;
      double v38 = 0.06;
      if (v99 >= 0.06)
      {
        double v38 = -0.06;
      }
      else if (v99 > -0.06)
      {
        double v40 = 0.5;
        if (v13 <= 0.5)
        {
          double v40 = -0.5;
          double v33 = 0.27;
          if (v13 > -0.5)
          {
            if (v36 <= 0.27)
            {
              double v41 = 0.0;
              double v33 = -0.27;
              if (v36 <= -0.27)
              {
                *(double *)&unint64_t v42 = 0.0;
                goto LABEL_458;
              }
              double v43 = 0.0;
              if (v13 <= 0.015)
              {
                double v35 = 0.0;
                double v33 = v36;
                goto LABEL_472;
              }
              BOOL v52 = v36 <= 0.02;
              double v35 = 0.0;
              goto LABEL_406;
            }
            double v40 = v13;
            goto LABEL_457;
          }
          if (v36 > 0.27) {
            goto LABEL_457;
          }
          double v33 = -0.27;
          if (v36 > -0.27) {
            double v33 = v36;
          }
          double v13 = -0.5;
        }
        else
        {
          double v33 = 0.27;
          if (v36 > 0.27) {
            goto LABEL_457;
          }
          double v33 = -0.27;
          if (v36 > -0.27) {
            double v33 = v36;
          }
          double v13 = 0.5;
        }
        double v41 = 0.0;
        *(double *)&unint64_t v42 = 0.0;
        goto LABEL_458;
      }
      double v39 = 0.0;
      goto LABEL_92;
    }
    double v33 = v36;
LABEL_71:
    double v39 = v24 + v34;
    double v26 = 0.05;
    if (v98 >= 0.05)
    {
      double v26 = -0.05;
    }
    else if (v98 > -0.05)
    {
      double v37 = 0.0;
      double v38 = 0.06;
      if (v99 >= 0.06)
      {
        double v38 = -0.06;
        goto LABEL_93;
      }
      if (v99 <= -0.06) {
        goto LABEL_93;
      }
      if (v13 > 0.5)
      {
        *(double *)&unint64_t v42 = 0.27;
        if (v33 > 0.27)
        {
          *(double *)&unint64_t v42 = 0.27;
          double v13 = 0.5;
          if (v39 <= 0.27)
          {
            double v41 = 0.0;
            double v35 = -0.27;
            double v33 = 0.27;
            *(double *)&unint64_t v42 = v39;
            double v43 = 0.0;
            double v37 = 0.0;
            if (v39 <= -0.27) {
              goto LABEL_462;
            }
            goto LABEL_458;
          }
LABEL_278:
          double v41 = 0.0;
          double v33 = 0.27;
          goto LABEL_458;
        }
        double v13 = 0.5;
        if (v33 > -0.27)
        {
          double v41 = 0.0;
          *(double *)&unint64_t v42 = 0.27;
          if (v39 <= 0.27)
          {
            double v35 = -0.27;
            if (v39 <= -0.27)
            {
              double v43 = 0.0;
              double v37 = 0.0;
              if (v33 <= 0.02) {
                goto LABEL_472;
              }
              goto LABEL_462;
            }
            *(double *)&unint64_t v42 = v39;
          }
          goto LABEL_458;
        }
        if (v39 <= 0.27)
        {
          double v41 = 0.0;
          double v33 = -0.27;
          *(double *)&unint64_t v42 = v39;
          double v43 = 0.0;
          double v37 = 0.0;
          double v35 = -0.27;
          if (v39 <= -0.27) {
            goto LABEL_472;
          }
          goto LABEL_458;
        }
        goto LABEL_423;
      }
      if (v13 <= -0.5)
      {
        *(double *)&unint64_t v42 = 0.27;
        if (v33 > 0.27)
        {
          *(double *)&unint64_t v42 = 0.27;
          double v13 = -0.5;
          if (v39 <= 0.27)
          {
            double v41 = 0.0;
            double v35 = -0.27;
            double v33 = 0.27;
            *(double *)&unint64_t v42 = v39;
            double v43 = 0.0;
            double v37 = 0.0;
            if (v39 <= -0.27) {
              goto LABEL_472;
            }
            goto LABEL_458;
          }
          goto LABEL_278;
        }
        if (v33 > -0.27)
        {
          *(double *)&unint64_t v42 = 0.27;
          double v13 = -0.5;
          if (v39 > 0.27)
          {
            double v41 = 0.0;
            goto LABEL_458;
          }
          double v37 = 0.0;
          double v35 = -0.27;
          double v43 = 0.0;
          if (v39 <= -0.27) {
            goto LABEL_472;
          }
          goto LABEL_470;
        }
        double v13 = -0.5;
        if (v39 <= 0.27)
        {
          double v37 = 0.0;
          double v33 = -0.27;
          double v43 = 0.0;
          double v35 = -0.27;
          if (v39 <= -0.27) {
            goto LABEL_472;
          }
          goto LABEL_470;
        }
LABEL_423:
        double v41 = 0.0;
        double v33 = -0.27;
        goto LABEL_458;
      }
      double v37 = 0.27;
      if (v33 <= 0.27)
      {
        if (v33 <= -0.27)
        {
          if (v39 > 0.27)
          {
            double v33 = -0.27;
            double v40 = v13;
            goto LABEL_457;
          }
          double v41 = 0.0;
          double v37 = -0.27;
          BOOL v57 = v39 > -0.27;
          double v33 = -0.27;
        }
        else
        {
          double v41 = 0.0;
          *(double *)&unint64_t v42 = 0.27;
          if (v39 > 0.27) {
            goto LABEL_458;
          }
          double v37 = -0.27;
          BOOL v57 = v39 > -0.27;
        }
        double v40 = v13;
        *(double *)&unint64_t v42 = v39;
        if (v57) {
          goto LABEL_458;
        }
      }
      else
      {
        double v37 = 0.27;
        if (v39 <= 0.27)
        {
          double v41 = 0.0;
          *(double *)&unint64_t v42 = -0.27;
          double v33 = 0.27;
          double v43 = 0.0;
          double v37 = 0.0;
          if (v39 <= -0.27) {
            goto LABEL_458;
          }
          goto LABEL_459;
        }
        double v33 = 0.27;
        double v40 = v13;
      }
LABEL_457:
      double v41 = 0.0;
      *(double *)&unint64_t v42 = v37;
      double v13 = v40;
      goto LABEL_458;
    }
    double v35 = v39;
    double v36 = v33;
    goto LABEL_82;
  }
  double v33 = 0.0;
  double v34 = 0.0225;
  if (v24 >= 0.0225)
  {
    double v34 = -0.0225;
    goto LABEL_71;
  }
  if (v24 <= -0.0225) {
    goto LABEL_71;
  }
  double v35 = 0.0;
  double v26 = 0.05;
  if (v98 >= 0.05)
  {
    double v26 = -0.05;
    double v36 = 0.0;
    goto LABEL_82;
  }
  double v36 = 0.0;
  if (v98 <= -0.05) {
    goto LABEL_82;
  }
  double v37 = 0.0;
  double v38 = 0.06;
  if (v99 >= 0.06)
  {
    double v38 = -0.06;
    double v39 = 0.0;
    double v33 = 0.0;
  }
  else
  {
    double v39 = 0.0;
    double v33 = 0.0;
    if (v99 > -0.06)
    {
      double v40 = 0.5;
      if (v13 <= 0.5)
      {
        double v40 = -0.5;
        double v41 = 0.0;
        *(double *)&unint64_t v42 = 0.0;
        if (v13 > -0.5) {
          goto LABEL_458;
        }
      }
      goto LABEL_457;
    }
  }
LABEL_93:
  double v45 = v99 + v38;
  double v46 = -0.5;
  if (v13 > -0.5) {
    double v46 = v13;
  }
  if (v13 <= 0.5) {
    double v13 = v46;
  }
  else {
    double v13 = 0.5;
  }
  double v43 = 0.27;
  if (v33 > 0.27)
  {
    double v33 = 0.27;
    if (v39 > 0.27)
    {
      double v35 = 0.27;
      if (v37 > 0.27)
      {
        double v37 = 0.27;
        if (v45 > 0.27)
        {
          double v43 = 0.27;
          BOOL v47 = v13 <= 0.015;
          double v37 = 0.27;
LABEL_166:
          double v35 = 0.27;
          goto LABEL_167;
        }
        double v35 = 0.27;
        goto LABEL_147;
      }
      if (v37 > -0.27)
      {
        double v33 = 0.27;
        goto LABEL_181;
      }
      double v35 = 0.27;
      if (v45 > 0.27)
      {
        double v43 = 0.27;
        BOOL v47 = v13 <= 0.015;
        double v37 = -0.27;
        goto LABEL_166;
      }
      if (v45 > -0.27) {
        double v43 = v45;
      }
      else {
        double v43 = -0.27;
      }
      BOOL v53 = v13 <= 0.015;
      double v37 = -0.27;
LABEL_226:
      double v33 = 0.27;
      if (v53) {
        goto LABEL_472;
      }
      goto LABEL_462;
    }
    double v35 = -0.27;
    if (v39 > -0.27)
    {
      double v33 = 0.27;
      if (v37 <= 0.27)
      {
        if (v37 <= -0.27)
        {
          if (v45 <= 0.27)
          {
            if (v45 > -0.27) {
              double v43 = v45;
            }
            else {
              double v43 = -0.27;
            }
            BOOL v55 = v13 <= 0.015;
            double v37 = -0.27;
LABEL_461:
            double v35 = v39;
            if (!v55) {
              goto LABEL_462;
            }
LABEL_472:
            *(void *)(v3 + 16) = 0;
            goto LABEL_473;
          }
          double v43 = 0.27;
          BOOL v47 = v13 <= 0.015;
          double v37 = -0.27;
          double v35 = v39;
        }
        else
        {
          double v33 = 0.27;
          if (v45 <= 0.27)
          {
            if (v45 > -0.27) {
              double v43 = v45;
            }
            else {
              double v43 = -0.27;
            }
            goto LABEL_460;
          }
          double v43 = 0.27;
          BOOL v47 = v13 <= 0.015;
          double v35 = v39;
        }
      }
      else
      {
        double v37 = 0.27;
        if (v45 <= 0.27)
        {
          if (v45 > -0.27) {
            double v43 = v45;
          }
          else {
            double v43 = -0.27;
          }
          double v35 = v39;
          double v33 = 0.27;
          if (v13 <= 0.015) {
            goto LABEL_472;
          }
          goto LABEL_462;
        }
        double v43 = 0.27;
        BOOL v47 = v13 <= 0.015;
        double v37 = 0.27;
        double v35 = v39;
      }
      goto LABEL_167;
    }
    if (v37 > 0.27)
    {
      double v37 = 0.27;
      double v35 = -0.27;
      if (v45 > 0.27)
      {
        double v43 = 0.27;
        BOOL v47 = v13 <= 0.015;
        double v37 = 0.27;
        goto LABEL_167;
      }
LABEL_147:
      double v33 = 0.27;
      goto LABEL_193;
    }
    if (v37 > -0.27)
    {
      double v33 = 0.27;
      if (v45 > 0.27)
      {
        double v43 = 0.27;
        BOOL v47 = v13 <= 0.015;
        goto LABEL_167;
      }
      double v35 = -0.27;
      if (v45 > -0.27) {
        double v43 = v45;
      }
      else {
        double v43 = -0.27;
      }
LABEL_196:
      if (v13 > 0.015) {
        goto LABEL_462;
      }
      goto LABEL_472;
    }
    if (v45 > 0.27)
    {
      double v43 = 0.27;
      BOOL v47 = v13 <= 0.015;
      double v37 = -0.27;
LABEL_167:
      double v33 = 0.27;
      if (v47) {
        goto LABEL_472;
      }
      goto LABEL_462;
    }
    if (v45 > -0.27)
    {
LABEL_300:
      double v36 = 0.27;
      if (v13 > 0.015) {
        goto LABEL_301;
      }
      goto LABEL_591;
    }
    BOOL v56 = v13 <= 0.015;
    goto LABEL_430;
  }
  if (v33 <= -0.27)
  {
    if (v39 <= 0.27)
    {
      if (v39 > -0.27)
      {
        double v43 = 0.27;
        if (v37 <= 0.27)
        {
          double v33 = -0.27;
          if (v37 <= -0.27)
          {
            if (v45 <= 0.27)
            {
              double v37 = -0.27;
              if (v45 > -0.27) {
                double v43 = v45;
              }
              else {
                double v43 = -0.27;
              }
              double v35 = v39;
              double v33 = -0.27;
              goto LABEL_472;
            }
            double v37 = -0.27;
            goto LABEL_471;
          }
          double v43 = 0.27;
          if (v45 > 0.27)
          {
LABEL_471:
            double v35 = v39;
            goto LABEL_472;
          }
        }
        else
        {
          double v37 = 0.27;
          if (v45 > 0.27)
          {
            double v43 = 0.27;
            double v35 = v39;
            double v33 = -0.27;
            goto LABEL_472;
          }
        }
        double v33 = -0.27;
        if (v45 > -0.27) {
          double v43 = v45;
        }
        else {
          double v43 = -0.27;
        }
        goto LABEL_471;
      }
      if (v37 <= 0.27)
      {
        if (v37 <= -0.27)
        {
          if (v45 <= 0.27)
          {
            double v36 = -0.27;
            double v43 = -0.27;
            double v37 = -0.27;
            double v35 = -0.27;
            double v33 = -0.27;
            if (v45 <= -0.27) {
              goto LABEL_472;
            }
            goto LABEL_591;
          }
          double v37 = -0.27;
        }
        else
        {
          double v43 = 0.27;
          if (v45 <= 0.27)
          {
            double v33 = -0.27;
            if (v45 > -0.27)
            {
              double v43 = v45;
              double v35 = -0.27;
              goto LABEL_472;
            }
            goto LABEL_417;
          }
        }
        double v35 = -0.27;
        double v33 = -0.27;
        goto LABEL_472;
      }
      double v35 = -0.27;
      double v37 = 0.27;
      BOOL v48 = v45 <= 0.27;
      double v33 = -0.27;
    }
    else
    {
      double v35 = 0.27;
      if (v37 <= 0.27)
      {
        double v33 = -0.27;
        if (v37 <= -0.27)
        {
          double v35 = 0.27;
          double v37 = -0.27;
          if (v45 <= 0.27)
          {
            if (v45 > -0.27) {
              double v43 = v45;
            }
            else {
              double v43 = -0.27;
            }
            double v33 = -0.27;
          }
          else
          {
            double v43 = 0.27;
            double v33 = -0.27;
          }
          goto LABEL_472;
        }
        goto LABEL_181;
      }
      double v33 = -0.27;
      double v37 = 0.27;
      BOOL v48 = v45 <= 0.27;
      double v35 = 0.27;
    }
    double v43 = 0.27;
    if (!v48) {
      goto LABEL_472;
    }
    goto LABEL_193;
  }
  if (v39 > 0.27)
  {
    double v35 = 0.27;
    if (v37 > 0.27)
    {
      double v37 = 0.27;
      if (v45 > 0.27)
      {
        double v43 = 0.27;
        if (v13 <= 0.015)
        {
          double v37 = 0.27;
          double v35 = 0.27;
        }
        else
        {
          double v37 = 0.27;
          double v35 = 0.27;
          if (v33 > 0.02) {
            goto LABEL_462;
          }
        }
        goto LABEL_472;
      }
      double v35 = 0.27;
      goto LABEL_193;
    }
    if (v37 <= -0.27)
    {
      BOOL v50 = v13 > 0.015;
      if (v33 <= 0.02) {
        BOOL v50 = 0;
      }
      double v35 = 0.27;
      if (v45 <= 0.27)
      {
        if (v45 > -0.27) {
          double v43 = v45;
        }
        else {
          double v43 = -0.27;
        }
        double v37 = -0.27;
        if (!v50) {
          goto LABEL_472;
        }
      }
      else
      {
        double v43 = 0.27;
        double v37 = -0.27;
        double v35 = 0.27;
        if (!v50) {
          goto LABEL_472;
        }
      }
      goto LABEL_462;
    }
LABEL_181:
    double v43 = 0.27;
    if (v45 > 0.27)
    {
LABEL_195:
      if (v33 <= 0.02) {
        goto LABEL_472;
      }
      goto LABEL_196;
    }
LABEL_193:
    double v43 = -0.27;
    if (v45 > -0.27)
    {
      double v43 = v45;
      double v39 = v35;
      goto LABEL_459;
    }
    goto LABEL_195;
  }
  double v35 = -0.27;
  if (v39 <= -0.27)
  {
    if (v37 > 0.27)
    {
      double v37 = 0.27;
      goto LABEL_181;
    }
    double v35 = -0.27;
    double v43 = 0.27;
    if (v37 > -0.27)
    {
      if (v45 > 0.27)
      {
        if (v13 <= 0.015 || v33 <= 0.02) {
          goto LABEL_472;
        }
        goto LABEL_462;
      }
      double v35 = -0.27;
      if (v45 > -0.27)
      {
        if (v13 <= 0.015)
        {
          double v43 = v45;
        }
        else
        {
          double v43 = v45;
          if (v33 > 0.02) {
            goto LABEL_462;
          }
        }
        goto LABEL_472;
      }
      if (v33 > 0.02)
      {
        double v43 = -0.27;
        if (v13 <= 0.015) {
          goto LABEL_472;
        }
        goto LABEL_462;
      }
LABEL_417:
      double v43 = -0.27;
      double v35 = -0.27;
      goto LABEL_472;
    }
    if (v45 > 0.27)
    {
      if (v13 <= 0.015)
      {
        double v37 = -0.27;
        goto LABEL_472;
      }
      BOOL v56 = v33 <= 0.02;
      goto LABEL_431;
    }
    if (v45 <= -0.27)
    {
      if (v13 <= 0.015)
      {
        double v43 = -0.27;
        double v37 = -0.27;
        goto LABEL_472;
      }
      BOOL v56 = v33 <= 0.02;
LABEL_430:
      double v43 = -0.27;
LABEL_431:
      double v37 = -0.27;
      if (v56) {
        goto LABEL_472;
      }
      goto LABEL_462;
    }
    if (v33 <= 0.02)
    {
      double v36 = v33;
    }
    else
    {
      double v36 = v33;
      if (v13 > 0.015) {
        goto LABEL_301;
      }
    }
LABEL_591:
    double v37 = -0.27;
    double v43 = v45;
    goto LABEL_592;
  }
  double v35 = v39;
  double v44 = v37;
LABEL_129:
  double v43 = 0.27;
  if (v44 <= 0.27)
  {
    double v37 = -0.27;
    if (v44 <= -0.27)
    {
      BOOL v54 = v33 > 0.02;
      if (v13 <= 0.015) {
        BOOL v54 = 0;
      }
      if (v45 <= 0.27)
      {
        if (v45 > -0.27) {
          double v43 = v45;
        }
        else {
          double v43 = -0.27;
        }
        if (!v54) {
          goto LABEL_472;
        }
      }
      else if (!v54)
      {
        goto LABEL_472;
      }
      goto LABEL_462;
    }
    double v37 = v44;
    goto LABEL_181;
  }
  BOOL v49 = v33 > 0.02;
  if (v13 <= 0.015) {
    BOOL v49 = 0;
  }
  double v37 = 0.27;
  if (v45 <= 0.27)
  {
    double v43 = -0.27;
    if (v45 > -0.27) {
      double v43 = v45;
    }
    if (v49) {
      goto LABEL_462;
    }
    goto LABEL_472;
  }
  double v43 = 0.27;
  double v37 = 0.27;
  if (!v49) {
    goto LABEL_472;
  }
LABEL_462:
  double v59 = *(double *)(v3 + 16) + a3;
  *(double *)(v3 + 16) = v59;
  if (v59 >= 0.2) {
    *(unsigned char *)(v3 + 80) = 1;
  }
LABEL_473:
  if (*(unsigned char *)(v3 + 80) != 1)
  {
    int v61 = 0;
    goto LABEL_482;
  }
  if (v33 >= 0.02 || v13 >= 0.015)
  {
    *(void *)(v3 + 32) = 0;
  }
  else
  {
    double v60 = *(double *)(v3 + 32) + a3;
    *(double *)(v3 + 32) = v60;
    if (v60 >= 0.1)
    {
      *(unsigned char *)(v3 + 80) = 0;
      int v61 = 0;
      if (v33 <= 0.0) {
        goto LABEL_486;
      }
      goto LABEL_482;
    }
  }
  int v61 = 1;
  if (v33 <= 0.0)
  {
LABEL_486:
    double v33 = 0.0;
LABEL_487:
    *(void *)(v3 + 24) = 0;
    goto LABEL_488;
  }
LABEL_482:
  if (v33 >= -0.02 || v13 >= -0.015) {
    goto LABEL_487;
  }
  double v62 = *(double *)(v3 + 24) + a3;
  *(double *)(v3 + 24) = v62;
  if (v62 >= 0.2) {
    *(unsigned char *)(v3 + 81) = 1;
  }
LABEL_488:
  double v63 = fabs(v13);
  if (*(unsigned char *)(v3 + 81) != 1)
  {
    if (!v61)
    {
LABEL_495:
      *(void *)(v3 + 48) = 0;
LABEL_508:
      *(void *)(v3 + 56) = 0;
      goto LABEL_512;
    }
LABEL_497:
    double v65 = *(double *)(v3 + 48) + a3;
    *(double *)(v3 + 48) = v65;
    if (v65 < 10.0)
    {
      *(void *)(v3 + 56) = 0;
      goto LABEL_524;
    }
    *(unsigned char *)(v3 + 80) = 0;
    goto LABEL_508;
  }
  if (v33 <= -0.02 || v13 <= -0.015)
  {
    *(void *)(v3 + 40) = 0;
  }
  else
  {
    double v64 = *(double *)(v3 + 40) + a3;
    *(double *)(v3 + 40) = v64;
    if (v64 >= 0.1)
    {
      *(unsigned char *)(v3 + 81) = 0;
      if (v33 > 0.0) {
        double v33 = 0.0;
      }
      if ((v61 & 1) == 0) {
        goto LABEL_495;
      }
      goto LABEL_497;
    }
  }
  if (v33 > 0.0) {
    double v33 = 0.0;
  }
  if (v61)
  {
    double v66 = *(double *)(v3 + 48) + a3;
    *(double *)(v3 + 48) = v66;
    if (v66 < 10.0)
    {
      double v67 = *(double *)(v3 + 56) + a3;
      *(double *)(v3 + 56) = v67;
      if (v67 >= 10.0) {
        *(unsigned char *)(v3 + 81) = 0;
      }
      goto LABEL_524;
    }
    *(unsigned char *)(v3 + 80) = 0;
  }
  else
  {
    *(void *)(v3 + 48) = 0;
  }
  double v68 = *(double *)(v3 + 56) + a3;
  *(double *)(v3 + 56) = v68;
  if (v68 < 10.0) {
    goto LABEL_524;
  }
  *(unsigned char *)(v3 + 81) = 0;
LABEL_512:
  double v69 = v18 * v18;
  double v70 = 0.0;
  if (v63 > 0.005)
  {
    double v70 = 0.0;
    if (v13 * v33 >= 0.0)
    {
      if (v63 <= 0.015) {
        double v33 = (v63 + -0.005) * v33 / 0.01;
      }
      if (v33 > 0.0)
      {
        if (v33 + v69 * -10.0 / 9.81 > 0.0) {
          double v33 = v33 + v69 * -10.0 / 9.81;
        }
        else {
          double v33 = 0.0;
        }
        goto LABEL_524;
      }
      double v70 = v33;
    }
  }
  if (v69 * 10.0 / 9.81 + v70 <= 0.0) {
    double v33 = v69 * 10.0 / 9.81 + v70;
  }
  else {
    double v33 = 0.0;
  }
LABEL_524:
  double v71 = 1.0 / (1.0 / a3) / (1.0 / (1.0 / a3) + 0.0159154943);
  double v72 = v71 * v33;
  double v73 = 1.0 - v71;
  double v74 = 0.0;
  double v75 = (1.0 - v71) * 0.0;
  double v76 = v75 + v72;
  double v77 = v75 + v71 * v35;
  BOOL v82 = v37 * (v75 + v72) < 0.0;
  double v78 = fabs(v75 + v72);
  if (v82)
  {
    double v79 = fabs(v77);
    if (v43 * v77 >= 0.0 && v79 > 0.005)
    {
      double v37 = 0.0;
LABEL_538:
      if (v79 <= 0.02)
      {
LABEL_535:
        double v74 = v43 * (v79 + -0.005) / 0.015;
        goto LABEL_541;
      }
      goto LABEL_539;
    }
  }
  else
  {
    if (v78 > 0.005)
    {
      if (v78 <= 0.02) {
        double v37 = v37 * (v78 + -0.005) / 0.015;
      }
      double v79 = fabs(v77);
      if (v43 * v77 < 0.0 || v79 <= 0.005) {
        goto LABEL_541;
      }
      if (v79 <= 0.02) {
        goto LABEL_535;
      }
LABEL_539:
      double v74 = v43;
      goto LABEL_541;
    }
    double v79 = fabs(v77);
    if (v43 * v77 >= 0.0)
    {
      double v37 = 0.0;
      if (v79 <= 0.005) {
        goto LABEL_541;
      }
      goto LABEL_538;
    }
  }
  double v37 = 0.0;
LABEL_541:
  double v80 = v73 * v76 + v71 * v37;
  double v81 = v73 * v77 + v71 * v74;
  if (v79 >= v78 || v78 <= 0.001)
  {
    BOOL v82 = v79 > 0.001 && v78 < v77;
    if (v82) {
      double v76 = v76 * pow(fabs(v76 / v77), 3.0);
    }
  }
  else
  {
    double v77 = v77 * pow(fabs(v77 / v76), 3.0);
  }
  double v83 = fabs(v80);
  double v84 = fabs(v81);
  if (v84 >= v83 || v83 <= 0.001)
  {
    if (v84 > 0.001 && v83 < v81)
    {
      double v80 = v80 * pow(fabs(v80 / v81), 3.0);
      double v83 = fabs(v80);
    }
  }
  else
  {
    double v81 = v81 * pow(fabs(v81 / v80), 3.0);
    double v84 = fabs(v81);
  }
  double v8 = v76;
  BOOL v86 = fabs(v76) > 1.0 || (~*(void *)&v76 & 0x7FF0000000000000) == 0;
  double v9 = v77;
  double v87 = fabs(v77);
  if (v86) {
    double v8 = 0.0;
  }
  BOOL v88 = v87 > 1.0 || (~*(void *)&v77 & 0x7FF0000000000000) == 0;
  double v10 = v80;
  if (v88) {
    double v9 = 0.0;
  }
  if (v83 > 1.0 || (~*(void *)&v80 & 0x7FF0000000000000) == 0) {
    double v10 = 0.0;
  }
  if (v84 > 1.0 || (~*(void *)&v81 & 0x7FF0000000000000) == 0) {
    double v11 = 0.0;
  }
  else {
    double v11 = v81;
  }
  if (v63 > 1000.0 || (~*(void *)&v13 & 0x7FF0000000000000) == 0) {
    double v12 = 0.0;
  }
  else {
    double v12 = v13;
  }
LABEL_586:
  *(double *)a2 = v8;
  *(double *)(a2 + 8) = v9;
  *(double *)(a2 + 16) = v10;
  *(double *)(a2 + 24) = v11;
  *(double *)(a2 + 32) = v12;
  *(unsigned char *)(a2 + 40) = v7;
}

uint64_t sub_1A53C()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1A54C(uint64_t a1)
{
  type metadata accessor for IMUFilter();
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_DWORD *)(v1 + 79) = 0;
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 64) = 0u;
  *(_OWORD *)(v3 + 80) = 0u;
  *(_OWORD *)(v3 + 96) = 0u;
  *(void *)(v3 + 112) = 0;
  *(unsigned char *)(v3 + 120) = 1;
  sub_1A900((uint64_t)v7);
  sub_1A920((uint64_t)v7, v3 + 128, &qword_30650);
  *(_OWORD *)(v3 + 264) = 0u;
  *(_OWORD *)(v3 + 280) = 0u;
  *(_OWORD *)(v3 + 296) = 0u;
  *(_OWORD *)(v3 + 312) = 0u;
  *(_OWORD *)(v3 + 328) = 0u;
  *(_OWORD *)(v3 + 344) = 0u;
  *(void *)(v3 + 360) = 0;
  *(unsigned char *)(v3 + 368) = 1;
  sub_1A920((uint64_t)v7, v3 + 376, &qword_30650);
  *(void *)(v1 + 96) = v3;
  type metadata accessor for StaticDetection();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 40) = 0;
  *(_OWORD *)(v4 + 16) = xmmword_20480;
  uint64_t v5 = sub_1ECB0();
  *(void *)(v5 + 16) = 24;
  bzero((void *)(v5 + 32), 0x240uLL);
  *(void *)(v4 + 32) = v5;
  *(void *)(v1 + 104) = v4;
  *(void *)(v1 + 88) = a1;
  return v1;
}

uint64_t Comparable.clamped(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 - 8);
  __chkstk_darwin(a1);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1EC00();
  sub_1F090();
  sub_1F080();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, a2);
}

uint64_t type metadata accessor for lowPassFilter()
{
  return self;
}

uint64_t sub_1A7A8()
{
  uint64_t v1 = *(void *)(v0 + 96);
  *(void *)(v1 + 112) = 0;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 96) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(unsigned char *)(v1 + 120) = 1;
  sub_1A900((uint64_t)v5);
  sub_1A920((uint64_t)v5, v1 + 128, &qword_30650);
  *(_OWORD *)(v1 + 264) = 0u;
  *(_OWORD *)(v1 + 280) = 0u;
  *(_OWORD *)(v1 + 296) = 0u;
  *(_OWORD *)(v1 + 312) = 0u;
  *(_OWORD *)(v1 + 328) = 0u;
  *(_OWORD *)(v1 + 344) = 0u;
  *(void *)(v1 + 360) = 0;
  *(unsigned char *)(v1 + 368) = 1;
  sub_1A920((uint64_t)v5, v1 + 376, &qword_30650);
  uint64_t v2 = *(void *)(v0 + 104);
  *(void *)(v2 + 24) = 0;
  uint64_t v3 = sub_1ECB0();
  *(void *)(v3 + 16) = 24;
  bzero((void *)(v3 + 32), 0x240uLL);
  swift_beginAccess();
  *(void *)(v2 + 32) = v3;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A894()
{
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AXMotionCuesModel()
{
  return self;
}

double sub_1A900(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(unsigned char *)(a1 + 128) = 1;
  return result;
}

uint64_t sub_1A920(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_55DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

__n128 initializeWithCopy for AXMotionCuesModelOutput(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AXMotionCuesModelOutput(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 40)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AXMotionCuesModelOutput(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 40) = v3;
  return result;
}

ValueMetadata *type metadata accessor for AXMotionCuesModelOutput()
{
  return &type metadata for AXMotionCuesModelOutput;
}

id sub_1AB7C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1EE80();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1EEC0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  double v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  double v12 = (char *)&v29 - v11;
  sub_1EEB0();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for UIButton.Configuration.CornerStyle.capsule(_:), v2);
  sub_1EE90();
  double v13 = self;
  id v14 = [v13 configurationWithPointSize:12.0];
  id v15 = [self systemBlueColor];
  id v16 = [v13 configurationWithHierarchicalColor:v15];

  id v17 = [v14 configurationByApplyingConfiguration:v16];
  NSString v18 = sub_1EC10();
  id v19 = [self systemImageNamed:v18];

  if (v19)
  {
    id v20 = [v19 imageWithSymbolConfiguration:v17];
  }
  sub_1EEA0();
  id v21 = objc_allocWithZone((Class)BNTemplateItemProvider);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
  id v22 = [v21 initWithItem:sub_1F070()];
  swift_unknownObjectRelease();
  [v22 setVisualStyleCategory:2];
  [v22 setVisualStyle:1];
  uint64_t v23 = v1 + OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_content;
  uint64_t v24 = *(void *)(v1 + OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_content + 40);
  uint64_t v25 = *(void *)(v23 + 48);
  if (v24)
  {
    uint64_t v26 = swift_allocObject();
    *(void *)(v26 + 16) = v24;
    *(void *)(v26 + 24) = v25;
    double v27 = sub_1B290;
  }
  else
  {
    double v27 = 0;
  }
  sub_10F08(v24);
  sub_10FBC((uint64_t)v27);
  [v22 setHidden:v24 == 0];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  return v22;
}

id sub_1B168()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXMotionCuesBannerPresentable();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AXMotionCuesBannerPresentable()
{
  return self;
}

uint64_t sub_1B258()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1B290()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1B2B8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2[5];
  if (v4 >= 24)
  {
    uint64_t v4 = 0;
    v2[5] = 0;
  }
  double v5 = *(double *)a1;
  double v6 = *(double *)(a1 + 8);
  double v7 = *(double *)(a1 + 48);
  double v8 = *(double *)(a1 + 56);
  double v9 = *(double *)(a1 + 16);
  uint64_t v10 = *(void *)(a1 + 24);
  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = *(double *)(a1 + 64);
  uint64_t v33 = *(void *)(a1 + 80);
  uint64_t v34 = *(void *)(a1 + 72);
  uint64_t v31 = *(void *)(a1 + 96);
  uint64_t v32 = *(void *)(a1 + 88);
  uint64_t v29 = *(void *)(a1 + 112);
  uint64_t v30 = *(void *)(a1 + 104);
  uint64_t v27 = *(void *)(a1 + 40);
  uint64_t v28 = *(void *)(a1 + 120);
  swift_beginAccess();
  double v13 = (double *)v2[4];
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v2[4] = v13;
  if (isUniquelyReferenced_nonNull_native)
  {
    if ((v4 & 0x8000000000000000) == 0) {
      goto LABEL_5;
    }
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  double v13 = sub_1BB24((uint64_t)v13);
  v2[4] = v13;
  if (v4 < 0) {
    goto LABEL_19;
  }
LABEL_5:
  if ((unint64_t)v4 >= *((void *)v13 + 2))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v15 = &v13[3 * v4];
  v15[4] = v5 + v7;
  v15[5] = v6 + v8;
  v15[6] = v9 + v12;
  swift_endAccess();
  uint64_t v16 = v2[5];
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17)
  {
LABEL_21:
    __break(1u);
    return;
  }
  v2[5] = v18;
  uint64_t v19 = v2[3];
  if (v19 <= 23) {
    v2[3] = v19 + 1;
  }
  double v20 = sub_1B46C().f64[0];
  BOOL v23 = v22 + v20 + v21 < 0.00001;
  double v24 = 0.0;
  if (v23) {
    double v25 = 0.0;
  }
  else {
    double v25 = v5;
  }
  if (v23) {
    double v26 = 0.0;
  }
  else {
    double v26 = v6;
  }
  *(double *)a2 = v25;
  *(double *)(a2 + 8) = v26;
  if (!v23) {
    double v24 = v9;
  }
  *(double *)(a2 + 16) = v24;
  *(void *)(a2 + 24) = v10;
  *(void *)(a2 + 32) = v11;
  *(void *)(a2 + 40) = v27;
  *(double *)(a2 + 48) = v7;
  *(double *)(a2 + 56) = v8;
  *(double *)(a2 + 64) = v12;
  *(void *)(a2 + 72) = v34;
  *(void *)(a2 + 80) = v33;
  *(void *)(a2 + 88) = v32;
  *(void *)(a2 + 96) = v31;
  *(void *)(a2 + 104) = v30;
  *(void *)(a2 + 112) = v29;
  *(void *)(a2 + 120) = v28;
}

float64x2_t sub_1B46C()
{
  uint64_t v1 = sub_1EB90();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void *)(v0 + 24);
  if (!v5)
  {
    if (qword_2FC30 == -1)
    {
LABEL_6:
      uint64_t v11 = sub_5690(v1, (uint64_t)MCLog);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v11, v1);
      double v12 = sub_1EB70();
      os_log_type_t v13 = sub_1EE10();
      if (os_log_type_enabled(v12, v13))
      {
        id v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_0, v12, v13, "Static detection: attempt to compute variance without any samples", v14, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      return (float64x2_t)0;
    }
LABEL_28:
    swift_once();
    goto LABEL_6;
  }
  swift_beginAccess();
  uint64_t v6 = *(void *)(v0 + 32);
  unint64_t v7 = *(void *)(v6 + 16);
  if (!v7)
  {
    float64x2_t v9 = 0uLL;
    double v10 = 0.0;
    goto LABEL_15;
  }
  if (v7 == 1)
  {
    uint64_t v8 = 0;
    float64x2_t v9 = 0uLL;
    double v10 = 0.0;
LABEL_13:
    unint64_t v18 = v7 - v8;
    uint64_t v19 = (double *)(v6 + 24 * v8 + 48);
    do
    {
      float64x2_t v20 = *(float64x2_t *)(v19 - 2);
      double v21 = *v19;
      v19 += 3;
      float64x2_t v9 = vaddq_f64(v9, v20);
      double v10 = v10 + v21;
      --v18;
    }
    while (v18);
    goto LABEL_15;
  }
  uint64_t v8 = v7 & 0x7FFFFFFFFFFFFFFELL;
  uint64_t v16 = v6 + 48;
  float64x2_t v9 = 0uLL;
  double v10 = 0.0;
  uint64_t v17 = v7 & 0x7FFFFFFFFFFFFFFELL;
  do
  {
    double v10 = v10 + *(double *)v16 + *(double *)(v16 + 24);
    float64x2_t v9 = vaddq_f64(vaddq_f64(v9, *(float64x2_t *)(v16 - 16)), *(float64x2_t *)(v16 + 8));
    v16 += 48;
    v17 -= 2;
  }
  while (v17);
  if (v7 != v8) {
    goto LABEL_13;
  }
LABEL_15:
  uint64_t v22 = *(void *)(v0 + 24);
  if (v22 < 0)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  if (v22)
  {
    float64x2_t v23 = vdivq_f64(v9, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v5), 0));
    double v24 = v10 / (double)v5;
    uint64_t v25 = v22 - 1;
    double v26 = (double *)(v6 + 48);
    float64x2_t v27 = 0uLL;
    double v28 = 0.0;
    while (v7 > v25)
    {
      float64x2_t v29 = vsubq_f64(*(float64x2_t *)(v26 - 2), v23);
      double v30 = *v26;
      v26 += 3;
      float64x2_t v27 = vaddq_f64(v27, vmulq_f64(v29, v29));
      double v28 = v28 + (v30 - v24) * (v30 - v24);
      if (!--v22) {
        goto LABEL_22;
      }
    }
    __break(1u);
    goto LABEL_27;
  }
  float64x2_t v27 = 0uLL;
  uint64_t v25 = -1;
LABEL_22:
  if (v25 <= 1) {
    uint64_t v31 = 1;
  }
  else {
    uint64_t v31 = v25;
  }
  return vdivq_f64(v27, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)v31), 0));
}

uint64_t sub_1B76C()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for StaticDetection()
{
  return self;
}

double *sub_1B7C8(double *result, int64_t a2, char a3, double *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_55DC(&qword_30660);
      double v10 = (double *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      os_log_type_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      double v10 = _swiftEmptyArrayStorage;
      os_log_type_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0.0;
        goto LABEL_24;
      }
    }
    sub_1BB38(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

double *sub_1B8D8(double *result, int64_t a2, char a3, double *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_55DC(&qword_30C18);
      double v10 = (double *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
      uint64_t v12 = v10 + 4;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4]) {
          memmove(v12, a4 + 4, 24 * v8);
        }
        a4[2] = 0.0;
        goto LABEL_22;
      }
    }
    else
    {
      double v10 = _swiftEmptyArrayStorage;
      uint64_t v12 = &_swiftEmptyArrayStorage[4];
      if (result) {
        goto LABEL_13;
      }
    }
    sub_1BC24(0, v8, (char *)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

double *sub_1BA00(double *result, int64_t a2, char a3, double *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_55DC(&qword_30C20);
      double v10 = (double *)swift_allocObject();
      int64_t v11 = j__malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 25;
      }
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * (v12 >> 3);
      os_log_type_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      double v10 = _swiftEmptyArrayStorage;
      os_log_type_t v13 = &_swiftEmptyArrayStorage[4];
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4]) {
          memmove(v13, a4 + 4, 8 * v8);
        }
        a4[2] = 0.0;
        goto LABEL_24;
      }
    }
    sub_1BD14(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

double *sub_1BB10(uint64_t a1)
{
  return sub_1B7C8(0, *(void *)(a1 + 16), 0, (double *)a1);
}

double *sub_1BB24(uint64_t a1)
{
  return sub_1B8D8(0, *(void *)(a1 + 16), 0, (double *)a1);
}

char *sub_1BB38(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    size_t v6 = 8 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  __n128 result = (char *)sub_1F040();
  __break(1u);
  return result;
}

char *sub_1BC24(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 24 * a1 + 32);
    size_t v6 = 24 * v4;
    uint64_t v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  __n128 result = (char *)sub_1F040();
  __break(1u);
  return result;
}

uint64_t sub_1BD14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 8 * a1 + 32;
    unint64_t v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_55DC(&qword_30C28);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1F040();
  __break(1u);
  return result;
}

void sub_1BE20(uint64_t a1)
{
}

void sub_1BE34(uint64_t a1)
{
}

void sub_1BE48(uint64_t a1)
{
}

void sub_1BE5C(uint64_t a1)
{
}

void sub_1BE70(uint64_t a1, uint64_t a2, void *a3)
{
  sub_1EC20();
  id v4 = objc_allocWithZone((Class)CAFilter);
  NSString v5 = sub_1EC10();
  swift_bridgeObjectRelease();
  id v6 = [v4 initWithType:v5];

  *a3 = v6;
}

id sub_1BEF0()
{
  id v0 = [objc_allocWithZone((Class)AXMCNoAnimationBackdropLayer) init];
  NSString v1 = sub_1EC10();
  [v0 setGroupName:v1];

  sub_55DC(&qword_30C30);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_205E0;
  uint64_t v3 = qword_2FC68;
  id v4 = v0;
  if (v3 != -1) {
    swift_once();
  }
  NSString v5 = (void *)qword_31520;
  unint64_t v6 = sub_1C288();
  *(void *)(v2 + 56) = v6;
  *(void *)(v2 + 32) = v5;
  uint64_t v7 = qword_2FC78;
  id v8 = v5;
  if (v7 != -1) {
    swift_once();
  }
  uint64_t v9 = (void *)qword_31530;
  *(void *)(v2 + 88) = v6;
  *(void *)(v2 + 64) = v9;
  uint64_t v10 = qword_2FC60;
  id v11 = v9;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = (void *)qword_31518;
  *(void *)(v2 + 120) = v6;
  *(void *)(v2 + 96) = v12;
  uint64_t v13 = qword_2FC70;
  id v14 = v12;
  if (v13 != -1) {
    swift_once();
  }
  id v15 = (void *)qword_31528;
  *(void *)(v2 + 152) = v6;
  *(void *)(v2 + 128) = v15;
  id v16 = v15;
  Class isa = sub_1EC70().super.isa;
  swift_bridgeObjectRelease();
  [v4 setFilters:isa];

  Class v18 = sub_1EDF0().super.super.isa;
  NSString v19 = sub_1EC10();
  [v4 setValue:v18 forKeyPath:v19];

  Class v20 = sub_1ECD0().super.super.isa;
  NSString v21 = sub_1EC10();
  [v4 setValue:v20 forKeyPath:v21];

  Class v22 = sub_1EDF0().super.super.isa;
  NSString v23 = sub_1EC10();
  [v4 setValue:v22 forKeyPath:v23];

  Class v24 = sub_1EC70().super.isa;
  NSString v25 = sub_1EC10();
  [v4 setValue:v24 forKeyPath:v25];

  Class v26 = sub_1EDF0().super.super.isa;
  NSString v27 = sub_1EC10();
  [v4 setValue:v26 forKeyPath:v27];

  [v4 setAllowsEdgeAntialiasing:1];
  return v4;
}

unint64_t sub_1C288()
{
  unint64_t result = qword_30C38;
  if (!qword_30C38)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_30C38);
  }
  return result;
}

__n128 initializeBufferWithCopyOfBuffer for IMUVector(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for IMUVector()
{
  return &type metadata for IMUVector;
}

__n128 initializeWithCopy for IMUData(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(void *)(a1 + 96) = *((void *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for IMUData(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 104)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for IMUData(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 104) = v3;
  return result;
}

ValueMetadata *type metadata accessor for IMUData()
{
  return &type metadata for IMUData;
}

BOOL sub_1C38C(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v2;
  uint64_t v12 = *(void *)(a1 + 96);
  long long v3 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v3;
  long long v4 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v4;
  long long v5 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v5;
  long long v6 = *(_OWORD *)(a2 + 32);
  long long v7 = *(_OWORD *)(a2 + 48);
  long long v8 = *(_OWORD *)(a2 + 64);
  long long v9 = *(_OWORD *)(a2 + 80);
  uint64_t v14 = *(void *)(a2 + 96);
  v13[4] = v8;
  v13[5] = v9;
  v13[2] = v6;
  v13[3] = v7;
  return sub_1C42C((double *)v11, (double *)v13);
}

BOOL sub_1C3FC(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

BOOL sub_1C42C(double *a1, double *a2)
{
  if (*a1 != *a2) {
    return 0;
  }
  BOOL v2 = a1[1] == a2[1] && a1[2] == a2[2];
  if (!v2 || a1[3] != a2[3]) {
    return 0;
  }
  if (a1[4] != a2[4] || a1[5] != a2[5]) {
    return 0;
  }
  uint64_t v5 = 0;
  if (a1[6] == a2[6] && a1[7] == a2[7] && a1[8] == a2[8])
  {
    uint64_t v5 = 0;
    if (a1[9] == a2[9] && a1[10] == a2[10] && a1[11] == a2[11]) {
      return a1[12] == a2[12];
    }
  }
  return v5;
}

uint64_t getEnumTagSinglePayload for IMUAttitude(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for IMUAttitude(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = (a2 - 1);
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for IMUAttitude()
{
  return &type metadata for IMUAttitude;
}

void sub_1C560(uint64_t a1@<X8>, double a2@<D0>)
{
  sub_55DC(&qword_30660);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20070;
  *(void *)(inited + 32) = 0;
  __double2 v7 = __sincos_stret(a2);
  *(double *)&long long v6 = v7.__cosval;
  *(double *)&long long v5 = v7.__sinval;
  long long v10 = v6;
  long long v11 = v5;
  *(double *)(inited + 40) = v7.__cosval;
  *(double *)(inited + 48) = -v7.__sinval;
  swift_setDeallocating();
  uint64_t v8 = swift_initStackObject();
  *(_OWORD *)(v8 + 16) = xmmword_20070;
  *(void *)(v8 + 32) = 0;
  *(void *)(v8 + 40) = v11;
  *(void *)(v8 + 48) = v10;
  swift_setDeallocating();
  *(void *)&long long v9 = 0;
  *((double *)&v9 + 1) = -v7.__sinval;
  *(_OWORD *)a1 = 0x3FF0000000000000uLL;
  *(_OWORD *)(a1 + 16) = 0u;
  *(int64x2_t *)(a1 + 32) = vzip2q_s64((int64x2_t)0x3FF0000000000000uLL, vdupq_lane_s64(v10, 0));
  *(_OWORD *)(a1 + 48) = v11;
  *(_OWORD *)(a1 + 64) = v9;
  *(_OWORD *)(a1 + 80) = v10;
}

__n128 sub_1C6B4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double v4 = *(double *)(a1 + 72);
  __n128 v19 = *(__n128 *)(a1 + 80);
  double v5 = fabs(v4);
  BOOL v6 = (~*(void *)&v4 & 0x7FF0000000000000) != 0 && v5 <= 10.0;
  double v7 = *(double *)(a1 + 40);
  double v8 = 0.0;
  if (v6) {
    double v8 = *(double *)(a1 + 72);
  }
  if (v7 > 0.0) {
    double v8 = 3.14159265 - v8;
  }
  sub_1C560((uint64_t)&v20, v8);
  v9.f64[0] = *(float64_t *)a1;
  v10.f64[0] = *(float64_t *)(a1 + 8);
  v11.f64[0] = *(float64_t *)(a1 + 16);
  uint64_t v12 = *(_OWORD *)&vmlaq_f64(vmlaq_f64(vmulq_f64(v21, v9), v10, v23), v11, v25);
  float64x2_t v13 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(v20, *(double *)a1), v22, v10.f64[0]), v24, v11.f64[0]);
  v10.f64[0] = *(float64_t *)(a1 + 48);
  v11.f64[0] = *(float64_t *)(a1 + 56);
  v14.f64[0] = *(float64_t *)(a1 + 64);
  uint64_t v15 = *(_OWORD *)&vmlaq_f64(vmlaq_f64(vmulq_f64(v21, v10), v11, v23), v14, v25);
  float64x2_t v16 = vmlaq_n_f64(vmlaq_n_f64(vmulq_n_f64(v20, v10.f64[0]), v22, v11.f64[0]), v24, v14.f64[0]);
  uint64_t v17 = *(void *)(a1 + 96);
  *(float64x2_t *)a2 = v13;
  *(void *)(a2 + 16) = v12;
  *(_OWORD *)(a2 + 24) = *(_OWORD *)(a1 + 24);
  *(double *)(a2 + 40) = v7;
  *(float64x2_t *)(a2 + 48) = v16;
  *(void *)(a2 + 64) = v15;
  *(double *)(a2 + 72) = v4;
  __n128 result = v19;
  *(__n128 *)(a2 + 80) = v19;
  *(void *)(a2 + 96) = v17;
  return result;
}

id sub_1C7AC()
{
  uint64_t v1 = sub_1EB90();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  double v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  double v7 = (char *)&v19 - v6;
  double v8 = *(void **)(v0 + 16);
  if ([v8 isDeviceMotionAvailable])
  {
    if ([v8 isDeviceMotionActive])
    {
      if (qword_2FC30 != -1) {
        swift_once();
      }
      uint64_t v9 = sub_5690(v1, (uint64_t)MCLog);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v7, v9, v1);
      float64x2_t v10 = sub_1EB70();
      os_log_type_t v11 = sub_1EE10();
      if (os_log_type_enabled(v10, v11))
      {
        uint64_t v12 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_0, v10, v11, "Already capturing device motion data. No need to start.", v12, 2u);
        swift_slowDealloc();
      }

      return (id)(*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    }
    else
    {
      return [v8 startDeviceMotionUpdates];
    }
  }
  else
  {
    if (qword_2FC30 != -1) {
      swift_once();
    }
    uint64_t v14 = sub_5690(v1, (uint64_t)MCLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v14, v1);
    uint64_t v15 = sub_1EB70();
    os_log_type_t v16 = sub_1EE10();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_0, v15, v16, "Device motion is not available.", v17, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    sub_56C8();
    swift_allocError();
    *Class v18 = 0xD00000000000001ELL;
    v18[1] = 0x8000000000022060;
    return (id)swift_willThrow();
  }
}

void sub_1CB08(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_1EB90();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v7 = *(void **)(v1 + 16);
  unsigned int v8 = [v7 isDeviceMotionActive];
  uint64_t v9 = 0;
  if (v8)
  {
    id v10 = objc_msgSend(v7, "deviceMotion", 0.0);
    if (v10)
    {
      os_log_type_t v11 = v10;
      [v10 userAcceleration];
      uint64_t v46 = v13;
      uint64_t v47 = v12;
      uint64_t v45 = v14;
      [v11 gravity];
      uint64_t v43 = v16;
      uint64_t v44 = v15;
      uint64_t v18 = v17;
      [v11 rotationRate];
      uint64_t v20 = v19;
      uint64_t v22 = v21;
      uint64_t v24 = v23;
      id v25 = [v11 attitude];
      [v11 timestamp];
      uint64_t v27 = v26;
      [v25 pitch];
      uint64_t v29 = v28;
      [v25 roll];
      uint64_t v31 = v30;
      [v25 yaw];
      uint64_t v33 = v32;

      uint64_t v35 = v43;
      uint64_t v34 = v44;
      uint64_t v37 = v45;
      uint64_t v36 = v46;
      uint64_t v9 = v47;
      char v38 = 0;
    }
    else
    {
      if (qword_2FC30 != -1) {
        swift_once();
      }
      uint64_t v39 = sub_5690(v3, (uint64_t)MCLog);
      swift_beginAccess();
      (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v39, v3);
      double v40 = sub_1EB70();
      os_log_type_t v41 = sub_1EE10();
      if (os_log_type_enabled(v40, v41))
      {
        unint64_t v42 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unint64_t v42 = 0;
        _os_log_impl(&dword_0, v40, v41, "Device motion is empty.", v42, 2u);
        swift_slowDealloc();
      }

      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      uint64_t v36 = 0;
      char v38 = 1;
      uint64_t v37 = 0;
      uint64_t v34 = 0;
      uint64_t v35 = 0;
      uint64_t v18 = 0;
      uint64_t v20 = 0;
      uint64_t v22 = 0;
      uint64_t v24 = 0;
      uint64_t v29 = 0;
      uint64_t v31 = 0;
      uint64_t v33 = 0;
      uint64_t v27 = 0;
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v36 = 0;
    char v38 = 1;
    uint64_t v37 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    uint64_t v18 = 0;
    uint64_t v20 = 0;
    uint64_t v22 = 0;
    uint64_t v24 = 0;
    uint64_t v29 = 0;
    uint64_t v31 = 0;
    uint64_t v33 = 0;
    uint64_t v27 = 0;
  }
  *(void *)a1 = v9;
  *(void *)(a1 + 8) = v36;
  *(void *)(a1 + 16) = v37;
  *(void *)(a1 + 24) = v34;
  *(void *)(a1 + 32) = v35;
  *(void *)(a1 + 40) = v18;
  *(void *)(a1 + 48) = v20;
  *(void *)(a1 + 56) = v22;
  *(void *)(a1 + 64) = v24;
  *(void *)(a1 + 72) = v29;
  *(void *)(a1 + 80) = v31;
  *(void *)(a1 + 88) = v33;
  *(void *)(a1 + 96) = v27;
  *(unsigned char *)(a1 + 104) = v38;
}

uint64_t sub_1CE78()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1EB90();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void **)(v1 + 16);
  if ([v6 isDeviceMotionActive])
  {
    [v6 stopDeviceMotionUpdates];
  }
  else
  {
    if (qword_2FC30 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_5690(v2, (uint64_t)MCLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v7, v2);
    unsigned int v8 = sub_1EB70();
    os_log_type_t v9 = sub_1EE10();
    if (os_log_type_enabled(v8, v9))
    {
      id v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_0, v8, v9, "No ongoing capture. No need to stop.", v10, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DeviceMotionProvider()
{
  return self;
}

uint64_t sub_1D090()
{
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MovingAverageFilter()
{
  return self;
}

uint64_t getEnumTagSinglePayload for MovingAverageFilterConfiguration(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && a1[16]) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *a1;
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MovingAverageFilterConfiguration(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(unsigned char *)__n128 result = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MovingAverageFilterConfiguration()
{
  return &type metadata for MovingAverageFilterConfiguration;
}

void sub_1D190()
{
  uint64_t v1 = v0;
  v0[2] = 0xD000000000000022;
  v0[3] = 0x80000000000221F0;
  v0[6] = 0;
  v0[7] = 0;
  NSString v2 = sub_1EC10();
  id v3 = [self bannerSourceForDestination:0 forRequesterIdentifier:v2];

  if (v3)
  {
    v1[4] = v3;
    sub_55DC(&qword_30F18);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_20060;
    *(void *)(inited + 32) = sub_1EC20();
    *(void *)(inited + 40) = v5;
    sub_1E2DC();
    *(NSNumber *)(inited + 48) = sub_1EE50(1);
    v1[5] = sub_6F6C(inited);
  }
  else
  {
    __break(1u);
  }
}

void sub_1D28C(uint64_t a1)
{
  NSString v2 = (void *)v1;
  uint64_t v4 = sub_1EB90();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  BOOL v55 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1EB30();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  id v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DAB0();
  [*(id *)(v1 + 56) invalidate];
  int v11 = SBUIIsSystemApertureEnabled();
  uint64_t v12 = a1 + 32;
  long long v13 = *(_OWORD *)a1;
  long long v58 = *(_OWORD *)(a1 + 16);
  long long v59 = v13;
  if (v11)
  {
    sub_12BB4(v12, (uint64_t)&v61);
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(v1 + 16);
    uint64_t v16 = *(void *)(v1 + 24);
    id v17 = objc_allocWithZone((Class)type metadata accessor for AXMotionCuesSystemAperturePresentable());
    sub_12C1C((uint64_t)&v59);
    sub_12C1C((uint64_t)&v58);
    sub_12C48(&v61);
    sub_10F08(v14);
    swift_bridgeObjectRetain();
    id v18 = sub_129D8(a1, v15, v16);
    sub_1E22C((uint64_t)&v59);
    sub_1E22C((uint64_t)&v58);
    sub_1E258(&v61);
    uint64_t v19 = v14;
  }
  else
  {
    sub_12BB4(v12, (uint64_t)&v61);
    uint64_t v53 = v5;
    uint64_t v20 = *(void *)(a1 + 40);
    uint64_t v54 = v4;
    uint64_t v22 = *(void *)(v1 + 16);
    uint64_t v21 = *(void *)(v1 + 24);
    Class v52 = (Class)type metadata accessor for AXMotionCuesBannerPresentable();
    uint64_t v23 = (char *)objc_allocWithZone(v52);
    uint64_t v24 = &v23[OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_content];
    uint64_t v25 = *(void *)(a1 + 48);
    long long v27 = *(_OWORD *)(a1 + 16);
    long long v26 = *(_OWORD *)(a1 + 32);
    *(_OWORD *)uint64_t v24 = *(_OWORD *)a1;
    *((_OWORD *)v24 + 1) = v27;
    *((_OWORD *)v24 + 2) = v26;
    *((void *)v24 + 6) = v25;
    uint64_t v28 = &v23[OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_requesterIdentifier];
    *(void *)uint64_t v28 = v22;
    *((void *)v28 + 1) = v21;
    sub_12C1C((uint64_t)&v59);
    sub_12C1C((uint64_t)&v58);
    sub_12C48(&v61);
    sub_10F08(v20);
    sub_12C1C((uint64_t)&v59);
    sub_12C1C((uint64_t)&v58);
    sub_12C48(&v61);
    sub_10F08(v20);
    swift_bridgeObjectRetain();
    uint64_t v29 = v23;
    sub_1EB20();
    uint64_t v30 = sub_1EB10();
    uint64_t v32 = v31;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    uint64_t v33 = (uint64_t *)&v29[OBJC_IVAR____TtC18AXMotionCuesServer29AXMotionCuesBannerPresentable_requestIdentifier];
    *uint64_t v33 = v30;
    v33[1] = v32;
    uint64_t v4 = v54;

    v57.receiver = v29;
    v57.super_class = v52;
    id v18 = objc_msgSendSuper2(&v57, "init");
    sub_1E22C((uint64_t)&v59);
    sub_1E22C((uint64_t)&v58);
    sub_1E258(&v61);
    uint64_t v19 = v20;
    uint64_t v5 = v53;
  }
  sub_10FBC(v19);
  v2[6] = v18;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  uint64_t v34 = (void *)v2[4];
  swift_unknownObjectRetain();
  sub_55DC((uint64_t *)&unk_30F00);
  Class isa = sub_1EBD0().super.isa;
  aBlock[0] = 0;
  LODWORD(v34) = [v34 postPresentable:v18 options:1 userInfo:isa error:aBlock];
  swift_unknownObjectRelease();

  id v36 = aBlock[0];
  if (v34)
  {
    if (*(void *)(a1 + 40)) {
      double v37 = 5.0;
    }
    else {
      double v37 = 3.0;
    }
    char v38 = self;
    uint64_t v39 = (void *)swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_1E2BC;
    aBlock[5] = v39;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1DA48;
    aBlock[3] = &unk_29B88;
    double v40 = _Block_copy(aBlock);
    id v41 = v36;
    swift_release();
    id v42 = [v38 scheduledTimerWithTimeInterval:0 repeats:v40 block:v37];
    swift_unknownObjectRelease();
    _Block_release(v40);
    uint64_t v43 = (void *)v2[7];
    v2[7] = v42;
  }
  else
  {
    id v44 = aBlock[0];
    sub_1EAE0();

    swift_willThrow();
    if (qword_2FC30 != -1) {
      swift_once();
    }
    uint64_t v45 = sub_5690(v4, (uint64_t)MCLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v55, v45, v4);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v46 = sub_1EB70();
    os_log_type_t v47 = sub_1EE10();
    if (os_log_type_enabled(v46, v47))
    {
      uint64_t v54 = v4;
      BOOL v48 = (uint8_t *)swift_slowAlloc();
      BOOL v49 = (void *)swift_slowAlloc();
      *(_DWORD *)BOOL v48 = 138412290;
      swift_errorRetain();
      uint64_t v50 = v5;
      uint64_t v51 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v56 = v51;
      uint64_t v4 = v54;
      sub_1EEE0();
      *BOOL v49 = v51;
      uint64_t v5 = v50;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl(&dword_0, v46, v47, "Error posting banner: %@", v48, 0xCu);
      sub_55DC(&qword_30240);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_unknownObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v55, v4);
  }
}

uint64_t sub_1D9D8()
{
  swift_beginAccess();
  uint64_t result = swift_weakLoadStrong();
  if (result)
  {
    sub_1DAB0();
    return swift_release();
  }
  return result;
}

void sub_1DA48(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_1DAB0()
{
  uint64_t v1 = sub_1EB90();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin();
  id v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = *(id *)(v0 + 48);
  if (result)
  {
    id result = [result requestIdentifier];
    if (result)
    {
      uint64_t v6 = result;
      sub_1EC20();

      uint64_t v7 = *(void **)(v0 + 32);
      NSString v8 = sub_1EC10();
      swift_bridgeObjectRelease();
      NSString v9 = sub_1EC10();
      sub_6F6C((uint64_t)&_swiftEmptyArrayStorage);
      sub_55DC((uint64_t *)&unk_30F00);
      Class isa = sub_1EBD0().super.isa;
      swift_bridgeObjectRelease();
      v23[0] = 0;
      id v11 = [v7 revokePresentableWithRequestIdentifier:v8 reason:v9 animated:1 userInfo:isa error:v23];

      if (v11)
      {
        id v12 = v23[0];

        return [*(id *)(v0 + 56) invalidate];
      }
      else
      {
        id v13 = v23[0];
        sub_1EAE0();

        swift_willThrow();
        if (qword_2FC30 != -1) {
          swift_once();
        }
        uint64_t v14 = sub_5690(v1, (uint64_t)MCLog);
        swift_beginAccess();
        (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v14, v1);
        swift_errorRetain();
        swift_errorRetain();
        uint64_t v15 = sub_1EB70();
        os_log_type_t v16 = sub_1EE10();
        if (os_log_type_enabled(v15, v16))
        {
          id v17 = (uint8_t *)swift_slowAlloc();
          uint64_t v21 = (void *)swift_slowAlloc();
          *(_DWORD *)id v17 = 138412290;
          swift_errorRetain();
          uint64_t v18 = v2;
          uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
          uint64_t v22 = v19;
          sub_1EEE0();
          *uint64_t v21 = v19;
          uint64_t v2 = v18;
          swift_errorRelease();
          swift_errorRelease();
          _os_log_impl(&dword_0, v15, v16, "Error dismissing banner: %@", v17, 0xCu);
          sub_55DC(&qword_30240);
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
        return (id)(*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      }
    }
  }
  return result;
}

uint64_t sub_1DE9C()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AXMotionCuesBannerManager()
{
  return self;
}

void destroy for AXMotionCuesBannerContent(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (*(void *)(a1 + 40))
  {
    swift_release();
  }
}

void *initializeWithCopy for AXMotionCuesBannerContent(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = (void *)a2[4];
  a1[4] = v6;
  NSString v8 = a2 + 5;
  uint64_t v7 = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v9 = v6;
  if (v7)
  {
    uint64_t v10 = a2[6];
    a1[5] = v7;
    a1[6] = v10;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 5) = *v8;
  }
  return a1;
}

void *assignWithCopy for AXMotionCuesBannerContent(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (void *)a1[4];
  uint64_t v5 = (void *)a2[4];
  a1[4] = v5;
  id v6 = v5;

  uint64_t v7 = a2[5];
  if (!a1[5])
  {
    if (v7)
    {
      uint64_t v9 = a2[6];
      a1[5] = v7;
      a1[6] = v9;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
    return a1;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v8 = a2[6];
  a1[5] = v7;
  a1[6] = v8;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AXMotionCuesBannerContent(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  uint64_t v6 = *(void *)(a2 + 40);
  if (!*(void *)(a1 + 40))
  {
    if (v6)
    {
      uint64_t v8 = *(void *)(a2 + 48);
      *(void *)(a1 + 40) = v6;
      *(void *)(a1 + 48) = v8;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    return a1;
  }
  if (!v6)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = v6;
  *(void *)(a1 + 48) = v7;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AXMotionCuesBannerContent(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 56)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXMotionCuesBannerContent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)id result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 56) = 1;
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
    *(unsigned char *)(result + 56) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AXMotionCuesBannerContent()
{
  return &type metadata for AXMotionCuesBannerContent;
}

uint64_t sub_1E22C(uint64_t a1)
{
  return a1;
}

id *sub_1E258(id *a1)
{
  return a1;
}

uint64_t sub_1E284()
{
  swift_weakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1E2BC()
{
  return sub_1D9D8();
}

uint64_t sub_1E2C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1E2D4()
{
  return swift_release();
}

unint64_t sub_1E2DC()
{
  unint64_t result = qword_30F20;
  if (!qword_30F20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_30F20);
  }
  return result;
}

id sub_1E31C()
{
  uint64_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v3 = sub_1EB90();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void **)&v1[OBJC_IVAR____TtC18AXMotionCuesServer24HeadphonesMotionProvider__manager];
  if ([v7 isDeviceMotionActive])
  {
    [v7 stopDeviceMotionUpdates];
  }
  else
  {
    if (qword_2FC30 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_5690(v3, (uint64_t)MCLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v8, v3);
    uint64_t v9 = sub_1EB70();
    os_log_type_t v10 = sub_1EE10();
    if (os_log_type_enabled(v9, v10))
    {
      id v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_0, v9, v10, "No ongoing headphones motion data updates. No need to stop.", v11, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  v14.receiver = v1;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, "dealloc");
}

id sub_1E520()
{
  uint64_t v1 = sub_1EB90();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = *(void **)(v0 + OBJC_IVAR____TtC18AXMotionCuesServer24HeadphonesMotionProvider__manager);
  if ([v5 isDeviceMotionActive])
  {
    return [v5 stopDeviceMotionUpdates];
  }
  else
  {
    if (qword_2FC30 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_5690(v1, (uint64_t)MCLog);
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
    uint64_t v8 = sub_1EB70();
    os_log_type_t v9 = sub_1EE10();
    if (os_log_type_enabled(v8, v9))
    {
      os_log_type_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v10 = 0;
      _os_log_impl(&dword_0, v8, v9, "No ongoing headphones motion data updates. No need to stop.", v10, 2u);
      swift_slowDealloc();
    }

    return (id)(*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t type metadata accessor for HeadphonesMotionProvider()
{
  return self;
}

uint64_t sub_1E8B0(char a1, const char *a2)
{
  uint64_t v5 = sub_1EB90();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(unsigned char *)(v2 + OBJC_IVAR____TtC18AXMotionCuesServer24HeadphonesMotionProvider_connected) = a1;
  if (qword_2FC30 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_5690(v5, (uint64_t)MCLog);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  os_log_type_t v10 = sub_1EB70();
  os_log_type_t v11 = sub_1EE20();
  if (os_log_type_enabled(v10, v11))
  {
    id v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_0, v10, v11, a2, v12, 2u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_1EA70()
{
  uint64_t v0 = abort_report_np();
  sub_1EA98(v0);
}

void sub_1EA98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, Swift::String a9)
{
  v10._countAndFlagsBits = abort_report_np();
  sub_1EAC0(v10, v11, v9, v12, a9);
}

uint64_t sub_1EAC0(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_1EAD0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_1EAE0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_1EAF0()
{
  return static Date.now.getter();
}

uint64_t sub_1EB00()
{
  return type metadata accessor for Date();
}

uint64_t sub_1EB10()
{
  return UUID.uuidString.getter();
}

uint64_t sub_1EB20()
{
  return UUID.init()();
}

uint64_t sub_1EB30()
{
  return type metadata accessor for UUID();
}

uint64_t sub_1EB40()
{
  return static _CFObject.== infix(_:_:)();
}

uint64_t sub_1EB50()
{
  return _CFObject.hash(into:)();
}

uint64_t sub_1EB60()
{
  return _CFObject.hashValue.getter();
}

uint64_t sub_1EB70()
{
  return Logger.logObject.getter();
}

uint64_t sub_1EB80()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1EB90()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1EBA0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1EBB0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1EBC0()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_1EBD0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_1EBE0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1EBF0()
{
  return Dictionary.description.getter();
}

uint64_t sub_1EC00()
{
  return type metadata accessor for ClosedRange();
}

NSString sub_1EC10()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1EC20()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1EC30()
{
  return String.hash(into:)();
}

void sub_1EC40(Swift::String a1)
{
}

Swift::Int sub_1EC50()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_1EC60()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_1EC70()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_1EC80()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1EC90()
{
  return specialized Array._endMutation()();
}

uint64_t sub_1ECA0()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_1ECB0()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_1ECC0()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

NSNumber sub_1ECD0()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_1ECE0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_1ECF0()
{
  return CheckedContinuation.resume(returning:)();
}

uint64_t sub_1ED00()
{
  return static MainActor.shared.getter();
}

uint64_t sub_1ED10()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_1ED20()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_1ED30()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1ED40()
{
  return AsyncStream.Continuation.onTermination.setter();
}

uint64_t sub_1ED50()
{
  return AsyncStream.Continuation.yield(_:)();
}

void sub_1ED60()
{
}

uint64_t sub_1ED70()
{
  return AsyncStream.makeAsyncIterator()();
}

uint64_t sub_1ED90()
{
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

void sub_1EDA0()
{
}

NSNumber sub_1EDC0()
{
  return Double._bridgeToObjectiveC()();
}

NSSet sub_1EDD0()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_1EDE0()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

NSNumber sub_1EDF0()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_1EE00()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_1EE10()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1EE20()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1EE30()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_1EE40()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

NSNumber sub_1EE50(Swift::Bool BOOLeanLiteral)
{
  return NSNumber.init(BOOLeanLiteral:)(BOOLeanLiteral);
}

Swift::Int sub_1EE60(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_1EE70()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_1EE80()
{
  return type metadata accessor for UIButton.Configuration.CornerStyle();
}

uint64_t sub_1EE90()
{
  return UIButton.Configuration.cornerStyle.setter();
}

uint64_t sub_1EEA0()
{
  return UIButton.Configuration.image.setter();
}

uint64_t sub_1EEB0()
{
  return static UIButton.Configuration.filled()();
}

uint64_t sub_1EEC0()
{
  return type metadata accessor for UIButton.Configuration();
}

uint64_t sub_1EED0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_1EEE0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1EEF0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1EF00()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_1EF10()
{
  return __CocoaSet.startIndex.getter();
}

uint64_t sub_1EF20()
{
  return static __CocoaSet.Index.== infix(_:_:)();
}

uint64_t sub_1EF30()
{
  return __CocoaSet.Index.age.getter();
}

uint64_t sub_1EF40()
{
  return __CocoaSet.Index.element.getter();
}

uint64_t sub_1EF50()
{
  return __CocoaSet.element(at:)();
}

uint64_t sub_1EF60()
{
  return __CocoaSet.endIndex.getter();
}

Swift::Int sub_1EF70(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_1EF80()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_1EF90()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_1EFB0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_1EFC0(Swift::Int a1)
{
}

uint64_t sub_1EFD0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1EFE0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1EFF0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1F000()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1F010()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1F020()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1F030()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_1F040()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1F060()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1F070()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t sub_1F080()
{
  return max<A>(_:_:)();
}

uint64_t sub_1F090()
{
  return min<A>(_:_:)();
}

uint64_t sub_1F0A0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_1F0B0()
{
  return Error._code.getter();
}

uint64_t sub_1F0C0()
{
  return Error._domain.getter();
}

uint64_t sub_1F0D0()
{
  return Error._userInfo.getter();
}

uint64_t sub_1F0E0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_1F0F0()
{
  return Hasher._finalize()();
}

uint64_t AXLogHapticMusic()
{
  return _AXLogHapticMusic();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
}

uint64_t BiomeLibrary()
{
  return _BiomeLibrary();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t SBUIIsSystemApertureEnabled()
{
  return _SBUIIsSystemApertureEnabled();
}

uint64_t _AXSMotionCuesActive()
{
  return __AXSMotionCuesActive();
}

uint64_t _AXSMotionCuesEnabled()
{
  return __AXSMotionCuesEnabled();
}

uint64_t _AXSMotionCuesMode()
{
  return __AXSMotionCuesMode();
}

uint64_t _AXSMotionCuesShouldShowBanner()
{
  return __AXSMotionCuesShouldShowBanner();
}

uint64_t _AXSSetMotionCuesActive()
{
  return __AXSSetMotionCuesActive();
}

uint64_t _AXSSetMotionCuesShouldShowBanner()
{
  return __AXSSetMotionCuesShouldShowBanner();
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

uint64_t _UIUpdateCycleEnabled()
{
  return __UIUpdateCycleEnabled();
}

uint64_t _UIUpdateRequestActivate()
{
  return __UIUpdateRequestActivate();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return __UIUpdateRequestDeactivate();
}

uint64_t _UIUpdateSequenceInsertItem()
{
  return __UIUpdateSequenceInsertItem();
}

uint64_t _UIUpdateSequenceRemoveItem()
{
  return __UIUpdateSequenceRemoveItem();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__double2 __sincos_stret(double a1)
{
  __double2 v3 = ___sincos_stret(a1);
  double cosval = v3.__cosval;
  double sinval = v3.__sinval;
  result.__double cosval = cosval;
  result.__double sinval = sinval;
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void bzero(void *a1, size_t a2)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
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

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

uint64_t swift_willThrowTypedImpl()
{
  return _swift_willThrowTypedImpl();
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_handleIconElementRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleIconElementRequest:completionHandler:");
}

id objc_msgSend_initWithIntent_moduleIdentifier_containerBundleIdentifier_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIntent:moduleIdentifier:containerBundleIdentifier:size:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}