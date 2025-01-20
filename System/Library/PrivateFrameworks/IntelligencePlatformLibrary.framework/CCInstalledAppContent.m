@interface CCInstalledAppContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCInstalledAppContent)initWithBundleIdentifier:(id)a3 bundleName:(id)a4 displayAppName:(id)a5 spokenName:(id)a6 alternativeAppNames:(id)a7 carPlayAlternativeDisplayName:(id)a8 spotlightName:(id)a9 providerName:(id)a10 error:(id *)a11;
- (CCInstalledAppContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (NSArray)alternativeAppNames;
- (NSString)bundleIdentifier;
- (NSString)bundleName;
- (NSString)carPlayAlternativeDisplayName;
- (NSString)displayAppName;
- (NSString)providerName;
- (NSString)spokenName;
- (NSString)spotlightName;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCInstalledAppContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerName, 0);
  objc_storeStrong((id *)&self->_spotlightName, 0);
  objc_storeStrong((id *)&self->_carPlayAlternativeDisplayName, 0);
  objc_storeStrong((id *)&self->_alternativeAppNames, 0);
  objc_storeStrong((id *)&self->_spokenName, 0);
  objc_storeStrong((id *)&self->_displayAppName, 0);
  objc_storeStrong((id *)&self->_bundleName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

- (CCInstalledAppContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"bundleIdentifier"];
    v10 = [v6 objectForKeyedSubscript:@"bundleName"];
    v11 = [v6 objectForKeyedSubscript:@"displayAppName"];
    [v6 objectForKeyedSubscript:@"spokenName"];
    v12 = id v19 = v8;
    v13 = [v6 objectForKeyedSubscript:@"alternativeAppNames"];
    v14 = [v6 objectForKeyedSubscript:@"carPlayAlternativeDisplayName"];
    [v6 objectForKeyedSubscript:@"spotlightName"];
    v15 = v20 = self;
    v16 = [v6 objectForKeyedSubscript:@"providerName"];
    v17 = [[CCInstalledAppContent alloc] initWithBundleIdentifier:v9 bundleName:v10 displayAppName:v11 spokenName:v12 alternativeAppNames:v13 carPlayAlternativeDisplayName:v14 spotlightName:v15 providerName:v16 error:a4];

    self = v20;
    id v8 = v19;
  }
  else
  {
    CCSetError();
    v17 = 0;
  }

  return v17;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_bundleIdentifier)
  {
    v4 = [(CCInstalledAppContent *)self bundleIdentifier];
    [v3 setObject:v4 forKeyedSubscript:@"bundleIdentifier"];
  }
  if (self->_bundleName)
  {
    v5 = [(CCInstalledAppContent *)self bundleName];
    [v3 setObject:v5 forKeyedSubscript:@"bundleName"];
  }
  if (self->_displayAppName)
  {
    id v6 = [(CCInstalledAppContent *)self displayAppName];
    [v3 setObject:v6 forKeyedSubscript:@"displayAppName"];
  }
  if (self->_spokenName)
  {
    v7 = [(CCInstalledAppContent *)self spokenName];
    [v3 setObject:v7 forKeyedSubscript:@"spokenName"];
  }
  if (self->_alternativeAppNames)
  {
    id v8 = [(CCInstalledAppContent *)self alternativeAppNames];
    [v3 setObject:v8 forKeyedSubscript:@"alternativeAppNames"];
  }
  if (self->_carPlayAlternativeDisplayName)
  {
    v9 = [(CCInstalledAppContent *)self carPlayAlternativeDisplayName];
    [v3 setObject:v9 forKeyedSubscript:@"carPlayAlternativeDisplayName"];
  }
  if (self->_spotlightName)
  {
    v10 = [(CCInstalledAppContent *)self spotlightName];
    [v3 setObject:v10 forKeyedSubscript:@"spotlightName"];
  }
  if (self->_providerName)
  {
    v11 = [(CCInstalledAppContent *)self providerName];
    [v3 setObject:v11 forKeyedSubscript:@"providerName"];
  }
  v12 = (void *)[v3 copy];

  return v12;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v13 = (void (**)(id, void *))a3;
  if (self->_bundleIdentifier)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:36437 stringValue:self->_bundleIdentifier];
    v13[2](v13, v5);
  }
  if (self->_bundleName)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:36438 stringValue:self->_bundleName];
    v13[2](v13, v6);
  }
  if (self->_displayAppName)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:36439 stringValue:self->_displayAppName];
    v13[2](v13, v7);
  }
  if (self->_spokenName)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:36440 stringValue:self->_spokenName];
    v13[2](v13, v8);
  }
  if (self->_alternativeAppNames)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:36441 repeatedStringValue:self->_alternativeAppNames];
    v13[2](v13, v9);
  }
  if (self->_carPlayAlternativeDisplayName)
  {
    v10 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:36442 stringValue:self->_carPlayAlternativeDisplayName];
    v13[2](v13, v10);
  }
  if (self->_spotlightName)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:36443 stringValue:self->_spotlightName];
    v13[2](v13, v11);
  }
  if (self->_providerName)
  {
    v12 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:36444 stringValue:self->_providerName];
    v13[2](v13, v12);
  }
}

