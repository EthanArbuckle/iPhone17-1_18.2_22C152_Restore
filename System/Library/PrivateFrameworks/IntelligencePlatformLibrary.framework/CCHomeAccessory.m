@interface CCHomeAccessory
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCHomeAccessory)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCHomeAccessory)initWithName:(id)a3 deviceType:(unsigned int)a4 error:(id *)a5;
- (NSString)name;
- (id)jsonDictionary;
- (unsigned)deviceType;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCHomeAccessory

- (void).cxx_destruct
{
}

- (unsigned)deviceType
{
  return self->_deviceType;
}

- (CCHomeAccessory)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"name"];
    v10 = [v6 objectForKeyedSubscript:@"deviceType"];
    v11 = v10;
    if (v10) {
      uint64_t v12 = [v10 unsignedIntegerValue];
    }
    else {
      uint64_t v12 = 0;
    }
    v13 = [[CCHomeAccessory alloc] initWithName:v9 deviceType:v12 error:a4];
  }
  else
  {
    CCSetError();
    v13 = 0;
  }

  return v13;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_name)
  {
    v4 = [(CCHomeAccessory *)self name];
    [v3 setObject:v4 forKeyedSubscript:@"name"];
  }
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCHomeAccessory deviceType](self, "deviceType"));
  [v3 setObject:v5 forKeyedSubscript:@"deviceType"];

  id v6 = (void *)[v3 copy];
  return v6;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v7 = (void (**)(id, void *))a3;
  if (self->_name)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7702 stringValue:self->_name];
    v7[2](v7, v5);
  }
  id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7703 enumValue:self->_deviceType];
  v7[2](v7, v6);
}

- (NSString)name
{
  v2 = (void *)[(NSString *)self->_name copy];
  return (NSString *)v2;
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
  v11 = 0;
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
      CCPBReaderReadStringNoCopy();
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      self->_name = v27;

      v11 = 0;
    }
    else if ((v16 >> 3) == 2)
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
      v11 = 0;
      self->_deviceType = v23;
    }
    else if (CCPBReaderSkipValueWithTag())
    {
      v11 = 0;
    }
    else
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      id v30 = v6;
      v32 = v31 = a4;
      v11 = CCSkipFieldErrorForMessage();

      a4 = v31;
      id v6 = v30;
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
    v11 = NSStringFromClass(v33);
    v34 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v35 = 0;
LABEL_42:

  return v35;
}

- (CCHomeAccessory)initWithName:(id)a3 deviceType:(unsigned int)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = objc_opt_new();
  if (!v8)
  {
    id v11 = 0;
    if (!a4) {
      goto LABEL_8;
    }
LABEL_6:
    id v17 = v11;
    int v12 = CCValidateEnumField();
    id v13 = v11;

    if (!v12)
    {
      CCSetError();
      unsigned int v15 = 0;
      id v11 = v13;
      goto LABEL_11;
    }
    CCPBDataWriterWriteUint32Field();
    id v11 = v13;
    goto LABEL_8;
  }
  objc_opt_class();
  int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v11 = 0;
  if (!IsInstanceOfExpectedClass)
  {
    CCSetError();
    unsigned int v15 = 0;
    goto LABEL_11;
  }
  CCPBDataWriterWriteStringField();
  if (a4) {
    goto LABEL_6;
  }
LABEL_8:
  char v14 = objc_msgSend(v9, "immutableData", v17);
  self = [(CCItemMessage *)self initWithData:v14 error:a5];

  unsigned int v15 = self;
LABEL_11:

  return v15;
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
  return 7690;
}

@end