@interface BRCFileProvider
+ (id)prettyNameForFilePresenterID:(id)a3;
- (BRCAccountSession)session;
- (BRCFileProvider)initWithURL:(id)a3 name:(id)a4;
- (NSOperationQueue)_providedItemsOperationQueue;
- (NSURL)_providedItemsURL;
- (id)_keyForURL:(id)a3;
- (id)_keyForURL:(id)a3 andID:(id)a4;
- (id)_pathForKey:(id)a3;
- (void)_provideItemAtURL:(id)a3 completionHandler:(id)a4;
- (void)_providedItemAtURL:(id)a3 didGainPresenterWithID:(id)a4;
- (void)_providedItemAtURL:(id)a3 didLosePresenterWithID:(id)a4;
- (void)_providedItemAtURL:(id)a3 withPresenterWithID:(id)a4 didMoveToURL:(id)a5;
- (void)dumpToContext:(id)a3;
- (void)resume;
- (void)setSession:(id)a3;
- (void)suspend;
@end

@implementation BRCFileProvider

+ (id)prettyNameForFilePresenterID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28CA0] _processIdentifierForID:v3];
  if (v4)
  {
    uint64_t v5 = v4;
    v6 = NSString;
    v7 = BRCExecutableNameForProcessIdentifier();
    id v8 = [v6 stringWithFormat:@"%@[%d]", v7, v5];
  }
  else
  {
    id v8 = v3;
  }

  return v8;
}

- (BRCFileProvider)initWithURL:(id)a3 name:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)BRCFileProvider;
  v9 = [(BRCFileProvider *)&v28 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    v11 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    queue = v10->_queue;
    v10->_queue = v11;

    v13 = [@"com.apple.bird.fileprovider." stringByAppendingString:v8];
    [(NSOperationQueue *)v10->_queue setName:v13];
    id v14 = v13;
    v15 = (const char *)[v14 UTF8String];
    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v17 = dispatch_queue_attr_make_with_autorelease_frequency(v16, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create(v15, v17);

    [(NSOperationQueue *)v10->_queue setUnderlyingQueue:v18];
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    presentersIDsByKey = v10->_presentersIDsByKey;
    v10->_presentersIDsByKey = v19;

    v21 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v22 = dispatch_queue_attr_make_with_autorelease_frequency(v21, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v23 = dispatch_queue_create("file-provider", v22);

    privQueue = v10->_privQueue;
    v10->_privQueue = (OS_dispatch_queue *)v23;

    uint64_t v25 = brc_task_tracker_create("file-provider");
    tracker = v10->_tracker;
    v10->_tracker = (brc_task_tracker *)v25;
  }
  return v10;
}

- (void)resume
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] resuming %@%@");
}

- (void)suspend
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] suspending %@%@");
}

- (void)setSession:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__54;
  id v14 = __Block_byref_object_dispose__54;
  id v15 = 0;
  uint64_t v5 = [(NSOperationQueue *)self->_queue underlyingQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__BRCFileProvider_setSession___block_invoke;
  block[3] = &unk_1E6996D20;
  block[4] = self;
  id v6 = v4;
  id v8 = v6;
  v9 = &v10;
  dispatch_sync(v5, block);

  brc_task_tracker_wait(v11[5]);
  _Block_object_dispose(&v10, 8);
}

void __30__BRCFileProvider_setSession___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 48));
  uint64_t v2 = brc_task_tracker_create("file-provider");
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 48);
  *(void *)(v3 + 48) = v2;

  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  brc_task_tracker_cancel(v5);
}

- (void)dumpToContext:(id)a3
{
  id v4 = a3;
  privQueue = self->_privQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__BRCFileProvider_dumpToContext___block_invoke;
  v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(privQueue, v7);
}

void __33__BRCFileProvider_dumpToContext___block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 32) count])
  {
    uint64_t v2 = *(void **)(a1 + 40);
    uint64_t v3 = [*(id *)(a1 + 32) _fileReactorID];
    [v2 writeLineWithFormat:@"file presenters for %@", v3];

    [*(id *)(a1 + 40) writeLineWithFormat:@"-----------------------------------------------------"];
    id v4 = *(void **)(*(void *)(a1 + 32) + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __33__BRCFileProvider_dumpToContext___block_invoke_2;
    v5[3] = &unk_1E6995BF8;
    id v6 = *(id *)(a1 + 40);
    [v4 enumerateKeysAndObjectsUsingBlock:v5];
    [*(id *)(a1 + 40) writeLineWithFormat:&stru_1F2AC7720];
  }
}

void __33__BRCFileProvider_dumpToContext___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(a1 + 32);
        uint64_t v12 = +[BRCFileProvider prettyNameForFilePresenterID:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
        [v11 writeLineWithFormat:@"  + %@ -> %@", v12, v5];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (NSURL)_providedItemsURL
{
  return self->_url;
}

- (NSOperationQueue)_providedItemsOperationQueue
{
  return self->_queue;
}

- (id)_keyForURL:(id)a3
{
  uint64_t v3 = [a3 path];
  id v4 = objc_msgSend(v3, "br_realpath");

  return v4;
}

- (id)_keyForURL:(id)a3 andID:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  uint64_t v8 = [(BRCFileProvider *)self _keyForURL:a3];
  uint64_t v9 = [v6 stringWithFormat:@"%@::%@", v7, v8];

  return v9;
}

