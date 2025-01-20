@interface SVSInterventionViewController
- (SVSInterventionViewController)initWithCoder:(id)a3;
- (SVSInterventionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_willAppearInRemoteViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didConfirmForInterventionViewController:(id)a3;
- (void)didContactSomeoneForInterventionViewController:(id)a3;
- (void)didRejectForInterventionViewController:(id)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
@end

@implementation SVSInterventionViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(void))sub_100069EE0;
  }
  id v7 = a3;
  v8 = self;
  sub_1000AF7B8(a3, v6);
  sub_100017C38((uint64_t)v6);
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_1000AFEB8(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 30;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for SVSInterventionViewController();
  [(SVSInterventionViewController *)&v2 viewDidLoad];
}

- (void)_willAppearInRemoteViewController
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SVSInterventionViewController();
  id v2 = v4.receiver;
  [(SVSBaseMainController *)&v4 _willAppearInRemoteViewController];
  v3 = (void *)sub_1000B0264();
  if (v3)
  {
    [v3 setAllowsAlertStacking:1];

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)didConfirmForInterventionViewController:(id)a3
{
}

- (void)didRejectForInterventionViewController:(id)a3
{
}

- (void)didContactSomeoneForInterventionViewController:(id)a3
{
  swift_unknownObjectRetain();
  objc_super v4 = self;
  sub_1000B1068();
  swift_unknownObjectRelease();
}

- (SVSInterventionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (SVSInterventionViewController *)sub_1000B04B0(v5, v7, a4);
}

- (SVSInterventionViewController)initWithCoder:(id)a3
{
  *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___SVSInterventionViewController_interventionViewController] = 0;
  *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___SVSInterventionViewController_interventionReplyAction] = 0;
  uint64_t v5 = &self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___SVSInterventionViewController_workflow];
  uint64_t v6 = enum case for SFInterventionWorkflow.receive(_:);
  uint64_t v7 = type metadata accessor for SFInterventionWorkflow();
  (*(void (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v7 - 8) + 104))(v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for SVSInterventionViewController();
  return [(SVSInterventionViewController *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  v3 = &self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___SVSInterventionViewController_workflow];
  uint64_t v4 = type metadata accessor for SFInterventionWorkflow();
  uint64_t v5 = *(void (**)(unsigned __int8 *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end