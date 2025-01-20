@interface VCPCNNConvBlock
+ (Class)convBlockClass:(int)a3;
+ (id)convBlockWithFilterSize:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7;
+ (id)convBlockWithFilterSize:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7 groups:(int)a8 stride:(int)a9 batchNorm:(BOOL)a10;
- (BOOL)supportGPU;
- (BOOL)useGPU;
- (VCPCNNConvBlock)initWithParameters:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7 groups:(int)a8 stride:(int)a9 batchNorm:(BOOL)a10;
- (int)constructBlock:(id)a3 context:(id)a4;
@end

@implementation VCPCNNConvBlock

+ (Class)convBlockClass:(int)a3
{
  if (!+[VCPCNNMetalContext supportGPU]) {
    +[VCPCNNMetalContext supportVectorForward];
  }
  v3 = objc_opt_class();
  return (Class)v3;
}

+ (id)convBlockWithFilterSize:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  uint64_t v11 = *(void *)&a3;
  v12 = +[VCPCNNConvBlock convBlockClass:*(void *)&a5];
  if (v12)
  {
    BYTE4(v14) = 0;
    LODWORD(v14) = 1;
    v12 = (objc_class *)objc_msgSend([v12 alloc], "initWithParameters:filterNum:chunk:reLU:padding:groups:stride:batchNorm:", v11, v10, v9, v8, v7, 1, v14);
  }
  return v12;
}

+ (id)convBlockWithFilterSize:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7 groups:(int)a8 stride:(int)a9 batchNorm:(BOOL)a10
{
  uint64_t v10 = *(void *)&a8;
  BOOL v11 = a7;
  BOOL v12 = a6;
  uint64_t v13 = *(void *)&a5;
  uint64_t v14 = *(void *)&a4;
  uint64_t v15 = *(void *)&a3;
  v16 = +[VCPCNNConvBlock convBlockClass:*(void *)&a5];
  if (v16)
  {
    BYTE4(v18) = a10;
    LODWORD(v18) = a9;
    v16 = (objc_class *)objc_msgSend([v16 alloc], "initWithParameters:filterNum:chunk:reLU:padding:groups:stride:batchNorm:", v15, v14, v13, v12, v11, v10, v18);
  }
  return v16;
}

- (VCPCNNConvBlock)initWithParameters:(int)a3 filterNum:(int)a4 chunk:(int)a5 reLU:(BOOL)a6 padding:(BOOL)a7 groups:(int)a8 stride:(int)a9 batchNorm:(BOOL)a10
{
  BOOL v11 = a7;
  v20.receiver = self;
  v20.super_class = (Class)VCPCNNConvBlock;
  result = [(VCPCNNConvBlock *)&v20 init];
  if (result)
  {
    int v17 = a9;
    *(_DWORD *)(&result->super._executedOnGPU + 3) = a3;
    result->_filterSize = a4;
    result->_chunk = a5;
    result->_reLU = a6;
    result->_padding = v11;
    result->_padSize = 0;
    if (v11)
    {
      int v18 = *(_DWORD *)(&result->super._executedOnGPU + 3);
      if (v18 >= 1) {
        --v18;
      }
      result->_padSize = v18 >> 1;
    }
    if (a8 <= 1) {
      int v19 = 1;
    }
    else {
      int v19 = a8;
    }
    result->_groups = v19;
    if (a9 <= 1) {
      int v17 = 1;
    }
    result->_stride = v17;
    result->_batchNorm = a10;
    result->super._executedOnGPU = 0;
  }
  return result;
}

