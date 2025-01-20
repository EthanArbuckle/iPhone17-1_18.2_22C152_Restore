@interface CARThemeAsset
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToThemeAsset:(id)a3;
- (CARThemeAsset)initWithBaseURL:(id)a3 version:(id)a4;
- (CARThemeAsset)initWithCoder:(id)a3;
- (CARThemeAssetVersion)version;
- (NSString)identifier;
- (NSURL)assetsArchiveURL;
- (NSURL)baseURL;
- (NSURL)layoutURL;
- (id)accessoryAdditionsData;
- (id)certificateData;
- (id)description;
- (id)signatureData;
- (void)accessoryAdditionsData;
- (void)certificateData;
- (void)encodeWithCoder:(id)a3;
- (void)signatureData;
@end

@implementation CARThemeAsset

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CARThemeAsset)initWithBaseURL:(id)a3 version:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CARThemeAsset;
  v9 = [(CARThemeAsset *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_baseURL, a3);
    objc_storeStrong((id *)&v10->_version, a4);
  }

  return v10;
}

- (CARThemeAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"baseURL"];

  id v7 = [(CARThemeAsset *)self initWithBaseURL:v6 version:v5];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CARThemeAsset *)self baseURL];
  [v4 encodeObject:v5 forKey:@"baseURL"];

  id v6 = [(CARThemeAsset *)self version];
  [v4 encodeObject:v6 forKey:@"version"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CARThemeAsset *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CARThemeAsset *)self isEqualToThemeAsset:v4];
  }

  return v5;
}

- (BOOL)isEqualToThemeAsset:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CARThemeAsset *)self baseURL];
  id v6 = [v5 URLByStandardizingPath];

  id v7 = [v4 baseURL];
  id v8 = [v7 URLByStandardizingPath];

  if ([v6 isEqual:v8])
  {
    v9 = [(CARThemeAsset *)self version];
    v10 = [v4 version];
    char v11 = [v9 isEqualToThemeAssetVersion:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)CARThemeAsset;
  id v4 = [(CARThemeAsset *)&v9 description];
  BOOL v5 = [(CARThemeAsset *)self version];
  id v6 = [(CARThemeAsset *)self baseURL];
  id v7 = [v3 stringWithFormat:@"%@ [%@, baseURL: %@]", v4, v5, v6];

  return v7;
}

- (NSString)identifier
{
  v2 = [(CARThemeAsset *)self version];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSURL)layoutURL
{
  v2 = [(CARThemeAsset *)self baseURL];
  v3 = [v2 URLByAppendingPathComponent:@"CarPlayPhone.assets" isDirectory:1];

  return (NSURL *)v3;
}

- (NSURL)assetsArchiveURL
{
  v2 = [(CARThemeAsset *)self baseURL];
  v3 = [v2 URLByAppendingPathComponent:@"CarPlayAccessory.assets.zip" isDirectory:0];

  return (NSURL *)v3;
}

- (id)certificateData
{
  v2 = [(CARThemeAsset *)self baseURL];
  v3 = [v2 URLByAppendingPathComponent:@"Certificate.chain.pem" isDirectory:0];

  id v14 = 0;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:0 error:&v14];
  id v5 = v14;
  if (!v4)
  {
    id v6 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(CARThemeAsset *)(uint64_t)v5 certificateData];
    }
  }
  return v4;
}

- (id)signatureData
{
  v2 = [(CARThemeAsset *)self baseURL];
  v3 = [v2 URLByAppendingPathComponent:@"CarPlayAccessory.assets.sha256" isDirectory:0];

  id v14 = 0;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:0 error:&v14];
  id v5 = v14;
  if (!v4)
  {
    id v6 = CarThemeAssetsLogging();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      [(CARThemeAsset *)(uint64_t)v5 signatureData];
    }
  }
  return v4;
}

- (id)accessoryAdditionsData
{
  v2 = [(CARThemeAsset *)self baseURL];
  v3 = [v2 URLByAppendingPathComponent:@"AccessoryAdditions" isDirectory:0];

  id v16 = 0;
  id v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v3 options:0 error:&v16];
  id v5 = v16;
  id v6 = CarThemeAssetsLogging();
  uint64_t v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_INFO, "Accessory Additions data available", v15, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    [(CARThemeAsset *)(uint64_t)v5 accessoryAdditionsData];
  }

  return v4;
}

- (CARThemeAssetVersion)version
{
  return self->_version;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

- (void)certificateData
{
}

- (void)signatureData
{
}

- (void)accessoryAdditionsData
{
}

@end