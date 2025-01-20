@interface GEOPlaceSearchCategoryTicket
@end

@implementation GEOPlaceSearchCategoryTicket

void __78___GEOPlaceSearchCategoryTicket_submitWithHandler_auditToken_networkActivity___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_19;
  }
  if ([*(id *)(*(void *)(a1 + 32) + 40) requestType] == 11)
  {
    v6 = [v5 globalResult];
    -[GEOPDPlaceGlobalResult browseCategorySuggestionResult](v6);
    v7 = (id *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = -[GEOPDSearchBrowseCategorySuggestionResult categorys](v7);
  }
  else
  {
    if ([*(id *)(*(void *)(a1 + 32) + 40) requestType] != 14)
    {
      v10 = 0;
      goto LABEL_9;
    }
    v9 = [v5 globalResult];
    -[GEOPDPlaceGlobalResult searchZeroKeywordCategorySuggestionResult](v9);
    v7 = (id *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = -[GEOPDSearchZeroKeywordCategorySuggestionResult categorys](v7);
  }
  v10 = (void *)v8;

LABEL_9:
  v11 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * v16);
        v18 = [GEOSearchCategory alloc];
        v19 = -[GEOSearchCategory initWithBrowseCategory:](v18, "initWithBrowseCategory:", v17, (void)v20);
        if (v19) {
          [v11 addObject:v19];
        }

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_19:
}

@end