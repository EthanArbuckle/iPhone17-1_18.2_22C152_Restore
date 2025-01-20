@interface C2ReportMetrics
+ (BOOL)useCloudTelemetryService;
+ (id)gzipDecode:(id)a3;
+ (id)gzipEncode:(id)a3;
+ (id)metricsForMetricRequestOptions:(id)a3 networkEvent:(id)a4 genericEvent:(id)a5 triggers:(int)a6;
+ (id)requestForMetricRequestOptions:(id)a3 metrics:(id)a4;
+ (void)_c2FormatValueForRTC:(id)a3 keyPrefix:(id)a4 targetDictionary:(id)a5 multipleOperationGroups:(BOOL)a6;
+ (void)_reportWithOptions:(id)a3 networkEvent:(id)a4 genericEvent:(id)a5 triggers:(int)a6 eventName:(id)a7 startTime:(id)a8 endTime:(id)a9 attributes:(id)a10;
+ (void)reportMetricWithOptions:(id)a3 genericMetricType:(int64_t)a4 eventName:(id)a5 startTime:(id)a6 endTime:(id)a7 attributes:(id)a8;
+ (void)reportNetworkEvent:(id)a3 triggers:(int)a4 originalSessionTask:(id)a5;
- (BOOL)ignoreRequestThrottle;
- (C2MetricOptions)metricOptions;
- (C2ReportMetrics)initWithMetricRequest:(id)a3 metricRequestOptions:(id)a4 ignoreRequestThrottle:(BOOL)a5 requestThrottleIdentifier:(id)a6 requestThrottleLimit:(unint64_t)a7;
- (C2RequestOptions)metricsTransportRequestOptions;
- (NSMutableURLRequest)metricRequest;
- (NSString)requestThrottleIdentifier;
- (NSURLSessionTask)metricTask;
- (id)testBehavior_didCompleteWithError;
- (id)testBehavior_tooManyTasksRunning;
- (unint64_t)requestThrottleLimit;
- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)send;
- (void)setIgnoreRequestThrottle:(BOOL)a3;
- (void)setMetricOptions:(id)a3;
- (void)setMetricRequest:(id)a3;
- (void)setMetricTask:(id)a3;
- (void)setMetricsTransportRequestOptions:(id)a3;
- (void)setRequestThrottleIdentifier:(id)a3;
- (void)setRequestThrottleLimit:(unint64_t)a3;
- (void)setTestBehavior_didCompleteWithError:(id)a3;
- (void)setTestBehavior_tooManyTasksRunning:(id)a3;
@end

@implementation C2ReportMetrics

+ (id)metricsForMetricRequestOptions:(id)a3 networkEvent:(id)a4 genericEvent:(id)a5 triggers:(int)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v9 metricOptions];
  if (!v12)
  {
    v19 = 0;
    goto LABEL_19;
  }
  v13 = +[C2Metric generateDeviceInfo];
  if (v13)
  {
    v14 = [v12 generateCloudKitInfo];
    if (!v14)
    {
      v19 = 0;
LABEL_17:

      goto LABEL_18;
    }
    v15 = objc_alloc_init(C2MPMetric);
    v16 = v15;
    if (v15)
    {
      [(C2MPMetric *)v15 setDeviceInfo:v13];
      [(C2MPMetric *)v16 setCloudkitInfo:v14];
      [(C2MPMetric *)v16 setTriggers:a6];
      -[C2MPMetric setReportFrequency:](v16, "setReportFrequency:", [v12 reportFrequency]);
      -[C2MPMetric setReportFrequencyBase:](v16, "setReportFrequencyBase:", [v12 reportFrequencyBase]);
      -[C2MPMetric setReportTransportAllowExpensiveAccess:](v16, "setReportTransportAllowExpensiveAccess:", [v9 _allowsExpensiveAccess] != 0);
      -[C2MPMetric setReportTransportAllowPowerNapScheduling:](v16, "setReportTransportAllowPowerNapScheduling:", [v9 _allowsPowerNapScheduling] != 0);
      v17 = [v9 _sourceApplicationBundleIdentifier];
      [(C2MPMetric *)v16 setReportTransportSourceApplicationBundleIdentifier:v17];

      v18 = [v9 _sourceApplicationSecondaryIdentifier];
      [(C2MPMetric *)v16 setReportTransportSourceApplicationSecondaryIdentifier:v18];

      if (v10 || !v11)
      {
        v19 = 0;
        if (!v10 || v11) {
          goto LABEL_16;
        }
        [(C2MPMetric *)v16 setMetricType:200];
        [(C2MPMetric *)v16 setNetworkEvent:v10];
      }
      else
      {
        [(C2MPMetric *)v16 setMetricType:201];
        [(C2MPMetric *)v16 setGenericEvent:v11];
      }
      v20 = [(C2MPMetric *)v16 deviceInfo];
      [v20 setProcessUuid:0];

      v21 = [(C2MPMetric *)v16 cloudkitInfo];
      [v21 setContainerScopedDeviceIdentifier:0];

      v22 = [(C2MPMetric *)v16 cloudkitInfo];
      [v22 setContainerScopedUserIdentifier:0];

      v23 = [(C2MPMetric *)v16 networkEvent];
      [v23 setNetworkConnectionUuid:0];

      v19 = v16;
    }
    else
    {
      v19 = 0;
    }
LABEL_16:

    goto LABEL_17;
  }
  v19 = 0;
