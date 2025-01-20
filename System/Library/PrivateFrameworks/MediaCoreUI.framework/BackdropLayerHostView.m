@interface BackdropLayerHostView
+ (Class)layerClass;
- (_TtC11MediaCoreUI21BackdropLayerHostView)initWithCoder:(id)a3;
- (_TtC11MediaCoreUI21BackdropLayerHostView)initWithFrame:(CGRect)a3;
@end

@implementation BackdropLayerHostView

+ (Class)layerClass
{
  sub_255AAFF64();

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC11MediaCoreUI21BackdropLayerHostView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[BackdropLayerHostView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC11MediaCoreUI21BackdropLayerHostView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(BackdropLayerHostView *)&v5 initWithCoder:a3];
}

@end