@interface FPDConfigurationStore
+ (id)defaultStore;
+ (void)__test_only_reloadDefaultStore;
- (BOOL)avoidNilErrorItemsForDetailedPayload;
- (BOOL)hangingDownloadCancellationPromptEnabled;
- (BOOL)hasUpcallExecutionTimeLimits;
- (BOOL)trialClientLoadedSuccessfully;
- (FPDConfigurationStore)init;
- (NSArray)dynamicErrorSampleRatePerProvider;
- (NSArray)userPackageExtensions;
- (NSString)targetedSPSErrorsPayload;
- (NSString)trialExperiment;
- (NSString)trialTreatment;
- (double)fseventsAggregationDelay;
- (double)pendingSetRefreshInterval;
- (double)relativeDiskSpaceRequiredToBeGreedy;
- (double)relativeDiskSpaceRequiredToReturnToGreedyState;
- (double)sqlDatabaseBatchDelay;
- (double)temporaryFileTrackingDelayForVariant:(id)a3;
- (double)upcallExcutionTimeLimitProgressCancellationGracePeriod;
- (double)upcallExcutionTimeLimitStaleProgress;
- (double)upcallExecutionTimeLimitBase;
- (double)upcallExecutionTimeLimitPerKiloByte;
- (int)diskSpaceCheckInterval;
- (int)errorGenerationUpdateSeconds;
- (int)fseventProcessBatchSize;
- (int)hardConcurrentContentUpdateLimit;
- (int)hardConcurrentMetadataOnlyUpdateLimit;
- (int)hardConcurrentOperationLimit;
- (int)hardConcurrentProvideFileLimit;
- (int)lowPrioritySignalProviderChangesIntervalSeconds;
- (int)maxFPCKDatabaseChecks;
- (int)maxFPCKDatabaseChecksDiagnostic;
- (int)maxFSEventQueueSize;
- (int)maxLookupDepth;
- (int)minTimeBetweenSpeculativeDownloadsPurgeSession;
- (int)minTimeToPreventDownloadsAfterReturningToGreedyState;
- (int)pendingSetMaxItemCount;
- (int)pendingSetRegatherThreshold;
- (int)perfTelemetrySubSamplingPercentage;
- (int)softConcurrentContentUpdateLimit;
- (int)softConcurrentMetadataOnlyUpdateLimit;
- (int)softConcurrentOperationLimit;
- (int)softConcurrentProvideFileLimit;
- (int)speculativeSetMaximumDownloadsAllowed;
- (int)speculativeSetPageSize;
- (int)speculativeSetRecencyDays;
- (int)sqlDatabaseBatchChangeCount;
- (int)sqlDatabaseFlushIntervalMilliseconds;
- (int)sqlDatabaseOnNextDurableFlushTriggerThreshold;
- (int)sqlDatabaseStatementCacheMaxCount;
- (int)sqlDatabaseStatementWarnTime;
- (int)sqlDatabaseVacuumBatchSize;
- (int)trialTestFactor;
- (int)vfsDirectoryListerLimit;
- (int64_t)diskSpaceRequiredToReturnToGreedyState;
- (int64_t)minimumDiskSpaceRequiredToBeGreedy;
- (int64_t)speculativeRefreshInheritedContentPolicyMaximumJobs;
- (int64_t)speculativeSetCancelDownloadDelay;
- (int64_t)speculativeSetMaximumDownloadsRefreshInterval;
- (int64_t)speculativeSetRefreshInterval;
- (int64_t)spsFeedbackBackoffAfterOtherResponsesInSeconds;
- (int64_t)spsFeedbackBackoffAfterOtherResponses_MultipleAttempts_InSeconds;
- (int64_t)spsFeedbackBackoffAfterSayingYesInSeconds;
- (int64_t)spsFeedbackRequestPromptTimeoutInSeconds;
@end

@implementation FPDConfigurationStore

- (int)maxLookupDepth
{
  return self->_maxLookupDepth;
}

