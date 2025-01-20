@interface ETOptimizerDefinition
- (ETOptimizerDefinition)initWithOptimizationAlgorithm:(int64_t)a3 parameters:(id)a4 error:(id *)a5;
- (NSDictionary)optimizationParameters;
- (int64_t)type;
@end

@implementation ETOptimizerDefinition

- (void).cxx_destruct
{
}

- (NSDictionary)optimizationParameters
{
  return self->_optimizationParameters;
}

- (int64_t)type
{
  return self->_type;
}

- (ETOptimizerDefinition)initWithOptimizationAlgorithm:(int64_t)a3 parameters:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ETOptimizerDefinition;
  v9 = [(ETOptimizerDefinition *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    objc_storeStrong((id *)&v9->_optimizationParameters, a4);
  }

  return v10;
}

@end