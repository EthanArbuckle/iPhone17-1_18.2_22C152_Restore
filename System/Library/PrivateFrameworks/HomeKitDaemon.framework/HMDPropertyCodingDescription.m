@interface HMDPropertyCodingDescription
- (BOOL)isConditional;
- (BOOL)shouldIncludeWithConditions:(id)a3;
- (NSPropertyDescription)property;
- (NSString)codingKey;
- (NSString)name;
- (NSString)shortDescription;
- (id)initWithModel:(void *)a3 property:;
@end

@implementation HMDPropertyCodingDescription

- (id)initWithModel:(void *)a3 property:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v27.receiver = a1;
  v27.super_class = (Class)HMDPropertyCodingDescription;
  v5 = (id *)objc_msgSendSuper2(&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong(v5 + 1, a3);
    uint64_t v7 = -[HMDManagedObjectCodingModel codingKeyForProperty:](a2, a3);
    id v8 = v6[2];
    v6[2] = (id)v7;

    v9 = [a3 userInfo];
    v10 = [v9 objectForKeyedSubscript:*(void *)(a2 + 112)];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v10;
    }
    else {
      v11 = 0;
    }
    id v12 = v11;

    if (v12)
    {
      id v13 = *(id *)(a2 + 40);
      v14 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_."];
      v15 = [v14 invertedSet];

      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v25 = v12;
      id obj = [v12 componentsSeparatedByString:@"|"];
      uint64_t v16 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        v24 = a3;
        unint64_t v18 = 0;
        uint64_t v19 = *(void *)v29;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v29 != v19) {
              objc_enumerationMutation(obj);
            }
            v21 = *(void **)(*((void *)&v28 + 1) + 8 * i);
            if (![v21 length]
              || [v21 rangeOfCharacterFromSet:v15] != 0x7FFFFFFFFFFFFFFFLL)
            {
              [v24 entity];
              [(id)objc_claimAutoreleasedReturnValue() name];
              objc_claimAutoreleasedReturnValue();
              [v24 name];
              objc_claimAutoreleasedReturnValue();
              _HMFPreconditionFailureWithFormat();
LABEL_25:
              _HMFPreconditionFailure();
            }
            self;
            unint64_t v22 = [v13 indexOfObject:v21];
            if (v22 == 0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t v22 = [v13 count];
              [v13 addObject:v21];
            }
            self;
            if (v22 >= 0x40) {
              goto LABEL_25;
            }
            v18 |= 1 << v22;
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v17);
      }
      else
      {
        unint64_t v18 = 0;
      }

      id v12 = v25;
    }
    else
    {
      unint64_t v18 = 0;
    }

    v6[3] = (id)v18;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codingKey, 0);
  objc_storeStrong((id *)&self->_property, 0);
}

- (NSString)shortDescription
{
  v3 = NSString;
  v4 = [(NSPropertyDescription *)self->_property entity];
  v5 = [v4 name];
  v6 = [(NSPropertyDescription *)self->_property name];
  uint64_t v7 = [v3 stringWithFormat:@"%@.%@", v5, v6];

  return (NSString *)v7;
}

- (BOOL)shouldIncludeWithConditions:(id)a3
{
  unint64_t conditions = self->_conditions;
  if (!conditions) {
    return 1;
  }
  if (a3) {
    uint64_t v4 = *((void *)a3 + 2);
  }
  else {
    uint64_t v4 = 0;
  }
  return (v4 & conditions) != 0;
}

- (BOOL)isConditional
{
  return self->_conditions != 0;
}

- (NSString)codingKey
{
  return self->_codingKey;
}

- (NSString)name
{
  return [(NSPropertyDescription *)self->_property name];
}

- (NSPropertyDescription)property
{
  return self->_property;
}

@end