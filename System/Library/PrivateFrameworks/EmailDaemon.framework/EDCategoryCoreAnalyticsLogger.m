@interface EDCategoryCoreAnalyticsLogger
+ (id)log;
- (EDAccountsProvider)accountsProvider;
- (EDBiomeBlackPearlLogger)biomeCollector;
- (EDBiomeBlackPearlLogger)biomeFedStatsCollector;
- (EDBiomeBlackPearlLogger)readBiomeCollector;
- (EDBiomeBlackPearlLogger)recategorizeBiomeCollector;
- (EDBiomeBlackPearlLogger)receiveBiomeCollector;
- (EDCategoryCoreAnalyticsLogger)init;
- (EFScheduler)analyticsScheduler;
- (EMCoreAnalyticsCollector)analyticsCollector;
- (NSArray)accounts;
- (double)_calculateBiomeETLToCAScheduleDeltaFrom:(id)a3;
- (double)_calculateScheduleDeltaFrom:(id)a3;
- (id)_blackPearlEnabledAccounts;
- (id)_convertModelMetadata:(id)a3;
- (id)_createMetadataPKWithUserDefaults:(id)a3;
- (id)_defaultModelMetadata;
- (id)_emSharedModelMetadataWithScheduledHour:(BOOL)a3;
- (id)_getCommmaSeparatedString:(id)a3;
- (id)_getMetadataIntValue:(id)a3;
- (id)_getMetadataStringValue:(id)a3;
- (id)_hashedGlobalMessageId:(int64_t)a3;
- (id)_isAllInboxesCategoriesEnabled:(id)a3;
- (id)_mailboxFromMessage:(id)a3;
- (id)_modelMetadata:(id)a3;
- (id)_senderAddressFromMessage:(id)a3;
- (id)_senderDomainFromMessage:(id)a3;
- (id)_senderIDFromMessage:(id)a3;
- (id)setOfBlackPearlEnabledAccoutIdentifier;
- (int)_hourInUTC;
- (int)numberOfAccounts;
- (int64_t)_accountTypeForAccount:(id)a3;
- (int64_t)_accountTypeForMessage:(id)a3;
- (int64_t)_loggingCategoryTypeFromType:(unint64_t)a3 isHighImpact:(BOOL)a4;
- (int64_t)_loggingPredecitedCategoryTypeFromType:(unint64_t)a3 isHighImpact:(BOOL)a4;
- (void)_logAccountPersonalPreference;
- (void)_sendCategorizationAnalyticsForAppLaunchNotification:(id)a3;
- (void)etlFromBiomeToCA;
- (void)logFedStatRecategorizationEventForMessages:(id)a3 categoryChangeAction:(id)a4 categoryPersistence:(id)a5;
- (void)logModelMetadataForMessages:(id)a3 categoryPersistence:(id)a4;
- (void)logReadEventForMessages:(id)a3 categoryPersistence:(id)a4;
- (void)logRecategorizationEventForMessages:(id)a3 categoryType:(unint64_t)a4 categoryPersistence:(id)a5;
- (void)logRecategorizationEventForMessages:(id)a3 categoryType:(unint64_t)a4 categoryPersistence:(id)a5 isHighImpactFlagChange:(BOOL)a6;
- (void)logReceiveEventForMessagesWithResult:(id)a3;
- (void)processCoreAnalyticsEvents;
- (void)scheduleNextAnalyticsBackgroundTask;
- (void)scheduleNextBiomeETLToCAScheduleBackgroundTask;
- (void)setAccounts:(id)a3;
- (void)setAccountsProvider:(id)a3;
- (void)setAnalyticsCollector:(id)a3;
- (void)setBiomeCollector:(id)a3;
- (void)setBiomeFedStatsCollector:(id)a3;
- (void)setReadBiomeCollector:(id)a3;
- (void)setRecategorizeBiomeCollector:(id)a3;
- (void)setReceiveBiomeCollector:(id)a3;
@end

@implementation EDCategoryCoreAnalyticsLogger

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EDCategoryCoreAnalyticsLogger_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_16 != -1) {
    dispatch_once(&log_onceToken_16, block);
  }
  v2 = (void *)log_log_16;

  return v2;
}

void __36__EDCategoryCoreAnalyticsLogger_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_16;
  log_log_16 = (uint64_t)v1;
}

- (EDCategoryCoreAnalyticsLogger)init
{
  v19.receiver = self;
  v19.super_class = (Class)EDCategoryCoreAnalyticsLogger;
  v2 = [(EDCategoryCoreAnalyticsLogger *)&v19 init];
  if (v2)
  {
    id v3 = (EMCoreAnalyticsCollector *)objc_alloc_init(MEMORY[0x1E4F60258]);
    analyticsCollector = v2->_analyticsCollector;
    v2->_analyticsCollector = v3;

    uint64_t v5 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EDCategoryCoreAnalyticsLogger.analyticsScheduler" qualityOfService:9];
    analyticsScheduler = v2->_analyticsScheduler;
    v2->_analyticsScheduler = (EFScheduler *)v5;

    v7 = [[EDBiomeBlackPearlLogger alloc] initWithStreamType:0];
    receiveBiomeCollector = v2->_receiveBiomeCollector;
    v2->_receiveBiomeCollector = v7;

    v9 = [[EDBiomeBlackPearlLogger alloc] initWithStreamType:2];
    readBiomeCollector = v2->_readBiomeCollector;
    v2->_readBiomeCollector = v9;

    v11 = [[EDBiomeBlackPearlLogger alloc] initWithStreamType:1];
    recategorizeBiomeCollector = v2->_recategorizeBiomeCollector;
    v2->_recategorizeBiomeCollector = v11;

    v13 = [[EDBiomeBlackPearlLogger alloc] initWithStreamType:3];
    biomeCollector = v2->_biomeCollector;
    v2->_biomeCollector = v13;

    v15 = [[EDBiomeBlackPearlLogger alloc] initWithStreamType:4];
    biomeFedStatsCollector = v2->_biomeFedStatsCollector;
    v2->_biomeFedStatsCollector = v15;

    v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v17 addObserver:v2 selector:sel__sendCategorizationAnalyticsForAppLaunchNotification_ name:@"EDClientStateForegroundStateDidChange" object:0];
  }
  return v2;
}

- (id)_defaultModelMetadata
{
  v5[11] = *MEMORY[0x1E4F143B8];
  v4[0] = @"trialExperimentIdentifier";
  v4[1] = @"trialExperimentDeploymentIdentifier";
  v5[0] = @"NA";
  v5[1] = @"-1";
  v4[2] = @"trialExperimentTreatmentIdentifier";
  v4[3] = @"trialRolloutIdentifier";
  v5[2] = @"NA";
  v5[3] = @"NA";
  v4[4] = @"trialRolloutDeploymentIdentifier";
  v4[5] = @"trialRolloutFactorPackIdentifier";
  v5[4] = @"-1";
  v5[5] = @"NA";
  v4[6] = @"blackPearlModelVersion";
  v4[7] = @"blackPearlSenderModelVersion";
  v5[6] = @"NA";
  v5[7] = @"NA";
  v4[8] = @"blackPearlBreakthroughVersion";
  v4[9] = @"blackPearlFinalRuleVersion";
  v5[8] = @"NA";
  v5[9] = @"NA";
  v4[10] = @"reasonCodes";
  v5[10] = @"NA";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:11];

  return v2;
}

