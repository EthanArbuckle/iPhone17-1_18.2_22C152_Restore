@interface MLCActivationLayer
+ (MLCActivationLayer)absoluteLayer;
+ (MLCActivationLayer)celuLayer;
+ (MLCActivationLayer)celuLayerWithA:(float)a;
+ (MLCActivationLayer)clampLayerWithMinValue:(float)minValue maxValue:(float)maxValue;
+ (MLCActivationLayer)eluLayer;
+ (MLCActivationLayer)eluLayerWithA:(float)a;
+ (MLCActivationLayer)geluLayer;
+ (MLCActivationLayer)hardShrinkLayer;
+ (MLCActivationLayer)hardShrinkLayerWithA:(float)a;
+ (MLCActivationLayer)hardSigmoidLayer;
+ (MLCActivationLayer)hardSwishLayer;
+ (MLCActivationLayer)layerWithDescriptor:(MLCActivationDescriptor *)descriptor;
+ (MLCActivationLayer)leakyReLULayer;
+ (MLCActivationLayer)leakyReLULayerWithNegativeSlope:(float)negativeSlope;
+ (MLCActivationLayer)linearLayerWithScale:(float)scale bias:(float)bias;
+ (MLCActivationLayer)logSigmoidLayer;
+ (MLCActivationLayer)relu6Layer;
+ (MLCActivationLayer)reluLayer;
+ (MLCActivationLayer)relunLayerWithA:(float)a b:(float)b;
+ (MLCActivationLayer)seluLayer;
+ (MLCActivationLayer)sigmoidLayer;
+ (MLCActivationLayer)softPlusLayer;
+ (MLCActivationLayer)softPlusLayerWithBeta:(float)beta;
+ (MLCActivationLayer)softShrinkLayer;
+ (MLCActivationLayer)softShrinkLayerWithA:(float)a;
+ (MLCActivationLayer)softSignLayer;
+ (MLCActivationLayer)tanhLayer;
+ (MLCActivationLayer)tanhShrinkLayer;
+ (MLCActivationLayer)thresholdLayerWithThreshold:(float)threshold replacement:(float)replacement;
- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5;
- (BOOL)isSupportedShapeForTensorSources:(id)a3;
- (MLCActivationDescriptor)descriptor;
- (MLCActivationLayer)initWithDescriptor:(id)a3;
- (id)description;
- (id)resultTensorFromSources:(id)a3;
- (id)summarizedDOTDescription;
@end

@implementation MLCActivationLayer

