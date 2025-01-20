@interface CSUVisualGenerationTextEncoderV1NetworkOutput
- (CSUVisualGenerationTextEncoderV1NetworkOutput)initWithLastHiddenLayer:(const void *)a3 PooledCLIPEmbedding:(const void *)a4 MaskIndices:(const void *)a5;
- (MLMultiArray)lastHiddenLayerEmbedding;
- (MLMultiArray)pooledCLIPLayerEmbedding;
- (NSArray)maskIndices;
@end

@implementation CSUVisualGenerationTextEncoderV1NetworkOutput

- (CSUVisualGenerationTextEncoderV1NetworkOutput)initWithLastHiddenLayer:(const void *)a3 PooledCLIPEmbedding:(const void *)a4 MaskIndices:(const void *)a5
{
  v34.receiver = self;
  v34.super_class = (Class)CSUVisualGenerationTextEncoderV1NetworkOutput;
  v11 = [(CSUVisualGenerationTextEncoderV1NetworkOutput *)&v34 init];
  if (v11)
  {
    uint64_t v12 = objc_msgSend_deepCopyFromTensor_(CSUMLMultiArrayUtilities, v8, (uint64_t)a3, v9, v10);
    lastHiddenLayerEmbedding = v11->_lastHiddenLayerEmbedding;
    v11->_lastHiddenLayerEmbedding = (MLMultiArray *)v12;

    uint64_t v17 = objc_msgSend_deepCopyFromTensor_(CSUMLMultiArrayUtilities, v14, (uint64_t)a4, v15, v16);
    pooledCLIPLayerEmbedding = v11->_pooledCLIPLayerEmbedding;
    v11->_pooledCLIPLayerEmbedding = (MLMultiArray *)v17;

    v23 = objc_opt_new();
    uint64_t v25 = *(void *)a5;
    for (uint64_t i = *((void *)a5 + 1); v25 != i; v25 += 16)
    {
      v26 = objc_msgSend_valueWithRange_(MEMORY[0x263F08D40], v19, *(void *)v25, (int)(*(_DWORD *)(v25 + 8) - *(void *)v25), v22);
      objc_msgSend_addObject_(v23, v27, (uint64_t)v26, v28, v29);
    }
    uint64_t v30 = objc_msgSend_copy(v23, v19, v20, v21, v22);
    maskIndices = v11->_maskIndices;
    v11->_maskIndices = (NSArray *)v30;

    v32 = v11;
  }

  return v11;
}

- (MLMultiArray)lastHiddenLayerEmbedding
{
  return (MLMultiArray *)objc_getProperty(self, a2, 8, 1);
}

- (MLMultiArray)pooledCLIPLayerEmbedding
{
  return (MLMultiArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)maskIndices
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskIndices, 0);
  objc_storeStrong((id *)&self->_pooledCLIPLayerEmbedding, 0);
  objc_storeStrong((id *)&self->_lastHiddenLayerEmbedding, 0);
}

@end