- (id)_modelMetadata:(id)a3
{
  v43[11] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = v5;
  if (v5)
  {
    v42[0] = @"trialExperimentIdentifier";
    uint64_t v7 = [v5 experimentID];
    v41 = (void *)v7;
    if (v7) {
      v8 = (__CFString *)v7;
    }
    else {
      v8 = @"NA";
    }
    v43[0] = v8;
    v42[1] = @"trialExperimentDeploymentIdentifier";
    uint64_t v9 = [v6 experimentDeploymentID];
    v40 = (void *)v9;
    if (v9) {
      v10 = (__CFString *)v9;
    }
    else {
      v10 = @"-1";
    }
    v43[1] = v10;
    v42[2] = @"trialExperimentTreatmentIdentifier";
    uint64_t v11 = [v6 experimentTreatmentID];
    v39 = (void *)v11;
    if (v11) {
      v12 = (__CFString *)v11;
    }
    else {
      v12 = @"NA";
    }
    v43[2] = v12;
    v42[3] = @"trialRolloutIdentifier";
    uint64_t v13 = [v6 rolloutID];
    v38 = (void *)v13;
    if (v13) {
      v14 = (__CFString *)v13;
    }
    else {
      v14 = @"NA";
    }
    v43[3] = v14;
    v42[4] = @"trialRolloutDeploymentIdentifier";
    uint64_t v15 = [v6 rolloutDeploymentID];
    v37 = (void *)v15;
    if (v15) {
      v16 = (__CFString *)v15;
    }
    else {
      v16 = @"-1";
    }
    v43[4] = v16;
    v42[5] = @"trialRolloutFactorPackIdentifier";
    uint64_t v17 = [v6 rolloutFactorPackID];
    v18 = (void *)v17;
    if (v17) {
      objc_super v19 = (__CFString *)v17;
    }
    else {
      objc_super v19 = @"NA";
    }
    v43[5] = v19;
    v42[6] = @"blackPearlModelVersion";
    uint64_t v20 = [v6 modelVersion];
    v21 = (void *)v20;
    if (v20) {
      v22 = (__CFString *)v20;
    }
    else {
      v22 = @"NA";
    }
    v43[6] = v22;
    v42[7] = @"blackPearlSenderModelVersion";
    uint64_t v23 = [v6 senderModelVersion];
    v24 = (void *)v23;
    if (v23) {
      v25 = (__CFString *)v23;
    }
    else {
      v25 = @"NA";
    }
    v43[7] = v25;
    v42[8] = @"blackPearlBreakthroughVersion";
    uint64_t v26 = [v6 tsModelVersion];
    v27 = (void *)v26;
    if (v26) {
      v28 = (__CFString *)v26;
    }
    else {
      v28 = @"NA";
    }
    v43[8] = v28;
    v42[9] = @"blackPearlFinalRuleVersion";
    uint64_t v29 = [v6 finalRuleVersion];
    v30 = (void *)v29;
    if (v29) {
      v31 = (__CFString *)v29;
    }
    else {
      v31 = @"NA";
    }
    v43[9] = v31;
    v42[10] = @"reasonCodes";
    v32 = [v6 reasonCodes];
    if (v32)
    {
      id v3 = [v6 reasonCodes];
      v33 = [v3 componentsJoinedByString:@","];
    }
    else
    {
      v33 = &stru_1F3583658;
    }
    v43[10] = v33;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:11];
    if (v32)
    {
    }
  }
  else
  {
    v34 = +[EDCategoryCoreAnalyticsLogger log];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[EDCategoryCoreAnalyticsLogger _modelMetadata:](v34);
    }

    v35 = [(EDCategoryCoreAnalyticsLogger *)self _defaultModelMetadata];
  }

  return v35;
}

- (id)_convertModelMetadata:(id)a3
{
  v43[11] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v42[0] = @"trialExperimentIdentifier";
    uint64_t v6 = [v4 objectForKey:*MEMORY[0x1E4F73A78]];
    v41 = (void *)v6;
    if (v6) {
      uint64_t v7 = (__CFString *)v6;
    }
    else {
      uint64_t v7 = @"NA";
    }
    v43[0] = v7;
    v42[1] = @"trialExperimentDeploymentIdentifier";
    uint64_t v8 = [v5 objectForKey:*MEMORY[0x1E4F73A70]];
    v40 = (void *)v8;
    if (v8) {
      uint64_t v9 = (__CFString *)v8;
    }
    else {
      uint64_t v9 = @"-1";
    }
    v43[1] = v9;
    v42[2] = @"trialExperimentTreatmentIdentifier";
    uint64_t v10 = [v5 objectForKey:*MEMORY[0x1E4F73A80]];
    v39 = (void *)v10;
    if (v10) {
      uint64_t v11 = (__CFString *)v10;
    }
    else {
      uint64_t v11 = @"NA";
    }
    v43[2] = v11;
    v42[3] = @"trialRolloutIdentifier";
    uint64_t v12 = [v5 objectForKey:*MEMORY[0x1E4F73AB0]];
    v38 = (void *)v12;
    if (v12) {
      uint64_t v13 = (__CFString *)v12;
    }
    else {
      uint64_t v13 = @"NA";
    }
    v43[3] = v13;
    v42[4] = @"trialRolloutDeploymentIdentifier";
    uint64_t v14 = [v5 objectForKey:*MEMORY[0x1E4F73AA0]];
    v37 = (void *)v14;
    if (v14) {
      uint64_t v15 = (__CFString *)v14;
    }
    else {
      uint64_t v15 = @"-1";
    }
    v43[4] = v15;
    v42[5] = @"trialRolloutFactorPackIdentifier";
    uint64_t v16 = [v5 objectForKey:*MEMORY[0x1E4F73AA8]];
    uint64_t v17 = (void *)v16;
    if (v16) {
      v18 = (__CFString *)v16;
    }
    else {
      v18 = @"NA";
    }
    v43[5] = v18;
    v42[6] = @"blackPearlModelVersion";
    uint64_t v19 = [v5 objectForKey:*MEMORY[0x1E4F73A90]];
    uint64_t v20 = (void *)v19;
    if (v19) {
      v21 = (__CFString *)v19;
    }
    else {
      v21 = @"NA";
    }
    v43[6] = v21;
    v42[7] = @"blackPearlSenderModelVersion";
    uint64_t v22 = [v5 objectForKey:*MEMORY[0x1E4F73AB8]];
    uint64_t v23 = (void *)v22;
    if (v22) {
      v24 = (__CFString *)v22;
    }
    else {
      v24 = @"NA";
    }
    v43[7] = v24;
    v42[8] = @"blackPearlBreakthroughVersion";
    uint64_t v25 = [v5 objectForKey:*MEMORY[0x1E4F73AC0]];
    uint64_t v26 = (void *)v25;
    if (v25) {
      v27 = (__CFString *)v25;
    }
    else {
      v27 = @"NA";
    }
    v43[8] = v27;
    v42[9] = @"blackPearlFinalRuleVersion";
    uint64_t v28 = [v5 objectForKey:*MEMORY[0x1E4F73A88]];
    uint64_t v29 = (void *)v28;
    if (v28) {
      v30 = (__CFString *)v28;
    }
    else {
      v30 = @"NA";
    }
    v43[9] = v30;
    v42[10] = @"reasonCodes";
    v31 = (void *)*MEMORY[0x1E4F73A98];
    v32 = [v5 objectForKey:*MEMORY[0x1E4F73A98]];
    if (v32)
    {
      v31 = [v5 objectForKey:v31];
      v33 = [(EDCategoryCoreAnalyticsLogger *)self _getCommmaSeparatedString:v31];
    }
    else
    {
      v33 = @"NA";
    }
    v43[10] = v33;
    v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v42 count:11];
    if (v32)
    {
    }
  }
  else
  {
    v34 = +[EDCategoryCoreAnalyticsLogger log];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[EDCategoryCoreAnalyticsLogger _convertModelMetadata:](v34);
    }

    v35 = [(EDCategoryCoreAnalyticsLogger *)self _defaultModelMetadata];
  }

  return v35;
}

- (int)_hourInUTC
{
  v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  id v3 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  [v3 setTimeZone:v2];
  id v4 = [MEMORY[0x1E4F1C9C8] now];
  id v5 = [v3 components:32 fromDate:v4];

  LODWORD(v4) = [v5 hour];
  return (int)v4;
}

