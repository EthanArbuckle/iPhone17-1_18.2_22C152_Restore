@interface AAFSerialization
+ (id)dataFromDictionary:(id)a3 ofType:(id)a4;
+ (id)dictionaryFromObject:(id)a3 ofType:(id)a4;
+ (id)instance;
+ (id)ofType:(id)a3;
+ (id)stringFromDictionary:(id)a3 ofType:(id)a4;
- (AAFSerialization)init;
- (id)serializerOfType:(id)a3;
- (void)addSerializer:(id)a3;
@end

@implementation AAFSerialization

+ (id)dictionaryFromObject:(id)a3 ofType:(id)a4
{
  id v6 = a3;
  v7 = [a1 ofType:a4];
  v8 = [v7 dictionaryFromObject:v6];

  return v8;
}

+ (id)dataFromDictionary:(id)a3 ofType:(id)a4
{
  id v6 = a3;
  v7 = [a1 ofType:a4];
  v8 = [v7 dataFromDictionary:v6];

  return v8;
}

+ (id)stringFromDictionary:(id)a3 ofType:(id)a4
{
  id v6 = a3;
  v7 = [a1 ofType:a4];
  v8 = [v7 stringFromDictionary:v6];

  return v8;
}

+ (id)ofType:(id)a3
{
  id v4 = a3;
  v5 = [a1 instance];
  id v6 = [v5 serializerOfType:v4];

  return v6;
}

+ (id)instance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__AAFSerialization_instance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (instance__instanceToken != -1) {
    dispatch_once(&instance__instanceToken, block);
  }
  v2 = (void *)instance__instance;
  return v2;
}

uint64_t __28__AAFSerialization_instance__block_invoke(uint64_t a1)
{
  instance__instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (AAFSerialization)init
{
  v8.receiver = self;
  v8.super_class = (Class)AAFSerialization;
  v2 = [(AAFSerialization *)&v8 init];
  v3 = v2;
  if (v2)
  {
    serializersByType = v2->_serializersByType;
    v2->_serializersByType = (NSDictionary *)MEMORY[0x1E4F1CC08];

    v5 = objc_opt_new();
    [(AAFSerialization *)v3 addSerializer:v5];

    id v6 = objc_opt_new();
    [(AAFSerialization *)v3 addSerializer:v6];
  }
  return v3;
}

- (id)serializerOfType:(id)a3
{
  serializersByType = self->_serializersByType;
  id v4 = [a3 lowercaseString];
  v5 = [(NSDictionary *)serializersByType valueForKey:v4];

  return v5;
}

- (void)addSerializer:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 mediaTypes];
  if (objc_msgSend(v5, "aaf_hasObjects"))
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
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
          v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "lowercaseString", (void)v15);
          [v6 setValue:v4 forKey:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    v13 = [(NSDictionary *)self->_serializersByType aaf_dictionaryByAddingEntriesFromDictionary:v6];
    serializersByType = self->_serializersByType;
    self->_serializersByType = v13;
  }
}

- (void).cxx_destruct
{
}

@end