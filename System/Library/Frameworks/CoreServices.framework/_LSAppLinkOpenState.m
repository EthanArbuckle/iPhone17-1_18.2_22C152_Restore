@interface _LSAppLinkOpenState
+ (BOOL)supportsSecureCoding;
- (BOOL)includeLinksForCallingApplication;
- (NSDictionary)browserState;
- (NSString)bundleIdentifier;
- (NSURL)URL;
- (NSXPCConnection)XPCConnection;
- (_LSAppLinkOpenState)initWithCoder:(id)a3;
- (_LSOpenConfiguration)openConfiguration;
- (const)auditToken;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setAuditToken:(id *)a3;
- (void)setBrowserState:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setIncludeLinksForCallingApplication:(BOOL)a3;
- (void)setOpenConfiguration:(id)a3;
- (void)setURL:(id)a3;
- (void)setXPCConnection:(id)a3;
@end

@implementation _LSAppLinkOpenState

- (const)auditToken
{
  if (self->_auditToken.__engaged_) {
    return (const $115C4C562B26FF47E01F9F4EA65B5887 *)&self->_auditToken;
  }
  else {
    return 0;
  }
}

- (void)setAuditToken:(id *)a3
{
  if (a3)
  {
    BOOL engaged = self->_auditToken.__engaged_;
    long long v4 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)&self->_auditToken.var0.__null_state_ = *(_OWORD *)a3->var0;
    *(_OWORD *)&self->_auditToken.var0.val[4] = v4;
    if (!engaged) {
      self->_auditToken.__engaged_ = 1;
    }
  }
  else if (self->_auditToken.__engaged_)
  {
    self->_auditToken.__engaged_ = 0;
  }
  XPCConnection = self->_XPCConnection;
  self->_XPCConnection = 0;
}

- (NSXPCConnection)XPCConnection
{
  return self->_XPCConnection;
}

- (void)setXPCConnection:(id)a3
{
  long long v4 = (NSXPCConnection *)a3;
  v5 = v4;
  if (v4)
  {
    [(NSXPCConnection *)v4 auditToken];
    BOOL engaged = self->_auditToken.__engaged_;
    *(_OWORD *)&self->_auditToken.var0.__null_state_ = v8;
    *(_OWORD *)&self->_auditToken.var0.val[4] = v9;
    if (!engaged) {
      self->_auditToken.__engaged_ = 1;
    }
  }
  else if (self->_auditToken.__engaged_)
  {
    self->_auditToken.__engaged_ = 0;
  }
  XPCConnection = self->_XPCConnection;
  self->_XPCConnection = v5;
}

- (id)debugDescription
{
  v3 = NSString;
  v11.receiver = self;
  v11.super_class = (Class)_LSAppLinkOpenState;
  long long v4 = [(_LSAppLinkOpenState *)&v11 description];
  v5 = [(_LSAppLinkOpenState *)self URL];
  v6 = [(_LSAppLinkOpenState *)self browserState];
  uint64_t v7 = [v6 count];
  long long v8 = [(_LSAppLinkOpenState *)self openConfiguration];
  long long v9 = [v3 stringWithFormat:@"%@ { URL = %@, browserState = %lu, openconfig = %@ }", v4, v5, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    uint64_t v5 = [(NSURL *)self->_URL copy];
    v6 = *(void **)(v4 + 64);
    *(void *)(v4 + 64) = v5;

    uint64_t v7 = [(NSString *)self->_bundleIdentifier copy];
    long long v8 = *(void **)(v4 + 72);
    *(void *)(v4 + 72) = v7;

    uint64_t v9 = [(_LSOpenConfiguration *)self->_openConfiguration copy];
    v10 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v9;

    uint64_t v11 = [(NSDictionary *)self->_browserState copy];
    v12 = *(void **)(v4 + 88);
    *(void *)(v4 + 88) = v11;

    objc_storeStrong((id *)(v4 + 48), self->_XPCConnection);
    *(unsigned char *)(v4 + 56) = self->_includeLinksForCallingApplication;
  }
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(_LSAppLinkOpenState *)self URL];
  [v7 encodeObject:v4 forKey:@"URL"];

  uint64_t v5 = [(_LSAppLinkOpenState *)self openConfiguration];
  [v7 encodeObject:v5 forKey:@"openConfiguration"];

  v6 = [(_LSAppLinkOpenState *)self browserState];
  [v7 encodeObject:v6 forKey:@"browserState"];

  objc_msgSend(v7, "encodeBool:forKey:", -[_LSAppLinkOpenState includeLinksForCallingApplication](self, "includeLinksForCallingApplication"), @"includeLinksForCallingApplication");
}

- (_LSAppLinkOpenState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(_LSAppLinkOpenState *)self init];
  if (v5)
  {
    v6 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"URL");
    [(_LSAppLinkOpenState *)v5 setURL:v6];

    id v7 = objc_msgSend(v4, "ls_decodeObjectOfClass:forKey:", objc_opt_class(), @"openConfiguration");
    [(_LSAppLinkOpenState *)v5 setOpenConfiguration:v7];

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = XNSGetPropertyListClasses();
    v10 = objc_msgSend(v4, "ls_decodeDictionaryWithKeysOfClass:valuesOfClasses:forKey:", v8, v9, @"browserState");
    [(_LSAppLinkOpenState *)v5 setBrowserState:v10];

    -[_LSAppLinkOpenState setIncludeLinksForCallingApplication:](v5, "setIncludeLinksForCallingApplication:", [v4 decodeBoolForKey:@"includeLinksForCallingApplication"]);
  }

  return v5;
}

- (NSURL)URL
{
  return (NSURL *)objc_getProperty(self, a2, 64, 1);
}

- (void)setURL:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (_LSOpenConfiguration)openConfiguration
{
  return (_LSOpenConfiguration *)objc_getProperty(self, a2, 80, 1);
}

- (void)setOpenConfiguration:(id)a3
{
}

- (NSDictionary)browserState
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBrowserState:(id)a3
{
}

- (BOOL)includeLinksForCallingApplication
{
  return self->_includeLinksForCallingApplication;
}

- (void)setIncludeLinksForCallingApplication:(BOOL)a3
{
  self->_includeLinksForCallingApplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browserState, 0);
  objc_storeStrong((id *)&self->_openConfiguration, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_URL, 0);

  objc_storeStrong((id *)&self->_XPCConnection, 0);
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 40) = 0;
  return self;
}

@end