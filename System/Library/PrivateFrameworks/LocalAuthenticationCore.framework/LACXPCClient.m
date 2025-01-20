@interface LACXPCClient
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)checkEntitlement:(id)a3;
- (LACXPCClient)initWithConnection:(id)a3;
- (LACXPCClient)initWithProcessId:(int)a3 auditToken:(id *)a4 userId:(unsigned int)a5;
- (NSXPCConnection)connection;
- (int)processId;
- (unsigned)userId;
- (void)setAuditToken:(id *)a3;
- (void)setConnection:(id)a3;
- (void)setProcessId:(int)a3;
- (void)setUserId:(unsigned int)a3;
@end

@implementation LACXPCClient

- (void).cxx_destruct
{
}

- (LACXPCClient)initWithConnection:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)LACXPCClient;
  v5 = [(LACXPCClient *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_connection, v4);
    p_auditToken = &v6->_auditToken;
    if (v4)
    {
      v6->_processId = [v4 processIdentifier];
      [v4 auditToken];
      *(_OWORD *)p_auditToken->val = v10;
      *(_OWORD *)&v6->_auditToken.val[4] = v11;
      uid_t v8 = [v4 effectiveUserIdentifier];
    }
    else
    {
      v6->_processId = getpid();
      *(_OWORD *)p_auditToken->val = 0u;
      *(_OWORD *)&v6->_auditToken.val[4] = 0u;
      uid_t v8 = geteuid();
    }
    v6->_userId = v8;
  }

  return v6;
}

- (LACXPCClient)initWithProcessId:(int)a3 auditToken:(id *)a4 userId:(unsigned int)a5
{
  v10.receiver = self;
  v10.super_class = (Class)LACXPCClient;
  result = [(LACXPCClient *)&v10 init];
  if (result)
  {
    result->_processId = a3;
    long long v9 = *(_OWORD *)a4->var0;
    *(_OWORD *)&result->_auditToken.val[4] = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)result->_auditToken.val = v9;
    result->_userId = a5;
  }
  return result;
}

- (BOOL)checkEntitlement:(id)a3
{
  id v4 = a3;
  v5 = [(LACXPCClient *)self connection];
  if (v5)
  {
    v6 = [(LACXPCClient *)self connection];
    v7 = [v6 valueForEntitlement:v4];
    char v8 = [v7 BOOLValue];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  long long v3 = *(_OWORD *)&self[1].var0[2];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void)setAuditToken:(id *)a3
{
  long long v3 = *(_OWORD *)a3->var0;
  *(_OWORD *)&self->_auditToken.val[4] = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)self->_auditToken.val = v3;
}

- (int)processId
{
  return self->_processId;
}

- (void)setProcessId:(int)a3
{
  self->_processId = a3;
}

- (unsigned)userId
{
  return self->_userId;
}

- (void)setUserId:(unsigned int)a3
{
  self->_userId = a3;
}

- (NSXPCConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (NSXPCConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

@end