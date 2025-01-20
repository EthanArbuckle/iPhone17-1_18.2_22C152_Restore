@interface BMIntelligencePlatformEmailMessageIds
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMIntelligencePlatformEmailMessageIds)initWithCreationTimeStamp:(id)a3 classifierType:(id)a4 messageUUID:(id)a5 messageSourceType:(int)a6;
- (BMIntelligencePlatformEmailMessageIds)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)creationTimeStamp;
- (NSString)classifierType;
- (NSString)description;
- (NSUUID)messageUUID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)messageSourceType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMIntelligencePlatformEmailMessageIds

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classifierType, 0);

  objc_storeStrong((id *)&self->_raw_messageUUID, 0);
}

- (int)messageSourceType
{
  return self->_messageSourceType;
}

- (NSString)classifierType
{
  return self->_classifierType;
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
    v6 = [(BMIntelligencePlatformEmailMessageIds *)self creationTimeStamp];
    uint64_t v7 = [v5 creationTimeStamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMIntelligencePlatformEmailMessageIds *)self creationTimeStamp];
      v10 = [v5 creationTimeStamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [(BMIntelligencePlatformEmailMessageIds *)self classifierType];
    uint64_t v14 = [v5 classifierType];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMIntelligencePlatformEmailMessageIds *)self classifierType];
      v17 = [v5 classifierType];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_13;
      }
    }
    v19 = [(BMIntelligencePlatformEmailMessageIds *)self messageUUID];
    uint64_t v20 = [v5 messageUUID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMIntelligencePlatformEmailMessageIds *)self messageUUID];
      v23 = [v5 messageUUID];
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
LABEL_13:
        BOOL v12 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    int v25 = [(BMIntelligencePlatformEmailMessageIds *)self messageSourceType];
    BOOL v12 = v25 == [v5 messageSourceType];
    goto LABEL_16;
  }
  BOOL v12 = 0;
LABEL_17:

  return v12;
}

- (NSUUID)messageUUID
{
  raw_messageUUID = self->_raw_messageUUID;
  if (raw_messageUUID)
  {
    v3 = [MEMORY[0x1E4F50320] convertValue:raw_messageUUID toType:3];
  }
  else
  {
    v3 = 0;
  }

  return (NSUUID *)v3;
}

- (NSDate)creationTimeStamp
{
  if (self->_hasRaw_creationTimeStamp)
  {
    v2 = (void *)MEMORY[0x1E4F50320];
    v3 = [NSNumber numberWithDouble:self->_raw_creationTimeStamp];
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
  v18[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMIntelligencePlatformEmailMessageIds *)self creationTimeStamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMIntelligencePlatformEmailMessageIds *)self creationTimeStamp];
    [v5 timeIntervalSince1970];
    v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    v6 = 0;
  }

  uint64_t v7 = [(BMIntelligencePlatformEmailMessageIds *)self classifierType];
  v8 = [(BMIntelligencePlatformEmailMessageIds *)self messageUUID];
  v9 = [v8 UUIDString];

  v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMIntelligencePlatformEmailMessageIds messageSourceType](self, "messageSourceType"));
  v17[0] = @"creationTimeStamp";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v11;
  v17[1] = @"classifierType";
  BOOL v12 = v7;
  if (!v7)
  {
    BOOL v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v12;
  v17[2] = @"messageUUID";
  v13 = v9;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[2] = v13;
  v17[3] = @"messageSourceType";
  uint64_t v14 = v10;
  if (!v10)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  if (v10)
  {
    if (v9) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v9)
    {
LABEL_14:
      if (v7) {
        goto LABEL_15;
      }
LABEL_21:

      if (v6) {
        goto LABEL_16;
      }
      goto LABEL_22;
    }
  }

  if (!v7) {
    goto LABEL_21;
  }
LABEL_15:
  if (v6) {
    goto LABEL_16;
  }
LABEL_22:

LABEL_16:

  return v15;
}

- (BMIntelligencePlatformEmailMessageIds)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"creationTimeStamp"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = (objc_class *)MEMORY[0x1E4F1C9C8];
      id v8 = v6;
      id v9 = [v7 alloc];
      [v8 doubleValue];
      double v11 = v10;

      id v12 = (id)[v9 initWithTimeIntervalSince1970:v11];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        v43 = [v13 dateFromString:v6];

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v43 = 0;
          int v24 = 0;
          int v25 = self;
          goto LABEL_37;
        }
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v37 = *MEMORY[0x1E4F502C8];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        v38 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 1970), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"creationTimeStamp"];
        v53[0] = v38;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
        v43 = 0;
        int v24 = 0;
        *a4 = (id)[v36 initWithDomain:v37 code:2 userInfo:v14];
        a4 = v38;
        goto LABEL_51;
      }
      id v12 = v6;
    }
    v43 = v12;
  }
  else
  {
    v43 = 0;
  }
