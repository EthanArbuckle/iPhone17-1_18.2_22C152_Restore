@interface ProductMediaCollectionViewCell
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC20ProductPageExtension30ProductMediaCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension30ProductMediaCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation ProductMediaCollectionViewCell

- (_TtC20ProductPageExtension30ProductMediaCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension30ProductMediaCollectionViewCell *)sub_10059050C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension30ProductMediaCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100593BD0();
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10059098C();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = sub_100594108();

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  v11 = self;
  v12 = (void *)sub_10059174C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_10076A5F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_1005941AC(v12);
  double v16 = v15;
  double v18 = v17;

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  double v19 = v16;
  double v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  v11 = self;
  sub_100591CDC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_100595120(v8, (SEL *)&selRef_setMinimumLineSpacing_);
  double v11 = v10;

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_100595120(v8, (SEL *)&selRef_setMinimumInteritemSpacing_);
  double v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ProductMediaCollectionViewCell_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ProductMediaCollectionViewCell_flowLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ProductMediaCollectionViewCell_compoundScrollObserver));
  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension30ProductMediaCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ProductMediaCollectionViewCell_topAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ProductMediaCollectionViewCell_bottomAccessoryView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ProductMediaCollectionViewCell_topAccessoryDividerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension30ProductMediaCollectionViewCell_bottomAccessoryDividerView));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC20ProductPageExtension30ProductMediaCollectionViewCell_screenshotSelectionHandler);

  sub_1000194B0(v3);
}

@end