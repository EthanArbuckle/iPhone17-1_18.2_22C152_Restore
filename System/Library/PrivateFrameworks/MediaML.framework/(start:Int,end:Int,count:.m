@interface (start:Int,end:Int,count:
- (unint64_t)Int);
- (void)Int);
@end

@implementation (start:Int,end:Int,count:

- (void)Int)
{
}

- (unint64_t)Int)
{
  uint64_t v2 = lazy protocol witness table cache variable for type [(start: Int, end: Int, count: Int)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(start: Int, end: Int, count: Int)] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(start: Int, end: Int, count: Int)]);
    unint64_t WitnessTable = swift_getWitnessTable();
    atomic_store(WitnessTable, (unint64_t *)&lazy protocol witness table cache variable for type [(start: Int, end: Int, count: Int)] and conformance [A]);
    return WitnessTable;
  }
  return v2;
}

@end