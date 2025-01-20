@interface String:
- (uint64_t)DMFPolicy;
- (uint64_t)NSNumber;
- (unint64_t)Data;
- (unint64_t)String;
@end

@implementation String:

- (uint64_t)DMFPolicy
{
  return swift_release();
}

- (uint64_t)NSNumber
{
  uint64_t v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    type metadata accessor for NSError(0, (unint64_t *)&lazy cache variable for type metadata for NSNumber);
    uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  id v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

- (unint64_t)String
{
  unint64_t result = OUTLINED_FUNCTION_87_4(a1);
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

- (unint64_t)Data
{
  unint64_t result = OUTLINED_FUNCTION_87_4(a1);
  if (!result)
  {
    OUTLINED_FUNCTION_88_4();
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Data]);
    v2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, v1);
  }
  return result;
}

@end