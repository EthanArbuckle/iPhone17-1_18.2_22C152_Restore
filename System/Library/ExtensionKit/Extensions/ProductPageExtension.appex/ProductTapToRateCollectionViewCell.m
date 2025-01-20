@interface ProductTapToRateCollectionViewCell
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC20ProductPageExtension34ProductTapToRateCollectionViewCell)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension34ProductTapToRateCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductTapToRateCollectionViewCell

- (_TtC20ProductPageExtension34ProductTapToRateCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension34ProductTapToRateCollectionViewCell *)sub_10036466C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension34ProductTapToRateCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC20ProductPageExtension34ProductTapToRateCollectionViewCell_productTapToRateView;
  type metadata accessor for ProductTapToRateView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 init];

  result = (_TtC20ProductPageExtension34ProductTapToRateCollectionViewCell *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100364920();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_100364B7C();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension34ProductTapToRateCollectionViewCell_separatorView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension34ProductTapToRateCollectionViewCell_productTapToRateView);
}

@end