@interface AXMultiplexConnectionHandler
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isEqual:(id)a3;
- (BSProcessHandle)processHandle;
- (BSServiceConnection)serviceConnection;
- (OS_xpc_object)connection;
- (id)xpc_handler;
- (int)pid;
- (void)setConnection:(id)a3;
- (void)setProcessHandle:(id)a3;
- (void)setServiceConnection:(id)a3;
- (void)setXpc_handler:(id)a3;
@end

@implementation AXMultiplexConnectionHandler

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  uint64_t v5 = [(AXMultiplexConnectionHandler *)self connection];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v4 connection];

    if (v7)
    {
      v8 = [(AXMultiplexConnectionHandler *)self connection];
      v9 = [v4 connection];
      char v10 = xpc_equal(v8, v9);
LABEL_8:
      LOBYTE(v14) = v10;
LABEL_12:

      goto LABEL_14;
    }
  }
  uint64_t v11 = [(AXMultiplexConnectionHandler *)self serviceConnection];
  if (v11)
  {
    v12 = (void *)v11;
    v13 = [v4 serviceConnection];

    if (v13)
    {
      v8 = [(AXMultiplexConnectionHandler *)self serviceConnection];
      v9 = [v4 serviceConnection];
      char v10 = [v8 isEqual:v9];
      goto LABEL_8;
    }
  }
  uint64_t v15 = [(AXMultiplexConnectionHandler *)self processHandle];
  if (!v15)
  {
LABEL_13:
    LOBYTE(v14) = 0;
    goto LABEL_14;
  }
  v16 = (void *)v15;
  v14 = [v4 processHandle];

  if (v14)
  {
    v8 = [(AXMultiplexConnectionHandler *)self processHandle];
    LODWORD(v14) = [v8 pid];
    v9 = [v4 processHandle];
    LOBYTE(v14) = v14 == [v9 pid];
    goto LABEL_12;
  }
LABEL_14:

  return (char)v14;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  uint64_t v5 = [(AXMultiplexConnectionHandler *)self connection];

  if (v5)
  {
    *(_OWORD *)retstr->var0 = 0u;
    *(_OWORD *)&retstr->var0[4] = 0u;
    id v9 = [(AXMultiplexConnectionHandler *)self connection];
    xpc_connection_get_audit_token();
  }
  else
  {
    id v9 = [(AXMultiplexConnectionHandler *)self processHandle];
    v6 = [v9 auditToken];
    v7 = v6;
    if (v6)
    {
      [v6 realToken];
    }
    else
    {
      *(_OWORD *)retstr->var0 = 0u;
      *(_OWORD *)&retstr->var0[4] = 0u;
    }
  }

  return result;
}

- (int)pid
{
  v3 = [(AXMultiplexConnectionHandler *)self connection];

  if (v3)
  {
    id v4 = [(AXMultiplexConnectionHandler *)self connection];
    pid_t pid = xpc_connection_get_pid(v4);
  }
  else
  {
    id v4 = [(AXMultiplexConnectionHandler *)self processHandle];
    pid_t pid = [(_xpc_connection_s *)v4 pid];
  }
  int v6 = pid;

  return v6;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (id)xpc_handler
{
  return self->_xpc_handler;
}

- (void)setXpc_handler:(id)a3
{
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setProcessHandle:(id)a3
{
}

- (BSServiceConnection)serviceConnection
{
  return self->_serviceConnection;
}

- (void)setServiceConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceConnection, 0);
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong(&self->_xpc_handler, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end