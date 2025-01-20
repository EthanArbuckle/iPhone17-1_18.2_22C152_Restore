@interface BMSafariBrowsingAssistantVisualComponentPresentationStarted
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMSafariBrowsingAssistantVisualComponentPresentationStarted)initWithExists:(id)a3;
- (BMSafariBrowsingAssistantVisualComponentPresentationStarted)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setHasExists:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMSafariBrowsingAssistantVisualComponentPresentationStarted

- (void)setHasExists:(BOOL)a3
{
  self->_hasExists = a3;
}

- (BOOL)hasExists
{
  return self->_hasExists;
}

- (BOOL)exists
{
  return self->_exists;
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
    if ([(BMSafariBrowsingAssistantVisualComponentPresentationStarted *)self hasExists]
      || [v5 hasExists])
    {
      if ([(BMSafariBrowsingAssistantVisualComponentPresentationStarted *)self hasExists]
        && [v5 hasExists])
      {
        BOOL v6 = [(BMSafariBrowsingAssistantVisualComponentPresentationStarted *)self exists];
        int v7 = v6 ^ [v5 exists] ^ 1;
      }
      else
      {
        LOBYTE(v7) = 0;
      }
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (id)jsonDictionary
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if ([(BMSafariBrowsingAssistantVisualComponentPresentationStarted *)self hasExists])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariBrowsingAssistantVisualComponentPresentationStarted exists](self, "exists"));
    v9 = @"exists";
    if (v3)
    {
      id v4 = (void *)v3;
      int v5 = 0;
      BOOL v6 = (void *)v3;
      goto LABEL_6;
    }
  }
  else
  {
    v9 = @"exists";
  }
  BOOL v6 = [MEMORY[0x1E4F1CA98] null];
  id v4 = 0;
  int v5 = 1;
LABEL_6:
  v10[0] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  if (v5) {

  }
  return v7;
}

- (BMSafariBrowsingAssistantVisualComponentPresentationStarted)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v14[1] = *MEMORY[0x1E4F143B8];
  BOOL v6 = [a3 objectForKeyedSubscript:@"exists"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    a4 = 0;
LABEL_4:
    self = [(BMSafariBrowsingAssistantVisualComponentPresentationStarted *)self initWithExists:a4];
    int v7 = self;
    goto LABEL_5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    a4 = v6;
    goto LABEL_4;
  }
  if (a4)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v10 = *MEMORY[0x1E4F502C8];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v11 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"exists"];
    v14[0] = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    *a4 = (id)[v9 initWithDomain:v10 code:2 userInfo:v12];

    int v7 = 0;
    a4 = 0;
  }
  else
  {
    int v7 = 0;
  }
LABEL_5:

  return v7;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMSafariBrowsingAssistantVisualComponentPresentationStarted *)self writeTo:v3];
  id v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  if (self->_hasExists) {
    PBDataWriterWriteBOOLField();
  }
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)BMSafariBrowsingAssistantVisualComponentPresentationStarted;
  int v5 = [(BMEventBase *)&v27 init];
  if (!v5) {
    goto LABEL_36;
  }
  BOOL v6 = (int *)MEMORY[0x1E4F940E8];
  int v7 = (int *)MEMORY[0x1E4F940E0];
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
      if ((v12 >> 3) == 1)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        v5->_hasExists = 1;
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
            goto LABEL_30;
          }
          v19 += 7;
          BOOL v16 = v20++ >= 9;
          if (v16)
          {
            uint64_t v21 = 0;
            goto LABEL_32;
          }
        }
        v4[*v8] = 1;
LABEL_30:
        if (v4[*v8]) {
          uint64_t v21 = 0;
        }
LABEL_32:
        v5->_exists = v21 != 0;
      }
      else if (!PBReaderSkipValueWithTag())
      {
        goto LABEL_35;
      }
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_35:
  }
    v25 = 0;
  else {
LABEL_36:
  }
    v25 = v5;

  return v25;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[BMSafariBrowsingAssistantVisualComponentPresentationStarted exists](self, "exists"));
  int v5 = (void *)[v3 initWithFormat:@"BMSafariBrowsingAssistantVisualComponentPresentationStarted with exists: %@", v4];

  return (NSString *)v5;
}

- (BMSafariBrowsingAssistantVisualComponentPresentationStarted)initWithExists:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)BMSafariBrowsingAssistantVisualComponentPresentationStarted;
  int v5 = [(BMEventBase *)&v7 init];
  if (v5)
  {
    v5->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v4)
    {
      v5->_hasExists = 1;
      v5->_exists = [v4 BOOLValue];
    }
    else
    {
      v5->_hasExists = 0;
      v5->_exists = 0;
    }
  }

  return v5;
}

+ (id)protoFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"exists" number:1 type:12 subMessageClass:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF55C8;
}

+ (id)columns
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"exists" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:12 convertedType:0];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    int v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    objc_super v7 = (void *)[[v5 alloc] initWithData:v6];

    v8 = [[BMSafariBrowsingAssistantVisualComponentPresentationStarted alloc] initByReadFrom:v7];
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