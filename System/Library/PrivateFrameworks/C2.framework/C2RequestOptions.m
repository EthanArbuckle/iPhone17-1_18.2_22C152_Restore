@interface C2RequestOptions
+ (BOOL)supportsSecureCoding;
+ (BOOL)triesteMetricsEnabled;
+ (C2NetworkingDelegate)testNetworkingDelegate;
+ (id)stringForDiscretionaryNetworkBehavior:(unint64_t)a3;
+ (id)stringForDuetPreClearedMode:(unint64_t)a3;
+ (id)stringForQualityOfService:(int64_t)a3;
+ (void)initialize;
+ (void)setTestNetworkingDelegate:(id)a3;
- (BOOL)_allowsExpensiveAccess;
- (BOOL)_allowsPowerNapScheduling;
- (BOOL)_allowsRetryForBackgroundDataTasks;
- (BOOL)_optIntoDisableAPWakeOnIdleConnections;
- (BOOL)allowExpiredDNSBehavior;
- (BOOL)allowRouting;
- (BOOL)allowsCellularAccess;
- (BOOL)hasAllowsCellularAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)metricRequest;
- (BOOL)outOfProcess;
- (BOOL)outOfProcessDiscretionary;
- (BOOL)redactRemoteEndpointFromNetworkMetrics;
- (BOOL)redactUniformResourceIdentifierFromNetworkMetrics;
- (BOOL)tlsPinning;
- (BOOL)useAdaptiveTimeouts;
- (C2MetricOptions)metricOptions;
- (C2NetworkingDelegate)networkingDelegate;
- (C2RequestOptions)init;
- (C2RequestOptions)initWithCoder:(id)a3;
- (NSData)_sourceApplicationAuditTokenData;
- (NSNumber)privacyProxyFailClosedOverride;
- (NSNumber)useNWLoaderOverride;
- (NSString)_appleIDContextSessionIdentifier;
- (NSString)_sourceApplicationBundleIdentifier;
- (NSString)_sourceApplicationSecondaryIdentifier;
- (NSString)identifier;
- (NSString)originalHost;
- (NSString)outOfProcessPoolName;
- (NSURL)c2MetricsEndpoint;
- (NSURL)invokedURL;
- (double)_timeoutIntervalForRequest;
- (double)_timeoutIntervalForResource;
- (double)emptySessionExpiryInSeconds;
- (double)taskCallbackConsideredHangInSeconds;
- (id)copyAndDecorateRequest:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)decorateTask:(id)a3;
- (id)defaultSessionConfigurationWithName:(id)a3;
- (id)sessionConfigurationNameWithRouteHost:(id)a3;
- (id)sessionConfigurationWithName:(id)a3;
- (id)testBehavior_sessionGroupCreated;
- (int64_t)containerType;
- (int64_t)qualityOfService;
- (unint64_t)c2MetricsReportFrequency;
- (unint64_t)c2MetricsReportFrequencyBase;
- (unint64_t)discretionaryNetworkBehavior;
- (unint64_t)duetPreClearedMode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)handleCallbackForSessionTask:(id)a3 dataTask:(id)a4 callback:(id)a5;
- (void)setAllowExpiredDNSBehavior:(BOOL)a3;
- (void)setAllowRouting:(BOOL)a3;
- (void)setAllowsCellularAccess:(BOOL)a3;
- (void)setC2MetricsEndpoint:(id)a3;
- (void)setC2MetricsReportFrequency:(unint64_t)a3;
- (void)setC2MetricsReportFrequencyBase:(unint64_t)a3;
- (void)setContainerType:(int64_t)a3;
- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3;
- (void)setDuetPreClearedMode:(unint64_t)a3;
- (void)setHasAllowsCellularAccess:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setInvokedURL:(id)a3;
- (void)setMetricOptions:(id)a3;
- (void)setMetricRequest:(BOOL)a3;
- (void)setNetworkingDelegate:(id)a3;
- (void)setOriginalHost:(id)a3;
- (void)setOutOfProcessDiscretionary:(BOOL)a3;
- (void)setOutOfProcessPoolName:(id)a3;
- (void)setPrivacyProxyFailClosedOverride:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
- (void)setRedactRemoteEndpointFromNetworkMetrics:(BOOL)a3;
- (void)setRedactUniformResourceIdentifierFromNetworkMetrics:(BOOL)a3;
- (void)setTestBehavior_sessionGroupCreated:(id)a3;
- (void)setTlsPinning:(BOOL)a3;
- (void)setUseAdaptiveTimeouts:(BOOL)a3;
- (void)setUseNWLoaderOverride:(id)a3;
- (void)set_allowsExpensiveAccess:(BOOL)a3;
- (void)set_allowsPowerNapScheduling:(BOOL)a3;
- (void)set_allowsRetryForBackgroundDataTasks:(BOOL)a3;
- (void)set_appleIDContextSessionIdentifier:(id)a3;
- (void)set_optIntoDisableAPWakeOnIdleConnections:(BOOL)a3;
- (void)set_sourceApplicationAuditTokenData:(id)a3;
- (void)set_sourceApplicationBundleIdentifier:(id)a3;
- (void)set_sourceApplicationSecondaryIdentifier:(id)a3;
- (void)set_timeoutIntervalForRequest:(double)a3;
- (void)set_timeoutIntervalForResource:(double)a3;
@end

@implementation C2RequestOptions

- (void)set_timeoutIntervalForResource:(double)a3
{
  self->__timeoutIntervalForResource = a3;
}

- (void)set_timeoutIntervalForRequest:(double)a3
{
  self->__timeoutIntervalForRequest = a3;
}

- (void)set_sourceApplicationSecondaryIdentifier:(id)a3
{
}

- (void)set_sourceApplicationBundleIdentifier:(id)a3
{
}

- (void)set_allowsRetryForBackgroundDataTasks:(BOOL)a3
{
  self->__allowsRetryForBackgroundDataTasks = a3;
}

- (void)set_allowsPowerNapScheduling:(BOOL)a3
{
  self->__allowsPowerNapScheduling = a3;
}

- (void)set_allowsExpensiveAccess:(BOOL)a3
{
  self->__allowsExpensiveAccess = a3;
}

- (void)setTlsPinning:(BOOL)a3
{
  self->_tlsPinning = a3;
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (void)setPrivacyProxyFailClosedOverride:(id)a3
{
}

- (void)setOutOfProcessPoolName:(id)a3
{
}

- (void)setMetricOptions:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (void)setDuetPreClearedMode:(unint64_t)a3
{
  self->_duetPreClearedMode = a3;
}

- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3
{
  self->_discretionaryNetworkBehavior = a3;
}

- (void)setContainerType:(int64_t)a3
{
  self->_containerType = a3;
}

- (void)setAllowRouting:(BOOL)a3
{
  self->_allowRouting = a3;
}

- (void)setAllowExpiredDNSBehavior:(BOOL)a3
{
  self->_allowExpiredDNSBehavior = a3;
}

- (void)handleCallbackForSessionTask:(id)a3 dataTask:(id)a4 callback:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int64_t v11 = [(C2RequestOptions *)self containerType];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__C2RequestOptions_handleCallbackForSessionTask_dataTask_callback___block_invoke;
  v15[3] = &unk_1E6CCC330;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  +[C2CallstackAnnotations annotateCallstackForContainerType:v11 block:v15];
}

