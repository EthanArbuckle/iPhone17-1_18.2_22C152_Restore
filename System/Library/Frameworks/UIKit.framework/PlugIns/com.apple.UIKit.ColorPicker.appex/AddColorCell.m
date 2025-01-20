@interface AddColorCell
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityLabel;
- (_TtC27com_apple_UIKit_ColorPicker12AddColorCell)initWithCoder:(id)a3;
- (_TtC27com_apple_UIKit_ColorPicker12AddColorCell)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
@end

@implementation AddColorCell

- (_TtC27com_apple_UIKit_ColorPicker12AddColorCell)initWithFrame:(CGRect)a3
{
  return (_TtC27com_apple_UIKit_ColorPicker12AddColorCell *)sub_100028D9C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC27com_apple_UIKit_ColorPicker12AddColorCell)initWithCoder:(id)a3
{
  return (_TtC27com_apple_UIKit_ColorPicker12AddColorCell *)sub_100028EAC(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100029488();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  sub_1000296EC();
  if (v2)
  {
    NSString v3 = sub_10004A700();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker12AddColorCell_plusImageView));
  NSString v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker12AddColorCell_maskShapeView);
}

@end