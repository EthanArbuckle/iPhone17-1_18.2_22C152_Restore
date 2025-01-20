@interface MUWebBridgeConfiguration
- (BOOL)isEqual:(id)a3;
- (MUWebBridgeConfiguration)initWithNativeControllerName:(id)a3 webControllerName:(id)a4 bridgeVersion:(id)a5;
- (NSString)bridgeVersion;
- (NSString)nativeControllerName;
- (NSString)webControllerName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation MUWebBridgeConfiguration

- (MUWebBridgeConfiguration)initWithNativeControllerName:(id)a3 webControllerName:(id)a4 bridgeVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)MUWebBridgeConfiguration;
  v11 = [(MUWebBridgeConfiguration *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    bridgeVersion = v11->_bridgeVersion;
    v11->_bridgeVersion = (NSString *)v12;

    uint64_t v14 = [v8 copy];
    nativeControllerName = v11->_nativeControllerName;
    v11->_nativeControllerName = (NSString *)v14;

    uint64_t v16 = [v9 copy];
    webControllerName = v11->_webControllerName;
    v11->_webControllerName = (NSString *)v16;
  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  nativeControllerName = self->_nativeControllerName;
  webControllerName = self->_webControllerName;
  bridgeVersion = self->_bridgeVersion;
  return (id)[v4 initWithNativeControllerName:nativeControllerName webControllerName:webControllerName bridgeVersion:bridgeVersion];
}

- (unint64_t)hash
{
  v3 = [(MUWebBridgeConfiguration *)self nativeControllerName];
  uint64_t v4 = [v3 hash];
  v5 = [(MUWebBridgeConfiguration *)self webControllerName];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(MUWebBridgeConfiguration *)self bridgeVersion];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MUWebBridgeConfiguration *)a3;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(MUWebBridgeConfiguration *)v5 nativeControllerName];
      v7 = [(MUWebBridgeConfiguration *)self nativeControllerName];
      if ([v6 isEqualToString:v7])
      {
        unint64_t v8 = [(MUWebBridgeConfiguration *)v5 webControllerName];
        id v9 = [(MUWebBridgeConfiguration *)self webControllerName];
        if ([v8 isEqualToString:v9])
        {
          id v10 = [(MUWebBridgeConfiguration *)v5 bridgeVersion];
          v11 = [(MUWebBridgeConfiguration *)self bridgeVersion];
          char v12 = [v10 isEqualToString:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (NSString)bridgeVersion
{
  return self->_bridgeVersion;
}

- (NSString)nativeControllerName
{
  return self->_nativeControllerName;
}

- (NSString)webControllerName
{
  return self->_webControllerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webControllerName, 0);
  objc_storeStrong((id *)&self->_nativeControllerName, 0);
  objc_storeStrong((id *)&self->_bridgeVersion, 0);
}

@end