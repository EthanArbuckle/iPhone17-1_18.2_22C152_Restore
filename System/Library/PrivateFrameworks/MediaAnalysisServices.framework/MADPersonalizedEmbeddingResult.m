@interface MADPersonalizedEmbeddingResult
+ (BOOL)supportsSecureCoding;
- (BOOL)personalized;
- (MADEmbeddingResult)embedding;
- (MADEmbeddingResult)hiddenLayer;
- (MADEmbeddingResult)pooledEmbedding;
- (MADPersonalizedEmbeddingResult)initWithCoder:(id)a3;
- (MADPersonalizedEmbeddingResult)initWithEmbedding:(id)a3 hiddenLayer:(id)a4 pooledEmbedding:(id)a5 personalized:(BOOL)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MADPersonalizedEmbeddingResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MADPersonalizedEmbeddingResult)initWithEmbedding:(id)a3 hiddenLayer:(id)a4 pooledEmbedding:(id)a5 personalized:(BOOL)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)MADPersonalizedEmbeddingResult;
  v14 = [(MADPersonalizedEmbeddingResult *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_embedding, a3);
    objc_storeStrong((id *)&v15->_hiddenLayer, a4);
    objc_storeStrong((id *)&v15->_pooledEmbedding, a5);
    v15->_personalized = a6;
  }

  return v15;
}

- (MADPersonalizedEmbeddingResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADPersonalizedEmbeddingResult;
  v5 = [(MADMultiModalResult *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Embedding"];
    embedding = v5->_embedding;
    v5->_embedding = (MADEmbeddingResult *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HiddenLayer"];
    hiddenLayer = v5->_hiddenLayer;
    v5->_hiddenLayer = (MADEmbeddingResult *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PooledEmbedding"];
    pooledEmbedding = v5->_pooledEmbedding;
    v5->_pooledEmbedding = (MADEmbeddingResult *)v10;

    v5->_personalized = [v4 decodeBoolForKey:@"Personalized"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MADPersonalizedEmbeddingResult;
  id v4 = a3;
  [(MADMultiModalResult *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_embedding, @"Embedding", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_hiddenLayer forKey:@"HiddenLayer"];
  [v4 encodeObject:self->_pooledEmbedding forKey:@"PooledEmbedding"];
  [v4 encodeBool:self->_personalized forKey:@"Personalized"];
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  [v3 appendFormat:@"<%@ %p, ", v5, self];

  [v3 appendFormat:@"personalized: %d, ", self->_personalized];
  [v3 appendFormat:@"embedding: %@, ", self->_embedding];
  [v3 appendFormat:@"hiddenLayer: %@, ", self->_hiddenLayer];
  [v3 appendFormat:@"pooledEmbedding: %@>", self->_pooledEmbedding];
  return v3;
}

- (MADEmbeddingResult)embedding
{
  return self->_embedding;
}

- (MADEmbeddingResult)hiddenLayer
{
  return self->_hiddenLayer;
}

- (MADEmbeddingResult)pooledEmbedding
{
  return self->_pooledEmbedding;
}

- (BOOL)personalized
{
  return self->_personalized;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pooledEmbedding, 0);
  objc_storeStrong((id *)&self->_hiddenLayer, 0);
  objc_storeStrong((id *)&self->_embedding, 0);
}

@end