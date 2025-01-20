@interface CenteredIconDescriptionCollectionViewCell
- (_TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell)initWithFrame:(CGRect)a3;
@end

@implementation CenteredIconDescriptionCollectionViewCell

- (_TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell *)sub_1AD655988(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell *)sub_1AD655EB4(a3);
}

- (void).cxx_destruct
{
  sub_1AD1E1AA8((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell_item);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell_imageBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell_primaryDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell_secondaryDescriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI41CenteredIconDescriptionCollectionViewCell_primaryDescriptionLabelBottomConstraint));
  swift_bridgeObjectRelease();
}

@end