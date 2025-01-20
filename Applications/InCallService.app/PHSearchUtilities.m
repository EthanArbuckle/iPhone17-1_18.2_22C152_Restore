@interface PHSearchUtilities
+ (BOOL)matchedProperties:(id)a3 contains:(id)a4;
+ (id)matchedPhoneNumberFor:(id)a3 searchText:(id)a4;
- (PHSearchUtilities)init;
@end

@implementation PHSearchUtilities

+ (id)matchedPhoneNumberFor:(id)a3 searchText:(id)a4
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;
  id v8 = a3;
  v9 = sub_1001B7184(v8, v5, v7);

  swift_bridgeObjectRelease();

  return v9;
}

+ (BOOL)matchedProperties:(id)a3 contains:(id)a4
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1001B6F28(v4, v5, v6);
  char v8 = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (PHSearchUtilities)init
{
  return (PHSearchUtilities *)sub_1001831FC();
}

@end