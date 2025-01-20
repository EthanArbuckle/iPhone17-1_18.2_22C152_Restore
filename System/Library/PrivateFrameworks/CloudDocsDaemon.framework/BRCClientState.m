@interface BRCClientState
- (BOOL)hasStateChangesAndClearSaveStatusWithResultingState:(id *)a3;
- (BRCClientState)init;
- (BRCClientState)initWithDictionary:(id)a3 clientStateData:(id)a4;
- (id)_prepareToSaveStateData;
- (id)_stateToData;
- (id)description;
- (id)dictionary;
- (id)objectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation BRCClientState

- (BRCClientState)init
{
  return [(BRCClientState *)self initWithDictionary:MEMORY[0x1E4F1CC08] clientStateData:0];
}

- (BRCClientState)initWithDictionary:(id)a3 clientStateData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)BRCClientState;
  v8 = [(BRCClientState *)&v16 init];
  if (v8)
  {
    if (!v6) {
      id v6 = (id)MEMORY[0x1E4F1CC08];
    }
    uint64_t v9 = [v6 mutableCopy];
    dict = v8->_dict;
    v8->_dict = (NSMutableDictionary *)v9;

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("client-state", v12);

    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v13;

    if (!v7) {
      v8->_needsSave = 1;
    }
    objc_storeStrong((id *)&v8->_originalState, a4);
  }

  return v8;
}

- (id)dictionary
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__58;
  v10 = __Block_byref_object_dispose__58;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __28__BRCClientState_dictionary__block_invoke;
  v5[3] = &unk_1E6996218;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __28__BRCClientState_dictionary__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_stateToData
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dict = self->_dict;
  id v10 = 0;
  v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:dict requiringSecureCoding:1 error:&v10];
  if (v10)
  {
    abc_report_panic_with_signature();
    uint64_t v6 = [NSString stringWithFormat:@"Unexpected error while converting client state to data!"];
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      __48__BRCDaemon_listener_shouldAcceptNewConnection___block_invoke_130_cold_1(v6, (uint64_t)v7, v8);
    }

    brc_append_system_info_to_message();
    uint64_t v9 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCClientState _stateToData]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCClientState.m", 54, v9);
  }
  return v4;
}

- (id)_prepareToSaveStateData
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  originalState = [(BRCClientState *)self _stateToData];
  if (self->_needsSave || ![(NSData *)self->_originalState isEqualToData:originalState])
  {
    v4 = originalState;
    originalState = self->_originalState;
    self->_originalState = v4;
  }
  else
  {
    v4 = 0;
  }

  self->_needsSave = 0;
  return v4;
}

- (BOOL)hasStateChangesAndClearSaveStatusWithResultingState:(id *)a3
{
  if (!a3)
  {
    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCClientState hasStateChangesAndClearSaveStatusWithResultingState:]((uint64_t)v8, v9);
    }
  }
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__58;
  v15 = __Block_byref_object_dispose__58;
  id v16 = 0;
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__BRCClientState_hasStateChangesAndClearSaveStatusWithResultingState___block_invoke;
  v10[3] = &unk_1E6996218;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(queue, v10);
  if (a3) {
    *a3 = (id) v12[5];
  }
  BOOL v6 = v12[5] != 0;
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __70__BRCClientState_hasStateChangesAndClearSaveStatusWithResultingState___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _prepareToSaveStateData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__58;
  id v16 = __Block_byref_object_dispose__58;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__BRCClientState_objectForKey___block_invoke;
  block[3] = &unk_1E69936C0;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __31__BRCClientState_objectForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 8) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__BRCClientState_setObject_forKey___block_invoke;
  block[3] = &unk_1E6993600;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

uint64_t __35__BRCClientState_setObject_forKey___block_invoke(void *a1)
{
  *(unsigned char *)(a1[4] + 24) = 1;
  return [*(id *)(a1[4] + 8) setObject:a1[6] forKeyedSubscript:a1[5]];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(BRCClientState *)self dictionary];
  id v6 = [v3 stringWithFormat:@"<%@ %p, %@>", v4, self, v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalState, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

- (void)hasStateChangesAndClearSaveStatusWithResultingState:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: data%@", (uint8_t *)&v2, 0xCu);
}

@end