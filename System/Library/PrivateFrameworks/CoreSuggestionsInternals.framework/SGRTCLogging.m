@interface SGRTCLogging
+ (BOOL)_createEmptyFileAtPath:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (double)round:(double)a3 toSignificantFigures:(int64_t)a4;
+ (id)_deepCopy:(id)a3;
+ (id)_deepMutableContainersCopy:(id)a3;
+ (id)aggregateSummaryBucketizedLaunchCountsForApps:(id)a3 afterDate:(id)a4;
+ (id)bucketizeIntegersForAggregateSummary:(id)a3;
+ (id)dateByAppendingDaysToCurrentDate:(double)a3;
+ (id)defaultLogger;
+ (id)describeReminderExtractionStatus:(unsigned __int8)a3;
+ (id)descriptionForOriginType:(unint64_t)a3;
+ (id)launchCountsForApps:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5;
+ (id)launchCountsForApps:(id)a3 afterDate:(id)a4 lowerBucket:(unint64_t)a5 bucketSize:(unint64_t)a6 bucketLimit:(unint64_t)a7;
+ (id)locationTypeForEntity:(id)a3;
+ (id)locationTypeForHandle:(id)a3 latitude:(double)a4 longitude:(double)a5 airportCode:(id)a6 address:(id)a7 label:(id)a8;
+ (id)locationTypeForRealtimeEvent:(id)a3;
+ (unint64_t)bucketizeInteger:(unint64_t)a3 withBucketSize:(unint64_t)a4 limit:(unint64_t)a5;
+ (unint64_t)bucketizeIntegerForAggregateSummary:(unint64_t)a3;
+ (unint64_t)numberOfDaysBetweenDate:(id)a3 andDate:(id)a4;
- (BOOL)incrementAndUpgradeInteractionSummaryForEventKey:(id)a3 interactionKey:(id)a4 parentEntity:(id)a5;
- (BOOL)removeInteractionsSummaryLogsFromLogs:(id)a3;
- (BOOL)resetExtractionLogs;
- (BOOL)resetInteractionsLogs;
- (BOOL)resetInteractionsSummaryLogs;
- (BOOL)resetLogs;
- (BOOL)storeToDisk;
- (SGRTCLogging)init;
- (SGRTCLogging)initWithCoder:(id)a3;
- (SGRTCLogging)initWithFilename:(id)a3;
- (double)storeAge;
- (id)_baseInteractionAttributesForReminder:(id)a3;
- (id)_calendarUsageLast2Weeks;
- (id)_createRTCReporting;
- (id)_descriptionForActionType:(unsigned __int16)a3;
- (id)_descriptionForBundleId:(id)a3;
- (id)_descriptionForExtractionStatus:(unsigned __int16)a3;
- (id)_descriptionForInterface:(unsigned __int16)a3;
- (id)_descriptionForMessageEventDissectorExtractionStatus:(unsigned __int16)a3;
- (id)_eventExtractionDictionaryLogForTemplateName:(id)a3 extractionStatus:(unsigned __int16)a4 outputExceptions:(id)a5 outputInfos:(id)a6 jsMessageLogs:(id)a7 jsOutputLogs:(id)a8 timingProcessing:(unint64_t)a9;
- (id)_eventKeyforReminder:(id)a3;
- (id)_interactionAttributesForEntity:(id)a3 parentEntity:(id)a4;
- (id)_interactionAttributesForRealtimeEvent:(id)a3 parentEntity:(id)a4;
- (id)_interactionAttributesForTags:(id)a3 parentEntity:(id)a4;
- (id)_interactionDictionaryForDueLocation:(id)a3 dueDateComponents:(id)a4;
- (id)_interactionSummaryForReminder:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (id)_mapsUsageLast2Weeks;
- (id)allowlistedLogFromLog:(id)a3;
- (id)assetVersionsForMLMessageEvent;
- (id)baseInteractionDictionaryForInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4;
- (id)bucketizedRemindersCreatedAfterDate:(id)a3 endDate:(id)a4;
- (id)cappedDeliveryEntityCountsCreatedBetweenStartDate:(id)a3 endDate:(id)a4;
- (id)cappedDeliveryEntityCountsCreatedBetweenStartDate:(id)a3 endDate:(id)a4 store:(id)a5;
- (id)createInteractionSummaryForEventKey:(id)a3 expirationDate:(id)a4 interactionKey:(id)a5 interactionAttributes:(id)a6 rtcCategory:(unsigned __int16)a7;
- (id)descriptionForEntityType:(int64_t)a3;
- (id)descriptionForSGRTCCategory:(unsigned __int16)a3;
- (id)interactionKeyForCategory:(unsigned __int16)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (id)interactionKeyForInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4;
- (id)interactionsWriteQueue;
- (id)loggedExtractions;
- (id)loggedExtractionsDescription;
- (id)loggedInteractions;
- (id)loggedInteractionsDescription;
- (id)loggedInteractionsSummary;
- (id)loggedInteractionsSummaryDescription;
- (id)logsToSend;
- (id)logsToSendWithInteractionSummaryRange:(_NSRange *)a3;
- (id)trialIds;
- (id)trialIdsForStructuredEvent;
- (unint64_t)loggedExtractionsEventsCount;
- (void)_logReminderInteractionSummaryForReminder:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)_updateLocationTypeFromInteractionsSummaryForEventKey:(id)a3 locationType:(id)a4;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)enrichAggregateSummaryLog:(id)a3;
- (void)enrichInteractionSummaryLog:(id)a3;
- (void)enrichReminderInteractionSummaryLog:(id)a3;
- (void)logAggregateSummaryForInteraction:(id)a3;
- (void)logAndIncrementEventCountForDictionary:(id)a3;
- (void)logEventExtractionForTemplateName:(id)a3 extractionStatus:(unsigned __int16)a4 outputExceptions:(id)a5 outputInfos:(id)a6 jsMessageLogs:(id)a7 jsOutputLogs:(id)a8 timingProcessing:(unint64_t)a9;
- (void)logEventInteractionForEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logEventInteractionForEntitySync:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logEventInteractionForRealtimeEvent:(id)a3 parentEntity:(id)a4 interface:(unsigned __int16)a5 actionType:(unsigned __int16)a6;
- (void)logEventInteractionForRealtimeEventSync:(id)a3 parentEntity:(id)a4 interface:(unsigned __int16)a5 actionType:(unsigned __int16)a6;
- (void)logMLMessageEventExtractionForEntitySync:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logMLMessageEventExtractionForTemplateName:(id)a3 extractionStatus:(unsigned __int16)a4 outputInfo:(id)a5 outputExceptions:(id)a6 timingProcessing:(unint64_t)a7;
- (void)logMLMessageEventInteractionForEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)logNewInteractionSummaryWithDictionary:(id)a3;
- (void)logNewInteractionWithDictionary:(id)a3;
- (void)logReminderExtractionFromEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5 dueLocation:(id)a6 dueDateComponents:(id)a7 extractionStatus:(unsigned __int8)a8 timingProcessing:(double)a9;
- (void)logReminderInteractionFromEntity:(id)a3 usingStore:(id)a4 interface:(unsigned __int16)a5 actionType:(unsigned __int16)a6;
- (void)logReminderInteractionFromReminder:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5;
- (void)sendRTCLogsWithCompletion:(id)a3;
- (void)sendRTCLogsWithShouldContinueBlock:(id)a3 completion:(id)a4;
- (void)updateAndScheduleDiskWrite;
@end

@implementation SGRTCLogging

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionsWriteQueue, 0);
  objc_storeStrong((id *)&self->_persistenceTimerSource, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (id)assetVersionsForMLMessageEvent
{
  v2 = objc_opt_new();
  if (+[SGMessageEventDissector mobileAssetsEnabled])
  {
    v3 = +[SGAsset regionAsset];
    uint64_t v4 = [v3 assetVersion];

    if (!v4) {
      goto LABEL_16;
    }
    v5 = [NSNumber numberWithUnsignedInteger:v4];
    [v2 setObject:v5 forKeyedSubscript:@"mobileAssetsVersion"];
  }
  else
  {
    v5 = +[SGMessageEventDissectorTrialClientWrapper sharedInstance];
    v6 = [v5 treatmentId];
    v7 = [v5 experimentId];
    v8 = [v5 deploymentId];
    v9 = [v5 rolloutIdentifiers];
    v10 = [v9 rolloutId];

    v11 = [v5 rolloutIdentifiers];
    v12 = [v11 rampId];

    if ([v6 length]) {
      [v2 setObject:v6 forKeyedSubscript:@"trialTreatmentId"];
    }
    if ([v7 length]) {
      [v2 setObject:v7 forKeyedSubscript:@"trialExperimentId"];
    }
    if (v8) {
      [v2 setObject:v8 forKeyedSubscript:@"trialDeploymentId"];
    }
    if ([v10 length]) {
      [v2 setObject:v10 forKeyedSubscript:@"trialRolloutId"];
    }
    if ([v12 length]) {
      [v2 setObject:v12 forKeyedSubscript:@"trialRampId"];
    }
  }
LABEL_16:
  return v2;
}

- (id)trialIdsForStructuredEvent
{
  v2 = objc_opt_new();
  v3 = +[SGStructuredEventTrialClientWrapper sharedInstance];
  uint64_t v4 = [v3 treatmentId];
  v5 = [v3 experimentId];
  v6 = [v3 deploymentId];
  if ([v4 length]) {
    [v2 setObject:v4 forKeyedSubscript:@"trialTreatmentId"];
  }
  if ([v5 length]) {
    [v2 setObject:v5 forKeyedSubscript:@"trialExperimentId"];
  }
  if (v6) {
    [v2 setObject:v6 forKeyedSubscript:@"trialDeploymentId"];
  }

  return v2;
}

- (id)_descriptionForBundleId:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x1E4F5DC28]])
  {
    uint64_t v4 = @"email";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F5DC38]])
  {
    uint64_t v4 = @"sms";
  }
  else if ([v3 isEqualToString:*MEMORY[0x1E4F5DC60]])
  {
    uint64_t v4 = @"webpage";
  }
  else
  {
    uint64_t v4 = @"unknown";
  }

  return v4;
}

- (id)descriptionForEntityType:(int64_t)a3
{
  if (a3 > 15)
  {
    if (a3 != 16)
    {
      if (a3 == 18) {
        return @"webpage";
      }
      return @"unknown";
    }
    return @"interaction";
  }
  else
  {
    if (a3 != 5)
    {
      if (a3 == 13) {
        return @"sms";
      }
      return @"unknown";
    }
    return @"email";
  }
}

- (id)descriptionForSGRTCCategory:(unsigned __int16)a3
{
  if ((a3 - 5) > 6) {
    return @"unknown";
  }
  else {
    return off_1E65B8018[(unsigned __int16)(a3 - 5)];
  }
}

- (id)_descriptionForActionType:(unsigned __int16)a3
{
  if (a3 > 0xDu) {
    return @"unknown";
  }
  else {
    return off_1E65B7FA8[a3];
  }
}

- (id)_descriptionForInterface:(unsigned __int16)a3
{
  if (a3 > 0x1Au) {
    return @"unknown";
  }
  else {
    return off_1E65B7ED0[a3];
  }
}

- (id)_descriptionForMessageEventDissectorExtractionStatus:(unsigned __int16)a3
{
  id v3 = @"unknown";
  if (a3 == 1) {
    id v3 = @"fail";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"event";
  }
}

- (id)_descriptionForExtractionStatus:(unsigned __int16)a3
{
  if (a3 > 3u) {
    return @"unknown";
  }
  else {
    return off_1E65B7EB0[a3];
  }
}

- (id)interactionsWriteQueue
{
  return self->_interactionsWriteQueue;
}

- (id)loggedInteractionsSummaryDescription
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__13825;
  v10 = __Block_byref_object_dispose__13826;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__SGRTCLogging_loggedInteractionsSummaryDescription__block_invoke;
  v5[3] = &unk_1E65B7CC0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __52__SGRTCLogging_loggedInteractionsSummaryDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 24) description];
  return MEMORY[0x1F41817F8]();
}

- (id)loggedInteractionsDescription
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__13825;
  v10 = __Block_byref_object_dispose__13826;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__SGRTCLogging_loggedInteractionsDescription__block_invoke;
  v5[3] = &unk_1E65B7CC0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __45__SGRTCLogging_loggedInteractionsDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 16) description];
  return MEMORY[0x1F41817F8]();
}

- (id)loggedExtractionsDescription
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__13825;
  v10 = __Block_byref_object_dispose__13826;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SGRTCLogging_loggedExtractionsDescription__block_invoke;
  v5[3] = &unk_1E65B7CC0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __44__SGRTCLogging_loggedExtractionsDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 8) description];
  return MEMORY[0x1F41817F8]();
}

- (double)storeAge
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  uint64_t v9 = 0;
  v10 = (double *)&v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __24__SGRTCLogging_storeAge__block_invoke;
  v8[3] = &unk_1E65B7CC0;
  v8[4] = &v9;
  [(_PASLock *)lock runWithLockAcquired:v8];
  double v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v4 - v6;
}

double __24__SGRTCLogging_storeAge__block_invoke(uint64_t a1, uint64_t a2)
{
  double result = *(double *)(a2 + 32);
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)storeToDisk
{
  double v4 = (void *)os_transaction_create();
  v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v5, OS_LOG_TYPE_INFO, "Persisting some logs to disk!", buf, 2u);
  }

  *(void *)buf = 0;
  uint64_t v11 = buf;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __27__SGRTCLogging_storeToDisk__block_invoke;
  v9[3] = &unk_1E65B7E90;
  v9[5] = buf;
  v9[6] = a2;
  v9[4] = self;
  [(_PASLock *)lock runWithLockAcquired:v9];
  uint8_t v7 = v11[24];
  _Block_object_dispose(buf, 8);

  return v7;
}

