@interface (predicted:String,label:
- (unint64_t)String);
@end

@implementation (predicted:String,label:

- (unint64_t)String)
{
  unint64_t result = lazy protocol witness table cache variable for type [(predicted: String, label: String)] and conformance [A];
  if (!lazy protocol witness table cache variable for type [(predicted: String, label: String)] and conformance [A])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [(predicted: String, label: String)]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [(predicted: String, label: String)] and conformance [A]);
  }
  return result;
}

@end