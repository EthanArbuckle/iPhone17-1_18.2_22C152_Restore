@interface ATXCandidateRelevanceLogisticRegressionModelTrainingPlan
+ (id)stringForPMLRegularizationStrategy:(unint64_t)a3;
+ (unint64_t)regularizationStrategyForString:(id)a3;
- (ATXCandidateRelevanceLogisticRegressionModelTrainingPlan)init;
- (ATXCandidateRelevanceLogisticRegressionModelTrainingPlan)initWithIntercept:(BOOL)a3 learningRate:(float)a4 minIterations:(unint64_t)a5 stoppingThreshold:(float)a6 regularizationStrategy:(unint64_t)a7 regularizationRate:(float)a8 regularizationL1Ratio:(float)a9 weightTruncationThreshold:(float)a10;
- (ATXCandidateRelevanceLogisticRegressionModelTrainingPlan)initWithParameters:(id)a3;
- (BOOL)intercept;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXCandidateRelevanceLogisticRegressionModelTrainingPlan:(id)a3;
- (float)learningRate;
- (float)regularizationL1Ratio;
- (float)regularizationRate;
- (float)stoppingThreshold;
- (float)weightTruncationThreshold;
- (id)trainModelForDataPoints:(id)a3 candidate:(id)a4 featurizationManager:(id)a5;
- (id)truncatedWeightsForWeights:(id)a3;
- (unint64_t)minIterations;
- (unint64_t)regularizationStrategy;
@end

@implementation ATXCandidateRelevanceLogisticRegressionModelTrainingPlan

- (ATXCandidateRelevanceLogisticRegressionModelTrainingPlan)init
{
  v3 = objc_opt_new();
  v4 = [(ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *)self initWithParameters:v3];

  return v4;
}

- (ATXCandidateRelevanceLogisticRegressionModelTrainingPlan)initWithParameters:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"LogisticRegressionIntercept"];
  v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 BOOLValue];
  }
  else {
    uint64_t v7 = 1;
  }

  v8 = [v4 objectForKeyedSubscript:@"LogisticRegressionLearningRate"];
  v9 = v8;
  if (v8)
  {
    [v8 floatValue];
    int v11 = v10;
  }
  else
  {
    int v11 = 1017370378;
  }

  v12 = [v4 objectForKeyedSubscript:@"LogisticRegressionMinIterations"];
  v13 = v12;
  if (v12) {
    uint64_t v14 = (int)[v12 intValue];
  }
  else {
    uint64_t v14 = 100;
  }

  v15 = [v4 objectForKeyedSubscript:@"LogisticRegressionStoppingThreshold"];
  v16 = v15;
  if (v15)
  {
    [v15 floatValue];
    int v18 = v17;
  }
  else
  {
    int v18 = 953267991;
  }

  v19 = [v4 objectForKeyedSubscript:@"LogisticRegressionRegularizationStrategy"];
  Class v20 = NSClassFromString(&cfstr_Nsstring.isa);
  id v21 = v19;
  if (v20)
  {
    if (objc_opt_isKindOfClass()) {
      v22 = v21;
    }
    else {
      v22 = 0;
    }
  }
  else
  {
    v22 = 0;
  }
  v23 = v22;

  v24 = @"ElasticNet";
  if (v23) {
    v24 = v23;
  }
  v25 = v24;

  uint64_t v26 = [(id)objc_opt_class() regularizationStrategyForString:v25];
  v27 = [v4 objectForKeyedSubscript:@"LogisticRegressionRegularizationRate"];
  v28 = v27;
  if (v27)
  {
    [v27 floatValue];
    float v30 = v29;
  }
  else
  {
    float v30 = 4.0;
  }

  v31 = [v4 objectForKeyedSubscript:@"LogisticRegressionRegularizationL1Ratio"];
  v32 = v31;
  if (v31)
  {
    [v31 floatValue];
    int v34 = v33;
  }
  else
  {
    int v34 = 1053609165;
  }

  v35 = [v4 objectForKeyedSubscript:@"LogisticRegressionWeightTruncationThreshold"];
  v36 = v35;
  if (v35)
  {
    [v35 floatValue];
    int v38 = v37;
  }
  else
  {
    int v38 = 981668463;
  }

  LODWORD(v39) = v11;
  LODWORD(v40) = v18;
  *(float *)&double v41 = v30;
  LODWORD(v42) = v34;
  LODWORD(v43) = v38;
  v44 = [(ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *)self initWithIntercept:v7 learningRate:v14 minIterations:v26 stoppingThreshold:v39 regularizationStrategy:v40 regularizationRate:v41 regularizationL1Ratio:v42 weightTruncationThreshold:v43];

  return v44;
}

