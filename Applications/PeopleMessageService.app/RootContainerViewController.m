@interface RootContainerViewController
- (_TtC20PeopleMessageService27RootContainerViewController)initWithCoder:(id)a3;
- (_TtC20PeopleMessageService27RootContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation RootContainerViewController

- (void)loadView
{
  v3 = self;
  v4 = self;
  id v5 = [v3 effectWithStyle:8];
  id v6 = [objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:v5];

  [(RootContainerViewController *)v4 setView:v6];
}

- (_TtC20PeopleMessageService27RootContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for RootContainerViewController();
  v9 = [(RootContainerViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC20PeopleMessageService27RootContainerViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for RootContainerViewController();
  return [(RootContainerViewController *)&v5 initWithCoder:a3];
}

@end