@interface GEORegionalResourcesVersionMigrationTask
@end

@implementation GEORegionalResourcesVersionMigrationTask

void __145___GEORegionalResourcesVersionMigrationTask_initWithMigrator_manifestConfiguration_newTileGroup_inResourceManifest_activeScales_activeScenarios___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cancel];
}

uint64_t __86___GEORegionalResourcesVersionMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63___GEORegionalResourcesVersionMigrationTask_populateTileGroup___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 length])
  {
    v3 = GEOCanonicalResourceNameForVersionedName(v4);
    if ([v3 length]) {
      [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:v3];
    }
  }
}

@end