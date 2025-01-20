@interface AMSDMultiUserMetrics
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)_eventWithTopic:(id)a3;
+ (id)_metricsInstanceWithBag:(id)a3;
+ (id)createBagForSubProfile;
- (AMSBagProtocol)bag;
- (AMSDMultiUserMetrics)init;
- (AMSDMultiUserMetrics)initWithBag:(id)a3;
- (AMSMetrics)metrics;
- (BOOL)_accountIsSecondaryHomeUser:(id)a3;
- (BOOL)_isTopicDefined:(id)a3;
- (NSDate)cloudKitFetchBeginDate;
- (NSDate)cloudKitSaveBeginDate;
- (NSDate)homeKitRepairRequestBeginDate;
- (NSDate)multiUserAuthBeginDate;
- (NSDate)multiUserGenerateTokenBeginDate;
- (NSString)metricsIdentifier;
- (id)_clampTimeStampValue:(id)a3;
- (id)_durationSinceDate:(id)a3;
- (id)_enqueueEventWithTopic:(id)a3 properties:(id)a4;
- (id)_enqueueEvents:(id)a3;
- (id)_enqueueProperties:(id)a3;
- (id)_enqueueProperties:(id)a3 account:(id)a4;
- (id)_eventTime;
- (id)_topicFromBag;
- (id)_userIdForBagNamespace:(id)a3;
- (id)enqueueCloudKitFetchBeganEvent;
- (id)enqueueCloudKitFetchFailedEventWithError:(id)a3;
- (id)enqueueCloudKitFetchFinishEventWithError:(id)a3;
- (id)enqueueCloudKitFetchSuccessEvent;
- (id)enqueueCloudKitSaveReceivedEvent;
- (id)enqueueCloudKitSaveRecordEvent;
- (id)enqueueCloudKitSaveRecordFinishEventWithError:(id)a3;
- (id)enqueueCloudKitSaveRecordSucceededEvent;
- (id)enqueueGenerateMultiUserTokenBeginEvent;
- (id)enqueueGenerateMultiUserTokenFailedEventWithError:(id)a3;
- (id)enqueueGenerateMultiUserTokenFinishEventWithError:(id)a3;
- (id)enqueueGenerateMultiUserTokenSuccessEvent;
- (id)enqueueHomeKitChangedReceivedEvent;
- (id)enqueueHomeKitRepairRequestCompletedFailedEventWithError:(id)a3;
- (id)enqueueHomeKitRepairRequestCompletedFinishEventWithError:(id)a3;
- (id)enqueueHomeKitRepairRequestCompletedSuccessEvent;
- (id)enqueueHomeKitRepairRequestReceivedEvent;
- (id)enqueueHomeKitRepairRequestSentEventForAccount:(id)a3;
- (id)enqueueMultiUserAuthenticationTokenFetchBeginEventForAccount:(id)a3;
- (id)enqueueMultiUserAuthenticationTokenFetchFailedEventForAccount:(id)a3 error:(id)a4;
- (id)enqueueMultiUserAuthenticationTokenFetchFinishEventForAccount:(id)a3 error:(id)a4;
- (id)enqueueMultiUserAuthenticationTokenFetchSuccessEventForAccount:(id)a3;
- (id)enqueueMultiUserRefreshBeginEventWithOptions:(id)a3;
- (void)flushEvents;
- (void)homeKitRepairRequestUpdateTokenBegin;
- (void)setCloudKitFetchBeginDate:(id)a3;
- (void)setCloudKitSaveBeginDate:(id)a3;
- (void)setHomeKitRepairRequestBeginDate:(id)a3;
- (void)setMetricsIdentifier:(id)a3;
- (void)setMultiUserAuthBeginDate:(id)a3;
- (void)setMultiUserGenerateTokenBeginDate:(id)a3;
@end

@implementation AMSDMultiUserMetrics

- (AMSDMultiUserMetrics)init
{
  v3 = [(id)objc_opt_class() createBagForSubProfile];
  v4 = [(AMSDMultiUserMetrics *)self initWithBag:v3];

  return v4;
}

- (AMSDMultiUserMetrics)initWithBag:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AMSDMultiUserMetrics;
  v6 = [(AMSDMultiUserMetrics *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    uint64_t v8 = +[AMSDMultiUserMetrics _metricsInstanceWithBag:v7->_bag];
    metrics = v7->_metrics;
    v7->_metrics = (AMSMetrics *)v8;

    v10 = +[NSUUID UUID];
    uint64_t v11 = [v10 UUIDString];
    metricsIdentifier = v7->_metricsIdentifier;
    v7->_metricsIdentifier = (NSString *)v11;
  }
  return v7;
}

