@interface NSArray
@end

@implementation NSArray

uint64_t __47__NSArray__FPComparatorAddition__fp_comparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v11), "compareObject:toObject:", v5, v6, (void)v15);
        if (v12)
        {
          uint64_t v13 = v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  uint64_t v13 = 0;
LABEL_11:

  return v13;
}

void __45__NSArray__FPSpotlightQueryHelpers___fp_map___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

void __49__NSArray_FPFrameworkAdditions__fp_mapWithIndex___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void *)MEMORY[0x1A6248870]();
  v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v4) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

uint64_t __40__NSArray_FPFrameworkAdditions__fp_map___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__NSArray_FPFrameworkAdditions__fp_sortDescriptorByDisplayName__block_invoke()
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F29008];
  v1 = NSStringFromSelector(sel_displayName);
  id v2 = [v0 sortDescriptorWithKey:v1 ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v8[0] = v2;
  v3 = (void *)MEMORY[0x1E4F29008];
  v4 = NSStringFromSelector(sel_itemIdentifier);
  id v5 = [v3 sortDescriptorWithKey:v4 ascending:1];
  v8[1] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
  id v7 = (void *)fp_sortDescriptorByDisplayName_sortDescriptors;
  fp_sortDescriptorByDisplayName_sortDescriptors = v6;
}

void __64__NSArray_FPFrameworkAdditions__fp_sortDescriptorByLastUsedDate__block_invoke()
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F29008];
  v1 = NSStringFromSelector(sel_lastUsedDate);
  id v2 = [v0 sortDescriptorWithKey:v1 ascending:0];
  v3 = (void *)MEMORY[0x1E4F29008];
  v4 = NSStringFromSelector(sel_displayName);
  id v5 = objc_msgSend(v3, "sortDescriptorWithKey:ascending:selector:", v4, 1, sel_localizedCaseInsensitiveCompare_, v2);
  v11[1] = v5;
  uint64_t v6 = (void *)MEMORY[0x1E4F29008];
  id v7 = NSStringFromSelector(sel_itemIdentifier);
  uint64_t v8 = [v6 sortDescriptorWithKey:v7 ascending:1];
  v11[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  uint64_t v10 = (void *)fp_sortDescriptorByLastUsedDate_sortDescriptors;
  fp_sortDescriptorByLastUsedDate_sortDescriptors = v9;
}

void __74__NSArray_FPFrameworkAdditions__fp_sortDescriptorByModifiedDateDescending__block_invoke()
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F29008];
  v1 = NSStringFromSelector(sel_contentModificationDate);
  id v2 = [v0 sortDescriptorWithKey:v1 ascending:0];
  v3 = (void *)MEMORY[0x1E4F29008];
  v4 = NSStringFromSelector(sel_displayName);
  id v5 = objc_msgSend(v3, "sortDescriptorWithKey:ascending:selector:", v4, 1, sel_localizedCaseInsensitiveCompare_, v2);
  v11[1] = v5;
  uint64_t v6 = (void *)MEMORY[0x1E4F29008];
  id v7 = NSStringFromSelector(sel_itemIdentifier);
  uint64_t v8 = [v6 sortDescriptorWithKey:v7 ascending:1];
  v11[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  uint64_t v10 = (void *)fp_sortDescriptorByModifiedDateDescending_sortDescriptors;
  fp_sortDescriptorByModifiedDateDescending_sortDescriptors = v9;
}

void __64__NSArray_FPFrameworkAdditions__fp_sortDescriptorByDocumentSize__block_invoke()
{
  v11[3] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F29008];
  v1 = NSStringFromSelector(sel_documentSize);
  id v2 = [v0 sortDescriptorWithKey:v1 ascending:0];
  v3 = (void *)MEMORY[0x1E4F29008];
  v4 = NSStringFromSelector(sel_displayName);
  id v5 = objc_msgSend(v3, "sortDescriptorWithKey:ascending:selector:", v4, 1, sel_localizedCaseInsensitiveCompare_, v2);
  v11[1] = v5;
  uint64_t v6 = (void *)MEMORY[0x1E4F29008];
  id v7 = NSStringFromSelector(sel_itemIdentifier);
  uint64_t v8 = [v6 sortDescriptorWithKey:v7 ascending:1];
  v11[2] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:3];
  uint64_t v10 = (void *)fp_sortDescriptorByDocumentSize_sortDescriptors;
  fp_sortDescriptorByDocumentSize_sortDescriptors = v9;
}

void __47__NSArray_FPFrameworkAdditions__fp_categorize___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = (void *)MEMORY[0x1A6248870]();
  v4 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) objectForKeyedSubscript:v4];
    if (!v5)
    {
      id v5 = [MEMORY[0x1E4F1CA48] array];
      [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v4];
    }
    [v5 addObject:v6];
  }
}

void __68__NSArray_FPFrameworkAdditions__fp_removingObjectsNotKindOfClasses___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1A6248870]();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *(id *)(a1 + 32);
  id v6 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_opt_isKindOfClass())
        {
          id v6 = (char *)v3;
          goto LABEL_11;
        }
      }
      id v6 = (char *)[v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v9 = objc_msgSend(v6, "fp_removingObjectsNotKindOfClasses:", *(void *)(a1 + 32), v10);

    id v6 = (char *)v9;
  }
  if (v6) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

uint64_t __39__NSArray_FPAction__fp_itemIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 itemIdentifier];
}

uint64_t __31__NSArray_FPAction__fp_itemIDs__block_invoke(uint64_t a1, void *a2)
{
  return [a2 itemID];
}

void __48__NSArray__FPSpotlightQueryHelpers___fp_filter___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))()) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

uint64_t __66__NSArray__FPSpotlightQueryHelpers___fp_componentsWrappedInQuotes__block_invoke(uint64_t a1, uint64_t a2)
{
  return [NSString stringWithFormat:@"\"%@\"", a2];
}

@end