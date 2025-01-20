@interface ConversationControlsShareCardViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit43ConversationControlsShareCardViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit43ConversationControlsShareCardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)modalPresentationStyle;
- (void)didTapAskToScreenShareButton:(id)a3;
- (void)didTapCloseButton;
- (void)didTapCollaborateButton;
- (void)didTapEndSharePlay;
- (void)didTapScreenShareButton;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ConversationControlsShareCardViewController

- (_TtC15ConversationKit43ConversationControlsShareCardViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationControlsShareCardViewController.init(coder:)();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  v2 = self;
  ConversationControlsShareCardViewController.viewDidLoad()();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  ConversationControlsShareCardViewController.viewDidDisappear(_:)(a3);
}

- (int64_t)modalPresentationStyle
{
  v2 = self;
  id v3 = ConversationControlsShareCardViewController.modalPresentationStyle.getter();

  return (int64_t)v3;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  v4 = self;
  ConversationControlsShareCardViewController.modalPresentationStyle.setter(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  ConversationControlsShareCardViewController.viewDidLayoutSubviews()();
}

- (void)didTapScreenShareButton
{
  v2 = self;
  ConversationControlsShareCardViewController.didTapScreenShareButton()();
}

- (void)didTapAskToScreenShareButton:(id)a3
{
  id v5 = a3;
  v6 = self;
  ConversationControlsShareCardViewController.didTapAskToScreenShareButton(_:)(a3);
}

- (void)didTapCollaborateButton
{
  v2 = self;
  ConversationControlsShareCardViewController.didTapCollaborateButton()();
}

- (void)didTapCloseButton
{
  v2 = self;
  ConversationControlsShareCardViewController.didTapCloseButton()();
}

- (void)didTapEndSharePlay
{
  v2 = self;
  ConversationControlsShareCardViewController.didTapEndSharePlay()();
}

- (_TtC15ConversationKit43ConversationControlsShareCardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  ConversationControlsShareCardViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController_conversationControlsManager));
  outlined consume of (@escaping @callee_guaranteed (@unowned CGRect, @unowned Bool) -> ())?(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController_updateSheetDetent));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___backgroundMaterialView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___headerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___scrollViewContent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___controlsView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___sharePlayDiscoverabilityView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit43ConversationControlsShareCardViewController____lazy_storage___gelatoDiscoverabilityView);
}

@end