+ (id)defaultStore
{
  if (defaultStore_onceToken != -1) {
    dispatch_once(&defaultStore_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)defaultStore;
  return v2;
}

uint64_t __37__FPDConfigurationStore_defaultStore__block_invoke()
{
  defaultStore = objc_alloc_init(FPDConfigurationStore);
  return MEMORY[0x1F41817F8]();
}

+ (void)__test_only_reloadDefaultStore
{
  defaultStore = objc_alloc_init(FPDConfigurationStore);
  MEMORY[0x1F41817F8]();
}

- (FPDConfigurationStore)init
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v58.receiver = self;
  v58.super_class = (Class)FPDConfigurationStore;
  v2 = [(FPDConfigurationStore *)&v58 init];
  if (v2)
  {
    time_t v50 = time(0);
    v3 = [MEMORY[0x1E4FB0098] clientWithIdentifier:224];
    v2->_trialClientLoadedSuccessfully = v3 != 0;
    v4 = [v3 experimentIdentifiersWithNamespaceName:@"COREOS_FPFS_CONFIG"];
    uint64_t v5 = [v4 treatmentId];
    v6 = (void *)v5;
    if (v5) {
      v7 = (__CFString *)v5;
    }
    else {
      v7 = &stru_1F2EC3618;
    }
    p_trialTreatment = (__CFString **)&v2->_trialTreatment;
    objc_storeStrong((id *)&v2->_trialTreatment, v7);

    v9 = [v3 experimentIdentifiersWithNamespaceName:@"COREOS_FPFS_CONFIG"];
    uint64_t v10 = [v9 experimentId];
    v11 = (void *)v10;
    if (v10) {
      v12 = (__CFString *)v10;
    }
    else {
      v12 = &stru_1F2EC3618;
    }
    v13 = v3;
    objc_storeStrong((id *)&v2->_trialExperiment, v12);

    v2->_trialTestFactor = fp_configuration_store_int_check(v3, @"testFactor", 1, 1u, 0x7FFFFFFF);
    if (v2->_trialClientLoadedSuccessfully)
    {
      v14 = fp_current_or_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D744C000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Trial Client not loaded", buf, 2u);
      }
    }
    v15 = fp_current_or_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = *p_trialTreatment;
      if (!*p_trialTreatment) {
        v16 = @"none";
      }
      *(_DWORD *)buf = 138412290;
      v61 = v16;
      _os_log_impl(&dword_1D744C000, v15, OS_LOG_TYPE_INFO, "[INFO] Trial Treatment is %@", buf, 0xCu);
    }

    v2->_hardConcurrentOperationLimit = fp_configuration_store_int_check(v3, @"hardConcurrentOperationLimit", 128, 1u, 0x7FFFFFFF);
    v2->_softConcurrentOperationLimit = fp_configuration_store_int_check(v3, @"softConcurrentOperationLimit", 32, 1u, 0x7FFFFFFF);
    v2->_hardConcurrentContentUpdateLimit = fp_configuration_store_int_check(v3, @"hardConcurrentContentUpdateLimit", 32, 1u, 0x7FFFFFFF);
    v2->_softConcurrentContentUpdateLimit = fp_configuration_store_int_check(v3, @"softConcurrentContentUpdateLimit", 16, 1u, 0x7FFFFFFF);
    v2->_hardConcurrentMetadataOnlyUpdateLimit = fp_configuration_store_int_check(v3, @"hardConcurrentMetadataOnlyUpdateLimit", 32, 1u, 0x7FFFFFFF);
    v2->_softConcurrentMetadataOnlyUpdateLimit = fp_configuration_store_int_check(v3, @"softConcurrentMetadataOnlyUpdateLimit", 16, 1u, 0x7FFFFFFF);
    v2->_hardConcurrentProvideFileLimit = fp_configuration_store_int_check(v3, @"hardConcurrentProvideFileLimit", 32, 1u, 0x7FFFFFFF);
    v2->_softConcurrentProvideFileLimit = fp_configuration_store_int_check(v3, @"softConcurrentProvideFileLimit", 16, 1u, 0x7FFFFFFF);
    v17 = [v3 levelForFactor:@"userExtensionPackageAllowlist" withNamespaceName:@"COREOS_FPFS_CONFIG"];
    v18 = [v17 stringValue];
    uint64_t v19 = [v18 componentsSeparatedByString:@";"];
    v20 = (void *)v19;
    if (v19) {
      v21 = (void *)v19;
    }
    else {
      v21 = (void *)*MEMORY[0x1E4F25DF8];
    }
    objc_storeStrong((id *)&v2->_userPackageExtensions, v21);

    v2->_hasUpcallExecutionTimeLimits = fp_configuration_store_BOOL_check(v13, @"hasUpcallExecutionTimeLimits", 1);
    v2->_upcallExecutionTimeLimitBase = fp_configuration_store_double_check(v13, @"upcallExecutionTimeLimitBase", 180.0, 0.0, 86400.0);
    v2->_upcallExecutionTimeLimitPerKiloByte = fp_configuration_store_double_check(v13, @"upcallExecutionTimeLimitPerKiloByte", 0.005, 0.0, 3600.0);
    v2->_upcallExcutionTimeLimitStaleProgress = fp_configuration_store_double_check(v13, @"upcallExcutionTimeLimitStaleProgress", 600.0, 0.0, 86400.0);
    v2->_upcallExcutionTimeLimitProgressCancellationGracePeriod = fp_configuration_store_double_check(v13, @"upcallExcutionTimeLimitProgressCancellationGracePeriod", 15.0, 0.0, 3600.0);
    v2->_errorGenerationUpdateSeconds = fp_configuration_store_int_check(v13, @"errorGenerationUpdateSeconds", 30, 1u, 600);
    v2->_lowPrioritySignalProviderChangesIntervalSeconds = fp_configuration_store_int_check(v13, @"lowPrioritySignalProviderChangesIntervalSeconds", 2, 1u, 60);
    v2->_vfsDirectoryListerLimit = fp_configuration_store_int_check(v13, @"vfsDirectoryListerLimit", 200, 1u, 1000);
    v2->_maxFSEventQueueSize = fp_configuration_store_int_check(v13, @"maxFSEventQueueSize", 1024, 0x80u, 10240);
    v2->_fseventProcessBatchSize = fp_configuration_store_int_check(v13, @"fseventProcessBatchSize", 64, 8u, 256);
    v2->_fseventsAggregationDelay = fp_configuration_store_double_check(v13, @"fseventsAggregationDelay", 0.2, 0.0, 3600.0);
    v2->_maxLookupDepth = fp_configuration_store_int_check(v13, @"maxLookupDepth", 5, 1u, 9);
    v2->_sqlDatabaseFlushIntervalMilliseconds = fp_configuration_store_int_check(v13, @"sqlDatabaseFlushIntervalMilliseconds", 100, 0xAu, 1000);
    v2->_sqlDatabaseVacuumBatchSize = fp_configuration_store_int_check(v13, @"sqlDatabaseVacuumBatchSize", 10485760, 0x100000u, 104857600);
    v2->_sqlDatabaseBatchDelay = fp_configuration_store_double_check(v13, @"sqlDatabaseBatchDelay", 0.5, 0.05, 5.0);
    v2->_sqlDatabaseBatchChangeCount = fp_configuration_store_int_check(v13, @"sqlDatabaseBatchChangeCount", 100000, 0x2710u, 1000000);
    v2->_sqlDatabaseOnNextDurableFlushTriggerThreshold = fp_configuration_store_int_check(v13, @"sqlDatabaseOnNextDurableFlushTriggerThreshold", 220, 0x64u, 800);
    v2->_sqlDatabaseStatementCacheMaxCount = fp_configuration_store_int_check(v13, @"sqlDatabaseStatementCacheMaxCount", 300, 0xAu, 0x7FFFFFFF);
    v2->_sqlDatabaseStatementWarnTime = fp_configuration_store_int_check(v13, @"sqlDatabaseStatementWarnTime", 100000, 0, 0x7FFFFFFF);
    v2->_int pendingSetMaxItemCount = fp_configuration_store_int_check(v13, @"pendingSetMaxItemCount", 1000, 2u, 0x7FFFFFFF);
    v2->_pendingSetRefreshInterval = fp_configuration_store_double_check(v13, @"pendingSetRefreshInterval", 1.0, 1.0, 86400.0);
    int pendingSetMaxItemCount = v2->_pendingSetMaxItemCount;
    if (pendingSetMaxItemCount >= 0) {
      int v23 = v2->_pendingSetMaxItemCount;
    }
    else {
      int v23 = pendingSetMaxItemCount + 1;
    }
    v2->_pendingSetRegatherThreshold = fp_configuration_store_int_check(v13, @"pendingSetRegatherThreshold", (v23 >> 1), v23 >> 1, pendingSetMaxItemCount);
    v2->_perfTelemetrySubSamplingPercentage = fp_configuration_store_int_check(v13, @"perfTelemetrySubSamplingPercentage", 80, 0, 100);
    v24 = [v13 levelForFactor:@"dynamicErrorSampleRatePerProvider" withNamespaceName:@"COREOS_FPFS_CONFIG"];
    v25 = [v24 stringValue];
    uint64_t v26 = [v25 componentsSeparatedByString:@";"];
    v27 = (void *)v26;
    if (v26) {
      v28 = (void *)v26;
    }
    else {
      v28 = &unk_1F2EDBB08;
    }
    objc_storeStrong((id *)&v2->_dynamicErrorSampleRatePerProvider, v28);

    v2->_maxFPCKDatabaseChecks = fp_configuration_store_int_check(v13, @"maxFPCKDatabaseChecks", 60000, 0, 0x7FFFFFFF);
    v2->_maxFPCKDatabaseChecksDiagnostic = fp_configuration_store_int_check(v13, @"maxFPCKDatabaseChecksDiagnostic", 2000, 0, 0x7FFFFFFF);
    v2->_avoidNilErrorItemsForDetailedPayload = fp_configuration_store_BOOL_check(v13, @"avoidNilErrorItemsForDetailedPayload", 0);
    v2->_hangingDownloadCancellationPromptEnabled = 0;
    v2->_minimumDiskSpaceRequiredToBeGreedy = fp_configuration_store_int64_check(v13, @"diskSpaceMinimumRequiredToBeGreedy_ios", 0x80000000, 1, 0x7FFFFFFFFFFFFFFFLL);
    v2->_relativeDiskSpaceRequiredToBeGreedy = fp_configuration_store_double_check(v13, @"diskSpaceRequiredToBeGreedyRelative_ios", 0.1, 0.0, 1.0);
    v2->_diskSpaceRequiredToReturnToGreedyState = fp_configuration_store_int64_check(v13, @"diskSpaceRequiredToReturnToGreedyState_ios", 0x200000000, 1, 0x7FFFFFFFFFFFFFFFLL);
    v2->_relativeDiskSpaceRequiredToReturnToGreedyState = fp_configuration_store_double_check(v13, @"diskSpaceRequiredToReturnToGreedyStateRelative_ios", 0.15, 0.0, 1.0);
    v2->_diskSpaceCheckInterval = fp_configuration_store_int_check(v13, @"diskSpaceCheckInterval", 30, 0, 0x7FFFFFFF);
    v2->_minTimeBetweenSpeculativeDownloadsPurgeSession = fp_configuration_store_int_check(v13, @"minTimeBetweenSpeculativeDownloadsPurgeSession_ios", 1200, 0, 0x7FFFFFFF);
    v51 = v2;
    v2->_minTimeToPreventDownloadsAfterReturningToGreedyState = fp_configuration_store_int_check(v13, @"minTimeToPreventDownloadsAfterReturningToGreedyState_ios", 86400, 0, 0x7FFFFFFF);
    v52 = (NSMutableDictionary *)objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v29 = [&unk_1F2EDBB20 countByEnumeratingWithState:&v54 objects:v59 count:16];
    v53 = v13;
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v55 != v31) {
            objc_enumerationMutation(&unk_1F2EDBB20);
          }
          uint64_t v33 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          v34 = [NSString stringWithFormat:@"temporaryFileTrackingDelay.%@", v33];
          v35 = [v13 levelForFactor:v34 withNamespaceName:@"COREOS_FPFS_CONFIG"];
          v36 = v35;
          if (v35 && [v35 levelOneOfCase] == 15)
          {
            [v36 doubleValue];
            double v38 = v37;
            double v39 = 1.0;
            if (v38 > 1.0)
            {
              double v39 = v38;
              if (v38 >= 86400.0) {
                double v39 = 86400.0;
              }
            }
            v40 = [NSNumber numberWithDouble:v39];
            [(NSMutableDictionary *)v52 setObject:v40 forKeyedSubscript:v33];

            v13 = v53;
          }
        }
        uint64_t v30 = [&unk_1F2EDBB20 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v30);
    }
    v2 = v51;
    temporaryFileTrackingDelayPerVariant = v51->_temporaryFileTrackingDelayPerVariant;
    v51->_temporaryFileTrackingDelayPerVariant = v52;
    v42 = v52;

    v51->_defaultTemporaryFileTrackingDelay = fp_configuration_store_double_check(v53, @"temporaryFileTrackingDelay", 60.0, 1.0, 86400.0);
    v51->_speculativeSetRecencyDays = fp_configuration_store_int_check(v53, @"speculativeSetRecencyDays", 90, 0, 1000);
    v51->_speculativeSetPageSize = fp_configuration_store_int_check(v53, @"speculativeSetPageSize", 100, 1u, 1000);
    v51->_speculativeSetRefreshInterval = fp_configuration_store_int64_check(v53, @"speculativeSetRefreshInterval", 60, 0, 86400);
    v51->_speculativeSetMaximumDownloadsAllowed = fp_configuration_store_int_check(v53, @"speculativeSetMaximumDownloadsAllowed", 1000000, 0, 1000000);
    v51->_speculativeSetMaximumDownloadsRefreshInterval = fp_configuration_store_int64_check(v53, @"speculativeSetMaximumDownloadsRefreshInterval", 86400, 0, 2592000);
    v51->_speculativeSetCancelDownloadDelay = fp_configuration_store_int64_check(v53, @"speculativeSetCancelDownloadDelay", 10, 0, 86400);
    v51->_speculativeRefreshInheritedContentPolicyMaximumJobs = fp_configuration_store_int64_check(v53, @"_speculativeRefreshInheritedContentPolicyMaximumJobs", 10, 1, 100);
    v43 = [v53 levelForFactor:@"targetedSPSErrorsPayload" withNamespaceName:@"COREOS_FPFS_CONFIG"];
    v44 = v43;
    if (v43 && [v43 levelOneOfCase] == 11)
    {
      v45 = [v44 stringValue];
    }
    else
    {
      v45 = @"[]";
    }

    targetedSPSErrorsPayload = v51->_targetedSPSErrorsPayload;
    v51->_targetedSPSErrorsPayload = &v45->isa;

    v51->_spsFeedbackRequestPromptTimeoutInSeconds = (int)fp_configuration_store_int_check(v53, @"spsFeedbackRequestPromptTimeoutInSeconds", 172800, 0, 0x7FFFFFFF);
    v51->_spsFeedbackBackoffAfterSayingYesInSeconds = (int)fp_configuration_store_int_check(v53, @"spsFeedbackBackoffAfterSayingYesInSeconds", 2678400, 0, 0x7FFFFFFF);
    v51->_spsFeedbackBackoffAfterOtherResponsesInSeconds = (int)fp_configuration_store_int_check(v53, @"spsFeedbackBackoffAfterOtherResponsesInSeconds", 604800, 0, 0x7FFFFFFF);
    v51->_spsFeedbackBackoffAfterOtherResponses_MultipleAttempts_InSeconds = (int)fp_configuration_store_int_check(v53, @"spsFeedbackBackoffAfterOtherResponses_MultipleAttempts_InSeconds", 2678400, 0, 0x7FFFFFFF);
    v47 = fp_current_or_default_log();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      time_t v48 = time(0);
      *(_DWORD *)buf = 134217984;
      v61 = (__CFString *)(v50 - v48);
      _os_log_impl(&dword_1D744C000, v47, OS_LOG_TYPE_INFO, "[INFO] Configuration store startup completed in %lu seconds", buf, 0xCu);
    }
  }
  return v2;
}

