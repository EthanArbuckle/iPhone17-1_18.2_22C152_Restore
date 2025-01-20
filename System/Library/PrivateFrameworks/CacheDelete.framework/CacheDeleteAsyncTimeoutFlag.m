@interface CacheDeleteAsyncTimeoutFlag
- (BOOL)timedOut;
- (CacheDeleteAsyncTimeoutFlag)initWithQueue:(id)a3;
- (OS_dispatch_queue)queue;
- (void)setQueue:(id)a3;
- (void)setTimedOut:(BOOL)a3;
@end

@implementation CacheDeleteAsyncTimeoutFlag

- (BOOL)timedOut
{
  v3 = [(CacheDeleteAsyncTimeoutFlag *)self queue];
  dispatch_assert_queue_V2(v3);

  return self->_timedOut;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CacheDeleteAsyncTimeoutFlag)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CacheDeleteAsyncTimeoutFlag;
  v6 = [(CacheDeleteAsyncTimeoutFlag *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (void)setTimedOut:(BOOL)a3
{
  id v5 = [(CacheDeleteAsyncTimeoutFlag *)self queue];
  dispatch_assert_queue_not_V2(v5);

  v6 = [(CacheDeleteAsyncTimeoutFlag *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = __43__CacheDeleteAsyncTimeoutFlag_setTimedOut___block_invoke;
  v7[3] = &unk_10005D938;
  v7[4] = self;
  BOOL v8 = a3;
  dispatch_sync(v6, v7);
}

uint64_t __43__CacheDeleteAsyncTimeoutFlag_setTimedOut___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end