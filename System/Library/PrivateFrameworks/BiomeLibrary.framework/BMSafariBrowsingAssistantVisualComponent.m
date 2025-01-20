@interface BMSafariBrowsingAssistantVisualComponent
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariBrowsingAssistantVisualComponent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMSafariBrowsingAssistantVisualComponent)initWithVisualComponentAttribute:(id)a3 visualComponentData:(id)a4 identifier:(id)a5;
- (BMSafariBrowsingAssistantVisualComponentAttribute)visualComponentAttribute;
- (BMSafariBrowsingAssistantVisualComponentData)visualComponentData;
- (BOOL)hasIdentifier;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unint64_t)identifier;
- (unsigned)dataVersion;
- (void)setHasIdentifier:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariBrowsingAssistantVisualComponent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualComponentData, 0);

  objc_storeStrong((id *)&self->_visualComponentAttribute, 0);
}

- (void)setHasIdentifier:(BOOL)a3
{
  self->_hasIdentifier = a3;
}

- (BOOL)hasIdentifier
{
  return self->_hasIdentifier;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (BMSafariBrowsingAssistantVisualComponentData)visualComponentData
{
  return self->_visualComponentData;
}

- (BMSafariBrowsingAssistantVisualComponentAttribute)visualComponentAttribute
{
  return self->_visualComponentAttribute;
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
    v6 = [(BMSafariBrowsingAssistantVisualComponent *)self visualComponentAttribute];
    uint64_t v7 = [v5 visualComponentAttribute];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      v8 = (void *)v7;
      v9 = [(BMSafariBrowsingAssistantVisualComponent *)self visualComponentAttribute];
      v10 = [v5 visualComponentAttribute];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_16;
      }
    }
    v13 = [(BMSafariBrowsingAssistantVisualComponent *)self visualComponentData];
    uint64_t v14 = [v5 visualComponentData];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      v15 = (void *)v14;
      v16 = [(BMSafariBrowsingAssistantVisualComponent *)self visualComponentData];
      v17 = [v5 visualComponentData];
      int v18 = [v16 isEqual:v17];

      if (!v18) {
        goto LABEL_16;
      }
    }
    if (![(BMSafariBrowsingAssistantVisualComponent *)self hasIdentifier]
      && ![v5 hasIdentifier])
    {
      BOOL v12 = 1;
      goto LABEL_17;
    }
    if ([(BMSafariBrowsingAssistantVisualComponent *)self hasIdentifier]
      && [v5 hasIdentifier])
    {
      unint64_t v19 = [(BMSafariBrowsingAssistantVisualComponent *)self identifier];
      BOOL v12 = v19 == [v5 identifier];
LABEL_17:

      goto LABEL_18;
    }
LABEL_16:
    BOOL v12 = 0;
    goto LABEL_17;
  }
  BOOL v12 = 0;
LABEL_18:

  return v12;
}

