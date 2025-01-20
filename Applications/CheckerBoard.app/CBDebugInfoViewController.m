@interface CBDebugInfoViewController
+ (NSString)CBDebugInfoViewDismissButtonPressedNotification;
- (CBDebugInfoViewController)initWithCoder:(id)a3;
- (CBDebugInfoViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation CBDebugInfoViewController

+ (NSString)CBDebugInfoViewDismissButtonPressedNotification
{
  if (qword_10008F7B8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1000902F8;

  return (NSString *)v2;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10003D510();
}

- (CBDebugInfoViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for DebugInfoViewController();
  v9 = [(CBDebugInfoViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (CBDebugInfoViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DebugInfoViewController();
  return [(CBDebugInfoViewController *)&v5 initWithCoder:a3];
}

@end