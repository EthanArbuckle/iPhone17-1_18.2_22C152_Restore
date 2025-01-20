@interface NSManagedObject(TIUserDictionaryWordServer)
- (void)_copyAttributeValuesFromObject:()TIUserDictionaryWordServer;
@end

@implementation NSManagedObject(TIUserDictionaryWordServer)

- (void)_copyAttributeValuesFromObject:()TIUserDictionaryWordServer
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 entity];
  v6 = [a1 entity];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    v8 = [a1 entity];
    v9 = [v8 attributesByName];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_msgSend(v4, "willAccessValueForKey:", v15, (void)v17);
          v16 = [v4 valueForKey:v15];
          [v4 didAccessValueForKey:v15];
          [a1 willChangeValueForKey:v15];
          [a1 setValue:v16 forKey:v15];
          [a1 didChangeValueForKey:v15];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
  }
}

@end