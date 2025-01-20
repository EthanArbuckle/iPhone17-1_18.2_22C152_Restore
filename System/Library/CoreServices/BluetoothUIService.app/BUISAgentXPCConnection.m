@interface BUISAgentXPCConnection
- (BOOL)_entitledAndReturnError:(id *)a3;
- (BOOL)entitled;
- (BluetoothUIService)agent;
- (OS_dispatch_queue)dispatchQueue;
- (OS_xpc_object)xpcCnx;
- (int)pid;
- (void)_xpcSendReplyError:(id)a3 request:(id)a4;
- (void)invalidate;
- (void)setAgent:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEntitled:(BOOL)a3;
- (void)setPid:(int)a3;
- (void)setXpcCnx:(id)a3;
- (void)xpcConnectionEvent:(id)a3;
- (void)xpcConnectionMessage:(id)a3;
- (void)xpcSendMessage:(int)a3;
@end

@implementation BUISAgentXPCConnection

- (void)invalidate
{
  [(BluetoothUIService *)self->_agent xpcConnectionInvalidated:self];
  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    xpc_connection_cancel(xpcCnx);
  }
}

- (BOOL)_entitledAndReturnError:(id *)a3
{
  if (self->_entitled) {
    return 1;
  }
  if (xpc_connection_has_entitlement())
  {
    BOOL result = 1;
    self->_entitled = 1;
  }
  else
  {
    v6 = NSErrorF();
    if (dword_10001ED80 <= 90 && (dword_10001ED80 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (a3) {
      *a3 = v6;
    }

    return 0;
  }
  return result;
}

- (void)xpcConnectionEvent:(id)a3
{
  id v7 = a3;
  id type = xpc_get_type(v7);
  if (type == &_xpc_type_dictionary)
  {
    id type = [(BUISAgentXPCConnection *)self xpcConnectionMessage:v7];
    goto LABEL_14;
  }
  if (v7 == &_xpc_error_connection_invalid)
  {
    if (dword_10001ED80 <= 20 && (dword_10001ED80 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    id type = [(BUISAgentXPCConnection *)self invalidate];
    goto LABEL_14;
  }
  id v5 = v7;
  if (dword_10001ED80 <= 90)
  {
    if (dword_10001ED80 != -1 || (id type = (id)_LogCategory_Initialize(), v5 = v7, type))
    {
      id type = (id)LogPrintF();
LABEL_14:
      id v5 = v7;
    }
  }

  _objc_release_x1(type, v5);
}

- (void)xpcConnectionMessage:(id)a3
{
  id v4 = a3;
  string = xpc_dictionary_get_string(v4, "BUISKeyType");
  if (!string)
  {
    if (dword_10001ED80 <= 90 && (dword_10001ED80 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (!xpc_dictionary_expects_reply()) {
      goto LABEL_18;
    }
    v10 = 0;
    goto LABEL_17;
  }
  v6 = string;
  if (strcmp(string, "BUISKeyArgType"))
  {
    if (dword_10001ED80 <= 90 && (dword_10001ED80 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (!xpc_dictionary_expects_reply()) {
      goto LABEL_18;
    }
    v10 = v6;
LABEL_17:
    v9 = NSErrorF();
    -[BUISAgentXPCConnection _xpcSendReplyError:request:](self, "_xpcSendReplyError:request:", v9, v4, v10);

LABEL_18:
    id v8 = 0;
    goto LABEL_19;
  }
  id v11 = 0;
  unsigned int v7 = [(BUISAgentXPCConnection *)self _entitledAndReturnError:&v11];
  id v8 = v11;
  if (v7) {
    [(BluetoothUIService *)self->_agent activateBanner:v4 withXPCConnection:self];
  }
LABEL_19:
}

- (void)xpcSendMessage:(int)a3
{
  id v5 = self->_xpcCnx;
  connection = v5;
  if (v5)
  {
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, (const char *)[@"BUISKeyType" UTF8String], a3);
    xpc_connection_send_message_with_reply(connection, v6, (dispatch_queue_t)self->_dispatchQueue, &stru_100018570);

LABEL_3:
    unsigned int v7 = connection;
    goto LABEL_4;
  }
  unsigned int v7 = 0;
  if (dword_10001ED80 <= 90)
  {
    if (dword_10001ED80 != -1 || (id v5 = (OS_xpc_object *)_LogCategory_Initialize(), v7 = 0, v5))
    {
      id v5 = (OS_xpc_object *)LogPrintF();
      goto LABEL_3;
    }
  }
LABEL_4:

  _objc_release_x1(v5, v7);
}

- (void)_xpcSendReplyError:(id)a3 request:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  unsigned int v7 = self->_xpcCnx;
  if (v7)
  {
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      CUXPCEncodeNSError();
      xpc_connection_send_message(v7, reply);
    }
    else if (dword_10001ED80 <= 90 && (dword_10001ED80 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else if (dword_10001ED80 <= 90 && (dword_10001ED80 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (BOOL)entitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (OS_xpc_object)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
}

- (BluetoothUIService)agent
{
  return self->_agent;
}

- (void)setAgent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agent, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end