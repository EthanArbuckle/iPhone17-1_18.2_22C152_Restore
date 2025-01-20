@interface ARRenderView
+ (Class)layerClass;
- (_TtC10RealityKit12ARRenderView)initWithCoder:(id)a3;
- (_TtC10RealityKit12ARRenderView)initWithFrame:(CGRect)a3;
@end

@implementation ARRenderView

+ (Class)layerClass
{
  type metadata accessor for ARReferenceObject(0, &lazy cache variable for type metadata for CAMetalLayer);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC10RealityKit12ARRenderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ARRenderView();
  return -[ARRenderView initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10RealityKit12ARRenderView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ARRenderView();
  return [(ARRenderView *)&v5 initWithCoder:a3];
}

@end