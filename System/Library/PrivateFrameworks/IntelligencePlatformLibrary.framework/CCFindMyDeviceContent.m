@interface CCFindMyDeviceContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCFindMyDeviceContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCFindMyDeviceContent)initWithName:(id)a3 owner:(id)a4 error:(id *)a5;
- (CCFindMyDeviceOwner)owner;
- (NSString)name;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCFindMyDeviceContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (CCFindMyDeviceContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  v17[1] = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"name"];
    uint64_t v10 = [v6 objectForKeyedSubscript:@"owner"];
    if (v10)
    {
      v11 = (void *)v10;
      v17[0] = 0;
      v12 = [[CCFindMyDeviceOwner alloc] initWithJSONDictionary:v10 error:v17];
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
    v15 = [[CCFindMyDeviceContent alloc] initWithName:v9 owner:v12 error:a4];
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
  if (self->_name)
  {
    v4 = [(CCFindMyDeviceContent *)self name];
    [v3 setObject:v4 forKeyedSubscript:@"name"];
  }
  if (self->_owner)
  {
    v5 = [(CCFindMyDeviceContent *)self owner];
    id v6 = [v5 jsonDictionary];
    [v3 setObject:v6 forKeyedSubscript:@"owner"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v7 = (void (**)(id, void *))a3;
  if (self->_name)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:27126 stringValue:self->_name];
    v7[2](v7, v5);
  }
  if (self->_owner)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:27127 subMessageValue:self->_owner];
    v7[2](v7, v6);
  }
}

- (CCFindMyDeviceOwner)owner
{
  v2 = (void *)[(CCFindMyDeviceOwner *)self->_owner copy];
  return (CCFindMyDeviceOwner *)v2;
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
    if ((v15 >> 3) == 2)
    {
      v22 = [CCFindMyDeviceOwner alloc];
      name = CCPBReaderReadDataNoCopy();
      id v31 = 0;
      v23 = [(CCItemMessage *)v22 initWithData:name error:&v31];
      id v10 = v31;
      owner = self->_owner;
      self->_owner = v23;

      goto LABEL_25;
    }
    if ((v15 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v20 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v10 = 0;
      name = self->_name;
      self->_name = v20;
LABEL_25:

      continue;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v25 = (objc_class *)objc_opt_class();
      name = NSStringFromClass(v25);
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

- (CCFindMyDeviceContent)initWithName:(id)a3 owner:(id)a4 error:(id *)a5
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
  if ((a3 - 27122) > 0xA) {
    return 0;
  }
  else {
    return *(&off_26539C260 + (unsigned __int16)(a3 - 27122));
  }
}

+ (unsigned)itemType
{
  return 27122;
}

@end