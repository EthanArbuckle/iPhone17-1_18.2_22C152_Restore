@interface ClinicalSharingOnboardingSharingHealthDataViewController
- (_TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (uint64_t)doneButtonTapped:(void *)a1;
- (void)viewDidLoad;
@end

@implementation ClinicalSharingOnboardingSharingHealthDataViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ClinicalSharingOnboardingSharingHealthDataViewController();
  id v2 = v6.receiver;
  [(OBBaseWelcomeController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_navigationItem, v6.receiver, v6.super_class);
  objc_msgSend(v3, sel_setHidesBackButton_animated_, 1, 0);

  id v4 = objc_msgSend(v2, sel_buttonTray);
  id v5 = sub_1C24605F4();
  objc_msgSend(v4, sel_addButton_, v5);

  sub_1C2460B80();
  sub_1C246283C();
}

- (uint64_t)doneButtonTapped:(void *)a1
{
  swift_unknownObjectRetain();
  id v2 = a1;
  sub_1C25501E0();
  swift_unknownObjectRelease();
  objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, 0);

  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v4);
}

- (_TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController_onboardingSession));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController_account));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController____lazy_storage___doneButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC15HealthRecordsUI56ClinicalSharingOnboardingSharingHealthDataViewController____lazy_storage___spinner);
}

@end