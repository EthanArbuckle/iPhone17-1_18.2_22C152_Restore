@interface NSObject(AskPermission)
- (id)ap_generateDescriptionWithSubObjects:()AskPermission;
@end

@implementation NSObject(AskPermission)

- (id)ap_generateDescriptionWithSubObjects:()AskPermission
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@: %p>", objc_opt_class(), a1];
  if ([v4 count])
  {
    [v5 appendString:@" {\n"];
    v6 = [v4 allKeys];
    v7 = [v6 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          v14 = [v4 objectForKeyedSubscript:v13];
          [v5 appendFormat:@"  %@ = %@,\n", v13, v14, (void)v16];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [v5 appendString:@"}"];
  }

  return v5;
}

@end