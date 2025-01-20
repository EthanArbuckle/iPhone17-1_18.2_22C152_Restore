@interface JetDashboardViewController
- (PSRootController)_rootController;
- (PSSpecifier)_specifier;
- (_TtC12GameCenterUI18BaseSplitPresenter)dataPresenter;
- (_TtC12GameCenterUI26JetDashboardViewController)initWithCoder:(id)a3;
- (void)didSelectPlayerAvatarView:(id)a3;
- (void)donePressed:(id)a3;
- (void)loadMoreWithContinuationToken:(id)a3;
- (void)setDataPresenter:(id)a3;
- (void)set_rootController:(id)a3;
- (void)set_specifier:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation JetDashboardViewController

- (_TtC12GameCenterUI26JetDashboardViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  JetDashboardViewController.init(coder:)();
}

- (_TtC12GameCenterUI18BaseSplitPresenter)dataPresenter
{
  id v2 = sub_1AF434554();

  return (_TtC12GameCenterUI18BaseSplitPresenter *)v2;
}

- (void)setDataPresenter:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1AF4345C0();
}

- (void)viewDidLoad
{
  id v2 = self;
  JetDashboardViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4 = self;
  JetDashboardViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  JetDashboardViewController.viewWillDisappear(_:)(a3);
}

- (void)willMoveToParentViewController:(id)a3
{
  id v5 = a3;
  v6 = self;
  JetDashboardViewController.willMove(toParent:)((UIViewController_optional *)a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  JetDashboardViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  JetDashboardViewController.viewDidLayoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  JetDashboardViewController.traitCollectionDidChange(_:)(v9);
}

- (void)viewDidDisappear:(BOOL)a3
{
  id v4 = self;
  JetDashboardViewController.viewDidDisappear(_:)(a3);
}

- (PSRootController)_rootController
{
  id v2 = sub_1AF438AE0();

  return (PSRootController *)v2;
}

- (void)set_rootController:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF438B6C((uint64_t)a3);
}

- (PSSpecifier)_specifier
{
  id v2 = sub_1AF438BAC();

  return (PSSpecifier *)v2;
}

- (void)set_specifier:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF438C38((uint64_t)a3);
}

- (void)didSelectPlayerAvatarView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  JetDashboardViewController.didSelectPlayerAvatarView(_:)((GKDashboardPlayerPhotoView_optional *)v5);
}

- (void)donePressed:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1AF7AEB60();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1AF438F40();

  sub_1AF395058((uint64_t)v6, (uint64_t *)&unk_1E9AC4590);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController_dashboardPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController_request));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController_clippingLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController_badgeablePhotoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController_navigationBarBadgeablePhotoView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController__rootController));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI26JetDashboardViewController__specifier);
}

- (void)loadMoreWithContinuationToken:(id)a3
{
  sub_1AF7AE0E0();
  id v4 = self;
  sub_1AF439188();

  swift_bridgeObjectRelease();
}

@end