LABEL_18:

LABEL_19:
  return v19;
}

+ (void)_reportWithOptions:(id)a3 networkEvent:(id)a4 genericEvent:(id)a5 triggers:(int)a6 eventName:(id)a7 startTime:(id)a8 endTime:(id)a9 attributes:(id)a10
{
  uint64_t v12 = *(void *)&a6;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v98 = a7;
  id v101 = a8;
  id v100 = a9;
  id v99 = a10;
  v103 = v18;
  v104 = v17;
  int v102 = v12;
  v19 = +[C2ReportMetrics metricsForMetricRequestOptions:v16 networkEvent:v17 genericEvent:v18 triggers:v12];
  v20 = v19;
  if (v19)
  {
    v21 = [v19 cloudkitInfo];
    unint64_t v22 = [v21 operationGroupsCount];

    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v24 = [v20 metricType];
    if (v24)
    {
      if (v24 == 201)
      {
        v25 = @"generic_event_type";
      }
      else if (v24 == 200)
      {
        v25 = @"network_event_type";
      }
      else
      {
        objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v24);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v25 = @"none_type";
    }
    [v23 setObject:v25 forKeyedSubscript:@"metric_type"];

    if ([v20 metricType] == 200)
    {
      v26 = [v20 networkEvent];
      v27 = [v26 dictionaryRepresentation];
      [a1 _c2FormatValueForRTC:v27 keyPrefix:@"network_event" targetDictionary:v23 multipleOperationGroups:v22 > 1];

      unsigned __int16 v28 = 1;
LABEL_35:

LABEL_36:
      v46 = [v20 cloudkitInfo];
      v47 = [v46 dictionaryRepresentation];
      [a1 _c2FormatValueForRTC:v47 keyPrefix:@"cloudkit_info" targetDictionary:v23 multipleOperationGroups:v22 > 1];

      v48 = [v20 deviceInfo];
      v49 = [v48 dictionaryRepresentation];
      [a1 _c2FormatValueForRTC:v49 keyPrefix:@"device_info" targetDictionary:v23 multipleOperationGroups:v22 > 1];

      if (v28 == 1)
      {
        v50 = @"Network";
      }
      else
      {
        if (v28 != 2162)
        {
          +[C2ReportMetrics useCloudTelemetryService];
          goto LABEL_44;
        }
        v50 = @"Operation";
      }
      if (+[C2ReportMetrics useCloudTelemetryService])
      {
        getCloudTelemetryReporterClass();
        if (objc_opt_respondsToSelector())
        {
          id CloudTelemetryReporterClass = getCloudTelemetryReporterClass();
          BOOL v52 = [v16 allowsCellularAccess] != 0;
          BOOL v53 = [v16 _allowsExpensiveAccess] != 0;
          v54 = [v16 _sourceApplicationBundleIdentifier];
          [CloudTelemetryReporterClass reportWithTeamID:@"4K9A2JBQ2X" eventType:v50 event:v23 allowCellularAccess:v52 allowExpensiveAccess:v53 bundleID:v54 error:0];
        }
        else
        {
          uint64_t v106 = 0;
          v107 = &v106;
          uint64_t v108 = 0x2050000000;
          v71 = (void *)getCloudTelemetryClass_softClass;
          uint64_t v109 = getCloudTelemetryClass_softClass;
          if (!getCloudTelemetryClass_softClass)
          {
            *(void *)&long long buf = MEMORY[0x1E4F143A8];
            *((void *)&buf + 1) = 3221225472;
            v115 = __getCloudTelemetryClass_block_invoke;
            v116 = &unk_1E6CCBF50;
            v117 = &v106;
            __getCloudTelemetryClass_block_invoke((uint64_t)&buf);
            v71 = (void *)v107[3];
          }
          id v72 = v71;
          _Block_object_dispose(&v106, 8);
          [v72 reportWithTeamID:@"4K9A2JBQ2X" eventName:v50 event:v23 error:0];
        }
LABEL_58:

        goto LABEL_59;
      }
LABEL_44:
      uint64_t v55 = *MEMORY[0x1E4F94660];
      v112[0] = *MEMORY[0x1E4F94658];
      v112[1] = v55;
      v113[0] = &unk_1F38C4EA8;
      v113[1] = &unk_1F38C4EC0;
      uint64_t v56 = *MEMORY[0x1E4F94648];
      v112[2] = *MEMORY[0x1E4F94680];
      v112[3] = v56;
      v113[2] = &unk_1F38C4EC0;
      v113[3] = MEMORY[0x1E4F1CC38];
      v112[4] = *MEMORY[0x1E4F94650];
      uint64_t v57 = [v16 _sourceApplicationBundleIdentifier];
      v58 = (void *)v57;
      v59 = @"com.apple.cloudd";
      if (v57) {
        v59 = (__CFString *)v57;
      }
      v113[4] = v59;
      v60 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v113 forKeys:v112 count:5];

      uint64_t v61 = *MEMORY[0x1E4F94688];
      v111[0] = @"com.apple.C2ReportMetrics";
      uint64_t v62 = *MEMORY[0x1E4F94690];
      v110[0] = v61;
      v110[1] = v62;
      v63 = [v20 cloudkitInfo];
      uint64_t v64 = [v63 container];
      v65 = (void *)v64;
      if (v64) {
        v66 = (__CFString *)v64;
      }
      else {
        v66 = @"com.apple.C2ReportMetrics";
      }
      v111[1] = v66;
      v67 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v111 forKeys:v110 count:2];

      id v105 = 0;
      char v68 = [MEMORY[0x1E4F94620] sendOneMessageWithSessionInfo:v60 userInfo:v67 category:v28 type:0 payload:v23 error:&v105];
      id v69 = v105;
      if ((v68 & 1) == 0)
      {
        if (C2_DEFAULT_LOG_BLOCK != -1) {
          dispatch_once(&C2_DEFAULT_LOG_BLOCK, &__block_literal_global_1);
        }
        v70 = C2_DEFAULT_LOG_INTERNAL;
        if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v69;
          _os_log_impl(&dword_1DD523000, v70, OS_LOG_TYPE_ERROR, "Publishing metric to RTCReporting encountered error: %@", (uint8_t *)&buf, 0xCu);
        }
      }

      goto LABEL_58;
    }
    if ([v20 metricType] != 201)
    {
      unsigned __int16 v28 = 3;
      goto LABEL_36;
    }
    v29 = [v20 genericEvent];
    uint64_t v30 = [v29 type];
    if ((int)v30 > 200)
    {
      if (v30 == 201)
      {
        v31 = @"cloudkit_client";
        goto LABEL_23;
      }
      if (v30 == 301)
      {
        v31 = @"server";
        goto LABEL_23;
      }
    }
    else
    {
      if (!v30)
      {
        v31 = @"none";
        goto LABEL_23;
      }
      if (v30 == 101)
      {
        v31 = @"cloudkit";
LABEL_23:
        [v23 setObject:v31 forKeyedSubscript:@"generic_event_type"];

        id v32 = v98;
        v33 = [v20 genericEvent];
        int v34 = [v33 type];

        if (v34 == 201)
        {
          v35 = NSString;
          v36 = [v20 cloudkitInfo];
          v37 = [v36 container];
          v26 = [v35 stringWithFormat:@"%@:%@", v37, v32];

          __int16 v38 = 6;
        }
        else
        {
          __int16 v38 = 2;
          v26 = v32;
        }
        [v23 setObject:v32 forKeyedSubscript:@"generic_event_name"];
        __int16 v97 = [v26 c2UniformlyDistributedIdentifier];
        if (v101)
        {
          [v23 setObject:v101 forKeyedSubscript:@"generic_event_startTime"];
          v39 = NSNumber;
          [v101 timeIntervalSince1970];
          v40 = objc_msgSend(v39, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:"));
          [v23 setObject:v40 forKeyedSubscript:@"generic_event_startTimestampMS"];
        }
        if (v100)
        {
          [v23 setObject:v100 forKeyedSubscript:@"generic_event_endTime"];
          v41 = NSNumber;
          [v100 timeIntervalSince1970];
          v42 = objc_msgSend(v41, "numberWithUnsignedLongLong:", +[C2Time convertTimeIntervalToServerTime:](C2Time, "convertTimeIntervalToServerTime:"));
          [v23 setObject:v42 forKeyedSubscript:@"generic_event_endTimestampMS"];

          if (v101 != v100 && v101 != 0)
          {
            v44 = NSNumber;
            [v100 timeIntervalSinceDate:v101];
            v45 = objc_msgSend(v44, "numberWithDouble:");
            [v23 setObject:v45 forKeyedSubscript:@"generic_event_durationSeconds"];
          }
        }
        unsigned __int16 v28 = v38 | (16 * v97);
        [a1 _c2FormatValueForRTC:v99 keyPrefix:@"generic_event_key" targetDictionary:v23 multipleOperationGroups:v22 > 1];
        goto LABEL_35;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v30);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
LABEL_59:
  if (v102)
  {
    v73 = +[C2ReportMetrics requestForMetricRequestOptions:v16 metrics:v20];
    v74 = NSString;
    v75 = [v16 metricOptions];
    uint64_t v76 = [v75 container];
    v77 = (void *)v76;
    if (v104)
    {
      v78 = [v74 stringWithFormat:@"NetworkEvent %@ %llu", v76, 100];
      uint64_t v79 = 100;
LABEL_76:

      v87 = [[C2ReportMetrics alloc] initWithMetricRequest:v73 metricRequestOptions:v16 ignoreRequestThrottle:v102 & 1 requestThrottleIdentifier:v78 requestThrottleLimit:v79];
      v88 = [v16 metricOptions];
      v89 = objc_msgSend(v88, "testBehavior_reportMetric");

      if (v89)
      {
        v90 = [v16 metricOptions];
        objc_msgSend(v90, "testBehavior_reportMetric");
        v91 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
        ((void (**)(void, C2ReportMetrics *, void *, void *))v91)[2](v91, v87, v104, v103);
      }
      if (v87)
      {
        [(C2ReportMetrics *)v87 send];
      }
      else
      {
        v92 = [v16 metricOptions];
        v93 = [v92 didCompleteWithError];

        if (v93)
        {
          v94 = [v16 metricOptions];
          v95 = [v94 didCompleteWithError];
          v95[2](v95, 0);
        }
        v96 = [v16 metricOptions];
        [v96 setDidCompleteWithError:0];
      }
      goto LABEL_84;
    }
    uint64_t v84 = [v103 type];
    if ((int)v84 > 200)
    {
      if (v84 == 201)
      {
        v85 = @"cloudkit_client";
        goto LABEL_75;
      }
      if (v84 == 301)
      {
        v85 = @"server";
        goto LABEL_75;
      }
    }
    else
    {
      if (!v84)
      {
        v85 = @"none";
        goto LABEL_75;
      }
      if (v84 == 101)
      {
        v85 = @"cloudkit";
LABEL_75:
        v86 = [v103 name];
        v78 = [v74 stringWithFormat:@"GenericEvent %@ %@ %@ %llu", v77, v85, v86, 5];

        uint64_t v79 = 5;
        goto LABEL_76;
      }
    }
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v84);
    v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_75;
  }
  v80 = [v16 metricOptions];
  v81 = [v80 didCompleteWithError];

  if (v81)
  {
    v82 = [v16 metricOptions];
    v83 = [v82 didCompleteWithError];
    v83[2](v83, 0);
  }
  v73 = [v16 metricOptions];
  [v73 setDidCompleteWithError:0];
LABEL_84:
}

