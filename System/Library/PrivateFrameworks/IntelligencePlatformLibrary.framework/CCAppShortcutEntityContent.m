@interface CCAppShortcutEntityContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCAppShortcutEntityContent)initWithEntityTitle:(id)a3 entityInstanceIdentifier:(id)a4 entityTypeIdentifier:(id)a5 providerClass:(id)a6 entitySynonyms:(id)a7 error:(id *)a8;
- (CCAppShortcutEntityContent)initWithEntityTitle:(id)a3 entityInstanceIdentifier:(id)a4 entityTypeIdentifier:(id)a5 providerClass:(id)a6 error:(id *)a7;
- (CCAppShortcutEntityContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (NSArray)entitySynonyms;
- (NSString)entityInstanceIdentifier;
- (NSString)entityTitle;
- (NSString)entityTypeIdentifier;
- (NSString)providerClass;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCAppShortcutEntityContent

- (CCAppShortcutEntityContent)initWithEntityTitle:(id)a3 entityInstanceIdentifier:(id)a4 entityTypeIdentifier:(id)a5 providerClass:(id)a6 error:(id *)a7
{
  return [(CCAppShortcutEntityContent *)self initWithEntityTitle:a3 entityInstanceIdentifier:a4 entityTypeIdentifier:a5 providerClass:a6 entitySynonyms:0 error:a7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitySynonyms, 0);
  objc_storeStrong((id *)&self->_providerClass, 0);
  objc_storeStrong((id *)&self->_entityTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_entityInstanceIdentifier, 0);
  objc_storeStrong((id *)&self->_entityTitle, 0);
}

- (CCAppShortcutEntityContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"entityTitle"];
    v10 = [v6 objectForKeyedSubscript:@"entityInstanceIdentifier"];
    v11 = [v6 objectForKeyedSubscript:@"entityTypeIdentifier"];
    v12 = [v6 objectForKeyedSubscript:@"providerClass"];
    v13 = [v6 objectForKeyedSubscript:@"entitySynonyms"];
    v14 = [[CCAppShortcutEntityContent alloc] initWithEntityTitle:v9 entityInstanceIdentifier:v10 entityTypeIdentifier:v11 providerClass:v12 entitySynonyms:v13 error:a4];
  }
  else
  {
    CCSetError();
    v14 = 0;
  }

  return v14;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_entityTitle)
  {
    v4 = [(CCAppShortcutEntityContent *)self entityTitle];
    [v3 setObject:v4 forKeyedSubscript:@"entityTitle"];
  }
  if (self->_entityInstanceIdentifier)
  {
    v5 = [(CCAppShortcutEntityContent *)self entityInstanceIdentifier];
    [v3 setObject:v5 forKeyedSubscript:@"entityInstanceIdentifier"];
  }
  if (self->_entityTypeIdentifier)
  {
    id v6 = [(CCAppShortcutEntityContent *)self entityTypeIdentifier];
    [v3 setObject:v6 forKeyedSubscript:@"entityTypeIdentifier"];
  }
  if (self->_providerClass)
  {
    v7 = [(CCAppShortcutEntityContent *)self providerClass];
    [v3 setObject:v7 forKeyedSubscript:@"providerClass"];
  }
  if (self->_entitySynonyms)
  {
    id v8 = [(CCAppShortcutEntityContent *)self entitySynonyms];
    [v3 setObject:v8 forKeyedSubscript:@"entitySynonyms"];
  }
  v9 = (void *)[v3 copy];

  return v9;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v10 = (void (**)(id, void *))a3;
  if (self->_entityTitle)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7825 stringValue:self->_entityTitle];
    v10[2](v10, v5);
  }
  if (self->_entityInstanceIdentifier)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7826 stringValue:self->_entityInstanceIdentifier];
    v10[2](v10, v6);
  }
  if (self->_entityTypeIdentifier)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7827 stringValue:self->_entityTypeIdentifier];
    v10[2](v10, v7);
  }
  if (self->_providerClass)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7828 stringValue:self->_providerClass];
    v10[2](v10, v8);
  }
  if (self->_entitySynonyms)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:7830 repeatedStringValue:self->_entitySynonyms];
    v10[2](v10, v9);
  }
}

- (NSArray)entitySynonyms
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_entitySynonyms copyItems:1];
  return (NSArray *)v2;
}

- (NSString)providerClass
{
  v2 = (void *)[(NSString *)self->_providerClass copy];
  return (NSString *)v2;
}

- (NSString)entityTypeIdentifier
{
  v2 = (void *)[(NSString *)self->_entityTypeIdentifier copy];
  return (NSString *)v2;
}

- (NSString)entityInstanceIdentifier
{
  v2 = (void *)[(NSString *)self->_entityInstanceIdentifier copy];
  return (NSString *)v2;
}

- (NSString)entityTitle
{
  v2 = (void *)[(NSString *)self->_entityTitle copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v5];
  v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] >= *(void *)&v6[*MEMORY[0x263F317C0]])
  {
    v9 = 0;
    goto LABEL_36;
  }
  v9 = 0;
  v10 = 0;
  v11 = (int *)MEMORY[0x263F317B8];
  v12 = (int *)MEMORY[0x263F317B0];