- (NSString)providerName
{
  v2 = (void *)[(NSString *)self->_providerName copy];
  return (NSString *)v2;
}

- (NSString)spotlightName
{
  v2 = (void *)[(NSString *)self->_spotlightName copy];
  return (NSString *)v2;
}

- (NSString)carPlayAlternativeDisplayName
{
  v2 = (void *)[(NSString *)self->_carPlayAlternativeDisplayName copy];
  return (NSString *)v2;
}

- (NSArray)alternativeAppNames
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_alternativeAppNames copyItems:1];
  return (NSArray *)v2;
}

- (NSString)spokenName
{
  v2 = (void *)[(NSString *)self->_spokenName copy];
  return (NSString *)v2;
}

- (NSString)displayAppName
{
  v2 = (void *)[(NSString *)self->_displayAppName copy];
  return (NSString *)v2;
}

- (NSString)bundleName
{
  v2 = (void *)[(NSString *)self->_bundleName copy];
  return (NSString *)v2;
}

- (NSString)bundleIdentifier
{
  v2 = (void *)[(NSString *)self->_bundleIdentifier copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v6];
  id v8 = (int *)MEMORY[0x263F317C8];
  v9 = (int *)MEMORY[0x263F317C0];
  if (*(void *)&v7[*MEMORY[0x263F317C8]] >= *(void *)&v7[*MEMORY[0x263F317C0]])
  {
    v33 = 0;
    goto LABEL_39;
  }
  v33 = 0;
  v10 = 0;
  v11 = (int *)MEMORY[0x263F317B8];
  v12 = (int *)MEMORY[0x263F317B0];
  v32 = a4;
LABEL_3:
  if (*(void *)&v7[*v11]) {
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
      if (v15++ >= 9)
      {
        unint64_t v16 = 0;
        if (*(void *)&v7[*v11]) {
          goto LABEL_39;
        }
LABEL_18:
        switch((v16 >> 3))
        {
          case 1u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            uint64_t v22 = 16;
            goto LABEL_33;
          case 2u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            uint64_t v22 = 24;
            goto LABEL_33;
          case 3u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            uint64_t v22 = 32;
            goto LABEL_33;
          case 4u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            uint64_t v22 = 40;
            goto LABEL_33;
          case 5u:
            v23 = CCPBReaderReadStringNoCopy();
            if (!v33) {
              v33 = objc_opt_new();
            }
            if (v23) {
              [v33 addObject:v23];
            }
            v10 = 0;
            goto LABEL_34;
          case 6u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            uint64_t v22 = 56;
            goto LABEL_33;
          case 7u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            uint64_t v22 = 64;
            goto LABEL_33;
          case 8u:
            CCPBReaderReadStringNoCopy();
            v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
            v10 = 0;
            uint64_t v22 = 72;
LABEL_33:
            v23 = *(Class *)((char *)&self->super.super.isa + v22);
            *(Class *)((char *)&self->super.super.isa + v22) = v21;
            goto LABEL_34;
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
LABEL_34:
            }
            if (*(void *)&v7[*v8] >= *(void *)&v7[*v9]) {
              goto LABEL_40;
            }
            goto LABEL_3;
        }
      }
    }
    *(void *)&v7[*v11] = 1;
LABEL_17:
    if (!*(void *)&v7[*v11]) {
      goto LABEL_18;
    }
LABEL_39:
    v10 = 0;
  }
LABEL_40:
  v25 = (NSArray *)objc_msgSend(v33, "copy", v32);
  alternativeAppNames = self->_alternativeAppNames;
  self->_alternativeAppNames = v25;

  if (v10)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v7[*MEMORY[0x263F317B8]])
    {
      BOOL v30 = 1;
      goto LABEL_45;
    }
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v29 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v30 = 0;
LABEL_45:

  return v30;
}

