@interface MLCGatherLayer
+ (MLCGatherLayer)layerWithDimension:(NSUInteger)dimension;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCGatherLayer)initWithDimension:(unint64_t)a3;
- (NSUInteger)dimension;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
@end

@implementation MLCGatherLayer

+ (MLCGatherLayer)layerWithDimension:(NSUInteger)dimension
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDimension:dimension];

  return (MLCGatherLayer *)v3;
}

- (MLCGatherLayer)initWithDimension:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MLCGatherLayer;
  result = [(MLCLayer *)&v5 initWithLabel:@"Gather"];
  if (result) {
    result->_dimension = a3;
  }
  return result;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([v10 count] != 2)
  {
    v28 = +[MLCLog framework];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MLCGatherLayer compileForDevice:sourceTensors:resultTensor:].cold.5(a2);
    }
    goto LABEL_21;
  }
  v12 = [v10 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  int v14 = [v13 dataType];

  if (v14 != 1)
  {
    v28 = +[MLCLog framework];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MLCGatherLayer compileForDevice:sourceTensors:resultTensor:].cold.4(a2);
    }
    goto LABEL_21;
  }
  v15 = [v10 objectAtIndexedSubscript:1];
  v16 = [v15 descriptor];
  int v17 = [v16 dataType];

  if (v17 != 7)
  {
    v28 = +[MLCLog framework];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MLCGatherLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_21;
  }
  v33 = a2;
  v34 = self;
  v18 = [v10 objectAtIndexedSubscript:0];
  v19 = [v18 descriptor];
  v20 = [v19 shape];
  uint64_t v35 = [v20 count];
  v21 = [v10 objectAtIndexedSubscript:1];
  v22 = [v21 descriptor];
  v23 = [v22 shape];
  uint64_t v24 = [v23 count];

  if (v35 != v24)
  {
    v28 = +[MLCLog framework];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MLCGatherLayer compileForDevice:sourceTensors:resultTensor:](v33);
    }
    goto LABEL_21;
  }
  v25 = [v9 computeEngine];
  char v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) == 0)
  {
    v28 = 0;
LABEL_18:
    v31 = +[MLCLog framework];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[MLCScatterLayer compileForDevice:sourceTensors:resultTensor:](v33, (uint64_t)v28, v31);
    }

LABEL_21:
    char v30 = 0;
    goto LABEL_22;
  }
  v27 = [v9 computeEngine];
  v28 = objc_msgSend(v27, "gatherLayerWithDimension:", -[MLCGatherLayer dimension](v34, "dimension"));

  if (!v28 || ![v28 count]) {
    goto LABEL_18;
  }
  v29 = [v9 computeEngine];
  char v30 = [v29 compileLayerDeviceOps:v28 sourceTensors:v10 resultTensor:v11];

  v36.receiver = v34;
  v36.super_class = (Class)MLCGatherLayer;
  [(MLCLayer *)&v36 bindDevice:v9 deviceOps:v28];
LABEL_22:

  return v30;
}

- (id)resultTensorFromSources:(id)a3
{
  id v3 = a3;
  v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (unint64_t i = 0; ; ++i)
  {
    v6 = [v3 objectAtIndexedSubscript:1];
    v7 = [v6 descriptor];
    v8 = [v7 shape];
    unint64_t v9 = [v8 count];

    if (i >= v9) {
      break;
    }
    id v10 = [v3 objectAtIndexedSubscript:1];
    id v11 = [v10 descriptor];
    v12 = [v11 shape];
    v13 = [v12 objectAtIndexedSubscript:i];
    [v4 setObject:v13 atIndexedSubscript:i];
  }
  int v14 = (void *)[v4 copy];
  v15 = [v3 objectAtIndexedSubscript:0];
  v16 = [v15 descriptor];
  int v17 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v14, [v16 dataType]);

  v18 = +[MLCTensor tensorWithDescriptor:v17];

  return v18;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCGatherLayer *)self dimension];
  v7 = [(MLCLayer *)self resultTensors];
  v8 = [v3 stringWithFormat:@"%@: { dimension=%lu : resultTensor=%@ }", v5, v6, v7];

  return v8;
}

- (id)summarizedDOTDescription
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  NSUInteger v6 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Dimension: %lu</FONT>>", v5, -[MLCLayer layerID](self, "layerID"), -[MLCGatherLayer dimension](self, "dimension")];

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

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Source and index tensor must have the same shape", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Indices tensor data type must be a 32-bit integer type", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.4(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Source tensor data type must be a 32-bit floating-point type", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Gather layer expects two tensors, a source tensor and an indices tensor", v4, v5, v6, v7, v8);
}

@end