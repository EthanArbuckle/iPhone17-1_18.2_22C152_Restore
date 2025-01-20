@interface AMSMetricsLoadURLEvent
+ (BOOL)isPerHostLoadURLSamplingEnabled:(id)a3;
+ (BOOL)isPerHostLoadURLSamplingEnabled:(id)a3 perHostSamplingSuppressed:(BOOL *)a4 featureFlagEnabled:(BOOL *)a5;
+ (BOOL)shouldCollectMetricsForContext:(id)a3;
+ (double)_samplingPercentageForURLSessionTask:(id)a3 performanceDictionary:(id)a4;
+ (double)_timingDataMetricToServerTimeInterval:(id)a3;
+ (id)_DNSServerIPAddresses;
+ (id)_buildVariant;
+ (id)_edgeRelayWasUsedFor:(id)a3 domains:(id)a4;
+ (id)_fetchNetworkQualityReportsPromise;
+ (id)_hostnameFrom:(id)a3;
+ (id)_isAnEdgeRelayServer:(id)a3 domains:(id)a4;
+ (id)_propertyValueClassesForKnownProperties;
+ (id)_radioTypeStringValueFromRadioType:(int)a3;
+ (id)_resolvedIPAddressFromTask:(id)a3;
+ (id)loadURLEventPromiseWithContext:(id)a3;
+ (id)loadURLEventWithTopic:(id)a3 context:(id)a4;
+ (id)loadURLTopicFromContext:(id)a3;
+ (id)shouldCollectMetricsPromiseForContext:(id)a3;
- (AMSMetricsLoadURLEvent)initWithContext:(id)a3;
- (BOOL)TFOEnabled;
- (BOOL)TLSSessionTickets;
- (BOOL)apsRelayAttempted;
- (BOOL)apsRelayDidFallback;
- (BOOL)apsRelaySucceeded;
- (BOOL)cachedResponse;
- (BOOL)connectionReused;
- (BOOL)isDNUSubmissionAllowed;
- (BOOL)xpSamplingForced;
- (NSArray)networkQualityReports;
- (NSDictionary)metricsOverlay;
- (NSNumber)edgeRelayWasUsed;
- (NSString)DNSServers;
- (NSString)TIDState;
- (NSString)appleTimingApp;
- (NSString)buildVariant;
- (NSString)cellularDataBearerTechnology;
- (NSString)clientCorrelationKey;
- (NSString)clientError;
- (NSString)connectionInterface;
- (NSString)connectionType;
- (NSString)edgeNodeCacheStatus;
- (NSString)environmentDataCenter;
- (NSString)networkProtocolName;
- (NSString)originalApp;
- (NSString)radioTechnology;
- (NSString)radioType;
- (NSString)requestURL;
- (NSString)resolvedIPAddress;
- (NSString)responseDate;
- (NSString)wt;
- (NSString)xxdc;
- (double)connectionEndTime;
- (double)connectionStartTime;
- (double)domainLookupEndTime;
- (double)domainLookupStartTime;
- (double)fetchStartTime;
- (double)redirectEndTime;
- (double)redirectStartTime;
- (double)requestStartTime;
- (double)responseEndTime;
- (double)responseStartTime;
- (double)secureConnectionStartTime;
- (double)urlCacheMaxCacheableEntrySizeRatio;
- (double)xpSamplingPercentageCachedResponses;
- (double)xpSamplingPercentageUsers;
- (double)xpSessionDuration;
- (id)_prepareEventPromiseWithContext:(id)a3;
- (int64_t)statusCode;
- (unint64_t)connectionStartNStatRXBytes;
- (unint64_t)connectionStartNStatTXBytes;
- (unint64_t)connectionStopNStatRXBytes;
- (unint64_t)connectionStopNStatTXBytes;
- (unint64_t)redirectCount;
- (unint64_t)requestMessageSize;
- (unint64_t)responseMessageSize;
- (unint64_t)responseMessageSizeUncompressed;
- (unint64_t)urlCacheDiskCapacity;
- (unint64_t)urlCacheMemoryCapacity;
- (void)_addSharedURLCacheProperties;
- (void)setAppleTimingApp:(id)a3;
- (void)setApsRelayAttempted:(BOOL)a3;
- (void)setApsRelayDidFallback:(BOOL)a3;
- (void)setApsRelaySucceeded:(BOOL)a3;
- (void)setBuildVariant:(id)a3;
- (void)setCachedResponse:(BOOL)a3;
- (void)setCellularDataBearerTechnology:(id)a3;
- (void)setClientCorrelationKey:(id)a3;
- (void)setClientError:(id)a3;
- (void)setConnectionEndTime:(double)a3;
- (void)setConnectionInterface:(id)a3;
- (void)setConnectionReused:(BOOL)a3;
- (void)setConnectionStartNStatRXBytes:(unint64_t)a3;
- (void)setConnectionStartNStatTXBytes:(unint64_t)a3;
- (void)setConnectionStartTime:(double)a3;
- (void)setConnectionStopNStatRXBytes:(unint64_t)a3;
- (void)setConnectionStopNStatTXBytes:(unint64_t)a3;
- (void)setConnectionType:(id)a3;
- (void)setDNSServers:(id)a3;
- (void)setDNUSubmissionAllowed:(BOOL)a3;
- (void)setDomainLookupEndTime:(double)a3;
- (void)setDomainLookupStartTime:(double)a3;
- (void)setEdgeNodeCacheStatus:(id)a3;
- (void)setEdgeRelayWasUsed:(id)a3;
- (void)setEnvironmentDataCenter:(id)a3;
- (void)setFetchStartTime:(double)a3;
- (void)setMetricsOverlay:(id)a3;
- (void)setNetworkProtocolName:(id)a3;
- (void)setNetworkQualityReports:(id)a3;
- (void)setOriginalApp:(id)a3;
- (void)setRadioTechnology:(id)a3;
- (void)setRadioType:(id)a3;
- (void)setRedirectCount:(unint64_t)a3;
- (void)setRedirectEndTime:(double)a3;
- (void)setRedirectStartTime:(double)a3;
- (void)setRequestMessageSize:(unint64_t)a3;
- (void)setRequestStartTime:(double)a3;
- (void)setRequestURL:(id)a3;
- (void)setResolvedIPAddress:(id)a3;
- (void)setResponseDate:(id)a3;
- (void)setResponseEndTime:(double)a3;
- (void)setResponseMessageSize:(unint64_t)a3;
- (void)setResponseMessageSizeUncompressed:(unint64_t)a3;
- (void)setResponseStartTime:(double)a3;
- (void)setSecureConnectionStartTime:(double)a3;
- (void)setStatusCode:(int64_t)a3;
- (void)setTFOEnabled:(BOOL)a3;
- (void)setTIDState:(id)a3;
- (void)setTLSSessionTickets:(BOOL)a3;
- (void)setUrlCacheDiskCapacity:(unint64_t)a3;
- (void)setUrlCacheMaxCacheableEntrySizeRatio:(double)a3;
- (void)setUrlCacheMemoryCapacity:(unint64_t)a3;
- (void)setWt:(id)a3;
- (void)setXpSamplingForced:(BOOL)a3;
- (void)setXpSamplingPercentageCachedResponses:(double)a3;
- (void)setXpSamplingPercentageUsers:(double)a3;
- (void)setXpSessionDuration:(double)a3;
- (void)setXxdc:(id)a3;
@end

@implementation AMSMetricsLoadURLEvent

AMSMetricsLoadURLEvent *__57__AMSMetricsLoadURLEvent_loadURLEventPromiseWithContext___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSMetricsLoadURLEvent loadURLEventWithTopic:a2 context:*(void *)(a1 + 32)];
}