- (id)_emSharedModelMetadataWithScheduledHour:(BOOL)a3
{
  BOOL v3 = a3;
  v27[10] = *MEMORY[0x1E4F143B8];
  uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v5 = [(EDCategoryCoreAnalyticsLogger *)self _createMetadataPKWithUserDefaults:v25];
  v24 = [v5 objectForKeyedSubscript:@"trialExperimentID"];
  uint64_t v23 = [v5 objectForKeyedSubscript:@"trialExperimentDeploymentID"];
  uint64_t v22 = [v5 objectForKeyedSubscript:@"trialExperimentTreatmentID"];
  v21 = [v5 objectForKeyedSubscript:@"trialRolloutID"];
  uint64_t v20 = [v5 objectForKeyedSubscript:@"trialRolloutDeploymentID"];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"trialRolloutFactorpackID"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"categorizationVersion"];
  uint64_t v8 = [(EDCategoryCoreAnalyticsLogger *)self _hourInUTC];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", v8);
    uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = @"50";
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:@"metadataPK"];
  int IsLanguageSupported = EMBlackPearlIsLanguageSupported();
  uint64_t v12 = @"0";
  if (IsLanguageSupported) {
    uint64_t v12 = @"1";
  }
  uint64_t v13 = v12;
  v27[0] = v24;
  v26[0] = @"trialExperimentIdentifier";
  v26[1] = @"trialExperimentDeploymentIdentifier";
  uint64_t v14 = [v23 stringValue];
  v27[1] = v14;
  v27[2] = v22;
  v26[2] = @"trialExperimentTreatmentIdentifier";
  v26[3] = @"trialRolloutIdentifier";
  v27[3] = v21;
  v26[4] = @"trialRolloutDeploymentIdentifier";
  uint64_t v15 = [v20 stringValue];
  v26[5] = @"trialRolloutFactorPackIdentifier";
  v26[6] = @"blackPearlCategorizationVersion";
  v27[4] = v15;
  v27[5] = v6;
  v26[7] = @"scheduledHour";
  v26[8] = @"metadataPrimaryKey";
  v27[6] = v7;
  v27[7] = v9;
  v26[9] = @"isDeviceBlackPearlEligible";
  v27[8] = v10;
  v27[9] = v13;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:10];

  uint64_t v17 = (void *)[v16 mutableCopy];
  v18 = [(EDCategoryCoreAnalyticsLogger *)self _isAllInboxesCategoriesEnabled:v25];
  if (v18) {
    [v17 setObject:v18 forKeyedSubscript:@"isAllInboxesBlackPearlEnabled"];
  }

  return v17;
}

- (id)_isAllInboxesCategoriesEnabled:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKey:@"BucketBarConfiguration"];
  uint64_t v6 = [v5 objectForKey:@"All Inboxes"];
  int v7 = [(EDCategoryCoreAnalyticsLogger *)self numberOfAccounts];
  uint64_t v8 = [v4 objectForKey:*MEMORY[0x1E4F600C0]];
  if (v8) {
    uint64_t v9 = (void *)v8;
  }
  else {
    uint64_t v9 = &unk_1F35BAB68;
  }
  if (v7 > 1 && [v9 BOOLValue])
  {
    uint64_t v10 = @"1";
    if (v6)
    {
      int v11 = [v6 BOOLValue];
      uint64_t v12 = @"0";
      if (!v11) {
        uint64_t v12 = @"1";
      }
      uint64_t v10 = v12;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (int)numberOfAccounts
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(EDCategoryCoreAnalyticsLogger *)self accounts];
  int v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        int v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v7 isActive]
          && [v7 conformsToProtocol:&unk_1F35FE498])
        {
          id v8 = v7;
          int v9 = [v8 isLocalAccount];

          v3 += v9 ^ 1;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return v3;
}

- (NSArray)accounts
{
  int v3 = [(EDCategoryCoreAnalyticsLogger *)self accountsProvider];
  uint64_t v4 = [v3 mailAccounts];
  accounts = self->_accounts;
  self->_accounts = v4;

  uint64_t v6 = self->_accounts;

  return v6;
}

- (id)_createMetadataPKWithUserDefaults:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = [v3 objectForKey:@"BlackPearlExperimentID"];
  uint64_t v6 = (void *)v5;
  if (v5) {
    int v7 = (__CFString *)v5;
  }
  else {
    int v7 = @"NA";
  }
  id v8 = v7;

  v39 = v8;
  [v4 setObject:v8 forKeyedSubscript:@"trialExperimentID"];
  uint64_t v9 = [v3 objectForKey:@"BlackPearlExperimentDeploymentID"];
  uint64_t v10 = (void *)v9;
  if (v9) {
    long long v11 = (__CFString *)v9;
  }
  else {
    long long v11 = @"NA";
  }
  long long v12 = v11;

  v38 = v12;
  [v4 setObject:v12 forKeyedSubscript:@"trialExperimentDeploymentID"];
  uint64_t v13 = [v3 objectForKey:@"BlackPearlExperimentTreatmentID"];
  long long v14 = (void *)v13;
  if (v13) {
    uint64_t v15 = (__CFString *)v13;
  }
  else {
    uint64_t v15 = @"NA";
  }
  uint64_t v16 = v15;

  v40 = v16;
  [v4 setObject:v16 forKeyedSubscript:@"trialExperimentTreatmentID"];
  uint64_t v17 = [v3 objectForKey:@"BlackPearlRolloutID"];
  v18 = (void *)v17;
  if (v17) {
    uint64_t v19 = (__CFString *)v17;
  }
  else {
    uint64_t v19 = @"NA";
  }
  uint64_t v20 = v19;

  [v4 setObject:v20 forKeyedSubscript:@"trialRolloutID"];
  uint64_t v21 = [v3 objectForKey:@"BlackPearlRolloutDeploymentID"];
  uint64_t v22 = (void *)v21;
  if (v21) {
    uint64_t v23 = (__CFString *)v21;
  }
  else {
    uint64_t v23 = @"NA";
  }
  v24 = v23;

  [v4 setObject:v24 forKeyedSubscript:@"trialRolloutDeploymentID"];
  uint64_t v25 = [v3 objectForKey:@"BlackPearlRolloutFactorPackID"];
  uint64_t v26 = (void *)v25;
  if (v25) {
    v27 = (__CFString *)v25;
  }
  else {
    v27 = @"NA";
  }
  uint64_t v28 = v27;

  [v4 setObject:v28 forKeyedSubscript:@"trialRolloutFactorpackID"];
  uint64_t v29 = [v3 objectForKey:@"blackPearlCategorizationVersion"];
  v30 = (void *)v29;
  if (v29) {
    v31 = (__CFString *)v29;
  }
  else {
    v31 = @"NA";
  }
  v32 = v31;

  [v4 setObject:v32 forKeyedSubscript:@"categorizationVersion"];
  v33 = [NSString stringWithFormat:@"%@|%@|%@|%@|%@|%@|%@", v32, v8, v12, v40, v20, v24, v28];
  v34 = [v33 dataUsingEncoding:4];
  v35 = objc_msgSend(v34, "ef_md5Digest");
  v36 = objc_msgSend(v35, "ef_hexString");

  [v4 setObject:v36 forKeyedSubscript:@"metadataPK"];

  return v4;
}

- (id)_getCommmaSeparatedString:(id)a3
{
  id v3 = [a3 componentsJoinedByString:@","];

  return v3;
}

- (id)_getMetadataStringValue:(id)a3
{
  id v3 = (__CFString *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = @"NA";
  }
  else {
    id v4 = v3;
  }
  uint64_t v5 = v4;

  return v5;
}

- (id)_getMetadataIntValue:(id)a3
{
  id v3 = (__CFString *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = @"-1";
  }
  else {
    id v4 = v3;
  }
  uint64_t v5 = v4;

  return v5;
}

