@interface BMSafariBrowsingAssistantVisualComponentAttribute
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariBrowsingAssistantVisualComponentAttribute)initWithComponentType:(int)a3 cardType:(int)a4 entityType:(int)a5 readerViewSectionType:(int)a6;
- (BMSafariBrowsingAssistantVisualComponentAttribute)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)cardType;
- (int)componentType;
- (int)entityType;
- (int)readerViewSectionType;
- (unsigned)dataVersion;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariBrowsingAssistantVisualComponentAttribute

- (int)readerViewSectionType
{
  return self->_readerViewSectionType;
}

- (int)entityType
{
  return self->_entityType;
}

- (int)cardType
{
  return self->_cardType;
}

- (int)componentType
{
  return self->_componentType;
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
    int v6 = [(BMSafariBrowsingAssistantVisualComponentAttribute *)self componentType];
    if (v6 == [v5 componentType]
      && (int v7 = [(BMSafariBrowsingAssistantVisualComponentAttribute *)self cardType],
          v7 == [v5 cardType])
      && (int v8 = [(BMSafariBrowsingAssistantVisualComponentAttribute *)self entityType],
          v8 == [v5 entityType]))
    {
      int v9 = [(BMSafariBrowsingAssistantVisualComponentAttribute *)self readerViewSectionType];
      BOOL v10 = v9 == [v5 readerViewSectionType];
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)jsonDictionary
{
  v14[4] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariBrowsingAssistantVisualComponentAttribute componentType](self, "componentType"));
  id v4 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariBrowsingAssistantVisualComponentAttribute cardType](self, "cardType"));
  id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariBrowsingAssistantVisualComponentAttribute entityType](self, "entityType"));
  int v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMSafariBrowsingAssistantVisualComponentAttribute readerViewSectionType](self, "readerViewSectionType"));
  v13[0] = @"componentType";
  int v7 = v3;
  if (!v3)
  {
    int v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[0] = v7;
  v13[1] = @"cardType";
  int v8 = v4;
  if (!v4)
  {
    int v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[1] = v8;
  v13[2] = @"entityType";
  int v9 = v5;
  if (!v5)
  {
    int v9 = [MEMORY[0x1E4F1CA98] null];
  }
  v14[2] = v9;
  v13[3] = @"readerViewSectionType";
  BOOL v10 = v6;
  if (!v6)
  {
    BOOL v10 = [MEMORY[0x1E4F1CA98] null];
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

- (BMSafariBrowsingAssistantVisualComponentAttribute)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [v6 objectForKeyedSubscript:@"componentType"];
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v38 = 0;
LABEL_9:
    uint64_t v9 = [v6 objectForKeyedSubscript:@"cardType"];
    v37 = (void *)v9;
    if (v9 && (BOOL v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            v15 = 0;
            v19 = 0;
            goto LABEL_30;
          }
          id v23 = objc_alloc(MEMORY[0x1E4F28C58]);
          v24 = a4;
          v25 = self;
          uint64_t v26 = *MEMORY[0x1E4F502C8];
          uint64_t v43 = *MEMORY[0x1E4F28568];
          id v14 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"cardType"];
          id v44 = v14;
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          uint64_t v27 = v26;
          self = v25;
          v15 = 0;
          v19 = 0;
          id *v24 = (id)[v23 initWithDomain:v27 code:2 userInfo:v13];
          goto LABEL_29;
        }
        id v12 = [NSNumber numberWithInt:BMSafariBrowsingAssistantCardTypeFromString(v10)];
      }
      v11 = v12;
    }
    else
    {
      v11 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"entityType"];
    v36 = v7;
    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v15 = v11;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v14 = v13;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v14 = 0;
            v19 = 0;
            goto LABEL_29;
          }
          v28 = a4;
          id v29 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v30 = *MEMORY[0x1E4F502C8];
          uint64_t v41 = *MEMORY[0x1E4F28568];
          id v18 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"entityType"];
          id v42 = v18;
          v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
          id v31 = (id)[v29 initWithDomain:v30 code:2 userInfo:v16];
          id v14 = 0;
          v19 = 0;
          id *v28 = v31;
          goto LABEL_28;
        }
        id v14 = [NSNumber numberWithInt:BMSafariBrowsingAssistantEntityTypeFromString(v13)];
      }
    }
    else
    {
      id v14 = 0;
    }
    v16 = [v6 objectForKeyedSubscript:@"readerViewSectionType"];
    if (v16 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = self;
        id v18 = v16;
      }
      else
      {
        v15 = v11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            id v35 = objc_alloc(MEMORY[0x1E4F28C58]);
            uint64_t v34 = *MEMORY[0x1E4F502C8];
            uint64_t v39 = *MEMORY[0x1E4F28568];
            v32 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"readerViewSectionType"];
            v40 = v32;
            v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
            *a4 = (id)[v35 initWithDomain:v34 code:2 userInfo:v33];
          }
          id v18 = 0;
          v19 = 0;
          goto LABEL_28;
        }
        v17 = self;
        id v18 = [NSNumber numberWithInt:BMSafariBrowsingAssistantReaderViewSectionTypeFromString(v16)];
      }
    }
    else
    {
      v17 = self;
      id v18 = 0;
    }
    v15 = v11;
    self = -[BMSafariBrowsingAssistantVisualComponentAttribute initWithComponentType:cardType:entityType:readerViewSectionType:](v17, "initWithComponentType:cardType:entityType:readerViewSectionType:", [v38 intValue], objc_msgSend(v11, "intValue"), objc_msgSend(v14, "intValue"), objc_msgSend(v18, "intValue"));
    v19 = self;
