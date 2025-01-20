@interface APSConfiguration
+ (id)_onQueue_configurationForEnvironment:(id)a3 connectionType:(int64_t)a4;
+ (id)configurationForEnvironment:(id)a3 connectionType:(int64_t)a4;
+ (void)initialize;
+ (void)invalidateConfigurationForEnvironment:(id)a3 connectionType:(int64_t)a4;
+ (void)loadConfigurationForEnvironment:(id)a3 connectionType:(int64_t)a4 block:(id)a5;
- (APSConfiguration)initWithEnvironment:(id)a3 connectionType:(int64_t)a4;
- (BOOL)_isExpired;
- (BOOL)_isLoaded;
- (BOOL)hasValidSignature;
- (NSDate)expiry;
- (NSDate)fetchDate;
- (NSNumber)activeInterval;
- (NSNumber)awdSlowReceiveThreshold;
- (NSNumber)costDrivenDualChannelAttempts;
- (NSNumber)criticalMessageKeepAliveTimerDuration;
- (NSNumber)criticalMessageTimeout;
- (NSNumber)delayedReconnectInterval;
- (NSNumber)delayedReconnectIntervalWatchWiFi;
- (NSNumber)delayedReconnectMaxInterval;
- (NSNumber)delayedReconnectMaxIntervalTrigger;
- (NSNumber)delayedReconnectMinIntervalTrigger;
- (NSNumber)delayedReconnectTLSInterval;
- (NSNumber)delayedReconnectTLSIntervalTrigger;
- (NSNumber)delayedSuspendKeepAliveInterval;
- (NSNumber)disableCostDrivenDualChannelAttempts;
- (NSNumber)disableDualModePiggybackTimer;
- (NSNumber)expensiveConditionsBackOffInterval;
- (NSNumber)filterMessageTimeout;
- (NSNumber)filterOptimizationEnabled;
- (NSNumber)forcedShortTimeoutInterval;
- (NSNumber)highQualityThresholdConnectedTime;
- (NSNumber)keepAliveV2TimeDriftMaximum;
- (NSNumber)lastIPCachingPercentage;
- (NSNumber)lastIPCachingTTLMinutes;
- (NSNumber)lastIPCachingTTLMinutesV2;
- (NSNumber)lowPriorityMessageBatchSize;
- (NSNumber)lowQualityThresholdConnectedTime;
- (NSNumber)maxExpensiveConditionsConnectionAttempts;
- (NSNumber)maximumLowPriorityBatchesPerHour;
- (NSNumber)minPresenceSaltRotationInterval;
- (NSNumber)minimumIntervalFallbackEnabled;
- (NSNumber)nagleEnabled;
- (NSNumber)numberOfCriticalMessageKeepAlivesBeforeDisconnecting;
- (NSNumber)piggybackDualChannelAttempts;
- (NSNumber)powerOptimizationsForExpensiveNetworkingDisabled;
- (NSNumber)pubSubDefaultTimeout;
- (NSNumber)pubSubRetryAttemptsCount;
- (NSNumber)simulatorConnectionEnabled;
- (NSNumber)suspendToggleDailyLimit;
- (NSNumber)suspendToggleHourlyLimit;
- (NSNumber)wifiKeepAliveEarlyFireConstantInterval;
- (NSNumber)wwanTrackedLinkQualityOffTransitions;
- (NSNumber)wwanTrackedLinkQualityTimeInterval;
- (NSString)hostname;
- (NSString)urlTokenPrefix;
- (id)ExpensiveConditionsBackOffInterval;
- (id)bagExpiryInterval;
- (id)pendingCompletionBocks;
- (int)status;
- (unint64_t)serverCount;
- (void)_callCompletionBlocksWithError:(id)a3;
- (void)_failWithError:(id)a3;
- (void)_finishLoadWithResponse:(id)a3 urlHost:(id)a4 data:(id)a5;
- (void)addCompletionBlock:(id)a3;
- (void)dealloc;
- (void)setExpiry:(id)a3;
- (void)setExpiryInterval:(double)a3 expirationBlock:(id)a4;
- (void)setFetchDate:(id)a3;
- (void)setHasValidSignature:(BOOL)a3;
@end

@implementation APSConfiguration

+ (void)initialize
{
  id v2 = [objc_alloc((Class)NSURLCache) initWithMemoryCapacity:0 diskCapacity:0 diskPath:0];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
    id v2 = +[NSURLCache setSharedURLCache:v2];
    id v3 = v4;
  }
  _objc_release_x1(v2, v3);
}

