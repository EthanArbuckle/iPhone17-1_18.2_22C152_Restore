@interface NSDictionary(SocialAdditions)
+ (id)SLDictionaryWithOAuthAccessTokenResponseData:()SocialAdditions;
@end

@implementation NSDictionary(SocialAdditions)

+ (id)SLDictionaryWithOAuthAccessTokenResponseData:()SocialAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v16 = v3;
  v5 = (void *)[[NSString alloc] initWithData:v3 encoding:4];
  v6 = [v5 componentsSeparatedByString:@"&"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v11 count] == 2)
        {
          v12 = [v11 objectAtIndex:1];
          v13 = [v12 stringByReplacingPercentEscapesUsingEncoding:4];

          v14 = [v11 objectAtIndex:0];
          [v4 setObject:v13 forKey:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v4;
}

@end