- (ATXCandidateRelevanceLogisticRegressionModelTrainingPlan)initWithIntercept:(BOOL)a3 learningRate:(float)a4 minIterations:(unint64_t)a5 stoppingThreshold:(float)a6 regularizationStrategy:(unint64_t)a7 regularizationRate:(float)a8 regularizationL1Ratio:(float)a9 weightTruncationThreshold:(float)a10
{
  v19.receiver = self;
  v19.super_class = (Class)ATXCandidateRelevanceLogisticRegressionModelTrainingPlan;
  result = [(ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *)&v19 init];
  if (result)
  {
    result->_intercept = a3;
    result->_learningRate = a4;
    result->_stoppingThreshold = a6;
    result->_minIterations = a5;
    result->_regularizationStrategy = a7;
    result->_regularizationRate = a8;
    result->_regularizationL1Ratio = a9;
    result->_weightTruncationThreshold = a10;
  }
  return result;
}

+ (unint64_t)regularizationStrategyForString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"L1"])
  {
    unint64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"L2"])
  {
    unint64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"ElasticNet"])
  {
    unint64_t v4 = 3;
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

+ (id)stringForPMLRegularizationStrategy:(unint64_t)a3
{
  if (a3 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %lu)", a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E68B2620[a3];
  }
  return v3;
}

- (id)trainModelForDataPoints:(id)a3 candidate:(id)a4 featurizationManager:(id)a5
{
  uint64_t v7 = (void *)MEMORY[0x1E4F93820];
  id v8 = a5;
  id v9 = a3;
  int v10 = objc_msgSend(v7, "zeroWeightsOfLength:", self->_intercept + objc_msgSend(v8, "numberOfInputDimensions"));
  *(float *)&double v11 = self->_learningRate;
  *(float *)&double v12 = self->_stoppingThreshold;
  *(float *)&double v13 = self->_regularizationRate;
  *(float *)&double v14 = self->_regularizationL1Ratio;
  v15 = [MEMORY[0x1E4F93810] solverWithWeights:v10 andIntercept:self->_intercept learningRate:self->_minIterations minIterations:self->_regularizationStrategy stoppingThreshold:v11 regularizationStrategy:v12 regularizationRate:v13 l1Ratio:v14];
  v16 = [v8 sparseFeatureMatrixFromDataPoints:v9];
  [v15 setCovariates:v16];
  int v17 = objc_opt_class();

  int v18 = [v17 denseLabelVectorFromDataPoints:v9];

  objc_super v19 = [MEMORY[0x1E4F93818] modelRegressorFromFloats:v18];
  [v15 setObjective:v19];
  [v15 solve];
  Class v20 = [v15 weights];
  id v21 = [(ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *)self truncatedWeightsForWeights:v20];

  v22 = [ATXCandidateRelevanceLogisticRegressionModel alloc];
  v23 = [MEMORY[0x1E4F93810] withWeights:v21 andIntercept:self->_intercept];
  v24 = [(ATXCandidateRelevanceLogisticRegressionModel *)v22 initWithModel:v23];

  return v24;
}

- (id)truncatedWeightsForWeights:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_weightTruncationThreshold == 0.0)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = [v4 asMutableDenseVector];
    id v8 = objc_opt_new();
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    double v13 = __87__ATXCandidateRelevanceLogisticRegressionModelTrainingPlan_truncatedWeightsForWeights___block_invoke;
    double v14 = &unk_1E68B2600;
    v15 = self;
    id v16 = v8;
    id v9 = v8;
    [v7 enumerateValuesWithBlock:&v11];
    objc_msgSend(MEMORY[0x1E4F93820], "modelWeightsFromFloats:", v9, v11, v12, v13, v14, v15);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

uint64_t __87__ATXCandidateRelevanceLogisticRegressionModelTrainingPlan_truncatedWeightsForWeights___block_invoke(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (fabsf(*(float *)&a2) < *(float *)(v3 + 28)) {
    *(float *)&a2 = 0.0;
  }
  return [v2 append:a2];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *)self isEqualToATXCandidateRelevanceLogisticRegressionModelTrainingPlan:v5];

  return v6;
}

- (BOOL)isEqualToATXCandidateRelevanceLogisticRegressionModelTrainingPlan:(id)a3
{
  id v4 = (float *)a3;
  BOOL v5 = self->_intercept == *((unsigned __int8 *)v4 + 8)
    && self->_learningRate == v4[3]
    && self->_minIterations == *((void *)v4 + 4)
    && self->_stoppingThreshold == v4[4]
    && self->_regularizationRate == v4[5]
    && self->_regularizationStrategy == *((void *)v4 + 5)
    && self->_regularizationL1Ratio == v4[6]
    && self->_weightTruncationThreshold == v4[7];

  return v5;
}

- (BOOL)intercept
{
  return self->_intercept;
}

- (float)learningRate
{
  return self->_learningRate;
}

- (unint64_t)minIterations
{
  return self->_minIterations;
}

- (float)stoppingThreshold
{
  return self->_stoppingThreshold;
}

- (unint64_t)regularizationStrategy
{
  return self->_regularizationStrategy;
}

- (float)regularizationRate
{
  return self->_regularizationRate;
}

- (float)regularizationL1Ratio
{
  return self->_regularizationL1Ratio;
}

- (float)weightTruncationThreshold
{
  return self->_weightTruncationThreshold;
}

@end