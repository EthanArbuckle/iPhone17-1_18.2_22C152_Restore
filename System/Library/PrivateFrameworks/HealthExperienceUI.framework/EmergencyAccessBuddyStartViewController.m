@interface EmergencyAccessBuddyStartViewController
- (_TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapCancel:(id)a3;
- (void)didTapNext:(id)a3;
- (void)didTapReviewLater;
- (void)viewDidLoad;
@end

@implementation EmergencyAccessBuddyStartViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmergencyAccessBuddyStartViewController();
  id v2 = v5.receiver;
  [(OBBaseWelcomeController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_navigationItem, v5.receiver, v5.super_class);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_didTapCancel_);
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);

  sub_1AD2A2F48();
}

- (void)didTapCancel:(id)a3
{
}

- (void)didTapReviewLater
{
  id v2 = self;
  sub_1AD2A3700();
}

- (void)didTapNext:(id)a3
{
}

- (_TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController_healthStore));
  sub_1AD2A4280(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController_flow), *((unsigned char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController_flow));
  id v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI39EmergencyAccessBuddyStartViewController_emergencyStatus;
  sub_1AD2A4294((uint64_t)v3);
}

@end