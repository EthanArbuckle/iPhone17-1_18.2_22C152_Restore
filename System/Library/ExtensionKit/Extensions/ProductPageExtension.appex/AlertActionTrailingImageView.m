@interface AlertActionTrailingImageView
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityAlertActionLabel;
- (_TtC20ProductPageExtension28AlertActionTrailingImageView)initWithCoder:(id)a3;
- (_TtC20ProductPageExtension28AlertActionTrailingImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation AlertActionTrailingImageView

- (_TtC20ProductPageExtension28AlertActionTrailingImageView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005E2E00();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1005E25B0();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for AlertActionTrailingImageView();
  id v4 = v8.receiver;
  id v5 = a3;
  [(AlertActionTrailingImageView *)&v8 traitCollectionDidChange:v5];
  id v6 = objc_msgSend(v4, "traitCollection", v8.receiver, v8.super_class);
  id v7 = [v6 layoutDirection];

  if (!v5 || v7 != [v5 layoutDirection]) {
    [v4 setNeedsLayout];
  }
}

- (void)tintColorDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for AlertActionTrailingImageView();
  v2 = (char *)v5.receiver;
  [(AlertActionTrailingImageView *)&v5 tintColorDidChange];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC20ProductPageExtension28AlertActionTrailingImageView_label];
  id v4 = objc_msgSend(v2, "tintColor", v5.receiver, v5.super_class);
  [v3 setTextColor:v4];
}

- (CGSize)intrinsicContentSize
{
  -[AlertActionTrailingImageView sizeThatFits:](self, "sizeThatFits:", UIViewNoIntrinsicMetric, 1.79769313e308);
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  id v4 = self;
  double v5 = sub_1005E2B98(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (_TtC19AppStoreKitInternal16DynamicTypeLabel)accessibilityAlertActionLabel
{
  return (_TtC19AppStoreKitInternal16DynamicTypeLabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                + OBJC_IVAR____TtC20ProductPageExtension28AlertActionTrailingImageView_label));
}

- (_TtC20ProductPageExtension28AlertActionTrailingImageView)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC20ProductPageExtension28AlertActionTrailingImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension28AlertActionTrailingImageView_label));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension28AlertActionTrailingImageView_imageView);
}

@end