@interface _ICResultCache
- (BOOL)fuzzyMatchItem:(id)a3 withValue:(id)a4;
- (_ICResultCache)initWithTTL:(double)a3;
- (id)searchWithTrigger:(id)a3;
- (id)searchWithValue:(id)a3;
- (void)addResults:(id)a3;
- (void)clear;
@end

@implementation _ICResultCache

- (void)clear
{
  self->_cachedResults = 0;
  MEMORY[0x270F9A758]();
}

- (_ICResultCache)initWithTTL:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_ICResultCache;
  result = [(_ICResultCache *)&v5 init];
  if (result) {
    result->_ttlInSeconds = a3;
  }
  return result;
}

- (void)addResults:(id)a3
{
  objc_storeStrong((id *)&self->_cachedResults, a3);
  id v7 = a3;
  objc_super v5 = [MEMORY[0x263EFF910] date];
  start = self->_start;
  self->_start = v5;
}

- (id)searchWithTrigger:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(NSDate *)self->_start timeIntervalSinceNow];
  if (self->_ttlInSeconds >= -v5)
  {
    v6 = [MEMORY[0x263EFF980] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = self->_cachedResults;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "trigger", (void)v16);
          int v14 = [v13 isEqualToProactiveTrigger:v4];

          if (v14) {
            [v6 addObject:v12];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  else
  {
    [(_ICResultCache *)self clear];
    v6 = 0;
  }

  return v6;
}

- (BOOL)fuzzyMatchItem:(id)a3 withValue:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x263F08708] decimalDigitCharacterSet];
  int v8 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", 0));

  if (v8
    && (long long v19 = 0u,
        long long v20 = 0u,
        long long v17 = 0u,
        long long v18 = 0u,
        (uint64_t v9 = [&unk_26E8A2890 countByEnumeratingWithState:&v17 objects:v21 count:16]) != 0))
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(&unk_26E8A2890);
        }
        uint64_t v13 = [NSString stringWithString:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        int v14 = [(id)v13 stringByAppendingString:v6];

        LOBYTE(v13) = [v5 hasPrefix:v14];
        if (v13)
        {
          BOOL v15 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v10 = [&unk_26E8A2890 countByEnumeratingWithState:&v17 objects:v21 count:16];
      BOOL v15 = 0;
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_13:

  return v15;
}

- (id)searchWithValue:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (![v4 length])
  {
LABEL_21:
    uint64_t v9 = 0;
    goto LABEL_22;
  }
  [(NSDate *)self->_start timeIntervalSinceNow];
  if (self->_ttlInSeconds < -v5) {
    goto LABEL_20;
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v6 = self->_cachedResults;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7)
  {

    goto LABEL_20;
  }
  uint64_t v8 = v7;
  long long v18 = self;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v6);
      }
      v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v13 = [v12 value];
      if ([v13 hasPrefix:v4])
      {
      }
      else
      {
        [v12 value];
        v15 = int v14 = v6;
        BOOL v16 = [(_ICResultCache *)v18 fuzzyMatchItem:v15 withValue:v4];

        id v6 = v14;
        if (!v16) {
          continue;
        }
      }
      if (!v9)
      {
        uint64_t v9 = [MEMORY[0x263EFF980] array];
      }
      if ([v9 count] == 2) {
        goto LABEL_17;
      }
      [v9 addObject:v12];
    }
    uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v8);
LABEL_17:

  self = v18;
  if (!v9)
  {
LABEL_20:
    [(_ICResultCache *)self clear];
    goto LABEL_21;
  }
LABEL_22:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_cachedResults, 0);
}

@end