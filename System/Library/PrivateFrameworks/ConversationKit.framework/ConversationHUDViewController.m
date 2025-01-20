@interface ConversationHUDViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (_TtC15ConversationKit29ConversationHUDViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit29ConversationHUDViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)appLaunchButtonTapped:(id)a3;
- (void)showCallDetailsButtonTapped;
- (void)statusViewTapped;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ConversationHUDViewController

- (_TtC15ConversationKit29ConversationHUDViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationHUDViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  ConversationHUDViewController.viewDidLoad()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  ConversationHUDViewController.traitCollectionDidChange(_:)(v9);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  ConversationHUDViewController.viewWillTransition(to:with:)(a4);
  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)statusViewTapped
{
  v2 = self;
  ConversationHUDViewController.statusViewTapped()();
}

- (void)showCallDetailsButtonTapped
{
  v2 = self;
  ConversationHUDViewController.showCallDetailsButtonTapped()();
}

- (void)appLaunchButtonTapped:(id)a3
{
  id v4 = a3;
  id v5 = self;
  ConversationHUDViewController.appLaunchButtonTapped(_:)((UITapGestureRecognizer *)v5);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  Swift::Bool v9 = ConversationHUDViewController.gestureRecognizer(_:shouldReceive:)((UIGestureRecognizer *)v8, (UITouch)v7);

  return v9;
}

- (_TtC15ConversationKit29ConversationHUDViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  ConversationHUDViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_controlsManager));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_shadowProperties));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController____lazy_storage___backgroundMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_controlsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_menuContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_appLaunchPillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_detailsHeightLayoutConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_detailsWidthLayoutConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_topConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_bottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_shareCardViewController));
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_delegate);
  outlined destroy of SystemUpdateNotice?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit29ConversationHUDViewController_recipe, (uint64_t *)&demangling cache variable for type metadata for ConversationControlsRecipe?);
}

@end