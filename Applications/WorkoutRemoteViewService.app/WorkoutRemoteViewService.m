uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  objc_class *v7;
  NSString *v8;
  uint64_t v9;

  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  v9 = UIApplicationMain(a1, a2, v6, v8);

  return v9;
}

void sub_1000059B4(void *a1, void (*a2)(uint64_t))
{
  v3 = v2;
  id v6 = [v3 view];
  if (!v6)
  {
    __break(1u);
    goto LABEL_27;
  }
  v7 = v6;
  id v8 = [v6 window];

  if (v8)
  {
    id v9 = [v8 _rootSheetPresentationController];

    if (!v9)
    {
LABEL_28:
      __break(1u);
      return;
    }
    [v9 _setShouldScaleDownBehindDescendantSheets:0];
  }
  v23 = sub_100005D50;
  uint64_t v24 = 0;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v22 = sub_100005D54;
  *((void *)&v22 + 1) = &unk_10000C768;
  v10 = _Block_copy(&aBlock);
  id v11 = [v3 _remoteViewControllerProxyWithErrorHandler:v10];
  _Block_release(v10);
  if (v11)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long aBlock = 0u;
    long long v22 = 0u;
  }
  sub_100007244((uint64_t)&aBlock, (uint64_t)v25);
  sub_1000072F0((uint64_t)v25, (uint64_t)&aBlock);
  if (*((void *)&v22 + 1))
  {
    sub_1000072AC(&qword_100011510);
    if (swift_dynamicCast())
    {
      [v19[0] setAllowsAlertStacking:1];
      [v19[0] setWallpaperTunnelActive:1];
      [v19[0] setAllowsMenuButtonDismissal:1];
      [v19[0] setAllowsSiri:1];
      [v19[0] setDismissalAnimationStyle:2];
      [v19[0] setSwipeDismissalStyle:1];
      swift_unknownObjectRelease();
    }
  }
  else
  {
    sub_100007B44((uint64_t)&aBlock, &qword_1000114A8);
  }
  if (!a1)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  id v12 = [a1 userInfo];
  if (v12)
  {
    v13 = v12;
    uint64_t v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v14 + 16) && (unint64_t v15 = sub_100007CA4((uint64_t)&aBlock), (v16 & 1) != 0))
    {
      sub_100007AE4(*(void *)(v14 + 56) + 32 * v15, (uint64_t)v19);
    }
    else
    {
      *(_OWORD *)v19 = 0u;
      long long v20 = 0u;
    }
    sub_100007CE8((uint64_t)&aBlock);
    swift_bridgeObjectRelease();
    if (*((void *)&v20 + 1))
    {
      uint64_t v17 = swift_dynamicCast();
      if (v17)
      {
        long long v18 = aBlock;
        sub_100005F34();
        uint64_t v17 = sub_100007D3C(v18, *((unint64_t *)&v18 + 1));
      }
      goto LABEL_23;
    }
  }
  else
  {
    *(_OWORD *)v19 = 0u;
    long long v20 = 0u;
  }
  uint64_t v17 = sub_100007B44((uint64_t)v19, &qword_1000114A8);
LABEL_23:
  if (a2) {
    a2(v17);
  }
  sub_100007B44((uint64_t)v25, &qword_1000114A8);
}

