@interface CCMediaMetaContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCMediaMetaContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCMediaMetaContent)initWithSourceItemIdentifier:(id)a3 linkedIdentifiers:(id)a4 error:(id *)a5;
- (NSArray)linkedIdentifiers;
- (NSString)sourceItemIdentifier;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCMediaMetaContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceItemIdentifier, 0);
}

- (CCMediaMetaContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  uint64_t v35 = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"sourceItemIdentifier"];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"linkedIdentifiers"];
    if (v10)
    {
      id v11 = (id)v10;
      objc_opt_class();
      id v34 = v8;
      char v12 = CCValidateIsInstanceOfExpectedClass();
      id v13 = v8;

      if ((v12 & 1) == 0)
      {
        CCSetError();
        v25 = 0;
        goto LABEL_21;
      }
      v27 = v9;
      v28 = self;
      v14 = objc_opt_new();
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v11 = v11;
      uint64_t v15 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        uint64_t v17 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v11);
            }
            uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            v20 = [CCMediaLinkedIdentifier alloc];
            id v29 = 0;
            v21 = [(CCMediaLinkedIdentifier *)v20 initWithJSONDictionary:v19 error:&v29];
            id v22 = v29;
            if (v21) {
              BOOL v23 = v22 == 0;
            }
            else {
              BOOL v23 = 0;
            }
            if (!v23)
            {
              v24 = v22;
              CCSetError();

              v25 = 0;
              v9 = v27;
              self = v28;
              goto LABEL_21;
            }
            [v14 addObject:v21];
          }
          uint64_t v16 = [v11 countByEnumeratingWithState:&v30 objects:v36 count:16];
        }
        while (v16);
      }

      v9 = v27;
      self = v28;
    }
    else
    {
      v14 = 0;
      id v13 = v8;
    }
    v25 = [[CCMediaMetaContent alloc] initWithSourceItemIdentifier:v9 linkedIdentifiers:v14 error:a4];
    id v11 = v14;
LABEL_21:

    id v8 = v13;
    goto LABEL_22;
  }
  CCSetError();
  v25 = 0;
LABEL_22:

  return v25;
}

- (id)jsonDictionary
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  if (self->_sourceItemIdentifier)
  {
    v4 = [(CCMediaMetaContent *)self sourceItemIdentifier];
    [v3 setObject:v4 forKeyedSubscript:@"sourceItemIdentifier"];
  }
  v5 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(CCMediaMetaContent *)self linkedIdentifiers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) jsonDictionary];
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [v3 setObject:v5 forKeyedSubscript:@"linkedIdentifiers"];
  char v12 = (void *)[v3 copy];

  return v12;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  uint64_t v7 = (void (**)(id, void *))a3;
  if (self->_sourceItemIdentifier)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18553 stringValue:self->_sourceItemIdentifier];
    v7[2](v7, v5);
  }
  if (self->_linkedIdentifiers)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:18554 repeatedSubMessageValue:self->_linkedIdentifiers];
    v7[2](v7, v6);
  }
}

- (NSArray)linkedIdentifiers
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_linkedIdentifiers copyItems:1];
  return (NSArray *)v2;
}

- (NSString)sourceItemIdentifier
{
  v2 = (void *)[(NSString *)self->_sourceItemIdentifier copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v32 = a3;
  v5 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v32];
  id v6 = (int *)MEMORY[0x263F317C8];
  uint64_t v7 = (int *)MEMORY[0x263F317C0];
  if (*(void *)&v5[*MEMORY[0x263F317C8]] < *(void *)&v5[*MEMORY[0x263F317C0]])
  {
    uint64_t v8 = 0;
    id v9 = 0;
    uint64_t v10 = (int *)MEMORY[0x263F317B8];
    id v11 = (int *)MEMORY[0x263F317B0];
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
      if ((v15 >> 3) == 2)
      {
        sourceItemIdentifier = CCPBReaderReadDataNoCopy();
        if (!v8) {
          uint64_t v8 = objc_opt_new();
        }
        id v22 = [CCMediaLinkedIdentifier alloc];
        id v33 = 0;
        BOOL v23 = [(CCItemMessage *)v22 initWithData:sourceItemIdentifier error:&v33];
        id v9 = v33;
        if (!v9 && v23) {
          [v8 addObject:v23];
        }

        goto LABEL_30;
      }
      if ((v15 >> 3) == 1) {
        break;
      }
      if ((CCPBReaderSkipValueWithTag() & 1) == 0)
      {
        v24 = (objc_class *)objc_opt_class();
        sourceItemIdentifier = NSStringFromClass(v24);
        CCSkipFieldErrorForMessage();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      id v9 = 0;
LABEL_31:
      if (*(void *)&v5[*v6] >= *(void *)&v5[*v7]) {
        goto LABEL_35;
      }
    }
    CCPBReaderReadStringNoCopy();
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v9 = 0;
    sourceItemIdentifier = self->_sourceItemIdentifier;
    self->_sourceItemIdentifier = v20;
LABEL_30:

    goto LABEL_31;
  }
  uint64_t v8 = 0;
LABEL_34:
  id v9 = 0;
LABEL_35:
  v25 = (NSArray *)[v8 copy];
  linkedIdentifiers = self->_linkedIdentifiers;
  self->_linkedIdentifiers = v25;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v5[*MEMORY[0x263F317B8]])
    {
      BOOL v30 = 1;
      goto LABEL_40;
    }
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    id v29 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v30 = 0;
LABEL_40:

  return v30;
}

- (CCMediaMetaContent)initWithSourceItemIdentifier:(id)a3 linkedIdentifiers:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = objc_opt_new();
  if (!v8)
  {
    id v12 = 0;
    if (!v9) {
      goto LABEL_15;
    }
LABEL_6:
    objc_opt_class();
    id v29 = v12;
    int v13 = CCValidateArrayValues();
    id v14 = v12;

    if (!v13)
    {
      CCSetError();
      id v22 = 0;
      id v12 = v14;
      goto LABEL_18;
    }
    id v24 = v14;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v26;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v26 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v25 + 1) + 8 * v19) data];
          CCPBDataWriterWriteDataField();

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v17);
    }

    id v12 = v24;
    goto LABEL_15;
  }
  objc_opt_class();
  uint64_t v30 = 0;
  int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v12 = 0;
  if (!IsInstanceOfExpectedClass)
  {
    CCSetError();
    id v22 = 0;
    goto LABEL_18;
  }
  CCPBDataWriterWriteStringField();
  if (v9) {
    goto LABEL_6;
  }
LABEL_15:
  v21 = [v10 immutableData];
  self = [(CCItemMessage *)self initWithData:v21 error:a5];

  id v22 = self;
LABEL_18:

  return v22;
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
  v3 = @"type";
  if (a3 != 18568) {
    v3 = 0;
  }
  if (a3 == 18567) {
    v4 = @"sourceItemIdentifier";
  }
  else {
    v4 = v3;
  }
  v5 = @"linkedIdentifiers";
  if (a3 != 18554) {
    v5 = 0;
  }
  if (a3 == 18553) {
    id v6 = @"sourceItemIdentifier";
  }
  else {
    id v6 = v5;
  }
  if ((int)a3 <= 18566) {
    return v6;
  }
  else {
    return v4;
  }
}

+ (unsigned)itemType
{
  return 18540;
}

@end