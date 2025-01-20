@interface DRSTaskingDecisionMaker
+ (BOOL)passesPercentAccept:(double)a3;
- (BOOL)_configDoesPassTeamHysteresis:(id)a3 logTelemetry:(BOOL)a4;
- (BOOL)allowRefreshLimitingParameters;
- (BOOL)enforceBuild;
- (BOOL)enforceDate;
- (BOOL)enforceGlobalHysteresisAndCap;
- (BOOL)enforceSampling;
- (BOOL)enforceTeamHysteresis;
- (BOOL)isEqual:(id)a3;
- (BOOL)reportToDecisionServer;
- (DRSConfigPersistedStore)configStore;
- (DRSTaskingCloudKitHelper)cloudKitHelper;
- (DRSTaskingDecisionMaker)initWithTimezone:(id)a3 limitingParameters:(id)a4 dbWorkingDirectoryPath:(id)a5 cloudKitHelper:(id)a6 enforceDate:(BOOL)a7 enforceBuild:(BOOL)a8 enforceSampling:(BOOL)a9 enforceTeamHysteresis:(BOOL)a10 enforceGlobalHysteresisAndCap:(BOOL)a11 allowRefereshLimitingParameters:(BOOL)a12 errorOut:(id *)a13;
- (DRSTaskingDecisionMaker)initWithTimezone:(id)a3 limitingParameters:(id)a4 dbWorkingDirectoryPath:(id)a5 cloudKitHelper:(id)a6 enforceDate:(BOOL)a7 enforceBuild:(BOOL)a8 enforceSampling:(BOOL)a9 enforceTeamHysteresis:(BOOL)a10 enforceGlobalHysteresisAndCap:(BOOL)a11 errorOut:(id *)a12;
- (DRSTaskingLimitingParameters)limitingParameters;
- (NSDate)currentReceivedDate;
- (NSString)dbWorkingDirectoryPath;
- (NSTimeZone)deviceTimezone;
- (id)_configsPassingOverallHysteresis:(id)a3 logTelemetry:(BOOL)a4;
- (id)_configsPassingPerTeamHysteresis:(id)a3 logTelemetry:(BOOL)a4;
- (id)_configsPassingSampling:(id)a3 logTelemetry:(BOOL)a4;
- (id)_hysteresisPredicate:(id)a3;
- (id)_hysteresisPredicate:(id)a3 config:(id)a4;
- (id)_teamTaskingsPassingBuild:(id)a3 logTelemetry:(BOOL)a4 allowWildcardBuild:(BOOL)a5;
- (id)_teamTaskingsPassingDate:(id)a3 logTelemetry:(BOOL)a4;
- (id)acceptedCancels:(id)a3;
- (id)acceptedConfigs:(id)a3 logTelemetry:(BOOL)a4;
- (id)acceptedConfigs:(id)a3 logTelemetry:(BOOL)a4 allowWildcardBuild:(BOOL)a5;
- (void)_logConfigReceipt:(id)a3;
- (void)_persistReceivedMetadata:(id)a3;
- (void)_rejectTaskingMessageDueToDisabledState:(id)a3 logTelemetry:(BOOL)a4;
- (void)clientCompletedConfigUUID:(id)a3;
- (void)clientRejectsConfigUUID:(id)a3;
- (void)refreshLimitingParameters;
- (void)setCurrentReceivedDate:(id)a3;
@end

@implementation DRSTaskingDecisionMaker

+ (BOOL)passesPercentAccept:(double)a3
{
  if (a3 >= 100.0) {
    return 1;
  }
  if (a3 <= 0.0) {
    return 0;
  }
  return a3 * 10000.0 >= (double)arc4random_uniform(0xF4240u);
}

- (DRSTaskingDecisionMaker)initWithTimezone:(id)a3 limitingParameters:(id)a4 dbWorkingDirectoryPath:(id)a5 cloudKitHelper:(id)a6 enforceDate:(BOOL)a7 enforceBuild:(BOOL)a8 enforceSampling:(BOOL)a9 enforceTeamHysteresis:(BOOL)a10 enforceGlobalHysteresisAndCap:(BOOL)a11 errorOut:(id *)a12
{
  return -[DRSTaskingDecisionMaker initWithTimezone:limitingParameters:dbWorkingDirectoryPath:cloudKitHelper:enforceDate:enforceBuild:enforceSampling:enforceTeamHysteresis:enforceGlobalHysteresisAndCap:allowRefereshLimitingParameters:errorOut:](self, "initWithTimezone:limitingParameters:dbWorkingDirectoryPath:cloudKitHelper:enforceDate:enforceBuild:enforceSampling:enforceTeamHysteresis:enforceGlobalHysteresisAndCap:allowRefereshLimitingParameters:errorOut:", a3, a4, a5, a6, a7, a8);
}

- (DRSTaskingDecisionMaker)initWithTimezone:(id)a3 limitingParameters:(id)a4 dbWorkingDirectoryPath:(id)a5 cloudKitHelper:(id)a6 enforceDate:(BOOL)a7 enforceBuild:(BOOL)a8 enforceSampling:(BOOL)a9 enforceTeamHysteresis:(BOOL)a10 enforceGlobalHysteresisAndCap:(BOOL)a11 allowRefereshLimitingParameters:(BOOL)a12 errorOut:(id *)a13
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  if (!v18)
  {
    id v18 = +[DRSTaskingLimitingParameters defaultDeviceParameters];
  }
  id v21 = v17;
  v22 = v21;
  if (v21)
  {
    if (v19) {
      goto LABEL_5;
    }
LABEL_8:
    v25 = 0;
    goto LABEL_9;
  }
  v22 = [MEMORY[0x263EFFA18] localTimeZone];
  if (!v19) {
    goto LABEL_8;
  }
LABEL_5:
  id v35 = 0;
  v23 = [[DRSConfigPersistedStore alloc] initWithWorkingDirectory:v19 isReadOnly:0 cloudKitHelper:v20 errorOut:&v35];
  v24 = (DRSConfigPersistedStore *)v35;
  v25 = v24;
  if (v23)
  {

    v25 = v23;
LABEL_9:
    v34.receiver = self;
    v34.super_class = (Class)DRSTaskingDecisionMaker;
    v26 = [(DRSTaskingDecisionMaker *)&v34 init];
    v27 = v26;
    if (v26)
    {
      objc_storeStrong((id *)&v26->_deviceTimezone, v22);
      objc_storeStrong((id *)&v27->_limitingParameters, v18);
      objc_storeStrong((id *)&v27->_dbWorkingDirectoryPath, a5);
      v27->_enforceDate = a7;
      v27->_enforceBuild = a8;
      v27->_enforceSampling = a9;
      v27->_enforceTeamHysteresis = a10;
      v27->_enforceGlobalHysteresisAndCap = a11;
      objc_storeStrong((id *)&v27->_configStore, v25);
      v28 = [(DRSTaskingDecisionMaker *)v27 configStore];

      if (!v28) {
        *(_WORD *)&v27->_enforceTeamHysteresis = 0;
      }
      v27->_allowRefreshLimitingParameters = a12;
      objc_storeStrong((id *)&v27->_cloudKitHelper, a6);
    }
    self = v27;
    v29 = self;
    goto LABEL_14;
  }
  v31 = DPLogHandle_TaskingDecisionMakerError();
  if (os_signpost_enabled(v31))
  {
    *(_DWORD *)buf = 138543618;
    id v37 = v19;
    __int16 v38 = 2114;
    v39 = v25;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingDecisionMakerInitFailure", "Failed to init with working directory: %{public}@ (Error: %{public}@)", buf, 0x16u);
  }

  if (a13)
  {
    v25 = v25;
    v29 = 0;
    *a13 = v25;
  }
  else
  {
    v29 = 0;
  }
