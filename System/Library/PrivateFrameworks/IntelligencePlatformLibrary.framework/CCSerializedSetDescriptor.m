@interface CCSerializedSetDescriptor
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCSerializedSetDescriptor)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCSerializedSetDescriptor)initWithKey:(id)a3 value:(id)a4 error:(id *)a5;
- (NSString)key;
- (NSString)value;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCSerializedSetDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (CCSerializedSetDescriptor)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"key"];
    v10 = [v6 objectForKeyedSubscript:@"value"];
    v11 = [[CCSerializedSetDescriptor alloc] initWithKey:v9 value:v10 error:a4];
  }
  else
  {
    CCSetError();
    v11 = 0;
  }

  return v11;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_key)
  {
    v4 = [(CCSerializedSetDescriptor *)self key];
    [v3 setObject:v4 forKeyedSubscript:@"key"];
  }
  if (self->_value)
  {
    v5 = [(CCSerializedSetDescriptor *)self value];
    [v3 setObject:v5 forKeyedSubscript:@"value"];
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  id v8 = (void (**)(id, void *))a3;
  v5 = (unsigned __int16 *)MEMORY[0x263F316D0];
  if (self->_key)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:(unsigned __int16)*MEMORY[0x263F316D0] stringValue:self->_key];
    v8[2](v8, v6);
  }
  if (self->_value)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 stringValue:self->_value];
    v8[2](v8, v7);
  }
}

- (NSString)value
{
  v2 = (void *)[(NSString *)self->_value copy];
  return (NSString *)v2;
}

- (NSString)key
{
  v2 = (void *)[(NSString *)self->_key copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v5];
  v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  v9 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] >= *(void *)&v6[*MEMORY[0x263F317C0]]) {
    goto LABEL_30;
  }
  v10 = 0;
  v11 = (int *)MEMORY[0x263F317B0];
  do
  {
    if (*(void *)&v6[*v9] || v10 != 0) {
      break;
    }
    char v13 = 0;
    unsigned int v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *v7;
      unint64_t v17 = *(void *)&v6[v16];
      if (v17 == -1 || v17 >= *(void *)&v6[*v8]) {
        break;
      }
      char v18 = *(unsigned char *)(*(void *)&v6[*v11] + v17);
      *(void *)&v6[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0) {
        goto LABEL_17;
      }
      v13 += 7;
      if (v14++ >= 9)
      {
        unint64_t v15 = 0;
        if (*(void *)&v6[*v9]) {
          goto LABEL_31;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v6[*v9] = 1;
LABEL_17:
    if (*(void *)&v6[*v9]) {
      goto LABEL_31;
    }
LABEL_18:
    if ((v15 >> 3) == 2)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      uint64_t v21 = 24;
LABEL_22:
      v22 = *(Class *)((char *)&self->super.super.isa + v21);
      *(Class *)((char *)&self->super.super.isa + v21) = v20;
LABEL_26:

      continue;
    }
    if ((v15 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      uint64_t v21 = 16;
      goto LABEL_22;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v23 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v23);
      v10 = CCSkipFieldErrorForMessage();
      goto LABEL_26;
    }
    v10 = 0;
  }
  while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
    goto LABEL_32;
  }
LABEL_30:
  if (*(void *)&v6[*v9])
  {
LABEL_31:
    v24 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v24);
    v25 = CCInvalidBufferErrorForMessage();
    CCSetError();

LABEL_32:
    BOOL v26 = 0;
  }
  else
  {
    BOOL v26 = 1;
  }

  return v26;
}

- (CCSerializedSetDescriptor)initWithKey:(id)a3 value:(id)a4 error:(id *)a5
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
      uint64_t v16 = 0;
      id v12 = v14;
      goto LABEL_11;
    }
    CCPBDataWriterWriteStringField();
    id v12 = v14;
    goto LABEL_8;
  }
  objc_opt_class();
  int v11 = CCValidateIsInstanceOfExpectedClass();
  id v12 = 0;
  if (!v11)
  {
    CCSetError();
    uint64_t v16 = 0;
    goto LABEL_11;
  }
  CCPBDataWriterWriteStringField();
  if (v9) {
    goto LABEL_6;
  }
LABEL_8:
  unint64_t v15 = objc_msgSend(v10, "immutableData", v18);
  self = [(CCItemMessage *)self initWithData:v15 error:a5];

  uint64_t v16 = self;
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