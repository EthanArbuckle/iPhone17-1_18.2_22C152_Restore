@interface BRQueryItemProgressObserver
- (BRQueryItem)item;
- (BRQueryItemProgressObserver)initWithItem:(id)a3;
- (id)description;
- (id)progressHandler;
- (void)_stopObserving;
- (void)_subscribe;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setProgressHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation BRQueryItemProgressObserver

- (BRQueryItemProgressObserver)initWithItem:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BRQueryItemProgressObserver;
  v5 = [(BRQueryItemProgressObserver *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    item = v5->_item;
    v5->_item = (BRQueryItem *)v6;
  }
  return v5;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: _subscriber == nil%@", v2, v3, v4, v5, v6);
}

- (id)description
{
  uint64_t v3 = self->_item;
  objc_sync_enter(v3);
  uint64_t v4 = NSString;
  uint64_t v5 = objc_opt_class();
  uint8_t v6 = [(BRQueryItem *)self->_item fileObjectID];
  uint64_t v7 = [v6 rawID];
  v8 = [(BRQueryItem *)self->_item logicalName];
  objc_super v9 = [v4 stringWithFormat:@"<%@:%p %lld \"%@\">", v5, self, v7, v8];

  objc_sync_exit(v3);

  return v9;
}

- (void)setQueue:(id)a3
{
  uint64_t v5 = (OS_dispatch_queue *)a3;
  queue = self->_queue;
  p_queue = &self->_queue;
  if (queue != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_queue, a3);
    uint64_t v5 = v8;
  }
}

- (void)_stopObserving
{
  [(NSProgress *)self->_progress removeObserver:self forKeyPath:@"fractionCompleted" context:self->_item];
  progress = self->_progress;
  self->_progress = 0;
}

- (void)_subscribe
{
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke;
  v15[3] = &unk_1E59AD3B0;
  v15[4] = self;
  uint64_t v3 = (void *)MEMORY[0x19F3C48D0](v15, a2);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke_7;
  v13[3] = &unk_1E59AF158;
  v13[4] = self;
  id v14 = v3;
  id v4 = v3;
  uint64_t v5 = (void *)MEMORY[0x19F3C48D0](v13);
  uint8_t v6 = [(BRQueryItem *)self->_item url];
  uint64_t v7 = fileProgressSubscribeQueue();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke_10;
  v10[3] = &unk_1E59AF180;
  v10[4] = self;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke_2;
  block[3] = &unk_1E59AD3B0;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __41__BRQueryItemProgressObserver__subscribe__block_invoke_2(uint64_t result)
{
  uint64_t v1 = (id *)(result + 32);
  if (*(unsigned char *)(*(void *)(result + 32) + 40))
  {
    uint64_t v2 = brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver _subscribe]_block_invoke_2", 84);
    uint64_t v3 = brc_default_log(1);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __41__BRQueryItemProgressObserver__subscribe__block_invoke_2_cold_1();
    }

    return [*v1 _stopObserving];
  }
  return result;
}

id __41__BRQueryItemProgressObserver__subscribe__block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver _subscribe]_block_invoke", 89);
  uint64_t v5 = brc_default_log(1);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = v11;
    __int16 v16 = 2112;
    id v17 = v3;
    __int16 v18 = 2112;
    v19 = v4;
    _os_log_debug_impl(&dword_19ED3F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: received %@%@", buf, 0x20u);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(NSObject **)(v6 + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke_8;
  v12[3] = &unk_1E59AD648;
  v12[4] = v6;
  id v13 = v3;
  id v8 = v3;
  dispatch_async(v7, v12);
  id v9 = (void *)MEMORY[0x19F3C48D0](*(void *)(a1 + 40));

  return v9;
}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke_8(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 40))
  {
    id v4 = *(void **)(v1 + 32);
    if (v4)
    {
      if ([v4 isEqual:*(void *)(a1 + 40)]) {
        return;
      }
      uint64_t v5 = brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver _subscribe]_block_invoke", 100);
      uint64_t v6 = brc_default_log(1);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        __41__BRQueryItemProgressObserver__subscribe__block_invoke_8_cold_1();
      }

      [*v2 _stopObserving];
    }
    uint64_t v7 = [*(id *)(a1 + 40) userInfo];
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
    [*(id *)(*(void *)(a1 + 32) + 32) addObserver:*(void *)(a1 + 32) forKeyPath:@"fractionCompleted" options:5 context:*(void *)(*(void *)(a1 + 32) + 8)];
    id v8 = [v7 objectForKey:*MEMORY[0x1E4F28868]];
    if (v8)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        *((unsigned char *)*v2 + 41) = [v8 isEqualToString:*MEMORY[0x1E4F28880]];
      }
      else
      {
        id v9 = brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver _subscribe]_block_invoke", 115);
        v10 = brc_default_log(1);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138412802;
          id v13 = (id)objc_opt_class();
          __int16 v14 = 2112;
          uint64_t v15 = v8;
          __int16 v16 = 2112;
          id v17 = v9;
          id v11 = v13;
          _os_log_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] can't determine kind of operation (expected: NSString, actual: %@); %@%@",
            (uint8_t *)&v12,
            0x20u);
        }
      }
    }
  }
}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke_10(void *a1)
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  uint64_t v2 = a1[4];
  id v3 = *(NSObject **)(v2 + 16);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__BRQueryItemProgressObserver__subscribe__block_invoke_2_11;
  v9[3] = &unk_1E59AE180;
  v9[4] = v2;
  v9[5] = &v10;
  dispatch_sync(v3, v9);
  if (*((unsigned char *)v11 + 24))
  {
    uint64_t v4 = [MEMORY[0x1E4F28F90] addSubscriberForFileURL:a1[5] usingBlock:a1[6]];
    uint64_t v5 = a1[4];
    if (*(void *)(v5 + 24))
    {
      uint64_t v7 = brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver _subscribe]_block_invoke", 133);
      id v8 = brc_default_log(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
        __41__BRQueryItemProgressObserver__subscribe__block_invoke_10_cold_1();
      }

      uint64_t v5 = a1[4];
    }
    uint64_t v6 = *(void **)(v5 + 24);
    *(void *)(v5 + 24) = v4;
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __41__BRQueryItemProgressObserver__subscribe__block_invoke_2_11(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)stop
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] %@: stopping%@");
}

