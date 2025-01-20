@interface FinHealthEntitlementsChecker
- (BOOL)_BOOLValueOfEntitlement:(id)a3;
- (BOOL)fhAllAccess;
- (FinHealthEntitlementsChecker)initWithConnection:(id)a3;
- (NSXPCConnection)connection;
- (id)_arrayValueOfEntitlement:(id)a3;
- (id)_stringValueOfEntitlement:(id)a3;
- (id)applicationID;
- (void)copyValueOfEntitlement:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation FinHealthEntitlementsChecker

- (FinHealthEntitlementsChecker)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FinHealthEntitlementsChecker;
  v6 = [(FinHealthEntitlementsChecker *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connection, a3);
  }

  return v7;
}

- (id)applicationID
{
  v2 = [(FinHealthEntitlementsChecker *)self _stringValueOfEntitlement:@"application-identifier"];
  id v3 = [v2 copy];

  return v3;
}

- (BOOL)fhAllAccess
{
  return [(FinHealthEntitlementsChecker *)self _BOOLValueOfEntitlement:@"com.apple.finhealth.all-access"];
}

- (BOOL)_BOOLValueOfEntitlement:(id)a3
{
  CFBooleanRef v3 = [(FinHealthEntitlementsChecker *)self copyValueOfEntitlement:a3];
  if (!v3) {
    return 0;
  }
  CFBooleanRef v4 = v3;
  CFTypeID v5 = CFGetTypeID(v3);
  BOOL v6 = v5 == CFBooleanGetTypeID() && CFBooleanGetValue(v4) != 0;
  CFRelease(v4);
  return v6;
}

- (id)_arrayValueOfEntitlement:(id)a3
{
  CFBooleanRef v3 = [(FinHealthEntitlementsChecker *)self copyValueOfEntitlement:a3];
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID()) {
      BOOL v6 = v4;
    }
    else {
      BOOL v6 = 0;
    }
    id v7 = v6;
    CFRelease(v4);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (id)_stringValueOfEntitlement:(id)a3
{
  CFBooleanRef v3 = [(FinHealthEntitlementsChecker *)self copyValueOfEntitlement:a3];
  if (v3)
  {
    CFBooleanRef v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 == CFStringGetTypeID()) {
      BOOL v6 = v4;
    }
    else {
      BOOL v6 = 0;
    }
    id v7 = v6;
    CFRelease(v4);
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (void)copyValueOfEntitlement:(id)a3
{
  CFBooleanRef v4 = (__CFString *)a3;
  CFErrorRef error = 0;
  connection = self->_connection;
  if (connection) {
    [(NSXPCConnection *)connection auditToken];
  }
  else {
    memset(&v11, 0, sizeof(v11));
  }
  BOOL v6 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &v11);
  CFTypeRef v7 = SecTaskCopyValueForEntitlement(v6, v4, &error);
  if (error)
  {
    v8 = FinHealthLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v14 = error;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to get entitlements: %@", buf, 0xCu);
    }

    CFRelease(error);
  }
  if (v7)
  {
    objc_super v9 = FinHealthLogObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      CFErrorRef v14 = (CFErrorRef)v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Client has entitlement for %@", buf, 0xCu);
    }
  }
  CFRelease(v6);

  return (void *)v7;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end