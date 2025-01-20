@interface ProductNoRatingsView
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityStatusLabel;
- (_TtC22SubscribePageExtension20ProductNoRatingsView)initWithCoder:(id)a3;
- (_TtC22SubscribePageExtension20ProductNoRatingsView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ProductNoRatingsView

- (_TtC22SubscribePageExtension20ProductNoRatingsView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension20ProductNoRatingsView *)sub_10010AAE0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension20ProductNoRatingsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10010B1D8();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(ProductNoRatingsView *)&v4 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC22SubscribePageExtension20ProductNoRatingsView_statusLabel];
  sub_10075C580();
  objc_msgSend(v3, "setFrame:", v4.receiver, v4.super_class);
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC22SubscribePageExtension20ProductNoRatingsView_statusLabel), "measurementsWithFitting:in:", a4, a3.width, a3.height);
  result.var3 = v7;
  result.var2 = v6;
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityStatusLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC22SubscribePageExtension20ProductNoRatingsView_statusLabel));
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension20ProductNoRatingsView_statusLabel));
}

@end