AMSPromise *__56__AMSMetricsLoadURLEvent_loadURLEventWithTopic_context___block_invoke(uint64_t a1)
{
  return +[AMSPromise promiseWithResult:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

void __58__AMSMetricsLoadURLEvent__prepareEventPromiseWithContext___block_invoke(id *a1, void *a2, void *a3)
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v122 = a3;
  v6 = [v5 objectForKeyedSubscript:@"performance"];
  v7 = [v6 objectForKeyedSubscript:@"edgerelay_domains"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v128 = v7;
  }
  else {
    id v128 = 0;
  }

  v8 = [a1[4] task];
  v9 = [v8 response];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  v11 = [a1[4] task];
  v124 = [v11 originalRequest];

  v12 = [a1[4] task];
  v126 = [v12 _timingData];

  v13 = [a1[4] taskMetrics];
  v14 = [v13 transactionMetrics];

  v15 = objc_msgSend(v10, "ams_valueForHTTPHeaderField:", @"apple-timing-app");
  [a1[5] setAppleTimingApp:v15];

  v16 = [v14 lastObject];
  objc_msgSend(a1[5], "setApsRelayAttempted:", objc_msgSend(v16, "_apsRelayAttempted"));

  v17 = objc_msgSend(v10, "ams_valueForHTTPHeaderField:", @"x-apple-aps-delivery-type");
  v121 = v17;
  if (objc_opt_respondsToSelector()) {
    uint64_t v18 = [v17 integerValue];
  }
  else {
    uint64_t v18 = 0;
  }
  v123 = v5;
  [a1[5] setApsRelayDidFallback:v18 == 1001];
  v19 = [v14 lastObject];
  objc_msgSend(a1[5], "setApsRelaySucceeded:", objc_msgSend(v19, "_apsRelaySucceeded"));

  v20 = +[AMSMetricsLoadURLEvent _buildVariant];
  v131 = a1;
  [a1[5] setBuildVariant:v20];

  v125 = v10;
  uint64_t v130 = [v10 statusCode];
  long long v137 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id obj = v14;
  uint64_t v21 = [obj countByEnumeratingWithState:&v137 objects:v147 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    v23 = 0;
    v132 = 0;
    char v24 = 0;
    uint64_t v25 = *(void *)v138;
    while (1)
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v138 != v25) {
          objc_enumerationMutation(obj);
        }
        v27 = *(void **)(*((void *)&v137 + 1) + 8 * i);
        if ([v27 resourceFetchType] == 3)
        {
          v28 = v23;
          v29 = +[AMSLogConfig sharedURLLoadingConfig];
          if (!v29)
          {
            v29 = +[AMSLogConfig sharedConfig];
          }
          v30 = [v29 OSLogObject];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v31 = objc_opt_class();
            v32 = AMSLogKey();
            *(_DWORD *)buf = 138543618;
            uint64_t v142 = v31;
            __int16 v143 = 2114;
            v144 = v32;
            _os_log_impl(&dword_18D554000, v30, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Received cached response", buf, 0x16u);
          }
          v33 = [v27 response];
          v34 = [v33 URL];
          v23 = [v34 absoluteString];

          char v24 = 1;
        }
        if (v132)
        {
          if (!v23) {
            continue;
          }
        }
        else
        {
          v132 = [(id)objc_opt_class() _edgeRelayWasUsedFor:v27 domains:v128];
          if (!v23) {
            continue;
          }
        }
        v35 = [v27 response];
        v36 = [v35 URL];
        v37 = [v36 absoluteString];
        v38 = v23;
        int v39 = [v23 isEqualToString:v37];

        if (v39)
        {
          v40 = [v27 response];
          uint64_t v41 = objc_msgSend(v40, "ams_statusCode");

          uint64_t v42 = v130;
          if (v41 == 304) {
            uint64_t v42 = 304;
          }
          uint64_t v130 = v42;
        }
        v23 = v38;
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v137 objects:v147 count:16];
      if (!v22) {
        goto LABEL_34;
      }
    }
  }
  v23 = 0;
  v132 = 0;
  char v24 = 0;
