@interface GTServiceObserver
- (GTServiceObserver)initWithMessage:(id)a3 notifyConnection:(id)a4;
- (GTXPCConnection)connection;
- (OS_xpc_object)replyPath;
- (unint64_t)replyStream;
@end

@implementation GTServiceObserver

- (GTServiceObserver)initWithMessage:(id)a3 notifyConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)GTServiceObserver;
  v8 = [(GTServiceObserver *)&v12 init];
  if (v8)
  {
    v8->_replyStream = xpc_dictionary_get_uint64(v6, "_replyStreamId");
    uint64_t v9 = xpc_dictionary_get_array(v6, "_pathHistory");
    replyPath = v8->_replyPath;
    v8->_replyPath = (OS_xpc_object *)v9;

    objc_storeStrong((id *)&v8->_connection, a4);
  }

  return v8;
}

- (unint64_t)replyStream
{
  return self->_replyStream;
}

- (OS_xpc_object)replyPath
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 16, 1);
}

- (GTXPCConnection)connection
{
  return (GTXPCConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_replyPath, 0);
}

@end