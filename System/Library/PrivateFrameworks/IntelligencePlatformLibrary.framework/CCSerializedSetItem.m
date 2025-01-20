@interface CCSerializedSetItem
+ (Class)contentMessageClass;
+ (Class)metaContentMessageClass;
+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3;
+ (unsigned)itemType;
- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4;
- (CCRepeatedUInt32)deviceIndexes;
- (CCSerializedSetItem)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (CCSerializedSetItem)initWithSharedItem:(id)a3 deviceIndexes:(id)a4 localInstances:(id)a5 error:(id *)a6;
- (CCSerializedSetSharedItem)sharedItem;
- (NSArray)localInstances;
- (id)jsonDictionary;
- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4;
@end

@implementation CCSerializedSetItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localInstances, 0);
  objc_storeStrong((id *)&self->_deviceIndexes, 0);
  objc_storeStrong((id *)&self->_sharedItem, 0);
}

- (CCRepeatedUInt32)deviceIndexes
{
  return self->_deviceIndexes;
}

- (CCSerializedSetItem)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_opt_class();
  v61[1] = 0;
  char IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  id v8 = 0;
  if (IsInstanceOfExpectedClass)
  {
    v9 = [v6 objectForKeyedSubscript:@"sharedItem"];
    if (v9)
    {
      v61[0] = 0;
      v10 = [[CCSerializedSetSharedItem alloc] initWithJSONDictionary:v9 error:v61];
      id v11 = v61[0];
      v12 = v11;
      if (!v10 || v11)
      {
        CCSetError();

        v25 = 0;
        goto LABEL_41;
      }

      v9 = v10;
    }
    uint64_t v13 = [v6 objectForKeyedSubscript:@"deviceIndexes"];
    if (!v13)
    {
      v12 = 0;
      goto LABEL_20;
    }
    v14 = (void *)v13;
    objc_opt_class();
    id v60 = v8;
    char v15 = CCValidateIsInstanceOfExpectedClass();
    id v16 = v8;

    if (v15)
    {
      v43 = a4;
      v45 = self;
      id v47 = v6;
      v12 = objc_opt_new();
      long long v56 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v17 = v14;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v56 objects:v63 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v57;
        while (2)
        {
          uint64_t v21 = 0;
          v22 = v16;
          do
          {
            if (*(void *)v57 != v20) {
              objc_enumerationMutation(v17);
            }
            v23 = *(void **)(*((void *)&v56 + 1) + 8 * v21);
            objc_opt_class();
            v55 = v22;
            int v24 = CCValidateIsInstanceOfExpectedClass();
            id v16 = v22;

            if (!v24)
            {
              CCSetError();

              v25 = 0;
              v12 = v17;
              id v8 = v16;
              self = v45;
              id v6 = v47;
              goto LABEL_41;
            }
            objc_msgSend(v12, "appendUInt32Value:", objc_msgSend(v23, "unsignedIntValue"));
            ++v21;
            v22 = v16;
          }
          while (v19 != v21);
          uint64_t v19 = [v17 countByEnumeratingWithState:&v56 objects:v63 count:16];
          if (v19) {
            continue;
          }
          break;
        }
      }

      id v8 = v16;
      self = v45;
      id v6 = v47;
      a4 = v43;
LABEL_20:
      uint64_t v26 = [v6 objectForKeyedSubscript:@"localInstances"];
      if (v26)
      {
        id v27 = (id)v26;
        objc_opt_class();
        id v54 = v8;
        char v28 = CCValidateIsInstanceOfExpectedClass();
        id v29 = v8;

        if ((v28 & 1) == 0)
        {
          CCSetError();
          v25 = 0;
          goto LABEL_40;
        }
        id v42 = v29;
        v44 = v9;
        v46 = self;
        id v48 = v6;
        v30 = objc_opt_new();
        long long v50 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v27 = v27;
        uint64_t v31 = [v27 countByEnumeratingWithState:&v50 objects:v62 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v51;
          do
          {
            for (uint64_t i = 0; i != v32; ++i)
            {
              if (*(void *)v51 != v33) {
                objc_enumerationMutation(v27);
              }
              uint64_t v35 = *(void *)(*((void *)&v50 + 1) + 8 * i);
              v36 = [CCSerializedSetItemInstance alloc];
              id v49 = 0;
              v37 = [(CCSerializedSetItemInstance *)v36 initWithJSONDictionary:v35 error:&v49];
              id v38 = v49;
              if (v37) {
                BOOL v39 = v38 == 0;
              }
              else {
                BOOL v39 = 0;
              }
              if (!v39)
              {
                v40 = v38;
                CCSetError();

                v25 = 0;
                self = v46;
                id v6 = v48;
                v9 = v44;
                id v29 = v42;
                goto LABEL_40;
              }
              [v30 addObject:v37];
            }
            uint64_t v32 = [v27 countByEnumeratingWithState:&v50 objects:v62 count:16];
          }
          while (v32);
        }

        v9 = v44;
        self = v46;
      }
      else
      {
        id v48 = v6;
        v30 = 0;
        id v29 = v8;
      }
      v25 = [[CCSerializedSetItem alloc] initWithSharedItem:v9 deviceIndexes:v12 localInstances:v30 error:a4];
      id v27 = v30;
      id v6 = v48;
LABEL_40:

      id v8 = v29;
      goto LABEL_41;
    }
    CCSetError();
    v25 = 0;
    v12 = v14;
    id v8 = v16;
