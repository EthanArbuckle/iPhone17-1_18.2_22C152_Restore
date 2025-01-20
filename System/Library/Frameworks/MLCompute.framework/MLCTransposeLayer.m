@interface MLCTransposeLayer
+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4;
+ (MLCTransposeLayer)layerWithDimensions:(NSArray *)dimensions;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isStaticBatchSize;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCTransposeLayer)initWithDimensions:(id)a3;
- (NSArray)dimensions;
- (NSArray)shape;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
- (unint64_t)resultSizeFromSourceSizes:(id)a3 dimension:(unint64_t)a4;
@end

@implementation MLCTransposeLayer

+ (MLCTransposeLayer)layerWithDimensions:(NSArray *)dimensions
{
  v4 = dimensions;
  v5 = (void *)[objc_alloc((Class)a1) initWithDimensions:v4];

  return (MLCTransposeLayer *)v5;
}

- (MLCTransposeLayer)initWithDimensions:(id)a3
{
  id v5 = a3;
  if ((unint64_t)[v5 count] < 2)
  {
    v6 = +[MLCLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MLCTransposeLayer initWithDimensions:](a2);
    }

LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  if ([v5 count])
  {
    uint64_t v7 = 0;
    while (1)
    {
      v8 = [v5 objectAtIndexedSubscript:v7];
      unint64_t v9 = [v8 unsignedIntegerValue];
      unint64_t v10 = [v5 count] - 1;

      if (v9 > v10) {
        break;
      }
      if (++v7 >= (unint64_t)[v5 count]) {
        goto LABEL_9;
      }
    }
    v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCTransposeLayer initWithDimensions:](a2);
    }

    goto LABEL_15;
  }
LABEL_9:
  v17.receiver = self;
  v17.super_class = (Class)MLCTransposeLayer;
  v11 = [(MLCLayer *)&v17 initWithLabel:@"Transpose"];
  if (v11)
  {
    uint64_t v12 = [v5 copy];
    dimensions = v11->_dimensions;
    v11->_dimensions = (NSArray *)v12;
  }
  self = v11;
  v14 = self;
LABEL_16:

  return v14;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  if ([a4 type]) {
    return a3 == 1;
  }
  else {
    return ((a3 - 1) & 0xFFFFFFFD) == 0;
  }
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 count] != 1)
  {
    v22 = +[MLCLog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MLCTransposeLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_17;
  }
  uint64_t v12 = [v10 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  uint64_t v14 = [v13 tensorAllocationSizeInBytes];
  v15 = [v11 descriptor];
  uint64_t v16 = [v15 tensorAllocationSizeInBytes];

  if (v14 != v16)
  {
    v22 = +[MLCLog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v25 = NSStringFromSelector(a2);
      v26 = [v10 objectAtIndexedSubscript:0];
      v27 = [v26 descriptor];
      uint64_t v28 = [v27 tensorAllocationSizeInBytes];
      v29 = [v11 descriptor];
      *(_DWORD *)buf = 138412802;
      v34 = v25;
      __int16 v35 = 2048;
      *(void *)v36 = v28;
      *(_WORD *)&v36[8] = 2048;
      *(void *)&v36[10] = [v29 tensorAllocationSizeInBytes];
      _os_log_error_impl(&dword_1DD0C9000, v22, OS_LOG_TYPE_ERROR, "%@: invalid result tensor size. sourceSize=%lu : resultSize=%lu", buf, 0x20u);

LABEL_13:
    }
LABEL_17:
    char v24 = 0;
    goto LABEL_18;
  }
  objc_super v17 = [v10 objectAtIndexedSubscript:0];
  v18 = [v17 descriptor];
  uint64_t v19 = [v18 dataType];

  if (!+[MLCTransposeLayer supportsDataType:v19 onDevice:v9])
  {
    v22 = +[MLCLog framework];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v25 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v34 = v25;
      __int16 v35 = 1024;
      *(_DWORD *)v36 = v19;
      *(_WORD *)&v36[4] = 2112;
      *(void *)&v36[6] = v9;
      _os_log_error_impl(&dword_1DD0C9000, v22, OS_LOG_TYPE_ERROR, "%@: transpose layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);
      goto LABEL_13;
    }
    goto LABEL_17;
  }
  v20 = [v9 computeEngine];
  v21 = [(MLCTransposeLayer *)self dimensions];
  v22 = [v20 transposeLayerWithShape:v21];

  if (!v22 || ![v22 count])
  {
    v30 = +[MLCLog framework];
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[MLCGroupNormalizationLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }

    goto LABEL_17;
  }
  v23 = [v9 computeEngine];
  char v24 = [v23 compileLayerDeviceOps:v22 sourceTensors:v10 resultTensor:v11];

  v32.receiver = self;
  v32.super_class = (Class)MLCTransposeLayer;
  [(MLCLayer *)&v32 bindDevice:v9 deviceOps:v22];
LABEL_18:

  return v24;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  id v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCTransposeLayer resultSizeFromSourceSize:dimension:](a2);
  }

  return 0;
}

