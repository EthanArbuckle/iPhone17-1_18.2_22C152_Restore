@interface AchievementDetailViewController
- (_TtC12GameCenterUI31AchievementDetailViewController)init;
- (_TtC12GameCenterUI31AchievementDetailViewController)initWithCoder:(id)a3;
- (id)contentScrollViewForEdge:(unint64_t)a3;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)didTapDone;
- (void)lockupViewDidFinishRequest:(id)a3;
- (void)shareButtonPressed;
- (void)showAppStoreProductPage:(id)a3;
- (void)updateThePreferredSheetDetents;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AchievementDetailViewController

- (_TtC12GameCenterUI31AchievementDetailViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF764164();
}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  v4 = self;
  id v5 = sub_1AF764230(a3);

  return v5;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF7642C8();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AF764A18(a3, (SEL *)&selRef_viewDidAppear_, (uint64_t (*)(id))sub_1AF765DBC);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1AF764960(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_1AF764A18(a3, (SEL *)&selRef_viewIsAppearing_, (uint64_t (*)(id))sub_1AF764AE0);
}

- (void)updateThePreferredSheetDetents
{
  v2 = self;
  sub_1AF764AE0();
}

- (void)shareButtonPressed
{
  v2 = self;
  sub_1AF764EEC();
}

- (void)didTapDone
{
  v2 = self;
  sub_1AF765248();
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  id v3 = sub_1AF765FF4();

  return v3;
}

- (void)lockupViewDidFinishRequest:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF766044(v4);
}

- (void)showAppStoreProductPage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF7662E4();
}

- (_TtC12GameCenterUI31AchievementDetailViewController)init
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31AchievementDetailViewController_selectedAchievement));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31AchievementDetailViewController_hostingController));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI31AchievementDetailViewController_achievement);
}

@end