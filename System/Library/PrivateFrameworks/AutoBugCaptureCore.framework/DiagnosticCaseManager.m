@interface DiagnosticCaseManager
+ (BOOL)isException:(id)a3 containedInString:(id)a4;
+ (BOOL)isString:(id)a3 inExceptionList:(id)a4;
+ (int)symptomDiagnosticErrorForDiagnosticCaseDampeningType:(signed __int16)a3;
- (ABCConfigurationManager)configManager;
- (BOOL)allowDampeningExceptionFor:(id)a3;
- (BOOL)closeCase:(id)a3;
- (BOOL)disableDampening;
- (BOOL)finalizeDiagnosticCaseWithId:(id)a3 closureType:(signed __int16)a4 onlyIfReady:(BOOL)a5;
- (BOOL)hasOpenCases;
- (BOOL)isAdmissible:(id)a3 dampenedBy:(signed __int16 *)a4;
- (BOOL)isAllowedTransientException:(id)a3;
- (BOOL)requestReportGenerator:(id)a3 options:(id)a4;
- (BOOL)sendReportsForCase:(id)a3;
- (BOOL)statisticsRowForDiagnosticCase:(id)a3 matchesWith:(id)a4;
- (DiagnosticCaseManager)initWithWorkspace:(id)a3 liaison:(id)a4;
- (DiagnosticCaseManagerStorageDelegate)storageDelegate;
- (DiagnosticLiaison)liaison;
- (DiagnosticStatisticsManager)statsManager;
- (DiagnosticsController)diagnosticsController;
- (NSMutableArray)activeCases;
- (NSMutableArray)totalCases;
- (NSMutableDictionary)reportGenerators;
- (OS_dispatch_queue)queue;
- (id)_predicatesForCasesMatchingDomain:(id)a3 type:(id)a4 subtype:(id)a5 process:(id)a6 withinLast:(double)a7;
- (id)_updateSignatureWithBuildVariantInfoAndFlags:(id)a3;
- (id)caseStorageAnalytics;
- (id)caseStorageForCaseID:(id)a3;
- (id)caseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5;
- (id)caseSummariesWithIdentifiers:(id)a3;
- (id)casesDiagnosedInTheLast:(double)a3 from:(double)a4 matchingDomain:(id)a5;
- (id)casesMatchingDomain:(id)a3 type:(id)a4 subtype:(id)a5 process:(id)a6 withinLast:(double)a7;
- (id)createDiagnosticCaseWithSignature:(id)a3 flags:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7;
- (id)createTemporaryDiagnosticCaseStorageForUUID:(id)a3;
- (id)diagnosticCaseDictionariesFromIdentifier:(id)a3 withEvents:(BOOL)a4 count:(unint64_t)a5;
- (id)diagnosticCaseWithId:(id)a3;
- (id)lookUpDiagnosticCaseStorageForUUID:(id)a3;
- (id)responseDictWithSuccess:(BOOL)a3 sessionId:(id)a4 reasonCode:(int64_t)a5;
- (int)addSignatureContentToCaseWithId:(id)a3 key:(id)a4 content:(id)a5;
- (int)addToCaseWithId:(id)a3 events:(id)a4 payload:(id)a5;
- (int)cancelCaseWithId:(id)a3;
- (int64_t)dailyCountLimitForDomain:(id)a3 type:(id)a4 subtype:(id)a5 domainPredicates:(id)a6;
- (unint64_t)_processProbeActions:(id)a3 session:(id)a4;
- (unint64_t)collectDiagnosticExtensionLogsWithParameters:(id)a3 options:(id)a4 diagCase:(id)a5 reply:(id)a6;
- (unsigned)avgCasesPerDay;
- (unsigned)dampeningFactorForSignature:(id)a3 caseTime:(id)a4 limit:(int64_t)a5;
- (unsigned)defaultDampeningFactorForSignature:(id)a3 limit:(int64_t)a4;
- (void)_forceCloseDiagnosticCaseStorage;
- (void)_processActionsForPacketCaptureProbe:(id)a3 session:(id)a4;
- (void)_processRemoteIDSTriggers:(id)a3 validFor:(double)a4 signature:(id)a5 sessionID:(id)a6 reply:(id)a7;
- (void)_processReportActions:(id)a3 session:(id)a4;
- (void)_saveAllCases;
- (void)_updateCaseStatisticsWithCase:(id)a3;
- (void)addCaseReportOutlet:(id)a3;
- (void)addSignatureContentForSession:(id)a3 key:(id)a4 content:(id)a5 reply:(id)a6;
- (void)addToInternalStateDictionary:(id)a3;
- (void)addToSession:(id)a3 event:(id)a4 payload:(id)a5 queue:(id)a6 reply:(id)a7;
- (void)addToSession:(id)a3 events:(id)a4 payload:(id)a5 queue:(id)a6 reply:(id)a7;
- (void)addToSession:(id)a3 events:(id)a4 payload:(id)a5 reply:(id)a6;
- (void)addTransactionForCaseID:(id)a3;
- (void)buildSpecificRestrictionsForSignature:(id)a3 result:(id)a4;
- (void)cancelProbesForSession:(id)a3;
- (void)cancelSessionWithIdentifier:(id)a3;
- (void)caseAllowanceForSignature:(id)a3 timestamp:(id)a4 result:(id)a5;
- (void)configureWithWorkspace:(id)a3;
- (void)countOfCasesMatchingDomain:(id)a3 type:(id)a4 subtype:(id)a5 process:(id)a6 groupCaseIDIsPresent:(BOOL)a7 withinLast:(double)a8 reply:(id)a9;
- (void)endSession:(id)a3 forced:(BOOL)a4 onlyIfReady:(BOOL)a5;
- (void)endSessionIfProbesCompletedFor:(id)a3;
- (void)endSessionWithIdentifier:(id)a3 forced:(BOOL)a4;
- (void)endSessionWithIdentifier:(id)a3 forced:(BOOL)a4 onlyIfReady:(BOOL)a5;
- (void)endSessions:(id)a3 forced:(BOOL)a4;
- (void)forceCloseDiagnosticCaseStorage;
- (void)getHistoricalDiagnosicCaseDictionaryFromIdentifier:(id)a3 withEvents:(BOOL)a4 count:(unint64_t)a5 reply:(id)a6;
- (void)listCaseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5 reply:(id)a6;
- (void)listCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4;
- (void)payloadsForSignatures:(id)a3 reply:(id)a4;
- (void)periodicSessionManagement;
- (void)postProcessActionsForClosedCase:(id)a3;
- (void)promoteTemporaryCase:(id)a3;
- (void)recordDiagnosticCaseSummaryForCase:(id)a3;
- (void)remoteTriggerDeliveryUpdateEvent:(id)a3;
- (void)removeAllCases;
- (void)removeCaseStorageWithID:(id)a3;
- (void)removeClosedCasesFromTotalCases;
- (void)removeTransactionForCaseID:(id)a3;
- (void)removeTransientCasesWithSignature:(id)a3 beforeTime:(double)a4;
- (void)reportGeneratorEnded:(id)a3 reportInfo:(id)a4 error:(id)a5;
- (void)requestGroupCaseIdentifierForSignature:(id)a3 reply:(id)a4;
- (void)requestSnapshotWithSignature:(id)a3 flags:(unint64_t)a4 events:(id)a5;
- (void)resetAll;
- (void)resetAllForCustomerBuilds;
- (void)resetDiagnosticCaseStorage;
- (void)saveAllCases;
- (void)setAvgCasesPerDay:(unsigned int)a3;
- (void)setStorageDelegate:(id)a3;
- (void)setUpGeneralCaseReportGenerators;
- (void)shutdown;
- (void)startCollectingNextReportForDiagnosticCase:(id)a3;
- (void)startPacketCaptureForSession:(id)a3 duration:(id)a4;
- (void)startPeriodicTimer;
- (void)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 triggerRemote:(BOOL)a7 queue:(id)a8 reply:(id)a9;
- (void)startSessionWithSignature:(id)a3 flags:(unint64_t)a4 preferredTimeout:(double)a5 events:(id)a6 payload:(id)a7 actions:(id)a8 reply:(id)a9;
- (void)stopPeriodicTimer;
- (void)updateAverageCasesPerDay;
- (void)updateSignatureWithBundleIdentifier:(id)a3 reply:(id)a4;
@end

@implementation DiagnosticCaseManager

+ (int)symptomDiagnosticErrorForDiagnosticCaseDampeningType:(signed __int16)a3
{
  uint64_t v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = a3 + 2;
  if (v4 >= 0xB)
  {
    v6 = casemanagementLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = +[DiagnosticCase descriptionForDampeningType:v3];
      int v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_INFO, "Unrecognized dampeningType value: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    v5 = &kSymptomDiagnosticErrorNotSupported;
  }
  else
  {
    v5 = (int *)*(&off_263FC42C0 + v4);
  }
  return *v5;
}

- (DiagnosticCaseManager)initWithWorkspace:(id)a3 liaison:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)DiagnosticCaseManager;
  v8 = [(DiagnosticCaseManager *)&v33 init];
  if (v8)
  {
    int v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    activeCases = v8->_activeCases;
    v8->_activeCases = v9;

    uint64_t v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    totalCases = v8->_totalCases;
    v8->_totalCases = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pendingStatisticsUpdateCases = v8->_pendingStatisticsUpdateCases;
    v8->_pendingStatisticsUpdateCases = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    reportGenerators = v8->_reportGenerators;
    v8->_reportGenerators = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    reportOutlets = v8->_reportOutlets;
    v8->_reportOutlets = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    requestedReportGenerators = v8->_requestedReportGenerators;
    v8->_requestedReportGenerators = v19;

    uint64_t v21 = [MEMORY[0x263EFF9A0] dictionary];
    activeProbes = v8->activeProbes;
    v8->activeProbes = (NSMutableDictionary *)v21;

    objc_storeStrong((id *)&v8->_liaison, a4);
    [(DiagnosticLiaison *)v8->_liaison setDelegate:v8];
    v23 = casemanagementLogHandle();
    +[CaseDampeningExceptions setLoggingHandle:v23];

    v24 = +[SystemProperties sharedInstance];
    +[CaseDampeningExceptions setNPIDevice:](CaseDampeningExceptions, "setNPIDevice:", [v24 npiDevice]);

    v25 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v26 = dispatch_queue_create("com.apple.autobugcapture.diagnosticCaseManagement", v25);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v26;

    v28 = v8->_queue;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __51__DiagnosticCaseManager_initWithWorkspace_liaison___block_invoke;
    v30[3] = &unk_263FC3430;
    v31 = v8;
    id v32 = v6;
    dispatch_async(v28, v30);
  }
  return v8;
}

uint64_t __51__DiagnosticCaseManager_initWithWorkspace_liaison___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) configureWithWorkspace:*(void *)(a1 + 40)];
}

- (void)configureWithWorkspace:(id)a3
{
  uint64_t v4 = (AnalyticsWorkspace *)[a3 copy];
  workspace = self->_workspace;
  self->_workspace = v4;

  id v6 = [[DiagnosticCaseStorageAnalytics alloc] initWithWorkspace:self->_workspace withCache:0];
  caseStorageAnalytics = self->_caseStorageAnalytics;
  self->_caseStorageAnalytics = v6;

  v8 = [[DiagnosticCaseSummaryAnalytics alloc] initWithWorkspace:self->_workspace withCache:0];
  caseSummaryAnalytics = self->_caseSummaryAnalytics;
  self->_caseSummaryAnalytics = v8;

  v10 = [[DiagnosticStatisticsManager alloc] initWithWorkspace:self->_workspace queue:self->_queue];
  statsManager = self->_statsManager;
  self->_statsManager = v10;

  v12 = [(DiagnosticCaseManager *)self configManager];
  int v13 = [v12 autoBugCaptureSignature];

  if (v13)
  {
    v14 = objc_alloc_init(CoreAnalyticsReportOutlet);
    [(DiagnosticCaseManager *)self addCaseReportOutlet:v14];
  }
  v15 = [(DiagnosticCaseManager *)self configManager];
  int v16 = [v15 autoBugCaptureRegularPayloads];

  if (v16)
  {
    v17 = objc_alloc_init(DiagnosticPipelineOutlet);
    [(DiagnosticCaseManager *)self addCaseReportOutlet:v17];
  }

  [(DiagnosticCaseManager *)self setUpGeneralCaseReportGenerators];
}

- (void)addToInternalStateDictionary:(id)a3
{
  uint64_t v4 = NSNumber;
  id v5 = a3;
  id v6 = objc_msgSend(v4, "numberWithBool:", -[DiagnosticCaseManager hasOpenCases](self, "hasOpenCases"));
  [v5 setObject:v6 forKeyedSubscript:@"hasOpenCases"];

  id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[DiagnosticCaseManager avgCasesPerDay](self, "avgCasesPerDay"));
  [v5 setObject:v7 forKeyedSubscript:@"avgCasesPerDay"];

  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  reportOutlets = self->_reportOutlets;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __54__DiagnosticCaseManager_addToInternalStateDictionary___block_invoke;
  v12[3] = &unk_263FC3D88;
  id v13 = v8;
  id v10 = v8;
  [(NSMutableSet *)reportOutlets enumerateObjectsUsingBlock:v12];
  uint64_t v11 = [v10 componentsJoinedByString:@", "];
  [v5 setObject:v11 forKeyedSubscript:@"reportOutlets"];
}

void __54__DiagnosticCaseManager_addToInternalStateDictionary___block_invoke(uint64_t a1)
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) addObject:v3];
}

- (BOOL)disableDampening
{
  v2 = [(DiagnosticCaseManager *)self configManager];
  char v3 = [v2 arbitratorDisableDampening];

  return v3;
}

- (int64_t)dailyCountLimitForDomain:(id)a3 type:(id)a4 subtype:(id)a5 domainPredicates:(id)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v10 isEqualToString:@"UIPerformance"])
  {
    v14 = casemanagementLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v25 = 10;
      __int16 v26 = 2112;
      v27 = @"UIPerformance";
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEFAULT, " Applying daily case limit of %ld for %@ domain", buf, 0x16u);
    }

    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseDomain == %@", @"UIPerformance"];
    int64_t v16 = 10;
  }
  else if ([v10 isEqualToString:@"Performance"])
  {
    v17 = casemanagementLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v25 = 7;
      __int16 v26 = 2112;
      v27 = @"Performance";
      _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEFAULT, " Applying daily case limit of %ld for %@ domain", buf, 0x16u);
    }

    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseDomain == %@", @"Performance"];
    int64_t v16 = 7;
  }
  else if ([v10 isEqualToString:@"Responsiveness"] {
         && [v11 isEqualToString:@"CoreAnimation"]
  }
         && [v12 isEqualToString:@"Stall Tailspin"])
  {
    v18 = casemanagementLogHandle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v25 = 3;
      __int16 v26 = 2112;
      v27 = @"Responsiveness";
      __int16 v28 = 2112;
      v29 = @"CoreAnimation";
      __int16 v30 = 2112;
      v31 = @"Stall Tailspin";
      _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEFAULT, " Applying daily case limit of %ld for %@/%@/%@", buf, 0x2Au);
    }

    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseDomain == %@ AND caseType == %@ AND caseSubtype == %@", @"Responsiveness", @"CoreAnimation", @"Stall Tailspin"];
    int64_t v16 = 3;
  }
  else
  {
    v19 = [(DiagnosticCaseManager *)self configManager];
    int64_t v16 = [v19 arbitratorDailyCountLimit];

    v20 = casemanagementLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v16;
      _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_DEFAULT, " Applying default daily case limit of %ld", buf, 0xCu);
    }

    uint64_t v21 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseDomain != %@", @"UIPerformance"];
    [v13 addObject:v21];

    v22 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseDomain != %@", @"Performance"];
    [v13 addObject:v22];

    v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseDomain != %@ AND caseType != %@ AND caseSubtype != %@", @"Responsiveness", @"CoreAnimation", @"Stall Tailspin"];
  }
  [v13 addObject:v15];

  return v16;
}

- (DiagnosticsController)diagnosticsController
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  diagnosticsController = self->_diagnosticsController;
  if (!diagnosticsController)
  {
    uint64_t v4 = [(DiagnosticCaseManager *)self configManager];
    id v5 = [v4 defaultDiagnosticActions];

    if (v5)
    {
      id v6 = casemanagementLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138412290;
        id v11 = v5;
        _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEFAULT, "default actions: %@", (uint8_t *)&v10, 0xCu);
      }

      id v7 = [[DiagnosticsController alloc] initWithConfiguration:v5];
      id v8 = self->_diagnosticsController;
      self->_diagnosticsController = v7;
    }
    diagnosticsController = self->_diagnosticsController;
  }

  return diagnosticsController;
}

- (ABCConfigurationManager)configManager
{
  v2 = +[ABCAdministrator sharedInstance];
  char v3 = [v2 configurationManager];

  return (ABCConfigurationManager *)v3;
}

- (id)caseStorageAnalytics
{
  return self->_caseStorageAnalytics;
}

- (void)saveAllCases
{
  char v3 = [(DiagnosticCaseManager *)self queue];

  if (v3)
  {
    int64_t saveCount = self->_saveCount;
    self->_int64_t saveCount = saveCount + 1;
    if (!saveCount)
    {
      dispatch_time_t v5 = dispatch_time(0, 3000000000);
      id v6 = [(DiagnosticCaseManager *)self queue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __37__DiagnosticCaseManager_saveAllCases__block_invoke;
      block[3] = &unk_263FC2DC0;
      block[4] = self;
      dispatch_after(v5, v6, block);
    }
  }
  else
  {
    [(DiagnosticCaseManager *)self _saveAllCases];
  }
}

uint64_t __37__DiagnosticCaseManager_saveAllCases__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _saveAllCases];
  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  return result;
}

- (void)_saveAllCases
{
  char v3 = casemanagementLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEBUG, "Saving all cases to storage.", buf, 2u);
  }

  [(NSMutableArray *)self->_totalCases enumerateObjectsUsingBlock:&__block_literal_global_13];
  [(DiagnosticCaseManager *)self removeClosedCasesFromTotalCases];
  [(AnalyticsWorkspace *)self->_workspace save];
  if (![(NSMutableArray *)self->_totalCases count] && self->_shouldPurgeStorageAfterSave)
  {
    uint64_t v4 = casemanagementLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEBUG, "No active cases remain", v8, 2u);
    }

    dispatch_time_t v5 = casemanagementLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEBUG, "Requesting purge of attachments to meet disk usage limits", v7, 2u);
    }

    id v6 = [(DiagnosticCaseManager *)self storageDelegate];
    if (objc_opt_respondsToSelector()) {
      [v6 didSaveDiagnosticCases];
    }
    self->_shouldPurgeStorageAfterSave = 0;
  }
}

uint64_t __38__DiagnosticCaseManager__saveAllCases__block_invoke(uint64_t a1, void *a2)
{
  return [a2 prepareForSaving];
}

- (void)removeClosedCasesFromTotalCases
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(NSMutableArray *)self->_totalCases count])
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v4 = self->_totalCases;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          int v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
          if (objc_msgSend(v9, "caseState", (void)v10) == 6) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }

    [(NSMutableArray *)self->_totalCases removeObjectsInArray:v3];
  }
}

