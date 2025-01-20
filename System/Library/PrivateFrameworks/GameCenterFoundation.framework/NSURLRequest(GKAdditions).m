@interface NSURLRequest(GKAdditions)
- (_GKURLRequestDictionaryKey)_gkDictionaryKey;
- (id)loggableHeaders;
@end

@implementation NSURLRequest(GKAdditions)

- (_GKURLRequestDictionaryKey)_gkDictionaryKey
{
  return +[_GKURLRequestDictionaryKey keyWithRequest:a1];
}

- (id)loggableHeaders
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [a1 allHTTPHeaderFields];
  v3 = (void *)[v2 mutableCopy];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(a1, "allHTTPHeaderFields", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (![v9 caseInsensitiveCompare:@"X-Apple-I-MD"]
          || ![v9 caseInsensitiveCompare:@"X-Apple-I-MD-M"]
          || ![v9 caseInsensitiveCompare:@"x-gk-auth-token"])
        {
          [v3 removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];

  return v10;
}

@end