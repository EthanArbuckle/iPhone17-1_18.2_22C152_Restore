@interface VCPCNNConvBlockGPU
- (int)fillConvWeightsGPU;
- (int)gpuForward;
- (int)readBatchNormParam:(__sFILE *)a3 quantFactor:(signed __int16)a4;
- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4;
- (void)dealloc;
- (void)releaseBatchNormMemory;
@end

@implementation VCPCNNConvBlockGPU

- (void)releaseBatchNormMemory
{
  batchNormMean = self->_batchNormMean;
  if (batchNormMean) {
    MEMORY[0x1C186C790](batchNormMean, 0x1000C8052888210);
  }
  batchNormVar = self->_batchNormVar;
  if (batchNormVar) {
    MEMORY[0x1C186C790](batchNormVar, 0x1000C8052888210);
  }
  batchNormBeta = self->_batchNormBeta;
  if (batchNormBeta) {
    MEMORY[0x1C186C790](batchNormBeta, 0x1000C8052888210);
  }
  batchNormGamma = self->_batchNormGamma;
  if (batchNormGamma) {
    MEMORY[0x1C186C790](batchNormGamma, 0x1000C8052888210);
  }
  self->_batchNormMean = 0;
  self->_batchNormVar = 0;
  self->_batchNormBeta = 0;
  self->_batchNormGamma = 0;
}

- (void)dealloc
{
  [(VCPCNNConvBlockGPU *)self releaseBatchNormMemory];
  v3.receiver = self;
  v3.super_class = (Class)VCPCNNConvBlockGPU;
  [(VCPCNNConvBlockGPU *)&v3 dealloc];
}

