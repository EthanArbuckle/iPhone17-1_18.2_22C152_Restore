@interface CCHomeServiceArea
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasAreaIdentifier;
- (BOOL)hasAssociatedMapIdentifier;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCHomeServiceArea)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCHomeServiceArea)initWithName:(id)a3 areaIdentifier:(id)a4 associatedMapIdentifier:(id)a5 error:(id *)a6;
- (NSString)name;
- (id)jsonDictionary;
- (unsigned)areaIdentifier;
- (unsigned)associatedMapIdentifier;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasAreaIdentifier:(BOOL)a3;
- (void)setHasAssociatedMapIdentifier:(BOOL)a3;
@end

@implementation CCHomeServiceArea

- (void).cxx_destruct
{
}

- (void)setHasAssociatedMapIdentifier:(BOOL)a3
{
  self->_hasAssociatedMapIdentifier = a3;
}

- (BOOL)hasAssociatedMapIdentifier
{
  return self->_hasAssociatedMapIdentifier;
}

- (void)setHasAreaIdentifier:(BOOL)a3
{
  self->_hasAreaIdentifier = a3;
}

- (BOOL)hasAreaIdentifier
{
  return self->_hasAreaIdentifier;
}

- (unsigned)associatedMapIdentifier
{
  return self->_associatedMapIdentifier;
}

- (unsigned)areaIdentifier
{
  return self->_areaIdentifier;
}

- (CCHomeServiceArea)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"name"];
    v10 = [v6 objectForKeyedSubscript:@"areaIdentifier"];
    v11 = [v6 objectForKeyedSubscript:@"associatedMapIdentifier"];
    v12 = [[CCHomeServiceArea alloc] initWithName:v9 areaIdentifier:v10 associatedMapIdentifier:v11 error:a4];
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
  if (self->_name)
  {
    v4 = [(CCHomeServiceArea *)self name];
    [v3 setObject:v4 forKeyedSubscript:@"name"];
  }
  if (self->_hasAreaIdentifier)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCHomeServiceArea areaIdentifier](self, "areaIdentifier"));
    [v3 setObject:v5 forKeyedSubscript:@"areaIdentifier"];
  }
  if (self->_hasAssociatedMapIdentifier)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[CCHomeServiceArea associatedMapIdentifier](self, "associatedMapIdentifier"));
    [v3 setObject:v6 forKeyedSubscript:@"associatedMapIdentifier"];
  }
  v7 = (void *)[v3 copy];

  return v7;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  id v8 = (void (**)(id, void *))a3;
  if (self->_name)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:17037 stringValue:self->_name];
    v8[2](v8, v5);
  }
  if (self->_hasAreaIdentifier)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:17038 uint32Value:self->_areaIdentifier];
    v8[2](v8, v6);
  }
  if (self->_hasAssociatedMapIdentifier)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:17039 uint32Value:self->_associatedMapIdentifier];
    v8[2](v8, v7);
  }
}