void __27__SGRTCLogging_storeToDisk__block_invoke(void *a1, void *a2)
{
  v35[4] = *MEMORY[0x1E4F143B8];
  double v3 = a2;
  double v4 = [*(id *)(a1[4] + 16) stringByAppendingPathExtension:@"tmp"];
  if (!v4)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a1[6], a1[4], @"SGRTCLogging.m", 1229, @"Invalid parameter not satisfying: %@", @"tmpPath" object file lineNumber description];
  }
  uint64_t v5 = v3[1];
  uint64_t v6 = v3[2];
  v34[0] = @"loggedExtractions";
  v34[1] = @"loggedInteractions";
  v35[0] = v5;
  v35[1] = v6;
  v35[2] = v3[3];
  uint8_t v7 = (void *)MEMORY[0x1E4F93B50];
  v34[2] = @"loggedInteractionsSummary";
  v34[3] = @"storeAge";
  uint64_t v8 = [NSNumber numberWithDouble:*((double *)v3 + 4)];
  v35[3] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:4];
  id v29 = 0;
  v10 = [v7 fileBackedDataWithPropertyList:v9 writtenToPath:v4 error:&v29];
  id v11 = v29;

  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v10 != 0;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1[4] + 16)];
    v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
    id v28 = v11;
    char v15 = [v12 replaceItemAtURL:v13 withItemAtURL:v14 backupItemName:0 options:0 resultingItemURL:0 error:&v28];
    id v16 = v28;

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v15;
    if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
    {
      v17 = [MEMORY[0x1E4F93B50] propertyListWithData:v10 error:0];
      if (!v17)
      {
        v27 = [MEMORY[0x1E4F28B00] currentHandler];
        [v27 handleFailureInMethod:a1[6], a1[4], @"SGRTCLogging.m", 1249, @"Invalid parameter not satisfying: %@", @"plp" object file lineNumber description];
      }
      v18 = [v17 objectForKeyedSubscript:@"loggedExtractions"];
      uint64_t v19 = [v18 mutableCopy];
      v20 = (void *)v3[1];
      v3[1] = v19;

      v21 = [v17 objectForKeyedSubscript:@"loggedInteractions"];
      uint64_t v22 = [v21 mutableCopy];
      v23 = (void *)v3[2];
      v3[2] = v22;

      goto LABEL_11;
    }
  }
  else
  {
    id v16 = v11;
  }
  v24 = sgLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    v25 = @"NULL";
    if (v10) {
      v25 = @"nonnull";
    }
    *(_DWORD *)buf = 138412546;
    v31 = v25;
    __int16 v32 = 2112;
    id v33 = v16;
    _os_log_fault_impl(&dword_1CA650000, v24, OS_LOG_TYPE_FAULT, "Failure in -[SGRTCLogging storeToDisk] (plpData is %@), error: %@", buf, 0x16u);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria()) {
    abort();
  }
LABEL_11:
}

- (BOOL)removeInteractionsSummaryLogsFromLogs:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    lock = self->_lock;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__SGRTCLogging_removeInteractionsSummaryLogsFromLogs___block_invoke;
    v8[3] = &unk_1E65B7D30;
    id v9 = v4;
    [(_PASLock *)lock runWithLockAcquired:v8];
    BOOL v6 = [(SGRTCLogging *)self storeToDisk];
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

void __54__SGRTCLogging_removeInteractionsSummaryLogsFromLogs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(v3[3], "removeObject:", *(void *)(*((void *)&v9 + 1) + 8 * v8++), (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)resetInteractionsLogs
{
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_297];
  return [(SGRTCLogging *)self storeToDisk];
}

void __37__SGRTCLogging_resetInteractionsLogs__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v3 = objc_opt_new();
  id v4 = (id)v2[2];
  v2[2] = v3;
}

- (BOOL)resetInteractionsSummaryLogs
{
  [(_PASLock *)self->_lock runWithLockAcquired:&__block_literal_global_295];
  return [(SGRTCLogging *)self storeToDisk];
}

void __44__SGRTCLogging_resetInteractionsSummaryLogs__block_invoke(uint64_t a1, void *a2)
{
  v2 = a2;
  uint64_t v3 = objc_opt_new();
  id v4 = (id)v2[3];
  v2[3] = v3;
}

- (BOOL)resetExtractionLogs
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  lock = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__SGRTCLogging_resetExtractionLogs__block_invoke;
  v6[3] = &unk_1E65B7C78;
  v6[4] = self;
  v6[5] = &v7;
  [(_PASLock *)lock runWithLockAcquired:v6];
  if (*((unsigned char *)v8 + 24)) {
    BOOL v4 = [(SGRTCLogging *)self storeToDisk];
  }
  else {
    BOOL v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __35__SGRTCLogging_resetExtractionLogs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9C8];
  BOOL v4 = a2;
  [v3 timeIntervalSinceReferenceDate];
  v4[4] = v5;
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (void *)v4[1];
  v4[1] = v6;

  if (([(id)objc_opt_class() _createEmptyFileAtPath:*(void *)(*(void *)(a1 + 32) + 16)] & 1) == 0)
  {
    uint64_t v8 = sgLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_error_impl(&dword_1CA650000, v8, OS_LOG_TYPE_ERROR, "Couldn't create the privacy-aware store for Suggestions.", v9, 2u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)resetLogs
{
  if (![(SGRTCLogging *)self resetExtractionLogs]
    || ![(SGRTCLogging *)self resetInteractionsLogs])
  {
    return 0;
  }
  return [(SGRTCLogging *)self resetInteractionsSummaryLogs];
}

- (void)sendRTCLogsWithShouldContinueBlock:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  uint64_t v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_INFO, "RTCLogging: Sending privacy-aware suggestions log over the network", buf, 2u);
  }

  [(SGRTCLogging *)self logAggregateSummaryForInteraction:@"rtcLogsSent"];
  long long v27 = 0uLL;
  uint64_t v9 = [(SGRTCLogging *)self logsToSendWithInteractionSummaryRange:&v27];
  BOOL v10 = [v9 count] == 0;
  long long v11 = sgLogHandle();
  long long v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA650000, v12, OS_LOG_TYPE_INFO, "RTCLogging: No RTC logs to send this time. Skipping.", buf, 2u);
    }

    v7[2](v7, 1, 0);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = [v9 count];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v9;
      _os_log_debug_impl(&dword_1CA650000, v12, OS_LOG_TYPE_DEBUG, "RTCLogging: Selected logs (%lu): %@", buf, 0x16u);
    }

    char v13 = [(SGRTCLogging *)self _createRTCReporting];
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    char v29 = 0;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke;
    v16[3] = &unk_1E65B7E68;
    v20 = v7;
    id v17 = v9;
    id v21 = v6;
    v18 = self;
    id v14 = v13;
    id v19 = v14;
    uint64_t v22 = buf;
    v23 = v25;
    long long v24 = v27;
    [v14 startConfigurationWithCompletionHandler:v16];

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(buf, 8);
  }
}

void __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  id v57 = a2;
  if (v57)
  {
    v61 = objc_opt_new();
    v60 = objc_opt_new();
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id obj = *(id *)(a1 + 32);
    uint64_t v65 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
    if (v65)
    {
      char v63 = 0;
      uint64_t v64 = *(void *)v79;
      *(void *)&long long v3 = 138412290;
      long long v56 = v3;
LABEL_4:
      uint64_t v4 = 0;
      while (1)
      {
        if (*(void *)v79 != v64) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void **)(*((void *)&v78 + 1) + 8 * v4);
        context = (void *)MEMORY[0x1CB79B230]();
        if (((*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16))() & 1) == 0)
        {
          v52 = sgLogHandle();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v72 = 0;
            _os_log_impl(&dword_1CA650000, v52, OS_LOG_TYPE_INFO, "RTCLogging: Aborting sending of logs as shouldContinueBlock returned NO", v72, 2u);
          }

          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

          goto LABEL_60;
        }
        *(void *)v72 = 0;
        v73 = v72;
        uint64_t v74 = 0x3032000000;
        v75 = __Block_byref_object_copy__13825;
        v76 = __Block_byref_object_dispose__13826;
        id v77 = v5;
        *(void *)&long long buf = 0;
        *((void *)&buf + 1) = &buf;
        uint64_t v85 = 0x3032000000;
        v86 = __Block_byref_object_copy__13825;
        v87 = __Block_byref_object_dispose__13826;
        id v88 = 0;
        v71[0] = MEMORY[0x1E4F143A8];
        v71[1] = 3221225472;
        v71[2] = __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_278;
        v71[3] = &unk_1E65B7E40;
        v71[4] = &buf;
        v71[5] = v72;
        id v6 = (void (**)(void))MEMORY[0x1CB79B4C0](v71);
        _Block_object_dispose(&buf, 8);

        uint64_t v7 = [*((id *)v73 + 5) objectForKeyedSubscript:@"categoryLog"];
        uint64_t v8 = [*(id *)(a1 + 40) descriptionForSGRTCCategory:5];
        char v9 = [v7 isEqualToString:v8];

        if (v9)
        {
          uint64_t v10 = 5;
          goto LABEL_28;
        }
        long long v11 = [*(id *)(a1 + 40) descriptionForSGRTCCategory:6];
        char v12 = [v7 isEqualToString:v11];

        if (v12)
        {
          uint64_t v10 = 6;
          goto LABEL_28;
        }
        char v13 = [*(id *)(a1 + 40) descriptionForSGRTCCategory:7];
        int v14 = [v7 isEqualToString:v13];

        uint64_t v15 = *(void **)(a1 + 40);
        if (v14)
        {
          id v16 = v6[2](v6);
          [v15 enrichInteractionSummaryLog:v16];

          v70[0] = MEMORY[0x1E4F143A8];
          v70[1] = 3221225472;
          v70[2] = __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_2;
          v70[3] = &unk_1E65BB830;
          v70[4] = *(void *)(a1 + 40);
          id v17 = [v61 resultNonnullWithBlock:v70];
          v18 = v6[2](v6);
          [v18 setObject:v17 forKeyedSubscript:@"usageMaps"];

          v69[0] = MEMORY[0x1E4F143A8];
          v69[1] = 3221225472;
          v69[2] = __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_3;
          v69[3] = &unk_1E65BB858;
          v69[4] = *(void *)(a1 + 40);
          id v19 = [v60 resultNonnullWithBlock:v69];
          v20 = v6[2](v6);
          [v20 setObject:v19 forKeyedSubscript:@"usageCalendar"];

          uint64_t v10 = 7;
          goto LABEL_28;
        }
        id v21 = [*(id *)(a1 + 40) descriptionForSGRTCCategory:8];
        int v22 = [v7 isEqualToString:v21];

        if (v22)
        {
          uint64_t v10 = 8;
        }
        else
        {
          v23 = [*(id *)(a1 + 40) descriptionForSGRTCCategory:9];
          char v24 = [v7 isEqualToString:v23];

          if (v24)
          {
            uint64_t v10 = 9;
          }
          else
          {
            v25 = [*(id *)(a1 + 40) descriptionForSGRTCCategory:10];
            int v26 = [v7 isEqualToString:v25];

            long long v27 = *(void **)(a1 + 40);
            if (v26)
            {
              id v28 = v6[2](v6);
              [v27 enrichReminderInteractionSummaryLog:v28];
              uint64_t v10 = 10;
            }
            else
            {
              char v29 = [*(id *)(a1 + 40) descriptionForSGRTCCategory:11];
              int v30 = [v7 isEqualToString:v29];

              if (!v30)
              {
                uint64_t v10 = 0xFFFFLL;
                goto LABEL_28;
              }
              v31 = *(void **)(a1 + 40);
              id v28 = v6[2](v6);
              [v31 enrichAggregateSummaryLog:v28];
              uint64_t v10 = 11;
            }
          }
        }
        __int16 v32 = +[SGAsset localeAsset];
        uint64_t v33 = [v32 assetVersion];
        v34 = &unk_1F2535970;
        if (v33 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v35 = NSNumber;
          v59 = +[SGAsset localeAsset];
          v58 = objc_msgSend(v35, "numberWithUnsignedInteger:", objc_msgSend(v59, "assetVersion"));
          v34 = v58;
        }
        v36 = v6[2](v6);
        [v36 setObject:v34 forKeyedSubscript:@"localeAssetVersion"];

        if (v33 != 0x7FFFFFFFFFFFFFFFLL)
        {
        }
LABEL_28:
        v37 = objc_msgSend(*(id *)(a1 + 40), "allowlistedLogFromLog:", *((void *)v73 + 5), v56);
        v38 = *(void **)(a1 + 48);
        id v68 = 0;
        char v39 = [v38 sendMessageWithCategory:v10 type:0 payload:v37 error:&v68];
        id v40 = v68;
        if ((v39 & 1) == 0)
        {
          v41 = sgLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = v56;
            *(void *)((char *)&buf + 4) = v40;
            _os_log_error_impl(&dword_1CA650000, v41, OS_LOG_TYPE_ERROR, "RTCLogging: Unable to send logs: %@", (uint8_t *)&buf, 0xCu);
          }
LABEL_38:

LABEL_39:
          id v47 = v40;
          goto LABEL_40;
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
        if (v63)
        {
          char v63 = 1;
          goto LABEL_39;
        }
        v82 = @"storeAge";
        v42 = NSNumber;
        v43 = *(void **)(a1 + 48);
        [*(id *)(a1 + 40) storeAge];
        v44 = objc_msgSend(v42, "numberWithDouble:");
        v83 = v44;
        v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v83 forKeys:&v82 count:1];
        id v67 = v40;
        char v46 = [v43 sendMessageWithCategory:2 type:0 payload:v45 error:&v67];
        id v47 = v67;

        if ((v46 & 1) == 0)
        {
          v41 = sgLogHandle();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            LODWORD(buf) = v56;
            *(void *)((char *)&buf + 4) = v47;
            _os_log_error_impl(&dword_1CA650000, v41, OS_LOG_TYPE_ERROR, "RTCLogging: Unable to send logs for storeAge: %@", (uint8_t *)&buf, 0xCu);
          }
          char v63 = 1;
          id v40 = v47;
          goto LABEL_38;
        }
        char v63 = 1;