- (void)removeTransientCasesWithSignature:(id)a3 beforeTime:(double)a4
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (a4 <= 100000000.0)
  {
    uint64_t v7 = casemanagementLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      double v32 = a4;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "Invalid timestamp (%.0lf) passed to removeTransientCasesWithSignature:beforeTime:", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v8 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:a4];
    int v9 = [v6 objectForKeyedSubscript:@"domain"];
    long long v10 = [v6 objectForKeyedSubscript:@"type"];
    long long v11 = [v6 objectForKeyedSubscript:@"subtype"];
    long long v12 = [v6 objectForKeyedSubscript:@"detected"];
    v27 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K == %d", @"caseDampeningType", 0xFFFFFFFFLL);
    -[NSObject addObject:](v7, "addObject:");
    __int16 v28 = (void *)v8;
    uint64_t v24 = v8;
    long long v13 = v9;
    __int16 v26 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K < %@", @"timeStamp", v24];
    -[NSObject addObject:](v7, "addObject:");
    if ([v9 length])
    {
      v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"caseDomain", v9];
      [v7 addObject:v14];

      long long v13 = v9;
    }
    if ([v10 length])
    {
      uint64_t v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"caseType", v10];
      [v7 addObject:v15];

      long long v13 = v9;
    }
    if ([v11 length])
    {
      int64_t v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"caseSubtype", v11];
      [v7 addObject:v16];

      long long v13 = v9;
    }
    if ([v12 length])
    {
      v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"caseDetectedProcess", v12];
      [v7 addObject:v17];

      long long v13 = v9;
    }
    if ((unint64_t)[v7 count] >= 5)
    {
      v18 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v7];
      v19 = [(ObjectAnalytics *)self->_caseStorageAnalytics fetchEntitiesFreeForm:v18 sortDesc:0];
      if ([v19 count])
      {
        uint64_t v25 = [(DiagnosticCaseManager *)self storageDelegate];
        if (objc_opt_respondsToSelector())
        {
          id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
          v29[0] = MEMORY[0x263EF8330];
          v29[1] = 3221225472;
          v29[2] = __70__DiagnosticCaseManager_removeTransientCasesWithSignature_beforeTime___block_invoke;
          v29[3] = &unk_263FC3DD0;
          id v30 = v20;
          id v21 = v20;
          [v19 enumerateObjectsUsingBlock:v29];
          [v25 purgeAttachmentsAtPaths:v21];
        }
        int64_t v22 = [(ObjectAnalytics *)self->_caseStorageAnalytics removeEntitiesMatching:v18];
        v23 = casemanagementLogHandle();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218242;
          double v32 = *(double *)&v22;
          __int16 v33 = 2112;
          v34 = v18;
          _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_INFO, "Removed %ld transient cases matching %@", buf, 0x16u);
        }
      }
      long long v13 = v9;
    }
  }
}

void __70__DiagnosticCaseManager_removeTransientCasesWithSignature_beforeTime___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 caseAttachments];
  id v4 = +[DiagnosticCase attachmentsFromStringRepresentation:v3];

  [*(id *)(a1 + 32) addObject:v4];
}

- (BOOL)allowDampeningExceptionFor:(id)a3
{
  return +[CaseDampeningExceptions allowDampeningExceptionFor:a3];
}

- (unsigned)dampeningFactorForSignature:(id)a3 caseTime:(id)a4 limit:(int64_t)a5
{
  v58[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v48 = a4;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  unsigned int v53 = 0;
  unsigned int v53 = [(DiagnosticCaseManager *)self defaultDampeningFactorForSignature:v8 limit:a5];
  v47 = [v8 objectForKeyedSubscript:@"domain"];
  v46 = [v8 objectForKeyedSubscript:@"type"];
  v45 = [v8 objectForKeyedSubscript:@"subtype"];
  v43 = [v8 objectForKeyedSubscript:@"additional"];
  v42 = [v8 objectForKeyedSubscript:@"detected"];
  [v48 timeIntervalSince1970];
  double v10 = v9;
  long long v11 = [(DiagnosticCaseManager *)self configManager];
  unint64_t v12 = [v11 dampeningRestrictionFactor];

  v34 = (void *)[objc_alloc(MEMORY[0x263EFF910]) initWithTimeIntervalSince1970:v10 + fabs(sqrt((double)v12)) * -86400.0];
  v36 = [MEMORY[0x263F08A98] predicateWithFormat:@"timeStamp >= %@", v34];
  uint64_t v13 = MEMORY[0x263EFFA80];
  v44 = [MEMORY[0x263F08A98] predicateWithFormat:@"remoteTrigger == %@", MEMORY[0x263EFFA80]];
  uint64_t v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"remoteTrigger == nil"];
  uint64_t v15 = (void *)MEMORY[0x263F08730];
  v58[0] = v44;
  v58[1] = v14;
  __int16 v33 = (void *)v14;
  int64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v58 count:2];
  uint64_t v35 = [v15 orPredicateWithSubpredicates:v16];

  v41 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseDomain == %@", v47];
  v40 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseType == %@", v46];
  v39 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseSubtype == %@", v45];
  v38 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseSubtypeContext == %@", v43];
  v37 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseDetectedProcess == %@", v42];
  id v17 = objc_alloc(MEMORY[0x263F08730]);
  v57[0] = v41;
  v57[1] = v40;
  v57[2] = v39;
  v57[3] = v38;
  v57[4] = v37;
  v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v57 count:5];
  v19 = (void *)[v17 initWithType:1 subpredicates:v18];

  id v20 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseDampeningType == %@", &unk_26BDF5A80];
  id v21 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseAttachments != nil"];
  int64_t v22 = [MEMORY[0x263F08A98] predicateWithFormat:@"attachmentsIncomplete == %@", v13];
  id v23 = objc_alloc(MEMORY[0x263F08730]);
  v56[0] = v36;
  v56[1] = v35;
  v56[2] = v19;
  v56[3] = v20;
  v56[4] = v21;
  v56[5] = v22;
  uint64_t v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:6];
  uint64_t v25 = (void *)[v23 initWithType:1 subpredicates:v24];

  __int16 v26 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"timeStamp" ascending:0];
  v27 = [(ObjectAnalytics *)self->_caseStorageAnalytics fetchEntitiesFreeForm:v25 sortDesc:v26];
  __int16 v28 = casemanagementLogHandle();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    uint64_t v29 = [v27 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v55 = v29;
    _os_log_impl(&dword_209DBA000, v28, OS_LOG_TYPE_INFO, "There are %ld records of accepted cases with logs matching this signature", buf, 0xCu);
  }

  id v30 = (void *)MEMORY[0x21050CEB0]();
  v49[0] = MEMORY[0x263EF8330];
  v49[1] = 3221225472;
  v49[2] = __68__DiagnosticCaseManager_dampeningFactorForSignature_caseTime_limit___block_invoke;
  v49[3] = &unk_263FC3E20;
  v49[4] = self;
  v49[5] = &v50;
  [v27 enumerateObjectsUsingBlock:v49];
  unsigned int v31 = *((_DWORD *)v51 + 6);

  _Block_object_dispose(&v50, 8);
  return v31;
}

void __68__DiagnosticCaseManager_dampeningFactorForSignature_caseTime_limit___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a2;
  uint64_t v7 = [v6 caseID];
  id v8 = [v6 caseAttachments];
  double v9 = +[DiagnosticCase attachmentsFromStringRepresentation:v8];
  double v10 = casemanagementLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v7;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = [v6 dpSubmissionState];
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "Inspecting case %{public}@ [dbSubmissionState: %d]", buf, 0x12u);
  }

  if ([v6 dpSubmissionState] == 1)
  {
    long long v11 = casemanagementLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = v7;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "Found case ID %{public}@ which was submitted to DP", buf, 0xCu);
    }

LABEL_15:
    v18 = [v6 timeStamp];
    [v18 timeIntervalSinceNow];
    double v20 = floor(v19 / -86400.0) + 1.0;
    if (v20 == 0.0) {
      double v21 = 1.0;
    }
    else {
      double v21 = v20;
    }
    int64_t v22 = [*(id *)(a1 + 32) configManager];
    unint64_t v23 = [v22 dampeningRestrictionFactor];
    unint64_t v24 = (unint64_t)v21;
    double v25 = exp2((double)((unint64_t)v21 - 1));

    unint64_t v26 = vcvtad_u64_f64(1.0 / v25 * (double)v23);
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) *= v26;
    v27 = casemanagementLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = *(unsigned int *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2048;
      unint64_t v34 = v24;
      __int16 v35 = 2048;
      unint64_t v36 = v26;
      __int16 v37 = 2048;
      uint64_t v38 = v28;
      _os_log_impl(&dword_209DBA000, v27, OS_LOG_TYPE_DEFAULT, "Found fully valid case %{public}@ from %@ (within %lu days ago). Adjusted dampening factor by %ld to %ld", buf, 0x34u);
    }

    *a4 = 1;
    goto LABEL_21;
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  LOBYTE(v34) = 1;
  unint64_t v12 = [MEMORY[0x263F08850] defaultManager];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __68__DiagnosticCaseManager_dampeningFactorForSignature_caseTime_limit___block_invoke_120;
  v29[3] = &unk_263FC3DF8;
  id v13 = v12;
  id v30 = v13;
  id v14 = v7;
  id v31 = v14;
  double v32 = buf;
  [v9 enumerateObjectsUsingBlock:v29];
  int v15 = *(unsigned __int8 *)(*(void *)&buf[8] + 24);
  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    int64_t v16 = casemanagementLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v39 = 138543362;
      id v40 = v14;
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEBUG, "Case ID %{public}@ matched signature with all attachment files present", v39, 0xCu);
    }
  }
  else
  {
    id v17 = casemanagementLogHandle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v39 = 138543362;
      id v40 = v14;
      _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEFAULT, "Case ID %{public}@ matches signature but is missing attachment files on disk", v39, 0xCu);
    }

    [v6 setAttachmentsIncomplete:1];
  }

  _Block_object_dispose(buf, 8);
  if (v15) {
    goto LABEL_15;
  }
LABEL_21:
}

void __68__DiagnosticCaseManager_dampeningFactorForSignature_caseTime_limit___block_invoke_120(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = (objc_class *)NSURL;
  id v7 = a2;
  id v8 = (void *)[[v6 alloc] initWithString:v7];

  double v9 = (void *)a1[4];
  double v10 = [v8 path];
  LOBYTE(v9) = [v9 fileExistsAtPath:v10];

  if ((v9 & 1) == 0)
  {
    long long v11 = casemanagementLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = a1[5];
      id v13 = [v8 path];
      int v14 = 138543618;
      uint64_t v15 = v12;
      __int16 v16 = 2112;
      id v17 = v13;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_INFO, "Case ID %{public}@ is missing attached logs on disk: %@", (uint8_t *)&v14, 0x16u);
    }
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (unsigned)defaultDampeningFactorForSignature:(id)a3 limit:(int64_t)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unsigned int v4 = [(DiagnosticCaseManager *)self avgCasesPerDay];
  uint64_t v5 = casemanagementLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = v4;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "Configuring initial dampening factor to %d", (uint8_t *)v7, 8u);
  }

  return v4;
}

- (void)buildSpecificRestrictionsForSignature:(id)a3 result:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t))a4;
  if (v7)
  {
    uint64_t v8 = +[SystemProperties sharedInstance];
    if ([v8 internalBuild])
    {
      double v9 = [(DiagnosticCaseManager *)self configManager];
      if (([v9 cloudKitEnabled] & 1) == 0)
      {
        double v10 = [(DiagnosticCaseManager *)self configManager];
        char v11 = [v10 submitToDiagnosticPipeline];

        if ((v11 & 1) == 0)
        {
          uint64_t v12 = casemanagementLogHandle();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            LOWORD(v23) = 0;
            _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "Not allowing case due to invalid configuration (no valid upload mechanism configured).", (uint8_t *)&v23, 2u);
          }

          v7[2](v7, 1, 4);
          goto LABEL_37;
        }
        goto LABEL_36;
      }
      goto LABEL_35;
    }
    if ([v8 carrierSeedBuild])
    {
      double v9 = [v6 objectForKeyedSubscript:@"domain"];
      id v13 = [v6 objectForKeyedSubscript:@"type"];
      int v14 = [v6 objectForKeyedSubscript:@"subtype"];
      uint64_t v15 = [v6 objectForKeyedSubscript:@"detected"];
      if (([v9 isEqualToString:@"Cellular"] & 1) == 0
        && ([v9 isEqualToString:@"Energy"] & 1) == 0
        && ([v15 isEqualToString:@"Baseband"] & 1) == 0
        && (![v9 isEqualToString:@"UIPerformance"]
         || ![v13 isEqualToString:@"Responsiveness"]
         || ![v14 isEqualToString:@"com.apple.signpost_emitter.emitter_category.emitter_name"]|| (objc_msgSend(v15, "isEqualToString:", @"signpost_emitter") & 1) == 0))
      {
        __int16 v16 = casemanagementLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          id v17 = [v6 logSignatureDescription];
          int v23 = 138543362;
          unint64_t v24 = v17;
          _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEFAULT, "Cases not explicitly permitted will be dampened on Carrier Seed builds: %{public}@", (uint8_t *)&v23, 0xCu);
        }
        v7[2](v7, 1, 7);
LABEL_19:

LABEL_37:
        goto LABEL_38;
      }
    }
    else
    {
      if (![v8 customerSeedBuild])
      {
        if ([v8 vendorBuild])
        {
          double v19 = casemanagementLogHandle();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            double v20 = [v6 logSignatureDescription];
            int v23 = 138543362;
            unint64_t v24 = v20;
            _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_INFO, "All cases will be dampened on Vendor builds: %{public}@", (uint8_t *)&v23, 0xCu);
          }
          v7[2](v7, 1, 6);
          goto LABEL_37;
        }
        goto LABEL_36;
      }
      double v9 = [v6 objectForKeyedSubscript:@"domain"];
      id v13 = [v6 objectForKeyedSubscript:@"type"];
      int v14 = [v6 objectForKeyedSubscript:@"subtype"];
      uint64_t v15 = [v6 objectForKeyedSubscript:@"additional"];
      uint64_t v18 = [v6 objectForKeyedSubscript:@"detected"];
      if ((![v9 isEqualToString:@"Energy"]
         || ([v13 isEqualToString:@"CPU"] & 1) == 0)
        && (![v9 isEqualToString:@"UIPerformance"]
         || ([v13 isEqualToString:@"Responsiveness"] & 1) == 0)
        && ([v9 isEqualToString:@"Performance"] & 1) == 0
        && (![v9 isEqualToString:@"Responsiveness"]
         || ![v13 isEqualToString:@"CoreAnimation"]
         || ([v14 isEqualToString:@"Stall Tailspin"] & 1) == 0)
        && ([v9 isEqualToString:@"Cellular"] & 1) == 0
        && ([v9 isEqualToString:@"Telephony"] & 1) == 0
        && ([v13 isEqualToString:@"IMSReg"] & 1) == 0
        && ([v13 isEqualToString:@"IMS Call KPI"] & 1) == 0
        && (![v9 isEqualToString:@"Location"]
         || ![v13 isEqualToString:@"GNSS"]
         || ![v14 isEqualToString:@"Emergency"]
         || ![v15 isEqualToString:@"long_EEM"]
         || ([v18 isEqualToString:@"locationd"] & 1) == 0)
        && (![v9 isEqualToString:@"iCloudDrive"]
         || ([v13 isEqualToString:@"Ciconia"] & 1) == 0)
        && (![v9 isEqualToString:@"SpotlightIndex"]
         || ([v13 isEqualToString:@"IndexCorruption"] & 1) == 0))
      {
        double v21 = casemanagementLogHandle();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v22 = [v6 logSignatureDescription];
          int v23 = 138543362;
          unint64_t v24 = v22;
          _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_DEFAULT, "Cases not explicitly permitted will be dampened on Seed builds: %{public}@", (uint8_t *)&v23, 0xCu);
        }
        v7[2](v7, 1, 7);

        goto LABEL_19;
      }
    }
LABEL_35:

LABEL_36:
    v7[2](v7, 0, 0);
    goto LABEL_37;
  }
LABEL_38:
}

- (void)caseAllowanceForSignature:(id)a3 timestamp:(id)a4 result:(id)a5
{
  v68[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  double v10 = (void (**)(id, uint64_t, void))a5;
  if (v10)
  {
    if ([v8 count])
    {
      context = (void *)MEMORY[0x21050CEB0]();
      if (!v9)
      {
        id v9 = [MEMORY[0x263EFF910] date];
      }
      uint64_t v11 = [v8 objectForKeyedSubscript:@"domain"];
      uint64_t v12 = [v8 objectForKeyedSubscript:@"type"];
      uint64_t v13 = [v8 objectForKeyedSubscript:@"subtype"];
      id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
      v54 = self;
      v59 = (void *)v12;
      v60 = (void *)v11;
      v58 = (void *)v13;
      unint64_t v47 = [(DiagnosticCaseManager *)self dailyCountLimitForDomain:v11 type:v12 subtype:v13 domainPredicates:v14];
      [v9 timeIntervalSince1970];
      double v16 = v15;
      id v50 = v9;
      [v9 timeIntervalSince1970];
      v62 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v16 - (double)((unint64_t)v17 % 0x15180)];
      uint64_t v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"timeStamp >= %@", v62];
      uint64_t v19 = [MEMORY[0x263F08A98] predicateWithFormat:@"remoteTrigger == %@", MEMORY[0x263EFFA80]];
      uint64_t v20 = [MEMORY[0x263F08A98] predicateWithFormat:@"remoteTrigger == nil"];
      id v21 = objc_alloc(MEMORY[0x263F08730]);
      uint64_t v55 = (void *)v20;
      v56 = (void *)v19;
      v68[0] = v19;
      v68[1] = v20;
      int64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v68 count:2];
      uint64_t v23 = [v21 initWithType:2 subpredicates:v22];

      uint64_t v24 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseClosureType == %@", &unk_26BDF5A98];
      uint64_t v25 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseClosureType == %@", &unk_26BDF5AB0];
      uint64_t v26 = [MEMORY[0x263F08A98] predicateWithFormat:@"caseClosureType == %@", &unk_26BDF5AC8];
      id v27 = objc_alloc(MEMORY[0x263F08730]);
      v51 = (void *)v25;
      uint64_t v52 = (void *)v24;
      v67[0] = v24;
      v67[1] = v25;
      v49 = (void *)v26;
      v67[2] = v26;
      uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v67 count:3];
      uint64_t v29 = [v27 initWithType:2 subpredicates:v28];

      id v48 = (void *)v29;
      unsigned int v53 = (void *)v23;
      v57 = (void *)v18;
      id v30 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v18, v23, v29, 0);
      if ([v14 count]) {
        [v30 addObjectsFromArray:v14];
      }
      id v31 = casemanagementLogHandle();
      id v9 = v50;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)v64 = v62;
        *(_WORD *)&v64[8] = 2112;
        *(void *)&v64[10] = v50;
        _os_log_impl(&dword_209DBA000, v31, OS_LOG_TYPE_DEBUG, "Current window is from %@ to %@ (now)", buf, 0x16u);
      }

      double v32 = (void *)[objc_alloc(MEMORY[0x263F08730]) initWithType:1 subpredicates:v30];
      unint64_t v33 = [(ObjectAnalytics *)v54->_caseStorageAnalytics countEntitiesMatching:v32];
      unint64_t v34 = casemanagementLogHandle();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        *(void *)v64 = v33;
        *(_WORD *)&v64[8] = 2112;
        *(void *)&v64[10] = v62;
        __int16 v65 = 2048;
        unint64_t v66 = v47;
        _os_log_impl(&dword_209DBA000, v34, OS_LOG_TYPE_INFO, "Accepted %ld case(s) since %@ (limit = %ld).", buf, 0x20u);
      }

      __int16 v35 = casemanagementLogHandle();
      unint64_t v36 = v35;
      if (v47 <= v33)
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          __int16 v42 = 2;
          _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_DEFAULT, "Reached daily limit, no more cases can be accepted.", buf, 2u);
        }
        else
        {
          __int16 v42 = 2;
        }
      }
      else
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          *(void *)v64 = v33;
          *(_WORD *)&v64[8] = 2112;
          *(void *)&v64[10] = v62;
          __int16 v65 = 2048;
          unint64_t v66 = v47;
          _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_DEBUG, "Found %ld case(s) after %@ (limit = %ld), admissible.", buf, 0x20u);
        }

        uint32_t v37 = [(DiagnosticCaseManager *)v54 dampeningFactorForSignature:v8 caseTime:v50 limit:v47 - v33];
        uint64_t v38 = casemanagementLogHandle();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v64 = v37;
          *(_WORD *)&v64[4] = 2048;
          *(void *)&v64[6] = v47 - v33;
          _os_log_impl(&dword_209DBA000, v38, OS_LOG_TYPE_DEFAULT, "Current dampening probability is %u to %ld against.", buf, 0x12u);
        }

        uint32_t v39 = arc4random_uniform(v37);
        unint64_t v36 = casemanagementLogHandle();
        BOOL v40 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
        if ((uint64_t)(v47 - v33) > v39)
        {
          if (v40)
          {
            uint64_t v41 = [v8 logSignatureDescription];
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v64 = v39;
            *(_WORD *)&v64[4] = 2114;
            *(void *)&v64[6] = v41;
            _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_DEFAULT, "Randomizer check passed [%d]. Accepting case: %{public}@", buf, 0x12u);
          }
          __int16 v42 = 0;
          goto LABEL_36;
        }
        if (v40)
        {
          v43 = [v8 logSignatureDescription];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v64 = v39;
          *(_WORD *)&v64[4] = 2114;
          *(void *)&v64[6] = v43;
          _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_DEFAULT, "Failed to pass randomizer check [%d]. Not accepting this case: %{public}@", buf, 0x12u);
        }
        __int16 v42 = 3;
      }

      BOOL v44 = +[CaseDampeningExceptions allowDampeningExceptionFor:v8];
      v45 = casemanagementLogHandle();
      unint64_t v36 = v45;
      if (v44)
      {
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_DEFAULT, "Dampening Exceptions: Allowing this case is as an exception.", buf, 2u);
        }
      }
      else
      {
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_INFO, "Dampening Exceptions: This case is not allowed as an exception.", buf, 2u);
        }

        if (![(DiagnosticCaseManager *)v54 isAllowedTransientException:v8])
        {
          uint64_t v46 = 0;
          goto LABEL_37;
        }
        unint64_t v36 = casemanagementLogHandle();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_DEFAULT, "Allowing this case as a transient exception.", buf, 2u);
        }
        __int16 v42 = -1;
      }