- (void)flushEvents
{
  v3 = [(AMSDMultiUserMetrics *)self metrics];
  v4 = [v3 flush];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10003E2A4;
  v5[3] = &unk_100113360;
  v5[4] = self;
  [v4 addFinishBlock:v5];
}

- (id)enqueueCloudKitFetchBeganEvent
{
  v3 = +[NSDate date];
  [(AMSDMultiUserMetrics *)self setCloudKitFetchBeginDate:v3];

  CFStringRef v7 = @"eventType";
  CFStringRef v8 = @"MultiUserTokenFetchCloudKitBegin";
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v5 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v4];

  return v5;
}

- (id)enqueueCloudKitFetchFinishEventWithError:(id)a3
{
  id v4 = a3;
  CFStringRef v12 = @"duration";
  id v5 = [(AMSDMultiUserMetrics *)self cloudKitFetchBeginDate];
  v6 = [(AMSDMultiUserMetrics *)self _durationSinceDate:v5];
  v13 = v6;
  CFStringRef v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  CFStringRef v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  if (v4)
  {
    [v8 setObject:@"MultiUserTokenFetchCloudKitFailure" forKey:@"eventType"];
    v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
    [v8 setObject:v9 forKey:@"errorCode"];
  }
  else
  {
    [v8 setObject:@"MultiUserTokenFetchCloudKitSuccess" forKey:@"eventType"];
  }
  v10 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v8];

  return v10;
}

- (id)enqueueCloudKitFetchFailedEventWithError:(id)a3
{
  return [(AMSDMultiUserMetrics *)self enqueueCloudKitFetchFinishEventWithError:a3];
}

- (id)enqueueCloudKitFetchSuccessEvent
{
  return [(AMSDMultiUserMetrics *)self enqueueCloudKitFetchFinishEventWithError:0];
}

- (id)enqueueCloudKitSaveRecordEvent
{
  v3 = +[NSDate date];
  [(AMSDMultiUserMetrics *)self setCloudKitSaveBeginDate:v3];

  CFStringRef v7 = @"eventType";
  CFStringRef v8 = @"MultiUserTokenGenerationCloudKitSave";
  id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v5 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v4];

  return v5;
}

- (id)enqueueCloudKitSaveRecordFinishEventWithError:(id)a3
{
  id v4 = a3;
  CFStringRef v12 = @"duration";
  id v5 = [(AMSDMultiUserMetrics *)self cloudKitSaveBeginDate];
  v6 = [(AMSDMultiUserMetrics *)self _durationSinceDate:v5];
  v13 = v6;
  CFStringRef v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  CFStringRef v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  if (v4)
  {
    [v8 setObject:@"MultiUserTokenGenerationCloudKitSaveFailed" forKey:@"eventType"];
    v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
    [v8 setObject:v9 forKey:@"errorCode"];
  }
  else
  {
    [v8 setObject:@"MultiUserTokenGenerationCloudKitSaveSuccess" forKey:@"eventType"];
  }
  v10 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v8];

  return v10;
}

- (id)enqueueCloudKitSaveRecordSucceededEvent
{
  return [(AMSDMultiUserMetrics *)self enqueueCloudKitSaveRecordFinishEventWithError:0];
}

- (id)enqueueCloudKitSaveReceivedEvent
{
  CFStringRef v6 = @"eventType";
  CFStringRef v7 = @"MultiUserTokenGenerationCloudKitNotificationReceived";
  v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v4 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v3];

  return v4;
}

- (id)enqueueGenerateMultiUserTokenBeginEvent
{
  v3 = +[NSDate date];
  [(AMSDMultiUserMetrics *)self setMultiUserGenerateTokenBeginDate:v3];

  CFStringRef v7 = @"eventType";
  CFStringRef v8 = @"MultiUserTokenGenerationBegin";
  id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v5 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v4];

  return v5;
}

- (id)enqueueGenerateMultiUserTokenFinishEventWithError:(id)a3
{
  id v4 = a3;
  CFStringRef v12 = @"duration";
  id v5 = [(AMSDMultiUserMetrics *)self multiUserGenerateTokenBeginDate];
  CFStringRef v6 = [(AMSDMultiUserMetrics *)self _durationSinceDate:v5];
  v13 = v6;
  CFStringRef v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  CFStringRef v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  if (v4)
  {
    [v8 setObject:@"MultiUserTokenGenerationFailure" forKey:@"eventType"];
    v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
    [v8 setObject:v9 forKey:@"errorCode"];
  }
  else
  {
    [v8 setObject:@"MultiUserTokenGenerationSuccess" forKey:@"eventType"];
  }
  v10 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v8];

  return v10;
}

