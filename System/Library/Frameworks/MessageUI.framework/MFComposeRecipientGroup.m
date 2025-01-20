@interface MFComposeRecipientGroup
- (BOOL)isEqual:(id)a3;
- (BOOL)isGroup;
- (BOOL)isRemovableFromSearchResults;
- (BOOL)wasCompleteMatch;
- (MFComposeRecipientGroup)initWithChildren:(id)a3 displayString:(id)a4;
- (id)address;
- (id)children;
- (id)childrenWithCompleteMatches;
- (id)commentedAddress;
- (id)completelyMatchedAttributedStrings;
- (id)compositeName;
- (id)displayString;
- (id)label;
- (id)placeholderName;
- (id)sortedChildren;
- (int)property;
- (int)recordID;
- (void)_populateSortedChildren;
- (void)children;
- (void)record;
@end

@implementation MFComposeRecipientGroup

- (MFComposeRecipientGroup)initWithChildren:(id)a3 displayString:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFComposeRecipientGroup;
  v9 = [(MFComposeRecipient *)&v13 initWithContact:0 address:0 kind:5];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_children, a3);
    objc_storeStrong((id *)&v10->super._displayString, a4);
    v11 = v10;
  }

  return v10;
}

- (id)displayString
{
  return self->super._displayString;
}

- (id)label
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"GROUP_RECIPIENT" value:&stru_1F0817A00 table:@"Main"];

  return v3;
}

- (id)compositeName
{
  return self->super._displayString;
}

- (id)placeholderName
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"GROUP_RECIPIENT_PLACEHOLDER" value:&stru_1F0817A00 table:@"Main"];

  return v3;
}

- (id)children
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(NSArray *)self->_children count])
  {
    autocompleteResult = self->super._autocompleteResult;
    if (autocompleteResult)
    {
      id v21 = 0;
      v4 = [(CNAutocompleteResult *)autocompleteResult members:&v21];
      id v16 = v21;
      if (v16)
      {
        v5 = MFLogGeneral();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          v6 = objc_msgSend(v16, "ef_publicDescription");
          [(MFComposeRecipientGroup *)v6 children];
        }
      }
      if (v4)
      {
        objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
        id v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
        long long v19 = 0u;
        long long v20 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v8 = v4;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
        if (v9)
        {
          uint64_t v10 = *(void *)v18;
          do
          {
            uint64_t v11 = 0;
            do
            {
              if (*(void *)v18 != v10) {
                objc_enumerationMutation(v8);
              }
              v12 = +[MFComposeRecipient composeRecipientWithAutocompleteResult:*(void *)(*((void *)&v17 + 1) + 8 * v11)];
              if (v12) {
                [(NSArray *)v7 addObject:v12];
              }

              ++v11;
            }
            while (v9 != v11);
            uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v22 count:16];
          }
          while (v9);
        }

        children = self->_children;
        self->_children = v7;
      }
    }
  }
  v14 = self->_children;

  return v14;
}

- (void)_populateSortedChildren
{
  if (!self->super._cachedSortedMembers)
  {
    v3 = [(MFComposeRecipient *)self originContext];
    id v13 = [v3 searchTerm];

    v4 = [(MFComposeRecipientGroup *)self children];
    id v14 = 0;
    id v15 = 0;
    _sortedArrayByRelevancy(v13, v4, &v15, &v14);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = (NSArray *)v15;
    id v7 = (NSArray *)v14;

    cachedSortedMembers = self->super._cachedSortedMembers;
    self->super._cachedSortedMembers = v5;
    uint64_t v9 = v5;

    cachedMatchedStrings = self->super._cachedMatchedStrings;
    self->super._cachedMatchedStrings = v7;
    uint64_t v11 = v7;

    cachedCompleteMatches = self->super._cachedCompleteMatches;
    self->super._cachedCompleteMatches = v6;
  }
}

- (id)sortedChildren
{
  cachedSortedMembers = self->super._cachedSortedMembers;
  if (!cachedSortedMembers)
  {
    [(MFComposeRecipientGroup *)self _populateSortedChildren];
    cachedSortedMembers = self->super._cachedSortedMembers;
  }

  return cachedSortedMembers;
}

- (BOOL)isGroup
{
  return 1;
}

- (BOOL)isRemovableFromSearchResults
{
  return 1;
}

- (int)property
{
  return -1;
}

- (void)record
{
  return 0;
}

- (int)recordID
{
  return -1;
}

- (id)address
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v4 = [(MFComposeRecipientGroup *)self children];
  v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = [(MFComposeRecipientGroup *)self children];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) address];
        if (v10) {
          [v5 addObject:v10];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v11 = MFLocalizedAddressSeparator();
  v12 = [v5 componentsJoinedByString:v11];

  return v12;
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
    v5 = [v4 children];
    v6 = [(MFComposeRecipientGroup *)self children];
    char v7 = [v5 isEqualToArray:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)wasCompleteMatch
{
  cachedCompleteMatches = self->super._cachedCompleteMatches;
  if (cachedCompleteMatches)
  {
    uint64_t v4 = [(NSArray *)cachedCompleteMatches count];
  }
  else
  {
    v5 = [(MFComposeRecipient *)self originContext];
    v6 = [v5 searchTerm];
    char v7 = [(MFComposeRecipientGroup *)self children];
    uint64_t v9 = 0;
    uint64_t v4 = _fastCountOfCompleteMatches(v6, v7, &v9);
  }
  return v4 != 0;
}

- (id)completelyMatchedAttributedStrings
{
  cachedMatchedStrings = self->super._cachedMatchedStrings;
  if (!cachedMatchedStrings)
  {
    [(MFComposeRecipientGroup *)self _populateSortedChildren];
    cachedMatchedStrings = self->super._cachedMatchedStrings;
  }

  return cachedMatchedStrings;
}

- (id)childrenWithCompleteMatches
{
  cachedCompleteMatches = self->super._cachedCompleteMatches;
  if (!cachedCompleteMatches)
  {
    [(MFComposeRecipientGroup *)self _populateSortedChildren];
    cachedCompleteMatches = self->super._cachedCompleteMatches;
  }

  return cachedCompleteMatches;
}

- (void).cxx_destruct
{
}

- (void)children
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1AF945000, log, OS_LOG_TYPE_ERROR, "Error fetching members for contact of type CNAutocompleteResultTypeGroup: %{public}@", buf, 0xCu);
}

@end