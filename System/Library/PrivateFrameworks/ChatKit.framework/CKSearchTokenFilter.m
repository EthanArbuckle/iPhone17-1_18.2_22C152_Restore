@interface CKSearchTokenFilter
+ (id)_conditionalForHandles:(id)a3 usingKey:(id)a4;
+ (id)conversationTokensFromTokenFilters:(id)a3;
+ (id)queryStringForMessageTypeSearch:(id)a3;
- (BOOL)hasFilterOption:(unint64_t)a3;
- (CKConversation)conversation;
- (CKSearchTokenFilter)initWithContentType:(unint64_t)a3 filterOptions:(unint64_t)a4 itemIdentifier:(id)a5 tokenAddresses:(id)a6;
- (CKSearchTokenFilter)initWithContentType:(unint64_t)a3 itemIdentifier:(id)a4;
- (NSArray)tokenAddresses;
- (NSString)itemIdentifier;
- (NSString)queryStringForConversationSearch;
- (NSString)queryStringForDateTypeSearch;
- (NSString)queryStringForMessageTypeSearch;
- (unint64_t)contentType;
- (unint64_t)filterOptions;
- (void)setContentType:(unint64_t)a3;
- (void)setConversation:(id)a3;
- (void)setFilterOptions:(unint64_t)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setQueryStringForConversationSearch:(id)a3;
- (void)setQueryStringForDateTypeSearch:(id)a3;
- (void)setQueryStringForMessageTypeSearch:(id)a3;
- (void)setTokenAddresses:(id)a3;
@end

@implementation CKSearchTokenFilter

- (CKSearchTokenFilter)initWithContentType:(unint64_t)a3 itemIdentifier:(id)a4
{
  return [(CKSearchTokenFilter *)self initWithContentType:a3 filterOptions:0 itemIdentifier:a4 tokenAddresses:MEMORY[0x1E4F1CBF0]];
}

- (CKSearchTokenFilter)initWithContentType:(unint64_t)a3 filterOptions:(unint64_t)a4 itemIdentifier:(id)a5 tokenAddresses:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)CKSearchTokenFilter;
  v12 = [(CKSearchTokenFilter *)&v15 init];
  v13 = v12;
  if (v12)
  {
    [(CKSearchTokenFilter *)v12 setContentType:a3];
    [(CKSearchTokenFilter *)v13 setFilterOptions:a4];
    [(CKSearchTokenFilter *)v13 setItemIdentifier:v10];
    [(CKSearchTokenFilter *)v13 setTokenAddresses:v11];
  }

  return v13;
}

- (BOOL)hasFilterOption:(unint64_t)a3
{
  return (a3 & ~[(CKSearchTokenFilter *)self filterOptions]) == 0;
}

- (NSString)queryStringForConversationSearch
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  queryStringForConversationSearch = self->_queryStringForConversationSearch;
  if (!queryStringForConversationSearch)
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [(CKSearchTokenFilter *)self itemIdentifier];
    v6 = [NSString stringWithFormat:@"%@ == \"%@\"", *MEMORY[0x1E4F22A10], v5];
    [v4 addObject:v6];

    if (![(CKSearchTokenFilter *)self hasFilterOption:2])
    {
      v17 = v5;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      v7 = [(CKSearchTokenFilter *)self tokenAddresses];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v19;
        uint64_t v11 = *MEMORY[0x1E4F23498];
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v19 != v10) {
              objc_enumerationMutation(v7);
            }
            v13 = [NSString stringWithFormat:@"%@ == \"*%@\"", v11, *(void *)(*((void *)&v18 + 1) + 8 * v12)];
            [v4 addObject:v13];

            ++v12;
          }
          while (v9 != v12);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v9);
      }

      v5 = v17;
    }
    v14 = +[CKSpotlightQueryUtilities queryStringFromSubqueries:v4 combineOperator:0];
    objc_super v15 = self->_queryStringForConversationSearch;
    self->_queryStringForConversationSearch = v14;

    queryStringForConversationSearch = self->_queryStringForConversationSearch;
  }

  return queryStringForConversationSearch;
}

