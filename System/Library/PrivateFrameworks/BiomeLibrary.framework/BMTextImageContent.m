@interface BMTextImageContent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMCustomAttributes)metadata;
- (BMTextImageContent)initWithJSONDictionary:(id)a3 error:(id *)p_isa;
- (BMTextImageContent)initWithText:(id)a3 imageData:(id)a4 metadata:(id)a5;
- (BOOL)isEqual:(id)a3;
- (NSData)imageData;
- (NSString)description;
- (NSString)text;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMTextImageContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_imageData, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (BMCustomAttributes)metadata
{
  return self->_metadata;
}

- (NSData)imageData
{
  return self->_imageData;
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
    v6 = [(BMTextImageContent *)self text];
    uint64_t v7 = [v5 text];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMTextImageContent *)self text];
      v10 = [v5 text];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_9;
      }
    }
    v13 = [(BMTextImageContent *)self imageData];
    uint64_t v14 = [v5 imageData];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMTextImageContent *)self imageData];
      v17 = [v5 imageData];
      int v18 = [v16 isEqual:v17];

      if (!v18)
      {
LABEL_9:
        char v12 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    v19 = [(BMTextImageContent *)self metadata];
    v20 = [v5 metadata];
    if (v19 == v20)
    {
      char v12 = 1;
    }
    else
    {
      v21 = [(BMTextImageContent *)self metadata];
      v22 = [v5 metadata];
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
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMTextImageContent *)self text];
  id v4 = [(BMTextImageContent *)self imageData];
  id v5 = [v4 base64EncodedStringWithOptions:0];

  v6 = [(BMTextImageContent *)self metadata];
  uint64_t v7 = [v6 jsonDictionary];

  v13[0] = @"text";
  v8 = v3;
  if (!v3)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v8;
  v13[1] = @"imageData";
  v9 = v5;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v9;
  v13[2] = @"metadata";
  v10 = v7;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (v7)
  {
    if (v5) {
      goto LABEL_9;
    }
LABEL_14:

    if (v3) {
      goto LABEL_10;
    }
    goto LABEL_15;
  }

  if (!v5) {
    goto LABEL_14;
  }
LABEL_9:
  if (v3) {
    goto LABEL_10;
  }
LABEL_15:

LABEL_10:

  return v11;
}

- (BMTextImageContent)initWithJSONDictionary:(id)a3 error:(id *)p_isa
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"text"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v8 = 0;
LABEL_4:
    v9 = [v6 objectForKeyedSubscript:@"imageData"];
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!p_isa)
        {
          id v10 = 0;
          goto LABEL_29;
        }
        id v20 = objc_alloc(MEMORY[0x1E4F28C58]);
        v28 = p_isa;
        uint64_t v21 = *MEMORY[0x1E4F502C8];
        uint64_t v32 = *MEMORY[0x1E4F28568];
        int v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSData", objc_opt_class(), @"imageData"];
        v33 = v11;
        char v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
        id v22 = (id)[v20 initWithDomain:v21 code:2 userInfo:v12];
        p_isa = 0;
        id v10 = 0;
        id *v28 = v22;
        goto LABEL_27;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
    int v11 = [v6 objectForKeyedSubscript:@"metadata"];
    if (!v11 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      char v12 = 0;
LABEL_10:
      self = [(BMTextImageContent *)self initWithText:v8 imageData:v10 metadata:v12];
      p_isa = (id *)&self->super.super.isa;
LABEL_27:

LABEL_28:
      goto LABEL_29;
    }
    v27 = p_isa;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = v11;
      id v29 = 0;
      char v12 = [[BMCustomAttributes alloc] initWithJSONDictionary:v13 error:&v29];
      id v14 = v29;
      if (!v14)
      {

        goto LABEL_10;
      }
      v15 = v14;
      int v11 = v13;
      if (v27) {
        id *v27 = v14;
      }
    }
    else
    {
      if (!p_isa)
      {
        p_isa = 0;
        goto LABEL_28;
      }
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v25 = *MEMORY[0x1E4F502C8];
      uint64_t v30 = *MEMORY[0x1E4F28568];
      char v12 = (BMCustomAttributes *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"metadata"];
      v31 = v12;
      v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
      *p_isa = (id)[v26 initWithDomain:v25 code:2 userInfo:v23];
    }
    p_isa = 0;
    goto LABEL_27;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    goto LABEL_4;
  }
  if (!p_isa)
  {
    id v8 = 0;
    goto LABEL_30;
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v17 = *MEMORY[0x1E4F502C8];
  uint64_t v34 = *MEMORY[0x1E4F28568];
  id v10 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSString", objc_opt_class(), @"text"];
  v35[0] = v10;
  v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
  id v18 = (id)[v16 initWithDomain:v17 code:2 userInfo:v9];
  v19 = p_isa;
  p_isa = 0;
  id v8 = 0;
  id *v19 = v18;
LABEL_29:

LABEL_30:
  return (BMTextImageContent *)p_isa;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMTextImageContent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_text) {
    PBDataWriterWriteStringField();
  }
  if (self->_imageData) {
    PBDataWriterWriteDataField();
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
  v28.receiver = self;
  v28.super_class = (Class)BMTextImageContent;
  id v5 = [(BMEventBase *)&v28 init];
  if (!v5) {
    goto LABEL_32;
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
      unint64_t v20 = v12 >> 3;
      if ((v12 >> 3) == 3)
      {
        uint64_t v29 = 0;
        uint64_t v30 = 0;
        if ((PBReaderPlaceMark() & 1) == 0) {
          goto LABEL_31;
        }
        v23 = [[BMCustomAttributes alloc] initByReadFrom:v4];
        if (!v23) {
          goto LABEL_31;
        }
        metadata = v5->_metadata;
        v5->_metadata = v23;

        PBReaderRecallMark();
      }
      else
      {
        if (v20 == 2)
        {
          uint64_t v21 = PBReaderReadData();
          uint64_t v22 = 32;
        }
        else
        {
          if (v20 != 1)
          {
            if (!PBReaderSkipValueWithTag()) {
              goto LABEL_31;
            }
            continue;
          }
          uint64_t v21 = PBReaderReadString();
          uint64_t v22 = 24;
        }
        uint64_t v25 = *(Class *)((char *)&v5->super.super.isa + v22);
        *(Class *)((char *)&v5->super.super.isa + v22) = (Class)v21;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_31:
  }
    id v26 = 0;
  else {
LABEL_32:
  }
    id v26 = v5;

  return v26;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMTextImageContent *)self text];
  id v5 = [(BMTextImageContent *)self imageData];
  id v6 = [(BMTextImageContent *)self metadata];
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMTextImageContent with text: %@, imageData: %@, metadata: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMTextImageContent)initWithText:(id)a3 imageData:(id)a4 metadata:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BMTextImageContent;
  unint64_t v12 = [(BMEventBase *)&v14 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_text, a3);
    objc_storeStrong((id *)&v12->_imageData, a4);
    objc_storeStrong((id *)&v12->_metadata, a5);
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"text" number:1 type:13 subMessageClass:0];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"imageData", 2, 14, 0, v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"metadata" number:3 type:14 subMessageClass:objc_opt_class()];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF44B8;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"text" dataType:2 requestOnly:0 fieldNumber:1 protoDataType:13 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"imageData" dataType:4 requestOnly:0 fieldNumber:2 protoDataType:14 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"metadata_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_283];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __29__BMTextImageContent_columns__block_invoke(uint64_t a1, void *a2)
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
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMTextImageContent alloc] initByReadFrom:v7];
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