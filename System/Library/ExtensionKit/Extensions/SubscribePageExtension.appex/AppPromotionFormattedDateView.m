@interface AppPromotionFormattedDateView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (UIColor)backgroundColor;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel;
- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)initWithFrame:(CGRect)a3;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AppPromotionFormattedDateView

- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension29AppPromotionFormattedDateView *)sub_1000D6C20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000DB7A8();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  sub_1000D7158();
  v5.receiver = v4;
  v5.super_class = ObjectType;
  [(AppPromotionFormattedDateView *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_textLabel));
  sub_10000FB1C((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_liveIndicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_blurredBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_vibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_liveIndicatorAnimationCoordinator));

  swift_release();
}

- (UIColor)backgroundColor
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_backgroundView);
  if (v2) {
    id v2 = [v2 backgroundColor];
  }

  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_backgroundView);
  if (v3) {
    [v3 setBackgroundColor:a3];
  }
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_1000D9074();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  sub_1000D9B3C(v19);
  swift_getObjectType();
  sub_1005506A4((uint64_t)a4, v19);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  sub_1000DB63C((uint64_t)v19);
  swift_unknownObjectRelease();

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(AppPromotionFormattedDateView *)&v3 _dynamicUserInterfaceTraitDidChange];
  sub_1000D8354();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1000DA46C(a3);
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTextLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension29AppPromotionFormattedDateView_textLabel));
}

@end