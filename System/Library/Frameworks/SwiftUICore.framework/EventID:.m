@interface EventID:
- (unint64_t)EventType;
- (void)EventType;
@end

@implementation EventID:

- (void)EventType
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

- (unint64_t)EventType
{
  unint64_t result = lazy protocol witness table cache variable for type External<[EventID : EventType]> and conformance External<A>;
  if (!lazy protocol witness table cache variable for type External<[EventID : EventType]> and conformance External<A>)
  {
    type metadata accessor for External<[EventID : EventType]>();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type External<[EventID : EventType]> and conformance External<A>);
  }
  return result;
}

@end