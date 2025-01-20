@interface MLCComparisonLayer
+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4;
+ (MLCComparisonLayer)layerWithOperation:(MLCComparisonOperation)operation;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCComparisonLayer)initWithOperation:(int)a3;
- (MLCComparisonOperation)operation;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
@end

@implementation MLCComparisonLayer

+ (MLCComparisonLayer)layerWithOperation:(MLCComparisonOperation)operation
{
  v3 = (void *)[objc_alloc((Class)a1) initWithOperation:*(void *)&operation];

  return (MLCComparisonLayer *)v3;
}

- (MLCComparisonLayer)initWithOperation:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MLCComparisonLayer;
  result = [(MLCLayer *)&v5 initWithLabel:@"Compare"];
  if (result) {
    result->_operation = a3;
  }
  return result;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  MLCComparisonOperation v12 = [(MLCComparisonLayer *)self operation];
  if ((v12 - 6) >= 6)
  {
    if ((v12 - 2) <= 3)
    {
      if ([v10 count])
      {
        unint64_t v18 = 0;
        do
        {
          v19 = [v10 objectAtIndexedSubscript:v18];
          v20 = [v19 descriptor];
          int v21 = [v20 dataType];

          BOOL v22 = v21 == 4;
          if (v21 == 4) {
            break;
          }
          ++v18;
        }
        while (v18 < [v10 count]);
      }
      else
      {
        BOOL v22 = 0;
      }
      v26 = [v11 descriptor];
      int v27 = [v26 dataType];

      if (v22 || v27 != 4)
      {
        v25 = +[MLCLog framework];
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          -[MLCComparisonLayer compileForDevice:sourceTensors:resultTensor:](a2);
        }
        goto LABEL_29;
      }
    }
  }
  else
  {
    if ([v10 count])
    {
      unint64_t v13 = 0;
      do
      {
        v14 = [v10 objectAtIndexedSubscript:v13];
        v15 = [v14 descriptor];
        int v16 = [v15 dataType];

        BOOL v17 = v16 != 4;
        if (v16 != 4) {
          break;
        }
        ++v13;
      }
      while (v13 < [v10 count]);
    }
    else
    {
      BOOL v17 = 0;
    }
    v23 = [v11 descriptor];
    int v24 = [v23 dataType];

    if (v17 || v24 != 4)
    {
      v25 = +[MLCLog framework];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[MLCComparisonLayer compileForDevice:sourceTensors:resultTensor:](a2);
      }
LABEL_29:
      char v30 = 0;
      goto LABEL_30;
    }
  }
  v28 = [v9 computeEngine];
  v25 = objc_msgSend(v28, "compareLayerWithOperation:", -[MLCComparisonLayer operation](self, "operation"));

  if (!v25 || ![v25 count])
  {
    v31 = +[MLCLog framework];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v25, v31);
    }

    goto LABEL_29;
  }
  v29 = [v9 computeEngine];
  char v30 = [v29 compileLayerDeviceOps:v25 sourceTensors:v10 resultTensor:v11];

  v33.receiver = self;
  v33.super_class = (Class)MLCComparisonLayer;
  [(MLCLayer *)&v33 bindDevice:v9 deviceOps:v25];
LABEL_30:

  return v30;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  return a3;
}

- (id)resultTensorFromSources:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MLCComparisonLayer;
  v3 = [(MLCLayer *)&v5 resultTensorsFromBroadcastableSources:a3 resultTensorDataType:4];

  return v3;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCComparisonLayer *)self operation];
  v7 = [(MLCLayer *)self conditionalTreeNode];
  v8 = [(MLCLayer *)self resultTensors];
  id v9 = [v3 stringWithFormat:@"%@: { compare operation=%d : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8];

  return v9;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  v7 = MLCComparisonOperationDebugDescription([(MLCComparisonLayer *)self operation]);
  v8 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Predicate: %@</FONT>>", v5, v6, v7];

  return v8;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return a3 == 4 || a3 == 1;
}

- (MLCComparisonOperation)operation
{
  return self->_operation;
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Data type for comparison operation cannot be BOOLean", v4, v5, v6, v7, 2u);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: Data type for comparison operation must be BOOLean", v4, v5, v6, v7, 2u);
}

@end