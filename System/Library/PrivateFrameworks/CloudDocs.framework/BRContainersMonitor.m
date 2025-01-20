@interface BRContainersMonitor
+ (BOOL)isContainerID:(id)a3;
+ (BOOL)isContainerIDForeground:(id)a3;
+ (id)bundleIDFromPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4;
+ (id)containerIDFromPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4;
- (BRContainersMonitor)init;
- (void)addObserver:(id)a3 forContainerID:(id)a4;
- (void)dealloc;
- (void)removeObserver:(id)a3 forContainerID:(id)a4;
@end

@implementation BRContainersMonitor

- (BRContainersMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)BRContainersMonitor;
  v2 = [(BRContainersMonitor *)&v12 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersByContainerID = v2->_observersByContainerID;
    v2->_observersByContainerID = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    notifyTokenByContainerID = v2->_notifyTokenByContainerID;
    v2->_notifyTokenByContainerID = v5;

    v7 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(v7, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.clouddocs.containers.monitor", v8);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;
  }
  return v2;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] API MISUSE: There were observers remaining at dealloc time. Call -removeObserver:forContainerID: first.%@", v2, v3, v4, v5, v6);
}

+ (BOOL)isContainerID:(id)a3
{
  return [a3 hasPrefix:@"com.apple.clouddocs."];
}

+ (id)containerIDFromPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"+[BRContainersMonitor containerIDFromPrimaryIdentifier:secondaryIdentifier:]", 81, v13);
  v7 = brc_bread_crumbs((uint64_t)"+[BRContainersMonitor containerIDFromPrimaryIdentifier:secondaryIdentifier:]", 81);
  v8 = brc_default_log(1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v15 = v13[0];
    __int16 v16 = 2112;
    id v17 = v5;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    v21 = v7;
    _os_log_debug_impl(&dword_19ED3F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asking container ID for %@, %@%@", buf, 0x2Au);
  }

  if ([v6 isEqualToString:@"com.apple.bird"])
  {
    dispatch_queue_t v9 = [@"com.apple.clouddocs." stringByAppendingString:v5];
    v10 = brc_bread_crumbs((uint64_t)"+[BRContainersMonitor containerIDFromPrimaryIdentifier:secondaryIdentifier:]", 87);
    v11 = brc_default_log(1);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      +[BRContainersMonitor containerIDFromPrimaryIdentifier:secondaryIdentifier:]();
    }
  }
  else
  {
    dispatch_queue_t v9 = 0;
  }
  __brc_leave_section((uint64_t)v13);

  return v9;
}

+ (id)bundleIDFromPrimaryIdentifier:(id)a3 secondaryIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"+[BRContainersMonitor bundleIDFromPrimaryIdentifier:secondaryIdentifier:]", 94, v15);
  v8 = brc_bread_crumbs((uint64_t)"+[BRContainersMonitor bundleIDFromPrimaryIdentifier:secondaryIdentifier:]", 94);
  dispatch_queue_t v9 = brc_default_log(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    id v17 = (id)v15[0];
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    v23 = v8;
    _os_log_debug_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx asking bundle ID for %@, %@%@", buf, 0x2Au);
  }

  v10 = [a1 containerIDFromPrimaryIdentifier:v6 secondaryIdentifier:v7];
  if (v10)
  {
    v11 = @"com.apple.bird";
    objc_super v12 = brc_bread_crumbs((uint64_t)"+[BRContainersMonitor bundleIDFromPrimaryIdentifier:secondaryIdentifier:]", 144);
    v13 = brc_default_log(1);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[BRContainersMonitor containerIDFromPrimaryIdentifier:secondaryIdentifier:]();
    }
  }
  else
  {
    objc_super v12 = brc_bread_crumbs((uint64_t)"+[BRContainersMonitor bundleIDFromPrimaryIdentifier:secondaryIdentifier:]", 99);
    v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      id v21 = v12;
      _os_log_fault_impl(&dword_19ED3F000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: not a CloudDocs identifier pair (%@, %@)%@", buf, 0x20u);
    }
    v11 = 0;
  }

  __brc_leave_section((uint64_t)v15);

  return v11;
}

