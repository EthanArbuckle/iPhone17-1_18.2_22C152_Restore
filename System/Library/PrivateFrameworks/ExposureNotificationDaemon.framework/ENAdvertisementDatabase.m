@interface ENAdvertisementDatabase
+ (BOOL)purgeAllStoresInPath:(id)a3;
- (BOOL)cloneDatabaseTo:(id)a3;
- (BOOL)flushCache;
- (BOOL)mergeStores:(id)a3;
- (BOOL)mergeStoresFromFolderPath:(id)a3;
- (BOOL)mergeTemporaryStores;
- (BOOL)openCentralStoreAndReturnError:(id *)a3;
- (BOOL)openStoreAndReturnError:(id *)a3;
- (BOOL)openTemporaryStore;
- (BOOL)purgeAdvertismentsOlderThan:(double)a3;
- (BOOL)purgeAdvertismentsSeenBeforeDate:(id)a3;
- (BOOL)purgeAllStoresInActiveDatabasePath;
- (BOOL)saveContactTracingAdvertisement:(id)a3;
- (BOOL)switchToCentralStore;
- (BOOL)temporaryStoresPresent;
- (ENAdvertisementDatabase)init;
- (ENAdvertisementDatabase)initWithDatabaseFolderPath:(id)a3 cacheCount:(unint64_t)a4;
- (ENAdvertisementDatabase)initWithDatabaseFolderPath:(id)a3 cacheCount:(unint64_t)a4 errorMetricReporter:(id)a5;
- (ENQueryFilter)inlineQueryFilter;
- (NSNumber)storedAdvertisementCount;
- (double)storageFullAlertInterval;
- (id)advertisementsBufferMatchingDailyKeys:(id)a3 attenuationThreshold:(unsigned __int8)a4 timestampTolerance:(double)a5;
- (id)beaconCountMetricsWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5;
- (id)createQuerySessionWithAttenuationThreshold:(unsigned __int8)a3 queue:(id)a4 error:(id *)a5;
- (id)currentStore;
- (id)matchingAdvertisementBufferForRPIBuffer:(id)a3 exposureKeys:(id)a4;
- (id)queryFilterWithBufferSize:(unint64_t)a3 hashCount:(unint64_t)a4 attenuationThreshold:(unsigned __int8)a5;
- (unint64_t)currentStoreType;
- (unint64_t)droppedAdvertisementCount;
- (unsigned)cacheRecordCount;
- (void)closeAllStores;
- (void)dealloc;
- (void)displayStorageFullAlert;
- (void)reportErrorMetric:(unsigned int)a3;
- (void)reportStoreError:(id)a3;
- (void)setInlineQueryFilter:(id)a3;
- (void)setStorageFullAlertInterval:(double)a3;
@end

@implementation ENAdvertisementDatabase

- (ENAdvertisementDatabase)init
{
  return [(ENAdvertisementDatabase *)self initWithDatabaseFolderPath:@"/var/root/" cacheCount:1];
}

- (ENAdvertisementDatabase)initWithDatabaseFolderPath:(id)a3 cacheCount:(unint64_t)a4
{
  return [(ENAdvertisementDatabase *)self initWithDatabaseFolderPath:a3 cacheCount:a4 errorMetricReporter:&__block_literal_global_10];
}

- (ENAdvertisementDatabase)initWithDatabaseFolderPath:(id)a3 cacheCount:(unint64_t)a4 errorMetricReporter:(id)a5
{
  unsigned int v6 = a4;
  id v9 = a3;
  id v10 = a5;
  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v17 = [(NSString *)self->_databaseFolderPath UTF8String];
    LogPrintF_safe();
  }
  v18.receiver = self;
  v18.super_class = (Class)ENAdvertisementDatabase;
  v11 = [(ENAdvertisementDatabase *)&v18 init];
  if (!v11) {
    goto LABEL_8;
  }
  uint64_t v12 = MEMORY[0x1D9439FF0](v10);
  id errorMetricReporter = v11->_errorMetricReporter;
  v11->_id errorMetricReporter = (id)v12;

  objc_storeStrong((id *)&v11->_databaseFolderPath, a3);
  v11->_advertisementInsertionCacheCount = v6;
  v11->_advertisementInsertionIndex = 0;
  v11->_storageFullAlertInterval = 60.0;
  v11->_previousStoreFullAlertTimestamp = 0;
  v11->_currentStoreType = 2;
  v14 = ($8B507D830E6EE36862B76123793C2CB9 *)malloc_type_malloc(40 * v6, 0x10000400A747E1EuLL);
  v11->_advertisementInsertionCache = v14;
  if (v14)
  {
    [(ENAdvertisementDatabase *)v11 openStoreAndReturnError:0];
LABEL_8:
    v15 = v11;
    goto LABEL_14;
  }
  if (gLogCategory__ENAdvertisementDatabase <= 90
    && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (void)dealloc
{
  free(self->_advertisementInsertionCache);
  v3.receiver = self;
  v3.super_class = (Class)ENAdvertisementDatabase;
  [(ENAdvertisementDatabase *)&v3 dealloc];
}

- (void)reportErrorMetric:(unsigned int)a3
{
  id errorMetricReporter = (void (**)(id, void))self->_errorMetricReporter;
  if (errorMetricReporter) {
    errorMetricReporter[2](errorMetricReporter, *(void *)&a3);
  }
}

- (void)reportStoreError:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    v5 = [v4 domain];
    int v6 = [v5 isEqualToString:@"ENAdvertisementStoreErrorDomain"];

    id v4 = v8;
    if (v6)
    {
      unint64_t v7 = [v8 code] - 1;
      id v4 = v8;
      if (v7 <= 6 && ((0x47u >> v7) & 1) != 0)
      {
        [(ENAdvertisementDatabase *)self reportErrorMetric:dword_1D3A7B408[v7]];
        id v4 = v8;
      }
    }
  }
}