- (id)enqueueGenerateMultiUserTokenFailedEventWithError:(id)a3
{
  return [(AMSDMultiUserMetrics *)self enqueueGenerateMultiUserTokenFinishEventWithError:a3];
}

- (id)enqueueGenerateMultiUserTokenSuccessEvent
{
  return [(AMSDMultiUserMetrics *)self enqueueGenerateMultiUserTokenFinishEventWithError:0];
}

- (id)enqueueHomeKitChangedReceivedEvent
{
  CFStringRef v6 = @"eventType";
  CFStringRef v7 = @"HomeKitChangedNotificationReceived";
  v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v4 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v3];

  return v4;
}

- (id)enqueueHomeKitRepairRequestReceivedEvent
{
  CFStringRef v6 = @"eventType";
  CFStringRef v7 = @"HomeKitRepairRequestNotificationReceived";
  v3 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  id v4 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v3];

  return v4;
}

- (id)enqueueHomeKitRepairRequestCompletedFinishEventWithError:(id)a3
{
  id v4 = a3;
  CFStringRef v12 = @"duration";
  id v5 = [(AMSDMultiUserMetrics *)self homeKitRepairRequestBeginDate];
  CFStringRef v6 = [(AMSDMultiUserMetrics *)self _durationSinceDate:v5];
  v13 = v6;
  CFStringRef v7 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  CFStringRef v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  if (v4)
  {
    [v8 setObject:@"HomeKitRepairRequestCompletedFailure" forKey:@"eventType"];
    v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
    [v8 setObject:v9 forKey:@"errorCode"];
  }
  else
  {
    [v8 setObject:@"HomeKitRepairRequestCompletedSuccess" forKey:@"eventType"];
  }
  v10 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v8];

  return v10;
}

- (id)enqueueHomeKitRepairRequestCompletedFailedEventWithError:(id)a3
{
  return [(AMSDMultiUserMetrics *)self enqueueHomeKitRepairRequestCompletedFinishEventWithError:a3];
}

- (id)enqueueHomeKitRepairRequestCompletedSuccessEvent
{
  return [(AMSDMultiUserMetrics *)self enqueueHomeKitRepairRequestCompletedFinishEventWithError:0];
}

- (id)enqueueHomeKitRepairRequestSentEventForAccount:(id)a3
{
  CFStringRef v9 = @"eventType";
  CFStringRef v10 = @"HomeKitRepairRequestSend";
  id v4 = a3;
  id v5 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  CFStringRef v6 = +[NSMutableDictionary dictionaryWithDictionary:v5];

  CFStringRef v7 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v6 account:v4];

  return v7;
}

- (void)homeKitRepairRequestUpdateTokenBegin
{
  id v3 = +[NSDate date];
  [(AMSDMultiUserMetrics *)self setHomeKitRepairRequestBeginDate:v3];
}

- (id)enqueueMultiUserAuthenticationTokenFetchBeginEventForAccount:(id)a3
{
  id v4 = a3;
  id v5 = +[NSDate date];
  [(AMSDMultiUserMetrics *)self setMultiUserAuthBeginDate:v5];

  CFStringRef v9 = @"eventType";
  CFStringRef v10 = @"MultiUserTokenFetchBegin";
  CFStringRef v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  CFStringRef v7 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v6 account:v4];

  return v7;
}

- (id)enqueueMultiUserAuthenticationTokenFetchFinishEventForAccount:(id)a3 error:(id)a4
{
  id v6 = a4;
  CFStringRef v16 = @"duration";
  id v7 = a3;
  CFStringRef v8 = [(AMSDMultiUserMetrics *)self multiUserAuthBeginDate];
  CFStringRef v9 = [(AMSDMultiUserMetrics *)self _durationSinceDate:v8];
  v17 = v9;
  CFStringRef v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  uint64_t v11 = +[NSMutableDictionary dictionaryWithDictionary:v10];

  if (v6)
  {
    [v11 setObject:@"MultiUserTokenFetchFailure" forKey:@"eventType"];
    CFStringRef v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
    [v11 setObject:v12 forKey:@"errorCode"];
  }
  else
  {
    [v11 setObject:@"MultiUserTokenFetchSuccess" forKey:@"eventType"];
  }
  id v13 = [v11 copy];
  objc_super v14 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v13 account:v7];

  return v14;
}

- (id)enqueueMultiUserAuthenticationTokenFetchFailedEventForAccount:(id)a3 error:(id)a4
{
  return [(AMSDMultiUserMetrics *)self enqueueMultiUserAuthenticationTokenFetchFinishEventForAccount:a3 error:a4];
}

