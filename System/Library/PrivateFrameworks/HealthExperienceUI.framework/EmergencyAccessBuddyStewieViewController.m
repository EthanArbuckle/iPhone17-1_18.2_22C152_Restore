@interface EmergencyAccessBuddyStewieViewController
- (_TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapCancel:(id)a3;
- (void)didTapLearnMore:(id)a3;
- (void)didTapNext:(id)a3;
- (void)viewDidLoad;
@end

@implementation EmergencyAccessBuddyStewieViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EmergencyAccessBuddyStewieViewController();
  id v2 = v5.receiver;
  [(OBBaseWelcomeController *)&v5 viewDidLoad];
  sub_1AD700790();
  id v3 = objc_msgSend(v2, sel_navigationItem, v5.receiver, v5.super_class);
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB14A8]), sel_initWithBarButtonSystemItem_target_action_, 1, v2, sel_didTapCancel_);
  objc_msgSend(v3, sel_setRightBarButtonItem_, v4);

  sub_1AD700E50();
}

- (void)didTapNext:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  (*(void (**)(_TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController *))((char *)&v4->super.super.super.super.super.isa
                                                                                               + OBJC_IVAR____TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController_nextVCHandler))(v4);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)didTapLearnMore:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  objc_msgSend(self, sel_presentStewieLearnMoreLinkOnViewController_, v4);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (void)didTapCancel:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD7010F8();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController_healthStore));
  sub_1AD2A4280(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController_flow), *((unsigned char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController_flow));
  sub_1AD2A4294((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI40EmergencyAccessBuddyStewieViewController_emergencyStatus);
  swift_release();
}

@end