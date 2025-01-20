@interface NSArray(BNPresentableIdentifyingAdditions)
- (id)bn_identificationsForPresentables;
@end

@implementation NSArray(BNPresentableIdentifyingAdditions)

- (id)bn_identificationsForPresentables
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
        {
          v9 = +[BNPresentableIdentification uniqueIdentificationForPresentable:](BNPresentableIdentification, "uniqueIdentificationForPresentable:", v8, (void)v11);
          if (v9) {
            [v2 addObject:v9];
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  return v2;
}

@end