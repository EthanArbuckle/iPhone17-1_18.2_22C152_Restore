@interface DiagnosticStatisticsManager
- (DiagnosticStatisticsManager)initWithWorkspace:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
- (double)_calculateAverageCasesPerDayFromDailyAggregatedStatistics;
- (id)_createDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6;
- (id)_retrieveDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6;
- (id)_retrieveDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6 onOrAfter:(id)a7 create:(BOOL)a8;
- (int64_t)_removeAllDiagnosticCaseUsageFor:(id)a3;
- (int64_t)_removeDiagnosticCaseUsageMatchingDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6;
- (void)_checkFileWritingLimits:(id)a3;
- (void)_updateCaseStatisticsWith:(id)a3;
- (void)_updateDailyCaseStatisticsWith:(id)a3;
- (void)_updateDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6 lastSeen:(id)a7 dampeningType:(BOOL)a8;
- (void)cleanupDiagnosticCaseUsage;
- (void)getDiagnosticCaseUsageStatistics:(id)a3;
- (void)resetDiagnosticCaseUsage;
- (void)updateCaseStatisticsWith:(id)a3;
@end

@implementation DiagnosticStatisticsManager

- (DiagnosticStatisticsManager)initWithWorkspace:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DiagnosticStatisticsManager;
  v9 = [(DiagnosticStatisticsManager *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_workspace, a3);
    v11 = [[DiagnosticCaseUsageAnalytics alloc] initWithWorkspace:v7 withCache:0];
    caseUsageSpace = v10->_caseUsageSpace;
    v10->_caseUsageSpace = v11;
  }
  return v10;
}

- (void)_checkFileWritingLimits:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 dampeningType])
  {
    *(void *)buf = 0;
    v27 = buf;
    uint64_t v28 = 0x2020000000;
    uint64_t v29 = 0;
    [v4 caseOpenedTime];
    if (v5 > 100000000.0)
    {
      [v4 caseOpenedTime];
      double v8 = v10;
    }
    else
    {
      v6 = [MEMORY[0x263EFF910] date];
      [v6 timeIntervalSince1970];
      double v8 = v7;
    }
    v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(86400 * ((unint64_t)v8 / 0x15180))];
    v12 = [(DiagnosticStatisticsManager *)self _retrieveDiagnosticCaseUsageForDomain:@"DAILY_AGGREGATE" type:@"DAILY_AGGREGATE" subType:@"DAILY_AGGREGATE" process:@"DAILY_AGGREGATE" onOrAfter:v11 create:0];
    v13 = casemanagementLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = [v12 count];
      *(_DWORD *)v30 = 134218242;
      uint64_t v31 = v14;
      __int16 v32 = 2112;
      unint64_t v33 = (unint64_t)v11;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "Found %ld case usages since %@", v30, 0x16u);
    }

    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __55__DiagnosticStatisticsManager__checkFileWritingLimits___block_invoke;
    v25[3] = &unk_263FC3638;
    v25[4] = buf;
    [v12 enumerateObjectsUsingBlock:v25];
    v15 = +[ABCAdministrator sharedInstance];
    v16 = [v15 configurationManager];
    unint64_t v17 = [v16 dampenedIPSLimit];

    unint64_t v18 = *((void *)v27 + 3);
    if (v18 > v17)
    {
      v19 = casemanagementLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = *((void *)v27 + 3);
        *(_DWORD *)v30 = 134218240;
        uint64_t v31 = v24;
        __int16 v32 = 2048;
        unint64_t v33 = v17;
        v21 = "Surpassed limit for dampened cases. Will not write out ips file. (%ld > %ld)";
        v22 = v19;
        os_log_type_t v23 = OS_LOG_TYPE_INFO;
        goto LABEL_15;
      }
    }
    else
    {
      v19 = casemanagementLogHandle();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = *((void *)v27 + 3);
        *(_DWORD *)v30 = 134218240;
        uint64_t v31 = v20;
        __int16 v32 = 2048;
        unint64_t v33 = v17;
        v21 = "Still under limit for dampened cases. Allowing write out of ips file. (%ld <= %ld)";
        v22 = v19;
        os_log_type_t v23 = OS_LOG_TYPE_DEBUG;
LABEL_15:
        _os_log_impl(&dword_209DBA000, v22, v23, v21, v30, 0x16u);
      }
    }

    [v4 allowIPSFileOutput:v18 <= v17];
    _Block_object_dispose(buf, 8);
    goto LABEL_17;
  }
  v9 = casemanagementLogHandle();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v9, OS_LOG_TYPE_DEBUG, "Case accepted. Allowing write out of ips file by default.", buf, 2u);
  }

