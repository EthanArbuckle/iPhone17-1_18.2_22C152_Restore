@interface MADImageEmbeddingResult
+ (BOOL)supportsSecureCoding;
- (MADEmbeddingResult)embedding;
- (MADImageEmbeddingResult)initWithCoder:(id)a3;
- (MADImageEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADImageEmbeddingResult

- (MADImageEmbeddingResult)initWithVersion:(unint64_t)a3 data:(id)a4 type:(unint64_t)a5
{
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MADImageEmbeddingResult;
  v9 = [(MADResult *)&v13 init];
  if (v9)
  {
    v10 = [[MADEmbeddingResult alloc] initWithVersion:a3 data:v8 type:a5];
    embedding = v9->_embedding;
    v9->_embedding = v10;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADImageEmbeddingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MADImageEmbeddingResult;
  v5 = [(MADResult *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"embedding"];
    embedding = v5->_embedding;
    v5->_embedding = (MADEmbeddingResult *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MADImageEmbeddingResult;
  [(MADResult *)&v5 encodeWithCoder:v4];
  [v4 encodeObject:self->_embedding forKey:@"embedding"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"embedding: %@>", self->_embedding];
  return v3;
}

- (MADEmbeddingResult)embedding
{
  return self->_embedding;
}

- (void).cxx_destruct
{
}

@end