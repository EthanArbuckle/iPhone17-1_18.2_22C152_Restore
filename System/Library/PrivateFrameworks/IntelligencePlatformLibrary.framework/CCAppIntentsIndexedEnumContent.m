@interface CCAppIntentsIndexedEnumContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCAppEnumTypeDisplayRepresentation)typeDisplayRepresentation;
- (CCAppIntentsIndexedEnumContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCAppIntentsIndexedEnumContent)initWithTypeIdentifier:(id)a3 typeDisplayRepresentation:(id)a4 cases:(id)a5 error:(id *)a6;
- (NSArray)cases;
- (NSString)typeIdentifier;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCAppIntentsIndexedEnumContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cases, 0);
  objc_storeStrong((id *)&self->_typeDisplayRepresentation, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

- (CCAppIntentsIndexedEnumContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  v39[1] = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"typeIdentifier"];
    v10 = [v6 objectForKeyedSubscript:@"typeDisplayRepresentation"];
    if (v10)
    {
      v39[0] = 0;
      v11 = [[CCAppEnumTypeDisplayRepresentation alloc] initWithJSONDictionary:v10 error:v39];
      id v12 = v39[0];
      id v13 = v12;
      if (!v11 || v12)
      {
        CCSetError();

        v28 = 0;
        goto LABEL_26;
      }

      v10 = v11;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"cases"];
    if (v14)
    {
      id v13 = (id)v14;
      objc_opt_class();
      id v38 = v8;
      char v15 = CCValidateIsInstanceOfExpectedClass();
      id v16 = v8;

      if ((v15 & 1) == 0)
      {
        CCSetError();
        v28 = 0;
        id v8 = v16;
        goto LABEL_26;
      }
      id v30 = v16;
      v31 = a4;
      v32 = v9;
      v17 = objc_opt_new();
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      id v13 = v13;
      uint64_t v18 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v13);
            }
            uint64_t v22 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            v23 = [CCAppEnumCase alloc];
            id v33 = 0;
            v24 = [(CCAppEnumCase *)v23 initWithJSONDictionary:v22 error:&v33];
            id v25 = v33;
            if (v24) {
              BOOL v26 = v25 == 0;
            }
            else {
              BOOL v26 = 0;
            }
            if (!v26)
            {
              v27 = v25;
              CCSetError();

              v28 = 0;
              id v8 = v30;
              v9 = v32;
              goto LABEL_26;
            }
            [v17 addObject:v24];
          }
          uint64_t v19 = [v13 countByEnumeratingWithState:&v34 objects:v40 count:16];
        }
        while (v19);
      }

      id v8 = v30;
      a4 = v31;
      v9 = v32;
    }
    else
    {
      v17 = 0;
    }
    v28 = [[CCAppIntentsIndexedEnumContent alloc] initWithTypeIdentifier:v9 typeDisplayRepresentation:v10 cases:v17 error:a4];
    id v13 = v17;
LABEL_26:

    goto LABEL_27;
  }
  CCSetError();
  v28 = 0;
LABEL_27:

  return v28;
}

- (id)jsonDictionary
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  if (self->_typeIdentifier)
  {
    v4 = [(CCAppIntentsIndexedEnumContent *)self typeIdentifier];
    [v3 setObject:v4 forKeyedSubscript:@"typeIdentifier"];
  }
  if (self->_typeDisplayRepresentation)
  {
    v5 = [(CCAppIntentsIndexedEnumContent *)self typeDisplayRepresentation];
    id v6 = [v5 jsonDictionary];
    [v3 setObject:v6 forKeyedSubscript:@"typeDisplayRepresentation"];
  }
  v7 = objc_opt_new();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [(CCAppIntentsIndexedEnumContent *)self cases];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) jsonDictionary];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [v3 setObject:v7 forKeyedSubscript:@"cases"];
  uint64_t v14 = (void *)[v3 copy];

  return v14;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  id v8 = (void (**)(id, void *))a3;
  if (self->_typeIdentifier)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:42612 stringValue:self->_typeIdentifier];
    v8[2](v8, v5);
  }
  if (self->_typeDisplayRepresentation)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:42613 subMessageValue:self->_typeDisplayRepresentation];
    v8[2](v8, v6);
  }
  if (self->_cases)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:42614 repeatedSubMessageValue:self->_cases];
    v8[2](v8, v7);
  }
}

- (NSArray)cases
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_cases copyItems:1];
  return (NSArray *)v2;
}

- (CCAppEnumTypeDisplayRepresentation)typeDisplayRepresentation
{
  v2 = (void *)[(CCAppEnumTypeDisplayRepresentation *)self->_typeDisplayRepresentation copy];
  return (CCAppEnumTypeDisplayRepresentation *)v2;
}

