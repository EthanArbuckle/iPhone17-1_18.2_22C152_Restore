@interface NSArray(IntlPreferencesAdditions)
- (id)filteredLanguagesBySearchString:()IntlPreferencesAdditions;
@end

@implementation NSArray(IntlPreferencesAdditions)

- (id)filteredLanguagesBySearchString:()IntlPreferencesAdditions
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  if ([v19 length])
  {
    id v22 = [MEMORY[0x1E4F1CA48] array];
    v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF beginswith[cld] %@", v19];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id obj = a1;
    uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v5)
    {
      uint64_t v21 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v38 != v21) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          v8 = [v7 name];
          v9 = [v7 localizedStringForName];
          if ([v4 evaluateWithObject:v8]
            || [v4 evaluateWithObject:v9])
          {
            [v22 addObject:v7];
          }
          else
          {
            uint64_t v33 = 0;
            v34 = &v33;
            uint64_t v35 = 0x2020000000;
            char v36 = 0;
            uint64_t v10 = [v8 length];
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __69__NSArray_IntlPreferencesAdditions__filteredLanguagesBySearchString___block_invoke;
            v28[3] = &unk_1E63C00D0;
            id v11 = v4;
            id v29 = v11;
            id v12 = v22;
            id v30 = v12;
            v31 = v7;
            v32 = &v33;
            objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v28);
            if (!*((unsigned char *)v34 + 24))
            {
              uint64_t v13 = [v9 length];
              v23[0] = MEMORY[0x1E4F143A8];
              v23[1] = 3221225472;
              v23[2] = __69__NSArray_IntlPreferencesAdditions__filteredLanguagesBySearchString___block_invoke_2;
              v23[3] = &unk_1E63C00D0;
              id v24 = v11;
              id v14 = v12;
              id v25 = v14;
              v26 = v7;
              v27 = &v33;
              objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v13, 3, v23);
              if (!*((unsigned char *)v34 + 24))
              {
                v15 = [v7 identifier];
                v16 = [v19 lowercaseString];
                int v17 = [v15 hasPrefix:v16];

                if (v17) {
                  [v14 addObject:v7];
                }
              }
            }
            _Block_object_dispose(&v33, 8);
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v5);
    }
  }
  else
  {
    id v22 = (id)[a1 copy];
  }

  return v22;
}

@end