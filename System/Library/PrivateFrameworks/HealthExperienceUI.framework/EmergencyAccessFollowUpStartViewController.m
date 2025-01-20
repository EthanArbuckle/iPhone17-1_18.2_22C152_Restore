@interface EmergencyAccessFollowUpStartViewController
- (_TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)didTapNext:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation EmergencyAccessFollowUpStartViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmergencyAccessFollowUpStartViewController();
  v2 = (char *)v3.receiver;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  sub_1AD42A768(*(void **)&v2[OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_animationView]);
  sub_1AD42AAB4();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EmergencyAccessFollowUpStartViewController();
  v4 = (char *)v7.receiver;
  [(OBBaseWelcomeController *)&v7 viewDidAppear:v3];
  id v5 = objc_msgSend(v4, sel_navigationController, v7.receiver, v7.super_class);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_setNavigationBarHidden_, 1);
  }
  (*(void (**)(void))((*MEMORY[0x1E4FBC8C8] & **(void **)&v4[OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_animationView])
                    + 0x138))();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for EmergencyAccessFollowUpStartViewController();
  v4 = (char *)v8.receiver;
  id v5 = [(EmergencyAccessFollowUpStartViewController *)&v8 viewDidDisappear:v3];
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & **(void **)&v4[OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_animationView])
                             + 0x148))(v5);
  v6 = (char *)objc_msgSend(v4, sel_navigationController, v8.receiver, v8.super_class);
  if (v6)
  {
    objc_super v7 = v6;
    objc_msgSend(v6, sel_setNavigationBarHidden_, 0);

    v4 = v7;
  }
}

- (void)didTapNext:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1AD7404B0();
  swift_unknownObjectRelease();
  sub_1AD42AC10();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v5);
}

- (_TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_healthStore));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_animationView));
  sub_1AD2A4280(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_flow), *((unsigned char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_flow));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI42EmergencyAccessFollowUpStartViewController_emergencyStatus;
  sub_1AD2A4294((uint64_t)v3);
}

@end