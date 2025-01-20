@interface BuddyAppStateManager
+ (id)currentAppStates;
+ (void)persist:(id)a3 to:(id)a4;
- (_TtC5Setup20BuddyAppStateManager)init;
@end

@implementation BuddyAppStateManager

+ (id)currentAppStates
{
  sub_100012FA8();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

+ (void)persist:(id)a3 to:(id)a4
{
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = a4;
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  id v7 = String._bridgeToObjectiveC()();
  [v5 setObject:isa forKey:v7 persistImmediately:1];

  swift_bridgeObjectRelease();
}

- (_TtC5Setup20BuddyAppStateManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BuddyAppStateManager();
  return [(BuddyAppStateManager *)&v3 init];
}

@end