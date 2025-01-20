@interface HMDEventRouterLogEventUtilities
+ (id)sanitizedTopicFromTopic:(id)a3;
@end

@implementation HMDEventRouterLogEventUtilities

+ (id)sanitizedTopicFromTopic:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@"."];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x263F089D8]), "initWithCapacity:", objc_msgSend(v3, "length"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x263F08C38]);
        v13 = objc_msgSend(v12, "initWithUUIDString:", v11, (void)v16);

        if (!v13)
        {
          if ([v5 length]) {
            [v5 appendString:@"."];
          }
          [v5 appendString:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  v14 = (void *)[v5 copy];
  return v14;
}

@end