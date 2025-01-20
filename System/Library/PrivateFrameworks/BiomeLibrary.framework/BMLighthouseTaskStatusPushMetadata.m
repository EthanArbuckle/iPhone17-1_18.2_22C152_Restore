@interface BMLighthouseTaskStatusPushMetadata
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLighthouseTaskStatusPushMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLighthouseTaskStatusPushMetadata)initWithTopic:(id)a3 channelID:(id)a4 pushType:(id)a5 pushPriority:(id)a6 creationDate:(id)a7;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationDate;
- (NSString)channelID;
- (NSString)description;
- (NSString)pushPriority;
- (NSString)pushType;
- (NSString)topic;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMLighthouseTaskStatusPushMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pushPriority, 0);
  objc_storeStrong((id *)&self->_pushType, 0);
  objc_storeStrong((id *)&self->_channelID, 0);

  objc_storeStrong((id *)&self->_topic, 0);
}

- (NSString)pushPriority
{
  return self->_pushPriority;
}

- (NSString)pushType
{
  return self->_pushType;
}

- (NSString)channelID
{
  return self->_channelID;
}

- (NSString)topic
{
  return self->_topic;
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
    v6 = [(BMLighthouseTaskStatusPushMetadata *)self topic];
    uint64_t v7 = [v5 topic];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMLighthouseTaskStatusPushMetadata *)self topic];
      v10 = [v5 topic];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_17;
      }
    }
    v13 = [(BMLighthouseTaskStatusPushMetadata *)self channelID];
    uint64_t v14 = [v5 channelID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMLighthouseTaskStatusPushMetadata *)self channelID];
      v17 = [v5 channelID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_17;
      }
    }
    v19 = [(BMLighthouseTaskStatusPushMetadata *)self pushType];
    uint64_t v20 = [v5 pushType];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMLighthouseTaskStatusPushMetadata *)self pushType];
      v23 = [v5 pushType];
      int v24 = [v22 isEqual:v23];

      if (!v24) {
        goto LABEL_17;
      }
    }
    v25 = [(BMLighthouseTaskStatusPushMetadata *)self pushPriority];
    uint64_t v26 = [v5 pushPriority];
    if (v25 == (void *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      v28 = [(BMLighthouseTaskStatusPushMetadata *)self pushPriority];
      v29 = [v5 pushPriority];
      int v30 = [v28 isEqual:v29];

      if (!v30)
      {
LABEL_17:
        char v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    v31 = [(BMLighthouseTaskStatusPushMetadata *)self creationDate];
    v32 = [v5 creationDate];
    if (v31 == v32)
    {
      char v12 = 1;
    }
    else
    {
      v33 = [(BMLighthouseTaskStatusPushMetadata *)self creationDate];
      v34 = [v5 creationDate];
      char v12 = [v33 isEqual:v34];
    }
    goto LABEL_23;
  }
  char v12 = 0;
LABEL_24:

  return v12;
}

- (NSDate)creationDate
{
  if (self->_hasRaw_creationDate)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_creationDate];
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
  v21[5] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(BMLighthouseTaskStatusPushMetadata *)self topic];
  id v4 = [(BMLighthouseTaskStatusPushMetadata *)self channelID];
  id v5 = [(BMLighthouseTaskStatusPushMetadata *)self pushType];
  v6 = [(BMLighthouseTaskStatusPushMetadata *)self pushPriority];
  uint64_t v7 = [(BMLighthouseTaskStatusPushMetadata *)self creationDate];
  if (v7)
  {
    v8 = NSNumber;
    v9 = [(BMLighthouseTaskStatusPushMetadata *)self creationDate];
    [v9 timeIntervalSince1970];
    v10 = objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    v10 = 0;
  }

  uint64_t v18 = v3;
  v20[0] = @"topic";
  int v11 = (void *)v3;
  if (!v3)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[0] = v11;
  v20[1] = @"channelID";
  char v12 = v4;
  if (!v4)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[1] = v12;
  v20[2] = @"pushType";
  v13 = v5;
  if (!v5)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[2] = v13;
  v20[3] = @"pushPriority";
  uint64_t v14 = v6;
  if (!v6)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[3] = v14;
  v20[4] = @"creationDate";
  v15 = v10;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v21[4] = v15;
  v16 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v21, v20, 5, v18);
  if (v10)
  {
    if (v6) {
      goto LABEL_16;
    }
  }
  else
  {

    if (v6)
    {
LABEL_16:
      if (v5) {
        goto LABEL_17;
      }
LABEL_25:

      if (v4) {
        goto LABEL_18;
      }
      goto LABEL_26;
    }
  }

  if (!v5) {
    goto LABEL_25;
  }
