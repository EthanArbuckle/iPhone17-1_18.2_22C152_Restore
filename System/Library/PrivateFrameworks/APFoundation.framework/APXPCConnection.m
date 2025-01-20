@interface APXPCConnection
- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken;
- (APXPCConnection)initWithConnection:(id)a3;
- (BOOL)hasEntitlement:(id)a3;
- (NSString)bundleID;
- (NSXPCConnection)connection;
- (id)remoteObjectProxy;
- (int)processIdentifier;
- (void)invalidate;
- (void)setBundleID:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation APXPCConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (BOOL)hasEntitlement:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = [(APXPCConnection *)self connection];
    v6 = [v5 valueForEntitlement:v4];
    char v7 = [v6 BOOLValue];
  }
  else
  {
    v8 = APLogForCategory(0x33uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138477827;
      id v12 = (id)objc_opt_class();
      id v9 = v12;
      _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_ERROR, "[%{private}@] Caller did not provide an entitlement to check.", (uint8_t *)&v11, 0xCu);
    }
    char v7 = 0;
  }

  return v7;
}

- (NSString)bundleID
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  bundleID = self->_bundleID;
  if (bundleID)
  {
LABEL_24:
    v14 = bundleID;
    goto LABEL_25;
  }
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  else {
    memset(&token, 0, sizeof(token));
  }
  v5 = SecTaskCreateWithAuditToken(0, &token);
  if (v5)
  {
    v6 = v5;
    CFErrorRef error = 0;
    char v7 = (__CFString *)SecTaskCopySigningIdentifier(v5, &error);
    if (error)
    {
      v8 = APLogForCategory(0x33uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = (char *)objc_opt_class();
        *(_DWORD *)buf = 138477827;
        v27 = v9;
        v10 = v9;
        _os_log_impl(&dword_1D70B2000, v8, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to copy signing ID.", buf, 0xCu);
      }
      CFRelease(error);
      if (v7) {
        CFRelease(v7);
      }
    }
    else
    {
      v15 = APLogForCategory(0x33uLL);
      v16 = v15;
      if (v7)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v17 = [(APXPCConnection *)self connection];
          *(_DWORD *)buf = 136643331;
          v27 = "-[APXPCConnection bundleID]";
          __int16 v28 = 2114;
          CFErrorRef v29 = (CFErrorRef)v7;
          __int16 v30 = 2114;
          v31 = v17;
          _os_log_impl(&dword_1D70B2000, v16, OS_LOG_TYPE_INFO, "%{sensitive}s: SecTaskCopySigningIdentifier returned bundleID %{public}@ for connection %{public}@", buf, 0x20u);
        }
        v18 = self->_bundleID;
        self->_bundleID = &v7->isa;

        v19 = APLogForCategory(0x33uLL);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = self->_bundleID;
          *(_DWORD *)buf = 136643075;
          v27 = "-[APXPCConnection bundleID]";
          __int16 v28 = 2114;
          CFErrorRef v29 = (CFErrorRef)v20;
          _os_log_impl(&dword_1D70B2000, v19, OS_LOG_TYPE_INFO, "%{sensitive}s: bundleID is now %{public}@", buf, 0x16u);
        }
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v21 = (char *)objc_opt_class();
          *(_DWORD *)buf = 138478083;
          v27 = v21;
          __int16 v28 = 2114;
          CFErrorRef v29 = error;
          v22 = v21;
          _os_log_impl(&dword_1D70B2000, v16, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to retrieve signing ID. %{public}@", buf, 0x16u);
        }
      }
    }
    CFRelease(v6);
    bundleID = self->_bundleID;
    goto LABEL_24;
  }
  int v11 = APLogForCategory(0x33uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    id v12 = (char *)objc_opt_class();
    *(_DWORD *)buf = 138477827;
    v27 = v12;
    uint64_t v13 = v12;
    _os_log_impl(&dword_1D70B2000, v11, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to allocate security task.", buf, 0xCu);
  }
  v14 = 0;
LABEL_25:
  return v14;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)invalidate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v3 = APLogForCategory(0x33uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    connection = self->_connection;
    int v8 = 136643075;
    id v9 = "-[APXPCConnection invalidate]";
    __int16 v10 = 2048;
    int v11 = connection;
    _os_log_impl(&dword_1D70B2000, v3, OS_LOG_TYPE_INFO, "%{sensitive}s: invalidating connection %p", (uint8_t *)&v8, 0x16u);
  }

  v5 = self->_connection;
  if (v5)
  {
    [(NSXPCConnection *)v5 invalidate];
    v6 = self->_connection;
    self->_connection = 0;
  }
  bundleID = self->_bundleID;
  if (bundleID)
  {
    self->_bundleID = 0;
  }
}

- (APXPCConnection)initWithConnection:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APXPCConnection;
  v6 = [(APXPCConnection *)&v9 self];

  if (v6)
  {
    char v7 = APLogForCategory(0x33uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136643075;
      int v11 = "-[APXPCConnection initWithConnection:]";
      __int16 v12 = 2048;
      id v13 = v5;
      _os_log_impl(&dword_1D70B2000, v7, OS_LOG_TYPE_INFO, "%{sensitive}s: Initializing connection %p", buf, 0x16u);
    }

    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v6;
}

- ($115C4C562B26FF47E01F9F4EA65B5887)auditToken
{
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)self->_connection;
  if (result) {
    return ($115C4C562B26FF47E01F9F4EA65B5887 *)[($115C4C562B26FF47E01F9F4EA65B5887 *)result auditToken];
  }
  *(_OWORD *)retstr->var0 = 0u;
  *(_OWORD *)&retstr->var0[4] = 0u;
  return result;
}

- (id)remoteObjectProxy
{
  v2 = [(APXPCConnection *)self connection];
  v3 = [v2 remoteObjectProxy];

  return v3;
}

- (int)processIdentifier
{
  return MEMORY[0x1F4181798](self->_connection, sel_processIdentifier);
}

- (void)setBundleID:(id)a3
{
}

- (void)setConnection:(id)a3
{
}

@end