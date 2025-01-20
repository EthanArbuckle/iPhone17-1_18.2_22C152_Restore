@interface ProfileSharingWithYouHeaderView
- (_TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation ProfileSharingWithYouHeaderView

- (_TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AD43E3DC();
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ProfileSharingWithYouHeaderView();
  id v4 = a3;
  id v5 = v8.receiver;
  [(ProfileSharingWithYouHeaderView *)&v8 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v8.receiver, v8.super_class);
  id v7 = objc_msgSend(v6, sel_preferredContentSizeCategory);

  sub_1AD43B868();
}

- (_TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView____lazy_storage___nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView____lazy_storage___lastUpdatedTimestamp));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView____lazy_storage___disclosureIndicator));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView____lazy_storage___disclosureIndicatorWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView____lazy_storage___disclosureIndicatorLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView____lazy_storage___emptyDisclosureIndicatorLeadingConstraint));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView____lazy_storage___lastUpdatedTimestampWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView____lazy_storage___lastUpdatedTimestampHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView____lazy_storage___lastUpdatedTimestampLeadingAnchorConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI31ProfileSharingWithYouHeaderView____lazy_storage___emptyLastUpdatedTimestampLeadingAnchorConstraint);
}

@end