@interface EmergencyAccessBuddyNewMedicalIDViewController
- (_TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapCancel:(id)a3;
- (void)didTapNext:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation EmergencyAccessBuddyNewMedicalIDViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmergencyAccessBuddyNewMedicalIDViewController();
  id v2 = v5.receiver;
  [(OBBaseWelcomeController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_navigationItem, v5.receiver, v5.super_class);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_didTapCancel_);
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);

  sub_1AD556D50();
  sub_1AD556428();
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EmergencyAccessBuddyNewMedicalIDViewController();
  id v2 = (char *)v7.receiver;
  [(OBBaseWelcomeController *)&v7 viewDidLayoutSubviews];
  objc_msgSend(v2, sel_availableContentViewHeight, v7.receiver, v7.super_class);
  if (v3 > 120.0) {
    double v4 = v3;
  }
  else {
    double v4 = 120.0;
  }
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_medicalIDViewController], sel_preferredContentSize);
  if (v4 > v5) {
    double v6 = v4;
  }
  else {
    double v6 = v5;
  }
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_contentViewHeightConstraint], sel_setConstant_, v6);
}

- (void)didTapCancel:(id)a3
{
}

- (void)didTapNext:(id)a3
{
}

- (_TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_medicalIDViewController));
  sub_1AD2A4280(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_flow), *((unsigned char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_flow));
  sub_1AD2A4294((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_emergencyStatus);
  double v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI46EmergencyAccessBuddyNewMedicalIDViewController_contentViewHeightConstraint);
}

@end