@interface GEOSearchAttributionManifestVersionMigrator
- (BOOL)needsMigrationForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 dataSet:(id)a6;
- (GEOSearchAttributionManifestVersionMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4;
- (id)taskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 dataSet:(id)a8 updateType:(int64_t)a9;
- (void)_addRunningTask:(id)a3;
- (void)_removeRunningTask:(id)a3;
@end

@implementation GEOSearchAttributionManifestVersionMigrator

- (BOOL)needsMigrationForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 dataSet:(id)a6
{
  id v8 = a5;
  v9 = [a4 preferedURLSetFor:a6];
  if ([v9 hasSearchAttributionManifestURL])
  {
    v10 = [v8 urlInfoSet];
    v11 = [v10 searchAttributionManifestURL];
    v12 = [v11 url];
    v13 = [v9 searchAttributionManifestURL];
    v14 = [v13 url];
    int v15 = [v12 isEqualToString:v14] ^ 1;
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (GEOSearchAttributionManifestVersionMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOSearchAttributionManifestVersionMigrator;
  v7 = [(GEOSearchAttributionManifestVersionMigrator *)&v15 init];
  id v8 = v7;
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
  id v12 = a4;
  id v13 = a5;
  id v14 = a8;
  if ([(GEOResourceManifestConfiguration *)self->_manifestConfiguration isDefaultConfiguration])
  {
    objc_super v15 = [v12 preferedURLSetFor:v14];
    v16 = [_GEOSearchAttributionManifestVersionMigrationTask alloc];
    v17 = [v15 searchAttributionManifestURL];
    v18 = [v17 nsURL];
    v19 = [(_GEOSearchAttributionManifestVersionMigrationTask *)v16 initWithMigrator:self newSearchAttributionManifestURL:v18 oldTileGroup:v13];
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_addRunningTask:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync_data();
}

uint64_t __63__GEOSearchAttributionManifestVersionMigrator__addRunningTask___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) addObject:*(void *)(a1 + 40)];
}

- (void)_removeRunningTask:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  geo_isolate_sync_data();
}

uint64_t __66__GEOSearchAttributionManifestVersionMigrator__removeRunningTask___block_invoke(uint64_t a1)
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