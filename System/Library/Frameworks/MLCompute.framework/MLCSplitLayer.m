@interface MLCSplitLayer
+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4;
+ (MLCSplitLayer)layerWithSplitCount:(NSUInteger)splitCount dimension:(NSUInteger)dimension;
+ (MLCSplitLayer)layerWithSplitSectionLengths:(NSArray *)splitSectionLengths dimension:(NSUInteger)dimension;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5;
- (BOOL)isStaticBatchSize;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCSplitLayer)initWithSplitCount:(unint64_t)a3 splitSectionLengths:(id)a4 dimension:(unint64_t)a5;
- (NSArray)splitSectionLengths;
- (NSUInteger)dimension;
- (NSUInteger)splitCount;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)summarizedDOTDescription;
- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4;
@end

@implementation MLCSplitLayer

+ (MLCSplitLayer)layerWithSplitCount:(NSUInteger)splitCount dimension:(NSUInteger)dimension
{
  v4 = (void *)[objc_alloc((Class)a1) initWithSplitCount:splitCount splitSectionLengths:0 dimension:dimension];

  return (MLCSplitLayer *)v4;
}

+ (MLCSplitLayer)layerWithSplitSectionLengths:(NSArray *)splitSectionLengths dimension:(NSUInteger)dimension
{
  v6 = splitSectionLengths;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithSplitCount:splitSectionLengths:dimension:", -[NSArray count](v6, "count"), v6, dimension);

  return (MLCSplitLayer *)v7;
}

- (MLCSplitLayer)initWithSplitCount:(unint64_t)a3 splitSectionLengths:(id)a4 dimension:(unint64_t)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MLCSplitLayer;
  v9 = [(MLCLayer *)&v14 initWithLabel:@"Split"];
  v10 = v9;
  if (v9)
  {
    v9->_dimension = a5;
    v9->_splitCount = a3;
    if (v8)
    {
      uint64_t v11 = [v8 copy];
      splitSectionLengths = v10->_splitSectionLengths;
      v10->_splitSectionLengths = (NSArray *)v11;
    }
    else
    {
      splitSectionLengths = v9->_splitSectionLengths;
      v9->_splitSectionLengths = 0;
    }
  }
  return v10;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensors:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCConcatenationLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
    goto LABEL_16;
  }
  if ([v10 count] != 1)
  {
    v15 = +[MLCLog framework];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MLCSplitLayer compileForDevice:sourceTensors:resultTensors:](a2);
    }
    goto LABEL_16;
  }
  v12 = [v9 computeEngine];
  char v13 = objc_opt_respondsToSelector();

  if ((v13 & 1) == 0)
  {
    v15 = 0;
    char v17 = 1;
    goto LABEL_12;
  }
  objc_super v14 = [v9 computeEngine];
  v15 = objc_msgSend(v14, "splitLayerWithDimension:", -[MLCSplitLayer dimension](self, "dimension"));

  if (!v15 || ![v15 count])
  {
    v18 = +[MLCLog framework];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v15, v18);
    }

LABEL_16:
    char v17 = 0;
    goto LABEL_17;
  }
  v16 = [v9 computeEngine];
  char v17 = [v16 compileLayerDeviceOps:v15 sourceTensors:v10 resultTensors:v11];

LABEL_12:
  v20.receiver = self;
  v20.super_class = (Class)MLCSplitLayer;
  [(MLCLayer *)&v20 bindDevice:v9 deviceOps:v15];
LABEL_17:

  return v17;
}

