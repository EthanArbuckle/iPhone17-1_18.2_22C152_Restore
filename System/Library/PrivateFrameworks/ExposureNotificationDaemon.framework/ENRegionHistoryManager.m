@interface ENRegionHistoryManager
+ (id)regionHistoryFileStatusToString:(int64_t)a3;
- (BOOL)purgeAllRegionHistoryWithError:(id *)a3;
- (BOOL)purgeRegionsOlderThanDate:(id)a3 error:(id *)a4;
- (ENRegionHistory)regionHistory;
- (ENRegionHistoryManager)initWithDelegate:(id)a3 queue:(id)a4;
- (ENRegionHistoryManager)initWithDelegate:(id)a3 queue:(id)a4 directoryPath:(id)a5;
- (ENRegionHistoryManagerDelegate)delegate;
- (ENSecureArchiveFileWrapper)regionHistoryFileWrapper;
- (NSString)directoryPath;
- (OS_dispatch_queue)queue;
- (id)getAllRegionVisits;
- (id)getAllRegions;
- (id)mergeRegionHistoryOnDisk:(id)a3 inMemory:(id)a4;
- (int)resetToken;
- (int64_t)fileStatus;
- (void)addRegionVisit:(id)a3;
- (void)dealloc;
- (void)resetRegionHistory;
- (void)setDelegate:(id)a3;
- (void)setDirectoryPath:(id)a3;
- (void)setFileStatus:(int64_t)a3;
- (void)setQueue:(id)a3;
- (void)setRegionHistory:(id)a3;
- (void)setRegionHistoryFileWrapper:(id)a3;
- (void)setResetToken:(int)a3;
- (void)setupPersistedRegionHistory;
- (void)updateFileStatus;
@end

@implementation ENRegionHistoryManager

- (id)getAllRegions
{
  return [(ENRegionHistory *)self->_regionHistory getRegions];
}

- (void)updateFileStatus
{
  regionHistoryFileWrapper = self->_regionHistoryFileWrapper;
  uint64_t v5 = 0;
  if ([(ENSecureArchiveFileWrapper *)regionHistoryFileWrapper openWithError:&v5]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 1;
  }
  [(ENRegionHistoryManager *)self setFileStatus:v4];
}

- (void)setFileStatus:(int64_t)a3
{
  if (self->_fileStatus != a3)
  {
    if (gLogCategory_ENRegionHistoryManager <= 30
      && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = [(ENRegionHistoryManager *)self regionHistoryFileWrapper];
      v6 = [v5 path];
      v7 = [(id)objc_opt_class() regionHistoryFileStatusToString:self->_fileStatus];
      [(id)objc_opt_class() regionHistoryFileStatusToString:a3];
      v17 = v16 = v7;
      v14 = v6;
      LogPrintF_safe();
    }
    self->_fileStatus = a3;
    if (a3 == 2)
    {
      regionHistoryFileWrapper = self->_regionHistoryFileWrapper;
      id v19 = 0;
      id v18 = 0;
      BOOL v9 = [(ENSecureArchiveFileWrapper *)regionHistoryFileWrapper readObject:&v19 ofClass:objc_opt_class() error:&v18];
      v10 = (ENRegionHistory *)v19;
      id v11 = v18;
      if (v9)
      {
        if (!v10)
        {
          if (gLogCategory_ENRegionHistoryManager <= 30
            && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
          {
            v12 = [(ENRegionHistoryManager *)self regionHistoryFileWrapper];
            v14 = [v12 path];
            LogPrintF_safe();
          }
          v10 = objc_alloc_init(ENRegionHistory);
        }
        v13 = -[ENRegionHistoryManager mergeRegionHistoryOnDisk:inMemory:](self, "mergeRegionHistoryOnDisk:inMemory:", v10, self->_regionHistory, v14);
        [(ENRegionHistoryManager *)self setRegionHistory:v13];
      }
      else
      {
        if (gLogCategory_ENRegionHistoryManager > 90
          || gLogCategory_ENRegionHistoryManager == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_21;
        }
        v13 = [(ENRegionHistoryManager *)self regionHistoryFileWrapper];
        v15 = [v13 path];
        LogPrintF_safe();
      }
LABEL_21:
    }
  }
}

+ (id)regionHistoryFileStatusToString:(int64_t)a3
{
  v3 = @"Unknown";
  if (a3 == 1) {
    v3 = @"Inaccessible";
  }
  if (a3 == 2) {
    return @"Accessible";
  }
  else {
    return v3;
  }
}

- (ENRegionHistoryManager)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = ENDataVaultPath();
  BOOL v9 = [v8 stringByAppendingPathComponent:@"Regions"];

  v10 = [(ENRegionHistoryManager *)self initWithDelegate:v7 queue:v6 directoryPath:v9];
  return v10;
}