- (unint64_t)resultSizeFromSourceSizes:(id)a3 dimension:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(MLCTransposeLayer *)self dimensions];
  v8 = [v7 objectAtIndexedSubscript:a4];
  uint64_t v9 = [v8 unsignedIntegerValue];

  id v10 = [v6 objectAtIndexedSubscript:v9];

  unint64_t v11 = [v10 unsignedIntegerValue];
  return v11;
}

- (id)resultTensorFromSources:(id)a3
{
  id v5 = a3;
  id v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 descriptor];
  v8 = [v7 shape];
  uint64_t v9 = [v8 count];
  id v10 = [(MLCTransposeLayer *)self dimensions];
  uint64_t v11 = [v10 count];

  if (v9 == v11)
  {
    uint64_t v12 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    for (unint64_t i = 0; ; ++i)
    {
      uint64_t v14 = [v5 objectAtIndexedSubscript:0];
      v15 = [v14 descriptor];
      uint64_t v16 = [v15 shape];
      unint64_t v17 = [v16 count];

      if (i >= v17) {
        break;
      }
      v18 = [v5 objectAtIndexedSubscript:0];
      uint64_t v19 = [v18 descriptor];
      v20 = [v19 shape];
      unint64_t v21 = [(MLCTransposeLayer *)self resultSizeFromSourceSizes:v20 dimension:i];

      v22 = [NSNumber numberWithUnsignedInteger:v21];
      [v12 setObject:v22 atIndexedSubscript:i];
    }
    v25 = (void *)[v12 copy];
    v26 = [v5 objectAtIndexedSubscript:0];
    v27 = [v26 descriptor];
    uint64_t v28 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v25, [v27 dataType]);

    char v24 = +[MLCTensor tensorWithDescriptor:v28];
  }
  else
  {
    v23 = +[MLCLog framework];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MLCTransposeLayer resultTensorFromSources:](a2);
    }

    char v24 = 0;
  }

  return v24;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [v3 objectAtIndexedSubscript:v4];
      id v6 = [v5 descriptor];
      uint64_t v7 = [v6 shape];
      unint64_t v8 = [v7 count];

      BOOL v9 = v8 > 1;
      if (v8 <= 1) {
        break;
      }
      ++v4;
    }
    while (v4 < [v3 count]);
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)isStaticBatchSize
{
  uint64_t v14 = [(MLCLayer *)self sourceTensors];
  id v3 = [v14 objectAtIndexedSubscript:0];
  unint64_t v4 = [v3 descriptor];
  id v5 = [v4 shape];
  id v6 = [v5 objectAtIndexedSubscript:0];
  uint64_t v7 = [v6 unsignedIntegerValue];
  unint64_t v8 = [(MLCLayer *)self resultTensors];
  BOOL v9 = [v8 objectAtIndexedSubscript:0];
  id v10 = [v9 descriptor];
  uint64_t v11 = [v10 shape];
  uint64_t v12 = [v11 objectAtIndexedSubscript:0];
  LOBYTE(v7) = v7 == [v12 unsignedIntegerValue];

  return v7;
}

- (id)description
{
  id v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [(MLCTransposeLayer *)self dimensions];
  uint64_t v7 = [(MLCLayer *)self conditionalTreeNode];
  unint64_t v8 = [(MLCLayer *)self resultTensors];
  BOOL v9 = [v3 stringWithFormat:@"%@: { dimensions=%@ : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8];

  return v9;
}

- (id)summarizedDOTDescription
{
  id v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  uint64_t v7 = [(MLCTransposeLayer *)self dimensions];
  unint64_t v8 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Permutation: %@</FONT>>", v5, v6, v7];

  return v8;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (NSArray)shape
{
  return self->_shape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);

  objc_storeStrong((id *)&self->_dimensions, 0);
}

- (void)initWithDimensions:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: invalid dimensions, must be an array of size 2 ", v4, v5, v6, v7, v8);
}

- (void)initWithDimensions:(const char *)a1 .cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: invalid dimension value at index= %lu, must be a value between 1 and 3", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: invalid source tensors count ", v4, v5, v6, v7, v8);
}

- (void)resultSizeFromSourceSize:(const char *)a1 dimension:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Please call resultSizeFromSourceSizes:dimension", v4, v5, v6, v7, v8);
}

- (void)resultTensorFromSources:(const char *)a1 .cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Shape of dimensions specified when transpose layer was created does not match source tensor shape", v4, v5, v6, v7, v8);
}

@end