@interface _MLCCPUConvolution
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 convolutionTranspose:(BOOL)a7;
+ (id)createBNNSNDArrayDescriptorForDescriptor:(id)a3 biasDelta:(id)a4 dataType:(int)a5;
+ (id)createBNNSNDArrayDescriptorForDescriptor:(id)a3 weightsDelta:(id)a4 fullyConnected:(BOOL)a5 dataType:(int)a6;
+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7;
- (_MLCCPUConvolution)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7;
@end

@implementation _MLCCPUConvolution

- (_MLCCPUConvolution)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v50 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  bzero(v60, 0x348uLL);
  CPU_BuildBNNSConvolutionWeightAndBiasParams((uint64_t)v60, v15, v13, v14);
  int v17 = [v15 isConvolutionTranspose];
  if (v17) {
    int v18 = 25;
  }
  else {
    int v18 = 4;
  }
  v56 = v14;
  if (v16)
  {
    int v19 = v17;
    if (!setBNNSActivation((uint64_t)&v61, v16))
    {
      v37 = 0;
      v38 = v50;
      goto LABEL_24;
    }
    id v48 = v12;
    if (v19) {
      int v20 = 26;
    }
    else {
      int v20 = 5;
    }
    unsigned int v46 = v20;
  }
  else
  {
    unsigned int v46 = v18;
    id v48 = v12;
  }
  uint64_t v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v60 length:840];
  memset(v59, 0, sizeof(v59));
  memset(v58, 0, sizeof(v58));
  v53 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v59 length:176];
  v52 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v58 length:176];
  v22 = objc_opt_class();
  v23 = [v13 descriptor];
  v51 = objc_msgSend(v22, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v15, 0, 0, objc_msgSend(v23, "dataType"));

  v24 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (uint64_t i = 0; i != 3; ++i)
  {
    v26 = objc_opt_class();
    v27 = [v13 descriptor];
    v28 = objc_msgSend(v26, "createBNNSNDArrayDescriptorForDescriptor:weightsDelta:fullyConnected:dataType:", v15, 0, 0, objc_msgSend(v27, "dataType"));
    [v24 setObject:v28 atIndexedSubscript:i];
  }
  id v47 = v16;
  v49 = (void *)v21;
  if (v56)
  {
    v29 = objc_opt_class();
    v30 = [v56 descriptor];
    uint64_t v54 = objc_msgSend(v29, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v15, 0, objc_msgSend(v30, "dataType"));

    v31 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    for (uint64_t j = 0; j != 3; ++j)
    {
      v33 = objc_opt_class();
      v34 = [v56 descriptor];
      v35 = objc_msgSend(v33, "createBNNSNDArrayDescriptorForDescriptor:biasDelta:dataType:", v15, 0, objc_msgSend(v34, "dataType"));
      [v31 setObject:v35 atIndexedSubscript:j];
    }
    uint64_t v21 = (uint64_t)v49;
    v36 = (void *)v54;
  }
  else
  {
    v36 = 0;
    v31 = 0;
  }
  v63[0] = v53;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
  v62 = v52;
  v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v62 count:1];
  v55 = v36;
  v41 = +[MLCCPUDeviceOps deviceOpsWithType:v46 params:v21 inDeltaData:v39 outDeltaData:v40 weightsDeltaData:v51 biasDeltaData:v36 weightsMomentumData:v24 biasMomentumData:v31];

  id v12 = v48;
  id v14 = v56;
  v38 = v50;
  if (v41)
  {
    [v50 addObject:v41];
    v42 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    [v41 setWeightsMomentumDataBytes:v42];

    if (v56)
    {
      v43 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      [v41 setBiasMomentumDataBytes:v43];
    }
    objc_msgSend(v41, "setPaddingPolicy:", objc_msgSend(v15, "paddingPolicy"));
  }
  v44 = (void *)[v50 copy];
  v57.receiver = self;
  v57.super_class = (Class)_MLCCPUConvolution;
  self = [(_MLCCPULayer *)&v57 initWithDevice:v48 deviceOps:v44];

  v37 = self;
  id v16 = v47;
LABEL_24:

  return v37;
}

