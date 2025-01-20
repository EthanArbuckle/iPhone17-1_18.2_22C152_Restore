@interface _AppStoreWidget
+ (void)invalidateAllWidgetsWithReason:(id)a3;
- (_TtC9appstored15_AppStoreWidget)init;
@end

@implementation _AppStoreWidget

+ (void)invalidateAllWidgetsWithReason:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_100040518(v3, v4);
  swift_bridgeObjectRelease();
}

- (_TtC9appstored15_AppStoreWidget)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for _AppStoreWidget();
  return [(_AppStoreWidget *)&v3 init];
}

@end