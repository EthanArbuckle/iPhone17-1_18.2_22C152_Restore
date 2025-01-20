@interface _DKObjectFromMOCache
- (_DKObjectFromMOCache)init;
- (id)deduplicateString:(id *)a1;
- (id)objectForKey:(void *)a3 type:;
- (id)objectForKey:(void *)a3 type:(void *)a4 setIfMissingWithBlock:;
- (void)initWithReporting;
- (void)reportMetrics;
- (void)setObject:(void *)a3 forKey:(void *)a4 type:;
@end

@implementation _DKObjectFromMOCache

- (id)objectForKey:(void *)a3 type:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v7 = [a1[1] objectForKeyedSubscript:v6];
    v8 = v7;
    if (v7)
    {
      v9 = [v7 objectForKey:v5];
      id v11 = objc_getProperty(a1, v10, 24, 1);
      if (v11)
      {
        v13 = v11;
        id Property = objc_getProperty(a1, v12, 32, 1);

        if (Property)
        {
          if (v9)
          {
            v15 = [NSString stringWithFormat:@"com.apple.coreduet.knowledgeMOCache.%@.hit", v6];
            v17 = objc_msgSend(objc_getProperty(a1, v16, 24, 1), "objectForKeyedSubscript:", v15);
            v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v17, "unsignedIntegerValue") + 1);

            v20 = a1;
            ptrdiff_t v21 = 24;
          }
          else
          {
            v15 = [NSString stringWithFormat:@"com.apple.coreduet.knowledgeMOCache.%@.miss", v6];
            v23 = objc_msgSend(objc_getProperty(a1, v22, 32, 1), "objectForKeyedSubscript:", v15);
            v18 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v23, "unsignedIntegerValue") + 1);

            v20 = a1;
            ptrdiff_t v21 = 32;
          }
          objc_msgSend(objc_getProperty(v20, v19, v21, 1), "setObject:forKeyedSubscript:", v18, v15);
        }
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (_DKObjectFromMOCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)_DKObjectFromMOCache;
  v2 = [(_DKObjectFromMOCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (void)initWithReporting
{
  if (!a1) {
    return 0;
  }
  v1 = (void *)[a1 init];
  if (v1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v3 = (void *)v1[2];
    v1[2] = v2;

    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    id v5 = (void *)v1[3];
    v1[3] = v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    v7 = (void *)v1[4];
    v1[4] = v6;
  }
  return v1;
}

- (void)reportMetrics
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id Property = objc_getProperty(a1, a2, 16, 1);
    id v3 = Property;
    id v40 = objc_getProperty(a1, v4, 24, 1);
    id v5 = v40;
    self = a1;
    id v41 = objc_getProperty(a1, v6, 32, 1);
    v7 = (void *)MEMORY[0x1E4F1C978];
    id v8 = v41;
    v9 = [v7 arrayWithObjects:&Property count:3];

    obuint64_t j = v9;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v29 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v35 != v29) {
            objc_enumerationMutation(obj);
          }
          v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v14 = v13;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v31;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v31 != v17) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v19 = *(void *)(*((void *)&v30 + 1) + 8 * j);
                v20 = [v14 objectForKeyedSubscript:v19];
                +[_CDDiagnosticDataReporter addValue:forScalarKey:](_CDDiagnosticDataReporter, "addValue:forScalarKey:", [v20 longValue], v19);
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v16);
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v11);
    }

    ptrdiff_t v21 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_setProperty_atomic(self, v22, v21, 16);

    v23 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_setProperty_atomic(self, v24, v23, 24);

    v25 = [MEMORY[0x1E4F1CA60] dictionary];
    objc_setProperty_atomic(self, v26, v25, 32);
  }
}

- (void)setObject:(void *)a3 forKey:(void *)a4 type:
{
  id v17 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v10 = [a1[1] objectForKeyedSubscript:v8];
    if (!v10)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1C998]);
      [v10 setCountLimit:20];
      uint64_t v11 = [NSString stringWithFormat:@"com.apple.coreduet.moconverter.cache.%@", v8];
      [v10 setName:v11];

      [a1[1] setObject:v10 forKeyedSubscript:v8];
    }
    if (objc_getProperty(a1, v9, 16, 1))
    {
      v12 = [NSString stringWithFormat:@"com.apple.coreduet.knowledgeMOCache.%@.set", v8];
      id v14 = objc_msgSend(objc_getProperty(a1, v13, 24, 1), "objectForKeyedSubscript:", v12);
      uint64_t v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v14, "unsignedIntegerValue") + 1);

      objc_msgSend(objc_getProperty(a1, v16, 16, 1), "setObject:forKeyedSubscript:", v15, v12);
    }
    [v10 setObject:v17 forKey:v7];
  }
}

- (id)objectForKey:(void *)a3 type:(void *)a4 setIfMissingWithBlock:
{
  id v7 = a2;
  id v8 = a3;
  v9 = a4;
  if (a1)
  {
    id v10 = -[_DKObjectFromMOCache objectForKey:type:](a1, v7, v8);
    if (!v10)
    {
      id v10 = v9[2](v9);
      if (v10) {
        -[_DKObjectFromMOCache setObject:forKey:type:](a1, v10, v7, v8);
      }
    }
    a1 = v10;
  }
  return a1;
}

- (id)deduplicateString:(id *)a1
{
  id v3 = a2;
  SEL v4 = v3;
  if (a1)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __42___DKObjectFromMOCache_deduplicateString___block_invoke;
    v6[3] = &unk_1E56102B8;
    id v7 = v3;
    -[_DKObjectFromMOCache objectForKey:type:setIfMissingWithBlock:](a1, v7, @"_str", v6);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheMisses, 0);
  objc_storeStrong((id *)&self->_cacheHits, 0);
  objc_storeStrong((id *)&self->_cacheEntries, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end