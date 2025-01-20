@interface SLSheetPlaceSearchController
- (NSArray)searchResults;
- (SLPlaceDataSource)placeDataSource;
- (SLSheetPlaceSearchController)initWithPlaceDataSource:(id)a3 searchDisplayController:(id)a4;
- (UISearchDisplayController)searchDisplayController;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelSearch;
- (void)performDelayedFetch:(id)a3;
- (void)placeManager:(id)a3 failedWithError:(id)a4;
- (void)placeManager:(id)a3 updatedPlaces:(id)a4;
- (void)searchWithSearchString:(id)a3;
- (void)setPlaceDataSource:(id)a3;
- (void)setSearchDisplayController:(id)a3;
- (void)setSearchResults:(id)a3;
@end

@implementation SLSheetPlaceSearchController

- (SLSheetPlaceSearchController)initWithPlaceDataSource:(id)a3 searchDisplayController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SLSheetPlaceSearchController;
  v9 = [(SLSheetPlaceSearchController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeDataSource, a3);
    [(SLPlaceDataSource *)v10->_placeDataSource setDelegate:v10];
    objc_storeStrong((id *)&v10->_searchDisplayController, a4);
  }

  return v10;
}

- (void)searchWithSearchString:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  _SLLog(v3, 6, @"Cancel previous fetch");
  [(SLSheetPlaceSearchController *)self cancelSearch];
  objc_super v12 = [(SLSheetPlaceSearchController *)self placeDataSource];
  _SLLog(v3, 6, @"Initate new place search on %@ with search string %@");

  objc_msgSend(MEMORY[0x1E4F42738], "shouldShowNetworkActivityIndicatorInRemoteApplication:", 1, v12, v6);
  self->_isSearching = 1;
  objc_storeStrong((id *)&self->_searchString, a3);
  self->_retryCount = 0;
  if ([v6 length])
  {
    [(UISearchDisplayController *)self->_searchDisplayController setNoResultsMessage:&stru_1F1E28690];
    delayTimer = self->_delayTimer;
    if (delayTimer) {
      [(NSTimer *)delayTimer invalidate];
    }
    _SLLog(v3, 6, @"Scheduling delayed place fetch");
    id v8 = (void *)MEMORY[0x1E4F1CB00];
    v13 = @"searchString";
    v14[0] = v6;
    v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    v10 = [v8 scheduledTimerWithTimeInterval:self target:sel_performDelayedFetch_ selector:v9 userInfo:0 repeats:0.5];
    v11 = self->_delayTimer;
    self->_delayTimer = v10;
  }
  else
  {
    [(SLSheetPlaceSearchController *)self placeManager:0 updatedPlaces:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)cancelSearch
{
  if (self->_isSearching)
  {
    delayTimer = self->_delayTimer;
    if (delayTimer) {
      [(NSTimer *)delayTimer invalidate];
    }
    [MEMORY[0x1E4F42738] shouldShowNetworkActivityIndicatorInRemoteApplication:0];
    v4 = [(SLSheetPlaceSearchController *)self placeDataSource];
    [v4 cancelPlaceFetch];

    self->_isSearching = 0;
  }
}

- (void)performDelayedFetch:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 6, @"Performing delayed place fetch");
  id v8 = [v5 userInfo];

  id v6 = [(SLSheetPlaceSearchController *)self placeDataSource];
  id v7 = [v8 objectForKeyedSubscript:@"searchString"];
  [v6 fetchPlacesWithSearchString:v7];
}

- (void)placeManager:(id)a3 updatedPlaces:(id)a4
{
  self->_isSearching = 0;
  id v6 = a4;
  _SLLog(v4, 6, @"Place manager updated places for search controller %@");
  -[SLSheetPlaceSearchController setSearchResults:](self, "setSearchResults:", v6, v6);

  id v7 = [(UISearchDisplayController *)self->_searchDisplayController searchResultsTableView];
  [v7 reloadData];

  id v8 = SLSocialFrameworkBundle();
  v9 = [v8 localizedStringForKey:@"FB_PLACE_SEARCH_NO_RESULTS" value:&stru_1F1E28690 table:@"Localizable"];
  [(UISearchDisplayController *)self->_searchDisplayController setNoResultsMessage:v9];

  v10 = (void *)MEMORY[0x1E4F42738];

  [v10 shouldShowNetworkActivityIndicatorInRemoteApplication:0];
}

- (void)placeManager:(id)a3 failedWithError:(id)a4
{
  id v6 = a4;
  id v12 = v6;
  if (self->_isSearching && self->_retryCount <= 2 && self->_searchString)
  {
    _SLLog(v4, 6, @"Retrycount is %i, retrying place fetch");
    ++self->_retryCount;
    id v7 = [(SLSheetPlaceSearchController *)self placeDataSource];
    [v7 fetchPlacesWithSearchString:self->_searchString];
  }
  else
  {
    self->_retryCount = 0;
    self->_isSearching = 0;
    id v11 = v6;
    _SLLog(v4, 3, @"Failed place search with error %{public}@");
    -[SLSheetPlaceSearchController setSearchResults:](self, "setSearchResults:", MEMORY[0x1E4F1CBF0], v11);
    id v8 = [(UISearchDisplayController *)self->_searchDisplayController searchResultsTableView];
    [v8 reloadData];

    v9 = SLSocialFrameworkBundle();
    v10 = [v9 localizedStringForKey:@"FB_PLACE_SEARCH_SEARCH_FAILED" value:&stru_1F1E28690 table:@"Localizable"];
    [(UISearchDisplayController *)self->_searchDisplayController setNoResultsMessage:v10];

    [MEMORY[0x1E4F42738] shouldShowNetworkActivityIndicatorInRemoteApplication:0];
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v4 = [(SLSheetPlaceSearchController *)self searchResults];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v4 = objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", @"SLFacebookPlaceCell", a4);
  if (!v4) {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:3 reuseIdentifier:@"SLFacebookPlaceCell"];
  }
  [v4 setAccessoryType:0];

  return v4;
}

- (SLPlaceDataSource)placeDataSource
{
  return (SLPlaceDataSource *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPlaceDataSource:(id)a3
{
}

- (UISearchDisplayController)searchDisplayController
{
  return (UISearchDisplayController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSearchDisplayController:(id)a3
{
}

- (NSArray)searchResults
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSearchResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_searchDisplayController, 0);
  objc_storeStrong((id *)&self->_placeDataSource, 0);
  objc_storeStrong((id *)&self->_retryLock, 0);
  objc_storeStrong((id *)&self->_searchString, 0);

  objc_storeStrong((id *)&self->_delayTimer, 0);
}

@end