LABEL_14:

  return v29;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (DRSTaskingDecisionMaker *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v24 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    BOOL v7 = [(DRSTaskingDecisionMaker *)self enforceDate];
    if (v7 != [(DRSTaskingDecisionMaker *)v6 enforceDate]) {
      goto LABEL_15;
    }
    BOOL v8 = [(DRSTaskingDecisionMaker *)self enforceSampling];
    if (v8 != [(DRSTaskingDecisionMaker *)v6 enforceSampling]) {
      goto LABEL_15;
    }
    BOOL v9 = [(DRSTaskingDecisionMaker *)self enforceTeamHysteresis];
    if (v9 != [(DRSTaskingDecisionMaker *)v6 enforceTeamHysteresis]) {
      goto LABEL_15;
    }
    BOOL v10 = [(DRSTaskingDecisionMaker *)self enforceGlobalHysteresisAndCap];
    if (v10 != [(DRSTaskingDecisionMaker *)v6 enforceGlobalHysteresisAndCap]) {
      goto LABEL_15;
    }
    v11 = [(DRSTaskingDecisionMaker *)self dbWorkingDirectoryPath];
    v12 = [(DRSTaskingDecisionMaker *)v6 dbWorkingDirectoryPath];
    char IsNil = _oneIsNil((uint64_t)v11, (uint64_t)v12);

    if (IsNil) {
      goto LABEL_15;
    }
    uint64_t v14 = [(DRSTaskingDecisionMaker *)self dbWorkingDirectoryPath];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [(DRSTaskingDecisionMaker *)self dbWorkingDirectoryPath];
      id v17 = [(DRSTaskingDecisionMaker *)v6 dbWorkingDirectoryPath];
      int v18 = [v16 isEqualToString:v17];

      if (!v18) {
        goto LABEL_15;
      }
    }
    id v19 = [(DRSTaskingDecisionMaker *)v6 limitingParameters];
    id v20 = [(DRSTaskingDecisionMaker *)self limitingParameters];
    int v21 = [v19 isEqual:v20];

    if (v21)
    {
      v22 = [(DRSTaskingDecisionMaker *)self deviceTimezone];
      v23 = [(DRSTaskingDecisionMaker *)v6 deviceTimezone];
      char v24 = [v22 isEqualToTimeZone:v23];
    }
    else
    {
LABEL_15:
      char v24 = 0;
    }
  }
  else
  {
    char v24 = 0;
  }

  return v24;
}

- (void)_persistReceivedMetadata:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(DRSTaskingDecisionMaker *)self configStore];

  if (v5)
  {
    v6 = [(DRSTaskingDecisionMaker *)self configStore];
    id v11 = 0;
    char v7 = [v6 addConfigMetdata:v4 errorOut:&v11];
    id v8 = v11;

    if ((v7 & 1) == 0)
    {
      BOOL v9 = DPLogHandle_TaskingDecisionMakerError();
      if (os_signpost_enabled(v9))
      {
        BOOL v10 = [v4 configUUID];
        *(_DWORD *)buf = 138543618;
        v13 = v10;
        __int16 v14 = 2114;
        id v15 = v8;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MetadataPersistanceFailure", "Failed to persist %{public}@ due to error %{public}@", buf, 0x16u);
      }
    }
    [(DRSTaskingDecisionMaker *)self _logConfigReceipt:v4];
  }
}

- (void)_logConfigReceipt:(id)a3
{
  v18[3] = *MEMORY[0x263EF8340];
  id v3 = a3;
  if ([v3 logTelemetry])
  {
    if ([v3 state])
    {
      if ([v3 state] == 2)
      {
        id v4 = @"Applied";
      }
      else if ([v3 state] == 1)
      {
        id v4 = @"WaitingToApply";
      }
      else
      {
        id v4 = @"Unknown";
        if ([v3 state] == 3)
        {
          uint64_t v5 = [v3 completionDescription];
          if (v5) {
            id v4 = (__CFString *)v5;
          }
        }
      }
    }
    else
    {
      id v4 = @"Unknown";
    }
    v17[0] = kUUIDKey;
    v6 = [v3 configUUID];
    char v7 = [v6 UUIDString];
    v18[0] = v7;
    v17[1] = kTeamIDKey;
    id v8 = [v3 teamID];
    v17[2] = kConfigReceivedEventKey_ReceiptResult;
    v18[1] = v8;
    v18[2] = v4;
    BOOL v9 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

    DRSCoreAnalyticsSendEvent(kConfigReceivedEventName, v9);
    if ([v3 reportToDecisionServer])
    {
      BOOL v10 = +[DRSTaskingCloudKitHelper prodContainerHelper];
      id v11 = [v3 teamID];
      v12 = [v3 configUUID];
      v13 = [v12 UUIDString];
      __int16 v14 = (void *)os_transaction_create();
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __45__DRSTaskingDecisionMaker__logConfigReceipt___block_invoke;
      v15[3] = &unk_263FCA200;
      id v16 = v3;
      [v10 reportTaskingConfigReceipt:v11 uuidString:v13 receiptResult:v4 transaction:v14 completionHandler:v15];
    }
  }
}

void __45__DRSTaskingDecisionMaker__logConfigReceipt___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = DPLogHandle_ConfigPersistedStoreError();
  if (os_signpost_enabled(v4))
  {
    uint64_t v5 = [*(id *)(a1 + 32) configUUID];
    int v6 = 138543618;
    char v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DecisionMakerConfigReceiptTelemetryError", "Telemetry reporting for %{public}@ failed %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (BOOL)reportToDecisionServer
{
  v2 = +[DRSSystemProfile sharedInstance];
  char v3 = [v2 isInternal];

  return v3;
}

- (id)_teamTaskingsPassingDate:(id)a3 logTelemetry:(BOOL)a4
{
  id v6 = a3;
  char v7 = [MEMORY[0x263EFF980] array];
  __int16 v8 = [MEMORY[0x263EFF910] date];
  id v9 = [v6 teamTaskings];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __65__DRSTaskingDecisionMaker__teamTaskingsPassingDate_logTelemetry___block_invoke;
  v15[3] = &unk_263FCA228;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v6;
  BOOL v19 = a4;
  id v10 = v7;
  id v18 = v10;
  id v11 = v6;
  id v12 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v15];

  if ([v10 count]) {
    id v13 = v10;
  }
  else {
    id v13 = 0;
  }

  return v13;
}

void __65__DRSTaskingDecisionMaker__teamTaskingsPassingDate_logTelemetry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (![*(id *)(a1 + 32) enforceDate]) {
    goto LABEL_6;
  }
  char v7 = *(void **)(a1 + 40);
  __int16 v8 = [v6 config];
  id v9 = [v8 endDate];
  uint64_t v10 = [v7 compare:v9];

  if (v10 == -1)
  {
LABEL_6:
    [*(id *)(a1 + 56) addObject:v6];
  }
  else
  {
    id v11 = DPLogHandle_TaskingDecisionMakerError();
    if (os_signpost_enabled(v11))
    {
      id v12 = [*(id *)(a1 + 48) messageUUID];
      id v13 = [v12 UUIDString];
      __int16 v14 = [v6 config];
      id v15 = [v14 endDate];
      id v16 = [v15 description];
      id v17 = [*(id *)(a1 + 40) description];
      *(_DWORD *)buf = 138544130;
      id v27 = v5;
      __int16 v28 = 2114;
      v29 = v13;
      __int16 v30 = 2114;
      v31 = v16;
      __int16 v32 = 2114;
      v33 = v17;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RejectedConfig", "Rejecting TeamTasking team ID %{public}@ from TaskingMessage ID %{public}@ due to already being expired (%{public}@ (endDate) <= %{public}@ (current date))", buf, 0x2Au);
    }
    id v18 = [DRSConfigMetadata alloc];
    BOOL v19 = [v6 config];
    id v20 = [v19 configUUID];
    int v21 = [*(id *)(a1 + 32) currentReceivedDate];
    char v22 = *(unsigned char *)(a1 + 64);
    uint64_t v23 = *(void *)(a1 + 40);
    BYTE1(v25) = [*(id *)(a1 + 32) reportToDecisionServer];
    LOBYTE(v25) = v22;
    char v24 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v18, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v5, v20, 3, 1, v21, v23, v23, @"Received after end date", 0, v25);

    [*(id *)(a1 + 32) _persistReceivedMetadata:v24];
  }
}

