@interface RootViewController
- (_TtC13FTMInternal_418RootViewController)initWithCoder:(id)a3;
- (_TtC13FTMInternal_418RootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation RootViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RootViewController();
  id v2 = v7.receiver;
  [(RootViewController *)&v7 viewDidLoad];
  id v3 = [v2 view];
  if (v3)
  {
    v4 = v3;
    NSString v5 = String._bridgeToObjectiveC()();
    id v6 = [self colorNamed:v5];

    [v4 setBackgroundColor:v6];
  }
  else
  {
    __break(1u);
  }
}

- (_TtC13FTMInternal_418RootViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for RootViewController();
  v9 = [(RootViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC13FTMInternal_418RootViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootViewController();
  return [(RootViewController *)&v5 initWithCoder:a3];
}

@end