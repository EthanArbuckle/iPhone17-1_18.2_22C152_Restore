@interface MonogramSimulationView
+ (Class)layerClass;
- (_TtC23MonogramPosterExtension22MonogramSimulationView)initWithCoder:(id)a3;
- (_TtC23MonogramPosterExtension22MonogramSimulationView)initWithFrame:(CGRect)a3;
@end

@implementation MonogramSimulationView

- (_TtC23MonogramPosterExtension22MonogramSimulationView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MonogramSimulationView(0);
  v7 = -[BackgroundSimulationView initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  id v8 = [(MonogramSimulationView *)v7 layer];
  [v8 setOpaque:0];

  id v9 = [(MonogramSimulationView *)v7 layer];
  [v9 setAllowsDisplayCompositing:0];

  return v7;
}

- (_TtC23MonogramPosterExtension22MonogramSimulationView)initWithCoder:(id)a3
{
  result = (_TtC23MonogramPosterExtension22MonogramSimulationView *)sub_100016610();
  __break(1u);
  return result;
}

+ (Class)layerClass
{
  type metadata accessor for MonogramSimulationLayer(0);

  return (Class)swift_getObjCClassFromMetadata();
}

@end