@interface GEOAbstractMapServiceTicket
- ($C4D369C9F02205611300857CFD58F739)dataRequestKind;
- (BOOL)disableAdditionalViewportPadding;
- (BOOL)enableStructuredRAPAffordance;
- (BOOL)isChainResultSet;
- (BOOL)shouldAllowManualRedoSearch;
- (BOOL)shouldEnableRedoSearch;
- (BOOL)showDymSuggestionCloseButton;
- (GEOCategorySearchResultSection)categorySearchResultSection;
- (GEODirectionIntent)directionIntent;
- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata;
- (GEOMapItemIdentifier)geoMapItemIdentifierForSpotlight;
- (GEOMapRegion)resultBoundingRegion;
- (GEOPDMerchantLookupResult)merchantLookupResult;
- (GEOPDPlaceSummaryLayoutMetadata)placeSummaryLayoutMetadata;
- (GEORelatedSearchSuggestion)defaultRelatedSuggestion;
- (GEOResolvedItem)clientResolvedResult;
- (GEOResultRefinementGroup)resultRefinementGroup;
- (GEOSearchAutoRedoThreshold)searchAutoRedoThreshold;
- (GEOSearchRedoButtonThreshold)searchRedoButtonThreshold;
- (GEOSearchSectionList)searchSectionList;
- (GEOSearchSessionData)searchSessionData;
- (NSArray)browseCategories;
- (NSArray)collectionResults;
- (NSArray)displayHeaderSubstitutes;
- (NSArray)dotPlaces;
- (NSArray)publisherResults;
- (NSArray)relatedEntitySections;
- (NSArray)relatedSearchSuggestions;
- (NSArray)retainedSearchMetadata;
- (NSArray)searchResultSections;
- (NSString)resultDisplayHeader;
- (NSString)resultSectionHeader;
- (int)mapDisplayType;
- (int)searchResultType;
- (int)searchResultViewType;
- (unsigned)dymSuggestionVisibleTime;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6 queue:(id)a7;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4;
- (void)submitWithHandler:(id)a3 networkActivity:(id)a4 queue:(id)a5;
- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5;
- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5 queue:(id)a6;
- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6;
- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6 queue:(id)a7;
- (void)submitWithRefinedHandler:(id)a3 networkActivity:(id)a4;
- (void)submitWithRefinedHandler:(id)a3 networkActivity:(id)a4 queue:(id)a5;
- (void)submitWithRefinedHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5;
- (void)submitWithRefinedHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5 queue:(id)a6;
@end

@implementation GEOAbstractMapServiceTicket

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
}

- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5
{
}

void __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (void *)a1[6];
  if (v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_2;
    v9[3] = &unk_1E53DE528;
    v8 = a1[4];
    v9[4] = a1[5];
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, v9);
  }
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4 queue:(id)a5
{
}

- (void)submitWithHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5 queue:(id)a6
{
}

uint64_t __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
    return v3();
  }
  return result;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (![(GEOAbstractTicket *)self isCancelled])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke;
    v20[3] = &unk_1E53DE550;
    id v23 = v12;
    id v21 = v15;
    v22 = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_3;
    v16[3] = &unk_1E53DE5A0;
    id v19 = v14;
    id v17 = v21;
    v18 = self;
    [(GEOAbstractMapServiceTicket *)self submitWithHandler:v20 auditToken:v13 timeout:a5 networkActivity:v16];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSessionData, 0);
  objc_storeStrong((id *)&self->_geoMapItemIdentifierForSpotlight, 0);
  objc_storeStrong((id *)&self->_searchSectionList, 0);
  objc_storeStrong((id *)&self->_resultRefinementGroup, 0);
  objc_storeStrong((id *)&self->_guideSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_placeSummaryLayoutMetadata, 0);
  objc_storeStrong((id *)&self->_searchRedoButtonThreshold, 0);
  objc_storeStrong((id *)&self->_searchAutoRedoThreshold, 0);
  objc_storeStrong((id *)&self->_dotPlaces, 0);
  objc_storeStrong((id *)&self->_publisherResults, 0);
  objc_storeStrong((id *)&self->_collectionResults, 0);
  objc_storeStrong((id *)&self->_relatedEntitySections, 0);
  objc_storeStrong((id *)&self->_categorySearchResultSection, 0);
  objc_storeStrong((id *)&self->_merchantLookupResult, 0);
  objc_storeStrong((id *)&self->_searchResultSections, 0);
  objc_storeStrong((id *)&self->_retainedSearchMetadata, 0);
  objc_storeStrong((id *)&self->_directionIntent, 0);
  objc_storeStrong((id *)&self->_clientResolvedResult, 0);
  objc_storeStrong((id *)&self->_displayHeaderSubstitutes, 0);
  objc_storeStrong((id *)&self->_resultDisplayHeader, 0);
  objc_storeStrong((id *)&self->_resultSectionHeader, 0);
  objc_storeStrong((id *)&self->_defaultRelatedSuggestion, 0);
  objc_storeStrong((id *)&self->_browseCategories, 0);
  objc_storeStrong((id *)&self->_relatedSearchSuggestions, 0);

  objc_storeStrong((id *)&self->_resultBoundingRegion, 0);
}

- (GEOMapRegion)resultBoundingRegion
{
  return self->_resultBoundingRegion;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = NSStringFromSelector(a2);
  [v7 raise:v8, @"-[%@ %@] not implemented", v11, v10 format];
}

void __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_3(void *a1, char a2)
{
  v2 = (void *)a1[6];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_4;
    block[3] = &unk_1E53DE578;
    v4 = a1[4];
    block[4] = a1[5];
    id v6 = v2;
    char v7 = a2;
    dispatch_async(v4, block);
  }
}

