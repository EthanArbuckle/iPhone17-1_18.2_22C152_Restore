@interface BMSafariBrowsingAssistantVisualComponentPresentationContext
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariBrowsingAssistantVisualComponent)visualComponent;
- (BMSafariBrowsingAssistantVisualComponentPresentationContext)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSafariBrowsingAssistantVisualComponentPresentationContext)initWithWebpageViewIdentifier:(id)a3 visualComponent:(id)a4 started:(id)a5 ended:(id)a6;
- (BMSafariBrowsingAssistantVisualComponentPresentationEnded)ended;
- (BMSafariBrowsingAssistantVisualComponentPresentationStarted)started;
- (BOOL)isEqual:(id)a3;
- (NSData)webpageViewIdentifier;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariBrowsingAssistantVisualComponentPresentationContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ended, 0);
  objc_storeStrong((id *)&self->_started, 0);
  objc_storeStrong((id *)&self->_visualComponent, 0);

  objc_storeStrong((id *)&self->_webpageViewIdentifier, 0);
}

- (BMSafariBrowsingAssistantVisualComponentPresentationEnded)ended
{
  return self->_ended;
}

- (BMSafariBrowsingAssistantVisualComponentPresentationStarted)started
{
  return self->_started;
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
    v6 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self webpageViewIdentifier];
    uint64_t v7 = [v5 webpageViewIdentifier];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self webpageViewIdentifier];
      v10 = [v5 webpageViewIdentifier];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_13;
      }
    }
    v13 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self visualComponent];
    uint64_t v14 = [v5 visualComponent];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self visualComponent];
      v17 = [v5 visualComponent];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_13;
      }
    }
    v19 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self started];
    uint64_t v20 = [v5 started];
    if (v19 == (void *)v20)
    {
    }
    else
    {
      v21 = (void *)v20;
      v22 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self started];
      v23 = [v5 started];
      int v24 = [v22 isEqual:v23];

      if (!v24)
      {
LABEL_13:
        char v12 = 0;
LABEL_19:

        goto LABEL_20;
      }
    }
    v25 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self ended];
    v26 = [v5 ended];
    if (v25 == v26)
    {
      char v12 = 1;
    }
    else
    {
      v27 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self ended];
      v28 = [v5 ended];
      char v12 = [v27 isEqual:v28];
    }
    goto LABEL_19;
  }
  char v12 = 0;
LABEL_20:

  return v12;
}

- (id)jsonDictionary
{
  v18[4] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self webpageViewIdentifier];
  id v4 = [v3 base64EncodedStringWithOptions:0];

  id v5 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self visualComponent];
  v6 = [v5 jsonDictionary];

  uint64_t v7 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self started];
  v8 = [v7 jsonDictionary];

  v9 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self ended];
  v10 = [v9 jsonDictionary];

  v17[0] = @"webpageViewIdentifier";
  int v11 = v4;
  if (!v4)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[0] = v11;
  v17[1] = @"visualComponent";
  char v12 = v6;
  if (!v6)
  {
    char v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[1] = v12;
  v17[2] = @"started";
  v13 = v8;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[2] = v13;
  v17[3] = @"ended";
  uint64_t v14 = v10;
  if (!v10)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v18[3] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:4];
  if (v10)
  {
    if (v8) {
      goto LABEL_11;
    }
  }
  else
  {

    if (v8)
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

  return v15;
}

- (BMSafariBrowsingAssistantVisualComponentPresentationContext)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v48[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 objectForKeyedSubscript:@"webpageViewIdentifier"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        v15 = 0;
        id v7 = 0;
        uint64_t v14 = self;
        goto LABEL_47;
      }
      id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v22 = *MEMORY[0x1E4F502C8];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      id v16 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"webpageViewIdentifier"];
      v48[0] = v16;
      v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:&v47 count:1];
      v15 = 0;
      id v7 = 0;
      *a4 = (id)[v21 initWithDomain:v22 code:2 userInfo:v9];
      goto LABEL_36;
    }
    id v7 = v6;
  }
  else
  {
    id v7 = 0;
  }
  v8 = [v5 objectForKeyedSubscript:@"visualComponent"];
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = 0;
LABEL_7:
    v10 = [v5 objectForKeyedSubscript:@"started"];
    id v36 = v7;
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v15 = 0;
          uint64_t v14 = self;
          goto LABEL_44;
        }
        id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v29 = *MEMORY[0x1E4F502C8];
        uint64_t v43 = *MEMORY[0x1E4F28568];
        int v11 = (BMSafariBrowsingAssistantVisualComponentPresentationStarted *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"started"];
        v44 = v11;
        id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        v15 = 0;
        *a4 = (id)[v32 initWithDomain:v29 code:2 userInfo:v12];
        goto LABEL_42;
      }
      id v12 = v10;
      id v39 = 0;
      int v11 = [[BMSafariBrowsingAssistantVisualComponentPresentationStarted alloc] initWithJSONDictionary:v12 error:&v39];
      id v19 = v39;
      if (v19)
      {
        uint64_t v20 = v19;
        if (a4) {
          *a4 = v19;
        }

LABEL_41:
        v15 = 0;
LABEL_42:
        uint64_t v14 = self;
        goto LABEL_43;
      }
    }
    else
    {
      int v11 = 0;
    }
    id v12 = [v5 objectForKeyedSubscript:@"ended"];
    if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v13 = 0;
LABEL_13:
      uint64_t v14 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self initWithWebpageViewIdentifier:v36 visualComponent:v9 started:v11 ended:v13];
      v15 = v14;
LABEL_14:

