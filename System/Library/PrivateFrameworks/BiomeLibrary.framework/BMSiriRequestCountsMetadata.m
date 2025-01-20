@interface BMSiriRequestCountsMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriRequestCountsMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSiriRequestCountsMetadata)initWithSchedule:(int)a3 aggregationWindowStartTimestamp:(id)a4 odmId:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)aggregationWindowStartTimestamp;
- (NSString)description;
- (NSString)odmId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)schedule;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriRequestCountsMetadata

- (void).cxx_destruct
{
}

- (NSString)odmId
{
  return self->_odmId;
}

- (int)schedule
{
  return self->_schedule;
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
    int v6 = [(BMSiriRequestCountsMetadata *)self schedule];
    if (v6 == [v5 schedule])
    {
      v7 = [(BMSiriRequestCountsMetadata *)self aggregationWindowStartTimestamp];
      uint64_t v8 = [v5 aggregationWindowStartTimestamp];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMSiriRequestCountsMetadata *)self aggregationWindowStartTimestamp];
        v11 = [v5 aggregationWindowStartTimestamp];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      v14 = [(BMSiriRequestCountsMetadata *)self odmId];
      v15 = [v5 odmId];
      if (v14 == v15)
      {
        char v13 = 1;
      }
      else
      {
        v16 = [(BMSiriRequestCountsMetadata *)self odmId];
        v17 = [v5 odmId];
        char v13 = [v16 isEqual:v17];
      }
      goto LABEL_12;
    }
LABEL_5:
    char v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  char v13 = 0;
LABEL_13:

  return v13;
}

- (NSDate)aggregationWindowStartTimestamp
{
  if (self->_hasRaw_aggregationWindowStartTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_aggregationWindowStartTimestamp];
    id v4 = [v2 convertValue:v3 toType:2];
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
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSiriRequestCountsMetadata schedule](self, "schedule"));
  id v4 = [(BMSiriRequestCountsMetadata *)self aggregationWindowStartTimestamp];
  if (v4)
  {
    id v5 = NSNumber;
    int v6 = [(BMSiriRequestCountsMetadata *)self aggregationWindowStartTimestamp];
    [v6 timeIntervalSince1970];
    v7 = objc_msgSend(v5, "numberWithDouble:");
  }
  else
  {
    v7 = 0;
  }

  uint64_t v8 = [(BMSiriRequestCountsMetadata *)self odmId];
  v14[0] = @"schedule";
  v9 = v3;
  if (!v3)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v9;
  v14[1] = @"aggregationWindowStartTimestamp";
  v10 = v7;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v10;
  v14[2] = @"odmId";
  v11 = v8;
  if (!v8)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  if (v8)
  {
    if (v7) {
      goto LABEL_12;
    }
LABEL_17:

    if (v3) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v7) {
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

- (BMSiriRequestCountsMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"schedule"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
LABEL_9:
    v10 = [v6 objectForKeyedSubscript:@"aggregationWindowStartTimestamp"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int v12 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v13 = v10;
        id v14 = [v12 alloc];
        [v13 doubleValue];
        double v16 = v15;

        id v17 = (id)[v14 initWithTimeIntervalSince1970:v16];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v11 = [v18 dateFromString:v10];

          goto LABEL_17;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v11 = 0;
            v21 = 0;
            goto LABEL_22;
          }
          id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v27 = *MEMORY[0x1E4F502C8];
          uint64_t v34 = *MEMORY[0x1E4F28568];
          id v20 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"aggregationWindowStartTimestamp"];
          id v35 = v20;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          id v28 = (id)[v31 initWithDomain:v27 code:2 userInfo:v19];
          v11 = 0;
          v21 = 0;
          *a4 = v28;
          goto LABEL_21;
        }
        id v17 = v10;
      }
      v11 = v17;
    }
    else
    {
      v11 = 0;
    }
LABEL_17:
    v19 = [v6 objectForKeyedSubscript:@"odmId"];
    if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v29 = *MEMORY[0x1E4F502C8];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"odmId"];
          v33 = v23;
          v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          *a4 = (id)[v30 initWithDomain:v29 code:2 userInfo:v24];
        }
        id v20 = 0;
        v21 = 0;
        goto LABEL_21;
      }
      id v20 = v19;
    }
    else
    {
      id v20 = 0;
    }
    self = -[BMSiriRequestCountsMetadata initWithSchedule:aggregationWindowStartTimestamp:odmId:](self, "initWithSchedule:aggregationWindowStartTimestamp:odmId:", [v8 intValue], v11, v20);
    v21 = self;
