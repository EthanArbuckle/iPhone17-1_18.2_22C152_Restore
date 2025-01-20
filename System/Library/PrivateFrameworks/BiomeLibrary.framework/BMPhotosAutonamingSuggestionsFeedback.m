@interface BMPhotosAutonamingSuggestionsFeedback
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMPhotosAutonamingSuggestionsFeedback)initWithFeedbackType:(int)a3 associationType:(int)a4;
- (BMPhotosAutonamingSuggestionsFeedback)initWithFeedbackType:(int)a3 associationType:(int)a4 feedbackId:(id)a5 visualId:(id)a6;
- (BMPhotosAutonamingSuggestionsFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)feedbackId;
- (NSString)visualId;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)associationType;
- (int)feedbackType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMPhotosAutonamingSuggestionsFeedback

- (BMPhotosAutonamingSuggestionsFeedback)initWithFeedbackType:(int)a3 associationType:(int)a4
{
  return [(BMPhotosAutonamingSuggestionsFeedback *)self initWithFeedbackType:*(void *)&a3 associationType:*(void *)&a4 feedbackId:0 visualId:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualId, 0);

  objc_storeStrong((id *)&self->_feedbackId, 0);
}

- (NSString)visualId
{
  return self->_visualId;
}

- (NSString)feedbackId
{
  return self->_feedbackId;
}

- (int)associationType
{
  return self->_associationType;
}

- (int)feedbackType
{
  return self->_feedbackType;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v14 = 0;
    goto LABEL_9;
  }
  id v5 = v4;
  int v6 = [(BMPhotosAutonamingSuggestionsFeedback *)self feedbackType];
  if (v6 != [v5 feedbackType]) {
    goto LABEL_6;
  }
  int v7 = [(BMPhotosAutonamingSuggestionsFeedback *)self associationType];
  if (v7 != [v5 associationType]) {
    goto LABEL_6;
  }
  v8 = [(BMPhotosAutonamingSuggestionsFeedback *)self feedbackId];
  uint64_t v9 = [v5 feedbackId];
  if (v8 == (void *)v9)
  {

    goto LABEL_11;
  }
  v10 = (void *)v9;
  v11 = [(BMPhotosAutonamingSuggestionsFeedback *)self feedbackId];
  v12 = [v5 feedbackId];
  int v13 = [v11 isEqual:v12];

  if (v13)
  {
LABEL_11:
    v16 = [(BMPhotosAutonamingSuggestionsFeedback *)self visualId];
    v17 = [v5 visualId];
    if (v16 == v17)
    {
      char v14 = 1;
    }
    else
    {
      v18 = [(BMPhotosAutonamingSuggestionsFeedback *)self visualId];
      v19 = [v5 visualId];
      char v14 = [v18 isEqual:v19];
    }
    goto LABEL_7;
  }
LABEL_6:
  char v14 = 0;
LABEL_7:

LABEL_9:
  return v14;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosAutonamingSuggestionsFeedback feedbackType](self, "feedbackType"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMPhotosAutonamingSuggestionsFeedback associationType](self, "associationType"));
  id v5 = [(BMPhotosAutonamingSuggestionsFeedback *)self feedbackId];
  int v6 = [(BMPhotosAutonamingSuggestionsFeedback *)self visualId];
  v13[0] = @"feedbackType";
  int v7 = v3;
  if (!v3)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"associationType";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"feedbackId";
  uint64_t v9 = v5;
  if (!v5)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"visualId";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[3] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:4];
  if (v6)
  {
    if (v5) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v5)
    {
LABEL_11:
      if (v4) {
        goto LABEL_12;
      }
LABEL_18:

      if (v3) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!v4) {
    goto LABEL_18;
  }
LABEL_12:
  if (v3) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v11;
}

- (BMPhotosAutonamingSuggestionsFeedback)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [v5 objectForKeyedSubscript:@"feedbackType"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v32 = 0;
          v16 = 0;
          v15 = self;
          goto LABEL_27;
        }
        id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v24 = *MEMORY[0x1E4F502C8];
        uint64_t v39 = *MEMORY[0x1E4F28568];
        uint64_t v9 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"feedbackType"];
        v40[0] = v9;
        v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:&v39 count:1];
        v32 = 0;
        v16 = 0;
        *a4 = (id)[v23 initWithDomain:v24 code:2 userInfo:v8];
        goto LABEL_45;
      }
      id v7 = [NSNumber numberWithInt:BMPhotosAutonamingSuggestionsFeedbackFeedbackTypeFromString(v6)];
    }
    v32 = v7;
  }
  else
  {
    v32 = 0;
  }
  v8 = [v5 objectForKeyedSubscript:@"associationType"];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = v8;
LABEL_16:
        uint64_t v9 = v10;
        goto LABEL_17;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v10 = [NSNumber numberWithInt:BMPhotosAutonamingSuggestionsFeedbackAssociationTypeFromString(v8)];
        goto LABEL_16;
      }
      if (a4)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v26 = *MEMORY[0x1E4F502C8];
        uint64_t v37 = *MEMORY[0x1E4F28568];
        id v12 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"associationType"];
        id v38 = v12;
        v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
        id v27 = (id)[v25 initWithDomain:v26 code:2 userInfo:v11];
        uint64_t v9 = 0;
        v16 = 0;
        *a4 = v27;
        goto LABEL_42;
      }
      uint64_t v9 = 0;
      v16 = 0;