LABEL_36:

      uint64_t v46 = 1;
LABEL_37:

      v10[2](v10, v46, v42);
      goto LABEL_38;
    }
    v10[2](v10, 0, 4);
  }
LABEL_38:
}

- (BOOL)isAdmissible:(id)a3 dampenedBy:(signed __int16 *)a4
{
  id v6 = a3;
  id v7 = v6;
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  if (a4) {
    *a4 = 4;
  }
  id v8 = [v6 signature];

  if (v8)
  {
    *(void *)buf = 0;
    uint64_t v23 = buf;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    id v9 = [v7 signature];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __49__DiagnosticCaseManager_isAdmissible_dampenedBy___block_invoke;
    v21[3] = &unk_263FC3E48;
    v21[5] = buf;
    v21[6] = a4;
    v21[4] = &v26;
    [(DiagnosticCaseManager *)self buildSpecificRestrictionsForSignature:v9 result:v21];

    if (v23[24])
    {
LABEL_5:
      BOOL v10 = *((unsigned char *)v27 + 24) != 0;
LABEL_25:
      _Block_object_dispose(buf, 8);
      goto LABEL_26;
    }
    if ([(NSMutableArray *)self->_totalCases count])
    {
      if (a4) {
        *a4 = 5;
      }
      uint64_t v12 = casemanagementLogHandle();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEFAULT, "Not allowing a new case while another case is currently active.", v20, 2u);
      }

      BOOL v10 = 0;
      goto LABEL_25;
    }
    if (a4) {
      *a4 = 0;
    }
    if ([(DiagnosticCaseManager *)self disableDampening])
    {
      uint64_t v13 = casemanagementLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        id v14 = "Dampening is disabled, allowing case.";
LABEL_23:
        _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEFAULT, v14, v20, 2u);
      }
    }
    else
    {
      if (![v7 isRemoteTrigger])
      {
        double v16 = [v7 signature];
        double v17 = [v7 caseStorage];
        uint64_t v18 = [v17 timeStamp];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __49__DiagnosticCaseManager_isAdmissible_dampenedBy___block_invoke_187;
        v19[3] = &unk_263FC3E70;
        v19[4] = &v26;
        v19[5] = a4;
        [(DiagnosticCaseManager *)self caseAllowanceForSignature:v16 timestamp:v18 result:v19];

        goto LABEL_5;
      }
      uint64_t v13 = casemanagementLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v20 = 0;
        id v14 = "Allowing as a remotely triggered case.";
        goto LABEL_23;
      }
    }

    BOOL v10 = 1;
    goto LABEL_25;
  }
  uint64_t v11 = casemanagementLogHandle();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "Not allowing case due to missing signature.", buf, 2u);
  }

  BOOL v10 = 0;
LABEL_26:
  _Block_object_dispose(&v26, 8);

  return v10;
}

void __49__DiagnosticCaseManager_isAdmissible_dampenedBy___block_invoke(void *a1, int a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (a2)
  {
    unsigned int v4 = (_WORD *)a1[6];
    if (v4) {
      *unsigned int v4 = a3;
    }
    *(unsigned char *)(*(void *)(a1[4] + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
    uint64_t v5 = casemanagementLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = +[DiagnosticCase descriptionForDampeningType:a3];
      int v7 = 138543362;
      id v8 = v6;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "Case denied by restriction, dampening: %{public}@", (uint8_t *)&v7, 0xCu);
    }
  }
}

uint64_t __49__DiagnosticCaseManager_isAdmissible_dampenedBy___block_invoke_187(uint64_t result, char a2, __int16 a3)
{
  id v3 = *(_WORD **)(result + 40);
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  if (v3) {
    *id v3 = a3;
  }
  return result;
}

- (id)casesDiagnosedInTheLast:(double)a3 from:(double)a4 matchingDomain:(id)a5
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v22 = [MEMORY[0x263EFF980] array];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v9 = [(NSMutableArray *)self->_totalCases reverseObjectEnumerator];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    double v13 = a4 - a3;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        double v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        [v15 caseOpenedTime];
        if (v16 < a4)
        {
          [v15 caseOpenedTime];
          if (v17 > v13 && [v15 closureType] != 3)
          {
            if ([v15 closureType])
            {
              if (!v8
                || ([v15 signature],
                    uint64_t v18 = objc_claimAutoreleasedReturnValue(),
                    [v18 objectForKeyedSubscript:@"domain"],
                    uint64_t v19 = objc_claimAutoreleasedReturnValue(),
                    int v20 = [v8 isEqualToString:v19],
                    v19,
                    v18,
                    v20))
              {
                [v22 addObject:v15];
              }
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  return v22;
}

- (void)requestGroupCaseIdentifierForSignature:(id)a3 reply:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if ([v6 count])
    {
      *(void *)buf = 0;
      uint64_t v28 = buf;
      uint64_t v29 = 0x2020000000;
      char v30 = 0;
      uint64_t v23 = 0;
      long long v24 = &v23;
      uint64_t v25 = 0x2020000000;
      __int16 v26 = 4;
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __70__DiagnosticCaseManager_requestGroupCaseIdentifierForSignature_reply___block_invoke;
      v22[3] = &unk_263FC3E98;
      v22[4] = &v23;
      v22[5] = buf;
      [(DiagnosticCaseManager *)self buildSpecificRestrictionsForSignature:v6 result:v22];
      if (v28[24])
      {
        (*((void (**)(id, void, void, void))v7 + 2))(v7, 0, *((__int16 *)v24 + 12), 0);
      }
      else
      {
        uint64_t v18 = 0;
        uint64_t v19 = &v18;
        uint64_t v20 = 0x2020000000;
        char v21 = 0;
        if ([(DiagnosticCaseManager *)self disableDampening])
        {
          *((unsigned char *)v19 + 24) = 1;
          *((_WORD *)v24 + 12) = 0;
          uint64_t v9 = casemanagementLogHandle();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v31 = 0;
            _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "groupCaseIdentifierForSignature: Dampening is disabled, allowing case.", v31, 2u);
          }
        }
        else
        {
          v17[0] = MEMORY[0x263EF8330];
          v17[1] = 3221225472;
          v17[2] = __70__DiagnosticCaseManager_requestGroupCaseIdentifierForSignature_reply___block_invoke_188;
          v17[3] = &unk_263FC3E98;
          v17[4] = &v18;
          v17[5] = &v23;
          [(DiagnosticCaseManager *)self caseAllowanceForSignature:v6 timestamp:0 result:v17];
        }
        if (*((unsigned char *)v19 + 24))
        {
          uint64_t v10 = [MEMORY[0x263F08C38] UUID];
          uint64_t v11 = [v10 UUIDString];
          uint64_t v12 = [MEMORY[0x263F08C38] UUID];
          double v13 = [v12 UUIDString];
          id v14 = [v11 stringByAppendingFormat:@"_%@", v13];

          double v15 = casemanagementLogHandle();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id v31 = 138543362;
            double v32 = v14;
            _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_INFO, "groupCaseIdentifierForSignature: Generating group identifier: %{public}@", v31, 0xCu);
          }

          BOOL v16 = *((unsigned char *)v19 + 24) != 0;
        }
        else
        {
          BOOL v16 = 0;
          id v14 = 0;
        }
        (*((void (**)(id, BOOL, void, void *))v7 + 2))(v7, v16, *((__int16 *)v24 + 12), v14);

        _Block_object_dispose(&v18, 8);
      }
      _Block_object_dispose(&v23, 8);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v8 = casemanagementLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_ERROR, "groupCaseIdentifierForSignature: Denying due to missing signature.", buf, 2u);
      }

      (*((void (**)(id, void, uint64_t, void))v7 + 2))(v7, 0, 4, 0);
    }
  }
}

void __70__DiagnosticCaseManager_requestGroupCaseIdentifierForSignature_reply___block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a2)
  {
    *(_WORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    unsigned int v4 = casemanagementLogHandle();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = +[DiagnosticCase descriptionForDampeningType:a3];
      int v6 = 138543362;
      id v7 = v5;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "groupCaseIdentifierForSignature: case denied by restriction, dampening: %{public}@", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __70__DiagnosticCaseManager_requestGroupCaseIdentifierForSignature_reply___block_invoke_188(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  uint64_t v5 = casemanagementLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (a2) {
      int v6 = "allowed";
    }
    else {
      int v6 = "denied";
    }
    id v7 = +[DiagnosticCase descriptionForDampeningType:a3];
    int v8 = 136315394;
    uint64_t v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "groupCaseIdentifierForSignature: case: %s, dampening: %{public}@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)createDiagnosticCaseWithSignature:(id)a3 flags:(unint64_t)a4 events:(id)a5 payload:(id)a6 actions:(id)a7
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    BOOL v16 = 0;
    goto LABEL_15;
  }
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  BOOL v16 = [[DiagnosticCase alloc] initWithSignature:v15 flags:a4 events:v14 payload:v13 actions:v12 manager:self];

  __int16 v37 = 0;
  LODWORD(v14) = [(DiagnosticCaseManager *)self isAdmissible:v16 dampenedBy:&v37];
  double v17 = casemanagementLogHandle();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v14)
  {
    if (v18)
    {
      uint64_t v19 = [(DiagnosticCase *)v16 caseId];
      uint64_t v20 = [v19 UUIDString];
      char v21 = [(DiagnosticCase *)v16 signature];
      id v22 = [v21 logSignatureDescription];
      *(_DWORD *)buf = 138543618;
      uint32_t v39 = v20;
      __int16 v40 = 2114;
      uint64_t v41 = v22;
      _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEFAULT, "Accepting case id %{public}@ with signature %{public}@", buf, 0x16u);
    }
    [(NSMutableArray *)self->_activeCases addObject:v16];
    if (v37 == -1) {
      [(DiagnosticCase *)v16 setDampeningType:0xFFFFFFFFLL];
    }
    [(DiagnosticCase *)v16 setClosureType:0];
    [(DiagnosticCase *)v16 setCaseState:1];
    [(DiagnosticCaseManager *)self promoteTemporaryCase:v16];
    if (!v16) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (v18)
  {
    uint64_t v23 = [(DiagnosticCase *)v16 caseId];
    long long v24 = [v23 UUIDString];
    uint64_t v25 = [(DiagnosticCase *)v16 signature];
    __int16 v26 = [v25 logSignatureDescription];
    id v27 = +[DiagnosticCase descriptionForDampeningType:v37];
    *(_DWORD *)buf = 138412802;
    uint32_t v39 = v24;
    __int16 v40 = 2114;
    uint64_t v41 = v26;
    __int16 v42 = 2114;
    v43 = v27;
    _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEFAULT, "Rejecting case id %@{public} with signature %{public}@ (%{public}@)", buf, 0x20u);
  }
  [(DiagnosticCase *)v16 setDampeningType:v37];
  [(DiagnosticCase *)v16 setClosureType:3];
  uint64_t v28 = [(DiagnosticCaseManager *)self queue];

  if (v28)
  {
    uint64_t v29 = [(DiagnosticCaseManager *)self queue];
    uint64_t v32 = MEMORY[0x263EF8330];
    uint64_t v33 = 3221225472;
    unint64_t v34 = __88__DiagnosticCaseManager_createDiagnosticCaseWithSignature_flags_events_payload_actions___block_invoke;
    __int16 v35 = &unk_263FC2DC0;
    unint64_t v36 = v16;
    dispatch_async(v29, &v32);

    if (!v16) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  id v31 = casemanagementLogHandle();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v31, OS_LOG_TYPE_DEFAULT, "No queue assigned! Finalizing case immediately.", buf, 2u);
  }

  [(DiagnosticCase *)v16 setCaseState:3];
  if (v16) {
LABEL_14:
  }
    -[NSMutableArray addObject:](self->_totalCases, "addObject:", v16, v32, v33, v34, v35);
LABEL_15:

  return v16;
}

uint64_t __88__DiagnosticCaseManager_createDiagnosticCaseWithSignature_flags_events_payload_actions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCaseState:3];
}

- (id)diagnosticCaseWithId:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_totalCases;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(v5);
      }
      __int16 v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      uint64_t v11 = objc_msgSend(v10, "caseId", (void)v19);
      int v12 = [v11 isEqual:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = casemanagementLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v4 UUIDString];
      *(_DWORD *)buf = 138412290;
      long long v24 = v14;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "Found case with ID %@{public} in totalCases", buf, 0xCu);
    }
    id v15 = v10;

    if (v15) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:
  }
  BOOL v16 = casemanagementLogHandle();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    double v17 = [v4 UUIDString];
    *(_DWORD *)buf = 138412290;
    long long v24 = v17;
    _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_INFO, "Looking up case with ID %@{public} from persistent store", buf, 0xCu);
  }
  id v15 = [[DiagnosticCase alloc] initWithCaseId:v4 manager:self];
LABEL_16:

  return v15;
}

- (BOOL)finalizeDiagnosticCaseWithId:(id)a3 closureType:(signed __int16)a4 onlyIfReady:(BOOL)a5
{
  BOOL v36 = a5;
  uint64_t v5 = a4;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v8 = self->_activeCases;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v38 != v11) {
        objc_enumerationMutation(v8);
      }
      id v13 = *(void **)(*((void *)&v37 + 1) + 8 * v12);
      id v14 = [v13 caseId];
      int v15 = [v14 isEqual:v7];

      if (v15) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v47 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_21;
      }
    }
    if (v36 && ![v13 readyToEndSession])
    {
      uint64_t v23 = casemanagementLogHandle();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        long long v24 = [v7 UUIDString];
        *(_DWORD *)buf = 138543362;
        __int16 v42 = v24;
        _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_INFO, "Case %{public}@ is not yet ready for finalizing.", buf, 0xCu);
      }
      goto LABEL_21;
    }
    BOOL v16 = casemanagementLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      double v17 = [v7 UUIDString];
      *(_DWORD *)buf = 138412290;
      __int16 v42 = v17;
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_INFO, "Ready to finalize case %@.", buf, 0xCu);
    }
    if (v5 == 2 && ([v13 isSnapshot] & 1) == 0)
    {
      BOOL v18 = casemanagementLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        [v13 preferredDuration];
        uint64_t v26 = v25;
        id v27 = [v13 signature];
        uint64_t v28 = [v27 logSignatureDescription];
        uint64_t v29 = [v13 caseId];
        char v30 = [v29 UUIDString];
        *(_DWORD *)buf = 134218498;
        __int16 v42 = v26;
        __int16 v43 = 2114;
        uint64_t v44 = v28;
        __int16 v45 = 2114;
        uint64_t v46 = v30;
        _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEFAULT, "Timeout exceeded (%.0f) Forcibly removing active case with signature %{public}@ (case ID = %{public}@)", buf, 0x20u);
      }
    }
    else
    {
      BOOL v18 = casemanagementLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        long long v19 = [v13 signature];
        long long v20 = [v19 logSignatureDescription];
        long long v21 = [v13 caseId];
        long long v22 = [v21 UUIDString];
        *(_DWORD *)buf = 138543618;
        __int16 v42 = v20;
        __int16 v43 = 2114;
        uint64_t v44 = v22;
        _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEBUG, "Removing active case with signature %{public}@ (case ID = %{public}@)", buf, 0x16u);
      }
    }

    [v13 setClosureType:v5];
    [v13 setCaseState:3];
    id v31 = v13;

    if (v31)
    {
      [(NSMutableArray *)self->_activeCases removeObject:v31];
      BOOL v32 = 1;
      goto LABEL_31;
    }
  }
  else
  {
LABEL_21:
  }
  BOOL v32 = 0;
  if (v5 != 2 && !v36)
  {
    id v31 = casemanagementLogHandle();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = [v7 UUIDString];
      activeCases = self->_activeCases;
      *(_DWORD *)buf = 138543618;
      __int16 v42 = v33;
      __int16 v43 = 2112;
      uint64_t v44 = activeCases;
      _os_log_impl(&dword_209DBA000, v31, OS_LOG_TYPE_INFO, "Couldn't find case %{public}@ in active cases %@", buf, 0x16u);
    }
    BOOL v32 = 0;
LABEL_31:
  }
  return v32;
}

- (void)_updateCaseStatisticsWithCase:(id)a3
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 caseStorage];
  int v6 = [v5 caseClosureType];

  if (v6 != 4)
  {
    id v7 = casemanagementLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v4 caseId];
      uint64_t v9 = [v8 UUIDString];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v9;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Updating statistics for case %@", (uint8_t *)&buf, 0xCu);
    }
    [(NSMutableArray *)self->_pendingStatisticsUpdateCases addObject:v4];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x3032000000;
  uint64_t v48 = __Block_byref_object_copy__4;
  v49 = __Block_byref_object_dispose__4;
  id v50 = 0;
  totalCases = self->_totalCases;
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __55__DiagnosticCaseManager__updateCaseStatisticsWithCase___block_invoke;
  v40[3] = &unk_263FC3EC0;
  v40[4] = self;
  id v11 = v4;
  id v41 = v11;
  p_long long buf = &buf;
  [(NSMutableArray *)totalCases enumerateObjectsUsingBlock:v40];
  if (*(void *)(*((void *)&buf + 1) + 40))
  {
    uint64_t v12 = casemanagementLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = *(void **)(*((void *)&buf + 1) + 40);
      id v14 = [MEMORY[0x263EFF960] currentLocale];
      int v15 = [v13 descriptionWithLocale:v14];
      *(_DWORD *)uint64_t v44 = 138412290;
      __int16 v45 = v15;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "Oldest unclosed case was created at %@", v44, 0xCu);
    }
  }
  else
  {
    BOOL v16 = casemanagementLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v44 = 0;
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_DEBUG, "No unclosed case, using the current time.", v44, 2u);
    }

    uint64_t v17 = [MEMORY[0x263EFF910] date];
    uint64_t v12 = *(NSObject **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v17;
  }

  BOOL v18 = [MEMORY[0x263EFF980] array];
  pendingStatisticsUpdateCases = self->_pendingStatisticsUpdateCases;
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __55__DiagnosticCaseManager__updateCaseStatisticsWithCase___block_invoke_196;
  v36[3] = &unk_263FC3EE8;
  v36[4] = self;
  id v28 = v11;
  id v37 = v28;
  long long v39 = &buf;
  id v31 = v18;
  id v38 = v31;
  [(NSMutableArray *)pendingStatisticsUpdateCases enumerateObjectsUsingBlock:v36];
  char v30 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"caseOpenedTime" ascending:1];
  uint64_t v29 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:");
  objc_msgSend(v31, "sortedArrayUsingDescriptors:");
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v43 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v25 = casemanagementLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v26 = objc_msgSend(v24, "caseId", v28);
          id v27 = [v26 UUIDString];
          *(_DWORD *)uint64_t v44 = 138412290;
          __int16 v45 = v27;
          _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_DEBUG, "Updating statistics for case %@.", v44, 0xCu);
        }
        [(DiagnosticStatisticsManager *)self->_statsManager updateCaseStatisticsWith:v24];
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v43 count:16];
    }
    while (v21);
  }

  [(NSMutableArray *)self->_pendingStatisticsUpdateCases removeObjectsInArray:v20];
  [v31 removeAllObjects];

  _Block_object_dispose(&buf, 8);
}

