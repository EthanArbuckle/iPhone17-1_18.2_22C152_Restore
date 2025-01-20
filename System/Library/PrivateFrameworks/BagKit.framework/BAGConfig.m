@interface BAGConfig
+ (BOOL)supportsSecureCoding;
- (BAGConfig)initWithCoder:(id)a3;
- (BAGConfig)initWithDictionary:(id)a3 options:(id)a4;
- (BAGResourceOptions)options;
- (BOOL)BOOLForKey:(id)a3;
- (BOOL)BOOLForKey:(id)a3 keyType:(unint64_t)a4;
- (BOOL)BOOLForKeyList:(id)a3;
- (BOOL)BOOLForKeyList:(id)a3 keyType:(unint64_t)a4;
- (BOOL)_checkIsBoolObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)configuration;
- (NSString)debugDescription;
- (NSString)description;
- (id)_BOOLNumberFromString:(id)a3;
- (id)_checkIsArrayObject:(id)a3 typeBlock:(id)a4;
- (id)_checkIsDataObject:(id)a3;
- (id)_checkIsDictionaryObject:(id)a3 typeBlock:(id)a4;
- (id)_checkIsNumberObject:(id)a3;
- (id)_checkIsStringObject:(id)a3;
- (id)_traverseKeyList:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)arrayForKey:(id)a3 keyType:(unint64_t)a4;
- (id)arrayForKeyList:(id)a3;
- (id)arrayForKeyList:(id)a3 keyType:(unint64_t)a4;
- (id)arrayOfDataForKey:(id)a3;
- (id)arrayOfDataForKey:(id)a3 keyType:(unint64_t)a4;
- (id)arrayOfDataForKeyList:(id)a3;
- (id)arrayOfDataForKeyList:(id)a3 keyType:(unint64_t)a4;
- (id)arrayOfNumbersForKey:(id)a3;
- (id)arrayOfNumbersForKey:(id)a3 keyType:(unint64_t)a4;
- (id)arrayOfNumbersForKeyList:(id)a3;
- (id)arrayOfNumbersForKeyList:(id)a3 keyType:(unint64_t)a4;
- (id)arrayOfStringsForKey:(id)a3;
- (id)arrayOfStringsForKey:(id)a3 keyType:(unint64_t)a4;
- (id)arrayOfStringsForKeyList:(id)a3;
- (id)arrayOfStringsForKeyList:(id)a3 keyType:(unint64_t)a4;
- (id)dataForKey:(id)a3;
- (id)dataForKey:(id)a3 keyType:(unint64_t)a4;
- (id)dataForKeyList:(id)a3;
- (id)dataForKeyList:(id)a3 keyType:(unint64_t)a4;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryForKey:(id)a3 keyType:(unint64_t)a4;
- (id)dictionaryForKeyList:(id)a3;
- (id)dictionaryForKeyList:(id)a3 keyType:(unint64_t)a4;
- (id)dictionaryOfDataForKey:(id)a3;
- (id)dictionaryOfDataForKey:(id)a3 keyType:(unint64_t)a4;
- (id)dictionaryOfDataForKeyList:(id)a3;
- (id)dictionaryOfDataForKeyList:(id)a3 keyType:(unint64_t)a4;
- (id)dictionaryOfNumbersForKey:(id)a3;
- (id)dictionaryOfNumbersForKey:(id)a3 keyType:(unint64_t)a4;
- (id)dictionaryOfNumbersForKeyList:(id)a3;
- (id)dictionaryOfNumbersForKeyList:(id)a3 keyType:(unint64_t)a4;
- (id)dictionaryOfStringsForKey:(id)a3;
- (id)dictionaryOfStringsForKey:(id)a3 keyType:(unint64_t)a4;
- (id)dictionaryOfStringsForKeyList:(id)a3;
- (id)dictionaryOfStringsForKeyList:(id)a3 keyType:(unint64_t)a4;
- (id)numberForKey:(id)a3;
- (id)numberForKey:(id)a3 keyType:(unint64_t)a4;
- (id)numberForKeyList:(id)a3;
- (id)numberForKeyList:(id)a3 keyType:(unint64_t)a4;
- (id)stringForKey:(id)a3;
- (id)stringForKey:(id)a3 keyType:(unint64_t)a4;
- (id)stringForKeyList:(id)a3;
- (id)stringForKeyList:(id)a3 keyType:(unint64_t)a4;
- (unint64_t)defaultKeyType;
- (unint64_t)hash;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDefaultKeyType:(unint64_t)a3;
- (void)setOptions:(id)a3;
@end

