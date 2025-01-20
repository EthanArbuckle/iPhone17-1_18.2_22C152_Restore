@interface MUWebPlacecardBridgeConfiguration
- (BOOL)isEqual:(id)a3;
- (MUWebPlacecardBridgeConfiguration)initWithNativeControllerName:(id)a3 webControllerName:(id)a4;
- (NSString)manifestFileDirectory;
- (NSString)manifestSignedResourceName;
- (NSString)nativeControllerName;
- (NSString)webBundleEntryPoint;
- (NSString)webControllerName;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
@end

@implementation MUWebPlacecardBridgeConfiguration

- (MUWebPlacecardBridgeConfiguration)initWithNativeControllerName:(id)a3 webControllerName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MUWebPlacecardBridgeConfiguration;
  v8 = [(MUWebPlacecardBridgeConfiguration *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    nativeControllerName = v8->_nativeControllerName;
    v8->_nativeControllerName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    webControllerName = v8->_webControllerName;
    v8->_webControllerName = (NSString *)v11;
  }
  return v8;
}

- (NSString)webBundleEntryPoint
{
  return (NSString *)@"dist/index.html";
}

- (NSString)manifestSignedResourceName
{
  return (NSString *)@"placecard.cms";
}

- (NSString)manifestFileDirectory
{
  return (NSString *)@"dist/manifest.json";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  nativeControllerName = self->_nativeControllerName;
  webControllerName = self->_webControllerName;
  return (id)[v4 initWithNativeControllerName:nativeControllerName webControllerName:webControllerName];
}

- (unint64_t)hash
{
  v3 = [(MUWebPlacecardBridgeConfiguration *)self nativeControllerName];
  uint64_t v4 = [v3 hash];
  v5 = [(MUWebPlacecardBridgeConfiguration *)self webControllerName];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MUWebPlacecardBridgeConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v10 = 1;
  }
  else
  {
    unint64_t v6 = [(MUWebPlacecardBridgeConfiguration *)v4 nativeControllerName];
    id v7 = [(MUWebPlacecardBridgeConfiguration *)self nativeControllerName];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(MUWebPlacecardBridgeConfiguration *)v5 webControllerName];
      uint64_t v9 = [(MUWebPlacecardBridgeConfiguration *)self webControllerName];
      char v10 = [v8 isEqualToString:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  return v10;
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
}

@end