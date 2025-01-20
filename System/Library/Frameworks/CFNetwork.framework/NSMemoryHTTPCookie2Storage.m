@interface NSMemoryHTTPCookie2Storage
- (NSMemoryHTTPCookie2Storage)init;
- (id)getAllCookies;
- (id)getCookiesWithFilter:(id)a3;
- (void)deleteAllCookies;
- (void)deleteCookie:(id)a3;
- (void)deleteCookies:(id)a3;
- (void)deleteCookiesWithFilter:(id)a3;
- (void)setCookie:(id)a3;
- (void)setCookies:(id)a3;
@end

@implementation NSMemoryHTTPCookie2Storage

- (void).cxx_destruct
{
}

- (id)getCookiesWithFilter:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 domain];
  v21 = +[NSHTTPCookieStorageUtils getEffectiveTLDPlusOne:]((uint64_t)NSHTTPCookieStorageUtils, v5);

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v21)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->memoryCookies, "objectForKeyedSubscript:");
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          if ([v4 matchCookie:v11])
          {
            [v6 addObject:v11];
          }
          else
          {
            v12 = getCookieLogHandle();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v11;
              _os_log_debug_impl(&dword_184085000, v12, OS_LOG_TYPE_DEBUG, "[MemoryCookieStore]: Cookie dropped since filters don't match. Cookie = %@", buf, 0xCu);
            }
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v33 count:16];
      }
      while (v8);
    }
  }
  else
  {
    v13 = [(NSMemoryHTTPCookie2Storage *)self getAllCookies];
    v14 = (void *)[v13 mutableCopy];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v7 = v14;
    uint64_t v15 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v23;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v23 != v16) {
            objc_enumerationMutation(v7);
          }
          v18 = *(void **)(*((void *)&v22 + 1) + 8 * j);
          if ([v4 matchCookie:v18])
          {
            [v6 addObject:v18];
          }
          else
          {
            v19 = getCookieLogHandle();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v18;
              _os_log_debug_impl(&dword_184085000, v19, OS_LOG_TYPE_DEBUG, "[MemoryCookieStore]: Cookie dropped since filters don't match. Cookie = %@", buf, 0xCu);
            }
          }
        }
        uint64_t v15 = [v7 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v15);
    }
  }

  return v6;
}

- (id)getAllCookies
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = self->memoryCookies;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = [(NSMutableDictionary *)self->memoryCookies objectForKeyedSubscript:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        long long v17 = 0u;
        long long v18 = 0u;
        long long v15 = 0u;
        long long v16 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v16;
          do
          {
            for (uint64_t j = 0; j != v9; ++j)
            {
              if (*(void *)v16 != v10) {
                objc_enumerationMutation(v8);
              }
              v12 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * j)];
              [v3 addObject:v12];
            }
            uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v9);
        }
      }
      uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v4);
  }

  return v3;
}

- (void)deleteCookiesWithFilter:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(NSMemoryHTTPCookie2Storage *)self getCookiesWithFilter:a3];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[NSMemoryHTTPCookie2Storage deleteCookie:](self, "deleteCookie:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)deleteCookies:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[NSMemoryHTTPCookie2Storage deleteCookie:](self, "deleteCookie:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)deleteCookie:(id)a3
{
  id v4 = a3;
  memoryCookies = self->memoryCookies;
  id v11 = v4;
  uint64_t v6 = [v4 domain];
  uint64_t v7 = +[NSHTTPCookieStorageUtils getEffectiveTLDPlusOne:]((uint64_t)NSHTTPCookieStorageUtils, v6);
  long long v8 = [(NSMutableDictionary *)memoryCookies objectForKeyedSubscript:v7];

  if (v8)
  {
    long long v9 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v11);
    long long v10 = [v8 objectForKeyedSubscript:v9];
    if ([v10 isEqual:v11]) {
      [v8 setObject:0 forKeyedSubscript:v9];
    }
  }
}

- (void)deleteAllCookies
{
}

- (void)setCookies:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[NSMemoryHTTPCookie2Storage setCookie:](self, "setCookie:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setCookie:(id)a3
{
  id v8 = a3;
  id v4 = [v8 domain];
  uint64_t v5 = +[NSHTTPCookieStorageUtils getEffectiveTLDPlusOne:]((uint64_t)NSHTTPCookieStorageUtils, v4);

  id v6 = [(NSMutableDictionary *)self->memoryCookies objectForKeyedSubscript:v5];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->memoryCookies setObject:v6 forKeyedSubscript:v5];
  }
  uint64_t v7 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v8);
  [v6 setObject:v8 forKeyedSubscript:v7];
}

- (NSMemoryHTTPCookie2Storage)init
{
  v6.receiver = self;
  v6.super_class = (Class)NSMemoryHTTPCookie2Storage;
  v2 = [(NSMemoryHTTPCookie2Storage *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    memoryCookies = v2->memoryCookies;
    v2->memoryCookies = v3;
  }
  return v2;
}

@end