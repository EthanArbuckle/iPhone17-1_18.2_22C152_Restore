@interface MLCOptimizerDescriptor
+ (MLCOptimizerDescriptor)descriptorWithLearningRate:(float)learningRate gradientRescale:(float)gradientRescale appliesGradientClipping:(BOOL)appliesGradientClipping gradientClipMax:(float)gradientClipMax gradientClipMin:(float)gradientClipMin regularizationType:(MLCRegularizationType)regularizationType regularizationScale:(float)regularizationScale;
+ (MLCOptimizerDescriptor)descriptorWithLearningRate:(float)learningRate gradientRescale:(float)gradientRescale appliesGradientClipping:(BOOL)appliesGradientClipping gradientClippingType:(MLCGradientClippingType)gradientClippingType gradientClipMax:(float)gradientClipMax gradientClipMin:(float)gradientClipMin maximumClippingNorm:(float)maximumClippingNorm customGlobalNorm:(float)customGlobalNorm regularizationType:(MLCRegularizationType)regularizationType regularizationScale:(float)regularizationScale;
+ (MLCOptimizerDescriptor)descriptorWithLearningRate:(float)learningRate gradientRescale:(float)gradientRescale regularizationType:(MLCRegularizationType)regularizationType regularizationScale:(float)regularizationScale;
- (BOOL)appliesGradientClipping;
- (BOOL)isEqual:(id)a3;
- (MLCGradientClippingType)gradientClippingType;
- (MLCOptimizerDescriptor)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationType:(int)a8 regularizationScale:(float)a9;
- (MLCOptimizerDescriptor)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationType:(int)a8 regularizationScale:(float)a9 gradientClippingType:(int)a10 maximumClippingNorm:(float)a11 customGlobalNorm:(float)a12;
- (MLCRegularizationType)regularizationType;
- (float)customGlobalNorm;
- (float)gradientClipMax;
- (float)gradientClipMin;
- (float)gradientRescale;
- (float)learningRate;
- (float)maximumClippingNorm;
- (float)regularizationScale;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation MLCOptimizerDescriptor

+ (MLCOptimizerDescriptor)descriptorWithLearningRate:(float)learningRate gradientRescale:(float)gradientRescale regularizationType:(MLCRegularizationType)regularizationType regularizationScale:(float)regularizationScale
{
  uint64_t v7 = *(void *)&regularizationType;
  v10 = [MLCOptimizerDescriptor alloc];
  LODWORD(v11) = 1.0;
  LODWORD(v12) = -1.0;
  LODWORD(v13) = 1.0;
  LODWORD(v14) = 1.0;
  *(float *)&double v15 = learningRate;
  *(float *)&double v16 = gradientRescale;
  *(float *)&double v17 = regularizationScale;
  v18 = [(MLCOptimizerDescriptor *)v10 initWithLearningRate:0 gradientRescale:v7 applyGradientClipping:0 gradientClipMax:v15 gradientClipMin:v16 regularizationType:v11 regularizationScale:v12 gradientClippingType:v17 maximumClippingNorm:v13 customGlobalNorm:v14];

  return v18;
}

+ (MLCOptimizerDescriptor)descriptorWithLearningRate:(float)learningRate gradientRescale:(float)gradientRescale appliesGradientClipping:(BOOL)appliesGradientClipping gradientClipMax:(float)gradientClipMax gradientClipMin:(float)gradientClipMin regularizationType:(MLCRegularizationType)regularizationType regularizationScale:(float)regularizationScale
{
  uint64_t v10 = *(void *)&regularizationType;
  BOOL v13 = appliesGradientClipping;
  double v16 = [MLCOptimizerDescriptor alloc];
  LODWORD(v17) = 1.0;
  LODWORD(v18) = 1.0;
  *(float *)&double v19 = learningRate;
  *(float *)&double v20 = gradientRescale;
  *(float *)&double v21 = gradientClipMax;
  *(float *)&double v22 = gradientClipMin;
  *(float *)&double v23 = regularizationScale;
  v24 = [(MLCOptimizerDescriptor *)v16 initWithLearningRate:v13 gradientRescale:v10 applyGradientClipping:0 gradientClipMax:v19 gradientClipMin:v20 regularizationType:v21 regularizationScale:v22 gradientClippingType:v23 maximumClippingNorm:v17 customGlobalNorm:v18];

  return v24;
}

