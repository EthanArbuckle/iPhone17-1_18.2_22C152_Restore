@interface MLProgress.Metric:
- (uint64_t)Double;
- (unint64_t)URL;
@end

@implementation MLProgress.Metric:

- (unint64_t)URL
{
  unint64_t result = lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [MLProgress.Metric : URL]);
    lazy protocol witness table accessor for type MLProgress.Metric and conformance MLProgress.Metric();
    lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x263F06EA8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B]);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [MLProgress.Metric : URL]);
    lazy protocol witness table accessor for type MLProgress.Metric and conformance MLProgress.Metric();
    lazy protocol witness table accessor for type URL and conformance URL(&lazy protocol witness table cache variable for type URL and conformance URL, MEMORY[0x263F06EA8]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [MLProgress.Metric : URL] and conformance <> [A : B]);
  }
  return result;
}

- (uint64_t)Double
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [MLProgress.Metric : Double]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

@end