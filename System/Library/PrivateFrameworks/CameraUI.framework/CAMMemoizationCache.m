@interface CAMMemoizationCache
- (BOOL)memoizesNil;
- (CAMMemoizationCache)init;
- (CAMMemoizationCache)initWithMemoizesNil:(BOOL)a3;
- (NSMutableDictionary)_dictionary;
- (id)objectForKey:(id)a3 memoizationBlock:(id)a4;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
@end

@implementation CAMMemoizationCache

- (CAMMemoizationCache)initWithMemoizesNil:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CAMMemoizationCache;
  v4 = [(CAMMemoizationCache *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_memoizesNil = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dictionary = v5->__dictionary;
    v5->__dictionary = v6;

    v8 = v5;
  }

  return v5;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = [(CAMMemoizationCache *)self _dictionary];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__CAMMemoizationCache_enumerateKeysAndObjectsUsingBlock___block_invoke;
  v7[3] = &unk_263FA4D40;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateKeysAndObjectsUsingBlock:v7];
}

- (NSMutableDictionary)_dictionary
{
  return self->__dictionary;
}

- (id)objectForKey:(id)a3 memoizationBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  id v8 = [(CAMMemoizationCache *)self _dictionary];
  BOOL v9 = [(CAMMemoizationCache *)self memoizesNil];
  objc_super v10 = [v8 objectForKeyedSubscript:v6];
  if (v9)
  {
    v11 = [MEMORY[0x263EFF9D0] null];

    if (v10 == v11)
    {
      id v13 = 0;
      goto LABEL_12;
    }
  }
  if (!v10)
  {
    if (v7)
    {
      uint64_t v12 = v7[2](v7, v6);
      if (v12)
      {
        objc_super v10 = (void *)v12;
        [v8 setObject:v12 forKeyedSubscript:v6];
        goto LABEL_11;
      }
      if (v9)
      {
        v14 = [MEMORY[0x263EFF9D0] null];
        [v8 setObject:v14 forKeyedSubscript:v6];
      }
    }
    objc_super v10 = 0;
  }
LABEL_11:
  id v13 = v10;
  objc_super v10 = v13;
LABEL_12:

  return v13;
}

- (BOOL)memoizesNil
{
  return self->_memoizesNil;
}

void __57__CAMMemoizationCache_enumerateKeysAndObjectsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  id v6 = [MEMORY[0x263EFF9D0] null];

  if (v6 != v5) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (CAMMemoizationCache)init
{
  return [(CAMMemoizationCache *)self initWithMemoizesNil:0];
}

- (void).cxx_destruct
{
}

@end