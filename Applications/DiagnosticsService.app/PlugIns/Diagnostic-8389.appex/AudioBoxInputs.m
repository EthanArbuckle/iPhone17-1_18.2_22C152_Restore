@interface AudioBoxInputs
- (AudioBoxInputs)init;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
@end

@implementation AudioBoxInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  return sub_10000BE78((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___AudioBoxInputs_predicates);
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  uint64_t v4 = sub_100021870();
  v5 = self;
  LOBYTE(self) = sub_10000BA50(v4);

  swift_bridgeObjectRelease();
  return self & 1;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return sub_10000BE78((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___AudioBoxInputs_specifications);
}

- (AudioBoxInputs)init
{
  return (AudioBoxInputs *)sub_10000BEDC();
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

  swift_bridgeObjectRelease();
}

@end