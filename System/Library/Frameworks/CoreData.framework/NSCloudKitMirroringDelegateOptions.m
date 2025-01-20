@interface NSCloudKitMirroringDelegateOptions
- (BOOL)automaticallyDownloadFileBackedFutures;
- (BOOL)automaticallyScheduleImportAndExportOperations;
- (BOOL)initializeSchema;
- (BOOL)preserveLegacyRecordMetadataBehavior;
- (BOOL)useDeviceToDeviceEncryption;
- (CKContainerOptions)containerOptions;
- (CKOperationConfiguration)defaultOperationConfiguration;
- (NSArray)activityVouchers;
- (NSCloudKitMirroringDelegateOptions)init;
- (NSCloudKitMirroringDelegateOptions)initWithCloudKitContainerOptions:(id)a3;
- (NSCloudKitMirroringDelegateOptions)initWithContainerIdentifier:(id)a3;
- (NSCloudKitMirroringDelegateProgressProvider)progressProvider;
- (NSNumber)ckAssetThresholdBytes;
- (NSNumber)operationMemoryThresholdBytes;
- (NSString)apsConnectionMachServiceName;
- (NSString)containerIdentifier;
- (id)copy;
- (id)description;
- (int64_t)databaseScope;
- (void)dealloc;
- (void)setActivityVouchers:(id)a3;
- (void)setApsConnectionMachServiceName:(id)a3;
- (void)setAutomaticallyDownloadFileBackedFutures:(BOOL)a3;
- (void)setAutomaticallyScheduleImportAndExportOperations:(BOOL)a3;
- (void)setCkAssetThresholdBytes:(id)a3;
- (void)setContainerIdentifier:(id)a3;
- (void)setContainerOptions:(id)a3;
- (void)setDatabaseScope:(int64_t)a3;
- (void)setDefaultOperationConfiguration:(id)a3;
- (void)setInitializeSchema:(BOOL)a3;
- (void)setOperationMemoryThresholdBytes:(id)a3;
- (void)setPreserveLegacyRecordMetadataBehavior:(BOOL)a3;
- (void)setProgressProvider:(id)a3;
- (void)setUseDeviceToDeviceEncryption:(BOOL)a3;
@end

@implementation NSCloudKitMirroringDelegateOptions

- (NSCloudKitMirroringDelegateOptions)init
{
  v4.receiver = self;
  v4.super_class = (Class)NSCloudKitMirroringDelegateOptions;
  v2 = [(NSCloudKitMirroringDelegateOptions *)&v4 init];
  if (v2)
  {
    *((void *)v2 + 10) = objc_alloc_init(PFCloudKitContainerProvider);
    *((void *)v2 + 11) = objc_alloc_init(PFCloudKitStoreMonitorProvider);
    *((void *)v2 + 9) = objc_alloc_init(PFCloudKitMetricsClient);
    *(_WORD *)(v2 + 13) = 1;
    *(_DWORD *)(v2 + 9) = 0;
    v2[15] = 0;
    *((void *)v2 + 12) = objc_alloc_init(PFCloudKitMetadataPurger);
    *((void *)v2 + 14) = 0;
    *((void *)v2 + 15) = 2;
    *((void *)v2 + 17) = objc_alloc_init(PFCloudKitArchivingUtilities);
    v2[18] = 1;
    v2[16] = 0;
    *((void *)v2 + 18) = objc_alloc_init(MEMORY[0x1E4F1C978]);
    if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28F80], "processInfo"), "processName"), "isEqualToString:", @"homed"))v2[16] = 1; {
  }
    }
  return (NSCloudKitMirroringDelegateOptions *)v2;
}

- (NSCloudKitMirroringDelegateOptions)initWithContainerIdentifier:(id)a3
{
  objc_super v4 = [(NSCloudKitMirroringDelegateOptions *)self init];
  if (v4) {
    v4->_containerIdentifier = (NSString *)a3;
  }
  return v4;
}