- (BOOL)openStoreAndReturnError:(id *)a3
{
  if ([(ENAdvertisementDatabase *)self openCentralStoreAndReturnError:a3])
  {
    [(ENAdvertisementDatabase *)self mergeTemporaryStores];
    return 1;
  }
  if ([(ENAdvertisementDatabase *)self openTemporaryStore]) {
    return 1;
  }
  if (gLogCategory__ENAdvertisementDatabase <= 90
    && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    v5 = [(NSString *)self->_databaseFolderPath UTF8String];
    LogPrintF_safe();
  }
  self->_currentStoreType = 2;
  -[ENAdvertisementDatabase reportErrorMetric:](self, "reportErrorMetric:", 1003, v5);
  return 0;
}

- (BOOL)openCentralStoreAndReturnError:(id *)a3
{
  if (self->_centralStore) {
    return 1;
  }
  v5 = +[ENAdvertisementSQLiteStore centralStoreInFolderPath:self->_databaseFolderPath error:a3];
  centralStore = self->_centralStore;
  self->_centralStore = v5;

  if (!self->_centralStore) {
    return 0;
  }
  temporaryStore = self->_temporaryStore;
  self->_temporaryStore = 0;

  BOOL result = 1;
  self->_currentStoreType = 1;
  return result;
}

- (BOOL)openTemporaryStore
{
  if (self->_centralStore || self->_temporaryStore) {
    return 0;
  }
  databaseFolderPath = self->_databaseFolderPath;
  id v10 = 0;
  int v6 = +[ENAdvertisementSQLiteStore temporaryStoreInFolderPath:databaseFolderPath error:&v10];
  id v7 = v10;
  temporaryStore = self->_temporaryStore;
  self->_temporaryStore = v6;

  id v9 = self->_temporaryStore;
  BOOL v3 = v9 != 0;
  if (v9) {
    self->_currentStoreType = 0;
  }
  else {
    [(ENAdvertisementDatabase *)self reportStoreError:v7];
  }

  return v3;
}

- (BOOL)temporaryStoresPresent
{
  return +[ENAdvertisementSQLiteStore temporaryStoresPresentInFolderPath:self->_databaseFolderPath];
}

- (BOOL)switchToCentralStore
{
  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    [(NSString *)self->_databaseFolderPath UTF8String];
    LogPrintF_safe();
  }
  if (self->_centralStore) {
    return 0;
  }

  return [(ENAdvertisementDatabase *)self openCentralStoreAndReturnError:0];
}

- (BOOL)mergeStores:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v18;
    int v9 = 1;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        v11 = v7;
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        centralStore = self->_centralStore;
        id v16 = v7;
        BOOL v14 = [(ENAdvertisementSQLiteStore *)centralStore importContentsOfStore:v12 error:&v16];
        id v7 = v16;

        if (v14)
        {
          v9 &= [v12 purgeAndRemoveFromDisk:1];
        }
        else
        {
          [(ENAdvertisementDatabase *)self reportStoreError:v7];
          if ([v7 code] == 4)
          {
            [(ENAdvertisementDatabase *)self closeAllStores];
          }
          else if ([v7 code] == 3)
          {
            [(ENAdvertisementSQLiteStore *)self->_centralStore purgeAndRemoveFromDisk:0];
            [(ENAdvertisementDatabase *)self closeAllStores];
            LOBYTE(v9) = 0;
            goto LABEL_16;
          }
          int v9 = 0;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v6) {
        continue;
      }
      break;
    }
