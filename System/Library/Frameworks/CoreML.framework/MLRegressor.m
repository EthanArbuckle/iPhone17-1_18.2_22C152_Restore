@interface MLRegressor
+ (id)predictionFromFeatures:(id)a3 regressor:(id)a4 options:(id)a5 error:(id *)a6;
- (MLRegressor)initWithDescription:(id)a3 configuration:(id)a4 error:(id *)a5;
- (id)initDescriptionOnlyWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5;
- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5;
- (id)regress:(id)a3 options:(id)a4 error:(id *)a5;
- (id)regressorResultFromOutputFeatures:(id)a3 error:(id *)a4;
@end

@implementation MLRegressor

- (id)regressorResultFromOutputFeatures:(id)a3 error:(id *)a4
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(MLModel *)self modelDescription];
  v8 = [v7 predictedFeatureName];

  v9 = [(MLModel *)self modelDescription];
  v10 = [v9 outputDescriptionsByName];
  v11 = [v10 objectForKeyedSubscript:v8];
  uint64_t v12 = [v11 type];

  if (!v8)
  {
    if (a4)
    {
      v21 = @"Cannot determine predictedFeatureName for this regressor";
LABEL_13:
      +[MLModelErrorUtils featureTypeErrorWithFormat:](MLModelErrorUtils, "featureTypeErrorWithFormat:", v21, v26);
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
LABEL_14:
    v20 = 0;
    goto LABEL_25;
  }
  if (v12 != 2 && v12 != 5)
  {
    if (a4)
    {
      v26 = v8;
      v21 = @"Invalid regressor: predicted feature '%@' is not described as double or MultiArray";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v13 = [v6 featureValueForName:v8];
  v14 = v13;
  if (!v13)
  {
    if (a4)
    {
      +[MLModelErrorUtils featureTypeErrorWithFormat:@"Predicted feature named '%@' was not output by pipeline", v8];
LABEL_23:
      v20 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
LABEL_19:
    v20 = 0;
    goto LABEL_24;
  }
  if ([v13 type] != v12)
  {
    if (a4)
    {
      v22 = +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", [v14 type]);
      v23 = +[MLFeatureTypeUtils descriptionForType:v12];
      *a4 = +[MLModelErrorUtils featureTypeErrorWithFormat:@"Predicted feature '%@' is of type %@ not the expected %@", v8, v22, v23];
    }
    goto LABEL_19;
  }
  uint64_t v15 = [v14 type];
  if (v15 == 5)
  {
    v24 = [v14 multiArrayValue];
    v20 = +[MLRegressorResult resultWithValue:v24 additionalFeatures:v6];

    goto LABEL_24;
  }
  if (v15 != 2)
  {
    if (a4)
    {
      +[MLModelErrorUtils featureTypeErrorWithFormat:@"Regressed feature named '%@' is not a Double or MultiArray", v8];
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  v16 = NSNumber;
  [v14 doubleValue];
  v17 = objc_msgSend(v16, "numberWithDouble:");
  v27[0] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
  v19 = +[MLMultiArray doubleVectorWithValues:v18];

  v20 = +[MLRegressorResult resultWithValue:v19 additionalFeatures:v6];

LABEL_24:
LABEL_25:

  return v20;
}

+ (id)predictionFromFeatures:(id)a3 regressor:(id)a4 options:(id)a5 error:(id *)a6
{
  id v9 = a4;
  v10 = [v9 regress:a3 options:a5 error:a6];
  v11 = [v9 modelDescription];
  uint64_t v12 = [v11 predictedValueFeatureDescription];

  if (v12) {
    goto LABEL_2;
  }
  uint64_t v15 = [v9 modelDescription];

  if (!v15) {
    goto LABEL_8;
  }
  v16 = [v9 modelDescription];
  v17 = [v16 outputDescriptionsByName];
  v18 = [v9 modelDescription];
  v19 = [v18 predictedFeatureName];
  uint64_t v12 = [v17 objectForKeyedSubscript:v19];

  if (v12)
  {
LABEL_2:
    v13 = [v10 asFeatureDictionaryWithPredictedValueDescription:v12];
  }
  else
  {
LABEL_8:
    if (a6)
    {
      +[MLModelErrorUtils featureTypeErrorWithFormat:@"Cannot determine valueDescription for this regressor"];
      v13 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (id)initDescriptionOnlyWithSpecification:(void *)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = [[MLModelAssetDescription alloc] initFromModelSpecification:a3];
  v10 = v9;
  if (v9)
  {
    v11 = [v9 defaultModelDescription];
    if ([v11 validateAsRegressorDescriptionAndReturnError:a5])
    {
      v14.receiver = self;
      v14.super_class = (Class)MLRegressor;
      self = [(MLModel *)&v14 initWithDescription:v11 configuration:v8];
      uint64_t v12 = self;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)regress:(id)a3 options:(id)a4 error:(id *)a5
{
  if (a5)
  {
    *a5 = +[MLModelErrorUtils genericErrorWithFormat:@"regress:error must be implemented by derived class!", a4];
  }
  return 0;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v9)
  {
    id v9 = +[MLPredictionOptions defaultOptions];
  }
  v10 = +[MLRegressor predictionFromFeatures:v8 regressor:self options:v9 error:a5];

  return v10;
}

- (MLRegressor)initWithDescription:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 validateAsRegressorDescriptionAndReturnError:a5])
  {
    v12.receiver = self;
    v12.super_class = (Class)MLRegressor;
    self = [(MLModel *)&v12 initWithDescription:v8 configuration:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end