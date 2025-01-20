@interface GEONavdPeer
- (BOOL)expectingUpdates;
- (BOOL)hasEntitlement:(id)a3;
- (GEONavdClientInfo)clientInfo;
- (GEONavdPeer)initWithXPCConnection:(id)a3;
- (NSXPCConnection)connection;
- (id)description;
- (void)setExpectingUpdates:(BOOL)a3;
- (void)updateConnection:(id)a3;
@end

@implementation GEONavdPeer

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (GEONavdPeer)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEONavdPeer;
  v5 = [(GEONavdPeer *)&v8 init];
  v6 = v5;
  if (v5) {
    [(GEONavdPeer *)v5 updateConnection:v4];
  }

  return v6;
}

- (void)updateConnection:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  objc_storeStrong((id *)&self->_connection, a3);
  self->_expectingUpdates = 0;
  int v6 = [(NSXPCConnection *)self->_connection processIdentifier];
  uint64_t v7 = [(NSXPCConnection *)self->_connection valueForEntitlement:@"application-identifier"];
  if (v7)
  {
    objc_super v8 = (void *)v7;
    v9 = [GEONavdClientInfo alloc];
    v10 = [[GEOApplicationAuditToken alloc] initWithProxiedExternalApplicationBundleId:v8];
    v11 = [(GEONavdClientInfo *)v9 initWithCanonicalName:v8 instanceId:v6 auditToken:v10];
    clientInfo = self->_clientInfo;
    self->_clientInfo = v11;
  }
  else
  {
    buffer[0] = 0;
    proc_name(v6, buffer, 0x400u);
    objc_super v8 = (void *)[[NSString alloc] initWithCString:buffer encoding:4];
    v13 = [[GEONavdClientInfo alloc] initWithCanonicalName:v8 instanceId:v6];
    v14 = self->_clientInfo;
    self->_clientInfo = v13;
  }
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4 = (__CFString *)a3;
  if (self->_connection)
  {
    entitlementCache = self->_entitlementCache;
    if (!entitlementCache)
    {
      int v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v7 = self->_entitlementCache;
      self->_entitlementCache = v6;

      entitlementCache = self->_entitlementCache;
    }
    objc_super v8 = [(NSMutableDictionary *)entitlementCache objectForKey:v4];
    v9 = v8;
    if (v8)
    {
      LOBYTE(v10) = [v8 BOOLValue];
    }
    else
    {
      memset(&v20, 0, sizeof(v20));
      connection = self->_connection;
      if (connection) {
        [(NSXPCConnection *)connection auditToken];
      }
      audit_token_t token = v20;
      v12 = SecTaskCreateWithAuditToken(0, &token);
      if (v12)
      {
        v13 = v12;
        *(void *)token.val = 0;
        CFTypeRef v14 = SecTaskCopyValueForEntitlement(v12, v4, (CFErrorRef *)&token);
        if (*(void *)token.val)
        {
          NSLog(&cfstr_UnableToGetEnt.isa, *(void *)token.val);
          CFRelease(*(CFTypeRef *)token.val);
        }
        if (v14)
        {
          CFTypeID v15 = CFGetTypeID(v14);
          uint64_t v10 = v15 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v14) != 0;
          CFRelease(v14);
        }
        else
        {
          uint64_t v10 = 0;
        }
        CFRelease(v13);
      }
      else
      {
        NSLog(&cfstr_UnableToCreate_0.isa);
        uint64_t v10 = 0;
      }
      uint64_t v16 = self->_entitlementCache;
      v17 = [NSNumber numberWithBool:v10];
      [(NSMutableDictionary *)v16 setObject:v17 forKey:v4];
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)description
{
  return [(GEONavdClientInfo *)self->_clientInfo canonicalName];
}

- (GEONavdClientInfo)clientInfo
{
  return self->_clientInfo;
}

- (BOOL)expectingUpdates
{
  return self->_expectingUpdates;
}

- (void)setExpectingUpdates:(BOOL)a3
{
  self->_expectingUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_entitlementCache, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end