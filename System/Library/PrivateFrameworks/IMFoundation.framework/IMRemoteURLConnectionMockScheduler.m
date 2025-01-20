@interface IMRemoteURLConnectionMockScheduler
- (BOOL)_connect;
- (IMRemoteURLConnectionMockScheduler)init;
- (void)scheduleMockResponse:(id)a3;
- (void)scheduleMockResponse:(id)a3 forURL:(id)a4;
@end

@implementation IMRemoteURLConnectionMockScheduler

- (IMRemoteURLConnectionMockScheduler)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMRemoteURLConnectionMockScheduler;
  v2 = [(IMRemoteURLConnectionMockScheduler *)&v8 init];
  v6 = v2;
  if (v2) {
    objc_msgSend__connect(v2, v3, v4, v5);
  }
  return v6;
}

- (BOOL)_connect
{
  connection = self->_connection;
  if (!connection)
  {
    if (_IMWillLog(@"IMRemoteURLMockScheduler")) {
      _IMAlwaysLog(0, @"IMRemoteURLMockScheduler", @"Connecting to URLLoading agent", v4, v5, v6, v7, v8, v12);
    }
    v9 = IMXPCCreateConnectionForServiceWithQueue(0, 0, "com.apple.imfoundation.IMRemoteURLConnectionAgent", MEMORY[0x1E4F14428], 0, 0);
    v10 = self->_connection;
    self->_connection = v9;

    IMXPCConfigureConnection(self->_connection, &unk_1EE22FCF8, 0);
    connection = self->_connection;
  }
  return connection != 0;
}

- (void)scheduleMockResponse:(id)a3 forURL:(id)a4
{
  id v15 = a3;
  if (objc_msgSend__connect(self, v5, v6, v7))
  {
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    IMInsertKeyedCodableObjectsToXPCDictionary(v8, "mockResponse", v9, v10, v11, v12, v13, v14, (uint64_t)v15);
    xpc_connection_send_message(self->_connection, v8);
  }
}

- (void)scheduleMockResponse:(id)a3
{
  id v4 = a3;
  objc_msgSend_response(v4, v5, v6, v7);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_URL(v17, v8, v9, v10);
  id v15 = objc_msgSend_absoluteString(v11, v12, v13, v14);

  objc_msgSend_scheduleMockResponse_forURL_(self, v16, (uint64_t)v4, (uint64_t)v15);
}

- (void).cxx_destruct
{
}

@end