LABEL_34:

  [v131[5] setCachedResponse:v24 & 1];
  [v131[5] setEdgeRelayWasUsed:v132];
  v43 = [obj lastObject];
  v44 = [v43 _dataTransferReport];

  if (v44 && nw_data_transfer_report_get_path_count(v44))
  {
    v45 = +[AMSMetricsLoadURLEvent _radioTypeStringValueFromRadioType:nw_data_transfer_report_get_path_radio_type(v44, *MEMORY[0x1E4F38C78])];
    [v131[5] setCellularDataBearerTechnology:v45];
  }
  v127 = v44;
  v46 = v125;
  v47 = objc_msgSend(v125, "ams_valueForHTTPHeaderField:", @"X-Apple-Jingle-Correlation-Key");
  v48 = v124;
  if (v47)
  {
    [v131[5] setClientCorrelationKey:v47];
  }
  else
  {
    v49 = [MEMORY[0x1E4F29128] UUID];
    v50 = [v49 UUIDString];
    [v131[5] setClientCorrelationKey:v50];
  }
  v51 = [v131[4] error];
  v52 = [v51 localizedDescription];
  [v131[5] setClientError:v52];

  v53 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataConnectEnd"];
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:v53];
  objc_msgSend(v131[5], "setConnectionEndTime:");

  v120 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataConnectionInterfaceIdentifier"];
  objc_msgSend(v131[5], "setConnectionInterface:");
  v54 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataConnectionReused"];
  objc_msgSend(v131[5], "setConnectionReused:", objc_msgSend(v54, "BOOLValue"));

  v55 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataConnectionStartTimeCounts"];
  v56 = v55;
  if (v55)
  {
    v57 = [v55 objectForKeyedSubscript:@"_kCFNTimingDataNStatRXBytes"];
    objc_msgSend(v131[5], "setConnectionStartNStatRXBytes:", objc_msgSend(v57, "unsignedIntegerValue"));

    v58 = [v56 objectForKeyedSubscript:@"_kCFNTimingDataNStatTXBytes"];
    objc_msgSend(v131[5], "setConnectionStartNStatTXBytes:", objc_msgSend(v58, "unsignedIntegerValue"));
  }
  v59 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataConnectStart"];
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:v59];
  objc_msgSend(v131[5], "setConnectionStartTime:");

  v60 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataConnectionStopTimeCounts"];
  v61 = v60;
  if (v60)
  {
    v62 = [v60 objectForKeyedSubscript:@"_kCFNTimingDataNStatRXBytes"];
    objc_msgSend(v131[5], "setConnectionStopNStatRXBytes:", objc_msgSend(v62, "unsignedIntegerValue"));

    v63 = [v61 objectForKeyedSubscript:@"_kCFNTimingDataNStatTXBytes"];
    objc_msgSend(v131[5], "setConnectionStopNStatTXBytes:", objc_msgSend(v63, "unsignedIntegerValue"));
  }
  v64 = [v124 valueForHTTPHeaderField:@"X-Apple-Connection-Type"];
  [v131[5] setConnectionType:v64];

  objc_msgSend(v131[5], "setDNUSubmissionAllowed:", +[AMSMetrics diagnosticsSubmissionAllowed](AMSMetrics, "diagnosticsSubmissionAllowed"));
  v65 = +[AMSMetricsLoadURLEvent _DNSServerIPAddresses];
  v66 = [v65 componentsJoinedByString:@","];
  [v131[5] setDNSServers:v66];

  v67 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataDomainLookupEnd"];
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:v67];
  objc_msgSend(v131[5], "setDomainLookupEndTime:");

  v68 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataDomainLookupStart"];
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:v68];
  objc_msgSend(v131[5], "setDomainLookupStartTime:");

  v69 = objc_msgSend(v125, "ams_valueForHTTPHeaderField:", @"X-CACHE");
  [v131[5] setEdgeNodeCacheStatus:v69];

  v70 = objc_msgSend(v125, "ams_valueForHTTPHeaderField:", @"X-Apple-Application-Site");
  [v131[5] setEnvironmentDataCenter:v70];

  [v131[5] setEventType:@"loadUrl"];
  v71 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataFetchStart"];
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:v71];
  objc_msgSend(v131[5], "setFetchStartTime:");

  v72 = [obj lastObject];
  v73 = [v72 networkProtocolName];
  [v131[5] setNetworkProtocolName:v73];

  v74 = [v131[4] processInfo];
  v75 = [v74 bundleIdentifier];
  v118 = v56;
  if (v75)
  {
    [v131[5] setOriginalApp:v75];
  }
  else
  {
    v76 = [MEMORY[0x1E4F28B50] mainBundle];
    v77 = [v76 bundleIdentifier];
    [v131[5] setOriginalApp:v77];

    v48 = v124;
    v46 = v125;
  }
  v78 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataRedirectCount"];
  objc_msgSend(v131[5], "setRedirectCount:", objc_msgSend(v78, "unsignedIntegerValue"));

  v79 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataRedirectEnd"];
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:v79];
  objc_msgSend(v131[5], "setRedirectEndTime:");

  v80 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataRedirectStart"];
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:v80];
  objc_msgSend(v131[5], "setRedirectStartTime:");

  v81 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataTotalBytesSent"];
  objc_msgSend(v131[5], "setRequestMessageSize:", objc_msgSend(v81, "unsignedIntegerValue"));

  v82 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataRequestStart"];
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:v82];
  objc_msgSend(v131[5], "setRequestStartTime:");

  v83 = [v48 URL];
  v84 = [v83 absoluteString];
  [v131[5] setRequestURL:v84];

  v85 = [v131[4] task];
  v86 = +[AMSMetricsLoadURLEvent _resolvedIPAddressFromTask:v85];
  [v131[5] setResolvedIPAddress:v86];

  v87 = objc_msgSend(v46, "ams_valueForHTTPHeaderField:", @"Date");
  [v131[5] setResponseDate:v87];

  v88 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataResponseEnd"];
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:v88];
  objc_msgSend(v131[5], "setResponseEndTime:");

  v89 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataTotalBytesReceived"];
  objc_msgSend(v131[5], "setResponseMessageSize:", objc_msgSend(v89, "unsignedIntegerValue"));

  v90 = [obj lastObject];
  uint64_t v91 = [v90 countOfResponseBodyBytesAfterDecoding];

  if (v91 < 0)
  {
    v92 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v92)
    {
      v92 = +[AMSLogConfig sharedConfig];
    }
    v93 = objc_msgSend(v92, "OSLogObject", v118);
    if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
    {
      v94 = objc_opt_class();
      id v95 = v94;
      AMSLogKey();
      v97 = v96 = v23;
      *(_DWORD *)buf = 138543874;
      uint64_t v142 = (uint64_t)v94;
      __int16 v143 = 2114;
      v144 = v97;
      __int16 v145 = 2048;
      uint64_t v146 = v91;
      _os_log_impl(&dword_18D554000, v93, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] countOfResponseBodyBytesAfterDecoding in metrics doesn't fit in NSUInteger bounds. It will be ignored. The provided metrics are probably malformed. size = %lld", buf, 0x20u);

      v23 = v96;
    }

    v48 = v124;
    v46 = v125;
  }
  else
  {
    [v131[5] setResponseMessageSizeUncompressed:v91];
  }
  v98 = objc_msgSend(v126, "objectForKeyedSubscript:", @"_kCFNTimingDataResponseStart", v118);
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:v98];
  objc_msgSend(v131[5], "setResponseStartTime:");

  v99 = [v126 objectForKeyedSubscript:@"_kCFNTimingDataSecureConnectionStart"];
  +[AMSMetricsLoadURLEvent _timingDataMetricToServerTimeInterval:v99];
  objc_msgSend(v131[5], "setSecureConnectionStartTime:");

  [v131[5] setStatusCode:v130];
  v100 = [v131[4] session];
  v101 = [v100 configuration];
  objc_msgSend(v131[5], "setTFOEnabled:", objc_msgSend(v101, "_allowsTCPFastOpen"));

  v102 = [v48 valueForHTTPHeaderField:@"X-Apple-TID-State"];
  [v131[5] setTIDState:v102];

  v103 = [v131[4] session];
  v104 = [v103 configuration];
  objc_msgSend(v131[5], "setTLSSessionTickets:", objc_msgSend(v104, "_allowsTLSSessionTickets"));

  [v131[5] _addSharedURLCacheProperties];
  if (v123)
  {
    v105 = [v123 objectForKeyedSubscript:@"performance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v106 = v105;
    }
    else {
      id v106 = 0;
    }

    v107 = [v106 objectForKeyedSubscript:@"sessionDuration"];
    [v107 doubleValue];
    objc_msgSend(v131[5], "setXpSessionDuration:");

    int64_t v108 = +[AMSDefaults forceLoadUrlMetrics];
    if (v108 == 2)
    {
      [v131[5] setXpSamplingPercentageUsers:0.0];
      id v110 = v131[5];
      double v111 = 0.0;
    }
    else
    {
      if (v108 != 1)
      {
        if (!v108)
        {
          if (+[AMSMetricsLoadURLEvent isPerHostLoadURLSamplingEnabled:v123])
          {
            v109 = [v131[4] task];
            +[AMSMetricsLoadURLEvent _samplingPercentageForURLSessionTask:v109 performanceDictionary:v106];
          }
          else
          {
            v109 = [v106 objectForKeyedSubscript:@"samplingPercentageUsers"];
            [v109 doubleValue];
          }
          objc_msgSend(v131[5], "setXpSamplingPercentageUsers:");

          v112 = [v106 objectForKeyedSubscript:@"samplingPercentageCachedResponses"];
          [v112 doubleValue];
          objc_msgSend(v131[5], "setXpSamplingPercentageCachedResponses:");
        }
        goto LABEL_68;
      }
      [v131[5] setXpSamplingForced:1];
      [v131[5] setXpSamplingPercentageUsers:1.0];
      id v110 = v131[5];
      double v111 = 1.0;
    }
    [v110 setXpSamplingPercentageCachedResponses:v111];
LABEL_68:
  }
  v113 = objc_msgSend(v46, "ams_valueForHTTPHeaderField:", @"wt");
  [v131[5] setWt:v113];

  v114 = objc_msgSend(v46, "ams_valueForHTTPHeaderField:", @"X-XDC");
  [v131[5] setXxdc:v114];

  v115 = +[AMSMetricsLoadURLEvent _fetchNetworkQualityReportsPromise];
  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __58__AMSMetricsLoadURLEvent__prepareEventPromiseWithContext___block_invoke_379;
  v133[3] = &unk_1E55A4A90;
  id v116 = v131[4];
  v133[4] = v131[5];
  id v134 = v126;
  id v135 = v116;
  id v136 = v131[6];
  id v117 = v126;
  [v115 addFinishBlock:v133];
}

