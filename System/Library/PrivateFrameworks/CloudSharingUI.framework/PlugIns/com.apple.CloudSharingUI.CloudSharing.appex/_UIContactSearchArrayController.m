@interface _UIContactSearchArrayController
- (CNAutocompleteSearchManager)searchManager;
- (NSArray)existingRecipients;
- (NSNumber)currentSearchTaskID;
- (NSString)searchText;
- (_UIContactSearchArrayController)initWithContactStore:(id)a3 delegate:(id)a4;
- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4;
- (void)enumerateLeafRecipients:(id)a3 block:(id)a4;
- (void)finishedSearchingForAutocompleteResults;
- (void)finishedTaskWithID:(id)a3;
- (void)processRecipients:(id)a3;
- (void)setCurrentSearchTaskID:(id)a3;
- (void)setExistingRecipients:(id)a3;
- (void)setSearchManager:(id)a3;
- (void)setSearchText:(id)a3;
@end

@implementation _UIContactSearchArrayController

- (_UIContactSearchArrayController)initWithContactStore:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)_UIContactSearchArrayController;
  v8 = [(_UIContactSearchArrayController *)&v21 initWithDelegate:a4];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_contactStore, a3);
    uint64_t v10 = objc_opt_new();
    mailStatusCache = v9->_mailStatusCache;
    v9->_mailStatusCache = (NSMutableDictionary *)v10;

    dispatch_queue_t v12 = dispatch_queue_create("address cache access queue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    mailStatusAccessQueue = v9->_mailStatusAccessQueue;
    v9->_mailStatusAccessQueue = (OS_dispatch_queue *)v12;

    dispatch_queue_t v14 = dispatch_queue_create("address validation queue", 0);
    mailValidationQueue = v9->_mailValidationQueue;
    v9->_mailValidationQueue = (OS_dispatch_queue *)v14;

    uint64_t v16 = objc_opt_new();
    autocompleteFetchContext = v9->_autocompleteFetchContext;
    v9->_autocompleteFetchContext = (CNAutocompleteFetchContext *)v16;

    [(CNAutocompleteFetchContext *)v9->_autocompleteFetchContext setTitle:@"Contacts for sharing"];
    uint64_t v18 = +[NSMutableArray array];
    autocompleteSearchResults = v9->_autocompleteSearchResults;
    v9->_autocompleteSearchResults = (NSMutableArray *)v18;
  }
  return v9;
}

- (CNAutocompleteSearchManager)searchManager
{
  searchManager = self->_searchManager;
  if (!searchManager)
  {
    v4 = (CNAutocompleteSearchManager *)[objc_alloc((Class)CNAutocompleteSearchManager) initWithAutocompleteSearchType:5];
    v5 = self->_searchManager;
    self->_searchManager = v4;

    [(CNAutocompleteSearchManager *)self->_searchManager setIncludeUpcomingEventMembers:1];
    searchManager = self->_searchManager;
  }

  return searchManager;
}

- (void)setSearchText:(id)a3
{
  v4 = (NSString *)a3;
  if (self->_searchText != v4)
  {
    v13 = v4;
    v5 = (NSString *)[(NSString *)v4 copy];
    searchText = self->_searchText;
    self->_searchText = v5;

    id v7 = [(_UIContactSearchArrayController *)self currentSearchTaskID];

    if (v7)
    {
      v8 = [(_UIContactSearchArrayController *)self searchManager];
      v9 = [(_UIContactSearchArrayController *)self currentSearchTaskID];
      [v8 cancelTaskWithID:v9];
    }
    uint64_t v10 = [(_UIContactSearchArrayController *)self existingRecipients];
    [(CNAutocompleteFetchContext *)self->_autocompleteFetchContext setOtherAddressesAlreadyChosen:v10];

    [(NSMutableArray *)self->_autocompleteSearchResults removeAllObjects];
    if ([(NSString *)v13 length])
    {
      v11 = [(_UIContactSearchArrayController *)self searchManager];
      dispatch_queue_t v12 = [v11 searchForText:v13 withAutocompleteFetchContext:self->_autocompleteFetchContext consumer:self];
      [(_UIContactSearchArrayController *)self setCurrentSearchTaskID:v12];
    }
    else
    {
      [(_UIContactSearchArrayController *)self processRecipients:&__NSArray0__struct];
    }
    v4 = v13;
  }
}

- (NSString)searchText
{
  return self->_searchText;
}

- (void)finishedTaskWithID:(id)a3
{
}

- (void)consumeAutocompleteSearchResults:(id)a3 taskID:(id)a4
{
  autocompleteSearchResults = self->_autocompleteSearchResults;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100008FCC;
  v8[3] = &unk_1000FF068;
  v8[4] = self;
  id v5 = a3;
  v6 = +[NSPredicate predicateWithBlock:v8];
  id v7 = [v5 filteredArrayUsingPredicate:v6];

  [(NSMutableArray *)autocompleteSearchResults addObjectsFromArray:v7];
}

- (void)finishedSearchingForAutocompleteResults
{
}

- (void)enumerateLeafRecipients:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v6);
        }
        dispatch_queue_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v13 = [v12 children];
        id v14 = [v13 count];

        if (v14)
        {
          v15 = [v12 children];
          [(_UIContactSearchArrayController *)self enumerateLeafRecipients:v15 block:v7];
        }
        else
        {
          v7[2](v7, v12);
        }
      }
      id v9 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (void)processRecipients:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIContactSearchArrayController *)self operationQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009268;
  v7[3] = &unk_1000FF0B8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 addOperationWithBlock:v7];
}

- (void)setExistingRecipients:(id)a3
{
  self->_existingRecipients = +[NSSet setWithArray:a3];

  _objc_release_x1();
}

- (NSArray)existingRecipients
{
  return [(NSSet *)self->_existingRecipients allObjects];
}

- (void)setSearchManager:(id)a3
{
}

- (NSNumber)currentSearchTaskID
{
  return self->_currentSearchTaskID;
}

- (void)setCurrentSearchTaskID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSearchTaskID, 0);
  objc_storeStrong((id *)&self->_autocompleteSearchResults, 0);
  objc_storeStrong((id *)&self->_mailValidationQueue, 0);
  objc_storeStrong((id *)&self->_mailStatusAccessQueue, 0);
  objc_storeStrong((id *)&self->_mailStatusCache, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_existingRecipients, 0);
  objc_storeStrong((id *)&self->_searchText, 0);
  objc_storeStrong((id *)&self->_autocompleteFetchContext, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_searchManager, 0);
}

@end