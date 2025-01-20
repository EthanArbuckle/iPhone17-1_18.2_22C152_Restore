@interface PasscodeSheetViewController
- (BOOL)isFullScreenController;
- (BOOL)shouldPresentWithAnimation;
- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithCoder:(id)a3;
- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7;
- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithInternalInfo:(id)a3 parent:(id)a4;
- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)dismissChildWithCompletionHandler:(id)a3;
- (void)loadView;
- (void)viewModelDidRejectDevicePasscode:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PasscodeSheetViewController

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)loadView
{
  v2 = self;
  sub_1000286EC();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(TransitionViewController *)&v7 viewWillAppear:v3];
  sub_100028870(v4);
  v5 = *(void **)&v4[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager];
  *(void *)&v4[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = v6;
}

- (BOOL)isFullScreenController
{
  return sub_1000608FC();
}

- (BOOL)shouldPresentWithAnimation
{
  return 0;
}

- (void)dismissChildWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    objc_super v7 = sub_10002A9E0;
  }
  else
  {
    objc_super v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_100029848((uint64_t)v7, v6);
  sub_10002A998((uint64_t)v7);
}

- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7
{
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (_TtC10CoreAuthUI27PasscodeSheetViewController *)sub_100029D54(v11, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7);
}

- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10CoreAuthUI27PasscodeSheetViewController *)sub_100029FA0(v5, v7, a4);
}

- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithCoder:(id)a3
{
  return (_TtC10CoreAuthUI27PasscodeSheetViewController *)sub_10002A13C(a3);
}

- (_TtC10CoreAuthUI27PasscodeSheetViewController)initWithInternalInfo:(id)a3 parent:(id)a4
{
  if (!a3)
  {
    uint64_t v5 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    memset(v7, 0, sizeof(v7));
    return (_TtC10CoreAuthUI27PasscodeSheetViewController *)sub_10002A43C(v5, (uint64_t)v7);
  }
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC10CoreAuthUI27PasscodeSheetViewController *)sub_10002A43C(v5, (uint64_t)v7);
}

- (void).cxx_destruct
{
  BOOL v3 = *(void **)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager];
}

- (void)viewModelDidRejectDevicePasscode:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  uint64_t v6 = [(TransitionViewController *)v5 mechanism];
  if (v6)
  {
    uint64_t v7 = v6;
    sub_1000295F8((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [(LAUIMechanism *)v7 uiEvent:9 options:isa];

    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

@end