@interface AMSAuthenticateMetrics
+ (id)_eventWithTopic:(id)a3;
+ (id)_metricsInstanceWithBag:(id)a3;
+ (id)bagSubProfile;
+ (id)bagSubProfileVersion;
+ (id)createBagForSubProfile;
- (AMSAuthenticateMetrics)init;
- (AMSAuthenticateMetrics)initWithBag:(id)a3;
- (AMSBagProtocol)bag;
- (AMSMetrics)metrics;
- (BOOL)_accountIsSecondaryHomeUser:(id)a3;
- (BOOL)_isTopicDefined:(id)a3;
- (NSDate)beginDate;
- (id)_authenticationTypeStringFor:(unint64_t)a3;
- (id)_clampTimeStampValue:(id)a3;
- (id)_credentialSourceStringFor:(unint64_t)a3;
- (id)_durationSinceDate:(id)a3;
- (id)_enqueueEventWithTopic:(id)a3 properties:(id)a4;
- (id)_enqueueEvents:(id)a3;
- (id)_enqueueProperties:(id)a3 account:(id)a4;
- (id)_eventTime;
- (id)_topicFromBag;
- (id)_userIdForBagNamespace:(id)a3;
- (id)enqueueAuthKitBeginEventWithOptions:(id)a3 account:(id)a4;
- (id)enqueueAuthKitFinishEventWithOptions:(id)a3 account:(id)a4 error:(id)a5;
- (id)enqueueAuthenticationBeginEventWithOptions:(id)a3 serverRequested:(BOOL)a4 account:(id)a5;
- (id)enqueueVerifyCredentialsBeginEventWithOptions:(id)a3 account:(id)a4;
- (id)enqueueVerifyCredentialsFinishEventWithOptions:(id)a3 account:(id)a4 error:(id)a5;
- (id)enqueueWithEvent:(unint64_t)a3 context:(id)a4;
- (void)flushEvents;
- (void)setBeginDate:(id)a3;
@end

@implementation AMSAuthenticateMetrics

- (AMSAuthenticateMetrics)init
{
  v3 = [(id)objc_opt_class() createBagForSubProfile];
  v4 = [(AMSAuthenticateMetrics *)self initWithBag:v3];

  return v4;
}

- (AMSAuthenticateMetrics)initWithBag:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AMSAuthenticateMetrics;
  v6 = [(AMSAuthenticateMetrics *)&v12 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bag, a3);
    beginDate = v7->_beginDate;
    v7->_beginDate = 0;

    uint64_t v9 = +[AMSAuthenticateMetrics _metricsInstanceWithBag:v7->_bag];
    metrics = v7->_metrics;
    v7->_metrics = (AMSMetrics *)v9;
  }
  return v7;
}

- (id)enqueueWithEvent:(unint64_t)a3 context:(id)a4
{
  id v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 0uLL:
      v8 = [v6 options];
      uint64_t v9 = [v7 isServerRequested];
      v10 = [v7 account];
      v11 = [(AMSAuthenticateMetrics *)self enqueueAuthenticationBeginEventWithOptions:v8 serverRequested:v9 account:v10];

      break;
    case 1uLL:
      v8 = [v6 options];
      objc_super v12 = [v7 account];
      uint64_t v13 = [(AMSAuthenticateMetrics *)self enqueueAuthKitBeginEventWithOptions:v8 account:v12];
      goto LABEL_7;
    case 2uLL:
      v8 = [v6 options];
      objc_super v12 = [v7 account];
      v14 = [v7 error];
      uint64_t v15 = [(AMSAuthenticateMetrics *)self enqueueAuthKitFinishEventWithOptions:v8 account:v12 error:v14];
      goto LABEL_9;
    case 3uLL:
      v8 = [v6 options];
      objc_super v12 = [v7 account];
      uint64_t v13 = [(AMSAuthenticateMetrics *)self enqueueVerifyCredentialsBeginEventWithOptions:v8 account:v12];
LABEL_7:
      v11 = (void *)v13;
      goto LABEL_10;
    case 4uLL:
      v8 = [v6 options];
      objc_super v12 = [v7 account];
      v14 = [v7 error];
      uint64_t v15 = [(AMSAuthenticateMetrics *)self enqueueVerifyCredentialsFinishEventWithOptions:v8 account:v12 error:v14];
LABEL_9:
      v11 = (void *)v15;

LABEL_10:
      break;
    default:
      v8 = AMSError(2, @"Unrecognized metrics event", @"The provided AMSAuthenticateMetricsEvent was not recognized", 0);
      v11 = +[AMSBinaryPromise promiseWithError:v8];
      break;
  }

  return v11;
}