- (double)temporaryFileTrackingDelayForVariant:(id)a3
{
  v4 = [(NSMutableDictionary *)self->_temporaryFileTrackingDelayPerVariant objectForKeyedSubscript:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    double defaultTemporaryFileTrackingDelay = v6;
  }
  else
  {
    double defaultTemporaryFileTrackingDelay = self->_defaultTemporaryFileTrackingDelay;
  }

  return defaultTemporaryFileTrackingDelay;
}

- (NSString)trialTreatment
{
  return self->_trialTreatment;
}

- (NSString)trialExperiment
{
  return self->_trialExperiment;
}

- (BOOL)trialClientLoadedSuccessfully
{
  return self->_trialClientLoadedSuccessfully;
}

- (int)trialTestFactor
{
  return self->_trialTestFactor;
}

- (int)hardConcurrentOperationLimit
{
  return self->_hardConcurrentOperationLimit;
}

- (int)softConcurrentOperationLimit
{
  return self->_softConcurrentOperationLimit;
}

- (int)hardConcurrentContentUpdateLimit
{
  return self->_hardConcurrentContentUpdateLimit;
}

- (int)softConcurrentContentUpdateLimit
{
  return self->_softConcurrentContentUpdateLimit;
}

- (int)hardConcurrentMetadataOnlyUpdateLimit
{
  return self->_hardConcurrentMetadataOnlyUpdateLimit;
}