LABEL_40:

        _Block_object_dispose(v72, 8);
        if (v65 == ++v4)
        {
          uint64_t v48 = [obj countByEnumeratingWithState:&v78 objects:v89 count:16];
          uint64_t v65 = v48;
          if (v48) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
    {
      v49 = (void *)MEMORY[0x1CB79B230]();
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(a1 + 48) flushMessages];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
      {
        [*(id *)(a1 + 40) resetExtractionLogs];
        [*(id *)(a1 + 40) resetInteractionsLogs];
        v50 = *(void **)(a1 + 40);
        v51 = objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", *(void *)(a1 + 88), *(void *)(a1 + 96));
        [v50 removeInteractionsSummaryLogsFromLogs:v51];
      }
      else
      {
        v51 = sgLogHandle();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v72 = 0;
          _os_log_error_impl(&dword_1CA650000, v51, OS_LOG_TYPE_ERROR, "RTCLogging: Unable to flush logs", v72, 2u);
        }
      }

      uint64_t v55 = *(void *)(a1 + 56);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)) {
        BOOL v54 = *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != 0;
      }
      else {
        BOOL v54 = 0;
      }
    }
    else
    {
      BOOL v54 = 0;
      uint64_t v55 = *(void *)(a1 + 56);
    }
    (*(void (**)(uint64_t, BOOL, void))(v55 + 16))(v55, v54, 0);
LABEL_60:
  }
  else
  {
    v53 = sgLogHandle();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v72 = 0;
      _os_log_impl(&dword_1CA650000, v53, OS_LOG_TYPE_DEFAULT, "RTCLogging: No RTC backends found, no logs will be sent at this time.", v72, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

id __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_278(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v2)
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) mutableCopy];
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
    v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  return v2;
}

uint64_t __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mapsUsageLast2Weeks];
}

uint64_t __62__SGRTCLogging_sendRTCLogsWithShouldContinueBlock_completion___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _calendarUsageLast2Weeks];
}

- (void)sendRTCLogsWithCompletion:(id)a3
{
}

uint64_t __42__SGRTCLogging_sendRTCLogsWithCompletion___block_invoke()
{
  return 1;
}

- (id)_createRTCReporting
{
  v21[4] = *MEMORY[0x1E4F143B8];
  v2 = [NSNumber numberWithInt:CFAbsoluteTimeGetCurrent()];
  uint64_t v3 = +[SGAsset asset];
  uint64_t v4 = [v3 assetVersion];

  uint64_t v5 = *MEMORY[0x1E4F94658];
  v21[0] = &unk_1F2535958;
  uint64_t v6 = *MEMORY[0x1E4F94660];
  v20[0] = v5;
  v20[1] = v6;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v4;
  }
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:v7];
  uint64_t v9 = *MEMORY[0x1E4F94680];
  v21[1] = v8;
  v21[2] = v2;
  uint64_t v10 = *MEMORY[0x1E4F94648];
  v20[2] = v9;
  v20[3] = v10;
  v21[3] = MEMORY[0x1E4F1CC38];
  long long v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];

  uint64_t v12 = *MEMORY[0x1E4F94690];
  v18[0] = *MEMORY[0x1E4F94688];
  v18[1] = v12;
  uint64_t v13 = *MEMORY[0x1E4F5DEE0];
  v19[0] = @"Suggestions";
  v19[1] = v13;
  int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  id v15 = objc_alloc(MEMORY[0x1E4F94620]);
  id v16 = (void *)[v15 initWithSessionInfo:v11 userInfo:v14 frameworksToCheck:MEMORY[0x1E4F1CBF0]];

  return v16;
}

- (id)logsToSendWithInteractionSummaryRange:(_NSRange *)a3
{
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__13825;
  v18 = __Block_byref_object_dispose__13826;
  id v19 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = (_NSRange *)&v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  long long v11 = "";
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__SGRTCLogging_logsToSendWithInteractionSummaryRange___block_invoke;
  v7[3] = &unk_1E65B7E18;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  [(_PASLock *)lock runWithLockAcquired:v7];
  if (a3) {
    *a3 = v9[2];
  }
  id v5 = (id)v15[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v14, 8);

  return v5;
}

void __54__SGRTCLogging_logsToSendWithInteractionSummaryRange___block_invoke(uint64_t a1, void *a2)
{
  char v24 = a2;
  uint64_t v3 = [v24[1] mutableCopy];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (v24[2]) {
    id v6 = v24[2];
  }
  else {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v7 = (void *)MEMORY[0x1CB79B230]([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v6]);
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v9 = [*(id *)(a1 + 32) descriptionForSGRTCCategory:7];
  uint64_t v10 = [*(id *)(a1 + 32) descriptionForSGRTCCategory:10];
  long long v11 = [*(id *)(a1 + 32) descriptionForSGRTCCategory:11];
  uint64_t v12 = objc_msgSend(v8, "initWithObjects:", v9, v10, v11, 0);

  uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count];
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  *(void *)(v14 + 32) = v13;
  *(void *)(v14 + 40) = 0;
  if ([v24[3] count])
  {
    unint64_t v15 = 0;
    do
    {
      uint64_t v16 = [v24[3] objectAtIndexedSubscript:v15];
      id v17 = [v16 objectForKeyedSubscript:@"categoryLog"];

      if ([v12 containsObject:v17])
      {
        v18 = objc_opt_new();
        id v19 = [v24[3] objectAtIndexedSubscript:v15];
        v20 = [v19 objectForKeyedSubscript:@"expirationDate"];
        uint64_t v21 = [v18 compare:v20];

        if (v21 == 1)
        {
          int v22 = [v24[3] objectAtIndexedSubscript:v15];
          v23 = +[SGRTCLogging _deepCopy:v22];

          if (v23)
          {
            [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v23];
            ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
          }
        }
      }

      ++v15;
    }
    while (v15 < [v24[3] count]);
  }
}

- (id)logsToSend
{
  return [(SGRTCLogging *)self logsToSendWithInteractionSummaryRange:0];
}

- (id)allowlistedLogFromLog:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)[v3 mutableCopy];
  [v4 setObject:0 forKeyedSubscript:@"eventKey"];
  [v4 setObject:0 forKeyedSubscript:@"eventDuplicateKey"];
  [v4 setObject:0 forKeyedSubscript:@"expirationDate"];
  [v4 setObject:0 forKeyedSubscript:@"creationDate"];
  uint64_t v5 = [v4 count];
  if (v5 == [v3 count]) {
    id v6 = v3;
  }
  else {
    id v6 = v4;
  }
  id v7 = v6;

  return v7;
}

- (void)logAggregateSummaryForInteraction:(id)a3
{
  id v7 = a3;
  if (!-[SGRTCLogging incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:](self, "incrementAndUpgradeInteractionSummaryForEventKey:interactionKey:parentEntity:", @"aggregateSummary"))
  {
    uint64_t v4 = [(id)objc_opt_class() dateByAppendingDaysToCurrentDate:28.0];
    uint64_t v5 = objc_opt_new();
    id v6 = [(SGRTCLogging *)self createInteractionSummaryForEventKey:@"aggregateSummary" expirationDate:v4 interactionKey:v7 interactionAttributes:v5 rtcCategory:11];

    [(SGRTCLogging *)self logNewInteractionSummaryWithDictionary:v6];
  }
}

- (void)logEventInteractionForRealtimeEvent:(id)a3 parentEntity:(id)a4 interface:(unsigned __int16)a5 actionType:(unsigned __int16)a6
{
  id v10 = a3;
  id v11 = a4;
  interactionsWriteQueue = self->_interactionsWriteQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __86__SGRTCLogging_logEventInteractionForRealtimeEvent_parentEntity_interface_actionType___block_invoke;
  v15[3] = &unk_1E65BFCD0;
  v15[4] = self;
  id v16 = v10;
  id v17 = v11;
  unsigned __int16 v18 = a5;
  unsigned __int16 v19 = a6;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(interactionsWriteQueue, v15);
}

uint64_t __86__SGRTCLogging_logEventInteractionForRealtimeEvent_parentEntity_interface_actionType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventInteractionForRealtimeEventSync:*(void *)(a1 + 40) parentEntity:*(void *)(a1 + 48) interface:*(unsigned __int16 *)(a1 + 56) actionType:*(unsigned __int16 *)(a1 + 58)];
}

- (void)logEventInteractionForRealtimeEventSync:(id)a3 parentEntity:(id)a4 interface:(unsigned __int16)a5 actionType:(unsigned __int16)a6
{
  uint64_t v6 = a6;
  uint64_t v7 = a5;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = [(SGRTCLogging *)self _interactionAttributesForRealtimeEvent:v10 parentEntity:v11];
  id v13 = [NSString alloc];
  id v14 = [(SGRTCLogging *)self _descriptionForInterface:v7];
  unint64_t v15 = [(SGRTCLogging *)self _descriptionForActionType:v6];
  id v16 = (void *)[v13 initWithFormat:@"%@_%@", v14, v15];

  id v17 = [v10 event];
  unsigned __int16 v18 = [v17 opaqueKey];

  unsigned __int16 v19 = sgLogHandle();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412546;
    int v26 = v16;
    __int16 v27 = 2112;
    id v28 = v18;
    _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, "RTCLogging: logging interaction to RTC for interactionKey: %@, eventKey: %@", buf, 0x16u);
  }

  BOOL v20 = [(SGRTCLogging *)self incrementAndUpgradeInteractionSummaryForEventKey:v18 interactionKey:v16 parentEntity:v11];
  uint64_t v21 = +[SGRTCLogging locationTypeForRealtimeEvent:v10];
  [(SGRTCLogging *)self _updateLocationTypeFromInteractionsSummaryForEventKey:v18 locationType:v21];

  if (!v20)
  {
    int v22 = [v10 event];
    v23 = [v22 end];
    char v24 = [(SGRTCLogging *)self createInteractionSummaryForEventKey:v18 expirationDate:v23 interactionKey:v16 interactionAttributes:v12 rtcCategory:7];

    [(SGRTCLogging *)self logNewInteractionSummaryWithDictionary:v24];
  }
}

- (void)logMLMessageEventExtractionForEntitySync:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8
    && ([v8 duplicateKey], id v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    id v11 = +[SGSqlEntityStore defaultStore];
    uint64_t v12 = [v9 duplicateKey];
    id v13 = [v12 parentKey];
    id v14 = [v11 loadEntityByKey:v13];

    unint64_t v15 = [(SGRTCLogging *)self _interactionAttributesForEntity:v9 parentEntity:v14];
    uint64_t v29 = [(SGRTCLogging *)self interactionKeyForInterface:v6 actionType:v5];
    id v16 = [v9 duplicateKey];
    id v17 = [v16 entityKey];
    unsigned __int16 v18 = [v17 serialize];

    unsigned __int16 v19 = sgLogHandle();
    BOOL v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412546;
        v31 = v29;
        __int16 v32 = 2112;
        uint64_t v33 = v18;
        _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "RTCLogging: logging interaction to RTC for interactionKey: %@, eventKey: %@", buf, 0x16u);
      }

      BOOL v21 = [(SGRTCLogging *)self incrementAndUpgradeInteractionSummaryForEventKey:v18 interactionKey:v29 parentEntity:v14];
      int v22 = +[SGRTCLogging locationTypeForEntity:v9];
      [(SGRTCLogging *)self _updateLocationTypeFromInteractionsSummaryForEventKey:v18 locationType:v22];

      if (!v21)
      {
        v23 = [(SGRTCLogging *)self assetVersionsForMLMessageEvent];
        [v15 addEntriesFromDictionary:v23];

        char v24 = [v9 timeRange];
        v25 = [v24 endDate];
        [(SGRTCLogging *)self createInteractionSummaryForEventKey:v18 expirationDate:v25 interactionKey:v29 interactionAttributes:v15 rtcCategory:7];
        id v28 = v14;
        v27 = int v26 = v15;

        [(SGRTCLogging *)self logNewInteractionSummaryWithDictionary:v27];
        unint64_t v15 = v26;
        id v14 = v28;
      }
      BOOL v20 = -[SGRTCLogging interactionKeyForCategory:interface:actionType:](self, "interactionKeyForCategory:interface:actionType:", 6, v6, v5, v28);
      [(SGRTCLogging *)self logAggregateSummaryForInteraction:v20];
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v20, OS_LOG_TYPE_ERROR, "RTCLogging: entity.duplicateKey.entityKey serialization failed", buf, 2u);
    }
  }
  else
  {
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "RTCLogging: entity can't be found", buf, 2u);
    }
  }
}

