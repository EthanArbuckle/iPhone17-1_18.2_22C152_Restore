@interface MDSearchQuery
- (CSSearchQuery)query;
- (MDSearchQuery)initWithPredicate:(id)a3 options:(id)a4;
- (MDSearchQuery)initWithQueryString:(id)a3 options:(id)a4;
- (MDSearchQueryDelegate)delegate;
- (NSDictionary)options;
- (NSPredicate)predicate;
- (NSString)clientBundleID;
- (OS_dispatch_queue)queue;
- (id)queryString;
- (unint64_t)status;
- (void)_didFinishWithError:(id)a3;
- (void)_didReturnItems:(id)a3;
- (void)cancel;
- (void)setClientBundleID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPredicate:(id)a3;
- (void)setQuery:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStatus:(unint64_t)a3;
- (void)start;
@end

@implementation MDSearchQuery

- (MDSearchQuery)initWithPredicate:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 generateMetadataDescription];
  v9 = [(MDSearchQuery *)self initWithQueryString:v8 options:v7];

  if (v9)
  {
    uint64_t v10 = [v6 copy];
    predicate = v9->_predicate;
    v9->_predicate = (NSPredicate *)v10;
  }
  return v9;
}

- (MDSearchQuery)initWithQueryString:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MDSearchQuery;
  v8 = [(MDSearchQuery *)&v19 init];
  if (v8)
  {
    id location = 0;
    objc_initWeak(&location, v8);
    v9 = [[CSSearchQuery alloc] initWithQueryString:v6 options:v7];
    query = v8->_query;
    v8->_query = v9;

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __45__MDSearchQuery_initWithQueryString_options___block_invoke;
    v16[3] = &unk_1E554A260;
    objc_copyWeak(&v17, &location);
    [(CSSearchQuery *)v8->_query setFoundItemsHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __45__MDSearchQuery_initWithQueryString_options___block_invoke_2;
    v14[3] = &unk_1E554A288;
    objc_copyWeak(&v15, &location);
    [(CSSearchQuery *)v8->_query setCompletionHandler:v14];
    uint64_t v11 = [(CSSearchQuery *)v8->_query queue];
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v11;

    v8->_status = 0;
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __45__MDSearchQuery_initWithQueryString_options___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didReturnItems:v3];
}

void __45__MDSearchQuery_initWithQueryString_options___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didFinishWithError:v3];
}

- (id)queryString
{
  return [(CSSearchQuery *)self->_query queryString];
}

- (NSDictionary)options
{
  return (NSDictionary *)[(CSSearchQuery *)self->_query options];
}

- (void)start
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__MDSearchQuery_start__block_invoke;
  block[3] = &unk_1E5548F00;
  block[4] = self;
  dispatch_async(queue, block);
}

void __22__MDSearchQuery_start__block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x192F99810]();
  v4 = *(void **)(a1 + 32);
  id v3 = (id *)(a1 + 32);
  [v4 setStatus:1];
  v5 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __22__MDSearchQuery_start__block_invoke_cold_1((uint64_t)v3);
  }

  [*v3 setStatus:2];
  id v6 = [*v3 clientBundleID];

  if (v6)
  {
    id v7 = [*v3 clientBundleID];
    v9[0] = v7;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [*((id *)*v3 + 5) setBundleIDs:v8];
  }
  [*((id *)*v3 + 5) start];
}

- (void)cancel
{
}

- (unint64_t)status
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t status = v2->_status;
  objc_sync_exit(v2);

  return status;
}

- (void)setStatus:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = self;
  objc_sync_enter(v5);
  unint64_t status = v5->_status;
  v5->_unint64_t status = a3;
  objc_sync_exit(v5);

  if (status != a3)
  {
    id v7 = logForCSLogCategoryQuery();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      BOOL v9 = [(CSSearchQuery *)v5->_query isCancelled];
      uint64_t v10 = @"NO";
      int v11 = 138413058;
      v12 = v5;
      __int16 v13 = 2048;
      if (v9) {
        uint64_t v10 = @"YES";
      }
      unint64_t v14 = status;
      __int16 v15 = 2048;
      unint64_t v16 = a3;
      __int16 v17 = 2112;
      v18 = v10;
      _os_log_debug_impl(&dword_18D0E3000, v7, OS_LOG_TYPE_DEBUG, "%@, status changed, status:%ld/%ld, canceled:%@", (uint8_t *)&v11, 0x2Au);
    }

    v8 = [(MDSearchQuery *)v5 delegate];
    if (objc_opt_respondsToSelector()) {
      [v8 searchQuery:v5 statusChanged:a3];
    }
  }
}

- (void)_didReturnItems:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MDSearchQuery _didReturnItems:]((uint64_t)self, v4);
  }

  id v6 = [(MDSearchQuery *)self delegate];
  [v6 searchQuery:self didReturnItems:v4];
}

- (void)_didFinishWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = [v4 domain];
    int v6 = [v5 isEqualToString:*MEMORY[0x1E4F281F8]];

    if (v6)
    {
      id v7 = v4;
LABEL_9:
      [(MDSearchQuery *)self setStatus:5];
      int v11 = logForCSLogCategoryQuery();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        [(MDSearchQuery *)(uint64_t)self _didFinishWithError:v11];
      }

      v12 = [(MDSearchQuery *)self delegate];
      if (objc_opt_respondsToSelector()) {
        [v12 searchQuery:self didFailWithError:v7];
      }

      goto LABEL_16;
    }
    if ([v4 code] != -2003)
    {
      uint64_t v8 = [v4 code] == -2001 ? -1100 : -1;
      id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v10 = [v4 userInfo];
      id v7 = [v9 initWithDomain:@"MDSearchQueryErrorDomain" code:v8 userInfo:v10];

      if (v7) {
        goto LABEL_9;
      }
    }
  }
  [(MDSearchQuery *)self setStatus:3];
  id v7 = logForCSLogCategoryQuery();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[MDSearchQuery _didFinishWithError:]((uint64_t)self);
  }
LABEL_16:
}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPredicate:(id)a3
{
}

- (MDSearchQueryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MDSearchQueryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (CSSearchQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (NSString)clientBundleID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_predicate, 0);
}

void __22__MDSearchQuery_start__block_invoke_cold_1(uint64_t a1)
{
  id v7 = [*(id *)(*(void *)a1 + 40) queryString];
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v1, v2, "%@ searching with query:\"%@\"", v3, v4, v5, v6, 2u);
}

- (void)_didReturnItems:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  [a2 count];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v2, v3, "%@, found %lu results", v4, v5, v6, v7, v8);
}

- (void)_didFinishWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  [*(id *)(a1 + 40) foundItemCount];
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_0(&dword_18D0E3000, v1, v2, "%@, completed with %ld results", v3, v4, v5, v6, v7);
}

- (void)_didFinishWithError:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_18D0E3000, log, OS_LOG_TYPE_ERROR, "%@, failed with error:%@", (uint8_t *)&v3, 0x16u);
}

@end