- (id)_teamTaskingsPassingBuild:(id)a3 logTelemetry:(BOOL)a4 allowWildcardBuild:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v67 = *MEMORY[0x263EF8340];
  id v7 = a3;
  __int16 v8 = [MEMORY[0x263EFF980] array];
  v50 = [MEMORY[0x263EFF910] date];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v9 = v7;
  uint64_t v53 = [v9 countByEnumeratingWithState:&v54 objects:v66 count:16];
  if (v53)
  {
    uint64_t v52 = *(void *)v55;
    id v48 = v9;
    BOOL v47 = v5;
    v51 = self;
    do
    {
      for (uint64_t i = 0; i != v53; ++i)
      {
        if (*(void *)v55 != v52) {
          objc_enumerationMutation(v9);
        }
        id v11 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        if (![(DRSTaskingDecisionMaker *)self enforceBuild]) {
          goto LABEL_11;
        }
        if (v5)
        {
          id v12 = [v11 config];
          id v13 = [v12 build];
          int v14 = [v13 isEqualToString:kDRConfigWildcardBuild];

          if (v14)
          {
            id v15 = +[DRSSystemProfile sharedInstance];
            id v16 = [v15 build];
            id v17 = [v11 config];
            [v17 setBuild:v16];
          }
        }
        id v18 = +[DRSSystemProfile sharedInstance];
        BOOL v19 = [v18 build];
        id v20 = [v11 config];
        int v21 = [v20 build];
        char v22 = [v19 isEqualToString:v21];

        self = v51;
        if ((v22 & 1) == 0)
        {
          uint64_t v23 = DPLogHandle_TaskingDecisionMakerError();
          if (os_signpost_enabled(v23))
          {
            v46 = [v11 config];
            char v24 = [v46 configUUID];
            uint64_t v25 = [v11 teamID];
            v26 = [v11 config];
            id v27 = [v26 build];
            __int16 v28 = +[DRSSystemProfile sharedInstance];
            [v28 build];
            __int16 v30 = v29 = v8;
            *(_DWORD *)buf = 138544130;
            v59 = v24;
            __int16 v60 = 2114;
            v61 = v25;
            __int16 v62 = 2114;
            v63 = v27;
            __int16 v64 = 2114;
            v65 = v30;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RejectedConfig", "Rejecting config %{public}@ for Team ID %{public}@ due to mismatching build: %{public}@ vs. %{public}@ (expected)", buf, 0x2Au);

            __int16 v8 = v29;
            self = v51;
          }
          v31 = NSString;
          __int16 v32 = [v11 config];
          v33 = [v32 build];
          uint64_t v34 = +[DRSSystemProfile sharedInstance];
          id v35 = [v34 build];
          v36 = [v31 stringWithFormat:@"Config build did not match device: %@ vs. %@ (expected)", v33, v35];

          id v37 = [DRSConfigMetadata alloc];
          __int16 v38 = [v11 teamID];
          v39 = [v11 config];
          uint64_t v40 = [v39 configUUID];
          v41 = [(DRSTaskingDecisionMaker *)self currentReceivedDate];
          BYTE1(v45) = [(DRSTaskingDecisionMaker *)self reportToDecisionServer];
          LOBYTE(v45) = a4;
          v42 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v37, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v38, v40, 3, 1, v41, v50, v36, 0, v45);

          [(DRSTaskingDecisionMaker *)self _persistReceivedMetadata:v42];
          id v9 = v48;
          BOOL v5 = v47;
        }
        else
        {
LABEL_11:
          [v8 addObject:v11];
        }
      }
      uint64_t v53 = [v9 countByEnumeratingWithState:&v54 objects:v66 count:16];
    }
    while (v53);
  }

  if ([v8 count]) {
    id v43 = v8;
  }
  else {
    id v43 = 0;
  }

  return v43;
}

- (id)_configsPassingSampling:(id)a3 logTelemetry:(BOOL)a4
{
  uint64_t v82 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = v5;
  v58 = v5;
  if (v5)
  {
    if ([v5 count])
    {
      id v7 = [MEMORY[0x263EFF980] array];
      __int16 v62 = [MEMORY[0x263EFF910] date];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      id obj = v6;
      uint64_t v8 = [obj countByEnumeratingWithState:&v67 objects:v81 count:16];
      if (!v8) {
        goto LABEL_26;
      }
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v68;
      __int16 v60 = self;
      uint64_t v64 = *(void *)v68;
      while (1)
      {
        uint64_t v11 = 0;
        uint64_t v61 = v9;
        do
        {
          if (*(void *)v68 != v10) {
            objc_enumerationMutation(obj);
          }
          id v12 = *(void **)(*((void *)&v67 + 1) + 8 * v11);
          if (![(DRSTaskingDecisionMaker *)self enforceSampling]) {
            goto LABEL_16;
          }
          id v13 = +[DRSSystemProfile sharedInstance];
          int v14 = [v13 deviceModel];
          id v15 = [(DRSTaskingDecisionMaker *)self deviceTimezone];
          id v16 = [v15 abbreviation];
          v66 = [v12 samplingParametersForHWModel:v14 timezoneAbbreviation:v16];

          id v17 = DPLogHandle_TaskingDecisionMaker();
          if (os_signpost_enabled(v17))
          {
            id v18 = [v12 config];
            BOOL v19 = [v18 configUUID];
            id v20 = [v12 jsonDictRepresentationAbbreviated];
            *(_DWORD *)buf = 138543618;
            v72 = v19;
            __int16 v73 = 2114;
            v74 = v20;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamSamplingEvaluation", "Evaluating sampling for: %{public}@:\n%{public}@", buf, 0x16u);
          }
          int v21 = DPLogHandle_TaskingDecisionMaker();
          BOOL v22 = os_signpost_enabled(v21);
          uint64_t v23 = v66;
          if (v66)
          {
            if (v22)
            {
              v59 = [v12 config];
              char v24 = [v59 configUUID];
              uint64_t v25 = [v12 teamID];
              [v66 samplingPercentage];
              uint64_t v27 = v26;
              __int16 v28 = +[DRSSystemProfile sharedInstance];
              v29 = [v28 deviceModel];
              [(DRSTaskingDecisionMaker *)self deviceTimezone];
              v31 = __int16 v30 = v7;
              __int16 v32 = [v31 abbreviation];
              *(_DWORD *)buf = 138544386;
              v72 = v24;
              __int16 v73 = 2114;
              v74 = v25;
              __int16 v75 = 2050;
              uint64_t v76 = v27;
              __int16 v77 = 2114;
              v78 = v29;
              __int16 v79 = 2114;
              v80 = v32;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamConfigSampling", "%{public}@ for team %{public}@: Got sampling percentage of %{public}.2f for HW model %{public}@, TZ: %{public}@", buf, 0x34u);

              self = v60;
              id v7 = v30;
              uint64_t v23 = v66;

              uint64_t v9 = v61;
            }

            [v23 samplingPercentage];
            if (+[DRSTaskingDecisionMaker passesPercentAccept:](DRSTaskingDecisionMaker, "passesPercentAccept:"))
            {

              uint64_t v10 = v64;
LABEL_16:
              v33 = [v12 config];
              [v7 addObject:v33];
              goto LABEL_24;
            }
            id v43 = DPLogHandle_TaskingDecisionMaker();
            if (os_signpost_enabled(v43))
            {
              v44 = [v12 config];
              uint64_t v45 = [v44 configUUID];
              v46 = [v12 teamID];
              [v23 samplingPercentage];
              *(_DWORD *)buf = 138543874;
              v72 = v45;
              __int16 v73 = 2114;
              v74 = v46;
              __int16 v75 = 2048;
              uint64_t v76 = v47;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v43, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamHysteresisRejection", "Rejecting config %{public}@ for team ID %{public}@ due to failed roll (%f%% chance of success)", buf, 0x20u);
            }
            id v48 = NSString;
            [v23 samplingPercentage];
            objc_msgSend(v48, "stringWithFormat:", @"Failed roll (%f%% chance of success)", v49);
            v42 = (DRSConfigMetadata *)objc_claimAutoreleasedReturnValue();
            v50 = [DRSConfigMetadata alloc];
            v51 = [v12 teamID];
            uint64_t v52 = [v12 config];
            uint64_t v53 = [v52 configUUID];
            long long v54 = [(DRSTaskingDecisionMaker *)v60 currentReceivedDate];
            BYTE1(v57) = [(DRSTaskingDecisionMaker *)v60 reportToDecisionServer];
            LOBYTE(v57) = a4;
            long long v55 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v50, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v51, v53, 3, 1, v54, v62, v42, 0, v57);

            self = v60;
            [(DRSTaskingDecisionMaker *)v60 _persistReceivedMetadata:v55];

            uint64_t v9 = v61;
          }
          else
          {
            if (v22)
            {
              uint64_t v34 = [v12 config];
              id v35 = [v34 configUUID];
              v36 = [v12 teamID];
              *(_DWORD *)buf = 138543618;
              v72 = v35;
              __int16 v73 = 2114;
              v74 = v36;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamHysteresisRejection", "Rejecting config %{public}@ for team %{public}@ to missing sampling parameters", buf, 0x16u);
            }
            id v37 = [DRSConfigMetadata alloc];
            __int16 v38 = [v12 teamID];
            v39 = [v12 config];
            uint64_t v40 = [v39 configUUID];
            v41 = [(DRSTaskingDecisionMaker *)self currentReceivedDate];
            BYTE1(v57) = [(DRSTaskingDecisionMaker *)self reportToDecisionServer];
            LOBYTE(v57) = a4;
            v42 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v37, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v38, v40, 3, 1, v41, v62, @"No applicable sampling parameters", 0, v57);

            [(DRSTaskingDecisionMaker *)self _persistReceivedMetadata:v42];
          }

          uint64_t v10 = v64;
          v33 = v66;
LABEL_24:

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [obj countByEnumeratingWithState:&v67 objects:v81 count:16];
        if (!v9)
        {
LABEL_26:

          if ([v7 count]) {
            id v6 = v7;
          }
          else {
            id v6 = 0;
          }

          goto LABEL_31;
        }
      }
    }
    id v6 = 0;
  }