LABEL_16:
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)mergeTemporaryStores
{
  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = [(NSString *)self->_databaseFolderPath UTF8String];
    LogPrintF_safe();
  }
  uint64_t v8 = 0;
  int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  databaseFolderPath = self->_databaseFolderPath;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ENAdvertisementDatabase_mergeTemporaryStores__block_invoke;
  v7[3] = &unk_1E69AEC28;
  v7[4] = self;
  v7[5] = &v8;
  +[ENAdvertisementSQLiteStore enumerateTemporaryStoresInFolderPath:handler:](ENAdvertisementSQLiteStore, "enumerateTemporaryStoresInFolderPath:handler:", databaseFolderPath, v7, v6);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __47__ENAdvertisementDatabase_mergeTemporaryStores__block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = *(void **)(a1 + 32);
  v6[0] = v3;
  uint64_t v5 = [MEMORY[0x1E4F1C970] arrayWithObjects:v6 count:1];
  LOBYTE(v4) = [v4 mergeStores:v5];

  if ((v4 & 1) == 0) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)mergeStoresFromFolderPath:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[ENAdvertisementSQLiteStore storesPresentInFolderPath:v4])
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = [v4 UTF8String];
      uint64_t v12 = [(NSString *)self->_databaseFolderPath UTF8String];
      LogPrintF_safe();
    }
    uint64_t v16 = 0;
    long long v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 1;
    uint64_t v6 = +[ENAdvertisementSQLiteStore centralStoreInFolderPath:error:](ENAdvertisementSQLiteStore, "centralStoreInFolderPath:error:", v4, 0, v11, v12);
    id v7 = (void *)v6;
    if (v6)
    {
      v20[0] = v6;
      uint64_t v8 = [MEMORY[0x1E4F1C970] arrayWithObjects:v20 count:1];
      BOOL v9 = [(ENAdvertisementDatabase *)self mergeStores:v8];

      if (!v9)
      {
        if (gLogCategory__ENAdvertisementDatabase <= 90
          && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
        {
          [v4 UTF8String];
          LogPrintF_safe();
        }
        *((unsigned char *)v17 + 24) = 0;
      }
    }
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __53__ENAdvertisementDatabase_mergeStoresFromFolderPath___block_invoke;
    v13[3] = &unk_1E69AEC50;
    v13[4] = self;
    id v14 = v4;
    v15 = &v16;
    +[ENAdvertisementSQLiteStore enumerateTemporaryStoresInFolderPath:v14 handler:v13];
    BOOL v5 = *((unsigned char *)v17 + 24) != 0;

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

void __53__ENAdvertisementDatabase_mergeStoresFromFolderPath___block_invoke(uint64_t a1, void *a2)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  v6[0] = v3;
  BOOL v5 = [MEMORY[0x1E4F1C970] arrayWithObjects:v6 count:1];
  LOBYTE(v4) = [v4 mergeStores:v5];

  if ((v4 & 1) == 0)
  {
    if (gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      [*(id *)(a1 + 40) UTF8String];
      LogPrintF_safe();
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)closeAllStores
{
  centralStore = self->_centralStore;
  self->_centralStore = 0;

  temporaryStore = self->_temporaryStore;
  self->_temporaryStore = 0;

  self->_currentStoreType = 2;
}

- (id)currentStore
{
  unint64_t currentStoreType = self->_currentStoreType;
  if (!currentStoreType)
  {
    uint64_t v3 = 56;
    goto LABEL_5;
  }
  if (currentStoreType == 1)
  {
    uint64_t v3 = 48;
LABEL_5:
    id v4 = *(id *)((char *)&self->super.isa + v3);
    goto LABEL_7;
  }
  id v4 = 0;
LABEL_7:

  return v4;
}

- (void)displayStorageFullAlert
{
  v21[5] = *MEMORY[0x1E4F143B8];
  if (alertActive == 1)
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    __uint64_t v3 = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
    unint64_t v4 = v3;
    unint64_t previousStoreFullAlertTimestamp = self->_previousStoreFullAlertTimestamp;
    if (!previousStoreFullAlertTimestamp
      || v3 > (unint64_t)((double)previousStoreFullAlertTimestamp + self->_storageFullAlertInterval
                                                                         * 1000000000.0))
    {
      if (gLogCategory_ENAdvertisementDatabase <= 50
        && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      uint64_t v6 = ENLocalizedString();
      id v7 = ENLocalizedString();
      uint64_t v8 = ENLocalizedString();
      BOOL v9 = ENLocalizedString();
      uint64_t v10 = *MEMORY[0x1E4F1D9A0];
      v20[0] = *MEMORY[0x1E4F1D998];
      v20[1] = v10;
      v21[0] = v6;
      v21[1] = v7;
      uint64_t v11 = *MEMORY[0x1E4F1D9C8];
      void v20[2] = *MEMORY[0x1E4F1D9D8];
      v20[3] = v11;
      v21[2] = v8;
      v21[3] = v9;
      v20[4] = *MEMORY[0x1E4FA72A8];
      v21[4] = MEMORY[0x1E4F1CC40];
      CFDictionaryRef v12 = [MEMORY[0x1E4F1C9E0] dictionaryWithObjects:v21 forKeys:v20 count:5];
      CFAllocatorRef v13 = (const __CFAllocator *)*MEMORY[0x1E4F1CF88];
      id v14 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF88], 0.0, 0, 0, v12);
      if (v14)
      {
        v15 = v14;
        CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(v13, v14, (CFUserNotificationCallBack)_ENAdvertisementDatabaseStorageFullResponseHandler, 0);
        if (RunLoopSource)
        {
          long long v17 = RunLoopSource;
          alertActive = 1;
          self->_unint64_t previousStoreFullAlertTimestamp = v4;
          Main = CFRunLoopGetMain();
          CFRunLoopAddSource(Main, v17, (CFRunLoopMode)*MEMORY[0x1E4F1D408]);
          char v19 = v17;
        }
        else
        {
          if (gLogCategory__ENAdvertisementDatabase <= 90
            && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          char v19 = v15;
        }
        CFRelease(v19);
      }
      else if (gLogCategory__ENAdvertisementDatabase <= 90 {
             && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF_safe();
      }
    }
  }
}

- (BOOL)saveContactTracingAdvertisement:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  advertisementInsertionCache = self->_advertisementInsertionCache;
  unsigned int advertisementInsertionIndex = self->_advertisementInsertionIndex;
  self->_unsigned int advertisementInsertionIndex = advertisementInsertionIndex + 1;
  uint64_t v8 = (char *)advertisementInsertionCache + 40 * advertisementInsertionIndex;
  if (v4)
  {
    [v4 structRepresentation];
  }
  else
  {
    uint64_t v13 = 0;
    long long v11 = 0u;
    long long v12 = 0u;
  }
  *((void *)v8 + 4) = v13;
  *(_OWORD *)uint64_t v8 = v11;
  *((_OWORD *)v8 + 1) = v12;
  BOOL v9 = self->_advertisementInsertionIndex != self->_advertisementInsertionCacheCount
    || [(ENAdvertisementDatabase *)self flushCache];

  return v9;
}

- (unsigned)cacheRecordCount
{
  uint64_t v2 = 16;
  if (!self->_advertisementInsertionCacheOverflowed) {
    uint64_t v2 = 20;
  }
  return *(_DWORD *)((char *)&self->super.isa + v2);
}

- (BOOL)flushCache
{
  __uint64_t v3 = [(ENAdvertisementDatabase *)self currentStore];

  if (!v3)
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    [(ENAdvertisementDatabase *)self openStoreAndReturnError:0];
  }
  uint64_t v4 = [(ENAdvertisementDatabase *)self cacheRecordCount];
  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    unint64_t currentStoreType = self->_currentStoreType;
    uint64_t v15 = v4;
    LogPrintF_safe();
  }
  BOOL v5 = [(ENAdvertisementDatabase *)self currentStore];
  advertisementInsertionCache = self->_advertisementInsertionCache;
  id v17 = 0;
  char v7 = [v5 saveContactTracingAdvertisementBuffer:advertisementInsertionCache count:v4 error:&v17];
  id v8 = v17;

  if (v7)
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    self->_advertisementInsertionCacheOverflowed = 0;
    p_uint64_t advertisementInsertionIndex = &self->_advertisementInsertionIndex;
