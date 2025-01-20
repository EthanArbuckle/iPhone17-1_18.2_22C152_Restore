@interface GTServiceConnection
- (BOOL)isTrusted;
- (GTServiceConnection)initWithConnection:(id)a3 device:(id)a4 port:(unint64_t)a5;
- (NSString)deviceUDID;
- (OS_xpc_object)connection;
- (OS_xpc_object)error;
- (id)sendMessageWithReplySync:(id)a3 error:(id *)a4;
- (id)sendMessageWithReplySync:(id)a3 replyStreamId:(unint64_t)a4 error:(id *)a5;
- (unint64_t)registerDispatcher:(id)a3;
- (void)_setRoutingPropertiesForMessage:(id)a3;
- (void)_setRoutingPropertiesForMessage:(id)a3 withReplyStreamId:(unint64_t)a4;
- (void)activateWithMessageHandler:(id)a3 andErrorHandler:(id)a4;
- (void)cancel;
- (void)deregisterDispatcher:(unint64_t)a3;
- (void)dispatchMessage:(id)a3 replyConnection:(id)a4;
- (void)registerDispatcher:(id)a3 forPort:(unint64_t)a4;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 replyHandler:(id)a4;
- (void)sendMessage:(id)a3 withReplyStreamId:(unint64_t)a4;
- (void)sendMessage:(id)a3 withReplyStreamId:(unint64_t)a4 replyHandler:(id)a5;
- (void)sendMessageAndWaitForDelivery:(id)a3;
- (void)setError:(id)a3;
@end

@implementation GTServiceConnection

- (GTServiceConnection)initWithConnection:(id)a3 device:(id)a4 port:(unint64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GTServiceConnection;
  v11 = [(GTServiceConnection *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connection, a3);
    objc_storeStrong((id *)&v12->_deviceUDID, a4);
    v12->_servicePort = a5;
  }

  return v12;
}

- (void)registerDispatcher:(id)a3 forPort:(unint64_t)a4
{
}

- (void)dispatchMessage:(id)a3 replyConnection:(id)a4
{
}

- (OS_xpc_object)connection
{
  return (OS_xpc_object *)[(GTXPCConnection *)self->_connection connection];
}

- (OS_xpc_object)error
{
  return (OS_xpc_object *)[(GTXPCConnection *)self->_connection error];
}

- (void)setError:(id)a3
{
}

- (void)_setRoutingPropertiesForMessage:(id)a3
{
  xpc_object_t xdict = a3;
  deviceUDID = self->_deviceUDID;
  if (deviceUDID) {
    xpc_dictionary_set_string(xdict, "_device_dest", [(NSString *)deviceUDID UTF8String]);
  }
  uint64_t servicePort = self->_servicePort;
  if (servicePort) {
    xpc_dictionary_set_uint64(xdict, "_port", servicePort);
  }
}

- (void)_setRoutingPropertiesForMessage:(id)a3 withReplyStreamId:(unint64_t)a4
{
  xpc_object_t xdict = a3;
  [(GTServiceConnection *)self _setRoutingPropertiesForMessage:xdict];
  xpc_dictionary_set_uint64(xdict, "_replyStreamId", a4);
  xpc_dictionary_set_flag(xdict, "_flags", 2);
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  [(GTServiceConnection *)self _setRoutingPropertiesForMessage:v4];
  [(GTXPCConnection *)self->_connection sendMessage:v4];
}

- (void)sendMessage:(id)a3 replyHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(GTServiceConnection *)self _setRoutingPropertiesForMessage:v7];
  MessageSetHasReply(v7);
  [(GTXPCConnection *)self->_connection sendMessage:v7 replyHandler:v6];
}

- (id)sendMessageWithReplySync:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(GTServiceConnection *)self _setRoutingPropertiesForMessage:v6];
  MessageSetHasReply(v6);
  id v7 = [(GTXPCConnection *)self->_connection sendMessageWithReplySync:v6 error:a4];

  return v7;
}

- (void)sendMessageAndWaitForDelivery:(id)a3
{
  id v4 = a3;
  [(GTServiceConnection *)self _setRoutingPropertiesForMessage:v4];
  [(GTXPCConnection *)self->_connection sendMessageAndWaitForDelivery:v4];
}

- (void)sendMessage:(id)a3 withReplyStreamId:(unint64_t)a4
{
  id v6 = a3;
  [(GTServiceConnection *)self _setRoutingPropertiesForMessage:v6 withReplyStreamId:a4];
  [(GTXPCConnection *)self->_connection sendMessage:v6];
}

- (void)sendMessage:(id)a3 withReplyStreamId:(unint64_t)a4 replyHandler:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  [(GTServiceConnection *)self _setRoutingPropertiesForMessage:v9 withReplyStreamId:a4];
  MessageSetHasReply(v9);
  [(GTServiceConnection *)self sendMessage:v9 replyHandler:v8];
}

- (id)sendMessageWithReplySync:(id)a3 replyStreamId:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  [(GTServiceConnection *)self _setRoutingPropertiesForMessage:v8 withReplyStreamId:a4];
  MessageSetHasReply(v8);
  id v9 = [(GTXPCConnection *)self->_connection sendMessageWithReplySync:v8 error:a5];

  return v9;
}

- (unint64_t)registerDispatcher:(id)a3
{
  return [(GTXPCConnection *)self->_connection registerDispatcher:a3];
}

- (void)deregisterDispatcher:(unint64_t)a3
{
}

- (void)activateWithMessageHandler:(id)a3 andErrorHandler:(id)a4
{
}

- (void)cancel
{
}

- (BOOL)isTrusted
{
  return [(GTXPCConnection *)self->_connection isTrusted];
}

- (NSString)deviceUDID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end