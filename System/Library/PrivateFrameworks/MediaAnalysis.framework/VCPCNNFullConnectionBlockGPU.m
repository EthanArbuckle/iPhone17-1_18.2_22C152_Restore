@interface VCPCNNFullConnectionBlockGPU
- (int)convVCPNeuronTypeToMPS:(int)a3;
- (int)forward;
- (int)loadWeights:(__sFILE *)a3 inputDim:(int)a4 outputDim:(int)a5 quantFactor:(int)a6;
- (int)setupMPS;
- (int)shuffleWeights:(float *)a3 fromSrc:(float *)a4 inputChannels:(int)a5 inputHeight:(int)a6 inputWidth:(int)a7 outputChannels:(int)a8;
@end

@implementation VCPCNNFullConnectionBlockGPU

- (int)convVCPNeuronTypeToMPS:(int)a3
{
  return a3 == 1;
}

- (int)setupMPS
{
  p_inputSize = &self->super.super._inputSize;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  unint64_t v5 = [WeakRetained count];

  id v6 = objc_loadWeakRetained((id *)p_inputSize);
  [v6 objectAtIndexedSubscript:0];
  if (v5 < 3) {
    v17 = {;
  }
    int v8 = [v17 intValue];

    v15 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:0];
    int v16 = [v15 intValue];
    int v11 = 1;
    int v14 = 1;
  }
  else {
    v7 = {;
  }
    int v8 = [v7 intValue];

    id v9 = objc_loadWeakRetained((id *)p_inputSize);
    v10 = [v9 objectAtIndexedSubscript:1];
    int v11 = [v10 intValue];

    id v12 = objc_loadWeakRetained((id *)p_inputSize);
    v13 = [v12 objectAtIndexedSubscript:2];
    int v14 = [v13 intValue];

    v15 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:0];
    int v16 = [v15 intValue];
  }

  v18 = [MEMORY[0x1E4F353F0] cnnConvolutionDescriptorWithKernelWidth:v14 kernelHeight:v11 inputFeatureChannels:v8 outputFeatureChannels:v16];
  v19 = v18;
  if (v18)
  {
    [v18 setFeatureChannelsLayout:1];
    uint64_t v20 = [(VCPCNNFullConnectionBlockGPU *)self convVCPNeuronTypeToMPS:self->super._neuronType];
    v21 = [v19 fusedNeuronDescriptor];
    [v21 setNeuronType:v20];

    if (self->super._neuronType == 1)
    {
      v22 = [v19 fusedNeuronDescriptor];
      [v22 setA:0.0];
    }
    v23 = [[VCPCNNMPSDataSource alloc] initWith:268435488 convolutionDescriptor:v19 kernelWeights:self->super._weight biasTerm:self->super._bias];
    if (!v23) {
      goto LABEL_19;
    }
    id v24 = objc_alloc(MEMORY[0x1E4F35440]);
    v25 = [(VCPCNNMetalContext *)self->super.super._context device];
    v26 = (MPSCNNFullyConnected *)[v24 initWithDevice:v25 weights:v23];
    mpsFullConn = self->_mpsFullConn;
    self->_mpsFullConn = v26;

    v28 = self->_mpsFullConn;
    if (v28)
    {
      [(MPSCNNFullyConnected *)v28 setEdgeMode:0];
      memset(v37, 0, sizeof(v37));
      v29 = self->_mpsFullConn;
      int64x2_t v38 = vdupq_n_s64(1uLL);
      uint64_t v39 = 1;
      [(MPSCNNFullyConnected *)v29 setClipRect:v37];
      if (v11 != 1 || v14 != 1)
      {
        if (v14 >= 0) {
          int v30 = v14;
        }
        else {
          int v30 = v14 + 1;
        }
        uint64_t v31 = (uint64_t)v30 >> 1;
        if (v11 >= 0) {
          int v32 = v11;
        }
        else {
          int v32 = v11 + 1;
        }
        v33 = self->_mpsFullConn;
        v36[0] = v31;
        v36[1] = (uint64_t)v32 >> 1;
        v36[2] = 0;
        [(MPSCNNFullyConnected *)v33 setOffset:v36];
      }
      int v34 = 0;
    }
    else
    {
LABEL_19:
      int v34 = -108;
    }
  }
  else
  {
    int v34 = -108;
  }

  return v34;
}