LABEL_9:
  uint64_t v14 = [v5 objectForKeyedSubscript:@"classifierType"];
  if (!v14 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v41 = 0;
LABEL_12:
    v15 = [v5 objectForKeyedSubscript:@"messageUUID"];
    if (!v15 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v16 = 0;
LABEL_15:
      v17 = [v5 objectForKeyedSubscript:@"messageSourceType"];
      if (v17 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v21 = v17;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (a4)
            {
              id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
              uint64_t v39 = *MEMORY[0x1E4F502C8];
              uint64_t v44 = *MEMORY[0x1E4F28568];
              v30 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"messageSourceType"];
              v45 = v30;
              v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
              *a4 = (id)[v40 initWithDomain:v39 code:2 userInfo:v31];
            }
            int v18 = 0;
            int v24 = 0;
            a4 = v41;
            int v25 = self;
            goto LABEL_33;
          }
          id v21 = [NSNumber numberWithInt:BMIntelligencePlatformEmailMessageIdsSourceTypeFromString(v17)];
        }
        int v18 = v21;
      }
      else
      {
        int v18 = 0;
      }
      a4 = v41;
      int v25 = -[BMIntelligencePlatformEmailMessageIds initWithCreationTimeStamp:classifierType:messageUUID:messageSourceType:](self, "initWithCreationTimeStamp:classifierType:messageUUID:messageSourceType:", v43, v41, v16, [v18 intValue]);
      int v24 = v25;
LABEL_33:

      goto LABEL_34;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v16 = v15;
      uint64_t v19 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v16];
      if (v19)
      {
        uint64_t v20 = (void *)v19;

        id v16 = v20;
        goto LABEL_15;
      }
      if (a4)
      {
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v48 = *MEMORY[0x1E4F28568];
        v34 = (void *)[[NSString alloc] initWithFormat:@"-initWithUUIDString: for %@ returned nil", @"messageUUID"];
        v49 = v34;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        *a4 = (id)[v32 initWithDomain:v33 code:2 userInfo:v35];
      }
      int v24 = 0;
      v15 = v16;
    }
    else
    {
      if (!a4)
      {
        int v24 = 0;
        a4 = v41;
        int v25 = self;
        goto LABEL_35;
      }
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v27 = *MEMORY[0x1E4F502C8];
      uint64_t v46 = *MEMORY[0x1E4F28568];
      id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"messageUUID"];
      id v47 = v16;
      v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
      *a4 = (id)[v26 initWithDomain:v27 code:2 userInfo:v28];

      int v24 = 0;
    }
    a4 = v41;
    int v25 = self;
    goto LABEL_34;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v41 = v14;
    goto LABEL_12;
  }
  if (!a4)
  {
    int v24 = 0;
LABEL_51:
    int v25 = self;
    goto LABEL_36;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v23 = *MEMORY[0x1E4F502C8];
  uint64_t v50 = *MEMORY[0x1E4F28568];
  v15 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"classifierType"];
  v51 = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  int v24 = 0;
  *a4 = (id)[v22 initWithDomain:v23 code:2 userInfo:v16];
  a4 = 0;
  int v25 = self;
LABEL_34:

LABEL_35:
LABEL_36:

LABEL_37:
  return v24;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMIntelligencePlatformEmailMessageIds *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasRaw_creationTimeStamp) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_classifierType) {
    PBDataWriterWriteStringField();
  }
  if (self->_raw_messageUUID) {
    PBDataWriterWriteDataField();
  }
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)BMIntelligencePlatformEmailMessageIds;
  id v5 = [(BMEventBase *)&v35 init];
  if (!v5)
  {
LABEL_47:
    uint64_t v33 = v5;
    goto LABEL_48;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] >= *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
