@interface MUILocalizationListFormatter
- (id)attributedLocalizedStringFromList:(id)a3;
- (id)localizedStringFromList:(id)a3;
- (id)stringForObjectValue:(id)a3;
@end

@implementation MUILocalizationListFormatter

- (id)attributedLocalizedStringFromList:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  if ([v3 count] == 2)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"LIST_EXACTLY_TWO_ITEMS" value:&stru_1F39CB5D8 table:@"MUIListFormatter"];
    v8 = (void *)v7;
    if (v7) {
      v9 = (__CFString *)v7;
    }
    else {
      v9 = &stru_1F39CB5D8;
    }
    v10 = (void *)[v5 initWithString:v9];

    v11 = [v3 objectAtIndexedSubscript:0];
    v12 = [v3 objectAtIndexedSubscript:1];
    objc_msgSend(v4, "appendLocalizedFormat:", v10, v11, v12);
  }
  else if (v3)
  {
    uint64_t v13 = [v3 count];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v29 = v3;
    id obj = v3;
    uint64_t v14 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v33;
      do
      {
        uint64_t v17 = 0;
        uint64_t v30 = v13;
        uint64_t v18 = v13 - 1;
        do
        {
          if (*(void *)v33 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * v17);
          if ([v4 length])
          {
            id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
            v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v22 = v21;
            if (v18 == v17) {
              v23 = @"LIST_FINAL_ITEM";
            }
            else {
              v23 = @"LIST_NON_FINAL_ITEM";
            }
          }
          else
          {
            id v20 = objc_alloc(MEMORY[0x1E4F28B18]);
            v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            v22 = v21;
            v23 = @"LIST_INITIAL_ITEM";
          }
          uint64_t v24 = [v21 localizedStringForKey:v23 value:&stru_1F39CB5D8 table:@"MUIListFormatter"];
          v25 = (void *)v24;
          if (v24) {
            v26 = (__CFString *)v24;
          }
          else {
            v26 = &stru_1F39CB5D8;
          }
          v27 = (void *)[v20 initWithString:v26];

          objc_msgSend(v4, "appendLocalizedFormat:", v27, v19);
          ++v17;
        }
        while (v15 != v17);
        uint64_t v13 = v30 - v15;
        uint64_t v15 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v15);
    }

    id v3 = v29;
  }

  return v4;
}

- (id)localizedStringFromList:(id)a3
{
  id v4 = objc_msgSend(a3, "ef_map:", &__block_literal_global_20);
  id v5 = [(MUILocalizationListFormatter *)self attributedLocalizedStringFromList:v4];
  v6 = [v5 string];

  return v6;
}

id __56__MUILocalizationListFormatter_localizedStringFromList___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F28B18];
  id v3 = a2;
  id v4 = [v2 alloc];
  if (v3) {
    id v5 = v3;
  }
  else {
    id v5 = &stru_1F39CB5D8;
  }
  v6 = (void *)[v4 initWithString:v5];

  return v6;
}

- (id)stringForObjectValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "ef_all:", &__block_literal_global_23))
  {
    id v5 = [(MUILocalizationListFormatter *)self localizedStringFromList:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __53__MUILocalizationListFormatter_stringForObjectValue___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end