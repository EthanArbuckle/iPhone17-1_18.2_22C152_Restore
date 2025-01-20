@interface __NSURLSessionStatistics
+ (CFNetworkTaskMetrics_s)createCFNetworkTaskMetrics_s:(id)a3;
+ (void)reportMetricsToSymptoms:(id)a3;
- (NSArray)connectionUUIDS;
- (NSArray)externallyVisibleConnectionUUIDs;
- (NSMutableDictionary)dictionaryReport;
- (NSUUID)externallyVisibleNwActivity;
- (NSUUID)nwActivity;
- (NSUUID)taskUUID;
- (__NSURLSessionStatistics)initWithCFNetworkReport:(void *)a3 length:(int64_t)a4;
- (__NSURLSessionStatistics)initWithJSONData:(id)a3;
- (void)dealloc;
- (void)setExternallyVisibleConnectionUUIDs:(id)a3;
- (void)setExternallyVisibleNwActivity:(id)a3;
@end

@implementation __NSURLSessionStatistics

+ (void)reportMetricsToSymptoms:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_msgSend(v3, "_private_nw_activity");
  if (v4
    && (objc_msgSend(v3, "_private_nw_activity"),
        v5 = objc_claimAutoreleasedReturnValue(),
        int is_selected_for_reporting = nw_activity_is_selected_for_reporting(),
        v5,
        v4,
        is_selected_for_reporting))
  {
    v7 = +[__NSURLSessionStatistics createCFNetworkTaskMetrics_s:v3];
    if (v7)
    {
      if (CFNLog::onceToken != -1) {
        dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
      }
      v8 = (id)CFNLog::logger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        unint64_t var7 = v7->var7;
        LODWORD(v41) = 134217984;
        *(void *)((char *)&v41 + 4) = var7;
        _os_log_debug_impl(&dword_184085000, v8, OS_LOG_TYPE_DEBUG, "[Telemetry]: Calling symptoms. The number of transactions are %llu", (uint8_t *)&v41, 0xCu);
      }

      uint64_t v9 = 120 * v7->var7 + 104;
      double Helper_x8__symptom_framework_init = gotLoadHelper_x8__symptom_framework_init(v10);
      uint64_t v13 = *(void *)(v12 + 3312);
      BOOL v14 = v14 || v13 == 0;
      if (!v14)
      {
        if (getSymptomHandle(void)::sInitSymptomFramework != -1) {
          dispatch_once(&getSymptomHandle(void)::sInitSymptomFramework, &__block_literal_global_21042);
        }
        symptom_new_delayInitStub(Helper_x8__symptom_framework_init);
        symptom_set_qualifier_delayInitStub(v15);
        symptom_set_additional_qualifier_delayInitStub(v16);
        if (os_variant_has_internal_diagnostics()
          && nw_activity_should_write_metric_stream_to_log())
        {
          v18 = [[__NSURLSessionStatistics alloc] initWithCFNetworkReport:v7 length:v9];
          v19 = [(__NSURLSessionStatistics *)v18 dictionaryReport];
          if (v19)
          {
            __CFNPopulateTransactionMetrics(v7, v19);
            *(void *)&long long v41 = MEMORY[0x1E4F143A8];
            *((void *)&v41 + 1) = 3221225472;
            v42 = ___Z28__CFNReportMetricsToSymptomsPvm_block_invoke;
            v43 = &unk_1E5258228;
            v44 = v19;
            dispatch_async((dispatch_queue_t)logQueue, &v41);
          }
        }
        else
        {
          symptom_send_delayInitStub(v17);
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }
  v20 = objc_msgSend(v3, "_private_nw_activity");
  v21 = objc_msgSend(v3, "_nw_activity");
  BOOL v22 = v20 == v21;

  if (!v22)
  {
    v23 = objc_msgSend(v3, "_private_nw_activity");
    BOOL v24 = v23 == 0;

    if (!v24)
    {
      v25 = objc_msgSend(v3, "_private_nw_activity");
      v26 = [v3 error];
      nw_activity_complete_with_reason();
    }
  }
  self;
  if (os_variant_has_internal_diagnostics())
  {
    if (nw_settings_networkscore_metrics_enabled())
    {
      if (v7
        || (v7 = +[__NSURLSessionStatistics createCFNetworkTaskMetrics_s:v3]) != 0)
      {
        v27 = objc_msgSend(v3, "_private_nw_activity");
        BOOL v28 = v27 == 0;

        if (!v28)
        {
          v29 = objc_msgSend(v3, "_private_nw_activity");
          uint64_t domain = nw_activity_get_domain();
          uint64_t label = nw_activity_get_label();
          unint64_t v32 = v7->var7;
          v33 = [v3 _effectiveConfiguration];
          v34 = [v33 _sourceApplicationBundleIdentifier];

          if (setupNetworkScoreReporting(void)::sInitNetworkScoreReporting != -1) {
            dispatch_once(&setupNetworkScoreReporting(void)::sInitNetworkScoreReporting, &__block_literal_global_50_21073);
          }
          uint64_t v35 = setupNetworkScoreReporting(void)::networkScoreReporting;
          if (setupNetworkScoreReporting(void)::networkScoreReporting)
          {
            if (!v34)
            {
              if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier")) {
                v34 = (__CFString *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
              }
              else {
                v34 = @"Not Available";
              }
            }
            uint32_t networkscore_sampling_rate_denominator = nw_settings_get_networkscore_sampling_rate_denominator();
            if (!arc4random_uniform(networkscore_sampling_rate_denominator))
            {
              if (120 * v32 == -104)
              {
                if (CFNLog::onceToken != -1) {
                  dispatch_once(&CFNLog::onceToken, &__block_literal_global_2_5509);
                }
                v39 = CFNLog::logger;
                if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
                {
                  LOWORD(v41) = 0;
                  _os_log_debug_impl(&dword_184085000, v39, OS_LOG_TYPE_DEBUG, "[NETWORKSCORE] return because the report is empty", (uint8_t *)&v41, 2u);
                }
              }
              else
              {
                v37 = [[__NSURLSessionStatistics alloc] initWithCFNetworkReport:v7 length:120 * v32 + 104];
                v38 = [(__NSURLSessionStatistics *)v37 dictionaryReport];
                if (v38)
                {
                  __CFNPopulateTransactionMetrics(v7, v38);
                  -[NSMutableDictionary setValue:forKey:](v38, "setValue:forKey:", [NSNumber numberWithInt:domain], @"activityDomain");
                  -[NSMutableDictionary setValue:forKey:](v38, "setValue:forKey:", [NSNumber numberWithInt:label], @"activityLabel");
                  *(void *)&long long v41 = MEMORY[0x1E4F143A8];
                  *((void *)&v41 + 1) = 3221225472;
                  v42 = ___Z30__CFNReportNetworkScoreMetricsPvmPK10__CFStringjj_block_invoke;
                  v43 = &unk_1E52582F0;
                  v44 = v38;
                  v45 = v34;
                  uint64_t v46 = v35;
                  dispatch_async((dispatch_queue_t)logQueue, &v41);
                }
              }
            }
          }
        }
      }
    }
  }
  free(v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externallyVisibleConnectionUUIDs, 0);
  objc_storeStrong((id *)&self->_externallyVisibleNwActivity, 0);

  objc_storeStrong((id *)&self->_dictionaryReport, 0);
}

- (void)setExternallyVisibleConnectionUUIDs:(id)a3
{
}

- (NSArray)externallyVisibleConnectionUUIDs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setExternallyVisibleNwActivity:(id)a3
{
}

- (NSUUID)externallyVisibleNwActivity
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)dictionaryReport
{
  dictionaryReport = self->_dictionaryReport;
  if (!dictionaryReport)
  {
    if (!self->report)
    {
      v18 = 0;
      goto LABEL_64;
    }
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    report = (unsigned int *)self->report;
    unint64_t v81 = *(void *)report;
    v5 = [(__NSURLSessionStatistics *)self externallyVisibleNwActivity];
    v6 = [v5 UUIDString];
    [(NSMutableDictionary *)v4 setObject:v6 forKeyedSubscript:@"activityUUID"];

    unint64_t v7 = *((void *)report + 1);
    if (v7 < v81 || v7 == 0) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = v7 - v81;
    }
    double v10 = [NSNumber numberWithUnsignedLongLong:v9];
    [(NSMutableDictionary *)v4 setObject:v10 forKeyedSubscript:@"didCompleteWithError"];

    v11 = [NSNumber numberWithUnsignedLongLong:*((void *)report + 2)];
    [(NSMutableDictionary *)v4 setObject:v11 forKeyedSubscript:@"numberOfRetries"];

    uint64_t v12 = [NSNumber numberWithUnsignedLongLong:*((void *)report + 6)];
    [(NSMutableDictionary *)v4 setObject:v12 forKeyedSubscript:@"numberOfRedirects"];

    uint64_t v13 = [NSNumber numberWithLongLong:*((void *)report + 3)];
    [(NSMutableDictionary *)v4 setObject:v13 forKeyedSubscript:@"error"];

    BOOL v14 = [NSNumber numberWithLongLong:*((void *)report + 4)];
    [(NSMutableDictionary *)v4 setObject:v14 forKeyedSubscript:@"underlyingError"];

    double v15 = [NSNumber numberWithLongLong:*((void *)report + 5)];
    [(NSMutableDictionary *)v4 setObject:v15 forKeyedSubscript:@"underlyingErrorDomain"];

    unsigned int v16 = report[24] - 1;
    if (v16 >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", report[24]);
      double v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      double v17 = off_1E5255738[v16];
    }
    [(NSMutableDictionary *)v4 setObject:v17 forKeyedSubscript:@"taskType"];

    v19 = [NSNumber numberWithBool:*((unsigned __int8 *)report + 100)];
    [(NSMutableDictionary *)v4 setObject:v19 forKeyedSubscript:@"isBackground"];

    v20 = [NSNumber numberWithBool:*((unsigned __int8 *)report + 101)];
    [(NSMutableDictionary *)v4 setObject:v20 forKeyedSubscript:@"usedUnifiedStack"];

    v21 = [NSNumber numberWithBool:*((unsigned __int8 *)report + 102)];
    [(NSMutableDictionary *)v4 setObject:v21 forKeyedSubscript:@"apSleepWakeMonitored"];

    BOOL v22 = [NSNumber numberWithBool:*((unsigned __int8 *)report + 103)];
    [(NSMutableDictionary *)v4 setObject:v22 forKeyedSubscript:@"resumableUploadSupported"];

    if (*((void *)report + 7))
    {
      unint64_t v23 = *((void *)report + 22) - 1;
      if (v23 >= 5)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", *((void *)report + 22));
        BOOL v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v24 = off_1E5255768[v23];
      }
      [(NSMutableDictionary *)v4 setObject:v24 forKeyedSubscript:@"schedulingTier"];
    }
    v66 = v4;
    v67 = self;
    id v68 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (*((void *)report + 7))
    {
      unint64_t v80 = 0;
      v25 = report + 55;
      do
      {
        id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        unint64_t v27 = *(void *)(v25 - 29);
        unint64_t v28 = *(void *)(v25 - 27);
        unint64_t v29 = *(void *)(v25 - 25);
        unint64_t v30 = *(void *)(v25 - 23);
        uint64_t v78 = *(void *)(v25 - 19);
        uint64_t v79 = *(void *)(v25 - 21);
        unint64_t v31 = *(void *)(v25 - 13);
        uint64_t v32 = *(v25 - 7);
        char v33 = *((unsigned char *)v25 - 24);
        char v34 = *((unsigned char *)v25 - 23);
        char v76 = *((unsigned char *)v25 - 21);
        char v77 = *((unsigned char *)v25 - 22);
        uint64_t v74 = *(void *)(v25 - 5);
        uint64_t v75 = *(void *)(v25 - 9);
        uint64_t v73 = *(void *)(v25 - 3);
        char v72 = *((unsigned char *)v25 - 4);
        uint64_t v71 = *((unsigned __int8 *)v25 - 3);
        unsigned int v70 = *v25;
        if ((v32 - 1) >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v32);
          uint64_t v35 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          uint64_t v35 = off_1E5255790[(v32 - 1)];
        }
        [v26 setObject:v35 forKeyedSubscript:@"networkProtocolName"];

        if (v31 >= 4)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", v31);
          v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = off_1E52557B8[v31];
        }
        [v26 setObject:v36 forKeyedSubscript:@"networkLoadType"];

        v37 = [NSNumber numberWithBool:v33 & 1];
        [v26 setObject:v37 forKeyedSubscript:@"reusedConnection"];

        v38 = [NSNumber numberWithBool:v34 & 1];
        [v26 setObject:v38 forKeyedSubscript:@"isRedirected"];

        if (v27 < v81 || v27 == 0) {
          uint64_t v40 = 0;
        }
        else {
          uint64_t v40 = v27 - v81;
        }
        long long v41 = [NSNumber numberWithUnsignedLongLong:v40];
        [v26 setObject:v41 forKeyedSubscript:@"requestStart"];

        if (v28 < v81 || v28 == 0) {
          uint64_t v43 = 0;
        }
        else {
          uint64_t v43 = v28 - v81;
        }
        v44 = [NSNumber numberWithUnsignedLongLong:v43];
        [v26 setObject:v44 forKeyedSubscript:@"requestEnd"];

        if (v29 < v81 || v29 == 0) {
          uint64_t v46 = 0;
        }
        else {
          uint64_t v46 = v29 - v81;
        }
        uint64_t v47 = [NSNumber numberWithUnsignedLongLong:v46];
        [v26 setObject:v47 forKeyedSubscript:@"responseStart"];

        if (v30 < v81 || v30 == 0) {
          uint64_t v49 = 0;
        }
        else {
          uint64_t v49 = v30 - v81;
        }
        v50 = [NSNumber numberWithUnsignedLongLong:v49];
        [v26 setObject:v50 forKeyedSubscript:@"responseEnd"];

        v51 = [NSNumber numberWithUnsignedLongLong:v79];
        [v26 setObject:v51 forKeyedSubscript:@"totalBytesWritten"];

        v52 = [NSNumber numberWithUnsignedLongLong:v78];
        [v26 setObject:v52 forKeyedSubscript:@"totalBytesRead"];

        v53 = [(__NSURLSessionStatistics *)v67 externallyVisibleConnectionUUIDs];
        v54 = [v53 objectAtIndexedSubscript:v80];

        if (v54)
        {
          v55 = [v54 UUIDString];
          [v26 setObject:v55 forKeyedSubscript:@"connectionUUID"];
        }
        v56 = [NSNumber numberWithBool:v77 & 1];
        [v26 setObject:v56 forKeyedSubscript:@"apsRelayAttempted"];

        v57 = [NSNumber numberWithBool:v76 & 1];
        [v26 setObject:v57 forKeyedSubscript:@"apsRelaySucceeded"];

        if ((unint64_t)(v75 - 1) >= 5)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", v75);
          v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v58 = off_1E52557D8[v75 - 1];
        }
        [v26 setObject:v58 forKeyedSubscript:@"http3Status"];

        if ((unint64_t)(v74 - 1) >= 0xD)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", v74);
          v59 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v59 = off_1E5255800[v74 - 1];
        }
        [v26 setObject:v59 forKeyedSubscript:@"httpServerType"];

        v60 = [NSNumber numberWithUnsignedLongLong:v73];
        [v26 setObject:v60 forKeyedSubscript:@"reusedAfterTime"];

        v61 = [NSNumber numberWithBool:v72 & 1];
        [v26 setObject:v61 forKeyedSubscript:@"reusedAfterSleepWake"];

        if (v71 >= 0xB)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %ld)", v71);
          v62 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v62 = off_1E5255868[v71];
        }
        [v26 setObject:v62 forKeyedSubscript:@"httpMethod"];

        v63 = [NSNumber numberWithInt:v70];
        [v26 setObject:v63 forKeyedSubscript:@"statusCode"];

        [v68 addObject:v26];
        v25 += 30;
        ++v80;
      }
      while (*((void *)report + 7) > v80);
    }
    [(NSMutableDictionary *)v66 setObject:v68 forKeyedSubscript:@"transactionMetrics"];
    v64 = v67->_dictionaryReport;
    v67->_dictionaryReport = v66;

    dictionaryReport = v67->_dictionaryReport;
  }
  v18 = dictionaryReport;
