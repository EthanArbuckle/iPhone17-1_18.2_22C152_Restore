@interface BMSafariBrowsingAssistantResponseData
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariBrowsingAssistantResponseData)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSafariBrowsingAssistantResponseData)initWithSummaryText:(id)a3 tableOfContentsTexts:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSArray)tableOfContentsTexts;
- (NSString)description;
- (NSString)summaryText;
- (id)_tableOfContentsTextsJSONArray;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariBrowsingAssistantResponseData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableOfContentsTexts, 0);

  objc_storeStrong((id *)&self->_summaryText, 0);
}

- (NSArray)tableOfContentsTexts
{
  return self->_tableOfContentsTexts;
}

- (NSString)summaryText
{
  return self->_summaryText;
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
    v6 = [(BMSafariBrowsingAssistantResponseData *)self summaryText];
    uint64_t v7 = [v5 summaryText];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariBrowsingAssistantResponseData *)self summaryText];
      v10 = [v5 summaryText];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(BMSafariBrowsingAssistantResponseData *)self tableOfContentsTexts];
    v14 = [v5 tableOfContentsTexts];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMSafariBrowsingAssistantResponseData *)self tableOfContentsTexts];
      v16 = [v5 tableOfContentsTexts];
      char v12 = [v15 isEqual:v16];
    }
    goto LABEL_11;
  }
  char v12 = 0;
LABEL_12:

  return v12;
}

- (id)jsonDictionary
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSafariBrowsingAssistantResponseData *)self summaryText];
  id v4 = [(BMSafariBrowsingAssistantResponseData *)self _tableOfContentsTextsJSONArray];
  v9[0] = @"summaryText";
  id v5 = v3;
  if (!v3)
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  v9[1] = @"tableOfContentsTexts";
  v10[0] = v5;
  v6 = v4;
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  if (v4)
  {
    if (v3) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v3) {
      goto LABEL_7;
    }
  }

LABEL_7:

  return v7;
}

- (id)_tableOfContentsTextsJSONArray
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(BMSafariBrowsingAssistantResponseData *)self tableOfContentsTexts];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BMSafariBrowsingAssistantResponseData)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"summaryText"];
  id v40 = v6;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (a4)
      {
        id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v30 = *MEMORY[0x1E4F502C8];
        uint64_t v52 = *MEMORY[0x1E4F28568];
        id v9 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"summaryText"];
        v53[0] = v9;
        v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:&v52 count:1];
        id v31 = (id)[v29 initWithDomain:v30 code:2 userInfo:v14];
        id v8 = 0;
        v20 = 0;
        *a4 = v31;
        goto LABEL_27;
      }
      id v8 = 0;
      v20 = 0;
      goto LABEL_29;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  id v9 = [v6 objectForKeyedSubscript:@"tableOfContentsTexts"];
  long long v10 = [MEMORY[0x1E4F1CA98] null];
  int v11 = [v9 isEqual:v10];

  if (v11)
  {
    long long v12 = v7;
    id v13 = v8;
    v39 = a4;

    id v9 = 0;
LABEL_9:
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v9 = v9;
    uint64_t v15 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (!v15) {
      goto LABEL_18;
    }
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v42;
    v38 = self;
LABEL_11:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v42 != v17) {
        objc_enumerationMutation(v9);
      }
      uint64_t v19 = *(void *)(*((void *)&v41 + 1) + 8 * v18);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v21 = v39;
        id v8 = v13;
        uint64_t v7 = v12;
        if (v39)
        {
          id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v23 = *MEMORY[0x1E4F502C8];
          uint64_t v45 = *MEMORY[0x1E4F28568];
          v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"tableOfContentsTexts"];
          v46 = v24;
          v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
          v26 = v27;
LABEL_25:
          id *v21 = (id)[v26 initWithDomain:v23 code:2 userInfo:v25];
        }
        goto LABEL_26;
      }
      [v14 addObject:v19];
      if (v16 == ++v18)
      {
        uint64_t v16 = [v9 countByEnumeratingWithState:&v41 objects:v49 count:16];
        self = v38;
        if (v16) {
          goto LABEL_11;
        }
LABEL_18:

        id v8 = v13;
        self = [(BMSafariBrowsingAssistantResponseData *)self initWithSummaryText:v13 tableOfContentsTexts:v14];
        v20 = self;
        uint64_t v7 = v12;
LABEL_27:

        goto LABEL_28;
      }
    }
    v21 = v39;
    id v8 = v13;
    uint64_t v7 = v12;
    if (v39)
    {
      id v22 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v23 = *MEMORY[0x1E4F502C8];
      uint64_t v47 = *MEMORY[0x1E4F28568];
      v24 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type null for element of %@, must not be null", @"tableOfContentsTexts"];
      v48 = v24;
      v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      v26 = v22;
      goto LABEL_25;
    }
