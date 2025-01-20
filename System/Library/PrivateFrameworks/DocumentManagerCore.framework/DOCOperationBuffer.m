@interface DOCOperationBuffer
- (BOOL)locked;
- (DOCOperationBuffer)initWithLabel:(id)a3;
- (DOCOperationBuffer)initWithLabel:(id)a3 targetQueue:(id)a4;
- (NSString)label;
- (OS_dispatch_queue)queue;
- (OS_dispatch_queue)targetQueue;
- (void)buffer:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLocked:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setTargetQueue:(id)a3;
- (void)signal;
@end

@implementation DOCOperationBuffer

- (DOCOperationBuffer)initWithLabel:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DOCOperationBuffer;
  v8 = [(DOCOperationBuffer *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(DOCOperationBuffer *)v8 setLocked:1];
    [(DOCOperationBuffer *)v9 setLabel:v6];
    [(DOCOperationBuffer *)v9 setTargetQueue:v7];
  }

  return v9;
}

- (void)setTargetQueue:(id)a3
{
}

- (void)setLabel:(id)a3
{
}

- (DOCOperationBuffer)initWithLabel:(id)a3
{
  return [(DOCOperationBuffer *)self initWithLabel:a3 targetQueue:MEMORY[0x263EF83A0]];
}

- (void)signal
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if ([(DOCOperationBuffer *)self locked])
  {
    [(DOCOperationBuffer *)self setLocked:0];
    v3 = os_log_create("com.apple.DocumentManager", "PointsOfInterest");
    os_signpost_id_t v4 = os_signpost_id_generate(v3);
    v5 = v3;
    id v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)v8 = 0;
      _os_signpost_emit_with_name_impl(&dword_213670000, v6, OS_SIGNPOST_EVENT, v4, "Files-PostLaunchBuffer unlocked", (const char *)&unk_2136A6D6B, v8, 2u);
    }

    id v7 = [(DOCOperationBuffer *)self queue];
    dispatch_resume(v7);
  }
}

- (BOOL)locked
{
  return self->_locked;
}

- (void)setLocked:(BOOL)a3
{
  self->_locked = a3;
}

- (void)buffer:(id)a3
{
  id v4 = a3;
  v5 = [(DOCOperationBuffer *)self queue];
  dispatch_async(v5, v4);
}

- (OS_dispatch_queue)queue
{
  queue = self->_queue;
  if (!queue)
  {
    id v4 = self;
    objc_sync_enter(v4);
    if (!self->_queue)
    {
      v5 = [(DOCOperationBuffer *)v4 label];
      id v6 = [@"com.apple.DocumentManager.operationBuffer." stringByAppendingString:v5];
      id v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);

      v8 = [(DOCOperationBuffer *)v4 targetQueue];
      dispatch_set_target_queue(v7, v8);

      dispatch_suspend(v7);
      v9 = self->_queue;
      self->_queue = (OS_dispatch_queue *)v7;
    }
    objc_sync_exit(v4);

    queue = self->_queue;
  }
  return queue;
}

- (OS_dispatch_queue)targetQueue
{
  return self->_targetQueue;
}

- (NSString)label
{
  return self->_label;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end