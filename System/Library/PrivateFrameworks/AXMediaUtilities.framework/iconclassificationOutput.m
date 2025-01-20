@interface iconclassificationOutput
- (MLMultiArray)leaf_leaf_predictions_probabilities;
- (NSSet)featureNames;
- (iconclassificationOutput)initWithLeaf_leaf_predictions_probabilities:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setLeaf_leaf_predictions_probabilities:(id)a3;
@end

@implementation iconclassificationOutput

- (iconclassificationOutput)initWithLeaf_leaf_predictions_probabilities:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)iconclassificationOutput;
  v6 = [(iconclassificationOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_leaf_leaf_predictions_probabilities, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E941B8];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"leaf/leaf/predictions/probabilities"])
  {
    v4 = [MEMORY[0x1E4F1E950] featureValueWithMultiArray:self->_leaf_leaf_predictions_probabilities];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (MLMultiArray)leaf_leaf_predictions_probabilities
{
  return self->_leaf_leaf_predictions_probabilities;
}

- (void)setLeaf_leaf_predictions_probabilities:(id)a3
{
}

- (void).cxx_destruct
{
}

@end