+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 convolutionDescriptor:(id)a6 neuronDescriptor:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  int v17 = (void *)[objc_alloc((Class)a1) initWithDevice:v16 weights:v15 biasTerms:v14 convolutionDescriptor:v13 neuronDescriptor:v12];

  return v17;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6 convolutionTranspose:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a5;
  id v12 = a6;
  id v13 = [a4 objectAtIndexedSubscript:0];
  id v14 = [v13 params];
  id v15 = (BNNSLayerParametersConvolution *)[v14 bytes];
  CPU_BuildBNNSConvolutionInputOutputParams(v15, v11, v12, v7, [v13 paddingPolicy]);
  memset(&v23, 0, sizeof(v23));
  v23.flags = 1;
  if (v7) {
    id v16 = BNNSFilterCreateLayerTransposedConvolution(v15, &v23);
  }
  else {
    id v16 = (void *)MEMORY[0x1E01B0CE0](v15, &v23);
  }
  int v17 = v16;
  if (v16)
  {
    objc_msgSend(v13, "setBNNSFilter:", v16, *(_OWORD *)&v23.flags, *(_OWORD *)&v23.alloc_memory);
    int v18 = [v11 objectAtIndexedSubscript:0];
    [v13 setSourceStride:CPU_SetBatchStride(v18)];

    [v13 setResultStride:CPU_SetBatchStride(v12)];
  }
  else
  {
    int v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      +[_MLCCPUConvolution compileWithDevice:deviceOps:sourceTensors:resultTensor:convolutionTranspose:](a2, v19);
    }
  }
  objc_opt_class();
  int v20 = objc_opt_new();
  [v13 setLayer:v20];

  uint64_t v21 = [v13 layer];
  [v21 setFilter:v17];

  return 1;
}

+ (id)createBNNSNDArrayDescriptorForDescriptor:(id)a3 biasDelta:(id)a4 dataType:(int)a5
{
  id v7 = a4;
  *((void *)&v10 + 1) = objc_msgSend(a3, "outputFeatureChannelCount", 0x1000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                            0,
                            0,
                            0,
                            0,
                            0);
  *((void *)&v11 + 1) = 1;
  if (v7) {
    *((void *)&v12 + 1) = [v7 bytes];
  }
  LODWORD(v13) = CPU_BNNSDataType(a5);
  *(void *)((char *)&v14 + 4) = 1065353216;
  v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v10 length:176];

  return v8;
}

+ (id)createBNNSNDArrayDescriptorForDescriptor:(id)a3 weightsDelta:(id)a4 fullyConnected:(BOOL)a5 dataType:(int)a6
{
  BOOL v7 = a5;
  id v9 = a3;
  id v10 = a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = 0u;
  if (!v7)
  {
    if (objc_msgSend(v9, "usesDepthwiseConvolution", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29))uint64_t v11 = objc_msgSend(v9, "inputFeatureChannelCount"); {
    else
    }
      uint64_t v11 = [v9 groupCount];
    unint64_t v12 = v11;
    DWORD1(v19) = 0x40000;
    uint64_t v13 = [v9 kernelWidth];
    *((void *)&v19 + 1) = v13;
    uint64_t v14 = [v9 kernelHeight];
    *(void *)&long long v20 = v14;
    unint64_t v15 = [v9 inputFeatureChannelCount];
    if (v12 == 1) {
      unint64_t v16 = v15;
    }
    else {
      unint64_t v16 = v15 / v12;
    }
    *((void *)&v20 + 1) = v16;
    *(void *)&long long v21 = [v9 outputFeatureChannelCount];
    *((void *)&v23 + 1) = 1;
    *(void *)&long long v24 = v13;
    *((void *)&v24 + 1) = v14 * v13;
    *(void *)&long long v25 = v16 * v14 * v13;
    if (!v10) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  DWORD1(v19) = 0x20000;
  *((void *)&v19 + 1) = objc_msgSend(v9, "inputFeatureChannelCount", v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29);
  *(void *)&long long v20 = [v9 outputFeatureChannelCount];
  *((void *)&v23 + 1) = 1;
  *(void *)&long long v24 = [v9 inputFeatureChannelCount];
  if (v10) {
LABEL_11:
  }
    *((void *)&v27 + 1) = [v10 bytes];
LABEL_12:
  LODWORD(v28) = CPU_BNNSDataType(a6);
  *(void *)((char *)&v29 + 4) = 1065353216;
  int v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v19 length:176];

  return v17;
}

+ (void)compileWithDevice:(const char *)a1 deviceOps:(NSObject *)a2 sourceTensors:resultTensor:convolutionTranspose:.cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: BNNS filter could not be created", (uint8_t *)&v4, 0xCu);
}

@end