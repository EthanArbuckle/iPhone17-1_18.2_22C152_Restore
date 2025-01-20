@interface AMSMetricsEvent
+ (BOOL)supportsSecureCoding;
+ (id)_buyParamsFromString:(id)a3;
+ (id)_buyParamsStringFromAuthenticationContext:(id)a3;
+ (id)_deepCopiedAndSanitizedTopLevelDictionaryFromDictionary:(id)a3;
+ (id)_deepCopiedJSONObjectOrNilForObject:(id)a3;
+ (id)_deepCopiedJSONObjectOrNilForObject:(id)a3 key:(id)a4 enforcingClassUsingKnownPropertiesClassMapping:(id)a5;
+ (id)_propertyValueClassesForKnownProperties;
+ (id)_topicFromAuthenticationContext:(id)a3;
+ (id)createEventFromAuthenticationContext:(id)a3 error:(id)a4;
+ (id)metricsAuthenticationAttemptDictionaryForAuthKitError:(id)a3;
+ (id)sanitizedObject:(id)a3;
- (ACAccount)account;
- (AMSMetricsEvent)initWithCoder:(id)a3;
- (AMSMetricsEvent)initWithDatabaseEventBody:(id)a3 account:(id)a4 databasePID:(id)a5;
- (AMSMetricsEvent)initWithTopic:(id)a3;
- (AMSMetricsEvent)initWithUnderlyingDictionary:(id)a3;
- (BOOL)checkDiagnosticsAndUsageSetting;
- (BOOL)engagementEvent;
- (BOOL)isAnonymous;
- (BOOL)preventSampling;
- (BOOL)suppressEngagement;
- (NSDictionary)databaseEventBody;
- (NSDictionary)dictionaryForPosting;
- (NSDictionary)engagementMetrics;
- (NSDictionary)underlyingDictionary;
- (NSDictionary)underlyingDictionaryOverride;
- (NSNumber)baseVersion;
- (NSNumber)databasePID;
- (NSNumber)eventTime;
- (NSNumber)eventVersion;
- (NSNumber)timezoneOffset;
- (NSString)app;
- (NSString)appVersion;
- (NSString)canaryIdentifier;
- (NSString)clientEventID;
- (NSString)clientIdentifier;
- (NSString)diagnosticsSubmissionBugType;
- (NSString)eventType;
- (NSString)osBuildVersion;
- (NSString)osName;
- (NSString)osVersion;
- (NSString)topic;
- (id)_initWithSanitizedUnderlyingDictionary:(id)a3 account:(id)a4 databasePID:(id)a5;
- (id)_initWithUnderlyingDictionary:(id)a3 account:(id)a4 databasePID:(id)a5 addBasefields:(BOOL)a6;
- (id)_propertyForBodyKey:(id)a3 clientOnly:(BOOL)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initForEngagement;
- (id)propertyForBodyKey:(id)a3;
- (void)_setProperty:(id)a3 forBodyKey:(id)a4 clientOnly:(BOOL)a5;
- (void)addPropertiesWithDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)removePropertiesForKeys:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAnonymous:(BOOL)a3;
- (void)setApp:(id)a3;
- (void)setAppVersion:(id)a3;
- (void)setBaseVersion:(id)a3;
- (void)setCanaryIdentifier:(id)a3;
- (void)setCheckDiagnosticsAndUsageSetting:(BOOL)a3;
- (void)setClientEventID:(id)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setDiagnosticsSubmissionBugType:(id)a3;
- (void)setEventTime:(id)a3;
- (void)setEventType:(id)a3;
- (void)setEventVersion:(id)a3;
- (void)setOsBuildVersion:(id)a3;
- (void)setOsName:(id)a3;
- (void)setOsVersion:(id)a3;
- (void)setPreventSampling:(BOOL)a3;
- (void)setProperty:(id)a3 forBodyKey:(id)a4;
- (void)setSuppressEngagement:(BOOL)a3;
- (void)setTimezoneOffset:(id)a3;
- (void)setTopic:(id)a3;
@end

@implementation AMSMetricsEvent

- (void)setTopic:(id)a3
{
}

- (void)setAppVersion:(id)a3
{
}

