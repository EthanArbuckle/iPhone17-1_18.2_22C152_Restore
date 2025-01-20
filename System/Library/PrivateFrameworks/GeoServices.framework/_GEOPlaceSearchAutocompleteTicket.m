@interface _GEOPlaceSearchAutocompleteTicket
- (BOOL)autocompleteTopSectionIsQuerySuggestions;
- (BOOL)enableStructuredRAPAffordance;
- (BOOL)hasShouldDisplayNoResults;
- (BOOL)hasShouldEnableGrayscaleHighlighting;
- (BOOL)matchesFragment:(id)a3;
- (BOOL)shouldDisplayNoResults;
- (BOOL)shouldEnableGrayscaleHighlighting;
- (BOOL)shouldUseDistanceFeatureServerResults;
- (BOOL)showAutocompleteClientSource;
- (NSString)_searchQuery;
- (_GEOPlaceSearchAutocompleteTicket)initWithRequest:(id)a3 traits:(id)a4 searchQuery:(id)a5 sessionData:(id)a6;
- (double)retainSearchTime;
- (id)clientRankingModel;
- (id)geoMapItemIdentifierForSpotlight;
- (id)placeSummaryLayoutMetadata;
- (id)sortPriorityMapping;
- (int64_t)highlightType;
- (void)applyToSuggestionEntry:(id)a3 withAutocompleteSearchResultIdentifier:(id)a4;
- (void)applyToSuggestionList:(id)a3;
- (void)submitWithAutoCompletionHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5;
- (void)submitWithAutoCompletionHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _GEOPlaceSearchAutocompleteTicket

- (_GEOPlaceSearchAutocompleteTicket)initWithRequest:(id)a3 traits:(id)a4 searchQuery:(id)a5 sessionData:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_GEOPlaceSearchAutocompleteTicket;
  v12 = [(GEOAbstractRequestResponseTicket *)&v17 initWithRequest:a3 traits:a4];
  if (v12)
  {
    uint64_t v13 = [v10 copy];
    searchQuery = v12->_searchQuery;
    v12->_searchQuery = (NSString *)v13;

    objc_storeStrong((id *)&v12->_sessionData, a6);
    v15 = v12;
  }

  return v12;
}

- (void)submitWithAutoCompletionHandler:(id)a3 networkActivity:(id)a4
{
}

- (void)submitWithAutoCompletionHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __96___GEOPlaceSearchAutocompleteTicket_submitWithAutoCompletionHandler_auditToken_networkActivity___block_invoke;
  v10[3] = &unk_1E53DEA28;
  v10[4] = self;
  id v11 = v8;
  id v9 = v8;
  [(GEOAbstractRequestResponseTicket *)self performSubmitWithHandler:v10 auditToken:a4 timeout:a5 networkActivity:5.0];
}

- (BOOL)matchesFragment:(id)a3
{
  return [(NSString *)self->_searchQuery isEqualToString:a3];
}

- (void)applyToSuggestionList:(id)a3
{
  request = self->super._request;
  id v5 = a3;
  [v5 setAutocompleteRequest:request];
  [v5 setAutocompleteResponse:self->super._response];
}

