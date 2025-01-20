@interface _MLCGPUEmbedding
+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 inferenceOnly:(BOOL)a6;
- (_MLCGPUEmbedding)initWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 inferenceOnly:(BOOL)a6;
@end

@implementation _MLCGPUEmbedding

- (_MLCGPUEmbedding)initWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 inferenceOnly:(BOOL)a6
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v42.receiver = self;
  v42.super_class = (Class)_MLCGPUEmbedding;
  v12 = [(_MLCGPUEmbedding *)&v42 init];
  v13 = v12;
  if (v12)
  {
    v38 = v12;
    v40 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    v14 = [v9 deviceList];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      unint64_t v16 = 0;
      do
      {
        v17 = [v9 deviceList];
        v18 = [v17 objectAtIndexedSubscript:v16];

        v19 = +[MLCEmbeddingGPUDeviceOps deviceOps];
        if (v19)
        {
          v20 = [v11 deviceMemory];
          unint64_t v21 = [v20 count];

          if (v16 >= v21)
          {
            id v22 = [v11 data];
            uint64_t v23 = [v22 bytes];
            v24 = [v11 data];
            v25 = objc_msgSend(v18, "newBufferWithBytes:length:options:", v23, objc_msgSend(v24, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
            v26 = [v11 deviceMemory];
            [v26 setObject:v25 atIndexedSubscript:v16];
          }
          if (!a6)
          {
            v27 = [v11 data];
            v28 = objc_msgSend(v18, "newBufferWithLength:options:", objc_msgSend(v27, "length"), +[MLCGPUHelper mtlResourceOptions](MLCGPUHelper, "mtlResourceOptions"));
            [v19 setGradientForWeights:v28];
          }
          v29 = [v10 paddingIndex];
          [v19 setPaddingIndex:v29];

          [v19 setEmbeddingParams:0];
          v30 = [v10 maximumNorm];

          if (v30)
          {
            v31 = [v10 maximumNorm];
            v43[0] = v31;
            v32 = [v10 pNorm];
            v43[1] = v32;
            v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
            [v19 setEmbeddingParams:v33];
          }
          objc_msgSend(v19, "setScaleGradientByFrequency:", objc_msgSend(v10, "scalesGradientByFrequency"));
          [v19 setSourceOfForwardNeededForGradient:1];
          [v19 setResultOfForwardNeededForGradient:0];
          [v40 addObject:v19];
        }

        ++v16;
        v34 = [v9 deviceList];
        unint64_t v35 = [v34 count];
      }
      while (v16 < v35);
    }
    v36 = (void *)[v40 copy];
    v13 = v38;
    v41.receiver = v38;
    v41.super_class = (Class)_MLCGPUEmbedding;
    [(_MLCGPULayer *)&v41 setDeviceOps:v36];
  }
  return v13;
}

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 inferenceOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithDevice:v12 descriptor:v11 weights:v10 inferenceOnly:v6];

  return v13;
}

@end