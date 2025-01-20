@interface ATXBluetoothDuetEvent
+ (BOOL)supportsSecureCoding;
+ (id)convertActiveBluetoothDisconnectedEventIntoInactiveBluetoothConnectedEvent:(id)a3;
+ (id)mostRecentOrActiveBluetoothConnectedEventFromCurrentContextStoreValues;
+ (int64_t)deviceTypeFromBluetoothDeviceType:(id)a3;
- (ATXBluetoothDuetEvent)initWithBluetoothState:(int64_t)a3 deviceType:(int64_t)a4 deviceName:(id)a5 hardwareAddress:(id)a6 startDate:(id)a7 endDate:(id)a8;
- (ATXBluetoothDuetEvent)initWithCoder:(id)a3;
- (ATXBluetoothDuetEvent)initWithCurrentContextStoreValues;
- (ATXBluetoothDuetEvent)initWithDKEvent:(id)a3;
- (BOOL)checkAndReportDecodingFailureIfNeededForNSInteger:(int64_t)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7;
- (NSString)deviceIdentifier;
- (NSString)deviceName;
- (id)description;
- (int64_t)bluetoothState;
- (int64_t)deviceType;
- (void)encodeWithCoder:(id)a3;
- (void)initWithCurrentContextStoreValues;
@end

@implementation ATXBluetoothDuetEvent

- (ATXBluetoothDuetEvent)initWithBluetoothState:(int64_t)a3 deviceType:(int64_t)a4 deviceName:(id)a5 hardwareAddress:(id)a6 startDate:(id)a7 endDate:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  v16 = 0;
  if (v15 && a7)
  {
    v23.receiver = self;
    v23.super_class = (Class)ATXBluetoothDuetEvent;
    v17 = [(ATXDuetEvent *)&v23 initWithStartDate:a7 endDate:a8];
    if (v17)
    {
      uint64_t v18 = [v15 copy];
      deviceIdentifier = v17->_deviceIdentifier;
      v17->_deviceIdentifier = (NSString *)v18;

      uint64_t v20 = [v14 copy];
      deviceName = v17->_deviceName;
      v17->_deviceName = (NSString *)v20;

      v17->_bluetoothState = a3;
      v17->_deviceType = a4;
    }
    self = v17;
    v16 = self;
  }

  return v16;
}

- (ATXBluetoothDuetEvent)initWithDKEvent:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"ATXBluetoothDuetEvent.m", 60, @"Invalid parameter not satisfying: %@", @"event" object file lineNumber description];
  }
  v6 = [v5 value];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v8 = [v5 value];
    uint64_t v9 = [v8 integerValue];

    v10 = [v5 metadata];
    v11 = [MEMORY[0x1E4F5B4C8] deviceType];
    v12 = [v10 objectForKeyedSubscript:v11];

    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v17 = __atxlog_handle_default();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[ATXBluetoothDuetEvent initWithDKEvent:]();
      }
      v24 = 0;
      goto LABEL_18;
    }
    int64_t v13 = +[ATXBluetoothDuetEvent deviceTypeFromBluetoothDeviceType:v12];
    if (v13 != 2)
    {
      int64_t v14 = v13;
      id v15 = [v5 metadata];
      v16 = [MEMORY[0x1E4F5B4C8] name];
      v17 = [v15 objectForKeyedSubscript:v16];

      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v18 = [v5 metadata];
        v19 = [MEMORY[0x1E4F5B4C8] address];
        uint64_t v20 = [v18 objectForKeyedSubscript:v19];

        if (v20)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v28 = [v17 copy];
            id v21 = [v20 copy];
            v22 = [v5 startDate];
            objc_super v23 = [v5 endDate];
            self = [(ATXBluetoothDuetEvent *)self initWithBluetoothState:v9 deviceType:v14 deviceName:v28 hardwareAddress:v21 startDate:v22 endDate:v23];

            v24 = self;
LABEL_26:

LABEL_18:
            goto LABEL_19;
          }
        }
        v26 = __atxlog_handle_default();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[ATXBluetoothDuetEvent initWithDKEvent:]();
        }
      }
      else
      {
        uint64_t v20 = __atxlog_handle_default();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[ATXBluetoothDuetEvent initWithDKEvent:]();
        }
      }
      v24 = 0;
      goto LABEL_26;
    }
  }
  else
  {
    v12 = __atxlog_handle_default();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ATXScreenLockStateDuetEvent initWithDKEvent:](v5, v12);
    }
  }
  v24 = 0;
