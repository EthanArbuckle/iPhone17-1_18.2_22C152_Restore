@interface CCHomeServiceAreaContent
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)hasMatterDeviceIdentifier;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCHomeServiceArea)area;
- (CCHomeServiceAreaContent)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCHomeServiceAreaContent)initWithMatterDeviceIdentifier:(id)a3 serviceArea:(id)a4 serviceAreaType:(unsigned int)a5 error:(id *)a6;
- (CCHomeServiceAreaMap)map;
- (id)jsonDictionary;
- (unint64_t)matterDeviceIdentifier;
- (unsigned)serviceAreaType;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
- (void)setHasMatterDeviceIdentifier:(BOOL)a3;
@end

@implementation CCHomeServiceAreaContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_area, 0);
}

- (unsigned)serviceAreaType
{
  return self->_serviceAreaType;
}

- (void)setHasMatterDeviceIdentifier:(BOOL)a3
{
  self->_hasMatterDeviceIdentifier = a3;
}

- (BOOL)hasMatterDeviceIdentifier
{
  return self->_hasMatterDeviceIdentifier;
}

- (unint64_t)matterDeviceIdentifier
{
  return self->_matterDeviceIdentifier;
}

- (CCHomeServiceAreaContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_opt_class();
  v21[1] = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"matterDeviceIdentifier"];
    v10 = [v6 objectForKeyedSubscript:@"area"];
    if (v10)
    {
      v21[0] = 0;
      v11 = [[CCHomeServiceArea alloc] initWithJSONDictionary:v10 error:v21];
      id v12 = v21[0];
      v13 = v12;
      if (!v11 || v12)
      {
        CCSetError();
        goto LABEL_15;
      }

      v10 = v11;
    }
    v13 = [v6 objectForKeyedSubscript:@"map"];
    if (!v13)
    {
LABEL_10:
      if (v10)
      {
        v16 = v10;
        uint64_t v17 = 1;
      }
      else
      {
        uint64_t v17 = 0;
      }
      v11 = v10;
      if (v13)
      {
        v11 = v13;

        uint64_t v17 = 2;
      }
      v18 = [[CCHomeServiceAreaContent alloc] initWithMatterDeviceIdentifier:v9 serviceArea:v11 serviceAreaType:v17 error:a4];
      goto LABEL_20;
    }
    id v20 = 0;
    v14 = [[CCHomeServiceAreaMap alloc] initWithJSONDictionary:v13 error:&v20];
    v15 = (CCHomeServiceArea *)v20;
    v11 = v15;
    if (v14 && !v15)
    {

      v13 = v14;
      goto LABEL_10;
    }
    CCSetError();

LABEL_15:
    v18 = 0;
LABEL_20:

    goto LABEL_21;
  }
  CCSetError();
  v18 = 0;
LABEL_21:

  return v18;
}

- (id)jsonDictionary
{
  v3 = objc_opt_new();
  if (self->_hasMatterDeviceIdentifier)
  {
    v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[CCHomeServiceAreaContent matterDeviceIdentifier](self, "matterDeviceIdentifier"));
    [v3 setObject:v4 forKeyedSubscript:@"matterDeviceIdentifier"];
  }
  if (self->_area)
  {
    v5 = [(CCHomeServiceAreaContent *)self area];
    id v6 = [v5 jsonDictionary];
    [v3 setObject:v6 forKeyedSubscript:@"area"];
  }
  if (self->_map)
  {
    v7 = [(CCHomeServiceAreaContent *)self map];
    id v8 = [v7 jsonDictionary];
    [v3 setObject:v8 forKeyedSubscript:@"map"];
  }
  v9 = (void *)[v3 copy];

  return v9;
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  id v8 = (void (**)(id, void *))a3;
  if (self->_hasMatterDeviceIdentifier)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:17035 uint64Value:self->_matterDeviceIdentifier];
    v8[2](v8, v5);
  }
  if (self->_area)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:17036 subMessageValue:self->_area];
    v8[2](v8, v6);
  }
  if (self->_map)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:17040 subMessageValue:self->_map];
    v8[2](v8, v7);
  }
}

- (CCHomeServiceAreaMap)map
{
  v2 = (void *)[(CCHomeServiceAreaMap *)self->_map copy];
  return (CCHomeServiceAreaMap *)v2;
}

- (CCHomeServiceArea)area
{
  v2 = (void *)[(CCHomeServiceArea *)self->_area copy];
  return (CCHomeServiceArea *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v43 = a3;
  v5 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v43];
  id v6 = (int *)MEMORY[0x263F317C8];
  v7 = (int *)MEMORY[0x263F317C0];
  id v8 = (int *)MEMORY[0x263F317B8];
  if (*(void *)&v5[*MEMORY[0x263F317C8]] >= *(void *)&v5[*MEMORY[0x263F317C0]]) {
    goto LABEL_42;
  }
  id v9 = 0;
  v10 = (int *)MEMORY[0x263F317B0];
  do
  {
    if (*(void *)&v5[*v8]) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v9 == 0;
    }
    if (!v11) {
      break;
    }
    char v12 = 0;
    unsigned int v13 = 0;
    unint64_t v14 = 0;
    while (1)
    {
      uint64_t v15 = *v6;
      unint64_t v16 = *(void *)&v5[v15];
      if (v16 == -1 || v16 >= *(void *)&v5[*v7]) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)&v5[*v10] + v16);
      *(void *)&v5[v15] = v16 + 1;
      v14 |= (unint64_t)(v17 & 0x7F) << v12;
      if ((v17 & 0x80) == 0) {
        goto LABEL_17;
      }
      v12 += 7;
      BOOL v18 = v13++ >= 9;
      if (v18)
      {
        unint64_t v14 = 0;
        if (*(void *)&v5[*v8]) {
          goto LABEL_43;
        }
        goto LABEL_18;
      }
    }
    *(void *)&v5[*v8] = 1;