- (int)softConcurrentMetadataOnlyUpdateLimit
{
  return self->_softConcurrentMetadataOnlyUpdateLimit;
}

- (int)hardConcurrentProvideFileLimit
{
  return self->_hardConcurrentProvideFileLimit;
}

- (int)softConcurrentProvideFileLimit
{
  return self->_softConcurrentProvideFileLimit;
}

- (NSArray)userPackageExtensions
{
  return self->_userPackageExtensions;
}

- (BOOL)hasUpcallExecutionTimeLimits
{
  return self->_hasUpcallExecutionTimeLimits;
}

- (double)upcallExecutionTimeLimitBase
{
  return self->_upcallExecutionTimeLimitBase;
}

- (double)upcallExecutionTimeLimitPerKiloByte
{
  return self->_upcallExecutionTimeLimitPerKiloByte;
}

- (double)upcallExcutionTimeLimitStaleProgress
{
  return self->_upcallExcutionTimeLimitStaleProgress;
}

- (double)upcallExcutionTimeLimitProgressCancellationGracePeriod
{
  return self->_upcallExcutionTimeLimitProgressCancellationGracePeriod;
}

- (int)errorGenerationUpdateSeconds
{
  return self->_errorGenerationUpdateSeconds;
}

- (int)lowPrioritySignalProviderChangesIntervalSeconds
{
  return self->_lowPrioritySignalProviderChangesIntervalSeconds;
}

