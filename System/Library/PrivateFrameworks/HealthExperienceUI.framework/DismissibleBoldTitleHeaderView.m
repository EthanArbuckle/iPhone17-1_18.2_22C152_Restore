@interface DismissibleBoldTitleHeaderView
- (_TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView)initWithFrame:(CGRect)a3;
- (id)accessibilityAccessoryLabel;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation DismissibleBoldTitleHeaderView

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD6744CC(a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (id)accessibilityAccessoryLabel
{
  v2 = (id *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_accessoryLabel);
  swift_beginAccess();
  return *v2;
}

- (_TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView *)DismissibleBoldTitleHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView *)DismissibleBoldTitleHeaderView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_heightConstraint));
  sub_1AD1AB454((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_dataSource, &qword_1EB73EDB0, (uint64_t)&qword_1EB73EDA8, (uint64_t)&protocol descriptor for TileHeaderDataSource);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_accessoryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI30DismissibleBoldTitleHeaderView_detailContainerView));
  swift_bridgeObjectRelease();
}

@end