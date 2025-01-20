@interface AKDeviceSafetyRestrictionState
+ (BOOL)supportsSecureCoding;
- (AKDeviceSafetyRestrictionState)initWithCoder:(id)a3;
- (AKDeviceSafetyRestrictionState)initWithDeviceMID:(id)a3 serialNumber:(id)a4 restrictionReason:(int64_t)a5;
- (AKDeviceSafetyRestrictionState)initWithResponse:(id)a3 error:(id *)a4;
- (NSString)machineId;
- (NSString)serialNumber;
- (id)description;
- (int64_t)reason;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AKDeviceSafetyRestrictionState

- (AKDeviceSafetyRestrictionState)initWithDeviceMID:(id)a3 serialNumber:(id)a4 restrictionReason:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AKDeviceSafetyRestrictionState;
  v11 = [(AKDeviceSafetyRestrictionState *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_machineId, a3);
    objc_storeStrong((id *)&v12->_serialNumber, a4);
    v12->_reason = a5;
  }

  return v12;
}

- (AKDeviceSafetyRestrictionState)initWithResponse:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  v7 = [v6 objectForKeyedSubscript:@"deviceInfo"];

  id v8 = v7;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if (v9)
  {
    objc_opt_class();
    id v10 = [v9 objectForKeyedSubscript:@"mid"];
    if (objc_opt_isKindOfClass()) {
      unint64_t v11 = (unint64_t)v10;
    }
    else {
      unint64_t v11 = 0;
    }

    objc_opt_class();
    id v14 = [v9 objectForKeyedSubscript:@"sn"];
    if (objc_opt_isKindOfClass()) {
      unint64_t v15 = (unint64_t)v14;
    }
    else {
      unint64_t v15 = 0;
    }

    if (v11 | v15)
    {
      objc_opt_class();
      id v17 = [v9 objectForKeyedSubscript:@"lostMode"];
      if (objc_opt_isKindOfClass()) {
        id v18 = v17;
      }
      else {
        id v18 = 0;
      }

      if (v18)
      {
        if ([v18 BOOLValue]) {
          uint64_t v19 = 2;
        }
        else {
          uint64_t v19 = 1;
        }
      }
      else
      {
        uint64_t v19 = 1;
      }
      self = [(AKDeviceSafetyRestrictionState *)self initWithDeviceMID:v11 serialNumber:v15 restrictionReason:v19];

      v13 = self;
    }
    else
    {
      v16 = _AKLogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[AKDeviceSafetyRestrictionState initWithResponse:error:](v16);
      }

      if (a4)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "ak_deviceListErrorWithCode:", -14005);
        v13 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
    }
  }
  else
  {
    v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[AKDeviceSafetyRestrictionState initWithResponse:error:](v12);
    }

    if (a4)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "ak_deviceListErrorWithCode:", -14005);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p> machineId: %@, serial: %@, reason: %d, ", objc_opt_class(), self, self->_serialNumber, self->_machineId, self->_reason];
}

- (NSString)machineId
{
  return self->_machineId;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (int64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialNumber, 0);

  objc_storeStrong((id *)&self->_machineId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKDeviceSafetyRestrictionState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"machineId"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"reason"];

  id v8 = [(AKDeviceSafetyRestrictionState *)self initWithDeviceMID:v5 serialNumber:v6 restrictionReason:v7];
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(AKDeviceSafetyRestrictionState *)self machineId];
  [v6 encodeObject:v4 forKey:@"machineId"];

  v5 = [(AKDeviceSafetyRestrictionState *)self serialNumber];
  [v6 encodeObject:v5 forKey:@"serialNumber"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[AKDeviceSafetyRestrictionState reason](self, "reason"), @"reason");
}

- (void)initWithResponse:(os_log_t)log error:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  v2 = @"deviceInfo";
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Did not receive %{public}@ key on device restriction state, failing init", (uint8_t *)&v1, 0xCu);
}

- (void)initWithResponse:(os_log_t)log error:.cold.2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_193494000, log, OS_LOG_TYPE_ERROR, "Did not receive a serial or machineID on device restriction state, failing init", v1, 2u);
}

@end