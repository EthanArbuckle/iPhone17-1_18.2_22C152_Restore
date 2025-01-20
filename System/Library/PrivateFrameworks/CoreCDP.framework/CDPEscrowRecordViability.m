@interface CDPEscrowRecordViability
+ (BOOL)supportsSecureCoding;
- (BOOL)hasMachineId;
- (BOOL)hasRecords;
- (BOOL)isEqual:(id)a3;
- (BOOL)isForCurrentDevice;
- (BOOL)recordIsValid;
- (CDPEscrowRecordViability)initWithCoder:(id)a3;
- (CDPEscrowRecordViability)initWithDefaultValues;
- (CDPEscrowRecordViability)initWithRecordPresence:(BOOL)a3 isValid:(BOOL)a4 recordId:(id)a5 buildVersion:(id)a6 isForCurrentDevice:(BOOL)a7 hasMachineId:(BOOL)a8 recordViability:(unint64_t)a9 localSecretViability:(unint64_t)a10 tlkRecoveryViability:(unint64_t)a11 sosViability:(unint64_t)a12 pcsRecoveryViability:(unint64_t)a13;
- (NSString)buildVersion;
- (NSString)recordId;
- (id)copyWithZone:(_NSZone *)a3;
- (int64x2_t)updatedViabiltyWithRecord:(int64x2_t *)a1;
- (unint64_t)localSecretViability;
- (unint64_t)localViability;
- (unint64_t)pcsRecoveryViability;
- (unint64_t)recordViability;
- (unint64_t)sosViability;
- (unint64_t)tlkRecoveryViability;
- (void)encodeWithCoder:(id)a3;
- (void)localViability;
- (void)setHasMachineId:(BOOL)a3;
@end

@implementation CDPEscrowRecordViability

- (CDPEscrowRecordViability)initWithRecordPresence:(BOOL)a3 isValid:(BOOL)a4 recordId:(id)a5 buildVersion:(id)a6 isForCurrentDevice:(BOOL)a7 hasMachineId:(BOOL)a8 recordViability:(unint64_t)a9 localSecretViability:(unint64_t)a10 tlkRecoveryViability:(unint64_t)a11 sosViability:(unint64_t)a12 pcsRecoveryViability:(unint64_t)a13
{
  id v20 = a5;
  id v21 = a6;
  v26.receiver = self;
  v26.super_class = (Class)CDPEscrowRecordViability;
  v22 = [(CDPEscrowRecordViability *)&v26 init];
  v23 = v22;
  if (v22)
  {
    v22->_hasRecords = a3;
    v22->_recordIsValid = a4;
    objc_storeStrong((id *)&v22->_recordId, a5);
    objc_storeStrong((id *)&v23->_buildVersion, a6);
    v23->_isForCurrentDevice = a7;
    v23->_hasMachineId = a8;
    v23->_recordViability = a9;
    v23->_localSecretViability = a10;
    v23->_tlkRecoveryViability = a11;
    v23->_pcsRecoveryViability = a13;
    v23->_sosViability = a12;
    v24 = v23;
  }

  return v23;
}

- (CDPEscrowRecordViability)initWithDefaultValues
{
  return [(CDPEscrowRecordViability *)self initWithRecordPresence:0 isValid:0 recordId:0 buildVersion:0 isForCurrentDevice:0 hasMachineId:0 recordViability:2 localSecretViability:0 tlkRecoveryViability:2 sosViability:2 pcsRecoveryViability:2];
}

- (unint64_t)localViability
{
  if (![(CDPEscrowRecordViability *)self hasRecords])
  {
    v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CDPEscrowRecordViability localViability].cold.7();
    }
    goto LABEL_16;
  }
  if (![(CDPEscrowRecordViability *)self recordIsValid])
  {
    v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CDPEscrowRecordViability localViability].cold.6();
    }
    goto LABEL_16;
  }
  if (![(CDPEscrowRecordViability *)self isForCurrentDevice])
  {
    v4 = _CDPLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[CDPEscrowRecordViability localViability].cold.5();
    }
LABEL_16:

    return 2;
  }
  if ([(CDPEscrowRecordViability *)self recordViability] == 1)
  {
    if (![(CDPEscrowRecordViability *)self hasMachineId])
    {
      v3 = _CDPLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        -[CDPEscrowRecordViability localViability]();
      }
      goto LABEL_22;
    }
    if (+[CDPUtilities shouldValidatePasscodeGenerations]&& [(CDPEscrowRecordViability *)self localSecretViability] == 3)
    {
      v3 = _CDPLogSystem();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        -[CDPEscrowRecordViability localViability]();
      }
LABEL_22:

      return 3;
    }
    v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[CDPEscrowRecordViability localViability]();
    }

    return 1;
  }
  else
  {
    v6 = _CDPLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[CDPEscrowRecordViability localViability].cold.4();
    }

    return [(CDPEscrowRecordViability *)self recordViability];
  }
}