- (void)_setProperty:(id)a3 forBodyKey:(id)a4 clientOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  if (!v13)
  {
    v10 = 0;
LABEL_5:
    os_unfair_lock_lock_with_options();
    v11 = self->_underlyingDictionary;
    if (v5)
    {
      v12 = [(NSMutableDictionary *)self->_underlyingDictionary objectForKeyedSubscript:@"clientOnlyProperties"];

      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v11 = v12;
          goto LABEL_12;
        }
        v11 = (NSMutableDictionary *)[(NSMutableDictionary *)v12 mutableCopy];
      }
      else
      {
        v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      [(NSMutableDictionary *)self->_underlyingDictionary setObject:v11 forKeyedSubscript:@"clientOnlyProperties"];
    }
LABEL_12:
    [(NSMutableDictionary *)v11 setObject:v10 forKeyedSubscript:v8];
    os_unfair_lock_unlock(&self->_internalStateLock);

    goto LABEL_13;
  }
  v9 = [(id)objc_opt_class() _propertyValueClassesForKnownProperties];
  v10 = +[AMSMetricsEvent _deepCopiedJSONObjectOrNilForObject:v13 key:v8 enforcingClassUsingKnownPropertiesClassMapping:v9];

  if (v10) {
    goto LABEL_5;
  }
LABEL_13:
}

- (void)setProperty:(id)a3 forBodyKey:(id)a4
{
}

+ (id)_propertyValueClassesForKnownProperties
{
  v5[22] = *MEMORY[0x1E4F143B8];
  v4[0] = @"app";
  v5[0] = objc_opt_class();
  v4[1] = @"appVersion";
  v5[1] = objc_opt_class();
  v4[2] = @"anonymous";
  v5[2] = objc_opt_class();
  v4[3] = @"baseVersion";
  v5[3] = objc_opt_class();
  v4[4] = @"canaryIdentifier";
  v5[4] = objc_opt_class();
  v4[5] = @"clientEventId";
  v5[5] = objc_opt_class();
  v4[6] = @"clientId";
  v5[6] = objc_opt_class();
  v4[7] = @"engagementMetrics";
  v5[7] = objc_opt_class();
  v4[8] = @"eventTime";
  v5[8] = objc_opt_class();
  v4[9] = @"eventType";
  v5[9] = objc_opt_class();
  v4[10] = @"eventVersion";
  v5[10] = objc_opt_class();
  v4[11] = @"osBuildVersion";
  v5[11] = objc_opt_class();
  v4[12] = @"osName";
  v5[12] = objc_opt_class();
  v4[13] = @"osVersion";
  v5[13] = objc_opt_class();
  v4[14] = @"timezoneOffset";
  v5[14] = objc_opt_class();
  v4[15] = @"topic";
  v5[15] = objc_opt_class();
  v4[16] = @"clientOnlyProperties";
  v5[16] = objc_opt_class();
  v4[17] = @"checkDU";
  v5[17] = objc_opt_class();
  v4[18] = @"diagnosticsSubmissionBugType";
  v5[18] = objc_opt_class();
  v4[19] = @"preventSampling";
  v5[19] = objc_opt_class();
  v4[20] = @"engagementEvent";
  v5[20] = objc_opt_class();
  v4[21] = @"suppressEngagement";
  v5[21] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:22];
  return v2;
}

+ (id)_deepCopiedAndSanitizedTopLevelDictionaryFromDictionary:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  id v25 = a1;
  v26 = [a1 _propertyValueClassesForKnownProperties];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v29;
    v10 = @"topic";
    *(void *)&long long v7 = 138543874;
    long long v24 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v13 = (void *)MEMORY[0x192FA47D0]();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v12;
          v15 = v14;
          if ([v14 isEqualToString:@"mtTopic"])
          {
            [v27 objectForKeyedSubscript:v10];
            v17 = v16 = v10;

            if (v17)
            {
              v10 = v16;
              goto LABEL_19;
            }

            v15 = v16;
            v10 = v16;
          }
          v18 = objc_msgSend(v5, "objectForKeyedSubscript:", v14, v24);
          v22 = +[AMSMetricsEvent _deepCopiedJSONObjectOrNilForObject:v18 key:v15 enforcingClassUsingKnownPropertiesClassMapping:v26];
          if (v22) {
            [v27 setObject:v22 forKeyedSubscript:v15];
          }
        }
        else
        {
          v15 = +[AMSLogConfig sharedMetricsConfig];
          if (!v15)
          {
            v15 = +[AMSLogConfig sharedConfig];
          }
          v18 = objc_msgSend(v15, "OSLogObject", v24);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            AMSLogKey();
            v20 = v19 = v10;
            v21 = AMSHashIfNeeded(v12);
            *(_DWORD *)buf = v24;
            id v33 = v25;
            __int16 v34 = 2114;
            v35 = v20;
            __int16 v36 = 2114;
            v37 = v21;
            _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempting to add a property with non-NSString key: %{public}@", buf, 0x20u);

            v10 = v19;
          }
        }

        id v14 = v15;
