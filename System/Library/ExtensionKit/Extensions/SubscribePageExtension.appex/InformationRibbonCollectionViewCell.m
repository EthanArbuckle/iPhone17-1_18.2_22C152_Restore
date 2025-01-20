@interface InformationRibbonCollectionViewCell
- (_TtC22SubscribePageExtension35InformationRibbonCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension35InformationRibbonCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InformationRibbonCollectionViewCell

- (_TtC22SubscribePageExtension35InformationRibbonCollectionViewCell)initWithFrame:(CGRect)a3
{
  sub_1002730F4();
  return result;
}

- (_TtC22SubscribePageExtension35InformationRibbonCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002734E8();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100270958();
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  v5 = (char *)v7.receiver;
  [(InformationRibbonCollectionViewCell *)&v7 traitCollectionDidChange:v4];
  v6 = &v5[OBJC_IVAR____TtC22SubscribePageExtension35InformationRibbonCollectionViewCell_currentMinimumBadgeSizeCacheToken];
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
  int64_t v7 = sub_100273E88();

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  v12 = self;
  NSString v13 = sub_1007675C0();
  Class isa = sub_100756340().super.isa;
  id v15 = [v11 dequeueReusableCellWithReuseIdentifier:v13 forIndexPath:isa];

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v15;
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension35InformationRibbonCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35InformationRibbonCollectionViewCell_badgeCollectionView));
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35InformationRibbonCollectionViewCell_topSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension35InformationRibbonCollectionViewCell_bottomSeparator));
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end