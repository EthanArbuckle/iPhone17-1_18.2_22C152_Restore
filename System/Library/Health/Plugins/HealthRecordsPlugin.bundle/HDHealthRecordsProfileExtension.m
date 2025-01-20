@interface HDHealthRecordsProfileExtension
- (BOOL)_isHealthRecordsSupportedLocale:(id)a3;
- (BOOL)deviceConfigurationSupportsHealthRecords:(BOOL *)a3 error:(id *)a4;
- (BOOL)isImproveHealthRecordsDataSubmissionAllowed;
- (BOOL)isSupportedFHIRResourceType:(id)a3 FHIRVersionString:(id)a4;
- (BOOL)isSupportedFHIRVersionString:(id)a3;
- (HDClinicalAccountManager)accountManager;
- (HDClinicalAnalyticsManager)analyticsManager;
- (HDClinicalDailyAnalyticsManager)dailyAnalyticsManager;
- (HDClinicalIngestionManager)ingestionManager;
- (HDClinicalOptInDataCollectionManager)optInDataCollectionManager;
- (HDClinicalOptInDataUploadManager)optInDataUploadManager;
- (HDClinicalOptInStudy)optInStudy;
- (HDClinicalProviderServiceManager)providerServiceManager;
- (HDClinicalSharingManager)clinicalSharingManager;
- (HDHealthRecordsAPIReminderRegistry)APIReminderRegistry;
- (HDHealthRecordsProfileExtension)initWithProfile:(id)a3;
- (HDMedicalDownloadableAttachmentManager)downloadableAttachmentManager;
- (HDNotificationSyncClient)notificationSyncClient;
- (HDProfile)profile;
- (HDSignedClinicalDataManager)signedClinicalDataManager;
- (HRSSupportedFHIRConfiguration)unitTesting_supportedFHIRConfigurationOverride;
- (id)_retrieveSupportedFHIRConfigurationWithError:(id *)a3;
- (id)_supportedFHIRConfiguration;
- (id)createClinicalAnalyticsManager;
- (id)createClinicalSharingClient;
- (id)createClinicalSharingManager;
- (id)createDownloadableAttachmentManager;
- (id)createHealthRecordsAPIReminderRegistry;
- (id)createHealthRecordsClinicalAccountManager;
- (id)createHealthRecordsIngestionServiceClient;
- (id)createHealthRecordsLegacyIngestionServiceClient;
- (id)createHealthRecordsXPCServiceClient;
- (id)createOptInStudy;
- (id)createProviderServiceManager;
- (id)createSignedClinicalDataManager;
- (id)createSignedClinicalDataRegistry;
- (id)unitTest_didProcessNotificationInstruction;
- (int64_t)hasGatewayBackedAccountsWithError:(id *)a3;
- (int64_t)hasGatewayBackedAccountsWithTransaction:(id)a3 error:(id *)a4;
- (int64_t)hasIssuerBackedAccountsWithError:(id *)a3;
- (int64_t)hasIssuerBackedAccountsWithTransaction:(id)a3 error:(id *)a4;
- (void)_deleteSignedClinicalDataRecords;
- (void)_handleDismissInstructionWithClient:(id)a3;
- (void)_ivarLock_determineHealthRecordsSupportedStatusIfNeeded;
- (void)_ivarLock_registerAsAccountStateObserverIfNeeded;
- (void)_ivarLock_unregisterAsAccountStateObserverIfAppropriate;
- (void)_ivarLock_updateHealthRecordsSupportedStatus;
- (void)_localeDidChange:(id)a3;
- (void)_notifyAccountEventObserversOfEvent:(unint64_t)a3;
- (void)_notifyHealthRecordsSupportedChangeObservers;
- (void)accountManager:(id)a3 account:(id)a4 didChangeState:(int64_t)a5;
- (void)addAccountEventObserver:(id)a3;
- (void)didUpdateSourcesForAccountWithIdentifier:(id)a3;
- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4;
- (void)prepareForObliteration;
- (void)registerHealthRecordsSupportedChangeObserver:(id)a3;
- (void)removeAccountEventObserver:(id)a3;
- (void)setNotificationSyncClient:(id)a3;
- (void)setUnitTest_didProcessNotificationInstruction:(id)a3;
- (void)setUnitTesting_supportedFHIRConfigurationOverride:(id)a3;
- (void)unitTesting_replaceHealthRecordsPluginAndSetCompleteScheduledExtractionHandler:(id)a3;
- (void)unitTesting_triggerLocaleDidChangeNotification;
- (void)unregisterHealthRecordsSupportedChangeObserver:(id)a3;
@end

