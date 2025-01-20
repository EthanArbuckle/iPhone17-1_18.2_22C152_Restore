@interface NSDictionary(CARMutableDeepCopy)
- (id)carMutableDeepCopy;
@end

@implementation NSDictionary(CARMutableDeepCopy)

- (id)carMutableDeepCopy
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v3 = [a1 allKeys];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v9 = [a1 objectForKey:v8];
        if ([v9 conformsToProtocol:&unk_1F03242E0])
        {
          id v10 = [v9 carMutableDeepCopy];
        }
        else if ([v9 conformsToProtocol:&unk_1F0323FA0])
        {
          id v10 = (id)[v9 mutableCopy];
        }
        else if ([v9 conformsToProtocol:&unk_1F031BE70])
        {
          id v10 = (id)[v9 copy];
        }
        else
        {
          id v10 = v9;
        }
        v11 = v10;
        [v2 setValue:v10 forKey:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  return v2;
}

@end