+ (MLCOptimizerDescriptor)descriptorWithLearningRate:(float)learningRate gradientRescale:(float)gradientRescale appliesGradientClipping:(BOOL)appliesGradientClipping gradientClippingType:(MLCGradientClippingType)gradientClippingType gradientClipMax:(float)gradientClipMax gradientClipMin:(float)gradientClipMin maximumClippingNorm:(float)maximumClippingNorm customGlobalNorm:(float)customGlobalNorm regularizationType:(MLCRegularizationType)regularizationType regularizationScale:(float)regularizationScale
{
  uint64_t v13 = *(void *)&regularizationType;
  uint64_t v18 = *(void *)&gradientClippingType;
  BOOL v19 = appliesGradientClipping;
  double v22 = [MLCOptimizerDescriptor alloc];
  *(float *)&double v23 = learningRate;
  *(float *)&double v24 = gradientRescale;
  *(float *)&double v25 = gradientClipMax;
  *(float *)&double v26 = gradientClipMin;
  *(float *)&double v27 = regularizationScale;
  *(float *)&double v28 = maximumClippingNorm;
  *(float *)&double v29 = customGlobalNorm;
  v30 = [(MLCOptimizerDescriptor *)v22 initWithLearningRate:v19 gradientRescale:v13 applyGradientClipping:v18 gradientClipMax:v23 gradientClipMin:v24 regularizationType:v25 regularizationScale:v26 gradientClippingType:v27 maximumClippingNorm:v28 customGlobalNorm:v29];

  return v30;
}

- (MLCOptimizerDescriptor)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationType:(int)a8 regularizationScale:(float)a9 gradientClippingType:(int)a10 maximumClippingNorm:(float)a11 customGlobalNorm:(float)a12
{
  v23.receiver = self;
  v23.super_class = (Class)MLCOptimizerDescriptor;
  result = [(MLCOptimizerDescriptor *)&v23 init];
  if (result)
  {
    result->_learningRate = a3;
    result->_gradientRescale = a4;
    result->_appliesGradientClipping = a5;
    result->_gradientClipMax = a6;
    result->_gradientClipMin = a7;
    result->_regularizationScale = a9;
    result->_regularizationType = a8;
    result->_gradientClippingType = a10;
    result->_maximumClippingNorm = a11;
    result->_customGlobalNorm = a12;
  }
  return result;
}

- (MLCOptimizerDescriptor)initWithLearningRate:(float)a3 gradientRescale:(float)a4 applyGradientClipping:(BOOL)a5 gradientClipMax:(float)a6 gradientClipMin:(float)a7 regularizationType:(int)a8 regularizationScale:(float)a9
{
  v17.receiver = self;
  v17.super_class = (Class)MLCOptimizerDescriptor;
  result = [(MLCOptimizerDescriptor *)&v17 init];
  if (result)
  {
    result->_learningRate = a3;
    result->_gradientRescale = a4;
    result->_appliesGradientClipping = a5;
    result->_gradientClipMax = a6;
    result->_gradientClipMin = a7;
    result->_regularizationType = a8;
    result->_regularizationScale = a9;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  [(MLCOptimizerDescriptor *)self learningRate];
  double v7 = v6;
  [(MLCOptimizerDescriptor *)self gradientRescale];
  double v9 = v8;
  BOOL v10 = [(MLCOptimizerDescriptor *)self appliesGradientClipping];
  [(MLCOptimizerDescriptor *)self gradientClipMax];
  double v12 = v11;
  [(MLCOptimizerDescriptor *)self gradientClipMin];
  double v14 = v13;
  [(MLCOptimizerDescriptor *)self regularizationScale];
  double v16 = v15;
  uint64_t v17 = [(MLCOptimizerDescriptor *)self regularizationType];
  uint64_t v18 = [(MLCOptimizerDescriptor *)self gradientClippingType];
  [(MLCOptimizerDescriptor *)self maximumClippingNorm];
  double v20 = v19;
  [(MLCOptimizerDescriptor *)self customGlobalNorm];
  double v22 = [v3 stringWithFormat:@"%@: { learningRate=%f : gradientRescale=%f : applyGradientClipping=%d : gradientClipMax=%f : gradientClipMin=%f : regularizationScale=%f : regularizationType=%d : gradientClippingType=%d : maximumClippingNorm=%f : customGlobalNorm=%f}", v5, *(void *)&v7, *(void *)&v9, v10, *(void *)&v12, *(void *)&v14, *(void *)&v16, v17, v18, *(void *)&v20, v21];

  return v22;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [v5 learningRate];
    float v7 = v6;
    [(MLCOptimizerDescriptor *)self learningRate];
    if (v7 != v8) {
      goto LABEL_13;
    }
    [v5 gradientRescale];
    float v10 = v9;
    [(MLCOptimizerDescriptor *)self gradientRescale];
    if (v10 != v11) {
      goto LABEL_13;
    }
    int v12 = [v5 appliesGradientClipping];
    if (v12 != [(MLCOptimizerDescriptor *)self appliesGradientClipping]) {
      goto LABEL_13;
    }
    [v5 gradientClipMax];
    float v14 = v13;
    [(MLCOptimizerDescriptor *)self gradientClipMax];
    if (v14 != v15) {
      goto LABEL_13;
    }
    [v5 gradientClipMin];
    float v17 = v16;
    [(MLCOptimizerDescriptor *)self gradientClipMin];
    if (v17 != v18) {
      goto LABEL_13;
    }
    [v5 regularizationScale];
    float v20 = v19;
    [(MLCOptimizerDescriptor *)self regularizationScale];
    if (v20 != v21) {
      goto LABEL_13;
    }
    int v22 = [v5 regularizationType];
    if (v22 == [(MLCOptimizerDescriptor *)self regularizationType]
      && (int v23 = [v5 gradientClippingType],
          v23 == [(MLCOptimizerDescriptor *)self gradientClippingType])
      && ([v5 maximumClippingNorm],
          float v25 = v24,
          [(MLCOptimizerDescriptor *)self maximumClippingNorm],
          v25 == v26))
    {
      [v5 customGlobalNorm];
      float v28 = v27;
      [(MLCOptimizerDescriptor *)self customGlobalNorm];
      BOOL v30 = v28 == v29;
    }
    else
    {
LABEL_13:
      BOOL v30 = 0;
    }
  }
  else
  {
    BOOL v30 = 0;
  }

  return v30;
}

