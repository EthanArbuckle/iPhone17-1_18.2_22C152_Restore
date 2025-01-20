@interface CNADirectoryServerSearchTask
- (CNADirectoryServerSearchTask)initWithRequest:(id)a3 contactStore:(id)a4 cancelationToken:(id)a5;
- (CNAutocompleteFetchRequest)request;
- (CNCancelationToken)cancelationToken;
- (CNContactStore)contactStore;
- (id)makeQueryForContainer:(id)a3 withLatch:(id)a4 andCollectConsumers:(id)a5;
- (id)run;
- (void)convertResults;
- (void)createReturnValue;
- (void)fetchServerSearchContainers;
- (void)searchServerContainers;
- (void)validateRequest;
@end

@implementation CNADirectoryServerSearchTask

- (CNADirectoryServerSearchTask)initWithRequest:(id)a3 contactStore:(id)a4 cancelationToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)CNADirectoryServerSearchTask;
  v12 = [(CNTask *)&v16 initWithName:@"com.apple.contacts.autocomplete.directory-server-search"];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_request, a3);
    objc_storeStrong((id *)&v13->_contactStore, a4);
    objc_storeStrong((id *)&v13->_cancelationToken, a5);
    v14 = v13;
  }

  return v13;
}

- (id)run
{
  CNResult *returnValue;
  uint64_t vars8;

  [(CNADirectoryServerSearchTask *)self validateRequest];
  [(CNADirectoryServerSearchTask *)self fetchServerSearchContainers];
  [(CNADirectoryServerSearchTask *)self searchServerContainers];
  [(CNADirectoryServerSearchTask *)self convertResults];
  [(CNADirectoryServerSearchTask *)self createReturnValue];
  returnValue = self->_returnValue;
  return returnValue;
}

- (void)validateRequest
{
  uint64_t v3 = *MEMORY[0x1E4F5A298];
  v4 = [(CNAutocompleteFetchRequest *)self->_request searchString];
  LODWORD(v3) = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  if (v3)
  {
    self->_returnValue = [MEMORY[0x1E4F5A4E0] successWithValue:MEMORY[0x1E4F1CBF0]];
    MEMORY[0x1F41817F8]();
  }
}

- (void)fetchServerSearchContainers
{
  CNResult *returnValue;
  id v9;

  if (([(CNCancelationToken *)self->_cancelationToken isCanceled] & 1) == 0)
  {
    uint64_t v3 = [(CNADirectoryServerSearchTask *)self contactStore];
    id v9 = 0;
    v4 = [v3 serverSearchContainersMatchingPredicate:0 error:&v9];
    id v5 = v9;
    containers = self->_containers;
    self->_containers = v4;

    if (!self->_containers)
    {
      v7 = [MEMORY[0x1E4F5A4E0] failureWithError:v5];
      returnValue = self->_returnValue;
      self->_returnValue = v7;
    }
  }
}

- (void)searchServerContainers
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (([(CNCancelationToken *)self->_cancelationToken isCanceled] & 1) == 0 && !self->_returnValue)
  {
    if ([(NSArray *)self->_containers count])
    {
      v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4F5A388]), "initWithStartingCount:", -[NSArray count](self->_containers, "count"));
      uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](self->_containers, "count"));
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      obj = self->_containers;
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v23 != v6) {
              objc_enumerationMutation(obj);
            }
            v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            id v9 = [(CNADirectoryServerSearchTask *)self makeQueryForContainer:v8 withLatch:v19 andCollectConsumers:v3];
            id v10 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
            id v11 = [v10 dataAccessConnection];
            v12 = [v8 accountIdentifier];
            [v11 performServerContactsSearch:v9 forAccountWithID:v12];

            cancelationToken = self->_cancelationToken;
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __54__CNADirectoryServerSearchTask_searchServerContainers__block_invoke;
            v20[3] = &unk_1E63DD9C0;
            id v21 = v9;
            id v14 = v9;
            [(CNCancelationToken *)cancelationToken addCancelationBlock:v20];
          }
          uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v5);
      }

      [v19 await];
      v15 = +[CNDASearchQueryConsumer SuccessfulResults];
      objc_msgSend(v3, "_cn_flatMap:", v15);
      objc_super v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
      daResults = self->_daResults;
      self->_daResults = v16;
    }
    else
    {
      self->_returnValue = [MEMORY[0x1E4F5A4E0] successWithValue:MEMORY[0x1E4F1CBF0]];
      MEMORY[0x1F41817F8]();
    }
  }
}

void __54__CNADirectoryServerSearchTask_searchServerContainers__block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  v2 = [v3 dataAccessConnection];
  [v2 cancelServerContactsSearch:*(void *)(a1 + 32)];
}

- (id)makeQueryForContainer:(id)a3 withLatch:(id)a4 andCollectConsumers:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [v10 externalIdentifier];
  v12 = [v10 externalModificationTag];

  v13 = [[CNDASearchQueryConsumer alloc] initWithLatch:v9];
  [v8 addObject:v13];

  id v14 = (void *)MEMORY[0x1E4F5E948];
  v15 = [(CNAutocompleteFetchRequest *)self->_request searchString];
  objc_super v16 = [v14 contactsSearchQueryWithSearchString:v15 searchBase:v11 searchScope:v12 consumer:v13];

  [v16 setTimeLimit:30];
  [v16 setIncludePhotos:0];
  objc_msgSend(v16, "setCalendarInitiated:", -[CNAutocompleteFetchRequest searchType](self->_request, "searchType") == 3);

  return v16;
}

- (void)convertResults
{
  if (([(CNCancelationToken *)self->_cancelationToken isCanceled] & 1) == 0 && !self->_returnValue)
  {
    id v3 = [(CNAutocompleteFetchRequest *)self->_request priorityDomainForSorting];
    uint64_t v4 = [(CNAutocompleteFetchRequest *)self->_request fetchContext];
    uint64_t v5 = [v4 sendingAddress];
    id v10 = +[CNAutocompleteResultFactory factoryWithPriorityDomain:v3 sendingAddress:v5];

    daResults = self->_daResults;
    v7 = +[CNADASearchResultConverter resultTransformForRequest:self->_request factory:v10];
    id v8 = [(NSArray *)daResults _cn_flatMap:v7];
    results = self->_results;
    self->_results = v8;
  }
}

- (void)createReturnValue
{
  CNResult *returnValue;
  uint64_t vars8;

  if ([(CNCancelationToken *)self->_cancelationToken isCanceled])
  {
    id v3 = (void *)MEMORY[0x1E4F5A4E0];
    [MEMORY[0x1E4F5A3F0] userCanceledError];
    uint64_t v4 = [v3 failureWithError:objc_claimAutoreleasedReturnValue()];
    returnValue = self->_returnValue;
    self->_returnValue = v4;
  }
  else
  {
    if (self->_returnValue) {
      return;
    }
    self->_returnValue = [MEMORY[0x1E4F5A4E0] successWithValue:self->_results];
  }
  MEMORY[0x1F41817F8]();
}

- (CNAutocompleteFetchRequest)request
{
  return self->_request;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (CNCancelationToken)cancelationToken
{
  return self->_cancelationToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelationToken, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_daResults, 0);
  objc_storeStrong((id *)&self->_containers, 0);
  objc_storeStrong((id *)&self->_returnValue, 0);
}

@end