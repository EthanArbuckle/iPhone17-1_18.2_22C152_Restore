@interface _SYMessageTimerTable
- (_SYMessageTimerTable)init;
- (_SYMessageTimerTable)initWithQueue:(id)a3 timerCallback:(id)a4;
- (unint64_t)timerCount;
- (void)_cleanupTimerForSeqno:(unint64_t)a3;
- (void)_fireCallbackForSeqno:(unint64_t)a3;
- (void)addTimerWithFireDate:(id)a3 forSequenceNumber:(unint64_t)a4;
- (void)cancelAllTimers;
- (void)cancelTimerForIdentifier:(id)a3;
- (void)cancelTimerForSequenceNumber:(unint64_t)a3;
- (void)dealloc;
- (void)setIdentifier:(id)a3 forSequenceNumber:(unint64_t)a4;
@end

@implementation _SYMessageTimerTable

- (_SYMessageTimerTable)init
{
  v4 = (void *)MEMORY[0x263EFF940];
  uint64_t v5 = *MEMORY[0x263EFF498];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  [v4 raise:v5, @"Do not call -[%@ %@]", v7, v8 format];

  return 0;
}

- (_SYMessageTimerTable)initWithQueue:(id)a3 timerCallback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)_SYMessageTimerTable;
  v9 = [(_SYMessageTimerTable *)&v22 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [v8 copy];
    id callback = v10->_callback;
    v10->_id callback = (id)v11;

    v13 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x263EF83A8], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v14 = dispatch_queue_create("_SYTimerMessageTable", v13);
    rwlock = v10->_rwlock;
    v10->_rwlock = (OS_dispatch_queue *)v14;

    uint64_t v16 = objc_opt_new();
    bySeqno = v10->_bySeqno;
    v10->_bySeqno = (NSMutableDictionary *)v16;

    uint64_t v18 = objc_opt_new();
    byIdent = v10->_byIdent;
    v10->_byIdent = (NSMutableDictionary *)v18;

    v20 = v10;
  }

  return v10;
}

- (void)dealloc
{
  rwlock = self->_rwlock;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __31___SYMessageTimerTable_dealloc__block_invoke;
  block[3] = &unk_264422AB0;
  block[4] = self;
  dispatch_barrier_sync(rwlock, block);
  v4.receiver = self;
  v4.super_class = (Class)_SYMessageTimerTable;
  [(_SYMessageTimerTable *)&v4 dealloc];
}

- (void)addTimerWithFireDate:(id)a3 forSequenceNumber:(unint64_t)a4
{
  [a3 timeIntervalSinceNow];
  dispatch_time_t v7 = dispatch_walltime(0, (uint64_t)(v6 * 1000000000.0));
  id v8 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke;
  handler[3] = &unk_264424368;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a4;
  dispatch_source_set_event_handler(v8, handler);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke_2;
  v14[3] = &unk_264424368;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a4;
  dispatch_source_set_cancel_handler(v8, v14);
  dispatch_source_set_timer(v8, v7, 0xFFFFFFFFFFFFFFFFLL, 0x37E11D600uLL);
  rwlock = self->_rwlock;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63___SYMessageTimerTable_addTimerWithFireDate_forSequenceNumber___block_invoke_3;
  v11[3] = &unk_264424390;
  v12 = v8;
  unint64_t v13 = a4;
  v11[4] = self;
  v10 = v8;
  dispatch_barrier_sync(rwlock, v11);
  dispatch_resume(v10);

  objc_destroyWeak(v15);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

- (void)_fireCallbackForSeqno:(unint64_t)a3
{
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__14;
  v20 = __Block_byref_object_dispose__14;
  id v21 = 0;
  rwlock = self->_rwlock;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46___SYMessageTimerTable__fireCallbackForSeqno___block_invoke;
  block[3] = &unk_2644243B8;
  block[4] = self;
  void block[5] = &v16;
  block[6] = a3;
  dispatch_sync(rwlock, block);
  double v6 = (void *)v17[5];
  if (v6 && !dispatch_source_testcancel((dispatch_source_t)v17[5]))
  {
    dispatch_time_t v7 = objc_getAssociatedObject(v6, (const void *)kTimerContextKey);
    id callback = (void (**)(id, unint64_t, void *))self->_callback;
    v9 = [v7 identifier];
    callback[2](callback, a3, v9);

    v10 = self->_rwlock;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __46___SYMessageTimerTable__fireCallbackForSeqno___block_invoke_2;
    v12[3] = &unk_264424390;
    id v13 = v7;
    unint64_t v14 = a3;
    v12[4] = self;
    id v11 = v7;
    dispatch_barrier_sync(v10, v12);
  }
  _Block_object_dispose(&v16, 8);
}

- (void)_cleanupTimerForSeqno:(unint64_t)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__14;
  unint64_t v14 = __Block_byref_object_dispose__14;
  id v15 = 0;
  rwlock = self->_rwlock;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46___SYMessageTimerTable__cleanupTimerForSeqno___block_invoke;
  block[3] = &unk_2644243B8;
  block[4] = self;
  void block[5] = &v10;
  block[6] = a3;
  dispatch_sync(rwlock, block);
  double v6 = v11[5];
  if (v6)
  {
    dispatch_source_cancel(v6);
    dispatch_time_t v7 = self->_rwlock;
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __46___SYMessageTimerTable__cleanupTimerForSeqno___block_invoke_2;
    v8[3] = &unk_2644243E0;
    v8[5] = &v10;
    v8[6] = a3;
    v8[4] = self;
    dispatch_barrier_sync(v7, v8);
  }
  _Block_object_dispose(&v10, 8);
}