LABEL_31:

  return v6;
}

- (id)_hysteresisPredicate:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"completionType == %llu OR (completionType >= %llu AND completedDate >= %@)", 4097, 8193, a3];
}

- (id)_hysteresisPredicate:(id)a3 config:(id)a4
{
  id v6 = a3;
  if (([a4 skippedHysteresis] & 1) != 0
    || ![(DRSTaskingDecisionMaker *)self enforceTeamHysteresis])
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", @"completionType == %llu", 4097);
  }
  else
  {
    uint64_t v7 = [(DRSTaskingDecisionMaker *)self _hysteresisPredicate:v6];
  }
  uint64_t v8 = (void *)v7;

  return v8;
}

- (BOOL)_configDoesPassTeamHysteresis:(id)a3 logTelemetry:(BOOL)a4
{
  v51[2] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF910] date];
  uint64_t v7 = (void *)MEMORY[0x263F08A98];
  uint64_t v8 = [v5 teamID];
  uint64_t v9 = [v7 predicateWithFormat:@"teamID == %@", v8];

  uint64_t v10 = (void *)MEMORY[0x263EFF910];
  uint64_t v11 = [(DRSTaskingDecisionMaker *)self limitingParameters];
  [v11 perTeamTaskingHysteresisInterval];
  double v13 = -v12;
  int v14 = [MEMORY[0x263EFF910] date];
  id v15 = [v10 dateWithTimeInterval:v14 sinceDate:v13];

  id v16 = [(DRSTaskingDecisionMaker *)self _hysteresisPredicate:v15 config:v5];
  id v17 = (void *)MEMORY[0x263F08730];
  v51[0] = v9;
  v51[1] = v16;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:2];
  BOOL v19 = [v17 andPredicateWithSubpredicates:v18];

  id v20 = [(DRSTaskingDecisionMaker *)self configStore];
  id v46 = 0;
  uint64_t v21 = [v20 metadataCountForPredicate:v19 fetchLimit:1 withErrorOut:&v46];
  id v22 = v46;

  if (v22)
  {
    v42 = v16;
    id v43 = v15;
    v44 = v9;
    uint64_t v23 = DPLogHandle_TaskingDecisionMakerError();
    if (os_signpost_enabled(v23))
    {
      char v24 = [v5 configUUID];
      *(_DWORD *)buf = 138543618;
      id v48 = v24;
      __int16 v49 = 2114;
      uint64_t v50 = (uint64_t)v22;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "PerTeamHysteresisError", "Rejecting config %{public}@ due to team hysteresis error %{public}@", buf, 0x16u);
    }
    uint64_t v25 = NSString;
    uint64_t v26 = [v22 localizedDescription];
    uint64_t v27 = [v25 stringWithFormat:@"Per-team hysteresis error %@", v26];

    __int16 v28 = [DRSConfigMetadata alloc];
    v29 = [v5 teamID];
    __int16 v30 = [v5 configUUID];
    v31 = [(DRSTaskingDecisionMaker *)self currentReceivedDate];
    BYTE1(v41) = [(DRSTaskingDecisionMaker *)self reportToDecisionServer];
    LOBYTE(v41) = a4;
    __int16 v32 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v28, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v29, v30, 3, 1, v31, v6, v6, v27, 0, v41);

    [(DRSTaskingDecisionMaker *)self _persistReceivedMetadata:v32];
  }
  else
  {
    if (!v21)
    {
      BOOL v39 = 1;
      goto LABEL_10;
    }
    v42 = v16;
    id v43 = v15;
    v44 = v9;
    v33 = DPLogHandle_TaskingDecisionMaker();
    if (os_signpost_enabled(v33))
    {
      uint64_t v34 = [v5 configUUID];
      *(_DWORD *)buf = 138543618;
      id v48 = v34;
      __int16 v49 = 2048;
      uint64_t v50 = v21;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v33, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TeamHysteresisRejection", "Rejecting config %{public}@ due to team hysteresis (matching count of %lu)", buf, 0x16u);
    }
    id v35 = [DRSConfigMetadata alloc];
    v36 = [v5 teamID];
    id v37 = [v5 configUUID];
    __int16 v38 = [(DRSTaskingDecisionMaker *)self currentReceivedDate];
    BYTE1(v41) = [(DRSTaskingDecisionMaker *)self reportToDecisionServer];
    LOBYTE(v41) = a4;
    uint64_t v27 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v35, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v36, v37, 3, 1, v38, v6, v6, @"Rejected by per-team hysteresis", 0, v41);

    [(DRSTaskingDecisionMaker *)self _persistReceivedMetadata:v27];
  }

  BOOL v39 = 0;
  id v15 = v43;
  uint64_t v9 = v44;
  id v16 = v42;
LABEL_10:

  return v39;
}