- (int64_t)containerType
{
  return self->_containerType;
}

uint64_t __67__C2RequestOptions_handleCallbackForSessionTask_dataTask_callback___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCallbackForTask:*(void *)(a1 + 40) callback:*(void *)(a1 + 48)];
}

- (BOOL)outOfProcess
{
  unint64_t v3 = [(C2RequestOptions *)self discretionaryNetworkBehavior];
  unint64_t v4 = [(C2RequestOptions *)self duetPreClearedMode];
  BOOL v5 = [(C2RequestOptions *)self _allowsRetryForBackgroundDataTasks];
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v5;
  }
  return v3 || v6;
}

- (unint64_t)discretionaryNetworkBehavior
{
  return self->_discretionaryNetworkBehavior;
}

- (unint64_t)duetPreClearedMode
{
  return self->_duetPreClearedMode;
}

- (BOOL)_allowsRetryForBackgroundDataTasks
{
  return self->__allowsRetryForBackgroundDataTasks;
}

- (C2MetricOptions)metricOptions
{
  return self->_metricOptions;
}

- (double)_timeoutIntervalForRequest
{
  return self->__timeoutIntervalForRequest;
}

+ (id)stringForQualityOfService:(int64_t)a3
{
  if (a3 <= 16)
  {
    if (a3 == -1) {
      return @"default";
    }
    if (a3 == 9) {
      return @"background";
    }
  }
  else
  {
    switch(a3)
    {
      case 17:
        return @"utility";
      case 33:
        return @"userInteractive";
      case 25:
        return @"userInitiated";
    }
  }
  return @"unknown";
}

- (NSString)_sourceApplicationSecondaryIdentifier
{
  return self->__sourceApplicationSecondaryIdentifier;
}

- (BOOL)_allowsPowerNapScheduling
{
  return self->__allowsPowerNapScheduling;
}

- (BOOL)tlsPinning
{
  return self->_tlsPinning;
}

- (BOOL)allowsCellularAccess
{
  uint64_t v2 = 8;
  if (!self->_hasAllowsCellularAccess) {
    uint64_t v2 = 9;
  }
  return *((unsigned char *)&self->super.isa + v2);
}

