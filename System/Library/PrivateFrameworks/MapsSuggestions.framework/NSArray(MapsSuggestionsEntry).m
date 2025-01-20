@interface NSArray(MapsSuggestionsEntry)
- (uint64_t)containsEntryWithIdentifier:()MapsSuggestionsEntry;
@end

@implementation NSArray(MapsSuggestionsEntry)

- (uint64_t)containsEntryWithIdentifier:()MapsSuggestionsEntry
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_class();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_opt_isKindOfClass())
        {
          v11 = objc_msgSend(v10, "uniqueIdentifier", (void)v14);
          char v12 = [v4 isEqualToString:v11];

          if (v12)
          {
            uint64_t v7 = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v7;
}

@end