+ (id)queryStringForMessageTypeSearch:(id)a3
{
  id v3 = a3;
  if ([v3 count] == 1)
  {
    v4 = [v3 firstObject];
    id v5 = [v4 queryStringForMessageTypeSearch];
  }
  else
  {
    v4 = objc_msgSend(v3, "__imArrayByFilteringWithBlock:", &__block_literal_global_276);
    v6 = [v3 arrayByExcludingObjectsInArray:v4];
    v7 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &__block_literal_global_256_3);
    uint64_t v8 = [MEMORY[0x1E4F6BD10] me];
    uint64_t v9 = [v8 cnContact];

    uint64_t v10 = +[CKSpotlightQueryUtilities tokenAddressesForFilteringWithContact:v9];
    if ([v10 count])
    {
      uint64_t v11 = [v7 arrayByAddingObject:v10];

      v7 = (void *)v11;
    }
    uint64_t v18 = 0;
    long long v19 = &v18;
    uint64_t v20 = 0x3032000000;
    long long v21 = __Block_byref_object_copy__79;
    v22 = __Block_byref_object_dispose__79;
    id v23 = 0;
    id v23 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_259;
    v15[3] = &unk_1E562CC20;
    v17 = &v18;
    id v12 = v7;
    id v16 = v12;
    [v12 enumerateObjectsUsingBlock:v15];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_3;
    v14[3] = &unk_1E562CC48;
    v14[4] = &v18;
    [v4 enumerateObjectsUsingBlock:v14];
    id v5 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }

  return v5;
}

uint64_t __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 conversation];
  uint64_t v3 = [v2 isGroupConversation];

  return v3;
}

uint64_t __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 tokenAddresses];
}

void __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_259(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@" || "];
  }
  v4 = +[CKSearchTokenFilter _conditionalForHandles:v3 usingKey:*MEMORY[0x1E4F22B00]];
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__79;
  long long v19 = __Block_byref_object_dispose__79;
  id v20 = 0;
  id v20 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v5 = *(void **)(a1 + 32);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_2_263;
  id v12 = &unk_1E562CBF8;
  id v6 = v3;
  id v13 = v6;
  v14 = &v15;
  [v5 enumerateObjectsUsingBlock:&v9];
  v7 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v8 = [NSString stringWithFormat:@"((%@) && (%@))", v4, v16[5], v9, v10, v11, v12];
  [v7 appendString:v8];

  _Block_object_dispose(&v15, 8);
}

void __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_2_263(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([v7 isEqualToArray:*(void *)(a1 + 32)] & 1) == 0)
  {
    if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) length]) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendString:@" && "];
    }
    id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v4 = NSString;
    id v5 = +[CKSearchTokenFilter _conditionalForHandles:v7 usingKey:*MEMORY[0x1E4F23498]];
    id v6 = [v4 stringWithFormat:@"(%@)", v5];
    [v3 appendString:v6];
  }
}

void __55__CKSearchTokenFilter_queryStringForMessageTypeSearch___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) length]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) appendString:@" || "];
  }
  id v3 = [v6 itemIdentifier];
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v5 = [NSString stringWithFormat:@"(%@ == \"%@\"", *MEMORY[0x1E4F22D28], v3, *MEMORY[0x1E4F22A10], v3];
  [v4 appendString:v5];
}

- (NSString)queryStringForMessageTypeSearch
{
  queryStringForMessageTypeSearch = self->_queryStringForMessageTypeSearch;
  if (!queryStringForMessageTypeSearch)
  {
    v4 = [(CKSearchTokenFilter *)self conversation];
    char v5 = [v4 isGroupConversation];

    if (v5)
    {
      id v6 = [(CKSearchTokenFilter *)self itemIdentifier];
      [NSString stringWithFormat:@"(%@ == \"%@\"", *MEMORY[0x1E4F22D28], v6, *MEMORY[0x1E4F22A10], v6];
      id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = self->_queryStringForMessageTypeSearch;
      self->_queryStringForMessageTypeSearch = v7;
      uint64_t v9 = v7;

      uint64_t v10 = self->_queryStringForMessageTypeSearch;
      goto LABEL_12;
    }
    BOOL v11 = [(CKSearchTokenFilter *)self hasFilterOption:2];
    id v12 = [(CKSearchTokenFilter *)self tokenAddresses];
    id v13 = +[CKSearchTokenFilter _conditionalForHandles:v12 usingKey:*MEMORY[0x1E4F22B00]];

    if (v11)
    {
      v14 = [NSString stringWithFormat:@"%@ == \"%@\"", *MEMORY[0x1E4F23088], MEMORY[0x1E4F1CC28]];
      uint64_t v15 = [NSString stringWithFormat:@"(%@) && (%@)", v13, v14];
    }
    else
    {
      id v16 = [MEMORY[0x1E4F6BD10] me];
      uint64_t v17 = [v16 cnContact];

      v29 = (void *)v17;
      v28 = +[CKSpotlightQueryUtilities tokenAddressesForFilteringWithContact:v17];
      uint64_t v18 = +[CKSearchTokenFilter _conditionalForHandles:usingKey:](CKSearchTokenFilter, "_conditionalForHandles:usingKey:");
      long long v19 = [(CKSearchTokenFilter *)self tokenAddresses];
      id v20 = +[CKSearchTokenFilter _conditionalForHandles:v19 usingKey:*MEMORY[0x1E4F23498]];

      long long v21 = [NSString stringWithFormat:@"%@ == \"%@\"", *MEMORY[0x1E4F23088], MEMORY[0x1E4F1CC28]];
      if (v18) {
        [NSString stringWithFormat:@"(%@) && (%@) && (%@)", v18, v20, v21];
      }
      else {
      uint64_t v22 = [NSString stringWithFormat:@"(%@) && (%@)", v20, v21, v27];
      }
      id v23 = [(CKSearchTokenFilter *)self tokenAddresses];
      v24 = +[CKSearchTokenFilter _conditionalForHandles:v23 usingKey:@"com_apple_mobilesms_mentionedAddresses"];

      uint64_t v15 = [NSString stringWithFormat:@"(%@) || (%@) || (%@)", v13, v22, v24];

      v14 = v13;
      id v13 = (void *)v22;
    }

    v25 = self->_queryStringForMessageTypeSearch;
    self->_queryStringForMessageTypeSearch = v15;

    queryStringForMessageTypeSearch = self->_queryStringForMessageTypeSearch;
  }
  uint64_t v10 = queryStringForMessageTypeSearch;
LABEL_12:

  return v10;
}

