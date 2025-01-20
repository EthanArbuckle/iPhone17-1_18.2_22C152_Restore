@interface NSURL(CNFRegAdditions)
- (id)CNFQueryDictionary;
- (id)URLByAppendingCNFQueryDictionary:()CNFRegAdditions;
@end

@implementation NSURL(CNFRegAdditions)

- (id)CNFQueryDictionary
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = [a1 query];
  v4 = v3;
  if (v3 && [v3 length])
  {
    v5 = [v4 componentsSeparatedByString:@"&"];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          id v18 = 0;
          id v19 = 0;
          int v11 = _parseKeyValuePair(v10, &v19, &v18);
          id v12 = v19;
          id v13 = v18;
          v14 = v13;
          if (v11) {
            BOOL v15 = v13 == 0;
          }
          else {
            BOOL v15 = 1;
          }
          if (!v15 && v12 != 0) {
            [v2 setObject:v13 forKey:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v7);
    }
  }
  return v2;
}

- (id)URLByAppendingCNFQueryDictionary:()CNFRegAdditions
{
  id v4 = a3;
  v5 = v4;
  if (!v4 || ![v4 count]) {
    goto LABEL_7;
  }
  uint64_t v6 = [a1 absoluteString];
  uint64_t v7 = [a1 query];
  id v8 = v6;
  v9 = v8;
  v10 = v8;
  if (v7)
  {
    uint64_t v11 = [v8 rangeOfString:@"?"];
    v10 = v9;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = [v9 substringToIndex:v11];
    }
  }
  id v12 = [a1 CNFQueryDictionary];
  id v13 = (void *)[v12 mutableCopy];

  [v13 addEntriesFromDictionary:v5];
  v14 = _queryStringFromCNFQueryDictionary(v13);
  BOOL v15 = [NSString stringWithFormat:@"%@?%@", v10, v14];
  id v16 = [NSURL URLWithString:v15];

  if (!v16) {
LABEL_7:
  }
    id v16 = a1;

  return v16;
}

@end