LABEL_17:
  if (v4) {
    goto LABEL_18;
  }
LABEL_26:

LABEL_18:
  if (!v19) {

  }
  return v16;
}

- (BMLighthouseTaskStatusPushMetadata)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"topic"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"channelID"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v44 = 0;
          v25 = 0;
          goto LABEL_41;
        }
        v38 = a4;
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v51 = *MEMORY[0x1E4F28568];
        id v42 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"channelID"];
        id v52 = v42;
        v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v52 forKeys:&v51 count:1];
        id v44 = 0;
        v25 = 0;
        id *v38 = (id)[v26 initWithDomain:v27 code:2 userInfo:v10];
        goto LABEL_40;
      }
      id v44 = v9;
    }
    else
    {
      id v44 = 0;
    }
    v10 = [v6 objectForKeyedSubscript:@"pushType"];
    id v41 = v8;
    v43 = self;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v42 = 0;
          v25 = 0;
          goto LABEL_40;
        }
        v28 = a4;
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v49 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"pushType"];
        id v50 = v13;
        int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
        id v42 = 0;
        v25 = 0;
        id *v28 = (id)[v29 initWithDomain:v30 code:2 userInfo:v11];
LABEL_39:

        self = v43;
        id v8 = v41;
LABEL_40:

        goto LABEL_41;
      }
      id v42 = v10;
    }
    else
    {
      id v42 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"pushPriority"];
    char v12 = a4;
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v13 = 0;
          v25 = 0;
          goto LABEL_39;
        }
        id v39 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v31 = *MEMORY[0x1E4F502C8];
        uint64_t v47 = *MEMORY[0x1E4F28568];
        v15 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"pushPriority"];
        v48 = v15;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        id v32 = (id)[v39 initWithDomain:v31 code:2 userInfo:v14];
        id v13 = 0;
        v25 = 0;
        *char v12 = v32;
        goto LABEL_38;
      }
      id v13 = v11;
    }
    else
    {
      id v13 = 0;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"creationDate"];
    if (v14 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v16 = (objc_class *)MEMORY[0x1E4F1C9C8];
        id v17 = v14;
        id v18 = [v16 alloc];
        [v17 doubleValue];
        double v20 = v19;

        id v21 = (id)[v18 initWithTimeIntervalSince1970:v20];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v33 = objc_alloc_init(MEMORY[0x1E4F28D48]);
          v15 = [v33 dateFromString:v14];

          goto LABEL_37;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (v12)
          {
            id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v37 = *MEMORY[0x1E4F502C8];
            uint64_t v45 = *MEMORY[0x1E4F28568];
            v35 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"creationDate"];
            v46 = v35;
            v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
            *char v12 = (id)[v40 initWithDomain:v37 code:2 userInfo:v36];
          }
          v15 = 0;
          v25 = 0;
          goto LABEL_38;
        }
        id v21 = v14;
      }
      v15 = v21;
    }
    else
    {
      v15 = 0;
    }
LABEL_37:
    v25 = [(BMLighthouseTaskStatusPushMetadata *)v43 initWithTopic:v41 channelID:v44 pushType:v42 pushPriority:v13 creationDate:v15];
    v43 = v25;
