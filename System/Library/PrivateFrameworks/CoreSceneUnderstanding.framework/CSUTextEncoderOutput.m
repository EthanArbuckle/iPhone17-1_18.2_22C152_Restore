@interface CSUTextEncoderOutput
- (BOOL)truncatedInput;
- (CSUTextEncoderOutput)init;
- (CSUTextEncoderOutput)initWithTextEmbedding:(id)a3;
- (MLMultiArray)CSUTextEmbedding;
- (NSArray)tokenIds;
- (NSArray)tokenSegments;
- (NSArray)tokens;
- (NSDictionary)additionalLayers;
- (NSString)processedInput;
- (void)setAdditionalLayers:(id)a3;
- (void)setCSUTextEmbedding:(id)a3;
- (void)setProcessedInput:(id)a3;
- (void)setTokenIds:(id)a3;
- (void)setTokenSegments:(id)a3;
- (void)setTokens:(id)a3;
- (void)setTruncatedInput:(BOOL)a3;
@end

@implementation CSUTextEncoderOutput

- (CSUTextEncoderOutput)init
{
  v8.receiver = self;
  v8.super_class = (Class)CSUTextEncoderOutput;
  v2 = [(CSUTextEncoderOutput *)&v8 init];
  v3 = v2;
  if (v2)
  {
    CSUTextEmbedding = v2->_CSUTextEmbedding;
    v2->_CSUTextEmbedding = 0;

    additionalLayers = v3->_additionalLayers;
    v3->_additionalLayers = 0;

    v6 = v3;
  }

  return v3;
}

- (CSUTextEncoderOutput)initWithTextEmbedding:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSUTextEncoderOutput;
  v6 = [(CSUTextEncoderOutput *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_CSUTextEmbedding, a3);
    objc_super v8 = v7;
  }

  return v7;
}

- (MLMultiArray)CSUTextEmbedding
{
  return (MLMultiArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCSUTextEmbedding:(id)a3
{
}

- (NSDictionary)additionalLayers
{
  return self->_additionalLayers;
}

- (void)setAdditionalLayers:(id)a3
{
}

- (NSArray)tokens
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTokens:(id)a3
{
}

- (NSArray)tokenIds
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTokenIds:(id)a3
{
}

- (NSArray)tokenSegments
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTokenSegments:(id)a3
{
}

- (BOOL)truncatedInput
{
  return self->_truncatedInput;
}

- (void)setTruncatedInput:(BOOL)a3
{
  self->_truncatedInput = a3;
}

- (NSString)processedInput
{
  return self->_processedInput;
}

- (void)setProcessedInput:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedInput, 0);
  objc_storeStrong((id *)&self->_tokenSegments, 0);
  objc_storeStrong((id *)&self->_tokenIds, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_additionalLayers, 0);
  objc_storeStrong((id *)&self->_CSUTextEmbedding, 0);
}

@end