@interface TitleDetailLabelsView
- (_TtC18HealthExperienceUI21TitleDetailLabelsView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI21TitleDetailLabelsView)initWithFrame:(CGRect)a3;
@end

@implementation TitleDetailLabelsView

- (_TtC18HealthExperienceUI21TitleDetailLabelsView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI21TitleDetailLabelsView *)sub_1AD5F9290(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI21TitleDetailLabelsView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD5FAD10();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI21TitleDetailLabelsView_titleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI21TitleDetailLabelsView_detailTextField);
}

@end