- (void)flushEvents
{
  v3 = [(AMSAuthenticateMetrics *)self metrics];
  v4 = [v3 flush];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__AMSAuthenticateMetrics_flushEvents__block_invoke;
  v5[3] = &unk_1E559EE78;
  v5[4] = self;
  [v4 addFinishBlock:v5];
}

void __37__AMSAuthenticateMetrics_flushEvents__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = +[AMSLogConfig sharedAccountsConfig];
  if (!v0)
  {
    v0 = +[AMSLogConfig sharedConfig];
  }
  v1 = [v0 OSLogObject];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v2 = objc_opt_class();
    v3 = AMSLogKey();
    int v4 = 138543618;
    uint64_t v5 = v2;
    __int16 v6 = 2114;
    v7 = v3;
    _os_log_impl(&dword_18D554000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Flushing Authentication Metrics", (uint8_t *)&v4, 0x16u);
  }
}

- (id)enqueueAuthenticationBeginEventWithOptions:(id)a3 serverRequested:(BOOL)a4 account:(id)a5
{
  BOOL v5 = a4;
  v21[4] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)MEMORY[0x1E4F1CA60];
  v20[0] = @"authenticationType";
  id v9 = a5;
  id v10 = a3;
  v11 = -[AMSAuthenticateMetrics _authenticationTypeStringFor:](self, "_authenticationTypeStringFor:", [v10 authenticationType]);
  v21[0] = v11;
  v21[1] = @"AuthenticationBegin";
  v20[1] = @"eventType";
  v20[2] = @"isServerRequested";
  if (v5) {
    objc_super v12 = @"true";
  }
  else {
    objc_super v12 = @"false";
  }
  v21[2] = v12;
  v20[3] = @"supportsUI";
  if ([v10 allowServerDialogs]) {
    uint64_t v13 = @"true";
  }
  else {
    uint64_t v13 = @"false";
  }
  v21[3] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:4];
  uint64_t v15 = [v8 dictionaryWithDictionary:v14];

  v16 = [v10 metricsIdentifier];

  objc_msgSend(v15, "ams_setNullableObject:forKey:", v16, @"canaryIdentifier");
  v17 = (void *)[v15 copy];
  v18 = [(AMSAuthenticateMetrics *)self _enqueueProperties:v17 account:v9];

  return v18;
}

- (id)enqueueAuthKitBeginEventWithOptions:(id)a3 account:(id)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  __int16 v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 date];
  [(AMSAuthenticateMetrics *)self setBeginDate:v9];

  id v10 = (void *)MEMORY[0x1E4F1CA60];
  v19[0] = @"authenticationType";
  v11 = -[AMSAuthenticateMetrics _authenticationTypeStringFor:](self, "_authenticationTypeStringFor:", [v8 authenticationType]);
  v20[0] = v11;
  v20[1] = @"AuthKitAuthenticationBegin";
  v19[1] = @"eventType";
  v19[2] = @"supportsUI";
  int v12 = [v8 allowServerDialogs];
  uint64_t v13 = @"false";
  if (v12) {
    uint64_t v13 = @"true";
  }
  v20[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  uint64_t v15 = [v10 dictionaryWithDictionary:v14];

  v16 = [v8 metricsIdentifier];

  objc_msgSend(v15, "ams_setNullableObject:forKey:", v16, @"canaryIdentifier");
  v17 = [(AMSAuthenticateMetrics *)self _enqueueProperties:v15 account:v7];

  return v17;
}

