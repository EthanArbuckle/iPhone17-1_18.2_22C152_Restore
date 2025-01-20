@interface MLCOptimizer
- (BOOL)appliesGradientClipping;
- (MLCDevice)device;
- (MLCGradientClippingType)gradientClippingType;
- (MLCOptimizer)initWithDescriptor:(id)a3;
- (MLCOptimizer)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationScale:(float)a8 regularizationType:(int)a9;
- (MLCOptimizer)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationScale:(float)a8 regularizationType:(int)a9 gradientClippingType:(int)a10 maximumClippingNorm:(float)a11 customGlobalNorm:(float)a12;
- (MLCRegularizationType)regularizationType;
- (NSArray)deviceOps;
- (NSMutableArray)oneStepOptimizerBuffers;
- (float)customGlobalNorm;
- (float)gradientClipMax;
- (float)gradientClipMin;
- (float)gradientRescale;
- (float)learningRate;
- (float)maximumClippingNorm;
- (float)regularizationScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)numOptimizerDataBuffers;
- (void)bindDevice:(id)a3 deviceOps:(id)a4;
- (void)setAppliesGradientClipping:(BOOL)appliesGradientClipping;
- (void)setDevice:(id)a3;
- (void)setDeviceOps:(id)a3;
- (void)setLearningRate:(float)learningRate;
- (void)setNumOptimizerDataBuffers:(unint64_t)a3;
- (void)setOneStepOptimizerBuffers:(id)a3;
@end

@implementation MLCOptimizer

- (MLCOptimizer)initWithDescriptor:(id)a3
{
  id v4 = a3;
  [v4 learningRate];
  int v6 = v5;
  [v4 gradientRescale];
  int v8 = v7;
  uint64_t v9 = [v4 appliesGradientClipping];
  [v4 gradientClipMax];
  int v11 = v10;
  [v4 gradientClipMin];
  int v13 = v12;
  [v4 regularizationScale];
  int v15 = v14;
  uint64_t v16 = [v4 regularizationType];
  uint64_t v17 = [v4 gradientClippingType];
  [v4 maximumClippingNorm];
  int v19 = v18;
  [v4 customGlobalNorm];
  int v21 = v20;

  LODWORD(v22) = v6;
  LODWORD(v23) = v8;
  LODWORD(v24) = v11;
  LODWORD(v25) = v13;
  LODWORD(v26) = v15;
  LODWORD(v27) = v19;
  LODWORD(v28) = v21;

  return [(MLCOptimizer *)self initWithLearningRate:v9 gradientRescale:v16 applyGradientClipping:v17 gradientClipMax:v22 gradientClipMin:v23 regularizationScale:v24 regularizationType:v25 gradientClippingType:v26 maximumClippingNorm:v27 customGlobalNorm:v28];
}

- (MLCOptimizer)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationScale:(float)a8 regularizationType:(int)a9 gradientClippingType:(int)a10 maximumClippingNorm:(float)a11 customGlobalNorm:(float)a12
{
  v23.receiver = self;
  v23.super_class = (Class)MLCOptimizer;
  result = [(MLCOptimizer *)&v23 init];
  if (result)
  {
    result->_learningRate = a3;
    result->_gradientRescale = a4;
    result->_appliesGradientClipping = a5;
    result->_gradientClipMax = a6;
    result->_gradientClipMin = a7;
    result->_regularizationScale = a8;
    result->_numOptimizerDataBuffers = 0;
    result->_regularizationType = a9;
    result->_gradientClippingType = a10;
    result->_maximumClippingNorm = a11;
    result->_customGlobalNorm = a12;
  }
  return result;
}

- (MLCOptimizer)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationScale:(float)a8 regularizationType:(int)a9
{
  v17.receiver = self;
  v17.super_class = (Class)MLCOptimizer;
  result = [(MLCOptimizer *)&v17 init];
  if (result)
  {
    result->_learningRate = a3;
    result->_gradientRescale = a4;
    result->_appliesGradientClipping = a5;
    result->_gradientClipMax = a6;
    result->_gradientClipMin = a7;
    result->_regularizationScale = a8;
    result->_regularizationType = a9;
    result->_numOptimizerDataBuffers = 0;
  }
  return result;
}

