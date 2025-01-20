@interface HMFOperationFutureAdapter
- (uint64_t)_handleFinishedOperation:(uint64_t)a1;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation HMFOperationFutureAdapter

- (uint64_t)_handleFinishedOperation:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v10 = v3;
    int v5 = [v3 isCancelled];
    v6 = *(void **)(a1 + 8);
    if (v5)
    {
      v7 = [MEMORY[0x1E4F28C58] hmfErrorWithCode:12];
      char v8 = [v6 rejectWithError:v7];

      v4 = v10;
      if ((v8 & 1) == 0) {
        goto LABEL_7;
      }
    }
    else
    {
      id v3 = (id)[*(id *)(a1 + 8) fulfillWithValue:v10];
      v4 = v10;
      if (!v3) {
        goto LABEL_7;
      }
    }
    id v3 = (id)[v4 removeObserver:a1 forKeyPath:@"isFinished" context:HMFOperationFutureAdapterKVOContext];
    v4 = v10;
  }
LABEL_7:
  return MEMORY[0x1F41817F8](v3, v4);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a4;
  id v10 = v9;
  if ((void *)HMFOperationFutureAdapterKVOContext == a6)
  {
    v13 = v9;
    v11 = [a5 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    int v12 = [v11 BOOLValue];

    id v10 = v13;
    if (v12)
    {
      id v9 = (id)-[HMFOperationFutureAdapter _handleFinishedOperation:]((uint64_t)self, v13);
      id v10 = v13;
    }
  }
  MEMORY[0x1F41817F8](v9, v10);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong((id *)&self->_promise, 0);
}

@end