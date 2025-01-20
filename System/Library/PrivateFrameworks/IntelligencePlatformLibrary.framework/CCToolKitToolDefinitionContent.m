@interface CCToolKitToolDefinitionContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasToolkitProtoVersion;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCToolKitToolDefinitionContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCToolKitToolDefinitionContent)initWithToolkitProtoVersion:(id)a3 toolkitProtoBytes:(id)a4 error:(id *)a5;
- (NSData)toolkitProtoBytes;
- (id)jsonDictionary;
- (unsigned)toolkitProtoVersion;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasToolkitProtoVersion:(BOOL)a3;
@end

@implementation CCToolKitToolDefinitionContent

- (void).cxx_destruct
{
}

- (void)setHasToolkitProtoVersion:(BOOL)a3
{
  self->_hasToolkitProtoVersion = a3;
}

- (BOOL)hasToolkitProtoVersion
{
  return self->_hasToolkitProtoVersion;
}

- (unsigned)toolkitProtoVersion
{
  return self->_toolkitProtoVersion;
}

- (CCToolKitToolDefinitionContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"toolkitProtoVersion"];
    v10 = [v6 objectForKeyedSubscript:@"toolkitProtoBytes"];
    objc_opt_class();
    char v11 = CCValidateIsInstanceOfExpectedClass();
    id v12 = v8;

    if (v11)
    {
      uint64_t v13 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v10 options:0];

      v14 = [[CCToolKitToolDefinitionContent alloc] initWithToolkitProtoVersion:v9 toolkitProtoBytes:v13 error:a4];
      v10 = (void *)v13;
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
    id v12 = v8;
  }

  return v14;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_hasToolkitProtoVersion)
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCToolKitToolDefinitionContent toolkitProtoVersion](self, "toolkitProtoVersion"));
    [v3 setObject:v4 forKeyedSubscript:@"toolkitProtoVersion"];
  }
  if (self->_toolkitProtoBytes)
  {
    v5 = [(CCToolKitToolDefinitionContent *)self toolkitProtoBytes];
    id v6 = [v5 base64EncodedStringWithOptions:0];
    [v3 setObject:v6 forKeyedSubscript:@"toolkitProtoBytes"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v7 = (void (**)(id, void *))a3;
  if (self->_hasToolkitProtoVersion)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:29398 uint32Value:self->_toolkitProtoVersion];
    v7[2](v7, v5);
  }
  if (self->_toolkitProtoBytes)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:29399 bytesValue:self->_toolkitProtoBytes];
    v7[2](v7, v6);
  }
}

- (NSData)toolkitProtoBytes
{
  v2 = (void *)[(NSData *)self->_toolkitProtoBytes copy];
  return (NSData *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v6];
  id v8 = (int *)MEMORY[0x263F317C8];
  v9 = (int *)MEMORY[0x263F317C0];
  v10 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v7[*MEMORY[0x263F317C8]] >= *(void *)&v7[*MEMORY[0x263F317C0]]) {
    goto LABEL_38;
  }
  char v11 = 0;
  id v12 = (int *)MEMORY[0x263F317B0];
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
    if ((v16 >> 3) == 2)
    {
      CCPBReaderReadData();
      v27 = (NSData *)objc_claimAutoreleasedReturnValue();
      toolkitProtoBytes = self->_toolkitProtoBytes;
      self->_toolkitProtoBytes = v27;

      char v11 = 0;
    }
    else if ((v16 >> 3) == 1)
    {
      char v21 = 0;
      unsigned int v22 = 0;
      uint64_t v23 = 0;
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
          LODWORD(v23) = 0;
          goto LABEL_33;
        }
      }
      *(void *)&v7[*v10] = 1;
LABEL_31:
      if (*(void *)&v7[*v10]) {
        LODWORD(v23) = 0;
      }
LABEL_33:
      char v11 = 0;
      self->_toolkitProtoVersion = v23;
      self->_hasToolkitProtoVersion = 1;
    }
    else if (CCPBReaderSkipValueWithTag())
    {
      char v11 = 0;
    }
    else
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = a4;
      v32 = id v31 = v6;
      char v11 = CCSkipFieldErrorForMessage();

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
    char v11 = NSStringFromClass(v33);
    v34 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v35 = 0;
LABEL_42:

  return v35;
}

- (CCToolKitToolDefinitionContent)initWithToolkitProtoVersion:(id)a3 toolkitProtoBytes:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = objc_opt_new();
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
    CCPBDataWriterWriteDataField();
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
  [v8 unsignedIntValue];
  CCPBDataWriterWriteUint32Field();
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
  return (Class)objc_opt_class();
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((a3 - 29397) > 2) {
    return 0;
  }
  else {
    return off_26539CBA0[(unsigned __int16)(a3 - 29397)];
  }
}

+ (unsigned)itemType
{
  return 29397;
}

@end