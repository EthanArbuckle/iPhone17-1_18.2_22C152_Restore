@interface BMOasisAnalyticsMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMOasisAnalyticsMetadata)initWithBootSessionId:(id)a3 timestampSinceBootInNanosecond:(id)a4;
- (BMOasisAnalyticsMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMOasisAnalyticsUUID128)bootSessionId;
- (BOOL)hasTimestampSinceBootInNanosecond;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unint64_t)timestampSinceBootInNanosecond;
- (unsigned)dataVersion;
- (void)setHasTimestampSinceBootInNanosecond:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMOasisAnalyticsMetadata

- (void).cxx_destruct
{
}

- (void)setHasTimestampSinceBootInNanosecond:(BOOL)a3
{
  self->_hasTimestampSinceBootInNanosecond = a3;
}

- (BOOL)hasTimestampSinceBootInNanosecond
{
  return self->_hasTimestampSinceBootInNanosecond;
}

- (unint64_t)timestampSinceBootInNanosecond
{
  return self->_timestampSinceBootInNanosecond;
}

- (BMOasisAnalyticsUUID128)bootSessionId
{
  return self->_bootSessionId;
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
    v6 = [(BMOasisAnalyticsMetadata *)self bootSessionId];
    uint64_t v7 = [v5 bootSessionId];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMOasisAnalyticsMetadata *)self bootSessionId];
      v10 = [v5 bootSessionId];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_12;
      }
    }
    if (![(BMOasisAnalyticsMetadata *)self hasTimestampSinceBootInNanosecond]
      && ![v5 hasTimestampSinceBootInNanosecond])
    {
      BOOL v12 = 1;
      goto LABEL_13;
    }
    if ([(BMOasisAnalyticsMetadata *)self hasTimestampSinceBootInNanosecond]
      && [v5 hasTimestampSinceBootInNanosecond])
    {
      unint64_t v13 = [(BMOasisAnalyticsMetadata *)self timestampSinceBootInNanosecond];
      BOOL v12 = v13 == [v5 timestampSinceBootInNanosecond];
LABEL_13:

      goto LABEL_14;
    }
LABEL_12:
    BOOL v12 = 0;
    goto LABEL_13;
  }
  BOOL v12 = 0;
LABEL_14:

  return v12;
}

- (id)jsonDictionary
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMOasisAnalyticsMetadata *)self bootSessionId];
  id v4 = [v3 jsonDictionary];

  if ([(BMOasisAnalyticsMetadata *)self hasTimestampSinceBootInNanosecond])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsMetadata timestampSinceBootInNanosecond](self, "timestampSinceBootInNanosecond"));
  }
  else
  {
    id v5 = 0;
  }
  v10[0] = @"bootSessionId";
  v6 = v4;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"timestampSinceBootInNanosecond";
  v11[0] = v6;
  uint64_t v7 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (v5)
  {
    if (v4) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v4) {
      goto LABEL_10;
    }
  }

LABEL_10:

  return v8;
}

- (BMOasisAnalyticsMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"bootSessionId"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    id v22 = 0;
    v8 = [[BMOasisAnalyticsUUID128 alloc] initWithJSONDictionary:v10 error:&v22];
    id v13 = v22;
    if (v13)
    {
      v14 = v13;
      if (a4) {
        *a4 = v13;
      }

      int v11 = 0;
      goto LABEL_9;
    }

LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"timestampSinceBootInNanosecond"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v19 = *MEMORY[0x1E4F502C8];
          uint64_t v23 = *MEMORY[0x1E4F28568];
          v20 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"timestampSinceBootInNanosecond"];
          v24 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          *a4 = (id)[v18 initWithDomain:v19 code:2 userInfo:v21];
        }
        int v11 = 0;
        id v10 = 0;
        goto LABEL_8;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    self = [(BMOasisAnalyticsMetadata *)self initWithBootSessionId:v8 timestampSinceBootInNanosecond:v10];
    int v11 = self;
