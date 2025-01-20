@interface FLLoggingContext
+ (BOOL)isInternalBuild;
+ (BOOL)isRunningInExtension;
+ (unint64_t)inferredPersistenceConfiguration;
- (BOOL)deviceUnlockedSinceBoot;
- (FLAutoBugCapture)autoBugCapture;
- (FLContainerStorePathManager)containerStorePathManager;
- (FLLoggingContext)init;
- (FLLoggingContext)initWithFileManager:(id)a3;
- (FLLoggingContext)initWithFileManager:(id)a3 persistenceConfiguration:(unint64_t)a4;
- (FLLoggingContext)initWithFileManager:(id)a3 persistenceConfiguration:(unint64_t)a4 userDefaults:(id)a5 autoBugCapture:(id)a6 containerStorePathManager:(id)a7;
- (FLLoggingContext)initWithFileManager:(id)a3 userDefaults:(id)a4 autoBugCapture:(id)a5;
- (FLLoggingContext)initWithFileManager:(id)a3 userDefaults:(id)a4 autoBugCapture:(id)a5 containerStorePathManager:(id)a6;
- (NSFileManager)fileManager;
- (NSMutableDictionary)storeIdToUserCachesDirectoryPathMap;
- (NSString)timestampReferenceIdentifier;
- (NSUserDefaults)userDefaults;
- (OS_dispatch_queue)queue;
- (OS_os_log)log;
- (id)pathForStore:(id)a3;
- (id)userCachesDirectoryPathForStore:(id)a3;
- (unint64_t)persistenceConfiguration;
- (void)reportTelemetry:(id)a3 payload:(id)a4;
- (void)setAutoBugCapture:(id)a3;
- (void)setContainerStorePathManager:(id)a3;
- (void)setFileManager:(id)a3;
- (void)setLog:(id)a3;
- (void)setPersistenceConfiguration:(unint64_t)a3;
- (void)setStoreIdToUserCachesDirectoryPathMap:(id)a3;
- (void)setTimestampReferenceIdentifier:(id)a3;
@end

@implementation FLLoggingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_storeIdToUserCachesDirectoryPathMap, 0);
  objc_storeStrong((id *)&self->_autoBugCapture, 0);
  objc_storeStrong((id *)&self->_containerStorePathManager, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_timestampReferenceIdentifier, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setLog:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setStoreIdToUserCachesDirectoryPathMap:(id)a3
{
}

- (NSMutableDictionary)storeIdToUserCachesDirectoryPathMap
{
  return self->_storeIdToUserCachesDirectoryPathMap;
}

- (void)setAutoBugCapture:(id)a3
{
}

- (FLAutoBugCapture)autoBugCapture
{
  return self->_autoBugCapture;
}

- (void)setContainerStorePathManager:(id)a3
{
}

- (FLContainerStorePathManager)containerStorePathManager
{
  return self->_containerStorePathManager;
}

- (void)setFileManager:(id)a3
{
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setTimestampReferenceIdentifier:(id)a3
{
}

- (NSString)timestampReferenceIdentifier
{
  return self->_timestampReferenceIdentifier;
}

- (void)setPersistenceConfiguration:(unint64_t)a3
{
  self->_persistenceConfiguration = a3;
}

- (unint64_t)persistenceConfiguration
{
  return self->_persistenceConfiguration;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)userCachesDirectoryPathForStore:(id)a3
{
  id v4 = a3;
  v5 = [(FLLoggingContext *)self storeIdToUserCachesDirectoryPathMap];
  v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    v7 = [(FLLoggingContext *)self fileManager];
    v8 = [v7 urlForStoreWithId:v4];
    v6 = [v8 path];

    if (v6)
    {
      v9 = [(FLLoggingContext *)self storeIdToUserCachesDirectoryPathMap];
      [v9 setObject:v6 forKeyedSubscript:v4];
    }
  }

  return v6;
}

- (id)pathForStore:(id)a3
{
  id v5 = a3;
  unint64_t v6 = [(FLLoggingContext *)self persistenceConfiguration];
  if (v6)
  {
    if (v6 == 2)
    {
      v3 = [(FLLoggingContext *)self userCachesDirectoryPathForStore:v5];
    }
    else if (v6 == 1)
    {
      v7 = [(FLLoggingContext *)self containerStorePathManager];
      v3 = [v7 containerPathForStoreId:v5];
    }
  }
  else
  {
    v8 = [(FLLoggingContext *)self log];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1BA2B8000, v8, OS_LOG_TYPE_ERROR, "Default persistence configuration should have been replaced with an inferred value.", v10, 2u);
    }

    v3 = 0;
  }

  return v3;
}

