@interface ATXAudioDuetEvent
+ (BOOL)supportsSecureCoding;
- (ATXAudioDuetEvent)initWithAudioState:(int64_t)a3 deviceIdentifier:(id)a4 portType:(id)a5 portName:(id)a6 routeChangeReason:(id)a7 startDate:(id)a8 endDate:(id)a9;
- (ATXAudioDuetEvent)initWithCoder:(id)a3;
- (ATXAudioDuetEvent)initWithCurrentContextStoreValues;
- (ATXAudioDuetEvent)initWithDKEvent:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (NSNumber)routeChangeReason;
- (NSString)deviceIdentifier;
- (NSString)portName;
- (NSString)portType;
- (id)description;
- (int64_t)audioState;
- (void)encodeWithCoder:(id)a3;
- (void)initWithCurrentContextStoreValues;
@end

@implementation ATXAudioDuetEvent

- (ATXAudioDuetEvent)initWithAudioState:(int64_t)a3 deviceIdentifier:(id)a4 portType:(id)a5 portName:(id)a6 routeChangeReason:(id)a7 startDate:(id)a8 endDate:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v19 = 0;
  if (v15 && a8)
  {
    v29.receiver = self;
    v29.super_class = (Class)ATXAudioDuetEvent;
    v20 = [(ATXDuetEvent *)&v29 initWithStartDate:a8 endDate:a9];
    v21 = v20;
    if (v20)
    {
      v20->_audioState = a3;
      uint64_t v22 = [v15 copy];
      deviceIdentifier = v21->_deviceIdentifier;
      v21->_deviceIdentifier = (NSString *)v22;

      uint64_t v24 = [v16 copy];
      portType = v21->_portType;
      v21->_portType = (NSString *)v24;

      uint64_t v26 = [v17 copy];
      portName = v21->_portName;
      v21->_portName = (NSString *)v26;

      objc_storeStrong((id *)&v21->_routeChangeReason, a7);
    }
    self = v21;
    v19 = self;
  }

  return v19;
}

- (ATXAudioDuetEvent)initWithDKEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"ATXAudioDuetEvent.m", 59, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = [v5 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v5 value];
    uint64_t v9 = [v8 integerValue];

    v10 = [v5 metadata];
    v11 = [MEMORY[0x1E4F5B4B8] identifier];
    v12 = [v10 objectForKeyedSubscript:v11];

    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v15 = __atxlog_handle_default();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[ATXAudioDuetEvent initWithDKEvent:]();
      }
      uint64_t v24 = 0;
      goto LABEL_30;
    }
    v13 = [v5 metadata];
    v14 = [MEMORY[0x1E4F5B4B8] portType];
    id v15 = [v13 objectForKeyedSubscript:v14];

    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      id v18 = __atxlog_handle_default();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[ATXAudioDuetEvent initWithDKEvent:]();
      }
      uint64_t v24 = 0;
      goto LABEL_29;
    }
    id v16 = [v5 metadata];
    id v17 = [MEMORY[0x1E4F5B4B8] portName];
    id v18 = [v16 objectForKeyedSubscript:v17];

    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v19 = [v5 metadata];
      v20 = [MEMORY[0x1E4F5B4B8] routeChangeReason];
      v21 = [v19 objectForKeyedSubscript:v20];

      if (v21)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v22 = [v5 startDate];
          v23 = [v5 endDate];
          self = [(ATXAudioDuetEvent *)self initWithAudioState:v9 deviceIdentifier:v12 portType:v15 portName:v18 routeChangeReason:v21 startDate:v22 endDate:v23];

          uint64_t v24 = self;
LABEL_28:

LABEL_29:
LABEL_30:

          goto LABEL_31;
        }
      }
      v25 = __atxlog_handle_default();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[ATXAudioDuetEvent initWithDKEvent:].cold.4();
      }
    }
    else
    {
      v21 = __atxlog_handle_default();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[ATXAudioDuetEvent initWithDKEvent:]();
      }
    }
    uint64_t v24 = 0;
    goto LABEL_28;
  }
  v12 = __atxlog_handle_default();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[ATXScreenLockStateDuetEvent initWithDKEvent:](v5, v12);
  }
  uint64_t v24 = 0;
LABEL_31:

  return v24;
}

