@interface BMFeedbackTextToImageEvaluationData
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMEvaluationCommonMetadata)commonMetadata;
- (BMFeedbackTextToImageEvaluationData)initWithCommonMetadata:(id)a3 originalContent:(id)a4 generatedContent:(id)a5;
- (BMFeedbackTextToImageEvaluationData)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMImageContent)generatedContent;
- (BMTextContent)originalContent;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMFeedbackTextToImageEvaluationData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedContent, 0);
  objc_storeStrong((id *)&self->_originalContent, 0);

  objc_storeStrong((id *)&self->_commonMetadata, 0);
}

- (BMImageContent)generatedContent
{
  return self->_generatedContent;
}

- (BMTextContent)originalContent
{
  return self->_originalContent;
}

- (BMEvaluationCommonMetadata)commonMetadata
{
  return self->_commonMetadata;
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
    v6 = [(BMFeedbackTextToImageEvaluationData *)self commonMetadata];
    uint64_t v7 = [v5 commonMetadata];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMFeedbackTextToImageEvaluationData *)self commonMetadata];
      v10 = [v5 commonMetadata];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMFeedbackTextToImageEvaluationData *)self originalContent];
    uint64_t v14 = [v5 originalContent];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMFeedbackTextToImageEvaluationData *)self originalContent];
      v17 = [v5 originalContent];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMFeedbackTextToImageEvaluationData *)self generatedContent];
    v20 = [v5 generatedContent];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMFeedbackTextToImageEvaluationData *)self generatedContent];
      v22 = [v5 generatedContent];
      char v12 = [v21 isEqual:v22];
    }
    goto LABEL_15;
  }
  char v12 = 0;
LABEL_16:

  return v12;
}

- (id)jsonDictionary
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMFeedbackTextToImageEvaluationData *)self commonMetadata];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMFeedbackTextToImageEvaluationData *)self originalContent];
  v6 = [v5 jsonDictionary];

  uint64_t v7 = [(BMFeedbackTextToImageEvaluationData *)self generatedContent];
  v8 = [v7 jsonDictionary];

  v14[0] = @"commonMetadata";
  v9 = v4;
  if (!v4)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[0] = v9;
  v14[1] = @"originalContent";
  v10 = v6;
  if (!v6)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[1] = v10;
  v14[2] = @"generatedContent";
  int v11 = v8;
  if (!v8)
  {
    int v11 = [MEMORY[0x1E4F1CA98] null];
  }
  v15[2] = v11;
  char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  if (v8)
  {
    if (v6) {
      goto LABEL_9;
    }
LABEL_14:

    if (v4) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v6) {
    goto LABEL_14;
  }
LABEL_9:
  if (v4) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v12;
}

- (BMFeedbackTextToImageEvaluationData)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v39[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"commonMetadata"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v33 = 0;
    v8 = [[BMEvaluationCommonMetadata alloc] initWithJSONDictionary:v9 error:&v33];
    id v15 = v33;
    if (v15)
    {
      v16 = v15;
      if (a4) {
        *a4 = v15;
      }

      goto LABEL_34;
    }

LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"originalContent"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v9;
      id v32 = 0;
      v10 = [[BMTextContent alloc] initWithJSONDictionary:v11 error:&v32];
      id v17 = v32;
      if (v17)
      {
        int v18 = v17;
        if (a4) {
          *a4 = v17;
        }

        goto LABEL_37;
      }

LABEL_7:
      id v11 = [v6 objectForKeyedSubscript:@"generatedContent"];
      if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        char v12 = 0;
LABEL_10:
        self = [(BMFeedbackTextToImageEvaluationData *)self initWithCommonMetadata:v8 originalContent:v10 generatedContent:v12];
        v13 = self;
LABEL_11:

LABEL_12:
        goto LABEL_13;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v28 = a4;
        id v19 = v11;
        id v31 = 0;
        char v12 = [[BMImageContent alloc] initWithJSONDictionary:v19 error:&v31];
        id v20 = v31;
        if (v20)
        {
          v21 = v20;
          if (v28) {
            id *v28 = v20;
          }

          v13 = 0;
          goto LABEL_11;
        }

        goto LABEL_10;
      }
      if (a4)
      {
        id v30 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v34 = *MEMORY[0x1E4F28568];
        char v12 = (BMImageContent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"generatedContent"];
        v35 = v12;
        v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
        *a4 = (id)[v30 initWithDomain:v27 code:2 userInfo:v26];

        v13 = 0;
        goto LABEL_11;
      }
