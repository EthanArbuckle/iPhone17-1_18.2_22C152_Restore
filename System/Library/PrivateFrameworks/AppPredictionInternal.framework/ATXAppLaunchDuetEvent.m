@interface ATXAppLaunchDuetEvent
+ (BOOL)_acceptableLaunchReason:(id)a3;
+ (BOOL)supportsSecureCoding;
- (ATXAppLaunchDuetEvent)initWithBundleId:(id)a3 appLaunchState:(int64_t)a4 launchReason:(id)a5 startDate:(id)a6 endDate:(id)a7;
- (ATXAppLaunchDuetEvent)initWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5;
- (ATXAppLaunchDuetEvent)initWithCoder:(id)a3;
- (ATXAppLaunchDuetEvent)initWithCurrentContextStoreValues;
- (ATXAppLaunchDuetEvent)initWithDKEvent:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (NSString)bundleId;
- (NSString)launchReason;
- (id)description;
- (int64_t)appLaunchState;
- (void)encodeWithCoder:(id)a3;
- (void)initWithCurrentContextStoreValues;
@end

@implementation ATXAppLaunchDuetEvent

- (ATXAppLaunchDuetEvent)initWithBundleId:(id)a3 appLaunchState:(int64_t)a4 launchReason:(id)a5 startDate:(id)a6 endDate:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ATXAppLaunchDuetEvent;
  v14 = [(ATXDuetEvent *)&v20 initWithStartDate:a6 endDate:a7];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    bundleId = v14->_bundleId;
    v14->_bundleId = (NSString *)v15;

    v14->_appLaunchState = a4;
    uint64_t v17 = [v13 copy];
    launchReason = v14->_launchReason;
    v14->_launchReason = (NSString *)v17;
  }
  return v14;
}

- (ATXAppLaunchDuetEvent)initWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  return [(ATXAppLaunchDuetEvent *)self initWithBundleId:a3 appLaunchState:1 launchReason:@"unknown" startDate:a4 endDate:a5];
}

- (ATXAppLaunchDuetEvent)initWithDKEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"ATXAppLaunchDuetEvent.m", 59, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = [v5 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v5 value];
    v9 = [v8 stringValue];

    if ([v9 isEqualToString:@"unknown"])
    {
      v10 = __atxlog_handle_default();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ATXAppLaunchDuetEvent initWithDKEvent:]();
      }
      goto LABEL_23;
    }
    id v12 = [v5 metadata];
    id v13 = [MEMORY[0x1E4F5B4B0] extensionHostIdentifier];
    v10 = [v12 objectForKey:v13];

    if (v10 && [v10 isEqualToString:@"com.apple.springboard"])
    {
      v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[ATXAppLaunchDuetEvent initWithDKEvent:].cold.4();
      }
LABEL_22:

LABEL_23:
      v11 = 0;
LABEL_24:

      goto LABEL_25;
    }
    uint64_t v15 = +[_ATXAppIconState sharedInstance];
    v16 = [v15 allInstalledAppsKnownToSpringBoard];
    char v17 = [v16 containsObject:v9];

    if ((v17 & 1) == 0)
    {
      v14 = __atxlog_handle_default();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        -[ATXNowPlayingDuetEvent initWithDKEvent:].cold.4();
      }
      goto LABEL_22;
    }
    v18 = [v5 metadata];
    v19 = [MEMORY[0x1E4F5B4B0] launchReason];
    uint64_t v20 = [v18 objectForKey:v19];
    v21 = (void *)v20;
    v22 = &stru_1F2740B58;
    if (v20) {
      v22 = (__CFString *)v20;
    }
    v23 = v22;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(id)objc_opt_class() _acceptableLaunchReason:v23])
      {
        v24 = [v5 startDate];
        v25 = [v5 endDate];
        self = [(ATXAppLaunchDuetEvent *)self initWithBundleId:v9 appLaunchState:1 launchReason:v23 startDate:v24 endDate:v25];

        v11 = self;
LABEL_30:

        goto LABEL_24;
      }
    }
    else
    {
      v27 = __atxlog_handle_default();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[ATXAppLaunchDuetEvent initWithDKEvent:]((uint64_t)v23, v27);
      }
    }
    v11 = 0;
    goto LABEL_30;
  }
  v9 = __atxlog_handle_default();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[ATXNowPlayingDuetEvent initWithDKEvent:].cold.5(v5, v9);
  }
  v11 = 0;
LABEL_25:

  return v11;
}

- (ATXAppLaunchDuetEvent)initWithCurrentContextStoreValues
{
  v3 = [MEMORY[0x1E4F5B6A8] userContext];
  v4 = [MEMORY[0x1E4F5B6B8] keyPathForAppDataDictionary];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    v25 = __atxlog_handle_default();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[ATXAppLaunchDuetEvent initWithCurrentContextStoreValues]();
    }

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v26 = __atxlog_handle_default();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[ATXAppLaunchDuetEvent initWithCurrentContextStoreValues].cold.4();
    }

    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3B8];
    v29 = @"ContextStore's 'keyPathForAppDataDictionary' is not an NSDictionary.";
    goto LABEL_21;
  }
  v6 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v30 = __atxlog_handle_default();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[ATXAppLaunchDuetEvent initWithCurrentContextStoreValues]();
    }

    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3B8];
    v29 = @"Value for 'appBundleIdKey' in ContextStore's 'keyPathForAppDataDictionary' is not an NSString.";
LABEL_21:
    [v27 raise:v28 format:v29];
