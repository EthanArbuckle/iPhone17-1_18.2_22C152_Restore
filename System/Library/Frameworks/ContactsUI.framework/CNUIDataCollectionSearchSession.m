@interface CNUIDataCollectionSearchSession
+ (id)currentSession;
+ (void)begin;
+ (void)end;
- (BOOL)pendingResults;
- (BOOL)pendingSuggestionsResults;
- (void)didFetchResultSuggested:(BOOL)a3;
- (void)didSelectResult:(id)a3;
- (void)searchStringDidChange;
- (void)setPendingResults:(BOOL)a3;
- (void)setPendingSuggestionsResults:(BOOL)a3;
@end

@implementation CNUIDataCollectionSearchSession

- (void)setPendingSuggestionsResults:(BOOL)a3
{
  self->_pendingSuggestionsResults = a3;
}

- (BOOL)pendingSuggestionsResults
{
  return self->_pendingSuggestionsResults;
}

- (void)setPendingResults:(BOOL)a3
{
  self->_pendingResults = a3;
}

- (BOOL)pendingResults
{
  return self->_pendingResults;
}

- (void)didSelectResult:(id)a3
{
  id v3 = a3;
  id v4 = +[CNUIDataCollector sharedCollector];
  [v4 logSearchResultSelected:v3];
}

- (void)didFetchResultSuggested:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CNUIDataCollectionSearchSession *)self pendingResults])
  {
    [(CNUIDataCollectionSearchSession *)self setPendingResults:0];
    v5 = +[CNUIDataCollector sharedCollector];
    [v5 logSearchResultsFetchedSuggested:0];
  }
  if (v3 && [(CNUIDataCollectionSearchSession *)self pendingSuggestionsResults])
  {
    [(CNUIDataCollectionSearchSession *)self setPendingSuggestionsResults:0];
    id v6 = +[CNUIDataCollector sharedCollector];
    [v6 logSearchResultsFetchedSuggested:1];
  }
}

- (void)searchStringDidChange
{
  [(CNUIDataCollectionSearchSession *)self setPendingResults:1];

  [(CNUIDataCollectionSearchSession *)self setPendingSuggestionsResults:1];
}

+ (id)currentSession
{
  return (id)s_currentInstance;
}

+ (void)end
{
  v2 = (void *)s_currentInstance;
  s_currentInstance = 0;
}

+ (void)begin
{
  if (!s_currentInstance)
  {
    v2 = objc_alloc_init(CNUIDataCollectionSearchSession);
    BOOL v3 = (void *)s_currentInstance;
    s_currentInstance = (uint64_t)v2;

    id v4 = +[CNUIDataCollector sharedCollector];
    [v4 logSearchUsage];
  }
}

@end