LABEL_19:

  return v24;
}

- (ATXBluetoothDuetEvent)initWithCurrentContextStoreValues
{
  v3 = [MEMORY[0x1E4F5B6A8] userContext];
  v4 = [MEMORY[0x1E4F5B6B8] keyPathForBluetoothDataDictionary];
  id v5 = [v3 objectForKeyedSubscript:v4];

  if (!v5) {
    goto LABEL_16;
  }
  v6 = [MEMORY[0x1E4F5B6B8] keyPathForBluetoothDataDictionary];
  v7 = [v3 objectForKeyedSubscript:v6];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_16:
    v16 = __atxlog_handle_default();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(ATXBluetoothDuetEvent *)v16 initWithCurrentContextStoreValues];
    }
    goto LABEL_18;
  }
  uint64_t v9 = [MEMORY[0x1E4F5B6B8] bluetoothNameKey];
  v10 = [v5 objectForKeyedSubscript:v9];
  objc_opt_class();
  char v11 = objc_opt_isKindOfClass();

  if ((v11 & 1) == 0)
  {
    v49 = __atxlog_handle_default();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
      [(ATXBluetoothDuetEvent *)v5 initWithCurrentContextStoreValues];
    }

    v50 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v51 = *MEMORY[0x1E4F1C3B8];
    v16 = [MEMORY[0x1E4F5B6B8] bluetoothNameKey];
    v52 = [v5 objectForKeyedSubscript:v16];
    v53 = (objc_class *)objc_opt_class();
    v54 = NSStringFromClass(v53);
    [v50 raise:v51, @"Value for 'bluetoothNameKey' in ContextStore's 'keyPathForBluetoothDataDictionary' is not an NSString. Found %@ instead", v54 format];

    goto LABEL_18;
  }
  v12 = [MEMORY[0x1E4F5B6B8] bluetoothNameKey];
  uint64_t v13 = [v5 objectForKeyedSubscript:v12];
  int64_t v14 = (void *)v13;
  if (v13) {
    id v15 = (__CFString *)v13;
  }
  else {
    id v15 = &stru_1F2740B58;
  }
  v16 = v15;

  v17 = [MEMORY[0x1E4F5B6B8] bluetoothAddressKey];
  uint64_t v18 = [v5 objectForKeyedSubscript:v17];
  objc_opt_class();
  char v19 = objc_opt_isKindOfClass();

  if ((v19 & 1) == 0)
  {
    v55 = __atxlog_handle_default();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
      [(ATXBluetoothDuetEvent *)v55 initWithCurrentContextStoreValues];
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Value for 'bluetoothAddressKey' in ContextStore's 'keyPathForBluetoothDataDictionary' is not an NSString."];
LABEL_18:
    v40 = 0;
    goto LABEL_19;
  }
  uint64_t v20 = [MEMORY[0x1E4F5B6B8] bluetoothAddressKey];
  uint64_t v21 = [v5 objectForKeyedSubscript:v20];
  v22 = (void *)v21;
  if (v21) {
    objc_super v23 = (__CFString *)v21;
  }
  else {
    objc_super v23 = &stru_1F2740B58;
  }
  v24 = v23;

  v25 = [MEMORY[0x1E4F5B6B8] bluetoothConnectionStatusKey];
  v26 = [v5 objectForKeyedSubscript:v25];
  objc_opt_class();
  char v27 = objc_opt_isKindOfClass();

  if (v27)
  {
    id v28 = [MEMORY[0x1E4F5B6B8] bluetoothConnectionStatusKey];
    v29 = [v5 objectForKeyedSubscript:v28];
    uint64_t v71 = [v29 integerValue];

    v30 = NSNumber;
    v31 = [MEMORY[0x1E4F5B6B8] bluetoothDeviceTypeKey];
    v32 = [v5 objectForKeyedSubscript:v31];
    v33 = [v30 numberWithLong:v32];
    int64_t v34 = +[ATXBluetoothDuetEvent deviceTypeFromBluetoothDeviceType:v33];

    v35 = [MEMORY[0x1E4F5B6B8] keyPathForBluetoothDataDictionary];
    v36 = [v3 lastModifiedDateForContextualKeyPath:v35];

    uint64_t v37 = [MEMORY[0x1E4F1C9C8] date];
    v38 = (void *)v37;
    if (v36) {
      v39 = v36;
    }
    else {
      v39 = (void *)v37;
    }
    self = [(ATXBluetoothDuetEvent *)self initWithBluetoothState:v71 deviceType:v34 deviceName:v16 hardwareAddress:v24 startDate:v39 endDate:v37];

    v40 = self;
  }
  else
  {
    v63 = __atxlog_handle_default();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      [(ATXBluetoothDuetEvent *)v63 initWithCurrentContextStoreValues];
    }

    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"Value for 'bluetoothConnectionStatusKey' in ContextStore's 'keyPathForBluetoothDataDictionary' is not an NSNumber."];
    v40 = 0;
  }

