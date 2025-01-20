@interface MutedTalkerBannerViewController
- (BOOL)_canShowWhileLocked;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (CNKMutedTalkerBannerViewControllerDelegate)delegate;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (UIEdgeInsets)bannerContentOutsets;
- (UIViewController)viewController;
- (_TtC15ConversationKit31MutedTalkerBannerViewController)init;
- (_TtC15ConversationKit31MutedTalkerBannerViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit31MutedTalkerBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)presentableBehavior;
- (void)dismissBanner;
- (void)handleTap:(id)a3;
- (void)playBannerSound;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)setDelegate:(id)a3;
- (void)showBanner;
- (void)updatePillViewWithIsMuted:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation MutedTalkerBannerViewController

- (CNKMutedTalkerBannerViewControllerDelegate)delegate
{
  v2 = (void *)MutedTalkerBannerViewController.delegate.getter();
  return (CNKMutedTalkerBannerViewControllerDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  MutedTalkerBannerViewController.delegate.setter();
}

- (_TtC15ConversationKit31MutedTalkerBannerViewController)init
{
  return (_TtC15ConversationKit31MutedTalkerBannerViewController *)MutedTalkerBannerViewController.init()();
}

- (_TtC15ConversationKit31MutedTalkerBannerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  MutedTalkerBannerViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  MutedTalkerBannerViewController.viewDidLoad()();
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  MutedTalkerBannerViewController.handleTap(_:)((UITapGestureRecognizer_optional *)v5);
}

- (void)updatePillViewWithIsMuted:(BOOL)a3
{
  id v4 = self;
  MutedTalkerBannerViewController.updatePillView(isMuted:)(a3);
}

- (void)playBannerSound
{
  v2 = self;
  MutedTalkerBannerViewController.playBannerSound()();
}

- (void)showBanner
{
  v2 = self;
  MutedTalkerBannerViewController.showBanner()();
}

- (void)dismissBanner
{
  v2 = self;
  MutedTalkerBannerViewController.dismissBanner()();
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  MutedTalkerBannerViewController.presentableWillAppear(asBanner:)();
  swift_unknownObjectRelease();
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  MutedTalkerBannerViewController.presentableWillDisappear(asBanner:withReason:)();
  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit31MutedTalkerBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  MutedTalkerBannerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_pillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_pillImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_pillViewSubtitle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_pillViewTitle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_bannerSource));
  id v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit31MutedTalkerBannerViewController_delegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (NSString)requestIdentifier
{
  uint64_t v2 = MutedTalkerBannerViewController.requestIdentifier.getter();
  if (v3)
  {
    id v4 = (void *)MEMORY[0x1C87730B0](v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v4 = 0;
  }
  return (NSString *)v4;
}

- (UIViewController)viewController
{
  uint64_t v2 = MutedTalkerBannerViewController.viewController.getter();
  return (UIViewController *)v2;
}

- (NSString)requesterIdentifier
{
  MutedTalkerBannerViewController.requesterIdentifier.getter();
  uint64_t v2 = (void *)MEMORY[0x1C87730B0](0xD000000000000037);
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v6 = self;
  CGSize v9 = MutedTalkerBannerViewController.preferredContentSize(withPresentationSize:containerSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width), (CGSize)__PAIR128__(v8, v7));

  double v10 = v9.width;
  double v11 = v9.height;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (UIEdgeInsets)bannerContentOutsets
{
  uint64_t v2 = self;
  MutedTalkerBannerViewController.bannerContentOutsets.getter();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

@end