@interface _DKPerformSyncUpChangeOperation
- (BOOL)isAsynchronous;
- (void)endOperation;
- (void)main;
- (void)performSyncUpChange;
@end

@implementation _DKPerformSyncUpChangeOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  uint64_t v3 = objc_opt_class();
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, 0, self->_policy))
  {
    [(_DKPerformSyncUpChangeOperation *)self endOperation];
  }
  else
  {
    -[_DKPerformSyncUpChangeOperation performSyncUpChange]((uint64_t)self);
  }
}

- (void)performSyncUpChange
{
  v2 = [(id)objc_opt_class() description];
  uint64_t v3 = [*(id *)(a1 + 304) name];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v4, v5, "%{public}@: Skipping change sync up on transport %{public}@ because there are no changes", v6, v7, v8, v9, v10);
}

- (void)endOperation
{
  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncUpChangeOperation;
  [(_DKSyncCompositeOperation *)&v2 endOperation];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deletedEventIDs, 0);
  objc_storeStrong((id *)&self->_insertedEvents, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

@end