LABEL_45:
      v15 = self;
      goto LABEL_26;
    }
  }
  uint64_t v9 = 0;
LABEL_17:
  v11 = [v5 objectForKeyedSubscript:@"feedbackId"];
  if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v12 = 0;
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F28C58]);
      v29 = a4;
      uint64_t v19 = *MEMORY[0x1E4F502C8];
      uint64_t v35 = *MEMORY[0x1E4F28568];
      id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"feedbackId"];
      id v36 = v14;
      int v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      id v20 = (id)[v18 initWithDomain:v19 code:2 userInfo:v13];
      v16 = 0;
      id v12 = 0;
      v15 = self;
      id *v29 = v20;
      goto LABEL_24;
    }
    id v12 = 0;
    v16 = 0;
LABEL_42:
    v15 = self;
    goto LABEL_25;
  }
  id v12 = v11;
LABEL_20:
  int v13 = [v5 objectForKeyedSubscript:@"visualId"];
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v28 = *MEMORY[0x1E4F502C8];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        v21 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"visualId"];
        v34 = v21;
        v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        *a4 = (id)[v30 initWithDomain:v28 code:2 userInfo:v22];
      }
      id v14 = 0;
      v16 = 0;
      v15 = self;
      goto LABEL_24;
    }
    id v14 = v13;
  }
  else
  {
    id v14 = 0;
  }
  v15 = -[BMPhotosAutonamingSuggestionsFeedback initWithFeedbackType:associationType:feedbackId:visualId:](self, "initWithFeedbackType:associationType:feedbackId:visualId:", [v32 intValue], objc_msgSend(v9, "intValue"), v12, v14);
  v16 = v15;
LABEL_24:

LABEL_25:
LABEL_26:

LABEL_27:
  return v16;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMPhotosAutonamingSuggestionsFeedback *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  if (self->_feedbackId) {
    PBDataWriterWriteStringField();
  }
  if (self->_visualId) {
    PBDataWriterWriteStringField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BMPhotosAutonamingSuggestionsFeedback;
  id v5 = [(BMEventBase *)&v36 init];
  if (!v5) {
    goto LABEL_55;
  }
  int v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = (int *)MEMORY[0x1E4F940B8];
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
      switch((v12 >> 3))
      {
        case 1u:
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
              goto LABEL_40;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_42;
            }
          }
          v4[*v8] = 1;
LABEL_40:
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_42:
          if (v21 >= 4) {
            LODWORD(v21) = 0;
          }
          uint64_t v33 = 20;
          goto LABEL_51;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v21 = 0;
          break;
        case 3u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 32;
          goto LABEL_38;
        case 4u:
          uint64_t v30 = PBReaderReadString();
          uint64_t v31 = 40;
LABEL_38:
          v32 = *(Class *)((char *)&v5->super.super.isa + v31);
          *(Class *)((char *)&v5->super.super.isa + v31) = (Class)v30;

          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_54;
          }
          continue;
      }
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
          goto LABEL_46;
        }
        v25 += 7;
        BOOL v16 = v26++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_48;
        }
      }
      v4[*v8] = 1;
LABEL_46:
      if (v4[*v8]) {
        LODWORD(v21) = 0;
      }
LABEL_48:
      if (v21 >= 9) {
        LODWORD(v21) = 0;
      }
      uint64_t v33 = 24;
LABEL_51:
      *(_DWORD *)((char *)&v5->super.super.isa + v33) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_54:
  }
    v34 = 0;
  else {
LABEL_55:
  }
    v34 = v5;

  return v34;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMPhotosAutonamingSuggestionsFeedbackFeedbackTypeAsString([(BMPhotosAutonamingSuggestionsFeedback *)self feedbackType]);
  id v5 = BMPhotosAutonamingSuggestionsFeedbackAssociationTypeAsString([(BMPhotosAutonamingSuggestionsFeedback *)self associationType]);
  int v6 = [(BMPhotosAutonamingSuggestionsFeedback *)self feedbackId];
  id v7 = [(BMPhotosAutonamingSuggestionsFeedback *)self visualId];
  v8 = (void *)[v3 initWithFormat:@"BMPhotosAutonamingSuggestionsFeedback with feedbackType: %@, associationType: %@, feedbackId: %@, visualId: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMPhotosAutonamingSuggestionsFeedback)initWithFeedbackType:(int)a3 associationType:(int)a4 feedbackId:(id)a5 visualId:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v15.receiver = self;
  v15.super_class = (Class)BMPhotosAutonamingSuggestionsFeedback;
  uint64_t v13 = [(BMEventBase *)&v15 init];
  if (v13)
  {
    v13->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v13->_feedbackType = a3;
    v13->_associationType = a4;
    objc_storeStrong((id *)&v13->_feedbackId, a5);
    objc_storeStrong((id *)&v13->_visualId, a6);
  }

  return v13;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"feedbackType" number:1 type:4 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"associationType" number:2 type:4 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"feedbackId" number:3 type:13 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visualId" number:4 type:13 subMessageClass:0];
  v8[3] = v5;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF6390;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"feedbackType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"associationType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"feedbackId" dataType:2 requestOnly:0 fieldNumber:3 protoDataType:13 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"visualId" dataType:2 requestOnly:0 fieldNumber:4 protoDataType:13 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

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
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMPhotosAutonamingSuggestionsFeedback alloc] initByReadFrom:v7];
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