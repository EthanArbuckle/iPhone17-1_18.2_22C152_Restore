@interface EKGroupExpansionOperation
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (EKGroupExpansionOperation)initWithSource:(id)a3 group:(id)a4 completionBlock:(id)a5;
- (id)_processResults:(id)a3 class:(Class)a4;
- (void)_finishWithError:(id)a3;
- (void)_processResults:(id)a3;
- (void)main;
- (void)start;
@end

@implementation EKGroupExpansionOperation

- (EKGroupExpansionOperation)initWithSource:(id)a3 group:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)EKGroupExpansionOperation;
  v11 = [(EKGroupExpansionOperation *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 externalID];
    accountID = v11->_accountID;
    v11->_accountID = (NSString *)v12;

    objc_storeStrong((id *)&v11->_group, a4);
    uint64_t v14 = [v10 copy];
    id completionBlock = v11->_completionBlock;
    v11->_id completionBlock = (id)v14;
  }
  return v11;
}

- (void)start
{
  if (([(EKGroupExpansionOperation *)self isCancelled] & 1) == 0
    && ![(EKGroupExpansionOperation *)self isExecuting]
    && ![(EKGroupExpansionOperation *)self isFinished])
  {
    [(EKGroupExpansionOperation *)self main];
  }
}

- (void)main
{
  [(EKGroupExpansionOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_isExecuting = 1;
  [(EKGroupExpansionOperation *)self didChangeValueForKey:@"isExecuting"];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__EKGroupExpansionOperation_main__block_invoke;
  v7[3] = &unk_1E5B988D0;
  v7[4] = self;
  v3 = (void *)MEMORY[0x1A6266730](v7);
  v4 = [MEMORY[0x1E4F5E950] sharedConnection];
  accountID = self->_accountID;
  v6 = [(EKDirectoryRecord *)self->_group principalPath];
  [v4 performGroupExpansionWithAccountID:accountID principalPath:v6 completionBlock:v3];
}

void __33__EKGroupExpansionOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0) {
    [*(id *)(a1 + 32) _processResults:v6];
  }
  [*(id *)(a1 + 32) _finishWithError:v5];
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)_processResults:(id)a3
{
  if (self->_completionBlock)
  {
    id v4 = a3;
    id v5 = objc_alloc_init(EKDirectorySearchResultSet);
    resultsSet = self->_resultsSet;
    self->_resultsSet = v5;

    v7 = [v4 objectForKey:*MEMORY[0x1E4F5E900]];
    id v8 = [(EKGroupExpansionOperation *)self _processResults:v7 class:objc_opt_class()];
    [(EKDirectorySearchResultSet *)self->_resultsSet setGroups:v8];

    id v9 = [v4 objectForKey:*MEMORY[0x1E4F5E908]];
    id v10 = [(EKGroupExpansionOperation *)self _processResults:v9 class:objc_opt_class()];
    [(EKDirectorySearchResultSet *)self->_resultsSet setLocations:v10];

    v11 = [v4 objectForKey:*MEMORY[0x1E4F5E910]];
    uint64_t v12 = [(EKGroupExpansionOperation *)self _processResults:v11 class:objc_opt_class()];
    [(EKDirectorySearchResultSet *)self->_resultsSet setResources:v12];

    id v14 = [v4 objectForKey:*MEMORY[0x1E4F5E918]];

    v13 = [(EKGroupExpansionOperation *)self _processResults:v14 class:objc_opt_class()];
    [(EKDirectorySearchResultSet *)self->_resultsSet setPeople:v13];
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
    v10[2] = __51__EKGroupExpansionOperation__processResults_class___block_invoke;
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

void __51__EKGroupExpansionOperation__processResults_class___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 40) recordFromSearchResult:a2];
  [*(id *)(a1 + 32) addObject:v3];
}

- (void)_finishWithError:(id)a3
{
  id v4 = a3;
  if (([(EKGroupExpansionOperation *)self isCancelled] & 1) == 0) {
    (*((void (**)(void))self->_completionBlock + 2))();
  }
  [(EKGroupExpansionOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_isExecuting = 0;
  [(EKGroupExpansionOperation *)self didChangeValueForKey:@"isExecuting"];
  [(EKGroupExpansionOperation *)self willChangeValueForKey:@"isFinished"];
  self->_isFinished = 1;
  [(EKGroupExpansionOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultsSet, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_accountID, 0);
}

@end