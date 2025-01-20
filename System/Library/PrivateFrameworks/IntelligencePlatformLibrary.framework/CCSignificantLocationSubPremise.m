@interface CCSignificantLocationSubPremise
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCSignificantLocationSubPremise)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCSignificantLocationSubPremise)initWithType:(unsigned int)a3 value:(id)a4 error:(id *)a5;
- (NSString)value;
- (id)jsonDictionary;
- (unsigned)type;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCSignificantLocationSubPremise

- (void).cxx_destruct
{
}

- (unsigned)type
{
  return self->_type;
}

- (CCSignificantLocationSubPremise)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"type"];
    v10 = v9;
    if (v9) {
      uint64_t v11 = [v9 unsignedIntegerValue];
    }
    else {
      uint64_t v11 = 0;
    }
    v13 = [v6 objectForKeyedSubscript:@"value"];
    v12 = [[CCSignificantLocationSubPremise alloc] initWithType:v11 value:v13 error:a4];
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
  v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCSignificantLocationSubPremise type](self, "type"));
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  if (self->_value)
  {
    v5 = [(CCSignificantLocationSubPremise *)self value];
    [v3 setObject:v5 forKeyedSubscript:@"value"];
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v7 = (void (**)(id, void *))a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15775 enumValue:self->_type];
  v7[2](v7, v5);

  if (self->_value)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15776 stringValue:self->_value];
    v7[2](v7, v6);
  }
}

- (NSString)value
{
  v2 = (void *)[(NSString *)self->_value copy];
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
  uint64_t v11 = 0;
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
    if ((v16 >> 3) == 2)
    {
      CCPBReaderReadStringNoCopy();
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
      value = self->_value;
      self->_value = v27;

      uint64_t v11 = 0;
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
      uint64_t v11 = 0;
      self->_type = v23;
    }
    else if (CCPBReaderSkipValueWithTag())
    {
      uint64_t v11 = 0;
    }
    else
    {
      v29 = (objc_class *)objc_opt_class();
      NSStringFromClass(v29);
      id v30 = v6;
      v32 = v31 = a4;
      uint64_t v11 = CCSkipFieldErrorForMessage();

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
    uint64_t v11 = NSStringFromClass(v33);
    v34 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v35 = 0;
LABEL_42:

  return v35;
}

- (CCSignificantLocationSubPremise)initWithType:(unsigned int)a3 value:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = objc_opt_new();
  if (!a3)
  {
    id v11 = 0;
    if (!v8) {
      goto LABEL_8;
    }
LABEL_6:
    objc_opt_class();
    id v17 = v11;
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v13 = v11;

    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      unsigned int v15 = 0;
      id v11 = v13;
      goto LABEL_11;
    }
    CCPBDataWriterWriteStringField();
    id v11 = v13;
    goto LABEL_8;
  }
  int v10 = CCValidateEnumField();
  id v11 = 0;
  if (!v10)
  {
    CCSetError();
    unsigned int v15 = 0;
    goto LABEL_11;
  }
  CCPBDataWriterWriteUint32Field();
  if (v8) {
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
  return 15757;
}

@end