LABEL_41:

    goto LABEL_42;
  }
  CCSetError();
  v25 = 0;
LABEL_42:

  return v25;
}

- (id)jsonDictionary
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  if (self->_sharedItem)
  {
    v4 = [(CCSerializedSetItem *)self sharedItem];
    v5 = [v4 jsonDictionary];
    [v3 setObject:v5 forKeyedSubscript:@"sharedItem"];
  }
  if (self->_deviceIndexes)
  {
    id v6 = objc_opt_new();
    v7 = [(CCSerializedSetItem *)self deviceIndexes];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __37__CCSerializedSetItem_jsonDictionary__block_invoke;
    v22[3] = &unk_26539CC90;
    id v23 = v6;
    id v8 = v6;
    [v7 enumerateUInt32ValuesWithBlock:v22];

    [v3 setObject:v8 forKeyedSubscript:@"deviceIndexes"];
  }
  v9 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = [(CCSerializedSetItem *)self localInstances];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        char v15 = [*(id *)(*((void *)&v18 + 1) + 8 * i) jsonDictionary];
        [v9 addObject:v15];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v12);
  }

  [v3 setObject:v9 forKeyedSubscript:@"localInstances"];
  id v16 = (void *)[v3 copy];

  return v16;
}

void __37__CCSerializedSetItem_jsonDictionary__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithUnsignedInt:a2];
  [v2 addObject:v3];
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  v9 = (void (**)(id, void *))a3;
  v5 = (unsigned __int16 *)MEMORY[0x263F316D0];
  if (self->_sharedItem)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:(unsigned __int16)*MEMORY[0x263F316D0] subMessageValue:self->_sharedItem];
    v9[2](v9, v6);
  }
  if (self->_deviceIndexes)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 repeatedUInt32Value:self->_deviceIndexes];
    v9[2](v9, v7);
  }
  if (self->_localInstances)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F31708]) initWithFieldType:*v5 repeatedSubMessageValue:self->_localInstances];
    v9[2](v9, v8);
  }
}

- (NSArray)localInstances
{
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_localInstances copyItems:1];
  return (NSArray *)v2;
}

