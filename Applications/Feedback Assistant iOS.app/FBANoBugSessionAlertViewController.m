@interface FBANoBugSessionAlertViewController
+ (void)showInController:(id)a3 forDevice:(id)a4;
- (_TtC18Feedback_Assistant34FBANoBugSessionAlertViewController)initWithCoder:(id)a3;
- (_TtC18Feedback_Assistant34FBANoBugSessionAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation FBANoBugSessionAlertViewController

+ (void)showInController:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  sub_1000596F4(v5);
}

- (_TtC18Feedback_Assistant34FBANoBugSessionAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for FBANoBugSessionAlertViewController();
  v9 = [(FBANoBugSessionAlertViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18Feedback_Assistant34FBANoBugSessionAlertViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FBANoBugSessionAlertViewController();
  return [(FBANoBugSessionAlertViewController *)&v5 initWithCoder:a3];
}

@end