@implementation HDHealthRecordsProfileExtension

- (void)registerHealthRecordsSupportedChangeObserver:(id)a3
{
  p_ivarLock = &self->_ivarLock;
  id v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  if (!self->_chrSupportedObservers)
  {
    _HKInitializeLogging();
    v6 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AF320((uint64_t)self, v6);
    }
  }
  [(HDHealthRecordsProfileExtension *)self _ivarLock_determineHealthRecordsSupportedStatusIfNeeded];
  [(HDHealthRecordsProfileExtension *)self _ivarLock_registerAsAccountStateObserverIfNeeded];
  [(HKObserverSet *)self->_chrSupportedObservers registerObserver:v5];

  os_unfair_lock_unlock(p_ivarLock);
}

- (void)_ivarLock_registerAsAccountStateObserverIfNeeded
{
  os_unfair_lock_assert_owner(&self->_ivarLock);
  accountEventObservers = self->_accountEventObservers;
  if (accountEventObservers)
  {
    id v4 = [(HKObserverSet *)accountEventObservers count];
    if ((uint64_t)v4 + (uint64_t)[(HKObserverSet *)self->_chrSupportedObservers count] <= 0)
    {
      accountManager = self->_accountManager;
      [(HDClinicalAccountManager *)accountManager addAccountStateObserver:self];
    }
  }
}

- (void)_ivarLock_determineHealthRecordsSupportedStatusIfNeeded
{
  os_unfair_lock_assert_owner(&self->_ivarLock);
  if (!self->_lastKnownSupportedStatus)
  {
    [(HDHealthRecordsProfileExtension *)self _ivarLock_updateHealthRecordsSupportedStatus];
  }
}

- (BOOL)deviceConfigurationSupportsHealthRecords:(BOOL *)a3 error:(id *)a4
{
  if (!a3)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2, self, @"HDHealthRecordsProfileExtension.m", 142, @"Invalid parameter not satisfying: %@", @"supportsHealthRecords" object file lineNumber description];
  }
  v7 = +[NSLocale hk_testableCurrentLocale];
  unsigned __int8 v8 = [(HDHealthRecordsProfileExtension *)self _isHealthRecordsSupportedLocale:v7];

  if (v8)
  {
    char v9 = 1;
    BOOL result = 1;
  }
  else
  {
    int64_t v11 = [(HDHealthRecordsProfileExtension *)self hasGatewayBackedAccountsWithError:a4];
    BOOL result = v11 != 0;
    char v9 = v11 == 1;
  }
  *a3 = v9;
  return result;
}

