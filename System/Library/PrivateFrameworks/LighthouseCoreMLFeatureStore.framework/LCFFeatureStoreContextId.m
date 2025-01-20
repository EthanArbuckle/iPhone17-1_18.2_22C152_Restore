@interface LCFFeatureStoreContextId
+ (id)getContextId;
@end

@implementation LCFFeatureStoreContextId

+ (id)getContextId
{
  if (getContextId_onceToken != -1) {
    dispatch_once(&getContextId_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)getContextId_contextId;
  return v2;
}

uint64_t __40__LCFFeatureStoreContextId_getContextId__block_invoke()
{
  getContextId_contextId = [MEMORY[0x263F08C38] UUID];
  return MEMORY[0x270F9A758]();
}

@end