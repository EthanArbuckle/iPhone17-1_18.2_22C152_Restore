@interface NSArray(CARMutableDeepCopy)
- (id)carMutableDeepCopy;
@end

@implementation NSArray(CARMutableDeepCopy)

- (id)carMutableDeepCopy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a1;
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
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1F03242E0, (void)v12))
        {
          id v9 = [v8 carMutableDeepCopy];
        }
        else if ([v8 conformsToProtocol:&unk_1F0323FA0])
        {
          id v9 = (id)[v8 mutableCopy];
        }
        else if ([v8 conformsToProtocol:&unk_1F031BE70])
        {
          id v9 = (id)[v8 copy];
        }
        else
        {
          id v9 = v8;
        }
        v10 = v9;
        [v2 addObject:v9];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v2;
}

@end