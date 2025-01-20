@interface AspectFitScalingImageView
- (_TtC18HealthExperienceUI25AspectFitScalingImageView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI25AspectFitScalingImageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AspectFitScalingImageView

- (_TtC18HealthExperienceUI25AspectFitScalingImageView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView____lazy_storage___contentView) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for AspectFitScalingImageView();
  v7 = -[AspectFitScalingImageView initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  id v8 = sub_1AD654EF8();
  [(AspectFitScalingImageView *)v7 addSubview:v8];

  return v7;
}

- (_TtC18HealthExperienceUI25AspectFitScalingImageView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView_image) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView____lazy_storage___contentView) = 0;
  id v4 = a3;

  result = (_TtC18HealthExperienceUI25AspectFitScalingImageView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AspectFitScalingImageView();
  id v2 = v3.receiver;
  [(AspectFitScalingImageView *)&v3 layoutSubviews];
  sub_1AD655114();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView_image));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI25AspectFitScalingImageView____lazy_storage___contentView);
}

@end