LABEL_19:
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v8);
  }

  return v27;
}

+ (id)_deepCopiedJSONObjectOrNilForObject:(id)a3 key:(id)a4 enforcingClassUsingKnownPropertiesClassMapping:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[AMSMetricsEvent _deepCopiedJSONObjectOrNilForObject:v8];
  if (!v11)
  {
    v18 = +[AMSLogConfig sharedMetricsConfig];
    if (!v18)
    {
      v18 = +[AMSLogConfig sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = AMSLogKey();
      v21 = AMSHashIfNeeded(v9);
      v22 = AMSHashIfNeeded(v8);
      *(_DWORD *)buf = 138544130;
      id v40 = a1;
      __int16 v41 = 2114;
      v42 = v20;
      __int16 v43 = 2114;
      v44 = v21;
      __int16 v45 = 2114;
      uint64_t v46 = (uint64_t)v22;
      _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] [FILE A RADAR] Invalid metrics property. Property must be JSON serializable. Key: %{public}@ Property: %{public}@", buf, 0x2Au);
    }
    goto LABEL_15;
  }
  uint64_t v12 = [v10 objectForKeyedSubscript:v9];
  if (v12)
  {
    uint64_t v13 = v12;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = +[AMSLogConfig sharedMetricsConfig];
      if (!v14)
      {
        id v14 = +[AMSLogConfig sharedConfig];
      }
      v15 = [v14 OSLogObject];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v16 = AMSLogKey();
        v17 = AMSHashIfNeeded(v9);
        *(_DWORD *)buf = 138544130;
        id v40 = a1;
        __int16 v41 = 2114;
        v42 = v16;
        __int16 v43 = 2114;
        v44 = v17;
        __int16 v45 = 2114;
        uint64_t v46 = v13;
        _os_log_impl(&dword_18D554000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Attempting to set NSNull as property value from dictionary: key = %{public}@, expected value class = %{public}@. Not setting any value for this key.", buf, 0x2Au);
      }
      goto LABEL_9;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      BOOL v25 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v26 = +[AMSLogConfig sharedMetricsConfig];
      id v14 = (void *)v26;
      if (v25)
      {
        if (!v26)
        {
          id v14 = +[AMSLogConfig sharedConfig];
        }
        id v27 = [v14 OSLogObject];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v37 = AMSLogKey();
          __int16 v36 = AMSHashIfNeeded(v9);
          long long v28 = AMSHashIfNeeded(v11);
          *(_DWORD *)buf = 138544642;
          id v40 = a1;
          __int16 v41 = 2114;
          v42 = v37;
          __int16 v43 = 2114;
          v44 = v36;
          __int16 v45 = 2114;
          uint64_t v46 = (uint64_t)v28;
          __int16 v47 = 2114;
          id v48 = (id)objc_opt_class();
          __int16 v49 = 2114;
          uint64_t v50 = v13;
          id v29 = v48;
          _os_log_impl(&dword_18D554000, v27, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempting to set property of invalid class from dictionary: key = %{public}@, value = %{public}@, value class = %{public}@, expected class = %{public}@", buf, 0x3Eu);
        }
        long long v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
        long long v31 = +[AMSLogConfig sharedMetricsConfig];
        [v30 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v31 userInfo:0];

        goto LABEL_15;
      }
      if (!v26)
      {
        id v14 = +[AMSLogConfig sharedConfig];
      }
      v32 = [v14 OSLogObject];
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        v38 = AMSLogKey();
        id v33 = AMSHashIfNeeded(v9);
        __int16 v34 = AMSHashIfNeeded(v11);
        *(_DWORD *)buf = 138544642;
        id v40 = a1;
        __int16 v41 = 2114;
        v42 = v38;
        __int16 v43 = 2114;
        v44 = v33;
        __int16 v45 = 2114;
        uint64_t v46 = (uint64_t)v34;
        __int16 v47 = 2114;
        id v48 = (id)objc_opt_class();
        __int16 v49 = 2114;
        uint64_t v50 = v13;
        id v35 = v48;
        _os_log_impl(&dword_18D554000, v32, OS_LOG_TYPE_FAULT, "%{public}@: [%{public}@] Attempting to set property of invalid class from dictionary: key = %{public}@, value = %{public}@, value class = %{public}@, expected class = %{public}@", buf, 0x3Eu);
      }
