@interface NSDictionary(MCDictionaryUtilities)
- (uint64_t)MSDeepCopy;
- (uint64_t)MSMutableDeepCopy;
- (void)MSMutableDeepCopyWithZone:()MCDictionaryUtilities;
@end

@implementation NSDictionary(MCDictionaryUtilities)

- (uint64_t)MSDeepCopy
{
  return [a1 MSDeepCopyWithZone:0];
}

- (uint64_t)MSMutableDeepCopy
{
  return [a1 MSMutableDeepCopyWithZone:0];
}

- (void)MSMutableDeepCopyWithZone:()MCDictionaryUtilities
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v6 = objc_msgSend(a1, "keyEnumerator", 0);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v17 + 1) + 8 * v10);
        v12 = [a1 objectForKey:v11];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v13 = [v12 MSMutableDeepCopyWithZone:a3];
LABEL_9:
          v14 = (void *)v13;
          [v5 setObject:v13 forKey:v11];

          goto LABEL_10;
        }
        if ([v12 conformsToProtocol:&unk_1F3681630])
        {
          uint64_t v13 = [v12 copyWithZone:a3];
          goto LABEL_9;
        }
        [v5 setObject:v12 forKey:v11];
LABEL_10:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v15 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v8 = v15;
    }
    while (v15);
  }

  return v5;
}

@end