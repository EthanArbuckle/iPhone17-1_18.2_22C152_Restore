@interface BLSHRequestLiveUpdatingAttributeHandler
+ (Class)attributeBaseClass;
+ (id)attributeClasses;
- (void)activateForSceneEnvironment:(id)a3;
- (void)deactivateForSceneEnvironment:(id)a3;
@end

@implementation BLSHRequestLiveUpdatingAttributeHandler

+ (id)attributeClasses
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return v2;
}

+ (Class)attributeBaseClass
{
  return (Class)objc_opt_class();
}

- (void)activateForSceneEnvironment:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

uint64_t __71__BLSHRequestLiveUpdatingAttributeHandler_activateForSceneEnvironment___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLiveUpdating:1];
}

- (void)deactivateForSceneEnvironment:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BSDispatchMain();
}

uint64_t __73__BLSHRequestLiveUpdatingAttributeHandler_deactivateForSceneEnvironment___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setLiveUpdating:0];
}

@end