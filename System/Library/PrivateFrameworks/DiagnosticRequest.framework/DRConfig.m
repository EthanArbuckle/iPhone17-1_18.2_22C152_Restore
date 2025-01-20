@interface DRConfig
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConfig:(id)a3;
- (BOOL)payloadIsJSON;
- (BOOL)skippedHysteresis;
- (DRConfig)initWithBuild:(id)a3 teamID:(id)a4 configDescription:(id)a5 configUUID:(id)a6 receivedDate:(id)a7 startDate:(id)a8 endDate:(id)a9 payload:(id)a10 payloadIsJSON:(BOOL)a11 skipHysteresis:(BOOL)a12;
- (DRConfig)initWithCoder:(id)a3;
- (DRConfig)initWithJSONDict:(id)a3 receivedDate:(id)a4;
- (NSData)payload;
- (NSDate)endDate;
- (NSDate)receivedDate;
- (NSDate)startDate;
- (NSDictionary)payloadDictionaryRepresentation;
- (NSString)build;
- (NSString)configDescription;
- (NSString)teamID;
- (NSUUID)configUUID;
- (id)jsonDictRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setBuild:(id)a3;
@end

@implementation DRConfig

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DRConfig *)self build];
  [v4 encodeObject:v5 forKey:@"build"];

  v6 = [(DRConfig *)self teamID];
  [v4 encodeObject:v6 forKey:@"teamID"];

  v7 = [(DRConfig *)self configDescription];
  [v4 encodeObject:v7 forKey:@"configDescription"];

  v8 = [(DRConfig *)self configUUID];
  [v4 encodeObject:v8 forKey:@"configUUID"];

  v9 = [(DRConfig *)self payload];
  [v4 encodeObject:v9 forKey:@"payload"];

  objc_msgSend(v4, "encodeBool:forKey:", -[DRConfig payloadIsJSON](self, "payloadIsJSON"), @"payloadIsJSON");
  objc_msgSend(v4, "encodeBool:forKey:", -[DRConfig skippedHysteresis](self, "skippedHysteresis"), @"skipHysteresis");
  v10 = [(DRConfig *)self receivedDate];
  [v4 encodeObject:v10 forKey:@"receivedDate"];

  v11 = [(DRConfig *)self startDate];
  [v4 encodeObject:v11 forKey:@"startDate"];

  id v12 = [(DRConfig *)self endDate];
  [v4 encodeObject:v12 forKey:@"endDate"];
}

- (DRConfig)initWithCoder:(id)a3
{
  id v3 = a3;
  v16 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
  id v4 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"teamID"];
  v5 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"configDescription"];
  v6 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"configUUID"];
  v7 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"payload"];
  char v8 = [v3 decodeBoolForKey:@"payloadIsJSON"];
  char v9 = [v3 decodeBoolForKey:@"skipHysteresis"];
  v10 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"receivedDate"];
  v11 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
  id v12 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];

  BYTE1(v15) = v9;
  LOBYTE(v15) = v8;
  v13 = -[DRConfig initWithBuild:teamID:configDescription:configUUID:receivedDate:startDate:endDate:payload:payloadIsJSON:skipHysteresis:](self, "initWithBuild:teamID:configDescription:configUUID:receivedDate:startDate:endDate:payload:payloadIsJSON:skipHysteresis:", v16, v4, v5, v6, v10, v11, v12, v7, v15);

  return v13;
}

- (DRConfig)initWithBuild:(id)a3 teamID:(id)a4 configDescription:(id)a5 configUUID:(id)a6 receivedDate:(id)a7 startDate:(id)a8 endDate:(id)a9 payload:(id)a10 payloadIsJSON:(BOOL)a11 skipHysteresis:(BOOL)a12
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v37 = a4;
  id v36 = a5;
  id v35 = a6;
  id v20 = a7;
  id v34 = a8;
  id v33 = a9;
  id v32 = a10;
  if (!v20)
  {
    id v20 = [MEMORY[0x1E4F1C9C8] date];
  }
  if (!_argIsNonNil((uint64_t)v19, (uint64_t)"build")
    || !_argIsNonNil((uint64_t)v37, (uint64_t)"teamID")
    || !_argIsNonNil((uint64_t)v36, (uint64_t)"configDescription")
    || !_argIsNonNil((uint64_t)v35, (uint64_t)"configUUID")
    || !_argIsNonNil((uint64_t)v34, (uint64_t)"startDate")
    || !_argIsNonNil((uint64_t)v33, (uint64_t)"endDate")
    || !_argIsNonNil((uint64_t)v32, (uint64_t)"payload"))
  {
    goto LABEL_14;
  }
  if ([v34 compare:v33] == -1)
  {
    v39.receiver = self;
    v39.super_class = (Class)DRConfig;
    v24 = [(DRConfig *)&v39 init];
    self = v24;
    if (v24)
    {
      objc_storeStrong((id *)&v24->_build, a3);
      objc_storeStrong((id *)&self->_teamID, a4);
      objc_storeStrong((id *)&self->_configDescription, a5);
      objc_storeStrong((id *)&self->_configUUID, a6);
      objc_storeStrong((id *)&self->_receivedDate, v20);
      objc_storeStrong((id *)&self->_startDate, a8);
      objc_storeStrong((id *)&self->_endDate, a9);
      objc_storeStrong((id *)&self->_payload, a10);
      self->_payloadIsJSON = a11;
      self->_skippedHysteresis = a12;
      if ([(DRConfig *)self payloadIsJSON])
      {
        v25 = (void *)MEMORY[0x1E4F28D90];
        v26 = [(DRConfig *)self payload];
        id v38 = 0;
        v27 = [v25 JSONObjectWithData:v26 options:0 error:&v38];
        v21 = v38;
        payloadDictionaryRepresentation = self->_payloadDictionaryRepresentation;
        self->_payloadDictionaryRepresentation = v27;

        v29 = [(DRConfig *)self payloadDictionaryRepresentation];

        if (!v29)
        {
          v30 = DPLogHandle_TaskingManagerError();
          if (os_signpost_enabled(v30))
          {
            v31 = @"Unknown";
            if (v21) {
              v31 = (__CFString *)v21;
            }
            *(_DWORD *)buf = 138543362;
            v41 = v31;
            _os_signpost_emit_with_name_impl(&dword_1DC01F000, v30, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidJSONPayload", "Payload was marked as valid JSON, but could not be processed due to error: %{public}@", buf, 0xCu);
          }

          goto LABEL_13;
        }
      }
    }
    self = self;
    v22 = self;
    goto LABEL_15;
  }
  v21 = DPLogHandle_TaskingMessageError();
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigInitError", "Start date >= end date", buf, 2u);
  }
