@interface GamePolicyBannerViewController
- (BOOL)providesHostedContent;
- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (UIEdgeInsets)bannerContentOutsets;
- (_TtC13GameOverlayUI30GamePolicyBannerViewController)initWithCoder:(id)a3;
- (_TtC13GameOverlayUI30GamePolicyBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)presentableBehavior;
- (void)loadView;
- (void)open:(id)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)showControlCenter:(id)a3;
- (void)toggleGameMode:(id)a3;
- (void)viewDidLoad;
@end

@implementation GamePolicyBannerViewController

- (void)loadView
{
  v2 = self;
  [(GamePolicyBannerViewController *)v2 setOverrideUserInterfaceStyle:2];
  id v3 = [objc_allocWithZone((Class)UIView) init];
  [(GamePolicyBannerViewController *)v2 setView:v3];

  id v4 = [(GamePolicyBannerViewController *)v2 view];
  if (v4)
  {
    id v5 = v4;
    [v4 setUserInteractionEnabled:1];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10007BF04();
}

- (void)open:(id)a3
{
}

- (void)toggleGameMode:(id)a3
{
}

- (void)showControlCenter:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_10007D13C((uint64_t)v6);

  sub_10007EEF4((uint64_t)v6);
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (NSString)requesterIdentifier
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

- (NSString)requestIdentifier
{
  swift_bridgeObjectRetain();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (UIEdgeInsets)bannerContentOutsets
{
  NSString v2 = self;
  [(GamePolicyBannerViewController *)v2 loadViewIfNeeded];
  v7 = *(Class *)((char *)&v2->super.super.super.isa
                + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_pillView);
  if (v7)
  {
    [v7 shadowOutsets];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    double v3 = v9;
    double v4 = v11;
    double v5 = v13;
    double v6 = v15;
  }
  else
  {
    __break(1u);
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (CGSize)preferredContentSizeWithPresentationSize:(CGSize)a3 containerSize:(CGSize)a4
{
  double v4 = self;
  [(GamePolicyBannerViewController *)v4 loadViewIfNeeded];
  v7 = *(Class *)((char *)&v4->super.super.super.isa
                + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_pillView);
  if (v7)
  {
    [v7 intrinsicContentSize];
    double v9 = v8;
    double v11 = v10;

    double v5 = v9;
    double v6 = v11;
  }
  else
  {
    __break(1u);
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (BOOL)providesHostedContent
{
  return 1;
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  swift_unknownObjectRetain();
  double v4 = self;
  *(Class *)((char *)&v4->super.super.super.isa
           + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_transaction) = (Class)os_transaction_create();
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  swift_unknownObjectRetain();
  double v4 = self;
  BOOL IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  double v6 = 3.0;
  if (IsVoiceOverRunning) {
    double v6 = 9.0;
  }
  sub_10007B938(v6);

  swift_unknownObjectRelease();
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_10007EE64();
  swift_unknownObjectRelease();
}

- (_TtC13GameOverlayUI30GamePolicyBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC13GameOverlayUI30GamePolicyBannerViewController *)sub_10007E4A0(v5, v7, a4);
}

- (_TtC13GameOverlayUI30GamePolicyBannerViewController)initWithCoder:(id)a3
{
  return (_TtC13GameOverlayUI30GamePolicyBannerViewController *)sub_10007E720(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100039104(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_tapHandler));
  sub_100039104(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_dismissHandler));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_bannerSource));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_pillView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_buttonView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_stateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_gestureRecognizer));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13GameOverlayUI30GamePolicyBannerViewController_timer);
}

@end