void __35__BRQueryItemProgressObserver_stop__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 24))
  {
    objc_msgSend(MEMORY[0x1E4F28F90], "_removeSubscriber:");
    uint64_t v2 = *(void *)(a1 + 32);
    id v3 = *(void **)(v2 + 24);
    *(void *)(v2 + 24) = 0;
  }
}

- (void)start
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] UNREACHABLE: started twice%@", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (self->_item == a6)
  {
    char v13 = (NSProgress *)v11;
    if (self->_progress != v13)
    {
      id v17 = brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver observeValueForKeyPath:ofObject:change:context:]", 180);
      uint64_t v18 = brc_default_log(0);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
        -[BRQueryItemProgressObserver observeValueForKeyPath:ofObject:change:context:]();
      }
    }
    [(NSProgress *)v13 fractionCompleted];
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_1E59AF1A8;
    uint64_t v21 = v15;
    block[4] = self;
    uint64_t v20 = v13;
    __int16 v16 = v13;
    dispatch_async(queue, block);
  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)BRQueryItemProgressObserver;
    [(BRQueryItemProgressObserver *)&v22 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

uint64_t __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t result)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 40))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(void **)(v1 + 8);
    if (*(unsigned char *)(v1 + 41)) {
      uint64_t v4 = (void *)MEMORY[0x1E4F286D8];
    }
    else {
      uint64_t v4 = (void *)MEMORY[0x1E4F286D0];
    }
    uint64_t v5 = [v3 attributeForName:*v4];
    [v5 doubleValue];
    double v7 = v6 / 100.0;

    double v8 = *(double *)(v2 + 48);
    if (round(v8 * 1000.0) != round(v7 * 1000.0))
    {
      id v9 = brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver observeValueForKeyPath:ofObject:change:context:]_block_invoke", 190);
      id v10 = brc_default_log(1);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v14 = *(void *)(v2 + 32);
        uint64_t v15 = [*(id *)(v2 + 40) localizedAdditionalDescription];
        int v20 = 138412802;
        uint64_t v21 = v14;
        __int16 v22 = 2112;
        v23 = v15;
        __int16 v24 = 2112;
        v25 = v9;
        _os_log_debug_impl(&dword_19ED3F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: changed to %@%@", (uint8_t *)&v20, 0x20u);
      }
      double v8 = *(double *)(v2 + 48);
    }
    if (v8 > 1.0)
    {
      __int16 v16 = brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver observeValueForKeyPath:ofObject:change:context:]_block_invoke", 192);
      id v17 = brc_default_log(0);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_2();
      }

      double v8 = *(double *)(v2 + 48);
    }
    if (v8 < 0.0)
    {
      uint64_t v18 = brc_bread_crumbs((uint64_t)"-[BRQueryItemProgressObserver observeValueForKeyPath:ofObject:change:context:]_block_invoke", 193);
      v19 = brc_default_log(0);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1();
      }

      double v8 = *(double *)(v2 + 48);
    }
    id v11 = *(void **)(*(void *)(v2 + 32) + 8);
    id v12 = [NSNumber numberWithDouble:v8 * 100.0];
    if (*(unsigned char *)(*(void *)(v2 + 32) + 41)) {
      char v13 = kBRQueryItemULPercentKey;
    }
    else {
      char v13 = kBRQueryItemDLPercentKey;
    }
    [v11 setAttribute:v12 forKey:*v13];

    return (*(uint64_t (**)(void))(*(void *)(*(void *)(v2 + 32) + 48) + 16))();
  }
  return result;
}

- (BRQueryItem)item
{
  return self->_item;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong(&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_item, 0);
}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] %@: remove observer from unpublished progress%@");
}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke_8_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] %@: remove observer from stale progress%@");
}

void __41__BRQueryItemProgressObserver__subscribe__block_invoke_10_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: self->_subscriber == nil%@", v2, v3, v4, v5, v6);
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: progress == _progress%@", v2, v3, v4, v5, v6);
}

void __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: fractionCompleted >= 0%@", v2, v3, v4, v5, v6);
}

void __78__BRQueryItemProgressObserver_observeValueForKeyPath_ofObject_change_context___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_19ED3F000, v0, v1, "[CRIT] Assertion failed: fractionCompleted <= 1%@", v2, v3, v4, v5, v6);
}

@end