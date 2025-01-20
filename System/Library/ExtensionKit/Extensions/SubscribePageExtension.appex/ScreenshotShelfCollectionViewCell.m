@interface ScreenshotShelfCollectionViewCell
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC22SubscribePageExtension33ScreenshotShelfCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension33ScreenshotShelfCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation ScreenshotShelfCollectionViewCell

- (_TtC22SubscribePageExtension33ScreenshotShelfCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension33ScreenshotShelfCollectionViewCell *)sub_100330D94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension33ScreenshotShelfCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100333508();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100331150();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_10033170C();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = sub_1003337F8();

  return v7;
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
  v13 = (void *)sub_1003319C0(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_1003338C8(v13);
  double v17 = v16;
  double v19 = v18;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  double v20 = v17;
  double v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_100333B24(v14);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  type metadata accessor for ScreenshotCollectionViewCell();
  id v13 = *(void **)(*(void *)(swift_dynamicCastClassUnconditional()
                             + OBJC_IVAR____TtC22SubscribePageExtension28ScreenshotCollectionViewCell_borderedScreenshotView)
                 + OBJC_IVAR____TtC22SubscribePageExtension22BorderedScreenshotView_artworkView);
  id v14 = a3;
  id v15 = a4;
  uint64_t v16 = self;
  id v17 = v13;
  v20.value.super.isa = 0;
  v20.is_nil = 0;
  sub_100758320(v20, v18);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  v12 = self;
  sub_100331F7C(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_100333DCC(v8, (SEL *)&selRef_setMinimumLineSpacing_);
  double v11 = v10;

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_100333DCC(v8, (SEL *)&selRef_setMinimumInteritemSpacing_);
  double v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  sub_10002D20C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension33ScreenshotShelfCollectionViewCell_itemLayoutContext);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ScreenshotShelfCollectionViewCell_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ScreenshotShelfCollectionViewCell_flowLayout));
  swift_release();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ScreenshotShelfCollectionViewCell_topAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33ScreenshotShelfCollectionViewCell_bottomAccessoryView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC22SubscribePageExtension33ScreenshotShelfCollectionViewCell_didSelectHandler);

  sub_10001A4D0(v3);
}

@end