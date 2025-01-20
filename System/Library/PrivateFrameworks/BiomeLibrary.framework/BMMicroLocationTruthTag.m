@interface BMMicroLocationTruthTag
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMMicroLocationTruthTag)initWithAbsoluteTimestamp:(id)a3 truthTagID:(id)a4 recordingRequestID:(id)a5 clientBundleID:(id)a6;
- (BMMicroLocationTruthTag)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSDate)absoluteTimestamp;
- (NSString)clientBundleID;
- (NSString)description;
- (NSString)recordingRequestID;
- (NSString)truthTagID;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMMicroLocationTruthTag

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_recordingRequestID, 0);

  objc_storeStrong((id *)&self->_truthTagID, 0);
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (NSString)recordingRequestID
{
  return self->_recordingRequestID;
}

- (NSString)truthTagID
{
  return self->_truthTagID;
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
    v6 = [(BMMicroLocationTruthTag *)self absoluteTimestamp];
    uint64_t v7 = [v5 absoluteTimestamp];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMMicroLocationTruthTag *)self absoluteTimestamp];
      v10 = [v5 absoluteTimestamp];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [(BMMicroLocationTruthTag *)self truthTagID];
    uint64_t v14 = [v5 truthTagID];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMMicroLocationTruthTag *)self truthTagID];
      v17 = [v5 truthTagID];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_13;
      }
    }
    v19 = [(BMMicroLocationTruthTag *)self recordingRequestID];
    uint64_t v20 = [v5 recordingRequestID];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMMicroLocationTruthTag *)self recordingRequestID];
      v23 = [v5 recordingRequestID];
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
LABEL_13:
        char v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v25 = [(BMMicroLocationTruthTag *)self clientBundleID];
    v26 = [v5 clientBundleID];
    if (v25 == v26)
    {
      char v12 = 1;
    }
    else
    {
      v27 = [(BMMicroLocationTruthTag *)self clientBundleID];
      v28 = [v5 clientBundleID];
      char v12 = [v27 isEqual:v28];
    }
    goto LABEL_19;
  }
  char v12 = 0;
LABEL_20:

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
  v17[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMMicroLocationTruthTag *)self absoluteTimestamp];
  if (v3)
  {
    id v4 = NSNumber;
    id v5 = [(BMMicroLocationTruthTag *)self absoluteTimestamp];
    [v5 timeIntervalSinceReferenceDate];
    v6 = objc_msgSend(v4, "numberWithDouble:");
  }
  else
  {
    v6 = 0;
  }

  uint64_t v7 = [(BMMicroLocationTruthTag *)self truthTagID];
  v8 = [(BMMicroLocationTruthTag *)self recordingRequestID];
  v9 = [(BMMicroLocationTruthTag *)self clientBundleID];
  v16[0] = @"absoluteTimestamp";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v10;
  v16[1] = @"truthTagID";
  int v11 = v7;
  if (!v7)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v11;
  v16[2] = @"recordingRequestID";
  char v12 = v8;
  if (!v8)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v12;
  v16[3] = @"clientBundleID";
  v13 = v9;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  if (v9)
  {
    if (v8) {
      goto LABEL_14;
    }
  }
  else
  {

    if (v8)
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

  return v14;
}

- (BMMicroLocationTruthTag)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"absoluteTimestamp"];
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

      id v12 = (id)[v9 initWithTimeIntervalSinceReferenceDate:v11];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v13 = objc_alloc_init(MEMORY[0x1E4F28D48]);
        v38 = [v13 dateFromString:v6];

        goto LABEL_9;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v38 = 0;
          v21 = 0;
          uint64_t v20 = self;
          goto LABEL_36;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v33 = *MEMORY[0x1E4F502C8];
        uint64_t v45 = *MEMORY[0x1E4F28568];
        id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (as time internal since 2001 (CFAbsoluteTime)), NSString (ISO8601 format), or NSDate", objc_opt_class(), @"absoluteTimestamp"];
        v46[0] = v15;
        uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
        v38 = 0;
        v21 = 0;
        *a4 = (id)[v32 initWithDomain:v33 code:2 userInfo:v14];
        goto LABEL_44;
      }
      id v12 = v6;
    }
    v38 = v12;
  }
  else
  {
    v38 = 0;
  }
LABEL_9:
  uint64_t v14 = [v5 objectForKeyedSubscript:@"truthTagID"];
  if (v14)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v14;
        goto LABEL_12;
      }
      if (a4)
      {
        id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v23 = *MEMORY[0x1E4F502C8];
        uint64_t v43 = *MEMORY[0x1E4F28568];
        id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"truthTagID"];
        id v44 = v18;
        v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        id v24 = (id)[v22 initWithDomain:v23 code:2 userInfo:v16];
        v21 = 0;
        id v15 = 0;
        *a4 = v24;
        goto LABEL_41;
      }
      id v15 = 0;
      v21 = 0;
