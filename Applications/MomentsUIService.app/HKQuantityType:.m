@interface HKQuantityType:
- (void)HKUnit;
@end

@implementation HKQuantityType:

- (void)HKUnit
{
  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  type metadata accessor for UIApplication(0, (unint64_t *)&lazy cache variable for type metadata for HKQuantityType);
  type metadata accessor for UIApplication(0, (unint64_t *)&lazy cache variable for type metadata for HKUnit);
  lazy protocol witness table accessor for type HKQuantityType and conformance NSObject();
  uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();
}

@end