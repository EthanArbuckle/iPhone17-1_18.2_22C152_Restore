@interface BMStoreSource
+ (id)_processPendingWritesQueue;
- (BMComputeSourceClient)computeSource;
- (BMStoreSource)initWithIdentifier:(id)a3 storeConfig:(id)a4;
- (BMStoreSource)initWithIdentifier:(id)a3 storeConfig:(id)a4 accessClient:(id)a5;
- (BMStoreSource)initWithIdentifier:(id)a3 storeConfig:(id)a4 accessClient:(id)a5 eventDataClass:(Class)a6;
- (BOOL)_writeEvent:(id)a3 timestamp:(double)a4 signpostID:(unint64_t)a5 notifyCompute:(BOOL)a6;
- (BOOL)outOfProcess;
- (void)_processPendingWrites;
- (void)dealloc;
- (void)sendEvent:(id)a3;
- (void)sendEvent:(id)a3 timestamp:(double)a4;
- (void)setOutOfProcess:(BOOL)a3;
@end

@implementation BMStoreSource

- (void)dealloc
{
  if (self->_lockStateRegistration)
  {
    objc_msgSend(MEMORY[0x1E4F4FB58], "unregister:");
    id lockStateRegistration = self->_lockStateRegistration;
    self->_id lockStateRegistration = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)BMStoreSource;
  [(BMStoreSource *)&v4 dealloc];
}

- (void)sendEvent:(id)a3 timestamp:(double)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  context = (void *)MEMORY[0x192FB0D60]();
  v8 = _os_activity_create(&dword_18E67D000, "BMStoreSource.sendEvent", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  uint64_t v9 = [(BMSource *)self identifier];
  v10 = (void *)v9;
  v11 = @"unknown";
  if (v9) {
    v11 = (__CFString *)v9;
  }
  v12 = v11;

  v13 = __biome_log_for_category();
  os_signpost_id_t v14 = os_signpost_id_generate(v13);

  v15 = __biome_log_for_category();
  v16 = v15;
  unint64_t v17 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_DWORD *)buf = 138412290;
    v48 = v12;
    _os_signpost_emit_with_name_impl(&dword_18E67D000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "SendEvent", "StreamIdentifier=%@", buf, 0xCu);
  }

  v18 = __biome_log_for_category();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = [(BMSource *)self identifier];
    [(BMStoreSource *)v19 sendEvent:v18 timestamp:a4];
  }

  if (([v6 conformsToProtocol:&unk_1EDDD9B28] & 1) == 0)
  {
    v20 = __biome_log_for_category();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = [(BMSource *)self identifier];
      v22 = NSStringFromProtocol((Protocol *)&unk_1EDDD9B28);
      [(BMStoreSource *)v21 sendEvent:v45 timestamp:v20];
    }

    v23 = __biome_log_for_category();
    v24 = v23;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      *(_DWORD *)v43 = 138412290;
      v44 = v12;
      _os_signpost_emit_with_name_impl(&dword_18E67D000, v24, OS_SIGNPOST_INTERVAL_END, v14, "SendEvent", "StreamIdentifier=%@", v43, 0xCu);
    }
    goto LABEL_29;
  }
  if (self->_pendingWrites || ([(BMStreamDatastoreWriter *)self->_writer isDataAccessible] & 1) == 0)
  {
    v25 = __biome_log_for_category();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v45 = 138412290;
      v46 = v12;
      _os_log_impl(&dword_18E67D000, v25, OS_LOG_TYPE_DEFAULT, "Unable to access data, storing donation to %@ in memory until device unlocks", v45, 0xCu);
    }

    v24 = +[BMPendingWrite pendingWriteWithEvent:v6 timestamp:a4];
    pendingWrites = self->_pendingWrites;
    if (pendingWrites)
    {
      [(NSMutableArray *)pendingWrites addObject:v24];
    }
    else
    {
      v27 = (NSMutableArray *)objc_opt_new();
      v28 = self->_pendingWrites;
      self->_pendingWrites = v27;

      [(NSMutableArray *)self->_pendingWrites addObject:v24];
      v29 = (OS_os_transaction *)os_transaction_create();
      transaction = self->_transaction;
      self->_transaction = v29;

      v31 = (void *)MEMORY[0x1E4F4FB58];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __37__BMStoreSource_sendEvent_timestamp___block_invoke;
      aBlock[3] = &unk_1E55D7A90;
      aBlock[4] = self;
      v32 = _Block_copy(aBlock);
      v33 = [v31 registerForLockStateChanges:v32];
      id lockStateRegistration = self->_lockStateRegistration;
      self->_id lockStateRegistration = v33;

      if ([MEMORY[0x1E4F93B10] isUnlocked]) {
        [(BMStoreSource *)self _processPendingWrites];
      }
    }
    v35 = [(BMStoreSource *)self computeSource];

    if (v35)
    {
      v36 = [(BMStoreSource *)self computeSource];
      v37 = [(BMStoreConfig *)self->_config account];
      v38 = [(BMStoreConfig *)self->_config remoteName];
      [v36 sendEvent:v6 account:v37 remoteName:v38 timestamp:v14 signpostID:1 sendFullEvent:a4];
    }
    else
    {
      v39 = __biome_log_for_category();
      v36 = v39;
      if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
      {
        *(_DWORD *)v45 = 138412290;
        v46 = v12;
        _os_signpost_emit_with_name_impl(&dword_18E67D000, v36, OS_SIGNPOST_INTERVAL_END, v14, "SendEvent", "StreamIdentifier=%@", v45, 0xCu);
      }
    }