void sub_100005D54(uint64_t a1, void *a2)
{
  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_100005F34()
{
  uint64_t v0 = type metadata accessor for WorkoutConfigurationView();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  id v6 = (char *)&v28 - v5;
  type metadata accessor for WorkoutConfiguration();
  type metadata accessor for Occurrence();
  v7 = (void *)Occurrence.__allocating_init(count:)();
  type metadata accessor for WorkoutConfigurationValidator();
  static WorkoutConfigurationValidator.shared.getter();
  id v8 = (void *)static WorkoutConfiguration.importFromData(_:with:validator:)();
  uint64_t v9 = v1;

  swift_release();
  id v10 = [objc_allocWithZone((Class)HKHealthStore) init];
  id v11 = [objc_allocWithZone((Class)FIUIUnitManager) initWithHealthStore:v10];
  id result = [objc_allocWithZone((Class)FIUIFormattingManager) initWithUnitManager:v11];
  if (result)
  {
    v13 = result;
    id v28 = v11;
    id v29 = v10;
    uint64_t v14 = swift_allocObject();
    unint64_t v15 = v30;
    *(void *)(v14 + 16) = v30;
    id v16 = v8;
    id v17 = v13;
    id v18 = v15;
    WorkoutConfigurationView.init(workoutConfiguration:formattingManager:showAddButton:showStartWorkoutButton:overrideSaveWorkoutAction:startWorkoutAction:overrideDismissAction:referenceIntervalWorkoutConfiguration:)();
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v4, v6, v0);
    sub_100007C04((unint64_t *)&qword_100011610, (void (*)(uint64_t))&type metadata accessor for WorkoutConfigurationView);
    AnyView.init<A>(_:)();
    v19 = (void *)_makeUIHostingController(_:)();
    swift_release();
    self;
    uint64_t v20 = swift_dynamicCastObjCClass();
    if (v20)
    {
      uint64_t v21 = v20;
      id v22 = objc_allocWithZone((Class)UINavigationController);
      id v23 = v19;
      id v24 = [v22 initWithRootViewController:v21];
      [v24 setModalInPresentation:1];
      [v18 presentViewController:v24 animated:1 completion:0];

      return (id)(*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v6, v0);
    }
    else
    {

      uint64_t v25 = type metadata accessor for ImportError();
      sub_100007C04((unint64_t *)&unk_100011550, (void (*)(uint64_t))&type metadata accessor for ImportError);
      uint64_t v26 = swift_allocError();
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)(v25 - 8) + 104))(v27, enum case for ImportError.unexpectedValueType(_:), v25);
      swift_willThrow();

      (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v0);
      sub_10000639C(v26);
      return (id)swift_errorRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000639C(uint64_t a1)
{
  sub_1000072AC((uint64_t *)&unk_1000115F0);
  __chkstk_darwin();
  id v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = a1;
  swift_errorRetain();
  sub_1000072AC(&qword_100011548);
  uint64_t v5 = type metadata accessor for ImportError();
  int v6 = swift_dynamicCast();
  v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  if (v6)
  {
    uint64_t v8 = *(void *)(v5 - 8);
    v7(v4, 0, 1, v5);
    (*(void (**)(char *, uint64_t))(v8 + 88))(v4, v5);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v5);
  }
  else
  {
    v7(v4, 1, 1, v5);
    sub_100007B44((uint64_t)v4, (uint64_t *)&unk_1000115F0);
  }
  String.workoutKitLocalized()();
  String.workoutKitLocalized()();
  String.workoutKitLocalized()();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [self alertControllerWithTitle:v9 message:v10 preferredStyle:1];

  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_100007BD8;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007EDC;
  aBlock[3] = &unk_10000C6F0;
  uint64_t v14 = _Block_copy(aBlock);
  swift_release();
  id v15 = [self actionWithTitle:v13 style:0 handler:v14];
  _Block_release(v14);
  swift_release();

  [v11 addAction:v15];
  id v16 = [objc_allocWithZone((Class)UIViewController) init];
  id v17 = [v16 view];
  if (v17)
  {
    id v18 = v17;
    id v19 = [self systemBackgroundColor];
    [v18 setBackgroundColor:v19];

    [v16 presentViewController:v11 animated:0 completion:0];
    [v1 presentViewController:v16 animated:0 completion:0];
  }
  else
  {
    __break(1u);
  }
}

void sub_1000067E0()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100006834();
  }
}

void sub_100006834()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  id v2 = v0;
  id v3 = [v2 presentedViewController];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = sub_1000071C4;
    *(void *)(v5 + 24) = v1;
    v7[4] = sub_100007204;
    v7[5] = v5;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 1107296256;
    v7[2] = sub_100006FC0;
    v7[3] = &unk_10000C650;
    int v6 = _Block_copy(v7);
    swift_retain();
    swift_release();
    [v4 dismissViewControllerAnimated:1 completion:v6];
    swift_release();
    _Block_release(v6);
  }
  else
  {
    sub_10000699C(v2);
    swift_release();
  }
}

