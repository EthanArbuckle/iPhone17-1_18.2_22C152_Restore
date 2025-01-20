@interface _MLCGPUWeightsConvolution
+ (id)weightWithDescriptor:(id)a3 biasTerms:(id)a4 weights:(id)a5;
+ (id)weightWithDescriptor:(id)a3 biasTerms:(id)a4 weights:(id)a5 neuronDescriptor:(id)a6;
- (BOOL)load;
- (MLCActivationDescriptor)neuronDesc;
- (MLCConvolutionDescriptor)desc;
- (MLCTensor)biasTerm;
- (MLCTensor)localBiasTerm;
- (MLCTensor)localWeight;
- (MLCTensor)weight;
- (MPSCNNConvolutionDescriptor)descMPS;
- (NSString)description;
- (_MLCGPUWeightsConvolution)initWithDescriptor:(id)a3 biasTerms:(id)a4 weights:(id)a5 neuronDescriptor:(id)a6;
- (float)biasTerms;
- (id)copyWithZone:(_NSZone *)a3;
- (id)label;
- (unsigned)dataType;
- (unsigned)kernelWeightsDataType;
- (unsigned)weightsLayout;
- (void)setLocalBiasTerm:(id)a3;
- (void)setLocalWeight:(id)a3;
- (void)weights;
@end

@implementation _MLCGPUWeightsConvolution

+ (id)weightWithDescriptor:(id)a3 biasTerms:(id)a4 weights:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v10 biasTerms:v9 weights:v8 neuronDescriptor:0];

  return v11;
}

+ (id)weightWithDescriptor:(id)a3 biasTerms:(id)a4 weights:(id)a5 neuronDescriptor:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v13 biasTerms:v12 weights:v11 neuronDescriptor:v10];

  return v14;
}

