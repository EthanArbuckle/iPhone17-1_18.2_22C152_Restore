@interface MLCGramMatrixLayer
+ (MLCGramMatrixLayer)layerWithScale:(float)scale;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (MLCGramMatrixLayer)initWithScaleFactor:(float)a3;
- (float)scale;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4;
- (unint64_t)resultSizeFromSourceSizes:(id)a3 dimension:(unint64_t)a4;
@end

@implementation MLCGramMatrixLayer

+ (MLCGramMatrixLayer)layerWithScale:(float)scale
{
  id v4 = objc_alloc((Class)a1);
  *(float *)&double v5 = scale;
  v6 = (void *)[v4 initWithScaleFactor:v5];

  return (MLCGramMatrixLayer *)v6;
}

- (MLCGramMatrixLayer)initWithScaleFactor:(float)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MLCGramMatrixLayer;
  result = [(MLCLayer *)&v5 initWithLabel:@"GramMatrix"];
  if (result) {
    result->_scale = a3;
  }
  return result;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [v10 objectAtIndexedSubscript:0];
  v13 = [v12 descriptor];
  uint64_t v14 = [v13 dataType];

  if (!+[MLCLayer supportsDataType:v14 onDevice:v9])
  {
    v16 = +[MLCLog framework];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v19 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v24 = v19;
      __int16 v25 = 1024;
      int v26 = v14;
      __int16 v27 = 2112;
      id v28 = v9;
      _os_log_error_impl(&dword_1DD0C9000, v16, OS_LOG_TYPE_ERROR, "%@: GramMatrix layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);
    }
    goto LABEL_10;
  }
  v15 = [v9 computeEngine];
  [(MLCGramMatrixLayer *)self scale];
  v16 = objc_msgSend(v15, "gramMatrixLayerWithScaleFactor:");

  if (!v16 || ![v16 count])
  {
    v20 = +[MLCLog framework];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v16, v20);
    }

LABEL_10:
    char v18 = 0;
    goto LABEL_11;
  }
  v17 = [v9 computeEngine];
  char v18 = [v17 compileLayerDeviceOps:v16 sourceTensors:v10 resultTensor:v11];

  v22.receiver = self;
  v22.super_class = (Class)MLCGramMatrixLayer;
  [(MLCLayer *)&v22 bindDevice:v9 deviceOps:v16];
LABEL_11:

  return v18;
}

- (unint64_t)resultSizeFromSourceSize:(unint64_t)a3 dimension:(unint64_t)a4
{
  objc_super v5 = +[MLCLog framework];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[MLCGramMatrixLayer resultSizeFromSourceSize:dimension:](a2, v5);
  }

  return 0;
}

- (unint64_t)resultSizeFromSourceSizes:(id)a3 dimension:(unint64_t)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 1)
    {
      unint64_t v9 = a4 == 2;
      goto LABEL_7;
    }
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = [v5 objectAtIndexedSubscript:v7];
  unint64_t v9 = [v8 unsignedIntegerValue];

LABEL_7:
  return v9;
}

- (id)resultTensorFromSources:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (unint64_t i = 0; ; ++i)
  {
    uint64_t v7 = [v4 objectAtIndexedSubscript:0];
    v8 = [v7 descriptor];
    unint64_t v9 = [v8 shape];
    unint64_t v10 = [v9 count];

    if (i >= v10) {
      break;
    }
    id v11 = [v4 objectAtIndexedSubscript:0];
    v12 = [v11 descriptor];
    v13 = [v12 shape];
    uint64_t v14 = [v13 count];

    v15 = [v4 objectAtIndexedSubscript:0];
    v16 = [v15 descriptor];
    v17 = [v16 shape];
    if (i == 2 && v14 == 3) {
      uint64_t v19 = 3;
    }
    else {
      uint64_t v19 = i;
    }
    unint64_t v20 = [(MLCGramMatrixLayer *)self resultSizeFromSourceSizes:v17 dimension:v19];

    v21 = [NSNumber numberWithUnsignedInteger:v20];
    [v5 setObject:v21 atIndexedSubscript:i];
  }
  objc_super v22 = (void *)[v5 copy];
  v23 = [v4 objectAtIndexedSubscript:0];
  v24 = [v23 descriptor];
  __int16 v25 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v22, [v24 dataType]);

  int v26 = +[MLCTensor tensorWithDescriptor:v25];

  return v26;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [(MLCGramMatrixLayer *)self scale];
  double v7 = v6;
  v8 = [(MLCLayer *)self conditionalTreeNode];
  unint64_t v9 = [(MLCLayer *)self resultTensors];
  unint64_t v10 = [v3 stringWithFormat:@"%@: { scale=%f : conditionalTreeNode=%@ : resultTensor=%@ }", v5, *(void *)&v7, v8, v9];

  return v10;
}

- (id)summarizedDOTDescription
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  [(MLCGramMatrixLayer *)self scale];
  v8 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Scale: %.03f</FONT>>", v5, v6, v7];

  return v8;
}

- (float)scale
{
  return self->_scale;
}

- (void)resultSizeFromSourceSize:(const char *)a1 dimension:(NSObject *)a2 .cold.1(const char *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = NSStringFromSelector(a1);
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_1DD0C9000, a2, OS_LOG_TYPE_ERROR, "%@: Please call resultSizeFromSourceSizes:dimension", (uint8_t *)&v4, 0xCu);
}

@end