uint64_t sub_10000699C(void *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  NSString v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = (id (*)())sub_100005D50;
  uint64_t v21 = 0;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v19 = sub_100005D54;
  *((void *)&v19 + 1) = &unk_10000C678;
  NSString v10 = _Block_copy(&aBlock);
  id v11 = [a1 _remoteViewControllerProxyWithErrorHandler:v10];
  _Block_release(v10);
  if (v11)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long aBlock = 0u;
    long long v19 = 0u;
  }
  sub_100007244((uint64_t)&aBlock, (uint64_t)v22);
  sub_1000072F0((uint64_t)v22, (uint64_t)&aBlock);
  if (*((void *)&v19 + 1))
  {
    sub_1000072AC(&qword_100011510);
    if (swift_dynamicCast())
    {
      id v12 = v17;
      [v17 deactivate];
      [v12 invalidate];
      sub_100007358();
      NSString v13 = (void *)static OS_dispatch_queue.main.getter();
      uint64_t v20 = sub_100006FA0;
      uint64_t v21 = 0;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      *(void *)&long long v19 = sub_100006FC0;
      *((void *)&v19 + 1) = &unk_10000C6A0;
      uint64_t v14 = _Block_copy(&aBlock);
      static DispatchQoS.unspecified.getter();
      *(void *)&long long aBlock = &_swiftEmptyArrayStorage;
      sub_100007C04(&qword_100011520, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
      uint64_t v16 = v6;
      sub_1000072AC(&qword_100011528);
      sub_100007398();
      dispatch thunk of SetAlgebra.init<A>(_:)();
      OS_dispatch_queue.async(group:qos:flags:execute:)();
      _Block_release(v14);
      swift_unknownObjectRelease();

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v16);
    }
  }
  else
  {
    sub_100007B44((uint64_t)&aBlock, &qword_1000114A8);
  }
  return sub_100007B44((uint64_t)v22, &qword_1000114A8);
}

