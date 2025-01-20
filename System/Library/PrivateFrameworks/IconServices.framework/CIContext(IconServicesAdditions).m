@interface CIContext(IconServicesAdditions)
+ (id)_IS_sharedIconCompositorContext;
@end

@implementation CIContext(IconServicesAdditions)

+ (id)_IS_sharedIconCompositorContext
{
  if (_IS_sharedIconCompositorContext_onceToken != -1) {
    dispatch_once(&_IS_sharedIconCompositorContext_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)_IS_sharedIconCompositorContext_sharedContext;
  return v0;
}

@end