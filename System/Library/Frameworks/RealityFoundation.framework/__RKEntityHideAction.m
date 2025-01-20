@interface __RKEntityHideAction
- (id)copyWithZone:(void *)a3;
@end

@implementation __RKEntityHideAction

- (id)copyWithZone:(void *)a3
{
  return (id)@objc __RKEntitySetOpacityAction.copy(with:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(void *__return_ptr, uint64_t))__RKEntityHideAction.copy(with:));
}

@end