+ (id)_onQueue_configurationForEnvironment:(id)a3 connectionType:(int64_t)a4
{
  id v5 = a3;
  v6 = sub_10006B508(a4);
  v7 = [v5 name];
  v8 = [v6 objectForKey:v7];

  if (v8 && [v8 _isExpired])
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = [v5 name];
      int v13 = 138412546;
      v14 = v8;
      __int16 v15 = 2112;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Config %@ for env %@ expired, flushing", (uint8_t *)&v13, 0x16u);
    }
    v10 = sub_10006B508(a4);
    v11 = [v5 name];
    [v10 removeObjectForKey:v11];

    v8 = 0;
  }

  return v8;
}

+ (id)configurationForEnvironment:(id)a3 connectionType:(int64_t)a4
{
  id v7 = a3;
  if (!+[NSThread isMainThread])
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"APSConfiguration.m" lineNumber:170 description:@"must be called from main thread"];
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_10006B770;
  v22 = sub_10006B780;
  id v23 = 0;
  v8 = sub_10006D278();
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10006B788;
  v13[3] = &unk_10012B748;
  id v14 = v7;
  __int16 v15 = &v18;
  id v16 = a1;
  int64_t v17 = a4;
  id v9 = v7;
  dispatch_sync(v8, v13);

  id v10 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v10;
}

+ (void)loadConfigurationForEnvironment:(id)a3 connectionType:(int64_t)a4 block:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  if (!+[NSThread isMainThread])
  {
    id v16 = +[NSAssertionHandler currentHandler];
    [v16 handleFailureInMethod:a2 object:a1 file:@"APSConfiguration.m" lineNumber:181 description:@"must be called from main thread"];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 name];
    v12 = sub_100006494(a4);
    *(_DWORD *)buf = 138412802;
    id v23 = v9;
    __int16 v24 = 2112;
    v25 = v11;
    __int16 v26 = 2112;
    v27 = v12;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "loadConfigurationForEnvironment: %@ %@ interface: %@", buf, 0x20u);
  }
  int v13 = sub_10006D278();
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10006B9C0;
  v17[3] = &unk_10012B770;
  id v20 = a1;
  int64_t v21 = a4;
  id v18 = v9;
  id v19 = v10;
  id v14 = v10;
  id v15 = v9;
  dispatch_sync(v13, v17);
}

+ (void)invalidateConfigurationForEnvironment:(id)a3 connectionType:(int64_t)a4
{
  id v7 = a3;
  if (!+[NSThread isMainThread])
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:a1 file:@"APSConfiguration.m" lineNumber:194 description:@"must be called from main thread"];
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [v7 name];
    *(_DWORD *)buf = 138412802;
    id v16 = a1;
    __int16 v17 = 2112;
    id v18 = v7;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: invalidateConfigurationForEnvironment: %@ %@", buf, 0x20u);
  }
  id v9 = sub_10006D278();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10006BC2C;
  v12[3] = &unk_10012B798;
  id v13 = v7;
  int64_t v14 = a4;
  id v10 = v7;
  dispatch_sync(v9, v12);
}