+ (void)_c2FormatValueForRTC:(id)a3 keyPrefix:(id)a4 targetDictionary:(id)a5 multipleOperationGroups:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    unint64_t v13 = 0x1E4F1C000uLL;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __91__C2ReportMetrics__c2FormatValueForRTC_keyPrefix_targetDictionary_multipleOperationGroups___block_invoke;
      v49[3] = &unk_1E6CCBF28;
      BOOL v53 = v6;
      id v50 = v11;
      id v52 = a1;
      id v51 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:v49];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v10;
        id v38 = v14;
        if ([v11 isEqualToString:@"generic_event_metric"])
        {
          id v42 = v11;
          id v43 = a1;
          BOOL v40 = v6;
          id v41 = v12;
          id v37 = v10;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v15 = v14;
          uint64_t v16 = [v15 countByEnumeratingWithState:&v45 objects:v58 count:16];
          if (v16)
          {
            uint64_t v17 = v16;
            uint64_t v18 = *(void *)v46;
            v19 = @"key";
            unint64_t v20 = 0x1E4F29000uLL;
            id v39 = v15;
            do
            {
              uint64_t v21 = 0;
              do
              {
                if (*(void *)v46 != v18) {
                  objc_enumerationMutation(v15);
                }
                unint64_t v22 = *(void **)(*((void *)&v45 + 1) + 8 * v21);
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v23 = v22;
                  uint64_t v24 = [v23 objectForKeyedSubscript:v19];
                  if (v24)
                  {
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      v25 = [v23 objectForKeyedSubscript:@"value"];
                      if (v25)
                      {
                        objc_opt_class();
                        if (objc_opt_isKindOfClass())
                        {
                          uint64_t v56 = v24;
                          uint64_t v57 = v25;
                          [*(id *)(v13 + 2536) dictionaryWithObjects:&v57 forKeys:&v56 count:1];
                          unint64_t v26 = v13;
                          v27 = v19;
                          v29 = unint64_t v28 = v20;
                          [v43 _c2FormatValueForRTC:v29 keyPrefix:v42 targetDictionary:v41 multipleOperationGroups:v40];

                          unint64_t v20 = v28;
                          v19 = v27;
                          unint64_t v13 = v26;
                          id v15 = v39;
                        }
                      }
                    }
                  }
                }
                ++v21;
              }
              while (v17 != v21);
              uint64_t v17 = [v15 countByEnumeratingWithState:&v45 objects:v58 count:16];
            }
            while (v17);
          }

          id v10 = v37;
          id v14 = v38;
          id v12 = v41;
          id v11 = v42;
        }
        else if ([v14 count] == 1)
        {
          uint64_t v30 = [v14 firstObject];
          [a1 _c2FormatValueForRTC:v30 keyPrefix:v11 targetDictionary:v12 multipleOperationGroups:v6];
        }
        else
        {
          uint64_t v31 = [v14 count];
          id v44 = a1;
          if (v31)
          {
            uint64_t v32 = v31;
            for (uint64_t i = 0; i != v32; ++i)
            {
              int v34 = objc_msgSend(NSString, "stringWithFormat:", @"%llu", i);
              v54 = v34;
              v35 = [v14 objectAtIndexedSubscript:i];
              uint64_t v55 = v35;
              v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
              [v44 _c2FormatValueForRTC:v36 keyPrefix:v11 targetDictionary:v12 multipleOperationGroups:v6];

              id v14 = v38;
            }
          }
        }
      }
      else
      {
        [v12 setObject:v10 forKeyedSubscript:v11];
      }
    }
  }
}

