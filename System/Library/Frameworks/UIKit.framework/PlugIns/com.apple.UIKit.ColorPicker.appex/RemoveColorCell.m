@interface RemoveColorCell
- (BOOL)isSelected;
- (_TtC27com_apple_UIKit_ColorPicker15RemoveColorCell)initWithCoder:(id)a3;
- (_TtC27com_apple_UIKit_ColorPicker15RemoveColorCell)initWithFrame:(CGRect)a3;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)setSelected:(BOOL)a3;
@end

@implementation RemoveColorCell

- (_TtC27com_apple_UIKit_ColorPicker15RemoveColorCell)initWithFrame:(CGRect)a3
{
  return (_TtC27com_apple_UIKit_ColorPicker15RemoveColorCell *)sub_10002B11C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC27com_apple_UIKit_ColorPicker15RemoveColorCell)initWithCoder:(id)a3
{
  return (_TtC27com_apple_UIKit_ColorPicker15RemoveColorCell *)sub_10002B248(a3);
}

- (BOOL)isSelected
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RemoveColorCell();
  return [(RemoveColorCell *)&v3 isSelected];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RemoveColorCell();
  id v4 = v5.receiver;
  [(RemoveColorCell *)&v5 setSelected:v3];
  objc_msgSend(v4, "setNeedsLayout", v5.receiver, v5.super_class);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10002B7F4();
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  UIAccessibilityTraits v3 = sub_10002BB94();

  return v3;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_colorView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_maskShapeView));
  UIAccessibilityTraits v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker15RemoveColorCell_barView);
}

@end