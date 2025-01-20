@interface MLCArithmeticLayer
+ (MLCArithmeticLayer)layerWithOperation:(MLCArithmeticOperation)operation;
- (BOOL)binaryOperation;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (BOOL)skipGradientComputationForSourceTensor:(id)a3 resultTensor:(id)a4;
- (MLCArithmeticLayer)initWithArithmeticOperation:(int)a3;
- (MLCArithmeticOperation)operation;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4;
@end

@implementation MLCArithmeticLayer

- (BOOL)skipGradientComputationForSourceTensor:(id)a3 resultTensor:(id)a4
{
  id v30 = a3;
  id v6 = a4;
  if ([(MLCArithmeticLayer *)self operation]
    && [(MLCArithmeticLayer *)self operation] != MLCArithmeticOperationSubtract)
  {
    goto LABEL_9;
  }
  v7 = [v6 descriptor];
  v8 = [v7 shape];
  uint64_t v9 = [v8 count];
  v10 = [v30 descriptor];
  v11 = [v10 shape];
  uint64_t v12 = [v11 count];

  if (v9 == v12)
  {
    v13 = [v6 descriptor];
    v14 = [v13 shape];
    uint64_t v15 = [v14 count];

    if (v15)
    {
      unint64_t v16 = 0;
      do
      {
        v17 = [v6 descriptor];
        v18 = [v17 shape];
        v19 = [v18 objectAtIndexedSubscript:v16];
        uint64_t v20 = [v19 unsignedIntegerValue];
        v21 = [v30 descriptor];
        v22 = [v21 shape];
        v23 = [v22 objectAtIndexedSubscript:v16];
        uint64_t v24 = [v23 unsignedIntegerValue];

        BOOL v25 = v20 == v24;
        if (v20 != v24) {
          break;
        }
        ++v16;
        v26 = [v6 descriptor];
        v27 = [v26 shape];
        unint64_t v28 = [v27 count];
      }
      while (v16 < v28);
    }
    else
    {
      BOOL v25 = 1;
    }
  }
  else
  {
LABEL_9:
    BOOL v25 = 0;
  }

  return v25;
}

+ (MLCArithmeticLayer)layerWithOperation:(MLCArithmeticOperation)operation
{
  v3 = (void *)[objc_alloc((Class)a1) initWithArithmeticOperation:*(void *)&operation];

  return (MLCArithmeticLayer *)v3;
}

- (MLCArithmeticLayer)initWithArithmeticOperation:(int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MLCArithmeticLayer;
  result = [(MLCLayer *)&v6 initWithLabel:@"Arithmetic"];
  if (result)
  {
    result->_operation = a3;
    if (a3 > 0x1D || (BOOL v5 = 1, ((1 << a3) & 0x3C20000F) == 0)) {
      BOOL v5 = 0;
    }
    result->_binaryOperation = v5;
  }
  return result;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 count];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    while (1)
    {
      v14 = [v9 objectAtIndexedSubscript:v13];
      uint64_t v15 = [v14 descriptor];
      uint64_t v16 = [v15 dataType];

      if (!+[MLCLayer supportsDataType:v16 onDevice:v8])break; {
      if (v12 == ++v13)
      }
        goto LABEL_5;
    }
    v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v45 = v19;
      __int16 v46 = 2048;
      uint64_t v47 = v13;
      __int16 v48 = 1024;
      int v49 = v16;
      __int16 v50 = 2112;
      id v51 = v8;
      _os_log_error_impl(&dword_1DD0C9000, v18, OS_LOG_TYPE_ERROR, "%@: sourceTensor[%lu] uses unsupported data type = %d on a device = %@", buf, 0x26u);
    }
    goto LABEL_15;
  }
