@interface _GEOServiceURLsActiveTileGroupMigrationTask
- (GEOActiveTileGroupMigrationTaskOptions)options;
- (NSObject)transaction;
- (NSProgress)progress;
- (_GEOServiceURLsActiveTileGroupMigrationTask)init;
- (_GEOServiceURLsActiveTileGroupMigrationTask)initWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 oldTileGroup:(id)a7 dataSet:(id)a8;
- (int64_t)estimatedWeight;
- (void)populateTileGroup:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTransaction:(id)a3;
- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4;
@end

@implementation _GEOServiceURLsActiveTileGroupMigrationTask

- (_GEOServiceURLsActiveTileGroupMigrationTask)init
{
  result = (_GEOServiceURLsActiveTileGroupMigrationTask *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (_GEOServiceURLsActiveTileGroupMigrationTask)initWithMigrator:(id)a3 manifestConfiguration:(id)a4 newTileGroup:(id)a5 inResourceManifest:(id)a6 oldTileGroup:(id)a7 dataSet:(id)a8
{
  id v14 = a3;
  id v25 = a4;
  id v24 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)_GEOServiceURLsActiveTileGroupMigrationTask;
  v18 = [(_GEOServiceURLsActiveTileGroupMigrationTask *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeWeak((id *)&v18->_migrator, v14);
    objc_storeStrong((id *)&v19->_manifestConfiguration, a4);
    objc_storeStrong((id *)&v19->_newTileGroup, a5);
    objc_storeStrong((id *)&v19->_resourceManifest, a6);
    objc_storeStrong((id *)&v19->_oldTileGroup, a7);
    objc_storeStrong((id *)&v19->_dataSetDescription, a8);
    uint64_t v20 = +[GEOReportedProgress progressWithTotalUnitCount:](GEOReportedProgress, "progressWithTotalUnitCount:", -1, v24, v25);
    progress = v19->_progress;
    v19->_progress = (GEOReportedProgress *)v20;

    v22 = v19;
  }

  return v19;
}

- (int64_t)estimatedWeight
{
  return 0;
}

- (NSProgress)progress
{
  return [(GEOReportedProgress *)self->_progress progress];
}

- (void)startWithCompletionHandler:(id)a3 callbackQueue:(id)a4
{
  id v6 = a3;
  progress = self->_progress;
  v8 = a4;
  [(GEOReportedProgress *)progress setTotalUnitCount:1];
  [(GEOReportedProgress *)self->_progress setCompletedUnitCount:1];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88___GEOServiceURLsActiveTileGroupMigrationTask_startWithCompletionHandler_callbackQueue___block_invoke;
  block[3] = &unk_1E53DA028;
  id v11 = v6;
  id v9 = v6;
  dispatch_async(v8, block);
}

- (void)populateTileGroup:(id)a3
{
  id v5 = a3;
  v4 = [(GEOResources *)self->_resourceManifest preferedURLSetFor:self->_dataSetDescription];
  if (v4) {
    [v5 setUrlInfoSet:v4];
  }
}

- (GEOActiveTileGroupMigrationTaskOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSObject)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_dataSetDescription, 0);
  objc_storeStrong((id *)&self->_oldTileGroup, 0);
  objc_storeStrong((id *)&self->_resourceManifest, 0);
  objc_storeStrong((id *)&self->_newTileGroup, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);

  objc_destroyWeak((id *)&self->_migrator);
}

@end