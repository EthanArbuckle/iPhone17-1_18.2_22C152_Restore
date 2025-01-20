@interface MLCSoftmaxLayer
+ (MLCSoftmaxLayer)layerWithOperation:(MLCSoftmaxOperation)operation;
+ (MLCSoftmaxLayer)layerWithOperation:(MLCSoftmaxOperation)operation dimension:(NSUInteger)dimension;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCSoftmaxLayer)initWithSoftmaxOperation:(int)a3 dimension:(unint64_t)a4;
- (MLCSoftmaxOperation)operation;
- (NSUInteger)dimension;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
@end

@implementation MLCSoftmaxLayer

+ (MLCSoftmaxLayer)layerWithOperation:(MLCSoftmaxOperation)operation
{
  v3 = (void *)[objc_alloc((Class)a1) initWithSoftmaxOperation:*(void *)&operation dimension:1];

  return (MLCSoftmaxLayer *)v3;
}

+ (MLCSoftmaxLayer)layerWithOperation:(MLCSoftmaxOperation)operation dimension:(NSUInteger)dimension
{
  v4 = (void *)[objc_alloc((Class)a1) initWithSoftmaxOperation:*(void *)&operation dimension:dimension];

  return (MLCSoftmaxLayer *)v4;
}

- (MLCSoftmaxLayer)initWithSoftmaxOperation:(int)a3 dimension:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MLCSoftmaxLayer;
  result = [(MLCLayer *)&v7 initWithLabel:@"Softmax"];
  if (result)
  {
    result->_operation = a3;
    result->_dimension = a4;
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
  v14 = [v13 shape];
  uint64_t v15 = [v14 count];

  v16 = [v10 objectAtIndexedSubscript:0];
  v17 = [v16 descriptor];
  uint64_t v18 = [v17 dataType];

  if (!+[MLCLayer supportsDataType:v18 onDevice:v9])
  {
    v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v28 = v23;
      __int16 v29 = 1024;
      int v30 = v18;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_error_impl(&dword_1DD0C9000, v20, OS_LOG_TYPE_ERROR, "%@: softmax layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);
    }
    goto LABEL_10;
  }
  v19 = [v9 computeEngine];
  v20 = objc_msgSend(v19, "softmaxLayerWithOperation:dimension:sourceShapeCount:", -[MLCSoftmaxLayer operation](self, "operation"), -[MLCSoftmaxLayer dimension](self, "dimension"), v15);

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
  v26.super_class = (Class)MLCSoftmaxLayer;
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
    v6 = [v3 objectAtIndexedSubscript:0];
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
  v14 = (void *)[v4 copy];
  uint64_t v15 = [v3 objectAtIndexedSubscript:0];
  v16 = [v15 descriptor];
  v17 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v14, [v16 dataType]);

  uint64_t v18 = +[MLCTensor tensorWithDescriptor:v17];

  return v18;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (id)description
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [(MLCSoftmaxLayer *)self operation];
  objc_super v7 = [(MLCLayer *)self conditionalTreeNode];
  v8 = [(MLCLayer *)self resultTensors];
  unint64_t v9 = [v3 stringWithFormat:@"%@: { operation=%d : conditionalTreeNode=%@ : resultTensor=%@ }", v5, v6, v7, v8];

  return v9;
}

- (id)summarizedDOTDescription
{
  id v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  objc_super v7 = MLCSoftmaxOperationDebugDescription([(MLCSoftmaxLayer *)self operation]);
  v8 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Operation: %@    Dimension: %lu</FONT>>", v5, v6, v7, -[MLCSoftmaxLayer dimension](self, "dimension")];

  return v8;
}

- (MLCSoftmaxOperation)operation
{
  return self->_operation;
}

- (NSUInteger)dimension
{
  return self->_dimension;
}

@end