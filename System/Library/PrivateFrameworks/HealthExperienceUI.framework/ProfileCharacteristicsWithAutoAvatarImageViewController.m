@interface ProfileCharacteristicsWithAutoAvatarImageViewController
- (_TtC18HealthExperienceUI55ProfileCharacteristicsWithAutoAvatarImageViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI55ProfileCharacteristicsWithAutoAvatarImageViewController)initWithHealthStore:(id)a3;
- (void)didUpdateName;
- (void)setUpNavigationBar;
@end

@implementation ProfileCharacteristicsWithAutoAvatarImageViewController

- (void)setUpNavigationBar
{
  v2 = self;
  sub_1AD2FEEA4();
}

- (void)didUpdateName
{
  v2 = self;
  sub_1AD2FF204();
}

- (_TtC18HealthExperienceUI55ProfileCharacteristicsWithAutoAvatarImageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  _s18HealthExperienceUI55ProfileCharacteristicsWithAutoAvatarImageViewControllerC5coderACSgSo7NSCoderC_tcfc_0();
}

- (_TtC18HealthExperienceUI55ProfileCharacteristicsWithAutoAvatarImageViewController)initWithHealthStore:(id)a3
{
  id v3 = a3;
  result = (_TtC18HealthExperienceUI55ProfileCharacteristicsWithAutoAvatarImageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI55ProfileCharacteristicsWithAutoAvatarImageViewController_healthExperienceStore);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI55ProfileCharacteristicsWithAutoAvatarImageViewController_healthStore));
  swift_release();
  swift_release();
}

@end