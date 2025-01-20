@interface GalleryViewController
- (BOOL)prefersStatusBarHidden;
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC22SubscribePageExtension21GalleryViewController)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension21GalleryViewController)initWithCollectionViewLayout:(id)a3;
- (_TtC22SubscribePageExtension21GalleryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)as_viewDidBecomePartiallyVisible;
- (void)as_viewWillBecomeFullyVisible;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dealloc;
- (void)dismissFrom:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)swipeStateChangedOn:(id)a3;
- (void)tapStateChangedOn:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GalleryViewController

- (_TtC22SubscribePageExtension21GalleryViewController)initWithCoder:(id)a3
{
  result = (_TtC22SubscribePageExtension21GalleryViewController *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  id v3 = [(GalleryViewController *)v2 navigationController];
  if (v3)
  {
    v4 = v3;
    id v5 = [v3 barHideOnTapGestureRecognizer];

    [v5 removeTarget:v2 action:0];
  }
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for GalleryViewController();
  [(GalleryViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)as_viewWillBecomeFullyVisible
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)as_viewDidBecomePartiallyVisible
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1007325C8();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_1007328F4((uint64_t)a3);
}

- (BOOL)prefersStatusBarHidden
{
  v2 = self;
  id v3 = [(GalleryViewController *)v2 navigationController];
  if (v3)
  {
    v4 = v3;
    unsigned __int8 v5 = [v3 isNavigationBarHidden];

    LOBYTE(v3) = v5;
  }
  else
  {
    __break(1u);
  }
  return (char)v3;
}

- (void)tapStateChangedOn:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_100732A90(v4);
}

- (void)dismissFrom:(id)a3
{
}

- (void)swipeStateChangedOn:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  if ([v4 state] == (id)3) {
    [(GalleryViewController *)v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension21GalleryViewController_artwork);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = sub_100768A60();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  v12 = self;
  v13 = (void *)sub_1007330AC(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  [a3 frame];
  double v12 = v11;
  double v14 = v13;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  double v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  type metadata accessor for ArtworkCollectionViewCell();
  double v13 = *(void **)(swift_dynamicCastClassUnconditional()
                 + OBJC_IVAR____TtC22SubscribePageExtension25ArtworkCollectionViewCell_artworkView);
  sub_100758360();
  sub_100060F5C();
  id v14 = a3;
  id v15 = a4;
  double v16 = self;
  id v17 = v13;
  sub_1007591B0();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = self;
  sub_100732D64();
}

- (_TtC22SubscribePageExtension21GalleryViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  CGSize result = (_TtC22SubscribePageExtension21GalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension21GalleryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  CGSize result = (_TtC22SubscribePageExtension21GalleryViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end