- (int)gpuForward
{
  if (!self->super.super._executedOnGPU
    || (int result = [(VCPCNNData *)self->super.super._output reallocGPUTemporalBuffers]) == 0)
  {
    uint64_t v4 = [(VCPCNNMetalContext *)self->super.super._context commandBuffer];
    if (v4)
    {
      v5 = (void *)v4;
      id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._input);
      v7 = [WeakRetained mpsImg];
      if (v7)
      {
        v8 = [(VCPCNNData *)self->super.super._output mpsImg];

        if (v8)
        {
          mpsConv = self->_mpsConv;
          v10 = [(VCPCNNMetalContext *)self->super.super._context commandBuffer];
          id v11 = objc_loadWeakRetained((id *)&self->super.super._input);
          v12 = [v11 mpsImg];
          v13 = [(VCPCNNData *)self->super.super._output mpsImg];
          [(MPSCNNConvolution *)mpsConv encodeToCommandBuffer:v10 sourceImage:v12 destinationImage:v13];

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

- (int)fillConvWeightsGPU
{
  objc_super v3 = [(VCPCNNData *)self->super._filter size];
  uint64_t v4 = [v3 objectAtIndexedSubscript:0];
  int v5 = [v4 intValue];

  v6 = [(VCPCNNData *)self->super._filter size];
  v7 = [v6 objectAtIndexedSubscript:1];
  int v8 = [v7 intValue];

  v9 = [(VCPCNNData *)self->super._filter size];
  v10 = [v9 objectAtIndexedSubscript:2];
  int v11 = [v10 intValue];
  v12 = [(VCPCNNData *)self->super._filter size];
  v13 = [v12 objectAtIndexedSubscript:3];
  int v14 = [v13 intValue];

  v15 = [(VCPCNNData *)self->super._filter size];
  v16 = [v15 objectAtIndexedSubscript:2];
  uint64_t v59 = [v16 intValue];

  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super._inputSize);
  v18 = [WeakRetained objectAtIndexedSubscript:0];
  int v19 = [v18 intValue];

  v20 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:0];
  int v21 = [v20 intValue];
  uint64_t v22 = (v14 * v11);

  int v23 = v8 * v5 * v22;
  if (v23 < 0) {
    size_t v24 = -1;
  }
  else {
    size_t v24 = 4 * v23;
  }
  v25 = (float *)operator new[](v24, MEMORY[0x1E4FBA2D0]);
  if (!v25) {
    return -108;
  }
  v26 = v25;
  memcpy(v25, [(VCPCNNData *)self->super._filter data], 4 * v5 * (uint64_t)v8 * (int)v22);
  v27 = [(VCPCNNData *)self->super._filter data];
  if (v5 >= 1)
  {
    int v28 = 0;
    uint64_t v29 = 4 * (int)v22 * v8;
    v30 = v26;
    do
    {
      if ((int)v22 >= 1)
      {
        uint64_t v31 = 0;
        v32 = v30;
        v33 = v27;
        do
        {
          uint64_t v34 = v8;
          v35 = v32;
          v36 = v33;
          if (v8 >= 1)
          {
            do
            {
              *v36++ = *v35;
              v35 += (int)v22;
              --v34;
            }
            while (v34);
          }
          ++v31;
          v33 += v8;
          ++v32;
        }
        while (v31 != v22);
      }
      ++v28;
      v27 = (float *)((char *)v27 + v29);
      v30 = (float *)((char *)v30 + v29);
    }
    while (v28 != v5);
  }
  MEMORY[0x1C186C790](v26, 0x1000C8052888210);
  if (v19 != v21 || v19 != self->super._groups)
  {
    v39 = objc_msgSend(MEMORY[0x1E4F353F0], "cnnConvolutionDescriptorWithKernelWidth:kernelHeight:inputFeatureChannels:outputFeatureChannels:", (int)v59, (int)v59, v19, v21, v59);
    if (v39)
    {
      v38 = v39;
      [v39 setGroups:self->super._groups];
      goto LABEL_19;
    }
    return -108;
  }
  v37 = [MEMORY[0x1E4F35428] cnnConvolutionDescriptorWithKernelWidth:(int)v59 kernelHeight:(int)v59 inputFeatureChannels:v19 outputFeatureChannels:v19];
  if (!v37) {
    return -108;
  }
  v38 = v37;
  [v37 setGroups:1];
LABEL_19:
  if (self->super._reLU)
  {
    v40 = [v38 fusedNeuronDescriptor];
    [v40 setNeuronType:1];

    v41 = [v38 fusedNeuronDescriptor];
    [v41 setA:0.0];
  }
  objc_msgSend(v38, "setStrideInPixelsX:", self->super._stride, v59);
  [v38 setStrideInPixelsY:self->super._stride];
  [v38 setFeatureChannelsLayout:1];
  if (self->super._batchNorm)
  {
    LODWORD(v42) = 925353388;
    [v38 setBatchNormalizationParametersForInferenceWithMean:self->_batchNormMean variance:self->_batchNormVar gamma:self->_batchNormGamma beta:self->_batchNormBeta epsilon:v42];
  }
  v43 = [[VCPCNNMPSDataSource alloc] initWith:268435488 convolutionDescriptor:v38 kernelWeights:[(VCPCNNData *)self->super._filter data] biasTerm:[(VCPCNNData *)self->super._bias data]];
  if (!v43) {
    goto LABEL_29;
  }
  id v44 = objc_alloc(MEMORY[0x1E4F353E8]);
  v45 = [(VCPCNNMetalContext *)self->super.super._context device];
  v46 = (MPSCNNConvolution *)[v44 initWithDevice:v45 weights:v43];
  mpsConv = self->_mpsConv;
  self->_mpsConv = v46;

  v48 = self->_mpsConv;
  if (v48)
  {
    [(MPSCNNConvolution *)v48 setEdgeMode:0];
    v49 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:2];
    int v50 = [v49 intValue];
    v51 = [(NSMutableArray *)self->super.super._outputSize objectAtIndexedSubscript:1];
    int v52 = [v51 intValue];

    if (!self->super._padding)
    {
      int v53 = v60 - 1;
      if (v60 == 1)
      {
        uint64_t v54 = 0;
      }
      else
      {
        if (v53 < 0) {
          int v53 = v60;
        }
        LODWORD(v54) = v53 >> 1;
        if ((int)v54 <= 1) {
          uint64_t v54 = 1;
        }
        else {
          uint64_t v54 = v54;
        }
      }
      v56 = self->_mpsConv;
      v62[0] = v54;
      v62[1] = v54;
      v62[2] = 0;
      [(MPSCNNConvolution *)v56 setOffset:v62];
    }
    v57 = self->_mpsConv;
    memset(v61, 0, 24);
    v61[3] = v50;
    v61[4] = v52;
    v61[5] = 1;
    [(MPSCNNConvolution *)v57 setClipRect:v61];
    int v55 = 0;
  }
  else
  {
LABEL_29:
    int v55 = -108;
  }

  return v55;
}

- (int)readBatchNormParam:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  if (!self->super._batchNorm) {
    return 0;
  }
  int v4 = a4;
  [(VCPCNNConvBlockGPU *)self releaseBatchNormMemory];
  size_t filterSize = self->super._filterSize;
  if (!v4)
  {
    if ((filterSize & 0x80000000) != 0) {
      size_t v13 = -1;
    }
    else {
      size_t v13 = 4 * filterSize;
    }
    int v14 = (float *)operator new[](v13, MEMORY[0x1E4FBA2D0]);
    self->_batchNormMean = v14;
    if (v14)
    {
      v15 = (float *)operator new[](v13, MEMORY[0x1E4FBA2D0]);
      self->_batchNormVar = v15;
      if (v15)
      {
        v16 = (float *)operator new[](v13, MEMORY[0x1E4FBA2D0]);
        self->_batchNormGamma = v16;
        if (v16)
        {
          v17 = (float *)operator new[](v13, MEMORY[0x1E4FBA2D0]);
          self->_batchNormBeta = v17;
          if (v17) {
            operator new[]();
          }
        }
      }
    }
    return -108;
  }
  if (v4 != 1) {
    return -50;
  }
  if ((filterSize & 0x80000000) != 0) {
    size_t v8 = -1;
  }
  else {
    size_t v8 = 4 * filterSize;
  }
  v9 = (float *)operator new[](v8, MEMORY[0x1E4FBA2D0]);
  self->_batchNormMean = v9;
  if (!v9) {
    return -108;
  }
  v10 = (float *)operator new[](v8, MEMORY[0x1E4FBA2D0]);
  self->_batchNormVar = v10;
  if (!v10) {
    return -108;
  }
  int v11 = (float *)operator new[](v8, MEMORY[0x1E4FBA2D0]);
  self->_batchNormGamma = v11;
  if (!v11) {
    return -108;
  }
  v12 = (float *)operator new[](v8, MEMORY[0x1E4FBA2D0]);
  self->_batchNormBeta = v12;
  if (!v12) {
    return -108;
  }
  if (fread(self->_batchNormMean, 4uLL, filterSize, a3) == filterSize
    && fread(self->_batchNormVar, 4uLL, filterSize, a3) == filterSize
    && fread(self->_batchNormGamma, 4uLL, filterSize, a3) == filterSize
    && fread(self->_batchNormBeta, 4uLL, filterSize, a3) == filterSize)
  {
    return 0;
  }
  return -19;
}

- (int)readFromDisk:(__sFILE *)a3 quantFactor:(signed __int16)a4
{
  uint64_t v4 = a4;
  int result = -[VCPCNNData readFromDisk:quantFactor:](self->super._filter, "readFromDisk:quantFactor:");
  if (!result)
  {
    int result = [(VCPCNNData *)self->super._bias readFromDisk:a3 quantFactor:v4];
    if (!result)
    {
      int result = [(VCPCNNConvBlockGPU *)self readBatchNormParam:a3 quantFactor:v4];
      if (!result)
      {
        return [(VCPCNNConvBlockGPU *)self fillConvWeightsGPU];
      }
    }
  }
  return result;
}

- (void).cxx_destruct
{
}

@end