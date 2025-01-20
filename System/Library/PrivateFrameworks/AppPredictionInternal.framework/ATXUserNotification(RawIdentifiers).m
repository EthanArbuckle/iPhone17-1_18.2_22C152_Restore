@interface ATXUserNotification(RawIdentifiers)
- (void)setRawIdentifiersWithContactRepresentationDataStore:()RawIdentifiers;
@end

@implementation ATXUserNotification(RawIdentifiers)

- (void)setRawIdentifiersWithContactRepresentationDataStore:()RawIdentifiers
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18 = a1;
  v5 = [a1 contactIDs];
  v6 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = [v4 cnContactForCnContactId:*(void *)(*((void *)&v20 + 1) + 8 * v10) rawIdentifier:0];
        v12 = [v11 phoneNumbers];
        v13 = objc_msgSend(v12, "_pas_mappedArrayWithTransform:", &__block_literal_global_28);

        v14 = [v11 emailAddresses];
        v15 = objc_msgSend(v14, "_pas_mappedArrayWithTransform:", &__block_literal_global_12);

        if ([v13 count])
        {
          v16 = [v13 firstObject];
          [v6 addObject:v16];
        }
        if ([v15 count])
        {
          v17 = [v15 firstObject];
          [v6 addObject:v17];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  [v18 setRawIdentifiers:v6];
}

@end