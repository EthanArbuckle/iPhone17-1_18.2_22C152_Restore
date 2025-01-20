@interface _MLCGPUCompare
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 operation:(int)a4;
- (_MLCGPUCompare)initWithDevice:(id)a3 operation:(int)a4;
@end

@implementation _MLCGPUCompare

- (_MLCGPUCompare)initWithDevice:(id)a3 operation:(int)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_MLCGPUCompare;
  v8 = [(_MLCGPUCompare *)&v22 init];
  if (v8)
  {
    v9 = [v7 deviceList];
    uint64_t v10 = [v9 count];

    v11 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    if (v10)
    {
      uint64_t v13 = 0;
      *(void *)&long long v12 = 138412546;
      long long v20 = v12;
      do
      {
        if ((a4 - 6) < 6)
        {
          v14 = [v7 gpuPipelineStatesCompareLogicalOpForward];
        }
        else
        {
          if (a4 > 5)
          {
            v16 = +[MLCLog framework];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v17 = NSStringFromSelector(a2);
              *(_DWORD *)buf = v20;
              v24 = v17;
              __int16 v25 = 1024;
              int v26 = a4;
              _os_log_error_impl(&dword_1DD0C9000, v16, OS_LOG_TYPE_ERROR, "%@: unknown comparison type = %d", buf, 0x12u);
              goto LABEL_11;
            }
LABEL_12:

            goto LABEL_13;
          }
          v14 = [v7 gpuPipelineStatesCompareRelationalOpForward];
        }
        v15 = v14;
        v16 = objc_msgSend(v14, "objectAtIndexedSubscript:", v13, v20);

        if (v16)
        {
          v17 = +[MLCGPUDeviceOps deviceOpsWithForwardKernel:v16];
          [v17 setSourceOfForwardNeededForGradient:0];
          [v17 setResultOfForwardNeededForGradient:0];
          if (v17)
          {
            [v17 setLayer:objc_opt_class()];
            [v11 addObject:v17];
          }
LABEL_11:

          goto LABEL_12;
        }
LABEL_13:
        ++v13;
      }
      while (v10 != v13);
    }
    v18 = objc_msgSend(v11, "copy", v20);
    v21.receiver = v8;
    v21.super_class = (Class)_MLCGPUCompare;
    [(_MLCGPULayer *)&v21 setDeviceOps:v18];
  }
  return v8;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v67 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  v71 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  uint64_t v69 = [v10 mutableCopy];
  uint64_t v11 = [v9 count];
  long long v12 = [v9 objectAtIndexedSubscript:0];
  uint64_t v13 = [v12 descriptor];
  v14 = [v13 shape];
  v15 = v14;
  if (v11 != 2)
  {
    v32 = (void *)[v14 copy];
LABEL_17:

LABEL_18:
    v49 = (void *)v69;
    goto LABEL_19;
  }
  unint64_t v16 = [v14 count];

  v17 = [v9 objectAtIndexedSubscript:1];
  v18 = [v17 descriptor];
  v19 = [v18 shape];
  unint64_t v20 = [v19 count];

  if (v20 > v16)
  {
    objc_super v21 = [v9 objectAtIndexedSubscript:1];
    objc_super v22 = [v21 descriptor];
    v23 = [v22 shape];
    unint64_t v16 = [v23 count];
  }
  v24 = [v9 objectAtIndexedSubscript:0];
  __int16 v25 = [v24 descriptor];
  int v26 = [v25 shape];
  uint64_t v27 = [v26 count];

  v28 = [v9 objectAtIndexedSubscript:0];
  v29 = [v28 descriptor];
  v30 = [v29 shape];
  v31 = v30;
  unint64_t v70 = v16;
  if (v16 == v27)
  {
    v32 = (void *)[v30 copy];
  }
  else
  {
    uint64_t v33 = [v30 count];

    if (v16)
    {
      unint64_t v34 = v16;
      id v65 = v8;
      unint64_t v35 = 0;
      unint64_t v36 = v16 - v33;
      unint64_t v68 = v33 - v16;
      do
      {
        if (v35 >= v36)
        {
          v38 = [v9 objectAtIndexedSubscript:0];
          v39 = [v38 descriptor];
          v40 = [v39 shape];
          v41 = [v40 objectAtIndexedSubscript:v68 + v35];
          uint64_t v37 = [v41 unsignedIntegerValue];

          unint64_t v34 = v70;
        }
        else
        {
          uint64_t v37 = 1;
        }
        v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v37, v65);
        [v71 setObject:v42 atIndexedSubscript:v35];

        ++v35;
      }
      while (v34 != v35);
      v32 = v71;
      id v8 = v65;
    }
    else
    {
      v32 = v71;
    }
  }
  v43 = [v9 objectAtIndexedSubscript:1];
  v44 = [v43 descriptor];
  v45 = [v44 shape];
  uint64_t v46 = [v45 count];

  long long v12 = [v9 objectAtIndexedSubscript:1];
  uint64_t v13 = [v12 descriptor];
  v47 = [v13 shape];
  v15 = v47;
  unint64_t v48 = v70;
  if (v70 == v46)
  {
    v71 = (void *)v69;
    uint64_t v69 = [v47 copy];
    goto LABEL_17;
  }
  uint64_t v57 = [v47 count];

  if (!v70) {
    goto LABEL_18;
  }
  id v66 = v8;
  unint64_t v58 = 0;
  v49 = (void *)v69;
  do
  {
    if (v58 >= v70 - v57)
    {
      v60 = [v9 objectAtIndexedSubscript:1];
      v61 = [v60 descriptor];
      v62 = [v61 shape];
      v63 = [v62 objectAtIndexedSubscript:v57 - v70 + v58];
      uint64_t v59 = [v63 unsignedIntegerValue];

      unint64_t v48 = v70;
      v49 = (void *)v69;
    }
    else
    {
      uint64_t v59 = 1;
    }
    v64 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v59, v66);
    [v49 setObject:v64 atIndexedSubscript:v58];

    ++v58;
  }
  while (v48 != v58);
  id v8 = v66;
LABEL_19:
  v50 = [v67 deviceList];
  uint64_t v51 = [v50 count];

  if (v51)
  {
    unint64_t v52 = 0;
    do
    {
      v53 = [v8 objectAtIndexedSubscript:v52];
      [v53 setSource0Shape:v32];
      if ([v9 count] == 2) {
        [v53 setSource1Shape:v49];
      }

      ++v52;
      v54 = [v67 deviceList];
      unint64_t v55 = [v54 count];
    }
    while (v52 < v55);
  }

  return 1;
}

+ (id)layerWithDevice:(id)a3 operation:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithDevice:v6 operation:v4];

  return v7;
}

@end