- (BOOL)_isHealthRecordsSupportedLocale:(id)a3
{
  id v4 = a3;
  id v5 = [(HDHealthRecordsProfileExtension *)self profile];
  v6 = [v5 daemon];
  v7 = [v6 ontologyConfigurationProvider];
  unsigned __int8 v8 = [v7 isCountrySupported:v4];

  return v8;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (HDClinicalIngestionManager)ingestionManager
{
  return self->_ingestionManager;
}

- (HDClinicalAccountManager)accountManager
{
  return self->_accountManager;
}

- (HDHealthRecordsProfileExtension)initWithProfile:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)HDHealthRecordsProfileExtension;
  id v5 = [(HDHealthRecordsProfileExtension *)&v52 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [v4 healthDaemon];
    objc_storeWeak((id *)&v6->_healthDeamon, v7);

    v6->_ivarLock._os_unfair_lock_opaque = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    char v9 = (char *)[WeakRetained profileType];

    if (v9 != (unsigned char *)&dword_0 + 2)
    {
      uint64_t v10 = [(HDHealthRecordsProfileExtension *)v6 createHealthRecordsClinicalAccountManager];
      accountManager = v6->_accountManager;
      v6->_accountManager = (HDClinicalAccountManager *)v10;

      uint64_t v12 = [(HDHealthRecordsProfileExtension *)v6 createHealthRecordsAPIReminderRegistry];
      APIReminderRegistry = v6->_APIReminderRegistry;
      v6->_APIReminderRegistry = (HDHealthRecordsAPIReminderRegistry *)v12;

      v14 = [[HDClinicalIngestionManager alloc] initWithProfileExtension:v6];
      ingestionManager = v6->_ingestionManager;
      v6->_ingestionManager = v14;

      uint64_t v16 = [(HDHealthRecordsProfileExtension *)v6 createProviderServiceManager];
      providerServiceManager = v6->_providerServiceManager;
      v6->_providerServiceManager = (HDClinicalProviderServiceManager *)v16;

      uint64_t v18 = [(HDHealthRecordsProfileExtension *)v6 createSignedClinicalDataManager];
      signedClinicalDataManager = v6->_signedClinicalDataManager;
      v6->_signedClinicalDataManager = (HDSignedClinicalDataManager *)v18;

      uint64_t v20 = [(HDHealthRecordsProfileExtension *)v6 createClinicalSharingManager];
      clinicalSharingManager = v6->_clinicalSharingManager;
      v6->_clinicalSharingManager = (HDClinicalSharingManager *)v20;

      uint64_t v22 = [(HDHealthRecordsProfileExtension *)v6 createDownloadableAttachmentManager];
      downloadableAttachmentManager = v6->_downloadableAttachmentManager;
      v6->_downloadableAttachmentManager = (HDMedicalDownloadableAttachmentManager *)v22;

      id v24 = objc_alloc((Class)HKObserverSet);
      v25 = (HKObserverSet *)[v24 initWithName:@"health-records-profile-extension-account-event" loggingCategory:HKLogHealthRecords];
      accountEventObservers = v6->_accountEventObservers;
      v6->_accountEventObservers = v25;

      id v27 = objc_alloc((Class)HKObserverSet);
      v28 = (HKObserverSet *)[v27 initWithName:@"health-records-profile-extension-chr-supported" loggingCategory:HKLogHealthRecords];
      chrSupportedObservers = v6->_chrSupportedObservers;
      v6->_chrSupportedObservers = v28;
    }
    id v30 = objc_loadWeakRetained((id *)&v6->_profile);
    v31 = (char *)[v30 profileType];

    if (v31 == (unsigned char *)&dword_0 + 1)
    {
      uint64_t v32 = [(HDHealthRecordsProfileExtension *)v6 createClinicalAnalyticsManager];
      analyticsManager = v6->_analyticsManager;
      v6->_analyticsManager = (HDClinicalAnalyticsManager *)v32;

      v34 = [[HDClinicalDailyAnalyticsManager alloc] initWithProfileExtension:v6];
      dailyAnalyticsManager = v6->_dailyAnalyticsManager;
      v6->_dailyAnalyticsManager = v34;

      uint64_t v36 = [(HDHealthRecordsProfileExtension *)v6 createOptInStudy];
      optInStudy = v6->_optInStudy;
      v6->_optInStudy = (HDClinicalOptInStudy *)v36;

      v38 = [[HDClinicalOptInDataCollectionManager alloc] initWithProfileExtension:v6];
      optInDataCollectionManager = v6->_optInDataCollectionManager;
      v6->_optInDataCollectionManager = v38;

      v40 = [[HDClinicalOptInDataUploadManager alloc] initWithProfileExtension:v6];
      optInDataUploadManager = v6->_optInDataUploadManager;
      v6->_optInDataUploadManager = v40;

      id v42 = objc_alloc((Class)HDNotificationSyncClient);
      id v43 = objc_loadWeakRetained((id *)&v6->_profile);
      uint64_t v44 = HKHealthRecordsNotificationSyncClientIdentifier;
      v45 = HKCreateSerialDispatchQueue();
      v46 = (HDNotificationSyncClient *)[v42 initWithProfile:v43 clientIdentifier:v44 queue:v45];
      notificationSyncClient = v6->_notificationSyncClient;
      v6->_notificationSyncClient = v46;

      [(HDNotificationSyncClient *)v6->_notificationSyncClient setDelegate:v6];
    }
    v6->_lastKnownSupportedStatus = 0;
    v48 = +[NSNotificationCenter defaultCenter];
    [v48 addObserver:v6 selector:"_localeDidChange:" name:NSCurrentLocaleDidChangeNotification object:0];

    uint64_t v49 = +[NSLocale hk_testableCurrentLocale];
    lastKnownLocale = v6->_lastKnownLocale;
    v6->_lastKnownLocale = (NSLocale *)v49;
  }
  return v6;
}