void __91__C2ReportMetrics__c2FormatValueForRTC_keyPrefix_targetDictionary_multipleOperationGroups___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (([v8 isEqualToString:@"triggers"] & 1) == 0
    && ([v8 isEqualToString:@"report_frequency"] & 1) == 0
    && ([v8 isEqualToString:@"report_frequency_base"] & 1) == 0
    && ([v8 isEqualToString:@"operation_triggered"] & 1) == 0
    && ([v8 isEqualToString:@"report_client_operation_frequency"] & 1) == 0
    && ([v8 isEqualToString:@"report_client_operation_frequency_base"] & 1) == 0
    && ([v8 isEqualToString:@"operation_group_triggered"] & 1) == 0
    && ([v8 isEqualToString:@"report_operation_group_frequency"] & 1) == 0
    && ([v8 isEqualToString:@"report_operation_group_frequency_base"] & 1) == 0
    && ([v8 isEqualToString:@"report_transport_allow_expensive_access"] & 1) == 0
    && ([v8 isEqualToString:@"report_transport_allow_power_nap_scheduling"] & 1) == 0
    && ([v8 isEqualToString:@"is_apple_internal"] & 1) == 0
    && ([v8 isEqualToString:@"product_build"] & 1) == 0
    && ([v8 isEqualToString:@"product_type"] & 1) == 0
    && ([v8 isEqualToString:@"product_version"] & 1) == 0
    && (*(unsigned char *)(a1 + 56) || ([v8 isEqualToString:@"operation_group_index"] & 1) == 0))
  {
    if (*(void *)(a1 + 32))
    {
      id v6 = [NSString stringWithFormat:@"%@_%@", *(void *)(a1 + 32), v8];
    }
    else
    {
      id v6 = v8;
    }
    v7 = v6;
    [*(id *)(a1 + 48) _c2FormatValueForRTC:v5 keyPrefix:v6 targetDictionary:*(void *)(a1 + 40) multipleOperationGroups:*(unsigned __int8 *)(a1 + 56)];
  }
}

