@interface BaseCollectionViewController
- (UICollectionView)collectionView;
- (_TtC12GameCenterUI28BaseCollectionViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI28BaseCollectionViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC12GameCenterUI28BaseCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)presentingViewControllerForLockupView:(id)a3;
- (void)loadView;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCollectionView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BaseCollectionViewController

- (_TtC12GameCenterUI28BaseCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1AF7AE0E0();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC12GameCenterUI28BaseCollectionViewController *)BaseCollectionViewController.init(nibName:bundle:)((uint64_t)a4, v6, a4);
}

- (_TtC12GameCenterUI28BaseCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AF3E824C();
}

- (UICollectionView)collectionView
{
  v2 = self;
  id v3 = sub_1AF3E8398();

  return (UICollectionView *)v3;
}

- (void)setCollectionView:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_1AF3E843C(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AF3E98B4((SEL *)&selRef_viewDidLoad);
}

- (void)loadView
{
  v2 = self;
  sub_1AF3E8BB4();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1AF3E8EDC(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_1AF3E915C(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1AF3E920C();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1AF3E9410(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF3E9720();
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1AF3E7E0C();
}

- (_TtC12GameCenterUI28BaseCollectionViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  BaseCollectionViewController.init(collectionViewLayout:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI28BaseCollectionViewController_overlayView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI28BaseCollectionViewController_scrollObserver));

  swift_release();
}

- (id)presentingViewControllerForLockupView:(id)a3
{
  id v3 = BaseCollectionViewController.presentingViewController(for:)();

  return v3;
}

@end