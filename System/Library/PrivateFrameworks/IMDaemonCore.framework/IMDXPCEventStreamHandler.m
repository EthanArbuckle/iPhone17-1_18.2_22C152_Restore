@interface IMDXPCEventStreamHandler
- (IMDXPCEventStreamHandler)init;
- (IMDXPCEventStreamHandler)initWithEventStreamName:(const char *)a3;
- (NSMapTable)delegateToQueue;
- (OS_dispatch_queue)queue;
- (id)queueForDelegate:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)didReceiveEventWithName:(id)a3 userInfo:(id)a4;
- (void)removeDelegate:(id)a3;
@end

@implementation IMDXPCEventStreamHandler

- (IMDXPCEventStreamHandler)init
{
  return 0;
}

- (IMDXPCEventStreamHandler)initWithEventStreamName:(const char *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)IMDXPCEventStreamHandler;
  v4 = [(IMDXPCEventStreamHandler *)&v21 init];
  if (v4)
  {
    v5 = NSString;
    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 bundleIdentifier];
    v8 = (objc_class *)objc_opt_class();
    v9 = NSStringFromClass(v8);
    v10 = [v5 stringWithFormat:@"%@.%@", v7, v9];
    v11 = NSStringFromSelector(sel_queue);
    v12 = [v5 stringWithFormat:@"%@.%@", v10, v11];

    id v13 = v12;
    dispatch_queue_t v14 = dispatch_queue_create((const char *)[v13 UTF8String], 0);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    delegateToQueue = v4->_delegateToQueue;
    v4->_delegateToQueue = (NSMapTable *)v16;

    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = sub_1D9860DD8;
    handler[3] = &unk_1E6B73EC0;
    v20 = v4;
    xpc_set_event_stream_handler(a3, MEMORY[0x1E4F14428], handler);
  }
  return v4;
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(IMDXPCEventStreamHandler *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9861044;
  block[3] = &unk_1E6B73BC8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(IMDXPCEventStreamHandler *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D986115C;
  v7[3] = &unk_1E6B73218;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)queueForDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_1D98612F4;
  uint64_t v16 = sub_1D9861304;
  id v17 = 0;
  v5 = [(IMDXPCEventStreamHandler *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D986130C;
  block[3] = &unk_1E6B73240;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)didReceiveEventWithName:(id)a3 userInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMDXPCEventStreamHandler *)self queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9861450;
  block[3] = &unk_1E6B73BC8;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMapTable)delegateToQueue
{
  return self->_delegateToQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateToQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end