- (APSConfiguration)initWithEnvironment:(id)a3 connectionType:(int64_t)a4
{
  id v6 = a3;
  v35.receiver = self;
  v35.super_class = (Class)APSConfiguration;
  id v7 = [(APSConfiguration *)&v35 init];
  if (v7)
  {
    v8 = [v6 name];
    id v9 = (NSString *)[v8 copy];
    name = v7->_name;
    v7->_name = v9;

    v11 = [v6 configurationURL];
    v12 = (NSURL *)[v11 copy];
    url = v7->_url;
    v7->_url = v12;

    v7->_isLoadBalanced = [v6 isLoadBalanced];
    v7->_connectionType = a4;
    v7->_isLoaded = 0;
    uint64_t v14 = +[NSDate dateWithTimeIntervalSinceNow:900.0];
    expiry = v7->_expiry;
    v7->_expiry = (NSDate *)v14;

    id v16 = [v6 configurationURL];
    __int16 v17 = +[NSURLComponents componentsWithURL:v16 resolvingAgainstBaseURL:1];

    id v18 = +[NSMutableArray array];
    v31 = +[NSURLQueryItem queryItemWithName:@"v" value:@"1"];
    objc_msgSend(v18, "addObject:");
    if (v7->_connectionType)
    {
      __int16 v19 = @"WiFi";
    }
    else
    {
      id v20 = +[PCInterfaceMonitor sharedInstanceForIdentifier:1];
      int64_t v21 = [v20 networkCode];

      if ([v21 length]) {
        __int16 v19 = v21;
      }
      else {
        __int16 v19 = @"unknown";
      }
    }
    v22 = +[NSURLQueryItem queryItemWithName:@"c" value:v19];
    [v18 addObject:v22];
    [v17 setQueryItems:v18];
    id v23 = [v17 URL];
    __int16 v24 = +[NSMutableURLRequest requestWithURL:v23 cachePolicy:1 timeoutInterval:20.0];

    [v24 setHTTPShouldHandleCookies:0];
    if (qword_10015A8F8 != -1) {
      dispatch_once(&qword_10015A8F8, &stru_10012B870);
    }
    v25 = +[NSString stringWithFormat:@"%@/%@ (%@)", qword_10015A8E0, qword_10015A8E8, qword_10015A8F0];
    [v24 setValue:v25 forHTTPHeaderField:@"User-Agent"];

    if (sub_10007E748()) {
      [v24 setValue:@"true" forHTTPHeaderField:@"x-internal"];
    }
    __int16 v26 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    objc_msgSend(v26, "set_tlsTrustPinningPolicyName:", kSecPolicyNameApplePushService);
    v27 = +[NSURLSession sessionWithConfiguration:v26];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10006C0C4;
    v32[3] = &unk_10012B7E8;
    v33 = v7;
    id v34 = v27;
    id v28 = v27;
    v29 = [v28 dataTaskWithRequest:v24 completionHandler:v32];
    [v29 resume];
  }
  return v7;
}

- (void)dealloc
{
  expireTimer = self->_expireTimer;
  if (expireTimer) {
    dispatch_source_cancel(expireTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)APSConfiguration;
  [(APSConfiguration *)&v4 dealloc];
}

- (id)pendingCompletionBocks
{
  return self->_pendingCompletionBlocks;
}

- (void)addCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = sub_10006D278();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006C3D0;
  v7[3] = &unk_10012B810;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_callCompletionBlocksWithError:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    expiry = self->_expiry;
    *(_DWORD *)buf = 138412802;
    id v15 = self;
    __int16 v16 = 2112;
    __int16 v17 = expiry;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@ Calling configuration completion blocks, expiration date %@ error: %@", buf, 0x20u);
  }
  id v6 = self->_pendingCompletionBlocks;
  pendingCompletionBlocks = self->_pendingCompletionBlocks;
  self->_pendingCompletionBlocks = 0;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10006C5E0;
  block[3] = &unk_100129B68;
  v11 = v6;
  v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_failWithError:(id)a3
{
  id v4 = a3;
  id v5 = sub_10006D278();
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006C78C;
  v7[3] = &unk_100129D10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_finishLoadWithResponse:(id)a3 urlHost:(id)a4 data:(id)a5
{
  id v18 = 0;
  id v6 = +[NSPropertyListSerialization propertyListWithData:a5 options:0 format:0 error:&v18];
  id v7 = v18;
  if (!v6)
  {
    uint64_t v15 = APSUnderlyingError();
LABEL_8:
    __int16 v16 = (void *)v15;

    [(APSConfiguration *)self _failWithError:v16];
    id v7 = v16;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = APSError();
    goto LABEL_8;
  }
  if (self->_isLoadBalanced
    && ([v6 objectForKey:@"APNSCourierHostcount"],
        id v8 = objc_claimAutoreleasedReturnValue(),
        id v9 = [v8 unsignedIntegerValue],
        v8,
        !v9))
  {
    id v10 = APSError();
    [(APSConfiguration *)self _failWithError:v10];
  }
  else
  {
    objc_storeStrong((id *)&self->_plist, v6);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10006C9F0;
    v17[3] = &unk_10012A5E0;
    void v17[4] = self;
    id v10 = objc_retainBlock(v17);
    v11 = [(APSConfiguration *)self bagExpiryInterval];
    double v12 = (double)(uint64_t)[v11 integerValue];

    [(APSConfiguration *)self setExpiryInterval:v10 expirationBlock:v12];
    id v13 = +[NSDate date];
    fetchDate = self->_fetchDate;
    self->_fetchDate = v13;

    *(_WORD *)&self->_isLoaded = 257;
    [(APSConfiguration *)self _callCompletionBlocksWithError:0];
  }

LABEL_11:
}

- (NSString)hostname
{
  return (NSString *)[(NSDictionary *)self->_plist objectForKey:@"APNSCourierHostname"];
}

- (unint64_t)serverCount
{
  id v2 = [(NSDictionary *)self->_plist objectForKey:@"APNSCourierHostcount"];
  id v3 = v2;
  if (v2) {
    id v4 = [v2 unsignedIntegerValue];
  }
  else {
    id v4 = 0;
  }

  return (unint64_t)v4;
}

- (int)status
{
  id v2 = [(NSDictionary *)self->_plist objectForKey:@"APNSCourierStatus"];
  unsigned int v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

- (NSNumber)numberOfCriticalMessageKeepAlivesBeforeDisconnecting
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSNumberOfCriticalMessageKeepAlivesBeforeDisconnecting"];
}

- (NSNumber)criticalMessageKeepAliveTimerDuration
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSCriticalMessageKeepAliveTimerDuration"];
}

