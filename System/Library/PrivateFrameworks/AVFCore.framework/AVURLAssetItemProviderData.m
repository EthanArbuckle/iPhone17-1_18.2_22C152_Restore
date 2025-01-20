@interface AVURLAssetItemProviderData
+ (BOOL)supportsSecureCoding;
+ (id)itemProviderDataWithURL:(id)a3 assetInitializationOptions:(id)a4;
- (AVURLAssetItemProviderData)initWithCoder:(id)a3;
- (AVURLAssetItemProviderData)initWithURL:(id)a3 assetInitializationOptions:(id)a4;
- (NSDictionary)assetInitializationOptions;
- (NSURL)securityScopedURL;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVURLAssetItemProviderData

- (AVURLAssetItemProviderData)initWithURL:(id)a3 assetInitializationOptions:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AVURLAssetItemProviderData;
  v6 = [(AVURLAssetItemProviderData *)&v9 init];
  v7 = v6;
  if (a3 && v6)
  {
    v6->_securityScopedURLWrapper = (NSSecurityScopedURLWrapper *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:a3 readonly:1];
    v7->_assetInitializationOptions = (NSDictionary *)[a4 copy];
  }
  else
  {

    return 0;
  }
  return v7;
}

+ (id)itemProviderDataWithURL:(id)a3 assetInitializationOptions:(id)a4
{
  v4 = [[AVURLAssetItemProviderData alloc] initWithURL:a3 assetInitializationOptions:a4];
  return v4;
}

- (AVURLAssetItemProviderData)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVURLAssetItemProviderData;
  v4 = [(AVURLAssetItemProviderData *)&v6 init];
  if (v4)
  {
    v4->_securityScopedURLWrapper = (NSSecurityScopedURLWrapper *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"AVURLAssetItemProviderURLWrapperKey"];
    v4->_assetInitializationOptions = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", +[AVURLAsset _initializationOptionsClasses](AVURLAsset, "_initializationOptionsClasses"), @"AVURLAssetItemProviderAssetInitializationOptionsKey");
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVURLAssetItemProviderData;
  [(AVURLAssetItemProviderData *)&v3 dealloc];
}

- (NSURL)securityScopedURL
{
  return (NSURL *)[(NSSecurityScopedURLWrapper *)self->_securityScopedURLWrapper url];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_securityScopedURLWrapper forKey:@"AVURLAssetItemProviderURLWrapperKey"];
  assetInitializationOptions = self->_assetInitializationOptions;
  [a3 encodeObject:assetInitializationOptions forKey:@"AVURLAssetItemProviderAssetInitializationOptionsKey"];
}

- (NSDictionary)assetInitializationOptions
{
  return self->_assetInitializationOptions;
}

@end