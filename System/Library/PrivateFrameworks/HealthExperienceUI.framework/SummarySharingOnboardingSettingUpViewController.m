@interface SummarySharingOnboardingSettingUpViewController
- (_TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)onCancelTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation SummarySharingOnboardingSettingUpViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD54FFDC();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SummarySharingOnboardingSettingUpViewController();
  id v4 = v5.receiver;
  [(OBBaseWelcomeController *)&v5 viewDidAppear:v3];
  sub_1AD550448();
}

- (void)onCancelTapped
{
  v2 = self;
  sub_1AD5502FC();
}

- (_TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController_healthExperienceStore);
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI47SummarySharingOnboardingSettingUpViewController_healthStore);
}

@end