@interface SystemSegmentItem:
- (void)Int;
@end

@implementation SystemSegmentItem:

- (void)Int
{
  if (!lazy cache variable for type metadata for [SystemSegmentItem : Int])
  {
    type metadata accessor for SystemSegmentItem();
    lazy protocol witness table accessor for type SystemSegmentItem and conformance SystemSegmentItem(&lazy protocol witness table cache variable for type SystemSegmentItem and conformance SystemSegmentItem, (void (*)(uint64_t))type metadata accessor for SystemSegmentItem);
    unint64_t v0 = type metadata accessor for Dictionary();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [SystemSegmentItem : Int]);
    }
  }
}

@end