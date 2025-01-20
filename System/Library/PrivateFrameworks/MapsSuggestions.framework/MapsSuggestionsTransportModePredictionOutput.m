@interface MapsSuggestionsTransportModePredictionOutput
- (MapsSuggestionsTransportModePredictionOutput)initWithActualTransportMode:(id)a3 actualTransportModeProbability:(id)a4;
- (NSDictionary)actualTransportModeProbability;
- (NSSet)featureNames;
- (NSString)actualTransportMode;
- (id)featureValueForName:(id)a3;
- (void)setActualTransportMode:(id)a3;
- (void)setActualTransportModeProbability:(id)a3;
@end

@implementation MapsSuggestionsTransportModePredictionOutput

- (MapsSuggestionsTransportModePredictionOutput)initWithActualTransportMode:(id)a3 actualTransportModeProbability:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsTransportModePredictionOutput;
  v9 = [(MapsSuggestionsTransportModePredictionOutput *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actualTransportMode, a3);
    objc_storeStrong((id *)&v10->_actualTransportModeProbability, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_100075040];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"actualTransportMode"])
  {
    v5 = [(MapsSuggestionsTransportModePredictionOutput *)self actualTransportMode];
    uint64_t v6 = +[MLFeatureValue featureValueWithString:v5];
LABEL_5:
    id v7 = (void *)v6;

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"actualTransportModeProbability"])
  {
    v5 = [(MapsSuggestionsTransportModePredictionOutput *)self actualTransportModeProbability];
    uint64_t v6 = +[MLFeatureValue featureValueWithDictionary:v5 error:0];
    goto LABEL_5;
  }
  id v7 = 0;
LABEL_7:

  return v7;
}

- (NSString)actualTransportMode
{
  return self->_actualTransportMode;
}

- (void)setActualTransportMode:(id)a3
{
}

- (NSDictionary)actualTransportModeProbability
{
  return self->_actualTransportModeProbability;
}

- (void)setActualTransportModeProbability:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actualTransportModeProbability, 0);
  objc_storeStrong((id *)&self->_actualTransportMode, 0);
}

@end