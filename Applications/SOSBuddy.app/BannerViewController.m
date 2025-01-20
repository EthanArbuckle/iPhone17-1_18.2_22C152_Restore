@interface BannerViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BNPresentableContext)presentableContext;
- (BOOL)_canShowWhileLocked;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (_TtC8SOSBuddy20BannerViewController)initWithCoder:(id)a3;
- (_TtC8SOSBuddy20BannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTap;
- (void)loadView;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)setPresentableContext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BannerViewController

- (BNPresentableContext)presentableContext
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BNPresentableContext *)Strong;
}

- (void)setPresentableContext:(id)a3
{
}

- (_TtC8SOSBuddy20BannerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002452E4();
}

- (void)loadView
{
  v2 = self;
  sub_100243C74();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100244034();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1002443AC(a3, "[%{public}s] viewWillAppear", (SEL *)&selRef_viewWillAppear_);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1002443AC(a3, "[%{public}s] viewDidAppear", (SEL *)&selRef_viewDidAppear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1002443AC(a3, "[%{public}s] viewDidDisappear", (SEL *)&selRef_viewDidDisappear_);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  v2 = self;
  sub_1002447CC();

  return 1;
}

- (void)didTap
{
  v2 = self;
  sub_10024499C();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_100244BE8(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC8SOSBuddy20BannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8SOSBuddy20BannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10002D3E4((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_contentProducer);
  sub_10002D3E4((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_delegate);

  sub_10002D3E4((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy20BannerViewController_presentableContext);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (NSString)requesterIdentifier
{
  return (NSString *)sub_100244FE0();
}

- (NSString)requestIdentifier
{
  return (NSString *)sub_100244FE0();
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_100245400();
  swift_unknownObjectRelease();
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_unknownObjectRetain();
    id v4 = self;
    sub_100201814(v4);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1002454E4(a4);
  swift_unknownObjectRelease();
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    if (a4)
    {
      swift_unknownObjectRetain();
      id v6 = a4;
      v7 = self;
      sub_100200F9C(v7, v6);
      swift_unknownObjectRelease();

      swift_unknownObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_unknownObjectRetain();
    id v6 = a4;
    v7 = self;
    sub_1002028CC(v7, v6);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
  }
}

@end