@interface SelfServiceBaseNavigationController
- (_TtC11Diagnostics35SelfServiceBaseNavigationController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC11Diagnostics35SelfServiceBaseNavigationController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)viewDidLoad;
@end

@implementation SelfServiceBaseNavigationController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SelfServiceBaseNavigationController();
  id v2 = v6.receiver;
  [(SelfServiceBaseNavigationController *)&v6 viewDidLoad];
  id v3 = [v2 navigationItem];
  Class v4 = sub_1000E84D0();
  [v3 setRightBarButtonItem:v4];

  id v5 = [v2 scrollView];
  [v5 setShowsVerticalScrollIndicator:0];
}

- (_TtC11Diagnostics35SelfServiceBaseNavigationController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  if (!a4)
  {
    uint64_t v13 = 0;
    if (a5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v14 = 0;
    uint64_t v16 = 0;
    return (_TtC11Diagnostics35SelfServiceBaseNavigationController *)sub_1000E8E2C(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
  }
  a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (!a5) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  return (_TtC11Diagnostics35SelfServiceBaseNavigationController *)sub_1000E8E2C(v9, v11, (uint64_t)a4, v13, v14, v16, a6);
}

- (_TtC11Diagnostics35SelfServiceBaseNavigationController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    a4 = v10;
  }
  id v11 = a5;
  NSString v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (a4)
  {
    NSString v13 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v13 = 0;
  }
  v16.receiver = self;
  v16.super_class = (Class)type metadata accessor for SelfServiceBaseNavigationController();
  uint64_t v14 = [(SelfServiceBaseNavigationController *)&v16 initWithTitle:v12 detailText:v13 icon:v11 contentLayout:a6];

  return v14;
}

@end