- (void)setIdentifier:(id)a3 forSequenceNumber:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__14;
  v24 = __Block_byref_object_dispose__14;
  id v25 = 0;
  rwlock = self->_rwlock;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56___SYMessageTimerTable_setIdentifier_forSequenceNumber___block_invoke;
  block[3] = &unk_2644243B8;
  block[4] = self;
  void block[5] = &v20;
  block[6] = a4;
  dispatch_sync(rwlock, block);
  if (v21[5])
  {
    id v8 = self->_rwlock;
    uint64_t v12 = MEMORY[0x263EF8330];
    uint64_t v13 = 3221225472;
    unint64_t v14 = __56___SYMessageTimerTable_setIdentifier_forSequenceNumber___block_invoke_2;
    id v15 = &unk_264423BE0;
    uint64_t v16 = self;
    id v9 = v6;
    id v17 = v9;
    uint64_t v18 = &v20;
    dispatch_barrier_sync(v8, &v12);
    uint64_t v10 = objc_getAssociatedObject((id)v21[5], (const void *)kTimerContextKey);
    id v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "setIdentifier:", v9, v12, v13, v14, v15, v16);
    }
    else
    {
      id v11 = objc_opt_new();
      objc_msgSend(v11, "setSeqno:", a4, v12, v13, v14, v15, v16);
      [v11 setIdentifier:v9];
      objc_setAssociatedObject((id)v21[5], (const void *)kTimerContextKey, v11, (void *)1);
    }
  }
  _Block_object_dispose(&v20, 8);
}

- (void)cancelTimerForSequenceNumber:(unint64_t)a3
{
  uint64_t v6 = 0;
  dispatch_time_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__14;
  uint64_t v10 = __Block_byref_object_dispose__14;
  id v11 = 0;
  rwlock = self->_rwlock;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53___SYMessageTimerTable_cancelTimerForSequenceNumber___block_invoke;
  block[3] = &unk_2644243B8;
  block[4] = self;
  void block[5] = &v6;
  block[6] = a3;
  dispatch_sync(rwlock, block);
  objc_super v4 = v7[5];
  if (v4) {
    dispatch_source_cancel(v4);
  }
  _Block_object_dispose(&v6, 8);
}

- (void)cancelTimerForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  unint64_t v14 = __Block_byref_object_copy__14;
  id v15 = __Block_byref_object_dispose__14;
  id v16 = 0;
  rwlock = self->_rwlock;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49___SYMessageTimerTable_cancelTimerForIdentifier___block_invoke;
  block[3] = &unk_264424408;
  uint64_t v10 = &v11;
  block[4] = self;
  id v6 = v4;
  id v9 = v6;
  dispatch_sync(rwlock, block);
  dispatch_time_t v7 = v12[5];
  if (v7) {
    dispatch_source_cancel(v7);
  }

  _Block_object_dispose(&v11, 8);
}

- (void)cancelAllTimers
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(NSMutableDictionary *)self->_bySeqno allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (unint64_t)timerCount
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  rwlock = self->_rwlock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __34___SYMessageTimerTable_timerCount__block_invoke;
  v5[3] = &unk_264422AD8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rwlock, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_byIdent, 0);
  objc_storeStrong((id *)&self->_bySeqno, 0);
  objc_storeStrong((id *)&self->_rwlock, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end