@implementation BAGConfig

- (BAGConfig)initWithDictionary:(id)a3 options:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"BAGConfig.m", 22, @"Invalid parameter not satisfying: %@", @"dictionary" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"BAGConfig.m", 23, @"Invalid parameter not satisfying: %@", @"options" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)BAGConfig;
  v11 = [(BAGConfig *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a3);
    objc_storeStrong((id *)&v12->_options, a4);
    v12->_defaultKeyType = 1;
  }

  return v12;
}

- (unint64_t)type
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BAGConfig)initWithCoder:(id)a3
{
  v5 = (void *)MEMORY[0x263EFFA08];
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  v11 = objc_msgSend(v5, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
  v12 = [v6 decodeObjectOfClasses:v11 forKey:@"config"];

  v13 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"options"];
  unint64_t v14 = [v6 decodeIntegerForKey:@"keyType"];

  if (!BAGIsValidConfigKeyType(v14))
  {
    v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"BAGConfig.m", 49, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(defaultKeyType)" object file lineNumber description];
  }
  v15 = [(BAGConfig *)self initWithDictionary:v12 options:v13];
  objc_super v16 = v15;
  if (v15) {
    v15->_defaultKeyType = v14;
  }

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  v4 = [(BAGConfig *)self configuration];
  [v6 encodeObject:v4 forKey:@"config"];

  v5 = [(BAGConfig *)self options];
  [v6 encodeObject:v5 forKey:@"options"];

  objc_msgSend(v6, "encodeInteger:forKey:", -[BAGConfig defaultKeyType](self, "defaultKeyType"), @"keyType");
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    id v6 = [v5 configuration];
    uint64_t v7 = [(BAGConfig *)self configuration];
    if ([v6 isEqualToDictionary:v7])
    {
      uint64_t v8 = [v5 options];
      uint64_t v9 = [(BAGConfig *)self options];
      if ([v8 isEqual:v9])
      {
        uint64_t v10 = [v5 defaultKeyType];
        BOOL v11 = v10 == [(BAGConfig *)self defaultKeyType];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(BAGConfig *)self configuration];
  uint64_t v4 = [v3 hash];
  id v5 = [(BAGConfig *)self options];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(BAGConfig *)self defaultKeyType];

  return v7;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(BAGConfig *)self options];
  uint64_t v6 = [v3 stringWithFormat:@"<%@ : %p options: %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSString)debugDescription
{
  v2 = [(BAGConfig *)self configuration];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (id)_traverseKeyList:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(BAGConfig *)self configuration];
  uint64_t v6 = v5;
  if (v4)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        uint64_t v11 = 0;
        v12 = v6;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v13 = *(void **)(*((void *)&v17 + 1) + 8 * v11);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v6 = [v12 objectForKey:v13];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              goto LABEL_17;
            }
            id v14 = v12;
            unsigned int v15 = objc_msgSend(v13, "intValue", (void)v17);
            if ([v14 count] <= (unint64_t)v15)
            {

LABEL_17:
              uint64_t v6 = 0;
              goto LABEL_18;
            }
            uint64_t v6 = [v14 objectAtIndexedSubscript:v15];
          }
          ++v11;
          v12 = v6;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  else
  {

    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_BOOLNumberFromString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"true"])
  {
    id v4 = (void *)MEMORY[0x263EFFA88];
  }
  else if ([v3 isEqualToString:@"false"])
  {
    id v4 = (void *)MEMORY[0x263EFFA80];
  }
  else
  {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (id)_checkIsArrayObject:(id)a3 typeBlock:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = (void (**)(id, void))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    uint64_t v8 = v7;
    if (v6)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v19 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v20;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v20 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = v6[2](v6, *(void *)(*((void *)&v19 + 1) + 8 * i));
            if (!v15)
            {

              long long v17 = 0;
              goto LABEL_14;
            }
            objc_super v16 = (void *)v15;
            objc_msgSend(v9, "addObject:", v15, (void)v19);
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      long long v17 = (void *)[v9 copy];
LABEL_14:
    }
    else
    {
      long long v17 = (void *)[v7 copy];
    }
  }
  else
  {
    long long v17 = 0;
  }

  return v17;
}

