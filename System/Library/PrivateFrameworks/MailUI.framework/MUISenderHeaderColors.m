@interface MUISenderHeaderColors
- (MUISenderHeaderColors)init;
- (MUISenderHeaderColors)initWithContrastingBackgroundColor:(id)a3 textColor:(id)a4 secondaryTextColor:(id)a5;
- (UIColor)contrastingBackgroundColor;
- (UIColor)secondaryTextColor;
- (UIColor)textColor;
- (void)setContrastingBackgroundColor:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setTextColor:(id)a3;
@end

@implementation MUISenderHeaderColors

- (void).cxx_destruct
{
}

- (UIColor)contrastingBackgroundColor
{
  swift_getObjectType();
  v3 = self;
  id v6 = MUISenderHeaderColors.contrastingBackgroundColor.getter();

  return (UIColor *)v6;
}

- (void)setContrastingBackgroundColor:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  sub_1DDE32D3C(a3);
}

- (UIColor)textColor
{
  swift_getObjectType();
  v3 = self;
  id v6 = MUISenderHeaderColors.textColor.getter();

  return (UIColor *)v6;
}

- (void)setTextColor:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  sub_1DDE32FC4(a3);
}

- (UIColor)secondaryTextColor
{
  swift_getObjectType();
  v3 = self;
  id v6 = MUISenderHeaderColors.secondaryTextColor.getter();

  return (UIColor *)v6;
}

- (void)setSecondaryTextColor:(id)a3
{
  swift_getObjectType();
  id v4 = a3;
  v5 = self;
  sub_1DDE3324C(a3);
}

- (MUISenderHeaderColors)initWithContrastingBackgroundColor:(id)a3 textColor:(id)a4 secondaryTextColor:(id)a5
{
  swift_getObjectType();
  id v5 = a3;
  id v6 = a4;
  id v7 = a5;
  return (MUISenderHeaderColors *)MUISenderHeaderColors.init(contrastingBackgroundColor:textColor:secondaryTextColor:)(a3, a4, a5);
}

- (MUISenderHeaderColors)init
{
  return (MUISenderHeaderColors *)MUISenderHeaderColors.init()();
}

@end