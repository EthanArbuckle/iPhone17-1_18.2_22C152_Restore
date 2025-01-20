@interface EmergencyAccessBuddyMedicalIDViewController
- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (char)medicalIDViewControllerDidCancel:(uint64_t)a3;
- (void)didTapCancel:(id)a3;
- (void)didTapNext:(id)a3;
- (void)medicalIDViewControllerDidUpdate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation EmergencyAccessBuddyMedicalIDViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmergencyAccessBuddyMedicalIDViewController();
  id v2 = v5.receiver;
  [(OBTableWelcomeController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_navigationItem, v5.receiver, v5.super_class);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_didTapCancel_);
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);

  sub_1AD556D50();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EmergencyAccessBuddyMedicalIDViewController();
  id v4 = v6.receiver;
  [(OBBaseWelcomeController *)&v6 viewDidAppear:v3];
  if ((v4[OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_didShowEditMedicalIDOnViewDidAppear] & 1) == 0)
  {
    int v5 = v4[OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_flow + 8];
    if (v5 != 1
      && (v5 != 2
       || *(void *)&v4[OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_flow] != 1))
    {
      v4[OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_didShowEditMedicalIDOnViewDidAppear] = 1;
      sub_1AD62D9E0();
    }
  }
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
  BOOL v3 = [(OBTableWelcomeController *)v2 tableView];
  if (v3)
  {
    id v4 = v3;
    [(UITableView *)v3 contentSize];
    double v6 = v5;

    if (v6 != *(double *)((char *)&v2->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_tableViewHeight))
      sub_1AD62E42C();
    v7.receiver = v2;
    v7.super_class = (Class)type metadata accessor for EmergencyAccessBuddyMedicalIDViewController();
    [(OBTableWelcomeController *)&v7 viewDidLayoutSubviews];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_medicalIDCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_medicalIDViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController____lazy_storage___tableViewHeightLayoutConstraint));
  sub_1AD2A4280(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_flow), *((unsigned char *)&self->super.super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_flow));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_emergencyStatus;
  sub_1AD2A4294((uint64_t)v3);
}

- (char)medicalIDViewControllerDidCancel:(uint64_t)a3
{
  if (!a3
    || *(void *)&result[OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_medicalIDViewController] != a3)
  {
    return (char *)objc_msgSend(result, sel_dismissViewControllerAnimated_completion_, 1, 0);
  }
  return result;
}

- (void)medicalIDViewControllerDidUpdate:(id)a3
{
  if (a3
    && *(id *)((char *)&self->super.super.super.super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI43EmergencyAccessBuddyMedicalIDViewController_medicalIDViewController) == a3)
  {
    id v5 = self;
    id v4 = a3;
    sub_1AD62E42C();
  }
}

@end