- (BOOL)_allowsExpensiveAccess
{
  return self->__allowsExpensiveAccess;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (double)_timeoutIntervalForResource
{
  return self->__timeoutIntervalForResource;
}

- (NSString)_appleIDContextSessionIdentifier
{
  return self->__appleIDContextSessionIdentifier;
}

- (BOOL)metricRequest
{
  return self->_metricRequest;
}

+ (id)stringForDuetPreClearedMode:(unint64_t)a3
{
  if (a3 > 2) {
    return @"?";
  }
  else {
    return off_1E6CCC578[a3];
  }
}

+ (id)stringForDiscretionaryNetworkBehavior:(unint64_t)a3
{
  if (a3 > 2) {
    return @"?";
  }
  else {
    return off_1E6CCC560[a3];
  }
}

- (BOOL)redactUniformResourceIdentifierFromNetworkMetrics
{
  return self->_redactUniformResourceIdentifierFromNetworkMetrics;
}

- (BOOL)redactRemoteEndpointFromNetworkMetrics
{
  return self->_redactRemoteEndpointFromNetworkMetrics;
}

- (NSString)outOfProcessPoolName
{
  return self->_outOfProcessPoolName;
}

+ (BOOL)triesteMetricsEnabled
{
  return triesteMetricsEnabled;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_hasAllowsCellularAccess = 1;
  self->_allowsCellularAccess = a3;
}

- (double)emptySessionExpiryInSeconds
{
  return 300.0;
}

- (id)sessionConfigurationNameWithRouteHost:(id)a3
{
  if (a3)
  {
    unint64_t v4 = (objc_class *)MEMORY[0x1E4F28E78];
    id v5 = a3;
    id v6 = objc_alloc_init(v4);
    [v6 appendFormat:@"route=%@", v5];

    if ([(C2RequestOptions *)self outOfProcess]) {
      v7 = @"T";
    }
    else {
      v7 = @"F";
    }
    [v6 appendFormat:@":outOfProcess=%@", v7];
    if ([(C2RequestOptions *)self _allowsPowerNapScheduling]) {
      id v8 = @"T";
    }
    else {
      id v8 = @"F";
    }
    [v6 appendFormat:@":powerNap=%@", v8];
    id v9 = [(C2RequestOptions *)self _sourceApplicationBundleIdentifier];

    if (v9)
    {
      id v10 = [(C2RequestOptions *)self _sourceApplicationBundleIdentifier];
      [v6 appendFormat:@":app=%@", v10];
    }
    int64_t v11 = [(C2RequestOptions *)self _sourceApplicationSecondaryIdentifier];

    if (v11)
    {
      id v12 = [(C2RequestOptions *)self _sourceApplicationSecondaryIdentifier];
      [v6 appendFormat:@":2app=%@", v12];
    }
    id v13 = [(C2RequestOptions *)self _sourceApplicationAuditTokenData];

    if (v13) {
      [v6 appendString:@":auditToken=Y"];
    }
    if ([(C2RequestOptions *)self outOfProcess])
    {
      id v14 = +[C2RequestOptions stringForDiscretionaryNetworkBehavior:[(C2RequestOptions *)self discretionaryNetworkBehavior]];
      [v6 appendFormat:@":disc=%@", v14];

      v15 = +[C2RequestOptions stringForDuetPreClearedMode:[(C2RequestOptions *)self duetPreClearedMode]];
      [v6 appendFormat:@":duet=%@", v15];

      id v16 = [(C2RequestOptions *)self _allowsRetryForBackgroundDataTasks]
          ? @"T"
          : @"F";
      [v6 appendFormat:@":retry=%@", v16];
      id v17 = [(C2RequestOptions *)self outOfProcessPoolName];

      if (v17)
      {
        id v18 = [(C2RequestOptions *)self outOfProcessPoolName];
        [v6 appendFormat:@":pool=%@", v18];
      }
    }
    v19 = [(C2RequestOptions *)self useNWLoaderOverride];

    if (v19)
    {
      v20 = [(C2RequestOptions *)self useNWLoaderOverride];
      if ([v20 BOOLValue]) {
        v21 = @"T";
      }
      else {
        v21 = @"F";
      }
      [v6 appendFormat:@":useNWLoaderOverride=%@", v21];
    }
    v22 = [(C2RequestOptions *)self networkingDelegate];

    if (v22)
    {
      v23 = [(C2RequestOptions *)self networkingDelegate];
      [v6 appendFormat:@":networkingDelegate=%@", v23];
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (C2NetworkingDelegate)networkingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkingDelegate);
  return (C2NetworkingDelegate *)WeakRetained;
}

- (id)sessionConfigurationWithName:(id)a3
{
  if (a3)
  {
    unint64_t v4 = -[C2RequestOptions defaultSessionConfigurationWithName:](self, "defaultSessionConfigurationWithName:");
    if (v4)
    {
      objc_msgSend(v4, "set_allowsPowerNapScheduling:", -[C2RequestOptions _allowsPowerNapScheduling](self, "_allowsPowerNapScheduling"));
      uint64_t v5 = [(C2RequestOptions *)self _sourceApplicationBundleIdentifier];
      if (v5)
      {
        id v6 = (void *)v5;
        v7 = [(C2RequestOptions *)self _sourceApplicationBundleIdentifier];
        uint64_t v8 = [v7 length];

        if (v8)
        {
          id v9 = [(C2RequestOptions *)self _sourceApplicationBundleIdentifier];
          objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", v9);
        }
      }
      uint64_t v10 = [(C2RequestOptions *)self _sourceApplicationSecondaryIdentifier];
      if (v10)
      {
        int64_t v11 = (void *)v10;
        id v12 = [(C2RequestOptions *)self _sourceApplicationSecondaryIdentifier];
        uint64_t v13 = [v12 length];

        if (v13)
        {
          id v14 = [(C2RequestOptions *)self _sourceApplicationSecondaryIdentifier];
          objc_msgSend(v4, "set_sourceApplicationSecondaryIdentifier:", v14);
        }
      }
      v15 = [(C2RequestOptions *)self _sourceApplicationAuditTokenData];

      if (v15)
      {
        id v16 = [(C2RequestOptions *)self _sourceApplicationAuditTokenData];
        objc_msgSend(v4, "set_sourceApplicationAuditTokenData:", v16);
      }
      if (![(C2RequestOptions *)self outOfProcess])
      {
        uint64_t v17 = [(C2RequestOptions *)self _sourceApplicationBundleIdentifier];
        if (v17)
        {
          id v18 = (void *)v17;
          v19 = [(C2RequestOptions *)self _sourceApplicationSecondaryIdentifier];

          if (v19)
          {
            id BRContainersMonitorClass = getBRContainersMonitorClass();
            v21 = [(C2RequestOptions *)self _sourceApplicationBundleIdentifier];
            v22 = [(C2RequestOptions *)self _sourceApplicationSecondaryIdentifier];
            v23 = [BRContainersMonitorClass containerIDFromPrimaryIdentifier:v21 secondaryIdentifier:v22];

            if (v23)
            {
              id v24 = getBRContainersMonitorClass();
              v25 = [(C2RequestOptions *)self _sourceApplicationBundleIdentifier];
              v26 = [(C2RequestOptions *)self _sourceApplicationSecondaryIdentifier];
              v27 = [v24 bundleIDFromPrimaryIdentifier:v25 secondaryIdentifier:v26];

              if (v27) {
                v28 = v27;
              }
              else {
                v28 = v23;
              }
              objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", v28);
            }
          }
        }
      }
      if ([(C2RequestOptions *)self outOfProcess])
      {
        objc_msgSend(v4, "setDiscretionary:", -[C2RequestOptions discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior") == 2);
        objc_msgSend(v4, "set_infersDiscretionaryFromOriginatingClient:", -[C2RequestOptions discretionaryNetworkBehavior](self, "discretionaryNetworkBehavior") == 1);
        v29 = [(C2RequestOptions *)self outOfProcessPoolName];
        objc_msgSend(v4, "set_connectionPoolName:", v29);

        objc_msgSend(v4, "set_allowsRetryForBackgroundDataTasks:", -[C2RequestOptions _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks"));
        if ([(C2RequestOptions *)self duetPreClearedMode] == 1)
        {
          if (objc_opt_respondsToSelector())
          {
            objc_msgSend(v4, "set_duetPreClearedMode:", 1);
          }
          else
          {
            [v4 setDiscretionary:0];
            if (C2_DEFAULT_LOG_BLOCK_4 != -1) {
              dispatch_once(&C2_DEFAULT_LOG_BLOCK_4, &__block_literal_global_181);
            }
            v30 = C2_DEFAULT_LOG_INTERNAL_4;
            if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DD523000, v30, OS_LOG_TYPE_INFO, "Unable to apply PreClearedModeWithBudgeting", buf, 2u);
            }
          }
        }
        if ([(C2RequestOptions *)self duetPreClearedMode] == 2)
        {
          if (objc_opt_respondsToSelector())
          {
            objc_msgSend(v4, "set_duetPreClearedMode:", 2);
          }
          else
          {
            [v4 setDiscretionary:0];
            if (C2_DEFAULT_LOG_BLOCK_4 != -1) {
              dispatch_once(&C2_DEFAULT_LOG_BLOCK_4, &__block_literal_global_184);
            }
            v31 = C2_DEFAULT_LOG_INTERNAL_4;
            if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v36 = 0;
              _os_log_impl(&dword_1DD523000, v31, OS_LOG_TYPE_INFO, "Unable to apply PreClearedModeWithoutBudgeting", v36, 2u);
            }
          }
        }
      }
      if ([(C2RequestOptions *)self tlsPinning]) {
        objc_msgSend(v4, "set_tlsTrustPinningPolicyName:", *MEMORY[0x1E4F3BBE8]);
      }
      if ([(C2RequestOptions *)self allowExpiredDNSBehavior]) {
        objc_msgSend(v4, "set_expiredDNSBehavior:", 1);
      }
      v32 = [(C2RequestOptions *)self useNWLoaderOverride];

      if (v32)
      {
        v33 = [(C2RequestOptions *)self useNWLoaderOverride];
        objc_msgSend(v4, "set_usesNWLoader:", objc_msgSend(v33, "BOOLValue"));
      }
      id v34 = v4;
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  return v4;
}

- (NSString)_sourceApplicationBundleIdentifier
{
  return self->__sourceApplicationBundleIdentifier;
}

- (NSNumber)useNWLoaderOverride
{
  return self->_useNWLoaderOverride;
}

- (NSData)_sourceApplicationAuditTokenData
{
  return self->__sourceApplicationAuditTokenData;
}

- (BOOL)allowExpiredDNSBehavior
{
  return self->_tlsPinning && self->_allowExpiredDNSBehavior;
}

- (id)testBehavior_sessionGroupCreated
{
  return self->_testBehavior_sessionGroupCreated;
}

- (void)setOriginalHost:(id)a3
{
}

- (void)setInvokedURL:(id)a3
{
}

- (id)defaultSessionConfigurationWithName:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_5;
  }
  if (![(C2RequestOptions *)self outOfProcess])
  {
    uint64_t v8 = [MEMORY[0x1E4F290F0] ephemeralSessionConfiguration];
    objc_msgSend(v8, "set_preventsIdleSleepOnceConnected:", 1);
    if (+[C2DeviceInfo whitelistedForDisableAPWakeOnIdleConnections]|| [(C2RequestOptions *)self _optIntoDisableAPWakeOnIdleConnections])
    {
      if (C2_DEFAULT_LOG_BLOCK_4 != -1) {
        dispatch_once(&C2_DEFAULT_LOG_BLOCK_4, &__block_literal_global_9);
      }
      id v9 = C2_DEFAULT_LOG_INTERNAL_4;
      if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD523000, v9, OS_LOG_TYPE_DEBUG, "set_disableAPWakeOnIdleConnections.", buf, 2u);
      }
      objc_msgSend(v8, "set_disableAPWakeOnIdleConnections:", 1);
    }
    goto LABEL_13;
  }
  uint64_t v5 = [MEMORY[0x1E4F29128] UUID];
  id v6 = [v5 UUIDString];

  if (!v6)
  {
LABEL_5:
    uint64_t v8 = 0;
    goto LABEL_14;
  }
  v7 = [NSString stringWithFormat:@"%@:uuid:%@", v4, v6];
  uint64_t v8 = [MEMORY[0x1E4F290F0] backgroundSessionConfigurationWithIdentifier:v7];

LABEL_13:
  [v8 setURLCredentialStorage:0];
  [v8 setHTTPCookieStorage:0];
  [v8 setURLCache:0];
  [v8 setRequestCachePolicy:1];
  objc_msgSend(v8, "set_timingDataOptions:", 85);
LABEL_14:

  return v8;
}

- (id)decorateTask:(id)a3
{
  id v4 = a3;
  [(C2RequestOptions *)self _timeoutIntervalForResource];
  if (v5 > 0.0)
  {
    [(C2RequestOptions *)self _timeoutIntervalForResource];
    objc_msgSend(v4, "set_timeoutIntervalForResource:");
  }
  uint64_t v6 = [(C2RequestOptions *)self _appleIDContextSessionIdentifier];
  if (v6)
  {
    v7 = (void *)v6;
    uint64_t v8 = [(C2RequestOptions *)self _appleIDContextSessionIdentifier];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v17 = 0;
      id v18 = &v17;
      uint64_t v19 = 0x2050000000;
      uint64_t v10 = (void *)getAKAppleIDSessionClass_softClass;
      uint64_t v20 = getAKAppleIDSessionClass_softClass;
      if (!getAKAppleIDSessionClass_softClass)
      {
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __getAKAppleIDSessionClass_block_invoke;
        v16[3] = &unk_1E6CCBF50;
        v16[4] = &v17;
        __getAKAppleIDSessionClass_block_invoke((uint64_t)v16);
        uint64_t v10 = (void *)v18[3];
      }
      int64_t v11 = v10;
      _Block_object_dispose(&v17, 8);
      id v12 = [v11 alloc];
      uint64_t v13 = [(C2RequestOptions *)self _appleIDContextSessionIdentifier];
      id v14 = (void *)[v12 initWithIdentifier:v13];
      [v4 _setAppleIDContext:v14];
    }
  }
  return v4;
}