LABEL_45:
    if (v4[*v8]) {
      goto LABEL_46;
    }
    goto LABEL_47;
  }
  id v9 = (int *)MEMORY[0x1E4F940B8];
  while (2)
  {
    if (v4[*v8]) {
      goto LABEL_45;
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
      goto LABEL_45;
    }
    switch((v12 >> 3))
    {
      case 1u:
        v5->_hasRaw_creationTimeStamp = 1;
        uint64_t v20 = *v6;
        unint64_t v21 = *(void *)&v4[v20];
        if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)&v4[*v7])
        {
          double v22 = *(double *)(*(void *)&v4[*v9] + v21);
          *(void *)&v4[v20] = v21 + 8;
        }
        else
        {
          v4[*v8] = 1;
          double v22 = 0.0;
        }
        v5->_raw_creationTimeStamp = v22;
        goto LABEL_44;
      case 2u:
        uint64_t v23 = PBReaderReadString();
        classifierType = (NSData *)v5->_classifierType;
        v5->_classifierType = (NSString *)v23;
        goto LABEL_28;
      case 3u:
        PBReaderReadData();
        int v25 = (NSData *)objc_claimAutoreleasedReturnValue();
        if ([(NSData *)v25 length] == 16)
        {
          classifierType = v5->_raw_messageUUID;
          v5->_raw_messageUUID = v25;
LABEL_28:

LABEL_44:
          if (*(void *)&v4[*v6] >= *(void *)&v4[*v7]) {
            goto LABEL_45;
          }
          continue;
        }

LABEL_46:
        uint64_t v33 = 0;
LABEL_48:

        return v33;
      case 4u:
        char v26 = 0;
        unsigned int v27 = 0;
        uint64_t v28 = 0;
        while (2)
        {
          uint64_t v29 = *v6;
          uint64_t v30 = *(void *)&v4[v29];
          unint64_t v31 = v30 + 1;
          if (v30 == -1 || v31 > *(void *)&v4[*v7])
          {
            v4[*v8] = 1;
          }
          else
          {
            char v32 = *(unsigned char *)(*(void *)&v4[*v9] + v30);
            *(void *)&v4[v29] = v31;
            v28 |= (unint64_t)(v32 & 0x7F) << v26;
            if (v32 < 0)
            {
              v26 += 7;
              BOOL v17 = v27++ >= 9;
              if (v17)
              {
                LODWORD(v28) = 0;
                goto LABEL_39;
              }
              continue;
            }
          }
          break;
        }
        if (v4[*v8]) {
          LODWORD(v28) = 0;
        }
LABEL_39:
        if (v28 >= 3) {
          LODWORD(v28) = 0;
        }
        v5->_messageSourceType = v28;
        goto LABEL_44;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          goto LABEL_46;
        }
        goto LABEL_44;
    }
  }
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMIntelligencePlatformEmailMessageIds *)self creationTimeStamp];
  id v5 = [(BMIntelligencePlatformEmailMessageIds *)self classifierType];
  v6 = [(BMIntelligencePlatformEmailMessageIds *)self messageUUID];
  uint64_t v7 = BMIntelligencePlatformEmailMessageIdsSourceTypeAsString([(BMIntelligencePlatformEmailMessageIds *)self messageSourceType]);
  id v8 = (void *)[v3 initWithFormat:@"BMIntelligencePlatformEmailMessageIds with creationTimeStamp: %@, classifierType: %@, messageUUID: %@, messageSourceType: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMIntelligencePlatformEmailMessageIds)initWithCreationTimeStamp:(id)a3 classifierType:(id)a4 messageUUID:(id)a5 messageSourceType:(int)a6
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)BMIntelligencePlatformEmailMessageIds;
  uint64_t v13 = [(BMEventBase *)&v18 init];
  if (v13)
  {
    v13->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v13->_hasRaw_creationTimeStamp = 1;
      [v10 timeIntervalSince1970];
    }
    else
    {
      v13->_hasRaw_creationTimeStamp = 0;
      double v14 = -1.0;
    }
    v13->_raw_creationTimeStamp = v14;
    objc_storeStrong((id *)&v13->_classifierType, a4);
    if (v12)
    {
      v19[0] = 0;
      v19[1] = 0;
      [v12 getUUIDBytes:v19];
      uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v19 length:16];
      raw_messageUUID = v13->_raw_messageUUID;
      v13->_raw_messageUUID = (NSData *)v15;
    }
    else
    {
      raw_messageUUID = v13->_raw_messageUUID;
      v13->_raw_messageUUID = 0;
    }

    v13->_messageSourceType = a6;
  }

  return v13;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"creationTimeStamp" number:1 type:0 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"classifierType" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageUUID" number:3 type:14 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"messageSourceType" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3198;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"creationTimeStamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:2];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"classifierType" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageUUID" dataType:6 requestOnly:0 fieldNumber:3 protoDataType:14 convertedType:3];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"messageSourceType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
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

    id v8 = [[BMIntelligencePlatformEmailMessageIds alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[10] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end