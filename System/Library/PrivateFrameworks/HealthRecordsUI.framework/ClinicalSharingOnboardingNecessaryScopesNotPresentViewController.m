@interface ClinicalSharingOnboardingNecessaryScopesNotPresentViewController
- (_TtC15HealthRecordsUI64ClinicalSharingOnboardingNecessaryScopesNotPresentViewController)initWithAccount:(id)a3;
- (_TtC15HealthRecordsUI64ClinicalSharingOnboardingNecessaryScopesNotPresentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC15HealthRecordsUI64ClinicalSharingOnboardingNecessaryScopesNotPresentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)abort:(id)a3;
- (void)logInAgain:(id)a3;
- (void)viewDidLoad;
@end

@implementation ClinicalSharingOnboardingNecessaryScopesNotPresentViewController

- (_TtC15HealthRecordsUI64ClinicalSharingOnboardingNecessaryScopesNotPresentViewController)initWithAccount:(id)a3
{
  return (_TtC15HealthRecordsUI64ClinicalSharingOnboardingNecessaryScopesNotPresentViewController *)sub_1C2441648(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C24419A8();
}

- (void)logInAgain:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_1C2441CB0();

  sub_1C224E3A4((uint64_t)v6);
}

- (void)abort:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1C25501E0();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    v5 = self;
  }
  -[ClinicalSharingOnboardingNecessaryScopesNotPresentViewController dismissViewControllerAnimated:completion:](self, sel_dismissViewControllerAnimated_completion_, 1, 0, v6, v7);

  sub_1C224E3A4((uint64_t)&v6);
}

- (_TtC15HealthRecordsUI64ClinicalSharingOnboardingNecessaryScopesNotPresentViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC15HealthRecordsUI64ClinicalSharingOnboardingNecessaryScopesNotPresentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI64ClinicalSharingOnboardingNecessaryScopesNotPresentViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC15HealthRecordsUI64ClinicalSharingOnboardingNecessaryScopesNotPresentViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI64ClinicalSharingOnboardingNecessaryScopesNotPresentViewController_account));
}

@end