@interface BMMonotonicTimestamp
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)nowFromContinuousClock;
+ (id)nowFromSuspendingClock;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMonotonicTimestamp)initWithBootSessionUUID:(id)a3 machAbsoluteTime:(id)a4 machContinuousTime:(id)a5;
- (BMMonotonicTimestamp)initWithBootSessionUUID:(id)a3 suspendingNanosecondsSinceBoot:(id)a4 continuousNanosecondsSinceBoot:(id)a5;
- (BMMonotonicTimestamp)initWithBootSessionUUID:(id)a3 value:(id)a4;
- (BMMonotonicTimestamp)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMonotonicTimestampValue)value;
- (BOOL)hasContinuousNanosecondsSinceBoot;
- (BOOL)hasSuspendingNanosecondsSinceBoot;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSUUID)bootSessionUUID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unint64_t)continuousNanosecondsSinceBoot;
- (unint64_t)suspendingNanosecondsSinceBoot;
- (unsigned)dataVersion;
- (void)setHasContinuousNanosecondsSinceBoot:(BOOL)a3;
- (void)setHasSuspendingNanosecondsSinceBoot:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMMonotonicTimestamp

- (BMMonotonicTimestamp)initWithBootSessionUUID:(id)a3 machAbsoluteTime:(id)a4 machContinuousTime:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9)
  {
    v12 = NSNumber;
    unint64_t v13 = [v9 unsignedLongLongValue];
    if (_CpuTickRate_onceToken != -1) {
      dispatch_once(&_CpuTickRate_onceToken, &__block_literal_global_12358);
    }
    v14 = [v12 numberWithUnsignedLongLong:(unint64_t)(*(double *)&_CpuTickRate_rate * (double)v13)];
    if (v11) {
      goto LABEL_5;
    }
LABEL_9:
    v17 = 0;
    goto LABEL_10;
  }
  v14 = 0;
  if (!v10) {
    goto LABEL_9;
  }
LABEL_5:
  v15 = NSNumber;
  unint64_t v16 = [v11 unsignedLongLongValue];
  if (_CpuTickRate_onceToken != -1) {
    dispatch_once(&_CpuTickRate_onceToken, &__block_literal_global_12358);
  }
  v17 = [v15 numberWithUnsignedLongLong:(unint64_t)(*(double *)&_CpuTickRate_rate * (double)v16)];
LABEL_10:
  v18 = [[BMMonotonicTimestampValue alloc] initWithSuspendingNanosecondsSinceBoot:v14 continuousNanosecondsSinceBoot:v17];
  v19 = [(BMMonotonicTimestamp *)self initWithBootSessionUUID:v8 value:v18];

  return v19;
}

+ (id)nowFromContinuousClock
{
  v2 = [BMMonotonicTimestamp alloc];
  v3 = _CurrentBootSessionUUID();
  v4 = [NSNumber numberWithUnsignedLongLong:mach_continuous_time()];
  v5 = [(BMMonotonicTimestamp *)v2 initWithBootSessionUUID:v3 machAbsoluteTime:0 machContinuousTime:v4];

  return v5;
}

+ (id)nowFromSuspendingClock
{
  v2 = [BMMonotonicTimestamp alloc];
  v3 = _CurrentBootSessionUUID();
  v4 = [NSNumber numberWithUnsignedLongLong:mach_absolute_time()];
  v5 = [(BMMonotonicTimestamp *)v2 initWithBootSessionUUID:v3 machAbsoluteTime:v4 machContinuousTime:0];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);

  objc_storeStrong((id *)&self->_raw_bootSessionUUID, 0);
}

- (BMMonotonicTimestampValue)value
{
  return self->_value;
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
    v6 = [(BMMonotonicTimestamp *)self bootSessionUUID];
    uint64_t v7 = [v5 bootSessionUUID];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      id v8 = (void *)v7;
      id v9 = [(BMMonotonicTimestamp *)self bootSessionUUID];
      id v10 = [v5 bootSessionUUID];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    unint64_t v13 = [(BMMonotonicTimestamp *)self value];
    v14 = [v5 value];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMMonotonicTimestamp *)self value];
      unint64_t v16 = [v5 value];
      char v12 = [v15 isEqual:v16];
    }
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (NSUUID)bootSessionUUID
{
  raw_bootSessionUUID = self->_raw_bootSessionUUID;
  if (raw_bootSessionUUID)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_bootSessionUUID toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (id)jsonDictionary
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMonotonicTimestamp *)self bootSessionUUID];
  id v4 = [v3 UUIDString];

  id v5 = [(BMMonotonicTimestamp *)self value];
  v6 = [v5 jsonDictionary];

  v11[0] = @"bootSessionUUID";
  uint64_t v7 = v4;
  if (!v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = @"value";
  v12[0] = v7;
  id v8 = v6;
  if (!v6)
  {
    id v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (v6)
  {
    if (v4) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v4) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v9;
}

- (BMMonotonicTimestamp)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"bootSessionUUID"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        int v11 = 0;
        goto LABEL_24;
      }
      id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v18 = *MEMORY[0x1E4F502C8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      id v8 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"bootSessionUUID"];
      id v31 = v8;
      id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      id v19 = (id)[v17 initWithDomain:v18 code:2 userInfo:v9];
      int v11 = 0;
      *a4 = v19;
      goto LABEL_22;
    }
    id v8 = v7;
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v8];
    if (!v12)
    {
      if (!a4)
      {
        int v11 = 0;
        goto LABEL_23;
      }
      id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v24 = *MEMORY[0x1E4F502C8];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      id v9 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"bootSessionUUID"];
      v33[0] = v9;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      *a4 = (id)[v23 initWithDomain:v24 code:2 userInfo:v25];

      goto LABEL_27;
    }
    unint64_t v13 = (void *)v12;

    id v8 = v13;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 objectForKeyedSubscript:@"value"];
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v9;
        id v27 = 0;
        id v10 = [[BMMonotonicTimestampValue alloc] initWithJSONDictionary:v14 error:&v27];
        id v15 = v27;
        if (!v15)
        {

          goto LABEL_7;
        }
        unint64_t v16 = v15;
        if (a4) {
          *a4 = v15;
        }