LABEL_28:

    int v7 = v36;
LABEL_29:

    BOOL v10 = v37;
    goto LABEL_30;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
LABEL_8:
    v38 = v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = [NSNumber numberWithInt:BMSafariBrowsingAssistantComponentTypeFromString(v7)];
    goto LABEL_8;
  }
  if (!a4)
  {
    v38 = 0;
    v19 = 0;
    goto LABEL_31;
  }
  id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
  uint64_t v22 = *MEMORY[0x1E4F502C8];
  uint64_t v45 = *MEMORY[0x1E4F28568];
  v15 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"componentType"];
  v46[0] = v15;
  BOOL v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
  v38 = 0;
  v19 = 0;
  *a4 = (id)[v21 initWithDomain:v22 code:2 userInfo:v10];
LABEL_30:

LABEL_31:
  return v19;
}

- (id)serialize
{
  v3 = objc_opt_new();
  [(BMSafariBrowsingAssistantVisualComponentAttribute *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)BMSafariBrowsingAssistantVisualComponentAttribute;
  id v5 = [(BMEventBase *)&v43 init];
  if (!v5) {
    goto LABEL_78;
  }
  id v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
  id v8 = (int *)MEMORY[0x1E4F940C8];
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
              goto LABEL_51;
            }
            v19 += 7;
            BOOL v16 = v20++ >= 9;
            if (v16)
            {
              LODWORD(v21) = 0;
              goto LABEL_53;
            }
          }
          v4[*v8] = 1;
