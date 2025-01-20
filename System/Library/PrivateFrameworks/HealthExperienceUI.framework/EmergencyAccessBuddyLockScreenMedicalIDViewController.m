@interface EmergencyAccessBuddyLockScreenMedicalIDViewController
- (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (void)didTapCancel:(id)a3;
- (void)didTapNext:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation EmergencyAccessBuddyLockScreenMedicalIDViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmergencyAccessBuddyLockScreenMedicalIDViewController();
  id v2 = v5.receiver;
  [(OBTableWelcomeController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_navigationItem, v5.receiver, v5.super_class);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_didTapCancel_);
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);

  sub_1AD556D50();
}

- (void)didTapCancel:(id)a3
{
}

- (void)didTapNext:(id)a3
{
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_1AD6EAC2C();
}

- (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController_medicalIDCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController_switchCell));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController_diffableDataSource));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController____lazy_storage___tableViewHeightLayoutConstraint));
  sub_1AD2A4280(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController_flow), *((unsigned char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController_flow));
  id v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI53EmergencyAccessBuddyLockScreenMedicalIDViewController_emergencyStatus;
  sub_1AD2A4294((uint64_t)v3);
}

@end