- (NSNumber)criticalMessageTimeout
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSCriticalMessageTimeout"];
}

- (NSNumber)lowPriorityMessageBatchSize
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSLowPriorityMessageBatchSize"];
}

- (NSNumber)maximumLowPriorityBatchesPerHour
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSMaximumLowPriorityBatchesPerHour"];
}

- (NSNumber)wwanTrackedLinkQualityTimeInterval
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSWWANTrackedLinkQualityTimeInterval"];
}

- (NSNumber)wwanTrackedLinkQualityOffTransitions
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSWWANTrackedLinkQualityOffTransitions"];
}

- (NSNumber)awdSlowReceiveThreshold
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSAWDSlowReceiveThreshold"];
}

- (NSNumber)activeInterval
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSActiveInterval"];
}

- (NSNumber)forcedShortTimeoutInterval
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSForcedShortTimeoutInterval"];
}

- (NSNumber)costDrivenDualChannelAttempts
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSCostDrivenDualChannelAttempts"];
}

- (NSNumber)piggybackDualChannelAttempts
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSPiggybackDualChannelAttempts"];
}

- (NSNumber)disableCostDrivenDualChannelAttempts
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSDisableCostDrivenDualChannel"];
}

- (NSNumber)keepAliveV2TimeDriftMaximum
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"KeepAliveV2TimeDriftMaxAllowed"];
}

- (NSNumber)lastIPCachingPercentage
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSIPCachingPercentage"];
}

- (NSNumber)lastIPCachingTTLMinutes
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSIPCachingTTLMinutes"];
}

- (NSNumber)lastIPCachingTTLMinutesV2
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSIPCachingTTLMinutesV2"];
}

- (NSNumber)nagleEnabled
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSNagleEnabledV2"];
}

- (NSNumber)minimumIntervalFallbackEnabled
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSMinimumIntervalFallbackEnabled"];
}

- (NSNumber)powerOptimizationsForExpensiveNetworkingDisabled
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSPowerOptimizationsForExpensiveNetworkingDisabled"];
}

- (NSNumber)maxExpensiveConditionsConnectionAttempts
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSMaxExpensiveConditionsConnectionAttempts"];
}

- (id)ExpensiveConditionsBackOffInterval
{
  return [(NSDictionary *)self->_plist objectForKey:@"APNSExpensiveConditionsBackOffInterval"];
}

- (NSNumber)wifiKeepAliveEarlyFireConstantInterval
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSWiFiKeepAliveEarlyFireConstantInterval"];
}

- (NSNumber)delayedReconnectIntervalWatchWiFi
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSDelayedReconnectInterval"];
}

- (NSNumber)delayedReconnectInterval
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSDelayedReconnectIntervalAll"];
}

- (NSNumber)delayedReconnectMaxInterval
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSDelayedReconnectMaxInterval"];
}

- (NSNumber)delayedReconnectMaxIntervalTrigger
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSDelayedReconnectMaxIntervalTrigger"];
}

- (NSNumber)delayedReconnectMinIntervalTrigger
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSDelayedReconnectMinIntervalTrigger"];
}

- (NSNumber)delayedReconnectTLSIntervalTrigger
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSDelayedReconnectTLSIntervalTrigger"];
}