void __55__DiagnosticCaseManager__updateCaseStatisticsWithCase___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "statisticsRowForDiagnosticCase:matchesWith:", *(void *)(a1 + 40)))
  {
    if ([v10 caseState] != 6)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
        || ([v10 caseStorage],
            id v3 = objc_claimAutoreleasedReturnValue(),
            [v3 timeStamp],
            id v4 = objc_claimAutoreleasedReturnValue(),
            uint64_t v5 = [v4 compare:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)],
            v4,
            v3,
            v5 == -1))
      {
        int v6 = [v10 caseStorage];
        uint64_t v7 = [v6 timeStamp];
        uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;
      }
    }
  }
}

void __55__DiagnosticCaseManager__updateCaseStatisticsWithCase___block_invoke_196(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if ([*(id *)(a1 + 32) statisticsRowForDiagnosticCase:v3 matchesWith:*(void *)(a1 + 40)]&& (objc_msgSend(v3, "caseStorage"), id v4 = objc_claimAutoreleasedReturnValue(), objc_msgSend(v4, "timeStamp"), v5 = objc_claimAutoreleasedReturnValue(), v6 = objc_msgSend(v5, "compare:", *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)), v5, v4, v6 == -1))
  {
    id v14 = casemanagementLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [v3 caseId];
      BOOL v16 = [v15 UUIDString];
      uint64_t v17 = [v3 caseStorage];
      BOOL v18 = [v17 timeStamp];
      long long v19 = [MEMORY[0x263EFF960] currentLocale];
      id v20 = [v18 descriptionWithLocale:v19];
      int v21 = 138412546;
      uint64_t v22 = v16;
      __int16 v23 = 2112;
      long long v24 = v20;
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_INFO, "Candidate case %@ was created at %@, can update its statistics now", (uint8_t *)&v21, 0x16u);
    }
    [*(id *)(a1 + 48) addObject:v3];
  }
  else
  {
    uint64_t v7 = casemanagementLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [v3 caseId];
      uint64_t v9 = [v8 UUIDString];
      id v10 = [v3 caseStorage];
      id v11 = [v10 timeStamp];
      uint64_t v12 = [MEMORY[0x263EFF960] currentLocale];
      id v13 = [v11 descriptionWithLocale:v12];
      int v21 = 138412546;
      uint64_t v22 = v9;
      __int16 v23 = 2112;
      long long v24 = v13;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "Candidate case %@ was created at %@, still blocked", (uint8_t *)&v21, 0x16u);
    }
  }
}

- (int)addToCaseWithId:(id)a3 events:(id)a4 payload:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && ([v9 count] || objc_msgSend(v10, "count")))
  {
    int v11 = 40;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = self->_activeCases;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v22 = v10;
      uint64_t v15 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          BOOL v18 = [v17 caseId];
          int v19 = [v18 isEqual:v8];

          if (v19)
          {
            if ([v9 count]) {
              [v17 addEvents:v9];
            }
            id v10 = v22;
            if ([v22 count]) {
              [v17 addPayload:v22];
            }
            int v11 = 0;
            goto LABEL_21;
          }
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      id v10 = v22;
    }
LABEL_21:
  }
  else
  {
    id v20 = casemanagementLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_INFO, "invalid parameters: event or payload must not be empty (events: %@, payload: %@)", buf, 0x16u);
    }

    int v11 = 20;
  }

  return v11;
}

- (int)addSignatureContentToCaseWithId:(id)a3 key:(id)a4 content:(id)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && [v9 length] && objc_msgSend(v10, "length"))
  {
    int v11 = 40;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v12 = self->_activeCases;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v26 = v10;
      uint64_t v15 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          BOOL v18 = [v17 caseId];
          int v19 = [v18 isEqual:v8];

          if (v19)
          {
            int v21 = [v17 signature];
            uint64_t v22 = [v21 objectForKey:v9];

            id v10 = v26;
            if (v22) {
              [v22 stringByAppendingString:v26];
            }
            else {
            long long v23 = [NSString stringWithString:v26];
            }
            if (v23)
            {
              long long v24 = [v17 signature];
              [v24 setObject:v23 forKey:v9];
            }
            int v11 = 0;

            goto LABEL_22;
          }
        }
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      id v10 = v26;
    }
LABEL_22:
  }
  else
  {
    id v20 = casemanagementLogHandle();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_209DBA000, v20, OS_LOG_TYPE_INFO, "invalid parameters: empty or missing key/content (key: %@, content: %@)", buf, 0x16u);
    }

    int v11 = 20;
  }

  return v11;
}

- (int)cancelCaseWithId:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = 40;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v6 = self->_activeCases;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "caseId", (void)v18);
          int v13 = [v12 isEqual:v4];

          if (v13)
          {
            uint64_t v14 = [v11 events];
            [v14 removeAllObjects];

            uint64_t v15 = [v11 payloads];
            [v15 removeAllObjects];

            [v11 setClosureType:4];
            [v11 finishCase];
            [v11 setCaseState:6];
            int v5 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    BOOL v16 = casemanagementLogHandle();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_INFO, "Missing Case ID", buf, 2u);
    }

    int v5 = 20;
  }

  return v5;
}

- (void)setUpGeneralCaseReportGenerators
{
  id v3 = [(DiagnosticCaseManager *)self configManager];
  int v4 = [v3 autoBugCaptureRegularPayloads];

  if (v4)
  {
    int v5 = [[GetNetworkInfoReportGenerator alloc] initWithQueue:self->_queue];
    [(NSMutableDictionary *)self->_reportGenerators setObject:v5 forKeyedSubscript:@"GetNetworkInfoReporter"];

    uint64_t v6 = [[FetchCrashesSpinsEtcFilesGenerator alloc] initWithQueue:self->_queue];
    [(NSMutableDictionary *)self->_reportGenerators setObject:v6 forKeyedSubscript:@"CrashesAndSpinsReporter"];

    uint64_t v7 = [[FetchLogArchivesReportGenerator alloc] initWithQueue:self->_queue];
    [(NSMutableDictionary *)self->_reportGenerators setObject:v7 forKeyedSubscript:@"FetchLogArchiveReporter"];
  }
}

- (void)reportGeneratorEnded:(id)a3 reportInfo:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  int v11 = [v10 diagCase];
  [v10 setDelegate:0];
  [v10 setDiagCase:0];
  [(NSMutableArray *)self->_requestedReportGenerators removeObject:v10];
  objc_msgSend(v11, "reportGeneratorEnded:reportInfo:error:isFinalReportGenerator:", v10, v9, v8, -[NSMutableArray count](self->_requestedReportGenerators, "count") == 0);

  if ([(NSMutableArray *)self->_requestedReportGenerators count])
  {
    [(DiagnosticCaseManager *)self startCollectingNextReportForDiagnosticCase:v11];
  }
  else
  {
    uint64_t v12 = casemanagementLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v13 = 0;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_INFO, "No more Requested Report Generators", v13, 2u);
    }
  }
}

- (void)addCaseReportOutlet:(id)a3
{
}

- (BOOL)hasOpenCases
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  totalCases = self->_totalCases;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __37__DiagnosticCaseManager_hasOpenCases__block_invoke;
  v5[3] = &unk_263FC3638;
  v5[4] = &v6;
  [(NSMutableArray *)totalCases enumerateObjectsUsingBlock:v5];
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __37__DiagnosticCaseManager_hasOpenCases__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [a2 caseStorage];
  int v7 = [v6 caseState];

  if (v7 != 6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)addTransactionForCaseID:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (v4 && [v4 length])
  {
    if (!self->_activeTransactions)
    {
      uint64_t v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      activeTransactions = self->_activeTransactions;
      self->_activeTransactions = v6;
    }
    uint64_t v8 = casemanagementLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v14 = (uint64_t)v5;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_INFO, "Taking transaction for case identifier: %@", buf, 0xCu);
    }

    char v9 = (id) [[NSString alloc] initWithFormat:@"com.apple.autobugcapture.case.%@", v5];
    [v9 UTF8String];
    id v10 = (void *)os_transaction_create();
    [(NSMutableDictionary *)self->_activeTransactions setObject:v10 forKeyedSubscript:v5];
    int v11 = casemanagementLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = [(NSMutableDictionary *)self->_activeTransactions count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v14 = v12;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "Currently holding %ld transaction(s)", buf, 0xCu);
    }
  }
  else
  {
    char v9 = casemanagementLogHandle();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v14 = (uint64_t)v5;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_ERROR, "Will not add a transaction for an invalid case identifier: %@", buf, 0xCu);
    }
  }
}

- (void)removeTransactionForCaseID:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = v4;
  if (!v4 || ![v4 length])
  {
    p_super = casemanagementLogHandle();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      uint64_t v11 = (uint64_t)v5;
      _os_log_impl(&dword_209DBA000, p_super, OS_LOG_TYPE_ERROR, "Unable to remove a transaction for an invalid case identifier: %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_11;
  }
  uint64_t v6 = casemanagementLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412290;
    uint64_t v11 = (uint64_t)v5;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_INFO, "Releasing transaction for case identifier: %@", (uint8_t *)&v10, 0xCu);
  }

  [(NSMutableDictionary *)self->_activeTransactions setObject:0 forKeyedSubscript:v5];
  int v7 = casemanagementLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = [(NSMutableDictionary *)self->_activeTransactions count];
    int v10 = 134217984;
    uint64_t v11 = v8;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "Currently holding %ld transaction(s)", (uint8_t *)&v10, 0xCu);
  }

  if (![(NSMutableDictionary *)self->_activeTransactions count])
  {
    p_super = &self->_activeTransactions->super.super;
    self->_activeTransactions = 0;
LABEL_11:
  }
}

- (unsigned)avgCasesPerDay
{
  if (self->_avgCasesPerDay) {
    return self->_avgCasesPerDay;
  }
  else {
    return 20;
  }
}

- (void)setAvgCasesPerDay:(unsigned int)a3
{
  self->_avgCasesPerDay = a3;
}

- (id)lookUpDiagnosticCaseStorageForUUID:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 UUIDString];
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__4;
  long long v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  uint64_t v6 = [(DiagnosticCaseStorageAnalytics *)self->_caseStorageAnalytics diagnosticCaseStorageWithId:v4];
  int v7 = casemanagementLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v6 count];
    *(_DWORD *)long long buf = 134218242;
    uint64_t v22 = v8;
    __int16 v23 = 2112;
    uint64_t v24 = v5;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Found %ld persisted case(s) for %@", buf, 0x16u);
  }

  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__DiagnosticCaseManager_lookUpDiagnosticCaseStorageForUUID___block_invoke;
  v12[3] = &unk_263FC3F10;
  id v9 = v5;
  id v13 = v9;
  uint64_t v14 = &v15;
  [v6 enumerateObjectsUsingBlock:v12];
  id v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v10;
}

void __60__DiagnosticCaseManager_lookUpDiagnosticCaseStorageForUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  int v7 = [v9 caseID];
  int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)caseStorageForCaseID:(id)a3
{
  id v4 = a3;
  int v5 = [(DiagnosticCaseManager *)self lookUpDiagnosticCaseStorageForUUID:v4];
  if (!v5)
  {
    int v5 = [(DiagnosticCaseManager *)self createTemporaryDiagnosticCaseStorageForUUID:v4];
  }

  return v5;
}

- (BOOL)closeCase:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 caseStorage];
  uint64_t v6 = [v5 caseClosedTime];

  if (!v6)
  {
    int v7 = casemanagementLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = [v4 caseStorage];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v24 = v8;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "Encountered a case with a nil caseClosedTime! (caseStorage: %@)", buf, 0xCu);
    }
  }
  queue = self->_queue;
  uint64_t v17 = MEMORY[0x263EF8330];
  uint64_t v18 = 3221225472;
  long long v19 = __35__DiagnosticCaseManager_closeCase___block_invoke;
  id v20 = &unk_263FC3430;
  long long v21 = self;
  id v10 = v4;
  id v22 = v10;
  dispatch_async(queue, &v17);
  -[NSMutableArray removeObject:](self->_activeCases, "removeObject:", v10, v17, v18, v19, v20, v21);
  [(DiagnosticCaseManager *)self _updateCaseStatisticsWithCase:v10];
  int v11 = [v10 closureType];
  if (v11 == 4)
  {
    uint64_t v12 = [v10 caseId];
    [(DiagnosticCaseManager *)self removeCaseStorageWithID:v12];

    [(NSMutableArray *)self->_totalCases removeObject:v10];
  }
  else
  {
    if ([v10 dampeningType] == -1)
    {
      id v13 = [v10 signature];
      [v10 caseOpenedTime];
      -[DiagnosticCaseManager removeTransientCasesWithSignature:beforeTime:](self, "removeTransientCasesWithSignature:beforeTime:", v13);
    }
    if ((int)[v10 dampeningType] <= 0)
    {
      self->_shouldPurgeStorageAfterSave = 1;
      [(DiagnosticCaseManager *)self saveAllCases];
      uint64_t v14 = [v10 caseId];
      uint64_t v15 = [v14 UUIDString];
      [(DiagnosticCaseManager *)self removeTransactionForCaseID:v15];
    }
    else
    {
      [(DiagnosticCaseManager *)self removeClosedCasesFromTotalCases];
    }
  }

  return v11 == 4;
}

uint64_t __35__DiagnosticCaseManager_closeCase___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) postProcessActionsForClosedCase:*(void *)(a1 + 40)];
}

- (void)postProcessActionsForClosedCase:(id)a3
{
  id v7 = a3;
  if ((int)[v7 dampeningType] >= 1)
  {
    id v4 = [v7 signature];
    int v5 = [v4 objectForKeyedSubscript:@"domain"];
    int v6 = [v5 isEqualToString:@"UIPerformance"];

    if (v6) {
      [(DiagnosticLiaison *)self->_liaison checkForUIImpactScenarioForCase:v7];
    }
  }
}

- (unint64_t)collectDiagnosticExtensionLogsWithParameters:(id)a3 options:(id)a4 diagCase:(id)a5 reply:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  uint64_t v14 = casemanagementLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v23 = v10;
    _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEBUG, "Ready to collect from diagnostic extensions with parameters: %@", buf, 0xCu);
  }

  uint64_t v15 = [(DiagnosticCaseManager *)self diagnosticsController];
  BOOL v16 = [(DiagnosticCaseManager *)self queue];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __93__DiagnosticCaseManager_collectDiagnosticExtensionLogsWithParameters_options_diagCase_reply___block_invoke;
  v20[3] = &unk_263FC3F38;
  id v21 = v11;
  id v17 = v11;
  unint64_t v18 = [v15 collectDiagnosticExtensionFilesForDiagnosticCase:v12 parameters:v10 options:v13 queue:v16 reply:v20];

  return v18;
}

void __93__DiagnosticCaseManager_collectDiagnosticExtensionLogsWithParameters_options_diagCase_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = casemanagementLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 134217984;
    uint64_t v7 = [v3 count];
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "Received %ld results from Diagnostic Extensions", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)recordDiagnosticCaseSummaryForCase:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = casemanagementLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v4 caseId];
    uint64_t v7 = [v6 UUIDString];
    uint64_t v8 = [v4 signature];
    id v9 = [v8 logSignatureDescription];
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2114;
    id v13 = v9;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_DEFAULT, "DiagnosticCaseSummaryLog: Saving summary for case id %{public}@ with signature %{public}@", (uint8_t *)&v10, 0x16u);
  }
  [(DiagnosticCaseSummaryAnalytics *)self->_caseSummaryAnalytics insertEntityForDiagnosticCase:v4];
  [(DiagnosticCaseManager *)self saveAllCases];
}

- (BOOL)requestReportGenerator:(id)a3 options:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(NSMutableDictionary *)self->_reportGenerators objectForKeyedSubscript:v6];
  id v9 = v8;
  if (v8)
  {
    [v8 setDefaults];
    [v7 count];
    int v10 = [v6 isEqualToString:@"logarchive"];
    requestedReportGenerators = self->_requestedReportGenerators;
    if (v10) {
      [(NSMutableArray *)requestedReportGenerators addObject:v9];
    }
    else {
      [(NSMutableArray *)requestedReportGenerators insertObject:v9 atIndex:0];
    }
  }
  else if (([v6 isEqualToString:@"diagext"] & 1) == 0)
  {
    __int16 v12 = casemanagementLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_ERROR, "Could not find requested report generator named %@", (uint8_t *)&v14, 0xCu);
    }
  }
  return v9 != 0;
}

- (void)startCollectingNextReportForDiagnosticCase:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(NSMutableArray *)self->_requestedReportGenerators count])
  {
    uint64_t v5 = [(NSMutableArray *)self->_requestedReportGenerators firstObject];
    [v5 setDelegate:self];
    id v6 = casemanagementLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      int v11 = 138412290;
      __int16 v12 = v8;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_INFO, "About to generate report by %@", (uint8_t *)&v11, 0xCu);
    }
    id v9 = [v4 caseId];
    int v10 = [v9 UUIDString];
    [v5 generateReportForCase:v4 reportName:v10];
  }
  else
  {
    uint64_t v5 = casemanagementLogHandle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_ERROR, "No reports requested, but we were asked to collect reports...?", (uint8_t *)&v11, 2u);
    }
  }
}

- (BOOL)sendReportsForCase:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = [(NSMutableSet *)self->_reportOutlets count] != 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v17 = self;
  id v6 = self->_reportOutlets;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = [*(id *)(*((void *)&v18 + 1) + 8 * i) publishReportForCase:v4 options:0];
        __int16 v12 = casemanagementLogHandle();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          if (v11) {
            uint64_t v13 = "Successfully published";
          }
          else {
            uint64_t v13 = "Failed to publish";
          }
          int v14 = (objc_class *)objc_opt_class();
          id v15 = NSStringFromClass(v14);
          *(_DWORD *)long long buf = 136315394;
          id v23 = v13;
          __int16 v24 = 2112;
          uint64_t v25 = v15;
          _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_INFO, "%s report to %@", buf, 0x16u);
        }
        v5 &= v11;
      }
      uint64_t v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v8);
  }

  [(NSMutableArray *)v17->_activeCases removeObject:v4];
  return v5;
}

- (BOOL)statisticsRowForDiagnosticCase:(id)a3 matchesWith:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 caseStorage];
  uint64_t v8 = [v7 caseDomain];
  if (v8)
  {

LABEL_4:
    int v11 = [v5 caseStorage];
    __int16 v12 = [v11 caseDomain];
    uint64_t v13 = [v6 caseStorage];
    int v14 = [v13 caseDomain];
    int v15 = [v12 isEqualToString:v14];

    goto LABEL_5;
  }
  uint64_t v9 = [v6 caseStorage];
  int v10 = [v9 caseDomain];

  if (v10) {
    goto LABEL_4;
  }
  int v15 = 1;
LABEL_5:
  uint64_t v16 = [v5 caseStorage];
  id v17 = [v16 caseType];
  if (v17)
  {
  }
  else
  {
    long long v18 = [v6 caseStorage];
    long long v19 = [v18 caseType];

    if (!v19) {
      goto LABEL_9;
    }
  }
  long long v20 = [v5 caseStorage];
  long long v21 = [v20 caseType];
  id v22 = [v6 caseStorage];
  id v23 = [v22 caseType];
  v15 &= [v21 isEqualToString:v23];