LABEL_64:

  return v18;
}

- (NSArray)connectionUUIDS
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  report = self->report;
  if (report[7])
  {
    unint64_t v5 = 0;
    v6 = (char *)(report + 19);
    do
    {
      unint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:v6];
      [v3 addObject:v7];

      ++v5;
      v6 += 120;
    }
    while (report[7] > v5);
  }

  return (NSArray *)v3;
}

- (NSUUID)taskUUID
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:(char *)self->report + 80];

  return (NSUUID *)v2;
}

- (NSUUID)nwActivity
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:(char *)self->report + 64];

  return (NSUUID *)v2;
}

- (void)dealloc
{
  free(self->report);
  v3.receiver = self;
  v3.super_class = (Class)__NSURLSessionStatistics;
  [(__NSURLSessionStatistics *)&v3 dealloc];
}

- (__NSURLSessionStatistics)initWithJSONData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)__NSURLSessionStatistics;
  unint64_t v5 = [(__NSURLSessionStatistics *)&v12 init];
  v6 = v5;
  if (v4 && v5 && [v4 length])
  {
    id v11 = 0;
    uint64_t v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:0 error:&v11];
    id v8 = v11;
    dictionaryReport = v6->_dictionaryReport;
    v6->_dictionaryReport = (NSMutableDictionary *)v7;
  }
  return v6;
}

