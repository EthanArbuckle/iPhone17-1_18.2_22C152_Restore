@interface SelectedCheckboxFromIcon__generated__Output
- (NSDictionary)labelProbability;
- (NSSet)featureNames;
- (NSString)label;
- (SelectedCheckboxFromIcon__generated__Output)initWithLabelProbability:(id)a3 label:(id)a4;
- (id)featureValueForName:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLabelProbability:(id)a3;
@end

@implementation SelectedCheckboxFromIcon__generated__Output

- (SelectedCheckboxFromIcon__generated__Output)initWithLabelProbability:(id)a3 label:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (self)
  {
    objc_storeStrong((id *)&self->_labelProbability, a3);
    objc_storeStrong((id *)&self->_label, a4);
  }

  return self;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F0E94338];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"labelProbability"])
  {
    uint64_t v5 = [MEMORY[0x1E4F1E950] featureValueWithDictionary:self->_labelProbability error:0];
LABEL_5:
    v6 = (void *)v5;
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"label"])
  {
    uint64_t v5 = [MEMORY[0x1E4F1E950] featureValueWithString:self->_label];
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (NSDictionary)labelProbability
{
  return self->_labelProbability;
}

- (void)setLabelProbability:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_labelProbability, 0);
}

@end