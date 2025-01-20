@interface CCAppEnumTypeDisplayRepresentation
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCAppEnumTypeDisplayRepresentation)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCAppEnumTypeDisplayRepresentation)initWithName:(id)a3 synonyms:(id)a4 error:(id *)a5;
- (NSArray)synonyms;
- (NSString)name;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCAppEnumTypeDisplayRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (CCAppEnumTypeDisplayRepresentation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"name"];
    v10 = [v6 objectForKeyedSubscript:@"synonyms"];
    v11 = [[CCAppEnumTypeDisplayRepresentation alloc] initWithName:v9 synonyms:v10 error:a4];
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
    v4 = [(CCAppEnumTypeDisplayRepresentation *)self name];
    [v3 setObject:v4 forKeyedSubscript:@"name"];
  }
  if (self->_synonyms)
  {
    v5 = [(CCAppEnumTypeDisplayRepresentation *)self synonyms];
    [v3 setObject:v5 forKeyedSubscript:@"synonyms"];
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v7 = (void (**)(id, void *))a3;
  if (self->_name)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:42621 stringValue:self->_name];
    v7[2](v7, v5);
  }
  if (self->_synonyms)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:42622 repeatedStringValue:self->_synonyms];
    v7[2](v7, v6);
  }
}

- (NSArray)synonyms
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_synonyms copyItems:1];
  return (NSArray *)v2;
}

- (NSString)name
{
  v2 = (void *)[(NSString *)self->_name copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  v31 = a4;
  id v32 = a3;
  v5 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v32];
  id v6 = (int *)MEMORY[0x263F317C8];
  v7 = (int *)MEMORY[0x263F317C0];
  if (*(void *)&v5[*MEMORY[0x263F317C8]] < *(void *)&v5[*MEMORY[0x263F317C0]])
  {
    id v8 = 0;
    v9 = 0;
    v10 = (int *)MEMORY[0x263F317B8];
    v11 = (int *)MEMORY[0x263F317B0];
    while (1)
    {
      if (*(void *)&v5[*v10]) {
        BOOL v12 = 0;
      }
      else {
        BOOL v12 = v9 == 0;
      }
      if (!v12) {
        goto LABEL_35;
      }
      char v13 = 0;
      unsigned int v14 = 0;
      unint64_t v15 = 0;
      while (1)
      {
        uint64_t v16 = *v6;
        unint64_t v17 = *(void *)&v5[v16];
        if (v17 == -1 || v17 >= *(void *)&v5[*v7]) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)&v5[*v11] + v17);
        *(void *)&v5[v16] = v17 + 1;
        v15 |= (unint64_t)(v18 & 0x7F) << v13;
        if ((v18 & 0x80) == 0) {
          goto LABEL_17;
        }
        v13 += 7;
        if (v14++ >= 9)
        {
          unint64_t v15 = 0;
          if (*(void *)&v5[*v10]) {
            goto LABEL_34;
          }
          goto LABEL_18;
        }
      }
      *(void *)&v5[*v10] = 1;
LABEL_17:
      if (*(void *)&v5[*v10]) {
        goto LABEL_34;
      }
LABEL_18:
      if ((v15 >> 3) == 2) {
        break;
      }
      if ((v15 >> 3) == 1)
      {
        CCPBReaderReadStringNoCopy();
        v20 = (NSString *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        name = self->_name;
        self->_name = v20;
LABEL_28:

        goto LABEL_29;
      }
      if ((CCPBReaderSkipValueWithTag() & 1) == 0)
      {
        v23 = (objc_class *)objc_opt_class();
        name = NSStringFromClass(v23);
        v9 = CCSkipFieldErrorForMessage();
        goto LABEL_28;
      }
      v9 = 0;
LABEL_29:
      if (*(void *)&v5[*v6] >= *(void *)&v5[*v7]) {
        goto LABEL_35;
      }
    }
    uint64_t v22 = CCPBReaderReadStringNoCopy();
    name = (void *)v22;
    if (v8)
    {
      if (!v22)
      {
LABEL_24:
        v9 = 0;
        goto LABEL_28;
      }
    }
    else
    {
      id v8 = objc_opt_new();
      if (!name) {
        goto LABEL_24;
      }
    }
    objc_msgSend(v8, "addObject:", name, v31);
    goto LABEL_24;
  }
  id v8 = 0;
LABEL_34:
  v9 = 0;
LABEL_35:
  v24 = (NSArray *)objc_msgSend(v8, "copy", v31);
  synonyms = self->_synonyms;
  self->_synonyms = v24;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v5[*MEMORY[0x263F317B8]])
    {
      BOOL v29 = 1;
      goto LABEL_40;
    }
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v28 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v29 = 0;
LABEL_40:

  return v29;
}

- (CCAppEnumTypeDisplayRepresentation)initWithName:(id)a3 synonyms:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = objc_opt_new();
  if (!v8)
  {
    id v12 = 0;
    if (!v9) {
      goto LABEL_15;
    }
LABEL_6:
    objc_opt_class();
    id v27 = v12;
    int v13 = CCValidateArrayValues();
    id v14 = v12;

    if (!v13)
    {
      CCSetError();
      v21 = 0;
      id v12 = v14;
      goto LABEL_18;
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          CCPBDataWriterWriteStringField();
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v17);
    }

    id v12 = v14;
    goto LABEL_15;
  }
  objc_opt_class();
  uint64_t v28 = 0;
  int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v12 = 0;
  if (!IsInstanceOfExpectedClass)
  {
    CCSetError();
    v21 = 0;
    goto LABEL_18;
  }
  CCPBDataWriterWriteStringField();
  if (v9) {
    goto LABEL_6;
  }
LABEL_15:
  v20 = objc_msgSend(v10, "immutableData", v23);
  self = [(CCItemMessage *)self initWithData:v20 error:a5];

  v21 = self;
LABEL_18:

  return v21;
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
  return -22925;
}

@end