@interface BRKDataCollectionLogger
+ (id)sharedInstance;
- (BOOL)_dataCollectionEnabled;
- (BOOL)_dataCollectionIsAllowedToRunInCurrentProcess;
- (BOOL)_shouldAllowDataCollectionUpload;
- (id)_deviceIdentifier;
- (id)_idsFileListPath;
- (id)_init;
- (id)_internalDeviceIdentifier;
- (id)_pathExtension:(id)a3;
- (id)_stringByRemovingPathExtension:(id)a3;
- (id)markFileForUpload:(id)a3;
- (void)_forceUpload;
- (void)_logUploadWithPath:(id)a3;
- (void)_purgeFilesForOSUpdate;
- (void)_purgeOutdatedFiles;
- (void)_refreshExternalDeviceMetadata;
- (void)_scheduleUploadTimer;
- (void)clearCollectedData;
- (void)dealloc;
@end

@implementation BRKDataCollectionLogger

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  }
  v2 = (void *)sharedInstance_SharedLogger;
  return v2;
}

uint64_t __41__BRKDataCollectionLogger_sharedInstance__block_invoke()
{
  sharedInstance_SharedLogger = [[BRKDataCollectionLogger alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  v26.receiver = self;
  v26.super_class = (Class)BRKDataCollectionLogger;
  v2 = [(BRKDataCollectionLogger *)&v26 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v4 = +[BRKDataCollectionBundle defaultLogDirectory];
    storageDirectory = v3->_storageDirectory;
    v3->_storageDirectory = (NSString *)v4;

    v6 = (void *)MEMORY[0x263EFF980];
    v7 = [(BRKDataCollectionLogger *)v3 _idsFileListPath];
    v8 = [v6 arrayWithContentsOfFile:v7];
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v10 = [MEMORY[0x263EFF980] array];
    }
    idsFilesList = v3->_idsFilesList;
    v3->_idsFilesList = v10;

    v12 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    dateFormatter = v3->_dateFormatter;
    v3->_dateFormatter = v12;

    v14 = v3->_dateFormatter;
    v15 = [MEMORY[0x263EFFA18] timeZoneWithAbbreviation:@"UTC"];
    [(NSDateFormatter *)v14 setTimeZone:v15];

    [(NSDateFormatter *)v3->_dateFormatter setDateFormat:@"yyyy/MM/dd/HH/mm"];
    uint64_t v16 = BRKCreateDispatchQueue();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v16;

    v18 = [MEMORY[0x263F08A00] defaultCenter];
    v19 = BRKSignificantTimeChangeNotification();
    [v18 addObserver:v3 selector:sel__purgeOutdatedFiles name:v19 object:0];

    if ((BRKIsInternalBuild() & 1) == 0)
    {
      v20 = [MEMORY[0x263F08C38] UUID];
      uint64_t v21 = [v20 UUIDString];
      externalDailyDeviceIdentifier = v3->_externalDailyDeviceIdentifier;
      v3->_externalDailyDeviceIdentifier = (NSString *)v21;

      v23 = [MEMORY[0x263F08A00] defaultCenter];
      v24 = BRKSignificantTimeChangeNotification();
      [v23 addObserver:v3 selector:sel__refreshExternalDeviceMetadata name:v24 object:0];
    }
    [(BRKDataCollectionLogger *)v3 _purgeOutdatedFiles];
    [(BRKDataCollectionLogger *)v3 _scheduleUploadTimer];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v5.receiver = self;
  v5.super_class = (Class)BRKDataCollectionLogger;
  [(BRKDataCollectionLogger *)&v5 dealloc];
}

- (id)_internalDeviceIdentifier
{
  v2 = (void *)CFPreferencesCopyAppValue(@"DCDeviceId", @"com.apple.dcservices");
  if (!v2)
  {
    v3 = [MEMORY[0x263F08C38] UUID];
    v2 = [v3 UUIDString];

    CFPreferencesSetAppValue(@"DCDeviceId", v2, @"com.apple.dcservices");
    CFPreferencesAppSynchronize(@"com.apple.dcservices");
  }
  return v2;
}

- (id)_deviceIdentifier
{
  if (BRKIsInternalBuild())
  {
    v3 = [(BRKDataCollectionLogger *)self _internalDeviceIdentifier];
  }
  else
  {
    v3 = self->_externalDailyDeviceIdentifier;
  }
  return v3;
}

- (void)_refreshExternalDeviceMetadata
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    v14 = @"Refreshing device identifier and session upload count after significant time change.";
    _os_log_impl(&dword_234680000, v3, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v4 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    externalDailyDeviceIdentifier = self->_externalDailyDeviceIdentifier;
    unint64_t externalDailySessionUploadCount = self->_externalDailySessionUploadCount;
    int v13 = 138412546;
    v14 = (__CFString *)externalDailyDeviceIdentifier;
    __int16 v15 = 2048;
    unint64_t v16 = externalDailySessionUploadCount;
    _os_log_impl(&dword_234680000, v4, OS_LOG_TYPE_INFO, "Current device identifier: %@, session upload count: %lu", (uint8_t *)&v13, 0x16u);
  }

  v7 = [MEMORY[0x263F08C38] UUID];
  v8 = [v7 UUIDString];
  v9 = self->_externalDailyDeviceIdentifier;
  self->_externalDailyDeviceIdentifier = v8;

  self->_unint64_t externalDailySessionUploadCount = 0;
  v10 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = self->_externalDailyDeviceIdentifier;
    unint64_t v12 = self->_externalDailySessionUploadCount;
    int v13 = 138412546;
    v14 = (__CFString *)v11;
    __int16 v15 = 2048;
    unint64_t v16 = v12;
    _os_log_impl(&dword_234680000, v10, OS_LOG_TYPE_INFO, "Refreshed device identifier: %@, session upload count: %lu", (uint8_t *)&v13, 0x16u);
  }
}

