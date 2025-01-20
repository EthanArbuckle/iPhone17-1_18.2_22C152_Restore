@interface SummarySharingAcceptedProfileTileCell
- (_TtC18HealthExperienceUI37SummarySharingAcceptedProfileTileCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI37SummarySharingAcceptedProfileTileCell)initWithFrame:(CGRect)a3;
@end

@implementation SummarySharingAcceptedProfileTileCell

- (_TtC18HealthExperienceUI37SummarySharingAcceptedProfileTileCell)initWithFrame:(CGRect)a3
{
  return (_TtC18HealthExperienceUI37SummarySharingAcceptedProfileTileCell *)sub_1AD6834CC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18HealthExperienceUI37SummarySharingAcceptedProfileTileCell)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI37SummarySharingAcceptedProfileTileCell *)sub_1AD68377C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI37SummarySharingAcceptedProfileTileCell_tileContentLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI37SummarySharingAcceptedProfileTileCell_alertsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI37SummarySharingAcceptedProfileTileCell_changesLabel));
  swift_release();
}

@end