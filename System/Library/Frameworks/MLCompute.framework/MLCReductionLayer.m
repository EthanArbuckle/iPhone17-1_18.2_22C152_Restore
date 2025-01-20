@interface MLCReductionLayer
+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4;
+ (MLCReductionLayer)layerWithReductionType:(MLCReductionType)reductionType dimension:(NSUInteger)dimension;
+ (MLCReductionLayer)layerWithReductionType:(MLCReductionType)reductionType dimensions:(NSArray *)dimensions;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCReductionLayer)initWithReduceType:(int)a3 dimensions:(id)a4;
- (MLCReductionType)reductionType;
- (NSArray)dimensions;
- (NSUInteger)dimension;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
@end

@implementation MLCReductionLayer

+ (MLCReductionLayer)layerWithReductionType:(MLCReductionType)reductionType dimension:(NSUInteger)dimension
{
  uint64_t v5 = *(void *)&reductionType;
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc((Class)a1);
  v7 = [NSNumber numberWithUnsignedInteger:dimension];
  v11[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v9 = (void *)[v6 initWithReduceType:v5 dimensions:v8];

  return (MLCReductionLayer *)v9;
}

+ (MLCReductionLayer)layerWithReductionType:(MLCReductionType)reductionType dimensions:(NSArray *)dimensions
{
  uint64_t v4 = *(void *)&reductionType;
  id v6 = dimensions;
  v7 = (void *)[objc_alloc((Class)a1) initWithReduceType:v4 dimensions:v6];

  return (MLCReductionLayer *)v7;
}

- (MLCReductionLayer)initWithReduceType:(int)a3 dimensions:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v8 = v7;
  if ((a3 - 5) >= 2)
  {
    if (!a3) {
      goto LABEL_3;
    }
  }
  else if ([v7 count] != 1)
  {
LABEL_3:
    v9 = +[MLCLog framework];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v16 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v19 = v16;
      __int16 v20 = 1024;
      int v21 = a3;
      __int16 v22 = 2112;
      v23 = v8;
      _os_log_error_impl(&dword_1DD0C9000, v9, OS_LOG_TYPE_ERROR, "%@: failure to create reduction layer with reduceType = %d, dimensions = %@", buf, 0x1Cu);
    }
    v10 = 0;
    goto LABEL_10;
  }
  v17.receiver = self;
  v17.super_class = (Class)MLCReductionLayer;
  v11 = [(MLCLayer *)&v17 initWithLabel:@"Reduction"];
  v12 = v11;
  if (v11)
  {
    v11->_reductionType = a3;
    uint64_t v13 = [v8 copy];
    dimensions = v12->_dimensions;
    v12->_dimensions = (NSArray *)v13;
  }
  self = v12;
  v10 = self;
LABEL_10:

  return v10;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ([(MLCReductionLayer *)self reductionType] == MLCReductionTypeAll
    || [(MLCReductionLayer *)self reductionType] == MLCReductionTypeAny)
  {
    if ([v10 count])
    {
      unint64_t v12 = 0;
      do
      {
        uint64_t v13 = [v10 objectAtIndexedSubscript:v12];
        v14 = [v13 descriptor];
        int v15 = [v14 dataType];

        BOOL v16 = v15 != 4;
        if (v15 != 4) {
          break;
        }
        ++v12;
      }
      while (v12 < [v10 count]);
    }
    else
    {
      BOOL v16 = 0;
    }
    objc_super v17 = [v11 descriptor];
    int v18 = [v17 dataType];

    if (v16 || v18 != 4)
    {
      v25 = +[MLCLog framework];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[MLCReductionLayer compileForDevice:sourceTensors:resultTensor:](a2, v25);
      }
      goto LABEL_19;
    }
  }
  v30 = a2;
  v19 = [v9 computeEngine];
  uint64_t v20 = [(MLCReductionLayer *)self reductionType];
  int v21 = [(MLCReductionLayer *)self dimensions];
  __int16 v22 = [v10 objectAtIndexedSubscript:0];
  v23 = [v22 descriptor];
  uint64_t v24 = [v23 shape];
  v25 = objc_msgSend(v19, "reductionLayerWithReduceType:dimensions:sourceShapeCount:", v20, v21, objc_msgSend(v24, "count"));

  if (!v25 || ![v25 count])
  {
    v28 = +[MLCLog framework];
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:](v30, (uint64_t)v25, v28);
    }

