@interface BoopToMeetFlowViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BoopToMeetFlowViewController)initWithCoder:(id)a3;
- (BoopToMeetFlowViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)handleButtonActions:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BoopToMeetFlowViewController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void))sub_100069EE0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_1000A6094(a3, v6, v7);
  sub_100017C38((uint64_t)v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = self;
  sub_1000A6470(v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000A6D58(a3);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = qword_1001C7090;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100012C4C(v6, (uint64_t)qword_1001CAA60);
  uint64_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "BoopToMeetFlowViewController: viewDidLoad", v9, 2u);
    swift_slowDealloc();
  }

  v10.receiver = v5;
  v10.super_class = ObjectType;
  [(BoopToMeetFlowViewController *)&v10 viewDidLoad];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_100017EF4(0, (unint64_t *)&qword_1001C9600);
    sub_1000A7C34((unint64_t *)&qword_1001CAF70, (unint64_t *)&qword_1001C9600);
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_1000A70C4(v4);

  swift_bridgeObjectRelease();
}

- (BoopToMeetFlowViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___BoopToMeetFlowViewController_replyAction] = 0;
    id v8 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___BoopToMeetFlowViewController_replyAction] = 0;
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  objc_super v10 = [(BoopToMeetFlowViewController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (BoopToMeetFlowViewController)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(void *)&self->super.SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR___BoopToMeetFlowViewController_replyAction] = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(BoopToMeetFlowViewController *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end