- (ATXAudioDuetEvent)initWithCurrentContextStoreValues
{
  v3 = [MEMORY[0x1E4F5B6A8] userContext];
  v4 = [MEMORY[0x1E4F5B6B8] keyPathForAudioOutputDataDictionary];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5)
  {
    v43 = __atxlog_handle_default();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
      -[ATXAudioDuetEvent initWithCurrentContextStoreValues]();
    }

    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v44 = __atxlog_handle_default();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
      -[ATXAudioDuetEvent initWithCurrentContextStoreValues].cold.7();
    }

    v45 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v46 = *MEMORY[0x1E4F1C3B8];
    v47 = @"ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSDictionary.";
    goto LABEL_30;
  }
  v6 = [MEMORY[0x1E4F5B6B8] audioOutputStatusKey];
  v7 = [v5 objectForKeyedSubscript:v6];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v48 = __atxlog_handle_default();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR)) {
      -[ATXAudioDuetEvent initWithCurrentContextStoreValues].cold.6();
    }

    v45 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v46 = *MEMORY[0x1E4F1C3B8];
    v47 = @"Value for 'audioOutputStatusKey' in ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSNumber.";
    goto LABEL_30;
  }
  uint64_t v9 = [MEMORY[0x1E4F5B6B8] audioOutputStatusKey];
  v10 = [v5 objectForKeyedSubscript:v9];
  uint64_t v11 = [v10 integerValue];

  v12 = [MEMORY[0x1E4F5B6B8] audioIdentifierKey];
  v13 = [v5 objectForKeyedSubscript:v12];
  objc_opt_class();
  char v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) == 0)
  {
    v49 = __atxlog_handle_default();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      -[ATXAudioDuetEvent initWithCurrentContextStoreValues].cold.5();
    }

    v45 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v46 = *MEMORY[0x1E4F1C3B8];
    v47 = @"Value for 'audioIdentifierKey' in ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSString.";
LABEL_30:
    [v45 raise:v46 format:v47];
LABEL_31:
    v42 = 0;
    goto LABEL_32;
  }
  id v15 = [MEMORY[0x1E4F5B6B8] audioIdentifierKey];
  uint64_t v16 = [v5 objectForKeyedSubscript:v15];
  id v17 = (void *)v16;
  if (v16) {
    id v18 = (__CFString *)v16;
  }
  else {
    id v18 = &stru_1F2740B58;
  }
  v55 = v18;

  v19 = [MEMORY[0x1E4F5B6B8] audioPortTypeKey];
  v20 = [v5 objectForKeyedSubscript:v19];
  objc_opt_class();
  char v21 = objc_opt_isKindOfClass();

  if (v21)
  {
    uint64_t v22 = [MEMORY[0x1E4F5B6B8] audioPortTypeKey];
    uint64_t v23 = [v5 objectForKeyedSubscript:v22];
    uint64_t v24 = (void *)v23;
    if (v23) {
      v25 = (__CFString *)v23;
    }
    else {
      v25 = &stru_1F2740B58;
    }
    uint64_t v26 = v25;

    v27 = [MEMORY[0x1E4F5B6B8] audioPortNameKey];
    v28 = [v5 objectForKeyedSubscript:v27];
    objc_opt_class();
    char v29 = objc_opt_isKindOfClass();

    if (v29)
    {
      v54 = v26;
      v30 = [MEMORY[0x1E4F5B6B8] audioPortNameKey];
      uint64_t v31 = [v5 objectForKeyedSubscript:v30];
      v32 = (void *)v31;
      if (v31) {
        v33 = (__CFString *)v31;
      }
      else {
        v33 = &stru_1F2740B58;
      }
      v34 = v33;

      v35 = [MEMORY[0x1E4F5B6B8] audioRouteChangeReasonKey];
      v36 = [v5 objectForKeyedSubscript:v35];
      objc_opt_class();
      char v37 = objc_opt_isKindOfClass();

      if (v37)
      {
        v38 = [MEMORY[0x1E4F5B6B8] audioRouteChangeReasonKey];
        v39 = [v5 objectForKeyedSubscript:v38];

        v40 = [MEMORY[0x1E4F1C9C8] date];
        v41 = v55;
        self = [(ATXAudioDuetEvent *)self initWithAudioState:v11 deviceIdentifier:v55 portType:v54 portName:v34 routeChangeReason:v39 startDate:v40 endDate:v40];

        v42 = self;
      }
      else
      {
        v53 = __atxlog_handle_default();
        v41 = v55;
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
          -[ATXAudioDuetEvent initWithCurrentContextStoreValues]();
        }

        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Value for 'audioRouteChangeReasonKey' in ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSNumber."];
        v42 = 0;
      }

      uint64_t v26 = v54;
    }
    else
    {
      v52 = __atxlog_handle_default();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR)) {
        -[ATXAudioDuetEvent initWithCurrentContextStoreValues]();
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Value for 'audioPortNameKey' in ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSString."];
      v42 = 0;
      v41 = v55;
    }
  }
  else
  {
    v51 = __atxlog_handle_default();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
      -[ATXAudioDuetEvent initWithCurrentContextStoreValues].cold.4();
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Value for 'audioPortTypeKey' in ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSString."];
    v42 = 0;
    v41 = v55;
  }

LABEL_32:
  return v42;
}

