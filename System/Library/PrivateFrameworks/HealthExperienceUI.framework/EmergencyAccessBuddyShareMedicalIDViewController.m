@interface EmergencyAccessBuddyShareMedicalIDViewController
- (_TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapCancel:(id)a3;
- (void)didTapDontShare:(id)a3;
- (void)didTapLearnMore:(id)a3;
- (void)didTapShare:(id)a3;
- (void)viewDidLoad;
@end

@implementation EmergencyAccessBuddyShareMedicalIDViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmergencyAccessBuddyShareMedicalIDViewController();
  id v2 = v5.receiver;
  [(OBBaseWelcomeController *)&v5 viewDidLoad];
  sub_1AD69BD64();
  id v3 = objc_msgSend(v2, sel_navigationItem, v5.receiver, v5.super_class);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_didTapCancel_);
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);

  sub_1AD69C8F4();
}

- (void)didTapLearnMore:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  id v5 = objc_msgSend(self, sel_makeViewController);
  [(EmergencyAccessBuddyShareMedicalIDViewController *)v4 presentViewController:v5 animated:1 completion:0];

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
}

- (void)didTapCancel:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD69C4B0();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)didTapShare:(id)a3
{
}

- (void)didTapDontShare:(id)a3
{
}

- (_TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_medicalIDCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_shareButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_dontShareButton));
  sub_1AD2A4280(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_flow), *((unsigned char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_flow));
  id v3 = (char *)self
     + OBJC_IVAR____TtC18HealthExperienceUI48EmergencyAccessBuddyShareMedicalIDViewController_emergencyStatus;
  sub_1AD2A4294((uint64_t)v3);
}

@end