- (id)enqueueAuthKitFinishEventWithOptions:(id)a3 account:(id)a4 error:(id)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1CA60];
  v22[0] = @"authenticationType";
  id v10 = a4;
  id v11 = a3;
  int v12 = -[AMSAuthenticateMetrics _authenticationTypeStringFor:](self, "_authenticationTypeStringFor:", [v11 authenticationType]);
  v22[1] = @"duration";
  v23[0] = v12;
  uint64_t v13 = [(AMSAuthenticateMetrics *)self beginDate];
  v14 = [(AMSAuthenticateMetrics *)self _durationSinceDate:v13];
  v23[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v16 = [v9 dictionaryWithDictionary:v15];

  v17 = [v11 metricsIdentifier];

  objc_msgSend(v16, "ams_setNullableObject:forKey:", v17, @"canaryIdentifier");
  if (v8)
  {
    [v16 setObject:@"AuthKitAuthenticationFailure" forKey:@"eventType"];
    v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v8, "code"));
    [v16 setObject:v18 forKey:@"errorCode"];
  }
  else
  {
    [v16 setObject:@"AuthKitAuthenticationSuccess" forKey:@"eventType"];
  }
  v19 = (void *)[v16 copy];
  v20 = [(AMSAuthenticateMetrics *)self _enqueueProperties:v19 account:v10];

  return v20;
}

- (id)enqueueVerifyCredentialsBeginEventWithOptions:(id)a3 account:(id)a4
{
  v20[3] = *MEMORY[0x1E4F143B8];
  __int16 v6 = (void *)MEMORY[0x1E4F1C9C8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 date];
  [(AMSAuthenticateMetrics *)self setBeginDate:v9];

  id v10 = (void *)MEMORY[0x1E4F1CA60];
  v19[0] = @"credentialSource";
  id v11 = -[AMSAuthenticateMetrics _credentialSourceStringFor:](self, "_credentialSourceStringFor:", [v8 credentialSource]);
  v20[0] = v11;
  v20[1] = @"CommerceAuthenticationBegin";
  v19[1] = @"eventType";
  v19[2] = @"supportsUI";
  int v12 = [v8 allowServerDialogs];
  uint64_t v13 = @"false";
  if (v12) {
    uint64_t v13 = @"true";
  }
  v20[2] = v13;
  v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:3];
  uint64_t v15 = [v10 dictionaryWithDictionary:v14];

  v16 = [v8 metricsIdentifier];

  objc_msgSend(v15, "ams_setNullableObject:forKey:", v16, @"canaryIdentifier");
  v17 = [(AMSAuthenticateMetrics *)self _enqueueProperties:v15 account:v7];

  return v17;
}

- (id)enqueueVerifyCredentialsFinishEventWithOptions:(id)a3 account:(id)a4 error:(id)a5
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1CA60];
  v22[0] = @"credentialSource";
  id v10 = a4;
  id v11 = a3;
  int v12 = -[AMSAuthenticateMetrics _credentialSourceStringFor:](self, "_credentialSourceStringFor:", [v11 credentialSource]);
  v22[1] = @"duration";
  v23[0] = v12;
  uint64_t v13 = [(AMSAuthenticateMetrics *)self beginDate];
  v14 = [(AMSAuthenticateMetrics *)self _durationSinceDate:v13];
  v23[1] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:v22 count:2];
  v16 = [v9 dictionaryWithDictionary:v15];

  v17 = [v11 metricsIdentifier];

  objc_msgSend(v16, "ams_setNullableObject:forKey:", v17, @"canaryIdentifier");
  if (v8)
  {
    [v16 setObject:@"CommerceAuthenticationFailure" forKey:@"eventType"];
    v18 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(v8, "code"));
    [v16 setObject:v18 forKey:@"errorCode"];
  }
  else
  {
    [v16 setObject:@"CommerceAuthenticationSuccess" forKey:@"eventType"];
  }
  v19 = (void *)[v16 copy];
  v20 = [(AMSAuthenticateMetrics *)self _enqueueProperties:v19 account:v10];

  return v20;
}

