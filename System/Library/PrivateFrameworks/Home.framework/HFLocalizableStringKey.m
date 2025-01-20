@interface HFLocalizableStringKey
+ (id)stringKeyWithKey:(id)a3 argumentKeys:(id)a4;
+ (id)stringKeyWithKey:(id)a3 arguments:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HFLocalizableStringKey)initWithKey:(id)a3 argumentKeys:(id)a4;
- (NSArray)argumentKeys;
- (NSMutableDictionary)argumentMap;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)localizedStringWithArgumentBlock:(id)a3;
- (id)stringLocalizationBlock;
- (void)setArgumentKeys:(id)a3;
- (void)setKey:(id)a3;
- (void)setStringLocalizationBlock:(id)a3;
@end

@implementation HFLocalizableStringKey

- (HFLocalizableStringKey)initWithKey:(id)a3 argumentKeys:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFLocalizableStringKey;
  v9 = [(HFLocalizableStringKey *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_key, a3);
    uint64_t v11 = [v8 copy];
    v12 = (void *)v11;
    if (v11) {
      v13 = (void *)v11;
    }
    else {
      v13 = (void *)MEMORY[0x263EFFA68];
    }
    objc_storeStrong((id *)&v10->_argumentKeys, v13);

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    argumentMap = v10->_argumentMap;
    v10->_argumentMap = (NSMutableDictionary *)v14;

    if (_MergedGlobals_6_2 != -1) {
      dispatch_once(&_MergedGlobals_6_2, &__block_literal_global_3_20);
    }
    id v16 = (id)qword_2676B6AE0;
    [(HFLocalizableStringKey *)v10 setStringLocalizationBlock:v16];
  }
  return v10;
}

void __51__HFLocalizableStringKey_initWithKey_argumentKeys___block_invoke_2()
{
  v0 = (void *)qword_2676B6AE0;
  qword_2676B6AE0 = (uint64_t)&__block_literal_global_6_6;
}

id __51__HFLocalizableStringKey_initWithKey_argumentKeys___block_invoke_3(uint64_t a1, void *a2)
{
  return _HFLocalizedStringWithDefaultValue(a2, 0, 0);
}

+ (id)stringKeyWithKey:(id)a3 arguments:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263EFF980] array];
  id v8 = [MEMORY[0x263EFF9A0] dictionary];
  if ([v6 count])
  {
    unint64_t v9 = 0;
    do
    {
      v10 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v9);
      [v7 addObject:v10];
      uint64_t v11 = [v6 objectAtIndexedSubscript:v9];
      [v8 setObject:v11 forKey:v10];

      ++v9;
    }
    while (v9 < [v6 count]);
  }
  v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithKey:v5 argumentKeys:v7];
  v13 = (void *)v12[3];
  v12[3] = v8;

  return v12;
}

+ (id)stringKeyWithKey:(id)a3 argumentKeys:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithKey:v7 argumentKeys:v6];

  return v8;
}

- (NSArray)argumentKeys
{
  return self->_argumentKeys;
}

- (void)setArgumentKeys:(id)a3
{
  id v4 = a3;
  if (!v4) {
    id v4 = (id)MEMORY[0x263EFFA68];
  }
  id v7 = v4;
  id v5 = (NSArray *)[v4 copy];
  argumentKeys = self->_argumentKeys;
  self->_argumentKeys = v5;
}

- (id)localizedStringWithArgumentBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(HFLocalizableStringKey *)self stringLocalizationBlock];
  id v6 = [(HFLocalizableStringKey *)self key];
  id v7 = ((void (**)(void, void *))v5)[2](v5, v6);

  if (v7)
  {
    id v8 = [(HFLocalizableStringKey *)self argumentKeys];
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    uint64_t v14 = __59__HFLocalizableStringKey_localizedStringWithArgumentBlock___block_invoke;
    v15 = &unk_264097D68;
    id v16 = self;
    id v17 = v4;
    unint64_t v9 = objc_msgSend(v8, "na_map:", &v12);

    v10 = objc_msgSend(NSString, "hf_stringWithFormat:arguments:", v7, v9, v12, v13, v14, v15, v16);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id __59__HFLocalizableStringKey_localizedStringWithArgumentBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) argumentMap];
  id v5 = [v4 objectForKeyedSubscript:v3];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) argumentMap];
    id v7 = [v6 objectForKeyedSubscript:v3];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8)
    {
      id v7 = (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);
    }
    else
    {
      NSLog(&cfstr_Hflocalizables.isa, v3);
      id v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    uint64_t v8 = [v7 key];
    unint64_t v9 = [(HFLocalizableStringKey *)self key];
    int v10 = [v8 isEqualToString:v9];

    uint64_t v11 = [(HFLocalizableStringKey *)self argumentKeys];
    uint64_t v12 = [v11 count];
    uint64_t v13 = [v7 argumentKeys];
    uint64_t v14 = [v13 count];

    if (v12 == v14)
    {
      v15 = [(HFLocalizableStringKey *)self argumentKeys];
      uint64_t v16 = [v15 count];

      if (v16)
      {
        unint64_t v17 = 0;
        do
        {
          objc_super v18 = [(HFLocalizableStringKey *)self argumentKeys];
          v19 = [v18 objectAtIndexedSubscript:v17];

          v20 = [v7 argumentKeys];
          v21 = [v20 objectAtIndexedSubscript:v17];
          char v22 = [v21 isEqualToString:v19];

          if ((v22 & 1) == 0) {
            break;
          }
          ++v17;
          v23 = [(HFLocalizableStringKey *)self argumentKeys];
          unint64_t v24 = [v23 count];
        }
        while (v17 < v24);
      }
      else
      {
        char v22 = 1;
      }
    }
    else
    {
      char v22 = 0;
    }
    v26 = [(HFLocalizableStringKey *)self argumentMap];
    v27 = [v7 argumentMap];
    char v28 = [v26 isEqualToDictionary:v27];

    if (v10) {
      char v25 = v22 & v28;
    }
    else {
      char v25 = 0;
    }
  }
  else
  {
    char v25 = 0;
  }

  return v25;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_opt_class();
  id v5 = [(HFLocalizableStringKey *)self key];
  id v6 = (void *)[v5 copy];
  id v7 = [(HFLocalizableStringKey *)self argumentKeys];
  uint64_t v8 = (void *)[v7 copy];
  unint64_t v9 = [v4 stringKeyWithKey:v6 argumentKeys:v8];

  return v9;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(HFLocalizableStringKey *)self key];
  id v7 = [(HFLocalizableStringKey *)self argumentKeys];
  uint64_t v8 = [(HFLocalizableStringKey *)self argumentMap];
  unint64_t v9 = [v3 stringWithFormat:@"<%@:%p key='%@' argumentKeys='%@' argumentMap='%@'>", v5, self, v6, v7, v8];

  return v9;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSMutableDictionary)argumentMap
{
  return self->_argumentMap;
}

- (id)stringLocalizationBlock
{
  return self->_stringLocalizationBlock;
}

- (void)setStringLocalizationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stringLocalizationBlock, 0);
  objc_storeStrong((id *)&self->_argumentMap, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_argumentKeys, 0);
}

@end