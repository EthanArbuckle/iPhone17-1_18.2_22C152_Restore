@interface DBGLocalDataSourceConnection
+ (Class)matchingDataCoordinatorClass;
- (DBGDataSourceConnectionDelegate)delegate;
- (DBGLocalDataSourceConnection)initWithPid:(int)a3;
- (DBGLocalDataSourceConnection)initWithPid:(int)a3 agentConnection:(id)a4;
- (OS_dispatch_queue)captureQueue;
- (float)debugHierarchyVersion;
- (void)closeConnection;
- (void)dealloc;
- (void)performRequest:(id)a3;
- (void)retrieveDebugHierarchyConfiguration:(id)a3;
- (void)setCaptureQueue:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation DBGLocalDataSourceConnection

+ (Class)matchingDataCoordinatorClass
{
  return 0;
}

- (DBGLocalDataSourceConnection)initWithPid:(int)a3 agentConnection:(id)a4
{
  id v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DBGLocalDataSourceConnection;
  v7 = [(DBGLocalDataSourceConnection *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_pid = a3;
    dispatch_queue_t v9 = dispatch_queue_create("LocalConnectionQueue", 0);
    connectionQueue = v8->_connectionQueue;
    v8->_connectionQueue = (OS_dispatch_queue *)v9;

    if (v6) {
      xpc_connection_t mach_service = (xpc_connection_t)v6;
    }
    else {
      xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.dt.ViewHierarchyAgent.xpc", (dispatch_queue_t)v8->_connectionQueue, 0);
    }
    connection = v8->_connection;
    v8->_connection = mach_service;

    xpc_connection_set_event_handler(v8->_connection, &__block_literal_global_1);
    xpc_connection_activate(v8->_connection);
  }

  return v8;
}

- (DBGLocalDataSourceConnection)initWithPid:(int)a3
{
  return [(DBGLocalDataSourceConnection *)self initWithPid:*(void *)&a3 agentConnection:0];
}

- (void)dealloc
{
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v4 = self->_connection;
    self->_connection = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DBGLocalDataSourceConnection;
  [(DBGLocalDataSourceConnection *)&v5 dealloc];
}

- (float)debugHierarchyVersion
{
  return 4.0;
}

- (void)performRequest:(id)a3
{
  id v4 = a3;
  objc_super v5 = +[NSFileManager defaultManager];
  id v6 = [v5 temporaryDirectory];
  v7 = +[NSUUID UUID];
  v8 = [v7 UUIDString];
  dispatch_queue_t v9 = [v6 URLByAppendingPathComponent:v8];

  v10 = +[NSFileManager defaultManager];
  v11 = [v9 path];
  [v10 createFileAtPath:v11 contents:0 attributes:0];

  v12 = +[NSFileHandle fileHandleForWritingToURL:v9 error:0];
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "action", "performRequest");
  xpc_dictionary_set_uint64(empty, "pid", self->_pid);
  id v14 = [v4 base64Encoded];
  xpc_dictionary_set_string(empty, "request", (const char *)[v14 cStringUsingEncoding:4]);

  xpc_dictionary_set_fd(empty, "fd", (int)[v12 fileDescriptor]);
  connectionQueue = self->_connectionQueue;
  connection = self->_connection;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = __47__DBGLocalDataSourceConnection_performRequest___block_invoke;
  v20[3] = &unk_244D0;
  id v21 = v9;
  v22 = self;
  id v23 = v4;
  id v24 = v12;
  id v17 = v12;
  id v18 = v4;
  id v19 = v9;
  xpc_connection_send_message_with_reply(connection, empty, connectionQueue, v20);
}

void __47__DBGLocalDataSourceConnection_performRequest___block_invoke(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    objc_super v5 = +[NSFileHandle fileHandleForReadingFromURL:*(void *)(a1 + 32) error:0];
    id v6 = [v5 readDataToEndOfFile];
    v7 = [*(id *)(a1 + 40) captureQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = __47__DBGLocalDataSourceConnection_performRequest___block_invoke_2;
    block[3] = &unk_244A8;
    id v11 = *(id *)(a1 + 48);
    id v12 = v6;
    uint64_t v13 = *(void *)(a1 + 40);
    id v8 = v6;
    dispatch_async(v7, block);

    [v5 closeFile];
    [*(id *)(a1 + 56) closeFile];
    dispatch_queue_t v9 = +[NSFileManager defaultManager];
    [v9 removeItemAtURL:*(void *)(a1 + 32) error:0];
  }
  else
  {
    v3 = *(_xpc_connection_s **)(*(void *)(a1 + 40) + 32);
    if (!v3) {
      return;
    }
    xpc_connection_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 40);
    objc_super v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;
  }
}

void __47__DBGLocalDataSourceConnection_performRequest___block_invoke_2(id *a1)
{
  [a1[4] setRawResponseData:a1[5]];
  v2 = [a1[6] delegate];
  [v2 didReceiveData:a1[5] forRequest:a1[4]];

  if ([a1[5] length]) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = -2;
  }
  [a1[4] setStatus:v3];
  uint64_t v4 = [a1[4] completion];

  if (v4)
  {
    objc_super v5 = [a1[4] completion];
    ((void (**)(void, id))v5)[2](v5, a1[4]);
  }
}

- (void)retrieveDebugHierarchyConfiguration:(id)a3
{
}

- (void)closeConnection
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(empty, "action", "finish");
  xpc_dictionary_set_uint64(empty, "pid", self->_pid);
  connectionQueue = self->_connectionQueue;
  connection = self->_connection;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = __47__DBGLocalDataSourceConnection_closeConnection__block_invoke;
  handler[3] = &unk_244F8;
  handler[4] = self;
  xpc_connection_send_message_with_reply(connection, empty, connectionQueue, handler);
}

void __47__DBGLocalDataSourceConnection_closeConnection__block_invoke(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(*(void *)(a1 + 32) + 32));
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;
}

- (DBGDataSourceConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (DBGDataSourceConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)captureQueue
{
  return self->captureQueue;
}

- (void)setCaptureQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->captureQueue, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);

  objc_storeStrong((id *)&self->_captureQueue, 0);
}

@end