LABEL_26:

    v20 = 0;
    self = v38;
    goto LABEL_27;
  }
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    long long v12 = v7;
    id v13 = v8;
    v39 = a4;
    goto LABEL_9;
  }
  if (a4)
  {
    id v32 = objc_alloc(MEMORY[0x1E4F28C58]);
    v33 = a4;
    v34 = self;
    uint64_t v35 = *MEMORY[0x1E4F502C8];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    v14 = (void *)[[NSString alloc] initWithFormat:@"Expecting %@ as an array", @"tableOfContentsTexts"];
    v51 = v14;
    v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
    uint64_t v37 = v35;
    self = v34;
    id *v33 = (id)[v32 initWithDomain:v37 code:2 userInfo:v36];

    v20 = 0;
    goto LABEL_27;
  }
  v20 = 0;
LABEL_28:

  id v6 = v40;
LABEL_29:

  return v20;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariBrowsingAssistantResponseData *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_summaryText) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = self->_tableOfContentsTexts;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BMSafariBrowsingAssistantResponseData;
  uint64_t v5 = [(BMEventBase *)&v28 init];
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v6 = objc_opt_new();
  uint64_t v7 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v8 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v9 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    long long v10 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (v4[*v9]) {
        goto LABEL_27;
      }
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *v7;
        unint64_t v15 = *(void *)&v4[v14];
        if (v15 == -1 || v15 >= *(void *)&v4[*v8]) {
          break;
        }
        char v16 = *(unsigned char *)(*(void *)&v4[*v10] + v15);
        *(void *)&v4[v14] = v15 + 1;
        v13 |= (unint64_t)(v16 & 0x7F) << v11;
        if ((v16 & 0x80) == 0) {
          goto LABEL_13;
        }
        v11 += 7;
        if (v12++ >= 9)
        {
          unint64_t v13 = 0;
          int v18 = v4[*v9];
          goto LABEL_15;
        }
      }
      v4[*v9] = 1;
LABEL_13:
      int v18 = v4[*v9];
      if (v4[*v9]) {
        unint64_t v13 = 0;
      }
LABEL_15:
      if (v18 || (v13 & 7) == 4) {
        goto LABEL_27;
      }
      if ((v13 >> 3) == 2) {
        break;
      }
      if ((v13 >> 3) == 1)
      {
        uint64_t v20 = PBReaderReadString();
        summaryText = v5->_summaryText;
        v5->_summaryText = (NSString *)v20;
LABEL_24:

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
LABEL_31:

        goto LABEL_28;
      }
LABEL_26:
      if (*(void *)&v4[*v7] >= *(void *)&v4[*v8]) {
        goto LABEL_27;
      }
    }
    uint64_t v22 = PBReaderReadString();
    if (!v22) {
      goto LABEL_31;
    }
    summaryText = (void *)v22;
    [v6 addObject:v22];
    goto LABEL_24;
  }
LABEL_27:
  uint64_t v23 = [v6 copy];
  tableOfContentsTexts = v5->_tableOfContentsTexts;
  v5->_tableOfContentsTexts = (NSArray *)v23;

  int v25 = v4[*v9];
  if (v25) {
LABEL_28:
  }
    v26 = 0;
  else {
LABEL_29:
  }
    v26 = v5;

  return v26;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSafariBrowsingAssistantResponseData *)self summaryText];
  uint64_t v5 = [(BMSafariBrowsingAssistantResponseData *)self tableOfContentsTexts];
  uint64_t v6 = (void *)[v3 initWithFormat:@"BMSafariBrowsingAssistantResponseData with summaryText: %@, tableOfContentsTexts: %@", v4, v5];

  return (NSString *)v6;
}

- (BMSafariBrowsingAssistantResponseData)initWithSummaryText:(id)a3 tableOfContentsTexts:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMSafariBrowsingAssistantResponseData;
  uint64_t v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_summaryText, a3);
    objc_storeStrong((id *)&v9->_tableOfContentsTexts, a4);
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"summaryText" number:1 type:13 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"tableOfContentsTexts" number:2 type:13 subMessageClass:0];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF56D0;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"summaryText" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"tableOfContentsTexts_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_803];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __48__BMSafariBrowsingAssistantResponseData_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 _tableOfContentsTextsJSONArray];
  id v4 = BMConvertObjectToJSONString();

  return v4;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    id v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSafariBrowsingAssistantResponseData alloc] initByReadFrom:v7];
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