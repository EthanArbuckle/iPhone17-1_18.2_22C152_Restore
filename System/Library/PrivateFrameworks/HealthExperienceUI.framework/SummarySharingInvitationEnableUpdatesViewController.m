@interface SummarySharingInvitationEnableUpdatesViewController
- (void)cancelButtonTapped:(id)a3;
- (void)disableButtonTapped:(id)a3;
- (void)fetchNotificationAuthorizationStatus;
- (void)nextButtonTapped:(id)a3;
@end

@implementation SummarySharingInvitationEnableUpdatesViewController

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  v5 = v4;
  sub_1AD3CF630((uint64_t)&unk_1F041DD38, (uint64_t)v5);

  [(SummarySharingInvitationEnableUpdatesViewController *)v5 dismissViewControllerAnimated:1 completion:0];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
}

- (void)nextButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD3CE33C();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)disableButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD3CEFA0(0);
  type metadata accessor for SummarySharingInviteToReceiveAnalyticsEvent();
  uint64_t v5 = *(Class *)((char *)&v4->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController_healthStore);
  unsigned __int8 v8 = 1;
  __int16 v7 = 1025;
  static SummarySharingInviteToReceiveAnalyticsEvent.submitAnalytics(healthStore:location:version:stepDetails:)(v5, &v8, v6, &v7);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

- (void)fetchNotificationAuthorizationStatus
{
  v2 = self;
  sub_1AD3CE6B8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController_sharingEntryStore));
  v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController_profileInformation;
  uint64_t v4 = sub_1AD73C130();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController_notificationSettingsManager));
  swift_release();
  swift_release();
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI51SummarySharingInvitationEnableUpdatesViewController____lazy_storage___disableUpdatesButton);
}

@end