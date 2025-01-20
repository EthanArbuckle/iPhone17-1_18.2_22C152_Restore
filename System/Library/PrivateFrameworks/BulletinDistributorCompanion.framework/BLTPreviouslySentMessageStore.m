@interface BLTPreviouslySentMessageStore
- (BLTPreviouslySentMessageStore)initWithMessageStorePath:(id)a3;
- (BOOL)dirty;
- (BOOL)isEmpty;
- (id)messageDigestForUnsentMessage:(id)a3 messageKey:(id)a4;
- (void)_cancelSave;
- (void)_enqueueSave;
- (void)_save;
- (void)clear;
- (void)dealloc;
- (void)invalidate;
- (void)recordMessageDigestAsPreviouslySent:(id)a3 messageKey:(id)a4;
- (void)removeDigestForKey:(id)a3;
- (void)setDirty:(BOOL)a3;
@end

@implementation BLTPreviouslySentMessageStore

- (BLTPreviouslySentMessageStore)initWithMessageStorePath:(id)a3
{
  id v5 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BLTPreviouslySentMessageStore;
  v6 = [(BLTPreviouslySentMessageStore *)&v26 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    v8 = (void *)MEMORY[0x263EFFA08];
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v12 = [MEMORY[0x263F08850] defaultManager];
    v13 = [v12 contentsAtPath:v5];

    id v25 = 0;
    v14 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v13 error:&v25];
    id v15 = v25;
    if (v15)
    {
      v16 = blt_general_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[BLTPreviouslySentMessageStore initWithMessageStorePath:]((uint64_t)v15, v16);
      }
    }
    uint64_t v17 = [v14 decodeObjectOfClasses:v11 forKey:*MEMORY[0x263F081D0]];
    messageDigests = v7->_messageDigests;
    v7->_messageDigests = (NSMutableDictionary *)v17;

    if (!v7->_messageDigests)
    {
      v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      v20 = v7->_messageDigests;
      v7->_messageDigests = v19;
    }
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.bulletindistributor.previouslysentmessagestore", v21);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v22;
  }
  return v7;
}

- (id)messageDigestForUnsentMessage:(id)a3 messageKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__11;
  v21 = __Block_byref_object_dispose__11;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __74__BLTPreviouslySentMessageStore_messageDigestForUnsentMessage_messageKey___block_invoke;
  v13[3] = &unk_2646845B8;
  v13[4] = self;
  id v14 = v7;
  id v15 = v6;
  v16 = &v17;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __74__BLTPreviouslySentMessageStore_messageDigestForUnsentMessage_messageKey___block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKey:*(void *)(a1 + 40)];
  v2 = [[BLTMessageDigest alloc] initWithMessage:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isEqual:v8])
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = 0;
  }
  else
  {
    id v7 = v8;
    if (!v8) {
      goto LABEL_6;
    }
    [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setDirty:1];
  }
  id v7 = v8;
LABEL_6:
}

- (void)recordMessageDigestAsPreviouslySent:(id)a3 messageKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __80__BLTPreviouslySentMessageStore_recordMessageDigestAsPreviouslySent_messageKey___block_invoke;
  block[3] = &unk_264683E78;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, block);
}

uint64_t __80__BLTPreviouslySentMessageStore_recordMessageDigestAsPreviouslySent_messageKey___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 8) setObject:a1[5] forKey:a1[6]];
  v2 = (void *)a1[4];
  return [v2 setDirty:1];
}

- (void)removeDigestForKey:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__BLTPreviouslySentMessageStore_removeDigestForKey___block_invoke;
  v7[3] = &unk_264683BB0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __52__BLTPreviouslySentMessageStore_removeDigestForKey___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeObjectForKey:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 setDirty:1];
}

- (void)invalidate
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__BLTPreviouslySentMessageStore_invalidate__block_invoke;
  block[3] = &unk_264683BD8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __43__BLTPreviouslySentMessageStore_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _save];
}

- (void)dealloc
{
  [(BLTPreviouslySentMessageStore *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)BLTPreviouslySentMessageStore;
  [(BLTPreviouslySentMessageStore *)&v3 dealloc];
}

- (void)clear
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__BLTPreviouslySentMessageStore_clear__block_invoke;
  block[3] = &unk_264683BD8;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __38__BLTPreviouslySentMessageStore_clear__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
  v2 = *(void **)(a1 + 32);
  return [v2 _save];
}

- (BOOL)isEmpty
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__BLTPreviouslySentMessageStore_isEmpty__block_invoke;
  v5[3] = &unk_264683E00;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __40__BLTPreviouslySentMessageStore_isEmpty__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

- (void)_save
{
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0(&dword_222F4C000, v0, v1, "Exception %@ archiving to %@");
}

- (void)_enqueueSave
{
  [(BLTPreviouslySentMessageStore *)self _cancelSave];
  objc_super v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  saveTimer = self->_saveTimer;
  self->_saveTimer = v3;

  uint64_t v5 = self->_saveTimer;
  dispatch_time_t v6 = dispatch_time(0, 2000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0);
  id v7 = self->_saveTimer;
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __45__BLTPreviouslySentMessageStore__enqueueSave__block_invoke;
  handler[3] = &unk_264683BD8;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume((dispatch_object_t)self->_saveTimer);
}

void __45__BLTPreviouslySentMessageStore__enqueueSave__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _save];
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

- (void)_cancelSave
{
  saveTimer = self->_saveTimer;
  if (saveTimer) {
    dispatch_source_cancel(saveTimer);
  }
}

- (void)setDirty:(BOOL)a3
{
  if (self->_dirty != a3 && a3) {
    [(BLTPreviouslySentMessageStore *)self _enqueueSave];
  }
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_saveTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_messageDigests, 0);
}

- (void)initWithMessageStorePath:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)objc_super v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0(&dword_222F4C000, a2, a3, "Exception %@ unarchiving %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)initWithMessageStorePath:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_222F4C000, a2, OS_LOG_TYPE_ERROR, "Error initializing unarchiver for previously sent message store: %@", (uint8_t *)&v2, 0xCu);
}

@end