@interface VCPCNNPoolingBlock
+ (id)poolingBlockWithPoolX:(int)a3 poolY:(int)a4 chunk:(int)a5;
- (BOOL)supportGPU;
- (BOOL)useGPU;
- (VCPCNNPoolingBlock)initWithParameters:(int)a3 poolY:(int)a4 chunk:(int)a5;
- (int)constructBlock:(id)a3 context:(id)a4;
- (int)forward;
@end

@implementation VCPCNNPoolingBlock

+ (id)poolingBlockWithPoolX:(int)a3 poolY:(int)a4 chunk:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  if (!+[VCPCNNMetalContext supportGPU]) {
    +[VCPCNNMetalContext supportVectorForward];
  }
  v8 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParameters:v7 poolY:v6 chunk:v5];
  return v8;
}

- (VCPCNNPoolingBlock)initWithParameters:(int)a3 poolY:(int)a4 chunk:(int)a5
{
  uint64_t v5 = 0;
  if (a3 >= 2 && a4 >= 2)
  {
    v11.receiver = self;
    v11.super_class = (Class)VCPCNNPoolingBlock;
    v9 = [(VCPCNNPoolingBlock *)&v11 init];
    if (v9)
    {
      *(_DWORD *)(&v9->super._executedOnGPU + 3) = a3;
      v9->_px = a4;
      v9->_py = a5;
      v9->super._executedOnGPU = 0;
    }
    self = v9;
    uint64_t v5 = self;
  }

  return v5;
}

- (int)constructBlock:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->super._context, a4);
  id v8 = objc_storeWeak((id *)&self->super._inputSize, v6);
  v9 = [v6 objectAtIndexedSubscript:0];
  uint64_t v10 = [v9 intValue];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super._inputSize);
  v12 = [WeakRetained objectAtIndexedSubscript:1];
  int v13 = [v12 intValue];

  id v14 = objc_loadWeakRetained((id *)&self->super._inputSize);
  v15 = [v14 objectAtIndexedSubscript:2];
  int v16 = [v15 intValue];

  v17 = +[VCPCNNData cnnDataWithGPUContext:v7];
  output = self->super._output;
  self->super._output = v17;

  v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  outputSize = self->super._outputSize;
  self->super._outputSize = v19;

  if (self->super._output && (v21 = self->super._outputSize) != 0)
  {
    v22 = [NSNumber numberWithInt:v10];
    [(NSMutableArray *)v21 addObject:v22];

    v23 = self->super._outputSize;
    v24 = [NSNumber numberWithInt:(v13 / self->_px)];
    [(NSMutableArray *)v23 addObject:v24];

    v25 = self->super._outputSize;
    v26 = [NSNumber numberWithInt:(v16 / *(_DWORD *)(&self->super._executedOnGPU + 3))];
    [(NSMutableArray *)v25 addObject:v26];

    [(VCPCNNData *)self->super._output setSize:self->super._outputSize];
    int v27 = [(VCPCNNData *)self->super._output allocBuffers:self->super._generateOutput];
  }
  else
  {
    int v27 = -108;
  }

  return v27;
}

- (int)forward
{
  return -4;
}

- (BOOL)supportGPU
{
  return 1;
}

- (BOOL)useGPU
{
  return self->super._context != 0;
}

@end