- (NSString)name
{
  v2 = (void *)[(NSString *)self->_name copy];
  return (NSString *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v6];
  id v8 = (int *)MEMORY[0x263F317C8];
  v9 = (int *)MEMORY[0x263F317C0];
  v10 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v7[*MEMORY[0x263F317C8]] >= *(void *)&v7[*MEMORY[0x263F317C0]]) {
    goto LABEL_51;
  }
  v11 = 0;
  v12 = (int *)MEMORY[0x263F317B0];
  v45 = self;
  do
  {
    if (*(void *)&v7[*v10] || v11 != 0) {
      break;
    }
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
      BOOL v20 = v15++ >= 9;
      if (v20)
      {
        unint64_t v16 = 0;
        if (*(void *)&v7[*v10]) {
          goto LABEL_52;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v7[*v10] = 1;
LABEL_17:
    if (*(void *)&v7[*v10]) {
      goto LABEL_52;
    }
LABEL_18:
    unint64_t v21 = v16 >> 3;
    if ((v16 >> 3) == 1)
    {
      CCPBReaderReadStringNoCopy();
      v28 = (NSString *)objc_claimAutoreleasedReturnValue();
      name = self->_name;
      self->_name = v28;

      v11 = 0;
    }
    else
    {
      if (v21 == 2)
      {
        char v30 = 0;
        unsigned int v31 = 0;
        uint64_t v32 = 0;
        while (1)
        {
          uint64_t v33 = *v8;
          unint64_t v34 = *(void *)&v7[v33];
          if (v34 == -1 || v34 >= *(void *)&v7[*v9]) {
            break;
          }
          char v35 = *(unsigned char *)(*(void *)&v7[*v12] + v34);
          *(void *)&v7[v33] = v34 + 1;
          v32 |= (unint64_t)(v35 & 0x7F) << v30;
          if ((v35 & 0x80) == 0) {
            goto LABEL_43;
          }
          v30 += 7;
          BOOL v20 = v31++ >= 9;
          if (v20)
          {
            LODWORD(v32) = 0;
            goto LABEL_45;
          }
        }
        *(void *)&v7[*v10] = 1;
LABEL_43:
        if (*(void *)&v7[*v10]) {
          LODWORD(v32) = 0;
        }
LABEL_45:
        v11 = 0;
        self->_areaIdentifier = v32;
        uint64_t v36 = 16;
      }
      else
      {
        if (v21 != 3)
        {
          if (CCPBReaderSkipValueWithTag())
          {
            v11 = 0;
          }
          else
          {
            v37 = (objc_class *)objc_opt_class();
            NSStringFromClass(v37);
            v38 = a4;
            v40 = id v39 = v6;
            v11 = CCSkipFieldErrorForMessage();

            id v6 = v39;
            a4 = v38;
            self = v45;
          }
          continue;
        }
        char v22 = 0;
        unsigned int v23 = 0;
        uint64_t v24 = 0;
        while (1)
        {
          uint64_t v25 = *v8;
          unint64_t v26 = *(void *)&v7[v25];
          if (v26 == -1 || v26 >= *(void *)&v7[*v9]) {
            break;
          }
          char v27 = *(unsigned char *)(*(void *)&v7[*v12] + v26);
          *(void *)&v7[v25] = v26 + 1;
          v24 |= (unint64_t)(v27 & 0x7F) << v22;
          if ((v27 & 0x80) == 0) {
            goto LABEL_39;
          }
          v22 += 7;
          BOOL v20 = v23++ >= 9;
          if (v20)
          {
            LODWORD(v24) = 0;
            goto LABEL_41;
          }
        }
        *(void *)&v7[*v10] = 1;
LABEL_39:
        if (*(void *)&v7[*v10]) {
          LODWORD(v24) = 0;
        }
LABEL_41:
        v11 = 0;
        self->_associatedMapIdentifier = v24;
        uint64_t v36 = 17;
      }
      *((unsigned char *)&self->super.super.isa + v36) = 1;
    }
  }
  while (*(void *)&v7[*v8] < *(void *)&v7[*v9]);
  if (v11)
  {
    CCSetError();
    goto LABEL_53;
  }
LABEL_51:
  if (*(void *)&v7[*v10])
  {
LABEL_52:
    v41 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v41);
    v42 = CCInvalidBufferErrorForMessage();
    CCSetError();

LABEL_53:
    BOOL v43 = 0;
  }
  else
  {
    BOOL v43 = 1;
  }

  return v43;
}

- (CCHomeServiceArea)initWithName:(id)a3 areaIdentifier:(id)a4 associatedMapIdentifier:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = objc_opt_new();
  if (v10)
  {
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v15 = 0;
    if (!IsInstanceOfExpectedClass) {
      goto LABEL_13;
    }
    CCPBDataWriterWriteStringField();
  }
  else
  {
    id v15 = 0;
  }
  if (v11)
  {
    objc_opt_class();
    int v16 = CCValidateIsInstanceOfExpectedClass();
    id v17 = v15;

    if (!v16)
    {
      CCSetError();
      BOOL v20 = 0;
      id v15 = v17;
      goto LABEL_15;
    }
    [v11 unsignedIntValue];
    CCPBDataWriterWriteUint32Field();
    if (!v12) {
      goto LABEL_8;
    }
    goto LABEL_10;
  }
  id v17 = v15;
  if (v12)
  {
LABEL_10:
    objc_opt_class();
    int v18 = CCValidateIsInstanceOfExpectedClass();
    id v15 = v17;

    if (v18)
    {
      [v12 unsignedIntValue];
      CCPBDataWriterWriteUint32Field();
      goto LABEL_12;
    }
LABEL_13:
    CCSetError();
    BOOL v20 = 0;
    goto LABEL_15;
  }
LABEL_8:
  id v15 = v17;
LABEL_12:
  char v19 = [v13 immutableData];
  self = [(CCItemMessage *)self initWithData:v19 error:a6];

  BOOL v20 = self;
LABEL_15:

  return v20;
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
  return 17034;
}

@end