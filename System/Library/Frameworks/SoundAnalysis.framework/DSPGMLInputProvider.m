@interface DSPGMLInputProvider
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
@end

@implementation DSPGMLInputProvider

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:self->_allInputFeatureNames];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  v5 = [(MLFeatureDescription *)self->_featureDescription name];
  int v6 = [v4 isEqualToString:v5];

  if (v6) {
    [MEMORY[0x1E4F1E950] featureValueWithMultiArray:self->_input];
  }
  else {
  v7 = [(NSMutableDictionary *)self->_featureCache objectForKeyedSubscript:v4];
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_allInputFeatureNames, 0);
  objc_storeStrong((id *)&self->_featureCache, 0);

  objc_storeStrong((id *)&self->_featureDescription, 0);
}

@end