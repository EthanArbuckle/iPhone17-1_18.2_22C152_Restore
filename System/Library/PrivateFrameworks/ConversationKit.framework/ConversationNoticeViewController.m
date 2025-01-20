@interface ConversationNoticeViewController
- (BOOL)_canShowWhileLocked;
- (_TtC15ConversationKit32ConversationNoticeViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit32ConversationNoticeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleSystemApertureTapGesture;
- (void)handleTapGesture;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ConversationNoticeViewController

- (_TtC15ConversationKit32ConversationNoticeViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  ConversationNoticeViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  ConversationNoticeViewController.viewDidLoad()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = a3;
  v5 = self;
  v8.value.super.isa = (Class)a3;
  ConversationNoticeViewController.traitCollectionDidChange(_:)(v8);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = self;
  ConversationNoticeViewController.viewWillTransition(to:with:)(a4);

  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)handleTapGesture
{
  v2 = self;
  ConversationNoticeViewController.handleTapGesture()();
}

- (void)handleSystemApertureTapGesture
{
  v2 = self;
  ConversationNoticeViewController.handleSystemApertureTapGesture()();
}

- (_TtC15ConversationKit32ConversationNoticeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  ConversationNoticeViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)self + OBJC_IVAR____TtC15ConversationKit32ConversationNoticeViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationNoticeViewController_controlsManager));
  outlined destroy of ZStack<ModifiedContent<ConversationStatusView, _PaddingLayout>?>((uint64_t)self + OBJC_IVAR____TtC15ConversationKit32ConversationNoticeViewController_recipe, (uint64_t *)&demangling cache variable for type metadata for ConversationControlsRecipe?);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit32ConversationNoticeViewController_noticeView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit32ConversationNoticeViewController____lazy_storage___systemApertureLeadingAccessoryTapGesture);
}

@end