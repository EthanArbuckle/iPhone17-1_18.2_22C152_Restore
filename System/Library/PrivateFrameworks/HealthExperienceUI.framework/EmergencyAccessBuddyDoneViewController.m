@interface EmergencyAccessBuddyDoneViewController
- (_TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapDone:(id)a3;
- (void)viewDidLoad;
@end

@implementation EmergencyAccessBuddyDoneViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmergencyAccessBuddyDoneViewController();
  id v2 = v3.receiver;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  sub_1AD5C9694();
  sub_1AD5C97E8();
}

- (void)didTapDone:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD5CA2F8();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1AD2A4280(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController_flow), *((unsigned char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController_flow));
  sub_1AD2A4294((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController_emergencyStatus);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController_stewieStateMonitor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController____lazy_storage___queue));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController____lazy_storage___reviewMedicalIDReminderBullet));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController____lazy_storage___stewieTryOutModeBullet));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController____lazy_storage___stewieTryOutModeView));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI38EmergencyAccessBuddyDoneViewController____lazy_storage___stewieTryOutFootnote);
}

@end