- (BOOL)isImproveHealthRecordsDataSubmissionAllowed
{
  return [(HDClinicalAnalyticsManager *)self->_analyticsManager isImproveHealthRecordsDataSubmissionAllowed];
}

- (int64_t)hasGatewayBackedAccountsWithError:(id *)a3
{
  accountManager = self->_accountManager;
  if (accountManager) {
    return [(HDClinicalAccountManager *)accountManager highPriorityTransactionHasGatewayBackedAccountsWithError:a3];
  }
  else {
    return 2;
  }
}

- (int64_t)hasIssuerBackedAccountsWithError:(id *)a3
{
  accountManager = self->_accountManager;
  if (accountManager) {
    return [(HDClinicalAccountManager *)accountManager highPriorityTransactionHasIssuerBackedAccountsWithError:a3];
  }
  else {
    return 2;
  }
}

- (int64_t)hasGatewayBackedAccountsWithTransaction:(id)a3 error:(id *)a4
{
  accountManager = self->_accountManager;
  if (accountManager) {
    return [(HDClinicalAccountManager *)accountManager hasGatewayBackedAccountsWithTransaction:a3 error:a4];
  }
  else {
    return 2;
  }
}

- (int64_t)hasIssuerBackedAccountsWithTransaction:(id)a3 error:(id *)a4
{
  accountManager = self->_accountManager;
  if (accountManager) {
    return [(HDClinicalAccountManager *)accountManager hasIssuerBackedAccountsWithTransaction:a3 error:a4];
  }
  else {
    return 2;
  }
}

- (void)_ivarLock_updateHealthRecordsSupportedStatus
{
  os_unfair_lock_assert_owner(&self->_ivarLock);
  char v7 = 0;
  id v6 = 0;
  unsigned __int8 v3 = [(HDHealthRecordsProfileExtension *)self deviceConfigurationSupportsHealthRecords:&v7 error:&v6];
  id v4 = v6;
  if (v3)
  {
    int64_t v5 = 1;
    if (!v7) {
      int64_t v5 = 2;
    }
    self->_lastKnownSupportedStatus = v5;
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AF1D4();
    }
  }
}

- (void)_notifyHealthRecordsSupportedChangeObservers
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if ([(HKObserverSet *)self->_chrSupportedObservers count])
  {
    int64_t lastKnownSupportedStatus = self->_lastKnownSupportedStatus;
    [(HDHealthRecordsProfileExtension *)self _ivarLock_updateHealthRecordsSupportedStatus];
    int64_t v5 = self->_lastKnownSupportedStatus;
    if (v5)
    {
      if (lastKnownSupportedStatus != v5)
      {
        chrSupportedObservers = self->_chrSupportedObservers;
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_53A4C;
        v7[3] = &unk_113848;
        v7[4] = self;
        BOOL v8 = v5 == 1;
        [(HKObserverSet *)chrSupportedObservers notifyObservers:v7];
      }
    }
    os_unfair_lock_unlock(p_ivarLock);
  }
  else
  {
    os_unfair_lock_unlock(p_ivarLock);
  }
}