+ (id)_propertyValueClassesForKnownProperties
{
  v9[51] = *MEMORY[0x1E4F143B8];
  v8[0] = @"appleTimingApp";
  v9[0] = objc_opt_class();
  v8[1] = @"apsRelayAttempted";
  v9[1] = objc_opt_class();
  v8[2] = @"apsRelayDidFallback";
  v9[2] = objc_opt_class();
  v8[3] = @"apsRelaySucceeded";
  v9[3] = objc_opt_class();
  v8[4] = @"cachedResponse";
  v9[4] = objc_opt_class();
  v8[5] = @"cellularDataBearerTechnology";
  v9[5] = objc_opt_class();
  v8[6] = @"clientCorrelationKey";
  v9[6] = objc_opt_class();
  v8[7] = @"clientError";
  v9[7] = objc_opt_class();
  v8[8] = @"connectionEndTime";
  v9[8] = objc_opt_class();
  v8[9] = @"connectionInterface";
  v9[9] = objc_opt_class();
  v8[10] = @"connectionReused";
  v9[10] = objc_opt_class();
  v8[11] = @"connectionStartNStatRXBytes";
  v9[11] = objc_opt_class();
  v8[12] = @"connectionStartNStatTXBytes";
  v9[12] = objc_opt_class();
  v8[13] = @"connectionStartTime";
  v9[13] = objc_opt_class();
  v8[14] = @"connectionStopNStatRXBytes";
  v9[14] = objc_opt_class();
  v8[15] = @"connectionStopNStatTXBytes";
  v9[15] = objc_opt_class();
  v8[16] = @"connectionType";
  v9[16] = objc_opt_class();
  v8[17] = @"dnsServersIPAddresses";
  v9[17] = objc_opt_class();
  v8[18] = @"domainLookupEndTime";
  v9[18] = objc_opt_class();
  v8[19] = @"domainLookupStartTime";
  v9[19] = objc_opt_class();
  v8[20] = @"edgeNodeCacheStatus";
  v9[20] = objc_opt_class();
  v8[21] = @"edgeRelayWasUsed";
  v9[21] = objc_opt_class();
  v8[22] = @"environmentDataCenter";
  v9[22] = objc_opt_class();
  v8[23] = @"fetchStartTime";
  v9[23] = objc_opt_class();
  v8[24] = @"networkQualityReports";
  v9[24] = objc_opt_class();
  v8[25] = @"app";
  v9[25] = objc_opt_class();
  v8[26] = @"radioTechnology";
  v9[26] = objc_opt_class();
  v8[27] = @"radioType";
  v9[27] = objc_opt_class();
  v8[28] = @"redirectCount";
  v9[28] = objc_opt_class();
  v8[29] = @"redirectEndTime";
  v9[29] = objc_opt_class();
  v8[30] = @"redirectStartTime";
  v9[30] = objc_opt_class();
  v8[31] = @"requestMessageSize";
  v9[31] = objc_opt_class();
  v8[32] = @"requestStartTime";
  v9[32] = objc_opt_class();
  v8[33] = @"requestUrl";
  v9[33] = objc_opt_class();
  v8[34] = @"resolvedIPAddress";
  v9[34] = objc_opt_class();
  v8[35] = @"responseDate";
  v9[35] = objc_opt_class();
  v8[36] = @"responseEndTime";
  v9[36] = objc_opt_class();
  v8[37] = @"responseMessageSize";
  v9[37] = objc_opt_class();
  v8[38] = @"responseMessageSizeUncompressed";
  v9[38] = objc_opt_class();
  v8[39] = @"responseStartTime";
  v9[39] = objc_opt_class();
  v8[40] = @"secureConnectionStartTime";
  v9[40] = objc_opt_class();
  v8[41] = @"statusCode";
  v9[41] = objc_opt_class();
  v8[42] = @"TFOEnabled";
  v9[42] = objc_opt_class();
  v8[43] = @"tidState";
  v9[43] = objc_opt_class();
  v8[44] = @"TLSSessionTickets";
  v9[44] = objc_opt_class();
  v8[45] = @"wt";
  v9[45] = objc_opt_class();
  v8[46] = @"xpSessionDuration";
  v9[46] = objc_opt_class();
  v8[47] = @"xpSamplingForced";
  v9[47] = objc_opt_class();
  v8[48] = @"xpSamplingPercentageUsers";
  v9[48] = objc_opt_class();
  v8[49] = @"xpSamplingPercentageCachedResponses";
  v9[49] = objc_opt_class();
  v8[50] = @"XXDC";
  v9[50] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:51];
  v4 = (void *)[v3 mutableCopy];

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___AMSMetricsLoadURLEvent;
  id v5 = objc_msgSendSuper2(&v7, sel__propertyValueClassesForKnownProperties);
  [v4 addEntriesFromDictionary:v5];

  return v4;
}

+ (double)_timingDataMetricToServerTimeInterval:(id)a3
{
  [a3 doubleValue];
  double v4 = v3;
  double result = 0.0;
  if (v4 != 0.0)
  {
    if (qword_1EB38DE28 != -1) {
      dispatch_once(&qword_1EB38DE28, &__block_literal_global_94);
    }
    return v4 + *(double *)&_MergedGlobals_132;
  }
  return result;
}

+ (id)_edgeRelayWasUsedFor:(id)a3 domains:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isProxyConnection])
  {
    v8 = [a1 _hostnameFrom:v6];
    v9 = [a1 _isAnEdgeRelayServer:v8 domains:v7];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id __64__AMSMetricsLoadURLEvent_shouldCollectMetricsPromiseForContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = [v3 objectForKeyedSubscript:@"performance"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v16)
    {
      v16 = +[AMSLogConfig sharedConfig];
    }
    v17 = [v16 OSLogObject];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v45 = (id)objc_opt_class();
      id v18 = v45;
      _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch performance metrics from bag", buf, 0xCu);
    }
    uint64_t v15 = MEMORY[0x1E4F1CC28];
    goto LABEL_14;
  }
  __int16 v43 = 0;
  int v5 = [*(id *)(a1 + 40) isPerHostLoadURLSamplingEnabled:v3 perHostSamplingSuppressed:(char *)&v43 + 1 featureFlagEnabled:&v43];
  uint64_t v6 = +[AMSLogConfig sharedURLLoadingConfig];
  id v7 = (void *)v6;
  if (!v5)
  {
    if (!v6)
    {
      id v7 = +[AMSLogConfig sharedConfig];
    }
    v20 = [v7 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = objc_opt_class();
      uint64_t v22 = @"true";
      if (HIBYTE(v43)) {
        v23 = @"true";
      }
      else {
        v23 = @"false";
      }
      *(_DWORD *)buf = 138543874;
      id v45 = v21;
      if (!(_BYTE)v43) {
        uint64_t v22 = @"false";
      }
      __int16 v46 = 2112;
      v47 = v23;
      __int16 v48 = 2112;
      v49 = v22;
      id v24 = v21;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_INFO, "%{public}@: Using host-agnostic LoadURL sampling logic, perHostSamplingSuppressed = %@, featureFlagEnabled = %@", buf, 0x20u);
    }
    uint64_t v25 = [v4 objectForKeyedSubscript:@"samplingPercentageUsers"];
    [v25 doubleValue];
    double v27 = v26;

    v28 = [v4 objectForKeyedSubscript:@"sessionDuration"];
    [v28 doubleValue];
    double v30 = v29;

    uint64_t v31 = [MEMORY[0x1E4F1C9C8] date];
    v32 = [MEMORY[0x1E4F28ED0] numberWithDouble:v30];
    +[AMSMetrics timeIntervalFromServerTime:v32];
    double v34 = v33;

    v35 = +[AMSDefaults metricsTimingWindowStartTime];
    v36 = [v35 dateByAddingTimeInterval:v34];

    if ([v31 compare:v36] == -1)
    {
      uint64_t v38 = MEMORY[0x1E4F1CC38];
    }
    else
    {
      +[AMSRandomNumberGenerator normalizedRandomDouble];
      if (v37 != 0.0)
      {
        double v40 = v37;
        if (v37 <= v27) {
          +[AMSDefaults setMetricsTimingWindowStartTime:v31];
        }
        uint64_t v41 = [MEMORY[0x1E4F28ED0] numberWithBool:v40 <= v27];
        v19 = +[AMSPromise promiseWithResult:v41];

        goto LABEL_33;
      }
      uint64_t v38 = MEMORY[0x1E4F1CC28];
    }
    v19 = +[AMSPromise promiseWithResult:v38];
