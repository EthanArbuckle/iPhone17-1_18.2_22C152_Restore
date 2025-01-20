@interface GradientView
+ (Class)layerClass;
- (_TtC8HealthUI12GradientView)initWithCoder:(id)a3;
- (_TtC8HealthUI12GradientView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GradientView

+ (Class)layerClass
{
  sub_1E0E20FB0();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E0E215C0();
}

- (_TtC8HealthUI12GradientView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8HealthUI12GradientView____lazy_storage___gradientLayer) = (Class)1;
  v8 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8HealthUI12GradientView_gradientColors);
  v9 = (objc_class *)type metadata accessor for GradientView();
  void *v8 = 0;
  v8[1] = 0;
  v11.receiver = self;
  v11.super_class = v9;
  return -[GradientView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8HealthUI12GradientView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8HealthUI12GradientView____lazy_storage___gradientLayer) = (Class)1;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8HealthUI12GradientView_gradientColors);
  v6 = (objc_class *)type metadata accessor for GradientView();
  void *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(GradientView *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1E0DFF84C(*(id *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC8HealthUI12GradientView____lazy_storage___gradientLayer));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8HealthUI12GradientView_gradientColors);
  id v4 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC8HealthUI12GradientView_gradientColors);
  sub_1E0E217B4(v3, v4);
}

@end