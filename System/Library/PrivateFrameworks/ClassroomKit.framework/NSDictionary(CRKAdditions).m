@interface NSDictionary(CRKAdditions)
- (id)crk_dictionaryByAddingEntriesFromDictionary:()CRKAdditions;
- (id)crk_keyValueObservingNewObject;
- (id)crk_keyValueObservingOldObject;
@end

@implementation NSDictionary(CRKAdditions)

- (id)crk_keyValueObservingOldObject
{
  uint64_t v2 = *MEMORY[0x263F081C8];
  v3 = [a1 objectForKeyedSubscript:*MEMORY[0x263F081C8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = 0;
  }
  else
  {
    v4 = [a1 objectForKeyedSubscript:v2];
  }

  return v4;
}

- (id)crk_keyValueObservingNewObject
{
  uint64_t v2 = *MEMORY[0x263F081B8];
  v3 = [a1 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = 0;
  }
  else
  {
    v4 = [a1 objectForKeyedSubscript:v2];
  }

  return v4;
}

- (id)crk_dictionaryByAddingEntriesFromDictionary:()CRKAdditions
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 addEntriesFromDictionary:v4];

  v6 = (void *)[v5 copy];

  return v6;
}

@end