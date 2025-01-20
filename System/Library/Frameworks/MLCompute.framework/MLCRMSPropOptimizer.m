@interface MLCRMSPropOptimizer
+ (MLCRMSPropOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor;
+ (MLCRMSPropOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor momentumScale:(float)momentumScale alpha:(float)alpha epsilon:(float)epsilon isCentered:(BOOL)isCentered;
- (BOOL)compileForDevice:(id)a3;
- (BOOL)isCentered;
- (MLCOptimizerDescriptor)optimizerDescriptor;
- (MLCRMSPropOptimizer)initWithDescriptor:(id)a3 momentumScale:(float)a4 alpha:(float)a5 epsilon:(float)a6 centered:(BOOL)a7;
- (NSString)description;
- (float)alpha;
- (float)epsilon;
- (float)momentumScale;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MLCRMSPropOptimizer

+ (MLCRMSPropOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor
{
  v4 = optimizerDescriptor;
  id v5 = objc_alloc((Class)a1);
  LODWORD(v6) = 1065185444;
  LODWORD(v7) = 841731191;
  v8 = (void *)[v5 initWithDescriptor:v4 momentumScale:0 alpha:0.0 epsilon:v6 centered:v7];

  return (MLCRMSPropOptimizer *)v8;
}

+ (MLCRMSPropOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor momentumScale:(float)momentumScale alpha:(float)alpha epsilon:(float)epsilon isCentered:(BOOL)isCentered
{
  BOOL v7 = isCentered;
  v12 = optimizerDescriptor;
  id v13 = objc_alloc((Class)a1);
  *(float *)&double v14 = momentumScale;
  *(float *)&double v15 = alpha;
  *(float *)&double v16 = epsilon;
  v17 = (void *)[v13 initWithDescriptor:v12 momentumScale:v7 alpha:v14 epsilon:v15 centered:v16];

  return (MLCRMSPropOptimizer *)v17;
}

- (MLCRMSPropOptimizer)initWithDescriptor:(id)a3 momentumScale:(float)a4 alpha:(float)a5 epsilon:(float)a6 centered:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MLCRMSPropOptimizer;
  double v14 = [(MLCOptimizer *)&v24 initWithDescriptor:v13];
  double v15 = v14;
  if (v14)
  {
    v14->_momentumScale = a4;
    v14->_alpha = a5;
    v14->_epsilon = a6;
    v14->_isCentered = v7;
    objc_storeStrong((id *)&v14->_optimizerDescriptor, a3);
    v23.receiver = v15;
    v23.super_class = (Class)MLCRMSPropOptimizer;
    [(MLCOptimizer *)&v23 setNumOptimizerDataBuffers:1];
    if (v7)
    {
      v22.receiver = v15;
      v22.super_class = (Class)MLCRMSPropOptimizer;
      double v16 = [(MLCOptimizer *)&v22 numOptimizerDataBuffers];
      v21.receiver = v15;
      v21.super_class = (Class)MLCRMSPropOptimizer;
      [(MLCOptimizer *)&v21 setNumOptimizerDataBuffers:v16 + 1];
    }
    if (a4 > 0.0)
    {
      v20.receiver = v15;
      v20.super_class = (Class)MLCRMSPropOptimizer;
      v17 = [(MLCOptimizer *)&v20 numOptimizerDataBuffers];
      v19.receiver = v15;
      v19.super_class = (Class)MLCRMSPropOptimizer;
      [(MLCOptimizer *)&v19 setNumOptimizerDataBuffers:v17 + 1];
    }
  }

  return v15;
}

- (BOOL)compileForDevice:(id)a3
{
  id v5 = a3;
  double v6 = [v5 computeEngine];
  BOOL v7 = [(MLCRMSPropOptimizer *)self optimizerDescriptor];
  [(MLCRMSPropOptimizer *)self momentumScale];
  int v9 = v8;
  [(MLCRMSPropOptimizer *)self alpha];
  int v11 = v10;
  [(MLCRMSPropOptimizer *)self epsilon];
  int v13 = v12;
  BOOL v14 = [(MLCRMSPropOptimizer *)self isCentered];
  LODWORD(v15) = v9;
  LODWORD(v16) = v11;
  LODWORD(v17) = v13;
  v18 = [v6 optimizerRMSPropWithDescriptor:v7 momentumScale:v14 alpha:v15 epsilon:v16 centered:v17];

  if (v18 && [v18 count])
  {
    objc_super v19 = [v5 computeEngine];
    char v20 = objc_opt_respondsToSelector();

    if (v20)
    {
      objc_super v21 = [v5 computeEngine];
      char v22 = [v21 compileOptimizerDeviceOps:v18];
    }
    else
    {
      char v22 = 1;
    }
    v25.receiver = self;
    v25.super_class = (Class)MLCRMSPropOptimizer;
    [(MLCOptimizer *)&v25 bindDevice:v5 deviceOps:v18];
  }
  else
  {
    objc_super v23 = +[MLCLog framework];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v18, v23);
    }

    char v22 = 0;
  }

  return v22;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [(MLCRMSPropOptimizer *)self momentumScale];
  double v7 = v6;
  [(MLCRMSPropOptimizer *)self alpha];
  double v9 = v8;
  [(MLCRMSPropOptimizer *)self epsilon];
  double v11 = v10;
  BOOL v12 = [(MLCRMSPropOptimizer *)self isCentered];
  int v13 = [(MLCRMSPropOptimizer *)self optimizerDescriptor];
  BOOL v14 = [v3 stringWithFormat:@"%@: { momentumScale=%f : alpha=%f : epsilon=%f : centered=%d : optimizerDescriptor=%@ }", v5, *(void *)&v7, *(void *)&v9, *(void *)&v11, v12, v13];

  return (NSString *)v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(MLCRMSPropOptimizer *)self optimizerDescriptor];
  [(MLCRMSPropOptimizer *)self momentumScale];
  int v7 = v6;
  [(MLCRMSPropOptimizer *)self alpha];
  int v9 = v8;
  [(MLCRMSPropOptimizer *)self epsilon];
  int v11 = v10;
  BOOL v12 = [(MLCRMSPropOptimizer *)self isCentered];
  LODWORD(v13) = v7;
  LODWORD(v14) = v9;
  LODWORD(v15) = v11;
  double v16 = (void *)[v4 initWithDescriptor:v5 momentumScale:v12 alpha:v13 epsilon:v14 centered:v15];

  return v16;
}

- (float)momentumScale
{
  return self->_momentumScale;
}

- (float)alpha
{
  return self->_alpha;
}

- (float)epsilon
{
  return self->_epsilon;
}

- (BOOL)isCentered
{
  return self->_isCentered;
}

- (MLCOptimizerDescriptor)optimizerDescriptor
{
  return self->_optimizerDescriptor;
}

- (void).cxx_destruct
{
}

@end