- (void)logEventInteractionForEntitySync:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = v8;
  if (v8
    && ([v8 duplicateKey], id v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    id v11 = +[SGSqlEntityStore defaultStore];
    uint64_t v12 = [v9 duplicateKey];
    id v13 = [v12 parentKey];
    id v14 = [v11 loadEntityByKey:v13];

    unint64_t v15 = [(SGRTCLogging *)self _interactionAttributesForEntity:v9 parentEntity:v14];
    uint64_t v29 = [(SGRTCLogging *)self interactionKeyForInterface:v6 actionType:v5];
    id v16 = [v9 duplicateKey];
    id v17 = [v16 entityKey];
    unsigned __int16 v18 = [v17 serialize];

    unsigned __int16 v19 = sgLogHandle();
    BOOL v20 = v19;
    if (v18)
    {
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412546;
        v31 = v29;
        __int16 v32 = 2112;
        uint64_t v33 = v18;
        _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "RTCLogging: logging interaction to RTC for interactionKey: %@, eventKey: %@", buf, 0x16u);
      }

      BOOL v21 = [(SGRTCLogging *)self incrementAndUpgradeInteractionSummaryForEventKey:v18 interactionKey:v29 parentEntity:v14];
      int v22 = +[SGRTCLogging locationTypeForEntity:v9];
      [(SGRTCLogging *)self _updateLocationTypeFromInteractionsSummaryForEventKey:v18 locationType:v22];

      if (!v21)
      {
        v23 = [(SGRTCLogging *)self trialIdsForStructuredEvent];
        [v15 addEntriesFromDictionary:v23];

        char v24 = [v9 timeRange];
        v25 = [v24 endDate];
        [(SGRTCLogging *)self createInteractionSummaryForEventKey:v18 expirationDate:v25 interactionKey:v29 interactionAttributes:v15 rtcCategory:7];
        id v28 = v14;
        v27 = int v26 = v15;

        [(SGRTCLogging *)self logNewInteractionSummaryWithDictionary:v27];
        unint64_t v15 = v26;
        id v14 = v28;
      }
      BOOL v20 = -[SGRTCLogging interactionKeyForCategory:interface:actionType:](self, "interactionKeyForCategory:interface:actionType:", 6, v6, v5, v28);
      [(SGRTCLogging *)self logAggregateSummaryForInteraction:v20];
    }
    else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v20, OS_LOG_TYPE_ERROR, "RTCLogging: entity.duplicateKey.entityKey serialization failed", buf, 2u);
    }
  }
  else
  {
    id v11 = sgLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1CA650000, v11, OS_LOG_TYPE_ERROR, "RTCLogging: entity can't be found", buf, 2u);
    }
  }
}

- (id)interactionKeyForCategory:(unsigned __int16)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  id v9 = [NSString alloc];
  id v10 = [(SGRTCLogging *)self descriptionForSGRTCCategory:v7];
  id v11 = [(SGRTCLogging *)self interactionKeyForInterface:v6 actionType:v5];
  uint64_t v12 = (void *)[v9 initWithFormat:@"%@_%@", v10, v11];

  return v12;
}

- (id)interactionKeyForInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  uint64_t v5 = a3;
  id v7 = [NSString alloc];
  id v8 = [(SGRTCLogging *)self _descriptionForInterface:v5];
  id v9 = [(SGRTCLogging *)self _descriptionForActionType:v4];
  id v10 = (void *)[v7 initWithFormat:@"%@_%@", v8, v9];

  return v10;
}

- (void)logMLMessageEventInteractionForEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  id v8 = a3;
  interactionsWriteQueue = self->_interactionsWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__SGRTCLogging_logMLMessageEventInteractionForEntity_interface_actionType___block_invoke;
  block[3] = &unk_1E65B7DF0;
  block[4] = self;
  id v12 = v8;
  unsigned __int16 v13 = a4;
  unsigned __int16 v14 = a5;
  id v10 = v8;
  dispatch_async(interactionsWriteQueue, block);
}

uint64_t __75__SGRTCLogging_logMLMessageEventInteractionForEntity_interface_actionType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logMLMessageEventExtractionForEntitySync:*(void *)(a1 + 40) interface:*(unsigned __int16 *)(a1 + 48) actionType:*(unsigned __int16 *)(a1 + 50)];
}

- (void)logEventInteractionForEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  id v8 = a3;
  interactionsWriteQueue = self->_interactionsWriteQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__SGRTCLogging_logEventInteractionForEntity_interface_actionType___block_invoke;
  block[3] = &unk_1E65B7DF0;
  block[4] = self;
  id v12 = v8;
  unsigned __int16 v13 = a4;
  unsigned __int16 v14 = a5;
  id v10 = v8;
  dispatch_async(interactionsWriteQueue, block);
}

uint64_t __66__SGRTCLogging_logEventInteractionForEntity_interface_actionType___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) logEventInteractionForEntitySync:*(void *)(a1 + 40) interface:*(unsigned __int16 *)(a1 + 48) actionType:*(unsigned __int16 *)(a1 + 50)];
}

- (void)logMLMessageEventExtractionForTemplateName:(id)a3 extractionStatus:(unsigned __int16)a4 outputInfo:(id)a5 outputExceptions:(id)a6 timingProcessing:(unint64_t)a7
{
  uint64_t v10 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  unint64_t v15 = sgLogHandle();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v25 = [(SGRTCLogging *)self _descriptionForMessageEventDissectorExtractionStatus:v10];
    *(_DWORD *)long long buf = 138412802;
    uint64_t v29 = v25;
    __int16 v30 = 2112;
    id v31 = v12;
    __int16 v32 = 2048;
    unint64_t v33 = a7;
    _os_log_debug_impl(&dword_1CA650000, v15, OS_LOG_TYPE_DEBUG, "RTCLogging: log extraction from Message Event Dissector (%@) to RTC for templateName: %@ timingProcessing: %llu", buf, 0x20u);
  }
  id v16 = objc_opt_new();
  id v17 = v16;
  if (v13) {
    [v16 addEntriesFromDictionary:v13];
  }
  unsigned __int16 v18 = [(SGRTCLogging *)self descriptionForSGRTCCategory:5, @"categoryLog"];
  v27[0] = v18;
  v26[1] = @"extractionStatus";
  unsigned __int16 v19 = [(SGRTCLogging *)self _descriptionForMessageEventDissectorExtractionStatus:v10];
  v27[1] = v19;
  v27[2] = v12;
  v26[2] = @"templateName";
  v26[3] = @"outputExceptions";
  objc_msgSend(v14, "_pas_componentsJoinedByString:", @",");
  BOOL v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

  BOOL v21 = &stru_1F24EEF20;
  if (v20) {
    BOOL v21 = v20;
  }
  v27[3] = v21;
  v26[4] = @"timingProcessing";
  int v22 = [NSNumber numberWithUnsignedLongLong:a7];
  v27[4] = v22;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:5];
  [v17 addEntriesFromDictionary:v23];

  char v24 = [(SGRTCLogging *)self assetVersionsForMLMessageEvent];
  [v17 addEntriesFromDictionary:v24];

  [(SGRTCLogging *)self logAndIncrementEventCountForDictionary:v17];
}

- (void)logEventExtractionForTemplateName:(id)a3 extractionStatus:(unsigned __int16)a4 outputExceptions:(id)a5 outputInfos:(id)a6 jsMessageLogs:(id)a7 jsOutputLogs:(id)a8 timingProcessing:(unint64_t)a9
{
  uint64_t v13 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  BOOL v20 = sgLogHandle();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    char v24 = [(SGRTCLogging *)self _descriptionForExtractionStatus:v13];
    *(_DWORD *)long long buf = 138412802;
    int v26 = v24;
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2048;
    unint64_t v30 = a9;
    _os_log_debug_impl(&dword_1CA650000, v20, OS_LOG_TYPE_DEBUG, "RTCLogging: log extraction (%@) to RTC for templateName: %@ timingProcessing: %llu", buf, 0x20u);
  }
  BOOL v21 = [(SGRTCLogging *)self _eventExtractionDictionaryLogForTemplateName:v15 extractionStatus:v13 outputExceptions:v19 outputInfos:v18 jsMessageLogs:v17 jsOutputLogs:v16 timingProcessing:a9];

  int v22 = (void *)[v21 mutableCopy];
  v23 = [(SGRTCLogging *)self trialIdsForStructuredEvent];
  [v22 addEntriesFromDictionary:v23];

  [(SGRTCLogging *)self logAndIncrementEventCountForDictionary:v22];
}

- (id)_eventExtractionDictionaryLogForTemplateName:(id)a3 extractionStatus:(unsigned __int16)a4 outputExceptions:(id)a5 outputInfos:(id)a6 jsMessageLogs:(id)a7 jsOutputLogs:(id)a8 timingProcessing:(unint64_t)a9
{
  uint64_t v12 = a4;
  v36[6] = *MEMORY[0x1E4F143B8];
  id v15 = a7;
  id v16 = a8;
  id v17 = a6;
  id v18 = a5;
  id v19 = (__CFString *)a3;
  BOOL v20 = objc_opt_new();
  BOOL v21 = v20;
  if (v15) {
    [v20 addEntriesFromDictionary:v15];
  }
  uint64_t v34 = v15;
  if (v16) {
    [v21 addEntriesFromDictionary:v16];
  }
  v35[0] = @"categoryLog";
  int v22 = -[SGRTCLogging descriptionForSGRTCCategory:](self, "descriptionForSGRTCCategory:", 5, a9);
  v36[0] = v22;
  v35[1] = @"extractionStatus";
  uint64_t v23 = [(SGRTCLogging *)self _descriptionForExtractionStatus:v12];
  char v24 = (void *)v23;
  if (v19) {
    v25 = v19;
  }
  else {
    v25 = &stru_1F24EEF20;
  }
  v36[1] = v23;
  v36[2] = v25;
  v35[2] = @"templateName";
  v35[3] = @"timingProcessing";
  int v26 = [NSNumber numberWithUnsignedLongLong:v33];
  v36[3] = v26;
  v35[4] = @"outputExceptions";
  objc_msgSend(v18, "_pas_componentsJoinedByString:", @",");
  __int16 v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v27) {
    id v28 = v27;
  }
  else {
    id v28 = &stru_1F24EEF20;
  }
  v36[4] = v28;
  void v35[5] = @"outputInfos";
  objc_msgSend(v17, "_pas_componentsJoinedByString:", @",");
  __int16 v29 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v29) {
    unint64_t v30 = v29;
  }
  else {
    unint64_t v30 = &stru_1F24EEF20;
  }
  v36[5] = v30;
  uint64_t v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:6];

  [v21 addEntriesFromDictionary:v31];
  return v21;
}

- (void)logNewInteractionWithDictionary:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v11 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "RTCLogging: log new interaction: %@", buf, 0xCu);
  }

  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__SGRTCLogging_logNewInteractionWithDictionary___block_invoke;
  v8[3] = &unk_1E65B7D30;
  id v9 = v4;
  id v7 = v4;
  [(_PASLock *)lock runWithLockAcquired:v8];
  [(SGRTCLogging *)self updateAndScheduleDiskWrite];
}

void __48__SGRTCLogging_logNewInteractionWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a2 + 16);
  id v3 = (id)[*(id *)(a1 + 32) copy];
  [v2 addObject:v3];
}

- (void)logNewInteractionSummaryWithDictionary:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v11 = v4;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "RTCLogging: log new interaction summary: %@", buf, 0xCu);
  }

  lock = self->_lock;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__SGRTCLogging_logNewInteractionSummaryWithDictionary___block_invoke;
  v8[3] = &unk_1E65B7D30;
  id v9 = v4;
  id v7 = v4;
  [(_PASLock *)lock runWithLockAcquired:v8];
  [(SGRTCLogging *)self updateAndScheduleDiskWrite];
}

uint64_t __55__SGRTCLogging_logNewInteractionSummaryWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 24) addObject:*(void *)(a1 + 32)];
}

- (void)logAndIncrementEventCountForDictionary:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__SGRTCLogging_logAndIncrementEventCountForDictionary___block_invoke;
  v7[3] = &unk_1E65B7D30;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
  [(SGRTCLogging *)self updateAndScheduleDiskWrite];
}

void __55__SGRTCLogging_logAndIncrementEventCountForDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9[1] count])
  {
    uint64_t v3 = 0;
    while (1)
    {
      id v4 = [v9[1] objectAtIndexedSubscript:v3];
      uint64_t v5 = [v4 objectForKeyedSubscript:@"eventsCount"];
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:@"eventsCount"];
      if ([v4 isEqual:*(void *)(a1 + 32)]) {
        break;
      }

      if (++v3 >= (unint64_t)[v9[1] count]) {
        goto LABEL_5;
      }
    }
    id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "unsignedIntegerValue") + 1);
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:@"eventsCount"];

    id v8 = (void *)[*(id *)(a1 + 32) copy];
    [v9[1] setObject:v8 atIndexedSubscript:v3];
  }
  else
  {
LABEL_5:
    [*(id *)(a1 + 32) setObject:&unk_1F2535940 forKeyedSubscript:@"eventsCount"];
    id v6 = v9[1];
    id v4 = (void *)[*(id *)(a1 + 32) copy];
    [v6 addObject:v4];
  }
}

- (void)_updateLocationTypeFromInteractionsSummaryForEventKey:(id)a3 locationType:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __83__SGRTCLogging__updateLocationTypeFromInteractionsSummaryForEventKey_locationType___block_invoke;
  v11[3] = &unk_1E65B7DC8;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  id v14 = &v15;
  [(_PASLock *)lock runWithLockAcquired:v11];
  if (*((unsigned char *)v16 + 24)) {
    [(SGRTCLogging *)self updateAndScheduleDiskWrite];
  }

  _Block_object_dispose(&v15, 8);
}