LABEL_9:

LABEL_15:
      id v23 = 0;
      goto LABEL_18;
    }
  }
  id v23 = v11;
LABEL_18:

  return v23;
}

+ (id)_deepCopiedJSONObjectOrNilForObject:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28D90];
  v25[0] = v4;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  LOBYTE(v5) = [v5 isValidJSONObject:v6];

  if (v5)
  {
    long long v7 = AMSMetricsEventDeepCopyJSONObject(v4);
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F28D90];
    id v24 = v4;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
    id v17 = 0;
    id v10 = [v8 dataWithJSONObject:v9 options:0 error:&v17];
    id v11 = v17;

    uint64_t v12 = +[AMSLogConfig sharedMetricsConfig];
    if (!v12)
    {
      uint64_t v12 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v13 = [v12 OSLogObject];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v14 = AMSLogKey();
      v15 = AMSLogableError(v11);
      *(_DWORD *)buf = 138543874;
      id v19 = a1;
      __int16 v20 = 2114;
      v21 = v14;
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Error converting object to JSON data: %{public}@", buf, 0x20u);
    }
    long long v7 = 0;
  }

  return v7;
}

- (void)setEventType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingDictionaryOverride, 0);
  objc_storeStrong((id *)&self->_databasePID, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_underlyingDictionary, 0);
}

- (AMSMetricsEvent)initWithTopic:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)AMSMetricsEvent;
  id v5 = [(AMSMetricsEvent *)&v32 init];
  uint64_t v6 = v5;
  if (v5)
  {
    v5->_internalStateLock._os_unfair_lock_opaque = 0;
    uint64_t v7 = AMSMetricsEventDefaultUnderlyingDictionary();
    underlyingDictionary = v6->_underlyingDictionary;
    v6->_underlyingDictionary = (NSMutableDictionary *)v7;

    uint64_t v9 = 0x1E4F29000uLL;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = (void *)[v4 copy];
      [(NSMutableDictionary *)v6->_underlyingDictionary setObject:v10 forKeyedSubscript:@"topic"];
    }
    else
    {
      BOOL v11 = +[AMSUnitTests isRunningUnitTests];
      uint64_t v12 = +[AMSLogConfig sharedMetricsConfig];
      id v10 = (void *)v12;
      if (v11)
      {
        if (!v12)
        {
          id v10 = +[AMSLogConfig sharedConfig];
        }
        uint64_t v13 = [v10 OSLogObject];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          id v14 = AMSLogKey();
          v15 = NSString;
          uint64_t v16 = objc_opt_class();
          uint64_t v17 = v16;
          if (v14)
          {
            uint64_t v9 = AMSLogKey();
            [v15 stringWithFormat:@"%@: [%@] ", v17, v9];
          }
          else
          {
            [v15 stringWithFormat:@"%@: ", v16];
          v18 = };
          BOOL v25 = AMSHashIfNeeded(v4);
          uint64_t v26 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          __int16 v34 = v18;
          __int16 v35 = 2114;
          __int16 v36 = v25;
          __int16 v37 = 2114;
          v38 = v26;
          id v27 = v26;
          _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_ERROR, "%{public}@Attempting to construct metrics event with non-NSString topic: topic = %{public}@, topic class = %{public}@", buf, 0x20u);
          if (v14)
          {

            v18 = (void *)v9;
          }
        }
        id v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
        id v19 = +[AMSLogConfig sharedMetricsConfig];
        [v10 postNotificationName:@"com.apple.AppleMediaServicesTests.FaultLogged" object:v19 userInfo:0];
      }
      else
      {
        if (!v12)
        {
          id v10 = +[AMSLogConfig sharedConfig];
        }
        id v19 = [v10 OSLogObject];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        {
          __int16 v20 = AMSLogKey();
          v21 = NSString;
          uint64_t v22 = objc_opt_class();
          uint64_t v23 = v22;
          if (v20)
          {
            uint64_t v9 = AMSLogKey();
            [v21 stringWithFormat:@"%@: [%@] ", v23, v9];
          }
          else
          {
            [v21 stringWithFormat:@"%@: ", v22];
          id v24 = };
          long long v28 = AMSHashIfNeeded(v4);
          id v29 = objc_opt_class();
          *(_DWORD *)buf = 138543874;
          __int16 v34 = v24;
          __int16 v35 = 2114;
          __int16 v36 = v28;
          __int16 v37 = 2114;
          v38 = v29;
          id v30 = v29;
          _os_log_impl(&dword_18D554000, v19, OS_LOG_TYPE_FAULT, "%{public}@Attempting to construct metrics event with non-NSString topic: topic = %{public}@, topic class = %{public}@", buf, 0x20u);
          if (v20)
          {

            id v24 = (void *)v9;
          }
        }
      }
    }
    if ([v4 isEqual:0x1EDCBD9C8]) {
      [(AMSMetricsEvent *)v6 setCheckDiagnosticsAndUsageSetting:1];
    }
  }

  return v6;
}

