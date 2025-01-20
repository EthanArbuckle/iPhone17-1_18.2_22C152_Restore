@interface CNSecureContactViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC9AirDropUI29CNSecureContactViewController)initWithCoder:(id)a3;
- (_TtC9AirDropUI29CNSecureContactViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation CNSecureContactViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC9AirDropUI29CNSecureContactViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  v11.super_class = (Class)type metadata accessor for CNSecureContactViewController();
  v9 = [(CNSecureContactViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC9AirDropUI29CNSecureContactViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CNSecureContactViewController();
  return [(CNSecureContactViewController *)&v5 initWithCoder:a3];
}

@end