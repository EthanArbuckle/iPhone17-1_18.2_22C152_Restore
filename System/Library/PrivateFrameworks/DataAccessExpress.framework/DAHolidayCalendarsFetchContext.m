@interface DAHolidayCalendarsFetchContext
- (DAHolidayCalendarsFetchContext)initWithResultsBlock:(id)a3 completionBlock:(id)a4;
- (OS_dispatch_queue)queue;
- (id)completionBlock;
- (id)resultsBlock;
- (void)finishedWithError:(id)a3;
- (void)resultsReturned:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation DAHolidayCalendarsFetchContext

- (DAHolidayCalendarsFetchContext)initWithResultsBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DAHolidayCalendarsFetchContext;
  v8 = [(DAHolidayCalendarsFetchContext *)&v14 init];
  if (v8)
  {
    v9 = _Block_copy(v6);
    id resultsBlock = v8->_resultsBlock;
    v8->_id resultsBlock = v9;

    v11 = _Block_copy(v7);
    id completionBlock = v8->_completionBlock;
    v8->_id completionBlock = v11;
  }
  return v8;
}

- (void)resultsReturned:(id)a3
{
  id v4 = a3;
  if (self->_resultsBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      id v6 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      id v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    id v7 = v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__DAHolidayCalendarsFetchContext_resultsReturned___block_invoke;
    v8[3] = &unk_1E6215418;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

uint64_t __50__DAHolidayCalendarsFetchContext_resultsReturned___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 8) + 16))();
}

- (void)finishedWithError:(id)a3
{
  id v4 = a3;
  if (self->_completionBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      id v6 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      id v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    id v7 = v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __52__DAHolidayCalendarsFetchContext_finishedWithError___block_invoke;
    v8[3] = &unk_1E6215418;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

uint64_t __52__DAHolidayCalendarsFetchContext_finishedWithError___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
}

- (id)resultsBlock
{
  return self->_resultsBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_resultsBlock, 0);
}

@end