- (void)setSuppressEngagement:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([(AMSMetricsEvent *)self engagementEvent])
  {
    id v5 = +[AMSLogConfig sharedMetricsConfig];
    if (!v5)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    uint64_t v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      id v8 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v7;
      __int16 v12 = 2114;
      uint64_t v13 = v8;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Attempting to suppress engagement for engagement event", buf, 0x16u);
    }
  }
  else
  {
    id v9 = [MEMORY[0x1E4F28ED0] numberWithBool:v3];
    -[AMSMetricsEvent _setProperty:forBodyKey:clientOnly:](self, "_setProperty:forBodyKey:clientOnly:");
  }
}

- (BOOL)engagementEvent
{
  v2 = [(AMSMetricsEvent *)self _propertyForBodyKey:@"engagementEvent" clientOnly:1];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)removePropertiesForKeys:(id)a3
{
  p_internalStateLock = &self->_internalStateLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_underlyingDictionary removeObjectsForKeys:v5];

  os_unfair_lock_unlock(p_internalStateLock);
}

- (NSString)diagnosticsSubmissionBugType
{
  return (NSString *)[(AMSMetricsEvent *)self _propertyForBodyKey:@"diagnosticsSubmissionBugType" clientOnly:1];
}

- (BOOL)checkDiagnosticsAndUsageSetting
{
  v2 = [(AMSMetricsEvent *)self _propertyForBodyKey:@"checkDU" clientOnly:1];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSDictionary)underlyingDictionary
{
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_underlyingDictionary copyItems:1];
  os_unfair_lock_unlock(p_internalStateLock);
  return (NSDictionary *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_underlyingDictionary copyItems:1];
  account = self->_account;
  id v8 = self->_databasePID;
  id v9 = account;
  os_unfair_lock_unlock(p_internalStateLock);
  id v10 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "_initWithSanitizedUnderlyingDictionary:account:databasePID:", v6, v9, v8);

  return v10;
}

- (id)_initWithSanitizedUnderlyingDictionary:(id)a3 account:(id)a4 databasePID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSMetricsEvent;
  __int16 v12 = [(AMSMetricsEvent *)&v15 init];
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    v12->_internalStateLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_underlyingDictionary, a3);
    objc_storeStrong(p_isa + 3, a4);
    objc_storeStrong(p_isa + 4, a5);
  }

  return p_isa;
}

- (BOOL)suppressEngagement
{
  v2 = [(AMSMetricsEvent *)self _propertyForBodyKey:@"suppressEngagement" clientOnly:1];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)_propertyForBodyKey:(id)a3 clientOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  underlyingDictionary = self->_underlyingDictionary;
  if (v4)
  {
    id v9 = [(NSMutableDictionary *)underlyingDictionary objectForKeyedSubscript:@"clientOnlyProperties"];
    id v10 = [v9 objectForKeyedSubscript:v6];
  }
  else
  {
    id v10 = [(NSMutableDictionary *)underlyingDictionary objectForKeyedSubscript:v6];
  }
  os_unfair_lock_unlock(p_internalStateLock);

  return v10;
}

- (id)propertyForBodyKey:(id)a3
{
  return [(AMSMetricsEvent *)self _propertyForBodyKey:a3 clientOnly:0];
}

- (BOOL)isAnonymous
{
  v2 = [(AMSMetricsEvent *)self propertyForBodyKey:@"anonymous"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (ACAccount)account
{
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  BOOL v4 = self->_account;
  os_unfair_lock_unlock(p_internalStateLock);
  return v4;
}

- (void)addPropertiesWithDictionary:(id)a3
{
  id v4 = a3;
  id v7 = [(id)objc_opt_class() _deepCopiedAndSanitizedTopLevelDictionaryFromDictionary:v4];

  id v5 = [(AMSMetricsEvent *)self topic];
  int v6 = [v5 isEqualToString:0x1EDCBD9C8];

  if (v6) {
    [v7 setObject:0x1EDCBD9C8 forKeyedSubscript:@"topic"];
  }
  os_unfair_lock_lock_with_options();
  [(NSMutableDictionary *)self->_underlyingDictionary addEntriesFromDictionary:v7];
  os_unfair_lock_unlock(&self->_internalStateLock);
}

- (NSString)topic
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"topic"];
}