LABEL_17:
}

void __55__DiagnosticStatisticsManager__checkFileWritingLimits___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = (int)[v3 casesSeen];
  int v5 = [v3 casesAccepted];
  uint64_t v6 = v4 - v5;
  double v7 = casemanagementLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = v5;
    v9 = [v3 lastSeen];
    int v10 = 134218754;
    uint64_t v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = v8;
    __int16 v14 = 2048;
    uint64_t v15 = v6;
    __int16 v16 = 2112;
    unint64_t v17 = v9;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_DEBUG, "  Total cases: %ld, cases accepted: %ld, cases dampened: %ld (last seen: %@)", (uint8_t *)&v10, 0x2Au);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v6;
}

- (void)updateCaseStatisticsWith:(id)a3
{
  id v4 = a3;
  [(DiagnosticStatisticsManager *)self _updateCaseStatisticsWith:v4];
  [(DiagnosticStatisticsManager *)self _updateDailyCaseStatisticsWith:v4];
}

- (void)getDiagnosticCaseUsageStatistics:(id)a3
{
  id v4 = a3;
  int v5 = [(DiagnosticStatisticsManager *)self queue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__DiagnosticStatisticsManager_getDiagnosticCaseUsageStatistics___block_invoke;
  v7[3] = &unk_263FC2DE8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __64__DiagnosticStatisticsManager_getDiagnosticCaseUsageStatistics___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    v25 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"lastSeen" ascending:0];
    uint64_t v26 = a1;
    v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "fetchEntitiesFreeForm:sortDesc:", 0);
    id v3 = [MEMORY[0x263EFF980] array];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v2;
    uint64_t v30 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v30)
    {
      uint64_t v28 = *(void *)v48;
      id v4 = @"N/A";
      unint64_t v5 = 0x263F08000uLL;
      uint64_t v29 = v3;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v48 != v28) {
            objc_enumerationMutation(obj);
          }
          double v7 = *(void **)(*((void *)&v47 + 1) + 8 * i);
          id v8 = NSDictionary;
          uint64_t v9 = [v7 domain];
          if (v9)
          {
            v36 = [v7 domain];
            v41 = v36;
          }
          else
          {
            v41 = @"N/A";
          }
          uint64_t v10 = [v7 type];
          if (v10)
          {
            v35 = [v7 type];
            v40 = v35;
          }
          else
          {
            v40 = @"N/A";
          }
          uint64_t v11 = [v7 subtype];
          if (v11)
          {
            uint64_t v34 = [v7 subtype];
            v38 = v34;
          }
          else
          {
            v38 = @"N/A";
          }
          v42 = [v7 process];
          v43 = v8;
          if (v42)
          {
            unint64_t v33 = [v7 process];
            v37 = v33;
          }
          else
          {
            v37 = @"N/A";
          }
          v39 = objc_msgSend(*(id *)(v5 + 2584), "numberWithInteger:", (int)objc_msgSend(v7, "casesSeen"));
          __int16 v12 = [v7 lastSeen];
          v44 = (void *)v11;
          if (v12)
          {
            uint64_t v13 = [v7 lastSeen];
            __int16 v32 = v13;
          }
          else
          {
            uint64_t v13 = @"N/A";
          }
          __int16 v14 = objc_msgSend(*(id *)(v5 + 2584), "numberWithInteger:", (int)objc_msgSend(v7, "casesAccepted"));
          uint64_t v15 = [v7 lastAccepted];
          v45 = (void *)v10;
          v46 = (void *)v9;
          if (v15)
          {
            id v4 = [v7 lastAccepted];
            uint64_t v31 = v4;
          }
          __int16 v16 = *(void **)(v5 + 2584);
          objc_msgSend(v7, "interarrival_mean");
          uint64_t v17 = objc_msgSend(v16, "numberWithDouble:");
          unint64_t v18 = v5;
          v19 = (void *)v17;
          unint64_t v20 = v18;
          v21 = *(void **)(v18 + 2584);
          objc_msgSend(v7, "interarrival_var");
          v22 = objc_msgSend(v21, "numberWithDouble:");
          objc_msgSend(v43, "dictionaryWithObjectsAndKeys:", v41, @"domain", v40, @"type", v38, @"subtype", v37, @"detected", v39, @"casesSeen", v13, @"lastSeen", v14, @"casesAccepted", v4, @"lastAccepted", v19,
            @"interArrivalMean",
            v22,
            @"interArrivalVariance",
          os_log_type_t v23 = 0);

          if (v15) {
          id v4 = @"N/A";
          }
          if (v12) {

          }
          id v3 = v29;
          unint64_t v5 = v20;
          if (v42) {

          }
          if (v44) {
          if (v45)
          }

          if (v46) {
          [v29 addObject:v23];
          }
        }
        uint64_t v30 = [obj countByEnumeratingWithState:&v47 objects:v51 count:16];
      }
      while (v30);
    }

    uint64_t v24 = *(void *)(v26 + 40);
    if (v24) {
      (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v3);
    }
  }
}

