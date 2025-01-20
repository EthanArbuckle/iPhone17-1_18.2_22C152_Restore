@interface _MLCCPUDropout
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5;
- (_MLCCPUDropout)initWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5;
@end

@implementation _MLCCPUDropout

- (_MLCCPUDropout)initWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5
{
  int v5 = a5;
  v27[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v25 = 0;
  memset(v22, 0, sizeof(v22));
  float v23 = a4;
  int v24 = v5;
  v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v22 length:368];
  memset(v21, 0, sizeof(v21));
  memset(v20, 0, sizeof(v20));
  v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v21 length:176];
  v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v20 length:176];
  v27[0] = v11;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v26 = v12;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v15 = +[MLCCPUDeviceOps deviceOpsWithType:8 params:v10 inDeltaData:v13 outDeltaData:v14 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

  if (v15) {
    [v9 addObject:v15];
  }
  v16 = (void *)[v9 copy];
  v19.receiver = self;
  v19.super_class = (Class)_MLCCPUDropout;
  v17 = [(_MLCCPULayer *)&v19 initWithDevice:v8 deviceOps:v16];

  return v17;
}

+ (id)layerWithDevice:(id)a3 rate:(float)a4 seed:(unint64_t)a5
{
  id v8 = a3;
  id v9 = objc_alloc((Class)a1);
  *(float *)&double v10 = a4;
  v11 = (void *)[v9 initWithDevice:v8 rate:a5 seed:v10];

  return v11;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8 = a5;
  id v32 = a6;
  v31 = [a4 objectAtIndexedSubscript:0];
  id v33 = [v31 params];
  uint64_t v9 = [v33 bytes];
  double v10 = [v8 objectAtIndexedSubscript:0];
  v11 = [v10 descriptor];
  v12 = [v11 shape];
  v13 = [v8 objectAtIndexedSubscript:0];
  v14 = [v13 descriptor];
  v15 = [v14 stride];
  v16 = [v8 objectAtIndexedSubscript:0];
  v17 = [v16 descriptor];
  uint64_t v30 = v9;
  LODWORD(v9) = CPU_BuildBNNSNDArrayDescriptor(v9, v12, v15, 0, [v17 dataType], 1, 0);

  BOOL v18 = 0;
  if (v9)
  {
    objc_super v19 = [v32 descriptor];
    v20 = [v19 shape];
    v21 = [v32 descriptor];
    v22 = [v21 stride];
    float v23 = [v32 descriptor];
    int v24 = CPU_BuildBNNSNDArrayDescriptor(v30 + 176, v20, v22, 0, [v23 dataType], 1, 0);

    BOOL v18 = 0;
    if (v24)
    {
      memset(v34, 0, sizeof(v34));
      LODWORD(v34[0]) = 1;
      uint64_t v25 = MEMORY[0x1E01B0CF0](v30, v34);
      if (v25)
      {
        v26 = [v8 objectAtIndexedSubscript:0];
        [v31 setSourceStride:CPU_SetBatchStride(v26)];

        [v31 setResultStride:CPU_SetBatchStride(v32)];
      }
      objc_opt_class();
      v27 = objc_opt_new();
      [v31 setLayer:v27];

      v28 = [v31 layer];
      [v28 setFilter:v25];

      BOOL v18 = 1;
    }
  }

  return v18;
}

@end