LABEL_3:
  if (*(void *)&v6[*v11]) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v10 == 0;
  }
  if (v13)
  {
    char v14 = 0;
    unsigned int v15 = 0;
    unint64_t v16 = 0;
    while (1)
    {
      uint64_t v17 = *v7;
      unint64_t v18 = *(void *)&v6[v17];
      if (v18 == -1 || v18 >= *(void *)&v6[*v8]) {
        break;
      }
      char v19 = *(unsigned char *)(*(void *)&v6[*v12] + v18);
      *(void *)&v6[v17] = v18 + 1;
      v16 |= (unint64_t)(v19 & 0x7F) << v14;
      if ((v19 & 0x80) == 0) {
        goto LABEL_17;
      }
      v14 += 7;
      if (v15++ >= 9)
      {
        unint64_t v16 = 0;
        if (*(void *)&v6[*v11]) {
          goto LABEL_36;
        }
LABEL_18:
        switch((v16 >> 3))
        {
          case 1u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            uint64_t v22 = 16;
            goto LABEL_25;
          case 2u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            uint64_t v22 = 24;
            goto LABEL_25;
          case 3u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            uint64_t v22 = 32;
            goto LABEL_25;
          case 4u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            uint64_t v22 = 40;
LABEL_25:
            v23 = *(Class *)((char *)&self->super.super.isa + v22);
            *(Class *)((char *)&self->super.super.isa + v22) = v21;
            goto LABEL_26;
          case 5u:
            v23 = CCPBReaderReadStringNoCopy();
            if (!v9) {
              v9 = objc_opt_new();
            }
            if (v23) {
              [v9 addObject:v23];
            }
            v10 = 0;
            goto LABEL_26;
          default:
            if (CCPBReaderSkipValueWithTag())
            {
              v10 = 0;
            }
            else
            {
              v24 = (objc_class *)objc_opt_class();
              v23 = NSStringFromClass(v24);
              v10 = CCSkipFieldErrorForMessage();
LABEL_26:

              v11 = (int *)MEMORY[0x263F317B8];
            }
            if (*(void *)&v6[*v7] >= *(void *)&v6[*v8]) {
              goto LABEL_37;
            }
            goto LABEL_3;
        }
      }
    }
    *(void *)&v6[*v11] = 1;
LABEL_17:
    if (!*(void *)&v6[*v11]) {
      goto LABEL_18;
    }
LABEL_36:
    v10 = 0;
  }
LABEL_37:
  v25 = (NSArray *)[v9 copy];
  entitySynonyms = self->_entitySynonyms;
  self->_entitySynonyms = v25;

  v27 = v9;
  if (v10)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v6[*MEMORY[0x263F317B8]])
    {
      BOOL v31 = 1;
      goto LABEL_42;
    }
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    v30 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v31 = 0;
LABEL_42:

  return v31;
}

- (CCAppShortcutEntityContent)initWithEntityTitle:(id)a3 entityInstanceIdentifier:(id)a4 entityTypeIdentifier:(id)a5 providerClass:(id)a6 entitySynonyms:(id)a7 error:(id *)a8
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  unint64_t v18 = objc_opt_new();
  if (!v13)
  {
    id v20 = 0;
LABEL_5:
    v35 = self;
    if (v14)
    {
      objc_opt_class();
      id v44 = v20;
      int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
      id v22 = v20;

      if (!IsInstanceOfExpectedClass) {
        goto LABEL_12;
      }
      CCPBDataWriterWriteStringField();
      if (!v15)
      {
LABEL_8:
        id v20 = v22;
        if (v16) {
          goto LABEL_9;
        }
        goto LABEL_17;
      }
    }
    else
    {
      id v22 = v20;
      if (!v15) {
        goto LABEL_8;
      }
    }
    objc_opt_class();
    id v43 = v22;
    int v25 = CCValidateIsInstanceOfExpectedClass();
    id v20 = v22;

    if (!v25)
    {
LABEL_28:
      CCSetError();
      v24 = 0;
      goto LABEL_29;
    }
    CCPBDataWriterWriteStringField();
    if (v16)
    {
LABEL_9:
      objc_opt_class();
      id v42 = v20;
      int v23 = CCValidateIsInstanceOfExpectedClass();
      id v22 = v20;

      if (v23)
      {
        CCPBDataWriterWriteStringField();
        if (!v17)
        {
LABEL_11:
          id v20 = v22;
LABEL_27:
          v32 = [v18 immutableData];
          self = [(CCItemMessage *)v35 initWithData:v32 error:a8];

          v24 = self;
          goto LABEL_30;
        }
        goto LABEL_18;
      }
LABEL_12:
      CCSetError();
      v24 = 0;
      id v20 = v22;
LABEL_29:
      self = v35;
      goto LABEL_30;
    }
LABEL_17:
    id v22 = v20;
    if (!v17) {
      goto LABEL_11;
    }
LABEL_18:
    objc_opt_class();
    id v41 = v22;
    int v26 = CCValidateArrayValues();
    id v20 = v22;

    if (v26)
    {
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v34 = v17;
      id v27 = v17;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v38;
        do
        {
          uint64_t v31 = 0;
          do
          {
            if (*(void *)v38 != v30) {
              objc_enumerationMutation(v27);
            }
            CCPBDataWriterWriteStringField();
            ++v31;
          }
          while (v29 != v31);
          uint64_t v29 = [v27 countByEnumeratingWithState:&v37 objects:v46 count:16];
        }
        while (v29);
      }

      id v17 = v34;
      goto LABEL_27;
    }
    goto LABEL_28;
  }
  objc_opt_class();
  uint64_t v45 = 0;
  int v19 = CCValidateIsInstanceOfExpectedClass();
  id v20 = 0;
  if (v19)
  {
    CCPBDataWriterWriteStringField();
    goto LABEL_5;
  }
  CCSetError();
  v24 = 0;
LABEL_30:

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
  if ((a3 - 7822) > 8) {
    return 0;
  }
  else {
    return *(&off_26539BE50 + (unsigned __int16)(a3 - 7822));
  }
}

+ (unsigned)itemType
{
  return 7822;
}

@end