- (void)reportTelemetry:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __44__FLLoggingContext_reportTelemetry_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)deviceUnlockedSinceBoot
{
  return 1;
}

- (FLLoggingContext)initWithFileManager:(id)a3 persistenceConfiguration:(unint64_t)a4 userDefaults:(id)a5 autoBugCapture:(id)a6 containerStorePathManager:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)FLLoggingContext;
  v17 = [(FLLoggingContext *)&v29 init];
  v18 = v17;
  if (v17)
  {
    uint64_t v19 = flLogForObject(v17);
    log = v18->_log;
    v18->_log = (OS_os_log *)v19;

    objc_storeStrong((id *)&v18->_fileManager, a3);
    if (!a4) {
      a4 = [(id)objc_opt_class() inferredPersistenceConfiguration];
    }
    v18->_persistenceConfiguration = a4;
    uint64_t v21 = FLGetBootSessionUUID();
    timestampReferenceIdentifier = v18->_timestampReferenceIdentifier;
    v18->_timestampReferenceIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v18->_userDefaults, a5);
    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.feedbacklogger", v23);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v24;

    objc_storeStrong((id *)&v18->_containerStorePathManager, a7);
    objc_storeStrong((id *)&v18->_autoBugCapture, a6);
    uint64_t v26 = [MEMORY[0x1E4F1CA60] dictionary];
    storeIdToUserCachesDirectoryPathMap = v18->_storeIdToUserCachesDirectoryPathMap;
    v18->_storeIdToUserCachesDirectoryPathMap = (NSMutableDictionary *)v26;
  }
  return v18;
}

- (FLLoggingContext)initWithFileManager:(id)a3 userDefaults:(id)a4 autoBugCapture:(id)a5 containerStorePathManager:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = -[FLLoggingContext initWithFileManager:persistenceConfiguration:userDefaults:autoBugCapture:containerStorePathManager:](self, "initWithFileManager:persistenceConfiguration:userDefaults:autoBugCapture:containerStorePathManager:", v13, [(id)objc_opt_class() inferredPersistenceConfiguration], v12, v11, v10);

  return v14;
}

- (FLLoggingContext)initWithFileManager:(id)a3 userDefaults:(id)a4 autoBugCapture:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(FLContainerStorePathManager);
  id v12 = [(FLLoggingContext *)self initWithFileManager:v10 userDefaults:v9 autoBugCapture:v8 containerStorePathManager:v11];

  return v12;
}

- (FLLoggingContext)initWithFileManager:(id)a3 persistenceConfiguration:(unint64_t)a4
{
  unint64_t v6 = (objc_class *)MEMORY[0x1E4F1CB18];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithSuiteName:@"com.apple.parsecd"];
  id v9 = objc_alloc_init(FLAutoBugCapture);
  id v10 = objc_alloc_init(FLContainerStorePathManager);
  id v11 = [(FLLoggingContext *)self initWithFileManager:v7 persistenceConfiguration:a4 userDefaults:v8 autoBugCapture:v9 containerStorePathManager:v10];

  return v11;
}

- (FLLoggingContext)initWithFileManager:(id)a3
{
  return [(FLLoggingContext *)self initWithFileManager:a3 persistenceConfiguration:0];
}

- (FLLoggingContext)init
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = [(FLLoggingContext *)self initWithFileManager:v3];

  return v4;
}

+ (BOOL)isRunningInExtension
{
  if (isRunningInExtension_onceToken != -1) {
    dispatch_once(&isRunningInExtension_onceToken, &__block_literal_global_9);
  }
  return isRunningInExtension_isBundleExtensionType;
}

void __40__FLLoggingContext_isRunningInExtension__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 objectForInfoDictionaryKey:@"EXAppExtensionAttributes"];
  isRunningInExtension_isBundleExtensionType = v0 != 0;
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_538);
  }
  return isInternalBuild_osVariantIsInternal;
}

uint64_t __35__FLLoggingContext_isInternalBuild__block_invoke()
{
  uint64_t result = os_variant_has_internal_content();
  isInternalBuild_osVariantIsInternal = result;
  return result;
}

+ (unint64_t)inferredPersistenceConfiguration
{
  if ([a1 isRunningInExtension]) {
    return 1;
  }
  else {
    return 2;
  }
}

@end