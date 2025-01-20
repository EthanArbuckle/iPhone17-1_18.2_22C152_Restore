@interface GTReplayProfileReplyStream
- (GTReplayProfileReplyStream)initWithCallback:(id)a3 bulkDataProxy:(id)a4 andToken:(id)a5;
- (unint64_t)dispatcherId;
- (void)dispatchMessage:(id)a3 replyConnection:(id)a4;
- (void)setDispatcherId:(unint64_t)a3;
@end

@implementation GTReplayProfileReplyStream

- (GTReplayProfileReplyStream)initWithCallback:(id)a3 bulkDataProxy:(id)a4 andToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GTReplayProfileReplyStream;
  v11 = [(GTReplayProfileReplyStream *)&v19 init];
  if (v11)
  {
    os_log_t v12 = os_log_create("com.apple.gputools.transport", "GTReplayProfileReplyStream");
    log = v11->_log;
    v11->_log = (OS_os_log *)v12;

    objc_storeStrong((id *)&v11->_token, a5);
    uint64_t v14 = MEMORY[0x23ECDA150](v8);
    id callback = v11->_callback;
    v11->_id callback = (id)v14;

    objc_storeStrong((id *)&v11->_bulkDataProxy, a4);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.gputools.profile", 0);
    serialQueue = v11->_serialQueue;
    v11->_serialQueue = (OS_dispatch_queue *)v16;
  }
  return v11;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke;
  block[3] = &unk_264E28ED0;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

void __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke(uint64_t a1)
{
  v2 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "bulkDataHandle");

  if (v2)
  {
    uint64_t uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 32), "bulkDataHandle");
    v4 = *(void **)(*(void *)(a1 + 40) + 24);
    id v16 = 0;
    v5 = [v4 downloadData:uint64 error:&v16];
    id v6 = v16;
    if (v5)
    {
      id v7 = (void *)MEMORY[0x263EFFA08];
      uint64_t v8 = objc_opt_class();
      uint64_t v9 = objc_opt_class();
      id v10 = objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
      id v15 = v6;
      v11 = [MEMORY[0x263F08928] unarchivedObjectOfClasses:v10 fromData:v5 error:&v15];
      id v12 = v15;

      (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 16) + 16))();
      id v6 = v12;
    }
    else
    {
      id v14 = *(NSObject **)(*(void *)(a1 + 40) + 8);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke_cold_2((uint64_t)v6, uint64, v14);
      }
      id v10 = objc_opt_new();
      [v10 setError:v6];
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 16) + 16))();
    }
  }
  else
  {
    v13 = *(NSObject **)(*(void *)(a1 + 40) + 8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke_cold_1(v13);
    }
    [*(id *)(a1 + 48) deregisterDispatcher:*(void *)(*(void *)(a1 + 40) + 48)];
    id v6 = (id)objc_opt_new();
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 40) + 16) + 16))();
    [*(id *)(*(void *)(a1 + 40) + 32) completed];
  }
}

- (unint64_t)dispatcherId
{
  return self->dispatcherId;
}

- (void)setDispatcherId:(unint64_t)a3
{
  self->dispatcherId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_bulkDataProxy, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23C048000, log, OS_LOG_TYPE_DEBUG, "Download Data Complete", v1, 2u);
}

void __62__GTReplayProfileReplyStream_dispatchMessage_replyConnection___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218242;
  uint64_t v4 = a2;
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  _os_log_error_impl(&dword_23C048000, log, OS_LOG_TYPE_ERROR, "Failed to download data handle:%llu error:%@", (uint8_t *)&v3, 0x16u);
}

@end