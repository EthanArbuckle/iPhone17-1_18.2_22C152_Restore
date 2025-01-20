@interface String:
- (Class)NSObject;
- (uint64_t)Any;
- (unint64_t)ShazamEvent;
- (unint64_t)VenueElement;
@end

@implementation String:

- (Class)NSObject
{
  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    type metadata accessor for NSObject();
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (uint64_t)Any
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v1(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

- (unint64_t)ShazamEvent
{
  unint64_t result = lazy protocol witness table cache variable for type [String : ShazamEvent] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : ShazamEvent] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : ShazamEvent]);
    _s10Foundation4DateVACSLAAWlTm_0(&lazy protocol witness table cache variable for type ShazamEvent and conformance ShazamEvent, (void (*)(uint64_t))type metadata accessor for ShazamEvent);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : ShazamEvent] and conformance <> [A : B]);
  }
  return result;
}

- (unint64_t)VenueElement
{
  unint64_t result = lazy protocol witness table cache variable for type [String : VenueElement] and conformance <> [A : B];
  if (!lazy protocol witness table cache variable for type [String : VenueElement] and conformance <> [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : VenueElement]);
    lazy protocol witness table accessor for type VenueElement and conformance VenueElement();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : VenueElement] and conformance <> [A : B]);
  }
  return result;
}

@end