+ (MLCActivationLayer)reluLayer
{
  v3 = +[MLCActivationDescriptor descriptorWithType:1 a:0.0];
  v4 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v3];

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)relu6Layer
{
  LODWORD(v2) = 6.0;
  v4 = +[MLCActivationDescriptor descriptorWithType:10 a:0.0 b:v2];
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)leakyReLULayer
{
  LODWORD(v2) = 1008981770;
  v4 = +[MLCActivationDescriptor descriptorWithType:1 a:v2];
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)leakyReLULayerWithNegativeSlope:(float)negativeSlope
{
  v4 = +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 1);
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)linearLayerWithScale:(float)scale bias:(float)bias
{
  v5 = +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 2);
  v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5];

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)sigmoidLayer
{
  v3 = +[MLCActivationDescriptor descriptorWithType:3];
  v4 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v3];

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)hardSigmoidLayer
{
  LODWORD(v2) = 1045220557;
  LODWORD(v3) = 0.5;
  v5 = +[MLCActivationDescriptor descriptorWithType:4 a:v2 b:v3];
  v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5];

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)tanhLayer
{
  LODWORD(v2) = 1.0;
  LODWORD(v3) = 1.0;
  v5 = +[MLCActivationDescriptor descriptorWithType:5 a:v2 b:v3];
  v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5];

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)absoluteLayer
{
  double v3 = +[MLCActivationDescriptor descriptorWithType:6];
  v4 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v3];

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)softPlusLayer
{
  LODWORD(v2) = 1.0;
  LODWORD(v3) = 1.0;
  v5 = +[MLCActivationDescriptor descriptorWithType:7 a:v2 b:v3];
  v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5];

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)softPlusLayerWithBeta:(float)beta
{
  *(float *)&double v4 = 1.0 / beta;
  v5 = +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 7, v4);
  v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5];

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)softSignLayer
{
  double v3 = +[MLCActivationDescriptor descriptorWithType:8];
  double v4 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v3];

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)eluLayer
{
  LODWORD(v2) = 1.0;
  double v4 = +[MLCActivationDescriptor descriptorWithType:9 a:v2];
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)eluLayerWithA:(float)a
{
  double v4 = +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 9);
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)relunLayerWithA:(float)a b:(float)b
{
  v5 = +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 10);
  v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5];

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)logSigmoidLayer
{
  double v3 = +[MLCActivationDescriptor descriptorWithType:11];
  double v4 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v3];

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)seluLayer
{
  double v3 = +[MLCActivationDescriptor descriptorWithType:12];
  double v4 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v3];

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)celuLayer
{
  LODWORD(v2) = 1.0;
  double v4 = +[MLCActivationDescriptor descriptorWithType:13 a:v2];
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)celuLayerWithA:(float)a
{
  double v4 = +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 13);
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)hardShrinkLayer
{
  LODWORD(v2) = 0.5;
  double v4 = +[MLCActivationDescriptor descriptorWithType:14 a:v2];
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)hardShrinkLayerWithA:(float)a
{
  double v4 = +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 14);
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)softShrinkLayer
{
  LODWORD(v2) = 0.5;
  double v4 = +[MLCActivationDescriptor descriptorWithType:15 a:v2];
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)softShrinkLayerWithA:(float)a
{
  double v4 = +[MLCActivationDescriptor descriptorWithType:a:](MLCActivationDescriptor, "descriptorWithType:a:", 15);
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

+ (MLCActivationLayer)tanhShrinkLayer
{
  double v3 = +[MLCActivationDescriptor descriptorWithType:16 a:0.0];
  double v4 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v3];

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)thresholdLayerWithThreshold:(float)threshold replacement:(float)replacement
{
  v5 = +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 17);
  v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5];

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)geluLayer
{
  LODWORD(v2) = *(_DWORD *)"*BL?";
  LODWORD(v3) = 1027024659;
  v5 = +[MLCActivationDescriptor descriptorWithType:18 a:v2 b:v3];
  v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5];

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)hardSwishLayer
{
  double v3 = +[MLCActivationDescriptor descriptorWithType:19];
  double v4 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v3];

  return (MLCActivationLayer *)v4;
}

+ (MLCActivationLayer)clampLayerWithMinValue:(float)minValue maxValue:(float)maxValue
{
  v5 = +[MLCActivationDescriptor descriptorWithType:a:b:](MLCActivationDescriptor, "descriptorWithType:a:b:", 20);
  v6 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v5];

  return (MLCActivationLayer *)v6;
}

+ (MLCActivationLayer)layerWithDescriptor:(MLCActivationDescriptor *)descriptor
{
  double v4 = descriptor;
  v5 = (void *)[objc_alloc((Class)a1) initWithDescriptor:v4];

  return (MLCActivationLayer *)v5;
}

- (MLCActivationLayer)initWithDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MLCActivationLayer;
  v6 = [(MLCLayer *)&v9 initWithLabel:@"Activation"];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_descriptor, a3);
  }

  return v7;
}

- (BOOL)compileForDevice:(id)a3 sourceTensors:(id)a4 resultTensor:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(MLCActivationLayer *)self descriptor];
  v13 = [v10 objectAtIndexedSubscript:0];
  v14 = [v13 descriptor];
  uint64_t v15 = [v14 dataType];

  if (!+[MLCLayer supportsDataType:v15 onDevice:v9])
  {
    v23 = +[MLCLog framework];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v31 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v35 = v31;
      __int16 v36 = 1024;
      int v37 = v15;
      __int16 v38 = 2112;
      id v39 = v9;
      _os_log_error_impl(&dword_1DD0C9000, v23, OS_LOG_TYPE_ERROR, "%@: activation layer with data type = %d is not supported on a device = %@", buf, 0x1Cu);
    }
    goto LABEL_20;
  }
  v16 = [(MLCLayer *)self fusedLayers];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    int v33 = 0;
    *(_DWORD *)buf = 0;
    v18 = [(MLCLayer *)self fusedLayers];
    v19 = (void *)[v18 mutableCopy];

    if (+[MLCPatternMatcher canTransformToReLUNFromLayer:self stopGradientTensorList:0 fusedLayers:v19 alpha:buf beta:&v33])
    {
      LODWORD(v21) = v33;
      LODWORD(v20) = *(_DWORD *)buf;
      uint64_t v22 = +[MLCActivationDescriptor descriptorWithType:10 a:v20 b:v21];
    }
    else
    {
      if (+[MLCPatternMatcher canTransformToHardSwishFromLayer:self stopGradientTensorList:0 fusedLayers:v19 inputTensor:0])
      {
        uint64_t v24 = 19;
      }
      else
      {
        if (!+[MLCPatternMatcher canTransformToGELUFromLayer:self stopGradientTensorList:0 fusedLayers:v19 inputTensor:0])
        {
          v29 = +[MLCLog framework];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
            -[MLCActivationLayer compileForDevice:sourceTensors:resultTensor:](a2);
          }
          goto LABEL_19;
        }
        uint64_t v24 = 18;
      }
      uint64_t v22 = +[MLCActivationDescriptor descriptorWithType:v24];
    }
    v25 = (void *)v22;

    v12 = v25;
  }
  v26 = [v9 computeEngine];
  v19 = [v26 neuronLayerWithDescriptor:v12];

  if (!v19 || ![v19 count])
  {
    v29 = +[MLCLog framework];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[MLCActivationLayer compileForDevice:sourceTensors:resultTensor:](a2);
    }
