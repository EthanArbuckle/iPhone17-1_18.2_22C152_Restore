@interface CDMEmbeddingResponseCommand
- (CDMEmbeddingResponseCommand)initWithTokenChain:(id)a3 embeddingTensor:(id)a4 numTokens:(unint64_t)a5 numLayers:(unint64_t)a6 embeddingDim:(unint64_t)a7;
- (CDMTokenChain)tokenChain;
- (NLv4EmbeddingTensor)embeddingTensor;
- (id)dictionaryRepresentation;
- (unint64_t)embeddingDim;
- (unint64_t)numLayers;
- (unint64_t)numTokens;
@end

@implementation CDMEmbeddingResponseCommand

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenChain, 0);
  objc_storeStrong((id *)&self->_embeddingTensor, 0);
}

- (unint64_t)embeddingDim
{
  return self->_embeddingDim;
}

- (unint64_t)numLayers
{
  return self->_numLayers;
}

- (unint64_t)numTokens
{
  return self->_numTokens;
}

- (CDMTokenChain)tokenChain
{
  return self->_tokenChain;
}

- (NLv4EmbeddingTensor)embeddingTensor
{
  return self->_embeddingTensor;
}

- (id)dictionaryRepresentation
{
  v11[4] = *MEMORY[0x263EF8340];
  v3 = [(NLv4EmbeddingTensor *)self->_embeddingTensor values];
  v4 = [v3 componentsJoinedByString:@","];

  v11[0] = v4;
  v10[0] = @"embeddings";
  v10[1] = @"numTokens";
  v5 = [NSNumber numberWithUnsignedInteger:self->_numTokens];
  v11[1] = v5;
  v10[2] = @"numLayers";
  v6 = [NSNumber numberWithUnsignedInteger:self->_numLayers];
  v11[2] = v6;
  v10[3] = @"embeddingDim";
  v7 = [NSNumber numberWithUnsignedInteger:self->_embeddingDim];
  v11[3] = v7;
  v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:4];

  return v8;
}

- (CDMEmbeddingResponseCommand)initWithTokenChain:(id)a3 embeddingTensor:(id)a4 numTokens:(unint64_t)a5 numLayers:(unint64_t)a6 embeddingDim:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CDMEmbeddingResponseCommand;
  v14 = [(CDMBaseCommand *)&v20 init];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    tokenChain = v14->_tokenChain;
    v14->_tokenChain = (CDMTokenChain *)v15;

    uint64_t v17 = [v13 copy];
    embeddingTensor = v14->_embeddingTensor;
    v14->_embeddingTensor = (NLv4EmbeddingTensor *)v17;

    v14->_numTokens = a5;
    v14->_numLayers = a6;
    v14->_embeddingDim = a7;
  }

  return v14;
}

@end