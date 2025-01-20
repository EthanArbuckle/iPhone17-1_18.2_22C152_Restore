@interface String:
- (uint64_t)Any;
- (unint64_t)Any;
@end

@implementation String:

- (uint64_t)Any
{
  v4 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v2 = a2;
  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v4();
  swift_bridgeObjectRelease();

  return swift_release();
}

- (unint64_t)Any
{
  uint64_t v2 = lazy protocol witness table cache variable for type [String : Any] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [String : Any] and conformance [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Any]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [String : Any] and conformance [A : B]);
    return WitnessTable;
  }
  return v2;
}

@end