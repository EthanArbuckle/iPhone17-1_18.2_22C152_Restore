@interface GradientLayerView
+ (Class)layerClass;
- (_TtC14GradientPoster17GradientLayerView)initWithCoder:(id)a3;
- (_TtC14GradientPoster17GradientLayerView)initWithFrame:(CGRect)a3;
@end

@implementation GradientLayerView

+ (Class)layerClass
{
  sub_230F1547C(0, &qword_26AF0DE50);

  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC14GradientPoster17GradientLayerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for GradientLayerView();
  v7 = -[GradientLayerView initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  [(GradientLayerView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  return v7;
}

- (_TtC14GradientPoster17GradientLayerView)initWithCoder:(id)a3
{
  result = (_TtC14GradientPoster17GradientLayerView *)sub_230F18150();
  __break(1u);
  return result;
}

@end