+ (id)bagSubProfile
{
  if (_MergedGlobals_82 != -1) {
    dispatch_once(&_MergedGlobals_82, &__block_literal_global_9);
  }
  uint64_t v2 = (void *)qword_1EB38D648;
  return v2;
}

void __39__AMSAuthenticateMetrics_bagSubProfile__block_invoke()
{
  v0 = (void *)qword_1EB38D648;
  qword_1EB38D648 = @"AMSCore";
}

+ (id)bagSubProfileVersion
{
  if (qword_1EB38D650 != -1) {
    dispatch_once(&qword_1EB38D650, &__block_literal_global_85);
  }
  uint64_t v2 = (void *)qword_1EB38D658;
  return v2;
}

void __46__AMSAuthenticateMetrics_bagSubProfileVersion__block_invoke()
{
  v0 = (void *)qword_1EB38D658;
  qword_1EB38D658 = @"1";
}

+ (id)createBagForSubProfile
{
  uint64_t v2 = [(id)objc_opt_class() bagSubProfile];
  v3 = [(id)objc_opt_class() bagSubProfileVersion];
  int v4 = +[AMSBag bagForProfile:v2 profileVersion:v3];

  return v4;
}

+ (id)_metricsInstanceWithBag:(id)a3
{
  id v3 = a3;
  int v4 = [[AMSMetrics alloc] initWithContainerID:0x1EDCACB08 bag:v3];

  return v4;
}

+ (id)_eventWithTopic:(id)a3
{
  id v3 = a3;
  int v4 = [[AMSMetricsEvent alloc] initWithTopic:v3];

  [(AMSMetricsEvent *)v4 setCheckDiagnosticsAndUsageSetting:1];
  return v4;
}

- (id)_topicFromBag
{
  id v3 = [(AMSAuthenticateMetrics *)self bag];
  objc_opt_class();
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(AMSAuthenticateMetrics *)self bag];
    [v5 setDefaultValue:@"_topic_not_defined_" forKey:@"authPerfTopicName"];
  }
  __int16 v6 = [(AMSAuthenticateMetrics *)self bag];
  id v7 = [v6 stringForKey:@"authPerfTopicName"];
  id v8 = [v7 valuePromise];

  return v8;
}

- (BOOL)_accountIsSecondaryHomeUser:(id)a3
{
  return 0;
}

- (id)_authenticationTypeStringFor:(unint64_t)a3
{
  if (a3 > 3) {
    return @"unrecognized";
  }
  else {
    return off_1E559EEC0[a3];
  }
}

- (id)_clampTimeStampValue:(id)a3
{
  uint64_t v3 = 4000 * ([a3 longLongValue] / 4000);
  int v4 = (void *)MEMORY[0x1E4F28ED0];
  return (id)[v4 numberWithLongLong:v3];
}

- (id)_eventTime
{
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  int v4 = +[AMSMetrics serverTimeFromDate:v3];
  BOOL v5 = [(AMSAuthenticateMetrics *)self _clampTimeStampValue:v4];

  return v5;
}

- (id)_credentialSourceStringFor:(unint64_t)a3
{
  if (a3 > 6) {
    return @"unrecognized";
  }
  else {
    return off_1E559EEE0[a3];
  }
}

- (id)_durationSinceDate:(id)a3
{
  if (a3)
  {
    int v4 = (void *)MEMORY[0x1E4F1C9C8];
    id v5 = a3;
    __int16 v6 = [v4 date];
    [v6 timeIntervalSinceDate:v5];
    double v8 = v7;

    id v9 = [MEMORY[0x1E4F28ED0] numberWithDouble:v8];
  }
  else
  {
    id v9 = &unk_1EDD00CE8;
  }
  return v9;
}

- (id)_enqueueEvents:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSAuthenticateMetrics *)self metrics];
  __int16 v6 = [v5 promiseForEnqueueingEvents:v4];

  return v6;
}

