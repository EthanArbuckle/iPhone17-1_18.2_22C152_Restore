@interface __RKFadeSceneAction
- (id)copyWithZone:(void *)a3;
@end

@implementation __RKFadeSceneAction

- (id)copyWithZone:(void *)a3
{
  *(void *)(swift_allocObject() + 108) = *(void *)self->duration;
  return (id)__RKEntityAction.init(targetEntity:)(0);
}

@end