uint64_t sub_100006D74(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static WOLog.app.getter();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v15 = v2;
    NSString v9 = (uint8_t *)v8;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v16 = a1;
    uint64_t v17 = v10;
    *(_DWORD *)NSString v9 = 136315138;
    sub_1000072AC(&qword_100011538);
    uint64_t v11 = Optional.description.getter();
    uint64_t v16 = sub_10000743C(v11, v12, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "[RemoteAlert] proxy error: %s", v9, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v15);
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

id sub_100006FA0()
{
  id result = (id)UIApp;
  if (UIApp) {
    return [UIApp terminateWithSuccess];
  }
  __break(1u);
  return result;
}

uint64_t sub_100006FC0(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

id sub_100007134()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorkoutRemoteAlertServiceViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for WorkoutRemoteAlertServiceViewController()
{
  return self;
}

uint64_t sub_10000718C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000071C4()
{
  return sub_10000699C(*(void **)(v0 + 16));
}

uint64_t sub_1000071CC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100007204()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000722C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000723C()
{
  return swift_release();
}

uint64_t sub_100007244(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000072AC(&qword_1000114A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000072AC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000072F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000072AC(&qword_1000114A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100007358()
{
  unint64_t result = qword_100011518;
  if (!qword_100011518)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100011518);
  }
  return result;
}

unint64_t sub_100007398()
{
  unint64_t result = qword_100011530;
  if (!qword_100011530)
  {
    sub_1000073F4(&qword_100011528);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011530);
  }
  return result;
}

uint64_t sub_1000073F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000743C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007510(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007AE4((uint64_t)v12, *a3);
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
      sub_100007AE4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007A94((uint64_t)v12);
  return v7;
}

uint64_t sub_100007510(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_1000076CC(a5, a6);
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

uint64_t sub_1000076CC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007764(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007944(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007944(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007764(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1000078DC(v2, 0);
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

void *sub_1000078DC(uint64_t a1, uint64_t a2)
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
  sub_1000072AC(&qword_100011540);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100007944(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000072AC(&qword_100011540);
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
  NSString v13 = a4 + 32;
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

uint64_t sub_100007A94(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100007AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100007B44(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000072AC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100007BA0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100007BD8()
{
}

void sub_100007BE0()
{
}

uint64_t sub_100007C04(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100007C4C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100007C5C()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100007C94()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unint64_t sub_100007CA4(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_100007D94(a1, v4);
}

uint64_t sub_100007CE8(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007D3C(uint64_t a1, unint64_t a2)
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

unint64_t sub_100007D94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100007E5C(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_100007CE8((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100007E5C(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_100007EDC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_100007F44()
{
  uint64_t v1 = OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR___WorkoutPreviewViewController____lazy_storage___formattingManager);
LABEL_5:
    id v9 = v2;
    return v3;
  }
  id v4 = [objc_allocWithZone((Class)HKHealthStore) init];
  id v5 = [objc_allocWithZone((Class)FIUIUnitManager) initWithHealthStore:v4];
  id result = [objc_allocWithZone((Class)FIUIFormattingManager) initWithUnitManager:v5];
  if (result)
  {
    int64_t v7 = result;

    int64_t v8 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v7;
    id v3 = v7;

    uint64_t v2 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_10000802C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [self interfaceWithProtocol:*a3];

  return v3;
}

void sub_100008088(void *a1)
{
  uint64_t v3 = type metadata accessor for WorkoutConfigurationView();
  __chkstk_darwin(v3);
  id v4 = a1;
  sub_100007F44();
  *(void *)(swift_allocObject() + 16) = v1;
  id v5 = v1;
  WorkoutConfigurationView.init(workoutConfiguration:formattingManager:showAddButton:showStartWorkoutButton:overrideSaveWorkoutAction:startWorkoutAction:overrideDismissAction:referenceIntervalWorkoutConfiguration:)();
  sub_100008FE8();
  AnyView.init<A>(_:)();
  char v6 = (void *)_makeUIHostingController(_:)();
  swift_release();
  self;
  uint64_t v7 = swift_dynamicCastObjCClass();
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = objc_allocWithZone((Class)UINavigationController);
    id v10 = v6;
    id v11 = [v9 initWithRootViewController:v8];
    sub_10000828C(v11);
  }
}

uint64_t sub_10000820C(void *a1)
{
  id v1 = [a1 _remoteViewControllerProxy];
  uint64_t result = swift_unknownObjectRelease();
  if (v1)
  {
    [v1 dismiss];
    return swift_unknownObjectRelease();
  }
  return result;
}

id sub_10000828C(void *a1)
{
  uint64_t v2 = v1;
  [v1 addChildViewController:a1];
  id result = [a1 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_16;
  }
  id v5 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  id result = [v2 view];
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  char v6 = result;
  id result = [a1 view];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v7 = result;
  [v6 addSubview:result];

  sub_1000072AC(&qword_100011600);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10000B7C0;
  id result = [a1 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  id v9 = result;
  id v10 = [result leadingAnchor];

  id result = [v2 view];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v11 = result;
  id v12 = [result leadingAnchor];

  id v13 = [v10 constraintEqualToAnchor:v12];
  *(void *)(v8 + 32) = v13;
  id result = [a1 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v14 = result;
  id v15 = [result topAnchor];

  id result = [v2 view];
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v16 = result;
  id v17 = [result topAnchor];

  id v18 = [v15 constraintEqualToAnchor:v17];
  *(void *)(v8 + 40) = v18;
  id result = [a1 view];
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  long long v19 = result;
  id v20 = [result trailingAnchor];

  id result = [v2 view];
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v21 = result;
  id v22 = [result trailingAnchor];

  id v23 = [v20 constraintEqualToAnchor:v22];
  *(void *)(v8 + 48) = v23;
  id result = [a1 view];
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v24 = result;
  id v25 = [result bottomAnchor];

  id result = [v2 view];
  if (!result)
  {
LABEL_25:
    __break(1u);
    return result;
  }
  uint64_t v26 = result;
  uint64_t v27 = self;
  id v28 = [v26 bottomAnchor];

  id v29 = [v25 constraintEqualToAnchor:v28];
  *(void *)(v8 + 56) = v29;
  specialized Array._endMutation()();
  sub_100008F68();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v27 activateConstraints:isa];

  return [a1 didMoveToParentViewController:v2];
}

void sub_100008698(uint64_t a1)
{
  uint64_t v2 = sub_1000072AC((uint64_t *)&unk_1000115F0);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = a1;
  swift_errorRetain();
  sub_1000072AC(&qword_100011548);
  uint64_t v5 = type metadata accessor for ImportError();
  int v6 = swift_dynamicCast();
  uint64_t v7 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56);
  if (v6)
  {
    uint64_t v8 = *(void *)(v5 - 8);
    v7(v4, 0, 1, v5);
    (*(void (**)(char *, uint64_t))(v8 + 88))(v4, v5);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v5);
  }
  else
  {
    v7(v4, 1, 1, v5);
    sub_100008EAC((uint64_t)v4);
  }
  String.workoutKitLocalized()();
  String.workoutKitLocalized()();
  String.workoutKitLocalized()();
  NSString v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v11 = [self alertControllerWithTitle:v9 message:v10 preferredStyle:1];

  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_100008F44;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007EDC;
  aBlock[3] = &unk_10000C7B8;
  uint64_t v14 = _Block_copy(aBlock);
  swift_release();
  id v15 = [self actionWithTitle:v13 style:0 handler:v14];
  _Block_release(v14);
  swift_release();

  [v11 addAction:v15];
  id v16 = [objc_allocWithZone((Class)UIViewController) init];
  id v17 = [v16 view];
  if (v17)
  {
    id v18 = v17;
    id v19 = [self systemBackgroundColor];
    [v18 setBackgroundColor:v19];

    sub_10000828C(v16);
    [v16 presentViewController:v11 animated:0 completion:0];
  }
  else
  {
    __break(1u);
  }
}

void sub_100008AC4()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = Strong;
    id v2 = [Strong _remoteViewControllerProxy];
    swift_unknownObjectRelease();
    if (v2)
    {
      [v2 dismiss];

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

id sub_100008D2C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for WorkoutPreviewViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for WorkoutPreviewViewController()
{
  return self;
}

uint64_t sub_100008EAC(uint64_t a1)
{
  uint64_t v2 = sub_1000072AC((uint64_t *)&unk_1000115F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008F0C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100008F44()
{
}

uint64_t sub_100008F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100008F5C()
{
  return swift_release();
}

unint64_t sub_100008F68()
{
  unint64_t result = qword_100011608;
  if (!qword_100011608)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100011608);
  }
  return result;
}

uint64_t sub_100008FA8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008FE0()
{
  return sub_10000820C(*(void **)(v0 + 16));
}

unint64_t sub_100008FE8()
{
  unint64_t result = qword_100011610;
  if (!qword_100011610)
  {
    type metadata accessor for WorkoutConfigurationView();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100011610);
  }
  return result;
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t type metadata accessor for ImportError()
{
  return type metadata accessor for ImportError();
}

uint64_t static WorkoutConfiguration.importFromData(_:with:validator:)()
{
  return static WorkoutConfiguration.importFromData(_:with:validator:)();
}

uint64_t type metadata accessor for WorkoutConfiguration()
{
  return type metadata accessor for WorkoutConfiguration();
}

uint64_t static WorkoutConfigurationValidator.shared.getter()
{
  return static WorkoutConfigurationValidator.shared.getter();
}

uint64_t type metadata accessor for WorkoutConfigurationValidator()
{
  return type metadata accessor for WorkoutConfigurationValidator();
}

uint64_t Occurrence.__allocating_init(count:)()
{
  return Occurrence.__allocating_init(count:)();
}

uint64_t type metadata accessor for Occurrence()
{
  return type metadata accessor for Occurrence();
}

uint64_t static WOLog.app.getter()
{
  return static WOLog.app.getter();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t _makeUIHostingController(_:)()
{
  return _makeUIHostingController(_:)();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
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

uint64_t WorkoutConfigurationView.init(workoutConfiguration:formattingManager:showAddButton:showStartWorkoutButton:overrideSaveWorkoutAction:startWorkoutAction:overrideDismissAction:referenceIntervalWorkoutConfiguration:)()
{
  return WorkoutConfigurationView.init(workoutConfiguration:formattingManager:showAddButton:showStartWorkoutButton:overrideSaveWorkoutAction:startWorkoutAction:overrideDismissAction:referenceIntervalWorkoutConfiguration:)();
}

uint64_t type metadata accessor for WorkoutConfigurationView()
{
  return type metadata accessor for WorkoutConfigurationView();
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

Swift::String __swiftcall String.workoutKitLocalized()()
{
  uint64_t v0 = String.workoutKitLocalized()();
  result._object = v1;
  result._countAndFlagsBits = v0;
  return result;
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

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t Optional.description.getter()
{
  return Optional.description.getter();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return [a1 setWindow:];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}