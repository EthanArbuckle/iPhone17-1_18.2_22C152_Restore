@interface AppPromotionFormattedDateView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (UIColor)backgroundColor;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AppPromotionFormattedDateView

- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension29AppPromotionFormattedDateView *)sub_1004B4010(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1004B9EAC();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_1004B2274();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(AppPromotionFormattedDateView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionFormattedDateView_textLabel));
  sub_10000F76C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionFormattedDateView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionFormattedDateView_liveIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionFormattedDateView_blurredBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionFormattedDateView_vibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionFormattedDateView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionFormattedDateView_liveIndicatorAnimationCoordinator));

  swift_release();
}

- (UIColor)backgroundColor
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionFormattedDateView_backgroundView);
  if (v2) {
    id v2 = [v2 backgroundColor];
  }

  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionFormattedDateView_backgroundView);
  if (v3) {
    [v3 setBackgroundColor:a3];
  }
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_1004B6164();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_1004B9BA0((uint64_t)a4);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  swift_unknownObjectRelease();

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.var3 = v17;
  result.var2 = v16;
  result.var1 = v15;
  result.var0 = v14;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(AppPromotionFormattedDateView *)&v3 _dynamicUserInterfaceTraitDidChange];
  sub_1004B5444();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1004B7548(a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension29AppPromotionFormattedDateView_textLabel));
}

@end