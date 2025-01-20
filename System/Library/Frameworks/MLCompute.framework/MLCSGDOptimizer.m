@interface MLCSGDOptimizer
+ (MLCSGDOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor;
+ (MLCSGDOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor momentumScale:(float)momentumScale usesNesterovMomentum:(BOOL)usesNesterovMomentum;
- (BOOL)compileForDevice:(id)a3;
- (BOOL)usesNesterovMomentum;
- (MLCOptimizerDescriptor)optimizerDescriptor;
- (MLCSGDOptimizer)initWithMomentumScale:(float)a3 useNesterovMomentum:(BOOL)a4 optimizerDescriptor:(id)a5;
- (NSString)description;
- (float)momentumScale;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation MLCSGDOptimizer

+ (MLCSGDOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor
{
  v4 = optimizerDescriptor;
  v5 = (void *)[objc_alloc((Class)a1) initWithMomentumScale:0 useNesterovMomentum:v4 optimizerDescriptor:0.0];

  return (MLCSGDOptimizer *)v5;
}

+ (MLCSGDOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor momentumScale:(float)momentumScale usesNesterovMomentum:(BOOL)usesNesterovMomentum
{
  BOOL v5 = usesNesterovMomentum;
  v8 = optimizerDescriptor;
  id v9 = objc_alloc((Class)a1);
  *(float *)&double v10 = momentumScale;
  v11 = (void *)[v9 initWithMomentumScale:v5 useNesterovMomentum:v8 optimizerDescriptor:v10];

  return (MLCSGDOptimizer *)v11;
}

- (MLCSGDOptimizer)initWithMomentumScale:(float)a3 useNesterovMomentum:(BOOL)a4 optimizerDescriptor:(id)a5
{
  id v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)MLCSGDOptimizer;
  double v10 = [(MLCOptimizer *)&v14 initWithDescriptor:v9];
  v11 = v10;
  if (v10)
  {
    v10->_momentumScale = a3;
    v10->_usesNesterovMomentum = a4;
    objc_storeStrong((id *)&v10->_optimizerDescriptor, a5);
    v13.receiver = v11;
    v13.super_class = (Class)MLCSGDOptimizer;
    [(MLCOptimizer *)&v13 setNumOptimizerDataBuffers:1];
  }

  return v11;
}

- (BOOL)compileForDevice:(id)a3
{
  id v5 = a3;
  v6 = [v5 computeEngine];
  v7 = [(MLCSGDOptimizer *)self optimizerDescriptor];
  [(MLCSGDOptimizer *)self momentumScale];
  int v9 = v8;
  BOOL v10 = [(MLCSGDOptimizer *)self usesNesterovMomentum];
  LODWORD(v11) = v9;
  v12 = [v6 optimizerSGDWithDescriptor:v7 momentunScale:v10 useNesterovMomentum:v11];

  if (v12 && [v12 count])
  {
    objc_super v13 = [v5 computeEngine];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [v5 computeEngine];
      char v16 = [v15 compileOptimizerDeviceOps:v12];
    }
    else
    {
      char v16 = 1;
    }
    v19.receiver = self;
    v19.super_class = (Class)MLCSGDOptimizer;
    [(MLCOptimizer *)&v19 bindDevice:v5 deviceOps:v12];
  }
  else
  {
    v17 = +[MLCLog framework];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v12, v17);
    }

    char v16 = 0;
  }

  return v16;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [(MLCSGDOptimizer *)self momentumScale];
  double v7 = v6;
  BOOL v8 = [(MLCSGDOptimizer *)self usesNesterovMomentum];
  int v9 = [(MLCSGDOptimizer *)self optimizerDescriptor];
  BOOL v10 = [v3 stringWithFormat:@"%@: { momentumScale=%f : useNesterovMomentum=%d : optimizerDescriptor=%@ }", v5, *(void *)&v7, v8, v9];

  return (NSString *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(MLCSGDOptimizer *)self momentumScale];
  int v6 = v5;
  BOOL v7 = [(MLCSGDOptimizer *)self usesNesterovMomentum];
  BOOL v8 = [(MLCSGDOptimizer *)self optimizerDescriptor];
  LODWORD(v9) = v6;
  BOOL v10 = (void *)[v4 initWithMomentumScale:v7 useNesterovMomentum:v8 optimizerDescriptor:v9];

  return v10;
}

- (float)momentumScale
{
  return self->_momentumScale;
}

- (BOOL)usesNesterovMomentum
{
  return self->_usesNesterovMomentum;
}

- (MLCOptimizerDescriptor)optimizerDescriptor
{
  return self->_optimizerDescriptor;
}

- (void).cxx_destruct
{
}

@end