- (void)applyToSuggestionEntry:(id)a3 withAutocompleteSearchResultIdentifier:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  v28 = self;
  id v8 = [(GEOPDPlaceResponse *)self->super._response globalResult];
  -[GEOPDPlaceGlobalResult autocompleteResult](v8);
  id v9 = (id *)objc_claimAutoreleasedReturnValue();
  id v10 = -[GEOPDAutocompleteResult sections](v9);

  uint64_t v32 = [v10 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v32)
  {
    v26 = v6;
    obuint64_t j = v10;
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v31 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v32; ++i)
      {
        if (*(void *)v39 != v31) {
          objc_enumerationMutation(obj);
        }
        v12 = *(id **)(*((void *)&v38 + 1) + 8 * i);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v13 = -[GEOPDAutocompleteResultSection entries](v12);
        uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          v33 = v12;
          uint64_t v16 = *(void *)v35;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v35 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v34 + 1) + 8 * j);
              v19 = [v18 business];
              uint64_t v20 = [v19 muid];
              uint64_t v21 = [v7 muid];

              if (v20 == v21)
              {
                v22 = [(GEOPDPlaceResponse *)v28->super._response globalResult];
                -[GEOPDPlaceGlobalResult autocompleteResult](v22);
                v23 = (id *)objc_claimAutoreleasedReturnValue();
                v24 = -[GEOPDAutocompleteResult sections](v23);
                uint64_t v30 = [v24 indexOfObject:v33];

                v25 = -[GEOPDAutocompleteResultSection entries](v33);
                uint64_t v29 = [v25 indexOfObject:v18];

                goto LABEL_16;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v42 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }
LABEL_16:
      }
      uint64_t v32 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v32);

    id v6 = v26;
    if (v30 != 0x7FFFFFFFFFFFFFFFLL && v29 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v26, "setServerSearchCompletionSectionIndex:");
      [v26 setServerSearchCompletionEntryIndex:v29];
    }
  }
  else
  {
  }
}

- (double)retainSearchTime
{
  int v3 = [(GEOPDPlaceResponse *)self->super._response requestType];
  if (v3 == 10)
  {
    id v5 = [(GEOPDPlaceResponse *)self->super._response globalResult];
    uint64_t v12 = -[GEOPDPlaceGlobalResult autocompleteResult](v5);
    id v7 = (void *)v12;
    double v4 = 0.0;
    if (!v12 || (*(unsigned char *)(v12 + 104) & 4) == 0) {
      goto LABEL_13;
    }
    id v8 = [(GEOPDPlaceResponse *)self->super._response globalResult];
    -[GEOPDPlaceGlobalResult autocompleteResult](v8);
    id v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v9) {
      goto LABEL_12;
    }
    id v11 = &OBJC_IVAR___GEOPDAutocompleteResult__retainSearchTime;
    goto LABEL_11;
  }
  double v4 = 0.0;
  if (v3 == 1)
  {
    id v5 = [(GEOPDPlaceResponse *)self->super._response globalResult];
    uint64_t v6 = -[GEOPDPlaceGlobalResult searchResult](v5);
    id v7 = (void *)v6;
    if (!v6 || (*(unsigned char *)(v6 + 248) & 4) == 0) {
      goto LABEL_13;
    }
    id v8 = [(GEOPDPlaceResponse *)self->super._response globalResult];
    -[GEOPDPlaceGlobalResult searchResult](v8);
    id v9 = (char *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_12:

LABEL_13:
      return v4;
    }
    id v11 = &OBJC_IVAR___GEOPDSearchResult__retainSearchTime;
LABEL_11:
    LODWORD(v10) = *(_DWORD *)&v9[*v11];
    double v4 = (double)v10;
    goto LABEL_12;
  }
  return v4;
}

