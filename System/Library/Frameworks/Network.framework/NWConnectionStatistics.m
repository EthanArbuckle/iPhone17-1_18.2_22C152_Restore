@interface NWConnectionStatistics
+ (id)protocolToTransportProtocolString:(unsigned int)a3;
- (BOOL)cellularFallback;
- (BOOL)cellularRrcConnected;
- (BOOL)connected;
- (BOOL)delegated;
- (BOOL)dnsAnswersCached;
- (BOOL)fallbackEligible;
- (BOOL)kernelReportedStalls;
- (BOOL)kernelReportingConnectionStalled;
- (BOOL)kernelReportingReadStalled;
- (BOOL)kernelReportingWriteStalled;
- (BOOL)tcpFastOpen;
- (BOOL)tls13Configured;
- (BOOL)tlsHandshakeTimedOut;
- (BOOL)tlsSucceeded;
- (NSArray)activities;
- (NSArray)externallyVisibleActivityUUIDs;
- (NSDictionary)deviceReport;
- (NSDictionary)layer2Report;
- (NSMutableDictionary)dictionaryReport;
- (NSString)bundleID;
- (NSString)clientIdentifier;
- (NSString)effectiveBundleID;
- (NSString)sourceIdentifier;
- (NSUUID)connectionUUID;
- (NSUUID)externallyVisibleConnectionUUID;
- (NSUUID)externallyVisibleParentUUID;
- (NSUUID)parentUUID;
- (NWConnectionStatistics)initWithJSONData:(id)a3;
- (NWConnectionStatistics)initWithTCPReport:(netcore_stats_tcp_report *)a3 length:(unint64_t)a4 clientIdentifier:(id)a5 sourceIdentifier:(id)a6;
- (id)_createDataUsageSnapshotDictionaryFromStruct:(const netcore_stats_data_usage_snapshot *)a3;
- (id)_createFallbackReportDictionaryFromStruct:(const netcore_stats_tcp_cell_fallback_report *)a3;
- (id)_createStatisticsReportDictionaryFromStruct:(const netcore_stats_tcp_statistics_report *)a3;
- (int)connectedInterfaceType;
- (int)interfaceType;
- (netcore_stats_tcp_report)report;
- (unint64_t)bytesDuplicate;
- (unint64_t)bytesIn;
- (unint64_t)bytesOOO;
- (unint64_t)bytesOut;
- (unint64_t)bytesRetransmitted;
- (unint64_t)packetsDuplicate;
- (unint64_t)packetsIn;
- (unint64_t)packetsOOO;
- (unint64_t)packetsOut;
- (unint64_t)packetsRetransmitted;
- (unsigned)connectionEstablishmentTimeMsecs;
- (unsigned)connectionReportReason;
- (unsigned)dnsResolvedTimeMsecs;
- (unsigned)flowDurationMsecs;
- (unsigned)metricType;
- (unsigned)tcpAppDataStallTimerMsecs;
- (unsigned)tcpAppReportingDataStallCount;
- (unsigned)tcpBetterRouteEventCount;
- (unsigned)tcpConnectionReuseCount;
- (unsigned)tcpRTTBestMsecs;
- (unsigned)tcpRTTCurrentMsecs;
- (unsigned)tcpRTTSmoothedMsecs;
- (unsigned)tcpRTTVariance;
- (unsigned)tcpSynRetransmissionCount;
- (unsigned)timeToConnectionEstablishmentMsecs;
- (unsigned)timeToConnectionStartMsecs;
- (unsigned)timeToDnsResolvedMsecs;
- (unsigned)timeToDnsStartMsecs;
- (unsigned)trafficClass;
- (void)setActivities:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDeviceReport:(id)a3;
- (void)setDictionaryReport:(id)a3;
- (void)setEffectiveBundleID:(id)a3;
- (void)setExternallyVisibleActivityUUIDs:(id)a3;
- (void)setExternallyVisibleConnectionUUID:(id)a3;
- (void)setExternallyVisibleParentUUID:(id)a3;
- (void)setLayer2Report:(id)a3;
- (void)setMetricType:(unsigned __int8)a3;
- (void)setReport:(netcore_stats_tcp_report *)a3;
- (void)setSourceIdentifier:(id)a3;
@end

@implementation NWConnectionStatistics

- (NSMutableDictionary)dictionaryReport
{
  uint64_t v2 = MEMORY[0x1F4188790](self);
  uint64_t v260 = *MEMORY[0x1E4F143B8];
  v4 = (id *)(v2 + 80);
  id v3 = *(id *)(v2 + 80);
  if (v3) {
    goto LABEL_2;
  }
  v7 = (void *)v2;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v5)
  {
    v8 = v5;
    long long v239 = 0u;
    long long v238 = 0u;
    long long v237 = 0u;
    long long v236 = 0u;
    long long v235 = 0u;
    long long v234 = 0u;
    long long v233 = 0u;
    long long v232 = 0u;
    long long v231 = 0u;
    long long v230 = 0u;
    long long v229 = 0u;
    long long v228 = 0u;
    long long v227 = 0u;
    long long v226 = 0u;
    long long v225 = 0u;
    long long v224 = 0u;
    long long v223 = 0u;
    long long v222 = 0u;
    long long v221 = 0u;
    long long v220 = 0u;
    long long v219 = 0u;
    long long v218 = 0u;
    long long v217 = 0u;
    long long v216 = 0u;
    long long v215 = 0u;
    long long v214 = 0u;
    long long v213 = 0u;
    long long v212 = 0u;
    long long v211 = 0u;
    long long v210 = 0u;
    long long v209 = 0u;
    long long v208 = 0u;
    [v7 report];
    if (v251[1081])
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      if (!v9)
      {
LABEL_63:

        id v5 = 0;
        goto LABEL_3;
      }
      v10 = NSNumber;
      [v7 report];
      v11 = [v10 numberWithBool:v203];
      [v9 setObject:v11 forKeyedSubscript:@"delegated"];

      [v7 report];
      if ((v202 - 2) > 3) {
        v12 = @"NETCORE_STATS_TCP_REPORT_REASON_FALLBACK_SIGNAL";
      }
      else {
        v12 = off_1E52489A8[v202 - 2];
      }
      [v9 setObject:v12 forKeyedSubscript:@"reportReason"];
      v15 = [v7 clientIdentifier];
      [v9 setObject:v15 forKeyedSubscript:@"clientIdentifier"];

      v16 = [v9 objectForKeyedSubscript:@"delegated"];

      if (v16)
      {
        v17 = [v7 sourceIdentifier];
        [v9 setObject:v17 forKeyedSubscript:@"sourceAppIdentifier"];
      }
      v18 = [v7 _createStatisticsReportDictionaryFromStruct:&v208];
      [v9 setObject:v18 forKeyedSubscript:@"connectionStatisticsReport"];

      v19 = [v9 objectForKeyedSubscript:@"connectionStatisticsReport"];

      if (v19)
      {
        memset(v258, 0, 512);
        [v7 report];
        v20 = [v7 _createFallbackReportDictionaryFromStruct:(char *)&v258[13] + 8];
        [v9 setObject:v20 forKeyedSubscript:@"cellularFallbackReport"];

        v21 = [v9 objectForKeyedSubscript:@"cellularFallbackReport"];

        if (v21)
        {
          v22 = [v7 layer2Report];

          if (v22)
          {
            v23 = [v7 layer2Report];
            v24 = [v23 objectForKeyedSubscript:@"cellularRadioTechnology"];
            [v9 objectForKeyedSubscript:@"cellularFallbackReport"];
            v26 = v25 = v7;
            [v26 setObject:v24 forKeyedSubscript:@"cellularRadioTechnology"];

            v27 = [v25 layer2Report];
            v28 = [v27 objectForKeyedSubscript:@"wifiRadioTechnology"];
            v29 = [v9 objectForKeyedSubscript:@"cellularFallbackReport"];
            [v29 setObject:v28 forKeyedSubscript:@"wifiRadioTechnology"];

            v7 = v25;
            v30 = [v25 layer2Report];
            v31 = [v30 objectForKeyedSubscript:@"cellularBand"];
            v32 = [v9 objectForKeyedSubscript:@"cellularFallbackReport"];
            [v32 setObject:v31 forKeyedSubscript:@"cellularBand"];

            pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
            networkd_settings_init();
            v33 = (id)gLogObj;
            v34 = v9;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              v35 = [v9 objectForKeyedSubscript:@"cellularFallbackReport"];
              LODWORD(v256[0]) = 136446466;
              *(void *)((char *)v256 + 4) = "-[NWConnectionStatistics dictionaryReport]";
              WORD6(v256[0]) = 2114;
              *(void *)((char *)v256 + 14) = v35;
              _os_log_impl(&dword_1830D4000, v33, OS_LOG_TYPE_DEBUG, "%{public}s Added radio technology and cellular band to legacy cellular fallback report: %{public}@", (uint8_t *)v256, 0x16u);
            }
          }
          else
          {
            v34 = v9;
            v33 = __nwlog_obj();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              LODWORD(v256[0]) = 136446210;
              *(void *)((char *)v256 + 4) = "-[NWConnectionStatistics dictionaryReport]";
              _os_log_impl(&dword_1830D4000, v33, OS_LOG_TYPE_ERROR, "%{public}s Could not add radio technology and cellular band as layer2Report is nil", (uint8_t *)v256, 0xCu);
            }
          }

          id v63 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v7 report];
          if (v201)
          {
            unint64_t v64 = 0;
            v65 = &v257;
            while (1)
            {
              memset(v256, 0, 512);
              [v7 report];
              uint64_t v66 = [v7 _createStatisticsReportDictionaryFromStruct:v65];
              if (!v66) {
                break;
              }
              v67 = (void *)v66;
              [v63 addObject:v66];

              ++v64;
              [v7 report];
              v65 += 27;
              if (v64 >= v201) {
                goto LABEL_75;
              }
            }
            v70 = __nwlog_obj();
            if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
            {
              v71 = [v7 clientIdentifier];
              int v252 = 136446466;
              v253 = "-[NWConnectionStatistics dictionaryReport]";
              __int16 v254 = 2114;
              v255 = v71;
              _os_log_impl(&dword_1830D4000, v70, OS_LOG_TYPE_ERROR, "%{public}s failing to create a fallback report for %{public}@", (uint8_t *)&v252, 0x16u);
            }
            id v9 = v34;
            goto LABEL_63;
          }