- (BOOL)_dataCollectionIsAllowedToRunInCurrentProcess
{
  return MEMORY[0x270F128C8](self, a2);
}

- (id)_idsFileListPath
{
  return [(NSString *)self->_storageDirectory stringByAppendingPathComponent:@"BrookDataCollection-ids.dat"];
}

- (void)_purgeFilesForOSUpdate
{
  if ([(BRKDataCollectionLogger *)self _dataCollectionIsAllowedToRunInCurrentProcess])
  {
    BRKBuildVersion();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.brook"];
    uint64_t v4 = [v3 stringForKey:@"DataCollectionLoggerBuild"];
    char v5 = [v4 isEqualToString:v8];

    if ((v5 & 1) == 0)
    {
      v6 = [MEMORY[0x263F08850] defaultManager];
      [v6 removeItemAtPath:self->_storageDirectory error:0];

      v7 = [MEMORY[0x263F08850] defaultManager];
      [v7 createDirectoryAtPath:self->_storageDirectory withIntermediateDirectories:1 attributes:0 error:0];

      [v3 setObject:v8 forKey:@"DataCollectionLoggerBuild"];
    }
  }
}

- (void)_purgeOutdatedFiles
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(BRKDataCollectionLogger *)self _dataCollectionIsAllowedToRunInCurrentProcess])
  {
    v3 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v4 = [NSURL fileURLWithPath:self->_storageDirectory];
    char v5 = [v3 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:0 errorHandler:0];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      v9 = 0;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          int v13 = BRKFileModifiedDate();
          [v13 timeIntervalSinceNow];
          double v15 = fabs(v14);

          if (v15 > 259200.0)
          {
            unint64_t v16 = [MEMORY[0x263F08850] defaultManager];
            id v21 = v9;
            char v17 = [v16 removeItemAtURL:v12 error:&v21];
            id v18 = v21;

            if ((v17 & 1) == 0)
            {
              v19 = BRKLoggingObjectForDomain();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v27 = v12;
                __int16 v28 = 2112;
                id v29 = v18;
                _os_log_error_impl(&dword_234680000, v19, OS_LOG_TYPE_ERROR, "Unable to remove stale file %@ %@", buf, 0x16u);
              }
            }
            v9 = v18;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v20 = BRKLoggingObjectForDomain();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_234680000, v20, OS_LOG_TYPE_DEFAULT, "Purged outdated log files", buf, 2u);
    }
  }
}

- (id)_stringByRemovingPathExtension:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@".tar.gz"]) {
    [v3 substringToIndex:objc_msgSend(v3, "length") - objc_msgSend(@".tar.gz", "length")];
  }
  else {
  uint64_t v4 = [v3 stringByDeletingPathExtension];
  }

  return v4;
}

- (id)_pathExtension:(id)a3
{
  id v3 = a3;
  if ([v3 hasSuffix:@".tar.gz"])
  {
    uint64_t v4 = @"tar";
  }
  else
  {
    uint64_t v4 = [v3 pathExtension];
  }

  return v4;
}