- (unint64_t)hash
{
  unint64_t v26 = 0;
  v3 = NSNumber;
  [(MLCOptimizerDescriptor *)self learningRate];
  float v25 = objc_msgSend(v3, "numberWithFloat:");
  char v23 = [v25 hash];
  id v4 = NSNumber;
  [(MLCOptimizerDescriptor *)self gradientRescale];
  float v24 = objc_msgSend(v4, "numberWithFloat:");
  [v24 hash];
  [(MLCOptimizerDescriptor *)self appliesGradientClipping];
  id v5 = NSNumber;
  [(MLCOptimizerDescriptor *)self gradientClipMax];
  int v22 = objc_msgSend(v5, "numberWithFloat:");
  [v22 hash];
  float v6 = NSNumber;
  [(MLCOptimizerDescriptor *)self gradientClipMin];
  float v7 = objc_msgSend(v6, "numberWithFloat:");
  [v7 hash];
  float v8 = NSNumber;
  [(MLCOptimizerDescriptor *)self regularizationScale];
  float v9 = objc_msgSend(v8, "numberWithFloat:");
  [v9 hash];
  [(MLCOptimizerDescriptor *)self regularizationType];
  [(MLCOptimizerDescriptor *)self gradientClippingType];
  float v10 = NSNumber;
  [(MLCOptimizerDescriptor *)self maximumClippingNorm];
  float v11 = objc_msgSend(v10, "numberWithFloat:");
  [v11 hash];
  int v12 = NSNumber;
  [(MLCOptimizerDescriptor *)self customGlobalNorm];
  float v13 = objc_msgSend(v12, "numberWithFloat:");
  [v13 hash];
  hashCombine_4(&v26, v14, v15, v16, v17, v18, v19, v20, v23);

  return v26;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(MLCOptimizerDescriptor *)self learningRate];
  int v6 = v5;
  [(MLCOptimizerDescriptor *)self gradientRescale];
  int v8 = v7;
  BOOL v9 = [(MLCOptimizerDescriptor *)self appliesGradientClipping];
  [(MLCOptimizerDescriptor *)self gradientClipMax];
  int v11 = v10;
  [(MLCOptimizerDescriptor *)self gradientClipMin];
  int v13 = v12;
  uint64_t v14 = [(MLCOptimizerDescriptor *)self regularizationType];
  [(MLCOptimizerDescriptor *)self regularizationScale];
  int v16 = v15;
  uint64_t v17 = [(MLCOptimizerDescriptor *)self gradientClippingType];
  [(MLCOptimizerDescriptor *)self maximumClippingNorm];
  int v19 = v18;
  [(MLCOptimizerDescriptor *)self customGlobalNorm];
  LODWORD(v20) = LODWORD(v21);
  LODWORD(v21) = v6;
  LODWORD(v22) = v8;
  LODWORD(v23) = v11;
  LODWORD(v24) = v13;
  LODWORD(v25) = v16;
  LODWORD(v26) = v19;

  return (id)[v4 initWithLearningRate:v9 gradientRescale:v14 applyGradientClipping:v17 gradientClipMax:v21 gradientClipMin:v22 regularizationType:v23 regularizationScale:v24 gradientClippingType:v25 maximumClippingNorm:v26 customGlobalNorm:v20];
}

- (float)learningRate
{
  return self->_learningRate;
}

- (float)gradientRescale
{
  return self->_gradientRescale;
}

- (BOOL)appliesGradientClipping
{
  return self->_appliesGradientClipping;
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

@end