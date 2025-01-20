@interface XPCClient
+ (id)clientIDForConnection:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSData)auditTokenData;
- (NSString)bundlePath;
- (NSString)clientID;
- (NSString)clientIDHeader;
- (NSString)clientVersion;
- (NSString)userAgent;
- (XPCClient)init;
- (XPCClient)initWithApplicationID:(id)a3;
- (XPCClient)initWithConnection:(id)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation XPCClient

- (XPCClient)initWithConnection:(id)a3
{
  v3 = (void *)__chkstk_darwin(self);
  id v5 = v4;
  v19[0].receiver = v3;
  v19[0].super_class = (Class)XPCClient;
  v6 = [(objc_super *)v19 init];
  if (v6)
  {
    if (!v5)
    {
LABEL_16:
      sub_100006298((uint64_t)v6);
      goto LABEL_17;
    }
    clientVersion = (NSString *)v5;
    self;
    v19[1] = 0u;
    *(_OWORD *)pid = 0u;
    [(NSString *)clientVersion auditToken];
    int v8 = proc_pidpath(pid[1], buffer, 0x1000u);
    if (v8 <= 0)
    {
      v9 = 0;
    }
    else
    {
      v9 = (__CFString *)[objc_alloc((Class)NSString) initWithBytes:buffer length:v8 encoding:4];

      if (!v9) {
        goto LABEL_15;
      }
      CFURLRef v10 = CFURLCreateWithFileSystemPath(0, v9, kCFURLPOSIXPathStyle, 0);
      if (v10)
      {
        CFURLRef v11 = v10;
        CFURLRef v12 = (const __CFURL *)_CFBundleCopyBundleURLForExecutableURL();
        if (v12)
        {
          CFURLRef v13 = v12;
          v14 = CFBundleCreate(0, v12);
          if (v14)
          {
            v15 = v14;
            sub_1000085F4(v6, v14);
            CFRelease(v15);
          }
          CFRelease(v13);
        }
        CFRelease(v11);
      }
      if (v6->_clientID) {
        goto LABEL_15;
      }
      uint64_t v16 = [(__CFString *)v9 lastPathComponent];
      clientID = v6->_clientID;
      v6->_clientID = (NSString *)v16;

      clientVersion = v6->_clientVersion;
      v6->_clientVersion = (NSString *)@"1.0";
    }

LABEL_15:
    goto LABEL_16;
  }
LABEL_17:

  return v6;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (XPCClient)init
{
  return [(XPCClient *)self initWithConnection:0];
}

- (XPCClient)initWithApplicationID:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)XPCClient;
  id v5 = [(XPCClient *)&v16 init];
  if (v5)
  {
    id v7 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
    int v8 = v7;
    if (v7)
    {
      CFURLRef v9 = [v7 URL];
      if (v9)
      {
        CFURLRef v10 = CFBundleCreate(0, v9);
        if (v10)
        {
          CFURLRef v11 = v10;
          sub_1000085F4(v5, v10);
          CFRelease(v11);
        }
      }
    }
    if (!v5->_clientID)
    {
      CFURLRef v12 = (NSString *)[v4 copy];
      clientID = v5->_clientID;
      v5->_clientID = v12;

      clientVersion = v5->_clientVersion;
      v5->_clientVersion = (NSString *)@"1.0";
    }
    sub_100006298((uint64_t)v5);
  }

  return v5;
}

+ (id)clientIDForConnection:(id)a3
{
  id v3 = a3;
  id v4 = [[XPCClient alloc] initWithConnection:v3];

  id v5 = [(XPCClient *)v4 clientID];

  return v5;
}

- (NSData)auditTokenData
{
  return self->_auditTokenData;
}

- (NSString)bundlePath
{
  return self->_bundlePath;
}

- (NSString)clientVersion
{
  return self->_clientVersion;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)XPCClient;
  id v3 = [(XPCClient *)&v6 description];
  id v4 = +[NSString stringWithFormat:@"%@: %@", v3, self->_clientID];

  return v4;
}

- (unint64_t)hash
{
  return [(NSString *)self->_clientID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    clientID = self->_clientID;
    int v8 = [v4 clientID];
    unsigned __int8 v6 = [(NSString *)clientID isEqual:v8];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (NSString)clientIDHeader
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIDHeader, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_clientVersion, 0);
  objc_storeStrong((id *)&self->_bundlePath, 0);
  objc_storeStrong((id *)&self->_auditTokenData, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end