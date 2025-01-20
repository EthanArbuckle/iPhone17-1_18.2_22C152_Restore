@interface BMOasisAnalyticsQualityTrace
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsQualityTrace)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMOasisAnalyticsQualityTrace)initWithWriterId:(int)a3 eventCounter:(id)a4;
- (BOOL)hasEventCounter;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)writerId;
- (unsigned)dataVersion;
- (unsigned)eventCounter;
- (void)setHasEventCounter:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsQualityTrace

- (void)setHasEventCounter:(BOOL)a3
{
  self->_hasEventCounter = a3;
}

- (BOOL)hasEventCounter
{
  return self->_hasEventCounter;
}

- (unsigned)eventCounter
{
  return self->_eventCounter;
}

- (int)writerId
{
  return self->_writerId;
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
    int v6 = [(BMOasisAnalyticsQualityTrace *)self writerId];
    if (v6 != [v5 writerId]) {
      goto LABEL_9;
    }
    if (![(BMOasisAnalyticsQualityTrace *)self hasEventCounter]
      && ![v5 hasEventCounter])
    {
      BOOL v8 = 1;
      goto LABEL_10;
    }
    if ([(BMOasisAnalyticsQualityTrace *)self hasEventCounter]
      && [v5 hasEventCounter])
    {
      unsigned int v7 = [(BMOasisAnalyticsQualityTrace *)self eventCounter];
      BOOL v8 = v7 == [v5 eventCounter];
    }
    else
    {
LABEL_9:
      BOOL v8 = 0;
    }
LABEL_10:

    goto LABEL_11;
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMOasisAnalyticsQualityTrace writerId](self, "writerId"));
  if ([(BMOasisAnalyticsQualityTrace *)self hasEventCounter])
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsQualityTrace eventCounter](self, "eventCounter"));
  }
  else
  {
    id v4 = 0;
  }
  v9[0] = @"writerId";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"eventCounter";
  v10[0] = v5;
  int v6 = v4;
  if (!v4)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  unsigned int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v4)
  {
    if (v3) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_10;
    }
  }

LABEL_10:

  return v7;
}

- (BMOasisAnalyticsQualityTrace)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int v7 = [v6 objectForKeyedSubscript:@"writerId"];
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
          v12 = 0;
          goto LABEL_14;
        }
        id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v19 = *MEMORY[0x1E4F502C8];
        uint64_t v23 = *MEMORY[0x1E4F28568];
        id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"writerId"];
        v24[0] = v11;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
        id v20 = (id)[v18 initWithDomain:v19 code:2 userInfo:v10];
        BOOL v8 = 0;
        v12 = 0;
        *a4 = v20;
        goto LABEL_13;
      }
      objc_msgSend(NSNumber, "numberWithInt:", bsearch_b(v7, BMOasisAnalyticsProcessIdFromString_sortedStrings, 1uLL, 8uLL, &__block_literal_global_89846) != 0);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    BOOL v8 = v9;
  }
  else
  {
    BOOL v8 = 0;
  }
  v10 = [v6 objectForKeyedSubscript:@"eventCounter"];
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v14 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v15 = *MEMORY[0x1E4F502C8];
        uint64_t v21 = *MEMORY[0x1E4F28568];
        v16 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"eventCounter"];
        v22 = v16;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
        *a4 = (id)[v14 initWithDomain:v15 code:2 userInfo:v17];
      }
      id v11 = 0;
      v12 = 0;
      goto LABEL_13;
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }
  self = -[BMOasisAnalyticsQualityTrace initWithWriterId:eventCounter:](self, "initWithWriterId:eventCounter:", [v8 intValue], v11);
  v12 = self;
LABEL_13:

LABEL_14:
  return v12;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMOasisAnalyticsQualityTrace *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasEventCounter) {
    PBDataWriterWriteUint32Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)BMOasisAnalyticsQualityTrace;
  id v5 = [(BMEventBase *)&v33 init];
  if (!v5) {
    goto LABEL_51;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  unsigned int v7 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v12 >> 3) == 2)
      {
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v21 = 0;
        v5->_hasEventCounter = 1;
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
        v30 = &OBJC_IVAR___BMOasisAnalyticsQualityTrace__eventCounter;
      }
      else
      {
        if ((v12 >> 3) != 1)
        {
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_50;
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
        if (v21 >= 2) {
          LODWORD(v21) = 0;
        }
        v30 = &OBJC_IVAR___BMOasisAnalyticsQualityTrace__writerId;
      }
      *(_DWORD *)((char *)&v5->super.super.isa + *v30) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_50:
  }
    v31 = 0;
  else {
LABEL_51:
  }
    v31 = v5;

  return v31;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMOasisAnalyticsProcessIdAsString([(BMOasisAnalyticsQualityTrace *)self writerId]);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[BMOasisAnalyticsQualityTrace eventCounter](self, "eventCounter"));
  id v6 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsQualityTrace with writerId: %@, eventCounter: %@", v4, v5];

  return (NSString *)v6;
}

- (BMOasisAnalyticsQualityTrace)initWithWriterId:(int)a3 eventCounter:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BMOasisAnalyticsQualityTrace;
  unsigned int v7 = [(BMEventBase *)&v10 init];
  if (v7)
  {
    v7->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v7->_writerId = a3;
    if (v6)
    {
      v7->_hasEventCounter = 1;
      unsigned int v8 = [v6 unsignedIntValue];
    }
    else
    {
      unsigned int v8 = 0;
      v7->_hasEventCounter = 0;
    }
    v7->_eventCounter = v8;
  }

  return v7;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"writerId" number:1 type:4 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventCounter" number:2 type:4 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7740;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"writerId" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventCounter" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
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
    unsigned int v7 = (void *)[[v5 alloc] initWithData:v6];

    unsigned int v8 = [[BMOasisAnalyticsQualityTrace alloc] initByReadFrom:v7];
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