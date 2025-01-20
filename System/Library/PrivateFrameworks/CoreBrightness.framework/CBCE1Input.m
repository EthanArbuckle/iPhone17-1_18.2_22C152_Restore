@interface CBCE1Input
- (CBCE1Input)initWithInput:(id)a3;
- (MLMultiArray)input;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setInput:(id)a3;
@end

@implementation CBCE1Input

- (CBCE1Input)initWithInput:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)CBCE1Input;
  v8 = [(CBCE1Input *)&v6 init];
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
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", &unk_1F1418380, a2, self);
}

- (id)featureValueForName:(id)a3
{
  objc_super v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([location[0] isEqualToString:@"input"]) {
    id v7 = (id)[getMLFeatureValueClass_2() featureValueWithMultiArray:v6->_input];
  }
  else {
    id v7 = 0;
  }
  objc_storeStrong(location, 0);
  v3 = v7;

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