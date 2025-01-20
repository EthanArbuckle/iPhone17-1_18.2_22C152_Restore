@interface SummarySharingInvitationTopicsViewController
- (_TtC18HealthExperienceUI44SummarySharingInvitationTopicsViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI44SummarySharingInvitationTopicsViewController)initWithCollectionViewLayout:(id)a3;
- (void)viewDidLoad;
@end

@implementation SummarySharingInvitationTopicsViewController

- (_TtC18HealthExperienceUI44SummarySharingInvitationTopicsViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI44SummarySharingInvitationTopicsViewController_cancellables) = (Class)MEMORY[0x1E4FBC860];
  id v4 = a3;

  result = (_TtC18HealthExperienceUI44SummarySharingInvitationTopicsViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD4E23F4();
}

- (_TtC18HealthExperienceUI44SummarySharingInvitationTopicsViewController)initWithCollectionViewLayout:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI44SummarySharingInvitationTopicsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI44SummarySharingInvitationTopicsViewController_healthExperienceStore);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end