- (void)_sendCategorizationAnalyticsForAppLaunchNotification:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(EDCategoryCoreAnalyticsLogger *)self analyticsScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __86__EDCategoryCoreAnalyticsLogger__sendCategorizationAnalyticsForAppLaunchNotification___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  id v6 = v4;
  id v8 = v6;
  uint64_t v9 = self;
  [v5 performBlock:v7];
}

void __86__EDCategoryCoreAnalyticsLogger__sendCategorizationAnalyticsForAppLaunchNotification___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) userInfo];
  id v3 = [v2 objectForKeyedSubscript:@"EDClientStateForegroundStateDidChangeKeyIsForeground"];
  int v4 = [v3 BOOLValue];

  uint64_t v5 = [v2 objectForKeyedSubscript:@"EDClientStateForegroundStateDidChangeKeyIsScheduled"];
  int v6 = [v5 BOOLValue];

  int v7 = +[EDCategoryCoreAnalyticsLogger log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __86__EDCategoryCoreAnalyticsLogger__sendCategorizationAnalyticsForAppLaunchNotification___block_invoke_cold_1(v4, v6, v7);
  }

  if (v4)
  {
    id v8 = [*(id *)(a1 + 40) _emSharedModelMetadataWithScheduledHour:0];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.categorization.mailapp.open" collectionData:v8];
    uint64_t v10 = [*(id *)(a1 + 40) analyticsCollector];
    [v10 logOneTimeEvent:v9];
LABEL_7:

    goto LABEL_8;
  }
  if (v6)
  {
    id v8 = [*(id *)(a1 + 40) _emSharedModelMetadataWithScheduledHour:1];
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.categorization.mailapp.open" collectionData:v8];
    uint64_t v10 = [*(id *)(a1 + 40) analyticsCollector];
    [v10 logOneTimeEvent:v9];
    goto LABEL_7;
  }
LABEL_8:
}

- (void)logFedStatRecategorizationEventForMessages:(id)a3 categoryChangeAction:(id)a4 categoryPersistence:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v10 = [v8 categoryType];
  int v11 = [v8 isModelCategoryRestoration] ^ 1;
  if (!v7) {
    LOBYTE(v11) = 1;
  }
  if ((v11 & 1) == 0 && [v7 count])
  {
    long long v12 = [v7 firstObject];
    uint64_t v13 = [v12 category];
    [v13 subtype];
    uint64_t v10 = EMCategoryFromSubtype();
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __117__EDCategoryCoreAnalyticsLogger_logFedStatRecategorizationEventForMessages_categoryChangeAction_categoryPersistence___block_invoke;
  v15[3] = &unk_1E6C004B0;
  v15[4] = self;
  id v14 = v9;
  id v16 = v14;
  uint64_t v17 = v10;
  [v7 enumerateObjectsUsingBlock:v15];
}

void __117__EDCategoryCoreAnalyticsLogger_logFedStatRecategorizationEventForMessages_categoryChangeAction_categoryPersistence___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = objc_msgSend(*(id *)(a1 + 32), "_senderAddressFromMessage:");
  if (v3 && ([*(id *)(a1 + 40) containsObject:v3] & 1) == 0)
  {
    int v4 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v5 = [*(id *)(a1 + 32) _senderIDFromMessage:v14];
    [v4 setObject:v5 forKeyedSubscript:@"senderId"];

    int v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = objc_msgSend(v6, "ef_preferredLanguageIdentifier");
    [v4 setObject:v7 forKeyedSubscript:@"language"];

    id v8 = [*(id *)(a1 + 32) _senderDomainFromMessage:v14];
    [v4 setObject:v8 forKeyedSubscript:@"senderDomain"];

    [v4 setObject:&unk_1F35BAB80 forKeyedSubscript:@"recategorizationBy"];
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
    [v4 setObject:v9 forKeyedSubscript:@"currCategoryView"];

    uint64_t v10 = NSNumber;
    int v11 = [v14 category];
    long long v12 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "type"));
    [v4 setObject:v12 forKeyedSubscript:@"prevCategoryView"];

    uint64_t v13 = [*(id *)(a1 + 32) biomeFedStatsCollector];
    [v13 logRecategorizationFedStatsForMessage:v4];

    [*(id *)(a1 + 40) addObject:v3];
  }
}

- (void)logRecategorizationEventForMessages:(id)a3 categoryType:(unint64_t)a4 categoryPersistence:(id)a5
{
}

- (void)logRecategorizationEventForMessages:(id)a3 categoryType:(unint64_t)a4 categoryPersistence:(id)a5 isHighImpactFlagChange:(BOOL)a6
{
  id v10 = a3;
  id v11 = a5;
  long long v12 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_dateHoursAgo:", 672);
  uint64_t v13 = [(EDCategoryCoreAnalyticsLogger *)self analyticsScheduler];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __125__EDCategoryCoreAnalyticsLogger_logRecategorizationEventForMessages_categoryType_categoryPersistence_isHighImpactFlagChange___block_invoke;
  v17[3] = &unk_1E6C00500;
  id v14 = v10;
  id v18 = v14;
  id v15 = v12;
  id v19 = v15;
  uint64_t v20 = self;
  id v16 = v11;
  BOOL v23 = a6;
  id v21 = v16;
  unint64_t v22 = a4;
  [v13 performBlock:v17];
}

void __125__EDCategoryCoreAnalyticsLogger_logRecategorizationEventForMessages_categoryType_categoryPersistence_isHighImpactFlagChange___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __125__EDCategoryCoreAnalyticsLogger_logRecategorizationEventForMessages_categoryType_categoryPersistence_isHighImpactFlagChange___block_invoke_2;
  v8[3] = &unk_1E6C004D8;
  id v3 = *(void **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = v2;
  int v4 = *(void **)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 48);
  id v5 = v4;
  char v14 = *(unsigned char *)(a1 + 72);
  uint64_t v6 = *(void *)(a1 + 64);
  id v12 = v5;
  uint64_t v13 = v6;
  id v7 = v2;
  [v3 enumerateObjectsUsingBlock:v8];
}

void __125__EDCategoryCoreAnalyticsLogger_logRecategorizationEventForMessages_categoryType_categoryPersistence_isHighImpactFlagChange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 dateReceived];
  int v5 = objc_msgSend(v4, "ef_isLaterThanOrEqualDate:", *(void *)(a1 + 32));

  if (v5)
  {
    uint64_t v6 = *(void **)(a1 + 40);
    id v7 = *(void **)(a1 + 48);
    id v8 = objc_msgSend(*(id *)(a1 + 56), "modelAnalyticsForMessage:", objc_msgSend(v3, "globalMessageID"));
    id v9 = [v7 _convertModelMetadata:v8];
    [v6 addEntriesFromDictionary:v9];

    [*(id *)(a1 + 40) setObject:&unk_1F35BAB80 forKeyedSubscript:@"recategorizationBy"];
    id v10 = [v3 category];
    unsigned int v11 = [v10 isHighImpact];

    if (*(unsigned char *)(a1 + 72)) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = v11;
    }
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "_loggingCategoryTypeFromType:isHighImpact:", *(void *)(a1 + 64), v12));
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:@"currCategoryView"];

    char v14 = NSNumber;
    id v15 = *(void **)(a1 + 48);
    id v16 = [v3 category];
    uint64_t v17 = [v16 type];
    id v18 = [v3 category];
    id v19 = objc_msgSend(v14, "numberWithInteger:", objc_msgSend(v15, "_loggingCategoryTypeFromType:isHighImpact:", v17, objc_msgSend(v18, "isHighImpact")));
    [*(id *)(a1 + 40) setObject:v19 forKeyedSubscript:@"prevCategoryView"];

    uint64_t v20 = objc_msgSend(*(id *)(a1 + 48), "_hashedGlobalMessageId:", objc_msgSend(v3, "globalMessageID"));
    [*(id *)(a1 + 40) setObject:v20 forKeyedSubscript:@"messageId"];

    id v21 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "_accountTypeForMessage:", v3));
    [*(id *)(a1 + 40) setObject:v21 forKeyedSubscript:@"receivingAccountDomain"];

    unint64_t v22 = [v3 account];
    BOOL v23 = [v22 identifier];
    [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:@"accountId"];

    v24 = [*(id *)(a1 + 48) _senderIDFromMessage:v3];
    [*(id *)(a1 + 40) setObject:v24 forKeyedSubscript:@"senderId"];

    uint64_t v25 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v26 = objc_msgSend(v25, "ef_preferredLanguageIdentifier");
    [*(id *)(a1 + 40) setObject:v26 forKeyedSubscript:@"language"];

    v27 = [*(id *)(a1 + 48) _senderDomainFromMessage:v3];
    [*(id *)(a1 + 40) setObject:v27 forKeyedSubscript:@"senderDomain"];

    uint64_t v28 = [*(id *)(a1 + 48) recategorizeBiomeCollector];
    uint64_t v29 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "globalMessageID"));
    [v28 logRecategorizationEventForMessageID:v29 messageDictionary:*(void *)(a1 + 40)];

    v30 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "globalMessageID"));
    [*(id *)(a1 + 40) setObject:v30 forKeyedSubscript:@"unhashedGlobalMessageIDs"];

    v31 = +[EDCategoryCoreAnalyticsLogger log];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v32 = *(void *)(a1 + 40);
      int v33 = 138412290;
      uint64_t v34 = v32;
      _os_log_impl(&dword_1DB39C000, v31, OS_LOG_TYPE_DEFAULT, "Recategorization event: %@", (uint8_t *)&v33, 0xCu);
    }
  }
}