LABEL_29:
    goto LABEL_30;
  }
  [(BMStoreSource *)self _writeEvent:v6 timestamp:v14 signpostID:1 notifyCompute:a4];
LABEL_30:

  os_activity_scope_leave(&state);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_writeEvent:(id)a3 timestamp:(double)a4 signpostID:(unint64_t)a5 notifyCompute:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  v11 = (void *)MEMORY[0x192FB0D60]();
  uint64_t v12 = [(BMSource *)self identifier];
  v13 = (void *)v12;
  os_signpost_id_t v14 = @"unknown";
  if (v12) {
    os_signpost_id_t v14 = (__CFString *)v12;
  }
  v15 = v14;

  unint64_t v26 = 0;
  uint64_t v16 = [(BMStreamDatastoreWriter *)self->_writer writeEventWithEventBody:v10 timestamp:&v26 outEventSize:a4];
  if (v16)
  {
    unint64_t v17 = [(BMStoreSource *)self computeSource];

    if (v17 && v6)
    {
      v18 = [(BMStoreSource *)self computeSource];
      v19 = [(BMStoreConfig *)self->_config account];
      v20 = [(BMStoreConfig *)self->_config remoteName];
      [v18 sendEvent:v10 account:v19 remoteName:v20 timestamp:a5 signpostID:0 sendFullEvent:a4];

LABEL_16:
      goto LABEL_17;
    }
  }
  else
  {
    v21 = __biome_log_for_category();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[BMStoreSource _writeEvent:timestamp:signpostID:notifyCompute:](v21);
    }
  }
  v22 = __biome_log_for_category();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
    -[BMStoreSource _writeEvent:timestamp:signpostID:notifyCompute:]((uint64_t)v15, v22);
  }

  if (a5)
  {
    v23 = __biome_log_for_category();
    v18 = v23;
    if (a5 != -1 && os_signpost_enabled(v23))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_signpost_emit_with_name_impl(&dword_18E67D000, v18, OS_SIGNPOST_INTERVAL_END, a5, "SendEvent", "StreamIdentifier=%@", buf, 0xCu);
    }
    goto LABEL_16;
  }
LABEL_17:
  if (self->_shouldSendMetrics)
  {
    if (v26 >= 0xFFFFFFFF) {
      uint64_t v24 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v24 = v26;
    }
    [MEMORY[0x1E4F4FB50] sendAllStreamsEventWritten:v16 size:v24 streamIdentifier:v15];
  }

  return v16;
}

- (BMComputeSourceClient)computeSource
{
  return self->_computeSource;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  [(BMStoreSource *)self sendEvent:v4 timestamp:CFAbsoluteTimeGetCurrent()];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_computeSource, 0);
  objc_storeStrong(&self->_lockStateRegistration, 0);
  objc_storeStrong((id *)&self->_pendingWrites, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_accessClient, 0);
  objc_storeStrong((id *)&self->_config, 0);

  objc_storeStrong((id *)&self->_writer, 0);
}

