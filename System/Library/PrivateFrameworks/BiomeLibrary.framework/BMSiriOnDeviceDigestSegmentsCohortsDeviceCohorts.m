@interface BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts)initWithTimeInterval:(id)a3 cohortType:(id)a4 cohortDataAvailabilityState:(id)a5;
- (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval)timeInterval;
- (BOOL)hasCohortDataAvailabilityState;
- (BOOL)hasCohortType;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)cohortDataAvailabilityState;
- (int)cohortType;
- (unsigned)dataVersion;
- (void)setHasCohortDataAvailabilityState:(BOOL)a3;
- (void)setHasCohortType:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts

- (void).cxx_destruct
{
}

- (void)setHasCohortDataAvailabilityState:(BOOL)a3
{
  self->_hasCohortDataAvailabilityState = a3;
}

- (BOOL)hasCohortDataAvailabilityState
{
  return self->_hasCohortDataAvailabilityState;
}

- (int)cohortDataAvailabilityState
{
  return self->_cohortDataAvailabilityState;
}

- (void)setHasCohortType:(BOOL)a3
{
  self->_hasCohortType = a3;
}

- (BOOL)hasCohortType
{
  return self->_hasCohortType;
}

- (int)cohortType
{
  return self->_cohortType;
}

- (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval)timeInterval
{
  return self->_timeInterval;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self timeInterval];
    uint64_t v7 = [v5 timeInterval];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self timeInterval];
      v10 = [v5 timeInterval];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    if (![(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self hasCohortType]
      && ![v5 hasCohortType]
      || [(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self hasCohortType]
      && [v5 hasCohortType]
      && (int v13 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self cohortType],
          v13 == [v5 cohortType]))
    {
      if (!-[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts hasCohortDataAvailabilityState](self, "hasCohortDataAvailabilityState")&& ![v5 hasCohortDataAvailabilityState])
      {
        BOOL v12 = 1;
        goto LABEL_18;
      }
      if (-[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts hasCohortDataAvailabilityState](self, "hasCohortDataAvailabilityState")&& [v5 hasCohortDataAvailabilityState])
      {
        int v14 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self cohortDataAvailabilityState];
        BOOL v12 = v14 == [v5 cohortDataAvailabilityState];
LABEL_18:

        goto LABEL_19;
      }
    }
LABEL_17:
    BOOL v12 = 0;
    goto LABEL_18;
  }
  BOOL v12 = 0;
LABEL_19:

  return v12;
}

- (id)jsonDictionary
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self timeInterval];
  id v4 = [v3 jsonDictionary];

  if ([(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self hasCohortType])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts cohortType](self, "cohortType"));
  }
  else
  {
    id v5 = 0;
  }
  if ([(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self hasCohortDataAvailabilityState])
  {
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts cohortDataAvailabilityState](self, "cohortDataAvailabilityState"));
  }
  else
  {
    v6 = 0;
  }
  v12[0] = @"timeInterval";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[0] = v7;
  v12[1] = @"cohortType";
  v8 = v5;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[1] = v8;
  v12[2] = @"cohortDataAvailabilityState";
  v9 = v6;
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v13[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  if (v6)
  {
    if (v5) {
      goto LABEL_15;
    }
LABEL_20:

    if (v4) {
      goto LABEL_16;
    }
    goto LABEL_21;
  }

  if (!v5) {
    goto LABEL_20;
  }
LABEL_15:
  if (v4) {
    goto LABEL_16;
  }
LABEL_21:

LABEL_16:

  return v10;
}

- (BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"timeInterval"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v26 = 0;
    v8 = [[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval alloc] initWithJSONDictionary:v10 error:&v26];
    id v15 = v26;
    if (v15)
    {
      v16 = v15;
      if (a4) {
        *a4 = v15;
      }

      int v13 = 0;
      goto LABEL_13;
    }

LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"cohortType"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          int v13 = 0;
          id v10 = 0;
          goto LABEL_12;
        }
        id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v19 = *MEMORY[0x1E4F502C8];
        uint64_t v29 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cohortType"];
        id v30 = v12;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        id v20 = (id)[v24 initWithDomain:v19 code:2 userInfo:v11];
        int v13 = 0;
        id v10 = 0;
        *a4 = v20;
        goto LABEL_11;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"cohortDataAvailabilityState"];
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v23 = *MEMORY[0x1E4F502C8];
          uint64_t v27 = *MEMORY[0x1E4F28568];
          v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"cohortDataAvailabilityState"];
          v28 = v21;
          v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
          *a4 = (id)[v25 initWithDomain:v23 code:2 userInfo:v22];
        }
        id v12 = 0;
        int v13 = 0;
        goto LABEL_11;
      }
      id v12 = v11;
    }
    else
    {
      id v12 = 0;
    }
    self = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self initWithTimeInterval:v8 cohortType:v10 cohortDataAvailabilityState:v12];
    int v13 = self;
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  if (!a4)
  {
    int v13 = 0;
    goto LABEL_14;
  }
  id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v18 = *MEMORY[0x1E4F502C8];
  uint64_t v31 = *MEMORY[0x1E4F28568];
  v8 = (BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"timeInterval"];
  v32[0] = v8;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
  int v13 = 0;
  *a4 = (id)[v17 initWithDomain:v18 code:2 userInfo:v10];
