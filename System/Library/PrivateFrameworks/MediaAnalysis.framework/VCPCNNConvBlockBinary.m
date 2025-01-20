@interface VCPCNNConvBlockBinary
- (BOOL)supportGPU;
- (BOOL)useGPU;
- (VCPCNNConvBlockBinary)initWithParameters:(int)a3 filterNum:(int)a4 convType:(unint64_t)a5 reLU:(BOOL)a6 padding:(BOOL)a7;
- (int)constructBlock:(id)a3 context:(id)a4;
- (int)fillConvWeightsGPU;
- (int)forward;
- (int)gpuForward;
- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4;
- (void)dealloc;
@end

@implementation VCPCNNConvBlockBinary

- (VCPCNNConvBlockBinary)initWithParameters:(int)a3 filterNum:(int)a4 convType:(unint64_t)a5 reLU:(BOOL)a6 padding:(BOOL)a7
{
  BOOL v7 = a7;
  v17.receiver = self;
  v17.super_class = (Class)VCPCNNConvBlockBinary;
  v12 = [(VCPCNNConvBlockBinary *)&v17 init];
  v13 = v12;
  if (v12)
  {
    *(_DWORD *)(&v12->super._executedOnGPU + 3) = a3;
    v12->_filterSize = a4;
    v12->_filterWeightsBinary = 0;
    v12->_filterWeightSize = 1;
    v12->_filterScaling = 0;
    v12->_bias = 0;
    v12->_padding = v7;
    v12->_convType = a5;
    v12->_reLU = a6;
    mpsBinaryConv = v12->_mpsBinaryConv;
    v12->_mpsBinaryConv = 0;

    v15 = v13;
  }

  return v13;
}

- (void)dealloc
{
  filterWeightsBinary = self->_filterWeightsBinary;
  if (filterWeightsBinary) {
    MEMORY[0x1C186C790](filterWeightsBinary, 0x1000C8052888210);
  }
  filterScaling = self->_filterScaling;
  if (filterScaling) {
    MEMORY[0x1C186C790](filterScaling, 0x1000C8052888210);
  }
  bias = self->_bias;
  if (bias) {
    MEMORY[0x1C186C790](bias, 0x1000C8052888210);
  }
  v6.receiver = self;
  v6.super_class = (Class)VCPCNNConvBlockBinary;
  [(VCPCNNConvBlockBinary *)&v6 dealloc];
}

