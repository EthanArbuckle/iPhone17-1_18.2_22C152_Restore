@interface BMSleepScheduleState
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSleepScheduleState)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSleepScheduleState)initWithState:(int)a3 changeReason:(int)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)changeReason;
- (int)state;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSleepScheduleState

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
    int v6 = [(BMSleepScheduleState *)self state];
    if (v6 == [v5 state])
    {
      int v7 = [(BMSleepScheduleState *)self changeReason];
      BOOL v8 = v7 == [v5 changeReason];
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSleepScheduleState state](self, "state"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSleepScheduleState changeReason](self, "changeReason"));
  v9[0] = @"state";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"changeReason";
  v10[0] = v5;
  int v6 = v4;
  if (!v4)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v4)
  {
    if (v3) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (BMSleepScheduleState)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"state"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v7;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          BOOL v8 = 0;
          v13 = 0;
          goto LABEL_19;
        }
        id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v16 = *MEMORY[0x1E4F502C8];
        uint64_t v24 = *MEMORY[0x1E4F28568];
        v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"state"];
        v25[0] = v11;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
        id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v10];
        BOOL v8 = 0;
        v13 = 0;
        *a4 = v17;
        goto LABEL_18;
      }
      id v9 = [NSNumber numberWithInt:BMSleepScheduleStateStateFromString(v7)];
    }
    BOOL v8 = v9;
  }
  else
  {
    BOOL v8 = 0;
  }
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
        if (a4)
        {
          id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v19 = *MEMORY[0x1E4F502C8];
          uint64_t v22 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"changeReason"];
          v23 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
          *a4 = (id)[v18 initWithDomain:v19 code:2 userInfo:v21];
        }
        v11 = 0;
        v13 = 0;
        goto LABEL_18;
      }
      id v12 = [NSNumber numberWithInt:BMSleepScheduleStateChangeReasonFromString(v10)];
    }
    v11 = v12;
  }
  else
  {
    v11 = 0;
  }
  self = -[BMSleepScheduleState initWithState:changeReason:](self, "initWithState:changeReason:", [v8 intValue], objc_msgSend(v11, "intValue"));
  v13 = self;
LABEL_18:

LABEL_19:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSleepScheduleState *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMSleepScheduleState;
  id v5 = [(BMEventBase *)&v33 init];
  if (!v5) {
    goto LABEL_53;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  BOOL v8 = (int *)MEMORY[0x1E4F940C8];
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
        break;
      }
      if ((v12 >> 3) == 1)
      {
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v21 = 0;
        while (1)
        {
          uint64_t v27 = *v6;
          unint64_t v28 = *(void *)&v4[v27];
          if (v28 == -1 || v28 >= *(void *)&v4[*v7]) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v28);
          *(void *)&v4[v27] = v28 + 1;
          v21 |= (unint64_t)(v29 & 0x7F) << v25;
          if ((v29 & 0x80) == 0) {
            goto LABEL_44;
          }
          v25 += 7;
          BOOL v16 = v26++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_46;
          }
        }
        v4[*v8] = 1;
LABEL_44:
        if (v4[*v8]) {
          LODWORD(v21) = 0;
        }
LABEL_46:
        if (v21 >= 6) {
          LODWORD(v21) = 0;
        }
        v30 = &OBJC_IVAR___BMSleepScheduleState__state;
      }
      else
      {
        if ((v12 >> 3) != 2)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_52;
          }
          continue;
        }
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        while (1)
        {
          uint64_t v22 = *v6;
          unint64_t v23 = *(void *)&v4[v22];
          if (v23 == -1 || v23 >= *(void *)&v4[*v7]) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)&v4[*v9] + v23);
          *(void *)&v4[v22] = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_38;
          }
          v19 += 7;
          BOOL v16 = v20++ >= 9;
          if (v16)
          {
            LODWORD(v21) = 0;
            goto LABEL_40;
          }
        }
        v4[*v8] = 1;
LABEL_38:
        if (v4[*v8]) {
          LODWORD(v21) = 0;
        }
LABEL_40:
        if (v21 >= 7) {
          LODWORD(v21) = 0;
        }
        v30 = &OBJC_IVAR___BMSleepScheduleState__changeReason;
      }
      *(_DWORD *)((char *)&v5->super.super.isa + *v30) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_52:
  }
    v31 = 0;
  else {
LABEL_53:
  }
    v31 = v5;

  return v31;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMSleepScheduleStateStateAsString([(BMSleepScheduleState *)self state]);
  id v5 = BMSleepScheduleStateChangeReasonAsString([(BMSleepScheduleState *)self changeReason]);
  id v6 = (void *)[v3 initWithFormat:@"BMSleepScheduleState with state: %@, changeReason: %@", v4, v5];

  return (NSString *)v6;
}

- (BMSleepScheduleState)initWithState:(int)a3 changeReason:(int)a4
{
  v8.receiver = self;
  v8.super_class = (Class)BMSleepScheduleState;
  id v6 = [(BMEventBase *)&v8 init];
  if (v6)
  {
    v6->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v6->_state = a3;
    v6->_changeReason = a4;
  }
  return v6;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"state" number:1 type:4 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"changeReason" number:2 type:4 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3E70;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"state" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"changeReason" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    objc_super v8 = [[BMSleepScheduleState alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[4] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end