LABEL_75:
          [v34 setObject:v63 forKeyedSubscript:@"connectionAttemptStatisticsReports"];
          [v7 setMetricType:1];
          objc_storeStrong(v4, v34);
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          v68 = (id)gLogObj;
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
          {
            id v69 = *v4;
            LODWORD(v256[0]) = 136446466;
            *(void *)((char *)v256 + 4) = "-[NWConnectionStatistics dictionaryReport]";
            WORD6(v256[0]) = 2114;
            *(void *)((char *)v256 + 14) = v69;
            _os_log_impl(&dword_1830D4000, v68, OS_LOG_TYPE_DEBUG, "%{public}s Generated legacy tcp_connection dictionary report: %{public}@", (uint8_t *)v256, 0x16u);
          }

LABEL_180:
          id v3 = *v4;
LABEL_2:
          id v5 = v3;
          goto LABEL_3;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v53 = (id)gLogObj;
        if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          goto LABEL_62;
        }
        v54 = [v7 clientIdentifier];
        LODWORD(v256[0]) = 136446466;
        *(void *)((char *)v256 + 4) = "-[NWConnectionStatistics dictionaryReport]";
        WORD6(v256[0]) = 2114;
        *(void *)((char *)v256 + 14) = v54;
        v55 = "%{public}s failing to create a fallback report for %{public}@";
        v56 = (uint8_t *)v256;
      }
      else
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        v53 = (id)gLogObj;
        if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
