@interface CalculateUnitCollection
+ (CalculateUnitCollection)collectionWithLocales:(id)a3;
+ (NSArray)expectedCategoryNames;
- (CalculateUnitCollection)init;
- (CalculateUnitCollection)initWithLocales:(id)a3;
- (NSArray)categories;
- (NSArray)locales;
- (id)findCategoryWithName:(id)a3;
- (id)findUnitWithName:(id)a3;
- (void)setCategories:(id)a3;
- (void)setLocales:(id)a3;
@end

@implementation CalculateUnitCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_locales, 0);
}

- (void)setCategories:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setLocales:(id)a3
{
}

- (NSArray)locales
{
  return self->_locales;
}

- (id)findCategoryWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(CalculateUnitCollection *)self categories];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 name];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)findUnitWithName:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(CalculateUnitCollection *)self categories];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v13 + 1) + 8 * i) findUnitWithName:v4];
        if (v10)
        {
          char v11 = (void *)v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  char v11 = 0;
LABEL_11:

  return v11;
}

- (CalculateUnitCollection)initWithLocales:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CalculateUnitCollection;
  v5 = [(CalculateUnitCollection *)&v22 init];
  if (v5)
  {
    uint64_t v6 = +[UnitsInfo converterUnits];
    id v17 = v4;
    uint64_t v7 = (void *)[v4 copy];
    [(CalculateUnitCollection *)v5 setLocales:v7];

    uint64_t v8 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    v9 = [&unk_1F1872E28 allKeys];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [v6 infoForUnitTypeName:*(void *)(*((void *)&v18 + 1) + 8 * v13)];
          if (v14)
          {
            long long v15 = +[CalculateUnitCategory categoryWithTypeInfo:v14 unitsInfo:v6 collection:v5];
            [v8 addObject:v15];
          }
          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }

    [(CalculateUnitCollection *)v5 setCategories:v8];
    id v4 = v17;
  }

  return v5;
}

- (CalculateUnitCollection)init
{
  v5.receiver = self;
  v5.super_class = (Class)CalculateUnitCollection;
  v2 = [(CalculateUnitCollection *)&v5 init];
  if (v2)
  {
    v3 = objc_opt_new();
    [(CalculateUnitCollection *)v2 setCategories:v3];
  }
  return v2;
}

+ (NSArray)expectedCategoryNames
{
  return (NSArray *)[&unk_1F1872E28 allKeys];
}

+ (CalculateUnitCollection)collectionWithLocales:(id)a3
{
  id v3 = a3;
  id v4 = [[CalculateUnitCollection alloc] initWithLocales:v3];

  return v4;
}

@end