@interface CCHomeServiceGroup
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCHomeServiceGroup)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCHomeServiceGroup)initWithName:(id)a3 error:(id *)a4;
- (NSString)name;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCHomeServiceGroup

- (void).cxx_destruct
{
}

- (CCHomeServiceGroup)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"name"];
    v10 = [[CCHomeServiceGroup alloc] initWithName:v9 error:a4];
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
  if (self->_name)
  {
    v4 = [(CCHomeServiceGroup *)self name];
    [v3 setObject:v4 forKeyedSubscript:@"name"];
  }
  v5 = (void *)[v3 copy];

  return v5;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  if (self->_name)
  {
    id v6 = (objc_class *)MEMORY[0x263F31708];
    id v7 = a3;
    id v8 = (id)[[v6 alloc] initWithFieldType:7708 stringValue:self->_name];
    (*((void (**)(id, id))a3 + 2))(v7, v8);
  }
}

- (NSString)name
{
  v2 = (void *)[(NSString *)self->_name copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v5];
  id v7 = (int *)MEMORY[0x263F317C8];
  id v8 = (int *)MEMORY[0x263F317C0];
  v9 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v6[*MEMORY[0x263F317C8]] >= *(void *)&v6[*MEMORY[0x263F317C0]]) {
    goto LABEL_27;
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
          goto LABEL_28;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v6[*v9] = 1;
LABEL_17:
    if (*(void *)&v6[*v9]) {
      goto LABEL_28;
    }
LABEL_18:
    if ((v15 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      name = self->_name;
      self->_name = v20;
LABEL_23:

      continue;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v22 = (objc_class *)objc_opt_class();
      name = NSStringFromClass(v22);
      v10 = CCSkipFieldErrorForMessage();
      goto LABEL_23;
    }
    v10 = 0;
  }
  while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
    goto LABEL_29;
  }
LABEL_27:
  if (*(void *)&v6[*v9])
  {
LABEL_28:
    v23 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v23);
    v24 = CCInvalidBufferErrorForMessage();
    CCSetError();

LABEL_29:
    BOOL v25 = 0;
  }
  else
  {
    BOOL v25 = 1;
  }

  return v25;
}

- (CCHomeServiceGroup)initWithName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = objc_opt_new();
  if (v6)
  {
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v9 = 0;
    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      v11 = 0;
      goto LABEL_7;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v9 = 0;
  }
  v10 = [v7 immutableData];
  self = [(CCItemMessage *)self initWithData:v10 error:a4];

  v11 = self;
LABEL_7:

  return v11;
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
  return 7690;
}

@end