- (id)_configsPassingPerTeamHysteresis:(id)a3 logTelemetry:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if (-[DRSTaskingDecisionMaker _configDoesPassTeamHysteresis:logTelemetry:](self, "_configDoesPassTeamHysteresis:logTelemetry:", v13, v4, (void)v15))
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_configsPassingOverallHysteresis:(id)a3 logTelemetry:(BOOL)a4
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(DRSTaskingDecisionMaker *)self enforceGlobalHysteresisAndCap])
  {
    v89 = [MEMORY[0x263EFF910] date];
    id v6 = (void *)MEMORY[0x263EFF910];
    uint64_t v7 = [(DRSTaskingDecisionMaker *)self limitingParameters];
    [v7 taskingHysteresisInterval];
    double v9 = -v8;
    uint64_t v10 = [MEMORY[0x263EFF910] date];
    uint64_t v11 = [v6 dateWithTimeInterval:v10 sinceDate:v9];

    double v12 = [(DRSTaskingDecisionMaker *)self configStore];
    uint64_t v13 = [(DRSTaskingDecisionMaker *)self _hysteresisPredicate:v11];
    int v14 = [(DRSTaskingDecisionMaker *)self limitingParameters];
    id v106 = 0;
    unint64_t v15 = objc_msgSend(v12, "metadataCountForPredicate:fetchLimit:withErrorOut:", v13, objc_msgSend(v14, "acceptedConfigCountCap"), &v106);
    id v16 = v106;

    v87 = v16;
    v80 = v11;
    id v81 = v5;
    if (v16)
    {
      long long v17 = DPLogHandle_TaskingDecisionMakerError();
      if (os_signpost_enabled(v17))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v108 = (uint64_t)v16;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OverallHysteresisError", "Rejecting all configs due to overall hysteresis error %{public}@", buf, 0xCu);
      }

      long long v104 = 0u;
      long long v105 = 0u;
      long long v102 = 0u;
      long long v103 = 0u;
      id obj = v5;
      uint64_t v18 = [obj countByEnumeratingWithState:&v102 objects:v114 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v103;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v103 != v20) {
              objc_enumerationMutation(obj);
            }
            id v22 = *(void **)(*((void *)&v102 + 1) + 8 * i);
            uint64_t v23 = NSString;
            char v24 = [v87 localizedDescription];
            uint64_t v25 = [v23 stringWithFormat:@"Overall hysteresis error %@", v24];

            uint64_t v26 = [DRSConfigMetadata alloc];
            uint64_t v27 = [v22 teamID];
            __int16 v28 = [v22 configUUID];
            v29 = [(DRSTaskingDecisionMaker *)self currentReceivedDate];
            BYTE1(v79) = [(DRSTaskingDecisionMaker *)self reportToDecisionServer];
            LOBYTE(v79) = a4;
            __int16 v30 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v26, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v27, v28, 3, 1, v29, v89, v25, 0, v79);

            [(DRSTaskingDecisionMaker *)self _persistReceivedMetadata:v30];
          }
          uint64_t v19 = [obj countByEnumeratingWithState:&v102 objects:v114 count:16];
        }
        while (v19);
      }

      id v31 = 0;
      uint64_t v11 = v80;
      id v5 = v81;
    }
    else
    {
      __int16 v32 = [(DRSTaskingDecisionMaker *)self limitingParameters];
      unint64_t v33 = [v32 acceptedConfigCountCap];

      if (v15 >= v33)
      {
        v63 = [MEMORY[0x263EFF980] array];
        uint64_t v64 = DPLogHandle_TaskingDecisionMaker();
        if (os_signpost_enabled(v64))
        {
          v65 = [(DRSTaskingDecisionMaker *)self limitingParameters];
          uint64_t v66 = [v65 acceptedConfigCountCap];
          *(_DWORD *)buf = 134217984;
          uint64_t v108 = v66;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v64, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OverallHysteresisRejection", "Rejecting all configs due to being at or over the accepted config count cap %lu", buf, 0xCu);
        }
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        id v67 = v5;
        uint64_t v68 = [v67 countByEnumeratingWithState:&v98 objects:v113 count:16];
        if (v68)
        {
          uint64_t v69 = v68;
          uint64_t v70 = *(void *)v99;
          do
          {
            for (uint64_t j = 0; j != v69; ++j)
            {
              if (*(void *)v99 != v70) {
                objc_enumerationMutation(v67);
              }
              v72 = *(void **)(*((void *)&v98 + 1) + 8 * j);
              if ([v72 skippedHysteresis])
              {
                [v63 addObject:v72];
              }
              else
              {
                __int16 v73 = [DRSConfigMetadata alloc];
                v74 = [v72 teamID];
                __int16 v75 = [v72 configUUID];
                uint64_t v76 = [(DRSTaskingDecisionMaker *)self currentReceivedDate];
                BYTE1(v79) = [(DRSTaskingDecisionMaker *)self reportToDecisionServer];
                LOBYTE(v79) = a4;
                __int16 v77 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v73, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v74, v75, 3, 1, v76, v89, @"No open overall slots", 0, v79);

                [(DRSTaskingDecisionMaker *)self _persistReceivedMetadata:v77];
              }
            }
            uint64_t v69 = [v67 countByEnumeratingWithState:&v98 objects:v113 count:16];
          }
          while (v69);
        }

        if ([v63 count]) {
          id v31 = v63;
        }
        else {
          id v31 = 0;
        }
        uint64_t v11 = v80;

        id v5 = v81;
      }
      else
      {
        uint64_t v34 = [(DRSTaskingDecisionMaker *)self limitingParameters];
        uint64_t v35 = [v34 acceptedConfigCountCap];

        unint64_t v84 = v35 - v15;
        if (v35 - v15 >= [v5 count])
        {
          id v31 = v5;
        }
        else
        {
          v36 = (void *)[v5 mutableCopy];
          id v37 = [MEMORY[0x263EFF980] array];
          if (v35 != v15)
          {
            unint64_t v38 = v35 - v15;
            do
            {
              uint64_t v39 = arc4random_uniform([v36 count]);
              uint64_t v40 = [v36 objectAtIndexedSubscript:v39];
              [v37 addObject:v40];
              [v36 removeObjectAtIndex:v39];

              --v38;
            }
            while (v38);
          }
          v83 = v37;
          uint64_t v41 = [MEMORY[0x263EFF980] array];
          long long v94 = 0u;
          long long v95 = 0u;
          long long v96 = 0u;
          long long v97 = 0u;
          id v42 = v36;
          uint64_t v43 = [v42 countByEnumeratingWithState:&v94 objects:v112 count:16];
          uint64_t v82 = v41;
          if (v43)
          {
            uint64_t v44 = v43;
            uint64_t v45 = *(void *)v95;
            do
            {
              for (uint64_t k = 0; k != v44; ++k)
              {
                if (*(void *)v95 != v45) {
                  objc_enumerationMutation(v42);
                }
                uint64_t v47 = *(void **)(*((void *)&v94 + 1) + 8 * k);
                if ([v47 skippedHysteresis])
                {
                  [v41 addObject:v47];
                  [v37 addObject:v47];
                  id v48 = DPLogHandle_TaskingDecisionMaker();
                  if (os_signpost_enabled(v48))
                  {
                    __int16 v49 = [v47 configUUID];
                    *(_DWORD *)buf = 138543362;
                    uint64_t v108 = (uint64_t)v49;
                    _os_signpost_emit_with_name_impl(&dword_209E70000, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigAcceptedBySkippingHysteresis", "Accepted %{public}@ due to 'skipHysteresis'", buf, 0xCu);
                  }
                  uint64_t v41 = v82;
                }
              }
              uint64_t v44 = [v42 countByEnumeratingWithState:&v94 objects:v112 count:16];
            }
            while (v44);
          }

          if ([v41 count]) {
            [v42 removeObjectsInArray:v41];
          }
          uint64_t v50 = objc_msgSend(NSString, "stringWithFormat:", @"Not selected for one of the %llu open slots", v84);
          long long v90 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          id obja = v42;
          uint64_t v51 = [obja countByEnumeratingWithState:&v90 objects:v111 count:16];
          if (v51)
          {
            uint64_t v52 = v51;
            uint64_t v53 = *(void *)v91;
            do
            {
              for (uint64_t m = 0; m != v52; ++m)
              {
                if (*(void *)v91 != v53) {
                  objc_enumerationMutation(obja);
                }
                long long v55 = *(void **)(*((void *)&v90 + 1) + 8 * m);
                long long v56 = DPLogHandle_TaskingDecisionMaker();
                if (os_signpost_enabled(v56))
                {
                  uint64_t v57 = [v55 configUUID];
                  *(_DWORD *)buf = 138543618;
                  uint64_t v108 = (uint64_t)v57;
                  __int16 v109 = 2048;
                  unint64_t v110 = v84;
                  _os_signpost_emit_with_name_impl(&dword_209E70000, v56, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "OverallHysteresisRejection", "Rejected %{public}@ due to not being picked for one of the %llu open slots", buf, 0x16u);
                }
                v58 = [DRSConfigMetadata alloc];
                v59 = [v55 teamID];
                __int16 v60 = [v55 configUUID];
                uint64_t v61 = [(DRSTaskingDecisionMaker *)self currentReceivedDate];
                BYTE1(v79) = [(DRSTaskingDecisionMaker *)self reportToDecisionServer];
                LOBYTE(v79) = a4;
                __int16 v62 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v58, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v59, v60, 3, 1, v61, v89, v50, 0, v79);

                [(DRSTaskingDecisionMaker *)self _persistReceivedMetadata:v62];
              }
              uint64_t v52 = [obja countByEnumeratingWithState:&v90 objects:v111 count:16];
            }
            while (v52);
          }

          uint64_t v11 = v80;
          id v5 = v81;
          id v31 = v83;
        }
      }
    }
  }
  else
  {
    id v31 = v5;
  }

  return v31;
}

