@interface PLJournalMaintenanceTask
- (BOOL)runTaskWithTransaction:(id)a3;
- (void)coalesceRebuildJournals;
- (void)snapshotComputeCacheJournals;
@end

@implementation PLJournalMaintenanceTask

- (void)snapshotComputeCacheJournals
{
  v2 = [(PLMaintenanceTask *)self libraryServicesManager];
  v3 = [v2 computeCacheManager];

  id v7 = 0;
  unsigned __int8 v4 = [v3 snapshotComputeCacheAndBackupIfNeededWithError:&v7];
  id v5 = v7;
  if ((v4 & 1) == 0)
  {
    v6 = PLBackendGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Maintenance task: Failed to generate compute cache backup. Error: %@", buf, 0xCu);
    }
  }
}

- (void)coalesceRebuildJournals
{
  v3 = [(PLMaintenanceTask *)self libraryServicesManager];
  unsigned __int8 v4 = [v3 pathManager];
  unsigned int v5 = +[PLRebuildJournalManager isEnabledWithPathManager:v4 error:0];

  if (v5)
  {
    id v8 = [(PLMaintenanceTask *)self libraryServicesManager];
    v6 = [v8 rebuildJournalManager];
    LODWORD(v7) = 0.5;
    [v6 coalesceJournalsForPayloadClassIDs:0 withChangeJournalOverThreshold:0 error:v7];
  }
}

- (BOOL)runTaskWithTransaction:(id)a3
{
  return 1;
}

@end