- (void)_updateCaseStatisticsWith:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x263EFF910];
  [v4 caseOpenedTime];
  id v6 = objc_msgSend(v5, "dateWithTimeIntervalSince1970:");
  if (v6)
  {
    double v7 = [v4 caseDomain];
    id v8 = [v4 caseType];
    uint64_t v9 = [v4 caseSubType];
    uint64_t v10 = [v4 caseDetectedProcess];
    -[DiagnosticStatisticsManager _updateDiagnosticCaseUsageForDomain:type:subType:process:lastSeen:dampeningType:](self, "_updateDiagnosticCaseUsageForDomain:type:subType:process:lastSeen:dampeningType:", v7, v8, v9, v10, v6, [v4 dampeningType] != 0);
  }
  else
  {
    uint64_t v11 = casemanagementLogHandle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v12 = 0;
      _os_log_impl(&dword_209DBA000, v11, OS_LOG_TYPE_ERROR, "DiagnosticCase has no timeStamp!", v12, 2u);
    }
  }
}

- (void)_updateDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6 lastSeen:(id)a7 dampeningType:(BOOL)a8
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = [(DiagnosticStatisticsManager *)self _retrieveDiagnosticCaseUsageForDomain:v14 type:v15 subType:v16 process:v17];
  if ([v19 count] == 1)
  {
    uint64_t v20 = [v19 firstObject];
    if (v20)
    {
      v21 = v20;
      BOOL v30 = a8;
      v22 = casemanagementLogHandle();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = (uint64_t)v21;
        _os_log_impl(&dword_209DBA000, v22, OS_LOG_TYPE_INFO, "Updating DiagCaseUsage: %@", buf, 0xCu);
      }

      uint64_t v31 = [v21 lastSeen];
      int v23 = [v21 casesSeen];
      [v21 setCasesSeen:(v23 + 1)];
      [v21 setLastSeen:v18];
      [v21 interarrival_mean];
      if (v23 >= 1)
      {
        double v25 = v24;
        [v18 timeIntervalSinceDate:v31];
        double v27 = v26;
        +[MathUtility computeNewMeanFromValue:currentMean:currentCount:](MathUtility, "computeNewMeanFromValue:currentMean:currentCount:", (v23 - 1));
        -[NSObject setInterarrival_mean:](v21, "setInterarrival_mean:");
        if (v23 != 1)
        {
          [v21 interarrival_var];
          +[MathUtility computeNewVarianceFromValue:(v23 - 1) currentMean:v27 currentCount:v25 currentVariance:v28];
          -[NSObject setInterarrival_var:](v21, "setInterarrival_var:");
        }
      }
      if (!v30)
      {
        [v21 setCasesAccepted:[v21 casesAccepted] + 1];
        [v21 setLastAccepted:v18];
      }
      [(ObjectAnalytics *)self->_caseUsageSpace save];

      goto LABEL_16;
    }
  }
  else
  {
    uint64_t v29 = casemanagementLogHandle();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134219010;
      uint64_t v33 = [v19 count];
      __int16 v34 = 2112;
      id v35 = v14;
      __int16 v36 = 2112;
      id v37 = v15;
      __int16 v38 = 2112;
      id v39 = v16;
      __int16 v40 = 2112;
      id v41 = v17;
      _os_log_impl(&dword_209DBA000, v29, OS_LOG_TYPE_INFO, "Found %ld DiagCaseUsage objects that matched with (%@, %@, %@, %@)", buf, 0x34u);
    }
  }
  v21 = casemanagementLogHandle();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_ERROR, "DiagnosticCaseUsage is nil.", buf, 2u);
  }
LABEL_16:
}

