@interface _MLCGPUArithmetic
+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6;
+ (id)layerWithDevice:(id)a3 operation:(int)a4 activationDescriptor:(id)a5;
- (_MLCGPUArithmetic)initWithDevice:(id)a3 operation:(int)a4 activationDescriptor:(id)a5;
@end

@implementation _MLCGPUArithmetic

- (_MLCGPUArithmetic)initWithDevice:(id)a3 operation:(int)a4 activationDescriptor:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_MLCGPUArithmetic;
  v10 = [(_MLCGPUArithmetic *)&v18 init];
  if (v10)
  {
    v11 = [v8 deviceList];
    uint64_t v12 = [v11 count];

    for (i = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy]; v12; --v12)
    {
      v14 = +[MLCGPUDeviceOps deviceOps];
      if (v14)
      {
        [v14 setLayer:objc_opt_class()];
        [v14 setArithmeticOp:v6];
        [v14 setNeuronDescriptor:v9];
        [i addObject:v14];
      }
    }
    v15 = (void *)[i copy];
    v17.receiver = v10;
    v17.super_class = (Class)_MLCGPUArithmetic;
    [(_MLCGPULayer *)&v17 setDeviceOps:v15];
  }
  return v10;
}

+ (BOOL)compileWithDevice:(id)a3 deviceOps:(id)a4 sourceTensors:(id)a5 resultTensor:(id)a6
{
  id v54 = a3;
  id v52 = a4;
  id v9 = a5;
  id v10 = a6;
  v11 = [v9 objectAtIndexedSubscript:0];
  uint64_t v12 = [v11 descriptor];
  v13 = [v12 shape];
  unint64_t v14 = [v13 count];

  if ((unint64_t)[v9 count] >= 2)
  {
    v15 = [v9 objectAtIndexedSubscript:1];
    v16 = [v15 descriptor];
    objc_super v17 = [v16 shape];
    unint64_t v18 = [v17 count];

    if (v18 > v14)
    {
      v19 = [v9 objectAtIndexedSubscript:1];
      v20 = [v19 descriptor];
      v21 = [v20 shape];
      unint64_t v14 = [v21 count];
    }
  }
  v22 = objc_msgSend(v54, "deviceList", v52);
  uint64_t v23 = [v22 count];

  if (v23)
  {
    unint64_t v24 = 0;
    do
    {
      v25 = [v53 objectAtIndexedSubscript:v24];
      if ([v25 arithmeticOp] > 1)
      {
        [v25 setSourceOfForwardNeededForGradient:1];
      }
      else
      {
        v26 = [v25 neuronDescriptor];
        [v25 setSourceOfForwardNeededForGradient:v26 != 0];

        [v25 setResultOfForwardNeededForGradient:0];
      }
      if (![v25 arithmeticOp] || objc_msgSend(v25, "arithmeticOp") == 1)
      {
        v27 = [v9 objectAtIndexedSubscript:0];
        int v28 = [v10 doesShapeMatchWithTensor:v27];

        if (v28) {
          [v25 setUseSourceGradientDeviceMemoryForResultGradientTensor:1];
        }
      }
      if (![v25 arithmeticOp])
      {
        v29 = [v9 objectAtIndexedSubscript:1];
        int v30 = [v10 doesShapeMatchWithTensor:v29];

        if (v30) {
          [v25 setUseSourceGradientDeviceMemoryForSecondaryResultGradientTensor:1];
        }
      }
      if ((unint64_t)[v9 count] >= 2)
      {
        v31 = [v9 objectAtIndexedSubscript:0];
        v32 = [v31 descriptor];
        v33 = (void *)[v32 newShapeWithCount:v14];
        [v25 setSource0Shape:v33];

        v34 = [v9 objectAtIndexedSubscript:1];
        v35 = [v34 descriptor];
        v36 = (void *)[v35 newShapeWithCount:v14];
        [v25 setSource1Shape:v36];

        if ([v9 count] == 3)
        {
          v37 = [v9 objectAtIndexedSubscript:2];
          v38 = [v37 descriptor];
          v39 = [v10 descriptor];
          v40 = [v39 shape];
          v41 = objc_msgSend(v38, "newShapeWithCount:", objc_msgSend(v40, "count"));
          [v25 setSource2Shape:v41];
        }
      }
      v42 = [v9 objectAtIndexedSubscript:0];
      objc_msgSend(v25, "setConstantArithmeticSourcesFlags:", (objc_msgSend(v42, "computeFlags") >> 1) & 1);

      if ([v9 count] == 2)
      {
        v43 = [v9 objectAtIndexedSubscript:1];
        objc_msgSend(v25, "setConstantArithmeticSourcesFlags:", objc_msgSend(v25, "constantArithmeticSourcesFlags") | objc_msgSend(v43, "computeFlags") & 2);

        v44 = [v9 objectAtIndexedSubscript:0];
        v45 = [v9 objectAtIndexedSubscript:1];
        if (v44 == v45)
        {
          v46 = [v9 objectAtIndexedSubscript:0];
          v47 = [v46 parentLayers];
          uint64_t v48 = [v47 count];

          if (v48) {
            objc_msgSend(v25, "setConstantArithmeticSourcesFlags:", objc_msgSend(v25, "constantArithmeticSourcesFlags") | 4);
          }
        }
        else
        {
        }
      }

      ++v24;
      v49 = [v54 deviceList];
      unint64_t v50 = [v49 count];
    }
    while (v24 < v50);
  }

  return 1;
}

+ (id)layerWithDevice:(id)a3 operation:(int)a4 activationDescriptor:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithDevice:v9 operation:v5 activationDescriptor:v8];

  return v10;
}

@end