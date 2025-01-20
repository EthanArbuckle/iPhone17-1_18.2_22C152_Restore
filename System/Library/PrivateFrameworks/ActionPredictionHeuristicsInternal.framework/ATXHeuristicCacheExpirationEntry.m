@interface ATXHeuristicCacheExpirationEntry
- (ATXHeuristicCacheExpirationEntry)initWithHeuristic:(id)a3 cache:(id)a4;
- (ATXHeuristicResultCache)cache;
- (BOOL)isEqual:(id)a3;
- (NSString)heuristicName;
- (unint64_t)hash;
- (void)setCache:(id)a3;
- (void)setHeuristicName:(id)a3;
@end

@implementation ATXHeuristicCacheExpirationEntry

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cache);

  objc_storeStrong((id *)&self->_heuristicName, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_heuristicName hash];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
  unint64_t v5 = [WeakRetained hash] - v3 + 32 * v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (ATXHeuristicCacheExpirationEntry *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = v4;
      heuristicName = self->_heuristicName;
      v7 = (NSString *)v5[1];
      if (heuristicName == v7)
      {
      }
      else
      {
        v8 = v7;
        v9 = heuristicName;
        char v10 = [(NSString *)v9 isEqual:v8];

        if ((v10 & 1) == 0)
        {
          char v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);
      id v13 = objc_loadWeakRetained(v5 + 2);
      if (WeakRetained == v13) {
        char v11 = 1;
      }
      else {
        char v11 = [WeakRetained isEqual:v13];
      }

      goto LABEL_13;
    }
    char v11 = 0;
  }
LABEL_14:

  return v11;
}

- (ATXHeuristicCacheExpirationEntry)initWithHeuristic:(id)a3 cache:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  char v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"ATXHeuristicResultCache.m", 74, @"Invalid parameter not satisfying: %@", @"heuristicName" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"ATXHeuristicResultCache.m", 75, @"Invalid parameter not satisfying: %@", @"cache" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)ATXHeuristicCacheExpirationEntry;
  char v11 = [(ATXHeuristicCacheExpirationEntry *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_heuristicName, a3);
    objc_storeWeak((id *)&v12->_cache, v10);
  }

  return v12;
}

- (NSString)heuristicName
{
  return self->_heuristicName;
}

- (void)setHeuristicName:(id)a3
{
}

- (ATXHeuristicResultCache)cache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cache);

  return (ATXHeuristicResultCache *)WeakRetained;
}

- (void)setCache:(id)a3
{
}

@end