@interface CBCE3Input
- (CBCE3Input)initWithInput:(id)a3;
- (MLMultiArray)input;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setInput:(id)a3;
@end

@implementation CBCE3Input

- (CBCE3Input)initWithInput:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)CBCE3Input;
  v8 = [(CBCE3Input *)&v6 init];
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_input, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (NSSet)featureNames
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", &unk_1F14181E8, a2, self);
}

- (id)featureValueForName:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"input"])
  {
    id MLFeatureValueClass = getMLFeatureValueClass();
    objc_super v6 = [(CBCE3Input *)v8 input];
    id v9 = (id)objc_msgSend(MLFeatureValueClass, "featureValueWithMultiArray:");
  }
  else
  {
    id v9 = 0;
  }
  objc_storeStrong(location, 0);
  v3 = v9;

  return v3;
}

- (MLMultiArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (void).cxx_destruct
{
}

@end