void __83__SGRTCLogging__updateLocationTypeFromInteractionsSummaryForEventKey_locationType___block_invoke(void *a1, void *a2)
{
  id v12 = a2;
  if ([v12[3] count])
  {
    uint64_t v3 = 0;
    while (1)
    {
      id v4 = [v12[3] objectAtIndexedSubscript:v3];
      uint64_t v5 = [v4 objectForKeyedSubscript:@"eventKey"];
      int v6 = [v5 isEqual:a1[4]];

      if (v6)
      {
        id v7 = [v12[3] objectAtIndexedSubscript:v3];
        id v8 = [v7 objectForKeyedSubscript:@"locationType"];
        char v9 = [v8 isEqual:a1[5]];

        if ((v9 & 1) == 0) {
          break;
        }
      }
      if (++v3 >= (unint64_t)[v12[3] count]) {
        goto LABEL_8;
      }
    }
    uint64_t v10 = a1[5];
    id v11 = [v12[3] objectAtIndexedSubscript:v3];
    [v11 setObject:v10 forKeyedSubscript:@"locationType"];

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
LABEL_8:
}

- (BOOL)incrementAndUpgradeInteractionSummaryForEventKey:(id)a3 interactionKey:(id)a4 parentEntity:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sgLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412546;
    *(void *)&uint8_t buf[4] = v9;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v8;
    _os_log_debug_impl(&dword_1CA650000, v11, OS_LOG_TYPE_DEBUG, "RTCLogging: log and increment interaction key: %@, for eventKey: %@", buf, 0x16u);
  }

  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v27 = 0;
  lock = self->_lock;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __93__SGRTCLogging_incrementAndUpgradeInteractionSummaryForEventKey_interactionKey_parentEntity___block_invoke;
  v20[3] = &unk_1E65B7DA0;
  id v13 = v8;
  id v21 = v13;
  id v14 = v9;
  id v22 = v14;
  id v15 = v10;
  id v23 = v15;
  char v24 = self;
  v25 = buf;
  [(_PASLock *)lock runWithLockAcquired:v20];
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    [(SGRTCLogging *)self updateAndScheduleDiskWrite];
  }
  else
  {
    id v16 = sgLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v19 = 0;
      _os_log_debug_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEBUG, "RTCLogging: can't find eventKey in loggedInteractionsSummary dictionary", v19, 2u);
    }
  }
  BOOL v17 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v17;
}

uint64_t __93__SGRTCLogging_incrementAndUpgradeInteractionSummaryForEventKey_interactionKey_parentEntity___block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  uint64_t v3 = [v22[3] count];
  id v4 = v22;
  if (v3)
  {
    unint64_t v5 = 0;
    while (1)
    {
      int v6 = [v4[3] objectAtIndexedSubscript:v5];
      id v7 = [v6 objectForKeyedSubscript:@"eventKey"];
      int v8 = [v7 isEqual:*(void *)(a1 + 32)];

      if (v8) {
        break;
      }
      ++v5;
      unint64_t v9 = [v22[3] count];
      id v4 = v22;
      if (v5 >= v9) {
        goto LABEL_10;
      }
    }
    id v10 = [v22[3] objectAtIndexedSubscript:v5];
    id v11 = [v10 objectForKeyedSubscript:*(void *)(a1 + 40)];

    id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v11, "unsignedIntegerValue") + 1);
    id v13 = [v22[3] objectAtIndexedSubscript:v5];
    [v13 setObject:v12 forKeyedSubscript:*(void *)(a1 + 40)];

    if (*(void *)(a1 + 48))
    {
      id v14 = [v22[3] objectAtIndexedSubscript:v5];
      id v15 = [v14 objectForKeyedSubscript:@"documentType"];
      int v16 = [v15 isEqual:@"unknown"];

      if (v16)
      {
        BOOL v17 = *(void **)(a1 + 56);
        char v18 = [*(id *)(a1 + 48) duplicateKey];
        id v19 = objc_msgSend(v17, "descriptionForEntityType:", objc_msgSend(v18, "entityType"));
        BOOL v20 = [v22[3] objectAtIndexedSubscript:v5];
        [v20 setObject:v19 forKeyedSubscript:@"documentType"];
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }
LABEL_10:
  return MEMORY[0x1F41817F8]();
}

- (id)_calendarUsageLast2Weeks
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = 0;
  id v12 = (double *)&v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __40__SGRTCLogging__calendarUsageLast2Weeks__block_invoke;
  v10[3] = &unk_1E65B7D78;
  v10[4] = &v11;
  objc_msgSend(MEMORY[0x1E4F25550], "sg_usingSharedStoreForReadingOnly:", v10);
  double v2 = v12[3];
  if (v2 >= 1.0)
  {
    double v4 = 50.0;
    if (v2 < 50.0) {
      double v4 = round(v2 + v2) * 0.5;
    }
  }
  else
  {
    +[SGRTCLogging round:toSignificantFigures:](SGRTCLogging, "round:toSignificantFigures:", 1);
    double v4 = v3;
  }
  unint64_t v5 = sgLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    int v8 = [NSNumber numberWithDouble:v4];
    unint64_t v9 = [NSNumber numberWithDouble:v12[3]];
    *(_DWORD *)long long buf = 138412546;
    int v16 = v8;
    __int16 v17 = 2112;
    char v18 = v9;
    _os_log_debug_impl(&dword_1CA650000, v5, OS_LOG_TYPE_DEBUG, "RTCLogging: usageCalendar: %@, (%@ Calendar events found)", buf, 0x16u);
  }
  int v6 = [NSNumber numberWithDouble:v4];
  _Block_object_dispose(&v11, 8);
  return v6;
}

void __40__SGRTCLogging__calendarUsageLast2Weeks__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = (id)objc_opt_new();
  [v3 eventsPerWeekAroundDate:v6];
  uint64_t v5 = v4;

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
}

- (id)_mapsUsageLast2Weeks
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v2 = objc_opt_new();
  uint64_t v3 = *MEMORY[0x1E4F5DC30];
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [v4 dateByAddingTimeInterval:-1209600.0];
  unint64_t v6 = [v2 launchCountForBundleId:v3 afterDate:v5 limit:5];

  id v7 = @"low";
  if (v6 > 4) {
    id v7 = @"high";
  }
  if (v6 - 1 >= 4) {
    int v8 = v7;
  }
  else {
    int v8 = @"medium";
  }
  unint64_t v9 = sgLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = [NSNumber numberWithUnsignedInteger:v6];
    int v12 = 138412546;
    uint64_t v13 = v8;
    __int16 v14 = 2112;
    id v15 = v11;
    _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "RTCLogging: usageMaps: %@, (%@ Maps launch in past 2 weeks)", (uint8_t *)&v12, 0x16u);
  }
  return v8;
}

- (void)enrichInteractionSummaryLog:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"creationDate"];
  if (v4)
  {
    uint64_t v6 = *MEMORY[0x1E4F5DC30];
    v15[0] = *MEMORY[0x1E4F5DC38];
    uint64_t v5 = v15[0];
    v15[1] = v6;
    uint64_t v8 = *MEMORY[0x1E4F5DC28];
    uint64_t v16 = *MEMORY[0x1E4F5DC08];
    uint64_t v7 = v16;
    uint64_t v17 = v8;
    unint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:4];
    id v10 = [(id)objc_opt_class() launchCountsForApps:v9 afterDate:v4 lowerBucket:10 bucketSize:3 bucketLimit:50];
    uint64_t v11 = [v10 objectForKeyedSubscript:v6];
    [v3 setObject:v11 forKeyedSubscript:@"launchCountMaps"];

    int v12 = [v10 objectForKeyedSubscript:v7];
    [v3 setObject:v12 forKeyedSubscript:@"launchCountCalendar"];

    uint64_t v13 = [v10 objectForKeyedSubscript:v5];
    [v3 setObject:v13 forKeyedSubscript:@"launchCountMessages"];

    __int16 v14 = [v10 objectForKeyedSubscript:v8];
    [v3 setObject:v14 forKeyedSubscript:@"launchCountMail"];
  }
}

- (id)bucketizedRemindersCreatedAfterDate:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  unint64_t v7 = +[SGRemindersAdapter remindersCreatedBetweenStartDate:v6 endDate:v5];
  [v5 timeIntervalSinceDate:v6];
  double v9 = v8;

  if (v7)
  {
    double v10 = ceil((double)v7 / (v9 / 604800.0));
    if (v10 > 0.0 && v10 < 1.84467441e19)
    {
      unint64_t v7 = (unint64_t)v10;
      if ((unint64_t)v10 >= 0xB) {
        unint64_t v7 = [(id)objc_opt_class() bucketizeInteger:v7 withBucketSize:10 limit:50];
      }
    }
    else
    {
      unint64_t v7 = 0;
    }
  }
  int v12 = NSNumber;
  return (id)[v12 numberWithUnsignedInteger:v7];
}

- (id)cappedDeliveryEntityCountsCreatedBetweenStartDate:(id)a3 endDate:(id)a4 store:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  double v10 = objc_opt_new();
  __int16 v29 = v9;
  unint64_t v30 = v7;
  uint64_t v11 = [v9 entityKeyCountsForEntityType:24 startDate:v7 endDate:v8];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = [*(id *)(*((void *)&v35 + 1) + 8 * i) second];
        unint64_t v17 = [v16 unsignedIntegerValue];

        if (v17 >= 0xA) {
          uint64_t v18 = 10;
        }
        else {
          uint64_t v18 = v17;
        }
        uint64_t v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"SGDelivery_ctNumSame_%lu", v18);
        [v10 addObject:v19];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v13);
  }
  BOOL v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v10, "count"));
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = v10;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v32;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void *)(*((void *)&v31 + 1) + 8 * j);
        char v27 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v21, "countForObject:", v26));
        [v20 setObject:v27 forKeyedSubscript:v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v31 objects:v39 count:16];
    }
    while (v23);
  }

  return v20;
}

- (id)cappedDeliveryEntityCountsCreatedBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[SGSqlEntityStore defaultStore];
  id v9 = [(SGRTCLogging *)self cappedDeliveryEntityCountsCreatedBetweenStartDate:v7 endDate:v6 store:v8];

  return v9;
}

- (void)enrichAggregateSummaryLog:(id)a3
{
  void v35[5] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"creationDate"];
  if (v5)
  {
    uint64_t v6 = *MEMORY[0x1E4F5DC38];
    v34[0] = *MEMORY[0x1E4F5DC58];
    v34[1] = v6;
    v35[0] = @"launchCountReminders";
    v35[1] = @"launchCountMessages";
    uint64_t v7 = *MEMORY[0x1E4F5DC28];
    v34[2] = *MEMORY[0x1E4F5DC08];
    v34[3] = v7;
    v35[2] = @"launchCountCalendar";
    v35[3] = @"launchCountMail";
    void v34[4] = *MEMORY[0x1E4F5DC30];
    v35[4] = @"launchCountMaps";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:5];
    id v9 = objc_opt_class();
    double v10 = [v8 allKeys];
    uint64_t v11 = [v9 aggregateSummaryBucketizedLaunchCountsForApps:v10 afterDate:v5];

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend(v11, "objectForKeyedSubscript:", v17, (void)v29);
          uint64_t v19 = [v12 objectForKeyedSubscript:v17];
          [v4 setObject:v18 forKeyedSubscript:v19];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v14);
    }

    BOOL v20 = NSNumber;
    id v21 = objc_opt_class();
    uint64_t v22 = objc_opt_new();
    uint64_t v23 = objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "bucketizeIntegerForAggregateSummary:", +[SGRemindersAdapter remindersCreatedBetweenStartDate:endDate:](SGRemindersAdapter, "remindersCreatedBetweenStartDate:endDate:", v5, v22)));
    [v4 setObject:v23 forKeyedSubscript:@"remindersCountStats"];

    uint64_t v24 = [MEMORY[0x1E4F5DFA0] defaultLanguage];
    v25 = (void *)v24;
    if (v24) {
      uint64_t v26 = (__CFString *)v24;
    }
    else {
      uint64_t v26 = @"unknown";
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v26, @"deviceLanguage", (void)v29);

    char v27 = objc_opt_new();
    uint64_t v28 = [(SGRTCLogging *)self cappedDeliveryEntityCountsCreatedBetweenStartDate:v5 endDate:v27];

    [v4 addEntriesFromDictionary:v28];
  }
}

- (void)enrichReminderInteractionSummaryLog:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"creationDate"];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 dateByAddingTimeInterval:-1209600.0];
    id v8 = objc_opt_class();
    v14[0] = *MEMORY[0x1E4F5DC38];
    uint64_t v9 = v14[0];
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    uint64_t v11 = [v8 launchCountsForApps:v10 afterDate:v7 lowerBucket:1 bucketSize:10 bucketLimit:50];
    id v12 = [v11 objectForKeyedSubscript:v9];
    [v4 setObject:v12 forKeyedSubscript:@"launchCountMessages"];

    uint64_t v13 = [(SGRTCLogging *)self bucketizedRemindersCreatedAfterDate:v7 endDate:v6];
    [v4 setObject:v13 forKeyedSubscript:@"remindersCountStats"];
  }
}

- (id)createInteractionSummaryForEventKey:(id)a3 expirationDate:(id)a4 interactionKey:(id)a5 interactionAttributes:(id)a6 rtcCategory:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (!v13)
  {
    id v13 = [(id)objc_opt_class() dateByAppendingDaysToCurrentDate:7.0];
  }
  uint64_t v16 = objc_opt_new();
  int v17 = +[SGRTCLogging numberOfDaysBetweenDate:v16 andDate:v13];

  if (v17 >= 366)
  {
    uint64_t v18 = objc_opt_new();
    [v18 setYear:1];
    uint64_t v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    BOOL v20 = objc_opt_new();
    uint64_t v21 = [v19 dateByAddingComponents:v18 toDate:v20 options:0];

    id v13 = (id)v21;
  }
  uint64_t v22 = (void *)[v15 mutableCopy];
  uint64_t v23 = [(SGRTCLogging *)self descriptionForSGRTCCategory:v7];
  [v22 setObject:v23 forKeyedSubscript:@"categoryLog"];

  [v22 setObject:v13 forKeyedSubscript:@"expirationDate"];
  uint64_t v24 = objc_opt_new();
  [v22 setObject:v24 forKeyedSubscript:@"creationDate"];

  [v22 setObject:v12 forKeyedSubscript:@"eventKey"];
  [v22 setObject:&unk_1F2535940 forKeyedSubscript:v14];

  return v22;
}

