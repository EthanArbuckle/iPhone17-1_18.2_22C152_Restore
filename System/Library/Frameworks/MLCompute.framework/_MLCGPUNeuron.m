@interface _MLCGPUNeuron
+ (id)createMPSNeuronDescriptorWith:(id)a3;
+ (id)layerWithDevice:(id)a3 descriptor:(id)a4;
+ (int)mpsNeurontypeFrom:(int)a3;
- (_MLCGPUNeuron)initWithDevice:(id)a3 descriptor:(id)a4;
@end

@implementation _MLCGPUNeuron

+ (int)mpsNeurontypeFrom:(int)a3
{
  if a3 < 0x13 && ((0x407FFu >> a3)) {
    return dword_1DD1F0B00[a3];
  }
  v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    +[_MLCGPUNeuron mpsNeurontypeFrom:](a3, v4);
  }

  return 16;
}

+ (id)createMPSNeuronDescriptorWith:(id)a3
{
  id v4 = a3;
  [v4 a];
  int v6 = v5;
  [v4 b];
  int v8 = v7;
  [v4 c];
  int v10 = v9;
  uint64_t v11 = [v4 activationType];

  uint64_t v12 = [a1 mpsNeurontypeFrom:v11];
  if (v12 == 16)
  {
    v16 = +[MLCLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      +[_MLCGPUNeuron createMPSNeuronDescriptorWith:](v16);
    }

    v17 = 0;
  }
  else
  {
    LODWORD(v13) = v6;
    LODWORD(v14) = v8;
    LODWORD(v15) = v10;
    v17 = [MEMORY[0x1E4F35930] cnnNeuronDescriptorWithType:v12 a:v13 b:v14 c:v15];
  }

  return v17;
}

- (_MLCGPUNeuron)initWithDevice:(id)a3 descriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v30.receiver = self;
  v30.super_class = (Class)_MLCGPUNeuron;
  int v8 = [(_MLCGPUNeuron *)&v30 init];
  int v9 = v8;
  if (v8)
  {
    v27 = v8;
    int v10 = [v6 deviceList];
    uint64_t v11 = [v10 count];

    uint64_t v12 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    id v28 = v7;
    if (v11)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        double v14 = [v6 deviceList];
        double v15 = [v14 objectAtIndexedSubscript:i];

        v16 = [v6 gpuLibrary];
        v17 = [v16 objectAtIndexedSubscript:i];
        v18 = (void *)[v17 newFunctionWithName:@"activation_forward"];

        v19 = (void *)[v15 newComputePipelineStateWithFunction:v18 error:0];
        v20 = [v6 gpuLibrary];
        v21 = [v20 objectAtIndexedSubscript:i];
        v22 = (void *)[v21 newFunctionWithName:@"activation_gradient"];

        v23 = (void *)[v15 newComputePipelineStateWithFunction:v22 error:0];
        v24 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v19 gradientKernel:v23];
        [v24 setIsMPSKernel:0];
        [v24 setMetalKernelType:1];
        [v24 setNeuronDescriptor:v28];
        [v24 setSourceOfForwardNeededForGradient:1];
        [v24 setResultOfForwardNeededForGradient:0];
        [v12 addObject:v24];
      }
    }
    v25 = (void *)[v12 copy];
    int v9 = v27;
    v29.receiver = v27;
    v29.super_class = (Class)_MLCGPUNeuron;
    [(_MLCGPULayer *)&v29 setDeviceOps:v25];

    id v7 = v28;
  }

  return v9;
}

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = (void *)[objc_alloc((Class)a1) initWithDevice:v7 descriptor:v6];

  return v8;
}

+ (void)mpsNeurontypeFrom:(int)a1 .cold.1(int a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136315394;
  v3 = "+[_MLCGPUNeuron mpsNeurontypeFrom:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%s: Unknown neuron type %d", (uint8_t *)&v2, 0x12u);
}

+ (void)createMPSNeuronDescriptorWith:(os_log_t)log .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v1 = 136315394;
  int v2 = "+[_MLCGPUNeuron createMPSNeuronDescriptorWith:]";
  __int16 v3 = 1024;
  int v4 = 16;
  _os_log_error_impl(&dword_1DD0C9000, log, OS_LOG_TYPE_ERROR, "%s: Unknown MPS neuron type %d", (uint8_t *)&v1, 0x12u);
}

@end