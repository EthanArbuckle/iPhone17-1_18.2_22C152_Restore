@interface BMSafariBrowsingAssistantUserInteractionDetected
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariBrowsingAssistantUserInteractionDetected)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSafariBrowsingAssistantUserInteractionDetected)initWithWebpageViewIdentifier:(id)a3 visualComponent:(id)a4 userInteractionType:(int)a5 visualComponentInteractionInfo:(id)a6;
- (BMSafariBrowsingAssistantVisualComponent)visualComponent;
- (BMSafariBrowsingAssistantVisualComponentInteractionInfo)visualComponentInteractionInfo;
- (BOOL)isEqual:(id)a3;
- (NSData)webpageViewIdentifier;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)userInteractionType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariBrowsingAssistantUserInteractionDetected

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualComponentInteractionInfo, 0);
  objc_storeStrong((id *)&self->_visualComponent, 0);

  objc_storeStrong((id *)&self->_webpageViewIdentifier, 0);
}

- (BMSafariBrowsingAssistantVisualComponentInteractionInfo)visualComponentInteractionInfo
{
  return self->_visualComponentInteractionInfo;
}

- (int)userInteractionType
{
  return self->_userInteractionType;
}

- (BMSafariBrowsingAssistantVisualComponent)visualComponent
{
  return self->_visualComponent;
}

- (NSData)webpageViewIdentifier
{
  return self->_webpageViewIdentifier;
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
    v6 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self webpageViewIdentifier];
    uint64_t v7 = [v5 webpageViewIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self webpageViewIdentifier];
      v10 = [v5 webpageViewIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_14;
      }
    }
    v13 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self visualComponent];
    uint64_t v14 = [v5 visualComponent];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self visualComponent];
      v17 = [v5 visualComponent];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_14;
      }
    }
    int v19 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self userInteractionType];
    if (v19 == [v5 userInteractionType])
    {
      v20 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self visualComponentInteractionInfo];
      v21 = [v5 visualComponentInteractionInfo];
      if (v20 == v21)
      {
        char v12 = 1;
      }
      else
      {
        v22 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self visualComponentInteractionInfo];
        v23 = [v5 visualComponentInteractionInfo];
        char v12 = [v22 isEqual:v23];
      }
      goto LABEL_17;
    }
LABEL_14:
    char v12 = 0;
LABEL_17:

    goto LABEL_18;
  }
  char v12 = 0;
LABEL_18:

  return v12;
}

- (id)jsonDictionary
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self webpageViewIdentifier];
  id v4 = [v3 base64EncodedStringWithOptions:0];

  id v5 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self visualComponent];
  v6 = [v5 jsonDictionary];

  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariBrowsingAssistantUserInteractionDetected userInteractionType](self, "userInteractionType"));
  v8 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self visualComponentInteractionInfo];
  v9 = [v8 jsonDictionary];

  v16[0] = @"webpageViewIdentifier";
  v10 = v4;
  if (!v4)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[0] = v10;
  v16[1] = @"visualComponent";
  int v11 = v6;
  if (!v6)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v11;
  v16[2] = @"userInteractionType";
  char v12 = v7;
  if (!v7)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[2] = v12;
  v16[3] = @"visualComponentInteractionInfo";
  v13 = v9;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[3] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];
  if (v9)
  {
    if (v7) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v7)
    {
LABEL_11:
      if (v6) {
        goto LABEL_12;
      }
LABEL_18:

      if (v4) {
        goto LABEL_13;
      }
      goto LABEL_19;
    }
  }

  if (!v6) {
    goto LABEL_18;
  }
LABEL_12:
  if (v4) {
    goto LABEL_13;
  }
LABEL_19:

LABEL_13:

  return v14;
}

- (BMSafariBrowsingAssistantUserInteractionDetected)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"webpageViewIdentifier"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
LABEL_4:
    v8 = [v5 objectForKeyedSubscript:@"visualComponent"];
    if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v8;
      id v40 = 0;
      v9 = [[BMSafariBrowsingAssistantVisualComponent alloc] initWithJSONDictionary:v13 error:&v40];
      id v14 = v40;
      if (v14)
      {
        v15 = v14;
        v16 = self;
        if (a4) {
          *a4 = v14;
        }

        v17 = 0;
        goto LABEL_47;
      }

