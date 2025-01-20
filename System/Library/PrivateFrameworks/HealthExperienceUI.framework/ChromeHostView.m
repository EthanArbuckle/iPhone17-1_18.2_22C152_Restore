@interface ChromeHostView
- (_TtC18HealthExperienceUI14ChromeHostView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI14ChromeHostView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ChromeHostView

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD1B4368(a3);
}

- (_TtC18HealthExperienceUI14ChromeHostView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI14ChromeHostView *)ChromeHostView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI14ChromeHostView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI14ChromeHostView *)ChromeHostView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI14ChromeHostView_header));
}

@end