LABEL_9:
  __int16 v24 = [v5 caseStorage];
  uint64_t v25 = [v24 caseSubtype];
  if (v25)
  {
  }
  else
  {
    id v26 = [v6 caseStorage];
    uint64_t v27 = [v26 caseSubtype];

    if (!v27) {
      goto LABEL_13;
    }
  }
  long long v28 = [v5 caseStorage];
  long long v29 = [v28 caseSubtype];
  long long v30 = [v6 caseStorage];
  id v31 = [v30 caseSubtype];
  v15 &= [v29 isEqualToString:v31];

LABEL_13:
  uint64_t v32 = [v5 caseStorage];
  id v33 = [v32 caseSubtypeContext];
  if (v33)
  {
  }
  else
  {
    __int16 v34 = [v6 caseStorage];
    id v35 = [v34 caseSubtypeContext];

    if (!v35) {
      goto LABEL_17;
    }
  }
  uint64_t v36 = [v5 caseStorage];
  id v37 = [v36 caseSubtypeContext];
  id v38 = [v6 caseStorage];
  long long v39 = [v38 caseSubtypeContext];
  v15 &= [v37 isEqualToString:v39];

LABEL_17:
  long long v40 = [v5 caseStorage];
  id v41 = [v40 caseDetectedProcess];
  if (v41)
  {

LABEL_20:
    uint64_t v44 = [v5 caseStorage];
    __int16 v45 = [v44 caseDetectedProcess];
    uint64_t v46 = [v6 caseStorage];
    uint64_t v47 = [v46 caseDetectedProcess];
    v15 &= [v45 isEqualToString:v47];

    goto LABEL_21;
  }
  __int16 v42 = [v6 caseStorage];
  __int16 v43 = [v42 caseDetectedProcess];

  if (v43) {
    goto LABEL_20;
  }
LABEL_21:

  return v15;
}

- (id)diagnosticCaseDictionariesFromIdentifier:(id)a3 withEvents:(BOOL)a4 count:(unint64_t)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a5 - 21 <= 0xFFFFFFFFFFFFFFEBLL)
  {
    int v10 = casemanagementLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109376;
      int v18 = 20;
      __int16 v19 = 2048;
      uint64_t v20 = 20;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "Constraining cases listing to a max of %d (was requested %ld)", buf, 0x12u);
    }

    a5 = 20;
  }
  int v11 = (void *)MEMORY[0x21050CEB0]();
  __int16 v12 = [(DiagnosticCaseStorageAnalytics *)self->_caseStorageAnalytics historicalDiagnosticCaseStorageDictionaryFromIdentifier:v8 withEvents:v6 count:a5];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__DiagnosticCaseManager_diagnosticCaseDictionariesFromIdentifier_withEvents_count___block_invoke;
  v15[3] = &unk_263FC3F60;
  id v13 = v9;
  id v16 = v13;
  [v12 enumerateObjectsUsingBlock:v15];

  return v13;
}

uint64_t __83__DiagnosticCaseManager_diagnosticCaseDictionariesFromIdentifier_withEvents_count___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = +[DiagnosticCase generateCaseSummaryFromCaseStorageDictionary:v5];
    if (v3) {
      [*(id *)(a1 + 32) addObject:v3];
    }
  }

  return MEMORY[0x270F9A790]();
}

- (void)getHistoricalDiagnosicCaseDictionaryFromIdentifier:(id)a3 withEvents:(BOOL)a4 count:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  __int16 v12 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __99__DiagnosticCaseManager_getHistoricalDiagnosicCaseDictionaryFromIdentifier_withEvents_count_reply___block_invoke;
  block[3] = &unk_263FC3F88;
  block[4] = self;
  id v16 = v10;
  BOOL v19 = a4;
  id v17 = v11;
  unint64_t v18 = a5;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(v12, block);
}

void __99__DiagnosticCaseManager_getHistoricalDiagnosicCaseDictionaryFromIdentifier_withEvents_count_reply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21050CEB0]();
  id v3 = [*(id *)(a1 + 32) diagnosticCaseDictionariesFromIdentifier:*(void *)(a1 + 40) withEvents:*(unsigned __int8 *)(a1 + 64) count:*(void *)(a1 + 56)];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (void)listCaseSummariesWithIdentifiers:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__DiagnosticCaseManager_listCaseSummariesWithIdentifiers_reply___block_invoke;
  block[3] = &unk_263FC2F28;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __64__DiagnosticCaseManager_listCaseSummariesWithIdentifiers_reply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21050CEB0]();
  id v3 = [*(id *)(a1 + 32) caseSummariesWithIdentifiers:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (id)caseSummariesWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = (void *)MEMORY[0x21050CEB0]();
  id v7 = [(DiagnosticCaseSummaryAnalytics *)self->_caseSummaryAnalytics fetchCaseSummariesWithIdentifiers:v4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __54__DiagnosticCaseManager_caseSummariesWithIdentifiers___block_invoke;
  v10[3] = &unk_263FC3F60;
  id v8 = v5;
  id v11 = v8;
  [v7 enumerateObjectsUsingBlock:v10];

  return v8;
}

void __54__DiagnosticCaseManager_caseSummariesWithIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = +[DiagnosticCaseSummaryAnalytics listSummaryItemFromCaseSummaryDictionary:v5];
    [v3 addObject:v4];
  }
}

- (void)listCaseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__DiagnosticCaseManager_listCaseSummariesOfType_fromIdentifier_count_reply___block_invoke;
  block[3] = &unk_263FC3FB0;
  block[4] = self;
  id v18 = v10;
  id v20 = v12;
  unint64_t v21 = a5;
  id v19 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __76__DiagnosticCaseManager_listCaseSummariesOfType_fromIdentifier_count_reply___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21050CEB0]();
  id v3 = [*(id *)(a1 + 32) caseSummariesOfType:*(void *)(a1 + 40) fromIdentifier:*(void *)(a1 + 48) count:*(void *)(a1 + 64)];
  uint64_t v4 = *(void *)(a1 + 56);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

- (id)caseSummariesOfType:(id)a3 fromIdentifier:(id)a4 count:(unint64_t)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a5 - 21 <= 0xFFFFFFFFFFFFFFEBLL)
  {
    id v11 = casemanagementLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109376;
      int v19 = 20;
      __int16 v20 = 2048;
      uint64_t v21 = 20;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEFAULT, "Constraining cases listing to a max of %d (was requested %ld)", buf, 0x12u);
    }

    a5 = 20;
  }
  id v12 = (void *)MEMORY[0x21050CEB0]();
  id v13 = [(DiagnosticCaseSummaryAnalytics *)self->_caseSummaryAnalytics fetchCaseSummariesOfType:v8 fromIdentifier:v9 count:a5];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__DiagnosticCaseManager_caseSummariesOfType_fromIdentifier_count___block_invoke;
  v16[3] = &unk_263FC3F60;
  id v14 = v10;
  id v17 = v14;
  [v13 enumerateObjectsUsingBlock:v16];

  return v14;
}

void __66__DiagnosticCaseManager_caseSummariesOfType_fromIdentifier_count___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = +[DiagnosticCaseSummaryAnalytics listSummaryItemFromCaseSummaryDictionary:v5];
    [v3 addObject:v4];
  }
}

- (id)_updateSignatureWithBuildVariantInfoAndFlags:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = (void *)[a3 mutableCopy];
  id v5 = +[SystemProperties sharedInstance];
  id v6 = [v5 buildVariant];
  id v7 = casemanagementLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "This case's buildVariant is %@", (uint8_t *)&v12, 0xCu);
  }

  [v4 setObject:v6 forKey:@"build_variant"];
  if ([v5 internalBuild])
  {
    id v8 = [(DiagnosticCaseManager *)self configManager];
    int v9 = [v8 isDeviceUnderTest];

    if (v9)
    {
      id v10 = casemanagementLogHandle();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_INFO, "Flagging this case as generated from an ABC DUT device.", (uint8_t *)&v12, 2u);
      }

      [v4 setObject:@"isABCDUT" forKey:@"internal_flags"];
    }
  }

  return v4;
}

- (void)_processRemoteIDSTriggers:(id)a3 validFor:(double)a4 signature:(id)a5 sessionID:(id)a6 reply:(id)a7
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [v13 objectForKeyedSubscript:@"groupID"];
  uint64_t v17 = [v16 length];
  id v18 = casemanagementLogHandle();
  int v19 = v18;
  if (v17)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138543362;
      id v32 = v14;
      _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_DEBUG, "Ready to trigger a remote case for session %{public}@", buf, 0xCu);
    }

    if (a4 < 1.0) {
      a4 = 3600.0;
    }
    __int16 v20 = [(DiagnosticCaseManager *)self liaison];
    queue = self->_queue;
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_215;
    v25[3] = &unk_263FC4000;
    uint64_t v22 = (id *)v26;
    id v23 = v12;
    v26[0] = v23;
    v26[1] = self;
    id v27 = v14;
    id v28 = v15;
    [v20 remotelyTriggerSessionWithSignature:v13 forDestinations:v23 groupIdentifier:v16 validFor:queue queue:v25 reply:a4];

    goto LABEL_11;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_ERROR, "Remote case trigger requires a group identifier.", buf, 2u);
  }

  if (v15)
  {
    __int16 v24 = [(DiagnosticCaseManager *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke;
    block[3] = &unk_263FC3970;
    uint64_t v22 = &v30;
    id v30 = v15;
    dispatch_async(v24, block);

LABEL_11:
  }
}

void __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke(uint64_t a1)
{
  v4[3] = *MEMORY[0x263EF8340];
  v3[0] = @"name";
  v3[1] = @"result";
  v4[0] = @"IDSRemoteTrigger";
  v4[1] = @"failure";
  v3[2] = @"status";
  v4[2] = @"Cancelled";
  v2 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_215(id *a1, int a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"errorObj"];
  id v7 = casemanagementLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v9 = [a1[4] count];
    *(_DWORD *)long long buf = 134217984;
    uint64_t v30 = v9;
    id v10 = "Remote case trigger for %ld devices was successful";
    id v11 = v7;
    uint32_t v12 = 12;
  }
  else
  {
    if (!v8) {
      goto LABEL_7;
    }
    uint64_t v13 = [a1[4] count];
    *(_DWORD *)long long buf = 134218242;
    uint64_t v30 = v13;
    __int16 v31 = 2112;
    id v32 = v6;
    id v10 = "Remote case trigger for %ld devices was NOT successful (error: %@)";
    id v11 = v7;
    uint32_t v12 = 22;
  }
  _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  id v14 = casemanagementLogHandle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    uint64_t v30 = (uint64_t)v5;
    _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEBUG, "Liaison result was: %@", buf, 0xCu);
  }

  id v15 = [v5 objectForKeyedSubscript:@"IDSMessageIdentifier"];
  if ([v15 length])
  {
    id v16 = (void *)*((void *)a1[5] + 15);
    if (!v16)
    {
      uint64_t v17 = [MEMORY[0x263EFF9A0] dictionary];
      id v18 = a1[5];
      int v19 = (void *)v18[15];
      v18[15] = v17;

      id v16 = (void *)*((void *)a1[5] + 15);
    }
    [v16 setObject:a1[6] forKeyedSubscript:v15];
  }
  id v20 = a1[5];
  id v21 = a1[6];
  uint64_t v22 = [v20 queue];
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_216;
  v27[3] = &unk_263FC3FD8;
  id v28 = a1[6];
  [v20 addToSession:v21 event:v5 payload:0 queue:v22 reply:v27];

  if (a1[7])
  {
    id v23 = [a1[5] queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_219;
    block[3] = &unk_263FC2E88;
    id v26 = a1[7];
    id v25 = v5;
    dispatch_async(v23, block);
  }
}

void __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_216(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [v3 objectForKeyedSubscript:@"success"];
  id v5 = [v3 objectForKeyedSubscript:@"reason"];

  id v6 = casemanagementLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if ([v4 BOOLValue]) {
      BOOL v8 = "was successful";
    }
    else {
      BOOL v8 = "failed";
    }
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2080;
    uint32_t v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = [v5 integerValue];
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEBUG, "Adding remote trigger event status to session %{public}@ %s. (Reason code %ld)", (uint8_t *)&v9, 0x20u);
  }
}

uint64_t __86__DiagnosticCaseManager__processRemoteIDSTriggers_validFor_signature_sessionID_reply___block_invoke_219(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)_processReportActions:(id)a3 session:(id)a4
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v39 = a4;
  id v6 = objc_msgSend(v5, "objectForKeyedSubscript:");
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v7 = [v6 BOOLValue];
    BOOL v8 = casemanagementLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = "disabled";
      if (v7) {
        int v9 = "enabled";
      }
      *(_DWORD *)long long buf = 136315138;
      id v41 = v9;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_INFO, "DiagnosticExtensions action is %s by client request", buf, 0xCu);
    }
    id v10 = 0;
LABEL_14:

    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v6;
    BOOL v8 = casemanagementLogHandle();
    int v7 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315394;
      id v41 = "enabled";
      __int16 v42 = 2112;
      id v43 = v10;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_INFO, "DiagnosticExtensions action is %s by client request with options %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if (v6)
  {
    BOOL v8 = casemanagementLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      __int16 v11 = (objc_class *)objc_opt_class();
      uint32_t v12 = NSStringFromClass(v11);
      *(_DWORD *)long long buf = 138412546;
      id v41 = (const char *)v6;
      __int16 v42 = 2112;
      id v43 = v12;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_ERROR, "Found unexpected object %@ (class %@) for DiagnosticExtensions action parameter. Enabled by default", buf, 0x16u);
    }
    id v10 = 0;
    int v7 = 1;
    goto LABEL_14;
  }
  id v10 = 0;
  int v7 = 1;
LABEL_15:
  __int16 v13 = [v5 objectForKeyedSubscript:@"logarchive"];
  objc_opt_class();
  id v37 = v13;
  if (objc_opt_isKindOfClass())
  {
    int v14 = [v13 BOOLValue];
    uint64_t v15 = casemanagementLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = "disabled";
      if (v14) {
        id v16 = "enabled";
      }
      *(_DWORD *)long long buf = 136315138;
      id v41 = v16;
      _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_INFO, "Log archive collection is %s by client request", buf, 0xCu);
    }
LABEL_24:

    goto LABEL_25;
  }
  if (v13)
  {
    uint64_t v15 = casemanagementLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = (objc_class *)objc_opt_class();
      id v18 = NSStringFromClass(v17);
      *(_DWORD *)long long buf = 138412546;
      id v41 = (const char *)v13;
      __int16 v42 = 2112;
      id v43 = v18;
      _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_ERROR, "Found unexpected object %@ (class %@) for log archive action parameter. Enabled by default", buf, 0x16u);
    }
    int v14 = 1;
    goto LABEL_24;
  }
  int v14 = 1;
LABEL_25:
  int v19 = [v5 objectForKeyedSubscript:@"cnslogs"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v20 = [v19 BOOLValue];
    id v21 = casemanagementLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = "disabled";
      if (v7) {
        uint64_t v22 = "enabled";
      }
      *(_DWORD *)long long buf = 136315138;
      id v41 = v22;
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_INFO, "Crashes and Spins log collection is %s by client request", buf, 0xCu);
    }
LABEL_34:
    int v25 = v7;

    goto LABEL_35;
  }
  if (v19)
  {
    id v21 = casemanagementLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      id v23 = (objc_class *)objc_opt_class();
      __int16 v24 = NSStringFromClass(v23);
      *(_DWORD *)long long buf = 138412546;
      id v41 = (const char *)v19;
      __int16 v42 = 2112;
      id v43 = v24;
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_ERROR, "Found unexpected object %@ (class %@) for crashes and spin logs action parameter. Enabled by default", buf, 0x16u);
    }
    int v20 = 1;
    goto LABEL_34;
  }
  int v25 = v7;
  int v20 = 1;
LABEL_35:
  id v26 = v6;
  id v38 = v5;
  id v27 = [v5 objectForKeyedSubscript:@"gni"];
  objc_opt_class();
  id v28 = v10;
  if (objc_opt_isKindOfClass())
  {
    int v29 = [v27 BOOLValue];
    uint64_t v30 = casemanagementLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      __int16 v31 = "disabled";
      if (v25) {
        __int16 v31 = "enabled";
      }
      *(_DWORD *)long long buf = 136315138;
      id v41 = v31;
      _os_log_impl(&dword_209DBA000, v30, OS_LOG_TYPE_INFO, "get-network-info log collection action is %s by client request", buf, 0xCu);
    }
LABEL_44:

    goto LABEL_45;
  }
  if (v27)
  {
    uint64_t v30 = casemanagementLogHandle();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      id v32 = (objc_class *)objc_opt_class();
      uint64_t v33 = NSStringFromClass(v32);
      *(_DWORD *)long long buf = 138412546;
      id v41 = (const char *)v27;
      __int16 v42 = 2112;
      id v43 = v33;
      _os_log_impl(&dword_209DBA000, v30, OS_LOG_TYPE_ERROR, "Found unexpected object %@ (class %@) for get-network-info action parameter. Enabled by default", buf, 0x16u);
    }
    int v29 = 1;
    goto LABEL_44;
  }
  int v29 = 1;
LABEL_45:
  __int16 v34 = +[SystemProperties sharedInstance];
  int v35 = [v34 customerSeedBuild];

  if (v35)
  {
    uint64_t v36 = casemanagementLogHandle();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v36, OS_LOG_TYPE_INFO, "Customer Seed installs will only enable DiagnosticExtension collection", buf, 2u);
    }

    int v20 = 0;
    int v29 = 0;
    int v14 = 0;
  }
  if (v25) {
    [v39 addRequiredAction:@"diagext" option:v28 attachmentType:@"diagext" pattern:0];
  }
  if (v14) {
    [v39 addRequiredAction:@"FetchLogArchiveReporter" option:0 attachmentType:@"logarchive" pattern:@"logs-"];
  }
  if (v20) {
    [v39 addRequiredAction:@"CrashesAndSpinsReporter" option:0 attachmentType:@"cnslogs" pattern:@"crashes_and_spins"];
  }
  if (v29) {
    [v39 addRequiredAction:@"GetNetworkInfoReporter" option:0 attachmentType:@"gni" pattern:@"get_network_info"];
  }
}

- (unint64_t)_processProbeActions:(id)a3 session:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  BOOL v8 = [v7 caseId];

  if (v8)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __54__DiagnosticCaseManager__processProbeActions_session___block_invoke;
    v12[3] = &unk_263FC4028;
    void v12[4] = self;
    id v13 = v7;
    int v14 = &v16;
    [v6 enumerateKeysAndObjectsUsingBlock:v12];
    unint64_t v9 = v17[3];
  }
  else
  {
    id v10 = casemanagementLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_ERROR, "Cannot process probe actions for a session with no identifier.", buf, 2u);
    }

    unint64_t v9 = v17[3];
  }
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __54__DiagnosticCaseManager__processProbeActions_session___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v7 = casemanagementLogHandle();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    BOOL v8 = (objc_class *)objc_opt_class();
    unint64_t v9 = NSStringFromClass(v8);
    int v14 = 138412546;
    uint64_t v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    id v10 = "Found unexpected object %@ of class %@ as key in actions dictionary.";
    __int16 v11 = v7;
    os_log_type_t v12 = OS_LOG_TYPE_ERROR;
    uint32_t v13 = 22;
    goto LABEL_8;
  }
  id v7 = v5;
  if (![v7 isEqualToString:@"pcap"])
  {
    unint64_t v9 = casemanagementLogHandle();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      goto LABEL_10;
    }
    int v14 = 138412290;
    uint64_t v15 = v7;
    id v10 = "Skip processing actions key %@ (unsupported, or not a probe)";
    __int16 v11 = v9;
    os_log_type_t v12 = OS_LOG_TYPE_DEBUG;
    uint32_t v13 = 12;
LABEL_8:
    _os_log_impl(&dword_209DBA000, v11, v12, v10, (uint8_t *)&v14, v13);
    goto LABEL_9;
  }
  [*(id *)(a1 + 32) _processActionsForPacketCaptureProbe:v6 session:*(void *)(a1 + 40)];
  ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