- (BMStoreSource)initWithIdentifier:(id)a3 storeConfig:(id)a4 accessClient:(id)a5 eventDataClass:(Class)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v31.receiver = self;
  v31.super_class = (Class)BMStoreSource;
  v13 = [(BMSource *)&v31 initWithIdentifier:v10];
  os_signpost_id_t v14 = v13;
  if (!v13) {
    goto LABEL_19;
  }
  v13->_lock._os_unfair_lock_opaque = 0;
  objc_storeStrong((id *)&v13->_config, a4);
  v14->_eventDataClass = a6;
  if (![v11 isManaged])
  {
    LOBYTE(v18) = 3;
    goto LABEL_6;
  }
  v15 = (void *)MEMORY[0x1E4F4FB38];
  uint64_t v16 = [MEMORY[0x1E4F4FB80] current];
  unint64_t v17 = [v15 policyForProcess:v16 connectionFlags:0 useCase:*MEMORY[0x1E4F4FB20]];

  uint64_t v18 = [v17 allowedModeForStream:v10];
  if (v18 != 2)
  {
LABEL_6:
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F502A0]) initWithStream:v10 config:v11 eventDataClass:a6];
    writer = v14->_writer;
    v14->_writer = (BMStreamDatastoreWriter *)v21;
    goto LABEL_7;
  }
  uint64_t v19 = objc_msgSend(MEMORY[0x1E4F502A0], "outOfProcessWriterForStream:user:eventDataClass:", v10, objc_msgSend(v11, "uid"), a6);
  writer = v14->_writer;
  v14->_writer = (BMStreamDatastoreWriter *)v19;
  LOBYTE(v18) = 2;
LABEL_7:

  if ([v11 isManaged] && (v18 & 2) != 0)
  {
    id v22 = v10;
    if (([v11 storeLocationOption] & 4) != 0)
    {
      v23 = @":subscriptions";
    }
    else
    {
      if (([v11 storeLocationOption] & 2) == 0)
      {
LABEL_14:
        v25 = [BMComputeSourceClient alloc];
        uint64_t v26 = [v11 domain];
        uint64_t v27 = [(BMComputeSourceClient *)v25 initWithStreamIdentifier:v22 domain:v26 useCase:*MEMORY[0x1E4F4FB20]];
        computeSource = v14->_computeSource;
        v14->_computeSource = (BMComputeSourceClient *)v27;

        goto LABEL_15;
      }
      v23 = @":tombstones";
    }
    uint64_t v24 = [v22 stringByAppendingString:v23];

    id v22 = (id)v24;
    goto LABEL_14;
  }
LABEL_15:
  objc_storeStrong((id *)&v14->_accessClient, a5);
  if ([(BMStoreConfig *)v14->_config isManaged]) {
    char v29 = [MEMORY[0x1E4F4FB78] isTestPathOverridden] ^ 1;
  }
  else {
    char v29 = 0;
  }
  v14->_shouldSendMetrics = v29;
LABEL_19:

  return v14;
}

- (BMStoreSource)initWithIdentifier:(id)a3 storeConfig:(id)a4
{
  return [(BMStoreSource *)self initWithIdentifier:a3 storeConfig:a4 accessClient:0];
}

- (BMStoreSource)initWithIdentifier:(id)a3 storeConfig:(id)a4 accessClient:(id)a5
{
  return [(BMStoreSource *)self initWithIdentifier:a3 storeConfig:a4 accessClient:a5 eventDataClass:0];
}

- (BOOL)outOfProcess
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  char v4 = [v3 containsString:@"OutOfProcess"];

  return v4;
}

- (void)setOutOfProcess:(BOOL)a3
{
  if (a3)
  {
    char v4 = __biome_log_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[BMStoreSource setOutOfProcess:](v4);
    }

    if (![(BMStoreSource *)self outOfProcess])
    {
      v5 = (void *)MEMORY[0x1E4F502A0];
      BOOL v6 = [(BMSource *)self identifier];
      objc_msgSend(v5, "outOfProcessWriterForStream:user:eventDataClass:", v6, -[BMStoreConfig uid](self->_config, "uid"), self->_eventDataClass);
      v7 = (BMStreamDatastoreWriter *)objc_claimAutoreleasedReturnValue();
      writer = self->_writer;
      self->_writer = v7;
    }
  }
  else if ([(BMStoreSource *)self outOfProcess])
  {
    id v9 = objc_alloc(MEMORY[0x1E4F502A0]);
    id v12 = [(BMSource *)self identifier];
    id v10 = (BMStreamDatastoreWriter *)[v9 initWithStream:v12 config:self->_config eventDataClass:self->_eventDataClass];
    id v11 = self->_writer;
    self->_writer = v10;
  }
}