LABEL_34:
    *p_uint64_t advertisementInsertionIndex = 0;
    goto LABEL_35;
  }
  if (gLogCategory__ENAdvertisementDatabase <= 90
    && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    unint64_t v14 = self->_currentStoreType;
    uint64_t advertisementInsertionIndex = self->_advertisementInsertionIndex;
    LogPrintF_safe();
  }
  -[ENAdvertisementDatabase reportStoreError:](self, "reportStoreError:", v8, v14, advertisementInsertionIndex);
  if ([v8 code] != 4)
  {
    if ([v8 code] != 3) {
      goto LABEL_25;
    }
    [(ENAdvertisementSQLiteStore *)self->_centralStore purgeAndRemoveFromDisk:0];
  }
  [(ENAdvertisementDatabase *)self closeAllStores];
LABEL_25:
  p_uint64_t advertisementInsertionIndex = &self->_advertisementInsertionIndex;
  if (self->_advertisementInsertionIndex == self->_advertisementInsertionCacheCount)
  {
    if ([v8 code] == 2
      || (+[ENLoggingPrefs sharedENLoggingPrefs],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          int v11 = [v10 isSensitiveLoggingAllowed],
          v10,
          v11))
    {
      [(ENAdvertisementDatabase *)self displayStorageFullAlert];
    }
    if (gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    self->_advertisementInsertionCacheOverflowed = 1;
    goto LABEL_34;
  }
LABEL_35:

  return v7;
}

