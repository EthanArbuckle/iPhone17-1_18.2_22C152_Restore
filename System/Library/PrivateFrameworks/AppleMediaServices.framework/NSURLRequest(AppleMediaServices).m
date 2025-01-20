@interface NSURLRequest(AppleMediaServices)
- (id)ams_cookies;
- (uint64_t)ams_requestIsBagLoad;
@end

@implementation NSURLRequest(AppleMediaServices)

- (uint64_t)ams_requestIsBagLoad
{
  v1 = [a1 URL];
  uint64_t v2 = objc_msgSend(v1, "ams_isBagLoadURL");

  return v2;
}

- (id)ams_cookies
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v18 = [a1 valueForHTTPHeaderField:@"Cookie"];
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = [v18 componentsSeparatedByString:@";"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v2 = [v1 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
        v8 = [v6 stringByTrimmingCharactersInSet:v7];

        uint64_t v9 = [v8 rangeOfString:@"="];
        if (v9 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = v9;
          unint64_t v11 = v9 + 1;
          unint64_t v12 = [v8 length];
          if (v10 && v11 < v12)
          {
            v14 = [v8 substringToIndex:v10];
            v15 = [v8 substringFromIndex:v11];
            [v19 setObject:v15 forKeyedSubscript:v14];
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }
  v16 = (void *)[v19 copy];

  return v16;
}

@end