LABEL_62:

          goto LABEL_63;
        }
        v54 = [v7 clientIdentifier];
        LODWORD(v258[0]) = 136446466;
        *(void *)((char *)v258 + 4) = "-[NWConnectionStatistics dictionaryReport]";
        WORD6(v258[0]) = 2114;
        *(void *)((char *)v258 + 14) = v54;
        v55 = "%{public}s failing to allocate NWLibnetcoreConnectionStatisticsReportDictionary for client %{public}@";
        v56 = (uint8_t *)v258;
      }
      _os_log_impl(&dword_1830D4000, v53, OS_LOG_TYPE_ERROR, v55, v56, 0x16u);

      goto LABEL_62;
    }
    v199 = v4;
    v13 = [NSNumber numberWithUnsignedInt:DWORD1(v226)];
    [v8 setObject:v13 forKeyedSubscript:@"connectionReportReason"];

    if (DWORD1(v228) <= 3) {
      [v8 setObject:off_1E5248728[DWORD1(v228)] forKeyedSubscript:@"connectionMode"];
    }
    if ((DWORD2(v228) - 1) > 5) {
      v14 = @"NW_APPLE_HOST_NONE";
    }
    else {
      v14 = off_1E5248748[DWORD2(v228) - 1];
    }
    [v8 setObject:v14 forKeyedSubscript:@"appleHost"];
    if ((HIDWORD(v228) - 1) > 8) {
      v36 = @"NW_APPLE_APP_NONE";
    }
    else {
      v36 = off_1E5248778[HIDWORD(v228) - 1];
    }
    [v8 setObject:v36 forKeyedSubscript:@"appleApp"];
    v37 = [NSNumber numberWithInt:(v247 >> 23) & 1];
    [v8 setObject:v37 forKeyedSubscript:@"isDaemon"];

    if ((v247 & 0x800000) != 0)
    {
      v38 = [v7 clientIdentifier];
      [v8 setObject:v38 forKeyedSubscript:@"processName"];
    }
    v39 = (void *)[[NSString alloc] initWithCString:&v240 encoding:134217984];
    [v8 setObject:v39 forKeyedSubscript:@"bundleID"];

    v40 = (void *)[[NSString alloc] initWithCString:&v241 encoding:134217984];
    [v8 setObject:v40 forKeyedSubscript:@"effectiveBundleID"];

    v41 = [NSNumber numberWithUnsignedInt:DWORD2(v225)];
    [v8 setObject:v41 forKeyedSubscript:@"secondsSinceInterfaceChange"];

    if ((DWORD2(v229) - 1) > 4) {
      v42 = @"NW_STACK_LEVEL_UNDEFINED";
    }
    else {
      v42 = off_1E52487C0[DWORD2(v229) - 1];
    }
    [v8 setObject:v42 forKeyedSubscript:@"stackLevel"];
    v43 = +[NWConnectionStatistics protocolToTransportProtocolString:HIDWORD(v225)];
    [v8 setObject:v43 forKeyedSubscript:@"transportProtocol"];

    if ((v226 - 1) > 3) {
      v44 = @"NW_DNS_PROTOCOL_UNKNOWN";
    }
    else {
      v44 = off_1E52487E8[(v226 - 1)];
    }
    [v8 setObject:v44 forKeyedSubscript:@"dnsProtocol"];
    if ((v229 - 1) > 2) {
      v45 = @"NW_DNS_PROVIDER_UNKNOWN";
    }
    else {
      v45 = off_1E5248808[(v229 - 1)];
    }
    [v8 setObject:v45 forKeyedSubscript:@"dnsProvider"];
    v46 = [NSNumber numberWithInt:(v247 >> 29) & 1];
    [v8 setObject:v46 forKeyedSubscript:@"svcbRequested"];

    v47 = [NSNumber numberWithInt:(v247 >> 30) & 1];
    [v8 setObject:v47 forKeyedSubscript:@"svcbReceived"];

    v48 = [NSNumber numberWithInt:v247 >> 31];
    [v8 setObject:v48 forKeyedSubscript:@"svcbDoHURI"];

    v49 = [NSNumber numberWithInt:(v247 >> 2) & 1];
    [v8 setObject:v49 forKeyedSubscript:@"triggeredPath"];

    v50 = [NSNumber numberWithInt:(v247 >> 3) & 1];
    [v8 setObject:v50 forKeyedSubscript:@"systemProxyConfigured"];

    v51 = [NSNumber numberWithInt:(v247 >> 4) & 1];
    [v8 setObject:v51 forKeyedSubscript:@"customProxyConfigured"];

    v52 = [v8 objectForKeyedSubscript:@"systemProxyConfigured"];
    if (v52)
    {
    }
    else
    {
      v57 = [v8 objectForKeyedSubscript:@"customProxyConfigure"]);

      if (!v57)
      {
LABEL_87:
        if ((v245 - 1) > 3u) {
          v72 = @"NW_PROXY_RESULT_NONE";
        }
        else {
          v72 = off_1E5248820[(v245 - 1)];
        }
        [v8 setObject:v72 forKeyedSubscript:@"proxyResult"];
        v73 = [NSNumber numberWithInt:(v247 >> 25) & 1];
        [v8 setObject:v73 forKeyedSubscript:@"isPathExpensive"];

        v74 = [NSNumber numberWithInt:(v247 >> 26) & 1];
        [v8 setObject:v74 forKeyedSubscript:@"isPathConstrained"];

        v75 = [NSNumber numberWithInt:(v247 >> 27) & 1];
        [v8 setObject:v75 forKeyedSubscript:@"prohibitsExpensive"];

        v76 = [NSNumber numberWithInt:(v247 >> 28) & 1];
        [v8 setObject:v76 forKeyedSubscript:@"prohibitsConstrained"];

        v77 = [NSNumber numberWithInt:v248 & 1];
        [v8 setObject:v77 forKeyedSubscript:@"isProbe"];

        v78 = [NSNumber numberWithInt:(v247 >> 18) & 1];
        [v8 setObject:v78 forKeyedSubscript:@"ipv4Available"];

        v79 = [NSNumber numberWithInt:(v247 >> 19) & 1];
        [v8 setObject:v79 forKeyedSubscript:@"ipv6Available"];

        v80 = [NSNumber numberWithUnsignedInt:v225];
        [v8 setObject:v80 forKeyedSubscript:@"ipv4DNSServerCount"];

        v81 = [NSNumber numberWithUnsignedInt:DWORD1(v225)];
        [v8 setObject:v81 forKeyedSubscript:@"ipv6DNSServerCount"];

        v82 = [NSNumber numberWithInt:(v247 >> 5) & 1];
        [v8 setObject:v82 forKeyedSubscript:@"fallbackEligible"];

        unsigned int v83 = v247;
        if ((v247 & 0x20) != 0)
        {
          v84 = [NSNumber numberWithInt:(v247 >> 6) & 1];
          [v8 setObject:v84 forKeyedSubscript:@"weakFallback"];

          v85 = [NSNumber numberWithInt:(v247 >> 7) & 1];
          [v8 setObject:v85 forKeyedSubscript:@"preferFallback"];

          v86 = [NSNumber numberWithInt:(v247 >> 8) & 1];
          [v8 setObject:v86 forKeyedSubscript:@"usedFallback"];

          unsigned int v83 = v247;
        }
        v87 = [NSNumber numberWithInt:(v83 >> 9) & 1];
        [v8 setObject:v87 forKeyedSubscript:@"resolutionRequired"];

        v88 = [NSNumber numberWithInt:(v247 >> 10) & 1];
        [v8 setObject:v88 forKeyedSubscript:@"tlsConfigured"];

        v89 = [NSNumber numberWithInt:(v247 >> 12) & 1];
        [v8 setObject:v89 forKeyedSubscript:@"tfoConfigured"];

        v90 = [NSNumber numberWithInt:(v247 >> 20) & 1];
        [v8 setObject:v90 forKeyedSubscript:@"tfoUsed"];

        v91 = [NSNumber numberWithInt:(v247 >> 13) & 1];
        [v8 setObject:v91 forKeyedSubscript:@"multipathConfigured"];

        v92 = [NSNumber numberWithUnsignedInt:v222];
        [v8 setObject:v92 forKeyedSubscript:@"trafficClass"];

        v93 = @"NW_MPTCP_VERSION_UNKNOWN";
        if (BYTE12(v229) == 1) {
          v93 = @"NW_MPTCP_VERSION_0";
        }
        if (BYTE12(v229) == 2) {
          v94 = @"NW_MPTCP_VERSION_1";
        }
        else {
          v94 = v93;
        }
        [v8 setObject:v94 forKeyedSubscript:@"mptcpVersion"];
        v95 = @"NW_FAILURE_REASON_PATH";
        switch(DWORD1(v227))
        {
          case 0:
            goto LABEL_102;
          case 2:
            v95 = @"NW_FAILURE_REASON_RESOLVER";
            goto LABEL_101;
          case 3:
            v95 = @"NW_FAILURE_REASON_FLOW";
            goto LABEL_101;
          case 4:
            v95 = @"NW_FAILURE_REASON_TLS";
            goto LABEL_101;
          default:
LABEL_101:
            [v8 setObject:v95 forKeyedSubscript:@"failureReason"];
LABEL_102:
            __int16 v96 = v247;
            if ((v247 & 4) != 0)
            {
              v104 = [NSNumber numberWithUnsignedInt:DWORD1(v222)];
              [v8 setObject:v104 forKeyedSubscript:@"pathTriggerMilliseconds"];

              __int16 v96 = v247;
              if ((v247 & 0x200) == 0)
              {
LABEL_104:
                if ((v96 & 0x18) == 0) {
                  goto LABEL_106;
                }
                goto LABEL_105;
              }
            }
            else if ((v247 & 0x200) == 0)
            {
              goto LABEL_104;
            }
            v105 = [NSNumber numberWithUnsignedInt:DWORD2(v222)];
            [v8 setObject:v105 forKeyedSubscript:@"resolutionMilliseconds"];

            __int16 v96 = v247;
            if ((v247 & 0x18) == 0)
            {
LABEL_106:
              if ((v96 & 0x4000) != 0)
              {
                v98 = [NSNumber numberWithUnsignedInt:v223];
                [v8 setObject:v98 forKeyedSubscript:@"flowConnectMilliseconds"];

                v99 = [NSNumber numberWithUnsignedInt:DWORD2(v223)];
                [v8 setObject:v99 forKeyedSubscript:@"flowDurationMilliseconds"];

                __int16 v96 = v247;
              }
              if (v96 < 0)
              {
                v100 = [NSNumber numberWithUnsignedInt:DWORD1(v223)];
                [v8 setObject:v100 forKeyedSubscript:@"tlsMilliseconds"];
              }
              v101 = [NSNumber numberWithUnsignedLongLong:*((void *)&v219 + 1)];
              [v8 setObject:v101 forKeyedSubscript:@"attemptDelayMilliseconds"];

              v102 = [NSNumber numberWithUnsignedLongLong:(void)v220];
              [v8 setObject:v102 forKeyedSubscript:@"attemptEstablishmentMilliseconds"];

              if ((DWORD1(v229) - 1) > 6) {
                v103 = @"NW_TLS_VERSION_NONE";
              }
              else {
                v103 = off_1E5248840[DWORD1(v229) - 1];
              }
              [v8 setObject:v103 forKeyedSubscript:@"tlsVersion"];
              v106 = [NSNumber numberWithInt:(v247 >> 21) & 1];
              [v8 setObject:v106 forKeyedSubscript:@"tlsVersionTimeout"];

              v107 = [NSNumber numberWithInt:HIBYTE(v247) & 1];
              [v8 setObject:v107 forKeyedSubscript:@"tlsHandshakeTimedOut"];

              v108 = [NSNumber numberWithInt:HIBYTE(v248) & 1];
              [v8 setObject:v108 forKeyedSubscript:@"tlsECHEnabled"];

              v109 = [NSNumber numberWithUnsignedLongLong:(void)v219];
              [v8 setObject:v109 forKeyedSubscript:@"transformLastTimeoutMsecs"];

              v110 = +[NWConnectionStatistics protocolToTransportProtocolString:DWORD2(v226)];
              [v8 setObject:v110 forKeyedSubscript:@"transformFirstProtocol"];

              v111 = +[NWConnectionStatistics protocolToTransportProtocolString:HIDWORD(v226)];
              [v8 setObject:v111 forKeyedSubscript:@"transformConnectedProtocol"];

              v112 = [NSNumber numberWithUnsignedInt:v227];
              [v8 setObject:v112 forKeyedSubscript:@"transformConnectedProtocolIndex"];

              v113 = [NSNumber numberWithUnsignedInt:(v248 >> 2) & 1];
              [v8 setObject:v113 forKeyedSubscript:@"quicDeferred"];

              v114 = [NSNumber numberWithUnsignedInt:(v248 >> 3) & 1];
              [v8 setObject:v114 forKeyedSubscript:@"quicApplicationDeferred"];

              v115 = [NSNumber numberWithUnsignedInt:(v248 >> 4) & 1];
              [v8 setObject:v115 forKeyedSubscript:@"quicDenied"];

              v116 = [NSNumber numberWithUnsignedInt:(v248 >> 5) & 1];
              [v8 setObject:v116 forKeyedSubscript:@"quicAlternativePresent"];

              v117 = [NSNumber numberWithUnsignedInt:(v248 >> 6) & 1];
              [v8 setObject:v117 forKeyedSubscript:@"quicUpdatedAlternative"];

              v118 = [NSNumber numberWithUnsignedInt:(v248 >> 7) & 1];
              [v8 setObject:v118 forKeyedSubscript:@"quicSpeculativeAttempt"];

              if ((v243 - 1) > 8) {
                v119 = @"NW_CONNECTION_CLIENT_ACCURATE_ECN_INVALID";
              }
              else {
                v119 = off_1E5248878[v243 - 1];
              }
              [v8 setObject:v119 forKeyedSubscript:@"accurateECNClientState"];
              if ((v244 - 1) > 9) {
                v120 = @"NW_CONNECTION_SERVER_ACCURATE_ECN_INVALID";
              }
              else {
                v120 = off_1E52488C0[v244 - 1];
              }
              [v8 setObject:v120 forKeyedSubscript:@"accurateECNServerState"];
              v121 = [NSNumber numberWithInt:(v248 >> 10) & 1];
              [v8 setObject:v121 forKeyedSubscript:@"l4sEnabled"];

              v122 = [NSNumber numberWithUnsignedInt:HIDWORD(v223)];
              [v8 setObject:v122 forKeyedSubscript:@"ipv4AddressCount"];

              v123 = [NSNumber numberWithUnsignedInt:v224];
              [v8 setObject:v123 forKeyedSubscript:@"ipv6AddressCount"];

              v124 = [NSNumber numberWithInt:HIWORD(v247) & 1];
              [v8 setObject:v124 forKeyedSubscript:@"synthesizedIPv6Address"];

              v125 = [NSNumber numberWithInt:(v247 >> 17) & 1];
              [v8 setObject:v125 forKeyedSubscript:@"synthesizedExtraIPv6Address"];

              if (BYTE13(v229) == 30) {
                v126 = @"NW_ADDRESS_FAMILY_IPV6";
              }
              else {
                v126 = @"NW_ADDRESS_FAMILY_OTHER";
              }
              if (BYTE13(v229) == 2) {
                v127 = @"NW_ADDRESS_FAMILY_IPV4";
              }
              else {
                v127 = v126;
              }
              [v8 setObject:v127 forKeyedSubscript:@"firstAddressFamily"];
              if ((v247 & 0x4000) != 0)
              {
                if (BYTE14(v229) == 30) {
                  v128 = @"NW_ADDRESS_FAMILY_IPV6";
                }
                else {
                  v128 = @"NW_ADDRESS_FAMILY_OTHER";
                }
                if (BYTE14(v229) == 2) {
                  v129 = @"NW_ADDRESS_FAMILY_IPV4";
                }
                else {
                  v129 = v128;
                }
                [v8 setObject:v129 forKeyedSubscript:@"connectedAddressFamily"];
                v130 = [NSNumber numberWithUnsignedInt:DWORD1(v224)];
                [v8 setObject:v130 forKeyedSubscript:@"connectedAddressIndex"];

                if ((DWORD2(v227) - 1) > 3) {
                  v131 = @"INTERFACE_TYPE_OTHER";
                }
                else {
                  v131 = off_1E5248910[DWORD2(v227) - 1];
                }
                [v8 setObject:v131 forKeyedSubscript:@"connectedInterfaceType"];
                v132 = @"NW_INTERFACE_SUBTYPE_OTHER";
                v133 = @"NW_INTERFACE_SUBTYPE_COPROCESSOR";
                v134 = @"NW_INTERFACE_SUBTYPE_COMPANION";
                if (HIDWORD(v227) != 5001) {
                  v134 = @"NW_INTERFACE_SUBTYPE_OTHER";
                }
                if (HIDWORD(v227) != 4001) {
                  v133 = v134;
                }
                if (HIDWORD(v227) == 1002) {
                  v132 = @"NW_INTERFACE_SUBTYPE_WIFI_AWDL";
                }
                if (HIDWORD(v227) == 1001) {
                  v132 = @"NW_INTERFACE_SUBTYPE_WIFI_INFRASTRUCTURE";
                }
                if (SHIDWORD(v227) <= 4000) {
                  v135 = v132;
                }
                else {
                  v135 = v133;
                }
                [v8 setObject:v135 forKeyedSubscript:@"connectedInterfaceSubtype"];
                v136 = [NSNumber numberWithUnsignedInt:DWORD2(v224)];
                [v8 setObject:v136 forKeyedSubscript:@"connectionReuseCount"];

                v137 = [NSNumber numberWithUnsignedInt:HIDWORD(v224)];
                [v8 setObject:v137 forKeyedSubscript:@"dataStallCount"];

                v138 = [NSNumber numberWithUnsignedLongLong:(void)v208];
                [v8 setObject:v138 forKeyedSubscript:@"bytesIn"];

                v139 = [NSNumber numberWithUnsignedLongLong:*((void *)&v208 + 1)];
                [v8 setObject:v139 forKeyedSubscript:@"bytesOut"];

                v140 = [NSNumber numberWithUnsignedLongLong:(void)v209];
                [v8 setObject:v140 forKeyedSubscript:@"bytesDuplicate"];

                v141 = [NSNumber numberWithUnsignedLongLong:*((void *)&v209 + 1)];
                [v8 setObject:v141 forKeyedSubscript:@"bytesOutOfOrder"];

                v142 = [NSNumber numberWithUnsignedLongLong:(void)v210];
                [v8 setObject:v142 forKeyedSubscript:@"bytesRetransmitted"];

                v143 = [NSNumber numberWithUnsignedLongLong:*((void *)&v210 + 1)];
                [v8 setObject:v143 forKeyedSubscript:@"ecnCapablePacketsSent"];

                v144 = [NSNumber numberWithUnsignedLongLong:(void)v211];
                [v8 setObject:v144 forKeyedSubscript:@"ecnCapablePacketsAcked"];

                v145 = [NSNumber numberWithUnsignedLongLong:*((void *)&v211 + 1)];
                [v8 setObject:v145 forKeyedSubscript:@"ecnCapablePacketsMarked"];

                v146 = [NSNumber numberWithUnsignedLongLong:(void)v212];
                [v8 setObject:v146 forKeyedSubscript:@"ecnCapablePacketsLost"];

                v147 = [NSNumber numberWithUnsignedLongLong:*((void *)&v212 + 1)];
                [v8 setObject:v147 forKeyedSubscript:@"packetsIn"];

                v148 = [NSNumber numberWithUnsignedLongLong:(void)v213];
                [v8 setObject:v148 forKeyedSubscript:@"ect1PacketsIn"];

                v149 = [NSNumber numberWithUnsignedLongLong:*((void *)&v213 + 1)];
                [v8 setObject:v149 forKeyedSubscript:@"ect0PacketsIn"];

                v150 = [NSNumber numberWithUnsignedLongLong:(void)v214];
                [v8 setObject:v150 forKeyedSubscript:@"cePacketsIn"];

                v151 = [NSNumber numberWithUnsignedLongLong:*((void *)&v214 + 1)];
                [v8 setObject:v151 forKeyedSubscript:@"packetsOut"];

                v152 = [NSNumber numberWithUnsignedInt:DWORD2(v220)];
                [v8 setObject:v152 forKeyedSubscript:@"currentRTT"];

                v153 = [NSNumber numberWithUnsignedInt:HIDWORD(v220)];
                [v8 setObject:v153 forKeyedSubscript:@"smoothedRTT"];

                v154 = [NSNumber numberWithUnsignedInt:v221];
                [v8 setObject:v154 forKeyedSubscript:@"bestRTT"];

                v155 = [NSNumber numberWithUnsignedInt:DWORD1(v221)];
                [v8 setObject:v155 forKeyedSubscript:@"rTTvariance"];

                v156 = [NSNumber numberWithUnsignedInt:DWORD2(v221)];
                [v8 setObject:v156 forKeyedSubscript:@"synRetransmissionCount"];

                v157 = [NSNumber numberWithUnsignedLongLong:(void)v218];
                [v8 setObject:v157 forKeyedSubscript:@"estimatedUploadThroughput"];

                v158 = [NSNumber numberWithUnsignedLongLong:*((void *)&v218 + 1)];
                [v8 setObject:v158 forKeyedSubscript:@"estimatedDownloadThroughput"];
              }
              if (v242 - 1 > 4) {
                v159 = @"NW_PRIVACY_STANCE_UNKNOWN";
              }
              else {
                v159 = off_1E5248930[(v242 - 1)];
              }
              [v8 setObject:v159 forKeyedSubscript:@"privacyStance"];
              v198 = v7;
              if (v246 - 1 > 9) {
                v160 = @"UNKNOWN";
              }
              else {
                v160 = off_1E5248958[(v246 - 1)];
              }
              [v8 setObject:v160 forKeyedSubscript:@"privacyProxyClient"];
              v161 = [NSNumber numberWithInt:v247 & 1];
              [v8 setObject:v161 forKeyedSubscript:@"isKnownTracker"];

              v162 = [NSNumber numberWithInt:(v247 >> 1) & 1];
              [v8 setObject:v162 forKeyedSubscript:@"isThirdPartyWebContent"];

              v163 = [NSNumber numberWithUnsignedInt:(v248 >> 9) & 1];
              [v8 setObject:v163 forKeyedSubscript:@"isWebSearchContent"];

              id v200 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              for (uint64_t i = 0; i != 560; i += 56)
              {
                v165 = (char *)&v208 + i;
                if (*(_DWORD *)&v249[i] == -1) {
                  break;
                }
                id v166 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                v167 = [NSNumber numberWithInt:*((unsigned int *)v165 + 440)];
                [v166 setObject:v167 forKeyedSubscript:@"protocolIndex"];

                v168 = (void *)[[NSString alloc] initWithCString:v165 + 1712 encoding:134217984];
                [v166 setObject:v168 forKeyedSubscript:@"protocolName"];

                v169 = [NSNumber numberWithUnsignedLongLong:*((void *)v165 + 218)];
                [v166 setObject:v169 forKeyedSubscript:@"handshakeMilliseconds"];

                v170 = [NSNumber numberWithUnsignedLongLong:*((void *)v165 + 219)];
                [v166 setObject:v170 forKeyedSubscript:@"handshakeRTTMilliseconds"];

                [v200 addObject:v166];
              }
              [v8 setObject:v200 forKeyedSubscript:@"protocolEstablishmentReports"];
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v171 = (id)gLogObj;
              if (os_log_type_enabled(v171, OS_LOG_TYPE_DEBUG))
              {
                v172 = [v8 objectForKeyedSubscript:@"protocolEstablishmentReports"];
                LODWORD(v258[0]) = 136446466;
                *(void *)((char *)v258 + 4) = "-[NWConnectionStatistics dictionaryReport]";
                WORD6(v258[0]) = 2112;
                *(void *)((char *)v258 + 14) = v172;
                _os_log_impl(&dword_1830D4000, v171, OS_LOG_TYPE_DEBUG, "%{public}s Establishment reports: \n%@", (uint8_t *)v258, 0x16u);
              }
              id v173 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              v4 = v199;
              if (v250[0])
              {
                id v174 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                v175 = (void *)[[NSString alloc] initWithCString:v250 encoding:134217984];
                [v174 setObject:v175 forKeyedSubscript:@"proxyName"];

                [v173 addObject:v174];
                if (v251[0])
                {
                  id v176 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
                  v177 = (void *)[[NSString alloc] initWithCString:v251 encoding:134217984];
                  [v176 setObject:v177 forKeyedSubscript:@"proxyName"];

                  [v173 addObject:v176];
                }
              }
              [v8 setObject:v173 forKeyedSubscript:@"proxyHops"];
              v178 = [v7 externallyVisibleConnectionUUID];
              v179 = [v178 UUIDString];
              [v8 setObject:v179 forKeyedSubscript:@"connectionUUID"];

              v180 = [v7 externallyVisibleParentUUID];
              v181 = [v180 UUIDString];
              [v8 setObject:v181 forKeyedSubscript:@"parentUUID"];

              id v182 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              long long v204 = 0u;
              long long v205 = 0u;
              long long v206 = 0u;
              long long v207 = 0u;
              v183 = [v7 externallyVisibleActivityUUIDs];
              uint64_t v184 = [v183 countByEnumeratingWithState:&v204 objects:v259 count:16];
              if (v184)
              {
                uint64_t v185 = v184;
                uint64_t v186 = *(void *)v205;
                do
                {
                  for (uint64_t j = 0; j != v185; ++j)
                  {
                    if (*(void *)v205 != v186) {
                      objc_enumerationMutation(v183);
                    }
                    v188 = [*(id *)(*((void *)&v204 + 1) + 8 * j) UUIDString];
                    [v182 addObject:v188];
                  }
                  uint64_t v185 = [v183 countByEnumeratingWithState:&v204 objects:v259 count:16];
                }
                while (v185);
              }

              [v8 setObject:v182 forKeyedSubscript:@"activities"];
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v189 = (id)gLogObj;
              if (os_log_type_enabled(v189, OS_LOG_TYPE_DEBUG))
              {
                v190 = [v8 objectForKeyedSubscript:@"activities"];
                LODWORD(v258[0]) = 136446466;
                *(void *)((char *)v258 + 4) = "-[NWConnectionStatistics dictionaryReport]";
                WORD6(v258[0]) = 2112;
                *(void *)((char *)v258 + 14) = v190;
                _os_log_impl(&dword_1830D4000, v189, OS_LOG_TYPE_DEBUG, "%{public}s Activities array: \n%@", (uint8_t *)v258, 0x16u);
              }
              v191 = [NSNumber numberWithUnsignedInt:(v248 >> 1) & 1];
              [v8 setObject:v191 forKeyedSubscript:@"quicExperimentEnabled"];

              v192 = [v198 layer2Report];

              if (v192)
              {
                v193 = [v198 layer2Report];
                [v8 setObject:v193 forKeyedSubscript:@"l2Report"];
              }
              v194 = [v198 deviceReport];

              if (v194)
              {
                v195 = [v198 deviceReport];
                [v8 setObject:v195 forKeyedSubscript:@"deviceReport"];
              }
              [v198 setMetricType:2];
              objc_storeStrong(v199, v8);
              pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
              networkd_settings_init();
              v196 = (id)gLogObj;
              if (os_log_type_enabled(v196, OS_LOG_TYPE_DEBUG))
              {
                id v197 = *v199;
                LODWORD(v258[0]) = 136446466;
                *(void *)((char *)v258 + 4) = "-[NWConnectionStatistics dictionaryReport]";
                WORD6(v258[0]) = 2114;
                *(void *)((char *)v258 + 14) = v197;
                _os_log_impl(&dword_1830D4000, v196, OS_LOG_TYPE_DEBUG, "%{public}s Generated nw_connection report: %{public}@", (uint8_t *)v258, 0x16u);
              }

              v34 = v200;
              goto LABEL_180;
            }
LABEL_105:
            v97 = [NSNumber numberWithUnsignedInt:HIDWORD(v222)];
            [v8 setObject:v97 forKeyedSubscript:@"proxyMilliseconds"];

            __int16 v96 = v247;
            goto LABEL_106;
        }
      }
    }
    v58 = @"NW_PROXY_TYPE_INVALID";
    if (SHIDWORD(v221) <= 3000)
    {
      v60 = @"NW_PROXY_TYPE_PAC_URL";
      v61 = @"NW_PROXY_TYPE_HTTP";
      v62 = @"NW_PROXY_TYPE_HTTPS";
      if (HIDWORD(v221) != 2002) {
        v62 = @"NW_PROXY_TYPE_INVALID";
      }
      if (HIDWORD(v221) != 2001) {
        v61 = v62;
      }
      if (HIDWORD(v221) != 1002) {
        v60 = v61;
      }
      if (HIDWORD(v221) == 1001) {
        v58 = @"NW_PROXY_TYPE_PAC_SCRIPT";
      }
      if (HIDWORD(v221) == 1) {
        v58 = @"NW_PROXY_TYPE_DIRECT";
      }
      if (SHIDWORD(v221) <= 1001) {
        v59 = v58;
      }
      else {
        v59 = v60;
      }
    }
    else
    {
      switch(HIDWORD(v221))
      {
        case 0xBB9:
          v59 = @"NW_PROXY_TYPE_SOCKSV4";
          break;
        case 0xBBA:
          v59 = @"NW_PROXY_TYPE_SOCKSV5";
          break;
        case 0xBBB:
          v59 = @"NW_PROXY_TYPE_SHOES";
          break;
        case 0xBBC:
          v59 = @"NW_PROXY_TYPE_HTTP_CONNECT";
          break;
        case 0xBBD:
          v59 = @"NW_PROXY_TYPE_TCP_CONVERTER";
          break;
        case 0xBBE:
          v59 = @"NW_PROXY_TYPE_MASQUE";
          break;
        default:
          if (HIDWORD(v221) == 4002) {
            v58 = @"NW_PROXY_TYPE_SECURE_HTTPS";
          }
          if (HIDWORD(v221) == 4001) {
            v59 = @"NW_PROXY_TYPE_HTTPS_TRANSPARENT";
          }
          else {
            v59 = v58;
          }
          break;
      }
    }
    [v8 setObject:v59 forKeyedSubscript:@"usedProxyType"];
    goto LABEL_87;
  }
