@interface ScreenshotsGalleryViewController
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)dismissFrom:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)swipeStateChangedOn:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ScreenshotsGalleryViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100629134(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100629370();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_10062985C((uint64_t)a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_100629990(a4, width, height);
  swift_unknownObjectRelease();
}

- (void)dismissFrom:(id)a3
{
}

- (void)swipeStateChangedOn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if ([v4 state] == (id)3) {
    [(ScreenshotsGalleryViewController *)v5 dismissViewControllerAnimated:1 completion:0];
  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension32ScreenshotsGalleryViewController_artworks);
  if (!(v4 >> 62)) {
    return *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v7 = a3;
  v8 = self;
  swift_bridgeObjectRetain();
  int64_t v9 = sub_10077D140();

  swift_bridgeObjectRelease();
  return v9;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_100629E64(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_10076A5F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_10062ADA4(v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  v11 = self;
  uint64_t v12 = sub_10076A570();
  uint64_t v13 = OBJC_IVAR____TtC20ProductPageExtension32ScreenshotsGalleryViewController_selectedIndex;
  if ((Class)v12 != *(Class *)((char *)&v11->super.super.super.super.super.isa
                              + OBJC_IVAR____TtC20ProductPageExtension32ScreenshotsGalleryViewController_selectedIndex))
  {
    Class isa = sub_10076A4F0().super.isa;
    [v10 scrollToItemAtIndexPath:isa atScrollPosition:16 animated:1];

    *(Class *)((char *)&v11->super.super.super.super.super.isa + v13) = (Class)sub_10076A570();
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (UIEdgeInsets)collectionView:(id)a3 layout:(id)a4 insetForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_10062B13C(v7, v8);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  double v21 = v17;
  result.right = v21;
  result.bottom = v20;
  result.left = v19;
  result.top = v18;
  return result;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_10076A5F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v12 = a3;
  id v13 = a4;
  double v14 = self;
  double v15 = sub_10062B400(v12);
  double v17 = v16;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v18 = v15;
  double v19 = v17;
  result.double height = v19;
  result.double width = v18;
  return result;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  return sub_10062A4B0(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef_setMinimumInteritemSpacing_);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  return sub_10062A4B0(self, (uint64_t)a2, a3, a4, a5, (SEL *)&selRef_setMinimumLineSpacing_);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10062A574(v4);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension32ScreenshotsGalleryViewController_galleryLayout);
}

@end