- (void)addObserver:(id)a3 forContainerID:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v37, 0, sizeof(v37));
  __brc_create_section(0, (uint64_t)"-[BRContainersMonitor addObserver:forContainerID:]", 151, v37);
  v8 = brc_bread_crumbs((uint64_t)"-[BRContainersMonitor addObserver:forContainerID:]", 151);
  dispatch_queue_t v9 = brc_default_log(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)handler = 134218498;
    *(void *)&handler[4] = v37[0];
    *(_WORD *)&handler[12] = 2112;
    *(void *)&handler[14] = v7;
    *(_WORD *)&handler[22] = 2112;
    *(void *)&handler[24] = v8;
    _os_log_debug_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx adding observer for %@%@", handler, 0x20u);
  }

  v10 = self;
  objc_sync_enter(v10);
  int out_token = 0;
  v11 = [(NSMutableDictionary *)v10->_observersByContainerID objectForKey:v7];
  if (!v11)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    [(NSMutableDictionary *)v10->_observersByContainerID setObject:v11 forKey:v7];
  }
  [v11 addObject:v6];
  objc_super v12 = notifyNameWithPrefixedContainerID(v7);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __50__BRContainersMonitor_addObserver_forContainerID___block_invoke;
  v33[3] = &unk_1E59AE1A8;
  v33[4] = v10;
  id v13 = v7;
  id v34 = v13;
  id v14 = v12;
  id v35 = v14;
  uint64_t v15 = (void *)MEMORY[0x19F3C48D0](v33);
  id v16 = v14;
  id v17 = (const char *)[v16 UTF8String];
  __int16 v18 = v10->_queue;
  id v19 = v15;
  __int16 v20 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v21 = objc_msgSend(v20, "br_currentPersonaID");

  *(void *)handler = MEMORY[0x1E4F143A8];
  *(void *)&handler[8] = 3221225472;
  *(void *)&handler[16] = __br_notify_register_dispatch_block_invoke_1;
  *(void *)&handler[24] = &unk_1E59AD580;
  id v22 = v21;
  id v39 = v22;
  v41 = v17;
  id v23 = v19;
  id v40 = v23;
  notify_register_dispatch(v17, &out_token, v18, handler);

  notifyTokenByContainerID = v10->_notifyTokenByContainerID;
  v25 = [NSNumber numberWithInt:out_token];
  [(NSMutableDictionary *)notifyTokenByContainerID setObject:v25 forKey:v13];

  v26 = brc_bread_crumbs((uint64_t)"-[BRContainersMonitor addObserver:forContainerID:]", 193);
  v27 = brc_default_log(1);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)handler = 67109634;
    *(_DWORD *)&handler[4] = out_token;
    *(_WORD *)&handler[8] = 2112;
    *(void *)&handler[10] = v16;
    *(_WORD *)&handler[18] = 2112;
    *(void *)&handler[20] = v26;
    _os_log_debug_impl(&dword_19ED3F000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] Registered token %d for %@%@", handler, 0x1Cu);
  }

  queue = v10->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__BRContainersMonitor_addObserver_forContainerID___block_invoke_15;
  block[3] = &unk_1E59AE1D0;
  id v31 = v23;
  int v32 = out_token;
  id v29 = v23;
  dispatch_async(queue, block);

  objc_sync_exit(v10);
  __brc_leave_section((uint64_t)v37);
}

void __50__BRContainersMonitor_addObserver_forContainerID___block_invoke(uint64_t a1, int a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = 0;
  id v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  id v6 = (void *)[v5 copy];

  objc_sync_exit(v4);
  brc_notify_get_state(a2, &v22, [*(id *)(a1 + 48) UTF8String]);
  uint64_t v7 = v22;
  v8 = brc_bread_crumbs((uint64_t)"-[BRContainersMonitor addObserver:forContainerID:]_block_invoke", 181);
  dispatch_queue_t v9 = brc_default_log(1);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138413058;
    uint64_t v25 = v16;
    if (v7) {
      id v17 = "foreground";
    }
    else {
      id v17 = "background";
    }
    __int16 v26 = 2080;
    v27 = v17;
    __int16 v28 = 1024;
    int v29 = a2;
    __int16 v30 = 2112;
    id v31 = v8;
    _os_log_debug_impl(&dword_19ED3F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ is now %s for token %d%@", buf, 0x26u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        uint64_t v15 = *(void *)(a1 + 40);
        if (v7) {
          [v14 containerDidEnterForeground:v15];
        }
        else {
          objc_msgSend(v14, "containerDidEnterBackground:", v15, (void)v18);
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v11);
  }
}

uint64_t __50__BRContainersMonitor_addObserver_forContainerID___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

- (void)removeObserver:(id)a3 forContainerID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  dispatch_queue_t v9 = [(NSMutableDictionary *)v8->_observersByContainerID objectForKey:v7];
  if (([v9 containsObject:v6] & 1) == 0)
  {
    uint64_t v12 = brc_bread_crumbs((uint64_t)"-[BRContainersMonitor removeObserver:forContainerID:]", 205);
    uint64_t v13 = brc_default_log(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRContainersMonitor removeObserver:forContainerID:]();
    }
  }
  [v9 removeObject:v6];
  if (![v9 count])
  {
    [(NSMutableDictionary *)v8->_observersByContainerID removeObjectForKey:v7];
    id v10 = [(NSMutableDictionary *)v8->_notifyTokenByContainerID objectForKey:v7];
    int v11 = [v10 intValue];

    notify_cancel(v11);
  }

  objc_sync_exit(v8);
}

+ (BOOL)isContainerIDForeground:(id)a3
{
  id v3 = a3;
  if (!+[BRContainersMonitor isContainerID:v3])
  {
    id v7 = brc_bread_crumbs((uint64_t)"+[BRContainersMonitor isContainerIDForeground:]", 218);
    v8 = brc_default_log(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      +[BRContainersMonitor isContainerIDForeground:]();
    }
  }
  int val = -1;
  uint64_t v9 = 0;
  notifyNameWithPrefixedContainerID(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  brc_notify_register_check((const char *)[v4 UTF8String], &val);
  if (notify_is_valid_token(val))
  {
    brc_notify_get_state(val, &v9, [v4 UTF8String]);
    BOOL v5 = v9 != 0;
    notify_cancel(val);
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notifyTokenByContainerID, 0);

  objc_storeStrong((id *)&self->_observersByContainerID, 0);
}

+ (void)containerIDFromPrimaryIdentifier:secondaryIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] returning %@%@");
}

- (void)removeObserver:forContainerID:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] API MISUSE: removed non existing observer%@", v2, v3, v4, v5, v6);
}

+ (void)isContainerIDForeground:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: [BRContainersMonitor isContainerID:containerID]%@", v2, v3, v4, v5, v6);
}

@end