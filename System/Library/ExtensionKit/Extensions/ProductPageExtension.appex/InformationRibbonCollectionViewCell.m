@interface InformationRibbonCollectionViewCell
- (_TtC20ProductPageExtension35InformationRibbonCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension35InformationRibbonCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InformationRibbonCollectionViewCell

- (_TtC20ProductPageExtension35InformationRibbonCollectionViewCell)initWithFrame:(CGRect)a3
{
  sub_100341058();
  return result;
}

- (_TtC20ProductPageExtension35InformationRibbonCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10034144C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10033E88C();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  v5 = (char *)v7.receiver;
  [(InformationRibbonCollectionViewCell *)&v7 traitCollectionDidChange:v4];
  v6 = &v5[OBJC_IVAR____TtC20ProductPageExtension35InformationRibbonCollectionViewCell_currentMinimumBadgeSizeCacheToken];
  *(void *)v6 = 0;
  v6[8] = 1;
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v5 = a3;
  v6 = self;
  int64_t v7 = sub_100341DEC();

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  v11 = self;
  NSString v12 = sub_10077BC80();
  Class isa = sub_10076A4F0().super.isa;
  id v14 = [v10 dequeueReusableCellWithReuseIdentifier:v12 forIndexPath:isa];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v14;
}

- (void).cxx_destruct
{
  sub_10000FA80((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension35InformationRibbonCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_1009559B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35InformationRibbonCollectionViewCell_badgeCollectionView));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35InformationRibbonCollectionViewCell_topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension35InformationRibbonCollectionViewCell_bottomSeparator));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end