- (void)logReceiveEventForMessagesWithResult:(id)a3
{
  id v4 = a3;
  int v5 = [(EDCategoryCoreAnalyticsLogger *)self analyticsScheduler];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__EDCategoryCoreAnalyticsLogger_logReceiveEventForMessagesWithResult___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  id v6 = v4;
  id v8 = v6;
  id v9 = self;
  [v5 performBlock:v7];
}

void __70__EDCategoryCoreAnalyticsLogger_logReceiveEventForMessagesWithResult___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  id v3 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_dateHoursAgo:", 672);
  id v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __70__EDCategoryCoreAnalyticsLogger_logReceiveEventForMessagesWithResult___block_invoke_2;
  v8[3] = &unk_1E6C00528;
  id v9 = v3;
  id v5 = v2;
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];
}

void __70__EDCategoryCoreAnalyticsLogger_logReceiveEventForMessagesWithResult___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v58 = a3;
  uint64_t v6 = [v5 dateReceived];
  int v7 = objc_msgSend(v6, "ef_isLaterThanOrEqualDate:", *(void *)(a1 + 32));

  if (v7)
  {
    uint64_t v8 = [v58 metadata];
    id v9 = *(void **)(a1 + 40);
    v55 = (void *)v8;
    id v10 = objc_msgSend(*(id *)(a1 + 48), "_modelMetadata:");
    [v9 addEntriesFromDictionary:v10];

    uint64_t v11 = NSNumber;
    uint64_t v12 = *(void **)(a1 + 48);
    uint64_t v13 = [v58 category];
    uint64_t v14 = [v13 subtype];
    id v15 = [v58 category];
    id v16 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "_loggingPredecitedCategoryTypeFromType:isHighImpact:", v14, objc_msgSend(v15, "isHighImpact")));
    [*(id *)(a1 + 40) setObject:v16 forKeyedSubscript:@"predictedCategory"];

    uint64_t v17 = NSNumber;
    id v18 = *(void **)(a1 + 48);
    id v19 = [v58 category];
    uint64_t v20 = [v19 type];
    id v21 = [v58 category];
    unint64_t v22 = objc_msgSend(v17, "numberWithInteger:", objc_msgSend(v18, "_loggingCategoryTypeFromType:isHighImpact:", v20, objc_msgSend(v21, "isHighImpact")));
    [*(id *)(a1 + 40) setObject:v22 forKeyedSubscript:@"currCategoryView"];

    BOOL v23 = objc_msgSend(*(id *)(a1 + 48), "_hashedGlobalMessageId:", objc_msgSend(v5, "globalMessageID"));
    [*(id *)(a1 + 40) setObject:v23 forKeyedSubscript:@"messageId"];

    v24 = [v5 account];
    uint64_t v25 = [v24 identifier];
    [*(id *)(a1 + 40) setObject:v25 forKeyedSubscript:@"accountId"];

    uint64_t v26 = NSNumber;
    v27 = [v5 dateReceived];
    [v27 timeIntervalSince1970];
    uint64_t v28 = objc_msgSend(v26, "numberWithDouble:");
    [*(id *)(a1 + 40) setObject:v28 forKeyedSubscript:@"receivedTimestamp"];

    uint64_t v29 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "_accountTypeForMessage:", v5));
    [*(id *)(a1 + 40) setObject:v29 forKeyedSubscript:@"receivingAccountDomain"];

    v30 = NSNumber;
    v31 = [v5 account];
    uint64_t v32 = [v31 baseAccount];
    int v33 = objc_msgSend(v30, "numberWithBool:", objc_msgSend(v32, "isAppleAccount"));
    [*(id *)(a1 + 40) setObject:v33 forKeyedSubscript:@"hasIcloudAccountEnabled"];

    uint64_t v34 = [v5 account];
    uint64_t v35 = [v34 systemAccount];

    v53 = v35;
    v56 = [v35 accountPropertyForKey:@"kMCCCategoryIsNonPersonalAccountKey"];
    if (v56)
    {
      if ([v56 BOOLValue]) {
        v36 = @"0";
      }
      else {
        v36 = @"1";
      }
      [*(id *)(a1 + 40) setObject:v36 forKeyedSubscript:@"isMailAccountPersonalAccount"];
    }
    v37 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    v57 = [v37 objectForKey:@"BucketBarConfiguration"];
    v38 = [*(id *)(a1 + 48) _isAllInboxesCategoriesEnabled:v37];
    if (v38) {
      [*(id *)(a1 + 40) setObject:v38 forKeyedSubscript:@"isAllInboxesBlackPearlEnabled"];
    }
    v39 = [v5 account];
    v40 = NSString;
    v54 = v39;
    v41 = [v39 accountURL];
    v42 = [v41 absoluteString];
    v43 = [v40 stringWithFormat:@"%@%@", v42, @"INBOX"];

    v44 = [v57 objectForKey:v43];
    if ([v44 BOOLValue]) {
      v45 = @"0";
    }
    else {
      v45 = @"1";
    }
    v46 = v45;

    v47 = +[EDCategoryCoreAnalyticsLogger log];
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v60 = v43;
      __int16 v61 = 2112;
      v62 = v46;
      _os_log_impl(&dword_1DB39C000, v47, OS_LOG_TYPE_DEFAULT, "accountKey: %@, mailAccountInboxesEnabled: %@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) setObject:v46 forKeyedSubscript:@"isMailAccountBlackPearlEnabled"];
    v48 = [*(id *)(a1 + 48) _createMetadataPKWithUserDefaults:v37];
    v49 = [v48 objectForKeyedSubscript:@"metadataPK"];

    v50 = objc_msgSend(v49, "substringFromIndex:", objc_msgSend(v49, "length") - 4);
    [*(id *)(a1 + 40) setObject:v50 forKeyedSubscript:@"metadataPrimaryKey"];
    v51 = [*(id *)(a1 + 48) receiveBiomeCollector];
    v52 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v5, "globalMessageID"));
    [v51 logReceiveEventForMessageID:v52 messageDictionary:*(void *)(a1 + 40)];
  }
}

