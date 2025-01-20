@interface MLCDropoutLayer
+ (MLCDropoutLayer)layerWithRate:(float)rate seed:(NSUInteger)seed;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCDropoutLayer)initWithRate:(float)a3 seed:(unint64_t)a4;
- (NSUInteger)seed;
- (float)rate;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
@end

@implementation MLCDropoutLayer

+ (MLCDropoutLayer)layerWithRate:(float)rate seed:(NSUInteger)seed
{
  id v6 = objc_alloc((Class)a1);
  *(float *)&double v7 = rate;
  v8 = (void *)[v6 initWithRate:seed seed:v7];

  return (MLCDropoutLayer *)v8;
}

- (MLCDropoutLayer)initWithRate:(float)a3 seed:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MLCDropoutLayer;
  result = [(MLCLayer *)&v7 initWithLabel:@"Dropout"];
  if (result)
  {
    result->_rate = a3;
    result->_seed = a4;
  }
  return result;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  uint64_t v14 = [v13 dataType];

  if (!+[MLCLayer supportsDataType:v14 onDevice:v9])
  {
    v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v28 = v23;
      __int16 v29 = 1024;
      int v30 = v14;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_error_impl(&dword_1DD0C9000, v20, OS_LOG_TYPE_ERROR, "%@: dropout layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);
    }
    goto LABEL_10;
  }
  v15 = [v9 computeEngine];
  [(MLCDropoutLayer *)self rate];
  int v17 = v16;
  NSUInteger v18 = [(MLCDropoutLayer *)self seed];
  LODWORD(v19) = v17;
  v20 = [v15 dropoutLayerWithRate:v18 seed:v19];

  if (!v20 || ![v20 count])
  {
    v24 = +[MLCLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v20, v24);
    }

LABEL_10:
    char v22 = 0;
    goto LABEL_11;
  }
  v21 = [v9 computeEngine];
  char v22 = [v21 compileLayerDeviceOps:v20 sourceTensors:v10 resultTensor:v11];

  v26.receiver = self;
  v26.super_class = (Class)MLCDropoutLayer;
  [(MLCLayer *)&v26 bindDevice:v9 deviceOps:v20];
LABEL_11:

  return v22;
}

- (id)resultTensorFromSources:(id)a3
{
  id v3 = a3;
  v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (unint64_t i = 0; ; ++i)
  {
    id v6 = [v3 objectAtIndexedSubscript:0];
    objc_super v7 = [v6 descriptor];
    v8 = [v7 shape];
    unint64_t v9 = [v8 count];

    if (i >= v9) {
      break;
    }
    id v10 = [v3 objectAtIndexedSubscript:0];
    id v11 = [v10 descriptor];
    v12 = [v11 shape];
    v13 = [v12 objectAtIndexedSubscript:i];
    [v4 setObject:v13 atIndexedSubscript:i];
  }
  uint64_t v14 = (void *)[v4 copy];
  v15 = [v3 objectAtIndexedSubscript:0];
  int v16 = [v15 descriptor];
  int v17 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v14, [v16 dataType]);

  NSUInteger v18 = +[MLCTensor tensorWithDescriptor:v17];

  return v18;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(MLCDropoutLayer *)self rate];
  double v7 = v6;
  NSUInteger v8 = [(MLCDropoutLayer *)self seed];
  unint64_t v9 = [(MLCLayer *)self conditionalTreeNode];
  id v10 = [(MLCLayer *)self resultTensors];
  id v11 = [v3 stringWithFormat:@"%@: { rate=%f : seed=%lu : conditionalTreeNode=%@ : resultTensor=%@ }", v5, *(void *)&v7, v8, v9, v10];

  return v11;
}

- (id)summarizedDOTDescription
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  [(MLCDropoutLayer *)self rate];
  NSUInteger v8 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Rate: %.03f    Seed: %lu</FONT>>", v5, v6, v7, -[MLCDropoutLayer seed](self, "seed")];

  return v8;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  id v3 = a3;
  if ([v3 count])
  {
    unint64_t v4 = 0;
    do
    {
      v5 = [v3 objectAtIndexedSubscript:v4];
      NSUInteger v6 = [v5 descriptor];
      float v7 = [v6 shape];
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

- (float)rate
{
  return self->_rate;
}

- (NSUInteger)seed
{
  return self->_seed;
}

@end