+ (BOOL)useCloudTelemetryService
{
  int v2 = _os_feature_enabled_impl();
  if (v2) {
    LOBYTE(v2) = MGGetProductType() != 3348380076;
  }
  return v2;
}

+ (void)reportMetricWithOptions:(id)a3 genericMetricType:(int64_t)a4 eventName:(id)a5 startTime:(id)a6 endTime:(id)a7 attributes:(id)a8
{
  id v21 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  uint64_t v17 = (void *)MEMORY[0x1E01B8AF0]();
  uint64_t v18 = [v21 metricOptions];
  uint64_t v19 = [v18 generateTriggerWithResponseHeader:0];

  unint64_t v20 = +[C2Metric generateGenericEventWithName:v13 genericMetricType:a4 startTime:v14 endTime:v15 attributes:v16];
  [(id)objc_opt_class() _reportWithOptions:v21 networkEvent:0 genericEvent:v20 triggers:v19 eventName:v13 startTime:v14 endTime:v15 attributes:v16];
}

+ (void)reportNetworkEvent:(id)a3 triggers:(int)a4 originalSessionTask:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v11 = a3;
  id v7 = a5;
  id v8 = (void *)MEMORY[0x1E01B8AF0]();
  id v9 = [v7 options];
  id v10 = [[C2MetricRequestOptions alloc] initWithRequestOptions:v9];
  [(id)objc_opt_class() _reportWithOptions:v10 networkEvent:v11 genericEvent:0 triggers:v6 eventName:0 startTime:0 endTime:0 attributes:0];
}

