@interface MADImageEmbeddingRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)bypassNormalizaton;
- (MADImageEmbeddingRequest)init;
- (MADImageEmbeddingRequest)initWithCoder:(id)a3;
- (id)description;
- (unint64_t)version;
- (void)encodeWithCoder:(id)a3;
- (void)setBypassNormalizaton:(BOOL)a3;
- (void)setVersion:(unint64_t)a3;
@end

@implementation MADImageEmbeddingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImageEmbeddingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)MADImageEmbeddingRequest;
  v2 = [(MADImageEmbeddingRequest *)&v6 init];
  if (v2)
  {
    int v3 = _os_feature_enabled_impl();
    uint64_t v4 = 4;
    if (v3) {
      uint64_t v4 = 5;
    }
    v2->_version = v4;
  }
  return v2;
}

- (MADImageEmbeddingRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MADImageEmbeddingRequest;
  v5 = [(MADRequest *)&v7 initWithCoder:v4];
  if (v5)
  {
    v5->_version = [v4 decodeIntegerForKey:@"Version"];
    v5->_bypassNormalizaton = [v4 decodeBoolForKey:@"bypassNormalizaton"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADImageEmbeddingRequest;
  [(MADRequest *)&v5 encodeWithCoder:v4];
  [v4 encodeInteger:self->_version forKey:@"Version"];
  [v4 encodeBool:self->_bypassNormalizaton forKey:@"bypassNormalizaton"];
}

- (id)description
{
  int v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"version: %d, ", self->_version];
  [v3 appendFormat:@"bypassNormalizaton: %d, ", self->_bypassNormalizaton];
  objc_super v6 = [(MADImageEmbeddingRequest *)self embeddingResults];
  [v3 appendFormat:@"results: %@, ", v6];

  objc_super v7 = [(MADRequest *)self error];
  [v3 appendFormat:@"error: %@>", v7];

  return v3;
}

- (unint64_t)version
{
  return self->_version;
}

- (void)setVersion:(unint64_t)a3
{
  self->_version = a3;
}

- (BOOL)bypassNormalizaton
{
  return self->_bypassNormalizaton;
}

- (void)setBypassNormalizaton:(BOOL)a3
{
  self->_bypassNormalizaton = a3;
}

@end