- (int)constructBlock:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v7)
  {
    int v25 = -50;
    goto LABEL_25;
  }
  objc_storeStrong((id *)&self->super._context, a4);
  v8 = +[VCPCNNData cnnDataWithGPUContext:v7];
  output = self->super._output;
  self->super._output = v8;

  objc_storeWeak((id *)&self->super._inputSize, v6);
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  outputSize = self->super._outputSize;
  self->super._outputSize = v10;

  v12 = self->super._outputSize;
  if (!v12) {
    goto LABEL_24;
  }
  v13 = [NSNumber numberWithInt:self->_filterSize];
  id v40 = v6;
  [(NSMutableArray *)v12 addObject:v13];

  int padding = self->_padding;
  v15 = self->super._outputSize;
  v16 = NSNumber;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._inputSize);
  v18 = [WeakRetained objectAtIndexedSubscript:1];
  if (padding)
  {
    v19 = objc_msgSend(v16, "numberWithInt:", objc_msgSend(v18, "intValue"));
    [(NSMutableArray *)v15 addObject:v19];

    v20 = self->super._outputSize;
    v21 = NSNumber;
    id v22 = objc_loadWeakRetained((id *)&self->super._inputSize);
    v23 = [v22 objectAtIndexedSubscript:2];
    objc_msgSend(v21, "numberWithInt:", objc_msgSend(v23, "intValue"));
  }
  else
  {
    v26 = objc_msgSend(v16, "numberWithInt:", objc_msgSend(v18, "intValue") - *(_DWORD *)(&self->super._executedOnGPU + 3) + 1);
    [(NSMutableArray *)v15 addObject:v26];

    v20 = self->super._outputSize;
    v27 = NSNumber;
    id v22 = objc_loadWeakRetained((id *)&self->super._inputSize);
    v23 = [v22 objectAtIndexedSubscript:2];
    objc_msgSend(v27, "numberWithInt:", objc_msgSend(v23, "intValue") - *(_DWORD *)(&self->super._executedOnGPU + 3) + 1);
  v24 = };
  [(NSMutableArray *)v20 addObject:v24];

  id v6 = v40;
  [(VCPCNNData *)self->super._output setSize:self->super._outputSize];
  int v25 = [(VCPCNNData *)self->super._output allocBuffers:self->super._generateOutput];
  if (v25) {
    goto LABEL_25;
  }
  id v28 = objc_loadWeakRetained((id *)&self->super._inputSize);
  v29 = [v28 objectAtIndexedSubscript:0];
  int v30 = [v29 intValue];
  int v31 = v30 + 31;
  if (v30 < -31) {
    int v31 = v30 + 62;
  }
  self->_uint64_t filterWeightSize = self->_filterSize
                          * (v31 >> 5)
                          * *(_DWORD *)(&self->super._executedOnGPU + 3)
                          * *(_DWORD *)(&self->super._executedOnGPU + 3);

  uint64_t filterWeightSize = self->_filterWeightSize;
  size_t v33 = (int)filterWeightSize < 0 ? -1 : 4 * filterWeightSize;
  v34 = (const std::nothrow_t *)MEMORY[0x1E4FBA2D0];
  self->_filterWeightsBinary = (unsigned int *)operator new[](v33, MEMORY[0x1E4FBA2D0]);
  uint64_t filterSize = self->_filterSize;
  size_t v36 = (int)filterSize < 0 ? -1 : 4 * filterSize;
  self->_filterScaling = (float *)operator new[](v36, v34);
  v37 = (float *)operator new[](v36, v34);
  self->_bias = v37;
  if (!self->super._output)
  {
LABEL_24:
    int v25 = -108;
    goto LABEL_25;
  }
  int v25 = -108;
  if (self->_filterWeightsBinary)
  {
    if (v37) {
      BOOL v38 = self->_filterScaling == 0;
    }
    else {
      BOOL v38 = 1;
    }
    if (v38) {
      int v25 = -108;
    }
    else {
      int v25 = 0;
    }
  }
LABEL_25:

  return v25;
}

- (int)forward
{
  if (self->super._context) {
    return [(VCPCNNConvBlockBinary *)self gpuForward];
  }
  else {
    return -50;
  }
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  if (!self->super._context) {
    return 0;
  }
  if (fread(self->_filterWeightsBinary, 4uLL, self->_filterWeightSize, a3)
    && fread(self->_filterScaling, 4uLL, self->_filterSize, a3)
    && fread(self->_bias, 4uLL, self->_filterSize, a3))
  {
    return [(VCPCNNConvBlockBinary *)self fillConvWeightsGPU];
  }
  return -19;
}

- (BOOL)supportGPU
{
  return 1;
}

- (BOOL)useGPU
{
  return self->super._context != 0;
}

- (int)gpuForward
{
  if (!self->super._executedOnGPU
    || (int result = [(VCPCNNData *)self->super._output reallocGPUTemporalBuffers]) == 0)
  {
    uint64_t v4 = [(VCPCNNMetalContext *)self->super._context commandBuffer];
    if (v4)
    {
      v5 = (void *)v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->super._input);
      id v7 = [WeakRetained mpsImg];
      if (v7)
      {
        v8 = [(VCPCNNData *)self->super._output mpsImg];

        if (v8)
        {
          mpsBinaryConv = self->_mpsBinaryConv;
          v10 = [(VCPCNNMetalContext *)self->super._context commandBuffer];
          id v11 = objc_loadWeakRetained((id *)&self->super._input);
          v12 = [v11 mpsImg];
          v13 = [(VCPCNNData *)self->super._output mpsImg];
          [(MPSCNNBinaryConvolution *)mpsBinaryConv encodeToCommandBuffer:v10 sourceImage:v12 destinationImage:v13];

          int result = 0;
          self->super._executedOnGPU = 1;
          return result;
        }
      }
      else
      {
      }
    }
    return -108;
  }
  return result;
}

