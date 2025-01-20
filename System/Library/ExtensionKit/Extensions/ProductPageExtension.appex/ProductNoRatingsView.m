@interface ProductNoRatingsView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityStatusLabel;
- (_TtC20ProductPageExtension20ProductNoRatingsView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension20ProductNoRatingsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductNoRatingsView

- (_TtC20ProductPageExtension20ProductNoRatingsView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension20ProductNoRatingsView *)sub_1001084E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension20ProductNoRatingsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100108BE0();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(ProductNoRatingsView *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension20ProductNoRatingsView_statusLabel];
  sub_100770A80();
  objc_msgSend(v3, "setFrame:", v4.receiver, v4.super_class);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension20ProductNoRatingsView_statusLabel), "measurementsWithFitting:in:", a4, a3.width, a3.height);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityStatusLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension20ProductNoRatingsView_statusLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension20ProductNoRatingsView_statusLabel));
}

@end