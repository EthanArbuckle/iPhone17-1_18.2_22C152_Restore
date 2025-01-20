@interface CustomAsset
+ (BOOL)supportsSecureCoding;
- (CustomAsset)initWithCoder:(id)a3;
- (CustomAsset)initWithPath:(id)a3;
- (NSString)description;
- (id)getAssetLocale;
- (id)getAssetMetadata;
- (id)getAssetPath;
- (id)getAssetSetName;
- (id)getAssetVersion;
- (id)toDictionary;
- (int64_t)getAssetType;
- (void)appendPathWithServiceAssetFolder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CustomAsset

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (void)encodeWithCoder:(id)a3
{
  path = self->_path;
  id v5 = a3;
  [v5 encodeObject:path forKey:@"path"];
  [v5 encodeObject:self->_version forKey:@"version"];
  [v5 encodeObject:self->_assetMetadata forKey:@"assetMetadata"];
}

- (CustomAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CustomAsset;
  id v5 = [(CustomAsset *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"version"];
    version = v5->_version;
    v5->_version = (NSString *)v8;

    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"assetMetadata"];
    assetMetadata = v5->_assetMetadata;
    v5->_assetMetadata = (NSDictionary *)v13;
  }
  return v5;
}

- (id)getAssetLocale
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[CustomAsset getAssetLocale]";
    _os_log_debug_impl(&dword_2263A0000, v2, OS_LOG_TYPE_DEBUG, "%s CustomAssets don't support getAssetLocale method.", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (void)appendPathWithServiceAssetFolder:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = CDMOSLoggerForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 136315138;
    id v5 = "-[CustomAsset appendPathWithServiceAssetFolder:]";
    _os_log_debug_impl(&dword_2263A0000, v3, OS_LOG_TYPE_DEBUG, "%s CustomAssets don't support appendPathWithServiceAssetFolder method.", (uint8_t *)&v4, 0xCu);
  }
}

- (id)toDictionary
{
  v3 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:5];
  int v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 setObject:v5 forKey:@"type"];

  uint64_t v6 = [(CustomAsset *)self getAssetPath];
  [v3 setObject:v6 forKey:@"path"];

  v7 = [(CustomAsset *)self getAssetVersion];
  [v3 setObject:v7 forKey:@"version"];

  uint64_t v8 = [(CustomAsset *)self getAssetMetadata];
  [v3 setObject:v8 forKey:@"asset_metadata"];

  return v3;
}

- (NSString)description
{
  v3 = NSString;
  int v4 = [(CustomAsset *)self getAssetPath];
  id v5 = [(CustomAsset *)self getAssetVersion];
  uint64_t v6 = [(CustomAsset *)self getAssetMetadata];
  v7 = [v3 stringWithFormat:@"[Custom asset] - Asset path: %@, Asset version: %@, Asset metadata: %@.", v4, v5, v6];

  return (NSString *)v7;
}

- (id)getAssetSetName
{
  return 0;
}

- (id)getAssetMetadata
{
  return self->_assetMetadata;
}

- (id)getAssetVersion
{
  return self->_version;
}

- (id)getAssetPath
{
  return self->_path;
}

- (int64_t)getAssetType
{
  return 1;
}

- (CustomAsset)initWithPath:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CustomAsset;
  uint64_t v6 = [(CustomAsset *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_path, a3);
    uint64_t v8 = +[CDMAssetsUtils loadAssetMetadataFromAsset:v7->_path];
    assetMetadata = v7->_assetMetadata;
    v7->_assetMetadata = (NSDictionary *)v8;

    uint64_t v10 = +[CDMAssetsUtils getAssetVersionFromAssetMetadata:v7->_assetMetadata];
    version = v7->_version;
    v7->_version = (NSString *)v10;
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end