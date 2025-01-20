@interface ATXChargerPluggedInDuetEvent
+ (BOOL)supportsSecureCoding;
- (ATXChargerPluggedInDuetEvent)initWithChargerPluggedInState:(int64_t)a3 adapterType:(id)a4 startDate:(id)a5 endDate:(id)a6;
- (ATXChargerPluggedInDuetEvent)initWithCoder:(id)a3;
- (ATXChargerPluggedInDuetEvent)initWithCurrentContextStoreValues;
- (ATXChargerPluggedInDuetEvent)initWithDKEvent:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (NSNumber)adapterType;
- (id)description;
- (id)identifier;
- (int64_t)chargerPluggedInState;
- (void)encodeWithCoder:(id)a3;
- (void)initWithCurrentContextStoreValues;
@end

@implementation ATXChargerPluggedInDuetEvent

- (ATXChargerPluggedInDuetEvent)initWithChargerPluggedInState:(int64_t)a3 adapterType:(id)a4 startDate:(id)a5 endDate:(id)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ATXChargerPluggedInDuetEvent;
  v11 = [(ATXDuetEvent *)&v17 initWithStartDate:a5 endDate:a6];
  v12 = v11;
  if (v11)
  {
    v11->_chargerPluggedInState = a3;
    uint64_t v13 = [v10 copy];
    v14 = (void *)v13;
    if (v13) {
      v15 = (void *)v13;
    }
    else {
      v15 = &unk_1F27F1788;
    }
    objc_storeStrong((id *)&v12->_adapterType, v15);
  }
  return v12;
}

- (ATXChargerPluggedInDuetEvent)initWithDKEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"ATXChargerPluggedInDuetEvent.m", 50, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = [v5 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXScreenLockStateDuetEvent initWithDKEvent:](v5, v12);
    }
    goto LABEL_12;
  }
  v8 = [v5 value];
  uint64_t v9 = [v8 integerValue];

  id v10 = [v5 metadata];
  v11 = [MEMORY[0x1E4F5B4F0] adapterType];
  v12 = [v10 objectForKeyedSubscript:v11];

  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = __atxlog_handle_default();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[ATXChargerPluggedInDuetEvent initWithDKEvent:]((uint64_t)v12, v16);
      }

LABEL_12:
      v15 = 0;
      goto LABEL_13;
    }
  }
  uint64_t v13 = [v5 startDate];
  v14 = [v5 endDate];
  self = [(ATXChargerPluggedInDuetEvent *)self initWithChargerPluggedInState:v9 adapterType:v12 startDate:v13 endDate:v14];

  v15 = self;
LABEL_13:

  return v15;
}

- (ATXChargerPluggedInDuetEvent)initWithCurrentContextStoreValues
{
  v3 = [MEMORY[0x1E4F5B6A8] userContext];
  v4 = [MEMORY[0x1E4F5B6B8] keyPathForBatteryStateDataDictionary];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v6 = [MEMORY[0x1E4F5B6B8] batteryExternalConnectedKey];
      v7 = [v5 objectForKeyedSubscript:v6];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        uint64_t v9 = [MEMORY[0x1E4F5B6B8] batteryExternalConnectedKey];
        id v10 = [v5 objectForKeyedSubscript:v9];
        uint64_t v11 = [v10 integerValue];

        v12 = [MEMORY[0x1E4F5B6B8] batteryAdapterTypeKey];
        uint64_t v13 = [v5 objectForKeyedSubscript:v12];

        if (v13)
        {
          objc_opt_class();
          char v14 = objc_opt_isKindOfClass();
          v15 = v13;
          if ((v14 & 1) == 0)
          {
            v16 = __atxlog_handle_default();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              -[ATXChargerPluggedInDuetEvent initWithCurrentContextStoreValues]();
            }

            [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Value for 'batteryAdapterTypeKey' in ContextStore's 'keyPathForBatteryStateDataDictionary' is not an NSNumber."];
            objc_super v17 = 0;
            goto LABEL_23;
          }
        }
        else
        {
          v15 = &unk_1F27F1788;
        }
        v25 = (void *)MEMORY[0x1E4F1C9C8];
        id v26 = v15;
        v27 = [v25 date];
        v28 = [(ATXChargerPluggedInDuetEvent *)self initWithChargerPluggedInState:v11 adapterType:v26 startDate:v27 endDate:v27];

        self = v28;
        objc_super v17 = self;
LABEL_23:

        goto LABEL_20;
      }
      v23 = __atxlog_handle_default();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[ATXChargerPluggedInDuetEvent initWithCurrentContextStoreValues]();
      }

      v20 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v21 = *MEMORY[0x1E4F1C3B8];
      v22 = @"Value for 'batteryExternalConnectedKey' in ContextStore's 'keyPathForBatteryStateDataDictionary' is not an NSNumber.";
    }
    else
    {
      v19 = __atxlog_handle_default();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[ATXChargerPluggedInDuetEvent initWithCurrentContextStoreValues].cold.4();
      }

      v20 = (void *)MEMORY[0x1E4F1CA00];
      uint64_t v21 = *MEMORY[0x1E4F1C3B8];
      v22 = @"ContextStore's 'keyPathForBatteryStateDataDictionary' is not an NSDictionary.";
    }
    [v20 raise:v21 format:v22];
  }
  else
  {
    v18 = __atxlog_handle_default();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[ATXChargerPluggedInDuetEvent initWithCurrentContextStoreValues]();
    }
  }
  objc_super v17 = 0;
