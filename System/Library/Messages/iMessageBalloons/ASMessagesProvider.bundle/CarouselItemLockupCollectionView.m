@interface CarouselItemLockupCollectionView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC18ASMessagesProvider32CarouselItemLockupCollectionView)initWithCoder:(id)a3;
- (_TtC18ASMessagesProvider32CarouselItemLockupCollectionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CarouselItemLockupCollectionView

- (_TtC18ASMessagesProvider32CarouselItemLockupCollectionView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider32CarouselItemLockupCollectionView_artworkViews) = (Class)_swiftEmptyArrayStorage;
  v5 = (char *)self
     + OBJC_IVAR____TtC18ASMessagesProvider32CarouselItemLockupCollectionView____lazy_storage___artworkViewPool;
  uint64_t v6 = sub_FD50(&qword_962888);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18ASMessagesProvider32CarouselItemLockupCollectionView_numberOfArtworks) = 0;
  id v7 = a3;

  result = (_TtC18ASMessagesProvider32CarouselItemLockupCollectionView *)sub_77EB20();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(CarouselItemLockupCollectionView *)&v5 layoutSubviews];
  sub_3D5888(v4);
  sub_FB9C(v4, v4[3]);
  sub_772580();
  id v3 = [v2 traitCollection];
  sub_77B970();

  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  id v4 = [(CarouselItemLockupCollectionView *)v3 traitCollection];
  sub_3D5888(v11);
  sub_FB9C(v11, v11[3]);
  sub_77B980();
  double v6 = v5;
  double v8 = v7;
  _s18ASMessagesProvider13VideoCardViewC7MetricsVwxx_0((uint64_t)v11);

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC18ASMessagesProvider32CarouselItemLockupCollectionView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC18ASMessagesProvider32CarouselItemLockupCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self
     + OBJC_IVAR____TtC18ASMessagesProvider32CarouselItemLockupCollectionView____lazy_storage___artworkViewPool;

  sub_3D65A8((uint64_t)v3);
}

@end