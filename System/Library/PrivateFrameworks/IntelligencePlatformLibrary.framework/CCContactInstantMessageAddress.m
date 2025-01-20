@interface CCContactInstantMessageAddress
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCContactInstantMessageAddress)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCContactInstantMessageAddress)initWithLabel:(id)a3 username:(id)a4 serviceName:(id)a5 error:(id *)a6;
- (NSString)label;
- (NSString)serviceName;
- (NSString)username;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCContactInstantMessageAddress

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceName, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (CCContactInstantMessageAddress)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"label"];
    v10 = [v6 objectForKeyedSubscript:@"username"];
    v11 = [v6 objectForKeyedSubscript:@"serviceName"];
    v12 = [[CCContactInstantMessageAddress alloc] initWithLabel:v9 username:v10 serviceName:v11 error:a4];
  }
  else
  {
    CCSetError();
    v12 = 0;
  }

  return v12;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_label)
  {
    v4 = [(CCContactInstantMessageAddress *)self label];
    [v3 setObject:v4 forKeyedSubscript:@"label"];
  }
  if (self->_username)
  {
    v5 = [(CCContactInstantMessageAddress *)self username];
    [v3 setObject:v5 forKeyedSubscript:@"username"];
  }
  if (self->_serviceName)
  {
    id v6 = [(CCContactInstantMessageAddress *)self serviceName];
    [v3 setObject:v6 forKeyedSubscript:@"serviceName"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  id v8 = (void (**)(id, void *))a3;
  if (self->_label)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19744 stringValue:self->_label];
    v8[2](v8, v5);
  }
  if (self->_username)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19745 stringValue:self->_username];
    v8[2](v8, v6);
  }
  if (self->_serviceName)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:19746 stringValue:self->_serviceName];
    v8[2](v8, v7);
  }
}

- (NSString)serviceName
{
  v2 = (void *)[(NSString *)self->_serviceName copy];
  return (NSString *)v2;
}

- (NSString)username
{
  v2 = (void *)[(NSString *)self->_username copy];
  return (NSString *)v2;
}

- (NSString)label
{
  v2 = (void *)[(NSString *)self->_label copy];
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
    goto LABEL_33;
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
          goto LABEL_34;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v6[*v9] = 1;
LABEL_17:
    if (*(void *)&v6[*v9]) {
      goto LABEL_34;
    }
LABEL_18:
    unint64_t v20 = v15 >> 3;
    if ((v15 >> 3) == 3)
    {
      CCPBReaderReadStringNoCopy();
      v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      uint64_t v22 = 32;
      goto LABEL_24;
    }
    if (v20 == 2)
    {
      CCPBReaderReadStringNoCopy();
      v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      uint64_t v22 = 24;
      goto LABEL_24;
    }
    if (v20 == 1)
    {
      CCPBReaderReadStringNoCopy();
      v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      uint64_t v22 = 16;
LABEL_24:
      v23 = *(Class *)((char *)&self->super.super.isa + v22);
      *(Class *)((char *)&self->super.super.isa + v22) = v21;
      goto LABEL_25;
    }
    if (CCPBReaderSkipValueWithTag())
    {
      v10 = 0;
      continue;
    }
    v24 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v24);
    v10 = CCSkipFieldErrorForMessage();
LABEL_25:
  }
  while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
    goto LABEL_35;
  }
LABEL_33:
  if (*(void *)&v6[*v9])
  {
LABEL_34:
    v25 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v25);
    v26 = CCInvalidBufferErrorForMessage();
    CCSetError();

LABEL_35:
    BOOL v27 = 0;
  }
  else
  {
    BOOL v27 = 1;
  }

  return v27;
}

- (CCContactInstantMessageAddress)initWithLabel:(id)a3 username:(id)a4 serviceName:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = objc_opt_new();
  if (v10)
  {
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v15 = 0;
    if (!IsInstanceOfExpectedClass) {
      goto LABEL_7;
    }
    CCPBDataWriterWriteStringField();
    if (!v11)
    {
LABEL_4:
      id v16 = v15;
      if (v12) {
        goto LABEL_5;
      }
LABEL_11:
      id v15 = v16;
      goto LABEL_12;
    }
  }
  else
  {
    id v15 = 0;
    if (!v11) {
      goto LABEL_4;
    }
  }
  objc_opt_class();
  int v19 = CCValidateIsInstanceOfExpectedClass();
  id v16 = v15;

  if (!v19)
  {
    CCSetError();
    char v18 = 0;
    id v15 = v16;
    goto LABEL_14;
  }
  CCPBDataWriterWriteStringField();
  if (!v12) {
    goto LABEL_11;
  }
LABEL_5:
  objc_opt_class();
  int v17 = CCValidateIsInstanceOfExpectedClass();
  id v15 = v16;

  if (v17)
  {
    CCPBDataWriterWriteStringField();
LABEL_12:
    unint64_t v20 = [v13 immutableData];
    self = [(CCItemMessage *)self initWithData:v20 error:a6];

    char v18 = self;
    goto LABEL_14;
  }
LABEL_7:
  CCSetError();
  char v18 = 0;
LABEL_14:

  return v18;
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
  return 0;
}

+ (unsigned)itemType
{
  return 19668;
}

@end