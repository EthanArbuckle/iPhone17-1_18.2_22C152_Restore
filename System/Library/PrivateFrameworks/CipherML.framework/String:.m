@interface String:
- (Class)NSObject;
- (uint64_t)String;
- (uint64_t)UseCase;
- (unint64_t)Date;
- (unint64_t)UseCaseGroup;
@end

@implementation String:

- (uint64_t)String
{
  return swift_release();
}

- (Class)NSObject
{
  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    type metadata accessor for NSNumber(0, (unint64_t *)&lazy cache variable for type metadata for NSObject);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

- (uint64_t)UseCase
{
  uint64_t result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : UseCase]);
    a2();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

- (unint64_t)UseCaseGroup
{
  unint64_t result = lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : UseCaseGroup]);
    lazy protocol witness table accessor for type HE.SecurityLevel and conformance HE.SecurityLevel(&lazy protocol witness table cache variable for type UseCaseGroup and conformance UseCaseGroup, (void (*)(uint64_t))type metadata accessor for UseCaseGroup);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B]);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : UseCaseGroup]);
    lazy protocol witness table accessor for type HE.SecurityLevel and conformance HE.SecurityLevel(&lazy protocol witness table cache variable for type UseCaseGroup and conformance UseCaseGroup, (void (*)(uint64_t))type metadata accessor for UseCaseGroup);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : UseCaseGroup] and conformance <> [A : B]);
  }
  return result;
}

- (unint64_t)Date
{
  unint64_t result = lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Date]);
    lazy protocol witness table accessor for type ActiveUseCaseTracker and conformance ActiveUseCaseTracker(&lazy protocol witness table cache variable for type Date and conformance Date, MEMORY[0x263F07490]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B]);
  }
  return result;
}

{
  unint64_t result;

  unint64_t result = lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Date]);
    lazy protocol witness table accessor for type ActiveUseCaseTracker and conformance ActiveUseCaseTracker(&lazy protocol witness table cache variable for type Date and conformance Date, MEMORY[0x263F07490]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : Date] and conformance <> [A : B]);
  }
  return result;
}

@end