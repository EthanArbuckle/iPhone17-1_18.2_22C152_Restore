@interface VCPCNNFlattenBlock
- (VCPCNNFlattenBlock)initWithParameters:(int)a3;
- (int)constructBlock:(id)a3 context:(id)a4;
- (int)forward;
@end

@implementation VCPCNNFlattenBlock

- (VCPCNNFlattenBlock)initWithParameters:(int)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VCPCNNFlattenBlock;
  v4 = [(VCPCNNFlattenBlock *)&v8 init];
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)(&v4->super._executedOnGPU + 3) = a3;
    v6 = v4;
  }

  return v5;
}

- (int)forward
{
  if (*(_DWORD *)(&self->super._executedOnGPU + 3) == 1)
  {
    v3 = [(VCPCNNData *)self->super._output data];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._input);
    v5 = (const void *)[WeakRetained data];
    v6 = [(NSMutableArray *)self->super._outputSize objectAtIndexedSubscript:0];
    memcpy(v3, v5, 4 * (int)[v6 intValue]);
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)&self->super._inputSize);
    objc_super v8 = [v7 objectAtIndexedSubscript:0];
    int v23 = [v8 intValue];

    id v9 = objc_loadWeakRetained((id *)&self->super._inputSize);
    v10 = [v9 objectAtIndexedSubscript:1];
    int v22 = [v10 intValue];

    id v11 = objc_loadWeakRetained((id *)&self->super._inputSize);
    v12 = [v11 objectAtIndexedSubscript:2];
    int v24 = [v12 intValue];

    id v13 = objc_loadWeakRetained((id *)&self->super._input);
    v14 = (int *)[v13 data];

    int v15 = *(_DWORD *)(&self->super._executedOnGPU + 3);
    if (v23 / v15 >= 1)
    {
      int v16 = 0;
      do
      {
        if (v22 >= 1)
        {
          uint64_t v17 = 0;
          do
          {
            uint64_t v25 = v17;
            if (v24 >= 1)
            {
              uint64_t v18 = 0;
              uint64_t v26 = v17 * v24;
              do
              {
                if (v15 >= 1)
                {
                  for (int i = 0; i < v15; ++i)
                  {
                    int v20 = *v14++;
                    *(_DWORD *)([(VCPCNNData *)self->super._output data]
                              + 4 * (v18 + v26 + v24 * v22 * (uint64_t)(i + v16 * v15))) = v20;
                    int v15 = *(_DWORD *)(&self->super._executedOnGPU + 3);
                  }
                }
                ++v18;
              }
              while (v18 != v24);
            }
            uint64_t v17 = v25 + 1;
          }
          while (v25 + 1 != v22);
        }
        ++v16;
      }
      while (v16 < v23 / v15);
    }
  }
  return 0;
}

- (int)constructBlock:(id)a3 context:(id)a4
{
  id v5 = a3;
  v6 = +[VCPCNNData cnnData];
  output = self->super._output;
  self->super._output = v6;

  if (self->super._output
    && (objc_super v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]),
        id v9 = self->super._outputSize,
        self->super._outputSize = v8,
        v9,
        self->super._outputSize))
  {
    id v10 = objc_storeWeak((id *)&self->super._inputSize, v5);
    outputSize = self->super._outputSize;
    v12 = NSNumber;
    id v13 = v10;
    int v23 = [v5 objectAtIndexedSubscript:0];
    int v14 = [v23 intValue];
    id WeakRetained = objc_loadWeakRetained((id *)&self->super._inputSize);
    v21 = [WeakRetained objectAtIndexedSubscript:1];
    int v15 = [v21 intValue];
    id v16 = objc_loadWeakRetained((id *)&self->super._inputSize);
    uint64_t v17 = [v16 objectAtIndexedSubscript:2];
    uint64_t v18 = objc_msgSend(v12, "numberWithInt:", v15 * v14 * objc_msgSend(v17, "intValue"));
    [(NSMutableArray *)outputSize addObject:v18];

    [(VCPCNNData *)self->super._output setSize:self->super._outputSize];
    int v19 = [(VCPCNNData *)self->super._output allocBuffers:self->super._generateOutput];
  }
  else
  {
    int v19 = -108;
  }

  return v19;
}

@end