- (int)shuffleWeights:(float *)a3 fromSrc:(float *)a4 inputChannels:(int)a5 inputHeight:(int)a6 inputWidth:(int)a7 outputChannels:(int)a8
{
  if (a8 >= 1)
  {
    int v8 = 0;
    uint64_t v9 = (a7 * a6);
    uint64_t v10 = 4 * (int)v9 * a5;
    do
    {
      if ((int)v9 >= 1)
      {
        uint64_t v11 = 0;
        id v12 = a4;
        v13 = a3;
        do
        {
          uint64_t v14 = a5;
          v15 = v12;
          int v16 = v13;
          if (a5 >= 1)
          {
            do
            {
              *v16++ = *v15;
              v15 += (int)v9;
              --v14;
            }
            while (v14);
          }
          ++v11;
          v13 += a5;
          ++v12;
        }
        while (v11 != v9);
      }
      ++v8;
      a3 = (float *)((char *)a3 + v10);
      a4 = (float *)((char *)a4 + v10);
    }
    while (v8 != a8);
  }
  return 0;
}

- (int)loadWeights:(__sFILE *)a3 inputDim:(int)a4 outputDim:(int)a5 quantFactor:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  p_inputSize = &self->super.super._inputSize;
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  uint64_t v13 = [WeakRetained count];

  if (v13 != 1)
  {
    if ((int)v7 * (int)v8 < 0) {
      size_t v16 = -1;
    }
    else {
      size_t v16 = 4 * (int)v7 * (int)v8;
    }
    v17 = operator new[](v16, MEMORY[0x1E4FBA2D0]);
    if (!v17) {
      return -108;
    }
    v18 = v17;
    int v14 = [(VCPCNNFullConnectionBlock *)self readWeightsBias:a3 weights:v17 bias:self->super._bias inputDim:v8 outputDim:v7 quantFactor:v6];
    if (!v14)
    {
      weight = self->super._weight;
      id v20 = objc_loadWeakRetained((id *)p_inputSize);
      v29 = [v20 objectAtIndexedSubscript:0];
      uint64_t v21 = [v29 intValue];
      id v28 = objc_loadWeakRetained((id *)p_inputSize);
      v27 = [v28 objectAtIndexedSubscript:1];
      uint64_t v22 = [v27 intValue];
      id v23 = objc_loadWeakRetained((id *)p_inputSize);
      id v24 = [v23 objectAtIndexedSubscript:2];
      uint64_t v25 = [v24 intValue];
      v26 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:0];
      int v14 = -[VCPCNNFullConnectionBlockGPU shuffleWeights:fromSrc:inputChannels:inputHeight:inputWidth:outputChannels:](self, "shuffleWeights:fromSrc:inputChannels:inputHeight:inputWidth:outputChannels:", weight, v18, v21, v22, v25, [v26 intValue]);

      if (!v14)
      {
        MEMORY[0x1C186C790](v18, 0x1000C8052888210);
        goto LABEL_3;
      }
    }
    return v14;
  }
  int v14 = [(VCPCNNFullConnectionBlock *)self readWeightsBias:a3 weights:self->super._weight bias:self->super._bias inputDim:v8 outputDim:v7 quantFactor:v6];
  if (v14) {
    return v14;
  }
LABEL_3:
  return [(VCPCNNFullConnectionBlockGPU *)self setupMPS];
}

- (int)forward
{
  if (!self->super.super._executedOnGPU
    || (int result = [(VCPCNNData *)self->super.super._output reallocGPUTemporalBuffers]) == 0)
  {
    uint64_t v4 = [(VCPCNNMetalContext *)self->super.super._context commandBuffer];
    if (v4)
    {
      unint64_t v5 = (void *)v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._input);
      uint64_t v7 = [WeakRetained mpsImg];
      if (v7)
      {
        uint64_t v8 = [(VCPCNNData *)self->super.super._output mpsImg];

        if (v8)
        {
          mpsFullConn = self->_mpsFullConn;
          uint64_t v10 = [(VCPCNNMetalContext *)self->super.super._context commandBuffer];
          id v11 = objc_loadWeakRetained((id *)&self->super.super._input);
          id v12 = [v11 mpsImg];
          uint64_t v13 = [(VCPCNNData *)self->super.super._output mpsImg];
          [(MPSCNNFullyConnected *)mpsFullConn encodeToCommandBuffer:v10 sourceImage:v12 destinationImage:v13];

          int result = 0;
          self->super.super._executedOnGPU = 1;
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

- (void).cxx_destruct
{
}

@end