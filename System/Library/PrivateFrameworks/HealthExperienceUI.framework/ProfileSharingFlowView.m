@interface ProfileSharingFlowView
- (_TtC18HealthExperienceUI22ProfileSharingFlowView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI22ProfileSharingFlowView)initWithFrame:(CGRect)a3;
@end

@implementation ProfileSharingFlowView

- (_TtC18HealthExperienceUI22ProfileSharingFlowView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileBeingSharedView) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileReceivingSharedProfileView) = 0;
  id v4 = a3;

  result = (_TtC18HealthExperienceUI22ProfileSharingFlowView *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI22ProfileSharingFlowView)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI22ProfileSharingFlowView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileBeingShared);
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileReceivingSharedProfile;
  uint64_t v4 = sub_1AD73BD60();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileBeingSharedView));
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI22ProfileSharingFlowView_profileReceivingSharedProfileView);
}

@end