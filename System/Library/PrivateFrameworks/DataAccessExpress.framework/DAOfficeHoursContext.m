@interface DAOfficeHoursContext
- (BOOL)isFetch;
- (NSString)accountID;
- (OS_dispatch_queue)queue;
- (id)fetchCompletionBlock;
- (id)setCompletionBlock;
- (void)abortWithError:(id)a3;
- (void)finishFetchWithOfficeHours:(id)a3 error:(id)a4;
- (void)finishSetWithError:(id)a3;
- (void)setAccountID:(id)a3;
- (void)setFetchCompletionBlock:(id)a3;
- (void)setQueue:(id)a3;
- (void)setSetCompletionBlock:(id)a3;
@end

@implementation DAOfficeHoursContext

- (BOOL)isFetch
{
  v2 = [(DAOfficeHoursContext *)self fetchCompletionBlock];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)finishFetchWithOfficeHours:(id)a3 error:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    accountID = self->_accountID;
    *(_DWORD *)buf = 138543362;
    v18 = accountID;
    _os_log_impl(&dword_1BA3E8000, v8, OS_LOG_TYPE_DEBUG, "Fetch of office hours for account %{public}@ completed.", buf, 0xCu);
  }

  v10 = [(DAOfficeHoursContext *)self fetchCompletionBlock];

  if (v10)
  {
    queue = self->_queue;
    if (queue)
    {
      v12 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v12 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__DAOfficeHoursContext_finishFetchWithOfficeHours_error___block_invoke;
    block[3] = &unk_1E6215468;
    block[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_async(v13, block);
  }
}

void __57__DAOfficeHoursContext_finishFetchWithOfficeHours_error___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) fetchCompletionBlock];
  v2 = [*(id *)(a1 + 32) accountID];
  (*((void (**)(id, void *, void, void))v3 + 2))(v3, v2, *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)finishSetWithError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = DALoggingwithCategory(0);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    accountID = self->_accountID;
    *(_DWORD *)buf = 138543362;
    v14 = accountID;
    _os_log_impl(&dword_1BA3E8000, v5, OS_LOG_TYPE_DEBUG, "Setting of office hours for account %{public}@ completed.", buf, 0xCu);
  }

  id v7 = [(DAOfficeHoursContext *)self setCompletionBlock];

  if (v7)
  {
    queue = self->_queue;
    if (queue)
    {
      v9 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v9 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __43__DAOfficeHoursContext_finishSetWithError___block_invoke;
    v11[3] = &unk_1E6215418;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(v10, v11);
  }
}

void __43__DAOfficeHoursContext_finishSetWithError___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) setCompletionBlock];
  v2 = [*(id *)(a1 + 32) accountID];
  v3[2](v3, v2, *(void *)(a1 + 40));
}

- (void)abortWithError:(id)a3
{
  id v6 = a3;
  id v4 = [(DAOfficeHoursContext *)self fetchCompletionBlock];

  if (v4)
  {
    [(DAOfficeHoursContext *)self finishFetchWithOfficeHours:0 error:v6];
  }
  else
  {
    v5 = [(DAOfficeHoursContext *)self setCompletionBlock];

    if (v5) {
      [(DAOfficeHoursContext *)self finishSetWithError:v6];
    }
  }
  MEMORY[0x1F4181820]();
}

- (NSString)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (id)fetchCompletionBlock
{
  return self->_fetchCompletionBlock;
}

- (void)setFetchCompletionBlock:(id)a3
{
}

- (id)setCompletionBlock
{
  return self->_setCompletionBlock;
}

- (void)setSetCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_setCompletionBlock, 0);
  objc_storeStrong(&self->_fetchCompletionBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
}

@end