LABEL_33:

    goto LABEL_34;
  }
  if (!v6)
  {
    id v7 = +[AMSLogConfig sharedConfig];
  }
  v8 = [v7 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_opt_class();
    *(_DWORD *)buf = 138543362;
    id v45 = v9;
    id v10 = v9;
    _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_INFO, "%{public}@: Using per-host LoadURL sampling logic", buf, 0xCu);
  }
  v11 = [*(id *)(a1 + 32) task];
  +[AMSMetricsLoadURLEvent _samplingPercentageForURLSessionTask:v11 performanceDictionary:v4];
  double v13 = v12;

  +[AMSRandomNumberGenerator normalizedRandomDouble];
  if (v14 == 0.0)
  {
    uint64_t v15 = MEMORY[0x1E4F1CC28];
LABEL_14:
    v19 = +[AMSPromise promiseWithResult:v15];
    goto LABEL_34;
  }
  int v39 = [MEMORY[0x1E4F28ED0] numberWithInt:v14 <= v13];
  v19 = +[AMSPromise promiseWithResult:v39];

LABEL_34:
  return v19;
}

+ (BOOL)isPerHostLoadURLSamplingEnabled:(id)a3 perHostSamplingSuppressed:(BOOL *)a4 featureFlagEnabled:(BOOL *)a5
{
  id v7 = objc_msgSend(a3, "ams_objectForKey:defaultValue:", @"suppressPerHostSampling", MEMORY[0x1E4F1CC28]);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v7;
  }
  else {
    id v8 = 0;
  }

  char v9 = [v8 BOOLValue];
  char v10 = _os_feature_enabled_impl();
  if (a4) {
    *a4 = v9;
  }
  if (a5) {
    *a5 = v10;
  }
  return v10 & ~v9;
}

- (void)setEdgeRelayWasUsed:(id)a3
{
}

- (void)setConnectionType:(id)a3
{
}

- (void)setConnectionStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"connectionStartTime"];
}

- (void)setConnectionReused:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"connectionReused"];
}

- (void)setConnectionInterface:(id)a3
{
}

- (void)setConnectionEndTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"connectionEndTime"];
}

- (void)setClientError:(id)a3
{
}

- (void)setClientCorrelationKey:(id)a3
{
}

- (void)setCachedResponse:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"cachedResponse"];
}

- (void)setBuildVariant:(id)a3
{
}

- (void)setApsRelaySucceeded:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"apsRelaySucceeded"];
}

- (void)setApsRelayDidFallback:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"apsRelayDidFallback"];
}

- (void)setApsRelayAttempted:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"apsRelayAttempted"];
}

- (void)setAppleTimingApp:(id)a3
{
}

- (void)setXxdc:(id)a3
{
}

- (void)setXpSessionDuration:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"xpSessionDuration"];
}

- (void)setXpSamplingPercentageUsers:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"xpSamplingPercentageUsers"];
}

- (void)setXpSamplingPercentageCachedResponses:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"xpSamplingPercentageCachedResponses"];
}

- (void)setWt:(id)a3
{
}

- (void)setTLSSessionTickets:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"TLSSessionTickets"];
}

- (void)setTIDState:(id)a3
{
}

- (void)setTFOEnabled:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"TFOEnabled"];
}

- (void)setStatusCode:(int64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"statusCode"];
}

- (void)setSecureConnectionStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"secureConnectionStartTime"];
}

- (void)setResponseStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"responseStartTime"];
}

- (void)setResponseMessageSizeUncompressed:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"responseMessageSizeUncompressed"];
}

- (void)setResponseMessageSize:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"responseMessageSize"];
}

- (void)setResponseEndTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"responseEndTime"];
}

- (void)setResponseDate:(id)a3
{
}

- (void)setResolvedIPAddress:(id)a3
{
}

- (void)setRequestURL:(id)a3
{
}

- (void)setRequestStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"requestStartTime"];
}

- (void)setRequestMessageSize:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"requestMessageSize"];
}

- (void)setRedirectStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"redirectStartTime"];
}

- (void)setRedirectEndTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"redirectEndTime"];
}

- (void)setRedirectCount:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"redirectCount"];
}

- (void)setOriginalApp:(id)a3
{
}

- (void)setNetworkProtocolName:(id)a3
{
}

- (void)setFetchStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"fetchStartTime"];
}

- (void)setEnvironmentDataCenter:(id)a3
{
}

- (void)setEdgeNodeCacheStatus:(id)a3
{
}

- (void)setDomainLookupStartTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"domainLookupStartTime"];
}

- (void)setDomainLookupEndTime:(double)a3
{
  if (a3 == 0.0)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = +[AMSMetrics serverTimeFromTimeInterval:](AMSMetrics, "serverTimeFromTimeInterval:");
  }
  id v5 = (id)v4;
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"domainLookupEndTime"];
}

- (void)setDNUSubmissionAllowed:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"DNUSubmissionAllowed"];
}

- (void)setDNSServers:(id)a3
{
}

+ (BOOL)isPerHostLoadURLSamplingEnabled:(id)a3
{
  return [a1 isPerHostLoadURLSamplingEnabled:a3 perHostSamplingSuppressed:0 featureFlagEnabled:0];
}

+ (id)_DNSServerIPAddresses
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v3 = (__res_9_state *)malloc_type_calloc(1uLL, 0x228uLL, 0x10B20402089BC1DuLL);
  if (!res_9_ninit(v3))
  {
    id v4 = (res_9_sockaddr_union *)malloc_type_malloc((uint64_t)v3->nscount << 7, 0x1000040AE2C30F4uLL);
    res_9_getservers(v3, v4, v3->nscount);
    if (v3->nscount)
    {
      unint64_t v5 = 0;
      uint64_t v6 = &v4->__space[4];
      while (1)
      {
        int v7 = *(v6 - 3);
        if (v7 == 30) {
          break;
        }
        if (v7 == 2)
        {
          int v8 = 2;
          char v9 = v6;
          socklen_t v10 = 16;
          goto LABEL_8;
        }
LABEL_10:
        ++v5;
        v6 += 128;
        if (v5 >= v3->nscount) {
          goto LABEL_11;
        }
      }
      char v9 = v6 + 4;
      int v8 = 30;
      socklen_t v10 = 46;
LABEL_8:
      inet_ntop(v8, v9, v15, v10);
      v11 = [NSString stringWithUTF8String:v15];
      if (v11)
      {
        [v2 addObject:v11];
      }
      goto LABEL_10;
    }
LABEL_11:
    free(v4);
  }
  res_9_ndestroy(v3);
  free(v3);
  if ([v2 count]) {
    double v12 = v2;
  }
  else {
    double v12 = 0;
  }
  id v13 = v12;

  return v13;
}

- (void)setCellularDataBearerTechnology:(id)a3
{
}

+ (id)_radioTypeStringValueFromRadioType:(int)a3
{
  switch(a3)
  {
    case 128:
      id v4 = @"cell_lte";
      break;
    case 129:
      id v4 = @"cell_endc_sub6";
      break;
    case 130:
      id v4 = @"cell_endc_mmw";
      break;
    case 131:
      id v4 = @"cell_nr_sa_sub6";
      break;
    case 132:
      id v4 = @"cell_nr_sa_mmw";
      break;
    case 133:
      id v4 = @"cell_wcdma";
      break;
    case 134:
      id v4 = @"cell_gsm";
      break;
    case 135:
      id v4 = @"cell_cdma";
      break;
    case 136:
      id v4 = @"cell_evdo";
      break;
    default:
      id v4 = @"unknown";
      switch(a3)
      {
        case 0:
          goto LABEL_34;
        case 1:
          id v4 = @"wifi_b";
          break;
        case 2:
          id v4 = @"wifi_a";
          break;
        case 3:
          id v4 = @"wifi_g";
          break;
        case 4:
          id v4 = @"wifi_n";
          break;
        case 5:
          id v4 = @"wifi_ac";
          break;
        case 6:
          id v4 = @"wifi_ax";
          break;
        default:
          objc_msgSend(NSString, "stringWithFormat:", @"%d", *(void *)&a3);
          id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_34:
          break;
      }
      break;
  }
  return v4;
}

