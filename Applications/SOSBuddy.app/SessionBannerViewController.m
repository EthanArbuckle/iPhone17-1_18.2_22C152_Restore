@interface SessionBannerViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BNPresentableContext)presentableContext;
- (BOOL)_canShowWhileLocked;
- (BOOL)preventsInteractiveDismissal;
- (NSString)elementIdentifier;
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (_TtC8SOSBuddy27SessionBannerViewController)initWithCoder:(id)a3;
- (_TtC8SOSBuddy27SessionBannerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)preferredHeightForBottomSafeArea;
- (int64_t)activeLayoutMode;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (unint64_t)statusBarStyleOverridesToSuppress;
- (void)didTap;
- (void)loadView;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillAppearAsBanner:(id)a3;
- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setPreferredLayoutMode:(int64_t)a3;
- (void)setPresentableContext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SessionBannerViewController

- (BNPresentableContext)presentableContext
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (BNPresentableContext *)Strong;
}

- (void)setPresentableContext:(id)a3
{
}

- (_TtC8SOSBuddy27SessionBannerViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10026557C();
}

- (void)loadView
{
  v2 = self;
  sub_1002612F0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100261778();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100261AF0(a3, "[%{public}s] viewWillAppear", (SEL *)&selRef_viewWillAppear_);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100261AF0(a3, "[%{public}s] viewDidAppear", (SEL *)&selRef_viewDidAppear_);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100261AF0(a3, "[%{public}s] viewDidDisappear", (SEL *)&selRef_viewDidDisappear_);
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
  sub_100261DBC();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_10026231C(a4, width, height);
  swift_unknownObjectRelease();
}

- (_TtC8SOSBuddy27SessionBannerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8SOSBuddy27SessionBannerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10002D3E4((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__contentProducer);
  sub_10002D3E4((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__delegate);
  sub_100265CAC(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__content), *(void **)&self->_requesterId[OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__content], *(void **)&self->_requesterId[OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__content + 8], *(void **)&self->_requestId[OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__content]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController_tapGesture));
  sub_10002D3E4((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController_presentableContext);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (int64_t)activeLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__activeLayoutMode);
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  id v4 = self;
  sub_10026325C(a3);
}

- (int64_t)preferredLayoutMode
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8SOSBuddy27SessionBannerViewController__preferredLayoutMode);
}

- (void)setPreferredLayoutMode:(int64_t)a3
{
  id v4 = self;
  sub_100263BC8(a3);
}

- (int64_t)maximumLayoutMode
{
  return 4;
}

- (int64_t)contentRole
{
  return 2;
}

- (double)preferredHeightForBottomSafeArea
{
  v2 = self;
  sub_100263E34();
  double v4 = v3;

  return v4;
}

- (NSString)elementIdentifier
{
  return (NSString *)SBUISystemApertureElementIdentifierStewie;
}

- (BOOL)preventsInteractiveDismissal
{
  return 1;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  v2 = self;
  double v3 = sub_100263F90();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  v2 = self;
  double v3 = sub_100264044();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  v2 = self;
  double v3 = sub_100264100();

  return (SBUISystemApertureAccessoryView *)v3;
}

- (unint64_t)presentationBehaviors
{
  return 33;
}

- (unint64_t)statusBarStyleOverridesToSuppress
{
  return 0x20000000;
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
}

- (void)presentableDidAppearAsBanner:(id)a3
{
}

- (void)presentableWillDisappearAsBanner:(id)a3 withReason:(id)a4
{
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
}

@end