LABEL_13:

LABEL_14:
  v22 = 0;
LABEL_15:

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && [(DRConfig *)self isEqualToConfig:v4];

  return v5;
}

- (BOOL)isEqualToConfig:(id)a3
{
  id v4 = (DRConfig *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v35 = 1;
  }
  else
  {
    if (!v4) {
      goto LABEL_12;
    }
    v6 = [(DRConfig *)self build];
    v7 = [(DRConfig *)v5 build];
    int v8 = [v6 isEqualToString:v7];

    if (!v8) {
      goto LABEL_12;
    }
    char v9 = [(DRConfig *)self teamID];
    v10 = [(DRConfig *)v5 teamID];
    int v11 = [v9 isEqualToString:v10];

    if (!v11) {
      goto LABEL_12;
    }
    id v12 = [(DRConfig *)self configDescription];
    v13 = [(DRConfig *)v5 configDescription];
    int v14 = [v12 isEqualToString:v13];

    if (!v14) {
      goto LABEL_12;
    }
    uint64_t v15 = [(DRConfig *)self configUUID];
    v16 = [(DRConfig *)v5 configUUID];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_12;
    }
    v18 = [(DRConfig *)self payload];
    id v19 = [(DRConfig *)v5 payload];
    int v20 = [v18 isEqual:v19];

    if (!v20) {
      goto LABEL_12;
    }
    BOOL v21 = [(DRConfig *)self payloadIsJSON];
    if (v21 != [(DRConfig *)v5 payloadIsJSON]) {
      goto LABEL_12;
    }
    BOOL v22 = [(DRConfig *)self skippedHysteresis];
    if (v22 != [(DRConfig *)v5 skippedHysteresis]) {
      goto LABEL_12;
    }
    v23 = [(DRConfig *)self receivedDate];
    [v23 timeIntervalSince1970];
    double v25 = v24;
    v26 = [(DRConfig *)v5 receivedDate];
    [v26 timeIntervalSince1970];
    double v28 = v27;

    if (v25 != v28) {
      goto LABEL_12;
    }
    v29 = [(DRConfig *)self startDate];
    [v29 timeIntervalSince1970];
    double v31 = v30;
    id v32 = [(DRConfig *)v5 startDate];
    [v32 timeIntervalSince1970];
    double v34 = v33;

    if (v31 == v34)
    {
      id v37 = [(DRConfig *)self endDate];
      [v37 timeIntervalSince1970];
      double v39 = v38;
      v40 = [(DRConfig *)v5 endDate];
      [v40 timeIntervalSince1970];
      BOOL v35 = v39 == v41;
    }
    else
    {
LABEL_12:
      BOOL v35 = 0;
    }
  }

  return v35;
}

