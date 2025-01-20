@interface BMUserFocusSleepMode
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMUserFocusSleepMode)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMUserFocusSleepMode)initWithState:(int)a3 changeReason:(int)a4 expectedEndDate:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)expectedEndDate;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)changeReason;
- (int)state;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMUserFocusSleepMode

- (int)changeReason
{
  return self->_changeReason;
}

- (int)state
{
  return self->_state;
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
    int v6 = [(BMUserFocusSleepMode *)self state];
    if (v6 == [v5 state]
      && (int v7 = [(BMUserFocusSleepMode *)self changeReason],
          v7 == [v5 changeReason]))
    {
      v8 = [(BMUserFocusSleepMode *)self expectedEndDate];
      v9 = [v5 expectedEndDate];
      if (v8 == v9)
      {
        char v12 = 1;
      }
      else
      {
        v10 = [(BMUserFocusSleepMode *)self expectedEndDate];
        v11 = [v5 expectedEndDate];
        char v12 = [v10 isEqual:v11];
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (NSDate)expectedEndDate
{
  if (self->_hasRaw_expectedEndDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_expectedEndDate];
    id v4 = [v2 convertValue:v3 toType:1];
  }
  else
  {
    id v4 = 0;
  }

  return (NSDate *)v4;
}

- (id)jsonDictionary
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMUserFocusSleepMode state](self, "state"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMUserFocusSleepMode changeReason](self, "changeReason"));
  id v5 = [(BMUserFocusSleepMode *)self expectedEndDate];
  if (v5)
  {
    int v6 = NSNumber;
    int v7 = [(BMUserFocusSleepMode *)self expectedEndDate];
    [v7 timeIntervalSinceReferenceDate];
    v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    v8 = 0;
  }

  v14[0] = @"state";
  v9 = v3;
  if (!v3)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v9;
  v14[1] = @"changeReason";
  v10 = v4;
  if (!v4)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v10;
  v14[2] = @"expectedEndDate";
  v11 = v8;
  if (!v8)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  if (v8)
  {
    if (v4) {
      goto LABEL_12;
    }
LABEL_17:

    if (v3) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v4) {
    goto LABEL_17;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_18:

LABEL_13:

  return v12;
}

- (BMUserFocusSleepMode)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"state"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    v10 = [v6 objectForKeyedSubscript:@"changeReason"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v11 = 0;
            v22 = 0;
            goto LABEL_27;
          }
          id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v26 = *MEMORY[0x1E4F502C8];
          uint64_t v35 = *MEMORY[0x1E4F28568];
          v14 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"changeReason"];
          v36 = v14;
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
          id v27 = (id)[v31 initWithDomain:v26 code:2 userInfo:v13];
          v11 = 0;
          v22 = 0;
          *a4 = v27;
          goto LABEL_26;
        }
        id v12 = [NSNumber numberWithInt:BMUserFocusSleepModeChangeReasonFromString(v10)];
      }
      v11 = v12;
    }
    else
    {
      v11 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"expectedEndDate"];
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v15 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v16 = v13;
        id v17 = [v15 alloc];
        [v16 doubleValue];
        double v19 = v18;

        id v20 = (id)[v17 initWithTimeIntervalSinceReferenceDate:v19];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v14 = [v21 dateFromString:v13];

          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v30 = *MEMORY[0x1E4F502C8];
            uint64_t v33 = *MEMORY[0x1E4F28568];
            v28 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"expectedEndDate"];
            v34 = v28;
            v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
            *a4 = (id)[v32 initWithDomain:v30 code:2 userInfo:v29];
          }
          v14 = 0;
          v22 = 0;
          goto LABEL_26;
        }
        id v20 = v13;
      }
      v14 = v20;
    }
    else
    {
      v14 = 0;
    }
LABEL_25:
    self = -[BMUserFocusSleepMode initWithState:changeReason:expectedEndDate:](self, "initWithState:changeReason:expectedEndDate:", [v8 intValue], objc_msgSend(v11, "intValue"), v14);
    v22 = self;
LABEL_26:

    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
LABEL_8:
    v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSNumber numberWithInt:BMUserFocusSleepModeStateFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    v8 = 0;
    v22 = 0;
    goto LABEL_28;
  }
  id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v25 = *MEMORY[0x1E4F502C8];
  uint64_t v37 = *MEMORY[0x1E4F28568];
  v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"state"];
  v38[0] = v11;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:&v37 count:1];
  v8 = 0;
  v22 = 0;
  *a4 = (id)[v24 initWithDomain:v25 code:2 userInfo:v10];
LABEL_27:

LABEL_28:
  return v22;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMUserFocusSleepMode *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_expectedEndDate) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)BMUserFocusSleepMode;
  id v5 = [(BMEventBase *)&v40 init];
  if (!v5) {
    goto LABEL_59;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
        uint64_t v14 = *(void *)&v4[v13];
        unint64_t v15 = v14 + 1;
        if (v14 == -1 || v15 > *(void *)&v4[*v7]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v9] + v14);
        *(void *)&v4[v13] = v15;
        v12 |= (unint64_t)(v16 & 0x7F) << v10;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v10 += 7;
        BOOL v17 = v11++ >= 9;
        if (v17)
        {
          unint64_t v12 = 0;
          int v18 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v18 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v12 = 0;
      }
LABEL_15:
      if (v18 || (v12 & 7) == 4) {
        break;
      }
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 1)
      {
        char v28 = 0;
        unsigned int v29 = 0;
        uint64_t v23 = 0;
        while (1)
        {
          uint64_t v30 = *v6;
          uint64_t v31 = *(void *)&v4[v30];
          unint64_t v32 = v31 + 1;
          if (v31 == -1 || v32 > *(void *)&v4[*v7]) {
            break;
          }
          char v33 = *(unsigned char *)(*(void *)&v4[*v9] + v31);
          *(void *)&v4[v30] = v32;
          v23 |= (unint64_t)(v33 & 0x7F) << v28;
          if ((v33 & 0x80) == 0) {
            goto LABEL_48;
          }
          v28 += 7;
          BOOL v17 = v29++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_50;
          }
        }
        v4[*v8] = 1;
LABEL_48:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_50:
        if (v23 >= 4) {
          LODWORD(v23) = 0;
        }
        uint64_t v37 = 36;
      }
      else
      {
        if (v20 == 3)
        {
          v5->_hasRaw_expectedEndDate = 1;
          uint64_t v34 = *v6;
          unint64_t v35 = *(void *)&v4[v34];
          if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(void *)&v4[*v7])
          {
            double v36 = *(double *)(*(void *)&v4[*v9] + v35);
            *(void *)&v4[v34] = v35 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v36 = 0.0;
          }
          v5->_raw_expectedEndDate = v36;
          continue;
        }
        if (v20 != 2)
        {
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_58;
          }
          continue;
        }
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v23 = 0;
        while (1)
        {
          uint64_t v24 = *v6;
          uint64_t v25 = *(void *)&v4[v24];
          unint64_t v26 = v25 + 1;
          if (v25 == -1 || v26 > *(void *)&v4[*v7]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v26;
          v23 |= (unint64_t)(v27 & 0x7F) << v21;
          if ((v27 & 0x80) == 0) {
            goto LABEL_42;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_44;
          }
        }
        v4[*v8] = 1;
LABEL_42:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_44:
        if (v23 >= 0xA) {
          LODWORD(v23) = 0;
        }
        uint64_t v37 = 40;
      }
      *(_DWORD *)((char *)&v5->super.super.isa + v37) = v23;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_58:
  }
    v38 = 0;
  else {
LABEL_59:
  }
    v38 = v5;

  return v38;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMUserFocusSleepModeStateAsString([(BMUserFocusSleepMode *)self state]);
  id v5 = BMUserFocusSleepModeChangeReasonAsString([(BMUserFocusSleepMode *)self changeReason]);
  id v6 = [(BMUserFocusSleepMode *)self expectedEndDate];
  int v7 = (void *)[v3 initWithFormat:@"BMUserFocusSleepMode with state: %@, changeReason: %@, expectedEndDate: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMUserFocusSleepMode)initWithState:(int)a3 changeReason:(int)a4 expectedEndDate:(id)a5
{
  id v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)BMUserFocusSleepMode;
  id v9 = [(BMEventBase *)&v12 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v9->_state = a3;
    v9->_changeReason = a4;
    if (v8)
    {
      v9->_hasRaw_expectedEndDate = 1;
      [v8 timeIntervalSinceReferenceDate];
    }
    else
    {
      v9->_hasRaw_expectedEndDate = 0;
      double v10 = -1.0;
    }
    v9->_raw_expectedEndDate = v10;
  }

  return v9;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"state" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"changeReason", 2, 4, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"expectedEndDate" number:3 type:0 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3E88;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"state" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"changeReason" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"expectedEndDate" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:1];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5 = a3;
  if (a4 == 2)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    int v7 = BMUserFocusSleepMode_v2;
  }
  else
  {
    if (a4 != 3)
    {
      id v9 = 0;
      goto LABEL_9;
    }
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F94090]) initWithData:v5];
    int v7 = BMUserFocusSleepMode;
  }
  uint64_t v8 = [[v7 alloc] initByReadFrom:v6];
  id v9 = (void *)v8;
  if (v8) {
    *(_DWORD *)(v8 + 32) = a4;
  }

LABEL_9:

  return v9;
}

+ (unsigned)latestDataVersion
{
  return 3;
}

@end