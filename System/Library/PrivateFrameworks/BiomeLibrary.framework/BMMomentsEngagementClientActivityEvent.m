@interface BMMomentsEngagementClientActivityEvent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMomentsEngagementClientActivityEvent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMMomentsEngagementClientActivityEvent)initWithType:(int)a3 clientIdentifier:(id)a4 timestamp:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSDate)timestamp;
- (NSString)clientIdentifier;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)type;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMomentsEngagementClientActivityEvent

- (void).cxx_destruct
{
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (int)type
{
  return self->_type;
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
    int v6 = [(BMMomentsEngagementClientActivityEvent *)self type];
    if (v6 == [v5 type])
    {
      v7 = [(BMMomentsEngagementClientActivityEvent *)self clientIdentifier];
      uint64_t v8 = [v5 clientIdentifier];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMMomentsEngagementClientActivityEvent *)self clientIdentifier];
        v11 = [v5 clientIdentifier];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      v14 = [(BMMomentsEngagementClientActivityEvent *)self timestamp];
      v15 = [v5 timestamp];
      if (v14 == v15)
      {
        char v13 = 1;
      }
      else
      {
        v16 = [(BMMomentsEngagementClientActivityEvent *)self timestamp];
        v17 = [v5 timestamp];
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

- (NSDate)timestamp
{
  if (self->_hasRaw_timestamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_timestamp];
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
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMMomentsEngagementClientActivityEvent type](self, "type"));
  id v4 = [(BMMomentsEngagementClientActivityEvent *)self clientIdentifier];
  id v5 = [(BMMomentsEngagementClientActivityEvent *)self timestamp];
  if (v5)
  {
    int v6 = NSNumber;
    v7 = [(BMMomentsEngagementClientActivityEvent *)self timestamp];
    [v7 timeIntervalSince1970];
    uint64_t v8 = objc_msgSend(v6, "numberWithDouble:");
  }
  else
  {
    uint64_t v8 = 0;
  }

  v14[0] = @"type";
  v9 = v3;
  if (!v3)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v9;
  v14[1] = @"clientIdentifier";
  v10 = v4;
  if (!v4)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v10;
  v14[2] = @"timestamp";
  v11 = v8;
  if (!v8)
  {
    v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v11;
  int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
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

- (BMMomentsEngagementClientActivityEvent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"type"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
LABEL_9:
    v10 = [v6 objectForKeyedSubscript:@"clientIdentifier"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v22 = 0;
          goto LABEL_26;
        }
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v20 = *MEMORY[0x1E4F502C8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        char v13 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientIdentifier"];
        v35 = v13;
        int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        id v21 = (id)[v30 initWithDomain:v20 code:2 userInfo:v12];
        id v11 = 0;
        v22 = 0;
        *a4 = v21;
        goto LABEL_25;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    int v12 = [v6 objectForKeyedSubscript:@"timestamp"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v15 = v12;
        id v16 = [v14 alloc];
        [v15 doubleValue];
        double v18 = v17;

        id v19 = (id)[v16 initWithTimeIntervalSince1970:v18];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          char v13 = [v23 dateFromString:v12];

          goto LABEL_24;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v31 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v29 = *MEMORY[0x1E4F502C8];
            uint64_t v32 = *MEMORY[0x1E4F28568];
            v27 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"timestamp"];
            v33 = v27;
            v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
            *a4 = (id)[v31 initWithDomain:v29 code:2 userInfo:v28];
          }
          char v13 = 0;
          v22 = 0;
          goto LABEL_25;
        }
        id v19 = v12;
      }
      char v13 = v19;
    }
    else
    {
      char v13 = 0;
    }
LABEL_24:
    self = -[BMMomentsEngagementClientActivityEvent initWithType:clientIdentifier:timestamp:](self, "initWithType:clientIdentifier:timestamp:", [v8 intValue], v11, v13);
    v22 = self;
LABEL_25:

    goto LABEL_26;
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
    id v9 = [NSNumber numberWithInt:BMMomentsEngagementClientActivityEventTypeFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    uint64_t v8 = 0;
    v22 = 0;
    goto LABEL_27;
  }
  id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v26 = *MEMORY[0x1E4F502C8];
  uint64_t v36 = *MEMORY[0x1E4F28568];
  id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
  v37[0] = v11;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:&v36 count:1];
  uint64_t v8 = 0;
  v22 = 0;
  *a4 = (id)[v25 initWithDomain:v26 code:2 userInfo:v10];
LABEL_26:

LABEL_27:
  return v22;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMomentsEngagementClientActivityEvent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_clientIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_hasRaw_timestamp) {
    PBDataWriterWriteDoubleField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMMomentsEngagementClientActivityEvent;
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
        v5->_hasRaw_timestamp = 1;
        uint64_t v28 = *v6;
        unint64_t v29 = *(void *)&v4[v28];
        if (v29 <= 0xFFFFFFFFFFFFFFF7 && v29 + 8 <= *(void *)&v4[*v7])
        {
          double v30 = *(double *)(*(void *)&v4[*v9] + v29);
          *(void *)&v4[v28] = v29 + 8;
        }
        else
        {
          v4[*v8] = 1;
          double v30 = 0.0;
        }
        v5->_raw_timestamp = v30;
      }
      else if (v20 == 2)
      {
        uint64_t v31 = PBReaderReadString();
        clientIdentifier = v5->_clientIdentifier;
        v5->_clientIdentifier = (NSString *)v31;
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
        if (v23 >= 5) {
          LODWORD(v23) = 0;
        }
        v5->_type = v23;
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
  id v4 = BMMomentsEngagementClientActivityEventTypeAsString([(BMMomentsEngagementClientActivityEvent *)self type]);
  id v5 = [(BMMomentsEngagementClientActivityEvent *)self clientIdentifier];
  id v6 = [(BMMomentsEngagementClientActivityEvent *)self timestamp];
  v7 = (void *)[v3 initWithFormat:@"BMMomentsEngagementClientActivityEvent with type: %@, clientIdentifier: %@, timestamp: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMMomentsEngagementClientActivityEvent)initWithType:(int)a3 clientIdentifier:(id)a4 timestamp:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMMomentsEngagementClientActivityEvent;
  unsigned int v11 = [(BMEventBase *)&v14 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_clientIdentifier, a4);
    if (v10)
    {
      v11->_hasRaw_timestamp = 1;
      [v10 timeIntervalSince1970];
    }
    else
    {
      v11->_hasRaw_timestamp = 0;
      double v12 = -1.0;
    }
    v11->_raw_timestamp = v12;
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"clientIdentifier", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"timestamp" number:3 type:0 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5940;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientIdentifier" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"timestamp" dataType:3 requestOnly:0 fieldNumber:3 protoDataType:0 convertedType:2];
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

    uint64_t v8 = [[BMMomentsEngagementClientActivityEvent alloc] initByReadFrom:v7];
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