LABEL_5:
  MLCArithmeticOperation v17 = [(MLCArithmeticLayer *)self operation];
  if (v17 > MLCArithmeticOperationMax)
  {
    v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLCArithmeticLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_15;
  }
  if (((1 << v17) & 0x3DFFFF0) != 0)
  {
    if ([v9 count] != 1)
    {
      v18 = +[MLCLog framework];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[MLCArithmeticLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
      }
LABEL_15:
      char v20 = 0;
      goto LABEL_31;
    }
  }
  else if ((unint64_t)[v9 count] <= 1)
  {
    v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLCArithmeticLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_15;
  }
  v21 = [(MLCLayer *)self fusedLayers];
  v22 = (void *)[v21 count];

  if (v22)
  {
    v23 = [(MLCLayer *)self fusedLayers];
    uint64_t v24 = [v23 objectAtIndexedSubscript:0];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    v26 = [(MLCLayer *)self fusedLayers];
    v27 = [v26 objectAtIndexedSubscript:0];

    if (isKindOfClass)
    {
      v22 = [v27 descriptor];
    }
    else
    {
      unint64_t v28 = [v8 computeEngine];
      v29 = objc_msgSend(v28, "arithmeticLayerWithOperation:activationDescriptor:", objc_msgSend(v27, "operation"), 0);

      id v30 = [v8 computeEngine];
      v31 = [(MLCLayer *)self fusedLayers];
      v32 = [v31 objectAtIndexedSubscript:0];
      v33 = [v32 sourceTensors];
      [v30 compileLayerDeviceOps:v29 sourceTensors:v33 resultTensor:v10];

      [v27 bindDevice:v8 deviceOps:v29];
      v22 = 0;
    }
  }
  v34 = [v8 computeEngine];
  v18 = objc_msgSend(v34, "arithmeticLayerWithOperation:activationDescriptor:", -[MLCArithmeticLayer operation](self, "operation"), v22);

  if (v18 && [v18 count])
  {
    v35 = [v8 computeEngine];
    char v20 = [v35 compileLayerDeviceOps:v18 sourceTensors:v9 resultTensor:v10];

    v43.receiver = self;
    v43.super_class = (Class)MLCArithmeticLayer;
    [(MLCLayer *)&v43 bindDevice:v8 deviceOps:v18];
    if ([v9 count] == 2)
    {
      v36 = [v9 objectAtIndexedSubscript:0];
      BOOL v37 = [(MLCArithmeticLayer *)self skipGradientComputationForSourceTensor:v36 resultTensor:v10];

      v38 = [v9 objectAtIndexedSubscript:1];
      BOOL v39 = [(MLCArithmeticLayer *)self skipGradientComputationForSourceTensor:v38 resultTensor:v10];

      if (v37 && v39) {
        [(MLCLayer *)self setAllocateGradientTensors:0];
      }
    }
  }
  else
  {
    v40 = +[MLCLog framework];
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v18, v40);
    }

    char v20 = 0;
  }

LABEL_31:
  return v20;
}

- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4
{
  id v5 = a4;
  objc_super v6 = [(MLCLayer *)self sourceTensors];
  v7 = [v6 objectAtIndexedSubscript:0];
  id v8 = [(MLCLayer *)self resultTensors];
  id v9 = [v8 objectAtIndexedSubscript:0];
  BOOL v10 = [(MLCArithmeticLayer *)self skipGradientComputationForSourceTensor:v7 resultTensor:v9];

  uint64_t v11 = [(MLCLayer *)self sourceTensors];
  uint64_t v12 = [v11 count];

  if (v12 == 2)
  {
    uint64_t v13 = [(MLCLayer *)self sourceTensors];
    v14 = [v13 objectAtIndexedSubscript:1];
    uint64_t v15 = [(MLCLayer *)self resultTensors];
    uint64_t v16 = [v15 objectAtIndexedSubscript:0];
    BOOL v17 = [(MLCArithmeticLayer *)self skipGradientComputationForSourceTensor:v14 resultTensor:v16];
  }
  else
  {
    BOOL v17 = 0;
  }
  v18 = [v5 computeEngine];
  v19 = [(MLCLayer *)self resultTensors];
  char v20 = [v19 objectAtIndexedSubscript:0];
  uint64_t v21 = [v18 deviceMemorySizeForTensor:v20];

  uint64_t v22 = 0;
  if ([(MLCLayer *)self isTrainable])
  {
    v23 = [(MLCLayer *)self intermediateGradientTensors];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      BOOL v25 = [(MLCLayer *)self intermediateGradientTensors];
      uint64_t v26 = [v25 count];

      if (v26)
      {
        unint64_t v27 = 0;
        uint64_t v22 = 0;
        do
        {
          unint64_t v28 = [v5 computeEngine];
          v29 = [(MLCLayer *)self intermediateGradientTensors];
          id v30 = [v29 objectAtIndexedSubscript:v27];
          v22 += [v28 deviceMemorySizeForTensor:v30];

          ++v27;
          v31 = [(MLCLayer *)self intermediateGradientTensors];
          unint64_t v32 = [v31 count];
        }
        while (v27 < v32);
      }
      else
      {
        uint64_t v22 = 0;
      }
    }
    else
    {
      v33 = [(MLCLayer *)self sourceGradientTensors];
      v34 = [v33 objectAtIndexedSubscript:0];
      v35 = [v34 sharedMemoryTensor];

      uint64_t v22 = 0;
      if (!v35)
      {
        v36 = [v5 computeEngine];
        BOOL v37 = [(MLCLayer *)self sourceGradientTensors];
        v38 = [v37 objectAtIndexedSubscript:0];
        uint64_t v22 = [v36 deviceMemorySizeForTensor:v38];
      }
    }
  }
  unint64_t v39 = v22 + v21;
  if ([(MLCLayer *)self isTrainable])
  {
    if ([v5 type])
    {
      if (v10)
      {
        v40 = [v5 computeEngine];
        v41 = [(MLCLayer *)self sourceGradientTensors];
        v42 = [v41 objectAtIndexedSubscript:0];
        v39 -= [v40 deviceMemorySizeForTensor:v42];
      }
      if (v17)
      {
        objc_super v43 = [v5 computeEngine];
        v44 = [(MLCLayer *)self sourceGradientTensors];
        v45 = [v44 objectAtIndexedSubscript:0];
        v39 -= [v43 deviceMemorySizeForTensor:v45];
LABEL_21:
      }
    }
    else if (v10 && v17)
    {
      __int16 v46 = [v5 computeEngine];
      uint64_t v47 = [(MLCLayer *)self sourceGradientTensors];
      __int16 v48 = [v47 objectAtIndexedSubscript:0];
      uint64_t v49 = [v46 deviceMemorySizeForTensor:v48];

      objc_super v43 = [v5 computeEngine];
      v44 = [(MLCLayer *)self sourceGradientTensors];
      v45 = [v44 objectAtIndexedSubscript:0];
      v39 -= v49 + [v43 deviceMemorySizeForTensor:v45];
      goto LABEL_21;
    }
  }

  return v39;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectAtIndexedSubscript:0];
  objc_super v6 = [v5 descriptor];
  v9.receiver = self;
  v9.super_class = (Class)MLCArithmeticLayer;
  v7 = -[MLCLayer resultTensorsFromBroadcastableSources:resultTensorDataType:](&v9, sel_resultTensorsFromBroadcastableSources_resultTensorDataType_, v4, [v6 dataType]);

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCArithmeticLayer *)self operation];
  v7 = [(MLCLayer *)self conditionalTreeNode];
  id v8 = [(MLCLayer *)self resultTensors];
  objc_super v9 = [v3 stringWithFormat:@"%@: { operation=%d : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8];

  return v9;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  v7 = MLCArithmeticOperationDebugDescription([(MLCArithmeticLayer *)self operation]);
  id v8 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Operation: %@<BR /></FONT>>", v5, v6, v7];

  return v8;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = 0;
    do
    {
      id v5 = [v3 objectAtIndexedSubscript:v4];
      NSUInteger v6 = [v5 descriptor];
      v7 = [v6 shape];
      unint64_t v8 = [v7 count];

      if (v8 > 1) {
        goto LABEL_10;
      }
    }
    while (++v4 < (unint64_t)[v3 count]);
  }
  if (![v3 count])
  {
LABEL_10:
    BOOL v14 = 1;
    goto LABEL_11;
  }
  unint64_t v9 = 0;
  do
  {
    BOOL v10 = [v3 objectAtIndexedSubscript:v9];
    uint64_t v11 = [v10 descriptor];
    uint64_t v12 = [v11 shape];
    uint64_t v13 = [v12 count];

    BOOL v14 = v13 == 1;
    if (v13 != 1) {
      break;
    }
    ++v9;
  }
  while (v9 < [v3 count]);
LABEL_11:

  return v14;
}

- (MLCArithmeticOperation)operation
{
  return self->_operation;
}

- (BOOL)binaryOperation
{
  return self->_binaryOperation;
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: invalid arithmetic operation", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: binary arithmetic operation needs two source tensors", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: unary arithmetic operation needs one source tensor", v4, v5, v6, v7, v8);
}

@end