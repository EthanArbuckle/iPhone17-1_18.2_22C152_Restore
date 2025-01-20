@interface DACheckSubscribedCalendarIsJunkContext
- (DACheckSubscribedCalendarIsJunkContext)initWithURLString:(id)a3 completionBlock:(id)a4;
- (NSString)urlString;
- (OS_dispatch_queue)queue;
- (id)completionBlock;
- (int64_t)junkStatus;
- (void)finishedWithError:(id)a3;
- (void)setJunkStatus:(int64_t)a3;
- (void)setQueue:(id)a3;
@end

@implementation DACheckSubscribedCalendarIsJunkContext

- (DACheckSubscribedCalendarIsJunkContext)initWithURLString:(id)a3 completionBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DACheckSubscribedCalendarIsJunkContext;
  v9 = [(DACheckSubscribedCalendarIsJunkContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_urlString, a3);
    v11 = _Block_copy(v8);
    id completionBlock = v10->_completionBlock;
    v10->_id completionBlock = v11;
  }
  return v10;
}

- (void)finishedWithError:(id)a3
{
  id v4 = a3;
  if (self->_completionBlock)
  {
    queue = self->_queue;
    if (queue)
    {
      v6 = queue;
    }
    else
    {
      dispatch_get_global_queue(0, 0);
      v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
    }
    id v7 = v6;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__DACheckSubscribedCalendarIsJunkContext_finishedWithError___block_invoke;
    v8[3] = &unk_1E6215418;
    v8[4] = self;
    id v9 = v4;
    dispatch_async(v7, v8);
  }
}

void __60__DACheckSubscribedCalendarIsJunkContext_finishedWithError___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[2];
  id v4 = [v2 urlString];
  (*(void (**)(uint64_t, id, uint64_t, void))(v3 + 16))(v3, v4, [*(id *)(a1 + 32) junkStatus], *(void *)(a1 + 40));
}

- (NSString)urlString
{
  return self->_urlString;
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

- (int64_t)junkStatus
{
  return self->_junkStatus;
}

- (void)setJunkStatus:(int64_t)a3
{
  self->_junkStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_urlString, 0);
}

@end