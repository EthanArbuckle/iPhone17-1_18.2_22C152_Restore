@interface TapToRadarBannerViewController
- (BOOL)_canShowWhileLocked;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (UIEdgeInsets)bannerContentOutsets;
- (UIViewController)viewController;
- (_TtC15ConversationKit30TapToRadarBannerViewController)init;
- (_TtC15ConversationKit30TapToRadarBannerViewController)initWithCoder:(id)a3;
- (_TtC15ConversationKit30TapToRadarBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleTap:(id)a3;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)viewDidLoad;
@end

@implementation TapToRadarBannerViewController

- (_TtC15ConversationKit30TapToRadarBannerViewController)init
{
  TapToRadarBannerViewController.init()();
  return result;
}

- (_TtC15ConversationKit30TapToRadarBannerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  TapToRadarBannerViewController.init(coder:)();
}

- (void)viewDidLoad
{
  v2 = self;
  TapToRadarBannerViewController.viewDidLoad()();
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  v5 = self;
  TapToRadarBannerViewController.handleTap(_:)((UITapGestureRecognizer_optional *)v5);
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  TapToRadarBannerViewController.presentableWillAppear(asBanner:)();
  swift_unknownObjectRelease();
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  TapToRadarBannerViewController.presentableWillDisappear(asBanner:withReason:)();
  swift_unknownObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15ConversationKit30TapToRadarBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = a4;
  TapToRadarBannerViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController_pillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController_pillLeadingImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController_pillTrailingImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController_pillViewSubtitle));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController_pillViewTitle));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15ConversationKit30TapToRadarBannerViewController____lazy_storage___bannerSource);
}

- (NSString)requestIdentifier
{
  uint64_t v2 = TapToRadarBannerViewController.requestIdentifier.getter();
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
  uint64_t v2 = TapToRadarBannerViewController.viewController.getter();
  return (UIViewController *)v2;
}

- (NSString)requesterIdentifier
{
  uint64_t v2 = self;
  uint64_t v3 = TapToRadarBannerViewController.requesterIdentifier.getter();
  uint64_t v5 = v4;

  if (v5)
  {
    id v6 = (void *)MEMORY[0x1C87730B0](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v6 = 0;
  }
  return (NSString *)v6;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v6 = self;
  CGSize v9 = TapToRadarBannerViewController.preferredContentSize(withPresentationSize:containerSize:)((CGSize)__PAIR128__(*(unint64_t *)&height, *(unint64_t *)&width), (CGSize)__PAIR128__(v8, v7));

  double v10 = v9.width;
  double v11 = v9.height;
  result.CGFloat height = v11;
  result.CGFloat width = v10;
  return result;
}

- (UIEdgeInsets)bannerContentOutsets
{
  uint64_t v2 = self;
  TapToRadarBannerViewController.bannerContentOutsets.getter();
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