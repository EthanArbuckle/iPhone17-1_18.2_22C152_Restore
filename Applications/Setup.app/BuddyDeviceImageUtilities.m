@interface BuddyDeviceImageUtilities
+ (id)imageForDeviceModelWithModel:(id)a3 traitCollection:(id)a4;
- (_TtC5Setup25BuddyDeviceImageUtilities)init;
@end

@implementation BuddyDeviceImageUtilities

+ (id)imageForDeviceModelWithModel:(id)a3 traitCollection:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  id v8 = a4;
  id v9 = sub_100018DBC(v5, v7, v8);

  swift_bridgeObjectRelease();

  return v9;
}

- (_TtC5Setup25BuddyDeviceImageUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BuddyDeviceImageUtilities();
  return [(BuddyDeviceImageUtilities *)&v3 init];
}

@end