- (NSCloudKitMirroringDelegateOptions)initWithCloudKitContainerOptions:(id)a3
{
  objc_super v4 = -[NSCloudKitMirroringDelegateOptions initWithContainerIdentifier:](self, "initWithContainerIdentifier:", [a3 containerIdentifier]);
  v5 = v4;
  if (v4)
  {
    v4->_automaticallyScheduleImportAndExportOperations = 1;
    v4->_useDeviceToDeviceEncryption = [a3 useDeviceToDeviceEncryption];
    v5->_apsConnectionMachServiceName = (NSString *)(id)[a3 apsConnectionMachServiceName];
    v5->_databaseScope = [a3 databaseScope];
    v5->_containerOptions = (CKContainerOptions *)(id)[a3 containerOptions];
    v5->_operationMemoryThresholdBytes = (NSNumber *)(id)[a3 operationMemoryThresholdBytes];
    v5->_automaticallyDownloadFileBackedFutures = [a3 automaticallyDownloadFileBackedFutures];
    v5->_ckAssetThresholdBytes = (NSNumber *)(id)[a3 ckAssetThresholdBytes];
    v6 = (void *)MEMORY[0x18C127630]();
    objc_storeWeak((id *)&v5->_progressProvider, (id)[a3 progressProvider]);
    if ([a3 testContainerOverride])
    {

      v5->_containerProvider = (PFCloudKitContainerProvider *)-[PFStaticCloudKitContainerProvider initWithContainer:]([PFStaticCloudKitContainerProvider alloc], "initWithContainer:", [a3 testContainerOverride]);
      v5->_bypassDasdRateLimiting = 1;
    }
    if (objc_msgSend((id)objc_msgSend(a3, "activityVouchers"), "count"))
    {

      v5->_activityVouchers = (NSArray *)(id)[a3 activityVouchers];
    }
  }
  return v5;
}

- (id)copy
{
  id v3 = objc_alloc_init((Class)objc_opt_class());
  *((void *)v3 + 3) = [(NSString *)self->_containerIdentifier copy];
  *((void *)v3 + 4) = [(NSNumber *)self->_ckAssetThresholdBytes copy];
  *((unsigned char *)v3 + 9) = self->_useDeviceToDeviceEncryption;
  *((void *)v3 + 5) = self->_operationMemoryThresholdBytes;
  *((void *)v3 + 6) = self->_containerOptions;
  *((unsigned char *)v3 + 10) = self->_automaticallyDownloadFileBackedFutures;
  *((unsigned char *)v3 + 11) = self->_automaticallyScheduleImportAndExportOperations;
  *((void *)v3 + 7) = self->_scheduler;
  *((void *)v3 + 8) = self->_notificationListener;
  *((unsigned char *)v3 + 12) = self->_skipCloudKitSetup;
  *((unsigned char *)v3 + 13) = self->_useDaemon;
  *((unsigned char *)v3 + 14) = self->_useTestDaemon;

  *((void *)v3 + 10) = self->_containerProvider;
  *((void *)v3 + 11) = self->_storeMonitorProvider;
  *((unsigned char *)v3 + 15) = self->_preserveLegacyRecordMetadataBehavior;
  *((void *)v3 + 13) = self->_apsConnectionMachServiceName;

  *((void *)v3 + 9) = self->_metricsClient;
  *((void *)v3 + 12) = self->_metadataPurger;
  *((void *)v3 + 14) = self->_defaultOperationConfiguration;
  *((void *)v3 + 15) = self->_databaseScope;
  objc_super v4 = (void *)MEMORY[0x18C127630]();
  id Weak = objc_loadWeak((id *)&self->_progressProvider);
  objc_storeWeak((id *)v3 + 16, Weak);

  *((void *)v3 + 17) = self->_archivingUtilities;
  *((unsigned char *)v3 + 18) = self->_test_useLegacySavePolicy;
  [v3 setActivityVouchers:self->_activityVouchers];
  *((unsigned char *)v3 + 16) = self->_bypassSchedulerActivityForInitialImport;
  *((unsigned char *)v3 + 17) = self->_bypassDasdRateLimiting;
  return v3;
}

- (void)dealloc
{
  self->_ckAssetThresholdBytes = 0;
  self->_operationMemoryThresholdBytes = 0;

  self->_containerOptions = 0;
  self->_scheduler = 0;

  self->_notificationListener = 0;
  self->_apsConnectionMachServiceName = 0;

  self->_defaultOperationConfiguration = 0;
  objc_storeWeak((id *)&self->_progressProvider, 0);

  self->_archivingUtilities = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCloudKitMirroringDelegateOptions;
  [(NSCloudKitMirroringDelegateOptions *)&v3 dealloc];
}

