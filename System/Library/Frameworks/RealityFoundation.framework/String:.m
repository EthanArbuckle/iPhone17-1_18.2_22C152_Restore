@interface String:
- (Class)NSObject;
- (id)String;
- (uint64_t)AnimationResource;
- (uint64_t)Any;
- (uint64_t)String;
- (unint64_t)Any;
- (unint64_t)AudioResource;
- (unint64_t)String;
@end

@implementation String:

- (uint64_t)AnimationResource
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

- (uint64_t)String
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

- (unint64_t)String
{
  unint64_t result = lazy protocol witness table cache variable for type [String : String]? and conformance <A> A?;
  if (!lazy protocol witness table cache variable for type [String : String]? and conformance <A> A?)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : String]?);
    lazy protocol witness table accessor for type [String : String] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : String] and conformance <> [A : B]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : String]? and conformance <A> A?);
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
    type metadata accessor for OS_os_log(0, (unint64_t *)&lazy cache variable for type metadata for NSObject);
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return v4.super.isa;
}

- (unint64_t)Any
{
  unint64_t result = lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : Any].Keys);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys);
  }
  return result;
}

- (uint64_t)Any
{
  return (*(uint64_t (**)(void))(v1 + 16))(*a1);
}

- (id)String
{
  uint64_t v24 = a2;
  uint64_t v25 = a5;
  id v23 = a4;
  uint64_t v7 = type metadata accessor for UUID();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *(uint64_t (**)(uint64_t, id, id, uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v7;
  uint64_t v13 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;
  swift_retain();
  id v17 = a3;
  id v18 = v23;
  v19 = (void *)v22(v24, v17, v18, v25, v10, v11, v13, v14, v16);

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v12);
  if (v19)
  {
    v20 = (void *)_convertErrorToNSError(_:)();
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (unint64_t)AudioResource
{
  unint64_t result = lazy protocol witness table cache variable for type [String : AudioResource].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [String : AudioResource].Keys and conformance [A : B].Keys)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String : AudioResource].Keys);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : AudioResource].Keys and conformance [A : B].Keys);
  }
  return result;
}

@end