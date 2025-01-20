@interface UAFNLAsset
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (UAFNLAsset)initWithCoder:(id)a3;
- (id)getAssetLocale;
- (id)getAssetMetadata;
- (id)getAssetPath;
- (id)getAssetSet;
- (id)getAssetSetName;
- (id)getAssetVersion;
- (id)getFactorName;
- (id)initForFactor:(id)a3 withPath:(id)a4 withAssetSetName:(id)a5 withUAFMetadata:(id)a6 withAssetSet:(id)a7;
- (id)toDictionary;
- (int64_t)getAssetType;
- (void)appendPathWithServiceAssetFolder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)processUAFMetadata:(id)a3;
@end

@implementation UAFNLAsset

- (id)getAssetMetadata
{
  return self->_assetMetadata;
}

- (id)getAssetPath
{
  return self->_path;
}

- (void)appendPathWithServiceAssetFolder:(id)a3
{
  id v4 = a3;
  v5 = [(UAFNLAsset *)self getAssetPath];
  v6 = +[CDMAssetsUtils appendPathWithServiceAssetFolder:v4 assetPath:v5];

  path = self->_path;
  self->_path = v6;

  self->_assetMetadata = +[CDMAssetsUtils loadAssetMetadataFromAsset:self->_path];
  MEMORY[0x270F9A758]();
}

- (int64_t)getAssetType
{
  return 2;
}

- (id)getAssetLocale
{
  return self->_assetLocale;
}

- (id)getAssetVersion
{
  return self->_assetVersion;
}

- (id)getAssetSetName
{
  return self->_assetSetName;
}

- (void)processUAFMetadata:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKey:@"locale"];
  assetLocale = self->_assetLocale;
  self->_assetLocale = v5;

  if (self->_assetLocale)
  {
    +[CDMPlatformUtils normalizeLocaleIdentifier:](CDMPlatformUtils, "normalizeLocaleIdentifier:");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = self->_assetLocale;
    self->_assetLocale = v7;

    v9 = CDMOSLoggerForCategory(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = [v4 objectForKey:@"locale"];
      v13 = self->_assetLocale;
      int v14 = 136315650;
      v15 = "-[UAFNLAsset processUAFMetadata:]";
      __int16 v16 = 2112;
      v17 = v12;
      __int16 v18 = 2112;
      v19 = v13;
      _os_log_debug_impl(&dword_2263A0000, v9, OS_LOG_TYPE_DEBUG, "%s Normalize locale from UAF metadata: %@ to be locale: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  v10 = [v4 objectForKey:@"version"];
  assetVersion = self->_assetVersion;
  self->_assetVersion = v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSet, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetLocale, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_factorName, 0);
}

- (void)encodeWithCoder:(id)a3
{
  factorName = self->_factorName;
  id v5 = a3;
  [v5 encodeObject:factorName forKey:@"factorName"];
  [v5 encodeObject:self->_path forKey:@"path"];
  [v5 encodeObject:self->_assetMetadata forKey:@"assetMetadata"];
  [v5 encodeObject:self->_assetLocale forKey:@"assetLocale"];
  [v5 encodeObject:self->_assetVersion forKey:@"assetVersion"];
  [v5 encodeObject:self->_assetSetName forKey:@"assetSetName"];
}

- (UAFNLAsset)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UAFNLAsset;
  id v5 = [(UAFNLAsset *)&v22 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"factorName"];
    factorName = v5->_factorName;
    v5->_factorName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"path"];
    path = v5->_path;
    v5->_path = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetLocale"];
    assetLocale = v5->_assetLocale;
    v5->_assetLocale = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetVersion"];
    assetVersion = v5->_assetVersion;
    v5->_assetVersion = (NSString *)v12;

    int v14 = (void *)MEMORY[0x263EFFA08];
    uint64_t v15 = objc_opt_class();
    __int16 v16 = objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    uint64_t v17 = [v4 decodeObjectOfClasses:v16 forKey:@"assetMetadata"];
    assetMetadata = v5->_assetMetadata;
    v5->_assetMetadata = (NSDictionary *)v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetName"];
    assetSetName = v5->_assetSetName;
    v5->_assetSetName = (NSString *)v19;
  }
  return v5;
}

- (id)toDictionary
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 setObject:v5 forKey:@"type"];

  uint64_t v6 = [(UAFNLAsset *)self getAssetPath];
  [v3 setObject:v6 forKey:@"path"];

  v7 = [(UAFNLAsset *)self getAssetVersion];
  [v3 setObject:v7 forKey:@"version"];

  uint64_t v8 = [(UAFNLAsset *)self getFactorName];
  [v3 setObject:v8 forKey:@"factor"];

  v9 = [(UAFNLAsset *)self getAssetLocale];
  [v3 setObject:v9 forKey:@"locale"];

  uint64_t v10 = [(UAFNLAsset *)self getAssetMetadata];
  [v3 setObject:v10 forKey:@"asset_metadata"];

  v11 = [(UAFNLAsset *)self getAssetSetName];
  [v3 setObject:v11 forKey:@"asset_set_name"];

  return v3;
}

- (NSString)description
{
  id v3 = NSString;
  id v4 = [(UAFNLAsset *)self getFactorName];
  id v5 = [(UAFNLAsset *)self getAssetPath];
  uint64_t v6 = [(UAFNLAsset *)self getAssetVersion];
  v7 = [(UAFNLAsset *)self getAssetLocale];
  uint64_t v8 = [(UAFNLAsset *)self getAssetSetName];
  v9 = [(UAFNLAsset *)self getAssetMetadata];
  uint64_t v10 = [v3 stringWithFormat:@"[UAF asset] - Factor name: %@, Asset path: %@, Asset version: %@, Asset locale: %@, Asset Set Name: %@, Asset metadata: %@.", v4, v5, v6, v7, v8, v9];

  return (NSString *)v10;
}

- (id)getAssetSet
{
  return self->_assetSet;
}

- (id)getFactorName
{
  return self->_factorName;
}

- (id)initForFactor:(id)a3 withPath:(id)a4 withAssetSetName:(id)a5 withUAFMetadata:(id)a6 withAssetSet:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)UAFNLAsset;
  __int16 v18 = [(UAFNLAsset *)&v23 init];
  uint64_t v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_factorName, a3);
    objc_storeStrong((id *)&v19->_path, a4);
    objc_storeStrong((id *)&v19->_assetSetName, a5);
    uint64_t v20 = (NSDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    assetMetadata = v19->_assetMetadata;
    v19->_assetMetadata = v20;

    objc_storeStrong((id *)&v19->_assetSet, a7);
    [(UAFNLAsset *)v19 processUAFMetadata:v16];
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end