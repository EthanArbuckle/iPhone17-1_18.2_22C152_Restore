@interface CollectionLockupArtwork
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC22SubscribePageExtension23CollectionLockupArtwork)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension23CollectionLockupArtwork)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CollectionLockupArtwork

- (_TtC22SubscribePageExtension23CollectionLockupArtwork)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension23CollectionLockupArtwork *)sub_10005F280(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension23CollectionLockupArtwork)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100060FB4();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CollectionLockupArtwork();
  id v2 = v5.receiver;
  [(CollectionLockupArtwork *)&v5 layoutSubviews];
  sub_10005F774(v4);
  sub_10000FE94(v4, v4[3]);
  sub_10075C580();
  id v3 = [v2 traitCollection];
  sub_100765900();

  _s22SubscribePageExtension38ProductRatingsCompactProductPageLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  id v4 = [(CollectionLockupArtwork *)v3 traitCollection];
  sub_10005F774(v11);
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

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23CollectionLockupArtwork_icon1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23CollectionLockupArtwork_icon2));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension23CollectionLockupArtwork_icon3));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension23CollectionLockupArtwork_icon4);
}

@end