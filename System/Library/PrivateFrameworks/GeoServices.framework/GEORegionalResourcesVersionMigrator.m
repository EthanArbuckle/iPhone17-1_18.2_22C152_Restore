@interface GEORegionalResourcesVersionMigrator
- (GEORegionalResourcesVersionMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4;
- (id)taskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 dataSet:(id)a8 updateType:(int64_t)a9;
@end

@implementation GEORegionalResourcesVersionMigrator

- (GEORegionalResourcesVersionMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEORegionalResourcesVersionMigrator;
  v7 = [(GEORegionalResourcesVersionMigrator *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_manifestConfiguration, a3);
    v9 = v8;
  }

  return v8;
}

- (id)taskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 dataSet:(id)a8 updateType:(int64_t)a9
{
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  v17 = [[_GEORegionalResourcesVersionMigrationTask alloc] initWithMigrator:self manifestConfiguration:self->_manifestConfiguration newTileGroup:v16 inResourceManifest:v15 activeScales:v14 activeScenarios:v13];

  return v17;
}

- (void).cxx_destruct
{
}

@end