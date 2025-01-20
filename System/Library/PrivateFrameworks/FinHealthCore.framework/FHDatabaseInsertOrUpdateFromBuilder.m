@interface FHDatabaseInsertOrUpdateFromBuilder
+ (id)initWithBuilder:(id)a3;
- (NSArray)fieldValuePairList;
- (id)_init:(id)a3;
@end

@implementation FHDatabaseInsertOrUpdateFromBuilder

+ (id)initWithBuilder:(id)a3
{
  v3 = (void (**)(id, void *))a3;
  v4 = objc_opt_new();
  v3[2](v3, v4);

  id v5 = [[FHDatabaseInsertOrUpdateFromBuilder alloc] _init:v4];
  return v5;
}

- (id)_init:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FHDatabaseInsertOrUpdateFromBuilder;
  id v5 = [(FHDatabaseInsertOrUpdateFromBuilder *)&v19 init];
  if (v5)
  {
    v6 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v7 = objc_msgSend(v4, "dynamicFieldValuePairList", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          [v6 addObject:*(void *)(*((void *)&v15 + 1) + 8 * v11++)];
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v9);
    }

    uint64_t v12 = [v6 copy];
    fieldValuePairList = v5->_fieldValuePairList;
    v5->_fieldValuePairList = (NSArray *)v12;
  }
  return v5;
}

- (NSArray)fieldValuePairList
{
  return self->_fieldValuePairList;
}

- (void).cxx_destruct
{
}

@end