- (NSString)typeIdentifier
{
  v2 = (void *)[(NSString *)self->_typeIdentifier copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v37 = a3;
  v5 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v37];
  id v6 = (int *)MEMORY[0x263F317C8];
  v7 = (int *)MEMORY[0x263F317C0];
  if (*(void *)&v5[*MEMORY[0x263F317C8]] < *(void *)&v5[*MEMORY[0x263F317C0]])
  {
    id v8 = 0;
    id v9 = 0;
    uint64_t v10 = (int *)MEMORY[0x263F317B8];
    uint64_t v11 = (int *)MEMORY[0x263F317B0];
    while (1)
    {
      if (*(void *)&v5[*v10]) {
        BOOL v12 = 0;
      }
      else {
        BOOL v12 = v9 == 0;
      }
      if (!v12) {
        goto LABEL_37;
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
            goto LABEL_36;
          }
          goto LABEL_18;
        }
      }
      *(void *)&v5[*v10] = 1;
LABEL_17:
      if (*(void *)&v5[*v10]) {
        goto LABEL_36;
      }
LABEL_18:
      unint64_t v20 = v15 >> 3;
      if ((v15 >> 3) == 3)
      {
        typeIdentifier = CCPBReaderReadDataNoCopy();
        if (!v8) {
          id v8 = objc_opt_new();
        }
        v23 = [CCAppEnumCase alloc];
        id v38 = 0;
        v24 = [(CCItemMessage *)v23 initWithData:typeIdentifier error:&v38];
        id v9 = v38;
        if (!v9 && v24) {
          [v8 addObject:v24];
        }

        goto LABEL_32;
      }
      if (v20 == 2) {
        break;
      }
      if (v20 == 1)
      {
        CCPBReaderReadStringNoCopy();
        uint64_t v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        id v9 = 0;
        typeIdentifier = self->_typeIdentifier;
        self->_typeIdentifier = v21;
LABEL_32:

        goto LABEL_33;
      }
      if ((CCPBReaderSkipValueWithTag() & 1) == 0)
      {
        v28 = (objc_class *)objc_opt_class();
        typeIdentifier = NSStringFromClass(v28);
        CCSkipFieldErrorForMessage();
        id v9 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_32;
      }
      id v9 = 0;
LABEL_33:
      if (*(void *)&v5[*v6] >= *(void *)&v5[*v7]) {
        goto LABEL_37;
      }
    }
    id v25 = [CCAppEnumTypeDisplayRepresentation alloc];
    typeIdentifier = CCPBReaderReadDataNoCopy();
    id v39 = 0;
    BOOL v26 = [(CCItemMessage *)v25 initWithData:typeIdentifier error:&v39];
    id v9 = v39;
    typeDisplayRepresentation = self->_typeDisplayRepresentation;
    self->_typeDisplayRepresentation = v26;

    goto LABEL_32;
  }
  id v8 = 0;
LABEL_36:
  id v9 = 0;
LABEL_37:
  v29 = (NSArray *)objc_msgSend(v8, "copy", a4);
  cases = self->_cases;
  self->_cases = v29;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v5[*MEMORY[0x263F317B8]])
    {
      BOOL v34 = 1;
      goto LABEL_42;
    }
    v31 = (objc_class *)objc_opt_class();
    v32 = NSStringFromClass(v31);
    id v33 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v34 = 0;
LABEL_42:

  return v34;
}

- (CCAppIntentsIndexedEnumContent)initWithTypeIdentifier:(id)a3 typeDisplayRepresentation:(id)a4 cases:(id)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = objc_opt_new();
  if (v10)
  {
    objc_opt_class();
    uint64_t v37 = 0;
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v15 = 0;
    if (!IsInstanceOfExpectedClass) {
      goto LABEL_14;
    }
    CCPBDataWriterWriteStringField();
    if (!v11)
    {
LABEL_4:
      id v16 = v15;
      if (v12) {
        goto LABEL_5;
      }
LABEL_18:
      id v15 = v16;
LABEL_19:
      v27 = objc_msgSend(v13, "immutableData", v29, v30);
      self = [(CCItemMessage *)self initWithData:v27 error:a6];

      v24 = self;
      goto LABEL_21;
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
  id v36 = v15;
  int v25 = CCValidateIsInstanceOfExpectedClass();
  id v16 = v15;

  if (!v25)
  {
    CCSetError();
    v24 = 0;
    id v15 = v16;
    goto LABEL_21;
  }
  BOOL v26 = [v11 data];
  CCPBDataWriterWriteDataField();

  if (!v12) {
    goto LABEL_18;
  }
LABEL_5:
  objc_opt_class();
  id v35 = v16;
  int v17 = CCValidateArrayValues();
  id v15 = v16;

  if (v17)
  {
    v29 = a6;
    id v30 = self;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v22), "data", v29, v30, (void)v31);
          CCPBDataWriterWriteDataField();

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v20);
    }

    a6 = v29;
    self = v30;
    goto LABEL_19;
  }
LABEL_14:
  CCSetError();
  v24 = 0;
LABEL_21:

  return v24;
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
  if ((unsigned __int16)(a3 + 22925) > 0xBu) {
    return 0;
  }
  else {
    return off_26539BDF0[(unsigned __int16)(a3 + 22925)];
  }
}

+ (unsigned)itemType
{
  return -22925;
}

@end