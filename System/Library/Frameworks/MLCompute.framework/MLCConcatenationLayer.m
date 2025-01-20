@interface MLCConcatenationLayer
+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4;
+ (MLCConcatenationLayer)layer;
+ (MLCConcatenationLayer)layerWithDimension:(NSUInteger)dimension;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isStaticBatchSize;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCConcatenationLayer)initWithDimension:(unint64_t)a3;
- (NSUInteger)dimension;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
@end

@implementation MLCConcatenationLayer

+ (MLCConcatenationLayer)layer
{
  v2 = (void *)[objc_alloc((Class)a1) initWithDimension:1];

  return (MLCConcatenationLayer *)v2;
}

+ (MLCConcatenationLayer)layerWithDimension:(NSUInteger)dimension
{
  v3 = (void *)[objc_alloc((Class)a1) initWithDimension:dimension];

  return (MLCConcatenationLayer *)v3;
}

- (MLCConcatenationLayer)initWithDimension:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MLCConcatenationLayer;
  result = [(MLCLayer *)&v5 initWithLabel:@"Concat"];
  if (result) {
    result->_dimension = a3;
  }
  return result;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v34 = +[MLCLog framework];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[MLCConcatenationLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_35;
  }
  if (![v10 count])
  {
    v34 = +[MLCLog framework];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[MLCConcatenationLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_35;
  }
  aSelector = a2;
  uint64_t v12 = [v10 count];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = 0;
    while (1)
    {
      v15 = [v10 objectAtIndexedSubscript:v14];
      v16 = [v15 descriptor];
      uint64_t v17 = [v16 dataType];

      if (!+[MLCConcatenationLayer supportsDataType:v17 onDevice:v9])break; {
      if (v13 == ++v14)
      }
        goto LABEL_7;
    }
    v34 = +[MLCLog framework];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v37 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138413058;
      v47 = v37;
      __int16 v48 = 2048;
      uint64_t v49 = v14;
      __int16 v50 = 1024;
      int v51 = v17;
      __int16 v52 = 2112;
      id v53 = v9;
      _os_log_error_impl(&dword_1DD0C9000, v34, OS_LOG_TYPE_ERROR, "%@: sourceTensor[%lu] uses unsupported data type = %d on a device = %@", buf, 0x26u);
    }
    goto LABEL_35;
  }
LABEL_7:
  v18 = [v10 objectAtIndexedSubscript:0];
  v19 = [v18 descriptor];
  v20 = [v19 shape];
  uint64_t v21 = [v20 count];

  if ((unint64_t)[v10 count] >= 2)
  {
    uint64_t v22 = 1;
    while (1)
    {
      v23 = [v10 objectAtIndexedSubscript:v22];
      v24 = [v23 descriptor];
      v25 = [v24 shape];
      uint64_t v26 = [v25 count];

      if (v21 != v26) {
        break;
      }
      if (++v22 >= (unint64_t)[v10 count]) {
        goto LABEL_11;
      }
    }
    v34 = +[MLCLog framework];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[MLCConcatenationLayer compileForDevice:sourceTensors:resultTensor:].cold.5(aSelector);
    }
    goto LABEL_35;
  }
LABEL_11:
  v27 = [v9 computeEngine];
  char v28 = objc_opt_respondsToSelector();

  v29 = [v9 computeEngine];
  if ((v28 & 1) == 0)
  {
    char v38 = objc_opt_respondsToSelector();

    if ((v38 & 1) == 0)
    {
      v34 = 0;
      char v36 = 1;
      goto LABEL_31;
    }
    v39 = [v9 computeEngine];
    v34 = objc_msgSend(v39, "splitLayerWithDimension:", -[MLCConcatenationLayer dimension](self, "dimension"));

    if (v34 && [v34 count])
    {
      v35 = [v9 computeEngine];
      id v45 = v11;
      v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
      char v36 = [v35 compileLayerDeviceOps:v34 sourceTensors:v10 resultTensors:v40];

      goto LABEL_25;
    }
    v41 = +[MLCLog framework];
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  NSUInteger v30 = [(MLCConcatenationLayer *)self dimension];
  v31 = [v10 objectAtIndexedSubscript:0];
  v32 = [v31 descriptor];
  v33 = [v32 shape];
  v34 = objc_msgSend(v29, "concatLayerWithConcatDimension:sourceShapeCount:", v30, objc_msgSend(v33, "count"));

  if (!v34 || ![v34 count])
  {
    v41 = +[MLCLog framework];
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
LABEL_34:

LABEL_35:
      char v36 = 0;
      goto LABEL_36;
    }
LABEL_33:
    -[MLCConcatenationLayer compileForDevice:sourceTensors:resultTensor:](aSelector);
    goto LABEL_34;
  }
  v35 = [v9 computeEngine];
  char v36 = [v35 compileLayerDeviceOps:v34 sourceTensors:v10 resultTensor:v11];