- (id)_pathForKey:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "br_isAbsolutePath"))
  {
    id v4 = v3;
  }
  else
  {
    id v5 = [v3 componentsSeparatedByString:@"::"];
    id v6 = (void *)[v5 mutableCopy];

    if ((unint64_t)[v6 count] > 1)
    {
      [v6 removeObjectAtIndex:0];
      uint64_t v9 = [v6 componentsJoinedByString:@"::"];
    }
    else
    {
      id v7 = brc_bread_crumbs();
      uint64_t v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        -[BRCFileProvider _pathForKey:]();
      }

      uint64_t v9 = [v6 lastObject];
    }
    id v4 = (id)v9;
  }
  return v4;
}

- (void)_provideItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, (os_log_type_t)0x90u)) {
    -[BRCFileProvider _provideItemAtURL:completionHandler:]();
  }
}

- (void)_providedItemAtURL:(id)a3 didGainPresenterWithID:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[BRCFileProvider prettyNameForFilePresenterID:v7];
  memset(v21, 0, sizeof(v21));
  __brc_create_section(0, (uint64_t)"-[BRCFileProvider _providedItemAtURL:didGainPresenterWithID:]", 164, v21);
  uint64_t v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = v21[0];
    long long v16 = [v6 path];
    *(_DWORD *)buf = 134219010;
    uint64_t v23 = v15;
    __int16 v24 = 2112;
    uint64_t v25 = v16;
    __int16 v26 = 2112;
    id v27 = v7;
    __int16 v28 = 2112;
    v29 = v8;
    __int16 v30 = 2112;
    v31 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx new presenter of '%@': %@ (%@)%@", buf, 0x34u);
  }
  privQueue = self->_privQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke;
  block[3] = &unk_1E6993CC8;
  block[4] = self;
  id v18 = v6;
  id v19 = v8;
  id v20 = v7;
  id v12 = v7;
  id v13 = v8;
  id v14 = v6;
  dispatch_sync(privQueue, block);

  __brc_leave_section(v21);
}

void __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _keyForURL:*(void *)(a1 + 40)];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v2];
  id v4 = *(id *)(*(void *)(a1 + 32) + 8);
  if ([v3 count])
  {
    id v5 = v3;
  }
  else
  {
    if (v3)
    {
      uint64_t v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke_cold_2();
      }
    }
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:1];

    [*(id *)(*(void *)(a1 + 32) + 32) setObject:v5 forKeyedSubscript:v2];
    if (v4)
    {
      [*(id *)(a1 + 32) _registerPresenterForItemAtURL:*(void *)(a1 + 40) key:v2 name:*(void *)(a1 + 48) session:v4];
    }
    else
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke_cold_1();
      }
    }
  }
  [v5 addObject:*(void *)(a1 + 56)];
}

- (void)_providedItemAtURL:(id)a3 didLosePresenterWithID:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v19, 0, sizeof(v19));
  __brc_create_section(0, (uint64_t)"-[BRCFileProvider _providedItemAtURL:didLosePresenterWithID:]", 190, v19);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v19[0];
    id v14 = [v6 path];
    uint64_t v15 = +[BRCFileProvider prettyNameForFilePresenterID:v7];
    *(_DWORD *)buf = 134219010;
    uint64_t v21 = v13;
    __int16 v22 = 2112;
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v15;
    __int16 v28 = 2112;
    v29 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx removed presenter of '%@': %@ (%@)%@", buf, 0x34u);
  }
  privQueue = self->_privQueue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke;
  v16[3] = &unk_1E6993600;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_sync(privQueue, v16);

  __brc_leave_section(v19);
}

void __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _keyForURL:*(void *)(a1 + 40)];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v2];
  if ((unint64_t)[v3 count] > 1)
  {
    if (([v3 containsObject:*(void *)(a1 + 48)] & 1) == 0)
    {
      uint64_t v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
        __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke_cold_1();
      }
    }
    [v3 removeObject:*(void *)(a1 + 48)];
  }
  else
  {
    if ([v3 count] != 1)
    {
      id v4 = brc_bread_crumbs();
      id v5 = brc_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke_cold_2();
      }
    }
    [*(id *)(a1 + 32) _unregisterPresenterForKey:v2];
    if (([v3 containsObject:*(void *)(a1 + 48)] & 1) == 0)
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke_cold_1();
      }
    }
    [*(id *)(*(void *)(a1 + 32) + 32) removeObjectForKey:v2];
  }
}

- (void)_providedItemAtURL:(id)a3 withPresenterWithID:(id)a4 didMoveToURL:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [v8 path];
    id v14 = [v10 path];
    int v15 = 138413058;
    long long v16 = v13;
    __int16 v17 = 2112;
    id v18 = v14;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    __int16 v22 = v11;
    _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] '%@' moved to '%@', by %@%@", (uint8_t *)&v15, 0x2Au);
  }
  [(BRCFileProvider *)self _providedItemAtURL:v8 didLosePresenterWithID:v9];
  [(BRCFileProvider *)self _providedItemAtURL:v10 didGainPresenterWithID:v9];
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_privQueue, 0);
  objc_storeStrong((id *)&self->_presentersIDsByKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)_pathForKey:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Invalid components count. It should either be an absolute path or prefixed with file provider id%@", v2, v3, v4, v5, v6);
}

- (void)_provideItemAtURL:completionHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] this method is deprecated%@", v1, 0xCu);
}

void __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] not doing anything since we're logged out%@", v1, 0xCu);
}

void __61__BRCFileProvider__providedItemAtURL_didGainPresenterWithID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: presentersIDs == nil%@", v2, v3, v4, v5, v6);
}

void __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [presentersIDs containsObject:filePresenterID]%@", v2, v3, v4, v5, v6);
}

void __61__BRCFileProvider__providedItemAtURL_didLosePresenterWithID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: presentersIDs.count == 1%@", v2, v3, v4, v5, v6);
}

@end