LABEL_3:

  return (NSMutableDictionary *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryReport, 0);
  objc_storeStrong((id *)&self->_deviceReport, 0);
  objc_storeStrong((id *)&self->_layer2Report, 0);
  objc_storeStrong((id *)&self->_externallyVisibleActivityUUIDs, 0);
  objc_storeStrong((id *)&self->_activities, 0);
  objc_storeStrong((id *)&self->_externallyVisibleParentUUID, 0);
  objc_storeStrong((id *)&self->_externallyVisibleConnectionUUID, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);

  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

- (void)setReport:(netcore_stats_tcp_report *)a3
{
}

- (netcore_stats_tcp_report)report
{
  return (netcore_stats_tcp_report *)memcpy(retstr, &self->_report, sizeof(netcore_stats_tcp_report));
}

- (void)setDictionaryReport:(id)a3
{
}

- (void)setMetricType:(unsigned __int8)a3
{
  self->_metricType = a3;
}

- (void)setDeviceReport:(id)a3
{
}

- (NSDictionary)deviceReport
{
  return self->_deviceReport;
}

- (void)setLayer2Report:(id)a3
{
}

- (NSDictionary)layer2Report
{
  return self->_layer2Report;
}

- (void)setExternallyVisibleActivityUUIDs:(id)a3
{
}