+ (id)_processPendingWritesQueue
{
  if (_processPendingWritesQueue_onceToken != -1) {
    dispatch_once(&_processPendingWritesQueue_onceToken, &__block_literal_global_14);
  }
  v2 = (void *)_processPendingWritesQueue_queue;

  return v2;
}

void __43__BMStoreSource__processPendingWritesQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.biome.pending-writes", v2);
  v1 = (void *)_processPendingWritesQueue_queue;
  _processPendingWritesQueue_queue = (uint64_t)v0;
}

void __37__BMStoreSource_sendEvent_timestamp___block_invoke(uint64_t a1, int a2)
{
  char v4 = [(id)objc_opt_class() _processPendingWritesQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__BMStoreSource_sendEvent_timestamp___block_invoke_2;
  v5[3] = &unk_1E55D7A68;
  int v6 = a2;
  v5[4] = *(void *)(a1 + 32);
  dispatch_async(v4, v5);
}

void __37__BMStoreSource_sendEvent_timestamp___block_invoke_2(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 40);
  if (v1 == 3 || v1 == 0)
  {
    char v4 = (os_unfair_lock_s *)(*(void *)(a1 + 32) + 52);
    os_unfair_lock_lock(v4);
    [*(id *)(a1 + 32) _processPendingWrites];
    os_unfair_lock_unlock(v4);
  }
}

- (void)_processPendingWrites
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_pendingWrites)
  {
    v3 = __biome_log_for_category();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [(NSMutableArray *)self->_pendingWrites count];
      v5 = [(BMSource *)self identifier];
      *(_DWORD *)buf = 134218242;
      uint64_t v25 = v4;
      __int16 v26 = 2112;
      uint64_t v27 = v5;
      _os_log_impl(&dword_18E67D000, v3, OS_LOG_TYPE_DEFAULT, "Device has unlocked, proceeding with %lu queued writes to stream %@", buf, 0x16u);
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    int v6 = (void *)[(NSMutableArray *)self->_pendingWrites copy];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
LABEL_6:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
        id v12 = [v11 event];
        [v11 timestamp];
        BOOL v13 = -[BMStoreSource _writeEvent:timestamp:signpostID:notifyCompute:](self, "_writeEvent:timestamp:signpostID:notifyCompute:", v12, 0, 0);

        int v14 = [(BMStreamDatastoreWriter *)self->_writer isDataAccessible];
        int v15 = v14;
        if (v13 || v14) {
          [(NSMutableArray *)self->_pendingWrites removeObject:v11];
        }
        if (!v15) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
          if (v8) {
            goto LABEL_6;
          }
          break;
        }
      }
    }

    if (![(NSMutableArray *)self->_pendingWrites count])
    {
      [MEMORY[0x1E4F4FB58] unregister:self->_lockStateRegistration];
      id lockStateRegistration = self->_lockStateRegistration;
      self->_id lockStateRegistration = 0;

      pendingWrites = self->_pendingWrites;
      self->_pendingWrites = 0;

      transaction = self->_transaction;
      self->_transaction = 0;
    }
  }
}

- (void)setOutOfProcess:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "Configuring source for out-of-process writes", v1, 2u);
}

- (void)sendEvent:(uint8_t *)buf timestamp:(os_log_t)log .cold.1(void *a1, void *a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Wrong event type sent to source %@ expecting event conforms to %@", buf, 0x16u);
}

- (void)sendEvent:(os_log_t)log timestamp:(double)a4 .cold.2(void *a1, uint8_t *buf, os_log_t log, double a4)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(double *)(buf + 14) = a4;
  _os_log_debug_impl(&dword_18E67D000, log, OS_LOG_TYPE_DEBUG, "Event donation to stream: %@ with timestamp: %lf", buf, 0x16u);
}

- (void)_writeEvent:(uint64_t)a1 timestamp:(NSObject *)a2 signpostID:notifyCompute:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_18E67D000, a2, OS_LOG_TYPE_DEBUG, "Not notifyng biomed of new event in %@", (uint8_t *)&v2, 0xCu);
}

- (void)_writeEvent:(os_log_t)log timestamp:signpostID:notifyCompute:.cold.2(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_18E67D000, log, OS_LOG_TYPE_ERROR, "Error saving biome store event", v1, 2u);
}

@end