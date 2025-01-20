@interface SGMISaliencyModelConfigRule
- (NSNumber)featureName;
- (NSNumber)output;
- (NSNumber)strictLowerBound;
- (NSNumber)strictUpperBound;
- (SGMISaliencyModelConfigRule)initWithDictionary:(id)a3;
- (SGMISaliencyModelConfigRule)initWithFeatureName:(id)a3 strictLowerBound:(id)a4 strictUpperBound:(id)a5 output:(id)a6;
@end

@implementation SGMISaliencyModelConfigRule

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_strictUpperBound, 0);
  objc_storeStrong((id *)&self->_strictLowerBound, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

- (NSNumber)output
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)strictUpperBound
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSNumber)strictLowerBound
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)featureName
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (SGMISaliencyModelConfigRule)initWithDictionary:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGMISaliencyModelConfigRule;
  v5 = [(SGMISaliencyModelConfigRule *)&v15 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"feature"];
    v7 = +[SGMIFeature prettyNamesReverseMapping];
    uint64_t v8 = [v7 objectForKeyedSubscript:v6];
    featureName = v5->_featureName;
    v5->_featureName = (NSNumber *)v8;

    uint64_t v10 = [v4 objectForKeyedSubscript:@"strictLowerBound"];
    strictLowerBound = v5->_strictLowerBound;
    v5->_strictLowerBound = (NSNumber *)v10;

    uint64_t v12 = [v4 objectForKeyedSubscript:@"strictUpperBound"];
    strictUpperBound = v5->_strictUpperBound;
    v5->_strictUpperBound = (NSNumber *)v12;
  }
  return v5;
}

- (SGMISaliencyModelConfigRule)initWithFeatureName:(id)a3 strictLowerBound:(id)a4 strictUpperBound:(id)a5 output:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SGMISaliencyModelConfigRule;
  objc_super v15 = [(SGMISaliencyModelConfigRule *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_featureName, a3);
    objc_storeStrong((id *)&v16->_strictLowerBound, a4);
    objc_storeStrong((id *)&v16->_strictUpperBound, a5);
    objc_storeStrong((id *)&v16->_output, a6);
  }

  return v16;
}

@end