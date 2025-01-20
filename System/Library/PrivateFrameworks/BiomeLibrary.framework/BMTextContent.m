@interface BMTextContent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMCustomAttributes)metadata;
- (BMTextContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMTextContent)initWithText:(id)a3 metadata:(id)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)text;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMTextContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (BMCustomAttributes)metadata
{
  return self->_metadata;
}

- (NSString)text
{
  return self->_text;
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
    v6 = [(BMTextContent *)self text];
    uint64_t v7 = [v5 text];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMTextContent *)self text];
      v10 = [v5 text];
      int v11 = [v9 isEqual:v10];

      if (!v11)
      {
        char v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    v13 = [(BMTextContent *)self metadata];
    v14 = [v5 metadata];
    if (v13 == v14)
    {
      char v12 = 1;
    }
    else
    {
      v15 = [(BMTextContent *)self metadata];
      v16 = [v5 metadata];
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
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [(BMTextContent *)self text];
  id v4 = [(BMTextContent *)self metadata];
  id v5 = [v4 jsonDictionary];

  v10[0] = @"text";
  v6 = v3;
  if (!v3)
  {
    v6 = [MEMORY[0x1E4F1CA98] null];
  }
  v10[1] = @"metadata";
  v11[0] = v6;
  uint64_t v7 = v5;
  if (!v5)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  if (v5)
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

  return v8;
}

- (BMTextContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"text"];
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (!a4)
      {
        int v11 = 0;
        id v8 = 0;
        goto LABEL_10;
      }
      id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v17 = *MEMORY[0x1E4F502C8];
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v9 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"text"];
      v26[0] = v9;
      v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      id v18 = (id)[v16 initWithDomain:v17 code:2 userInfo:v10];
      int v11 = 0;
      id v8 = 0;
      *a4 = v18;
      goto LABEL_8;
    }
    id v8 = v7;
  }
  else
  {
    id v8 = 0;
  }
  v9 = [v6 objectForKeyedSubscript:@"metadata"];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = 0;
LABEL_7:
    self = [(BMTextContent *)self initWithText:v8 metadata:v10];
    int v11 = self;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v9;
    id v22 = 0;
    v10 = [[BMCustomAttributes alloc] initWithJSONDictionary:v13 error:&v22];
    id v14 = v22;
    if (v14)
    {
      v15 = v14;
      if (a4) {
        *a4 = v14;
      }

      int v11 = 0;
      v9 = v13;
      goto LABEL_8;
    }

    goto LABEL_7;
  }
  if (!a4)
  {
    int v11 = 0;
    goto LABEL_9;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v19 = *MEMORY[0x1E4F502C8];
  uint64_t v23 = *MEMORY[0x1E4F28568];
  v10 = (BMCustomAttributes *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"metadata"];
  v24 = v10;
  v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
  *a4 = (id)[v21 initWithDomain:v19 code:2 userInfo:v20];

  int v11 = 0;
LABEL_8:

LABEL_9:
LABEL_10:

  return v11;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMTextContent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_text) {
    PBDataWriterWriteStringField();
  }
  if (self->_metadata)
  {
    PBDataWriterPlaceMark();
    [(BMCustomAttributes *)self->_metadata writeTo:v4];
    PBDataWriterRecallMark();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BMTextContent;
  id v5 = [(BMEventBase *)&v26 init];
  if (!v5) {
    goto LABEL_29;
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
      if ((v12 >> 3) == 2)
      {
        uint64_t v27 = 0;
        uint64_t v28 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_28;
        }
        id v22 = [[BMCustomAttributes alloc] initByReadFrom:v4];
        if (!v22) {
          goto LABEL_28;
        }
        metadata = v5->_metadata;
        v5->_metadata = v22;

        PBReaderRecallMark();
      }
      else if ((v12 >> 3) == 1)
      {
        uint64_t v20 = PBReaderReadString();
        text = v5->_text;
        v5->_text = (NSString *)v20;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_28;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_28:
  }
    v24 = 0;
  else {
LABEL_29:
  }
    v24 = v5;

  return v24;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMTextContent *)self text];
  id v5 = [(BMTextContent *)self metadata];
  id v6 = (void *)[v3 initWithFormat:@"BMTextContent with text: %@, metadata: %@", v4, v5];

  return (NSString *)v6;
}

- (BMTextContent)initWithText:(id)a3 metadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BMTextContent;
  v9 = [(BMEventBase *)&v11 init];
  if (v9)
  {
    v9->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v9->_text, a3);
    objc_storeStrong((id *)&v9->_metadata, a4);
  }

  return v9;
}

+ (id)protoFields
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"text" number:1 type:13 subMessageClass:0];
  v6[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"metadata" number:2 type:14 subMessageClass:objc_opt_class()];
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF4488;
}

+ (id)columns
{
  v6[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"text" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"metadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_230_25098];
  v6[0] = v2;
  v6[1] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];

  return v4;
}

id __24__BMTextContent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 metadata];
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

    id v8 = [[BMTextContent alloc] initByReadFrom:v7];
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