LABEL_43:
LABEL_44:

      id v16 = v8;
      id v7 = v36;
      goto LABEL_45;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = v9;
      id v23 = v12;
      id v38 = 0;
      v13 = [[BMSafariBrowsingAssistantVisualComponentPresentationEnded alloc] initWithJSONDictionary:v23 error:&v38];
      id v24 = v38;
      if (v24)
      {
        v25 = v24;
        if (a4) {
          *a4 = v24;
        }

        v15 = 0;
        uint64_t v14 = self;
        v9 = v34;
        goto LABEL_14;
      }

      v9 = v34;
      goto LABEL_13;
    }
    if (a4)
    {
      id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v33 = *MEMORY[0x1E4F502C8];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v13 = (BMSafariBrowsingAssistantVisualComponentPresentationEnded *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"ended"];
      v42 = v13;
      v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      *a4 = (id)[v35 initWithDomain:v33 code:2 userInfo:v30];

      v15 = 0;
      uint64_t v14 = self;
      goto LABEL_14;
    }
    goto LABEL_41;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v16 = v8;
    id v40 = 0;
    v9 = [[BMSafariBrowsingAssistantVisualComponent alloc] initWithJSONDictionary:v16 error:&v40];
    id v17 = v40;
    if (!v17)
    {

      goto LABEL_7;
    }
    int v18 = v17;
    if (a4) {
      *a4 = v17;
    }

    v15 = 0;
  }
  else
  {
    if (!a4)
    {
      v15 = 0;
      uint64_t v14 = self;
      goto LABEL_46;
    }
    id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v27 = *MEMORY[0x1E4F502C8];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    v9 = (BMSafariBrowsingAssistantVisualComponent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"visualComponent"];
    v46 = v9;
    v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    *a4 = (id)[v26 initWithDomain:v27 code:2 userInfo:v28];

    v15 = 0;
    id v16 = v8;
  }
LABEL_36:
  uint64_t v14 = self;
LABEL_45:

  v8 = v16;
LABEL_46:

LABEL_47:
  return v15;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self writeTo:v3];
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
  if (self->_started)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantVisualComponentPresentationStarted *)self->_started writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_ended)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantVisualComponentPresentationEnded *)self->_ended writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BMSafariBrowsingAssistantVisualComponentPresentationContext;
  id v5 = [(BMEventBase *)&v26 init];
  if (!v5) {
    goto LABEL_36;
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
        if (v11++ >= 9)
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

          break;
        case 2u:
          uint64_t v27 = 0;
          uint64_t v28 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_35;
          }
          id v21 = [[BMSafariBrowsingAssistantVisualComponent alloc] initByReadFrom:v4];
          if (!v21) {
            goto LABEL_35;
          }
          uint64_t v22 = 32;
          goto LABEL_32;
        case 3u:
          uint64_t v27 = 0;
          uint64_t v28 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_35;
          }
          id v21 = [[BMSafariBrowsingAssistantVisualComponentPresentationStarted alloc] initByReadFrom:v4];
          if (!v21) {
            goto LABEL_35;
          }
          uint64_t v22 = 40;
          goto LABEL_32;
        case 4u:
          uint64_t v27 = 0;
          uint64_t v28 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_35;
          }
          id v21 = [[BMSafariBrowsingAssistantVisualComponentPresentationEnded alloc] initByReadFrom:v4];
          if (!v21) {
            goto LABEL_35;
          }
          uint64_t v22 = 48;
LABEL_32:
          id v23 = *(Class *)((char *)&v5->super.super.isa + v22);
          *(Class *)((char *)&v5->super.super.isa + v22) = v21;

          PBReaderRecallMark();
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
    id v24 = 0;
  else {
LABEL_36:
  }
    id v24 = v5;

  return v24;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self webpageViewIdentifier];
  id v5 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self visualComponent];
  v6 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self started];
  id v7 = [(BMSafariBrowsingAssistantVisualComponentPresentationContext *)self ended];
  v8 = (void *)[v3 initWithFormat:@"BMSafariBrowsingAssistantVisualComponentPresentationContext with webpageViewIdentifier: %@, visualComponent: %@, started: %@, ended: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMSafariBrowsingAssistantVisualComponentPresentationContext)initWithWebpageViewIdentifier:(id)a3 visualComponent:(id)a4 started:(id)a5 ended:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BMSafariBrowsingAssistantVisualComponentPresentationContext;
  char v15 = [(BMEventBase *)&v17 init];
  if (v15)
  {
    v15->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v15->_webpageViewIdentifier, a3);
    objc_storeStrong((id *)&v15->_visualComponent, a4);
    objc_storeStrong((id *)&v15->_started, a5);
    objc_storeStrong((id *)&v15->_ended, a6);
  }

  return v15;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"webpageViewIdentifier" number:1 type:14 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visualComponent" number:2 type:14 subMessageClass:objc_opt_class()];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"started" number:3 type:14 subMessageClass:objc_opt_class()];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"ended" number:4 type:14 subMessageClass:objc_opt_class()];
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF55B0;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"webpageViewIdentifier" dataType:4 requestOnly:0 fieldNumber:1 protoDataType:14 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"visualComponent_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_391];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"started_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_393];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"ended_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_395];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

id __70__BMSafariBrowsingAssistantVisualComponentPresentationContext_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 ended];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __70__BMSafariBrowsingAssistantVisualComponentPresentationContext_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 started];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __70__BMSafariBrowsingAssistantVisualComponentPresentationContext_columns__block_invoke(uint64_t a1, void *a2)
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

    v8 = [[BMSafariBrowsingAssistantVisualComponentPresentationContext alloc] initByReadFrom:v7];
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