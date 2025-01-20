@interface CSUSystemSearchTextEncoderV1NetworkOutput
- (BOOL)truncatedInput;
- (CSUBuffer)systemSearchTextEmbedding;
- (CSUSystemSearchTextEncoderV1NetworkOutput)initWithTextEmbedding:(const void *)a3 tokenSegments:(id)a4;
- (MLMultiArray)systemSearchTextEmbeddingMLMultiArray;
- (NSArray)tokenSegments;
- (NSDictionary)additionalLayers;
- (NSString)processedInput;
- (void)setAdditionalLayers:(id)a3;
- (void)setProcessedInput:(id)a3;
- (void)setTruncatedInput:(BOOL)a3;
@end

@implementation CSUSystemSearchTextEncoderV1NetworkOutput

- (CSUSystemSearchTextEncoderV1NetworkOutput)initWithTextEmbedding:(const void *)a3 tokenSegments:(id)a4
{
  id v7 = a4;
  v33.receiver = self;
  v33.super_class = (Class)CSUSystemSearchTextEncoderV1NetworkOutput;
  v8 = [(CSUSystemSearchTextEncoderV1NetworkOutput *)&v33 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_tokenSegments, a4);
    uint64_t v13 = objc_msgSend_castToFP16WithDeepCopyFromTensor_(CSUMLMultiArrayUtilities, v10, (uint64_t)a3, v11, v12);
    systemSearchTextEmbeddingMLMultiArray = v9->_systemSearchTextEmbeddingMLMultiArray;
    v9->_systemSearchTextEmbeddingMLMultiArray = (MLMultiArray *)v13;

    uint64_t v15 = *((void *)a3 + 5);
    long long v16 = *(_OWORD *)(v15 + 40);
    long long v17 = *(_OWORD *)(v15 + 24);
    v31[0] = *(_OWORD *)(v15 + 8);
    v31[1] = v17;
    v31[2] = v16;
    long long v18 = *(_OWORD *)(v15 + 72);
    long long v19 = *(_OWORD *)(v15 + 104);
    long long v20 = *(_OWORD *)(v15 + 56);
    v31[5] = *(_OWORD *)(v15 + 88);
    v31[6] = v19;
    v31[3] = v20;
    v31[4] = v18;
    long long v21 = *(_OWORD *)(v15 + 120);
    long long v22 = *(_OWORD *)(v15 + 136);
    long long v23 = *(_OWORD *)(v15 + 152);
    uint64_t v32 = *(void *)(v15 + 168);
    v31[8] = v22;
    v31[9] = v23;
    v31[7] = v21;
    uint64_t v27 = objc_msgSend_fromEspressoBuffer_(CSUEspressoBuffer, v24, (uint64_t)v31, v25, v26);
    systemSearchTextEmbedding = v9->_systemSearchTextEmbedding;
    v9->_systemSearchTextEmbedding = (CSUBuffer *)v27;

    v29 = v9;
  }

  return v9;
}

- (MLMultiArray)systemSearchTextEmbeddingMLMultiArray
{
  return (MLMultiArray *)objc_getProperty(self, a2, 16, 1);
}

- (CSUBuffer)systemSearchTextEmbedding
{
  return (CSUBuffer *)objc_getProperty(self, a2, 24, 1);
}

- (NSDictionary)additionalLayers
{
  return self->_additionalLayers;
}

- (void)setAdditionalLayers:(id)a3
{
}

- (NSArray)tokenSegments
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
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
  objc_storeStrong((id *)&self->_additionalLayers, 0);
  objc_storeStrong((id *)&self->_systemSearchTextEmbedding, 0);
  objc_storeStrong((id *)&self->_systemSearchTextEmbeddingMLMultiArray, 0);
}

@end