- (void)logReadEventForMessages:(id)a3 categoryPersistence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1C9C8], "ef_dateHoursAgo:", 672);
  id v9 = [(EDCategoryCoreAnalyticsLogger *)self analyticsScheduler];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__EDCategoryCoreAnalyticsLogger_logReadEventForMessages_categoryPersistence___block_invoke;
  v13[3] = &unk_1E6BFFA78;
  id v10 = v6;
  id v14 = v10;
  id v11 = v8;
  id v15 = v11;
  id v16 = self;
  id v12 = v7;
  id v17 = v12;
  [v9 performBlock:v13];
}

void __77__EDCategoryCoreAnalyticsLogger_logReadEventForMessages_categoryPersistence___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1CA60] dictionary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__EDCategoryCoreAnalyticsLogger_logReadEventForMessages_categoryPersistence___block_invoke_2;
  v6[3] = &unk_1E6C00550;
  id v3 = *(void **)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = v2;
  id v4 = *(void **)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 48);
  id v10 = v4;
  id v5 = v2;
  [v3 enumerateObjectsUsingBlock:v6];
}

void __77__EDCategoryCoreAnalyticsLogger_logReadEventForMessages_categoryPersistence___block_invoke_2(uint64_t a1, void *a2)
{
  id v15 = a2;
  id v3 = [v15 dateReceived];
  int v4 = objc_msgSend(v3, "ef_isLaterThanOrEqualDate:", *(void *)(a1 + 32));

  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    id v7 = objc_msgSend(*(id *)(a1 + 56), "modelAnalyticsForMessage:", objc_msgSend(v15, "globalMessageID"));
    id v8 = [v6 _convertModelMetadata:v7];
    [v5 addEntriesFromDictionary:v8];

    uint64_t v9 = objc_msgSend(*(id *)(a1 + 48), "_hashedGlobalMessageId:", objc_msgSend(v15, "globalMessageID"));
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:@"messageId"];

    id v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 48), "_accountTypeForMessage:", v15));
    [*(id *)(a1 + 40) setObject:v10 forKeyedSubscript:@"receivingAccountDomain"];

    id v11 = [v15 account];
    id v12 = [v11 identifier];
    [*(id *)(a1 + 40) setObject:v12 forKeyedSubscript:@"accountId"];

    uint64_t v13 = [*(id *)(a1 + 48) readBiomeCollector];
    id v14 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "globalMessageID"));
    [v13 logReadEventForMessageID:v14 messageDictionary:*(void *)(a1 + 40)];
  }
}

- (id)_hashedGlobalMessageId:(int64_t)a3
{
  return (id)[MEMORY[0x1E4F60378] randomizedStringForGlobalMessageID:a3];
}

- (int64_t)_accountTypeForMessage:(id)a3
{
  int v4 = [a3 account];
  id v5 = [v4 baseAccount];

  int64_t v6 = [(EDCategoryCoreAnalyticsLogger *)self _accountTypeForAccount:v5];
  return v6;
}

- (int64_t)_accountTypeForAccount:(id)a3
{
  id v3 = a3;
  if ([v3 isAppleAccount])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isGmailAccount])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isYahooAccount])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isExchangeAccount])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isOutlookAccount])
  {
    int64_t v4 = 6;
  }
  else if ([v3 isAOLAccount])
  {
    int64_t v4 = 5;
  }
  else if ([v3 isAppleEmployeeAccount])
  {
    int64_t v4 = 0;
  }
  else
  {
    int64_t v4 = 7;
  }

  return v4;
}

- (id)_senderIDFromMessage:(id)a3
{
  id v4 = a3;
  id v5 = [v4 businessLogoID];
  if (v5)
  {

LABEL_4:
    id v7 = [(EDCategoryCoreAnalyticsLogger *)self _senderAddressFromMessage:v4];
    goto LABEL_5;
  }
  int64_t v6 = [v4 brandIndicatorLocation];

  if (v6) {
    goto LABEL_4;
  }
  id v7 = 0;
LABEL_5:

  return v7;
}

- (id)_senderAddressFromMessage:(id)a3
{
  id v3 = [a3 from];
  id v4 = [v3 firstObject];

  return v4;
}

- (id)_senderDomainFromMessage:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x1E4F607F8]);
  int64_t v6 = [(EDCategoryCoreAnalyticsLogger *)self _senderAddressFromMessage:v4];
  id v7 = (void *)[v5 initWithString:v6];

  id v8 = [v7 domain];

  return v8;
}

- (id)_mailboxFromMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 category];
  char v5 = [v4 isHighImpact];

  if (v5)
  {
    int64_t v6 = @"Inbox";
  }
  else
  {
    id v7 = [v3 category];
    uint64_t v8 = [v7 type];

    if ((unint64_t)(v8 - 1) >= 3)
    {
      uint64_t v9 = [v3 mailbox];
      uint64_t v10 = [v9 type];

      if ((unint64_t)(v10 - 1) >= 7) {
        int64_t v6 = @"Other";
      }
      else {
        int64_t v6 = off_1E6C00630[v10 - 1];
      }
    }
    else
    {
      int64_t v6 = @"BlackPearlMailbox";
    }
  }

  return v6;
}

- (int64_t)_loggingPredecitedCategoryTypeFromType:(unint64_t)a3 isHighImpact:(BOOL)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int64_t result = 0;
  switch(a3)
  {
    case 0uLL:
      return 13;
    case 1uLL:
      return result;
    case 2uLL:
      BOOL v7 = !a4;
      int64_t v8 = 1;
      goto LABEL_11;
    case 3uLL:
      BOOL v7 = !a4;
      int64_t v8 = 3;
      goto LABEL_11;
    case 4uLL:
      BOOL v7 = !a4;
      int64_t v8 = 5;
      goto LABEL_11;
    case 5uLL:
      BOOL v7 = !a4;
      int64_t v8 = 7;
      goto LABEL_11;
    case 6uLL:
      BOOL v7 = !a4;
      int64_t v8 = 9;
LABEL_11:
      if (v7) {
        int64_t result = v8;
      }
      else {
        int64_t result = v8 + 1;
      }
      break;
    case 7uLL:
      int64_t result = 12;
      break;
    case 8uLL:
      if (a4) {
        int64_t result = 14;
      }
      else {
        int64_t result = 11;
      }
      break;
    default:
      int64_t v6 = +[EDCategoryCoreAnalyticsLogger log];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 134217984;
        unint64_t v10 = a3;
        _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "Error: No correct category type to log for %lu", (uint8_t *)&v9, 0xCu);
      }

      break;
  }
  return result;
}

- (int64_t)_loggingCategoryTypeFromType:(unint64_t)a3 isHighImpact:(BOOL)a4
{
  unint64_t v4 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0uLL:
      return v4;
    case 1uLL:
      BOOL v5 = !a4;
      uint64_t v6 = 3;
      uint64_t v7 = 6;
      goto LABEL_7;
    case 2uLL:
      BOOL v5 = !a4;
      uint64_t v6 = 2;
      uint64_t v7 = 5;
LABEL_7:
      if (v5) {
        unint64_t v4 = v6;
      }
      else {
        unint64_t v4 = v7;
      }
      break;
    case 3uLL:
      if (a4) {
        unint64_t v4 = 4;
      }
      else {
        unint64_t v4 = 1;
      }
      break;
    default:
      int64_t v8 = +[EDCategoryCoreAnalyticsLogger log];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 134217984;
        unint64_t v11 = v4;
        _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Error: No correct category type to log for %lu", (uint8_t *)&v10, 0xCu);
      }

      break;
  }
  return v4;
}

- (void)logModelMetadataForMessages:(id)a3 categoryPersistence:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __81__EDCategoryCoreAnalyticsLogger_logModelMetadataForMessages_categoryPersistence___block_invoke;
  v11[3] = &unk_1E6C00578;
  id v12 = v8;
  uint64_t v13 = self;
  id v9 = v7;
  id v14 = v9;
  id v10 = v8;
  [v6 enumerateObjectsUsingBlock:v11];
}

