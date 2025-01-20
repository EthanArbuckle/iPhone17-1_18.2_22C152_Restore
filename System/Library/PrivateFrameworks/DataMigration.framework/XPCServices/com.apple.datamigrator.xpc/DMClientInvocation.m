@interface DMClientInvocation
- (BOOL)checkNecessity;
- (BOOL)isProgressHost;
- (NSString)earlyResultsPluginIdentifier;
- (OS_xpc_object)connection;
- (id)resultsHandler;
- (int)pid;
- (void)setCheckNecessity:(BOOL)a3;
- (void)setConnection:(id)a3;
- (void)setEarlyResultsPluginIdentifier:(id)a3;
- (void)setResultsHandler:(id)a3;
@end

@implementation DMClientInvocation

- (BOOL)isProgressHost
{
  v3 = [(DMClientInvocation *)self connection];

  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = [(DMClientInvocation *)self connection];
    xpc_connection_get_audit_token();

    memset(&token, 0, sizeof(token));
    v5 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    v6 = v5;
    if (v5)
    {
      v7 = (void *)SecTaskCopySigningIdentifier(v5, 0);
      uint64_t v8 = +[NSNumber numberWithInt:[(DMClientInvocation *)self pid]];
      v9 = (void *)v8;
      if (v7)
      {
        uint64_t v12 = v8;
        _DMLogFunc();

        unsigned __int8 v10 = objc_msgSend(v7, "isEqualToString:", @"com.apple.backboardd", v12, v7);
LABEL_9:

        return v10;
      }
      _DMLogFunc();
    }
    else
    {
      v7 = +[NSNumber numberWithInt:[(DMClientInvocation *)self pid]];
      _DMLogFunc();
    }
    unsigned __int8 v10 = 0;
    goto LABEL_9;
  }
  return 0;
}

- (int)pid
{
  v3 = [(DMClientInvocation *)self connection];

  if (!v3) {
    return 0;
  }
  v4 = [(DMClientInvocation *)self connection];
  pid_t pid = xpc_connection_get_pid(v4);

  return pid;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (BOOL)checkNecessity
{
  return self->_checkNecessity;
}

- (void)setCheckNecessity:(BOOL)a3
{
  self->_checkNecessity = a3;
}

- (NSString)earlyResultsPluginIdentifier
{
  return self->_earlyResultsPluginIdentifier;
}

- (void)setEarlyResultsPluginIdentifier:(id)a3
{
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (void)setResultsHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
  objc_storeStrong((id *)&self->_earlyResultsPluginIdentifier, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end