- (BOOL)_checkIsBoolObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(BAGConfig *)self _BOOLNumberFromString:v4];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      char v6 = [v4 BOOLValue];
    }
    else {
      char v6 = 0;
    }
  }

  return v6;
}

- (id)_checkIsDataObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v3 options:0];
LABEL_5:
    id v5 = (void *)v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 copy];
    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

- (id)_checkIsDictionaryObject:(id)a3 typeBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a3;
  char v6 = (void (**)(id, void *))a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v5;
    uint64_t v8 = v7;
    if (v6)
    {
      id v9 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v10 = v8;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        long long v20 = v8;
        id v21 = v5;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0
              || ([v10 objectForKeyedSubscript:v15],
                  objc_super v16 = objc_claimAutoreleasedReturnValue(),
                  v6[2](v6, v16),
                  long long v17 = objc_claimAutoreleasedReturnValue(),
                  v16,
                  !v17))
            {

              long long v18 = 0;
              uint64_t v8 = v20;
              id v5 = v21;
              goto LABEL_15;
            }
            [v9 setObject:v17 forKey:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
          uint64_t v8 = v20;
          id v5 = v21;
          if (v12) {
            continue;
          }
          break;
        }
      }

      long long v18 = (void *)[v9 copy];
LABEL_15:
    }
    else
    {
      long long v18 = (void *)[v7 copy];
    }
  }
  else
  {
    long long v18 = 0;
  }

  return v18;
}

- (id)_checkIsNumberObject:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(BAGConfig *)self _BOOLNumberFromString:v4];
    if (!v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x263F08A30]);
      id v7 = (void *)[objc_alloc(MEMORY[0x263EFF960]) initWithLocaleIdentifier:@"en_US"];
      [v6 setLocale:v7];

      id v5 = [v6 numberFromString:v4];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = (void *)[v4 copy];
    }
    else {
      id v5 = 0;
    }
  }

  return v5;
}

- (id)_checkIsStringObject:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = (void *)[v3 copy];
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (id)arrayForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 209, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 210, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  id v9 = [v8 objectForKeyedSubscript:v7];
  id v10 = [(BAGConfig *)self _checkIsArrayObject:v9 typeBlock:0];

  return v10;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self arrayForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)arrayForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 219, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 220, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  id v9 = [(BAGConfig *)self _checkIsArrayObject:v8 typeBlock:0];

  return v9;
}

- (id)arrayForKeyList:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self arrayForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)arrayOfDataForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 230, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 231, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  id v9 = [v8 objectForKeyedSubscript:v7];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __39__BAGConfig_arrayOfDataForKey_keyType___block_invoke;
  v14[3] = &unk_26469A0A0;
  v14[4] = self;
  id v10 = [(BAGConfig *)self _checkIsArrayObject:v9 typeBlock:v14];

  return v10;
}

uint64_t __39__BAGConfig_arrayOfDataForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsDataObject:a2];
}

- (id)arrayOfDataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self arrayOfDataForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)arrayOfDataForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 242, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 243, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __43__BAGConfig_arrayOfDataForKeyList_keyType___block_invoke;
  v13[3] = &unk_26469A0A0;
  v13[4] = self;
  id v9 = [(BAGConfig *)self _checkIsArrayObject:v8 typeBlock:v13];

  return v9;
}

uint64_t __43__BAGConfig_arrayOfDataForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsDataObject:a2];
}

- (id)arrayOfDataForKeyList:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self arrayOfDataForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)arrayOfNumbersForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 255, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 256, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  id v9 = [v8 objectForKeyedSubscript:v7];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__BAGConfig_arrayOfNumbersForKey_keyType___block_invoke;
  v14[3] = &unk_26469A0A0;
  v14[4] = self;
  id v10 = [(BAGConfig *)self _checkIsArrayObject:v9 typeBlock:v14];

  return v10;
}

uint64_t __42__BAGConfig_arrayOfNumbersForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsNumberObject:a2];
}