LABEL_13:

LABEL_14:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_timeInterval)
  {
    PBDataWriterPlaceMark();
    [(BMSiriOnDeviceDigestSegmentsCohortsTimeInterval *)self->_timeInterval writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasCohortType) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_hasCohortDataAvailabilityState) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_53;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v8]) {
        goto LABEL_51;
      }
      char v10 = 0;
      unsigned int v11 = 0;
      unint64_t v12 = 0;
      while (1)
      {
        uint64_t v13 = *v6;
        unint64_t v14 = *(void *)&v4[v13];
        if (v14 == -1 || v14 >= *(void *)&v4[*v7]) {
          break;
        }
        char v15 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v14 + 1;
        v12 |= (unint64_t)(v15 & 0x7F) << v10;
        if ((v15 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v16 = v11++ >= 9;
        if (v16)
        {
          unint64_t v12 = 0;
          int v17 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v17 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v17 || (v12 & 7) == 4) {
        goto LABEL_51;
      }
      unint64_t v19 = v12 >> 3;
      if ((v12 >> 3) == 3) {
        break;
      }
      if (v19 == 2)
      {
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v24 = 0;
        v5->_hasCohortType = 1;
        while (1)
        {
          uint64_t v30 = *v6;
          unint64_t v31 = *(void *)&v4[v30];
          if (v31 == -1 || v31 >= *(void *)&v4[*v7]) {
            break;
          }
          char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
          *(void *)&v4[v30] = v31 + 1;
          v24 |= (unint64_t)(v32 & 0x7F) << v28;
          if ((v32 & 0x80) == 0) {
            goto LABEL_46;
          }
          v28 += 7;
          BOOL v16 = v29++ >= 9;
          if (v16)
          {
            LODWORD(v24) = 0;
            goto LABEL_48;
          }
        }
        v4[*v8] = 1;
LABEL_46:
        if (v4[*v8]) {
          LODWORD(v24) = 0;
        }
LABEL_48:
        uint64_t v33 = 24;
LABEL_49:
        *(_DWORD *)((char *)&v5->super.super.isa + v33) = v24;
        goto LABEL_50;
      }
      if (v19 == 1)
      {
        uint64_t v37 = 0;
        uint64_t v38 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_52;
        }
        id v20 = [[BMSiriOnDeviceDigestSegmentsCohortsTimeInterval alloc] initByReadFrom:v4];
        if (!v20) {
          goto LABEL_52;
        }
        timeInterval = v5->_timeInterval;
        v5->_timeInterval = v20;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_52;
      }
LABEL_50:
      if (*(void *)&v4[*v6] >= *(void *)&v4[*v7]) {
        goto LABEL_51;
      }
    }
    char v22 = 0;
    unsigned int v23 = 0;
    uint64_t v24 = 0;
    v5->_hasCohortDataAvailabilityState = 1;
    while (1)
    {
      uint64_t v25 = *v6;
      unint64_t v26 = *(void *)&v4[v25];
      if (v26 == -1 || v26 >= *(void *)&v4[*v7]) {
        break;
      }
      char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
      *(void *)&v4[v25] = v26 + 1;
      v24 |= (unint64_t)(v27 & 0x7F) << v22;
      if ((v27 & 0x80) == 0) {
        goto LABEL_42;
      }
      v22 += 7;
      BOOL v16 = v23++ >= 9;
      if (v16)
      {
        LODWORD(v24) = 0;
        goto LABEL_44;
      }
    }
    v4[*v8] = 1;
LABEL_42:
    if (v4[*v8]) {
      LODWORD(v24) = 0;
    }
LABEL_44:
    uint64_t v33 = 28;
    goto LABEL_49;
  }
LABEL_51:
  if (v4[*v8]) {
LABEL_52:
  }
    v34 = 0;
  else {
LABEL_53:
  }
    v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts *)self timeInterval];
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts cohortType](self, "cohortType"));
  id v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts cohortDataAvailabilityState](self, "cohortDataAvailabilityState"));
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts with timeInterval: %@, cohortType: %@, cohortDataAvailabilityState: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts)initWithTimeInterval:(id)a3 cohortType:(id)a4 cohortDataAvailabilityState:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts;
  unint64_t v12 = [(BMEventBase *)&v16 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_timeInterval, a3);
    if (v10)
    {
      v12->_hasCohortType = 1;
      int v13 = [v10 intValue];
    }
    else
    {
      v12->_hasCohortType = 0;
      int v13 = -1;
    }
    v12->_cohortType = v13;
    if (v11)
    {
      v12->_hasCohortDataAvailabilityState = 1;
      int v14 = [v11 intValue];
    }
    else
    {
      v12->_hasCohortDataAvailabilityState = 0;
      int v14 = -1;
    }
    v12->_cohortDataAvailabilityState = v14;
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timeInterval" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"cohortType", 2, 2, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cohortDataAvailabilityState" number:3 type:2 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4C38;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"timeInterval_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_283_36201];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cohortType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:2 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cohortDataAvailabilityState" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:2 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __59__BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 timeInterval];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMSiriOnDeviceDigestSegmentsCohortsDeviceCohorts alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end