LABEL_7:
      v10 = [v5 objectForKeyedSubscript:@"userInteractionType"];
      v36 = v9;
      id v37 = v7;
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        int v11 = a4;
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v18 = v10;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (!a4)
            {
              char v12 = 0;
              v17 = 0;
              v16 = self;
              v9 = v36;
              goto LABEL_46;
            }
            id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v31 = *MEMORY[0x1E4F502C8];
            uint64_t v43 = *MEMORY[0x1E4F28568];
            v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"userInteractionType"];
            v44 = v24;
            v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
            id v32 = (id)[v30 initWithDomain:v31 code:2 userInfo:v25];
            char v12 = 0;
            v17 = 0;
            *int v11 = v32;
            goto LABEL_43;
          }
          id v18 = [NSNumber numberWithInt:BMSafariBrowsingAssistantUserInteractionTypeFromString(v10)];
        }
        char v12 = v18;
      }
      else
      {
        int v11 = a4;
        char v12 = 0;
      }
      v24 = [v5 objectForKeyedSubscript:@"visualComponentInteractionInfo"];
      if (!v24 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v25 = 0;
LABEL_30:
        v9 = v36;
        v16 = -[BMSafariBrowsingAssistantUserInteractionDetected initWithWebpageViewIdentifier:visualComponent:userInteractionType:visualComponentInteractionInfo:](self, "initWithWebpageViewIdentifier:visualComponent:userInteractionType:visualComponentInteractionInfo:", v37, v36, [v12 intValue], v25);
        v17 = v16;
LABEL_44:

LABEL_45:
LABEL_46:

        id v13 = v8;
        id v7 = v37;
        goto LABEL_47;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v26 = v24;
        id v39 = 0;
        v25 = [[BMSafariBrowsingAssistantVisualComponentInteractionInfo alloc] initWithJSONDictionary:v26 error:&v39];
        id v27 = v39;
        if (!v27)
        {

          goto LABEL_30;
        }
        v28 = v27;
        if (v11) {
          *int v11 = v27;
        }

        v17 = 0;
        v24 = v26;
      }
      else
      {
        if (!v11)
        {
          v17 = 0;
          v16 = self;
          v9 = v36;
          goto LABEL_45;
        }
        id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v34 = *MEMORY[0x1E4F502C8];
        uint64_t v41 = *MEMORY[0x1E4F28568];
        v25 = (BMSafariBrowsingAssistantVisualComponentInteractionInfo *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"visualComponentInteractionInfo"];
        v42 = v25;
        v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
        *int v11 = (id)[v35 initWithDomain:v34 code:2 userInfo:v29];

        v17 = 0;
      }
LABEL_43:
      v16 = self;
      v9 = v36;
      goto LABEL_44;
    }
    if (!a4)
    {
      v17 = 0;
      v16 = self;
LABEL_48:

      goto LABEL_49;
    }
    id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v22 = *MEMORY[0x1E4F502C8];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    v9 = (BMSafariBrowsingAssistantVisualComponent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"visualComponent"];
    v46 = v9;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    *a4 = (id)[v21 initWithDomain:v22 code:2 userInfo:v23];

    v17 = 0;
    id v13 = v8;
LABEL_23:
    v16 = self;
LABEL_47:

    v8 = v13;
    goto LABEL_48;
  }
  if (a4)
  {
    id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v20 = *MEMORY[0x1E4F502C8];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    id v13 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"webpageViewIdentifier"];
    v48[0] = v13;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
    id v7 = 0;
    v17 = 0;
    *a4 = (id)[v19 initWithDomain:v20 code:2 userInfo:v9];
    goto LABEL_23;
  }
  id v7 = 0;
  v17 = 0;
  v16 = self;
