@interface LockupCollectionSearchResultContentView
- (_TtC20ProductPageExtension39LockupCollectionSearchResultContentView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension39LockupCollectionSearchResultContentView)initWithFrame:(CGRect)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5;
- (void)layoutSubviews;
@end

@implementation LockupCollectionSearchResultContentView

- (_TtC20ProductPageExtension39LockupCollectionSearchResultContentView)initWithFrame:(CGRect)a3
{
  sub_1001E059C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtC20ProductPageExtension39LockupCollectionSearchResultContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001E4988();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001E14A0();
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10076A5F0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  id v10 = a3;
  v11 = self;
  sub_1001E519C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  uint64_t v8 = sub_10076A5F0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10076A530();
  uint64_t v12 = (void (**)(uint64_t))((char *)self
                                      + OBJC_IVAR____TtC20ProductPageExtension39LockupCollectionSearchResultContentView_impressionsUpdateBlock);
  swift_beginAccess();
  v13 = *v12;
  if (*v12)
  {
    id v14 = a3;
    id v15 = a4;
    v16 = self;
    uint64_t v17 = sub_1000194C0((uint64_t)v13);
    v13(v17);
    sub_1000194B0((uint64_t)v13);
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LockupCollectionSearchResultContentView_lockupDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LockupCollectionSearchResultContentView_iconHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LockupCollectionSearchResultContentView_titleHeadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension39LockupCollectionSearchResultContentView_lockupCollectionView));
  swift_weakDestroy();
  sub_1000194B0(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC20ProductPageExtension39LockupCollectionSearchResultContentView_impressionsUpdateBlock));
  swift_release();
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension39LockupCollectionSearchResultContentView_compoundScrollObserver);
}

@end