@interface CarouselItemLockupCollectionView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension32CarouselItemLockupCollectionView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension32CarouselItemLockupCollectionView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CarouselItemLockupCollectionView

- (_TtC22SubscribePageExtension32CarouselItemLockupCollectionView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension32CarouselItemLockupCollectionView_artworkViews) = (Class)_swiftEmptyArrayStorage;
  v5 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension32CarouselItemLockupCollectionView____lazy_storage___artworkViewPool;
  uint64_t v6 = sub_10000FB44(&qword_10093B900);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension32CarouselItemLockupCollectionView_numberOfArtworks) = 0;
  id v7 = a3;

  result = (_TtC22SubscribePageExtension32CarouselItemLockupCollectionView *)sub_100768A40();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v2 = v5.receiver;
  [(CarouselItemLockupCollectionView *)&v5 layoutSubviews];
  sub_100390714(v4);
  sub_10000FE94(v4, v4[3]);
  sub_10075C580();
  id v3 = [v2 traitCollection];
  sub_100765900();

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  id v4 = [(CarouselItemLockupCollectionView *)v3 traitCollection];
  sub_100390714(v11);
  sub_10000FE94(v11, v11[3]);
  sub_100765910();
  double v6 = v5;
  double v8 = v7;
  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v11);

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (_TtC22SubscribePageExtension32CarouselItemLockupCollectionView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC22SubscribePageExtension32CarouselItemLockupCollectionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self
     + OBJC_IVAR____TtC22SubscribePageExtension32CarouselItemLockupCollectionView____lazy_storage___artworkViewPool;

  sub_100390F9C((uint64_t)v3);
}

@end