- (NSString)canaryIdentifier
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"canaryIdentifier"];
}

- (NSString)clientIdentifier
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"clientId"];
}

- (void)setAnonymous:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self setProperty:v4 forBodyKey:@"anonymous"];
}

- (void)setAccount:(id)a3
{
  id v4 = (ACAccount *)a3;
  os_unfair_lock_lock_with_options();
  account = self->_account;
  self->_account = v4;

  os_unfair_lock_unlock(&self->_internalStateLock);
}

- (NSDictionary)databaseEventBody
{
  char v3 = [(AMSMetricsEvent *)self underlyingDictionaryOverride];
  id v4 = (void *)[v3 mutableCopy];

  if (!v4)
  {
    os_unfair_lock_lock_with_options();
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:self->_underlyingDictionary copyItems:1];
    os_unfair_lock_unlock(&self->_internalStateLock);
  }
  id v5 = +[AMSDefaults metricsCanaryIdentifier];
  if ([v5 length]) {
    [v4 setObject:v5 forKeyedSubscript:@"canaryIdentifier"];
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)underlyingDictionaryOverride
{
  return self->_underlyingDictionaryOverride;
}

- (void)setPreventSampling:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self _setProperty:v4 forBodyKey:@"preventSampling" clientOnly:1];
}

- (NSDictionary)dictionaryForPosting
{
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  id v4 = (void *)[(NSMutableDictionary *)self->_underlyingDictionary mutableCopy];
  os_unfair_lock_unlock(p_internalStateLock);
  [v4 removeObjectForKey:@"clientOnlyProperties"];
  return (NSDictionary *)v4;
}

- (id)initForEngagement
{
  char v3 = AMSMetricsEventDefaultUnderlyingDictionary();
  id v4 = [v3 objectForKeyedSubscript:@"clientOnlyProperties"];
  [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"engagementEvent"];

  id v5 = [(AMSMetricsEvent *)self _initWithSanitizedUnderlyingDictionary:v3 account:0 databasePID:0];
  return v5;
}

+ (id)createEventFromAuthenticationContext:(id)a3 error:(id)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _topicFromAuthenticationContext:v6];
  if (v8)
  {
    id v9 = [[AMSMetricsEvent alloc] initWithTopic:v8];
    [(AMSMetricsEvent *)v9 setProperty:@"SignIn" forBodyKey:@"dialogType"];
    [(AMSMetricsEvent *)v9 setProperty:@"dialog" forBodyKey:@"eventType"];
    id v10 = [v6 username];
    uint64_t v11 = [v10 length];

    if (v11) {
      __int16 v12 = @"Password";
    }
    else {
      __int16 v12 = @"UserNamePassword";
    }
    [(AMSMetricsEvent *)v9 setProperty:v12 forBodyKey:@"dialogId"];
    uint64_t v13 = @"Ok";
    if (v7)
    {
      if ([v7 code] == -7003)
      {
        uint64_t v13 = @"Cancel";
        uint64_t v14 = @"cancel";
      }
      else
      {
        uint64_t v14 = @"enterPassword";
      }
      objc_super v15 = @"failure";
    }
    else
    {
      uint64_t v14 = @"ok";
      objc_super v15 = @"success";
    }
    [(AMSMetricsEvent *)v9 setProperty:v14 forBodyKey:@"actionType"];
    [(AMSMetricsEvent *)v9 setProperty:v15 forBodyKey:@"result"];
    [(AMSMetricsEvent *)v9 setProperty:v13 forBodyKey:@"targetId"];
    uint64_t v16 = [v6 clientInfo];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v17 = [v16 objectForKeyedSubscript:@"metricsAuthenticationAttempts"];
      [(AMSMetricsEvent *)v9 setProperty:v17 forBodyKey:@"userActions"];
    }
    uint64_t v18 = [a1 _buyParamsStringFromAuthenticationContext:v6];
    id v19 = (void *)v18;
    if (v18)
    {
      uint64_t v23 = @"buyParams";
      v24[0] = v18;
      __int16 v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
      [(AMSMetricsEvent *)v9 setProperty:v20 forBodyKey:@"details"];
    }
    v21 = [v16 objectForKeyedSubscript:@"AMSAuthenticateOptionsUserAgentKey"];
    if (v21) {
      [(AMSMetricsEvent *)v9 setProperty:v21 forBodyKey:@"userAgent"];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (id)metricsAuthenticationAttemptDictionaryForAuthKitError:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v4 setObject:@"authenticate" forKeyedSubscript:@"targetId"];
  id v5 = [MEMORY[0x1E4F1C9C8] date];
  [v5 timeIntervalSince1970];
  double v7 = v6;

  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", (uint64_t)(v7 * 1000.0));
  [v4 setObject:v8 forKeyedSubscript:@"responseTime"];
  if (v3)
  {
    [v4 setObject:@"failure" forKeyedSubscript:@"result"];
    uint64_t v9 = [v3 code];
    id v10 = @"unknown";
    if (v9 == -7006) {
      id v10 = @"invalidCredentials";
    }
    if (v9 == -7010) {
      id v10 = @"badServerResponse";
    }
    if (v9 == -7028) {
      uint64_t v11 = @"maxNumberOfAttemptsReached";
    }
    else {
      uint64_t v11 = v10;
    }
    __int16 v12 = @"reason";
  }
  else
  {
    uint64_t v11 = @"success";
    __int16 v12 = @"result";
  }
  [v4 setObject:v11 forKeyedSubscript:v12];

  return v4;
}

