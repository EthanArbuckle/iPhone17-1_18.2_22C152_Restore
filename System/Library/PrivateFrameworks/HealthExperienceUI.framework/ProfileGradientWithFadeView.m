@interface ProfileGradientWithFadeView
- (_TtC18HealthExperienceUI27ProfileGradientWithFadeView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI27ProfileGradientWithFadeView)initWithFrame:(CGRect)a3;
@end

@implementation ProfileGradientWithFadeView

- (_TtC18HealthExperienceUI27ProfileGradientWithFadeView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI27ProfileGradientWithFadeView *)ProfileGradientWithFadeView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI27ProfileGradientWithFadeView)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI27ProfileGradientWithFadeView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI27ProfileGradientWithFadeView_gradientView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI27ProfileGradientWithFadeView_fadeView);
}

@end