@interface CAMStorageController
- (BOOL)_isUsingExternalStorage;
- (BOOL)_isUsingInternalStorage;
- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4;
- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4 verbose:(BOOL)a5;
- (CAMCaptureGraphConfiguration)graphConfiguration;
- (CAMExternalStorage)externalStorage;
- (CAMInternalStorage)_internalStorage;
- (CAMPurgeableStorageContainer)purgeableStorageContainer;
- (CAMPurgeableStorageContainerDelegate)delegate;
- (CAMStorageContainer)_currentStorage;
- (CAMStorageController)init;
- (double)availableRecordingTimeInSecondsForGraphConfiguration:(id)a3;
- (int64_t)minimumDiskUsageThresholdInBytesForGraphConfiguration:(id)a3;
- (int64_t)totalFreeBytes;
- (void)_setCurrentStorage:(id)a3;
- (void)_updateGraphConfigurationOnCurrentStorage;
- (void)_updateStorageDelegates;
- (void)setDelegate:(id)a3;
- (void)setExternalStorage:(id)a3;
- (void)setGraphConfiguration:(id)a3;
@end

@implementation CAMStorageController

- (CAMStorageController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CAMStorageController;
  v2 = [(CAMStorageController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(CAMInternalStorage);
    internalStorage = v2->__internalStorage;
    v2->__internalStorage = v3;

    objc_storeStrong((id *)&v2->__currentStorage, v2->__internalStorage);
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  [(CAMStorageController *)self _updateStorageDelegates];
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4
{
  return [(CAMStorageController *)self hasDiskSpaceToAllowCaptureWithConfiguration:a3 allowPurging:a4 verbose:0];
}

- (void)_updateStorageDelegates
{
  BOOL v3 = [(CAMStorageController *)self _isUsingInternalStorage];
  if (v3)
  {
    v4 = [(CAMStorageController *)self delegate];
  }
  else
  {
    v4 = 0;
  }
  v5 = [(CAMStorageController *)self _internalStorage];
  [v5 setDelegate:v4];

  if (v3) {
  BOOL v6 = [(CAMStorageController *)self _isUsingExternalStorage];
  }
  if (v6)
  {
    id v8 = [(CAMStorageController *)self delegate];
  }
  else
  {
    id v8 = 0;
  }
  v7 = [(CAMStorageController *)self externalStorage];
  [v7 setDelegate:v8];

  if (v6)
  {
  }
}

- (CAMPurgeableStorageContainer)purgeableStorageContainer
{
  BOOL v3 = [(CAMStorageController *)self _currentStorage];
  v4 = [(CAMStorageController *)self _internalStorage];
  if (v3 == v4)
  {
    v5 = [(CAMStorageController *)self _internalStorage];
  }
  else
  {
    v5 = 0;
  }

  return (CAMPurgeableStorageContainer *)v5;
}

- (void)_setCurrentStorage:(id)a3
{
  v5 = (CAMStorageContainer *)a3;
  if (self->__currentStorage != v5)
  {
    v16 = v5;
    BOOL v6 = [(CAMStorageController *)self purgeableStorageContainer];
    if ([v6 isPurging])
    {
      int v7 = 1;
    }
    else
    {
      id v8 = [(CAMStorageController *)self purgeableStorageContainer];
      int v7 = [v8 isCancelingPurge];
    }
    objc_storeStrong((id *)&self->__currentStorage, a3);
    [(CAMStorageController *)self _updateStorageDelegates];
    [(CAMStorageController *)self _updateGraphConfigurationOnCurrentStorage];
    v9 = [(CAMStorageController *)self purgeableStorageContainer];
    if ([v9 isPurging])
    {
      int v10 = 1;
    }
    else
    {
      v11 = [(CAMStorageController *)self purgeableStorageContainer];
      int v10 = [v11 isCancelingPurge];
    }
    if (v7 != v10)
    {
      v12 = [(CAMStorageController *)self delegate];
      v13 = [(CAMStorageController *)self purgeableStorageContainer];
      [v12 storageControllerDidChangePurgingState:v13];
    }
    v14 = [(CAMStorageController *)self delegate];
    v15 = [(CAMStorageController *)self _currentStorage];
    [v14 availableDiskSpaceChanged:v15];

    v5 = v16;
  }
}

- (BOOL)_isUsingInternalStorage
{
  v2 = self;
  BOOL v3 = [(CAMStorageController *)self _currentStorage];
  v4 = [(CAMStorageController *)v2 _internalStorage];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (BOOL)_isUsingExternalStorage
{
  v2 = self;
  BOOL v3 = [(CAMStorageController *)self _currentStorage];
  v4 = [(CAMStorageController *)v2 externalStorage];
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (void)setExternalStorage:(id)a3
{
  id v5 = a3;
  uint64_t externalStorage = (uint64_t)self->_externalStorage;
  if ((id)externalStorage != v5)
  {
    id v8 = v5;
    uint64_t externalStorage = [(id)externalStorage isEqual:v5];
    id v5 = v8;
    if ((externalStorage & 1) == 0)
    {
      [(CAMExternalStorage *)self->_externalStorage setDelegate:0];
      objc_storeStrong((id *)&self->_externalStorage, a3);
      if (v8)
      {
        uint64_t externalStorage = [(CAMStorageController *)self _setCurrentStorage:v8];
      }
      else
      {
        int v7 = [(CAMStorageController *)self _internalStorage];
        [(CAMStorageController *)self _setCurrentStorage:v7];
      }
      id v5 = v8;
    }
  }
  MEMORY[0x270F9A758](externalStorage, v5);
}

- (void)setGraphConfiguration:(id)a3
{
  id v5 = (CAMCaptureGraphConfiguration *)a3;
  p_graphConfiguration = &self->_graphConfiguration;
  if (self->_graphConfiguration != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)p_graphConfiguration, a3);
    p_graphConfiguration = (CAMCaptureGraphConfiguration **)[(CAMStorageController *)self _updateGraphConfigurationOnCurrentStorage];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_graphConfiguration, v5);
}

- (void)_updateGraphConfigurationOnCurrentStorage
{
  id v4 = [(CAMStorageController *)self graphConfiguration];
  BOOL v3 = [(CAMStorageController *)self _currentStorage];
  [v3 setGraphConfiguration:v4];
}

- (int64_t)totalFreeBytes
{
  v2 = [(CAMStorageController *)self _currentStorage];
  int64_t v3 = [v2 totalFreeBytes];

  return v3;
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4 verbose:(BOOL)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = [(CAMStorageController *)self _currentStorage];
  LOBYTE(v5) = [v9 hasDiskSpaceToAllowCaptureWithConfiguration:v8 allowPurging:v6 verbose:v5];

  return v5;
}

- (double)availableRecordingTimeInSecondsForGraphConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMStorageController *)self _currentStorage];
  [v5 availableRecordingTimeInSecondsForGraphConfiguration:v4];
  double v7 = v6;

  return v7;
}

- (int64_t)minimumDiskUsageThresholdInBytesForGraphConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMStorageController *)self _currentStorage];
  int64_t v6 = [v5 minimumDiskUsageThresholdInBytesForGraphConfiguration:v4];

  return v6;
}

- (CAMCaptureGraphConfiguration)graphConfiguration
{
  return self->_graphConfiguration;
}

- (CAMPurgeableStorageContainerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMPurgeableStorageContainerDelegate *)WeakRetained;
}

- (CAMExternalStorage)externalStorage
{
  return self->_externalStorage;
}

- (CAMInternalStorage)_internalStorage
{
  return self->__internalStorage;
}

- (CAMStorageContainer)_currentStorage
{
  return self->__currentStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentStorage, 0);
  objc_storeStrong((id *)&self->__internalStorage, 0);
  objc_storeStrong((id *)&self->_externalStorage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_graphConfiguration, 0);
}

@end