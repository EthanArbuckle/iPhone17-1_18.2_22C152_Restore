@interface AppStoreContentViewController
- (BOOL)isDeeplinked;
- (UIScrollView)scrollView;
- (_TtC12GameCenterUI18BootstrapPresenter)bootstrapPresenter;
- (_TtC12GameCenterUI29AppStoreContentViewController)init;
- (_TtC12GameCenterUI29AppStoreContentViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI29AppStoreContentViewController)initWithGameRecord:(id)a3;
- (int64_t)preferredLargeTitleDisplayMode;
- (void)dealloc;
- (void)setBootstrapPresenter:(id)a3;
- (void)setIsDeeplinked:(BOOL)a3;
- (void)setPreferredLargeTitleDisplayMode:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AppStoreContentViewController

- (_TtC12GameCenterUI29AppStoreContentViewController)initWithGameRecord:(id)a3
{
  id v3 = a3;
  AppStoreContentViewController.init(gameRecord:)();
  return result;
}

- (_TtC12GameCenterUI29AppStoreContentViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF52D4CC();
}

- (void)dealloc
{
  v2 = self;
  AppStoreContentViewController.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29AppStoreContentViewController_bootstrapPresenter));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI29AppStoreContentViewController_appStoreContentView));

  swift_bridgeObjectRelease();
}

- (int64_t)preferredLargeTitleDisplayMode
{
  return sub_1AF52D76C();
}

- (void)setPreferredLargeTitleDisplayMode:(int64_t)a3
{
}

- (_TtC12GameCenterUI18BootstrapPresenter)bootstrapPresenter
{
  v2 = sub_1AF52D7E8();

  return (_TtC12GameCenterUI18BootstrapPresenter *)v2;
}

- (void)setBootstrapPresenter:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF52D874((uint64_t)a3);
}

- (UIScrollView)scrollView
{
  v2 = sub_1AF52D8BC();

  return (UIScrollView *)v2;
}

- (BOOL)isDeeplinked
{
  return sub_1AF52DA7C() & 1;
}

- (void)setIsDeeplinked:(BOOL)a3
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF52DADC();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AF52DDF8(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_1AF52DEEC(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AF52E06C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF52E170((uint64_t)a3);
}

- (_TtC12GameCenterUI29AppStoreContentViewController)init
{
}

@end