@interface CDXCompactStoreOperation
+ (double)unavailableExtensionPurgeTimeout;
- (CDXCompactStoreOperation)initWithStore:(id)a3;
- (CDXCompactStoreOperation)initWithStore:(id)a3 queue:(id)a4;
- (CXCallDirectoryStore)store;
- (OS_dispatch_queue)queue;
- (void)performWithCompletionHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation CDXCompactStoreOperation

- (CDXCompactStoreOperation)initWithStore:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CDXCompactStoreOperation;
  v9 = [(CDXCompactStoreOperation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_store, a3);
  }

  return v10;
}

- (CDXCompactStoreOperation)initWithStore:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.callkit.calldirectory.compactstoreoperation", 0);
  v6 = [(CDXCompactStoreOperation *)self initWithStore:v4 queue:v5];

  return v6;
}

- (void)performWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = [(CDXCompactStoreOperation *)self queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001198C;
  v7[3] = &unk_100034BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

+ (double)unavailableExtensionPurgeTimeout
{
  return 7200.0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CXCallDirectoryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end