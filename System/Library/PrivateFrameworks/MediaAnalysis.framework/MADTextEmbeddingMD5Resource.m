@interface MADTextEmbeddingMD5Resource
+ (id)sharedResource;
+ (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)calibrationVersion;
- (unint64_t)version;
@end

@implementation MADTextEmbeddingMD5Resource

+ (id)sharedResource
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 sharedInstanceWithIdentifier:v4 andCreationBlock:&__block_literal_global_260];

  return v5;
}

MADTextEmbeddingMD5Resource *__45__MADTextEmbeddingMD5Resource_sharedResource__block_invoke()
{
  v0 = objc_alloc_init(MADTextEmbeddingMD5Resource);
  return v0;
}

- (unint64_t)version
{
  return 5;
}

+ (int64_t)revision
{
  return 9;
}

- (int64_t)tokenEmbeddingType
{
  return 5;
}

- (unint64_t)calibrationVersion
{
  if (_os_feature_enabled_impl()) {
    return 5;
  }
  else {
    return 4;
  }
}

@end