LABEL_10:
}

- (void)_processActionsForPacketCaptureProbe:(id)a3 session:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(DiagnosticCaseManager *)self configManager];
  int v9 = [v8 autoBugCaptureSensitivePayloads];

  if (!v9)
  {
    uint32_t v13 = casemanagementLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEFAULT, "Will not collect packet capture since collecting sensitive payloads are not allowed.", (uint8_t *)&v21, 2u);
    }
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = &unk_26BDF5AE0;
      if (![v6 BOOLValue]) {
        goto LABEL_20;
      }
      goto LABEL_14;
    }
    uint32_t v13 = casemanagementLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      int v20 = NSStringFromClass(v19);
      int v21 = 138412546;
      id v22 = v6;
      __int16 v23 = 2112;
      __int16 v24 = v20;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_ERROR, "Found unexpected object %@ of class %@ as object in actions dictionary.", (uint8_t *)&v21, 0x16u);
    }
LABEL_19:

    id v12 = &unk_26BDF5AE0;
    goto LABEL_20;
  }
  id v10 = v6;
  __int16 v11 = [v10 objectForKeyedSubscript:@"duration"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
  }
  else
  {
    int v14 = casemanagementLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = (objc_class *)objc_opt_class();
      __int16 v16 = NSStringFromClass(v15);
      int v21 = 138412546;
      id v22 = v11;
      __int16 v23 = 2112;
      __int16 v24 = v16;
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_ERROR, "Found unexpected object %@ of class %@ for value of duration in probe parameter dictionary.", (uint8_t *)&v21, 0x16u);
    }
    id v12 = &unk_26BDF5AE0;
  }

LABEL_14:
  uint64_t v17 = casemanagementLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = [v7 caseId];
    int v21 = 138543362;
    id v22 = v18;
    _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_DEFAULT, "Packet capture probe requested for case %{public}@", (uint8_t *)&v21, 0xCu);
  }
  [(DiagnosticCaseManager *)self startPacketCaptureForSession:v7 duration:v12];
LABEL_20:
}

- (void)startPeriodicTimer
{
  if (!self->periodicTimer)
  {
    id v3 = casemanagementLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_INFO, "Starting periodic diagnostic session management.", buf, 2u);
    }

    uint64_t v4 = [(DiagnosticCaseManager *)self queue];
    id v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, v4);
    periodicTimer = self->periodicTimer;
    self->periodicTimer = v5;

    id v7 = self->periodicTimer;
    dispatch_time_t v8 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v7, v8, 0xDF8475800uLL, 0x2540BE400uLL);
    int v9 = self->periodicTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __43__DiagnosticCaseManager_startPeriodicTimer__block_invoke;
    handler[3] = &unk_263FC2DC0;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->periodicTimer);
  }
}

uint64_t __43__DiagnosticCaseManager_startPeriodicTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) periodicSessionManagement];
}

- (void)stopPeriodicTimer
{
  if (self->periodicTimer)
  {
    id v3 = casemanagementLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_INFO, "Stopping periodic diagnostic session management.", v5, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->periodicTimer);
    periodicTimer = self->periodicTimer;
    self->periodicTimer = 0;
  }
}

- (void)periodicSessionManagement
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSince1970];
  double v5 = v4;

  id v6 = [MEMORY[0x263EFF980] array];
  id v7 = [(DiagnosticCaseManager *)self activeCases];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        [v12 caseOpenedTime];
        if (v5 > v13 + 900.0) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v26 objects:v32 count:16];
    }
    while (v9);
  }
  if ([v6 count])
  {
    int v14 = casemanagementLogHandle();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [v6 count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v31 = v15;
      _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_INFO, "Found %ld overdue sessions. Force closing...", buf, 0xCu);
    }

    __int16 v16 = [(DiagnosticCaseManager *)self queue];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    id v22 = __50__DiagnosticCaseManager_periodicSessionManagement__block_invoke;
    __int16 v23 = &unk_263FC3430;
    __int16 v24 = self;
    id v25 = v6;
    dispatch_async(v16, &v20);
  }
  uint64_t v17 = [(DiagnosticCaseManager *)self activeCases];
  uint64_t v18 = [v17 count];

  if (!v18)
  {
    uint64_t v19 = casemanagementLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v19, OS_LOG_TYPE_INFO, "No diagnostic sessions are currently active.", buf, 2u);
    }

    [(DiagnosticCaseManager *)self stopPeriodicTimer];
    [(NSMutableDictionary *)self->activeProbes removeAllObjects];
  }
}

uint64_t __50__DiagnosticCaseManager_periodicSessionManagement__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endSessions:*(void *)(a1 + 40) forced:1];
}

- (void)updateSignatureWithBundleIdentifier:(id)a3 reply:(id)a4
{
  id v9 = a3;
  double v5 = (void (**)(id, id))a4;
  id v6 = [v9 objectForKeyedSubscript:@"bundleID"];
  id v7 = [v9 objectForKeyedSubscript:@"machUUID"];
  uint64_t v8 = [v9 objectForKeyedSubscript:@"pid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    [v8 integerValue];
  }
  if (![v6 length]) {
    [v7 length];
  }
  v5[2](v5, v9);
}

- (void)startPacketCaptureForSession:(id)a3 duration:(id)a4
{
  v45[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [TCPDumpProbe alloc];
  id v9 = [(DiagnosticCaseManager *)self queue];
  uint64_t v10 = [(TCPDumpProbe *)v8 initWithQueue:v9];

  __int16 v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  double v13 = [v6 caseId];
  int v14 = [v13 UUIDString];

  uint64_t v15 = [(NSMutableDictionary *)self->activeProbes objectForKeyedSubscript:v14];
  if (!v15)
  {
    uint64_t v15 = [MEMORY[0x263EFF9A0] dictionary];
    [(NSMutableDictionary *)self->activeProbes setObject:v15 forKeyedSubscript:v14];
  }
  [v15 setObject:v10 forKeyedSubscript:v12];
  [(TestProbe *)v10 setDiagSessionUUID:v14];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke;
  aBlock[3] = &unk_263FC4078;
  id v42 = v12;
  id v43 = self;
  id v44 = v15;
  id v31 = v15;
  id v16 = v12;
  uint64_t v17 = _Block_copy(aBlock);
  uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
  [v18 setObject:@"probe" forKeyedSubscript:@"type"];
  [v18 setObject:v16 forKeyedSubscript:@"name"];
  [v18 setObject:@"Requesting" forKeyedSubscript:@"status"];
  uint64_t v19 = NSNumber;
  uint64_t v20 = [MEMORY[0x263EFF910] date];
  [v20 timeIntervalSince1970];
  uint64_t v21 = objc_msgSend(v19, "numberWithDouble:");
  [v18 setObject:v21 forKeyedSubscript:@"timestamp"];

  [v18 setObject:v7 forKeyedSubscript:@"requestedDuration"];
  v45[0] = v18;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v45 count:1];
  v39[0] = MEMORY[0x263EF8330];
  v39[1] = 3221225472;
  v39[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2;
  v39[3] = &unk_263FC4050;
  id v23 = v14;
  id v40 = v23;
  [(DiagnosticCaseManager *)self addToSession:v23 events:v22 payload:0 reply:v39];

  [v6 addRequiredAttachmentType:@"pcap" pattern:@".pcapng"];
  [v7 doubleValue];
  double v25 = v24;

  long long v26 = [(DiagnosticCaseManager *)self configManager];
  long long v27 = [v26 logArchivePath];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_247;
  v36[3] = &unk_263FC40C8;
  v36[4] = self;
  id v37 = v23;
  id v38 = v17;
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_251;
  v32[3] = &unk_263FC4118;
  v32[4] = self;
  uint64_t v33 = v10;
  id v34 = v37;
  id v35 = v38;
  id v28 = v38;
  id v29 = v37;
  uint64_t v30 = v10;
  [(TCPDumpProbe *)v30 startTCPDumpWithDuration:v27 destinationPath:v36 tcpDumpStarted:v32 tcpDumpCompleted:v25];
}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke(uint64_t a1, void *a2, int a3, int a4)
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v7 = a2;
  switch(a3)
  {
    case 1:
      if (a4) {
        goto LABEL_23;
      }
      uint64_t v8 = casemanagementLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543362;
        id v34 = v7;
        _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ started successfully.", buf, 0xCu);
      }

      id v9 = @"In Progress";
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      goto LABEL_24;
    case 2:
      if (!a4) {
        goto LABEL_23;
      }
      int v14 = casemanagementLogHandle();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543362;
        id v34 = v7;
        _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ completed successfully.", buf, 0xCu);
      }

      id v9 = @"success";
      int v10 = 0;
      int v11 = 1;
      goto LABEL_19;
    case 3:
      uint64_t v15 = casemanagementLogHandle();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543362;
        id v34 = v7;
        _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ failed.", buf, 0xCu);
      }

      id v9 = @"Finished";
      int v11 = 0;
      int v10 = 1;
      goto LABEL_19;
    case 4:
      id v16 = casemanagementLogHandle();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543362;
        id v34 = v7;
        _os_log_impl(&dword_209DBA000, v16, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ cancelled.", buf, 0xCu);
      }

      id v9 = @"Cancelled";
      int v10 = 0;
      int v11 = 0;
LABEL_19:
      int v12 = 1;
      goto LABEL_24;
    case 5:
      uint64_t v17 = casemanagementLogHandle();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543362;
        id v34 = v7;
        _os_log_impl(&dword_209DBA000, v17, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ pending cancellation.", buf, 0xCu);
      }

      goto LABEL_23;
    default:
      double v13 = casemanagementLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138543618;
        id v34 = v7;
        __int16 v35 = 1024;
        int v36 = a3;
        _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_INFO, "TCPDumpProbe for session %{public}@ returned unexpected status update (%d)", buf, 0x12u);
      }

LABEL_23:
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      id v9 = 0;
LABEL_24:
      if ([(__CFString *)v9 length])
      {
        uint64_t v18 = [MEMORY[0x263EFF9A0] dictionary];
        [v18 setObject:@"probe" forKeyedSubscript:@"type"];
        [v18 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"name"];
        [v18 setObject:v9 forKeyedSubscript:@"status"];
        uint64_t v19 = NSNumber;
        uint64_t v20 = [MEMORY[0x263EFF910] date];
        [v20 timeIntervalSince1970];
        uint64_t v21 = objc_msgSend(v19, "numberWithDouble:");
        [v18 setObject:v21 forKeyedSubscript:@"timestamp"];

        if (v12)
        {
          id v22 = kSymptomDiagnosticEventResultSuccess;
          if (!v11) {
            id v22 = kSymptomDiagnosticEventResultFailure;
          }
          [v18 setObject:*v22 forKeyedSubscript:@"result"];
        }
        id v23 = *(void **)(a1 + 40);
        id v32 = v18;
        double v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
        v30[0] = MEMORY[0x263EF8330];
        v30[1] = 3221225472;
        v30[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_237;
        v30[3] = &unk_263FC4050;
        id v31 = v7;
        [v23 addToSession:v31 events:v24 payload:0 reply:v30];
      }
      if (v12)
      {
        [*(id *)(a1 + 48) setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
        double v25 = casemanagementLogHandle();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_INFO, "TCPDumpProbe is finished.", buf, 2u);
        }

        if (v10)
        {
          long long v26 = casemanagementLogHandle();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEFAULT, "Canceling session due to TCPDump already being in progress", buf, 2u);
          }

          [*(id *)(a1 + 40) cancelSessionWithIdentifier:v7];
        }
        else
        {
          long long v27 = [*(id *)(a1 + 40) queue];
          v28[0] = MEMORY[0x263EF8330];
          v28[1] = 3221225472;
          v28[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_239;
          v28[3] = &unk_263FC3430;
          v28[4] = *(void *)(a1 + 40);
          id v29 = v7;
          dispatch_async(v27, v28);
        }
      }

      return;
  }
}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_237(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v4 = casemanagementLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "Result for adding probe status event to %{public}@: %d", (uint8_t *)&v6, 0x12u);
  }
}

uint64_t __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_239(uint64_t a1)
{
  return [*(id *)(a1 + 32) endSessionIfProbesCompletedFor:*(void *)(a1 + 40)];
}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v4 = casemanagementLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412546;
    uint64_t v7 = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "Result for adding probe status event to %@: %d", (uint8_t *)&v6, 0x12u);
  }
}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_247(id *a1, int a2)
{
  double v4 = [a1[4] queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2_248;
  block[3] = &unk_263FC40A0;
  id v6 = a1[5];
  int v8 = a2;
  id v7 = a1[6];
  dispatch_async(v4, block);
}

uint64_t __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2_248(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = +[TestProbe testProbeStatusString:*(unsigned int *)(a1 + 48)];
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2112;
    int v9 = v4;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "tcpDumpStarted status for session %{public}@: %@", (uint8_t *)&v6, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_251(id *a1, int a2)
{
  double v4 = [a1[4] queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2_252;
  block[3] = &unk_263FC40F0;
  int v12 = a2;
  id v8 = a1[5];
  id v5 = a1[6];
  id v6 = a1[4];
  id v9 = v5;
  id v10 = v6;
  id v11 = a1[7];
  dispatch_async(v4, block);
}

uint64_t __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_2_252(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (*(_DWORD *)(a1 + 64) == 2)
  {
    v2 = [*(id *)(a1 + 32) probeOutputFilePaths];
    uint64_t v3 = casemanagementLogHandle();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [v2 count];
      id v5 = *(void **)(a1 + 40);
      *(_DWORD *)long long buf = 134218242;
      uint64_t v18 = v4;
      __int16 v19 = 2114;
      uint64_t v20 = v5;
      _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEFAULT, "Ready to add %ld files generated from a probe as payload to session %{public}@", buf, 0x16u);
    }

    if ([v2 count])
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v6 = *(void **)(a1 + 48);
      v15[0] = @"path";
      v15[1] = @"sandbox_ext_token_dict";
      v16[0] = v2;
      v16[1] = MEMORY[0x263EFFA78];
      id v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_253;
      v13[3] = &unk_263FC4050;
      id v14 = *(id *)(a1 + 40);
      [v6 addToSession:v7 events:0 payload:v8 reply:v13];
    }
  }
  id v9 = casemanagementLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = +[TestProbe testProbeStatusString:*(unsigned int *)(a1 + 64)];
    *(_DWORD *)long long buf = 138543618;
    uint64_t v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_INFO, "tcpDumpCompleted status for session %{public}@: %@", buf, 0x16u);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __63__DiagnosticCaseManager_startPacketCaptureForSession_duration___block_invoke_253(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = casemanagementLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 1024;
    int v9 = a2;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "Result for adding probe output files to %{public}@: %d", (uint8_t *)&v6, 0x12u);
  }
}

- (void)cancelProbesForSession:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->activeProbes objectForKeyedSubscript:v4];
  if ([v5 count])
  {
    int v6 = casemanagementLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218242;
      uint64_t v18 = [v5 count];
      __int16 v19 = 2114;
      id v20 = v4;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_INFO, "Cancelling all %lu probes for session: %{public}@", buf, 0x16u);
    }

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v7 = objc_msgSend(v5, "allValues", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * v11++) cancelTest:0];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (void)endSessionIfProbesCompletedFor:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->activeProbes objectForKeyedSubscript:v4];
  uint64_t v6 = [v5 count];
  uint64_t v7 = casemanagementLogHandle();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      int v9 = 134218242;
      uint64_t v10 = [v5 count];
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Waiting for %ld requested probes to complete before ending session %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if (v8)
    {
      int v9 = 138543362;
      uint64_t v10 = (uint64_t)v4;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "All requested probes completed for session %{public}@. Ready to end.", (uint8_t *)&v9, 0xCu);
    }

    [(NSMutableDictionary *)self->activeProbes setObject:0 forKeyedSubscript:v4];
    [(DiagnosticCaseManager *)self endSessionWithIdentifier:v4 forced:0 onlyIfReady:1];
  }
}

- (void)remoteTriggerDeliveryUpdateEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = casemanagementLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_209DBA000, v5, OS_LOG_TYPE_INFO, "IDS remote trigger send message update: %@", buf, 0xCu);
  }

  uint64_t v6 = [v4 objectForKeyedSubscript:@"IDSMessageIdentifier"];
  uint64_t v7 = [(NSMutableDictionary *)self->activeIDSMessages objectForKeyedSubscript:v6];
  BOOL v8 = casemanagementLogHandle();
  int v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v14 = v7;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEBUG, "Found session identifier %@ for IDS message identifier %@", buf, 0x16u);
    }

    uint64_t v10 = [(DiagnosticCaseManager *)self queue];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __58__DiagnosticCaseManager_remoteTriggerDeliveryUpdateEvent___block_invoke;
    v11[3] = &unk_263FC3FD8;
    id v12 = v7;
    [(DiagnosticCaseManager *)self addToSession:v12 event:v4 payload:0 queue:v10 reply:v11];

    int v9 = v12;
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEFAULT, "Could not find session identifier for IDS message identifier %{public}@ (most likely received this update after the session was closed)", buf, 0xCu);
  }
}

void __58__DiagnosticCaseManager_remoteTriggerDeliveryUpdateEvent___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"success"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"reason"];

  uint64_t v6 = casemanagementLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    if ([v4 BOOLValue]) {
      BOOL v8 = "was successful";
    }
    else {
      BOOL v8 = "failed";
    }
    int v9 = 138543874;
    uint64_t v10 = v7;
    __int16 v11 = 2080;
    id v12 = v8;
    __int16 v13 = 2048;
    uint64_t v14 = [v5 integerValue];
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEBUG, "Adding remote trigger event update to session %{public}@ %s. (Reason code %ld)", (uint8_t *)&v9, 0x20u);
  }
}

- (void)requestSnapshotWithSignature:(id)a3 flags:(unint64_t)a4 events:(id)a5
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = casemanagementLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_INFO, "Ready to request remotely triggered case with signature: %@", (uint8_t *)&v11, 0xCu);
  }

  [(DiagnosticCaseManager *)self startSessionWithSignature:v8 flags:a4 preferredTimeout:v9 events:0 payload:0 actions:&__block_literal_global_256 reply:0.0];
}

void __67__DiagnosticCaseManager_requestSnapshotWithSignature_flags_events___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  v21[2] = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  int v11 = casemanagementLogHandle();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (a5)
  {
    if (v12)
    {
      int v16 = 138544130;
      id v17 = v8;
      __int16 v18 = 2114;
      id v19 = v9;
      __int16 v20 = 1024;
      LODWORD(v21[0]) = a5;
      WORD2(v21[0]) = 2112;
      *(void *)((char *)v21 + 6) = v10;
      uint64_t v13 = "RemoteTrigger: Session %{public}@ [groupID: %{public}@] was NOT accepted. (Reason code: %d) (%@)";
      uint64_t v14 = v11;
      uint32_t v15 = 38;
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    int v16 = 138543874;
    id v17 = v8;
    __int16 v18 = 2114;
    id v19 = v9;
    __int16 v20 = 2112;
    v21[0] = v10;
    uint64_t v13 = "RemoteTrigger: Session %{public}@ [groupID: %{public}@] accepted. (%@)";
    uint64_t v14 = v11;
    uint32_t v15 = 32;
LABEL_6:
    _os_log_impl(&dword_209DBA000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v16, v15);
  }
}

- (id)responseDictWithSuccess:(BOOL)a3 sessionId:(id)a4 reasonCode:(int64_t)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x263EFF9A0];
  id v9 = [NSNumber numberWithBool:v6];
  id v10 = [v8 dictionaryWithObject:v9 forKey:@"success"];

  if ([v7 length]) {
    [v10 setObject:v7 forKey:@"session"];
  }
  if (a5)
  {
    int v11 = [NSNumber numberWithInteger:a5];
    [v10 setObject:v11 forKey:@"reason"];
  }

  return v10;
}

