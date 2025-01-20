@interface _GCIPCRemoteProcess
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToProcess:(id)a3;
- (NSArray)connections;
- (NSMutableSet)connectionInvalidationRegistrations;
- (NSString)bundleIdentifier;
- (_GCIPCRemoteProcess)init;
- (_GCIPCRemoteProcess)initWithConnection:(id)a3;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (int)auditSessionIdentifier;
- (int)processIdentifier;
- (unint64_t)hash;
- (unsigned)effectiveGroupIdentifier;
- (unsigned)effectiveUserIdentifier;
- (void)addConnection:(id)a3;
- (void)populateBundleIdentifierForConnection:(id)a3;
- (void)setConnectionInvalidationRegistrations:(id)a3;
- (void)setConnections:(id)a3;
@end

@implementation _GCIPCRemoteProcess

- (_GCIPCRemoteProcess)initWithConnection:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_GCIPCRemoteProcess;
  v5 = [(_GCIPCRemoteProcess *)&v15 init];
  v6 = v5;
  if (v5)
  {
    p_auditToken = &v5->_auditToken;
    if (v4)
    {
      [v4 auditToken];
    }
    else
    {
      long long v13 = 0u;
      long long v14 = 0u;
    }
    *(_OWORD *)p_auditToken->val = v13;
    *(_OWORD *)&v6->_auditToken.val[4] = v14;
    v6->_auditSessionIdentifier = objc_msgSend(v4, "auditSessionIdentifier", v13, v14);
    v6->_processIdentifier = [v4 processIdentifier];
    v6->_effectiveUserIdentifier = [v4 effectiveUserIdentifier];
    v6->_effectiveGroupIdentifier = [v4 effectiveGroupIdentifier];
    uint64_t v8 = objc_opt_new();
    connections = v6->_connections;
    v6->_connections = (NSArray *)v8;

    uint64_t v10 = objc_opt_new();
    connectionInvalidationRegistrations = v6->_connectionInvalidationRegistrations;
    v6->_connectionInvalidationRegistrations = (NSMutableSet *)v10;

    [(_GCIPCRemoteProcess *)v6 populateBundleIdentifierForConnection:v4];
  }

  return v6;
}

- (_GCIPCRemoteProcess)init
{
  return 0;
}

- (void)populateBundleIdentifierForConnection:(id)a3
{
  [a3 processIdentifier];
  GCBundleWithPID();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [v6 bundleIdentifier];
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v4;
}

- (void)addConnection:(id)a3
{
  id v5 = a3;
  id v6 = [v5 process];

  if (v6 == self)
  {
    uint64_t v8 = self;
    objc_sync_enter(v8);
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    uint64_t v19 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = __37___GCIPCRemoteProcess_addConnection___block_invoke;
    v15[3] = &unk_26D22B550;
    v15[4] = v8;
    v15[5] = &v16;
    v15[6] = v5;
    v15[7] = a2;
    uint64_t v9 = [v5 addInvalidationHandler:v15];
    uint64_t v10 = (void *)v9;
    if (v9)
    {
      v17[3] = v9;
      if (gc_isInternalBuild())
      {
        long long v14 = getGCLogger();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v8;
          __int16 v22 = 2112;
          id v23 = v5;
          _os_log_impl(&dword_220998000, v14, OS_LOG_TYPE_INFO, "%@ adding connection: %@", buf, 0x16u);
        }
      }
      v11 = [(_GCIPCRemoteProcess *)v8 connections];
      v12 = [v11 arrayByAddingObject:v5];
      [(_GCIPCRemoteProcess *)v8 setConnections:v12];

      long long v13 = [(_GCIPCRemoteProcess *)v8 connectionInvalidationRegistrations];
      [v13 addObject:v10];
    }
    _Block_object_dispose(&v16, 8);
    objc_sync_exit(v8);
  }
  else
  {
    v7 = unk_26D2B54B8(&off_26D2B5620, "currentHandler");
    [v7 handleFailureInMethod:a2, self, @"GCIPCProcess.m", 67, @"Connection %@ is not from process %@", v5, self object file lineNumber description];
  }
}

- (BOOL)isEqualToProcess:(id)a3
{
  id v4 = a3;
  [(_GCIPCRemoteProcess *)self auditToken];
  if (v4)
  {
    [v4 auditToken];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  BOOL v8 = v12 == (void)v10 && v13 == *((void *)&v10 + 1) && v14 == (void)v11 && v15 == *((void *)&v11 + 1);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(_GCIPCRemoteProcess *)self isEqualToProcess:v4];

  return v5;
}

- (unint64_t)hash
{
  return [(_GCIPCRemoteProcess *)self processIdentifier];
}

- (id)description
{
  return +[NSString stringWithFormat:@"<%@ pid: %i>", objc_opt_class(), [(_GCIPCRemoteProcess *)self processIdentifier]];
}

- (id)redactedDescription
{
  return +[NSString stringWithFormat:@"<%@ pid: %i>", objc_opt_class(), [(_GCIPCRemoteProcess *)self processIdentifier]];
}

- (id)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  BOOL v5 = +[NSString stringWithFormat:@"<%@ %p pid: %i>", v4, self, [(_GCIPCRemoteProcess *)self processIdentifier]];

  return v5;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  objc_copyStruct(retstr, &self->_auditToken, 32, 1, 0);
  return result;
}

- (int)auditSessionIdentifier
{
  return self->_auditSessionIdentifier;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (unsigned)effectiveUserIdentifier
{
  return self->_effectiveUserIdentifier;
}

- (unsigned)effectiveGroupIdentifier
{
  return self->_effectiveGroupIdentifier;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)connections
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConnections:(id)a3
{
}

- (NSMutableSet)connectionInvalidationRegistrations
{
  return self->_connectionInvalidationRegistrations;
}

- (void)setConnectionInvalidationRegistrations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionInvalidationRegistrations, 0);
  objc_storeStrong((id *)&self->_connections, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end