@interface MetalView
+ (Class)layerClass;
- (_TtC8SOSBuddy9MetalView)initWithCoder:(id)a3;
- (_TtC8SOSBuddy9MetalView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MetalView

+ (Class)layerClass
{
  sub_1001329BC();

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100132640();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v11 = a3;
  v4 = self;
  id v5 = [(MetalView *)v4 layer];
  self;
  uint64_t v6 = swift_dynamicCastObjCClass();
  if (v6)
  {
    v7 = (void *)v6;
    id v8 = [(MetalView *)v4 traitCollection];
    [v8 displayScale];
    double v10 = v9;

    [v7 setContentsScale:v10];
  }
}

- (_TtC8SOSBuddy9MetalView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MetalView();
  return -[MetalView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC8SOSBuddy9MetalView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MetalView();
  return [(MetalView *)&v5 initWithCoder:a3];
}

@end