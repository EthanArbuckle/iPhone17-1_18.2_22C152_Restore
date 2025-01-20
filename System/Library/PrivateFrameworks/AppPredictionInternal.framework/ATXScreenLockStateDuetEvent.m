@interface ATXScreenLockStateDuetEvent
+ (BOOL)supportsSecureCoding;
- (ATXScreenLockStateDuetEvent)initWithCoder:(id)a3;
- (ATXScreenLockStateDuetEvent)initWithCurrentContextStoreValues;
- (ATXScreenLockStateDuetEvent)initWithDKEvent:(id)a3;
- (ATXScreenLockStateDuetEvent)initWithScreenLockState:(int64_t)a3 startDate:(id)a4 endDate:(id)a5;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (id)description;
- (id)identifier;
- (int64_t)screenLockState;
- (void)encodeWithCoder:(id)a3;
- (void)initWithCurrentContextStoreValues;
@end

@implementation ATXScreenLockStateDuetEvent

- (ATXScreenLockStateDuetEvent)initWithScreenLockState:(int64_t)a3 startDate:(id)a4 endDate:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)ATXScreenLockStateDuetEvent;
  result = [(ATXDuetEvent *)&v7 initWithStartDate:a4 endDate:a5];
  if (result) {
    result->_screenLockState = a3;
  }
  return result;
}

- (ATXScreenLockStateDuetEvent)initWithDKEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"ATXScreenLockStateDuetEvent.m", 43, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = [v5 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v5 value];
    uint64_t v9 = [v8 integerValue];

    v10 = [v5 startDate];
    v11 = [v5 endDate];
    self = [(ATXScreenLockStateDuetEvent *)self initWithScreenLockState:v9 startDate:v10 endDate:v11];

    v12 = self;
  }
  else
  {
    v13 = __atxlog_handle_default();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[ATXScreenLockStateDuetEvent initWithDKEvent:](v5, v13);
    }

    v12 = 0;
  }

  return v12;
}

- (ATXScreenLockStateDuetEvent)initWithCurrentContextStoreValues
{
  v3 = [MEMORY[0x1E4F5B6A8] userContext];
  v4 = [MEMORY[0x1E4F5B6B8] keyPathForDeviceLockStatus];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    uint64_t v9 = __atxlog_handle_default();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ATXScreenLockStateDuetEvent initWithCurrentContextStoreValues](v9);
    }

    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = __atxlog_handle_default();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ATXScreenLockStateDuetEvent initWithCurrentContextStoreValues](v10);
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"ContextStore's 'keyPathForDeviceLockStatus' is not an NSNumber."];
LABEL_10:
    v8 = 0;
    goto LABEL_11;
  }
  uint64_t v6 = [v5 integerValue];
  objc_super v7 = [MEMORY[0x1E4F1C9C8] date];
  self = [(ATXScreenLockStateDuetEvent *)self initWithScreenLockState:v6 startDate:v7 endDate:v7];

  v8 = self;
LABEL_11:

  return v8;
}

- (id)identifier
{
  return @"Common-ScreenLockState-Identifier";
}

- (id)description
{
  id v3 = [NSString alloc];
  int64_t v4 = [(ATXScreenLockStateDuetEvent *)self screenLockState];
  id v5 = [(ATXDuetEvent *)self startDate];
  uint64_t v6 = [(ATXDuetEvent *)self endDate];
  objc_super v7 = (void *)[v3 initWithFormat:@"Screen Lock state: %ld, start date: %@, end date: %@", v4, v5, v6];

  return v7;
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
    v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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
  id v6 = a3;
  int64_t v4 = [(ATXDuetEvent *)self startDate];
  [v6 encodeObject:v4 forKey:@"codingKeyForStartDate"];

  id v5 = [(ATXDuetEvent *)self endDate];
  [v6 encodeObject:v5 forKey:@"codingKeyForEndDate"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[ATXScreenLockStateDuetEvent screenLockState](self, "screenLockState"), @"codingKeyForScreenLockState");
}

- (ATXScreenLockStateDuetEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  objc_super v7 = __atxlog_handle_anchor();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForStartDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.ScreenLockState" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    id v13 = __atxlog_handle_anchor();
    BOOL v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForEndDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.ScreenLockState" errorCode:-1 logHandle:v13];

    if (!v14
      || ([v4 error], v15 = objc_claimAutoreleasedReturnValue(), v15, v15)
      || (uint64_t v16 = [v4 decodeIntegerForKey:@"codingKeyForScreenLockState"],
          [(ATXScreenLockStateDuetEvent *)self checkAndReportDecodingFailureIfNeededForNSInteger:v16 key:@"codingKeyForScreenLockState" coder:v4 errorDomain:@"com.apple.proactive.ATXDuetEvent.ScreenLockState" errorCode:-1]))
    {
      v10 = 0;
    }
    else
    {
      self = [(ATXScreenLockStateDuetEvent *)self initWithScreenLockState:v16 startDate:v8 endDate:v14];
      v10 = self;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)screenLockState
{
  return self->_screenLockState;
}

- (void)initWithDKEvent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 value];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = (objc_class *)objc_opt_class();
  objc_super v7 = NSStringFromClass(v6);
  int v8 = 138412546;
  uint64_t v9 = v5;
  __int16 v10 = 2112;
  id v11 = v7;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Value of _DKEvent was %@, not %@", (uint8_t *)&v8, 0x16u);
}

- (void)initWithCurrentContextStoreValues
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0FA3000, log, OS_LOG_TYPE_ERROR, "ContextStore's 'keyPathForDeviceLockStatus' is not an NSNumber.", v1, 2u);
}

@end