+ (id)requestForMetricRequestOptions:(id)a3 metrics:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  id v7 = 0;
  if (a3 && v5)
  {
    id v8 = [a3 metricOptions];
    id v9 = v8;
    if (v8)
    {
      id v10 = [v8 c2MetricsEndpoint];
      id v11 = v10;
      if (v10)
      {
        id v12 = [v10 URLByAppendingPathComponent:@"c2"];
        if (v12)
        {
          id v13 = (void *)[objc_alloc(MEMORY[0x1E4F28E88]) initWithURL:v12];
          if (v13)
          {
            id v14 = objc_alloc_init(MEMORY[0x1E4F94098]);
            if (v14)
            {
              [v6 writeTo:v14];
              id v15 = [v14 immutableData];
              if (v15)
              {
                id v16 = [(id)objc_opt_class() gzipEncode:v15];
                if (v16)
                {
                  [v13 setHTTPMethod:@"POST"];
                  [v13 setHTTPBody:v16];
                  [v13 setValue:@"application/protobuf" forHTTPHeaderField:@"Content-Type"];
                  [v13 setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
                  id v7 = v13;
                }
                else
                {
                  id v7 = 0;
                }
              }
              else
              {
                id v7 = 0;
              }
            }
            else
            {
              id v7 = 0;
            }
          }
          else
          {
            id v7 = 0;
          }
        }
        else
        {
          id v7 = 0;
        }
      }
      else
      {
        id v7 = 0;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  return v7;
}

+ (id)gzipEncode:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  bzero(v9, 0x2000uLL);
  v4 = [MEMORY[0x1E4F1CA58] data];
  memset(&v8, 0, sizeof(v8));
  if (deflateInit2_(&v8, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    id v5 = 0;
  }
  else
  {
    id v6 = v3;
    v8.avail_in = objc_msgSend(v6, "length", objc_msgSend(v6, "bytes"));
    do
    {
      v8.avail_out = 0x2000;
      v8.next_out = v9;
      if (deflate(&v8, 4) == -2) {
        +[C2ReportMetrics gzipEncode:]();
      }
      [v4 appendBytes:v9 length:0x2000 - v8.avail_out];
    }
    while (!v8.avail_out);
    if (v8.avail_in) {
      +[C2ReportMetrics gzipEncode:]();
    }
    deflateEnd(&v8);
    id v5 = v4;
  }
  return v5;
}

+ (id)gzipDecode:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  bzero(v9, 0x2000uLL);
  v4 = [MEMORY[0x1E4F1CA58] data];
  memset(&v8, 0, sizeof(v8));
  if (inflateInit2_(&v8, 31, "1.2.12", 112))
  {
    id v5 = 0;
  }
  else
  {
    id v6 = v3;
    v8.avail_in = objc_msgSend(v6, "length", objc_msgSend(v6, "bytes"));
    do
    {
      v8.avail_out = 0x2000;
      v8.next_out = v9;
      if (inflate(&v8, 4) == -2) {
        +[C2ReportMetrics gzipDecode:]();
      }
      [v4 appendBytes:v9 length:0x2000 - v8.avail_out];
    }
    while (!v8.avail_out);
    if (v8.avail_in) {
      +[C2ReportMetrics gzipDecode:]();
    }
    inflateEnd(&v8);
    id v5 = v4;
  }
  return v5;
}

uint64_t __112__C2ReportMetrics__reportWithOptions_networkEvent_genericEvent_triggers_eventName_startTime_endTime_attributes___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (C2ReportMetrics)initWithMetricRequest:(id)a3 metricRequestOptions:(id)a4 ignoreRequestThrottle:(BOOL)a5 requestThrottleIdentifier:(id)a6 requestThrottleLimit:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  id v16 = v15;
  uint64_t v17 = 0;
  if (v13 && v14 && v15)
  {
    uint64_t v18 = [v14 metricRequestTransportOptions];
    if (v18)
    {
      unint64_t v27 = a7;
      uint64_t v19 = [v14 metricUUID];
      unint64_t v20 = [v19 UUIDString];

      if (v20)
      {
        v28.receiver = self;
        v28.super_class = (Class)C2ReportMetrics;
        id v21 = [(C2ReportMetrics *)&v28 init];
        unint64_t v22 = v21;
        if (v21)
        {
          v21->_ignoreRequestThrottle = a5;
          objc_storeStrong((id *)&v21->_requestThrottleIdentifier, a6);
          v22->_requestThrottleLimit = v27;
          objc_storeStrong((id *)&v22->_metricRequest, a3);
          uint64_t v23 = [v14 metricOptions];
          metricOptions = v22->_metricOptions;
          v22->_metricOptions = (C2MetricOptions *)v23;

          [(NSMutableURLRequest *)v22->_metricRequest setValue:v20 forHTTPHeaderField:@"x-apple-request-uuid"];
          v25 = [NSString stringWithFormat:@"MetricRequest-%@", v20];
          [v18 setIdentifier:v25];

          objc_storeStrong((id *)&v22->_metricsTransportRequestOptions, v18);
        }
        self = v22;
        uint64_t v17 = self;
      }
      else
      {
        uint64_t v17 = 0;
      }
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  return v17;
}

- (void)send
{
}

uint64_t __23__C2ReportMetrics_send__block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (void)URLSession:(id)a3 _willRetryBackgroundDataTask:(id)a4 withError:(id)a5
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2 object:self file:@"C2ReportMetrics.m" lineNumber:555 description:@"Unexpected callback."];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  testBehavior_didCompleteWithError = (void (**)(id, id))self->_testBehavior_didCompleteWithError;
  if (testBehavior_didCompleteWithError) {
    testBehavior_didCompleteWithError[2](testBehavior_didCompleteWithError, v9);
  }
  pthread_mutex_lock(&sOutstandingTaskCountMutex);
  if (!sOutstandingTaskCountMap) {
    -[C2ReportMetrics URLSession:task:didCompleteWithError:]();
  }
  id v11 = (char *)NSMapGet((NSMapTable *)sOutstandingTaskCountMap, self->_requestThrottleIdentifier);
  if (!v11) {
    -[C2ReportMetrics URLSession:task:didCompleteWithError:]();
  }
  NSMapInsert((NSMapTable *)sOutstandingTaskCountMap, self->_requestThrottleIdentifier, v11 - 1);
  pthread_mutex_unlock(&sOutstandingTaskCountMutex);
  id v12 = [(C2MetricOptions *)self->_metricOptions didCompleteWithError];

  if (v12)
  {
    id v13 = [(C2MetricOptions *)self->_metricOptions didCompleteWithError];
    ((void (**)(void, id))v13)[2](v13, v9);
  }
  [(C2MetricOptions *)self->_metricOptions setDidCompleteWithError:0];
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 handleFailureInMethod:a2 object:self file:@"C2ReportMetrics.m" lineNumber:592 description:@"Unexpected callback."];
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
}