- (_MLCGPUWeightsConvolution)initWithDescriptor:(id)a3 biasTerms:(id)a4 weights:(id)a5 neuronDescriptor:(id)a6
{
  id v9 = a3;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v73.receiver = self;
  v73.super_class = (Class)_MLCGPUWeightsConvolution;
  v16 = [(_MLCGPUWeightsConvolution *)&v73 init];
  v17 = v16;
  if (!v16) {
    goto LABEL_19;
  }
  v70 = a2;
  localWeight = v16->_localWeight;
  v16->_localWeight = 0;

  localBiasTerm = v17->_localBiasTerm;
  v17->_localBiasTerm = 0;

  if ([v12 usesDepthwiseConvolution])
  {
    if ([v12 inputFeatureChannelCount])
    {
      unint64_t v20 = [v12 outputFeatureChannelCount];
      if (v20 / [v12 inputFeatureChannelCount] != 1)
      {
        v67 = +[MLCLog framework];
        if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
          -[_MLCGPUWeightsConvolution initWithDescriptor:biasTerms:weights:neuronDescriptor:](v70);
        }

        goto LABEL_23;
      }
    }
    id obj = v13;
    v21 = (void *)MEMORY[0x1E4F35428];
    uint64_t v22 = [v12 kernelWidth];
    uint64_t v23 = [v12 kernelHeight];
    uint64_t v24 = [v12 inputFeatureChannelCount];
    uint64_t v25 = [v12 outputFeatureChannelCount];
    v26 = v21;
    uint64_t v27 = v22;
    uint64_t v28 = v23;
    uint64_t v29 = v24;
  }
  else
  {
    id obj = v13;
    v30 = (void *)MEMORY[0x1E4F353F0];
    uint64_t v31 = [v12 kernelWidth];
    uint64_t v32 = [v12 kernelHeight];
    uint64_t v33 = [v12 inputFeatureChannelCount];
    uint64_t v25 = [v12 outputFeatureChannelCount];
    v26 = v30;
    uint64_t v27 = v31;
    uint64_t v28 = v32;
    uint64_t v29 = v33;
  }
  uint64_t v34 = [v26 cnnConvolutionDescriptorWithKernelWidth:v27 kernelHeight:v28 inputFeatureChannels:v29 outputFeatureChannels:v25];
  descMPS = v17->_descMPS;
  v17->_descMPS = (MPSCNNConvolutionDescriptor *)v34;

  -[MPSCNNConvolutionDescriptor setStrideInPixelsX:](v17->_descMPS, "setStrideInPixelsX:", [v12 strideInX]);
  -[MPSCNNConvolutionDescriptor setStrideInPixelsY:](v17->_descMPS, "setStrideInPixelsY:", [v12 strideInY]);
  -[MPSCNNConvolutionDescriptor setDilationRateX:](v17->_descMPS, "setDilationRateX:", [v12 dilationRateInX]);
  -[MPSCNNConvolutionDescriptor setDilationRateY:](v17->_descMPS, "setDilationRateY:", [v12 dilationRateInY]);
  if ((unint64_t)[v12 groupCount] < 2
    || (unint64_t v36 = [v12 inputFeatureChannelCount],
        unint64_t v37 = v36 / [v12 groupCount],
        unint64_t v38 = [v12 outputFeatureChannelCount],
        unint64_t v39 = [v12 groupCount],
        (v37 & 3) == 0)
    && ((v38 / v39) & 3) == 0)
  {
    -[MPSCNNConvolutionDescriptor setGroups:](v17->_descMPS, "setGroups:", [v12 groupCount]);
    if ([v12 isConvolutionTranspose])
    {
      v42 = [v14 descriptor];
      v43 = malloc_type_malloc([v42 tensorAllocationSizeInBytes], 0x4E4F2958uLL);

      v44 = [v14 data];
      v71 = +[MLCTensorData dataWithBytesNoCopy:length:freeWhenDone:](MLCTensorData, "dataWithBytesNoCopy:length:freeWhenDone:", v43, [v44 length], 1);

      v45 = [v14 descriptor];
      v46 = +[MLCTensor tensorWithDescriptor:v45 data:v71];

      v69 = [v14 descriptor];
      v47 = [v69 shape];
      v48 = [v14 data];
      [(MLCTensor *)v46 data];
      id v49 = v9;
      id v50 = v14;
      id v51 = v15;
      v53 = id v52 = a6;
      rotateWeightsTensorBy180Degree(v47, v48, v53);

      a6 = v52;
      id v15 = v51;
      id v14 = v50;
      id v9 = v49;

      objc_storeWeak((id *)&v17->_weight, v46);
      v54 = v17->_localWeight;
      v17->_localWeight = v46;
    }
    else
    {
      objc_storeWeak((id *)&v17->_weight, v14);
    }
    objc_storeStrong((id *)&v17->_desc, v9);
    id v13 = obj;
    objc_storeWeak((id *)&v17->_biasTerm, obj);
    if (!v15) {
      goto LABEL_19;
    }
    objc_storeStrong((id *)&v17->_neuronDesc, a6);
    uint64_t v55 = +[_MLCGPUNeuron mpsNeurontypeFrom:](_MLCGPUNeuron, "mpsNeurontypeFrom:", [v15 activationType]);
    if (v55 != 16)
    {
      uint64_t v56 = v55;
      v57 = (void *)MEMORY[0x1E4F35930];
      [v15 a];
      int v59 = v58;
      [v15 b];
      int v61 = v60;
      [v15 c];
      LODWORD(v63) = v62;
      LODWORD(v64) = v59;
      LODWORD(v65) = v61;
      v66 = [v57 cnnNeuronDescriptorWithType:v56 a:v64 b:v65 c:v63];
      [(MPSCNNConvolutionDescriptor *)v17->_descMPS setFusedNeuronDescriptor:v66];

LABEL_19:
      v41 = v17;
      goto LABEL_24;
    }
LABEL_23:
    v41 = 0;
    goto LABEL_24;
  }
  v40 = +[MLCLog framework];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
    -[_MLCGPUWeightsConvolution initWithDescriptor:biasTerms:weights:neuronDescriptor:](v70);
  }

  v41 = 0;
  id v13 = obj;
