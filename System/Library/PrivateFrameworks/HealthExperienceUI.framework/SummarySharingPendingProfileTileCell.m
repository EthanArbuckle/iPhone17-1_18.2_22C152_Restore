@interface SummarySharingPendingProfileTileCell
- (_TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewPendingInvitation;
@end

@implementation SummarySharingPendingProfileTileCell

- (_TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell)initWithFrame:(CGRect)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___pendingMessageLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___viewInvitationButton) = 0;
  return (_TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell *)sub_1AD435508(0, 0);
}

- (_TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___pendingMessageLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___viewInvitationButton) = 0;
  id v4 = a3;

  result = (_TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewPendingInvitation
{
  v2 = self;
  sub_1AD4E4BC0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1AD4E52BC(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___pendingMessageLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI36SummarySharingPendingProfileTileCell____lazy_storage___viewInvitationButton);
}

@end