- (BOOL)isSupportedFHIRVersionString:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HDHealthRecordsProfileExtension *)self _supportedFHIRConfiguration];
  unsigned __int8 v6 = [v5 isSupportedFHIRVersionString:v4];

  return v6;
}

- (BOOL)isSupportedFHIRResourceType:(id)a3 FHIRVersionString:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(HDHealthRecordsProfileExtension *)self _supportedFHIRConfiguration];
  unsigned __int8 v9 = [v8 isSupportedFHIRResourceType:v7 FHIRVersionString:v6];

  return v9;
}

- (id)_supportedFHIRConfiguration
{
  p_ivarLock = &self->_ivarLock;
  os_unfair_lock_lock(&self->_ivarLock);
  if (!_HDIsUnitTesting || (supportedFHIRConfiguration = self->_unitTesting_supportedFHIRConfigurationOverride) == 0)
  {
    supportedFHIRConfiguration = self->_supportedFHIRConfiguration;
    if (!supportedFHIRConfiguration)
    {
      id v11 = 0;
      int64_t v5 = [(HDHealthRecordsProfileExtension *)self _retrieveSupportedFHIRConfigurationWithError:&v11];
      id v6 = v11;
      id v7 = (HRSSupportedFHIRConfiguration *)[v5 copy];
      BOOL v8 = self->_supportedFHIRConfiguration;
      self->_supportedFHIRConfiguration = v7;

      if (!self->_supportedFHIRConfiguration)
      {
        _HKInitializeLogging();
        if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
          sub_AF23C();
        }
      }

      supportedFHIRConfiguration = self->_supportedFHIRConfiguration;
    }
  }
  unsigned __int8 v9 = supportedFHIRConfiguration;
  os_unfair_lock_unlock(p_ivarLock);

  return v9;
}

- (id)_retrieveSupportedFHIRConfigurationWithError:(id *)a3
{
  id v4 = [(HDHealthRecordsProfileExtension *)self createHealthRecordsXPCServiceClient];
  int64_t v5 = [v4 supportedFHIRConfigurationWithError:a3];

  return v5;
}

- (void)didUpdateSourcesForAccountWithIdentifier:(id)a3
{
  id v4 = a3;
  int64_t v5 = dispatch_get_global_queue(17, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_53D2C;
  v7[3] = &unk_112318;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)unregisterHealthRecordsSupportedChangeObserver:(id)a3
{
  p_ivarLock = &self->_ivarLock;
  id v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  [(HKObserverSet *)self->_chrSupportedObservers unregisterObserver:v5];

  [(HDHealthRecordsProfileExtension *)self _ivarLock_unregisterAsAccountStateObserverIfAppropriate];

  os_unfair_lock_unlock(p_ivarLock);
}

- (void)addAccountEventObserver:(id)a3
{
  p_ivarLock = &self->_ivarLock;
  id v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  if (!self->_accountEventObservers)
  {
    _HKInitializeLogging();
    id v6 = (void *)HKLogHealthRecords;
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AF3BC((uint64_t)self, v6);
    }
  }
  [(HDHealthRecordsProfileExtension *)self _ivarLock_registerAsAccountStateObserverIfNeeded];
  [(HKObserverSet *)self->_accountEventObservers registerObserver:v5];

  os_unfair_lock_unlock(p_ivarLock);
}

- (void)removeAccountEventObserver:(id)a3
{
  p_ivarLock = &self->_ivarLock;
  id v5 = a3;
  os_unfair_lock_lock(p_ivarLock);
  [(HKObserverSet *)self->_accountEventObservers unregisterObserver:v5];

  [(HDHealthRecordsProfileExtension *)self _ivarLock_unregisterAsAccountStateObserverIfAppropriate];

  os_unfair_lock_unlock(p_ivarLock);
}

- (void)_ivarLock_unregisterAsAccountStateObserverIfAppropriate
{
  os_unfair_lock_assert_owner(&self->_ivarLock);
  id v3 = [(HKObserverSet *)self->_accountEventObservers count];
  if ((uint64_t)v3 + (uint64_t)[(HKObserverSet *)self->_chrSupportedObservers count] <= 0)
  {
    accountManager = self->_accountManager;
    [(HDClinicalAccountManager *)accountManager removeAccountStateObserver:self];
  }
}

