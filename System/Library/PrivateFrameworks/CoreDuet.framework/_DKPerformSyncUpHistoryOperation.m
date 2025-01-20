@interface _DKPerformSyncUpHistoryOperation
- (BOOL)isAsynchronous;
- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:;
- (void)endOperation;
- (void)main;
- (void)performSyncUpHistory;
@end

@implementation _DKPerformSyncUpHistoryOperation

- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peer:(void *)a6 policy:(void *)a7 type:
{
  id v14 = a3;
  id v21 = a4;
  id v15 = a5;
  id v20 = a6;
  id v16 = a7;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)_DKPerformSyncUpHistoryOperation;
    v17 = (id *)objc_msgSendSuper2(&v22, sel_initWithParent_, a2);
    v18 = v17;
    if (v17)
    {
      objc_storeStrong(v17 + 37, a3);
      objc_storeStrong(v18 + 38, a4);
      objc_storeStrong(v18 + 39, a5);
      objc_storeStrong(v18 + 40, a6);
      objc_storeStrong(v18 + 41, a7);
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  uint64_t v3 = objc_opt_class();
  if (+[_DKSync2Coordinator shouldDeferSyncOperationWithClass:syncType:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v3, self->_type, self->_transport, 0, self->_policy))
  {
    [(_DKPerformSyncUpHistoryOperation *)self endOperation];
  }
  else
  {
    -[_DKPerformSyncUpHistoryOperation performSyncUpHistory]((void **)&self->super.super.super.super.isa);
  }
}

- (void)performSyncUpHistory
{
  v2 = [(id)objc_opt_class() description];
  uint64_t v3 = [*(id *)(a1 + 304) name];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v4, v5, "%{public}@: Queuing history sync up on transport %{public}@", v6, v7, v8, v9, v10);
}

- (void)endOperation
{
  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncUpHistoryOperation;
  [(_DKSyncCompositeOperation *)&v2 endOperation];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_me, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

@end