- (NSArray)externallyVisibleActivityUUIDs
{
  return self->_externallyVisibleActivityUUIDs;
}

- (void)setActivities:(id)a3
{
}

- (void)setExternallyVisibleParentUUID:(id)a3
{
}

- (NSUUID)externallyVisibleParentUUID
{
  return self->_externallyVisibleParentUUID;
}

- (void)setExternallyVisibleConnectionUUID:(id)a3
{
}

- (NSUUID)externallyVisibleConnectionUUID
{
  return self->_externallyVisibleConnectionUUID;
}

- (void)setSourceIdentifier:(id)a3
{
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (NWConnectionStatistics)initWithJSONData:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NWConnectionStatistics;
  id v5 = [(NWConnectionStatistics *)&v22 init];
  if (v5)
  {
    if (v4 && [v4 length])
    {
      id v19 = 0;
      uint64_t v6 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v4 options:1 error:&v19];
      id v7 = v19;
      dictionaryReport = v5->_dictionaryReport;
      v5->_dictionaryReport = (NSMutableDictionary *)v6;
    }
    id v9 = v5;
    goto LABEL_6;
  }
  v11 = __nwlog_obj();
  *(_DWORD *)buf = 136446210;
  v24 = "-[NWConnectionStatistics initWithJSONData:]";
  v12 = (char *)_os_log_send_and_compose_impl();

  os_log_type_t type = OS_LOG_TYPE_ERROR;
  char v20 = 0;
  if (__nwlog_fault(v12, &type, &v20))
  {
    if (type == OS_LOG_TYPE_FAULT)
    {
      v13 = __nwlog_obj();
      os_log_type_t v14 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWConnectionStatistics initWithJSONData:]";
        _os_log_impl(&dword_1830D4000, v13, v14, "%{public}s [super init] failed", buf, 0xCu);
      }
    }
    else if (v20)
    {
      backtrace_string = (char *)__nw_create_backtrace_string();
      v13 = __nwlog_obj();
      os_log_type_t v16 = type;
      BOOL v17 = os_log_type_enabled(v13, type);
      if (backtrace_string)
      {
        if (v17)
        {
          *(_DWORD *)buf = 136446466;
          v24 = "-[NWConnectionStatistics initWithJSONData:]";
          __int16 v25 = 2082;
          v26 = backtrace_string;
          _os_log_impl(&dword_1830D4000, v13, v16, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
        }

        free(backtrace_string);
        goto LABEL_23;
      }
      if (v17)
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWConnectionStatistics initWithJSONData:]";
        _os_log_impl(&dword_1830D4000, v13, v16, "%{public}s [super init] failed, no backtrace", buf, 0xCu);
      }
    }
    else
    {
      v13 = __nwlog_obj();
      os_log_type_t v18 = type;
      if (os_log_type_enabled(v13, type))
      {
        *(_DWORD *)buf = 136446210;
        v24 = "-[NWConnectionStatistics initWithJSONData:]";
        _os_log_impl(&dword_1830D4000, v13, v18, "%{public}s [super init] failed, backtrace limit exceeded", buf, 0xCu);
      }
    }
  }
LABEL_23:
  if (v12) {
    free(v12);
  }
LABEL_6:

  return v5;
}

- (NWConnectionStatistics)initWithTCPReport:(netcore_stats_tcp_report *)a3 length:(unint64_t)a4 clientIdentifier:(id)a5 sourceIdentifier:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (a4 != 3424)
  {
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    v15 = (id)gLogObj;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446722;
      v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
      __int16 v30 = 2048;
      uint64_t v31 = 3424;
      __int16 v32 = 2048;
      unint64_t v33 = a4;
      _os_log_impl(&dword_1830D4000, v15, OS_LOG_TYPE_ERROR, "%{public}s failure to initialize statistics object from TCP report, expected size %zd actual size %zd", buf, 0x20u);
    }

    goto LABEL_7;
  }
  v27.receiver = self;
  v27.super_class = (Class)NWConnectionStatistics;
  v12 = [(NWConnectionStatistics *)&v27 init];
  if (!v12)
  {
    BOOL v17 = __nwlog_obj();
    *(_DWORD *)buf = 136446210;
    v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
    os_log_type_t v18 = (char *)_os_log_send_and_compose_impl();

    os_log_type_t v26 = OS_LOG_TYPE_ERROR;
    char v25 = 0;
    if (!__nwlog_fault(v18, &v26, &v25)) {
      goto LABEL_24;
    }
    if (v26 == OS_LOG_TYPE_FAULT)
    {
      id v19 = __nwlog_obj();
      os_log_type_t v20 = v26;
      if (os_log_type_enabled(v19, v26))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
        v21 = "%{public}s [super init] failed";
LABEL_22:
        _os_log_impl(&dword_1830D4000, v19, v20, v21, buf, 0xCu);
      }
    }
    else
    {
      if (v25)
      {
        backtrace_string = (char *)__nw_create_backtrace_string();
        id v19 = __nwlog_obj();
        os_log_type_t v20 = v26;
        BOOL v23 = os_log_type_enabled(v19, v26);
        if (backtrace_string)
        {
          if (v23)
          {
            *(_DWORD *)buf = 136446466;
            v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
            __int16 v30 = 2082;
            uint64_t v31 = (uint64_t)backtrace_string;
            _os_log_impl(&dword_1830D4000, v19, v20, "%{public}s [super init] failed, dumping backtrace:%{public}s", buf, 0x16u);
          }

          free(backtrace_string);
          goto LABEL_24;
        }
        if (!v23) {
          goto LABEL_23;
        }
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
        v21 = "%{public}s [super init] failed, no backtrace";
        goto LABEL_22;
      }
      id v19 = __nwlog_obj();
      os_log_type_t v20 = v26;
      if (os_log_type_enabled(v19, v26))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[NWConnectionStatistics initWithTCPReport:length:clientIdentifier:sourceIdentifier:]";
        v21 = "%{public}s [super init] failed, backtrace limit exceeded";
        goto LABEL_22;
      }
    }
LABEL_23:

LABEL_24:
    if (v18) {
      free(v18);
    }
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v13 = v12;
  memcpy(__dst, a3, 0xD60uLL);
  [(NWConnectionStatistics *)v13 setReport:__dst];
  [(NWConnectionStatistics *)v13 setClientIdentifier:v10];
  [(NWConnectionStatistics *)v13 setSourceIdentifier:v11];
  id v14 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  [(NWConnectionStatistics *)v13 setExternallyVisibleActivityUUIDs:v14];

  [(NWConnectionStatistics *)v13 setExternallyVisibleConnectionUUID:0];
  [(NWConnectionStatistics *)v13 setExternallyVisibleParentUUID:0];
