@interface MLCReshapeLayer
+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4;
+ (MLCReshapeLayer)layerWithShape:(NSArray *)shape;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isStaticBatchSize;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCReshapeLayer)initWithShape:(id)a3;
- (NSArray)shape;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)deviceMemorySizeForForward;
- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
@end

@implementation MLCReshapeLayer

+ (MLCReshapeLayer)layerWithShape:(NSArray *)shape
{
  v4 = shape;
  v5 = (void *)[objc_alloc((Class)a1) initWithShape:v4];

  return (MLCReshapeLayer *)v5;
}

- (MLCReshapeLayer)initWithShape:(id)a3
{
  id v6 = a3;
  if ([v6 count])
  {
    unsigned int v7 = 0;
    unint64_t v8 = 0;
    do
    {
      v9 = [v6 objectAtIndexedSubscript:v8];
      int v10 = [v9 intValue];

      if (v10 == -1) {
        ++v7;
      }
      ++v8;
    }
    while (v8 < [v6 count]);
    if (v7 > 1)
    {
      v11 = +[MLCLog framework];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[MLCReshapeLayer initWithShape:](a2);
      }
LABEL_12:

      v13 = 0;
      goto LABEL_16;
    }
  }
  unint64_t v12 = [v6 count];
  if (v12 > +[MLCTensorDescriptor maxTensorDimensions])
  {
    v11 = +[MLCLog framework];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MLCReshapeLayer initWithShape:](a2);
    }
    goto LABEL_12;
  }
  v17.receiver = self;
  v17.super_class = (Class)MLCReshapeLayer;
  v14 = [(MLCLayer *)&v17 initWithLabel:@"Reshape"];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_shape, a3);
  }
  self = v15;
  v13 = self;
LABEL_16:

  return v13;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 count] != 1)
  {
    v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MLCReshapeLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_13;
  }
  unint64_t v12 = [v10 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  uint64_t v14 = [v13 tensorAllocationSizeInBytes];
  v15 = [v11 descriptor];
  uint64_t v16 = [v15 tensorAllocationSizeInBytes];

  if (v14 != v16)
  {
    v19 = +[MLCLog framework];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v22 = NSStringFromSelector(a2);
      v23 = [v10 objectAtIndexedSubscript:0];
      v24 = [v23 descriptor];
      uint64_t v25 = [v24 tensorAllocationSizeInBytes];
      v26 = [v11 descriptor];
      *(_DWORD *)buf = 138412802;
      v31 = v22;
      __int16 v32 = 2048;
      uint64_t v33 = v25;
      __int16 v34 = 2048;
      uint64_t v35 = [v26 tensorAllocationSizeInBytes];
      _os_log_error_impl(&dword_1DD0C9000, v19, OS_LOG_TYPE_ERROR, "%@: invalid result tensor size. sourceSize=%lu : resultSize=%lu", buf, 0x20u);
    }
    goto LABEL_13;
  }
  objc_super v17 = [v9 computeEngine];
  v18 = [(MLCReshapeLayer *)self shape];
  v19 = [v17 reshapeLayerWithShape:v18];

  if (!v19 || ![v19 count])
  {
    v27 = +[MLCLog framework];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v19, v27);
    }

LABEL_13:
    char v21 = 0;
    goto LABEL_14;
  }
  v20 = [v9 computeEngine];
  char v21 = [v20 compileLayerDeviceOps:v19 sourceTensors:v10 resultTensor:v11];

  v29.receiver = self;
  v29.super_class = (Class)MLCReshapeLayer;
  [(MLCLayer *)&v29 bindDevice:v9 deviceOps:v19];
