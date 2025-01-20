@interface MFRemoteSearchProvider_iOS
- (MFMailMessageLibraryQueryTransformer)transformer;
- (MFRemoteSearchProvider_iOS)initWithMessagePersistence:(id)a3;
- (SearchManager)searchManager;
- (id)fetchRemoteMessagesWithQuery:(id)a3 delegate:(id)a4 useLocalIndex:(BOOL)a5;
- (id)verifyResults:(id)a3 query:(id)a4;
- (unint64_t)searchSessionID;
@end

@implementation MFRemoteSearchProvider_iOS

- (MFRemoteSearchProvider_iOS)initWithMessagePersistence:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFRemoteSearchProvider_iOS;
  v5 = [(MFRemoteSearchProvider_iOS *)&v11 init];
  if (v5)
  {
    v6 = (MFMailMessageLibraryQueryTransformer *)[objc_alloc((Class)MFMailMessageLibraryQueryTransformer) initWithMessagePersistence:v4];
    transformer = v5->_transformer;
    v5->_transformer = v6;

    v8 = objc_alloc_init(SearchManager);
    searchManager = v5->_searchManager;
    v5->_searchManager = v8;

    v5->_searchSessionID = 1;
  }

  return v5;
}

- (id)fetchRemoteMessagesWithQuery:(id)a3 delegate:(id)a4 useLocalIndex:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(MFRemoteSearchProvider_iOS *)self transformer];
  objc_super v11 = [v10 criterionForQuery:v8];

  v12 = [[SourceSearchContext alloc] initWithQuery:v8 criterion:v11 delegate:v9 useLocalIndex:v5 sessionID:self->_searchSessionID];
  os_unfair_lock_lock(&self->_lock);
  ++self->_searchSessionID;
  os_unfair_lock_unlock(&self->_lock);
  v13 = [(MFRemoteSearchProvider_iOS *)self searchManager];
  v14 = [v13 fullSearchUsingSearchContext:v12];

  return v14;
}

- (id)verifyResults:(id)a3 query:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MFRemoteSearchProvider_iOS *)self transformer];
  id v9 = [v8 criterionForQuery:v7];

  v10 = [[SearchResultsVerifier alloc] initWithCriterion:v9];
  objc_super v11 = [(SearchResultsVerifier *)v10 filterRemoteSearchResults:v6];

  return v11;
}

- (MFMailMessageLibraryQueryTransformer)transformer
{
  return self->_transformer;
}

- (SearchManager)searchManager
{
  return self->_searchManager;
}

- (unint64_t)searchSessionID
{
  return self->_searchSessionID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchManager, 0);

  objc_storeStrong((id *)&self->_transformer, 0);
}

@end