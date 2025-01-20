@interface VCPCNNFullConnectionBlock
+ (id)fcBlockWithNumNeurons:(int)a3 NeuronType:(int)a4;
- (BOOL)supportGPU;
- (BOOL)useGPU;
- (VCPCNNFullConnectionBlock)initWithParameters:(int)a3 NeuronType:(int)a4;
- (int)constructBlock:(id)a3 context:(id)a4;
- (int)loadWeights:(__sFILE *)a3 inputDim:(int)a4 outputDim:(int)a5 quantFactor:(int)a6;
- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4;
- (int)readWeightsBias:(__sFILE *)a3 weights:(float *)a4 bias:(float *)a5 inputDim:(int)a6 outputDim:(int)a7 quantFactor:(int)a8;
- (void)dealloc;
@end

@implementation VCPCNNFullConnectionBlock

+ (id)fcBlockWithNumNeurons:(int)a3 NeuronType:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  +[VCPCNNMetalContext supportGPU];
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithParameters:v5 NeuronType:v4];
  return v6;
}

- (VCPCNNFullConnectionBlock)initWithParameters:(int)a3 NeuronType:(int)a4
{
  if (a3 < 1)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)VCPCNNFullConnectionBlock;
    v6 = [(VCPCNNFullConnectionBlock *)&v9 init];
    if (v6)
    {
      v6->_numNeurons = a3;
      v6->_weight = 0;
      v6->_bias = 0;
      v6->_neuronType = a4;
      v6->super._executedOnGPU = 0;
    }
    self = v6;
    v7 = self;
  }

  return v7;
}

- (void)dealloc
{
  weight = self->_weight;
  if (weight) {
    MEMORY[0x1C186C790](weight, 0x1000C8052888210);
  }
  bias = self->_bias;
  if (bias) {
    MEMORY[0x1C186C790](bias, 0x1000C8052888210);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCPCNNFullConnectionBlock;
  [(VCPCNNFullConnectionBlock *)&v5 dealloc];
}

- (int)constructBlock:(id)a3 context:(id)a4
{
  id v7 = a4;
  objc_storeStrong((id *)&self->super._context, a4);
  id v8 = a3;
  objc_storeWeak((id *)&self->super._inputSize, v8);

  objc_super v9 = +[VCPCNNData cnnDataWithGPUContext:self->super._context];
  output = self->super._output;
  self->super._output = v9;

  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  outputSize = self->super._outputSize;
  self->super._outputSize = v11;

  if (self->super._output && (v13 = self->super._outputSize) != 0)
  {
    v14 = [NSNumber numberWithInt:self->_numNeurons];
    [(NSMutableArray *)v13 addObject:v14];

    [(VCPCNNData *)self->super._output setSize:self->super._outputSize];
    int v15 = [(VCPCNNData *)self->super._output allocBuffers:self->super._generateOutput];
  }
  else
  {
    int v15 = -108;
  }

  return v15;
}

- (int)readWeightsBias:(__sFILE *)a3 weights:(float *)a4 bias:(float *)a5 inputDim:(int)a6 outputDim:(int)a7 quantFactor:(int)a8
{
  if (!a8) {
    operator new[]();
  }
  if (a8 != 1) {
    return -50;
  }
  if (fread(a4, 4uLL, a7 * a6, a3) && fread(a5, 4uLL, a7, a3)) {
    return 0;
  }
  return -19;
}

- (int)loadWeights:(__sFILE *)a3 inputDim:(int)a4 outputDim:(int)a5 quantFactor:(int)a6
{
  return -4;
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  if (a4 != 1) {
    return -50;
  }
  unint64_t v6 = 0;
  p_inputSize = &self->super._inputSize;
  uint64_t v8 = 1;
  while (1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)p_inputSize);
    unint64_t v10 = [WeakRetained count];

    if (v10 <= v6) {
      break;
    }
    id v11 = objc_loadWeakRetained((id *)p_inputSize);
    v12 = [v11 objectAtIndexedSubscript:v6];
    uint64_t v8 = [v12 intValue] * v8;

    ++v6;
  }
  v13 = [(NSMutableArray *)self->super._outputSize objectAtIndexedSubscript:0];
  uint64_t v14 = [v13 intValue];

  if (self->_weight || self->_bias) {
    return -50;
  }
  if ((int)v14 * (int)v8 < 0) {
    size_t v16 = -1;
  }
  else {
    size_t v16 = 4 * (int)v14 * (int)v8;
  }
  v17 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
  self->_weight = (float *)operator new[](v16, MEMORY[0x1E4FBA2D0]);
  if ((int)v14 < 0) {
    size_t v18 = -1;
  }
  else {
    size_t v18 = 4 * (int)v14;
  }
  v19 = (float *)operator new[](v18, v17);
  self->_bias = v19;
  int result = -108;
  if (self->_weight && v19)
  {
    return [(VCPCNNFullConnectionBlock *)self loadWeights:a3 inputDim:v8 outputDim:v14 quantFactor:1];
  }
  return result;
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