- (BOOL)ignoreRequestThrottle
{
  return self->_ignoreRequestThrottle;
}

- (void)setIgnoreRequestThrottle:(BOOL)a3
{
  self->_ignoreRequestThrottle = a3;
}

- (NSString)requestThrottleIdentifier
{
  return self->_requestThrottleIdentifier;
}

- (void)setRequestThrottleIdentifier:(id)a3
{
}

- (unint64_t)requestThrottleLimit
{
  return self->_requestThrottleLimit;
}

- (void)setRequestThrottleLimit:(unint64_t)a3
{
  self->_requestThrottleLimit = a3;
}

- (NSMutableURLRequest)metricRequest
{
  return self->_metricRequest;
}

- (void)setMetricRequest:(id)a3
{
}

- (C2RequestOptions)metricsTransportRequestOptions
{
  return self->_metricsTransportRequestOptions;
}

- (void)setMetricsTransportRequestOptions:(id)a3
{
}

- (NSURLSessionTask)metricTask
{
  return self->_metricTask;
}

- (void)setMetricTask:(id)a3
{
}

- (C2MetricOptions)metricOptions
{
  return self->_metricOptions;
}

- (void)setMetricOptions:(id)a3
{
}

- (id)testBehavior_tooManyTasksRunning
{
  return self->_testBehavior_tooManyTasksRunning;
}

