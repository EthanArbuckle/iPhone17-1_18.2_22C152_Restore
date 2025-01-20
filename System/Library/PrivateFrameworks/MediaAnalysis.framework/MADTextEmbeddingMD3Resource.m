@interface MADTextEmbeddingMD3Resource
+ (id)sharedResource;
+ (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)calibrationVersion;
- (unint64_t)version;
@end

@implementation MADTextEmbeddingMD3Resource

+ (id)sharedResource
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 sharedInstanceWithIdentifier:v4 andCreationBlock:&__block_literal_global_243];

  return v5;
}

MADTextEmbeddingMD3Resource *__45__MADTextEmbeddingMD3Resource_sharedResource__block_invoke()
{
  v0 = objc_alloc_init(MADTextEmbeddingMD3Resource);
  return v0;
}

- (unint64_t)version
{
  return 3;
}

+ (int64_t)revision
{
  return 5;
}

- (int64_t)tokenEmbeddingType
{
  return 3;
}

- (unint64_t)calibrationVersion
{
  return 2;
}

@end