- (id)createClinicalAnalyticsManager
{
  v2 = [[HDClinicalAnalyticsManager alloc] initWithProfileExtension:self];

  return v2;
}

- (id)createHealthRecordsAPIReminderRegistry
{
  v2 = [[HDHealthRecordsAPIReminderRegistry alloc] initWithProfileExtension:self];

  return v2;
}

- (id)createHealthRecordsXPCServiceClient
{
  id v2 = objc_alloc_init((Class)HDHealthRecordsXPCServiceClient);

  return v2;
}

- (id)createHealthRecordsClinicalAccountManager
{
  id v2 = [[HDClinicalAccountManager alloc] initWithProfileExtension:self];

  return v2;
}

- (id)createProviderServiceManager
{
  id v2 = [[HDClinicalProviderServiceManager alloc] initWithProfileExtension:self];

  return v2;
}

- (id)createHealthRecordsIngestionServiceClient
{
  id v2 = objc_alloc_init((Class)HDHealthRecordsIngestionServiceClient);

  return v2;
}

- (id)createHealthRecordsLegacyIngestionServiceClient
{
  id v2 = objc_alloc_init((Class)HDHealthRecordsLegacyIngestionServiceClient);

  return v2;
}

- (id)createSignedClinicalDataManager
{
  id v2 = [[HDSignedClinicalDataManager alloc] initWithProfileExtension:self];

  return v2;
}

- (id)createSignedClinicalDataRegistry
{
  id v3 = [HDSignedClinicalDataRegistry alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v5 = [WeakRetained daemon];
  id v6 = [v5 healthDirectoryURL];
  id v7 = [(HDSignedClinicalDataRegistry *)v3 initWithHealthDirectoryURL:v6];

  return v7;
}

- (id)createClinicalSharingManager
{
  id v2 = [[HDClinicalSharingManager alloc] initWithProfileExtension:self];

  return v2;
}

- (id)createClinicalSharingClient
{
  id v2 = objc_alloc_init((Class)HKClinicalSharingClient);

  return v2;
}

- (id)createDownloadableAttachmentManager
{
  id v2 = [[HDMedicalDownloadableAttachmentManager alloc] initWithProfileExtension:self];

  return v2;
}

- (id)createOptInStudy
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v4 = [v3 integerForKey:HDClinicalOptInStudyHealthCloudEnvironmentKey];

  id v5 = [HDClinicalOptInStudy alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = [(HDClinicalOptInStudy *)v5 initWithProfile:WeakRetained environment:v4];

  return v7;
}

- (void)_localeDidChange:(id)a3
{
  id v4 = +[NSLocale hk_testableCurrentLocale];
  if (([(NSLocale *)v4 isEqual:self->_lastKnownLocale] & 1) == 0) {
    [(HDHealthRecordsProfileExtension *)self _notifyHealthRecordsSupportedChangeObservers];
  }
  lastKnownLocale = self->_lastKnownLocale;
  self->_lastKnownLocale = v4;
}

- (void)unitTesting_triggerLocaleDidChangeNotification
{
  id v3 = +[NSNotification notificationWithName:NSCurrentLocaleDidChangeNotification object:self];
  [(HDHealthRecordsProfileExtension *)self _localeDidChange:v3];
}

- (void)accountManager:(id)a3 account:(id)a4 didChangeState:(int64_t)a5
{
  uint64_t v5 = 100;
  if (a5 == 1) {
    uint64_t v5 = 0;
  }
  if (a5 == 3) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = v5;
  }
  if (v6 != 100)
  {
    [(HDHealthRecordsProfileExtension *)self _notifyHealthRecordsSupportedChangeObservers];
    [(HDHealthRecordsProfileExtension *)self _notifyAccountEventObserversOfEvent:v6];
  }
}

- (void)_notifyAccountEventObserversOfEvent:(unint64_t)a3
{
  accountEventObservers = self->_accountEventObservers;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_54598;
  v4[3] = &unk_113898;
  v4[4] = self;
  v4[5] = a3;
  [(HKObserverSet *)accountEventObservers notifyObservers:v4];
}

