@interface CategoryGradientView
+ (Class)layerClass;
- (_TtC18HealthExperienceUI20CategoryGradientView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI20CategoryGradientView)initWithFrame:(CGRect)a3;
@end

@implementation CategoryGradientView

+ (Class)layerClass
{
  sub_1AD2147D4(0, &qword_1EB73C110);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC18HealthExperienceUI20CategoryGradientView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CategoryGradientView();
  v7 = -[CategoryGradientView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
  id v8 = [(CategoryGradientView *)v7 layer];
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setStartPoint_, 0.5, 0.0);

  id v9 = [(CategoryGradientView *)v7 layer];
  self;
  objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_setEndPoint_, 0.5, 1.0);

  return v7;
}

- (_TtC18HealthExperienceUI20CategoryGradientView)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI20CategoryGradientView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

@end