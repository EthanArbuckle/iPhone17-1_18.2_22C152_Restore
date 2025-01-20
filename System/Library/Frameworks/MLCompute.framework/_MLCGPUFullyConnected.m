@interface _MLCGPUFullyConnected
+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7;
+ (void)setGradientComputeWeightsAndBiasOnly:(id)a3 deviceOps:(id)a4;
- (_MLCGPUFullyConnected)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7;
@end

@implementation _MLCGPUFullyConnected

- (_MLCGPUFullyConnected)initWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7
{
  v65[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v54 = a4;
  id v55 = a5;
  id v12 = a6;
  v59.receiver = self;
  v59.super_class = (Class)_MLCGPUFullyConnected;
  v13 = [(_MLCGPUFullyConnected *)&v59 init];
  v14 = v13;
  if (v13)
  {
    v50 = v13;
    v53 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v15 = [v11 deviceList];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      unint64_t v17 = 0;
      id v56 = v11;
      do
      {
        v18 = [v11 deviceList];
        v19 = [v18 objectAtIndexedSubscript:v17];

        v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35660]), "initWithDevice:transposeLeft:transposeRight:resultRows:resultColumns:interiorColumns:alpha:beta:", v19, 0, 1, 1, objc_msgSend(v12, "outputFeatureChannelCount"), objc_msgSend(v12, "inputFeatureChannelCount"), 1.0, 0.0);
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35660]), "initWithDevice:transposeLeft:transposeRight:resultRows:resultColumns:interiorColumns:alpha:beta:", v19, 0, 0, 1, objc_msgSend(v12, "inputFeatureChannelCount"), objc_msgSend(v12, "outputFeatureChannelCount"), 1.0, 0.0);
        v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F35660]), "initWithDevice:transposeLeft:transposeRight:resultRows:resultColumns:interiorColumns:alpha:beta:", v19, 1, 0, objc_msgSend(v12, "outputFeatureChannelCount"), objc_msgSend(v12, "inputFeatureChannelCount"), 1, 1.0, 0.0);
        if (v20)
        {
          if (v21)
          {
            v57 = v22;
            v23 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v20 gradientKernel:v21 secondaryGradientKernel:v22];
            v65[0] = v20;
            v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:1];
            v25 = (void *)[v24 mutableCopy];
            [v23 setForwardStatisticsKernel:v25];

            v64[0] = v21;
            v64[1] = v57;
            v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
            v27 = (void *)[v26 mutableCopy];
            [v23 setGradientStatisticsKernel:v27];

            v22 = v57;
            if (v23)
            {
              v28 = [v11 deviceList];
              unint64_t v29 = [v28 count];

              if (v29 < 2)
              {
                v31 = v54;
              }
              else
              {
                v30 = +[MLCMultiGPUDeviceOps multiGPUDeviceOpsWithGPUDeviceOps:v23];

                v31 = v54;
                if (v55)
                {
                  v62[0] = v54;
                  v62[1] = v55;
                  v32 = (void *)MEMORY[0x1E4F1C978];
                  v33 = (id *)v62;
                  uint64_t v34 = 2;
                }
                else
                {
                  id v63 = v54;
                  v32 = (void *)MEMORY[0x1E4F1C978];
                  v33 = &v63;
                  uint64_t v34 = 1;
                }
                v35 = [v32 arrayWithObjects:v33 count:v34];
                GPU_AllocateResourceForMultiGPUTraining(v11, v30, v35, v17);

                v23 = v30;
              }
              if ([v11 needToAllocateDeviceMemoryForTensor:v31]) {
                [v11 allocateDeviceMemoryForTensor:v31];
              }
              [v11 broadcastTensor:v31];
              v36 = [v31 descriptor];
              objc_msgSend(v23, "setWeightsDataType:", objc_msgSend(v36, "dataType"));

              if (v55)
              {
                if ([v11 needToAllocateDeviceMemoryForTensor:v55]) {
                  [v11 allocateDeviceMemoryForTensor:v55];
                }
                [v11 broadcastTensor:v55];
                v52 = [v31 deviceMemory];
                v51 = [v52 objectAtIndexedSubscript:v17];
                v61[0] = v51;
                v37 = [v55 deviceMemory];
                v38 = [v37 objectAtIndexedSubscript:v17];
                v61[1] = v38;
                v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
                v40 = (void *)[v39 copy];
                [v23 setExportableState:v40];

                v41 = [v55 descriptor];
                objc_msgSend(v23, "setBiasesDataType:", objc_msgSend(v41, "dataType"));

                [v23 setArithmeticOp:0];
              }
              else
              {
                v42 = [v31 deviceMemory];
                v43 = [v42 objectAtIndexedSubscript:v17];
                v60 = v43;
                v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
                v45 = (void *)[v44 copy];
                [v23 setExportableState:v45];
              }
              [v23 setTotalElementsPerChannel:1];
              [v23 setSourceOfForwardNeededForGradient:1];
              [v23 setResultOfForwardNeededForGradient:0];
              [v53 addObject:v23];

              id v11 = v56;
              v22 = v57;
            }
          }
        }

        ++v17;
        v46 = [v11 deviceList];
        unint64_t v47 = [v46 count];

        id v11 = v56;
      }
      while (v17 < v47);
    }
    v48 = (void *)[v53 copy];
    v14 = v50;
    v58.receiver = v50;
    v58.super_class = (Class)_MLCGPUFullyConnected;
    [(_MLCGPULayer *)&v58 setDeviceOps:v48];
  }
  return v14;
}

+ (void)setGradientComputeWeightsAndBiasOnly:(id)a3 deviceOps:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  v6 = [v12 deviceList];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    do
    {
      v9 = [v5 objectAtIndexedSubscript:v8];
      [v9 setComputeWeightsAndBiasOnly:1];

      ++v8;
      v10 = [v12 deviceList];
      unint64_t v11 = [v10 count];
    }
    while (v8 < v11);
  }
}

+ (id)layerWithDevice:(id)a3 weights:(id)a4 biasTerms:(id)a5 descriptor:(id)a6 neuronDescriptor:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  unint64_t v17 = (void *)[objc_alloc((Class)a1) initWithDevice:v16 weights:v15 biasTerms:v14 descriptor:v13 neuronDescriptor:v12];

  return v17;
}

@end