LABEL_49:

  return v17;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariBrowsingAssistantUserInteractionDetected *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_webpageViewIdentifier) {
    PBDataWriterWriteDataField();
  }
  if (self->_visualComponent)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantVisualComponent *)self->_visualComponent writeTo:v4];
    PBDataWriterRecallMark();
  }
  PBDataWriterWriteUint32Field();
  if (self->_visualComponentInteractionInfo)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantVisualComponentInteractionInfo *)self->_visualComponentInteractionInfo writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)BMSafariBrowsingAssistantUserInteractionDetected;
  id v5 = [(BMEventBase *)&v32 init];
  if (!v5) {
    goto LABEL_46;
  }
  v6 = (int *)MEMORY[0x1E4F940E8];
  id v7 = (int *)MEMORY[0x1E4F940E0];
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
      switch((v12 >> 3))
      {
        case 1u:
          uint64_t v19 = PBReaderReadData();
          webpageViewIdentifier = v5->_webpageViewIdentifier;
          v5->_webpageViewIdentifier = (NSData *)v19;

          continue;
        case 2u:
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_45;
          }
          id v21 = [[BMSafariBrowsingAssistantVisualComponent alloc] initByReadFrom:v4];
          if (!v21) {
            goto LABEL_45;
          }
          uint64_t v22 = 32;
          goto LABEL_36;
        case 3u:
          char v23 = 0;
          unsigned int v24 = 0;
          uint64_t v25 = 0;
          break;
        case 4u:
          uint64_t v33 = 0;
          uint64_t v34 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_45;
          }
          id v21 = [[BMSafariBrowsingAssistantVisualComponentInteractionInfo alloc] initByReadFrom:v4];
          if (!v21) {
            goto LABEL_45;
          }
          uint64_t v22 = 40;
LABEL_36:
          v29 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = v21;

          PBReaderRecallMark();
          continue;
        default:
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_45;
          }
          continue;
      }
      while (1)
      {
        uint64_t v26 = *v6;
        unint64_t v27 = *(void *)&v4[v26];
        if (v27 == -1 || v27 >= *(void *)&v4[*v7]) {
          break;
        }
        char v28 = *(unsigned char *)(*(void *)&v4[*v9] + v27);
        *(void *)&v4[v26] = v27 + 1;
        v25 |= (unint64_t)(v28 & 0x7F) << v23;
        if ((v28 & 0x80) == 0) {
          goto LABEL_38;
        }
        v23 += 7;
        BOOL v16 = v24++ >= 9;
        if (v16)
        {
          LODWORD(v25) = 0;
          goto LABEL_40;
        }
      }
      v4[*v8] = 1;
LABEL_38:
      if (v4[*v8]) {
        LODWORD(v25) = 0;
      }
LABEL_40:
      if (v25 >= 5) {
        LODWORD(v25) = 0;
      }
      v5->_userInteractionType = v25;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_45:
  }
    id v30 = 0;
  else {
LABEL_46:
  }
    id v30 = v5;

  return v30;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self webpageViewIdentifier];
  id v5 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self visualComponent];
  v6 = BMSafariBrowsingAssistantUserInteractionTypeAsString([(BMSafariBrowsingAssistantUserInteractionDetected *)self userInteractionType]);
  id v7 = [(BMSafariBrowsingAssistantUserInteractionDetected *)self visualComponentInteractionInfo];
  v8 = (void *)[v3 initWithFormat:@"BMSafariBrowsingAssistantUserInteractionDetected with webpageViewIdentifier: %@, visualComponent: %@, userInteractionType: %@, visualComponentInteractionInfo: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMSafariBrowsingAssistantUserInteractionDetected)initWithWebpageViewIdentifier:(id)a3 visualComponent:(id)a4 userInteractionType:(int)a5 visualComponentInteractionInfo:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v16.receiver = self;
  v16.super_class = (Class)BMSafariBrowsingAssistantUserInteractionDetected;
  unint64_t v14 = [(BMEventBase *)&v16 init];
  if (v14)
  {
    v14->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v14->_webpageViewIdentifier, a3);
    objc_storeStrong((id *)&v14->_visualComponent, a4);
    v14->_userInteractionType = a5;
    objc_storeStrong((id *)&v14->_visualComponentInteractionInfo, a6);
  }

  return v14;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"webpageViewIdentifier" number:1 type:14 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visualComponent" number:2 type:14 subMessageClass:objc_opt_class()];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"userInteractionType" number:3 type:4 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visualComponentInteractionInfo" number:4 type:14 subMessageClass:objc_opt_class()];
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5640;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"webpageViewIdentifier" dataType:4 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"visualComponent_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_610];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"userInteractionType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"visualComponentInteractionInfo_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_612];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

id __59__BMSafariBrowsingAssistantUserInteractionDetected_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 visualComponentInteractionInfo];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __59__BMSafariBrowsingAssistantUserInteractionDetected_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 visualComponent];
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

    v8 = [[BMSafariBrowsingAssistantUserInteractionDetected alloc] initByReadFrom:v7];
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