- (int)fillConvWeightsGPU
{
  uint64_t v3 = *(int *)(&self->super._executedOnGPU + 3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._inputSize);
  v5 = [WeakRetained objectAtIndexedSubscript:0];
  int v6 = [v5 intValue];

  id v7 = [(NSMutableArray *)self->super._outputSize objectAtIndexedSubscript:0];
  LODWORD(v5) = [v7 intValue];

  v8 = [MEMORY[0x1E4F353F0] cnnConvolutionDescriptorWithKernelWidth:v3 kernelHeight:v3 inputFeatureChannels:v6 outputFeatureChannels:(int)v5];
  v9 = v8;
  if (v8)
  {
    if (self->_reLU)
    {
      v10 = [v8 fusedNeuronDescriptor];
      [v10 setNeuronType:1];

      id v11 = [v9 fusedNeuronDescriptor];
      [v11 setA:0.0];
    }
    [v9 setFeatureChannelsLayout:1];
    v12 = [[VCPCNNMPSDataSource alloc] initWith:268435488 convolutionDescriptor:v9 kernelWeights:self->_filterWeightsBinary biasTerm:0];
    if (!v12) {
      goto LABEL_9;
    }
    id v13 = objc_alloc(MEMORY[0x1E4F353E0]);
    v14 = [(VCPCNNMetalContext *)self->super._context device];
    v15 = (MPSCNNBinaryConvolution *)[v13 initWithDevice:v14 convolutionData:v12 outputBiasTerms:self->_bias outputScaleTerms:self->_filterScaling inputBiasTerms:0 inputScaleTerms:0 type:self->_convType flags:0];
    mpsBinaryConv = self->_mpsBinaryConv;
    self->_mpsBinaryConv = v15;

    objc_super v17 = self->_mpsBinaryConv;
    if (v17)
    {
      [(MPSCNNBinaryConvolution *)v17 setEdgeMode:0];
      v18 = [(NSMutableArray *)self->super._outputSize objectAtIndexedSubscript:2];
      int v19 = [v18 intValue];
      v20 = [(NSMutableArray *)self->super._outputSize objectAtIndexedSubscript:1];
      int v21 = [v20 intValue];

      if (!self->_padding)
      {
        if (v3 == 1)
        {
          uint64_t v22 = 0;
        }
        else
        {
          int v24 = v3 - 1;
          if ((int)v3 < 1) {
            int v24 = v3;
          }
          LODWORD(v22) = v24 >> 1;
          if ((int)v22 <= 1) {
            uint64_t v22 = 1;
          }
          else {
            uint64_t v22 = v22;
          }
        }
        int v25 = self->_mpsBinaryConv;
        v29[0] = v22;
        v29[1] = v22;
        v29[2] = 0;
        [(MPSCNNBinaryConvolution *)v25 setOffset:v29];
      }
      v26 = self->_mpsBinaryConv;
      memset(v28, 0, 24);
      v28[3] = v19;
      v28[4] = v21;
      v28[5] = 1;
      [(MPSCNNBinaryConvolution *)v26 setClipRect:v28];
      int v23 = 0;
    }
    else
    {
LABEL_9:
      int v23 = -108;
    }
  }
  else
  {
    int v23 = -108;
  }

  return v23;
}

- (void).cxx_destruct
{
}

@end