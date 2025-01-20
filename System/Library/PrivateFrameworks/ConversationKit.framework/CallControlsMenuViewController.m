@interface CallControlsMenuViewController
- (_TtC15ConversationKit30CallControlsMenuViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit30CallControlsMenuViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation CallControlsMenuViewController

- (_TtC15ConversationKit30CallControlsMenuViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  CallControlsMenuViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  CallControlsMenuViewController.viewDidLoad()();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  CallControlsMenuViewController.viewDidAppear(_:)(a3);
}

- (_TtC15ConversationKit30CallControlsMenuViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  CallControlsMenuViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController_sizeUpdater);
  outlined consume of ConversationControlsRecipe.View?(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController_topConstraints), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController_topConstraints));
  outlined consume of ConversationControlsRecipe.View?(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController_bottomConstraints), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController_bottomConstraints));
  outlined destroy of Conversation?((uint64_t)self+ OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController____lazy_storage___screenShareService, &demangling cache variable for type metadata for ScreenShareCallControlsService?);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController____lazy_storage___menuBlurView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController____lazy_storage___menuShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController_menuBlurTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController____lazy_storage___menuView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController_controlsManager));
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController_service);
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit30CallControlsMenuViewController_rosterViewProvider;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

@end