+ (double)_samplingPercentageForURLSessionTask:(id)a3 performanceDictionary:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  int v8 = [v6 objectForKeyedSubscript:@"samplingPercentageUsers"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v8 doubleValue];
    double v10 = v9;
  }
  else
  {
    v11 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v11)
    {
      v11 = +[AMSLogConfig sharedConfig];
    }
    double v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [MEMORY[0x1E4F28ED0] numberWithDouble:0.0];
      double v14 = AMSHashIfNeeded(v13);
      *(_DWORD *)buf = 138543618;
      id v44 = a1;
      __int16 v45 = 2114;
      __int16 v46 = v14;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch fallback sampling percentage value from performance metrics dictionary, will use %{public}@", buf, 0x16u);
    }
    double v10 = 0.0;
  }
  uint64_t v15 = [v7 originalRequest];

  uint64_t v16 = [v15 URL];
  v17 = [v16 host];

  if (v17)
  {
    id v18 = [v6 objectForKeyedSubscript:@"samplingPercentagePerHost"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v20)
      {
        v20 = +[AMSLogConfig sharedConfig];
      }
      v23 = [v20 OSLogObject];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        double v30 = [MEMORY[0x1E4F28ED0] numberWithDouble:v10];
        uint64_t v31 = AMSHashIfNeeded(v30);
        *(_DWORD *)buf = 138543618;
        id v44 = a1;
        __int16 v45 = 2114;
        __int16 v46 = v31;
        _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch per-host sampling percentage values from performance metrics dictionary, falling back to global sampling percentage value of %{public}@", buf, 0x16u);
      }
      goto LABEL_35;
    }
    uint64_t v19 = [v18 objectForKeyedSubscript:v17];
    if (v19)
    {
      v20 = v19;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      uint64_t v22 = +[AMSLogConfig sharedURLLoadingConfig];
      v23 = v22;
      if (isKindOfClass)
      {
        if (!v22)
        {
          v23 = +[AMSLogConfig sharedConfig];
        }
        id v24 = [v23 OSLogObject];
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          uint64_t v41 = AMSHashIfNeeded(v17);
          uint64_t v25 = [MEMORY[0x1E4F28ED0] numberWithDouble:v10];
          double v26 = AMSHashIfNeeded(v25);
          *(_DWORD *)buf = 138543874;
          id v44 = a1;
          __int16 v45 = 2114;
          __int16 v46 = v41;
          __int16 v47 = 2114;
          __int16 v48 = v26;
          _os_log_impl(&dword_18D554000, v24, OS_LOG_TYPE_INFO, "%{public}@: Found per-host sampling percentage value in per-host dictionary for %{public}@: %{public}@. Using that", buf, 0x20u);
        }
        [v20 doubleValue];
        double v10 = v27;
        goto LABEL_36;
      }
      if (!v22)
      {
        v23 = +[AMSLogConfig sharedConfig];
      }
      double v37 = [v23 OSLogObject];
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        uint64_t v42 = AMSHashIfNeeded(v17);
        uint64_t v38 = [MEMORY[0x1E4F28ED0] numberWithDouble:v10];
        int v39 = AMSHashIfNeeded(v38);
        *(_DWORD *)buf = 138543874;
        id v44 = a1;
        __int16 v45 = 2114;
        __int16 v46 = v42;
        __int16 v47 = 2114;
        __int16 v48 = v39;
        _os_log_impl(&dword_18D554000, v37, OS_LOG_TYPE_ERROR, "%{public}@: Unexpected type for per-host sampling percentage value in per-host dictionary for %{public}@, falling back to global sampling percentage value of %{public}@", buf, 0x20u);
      }
LABEL_35:

      goto LABEL_36;
    }
    v32 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v32)
    {
      v32 = +[AMSLogConfig sharedConfig];
    }
    double v33 = [v32 OSLogObject];
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      double v34 = AMSHashIfNeeded(v17);
      v35 = [MEMORY[0x1E4F28ED0] numberWithDouble:v10];
      v36 = AMSHashIfNeeded(v35);
      *(_DWORD *)buf = 138543874;
      id v44 = a1;
      __int16 v45 = 2114;
      __int16 v46 = v34;
      __int16 v47 = 2114;
      __int16 v48 = v36;
      _os_log_impl(&dword_18D554000, v33, OS_LOG_TYPE_INFO, "%{public}@: No per-host sampling percentage value in per-host dictionary for %{public}@, falling back to global sampling percentage value of %{public}@", buf, 0x20u);
    }
    v20 = 0;
  }
  else
  {
    id v18 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v18)
    {
      id v18 = +[AMSLogConfig sharedConfig];
    }
    v20 = [v18 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v28 = [MEMORY[0x1E4F28ED0] numberWithDouble:v10];
      double v29 = AMSHashIfNeeded(v28);
      *(_DWORD *)buf = 138543618;
      id v44 = a1;
      __int16 v45 = 2114;
      __int16 v46 = v29;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve original request's hostname from url session task, falling back to global sampling percentage value of %{public}@", buf, 0x16u);
    }
  }
LABEL_36:

  return v10;
}

+ (id)loadURLEventWithTopic:(id)a3 context:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v8)
  {
    int v8 = +[AMSLogConfig sharedConfig];
  }
  double v9 = [v8 OSLogObject];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = objc_opt_class();
    v11 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v21 = v10;
    __int16 v22 = 2114;
    v23 = v11;
    __int16 v24 = 2114;
    id v25 = v6;
    _os_log_impl(&dword_18D554000, v9, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] creating load url event for [%{public}@]", buf, 0x20u);
  }
  double v12 = (void *)[objc_alloc((Class)a1) initWithTopic:v6];
  id v13 = [v12 _prepareEventPromiseWithContext:v7];

  double v14 = [v13 promiseAdapter];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __56__AMSMetricsLoadURLEvent_loadURLEventWithTopic_context___block_invoke;
  v18[3] = &unk_1E559F370;
  id v19 = v12;
  id v15 = v12;
  uint64_t v16 = [v14 thenWithBlock:v18];

  return v16;
}

- (id)_prepareEventPromiseWithContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = objc_opt_new();
  id v6 = [v4 metricsDictionaryPromise];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__AMSMetricsLoadURLEvent__prepareEventPromiseWithContext___block_invoke;
  v12[3] = &unk_1E55A4AB8;
  id v13 = v4;
  double v14 = self;
  id v7 = v5;
  id v15 = v7;
  id v8 = v4;
  [v6 addFinishBlock:v12];

  double v9 = v15;
  id v10 = v7;

  return v10;
}

+ (id)shouldCollectMetricsPromiseForContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = +[AMSDefaults forceLoadUrlMetrics];
  if (v5 == 2)
  {
    uint64_t v6 = MEMORY[0x1E4F1CC28];
    goto LABEL_5;
  }
  if (v5 == 1)
  {
    uint64_t v6 = MEMORY[0x1E4F1CC38];
LABEL_5:
    id v7 = +[AMSPromise promiseWithResult:v6];
    goto LABEL_7;
  }
  id v8 = [v4 metricsDictionaryPromise];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__AMSMetricsLoadURLEvent_shouldCollectMetricsPromiseForContext___block_invoke;
  v10[3] = &unk_1E55A3D40;
  id v12 = a1;
  id v11 = v4;
  id v7 = [v8 thenWithBlock:v10];

