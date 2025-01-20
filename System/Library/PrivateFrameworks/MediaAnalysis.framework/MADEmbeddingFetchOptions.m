@interface MADEmbeddingFetchOptions
+ (BOOL)supportsSecureCoding;
- (MADEmbeddingFetchOptions)initWithCoder:(id)a3;
@end

@implementation MADEmbeddingFetchOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADEmbeddingFetchOptions)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MADEmbeddingFetchOptions;
  return [(MADEmbeddingFetchOptions *)&v4 init];
}

@end