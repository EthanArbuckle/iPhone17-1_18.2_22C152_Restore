@interface MADSystemSearchMD3TextEncoderResource
- (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)version;
@end

@implementation MADSystemSearchMD3TextEncoderResource

- (int64_t)revision
{
  return 5;
}

- (int64_t)tokenEmbeddingType
{
  return 3;
}

- (unint64_t)version
{
  return 3;
}

@end