- (id)_enqueueProperties:(id)a3 account:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (a3)
  {
    double v7 = (void *)[a3 mutableCopy];
    if ([(AMSAuthenticateMetrics *)self _accountIsSecondaryHomeUser:v6]) {
      double v8 = @"authPerformanceSecondary";
    }
    else {
      double v8 = @"authPerformance";
    }
    id v9 = +[AMSLogConfig sharedAccountsConfig];
    if (!v9)
    {
      id v9 = +[AMSLogConfig sharedConfig];
    }
    id v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = objc_opt_class();
      int v12 = AMSLogKey();
      uint64_t v13 = AMSHashIfNeeded(v7);
      v14 = AMSHashIfNeeded(v6);
      *(_DWORD *)buf = 138544130;
      uint64_t v32 = v11;
      __int16 v33 = 2114;
      v34 = v12;
      __int16 v35 = 2114;
      v36 = v13;
      __int16 v37 = 2114;
      v38 = v14;
      _os_log_impl(&dword_18D554000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Creating Event with properties = %{public}@ using account = %{public}@", buf, 0x2Au);
    }
    uint64_t v15 = objc_alloc_init(AMSMutableBinaryPromise);
    v16 = [(AMSAuthenticateMetrics *)self _topicFromBag];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __53__AMSAuthenticateMetrics__enqueueProperties_account___block_invoke;
    v26[3] = &unk_1E559EEA0;
    v17 = v15;
    v27 = v17;
    v28 = self;
    v29 = v8;
    v30 = v7;
    id v18 = v7;
    [v16 resultWithCompletion:v26];

    v19 = v30;
    v20 = v17;
  }
  else
  {
    v21 = +[AMSLogConfig sharedAccountsConfig];
    if (!v21)
    {
      v21 = +[AMSLogConfig sharedConfig];
    }
    v22 = [v21 OSLogObject];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = objc_opt_class();
      v24 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v32 = v23;
      __int16 v33 = 2114;
      v34 = v24;
      _os_log_impl(&dword_18D554000, v22, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempted to enqueue event without properties.", buf, 0x16u);
    }
    AMSError(2, @"Missing Properties", 0, 0);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    v20 = +[AMSBinaryPromise promiseWithError:v18];
  }

  return v20;
}

void __53__AMSAuthenticateMetrics__enqueueProperties_account___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) finishWithError:a3];
  }
  else if ([*(id *)(a1 + 40) _isTopicDefined:v5])
  {
    id v6 = +[AMSLogConfig sharedAccountsConfig];
    if (!v6)
    {
      id v6 = +[AMSLogConfig sharedConfig];
    }
    double v7 = [v6 OSLogObject];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = objc_opt_class();
      id v9 = AMSLogKey();
      *(_DWORD *)buf = 138543874;
      uint64_t v20 = v8;
      __int16 v21 = 2114;
      v22 = v9;
      __int16 v23 = 2114;
      id v24 = v5;
      _os_log_impl(&dword_18D554000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: [%{public}@] Queue Metrics Event for topic %{public}@", buf, 0x20u);
    }
    id v10 = [*(id *)(a1 + 40) _userIdForBagNamespace:*(void *)(a1 + 48)];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__AMSAuthenticateMetrics__enqueueProperties_account___block_invoke_121;
    v15[3] = &unk_1E559EEA0;
    int8x16_t v14 = *(int8x16_t *)(a1 + 32);
    id v11 = (id)v14.i64[0];
    int8x16_t v16 = vextq_s8(v14, v14, 8uLL);
    id v17 = *(id *)(a1 + 56);
    id v18 = v5;
    [v10 resultWithCompletion:v15];
  }
  else
  {
    int v12 = *(void **)(a1 + 32);
    uint64_t v13 = AMSError(2, @"Topic string not found", 0, 0);
    [v12 finishWithError:v13];
  }
}

