@interface CCHomeServiceAreaMap
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasMapIdentifier;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCHomeServiceAreaMap)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCHomeServiceAreaMap)initWithName:(id)a3 mapIdentifier:(id)a4 error:(id *)a5;
- (NSString)name;
- (id)jsonDictionary;
- (unsigned)mapIdentifier;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasMapIdentifier:(BOOL)a3;
@end

@implementation CCHomeServiceAreaMap

- (void).cxx_destruct
{
}

- (void)setHasMapIdentifier:(BOOL)a3
{
  self->_hasMapIdentifier = a3;
}

- (BOOL)hasMapIdentifier
{
  return self->_hasMapIdentifier;
}

- (unsigned)mapIdentifier
{
  return self->_mapIdentifier;
}

- (CCHomeServiceAreaMap)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"name"];
    v10 = [v6 objectForKeyedSubscript:@"mapIdentifier"];
    v11 = [[CCHomeServiceAreaMap alloc] initWithName:v9 mapIdentifier:v10 error:a4];
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
  if (self->_name)
  {
    v4 = [(CCHomeServiceAreaMap *)self name];
    [v3 setObject:v4 forKeyedSubscript:@"name"];
  }
  if (self->_hasMapIdentifier)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCHomeServiceAreaMap mapIdentifier](self, "mapIdentifier"));
    [v3 setObject:v5 forKeyedSubscript:@"mapIdentifier"];
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v7 = (void (**)(id, void *))a3;
  if (self->_name)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:17041 stringValue:self->_name];
    v7[2](v7, v5);
  }
  if (self->_hasMapIdentifier)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:17042 uint32Value:self->_mapIdentifier];
    v7[2](v7, v6);
  }
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
      self->_mapIdentifier = v23;
      self->_hasMapIdentifier = 1;
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

- (CCHomeServiceAreaMap)initWithName:(id)a3 mapIdentifier:(id)a4 error:(id *)a5
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
  return 17034;
}

@end