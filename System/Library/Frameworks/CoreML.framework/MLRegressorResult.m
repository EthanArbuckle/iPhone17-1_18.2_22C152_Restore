@interface MLRegressorResult
+ (id)resultWithValue:(id)a3;
+ (id)resultWithValue:(id)a3 additionalFeatures:(id)a4;
- (MLFeatureProvider)additionalFeatures;
- (MLMultiArray)predictedValue;
- (MLRegressorResult)initWithValue:(id)a3 additionalFeatures:(id)a4;
- (id)asFeatureDictionaryWithPredictedValueDescription:(id)a3;
@end

@implementation MLRegressorResult

- (id)asFeatureDictionaryWithPredictedValueDescription:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  v6 = [(MLRegressorResult *)self additionalFeatures];

  if (v6)
  {
    v7 = [MLDictionaryFeatureProvider alloc];
    v8 = [(MLRegressorResult *)self additionalFeatures];
    v9 = [(MLDictionaryFeatureProvider *)v7 initWithFeatureProvider:v8];
    v10 = [(MLDictionaryFeatureProvider *)v9 dictionary];
    uint64_t v11 = [v10 mutableCopy];

    v5 = (void *)v11;
  }
  unint64_t v12 = [v4 type];
  if (v12 <= 8)
  {
    if (((1 << v12) & 0x1DB) != 0)
    {
      v13 = 0;
      goto LABEL_11;
    }
    if (v12 == 2)
    {
      v14 = [(MLRegressorResult *)self predictedValue];
      v15 = [v14 objectAtIndexedSubscript:0];
      [v15 doubleValue];
      v16 = +[MLFeatureValue featureValueWithDouble:](MLFeatureValue, "featureValueWithDouble:");
      v17 = [v4 name];
      [v5 setObject:v16 forKeyedSubscript:v17];
    }
    else
    {
      v14 = [(MLRegressorResult *)self predictedValue];
      v15 = +[MLFeatureValue featureValueWithMultiArray:v14];
      v16 = [v4 name];
      [v5 setObject:v15 forKeyedSubscript:v16];
    }
  }
  id v19 = 0;
  v13 = [[MLDictionaryFeatureProvider alloc] initWithDictionary:v5 error:&v19];

LABEL_11:

  return v13;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalFeatures, 0);

  objc_storeStrong((id *)&self->_predictedValue, 0);
}

- (MLFeatureProvider)additionalFeatures
{
  return (MLFeatureProvider *)objc_getProperty(self, a2, 16, 1);
}

- (MLMultiArray)predictedValue
{
  return (MLMultiArray *)objc_getProperty(self, a2, 8, 1);
}

- (MLRegressorResult)initWithValue:(id)a3 additionalFeatures:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLRegressorResult;
  v9 = [(MLRegressorResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_predictedValue, a3);
    objc_storeStrong((id *)&v10->_additionalFeatures, a4);
  }

  return v10;
}

+ (id)resultWithValue:(id)a3 additionalFeatures:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithValue:v7 additionalFeatures:v6];

  return v8;
}

+ (id)resultWithValue:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithValue:v4 additionalFeatures:0];

  return v5;
}

@end