- (__NSURLSessionStatistics)initWithCFNetworkReport:(void *)a3 length:(int64_t)a4
{
  if ((unint64_t)a4 >= 0x68
    && 120 * *((void *)a3 + 7) + 104 == a4
    && (uint64_t v7 = malloc_type_malloc(a4, 0x740AC3FFuLL), (self->report = v7) != 0))
  {
    memcpy(v7, a3, a4);
    id v8 = self;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (CFNetworkTaskMetrics_s)createCFNetworkTaskMetrics_s:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 _metrics];
  uint64_t v76 = 0;
  char v77 = &v76;
  uint64_t v78 = 0x3032000000;
  uint64_t v79 = __Block_byref_object_copy__11303;
  unint64_t v80 = __Block_byref_object_dispose__11304;
  id v81 = 0;
  v73[0] = MEMORY[0x1E4F143A8];
  v73[1] = 3221225472;
  v73[2] = __57____NSURLSessionStatistics_createCFNetworkTaskMetrics_s___block_invoke;
  v73[3] = &unk_1E5255FB0;
  id v5 = v3;
  id v74 = v5;
  uint64_t v75 = &v76;
  -[__CFN_TaskMetrics lockTransactionMetrics:](v4, v73);
  char v72 = (void *)v4;
  v6 = (CFNetworkTaskMetrics_s *)malloc_type_calloc(1uLL, 120 * [(id)v77[5] count] + 104, 0xFABE8F92uLL);
  uint64_t v71 = v5;
  if (v6)
  {
    uint64_t v7 = [v5 _uniqueIdentifier];
    [v7 getUUIDBytes:v6->var9];

    if (v4)
    {
      v6->var0 = (unint64_t)(*(double *)(v4 + 56) * 1000.0);
      double v8 = *(double *)(v4 + 64);
    }
    else
    {
      v6->var0 = 0;
      double v8 = 0.0;
    }
    v6->var1 = (unint64_t)(v8 * 1000.0);
    id v9 = v5;
    self;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v10 = 3;
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v10 = 2;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v10 = 4;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            int v10 = 5;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              int v10 = 6;
            }
            else {
              int v10 = 1;
            }
          }
        }
      }
    }

    v6->var10 = v10;
    uint64_t v11 = [v9 session];
    objc_super v12 = (void *)v11;
    if (v11) {
      BOOL v13 = CFEqual((CFTypeRef)[*(id *)(v11 + 112) disposition], &unk_1EC0A58A8) != 0;
    }
    else {
      BOOL v13 = 0;
    }
    v6->var11 = v13;

    v6->var12 = 0;
    uint64_t v14 = [v9 session];
    double v15 = (void *)v14;
    if (v14) {
      char v16 = [*(id *)(v14 + 112) _disableAPWakeOnIdleConnections];
    }
    else {
      char v16 = 0;
    }
    v6->var13 = v16;

    if (v4) {
      BOOL v17 = *(unsigned char *)(v4 + 12) != 0;
    }
    else {
      BOOL v17 = 0;
    }
    v6->var14 = v17;
    v18 = objc_msgSend(v9, "_private_nw_activity", v3);

    if (v18)
    {
      v19 = objc_msgSend(v9, "_private_nw_activity");
      nw_activity_get_token();
    }
    v6->unint64_t var7 = [(id)v77[5] count];
    v20 = [v9 error];

    if (v20)
    {
      v21 = [v9 error];
      v6->var3 = [v21 code];

      BOOL v22 = [v9 error];
      unint64_t v23 = [v22 userInfo];
      BOOL v24 = [v23 objectForKeyedSubscript:@"_kCFStreamErrorCodeKey"];
      v6->var4 = [v24 integerValue];

      v25 = [v9 error];
      id v26 = [v25 userInfo];
      unint64_t v27 = [v26 objectForKeyedSubscript:@"_kCFStreamErrorDomainKey"];
      v6->var5 = [v27 integerValue];
    }
    unint64_t v28 = 0;
    for (i = &v6->var15[0].var1; [(id)v77[5] count] > v28; i += 15)
    {
      id v30 = [(id)v77[5] objectAtIndexedSubscript:v28];
      self;
      if (v30)
      {
        id Property = objc_getProperty(v30, v31, 88, 1);
        char v34 = Property;
        if (Property) {
          id Property = objc_getProperty(Property, v33, 160, 1);
        }
      }
      else
      {
        char v34 = 0;
        id Property = 0;
      }
      id v35 = Property;
      self;
      if (v35)
      {
        if ([v35 isEqualToString:@"http/1.1"])
        {
          int v36 = 3;
        }
        else if ([v35 isEqualToString:@"h2"])
        {
          int v36 = 4;
        }
        else if ([v35 isEqualToString:@"h3"])
        {
          int v36 = 5;
        }
        else
        {
          int v36 = 1;
        }
      }
      else
      {
        int v36 = 1;
      }

      *((_DWORD *)i + 20) = v36;
      if (v30)
      {
        if (*((unsigned char *)v30 + 8))
        {
          uint64_t v38 = 1;
          if (*((unsigned char *)v30 + 10)) {
            uint64_t v38 = 2;
          }
          i[7] = v38;
        }
        else
        {
          id v39 = *((id *)v30 + 9);
          uint64_t v40 = 3;
          if (!v39) {
            uint64_t v40 = 0;
          }
          i[7] = v40;
        }
        i[8] = *((void *)v30 + 27);
        double v41 = *((double *)v30 + 22);
        p_var11 = &v6->var15[v28].var11;
        *((unsigned char *)i + 84) = *((unsigned char *)v30 + 9) ^ 1;
        *((unsigned char *)i + 85) = *((void *)v30 + 26) == 2;
        *(i - 1) = (unint64_t)(v41 * 1000.0);
        unint64_t *i = (unint64_t)(*((double *)v30 + 23) * 1000.0);
        i[1] = (unint64_t)(*((double *)v30 + 24) * 1000.0);
        i[2] = (unint64_t)(*((double *)v30 + 25) * 1000.0);
        i[3] = *((void *)v30 + 14) + *((void *)v30 + 12);
        i[4] = *((void *)v30 + 17) + *((void *)v30 + 15);
        *((unsigned char *)i + 86) = *((unsigned char *)v30 + 11);
        *((unsigned char *)i + 87) = *((unsigned char *)v30 + 12);
        uint64_t v43 = objc_getProperty(v30, v37, 88, 1);
        if (v43) {
          unint64_t v44 = v43[16];
        }
        else {
          unint64_t v44 = 0;
        }
        i[9] = v44;

        id v46 = objc_getProperty(v30, v45, 88, 1);
        v48 = v46;
        if (v46) {
          id v46 = objc_getProperty(v46, v47, 64, 1);
        }
      }
      else
      {
        i[7] = 0;
        *((_DWORD *)i + 21) = 1;
        p_var11 = (BOOL *)i + 84;
        i[8] = 0;
        *(_OWORD *)(i - 1) = 0u;
        *(_OWORD *)(i + 1) = 0u;
        *(_OWORD *)(i + 3) = 0u;
        i[9] = 0;
        v48 = 0;
        id v46 = 0;
      }
      id v49 = v46;
      [v49 getUUIDBytes:i + 5];

      if (v30) {
        v50 = (void *)*((void *)v30 + 10);
      }
      else {
        v50 = 0;
      }
      id v51 = v50;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        uint64_t v53 = 1;
        goto LABEL_80;
      }
      v52 = [v51 valueForHTTPHeaderField:@"x-akam-sw-version"];
      if (v52)
      {
        uint64_t v53 = 6;
      }
      else
      {
        v52 = [v51 valueForHTTPHeaderField:@"x-fb-debug"];
        if (!v52)
        {
          v54 = [v51 valueForHTTPHeaderField:@"via"];
          v52 = v54;
          if (v54 && [v54 rangeOfString:@"CloudFront" options:1] != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v53 = 5;
            goto LABEL_79;
          }
          v55 = [v51 valueForHTTPHeaderField:@"server"];
          v56 = v55;
          if (v55)
          {
            if ([v55 rangeOfString:@"gws" options:1] == 0x7FFFFFFFFFFFFFFFLL
              && [v56 rangeOfString:@"GSE" options:1] == 0x7FFFFFFFFFFFFFFFLL
              && [v56 rangeOfString:@"ESF" options:1] == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ([v56 rangeOfString:@"cloudflare" options:1] == 0x7FFFFFFFFFFFFFFFLL)
              {
                if ([v56 rangeOfString:@"ApacheTrafficServer" options:1] == 0x7FFFFFFFFFFFFFFFLL
                  && [v56 rangeOfString:@"ATS" options:1] == 0x7FFFFFFFFFFFFFFFLL)
                {
                  if ([v56 rangeOfString:@"apache" options:1] == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if ([v56 rangeOfString:@"nginx" options:1] == 0x7FFFFFFFFFFFFFFFLL)
                    {
                      if ([v56 rangeOfString:@"LiteSpeed" options:1] == 0x7FFFFFFFFFFFFFFFLL)
                      {
                        if ([v56 rangeOfString:@"lighttpd" options:1] == 0x7FFFFFFFFFFFFFFFLL)
                        {
                          if ([v56 rangeOfString:@"nghttpx" options:1] == 0x7FFFFFFFFFFFFFFFLL) {
                            goto LABEL_73;
                          }
                          uint64_t v53 = 12;
                        }
                        else
                        {
                          uint64_t v53 = 11;
                        }
                      }
                      else
                      {
                        uint64_t v53 = 10;
                      }
                    }
                    else
                    {
                      uint64_t v53 = 9;
                    }
                  }
                  else
                  {
                    uint64_t v53 = 8;
                  }
                }
                else
                {
                  uint64_t v53 = 7;
                }
              }
              else
              {
                uint64_t v53 = 4;
              }
            }
            else
            {
              uint64_t v53 = 2;
            }
          }
          else
          {
LABEL_73:
            if (v52 && [v52 rangeOfString:@"varnish" options:1] != 0x7FFFFFFFFFFFFFFFLL) {
              uint64_t v53 = 13;
            }
            else {
              uint64_t v53 = 1;
            }
          }

          goto LABEL_79;
        }
        uint64_t v53 = 3;
      }
