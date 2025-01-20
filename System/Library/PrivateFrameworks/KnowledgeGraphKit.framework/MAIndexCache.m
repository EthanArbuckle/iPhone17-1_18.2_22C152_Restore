@interface MAIndexCache
- (BOOL)isEqual:(id)a3;
- (MAIndexCache)initWithLabels:(id)a3;
- (NSArray)labels;
- (NSDictionary)cache;
- (int64_t)indexOfLabel:(id)a3;
- (unint64_t)hash;
@end

@implementation MAIndexCache

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

- (NSDictionary)cache
{
  return self->_cache;
}

- (NSArray)labels
{
  return self->_labels;
}

- (unint64_t)hash
{
  return [(NSArray *)self->_labels hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MAIndexCache *)a3;
  if (v4 == self)
  {
    char v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      labels = self->_labels;
      v6 = [(MAIndexCache *)v4 labels];
      char v7 = [(NSArray *)labels isEqual:v6];
    }
    else
    {
      char v7 = 0;
    }
  }

  return v7;
}

- (int64_t)indexOfLabel:(id)a3
{
  v3 = [(NSDictionary *)self->_cache objectForKeyedSubscript:a3];
  v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (MAIndexCache)initWithLabels:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MAIndexCache;
  int64_t v5 = [(MAIndexCache *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    labels = v5->_labels;
    v5->_labels = (NSArray *)v6;

    v8 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v19 = v4;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = 0;
      uint64_t v13 = *(void *)v21;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v21 != v13) {
            objc_enumerationMutation(v9);
          }
          uint64_t v15 = *(void *)(*((void *)&v20 + 1) + 8 * v14);
          v16 = [NSNumber numberWithInteger:v12 + v14];
          [(NSDictionary *)v8 setObject:v16 forKeyedSubscript:v15];

          ++v14;
        }
        while (v11 != v14);
        v12 += v14;
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v11);
    }

    cache = v5->_cache;
    v5->_cache = v8;

    id v4 = v19;
  }

  return v5;
}

@end