@interface NilAsset
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (NilAsset)initWithCoder:(id)a3;
- (id)getAssetLocale;
- (id)getAssetMetadata;
- (id)getAssetPath;
- (id)getAssetSetName;
- (id)getAssetVersion;
- (id)toDictionary;
- (int64_t)getAssetType;
@end

@implementation NilAsset

- (NilAsset)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NilAsset;
  return [(NilAsset *)&v4 init];
}

- (id)getAssetSetName
{
  return 0;
}

- (id)getAssetLocale
{
  return 0;
}

- (id)toDictionary
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v3 = (objc_class *)objc_opt_class();
  objc_super v4 = NSStringFromClass(v3);
  [v2 setObject:v4 forKey:@"type"];

  return v2;
}

- (NSString)description
{
  v3 = NSString;
  objc_super v4 = [(NilAsset *)self getAssetPath];
  v5 = [(NilAsset *)self getAssetVersion];
  v6 = [(NilAsset *)self getAssetMetadata];
  v7 = [v3 stringWithFormat:@"[Nil asset] - Asset path: %@, Asset version: %@, Asset metadata: %@.", v4, v5, v6];

  return (NSString *)v7;
}

- (id)getAssetMetadata
{
  return 0;
}

- (id)getAssetVersion
{
  return 0;
}

- (id)getAssetPath
{
  return 0;
}

- (int64_t)getAssetType
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end