- (id)enqueueMultiUserAuthenticationTokenFetchSuccessEventForAccount:(id)a3
{
  return [(AMSDMultiUserMetrics *)self enqueueMultiUserAuthenticationTokenFetchFinishEventForAccount:a3 error:0];
}

- (id)enqueueMultiUserRefreshBeginEventWithOptions:(id)a3
{
  v8[0] = @"eventType";
  v8[1] = @"refreshReason";
  v9[0] = @"MultiUserRefreshBegin";
  id v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [a3 reasonType]);
  v9[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  id v6 = [(AMSDMultiUserMetrics *)self _enqueueProperties:v5];

  return v6;
}

+ (NSString)bagSubProfile
{
  if (qword_100130330 != -1) {
    dispatch_once(&qword_100130330, &stru_100113380);
  }
  v2 = (void *)qword_100130338;
  return (NSString *)v2;
}

+ (NSString)bagSubProfileVersion
{
  if (qword_100130340 != -1) {
    dispatch_once(&qword_100130340, &stru_1001133A0);
  }
  v2 = (void *)qword_100130348;
  return (NSString *)v2;
}

+ (id)createBagForSubProfile
{
  v2 = [(id)objc_opt_class() bagSubProfile];
  id v3 = [(id)objc_opt_class() bagSubProfileVersion];
  id v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

- (BOOL)_accountIsSecondaryHomeUser:(id)a3
{
  return 0;
}

- (id)_clampTimeStampValue:(id)a3
{
  uint64_t v3 = (uint64_t)[a3 longLongValue];
  uint64_t v4 = v3 / qword_10012DA60 * qword_10012DA60;
  return +[NSNumber numberWithLongLong:v4];
}

- (id)_durationSinceDate:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = +[NSDate date];
    [v5 timeIntervalSinceDate:v4];
    double v7 = v6;

    CFStringRef v8 = +[NSNumber numberWithDouble:v7];
  }
  else
  {
    CFStringRef v8 = &off_10011BEA8;
  }
  return v8;
}

- (id)_enqueueEventWithTopic:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = v7;
  if (v6 && v7)
  {
    CFStringRef v9 = [(id)objc_opt_class() _eventWithTopic:v6];
    [v9 addPropertiesWithDictionary:v8];
    CFStringRef v10 = [v8 objectForKeyedSubscript:@"canaryIdentifier"];
    [v9 setCanaryIdentifier:v10];

    v27 = v9;
    uint64_t v11 = +[NSArray arrayWithObjects:&v27 count:1];
    CFStringRef v12 = [(AMSDMultiUserMetrics *)self _enqueueEvents:v11];
  }
  else
  {
    id v13 = +[AMSLogConfig sharedAccountsConfig];
    if (!v13)
    {
      id v13 = +[AMSLogConfig sharedConfig];
    }
    objc_super v14 = [v13 OSLogObject];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = objc_opt_class();
      CFStringRef v16 = AMSLogKey();
      v17 = AMSHashIfNeeded();
      int v19 = 138544130;
      uint64_t v20 = v15;
      __int16 v21 = 2114;
      v22 = v16;
      __int16 v23 = 2114;
      id v24 = v6;
      __int16 v25 = 2114;
      v26 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempted to enqueue event without topic or properties. topic = %{public}@ properties = %{public}@", (uint8_t *)&v19, 0x2Au);
    }
    CFStringRef v9 = AMSError();
    CFStringRef v12 = +[AMSBinaryPromise promiseWithError:v9];
  }

  return v12;
}

- (id)_enqueueEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDMultiUserMetrics *)self metrics];
  id v6 = [v5 promiseForEnqueueingEvents:v4];

  return v6;
}

- (id)_enqueueProperties:(id)a3
{
  return [(AMSDMultiUserMetrics *)self _enqueueProperties:a3 account:0];
}