LABEL_79:

LABEL_80:
      i[11] = v53;

      if (*p_var11)
      {
        if (v30)
        {
          i[12] = (unint64_t)(*((double *)v30 + 29) * 1000.0);
          v58 = objc_getProperty(v30, v57, 88, 1);
          if (v58)
          {
            BOOL v59 = v58[21] != 0;
            goto LABEL_84;
          }
        }
        else
        {
          i[12] = 0;
          v58 = 0;
        }
        BOOL v59 = 0;
LABEL_84:
        *((unsigned char *)i + 104) = v59;

        if (v30) {
          goto LABEL_85;
        }
        goto LABEL_99;
      }
      i[12] = 0;
      *((unsigned char *)i + 104) = 0;
      if (v30)
      {
LABEL_85:
        v60 = (void *)*((void *)v30 + 7);
        goto LABEL_86;
      }
LABEL_99:
      v60 = 0;
LABEL_86:
      id v61 = v60;
      v62 = [v61 HTTPMethod];
      v63 = v62;
      if (v62)
      {
        if ([v62 caseInsensitiveCompare:@"GET"])
        {
          if ([v63 caseInsensitiveCompare:@"HEAD"])
          {
            if ([v63 caseInsensitiveCompare:@"POST"])
            {
              if ([v63 caseInsensitiveCompare:@"PUT"])
              {
                if ([v63 caseInsensitiveCompare:@"DELETE"])
                {
                  if ([v63 caseInsensitiveCompare:@"CONNECT"])
                  {
                    if ([v63 caseInsensitiveCompare:@"OPTIONS"])
                    {
                      if ([v63 caseInsensitiveCompare:@"TRACE"])
                      {
                        if ([v63 caseInsensitiveCompare:@"PATCH"]) {
                          char v64 = 1;
                        }
                        else {
                          char v64 = 10;
                        }
                      }
                      else
                      {
                        char v64 = 9;
                      }
                    }
                    else
                    {
                      char v64 = 8;
                    }
                  }
                  else
                  {
                    char v64 = 7;
                  }
                }
                else
                {
                  char v64 = 6;
                }
              }
              else
              {
                char v64 = 5;
              }
            }
            else
            {
              char v64 = 4;
            }
          }
          else
          {
            char v64 = 3;
          }
        }
        else
        {
          char v64 = 2;
        }
      }
      else
      {
        char v64 = 0;
      }

      *((unsigned char *)i + 105) = v64;
      if (v30) {
        v65 = (void *)*((void *)v30 + 10);
      }
      else {
        v65 = 0;
      }
      id v66 = v65;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        int v67 = [v66 statusCode];
      }
      else {
        int v67 = 0;
      }

      *((_DWORD *)i + 27) = v67;
      if (v30)
      {
        uint64_t v68 = *((void *)v30 + 26);
        p_var6 = &v6->var6;
        if (v68 != 2)
        {
          if (v68 != 1025) {
            goto LABEL_119;
          }
          p_var6 = &v6->var2;
        }
        ++*p_var6;
      }
LABEL_119:

      ++v28;
    }
  }

  _Block_object_dispose(&v76, 8);
  return v6;
}

@end