- (void)_rejectTaskingMessageDueToDisabledState:(id)a3 logTelemetry:(BOOL)a4
{
  id v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a3;
  double v8 = [v6 date];
  double v9 = [v7 teamTaskings];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __80__DRSTaskingDecisionMaker__rejectTaskingMessageDueToDisabledState_logTelemetry___block_invoke;
  v11[3] = &unk_263FCA250;
  v11[4] = self;
  id v12 = v8;
  BOOL v13 = a4;
  id v10 = v8;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
}

void __80__DRSTaskingDecisionMaker__rejectTaskingMessageDueToDisabledState_logTelemetry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a2;
  id v7 = DPLogHandle_TaskingDecisionMaker();
  if (os_signpost_enabled(v7))
  {
    double v8 = [v5 config];
    double v9 = [v8 configUUID];
    *(_DWORD *)buf = 138543362;
    uint64_t v19 = v9;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RejectingConfig", "Decision maker is disabled (active config cap is 0). Rejecting config %{public}@", buf, 0xCu);
  }
  id v10 = [DRSConfigMetadata alloc];
  uint64_t v11 = [v5 config];
  id v12 = [v11 configUUID];
  BOOL v13 = [*(id *)(a1 + 32) currentReceivedDate];
  char v14 = *(unsigned char *)(a1 + 48);
  uint64_t v15 = *(void *)(a1 + 40);
  BYTE1(v17) = [*(id *)(a1 + 32) reportToDecisionServer];
  LOBYTE(v17) = v14;
  id v16 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v10, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v6, v12, 3, 2, v13, v15, v15, @"Tasking is disabled", 0, v17);

  [*(id *)(a1 + 32) _persistReceivedMetadata:v16];
}

- (void)refreshLimitingParameters
{
  if ([(DRSTaskingDecisionMaker *)self allowRefreshLimitingParameters])
  {
    char v3 = +[DRSTaskingLimitingParameters defaultDeviceParameters];
    limitingParameters = self->_limitingParameters;
    self->_limitingParameters = v3;
  }
}