LABEL_8:

  return v13;
}

- (id)_createFallbackReportDictionaryFromStruct:(const netcore_stats_tcp_cell_fallback_report *)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (a3)
  {
    char v25 = self;
    uint64_t v6 = [NSNumber numberWithBool:a3->fellback];
    [v5 setObject:v6 forKeyedSubscript:@"fellback"];

    int deny_reason = a3->deny_reason;
    if (deny_reason)
    {
      v8 = @"DENY_REASON_BLOCKED_FROM_USING_CELL_DATA";
      if (deny_reason == 2) {
        v8 = @"DENY_REASON_EXCEEDED_CELL_FALLBACK_DATA_BUDGET";
      }
      if (deny_reason == 3) {
        id v9 = @"DENY_REASON_METRICS_TESTING_DENIED";
      }
      else {
        id v9 = v8;
      }
      [v5 setObject:v9 forKeyedSubscript:@"denyReason"];
    }
    id v10 = [NSNumber numberWithUnsignedInt:a3->fallback_timer_msecs];
    os_log_type_t v26 = v5;
    [v5 setObject:v10 forKeyedSubscript:@"fallbackTimerMsecs"];

    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a3->network_event_count)
    {
      unint64_t v12 = 0;
      p_time_to_network_event_msecs = &a3->network_events[0].time_to_network_event_msecs;
      do
      {
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        BOOL v17 = v16;
        objc_msgSend(v16, "setObject:forKeyedSubscript:");
        unsigned int v14 = *p_time_to_network_event_msecs;
        p_time_to_network_event_msecs += 2;
        v15 = [NSNumber numberWithUnsignedInt:v14];
        [v17 setObject:v15 forKeyedSubscript:@"timeToNetworkEventsMsecs"];

        [v11 addObject:v17];
        ++v12;
      }
      while (v12 < a3->network_event_count);
    }
    id v5 = v26;
    [v26 setObject:v11 forKeyedSubscript:@"networkEvents"];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (a3->data_usage_snapshots_at_network_events_count)
    {
      unint64_t v19 = 0;
      data_usage_snapshots_at_network_events = a3->data_usage_snapshots_at_network_events;
      while (1)
      {
        uint64_t v21 = [(NWConnectionStatistics *)v25 _createDataUsageSnapshotDictionaryFromStruct:data_usage_snapshots_at_network_events];
        if (!v21) {
          break;
        }
        objc_super v22 = (void *)v21;
        [v18 addObject:v21];

        ++v19;
        ++data_usage_snapshots_at_network_events;
        if (v19 >= a3->data_usage_snapshots_at_network_events_count) {
          goto LABEL_17;
        }
      }
      pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
      networkd_settings_init();
      BOOL v23 = (id)gLogObj;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446210;
        v28 = "-[NWConnectionStatistics _createFallbackReportDictionaryFromStruct:]";
        _os_log_impl(&dword_1830D4000, v23, OS_LOG_TYPE_ERROR, "%{public}s failing to allocate NWLibnetcoreConnectionDataUsageSnapshotDictionary", buf, 0xCu);
      }

      a3 = 0;
    }
    else
    {
LABEL_17:
      [v26 setObject:v18 forKeyedSubscript:@"connectionDataUsageSnapshots"];
      a3 = v26;
    }
  }

  return (id)(id)a3;
}

- (id)_createStatisticsReportDictionaryFromStruct:(const netcore_stats_tcp_statistics_report *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v4)
  {
    id v5 = [NSNumber numberWithUnsignedInt:a3->time_to_dns_start_msecs];
    [v4 setObject:v5 forKeyedSubscript:@"timeToDNSStartMsecs"];

    uint64_t v6 = [NSNumber numberWithUnsignedInt:a3->time_to_dns_resolved_msecs];
    [v4 setObject:v6 forKeyedSubscript:@"timeToDNSResolvedMsecs"];

    id v7 = [NSNumber numberWithUnsignedInt:a3->dns_resolved_time_msecs];
    [v4 setObject:v7 forKeyedSubscript:@"dNSResolvedTimeMsecs"];

    v8 = [NSNumber numberWithInt:*((_WORD *)a3 + 104) & 1];
    [v4 setObject:v8 forKeyedSubscript:@"dNSAnswersCached"];

    unsigned int v9 = a3->interface_type - 1;
    if (v9 > 3) {
      id v10 = @"INTERFACE_TYPE_OTHER";
    }
    else {
      id v10 = off_1E5248910[v9];
    }
    [v4 setObject:v10 forKeyedSubscript:@"interfaceType"];
    id v11 = [NSNumber numberWithUnsignedInt:a3->time_to_connection_start_msecs];
    [v4 setObject:v11 forKeyedSubscript:@"timeToConnectionStartMsecs"];

    unint64_t v12 = [NSNumber numberWithUnsignedInt:a3->time_to_connection_establishment_msecs];
    [v4 setObject:v12 forKeyedSubscript:@"timeToConnectionEstablishmentMsecs"];

    v13 = [NSNumber numberWithUnsignedInt:a3->connection_establishment_time_msecs];
    [v4 setObject:v13 forKeyedSubscript:@"connectionEstablishmentTimeMsecs"];

    unsigned int v14 = [NSNumber numberWithUnsignedInt:a3->flow_duration_msecs];
    [v4 setObject:v14 forKeyedSubscript:@"flowDurationMsecs"];

    unsigned int v15 = a3->connected_interface_type - 1;
    if (v15 > 3) {
      id v16 = @"INTERFACE_TYPE_OTHER";
    }
    else {
      id v16 = off_1E5248910[v15];
    }
    [v4 setObject:v16 forKeyedSubscript:@"connectedInterfaceType"];
    BOOL v17 = [NSNumber numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 1) & 1];
    [v4 setObject:v17 forKeyedSubscript:@"connected"];

    id v18 = [NSNumber numberWithUnsignedInt:a3->traffic_class];
    [v4 setObject:v18 forKeyedSubscript:@"trafficClass"];

    unint64_t v19 = [NSNumber numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 2) & 1];
    [v4 setObject:v19 forKeyedSubscript:@"cellularFallback"];

    os_log_type_t v20 = [NSNumber numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 4) & 1];
    [v4 setObject:v20 forKeyedSubscript:@"preferFallback"];

    uint64_t v21 = [NSNumber numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 3) & 1];
    [v4 setObject:v21 forKeyedSubscript:@"cellularRRCConnected"];

    objc_super v22 = [NSNumber numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 5) & 1];
    [v4 setObject:v22 forKeyedSubscript:@"kernelReportedStalls"];

    BOOL v23 = [NSNumber numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 6) & 1];
    [v4 setObject:v23 forKeyedSubscript:@"kernelReportingConnectionStalled"];

    v24 = [NSNumber numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 7) & 1];
    [v4 setObject:v24 forKeyedSubscript:@"kernelReportingReadStalled"];

    char v25 = [NSNumber numberWithInt:HIBYTE(*((unsigned __int16 *)a3 + 104)) & 1];
    [v4 setObject:v25 forKeyedSubscript:@"kernelReportingWriteStalled"];

    os_log_type_t v26 = NSNumber;
    unint64_t bytes_in = a3->bytes_in;
    if (a3->bytes_in)
    {
      double v28 = (double)bytes_in;
      double v29 = log10((double)bytes_in);
      double v30 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v29)));
      unint64_t v31 = (unint64_t)(trunc(round(v30 * v28)) / v30);
    }
    else
    {
      unint64_t v31 = 0;
    }
    __int16 v32 = [v26 numberWithUnsignedLongLong:v31];
    [v4 setObject:v32 forKeyedSubscript:@"bytesIn"];

    unint64_t v33 = NSNumber;
    unint64_t bytes_out = a3->bytes_out;
    if (bytes_out)
    {
      double v35 = (double)bytes_out;
      double v36 = log10((double)bytes_out);
      double v37 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v36)));
      unint64_t v38 = (unint64_t)(trunc(round(v37 * v35)) / v37);
    }
    else
    {
      unint64_t v38 = 0;
    }
    v39 = [v33 numberWithUnsignedLongLong:v38];
    [v4 setObject:v39 forKeyedSubscript:@"bytesOut"];

    v40 = NSNumber;
    unint64_t bytes_duplicate = a3->bytes_duplicate;
    if (bytes_duplicate)
    {
      double v42 = (double)bytes_duplicate;
      double v43 = log10((double)bytes_duplicate);
      double v44 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v43)));
      unint64_t v45 = (unint64_t)(trunc(round(v44 * v42)) / v44);
    }
    else
    {
      unint64_t v45 = 0;
    }
    v46 = [v40 numberWithUnsignedLongLong:v45];
    [v4 setObject:v46 forKeyedSubscript:@"bytesDuplicate"];

    v47 = NSNumber;
    unint64_t bytes_ooo = a3->bytes_ooo;
    if (bytes_ooo)
    {
      double v49 = (double)bytes_ooo;
      double v50 = log10((double)bytes_ooo);
      double v51 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v50)));
      unint64_t v52 = (unint64_t)(trunc(round(v51 * v49)) / v51);
    }
    else
    {
      unint64_t v52 = 0;
    }
    v53 = [v47 numberWithUnsignedLongLong:v52];
    [v4 setObject:v53 forKeyedSubscript:@"bytesOutOfOrder"];

    v54 = NSNumber;
    unint64_t bytes_retransmitted = a3->bytes_retransmitted;
    if (bytes_retransmitted)
    {
      double v56 = (double)bytes_retransmitted;
      double v57 = log10((double)bytes_retransmitted);
      double v58 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v57)));
      unint64_t v59 = (unint64_t)(trunc(round(v58 * v56)) / v58);
    }
    else
    {
      unint64_t v59 = 0;
    }
    v60 = [v54 numberWithUnsignedLongLong:v59];
    [v4 setObject:v60 forKeyedSubscript:@"bytesRetransmitted"];

    v61 = NSNumber;
    unint64_t packets_in = a3->packets_in;
    if (packets_in)
    {
      double v63 = (double)packets_in;
      double v64 = log10((double)packets_in);
      double v65 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v64)));
      unint64_t v66 = (unint64_t)(trunc(round(v65 * v63)) / v65);
    }
    else
    {
      unint64_t v66 = 0;
    }
    v67 = [v61 numberWithUnsignedLongLong:v66];
    [v4 setObject:v67 forKeyedSubscript:@"packetsIn"];

    v68 = NSNumber;
    unint64_t packets_out = a3->packets_out;
    if (packets_out)
    {
      double v70 = (double)packets_out;
      double v71 = log10((double)packets_out);
      double v72 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v71)));
      unint64_t v73 = (unint64_t)(trunc(round(v72 * v70)) / v72);
    }
    else
    {
      unint64_t v73 = 0;
    }
    v74 = [v68 numberWithUnsignedLongLong:v73];
    [v4 setObject:v74 forKeyedSubscript:@"packetsOut"];

    v75 = NSNumber;
    unint64_t packets_duplicate = a3->packets_duplicate;
    if (packets_duplicate)
    {
      double v77 = (double)packets_duplicate;
      double v78 = log10((double)packets_duplicate);
      double v79 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v78)));
      unint64_t v80 = (unint64_t)(trunc(round(v79 * v77)) / v79);
    }
    else
    {
      unint64_t v80 = 0;
    }
    v81 = [v75 numberWithUnsignedLongLong:v80];
    [v4 setObject:v81 forKeyedSubscript:@"packetsDuplicate"];

    v82 = NSNumber;
    unint64_t packets_ooo = a3->packets_ooo;
    if (packets_ooo)
    {
      double v84 = (double)packets_ooo;
      double v85 = log10((double)packets_ooo);
      double v86 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v85)));
      unint64_t v87 = (unint64_t)(trunc(round(v86 * v84)) / v86);
    }
    else
    {
      unint64_t v87 = 0;
    }
    v88 = [v82 numberWithUnsignedLongLong:v87];
    [v4 setObject:v88 forKeyedSubscript:@"packetsOutOfOrder"];

    v89 = NSNumber;
    unint64_t packets_retransmitted = a3->packets_retransmitted;
    if (packets_retransmitted)
    {
      double v91 = (double)packets_retransmitted;
      double v92 = log10((double)packets_retransmitted);
      double v93 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v92)));
      unint64_t v94 = (unint64_t)(trunc(round(v93 * v91)) / v93);
    }
    else
    {
      unint64_t v94 = 0;
    }
    v95 = [v89 numberWithUnsignedLongLong:v94];
    [v4 setObject:v95 forKeyedSubscript:@"packetsRetransmitted"];

    __int16 v96 = [NSNumber numberWithUnsignedInt:a3->current_rtt_msecs];
    [v4 setObject:v96 forKeyedSubscript:@"currentRTTMsecs"];

    v97 = [NSNumber numberWithUnsignedInt:a3->smoothed_rtt_msecs];
    [v4 setObject:v97 forKeyedSubscript:@"smoothedRTTMsecs"];

    v98 = [NSNumber numberWithUnsignedInt:a3->best_rtt_msecs];
    [v4 setObject:v98 forKeyedSubscript:@"bestRTTMsecs"];

    v99 = [NSNumber numberWithUnsignedInt:a3->rtt_variance];
    [v4 setObject:v99 forKeyedSubscript:@"rTTvariance"];

    v100 = [NSNumber numberWithUnsignedInt:a3->syn_retransmission_count];
    [v4 setObject:v100 forKeyedSubscript:@"synRetransmissionCount"];

    v101 = [NSNumber numberWithInt:(*((unsigned __int16 *)a3 + 104) >> 9) & 1];
    [v4 setObject:v101 forKeyedSubscript:@"tcpFastOpen"];

    v102 = [NSNumber numberWithUnsignedInt:a3->better_route_event_count];
    [v4 setObject:v102 forKeyedSubscript:@"betterRouteEventCount"];

    v103 = [NSNumber numberWithUnsignedInt:a3->connection_reuse_count];
    [v4 setObject:v103 forKeyedSubscript:@"connectionReuseCount"];

    v104 = [NSNumber numberWithUnsignedInt:a3->app_reporting_data_stall_count];
    [v4 setObject:v104 forKeyedSubscript:@"appReportingDataStallCount"];

    v105 = [NSNumber numberWithUnsignedInt:a3->app_data_stall_timer_msecs];
    [v4 setObject:v105 forKeyedSubscript:@"appDataStallTimerMsecs"];

    id v106 = v4;
  }

  return v4;
}

