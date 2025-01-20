@interface __RKEntityToggleAnimateAction
- (id)copyWithZone:(void *)a3;
@end

@implementation __RKEntityToggleAnimateAction

- (id)copyWithZone:(void *)a3
{
  swift_beginAccess();
  type metadata accessor for __RKEntityToggleAnimateAction();
  *(void *)(swift_allocObject() + 264) = 0;
  uint64_t v3 = swift_retain();
  return (id)__RKEntityAnimateAction.init(targetEntity:)(v3);
}

@end