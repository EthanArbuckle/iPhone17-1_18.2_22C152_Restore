@interface CallControlsViewController
- (_TtC15ConversationKit26CallControlsViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit26CallControlsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CallControlsViewController

- (_TtC15ConversationKit26CallControlsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  CallControlsViewController.init(coder:)();
}

- (void)loadView
{
  v2 = self;
  CallControlsViewController.loadView()();
}

- (void)viewDidLoad
{
  v2 = self;
  CallControlsViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  CallControlsViewController.viewWillAppear(_:)(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  CallControlsViewController.viewDidLayoutSubviews()();
}

- (_TtC15ConversationKit26CallControlsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  CallControlsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController_captionsStateController);
  swift_unknownObjectWeakDestroy();
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController_rosterViewProvider);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController_controlsManager));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController_service);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController____lazy_storage___statusView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController____lazy_storage___menuViewController));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController____lazy_storage___sidebarTrailingVisible));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController____lazy_storage___sidebarTrailingHidden));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit26CallControlsViewController____lazy_storage___sidebarViewController);
}

@end