- (id)_enqueueProperties:(id)a3 account:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = [a3 mutableCopy];
    if ([(AMSDMultiUserMetrics *)self _accountIsSecondaryHomeUser:v6]) {
      CFStringRef v8 = @"authPerformanceSecondary";
    }
    else {
      CFStringRef v8 = @"authPerformance";
    }
    CFStringRef v9 = [(AMSDMultiUserMetrics *)self metricsIdentifier];
    [v7 setObject:v9 forKey:@"canaryIdentifier"];

    CFStringRef v10 = +[AMSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      CFStringRef v10 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v11 = [v10 OSLogObject];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = objc_opt_class();
      id v13 = AMSLogKey();
      objc_super v14 = AMSHashIfNeeded();
      uint64_t v15 = AMSHashIfNeeded();
      *(_DWORD *)buf = 138544130;
      uint64_t v33 = v12;
      __int16 v34 = 2114;
      v35 = v13;
      __int16 v36 = 2114;
      v37 = v14;
      __int16 v38 = 2114;
      v39 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating Event with properties = %{public}@ using account = %{public}@", buf, 0x2Au);
    }
    id v16 = objc_alloc_init((Class)AMSMutableBinaryPromise);
    v17 = [(AMSDMultiUserMetrics *)self _topicFromBag];
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10003FC00;
    v27[3] = &unk_1001133C8;
    id v18 = v16;
    id v28 = v18;
    v29 = self;
    v30 = (__CFString *)v8;
    id v31 = v7;
    id v19 = v7;
    [v17 resultWithCompletion:v27];

    uint64_t v20 = v31;
    id v21 = v18;
  }
  else
  {
    v22 = +[AMSLogConfig sharedAccountsConfig];
    if (!v22)
    {
      v22 = +[AMSLogConfig sharedConfig];
    }
    __int16 v23 = [v22 OSLogObject];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = objc_opt_class();
      __int16 v25 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v33 = v24;
      __int16 v34 = 2114;
      v35 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempted to enqueue event without properties.", buf, 0x16u);
    }
    AMSError();
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = +[AMSBinaryPromise promiseWithError:v19];
  }

  return v21;
}

- (id)_eventTime
{
  uint64_t v3 = +[NSDate date];
  id v4 = +[AMSMetrics serverTimeFromDate:v3];
  id v5 = [(AMSDMultiUserMetrics *)self _clampTimeStampValue:v4];

  return v5;
}

+ (id)_eventWithTopic:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)AMSMetricsEvent) initWithTopic:v3];

  [v4 setCheckDiagnosticsAndUsageSetting:1];
  return v4;
}

- (BOOL)_isTopicDefined:(id)a3
{
  unsigned int v4 = [a3 isEqualToString:@"_topic_not_defined_"] ^ 1;
  if (a3) {
    return v4;
  }
  else {
    return 0;
  }
}

+ (id)_metricsInstanceWithBag:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)AMSMetrics) initWithContainerID:@"com.apple.AppleMediaServices" bag:v3];

  return v4;
}

- (id)_topicFromBag
{
  id v3 = [(AMSDMultiUserMetrics *)self bag];
  objc_opt_class();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(AMSDMultiUserMetrics *)self bag];
    [v5 setDefaultValue:@"_topic_not_defined_" forKey:@"authPerfTopicName"];
  }
  id v6 = [(AMSDMultiUserMetrics *)self bag];
  id v7 = [v6 stringForKey:@"authPerfTopicName"];
  CFStringRef v8 = [v7 valuePromise];

  return v8;
}

- (id)_userIdForBagNamespace:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSDMultiUserMetrics *)self bag];
  id v6 = +[AMSMetricsIdentifierStore identifierForAccount:0 bag:v5 bagNamespace:v4 keyName:@"userId"];

  return v6;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (NSDate)cloudKitFetchBeginDate
{
  return self->_cloudKitFetchBeginDate;
}

- (void)setCloudKitFetchBeginDate:(id)a3
{
}

- (NSDate)cloudKitSaveBeginDate
{
  return self->_cloudKitSaveBeginDate;
}

- (void)setCloudKitSaveBeginDate:(id)a3
{
}

- (NSDate)homeKitRepairRequestBeginDate
{
  return self->_homeKitRepairRequestBeginDate;
}

- (void)setHomeKitRepairRequestBeginDate:(id)a3
{
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (NSString)metricsIdentifier
{
  return self->_metricsIdentifier;
}

- (void)setMetricsIdentifier:(id)a3
{
}

- (NSDate)multiUserAuthBeginDate
{
  return self->_multiUserAuthBeginDate;
}

- (void)setMultiUserAuthBeginDate:(id)a3
{
}

- (NSDate)multiUserGenerateTokenBeginDate
{
  return self->_multiUserGenerateTokenBeginDate;
}

- (void)setMultiUserGenerateTokenBeginDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiUserGenerateTokenBeginDate, 0);
  objc_storeStrong((id *)&self->_multiUserAuthBeginDate, 0);
  objc_storeStrong((id *)&self->_metricsIdentifier, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_homeKitRepairRequestBeginDate, 0);
  objc_storeStrong((id *)&self->_cloudKitSaveBeginDate, 0);
  objc_storeStrong((id *)&self->_cloudKitFetchBeginDate, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end