- (int)constructBlock:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->super._context, a4);
  BOOL v8 = +[VCPCNNData cnnDataWithGPUContext:v7];
  output = self->super._output;
  self->super._output = v8;

  uint64_t v10 = +[VCPCNNData cnnData];
  filter = self->_filter;
  self->_filter = v10;

  BOOL v12 = +[VCPCNNData cnnData];
  bias = self->_bias;
  self->_bias = v12;

  if (self->super._output
    && self->_filter
    && self->_bias
    && (location = (id *)&self->super._inputSize,
        objc_storeWeak((id *)&self->super._inputSize, v6),
        uint64_t v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]),
        uint64_t v15 = self->super._outputSize,
        self->super._outputSize = v14,
        v15,
        (v16 = self->super._outputSize) != 0))
  {
    int v17 = [NSNumber numberWithInt:self->_filterSize];
    id v47 = v6;
    [(NSMutableArray *)v16 addObject:v17];

    LODWORD(v17) = self->_padding;
    outputSize = self->super._outputSize;
    int v19 = NSNumber;
    id WeakRetained = objc_loadWeakRetained(location);
    objc_super v20 = [WeakRetained objectAtIndexedSubscript:1];
    if (v17)
    {
      v21 = objc_msgSend(v19, "numberWithInt:", ((int)objc_msgSend(v20, "intValue") / self->_stride));
      [(NSMutableArray *)outputSize addObject:v21];

      v22 = self->super._outputSize;
      v23 = NSNumber;
      id v46 = objc_loadWeakRetained(location);
      v24 = [v46 objectAtIndexedSubscript:2];
      objc_msgSend(v23, "numberWithInt:", ((int)objc_msgSend(v24, "intValue") / self->_stride));
    }
    else
    {
      v28 = objc_msgSend(v19, "numberWithInt:", ((int)(objc_msgSend(v20, "intValue") - *(_DWORD *)(&self->super._executedOnGPU + 3) + 1)/ self->_stride));
      [(NSMutableArray *)outputSize addObject:v28];

      v22 = self->super._outputSize;
      v29 = NSNumber;
      id v46 = objc_loadWeakRetained(location);
      v24 = [v46 objectAtIndexedSubscript:2];
      objc_msgSend(v29, "numberWithInt:", ((int)(objc_msgSend(v24, "intValue") - *(_DWORD *)(&self->super._executedOnGPU + 3) + 1)/ self->_stride));
    v25 = };
    [(NSMutableArray *)v22 addObject:v25];

    id v6 = v47;
    [(VCPCNNData *)self->super._output setSize:self->super._outputSize];
    int v26 = [(VCPCNNData *)self->super._output allocBuffers:self->super._generateOutput];
    if (!v26)
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [(VCPCNNData *)self->_filter setSize:v30];

      v31 = [(VCPCNNData *)self->_filter size];
      v32 = [NSNumber numberWithInt:self->_filterSize];
      [v31 addObject:v32];

      v33 = [(VCPCNNData *)self->_filter size];
      v34 = NSNumber;
      id v35 = objc_loadWeakRetained(location);
      v36 = [v35 objectAtIndexedSubscript:0];
      v37 = objc_msgSend(v34, "numberWithInt:", ((int)objc_msgSend(v36, "intValue") / self->_groups));
      [v33 addObject:v37];

      id v6 = v47;
      v38 = [(VCPCNNData *)self->_filter size];
      v39 = [NSNumber numberWithInt:*(unsigned int *)(&self->super._executedOnGPU + 3)];
      [v38 addObject:v39];

      v40 = [(VCPCNNData *)self->_filter size];
      v41 = [NSNumber numberWithInt:*(unsigned int *)(&self->super._executedOnGPU + 3)];
      [v40 addObject:v41];

      int v26 = [(VCPCNNData *)self->_filter allocBuffers:0];
      if (!v26)
      {
        id v42 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [(VCPCNNData *)self->_bias setSize:v42];

        v43 = [(VCPCNNData *)self->_bias size];
        v44 = [NSNumber numberWithInt:self->_filterSize];
        [v43 addObject:v44];

        int v26 = [(VCPCNNData *)self->_bias allocBuffers:0];
      }
    }
  }
  else
  {
    int v26 = -108;
  }

  return v26;
}

- (BOOL)supportGPU
{
  return 1;
}

- (BOOL)useGPU
{
  return self->super._context != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bias, 0);
  objc_storeStrong((id *)&self->_filter, 0);
}

@end