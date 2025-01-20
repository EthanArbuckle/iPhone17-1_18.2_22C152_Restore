@interface (Double,
- (unint64_t)Double);
@end

@implementation (Double,

- (unint64_t)Double)
{
  uint64_t v2 = lazy protocol witness table cache variable for type [(Double, Double)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(Double, Double)] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(Double, Double)]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [(Double, Double)] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

@end