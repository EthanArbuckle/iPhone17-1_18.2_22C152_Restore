@interface PlaceholderHelper.PlacholderOfferButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCV18ASMessagesProvider17PlaceholderHelperP33_7738B070FC466D250071AB58821ACB5621PlacholderOfferButton)initWithCoder:(id)a3;
- (_TtCV18ASMessagesProvider17PlaceholderHelperP33_7738B070FC466D250071AB58821ACB5621PlacholderOfferButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation PlaceholderHelper.PlacholderOfferButton

- (_TtCV18ASMessagesProvider17PlaceholderHelperP33_7738B070FC466D250071AB58821ACB5621PlacholderOfferButton)initWithFrame:(CGRect)a3
{
  return (_TtCV18ASMessagesProvider17PlaceholderHelperP33_7738B070FC466D250071AB58821ACB5621PlacholderOfferButton *)sub_48F860(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCV18ASMessagesProvider17PlaceholderHelperP33_7738B070FC466D250071AB58821ACB5621PlacholderOfferButton)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCV18ASMessagesProvider17PlaceholderHelperP33_7738B070FC466D250071AB58821ACB5621PlacholderOfferButton_button;
  id v6 = objc_allocWithZone((Class)UIView);
  id v7 = a3;
  id v8 = [v6 init];
  id v9 = [self secondarySystemBackgroundColor];
  [v8 setBackgroundColor:v9];

  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;
  result = (_TtCV18ASMessagesProvider17PlaceholderHelperP33_7738B070FC466D250071AB58821ACB5621PlacholderOfferButton *)sub_77EB20();
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = self;
  double v4 = sub_4903BC();
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
  sub_48FABC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV18ASMessagesProvider17PlaceholderHelperP33_7738B070FC466D250071AB58821ACB5621PlacholderOfferButton_button));
}

@end