LABEL_19:
    char v27 = 0;
    goto LABEL_20;
  }
  v26 = [v9 computeEngine];
  char v27 = [v26 compileLayerDeviceOps:v25 sourceTensors:v10 resultTensor:v11];

  v31.receiver = self;
  v31.super_class = (Class)MLCReductionLayer;
  [(MLCLayer *)&v31 bindDevice:v9 deviceOps:v25];
LABEL_20:

  return v27;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  id v7 = [(MLCReductionLayer *)self dimensions];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    unint64_t v9 = 0;
    while (1)
    {
      id v10 = [(MLCReductionLayer *)self dimensions];
      id v11 = [v10 objectAtIndexedSubscript:v9];
      uint64_t v12 = [v11 unsignedIntegerValue];

      if (v12 == a4) {
        break;
      }
      ++v9;
      uint64_t v13 = [(MLCReductionLayer *)self dimensions];
      unint64_t v14 = [v13 count];

      if (v9 >= v14) {
        return a3;
      }
    }
    return 1;
  }
  return a3;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (unint64_t i = 0; ; ++i)
  {
    id v7 = [v4 objectAtIndexedSubscript:0];
    uint64_t v8 = [v7 descriptor];
    unint64_t v9 = [v8 shape];
    unint64_t v10 = [v9 count];

    if (i >= v10) {
      break;
    }
    id v11 = [v4 objectAtIndexedSubscript:0];
    uint64_t v12 = [v11 descriptor];
    uint64_t v13 = [v12 shape];
    unint64_t v14 = [v13 objectAtIndexedSubscript:i];
    unint64_t v15 = -[MLCReductionLayer resultSizeFromSourceSize:dimension:](self, "resultSizeFromSourceSize:dimension:", [v14 unsignedIntegerValue], i);

    BOOL v16 = [NSNumber numberWithUnsignedInteger:v15];
    [v5 setObject:v16 atIndexedSubscript:i];
  }
  objc_super v17 = (void *)[v5 copy];
  int v18 = [v4 objectAtIndexedSubscript:0];
  v19 = [v18 descriptor];
  uint64_t v20 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v17, [v19 dataType]);

  int v21 = +[MLCTensor tensorWithDescriptor:v20];

  return v21;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCReductionLayer *)self reductionType];
  id v7 = [(MLCReductionLayer *)self dimensions];
  uint64_t v8 = [(MLCLayer *)self conditionalTreeNode];
  unint64_t v9 = [(MLCLayer *)self resultTensors];
  unint64_t v10 = [v3 stringWithFormat:@"%@: { reduceType=%d : dimension=%@ : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8, v9];

  return v10;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  id v7 = MLCReductionTypeDebugDescription([(MLCReductionLayer *)self reductionType]);
  uint64_t v8 = [(MLCReductionLayer *)self dimensions];
  unint64_t v9 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Reduction Type: %@    Dimension: %@</FONT>>", v5, v6, v7, v8];

  return v9;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return a3 == 1 || a3 == 4;
}

- (NSUInteger)dimension
{
  v2 = [(MLCReductionLayer *)self dimensions];
  v3 = [v2 objectAtIndexedSubscript:0];
  NSUInteger v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (MLCReductionType)reductionType
{
  return self->_reductionType;
}

- (NSArray)dimensions
{
  return self->_dimensions;
}

- (void).cxx_destruct
{
}

- (void)compileForDevice:(const char *)a1 sourceTensors:(NSObject *)a2 resultTensor:.cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: Data type for reduction type must be BOOLean", (uint8_t *)&v4, 0xCu);
}

@end