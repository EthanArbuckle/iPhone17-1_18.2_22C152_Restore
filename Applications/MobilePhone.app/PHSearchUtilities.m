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
  v9 = specialized static SearchUtilities.matchedPhoneNumber(for:searchText:)(v8, v5, v7);

  swift_bridgeObjectRelease();

  return v9;
}

+ (BOOL)matchedProperties:(id)a3 contains:(id)a4
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  id v8 = (void *)specialized Sequence.compactMap<A>(_:)(v4);
  LOBYTE(v5) = specialized Sequence<>.contains(_:)(v5, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (PHSearchUtilities)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(PHSearchUtilities *)&v3 init];
}

@end