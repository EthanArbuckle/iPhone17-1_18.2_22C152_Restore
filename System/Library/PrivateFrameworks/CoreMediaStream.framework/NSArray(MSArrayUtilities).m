@interface NSArray(MSArrayUtilities)
- (uint64_t)MSMutableDeepCopy;
- (void)MSMutableDeepCopyWithZone:()MSArrayUtilities;
@end

@implementation NSArray(MSArrayUtilities)

- (uint64_t)MSMutableDeepCopy
{
  return [a1 MSMutableDeepCopyWithZone:0];
}

- (void)MSMutableDeepCopyWithZone:()MSArrayUtilities
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
        {
          uint64_t v12 = objc_msgSend(v11, "MSMutableDeepCopyWithZone:", a3, (void)v16);
LABEL_9:
          v13 = (void *)v12;
          [v5 addObject:v12];

          goto LABEL_10;
        }
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1F3681630, (void)v16))
        {
          uint64_t v12 = [v11 copyWithZone:a3];
          goto LABEL_9;
        }
        [v5 addObject:v11];
LABEL_10:
        ++v10;
      }
      while (v8 != v10);
      uint64_t v14 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v8 = v14;
    }
    while (v14);
  }

  return v5;
}

@end