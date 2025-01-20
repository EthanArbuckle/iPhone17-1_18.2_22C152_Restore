@interface _MLCCPUSlice
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 begin:(id)a4 end:(id)a5 stride:(id)a6;
- (_MLCCPUSlice)initWithDevice:(id)a3 begin:(id)a4 end:(id)a5 stride:(id)a6;
@end

@implementation _MLCCPUSlice

+ (id)layerWithDevice:(id)a3 begin:(id)a4 end:(id)a5 stride:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = (void *)[objc_alloc((Class)a1) initWithDevice:v13 begin:v12 end:v11 stride:v10];

  return v14;
}

- (_MLCCPUSlice)initWithDevice:(id)a3 begin:(id)a4 end:(id)a5 stride:(id)a6
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)MEMORY[0x1E4F1CBF0];
  id v13 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  v14 = (void *)[v12 mutableCopy];
  if ([v9 count])
  {
    unint64_t v15 = 0;
    do
    {
      v16 = [v11 objectAtIndexedSubscript:v15];
      uint64_t v17 = [v16 integerValue];
      v18 = v14;
      v19 = v13;
      id v20 = v11;
      if (v17 >= 0) {
        unint64_t v21 = v17;
      }
      else {
        unint64_t v21 = -v17;
      }

      v22 = [v10 objectAtIndexedSubscript:v15];
      uint64_t v23 = [v22 unsignedIntegerValue];
      v24 = [v9 objectAtIndexedSubscript:v15];
      unint64_t v25 = (v23 + ~[v24 unsignedIntegerValue]) / v21;

      unint64_t v26 = v25 + 1;
      id v11 = v20;
      id v13 = v19;
      v14 = v18;
      v27 = [NSNumber numberWithUnsignedInteger:v26];
      [v18 addObject:v27];

      v28 = NSNumber;
      v29 = [v9 objectAtIndexedSubscript:v15];
      v30 = objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v29, "unsignedIntegerValue"));
      [v13 addObject:v30];

      ++v15;
    }
    while (v15 < [v9 count]);
  }
  v41 = v10;
  v31 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  memset(v45, 0, sizeof(v45));
  uint64_t v32 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v45 length:176];
  v33 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v45 length:176];
  v40 = (void *)v32;
  v47[0] = v32;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:1];
  v46 = v33;
  v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
  v36 = +[MLCSliceCPUDeviceOps deviceOpsWithType:48 params:0 inDeltaData:v34 outDeltaData:v35 weightsDeltaData:0 biasDeltaData:0 weightsMomentumData:0 biasMomentumData:0];

  if (v36)
  {
    [v36 setBegin:v13];
    [v36 setCount:v14];
    [v36 setStride:v11];
    [v31 addObject:v36];
  }
  v37 = (void *)[v31 copy];
  v44.receiver = self;
  v44.super_class = (Class)_MLCCPUSlice;
  v38 = [(_MLCCPULayer *)&v44 initWithDevice:v43 deviceOps:v37];

  return v38;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = [a4 objectAtIndexedSubscript:0];
  id v11 = [v10 inDeltaData];
  id v12 = [v11 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 bytes];

  v66 = v10;
  v14 = [v10 outDeltaData];
  id v15 = [v14 objectAtIndexedSubscript:0];
  uint64_t v16 = [v15 bytes];

  uint64_t v17 = [MEMORY[0x1E4F1CBF0] mutableCopy];
  v18 = [v9 descriptor];
  uint64_t v19 = [v18 dimensionCount];

  uint64_t v62 = v13;
  v63 = v8;
  uint64_t v61 = v16;
  v64 = v9;
  v65 = (void *)v17;
  if (v19)
  {
    unint64_t v20 = 0;
    uint64_t v21 = 0;
    do
    {
      v22 = NSNumber;
      uint64_t v23 = [v8 objectAtIndexedSubscript:0];
      v24 = [v23 descriptor];
      unint64_t v25 = [v24 stride];
      unint64_t v26 = [v25 objectAtIndexedSubscript:v20];
      uint64_t v27 = [v26 unsignedIntegerValue];
      v28 = [v66 stride];
      v29 = [v28 objectAtIndexedSubscript:v20];
      v30 = objc_msgSend(v22, "numberWithUnsignedInteger:", objc_msgSend(v29, "unsignedIntegerValue") * v27);
      [v65 addObject:v30];

      id v8 = v63;
      v31 = [v63 objectAtIndexedSubscript:0];
      uint64_t v32 = [v31 descriptor];
      v33 = [v32 stride];
      v34 = [v33 objectAtIndexedSubscript:v20];
      uint64_t v35 = [v34 unsignedIntegerValue];
      v36 = [v66 begin];
      v37 = [v36 objectAtIndexedSubscript:v20];
      v21 += [v37 unsignedIntegerValue] * v35;

      ++v20;
      v38 = [v64 descriptor];
      unint64_t v39 = [v38 dimensionCount];
    }
    while (v20 < v39);
  }
  else
  {
    uint64_t v21 = 0;
  }
  v40 = v66;
  [v66 setBeginOffset:v21];
  [v66 setStride:v65];
  v41 = [v66 count];
  v42 = [v8 objectAtIndexedSubscript:0];
  id v43 = [v42 descriptor];
  int v44 = [v43 dataType];
  v45 = [v8 objectAtIndexedSubscript:0];
  v46 = [v45 descriptor];
  LOBYTE(v44) = CPU_BuildBNNSNDArrayDescriptorRowMajor(v62, v41, v65, 0, v44, [v46 dimensionCount], 0);

  v47 = v65;
  if (v44)
  {
    v48 = v64;
    v49 = [v64 descriptor];
    v50 = [v49 shape];
    v51 = [v64 descriptor];
    v52 = [v51 stride];
    v53 = [v64 descriptor];
    int v54 = [v53 dataType];
    v55 = [v64 descriptor];
    BOOL v56 = CPU_BuildBNNSNDArrayDescriptorRowMajor(v61, v50, v52, 0, v54, [v55 dimensionCount], 0);

    v57 = v63;
    if (v56)
    {
      objc_opt_class();
      v58 = objc_opt_new();
      v40 = v66;
      [v66 setLayer:v58];

      BOOL v59 = 1;
    }
    else
    {
      BOOL v59 = 0;
      v40 = v66;
    }
    v47 = v65;
  }
  else
  {
    BOOL v59 = 0;
    v57 = v63;
    v48 = v64;
  }

  return v59;
}

@end