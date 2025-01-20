@interface ProfileNameView
- (_TtC18HealthExperienceUI15ProfileNameView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI15ProfileNameView)initWithFrame:(CGRect)a3;
- (void)traitWidthDesignationDidChange;
@end

@implementation ProfileNameView

- (_TtC18HealthExperienceUI15ProfileNameView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI15ProfileNameView *)ProfileNameView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI15ProfileNameView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI15ProfileNameView *)ProfileNameView.init(coder:)(a3);
}

- (void)traitWidthDesignationDidChange
{
  v2 = self;
  sub_1AD3C9F40();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameView_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameView_subtitleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameView_subtitleVibrancyView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameView_subtitleViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameView_subtitleViewTopSpaceConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameView_subtitleLeadingConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameView_profileButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI15ProfileNameView_profileButtonHeightConstraint));
  swift_release();
  swift_release();
}

@end