- (id)_createDataUsageSnapshotDictionaryFromStruct:(const netcore_stats_data_usage_snapshot *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v4)
  {
    id v5 = NSNumber;
    unint64_t bytes_in = a3->bytes_in;
    if (a3->bytes_in)
    {
      double v7 = (double)bytes_in;
      double v8 = log10((double)bytes_in);
      double v9 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v8)));
      unint64_t v10 = (unint64_t)(trunc(round(v9 * v7)) / v9);
    }
    else
    {
      unint64_t v10 = 0;
    }
    id v11 = [v5 numberWithUnsignedLongLong:v10];
    [v4 setObject:v11 forKeyedSubscript:@"bytesIn"];

    unint64_t v12 = NSNumber;
    unint64_t bytes_out = a3->bytes_out;
    if (bytes_out)
    {
      double v14 = (double)bytes_out;
      double v15 = log10((double)bytes_out);
      double v16 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v15)));
      unint64_t v17 = (unint64_t)(trunc(round(v16 * v14)) / v16);
    }
    else
    {
      unint64_t v17 = 0;
    }
    id v18 = [v12 numberWithUnsignedLongLong:v17];
    [v4 setObject:v18 forKeyedSubscript:@"bytesOut"];

    unint64_t v19 = NSNumber;
    unint64_t multipath_bytes_in_cell = a3->multipath_bytes_in_cell;
    if (multipath_bytes_in_cell)
    {
      double v21 = (double)multipath_bytes_in_cell;
      double v22 = log10((double)multipath_bytes_in_cell);
      double v23 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v22)));
      unint64_t v24 = (unint64_t)(trunc(round(v23 * v21)) / v23);
    }
    else
    {
      unint64_t v24 = 0;
    }
    char v25 = [v19 numberWithUnsignedLongLong:v24];
    [v4 setObject:v25 forKeyedSubscript:@"multipathBytesInCell"];

    os_log_type_t v26 = NSNumber;
    unint64_t multipath_bytes_out_cell = a3->multipath_bytes_out_cell;
    if (multipath_bytes_out_cell)
    {
      double v28 = (double)multipath_bytes_out_cell;
      double v29 = log10((double)multipath_bytes_out_cell);
      double v30 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v29)));
      unint64_t v31 = (unint64_t)(trunc(round(v30 * v28)) / v30);
    }
    else
    {
      unint64_t v31 = 0;
    }
    __int16 v32 = [v26 numberWithUnsignedLongLong:v31];
    [v4 setObject:v32 forKeyedSubscript:@"multipathBytesOutCell"];

    unint64_t v33 = NSNumber;
    multipath_bytes_in_wifuint64_t i = a3->multipath_bytes_in_wifi;
    if (multipath_bytes_in_wifi)
    {
      double v35 = (double)multipath_bytes_in_wifi;
      double v36 = log10((double)multipath_bytes_in_wifi);
      double v37 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v36)));
      unint64_t v38 = (unint64_t)(trunc(round(v37 * v35)) / v37);
    }
    else
    {
      unint64_t v38 = 0;
    }
    v39 = [v33 numberWithUnsignedLongLong:v38];
    [v4 setObject:v39 forKeyedSubscript:@"multipathBytesInWiFi"];

    v40 = NSNumber;
    multipath_bytes_out_wifuint64_t i = a3->multipath_bytes_out_wifi;
    if (multipath_bytes_out_wifi)
    {
      double v42 = (double)multipath_bytes_out_wifi;
      double v43 = log10((double)multipath_bytes_out_wifi);
      double v44 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v43)));
      unint64_t v45 = (unint64_t)(trunc(round(v44 * v42)) / v44);
    }
    else
    {
      unint64_t v45 = 0;
    }
    v46 = [v40 numberWithUnsignedLongLong:v45];
    [v4 setObject:v46 forKeyedSubscript:@"multipathBytesOutWiFi"];

    v47 = NSNumber;
    unint64_t multipath_bytes_in_initial = a3->multipath_bytes_in_initial;
    if (multipath_bytes_in_initial)
    {
      double v49 = (double)multipath_bytes_in_initial;
      double v50 = log10((double)multipath_bytes_in_initial);
      double v51 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v50)));
      unint64_t v52 = (unint64_t)(trunc(round(v51 * v49)) / v51);
    }
    else
    {
      unint64_t v52 = 0;
    }
    v53 = [v47 numberWithUnsignedLongLong:v52];
    [v4 setObject:v53 forKeyedSubscript:@"multipathBytesInInitial"];

    v54 = NSNumber;
    unint64_t multipath_bytes_out_initial = a3->multipath_bytes_out_initial;
    if (multipath_bytes_out_initial)
    {
      double v56 = (double)multipath_bytes_out_initial;
      double v57 = log10((double)multipath_bytes_out_initial);
      double v58 = __exp10((double)(uint64_t)(2 - vcvtpd_s64_f64(v57)));
      unint64_t v59 = (unint64_t)(trunc(round(v58 * v56)) / v58);
    }
    else
    {
      unint64_t v59 = 0;
    }
    v60 = [v54 numberWithUnsignedLongLong:v59];
    [v4 setObject:v60 forKeyedSubscript:@"multipathBytesOutInitial"];

    id v61 = v4;
  }

  return v4;
}

- (unsigned)metricType
{
  if (self->_metricType <= 1u) {
    return 1;
  }
  else {
    return self->_metricType;
  }
}

