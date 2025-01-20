@interface _GEOFailedCompletionTicket
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
- (_GEOFailedCompletionTicket)initWithError:(id)a3 searchQuery:(id)a4 traits:(id)a5;
- (double)retainSearchTime;
- (id)clientRankingModel;
- (id)guideSummaryLayoutMetadata;
- (id)placeSummaryLayoutMetadata;
- (id)sortPriorityMapping;
- (int64_t)highlightType;
- (void)submitWithAutoCompletionHandler:(id)a3 networkActivity:(id)a4;
@end

@implementation _GEOFailedCompletionTicket

- (_GEOFailedCompletionTicket)initWithError:(id)a3 searchQuery:(id)a4 traits:(id)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GEOFailedCompletionTicket;
  v9 = [(_GEOFailedTicket *)&v14 initWithError:a3 traits:a5];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    searchQuery = v9->_searchQuery;
    v9->_searchQuery = (NSString *)v10;

    v12 = v9;
  }

  return v9;
}

- (BOOL)matchesFragment:(id)a3
{
  return [(NSString *)self->_searchQuery isEqualToString:a3];
}

- (double)retainSearchTime
{
  return 0.0;
}

- (BOOL)hasShouldDisplayNoResults
{
  return 0;
}

- (BOOL)shouldDisplayNoResults
{
  return 0;
}

- (BOOL)hasShouldEnableGrayscaleHighlighting
{
  return 0;
}

- (BOOL)shouldEnableGrayscaleHighlighting
{
  return 0;
}

- (id)clientRankingModel
{
  return 0;
}

- (id)sortPriorityMapping
{
  return 0;
}

- (BOOL)autocompleteTopSectionIsQuerySuggestions
{
  return 0;
}

- (BOOL)showAutocompleteClientSource
{
  return 0;
}

- (BOOL)shouldUseDistanceFeatureServerResults
{
  return 0;
}

- (id)placeSummaryLayoutMetadata
{
  return 0;
}

- (id)guideSummaryLayoutMetadata
{
  return 0;
}

- (int64_t)highlightType
{
  return 0;
}

- (BOOL)enableStructuredRAPAffordance
{
  return 0;
}

- (void)submitWithAutoCompletionHandler:(id)a3 networkActivity:(id)a4
{
  id v4 = a3;
  if (v4)
  {
    qos_class_self();
    id v5 = v4;
    geo_dispatch_async_qos();
  }
}

- (NSString)_searchQuery
{
  return self->_searchQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQuery, 0);

  objc_storeStrong((id *)&self->searchQuery, 0);
}

@end