LABEL_24:

  return v41;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(_MLCGPUWeightsConvolution *)self descMPS];
  v7 = [(_MLCGPUWeightsConvolution *)self desc];
  id v8 = [(_MLCGPUWeightsConvolution *)self weight];
  id v9 = [v3 stringWithFormat:@"%@: { descMPS=%@ : desc=%@ : weight=%@ }", v5, v6, v7, v8];

  return (NSString *)v9;
}

- (float)biasTerms
{
  v2 = [(_MLCGPUWeightsConvolution *)self biasTerm];
  id v3 = [v2 data];
  v4 = (float *)[v3 bytes];

  return v4;
}

- (unsigned)dataType
{
  v2 = [(_MLCGPUWeightsConvolution *)self weight];
  id v3 = [v2 descriptor];
  int v4 = [v3 dataType];

  if (v4 == 3) {
    return 268435472;
  }
  else {
    return 268435488;
  }
}

- (id)label
{
  v2 = [(_MLCGPUWeightsConvolution *)self desc];
  int v3 = [v2 isConvolutionTranspose];

  if (v3) {
    return @"MPSWeightConvolutionTranspose";
  }
  else {
    return @"MPSWeightConvolution";
  }
}

- (BOOL)load
{
  return 1;
}

- (void)weights
{
  v2 = [(_MLCGPUWeightsConvolution *)self weight];
  id v3 = [v2 data];
  int v4 = (void *)[v3 bytes];

  return v4;
}

- (unsigned)weightsLayout
{
  return 1;
}

- (unsigned)kernelWeightsDataType
{
  v2 = [(_MLCGPUWeightsConvolution *)self weight];
  id v3 = [v2 descriptor];
  int v4 = [v3 dataType];

  if (v4 == 3) {
    return 268435472;
  }
  else {
    return 268435488;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  int v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(_MLCGPUWeightsConvolution *)self desc];
  v6 = [(_MLCGPUWeightsConvolution *)self biasTerm];
  v7 = [(_MLCGPUWeightsConvolution *)self weight];
  id v8 = [(_MLCGPUWeightsConvolution *)self neuronDesc];
  id v9 = (void *)[v4 initWithDescriptor:v5 biasTerms:v6 weights:v7 neuronDescriptor:v8];

  return v9;
}

- (MLCTensor)weight
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weight);

  return (MLCTensor *)WeakRetained;
}

- (MLCTensor)biasTerm
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_biasTerm);

  return (MLCTensor *)WeakRetained;
}

- (MLCTensor)localWeight
{
  return self->_localWeight;
}

- (void)setLocalWeight:(id)a3
{
}

- (MLCTensor)localBiasTerm
{
  return self->_localBiasTerm;
}

- (void)setLocalBiasTerm:(id)a3
{
}

- (MLCActivationDescriptor)neuronDesc
{
  return self->_neuronDesc;
}

- (MPSCNNConvolutionDescriptor)descMPS
{
  return self->_descMPS;
}

- (MLCConvolutionDescriptor)desc
{
  return self->_desc;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desc, 0);
  objc_storeStrong((id *)&self->_descMPS, 0);
  objc_storeStrong((id *)&self->_neuronDesc, 0);
  objc_storeStrong((id *)&self->_localBiasTerm, 0);
  objc_storeStrong((id *)&self->_localWeight, 0);
  objc_destroyWeak((id *)&self->_biasTerm);

  objc_destroyWeak((id *)&self->_weight);
}

- (void)initWithDescriptor:(const char *)a1 biasTerms:weights:neuronDescriptor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: groupCount > 1 with Number of input/output channels in each group NOT be multiple of 4 is unsupported on GPU", v4, v5, v6, v7, 2u);
}

- (void)initWithDescriptor:(const char *)a1 biasTerms:weights:neuronDescriptor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: channel multiplier > 1 for depthWiseConvolution is not supported in MLCompute-GPU", v4, v5, v6, v7, 2u);
}

@end