- (id)description
{
  v3 = NSString;
  deviceIdentifier = self->_deviceIdentifier;
  portType = self->_portType;
  portName = self->_portName;
  int64_t audioState = self->_audioState;
  v8 = [(ATXDuetEvent *)self startDate];
  uint64_t v9 = [(ATXDuetEvent *)self endDate];
  v10 = [v3 stringWithFormat:@"DeviceAudioOutputExternal - Device identifier: %@, port type: %@, port name: %@, audio connected state: %ld, start date: %@, end date: %@", deviceIdentifier, portType, portName, audioState, v8, v9];

  return v10;
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
    id v15 = [v12 error];

    if (v15)
    {
      BOOL v14 = 1;
      goto LABEL_7;
    }
    if (([v12 containsValueForKey:v11] & 1) == 0)
    {
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F28568];
      id v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
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

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXAudioDuetEvent audioState](self, "audioState"), @"codingKeyForAudioState");
  v7 = [(ATXAudioDuetEvent *)self deviceIdentifier];
  [v4 encodeObject:v7 forKey:@"codingKeyForDeviceId"];

  v8 = [(ATXAudioDuetEvent *)self portType];
  [v4 encodeObject:v8 forKey:@"codingKeyForPortType"];

  uint64_t v9 = [(ATXAudioDuetEvent *)self portName];
  [v4 encodeObject:v9 forKey:@"codingKeyForPortName"];

  id v10 = [(ATXAudioDuetEvent *)self routeChangeReason];
  [v4 encodeObject:v10 forKey:@"codingKeyForRouteChangeReason"];
}

- (ATXAudioDuetEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_anchor();
  v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForStartDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.Audio" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    id v13 = __atxlog_handle_anchor();
    BOOL v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForEndDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.Audio" errorCode:-1 logHandle:v13];

    if (!v14
      || ([v4 error], id v15 = objc_claimAutoreleasedReturnValue(), v15, v15)
      || (uint64_t v16 = [v4 decodeIntegerForKey:@"codingKeyForAudioState"],
          [(ATXAudioDuetEvent *)self checkAndReportDecodingFailureIfNeededForNSInteger:v16 key:@"codingKeyForAudioState" coder:v4 errorDomain:@"com.apple.proactive.ATXDuetEvent.Audio" errorCode:-1]))
    {
      id v10 = 0;
    }
    else
    {
      id v18 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v19 = objc_opt_class();
      v20 = __atxlog_handle_anchor();
      uint64_t v21 = [v18 robustDecodeObjectOfClass:v19 forKey:@"codingKeyForDeviceId" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.Audio" errorCode:-1 logHandle:v20];

      if (v21
        && ([v4 error], uint64_t v22 = objc_claimAutoreleasedReturnValue(), v22, !v22))
      {
        uint64_t v23 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v24 = objc_opt_class();
        v25 = __atxlog_handle_anchor();
        uint64_t v26 = [v23 robustDecodeObjectOfClass:v24 forKey:@"codingKeyForPortType" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.Audio" errorCode:-1 logHandle:v25];

        if (v26
          && ([v4 error], v27 = objc_claimAutoreleasedReturnValue(), v27, !v27))
        {
          char v37 = (void *)MEMORY[0x1E4F93B90];
          uint64_t v28 = objc_opt_class();
          char v29 = __atxlog_handle_anchor();
          uint64_t v30 = [v37 robustDecodeObjectOfClass:v28 forKey:@"codingKeyForPortName" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.Audio" errorCode:-1 logHandle:v29];

          uint64_t v31 = (void *)v30;
          if (v30
            && ([v4 error], v32 = objc_claimAutoreleasedReturnValue(), v32, !v32))
          {
            v38 = (void *)MEMORY[0x1E4F93B90];
            uint64_t v33 = objc_opt_class();
            v34 = __atxlog_handle_anchor();
            v35 = [v38 robustDecodeObjectOfClass:v33 forKey:@"codingKeyForRouteChangeReason" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.Audio" errorCode:-1 logHandle:v34];

            if (v35
              && ([v4 error], v36 = objc_claimAutoreleasedReturnValue(), v36, !v36))
            {
              self = [(ATXAudioDuetEvent *)self initWithAudioState:v16 deviceIdentifier:v21 portType:v26 portName:v31 routeChangeReason:v35 startDate:v8 endDate:v14];
              id v10 = self;
            }
            else
            {
              id v10 = 0;
            }
          }
          else
          {
            id v10 = 0;
          }
        }
        else
        {
          id v10 = 0;
        }
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

- (int64_t)audioState
{
  return self->_audioState;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)portType
{
  return self->_portType;
}

- (NSString)portName
{
  return self->_portName;
}

- (NSNumber)routeChangeReason
{
  return self->_routeChangeReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeChangeReason, 0);
  objc_storeStrong((id *)&self->_portName, 0);
  objc_storeStrong((id *)&self->_portType, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (void)initWithDKEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Value for metadata key for DeviceAudioOutputExternal 'identifier' is not a string, %@", v2, v3, v4, v5, v6);
}

- (void)initWithDKEvent:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Value for metadata key for DeviceAudioOutputExternal 'portType' is not a string, %@", v2, v3, v4, v5, v6);
}

- (void)initWithDKEvent:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Value for metadata key for DeviceAudioOutputExternal 'portName' is not a string, %@", v2, v3, v4, v5, v6);
}

- (void)initWithDKEvent:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Value for metadata key for DeviceAudioOutputExternal 'routeChangeReason' is not a number, %@", v2, v3, v4, v5, v6);
}

- (void)initWithCurrentContextStoreValues
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_1D0FA3000, v0, v1, "ContextStore's 'keyPathForAudioOutputDataDictionary' is not an NSDictionary.", v2, v3, v4, v5, v6);
}

@end