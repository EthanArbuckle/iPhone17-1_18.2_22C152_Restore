@interface MicrophoneTestInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (MicrophoneTestInputs)init;
@end

@implementation MicrophoneTestInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  return sub_10000C4C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MicrophoneTestInputs_predicates);
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  uint64_t v4 = sub_1000163E0();
  v5 = self;
  LOBYTE(self) = sub_10000BCEC(v4);

  swift_bridgeObjectRelease();
  return self & 1;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return sub_10000C4C4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___MicrophoneTestInputs_specifications);
}

- (MicrophoneTestInputs)init
{
  return (MicrophoneTestInputs *)sub_10000C528();
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