- (BOOL)hasShouldDisplayNoResults
{
  if ([(GEOPDPlaceResponse *)self->super._response requestType] != 10) {
    return 0;
  }
  int v3 = [(GEOPDPlaceResponse *)self->super._response globalResult];
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  double v4 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    BOOL v5 = v4[105] & 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldDisplayNoResults
{
  if (![(_GEOPlaceSearchAutocompleteTicket *)self hasShouldDisplayNoResults]) {
    return 0;
  }
  int v3 = [(GEOPDPlaceResponse *)self->super._response globalResult];
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  double v4 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    BOOL v5 = v4[101] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasShouldEnableGrayscaleHighlighting
{
  if ([(GEOPDPlaceResponse *)self->super._response requestType] == 10)
  {
    int v3 = [(GEOPDPlaceResponse *)self->super._response globalResult];
    -[GEOPDPlaceGlobalResult autocompleteResult](v3);
    double v4 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    if (v4) {
      BOOL v5 = (v4[105] >> 1) & 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)shouldEnableGrayscaleHighlighting
{
  if (![(_GEOPlaceSearchAutocompleteTicket *)self hasShouldEnableGrayscaleHighlighting])return 0; {
  int v3 = [(GEOPDPlaceResponse *)self->super._response globalResult];
  }
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  double v4 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    BOOL v5 = v4[102] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)clientRankingModel
{
  v2 = [(GEOPDPlaceResponse *)self->super._response globalResult];
  -[GEOPDPlaceGlobalResult autocompleteResult](v2);
  int v3 = (id *)objc_claimAutoreleasedReturnValue();
  double v4 = -[GEOPDAutocompleteResult clientRankingFeatureMetadatas](v3);

  if (v4) {
    BOOL v5 = [[GEOClientRankingModel alloc] initWithGEOPDClientRankingFeatureMetadata:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)sortPriorityMapping
{
  v2 = [(GEOPDPlaceResponse *)self->super._response globalResult];
  -[GEOPDPlaceGlobalResult autocompleteResult](v2);
  int v3 = (id *)objc_claimAutoreleasedReturnValue();
  double v4 = -[GEOPDAutocompleteResult sortPriorityMappings](v3);

  if (v4) {
    BOOL v5 = [[GEOSortPriorityMapping alloc] initWithAutocompleteResultSortPriorityMapping:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)autocompleteTopSectionIsQuerySuggestions
{
  if ([(GEOPDPlaceResponse *)self->super._response requestType] != 10) {
    return 0;
  }
  int v3 = [(GEOPDPlaceResponse *)self->super._response globalResult];
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  double v4 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    BOOL v5 = v4[99] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)showAutocompleteClientSource
{
  if ([(GEOPDPlaceResponse *)self->super._response requestType] != 10) {
    return 0;
  }
  int v3 = [(GEOPDPlaceResponse *)self->super._response globalResult];
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  double v4 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    BOOL v5 = v4[100] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldUseDistanceFeatureServerResults
{
  if ([(GEOPDPlaceResponse *)self->super._response requestType] != 10) {
    return 0;
  }
  int v3 = [(GEOPDPlaceResponse *)self->super._response globalResult];
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  double v4 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    BOOL v5 = v4[103] != 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)placeSummaryLayoutMetadata
{
  if ([(GEOPDPlaceResponse *)self->super._response requestType] == 10)
  {
    int v3 = [(GEOPDPlaceResponse *)self->super._response globalResult];
    -[GEOPDPlaceGlobalResult autocompleteResult](v3);
    double v4 = (id *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = -[GEOPDAutocompleteResult placeSummaryLayoutMetadata](v4);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (int64_t)highlightType
{
  if ([(GEOPDPlaceResponse *)self->super._response requestType] != 10) {
    return 0;
  }
  int v3 = [(GEOPDPlaceResponse *)self->super._response globalResult];
  -[GEOPDPlaceGlobalResult autocompleteResult](v3);
  double v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  unsigned int v5 = -[GEOPDAutocompleteResult highlightType](v4);

  if (v5 == 2) {
    return 2;
  }
  else {
    return v5 == 1;
  }
}

- (BOOL)enableStructuredRAPAffordance
{
  v2 = [(GEOPDPlaceResponse *)self->super._response globalResult];
  -[GEOPDPlaceGlobalResult autocompleteResult](v2);
  int v3 = (unsigned char *)objc_claimAutoreleasedReturnValue();
  if (v3) {
    BOOL v4 = v3[97] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)geoMapItemIdentifierForSpotlight
{
  return 0;
}

- (NSString)_searchQuery
{
  return self->_searchQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionData, 0);

  objc_storeStrong((id *)&self->_searchQuery, 0);
}

@end