@interface GEOResourcesVersionMigrator
- (GEOResourcesVersionMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4;
- (id)opportunisticTaskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 activeNames:(id)a8 dataSet:(id)a9;
- (id)taskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 dataSet:(id)a8 updateType:(int64_t)a9;
- (void)_addRunningTask:(id)a3;
- (void)_removeRunningTask:(id)a3;
@end

@implementation GEOResourcesVersionMigrator

- (GEOResourcesVersionMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOResourcesVersionMigrator;
  v7 = [(GEOResourcesVersionMigrator *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_manifestConfiguration, a3);
    uint64_t v9 = geo_isolater_create();
    isolater = v8->_isolater;
    v8->_isolater = (geo_isolater *)v9;

    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    runningTasks = v8->_runningTasks;
    v8->_runningTasks = (NSMutableArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)taskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 dataSet:(id)a8 updateType:(int64_t)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  id v21 = [[_GEOResourcesVersionMigrationTask alloc] initForRequiredWithMigrator:self manifestConfiguration:self->_manifestConfiguration newTileGroup:v20 inResourceManifest:v19 dataSet:v15 oldTileGroup:v18 activeScales:v17 activeScenarios:v16];

  return v21;
}

- (id)opportunisticTaskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 activeNames:(id)a8 dataSet:(id)a9
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a8;
  id v17 = a9;
  if ([v16 count]) {
    id v18 = [[_GEOResourcesVersionMigrationTask alloc] initForOpportunisticWithMigrator:self manifestConfiguration:self->_manifestConfiguration newTileGroup:v13 inResourceManifest:v14 dataSet:v17 oldTileGroup:v15 activeNames:v16];
  }
  else {
    id v18 = 0;
  }

  return v18;
}

- (void)_addRunningTask:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync_data();
}

uint64_t __47__GEOResourcesVersionMigrator__addRunningTask___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)_removeRunningTask:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync_data();
}

uint64_t __50__GEOResourcesVersionMigrator__removeRunningTask___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObject:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningTasks, 0);
  objc_storeStrong((id *)&self->_isolater, 0);

  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
}

@end