- (NSString)queryStringForDateTypeSearch
{
  queryStringForDateTypeSearch = self->_queryStringForDateTypeSearch;
  if (!queryStringForDateTypeSearch)
  {
    v4 = self->_tokenAddresses;
    char v5 = +[CKTokenizationDateParser serializationDateFormatter];
    id v6 = [(NSArray *)v4 objectAtIndexedSubscript:0];
    id v7 = [v5 dateFromString:v6];

    uint64_t v8 = +[CKTokenizationDateParser serializationDateFormatter];
    uint64_t v9 = [(NSArray *)v4 objectAtIndexedSubscript:1];
    uint64_t v10 = [v8 dateFromString:v9];

    [v7 timeIntervalSinceReferenceDate];
    uint64_t v12 = v11;
    [v10 timeIntervalSinceReferenceDate];
    unint64_t filterOptions = self->_filterOptions;
    if ((filterOptions & 4) != 0)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"kMDItemContentCreationDate > %f", v13, v18);
    }
    else if ((filterOptions & 8) != 0)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"kMDItemContentCreationDate < %f", v12, v18);
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(kMDItemContentCreationDate >= %f) && (kMDItemContentCreationDate <= %f)", v12, v13);
    }
    uint64_t v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    id v16 = self->_queryStringForDateTypeSearch;
    self->_queryStringForDateTypeSearch = v15;

    queryStringForDateTypeSearch = self->_queryStringForDateTypeSearch;
  }

  return queryStringForDateTypeSearch;
}

+ (id)_conditionalForHandles:(id)a3 usingKey:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [NSString stringWithFormat:@"%@ == \"*%@\"", v6, *(void *)(*((void *)&v16 + 1) + 8 * i), (void)v16];
        [v7 addObject:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = +[CKSpotlightQueryUtilities queryStringFromSubqueries:v7 combineOperator:0];

  return v14;
}

+ (id)conversationTokensFromTokenFilters:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if (!objc_msgSend(v10, "contentType", (void)v13)) {
            [v4 addObject:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    id v11 = (id)[v4 copy];
  }
  else
  {
    id v11 = v3;
  }

  return v11;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (NSString)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSArray)tokenAddresses
{
  return self->_tokenAddresses;
}

- (void)setTokenAddresses:(id)a3
{
}

- (CKConversation)conversation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_conversation);

  return (CKConversation *)WeakRetained;
}

- (void)setConversation:(id)a3
{
}

- (unint64_t)filterOptions
{
  return self->_filterOptions;
}

- (void)setFilterOptions:(unint64_t)a3
{
  self->_unint64_t filterOptions = a3;
}

- (void)setQueryStringForConversationSearch:(id)a3
{
}

- (void)setQueryStringForDateTypeSearch:(id)a3
{
}

- (void)setQueryStringForMessageTypeSearch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryStringForMessageTypeSearch, 0);
  objc_storeStrong((id *)&self->_queryStringForDateTypeSearch, 0);
  objc_storeStrong((id *)&self->_queryStringForConversationSearch, 0);
  objc_destroyWeak((id *)&self->_conversation);
  objc_storeStrong((id *)&self->_tokenAddresses, 0);

  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end