- (ENRegionHistoryManager)initWithDelegate:(id)a3 queue:(id)a4 directoryPath:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    v21 = [MEMORY[0x1E4F28B08] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"ENRegionHistoryManager.m", 55, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v20 = [MEMORY[0x1E4F28B08] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"ENRegionHistoryManager.m", 54, @"Invalid parameter not satisfying: %@", @"delegate" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  v22 = [MEMORY[0x1E4F28B08] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"ENRegionHistoryManager.m", 56, @"Invalid parameter not satisfying: %@", @"directoryPath != nil" object file lineNumber description];

LABEL_4:
  v26.receiver = self;
  v26.super_class = (Class)ENRegionHistoryManager;
  v12 = [(ENRegionHistoryManager *)&v26 init];
  if (v12)
  {
    v13 = objc_alloc_init(ENRegionHistory);
    regionHistory = v12->_regionHistory;
    v12->_regionHistory = v13;

    uint64_t v15 = [v11 copy];
    directoryPath = v12->_directoryPath;
    v12->_directoryPath = (NSString *)v15;

    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_queue, a4);
    v12->_fileStatus = 0;
    v12->_resetToken = -1;
    id location = 0;
    objc_initWeak(&location, v12);
    v17 = (const char *)[ (id) *MEMORY[0x1E4F1E560] UTF8String];
    queue = v12->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __63__ENRegionHistoryManager_initWithDelegate_queue_directoryPath___block_invoke;
    handler[3] = &unk_1E69AE4D8;
    objc_copyWeak(&v24, &location);
    notify_register_dispatch(v17, &v12->_resetToken, queue, handler);
    [(ENRegionHistoryManager *)v12 setupPersistedRegionHistory];
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v12;
}

void __63__ENRegionHistoryManager_initWithDelegate_queue_directoryPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetRegionHistory];
}