LABEL_25:

LABEL_31:
  v44.receiver = self;
  v44.super_class = (Class)MLCConcatenationLayer;
  [(MLCLayer *)&v44 bindDevice:v9 deviceOps:v34];
LABEL_36:

  return v36;
}

- (id)resultTensorFromSources:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  unint64_t v6 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  while (1)
  {
    v7 = objc_msgSend(v4, "objectAtIndexedSubscript:", 0, v34, v35);
    v8 = [v7 descriptor];
    id v9 = [v8 shape];
    unint64_t v10 = [v9 count];

    if (v6 >= v10) {
      break;
    }
    id v11 = [v4 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 descriptor];
    uint64_t v13 = [v12 shape];
    uint64_t v14 = [v13 objectAtIndexedSubscript:v6];
    *((void *)&v34 + v6) = [v14 unsignedIntegerValue];

    ++v6;
  }
  if ((unint64_t)[v4 count] >= 2)
  {
    unint64_t v15 = 1;
    do
    {
      v16 = [v4 objectAtIndexedSubscript:v15];
      uint64_t v17 = [v16 descriptor];
      v18 = [v17 shape];
      v19 = objc_msgSend(v18, "objectAtIndexedSubscript:", -[MLCConcatenationLayer dimension](self, "dimension"));
      uint64_t v20 = [v19 unsignedIntegerValue];
      NSUInteger v21 = [(MLCConcatenationLayer *)self dimension];
      *((void *)&v34 + v21) += v20;

      ++v15;
    }
    while (v15 < [v4 count]);
  }
  for (unint64_t i = 0; ; ++i)
  {
    v23 = [v4 objectAtIndexedSubscript:0];
    v24 = [v23 descriptor];
    v25 = [v24 shape];
    unint64_t v26 = [v25 count];

    if (i >= v26) {
      break;
    }
    v27 = [NSNumber numberWithUnsignedInteger:*((void *)&v34 + i)];
    [v5 setObject:v27 atIndexedSubscript:i];
  }
  char v28 = (void *)[v5 copy];
  v29 = [v4 objectAtIndexedSubscript:0];
  NSUInteger v30 = [v29 descriptor];
  v31 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v28, [v30 dataType]);

  v32 = +[MLCTensor tensorWithDescriptor:v31];

  return v32;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (BOOL)isStaticBatchSize
{
  return [(MLCConcatenationLayer *)self dimension] != 0;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return a3 == 1 || a3 == 4;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCConcatenationLayer *)self dimension];
  v7 = [(MLCLayer *)self conditionalTreeNode];
  v8 = [(MLCLayer *)self resultTensors];
  id v9 = [v3 stringWithFormat:@"%@: { dimension=%lu : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8];

  return v9;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  NSUInteger v6 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Dimension: %lu</FONT>>", v5, -[MLCLayer layerID](self, "layerID"), -[MLCConcatenationLayer dimension](self, "dimension")];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  NSUInteger v5 = [(MLCConcatenationLayer *)self dimension];

  return (id)[v4 initWithDimension:v5];
}

- (NSUInteger)dimension
{
  return self->_dimension;
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: no source tensors specified", v4, v5, v6, v7, 2u);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: source tensors count must be >= 1", v4, v5, v6, v7, 2u);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.5(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: the shape count of source tensros must match", v4, v5, v6, v7, 2u);
}

@end