- (void)startSessionWithSignature:(id)a3 duration:(double)a4 events:(id)a5 payload:(id)a6 triggerRemote:(BOOL)a7 queue:(id)a8 reply:(id)a9
{
  BOOL v10 = a7;
  id v16 = a8;
  id v17 = a9;
  __int16 v18 = v17;
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __101__DiagnosticCaseManager_startSessionWithSignature_duration_events_payload_triggerRemote_queue_reply___block_invoke;
  v22[3] = &unk_263FC31D0;
  if (v10) {
    uint64_t v19 = 4;
  }
  else {
    uint64_t v19 = 0;
  }
  id v23 = v16;
  id v24 = v17;
  id v20 = v16;
  id v21 = v18;
  [(DiagnosticCaseManager *)self startSessionWithSignature:a3 flags:v19 preferredTimeout:a5 events:a6 payload:0 actions:v22 reply:a4];
}

void __101__DiagnosticCaseManager_startSessionWithSignature_duration_events_payload_triggerRemote_queue_reply___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5)
{
  id v8 = a2;
  id v9 = a3;
  BOOL v10 = v9;
  if (*(void *)(a1 + 40))
  {
    int v11 = *(NSObject **)(a1 + 32);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __101__DiagnosticCaseManager_startSessionWithSignature_duration_events_payload_triggerRemote_queue_reply___block_invoke_2;
    v12[3] = &unk_263FC4160;
    id v13 = v9;
    id v14 = v8;
    int v16 = a5;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(v11, v12);
  }
}

void __101__DiagnosticCaseManager_startSessionWithSignature_duration_events_payload_triggerRemote_queue_reply___block_invoke_2(uint64_t a1)
{
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  if ([*(id *)(a1 + 32) length]) {
    [v5 setObject:*(void *)(a1 + 32) forKey:@"groupID"];
  }
  if ([*(id *)(a1 + 40) length]) {
    [v5 setObject:*(void *)(a1 + 40) forKey:@"session"];
  }
  v2 = [NSNumber numberWithInt:*(_DWORD *)(a1 + 56) == 0];
  [v5 setObject:v2 forKey:@"success"];

  id v3 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 56)];
  [v5 setObject:v3 forKey:@"reason"];

  id v4 = diagnosticErrorStringForCode(*(_DWORD *)(a1 + 56));
  [v5 setObject:v4 forKey:@"reasonStr"];

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)addToSession:(id)a3 event:(id)a4 payload:(id)a5 queue:(id)a6 reply:(id)a7
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (a4)
  {
    id v18 = a4;
    int v16 = (void *)MEMORY[0x263EFF8C0];
    id v17 = a4;
    a4 = [v16 arrayWithObjects:&v18 count:1];
  }
  -[DiagnosticCaseManager addToSession:events:payload:queue:reply:](self, "addToSession:events:payload:queue:reply:", v12, a4, v13, v14, v15, v18, v19);
}

- (void)addToSession:(id)a3 events:(id)a4 payload:(id)a5 queue:(id)a6 reply:(id)a7
{
  id v12 = a3;
  unint64_t v13 = (unint64_t)a4;
  unint64_t v14 = (unint64_t)a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = v16;
  if (v13 | v14)
  {
    id v18 = (void *)[(id)v13 copy];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke;
    void v21[3] = &unk_263FC3248;
    id v23 = v17;
    id v22 = v15;
    [(DiagnosticCaseManager *)self addToSession:v12 events:v18 payload:v14 reply:v21];

LABEL_5:
    goto LABEL_6;
  }
  if (v16)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke_3;
    block[3] = &unk_263FC3970;
    id v20 = v16;
    dispatch_async(v15, block);
    id v18 = v20;
    goto LABEL_5;
  }
LABEL_6:
}

void __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke(uint64_t a1, int a2)
{
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = *(NSObject **)(a1 + 32);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke_2;
    v5[3] = &unk_263FC4188;
    id v6 = v2;
    int v7 = a2;
    dispatch_async(v4, v5);
  }
}

void __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke_2(uint64_t a1)
{
  v8[3] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  v7[0] = @"success";
  id v3 = [NSNumber numberWithInt:*(_DWORD *)(a1 + 40) == 0];
  v8[0] = v3;
  v7[1] = @"reason";
  id v4 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  v8[1] = v4;
  _DWORD v7[2] = @"reasonStr";
  id v5 = diagnosticErrorStringForCode(*(_DWORD *)(a1 + 40));
  v8[2] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:3];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v6);
}

void __65__DiagnosticCaseManager_addToSession_events_payload_queue_reply___block_invoke_3(uint64_t a1)
{
  v5[2] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = MEMORY[0x263EFFA80];
  v4[0] = @"success";
  v4[1] = @"reason";
  uint64_t v2 = [NSNumber numberWithInt:20];
  v5[1] = v2;
  id v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

- (void)startSessionWithSignature:(id)a3 flags:(unint64_t)a4 preferredTimeout:(double)a5 events:(id)a6 payload:(id)a7 actions:(id)a8 reply:(id)a9
{
  id v16 = a3;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  uint64_t v30 = v17;
  id v21 = (void *)[v17 copy];
  id v22 = (void *)[v18 copy];
  id v23 = (void *)[v19 copy];
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  char v41 = 0;
  id v24 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke;
  block[3] = &unk_263FC41D8;
  void block[4] = self;
  id v32 = v16;
  id v33 = v21;
  id v34 = v22;
  double v39 = a5;
  uint64_t v37 = v40;
  unint64_t v38 = a4;
  id v35 = v23;
  id v36 = v20;
  id v25 = v20;
  id v26 = v23;
  id v27 = v22;
  id v28 = v21;
  id v29 = v16;
  dispatch_async(v24, block);

  _Block_object_dispose(v40, 8);
}

void __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  uint64_t v2 = [*(id *)(a1 + 32) _updateSignatureWithBuildVariantInfoAndFlags:*(void *)(a1 + 40)];
  id v3 = [*(id *)(a1 + 32) createDiagnosticCaseWithSignature:v2 flags:*(void *)(a1 + 88) events:*(void *)(a1 + 48) payload:*(void *)(a1 + 56) actions:*(void *)(a1 + 64)];
  uint64_t v4 = +[DiagnosticCaseManager symptomDiagnosticErrorForDiagnosticCaseDampeningType:](DiagnosticCaseManager, "symptomDiagnosticErrorForDiagnosticCaseDampeningType:", [v3 dampeningType]);
  if (v3)
  {
    uint64_t v5 = v4;
    [*(id *)(*(void *)(a1 + 32) + 64) _checkFileWritingLimits:v3];
    [v3 setPreferredDuration:*(double *)(a1 + 96)];
    if ((int)[v3 dampeningType] > 0) {
      goto LABEL_30;
    }
    id v6 = [v3 caseId];
    int v7 = [v6 UUIDString];

    id v8 = casemanagementLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138543362;
      double v46 = *(double *)&v7;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_INFO, "Starting an ABC session with identifier: %{public}@", buf, 0xCu);
    }

    [*(id *)(a1 + 32) addTransactionForCaseID:v7];
    double v9 = *(double *)(a1 + 96);
    if (v9 <= 0.0) {
      int64_t v10 = 100000000;
    }
    else {
      int64_t v10 = (uint64_t)(v9 * 1000000000.0);
    }
    dispatch_time_t v11 = dispatch_time(0, v10);
    id v12 = [*(id *)(a1 + 32) queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke_258;
    block[3] = &unk_263FC3018;
    id v13 = v7;
    id v42 = v13;
    id v14 = v3;
    uint64_t v15 = *(void *)(a1 + 32);
    id v43 = v14;
    uint64_t v44 = v15;
    dispatch_after(v11, v12, block);

    [*(id *)(a1 + 32) _processReportActions:*(void *)(a1 + 64) session:v14];
    if (![*(id *)(a1 + 64) count]) {
      goto LABEL_29;
    }
    if (![v14 wantsRemote])
    {
LABEL_27:
      if (objc_msgSend(*(id *)(a1 + 32), "_processProbeActions:session:", *(void *)(a1 + 64), v14, v34, v35, v36, v37))
      {
        [*(id *)(a1 + 32) startPeriodicTimer];
      }
LABEL_29:

      goto LABEL_30;
    }
    id v16 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"idsdest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v17 = 3600.0;
      id v18 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"remotewindow"];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v18 doubleValue];
        if (v19 >= 1.0)
        {
          [v18 doubleValue];
          double v17 = v20;
          id v21 = casemanagementLogHandle();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 134217984;
            double v46 = v17;
            _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_DEBUG, "(Remote trigger window is %.0lf seconds)", buf, 0xCu);
          }
        }
      }
      id v22 = casemanagementLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_INFO, "Ready to trigger remote cases via IDS", buf, 2u);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
      id v23 = *(void **)(a1 + 32);
      id v24 = [v14 signature];
      uint64_t v34 = MEMORY[0x263EF8330];
      uint64_t v35 = 3221225472;
      id v36 = __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke_259;
      uint64_t v37 = &unk_263FC41B0;
      id v39 = *(id *)(a1 + 72);
      id v38 = v14;
      int v40 = v5;
      [v23 _processRemoteIDSTriggers:v16 validFor:v24 signature:v13 sessionID:&v34 reply:v17];
    }
    else
    {
      if (!v16)
      {
LABEL_26:

        goto LABEL_27;
      }
      id v18 = casemanagementLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        id v26 = (objc_class *)objc_opt_class();
        id v27 = NSStringFromClass(v26);
        *(_DWORD *)long long buf = 138412546;
        double v46 = *(double *)&v27;
        __int16 v47 = 2112;
        uint64_t v48 = v16;
        _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_ERROR, "Found unsupported class for remote IDS destinations: %@ (%@)", buf, 0x16u);
      }
    }

    goto LABEL_26;
  }
  id v25 = casemanagementLogHandle();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_209DBA000, v25, OS_LOG_TYPE_DEBUG, "DiagnosticCase is nil", buf, 2u);
  }

  uint64_t v5 = 8;
LABEL_30:
  if (*(void *)(a1 + 72))
  {
    if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24))
    {
      id v28 = [v3 signature];
      id v29 = [v28 objectForKeyedSubscript:@"groupID"];

      uint64_t v30 = casemanagementLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138543362;
        double v46 = *(double *)&v29;
        _os_log_impl(&dword_209DBA000, v30, OS_LOG_TYPE_DEBUG, "Found group id %{public}@", buf, 0xCu);
      }

      uint64_t v31 = *(void *)(a1 + 72);
      id v32 = [v3 caseId];
      id v33 = [v32 UUIDString];
      (*(void (**)(uint64_t, void *, NSObject *, void, uint64_t))(v31 + 16))(v31, v33, v29, 0, v5);

LABEL_38:
      goto LABEL_39;
    }
LABEL_36:
    id v29 = casemanagementLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v29, OS_LOG_TYPE_INFO, "Waiting for asynchronous operation to finish.", buf, 2u);
    }
    goto LABEL_38;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
    goto LABEL_36;
  }
LABEL_39:
}

uint64_t __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke_258(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEBUG, "Case duration timer fired for %{public}@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(a1 + 40) setReadyToEndSession:1];
  return [*(id *)(a1 + 48) endSessionIfProbesCompletedFor:*(void *)(a1 + 32)];
}

void __103__DiagnosticCaseManager_startSessionWithSignature_flags_preferredTimeout_events_payload_actions_reply___block_invoke_259(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = [*(id *)(a1 + 32) signature];
    int v5 = [v4 objectForKeyedSubscript:@"groupID"];

    uint64_t v6 = casemanagementLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138543362;
      double v17 = v5;
      _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEBUG, "Found group id %{public}@", (uint8_t *)&v16, 0xCu);
    }

    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = [v3 objectForKeyedSubscript:@"result"];
    int v9 = [v8 isEqualToString:@"failure"];

    if (v9)
    {
      [v7 setObject:MEMORY[0x263EFFA80] forKeyedSubscript:@"IDSRemoteTrigger"];
      int64_t v10 = kSymptomDiagnosticKeyError;
    }
    else
    {
      [v7 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"IDSRemoteTrigger"];
      int64_t v10 = kSymptomDiagnosticKeyIDSMessageIdentifier;
    }
    dispatch_time_t v11 = *v10;
    id v12 = [v3 objectForKeyedSubscript:*v10];
    [v7 setObject:v12 forKeyedSubscript:v11];

    uint64_t v13 = *(void *)(a1 + 40);
    id v14 = [*(id *)(a1 + 32) caseId];
    uint64_t v15 = [v14 UUIDString];
    (*(void (**)(uint64_t, void *, void *, id, void))(v13 + 16))(v13, v15, v5, v7, *(unsigned int *)(a1 + 48));
  }
}

- (void)addToSession:(id)a3 events:(id)a4 payload:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__DiagnosticCaseManager_addToSession_events_payload_reply___block_invoke;
  block[3] = &unk_263FC4200;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = self;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __59__DiagnosticCaseManager_addToSession_events_payload_reply___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v12 = 138543874;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEBUG, "Adding to session with identifier: %{public}@.\n\tevents: %@\n\tpayload: %@", (uint8_t *)&v12, 0x20u);
  }

  uint64_t result = [*(id *)(a1 + 32) length];
  if (result)
  {
    id v7 = *(void **)(a1 + 56);
    id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(a1 + 32)];
    [v7 addToCaseWithId:v8 events:*(void *)(a1 + 40) payload:*(void *)(a1 + 48)];

    uint64_t result = *(void *)(a1 + 64);
    if (!result) {
      return result;
    }
    int v9 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    if (!*(void *)(a1 + 64)) {
      return result;
    }
    id v10 = casemanagementLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "invalid parameters: empty or missing session identifier (%{public}@)", (uint8_t *)&v12, 0xCu);
    }

    int v9 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  }
  return v9();
}

- (void)addSignatureContentForSession:(id)a3 key:(id)a4 content:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  __int16 v14 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__DiagnosticCaseManager_addSignatureContentForSession_key_content_reply___block_invoke;
  block[3] = &unk_263FC4200;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = self;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(v14, block);
}

uint64_t __73__DiagnosticCaseManager_addSignatureContentForSession_key_content_reply___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    int v12 = 138543874;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    uint64_t v15 = v4;
    __int16 v16 = 2112;
    uint64_t v17 = v5;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEBUG, "Updating signature of session with identifier: %{public}@. key: %@ content: %@", (uint8_t *)&v12, 0x20u);
  }

  uint64_t result = [*(id *)(a1 + 32) length];
  if (result)
  {
    id v7 = *(void **)(a1 + 56);
    id v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(a1 + 32)];
    [v7 addSignatureContentToCaseWithId:v8 key:*(void *)(a1 + 40) content:*(void *)(a1 + 48)];

    uint64_t result = *(void *)(a1 + 64);
    if (!result) {
      return result;
    }
    int v9 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    if (!*(void *)(a1 + 64)) {
      return result;
    }
    id v10 = casemanagementLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 138543362;
      uint64_t v13 = v11;
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "invalid parameters: empty or missing session identifier (%{public}@)", (uint8_t *)&v12, 0xCu);
    }

    int v9 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
  }
  return v9();
}

- (void)endSession:(id)a3 forced:(BOOL)a4 onlyIfReady:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v8 = a3;
  int v9 = [v8 UUIDString];
  [(DiagnosticCaseManager *)self cancelProbesForSession:v9];
  id v10 = casemanagementLogHandle();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = "";
    if (v5) {
      uint64_t v11 = "(only if ready to end)";
    }
    int v15 = 138543618;
    __int16 v16 = v9;
    __int16 v17 = 2080;
    uint64_t v18 = v11;
    _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEBUG, "Ending session with identifier: %{public}@ %s", (uint8_t *)&v15, 0x16u);
  }

  if (v6) {
    uint64_t v12 = 2;
  }
  else {
    uint64_t v12 = 1;
  }
  BOOL v13 = [(DiagnosticCaseManager *)self finalizeDiagnosticCaseWithId:v8 closureType:v12 onlyIfReady:v5];

  if (v13)
  {
    __int16 v14 = [(NSMutableDictionary *)self->activeIDSMessages allKeysForObject:v9];
    [(NSMutableDictionary *)self->activeIDSMessages removeObjectsForKeys:v14];
  }
}

- (void)endSessions:(id)a3 forced:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__DiagnosticCaseManager_endSessions_forced___block_invoke;
  block[3] = &unk_263FC4228;
  BOOL v12 = a4;
  id v10 = v6;
  uint64_t v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __44__DiagnosticCaseManager_endSessions_forced___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = [*(id *)(a1 + 32) count];
    uint64_t v4 = @" (forced)";
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v4 = &stru_26BDE2C70;
    }
    *(_DWORD *)long long buf = 134218242;
    uint64_t v18 = v3;
    __int16 v19 = 2112;
    id v20 = v4;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_DEBUG, "Ending %ld sessions%@", buf, 0x16u);
  }

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(a1 + 40);
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "caseId", (void)v12);
        [v10 endSession:v11 forced:*(unsigned __int8 *)(a1 + 48) onlyIfReady:0];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)endSessionWithIdentifier:(id)a3 forced:(BOOL)a4
{
}

- (void)endSessionWithIdentifier:(id)a3 forced:(BOOL)a4 onlyIfReady:(BOOL)a5
{
  uint64_t v8 = (objc_class *)MEMORY[0x263F08C38];
  id v9 = a3;
  id v10 = (void *)[[v8 alloc] initWithUUIDString:v9];

  uint64_t v11 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__DiagnosticCaseManager_endSessionWithIdentifier_forced_onlyIfReady___block_invoke;
  block[3] = &unk_263FC4250;
  void block[4] = self;
  id v14 = v10;
  BOOL v15 = a4;
  BOOL v16 = a5;
  id v12 = v10;
  dispatch_async(v11, block);
}

uint64_t __69__DiagnosticCaseManager_endSessionWithIdentifier_forced_onlyIfReady___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) endSession:*(void *)(a1 + 40) forced:*(unsigned __int8 *)(a1 + 48) onlyIfReady:*(unsigned __int8 *)(a1 + 49)];
}

- (void)cancelSessionWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(DiagnosticCaseManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  _DWORD v7[2] = __53__DiagnosticCaseManager_cancelSessionWithIdentifier___block_invoke;
  void v7[3] = &unk_263FC3430;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __53__DiagnosticCaseManager_cancelSessionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v3;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Cancelling session with identifier: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  if ([*(id *)(a1 + 32) length])
  {
    [*(id *)(a1 + 40) cancelProbesForSession:*(void *)(a1 + 32)];
    id v4 = *(void **)(a1 + 40);
    id v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:*(void *)(a1 + 32)];
    [v4 cancelCaseWithId:v5];
  }
}

- (void)shutdown
{
  uint64_t v3 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__DiagnosticCaseManager_shutdown__block_invoke;
  block[3] = &unk_263FC2DC0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __33__DiagnosticCaseManager_shutdown__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) hasOpenCases];
  if (result)
  {
    uint64_t v3 = [*(id *)(a1 + 32) configManager];
    int v4 = [v3 autoBugCaptureEnabled];

    id v5 = *(void **)(a1 + 32);
    if (v4)
    {
      return [v5 forceCloseDiagnosticCaseStorage];
    }
    else
    {
      return [v5 removeAllCases];
    }
  }
  return result;
}

- (void)updateAverageCasesPerDay
{
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__DiagnosticCaseManager_updateAverageCasesPerDay__block_invoke;
  block[3] = &unk_263FC2DC0;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__DiagnosticCaseManager_updateAverageCasesPerDay__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  [*(id *)(*(void *)(a1 + 32) + 64) _calculateAverageCasesPerDayFromDailyAggregatedStatistics];
  double v3 = v2;
  int v4 = casemanagementLogHandle();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 <= 0.0)
  {
    if (v5)
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEFAULT, "Average cases seen per day is 0.", (uint8_t *)&v8, 2u);
    }

    uint64_t v6 = 0;
  }
  else
  {
    if (v5)
    {
      int v8 = 134217984;
      double v9 = v3;
      _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_DEFAULT, "Average cases seen per day is %.4f", (uint8_t *)&v8, 0xCu);
    }

    LODWORD(v6) = vcvtpd_u64_f64(v3);
  }
  return [*(id *)(a1 + 32) setAvgCasesPerDay:v6];
}

