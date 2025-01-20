@interface FPFetchRegularItemThumbnailsOperation
- (FPFetchRegularItemThumbnailsOperation)initWithDictionary:(id)a3 desiredSizeToScale:(CGSize)a4 itemManager:(id)a5;
- (FPOperationProgressDelegate)delegate;
- (void)main;
- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation FPFetchRegularItemThumbnailsOperation

- (FPFetchRegularItemThumbnailsOperation)initWithDictionary:(id)a3 desiredSizeToScale:(CGSize)a4 itemManager:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a5;
  v13 = [v11 allKeys];
  v14 = (void *)[v13 copy];

  uint64_t v15 = [v14 count];
  if (v12 && v15 && width >= 1.0 && height >= 1.0)
  {
    v24.receiver = self;
    v24.super_class = (Class)FPFetchRegularItemThumbnailsOperation;
    v16 = [(FPOperation *)&v24 init];
    v17 = v16;
    if (v16)
    {
      objc_storeStrong((id *)&v16->_dictionary, a3);
      v17->_desiredSizeToScale.double width = width;
      v17->_desiredSizeToScale.double height = height;
      objc_storeStrong((id *)&v17->_itemManager, a5);
    }
    self = v17;
    v18 = self;
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v20 = objc_opt_class();
    v21 = [v11 allKeys];
    v25.double width = width;
    v25.double height = height;
    v22 = NSStringFromSize(v25);
    [v19 handleFailureInMethod:a2, self, @"FPFetchThumbnailsOperation.m", 206, @"invalid parameter to initialize %@ (regularItems:%@, desiredSizeToScale:%@, itemManager:%@)", v20, v21, v22, v12 object file lineNumber description];

    v18 = 0;
  }

  return v18;
}

- (void)main
{
  v1 = [*(id *)(a1 + 304) allKeys];
  v2 = objc_msgSend(v1, "fp_shortDescriptionExpandingAtMost:", 4);
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v3, v4, "[DEBUG] fetching regular thumbnails for %@", v5, v6, v7, v8, 2u);
}

void __45__FPFetchRegularItemThumbnailsOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (!a2 || a3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    [v5 completedWithResult:0 error:a3];
  }
  else
  {
    uint64_t v4 = [a2 remoteObjectProxy];
    objc_msgSend(v4, "startOperation:toFetchThumbnailsWithDictionary:size:completionHandler:", *(double *)(*(void *)(a1 + 32) + 312), *(double *)(*(void *)(a1 + 32) + 320));
  }
}

uint64_t __45__FPFetchRegularItemThumbnailsOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v11 = (void (**)(void))a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [(FPFetchRegularItemThumbnailsOperation *)self delegate];
  [v10 operation:self didReceiveProgressInfo:v9 error:v8];

  v11[2]();
}

- (FPOperationProgressDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FPOperationProgressDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_itemManager, 0);

  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end