- (DRConfig)initWithJSONDict:(id)a3 receivedDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = [v6 objectForKeyedSubscript:@"build"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      char v9 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "Invalid build", buf, 2u);
      }
      BOOL v22 = 0;
      goto LABEL_41;
    }
    char v9 = [v6 objectForKeyedSubscript:@"teamID"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v10 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)BOOL v35 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "Invalid teamID", v35, 2u);
      }
      BOOL v22 = 0;
      goto LABEL_40;
    }
    v10 = [v6 objectForKeyedSubscript:@"configDescription"];
    if (!v10 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      int v11 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)double v34 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "Invalid configDescription", v34, 2u);
      }
      BOOL v22 = 0;
      goto LABEL_39;
    }
    int v11 = [v6 objectForKeyedSubscript:@"configUUID"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v12 = [v6 objectForKeyedSubscript:@"base64EncodedPayload"];
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [v6 objectForKeyedSubscript:@"payloadIsJSON"];
          int v14 = (void *)MEMORY[0x1E4F1CC28];
          if (v13) {
            uint64_t v15 = (void *)v13;
          }
          else {
            uint64_t v15 = (void *)MEMORY[0x1E4F1CC28];
          }
          double v31 = v15;
          uint64_t v16 = [v6 objectForKeyedSubscript:@"skipHysteresis"];
          if (v16) {
            int v14 = (void *)v16;
          }
          uint64_t v17 = _dateFromJSONDict(v6, @"startDate");
          v29 = _dateFromJSONDict(v6, @"endDate");
          v18 = _dateFromJSONDict(v6, @"receivedDate");
          double v30 = v14;
          v26 = v18;
          double v27 = (void *)v17;
          if (v18)
          {
            id v19 = v18;

            id v7 = v19;
          }
          double v28 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v12 options:0];
          int v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v11];
          char v21 = [v31 BOOLValue];
          BYTE1(v25) = [v30 BOOLValue];
          LOBYTE(v25) = v21;
          self = -[DRConfig initWithBuild:teamID:configDescription:configUUID:receivedDate:startDate:endDate:payload:payloadIsJSON:skipHysteresis:](self, "initWithBuild:teamID:configDescription:configUUID:receivedDate:startDate:endDate:payload:payloadIsJSON:skipHysteresis:", v8, v9, v10, v20, v7, v27, v29, v28, v25);

          BOOL v22 = self;
          goto LABEL_38;
        }
      }
      v23 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v23))
      {
        *(_WORD *)id v32 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "Invalid base64PayloadString", v32, 2u);
      }
    }
    else
    {
      id v12 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)double v33 = 0;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "Invalid configUUIDString", v33, 2u);
      }
    }
    BOOL v22 = 0;
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
    goto LABEL_42;
  }
  int v8 = DPLogHandle_TaskingMessageError();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)id v37 = 0;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigJSONInitError", "nil JSON dict", v37, 2u);
  }
  BOOL v22 = 0;
LABEL_42:

  return v22;
}

- (id)jsonDictRepresentation
{
  v24[10] = *MEMORY[0x1E4F143B8];
  v23[0] = @"build";
  BOOL v22 = [(DRConfig *)self build];
  v24[0] = v22;
  v23[1] = @"teamID";
  char v21 = [(DRConfig *)self teamID];
  v24[1] = v21;
  v23[2] = @"configDescription";
  int v20 = [(DRConfig *)self configDescription];
  v24[2] = v20;
  v23[3] = @"configUUID";
  id v19 = [(DRConfig *)self configUUID];
  v18 = [v19 UUIDString];
  v24[3] = v18;
  v23[4] = @"receivedDate";
  id v3 = NSNumber;
  uint64_t v17 = [(DRConfig *)self receivedDate];
  [v17 timeIntervalSince1970];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  v24[4] = v4;
  v23[5] = @"startDate";
  BOOL v5 = NSNumber;
  id v6 = [(DRConfig *)self startDate];
  [v6 timeIntervalSince1970];
  id v7 = objc_msgSend(v5, "numberWithDouble:");
  v24[5] = v7;
  v23[6] = @"endDate";
  int v8 = NSNumber;
  char v9 = [(DRConfig *)self endDate];
  [v9 timeIntervalSince1970];
  v10 = objc_msgSend(v8, "numberWithDouble:");
  v24[6] = v10;
  v23[7] = @"base64EncodedPayload";
  int v11 = [(DRConfig *)self payload];
  id v12 = [v11 base64EncodedStringWithOptions:0];
  v24[7] = v12;
  v23[8] = @"payloadIsJSON";
  uint64_t v13 = objc_msgSend(NSNumber, "numberWithBool:", -[DRConfig payloadIsJSON](self, "payloadIsJSON"));
  v24[8] = v13;
  v23[9] = @"skipHysteresis";
  int v14 = objc_msgSend(NSNumber, "numberWithBool:", -[DRConfig skippedHysteresis](self, "skippedHysteresis"));
  v24[9] = v14;
  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:10];

  return v15;
}

- (NSString)teamID
{
  return self->_teamID;
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
}

- (NSString)configDescription
{
  return self->_configDescription;
}

- (NSUUID)configUUID
{
  return self->_configUUID;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSData)payload
{
  return self->_payload;
}

- (NSDictionary)payloadDictionaryRepresentation
{
  return self->_payloadDictionaryRepresentation;
}

- (BOOL)skippedHysteresis
{
  return self->_skippedHysteresis;
}

- (BOOL)payloadIsJSON
{
  return self->_payloadIsJSON;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDictionaryRepresentation, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_receivedDate, 0);
  objc_storeStrong((id *)&self->_configUUID, 0);
  objc_storeStrong((id *)&self->_configDescription, 0);
  objc_storeStrong((id *)&self->_build, 0);

  objc_storeStrong((id *)&self->_teamID, 0);
}

@end