- (unsigned)connectionReportReason
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (void)setEffectiveBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogDatapath)
  {
    id v5 = __nwlog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      double v8 = "-[NWConnectionStatistics setEffectiveBundleID:]";
      __int16 v9 = 2112;
      id v10 = v4;
      __int16 v11 = 2112;
      unint64_t v12 = self;
      _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Set effective bundle ID to %@ for %@", buf, 0x20u);
    }
  }
  [(NWConnectionStatistics *)self report];
  strlcpy(v6, (const char *)[v4 UTF8String], 0x100uLL);
}

- (NSString)effectiveBundleID
{
  id v3 = [NSString alloc];
  [(NWConnectionStatistics *)self report];
  id v4 = (void *)[v3 initWithCString:&v6 encoding:134217984];

  return (NSString *)v4;
}

- (void)setBundleID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (gLogDatapath)
  {
    id v5 = __nwlog_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136446722;
      double v8 = "-[NWConnectionStatistics setBundleID:]";
      __int16 v9 = 2112;
      id v10 = v4;
      __int16 v11 = 2112;
      unint64_t v12 = self;
      _os_log_impl(&dword_1830D4000, v5, OS_LOG_TYPE_DEBUG, "%{public}s Set bundle ID to %@ for %@", buf, 0x20u);
    }
  }
  [(NWConnectionStatistics *)self report];
  strlcpy(v6, (const char *)[v4 UTF8String], 0x100uLL);
}

- (NSString)bundleID
{
  id v3 = [NSString alloc];
  [(NWConnectionStatistics *)self report];
  id v4 = (void *)[v3 initWithCString:&v6 encoding:134217984];

  return (NSString *)v4;
}

- (NSArray)activities
{
  uint64_t v2 = (id *)MEMORY[0x1F4188790](self);
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = v2[6];
  if (v3) {
    goto LABEL_31;
  }
  location = v2 + 6;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unint64_t v5 = 0;
  uint64_t v6 = 383;
  unint64_t v7 = 0x1E4F29000uLL;
  double v8 = "-[NWConnectionStatistics activities]";
  while (1)
  {
    objc_msgSend(v2, "report", p_buf, v29);
    if (uuid_is_null((const unsigned __int8 *)&type[v6 + 3425]) || v5 >= 0x32) {
      break;
    }
    id v9 = objc_alloc(*(Class *)(v7 + 296));
    [v2 report];
    id v10 = (void *)[v9 initWithUUIDBytes:&type[v6 + 1]];
    if (v10)
    {
      [v4 addObject:v10];
      goto LABEL_4;
    }
    pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
    networkd_settings_init();
    id v11 = (id)gLogObj;
    int buf = 136446210;
    uint64_t v34 = v8;
    LODWORD(v29) = 12;
    p_int buf = &buf;
    unint64_t v12 = (char *)_os_log_send_and_compose_impl();

    type[0] = OS_LOG_TYPE_ERROR;
    char v31 = 0;
    if (__nwlog_fault(v12, type, &v31))
    {
      if (type[0] == OS_LOG_TYPE_FAULT)
      {
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v13 = (id)gLogObj;
        os_log_type_t v14 = type[0];
        if (os_log_type_enabled(v13, type[0]))
        {
          int buf = 136446210;
          uint64_t v34 = v8;
          double v15 = v13;
          os_log_type_t v16 = v14;
          unint64_t v17 = "%{public}s Failed to convert UUID from connection report";
          goto LABEL_19;
        }
      }
      else
      {
        if (v31)
        {
          id v18 = v4;
          unint64_t v19 = v8;
          backtrace_string = (char *)__nw_create_backtrace_string();
          pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
          networkd_settings_init();
          double v21 = (id)gLogObj;
          os_log_type_t v22 = type[0];
          BOOL v23 = os_log_type_enabled(v21, type[0]);
          if (backtrace_string)
          {
            if (v23)
            {
              int buf = 136446466;
              uint64_t v34 = v19;
              __int16 v35 = 2082;
              double v36 = backtrace_string;
              _os_log_impl(&dword_1830D4000, v21, v22, "%{public}s Failed to convert UUID from connection report, dumping backtrace:%{public}s", (uint8_t *)&buf, 0x16u);
            }

            free(backtrace_string);
          }
          else
          {
            if (v23)
            {
              int buf = 136446210;
              uint64_t v34 = v19;
              _os_log_impl(&dword_1830D4000, v21, v22, "%{public}s Failed to convert UUID from connection report, no backtrace", (uint8_t *)&buf, 0xCu);
            }
          }
          double v8 = v19;
          id v4 = v18;
          goto LABEL_25;
        }
        pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
        networkd_settings_init();
        uint64_t v13 = (id)gLogObj;
        os_log_type_t v24 = type[0];
        if (os_log_type_enabled(v13, type[0]))
        {
          int buf = 136446210;
          uint64_t v34 = v8;
          double v15 = v13;
          os_log_type_t v16 = v24;
          unint64_t v17 = "%{public}s Failed to convert UUID from connection report, backtrace limit exceeded";
LABEL_19:
          _os_log_impl(&dword_1830D4000, v15, v16, v17, (uint8_t *)&buf, 0xCu);
        }
      }
    }
LABEL_25:
    if (v12) {
      free(v12);
    }
    unint64_t v7 = 0x1E4F29000;
LABEL_4:

    ++v5;
    v6 += 16;
  }
  objc_storeStrong(location, v4);
  pthread_once(&nwlog_legacy_init(void)::init_once, nwlog_legacy_init_once);
  networkd_settings_init();
  char v25 = (id)gLogObj;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    os_log_type_t v26 = (char *)*location;
    int buf = 136446466;
    uint64_t v34 = v8;
    __int16 v35 = 2112;
    double v36 = v26;
    _os_log_impl(&dword_1830D4000, v25, OS_LOG_TYPE_DEBUG, "%{public}s Created array of UUIDs: %@", (uint8_t *)&buf, 0x16u);
  }

  id v3 = *location;
LABEL_31:

  return (NSArray *)v3;
}

- (BOOL)tlsHandshakeTimedOut
{
  [(NWConnectionStatistics *)self report];
  return ((unint64_t)v4 >> 24) & 1;
}

- (NSUUID)parentUUID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  [(NWConnectionStatistics *)self report];
  unsigned int v4 = (void *)[v3 initWithUUIDBytes:&v6];

  return (NSUUID *)v4;
}

- (NSUUID)connectionUUID
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  [(NWConnectionStatistics *)self report];
  unsigned int v4 = (void *)[v3 initWithUUIDBytes:&v6];

  return (NSUUID *)v4;
}

- (BOOL)kernelReportingWriteStalled
{
  [(NWConnectionStatistics *)self report];
  return HIBYTE(v4) & 1;
}

- (BOOL)kernelReportingReadStalled
{
  [(NWConnectionStatistics *)self report];
  return (v4 >> 7) & 1;
}

- (BOOL)kernelReportingConnectionStalled
{
  [(NWConnectionStatistics *)self report];
  return (v4 >> 6) & 1;
}

- (BOOL)kernelReportedStalls
{
  [(NWConnectionStatistics *)self report];
  return (v4 >> 5) & 1;
}

- (BOOL)tlsSucceeded
{
  [(NWConnectionStatistics *)self report];
  return ((unint64_t)v4 >> 15) & 1;
}

- (BOOL)tls13Configured
{
  [(NWConnectionStatistics *)self report];
  return v3 == 5;
}

- (BOOL)cellularRrcConnected
{
  [(NWConnectionStatistics *)self report];
  return (v4 >> 3) & 1;
}

- (BOOL)cellularFallback
{
  [(NWConnectionStatistics *)self report];
  return (v4 >> 2) & 1;
}

- (BOOL)fallbackEligible
{
  [(NWConnectionStatistics *)self report];
  return v3 == 1;
}

- (unsigned)trafficClass
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)tcpAppDataStallTimerMsecs
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)tcpAppReportingDataStallCount
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)tcpConnectionReuseCount
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)tcpBetterRouteEventCount
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (BOOL)tcpFastOpen
{
  [(NWConnectionStatistics *)self report];
  return (v4 >> 9) & 1;
}

- (unsigned)tcpSynRetransmissionCount
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)tcpRTTVariance
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)tcpRTTBestMsecs
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)tcpRTTSmoothedMsecs
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)tcpRTTCurrentMsecs
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unint64_t)packetsRetransmitted
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unint64_t)packetsOOO
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unint64_t)packetsDuplicate
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unint64_t)packetsOut
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unint64_t)packetsIn
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unint64_t)bytesRetransmitted
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unint64_t)bytesOOO
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unint64_t)bytesDuplicate
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unint64_t)bytesOut
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unint64_t)bytesIn
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (BOOL)connected
{
  [(NWConnectionStatistics *)self report];
  return (v4 >> 1) & 1;
}

- (int)connectedInterfaceType
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)flowDurationMsecs
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)connectionEstablishmentTimeMsecs
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)timeToConnectionEstablishmentMsecs
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)timeToConnectionStartMsecs
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (int)interfaceType
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (BOOL)dnsAnswersCached
{
  [(NWConnectionStatistics *)self report];
  return v3 & 1;
}

- (unsigned)dnsResolvedTimeMsecs
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)timeToDnsStartMsecs
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (unsigned)timeToDnsResolvedMsecs
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

- (BOOL)delegated
{
  [(NWConnectionStatistics *)self report];
  return v3;
}

+ (id)protocolToTransportProtocolString:(unsigned int)a3
{
  BOOL v3 = @"NW_TRANSPORT_PROTOCOL_QUIC";
  unsigned __int16 v4 = @"NW_TRANSPORT_PROTOCOL_UNKNOWN";
  if (a3 == 17) {
    unsigned __int16 v4 = @"NW_TRANSPORT_PROTOCOL_UDP";
  }
  if (a3 != 253) {
    BOOL v3 = v4;
  }
  if (a3 == 6) {
    return @"NW_TRANSPORT_PROTOCOL_TCP";
  }
  else {
    return v3;
  }
}

@end