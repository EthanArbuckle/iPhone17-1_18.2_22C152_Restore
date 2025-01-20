@interface __RKEntityVisibilityAction
- (id)copyWithZone:(void *)a3;
@end

@implementation __RKEntityVisibilityAction

- (id)copyWithZone:(void *)a3
{
  swift_beginAccess();
  type metadata accessor for __RKEntityVisibilityAction();
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 112) = 0;
  *(unsigned char *)(v3 + 120) = 1;
  *(void *)(v3 + 128) = 0;
  *(unsigned char *)(v3 + 136) = 1;
  *(_DWORD *)(v3 + 140) = 0;
  uint64_t v4 = swift_retain();
  return (id)__RKEntityAction.init(targetEntity:)(v4);
}

@end