- (id)acceptedConfigs:(id)a3 logTelemetry:(BOOL)a4 allowWildcardBuild:(BOOL)a5
{
  uint64_t v5 = a5;
  BOOL v6 = a4;
  uint64_t v106 = *MEMORY[0x263EF8340];
  id v84 = a3;
  [(DRSTaskingDecisionMaker *)self refreshLimitingParameters];
  double v8 = DPLogHandle_TaskingDecisionMaker();
  v83 = self;
  if (os_signpost_enabled(v8))
  {
    double v9 = [v84 messageUUID];
    if ([(DRSTaskingDecisionMaker *)self enforceDate]) {
      id v10 = @"YES";
    }
    else {
      id v10 = @"NO";
    }
    if ([(DRSTaskingDecisionMaker *)v83 enforceSampling]) {
      uint64_t v11 = @"YES";
    }
    else {
      uint64_t v11 = @"NO";
    }
    uint64_t v79 = v11;
    if ([(DRSTaskingDecisionMaker *)v83 enforceTeamHysteresis]) {
      id v12 = @"YES";
    }
    else {
      id v12 = @"NO";
    }
    BOOL v13 = v6;
    if ([(DRSTaskingDecisionMaker *)v83 enforceGlobalHysteresisAndCap]) {
      char v14 = @"YES";
    }
    else {
      char v14 = @"NO";
    }
    uint64_t v15 = [(DRSTaskingDecisionMaker *)v83 limitingParameters];
    uint64_t v16 = [v15 acceptedConfigCountCap];
    [(DRSTaskingDecisionMaker *)v83 limitingParameters];
    uint64_t v17 = v81 = v5;
    [v17 taskingHysteresisInterval];
    uint64_t v19 = v18;
    uint64_t v20 = [(DRSTaskingDecisionMaker *)v83 limitingParameters];
    [v20 perTeamTaskingHysteresisInterval];
    *(_DWORD *)buf = 138545154;
    long long v91 = v9;
    __int16 v92 = 2114;
    long long v93 = v10;
    self = v83;
    __int16 v94 = 2114;
    long long v95 = v79;
    __int16 v96 = 2114;
    long long v97 = v12;
    __int16 v98 = 2114;
    long long v99 = v14;
    BOOL v6 = v13;
    __int16 v100 = 2048;
    uint64_t v101 = v16;
    __int16 v102 = 2048;
    id v103 = v19;
    __int16 v104 = 2048;
    long long v105 = v21;
    _os_signpost_emit_with_name_impl(&dword_209E70000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessingTaskingMessage", "Processing tasking message %{public}@ with:\n\t-enforceDate: %{public}@\n\t-enforceSampling: %{public}@\n\t-enforceTeamHysteresis: %{public}@\n\t-enforceGlobalHysteresisAndCap: %{public}@\n\nLimiting Parameters:\n\t-acceptedCountCap: %lu\n\t-taskingHysteresisInterval: %f\n\t-perTeamTaskingHysteresisInterval: %f", buf, 0x52u);

    uint64_t v5 = v81;
  }

  id v22 = [v84 dateReceived];
  [(DRSTaskingDecisionMaker *)self setCurrentReceivedDate:v22];

  uint64_t v23 = [(DRSTaskingDecisionMaker *)self limitingParameters];
  uint64_t v24 = [v23 acceptedConfigCountCap];

  if (v24)
  {
    BOOL v82 = v6;
    uint64_t v25 = [(DRSTaskingDecisionMaker *)self _teamTaskingsPassingDate:v84 logTelemetry:v6];
    uint64_t v26 = v25;
    if (v25 && [v25 count])
    {
      uint64_t v27 = [(DRSTaskingDecisionMaker *)self _teamTaskingsPassingBuild:v26 logTelemetry:v82 allowWildcardBuild:v5];
      if ([v26 count])
      {
        __int16 v28 = [(DRSTaskingDecisionMaker *)self _configsPassingSampling:v27 logTelemetry:v82];
        v72 = v28;
        if (v28 && [v28 count])
        {
          v29 = [(DRSTaskingDecisionMaker *)self _configsPassingPerTeamHysteresis:v72 logTelemetry:v82];
          v71 = v29;
          if (v29 && [v29 count])
          {
            __int16 v30 = [(DRSTaskingDecisionMaker *)self _configsPassingOverallHysteresis:v71 logTelemetry:v82];
            id v31 = v30;
            if (v30 && [v30 count])
            {
              uint64_t v69 = v27;
              uint64_t v70 = v26;
              v78 = [MEMORY[0x263EFF910] date];
              id v75 = [MEMORY[0x263EFF980] array];
              long long v85 = 0u;
              long long v86 = 0u;
              long long v87 = 0u;
              long long v88 = 0u;
              id obj = v31;
              uint64_t v80 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
              if (v80)
              {
                uint64_t v76 = *(void *)v86;
                __int16 v77 = v31;
                do
                {
                  for (uint64_t i = 0; i != v80; ++i)
                  {
                    if (*(void *)v86 != v76) {
                      objc_enumerationMutation(obj);
                    }
                    unint64_t v33 = *(void **)(*((void *)&v85 + 1) + 8 * i);
                    uint64_t v34 = DPLogHandle_TaskingDecisionMaker();
                    if (os_signpost_enabled(v34))
                    {
                      uint64_t v35 = [v84 messageUUID];
                      v36 = [v33 configUUID];
                      *(_DWORD *)buf = 138543618;
                      long long v91 = v35;
                      __int16 v92 = 2114;
                      long long v93 = v36;
                      _os_signpost_emit_with_name_impl(&dword_209E70000, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AcceptedConfig", "TaskingMessage %{public}@: Accepted config %{public}@", buf, 0x16u);
                    }
                    id v37 = [v33 startDate];
                    uint64_t v38 = [v37 compare:v78];

                    if (v38 == 1) {
                      uint64_t v39 = 1;
                    }
                    else {
                      uint64_t v39 = 2;
                    }
                    if (v38 == 1) {
                      uint64_t v40 = 0;
                    }
                    else {
                      uint64_t v40 = v78;
                    }
                    id v41 = v40;
                    id v42 = [DRSConfigMetadata alloc];
                    uint64_t v43 = [v33 teamID];
                    uint64_t v44 = [v33 configUUID];
                    [(DRSTaskingDecisionMaker *)self currentReceivedDate];
                    v46 = uint64_t v45 = self;
                    BYTE1(v68) = [(DRSTaskingDecisionMaker *)v45 reportToDecisionServer];
                    LOBYTE(v68) = v82;
                    uint64_t v47 = -[DRSConfigMetadata initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:](v42, "initWithTeamID:configUUID:state:completionType:receivedDate:appliedDate:completedDate:completionDescription:config:logTelemetry:reportToDecisionServer:", v43, v44, v39, 4097, v46, v41, 0, 0, v33, v68);

                    if (v47)
                    {
                      [(DRSTaskingDecisionMaker *)v45 _persistReceivedMetadata:v47];
                      [v75 addObject:v47];
                      self = v45;
                    }
                    else
                    {
                      id v48 = DPLogHandle_TaskingDecisionMakerError();
                      if (os_signpost_enabled(v48))
                      {
                        v74 = [v84 messageUUID];
                        __int16 v49 = [v33 teamID];
                        uint64_t v50 = [v33 configUUID];
                        DRConfigStringForState();
                        uint64_t v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        DRConfigCompletionTypeString(4097);
                        uint64_t v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
                        uint64_t v53 = [(DRSTaskingDecisionMaker *)v83 currentReceivedDate];
                        long long v54 = [v33 jsonDictRepresentation];
                        *(_DWORD *)buf = 138545154;
                        long long v91 = v74;
                        __int16 v92 = 2114;
                        long long v93 = v49;
                        __int16 v94 = 2114;
                        long long v95 = v50;
                        __int16 v96 = 2114;
                        long long v97 = v51;
                        __int16 v98 = 2114;
                        long long v99 = v52;
                        __int16 v100 = 2114;
                        uint64_t v101 = (uint64_t)v53;
                        __int16 v102 = 2114;
                        id v103 = v41;
                        __int16 v104 = 2114;
                        long long v105 = v54;
                        _os_signpost_emit_with_name_impl(&dword_209E70000, v48, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidConfigMetadata", "TaskingMessage %{public}@: Invalid config metadata:\n\tTeamID: %{public}@\n\tConfigUUID: %{public}@\n\tState: %{public}@\n\tCompletionType: %{public}@\n\tReceived Date: %{public}@\n\tApplied Date: %{public}@\n\tConfig:%{public}@\n", buf, 0x52u);
                      }
                      self = v83;
                    }
                    id v31 = v77;
                  }
                  uint64_t v80 = [obj countByEnumeratingWithState:&v85 objects:v89 count:16];
                }
                while (v80);
              }

              [(DRSTaskingDecisionMaker *)self setCurrentReceivedDate:0];
              uint64_t v27 = v69;
              uint64_t v26 = v70;
            }
            else
            {
              v65 = DPLogHandle_TaskingDecisionMaker();
              if (os_signpost_enabled(v65))
              {
                uint64_t v66 = [v84 messageUUID];
                *(_DWORD *)buf = 138543362;
                long long v91 = v66;
                _os_signpost_emit_with_name_impl(&dword_209E70000, v65, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoAcceptedConfigs", "No configs from TaskingMessage %{public}@ passed overall hysteresis", buf, 0xCu);
              }
              [(DRSTaskingDecisionMaker *)self setCurrentReceivedDate:0];
              id v75 = 0;
            }
          }
          else
          {
            v63 = DPLogHandle_TaskingDecisionMaker();
            if (os_signpost_enabled(v63))
            {
              uint64_t v64 = [v84 messageUUID];
              *(_DWORD *)buf = 138543362;
              long long v91 = v64;
              _os_signpost_emit_with_name_impl(&dword_209E70000, v63, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoAcceptedConfigs", "No configs from TaskingMessage %{public}@ passed per-team hysteresis", buf, 0xCu);
            }
            [(DRSTaskingDecisionMaker *)self setCurrentReceivedDate:0];
            id v75 = 0;
          }
        }
        else
        {
          v59 = DPLogHandle_TaskingDecisionMaker();
          if (os_signpost_enabled(v59))
          {
            __int16 v60 = [v84 messageUUID];
            *(_DWORD *)buf = 138543362;
            long long v91 = v60;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v59, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoAcceptedConfigs", "No configs from TaskingMessage %{public}@ passed sampling", buf, 0xCu);
          }
          [(DRSTaskingDecisionMaker *)self setCurrentReceivedDate:0];
          id v75 = 0;
        }
      }
      else
      {
        uint64_t v61 = DPLogHandle_TaskingDecisionMaker();
        if (os_signpost_enabled(v61))
        {
          __int16 v62 = [v84 messageUUID];
          *(_DWORD *)buf = 138543362;
          long long v91 = v62;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v61, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoAcceptedConfigs", "All configs from TaskingMessage %{public}@ rejected by build", buf, 0xCu);
        }
        [(DRSTaskingDecisionMaker *)self setCurrentReceivedDate:0];
        id v75 = 0;
      }
    }
    else
    {
      long long v55 = DPLogHandle_TaskingDecisionMaker();
      if (os_signpost_enabled(v55))
      {
        long long v56 = [v84 messageUUID];
        *(_DWORD *)buf = 138543362;
        long long v91 = v56;
        _os_signpost_emit_with_name_impl(&dword_209E70000, v55, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NoAcceptedConfigs", "All configs from TaskingMessage %{public}@ rejected by date", buf, 0xCu);
      }
      [(DRSTaskingDecisionMaker *)self setCurrentReceivedDate:0];
      id v75 = 0;
    }
  }
  else
  {
    uint64_t v57 = DPLogHandle_TaskingDecisionMaker();
    if (os_signpost_enabled(v57))
    {
      v58 = [v84 messageUUID];
      *(_DWORD *)buf = 138543362;
      long long v91 = v58;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v57, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "RejectingTaskingMessage", "Decision maker is disabled (active config cap is 0). Rejecting message %{public}@ entirely", buf, 0xCu);
    }
    [(DRSTaskingDecisionMaker *)self _rejectTaskingMessageDueToDisabledState:v84 logTelemetry:v6];
    id v75 = 0;
  }

  return v75;
}

- (id)acceptedConfigs:(id)a3 logTelemetry:(BOOL)a4
{
  return [(DRSTaskingDecisionMaker *)self acceptedConfigs:a3 logTelemetry:a4 allowWildcardBuild:0];
}

- (id)acceptedCancels:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DRSTaskingDecisionMaker *)self configStore];

  if (v5)
  {
    BOOL v6 = [MEMORY[0x263EFF9A0] dictionary];
    id v7 = [MEMORY[0x263EFF910] date];
    double v8 = NSString;
    double v9 = [v4 messageUUID];
    id v10 = [v9 UUIDString];
    uint64_t v11 = [v8 stringWithFormat:@"Cancelled by cancel tasking message %@", v10];

    id v12 = [v4 perTeamCancelledConfigUUIDs];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __43__DRSTaskingDecisionMaker_acceptedCancels___block_invoke;
    v18[3] = &unk_263FCA278;
    void v18[4] = self;
    id v19 = v7;
    id v20 = v11;
    id v21 = v4;
    id v13 = v6;
    id v22 = v13;
    id v14 = v11;
    id v15 = v7;
    [v12 enumerateKeysAndObjectsUsingBlock:v18];

    if ([v13 count]) {
      id v16 = v13;
    }
    else {
      id v16 = 0;
    }
  }
  else
  {
    id v16 = [v4 perTeamCancelledConfigUUIDs];
  }

  return v16;
}

void __43__DRSTaskingDecisionMaker_acceptedCancels___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v29 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x263EFF980] array];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v33;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v33 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = *(void *)(*((void *)&v32 + 1) + 8 * v12);
      id v14 = [*(id *)(a1 + 32) configStore];
      id v31 = 0;
      id v15 = [v14 configMetadataForUUID:v13 errorOut:&v31];
      id v16 = v31;

      if (v16) {
        break;
      }
      if ([v15 state] == 3)
      {
        uint64_t v17 = DPLogHandle_TaskingDecisionMaker();
        if (os_signpost_enabled(v17))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v37 = v13;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigAlreadyCompleted", "Config %{public}@ already completed", buf, 0xCu);
        }
      }
      else
      {

        uint64_t v18 = [*(id *)(a1 + 32) configStore];
        uint64_t v19 = *(void *)(a1 + 40);
        uint64_t v20 = *(void *)(a1 + 48);
        id v30 = 0;
        char v21 = [v18 completeConfigWithUUID:v13 completedDate:v19 completionType:8195 completionDescription:v20 errorOut:&v30];
        id v15 = v30;

        if ((v21 & 1) == 0)
        {
          *a4 = 1;
          uint64_t v26 = DPLogHandle_TaskingDecisionMakerError();
          if (os_signpost_enabled(v26))
          {
            uint64_t v27 = [v15 localizedDescription];
            *(_DWORD *)buf = 138543618;
            uint64_t v37 = v13;
            __int16 v38 = 2114;
            id v39 = v27;
            _os_signpost_emit_with_name_impl(&dword_209E70000, v26, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelFailed", "Failed to cancel %{public}@ to error: %{public}@", buf, 0x16u);
          }
          id v16 = v15;
LABEL_25:

          goto LABEL_26;
        }
        id v22 = DPLogHandle_TaskingDecisionMaker();
        if (os_signpost_enabled(v22))
        {
          uint64_t v23 = [*(id *)(a1 + 56) messageUUID];
          *(_DWORD *)buf = 138543874;
          uint64_t v37 = v13;
          __int16 v38 = 2114;
          id v39 = v29;
          __int16 v40 = 2114;
          id v41 = v23;
          _os_signpost_emit_with_name_impl(&dword_209E70000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CancelConfig", "Cancelled %{public}@ (teamID %{public}@) due to cancel message %{public}@", buf, 0x20u);
        }
        [v7 addObject:v13];
      }

      if (v10 == ++v12)
      {
        uint64_t v10 = [v8 countByEnumeratingWithState:&v32 objects:v42 count:16];
        if (v10) {
          goto LABEL_3;
        }
        goto LABEL_17;
      }
    }
    *a4 = 1;
    uint64_t v24 = DPLogHandle_TaskingDecisionMakerError();
    if (os_signpost_enabled(v24))
    {
      uint64_t v25 = [v16 localizedDescription];
      *(_DWORD *)buf = 138543618;
      uint64_t v37 = v13;
      __int16 v38 = 2114;
      id v39 = v25;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AcceptedCancelsFailure", "Lookup of %{public}@ failed due to error: %{public}@", buf, 0x16u);
    }
    uint64_t v26 = v15;
    goto LABEL_25;
  }
