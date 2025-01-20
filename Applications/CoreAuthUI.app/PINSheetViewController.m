@interface PINSheetViewController
- (BOOL)isFullScreenController;
- (BOOL)shouldPresentWithAnimation;
- (_TtC10CoreAuthUI22PINSheetViewController)initWithCoder:(id)a3;
- (_TtC10CoreAuthUI22PINSheetViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7;
- (_TtC10CoreAuthUI22PINSheetViewController)initWithInternalInfo:(id)a3 parent:(id)a4;
- (_TtC10CoreAuthUI22PINSheetViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (void)dismissChildWithCompletionHandler:(id)a3;
- (void)viewModel:(id)a3 didReceiveCustomPassword:(id)a4 handler:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PINSheetViewController

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(TransitionViewController *)&v7 viewWillAppear:v3];
  id v5 = sub_100043474(v4);
  v6 = *(void **)&v4[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager];
  *(void *)&v4[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = v5;
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
    id v5 = v4;
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
  sub_100043D7C((uint64_t)v7, v6);
  sub_10002A998((uint64_t)v7);
}

- (_TtC10CoreAuthUI22PINSheetViewController)initWithInternalInfo:(id)a3 mechanism:(id)a4 backoffCounter:(id)a5 remoteUIHost:(id)a6 allowsLandscape:(BOOL)a7
{
  BOOL v18 = a7;
  ObjectType = (objc_class *)swift_getObjectType();
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context;
  id v13 = objc_allocWithZone((Class)LAContext);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v14 = self;
  *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[v12] = [v13 init];
  *(void *)&v14->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = 0;

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v19.receiver = v14;
  v19.super_class = ObjectType;
  v16 = [(TransitionViewController *)&v19 initWithInternalInfo:isa mechanism:a4 backoffCounter:a5 remoteUIHost:a6 allowsLandscape:v18];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v16;
}

- (_TtC10CoreAuthUI22PINSheetViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC10CoreAuthUI22PINSheetViewController *)sub_1000444D4(v5, v7, a4);
}

- (_TtC10CoreAuthUI22PINSheetViewController)initWithCoder:(id)a3
{
  return (_TtC10CoreAuthUI22PINSheetViewController *)sub_100044620(a3);
}

- (_TtC10CoreAuthUI22PINSheetViewController)initWithInternalInfo:(id)a3 parent:(id)a4
{
  if (!a3)
  {
    uint64_t v5 = 0;
    if (a4) {
      goto LABEL_3;
    }
LABEL_5:
    memset(v7, 0, sizeof(v7));
    return (_TtC10CoreAuthUI22PINSheetViewController *)sub_100044880(v5, (uint64_t)v7);
  }
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  if (!a4) {
    goto LABEL_5;
  }
LABEL_3:
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC10CoreAuthUI22PINSheetViewController *)sub_100044880(v5, (uint64_t)v7);
}

- (void).cxx_destruct
{
  BOOL v3 = *(void **)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager];
}

- (void)viewModel:(id)a3 didReceiveCustomPassword:(id)a4 handler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  _Block_copy(v7);
  id v11 = a3;
  uint64_t v12 = self;
  sub_1000451F0(v8, v10, (char *)v12, (void (**)(void, void))v7);
  _Block_release(v7);
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

@end