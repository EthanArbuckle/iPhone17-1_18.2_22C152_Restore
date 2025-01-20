@interface _MLCCPUPooling
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 descriptor:(id)a4;
- (_MLCCPUPooling)initWithDevice:(id)a3 descriptor:(id)a4;
@end

@implementation _MLCCPUPooling

- (_MLCCPUPooling)initWithDevice:(id)a3 descriptor:(id)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  bzero(v23, 0x2A8uLL);
  int v9 = [v6 poolingType];
  switch(v9)
  {
    case 1:
      int v10 = 0;
      break;
    case 3:
      int v10 = 4;
      break;
    case 2:
      if ([v6 countIncludesPadding]) {
        int v10 = 1;
      }
      else {
        int v10 = 2;
      }
      break;
    default:
      goto LABEL_10;
  }
  int v24 = v10;
LABEL_10:
  uint64_t v25 = [v6 kernelWidth];
  uint64_t v26 = [v6 kernelHeight];
  uint64_t v27 = [v6 strideInX];
  uint64_t v28 = [v6 strideInY];
  uint64_t v29 = [v6 dilationRateInX];
  uint64_t v30 = [v6 dilationRateInY];
  if ([v6 paddingPolicy] == 2)
  {
    uint64_t v31 = [v6 paddingSizeInX];
    uint64_t v32 = [v6 paddingSizeInY];
  }
  v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:680];
  memset(v22, 0, sizeof(v22));
  memset(v21, 0, sizeof(v21));
  v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:176];
  v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v21 length:176];
  v34[0] = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  v33 = v13;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
  v16 = +[MLCCPUDeviceOps deviceOpsWithType:15 params:v11 inDeltaData:v14 outDeltaData:v15 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

  if (v16)
  {
    objc_msgSend(v16, "setPaddingPolicy:", objc_msgSend(v6, "paddingPolicy"));
    [v8 addObject:v16];
  }
  v17 = (void *)[v8 copy];
  v20.receiver = self;
  v20.super_class = (Class)_MLCCPUPooling;
  v18 = [(_MLCCPULayer *)&v20 initWithDevice:v7 deviceOps:v17];

  return v18;
}

+ (id)layerWithDevice:(id)a3 descriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithDevice:v7 descriptor:v6];

  return v8;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8 = a5;
  id v44 = a6;
  v43 = [a4 objectAtIndexedSubscript:0];
  id v45 = [v43 params];
  uint64_t v9 = [v45 bytes];
  v42 = [v8 objectAtIndexedSubscript:0];
  int v10 = [v42 descriptor];
  v11 = [v10 shape];
  v12 = [v8 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  v14 = [v13 stride];
  v15 = [v8 objectAtIndexedSubscript:0];
  v16 = [v15 descriptor];
  int v17 = CPU_BuildBNNSNDArrayDescriptor(v9, v11, v14, 0, [v16 dataType], 1, 0);

  BOOL v18 = 0;
  if (v17)
  {
    v19 = [v44 descriptor];
    objc_super v20 = [v19 shape];
    v21 = [v44 descriptor];
    v22 = [v21 stride];
    v23 = [v44 descriptor];
    int v24 = CPU_BuildBNNSNDArrayDescriptor(v9 + 176, v20, v22, 0, [v23 dataType], 1, 0);

    BOOL v18 = 0;
    if (v24)
    {
      if ([v43 paddingPolicy] != 2)
      {
        unint64_t v25 = *(void *)(v9 + 600);
        float v26 = (float)(v25 * *(void *)(v9 + 184));
        float v27 = (float)*(unint64_t *)(v9 + 8);
        if (*(_DWORD *)(v9 + 576))
        {
          float v28 = v26 - (float)((float)(v27 - (float)*(unint64_t *)(v9 + 584)) + (float)v25);
          if (v28 < 0.0) {
            float v28 = 0.0;
          }
          unint64_t v29 = (unint64_t)(float)(v28 * 0.5);
          *(void *)(v9 + 648) = v29;
          *(void *)(v9 + 656) = (unint64_t)(float)(v28 - (float)v29);
          unint64_t v30 = *(void *)(v9 + 608);
          unint64_t v31 = v30 * *(void *)(v9 + 192);
          uint64_t v32 = *(void *)(v9 + 592);
        }
        else
        {
          float v33 = v26
              - (float)((float)(v27
                              - (float)(unint64_t)((*(void *)(v9 + 584) - 1) * *(void *)(v9 + 616) + 1))
                      + (float)v25);
          if (v33 < 0.0) {
            float v33 = 0.0;
          }
          unint64_t v34 = (unint64_t)(float)(v33 * 0.5);
          *(void *)(v9 + 648) = v34;
          *(void *)(v9 + 656) = (unint64_t)(float)(v33 - (float)v34);
          unint64_t v30 = *(void *)(v9 + 608);
          unint64_t v31 = v30 * *(void *)(v9 + 192);
          uint64_t v32 = (*(void *)(v9 + 592) - 1) * *(void *)(v9 + 624) + 1;
        }
        float v35 = (float)v31
            - (float)((float)((float)*(unint64_t *)(v9 + 16) - (float)(unint64_t)v32) + (float)v30);
        if (v35 < 0.0) {
          float v35 = 0.0;
        }
        unint64_t v36 = (unint64_t)(float)(v35 * 0.5);
        *(void *)(v9 + 664) = v36;
        *(void *)(v9 + 672) = (unint64_t)(float)(v35 - (float)v36);
      }
      memset(v46, 0, sizeof(v46));
      LODWORD(v46[0]) = 1;
      uint64_t v37 = MEMORY[0x1E01B0D60](v9, v46);
      if (v37)
      {
        v38 = [v8 objectAtIndexedSubscript:0];
        [v43 setSourceStride:CPU_SetBatchStride(v38)];

        [v43 setResultStride:CPU_SetBatchStride(v44)];
      }
      objc_opt_class();
      v39 = objc_opt_new();
      [v43 setLayer:v39];

      v40 = [v43 layer];
      [v40 setFilter:v37];

      BOOL v18 = 1;
    }
  }

  return v18;
}

@end