void __81__EDCategoryCoreAnalyticsLogger_logModelMetadataForMessages_categoryPersistence___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = *(void **)(a1 + 32);
  BOOL v5 = *(void **)(a1 + 40);
  id v6 = objc_msgSend(*(id *)(a1 + 48), "modelAnalyticsForMessage:", objc_msgSend(v3, "globalMessageID"));
  id v7 = [v5 _convertModelMetadata:v6];
  [v4 addEntriesFromDictionary:v7];

  int64_t v8 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v3, "globalMessageID"));
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"unhashedGlobalMessageIDs"];

  id v9 = +[EDCategoryCoreAnalyticsLogger log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138412290;
    uint64_t v12 = v10;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Feedback event: %@", (uint8_t *)&v11, 0xCu);
  }
}

- (double)_calculateScheduleDeltaFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  unint64_t v4 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  BOOL v5 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  [v5 setTimeZone:v4];
  id v6 = [v5 components:224 fromDate:v3];
  int v7 = [v6 hour];
  int v8 = [v6 minute];
  int v9 = [v6 second];
  if ([v6 hour] <= 22 && objc_msgSend(v6, "hour") >= 5)
  {
    if ([v6 hour] >= 11)
    {
      if ([v6 hour] >= 17) {
        int v10 = 82800;
      }
      else {
        int v10 = 61200;
      }
    }
    else
    {
      int v10 = 39600;
    }
  }
  else
  {
    int v10 = 18000;
  }
  if ([v6 hour] <= 22) {
    int v11 = 0;
  }
  else {
    int v11 = 86400;
  }
  uint64_t v12 = +[EDCategoryCoreAnalyticsLogger log];
  int v13 = v10 + -3600 * v7 - 60 * v8 - v9 + v11;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218752;
    uint64_t v16 = [v6 hour];
    __int16 v17 = 2048;
    uint64_t v18 = [v6 minute];
    __int16 v19 = 2048;
    uint64_t v20 = [v6 second];
    __int16 v21 = 2048;
    uint64_t v22 = v13;
    _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Scheduling analytics task: datetimeNow = {%ld:%ld:%ld}, scheduleAfter = %ld", (uint8_t *)&v15, 0x2Au);
  }

  return (double)v13;
}

- (double)_calculateBiomeETLToCAScheduleDeltaFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  BOOL v5 = (void *)[v4 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v6 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  [v5 setTimeZone:v6];

  int v7 = [v5 components:224 fromDate:v3];
  int v8 = [v7 hour];
  int v9 = [v7 minute];
  int v10 = [v7 second];
  if ([v7 hour] <= 22) {
    int v11 = 82800;
  }
  else {
    int v11 = 169200;
  }
  uint64_t v12 = +[EDCategoryCoreAnalyticsLogger log];
  int v13 = v11 - v10 - (3600 * v8 + 60 * v9);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134218752;
    uint64_t v16 = [v7 hour];
    __int16 v17 = 2048;
    uint64_t v18 = [v7 minute];
    __int16 v19 = 2048;
    uint64_t v20 = [v7 second];
    __int16 v21 = 2048;
    uint64_t v22 = v13;
    _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "Scheduling Biome ETL-To-CA analytics task: datetimeNow = {%ld:%ld:%ld}, scheduleAfter = %ld", (uint8_t *)&v15, 0x2Au);
  }

  return (double)v13;
}

- (void)scheduleNextBiomeETLToCAScheduleBackgroundTask
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(&dword_1DB39C000, v0, OS_LOG_TYPE_DEBUG, "Analytics Biome ETL-To-CA task %@ exists, cancelling it", v1, 0xCu);
}

- (void)scheduleNextAnalyticsBackgroundTask
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(&dword_1DB39C000, v0, OS_LOG_TYPE_DEBUG, "Analytics task %@ exists, cancelling it", v1, 0xCu);
}

- (void)processCoreAnalyticsEvents
{
  v6[1] = *MEMORY[0x1E4F143B8];
  BOOL v5 = @"EDClientStateForegroundStateDidChangeKeyIsScheduled";
  v6[0] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"EDClientStateForegroundStateDidChange" object:self userInfo:v3];

  [(EDCategoryCoreAnalyticsLogger *)self _logAccountPersonalPreference];
}

- (void)etlFromBiomeToCA
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = NSNumber;
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  [v4 timeIntervalSince1970];
  id v6 = [v3 numberWithUnsignedLongLong:(unint64_t)v5];

  int v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v6, "unsignedLongLongValue") - 86400);
  int v8 = +[EDCategoryCoreAnalyticsLogger log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v30 = (uint64_t)v7;
    __int16 v31 = 2112;
    uint64_t v32 = v6;
    _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "Biome ETL-To-CA Before Query: startTS: %@, endTS: %@", buf, 0x16u);
  }

  int v9 = +[EDClientState sharedInstance];
  char v10 = [v9 isForeground];

  if ((v10 & 1) == 0)
  {
    int v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    uint64_t v12 = [v11 valueForKey:*MEMORY[0x1E4F60120]];
    int v13 = v12;
    if (v12)
    {
      id v14 = v12;

      int v15 = +[EDCategoryCoreAnalyticsLogger log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v30 = (uint64_t)v14;
        uint64_t v16 = "Biome ETL-To-CA Before Query: replaced endTS from user defaults lastForegroundedTimestamps: %@";
        __int16 v17 = v15;
        uint32_t v18 = 12;
LABEL_9:
        _os_log_impl(&dword_1DB39C000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
    else
    {

      int v15 = +[EDCategoryCoreAnalyticsLogger log];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v16 = "Biome ETL-To-CA Before Query: replaced endTS with 0";
        __int16 v17 = v15;
        uint32_t v18 = 2;
        goto LABEL_9;
      }
    }

    id v6 = v13;
  }
  unint64_t v19 = [v7 unsignedLongLongValue];
  if (v19 < [v6 unsignedLongLongValue])
  {
    uint64_t v20 = [(EDCategoryCoreAnalyticsLogger *)self biomeFedStatsCollector];
    __int16 v21 = [(EDCategoryCoreAnalyticsLogger *)self setOfBlackPearlEnabledAccoutIdentifier];
    uint64_t v22 = [v20 queryMessageGrainEvents:v7 endingAt:v6 andBPEnabledAccounts:v21];

    if (v22)
    {
      uint64_t v23 = +[EDCategoryCoreAnalyticsLogger log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v24 = [v22 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v30 = v24;
        uint64_t v25 = "Biome ETL-To-CA After Query: rowCount %lu";
        uint64_t v26 = v23;
        uint32_t v27 = 12;
LABEL_17:
        _os_log_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
      }
    }
    else
    {
      uint64_t v23 = +[EDCategoryCoreAnalyticsLogger log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        uint64_t v25 = "Biome ETL-To-CA After Query: messageGrains=nil";
        uint64_t v26 = v23;
        uint32_t v27 = 2;
        goto LABEL_17;
      }
    }

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __49__EDCategoryCoreAnalyticsLogger_etlFromBiomeToCA__block_invoke;
    v28[3] = &unk_1E6C005C8;
    v28[4] = self;
    [v22 enumerateObjectsUsingBlock:v28];
  }
}

void __49__EDCategoryCoreAnalyticsLogger_etlFromBiomeToCA__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_new();
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __49__EDCategoryCoreAnalyticsLogger_etlFromBiomeToCA__block_invoke_2;
  int v13 = &unk_1E6C005A0;
  id v5 = v4;
  uint64_t v6 = *(void *)(a1 + 32);
  id v14 = v5;
  uint64_t v15 = v6;
  [v3 enumerateKeysAndObjectsUsingBlock:&v10];
  id v7 = objc_alloc(MEMORY[0x1E4F60260]);
  int v8 = objc_msgSend(v7, "initWithEventName:collectionData:", @"com.apple.mail.categorization.message.sampled", v5, v10, v11, v12, v13);
  int v9 = [*(id *)(a1 + 32) analyticsCollector];
  [v9 logOneTimeEvent:v8];
}

void __49__EDCategoryCoreAnalyticsLogger_etlFromBiomeToCA__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  int v6 = [@"messageId" isEqual:v8] ^ 1;
  if (!v5) {
    LOBYTE(v6) = 1;
  }
  if (v6)
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v8];
  }
  else
  {
    id v7 = objc_msgSend(*(id *)(a1 + 40), "_hashedGlobalMessageId:", objc_msgSend(v5, "unsignedIntValue"));
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

- (void)_logAccountPersonalPreference
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%d", -[EDCategoryCoreAnalyticsLogger _hourInUTC](self, "_hourInUTC"));
  uint64_t v22 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  uint64_t v23 = [v22 objectForKey:@"BucketBarConfiguration"];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(EDCategoryCoreAnalyticsLogger *)self accounts];
  uint64_t v2 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v30 != v3) {
          objc_enumerationMutation(obj);
        }
        id v5 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v5 conformsToProtocol:&unk_1F35FE498])
        {
          id v6 = v5;
          if (([v6 isLocalAccount] & 1) == 0 && objc_msgSend(v6, "isActive"))
          {
            id v7 = objc_opt_new();
            [v7 setObject:v24 forKey:@"scheduledHour"];
            uint32_t v27 = [v6 systemAccount];
            uint64_t v26 = [v27 accountPropertyForKey:@"kMCCCategoryIsNonPersonalAccountKey"];
            if (v26)
            {
              if ([v26 BOOLValue]) {
                id v8 = @"0";
              }
              else {
                id v8 = @"1";
              }
              [v7 setObject:v8 forKey:@"isMailAccountPersonalAccount"];
            }
            int v9 = (void *)[objc_alloc(MEMORY[0x1E4F607B0]) initWithSystemAccount:v27];
            uint64_t v10 = objc_msgSend(NSNumber, "numberWithInteger:", -[EDCategoryCoreAnalyticsLogger _accountTypeForAccount:](self, "_accountTypeForAccount:", v9));
            [v7 setObject:v10 forKeyedSubscript:@"receivingAccountDomain"];

            uint64_t v11 = NSString;
            uint64_t v12 = [v6 accountURL];
            int v13 = [v12 absoluteString];
            id v14 = [v11 stringWithFormat:@"%@%@", v13, @"INBOX"];

            uint64_t v15 = [v23 objectForKey:v14];
            int v16 = [v15 BOOLValue];
            __int16 v17 = @"1";
            if (v16) {
              __int16 v17 = @"0";
            }
            uint32_t v18 = v17;

            unint64_t v19 = +[EDCategoryCoreAnalyticsLogger log];
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v34 = v14;
              __int16 v35 = 2112;
              v36 = v18;
              _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "accountKey: %@, mailAccountInboxesEnabled: %@", buf, 0x16u);
            }

            [v7 setObject:v18 forKey:@"isMailAccountBlackPearlEnabled"];
            uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F60260]) initWithEventName:@"com.apple.mail.categorization.account.preference" collectionData:v7];
            __int16 v21 = [(EDCategoryCoreAnalyticsLogger *)self analyticsCollector];
            [v21 logOneTimeEvent:v20];
          }
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v2);
  }
}

