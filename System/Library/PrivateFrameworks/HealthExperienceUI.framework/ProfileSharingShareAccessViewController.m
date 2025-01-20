@interface ProfileSharingShareAccessViewController
- (void)nextButtonTapped:(id)a3;
@end

@implementation ProfileSharingShareAccessViewController

- (void)nextButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD3C7790();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI39ProfileSharingShareAccessViewController_profileBeingShared;
  sub_1AD2FF6C0((uint64_t)v3);
}

@end