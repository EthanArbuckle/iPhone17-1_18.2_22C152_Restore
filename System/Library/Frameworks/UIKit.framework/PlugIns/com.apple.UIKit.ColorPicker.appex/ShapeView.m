@interface ShapeView
+ (Class)layerClass;
- (_TtC27com_apple_UIKit_ColorPicker9ShapeView)initWithCoder:(id)a3;
- (_TtC27com_apple_UIKit_ColorPicker9ShapeView)initWithFrame:(CGRect)a3;
@end

@implementation ShapeView

+ (Class)layerClass
{
  sub_100010D7C(0, &qword_10006C808);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC27com_apple_UIKit_ColorPicker9ShapeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ShapeView();
  return -[ShapeView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC27com_apple_UIKit_ColorPicker9ShapeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShapeView();
  return [(ShapeView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC27com_apple_UIKit_ColorPicker9ShapeView_bezierPath));
}

@end