- (id)arrayOfNumbersForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self arrayOfNumbersForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)arrayOfNumbersForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 267, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 268, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__BAGConfig_arrayOfNumbersForKeyList_keyType___block_invoke;
  v13[3] = &unk_26469A0A0;
  v13[4] = self;
  id v9 = [(BAGConfig *)self _checkIsArrayObject:v8 typeBlock:v13];

  return v9;
}

uint64_t __46__BAGConfig_arrayOfNumbersForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsNumberObject:a2];
}

- (id)arrayOfNumbersForKeyList:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self arrayOfNumbersForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)arrayOfStringsForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 280, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 281, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  id v9 = [v8 objectForKeyedSubscript:v7];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __42__BAGConfig_arrayOfStringsForKey_keyType___block_invoke;
  v14[3] = &unk_26469A0A0;
  v14[4] = self;
  id v10 = [(BAGConfig *)self _checkIsArrayObject:v9 typeBlock:v14];

  return v10;
}

uint64_t __42__BAGConfig_arrayOfStringsForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsStringObject:a2];
}

- (id)arrayOfStringsForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self arrayOfStringsForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)arrayOfStringsForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 292, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 293, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __46__BAGConfig_arrayOfStringsForKeyList_keyType___block_invoke;
  v13[3] = &unk_26469A0A0;
  v13[4] = self;
  id v9 = [(BAGConfig *)self _checkIsArrayObject:v8 typeBlock:v13];

  return v9;
}

uint64_t __46__BAGConfig_arrayOfStringsForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsStringObject:a2];
}

- (id)arrayOfStringsForKeyList:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self arrayOfStringsForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (BOOL)BOOLForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 305, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 306, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  id v9 = [v8 objectForKeyedSubscript:v7];
  BOOL v10 = [(BAGConfig *)self _checkIsBoolObject:v9];

  return v10;
}

- (BOOL)BOOLForKey:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(BAGConfig *)self BOOLForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return (char)self;
}

- (BOOL)BOOLForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 315, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 316, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  BOOL v9 = [(BAGConfig *)self _checkIsBoolObject:v8];

  return v9;
}

- (BOOL)BOOLForKeyList:(id)a3
{
  id v4 = a3;
  LOBYTE(self) = [(BAGConfig *)self BOOLForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return (char)self;
}

- (id)dataForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 326, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 327, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  BOOL v9 = [v8 objectForKeyedSubscript:v7];
  BOOL v10 = [(BAGConfig *)self _checkIsDataObject:v9];

  return v10;
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self dataForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)dataForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 336, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 337, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  BOOL v9 = [(BAGConfig *)self _checkIsDataObject:v8];

  return v9;
}

- (id)dataForKeyList:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self dataForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)dictionaryForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 347, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 348, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  BOOL v9 = [v8 objectForKeyedSubscript:v7];
  BOOL v10 = [(BAGConfig *)self _checkIsDictionaryObject:v9 typeBlock:0];

  return v10;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self dictionaryForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)dictionaryForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 357, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 358, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  BOOL v9 = [(BAGConfig *)self _checkIsDictionaryObject:v8 typeBlock:0];

  return v9;
}

- (id)dictionaryForKeyList:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self dictionaryForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)dictionaryOfDataForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 368, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 369, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  BOOL v9 = [v8 objectForKeyedSubscript:v7];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __44__BAGConfig_dictionaryOfDataForKey_keyType___block_invoke;
  v14[3] = &unk_26469A0A0;
  v14[4] = self;
  BOOL v10 = [(BAGConfig *)self _checkIsDictionaryObject:v9 typeBlock:v14];

  return v10;
}

uint64_t __44__BAGConfig_dictionaryOfDataForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsDataObject:a2];
}

- (id)dictionaryOfDataForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self dictionaryOfDataForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)dictionaryOfDataForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 380, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 381, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __48__BAGConfig_dictionaryOfDataForKeyList_keyType___block_invoke;
  v13[3] = &unk_26469A0A0;
  v13[4] = self;
  BOOL v9 = [(BAGConfig *)self _checkIsDictionaryObject:v8 typeBlock:v13];

  return v9;
}

uint64_t __48__BAGConfig_dictionaryOfDataForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsDataObject:a2];
}

