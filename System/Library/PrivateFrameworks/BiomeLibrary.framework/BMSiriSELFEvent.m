@interface BMSiriSELFEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSiriSELFEvent)initWithAbsoluteTimestamp:(id)a3 uniqueID:(id)a4 eventData:(id)a5;
- (BMSiriSELFEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSData)eventData;
- (NSDate)absoluteTimestamp;
- (NSString)description;
- (NSString)uniqueID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSiriSELFEvent

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"uniqueID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"eventData" dataType:4 requestOnly:0 fieldNumber:3 protoDataType:14 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventData, 0);

  objc_storeStrong((id *)&self->_uniqueID, 0);
}

- (NSData)eventData
{
  return self->_eventData;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
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
    v6 = [(BMSiriSELFEvent *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSiriSELFEvent *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMSiriSELFEvent *)self uniqueID];
    uint64_t v14 = [v5 uniqueID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSiriSELFEvent *)self uniqueID];
      v17 = [v5 uniqueID];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMSiriSELFEvent *)self eventData];
    v20 = [v5 eventData];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMSiriSELFEvent *)self eventData];
      v22 = [v5 eventData];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (NSDate)absoluteTimestamp
{
  if (self->_hasRaw_absoluteTimestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_absoluteTimestamp];
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
  v16[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSiriSELFEvent *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMSiriSELFEvent *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    v6 = 0;
  }

  uint64_t v7 = [(BMSiriSELFEvent *)self uniqueID];
  v8 = [(BMSiriSELFEvent *)self eventData];
  v9 = [v8 base64EncodedStringWithOptions:0];

  v15[0] = @"absoluteTimestamp";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[0] = v10;
  v15[1] = @"uniqueID";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[1] = v11;
  v15[2] = @"eventData";
  char v12 = v9;
  if (!v9)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v16[2] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:v15 count:3];
  if (v9)
  {
    if (v7) {
      goto LABEL_12;
    }
LABEL_17:

    if (v6) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v7) {
    goto LABEL_17;
  }
LABEL_12:
  if (v6) {
    goto LABEL_13;
  }
LABEL_18:

LABEL_13:

  return v13;
}

- (BMSiriSELFEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"absoluteTimestamp"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
LABEL_9:
    v16 = [v6 objectForKeyedSubscript:@"uniqueID"];
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v17 = 0;
          v20 = 0;
          goto LABEL_17;
        }
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        id v19 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"uniqueID"];
        id v35 = v19;
        int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v23 = (id)[v30 initWithDomain:v22 code:2 userInfo:v18];
        v20 = 0;
        id v17 = 0;
        *a4 = v23;
        goto LABEL_16;
      }
      id v17 = v16;
    }
    else
    {
      id v17 = 0;
    }
    int v18 = [v6 objectForKeyedSubscript:@"eventData"];
    if (v18 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v29 = *MEMORY[0x1E4F502C8];
          uint64_t v32 = *MEMORY[0x1E4F28568];
          v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"eventData"];
          v33 = v24;
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
          *a4 = (id)[v31 initWithDomain:v29 code:2 userInfo:v25];
        }
        id v19 = 0;
        v20 = 0;
        goto LABEL_16;
      }
      id v19 = v18;
    }
    else
    {
      id v19 = 0;
    }
    self = [(BMSiriSELFEvent *)self initWithAbsoluteTimestamp:v8 uniqueID:v17 eventData:v19];
    v20 = self;
LABEL_16:

    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
    id v10 = v7;
    id v11 = [v9 alloc];
    [v10 doubleValue];
    double v13 = v12;

    id v14 = (id)[v11 initWithTimeIntervalSinceReferenceDate:v13];
LABEL_6:
    v8 = v14;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F28D48]);
    v8 = [v15 dateFromString:v7];

    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v14 = v7;
    goto LABEL_6;
  }
  if (!a4)
  {
    v8 = 0;
    v20 = 0;
    goto LABEL_18;
  }
  id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v27 = *MEMORY[0x1E4F502C8];
  uint64_t v36 = *MEMORY[0x1E4F28568];
  id v17 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
  v37[0] = v17;
  v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
  id v28 = (id)[v26 initWithDomain:v27 code:2 userInfo:v16];
  v8 = 0;
  v20 = 0;
  *a4 = v28;
LABEL_17:

LABEL_18:
  return v20;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSiriSELFEvent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_hasRaw_absoluteTimestamp)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
  if (self->_uniqueID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_eventData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)BMSiriSELFEvent;
  id v5 = [(BMEventBase *)&v29 init];
  if (!v5) {
    goto LABEL_35;
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
        if (v11++ >= 9)
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
        uint64_t v24 = PBReaderReadData();
        uint64_t v25 = 48;
      }
      else
      {
        if (v20 != 2)
        {
          if (v20 == 1)
          {
            v5->_hasRaw_absoluteTimestamp = 1;
            uint64_t v21 = *v6;
            unint64_t v22 = *(void *)&v4[v21];
            if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(void *)&v4[*v7])
            {
              double v23 = *(double *)(*(void *)&v4[*v9] + v22);
              *(void *)&v4[v21] = v22 + 8;
            }
            else
            {
              v4[*v8] = 1;
              double v23 = 0.0;
            }
            v5->_raw_absoluteTimestamp = v23;
          }
          else if (!PBReaderSkipValueWithTag())
          {
            goto LABEL_34;
          }
          continue;
        }
        uint64_t v24 = PBReaderReadString();
        uint64_t v25 = 40;
      }
      id v26 = *(Class *)((char *)&v5->super.super.isa + v25);
      *(Class *)((char *)&v5->super.super.isa + v25) = (Class)v24;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_34:
  }
    uint64_t v27 = 0;
  else {
LABEL_35:
  }
    uint64_t v27 = v5;

  return v27;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSiriSELFEvent *)self absoluteTimestamp];
  id v5 = [(BMSiriSELFEvent *)self uniqueID];
  id v6 = [(BMSiriSELFEvent *)self eventData];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMSiriSELFEvent with absoluteTimestamp: %@, uniqueID: %@, eventData: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMSiriSELFEvent)initWithAbsoluteTimestamp:(id)a3 uniqueID:(id)a4 eventData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMSiriSELFEvent;
  unsigned int v11 = [(BMEventBase *)&v14 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v8)
    {
      v11->_hasRaw_absoluteTimestamp = 1;
      [v8 timeIntervalSinceReferenceDate];
    }
    else
    {
      v11->_hasRaw_absoluteTimestamp = 0;
      double v12 = -1.0;
    }
    v11->_raw_absoluteTimestamp = v12;
    objc_storeStrong((id *)&v11->_uniqueID, a4);
    objc_storeStrong((id *)&v11->_eventData, a5);
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"uniqueID", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"eventData" number:3 type:14 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5418;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    id v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMSiriSELFEvent alloc] initByReadFrom:v6];
    id v8 = v7;
    if (v7) {
      v7[8] = 1;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (unsigned)latestDataVersion
{
  return 1;
}

@end