- (NSNumber)storedAdvertisementCount
{
  centralStore = self->_centralStore;
  if (centralStore)
  {
LABEL_4:
    BOOL v5 = [(ENAdvertisementSQLiteStore *)centralStore storedAdvertisementCount];
    uint64_t v6 = v5;
    if (v5)
    {
      uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28EC8], "numberWithUnsignedInt:", -[ENAdvertisementDatabase cacheRecordCount](self, "cacheRecordCount")+ objc_msgSend(v5, "unsignedIntValue"));
    }
    else
    {
      uint64_t v4 = 0;
    }

    goto LABEL_8;
  }
  uint64_t v4 = 0;
  if ([(ENAdvertisementDatabase *)self openCentralStoreAndReturnError:0])
  {
    centralStore = self->_centralStore;
    goto LABEL_4;
  }
LABEL_8:

  return (NSNumber *)v4;
}

- (id)queryFilterWithBufferSize:(unint64_t)a3 hashCount:(unint64_t)a4 attenuationThreshold:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  BOOL v9 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v10 = [v9 isSensitiveLoggingAllowed];

  if (v10
    && gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    unint64_t v13 = a3;
    unint64_t v14 = a4;
    LogPrintF_safe();
  }
  if (self->_currentStoreType == 1)
  {
    if (![(ENAdvertisementDatabase *)self cacheRecordCount]
      || [(ENAdvertisementDatabase *)self flushCache])
    {
      int v11 = -[ENAdvertisementSQLiteStore queryFilterWithBufferSize:hashCount:attenuationThreshold:](self->_centralStore, "queryFilterWithBufferSize:hashCount:attenuationThreshold:", a3, a4, v5, v13, v14);
      goto LABEL_15;
    }
    if (gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  int v11 = 0;
LABEL_15:

  return v11;
}

- (id)beaconCountMetricsWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  int v10 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v11 = [v10 isSensitiveLoggingAllowed];

  if (v11
    && gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    double v16 = a5;
    id v14 = v8;
    id v15 = v9;
    LogPrintF_safe();
  }
  if (self->_currentStoreType == 1)
  {
    if (![(ENAdvertisementDatabase *)self cacheRecordCount]
      || [(ENAdvertisementDatabase *)self flushCache])
    {
      long long v12 = -[ENAdvertisementSQLiteStore beaconCountMetricsWithStartDate:endDate:windowDuration:](self->_centralStore, "beaconCountMetricsWithStartDate:endDate:windowDuration:", v8, v9, a5, v14, v15, *(void *)&v16);
      goto LABEL_15;
    }
    if (gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  long long v12 = 0;
LABEL_15:

  return v12;
}

- (id)matchingAdvertisementBufferForRPIBuffer:(id)a3 exposureKeys:(id)a4
{
  id v6 = a3;
  id v31 = a4;
  if (self->_currentStoreType != 1)
  {
    if (![(ENAdvertisementDatabase *)self switchToCentralStore])
    {
LABEL_32:
      char v19 = 0;
      goto LABEL_52;
    }
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  if ([(ENAdvertisementDatabase *)self cacheRecordCount]
    && ![(ENAdvertisementDatabase *)self flushCache])
  {
    if (gLogCategory__ENAdvertisementDatabase > 90
      || gLogCategory__ENAdvertisementDatabase == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_32;
    }
LABEL_23:
    LogPrintF_safe();
    goto LABEL_32;
  }
  size_t v7 = (unint64_t)[v6 length] >> 4;
  id v8 = malloc_type_calloc(v7, 1uLL, 0x100004077774924uLL);
  if (!v8)
  {
    if (gLogCategory__ENAdvertisementDatabase > 90
      || gLogCategory__ENAdvertisementDatabase == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_32;
    }
    goto LABEL_23;
  }
  id v9 = v8;
  size_t v29 = v7;
  id v30 = v6;
  uint64_t v10 = [v6 bytes];
  if ([v31 count])
  {
    int v11 = 0;
    unsigned int v12 = 0;
    LODWORD(v13) = 0;
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = 0;
      unsigned int v16 = v12;
      do
      {
        if (![(ENQueryFilter *)self->_inlineQueryFilter shouldIgnoreRPI:v10 + v16])
        {
          v9[(v11 + v15)] = 1;
          ++v14;
        }
        ++v15;
        v16 += 16;
      }
      while (v15 != 144);
      unint64_t v13 = (v13 + 1);
      v12 += 2304;
      v11 += 144;
    }
    while ([v31 count] > v13);
  }
  else
  {
    uint64_t v14 = 0;
  }
  id v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
  char v18 = [v17 isSensitiveLoggingAllowed];

  if ((v18 & 1) != 0
    && gLogCategory_ENAdvertisementDatabase <= 40
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    uint64_t v26 = v14;
    size_t v28 = v29 - v14;
    LogPrintF_safe();
  }
  id v32 = 0;
  uint64_t v33 = 0;
  unint64_t v20 = -[ENAdvertisementSQLiteStore getAdvertisementsMatchingRPIBuffer:count:validityBuffer:validRPICount:matchingAdvertisementBuffer:error:](self->_centralStore, "getAdvertisementsMatchingRPIBuffer:count:validityBuffer:validRPICount:matchingAdvertisementBuffer:error:", v10, v29, v9, v14, &v33, &v32, v26, v28);
  id v21 = v32;
  free(v9);
  uint64_t v22 = v33;
  v23 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v24 = [v23 isSensitiveLoggingAllowed];

  if (v22)
  {
    if (v24
      && gLogCategory_ENAdvertisementDatabase <= 40
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      unint64_t v27 = v20;
      LogPrintF_safe();
    }
    char v19 = objc_msgSend(MEMORY[0x1E4F1C9B0], "dataWithBytesNoCopy:length:", v33, 40 * v20, v27);
    id v6 = v30;
    goto LABEL_51;
  }
  if (v24
    && gLogCategory_ENAdvertisementDatabase <= 90
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  [(ENAdvertisementDatabase *)self reportStoreError:v21];
  id v6 = v30;
  if ([v21 code] == 4) {
    goto LABEL_49;
  }
  if ([v21 code] == 3)
  {
    [(ENAdvertisementSQLiteStore *)self->_centralStore purgeAndRemoveFromDisk:0];
LABEL_49:
    [(ENAdvertisementDatabase *)self closeAllStores];
  }
  char v19 = 0;
LABEL_51:

LABEL_52:

  return v19;
}

- (id)advertisementsBufferMatchingDailyKeys:(id)a3 attenuationThreshold:(unsigned __int8)a4 timestampTolerance:(double)a5
{
  unsigned int v60 = a4;
  id v7 = a3;
  id v8 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v9 = [v8 isSensitiveLoggingAllowed];

  if (v9
    && gLogCategory_ENAdvertisementDatabase <= 40
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    uint64_t v50 = [v7 count];
    LogPrintF_safe();
  }
  uint64_t v62 = 0;
  v63 = &v62;
  size_t v10 = 2304 * objc_msgSend(v7, "count", v50);
  uint64_t v64 = 0x2020000000;
  v65 = 0;
  v65 = malloc_type_malloc(v10, 0xC86D1DD6uLL);
  if (v63[3])
  {
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __105__ENAdvertisementDatabase_advertisementsBufferMatchingDailyKeys_attenuationThreshold_timestampTolerance___block_invoke;
    v61[3] = &unk_1E69AEC78;
    v61[4] = &v62;
    [v7 enumerateObjectsUsingBlock:v61];
    id v11 = objc_alloc(MEMORY[0x1E4F1C9B0]);
    uint64_t v12 = [v11 initWithBytesNoCopy:v63[3] length:v10];
    unint64_t v13 = [(ENAdvertisementDatabase *)self matchingAdvertisementBufferForRPIBuffer:v12 exposureKeys:v7];
    if (!v13
      && gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    unint64_t v15 = [v13 length];
    v59 = (void *)v12;
    id v58 = v13;
    uint64_t v16 = [v58 bytes];
    if (v13 && v15 >= 0x28)
    {
      uint64_t v17 = v16;
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      double v19 = *MEMORY[0x1E4F1CF70];
      double v20 = Current + *MEMORY[0x1E4F1CF70];
      if (v15 / 0x28 <= 1) {
        unint64_t v21 = 1;
      }
      else {
        unint64_t v21 = v15 / 0x28;
      }
      double v22 = v20 + -1209600.0;
      do
      {
        v23 = (void *)MEMORY[0x1D9439DC0]();
        int v24 = [v7 objectAtIndex:*(unsigned int *)(v17 + 28)];
        v25 = v24;
        if (*(double *)(v17 + 20) >= v22)
        {
          uint64_t v28 = [v24 rollingStartNumber] + *(unsigned __int16 *)(v17 + 32);
          double v29 = *(double *)(v17 + 20);
          if (v19 + (double)v28 * 600.0 - v19 - a5 <= v29
            && v29 <= v19 + (double)(v28 + 1) * 600.0 - v19 + a5)
          {
            id v32 = +[ENAdvertisement decryptedMetadataForTemporaryExposureKey:v25 encryptedAEM:v17 + 16 RPI:v17];
            uint64_t v33 = v32;
            if (v32)
            {
              uint64_t v34 = [v32 attenuationForRSSI:*(char *)(v17 + 36) saturated:*(unsigned __int8 *)(v17 + 38)];
              v35 = +[ENLoggingPrefs sharedENLoggingPrefs];
              int v36 = [v35 isRPILoggingAllowed];

              if (v36
                && gLogCategory_ENAdvertisementDatabase <= 10
                && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
              {
                v57 = CUPrintHex();
                uint64_t v37 = [v33 txPower];
                uint64_t v38 = *(char *)(v17 + 36);
                unsigned int v39 = [v33 calibrationConfidence];
                v40 = "?";
                if (v39 <= 3) {
                  v40 = off_1E69AEC98[(char)v39];
                }
                v55 = v40;
                uint64_t v56 = *(unsigned __int8 *)(v17 + 38);
                uint64_t v53 = v37;
                uint64_t v54 = v38;
                double v51 = *(double *)&v57;
                uint64_t v52 = v34;
                LogPrintF_safe();
              }
              if (v34 >= v60)
              {
                v47 = +[ENLoggingPrefs sharedENLoggingPrefs];
                int v48 = [v47 isSensitiveLoggingAllowed];

                if (v48
                  && gLogCategory_ENAdvertisementDatabase <= 50
                  && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF_safe();
                }
                goto LABEL_69;
              }
            }
            else
            {
              if (gLogCategory__ENAdvertisementDatabase <= 90
                && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              -[ENAdvertisementDatabase reportErrorMetric:](self, "reportErrorMetric:", 1006, *(void *)&v51);
LABEL_69:
              *(_DWORD *)(v17 + 28) = -1;
              ++self->_droppedAdvertisementCount;
            }

            goto LABEL_58;
          }
          id v30 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v31 = [v30 isSensitiveLoggingAllowed];

          if (v31
            && gLogCategory_ENAdvertisementDatabase <= 50
            && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          v43 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v44 = [v43 isRPILoggingAllowed];

          if (v44
            && gLogCategory_ENAdvertisementDatabase <= 50
            && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
          {
            v45 = [v7 objectAtIndex:*(unsigned int *)(v17 + 28)];
            v46 = [v45 keyData];
            uint64_t v53 = v28;
            uint64_t v52 = *(void *)(v17 + 20);
            double v51 = *(double *)&v46;
            LogPrintF_safe();
          }
        }
        else
        {
          uint64_t v26 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v27 = [v26 isSensitiveLoggingAllowed];

          if (v27
            && gLogCategory_ENAdvertisementDatabase <= 50
            && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
          {
            double v51 = v22;
            LogPrintF_safe();
          }
          v41 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v42 = [v41 isRPILoggingAllowed];

          if (v42
            && gLogCategory_ENAdvertisementDatabase <= 50
            && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
          {
            uint64_t v52 = *(void *)(v17 + 20);
            double v51 = *(double *)&v25;
            LogPrintF_safe();
          }
        }
        *(_DWORD *)(v17 + 28) = -1;
        ++self->_droppedAdvertisementCount;
LABEL_58:

        v17 += 40;
        --v21;
      }
      while (v21);
    }

    uint64_t v14 = v58;
  }
  else
  {
    if (gLogCategory__ENAdvertisementDatabase <= 90
      && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    uint64_t v14 = 0;
  }
  _Block_object_dispose(&v62, 8);

  return v14;
}

uint64_t __105__ENAdvertisementDatabase_advertisementsBufferMatchingDailyKeys_attenuationThreshold_timestampTolerance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 deriveRollingProximityIdentifiersWithBuffer:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) + 2304 * a3 count:144];
}

- (id)createQuerySessionWithAttenuationThreshold:(unsigned __int8)a3 queue:(id)a4 error:(id *)a5
{
  uint64_t v6 = a3;
  id v8 = a4;
  if ([(ENAdvertisementDatabase *)self openCentralStoreAndReturnError:a5])
  {
    int v9 = [(ENAdvertisementDatabase *)self storedAdvertisementCount];
    if (v9)
    {
      size_t v10 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v11 = [v10 isSensitiveLoggingAllowed];

      if (v11
        && gLogCategory_ENAdvertisementDatabase <= 50
        && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      uint64_t v12 = -[ENAdvertisementDatabaseQuerySession initWithDatabase:attenuationThreshold:advertisementCount:queue:]([ENAdvertisementDatabaseQuerySession alloc], "initWithDatabase:attenuationThreshold:advertisementCount:queue:", self, v6, [v9 unsignedIntValue], v8);
    }
    else
    {
      if (gLogCategory__ENAdvertisementDatabase <= 90
        && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)purgeAdvertismentsOlderThan:(double)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1C9C0] dateWithTimeIntervalSinceNow:-a3];
  LOBYTE(self) = [(ENAdvertisementDatabase *)self purgeAdvertismentsSeenBeforeDate:v4];

  return (char)self;
}

- (BOOL)purgeAdvertismentsSeenBeforeDate:(id)a3
{
  uint64_t v4 = (char *)a3;
  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    size_t v10 = v4;
    LogPrintF_safe();
  }
  centralStore = self->_centralStore;
  if (!centralStore)
  {
    id v7 = 0;
    goto LABEL_11;
  }
  id v12 = 0;
  BOOL v6 = [(ENAdvertisementSQLiteStore *)centralStore purgeAdvertismentsRecordedPriorToDate:v4 error:&v12];
  id v7 = v12;
  if (v6)
  {
LABEL_11:
    BOOL v8 = 1;
    goto LABEL_18;
  }
  if (gLogCategory__ENAdvertisementDatabase <= 90
    && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    size_t v10 = [(NSString *)self->_databaseFolderPath UTF8String];
    LogPrintF_safe();
  }
  -[ENAdvertisementDatabase reportStoreError:](self, "reportStoreError:", v7, v10);
  if ([v7 code] == 4) {
    goto LABEL_16;
  }
  if ([v7 code] == 3)
  {
    [(ENAdvertisementSQLiteStore *)self->_centralStore purgeAndRemoveFromDisk:0];
LABEL_16:
    [(ENAdvertisementDatabase *)self closeAllStores];
  }
  BOOL v8 = 0;
LABEL_18:
  if (self->_temporaryStore)
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    [(ENAdvertisementDatabase *)self closeAllStores];
  }
  if (!+[ENAdvertisementSQLiteStore removeAllTemporaryStoresFromDiskWithFolderPath:lastModifiedBeforeDate:](ENAdvertisementSQLiteStore, "removeAllTemporaryStoresFromDiskWithFolderPath:lastModifiedBeforeDate:", self->_databaseFolderPath, v4, v10))
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      int v11 = [(NSString *)self->_databaseFolderPath UTF8String];
      LogPrintF_safe();
    }
    BOOL v8 = 0;
  }
  -[ENAdvertisementDatabase openStoreAndReturnError:](self, "openStoreAndReturnError:", 0, v11);

  return v8;
}

- (BOOL)purgeAllStoresInActiveDatabasePath
{
  self->_uint64_t advertisementInsertionIndex = 0;
  bzero(self->_advertisementInsertionCache, 40 * self->_advertisementInsertionCacheCount);
  self->_advertisementInsertionCacheOverflowed = 0;
  [(ENAdvertisementDatabase *)self closeAllStores];
  databaseFolderPath = self->_databaseFolderPath;

  return +[ENAdvertisementDatabase purgeAllStoresInPath:databaseFolderPath];
}

+ (BOOL)purgeAllStoresInPath:(id)a3
{
  id v3 = a3;
  if (gLogCategory_ENAdvertisementDatabase <= 50
    && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    id v6 = v3;
    LogPrintF_safe();
  }
  BOOL v4 = +[ENAdvertisementSQLiteStore removeAllStoresFromDiskWithFolderPath:](ENAdvertisementSQLiteStore, "removeAllStoresFromDiskWithFolderPath:", v3, v6);
  if (!v4
    && gLogCategory__ENAdvertisementDatabase <= 90
    && (gLogCategory__ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v4;
}

- (BOOL)cloneDatabaseTo:(id)a3
{
  id v4 = a3;
  if (self->_centralStore)
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      id v7 = v4;
      LogPrintF_safe();
    }
    [(ENAdvertisementDatabase *)self flushCache];
    BOOL v5 = [(ENAdvertisementSQLiteStore *)self->_centralStore cloneStoreTo:v4];
  }
  else
  {
    if (gLogCategory_ENAdvertisementDatabase <= 50
      && (gLogCategory_ENAdvertisementDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)currentStoreType
{
  return self->_currentStoreType;
}

- (ENQueryFilter)inlineQueryFilter
{
  return self->_inlineQueryFilter;
}

- (void)setInlineQueryFilter:(id)a3
{
}

- (unint64_t)droppedAdvertisementCount
{
  return self->_droppedAdvertisementCount;
}

- (double)storageFullAlertInterval
{
  return self->_storageFullAlertInterval;
}

- (void)setStorageFullAlertInterval:(double)a3
{
  self->_storageFullAlertInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inlineQueryFilter, 0);
  objc_storeStrong(&self->_errorMetricReporter, 0);
  objc_storeStrong((id *)&self->_temporaryStore, 0);
  objc_storeStrong((id *)&self->_centralStore, 0);

  objc_storeStrong((id *)&self->_databaseFolderPath, 0);
}

@end