+ (id)_buyParamsFromString:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [v3 componentsSeparatedByString:@"&"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v10 count] == 2)
        {
          uint64_t v11 = [v10 objectAtIndexedSubscript:0];
          uint64_t v12 = [v10 objectAtIndexedSubscript:1];
          uint64_t v13 = (void *)v12;
          if (v11) {
            BOOL v14 = v12 == 0;
          }
          else {
            BOOL v14 = 1;
          }
          if (!v14) {
            [v4 setObject:v12 forKeyedSubscript:v11];
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  objc_super v15 = (void *)[v4 copy];

  return v15;
}

+ (id)_buyParamsStringFromAuthenticationContext:(id)a3
{
  id v3 = [a3 clientInfo];
  id v4 = [v3 objectForKeyedSubscript:@"AMSAuthenticateOptionsCreateAccountQueryParamsKey"];

  if (v4)
  {
    id v5 = [v4 objectForKeyedSubscript:@"product"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (id)_topicFromAuthenticationContext:(id)a3
{
  id v4 = [a1 _buyParamsStringFromAuthenticationContext:a3];
  if (v4)
  {
    id v5 = [a1 _buyParamsFromString:v4];
    uint64_t v6 = [v5 objectForKeyedSubscript:@"mtTopic"];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_initWithUnderlyingDictionary:(id)a3 account:(id)a4 databasePID:(id)a5 addBasefields:(BOOL)a6
{
  if (a6)
  {
    id v10 = a5;
    id v11 = a4;
    id v12 = a3;
    uint64_t v13 = AMSMetricsEventDefaultUnderlyingDictionary();
    id v14 = +[AMSMetricsEvent _deepCopiedAndSanitizedTopLevelDictionaryFromDictionary:v12];

    [v13 addEntriesFromDictionary:v14];
  }
  else
  {
    id v15 = a5;
    id v16 = a4;
    id v14 = a3;
    uint64_t v13 = +[AMSMetricsEvent _deepCopiedAndSanitizedTopLevelDictionaryFromDictionary:v14];
  }

  id v17 = [(AMSMetricsEvent *)self _initWithSanitizedUnderlyingDictionary:v13 account:a4 databasePID:a5];
  return v17;
}

- (AMSMetricsEvent)initWithUnderlyingDictionary:(id)a3
{
  return (AMSMetricsEvent *)[(AMSMetricsEvent *)self _initWithUnderlyingDictionary:a3 account:0 databasePID:0 addBasefields:1];
}

- (AMSMetricsEvent)initWithDatabaseEventBody:(id)a3 account:(id)a4 databasePID:(id)a5
{
  return (AMSMetricsEvent *)[(AMSMetricsEvent *)self _initWithUnderlyingDictionary:a3 account:a4 databasePID:a5 addBasefields:0];
}

+ (id)sanitizedObject:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
LABEL_5:
    id v6 = v5;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v8 = NSString;
    [v4 timeIntervalSince1970];
    objc_msgSend(v8, "stringWithFormat:", @"%lld", (uint64_t)v9);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = NSString;
    id v11 = [v4 base64EncodedStringWithOptions:0];
    id v6 = [v10 stringWithFormat:@"%@", v11];
LABEL_34:

    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v11 = v4;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v35 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * i);
          id v17 = (void *)MEMORY[0x192FA47D0]();
          long long v18 = [a1 sanitizedObject:v16];
          if (v18) {
            [v6 addObject:v18];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v13);
    }
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v11 = v4;
    uint64_t v19 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v11);
          }
          uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * j);
          id v24 = (void *)MEMORY[0x192FA47D0]();
          BOOL v25 = [a1 sanitizedObject:v23];
          if (v25) {
            [v6 addObject:v25];
          }
        }
        uint64_t v20 = [v11 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v20);
    }
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __35__AMSMetricsEvent_sanitizedObject___block_invoke;
    v27[3] = &unk_1E55A4498;
    id v29 = a1;
    id v6 = v26;
    id v28 = v6;
    [v4 enumerateKeysAndObjectsUsingBlock:v27];
  }
  else
  {
    id v6 = 0;
  }