- (int64x2_t)updatedViabiltyWithRecord:(int64x2_t *)a1
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1)
  {
    a1 = (int64x2_t *)[(int64x2_t *)a1 copy];
    if (([(int64x2_t *)a1 hasRecords] & 1) == 0)
    {
      a1->i16[4] = 257;
      a1->i8[11] = 1;
      a1[2].i64[0] = 3;
      a1[3] = vdupq_n_s64(3uLL);
      a1[4].i64[0] = 3;
    }
    if ([(int64x2_t *)a1 recordViability] == 1)
    {
      _CDPLogSystem();
      v4 = (CDPDevice *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11[0]) = 0;
        _os_log_impl(&dword_2182AE000, &v4->super, OS_LOG_TYPE_DEFAULT, "Report already received a viable record.", (uint8_t *)v11, 2u);
      }
    }
    else
    {
      v4 = [[CDPDevice alloc] initWithEscrowRecord:v3];
      if ([v3 recordViability]) {
        BOOL v5 = [v3 recordViability] == 1;
      }
      else {
        BOOL v5 = 1;
      }
      if (([(int64x2_t *)a1 hasMachineId] & 1) == 0)
      {
        v6 = [(CDPDevice *)v4 machineID];

        if (v6)
        {
          v7 = _CDPLogSystem();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
            -[CDPEscrowRecordViability updatedViabiltyWithRecord:]();
          }

          a1->i8[10] = 1;
        }
      }
      v8 = _CDPLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v11[0] = 67109376;
        v11[1] = v5;
        __int16 v12 = 1024;
        int v13 = [(int64x2_t *)a1 hasMachineId];
        _os_log_impl(&dword_2182AE000, v8, OS_LOG_TYPE_DEFAULT, "Checking viability. hasRecordViability = (%{BOOL}d), hasMachineId = (%{BOOL}d)", (uint8_t *)v11, 0xEu);
      }

      if (v5 && [(int64x2_t *)a1 hasMachineId])
      {
        a1[2].i64[0] = 1;
      }
      else
      {
        v9 = _CDPLogSystem();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v11[0]) = 0;
          _os_log_impl(&dword_2182AE000, v9, OS_LOG_TYPE_DEFAULT, "Record is not viable.", (uint8_t *)v11, 2u);
        }
      }
    }
  }
  return a1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CDPEscrowRecordViability)initWithCoder:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CDPEscrowRecordViability;
  BOOL v5 = [(CDPEscrowRecordViability *)&v30 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasRecords"];
    char v7 = [v6 BOOLValue];

    v5->_hasRecords = v7;
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordIsValid"];
    char v9 = [v8 BOOLValue];

    v5->_recordIsValid = v9;
    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordId"];
    uint64_t v11 = self;

    recordId = v5->_recordId;
    v5->_recordId = (NSString *)v11;

    int v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"buildVersion"];
    uint64_t v14 = self;

    buildVersion = v5->_buildVersion;
    v5->_buildVersion = (NSString *)v14;

    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isForCurrentDevice"];
    LOBYTE(v14) = [v16 BOOLValue];

    v5->_isForCurrentDevice = v14;
    v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"hasMachineId"];
    LOBYTE(v14) = [v17 BOOLValue];

    v5->_hasMachineId = v14;
    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"recordViability"];
    uint64_t v19 = [v18 unsignedLongValue];

    v5->_recordViability = v19;
    id v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localSecretViability"];
    uint64_t v21 = [v20 unsignedLongValue];

    v5->_localSecretViability = v21;
    v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"tlkRecoveryViability"];
    uint64_t v23 = [v22 unsignedLongValue];

    v5->_tlkRecoveryViability = v23;
    v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pcsRecoveryViability"];
    uint64_t v25 = [v24 unsignedLongValue];

    v5->_pcsRecoveryViability = v25;
    objc_super v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sosViability"];
    uint64_t v27 = [v26 unsignedLongValue];

    v5->_sosViability = v27;
    v28 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = NSNumber;
  BOOL hasRecords = self->_hasRecords;
  id v6 = a3;
  char v7 = [v4 numberWithBool:hasRecords];
  [v6 encodeObject:v7 forKey:@"hasRecords"];

  v8 = [NSNumber numberWithBool:self->_recordIsValid];
  [v6 encodeObject:v8 forKey:@"recordIsValid"];

  [v6 encodeObject:self->_recordId forKey:@"recordId"];
  [v6 encodeObject:self->_buildVersion forKey:@"buildVersion"];
  char v9 = [NSNumber numberWithBool:self->_isForCurrentDevice];
  [v6 encodeObject:v9 forKey:@"isForCurrentDevice"];

  v10 = [NSNumber numberWithBool:self->_hasMachineId];
  [v6 encodeObject:v10 forKey:@"hasMachineId"];

  uint64_t v11 = [NSNumber numberWithUnsignedInteger:self->_recordViability];
  [v6 encodeObject:v11 forKey:@"recordViability"];

  __int16 v12 = [NSNumber numberWithUnsignedInteger:self->_localSecretViability];
  [v6 encodeObject:v12 forKey:@"localSecretViability"];

  int v13 = [NSNumber numberWithUnsignedInteger:self->_tlkRecoveryViability];
  [v6 encodeObject:v13 forKey:@"tlkRecoveryViability"];

  uint64_t v14 = [NSNumber numberWithUnsignedInteger:self->_pcsRecoveryViability];
  [v6 encodeObject:v14 forKey:@"pcsRecoveryViability"];

  id v15 = [NSNumber numberWithUnsignedInteger:self->_sosViability];
  [v6 encodeObject:v15 forKey:@"sosViability"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10 = [CDPEscrowRecordViability alloc];
  BOOL v9 = [(CDPEscrowRecordViability *)self hasRecords];
  BOOL v4 = [(CDPEscrowRecordViability *)self recordIsValid];
  BOOL v5 = [(CDPEscrowRecordViability *)self recordId];
  id v6 = [(CDPEscrowRecordViability *)self buildVersion];
  char v7 = [(CDPEscrowRecordViability *)v10 initWithRecordPresence:v9 isValid:v4 recordId:v5 buildVersion:v6 isForCurrentDevice:[(CDPEscrowRecordViability *)self isForCurrentDevice] hasMachineId:[(CDPEscrowRecordViability *)self hasMachineId] recordViability:[(CDPEscrowRecordViability *)self recordViability] localSecretViability:[(CDPEscrowRecordViability *)self localSecretViability] tlkRecoveryViability:[(CDPEscrowRecordViability *)self tlkRecoveryViability] sosViability:[(CDPEscrowRecordViability *)self sosViability] pcsRecoveryViability:[(CDPEscrowRecordViability *)self pcsRecoveryViability]];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_17;
  }
  int v5 = [(CDPEscrowRecordViability *)self hasRecords];
  if (v5 != [v4 hasRecords]) {
    goto LABEL_17;
  }
  int v6 = [(CDPEscrowRecordViability *)self recordIsValid];
  if (v6 != [v4 recordIsValid]) {
    goto LABEL_17;
  }
  char v7 = [(CDPEscrowRecordViability *)self recordId];
  v8 = [v4 recordId];
  if ([v7 isEqual:v8])
  {
  }
  else
  {
    BOOL v9 = [(CDPEscrowRecordViability *)self recordId];
    v10 = [v4 recordId];

    if (v9 != v10) {
      goto LABEL_17;
    }
  }
  uint64_t v11 = [(CDPEscrowRecordViability *)self buildVersion];
  __int16 v12 = [v4 buildVersion];
  if (![v11 isEqual:v12])
  {
    int v13 = [(CDPEscrowRecordViability *)self buildVersion];
    uint64_t v14 = [v4 buildVersion];

    if (v13 == v14) {
      goto LABEL_10;
    }
LABEL_17:
    BOOL v22 = 0;
    goto LABEL_18;
  }

