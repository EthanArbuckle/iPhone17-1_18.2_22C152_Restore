@interface LiveFSXattrCache
+ (id)xattrCacheWithMaxItems:(unint64_t)a3 andMaxItemSize:(unint64_t)a4;
+ (id)xattrCacheWithMaxItems:(unint64_t)a3 maxItemSize:(unint64_t)a4 andEntryLifetimeInSeconds:(unint64_t)a5;
- (BOOL)noXattrsPresent;
- (LiveFSXattrCache)initWithMaxItems:(unint64_t)a3 andMaxItemSize:(unint64_t)a4;
- (LiveFSXattrCache)initWithMaxItems:(unint64_t)a3 maxItemSize:(unint64_t)a4 andEntryLifetimeInSeconds:(unint64_t)a5;
- (id)dataForName:(id)a3 wasNegative:(BOOL *)a4;
- (void)dealloc;
- (void)insertEntryForData:(id)a3 forName:(id)a4;
- (void)invalidate;
- (void)setData:(id)a3 forName:(id)a4;
- (void)setNegativeForName:(id)a3;
- (void)setNoXattrsPresent:(BOOL)a3;
@end

@implementation LiveFSXattrCache

+ (id)xattrCacheWithMaxItems:(unint64_t)a3 andMaxItemSize:(unint64_t)a4
{
  v4 = [[LiveFSXattrCache alloc] initWithMaxItems:a3 andMaxItemSize:a4];

  return v4;
}

+ (id)xattrCacheWithMaxItems:(unint64_t)a3 maxItemSize:(unint64_t)a4 andEntryLifetimeInSeconds:(unint64_t)a5
{
  v5 = [[LiveFSXattrCache alloc] initWithMaxItems:a3 maxItemSize:a4 andEntryLifetimeInSeconds:a5];

  return v5;
}

- (void)dealloc
{
  cacheEntries = self->_cacheEntries;
  self->_cacheEntries = 0;

  v4.receiver = self;
  v4.super_class = (Class)LiveFSXattrCache;
  [(LiveFSXattrCache *)&v4 dealloc];
}

- (LiveFSXattrCache)initWithMaxItems:(unint64_t)a3 andMaxItemSize:(unint64_t)a4
{
  return [(LiveFSXattrCache *)self initWithMaxItems:a3 maxItemSize:a4 andEntryLifetimeInSeconds:0];
}

- (LiveFSXattrCache)initWithMaxItems:(unint64_t)a3 maxItemSize:(unint64_t)a4 andEntryLifetimeInSeconds:(unint64_t)a5
{
  v12.receiver = self;
  v12.super_class = (Class)LiveFSXattrCache;
  v8 = [(LiveFSXattrCache *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:a3];
    cacheEntries = v8->_cacheEntries;
    v8->_cacheEntries = (NSMutableDictionary *)v9;

    v8->_entryCount = 0;
    v8->_maxItems = a3;
    v8->_maxItemSize = a4;
    v8->_entryLifetime = a5;
  }
  return v8;
}

- (void)insertEntryForData:(id)a3 forName:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  if (!clock_gettime(_CLOCK_MONOTONIC, &__tp))
  {
    v8 = [[LiveFSXattrCacheEntry alloc] initWithData:v6 andTime:&__tp];
    uint64_t v9 = [(NSMutableDictionary *)self->_cacheEntries objectForKeyedSubscript:v7];
    if (v9)
    {
      v10 = (void *)v9;
      [(NSMutableDictionary *)self->_cacheEntries setObject:v8 forKeyedSubscript:v7];
    }
    else
    {
      if (self->_entryCount < self->_maxItems)
      {
        [(NSMutableDictionary *)self->_cacheEntries setObject:v8 forKeyedSubscript:v7];
        ++self->_entryCount;
LABEL_29:

        goto LABEL_30;
      }
      v30 = v8;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v11 = self->_cacheEntries;
      uint64_t v12 = [(NSMutableDictionary *)v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        id v29 = v6;
        v10 = 0;
        v14 = 0;
        v15 = 0;
        obj = v11;
        uint64_t v32 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            v17 = v10;
            if (*(void *)v34 != v32) {
              objc_enumerationMutation(obj);
            }
            v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_cacheEntries, "objectForKeyedSubscript:", v18, v29);

            if ([v10 isExpiredAsOf:&__tp forLifetime:self->_entryLifetime])
            {
              id v28 = v18;

              v14 = v28;
              goto LABEL_23;
            }
            if (v15)
            {
              uint64_t v19 = [v10 lastUsedTime];
              uint64_t v21 = v20;
              uint64_t v22 = [v15 lastUsedTime];
              BOOL v24 = v19 < v22;
              if (v19 == v22) {
                BOOL v24 = v21 < v23;
              }
              if (v24)
              {
                id v25 = v18;

                id v26 = v10;
                v14 = v25;
                v15 = v26;
              }
            }
            else
            {
              id v27 = v18;

              v15 = [(NSMutableDictionary *)self->_cacheEntries objectForKeyedSubscript:v27];
              v14 = v27;
            }
          }
          uint64_t v13 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (v13) {
            continue;
          }
          break;
        }