LABEL_6:

  return v6;
}

void __35__AMSMetricsEvent_sanitizedObject___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x192FA47D0]();
  uint64_t v7 = [*(id *)(a1 + 40) sanitizedObject:v5];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && v7) {
    [*(id *)(a1 + 32) setObject:v7 forKeyedSubscript:v8];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_internalStateLock = &self->_internalStateLock;
  id v5 = a3;
  os_unfair_lock_lock_with_options();
  id v6 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:self->_underlyingDictionary copyItems:1];
  os_unfair_lock_unlock(p_internalStateLock);
  [v5 encodeObject:v6 forKey:@"underlyingDictionary"];
}

- (AMSMetricsEvent)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  id v6 = objc_msgSend(v4, "ams_JSONClasses");
  uint64_t v7 = [v5 decodeObjectOfClasses:v6 forKey:@"underlyingDictionary"];

  id v8 = [(AMSMetricsEvent *)self initWithUnderlyingDictionary:v7];
  return v8;
}

- (NSString)app
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"app"];
}

- (NSString)appVersion
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"appVersion"];
}

- (NSNumber)baseVersion
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"baseVersion"];
}

- (NSString)clientEventID
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"clientEventId"];
}

- (NSDictionary)engagementMetrics
{
  return (NSDictionary *)[(AMSMetricsEvent *)self propertyForBodyKey:@"engagementMetrics"];
}

- (NSNumber)eventTime
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"eventTime"];
}

- (NSString)eventType
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"eventType"];
}

- (NSNumber)eventVersion
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"eventVersion"];
}

- (BOOL)preventSampling
{
  v2 = [(AMSMetricsEvent *)self _propertyForBodyKey:@"preventSampling" clientOnly:1];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (NSString)osBuildVersion
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"osBuildVersion"];
}

- (NSString)osName
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"osName"];
}

- (NSString)osVersion
{
  return (NSString *)[(AMSMetricsEvent *)self propertyForBodyKey:@"osVersion"];
}

- (NSNumber)timezoneOffset
{
  return (NSNumber *)[(AMSMetricsEvent *)self propertyForBodyKey:@"timezoneOffset"];
}

- (void)setApp:(id)a3
{
}

- (void)setBaseVersion:(id)a3
{
}

- (void)setCanaryIdentifier:(id)a3
{
}

- (void)setCheckDiagnosticsAndUsageSetting:(BOOL)a3
{
  id v4 = [MEMORY[0x1E4F28ED0] numberWithBool:a3];
  [(AMSMetricsEvent *)self _setProperty:v4 forBodyKey:@"checkDU" clientOnly:1];
}

- (void)setClientEventID:(id)a3
{
}

- (void)setClientIdentifier:(id)a3
{
}

- (void)setDiagnosticsSubmissionBugType:(id)a3
{
}

- (void)setEventTime:(id)a3
{
}

- (void)setEventVersion:(id)a3
{
}

- (void)setOsBuildVersion:(id)a3
{
}

- (void)setOsName:(id)a3
{
}

- (void)setOsVersion:(id)a3
{
}

- (void)setTimezoneOffset:(id)a3
{
}

- (NSNumber)databasePID
{
  p_internalStateLock = &self->_internalStateLock;
  os_unfair_lock_lock_with_options();
  id v4 = self->_databasePID;
  os_unfair_lock_unlock(p_internalStateLock);
  return v4;
}

@end