LABEL_19:

LABEL_20:
    char v28 = 0;
    goto LABEL_21;
  }
  v27 = [v9 computeEngine];
  char v28 = [v27 compileLayerDeviceOps:v19 sourceTensors:v10 resultTensor:v11];

  v32.receiver = self;
  v32.super_class = (Class)MLCActivationLayer;
  [(MLCLayer *)&v32 bindDevice:v9 deviceOps:v19];

LABEL_21:
  return v28;
}

- (id)resultTensorFromSources:(id)a3
{
  id v3 = a3;
  double v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  for (unint64_t i = 0; ; ++i)
  {
    v6 = [v3 objectAtIndexedSubscript:0];
    v7 = [v6 descriptor];
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
  uint64_t v17 = +[MLCTensorDescriptor descriptorWithShape:dataType:](MLCTensorDescriptor, "descriptorWithShape:dataType:", v14, [v16 dataType]);

  v18 = +[MLCTensor tensorWithDescriptor:v17];

  return v18;
}

- (id)description
{
  id v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(MLCActivationLayer *)self descriptor];
  [v6 a];
  double v8 = v7;
  unint64_t v9 = [(MLCActivationLayer *)self descriptor];
  [v9 b];
  double v11 = v10;
  v12 = [(MLCActivationLayer *)self descriptor];
  [v12 c];
  double v14 = v13;
  uint64_t v15 = [(MLCActivationLayer *)self descriptor];
  v16 = [(MLCLayer *)self conditionalTreeNode];
  uint64_t v17 = [(MLCLayer *)self resultTensors];
  v18 = [v3 stringWithFormat:@"%@: { a=%f : b=%f : c=%f : descriptor=%@ : conditionalTreeNode=%@ : resultTensor=%@ }", v5, *(void *)&v8, *(void *)&v11, *(void *)&v14, v15, v16, v17];

  return v18;
}

- (id)summarizedDOTDescription
{
  id v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  NSUInteger v6 = [(MLCLayer *)self layerID];
  float v7 = [(MLCActivationLayer *)self descriptor];
  double v8 = MLCActivationTypeDebugDescription((MLCActivationType)[v7 activationType]);
  unint64_t v9 = [(MLCActivationLayer *)self descriptor];
  [v9 a];
  double v11 = v10;
  v12 = [(MLCActivationLayer *)self descriptor];
  [v12 b];
  double v14 = v13;
  uint64_t v15 = [(MLCActivationLayer *)self descriptor];
  [v15 c];
  uint64_t v17 = [v3 stringWithFormat:@"<%@ (%lu)<BR /><FONT POINT-SIZE=\"10\">Activation Type: %@<BR />a: %.03f    b: %.03f    c: %.03f</FONT>>", v5, v6, v8, *(void *)&v11, *(void *)&v14, v16];

  return v17;
}

- (BOOL)isSupportedShapeForTensorSources:(id)a3
{
  return 1;
}

- (MLCActivationDescriptor)descriptor
{
  return self->_descriptor;
}

- (void).cxx_destruct
{
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.1(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);
}

- (void)compileForDevice:(const char *)a1 sourceTensors:resultTensor:.cold.2(const char *a1)
{
  v1 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_1_1(&dword_1DD0C9000, v2, v3, "%@: failure to create deviceOps=%@", v4, v5, v6, v7, v8);
}

@end