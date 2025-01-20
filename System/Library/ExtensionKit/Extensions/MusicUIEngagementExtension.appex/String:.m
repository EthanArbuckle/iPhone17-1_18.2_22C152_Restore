@interface String:
- (unint64_t)ODJResponse.PropertyIdentifierResponse;
- (unint64_t)PropertyIdentifierRequest;
@end

@implementation String:

- (unint64_t)ODJResponse.PropertyIdentifierResponse
{
  unint64_t result = lazy protocol witness table cache variable for type [String : ODJResponse.PropertyIdentifierResponse] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : ODJResponse.PropertyIdentifierResponse] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : ODJResponse.PropertyIdentifierResponse]);
    lazy protocol witness table accessor for type ODJResponse.PropertyIdentifierResponse and conformance ODJResponse.PropertyIdentifierResponse();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : ODJResponse.PropertyIdentifierResponse] and conformance <> [A : B]);
  }
  return result;
}

- (unint64_t)PropertyIdentifierRequest
{
  unint64_t result = lazy protocol witness table cache variable for type [String : PropertyIdentifierRequest] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : PropertyIdentifierRequest] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : PropertyIdentifierRequest]);
    lazy protocol witness table accessor for type PropertyIdentifierRequest and conformance PropertyIdentifierRequest();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : PropertyIdentifierRequest] and conformance <> [A : B]);
  }
  return result;
}

@end