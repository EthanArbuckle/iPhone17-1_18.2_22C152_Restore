@interface DetectionLabel
- (BOOL)canBecomeFirstResponder;
- (_TtC16MagnifierSupport14DetectionLabel)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport14DetectionLabel)initWithFrame:(CGRect)a3 textContainer:(id)a4;
@end

@implementation DetectionLabel

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (_TtC16MagnifierSupport14DetectionLabel)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  return -[DetectionLabel initWithFrame:textContainer:](&v10, sel_initWithFrame_textContainer_, a4, x, y, width, height);
}

- (_TtC16MagnifierSupport14DetectionLabel)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(DetectionLabel *)&v5 initWithCoder:a3];
}

@end