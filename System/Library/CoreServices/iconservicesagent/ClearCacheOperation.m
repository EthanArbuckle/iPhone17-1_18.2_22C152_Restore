@interface ClearCacheOperation
- (ClearCacheOperation)initWithCache:(id)a3 operationType:(unint64_t)a4;
- (ISMutableIconCache)cache;
- (OS_os_transaction)transaction;
- (id)description;
- (unint64_t)operation;
- (void)run;
@end

@implementation ClearCacheOperation

- (ClearCacheOperation)initWithCache:(id)a3 operationType:(unint64_t)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ClearCacheOperation;
  v8 = [(ClearCacheOperation *)&v12 init];
  if (v8)
  {
    uint64_t v9 = os_transaction_create();
    transaction = v8->_transaction;
    v8->_transaction = (OS_os_transaction *)v9;

    v8->_operation = a4;
    objc_storeStrong((id *)&v8->_cache, a3);
  }

  return v8;
}

- (void)run
{
  unint64_t operation = self->_operation;
  cache = self->_cache;
  if (operation == 2) {
    [(ISMutableIconCache *)cache clear];
  }
  else {
    [(ISMutableIconCache *)cache collectGarbage];
  }
}

- (id)description
{
  if (self->_operation == 2) {
    return @"CacheOperation - ClearAll";
  }
  else {
    return @"CacheOperation - GarbageCollect";
  }
}

- (OS_os_transaction)transaction
{
  return (OS_os_transaction *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)operation
{
  return self->_operation;
}

- (ISMutableIconCache)cache
{
  return (ISMutableIconCache *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end