LABEL_8:

    goto LABEL_9;
  }
  if (!a4)
  {
    int v11 = 0;
    goto LABEL_10;
  }
  id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v16 = *MEMORY[0x1E4F502C8];
  uint64_t v25 = *MEMORY[0x1E4F28568];
  v8 = (BMOasisAnalyticsUUID128 *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"bootSessionId"];
  v26[0] = v8;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  id v17 = (id)[v15 initWithDomain:v16 code:2 userInfo:v10];
  int v11 = 0;
  *a4 = v17;
LABEL_9:

LABEL_10:
  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMOasisAnalyticsMetadata *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_bootSessionId)
  {
    PBDataWriterPlaceMark();
    [(BMOasisAnalyticsUUID128 *)self->_bootSessionId writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasTimestampSinceBootInNanosecond) {
    PBDataWriterWriteUint64Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMOasisAnalyticsMetadata;
  id v5 = [(BMEventBase *)&v29 init];
  if (!v5) {
    goto LABEL_40;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    v9 = (int *)MEMORY[0x1E4F940B8];
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
        char v21 = 0;
        unsigned int v22 = 0;
        unint64_t v23 = 0;
        v5->_hasTimestampSinceBootInNanosecond = 1;
        while (1)
        {
          uint64_t v24 = *v6;
          unint64_t v25 = *(void *)&v4[v24];
          if (v25 == -1 || v25 >= *(void *)&v4[*v7]) {
            break;
          }
          char v26 = *(unsigned char *)(*(void *)&v4[*v9] + v25);
          *(void *)&v4[v24] = v25 + 1;
          v23 |= (unint64_t)(v26 & 0x7F) << v21;
          if ((v26 & 0x80) == 0) {
            goto LABEL_34;
          }
          v21 += 7;
          BOOL v16 = v22++ >= 9;
          if (v16)
          {
            unint64_t v23 = 0;
            goto LABEL_36;
          }
        }
        v4[*v8] = 1;
LABEL_34:
        if (v4[*v8]) {
          unint64_t v23 = 0;
        }
LABEL_36:
        v5->_timestampSinceBootInNanosecond = v23;
      }
      else if ((v12 >> 3) == 1)
      {
        uint64_t v30 = 0;
        uint64_t v31 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_39;
        }
        uint64_t v19 = [[BMOasisAnalyticsUUID128 alloc] initByReadFrom:v4];
        if (!v19) {
          goto LABEL_39;
        }
        bootSessionId = v5->_bootSessionId;
        v5->_bootSessionId = v19;

        PBReaderRecallMark();
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_39;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_39:
  }
    v27 = 0;
  else {
LABEL_40:
  }
    v27 = v5;

  return v27;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMOasisAnalyticsMetadata *)self bootSessionId];
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMOasisAnalyticsMetadata timestampSinceBootInNanosecond](self, "timestampSinceBootInNanosecond"));
  id v6 = (void *)[v3 initWithFormat:@"BMOasisAnalyticsMetadata with bootSessionId: %@, timestampSinceBootInNanosecond: %@", v4, v5];

  return (NSString *)v6;
}

- (BMOasisAnalyticsMetadata)initWithBootSessionId:(id)a3 timestampSinceBootInNanosecond:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BMOasisAnalyticsMetadata;
  v9 = [(BMEventBase *)&v12 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_bootSessionId, a3);
    if (v8)
    {
      v9->_hasTimestampSinceBootInNanosecond = 1;
      uint64_t v10 = [v8 unsignedLongLongValue];
    }
    else
    {
      uint64_t v10 = 0;
      v9->_hasTimestampSinceBootInNanosecond = 0;
    }
    v9->_timestampSinceBootInNanosecond = v10;
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"bootSessionId" number:1 type:14 subMessageClass:objc_opt_class()];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestampSinceBootInNanosecond" number:2 type:5 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF7770;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"bootSessionId_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_175_89965];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestampSinceBootInNanosecond" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:5 convertedType:0];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __35__BMOasisAnalyticsMetadata_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 bootSessionId];
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

    id v8 = [[BMOasisAnalyticsMetadata alloc] initByReadFrom:v7];
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