- (void)notificationSyncClient:(id)a3 didReceiveInstructionWithAction:(int64_t)a4
{
  id v6 = a3;
  _HKInitializeLogging();
  id v7 = (void *)HKLogNotifications;
  if (os_log_type_enabled(HKLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    unsigned __int8 v9 = objc_opt_class();
    id v10 = v9;
    id v11 = NSStringFromHKNotificationInstructionAction();
    int v14 = 138543618;
    v15 = v9;
    __int16 v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received instruction with action: %@", (uint8_t *)&v14, 0x16u);
  }
  if (a4 == 1)
  {
    [(HDHealthRecordsProfileExtension *)self _handleDismissInstructionWithClient:v6];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v12 = (void *)HKLogNotifications;
    if (os_log_type_enabled(HKLogNotifications, OS_LOG_TYPE_ERROR)) {
      sub_AF458(v12);
    }
  }
  unitTest_didProcessNotificationInstruction = (void (**)(void))self->_unitTest_didProcessNotificationInstruction;
  if (unitTest_didProcessNotificationInstruction) {
    unitTest_didProcessNotificationInstruction[2]();
  }
}

- (void)_handleDismissInstructionWithClient:(id)a3
{
  id v4 = a3;
  _HKInitializeLogging();
  uint64_t v5 = HKLogNotifications;
  if (os_log_type_enabled(HKLogNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = self;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Handling dismiss instruction", buf, 0xCu);
  }
  id v23 = 0;
  id v6 = [v4 pendingNotificationDismissInstructionsWithError:&v23];
  id v7 = v23;
  _HKInitializeLogging();
  id v8 = (void *)HKLogNotifications;
  if (v6)
  {
    if (os_log_type_enabled(HKLogNotifications, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v9 = v8;
      id v10 = (HDHealthRecordsProfileExtension *)objc_opt_class();
      id v11 = v10;
      uint64_t v12 = [v6 messageIdentifiers];
      *(_DWORD *)buf = 138543618;
      v25 = v10;
      __int16 v26 = 2114;
      id v27 = v12;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received notification dismiss instructions with identifiers: %{public}@", buf, 0x16u);
    }
    v13 = [v6 categoryIdentifiers];
    int v14 = [v13 allObjects];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    __int16 v16 = [WeakRetained notificationManager];
    [v16 removeDeliveredNotificationsWithIdentifiers:v14];

    id v22 = v7;
    LODWORD(v16) = [v4 markPendingNotificationInstructionsAsProcessed:v6 error:&v22];
    id v17 = v22;

    _HKInitializeLogging();
    uint64_t v18 = (void *)HKLogNotifications;
    if (v16)
    {
      if (os_log_type_enabled(HKLogNotifications, OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        uint64_t v20 = (HDHealthRecordsProfileExtension *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        __int16 v26 = 2114;
        id v27 = v14;
        v21 = v20;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissed notifications: %{public}@", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(HKLogNotifications, OS_LOG_TYPE_ERROR))
    {
      sub_AF5A4(v18);
    }
  }
  else
  {
    if (os_log_type_enabled(HKLogNotifications, OS_LOG_TYPE_ERROR)) {
      sub_AF508(v8);
    }
    id v17 = v7;
  }
}

- (void)prepareForObliteration
{
  _HKInitializeLogging();
  id v3 = HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    uint64_t v5 = self;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Preparing for obliteration", (uint8_t *)&v4, 0xCu);
  }
  [(HDHealthRecordsProfileExtension *)self _deleteSignedClinicalDataRecords];
}

- (void)_deleteSignedClinicalDataRecords
{
  uint64_t v11 = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  int v4 = [WeakRetained dataManager];
  uint64_t v5 = objc_opt_class();
  id v6 = +[HDSQLitePredicate truePredicate];
  id v10 = 0;
  unsigned __int8 v7 = [v4 deleteDataObjectsOfClass:v5 predicate:v6 limit:0 deletedSampleCount:&v11 notifyObservers:0 generateDeletedObjects:0 recursiveDeleteAuthorizationBlock:0 error:&v10];
  id v8 = v10;

  if (v7)
  {
    if (v11)
    {
      _HKInitializeLogging();
      unsigned __int8 v9 = HKLogHealthRecords;
      if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v13 = self;
        __int16 v14 = 2048;
        uint64_t v15 = v11;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Deleted %lu signed clinical data records (and associated Wallet cards if any)", buf, 0x16u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_ERROR)) {
      sub_AF640();
    }
  }
}

- (void)unitTesting_replaceHealthRecordsPluginAndSetCompleteScheduledExtractionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[HDClinicalIngestionManager alloc] _initWithProfileExtension:self];
  [(HDClinicalIngestionManager *)v5 setUnitTesting_didCompleteScheduledExtraction:v4];

  [(HDClinicalIngestionManager *)v5 _registerForProfileDidBecomeReady];
  ingestionManager = self->_ingestionManager;
  self->_ingestionManager = v5;
}

- (HDHealthRecordsAPIReminderRegistry)APIReminderRegistry
{
  return self->_APIReminderRegistry;
}

- (HDClinicalProviderServiceManager)providerServiceManager
{
  return self->_providerServiceManager;
}

- (HDSignedClinicalDataManager)signedClinicalDataManager
{
  return self->_signedClinicalDataManager;
}

- (HDClinicalSharingManager)clinicalSharingManager
{
  return self->_clinicalSharingManager;
}

- (HDClinicalAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (HDClinicalDailyAnalyticsManager)dailyAnalyticsManager
{
  return self->_dailyAnalyticsManager;
}

- (HDClinicalOptInStudy)optInStudy
{
  return self->_optInStudy;
}

- (HDClinicalOptInDataCollectionManager)optInDataCollectionManager
{
  return self->_optInDataCollectionManager;
}

- (HDClinicalOptInDataUploadManager)optInDataUploadManager
{
  return self->_optInDataUploadManager;
}

- (HDMedicalDownloadableAttachmentManager)downloadableAttachmentManager
{
  return self->_downloadableAttachmentManager;
}

- (HDNotificationSyncClient)notificationSyncClient
{
  return self->_notificationSyncClient;
}

- (void)setNotificationSyncClient:(id)a3
{
}

- (HRSSupportedFHIRConfiguration)unitTesting_supportedFHIRConfigurationOverride
{
  return self->_unitTesting_supportedFHIRConfigurationOverride;
}

- (void)setUnitTesting_supportedFHIRConfigurationOverride:(id)a3
{
}

- (id)unitTest_didProcessNotificationInstruction
{
  return self->_unitTest_didProcessNotificationInstruction;
}

- (void)setUnitTest_didProcessNotificationInstruction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_didProcessNotificationInstruction, 0);
  objc_storeStrong((id *)&self->_unitTesting_supportedFHIRConfigurationOverride, 0);
  objc_storeStrong((id *)&self->_notificationSyncClient, 0);
  objc_storeStrong((id *)&self->_downloadableAttachmentManager, 0);
  objc_storeStrong((id *)&self->_optInDataUploadManager, 0);
  objc_storeStrong((id *)&self->_optInDataCollectionManager, 0);
  objc_storeStrong((id *)&self->_optInStudy, 0);
  objc_storeStrong((id *)&self->_dailyAnalyticsManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_clinicalSharingManager, 0);
  objc_storeStrong((id *)&self->_signedClinicalDataManager, 0);
  objc_storeStrong((id *)&self->_providerServiceManager, 0);
  objc_storeStrong((id *)&self->_ingestionManager, 0);
  objc_storeStrong((id *)&self->_APIReminderRegistry, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_supportedFHIRConfiguration, 0);
  objc_storeStrong((id *)&self->_accountEventObservers, 0);
  objc_storeStrong((id *)&self->_chrSupportedObservers, 0);
  objc_storeStrong((id *)&self->_lastKnownLocale, 0);

  objc_destroyWeak((id *)&self->_healthDeamon);
}

@end