LABEL_14:

  return v21;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  unsigned int v7 = [(MLCReshapeLayer *)self shape];
  unint64_t v8 = [v7 count];

  if (v8 <= a4) {
    return 1;
  }
  id v9 = [(MLCReshapeLayer *)self shape];
  id v10 = [v9 objectAtIndexedSubscript:a4];
  uint64_t v11 = [v10 integerValue];

  unint64_t v12 = [(MLCReshapeLayer *)self shape];
  v13 = v12;
  if (v11 == -1)
  {
    uint64_t v17 = [v12 count];

    if (v17)
    {
      unint64_t v18 = 0;
      unint64_t v19 = 1;
      do
      {
        if (a4 != v18)
        {
          v20 = [(MLCReshapeLayer *)self shape];
          char v21 = [v20 objectAtIndexedSubscript:v18];
          v19 *= [v21 unsignedIntegerValue];
        }
        ++v18;
        v22 = [(MLCReshapeLayer *)self shape];
        unint64_t v23 = [v22 count];
      }
      while (v18 < v23);
    }
    else
    {
      unint64_t v19 = 1;
    }
    return a3 / v19;
  }
  else
  {
    uint64_t v14 = [v12 objectAtIndexedSubscript:a4];
    unint64_t v15 = [v14 unsignedIntegerValue];

    return v15;
  }
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v6 = [v4 objectAtIndexedSubscript:0];
  unsigned int v7 = [v6 descriptor];
  uint64_t v8 = [v7 dimensionCount];

  if (v8)
  {
    unint64_t v9 = 0;
    uint64_t v10 = 1;
    do
    {
      uint64_t v11 = [v4 objectAtIndexedSubscript:0];
      unint64_t v12 = [v11 descriptor];
      v13 = [v12 shape];
      uint64_t v14 = [v13 objectAtIndexedSubscript:v9];
      v10 *= [v14 unsignedIntegerValue];

      ++v9;
      unint64_t v15 = [v4 objectAtIndexedSubscript:0];
      uint64_t v16 = [v15 descriptor];
      unint64_t v17 = [v16 dimensionCount];
    }
    while (v9 < v17);
  }
  else
  {
    uint64_t v10 = 1;
  }
  unint64_t v18 = [(MLCReshapeLayer *)self shape];
  uint64_t v19 = [v18 count];

  if (v19)
  {
    unint64_t v20 = 0;
    do
    {
      unint64_t v21 = [(MLCReshapeLayer *)self resultSizeFromSourceSize:v10 dimension:v20];
      v22 = [NSNumber numberWithUnsignedInteger:v21];
      [v5 setObject:v22 atIndexedSubscript:v20];

      ++v20;
      unint64_t v23 = [(MLCReshapeLayer *)self shape];
      unint64_t v24 = [v23 count];
    }
    while (v20 < v24);
  }
  uint64_t v25 = (void *)[v5 copy];
  v26 = [v4 objectAtIndexedSubscript:0];
  v27 = [v26 descriptor];
  v28 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v25, [v27 dataType]);

  objc_super v29 = +[MLCTensor tensorWithDescriptor:v28];

  return v29;
}

- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4
{
  return 0;
}

- (unint64_t)deviceMemorySizeForForward
{
  return 0;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (BOOL)isStaticBatchSize
{
  uint64_t v14 = [(MLCLayer *)self sourceTensors];
  v3 = [v14 objectAtIndexedSubscript:0];
  id v4 = [v3 descriptor];
  v5 = [v4 shape];
  id v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 unsignedIntegerValue];
  uint64_t v8 = [(MLCLayer *)self resultTensors];
  unint64_t v9 = [v8 objectAtIndexedSubscript:0];
  uint64_t v10 = [v9 descriptor];
  uint64_t v11 = [v10 shape];
  unint64_t v12 = [v11 objectAtIndexedSubscript:0];
  LOBYTE(v7) = v7 == [v12 unsignedIntegerValue];

  return v7;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(MLCReshapeLayer *)self shape];
  uint64_t v7 = [(MLCLayer *)self conditionalTreeNode];
  uint64_t v8 = [(MLCLayer *)self resultTensors];
  unint64_t v9 = [v3 stringWithFormat:@"%@: { shape=%@ : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8];

  return v9;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  uint64_t v7 = [(MLCReshapeLayer *)self shape];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Shape: %@</FONT>>", v5, v6, v7];

  return v8;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void).cxx_destruct
{
}

- (void)initWithShape:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: shape dimensions exceed max tensor dimensions currently supported", v4, v5, v6, v7, v8);
}

- (void)initWithShape:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: invalid shape, more than one dimension with '-1' ", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: invalid source tensors count ", v4, v5, v6, v7, v8);
}

@end