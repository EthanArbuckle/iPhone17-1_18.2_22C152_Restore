@interface CCAppIntentsIndexedEntityMetaContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasSaliency;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCAppIntentsIndexedEntityMetaContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCAppIntentsIndexedEntityMetaContent)initWithSourceItemIdentifier:(id)a3 saliency:(id)a4 error:(id *)a5;
- (NSString)sourceItemIdentifier;
- (float)saliency;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasSaliency:(BOOL)a3;
@end

@implementation CCAppIntentsIndexedEntityMetaContent

- (void).cxx_destruct
{
}

- (void)setHasSaliency:(BOOL)a3
{
  self->_hasSaliency = a3;
}

- (BOOL)hasSaliency
{
  return self->_hasSaliency;
}

- (float)saliency
{
  return self->_saliency;
}

- (CCAppIntentsIndexedEntityMetaContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"sourceItemIdentifier"];
    v10 = [v6 objectForKeyedSubscript:@"saliency"];
    v11 = [[CCAppIntentsIndexedEntityMetaContent alloc] initWithSourceItemIdentifier:v9 saliency:v10 error:a4];
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
  if (self->_sourceItemIdentifier)
  {
    v4 = [(CCAppIntentsIndexedEntityMetaContent *)self sourceItemIdentifier];
    [v3 setObject:v4 forKeyedSubscript:@"sourceItemIdentifier"];
  }
  if (self->_hasSaliency)
  {
    v5 = NSNumber;
    [(CCAppIntentsIndexedEntityMetaContent *)self saliency];
    id v6 = objc_msgSend(v5, "numberWithFloat:");
    [v3 setObject:v6 forKeyedSubscript:@"saliency"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v9 = (void (**)(id, void *))a3;
  if (self->_sourceItemIdentifier)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:47345 stringValue:self->_sourceItemIdentifier];
    v9[2](v9, v5);
  }
  if (self->_hasSaliency)
  {
    id v6 = objc_alloc(MEMORY[0x263F31708]);
    *(float *)&double v7 = self->_saliency;
    id v8 = (void *)[v6 initWithFieldType:47355 floatValue:v7];
    v9[2](v9, v8);
  }
}

- (NSString)sourceItemIdentifier
{
  v2 = (void *)[(NSString *)self->_sourceItemIdentifier copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v5];
  double v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  v9 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] >= *(void *)&v6[*MEMORY[0x263F317C0]]) {
    goto LABEL_32;
  }
  v10 = 0;
  v11 = (int *)MEMORY[0x263F317B0];
  do
  {
    if (*(void *)&v6[*v9]) {
      BOOL v12 = 0;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (!v12) {
      break;
    }
    char v13 = 0;
    unsigned int v14 = 0;
    unint64_t v15 = 0;
    while (1)
    {
      uint64_t v16 = *v7;
      uint64_t v17 = *(void *)&v6[v16];
      unint64_t v18 = v17 + 1;
      if (v17 == -1 || v18 > *(void *)&v6[*v8]) {
        break;
      }
      char v19 = *(unsigned char *)(*(void *)&v6[*v11] + v17);
      *(void *)&v6[v16] = v18;
      v15 |= (unint64_t)(v19 & 0x7F) << v13;
      if ((v19 & 0x80) == 0) {
        goto LABEL_17;
      }
      v13 += 7;
      if (v14++ >= 9)
      {
        unint64_t v15 = 0;
        uint64_t v21 = *v9;
        if (*(void *)&v6[v21]) {
          goto LABEL_33;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v6[*v9] = 1;
LABEL_17:
    uint64_t v21 = *v9;
    if (*(void *)&v6[v21]) {
      goto LABEL_33;
    }
LABEL_18:
    if ((v15 >> 3) == 3)
    {
      uint64_t v24 = *v7;
      unint64_t v25 = *(void *)&v6[v24];
      if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(void *)&v6[*v8])
      {
        float v26 = *(float *)(*(void *)&v6[*v11] + v25);
        *(void *)&v6[v24] = v25 + 4;
      }
      else
      {
        *(void *)&v6[v21] = 1;
        float v26 = 0.0;
      }
      v10 = 0;
      self->_saliency = v26;
      self->_hasSaliency = 1;
    }
    else if ((v15 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      sourceItemIdentifier = self->_sourceItemIdentifier;
      self->_sourceItemIdentifier = v22;

      v10 = 0;
    }
    else if (CCPBReaderSkipValueWithTag())
    {
      v10 = 0;
    }
    else
    {
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v29 = id v28 = v5;
      v10 = CCSkipFieldErrorForMessage();

      id v5 = v28;
    }
  }
  while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
  }
  else
  {
LABEL_32:
    if (!*(void *)&v6[*v9])
    {
      BOOL v32 = 1;
      goto LABEL_36;
    }
LABEL_33:
    v30 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v30);
    v31 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v32 = 0;
LABEL_36:

  return v32;
}

- (CCAppIntentsIndexedEntityMetaContent)initWithSourceItemIdentifier:(id)a3 saliency:(id)a4 error:(id *)a5
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
      uint64_t v16 = 0;
      id v12 = v14;
      goto LABEL_11;
    }
    [v9 floatValue];
    CCPBDataWriterWriteFloatField();
    id v12 = v14;
    goto LABEL_8;
  }
  objc_opt_class();
  int v11 = CCValidateIsInstanceOfExpectedClass();
  id v12 = 0;
  if (!v11)
  {
    CCSetError();
    uint64_t v16 = 0;
    goto LABEL_11;
  }
  CCPBDataWriterWriteStringField();
  if (v9) {
    goto LABEL_6;
  }
LABEL_8:
  unint64_t v15 = objc_msgSend(v10, "immutableData", v18);
  self = [(CCItemMessage *)self initWithData:v15 error:a5];

  uint64_t v16 = self;
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
  v3 = @"saliency";
  if (a3 != 47355) {
    v3 = 0;
  }
  if (a3 == 47345) {
    return @"sourceItemIdentifier";
  }
  else {
    return v3;
  }
}

+ (unsigned)itemType
{
  return -18195;
}

@end