- (id)jsonDictionary
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = [(BMSafariBrowsingAssistantVisualComponent *)self visualComponentAttribute];
  id v4 = [v3 jsonDictionary];

  id v5 = [(BMSafariBrowsingAssistantVisualComponent *)self visualComponentData];
  v6 = [v5 jsonDictionary];

  if ([(BMSafariBrowsingAssistantVisualComponent *)self hasIdentifier])
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMSafariBrowsingAssistantVisualComponent identifier](self, "identifier"));
  }
  else
  {
    uint64_t v7 = 0;
  }
  v13[0] = @"visualComponentAttribute";
  v8 = v4;
  if (!v4)
  {
    v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v8;
  v13[1] = @"visualComponentData";
  v9 = v6;
  if (!v6)
  {
    v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v9;
  v13[2] = @"identifier";
  v10 = v7;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v10;
  int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];
  if (v7)
  {
    if (v6) {
      goto LABEL_12;
    }
LABEL_17:

    if (v4) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  if (!v6) {
    goto LABEL_17;
  }
LABEL_12:
  if (v4) {
    goto LABEL_13;
  }
LABEL_18:

LABEL_13:

  return v11;
}

- (BMSafariBrowsingAssistantVisualComponent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"visualComponentAttribute"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = 0;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    id v29 = 0;
    v8 = [[BMSafariBrowsingAssistantVisualComponentAttribute alloc] initWithJSONDictionary:v9 error:&v29];
    id v15 = v29;
    if (v15)
    {
      v16 = v15;
      if (a4) {
        *a4 = v15;
      }

      goto LABEL_31;
    }

LABEL_4:
    id v9 = [v6 objectForKeyedSubscript:@"visualComponentData"];
    if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v10 = 0;
      goto LABEL_7;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v9;
      id v28 = 0;
      v10 = [[BMSafariBrowsingAssistantVisualComponentData alloc] initWithJSONDictionary:v12 error:&v28];
      id v17 = v28;
      if (v17)
      {
        int v18 = v17;
        if (a4) {
          *a4 = v17;
        }

        v13 = 0;
        goto LABEL_12;
      }

LABEL_7:
      int v11 = [v6 objectForKeyedSubscript:@"identifier"];
      if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v27 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v25 = *MEMORY[0x1E4F502C8];
            uint64_t v30 = *MEMORY[0x1E4F28568];
            v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"identifier"];
            v31 = v23;
            v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
            *a4 = (id)[v27 initWithDomain:v25 code:2 userInfo:v24];
          }
          v13 = 0;
          id v12 = 0;
          goto LABEL_11;
        }
        id v12 = v11;
      }
      else
      {
        id v12 = 0;
      }
      self = [(BMSafariBrowsingAssistantVisualComponent *)self initWithVisualComponentAttribute:v8 visualComponentData:v10 identifier:v12];
      v13 = self;
LABEL_11:

LABEL_12:
      goto LABEL_13;
    }
    if (a4)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v21 = *MEMORY[0x1E4F502C8];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      v10 = (BMSafariBrowsingAssistantVisualComponentData *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"visualComponentData"];
      v33 = v10;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      id v22 = (id)[v26 initWithDomain:v21 code:2 userInfo:v12];
      v13 = 0;
      *a4 = v22;
      goto LABEL_12;
    }
LABEL_31:
    v13 = 0;
    goto LABEL_13;
  }
  if (!a4)
  {
    v13 = 0;
    goto LABEL_14;
  }
  id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v20 = *MEMORY[0x1E4F502C8];
  uint64_t v34 = *MEMORY[0x1E4F28568];
  v8 = (BMSafariBrowsingAssistantVisualComponentAttribute *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSDictionary", objc_opt_class(), @"visualComponentAttribute"];
  v35[0] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:&v34 count:1];
  v13 = 0;
  *a4 = (id)[v19 initWithDomain:v20 code:2 userInfo:v9];
LABEL_13:

