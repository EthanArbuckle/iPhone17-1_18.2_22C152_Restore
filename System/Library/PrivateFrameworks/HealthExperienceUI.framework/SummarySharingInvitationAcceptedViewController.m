@interface SummarySharingInvitationAcceptedViewController
- (void)cancelButtonTapped:(id)a3;
@end

@implementation SummarySharingInvitationAcceptedViewController

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD55E7E8();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI46SummarySharingInvitationAcceptedViewController_healthStore);
}

@end