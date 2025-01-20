@interface HMAccessoryDiagnosticsMetadata(HFAdditions)
+ (id)hf_serviceURL:()HFAdditions withParameters:;
- (id)hf_serviceURLWithParameters;
@end

@implementation HMAccessoryDiagnosticsMetadata(HFAdditions)

- (id)hf_serviceURLWithParameters
{
  v2 = objc_opt_class();
  v3 = [a1 uploadDestination];
  v4 = [a1 urlParameters];
  v5 = objc_msgSend(v2, "hf_serviceURL:withParameters:", v3, v4);

  return v5;
}

+ (id)hf_serviceURL:()HFAdditions withParameters:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [MEMORY[0x263F08BA0] componentsWithURL:a3 resolvingAgainstBaseURL:0];
  v7 = [MEMORY[0x263EFF980] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v14 = objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v18);
        v15 = [MEMORY[0x263F08BD0] queryItemWithName:v13 value:v14];
        [v7 addObject:v15];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  if ([v7 count]) {
    [v6 setQueryItems:v7];
  }
  v16 = objc_msgSend(v6, "URL", (void)v18);

  return v16;
}

@end