- (id)_interactionAttributesForEntity:(id)a3 parentEntity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 tags];
  uint64_t v9 = [(SGRTCLogging *)self _interactionAttributesForTags:v8 parentEntity:v6];

  double v10 = +[SGRTCLogging locationTypeForEntity:v7];

  [v9 setObject:v10 forKeyedSubscript:@"locationType"];
  return v9;
}

- (id)_interactionAttributesForRealtimeEvent:(id)a3 parentEntity:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 event];
  uint64_t v9 = [v8 tags];
  double v10 = sgMap();

  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v10];
  id v12 = [(SGRTCLogging *)self _interactionAttributesForTags:v11 parentEntity:v6];

  id v13 = +[SGRTCLogging locationTypeForRealtimeEvent:v7];

  [v12 setObject:v13 forKeyedSubscript:@"locationType"];
  return v12;
}

uint64_t __68__SGRTCLogging__interactionAttributesForRealtimeEvent_parentEntity___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F5D9F0] resolveName:a2];
}

- (id)_interactionAttributesForTags:(id)a3 parentEntity:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v63 = a4;
  id v7 = [v63 duplicateKey];
  uint64_t v65 = self;
  id v67 = -[SGRTCLogging descriptionForEntityType:](self, "descriptionForEntityType:", [v7 entityType]);

  id v8 = [MEMORY[0x1E4F5D9F0] extractedFlight];
  char v9 = [v6 containsObject:v8];

  if (v9)
  {
    double v10 = @"flight";
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F5D9F0] extractedBus];
    char v12 = [v6 containsObject:v11];

    if (v12)
    {
      double v10 = @"bus";
    }
    else
    {
      id v13 = [MEMORY[0x1E4F5D9F0] extractedTrain];
      char v14 = [v6 containsObject:v13];

      if (v14)
      {
        double v10 = @"train";
      }
      else
      {
        id v15 = [MEMORY[0x1E4F5D9F0] extractedBoat];
        char v16 = [v6 containsObject:v15];

        if (v16)
        {
          double v10 = @"boat";
        }
        else
        {
          int v17 = [MEMORY[0x1E4F5D9F0] extractedHotel];
          char v18 = [v6 containsObject:v17];

          if (v18)
          {
            double v10 = @"hotel";
          }
          else
          {
            uint64_t v19 = [MEMORY[0x1E4F5D9F0] extractedCarRental];
            char v20 = [v6 containsObject:v19];

            if (v20)
            {
              double v10 = @"carRental";
            }
            else
            {
              uint64_t v21 = [MEMORY[0x1E4F5D9F0] extractedTicket];
              char v22 = [v6 containsObject:v21];

              if (v22)
              {
                double v10 = @"ticket";
              }
              else
              {
                uint64_t v23 = [MEMORY[0x1E4F5D9F0] extractedMovie];
                char v24 = [v6 containsObject:v23];

                if (v24)
                {
                  double v10 = @"movie";
                }
                else
                {
                  v25 = [MEMORY[0x1E4F5D9F0] extractedFood];
                  char v26 = [v6 containsObject:v25];

                  if (v26)
                  {
                    double v10 = @"food";
                  }
                  else
                  {
                    char v27 = [MEMORY[0x1E4F5D9F0] extractedSocial];
                    char v28 = [v6 containsObject:v27];

                    if (v28)
                    {
                      double v10 = @"social";
                    }
                    else
                    {
                      long long v29 = [MEMORY[0x1E4F5D9F0] extractedAppointment];
                      int v30 = [v6 containsObject:v29];

                      double v10 = @"unknown";
                      if (v30) {
                        double v10 = @"appointment";
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v62 = v10;
  long long v31 = [MEMORY[0x1E4F5D9F0] allDay];
  unsigned int v61 = [v6 containsObject:v31];

  long long v32 = [MEMORY[0x1E4F5D9F0] extractedEventCancellation];
  unsigned int v60 = [v6 containsObject:v32];

  long long v33 = [MEMORY[0x1E4F5D9F0] fromSync];
  HIDWORD(v59) = [v6 containsObject:v33];

  LODWORD(v59) = [MEMORY[0x1E4F5DAF0] allowGeocode];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id obj = v6;
  uint64_t v34 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    char v36 = 0;
    uint64_t v37 = *(void *)v69;
    uint64_t v64 = *MEMORY[0x1E4F5DEC8];
    long long v38 = @"unknown";
    char v39 = @"unknown";
    id v40 = @"unknown";
    do
    {
      for (uint64_t i = 0; i != v35; ++i)
      {
        if (*(void *)v69 != v37) {
          objc_enumerationMutation(obj);
        }
        v42 = *(void **)(*((void *)&v68 + 1) + 8 * i);
        if (objc_msgSend(v42, "isTemplateName", v59))
        {
          uint64_t v43 = [v42 value];

          long long v38 = (__CFString *)v43;
        }
        if ([v42 isDomain])
        {
          uint64_t v44 = [v42 value];

          char v39 = (__CFString *)v44;
        }
        if ([v42 isEventMetadata])
        {
          v45 = [v42 eventMetadata];
          char v46 = v45;
          if (v45)
          {
            uint64_t v47 = [v45 objectForKeyedSubscript:v64];

            uint64_t v48 = [(SGRTCLogging *)v65 _descriptionForBundleId:v47];

            id v67 = (void *)v48;
            id v40 = (__CFString *)v47;
          }
        }
        v49 = [MEMORY[0x1E4F5D9F0] fromInteraction];
        char v50 = [v42 isEqualToEntityTag:v49];

        v36 |= v50;
      }
      uint64_t v35 = [obj countByEnumeratingWithState:&v68 objects:v74 count:16];
    }
    while (v35);
  }
  else
  {
    char v36 = 0;
    long long v38 = @"unknown";
    char v39 = @"unknown";
    id v40 = @"unknown";
  }

  v72[0] = @"eventCategory";
  v72[1] = @"documentType";
  v73[0] = v62;
  v73[1] = v67;
  v72[2] = @"templateName";
  v72[3] = @"domain";
  v73[2] = v38;
  v73[3] = v39;
  v72[4] = @"isAllDay";
  v51 = [NSNumber numberWithBool:v61];
  v73[4] = v51;
  v72[5] = @"isCancelled";
  v52 = [NSNumber numberWithBool:v60];
  v73[5] = v52;
  v72[6] = @"isFromSync";
  v53 = [NSNumber numberWithBool:HIDWORD(v59)];
  v73[6] = v53;
  v72[7] = @"isSplashScreenAcknowledged";
  BOOL v54 = [NSNumber numberWithBool:v59];
  v73[7] = v54;
  uint64_t v55 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:v72 count:8];
  long long v56 = (void *)[v55 mutableCopy];

  if (v36)
  {
    id v57 = [(SGRTCLogging *)v65 descriptionForEntityType:16];
    [v56 setObject:v57 forKeyedSubscript:@"documentType"];

    if (v40)
    {
      if (([(__CFString *)v40 isEqualToString:@"unknown"] & 1) == 0) {
        [v56 setObject:v40 forKeyedSubscript:@"bundleID"];
      }
    }
  }

  return v56;
}

- (id)baseInteractionDictionaryForInterface:(unsigned __int16)a3 actionType:(unsigned __int16)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"interactionKey";
  id v4 = [(SGRTCLogging *)self interactionKeyForInterface:a3 actionType:a4];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];

  return v5;
}

- (void)updateAndScheduleDiskWrite
{
  persistenceTimerSource = self->_persistenceTimerSource;
  dispatch_time_t v3 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(persistenceTimerSource, v3, 0xFFFFFFFFFFFFFFFFLL, 0xB2D05E00uLL);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__SGRTCLogging_encodeWithCoder___block_invoke;
  v7[3] = &unk_1E65B7D30;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __32__SGRTCLogging_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  dispatch_time_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = a2[1];
  id v5 = a2;
  [v3 encodeObject:v4 forKey:@"loggedExtractions"];
  [*(id *)(a1 + 32) encodeObject:*((void *)v5 + 2) forKey:@"loggedInteractions"];
  [*(id *)(a1 + 32) encodeObject:*((void *)v5 + 3) forKey:@"loggedInteractionsSummary"];
  id v6 = *(void **)(a1 + 32);
  id v7 = NSNumber;
  double v8 = v5[4];

  id v9 = [v7 numberWithDouble:v8];
  [v6 encodeObject:v9 forKey:@"storeAge"];
}

- (SGRTCLogging)initWithCoder:(id)a3
{
  id v5 = a3;
  id v6 = [(SGRTCLogging *)self init];
  if (v6)
  {
    context = (void *)MEMORY[0x1CB79B230]();
    SEL v20 = a2;
    id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    id v15 = objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, v12, v13, v14, objc_opt_class(), 0);
    lock = v6->_lock;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __30__SGRTCLogging_initWithCoder___block_invoke;
    v21[3] = &unk_1E65B7D08;
    id v22 = v5;
    id v23 = v15;
    SEL v25 = v20;
    char v24 = v6;
    id v17 = v15;
    [(_PASLock *)lock runWithLockAcquired:v21];
  }
  return v6;
}

void __30__SGRTCLogging_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) decodeObjectOfClasses:*(void *)(a1 + 40) forKey:@"loggedExtractions"];
  id v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_opt_new();
  }
  id v7 = (void *)*((void *)v3 + 1);
  *((void *)v3 + 1) = v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"SGRTCLogging.m", 301, @"Invalid parameter not satisfying: %@", @"[guardedData->_loggedExtractions isKindOfClass:NSMutableArray.class]" object file lineNumber description];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v8 = *((id *)v3 + 1);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v48 objects:v54 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v49 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
          [v13 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"SGRTCLogging.m", 303, @"Invalid parameter not satisfying: %@", @"[loggedExtraction isKindOfClass:NSDictionary.class]" object file lineNumber description];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v48 objects:v54 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [*(id *)(a1 + 32) decodeObjectOfClasses:*(void *)(a1 + 40) forKey:@"loggedInteractions"];
  id v15 = v14;
  if (v14) {
    id v16 = v14;
  }
  else {
    id v16 = (id)objc_opt_new();
  }
  id v17 = (void *)*((void *)v3 + 2);
  *((void *)v3 + 2) = v16;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    long long v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"SGRTCLogging.m", 306, @"Invalid parameter not satisfying: %@", @"[guardedData->_loggedInteractions isKindOfClass:NSMutableArray.class]" object file lineNumber description];
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v18 = *((id *)v3 + 2);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v45;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v45 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v23 = [MEMORY[0x1E4F28B00] currentHandler];
          [v23 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"SGRTCLogging.m", 308, @"Invalid parameter not satisfying: %@", @"[loggedInteraction isKindOfClass:NSDictionary.class]" object file lineNumber description];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
    }
    while (v20);
  }

  char v24 = [*(id *)(a1 + 32) decodeObjectOfClasses:*(void *)(a1 + 40) forKey:@"loggedInteractionsSummary"];
  SEL v25 = v24;
  if (v24) {
    id v26 = v24;
  }
  else {
    id v26 = (id)objc_opt_new();
  }
  char v27 = (void *)*((void *)v3 + 3);
  *((void *)v3 + 3) = v26;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"SGRTCLogging.m", 311, @"Invalid parameter not satisfying: %@", @"[guardedData->_loggedInteractionsSummary isKindOfClass:NSMutableArray.class]" object file lineNumber description];
  }
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v28 = *((id *)v3 + 3);
  uint64_t v29 = [v28 countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v41;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v41 != v31) {
          objc_enumerationMutation(v28);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          long long v33 = [MEMORY[0x1E4F28B00] currentHandler];
          [v33 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 48), @"SGRTCLogging.m", 313, @"Invalid parameter not satisfying: %@", @"[loggedInteractionSummary isKindOfClass:NSMutableDictionary.class]" object file lineNumber description];
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v40 objects:v52 count:16];
    }
    while (v30);
  }

  uint64_t v34 = [*(id *)(a1 + 32) decodeObjectOfClass:objc_opt_class() forKey:@"storeAge"];
  [v34 doubleValue];
  *((void *)v3 + 4) = v35;

  if (*((double *)v3 + 4) == 0.0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    *((void *)v3 + 4) = v36;
  }
}

- (unint64_t)loggedExtractionsEventsCount
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  locuint64_t k = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SGRTCLogging_loggedExtractionsEventsCount__block_invoke;
  v5[3] = &unk_1E65B7CC0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __44__SGRTCLogging_loggedExtractionsEventsCount__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = *(id *)(a2 + 8);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7), "objectForKeyedSubscript:", @"eventsCount", (void)v9);
        *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v8 integerValue];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)loggedInteractionsSummary
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__13825;
  long long v11 = __Block_byref_object_dispose__13826;
  id v12 = 0;
  locuint64_t k = self->_lock;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__SGRTCLogging_loggedInteractionsSummary__block_invoke;
  v6[3] = &unk_1E65B7CC0;
  v6[4] = &v7;
  id v3 = (void *)MEMORY[0x1CB79B230]([(_PASLock *)lock runWithLockAcquired:v6]);
  uint64_t v4 = [(id)v8[5] sortedArrayUsingComparator:&__block_literal_global_128];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __41__SGRTCLogging_loggedInteractionsSummary__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[SGRTCLogging _deepCopy:*(void *)(a2 + 24)];
  return MEMORY[0x1F41817F8]();
}

uint64_t __41__SGRTCLogging_loggedInteractionsSummary__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 objectForKeyedSubscript:@"categoryLog"];
  uint64_t v6 = [v4 objectForKeyedSubscript:@"categoryLog"];

  uint64_t v7 = [v6 compare:v5];
  return v7;
}

