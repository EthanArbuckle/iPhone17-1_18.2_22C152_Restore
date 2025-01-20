@interface String:
- (uint64_t)AttributedString._AttributeValue;
- (uint64_t)Morphology._CustomPronoun;
@end

@implementation String:

- (uint64_t)AttributedString._AttributeValue
{
  return a1;
}

- (uint64_t)Morphology._CustomPronoun
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Morphology._CustomPronoun]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

@end