- (void)setTestBehavior_tooManyTasksRunning:(id)a3
{
}

- (id)testBehavior_didCompleteWithError
{
  return self->_testBehavior_didCompleteWithError;
}

- (void)setTestBehavior_didCompleteWithError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_testBehavior_didCompleteWithError, 0);
  objc_storeStrong(&self->_testBehavior_tooManyTasksRunning, 0);
  objc_storeStrong((id *)&self->_metricOptions, 0);
  objc_storeStrong((id *)&self->_metricTask, 0);
  objc_storeStrong((id *)&self->_metricsTransportRequestOptions, 0);
  objc_storeStrong((id *)&self->_metricRequest, 0);
  objc_storeStrong((id *)&self->_requestThrottleIdentifier, 0);
}

+ (void)gzipEncode:.cold.1()
{
  __assert_rtn("+[C2ReportMetrics gzipEncode:]", "C2ReportMetrics.m", 209, "ret != Z_STREAM_ERROR");
}

+ (void)gzipEncode:.cold.2()
{
  __assert_rtn("+[C2ReportMetrics gzipEncode:]", "C2ReportMetrics.m", 213, "_zlibStream.avail_in == 0");
}

+ (void)gzipDecode:.cold.1()
{
  __assert_rtn("+[C2ReportMetrics gzipDecode:]", "C2ReportMetrics.m", 243, "ret != Z_STREAM_ERROR");
}

+ (void)gzipDecode:.cold.2()
{
  __assert_rtn("+[C2ReportMetrics gzipDecode:]", "C2ReportMetrics.m", 247, "_zlibStream.avail_in == 0");
}

- (void)URLSession:task:didCompleteWithError:.cold.1()
{
}

- (void)URLSession:task:didCompleteWithError:.cold.2()
{
}

@end