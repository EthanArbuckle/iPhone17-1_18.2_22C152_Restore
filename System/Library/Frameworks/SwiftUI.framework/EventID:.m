@interface EventID:
- (uint64_t)PanEvent;
- (uint64_t)TouchEvent;
- (void)EventType;
- (void)PanEvent;
- (void)TouchEvent;
@end

@implementation EventID:

- (void)EventType
{
  if (!lazy cache variable for type metadata for Attribute<[EventID : EventType]>)
  {
    type metadata accessor for [EventID : EventType]();
    unint64_t v0 = type metadata accessor for Attribute();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Attribute<[EventID : EventType]>);
    }
  }
}

- (uint64_t)PanEvent
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

- (void)PanEvent
{
  if (!lazy cache variable for type metadata for [EventID : PanEvent])
  {
    lazy protocol witness table accessor for type EventID and conformance EventID();
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [EventID : PanEvent]);
    }
  }
}

- (void)TouchEvent
{
  if (!lazy cache variable for type metadata for MapGesture<[EventID : TouchEvent], SpatialEventCollection>)
  {
    type metadata accessor for [EventID : TouchEvent]();
    unint64_t v0 = type metadata accessor for MapGesture();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for MapGesture<[EventID : TouchEvent], SpatialEventCollection>);
    }
  }
}

- (uint64_t)TouchEvent
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

@end