LABEL_37:
      v13 = 0;
      goto LABEL_12;
    }
    if (a4)
    {
      id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v24 = *MEMORY[0x1E4F502C8];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      v10 = (BMTextContent *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"originalContent"];
      v37 = v10;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      id v25 = (id)[v29 initWithDomain:v24 code:2 userInfo:v11];
      v13 = 0;
      *a4 = v25;
      goto LABEL_12;
    }
LABEL_34:
    v13 = 0;
    goto LABEL_13;
  }
  if (!a4)
  {
    v13 = 0;
    goto LABEL_14;
  }
  id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v23 = *MEMORY[0x1E4F502C8];
  uint64_t v38 = *MEMORY[0x1E4F28568];
  v8 = (BMEvaluationCommonMetadata *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"commonMetadata"];
  v39[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:&v38 count:1];
  v13 = 0;
  *a4 = (id)[v22 initWithDomain:v23 code:2 userInfo:v9];
LABEL_13:

LABEL_14:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMFeedbackTextToImageEvaluationData *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_commonMetadata)
  {
    PBDataWriterPlaceMark();
    [(BMEvaluationCommonMetadata *)self->_commonMetadata writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_originalContent)
  {
    PBDataWriterPlaceMark();
    [(BMTextContent *)self->_originalContent writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_generatedContent)
  {
    PBDataWriterPlaceMark();
    [(BMImageContent *)self->_generatedContent writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)BMFeedbackTextToImageEvaluationData;
  id v5 = [(BMEventBase *)&v25 init];
  if (!v5) {
    goto LABEL_36;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  v8 = (int *)MEMORY[0x1E4F940C8];
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
      unint64_t v19 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        uint64_t v26 = 0;
        uint64_t v27 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_35;
        }
        id v20 = [[BMImageContent alloc] initByReadFrom:v4];
        if (!v20) {
          goto LABEL_35;
        }
        uint64_t v21 = 40;
      }
      else if (v19 == 2)
      {
        uint64_t v26 = 0;
        uint64_t v27 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_35;
        }
        id v20 = [[BMTextContent alloc] initByReadFrom:v4];
        if (!v20) {
          goto LABEL_35;
        }
        uint64_t v21 = 32;
      }
      else
      {
        if (v19 != 1)
        {
          if (!PBReaderSkipValueWithTag()) {
            goto LABEL_35;
          }
          continue;
        }
        uint64_t v26 = 0;
        uint64_t v27 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_35;
        }
        id v20 = [[BMEvaluationCommonMetadata alloc] initByReadFrom:v4];
        if (!v20) {
          goto LABEL_35;
        }
        uint64_t v21 = 24;
      }
      id v22 = *(Class *)((char *)&v5->super.super.isa + v21);
      *(Class *)((char *)&v5->super.super.isa + v21) = v20;

      PBReaderRecallMark();
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_35:
  }
    uint64_t v23 = 0;
  else {
LABEL_36:
  }
    uint64_t v23 = v5;

  return v23;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMFeedbackTextToImageEvaluationData *)self commonMetadata];
  id v5 = [(BMFeedbackTextToImageEvaluationData *)self originalContent];
  id v6 = [(BMFeedbackTextToImageEvaluationData *)self generatedContent];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMFeedbackTextToImageEvaluationData with commonMetadata: %@, originalContent: %@, generatedContent: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMFeedbackTextToImageEvaluationData)initWithCommonMetadata:(id)a3 originalContent:(id)a4 generatedContent:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMFeedbackTextToImageEvaluationData;
  unint64_t v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_commonMetadata, a3);
    objc_storeStrong((id *)&v12->_originalContent, a4);
    objc_storeStrong((id *)&v12->_generatedContent, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"commonMetadata" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"originalContent", 2, 14, objc_opt_class(), v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"generatedContent" number:3 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF38E8;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"commonMetadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_8896];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"originalContent_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_34];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"generatedContent_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_36];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __46__BMFeedbackTextToImageEvaluationData_columns__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 generatedContent];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __46__BMFeedbackTextToImageEvaluationData_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 originalContent];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __46__BMFeedbackTextToImageEvaluationData_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 commonMetadata];
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMFeedbackTextToImageEvaluationData alloc] initByReadFrom:v7];
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