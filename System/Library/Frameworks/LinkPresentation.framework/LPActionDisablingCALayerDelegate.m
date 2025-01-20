@interface LPActionDisablingCALayerDelegate
+ (id)shared;
- (id)actionForLayer:(id)a3 forKey:(id)a4;
@end

@implementation LPActionDisablingCALayerDelegate

+ (id)shared
{
  if (shared_onceToken != -1) {
    dispatch_once(&shared_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)shared_delegate;

  return v2;
}

void __42__LPActionDisablingCALayerDelegate_shared__block_invoke()
{
  v0 = objc_alloc_init(LPActionDisablingCALayerDelegate);
  v1 = (void *)shared_delegate;
  shared_delegate = (uint64_t)v0;
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", a3, a4);

  return v4;
}

@end