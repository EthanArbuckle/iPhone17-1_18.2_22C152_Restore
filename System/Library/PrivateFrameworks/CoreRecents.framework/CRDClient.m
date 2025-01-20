@interface CRDClient
- (BOOL)hasEntitlement:(id)a3;
- (CRDClient)initWithConnection:(id)a3 library:(id)a4;
- (NSString)bundleIdentifier;
- (NSXPCConnection)connection;
- (_CRRecentsLibrary)library;
- (void)dealloc;
@end

@implementation CRDClient

- (CRDClient)initWithConnection:(id)a3 library:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CRDClient;
  v6 = [(CRDClient *)&v8 init];
  if (v6)
  {
    v6->_connection = (NSXPCConnection *)a3;
    v6->_library = (_CRRecentsLibrary *)a4;
  }
  return v6;
}

- (_CRRecentsLibrary)library
{
  return self->_library;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v3 = [(NSXPCConnection *)self->_connection valueForEntitlement:a3];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  return [v3 BOOLValue];
}

- (NSString)bundleIdentifier
{
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  else {
    memset(v4, 0, sizeof(v4));
  }
  return (NSString *)+[CNAuditTokenUtilities bundleIdentifierForAuditToken:](CNAuditTokenUtilities, "bundleIdentifierForAuditToken:", +[CNAuditToken auditToken:v4]);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CRDClient;
  [(CRDClient *)&v3 dealloc];
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

@end