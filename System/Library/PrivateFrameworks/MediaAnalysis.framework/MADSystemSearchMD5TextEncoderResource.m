@interface MADSystemSearchMD5TextEncoderResource
- (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)version;
@end

@implementation MADSystemSearchMD5TextEncoderResource

- (int64_t)revision
{
  return 9;
}

- (int64_t)tokenEmbeddingType
{
  return 5;
}

- (unint64_t)version
{
  return 5;
}

@end