LABEL_20:

  return v17;
}

- (id)identifier
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"ChargerPluggedIn_1_%@", self->_adapterType];
  return v2;
}

- (id)description
{
  id v3 = [NSString alloc];
  int64_t chargerPluggedInState = self->_chargerPluggedInState;
  adapterType = self->_adapterType;
  v6 = [(ATXDuetEvent *)self startDate];
  v7 = [(ATXDuetEvent *)self endDate];
  v8 = (void *)[v3 initWithFormat:@"Charger Plugged In state: %ld, adapter type: %@, start date: %@, end date: %@", chargerPluggedInState, adapterType, v6, v7];

  return v8;
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
      objc_super v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
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
  id v4 = a3;
  id v5 = [(ATXDuetEvent *)self startDate];
  [v4 encodeObject:v5 forKey:@"codingKeyForStartDate"];

  v6 = [(ATXDuetEvent *)self endDate];
  [v4 encodeObject:v6 forKey:@"codingKeyForEndDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXChargerPluggedInDuetEvent chargerPluggedInState](self, "chargerPluggedInState"), @"codingKeyForChargerPluggedInState");
  id v7 = [(ATXChargerPluggedInDuetEvent *)self adapterType];
  [v4 encodeObject:v7 forKey:@"codingKeyForAdapterType"];
}

- (ATXChargerPluggedInDuetEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  id v7 = __atxlog_handle_anchor();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForStartDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    id v13 = __atxlog_handle_anchor();
    BOOL v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForEndDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v13];

    if (!v14
      || ([v4 error], v15 = objc_claimAutoreleasedReturnValue(), v15, v15)
      || (uint64_t v16 = [v4 decodeIntegerForKey:@"codingKeyForChargerPluggedInState"],
          [(ATXChargerPluggedInDuetEvent *)self checkAndReportDecodingFailureIfNeededForNSInteger:v16 key:@"codingKeyForChargerPluggedInState" coder:v4 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1]))
    {
      id v10 = 0;
    }
    else
    {
      v18 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v19 = objc_opt_class();
      v20 = __atxlog_handle_anchor();
      uint64_t v21 = [v18 robustDecodeObjectOfClass:v19 forKey:@"codingKeyForAdapterType" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent" errorCode:-1 logHandle:v20];

      if (v21
        && ([v4 error], v22 = objc_claimAutoreleasedReturnValue(), v22, !v22))
      {
        self = [(ATXChargerPluggedInDuetEvent *)self initWithChargerPluggedInState:v16 adapterType:v21 startDate:v8 endDate:v14];
        id v10 = self;
      }
      else
      {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (int64_t)chargerPluggedInState
{
  return self->_chargerPluggedInState;
}

- (NSNumber)adapterType
{
  return self->_adapterType;
}

- (void).cxx_destruct
{
}

- (void)initWithDKEvent:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Value for metadata key for ChargerPluggedIn 'adapterType' is not an NSNumber, %@", (uint8_t *)&v2, 0xCu);
}

- (void)initWithCurrentContextStoreValues
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ContextStore's 'keyPathForBatteryStateDataDictionary' is not an NSDictionary.", v2, v3, v4, v5, v6);
}

@end