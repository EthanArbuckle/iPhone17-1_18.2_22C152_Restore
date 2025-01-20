@interface LockupCollectionSearchResultContentView
- (_TtC22SubscribePageExtension39LockupCollectionSearchResultContentView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension39LockupCollectionSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
@end

@implementation LockupCollectionSearchResultContentView

- (_TtC22SubscribePageExtension39LockupCollectionSearchResultContentView)initWithFrame:(CGRect)a3
{
  sub_10022DC20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC22SubscribePageExtension39LockupCollectionSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100232004();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10022EB24();
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
  sub_1002327D8();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_100756440();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  uint64_t v13 = (void (**)(uint64_t))((char *)self
                                      + OBJC_IVAR____TtC22SubscribePageExtension39LockupCollectionSearchResultContentView_impressionsUpdateBlock);
  swift_beginAccess();
  v14 = *v13;
  if (*v13)
  {
    id v15 = a3;
    id v16 = a4;
    v17 = self;
    uint64_t v18 = sub_10001A4E0((uint64_t)v14);
    v14(v18);
    sub_10001A4D0((uint64_t)v14);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39LockupCollectionSearchResultContentView_lockupDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39LockupCollectionSearchResultContentView_iconHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39LockupCollectionSearchResultContentView_titleHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension39LockupCollectionSearchResultContentView_lockupCollectionView));
  swift_weakDestroy();
  sub_10001A4D0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC22SubscribePageExtension39LockupCollectionSearchResultContentView_impressionsUpdateBlock));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension39LockupCollectionSearchResultContentView_compoundScrollObserver);
}

@end