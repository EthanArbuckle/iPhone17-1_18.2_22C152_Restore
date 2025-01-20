@interface MADSystemSearchMD4TextEncoderResource
- (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)version;
@end

@implementation MADSystemSearchMD4TextEncoderResource

- (int64_t)revision
{
  return 8;
}

- (int64_t)tokenEmbeddingType
{
  return 4;
}

- (unint64_t)version
{
  return 4;
}

@end