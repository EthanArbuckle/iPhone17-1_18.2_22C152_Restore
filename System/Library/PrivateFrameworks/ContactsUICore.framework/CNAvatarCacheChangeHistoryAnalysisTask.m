@interface CNAvatarCacheChangeHistoryAnalysisTask
- (CNAvatarCacheChangeHistoryAnalysisTask)initWithContactStore:(id)a3 startingToken:(id)a4;
- (CNChangeHistoryFetchRequest)request;
- (CNContactStore)store;
- (CNResult)enumerator;
- (NSArray)identifiers;
- (NSData)finalToken;
- (NSData)startingToken;
- (id)run:(id *)a3;
- (void)executeRequest;
- (void)extractIdentifiers;
- (void)makeRequest;
- (void)setEnumerator:(id)a3;
- (void)setFinalToken:(id)a3;
- (void)setIdentifiers:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation CNAvatarCacheChangeHistoryAnalysisTask

- (CNAvatarCacheChangeHistoryAnalysisTask)initWithContactStore:(id)a3 startingToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNAvatarCacheChangeHistoryAnalysisTask;
  v9 = [(CNTask *)&v13 initWithName:@"com.apple.contacts.ui.avatar-cache.change-history-analysis"];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_store, a3);
    objc_storeStrong((id *)&v10->_startingToken, a4);
    v11 = v10;
  }

  return v10;
}

- (id)run:(id *)a3
{
  [(CNAvatarCacheChangeHistoryAnalysisTask *)self makeRequest];
  [(CNAvatarCacheChangeHistoryAnalysisTask *)self executeRequest];
  v5 = [(CNAvatarCacheChangeHistoryAnalysisTask *)self enumerator];
  char v6 = [v5 isSuccess];

  if (v6)
  {
    [(CNAvatarCacheChangeHistoryAnalysisTask *)self extractIdentifiers];
    id v7 = [CNAvatarCacheChangeAnalysis alloc];
    id v8 = [(CNAvatarCacheChangeHistoryAnalysisTask *)self finalToken];
    v9 = [(CNAvatarCacheChangeHistoryAnalysisTask *)self identifiers];
    v10 = [(CNAvatarCacheChangeAnalysis *)v7 initWithCurrentChangeHistoryToken:v8 identifiersOfAffectedContacts:v9];
  }
  else
  {
    id v8 = [(CNAvatarCacheChangeHistoryAnalysisTask *)self enumerator];
    v11 = [v8 error];
    v9 = v11;
    v10 = 0;
    if (a3) {
      *a3 = v11;
    }
  }

  return v10;
}

- (void)makeRequest
{
  id v4 = objc_alloc_init(MEMORY[0x263EFE9F0]);
  v3 = [(CNAvatarCacheChangeHistoryAnalysisTask *)self startingToken];
  [v4 setStartingToken:v3];

  [v4 setIncludeGroupChanges:0];
  [(CNAvatarCacheChangeHistoryAnalysisTask *)self setRequest:v4];
}

- (void)executeRequest
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20B704000, a2, OS_LOG_TYPE_ERROR, "Error fetching changes: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)extractIdentifiers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(CNAvatarCacheChangeHistoryAnalysisTask *)self enumerator];
  if ([v3 isSuccess])
  {
    uint64_t v4 = objc_alloc_init(CNAvatarCacheFingerprintCollector);
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v5 = objc_msgSend(v3, "value", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v9++) acceptEventVisitor:v4];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    v10 = [(CNAvatarCacheFingerprintCollector *)v4 fingerprintsOfAffectedContacts];
    [(CNAvatarCacheChangeHistoryAnalysisTask *)self setIdentifiers:v10];
  }
}

- (CNContactStore)store
{
  return self->_store;
}

- (NSData)startingToken
{
  return self->_startingToken;
}

- (CNChangeHistoryFetchRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (CNResult)enumerator
{
  return self->_enumerator;
}

- (void)setEnumerator:(id)a3
{
}

- (NSData)finalToken
{
  return self->_finalToken;
}

- (void)setFinalToken:(id)a3
{
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void)setIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_finalToken, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_startingToken, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end