- (id)_blackPearlEnabledAccounts
{
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v4 = [v3 objectForKey:@"BucketBarConfiguration"];
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  id v6 = [v4 allKeys];
  id v7 = [v5 setWithArray:v6];

  id v8 = [(EDCategoryCoreAnalyticsLogger *)self accounts];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  int v16 = __59__EDCategoryCoreAnalyticsLogger__blackPearlEnabledAccounts__block_invoke;
  __int16 v17 = &unk_1E6C005F0;
  id v9 = v4;
  id v18 = v9;
  id v10 = v7;
  id v19 = v10;
  uint64_t v11 = objc_msgSend(v8, "ef_filter:", &v14);

  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", v11, v14, v15, v16, v17);

  return v12;
}

uint64_t __59__EDCategoryCoreAnalyticsLogger__blackPearlEnabledAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isActive]
    && [v3 conformsToProtocol:&unk_1F35FE498])
  {
    id v4 = v3;
    if ([v4 isLocalAccount])
    {
      uint64_t v5 = 0;
    }
    else
    {
      id v6 = NSString;
      id v7 = [v4 accountURL];
      uint64_t v8 = [v7 absoluteString];
      id v9 = [v6 stringWithFormat:@"%@%@", v8, @"INBOX"];

      id v10 = [*(id *)(a1 + 32) objectForKey:v9];
      LOBYTE(v8) = [v10 BOOLValue];

      if (v8) {
        uint64_t v5 = 0;
      }
      else {
        uint64_t v5 = [*(id *)(a1 + 40) containsObject:v9];
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)setOfBlackPearlEnabledAccoutIdentifier
{
  uint64_t v2 = [(EDCategoryCoreAnalyticsLogger *)self _blackPearlEnabledAccounts];
  id v3 = objc_msgSend(v2, "ef_compactMap:", &__block_literal_global_10);

  return v3;
}

id __71__EDCategoryCoreAnalyticsLogger_setOfBlackPearlEnabledAccoutIdentifier__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = NSString;
  id v3 = [a2 identifier];
  id v4 = [v2 stringWithFormat:@"'%@'", v3];

  return v4;
}

- (EDBiomeBlackPearlLogger)biomeCollector
{
  return self->_biomeCollector;
}

- (void)setBiomeCollector:(id)a3
{
}

- (EDBiomeBlackPearlLogger)receiveBiomeCollector
{
  return self->_receiveBiomeCollector;
}

- (void)setReceiveBiomeCollector:(id)a3
{
}

- (EDBiomeBlackPearlLogger)readBiomeCollector
{
  return self->_readBiomeCollector;
}

- (void)setReadBiomeCollector:(id)a3
{
}

- (EDBiomeBlackPearlLogger)recategorizeBiomeCollector
{
  return self->_recategorizeBiomeCollector;
}

- (void)setRecategorizeBiomeCollector:(id)a3
{
}

- (void)setAccounts:(id)a3
{
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (void)setAccountsProvider:(id)a3
{
}

- (EMCoreAnalyticsCollector)analyticsCollector
{
  return self->_analyticsCollector;
}

- (void)setAnalyticsCollector:(id)a3
{
}

- (EFScheduler)analyticsScheduler
{
  return self->_analyticsScheduler;
}

- (EDBiomeBlackPearlLogger)biomeFedStatsCollector
{
  return self->_biomeFedStatsCollector;
}

- (void)setBiomeFedStatsCollector:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeFedStatsCollector, 0);
  objc_storeStrong((id *)&self->_analyticsScheduler, 0);
  objc_storeStrong((id *)&self->_analyticsCollector, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_recategorizeBiomeCollector, 0);
  objc_storeStrong((id *)&self->_readBiomeCollector, 0);
  objc_storeStrong((id *)&self->_receiveBiomeCollector, 0);

  objc_storeStrong((id *)&self->_biomeCollector, 0);
}

- (void)_modelMetadata:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "MEMessageCategorizationResultMetadata is nil, returning default values", v1, 2u);
}

- (void)_convertModelMetadata:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Metadata dictionary is nil, returning default values", v1, 2u);
}

void __86__EDCategoryCoreAnalyticsLogger__sendCategorizationAnalyticsForAppLaunchNotification___block_invoke_cold_1(char a1, char a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109376;
  v3[1] = a1 & 1;
  __int16 v4 = 1024;
  int v5 = a2 & 1;
  _os_log_debug_impl(&dword_1DB39C000, log, OS_LOG_TYPE_DEBUG, "Core Analytics processing [foreground=%d] [scheduled=%d]", (uint8_t *)v3, 0xEu);
}

@end