LABEL_38:

    goto LABEL_39;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!a4)
  {
    id v8 = 0;
    v25 = 0;
    goto LABEL_42;
  }
  v22 = a4;
  id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v24 = *MEMORY[0x1E4F502C8];
  uint64_t v53 = *MEMORY[0x1E4F28568];
  id v44 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"topic"];
  v54[0] = v44;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:&v53 count:1];
  id v8 = 0;
  v25 = 0;
  id *v22 = (id)[v23 initWithDomain:v24 code:2 userInfo:v9];
LABEL_41:

LABEL_42:
  return v25;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMLighthouseTaskStatusPushMetadata *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_topic)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_channelID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_pushType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_pushPriority)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_hasRaw_creationDate)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMLighthouseTaskStatusPushMetadata;
  id v5 = [(BMEventBase *)&v28 init];
  if (!v5) {
    goto LABEL_36;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 40;
          goto LABEL_26;
        case 2u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 48;
          goto LABEL_26;
        case 3u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 56;
          goto LABEL_26;
        case 4u:
          uint64_t v20 = PBReaderReadString();
          uint64_t v21 = 64;
LABEL_26:
          v22 = *(Class *)((char *)&v5->super.super.isa + v21);
          *(Class *)((char *)&v5->super.super.isa + v21) = (Class)v20;

          break;
        case 5u:
          v5->_hasRaw_creationDate = 1;
          uint64_t v23 = *v6;
          unint64_t v24 = *(void *)&v4[v23];
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)&v4[*v7])
          {
            double v25 = *(double *)(*(void *)&v4[*v9] + v24);
            *(void *)&v4[v23] = v24 + 8;
          }
          else
          {
            v4[*v8] = 1;
            double v25 = 0.0;
          }
          v5->_raw_creationDate = v25;
          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_35;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_35:
  }
    id v26 = 0;
  else {
LABEL_36:
  }
    id v26 = v5;

  return v26;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMLighthouseTaskStatusPushMetadata *)self topic];
  id v5 = [(BMLighthouseTaskStatusPushMetadata *)self channelID];
  id v6 = [(BMLighthouseTaskStatusPushMetadata *)self pushType];
  uint64_t v7 = [(BMLighthouseTaskStatusPushMetadata *)self pushPriority];
  id v8 = [(BMLighthouseTaskStatusPushMetadata *)self creationDate];
  v9 = (void *)[v3 initWithFormat:@"BMLighthouseTaskStatusPushMetadata with topic: %@, channelID: %@, pushType: %@, pushPriority: %@, creationDate: %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (BMLighthouseTaskStatusPushMetadata)initWithTopic:(id)a3 channelID:(id)a4 pushType:(id)a5 pushPriority:(id)a6 creationDate:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMLighthouseTaskStatusPushMetadata;
  id v17 = [(BMEventBase *)&v21 init];
  if (v17)
  {
    v17->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v17->_topic, a3);
    objc_storeStrong((id *)&v17->_channelID, a4);
    objc_storeStrong((id *)&v17->_pushType, a5);
    objc_storeStrong((id *)&v17->_pushPriority, a6);
    if (v16)
    {
      v17->_hasRaw_creationDate = 1;
      [v16 timeIntervalSince1970];
    }
    else
    {
      v17->_hasRaw_creationDate = 0;
      double v18 = -1.0;
    }
    v17->_raw_creationDate = v18;
  }

  return v17;
}

+ (id)protoFields
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"topic" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"channelID", 2, 13, 0, v2);
  v9[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pushType" number:3 type:13 subMessageClass:0];
  v9[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"pushPriority" number:4 type:13 subMessageClass:0];
  v9[3] = v5;
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"creationDate" number:5 type:0 subMessageClass:0];
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF60C0;
}

+ (id)columns
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"topic" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"channelID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pushType" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"pushPriority" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"creationDate" dataType:3 requestOnly:0 fieldNumber:5 protoDataType:0 convertedType:2];
  v9[0] = v2;
  v9[1] = v3;
  v9[2] = v4;
  v9[3] = v5;
  v9[4] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];

  return v7;
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

    id v8 = [[BMLighthouseTaskStatusPushMetadata alloc] initByReadFrom:v7];
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