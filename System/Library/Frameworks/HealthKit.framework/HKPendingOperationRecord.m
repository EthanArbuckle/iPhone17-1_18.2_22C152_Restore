@interface HKPendingOperationRecord
+ (id)pendingOperation:(id)a3 completion:(id)a4;
- (id)completionHandler;
- (id)operationHandler;
- (int64_t)errorCount;
- (void)setErrorCount:(int64_t)a3;
@end

@implementation HKPendingOperationRecord

+ (id)pendingOperation:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(HKPendingOperationRecord);
  uint64_t v8 = [v6 copy];

  id operationHandler = v7->_operationHandler;
  v7->_id operationHandler = (id)v8;

  uint64_t v10 = [v5 copy];
  id completionHandler = v7->_completionHandler;
  v7->_id completionHandler = (id)v10;

  return v7;
}

- (id)operationHandler
{
  return self->_operationHandler;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (int64_t)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(int64_t)a3
{
  self->_errorCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong(&self->_operationHandler, 0);
}

@end