uint64_t __90__GEOAbstractMapServiceTicket_submitWithHandler_auditToken_timeout_networkActivity_queue___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- (void)submitWithRefinedHandler:(id)a3 networkActivity:(id)a4
{
}

- (void)submitWithRefinedHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5
{
}

- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  char v7 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v8 = *MEMORY[0x1E4F1C3B8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = NSStringFromSelector(a2);
  [v7 raise:v8, @"-[%@ %@] not implemented", v11, v10 format];
}

- (void)submitWithRefinedHandler:(id)a3 networkActivity:(id)a4 queue:(id)a5
{
}

- (void)submitWithRefinedHandler:(id)a3 timeout:(int64_t)a4 networkActivity:(id)a5 queue:(id)a6
{
}

- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6 queue:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (![(GEOAbstractTicket *)self isCancelled])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke;
    v20[3] = &unk_1E53DE5F0;
    id v23 = v12;
    id v21 = v15;
    v22 = self;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_3;
    v16[3] = &unk_1E53DE5A0;
    id v19 = v14;
    id v17 = v21;
    v18 = self;
    [(GEOAbstractMapServiceTicket *)self submitWithRefinedHandler:v20 auditToken:v13 timeout:a5 networkActivity:v16];
  }
}

void __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)a1[6];
  if (v10)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_2;
    block[3] = &unk_1E53DE5C8;
    id v11 = a1[4];
    block[4] = a1[5];
    id v16 = v10;
    id v13 = v7;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(v11, block);
  }
}

uint64_t __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
    return v3();
  }
  return result;
}

void __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_3(void *a1, char a2)
{
  v2 = (void *)a1[6];
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_4;
    block[3] = &unk_1E53DE578;
    v4 = a1[4];
    block[4] = a1[5];
    id v6 = v2;
    char v7 = a2;
    dispatch_async(v4, block);
  }
}

uint64_t __97__GEOAbstractMapServiceTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity_queue___block_invoke_4(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isCancelled];
  if ((result & 1) == 0)
  {
    v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  return ($C4D369C9F02205611300857CFD58F739)0;
}

- (GEOResolvedItem)clientResolvedResult
{
  return self->_clientResolvedResult;
}

- (GEODirectionIntent)directionIntent
{
  return self->_directionIntent;
}

- (NSArray)retainedSearchMetadata
{
  return self->_retainedSearchMetadata;
}

- (BOOL)isChainResultSet
{
  return self->_chainResultSet;
}

- (NSArray)relatedSearchSuggestions
{
  return self->_relatedSearchSuggestions;
}

- (NSArray)browseCategories
{
  return self->_browseCategories;
}

- (GEORelatedSearchSuggestion)defaultRelatedSuggestion
{
  return self->_defaultRelatedSuggestion;
}

- (NSString)resultSectionHeader
{
  return self->_resultSectionHeader;
}

- (int)searchResultType
{
  return self->_searchResultType;
}

- (NSString)resultDisplayHeader
{
  return self->_resultDisplayHeader;
}

- (NSArray)displayHeaderSubstitutes
{
  return self->_displayHeaderSubstitutes;
}

- (BOOL)shouldEnableRedoSearch
{
  return self->_shouldEnableRedoSearch;
}

- (BOOL)shouldAllowManualRedoSearch
{
  return self->_shouldAllowManualRedoSearch;
}

- (unsigned)dymSuggestionVisibleTime
{
  return self->_dymSuggestionVisibleTime;
}

- (BOOL)showDymSuggestionCloseButton
{
  return self->_showDymSuggestionCloseButton;
}

- (NSArray)searchResultSections
{
  return self->_searchResultSections;
}

- (GEOPDMerchantLookupResult)merchantLookupResult
{
  return self->_merchantLookupResult;
}

- (GEOCategorySearchResultSection)categorySearchResultSection
{
  return self->_categorySearchResultSection;
}

- (NSArray)relatedEntitySections
{
  return self->_relatedEntitySections;
}

- (NSArray)collectionResults
{
  return self->_collectionResults;
}

- (NSArray)publisherResults
{
  return self->_publisherResults;
}

- (NSArray)dotPlaces
{
  return self->_dotPlaces;
}

- (GEOSearchAutoRedoThreshold)searchAutoRedoThreshold
{
  return self->_searchAutoRedoThreshold;
}

- (GEOSearchRedoButtonThreshold)searchRedoButtonThreshold
{
  return self->_searchRedoButtonThreshold;
}

- (GEOPDPlaceSummaryLayoutMetadata)placeSummaryLayoutMetadata
{
  return self->_placeSummaryLayoutMetadata;
}

- (GEOResultRefinementGroup)resultRefinementGroup
{
  return self->_resultRefinementGroup;
}

- (GEOSearchSectionList)searchSectionList
{
  return self->_searchSectionList;
}

- (BOOL)disableAdditionalViewportPadding
{
  return self->_disableAdditionalViewportPadding;
}

- (int)searchResultViewType
{
  return self->_searchResultViewType;
}

- (BOOL)enableStructuredRAPAffordance
{
  return self->_enableStructuredRAPAffordance;
}

- (GEOMapItemIdentifier)geoMapItemIdentifierForSpotlight
{
  return self->_geoMapItemIdentifierForSpotlight;
}

- (GEOSearchSessionData)searchSessionData
{
  return self->_searchSessionData;
}

- (int)mapDisplayType
{
  return self->_mapDisplayType;
}

- (GEOGuideSummaryLayoutMetadata)guideSummaryLayoutMetadata
{
  return self->_guideSummaryLayoutMetadata;
}

@end