- (id)copyAndDecorateRequest:(id)a3
{
  id v4 = (void *)[a3 mutableCopy];
  if (v4)
  {
    if ([(C2RequestOptions *)self hasAllowsCellularAccess]) {
      objc_msgSend(v4, "setAllowsCellularAccess:", -[C2RequestOptions allowsCellularAccess](self, "allowsCellularAccess"));
    }
    objc_msgSend(v4, "setAllowsExpensiveNetworkAccess:", -[C2RequestOptions _allowsExpensiveAccess](self, "_allowsExpensiveAccess"));
    double v5 = [(C2RequestOptions *)self privacyProxyFailClosedOverride];

    if (v5)
    {
      uint64_t v6 = [(C2RequestOptions *)self privacyProxyFailClosedOverride];
      objc_msgSend(v4, "_setPrivacyProxyFailClosed:", objc_msgSend(v6, "BOOLValue"));
    }
    [(C2RequestOptions *)self _timeoutIntervalForRequest];
    if (v7 > 0.0)
    {
      [(C2RequestOptions *)self _timeoutIntervalForRequest];
      objc_msgSend(v4, "setTimeoutInterval:");
    }
    uint64_t v8 = [(C2RequestOptions *)self metricOptions];
    if (v8)
    {
      uint64_t v9 = (void *)v8;
      BOOL v10 = [(C2RequestOptions *)self allowRouting];

      if (v10)
      {
        int64_t v11 = [(C2MetricOptions *)self->_metricOptions headerValueForTriggers];
        [v4 addValue:v11 forHTTPHeaderField:@"x-apple-c2-metric-triggers"];
      }
    }
    id v12 = v4;
  }

  return v4;
}

- (NSNumber)privacyProxyFailClosedOverride
{
  return self->_privacyProxyFailClosedOverride;
}

- (BOOL)allowRouting
{
  return self->_allowRouting;
}

- (BOOL)hasAllowsCellularAccess
{
  return self->_hasAllowsCellularAccess;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (C2RequestOptions)init
{
  v24.receiver = self;
  v24.super_class = (Class)C2RequestOptions;
  uint64_t v2 = [(C2RequestOptions *)&v24 init];
  unint64_t v3 = v2;
  if (v2)
  {
    outOfProcessPoolName = v2->_outOfProcessPoolName;
    v2->_qualityOfService = -1;
    v2->_outOfProcessPoolName = 0;

    v3->_hasAllowsCellularAccess = 0;
    *(_WORD *)&v3->_allowsCellularAccess = 257;
    v3->__allowsPowerNapScheduling = 1;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v3->__timeoutIntervalForRequest = _Q0;
    sourceApplicationBundleIdentifier = v3->__sourceApplicationBundleIdentifier;
    v3->__sourceApplicationBundleIdentifier = 0;

    sourceApplicationSecondaryIdentifier = v3->__sourceApplicationSecondaryIdentifier;
    v3->__sourceApplicationSecondaryIdentifier = 0;

    sourceApplicationAuditTokenData = v3->__sourceApplicationAuditTokenData;
    v3->__sourceApplicationAuditTokenData = 0;

    privacyProxyFailClosedOverride = v3->_privacyProxyFailClosedOverride;
    v3->_privacyProxyFailClosedOverride = 0;

    useNWLoaderOverride = v3->_useNWLoaderOverride;
    v3->_useNWLoaderOverride = 0;

    appleIDContextSessionIdentifier = v3->__appleIDContextSessionIdentifier;
    v3->__appleIDContextSessionIdentifier = 0;

    *(_DWORD *)&v3->_tlsPinning = 0;
    v3->_discretionaryNetworkBehavior = 0;
    v3->_duetPreClearedMode = 0;
    id v16 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v17 = [v16 UUIDString];
    identifier = v3->_identifier;
    v3->_identifier = (NSString *)v17;

    metricOptions = v3->_metricOptions;
    v3->_metricOptions = 0;

    objc_storeWeak((id *)&v3->_networkingDelegate, 0);
    *(_WORD *)&v3->_redactRemoteEndpointFromNetworkMetrics = 0;
    v3->_containerType = 0;
    v3->__optIntoDisableAPWakeOnIdleConnections = 0;
    originalHost = v3->_originalHost;
    v3->_originalHost = 0;

    v3->_metricRequest = 0;
    invokedURL = v3->_invokedURL;
    v3->_invokedURL = 0;

    id testBehavior_sessionGroupCreated = v3->_testBehavior_sessionGroupCreated;
    v3->_id testBehavior_sessionGroupCreated = 0;
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_networkingDelegate);
  objc_storeStrong((id *)&self->_invokedURL, 0);
  objc_storeStrong(&self->_testBehavior_sessionGroupCreated, 0);
  objc_storeStrong((id *)&self->_originalHost, 0);
  objc_storeStrong((id *)&self->_c2MetricsEndpoint, 0);
  objc_storeStrong((id *)&self->_metricOptions, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_useNWLoaderOverride, 0);
  objc_storeStrong((id *)&self->_privacyProxyFailClosedOverride, 0);
  objc_storeStrong((id *)&self->__appleIDContextSessionIdentifier, 0);
  objc_storeStrong((id *)&self->__sourceApplicationAuditTokenData, 0);
  objc_storeStrong((id *)&self->__sourceApplicationSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->__sourceApplicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_outOfProcessPoolName, 0);
}

+ (void)initialize
{
  if ((hasTriesteMetricsEnabled & 1) == 0)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CB18] c2DefaultsDomain];
    triesteMetricsEnabled = [v2 BOOLForKey:@"C2_triesteMetricsEnabled"];

    hasTriesteMetricsEnabled = 1;
  }
}

