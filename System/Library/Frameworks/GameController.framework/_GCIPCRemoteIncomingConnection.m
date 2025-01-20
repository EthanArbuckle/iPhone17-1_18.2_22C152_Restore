@interface _GCIPCRemoteIncomingConnection
- (_GCIPCProcess)process;
- (_GCIPCRemoteIncomingConnection)initWithConnection:(id)a3;
- (_GCIPCRemoteIncomingConnection)initWithConnection:(id)a3 fromProcess:(id)a4;
@end

@implementation _GCIPCRemoteIncomingConnection

- (_GCIPCRemoteIncomingConnection)initWithConnection:(id)a3 fromProcess:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    [v7 auditToken];
    if (v9)
    {
LABEL_3:
      [v9 auditToken];
      goto LABEL_6;
    }
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    if (v8) {
      goto LABEL_3;
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
LABEL_6:
  if ((void)v20 != (void)v18
    || *((void *)&v20 + 1) != *((void *)&v18 + 1)
    || (void)v21 != (void)v19
    || *((void *)&v21 + 1) != *((void *)&v19 + 1))
  {
    v16 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v16 handleFailureInMethod:a2, self, @"GCIPCIncomingConnection+GameController.m", 23, @"Connection %@ is not from process %@.", v7, v9 object file lineNumber description];
  }
  v17.receiver = self;
  v17.super_class = (Class)_GCIPCRemoteIncomingConnection;
  v13 = [(GCIPCRemoteIncomingConnection *)&v17 initWithConnection:v7];
  v14 = v13;
  if (v13) {
    objc_storeWeak((id *)&v13->_process, v9);
  }

  return v14;
}

- (_GCIPCRemoteIncomingConnection)initWithConnection:(id)a3
{
  return 0;
}

- (_GCIPCProcess)process
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_process);

  return (_GCIPCProcess *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end