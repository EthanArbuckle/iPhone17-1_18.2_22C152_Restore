@interface SpatialEventCollection.Event.ID:
- (uint64_t)SpatialEventCollection.Event;
- (void)SpatialEventCollection.Event;
@end

@implementation SpatialEventCollection.Event.ID:

- (void)SpatialEventCollection.Event
{
  if (!lazy cache variable for type metadata for [SpatialEventCollection.Event.ID : SpatialEventCollection.Event].Index._Variant)
  {
    lazy protocol witness table accessor for type SpatialEventCollection.Event.ID and conformance SpatialEventCollection.Event.ID();
    unint64_t v0 = type metadata accessor for Dictionary.Index._Variant();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [SpatialEventCollection.Event.ID : SpatialEventCollection.Event].Index._Variant);
    }
  }
}

- (uint64_t)SpatialEventCollection.Event
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

@end