+ (C2NetworkingDelegate)testNetworkingDelegate
{
  return (C2NetworkingDelegate *)(id)_testNetworkingDelegate;
}

+ (void)setTestNetworkingDelegate:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[C2RequestOptions allocWithZone:a3];
  double v5 = v4;
  if (v4)
  {
    [(C2RequestOptions *)v4 setQualityOfService:self->_qualityOfService];
    [(C2RequestOptions *)v5 setOutOfProcessPoolName:self->_outOfProcessPoolName];
    if (self->_hasAllowsCellularAccess) {
      [(C2RequestOptions *)v5 setAllowsCellularAccess:self->_allowsCellularAccess];
    }
    [(C2RequestOptions *)v5 set_allowsExpensiveAccess:self->__allowsExpensiveAccess];
    [(C2RequestOptions *)v5 set_allowsPowerNapScheduling:self->__allowsPowerNapScheduling];
    [(C2RequestOptions *)v5 set_timeoutIntervalForRequest:self->__timeoutIntervalForRequest];
    [(C2RequestOptions *)v5 set_timeoutIntervalForResource:self->__timeoutIntervalForResource];
    [(C2RequestOptions *)v5 set_sourceApplicationBundleIdentifier:self->__sourceApplicationBundleIdentifier];
    [(C2RequestOptions *)v5 set_sourceApplicationSecondaryIdentifier:self->__sourceApplicationSecondaryIdentifier];
    [(C2RequestOptions *)v5 set_sourceApplicationAuditTokenData:self->__sourceApplicationAuditTokenData];
    [(C2RequestOptions *)v5 set_appleIDContextSessionIdentifier:self->__appleIDContextSessionIdentifier];
    [(C2RequestOptions *)v5 setTlsPinning:self->_tlsPinning];
    [(C2RequestOptions *)v5 setAllowRouting:self->_allowRouting];
    [(C2RequestOptions *)v5 setAllowExpiredDNSBehavior:self->_allowExpiredDNSBehavior];
    [(C2RequestOptions *)v5 setDiscretionaryNetworkBehavior:self->_discretionaryNetworkBehavior];
    [(C2RequestOptions *)v5 setDuetPreClearedMode:self->_duetPreClearedMode];
    [(C2RequestOptions *)v5 set_allowsRetryForBackgroundDataTasks:self->__allowsRetryForBackgroundDataTasks];
    [(C2RequestOptions *)v5 setPrivacyProxyFailClosedOverride:self->_privacyProxyFailClosedOverride];
    [(C2RequestOptions *)v5 setIdentifier:self->_identifier];
    [(C2RequestOptions *)v5 setMetricOptions:self->_metricOptions];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_networkingDelegate);
    [(C2RequestOptions *)v5 setNetworkingDelegate:WeakRetained];

    [(C2RequestOptions *)v5 setRedactRemoteEndpointFromNetworkMetrics:self->_redactRemoteEndpointFromNetworkMetrics];
    [(C2RequestOptions *)v5 setRedactUniformResourceIdentifierFromNetworkMetrics:self->_redactUniformResourceIdentifierFromNetworkMetrics];
    [(C2RequestOptions *)v5 setContainerType:self->_containerType];
    [(C2RequestOptions *)v5 set_optIntoDisableAPWakeOnIdleConnections:self->__optIntoDisableAPWakeOnIdleConnections];
    [(C2RequestOptions *)v5 setOriginalHost:self->_originalHost];
    [(C2RequestOptions *)v5 setMetricRequest:self->_metricRequest];
    [(C2RequestOptions *)v5 setInvokedURL:self->_invokedURL];
    [(C2RequestOptions *)v5 setTestBehavior_sessionGroupCreated:self->_testBehavior_sessionGroupCreated];
  }
  return v5;
}