void __53__AMSAuthenticateMetrics__enqueueProperties_account___block_invoke_121(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    int8x16_t v14 = +[AMSLogConfig sharedAccountsConfig];
    if (!v14)
    {
      int8x16_t v14 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v15 = [v14 OSLogObject];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = objc_opt_class();
      id v17 = AMSLogKey();
      id v18 = AMSLogableError(v6);
      int v21 = 138543874;
      uint64_t v22 = v16;
      __int16 v23 = 2114;
      id v24 = v17;
      __int16 v25 = 2114;
      v26 = v18;
      _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to create metrics event due to an error while fetching userId. error = %{public}@", (uint8_t *)&v21, 0x20u);
    }
    v19 = *(void **)(a1 + 40);
    uint64_t v20 = AMSError(2, @"Unable to enqueue event", @"Failed to create event, userId key not found in store", v6);
    [v19 finishWithError:v20];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "ams_setNullableObject:forKey:", a2, @"userId");
    double v7 = *(void **)(a1 + 48);
    uint64_t v8 = [*(id *)(a1 + 32) _eventTime];
    objc_msgSend(v7, "ams_setNullableObject:forKey:", v8, 0x1EDCBAF48);

    id v10 = *(void **)(a1 + 32);
    id v9 = *(void **)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 56);
    int v12 = (void *)[*(id *)(a1 + 48) copy];
    uint64_t v13 = [v10 _enqueueEventWithTopic:v11 properties:v12];
    [v9 finishWithPromise:v13];
  }
}

- (id)_enqueueEventWithTopic:(id)a3 properties:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6 && v7)
  {
    id v9 = [(id)objc_opt_class() _eventWithTopic:v6];
    [v9 addPropertiesWithDictionary:v8];
    id v10 = [v8 objectForKeyedSubscript:@"canaryIdentifier"];
    [v9 setCanaryIdentifier:v10];

    uint64_t v11 = +[AMSLogConfig sharedAccountsConfig];
    if (!v11)
    {
      uint64_t v11 = +[AMSLogConfig sharedConfig];
    }
    int v12 = [v11 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = objc_opt_class();
      int8x16_t v14 = AMSLogKey();
      int v23 = 138543874;
      uint64_t v24 = v13;
      __int16 v25 = 2114;
      v26 = v14;
      __int16 v27 = 2114;
      id v28 = v9;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Queueing Metrics Event = %{public}@", (uint8_t *)&v23, 0x20u);
    }
    v31[0] = v9;
    uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
    uint64_t v16 = [(AMSAuthenticateMetrics *)self _enqueueEvents:v15];
  }
  else
  {
    id v17 = +[AMSLogConfig sharedAccountsConfig];
    if (!v17)
    {
      id v17 = +[AMSLogConfig sharedConfig];
    }
    id v18 = [v17 OSLogObject];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = AMSLogKey();
      int v21 = AMSHashIfNeeded(v8);
      int v23 = 138544130;
      uint64_t v24 = v19;
      __int16 v25 = 2114;
      v26 = v20;
      __int16 v27 = 2114;
      id v28 = v6;
      __int16 v29 = 2114;
      v30 = v21;
      _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempted to enqueue event without topic or properties. topic = %{public}@ properties = %{public}@", (uint8_t *)&v23, 0x2Au);
    }
    id v9 = AMSError(2, @"Missing topic or properties", 0, 0);
    uint64_t v16 = +[AMSBinaryPromise promiseWithError:v9];
  }

  return v16;
}

- (BOOL)_isTopicDefined:(id)a3
{
  int v4 = [a3 isEqualToString:@"_topic_not_defined_"] ^ 1;
  if (a3) {
    return v4;
  }
  else {
    return 0;
  }
}

- (id)_userIdForBagNamespace:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSAuthenticateMetrics *)self bag];
  id v6 = +[AMSMetricsIdentifierStore identifierForAccount:0 bag:v5 bagNamespace:v4 keyName:@"userId"];

  return v6;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (AMSMetrics)metrics
{
  return self->_metrics;
}

- (NSDate)beginDate
{
  return self->_beginDate;
}

- (void)setBeginDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beginDate, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_bag, 0);
}

@end