LABEL_17:
    if (*(void *)&v5[*v8]) {
      goto LABEL_43;
    }
LABEL_18:
    unint64_t v19 = v14 >> 3;
    if ((v14 >> 3) == 3)
    {
      v26 = [CCHomeServiceAreaMap alloc];
      v27 = CCPBReaderReadDataNoCopy();
      id v44 = 0;
      v28 = [(CCItemMessage *)v26 initWithData:v27 error:&v44];
      id v9 = v44;
      map = self->_map;
      self->_map = v28;

      if (!v9)
      {
        area = self->_area;
        self->_area = 0;

        self->_serviceAreaType = 2;
      }
    }
    else if (v19 == 2)
    {
      v31 = [CCHomeServiceArea alloc];
      v32 = CCPBReaderReadDataNoCopy();
      id v45 = 0;
      v33 = [(CCItemMessage *)v31 initWithData:v32 error:&v45];
      id v9 = v45;
      v34 = self->_area;
      self->_area = v33;

      if (!v9)
      {
        self->_serviceAreaType = 1;
        v35 = self->_map;
        self->_map = 0;
      }
    }
    else if (v19 == 1)
    {
      char v20 = 0;
      unsigned int v21 = 0;
      unint64_t v22 = 0;
      while (1)
      {
        uint64_t v23 = *v6;
        unint64_t v24 = *(void *)&v5[v23];
        if (v24 == -1 || v24 >= *(void *)&v5[*v7]) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)&v5[*v10] + v24);
        *(void *)&v5[v23] = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_35;
        }
        v20 += 7;
        BOOL v18 = v21++ >= 9;
        if (v18)
        {
          unint64_t v22 = 0;
          goto LABEL_37;
        }
      }
      *(void *)&v5[*v8] = 1;
LABEL_35:
      if (*(void *)&v5[*v8]) {
        unint64_t v22 = 0;
      }
LABEL_37:
      id v9 = 0;
      self->_matterDeviceIdentifier = v22;
      self->_hasMatterDeviceIdentifier = 1;
    }
    else if (CCPBReaderSkipValueWithTag())
    {
      id v9 = 0;
    }
    else
    {
      v36 = (objc_class *)objc_opt_class();
      v37 = NSStringFromClass(v36);
      CCSkipFieldErrorForMessage();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  while (*(void *)&v5[*v6] < *(void *)&v5[*v7]);
  if (v9)
  {
    CCSetError();
  }
  else
  {
LABEL_42:
    if (!*(void *)&v5[*v8])
    {
      id v9 = 0;
      BOOL v41 = 1;
      goto LABEL_46;
    }
LABEL_43:
    v38 = (objc_class *)objc_opt_class();
    v39 = NSStringFromClass(v38);
    v40 = CCInvalidBufferErrorForMessage();
    CCSetError();

    id v9 = 0;
  }
  BOOL v41 = 0;
LABEL_46:

  return v41;
}

- (CCHomeServiceAreaContent)initWithMatterDeviceIdentifier:(id)a3 serviceArea:(id)a4 serviceAreaType:(unsigned int)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  char v12 = objc_opt_new();
  if (v10)
  {
    objc_opt_class();
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v14 = 0;
    if (!IsInstanceOfExpectedClass)
    {
      CCSetError();
      char v20 = 0;
      goto LABEL_16;
    }
    [v10 unsignedLongLongValue];
    CCPBDataWriterWriteUint64Field();
    if (!v11) {
      goto LABEL_9;
    }
  }
  else
  {
    id v14 = 0;
    if (!v11) {
      goto LABEL_9;
    }
  }
  if (a5 == 1)
  {
    objc_opt_class();
    int v15 = CCValidateIsInstanceOfExpectedClass();
    id v16 = v14;

    if (v15) {
      goto LABEL_12;
    }
LABEL_15:
    CCSetError();
    char v20 = 0;
    id v14 = v16;
    goto LABEL_16;
  }
LABEL_9:
  if (!v11 || a5 != 2) {
    goto LABEL_13;
  }
  objc_opt_class();
  int v17 = CCValidateIsInstanceOfExpectedClass();
  id v16 = v14;

  if (!v17) {
    goto LABEL_15;
  }
LABEL_12:
  BOOL v18 = [v11 data];
  CCPBDataWriterWriteDataField();

  id v14 = v16;
LABEL_13:
  unint64_t v19 = [v12 immutableData];
  self = [(CCItemMessage *)self initWithData:v19 error:a6];

  char v20 = self;
LABEL_16:

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
  if ((a3 - 17034) > 8) {
    return 0;
  }
  else {
    return off_26539CE30[(unsigned __int16)(a3 - 17034)];
  }
}

+ (unsigned)itemType
{
  return 17034;
}

@end