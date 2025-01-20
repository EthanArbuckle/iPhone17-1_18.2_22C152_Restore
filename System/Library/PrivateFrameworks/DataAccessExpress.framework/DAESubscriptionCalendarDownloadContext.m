@interface DAESubscriptionCalendarDownloadContext
- (DAESubscribedCalendarDownloadDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)asyncCallOutToDelegate:(id)a3;
- (void)callOutToDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
@end

@implementation DAESubscriptionCalendarDownloadContext

- (void)callOutToDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__DAESubscriptionCalendarDownloadContext_callOutToDelegate___block_invoke;
  v7[3] = &unk_1E6215700;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __60__DAESubscriptionCalendarDownloadContext_callOutToDelegate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (void)asyncCallOutToDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__DAESubscriptionCalendarDownloadContext_asyncCallOutToDelegate___block_invoke;
  v7[3] = &unk_1E6215700;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __65__DAESubscriptionCalendarDownloadContext_asyncCallOutToDelegate___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (DAESubscribedCalendarDownloadDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end