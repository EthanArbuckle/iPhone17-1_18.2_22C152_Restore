@interface TodayBrickShelfCollectionViewCell
- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5;
- (_TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell)initWithFrame:(CGRect)a3;
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

- (_TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell *)sub_533A38(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_537ED0();
}

- (void)scrollViewDidScroll:(id)a3
{
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_533E10();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(TodayBrickShelfCollectionViewCell *)&v13 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell_collectionView];
  id v4 = objc_msgSend(v2, "contentView", v13.receiver, v13.super_class);
  sub_2C368();
  sub_772580();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, "setFrame:", v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_5333DC();
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  if (!*(Class *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell_pageTraits))
    return 0;
  double v6 = (unint64_t *)((char *)self
                          + OBJC_IVAR____TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell_todayCards);
  swift_beginAccess();
  unint64_t v7 = *v6;
  if (!(v7 >> 62)) {
    return *(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8));
  }
  id v10 = a3;
  double v11 = self;
  swift_bridgeObjectRetain();
  int64_t v8 = sub_77EB40();

  swift_bridgeObjectRelease();
  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  double v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v10 = a3;
  double v11 = self;
  id v12 = sub_53411C(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_76C1E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  double v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = self;
  sub_538058(v12);
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
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  uint64_t v10 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                       + OBJC_IVAR____TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell_didSelectHandler);
  if (v10)
  {
    id v11 = a3;
    id v12 = self;
    sub_13318((uint64_t)v10);
    uint64_t v13 = sub_76C160();
    v10(v13);
    sub_13308((uint64_t)v10);
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumLineSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_538784(v8, (SEL *)&selRef_setMinimumLineSpacing_);
  double v11 = v10;

  return v11;
}

- (double)collectionView:(id)a3 layout:(id)a4 minimumInteritemSpacingForSectionAtIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_538784(v8, (SEL *)&selRef_setMinimumInteritemSpacing_);
  double v11 = v10;

  return v11;
}

- (void).cxx_destruct
{
  sub_14C88((uint64_t)self + OBJC_IVAR____TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell_itemLayoutContext, (uint64_t *)&unk_95C250);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell_collectionView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell_flowLayout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell_compoundScrollObserver));
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell_didSelectHandler));
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider33TodayBrickShelfCollectionViewCell_impressionsUpdateBlock));
  swift_weakDestroy();
  swift_release();

  swift_unknownObjectRelease();
}

@end