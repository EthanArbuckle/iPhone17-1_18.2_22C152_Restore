@interface _MLCCPUEmbedding
+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 inferenceOnly:(BOOL)a6;
- (_MLCCPUEmbedding)initWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 inferenceOnly:(BOOL)a6;
@end

@implementation _MLCCPUEmbedding

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 inferenceOnly:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithDevice:v12 descriptor:v11 weights:v10 inferenceOnly:v6];

  return v13;
}

- (_MLCCPUEmbedding)initWithDevice:(id)a3 descriptor:(id)a4 weights:(id)a5 inferenceOnly:(BOOL)a6
{
  v53[2] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void *)MEMORY[0x1E4F1CBF0];
  v14 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v15 = (void *)[v13 mutableCopy];
  if (a6)
  {
    id v16 = 0;
    v17 = 0;
  }
  else
  {
    BOOL v44 = a6;
    id v45 = v10;
    v47 = v14;
    memset(v52, 0, sizeof(v52));
    v18 = [v12 descriptor];
    v19 = [v18 shape];
    v20 = [v12 descriptor];
    v21 = [v20 stride];
    v22 = [v12 descriptor];
    BOOL v23 = CPU_BuildBNNSNDArrayDescriptorRowMajor((uint64_t)v52, v19, v21, 0, [v22 dataType], 2, 0);

    if (!v23)
    {
      v42 = 0;
      id v10 = v45;
      v14 = v47;
      goto LABEL_14;
    }
    v24 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v52 length:176];
    id v25 = [v12 data];
    uint64_t v26 = [v25 bytes];
    id v16 = v24;
    *(void *)([v16 bytes] + 136) = v26;

    uint64_t v49 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v52 length:176];
    for (uint64_t i = 0; i != 3; ++i)
    {
      v28 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v52 length:176];
      [v15 setObject:v28 atIndexedSubscript:i];
    }
    id v10 = v45;
    v14 = v47;
    a6 = v44;
    v17 = (void *)v49;
  }
  v50 = v17;
  v29 = +[MLCCPUDeviceOps deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:](MLCCPUDeviceOps, "deviceOpsWithType:params:inDeltaData:outDeltaData:weightsDeltaData:biasDeltaData:weightsMomentumData:biasMomentumData:", 47, v16, 0, 0, v15, 0);
  if (v29)
  {
    [v14 addObject:v29];
    v30 = [v11 paddingIndex];
    [v29 setPaddingIndex:v30];

    [v29 setEmbeddingParams:0];
    v31 = [v11 maximumNorm];

    if (v31)
    {
      v32 = [v11 maximumNorm];
      v53[0] = v32;
      [v11 pNorm];
      id v46 = v11;
      v48 = v14;
      id v33 = v12;
      v35 = id v34 = v10;
      v53[1] = v35;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
      id v36 = v16;
      v37 = self;
      v39 = BOOL v38 = a6;
      [v29 setEmbeddingParams:v39];

      a6 = v38;
      self = v37;
      id v16 = v36;

      id v10 = v34;
      id v12 = v33;
      id v11 = v46;
      v14 = v48;
    }
    objc_msgSend(v29, "setScaleGradientByFrequency:", objc_msgSend(v11, "scalesGradientByFrequency"));
    if (!a6)
    {
      v40 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
      [v29 setWeightsDeltaDataBytesArray:v40];
    }
  }
  v41 = (void *)[v14 copy];
  v51.receiver = self;
  v51.super_class = (Class)_MLCCPUEmbedding;
  self = [(_MLCCPULayer *)&v51 initWithDevice:v10 deviceOps:v41];

  v42 = self;
LABEL_14:

  return v42;
}

@end