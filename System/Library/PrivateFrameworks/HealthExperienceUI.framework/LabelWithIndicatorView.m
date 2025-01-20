@interface LabelWithIndicatorView
- (_TtC18HealthExperienceUI22LabelWithIndicatorView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI22LabelWithIndicatorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation LabelWithIndicatorView

- (_TtC18HealthExperienceUI22LabelWithIndicatorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD419168();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1AD417C84();
}

- (_TtC18HealthExperienceUI22LabelWithIndicatorView)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI22LabelWithIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22LabelWithIndicatorView____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22LabelWithIndicatorView____lazy_storage___indicatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22LabelWithIndicatorView_indicatorViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22LabelWithIndicatorView_indicatorViewTrailingConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI22LabelWithIndicatorView_titleLabelLeadingAnchor);
}

@end