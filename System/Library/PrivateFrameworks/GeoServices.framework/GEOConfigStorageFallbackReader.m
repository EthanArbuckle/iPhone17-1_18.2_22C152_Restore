@interface GEOConfigStorageFallbackReader
- (GEOConfigStorageFallbackReader)initWithStorage:(id)a3;
- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6;
- (void)resync;
@end

@implementation GEOConfigStorageFallbackReader

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  int64_t v24 = 0;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v12 = self->_storage;
  uint64_t v13 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = objc_msgSend(*(id *)(*((void *)&v20 + 1) + 8 * i), "getConfigValueForKey:countryCode:options:source:", v10, v11, a5, &v24, (void)v20);
        v18 = v17;
        if (v24)
        {
          if (a6) {
            *a6 = v24;
          }
          goto LABEL_12;
        }
      }
      uint64_t v14 = [(NSArray *)v12 countByEnumeratingWithState:&v20 objects:v25 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
  v18 = 0;
LABEL_12:

  return v18;
}

- (GEOConfigStorageFallbackReader)initWithStorage:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEOConfigStorageFallbackReader;
  v5 = [(GEOConfigStorageFallbackReader *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    storage = v5->_storage;
    v5->_storage = (NSArray *)v6;
  }
  return v5;
}

- (void)resync
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_storage;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "resync", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void).cxx_destruct
{
}

@end