LABEL_51:
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_53:
          if (v21 >= 4) {
            LODWORD(v21) = 0;
          }
          v40 = &OBJC_IVAR___BMSafariBrowsingAssistantVisualComponentAttribute__componentType;
          goto LABEL_74;
        case 2u:
          char v25 = 0;
          unsigned int v26 = 0;
          uint64_t v21 = 0;
          while (2)
          {
            uint64_t v27 = *v6;
            unint64_t v28 = *(void *)&v4[v27];
            if (v28 == -1 || v28 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v29 = *(unsigned char *)(*(void *)&v4[*v9] + v28);
              *(void *)&v4[v27] = v28 + 1;
              v21 |= (unint64_t)(v29 & 0x7F) << v25;
              if (v29 < 0)
              {
                v25 += 7;
                BOOL v16 = v26++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_59;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_59:
          if (v21 >= 3) {
            LODWORD(v21) = 0;
          }
          v40 = &OBJC_IVAR___BMSafariBrowsingAssistantVisualComponentAttribute__cardType;
          goto LABEL_74;
        case 3u:
          char v30 = 0;
          unsigned int v31 = 0;
          uint64_t v21 = 0;
          while (2)
          {
            uint64_t v32 = *v6;
            unint64_t v33 = *(void *)&v4[v32];
            if (v33 == -1 || v33 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v34 = *(unsigned char *)(*(void *)&v4[*v9] + v33);
              *(void *)&v4[v32] = v33 + 1;
              v21 |= (unint64_t)(v34 & 0x7F) << v30;
              if (v34 < 0)
              {
                v30 += 7;
                BOOL v16 = v31++ >= 9;
                if (v16)
                {
                  LODWORD(v21) = 0;
                  goto LABEL_65;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v21) = 0;
          }
LABEL_65:
          if (v21 >= 5) {
            LODWORD(v21) = 0;
          }
          v40 = &OBJC_IVAR___BMSafariBrowsingAssistantVisualComponentAttribute__entityType;
          goto LABEL_74;
        case 4u:
          char v35 = 0;
          unsigned int v36 = 0;
          uint64_t v21 = 0;
          break;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0) {
            goto LABEL_77;
          }
          continue;
      }
      while (1)
      {
        uint64_t v37 = *v6;
        unint64_t v38 = *(void *)&v4[v37];
        if (v38 == -1 || v38 >= *(void *)&v4[*v7]) {
          break;
        }
        char v39 = *(unsigned char *)(*(void *)&v4[*v9] + v38);
        *(void *)&v4[v37] = v38 + 1;
        v21 |= (unint64_t)(v39 & 0x7F) << v35;
        if ((v39 & 0x80) == 0) {
          goto LABEL_69;
        }
        v35 += 7;
        BOOL v16 = v36++ >= 9;
        if (v16)
        {
          LODWORD(v21) = 0;
          goto LABEL_71;
        }
      }
      v4[*v8] = 1;
LABEL_69:
      if (v4[*v8]) {
        LODWORD(v21) = 0;
      }
LABEL_71:
      if (v21 >= 3) {
        LODWORD(v21) = 0;
      }
      v40 = &OBJC_IVAR___BMSafariBrowsingAssistantVisualComponentAttribute__readerViewSectionType;
LABEL_74:
      *(_DWORD *)((char *)&v5->super.super.isa + *v40) = v21;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_77:
  }
    uint64_t v41 = 0;
  else {
LABEL_78:
  }
    uint64_t v41 = v5;

  return v41;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = BMSafariBrowsingAssistantComponentTypeAsString([(BMSafariBrowsingAssistantVisualComponentAttribute *)self componentType]);
  id v5 = BMSafariBrowsingAssistantCardTypeAsString([(BMSafariBrowsingAssistantVisualComponentAttribute *)self cardType]);
  id v6 = BMSafariBrowsingAssistantEntityTypeAsString([(BMSafariBrowsingAssistantVisualComponentAttribute *)self entityType]);
  int v7 = BMSafariBrowsingAssistantReaderViewSectionTypeAsString([(BMSafariBrowsingAssistantVisualComponentAttribute *)self readerViewSectionType]);
  id v8 = (void *)[v3 initWithFormat:@"BMSafariBrowsingAssistantVisualComponentAttribute with componentType: %@, cardType: %@, entityType: %@, readerViewSectionType: %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (BMSafariBrowsingAssistantVisualComponentAttribute)initWithComponentType:(int)a3 cardType:(int)a4 entityType:(int)a5 readerViewSectionType:(int)a6
{
  v12.receiver = self;
  v12.super_class = (Class)BMSafariBrowsingAssistantVisualComponentAttribute;
  char v10 = [(BMEventBase *)&v12 init];
  if (v10)
  {
    v10->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    v10->_componentType = a3;
    v10->_cardType = a4;
    v10->_entityType = a5;
    v10->_readerViewSectionType = a6;
  }
  return v10;
}

+ (id)protoFields
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"componentType" number:1 type:4 subMessageClass:0];
  v8[0] = v2;
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"cardType" number:2 type:4 subMessageClass:0];
  v8[1] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"entityType" number:3 type:4 subMessageClass:0];
  v8[2] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"readerViewSectionType" number:4 type:4 subMessageClass:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF5610;
}

+ (id)columns
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"componentType" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:4 convertedType:0];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"cardType" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:4 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"entityType" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:4 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"readerViewSectionType" dataType:0 requestOnly:0 fieldNumber:4 protoDataType:4 convertedType:0];
  v8[0] = v2;
  v8[1] = v3;
  v8[2] = v4;
  v8[3] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

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
    int v7 = (void *)[[v5 alloc] initWithData:v6];

    id v8 = [[BMSafariBrowsingAssistantVisualComponentAttribute alloc] initByReadFrom:v7];
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