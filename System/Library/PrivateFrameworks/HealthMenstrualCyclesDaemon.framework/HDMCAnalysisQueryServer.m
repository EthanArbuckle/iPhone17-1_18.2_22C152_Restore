@interface HDMCAnalysisQueryServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7;
+ (id)requiredEntitlements;
- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable;
- (HDMCAnalysisQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7;
- (id)_analysisQueryClientProxy;
- (id)objectTypes;
- (void)_handleAnalysis:(id)a3;
- (void)_queue_start;
- (void)_queue_stop;
@end

@implementation HDMCAnalysisQueryServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v13 profile];
  v16 = [v15 profileExtensionWithIdentifier:*MEMORY[0x263F450C8]];

  if (v16)
  {
    v17 = [[HDMCAnalysisQueryServer alloc] initWithUUID:v11 configuration:v12 client:v13 delegate:v14 profileExtension:v16];
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_error:format:", 3, @"No profile extension found for %@", objc_opt_class());
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7) {
        *a7 = v18;
      }
      else {
        _HKLogDroppedError();
      }
    }

    v17 = 0;
  }

  return v17;
}

- (HDMCAnalysisQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7
{
  id v13 = a4;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HDMCAnalysisQueryServer;
  v15 = [(HDQueryServer *)&v18 initWithUUID:a3 configuration:v13 client:a5 delegate:a6];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_profileExtension, a7);
    objc_storeStrong((id *)&v16->_configuration, a4);
  }

  return v16;
}

- (void)_queue_start
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)HDMCAnalysisQueryServer;
  [(HDQueryServer *)&v33 _queue_start];
  v3 = [(HDMCAnalysisQueryServer *)self _analysisQueryClientProxy];
  v4 = [(HDQueryServer *)self client];
  v5 = [v4 authorizationOracle];
  v6 = [(HDMCAnalysisQueryServer *)self objectTypes];
  id v32 = 0;
  v7 = [v5 readAuthorizationStatusesForTypes:v6 error:&v32];
  id v8 = v32;

  if (v7)
  {
    v9 = [(HDQueryServer *)self client];
    v10 = [v9 authorizationOracle];
    char v11 = [v10 clientHasAuthorizationForAllTypes];

    if ((v11 & 1) == 0)
    {
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v12 = [v7 allValues];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v38 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v29;
        char v16 = 1;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v29 != v15) {
              objc_enumerationMutation(v12);
            }
            if (v16) {
              char v16 = [*(id *)(*((void *)&v28 + 1) + 8 * i) canRead];
            }
            else {
              char v16 = 0;
            }
          }
          uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v38 count:16];
        }
        while (v14);

        if ((v16 & 1) == 0)
        {
          _HKInitializeLogging();
          objc_super v18 = (void *)*MEMORY[0x263F09930];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09930], OS_LOG_TYPE_DEFAULT))
          {
            v19 = v18;
            v20 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v35 = v20;
            __int16 v36 = 2114;
            v37 = v7;
            id v21 = v20;
            _os_log_impl(&dword_225722000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x16u);
          }
          v22 = (void *)[objc_alloc(MEMORY[0x263F451E8]) initWithNumberOfCycles:0 firstMenstruationStartDayIndex:0 lastMenstruationStartDayIndex:0 cycleLengthMedian:0 cycleLengthLowerPercentile:0 cycleLengthUpperPercentile:0 menstruationLengthMedian:0 menstruationLengthLowerPercentile:0 menstruationLengthUpperPercentile:0];
          id v23 = objc_alloc(MEMORY[0x263F45110]);
          LOBYTE(v27) = 0;
          LOBYTE(v26) = 0;
          v24 = objc_msgSend(v23, "initWithStatistics:menstruationProjections:fertileWindowProjections:menstruationProjectionsEnabled:fertileWindowProjectionsEnabled:cycles:deviations:recentSymptoms:recentBasalBodyTemperature:lastLoggedDayIndex:lastMenstrualFlowDayIndex:isPeriodLogLate:ongoingCycleFactors:numberOfDailySleepHeartRateStatisticsForPast100Days:numberOfDailyAwakeHeartRateStatisticsForPast100Days:hasHealthAppDevicesWithHigherAlgorithmVersions:", v22, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], 0, 0, MEMORY[0x263EFFA68], MEMORY[0x263EFFA68], 0, 0, 0, 0, v26, MEMORY[0x263EFFA68],
                          0,
                          0,
                          v27);
          v25 = [(HDQueryServer *)self queryUUID];
          objc_msgSend(v3, "client_deliverAnalysis:queryUUID:", v24, v25);

          goto LABEL_21;
        }
      }
      else
      {
      }
    }
    v22 = [(HDMCProfileExtension *)self->_profileExtension analysisManager];
    [v22 registerObserver:self queue:0 userInitiated:1];
    if (([(HKMCAnalysisQueryConfiguration *)self->_configuration forceAnalysis] & 1) == 0)
    {
      v24 = [v22 currentAnalysis];
      [(HDMCAnalysisQueryServer *)self _handleAnalysis:v24];
LABEL_21:
    }
  }
  else
  {
    v22 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v3, "client_deliverError:forQuery:", v8, v22);
  }
}

- (id)_analysisQueryClientProxy
{
  v2 = [(HDQueryServer *)self clientProxy];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (void)_handleAnalysis:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v9 = v5;
    v6 = [v5 cycles];

    if (v6)
    {
      if (([(HKMCAnalysis *)self->_analysis isEqual:v9] & 1) == 0)
      {
        objc_storeStrong((id *)&self->_analysis, a3);
        v7 = [(HDMCAnalysisQueryServer *)self _analysisQueryClientProxy];
        id v8 = [(HDQueryServer *)self queryUUID];
        objc_msgSend(v7, "client_deliverAnalysis:queryUUID:", v9, v8);
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (id)objectTypes
{
  v2 = (void *)MEMORY[0x263EFF9C0];
  v3 = HKMCCycleTrackingSampleTypes();
  v4 = [v2 setWithArray:v3];

  id v5 = [MEMORY[0x263F0A168] characteristicTypeForIdentifier:*MEMORY[0x263F09468]];
  [v4 addObject:v5];

  return v4;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x263EFFA68];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6 = a4;
  v7 = [v6 entitlements];
  uint64_t v8 = *MEMORY[0x263F09BA8];
  char v9 = [v7 hasEntitlement:*MEMORY[0x263F09BA8]];

  if ((v9 & 1) != 0
    || ([v6 entitlements],
        v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = *MEMORY[0x263F09B98],
        char v12 = [v10 hasPrivateAccessEntitlementWithIdentifier:*MEMORY[0x263F09B98]],
        v10,
        (v12 & 1) != 0))
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:format:", a5, 4, @"Missing required entitlement: %@ for core apps or %@ for second-party access.", v8, v11);
    BOOL v13 = 0;
  }

  return v13;
}

- (void)_queue_stop
{
  v4.receiver = self;
  v4.super_class = (Class)HDMCAnalysisQueryServer;
  [(HDQueryServer *)&v4 _queue_stop];
  v3 = [(HDMCProfileExtension *)self->_profileExtension analysisManager];
  [v3 unregisterObserver:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
}

@end