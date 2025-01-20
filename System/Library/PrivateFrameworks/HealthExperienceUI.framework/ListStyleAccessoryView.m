@interface ListStyleAccessoryView
- (_TtC18HealthExperienceUI22ListStyleAccessoryView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI22ListStyleAccessoryView)initWithFrame:(CGRect)a3;
@end

@implementation ListStyleAccessoryView

- (_TtC18HealthExperienceUI22ListStyleAccessoryView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI22ListStyleAccessoryView *)ListStyleAccessoryView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI22ListStyleAccessoryView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView_baseIdentifier);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___containerView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___separator) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___label) = 0;
  id v5 = a3;

  result = (_TtC18HealthExperienceUI22ListStyleAccessoryView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___separator));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI22ListStyleAccessoryView____lazy_storage___label);
}

@end