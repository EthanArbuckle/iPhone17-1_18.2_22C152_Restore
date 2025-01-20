@interface TodayBrickShelfCollectionViewCell
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell)initWithFrame:(CGRect)a3;
- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5;
- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation TodayBrickShelfCollectionViewCell

- (_TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell *)sub_1004FB204(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004FD04C();
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_1004FB5DC();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(TodayBrickShelfCollectionViewCell *)&v13 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell_collectionView];
  id v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  sub_10001A860(0, (unint64_t *)&qword_100932C80);
  sub_10075C580();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1004FB7E0();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell_pageTraits))
    return 0;
  double v6 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell_todayCards);
  swift_beginAccess();
  unint64_t v7 = *v6;
  if (!(v7 >> 62)) {
    return *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  id v10 = a3;
  double v11 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = sub_100768A60();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  id v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  double v12 = self;
  id v13 = sub_1004FB9B0(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

  return v13;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  double v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v13 = a3;
  id v14 = a4;
  uint64_t v15 = self;
  sub_1004FD1D4(v13);
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
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  uint64_t v11 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                       + OBJC_IVAR____TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell_didSelectHandler);
  if (v11)
  {
    id v12 = a3;
    id v13 = self;
    sub_10001A4E0((uint64_t)v11);
    uint64_t v14 = sub_1007563C0();
    v11(v14);
    sub_10001A4D0((uint64_t)v11);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_1004FD900(v8, (SEL *)&selRef_setMinimumLineSpacing_);
  double v11 = v10;

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_1004FD900(v8, (SEL *)&selRef_setMinimumInteritemSpacing_);
  double v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  sub_10000FED8((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_100934630);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell_flowLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell_compoundScrollObserver));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell_didSelectHandler));
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension33TodayBrickShelfCollectionViewCell_impressionsUpdateBlock));
  swift_weakDestroy();
  swift_release();

  swift_unknownObjectRelease();
}

@end