- (void)bindDevice:(id)a3 deviceOps:(id)a4
{
  id v6 = a4;
  [(MLCOptimizer *)self setDevice:a3];
  [(MLCOptimizer *)self setDeviceOps:v6];

  [(MLCOptimizer *)self setOneStepOptimizerBuffers:0];
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  int v5 = NSStringFromClass(v4);
  id v6 = [(MLCOptimizer *)self device];
  [(MLCOptimizer *)self learningRate];
  double v8 = v7;
  [(MLCOptimizer *)self gradientRescale];
  double v10 = v9;
  BOOL v11 = [(MLCOptimizer *)self appliesGradientClipping];
  [(MLCOptimizer *)self gradientClipMax];
  double v13 = v12;
  [(MLCOptimizer *)self gradientClipMin];
  double v15 = v14;
  [(MLCOptimizer *)self regularizationScale];
  double v17 = v16;
  uint64_t v18 = [(MLCOptimizer *)self regularizationType];
  int v19 = [(MLCOptimizer *)self deviceOps];
  uint64_t v20 = [(MLCOptimizer *)self gradientClippingType];
  [(MLCOptimizer *)self maximumClippingNorm];
  double v22 = v21;
  [(MLCOptimizer *)self customGlobalNorm];
  double v24 = [v3 stringWithFormat:@"%@: { device=%@ : learningRate=%f : gradientRescale=%f : applyGradientClipping=%d : gradientClipMax=%f : gradientClipMin=%f : regularizationScale=%f : regularizationType=%d : deviceOps=%@ : gradientClippingType=%d : maximumClippingNorm=%f : customGlobalNorm=%f}", v5, v6, *(void *)&v8, *(void *)&v10, v11, *(void *)&v13, *(void *)&v15, *(void *)&v17, v18, v19, v20, *(void *)&v22, v23];

  return v24;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(MLCOptimizer *)self learningRate];
  int v6 = v5;
  [(MLCOptimizer *)self gradientRescale];
  int v8 = v7;
  BOOL v9 = [(MLCOptimizer *)self appliesGradientClipping];
  [(MLCOptimizer *)self gradientClipMax];
  int v11 = v10;
  [(MLCOptimizer *)self gradientClipMin];
  int v13 = v12;
  [(MLCOptimizer *)self regularizationScale];
  int v15 = v14;
  uint64_t v16 = [(MLCOptimizer *)self regularizationType];
  uint64_t v17 = [(MLCOptimizer *)self gradientClippingType];
  [(MLCOptimizer *)self maximumClippingNorm];
  int v19 = v18;
  [(MLCOptimizer *)self customGlobalNorm];
  LODWORD(v20) = LODWORD(v21);
  LODWORD(v21) = v6;
  LODWORD(v22) = v8;
  LODWORD(v23) = v11;
  LODWORD(v24) = v13;
  LODWORD(v25) = v15;
  LODWORD(v26) = v19;

  return (id)[v4 initWithLearningRate:v9 gradientRescale:v16 applyGradientClipping:v17 gradientClipMax:v21 gradientClipMin:v22 regularizationScale:v23 regularizationType:v24 gradientClippingType:v25 maximumClippingNorm:v26 customGlobalNorm:v20];
}

- (float)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(float)learningRate
{
  self->_learningRate = learningRate;
}

- (float)gradientRescale
{
  return self->_gradientRescale;
}

- (BOOL)appliesGradientClipping
{
  return self->_appliesGradientClipping;
}

- (void)setAppliesGradientClipping:(BOOL)appliesGradientClipping
{
  self->_appliesGradientClipping = appliesGradientClipping;
}

- (float)gradientClipMax
{
  return self->_gradientClipMax;
}

- (float)gradientClipMin
{
  return self->_gradientClipMin;
}

- (float)regularizationScale
{
  return self->_regularizationScale;
}

- (MLCRegularizationType)regularizationType
{
  return self->_regularizationType;
}

- (MLCGradientClippingType)gradientClippingType
{
  return self->_gradientClippingType;
}

- (float)maximumClippingNorm
{
  return self->_maximumClippingNorm;
}

- (float)customGlobalNorm
{
  return self->_customGlobalNorm;
}

- (MLCDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSArray)deviceOps
{
  return self->_deviceOps;
}

- (void)setDeviceOps:(id)a3
{
}

- (unint64_t)numOptimizerDataBuffers
{
  return self->_numOptimizerDataBuffers;
}

- (void)setNumOptimizerDataBuffers:(unint64_t)a3
{
  self->_numOptimizerDataBuffers = a3;
}

- (NSMutableArray)oneStepOptimizerBuffers
{
  return self->_oneStepOptimizerBuffers;
}

- (void)setOneStepOptimizerBuffers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oneStepOptimizerBuffers, 0);
  objc_storeStrong((id *)&self->_deviceOps, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end