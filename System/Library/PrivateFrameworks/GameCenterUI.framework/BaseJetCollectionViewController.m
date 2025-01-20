@interface BaseJetCollectionViewController
- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4;
- (NSDirectionalEdgeInsets)collectionViewFrameInsets;
- (UICollectionViewCompositionalLayout)compositionalLayout;
- (_TtC12GameCenterUI13BasePresenter)dataPresenter;
- (_TtC12GameCenterUI18BootstrapPresenter)bootstrapPresenter;
- (_TtC12GameCenterUI31BaseJetCollectionViewController)initWithCoder:(id)a3;
- (_TtC12GameCenterUI31BaseJetCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)dismissHandler;
- (id)makeLayout;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplaySupplementaryView:(id)a4 forElementKind:(id)a5 atIndexPath:(id)a6;
- (void)didReceiveMemoryWarning;
- (void)scrollViewDidScroll:(id)a3;
- (void)setBootstrapPresenter:(id)a3;
- (void)setCompositionalLayout:(id)a3;
- (void)setDismissHandler:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BaseJetCollectionViewController

- (id)dismissHandler
{
  uint64_t v2 = sub_1AF5406C0();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 1107296256;
    v6[2] = sub_1AF3F8B2C;
    v6[3] = &block_descriptor_57;
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
  sub_1AF540714((uint64_t)v4, v5);
}

- (_TtC12GameCenterUI31BaseJetCollectionViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  BaseJetCollectionViewController.init(coder:)();
}

- (_TtC12GameCenterUI18BootstrapPresenter)bootstrapPresenter
{
  uint64_t v2 = sub_1AF5407CC();

  return (_TtC12GameCenterUI18BootstrapPresenter *)v2;
}

- (void)setBootstrapPresenter:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF5407FC((uint64_t)a3);
}

- (_TtC12GameCenterUI13BasePresenter)dataPresenter
{
  uint64_t v2 = self;
  id v3 = (void *)sub_1AF541D18();

  return (_TtC12GameCenterUI13BasePresenter *)v3;
}

- (UICollectionViewCompositionalLayout)compositionalLayout
{
  uint64_t v2 = sub_1AF540820();

  return (UICollectionViewCompositionalLayout *)v2;
}

- (void)setCompositionalLayout:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AF540850((uint64_t)a3);
}

- (NSDirectionalEdgeInsets)collectionViewFrameInsets
{
  double v2 = sub_1AF542360();
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  double v4 = self;
  sub_1AF54238C(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  double v4 = self;
  sub_1AF54249C(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  double v4 = self;
  sub_1AF5425EC(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  double v4 = self;
  sub_1AF542760(a3);
}

- (void)viewDidLoad
{
  double v2 = self;
  sub_1AF5428C8();
}

- (void)didReceiveMemoryWarning
{
  double v2 = self;
  sub_1AF5429FC();
}

- (id)makeLayout
{
  double v2 = self;
  sub_1AF540878();
  double v4 = v3;

  return v4;
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
  sub_1AF543724();
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
  sub_1AF543AB8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
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
  sub_1AF544060();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_1AF544540(v4);
}

- (_TtC12GameCenterUI31BaseJetCollectionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1AF7AE0E0();
  }
  id v5 = a4;
  BaseJetCollectionViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  sub_1AF368930(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC12GameCenterUI31BaseJetCollectionViewController_dismissHandler));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31BaseJetCollectionViewController_bootstrapPresenter));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI31BaseJetCollectionViewController_compositionalLayout));
  swift_release();
  swift_release();
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC12GameCenterUI31BaseJetCollectionViewController_diffableDataSource);
}

@end