- (int)vfsDirectoryListerLimit
{
  return self->_vfsDirectoryListerLimit;
}

- (int)maxFSEventQueueSize
{
  return self->_maxFSEventQueueSize;
}

- (int)fseventProcessBatchSize
{
  return self->_fseventProcessBatchSize;
}

- (double)fseventsAggregationDelay
{
  return self->_fseventsAggregationDelay;
}

- (int)sqlDatabaseFlushIntervalMilliseconds
{
  return self->_sqlDatabaseFlushIntervalMilliseconds;
}

- (int)sqlDatabaseVacuumBatchSize
{
  return self->_sqlDatabaseVacuumBatchSize;
}

- (double)sqlDatabaseBatchDelay
{
  return self->_sqlDatabaseBatchDelay;
}

- (int)sqlDatabaseBatchChangeCount
{
  return self->_sqlDatabaseBatchChangeCount;
}

- (int)sqlDatabaseOnNextDurableFlushTriggerThreshold
{
  return self->_sqlDatabaseOnNextDurableFlushTriggerThreshold;
}

- (int)sqlDatabaseStatementCacheMaxCount
{
  return self->_sqlDatabaseStatementCacheMaxCount;
}

- (int)sqlDatabaseStatementWarnTime
{
  return self->_sqlDatabaseStatementWarnTime;
}