- (CCInstalledAppContent)initWithBundleIdentifier:(id)a3 bundleName:(id)a4 displayAppName:(id)a5 spokenName:(id)a6 alternativeAppNames:(id)a7 carPlayAlternativeDisplayName:(id)a8 spotlightName:(id)a9 providerName:(id)a10 error:(id *)a11
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v55 = a8;
  id v21 = a9;
  id v54 = a10;
  uint64_t v22 = objc_opt_new();
  v52 = v16;
  if (v16)
  {
    objc_opt_class();
    uint64_t v64 = 0;
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v24 = 0;
    if (!IsInstanceOfExpectedClass)
    {
      v28 = v17;
      v29 = v18;
      BOOL v30 = v19;
      v31 = v20;
      goto LABEL_15;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v24 = 0;
  }
  id v51 = v21;
  if (v17)
  {
    objc_opt_class();
    id v63 = v24;
    int v25 = CCValidateIsInstanceOfExpectedClass();
    id v26 = v24;

    if (!v25)
    {
LABEL_12:
      v28 = v17;
      v29 = v18;
      BOOL v30 = v19;
      v31 = v20;
LABEL_13:
      CCSetError();
      v32 = 0;
      id v24 = v26;
LABEL_37:
      v33 = self;
      v34 = v55;
LABEL_38:
      id v21 = v51;
      goto LABEL_39;
    }
    CCPBDataWriterWriteStringField();
    if (!v18)
    {
LABEL_8:
      id v24 = v26;
      if (v19) {
        goto LABEL_9;
      }
LABEL_20:
      id v26 = v24;
      if (!v20) {
        goto LABEL_11;
      }
      goto LABEL_21;
    }
  }
  else
  {
    id v26 = v24;
    if (!v18) {
      goto LABEL_8;
    }
  }
  objc_opt_class();
  id v62 = v26;
  int v35 = CCValidateIsInstanceOfExpectedClass();
  id v24 = v26;

  if (!v35) {
    goto LABEL_36;
  }
  CCPBDataWriterWriteStringField();
  if (!v19) {
    goto LABEL_20;
  }
LABEL_9:
  objc_opt_class();
  id v61 = v24;
  int v27 = CCValidateIsInstanceOfExpectedClass();
  id v26 = v24;

  if (!v27) {
    goto LABEL_12;
  }
  CCPBDataWriterWriteStringField();
  if (v20)
  {
LABEL_21:
    objc_opt_class();
    id v60 = v26;
    int v36 = CCValidateArrayValues();
    id v24 = v26;

    if (v36)
    {
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id v50 = v20;
      id v37 = v20;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v56 objects:v65 count:16];
      if (v38)
      {
        uint64_t v39 = v38;
        uint64_t v40 = *(void *)v57;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v57 != v40) {
              objc_enumerationMutation(v37);
            }
            CCPBDataWriterWriteStringField();
          }
          uint64_t v39 = [v37 countByEnumeratingWithState:&v56 objects:v65 count:16];
        }
        while (v39);
      }

      id v20 = v50;
      goto LABEL_30;
    }
LABEL_36:
    v28 = v17;
    v29 = v18;
    BOOL v30 = v19;
    v31 = v20;
    CCSetError();
    v32 = 0;
    goto LABEL_37;
  }
LABEL_11:
  id v24 = v26;
LABEL_30:
  if (v55)
  {
    v28 = v17;
    v29 = v18;
    BOOL v30 = v19;
    objc_opt_class();
    int v42 = CCValidateIsInstanceOfExpectedClass();
    v34 = v55;
    id v43 = v24;

    if (!v42)
    {
      v31 = v20;
      CCSetError();
      v32 = 0;
      id v24 = v43;
      v33 = self;
      goto LABEL_38;
    }
    id v24 = v43;
    CCPBDataWriterWriteStringField();
    id v19 = v30;
    id v18 = v29;
    id v17 = v28;
  }
  id v21 = v51;
  if (!v51)
  {
    v31 = v20;
    goto LABEL_42;
  }
  v31 = v20;
  objc_opt_class();
  v44 = v24;
  int v45 = CCValidateIsInstanceOfExpectedClass();
  id v24 = v24;

  if (v45)
  {
    CCPBDataWriterWriteStringField();
LABEL_42:
    v47 = self;
    v28 = v17;
    if (!v54)
    {
      v29 = v18;
      BOOL v30 = v19;
      goto LABEL_47;
    }
    v29 = v18;
    objc_opt_class();
    int v48 = CCValidateIsInstanceOfExpectedClass();
    id v26 = v24;

    if (v48)
    {
      BOOL v30 = v19;
      CCPBDataWriterWriteStringField();
      id v24 = v26;
      v47 = self;
      id v21 = v51;
LABEL_47:
      v49 = objc_msgSend(v22, "immutableData", v50);
      v33 = [(CCItemMessage *)v47 initWithData:v49 error:a11];

      v32 = v33;
      goto LABEL_16;
    }
    BOOL v30 = v19;
    goto LABEL_13;
  }
  v28 = v17;
  v29 = v18;
  BOOL v30 = v19;
LABEL_15:
  CCSetError();
  v32 = 0;
  v33 = self;
LABEL_16:
  v34 = v55;
LABEL_39:

  return v32;
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
  if ((unsigned __int16)(a3 + 29102) > 0xAu) {
    return 0;
  }
  else {
    return *(&off_26539C6E8 + (unsigned __int16)(a3 + 29102));
  }
}

+ (unsigned)itemType
{
  return -29102;
}

@end