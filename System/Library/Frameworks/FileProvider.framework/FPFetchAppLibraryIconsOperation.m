@interface FPFetchAppLibraryIconsOperation
- (FPFetchAppLibraryIconsOperation)initWithAppLibraryItems:(id)a3 desiredSize:(CGSize)a4 screenScale:(double)a5;
- (FPOperationProgressDelegate)delegate;
- (void)main;
- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation FPFetchAppLibraryIconsOperation

- (FPFetchAppLibraryIconsOperation)initWithAppLibraryItems:(id)a3 desiredSize:(CGSize)a4 screenScale:(double)a5
{
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  v11 = [v10 valueForKey:@"fp_appContainerBundleIdentifier"];
  v12 = [v10 valueForKey:@"itemIdentifier"];
  if ([v11 count] && (uint64_t v13 = objc_msgSend(v11, "count"), v13 == objc_msgSend(v12, "count")))
  {
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11];
    if (v14 && width >= 1.0 && width == height && a5 >= 1.0)
    {
      v22.receiver = self;
      v22.super_class = (Class)FPFetchAppLibraryIconsOperation;
      v15 = [(FPOperation *)&v22 init];
      v16 = (double *)v15;
      if (v15)
      {
        objc_storeStrong((id *)&v15->_itemIdentifierByAppBundleID, v14);
        v16[39] = width;
        v16[40] = height;
        v16[41] = a5;
      }
      self = v16;
      v17 = self;
    }
    else
    {
      v18 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v19 = objc_opt_class();
      v23.double width = width;
      v23.double height = height;
      v20 = NSStringFromSize(v23);
      [v18 handleFailureInMethod:a2, self, @"FPFetchThumbnailsOperation.m", 112, @"invalid parameter to initialize %@ (appLibraryItems:%@, desiredSize:%@, screenScale:%f)", v19, v10, v20, *(void *)&a5 object file lineNumber description];

      v17 = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)main
{
  v1 = objc_msgSend(a1, "fp_shortDescriptionExpandingAtMost:", 4);
  OUTLINED_FUNCTION_9_1(&dword_1A33AE000, v2, v3, "[DEBUG] fetching app-library thumbnails for %@", v4, v5, v6, v7, 2u);
}

uint64_t __39__FPFetchAppLibraryIconsOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:a2];
}

- (void)operationDidProgressWithInfo:(id)a3 error:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  v11 = [v8 objectForKeyedSubscript:@"appBundleID"];
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = [(NSDictionary *)self->_itemIdentifierByAppBundleID objectForKeyedSubscript:v11];
    if (v12)
    {
      uint64_t v13 = (void *)[v8 mutableCopy];
      [v13 setObject:v12 forKeyedSubscript:@"identifier"];
      v14 = [(FPFetchAppLibraryIconsOperation *)self delegate];
      [v14 operation:self didReceiveProgressInfo:v13 error:v9];

      v10[2](v10);
    }
    else
    {
      v15 = fp_current_or_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[FPFetchAppLibraryIconsOperation operationDidProgressWithInfo:error:completionHandler:]((uint64_t)v11, v15);
      }
    }
  }
  else
  {
    v12 = fp_current_or_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[FPFetchAppLibraryIconsOperation operationDidProgressWithInfo:error:completionHandler:](v12);
    }
  }
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

  objc_storeStrong((id *)&self->_itemIdentifierByAppBundleID, 0);
}

- (void)operationDidProgressWithInfo:(os_log_t)log error:completionHandler:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A33AE000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] missing required key 'appBundleID'", v1, 2u);
}

- (void)operationDidProgressWithInfo:(uint64_t)a1 error:(NSObject *)a2 completionHandler:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A33AE000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] can't map appBundleID '%@' to item identifier", (uint8_t *)&v2, 0xCu);
}

@end