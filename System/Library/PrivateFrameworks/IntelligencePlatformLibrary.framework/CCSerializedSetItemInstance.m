@interface CCSerializedSetItemInstance
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasInstanceIdentifier;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCSerializedSetItemInstance)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCSerializedSetItemInstance)initWithMetaContent:(id)a3 instanceIdentifier:(id)a4 error:(id *)a5;
- (NSData)metaContent;
- (id)jsonDictionary;
- (int64_t)instanceIdentifier;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasInstanceIdentifier:(BOOL)a3;
@end

@implementation CCSerializedSetItemInstance

- (void).cxx_destruct
{
}

- (void)setHasInstanceIdentifier:(BOOL)a3
{
  self->_hasInstanceIdentifier = a3;
}

- (BOOL)hasInstanceIdentifier
{
  return self->_hasInstanceIdentifier;
}

- (int64_t)instanceIdentifier
{
  return self->_instanceIdentifier;
}

- (CCSerializedSetItemInstance)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"metaContent"];
    objc_opt_class();
    char v10 = CCValidateIsInstanceOfExpectedClass();
    id v11 = v8;

    if (v10)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v9 options:0];

      v13 = [v6 objectForKeyedSubscript:@"instanceIdentifier"];
      v14 = [[CCSerializedSetItemInstance alloc] initWithMetaContent:v12 instanceIdentifier:v13 error:a4];

      v9 = (void *)v12;
    }
    else
    {
      CCSetError();
      v14 = 0;
    }
  }
  else
  {
    CCSetError();
    v14 = 0;
    id v11 = v8;
  }

  return v14;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_metaContent)
  {
    v4 = [(CCSerializedSetItemInstance *)self metaContent];
    v5 = [v4 base64EncodedStringWithOptions:0];
    [v3 setObject:v5 forKeyedSubscript:@"metaContent"];
  }
  if (self->_hasInstanceIdentifier)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithLongLong:", -[CCSerializedSetItemInstance instanceIdentifier](self, "instanceIdentifier"));
    [v3 setObject:v6 forKeyedSubscript:@"instanceIdentifier"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  id v8 = (void (**)(id, void *))a3;
  v5 = (unsigned __int16 *)MEMORY[0x263F316D0];
  if (self->_metaContent)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:(unsigned __int16)*MEMORY[0x263F316D0] bytesValue:self->_metaContent];
    v8[2](v8, v6);
  }
  if (self->_hasInstanceIdentifier)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 int64Value:self->_instanceIdentifier];
    v8[2](v8, v7);
  }
}

- (NSData)metaContent
{
  v2 = (void *)[(NSData *)self->_metaContent copy];
  return (NSData *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v6];
  id v8 = (int *)MEMORY[0x263F317C8];
  v9 = (int *)MEMORY[0x263F317C0];
  char v10 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v7[*MEMORY[0x263F317C8]] >= *(void *)&v7[*MEMORY[0x263F317C0]]) {
    goto LABEL_38;
  }
  id v11 = 0;
  uint64_t v12 = (int *)MEMORY[0x263F317B0];
  v37 = self;
  do
  {
    if (*(void *)&v7[*v10]) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v11 == 0;
    }
    if (!v13) {
      break;
    }
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v16 = 0;
    while (1)
    {
      uint64_t v17 = *v8;
      unint64_t v18 = *(void *)&v7[v17];
      if (v18 == -1 || v18 >= *(void *)&v7[*v9]) {
        break;
      }
      char v19 = *(unsigned char *)(*(void *)&v7[*v12] + v18);
      *(void *)&v7[v17] = v18 + 1;
      v16 |= (unint64_t)(v19 & 0x7F) << v14;
      if ((v19 & 0x80) == 0) {
        goto LABEL_17;
      }
      v14 += 7;
      BOOL v20 = v15++ >= 9;
      if (v20)
      {
        unint64_t v16 = 0;
        if (*(void *)&v7[*v10]) {
          goto LABEL_39;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v7[*v10] = 1;
LABEL_17:
    if (*(void *)&v7[*v10]) {
      goto LABEL_39;
    }
LABEL_18:
    if ((v16 >> 3) == 1)
    {
      CCPBReaderReadData();
      v27 = (NSData *)objc_claimAutoreleasedReturnValue();
      metaContent = self->_metaContent;
      self->_metaContent = v27;

      id v11 = 0;
    }
    else if ((v16 >> 3) == 2)
    {
      char v21 = 0;
      unsigned int v22 = 0;
      int64_t v23 = 0;
      while (1)
      {
        uint64_t v24 = *v8;
        unint64_t v25 = *(void *)&v7[v24];
        if (v25 == -1 || v25 >= *(void *)&v7[*v9]) {
          break;
        }
        char v26 = *(unsigned char *)(*(void *)&v7[*v12] + v25);
        *(void *)&v7[v24] = v25 + 1;
        v23 |= (unint64_t)(v26 & 0x7F) << v21;
        if ((v26 & 0x80) == 0) {
          goto LABEL_31;
        }
        v21 += 7;
        BOOL v20 = v22++ >= 9;
        if (v20)
        {
          int64_t v23 = 0;
          goto LABEL_33;
        }
      }
      *(void *)&v7[*v10] = 1;
LABEL_31:
      if (*(void *)&v7[*v10]) {
        int64_t v23 = 0;
      }
LABEL_33:
      id v11 = 0;
      self->_instanceIdentifier = v23;
      self->_hasInstanceIdentifier = 1;
    }
    else if (CCPBReaderSkipValueWithTag())
    {
      id v11 = 0;
    }
    else
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = a4;
      v32 = id v31 = v6;
      id v11 = CCSkipFieldErrorForMessage();

      id v6 = v31;
      a4 = v30;
      self = v37;
    }
  }
  while (*(void *)&v7[*v8] < *(void *)&v7[*v9]);
  if (v11)
  {
    CCSetError();
  }
  else
  {
LABEL_38:
    if (!*(void *)&v7[*v10])
    {
      BOOL v35 = 1;
      goto LABEL_42;
    }
LABEL_39:
    v33 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v33);
    v34 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v35 = 0;
LABEL_42:

  return v35;
}

- (CCSerializedSetItemInstance)initWithMetaContent:(id)a3 instanceIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = objc_opt_new();
  if (!v8)
  {
    id v12 = 0;
    if (!v9) {
      goto LABEL_8;
    }
LABEL_6:
    objc_opt_class();
    id v18 = v12;
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v14 = v12;

    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      unint64_t v16 = 0;
      id v12 = v14;
      goto LABEL_11;
    }
    [v9 longLongValue];
    CCPBDataWriterWriteInt64Field();
    id v12 = v14;
    goto LABEL_8;
  }
  objc_opt_class();
  int v11 = CCValidateIsInstanceOfExpectedClass();
  id v12 = 0;
  if (!v11)
  {
    CCSetError();
    unint64_t v16 = 0;
    goto LABEL_11;
  }
  CCPBDataWriterWriteDataField();
  if (v9) {
    goto LABEL_6;
  }
LABEL_8:
  unsigned int v15 = objc_msgSend(v10, "immutableData", v18);
  self = [(CCItemMessage *)self initWithData:v15 error:a5];

  unint64_t v16 = self;
LABEL_11:

  return v16;
}

+ (Class)contentMessageClass
{
  return 0;
}

+ (Class)metaContentMessageClass
{
  return 0;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (unsigned)itemType
{
  return *MEMORY[0x263F316D0];
}

@end