LABEL_20:
        int v11 = 0;
        goto LABEL_21;
      }
      if (a4)
      {
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v20 = *MEMORY[0x1E4F502C8];
        uint64_t v28 = *MEMORY[0x1E4F28568];
        id v10 = (BMMonotonicTimestampValue *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"value"];
        v29 = v10;
        v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
        *a4 = (id)[v26 initWithDomain:v20 code:2 userInfo:v21];

        goto LABEL_20;
      }
LABEL_27:
      int v11 = 0;
      goto LABEL_22;
    }
  }
  id v10 = 0;
LABEL_7:
  self = [(BMMonotonicTimestamp *)self initWithBootSessionUUID:v8 value:v10];
  int v11 = self;
LABEL_21:

LABEL_22:
LABEL_23:

LABEL_24:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMonotonicTimestamp *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_raw_bootSessionUUID) {
    PBDataWriterWriteDataField();
  }
  if (self->_value)
  {
    PBDataWriterPlaceMark();
    [(BMMonotonicTimestampValue *)self->_value writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMMonotonicTimestamp;
  id v5 = [(BMEventBase *)&v25 init];
  if (!v5) {
    goto LABEL_30;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    id v9 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (v4[*v8]) {
        break;
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
        if (v11++ >= 9)
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
        break;
      }
      if ((v12 >> 3) == 2)
      {
        uint64_t v26 = 0;
        uint64_t v27 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_29;
        }
        v21 = [[BMMonotonicTimestampValue alloc] initByReadFrom:v4];
        if (!v21) {
          goto LABEL_29;
        }
        value = v5->_value;
        v5->_value = v21;

        PBReaderRecallMark();
      }
      else if ((v12 >> 3) == 1)
      {
        PBReaderReadData();
        id v19 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ([(NSData *)v19 length] != 16)
        {

          goto LABEL_29;
        }
        raw_bootSessionUUID = v5->_raw_bootSessionUUID;
        v5->_raw_bootSessionUUID = v19;
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        goto LABEL_29;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_29:
  }
    id v23 = 0;
  else {
LABEL_30:
  }
    id v23 = v5;

  return v23;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMonotonicTimestamp *)self bootSessionUUID];
  id v5 = [(BMMonotonicTimestamp *)self value];
  id v6 = (void *)[v3 initWithFormat:@"BMMonotonicTimestamp with bootSessionUUID: %@, value: %@", v4, v5];

  return (NSString *)v6;
}

- (BMMonotonicTimestamp)initWithBootSessionUUID:(id)a3 value:(id)a4
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMMonotonicTimestamp;
  id v8 = [(BMEventBase *)&v12 init];
  if (v8)
  {
    v8->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v6)
    {
      v13[0] = 0;
      v13[1] = 0;
      [v6 getUUIDBytes:v13];
      uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v13 length:16];
      raw_bootSessionUUID = v8->_raw_bootSessionUUID;
      v8->_raw_bootSessionUUID = (NSData *)v9;
    }
    else
    {
      raw_bootSessionUUID = v8->_raw_bootSessionUUID;
      v8->_raw_bootSessionUUID = 0;
    }

    objc_storeStrong((id *)&v8->_value, a4);
  }

  return v8;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bootSessionUUID" number:1 type:14 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"value" number:2 type:14 subMessageClass:objc_opt_class()];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3CD8;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"bootSessionUUID" dataType:6 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:3];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"value_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_12537];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __31__BMMonotonicTimestamp_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 value];
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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMMonotonicTimestamp alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (void)setHasContinuousNanosecondsSinceBoot:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BMMonotonicTimestamp *)self value];
  [v4 setHasContinuousNanosecondsSinceBoot:v3];
}

- (BOOL)hasContinuousNanosecondsSinceBoot
{
  v2 = [(BMMonotonicTimestamp *)self value];
  char v3 = [v2 hasContinuousNanosecondsSinceBoot];

  return v3;
}

- (unint64_t)continuousNanosecondsSinceBoot
{
  v2 = [(BMMonotonicTimestamp *)self value];
  unint64_t v3 = [v2 continuousNanosecondsSinceBoot];

  return v3;
}

- (void)setHasSuspendingNanosecondsSinceBoot:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BMMonotonicTimestamp *)self value];
  [v4 setHasSuspendingNanosecondsSinceBoot:v3];
}

- (BOOL)hasSuspendingNanosecondsSinceBoot
{
  v2 = [(BMMonotonicTimestamp *)self value];
  char v3 = [v2 hasSuspendingNanosecondsSinceBoot];

  return v3;
}

- (unint64_t)suspendingNanosecondsSinceBoot
{
  v2 = [(BMMonotonicTimestamp *)self value];
  unint64_t v3 = [v2 suspendingNanosecondsSinceBoot];

  return v3;
}

- (BMMonotonicTimestamp)initWithBootSessionUUID:(id)a3 suspendingNanosecondsSinceBoot:(id)a4 continuousNanosecondsSinceBoot:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  unsigned int v11 = [[BMMonotonicTimestampValue alloc] initWithSuspendingNanosecondsSinceBoot:v9 continuousNanosecondsSinceBoot:v8];

  objc_super v12 = [(BMMonotonicTimestamp *)self initWithBootSessionUUID:v10 value:v11];
  return v12;
}

@end