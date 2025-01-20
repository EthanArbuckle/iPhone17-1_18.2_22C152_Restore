@interface NSUserDefaults(ARAppleGlobalDomain)
+ (id)appleGlobalDomain;
+ (id)appleGlobalDomainARKitDefaults;
+ (id)appleGlobalDomainARKitKeys;
@end

@implementation NSUserDefaults(ARAppleGlobalDomain)

+ (id)appleGlobalDomain
{
  if (appleGlobalDomain_onceToken != -1) {
    dispatch_once(&appleGlobalDomain_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)appleGlobalDomain_defaults;
  return v0;
}

+ (id)appleGlobalDomainARKitKeys
{
  v0 = [MEMORY[0x1E4F1CB18] appleGlobalDomain];
  v1 = [v0 dictionaryRepresentation];
  v2 = [v1 allKeys];

  v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_5];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

+ (id)appleGlobalDomainARKitDefaults
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] appleGlobalDomainARKitKeys];
  v1 = [MEMORY[0x1E4F1CB18] appleGlobalDomain];
  v2 = [v1 dictionaryRepresentation];

  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v0;
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
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v2, "objectForKey:", v9, (void)v12);
        [v3 setObject:v10 forKey:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

@end