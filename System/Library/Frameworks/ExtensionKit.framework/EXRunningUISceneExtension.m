@interface EXRunningUISceneExtension
@end

@implementation EXRunningUISceneExtension

void __55___EXRunningUISceneExtension_startWithArguments_count___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDomain:@"XPCService"];
  [v3 setService:@"MainService"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 setDelegate:WeakRetained];
}

void __112___EXRunningUISceneExtension_UIApplicationDelegate__application_configurationForConnectingSceneSession_options___block_invoke()
{
  v0 = (void *)MEMORY[0x263F82B30];
  uint64_t v1 = objc_opt_class();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [MEMORY[0x263F08A98] predicateWithValue:1];
  [v0 _registerSceneComponentClass:v1 withKey:v4 predicate:v3];
}

@end