@interface LabelWithSpinner
- (_TtC18HealthExperienceUI16LabelWithSpinner)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI16LabelWithSpinner)initWithFrame:(CGRect)a3;
@end

@implementation LabelWithSpinner

- (_TtC18HealthExperienceUI16LabelWithSpinner)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI16LabelWithSpinner *)LabelWithSpinner.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI16LabelWithSpinner)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI16LabelWithSpinner *)LabelWithSpinner.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI16LabelWithSpinner_label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI16LabelWithSpinner_spinner));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end