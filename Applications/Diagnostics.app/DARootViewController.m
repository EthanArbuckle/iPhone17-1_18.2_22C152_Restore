@interface DARootViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (DARootViewController)initWithCoder:(id)a3;
- (DARootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredStatusBarStyle;
- (uint64_t)_hostApplicationDidEnterBackground;
- (uint64_t)remoteViewControllerDidDisappear;
- (unint64_t)supportedInterfaceOrientations;
- (void)_hostApplicationWillEnterForeground;
- (void)_willAppearInRemoteViewController;
- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6;
- (void)displayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10;
- (void)enableVolumeHUD:(BOOL)a3;
- (void)remoteViewControllerDidSetRequiredSerialNumbers:(id)a3;
- (void)remoteViewControllerDidSetSelectableSerialNumbers:(id)a3;
- (void)remoteViewControllerDidSetSessionToken:(id)a3;
- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation DARootViewController

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  id v4 = v5.receiver;
  [(DARootViewController *)&v5 viewIsAppearing:v3];
  if (qword_10018A390) {
    sub_1000501D0();
  }
}

- (void)enableVolumeHUD:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_100050E84((id)v3);
}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = self;
  sub_100050FE8((id)v4, a3);
}

- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6
{
  v7 = _Block_copy(a6);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v7;
  v16 = self;
  sub_10005465C(v8, v10, v11, v13, v14, (uint64_t)sub_1000562A4, v15);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)displayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10
{
  uint64_t v12 = _Block_copy(a10);
  uint64_t v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v15 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = v16;
  if (a7)
  {
    uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a7 = v19;
    if (!a8) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t v18 = 0;
  if (a8) {
LABEL_3:
  }
    static String._unconditionallyBridgeFromObjectiveC(_:)();
LABEL_4:
  sub_10003AFD0(&qword_100183700);
  uint64_t v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = swift_allocObject();
  *(void *)(v21 + 16) = v12;
  v22 = self;
  sub_1000548BC(v13, a4, v14, v15, v17, v18, (uint64_t)a7, v20, (uint64_t)sub_100056110, v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return qword_100184E30;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  return 1;
}

- (DARootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (DARootViewController *)sub_100051A5C(v5, v7, a4);
}

- (DARootViewController)initWithCoder:(id)a3
{
  return (DARootViewController *)sub_100051BBC(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___DARootViewController____lazy_storage___enhancedLoggingCompletedNavigationController);
}

- (void)_willAppearInRemoteViewController
{
  v2 = self;
  sub_100051E3C();
}

- (void)_hostApplicationWillEnterForeground
{
  v2 = self;
  sub_10005230C();
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

+ (id)_remoteViewControllerInterface
{
  return sub_100052D94((uint64_t)a1, (uint64_t)a2, &protocolRef_DADiagnosticsRemoteViewControllerInterface);
}

+ (id)_exportedInterface
{
  return sub_100052D94((uint64_t)a1, (uint64_t)a2, &protocolRef_DADiagnosticsViewServiceInterface);
}

- (void)remoteViewControllerDidSetSessionToken:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_100055DC8(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)remoteViewControllerDidSetRequiredSerialNumbers:(id)a3
{
}

- (void)remoteViewControllerDidSetSelectableSerialNumbers:(id)a3
{
}

- (uint64_t)_hostApplicationDidEnterBackground
{
  sub_10003AFD0((uint64_t *)&unk_1001836E0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100123B50;
  if (qword_1001827C8 != -1) {
    swift_once();
  }
  v1 = (void *)qword_10018A3E8;
  *(void *)(v0 + 56) = sub_10003C374(0, (unint64_t *)&qword_1001832C0);
  *(void *)(v0 + 64) = sub_100055FF4((unint64_t *)&qword_100184FF0, (unint64_t *)&qword_1001832C0);
  *(void *)(v0 + 32) = v1;
  id v2 = v1;
  BOOL v3 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  id v4 = [self defaultCenter];
  if (qword_100182768 != -1) {
    swift_once();
  }
  [v4 postNotificationName:qword_10018A3A0 object:0];

  if (qword_100182828 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for ModalPresentationCoordinator(0);
  sub_10003C3B0(v5, (uint64_t)qword_10018A440);
  swift_beginAccess();
  sub_1000D815C(0, 0);
  return swift_endAccess();
}

- (uint64_t)remoteViewControllerDidDisappear
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  BOOL v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C374(0, (unint64_t *)&qword_100182E40);
  id v8 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_100052DE8;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000358AC;
  aBlock[3] = &unk_10014E748;
  uint64_t v9 = _Block_copy(aBlock);
  static DispatchQoS.unspecified.getter();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_10003AF78();
  sub_10003AFD0((uint64_t *)&unk_100182E50);
  sub_10003B014();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

@end