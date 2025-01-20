@interface __RKEntityAnimateAction
- (id)copyWithZone:(void *)a3;
@end

@implementation __RKEntityAnimateAction

- (id)copyWithZone:(void *)a3
{
  swift_beginAccess();
  type metadata accessor for __RKEntityAnimateAction();
  swift_allocObject();
  uint64_t v3 = swift_retain();
  return (id)__RKEntityAnimateAction.init(targetEntity:)(v3);
}

@end