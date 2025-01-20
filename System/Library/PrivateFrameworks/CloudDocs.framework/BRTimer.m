@interface BRTimer
- (BRTimer)initWithName:(id)a3 interval:(double)a4 callbackQueue:(id)a5 block:(id)a6;
- (void)dealloc;
- (void)start;
- (void)stop;
@end

@implementation BRTimer

- (BRTimer)initWithName:(id)a3 interval:(double)a4 callbackQueue:(id)a5 block:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v32.receiver = self;
  v32.super_class = (Class)BRTimer;
  v14 = [(BRTimer *)&v32 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_name, a3);
    objc_storeStrong((id *)&v15->_queue, a5);
    dispatch_source_t v16 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)v15->_queue);
    timer = v15->_timer;
    v15->_timer = (OS_dispatch_source *)v16;

    dispatch_time_t v18 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
    dispatch_source_set_timer((dispatch_source_t)v15->_timer, v18, (uint64_t)(a4 * 1000000000.0), (uint64_t)(a4 * 1000000000.0) / 0xAuLL);
    objc_initWeak(&location, v15);
    v19 = v15->_timer;
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __53__BRTimer_initWithName_interval_callbackQueue_block___block_invoke;
    v28[3] = &unk_1E59AF1F0;
    objc_copyWeak(&v30, &location);
    id v29 = v13;
    v20 = v19;
    v21 = v28;
    v22 = v20;
    v23 = v21;
    v24 = v23;
    v25 = v23;
    if (brc_block_remember_persona)
    {
      v25 = brc_block_remember_persona(v23);
    }
    dispatch_block_t v26 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v25);
    dispatch_source_set_event_handler(v22, v26);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v15;
}

void __53__BRTimer_initWithName_interval_callbackQueue_block___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (((*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))() & 1) == 0) {
    [WeakRetained stop];
  }
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] dealloc timer %@%@");
}

- (void)start
{
}

- (void)stop
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_19ED3F000, v0, v1, "[DEBUG] stop timer %@%@");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end