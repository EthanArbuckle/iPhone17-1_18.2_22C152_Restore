@interface AXMotionCuesGridElementView
+ (Class)layerClass;
- (_TtC18AXMotionCuesServer27AXMotionCuesGridElementView)initWithCoder:(id)a3;
- (_TtC18AXMotionCuesServer27AXMotionCuesGridElementView)initWithFrame:(CGRect)a3;
@end

@implementation AXMotionCuesGridElementView

+ (Class)layerClass
{
  sub_14E38();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18AXMotionCuesServer27AXMotionCuesGridElementView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[AXMotionCuesGridElementView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC18AXMotionCuesServer27AXMotionCuesGridElementView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(AXMotionCuesGridElementView *)&v5 initWithCoder:a3];
}

@end