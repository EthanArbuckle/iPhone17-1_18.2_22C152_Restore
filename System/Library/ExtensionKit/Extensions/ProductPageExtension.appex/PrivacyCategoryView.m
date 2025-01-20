@interface PrivacyCategoryView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDataTypesLabel;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel;
- (_TtC20ProductPageExtension19PrivacyCategoryView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension19PrivacyCategoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PrivacyCategoryView

- (_TtC20ProductPageExtension19PrivacyCategoryView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension19PrivacyCategoryView *)sub_1000FC8D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension19PrivacyCategoryView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension19PrivacyCategoryView_dataTypesLabel) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension19PrivacyCategoryView_category) = 0;
  id v4 = a3;

  result = (_TtC20ProductPageExtension19PrivacyCategoryView *)sub_10077D120();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1000FD480();
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v6 = self;
  double v7 = sub_1000FE080((uint64_t)a4);
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

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityTitleLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension19PrivacyCategoryView_titleLabel));
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityDataTypesLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension19PrivacyCategoryView_dataTypesLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension19PrivacyCategoryView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension19PrivacyCategoryView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension19PrivacyCategoryView_dataTypesLabel));

  swift_release();
}

@end