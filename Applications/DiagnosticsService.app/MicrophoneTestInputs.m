@interface MicrophoneTestInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (MicrophoneTestInputs)init;
@end

@implementation MicrophoneTestInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  return sub_100002868((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MicrophoneTestInputs_predicates);
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  LOBYTE(self) = sub_100002090(v4);

  swift_bridgeObjectRelease();
  return self & 1;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return sub_100002868((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MicrophoneTestInputs_specifications);
}

- (MicrophoneTestInputs)init
{
  return (MicrophoneTestInputs *)sub_1000028CC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end