uint64_t __56__C2RequestOptions_defaultSessionConfigurationWithName___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __49__C2RequestOptions_sessionConfigurationWithName___block_invoke()
{
  C2_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

uint64_t __49__C2RequestOptions_sessionConfigurationWithName___block_invoke_182()
{
  C2_DEFAULT_LOG_INTERNAL_4 = (uint64_t)os_log_create("com.apple.c2", "default");
  return MEMORY[0x1F41817F8]();
}

- (double)taskCallbackConsideredHangInSeconds
{
  return 60.0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (C2RequestOptions *)a3;
  if (v4 == self)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v5 = v4;
      int64_t qualityOfService = self->_qualityOfService;
      if (qualityOfService != [(C2RequestOptions *)v5 qualityOfService]) {
        goto LABEL_73;
      }
      outOfProcessPoolName = self->_outOfProcessPoolName;
      uint64_t v8 = [(C2RequestOptions *)v5 outOfProcessPoolName];
      if (outOfProcessPoolName == (NSString *)v8)
      {
      }
      else
      {
        uint64_t v9 = (void *)v8;
        BOOL v10 = self->_outOfProcessPoolName;
        if (!v10) {
          goto LABEL_72;
        }
        int64_t v11 = [(C2RequestOptions *)v5 outOfProcessPoolName];
        int v12 = [(NSString *)v10 isEqual:v11];

        if (!v12) {
          goto LABEL_73;
        }
      }
      BOOL hasAllowsCellularAccess = self->_hasAllowsCellularAccess;
      if (hasAllowsCellularAccess != [(C2RequestOptions *)v5 hasAllowsCellularAccess]) {
        goto LABEL_73;
      }
      BOOL allowsCellularAccess = self->_allowsCellularAccess;
      if (allowsCellularAccess != [(C2RequestOptions *)v5 allowsCellularAccess]) {
        goto LABEL_73;
      }
      BOOL allowsExpensiveAccess = self->__allowsExpensiveAccess;
      if (allowsExpensiveAccess != [(C2RequestOptions *)v5 _allowsExpensiveAccess]) {
        goto LABEL_73;
      }
      BOOL allowsPowerNapScheduling = self->__allowsPowerNapScheduling;
      if (allowsPowerNapScheduling != [(C2RequestOptions *)v5 _allowsPowerNapScheduling]) {
        goto LABEL_73;
      }
      double timeoutIntervalForRequest = self->__timeoutIntervalForRequest;
      [(C2RequestOptions *)v5 _timeoutIntervalForRequest];
      if (timeoutIntervalForRequest != v19) {
        goto LABEL_73;
      }
      double timeoutIntervalForResource = self->__timeoutIntervalForResource;
      [(C2RequestOptions *)v5 _timeoutIntervalForResource];
      if (timeoutIntervalForResource != v21) {
        goto LABEL_73;
      }
      sourceApplicationBundleIdentifier = self->__sourceApplicationBundleIdentifier;
      uint64_t v23 = [(C2RequestOptions *)v5 _sourceApplicationBundleIdentifier];
      if (sourceApplicationBundleIdentifier == (NSString *)v23)
      {
      }
      else
      {
        uint64_t v9 = (void *)v23;
        objc_super v24 = self->__sourceApplicationBundleIdentifier;
        if (!v24) {
          goto LABEL_72;
        }
        v25 = [(C2RequestOptions *)v5 _sourceApplicationBundleIdentifier];
        int v26 = [(NSString *)v24 isEqual:v25];

        if (!v26) {
          goto LABEL_73;
        }
      }
      sourceApplicationSecondaryIdentifier = self->__sourceApplicationSecondaryIdentifier;
      uint64_t v28 = [(C2RequestOptions *)v5 _sourceApplicationSecondaryIdentifier];
      if (sourceApplicationSecondaryIdentifier == (NSString *)v28)
      {
      }
      else
      {
        uint64_t v9 = (void *)v28;
        v29 = self->__sourceApplicationSecondaryIdentifier;
        if (!v29) {
          goto LABEL_72;
        }
        v30 = [(C2RequestOptions *)v5 _sourceApplicationSecondaryIdentifier];
        int v31 = [(NSString *)v29 isEqual:v30];

        if (!v31) {
          goto LABEL_73;
        }
      }
      sourceApplicationAuditTokenData = self->__sourceApplicationAuditTokenData;
      uint64_t v33 = [(C2RequestOptions *)v5 _sourceApplicationAuditTokenData];
      if (sourceApplicationAuditTokenData == (NSData *)v33)
      {
      }
      else
      {
        uint64_t v9 = (void *)v33;
        id v34 = self->__sourceApplicationAuditTokenData;
        if (!v34) {
          goto LABEL_72;
        }
        v35 = [(C2RequestOptions *)v5 _sourceApplicationAuditTokenData];
        int v36 = [(NSData *)v34 isEqual:v35];

        if (!v36) {
          goto LABEL_73;
        }
      }
      appleIDContextSessionIdentifier = self->__appleIDContextSessionIdentifier;
      uint64_t v38 = [(C2RequestOptions *)v5 _appleIDContextSessionIdentifier];
      if (appleIDContextSessionIdentifier == (NSString *)v38)
      {
      }
      else
      {
        uint64_t v9 = (void *)v38;
        v39 = self->__appleIDContextSessionIdentifier;
        if (!v39) {
          goto LABEL_72;
        }
        v40 = [(C2RequestOptions *)v5 _appleIDContextSessionIdentifier];
        int v41 = [(NSString *)v39 isEqual:v40];

        if (!v41) {
          goto LABEL_73;
        }
      }
      BOOL tlsPinning = self->_tlsPinning;
      if (tlsPinning != [(C2RequestOptions *)v5 tlsPinning]) {
        goto LABEL_73;
      }
      BOOL allowRouting = self->_allowRouting;
      if (allowRouting != [(C2RequestOptions *)v5 allowRouting]) {
        goto LABEL_73;
      }
      BOOL allowExpiredDNSBehavior = self->_allowExpiredDNSBehavior;
      if (allowExpiredDNSBehavior != [(C2RequestOptions *)v5 allowExpiredDNSBehavior]) {
        goto LABEL_73;
      }
      unint64_t discretionaryNetworkBehavior = self->_discretionaryNetworkBehavior;
      if (discretionaryNetworkBehavior != [(C2RequestOptions *)v5 discretionaryNetworkBehavior])goto LABEL_73; {
      unint64_t duetPreClearedMode = self->_duetPreClearedMode;
      }
      if (duetPreClearedMode != [(C2RequestOptions *)v5 duetPreClearedMode]) {
        goto LABEL_73;
      }
      BOOL allowsRetryForBackgroundDataTasks = self->__allowsRetryForBackgroundDataTasks;
      if (allowsRetryForBackgroundDataTasks != [(C2RequestOptions *)v5 _allowsRetryForBackgroundDataTasks])goto LABEL_73; {
      privacyProxyFailClosedOverride = self->_privacyProxyFailClosedOverride;
      }
      uint64_t v49 = [(C2RequestOptions *)v5 privacyProxyFailClosedOverride];
      if (privacyProxyFailClosedOverride == (NSNumber *)v49)
      {
      }
      else
      {
        uint64_t v9 = (void *)v49;
        v50 = self->_privacyProxyFailClosedOverride;
        if (!v50) {
          goto LABEL_72;
        }
        v51 = [(C2RequestOptions *)v5 privacyProxyFailClosedOverride];
        int v52 = [(NSNumber *)v50 isEqual:v51];

        if (!v52) {
          goto LABEL_73;
        }
      }
      identifier = self->_identifier;
      uint64_t v54 = [(C2RequestOptions *)v5 identifier];
      if (identifier == (NSString *)v54)
      {
      }
      else
      {
        uint64_t v9 = (void *)v54;
        v55 = self->_identifier;
        if (!v55) {
          goto LABEL_72;
        }
        v56 = [(C2RequestOptions *)v5 identifier];
        int v57 = [(NSString *)v55 isEqual:v56];

        if (!v57) {
          goto LABEL_73;
        }
      }
      metricOptions = self->_metricOptions;
      uint64_t v59 = [(C2RequestOptions *)v5 metricOptions];
      if (metricOptions == (C2MetricOptions *)v59)
      {
      }
      else
      {
        uint64_t v9 = (void *)v59;
        v60 = self->_metricOptions;
        if (!v60) {
          goto LABEL_72;
        }
        v61 = [(C2RequestOptions *)v5 metricOptions];
        BOOL v62 = [(C2MetricOptions *)v60 isEqual:v61];

        if (!v62) {
          goto LABEL_73;
        }
      }
      BOOL redactRemoteEndpointFromNetworkMetrics = self->_redactRemoteEndpointFromNetworkMetrics;
      if (redactRemoteEndpointFromNetworkMetrics != [(C2RequestOptions *)v5 redactRemoteEndpointFromNetworkMetrics])goto LABEL_73; {
      BOOL redactUniformResourceIdentifierFromNetworkMetrics = self->_redactUniformResourceIdentifierFromNetworkMetrics;
      }
      if (redactUniformResourceIdentifierFromNetworkMetrics != [(C2RequestOptions *)v5 redactUniformResourceIdentifierFromNetworkMetrics])goto LABEL_73; {
      int64_t containerType = self->_containerType;
      }
      if (containerType != [(C2RequestOptions *)v5 containerType]) {
        goto LABEL_73;
      }
      BOOL optIntoDisableAPWakeOnIdleConnections = self->__optIntoDisableAPWakeOnIdleConnections;
      if (optIntoDisableAPWakeOnIdleConnections != [(C2RequestOptions *)v5 _optIntoDisableAPWakeOnIdleConnections])goto LABEL_73; {
      originalHost = self->_originalHost;
      }
      uint64_t v68 = [(C2RequestOptions *)v5 originalHost];
      if (originalHost == (NSString *)v68)
      {
      }
      else
      {
        uint64_t v9 = (void *)v68;
        v69 = self->_originalHost;
        if (!v69) {
          goto LABEL_72;
        }
        v70 = [(C2RequestOptions *)v5 originalHost];
        int v71 = [(NSString *)v69 isEqual:v70];

        if (!v71) {
          goto LABEL_73;
        }
      }
      BOOL metricRequest = self->_metricRequest;
      if (metricRequest != [(C2RequestOptions *)v5 metricRequest]) {
        goto LABEL_73;
      }
      invokedURL = self->_invokedURL;
      uint64_t v74 = [(C2RequestOptions *)v5 invokedURL];
      if (invokedURL == (NSURL *)v74)
      {

LABEL_77:
        BOOL v13 = 1;
        goto LABEL_74;
      }
      uint64_t v9 = (void *)v74;
      v75 = self->_invokedURL;
      if (v75)
      {
        v76 = [(C2RequestOptions *)v5 invokedURL];
        char v77 = [(NSURL *)v75 isEqual:v76];

        if (v77) {
          goto LABEL_77;
        }
LABEL_73:
        BOOL v13 = 0;
LABEL_74:

        goto LABEL_75;
      }
LABEL_72:

      goto LABEL_73;
    }
    BOOL v13 = 0;
  }
