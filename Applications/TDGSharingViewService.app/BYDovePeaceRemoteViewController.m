@interface BYDovePeaceRemoteViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BYDovePeaceRemoteViewController)initWithCoder:(id)a3;
- (BYDovePeaceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)_willAppearInRemoteViewController;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleButtonActions:(id)a3;
- (void)handleHomeButtonPressed;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BYDovePeaceRemoteViewController

- (void)dealloc
{
  uint64_t v2 = qword_100045E50;
  v3 = self;
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v4 = type metadata accessor for Logger();
  sub_100005EC0(v4, (uint64_t)qword_100048E40);
  v5 = Logger.logObject.getter();
  os_log_type_t v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "BYDovePeaceRemoteViewController deinit", v7, 2u);
    swift_slowDealloc();
  }

  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for BYDovePeaceRemoteViewController();
  [(BYDovePeaceRemoteViewController *)&v8 dealloc];
}

- (void).cxx_destruct
{
  swift_release();

  swift_release();
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  os_log_type_t v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    os_log_type_t v6 = (void (*)(uint64_t))sub_10001EC40;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_10001C6A0((char *)a3, v6, v7);
  sub_10000AE58((uint64_t)v6);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  os_log_type_t v6 = (void (*)(void))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    os_log_type_t v6 = (void (*)(void))sub_10001EAF4;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_10001CFE0(a3, v6, v7);
  sub_10000AE58((uint64_t)v6);
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLoad
{
  uint64_t v2 = self;
  sub_10001D408();
}

- (void)_willAppearInRemoteViewController
{
  uint64_t v2 = self;
  sub_10001D638();
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10001D77C(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_10001DB58(a3);
}

- (void)handleButtonActions:(id)a3
{
  if (a3)
  {
    sub_10001EA1C();
    sub_10001EA5C();
    uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
  }
  v5 = self;
  sub_10001DF14(v4);

  swift_bridgeObjectRelease();
}

- (void)handleHomeButtonPressed
{
  uint64_t v2 = self;
  sub_10001E354();
}

- (BYDovePeaceRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (BYDovePeaceRemoteViewController *)sub_10001E5BC(v5, v7, a4);
}

- (BYDovePeaceRemoteViewController)initWithCoder:(id)a3
{
  return (BYDovePeaceRemoteViewController *)sub_10001E814(a3);
}

@end