- (NSNumber)delayedReconnectTLSInterval
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSDelayedReconnectTLSInterval"];
}

- (NSNumber)highQualityThresholdConnectedTime
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSHighQualityThresholdConnectedTime"];
}

- (NSNumber)lowQualityThresholdConnectedTime
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSLowQualityThresholdConnectedTime"];
}

- (NSNumber)disableDualModePiggybackTimer
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSDisableDualModePiggybackTimer"];
}

- (id)bagExpiryInterval
{
  return [(NSDictionary *)self->_plist objectForKey:@"APNSBagExpiry"];
}

- (NSNumber)suspendToggleHourlyLimit
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSSuspendToggleHourlyLimit"];
}

- (NSNumber)suspendToggleDailyLimit
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSSuspendToggleDailyLimit"];
}

- (NSNumber)delayedSuspendKeepAliveInterval
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSDelayedSuspendKeepAliveInterval"];
}

- (NSNumber)pubSubRetryAttemptsCount
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSCloudChannelRetryCount"];
}

- (NSNumber)pubSubDefaultTimeout
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSCloudChannelRequestTimeoutSeconds"];
}

- (NSString)urlTokenPrefix
{
  return (NSString *)[(NSDictionary *)self->_plist objectForKey:@"APNSWebpushUrlPrefix"];
}

- (NSNumber)minPresenceSaltRotationInterval
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSMinPresenceSaltRotationIntervalMinutes"];
}

- (NSNumber)simulatorConnectionEnabled
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSEnableSimulatorConnection"];
}

- (NSNumber)filterOptimizationEnabled
{
  return (NSNumber *)[(NSDictionary *)self->_plist objectForKey:@"APNSFilterOptimizationEnabledV1"];
}

- (BOOL)_isLoaded
{
  return self->_isLoaded;
}

- (BOOL)_isExpired
{
  expiry = self->_expiry;
  unsigned int v3 = +[NSDate date];
  LOBYTE(expiry) = (id)[(NSDate *)expiry compare:v3] != (id)1;

  return (char)expiry;
}

- (void)setExpiryInterval:(double)a3 expirationBlock:(id)a4
{
  id v6 = a4;
  if (a3 <= 0.0)
  {
    id v10 = +[NSDate dateWithTimeIntervalSinceNow:900.0];
    expiry = self->_expiry;
    self->_expiry = v10;
  }
  else
  {
    id v7 = +[NSDate dateWithTimeIntervalSinceNow:a3];
    id v8 = self->_expiry;
    self->_expiry = v7;

    expireTimer = self->_expireTimer;
    if (expireTimer)
    {
      dispatch_source_cancel(expireTimer);
    }
    else
    {
      double v12 = sub_10006D278();
      id v13 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v12);
      uint64_t v14 = self->_expireTimer;
      self->_expireTimer = v13;

      uint64_t v15 = self->_expireTimer;
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10006D0FC;
      v18[3] = &unk_10012B810;
      v18[4] = self;
      id v19 = v6;
      dispatch_source_set_event_handler(v15, v18);
    }
    __int16 v16 = self->_expireTimer;
    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v16, v17, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(a3 / 10.0 * 1000000000.0));
    dispatch_resume((dispatch_object_t)self->_expireTimer);
  }
}

- (NSDate)fetchDate
{
  return self->_fetchDate;
}

- (void)setFetchDate:(id)a3
{
}

- (NSDate)expiry
{
  return self->_expiry;
}

- (void)setExpiry:(id)a3
{
}

- (BOOL)hasValidSignature
{
  return self->_hasValidSignature;
}

- (void)setHasValidSignature:(BOOL)a3
{
  self->_hasValidSignature = a3;
}

- (NSNumber)expensiveConditionsBackOffInterval
{
  return self->_expensiveConditionsBackOffInterval;
}

- (NSNumber)filterMessageTimeout
{
  return self->_filterMessageTimeout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filterMessageTimeout, 0);
  objc_storeStrong((id *)&self->_expensiveConditionsBackOffInterval, 0);
  objc_storeStrong((id *)&self->_expireTimer, 0);
  objc_storeStrong((id *)&self->_pendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_loadingError, 0);
  objc_storeStrong((id *)&self->_fetchDate, 0);
  objc_storeStrong((id *)&self->_expiry, 0);
  objc_storeStrong((id *)&self->_plist, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end