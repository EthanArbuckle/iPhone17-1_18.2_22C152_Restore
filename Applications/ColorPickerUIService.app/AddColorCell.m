@interface AddColorCell
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityLabel;
- (_TtC20ColorPickerUIService12AddColorCell)initWithCoder:(id)a3;
- (_TtC20ColorPickerUIService12AddColorCell)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
@end

@implementation AddColorCell

- (_TtC20ColorPickerUIService12AddColorCell)initWithFrame:(CGRect)a3
{
  return (_TtC20ColorPickerUIService12AddColorCell *)sub_10001B7C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ColorPickerUIService12AddColorCell)initWithCoder:(id)a3
{
  return (_TtC20ColorPickerUIService12AddColorCell *)sub_10001B8D4(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10001BEB0();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  sub_10001C114();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
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
                     + OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_plusImageView));
  NSString v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC20ColorPickerUIService12AddColorCell_maskShapeView);
}

@end