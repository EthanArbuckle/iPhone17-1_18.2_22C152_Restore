@interface NSArray(NSEmailAddressArray)
- (id)mf_uncommentedAddressList;
@end

@implementation NSArray(NSEmailAddressArray)

- (id)mf_uncommentedAddressList
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = (void *)[a1 count];
  if (v2)
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v2];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v3 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v9;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(a1);
          }
          objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v6++), "mf_uncommentedAddress"));
        }
        while (v4 != v6);
        uint64_t v4 = [a1 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v4);
    }
  }
  return v2;
}

@end