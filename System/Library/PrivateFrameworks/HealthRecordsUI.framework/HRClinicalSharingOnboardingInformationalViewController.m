@interface HRClinicalSharingOnboardingInformationalViewController
- (HRClinicalSharingOnboardingInformationalViewController)initWithOnboardingSession:(id)a3 flowType:(int64_t)a4 selectedAccount:(id)a5 delegate:(id)a6;
- (HRClinicalSharingOnboardingInformationalViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (HRClinicalSharingOnboardingInformationalViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)cancelButtonTapped:(id)a3;
- (void)dealloc;
- (void)didReceiveClinicalAccountOnboardingCompletionWithNotification:(id)a3;
- (void)didReceiveOAuthCompletionWithNotification:(id)a3;
- (void)nextButtonTappedForAccountLogin:(id)a3;
- (void)nextButtonTappedForAuthorizationSelection:(id)a3;
- (void)nextButtonTappedForProviderSearch:(id)a3;
- (void)skipButtonTappedForAuthorizationSelection:(id)a3;
- (void)viewDidLoad;
@end

@implementation HRClinicalSharingOnboardingInformationalViewController

- (HRClinicalSharingOnboardingInformationalViewController)initWithOnboardingSession:(id)a3 flowType:(int64_t)a4 selectedAccount:(id)a5 delegate:(id)a6
{
  v9 = (char *)a3;
  id v10 = a5;
  swift_unknownObjectRetain();
  return (HRClinicalSharingOnboardingInformationalViewController *)ClinicalSharingOnboardingInformationalViewController.init(onboardingSession:flowType:selectedAccount:delegate:)(v9, (char *)a4, a5, (uint64_t)a6);
}

- (void)dealloc
{
  if (*(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController_accountStateCancellable))
  {
    v3 = self;
    swift_retain();
    sub_1C254EA00();
    swift_release();
  }
  else
  {
    v4 = self;
  }
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClinicalSharingOnboardingInformationalViewController();
  [(HRClinicalSharingOnboardingInformationalViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController_onboardingSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController_selectedAccount));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController_gatewayProxyToTry));
  sub_1C2201FD8((uint64_t)self + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController_delegate);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___HRClinicalSharingOnboardingInformationalViewController____lazy_storage___logoView);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1C247DBDC();
}

- (void)nextButtonTappedForProviderSearch:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1C25501E0();
  swift_unknownObjectRelease();
  sub_1C247F5C0();

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v5);
}

- (void)nextButtonTappedForAccountLogin:(id)a3
{
}

- (void)nextButtonTappedForAuthorizationSelection:(id)a3
{
}

- (void)skipButtonTappedForAuthorizationSelection:(id)a3
{
}

- (void)cancelButtonTapped:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1C25501E0();
  swift_unknownObjectRelease();
  [(HRClinicalSharingOnboardingInformationalViewController *)v4 dismissViewControllerAnimated:1 completion:0];

  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v5);
}

- (HRClinicalSharingOnboardingInformationalViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (HRClinicalSharingOnboardingInformationalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HRClinicalSharingOnboardingInformationalViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (HRClinicalSharingOnboardingInformationalViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)didReceiveOAuthCompletionWithNotification:(id)a3
{
}

- (void)didReceiveClinicalAccountOnboardingCompletionWithNotification:(id)a3
{
}

@end