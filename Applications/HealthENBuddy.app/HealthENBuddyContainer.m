@interface HealthENBuddyContainer
- (BOOL)shouldAutorotate;
- (_TtC13HealthENBuddy22HealthENBuddyContainer)initWithCoder:(id)a3;
- (_TtC13HealthENBuddy22HealthENBuddyContainer)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HealthENBuddyContainer

- (BOOL)shouldAutorotate
{
  return 0;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HealthENBuddyContainer();
  id v2 = v6.receiver;
  [(HealthENBuddyContainer *)&v6 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    id v5 = [self clearColor];
    [v4 setBackgroundColor:v5];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100004868(a3);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  objc_super v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    objc_super v6 = (void (*)(void))sub_100008954;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_100006790(a3, v6, v7);
  sub_1000083F8((uint64_t)v6);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  objc_super v6 = (uint64_t (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    objc_super v6 = (uint64_t (*)(uint64_t))sub_100008440;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_100007E50(v6, v7);
  sub_1000083F8((uint64_t)v6);
}

- (void)handleButtonActions:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_100008774(0, &qword_1000120A8);
    sub_100008388();
    uint64_t v3 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  id v5 = self;
  sub_1000080F4(v3);

  swift_bridgeObjectRelease();
}

- (_TtC13HealthENBuddy22HealthENBuddyContainer)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region] = 0;
    self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent] = 0;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region] = 0;
    self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent] = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for HealthENBuddyContainer();
  v9 = [(HealthENBuddyContainer *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC13HealthENBuddy22HealthENBuddyContainer)initWithCoder:(id)a3
{
  *(void *)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_region] = 0;
  self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC13HealthENBuddy22HealthENBuddyContainer_didPresent] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HealthENBuddyContainer();
  return [(HealthENBuddyContainer *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end