LABEL_19:
  return v40;
}

+ (id)mostRecentOrActiveBluetoothConnectedEventFromCurrentContextStoreValues
{
  v2 = [[ATXBluetoothDuetEvent alloc] initWithCurrentContextStoreValues];
  v3 = v2;
  if (v2 && ![(ATXBluetoothDuetEvent *)v2 bluetoothState])
  {
    uint64_t v4 = +[ATXBluetoothDuetEvent convertActiveBluetoothDisconnectedEventIntoInactiveBluetoothConnectedEvent:v3];

    v3 = (void *)v4;
  }
  return v3;
}

+ (id)convertActiveBluetoothDisconnectedEventIntoInactiveBluetoothConnectedEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [ATXBluetoothDuetEvent alloc];
  uint64_t v5 = [v3 deviceType];
  v6 = [v3 deviceName];
  v7 = [v3 deviceIdentifier];
  v8 = [v3 startDate];
  uint64_t v9 = [v3 startDate];

  v10 = [(ATXBluetoothDuetEvent *)v4 initWithBluetoothState:1 deviceType:v5 deviceName:v6 hardwareAddress:v7 startDate:v8 endDate:v9];
  return v10;
}

- (id)description
{
  id v3 = NSString;
  deviceName = self->_deviceName;
  deviceIdentifier = self->_deviceIdentifier;
  int64_t bluetoothState = self->_bluetoothState;
  v7 = [(ATXDuetEvent *)self startDate];
  v8 = [(ATXDuetEvent *)self endDate];
  uint64_t v9 = [v3 stringWithFormat:@"Device name: %@, Device id: %@, Bluetooth state: %ld, start date: %@, end date: %@", deviceName, deviceIdentifier, bluetoothState, v7, v8];

  return v9;
}