LABEL_7:
  return v7;
}

+ (id)_buildVariant
{
  unint64_t v2 = +[AMSDevice buildVariant];
  if (v2 - 1 > 2) {
    return @"customer";
  }
  else {
    return off_1E55A4AD8[v2 - 1];
  }
}

+ (id)_fetchNetworkQualityReportsPromise
{
  uint64_t v3 = +[AMSNetworkQualityInquiry sharedInstance];
  id v4 = v3;
  if (v3)
  {
    int64_t v5 = [v3 investigateNetworks];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __60__AMSMetricsLoadURLEvent__fetchNetworkQualityReportsPromise__block_invoke;
    v9[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v9[4] = a1;
    [v5 addErrorBlock:v9];
    uint64_t v6 = [v5 promiseWithTimeout:10.0];
  }
  else
  {
    int64_t v5 = AMSError(12, @"Failed to get network quality inquiry singleton", @"Network quality inquiry is not available", 0);
    uint64_t v6 = +[AMSPromise promiseWithError:v5];
  }
  id v7 = (void *)v6;

  return v7;
}

- (void)_addSharedURLCacheProperties
{
  id v3 = [MEMORY[0x1E4F18D78] sharedURLCache];
  -[AMSMetricsLoadURLEvent setUrlCacheDiskCapacity:](self, "setUrlCacheDiskCapacity:", [v3 diskCapacity]);
  -[AMSMetricsLoadURLEvent setUrlCacheMemoryCapacity:](self, "setUrlCacheMemoryCapacity:", [v3 memoryCapacity]);
  [v3 _maxCacheableEntrySizeRatio];
  -[AMSMetricsLoadURLEvent setUrlCacheMaxCacheableEntrySizeRatio:](self, "setUrlCacheMaxCacheableEntrySizeRatio:");
}

- (void)setUrlCacheMemoryCapacity:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"urlCacheMemoryCapacity"];
}

- (void)setUrlCacheMaxCacheableEntrySizeRatio:(double)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithDouble:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"urlCacheMaxCacheableEntrySizeRatio"];
}

- (void)setUrlCacheDiskCapacity:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"urlCacheDiskCapacity"];
}

+ (id)loadURLEventPromiseWithContext:(id)a3
{
  id v4 = a3;
  int64_t v5 = [a1 loadURLTopicFromContext:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__AMSMetricsLoadURLEvent_loadURLEventPromiseWithContext___block_invoke;
  v9[3] = &unk_1E559E640;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 thenWithBlock:v9];

  return v7;
}

+ (id)loadURLTopicFromContext:(id)a3
{
  id v4 = [a3 metricsDictionaryPromise];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__AMSMetricsLoadURLEvent_loadURLTopicFromContext___block_invoke;
  v7[3] = &__block_descriptor_40_e46___AMSPromise_24__0__NSDictionary_8__NSError_16l;
  v7[4] = a1;
  int64_t v5 = [v4 continueWithBlock:v7];

  return v5;
}

+ (id)_resolvedIPAddressFromTask:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = [a3 response];
  uint64_t v4 = [v3 _CFURLResponse];

  if (v4 && (CFDataRef v5 = (const __CFData *)CFURLResponseCopyPeerAddress()) != 0)
  {
    CFDataRef v6 = v5;
    BytePtr = CFDataGetBytePtr(v5);
    socklen_t v8 = *BytePtr;
    double v9 = (char *)v12 - (((_WORD)v8 + 15) & 0x1F0);
    inet_ntop(BytePtr[1], BytePtr + 4, v9, v8);
    id v10 = [NSString stringWithCString:v9 encoding:1];
    CFRelease(v6);
  }
  else
  {
    id v10 = 0;
  }
  return v10;
}

uint64_t __58__AMSMetricsLoadURLEvent__prepareEventPromiseWithContext___block_invoke_379(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = a2;
    [v3 setNetworkQualityReports:v4];
    CFDataRef v5 = +[AMSNetworkQualityInquiry reportForTaskTimingData:*(void *)(a1 + 40) fromReports:v4];

    CFDataRef v6 = [v5 objectForKeyedSubscript:@"interface"];
    [*(id *)(a1 + 32) setRadioType:v6];

    id v7 = [v5 objectForKeyedSubscript:@"radioTechnology"];
    [*(id *)(a1 + 32) setRadioTechnology:v7];
  }
  socklen_t v8 = [*(id *)(a1 + 48) metricsOverlay];
  [*(id *)(a1 + 32) setMetricsOverlay:v8];

  double v9 = *(void **)(a1 + 56);
  return [v9 finishWithSuccess];
}

- (void)setMetricsOverlay:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  CFDataRef v6 = v5;
  if (!v5
    || ([v5 allKeys],
        id v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 count],
        v7,
        !v8))
  {
    metricsOverlay = self->_metricsOverlay;
    self->_metricsOverlay = 0;

    goto LABEL_22;
  }
  double v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v6];
  id v10 = [v9 objectForKey:@"topic"];
  if (v10)
  {

LABEL_7:
    [v9 removeObjectForKey:@"topic"];
    [v9 removeObjectForKey:0x1EDCAA328];
    id v13 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    double v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = AMSLogKey();
      uint64_t v16 = NSString;
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = v17;
      if (v15)
      {
        uint64_t v3 = AMSLogKey();
        [v16 stringWithFormat:@"%@: [%@] ", v18, v3];
      }
      else
      {
        [v16 stringWithFormat:@"%@: ", v17];
      }
      id v19 = (AMSMetricsLoadURLEvent *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v26 = v19;
      _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Removing topic from overlay", buf, 0xCu);
      if (v15)
      {

        id v19 = (AMSMetricsLoadURLEvent *)v3;
      }
    }
    goto LABEL_17;
  }
  id v12 = [v9 objectForKey:0x1EDCAA328];

  if (v12) {
    goto LABEL_7;
  }
LABEL_17:
  v20 = (NSDictionary *)[v9 copy];
  uint64_t v21 = self->_metricsOverlay;
  self->_metricsOverlay = v20;

  __int16 v22 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v22)
  {
    __int16 v22 = +[AMSLogConfig sharedConfig];
  }
  v23 = [v22 OSLogObject];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    __int16 v24 = AMSHashIfNeeded(self->_metricsOverlay);
    *(_DWORD *)buf = 138543618;
    uint64_t v26 = self;
    __int16 v27 = 2114;
    v28 = v24;
    _os_log_impl(&dword_18D554000, v23, OS_LOG_TYPE_INFO, "%{public}@: Adding metrics overlay %{public}@", buf, 0x16u);
  }
  [(AMSMetricsEvent *)self addPropertiesWithDictionary:self->_metricsOverlay];

LABEL_22:
}

- (void)setRadioType:(id)a3
{
}

- (void)setRadioTechnology:(id)a3
{
}

- (void)setNetworkQualityReports:(id)a3
{
}

void __64__AMSMetricsLoadURLEvent__timingDataMetricToServerTimeInterval___block_invoke()
{
  id v2 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:0.0];
  v0 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
  [v2 timeIntervalSinceDate:v0];
  _MergedGlobals_132 = v1;
}

