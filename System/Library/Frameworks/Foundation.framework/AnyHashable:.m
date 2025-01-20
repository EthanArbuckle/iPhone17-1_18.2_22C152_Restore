@interface AnyHashable:
- (unint64_t)AnyHashable;
@end

@implementation AnyHashable:

- (unint64_t)AnyHashable
{
  unint64_t result = lazy protocol witness table cache variable for type [AnyHashable : AnyHashable] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [AnyHashable : AnyHashable] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [AnyHashable : AnyHashable]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [AnyHashable : AnyHashable] and conformance <> [A : B]);
  }
  return result;
}

@end