- (id)markFileForUpload:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v4;
    _os_log_impl(&dword_234680000, v5, OS_LOG_TYPE_DEFAULT, "Mark file for upload: %@", buf, 0xCu);
  }

  if ([(BRKDataCollectionLogger *)self _dataCollectionIsAllowedToRunInCurrentProcess])
  {
    id v6 = [MEMORY[0x263EFF910] date];
    uint64_t v7 = [v4 lastPathComponent];
    uint64_t v8 = [(BRKDataCollectionLogger *)self _stringByRemovingPathExtension:v7];

    v9 = [v8 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

    uint64_t v10 = NSString;
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v12 = [v10 stringWithFormat:@"%@-%@-%@-%@-%f", @"brook", @"archive", @"Carousel", v9, v11];
    int v13 = [(BRKDataCollectionLogger *)self _pathExtension:v4];
    double v14 = [v12 stringByAppendingPathExtension:v13];

    double v15 = [(NSString *)self->_storageDirectory stringByAppendingPathComponent:v14];
    unint64_t v16 = [MEMORY[0x263F08850] defaultManager];
    id v24 = 0;
    char v17 = [v16 copyItemAtPath:v4 toPath:v15 error:&v24];
    id v18 = v24;

    v19 = BRKLoggingObjectForDomain();
    v20 = v19;
    if (v17)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_234680000, v20, OS_LOG_TYPE_DEFAULT, "Marking session for upload", buf, 2u);
      }

      if ([(BRKDataCollectionLogger *)self _shouldAllowDataCollectionUpload])
      {
        os_unfair_lock_lock(&self->_lock);
        [(BRKDataCollectionLogger *)self _logUploadWithPath:v15];
        os_unfair_lock_unlock(&self->_lock);
        [(BRKDataCollectionLogger *)self _scheduleUploadTimer];
        id v21 = [NSURL fileURLWithPath:v15];
        BRKMarkFilePurgeable();

        id v22 = v15;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        [(BRKDataCollectionLogger *)(uint64_t)v4 markFileForUpload:v20];
      }
    }
    id v22 = 0;
    goto LABEL_16;
  }
  id v6 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_234680000, v6, OS_LOG_TYPE_DEFAULT, "Not running in correct process", buf, 2u);
  }
  id v22 = 0;
LABEL_17:

  return v22;
}

- (void)clearCollectedData
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_234680000, a2, OS_LOG_TYPE_ERROR, "Unable to clear collected data %@", (uint8_t *)&v2, 0xCu);
}

- (BOOL)_dataCollectionEnabled
{
  int v2 = [MEMORY[0x263F2BBE8] settingsForActiveDevice];
  char v3 = [v2 isDataCollectionEnabled];

  return v3;
}

- (BOOL)_shouldAllowDataCollectionUpload
{
  if ([(BRKDataCollectionLogger *)self _dataCollectionIsAllowedToRunInCurrentProcess])
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if ([(BRKDataCollectionLogger *)self _dataCollectionEnabled])
    {
      if ((BRKIsInternalBuild() & 1) == 0)
      {
        unint64_t externalDailySessionUploadCount = self->_externalDailySessionUploadCount;
        if (externalDailySessionUploadCount >= 5)
        {
          char v5 = BRKLoggingObjectForDomain();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v9 = 0;
            _os_log_impl(&dword_234680000, v5, OS_LOG_TYPE_DEFAULT, "Data collection hit daily limit", v9, 2u);
          }

          goto LABEL_8;
        }
        self->_unint64_t externalDailySessionUploadCount = externalDailySessionUploadCount + 1;
      }
      BOOL v6 = 1;
      goto LABEL_14;
    }
LABEL_8:
    BOOL v6 = 0;
LABEL_14:
    os_unfair_lock_unlock(p_lock);
    return v6;
  }
  uint64_t v7 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_234680000, v7, OS_LOG_TYPE_DEFAULT, "Data collection not running in correct process", buf, 2u);
  }

  return 0;
}

- (void)_logUploadWithPath:(id)a3
{
  id v6 = a3;
  if ([(BRKDataCollectionLogger *)self _dataCollectionEnabled])
  {
    [(NSMutableArray *)self->_idsFilesList addObject:v6];
    idsFilesList = self->_idsFilesList;
    char v5 = [(BRKDataCollectionLogger *)self _idsFileListPath];
    [(NSMutableArray *)idsFilesList writeToFile:v5 atomically:1];
  }
}

- (void)_forceUpload
{
  char v3 = BRKLoggingObjectForDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_234680000, v3, OS_LOG_TYPE_DEFAULT, "Force uploading data collection logs", v4, 2u);
  }

  [(BRKDataCollectionLogger *)self _triggerUpload:1];
}

- (void)_scheduleUploadTimer
{
  char v3 = objc_alloc_init(BRKDataCollectionScheduler);
  uploadScheduler = self->_uploadScheduler;
  self->_uploadScheduler = v3;

  objc_initWeak(&location, self);
  char v5 = self->_uploadScheduler;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __47__BRKDataCollectionLogger__scheduleUploadTimer__block_invoke;
  v6[3] = &unk_264BF7010;
  objc_copyWeak(&v7, &location);
  [(BRKDataCollectionScheduler *)v5 schedule:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __47__BRKDataCollectionLogger__scheduleUploadTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _triggerUpload:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_externalDailyDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_idsFilesList, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_uploadScheduler, 0);
  objc_storeStrong((id *)&self->_storageDirectory, 0);
}

- (void)markFileForUpload:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_234680000, log, OS_LOG_TYPE_ERROR, "Unable to move file for upload %@ %@", (uint8_t *)&v3, 0x16u);
}

@end