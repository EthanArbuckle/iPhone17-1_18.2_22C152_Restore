@interface BMAirPlayPredictionFeedback
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMAirPlayPredictionFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMAirPlayPredictionFeedback)initWithType:(int)a3 outputDeviceID:(id)a4 subtype:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)outputDeviceID;
- (NSString)subtype;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)type;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMAirPlayPredictionFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtype, 0);

  objc_storeStrong((id *)&self->_outputDeviceID, 0);
}

- (NSString)subtype
{
  return self->_subtype;
}

- (NSString)outputDeviceID
{
  return self->_outputDeviceID;
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
    int v6 = [(BMAirPlayPredictionFeedback *)self type];
    if (v6 == [v5 type])
    {
      v7 = [(BMAirPlayPredictionFeedback *)self outputDeviceID];
      uint64_t v8 = [v5 outputDeviceID];
      if (v7 == (void *)v8)
      {
      }
      else
      {
        v9 = (void *)v8;
        v10 = [(BMAirPlayPredictionFeedback *)self outputDeviceID];
        v11 = [v5 outputDeviceID];
        int v12 = [v10 isEqual:v11];

        if (!v12) {
          goto LABEL_5;
        }
      }
      v14 = [(BMAirPlayPredictionFeedback *)self subtype];
      v15 = [v5 subtype];
      if (v14 == v15)
      {
        char v13 = 1;
      }
      else
      {
        v16 = [(BMAirPlayPredictionFeedback *)self subtype];
        v17 = [v5 subtype];
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

- (id)jsonDictionary
{
  v12[3] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMAirPlayPredictionFeedback type](self, "type"));
  id v4 = [(BMAirPlayPredictionFeedback *)self outputDeviceID];
  id v5 = [(BMAirPlayPredictionFeedback *)self subtype];
  v11[0] = @"type";
  int v6 = v3;
  if (!v3)
  {
    int v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[0] = v6;
  v11[1] = @"outputDeviceID";
  v7 = v4;
  if (!v4)
  {
    v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[1] = v7;
  v11[2] = @"subtype";
  uint64_t v8 = v5;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v12[2] = v8;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  if (v5)
  {
    if (v4) {
      goto LABEL_9;
    }
LABEL_14:

    if (v3) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v4) {
    goto LABEL_14;
  }
LABEL_9:
  if (v3) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v9;
}

- (BMAirPlayPredictionFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [v6 objectForKeyedSubscript:@"type"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = 0;
LABEL_9:
    v10 = [v6 objectForKeyedSubscript:@"outputDeviceID"];
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v11 = 0;
          v14 = 0;
          goto LABEL_17;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v16 = *MEMORY[0x1E4F502C8];
        uint64_t v27 = *MEMORY[0x1E4F28568];
        id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"outputDeviceID"];
        id v28 = v13;
        int v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v17 = (id)[v23 initWithDomain:v16 code:2 userInfo:v12];
        v14 = 0;
        id v11 = 0;
        *a4 = v17;
        goto LABEL_16;
      }
      id v11 = v10;
    }
    else
    {
      id v11 = 0;
    }
    int v12 = [v6 objectForKeyedSubscript:@"subtype"];
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (a4)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v22 = *MEMORY[0x1E4F502C8];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"subtype"];
          v26 = v18;
          v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a4 = (id)[v24 initWithDomain:v22 code:2 userInfo:v19];
        }
        id v13 = 0;
        v14 = 0;
        goto LABEL_16;
      }
      id v13 = v12;
    }
    else
    {
      id v13 = 0;
    }
    self = -[BMAirPlayPredictionFeedback initWithType:outputDeviceID:subtype:](self, "initWithType:outputDeviceID:subtype:", [v8 intValue], v11, v13);
    v14 = self;
LABEL_16:

    goto LABEL_17;
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
    id v9 = [NSNumber numberWithInt:BMAirPlayPredictionFeedbackTypeFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    uint64_t v8 = 0;
    v14 = 0;
    goto LABEL_18;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v21 = *MEMORY[0x1E4F502C8];
  uint64_t v29 = *MEMORY[0x1E4F28568];
  id v11 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"type"];
  v30[0] = v11;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
  uint64_t v8 = 0;
  v14 = 0;
  *a4 = (id)[v20 initWithDomain:v21 code:2 userInfo:v10];
LABEL_17:

LABEL_18:
  return v14;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMAirPlayPredictionFeedback *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_outputDeviceID) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtype) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMAirPlayPredictionFeedback;
  id v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_43;
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
      unint64_t v19 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 32;
      }
      else
      {
        if (v19 != 2)
        {
          if (v19 == 1)
          {
            char v20 = 0;
            unsigned int v21 = 0;
            uint64_t v22 = 0;
            while (1)
            {
              uint64_t v23 = *v6;
              unint64_t v24 = *(void *)&v4[v23];
              if (v24 == -1 || v24 >= *(void *)&v4[*v7]) {
                break;
              }
              char v25 = *(unsigned char *)(*(void *)&v4[*v9] + v24);
              *(void *)&v4[v23] = v24 + 1;
              v22 |= (unint64_t)(v25 & 0x7F) << v20;
              if ((v25 & 0x80) == 0) {
                goto LABEL_35;
              }
              v20 += 7;
              BOOL v16 = v21++ >= 9;
              if (v16)
              {
                LODWORD(v22) = 0;
                goto LABEL_37;
              }
            }
            v4[*v8] = 1;
LABEL_35:
            if (v4[*v8]) {
              LODWORD(v22) = 0;
            }
LABEL_37:
            if (v22 >= 5) {
              LODWORD(v22) = 0;
            }
            v5->_type = v22;
          }
          else if (!PBReaderSkipValueWithTag())
          {
            goto LABEL_42;
          }
          continue;
        }
        uint64_t v26 = PBReaderReadString();
        uint64_t v27 = 24;
      }
      id v28 = *(Class *)((char *)&v5->super.super.isa + v27);
      *(Class *)((char *)&v5->super.super.isa + v27) = (Class)v26;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_42:
  }
    uint64_t v29 = 0;
  else {
LABEL_43:
  }
    uint64_t v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMAirPlayPredictionFeedbackTypeAsString([(BMAirPlayPredictionFeedback *)self type]);
  id v5 = [(BMAirPlayPredictionFeedback *)self outputDeviceID];
  id v6 = [(BMAirPlayPredictionFeedback *)self subtype];
  v7 = (void *)[v3 initWithFormat:@"BMAirPlayPredictionFeedback with type: %@, outputDeviceID: %@, subtype: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMAirPlayPredictionFeedback)initWithType:(int)a3 outputDeviceID:(id)a4 subtype:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)BMAirPlayPredictionFeedback;
  unsigned int v11 = [(BMEventBase *)&v13 init];
  if (v11)
  {
    v11->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_outputDeviceID, a4);
    objc_storeStrong((id *)&v11->_subtype, a5);
  }

  return v11;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"type" number:1 type:4 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"outputDeviceID", 2, 13, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"subtype" number:3 type:13 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6738;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"type" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"outputDeviceID" dataType:2 requestOnly:0 fieldNumber:2 protoDataType:13 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"subtype" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
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

    uint64_t v8 = [[BMAirPlayPredictionFeedback alloc] initByReadFrom:v7];
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