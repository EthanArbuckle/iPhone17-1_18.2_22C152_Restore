@interface BRCEvictItemOperation
- (BOOL)shouldRetryForError:(id)a3;
- (BRCEvictItemOperation)initWithSession:(id)a3 url:(id)a4;
- (id)evictionCompletionBlock;
- (void)cancel;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)main;
- (void)receiveProgressUpdates:(id)a3 reply:(id)a4;
- (void)receiveUpdates:(id)a3 logicalExtensions:(id)a4 physicalExtensions:(id)a5 reply:(id)a6;
- (void)setEvictionCompletionBlock:(id)a3;
@end

@implementation BRCEvictItemOperation

- (BRCEvictItemOperation)initWithSession:(id)a3 url:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 syncContextProvider];
  v10 = [v9 defaultSyncContext];
  v11 = [(_BRCOperation *)self initWithName:@"evict-item-operation" syncContext:v10 sessionContext:v7];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_session, a3);
    uint64_t v12 = brc_task_tracker_create("evict-item");
    tracker = v11->_tracker;
    v11->_tracker = (brc_task_tracker *)v12;

    v14 = objc_msgSend(MEMORY[0x1E4F1A218], "br_logout");
    [(_BRCOperation *)v11 setGroup:v14];

    objc_storeStrong((id *)&v11->_url, a4);
  }

  return v11;
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)BRCEvictItemOperation;
  [(_BRCOperation *)&v6 cancel];
  brc_task_tracker_cancel(self->_tracker);
  v3 = self;
  objc_sync_enter(v3);
  pipe = v3->_pipe;
  v3->_pipe = 0;
  v5 = pipe;

  objc_sync_exit(v3);
  [(BRCNotificationPipe *)v5 close];
}

- (void)main
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 552);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] now wait for evictions to be applied under %@%@", (uint8_t *)&v4, 0x16u);
}

void __29__BRCEvictItemOperation_main__block_invoke(uint64_t a1)
{
  v2 = [[BRCURLToItemLookup alloc] initWithURL:*(void *)(*(void *)(a1 + 32) + 552) allowAppLibraryRoot:1 session:*(void *)(*(void *)(a1 + 32) + 520)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  BOOL v4 = [(BRCURLToItemLookup *)v2 resolveAndKeepOpenWithError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  if (v4)
  {
    uint64_t v5 = [(BRCURLToItemLookup *)v2 byIDLocalItem];
    __int16 v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [(BRCURLToItemLookup *)v2 faultedLocalItem];
    }
    uint64_t v8 = v7;

    [v8 evictInTask:*(void *)(*(void *)(a1 + 32) + 560) options:5 error:0];
  }
  [(BRCURLToItemLookup *)v2 closePaths];
}

- (void)receiveUpdates:(id)a3 logicalExtensions:(id)a4 physicalExtensions:(id)a5 reply:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v23 = a4;
  id v11 = a5;
  uint64_t v12 = (void (**)(void))a6;
  if (![(_BRCOperation *)self finishIfCancelled] && !self->_isFinished)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v27;
      uint64_t v15 = *MEMORY[0x1E4F596B0];
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(obj);
          }
          v17 = [*(id *)(*((void *)&v26 + 1) + 8 * i) attributeForKey:v15];
          v18 = v17;
          if (!v17 || objc_msgSend(v17, "br_isEqualToNumber:", &unk_1F2B26E20))
          {
            long long v24 = *(_OWORD *)&self->_section.sectionID;
            uint64_t v25 = *(void *)&self->_section.line;
            v19 = brc_bread_crumbs();
            v20 = brc_default_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              url = self->_url;
              *(_DWORD *)buf = 134218498;
              uint64_t v31 = v24;
              __int16 v32 = 2112;
              v33 = url;
              __int16 v34 = 2112;
              v35 = v19;
              _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx no more items to evict under %@%@", buf, 0x20u);
            }

            v12[2](v12);
            self->_isFinished = 1;
            [(_BRCOperation *)self completedWithResult:0 error:0];
            __brc_leave_section((uint64_t *)&v24);

            goto LABEL_16;
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    v12[2](v12);
  }
LABEL_16:
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  __int16 v6 = self;
  id v7 = a4;
  id v8 = a3;
  objc_sync_enter(v6);
  pipe = v6->_pipe;
  v6->_pipe = 0;
  id v10 = pipe;

  objc_sync_exit(v6);
  [(BRCNotificationPipe *)v10 close];
  brc_task_tracker_cancel(v6->_tracker);
  v11.receiver = v6;
  v11.super_class = (Class)BRCEvictItemOperation;
  [(_BRCFrameworkOperation *)&v11 finishWithResult:v8 error:v7];
}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (void)receiveProgressUpdates:(id)a3 reply:(id)a4
{
  BOOL v4 = (void (**)(void))a4;
  uint64_t v5 = brc_bread_crumbs();
  __int16 v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCEvictItemOperation receiveProgressUpdates:reply:]((uint64_t)v5, v6);
  }

  v4[2](v4);
}

- (id)evictionCompletionBlock
{
  return objc_getProperty(self, a2, 584, 1);
}

- (void)setEvictionCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_evictionCompletionBlock, 0);
  objc_storeStrong((id *)&self->_pipe, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)receiveProgressUpdates:(uint64_t)a1 reply:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] receiveProgressUpdates in the evictItemOperation - just calling the reply.%@", (uint8_t *)&v2, 0xCu);
}

@end