LABEL_14:
  return v13;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariBrowsingAssistantVisualComponent *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_visualComponentAttribute)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantVisualComponentAttribute *)self->_visualComponentAttribute writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_visualComponentData)
  {
    PBDataWriterPlaceMark();
    [(BMSafariBrowsingAssistantVisualComponentData *)self->_visualComponentData writeTo:v4];
    PBDataWriterRecallMark();
  }
  if (self->_hasIdentifier) {
    PBDataWriterWriteUint64Field();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BMSafariBrowsingAssistantVisualComponent;
  id v5 = [(BMEventBase *)&v31 init];
  if (!v5) {
    goto LABEL_45;
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
        char v22 = 0;
        unsigned int v23 = 0;
        unint64_t v24 = 0;
        v5->_hasIdentifier = 1;
        while (1)
        {
          uint64_t v25 = *v6;
          unint64_t v26 = *(void *)&v4[v25];
          if (v26 == -1 || v26 >= *(void *)&v4[*v7]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v4[*v9] + v26);
          *(void *)&v4[v25] = v26 + 1;
          v24 |= (unint64_t)(v27 & 0x7F) << v22;
          if ((v27 & 0x80) == 0) {
            goto LABEL_39;
          }
          v22 += 7;
          BOOL v16 = v23++ >= 9;
          if (v16)
          {
            unint64_t v24 = 0;
            goto LABEL_41;
          }
        }
        v4[*v8] = 1;
LABEL_39:
        if (v4[*v8]) {
          unint64_t v24 = 0;
        }
LABEL_41:
        v5->_identifier = v24;
      }
      else
      {
        if (v19 == 2)
        {
          uint64_t v32 = 0;
          uint64_t v33 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_44;
          }
          uint64_t v20 = [[BMSafariBrowsingAssistantVisualComponentData alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_44;
          }
          uint64_t v21 = 32;
        }
        else
        {
          if (v19 != 1)
          {
            if (!PBReaderSkipValueWithTag()) {
              goto LABEL_44;
            }
            continue;
          }
          uint64_t v32 = 0;
          uint64_t v33 = 0;
          if ((PBReaderPlaceMark() & 1) == 0) {
            goto LABEL_44;
          }
          uint64_t v20 = [[BMSafariBrowsingAssistantVisualComponentAttribute alloc] initByReadFrom:v4];
          if (!v20) {
            goto LABEL_44;
          }
          uint64_t v21 = 24;
        }
        id v28 = *(Class *)((char *)&v5->super.super.isa + v21);
        *(Class *)((char *)&v5->super.super.isa + v21) = v20;

        PBReaderRecallMark();
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_44:
  }
    id v29 = 0;
  else {
LABEL_45:
  }
    id v29 = v5;

  return v29;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = [(BMSafariBrowsingAssistantVisualComponent *)self visualComponentAttribute];
  id v5 = [(BMSafariBrowsingAssistantVisualComponent *)self visualComponentData];
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMSafariBrowsingAssistantVisualComponent identifier](self, "identifier"));
  uint64_t v7 = (void *)[v3 initWithFormat:@"BMSafariBrowsingAssistantVisualComponent with visualComponentAttribute: %@, visualComponentData: %@, identifier: %@", v4, v5, v6];

  return (NSString *)v7;
}

- (BMSafariBrowsingAssistantVisualComponent)initWithVisualComponentAttribute:(id)a3 visualComponentData:(id)a4 identifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BMSafariBrowsingAssistantVisualComponent;
  unint64_t v12 = [(BMEventBase *)&v15 init];
  if (v12)
  {
    v12->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    objc_storeStrong((id *)&v12->_visualComponentAttribute, a3);
    objc_storeStrong((id *)&v12->_visualComponentData, a4);
    if (v11)
    {
      v12->_hasIdentifier = 1;
      uint64_t v13 = [v11 unsignedLongLongValue];
    }
    else
    {
      uint64_t v13 = 0;
      v12->_hasIdentifier = 0;
    }
    v12->_identifier = v13;
  }

  return v12;
}

+ (id)protoFields
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"visualComponentAttribute" number:1 type:14 subMessageClass:objc_opt_class()];
  id v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F503E0]), "initWithName:number:type:subMessageClass:", @"visualComponentData", 2, 14, objc_opt_class(), v2);
  v7[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"identifier" number:3 type:5 subMessageClass:0];
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF55F8;
}

+ (id)columns
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"visualComponentAttribute_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_487];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50408]) initWithName:@"visualComponentData_json" dataType:5 requestOnly:1 extractBlock:&__block_literal_global_489];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"identifier" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:5 convertedType:0];
  v7[0] = v2;
  v7[1] = v3;
  v7[2] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];

  return v5;
}

id __51__BMSafariBrowsingAssistantVisualComponent_columns__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 visualComponentData];
  id v4 = [v3 jsonDictionary];
  id v5 = BMConvertObjectToJSONString();

  return v5;
}

id __51__BMSafariBrowsingAssistantVisualComponent_columns__block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 eventBodyKeepingBackingData:1];
  id v3 = [v2 visualComponentAttribute];
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

    v8 = [[BMSafariBrowsingAssistantVisualComponent alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[5] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

@end