- (void)resetDiagnosticCaseStorage
{
  double v3 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__DiagnosticCaseManager_resetDiagnosticCaseStorage__block_invoke;
  block[3] = &unk_263FC2DC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __51__DiagnosticCaseManager_resetDiagnosticCaseStorage__block_invoke(uint64_t a1)
{
  double v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Resetting DiagnosticCaseStorage", v4, 2u);
  }

  return [*(id *)(a1 + 32) removeAllCases];
}

- (void)resetAllForCustomerBuilds
{
  double v3 = [(DiagnosticCaseManager *)self configManager];
  char v4 = [v3 autoBugCaptureAvailable];

  if ((v4 & 1) == 0)
  {
    BOOL v5 = [(DiagnosticCaseManager *)self queue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__DiagnosticCaseManager_resetAllForCustomerBuilds__block_invoke;
    block[3] = &unk_263FC2DC0;
    void block[4] = self;
    dispatch_async(v5, block);
  }
}

void __50__DiagnosticCaseManager_resetAllForCustomerBuilds__block_invoke(uint64_t a1)
{
  double v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Remove all storage and all usage except RESOURCE_NOTIFY", buf, 2u);
  }

  double v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K != %@", @"domain", @"RESOURCE_NOTIFY"];
  [*(id *)(*(void *)(a1 + 32) + 64) _removeAllDiagnosticCaseUsageFor:v3];
  [*(id *)(a1 + 32) removeAllCases];
}

- (void)resetAll
{
  double v3 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__DiagnosticCaseManager_resetAll__block_invoke;
  block[3] = &unk_263FC2DC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __33__DiagnosticCaseManager_resetAll__block_invoke(uint64_t a1)
{
  double v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)char v4 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Resetting DiagnosticCaseUsage and DiagnosticCaseStorage", v4, 2u);
  }

  [*(id *)(*(void *)(a1 + 32) + 64) _removeAllDiagnosticCaseUsageFor:0];
  return [*(id *)(a1 + 32) removeAllCases];
}

- (void)payloadsForSignatures:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__DiagnosticCaseManager_payloadsForSignatures_reply___block_invoke;
  block[3] = &unk_263FC2F28;
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __53__DiagnosticCaseManager_payloadsForSignatures_reply___block_invoke(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  double v2 = [MEMORY[0x263EFF980] array];
  uint64_t v24 = 0;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000;
  id v27 = __Block_byref_object_copy__4;
  id v28 = __Block_byref_object_dispose__4;
  id v29 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  double v3 = casemanagementLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = [*(id *)(a1 + 32) count];
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)long long buf = 134218242;
    uint64_t v31 = v4;
    __int16 v32 = 2112;
    uint64_t v33 = v5;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEBUG, "Ready to search for collected cases that match %ld signatures: %@", buf, 0x16u);
  }

  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __53__DiagnosticCaseManager_payloadsForSignatures_reply___block_invoke_274;
  BOOL v15 = &unk_263FC4278;
  id v6 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 40);
  uint64_t v18 = &v20;
  id v7 = v2;
  id v17 = v7;
  __int16 v19 = &v24;
  [v6 enumerateObjectsUsingBlock:&v12];
  if (!v25[5] && !*((unsigned char *)v21 + 24))
  {
    int v8 = casemanagementLogHandle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v31 = v9;
      _os_log_impl(&dword_209DBA000, v8, OS_LOG_TYPE_INFO, "Did not find any collected cases that matched the provided signatures: %@", buf, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10)
  {
    if (objc_msgSend(v7, "count", v12, v13, v14, v15, v16)) {
      id v11 = v7;
    }
    else {
      id v11 = 0;
    }
    (*(void (**)(uint64_t, id, uint64_t))(v10 + 16))(v10, v11, v25[5]);
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

void __53__DiagnosticCaseManager_payloadsForSignatures_reply___block_invoke_274(void *a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  double v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = v3;
    uint64_t v5 = [(DiagnosticCase *)v4 objectForKeyedSubscript:@"domain"];
    id v6 = [(DiagnosticCase *)v4 objectForKeyedSubscript:@"type"];
    id v7 = [(DiagnosticCase *)v4 objectForKeyedSubscript:@"subtype"];
    int v8 = [(DiagnosticCase *)v4 objectForKeyedSubscript:@"detected"];
    uint64_t v9 = [(DiagnosticCase *)v4 objectForKeyedSubscript:@"window"];
    if (v9) {
      uint64_t v10 = (void *)v9;
    }
    else {
      uint64_t v10 = &unk_26BDF5F40;
    }
    id v11 = casemanagementLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138413058;
      uint64_t v45 = (uint64_t)v5;
      __int16 v46 = 2112;
      __int16 v47 = v6;
      __int16 v48 = 2112;
      uint64_t v49 = v7;
      __int16 v50 = 2112;
      uint64_t v51 = v8;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_DEBUG, "  Searching for cases matching d:%@ t:%@ st:%@ p:%@", buf, 0x2Au);
    }

    uint64_t v12 = (void *)a1[4];
    [v10 doubleValue];
    id v38 = objc_msgSend(v12, "casesMatchingDomain:type:subtype:process:withinLast:", v5, v6, v7, v8);
    if ([v38 count])
    {
      __int16 v32 = v10;
      uint64_t v33 = v8;
      uint64_t v34 = v7;
      uint64_t v35 = v6;
      id v36 = v4;
      uint64_t v37 = v3;
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
      uint64_t v13 = casemanagementLogHandle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = [v38 count];
        *(_DWORD *)long long buf = 134217984;
        uint64_t v45 = v14;
        _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "  Found %ld matching cases.", buf, 0xCu);
      }

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      id v15 = v38;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v40 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
            uint64_t v21 = [[DiagnosticCase alloc] initWithCaseStorage:v20 manager:a1[4]];
            uint64_t v22 = casemanagementLogHandle();
            char v23 = v22;
            if (v21)
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v24 = [(DiagnosticCase *)v21 attachments];
                uint64_t v25 = [v24 count];
                *(_DWORD *)long long buf = 134218242;
                uint64_t v45 = v25;
                __int16 v46 = 2112;
                __int16 v47 = v21;
                _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_DEBUG, "    Adding %ld attachments from: %@", buf, 0x16u);
              }
              uint64_t v26 = (void *)a1[5];
              char v23 = [(DiagnosticCase *)v21 attachments];
              [v26 addObjectsFromArray:v23];
            }
            else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v45 = (uint64_t)v20;
              _os_log_impl(&dword_209DBA000, v23, OS_LOG_TYPE_ERROR, "  Failed to allocate DiagnosticCase from DiagnosticCaseStorage: %@", buf, 0xCu);
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v39 objects:v43 count:16];
        }
        while (v17);
      }

      uint64_t v4 = v36;
      double v3 = v37;
      id v6 = v35;
      int v8 = v33;
      id v7 = v34;
      uint64_t v10 = v32;
    }
  }
  else
  {
    id v27 = casemanagementLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = (objc_class *)objc_opt_class();
      id v29 = NSStringFromClass(v28);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v45 = (uint64_t)v29;
      __int16 v46 = 2112;
      __int16 v47 = v3;
      _os_log_impl(&dword_209DBA000, v27, OS_LOG_TYPE_ERROR, "Found unexpected object (%@) of class (%@) in signature list.", buf, 0x16u);
    }
    uint64_t v30 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08438] code:22 userInfo:0];
    uint64_t v31 = *(void *)(a1[7] + 8);
    uint64_t v4 = *(DiagnosticCase **)(v31 + 40);
    *(void *)(v31 + 40) = v30;
  }
}

- (id)createTemporaryDiagnosticCaseStorageForUUID:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 UUIDString];
  uint64_t v5 = [(ObjectAnalytics *)self->_caseStorageAnalytics createTemporaryEntity];
  id v6 = casemanagementLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315138;
    uint64_t v11 = [v4 UTF8String];
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEBUG, "Create a temporary case storage entry of %s", (uint8_t *)&v10, 0xCu);
  }

  if (v5)
  {
    [v5 setCaseID:v4];
  }
  else
  {
    id v7 = casemanagementLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [v4 UTF8String];
      int v10 = 136315138;
      uint64_t v11 = v8;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "Couldn't create a temporary case storage entry of %s", (uint8_t *)&v10, 0xCu);
    }
  }

  return v5;
}

- (void)promoteTemporaryCase:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 caseStorage];

  id v6 = casemanagementLogHandle();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "Promoting temporary case storage to permanent case storage for case %@.", (uint8_t *)&v9, 0xCu);
    }

    caseStorageAnalytics = self->_caseStorageAnalytics;
    id v7 = [v4 caseStorage];
    [(ObjectAnalytics *)caseStorageAnalytics moveTemporaryEntityToMainContext:v7];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "No temporary DiagnosticCaseStorage for case %@", (uint8_t *)&v9, 0xCu);
  }
}

- (void)countOfCasesMatchingDomain:(id)a3 type:(id)a4 subtype:(id)a5 process:(id)a6 groupCaseIDIsPresent:(BOOL)a7 withinLast:(double)a8 reply:(id)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a9;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  uint64_t v21 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __111__DiagnosticCaseManager_countOfCasesMatchingDomain_type_subtype_process_groupCaseIDIsPresent_withinLast_reply___block_invoke;
  block[3] = &unk_263FC42A0;
  void block[4] = self;
  id v28 = v16;
  id v29 = v17;
  id v30 = v18;
  double v34 = a8;
  BOOL v35 = a7;
  id v32 = v20;
  uint64_t v33 = v36;
  id v31 = v19;
  id v22 = v20;
  id v23 = v19;
  id v24 = v18;
  id v25 = v17;
  id v26 = v16;
  dispatch_async(v21, block);

  _Block_object_dispose(v36, 8);
}

uint64_t __111__DiagnosticCaseManager_countOfCasesMatchingDomain_type_subtype_process_groupCaseIDIsPresent_withinLast_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _predicatesForCasesMatchingDomain:*(void *)(a1 + 40) type:*(void *)(a1 + 48) subtype:*(void *)(a1 + 56) process:*(void *)(a1 + 64) withinLast:*(double *)(a1 + 88)];
  if (v2)
  {
    double v3 = (void *)v2;
    if (*(unsigned char *)(a1 + 96))
    {
      id v4 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"%K != NULL", @"caseGroupID");
      uint64_t v5 = [v3 arrayByAddingObject:v4];

      id v6 = casemanagementLogHandle();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_DEBUG, "Adding predicate for caseGroupID being non-NULL", buf, 2u);
      }

      double v3 = (void *)v5;
    }
    id v7 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v3];
    *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = [*(id *)(*(void *)(a1 + 32) + 48) countEntitiesMatching:v7];
  }
  uint64_t result = *(void *)(a1 + 72);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24));
  }
  return result;
}

- (id)casesMatchingDomain:(id)a3 type:(id)a4 subtype:(id)a5 process:(id)a6 withinLast:(double)a7
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v9 = -[DiagnosticCaseManager _predicatesForCasesMatchingDomain:type:subtype:process:withinLast:](self, "_predicatesForCasesMatchingDomain:type:subtype:process:withinLast:", a3, a4, a5, a6);
  if (v9)
  {
    id v10 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v9];
    uint64_t v11 = [(ObjectAnalytics *)self->_caseStorageAnalytics fetchEntitiesFreeForm:v10 sortDesc:0];
    uint64_t v12 = casemanagementLogHandle();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 134218240;
      uint64_t v15 = [v11 count];
      __int16 v16 = 2048;
      double v17 = a7;
      _os_log_impl(&dword_209DBA000, v12, OS_LOG_TYPE_DEBUG, "Found %lu matching case(s) in the past %.0lf seconds.", (uint8_t *)&v14, 0x16u);
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)_predicatesForCasesMatchingDomain:(id)a3 type:(id)a4 subtype:(id)a5 process:(id)a6 withinLast:(double)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = v14;
  if (a7 <= 0.0 && v11 == 0 && v12 == 0 && v13 == 0 && v14 == 0)
  {
    id v22 = casemanagementLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_ERROR, "No matching criteria provided! Provide at least one criteria to perform a query.", buf, 2u);
    }
    id v20 = 0;
  }
  else
  {
    id v20 = [MEMORY[0x263EFF980] array];
    if (a7 <= 0.0)
    {
      uint64_t v21 = casemanagementLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_DEBUG, "No window provided. Using default window of 24 hours.", buf, 2u);
      }

      a7 = 86400.0;
    }
    id v22 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:-a7];
    id v23 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K >= %@", @"timeStamp", v22];
    [v20 addObject:v23];
    id v24 = casemanagementLogHandle();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134217984;
      double v35 = a7;
      _os_log_impl(&dword_209DBA000, v24, OS_LOG_TYPE_DEBUG, "Adding predicate for window of %.0lf seconds", buf, 0xCu);
    }

    if ([v11 length])
    {
      id v25 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"caseDomain", v11];
      [v20 addObject:v25];
      id v26 = casemanagementLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        double v35 = *(double *)&v11;
        _os_log_impl(&dword_209DBA000, v26, OS_LOG_TYPE_DEBUG, "Adding predicate for domain %@", buf, 0xCu);
      }
    }
    if ([v12 length])
    {
      id v27 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"caseType", v12];
      [v20 addObject:v27];
      id v28 = casemanagementLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        double v35 = *(double *)&v12;
        _os_log_impl(&dword_209DBA000, v28, OS_LOG_TYPE_DEBUG, "Adding predicate for type %@", buf, 0xCu);
      }
    }
    if ([v13 length])
    {
      id v29 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"caseSubtype", v13];
      [v20 addObject:v29];
      id v30 = casemanagementLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        double v35 = *(double *)&v13;
        _os_log_impl(&dword_209DBA000, v30, OS_LOG_TYPE_DEBUG, "Adding predicate for subtype %@", buf, 0xCu);
      }
    }
    if ([v15 length])
    {
      id v31 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"caseDetectedProcess", v15];
      [v20 addObject:v31];
      id v32 = casemanagementLogHandle();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        double v35 = *(double *)&v15;
        _os_log_impl(&dword_209DBA000, v32, OS_LOG_TYPE_DEBUG, "Adding predicate for process %@", buf, 0xCu);
      }
    }
  }

  return v20;
}

- (void)forceCloseDiagnosticCaseStorage
{
  double v3 = [(DiagnosticCaseManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DiagnosticCaseManager_forceCloseDiagnosticCaseStorage__block_invoke;
  block[3] = &unk_263FC2DC0;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __56__DiagnosticCaseManager_forceCloseDiagnosticCaseStorage__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _forceCloseDiagnosticCaseStorage];
}

- (void)_forceCloseDiagnosticCaseStorage
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v3 = casemanagementLogHandle();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_209DBA000, v3, OS_LOG_TYPE_DEBUG, "Force closing all un-closed diagnostic cases.", buf, 2u);
  }

  id v4 = (void *)MEMORY[0x263F08A98];
  uint64_t v5 = [NSNumber numberWithInteger:6];
  id v6 = [v4 predicateWithFormat:@"%K != %@", @"caseState", v5];

  unint64_t v7 = [(ObjectAnalytics *)self->_caseStorageAnalytics countEntitiesMatching:v6];
  if (v7)
  {
    unint64_t v8 = v7;
    int v9 = NSDictionary;
    id v10 = [MEMORY[0x263EFF910] date];
    id v11 = [NSNumber numberWithInteger:6];
    id v12 = [NSNumber numberWithInteger:5];
    id v13 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"caseClosedTime", v11, @"caseState", v12, @"caseClosureType", 0);

    unint64_t v14 = [(ObjectAnalytics *)self->_caseStorageAnalytics updateEntitiesMatching:v6 properties:v13];
    uint64_t v15 = casemanagementLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134218240;
      unint64_t v17 = v14;
      __int16 v18 = 2048;
      unint64_t v19 = v8;
      _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_DEBUG, "Force closed %ld un-closed diagnostic case(s) out of %ld un-closed cases.", buf, 0x16u);
    }

    if (v14) {
      [(DiagnosticCaseManager *)self saveAllCases];
    }
  }
}

- (BOOL)isAllowedTransientException:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"domain"];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"type"];
  id v6 = [v3 objectForKeyedSubscript:@"subtype"];

  BOOL v7 = [v4 isEqualToString:@"Networking"]
    && [v5 isEqualToString:@"Performance"]
    && (([v6 isEqualToString:@"AirPlay"] & 1) != 0
     || [v6 isEqualToString:@"AirPlay Connection Stalled"]);

  return v7;
}

- (void)removeCaseStorageWithID:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08A98];
  uint64_t v5 = [a3 UUIDString];
  [v4 predicateWithFormat:@"%K == %@", @"caseID", v5];
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(ObjectAnalytics *)self->_caseStorageAnalytics removeEntitiesMatching:v6];
}

- (void)removeAllCases
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [(NSMutableArray *)self->_activeCases removeAllObjects];
  [(NSMutableArray *)self->_totalCases removeAllObjects];
  int64_t v3 = [(DiagnosticCaseStorageAnalytics *)self->_caseStorageAnalytics removeAllDiagnosticCaseStorages];
  id v4 = casemanagementLogHandle();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    int64_t v8 = v3;
    _os_log_impl(&dword_209DBA000, v4, OS_LOG_TYPE_INFO, "Removed %ld cases from persistent store", (uint8_t *)&v7, 0xCu);
  }

  int64_t v5 = [(DiagnosticCaseSummaryAnalytics *)self->_caseSummaryAnalytics removeAllDiagnosticCaseSummaries];
  id v6 = casemanagementLogHandle();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 134217984;
    int64_t v8 = v5;
    _os_log_impl(&dword_209DBA000, v6, OS_LOG_TYPE_INFO, "DiagnosticCaseSummaryLog: Removed %ld case summaries from persistent store", (uint8_t *)&v7, 0xCu);
  }

  [(DiagnosticCaseManager *)self saveAllCases];
}

+ (BOOL)isString:(id)a3 inExceptionList:(id)a4
{
  return +[CaseDampeningExceptions isString:a3 inExceptionList:a4];
}

+ (BOOL)isException:(id)a3 containedInString:(id)a4
{
  return +[CaseDampeningExceptions isException:a3 containedInString:a4];
}

- (DiagnosticLiaison)liaison
{
  return self->_liaison;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (DiagnosticStatisticsManager)statsManager
{
  return self->_statsManager;
}

- (NSMutableDictionary)reportGenerators
{
  return self->_reportGenerators;
}

- (NSMutableArray)activeCases
{
  return self->_activeCases;
}

- (NSMutableArray)totalCases
{
  return self->_totalCases;
}

- (DiagnosticCaseManagerStorageDelegate)storageDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_storageDelegate);

  return (DiagnosticCaseManagerStorageDelegate *)WeakRetained;
}

- (void)setStorageDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_storageDelegate);
  objc_storeStrong((id *)&self->_totalCases, 0);
  objc_storeStrong((id *)&self->_activeCases, 0);
  objc_storeStrong((id *)&self->_reportGenerators, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeTransactions, 0);
  objc_storeStrong((id *)&self->activeIDSMessages, 0);
  objc_storeStrong((id *)&self->activeProbes, 0);
  objc_storeStrong((id *)&self->sessionsWaitingToEnd, 0);
  objc_storeStrong((id *)&self->periodicTimer, 0);
  objc_storeStrong((id *)&self->_liaison, 0);
  objc_storeStrong((id *)&self->_diagnosticsController, 0);
  objc_storeStrong((id *)&self->_statsManager, 0);
  objc_storeStrong((id *)&self->_caseSummaryAnalytics, 0);
  objc_storeStrong((id *)&self->_caseStorageAnalytics, 0);
  objc_storeStrong((id *)&self->_requestedReportGenerators, 0);
  objc_storeStrong((id *)&self->_reportOutlets, 0);
  objc_storeStrong((id *)&self->_pendingStatisticsUpdateCases, 0);

  objc_storeStrong((id *)&self->_workspace, 0);
}

@end