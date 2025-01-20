@interface LCFELShadowEvaluationPrediction
- (NSDate)timestampOfInputFeatureSet;
- (NSNumber)predictedClass;
- (NSNumber)probability;
- (id)init:(id)a3 predictedFeatureSet:(id)a4 outputLabelFeatureName:(id)a5;
@end

@implementation LCFELShadowEvaluationPrediction

- (id)init:(id)a3 predictedFeatureSet:(id)a4 outputLabelFeatureName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)LCFELShadowEvaluationPrediction;
  v11 = [(LCFELShadowEvaluationPrediction *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [v8 timestamp];
    timestampOfInputFeatureSet = v11->_timestampOfInputFeatureSet;
    v11->_timestampOfInputFeatureSet = (NSDate *)v12;

    v14 = NSNumber;
    v15 = [v9 featureValueForName:v10];
    uint64_t v16 = objc_msgSend(v14, "numberWithLongLong:", objc_msgSend(v15, "int64Value"));
    predictedClass = v11->_predictedClass;
    v11->_predictedClass = (NSNumber *)v16;

    v18 = NSNumber;
    v19 = [v9 featureValueForName:@"classProbability"];
    [v19 doubleValue];
    uint64_t v20 = objc_msgSend(v18, "numberWithDouble:");
    probability = v11->_probability;
    v11->_probability = (NSNumber *)v20;
  }
  return v11;
}

- (NSDate)timestampOfInputFeatureSet
{
  return self->_timestampOfInputFeatureSet;
}

- (NSNumber)predictedClass
{
  return self->_predictedClass;
}

- (NSNumber)probability
{
  return self->_probability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_probability, 0);
  objc_storeStrong((id *)&self->_predictedClass, 0);
  objc_storeStrong((id *)&self->_timestampOfInputFeatureSet, 0);
}

@end