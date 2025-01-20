@interface SearchLockupListCollectionViewCell
- (_TtC18ASMessagesProvider34SearchLockupListCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider34SearchLockupListCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation SearchLockupListCollectionViewCell

- (_TtC18ASMessagesProvider34SearchLockupListCollectionViewCell)initWithFrame:(CGRect)a3
{
  sub_168CD4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC18ASMessagesProvider34SearchLockupListCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_16B3D0();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_169C34();
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchLockupListCollectionViewCell();
  v2 = (char *)v3.receiver;
  [(SearchLockupListCollectionViewCell *)&v3 prepareForReuse];
  if (*(void *)&v2[OBJC_IVAR____TtC18ASMessagesProvider34SearchLockupListCollectionViewCell_impressionsCoordinator])
  {
    swift_retain();
    sub_778FC0();

    swift_release();
  }
  else
  {
    __break(1u);
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_76C1E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v10 = a3;
  v11 = self;
  sub_16BD10();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_76C1E0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  id v12 = a3;
  id v13 = a4;
  v14 = self;
  sub_16C37C();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider34SearchLockupListCollectionViewCell_lockupDataSource));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider34SearchLockupListCollectionViewCell_iconHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider34SearchLockupListCollectionViewCell_titleHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18ASMessagesProvider34SearchLockupListCollectionViewCell_lockupCollectionView));
  swift_weakDestroy();
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider34SearchLockupListCollectionViewCell_impressionsUpdateBlock));
  swift_release();
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18ASMessagesProvider34SearchLockupListCollectionViewCell_compoundScrollObserver);
}

@end