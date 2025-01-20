@interface CPLEngineBackupSyncTask
- (BOOL)forBackup;
- (CPLEngineBackupSyncTask)initWithEngineLibrary:(id)a3 delegate:(id)a4;
- (id)description;
@end

@implementation CPLEngineBackupSyncTask

- (id)description
{
  v3 = [(CPLEngineForceSyncTask *)self _phaseDescription];
  id v4 = [NSString alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(CPLForceSyncTask *)self taskIdentifier];
  v7 = (void *)v6;
  if (v3) {
    uint64_t v8 = [v4 initWithFormat:@"<%@ %@ (%@)>", v5, v6, v3];
  }
  else {
    uint64_t v8 = [v4 initWithFormat:@"<%@ %@>", v5, v6, v11];
  }
  v9 = (void *)v8;

  return v9;
}

- (BOOL)forBackup
{
  return 1;
}

- (CPLEngineBackupSyncTask)initWithEngineLibrary:(id)a3 delegate:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CPLEngineBackupSyncTask;
  return [(CPLEngineForceSyncTask *)&v5 initWithScopeIdentifiers:MEMORY[0x1E4F1CBF0] engineLibrary:a3 filter:0 delegate:a4];
}

@end