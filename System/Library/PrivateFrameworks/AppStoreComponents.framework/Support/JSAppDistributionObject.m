@interface JSAppDistributionObject
- (BOOL)isAppDistributionEligibleForCurrentDevice:(id)a3;
- (JSValue)distributorPriorityList;
- (_TtC19appstorecomponentsd23JSAppDistributionObject)init;
- (id)appAvailabilityWithDistributorToAppIds:(id)a3;
@end

@implementation JSAppDistributionObject

- (BOOL)isAppDistributionEligibleForCurrentDevice:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  if ((unint64_t)_findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100184A18, v8) <= 1) {
    os_eligibility_get_domain_answer();
  }

  swift_bridgeObjectRelease();
  return 0;
}

- (JSValue)distributorPriorityList
{
  sub_1000D70FC();
  v3 = self;
  uint64_t v4 = (void *)static JSContext.requiredCurrent.getter();
  v5 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  return (JSValue *)v5;
}

- (id)appAvailabilityWithDistributorToAppIds:(id)a3
{
  sub_10002EB60((uint64_t *)&unk_1001A45C0);
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000D70FC();
  uint64_t v4 = self;
  v5 = (void *)static JSContext.requiredCurrent.getter();
  v6 = (void *)JSContext.propagateErrorsToExceptions(_:)();

  swift_bridgeObjectRelease();

  return v6;
}

- (_TtC19appstorecomponentsd23JSAppDistributionObject)init
{
  result = (_TtC19appstorecomponentsd23JSAppDistributionObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end