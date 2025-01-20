@interface ObjectIdentifier:
- (void)DynamicPropertyCache.Fields;
- (void)ScrollStateRequest;
@end

@implementation ObjectIdentifier:

- (void)ScrollStateRequest
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for ScrollStateRequest(255, (unint64_t *)&lazy cache variable for type metadata for ScrollStateRequest);
    unint64_t v7 = a3(a1, MEMORY[0x263F8D1F0], v6, MEMORY[0x263F8D1F8]);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

- (void)DynamicPropertyCache.Fields
{
  if (!lazy cache variable for type metadata for MutableBox<[ObjectIdentifier : DynamicPropertyCache.Fields]>)
  {
    type metadata accessor for [Int : CGFloat](255, (unint64_t *)&lazy cache variable for type metadata for [ObjectIdentifier : DynamicPropertyCache.Fields]);
    unint64_t v0 = type metadata accessor for MutableBox();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for MutableBox<[ObjectIdentifier : DynamicPropertyCache.Fields]>);
    }
  }
}

@end