@interface MultilineButton
- (_TtC18HealthExperienceUI15MultilineButton)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI15MultilineButton)initWithFrame:(CGRect)a3;
- (void)updateConstraints;
@end

@implementation MultilineButton

- (_TtC18HealthExperienceUI15MultilineButton)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI15MultilineButton *)MultilineButton.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI15MultilineButton)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI15MultilineButton *)MultilineButton.init(coder:)(a3);
}

- (void)updateConstraints
{
  v2 = self;
  sub_1AD580920();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15MultilineButton_labelLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15MultilineButton_labelTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15MultilineButton_labelTopConstraint));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI15MultilineButton_labelBottomConstraint);
}

@end