- (void)_updateDailyCaseStatisticsWith:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 caseOpenedTime];
  double v6 = v5;
  if (v5 >= 100000000.0)
  {
    int v9 = [v4 dampeningType];
    uint64_t v10 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:(double)(86400 * ((unint64_t)v6 / 0x15180))];
    uint64_t v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v6];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v37 = 0x3032000000;
    __int16 v38 = __Block_byref_object_copy_;
    id v39 = __Block_byref_object_dispose_;
    id v40 = 0;
    __int16 v12 = [(DiagnosticStatisticsManager *)self _retrieveDiagnosticCaseUsageForDomain:@"DAILY_AGGREGATE" type:@"DAILY_AGGREGATE" subType:@"DAILY_AGGREGATE" process:@"DAILY_AGGREGATE" onOrAfter:v10 create:0];
    uint64_t v13 = casemanagementLogHandle();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int16 v32 = 134218242;
      uint64_t v33 = [v12 count];
      __int16 v34 = 2112;
      id v35 = v10;
      _os_log_impl(&dword_209DBA000, v13, OS_LOG_TYPE_DEBUG, "Found %ld case usages on or later than %@", v32, 0x16u);
    }

    uint64_t v26 = MEMORY[0x263EF8330];
    uint64_t v27 = 3221225472;
    double v28 = __62__DiagnosticStatisticsManager__updateDailyCaseStatisticsWith___block_invoke;
    uint64_t v29 = &unk_263FC3660;
    double v7 = v10;
    BOOL v30 = v7;
    p_long long buf = &buf;
    [v12 enumerateObjectsUsingBlock:&v26];
    id v14 = *(void **)(*((void *)&buf + 1) + 40);
    if (v14) {
      goto LABEL_10;
    }
    id v15 = casemanagementLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v32 = 138412290;
      uint64_t v33 = (uint64_t)v7;
      _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_DEFAULT, "Creating a new aggregated DiagnosticCaseUsage for cases on GMT date %@.", v32, 0xCu);
    }

    id v16 = [(DiagnosticStatisticsManager *)self _createDiagnosticCaseUsageForDomain:@"DAILY_AGGREGATE", @"DAILY_AGGREGATE", @"DAILY_AGGREGATE", @"DAILY_AGGREGATE", v26, v27, v28, v29 type subType process];
    id v17 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v16;

    id v14 = *(void **)(*((void *)&buf + 1) + 40);
    if (v14)
    {
LABEL_10:
      id v18 = objc_msgSend(v14, "lastSeen", v26, v27, v28, v29);
      int v19 = [*(id *)(*((void *)&buf + 1) + 40) casesSeen];
      [*(id *)(*((void *)&buf + 1) + 40) setCasesSeen:(v19 + 1)];
      [*(id *)(*((void *)&buf + 1) + 40) setLastSeen:v11];
      objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "interarrival_mean");
      if (v19 >= 1)
      {
        double v21 = v20;
        [v11 timeIntervalSinceDate:v18];
        double v23 = v22;
        +[MathUtility computeNewMeanFromValue:currentMean:currentCount:](MathUtility, "computeNewMeanFromValue:currentMean:currentCount:", (v19 - 1));
        objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "setInterarrival_mean:");
        if (v19 >= 2)
        {
          objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "interarrival_var");
          +[MathUtility computeNewVarianceFromValue:(v19 - 1) currentMean:v23 currentCount:v21 currentVariance:v24];
          objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "setInterarrival_var:");
        }
      }
      if (!v9)
      {
        int v25 = [*(id *)(*((void *)&buf + 1) + 40) casesAccepted];
        [*(id *)(*((void *)&buf + 1) + 40) setCasesAccepted:(v25 + 1)];
        [*(id *)(*((void *)&buf + 1) + 40) setLastAccepted:v11];
      }
      [(ObjectAnalytics *)self->_caseUsageSpace save];
    }
    else
    {
      id v18 = casemanagementLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int16 v32 = 138412290;
        uint64_t v33 = (uint64_t)v7;
        _os_log_impl(&dword_209DBA000, v18, OS_LOG_TYPE_DEFAULT, "Aggregated DiagnosticCaseUsage for case on GMT date %@ is nil.", v32, 0xCu);
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    double v7 = casemanagementLogHandle();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      [v4 caseOpenedTime];
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_ERROR, "DiagnosticCase has an invalid timeStamp! (%.0lf)", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __62__DiagnosticStatisticsManager__updateDailyCaseStatisticsWith___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a2;
  uint64_t v8 = (void *)MEMORY[0x263EFF910];
  int v9 = [v7 lastSeen];
  [v9 timeIntervalSince1970];
  unint64_t v11 = (unint64_t)v10;
  __int16 v12 = [v7 lastSeen];
  [v12 timeIntervalSince1970];
  id v14 = [v8 dateWithTimeIntervalSince1970:(double)(v11 + 86400 * ((unint64_t)v13 / 0x15180) - (unint64_t)v13)];

  if ([*(id *)(a1 + 32) isEqualToDate:v14])
  {
    id v15 = casemanagementLogHandle();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = *(void *)(a1 + 32);
      int v17 = 138412290;
      uint64_t v18 = v16;
      _os_log_impl(&dword_209DBA000, v15, OS_LOG_TYPE_INFO, "Found aggregated DiagnosticCaseUsage for cases on GMT date %@.", (uint8_t *)&v17, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_retrieveDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6
{
  return [(DiagnosticStatisticsManager *)self _retrieveDiagnosticCaseUsageForDomain:a3 type:a4 subType:a5 process:a6 onOrAfter:0 create:1];
}

- (id)_retrieveDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6 onOrAfter:(id)a7 create:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if ([v14 length] && objc_msgSend(v15, "length"))
  {
    BOOL v33 = v8;
    id v35 = self;
    uint64_t v19 = (void *)MEMORY[0x263EFF980];
    double v20 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@ AND %K == %@", @"domain", v14, @"type", v15];
    double v21 = objc_msgSend(v19, "arrayWithObjects:", v20, 0);

    if ([v16 length])
    {
      double v22 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"subtype", v16];
      [v21 addObject:v22];
    }
    if ([v17 length])
    {
      double v23 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"process", v17];
      [v21 addObject:v23];
    }
    if (v18)
    {
      double v24 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K >= %@", @"lastSeen", v18];
      [v21 addObject:v24];
    }
    id v34 = v18;
    int v25 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v21];
    uint64_t v26 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"lastSeen" ascending:0];
    uint64_t v27 = [(ObjectAnalytics *)v35->_caseUsageSpace fetchEntitiesFreeForm:v25 sortDesc:v26];
    if ([v27 count] || !v33)
    {
      id v31 = v27;
    }
    else
    {
      double v28 = casemanagementLogHandle();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138413058;
        id v37 = v14;
        __int16 v38 = 2112;
        id v39 = v15;
        __int16 v40 = 2112;
        id v41 = v16;
        __int16 v42 = 2112;
        id v43 = v17;
        _os_log_impl(&dword_209DBA000, v28, OS_LOG_TYPE_INFO, "Creating a new DiagnosticCaseUsage with domain %@, type %@, subtype %@, process %@.", buf, 0x2Au);
      }

      uint64_t v29 = (void *)MEMORY[0x263EFF8C0];
      id v30 = [(DiagnosticStatisticsManager *)v35 _createDiagnosticCaseUsageForDomain:v14 type:v15 subType:v16 process:v17];
      id v31 = [v29 arrayWithObject:v30];
    }
    id v18 = v34;
  }
  else
  {
    double v21 = casemanagementLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_ERROR, "Domain and Type are required", buf, 2u);
    }
    id v31 = 0;
  }

  return v31;
}

- (id)_createDiagnosticCaseUsageForDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [(ObjectAnalytics *)self->_caseUsageSpace createEntity];
  id v15 = v14;
  if (v14)
  {
    [v14 setDomain:v10];
    [v15 setType:v11];
    [v15 setSubtype:v12];
    [v15 setProcess:v13];
  }

  return v15;
}

- (double)_calculateAverageCasesPerDayFromDailyAggregatedStatistics
{
  id v3 = [MEMORY[0x263EFF910] date];
  [v3 timeIntervalSince1970];
  unint64_t v5 = (unint64_t)v4;
  [v3 timeIntervalSince1970];
  double v7 = (double)(v5 + 86400 * ((unint64_t)v6 / 0x15180) - (unint64_t)v6);
  BOOL v8 = [(DiagnosticStatisticsManager *)self _retrieveDiagnosticCaseUsageForDomain:@"DAILY_AGGREGATE" type:@"DAILY_AGGREGATE" subType:@"DAILY_AGGREGATE" process:@"DAILY_AGGREGATE" onOrAfter:0 create:0];
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__DiagnosticStatisticsManager__calculateAverageCasesPerDayFromDailyAggregatedStatistics__block_invoke;
  v12[3] = &unk_263FC3688;
  *(double *)&v12[6] = v7;
  v12[4] = &v17;
  v12[5] = &v13;
  [v8 enumerateObjectsUsingBlock:v12];
  uint64_t v9 = v14[3];
  if (v9 < 1) {
    double v10 = 0.0;
  }
  else {
    double v10 = (double)v18[3] / (double)v9;
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __88__DiagnosticStatisticsManager__calculateAverageCasesPerDayFromDailyAggregatedStatistics__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a2;
  double v4 = [v3 lastSeen];
  [v4 timeIntervalSince1970];
  unint64_t v6 = (unint64_t)v5;
  double v7 = [v3 lastSeen];
  [v7 timeIntervalSince1970];
  double v9 = (double)(v6 + 86400 * ((unint64_t)v8 / 0x15180) - (unint64_t)v8);

  if (*(double *)(a1 + 48) != v9)
  {
    double v10 = casemanagementLogHandle();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [MEMORY[0x263EFF910] dateWithTimeIntervalSince1970:v9];
      int v12 = 138412546;
      uint64_t v13 = v11;
      __int16 v14 = 1024;
      int v15 = [v3 casesSeen];
      _os_log_impl(&dword_209DBA000, v10, OS_LOG_TYPE_DEFAULT, "Daily aggregated case usage on %@ has %d cases", (uint8_t *)&v12, 0x12u);
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += (int)[v3 casesSeen];
    ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
}

- (int64_t)_removeDiagnosticCaseUsageMatchingDomain:(id)a3 type:(id)a4 subType:(id)a5 process:(id)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x263EFF980];
  __int16 v14 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"domain", a3];
  int v15 = [v13 arrayWithObject:v14];

  if ([v10 length])
  {
    uint64_t v16 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"type", v10];
    [v15 addObject:v16];
  }
  if ([v11 length])
  {
    uint64_t v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"subtype", v11];
    [v15 addObject:v17];
  }
  if ([v12 length])
  {
    id v18 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K == %@", @"process", v12];
    [v15 addObject:v18];
  }
  uint64_t v19 = [MEMORY[0x263F08730] andPredicateWithSubpredicates:v15];
  int64_t v20 = [(ObjectAnalytics *)self->_caseUsageSpace removeEntitiesMatching:v19];
  if (v20)
  {
    double v21 = casemanagementLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      int64_t v24 = v20;
      _os_log_impl(&dword_209DBA000, v21, OS_LOG_TYPE_INFO, "Removed %ld DiagnosticCaseUsage.", buf, 0xCu);
    }
  }
  return v20;
}