LABEL_17:

  if ([v7 count]) {
    [*(id *)(a1 + 64) setObject:v7 forKeyedSubscript:v29];
  }
LABEL_26:
}

- (void)clientCompletedConfigUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DRSTaskingDecisionMaker *)self configStore];
  id v6 = [MEMORY[0x263EFF910] date];
  id v13 = 0;
  char v7 = [v5 completeConfigWithUUID:v4 completedDate:v6 completionType:8196 completionDescription:@"Completed by client" errorOut:&v13];
  id v8 = v13;

  if ((v7 & 1) == 0)
  {
    uint64_t v9 = DPLogHandle_TaskingDecisionMakerError();
    if (os_signpost_enabled(v9))
    {
      uint64_t v10 = [v8 localizedDescription];
      uint64_t v11 = (void *)v10;
      uint64_t v12 = @"Unknown";
      if (v10) {
        uint64_t v12 = (__CFString *)v10;
      }
      *(_DWORD *)buf = 138543618;
      id v15 = v4;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientCompletionFailed", "Failed to complete config UUID %{public}@ due to error: %{public}@", buf, 0x16u);
    }
  }
}

- (void)clientRejectsConfigUUID:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(DRSTaskingDecisionMaker *)self configStore];
  id v6 = [MEMORY[0x263EFF910] date];
  id v13 = 0;
  char v7 = [v5 completeConfigWithUUID:v4 completedDate:v6 completionType:1 completionDescription:@"Rejected by client" errorOut:&v13];
  id v8 = v13;

  if ((v7 & 1) == 0)
  {
    uint64_t v9 = DPLogHandle_TaskingDecisionMakerError();
    if (os_signpost_enabled(v9))
    {
      uint64_t v10 = [v8 localizedDescription];
      uint64_t v11 = (void *)v10;
      uint64_t v12 = @"Unknown";
      if (v10) {
        uint64_t v12 = (__CFString *)v10;
      }
      *(_DWORD *)buf = 138543618;
      id v15 = v4;
      __int16 v16 = 2114;
      uint64_t v17 = v12;
      _os_signpost_emit_with_name_impl(&dword_209E70000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClientRejectionFailed", "Failed to reject config UUID %{public}@ due to error: %{public}@", buf, 0x16u);
    }
  }
}

- (NSTimeZone)deviceTimezone
{
  return self->_deviceTimezone;
}

- (DRSTaskingLimitingParameters)limitingParameters
{
  return self->_limitingParameters;
}

- (NSString)dbWorkingDirectoryPath
{
  return self->_dbWorkingDirectoryPath;
}

- (DRSConfigPersistedStore)configStore
{
  return self->_configStore;
}

- (BOOL)enforceDate
{
  return self->_enforceDate;
}

- (BOOL)enforceBuild
{
  return self->_enforceBuild;
}

- (BOOL)enforceSampling
{
  return self->_enforceSampling;
}

- (BOOL)enforceTeamHysteresis
{
  return self->_enforceTeamHysteresis;
}

- (BOOL)enforceGlobalHysteresisAndCap
{
  return self->_enforceGlobalHysteresisAndCap;
}

- (BOOL)allowRefreshLimitingParameters
{
  return self->_allowRefreshLimitingParameters;
}

- (DRSTaskingCloudKitHelper)cloudKitHelper
{
  return self->_cloudKitHelper;
}

- (NSDate)currentReceivedDate
{
  return self->_currentReceivedDate;
}

- (void)setCurrentReceivedDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentReceivedDate, 0);
  objc_storeStrong((id *)&self->_cloudKitHelper, 0);
  objc_storeStrong((id *)&self->_configStore, 0);
  objc_storeStrong((id *)&self->_dbWorkingDirectoryPath, 0);
  objc_storeStrong((id *)&self->_limitingParameters, 0);

  objc_storeStrong((id *)&self->_deviceTimezone, 0);
}

@end