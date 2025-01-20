@interface CCWalletPassContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCWalletPassContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCWalletPassContent)initWithPassUniqueIdentifier:(id)a3 eventContent:(id)a4 error:(id *)a5;
- (CCWalletPassEventContent)eventContent;
- (NSString)passUniqueIdentifier;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCWalletPassContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventContent, 0);
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
}

- (CCWalletPassContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  v17[1] = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"passUniqueIdentifier"];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"eventContent"];
    if (v10)
    {
      v11 = (void *)v10;
      v17[0] = 0;
      v12 = [[CCWalletPassEventContent alloc] initWithJSONDictionary:v10 error:v17];
      id v13 = v17[0];
      v14 = v13;
      if (!v12 || v13)
      {
        CCSetError();

        v15 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      v12 = 0;
    }
    v15 = [[CCWalletPassContent alloc] initWithPassUniqueIdentifier:v9 eventContent:v12 error:a4];
    v11 = v12;
LABEL_10:

    goto LABEL_11;
  }
  CCSetError();
  v15 = 0;
LABEL_11:

  return v15;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_passUniqueIdentifier)
  {
    v4 = [(CCWalletPassContent *)self passUniqueIdentifier];
    [v3 setObject:v4 forKeyedSubscript:@"passUniqueIdentifier"];
  }
  if (self->_eventContent)
  {
    v5 = [(CCWalletPassContent *)self eventContent];
    id v6 = [v5 jsonDictionary];
    [v3 setObject:v6 forKeyedSubscript:@"eventContent"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v7 = (void (**)(id, void *))a3;
  if (self->_passUniqueIdentifier)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:46121 stringValue:self->_passUniqueIdentifier];
    v7[2](v7, v5);
  }
  if (self->_eventContent)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:46122 subMessageValue:self->_eventContent];
    v7[2](v7, v6);
  }
}

- (CCWalletPassEventContent)eventContent
{
  v2 = (void *)[(CCWalletPassEventContent *)self->_eventContent copy];
  return (CCWalletPassEventContent *)v2;
}

- (NSString)passUniqueIdentifier
{
  v2 = (void *)[(NSString *)self->_passUniqueIdentifier copy];
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
    goto LABEL_29;
  }
  id v10 = 0;
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
          goto LABEL_30;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v6[*v9] = 1;
LABEL_17:
    if (*(void *)&v6[*v9]) {
      goto LABEL_30;
    }
LABEL_18:
    if ((v15 >> 3) == 3)
    {
      v22 = [CCWalletPassEventContent alloc];
      passUniqueIdentifier = CCPBReaderReadDataNoCopy();
      id v31 = 0;
      v23 = [(CCItemMessage *)v22 initWithData:passUniqueIdentifier error:&v31];
      id v10 = v31;
      eventContent = self->_eventContent;
      self->_eventContent = v23;

      goto LABEL_25;
    }
    if ((v15 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v10 = 0;
      passUniqueIdentifier = self->_passUniqueIdentifier;
      self->_passUniqueIdentifier = v20;
LABEL_25:

      continue;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v25 = (objc_class *)objc_opt_class();
      passUniqueIdentifier = NSStringFromClass(v25);
      CCSkipFieldErrorForMessage();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    id v10 = 0;
  }
  while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
    goto LABEL_31;
  }
LABEL_29:
  if (*(void *)&v6[*v9])
  {
LABEL_30:
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v28 = CCInvalidBufferErrorForMessage();
    CCSetError();

    id v10 = 0;
LABEL_31:
    BOOL v29 = 0;
  }
  else
  {
    id v10 = 0;
    BOOL v29 = 1;
  }

  return v29;
}

- (CCWalletPassContent)initWithPassUniqueIdentifier:(id)a3 eventContent:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = objc_opt_new();
  if (!v8)
  {
    id v12 = 0;
    if (!v9) {
      goto LABEL_8;
    }
LABEL_6:
    objc_opt_class();
    id v19 = v12;
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v14 = v12;

    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      unint64_t v17 = 0;
      id v12 = v14;
      goto LABEL_11;
    }
    unint64_t v15 = [v9 data];
    CCPBDataWriterWriteDataField();

    id v12 = v14;
    goto LABEL_8;
  }
  objc_opt_class();
  int v11 = CCValidateIsInstanceOfExpectedClass();
  id v12 = 0;
  if (!v11)
  {
    CCSetError();
    unint64_t v17 = 0;
    goto LABEL_11;
  }
  CCPBDataWriterWriteStringField();
  if (v9) {
    goto LABEL_6;
  }
LABEL_8:
  uint64_t v16 = objc_msgSend(v10, "immutableData", v19);
  self = [(CCItemMessage *)self initWithData:v16 error:a5];

  unint64_t v17 = self;
LABEL_11:

  return v17;
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
  if ((unsigned __int16)(a3 + 19416) > 0xCu) {
    return 0;
  }
  else {
    return off_26539CBE0[(unsigned __int16)(a3 + 19416)];
  }
}

+ (unsigned)itemType
{
  return -19416;
}

@end