- (void)setupPersistedRegionHistory
{
  [(ENRegionHistoryManager *)self setFileStatus:0];
  uint64_t v4 = [MEMORY[0x1E4F28CC0] defaultManager];
  uint64_t v5 = [(ENRegionHistoryManager *)self directoryPath];
  id v28 = 0;
  char v6 = [v4 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v28];
  id v7 = v28;

  if (v6)
  {
    v8 = [(ENRegionHistoryManager *)self directoryPath];
    id v9 = [v8 stringByAppendingPathComponent:@"regionCache.plist"];

    if (gLogCategory_ENRegionHistoryManager <= 30
      && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
    {
      id v10 = NSStringFromSelector(a2);
      id v11 = [MEMORY[0x1E4F28CC0] defaultManager];
      int v12 = [v11 fileExistsAtPath:v9];
      v13 = "no";
      if (v12) {
        v13 = "yes";
      }
      id v24 = v9;
      v25 = v13;
      v23 = v10;
      LogPrintF_safe();
    }
    v14 = objc_msgSend(MEMORY[0x1E4F28CC0], "defaultManager", v23, v24, v25);
    uint64_t v15 = [v14 attributesOfItemAtPath:v9 error:0];

    if ((unint64_t)[v15 fileSize] < 0x25801)
    {
      id v18 = v7;
    }
    else
    {
      v16 = [MEMORY[0x1E4F28CC0] defaultManager];
      id v27 = v7;
      int v17 = [v16 removeItemAtPath:v9 error:&v27];
      id v18 = v27;

      if (v17)
      {
        if (gLogCategory_ENRegionHistoryManager > 30
          || gLogCategory_ENRegionHistoryManager == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_20;
        }
      }
      else if (gLogCategory__ENRegionHistoryManager > 90 {
             || gLogCategory__ENRegionHistoryManager == -1 && !_LogCategory_Initialize())
      }
      {
        goto LABEL_20;
      }
      LogPrintF_safe();
    }
LABEL_20:
    id v19 = [[ENSecureArchiveFileWrapper alloc] initWithPath:v9];
    [(ENRegionHistoryManager *)self setRegionHistoryFileWrapper:v19];

    [(ENRegionHistoryManager *)self updateFileStatus];
    v20 = [MEMORY[0x1E4F1CB08] fileURLWithPath:v9];
    uint64_t v21 = *MEMORY[0x1E4F1C638];
    id v26 = v18;
    char v22 = [v20 setResourceValue:MEMORY[0x1E4F1CC40] forKey:v21 error:&v26];
    id v7 = v26;

    if ((v22 & 1) == 0
      && gLogCategory__ENRegionHistoryManager <= 90
      && (gLogCategory__ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

    goto LABEL_26;
  }
  if (gLogCategory__ENRegionHistoryManager <= 90
    && (gLogCategory__ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    id v9 = [(ENRegionHistoryManager *)self directoryPath];
    LogPrintF_safe();
LABEL_26:
  }
}

- (void)dealloc
{
  notify_cancel(self->_resetToken);
  self->_resetToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)ENRegionHistoryManager;
  [(ENRegionHistoryManager *)&v3 dealloc];
}

- (void)addRegionVisit:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v6 = [v5 isSensitiveLoggingAllowed];

    if (v6
      && gLogCategory_ENRegionHistoryManager <= 30
      && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend((id)objc_opt_class(), "regionHistoryFileStatusToString:", -[ENRegionHistoryManager fileStatus](self, "fileStatus"));
      v12 = id v11 = v4;
      LogPrintF_safe();
    }
    -[ENRegionHistory addRegionVisit:](self->_regionHistory, "addRegionVisit:", v4, v11, v12);
    if (self->_fileStatus == 2)
    {
      regionHistoryFileWrapper = self->_regionHistoryFileWrapper;
      regionHistory = self->_regionHistory;
      id v13 = 0;
      BOOL v9 = [(ENSecureArchiveFileWrapper *)regionHistoryFileWrapper saveObject:regionHistory error:&v13];
      id v10 = v13;
      if (!v9
        && gLogCategory__ENRegionHistoryManager <= 90
        && (gLogCategory__ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
}

- (id)getAllRegionVisits
{
  return [(ENRegionHistory *)self->_regionHistory getRegionVisits];
}

- (BOOL)purgeAllRegionHistoryWithError:(id *)a3
{
  if (gLogCategory_ENRegionHistoryManager <= 30
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    id v11 = objc_msgSend((id)objc_opt_class(), "regionHistoryFileStatusToString:", -[ENRegionHistoryManager fileStatus](self, "fileStatus"));
    LogPrintF_safe();
  }
  [(ENRegionHistory *)self->_regionHistory removeAllRegionVisits];
  uint64_t v5 = [(ENRegionHistoryManager *)self regionHistoryFileWrapper];
  [v5 close];

  int v6 = [(ENRegionHistoryManager *)self regionHistoryFileWrapper];
  id v7 = [v6 path];

  v8 = [MEMORY[0x1E4F28CC0] defaultManager];
  if ([v8 fileExistsAtPath:v7]) {
    char v9 = [v8 removeItemAtPath:v7 error:a3];
  }
  else {
    char v9 = 1;
  }
  [(ENRegionHistoryManager *)self setupPersistedRegionHistory];

  return v9;
}

- (void)resetRegionHistory
{
  id v4 = 0;
  BOOL v2 = [(ENRegionHistoryManager *)self purgeAllRegionHistoryWithError:&v4];
  id v3 = v4;
  if (!v2
    && gLogCategory_ENRegionHistoryManager <= 90
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
}

- (BOOL)purgeRegionsOlderThanDate:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (self->_fileStatus == 2)
  {
    char v22 = a4;
    v23 = self;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = [(ENRegionHistory *)self->_regionHistory getRegionVisits];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v26 != v10) {
            objc_enumerationMutation(v7);
          }
          int v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          id v13 = [v12 date];
          v14 = [v13 earlierDate:v6];
          uint64_t v15 = [v12 date];
          int v16 = [v14 isEqualToDate:v15];

          if (v16) {
            [(ENRegionHistory *)v23->_regionHistory removeRegionVisit:v12];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v9);
    }

    regionHistoryFileWrapper = v23->_regionHistoryFileWrapper;
    regionHistory = v23->_regionHistory;
    id v24 = 0;
    BOOL v19 = [(ENSecureArchiveFileWrapper *)regionHistoryFileWrapper saveObject:regionHistory error:&v24];
    id v20 = v24;
    if (!v19)
    {
      if (gLogCategory_ENRegionHistoryManager <= 90
        && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      if (v22) {
        id *v22 = v20;
      }
    }
  }
  else
  {
    if (gLogCategory_ENRegionHistoryManager <= 30
      && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    BOOL v19 = 0;
  }

  return v19;
}

- (void)setRegionHistory:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_regionHistory, a3);
  regionHistoryFileWrapper = self->_regionHistoryFileWrapper;
  regionHistory = self->_regionHistory;
  id v17 = 0;
  BOOL v8 = [(ENSecureArchiveFileWrapper *)regionHistoryFileWrapper saveObject:regionHistory error:&v17];
  id v9 = v17;
  if (!v8
    && gLogCategory_ENRegionHistoryManager <= 90
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    id v15 = v9;
    LogPrintF_safe();
  }
  uint64_t v10 = [(ENRegionHistory *)self->_regionHistory getRegionVisits];
  id v11 = [v10 lastObject];

  int v12 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v13 = [v12 isSensitiveLoggingAllowed];

  if (v13
    && gLogCategory_ENRegionHistoryManager <= 30
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    int v16 = v11;
    LogPrintF_safe();
  }
  v14 = [(ENRegionHistoryManager *)self delegate];
  [v14 currentRegionVisitDidChange:v11];
}

- (id)mergeRegionHistoryOnDisk:(id)a3 inMemory:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (!v7)
  {
    char v22 = [MEMORY[0x1E4F28B08] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"ENRegionHistoryManager.m", 262, @"Invalid parameter not satisfying: %@", @"onDiskHistory" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
LABEL_24:
    v23 = [MEMORY[0x1E4F28B08] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"ENRegionHistoryManager.m", 263, @"Invalid parameter not satisfying: %@", @"inMemoryHistory" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v8) {
    goto LABEL_24;
  }
LABEL_3:
  uint64_t v10 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v11 = [v10 isSensitiveLoggingAllowed];

  if (v11
    && gLogCategory_ENRegionHistoryManager <= 30
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    id v24 = v7;
    long long v25 = v9;
    LogPrintF_safe();
  }
  int v12 = objc_msgSend(v9, "getRegionVisits", v24, v25);
  int v13 = (void *)[v7 copy];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v12;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        [v13 addRegionVisit:*(void *)(*((void *)&v26 + 1) + 8 * i)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v16);
  }

  BOOL v19 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v20 = [v19 isSensitiveLoggingAllowed];

  if (v20
    && gLogCategory_ENRegionHistoryManager <= 30
    && (gLogCategory_ENRegionHistoryManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v13;
}

- (ENRegionHistoryManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ENRegionHistoryManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)fileStatus
{
  return self->_fileStatus;
}

- (NSString)directoryPath
{
  return self->_directoryPath;
}

- (void)setDirectoryPath:(id)a3
{
}

- (ENSecureArchiveFileWrapper)regionHistoryFileWrapper
{
  return self->_regionHistoryFileWrapper;
}

- (void)setRegionHistoryFileWrapper:(id)a3
{
}

- (ENRegionHistory)regionHistory
{
  return self->_regionHistory;
}

- (int)resetToken
{
  return self->_resetToken;
}

- (void)setResetToken:(int)a3
{
  self->_resetToken = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_regionHistory, 0);
  objc_storeStrong((id *)&self->_regionHistoryFileWrapper, 0);
  objc_storeStrong((id *)&self->_directoryPath, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end