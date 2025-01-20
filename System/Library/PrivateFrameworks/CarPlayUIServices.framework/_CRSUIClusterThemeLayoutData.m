@interface _CRSUIClusterThemeLayoutData
+ (BOOL)supportsBSXPCSecureCoding;
- (NSArray)displays;
- (NSDictionary)themeData;
- (NSSecurityScopedURLWrapper)assetBaseURL;
- (NSSecurityScopedURLWrapper)extraAssetsURL;
- (_CRSUIClusterThemeLayoutData)initWithBSXPCCoder:(id)a3;
- (unint64_t)assetVersion;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setAssetBaseURL:(id)a3;
- (void)setAssetVersion:(unint64_t)a3;
- (void)setDisplays:(id)a3;
- (void)setExtraAssetsURL:(id)a3;
- (void)setThemeData:(id)a3;
@end

@implementation _CRSUIClusterThemeLayoutData

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (_CRSUIClusterThemeLayoutData)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_CRSUIClusterThemeLayoutData;
  v5 = [(_CRSUIClusterThemeLayoutData *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeDictionaryOfClass:objc_opt_class() forKey:@"themeData"];
    themeData = v5->_themeData;
    v5->_themeData = (NSDictionary *)v6;

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = [v4 decodeCollectionOfClass:v8 containingClass:objc_opt_class() forKey:@"displays"];
    displays = v5->_displays;
    v5->_displays = (NSArray *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetBaseURL"];
    assetBaseURL = v5->_assetBaseURL;
    v5->_assetBaseURL = (NSSecurityScopedURLWrapper *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extraAssetsURL"];
    extraAssetsURL = v5->_extraAssetsURL;
    v5->_extraAssetsURL = (NSSecurityScopedURLWrapper *)v13;

    v5->_assetVersion = [v4 decodeUInt64ForKey:@"assetVersion"];
  }

  return v5;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v8 = a3;
  id v4 = [(_CRSUIClusterThemeLayoutData *)self themeData];
  [v8 encodeDictionary:v4 forKey:@"themeData"];

  v5 = [(_CRSUIClusterThemeLayoutData *)self displays];
  [v8 encodeCollection:v5 forKey:@"displays"];

  uint64_t v6 = [(_CRSUIClusterThemeLayoutData *)self assetBaseURL];
  [v8 encodeObject:v6 forKey:@"assetBaseURL"];

  v7 = [(_CRSUIClusterThemeLayoutData *)self extraAssetsURL];
  [v8 encodeObject:v7 forKey:@"extraAssetsURL"];

  objc_msgSend(v8, "encodeUInt64:forKey:", -[_CRSUIClusterThemeLayoutData assetVersion](self, "assetVersion"), @"assetVersion");
}

- (NSDictionary)themeData
{
  return self->_themeData;
}

- (void)setThemeData:(id)a3
{
}

- (NSArray)displays
{
  return self->_displays;
}

- (void)setDisplays:(id)a3
{
}

- (NSSecurityScopedURLWrapper)assetBaseURL
{
  return self->_assetBaseURL;
}

- (void)setAssetBaseURL:(id)a3
{
}

- (NSSecurityScopedURLWrapper)extraAssetsURL
{
  return self->_extraAssetsURL;
}

- (void)setExtraAssetsURL:(id)a3
{
}

- (unint64_t)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(unint64_t)a3
{
  self->_assetVersion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraAssetsURL, 0);
  objc_storeStrong((id *)&self->_assetBaseURL, 0);
  objc_storeStrong((id *)&self->_displays, 0);
  objc_storeStrong((id *)&self->_themeData, 0);
}

@end