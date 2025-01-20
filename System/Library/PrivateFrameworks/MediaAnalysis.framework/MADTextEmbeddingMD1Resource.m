@interface MADTextEmbeddingMD1Resource
+ (id)sharedResource;
+ (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)version;
@end

@implementation MADTextEmbeddingMD1Resource

+ (id)sharedResource
{
  v2 = +[VCPSharedInstanceManager sharedManager];
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 sharedInstanceWithIdentifier:v4 andCreationBlock:&__block_literal_global];

  return v5;
}

MADTextEmbeddingMD1Resource *__45__MADTextEmbeddingMD1Resource_sharedResource__block_invoke()
{
  v0 = objc_alloc_init(MADTextEmbeddingMD1Resource);
  return v0;
}

- (unint64_t)version
{
  return 1;
}

+ (int64_t)revision
{
  return 6;
}

- (int64_t)tokenEmbeddingType
{
  return 1;
}

@end