LABEL_44:
      uint64_t v20 = self;
      goto LABEL_35;
    }
  }
  id v15 = 0;
LABEL_12:
  v16 = [v5 objectForKeyedSubscript:@"recordingRequestID"];
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = a4;
        id v18 = v16;
        goto LABEL_15;
      }
      if (a4)
      {
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v25 = *MEMORY[0x1E4F502C8];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        v17 = (id *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"recordingRequestID"];
        v42 = v17;
        [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        v19 = v26 = a4;
        id v27 = (id)[v35 initWithDomain:v25 code:2 userInfo:v19];
        v21 = 0;
        id v18 = 0;
        id *v26 = v27;
        goto LABEL_32;
      }
      id v18 = 0;
      v21 = 0;
LABEL_41:
      uint64_t v20 = self;
      goto LABEL_34;
    }
  }
  v17 = a4;
  id v18 = 0;
LABEL_15:
  v19 = [v5 objectForKeyedSubscript:@"clientBundleID"];
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = v19;
        goto LABEL_18;
      }
      if (v17)
      {
        id v36 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        v28 = v17;
        v29 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"clientBundleID"];
        v40 = v29;
        v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
        id *v28 = (id)[v36 initWithDomain:v34 code:2 userInfo:v30];

        v17 = 0;
      }
      v21 = 0;
LABEL_32:
      uint64_t v20 = self;
      goto LABEL_33;
    }
  }
  v17 = 0;
LABEL_18:
  uint64_t v20 = [(BMMicroLocationTruthTag *)self initWithAbsoluteTimestamp:v38 truthTagID:v15 recordingRequestID:v18 clientBundleID:v17];
  v21 = v20;
LABEL_33:

LABEL_34:
LABEL_35:

LABEL_36:
  return v21;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMMicroLocationTruthTag *)self writeTo:v3];
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
  if (self->_truthTagID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_recordingRequestID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientBundleID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMMicroLocationTruthTag;
  id v5 = [(BMEventBase *)&v28 init];
  if (!v5) {
    goto LABEL_34;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
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
          v5->_hasRaw_absoluteTimestamp = 1;
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
          v5->_raw_absoluteTimestamp = v22;
          break;
        case 2u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 40;
          goto LABEL_28;
        case 3u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 48;
          goto LABEL_28;
        case 4u:
          uint64_t v23 = PBReaderReadString();
          uint64_t v24 = 56;
LABEL_28:
          uint64_t v25 = *(Class *)((char *)&v5->super.super.isa + v24);
          *(Class *)((char *)&v5->super.super.isa + v24) = (Class)v23;

          break;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_33;
          }
          break;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_33:
  }
    v26 = 0;
  else {
LABEL_34:
  }
    v26 = v5;

  return v26;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMMicroLocationTruthTag *)self absoluteTimestamp];
  id v5 = [(BMMicroLocationTruthTag *)self truthTagID];
  v6 = [(BMMicroLocationTruthTag *)self recordingRequestID];
  uint64_t v7 = [(BMMicroLocationTruthTag *)self clientBundleID];
  id v8 = (void *)[v3 initWithFormat:@"BMMicroLocationTruthTag with absoluteTimestamp: %@, truthTagID: %@, recordingRequestID: %@, clientBundleID: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMMicroLocationTruthTag)initWithAbsoluteTimestamp:(id)a3 truthTagID:(id)a4 recordingRequestID:(id)a5 clientBundleID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMMicroLocationTruthTag;
  uint64_t v14 = [(BMEventBase *)&v17 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v10)
    {
      v14->_hasRaw_absoluteTimestamp = 1;
      [v10 timeIntervalSinceReferenceDate];
    }
    else
    {
      v14->_hasRaw_absoluteTimestamp = 0;
      double v15 = -1.0;
    }
    v14->_raw_absoluteTimestamp = v15;
    objc_storeStrong((id *)&v14->_truthTagID, a4);
    objc_storeStrong((id *)&v14->_recordingRequestID, a5);
    objc_storeStrong((id *)&v14->_clientBundleID, a6);
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"absoluteTimestamp" number:1 type:0 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"truthTagID" number:2 type:13 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"recordingRequestID" number:3 type:13 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"clientBundleID" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6E10;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"absoluteTimestamp" dataType:3 requestOnly:0 fieldNumber:1 protoDataType:0 convertedType:1];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"truthTagID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"recordingRequestID" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"clientBundleID" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4 == 1)
  {
    id v4 = (objc_class *)MEMORY[0x1E4F94090];
    id v5 = a3;
    v6 = (void *)[[v4 alloc] initWithData:v5];

    uint64_t v7 = [[BMMicroLocationTruthTag alloc] initByReadFrom:v6];
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