- (id)description
{
  v32.receiver = self;
  v32.super_class = (Class)NSCloudKitMirroringDelegateOptions;
  objc_super v3 = objc_msgSend(-[NSCloudKitMirroringDelegateOptions description](&v32, sel_description), "mutableCopy");
  containerIdentifier = self->_containerIdentifier;
  if (!containerIdentifier) {
    containerIdentifier = (NSString *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" containerIdentifier:%@", containerIdentifier];
  if (softLinkCKDatabaseScopeString(self->_databaseScope)) {
    uint64_t v5 = softLinkCKDatabaseScopeString(self->_databaseScope);
  }
  else {
    uint64_t v5 = [MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" databaseScope:%@", v5];
  ckAssetThresholdBytes = self->_ckAssetThresholdBytes;
  if (!ckAssetThresholdBytes) {
    ckAssetThresholdBytes = (NSNumber *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" ckAssetThresholdBytes:%@", ckAssetThresholdBytes];
  operationMemoryThresholdBytes = self->_operationMemoryThresholdBytes;
  if (!operationMemoryThresholdBytes) {
    operationMemoryThresholdBytes = (NSNumber *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" operationMemoryThresholdBytes:%@", operationMemoryThresholdBytes];
  if (self->_useDeviceToDeviceEncryption) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v3 appendFormat:@" useEncryptedStorage:%@", v8];
  if (self->_useDeviceToDeviceEncryption) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v3 appendFormat:@" useDeviceToDeviceEncryption:%@", v9];
  if (self->_automaticallyDownloadFileBackedFutures) {
    v10 = @"YES";
  }
  else {
    v10 = @"NO";
  }
  [v3 appendFormat:@" automaticallyDownloadFileBackedFutures:%@", v10];
  if (self->_automaticallyScheduleImportAndExportOperations) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  [v3 appendFormat:@" automaticallyScheduleImportAndExportOperations:%@", v11];
  if (self->_skipCloudKitSetup) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  [v3 appendFormat:@" skipCloudKitSetup:%@", v12];
  if (self->_preserveLegacyRecordMetadataBehavior) {
    v13 = @"YES";
  }
  else {
    v13 = @"NO";
  }
  [v3 appendFormat:@" preserveLegacyRecordMetadataBehavior:%@", v13];
  if (self->_useDaemon) {
    v14 = @"YES";
  }
  else {
    v14 = @"NO";
  }
  [v3 appendFormat:@" useDaemon:%@", v14];
  apsConnectionMachServiceName = self->_apsConnectionMachServiceName;
  if (!apsConnectionMachServiceName) {
    apsConnectionMachServiceName = (NSString *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" apsConnectionMachServiceName:%@", apsConnectionMachServiceName];
  containerProvider = self->_containerProvider;
  if (!containerProvider) {
    containerProvider = (PFCloudKitContainerProvider *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" containerProvider:%@", containerProvider];
  storeMonitorProvider = self->_storeMonitorProvider;
  if (!storeMonitorProvider) {
    storeMonitorProvider = (PFCloudKitStoreMonitorProvider *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" storeMonitorProvider:%@", storeMonitorProvider];
  metricsClient = self->_metricsClient;
  if (!metricsClient) {
    metricsClient = (PFCloudKitMetricsClient *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" metricsClient:%@", metricsClient];
  metadataPurger = self->_metadataPurger;
  if (!metadataPurger) {
    metadataPurger = (PFCloudKitMetadataPurger *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" metadataPurger:%@", metadataPurger];
  scheduler = self->_scheduler;
  if (!scheduler) {
    scheduler = (CKScheduler *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" scheduler:%@", scheduler];
  notificationListener = self->_notificationListener;
  if (!notificationListener) {
    notificationListener = (CKNotificationListener *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" notificationListener:%@", notificationListener];
  containerOptions = self->_containerOptions;
  if (!containerOptions) {
    containerOptions = (CKContainerOptions *)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" containerOptions:%@", containerOptions];
  defaultOperationConfiguration = self->_defaultOperationConfiguration;
  if (!defaultOperationConfiguration) {
    defaultOperationConfiguration = (CKOperationConfiguration *)[MEMORY[0x1E4F1CA98] null];
  }
  v24 = (void *)MEMORY[0x18C127630]([v3 appendFormat:@" defaultOperationConfiguration:%@", defaultOperationConfiguration]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressProvider);
  v26 = WeakRetained;
  if (!WeakRetained) {
    id WeakRetained = (id)[MEMORY[0x1E4F1CA98] null];
  }
  [v3 appendFormat:@" progressProvider:%@", WeakRetained];

  if (self->_test_useLegacySavePolicy) {
    v27 = @"YES";
  }
  else {
    v27 = @"NO";
  }
  [v3 appendFormat:@" test_useLegacySavePolicy:%@", v27];
  [v3 appendFormat:@" archivingUtilities:%@", self->_archivingUtilities];
  if (self->_bypassSchedulerActivityForInitialImport) {
    v28 = @"YES";
  }
  else {
    v28 = @"NO";
  }
  [v3 appendFormat:@" bypassSchedulerActivityForInitialImport:%@", v28];
  if (self->_bypassDasdRateLimiting) {
    v29 = @"YES";
  }
  else {
    v29 = @"NO";
  }
  [v3 appendFormat:@" bypassDasdRateLimiting:%@", v29];
  [v3 appendFormat:@" activityVouchers:%@", self->_activityVouchers];
  id v30 = (id)[v3 copy];

  return v30;
}

- (void)setInitializeSchema:(BOOL)a3
{
  self->_initializeSchema = a3;
  uint64_t v3 = [NSString stringWithUTF8String:"NSCloudKitMirroringDelegateOptions.initializeSchema is no longer supported and will be removed in a future release. Please use -[NSPersistentCloudKitContainer initializeSchemaWithOptions:error:] or NSCloudKitMirroringInitializeSchemaRequest instead."];
  _NSCoreDataLog(17, v3, v4, v5, v6, v7, v8, v9, v11);
  v10 = __pflogFaultLog;
  if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v11) = 0;
    _os_log_fault_impl(&dword_18AB82000, v10, OS_LOG_TYPE_FAULT, "CoreData: NSCloudKitMirroringDelegateOptions.initializeSchema is no longer supported and will be removed in a future release. Please use -[NSPersistentCloudKitContainer initializeSchemaWithOptions:error:] or NSCloudKitMirroringInitializeSchemaRequest instead.", (uint8_t *)&v11, 2u);
  }
}

- (void)setActivityVouchers:(id)a3
{
  activityVouchers = self->_activityVouchers;
  if (activityVouchers != a3)
  {
    if (a3)
    {

      uint64_t v6 = (NSArray *)a3;
    }
    else
    {
      if (![(NSArray *)activityVouchers count]) {
        return;
      }

      uint64_t v6 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    }
    self->_activityVouchers = v6;
  }
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (void)setContainerIdentifier:(id)a3
{
}

- (BOOL)initializeSchema
{
  return self->_initializeSchema;
}

- (BOOL)useDeviceToDeviceEncryption
{
  return self->_useDeviceToDeviceEncryption;
}

- (void)setUseDeviceToDeviceEncryption:(BOOL)a3
{
  self->_useDeviceToDeviceEncryption = a3;
}

- (NSNumber)ckAssetThresholdBytes
{
  return self->_ckAssetThresholdBytes;
}

- (void)setCkAssetThresholdBytes:(id)a3
{
}

- (NSNumber)operationMemoryThresholdBytes
{
  return self->_operationMemoryThresholdBytes;
}

- (void)setOperationMemoryThresholdBytes:(id)a3
{
}

- (CKContainerOptions)containerOptions
{
  return self->_containerOptions;
}

- (void)setContainerOptions:(id)a3
{
}

- (BOOL)automaticallyDownloadFileBackedFutures
{
  return self->_automaticallyDownloadFileBackedFutures;
}

- (void)setAutomaticallyDownloadFileBackedFutures:(BOOL)a3
{
  self->_automaticallyDownloadFileBackedFutures = a3;
}

- (BOOL)automaticallyScheduleImportAndExportOperations
{
  return self->_automaticallyScheduleImportAndExportOperations;
}

- (void)setAutomaticallyScheduleImportAndExportOperations:(BOOL)a3
{
  self->_automaticallyScheduleImportAndExportOperations = a3;
}

- (BOOL)preserveLegacyRecordMetadataBehavior
{
  return self->_preserveLegacyRecordMetadataBehavior;
}

- (void)setPreserveLegacyRecordMetadataBehavior:(BOOL)a3
{
  self->_preserveLegacyRecordMetadataBehavior = a3;
}

- (NSString)apsConnectionMachServiceName
{
  return self->_apsConnectionMachServiceName;
}

- (void)setApsConnectionMachServiceName:(id)a3
{
}

- (CKOperationConfiguration)defaultOperationConfiguration
{
  return self->_defaultOperationConfiguration;
}

- (void)setDefaultOperationConfiguration:(id)a3
{
}

- (int64_t)databaseScope
{
  return self->_databaseScope;
}

- (void)setDatabaseScope:(int64_t)a3
{
  self->_databaseScope = a3;
}

- (NSCloudKitMirroringDelegateProgressProvider)progressProvider
{
  return (NSCloudKitMirroringDelegateProgressProvider *)objc_loadWeak((id *)&self->_progressProvider);
}

- (void)setProgressProvider:(id)a3
{
}

- (NSArray)activityVouchers
{
  return self->_activityVouchers;
}

- (void).cxx_destruct
{
}

@end