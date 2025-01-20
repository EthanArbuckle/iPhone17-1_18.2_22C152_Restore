@interface CCSerializedSetDevice
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasOptions;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCSerializedSetDevice)initWithDeviceIdentifier:(id)a3 options:(id)a4 error:(id *)a5;
- (CCSerializedSetDevice)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (NSString)deviceIdentifier;
- (id)jsonDictionary;
- (unsigned)options;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasOptions:(BOOL)a3;
@end

@implementation CCSerializedSetDevice

- (void).cxx_destruct
{
}

- (void)setHasOptions:(BOOL)a3
{
  self->_hasOptions = a3;
}

- (BOOL)hasOptions
{
  return self->_hasOptions;
}

- (unsigned)options
{
  return self->_options;
}

- (CCSerializedSetDevice)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"deviceIdentifier"];
    v10 = [v6 objectForKeyedSubscript:@"options"];
    v11 = [[CCSerializedSetDevice alloc] initWithDeviceIdentifier:v9 options:v10 error:a4];
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
  if (self->_deviceIdentifier)
  {
    v4 = [(CCSerializedSetDevice *)self deviceIdentifier];
    [v3 setObject:v4 forKeyedSubscript:@"deviceIdentifier"];
  }
  if (self->_hasOptions)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCSerializedSetDevice options](self, "options"));
    [v3 setObject:v5 forKeyedSubscript:@"options"];
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  id v8 = (void (**)(id, void *))a3;
  v5 = (unsigned __int16 *)MEMORY[0x263F316D0];
  if (self->_deviceIdentifier)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:(unsigned __int16)*MEMORY[0x263F316D0] stringValue:self->_deviceIdentifier];
    v8[2](v8, v6);
  }
  if (self->_hasOptions)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 uint32Value:self->_options];
    v8[2](v8, v7);
  }
}

- (NSString)deviceIdentifier
{
  v2 = (void *)[(NSString *)self->_deviceIdentifier copy];
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
  v12 = (int *)MEMORY[0x263F317B0];
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
      deviceIdentifier = self->_deviceIdentifier;
      self->_deviceIdentifier = v27;

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
      self->_options = v23;
      self->_hasOptions = 1;
    }
    else if (CCPBReaderSkipValueWithTag())
    {
      v11 = 0;
    }
    else
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      v30 = a4;
      v32 = id v31 = v6;
      v11 = CCSkipFieldErrorForMessage();

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
    v11 = NSStringFromClass(v33);
    v34 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v35 = 0;
LABEL_42:

  return v35;
}

- (CCSerializedSetDevice)initWithDeviceIdentifier:(id)a3 options:(id)a4 error:(id *)a5
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
    [v9 unsignedIntValue];
    CCPBDataWriterWriteUint32Field();
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
  CCPBDataWriterWriteStringField();
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