+ (int64_t)deviceTypeFromBluetoothDeviceType:(id)a3
{
  uint64_t v3 = [a3 integerValue];
  if ((unint64_t)(v3 - 3) > 0x2B) {
    return 2;
  }
  else {
    return qword_1D142BCD8[v3 - 3];
  }
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
      v17 = (void *)[[NSString alloc] initWithFormat:@"Failed to decode key %@", v11, v21];
      v22[0] = v17;
      BOOL v14 = 1;
      uint64_t v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      char v19 = (void *)[v16 initWithDomain:v13 code:a7 userInfo:v18];

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
  uint64_t v5 = [(ATXDuetEvent *)self startDate];
  [v4 encodeObject:v5 forKey:@"codingKeyForStartDate"];

  v6 = [(ATXDuetEvent *)self endDate];
  [v4 encodeObject:v6 forKey:@"codingKeyForEndDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXBluetoothDuetEvent bluetoothState](self, "bluetoothState"), @"codingKeyForBluetoothState");
  objc_msgSend(v4, "encodeInteger:forKey:", -[ATXBluetoothDuetEvent deviceType](self, "deviceType"), @"codingKeyForDeviceType");
  v7 = [(ATXBluetoothDuetEvent *)self deviceName];
  [v4 encodeObject:v7 forKey:@"codingKeyForDeviceName"];

  id v8 = [(ATXBluetoothDuetEvent *)self deviceIdentifier];
  [v4 encodeObject:v8 forKey:@"codingKeyForHardwareAddress"];
}

- (ATXBluetoothDuetEvent)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F93B90];
  uint64_t v6 = objc_opt_class();
  v7 = __atxlog_handle_anchor();
  id v8 = [v5 robustDecodeObjectOfClass:v6 forKey:@"codingKeyForStartDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.Bluetooth" errorCode:-1 logHandle:v7];

  if (v8 && ([v4 error], uint64_t v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    id v11 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v12 = objc_opt_class();
    id v13 = __atxlog_handle_anchor();
    BOOL v14 = [v11 robustDecodeObjectOfClass:v12 forKey:@"codingKeyForEndDate" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.Bluetooth" errorCode:-1 logHandle:v13];

    if (!v14
      || ([v4 error], id v15 = objc_claimAutoreleasedReturnValue(), v15, v15)
      || (uint64_t v16 = [v4 decodeIntegerForKey:@"codingKeyForBluetoothState"],
          -[ATXBluetoothDuetEvent checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:", v16, @"codingKeyForBluetoothState", v4, @"com.apple.proactive.ATXDuetEvent.Bluetooth", -1))|| (uint64_t v17 = [v4 decodeIntegerForKey:@"codingKeyForDeviceType"], -[ATXBluetoothDuetEvent checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:](self, "checkAndReportDecodingFailureIfNeededForNSInteger:key:coder:errorDomain:errorCode:", v17, @"codingKeyForDeviceType", v4, @"com.apple.proactive.ATXDuetEvent.Bluetooth", -1)))
    {
      v10 = 0;
    }
    else
    {
      char v19 = (void *)MEMORY[0x1E4F93B90];
      uint64_t v20 = objc_opt_class();
      uint64_t v21 = __atxlog_handle_anchor();
      v22 = [v19 robustDecodeObjectOfClass:v20 forKey:@"codingKeyForDeviceName" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.Bluetooth" errorCode:-1 logHandle:v21];

      if (v22
        && ([v4 error], objc_super v23 = objc_claimAutoreleasedReturnValue(), v23, !v23))
      {
        v24 = (void *)MEMORY[0x1E4F93B90];
        uint64_t v25 = objc_opt_class();
        v26 = __atxlog_handle_anchor();
        char v27 = [v24 robustDecodeObjectOfClass:v25 forKey:@"codingKeyForHardwareAddress" withCoder:v4 expectNonNull:1 errorDomain:@"com.apple.proactive.ATXDuetEvent.Bluetooth" errorCode:-1 logHandle:v26];

        if (v27
          && ([v4 error], id v28 = objc_claimAutoreleasedReturnValue(), v28, !v28))
        {
          self = [(ATXBluetoothDuetEvent *)self initWithBluetoothState:v16 deviceType:v17 deviceName:v22 hardwareAddress:v27 startDate:v8 endDate:v14];
          v10 = self;
        }
        else
        {
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (void)initWithDKEvent:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Value for metadata key for BluetoothConnected 'deviceType' is not a number, %@", v2, v3, v4, v5, v6);
}

- (void)initWithDKEvent:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Value for metadata key for BluetoothConnected 'name' is not a string, %@", v2, v3, v4, v5, v6);
}

- (void)initWithDKEvent:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_1D0FA3000, v0, v1, "Value for metadata key for BluetoothConnected 'address' is not a string, %@", v2, v3, v4, v5, v6);
}

- (void)initWithCurrentContextStoreValues
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [MEMORY[0x1E4F5B6B8] bluetoothNameKey];
  uint64_t v5 = [a1 objectForKeyedSubscript:v4];
  uint8_t v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Value for 'bluetoothNameKey' in ContextStore's 'keyPathForBluetoothDataDictionary' is not an NSString. Found %@ instead", v8, 0xCu);
}

@end