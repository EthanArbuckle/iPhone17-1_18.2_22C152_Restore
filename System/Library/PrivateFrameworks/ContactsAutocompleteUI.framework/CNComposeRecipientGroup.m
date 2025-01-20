@interface CNComposeRecipientGroup
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)showsChevronButton;
- (BOOL)wasCompleteMatch;
- (CNComposeRecipientGroup)initWithChildren:(id)a3 displayString:(id)a4;
- (id)address;
- (id)children;
- (id)childrenWithCompleteMatches;
- (id)commentedAddress;
- (id)completelyMatchedAttributedStrings;
- (id)label;
- (id)placeholderName;
- (id)sortedChildren;
- (void)_populateSortedChildren;
- (void)addRecipientToPasteboard:(id)a3;
@end

@implementation CNComposeRecipientGroup

- (CNComposeRecipientGroup)initWithChildren:(id)a3 displayString:(id)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNComposeRecipientGroup;
  v8 = [(CNComposeRecipient *)&v12 initWithContact:0 address:0 displayString:a4 kind:5];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_children, a3);
    v10 = v9;
  }

  return v9;
}

- (id)children
{
  return self->_children;
}

- (id)label
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"GROUP_RECIPIENT" value:&stru_1F0EC0C28 table:@"Localized"];

  return v3;
}

- (id)placeholderName
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"GROUP_RECIPIENT_PLACEHOLDER" value:&stru_1F0EC0C28 table:@"Localized"];

  return v3;
}

- (void)_populateSortedChildren
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v3 = [(CNComposeRecipient *)self cachedSortedMembers];

  if (!v3)
  {
    v4 = [(CNComposeRecipient *)self originContext];
    v5 = [v4 searchTerm];

    v6 = [(CNComposeRecipientGroup *)self children];
    id v36 = 0;
    id v37 = 0;
    id v7 = _sortedArrayByRelevancy(v5, v6, &v37, &v36);
    id v8 = v37;
    id v9 = v36;

    [(CNComposeRecipient *)self setCachedSortedMembers:v7];
    [(CNComposeRecipient *)self setCachedMatchedStrings:v9];
    [(CNComposeRecipient *)self setCachedCompleteMatches:v8];
    v10 = [(CNComposeRecipient *)self compositeName];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      id v25 = v9;
      id v26 = v8;
      v27 = v7;
      objc_super v12 = [MEMORY[0x1E4F1CA48] array];
      v13 = (void *)MEMORY[0x1E4F237B8];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __50__CNComposeRecipientGroup__populateSortedChildren__block_invoke;
      v34[3] = &unk_1E6128B30;
      id v14 = v12;
      id v35 = v14;
      [v13 enumerateTokensForString:v5 locale:0 options:0 withHandler:v34];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v15 = v14;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v31;
        do
        {
          uint64_t v19 = 0;
          do
          {
            if (*(void *)v31 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v30 + 1) + 8 * v19);
            char v29 = 0;
            v21 = [(CNComposeRecipient *)self cachedMatchedStrings];
            v22 = [(CNComposeRecipient *)self compositeName];
            uint64_t v28 = 0;
            v23 = _getDisplayNameMatches(v22, v20, &v28, &v29);
            v24 = [v21 arrayByAddingObjectsFromArray:v23];
            [(CNComposeRecipient *)self setCachedMatchedStrings:v24];

            ++v19;
          }
          while (v17 != v19);
          uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
        }
        while (v17);
      }

      id v8 = v26;
      id v7 = v27;
      id v9 = v25;
    }
  }
}

uint64_t __50__CNComposeRecipientGroup__populateSortedChildren__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (id)sortedChildren
{
  v3 = [(CNComposeRecipient *)self cachedSortedMembers];

  if (!v3) {
    [(CNComposeRecipientGroup *)self _populateSortedChildren];
  }

  return [(CNComposeRecipient *)self cachedSortedMembers];
}

- (BOOL)isGroup
{
  return 1;
}

- (BOOL)showsChevronButton
{
  v2 = [(CNComposeRecipientGroup *)self children];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)address
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(CNComposeRecipientGroup *)self children];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v6 = [(CNComposeRecipientGroup *)self children];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [*(id *)(*((void *)&v15 + 1) + 8 * i) address];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  objc_super v12 = CNAUILocalizedAddressSeparator();
  v13 = [v5 componentsJoinedByString:v12];

  return v13;
}

- (id)commentedAddress
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(CNComposeRecipientGroup *)self address];
    uint64_t v7 = [v5 address];
    if ([v6 isEqualToString:v7])
    {
      uint64_t v8 = [v5 children];
      uint64_t v9 = [(CNComposeRecipientGroup *)self children];
      char v10 = [v8 isEqualToArray:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)wasCompleteMatch
{
  BOOL v3 = [(CNComposeRecipient *)self cachedCompleteMatches];

  if (v3)
  {
    id v4 = [(CNComposeRecipient *)self cachedCompleteMatches];
    uint64_t v5 = [v4 count];
  }
  else
  {
    id v4 = [(CNComposeRecipient *)self originContext];
    v6 = [v4 searchTerm];
    uint64_t v7 = [(CNComposeRecipientGroup *)self children];
    uint64_t v9 = 0;
    uint64_t v5 = _fastCountOfCompleteMatches(v6, v7, &v9);
  }
  return v5 != 0;
}

- (id)completelyMatchedAttributedStrings
{
  BOOL v3 = [(CNComposeRecipient *)self cachedMatchedStrings];

  if (!v3) {
    [(CNComposeRecipientGroup *)self _populateSortedChildren];
  }

  return [(CNComposeRecipient *)self cachedMatchedStrings];
}

- (id)childrenWithCompleteMatches
{
  BOOL v3 = [(CNComposeRecipient *)self cachedCompleteMatches];

  if (!v3) {
    [(CNComposeRecipientGroup *)self _populateSortedChildren];
  }

  return [(CNComposeRecipient *)self cachedCompleteMatches];
}

- (void)addRecipientToPasteboard:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(CNComposeRecipientGroup *)self children];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) addRecipientToPasteboard:v4];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void).cxx_destruct
{
}

@end