LABEL_75:

  return v13;
}

- (unint64_t)hash
{
  return [(NSString *)self->_identifier hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt64:self->_qualityOfService forKey:@"qualityOfService"];
  [v4 encodeObject:self->_outOfProcessPoolName forKey:@"outOfProcessPoolName"];
  if ([(C2RequestOptions *)self hasAllowsCellularAccess]) {
    [v4 encodeBool:self->_allowsCellularAccess forKey:@"allowsCellularAccess"];
  }
  [v4 encodeBool:self->__allowsExpensiveAccess forKey:@"allowsExpensiveAccess"];
  [v4 encodeBool:self->__allowsPowerNapScheduling forKey:@"allowsPowerNapScheduling"];
  [v4 encodeDouble:@"timeoutIntervalForRequestDouble" forKey:self->__timeoutIntervalForRequest];
  [v4 encodeDouble:@"timeoutIntervalForResourceDouble" forKey:self->__timeoutIntervalForResource];
  [v4 encodeObject:self->__sourceApplicationBundleIdentifier forKey:@"sourceApplicationBundleIdentifier"];
  [v4 encodeObject:self->__sourceApplicationSecondaryIdentifier forKey:@"sourceApplicationSecondaryIdentifier"];
  [v4 encodeObject:self->__sourceApplicationAuditTokenData forKey:@"sourceApplicationAuditTokenData"];
  [v4 encodeObject:self->__appleIDContextSessionIdentifier forKey:@"appleIDContextSessionIdentifier"];
  [v4 encodeBool:self->_tlsPinning forKey:@"tlsPinning"];
  [v4 encodeBool:self->_allowRouting forKey:@"allowRouting"];
  [v4 encodeBool:self->_allowExpiredDNSBehavior forKey:@"allowExpiredDNSBehavior"];
  [v4 encodeInt64:self->_discretionaryNetworkBehavior forKey:@"discretionaryNetworkBehavior"];
  [v4 encodeInt64:self->_duetPreClearedMode forKey:@"duetPreClearedMode"];
  [v4 encodeBool:self->__allowsRetryForBackgroundDataTasks forKey:@"allowsRetryForBackgroundDataTasks"];
  [v4 encodeObject:self->_privacyProxyFailClosedOverride forKey:@"privacyProxyFailClosedOverride"];
  [v4 encodeObject:self->_useNWLoaderOverride forKey:@"useNWLoaderOverride"];
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  [v4 encodeObject:self->_metricOptions forKey:@"metricOptions"];
  [v4 encodeBool:self->_redactRemoteEndpointFromNetworkMetrics forKey:@"redactRemoteEndpointFromNetworkMetrics"];
  [v4 encodeBool:self->_redactUniformResourceIdentifierFromNetworkMetrics forKey:@"redactUniformResourceIdentifierFromNetworkMetrics"];
  [v4 encodeInteger:self->_containerType forKey:@"containerType"];
  [v4 encodeBool:self->__optIntoDisableAPWakeOnIdleConnections forKey:@"optIntoDisableAPWakeOnIdleConnections"];
  [v4 encodeObject:self->_originalHost forKey:@"originalHost"];
  [v4 encodeBool:self->_metricRequest forKey:@"metricRequest"];
  [v4 encodeObject:self->_invokedURL forKey:@"invokedURL"];
}