- (id)loggedInteractions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__13825;
  long long v10 = __Block_byref_object_dispose__13826;
  id v11 = 0;
  locuint64_t k = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__SGRTCLogging_loggedInteractions__block_invoke;
  v5[3] = &unk_1E65B7CC0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __34__SGRTCLogging_loggedInteractions__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[SGRTCLogging _deepCopy:*(void *)(a2 + 16)];
  return MEMORY[0x1F41817F8]();
}

- (id)loggedExtractions
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__13825;
  long long v10 = __Block_byref_object_dispose__13826;
  id v11 = 0;
  locuint64_t k = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__SGRTCLogging_loggedExtractions__block_invoke;
  v5[3] = &unk_1E65B7CC0;
  v5[4] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __33__SGRTCLogging_loggedExtractions__block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [*(id *)(a2 + 8) copy];
  return MEMORY[0x1F41817F8]();
}

- (void)dealloc
{
  id v3 = sgLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v3, OS_LOG_TYPE_DEBUG, "SGRTCLogging going away now", buf, 2u);
  }

  dispatch_source_cancel((dispatch_source_t)self->_persistenceTimerSource);
  v4.receiver = self;
  v4.super_class = (Class)SGRTCLogging;
  [(SGRTCLogging *)&v4 dealloc];
}

- (SGRTCLogging)initWithFilename:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [(SGRTCLogging *)self init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_path, a3);
  }

  return v7;
}

- (SGRTCLogging)init
{
  v22.receiver = self;
  v22.super_class = (Class)SGRTCLogging;
  double v2 = [(SGRTCLogging *)&v22 init];
  id v3 = v2;
  if (v2)
  {
    path = v2->_path;
    v2->_path = 0;

    id v5 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v6 = objc_opt_new();
    uint64_t v7 = [v5 initWithGuardedData:v6];
    locuint64_t k = v3->_lock;
    v3->_locuint64_t k = (_PASLock *)v7;

    [(_PASLock *)v3->_lock runWithLockAcquired:&__block_literal_global_119];
    uint64_t v9 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.suggestd.interactions-write-queue", v9);
    interactionsWriteQueue = v3->_interactionsWriteQueue;
    v3->_interactionsWriteQueue = (OS_dispatch_queue *)v10;

    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_BACKGROUND, 0);
    uint64_t v14 = dispatch_queue_create("rtc-persist", v13);

    dispatch_source_t v15 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v14);
    persistenceTimerSource = v3->_persistenceTimerSource;
    v3->_persistenceTimerSource = (OS_dispatch_source *)v15;

    id location = 0;
    objc_initWeak(&location, v3);
    id v17 = v3->_persistenceTimerSource;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __20__SGRTCLogging_init__block_invoke_2;
    v19[3] = &unk_1E65C0018;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v17, v19);
    dispatch_resume((dispatch_object_t)v3->_persistenceTimerSource);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __20__SGRTCLogging_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained storeToDisk];
}

void __20__SGRTCLogging_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = a2;
  uint64_t v2 = objc_opt_new();
  id v3 = (void *)v9[1];
  v9[1] = v2;

  uint64_t v4 = objc_opt_new();
  id v5 = (void *)v9[2];
  v9[2] = v4;

  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (void *)v9[3];
  v9[3] = v6;

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v9[4] = v8;
}

+ (id)descriptionForOriginType:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return @"unknown";
  }
  else {
    return off_1E65B8050[a3 - 1];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)_createEmptyFileAtPath:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F28370];
  v9[0] = *MEMORY[0x1E4F28358];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
  if (v3)
  {
    id v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    char v6 = [v5 createFileAtPath:v3 contents:0 attributes:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (id)defaultLogger
{
  if (defaultLogger_onceToken != -1) {
    dispatch_once(&defaultLogger_onceToken, &__block_literal_global_14011);
  }
  uint64_t v2 = (void *)defaultLogger_sharedLogger;
  return v2;
}

void __29__SGRTCLogging_defaultLogger__block_invoke()
{
  v0 = +[SGPaths suggestionsDirectoryFile:@"privacyAwareLogging.ser"];
  v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v1 fileExistsAtPath:v0])
  {
    uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v3 = [v2 attributesOfItemAtPath:v0 error:0];
    uint64_t v4 = [v3 fileSize];

    if (v4)
    {
      *(void *)long long buf = 0;
      char v24 = buf;
      uint64_t v25 = 0x2020000000;
      char v26 = 0;
      id v5 = [MEMORY[0x1E4F93B50] dictionaryWithPath:v0 error:0];
      if (v5)
      {
        char v6 = [[SGRTCLogging alloc] initWithFilename:v0];
        uint64_t v7 = (void *)defaultLogger_sharedLogger;
        defaultLogger_sharedLogger = (uint64_t)v6;

        uint64_t v8 = *(void **)(defaultLogger_sharedLogger + 8);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __29__SGRTCLogging_defaultLogger__block_invoke_2;
        v20[3] = &unk_1E65B7C78;
        id v21 = v5;
        objc_super v22 = buf;
        [v8 runWithLockAcquired:v20];
      }
      if (!v24[24])
      {
        uint64_t v9 = (void *)defaultLogger_sharedLogger;
        defaultLogger_sharedLogger = 0;

        dispatch_queue_t v10 = sgLogHandle();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v19 = 0;
          _os_log_impl(&dword_1CA650000, v10, OS_LOG_TYPE_DEFAULT, "Attempt to read stored logs using legacy fallback", v19, 2u);
        }

        id v11 = objc_alloc(MEMORY[0x1E4F28DC0]);
        id v12 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v0 options:1 error:0];
        uint64_t v13 = (void *)[v11 initForReadingFromData:v12 error:0];

        [v13 setDecodingFailurePolicy:0];
        uint64_t v14 = [v13 decodeTopLevelObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8] error:0];
        dispatch_source_t v15 = (void *)defaultLogger_sharedLogger;
        defaultLogger_sharedLogger = v14;

        if (defaultLogger_sharedLogger) {
          objc_storeStrong((id *)(defaultLogger_sharedLogger + 16), v0);
        }
      }
      _Block_object_dispose(buf, 8);
    }
  }
  else
  {
  }
  if (!defaultLogger_sharedLogger)
  {
    id v16 = sgLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1CA650000, v16, OS_LOG_TYPE_DEFAULT, "New logging store", buf, 2u);
    }

    id v17 = [[SGRTCLogging alloc] initWithFilename:v0];
    id v18 = (void *)defaultLogger_sharedLogger;
    defaultLogger_sharedLogger = (uint64_t)v17;
  }
}

void __29__SGRTCLogging_defaultLogger__block_invoke_2(uint64_t a1, void *a2)
{
  id v20 = a2;
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"loggedExtractions"];
  if ((__29__SGRTCLogging_defaultLogger__block_invoke_3(v3) & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"loggedInteractions"];
  if ((__29__SGRTCLogging_defaultLogger__block_invoke_3(v4) & 1) == 0)
  {
LABEL_7:

LABEL_8:
    goto LABEL_9;
  }
  id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"loggedInteractionsSummary"];
  if ((__29__SGRTCLogging_defaultLogger__block_invoke_3(v5) & 1) == 0)
  {

    goto LABEL_7;
  }
  char v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"storeAge"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
LABEL_9:
  uint64_t v8 = v20;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"loggedExtractions"];
    uint64_t v10 = [v9 mutableCopy];
    id v11 = (void *)v20[1];
    v20[1] = v10;

    id v12 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"loggedInteractions"];
    uint64_t v13 = [v12 mutableCopy];
    uint64_t v14 = (void *)v20[2];
    v20[2] = v13;

    dispatch_source_t v15 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"loggedInteractionsSummary"];
    uint64_t v16 = +[SGRTCLogging _deepMutableContainersCopy:v15];

    id v17 = (void *)v20[3];
    v20[3] = v16;

    id v18 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"storeAge"];
    [v18 doubleValue];
    void v20[4] = v19;

    uint64_t v8 = v20;
  }
}

uint64_t __29__SGRTCLogging_defaultLogger__block_invoke_3(void *a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v2 = v1;
    uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v10;
      while (2)
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v10 != v5) {
            objc_enumerationMutation(v2);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v7 = 0;
            goto LABEL_13;
          }
          ++v6;
        }
        while (v4 != v6);
        uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
    uint64_t v7 = 1;
LABEL_13:
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)_deepMutableContainersCopy:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1CB79B230]();
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v3, 1uLL);

  return DeepCopy;
}

+ (id)_deepCopy:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (void *)MEMORY[0x1CB79B230]();
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v3, 0);

  return DeepCopy;
}

+ (id)dateByAppendingDaysToCurrentDate:(double)a3
{
  uint64_t v4 = objc_opt_new();
  uint64_t v5 = [v4 dateByAddingTimeInterval:a3 * 86400.0];

  return v5;
}

+ (id)locationTypeForRealtimeEvent:(id)a3
{
  uint64_t v4 = [a3 event];
  uint64_t v5 = [v4 locations];

  if ([v5 count])
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    uint64_t v7 = [v6 handle];
    [v6 latitude];
    double v9 = v8;
    [v6 longitude];
    double v11 = v10;
    long long v12 = [v6 airportCode];
    uint64_t v13 = [v6 address];
    uint64_t v14 = [v6 label];
    dispatch_source_t v15 = [a1 locationTypeForHandle:v7 latitude:v12 longitude:v13 airportCode:v14 address:v9 label:v11];
  }
  else
  {
    dispatch_source_t v15 = @"unknown";
  }

  return v15;
}

+ (id)locationTypeForEntity:(id)a3
{
  uint64_t v4 = [a3 locations];
  uint64_t v5 = [v4 allObjects];

  if ([v5 count])
  {
    uint64_t v6 = [v5 objectAtIndexedSubscript:0];
    uint64_t v7 = [v6 handle];
    [v6 latitude];
    double v9 = v8;
    [v6 longitude];
    double v11 = v10;
    long long v12 = [v6 airportCode];
    uint64_t v13 = [v6 address];
    uint64_t v14 = [v6 label];
    dispatch_source_t v15 = [a1 locationTypeForHandle:v7 latitude:v12 longitude:v13 airportCode:v14 address:v9 label:v11];
  }
  else
  {
    dispatch_source_t v15 = @"unknown";
  }

  return v15;
}

+ (id)locationTypeForHandle:(id)a3 latitude:(double)a4 longitude:(double)a5 airportCode:(id)a6 address:(id)a7 label:(id)a8
{
  if (a3) {
    return @"geocoded";
  }
  if (a4 == 0.0 && a5 == 0.0)
  {
    double v9 = @"unknown";
    if (a8) {
      double v9 = @"label";
    }
    double v10 = @"address";
    if (a8) {
      BOOL v11 = a7 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (!v11) {
      double v10 = @"addressWithLabel";
    }
    if (a7) {
      return v10;
    }
    else {
      return v9;
    }
  }
  else
  {
    long long v12 = @"coordinates";
    if (a8) {
      BOOL v13 = a7 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13) {
      long long v12 = @"addressWithCoordinatesWithLabel";
    }
    if (a6) {
      return @"airportCodeWithCoordinates";
    }
    else {
      return v12;
    }
  }
}

+ (id)launchCountsForApps:(id)a3 afterDate:(id)a4 lowerBucket:(unint64_t)a5 bucketSize:(unint64_t)a6 bucketLimit:(unint64_t)a7
{
  BOOL v11 = [a1 launchCountsForApps:a3 afterDate:a4 limit:a7];
  long long v12 = [v11 allKeys];
  id v13 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __90__SGRTCLogging_Helpers__launchCountsForApps_afterDate_lowerBucket_bucketSize_bucketLimit___block_invoke;
  v18[3] = &unk_1E65B8B58;
  id v19 = v11;
  unint64_t v20 = a5;
  id v21 = a1;
  unint64_t v22 = a6;
  unint64_t v23 = a7;
  id v14 = v11;
  dispatch_source_t v15 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", v18);

  uint64_t v16 = (void *)[v13 initWithObjects:v15 forKeys:v12];
  return v16;
}

id __90__SGRTCLogging_Helpers__launchCountsForApps_afterDate_lowerBucket_bucketSize_bucketLimit___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  unint64_t v4 = [v3 unsignedIntegerValue];
  if (v4 <= *(void *)(a1 + 40))
  {
    id v5 = v3;
  }
  else
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 48), "bucketizeInteger:withBucketSize:limit:", v4, *(void *)(a1 + 56), *(void *)(a1 + 64)));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;

  return v6;
}

+ (id)launchCountsForApps:(id)a3 afterDate:(id)a4 limit:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  double v9 = objc_opt_new();
  double v10 = [v9 launchCountsForBundleIds:v8 afterDate:v7 limit:a5];

  id v11 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__SGRTCLogging_Helpers__launchCountsForApps_afterDate_limit___block_invoke;
  v16[3] = &unk_1E65BF1D0;
  id v17 = v10;
  id v12 = v10;
  id v13 = objc_msgSend(v8, "_pas_mappedArrayWithTransform:", v16);

  id v14 = (void *)[v11 initWithObjects:v13 forKeys:v8];
  return v14;
}

uint64_t __61__SGRTCLogging_Helpers__launchCountsForApps_afterDate_limit___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = NSNumber;
  uint64_t v3 = [*(id *)(a1 + 32) countForObject:a2];
  return [v2 numberWithUnsignedInteger:v3];
}

+ (id)aggregateSummaryBucketizedLaunchCountsForApps:(id)a3 afterDate:(id)a4
{
  id v5 = [a1 launchCountsForApps:a3 afterDate:a4 limit:100];
  uint64_t v6 = [a1 bucketizeIntegersForAggregateSummary:v5];

  return v6;
}