id __50__AMSMetricsLoadURLEvent_loadURLTopicFromContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = +[AMSLogConfig sharedURLLoadingConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    CFDataRef v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = AMSLogKey();
      int v20 = 138543874;
      uint64_t v21 = v7;
      __int16 v22 = 2114;
      v23 = v8;
      __int16 v24 = 2114;
      id v25 = v4;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] error getting load url metrics bag [%{public}@]", (uint8_t *)&v20, 0x20u);
    }
    double v9 = +[AMSPromise promiseWithResult:@"xp_amp_clientperf"];
  }
  else
  {
    id v10 = [a2 objectForKeyedSubscript:@"performance"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v11 = v10;
    }
    else {
      id v11 = 0;
    }

    id v12 = [v11 objectForKeyedSubscript:@"loadUrlTopic"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    if ([(__CFString *)v13 length])
    {
      double v14 = v13;
    }
    else
    {
      id v15 = +[AMSLogConfig sharedURLLoadingConfig];
      if (!v15)
      {
        id v15 = +[AMSLogConfig sharedConfig];
      }
      uint64_t v16 = [v15 OSLogObject];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v17 = objc_opt_class();
        uint64_t v18 = AMSLogKey();
        int v20 = 138543618;
        uint64_t v21 = v17;
        __int16 v22 = 2114;
        v23 = v18;
        _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] No loadUrlTopic in metrics bag", (uint8_t *)&v20, 0x16u);
      }
      double v14 = @"xp_amp_clientperf";
    }
    double v9 = +[AMSPromise promiseWithResult:v14];
  }
  return v9;
}

- (AMSMetricsLoadURLEvent)initWithContext:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSMetricsLoadURLEvent;
  id v5 = [(AMSMetricsEvent *)&v9 initWithTopic:@"xp_amp_clientperf"];
  CFDataRef v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(AMSMetricsLoadURLEvent *)v5 _prepareEventPromiseWithContext:v4];
    [v7 waitUntilFinished];
  }
  return v6;
}

+ (id)_hostnameFrom:(id)a3
{
  id v3 = a3;
  id v4 = [v3 _establishmentReport];

  if (v4)
  {
    id v5 = [v3 _establishmentReport];
    CFDataRef v6 = nw_establishment_report_copy_proxy_endpoint(v5);

    if (v6 && nw_endpoint_get_type(v6) == nw_endpoint_type_host)
    {
      uint64_t v7 = [NSString stringWithCString:nw_endpoint_get_hostname(v6) encoding:4];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)_isAnEdgeRelayServer:(id)a3 domains:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v15;
      id v11 = (void *)MEMORY[0x1E4F1CC38];
LABEL_4:
      uint64_t v12 = 0;
      while (1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        if (objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "isEqualToString:", v5, (void)v14)) {
          break;
        }
        if (v9 == ++v12)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      id v11 = 0;
    }
  }
  else if ([@"tether.edge.apple" isEqualToString:v5])
  {
    id v11 = (void *)MEMORY[0x1E4F1CC38];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (BOOL)shouldCollectMetricsForContext:(id)a3
{
  id v3 = [a1 shouldCollectMetricsPromiseForContext:a3];
  id v4 = [v3 resultWithError:0];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (NSString)appleTimingApp
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"appleTimingApp"];
}

- (BOOL)apsRelayAttempted
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"apsRelayAttempted"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)apsRelayDidFallback
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"apsRelayDidFallback"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)apsRelaySucceeded
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"apsRelaySucceeded"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)buildVariant
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"buildVariant"];
}

- (BOOL)cachedResponse
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"cachedResponse"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)cellularDataBearerTechnology
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"cellularDataBearerTechnology"];
}

- (NSString)clientCorrelationKey
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"clientCorrelationKey"];
}

- (NSString)clientError
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"clientError"];
}

- (double)connectionEndTime
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"connectionEndTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (NSString)connectionInterface
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"connectionInterface"];
}

- (BOOL)connectionReused
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"connectionReused"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (unint64_t)connectionStartNStatRXBytes
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"connectionStartNStatRXBytes"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)connectionStartNStatTXBytes
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"connectionStartNStatTXBytes"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)connectionStopNStatRXBytes
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"connectionStopNStatRXBytes"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)connectionStopNStatTXBytes
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"connectionStopNStatTXBytes"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (double)connectionStartTime
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"connectionStartTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (NSString)connectionType
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"connectionType"];
}

- (NSString)DNSServers
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"dnsServersIPAddresses"];
}

- (BOOL)isDNUSubmissionAllowed
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"DNUSubmissionAllowed"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (double)domainLookupEndTime
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"domainLookupEndTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (double)domainLookupStartTime
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"domainLookupStartTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (NSString)edgeNodeCacheStatus
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"edgeNodeCacheStatus"];
}

- (NSNumber)edgeRelayWasUsed
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"edgeRelayWasUsed"];
}

- (NSString)environmentDataCenter
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"environmentDataCenter"];
}

- (double)fetchStartTime
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"fetchStartTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (NSString)networkProtocolName
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"networkProtocolName"];
}

- (NSArray)networkQualityReports
{
  return (NSArray *)[(AMSMetricsEvent *)self propertyForBodyKey:@"networkQualityReports"];
}

- (NSString)originalApp
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"app"];
}

- (NSString)radioTechnology
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"radioTechnology"];
}

- (NSString)radioType
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"radioType"];
}

- (unint64_t)redirectCount
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"redirectCount"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (double)redirectEndTime
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"redirectEndTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (double)redirectStartTime
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"redirectStartTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (unint64_t)requestMessageSize
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"requestMessageSize"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (double)requestStartTime
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"requestStartTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (NSString)requestURL
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"requestUrl"];
}

- (NSString)resolvedIPAddress
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"resolvedIPAddress"];
}

- (NSString)responseDate
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"responseDate"];
}

- (double)responseEndTime
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"responseEndTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (unint64_t)responseMessageSize
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"responseMessageSize"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)responseMessageSizeUncompressed
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"responseMessageSizeUncompressed"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (double)responseStartTime
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"responseStartTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (double)secureConnectionStartTime
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"secureConnectionStartTime"];
  +[AMSMetrics timeIntervalFromServerTime:v2];
  double v4 = v3;

  return v4;
}

- (int64_t)statusCode
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"statusCode"];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (BOOL)TFOEnabled
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"TFOEnabled"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)TIDState
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"tidState"];
}

- (BOOL)TLSSessionTickets
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"TLSSessionTickets"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (unint64_t)urlCacheDiskCapacity
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"urlCacheDiskCapacity"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (unint64_t)urlCacheMemoryCapacity
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"urlCacheMemoryCapacity"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (double)urlCacheMaxCacheableEntrySizeRatio
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"urlCacheMaxCacheableEntrySizeRatio"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (NSString)wt
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"wt"];
}

- (double)xpSessionDuration
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"xpSessionDuration"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (BOOL)xpSamplingForced
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"xpSamplingForced"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (double)xpSamplingPercentageUsers
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"xpSamplingPercentageUsers"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (double)xpSamplingPercentageCachedResponses
{
  id v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"xpSamplingPercentageCachedResponses"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (NSString)xxdc
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"XXDC"];
}

- (void)setConnectionStartNStatRXBytes:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"connectionStartNStatRXBytes"];
}

- (void)setConnectionStartNStatTXBytes:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"connectionStartNStatTXBytes"];
}

- (void)setConnectionStopNStatRXBytes:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"connectionStopNStatRXBytes"];
}

- (void)setConnectionStopNStatTXBytes:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"connectionStopNStatTXBytes"];
}

- (void)setXpSamplingForced:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"xpSamplingForced"];
}

void __60__AMSMetricsLoadURLEvent__fetchNetworkQualityReportsPromise__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  double v3 = +[AMSLogConfig sharedURLLoadingConfig];
  if (!v3)
  {
    double v3 = +[AMSLogConfig sharedConfig];
  }
  id v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    char v5 = objc_opt_class();
    id v6 = v5;
    id v7 = AMSLogableError(v2);
    int v8 = 138543618;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v7;
    _os_log_impl(&dword_18D554000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Metrics network inquiry error occurred. Error: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (NSDictionary)metricsOverlay
{
  return self->_metricsOverlay;
}

@end