- (C2RequestOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)C2RequestOptions;
  double v5 = [(C2RequestOptions *)&v38 init];
  if (v5)
  {
    v5->_int64_t qualityOfService = [v4 decodeInt64ForKey:@"qualityOfService"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"outOfProcessPoolName"];
    outOfProcessPoolName = v5->_outOfProcessPoolName;
    v5->_outOfProcessPoolName = (NSString *)v6;

    if ([v4 containsValueForKey:@"allowsCellularAccess"]) {
      -[C2RequestOptions setAllowsCellularAccess:](v5, "setAllowsCellularAccess:", [v4 decodeBoolForKey:@"allowsCellularAccess"]);
    }
    v5->__BOOL allowsExpensiveAccess = [v4 decodeBoolForKey:@"allowsExpensiveAccess"];
    v5->__BOOL allowsPowerNapScheduling = [v4 decodeBoolForKey:@"allowsPowerNapScheduling"];
    [v4 decodeDoubleForKey:@"timeoutIntervalForRequestDouble"];
    v5->__double timeoutIntervalForRequest = v8;
    [v4 decodeDoubleForKey:@"timeoutIntervalForResourceDouble"];
    v5->__double timeoutIntervalForResource = v9;
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceApplicationBundleIdentifier"];
    sourceApplicationBundleIdentifier = v5->__sourceApplicationBundleIdentifier;
    v5->__sourceApplicationBundleIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceApplicationSecondaryIdentifier"];
    sourceApplicationSecondaryIdentifier = v5->__sourceApplicationSecondaryIdentifier;
    v5->__sourceApplicationSecondaryIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sourceApplicationAuditTokenData"];
    sourceApplicationAuditTokenData = v5->__sourceApplicationAuditTokenData;
    v5->__sourceApplicationAuditTokenData = (NSData *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appleIDContextSessionIdentifier"];
    appleIDContextSessionIdentifier = v5->__appleIDContextSessionIdentifier;
    v5->__appleIDContextSessionIdentifier = (NSString *)v16;

    v5->_BOOL tlsPinning = [v4 decodeBoolForKey:@"tlsPinning"];
    v5->_BOOL allowRouting = [v4 decodeBoolForKey:@"allowRouting"];
    v5->_BOOL allowExpiredDNSBehavior = [v4 decodeBoolForKey:@"allowExpiredDNSBehavior"];
    v5->_unint64_t discretionaryNetworkBehavior = [v4 decodeInt64ForKey:@"discretionaryNetworkBehavior"];
    v5->_unint64_t duetPreClearedMode = [v4 decodeInt64ForKey:@"duetPreClearedMode"];
    v5->__BOOL allowsRetryForBackgroundDataTasks = [v4 decodeBoolForKey:@"allowsRetryForBackgroundDataTasks"];
    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"privacyProxyFailClosedOverride"];
    privacyProxyFailClosedOverride = v5->_privacyProxyFailClosedOverride;
    v5->_privacyProxyFailClosedOverride = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"useNWLoaderOverride"];
    useNWLoaderOverride = v5->_useNWLoaderOverride;
    v5->_useNWLoaderOverride = (NSNumber *)v20;

    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    uint64_t v23 = v22;
    if (v22)
    {
      objc_super v24 = v22;
      identifier = v5->_identifier;
      v5->_identifier = v24;
    }
    else
    {
      identifier = [MEMORY[0x1E4F29128] UUID];
      uint64_t v26 = [identifier UUIDString];
      v27 = v5->_identifier;
      v5->_identifier = (NSString *)v26;
    }
    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metricOptions"];
    metricOptions = v5->_metricOptions;
    v5->_metricOptions = (C2MetricOptions *)v28;

    v5->_BOOL redactRemoteEndpointFromNetworkMetrics = [v4 decodeBoolForKey:@"redactRemoteEndpointFromNetworkMetrics"];
    v5->_BOOL redactUniformResourceIdentifierFromNetworkMetrics = [v4 decodeBoolForKey:@"redactUniformResourceIdentifierFromNetworkMetrics"];
    if ([v4 containsValueForKey:@"containerType"]) {
      uint64_t v30 = [v4 decodeIntegerForKey:@"containerType"];
    }
    else {
      uint64_t v30 = 0;
    }
    v5->_int64_t containerType = v30;
    int v31 = [v4 containsValueForKey:@"optIntoDisableAPWakeOnIdleConnections"];
    if (v31) {
      LOBYTE(v31) = [v4 decodeBoolForKey:@"optIntoDisableAPWakeOnIdleConnections"];
    }
    v5->__BOOL optIntoDisableAPWakeOnIdleConnections = v31;
    uint64_t v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originalHost"];
    originalHost = v5->_originalHost;
    v5->_originalHost = (NSString *)v32;

    v5->_BOOL metricRequest = [v4 decodeBoolForKey:@"metricRequest"];
    uint64_t v34 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"invokedURL"];
    invokedURL = v5->_invokedURL;
    v5->_invokedURL = (NSURL *)v34;

    id testBehavior_sessionGroupCreated = v5->_testBehavior_sessionGroupCreated;
    v5->_id testBehavior_sessionGroupCreated = 0;
  }
  return v5;
}

- (void)set_sourceApplicationAuditTokenData:(id)a3
{
}

- (void)set_appleIDContextSessionIdentifier:(id)a3
{
}

- (void)setUseNWLoaderOverride:(id)a3
{
}

- (void)setRedactRemoteEndpointFromNetworkMetrics:(BOOL)a3
{
  self->_BOOL redactRemoteEndpointFromNetworkMetrics = a3;
}

- (void)setRedactUniformResourceIdentifierFromNetworkMetrics:(BOOL)a3
{
  self->_BOOL redactUniformResourceIdentifierFromNetworkMetrics = a3;
}

- (BOOL)_optIntoDisableAPWakeOnIdleConnections
{
  return self->__optIntoDisableAPWakeOnIdleConnections;
}

- (void)set_optIntoDisableAPWakeOnIdleConnections:(BOOL)a3
{
  self->__BOOL optIntoDisableAPWakeOnIdleConnections = a3;
}

- (BOOL)useAdaptiveTimeouts
{
  return self->_useAdaptiveTimeouts;
}

- (void)setUseAdaptiveTimeouts:(BOOL)a3
{
  self->_useAdaptiveTimeouts = a3;
}

- (BOOL)outOfProcessDiscretionary
{
  return self->_outOfProcessDiscretionary;
}

- (void)setOutOfProcessDiscretionary:(BOOL)a3
{
  self->_outOfProcessDiscretionary = a3;
}

- (NSURL)c2MetricsEndpoint
{
  return self->_c2MetricsEndpoint;
}

- (void)setC2MetricsEndpoint:(id)a3
{
}

- (unint64_t)c2MetricsReportFrequency
{
  return self->_c2MetricsReportFrequency;
}

- (void)setC2MetricsReportFrequency:(unint64_t)a3
{
  self->_c2MetricsReportFrequency = a3;
}

- (unint64_t)c2MetricsReportFrequencyBase
{
  return self->_c2MetricsReportFrequencyBase;
}

- (void)setC2MetricsReportFrequencyBase:(unint64_t)a3
{
  self->_c2MetricsReportFrequencyBase = a3;
}

- (void)setHasAllowsCellularAccess:(BOOL)a3
{
  self->_BOOL hasAllowsCellularAccess = a3;
}

- (NSString)originalHost
{
  return self->_originalHost;
}

- (void)setMetricRequest:(BOOL)a3
{
  self->_BOOL metricRequest = a3;
}

- (void)setTestBehavior_sessionGroupCreated:(id)a3
{
}

- (NSURL)invokedURL
{
  return self->_invokedURL;
}

- (void)setNetworkingDelegate:(id)a3
{
}

@end