@interface GTReplayADSReplyStream
- (GTReplayADSReplyStream)initWithCallback:(id)a3 bulkDataProxy:(id)a4 andToken:(id)a5;
- (unint64_t)dispatcherId;
- (void)dispatchMessage:(id)a3 replyConnection:(id)a4;
- (void)setDispatcherId:(unint64_t)a3;
@end

@implementation GTReplayADSReplyStream

- (GTReplayADSReplyStream)initWithCallback:(id)a3 bulkDataProxy:(id)a4 andToken:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)GTReplayADSReplyStream;
  v11 = [(GTReplayADSReplyStream *)&v17 init];
  if (v11)
  {
    os_log_t v12 = os_log_create("com.apple.gputools.transport", "GTReplayADSReplyStream");
    log = v11->_log;
    v11->_log = (OS_os_log *)v12;

    objc_storeStrong((id *)&v11->_token, a5);
    uint64_t v14 = MEMORY[0x23ECDA150](v8);
    id callback = v11->_callback;
    v11->_id callback = (id)v14;

    objc_storeStrong((id *)&v11->_bulkDataProxy, a4);
  }

  return v11;
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
  id v5 = a3;
  uint64_t uint64 = xpc_dictionary_get_uint64(v5, "bulkDataHandle");
  if (uint64)
  {
    uint64_t v7 = uint64;
    bulkDataProxy = self->_bulkDataProxy;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __58__GTReplayADSReplyStream_dispatchMessage_replyConnection___block_invoke;
    v12[3] = &unk_264E28EF8;
    v12[4] = self;
    id v13 = v5;
    [(GTBulkDataServiceXPCProxy *)bulkDataProxy downloadData:v7 completionHandler:v12];
  }
  else
  {
    uint64_t v9 = xpc_dictionary_get_uint64(v5, "streamState");
    id callback = (void (**)(id, GTReplayResponseStream *))self->_callback;
    v11 = [[GTReplayResponseStream alloc] initWithState:v9];
    callback[2](callback, v11);

    if (v9 == 2) {
      [(GTReplayRequestToken *)self->_token completed];
    }
  }
}

void __58__GTReplayADSReplyStream_dispatchMessage_replyConnection___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    [v7 setData:0];
    [v7 setError:v6];
    (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
  }
  id v8 = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "bulkDataHandle");

  if (v8)
  {
    uint64_t v9 = +[GTUnarchiver replayResponseStreamClassSet];
    id v10 = (objc_class *)objc_opt_class();
    id v14 = 0;
    v11 = GTUnarchivedObjectOfClassesExpectingClass((uint64_t)v9, v10, (uint64_t)v5, &v14);
    id v12 = v14;

    if (v11)
    {
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
    }
    else
    {
      id v13 = objc_opt_new();
      [v13 setData:0];
      [v13 setError:v6];
      (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16))();
    }
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
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_bulkDataProxy, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end