- (int)pendingSetMaxItemCount
{
  return self->_pendingSetMaxItemCount;
}

- (double)pendingSetRefreshInterval
{
  return self->_pendingSetRefreshInterval;
}

- (int)pendingSetRegatherThreshold
{
  return self->_pendingSetRegatherThreshold;
}

- (int)perfTelemetrySubSamplingPercentage
{
  return self->_perfTelemetrySubSamplingPercentage;
}

- (NSArray)dynamicErrorSampleRatePerProvider
{
  return self->_dynamicErrorSampleRatePerProvider;
}

- (BOOL)hangingDownloadCancellationPromptEnabled
{
  return self->_hangingDownloadCancellationPromptEnabled;
}

- (int)maxFPCKDatabaseChecks
{
  return self->_maxFPCKDatabaseChecks;
}

- (int)maxFPCKDatabaseChecksDiagnostic
{
  return self->_maxFPCKDatabaseChecksDiagnostic;
}

- (BOOL)avoidNilErrorItemsForDetailedPayload
{
  return self->_avoidNilErrorItemsForDetailedPayload;
}

- (int64_t)minimumDiskSpaceRequiredToBeGreedy
{
  return self->_minimumDiskSpaceRequiredToBeGreedy;
}

- (double)relativeDiskSpaceRequiredToBeGreedy
{
  return self->_relativeDiskSpaceRequiredToBeGreedy;
}

