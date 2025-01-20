@interface ShapeView
+ (Class)layerClass;
- (_TtC20ColorPickerUIService9ShapeView)initWithCoder:(id)a3;
- (_TtC20ColorPickerUIService9ShapeView)initWithFrame:(CGRect)a3;
@end

@implementation ShapeView

+ (Class)layerClass
{
  sub_100009AD0(0, &qword_100072FC8);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC20ColorPickerUIService9ShapeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ShapeView();
  return -[ShapeView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC20ColorPickerUIService9ShapeView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ColorPickerUIService9ShapeView_bezierPath) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ShapeView();
  return [(ShapeView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end