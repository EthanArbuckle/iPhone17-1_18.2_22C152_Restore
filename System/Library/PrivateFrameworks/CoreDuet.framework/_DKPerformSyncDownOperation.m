@interface _DKPerformSyncDownOperation
- (BOOL)isAsynchronous;
- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peers:(void *)a6 policy:(void *)a7 type:;
- (void)endOperation;
- (void)main;
- (void)performSyncDown;
- (void)performSyncDown2;
@end

@implementation _DKPerformSyncDownOperation

- (id)initWithParent:(void *)a3 localStorage:(void *)a4 transport:(void *)a5 peers:(void *)a6 policy:(void *)a7 type:
{
  id v14 = a3;
  id v21 = a4;
  id v15 = a5;
  id v20 = a6;
  id v16 = a7;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)_DKPerformSyncDownOperation;
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
    [(_DKPerformSyncDownOperation *)self endOperation];
  }
  else
  {
    -[_DKPerformSyncDownOperation performSyncDown]((void **)&self->super.super.super.super.isa);
  }
}

- (void)performSyncDown
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    v2 = +[_DKSyncSerializer underlyingQueue];
    dispatch_assert_queue_V2(v2);

    uint64_t v3 = objc_opt_new();
    if ([a1[39] count])
    {
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      id v4 = a1[39];
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v13;
        while (2)
        {
          uint64_t v8 = 0;
          do
          {
            if (*(void *)v13 != v7) {
              objc_enumerationMutation(v4);
            }
            v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
            uint64_t v10 = objc_opt_class();
            if (+[_DKSync2Coordinator canPerformSyncOperationWithClass:syncType:history:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v10, a1[41], v3, a1[38], v9, a1[40]))
            {

              goto LABEL_14;
            }
            ++v8;
          }
          while (v6 != v8);
          uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
    }
    else
    {
      uint64_t v11 = objc_opt_class();
      if (+[_DKSync2Coordinator canPerformSyncOperationWithClass:syncType:history:transport:peer:policy:]((uint64_t)_DKSync2Coordinator, v11, a1[41], v3, a1[38], 0, a1[40]))
      {
LABEL_14:
        -[_DKPerformSyncDownOperation performSyncDown2](a1);
LABEL_16:

        return;
      }
    }
    objc_msgSend(a1, "endOperation", (void)v12);
    goto LABEL_16;
  }
}

- (void)performSyncDown2
{
  v2 = [(id)objc_opt_class() description];
  uint64_t v3 = [*(id *)(a1 + 304) name];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v4, v5, "%{public}@: Finding peers for sync down operation on transport %{public}@", v6, v7, v8, v9, v10);
}

- (void)endOperation
{
  v2.receiver = self;
  v2.super_class = (Class)_DKPerformSyncDownOperation;
  [(_DKSyncCompositeOperation *)&v2 endOperation];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_peers, 0);
  objc_storeStrong((id *)&self->_transport, 0);
  objc_storeStrong((id *)&self->_localStorage, 0);
}

@end