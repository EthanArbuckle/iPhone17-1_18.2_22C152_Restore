@interface MLCScatterLayer
+ (MLCScatterLayer)layerWithDimension:(NSUInteger)dimension reductionType:(MLCReductionType)reductionType;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCReductionType)reductionType;
- (MLCScatterLayer)initWithDimension:(unint64_t)a3 reductionType:(int)a4;
- (NSUInteger)dimension;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
@end

@implementation MLCScatterLayer

+ (MLCScatterLayer)layerWithDimension:(NSUInteger)dimension reductionType:(MLCReductionType)reductionType
{
  if (reductionType >= MLCReductionTypeMean)
  {
    v6 = +[MLCLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[MLCScatterLayer layerWithDimension:reductionType:](a2);
    }

    v4 = 0;
  }
  else
  {
    v4 = (void *)[objc_alloc((Class)a1) initWithDimension:dimension reductionType:*(void *)&reductionType];
  }

  return (MLCScatterLayer *)v4;
}

- (MLCScatterLayer)initWithDimension:(unint64_t)a3 reductionType:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MLCScatterLayer;
  result = [(MLCLayer *)&v7 initWithLabel:@"Scatter"];
  if (result)
  {
    result->_dimension = a3;
    result->_reductionType = a4;
  }
  return result;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 count] == 3)
  {
    v12 = [v10 objectAtIndexedSubscript:0];
    v13 = [v10 objectAtIndexedSubscript:1];
    v14 = [v10 objectAtIndexedSubscript:2];
    v15 = [v14 descriptor];
    int v16 = [v15 dataType];

    if (v16 == 1)
    {
      v17 = [v13 descriptor];
      int v18 = [v17 dataType];

      if (v18 == 7)
      {
        v19 = [v12 descriptor];
        int v20 = [v19 dataType];

        if (v20 == 1)
        {
          v49 = self;
          v50 = a2;
          v51 = v14;
          v52 = v9;
          v21 = [v10 objectAtIndexedSubscript:1];
          v55 = [v21 descriptor];
          v22 = [v55 shape];
          uint64_t v53 = [v22 count];
          v23 = [v10 objectAtIndexedSubscript:0];
          v24 = [v23 descriptor];
          v25 = [v24 shape];
          uint64_t v26 = [v25 count];

          if (v53 != v26)
          {
            v40 = +[MLCLog framework];
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
              -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:](v50);
            }
            char v41 = 0;
            id v9 = v52;
LABEL_28:
            v14 = v51;
            goto LABEL_23;
          }
          v48 = v13;
          v54 = v12;
          id v56 = v11;
          unint64_t v27 = 0;
          while (1)
          {
            v28 = [v10 objectAtIndexedSubscript:2];
            v29 = [v28 descriptor];
            v30 = [v29 shape];
            unint64_t v31 = [v30 count];

            if (v27 >= v31) {
              break;
            }
            v32 = [v10 objectAtIndexedSubscript:1];
            v33 = [v32 descriptor];
            v34 = [v33 shape];
            v35 = [v34 objectAtIndexedSubscript:v27];
            v36 = [v10 objectAtIndexedSubscript:0];
            v37 = [v36 descriptor];
            v38 = [v37 shape];
            v39 = [v38 objectAtIndexedSubscript:v27];

            ++v27;
            if (v35 != v39)
            {
              v40 = +[MLCLog framework];
              if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
                -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:](v50);
              }
              char v41 = 0;
              id v9 = v52;
              id v11 = v56;
              goto LABEL_12;
            }
          }
          id v9 = v52;
          v43 = [v52 computeEngine];
          char v44 = objc_opt_respondsToSelector();

          if (v44)
          {
            v45 = [v52 computeEngine];
            v40 = objc_msgSend(v45, "scatterLayerWithDimension:reduceType:", -[MLCScatterLayer dimension](v49, "dimension"), -[MLCScatterLayer reductionType](v49, "reductionType"));

            if (v40 && [v40 count])
            {
              v46 = [v52 computeEngine];
              id v11 = v56;
              char v41 = [v46 compileLayerDeviceOps:v40 sourceTensors:v10 resultTensor:v56];

              v57.receiver = v49;
              v57.super_class = (Class)MLCScatterLayer;
              [(MLCLayer *)&v57 bindDevice:v52 deviceOps:v40];
LABEL_12:
              v12 = v54;
              v13 = v48;
              goto LABEL_28;
            }
          }
          else
          {
            v40 = 0;
          }
          v12 = v54;
          id v11 = v56;
          v13 = v48;
          v14 = v51;
          v47 = +[MLCLog framework];
          if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
            -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:](v50, (uint64_t)v40, v47);
          }
        }
        else
        {
          v40 = +[MLCLog framework];
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
            -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
          }
        }
      }
      else
      {
        v40 = +[MLCLog framework];
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2);
        }
      }
    }
    else
    {
      v40 = +[MLCLog framework];
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.6(a2);
      }
    }
    char v41 = 0;
LABEL_23:

    goto LABEL_24;
  }
  v12 = +[MLCLog framework];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:].cold.7(a2);
  }
  char v41 = 0;
LABEL_24:

  return v41;
}

- (id)resultTensorFromSources:(id)a3
{
  id v3 = a3;
  v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (unint64_t i = 0; ; ++i)
  {
    v6 = [v3 objectAtIndexedSubscript:2];
    objc_super v7 = [v6 descriptor];
    v8 = [v7 shape];
    unint64_t v9 = [v8 count];

    if (i >= v9) {
      break;
    }
    id v10 = [v3 objectAtIndexedSubscript:2];
    id v11 = [v10 descriptor];
    v12 = [v11 shape];
    v13 = [v12 objectAtIndexedSubscript:i];
    [v4 setObject:v13 atIndexedSubscript:i];
  }
  v14 = (void *)[v4 copy];
  v15 = [v3 objectAtIndexedSubscript:2];
  int v16 = [v15 descriptor];
  v17 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v14, [v16 dataType]);

  int v18 = +[MLCTensor tensorWithDescriptor:v17];

  return v18;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCScatterLayer *)self dimension];
  objc_super v7 = [(MLCLayer *)self resultTensors];
  v8 = [v3 stringWithFormat:@"%@: { dimension=%lu : resultTensor=%@ }", v5, v6, v7];

  return v8;
}

- (id)summarizedDOTDescription
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Dimension: %lu</FONT>>", v5, -[MLCLayer layerID](self, "layerID"), -[MLCScatterLayer dimension](self, "dimension")];

  return v6;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (NSUInteger)dimension
{
  return self->_dimension;
}

- (MLCReductionType)reductionType
{
  return self->_reductionType;
}

+ (void)layerWithDimension:(const char *)a1 reductionType:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Scatter layer only supports a reduce type of none or sum", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: index.size(d) <= src.size(d) for all dimensions", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(uint64_t)a2 resultTensor:(NSObject *)a3 .cold.2(const char *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_ERROR, "%@: failure to create deviceOps=%@", v6, 0x16u);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Source and index tensor must have the same shape", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Source tensor [0] data type must be a 32-bit floating-point type", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Source tensor [1] data type must be a 32-bit integer type", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.6(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Source tensor [2] data type must be a 32-bit floating-point type", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.7(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Scatter layer expects three tensors, a tensor to copy to result tensor, an indices tensor and source tensor whose elements are to be scattered into result tensor", v4, v5, v6, v7, v8);
}

@end