@interface PlaceholderHelper.PlacholderOfferButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton)initWithCoder:(id)a3;
- (_TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PlaceholderHelper.PlacholderOfferButton

- (_TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton)initWithFrame:(CGRect)a3
{
  return (_TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton *)sub_10072FE6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton_button;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  id v8 = [v6 init];
  id v9 = [self secondarySystemBackgroundColor];
  [v8 setBackgroundColor:v9];

  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;
  result = (_TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton *)sub_100768A40();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_1007309C8();
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
  sub_1007300C8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV22SubscribePageExtension17PlaceholderHelperP33_4A9A4D8787D6A1CEAEBA94C8789E237C21PlacholderOfferButton_button));
}

@end