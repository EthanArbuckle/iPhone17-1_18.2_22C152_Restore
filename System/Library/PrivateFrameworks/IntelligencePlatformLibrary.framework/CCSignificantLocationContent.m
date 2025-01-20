@interface CCSignificantLocationContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCSignificantLocationAddress)address;
- (CCSignificantLocationContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCSignificantLocationContent)initWithPreferredName:(id)a3 mapItemName:(id)a4 address:(id)a5 error:(id *)a6;
- (NSString)mapItemName;
- (NSString)preferredName;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCSignificantLocationContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_mapItemName, 0);
  objc_storeStrong((id *)&self->_preferredName, 0);
}

- (CCSignificantLocationContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  v18[1] = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"preferredName"];
    v10 = [v6 objectForKeyedSubscript:@"mapItemName"];
    uint64_t v11 = [v6 objectForKeyedSubscript:@"address"];
    if (v11)
    {
      v12 = (void *)v11;
      v18[0] = 0;
      v13 = [[CCSignificantLocationAddress alloc] initWithJSONDictionary:v11 error:v18];
      id v14 = v18[0];
      v15 = v14;
      if (!v13 || v14)
      {
        CCSetError();

        v16 = 0;
        goto LABEL_10;
      }
    }
    else
    {
      v13 = 0;
    }
    v16 = [[CCSignificantLocationContent alloc] initWithPreferredName:v9 mapItemName:v10 address:v13 error:a4];
    v12 = v13;
LABEL_10:

    goto LABEL_11;
  }
  CCSetError();
  v16 = 0;
LABEL_11:

  return v16;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_preferredName)
  {
    v4 = [(CCSignificantLocationContent *)self preferredName];
    [v3 setObject:v4 forKeyedSubscript:@"preferredName"];
  }
  if (self->_mapItemName)
  {
    v5 = [(CCSignificantLocationContent *)self mapItemName];
    [v3 setObject:v5 forKeyedSubscript:@"mapItemName"];
  }
  if (self->_address)
  {
    id v6 = [(CCSignificantLocationContent *)self address];
    v7 = [v6 jsonDictionary];
    [v3 setObject:v7 forKeyedSubscript:@"address"];
  }
  id v8 = (void *)[v3 copy];

  return v8;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  id v8 = (void (**)(id, void *))a3;
  if (self->_preferredName)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15768 stringValue:self->_preferredName];
    v8[2](v8, v5);
  }
  if (self->_mapItemName)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15769 stringValue:self->_mapItemName];
    v8[2](v8, v6);
  }
  if (self->_address)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:15763 subMessageValue:self->_address];
    v8[2](v8, v7);
  }
}

- (CCSignificantLocationAddress)address
{
  v2 = (void *)[(CCSignificantLocationAddress *)self->_address copy];
  return (CCSignificantLocationAddress *)v2;
}

- (NSString)mapItemName
{
  v2 = (void *)[(NSString *)self->_mapItemName copy];
  return (NSString *)v2;
}

- (NSString)preferredName
{
  v2 = (void *)[(NSString *)self->_preferredName copy];
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
    goto LABEL_32;
  }
  id v10 = 0;
  uint64_t v11 = (int *)MEMORY[0x263F317B0];
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
          goto LABEL_33;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v6[*v9] = 1;
LABEL_17:
    if (*(void *)&v6[*v9]) {
      goto LABEL_33;
    }
LABEL_18:
    unint64_t v20 = v15 >> 3;
    if ((v15 >> 3) == 3)
    {
      v23 = [CCSignificantLocationAddress alloc];
      v24 = CCPBReaderReadDataNoCopy();
      id v33 = 0;
      v25 = [(CCItemMessage *)v23 initWithData:v24 error:&v33];
      id v10 = v33;
      address = self->_address;
      self->_address = v25;

LABEL_28:
      continue;
    }
    if (v20 == 2)
    {
      CCPBReaderReadStringNoCopy();
      v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
      id v10 = 0;
      uint64_t v22 = 24;
      goto LABEL_24;
    }
    if (v20 == 1)
    {
      CCPBReaderReadStringNoCopy();
      v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
      id v10 = 0;
      uint64_t v22 = 16;
LABEL_24:
      v24 = *(Class *)((char *)&self->super.super.isa + v22);
      *(Class *)((char *)&self->super.super.isa + v22) = v21;
      goto LABEL_28;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v27 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v27);
      CCSkipFieldErrorForMessage();
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    id v10 = 0;
  }
  while (*(void *)&v6[*v7] < *(void *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
    goto LABEL_34;
  }
LABEL_32:
  if (*(void *)&v6[*v9])
  {
LABEL_33:
    v28 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v28);
    v30 = CCInvalidBufferErrorForMessage();
    CCSetError();

    id v10 = 0;
LABEL_34:
    BOOL v31 = 0;
  }
  else
  {
    id v10 = 0;
    BOOL v31 = 1;
  }

  return v31;
}

- (CCSignificantLocationContent)initWithPreferredName:(id)a3 mapItemName:(id)a4 address:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = objc_opt_new();
  if (v10)
  {
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v15 = 0;
    if (!IsInstanceOfExpectedClass) {
      goto LABEL_7;
    }
    CCPBDataWriterWriteStringField();
    if (!v11)
    {
LABEL_4:
      id v16 = v15;
      if (v12) {
        goto LABEL_5;
      }
LABEL_11:
      id v15 = v16;
      goto LABEL_12;
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
  int v20 = CCValidateIsInstanceOfExpectedClass();
  id v16 = v15;

  if (!v20)
  {
    CCSetError();
    v19 = 0;
    id v15 = v16;
    goto LABEL_14;
  }
  CCPBDataWriterWriteStringField();
  if (!v12) {
    goto LABEL_11;
  }
LABEL_5:
  objc_opt_class();
  int v17 = CCValidateIsInstanceOfExpectedClass();
  id v15 = v16;

  if (v17)
  {
    char v18 = [v12 data];
    CCPBDataWriterWriteDataField();

LABEL_12:
    v21 = [v13 immutableData];
    self = [(CCItemMessage *)self initWithData:v21 error:a6];

    v19 = self;
    goto LABEL_14;
  }
LABEL_7:
  CCSetError();
  v19 = 0;
LABEL_14:

  return v19;
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
  if ((a3 - 15757) > 0x20) {
    return 0;
  }
  else {
    return *(&off_26539CA38 + (unsigned __int16)(a3 - 15757));
  }
}

+ (unsigned)itemType
{
  return 15757;
}

@end