LABEL_10:
  int v15 = [(CDPEscrowRecordViability *)self isForCurrentDevice];
  if (v15 != [v4 isForCurrentDevice]) {
    goto LABEL_17;
  }
  int v16 = [(CDPEscrowRecordViability *)self hasMachineId];
  if (v16 != [v4 hasMachineId]) {
    goto LABEL_17;
  }
  unint64_t v17 = [(CDPEscrowRecordViability *)self recordViability];
  if (v17 != [v4 recordViability]) {
    goto LABEL_17;
  }
  unint64_t v18 = [(CDPEscrowRecordViability *)self localSecretViability];
  if (v18 != [v4 localSecretViability]) {
    goto LABEL_17;
  }
  unint64_t v19 = [(CDPEscrowRecordViability *)self tlkRecoveryViability];
  if (v19 != [v4 tlkRecoveryViability]) {
    goto LABEL_17;
  }
  unint64_t v20 = [(CDPEscrowRecordViability *)self pcsRecoveryViability];
  if (v20 != [v4 pcsRecoveryViability]) {
    goto LABEL_17;
  }
  unint64_t v21 = [(CDPEscrowRecordViability *)self sosViability];
  BOOL v22 = v21 == [v4 sosViability];
LABEL_18:

  return v22;
}

- (BOOL)hasRecords
{
  return self->_hasRecords;
}

- (NSString)recordId
{
  return self->_recordId;
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (BOOL)isForCurrentDevice
{
  return self->_isForCurrentDevice;
}

- (BOOL)hasMachineId
{
  return self->_hasMachineId;
}

- (void)setHasMachineId:(BOOL)a3
{
  self->_hasMachineId = a3;
}

- (BOOL)recordIsValid
{
  return self->_recordIsValid;
}

- (unint64_t)recordViability
{
  return self->_recordViability;
}

- (unint64_t)localSecretViability
{
  return self->_localSecretViability;
}

- (unint64_t)tlkRecoveryViability
{
  return self->_tlkRecoveryViability;
}

- (unint64_t)pcsRecoveryViability
{
  return self->_pcsRecoveryViability;
}

- (unint64_t)sosViability
{
  return self->_sosViability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_recordId, 0);
}

- (void)localViability
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_2182AE000, v0, v1, "localViability: No records found returning NotFound", v2, v3, v4, v5, v6);
}

- (void)updatedViabiltyWithRecord:.cold.1()
{
  OUTLINED_FUNCTION_1();
}

@end