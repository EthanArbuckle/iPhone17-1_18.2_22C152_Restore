@interface DashboardSidebarViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (BOOL)selectionFollowsFocus;
- (UICollectionViewCompositionalLayout)compositionalLayout;
- (_TtC12GameCenterUI13BasePresenter)dataPresenter;
- (_TtC12GameCenterUI18BootstrapPresenter)bootstrapPresenter;
- (_TtC12GameCenterUI25DashboardSidebarPresenter)sidebarPresenter;
- (_TtC12GameCenterUI30DashboardSidebarViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI30DashboardSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)dismissHandler;
- (id)makeLayout;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)setBootstrapPresenter:(id)a3;
- (void)setCompositionalLayout:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)setSelectionFollowsFocus:(BOOL)a3;
- (void)updateBackgroundFor:(int64_t)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation DashboardSidebarViewController

- (_TtC12GameCenterUI30DashboardSidebarViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  DashboardSidebarViewController.init(coder:)();
}

- (id)dismissHandler
{
  uint64_t v2 = DashboardSidebarViewController.dismissHandler.getter();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1AF3F8B2C;
    v6[3] = &block_descriptor_41;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDismissHandler:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1AF388384;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  DashboardSidebarViewController.dismissHandler.setter((uint64_t)v4, v5);
}

- (BOOL)selectionFollowsFocus
{
  return sub_1AF3A6534() & 1;
}

- (void)setSelectionFollowsFocus:(BOOL)a3
{
  v4 = self;
  sub_1AF3A6598(a3);
}

- (_TtC12GameCenterUI18BootstrapPresenter)bootstrapPresenter
{
  uint64_t v2 = sub_1AF3A672C();

  return (_TtC12GameCenterUI18BootstrapPresenter *)v2;
}

- (void)setBootstrapPresenter:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF3A67B8((uint64_t)a3);
}

- (_TtC12GameCenterUI25DashboardSidebarPresenter)sidebarPresenter
{
  id v2 = sub_1AF3A67F8();

  return (_TtC12GameCenterUI25DashboardSidebarPresenter *)v2;
}

- (_TtC12GameCenterUI13BasePresenter)dataPresenter
{
  id v2 = self;
  uint64_t v3 = (void *)sub_1AF3A684C();

  return (_TtC12GameCenterUI13BasePresenter *)v3;
}

- (UICollectionViewCompositionalLayout)compositionalLayout
{
  id v2 = sub_1AF3A68C4();

  return (UICollectionViewCompositionalLayout *)v2;
}

- (void)setCompositionalLayout:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF3A6950((uint64_t)a3);
}

- (void)viewDidLoad
{
  id v2 = self;
  DashboardSidebarViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  DashboardSidebarViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  DashboardSidebarViewController.viewWillDisappear(_:)(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  DashboardSidebarViewController.viewDidAppear(_:)(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  DashboardSidebarViewController.viewDidDisappear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  id v2 = self;
  DashboardSidebarViewController.viewWillLayoutSubviews()();
}

- (void)updateBackgroundFor:(int64_t)a3
{
  v4 = self;
  sub_1AF3A8AE8(a3);
}

- (id)makeLayout
{
  id v2 = self;
  sub_1AF3A9894();
  v4 = v3;

  return v4;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AF7A9A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v10 = a3;
  v11 = self;
  DashboardSidebarViewController.collectionView(_:shouldHighlightItemAt:)();
  LOBYTE(self) = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return self & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_1AF7A9A60();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7A99E0();
  id v10 = a3;
  v11 = self;
  DashboardSidebarViewController.collectionView(_:didSelectItemAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6
{
  uint64_t v9 = sub_1AF7A9A60();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  uint64_t v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AF7AE0E0();
  sub_1AF7A99E0();
  id v13 = a3;
  id v14 = a4;
  v15 = self;
  DashboardSidebarViewController.collectionView(_:willDisplaySupplementaryView:forElementKind:at:)();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (_TtC12GameCenterUI30DashboardSidebarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  DashboardSidebarViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_dismissHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_bootstrapPresenter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_sidebarPresenter));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_compositionalLayout));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_verticalSeparatorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController____lazy_storage___sidebarProfileView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI30DashboardSidebarViewController_focusGuide);
}

@end