@interface VSRootViewController
- (void)dealloc;
- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4;
- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4;
- (void)viewDidLoad;
@end

@implementation VSRootViewController

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v5 removeObserver:v6];

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for VSRootViewController();
  [(VSRootViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  VSRootViewController.viewDidLoad()();
}

- (void)historicalNotificationService:(id)a3 didUpdateTimestamp:(id)a4
{
  uint64_t v4 = sub_10000761C((uint64_t *)&unk_10002BF80);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  objc_super v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000076B0(0, &qword_10002CB10);
  static Measurement._unconditionallyBridgeFromObjectiveC(_:)();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)historicalNotificationService:(id)a3 didUpdateHidden:(BOOL)a4
{
  id v5 = a3;
  uint64_t v6 = self;
  _s12AutoSettings20VSRootViewControllerC29historicalNotificationService_15didUpdateHiddenySo013CAFHistoricalG0C_SbtF_0();
}

@end