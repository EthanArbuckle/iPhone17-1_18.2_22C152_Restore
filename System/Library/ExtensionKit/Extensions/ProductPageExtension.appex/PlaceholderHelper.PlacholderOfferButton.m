@interface PlaceholderHelper.PlacholderOfferButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCV20ProductPageExtension17PlaceholderHelperP33_1824C6005CF15D4BC8A78ADADD15571721PlacholderOfferButton)initWithCoder:(id)a3;
- (_TtCV20ProductPageExtension17PlaceholderHelperP33_1824C6005CF15D4BC8A78ADADD15571721PlacholderOfferButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PlaceholderHelper.PlacholderOfferButton

- (_TtCV20ProductPageExtension17PlaceholderHelperP33_1824C6005CF15D4BC8A78ADADD15571721PlacholderOfferButton)initWithFrame:(CGRect)a3
{
  return (_TtCV20ProductPageExtension17PlaceholderHelperP33_1824C6005CF15D4BC8A78ADADD15571721PlacholderOfferButton *)sub_1004B9F84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV20ProductPageExtension17PlaceholderHelperP33_1824C6005CF15D4BC8A78ADADD15571721PlacholderOfferButton)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCV20ProductPageExtension17PlaceholderHelperP33_1824C6005CF15D4BC8A78ADADD15571721PlacholderOfferButton_button;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  id v8 = [v6 init];
  id v9 = [self secondarySystemBackgroundColor];
  [v8 setBackgroundColor:v9];

  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;
  result = (_TtCV20ProductPageExtension17PlaceholderHelperP33_1824C6005CF15D4BC8A78ADADD15571721PlacholderOfferButton *)sub_10077D120();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1004BAAE0();
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1004BA1E0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV20ProductPageExtension17PlaceholderHelperP33_1824C6005CF15D4BC8A78ADADD15571721PlacholderOfferButton_button));
}

@end