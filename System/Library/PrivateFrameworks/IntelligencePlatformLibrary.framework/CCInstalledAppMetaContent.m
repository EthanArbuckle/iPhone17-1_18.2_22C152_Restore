@interface CCInstalledAppMetaContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCInstalledAppMetaContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCInstalledAppMetaContent)initWithSourceItemIdentifier:(id)a3 bundleVersion:(id)a4 error:(id *)a5;
- (NSString)bundleVersion;
- (NSString)sourceItemIdentifier;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCInstalledAppMetaContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_sourceItemIdentifier, 0);
}

- (CCInstalledAppMetaContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"sourceItemIdentifier"];
    v10 = [v6 objectForKeyedSubscript:@"bundleVersion"];
    v11 = [[CCInstalledAppMetaContent alloc] initWithSourceItemIdentifier:v9 bundleVersion:v10 error:a4];
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
    v4 = [(CCInstalledAppMetaContent *)self sourceItemIdentifier];
    [v3 setObject:v4 forKeyedSubscript:@"sourceItemIdentifier"];
  }
  if (self->_bundleVersion)
  {
    v5 = [(CCInstalledAppMetaContent *)self bundleVersion];
    [v3 setObject:v5 forKeyedSubscript:@"bundleVersion"];
  }
  id v6 = (void *)[v3 copy];

  return v6;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v7 = (void (**)(id, void *))a3;
  if (self->_sourceItemIdentifier)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:36445 stringValue:self->_sourceItemIdentifier];
    v7[2](v7, v5);
  }
  if (self->_bundleVersion)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:36446 stringValue:self->_bundleVersion];
    v7[2](v7, v6);
  }
}

- (NSString)bundleVersion
{
  v2 = (void *)[(NSString *)self->_bundleVersion copy];
  return (NSString *)v2;
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
  v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  v9 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] >= *(void *)&v6[*MEMORY[0x263F317C0]]) {
    goto LABEL_30;
  }
  v10 = 0;
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
          goto LABEL_31;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v6[*v9] = 1;
LABEL_17:
    if (*(void *)&v6[*v9]) {
      goto LABEL_31;
    }
LABEL_18:
    if ((v15 >> 3) == 2)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      uint64_t v21 = 24;
LABEL_22:
      v22 = *(Class *)((char *)&self->super.super.isa + v21);
      *(Class *)((char *)&self->super.super.isa + v21) = v20;
LABEL_26:

      continue;
    }
    if ((v15 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      uint64_t v21 = 16;
      goto LABEL_22;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v23 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v23);
      v10 = CCSkipFieldErrorForMessage();
      goto LABEL_26;
    }
    v10 = 0;
  }
  while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
    goto LABEL_32;
  }
LABEL_30:
  if (*(void *)&v6[*v9])
  {
LABEL_31:
    v24 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v24);
    v25 = CCInvalidBufferErrorForMessage();
    CCSetError();

LABEL_32:
    BOOL v26 = 0;
  }
  else
  {
    BOOL v26 = 1;
  }

  return v26;
}

- (CCInstalledAppMetaContent)initWithSourceItemIdentifier:(id)a3 bundleVersion:(id)a4 error:(id *)a5
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
    CCPBDataWriterWriteStringField();
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
  v3 = @"bundleVersion";
  if (a3 != 36446) {
    v3 = 0;
  }
  if (a3 == 36445) {
    return @"sourceItemIdentifier";
  }
  else {
    return v3;
  }
}

+ (unsigned)itemType
{
  return -29102;
}

@end