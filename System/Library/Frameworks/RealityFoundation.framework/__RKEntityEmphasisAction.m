@interface __RKEntityEmphasisAction
- (id)copyWithZone:(void *)a3;
@end

@implementation __RKEntityEmphasisAction

- (id)copyWithZone:(void *)a3
{
  swift_retain();
  __RKEntityEmphasisAction.copy(with:)(v5);
  swift_release();
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

@end