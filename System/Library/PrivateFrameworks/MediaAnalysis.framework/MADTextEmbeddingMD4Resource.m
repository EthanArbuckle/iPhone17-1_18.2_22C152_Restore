@interface MADTextEmbeddingMD4Resource
+ (id)sharedResource;
+ (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)calibrationVersion;
- (unint64_t)version;
@end

@implementation MADTextEmbeddingMD4Resource

+ (id)sharedResource
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 sharedInstanceWithIdentifier:v4 andCreationBlock:&__block_literal_global_252];

  return v5;
}

MADTextEmbeddingMD4Resource *__45__MADTextEmbeddingMD4Resource_sharedResource__block_invoke()
{
  v0 = objc_alloc_init(MADTextEmbeddingMD4Resource);
  return v0;
}

- (unint64_t)version
{
  return 4;
}

+ (int64_t)revision
{
  return 8;
}

- (int64_t)tokenEmbeddingType
{
  return 4;
}

- (unint64_t)calibrationVersion
{
  return 3;
}

@end