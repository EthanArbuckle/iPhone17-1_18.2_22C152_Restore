@interface EKDirectorySearchOperation
+ (BOOL)isSupported;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)numberOfMatchesExceededLimit;
- (EKDirectorySearchOperation)init;
- (EKDirectorySearchOperation)initWithSource:(id)a3 query:(id)a4 resultsBlock:(id)a5;
- (NSError)error;
- (id)_processResults:(id)a3 class:(Class)a4;
- (id)_recordTypes;
- (void)_finishWithError:(id)a3;
- (void)_processResults:(id)a3;
- (void)cancel;
- (void)main;
- (void)setError:(id)a3;
- (void)setNumberOfMatchesExceededLimit:(BOOL)a3;
- (void)start;
@end

@implementation EKDirectorySearchOperation

- (EKDirectorySearchOperation)init
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"Please use the appropriate designated initializer for this class." userInfo:0];
  objc_exception_throw(v2);
}

- (EKDirectorySearchOperation)initWithSource:(id)a3 query:(id)a4 resultsBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EKDirectorySearchOperation;
  v11 = [(EKDirectorySearchOperation *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 externalID];
    accountID = v11->_accountID;
    v11->_accountID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_query, a4);
    uint64_t v14 = [v10 copy];
    id resultsBlock = v11->_resultsBlock;
    v11->_id resultsBlock = (id)v14;
  }
  return v11;
}

- (void)start
{
  if (([(EKDirectorySearchOperation *)self isCancelled] & 1) == 0
    && ![(EKDirectorySearchOperation *)self isExecuting]
    && ![(EKDirectorySearchOperation *)self isFinished])
  {
    [(EKDirectorySearchOperation *)self main];
  }
}

- (void)main
{
  [(EKDirectorySearchOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_isExecuting = 1;
  [(EKDirectorySearchOperation *)self didChangeValueForKey:@"isExecuting"];
  v3 = [(EKDirectorySearchOperation *)self _recordTypes];
  v4 = v3;
  if (v3 && [v3 count])
  {
    v5 = [(EKDirectorySearchQuery *)self->_query terms];
    unint64_t v6 = [(EKDirectorySearchQuery *)self->_query resultLimit];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __34__EKDirectorySearchOperation_main__block_invoke;
    v13[3] = &unk_1E5B97BF0;
    v13[4] = self;
    v7 = (void *)MEMORY[0x1A6266730](v13);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __34__EKDirectorySearchOperation_main__block_invoke_2;
    v12[3] = &unk_1E5B97C18;
    v12[4] = self;
    id v8 = (void *)MEMORY[0x1A6266730](v12);
    id v9 = [MEMORY[0x1E4F5E950] sharedConnection];
    id v10 = [v9 performCalendarDirectorySearchWithAccountID:self->_accountID terms:v5 recordTypes:v4 resultLimit:v6 resultsBlock:v7 completionBlock:v8];
    id searchID = self->_searchID;
    self->_id searchID = v10;
  }
  else
  {
    [(EKDirectorySearchOperation *)self _finishWithError:0];
  }
}

void __34__EKDirectorySearchOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0) {
    [*(id *)(a1 + 32) _processResults:v3];
  }
}

void __34__EKDirectorySearchOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 setNumberOfMatchesExceededLimit:a3];
  [*(id *)(a1 + 32) _finishWithError:v6];
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)EKDirectorySearchOperation;
  [(EKDirectorySearchOperation *)&v4 cancel];
  id v3 = [MEMORY[0x1E4F5E950] sharedConnection];
  [v3 cancelCalendarDirectorySearchWithID:self->_searchID];
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (id)_recordTypes
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if ([(EKDirectorySearchQuery *)self->_query findGroups]) {
    [v3 addObject:*MEMORY[0x1E4F5E900]];
  }
  if ([(EKDirectorySearchQuery *)self->_query findLocations]) {
    [v3 addObject:*MEMORY[0x1E4F5E908]];
  }
  if ([(EKDirectorySearchQuery *)self->_query findResources]) {
    [v3 addObject:*MEMORY[0x1E4F5E910]];
  }
  if ([(EKDirectorySearchQuery *)self->_query findUsers]) {
    [v3 addObject:*MEMORY[0x1E4F5E918]];
  }

  return v3;
}

- (void)_processResults:(id)a3
{
  if (self->_resultsBlock)
  {
    id v4 = a3;
    v13 = objc_alloc_init(EKDirectorySearchResultSet);
    v5 = [v4 objectForKey:*MEMORY[0x1E4F5E900]];
    id v6 = [(EKDirectorySearchOperation *)self _processResults:v5 class:objc_opt_class()];
    [(EKDirectorySearchResultSet *)v13 setGroups:v6];

    v7 = [v4 objectForKey:*MEMORY[0x1E4F5E908]];
    id v8 = [(EKDirectorySearchOperation *)self _processResults:v7 class:objc_opt_class()];
    [(EKDirectorySearchResultSet *)v13 setLocations:v8];

    id v9 = [v4 objectForKey:*MEMORY[0x1E4F5E910]];
    id v10 = [(EKDirectorySearchOperation *)self _processResults:v9 class:objc_opt_class()];
    [(EKDirectorySearchResultSet *)v13 setResources:v10];

    v11 = [v4 objectForKey:*MEMORY[0x1E4F5E918]];

    uint64_t v12 = [(EKDirectorySearchOperation *)self _processResults:v11 class:objc_opt_class()];
    [(EKDirectorySearchResultSet *)v13 setPeople:v12];

    if (([(EKDirectorySearchOperation *)self isCancelled] & 1) == 0) {
      (*((void (**)(void))self->_resultsBlock + 2))();
    }
  }
}

- (id)_processResults:(id)a3 class:(Class)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v6];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__EKDirectorySearchOperation__processResults_class___block_invoke;
    v10[3] = &unk_1E5B97C40;
    Class v12 = a4;
    id v8 = v7;
    id v11 = v8;
    [v5 enumerateObjectsUsingBlock:v10];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __52__EKDirectorySearchOperation__processResults_class___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 40) recordFromSearchResult:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  if (([(EKDirectorySearchOperation *)self isCancelled] & 1) == 0) {
    [(EKDirectorySearchOperation *)self setError:v4];
  }
  [(EKDirectorySearchOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_isExecuting = 0;
  [(EKDirectorySearchOperation *)self didChangeValueForKey:@"isExecuting"];
  [(EKDirectorySearchOperation *)self willChangeValueForKey:@"isFinished"];
  self->_isFinished = 1;
  [(EKDirectorySearchOperation *)self didChangeValueForKey:@"isFinished"];
}

+ (BOOL)isSupported
{
  return 1;
}

- (BOOL)numberOfMatchesExceededLimit
{
  return self->_numberOfMatchesExceededLimit;
}

- (void)setNumberOfMatchesExceededLimit:(BOOL)a3
{
  self->_numberOfMatchesExceededLimit = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong(&self->_searchID, 0);
  objc_storeStrong(&self->_resultsBlock, 0);
  objc_storeStrong((id *)&self->_query, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end