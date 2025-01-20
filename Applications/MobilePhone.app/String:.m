@interface String:
- (Class)NSObject;
- (unint64_t)NSObject;
@end

@implementation String:

- (unint64_t)NSObject
{
  unint64_t result = lazy protocol witness table cache variable for type [String : NSObject] and conformance [A : B];
  if (!lazy protocol witness table cache variable for type [String : NSObject] and conformance [A : B])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : NSObject]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : NSObject] and conformance [A : B]);
  }
  return result;
}

- (Class)NSObject
{
  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  uint64_t v3 = v1(v2);
  swift_release();
  if (v3)
  {
    type metadata accessor for VMAccount(0, &lazy cache variable for type metadata for NSObject);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

@end