@interface MLCAdamOptimizer
+ (MLCAdamOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor;
+ (MLCAdamOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor beta1:(float)beta1 beta2:(float)beta2 epsilon:(float)epsilon timeStep:(NSUInteger)timeStep;
+ (MLCAdamOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor beta1:(float)beta1 beta2:(float)beta2 epsilon:(float)epsilon usesAMSGrad:(BOOL)usesAMSGrad timeStep:(NSUInteger)timeStep;
- (BOOL)compileForDevice:(id)a3;
- (BOOL)usesAMSGrad;
- (MLCAdamOptimizer)initWithDescriptor:(id)a3 beta1:(float)a4 beta2:(float)a5 epsilon:(float)a6 usesAMSGrad:(BOOL)a7 timeStep:(unint64_t)a8;
- (MLCOptimizerDescriptor)optimizerDescriptor;
- (NSString)description;
- (NSUInteger)timeStep;
- (float)beta1;
- (float)beta2;
- (float)epsilon;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setTimeStep:(unint64_t)a3;
@end

@implementation MLCAdamOptimizer

+ (MLCAdamOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor
{
  v4 = optimizerDescriptor;
  id v5 = objc_alloc((Class)a1);
  LODWORD(v6) = 1063675494;
  LODWORD(v7) = 1065336439;
  LODWORD(v8) = 841731191;
  v9 = (void *)[v5 initWithDescriptor:v4 beta1:0 beta2:1 epsilon:v6 usesAMSGrad:v7 timeStep:v8];

  return (MLCAdamOptimizer *)v9;
}

+ (MLCAdamOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor beta1:(float)beta1 beta2:(float)beta2 epsilon:(float)epsilon timeStep:(NSUInteger)timeStep
{
  v12 = optimizerDescriptor;
  id v13 = objc_alloc((Class)a1);
  *(float *)&double v14 = beta1;
  *(float *)&double v15 = beta2;
  *(float *)&double v16 = epsilon;
  v17 = (void *)[v13 initWithDescriptor:v12 beta1:0 beta2:timeStep epsilon:v14 usesAMSGrad:v15 timeStep:v16];

  return (MLCAdamOptimizer *)v17;
}

+ (MLCAdamOptimizer)optimizerWithDescriptor:(MLCOptimizerDescriptor *)optimizerDescriptor beta1:(float)beta1 beta2:(float)beta2 epsilon:(float)epsilon usesAMSGrad:(BOOL)usesAMSGrad timeStep:(NSUInteger)timeStep
{
  BOOL v9 = usesAMSGrad;
  double v14 = optimizerDescriptor;
  id v15 = objc_alloc((Class)a1);
  *(float *)&double v16 = beta1;
  *(float *)&double v17 = beta2;
  *(float *)&double v18 = epsilon;
  v19 = (void *)[v15 initWithDescriptor:v14 beta1:v9 beta2:timeStep epsilon:v16 usesAMSGrad:v17 timeStep:v18];

  return (MLCAdamOptimizer *)v19;
}

- (MLCAdamOptimizer)initWithDescriptor:(id)a3 beta1:(float)a4 beta2:(float)a5 epsilon:(float)a6 usesAMSGrad:(BOOL)a7 timeStep:(unint64_t)a8
{
  BOOL v9 = a7;
  id v15 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MLCAdamOptimizer;
  double v16 = [(MLCOptimizer *)&v21 initWithDescriptor:v15];
  double v17 = v16;
  if (v16)
  {
    v16->_beta1 = a4;
    v16->_beta2 = a5;
    v16->_epsilon = a6;
    v16->_usesAMSGrad = v9;
    v16->_timeStep = a8;
    objc_storeStrong((id *)&v16->_optimizerDescriptor, a3);
    if (v9) {
      uint64_t v18 = 3;
    }
    else {
      uint64_t v18 = 2;
    }
    v20.receiver = v17;
    v20.super_class = (Class)MLCAdamOptimizer;
    [(MLCOptimizer *)&v20 setNumOptimizerDataBuffers:v18];
  }

  return v17;
}

- (BOOL)compileForDevice:(id)a3
{
  id v5 = a3;
  double v6 = [v5 computeEngine];
  double v7 = [(MLCAdamOptimizer *)self optimizerDescriptor];
  [(MLCAdamOptimizer *)self beta1];
  int v9 = v8;
  [(MLCAdamOptimizer *)self beta2];
  int v11 = v10;
  [(MLCAdamOptimizer *)self epsilon];
  int v13 = v12;
  BOOL v14 = [(MLCAdamOptimizer *)self usesAMSGrad];
  NSUInteger v15 = [(MLCAdamOptimizer *)self timeStep];
  LODWORD(v16) = v9;
  LODWORD(v17) = v11;
  LODWORD(v18) = v13;
  v19 = [v6 optimizerAdamWithDescriptor:v7 beta1:v14 beta2:v15 epsilon:0 amsgrad:v16 timeStep:v17 isAdamW:v18];

  if (v19 && [v19 count])
  {
    objc_super v20 = [v5 computeEngine];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      v22 = [v5 computeEngine];
      char v23 = [v22 compileOptimizerDeviceOps:v19];
    }
    else
    {
      char v23 = 1;
    }
    v26.receiver = self;
    v26.super_class = (Class)MLCAdamOptimizer;
    [(MLCOptimizer *)&v26 bindDevice:v5 deviceOps:v19];
  }
  else
  {
    v24 = +[MLCLog framework];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[MLCPoolingLayer compileForDevice:sourceTensors:resultTensor:](a2, (uint64_t)v19, v24);
    }

    char v23 = 0;
  }

  return v23;
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [(MLCAdamOptimizer *)self beta1];
  double v7 = v6;
  [(MLCAdamOptimizer *)self beta2];
  double v9 = v8;
  [(MLCAdamOptimizer *)self epsilon];
  double v11 = v10;
  BOOL v12 = [(MLCAdamOptimizer *)self usesAMSGrad];
  NSUInteger v13 = [(MLCAdamOptimizer *)self timeStep];
  BOOL v14 = [(MLCAdamOptimizer *)self optimizerDescriptor];
  NSUInteger v15 = [v3 stringWithFormat:@"%@: { beta1=%f : beta2=%f : epsilon=%f : usesAMSGrad=%d : timeStep=%lu : optimizerDescriptor=%@ }", v5, *(void *)&v7, *(void *)&v9, *(void *)&v11, v12, v13, v14];

  return (NSString *)v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  id v5 = [(MLCAdamOptimizer *)self optimizerDescriptor];
  [(MLCAdamOptimizer *)self beta1];
  int v7 = v6;
  [(MLCAdamOptimizer *)self beta2];
  int v9 = v8;
  [(MLCAdamOptimizer *)self epsilon];
  int v11 = v10;
  BOOL v12 = [(MLCAdamOptimizer *)self usesAMSGrad];
  NSUInteger v13 = [(MLCAdamOptimizer *)self timeStep];
  LODWORD(v14) = v7;
  LODWORD(v15) = v9;
  LODWORD(v16) = v11;
  double v17 = (void *)[v4 initWithDescriptor:v5 beta1:v12 beta2:v13 epsilon:v14 usesAMSGrad:v15 timeStep:v16];

  return v17;
}

- (float)beta1
{
  return self->_beta1;
}

- (float)beta2
{
  return self->_beta2;
}

- (float)epsilon
{
  return self->_epsilon;
}

- (BOOL)usesAMSGrad
{
  return self->_usesAMSGrad;
}

- (NSUInteger)timeStep
{
  return self->_timeStep;
}

- (void)setTimeStep:(unint64_t)a3
{
  self->_timeStep = a3;
}

- (MLCOptimizerDescriptor)optimizerDescriptor
{
  return self->_optimizerDescriptor;
}

- (void).cxx_destruct
{
}

@end