LABEL_22:
    v24 = 0;
    goto LABEL_23;
  }
  v9 = [MEMORY[0x1E4F5B6B8] appBundleIdKey];
  uint64_t v10 = [v5 objectForKeyedSubscript:v9];
  v11 = (void *)v10;
  if (v10) {
    id v12 = (__CFString *)v10;
  }
  else {
    id v12 = &stru_1F2740B58;
  }
  id v13 = v12;

  v14 = [MEMORY[0x1E4F5B6B8] appLaunchReasonKey];
  uint64_t v15 = [v5 objectForKeyedSubscript:v14];
  objc_opt_class();
  char v16 = objc_opt_isKindOfClass();

  if (v16)
  {
    char v17 = [MEMORY[0x1E4F5B6B8] appLaunchReasonKey];
    uint64_t v18 = [v5 objectForKeyedSubscript:v17];
    v19 = (void *)v18;
    if (v18) {
      uint64_t v20 = (__CFString *)v18;
    }
    else {
      uint64_t v20 = &stru_1F2740B58;
    }
    v21 = v20;

    v22 = [MEMORY[0x1E4F1C9C8] date];
    v23 = [(ATXAppLaunchDuetEvent *)self initWithBundleId:v13 appLaunchState:1 launchReason:v21 startDate:v22 endDate:v22];

    self = v23;
    v24 = self;
  }
  else
  {
    v32 = __atxlog_handle_default();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      -[ATXAppLaunchDuetEvent initWithCurrentContextStoreValues]();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Value for 'appLaunchReasonKey' in ContextStore's 'keyPathForAppDataDictionary' is not an NSString."];
    v24 = 0;
  }

LABEL_23:
  return v24;
}

- (id)description
{
  v3 = NSString;
  bundleId = self->_bundleId;
  int64_t appLaunchState = self->_appLaunchState;
  launchReason = self->_launchReason;
  v7 = [(ATXDuetEvent *)self startDate];
  v8 = [(ATXDuetEvent *)self endDate];
  v9 = [v3 stringWithFormat:@"App bundleId: %@, App launch state: %ld, App launch reason: %@, start date: %@, end date: %@", bundleId, appLaunchState, launchReason, v7, v8];

  return v9;
}

+ (BOOL)_acceptableLaunchReason:(id)a3
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!a3)
  {
    uint64_t v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      char v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

      [v12 failWithError:v19];
      goto LABEL_7;
    }
  }
  BOOL v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(ATXDuetEvent *)self startDate];
  [v4 encodeObject:v5 forKey:@"codingKeyForStartDate"];

  v6 = [(ATXDuetEvent *)self endDate];
  [v4 encodeObject:v6 forKey:@"codingKeyForEndDate"];

  v7 = [(ATXAppLaunchDuetEvent *)self bundleId];
  [v4 encodeObject:v7 forKey:@"codingKeyForBundleId"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXAppLaunchDuetEvent appLaunchState](self, "appLaunchState"), @"codingKeyForAppLaunchState");
  id v8 = [(ATXAppLaunchDuetEvent *)self launchReason];
  [v4 encodeObject:v8 forKey:@"codingKeyForLaunchReason"];
}

- (ATXAppLaunchDuetEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_anchor();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForStartDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.AppLaunch" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    id v13 = __atxlog_handle_anchor();
    BOOL v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForEndDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.AppLaunch" errorCode:-1 logHandle:v13];

    if (v14 && ([v4 error], uint64_t v15 = objc_claimAutoreleasedReturnValue(), v15, !v15))
    {
      id v16 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v17 = objc_opt_class();
      uint64_t v18 = __atxlog_handle_anchor();
      v19 = [v16 robustDecodeObjectOfClass:v17 forKey:@"codingKeyForBundleId" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.AppLaunch" errorCode:-1 logHandle:v18];

      if (!v19
        || ([v4 error], uint64_t v20 = objc_claimAutoreleasedReturnValue(), v20, v20)
        || (uint64_t v21 = [v4 decodeIntegerForKey:@"codingKeyForAppLaunchState"],
            [(ATXAppLaunchDuetEvent *)self checkAndReportDecodingFailureIfNeededForNSInteger:v21 key:@"codingKeyForAppLaunchState" coder:v4 errorDomain:@"com.apple.proactive.ATXDuetEvent.AppLaunch" errorCode:-1]))
      {
        uint64_t v10 = 0;
      }
      else
      {
        v23 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v24 = objc_opt_class();
        v25 = __atxlog_handle_anchor();
        v26 = [v23 robustDecodeObjectOfClass:v24 forKey:@"codingKeyForLaunchReason" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.AppLaunch" errorCode:-1 logHandle:v25];

        if (v26
          && ([v4 error], v27 = objc_claimAutoreleasedReturnValue(), v27, !v27))
        {
          self = [(ATXAppLaunchDuetEvent *)self initWithBundleId:v19 appLaunchState:v21 launchReason:v26 startDate:v8 endDate:v14];
          uint64_t v10 = self;
        }
        else
        {
          uint64_t v10 = 0;
        }
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (int64_t)appLaunchState
{
  return self->_appLaunchState;
}

- (NSString)launchReason
{
  return self->_launchReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchReason, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

- (void)initWithDKEvent:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "Received app launch event but bundleId is 'unknown'.", v2, v3, v4, v5, v6);
}

- (void)initWithDKEvent:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Value for metadata key 'launchReason' is not a string, %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithDKEvent:.cold.4()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0FA3000, v0, OS_LOG_TYPE_DEBUG, "Skipping springboard based hosts.", v1, 2u);
}

- (void)initWithCurrentContextStoreValues
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ContextStore's 'keyPathForAppDataDictionary' is not an NSDictionary.", v2, v3, v4, v5, v6);
}

@end