+ (unint64_t)numberOfDaysBetweenDate:(id)a3 andDate:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x1E4F1C9A8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 alloc];
  double v9 = (void *)[v8 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  double v10 = [v9 components:16 fromDate:v7 toDate:v6 options:0];

  unint64_t v11 = [v10 day];
  return v11;
}

+ (double)round:(double)a3 toSignificantFigures:(int64_t)a4
{
  double result = 0.0;
  if (a3 != 0.0)
  {
    double v7 = -a3;
    if (a3 >= 0.0) {
      double v7 = a3;
    }
    double v8 = log10(v7);
    double v9 = __exp10((double)(uint64_t)(a4 - vcvtpd_s64_f64(v8)));
    return (double)(uint64_t)llround(v9 * a3) / v9;
  }
  return result;
}

+ (id)bucketizeIntegersForAggregateSummary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 allKeys];
  id v6 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __62__SGRTCLogging_Helpers__bucketizeIntegersForAggregateSummary___block_invoke;
  id v14 = &unk_1E65B8B30;
  id v15 = v4;
  id v16 = a1;
  id v7 = v4;
  double v8 = objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &v11);

  double v9 = objc_msgSend(v6, "initWithObjects:forKeys:", v8, v5, v11, v12, v13, v14);
  return v9;
}

id __62__SGRTCLogging_Helpers__bucketizeIntegersForAggregateSummary___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = NSNumber;
  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  id v5 = objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v3, "bucketizeIntegerForAggregateSummary:", objc_msgSend(v4, "unsignedIntegerValue")));

  return v5;
}

+ (unint64_t)bucketizeIntegerForAggregateSummary:(unint64_t)a3
{
  if (a3 >= 0xB) {
    return objc_msgSend(a1, "bucketizeInteger:withBucketSize:limit:");
  }
  else {
    return a3;
  }
}

+ (unint64_t)bucketizeInteger:(unint64_t)a3 withBucketSize:(unint64_t)a4 limit:(unint64_t)a5
{
  if (!a4)
  {
    uint64_t v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"SGRTCLogging+Helpers.m" lineNumber:26 description:@"bucketSize must be > 0"];
  }
  if (a3 <= a5) {
    return (a3 + a4 - 1) / a4 * a4;
  }
  return a5;
}

- (id)trialIds
{
  id v2 = objc_opt_new();
  uint64_t v3 = +[SGReminderTrialClientWrapper sharedInstance];
  id v4 = [v3 treatmentId];
  id v5 = [v3 experimentId];
  id v6 = [v3 deploymentId];
  if ([v4 length]) {
    [v2 setObject:v4 forKeyedSubscript:@"trialTreatmentId"];
  }
  if ([v5 length]) {
    [v2 setObject:v5 forKeyedSubscript:@"trialExperimentId"];
  }
  if (v6) {
    [v2 setObject:v6 forKeyedSubscript:@"trialDeploymentId"];
  }

  return v2;
}

- (id)_interactionDictionaryForDueLocation:(id)a3 dueDateComponents:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_opt_new();
  if (v5)
  {
    double v8 = objc_msgSend(MEMORY[0x1E4F5DB28], "describeReminderDueLocationType:", objc_msgSend(v5, "locationType"));
    [v7 setObject:v8 forKeyedSubscript:@"dueLocationType"];

    double v9 = objc_msgSend(MEMORY[0x1E4F5DB28], "describeReminderDueLocationTrigger:", objc_msgSend(v5, "trigger"));
    [v7 setObject:v9 forKeyedSubscript:@"dueLocationTrigger"];
  }
  if (v6)
  {
    double v10 = [v6 date];
    [v10 timeIntervalSinceNow];
    double v12 = v11;

    if (v12 >= 0.0)
    {
      id v13 = [v6 date];
      [v13 timeIntervalSinceNow];
      unint64_t v15 = +[SGRTCLogging bucketizeInteger:(unint64_t)(v14 / 86400.0) withBucketSize:7 limit:56];

      id v16 = [NSNumber numberWithUnsignedInteger:v15];
      [v7 setObject:v16 forKeyedSubscript:@"daysUntilDue"];
    }
    else
    {
      [v7 setObject:&unk_1F2536588 forKeyedSubscript:@"daysUntilDue"];
    }
    if ([v6 hour] == 0x7FFFFFFFFFFFFFFFLL
      && [v6 minute] == 0x7FFFFFFFFFFFFFFFLL
      && [v6 second] == 0x7FFFFFFFFFFFFFFFLL
      && [v6 nanosecond] == 0x7FFFFFFFFFFFFFFFLL)
    {
      [v7 setObject:&unk_1F25365A0 forKeyedSubscript:@"defaultDueDate"];
    }
  }

  return v7;
}

- (id)_baseInteractionAttributesForReminder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dueLocation];

  if (v5) {
    id v5 = -[SGReminderDueLocation initWithLocationType:trigger:name:]([SGReminderDueLocation alloc], "initWithLocationType:trigger:name:", [v4 dueLocationType], objc_msgSend(v4, "dueLocationTrigger"), 0);
  }
  id v6 = [v4 dueDateComponents];
  id v7 = [(SGRTCLogging *)self _interactionDictionaryForDueLocation:v5 dueDateComponents:v6];

  return v7;
}

- (id)_interactionSummaryForReminder:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  v29[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  double v9 = [v8 dueDateComponents];

  if (v9)
  {
    double v10 = [v8 dueDateComponents];
    double v9 = [v10 date];
  }
  double v11 = [(SGRTCLogging *)self _baseInteractionAttributesForReminder:v8];
  double v12 = [(SGRTCLogging *)self _eventKeyforReminder:v8];
  id v13 = [(SGRTCLogging *)self interactionKeyForInterface:v6 actionType:v5];
  double v14 = [(SGRTCLogging *)self createInteractionSummaryForEventKey:v12 expirationDate:v9 interactionKey:v13 interactionAttributes:v11 rtcCategory:10];

  unint64_t v15 = [(id)objc_opt_class() dateByAppendingDaysToCurrentDate:-14.0];
  id v16 = objc_opt_class();
  v29[0] = *MEMORY[0x1E4F5DC58];
  uint64_t v17 = v29[0];
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
  id v19 = [v16 launchCountsForApps:v18 afterDate:v15 lowerBucket:1 bucketSize:10 bucketLimit:50];
  unint64_t v20 = [v19 objectForKeyedSubscript:v17];
  [v14 setObject:v20 forKeyedSubscript:@"launchCountReminders"];

  id v21 = [(SGRTCLogging *)self trialIds];
  [v14 addEntriesFromDictionary:v21];

  unint64_t v22 = objc_opt_class();
  unint64_t v23 = [v8 origin];
  char v24 = objc_msgSend(v22, "descriptionForOriginType:", objc_msgSend(v23, "type"));
  [v14 setObject:v24 forKeyedSubscript:@"documentType"];

  uint64_t v25 = [MEMORY[0x1E4F5DFA0] defaultLanguage];
  char v26 = (void *)v25;
  if (v25) {
    char v27 = (__CFString *)v25;
  }
  else {
    char v27 = @"unknown";
  }
  [v14 setObject:v27 forKeyedSubscript:@"deviceLanguage"];

  return v14;
}

- (id)_eventKeyforReminder:(id)a3
{
  id v3 = a3;
  id v4 = [SGDuplicateKey alloc];
  uint64_t v5 = [v3 uniqueKey];

  uint64_t v6 = [(SGDuplicateKey *)v4 initWithSerialized:v5];
  id v7 = [(SGDuplicateKey *)v6 entityKey];
  id v8 = [v7 serialize];

  return v8;
}

- (void)logReminderExtractionFromEntity:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5 dueLocation:(id)a6 dueDateComponents:(id)a7 extractionStatus:(unsigned __int8)a8 timingProcessing:(double)a9
{
  uint64_t v9 = a8;
  if (a8 == 1)
  {
    id v14 = a7;
    id v15 = a6;
    id v16 = a3;
    uint64_t v17 = sgRemindersLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v31 = 0;
      _os_log_debug_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEBUG, "SGRTCLogging+Reminders: logging extraction to RTC", v31, 2u);
    }

    id v18 = [(SGRTCLogging *)self _interactionDictionaryForDueLocation:v15 dueDateComponents:v14];

    id v19 = [(SGRTCLogging *)self descriptionForSGRTCCategory:8];
    [v18 setObject:v19 forKeyedSubscript:@"categoryLog"];

    unint64_t v20 = [(id)objc_opt_class() describeReminderExtractionStatus:1];
    [v18 setObject:v20 forKeyedSubscript:@"remindersExtractionStatus"];

    uint64_t v21 = [NSNumber numberWithDouble:a9];
    unint64_t v22 = (void *)v21;
    if (v21) {
      unint64_t v23 = (__CFString *)v21;
    }
    else {
      unint64_t v23 = &stru_1F24EEF20;
    }
    [v18 setObject:v23 forKeyedSubscript:@"timingProcessing"];

    char v24 = [v16 duplicateKey];

    uint64_t v25 = -[SGRTCLogging descriptionForEntityType:](self, "descriptionForEntityType:", [v24 entityType]);
    [v18 setObject:v25 forKeyedSubscript:@"documentType"];

    uint64_t v26 = [MEMORY[0x1E4F5DFA0] defaultLanguage];
    char v27 = (void *)v26;
    if (v26) {
      id v28 = (__CFString *)v26;
    }
    else {
      id v28 = @"unknown";
    }
    [v18 setObject:v28 forKeyedSubscript:@"deviceLanguage"];

    uint64_t v29 = [(SGRTCLogging *)self trialIds];
    [v18 addEntriesFromDictionary:v29];

    [(SGRTCLogging *)self logAndIncrementEventCountForDictionary:v18];
  }
  uint64_t v30 = [(id)objc_opt_class() describeReminderExtractionStatus:v9];
  [(SGRTCLogging *)self logAggregateSummaryForInteraction:v30];
}

- (void)_logReminderInteractionSummaryForReminder:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v12 = a3;
  id v8 = -[SGRTCLogging _eventKeyforReminder:](self, "_eventKeyforReminder:");
  uint64_t v9 = [(SGRTCLogging *)self interactionKeyForInterface:v6 actionType:v5];
  BOOL v10 = [(SGRTCLogging *)self incrementAndUpgradeInteractionSummaryForEventKey:v8 interactionKey:v9 parentEntity:0];

  if (!v10)
  {
    double v11 = [(SGRTCLogging *)self _interactionSummaryForReminder:v12 interface:v6 actionType:v5];
    [(SGRTCLogging *)self logNewInteractionSummaryWithDictionary:v11];
  }
}

- (void)logReminderInteractionFromReminder:(id)a3 interface:(unsigned __int16)a4 actionType:(unsigned __int16)a5
{
  uint64_t v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  uint64_t v9 = sgRemindersLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)id v16 = 0;
    _os_log_debug_impl(&dword_1CA650000, v9, OS_LOG_TYPE_DEBUG, "SGRTCLogging+Reminders: logging interaction to RTC", v16, 2u);
  }

  BOOL v10 = [(SGRTCLogging *)self baseInteractionDictionaryForInterface:v6 actionType:v5];
  double v11 = (void *)[v10 mutableCopy];

  id v12 = [(SGRTCLogging *)self trialIds];
  [v11 addEntriesFromDictionary:v12];

  id v13 = [(SGRTCLogging *)self descriptionForSGRTCCategory:9];
  [v11 setObject:v13 forKeyedSubscript:@"categoryLog"];

  [(SGRTCLogging *)self logNewInteractionWithDictionary:v11];
  id v14 = [(SGRTCLogging *)self interactionKeyForCategory:9 interface:v6 actionType:v5];
  [(SGRTCLogging *)self logAggregateSummaryForInteraction:v14];

  [(SGRTCLogging *)self _logReminderInteractionSummaryForReminder:v8 interface:v6 actionType:v5];
  id v15 = [MEMORY[0x1E4F5DFA0] defaultLanguage];
  if ([@"en" isEqual:v15]) {
    +[SGDPLogging logReminder:v8 actionType:v5];
  }
}

- (void)logReminderInteractionFromEntity:(id)a3 usingStore:(id)a4 interface:(unsigned __int16)a5 actionType:(unsigned __int16)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __92__SGRTCLogging_Reminders__logReminderInteractionFromEntity_usingStore_interface_actionType___block_invoke;
  id v19 = &unk_1E65BFCD0;
  id v20 = v10;
  id v21 = v11;
  unint64_t v22 = self;
  unsigned __int16 v23 = a5;
  unsigned __int16 v24 = a6;
  id v12 = v11;
  id v13 = v10;
  id v14 = (void *)MEMORY[0x1CB79B4C0](&v16);
  id v15 = [(SGRTCLogging *)self interactionsWriteQueue];
  dispatch_async(v15, v14);
}

void __92__SGRTCLogging_Reminders__logReminderInteractionFromEntity_usingStore_interface_actionType___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = +[SGStorageReminder storageReminderFromEntity:*(void *)(a1 + 32) store:*(void *)(a1 + 40)];
  if (v2)
  {
    [*(id *)(a1 + 48) logReminderInteractionFromReminder:v2 interface:*(unsigned __int16 *)(a1 + 56) actionType:*(unsigned __int16 *)(a1 + 58)];
  }
  else
  {
    id v3 = sgRemindersLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      id v4 = [*(id *)(a1 + 32) recordId];
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_error_impl(&dword_1CA650000, v3, OS_LOG_TYPE_ERROR, "SGRTCLogging+Reminders: No reminder found for entity record Id: %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

+ (id)describeReminderExtractionStatus:(unsigned __int8)a3
{
  if ((a3 - 1) > 5) {
    return @"unknown";
  }
  else {
    return off_1E65BFD30[(a3 - 1)];
  }
}

@end