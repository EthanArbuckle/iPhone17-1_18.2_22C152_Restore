@interface GEOServiceURLsActiveTileGroupMigrator
- (BOOL)needsMigrationForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 dataSet:(id)a6;
- (GEOServiceURLsActiveTileGroupMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4;
- (id)taskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 dataSet:(id)a8 updateType:(int64_t)a9;
@end

@implementation GEOServiceURLsActiveTileGroupMigrator

- (BOOL)needsMigrationForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 dataSet:(id)a6
{
  id v8 = a5;
  v9 = [a4 preferedURLSetFor:a6];
  if (v9)
  {
    v10 = [v8 urlInfoSet];
    int v11 = [v10 isEqual:v9] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (GEOServiceURLsActiveTileGroupMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOServiceURLsActiveTileGroupMigrator;
  v7 = [(GEOServiceURLsActiveTileGroupMigrator *)&v11 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_manifestConfiguration, a3);
    v9 = v8;
  }

  return v8;
}

- (id)taskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 dataSet:(id)a8 updateType:(int64_t)a9
{
  id v13 = a8;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [[_GEOServiceURLsActiveTileGroupMigrationTask alloc] initWithMigrator:self manifestConfiguration:self->_manifestConfiguration newTileGroup:v16 inResourceManifest:v15 oldTileGroup:v14 dataSet:v13];

  return v17;
}

- (void).cxx_destruct
{
}

@end