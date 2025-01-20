@interface DDSServerConfiguration
- (BOOL)isEqual:(id)a3;
- (DDSServerConfiguration)initWithXPCServiceName:(id)a3 assertionStorageDirectoryURL:(id)a4;
- (NSString)xpcServiceName;
- (NSURL)assertionStorageDirectoryURL;
- (unint64_t)hash;
@end

@implementation DDSServerConfiguration

- (DDSServerConfiguration)initWithXPCServiceName:(id)a3 assertionStorageDirectoryURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DDSServerConfiguration;
  v8 = [(DDSServerConfiguration *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    xpcServiceName = v8->_xpcServiceName;
    v8->_xpcServiceName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    assertionStorageDirectoryURL = v8->_assertionStorageDirectoryURL;
    v8->_assertionStorageDirectoryURL = (NSURL *)v11;
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    id v7 = [(DDSServerConfiguration *)self xpcServiceName];
    v8 = [v6 xpcServiceName];
    if ([v7 isEqualToString:v8])
    {
      uint64_t v9 = [(DDSServerConfiguration *)self assertionStorageDirectoryURL];
      v10 = [v6 assertionStorageDirectoryURL];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  v9.receiver = self;
  v9.super_class = (Class)DDSServerConfiguration;
  unint64_t v3 = [(DDSServerConfiguration *)&v9 hash];
  id v4 = [(DDSServerConfiguration *)self xpcServiceName];
  uint64_t v5 = [v4 hash];

  id v6 = [(DDSServerConfiguration *)self assertionStorageDirectoryURL];
  unint64_t v7 = v5 ^ [v6 hash] ^ v3;

  return v7;
}

- (NSString)xpcServiceName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)assertionStorageDirectoryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionStorageDirectoryURL, 0);
  objc_storeStrong((id *)&self->_xpcServiceName, 0);
}

@end