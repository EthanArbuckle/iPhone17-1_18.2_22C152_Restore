@interface CCAppIntentsIndexedEntityContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCAppEntityDisplayRepresentation)displayRepresentation;
- (CCAppEntityTypeDisplayRepresentation)typeDisplayRepresentation;
- (CCAppIntentsIndexedEntityContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCAppIntentsIndexedEntityContent)initWithTypeIdentifier:(id)a3 displayRepresentation:(id)a4 typeDisplayRepresentation:(id)a5 error:(id *)a6;
- (NSString)typeIdentifier;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCAppIntentsIndexedEntityContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeDisplayRepresentation, 0);
  objc_storeStrong((id *)&self->_displayRepresentation, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
}

- (CCAppIntentsIndexedEntityContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  v21[1] = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"typeIdentifier"];
    v10 = [v6 objectForKeyedSubscript:@"displayRepresentation"];
    if (v10)
    {
      v21[0] = 0;
      v11 = [[CCAppEntityDisplayRepresentation alloc] initWithJSONDictionary:v10 error:v21];
      id v12 = v21[0];
      v13 = v12;
      if (!v11 || v12)
      {
        CCSetError();

        goto LABEL_15;
      }

      v10 = v11;
    }
    uint64_t v14 = [v6 objectForKeyedSubscript:@"typeDisplayRepresentation"];
    if (!v14)
    {
      v15 = 0;
      goto LABEL_13;
    }
    v13 = (void *)v14;
    id v20 = 0;
    v15 = [[CCAppEntityTypeDisplayRepresentation alloc] initWithJSONDictionary:v14 error:&v20];
    id v16 = v20;
    v17 = v16;
    if (v15 && !v16)
    {

LABEL_13:
      v18 = [[CCAppIntentsIndexedEntityContent alloc] initWithTypeIdentifier:v9 displayRepresentation:v10 typeDisplayRepresentation:v15 error:a4];
      v13 = v15;
LABEL_16:

      goto LABEL_17;
    }
    CCSetError();

LABEL_15:
    v18 = 0;
    goto LABEL_16;
  }
  CCSetError();
  v18 = 0;
LABEL_17:

  return v18;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_typeIdentifier)
  {
    v4 = [(CCAppIntentsIndexedEntityContent *)self typeIdentifier];
    [v3 setObject:v4 forKeyedSubscript:@"typeIdentifier"];
  }
  if (self->_displayRepresentation)
  {
    v5 = [(CCAppIntentsIndexedEntityContent *)self displayRepresentation];
    id v6 = [v5 jsonDictionary];
    [v3 setObject:v6 forKeyedSubscript:@"displayRepresentation"];
  }
  if (self->_typeDisplayRepresentation)
  {
    v7 = [(CCAppIntentsIndexedEntityContent *)self typeDisplayRepresentation];
    id v8 = [v7 jsonDictionary];
    [v3 setObject:v8 forKeyedSubscript:@"typeDisplayRepresentation"];
  }
  v9 = (void *)[v3 copy];

  return v9;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  id v8 = (void (**)(id, void *))a3;
  if (self->_typeIdentifier)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:47354 stringValue:self->_typeIdentifier];
    v8[2](v8, v5);
  }
  if (self->_displayRepresentation)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:47343 subMessageValue:self->_displayRepresentation];
    v8[2](v8, v6);
  }
  if (self->_typeDisplayRepresentation)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:47344 subMessageValue:self->_typeDisplayRepresentation];
    v8[2](v8, v7);
  }
}

- (CCAppEntityTypeDisplayRepresentation)typeDisplayRepresentation
{
  v2 = (void *)[(CCAppEntityTypeDisplayRepresentation *)self->_typeDisplayRepresentation copy];
  return (CCAppEntityTypeDisplayRepresentation *)v2;
}

- (CCAppEntityDisplayRepresentation)displayRepresentation
{
  v2 = (void *)[(CCAppEntityDisplayRepresentation *)self->_displayRepresentation copy];
  return (CCAppEntityDisplayRepresentation *)v2;
}

- (NSString)typeIdentifier
{
  v2 = (void *)[(NSString *)self->_typeIdentifier copy];
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
    unint64_t v21 = v15 >> 3;
    if ((v15 >> 3) == 3)
    {
      v24 = [CCAppEntityTypeDisplayRepresentation alloc];
      typeIdentifier = CCPBReaderReadDataNoCopy();
      id v35 = 0;
      v25 = [(CCItemMessage *)v24 initWithData:typeIdentifier error:&v35];
      id v10 = v35;
      uint64_t v26 = 32;
      goto LABEL_24;
    }
    if (v21 == 2)
    {
      v27 = [CCAppEntityDisplayRepresentation alloc];
      typeIdentifier = CCPBReaderReadDataNoCopy();
      id v36 = 0;
      v25 = [(CCItemMessage *)v27 initWithData:typeIdentifier error:&v36];
      id v10 = v36;
      uint64_t v26 = 24;
LABEL_24:
      v28 = *(Class *)((char *)&self->super.super.isa + v26);
      *(Class *)((char *)&self->super.super.isa + v26) = v25;

LABEL_28:
      continue;
    }
    if (v21 == 1)
    {
      CCPBReaderReadStringNoCopy();
      v22 = (NSString *)objc_claimAutoreleasedReturnValue();
      id v10 = 0;
      typeIdentifier = self->_typeIdentifier;
      self->_typeIdentifier = v22;
      goto LABEL_28;
    }
    if ((CCPBReaderSkipValueWithTag() & 1) == 0)
    {
      v29 = (objc_class *)objc_opt_class();
      typeIdentifier = NSStringFromClass(v29);
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
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    v32 = CCInvalidBufferErrorForMessage();
    CCSetError();

    id v10 = 0;
LABEL_34:
    BOOL v33 = 0;
  }
  else
  {
    id v10 = 0;
    BOOL v33 = 1;
  }

  return v33;
}

- (CCAppIntentsIndexedEntityContent)initWithTypeIdentifier:(id)a3 displayRepresentation:(id)a4 typeDisplayRepresentation:(id)a5 error:(id *)a6
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
    char v19 = 0;
    id v15 = v16;
    goto LABEL_14;
  }
  unint64_t v21 = [v11 data];
  CCPBDataWriterWriteDataField();

  if (!v12) {
    goto LABEL_11;
  }
LABEL_5:
  objc_opt_class();
  int v17 = CCValidateIsInstanceOfExpectedClass();
  id v15 = v16;

  if (v17)
  {
    unint64_t v18 = [v12 data];
    CCPBDataWriterWriteDataField();

LABEL_12:
    v22 = [v13 immutableData];
    self = [(CCItemMessage *)self initWithData:v22 error:a6];

    char v19 = self;
    goto LABEL_14;
  }
LABEL_7:
  CCSetError();
  char v19 = 0;
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
  if ((unsigned __int16)(a3 + 18195) > 0xDu) {
    return 0;
  }
  else {
    return *(&off_26539BD80 + (unsigned __int16)(a3 + 18195));
  }
}

+ (unsigned)itemType
{
  return -18195;
}

@end