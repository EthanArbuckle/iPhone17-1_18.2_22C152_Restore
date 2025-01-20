@interface Embedder
- (CDMEmbeddingConfigItem)embeddingConfigItem;
- (Embedder)initWithSnlpEmbedder:(id)a3 andEmbeddingConfigItem:(id)a4;
- (SNLPEmbedder)snlpEmbedder;
- (void)warmup;
@end

@implementation Embedder

- (void)warmup
{
}

- (Embedder)initWithSnlpEmbedder:(id)a3 andEmbeddingConfigItem:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)Embedder;
  v9 = [(Embedder *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snlpEmbedder, a3);
    objc_storeStrong((id *)&v10->_embeddingConfigItem, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_embeddingConfigItem, 0);
  objc_storeStrong((id *)&self->_snlpEmbedder, 0);
}

- (CDMEmbeddingConfigItem)embeddingConfigItem
{
  return self->_embeddingConfigItem;
}

- (SNLPEmbedder)snlpEmbedder
{
  return self->_snlpEmbedder;
}

@end