- (id)dictionaryOfDataForKeyList:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self dictionaryOfDataForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)dictionaryOfNumbersForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 393, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 394, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  BOOL v9 = [v8 objectForKeyedSubscript:v7];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__BAGConfig_dictionaryOfNumbersForKey_keyType___block_invoke;
  v14[3] = &unk_26469A0A0;
  v14[4] = self;
  BOOL v10 = [(BAGConfig *)self _checkIsDictionaryObject:v9 typeBlock:v14];

  return v10;
}

uint64_t __47__BAGConfig_dictionaryOfNumbersForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsNumberObject:a2];
}

- (id)dictionaryOfNumbersForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self dictionaryOfNumbersForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)dictionaryOfNumbersForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 405, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 406, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__BAGConfig_dictionaryOfNumbersForKeyList_keyType___block_invoke;
  v13[3] = &unk_26469A0A0;
  v13[4] = self;
  BOOL v9 = [(BAGConfig *)self _checkIsDictionaryObject:v8 typeBlock:v13];

  return v9;
}

uint64_t __51__BAGConfig_dictionaryOfNumbersForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsNumberObject:a2];
}

- (id)dictionaryOfNumbersForKeyList:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self dictionaryOfNumbersForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)dictionaryOfStringsForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 418, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 419, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  BOOL v9 = [v8 objectForKeyedSubscript:v7];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __47__BAGConfig_dictionaryOfStringsForKey_keyType___block_invoke;
  v14[3] = &unk_26469A0A0;
  v14[4] = self;
  BOOL v10 = [(BAGConfig *)self _checkIsDictionaryObject:v9 typeBlock:v14];

  return v10;
}

uint64_t __47__BAGConfig_dictionaryOfStringsForKey_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsStringObject:a2];
}

- (id)dictionaryOfStringsForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self dictionaryOfStringsForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)dictionaryOfStringsForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 430, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 431, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51__BAGConfig_dictionaryOfStringsForKeyList_keyType___block_invoke;
  v13[3] = &unk_26469A0A0;
  v13[4] = self;
  BOOL v9 = [(BAGConfig *)self _checkIsDictionaryObject:v8 typeBlock:v13];

  return v9;
}

uint64_t __51__BAGConfig_dictionaryOfStringsForKeyList_keyType___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _checkIsStringObject:a2];
}

- (id)dictionaryOfStringsForKeyList:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self dictionaryOfStringsForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)numberForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 443, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 444, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  BOOL v9 = [v8 objectForKeyedSubscript:v7];
  BOOL v10 = [(BAGConfig *)self _checkIsNumberObject:v9];

  return v10;
}

- (id)numberForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self numberForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)numberForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 453, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 454, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  BOOL v9 = [(BAGConfig *)self _checkIsNumberObject:v8];

  return v9;
}

- (id)numberForKeyList:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self numberForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)stringForKey:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 464, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v13 = [MEMORY[0x263F08690] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"BAGConfig.m", 465, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self configuration];
  BOOL v9 = [v8 objectForKeyedSubscript:v7];
  BOOL v10 = [(BAGConfig *)self _checkIsStringObject:v9];

  return v10;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self stringForKey:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (id)stringForKeyList:(id)a3 keyType:(unint64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    uint64_t v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"BAGConfig.m", 474, @"Invalid parameter not satisfying: %@", @"keyList" object file lineNumber description];
  }
  if (!BAGIsValidConfigKeyType(a4))
  {
    uint64_t v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"BAGConfig.m", 475, @"Invalid parameter not satisfying: %@", @"BAGIsValidConfigKeyType(keyType)" object file lineNumber description];
  }
  uint64_t v8 = [(BAGConfig *)self _traverseKeyList:v7];
  BOOL v9 = [(BAGConfig *)self _checkIsStringObject:v8];

  return v9;
}

- (id)stringForKeyList:(id)a3
{
  id v4 = a3;
  id v5 = [(BAGConfig *)self stringForKeyList:v4 keyType:[(BAGConfig *)self defaultKeyType]];

  return v5;
}

- (BAGResourceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (unint64_t)defaultKeyType
{
  return self->_defaultKeyType;
}

- (void)setDefaultKeyType:(unint64_t)a3
{
  self->_defaultKeyType = a3;
}

- (NSDictionary)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

@end