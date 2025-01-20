@interface ConversationHUDDetailsNavigationController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOnScreen;
- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithCoder:(id)a3;
- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithRootViewController:(id)a3;
- (void)setIsOnScreen:(BOOL)a3;
- (void)tapDoneButton;
- (void)viewDidLoad;
@end

@implementation ConversationHUDDetailsNavigationController

- (BOOL)isOnScreen
{
  v2 = self;
  unsigned __int8 v3 = ConversationHUDDetailsNavigationController.isOnScreen.getter();

  return v3 & 1;
}

- (void)setIsOnScreen:(BOOL)a3
{
  v4 = self;
  ConversationHUDDetailsNavigationController.isOnScreen.setter(a3);
}

- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationHUDDetailsNavigationController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  ConversationHUDDetailsNavigationController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)tapDoneButton
{
  v2 = self;
  ConversationHUDDetailsNavigationController.tapDoneButton()();
}

- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
}

- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithRootViewController:(id)a3
{
  id v3 = a3;
  ConversationHUDDetailsNavigationController.init(rootViewController:)();
}

- (_TtC15ConversationKit42ConversationHUDDetailsNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  ConversationHUDDetailsNavigationController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit42ConversationHUDDetailsNavigationController_detailsDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit42ConversationHUDDetailsNavigationController_controlsManager));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit42ConversationHUDDetailsNavigationController_detailsViewController);
}

@end