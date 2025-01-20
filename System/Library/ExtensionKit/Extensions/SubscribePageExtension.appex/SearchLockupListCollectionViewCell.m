@interface SearchLockupListCollectionViewCell
- (_TtC22SubscribePageExtension34SearchLockupListCollectionViewCell)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension34SearchLockupListCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SearchLockupListCollectionViewCell

- (_TtC22SubscribePageExtension34SearchLockupListCollectionViewCell)initWithFrame:(CGRect)a3
{
  sub_100432758(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC22SubscribePageExtension34SearchLockupListCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100434E5C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004335D0();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchLockupListCollectionViewCell();
  v2 = (char *)v3.receiver;
  [(SearchLockupListCollectionViewCell *)&v3 prepareForReuse];
  if (*(void *)&v2[OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_impressionsCoordinator])
  {
    swift_retain();
    sub_100762EF0();

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_100756440();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  id v11 = a3;
  v12 = self;
  sub_1004355A8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
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
  v15 = self;
  sub_100435C14();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_lockupDataSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_iconHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_titleHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_lockupCollectionView));
  swift_weakDestroy();
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_impressionsUpdateBlock));
  swift_release();
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension34SearchLockupListCollectionViewCell_compoundScrollObserver);
}

@end