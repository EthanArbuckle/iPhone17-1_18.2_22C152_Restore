@interface String:
- (uint64_t)Any;
- (uint64_t)String;
- (unint64_t)Any;
- (void)Any;
- (void)Encodable;
- (void)String;
@end

@implementation String:

- (unint64_t)Any
{
  unint64_t result = lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys;
  if (!lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys)
  {
    type metadata accessor for [String : Any](255, &lazy cache variable for type metadata for [String : Any].Keys, MEMORY[0x1E4FBAE20]);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String : Any].Keys and conformance [A : B].Keys);
  }
  return result;
}

- (void)Any
{
  if (!lazy cache variable for type metadata for [String : Any])
  {
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [String : Any]);
    }
  }
}

- (uint64_t)Any
{
  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2) {
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  swift_retain();
  id v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

- (void)Encodable
{
  if (!lazy cache variable for type metadata for [String : Encodable])
  {
    type metadata accessor for CVarArg(255, &lazy cache variable for type metadata for Encodable);
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [String : Encodable]);
    }
  }
}

- (void)String
{
  if (!lazy cache variable for type metadata for [String : String])
  {
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [String : String]);
    }
  }
}

- (uint64_t)String
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for [String : String]();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

@end