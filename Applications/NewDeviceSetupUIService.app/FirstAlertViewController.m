@interface FirstAlertViewController
- (_TtC23NewDeviceSetupUIService24FirstAlertViewController)initWithCoder:(id)a3;
- (_TtC23NewDeviceSetupUIService24FirstAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation FirstAlertViewController

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for FirstAlertViewController();
  [(FirstAlertViewController *)&v2 viewDidLoad];
}

- (_TtC23NewDeviceSetupUIService24FirstAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FirstAlertViewController();
  v9 = [(FirstAlertViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC23NewDeviceSetupUIService24FirstAlertViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FirstAlertViewController();
  return [(FirstAlertViewController *)&v5 initWithCoder:a3];
}

@end