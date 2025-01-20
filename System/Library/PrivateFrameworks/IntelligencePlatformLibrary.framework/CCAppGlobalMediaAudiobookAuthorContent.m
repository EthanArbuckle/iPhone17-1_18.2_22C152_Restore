@interface CCAppGlobalMediaAudiobookAuthorContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCAppGlobalMediaAudiobookAuthorContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCAppGlobalMediaAudiobookAuthorContent)initWithVocabularyStrings:(id)a3 error:(id *)a4;
- (NSArray)vocabularyStrings;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCAppGlobalMediaAudiobookAuthorContent

- (void).cxx_destruct
{
}

- (CCAppGlobalMediaAudiobookAuthorContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"vocabularyStrings"];
    v10 = [[CCAppGlobalMediaAudiobookAuthorContent alloc] initWithVocabularyStrings:v9 error:a4];
  }
  else
  {
    CCSetError();
    v10 = 0;
  }

  return v10;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_vocabularyStrings)
  {
    v4 = [(CCAppGlobalMediaAudiobookAuthorContent *)self vocabularyStrings];
    [v3 setObject:v4 forKeyedSubscript:@"vocabularyStrings"];
  }
  v5 = (void *)[v3 copy];

  return v5;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  if (self->_vocabularyStrings)
  {
    id v6 = (objc_class *)MEMORY[0x263F31708];
    id v7 = a3;
    id v8 = (id)[[v6 alloc] initWithFieldType:14030 repeatedStringValue:self->_vocabularyStrings];
    (*((void (**)(id, id))a3 + 2))(v7, v8);
  }
}

- (NSArray)vocabularyStrings
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_vocabularyStrings copyItems:1];
  return (NSArray *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  v30 = a4;
  id v31 = a3;
  v5 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v31];
  id v6 = (int *)MEMORY[0x263F317C8];
  id v7 = (int *)MEMORY[0x263F317C0];
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
        goto LABEL_33;
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
            goto LABEL_32;
          }
          goto LABEL_18;
        }
      }
      *(void *)&v5[*v10] = 1;
LABEL_17:
      if (*(void *)&v5[*v10]) {
        goto LABEL_32;
      }
LABEL_18:
      if ((v15 >> 3) == 1) {
        break;
      }
      if ((CCPBReaderSkipValueWithTag() & 1) == 0)
      {
        v22 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v22);
        v9 = CCSkipFieldErrorForMessage();
        goto LABEL_26;
      }
      v9 = 0;
LABEL_27:
      if (*(void *)&v5[*v6] >= *(void *)&v5[*v7]) {
        goto LABEL_33;
      }
    }
    uint64_t v20 = CCPBReaderReadStringNoCopy();
    v21 = (void *)v20;
    if (v8)
    {
      if (!v20)
      {
LABEL_22:
        v9 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    else
    {
      id v8 = objc_opt_new();
      if (!v21) {
        goto LABEL_22;
      }
    }
    objc_msgSend(v8, "addObject:", v21, v30);
    goto LABEL_22;
  }
  id v8 = 0;
LABEL_32:
  v9 = 0;
LABEL_33:
  v23 = (NSArray *)objc_msgSend(v8, "copy", v30);
  vocabularyStrings = self->_vocabularyStrings;
  self->_vocabularyStrings = v23;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v5[*MEMORY[0x263F317B8]])
    {
      BOOL v28 = 1;
      goto LABEL_38;
    }
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v28 = 0;
LABEL_38:

  return v28;
}

- (CCAppGlobalMediaAudiobookAuthorContent)initWithVocabularyStrings:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_opt_new();
  if (v6)
  {
    objc_opt_class();
    uint64_t v22 = 0;
    int v8 = CCValidateArrayValues();
    id v9 = 0;
    if (!v8)
    {
      CCSetError();
      uint64_t v16 = 0;
      goto LABEL_14;
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          CCPBDataWriterWriteStringField();
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v12);
    }
  }
  else
  {
    id v9 = 0;
  }
  unint64_t v15 = objc_msgSend(v7, "immutableData", v18);
  self = [(CCItemMessage *)self initWithData:v15 error:a4];

  uint64_t v16 = self;
LABEL_14:

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
  v3 = @"vocabularyStrings";
  if (a3 != 14030) {
    v3 = 0;
  }
  if (a3 == 14025) {
    return @"AppGlobalMediaAudiobookAuthor";
  }
  else {
    return v3;
  }
}

+ (unsigned)itemType
{
  return 14025;
}

@end