- (int64_t)diskSpaceRequiredToReturnToGreedyState
{
  return self->_diskSpaceRequiredToReturnToGreedyState;
}

- (double)relativeDiskSpaceRequiredToReturnToGreedyState
{
  return self->_relativeDiskSpaceRequiredToReturnToGreedyState;
}

- (int)diskSpaceCheckInterval
{
  return self->_diskSpaceCheckInterval;
}

- (int)minTimeBetweenSpeculativeDownloadsPurgeSession
{
  return self->_minTimeBetweenSpeculativeDownloadsPurgeSession;
}

- (int)minTimeToPreventDownloadsAfterReturningToGreedyState
{
  return self->_minTimeToPreventDownloadsAfterReturningToGreedyState;
}

- (int)speculativeSetRecencyDays
{
  return self->_speculativeSetRecencyDays;
}

- (int)speculativeSetPageSize
{
  return self->_speculativeSetPageSize;
}

- (int64_t)speculativeSetRefreshInterval
{
  return self->_speculativeSetRefreshInterval;
}

- (int)speculativeSetMaximumDownloadsAllowed
{
  return self->_speculativeSetMaximumDownloadsAllowed;
}

- (int64_t)speculativeSetMaximumDownloadsRefreshInterval
{
  return self->_speculativeSetMaximumDownloadsRefreshInterval;
}

- (int64_t)speculativeSetCancelDownloadDelay
{
  return self->_speculativeSetCancelDownloadDelay;
}

- (int64_t)speculativeRefreshInheritedContentPolicyMaximumJobs
{
  return self->_speculativeRefreshInheritedContentPolicyMaximumJobs;
}

- (NSString)targetedSPSErrorsPayload
{
  return self->_targetedSPSErrorsPayload;
}

- (int64_t)spsFeedbackRequestPromptTimeoutInSeconds
{
  return self->_spsFeedbackRequestPromptTimeoutInSeconds;
}

- (int64_t)spsFeedbackBackoffAfterSayingYesInSeconds
{
  return self->_spsFeedbackBackoffAfterSayingYesInSeconds;
}

- (int64_t)spsFeedbackBackoffAfterOtherResponsesInSeconds
{
  return self->_spsFeedbackBackoffAfterOtherResponsesInSeconds;
}

- (int64_t)spsFeedbackBackoffAfterOtherResponses_MultipleAttempts_InSeconds
{
  return self->_spsFeedbackBackoffAfterOtherResponses_MultipleAttempts_InSeconds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetedSPSErrorsPayload, 0);
  objc_storeStrong((id *)&self->_dynamicErrorSampleRatePerProvider, 0);
  objc_storeStrong((id *)&self->_userPackageExtensions, 0);
  objc_storeStrong((id *)&self->_trialExperiment, 0);
  objc_storeStrong((id *)&self->_trialTreatment, 0);
  objc_storeStrong((id *)&self->_temporaryFileTrackingDelayPerVariant, 0);
}

@end