- (int64_t)_removeAllDiagnosticCaseUsageFor:(id)a3
{
  return [(ObjectAnalytics *)self->_caseUsageSpace removeEntitiesMatching:a3];
}

- (void)resetDiagnosticCaseUsage
{
  id v3 = [(DiagnosticStatisticsManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__DiagnosticStatisticsManager_resetDiagnosticCaseUsage__block_invoke;
  block[3] = &unk_263FC2DC0;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __55__DiagnosticStatisticsManager_resetDiagnosticCaseUsage__block_invoke(uint64_t a1)
{
  v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Resetting DiagnosticCaseUsage", v4, 2u);
  }

  return [*(id *)(a1 + 32) _removeAllDiagnosticCaseUsageFor:0];
}

- (void)cleanupDiagnosticCaseUsage
{
  id v3 = [(DiagnosticStatisticsManager *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__DiagnosticStatisticsManager_cleanupDiagnosticCaseUsage__block_invoke;
  block[3] = &unk_263FC2DC0;
  block[4] = self;
  dispatch_async(v3, block);
}

void __57__DiagnosticStatisticsManager_cleanupDiagnosticCaseUsage__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = casemanagementLogHandle();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_209DBA000, v2, OS_LOG_TYPE_INFO, "Purging old DiagnosticCaseUsage objects.", buf, 2u);
  }

  id v3 = [MEMORY[0x263EFF910] date];
  double v4 = [v3 dateByAddingTimeInterval:-1209600.0];

  double v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K <= %@", @"lastSeen", v4];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 24) removeEntitiesMatching:v5];
  double v7 = casemanagementLogHandle();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134218240;
    uint64_t v9 = v6;
    __int16 v10 = 1024;
    int v11 = 14;
    _os_log_impl(&dword_209DBA000, v7, OS_LOG_TYPE_INFO, "Purged %ld DiagnosticCaseUsage object(s) with lastSeen older than %d days.", buf, 0x12u);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_caseUsageSpace, 0);
  objc_storeStrong((id *)&self->_workspace, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end