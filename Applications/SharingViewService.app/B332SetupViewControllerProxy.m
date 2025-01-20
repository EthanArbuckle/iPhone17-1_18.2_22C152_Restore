@interface B332SetupViewControllerProxy
- (_TtC18SharingViewService28B332SetupViewControllerProxy)initWithCoder:(id)a3;
- (_TtC18SharingViewService28B332SetupViewControllerProxy)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)pnpDeviceTypeForType:(unint64_t)a3;
- (unint64_t)desiredHomeButtonEvents;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didCompleteOneRevolutionOfSpinningPencil;
- (void)didTapCancelPairing;
- (void)didTapToPairPencil;
- (void)dismiss:(int)a3;
- (void)dismissUIAnimated:(BOOL)a3;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)releaseHUDTransaction;
- (void)setDeviceType:(unint64_t)a3;
- (void)setShouldShowWhatsNew:(BOOL)a3;
- (void)showAlertIfNeeded;
- (void)showPairConsentPrompt;
- (void)showPairingFailure;
- (void)showPairingStarted;
- (void)showPairingSuccess;
- (void)showSubsequentPairSuccess;
- (void)updateDeviceInfoWithDeviceType:(unint64_t)a3 batteryLevel:(double)a4 batteryLevelKnown:(BOOL)a5 edge:(unint64_t)a6 orientation:(int64_t)a7 isCharging:(BOOL)a8 identifier:(id)a9;
- (void)viewControllerDidDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation B332SetupViewControllerProxy

- (void)viewDidLoad
{
  v2 = self;
  sub_1000B9808();
}

- (void)viewDidAppear:(BOOL)a3
{
}

- (unint64_t)desiredHomeButtonEvents
{
  return 16;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v7 = (void (*)(void))sub_10006A128;
  }
  else
  {
    v7 = 0;
  }
  v9 = self;
  if (a3)
  {
    Class isa = (Class)[a3 userInfo];
    if (isa)
    {
      static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    Class isa = 0;
  }
  [(SVSBaseMainController *)v9 setUserInfo:isa];

  if (v6)
  {
    v7();
    sub_100017C38((uint64_t)v7);
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned __int8 v4 = self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B332SetupViewControllerProxy_dismissed];
  v5 = self;
  v6 = v5;
  if ((v4 & 1) == 0) {
    [(B332SetupViewControllerProxy *)v5 dismiss:21];
  }
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for B332SetupViewControllerProxy();
  [(SVSBaseMainController *)&v7 viewDidDisappear:v3];
}

- (void)dismiss:(int)a3
{
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = sub_10006A128;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  sub_1000B9DE4(a3, (uint64_t)v6, v7);
  sub_100017C38((uint64_t)v6);
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_100017EF4(0, (unint64_t *)&qword_1001C9600);
    sub_100069EE8();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_1000BA1F0(v4);

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
  v2 = self;
  sub_1000BA57C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  BOOL v3 = *(void **)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B332SetupViewControllerProxy_setupVC];
}

- (_TtC18SharingViewService28B332SetupViewControllerProxy)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18SharingViewService28B332SetupViewControllerProxy *)sub_1000BA7D8(v5, v7, a4);
}

- (_TtC18SharingViewService28B332SetupViewControllerProxy)initWithCoder:(id)a3
{
  return (_TtC18SharingViewService28B332SetupViewControllerProxy *)sub_1000BA98C(a3);
}

- (void)releaseHUDTransaction
{
  v2 = self;
  exit(0);
}

- (void)updateDeviceInfoWithDeviceType:(unint64_t)a3 batteryLevel:(double)a4 batteryLevelKnown:(BOOL)a5 edge:(unint64_t)a6 orientation:(int64_t)a7 isCharging:(BOOL)a8 identifier:(id)a9
{
  uint64_t v15 = sub_100009A0C((uint64_t *)&unk_1001C9450);
  __chkstk_darwin(v15 - 8);
  v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a9)
  {
    static UUID._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v18 = type metadata accessor for UUID();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v17, 0, 1, v18);
  }
  else
  {
    uint64_t v19 = type metadata accessor for UUID();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v17, 1, 1, v19);
  }
  v20 = self;
  sub_1000BC834(a6, a7, a8, (uint64_t)v17, a4);

  sub_1000BCCBC((uint64_t)v17);
}

- (void)setShouldShowWhatsNew:(BOOL)a3
{
  self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B332SetupViewControllerProxy_shouldShowWhatsNew] = a3;
}

- (void)setDeviceType:(unint64_t)a3
{
  *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B332SetupViewControllerProxy_deviceType] = a3;
}

- (void)dismissUIAnimated:(BOOL)a3
{
  uint64_t v3 = qword_1001C7108;
  id v8 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100012C4C(v4, (uint64_t)qword_1001CB4B0);
  uint64_t v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "dismissUI", v7, 2u);
    swift_slowDealloc();
  }

  [(B332SetupViewControllerProxy *)v8 dismiss:0];
}

- (void)didTapToPairPencil
{
  v2 = self;
  sub_1000BAD8C();
}

- (void)didTapCancelPairing
{
  uint64_t v2 = qword_1001C7108;
  uint64_t v7 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for Logger();
  sub_100012C4C(v3, (uint64_t)qword_1001CB4B0);
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "didTapCancelPairing", v6, 2u);
    swift_slowDealloc();
  }

  [(B332SetupViewControllerProxy *)v7 showPairingFailure];
}

- (void)didCompleteOneRevolutionOfSpinningPencil
{
  self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC18SharingViewService28B332SetupViewControllerProxy_didCompleteOneRotation] = 1;
  [(B332SetupViewControllerProxy *)self showAlertIfNeeded];
}

- (void)showAlertIfNeeded
{
  uint64_t v2 = self;
  sub_1000BAFFC();
}

- (void)showPairingStarted
{
  uint64_t v2 = self;
  sub_1000BB308();
}

- (void)showPairingSuccess
{
  uint64_t v2 = self;
  sub_1000BB62C();
}

- (int64_t)pnpDeviceTypeForType:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    return 0;
  }
  else {
    return qword_10017EF70[a3 - 1];
  }
}

- (void)showSubsequentPairSuccess
{
  uint64_t v2 = self;
  sub_1000BB840("showSubsequentPairingSuccess", (const char **)&selRef_pairingSucceededSubsequently);
}

- (void)showPairingFailure
{
  uint64_t v2 = self;
  sub_1000BB840("showPairingFailure", (const char **)&selRef_pairingFailed);
}

- (void)showPairConsentPrompt
{
  uint64_t v2 = self;
  sub_1000BB9B4();
}

- (void)viewControllerDidDismiss:(id)a3
{
  id v9 = a3;
  uint64_t v4 = self;
  [(B332SetupViewControllerProxy *)v4 dismiss:0];
  if (qword_1001C7108 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for Logger();
  sub_100012C4C(v5, (uint64_t)qword_1001CB4B0);
  os_log_type_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "viewControllerDidDismiss", v8, 2u);
    swift_slowDealloc();
  }
}

@end