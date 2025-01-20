@interface MADSystemSearchMD2TextEncoderResource
- (int64_t)revision;
- (int64_t)tokenEmbeddingType;
- (unint64_t)version;
@end

@implementation MADSystemSearchMD2TextEncoderResource

- (int64_t)revision
{
  return 2;
}

- (int64_t)tokenEmbeddingType
{
  return 2;
}

- (unint64_t)version
{
  return 2;
}

@end