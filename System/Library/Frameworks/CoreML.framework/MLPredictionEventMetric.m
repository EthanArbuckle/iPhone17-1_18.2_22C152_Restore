@interface MLPredictionEventMetric
- (MLPredictionEventMetric)initWithBundleIdentifier:(id)a3 modelName:(id)a4 firstPartyExecutable:(id)a5 modelType:(id)a6 featuresPredictionDuration:(double)a7 featuresPredictionCountSoFar:(int64_t)a8;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)firstPartyExecutable;
- (NSNumber)modelType;
- (NSString)bundleIdentifier;
- (NSString)modelName;
- (NSString)name;
- (double)featuresPredictionDuration;
- (int64_t)featuresPredictionCountSoFar;
@end

@implementation MLPredictionEventMetric

- (MLPredictionEventMetric)initWithBundleIdentifier:(id)a3 modelName:(id)a4 firstPartyExecutable:(id)a5 modelType:(id)a6 featuresPredictionDuration:(double)a7 featuresPredictionCountSoFar:(int64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v24.receiver = self;
  v24.super_class = (Class)MLPredictionEventMetric;
  v18 = [(MLPredictionEventMetric *)&v24 init];
  if (v18)
  {
    uint64_t v19 = [v14 copy];
    bundleIdentifier = v18->_bundleIdentifier;
    v18->_bundleIdentifier = (NSString *)v19;

    uint64_t v21 = [v15 copy];
    modelName = v18->_modelName;
    v18->_modelName = (NSString *)v21;

    objc_storeStrong((id *)&v18->_firstPartyExecutable, a5);
    objc_storeStrong((id *)&v18->_modelType, a6);
    v18->_featuresPredictionDuration = a7;
    v18->_featuresPredictionCountSoFar = a8;
  }

  return v18;
}

- (NSDictionary)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(MLPredictionEventMetric *)self bundleIdentifier];
  [v3 setObject:v4 forKeyedSubscript:@"bundleIdentifier"];

  v5 = [(MLPredictionEventMetric *)self modelName];
  [v3 setObject:v5 forKeyedSubscript:@"modelName"];

  v6 = [(MLPredictionEventMetric *)self firstPartyExecutable];
  [v3 setObject:v6 forKeyedSubscript:@"firstPartyExecutable"];

  v7 = [(MLPredictionEventMetric *)self modelType];
  [v3 setObject:v7 forKeyedSubscript:@"modelType"];

  v8 = NSNumber;
  [(MLPredictionEventMetric *)self featuresPredictionDuration];
  v10 = [v8 numberWithDouble:v9 * 1000.0];
  [v3 setObject:v10 forKeyedSubscript:@"featuresPredictionDuration"];

  v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[MLPredictionEventMetric featuresPredictionCountSoFar](self, "featuresPredictionCountSoFar"));
  [v3 setObject:v11 forKeyedSubscript:@"featuresPredictionCountSoFar"];

  return (NSDictionary *)v3;
}

- (NSNumber)modelType
{
  return self->_modelType;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSNumber)firstPartyExecutable
{
  return self->_firstPartyExecutable;
}

- (double)featuresPredictionDuration
{
  return self->_featuresPredictionDuration;
}

- (int64_t)featuresPredictionCountSoFar
{
  return self->_featuresPredictionCountSoFar;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)name
{
  v2 = @"com.apple.CoreML.MLPrediction";
  return (NSString *)@"com.apple.CoreML.MLPrediction";
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelType, 0);
  objc_storeStrong((id *)&self->_firstPartyExecutable, 0);
  objc_storeStrong((id *)&self->_modelName, 0);

  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end