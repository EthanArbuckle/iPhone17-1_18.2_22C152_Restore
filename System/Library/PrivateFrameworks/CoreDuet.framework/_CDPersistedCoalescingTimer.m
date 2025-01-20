@interface _CDPersistedCoalescingTimer
- (_CDPersistedCoalescingTimer)initWithDelay:(double)a3 coalesceData:(id)a4 operation:(id)a5 persistencePath:(id)a6 dataClass:(Class)a7 timerName:(id)a8;
- (void)processData:(id)a3;
@end

@implementation _CDPersistedCoalescingTimer

- (_CDPersistedCoalescingTimer)initWithDelay:(double)a3 coalesceData:(id)a4 operation:(id)a5 persistencePath:(id)a6 dataClass:(Class)a7 timerName:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v43.receiver = self;
  v43.super_class = (Class)_CDPersistedCoalescingTimer;
  v18 = [(_CDPersistedCoalescingTimer *)&v43 init];
  if (v18)
  {
    v19 = (void *)[getBMStoreConfigClass() newPrivateStreamDefaultConfigurationWithStoreBasePath:v16];
    uint64_t v20 = [objc_alloc((Class)getBMStoreStreamClass()) initWithPrivateStreamIdentifier:v17 storeConfig:v19 eventDataClass:a7];
    storeStream = v18->_storeStream;
    v18->_storeStream = (BMStoreStream *)v20;

    uint64_t v22 = [(BMStoreStream *)v18->_storeStream source];
    source = v18->_source;
    v18->_source = (BMSource *)v22;

    v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v25 = dispatch_queue_create("_CDPersistedCoalescingTimer.innerQueue", v24);
    queue = v18->_queue;
    v18->_queue = (OS_dispatch_queue *)v25;

    v18->_delay = a3;
    v18->_double leeway = 1.0;
    objc_storeStrong((id *)&v18->_persistencePath, a6);
    id v27 = objc_alloc(MEMORY[0x1E4F93AD8]);
    v28 = v18->_queue;
    double leeway = v18->_leeway;
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __104___CDPersistedCoalescingTimer_initWithDelay_coalesceData_operation_persistencePath_dataClass_timerName___block_invoke;
    v40[3] = &unk_1E560EE30;
    v41 = v18;
    id v42 = v14;
    uint64_t v34 = MEMORY[0x1E4F143A8];
    uint64_t v35 = 3221225472;
    v36 = __104___CDPersistedCoalescingTimer_initWithDelay_coalesceData_operation_persistencePath_dataClass_timerName___block_invoke_3;
    v37 = &unk_1E560EE78;
    id v39 = v15;
    v30 = v41;
    v38 = v30;
    uint64_t v31 = [v27 initWithQueue:v28 leewaySeconds:v40 coalesceData:&v34 operation:leeway];
    coalescingTimer = v30->_coalescingTimer;
    v30->_coalescingTimer = (_PASCoalescingTimer *)v31;
  }
  -[_PASCoalescingTimer immediatelyProcessData:](v18->_coalescingTimer, "immediatelyProcessData:", 0, v34, v35, v36, v37);

  return v18;
}

- (void)processData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_storeStream, 0);
  objc_storeStrong((id *)&self->_persistencePath, 0);
  objc_storeStrong((id *)&self->_coalescingTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end