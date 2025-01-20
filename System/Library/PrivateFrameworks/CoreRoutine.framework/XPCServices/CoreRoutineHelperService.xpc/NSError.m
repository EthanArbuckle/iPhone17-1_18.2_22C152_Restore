@interface NSError
- (BOOL)isOnlyThrottlingError;
- (BOOL)isOnlyTimeoutError;
- (id)_detailedErrors;
- (id)_underlyingErrorsRTMultiError;
- (id)flattenErrors;
@end

@implementation NSError

- (BOOL)isOnlyThrottlingError
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v2 = [(NSError *)self flattenErrors];
  id v3 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (!v3)
  {
    BOOL v14 = 1;
    goto LABEL_19;
  }
  id v4 = v3;
  uint64_t v5 = *(void *)v17;
  uint64_t v6 = GEOErrorHttpStatusCodeKey;
  while (2)
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v17 != v5) {
        objc_enumerationMutation(v2);
      }
      v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
      v9 = [v8 domain];
      v10 = GEOErrorDomain();
      if (([v9 isEqualToString:v10] & 1) == 0)
      {

LABEL_18:
        BOOL v14 = 0;
        goto LABEL_19;
      }
      if ([v8 code] == (id)-7)
      {
        v11 = [v8 userInfo];
        v12 = [v11 objectForKeyedSubscript:v6];
        if ([v12 integerValue] == (id)429)
        {

          continue;
        }
        id v13 = [v8 code];
      }
      else
      {
        id v13 = [v8 code];
      }

      if (v13 != (id)-3) {
        goto LABEL_18;
      }
    }
    id v4 = [v2 countByEnumeratingWithState:&v16 objects:v20 count:16];
    BOOL v14 = 1;
    if (v4) {
      continue;
    }
    break;
  }
LABEL_19:

  return v14;
}

- (BOOL)isOnlyTimeoutError
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(NSError *)self flattenErrors];
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    uint64_t v6 = RTErrorDomain;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v9 = [v8 domain];
        if (![v9 isEqualToString:v6])
        {

LABEL_13:
          BOOL v11 = 0;
          goto LABEL_14;
        }
        id v10 = [v8 code];

        if (v10 != (id)15) {
          goto LABEL_13;
        }
      }
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      BOOL v11 = 1;
      if (v4) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_14:

  return v11;
}

- (id)_underlyingErrorsRTMultiError
{
  id v3 = [(NSError *)self domain];
  if ([v3 isEqualToString:RTErrorDomain] && (id)-[NSError code](self, "code") == (id)9)
  {
    id v4 = [(NSError *)self userInfo];
    uint64_t v5 = RTDetailedErrorsKey;
    uint64_t v6 = [v4 objectForKeyedSubscript:RTDetailedErrorsKey];

    if (v6)
    {
      v7 = [(NSError *)self userInfo];
      v8 = [v7 objectForKeyedSubscript:v5];

      goto LABEL_7;
    }
  }
  else
  {
  }
  v8 = +[NSArray array];
LABEL_7:
  return v8;
}

- (id)_detailedErrors
{
  id v3 = +[NSMutableArray array];
  id v4 = [(NSError *)self _underlyingErrorsRTMultiError];
  [v3 addObjectsFromArray:v4];

  uint64_t v5 = [(NSError *)self underlyingErrors];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (id)flattenErrors
{
  id v3 = +[NSMutableArray array];
  id v4 = [(NSError *)self _detailedErrors];
  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "flattenErrors", (void)v12);
          [v3 addObjectsFromArray:v10];
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    [v3 addObject:self];
  }

  return v3;
}

@end