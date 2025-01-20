@interface String:
- (uint64_t)SQLDataType;
- (uint64_t)Schema;
- (uint64_t)StorableValue;
@end

@implementation String:

- (uint64_t)StorableValue
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

- (uint64_t)Schema
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Schema]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

- (uint64_t)SQLDataType
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : SQLDataType]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

@end