@interface DBGSnapshotManager
+ (DBGSnapshotManager)snapshotManagerWithSnapshot:(id)a3 primaryDataCoordinator:(id)a4;
- (DBGDataCoordinator)primaryDataCoordinator;
- (DBGSnapshot)snapshot;
- (DBGSnapshotAssetManager)assetManager;
- (DBGSnapshotManager)initWithSnapshot:(id)a3 primaryDataCoordinator:(id)a4;
- (DebugHierarchyRuntimeInfo)runtimeInfo;
- (void)cancelAllRequests;
- (void)clearData;
- (void)setPrimaryDataCoordinator:(id)a3;
@end

@implementation DBGSnapshotManager

+ (DBGSnapshotManager)snapshotManagerWithSnapshot:(id)a3 primaryDataCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithSnapshot:v7 primaryDataCoordinator:v6];

  return (DBGSnapshotManager *)v8;
}

- (DBGSnapshotManager)initWithSnapshot:(id)a3 primaryDataCoordinator:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DBGSnapshotManager;
  v9 = [(DBGSnapshotManager *)&v18 init];
  v10 = v9;
  if (v9)
  {
    p_snapshot = (void **)&v9->_snapshot;
    objc_storeStrong((id *)&v9->_snapshot, a3);
    snapshot = v10->_snapshot;
    if (!snapshot)
    {
      v13 = objc_alloc_init(DBGSnapshot);
      v14 = *p_snapshot;
      *p_snapshot = v13;

      snapshot = *p_snapshot;
    }
    [snapshot setSnapshotManager:v10];
    v15 = (DebugHierarchyRuntimeInfo *)objc_alloc_init((Class)DebugHierarchyRuntimeInfo);
    runtimeInfo = v10->_runtimeInfo;
    v10->_runtimeInfo = v15;

    objc_storeStrong((id *)&v10->_primaryDataCoordinator, a4);
    [(DBGDataCoordinator *)v10->_primaryDataCoordinator setSnapshotManager:v10];
  }

  return v10;
}

- (void)clearData
{
  v3 = [(DBGSnapshotManager *)self snapshot];
  [v3 clearData];

  id v4 = [(DBGSnapshotManager *)self runtimeInfo];
  [v4 clearData];
}

- (void)cancelAllRequests
{
  id v2 = [(DBGSnapshotManager *)self primaryDataCoordinator];
  [v2 cancelAllRequests];
}

- (void)setPrimaryDataCoordinator:(id)a3
{
  id v4 = (DBGDataCoordinator *)a3;
  [(DBGDataCoordinator *)v4 setSnapshotManager:self];
  primaryDataCoordinator = self->_primaryDataCoordinator;
  self->_primaryDataCoordinator = v4;
}

- (DBGSnapshot)snapshot
{
  return (DBGSnapshot *)objc_getProperty(self, a2, 8, 1);
}

- (DBGSnapshotAssetManager)assetManager
{
  return (DBGSnapshotAssetManager *)objc_getProperty(self, a2, 16, 1);
}

- (DebugHierarchyRuntimeInfo)runtimeInfo
{
  return (DebugHierarchyRuntimeInfo *)objc_getProperty(self, a2, 24, 1);
}

- (DBGDataCoordinator)primaryDataCoordinator
{
  return (DBGDataCoordinator *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryDataCoordinator, 0);
  objc_storeStrong((id *)&self->_runtimeInfo, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);

  objc_storeStrong((id *)&self->_snapshot, 0);
}

@end