- (CCSerializedSetSharedItem)sharedItem
{
  v2 = (void *)[(CCSerializedSetSharedItem *)self->_sharedItem copy];
  return (CCSerializedSetSharedItem *)v2;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v38 = a3;
  v5 = (char *)[objc_alloc(MEMORY[0x263F31738]) initWithData:v38];
  id v6 = (int *)MEMORY[0x263F317C8];
  v7 = (int *)MEMORY[0x263F317C0];
  if (*(void *)&v5[*MEMORY[0x263F317C8]] < *(void *)&v5[*MEMORY[0x263F317C0]])
  {
    BOOL v39 = 0;
    id v8 = 0;
    id v9 = 0;
    v10 = (int *)MEMORY[0x263F317B8];
    uint64_t v11 = (int *)MEMORY[0x263F317B0];
    while (1)
    {
      if (*(void *)&v5[*v10]) {
        BOOL v12 = 0;
      }
      else {
        BOOL v12 = v9 == 0;
      }
      if (!v12) {
        goto LABEL_39;
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
            goto LABEL_38;
          }
          goto LABEL_18;
        }
      }
      *(void *)&v5[*v10] = 1;
LABEL_17:
      if (*(void *)&v5[*v10]) {
        goto LABEL_38;
      }
LABEL_18:
      unint64_t v20 = v15 >> 3;
      if ((v15 >> 3) == 3)
      {
        v22 = CCPBReaderReadDataNoCopy();
        if (!v39) {
          BOOL v39 = objc_opt_new();
        }
        uint64_t v25 = [CCSerializedSetItemInstance alloc];
        id v40 = 0;
        uint64_t v26 = [(CCItemMessage *)v25 initWithData:v22 error:&v40];
        id v9 = v40;
        if (!v9 && v26) {
          [v39 addObject:v26];
        }
      }
      else
      {
        if (v20 == 2)
        {
          if (!v8) {
            id v8 = objc_opt_new();
          }
          CCPBReaderAppendRepeatedUInt32FieldValues();
LABEL_33:
          id v9 = 0;
          goto LABEL_35;
        }
        if (v20 != 1)
        {
          if ((CCPBReaderSkipValueWithTag() & 1) == 0)
          {
            id v27 = (objc_class *)objc_opt_class();
            char v28 = NSStringFromClass(v27);
            CCSkipFieldErrorForMessage();
            id v9 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_35;
          }
          goto LABEL_33;
        }
        long long v21 = [CCSerializedSetSharedItem alloc];
        v22 = CCPBReaderReadDataNoCopy();
        id v41 = 0;
        id v23 = [(CCItemMessage *)v21 initWithData:v22 error:&v41];
        id v9 = v41;
        sharedItem = self->_sharedItem;
        self->_sharedItem = v23;
      }
LABEL_35:
      if (*(void *)&v5[*v6] >= *(void *)&v5[*v7]) {
        goto LABEL_39;
      }
    }
  }
  id v8 = 0;
  BOOL v39 = 0;
LABEL_38:
  id v9 = 0;
LABEL_39:
  id v29 = (CCRepeatedUInt32 *)[v8 copy];
  deviceIndexes = self->_deviceIndexes;
  self->_deviceIndexes = v29;

  uint64_t v31 = (NSArray *)[v39 copy];
  localInstances = self->_localInstances;
  self->_localInstances = v31;

  if (v9)
  {
    CCSetError();
  }
  else
  {
    if (!*(void *)&v5[*MEMORY[0x263F317B8]])
    {
      BOOL v36 = 1;
      goto LABEL_44;
    }
    uint64_t v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    uint64_t v35 = CCInvalidBufferErrorForMessage();
    CCSetError();
  }
  BOOL v36 = 0;
LABEL_44:

  return v36;
}

- (CCSerializedSetItem)initWithSharedItem:(id)a3 deviceIndexes:(id)a4 localInstances:(id)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = objc_opt_new();
  if (v10)
  {
    objc_opt_class();
    uint64_t v37 = 0;
    int IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    id v15 = 0;
    if (!IsInstanceOfExpectedClass) {
      goto LABEL_14;
    }
    uint64_t v16 = [v10 data];
    CCPBDataWriterWriteDataField();

    if (!v11)
    {
LABEL_4:
      id v17 = v15;
      if (v12) {
        goto LABEL_5;
      }
LABEL_18:
      id v15 = v17;
LABEL_19:
      id v27 = objc_msgSend(v13, "immutableData", v29, v30);
      self = [(CCItemMessage *)self initWithData:v27 error:a6];

      uint64_t v25 = self;
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
  id v36 = v15;
  int v26 = CCValidateIsInstanceOfExpectedClass();
  id v17 = v15;

  if (!v26)
  {
    CCSetError();
    uint64_t v25 = 0;
    id v15 = v17;
    goto LABEL_21;
  }
  CCPBDataWriterWriteRepeatedUInt32Field();
  if (!v12) {
    goto LABEL_18;
  }
LABEL_5:
  objc_opt_class();
  id v35 = v17;
  int v18 = CCValidateArrayValues();
  id v15 = v17;

  if (v18)
  {
    id v29 = a6;
    v30 = self;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v19 = v12;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v31 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v32;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v32 != v22) {
            objc_enumerationMutation(v19);
          }
          int v24 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * v23), "data", v29, v30, (void)v31);
          CCPBDataWriterWriteDataField();

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v31 objects:v38 count:16];
      }
      while (v21);
    }

    a6 = v29;
    self = v30;
    goto LABEL_19;
  }
LABEL_14:
  CCSetError();
  uint64_t v25 = 0;
LABEL_21:

  return v25;
}

+ (Class)contentMessageClass
{
  return 0;
}

+ (Class)metaContentMessageClass
{
  return 0;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  return 0;
}

+ (unsigned)itemType
{
  return *MEMORY[0x263F316D0];
}

@end