LABEL_23:

        if (v14) {
          [(NSMutableDictionary *)self->_cacheEntries setObject:0 forKeyedSubscript:v14];
        }
        id v6 = v29;
      }
      else
      {

        v15 = 0;
        v14 = 0;
        v10 = 0;
      }
      v8 = v30;
      [(NSMutableDictionary *)self->_cacheEntries setObject:v30 forKeyedSubscript:v7];
    }
    goto LABEL_29;
  }
LABEL_30:
}

- (void)setData:(id)a3 forName:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 length] <= self->_maxItemSize)
  {
    [(LiveFSXattrCache *)self insertEntryForData:v8 forName:v6];
  }
  else
  {
    id v7 = [(NSMutableDictionary *)self->_cacheEntries objectForKeyedSubscript:v6];

    if (v7)
    {
      [(NSMutableDictionary *)self->_cacheEntries setObject:0 forKeyedSubscript:v6];
      --self->_entryCount;
    }
  }
  self->_noXattrsPresent = 0;
}

- (void)setNegativeForName:(id)a3
{
}

- (id)dataForName:(id)a3 wasNegative:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_cacheEntries objectForKeyedSubscript:v6];
  if (!v7)
  {
    v10 = 0;
    *a4 = [(LiveFSXattrCache *)self noXattrsPresent];
    goto LABEL_14;
  }
  v13.tv_sec = 0;
  v13.tv_nsec = 0;
  int v8 = clock_gettime(_CLOCK_MONOTONIC, &v13);
  unint64_t entryLifetime = self->_entryLifetime;
  if (v8)
  {
    if (!entryLifetime)
    {
LABEL_10:
      if ([v7 xattrBytes])
      {
        v10 = objc_msgSend(MEMORY[0x263EFF8F8], "dataWithBytes:length:", objc_msgSend(v7, "xattrBytes"), objc_msgSend(v7, "xattrSize"));
        BOOL v11 = 0;
      }
      else
      {
        v10 = 0;
        BOOL v11 = 1;
      }
      goto LABEL_13;
    }
  }
  else if (!entryLifetime || !objc_msgSend(v7, "isExpiredAsOf:forLifetime:", &v13))
  {
    objc_msgSend(v7, "setLastUsedTime:", v13.tv_sec, v13.tv_nsec);
    goto LABEL_10;
  }
  [(NSMutableDictionary *)self->_cacheEntries setObject:0 forKeyedSubscript:v6];
  BOOL v11 = 0;
  v10 = 0;
  --self->_entryCount;
LABEL_13:
  *a4 = v11;
LABEL_14:

  return v10;
}

- (void)invalidate
{
  self->_entryCount = 0;
  self->_noXattrsPresent = 0;
}

- (BOOL)noXattrsPresent
{
  BOOL noXattrsPresent = self->_noXattrsPresent;
  if (self->_entryLifetime)
  {
    if (!self->_noXattrsPresent) {
      return 0;
    }
    v5.tv_sec = 0;
    v5.tv_nsec = 0;
    if (clock_gettime(_CLOCK_MONOTONIC, &v5)) {
      return 0;
    }
    if (v5.tv_sec
       - self->_noXattrsPresentSetTime.tv_sec
       - (unint64_t)(v5.tv_nsec < self->_noXattrsPresentSetTime.tv_nsec) >= self->_entryLifetime)
    {
      BOOL result = 0;
      self->_BOOL noXattrsPresent = 0;
      return result;
    }
    return self->_noXattrsPresent;
  }
  return noXattrsPresent;
}

- (void)setNoXattrsPresent:(BOOL)a3
{
  if (a3)
  {
    if (self->_entryLifetime) {
      BOOL v4 = clock_gettime(_CLOCK_MONOTONIC, &self->_noXattrsPresentSetTime) == 0;
    }
    else {
      BOOL v4 = 1;
    }
    [(NSMutableDictionary *)self->_cacheEntries removeAllObjects];
    self->_entryCount = 0;
  }
  else
  {
    BOOL v4 = 0;
  }
  self->_BOOL noXattrsPresent = v4;
}

- (void).cxx_destruct
{
}

@end