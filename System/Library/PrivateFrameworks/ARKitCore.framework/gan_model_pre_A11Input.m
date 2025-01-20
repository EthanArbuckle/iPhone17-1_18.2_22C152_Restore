@interface gan_model_pre_A11Input
- (MLMultiArray)input;
- (NSSet)featureNames;
- (gan_model_pre_A11Input)initWithInput:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setInput:(id)a3;
@end

@implementation gan_model_pre_A11Input

- (gan_model_pre_A11Input)initWithInput:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)gan_model_pre_A11Input;
  v6 = [(gan_model_pre_A11Input *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_input, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F125C050];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"input"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(gan_model_pre_A11Input *)self input];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
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