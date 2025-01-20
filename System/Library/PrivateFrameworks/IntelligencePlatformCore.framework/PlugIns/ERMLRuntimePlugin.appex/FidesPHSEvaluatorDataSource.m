@interface FidesPHSEvaluatorDataSource
+ (id)defaultRecipeParams;
- (BOOL)computeFirstOrderGradients;
- (BOOL)computeSecondOrderGradients;
- (BOOL)reportGradientsBothSidesOfSplit;
- (BOOL)reportNodeSumGradients;
- (BOOL)reportPerFeatureResultDifference;
- (BOOL)reportPerNodeResultDifference;
- (FidesPHSEvaluatorDataSource)initWithRecipe:(id)a3 inputVectors:(id)a4 targetVector:(id)a5 error:(id *)a6;
- (NSArray)GBDTQuestions;
- (NSArray)inputVectors;
- (NSArray)recordDatas;
- (NSArray)recordInfos;
- (NSArray)records;
- (NSArray)targetVector;
- (NSArray)translateVector;
- (NSArray)weightVector;
- (NSDictionary)recipe;
- (float)gradNormFactor;
- (float)l2NormBound;
- (float)learningRate;
- (float)learningRateDecay;
- (id)classLearningRates;
- (id)freezeComponents;
- (id)gradNormType;
- (id)inputSplice;
- (id)labelMap;
- (id)layersToTrain;
- (id)objectiveFunction;
- (int)batchSize;
- (int)classThreshold;
- (int)numLocalIterations;
- (void)setRecipe:(id)a3;
- (void)setRecordDatas:(id)a3;
- (void)setRecordInfos:(id)a3;
- (void)setRecords:(id)a3;
@end

@implementation FidesPHSEvaluatorDataSource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordDatas, 0);
  objc_storeStrong((id *)&self->_recordInfos, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
  objc_storeStrong((id *)&self->_targetVector, 0);
  objc_storeStrong((id *)&self->_inputVectors, 0);
}

- (void)setRecordDatas:(id)a3
{
}

- (NSArray)recordDatas
{
  return self->_recordDatas;
}

- (void)setRecordInfos:(id)a3
{
}

- (NSArray)recordInfos
{
  return self->_recordInfos;
}

- (void)setRecords:(id)a3
{
}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecipe:(id)a3
{
}

- (NSDictionary)recipe
{
  return self->_recipe;
}

- (NSArray)targetVector
{
  return self->_targetVector;
}

- (NSArray)inputVectors
{
  return self->_inputVectors;
}

- (NSArray)translateVector
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"TranslateVector"];

  return (NSArray *)v3;
}

- (NSArray)weightVector
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"WeightVector"];

  return (NSArray *)v3;
}

- (BOOL)reportPerNodeResultDifference
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ReportPerNodeResultDifference"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)reportPerFeatureResultDifference
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ReportPerFeatureResultDifference"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)reportNodeSumGradients
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ReportNodeSumGradients"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)reportGradientsBothSidesOfSplit
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ReportGradientsBothSidesOfSplit"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)computeSecondOrderGradients
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ComputeSecondOrderGradients"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)computeFirstOrderGradients
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ComputeFirstOrderGradients"];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (NSArray)GBDTQuestions
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"GBDTQuestions"];

  return (NSArray *)v3;
}

- (int)classThreshold
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ClassThreshold"];
  int v4 = [v3 intValue];

  return v4;
}

- (id)freezeComponents
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"FrozenComponentIds"];

  return v3;
}

- (id)objectiveFunction
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ObjectiveFunction"];

  return v3;
}

- (id)gradNormType
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"GradientNormType"];

  return v3;
}

- (float)l2NormBound
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"L2NormBound"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (int)batchSize
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"BatchSize"];
  int v4 = [v3 intValue];

  return v4;
}

- (float)gradNormFactor
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"GradientNormFactor"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (id)classLearningRates
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"ClassLearningRates"];

  return v3;
}

- (id)inputSplice
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"InputSplice"];

  return v3;
}

- (id)labelMap
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"LabelMap"];

  return v3;
}

- (id)layersToTrain
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"TrainLayers"];

  return v3;
}

- (float)learningRateDecay
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"LearningRateDecay"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (float)learningRate
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"LearningRate"];
  [v3 floatValue];
  float v5 = v4;

  return v5;
}

- (int)numLocalIterations
{
  v2 = [(FidesPHSEvaluatorDataSource *)self recipe];
  v3 = [v2 objectForKeyedSubscript:@"NumLocalIterations"];
  int v4 = [v3 intValue];

  return v4;
}

- (FidesPHSEvaluatorDataSource)initWithRecipe:(id)a3 inputVectors:(id)a4 targetVector:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)FidesPHSEvaluatorDataSource;
  v12 = [(FidesPHSEvaluatorDataSource *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_inputVectors, a4);
    objc_storeStrong((id *)&v13->_targetVector, a5);
    v14 = +[FidesPHSEvaluatorDataSource defaultRecipeParams];
    id v15 = [v14 mutableCopy];

    [v15 addEntriesFromDictionary:v9];
    v16 = (NSDictionary *)[v15 copy];
    recipe = v13->_recipe;
    v13->_recipe = v16;

    v18 = v13;
  }

  return v13;
}

+ (id)defaultRecipeParams
{
  v4[0] = @"NumLocalIterations";
  v4[1] = @"LearningRate";
  v5[0] = &off_100011090;
  v5[1] = &off_1000110F0;
  v4[2] = @"LearningRateDecay";
  v4[3] = @"TrainLayers";
  v5[2] = &off_100011100;
  v5[3] = &__NSArray0__struct;
  v4[4] = @"InputSplice";
  v4[5] = @"ClassLearningRates";
  v5[4] = &__NSArray0__struct;
  v5[5] = &__NSArray0__struct;
  v4[6] = @"LabelMap";
  v4[7] = @"GradientNormFactor";
  v5[6] = &__NSDictionary0__struct;
  v5[7] = &off_100011110;
  v4[8] = @"BatchSize";
  v4[9] = @"L2NormBound";
  v5[8] = &off_100011090;
  v5[9] = &off_100011120;
  v4[10] = @"GradientNormType";
  v4[11] = @"ObjectiveFunction";
  v5[10] = @"NoGradNorm";
  v5[11] = @"xent";
  v4[12] = @"FrozenComponentIds";
  v4[13] = @"ClassThreshold";
  v5[12] = &stru_100010C00;
  v5[13] = &off_1000110A8;
  v4[14] = @"GBDTQuestions";
  v4[15] = @"ComputeFirstOrderGradients";
  v5[14] = &off_100011138;
  v5[15] = &__kCFBooleanTrue;
  v4[16] = @"ComputeSecondOrderGradients";
  v4[17] = @"ReportGradientsBothSidesOfSplit";
  v5[16] = &__kCFBooleanTrue;
  v5[17] = &__kCFBooleanTrue;
  v4[18] = @"ReportNodeSumGradients";
  v4[19] = @"ReportPerFeatureResultDifference";
  v5[18] = &__kCFBooleanTrue;
  v5[19] = &__kCFBooleanFalse;
  v4[20] = @"ReportPerNodeResultDifference";
  v4[21] = @"WeightVector";
  v5[20] = &__kCFBooleanFalse;
  v5[21] = &__NSArray0__struct;
  v4[22] = @"TranslateVector";
  v5[22] = &__NSArray0__struct;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:23];
  return v2;
}

@end