- (unint64_t)deviceMemorySizeWithOptimizer:(id)a3 device:(id)a4
{
  id v5 = a4;
  v6 = [(MLCLayer *)self resultTensors];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    unint64_t v8 = 0;
    uint64_t v9 = 0;
    do
    {
      id v10 = [v5 computeEngine];
      id v11 = [(MLCLayer *)self resultTensors];
      v12 = [v11 objectAtIndexedSubscript:v8];
      v9 += [v10 deviceMemorySizeForTensor:v12];

      ++v8;
      char v13 = [(MLCLayer *)self resultTensors];
      unint64_t v14 = [v13 count];
    }
    while (v8 < v14);
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (![(MLCLayer *)self isTrainable]) {
    goto LABEL_18;
  }
  v15 = [(MLCLayer *)self intermediateGradientTensors];
  uint64_t v16 = [v15 count];

  if (v16)
  {
    char v17 = [(MLCLayer *)self intermediateGradientTensors];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      unint64_t v19 = 0;
      uint64_t v20 = 0;
      do
      {
        v21 = [v5 computeEngine];
        v22 = [(MLCLayer *)self intermediateGradientTensors];
        v23 = [v22 objectAtIndexedSubscript:v19];
        v20 += [v21 deviceMemorySizeForTensor:v23];

        ++v19;
        v24 = [(MLCLayer *)self intermediateGradientTensors];
        unint64_t v25 = [v24 count];
      }
      while (v19 < v25);
      goto LABEL_19;
    }
LABEL_18:
    uint64_t v20 = 0;
    goto LABEL_19;
  }
  v26 = [(MLCLayer *)self sourceGradientTensors];
  uint64_t v27 = [v26 count];

  if (!v27) {
    goto LABEL_18;
  }
  unint64_t v28 = 0;
  uint64_t v20 = 0;
  do
  {
    v29 = [(MLCLayer *)self sourceGradientTensors];
    v30 = [v29 objectAtIndexedSubscript:v28];
    v31 = [v30 sharedMemoryTensor];

    if (!v31)
    {
      v32 = [v5 computeEngine];
      v33 = [(MLCLayer *)self sourceGradientTensors];
      v34 = [v33 objectAtIndexedSubscript:v28];
      v20 += [v32 deviceMemorySizeForTensor:v34];
    }
    ++v28;
    v35 = [(MLCLayer *)self sourceGradientTensors];
    unint64_t v36 = [v35 count];
  }
  while (v28 < v36);
LABEL_19:

  return v20 + v9;
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
      v6 = [v5 descriptor];
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
  return [(MLCSplitLayer *)self dimension] != 0;
}

+ (BOOL)supportsDataType:(int)a3 onDevice:(id)a4
{
  return a3 == 1 || a3 == 4;
}

- (id)description
{
  id v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCSplitLayer *)self dimension];
  NSUInteger v7 = [(MLCSplitLayer *)self splitCount];
  unint64_t v8 = [(MLCSplitLayer *)self splitSectionLengths];
  BOOL v9 = [(MLCLayer *)self conditionalTreeNode];
  id v10 = [(MLCLayer *)self resultTensors];
  id v11 = [v3 stringWithFormat:@"%@: { dimension=%lu : splitCount=%lu : splitSectionLengths=%@ : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8, v9, v10];

  return v11;
}

- (id)summarizedDOTDescription
{
  id v3 = NSString;
  unint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  NSUInteger v6 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Dimension: %lu    Split Count: %lu</FONT>>", v5, -[MLCLayer layerID](self, "layerID"), -[MLCSplitLayer dimension](self, "dimension"), -[MLCSplitLayer splitCount](self, "splitCount")];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  NSUInteger v5 = [(MLCSplitLayer *)self splitCount];
  NSUInteger v6 = [(MLCSplitLayer *)self splitSectionLengths];
  NSUInteger v7 = objc_msgSend(v4, "initWithSplitCount:splitSectionLengths:dimension:", v5, v6, -[MLCSplitLayer dimension](self, "dimension"));

  return v7;
}

- (NSUInteger)dimension
{
  return self->_dimension;
}

- (NSUInteger)splitCount
{
  return self->_splitCount;
}

- (NSArray)splitSectionLengths
{
  return self->_splitSectionLengths;
}

- (void).cxx_destruct
{
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensors:.cold.3(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_0_0(&dword_1DD0C9000, v2, v3, "%@: source tensor count must be 1", v4, v5, v6, v7, 2u);
}

@end