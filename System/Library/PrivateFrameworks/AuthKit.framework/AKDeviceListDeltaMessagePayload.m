@interface AKDeviceListDeltaMessagePayload
- (AKDeviceListDeltaMessagePayload)initWithResponseBody:(id)a3;
- (NSArray)machineIDs;
- (NSDate)timestamp;
- (NSString)altDSID;
- (NSString)machineID;
- (NSString)serialNumber;
- (id)_timestampFromPayloadValue:(id)a3;
- (int64_t)_removalReasonFromPayloadValue:(id)a3;
- (int64_t)removalReason;
- (unint64_t)_operationFromPayloadValue:(id)a3;
- (unint64_t)operation;
@end

@implementation AKDeviceListDeltaMessagePayload

- (AKDeviceListDeltaMessagePayload)initWithResponseBody:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)AKDeviceListDeltaMessagePayload;
    v5 = [(AKDeviceListDeltaMessagePayload *)&v21 init];
    if (v5)
    {
      uint64_t v6 = [v4 objectForKeyedSubscript:@"altDSID"];
      altDSID = v5->_altDSID;
      v5->_altDSID = (NSString *)v6;

      v8 = [v4 objectForKeyedSubscript:@"ts"];
      uint64_t v9 = [(AKDeviceListDeltaMessagePayload *)v5 _timestampFromPayloadValue:v8];
      timestamp = v5->_timestamp;
      v5->_timestamp = (NSDate *)v9;

      uint64_t v11 = [v4 objectForKeyedSubscript:@"mid"];
      machineID = v5->_machineID;
      v5->_machineID = (NSString *)v11;

      uint64_t v13 = [v4 objectForKeyedSubscript:@"mids"];
      machineIDs = v5->_machineIDs;
      v5->_machineIDs = (NSArray *)v13;

      uint64_t v15 = [v4 objectForKeyedSubscript:@"sn"];
      serialNumber = v5->_serialNumber;
      v5->_serialNumber = (NSString *)v15;

      v17 = [v4 objectForKeyedSubscript:@"op"];
      v5->_operation = [(AKDeviceListDeltaMessagePayload *)v5 _operationFromPayloadValue:v17];

      v18 = [v4 objectForKeyedSubscript:@"rn"];
      v5->_removalReason = [(AKDeviceListDeltaMessagePayload *)v5 _removalReasonFromPayloadValue:v18];
    }
    self = v5;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)_timestampFromPayloadValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = (void *)MEMORY[0x1E4F1C9C8];
    [v3 doubleValue];
    uint64_t v6 = [v4 dateWithTimeIntervalSince1970:v5 / 1000.0];
  }
  else
  {
    v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl(&dword_193494000, v7, OS_LOG_TYPE_DEFAULT, "AKDeviceListDeltaMessagePayload missing timestamp", v9, 2u);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)_operationFromPayloadValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    id v4 = v3;
    if (objc_opt_isKindOfClass()) {
      double v5 = v4;
    }
    else {
      double v5 = 0;
    }

    if (![v5 caseInsensitiveCompare:@"A"])
    {
      unint64_t v7 = 1;
      goto LABEL_15;
    }
    if (![v5 caseInsensitiveCompare:@"D"])
    {
      unint64_t v7 = 2;
      goto LABEL_15;
    }
    uint64_t v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKDeviceListDeltaMessagePayload _operationFromPayloadValue:](v6);
    }
  }
  else
  {
    double v5 = _AKLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[AKDeviceListDeltaMessagePayload _operationFromPayloadValue:](v5);
    }
  }
  unint64_t v7 = 0;
LABEL_15:

  return v7;
}

- (int64_t)_removalReasonFromPayloadValue:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    id v4 = v3;
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }

    int64_t v6 = [v5 integerValue];
  }
  else
  {
    int64_t v6 = -1;
  }

  return v6;
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (NSString)machineID
{
  return self->_machineID;
}

- (NSArray)machineIDs
{
  return self->_machineIDs;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int64_t)removalReason
{
  return self->_removalReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_machineIDs, 0);
  objc_storeStrong((id *)&self->_machineID, 0);

  objc_storeStrong((id *)&self->_altDSID, 0);
}

- (void)_operationFromPayloadValue:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "AKDeviceListDeltaMessagePayload unable to process missing operation.", v1, 2u);
}

- (void)_operationFromPayloadValue:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "AKDeviceListDeltaMessagePayload unable to process unexpected operation.", v1, 2u);
}

@end