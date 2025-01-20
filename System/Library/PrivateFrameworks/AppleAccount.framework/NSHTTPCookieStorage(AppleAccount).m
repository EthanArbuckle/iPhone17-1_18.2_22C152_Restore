@interface NSHTTPCookieStorage(AppleAccount)
+ (id)aa_icloudCookies;
@end

@implementation NSHTTPCookieStorage(AppleAccount)

+ (id)aa_icloudCookies
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F18D30] sharedHTTPCookieStorage];
  v1 = [v0 cookies];

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "domain", (void)v12);
        int v10 = [v9 containsString:@".icloud.com"];

        if (v10) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

@end