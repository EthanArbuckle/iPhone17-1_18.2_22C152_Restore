@interface CCAppEnumCaseDisplayRepresentation
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCAppEnumCaseDisplayRepresentation)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCAppEnumCaseDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 synonyms:(id)a5 error:(id *)a6;
- (NSArray)synonyms;
- (NSString)subtitle;
- (NSString)title;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCAppEnumCaseDisplayRepresentation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (CCAppEnumCaseDisplayRepresentation)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"title"];
    v10 = [v6 objectForKeyedSubscript:@"subtitle"];
    v11 = [v6 objectForKeyedSubscript:@"synonyms"];
    v12 = [[CCAppEnumCaseDisplayRepresentation alloc] initWithTitle:v9 subtitle:v10 synonyms:v11 error:a4];
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
  if (self->_title)
  {
    v4 = [(CCAppEnumCaseDisplayRepresentation *)self title];
    [v3 setObject:v4 forKeyedSubscript:@"title"];
  }
  if (self->_subtitle)
  {
    v5 = [(CCAppEnumCaseDisplayRepresentation *)self subtitle];
    [v3 setObject:v5 forKeyedSubscript:@"subtitle"];
  }
  if (self->_synonyms)
  {
    id v6 = [(CCAppEnumCaseDisplayRepresentation *)self synonyms];
    [v3 setObject:v6 forKeyedSubscript:@"synonyms"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  id v8 = (void (**)(id, void *))a3;
  if (self->_title)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:42618 stringValue:self->_title];
    v8[2](v8, v5);
  }
  if (self->_subtitle)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:42619 stringValue:self->_subtitle];
    v8[2](v8, v6);
  }
  if (self->_synonyms)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:42620 repeatedStringValue:self->_synonyms];
    v8[2](v8, v7);
  }
}

- (NSArray)synonyms
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_synonyms copyItems:1];
  return (NSArray *)v2;
}

- (NSString)subtitle
{
  v2 = (void *)[(NSString *)self->_subtitle copy];
  return (NSString *)v2;
}

- (NSString)title
{
  v2 = (void *)[(NSString *)self->_title copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v33 = a3;
  v5 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v33];
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
        v23 = CCPBReaderReadStringNoCopy();
        if (!v8) {
          id v8 = objc_opt_new();
        }
        if (v23) {
          [v8 addObject:v23];
        }
        v9 = 0;
        goto LABEL_29;
      }
      if (v20 == 2) {
        break;
      }
      if (v20 == 1)
      {
        CCPBReaderReadStringNoCopy();
        v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
        v9 = 0;
        uint64_t v22 = 16;
LABEL_28:
        v23 = *(Class *)((char *)&self->super.super.isa + v22);
        *(Class *)((char *)&self->super.super.isa + v22) = v21;
        goto LABEL_29;
      }
      if (CCPBReaderSkipValueWithTag())
      {
        v9 = 0;
        goto LABEL_30;
      }
      v24 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v24);
      v9 = CCSkipFieldErrorForMessage();
LABEL_29:

LABEL_30:
      if (*(void *)&v5[*v6] >= *(void *)&v5[*v7]) {
        goto LABEL_37;
      }
    }
    CCPBReaderReadStringNoCopy();
    v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    uint64_t v22 = 24;
    goto LABEL_28;
  }
  id v8 = 0;
LABEL_36:
  v9 = 0;
LABEL_37:
  v25 = (NSArray *)objc_msgSend(v8, "copy", a4);
  synonyms = self->_synonyms;
  self->_synonyms = v25;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v5[*MEMORY[0x263F317B8]])
    {
      BOOL v30 = 1;
      goto LABEL_42;
    }
    v27 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v27);
    v29 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v30 = 0;
LABEL_42:

  return v30;
}

- (CCAppEnumCaseDisplayRepresentation)initWithTitle:(id)a3 subtitle:(id)a4 synonyms:(id)a5 error:(id *)a6
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = objc_opt_new();
  if (v10)
  {
    objc_opt_class();
    uint64_t v34 = 0;
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
      v25 = [v13 immutableData];
      self = [(CCItemMessage *)self initWithData:v25 error:a6];

      v23 = self;
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
  id v33 = v15;
  int v24 = CCValidateIsInstanceOfExpectedClass();
  id v16 = v15;

  if (!v24)
  {
    CCSetError();
    v23 = 0;
    id v15 = v16;
    goto LABEL_21;
  }
  CCPBDataWriterWriteStringField();
  if (!v12) {
    goto LABEL_18;
  }
LABEL_5:
  objc_opt_class();
  id v32 = v16;
  int v17 = CCValidateArrayValues();
  id v15 = v16;

  if (v17)
  {
    v27 = a6;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v18 = v12;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v29;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v29 != v21) {
            objc_enumerationMutation(v18);
          }
          CCPBDataWriterWriteStringField();
          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = [v18 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v20);
    }

    a6 = v27;
    goto LABEL_19;
  }
LABEL_14:
  CCSetError();
  v23 = 0;
LABEL_21:

  return v23;
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