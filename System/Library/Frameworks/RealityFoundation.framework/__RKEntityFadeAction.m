@interface __RKEntityFadeAction
- (id)copyWithZone:(void *)a3;
@end

@implementation __RKEntityFadeAction

- (id)copyWithZone:(void *)a3
{
  swift_beginAccess();
  type metadata accessor for __RKEntityFadeAction();
  *(void *)(swift_allocObject() + 108) = *(void *)self->duration;
  uint64_t v4 = swift_retain();
  return (id)__RKEntityAction.init(targetEntity:)(v4);
}

@end