LABEL_21:

    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
LABEL_8:
    uint64_t v8 = v9;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [NSNumber numberWithInt:BMSiriRequestCountsMetadataScheduleFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    uint64_t v8 = 0;
    v21 = 0;
    goto LABEL_23;
  }
  id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v26 = *MEMORY[0x1E4F502C8];
  uint64_t v36 = *MEMORY[0x1E4F28568];
  v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"schedule"];
  v37[0] = v11;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
  uint64_t v8 = 0;
  v21 = 0;
  *a4 = (id)[v25 initWithDomain:v26 code:2 userInfo:v10];
LABEL_22:

LABEL_23:
  return v21;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriRequestCountsMetadata *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_hasRaw_aggregationWindowStartTimestamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_odmId) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMSiriRequestCountsMetadata;
  id v5 = [(BMEventBase *)&v35 init];
  if (!v5) {
    goto LABEL_46;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
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
      if ((v12 >> 3) == 3)
      {
        uint64_t v28 = PBReaderReadString();
        odmId = v5->_odmId;
        v5->_odmId = (NSString *)v28;
      }
      else if (v20 == 2)
      {
        v5->_hasRaw_aggregationWindowStartTimestamp = 1;
        uint64_t v30 = *v6;
        unint64_t v31 = *(void *)&v4[v30];
        if (v31 <= 0xFFFFFFFFFFFFFFF7 && v31 + 8 <= *(void *)&v4[*v7])
        {
          double v32 = *(double *)(*(void *)&v4[*v9] + v31);
          *(void *)&v4[v30] = v31 + 8;
        }
        else
        {
          v4[*v8] = 1;
          double v32 = 0.0;
        }
        v5->_raw_aggregationWindowStartTimestamp = v32;
      }
      else if (v20 == 1)
      {
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
            goto LABEL_36;
          }
          v21 += 7;
          BOOL v17 = v22++ >= 9;
          if (v17)
          {
            LODWORD(v23) = 0;
            goto LABEL_38;
          }
        }
        v4[*v8] = 1;
LABEL_36:
        if (v4[*v8]) {
          LODWORD(v23) = 0;
        }
LABEL_38:
        if (v23 >= 4) {
          LODWORD(v23) = 0;
        }
        v5->_schedule = v23;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_45;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_45:
  }
    v33 = 0;
  else {
LABEL_46:
  }
    v33 = v5;

  return v33;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMSiriRequestCountsMetadataScheduleAsString([(BMSiriRequestCountsMetadata *)self schedule]);
  id v5 = [(BMSiriRequestCountsMetadata *)self aggregationWindowStartTimestamp];
  id v6 = [(BMSiriRequestCountsMetadata *)self odmId];
  v7 = (void *)[v3 initWithFormat:@"BMSiriRequestCountsMetadata with schedule: %@, aggregationWindowStartTimestamp: %@, odmId: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMSiriRequestCountsMetadata)initWithSchedule:(int)a3 aggregationWindowStartTimestamp:(id)a4 odmId:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMSiriRequestCountsMetadata;
  char v10 = [(BMEventBase *)&v13 init];
  if (v10)
  {
    v10->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v10->_schedule = a3;
    if (v8)
    {
      v10->_hasRaw_aggregationWindowStartTimestamp = 1;
      [v8 timeIntervalSince1970];
    }
    else
    {
      v10->_hasRaw_aggregationWindowStartTimestamp = 0;
      double v11 = -1.0;
    }
    v10->_raw_aggregationWindowStartTimestamp = v11;
    objc_storeStrong((id *)&v10->_odmId, a5);
  }

  return v10;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"schedule" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"aggregationWindowStartTimestamp", 2, 0, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"odmId" number:3 type:13 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4890;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"schedule" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"aggregationWindowStartTimestamp" dataType:3 requestOnly:0 fieldNumber:2 protoDataType:0 convertedType:2];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"odmId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

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
    v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSiriRequestCountsMetadata alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[8] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end