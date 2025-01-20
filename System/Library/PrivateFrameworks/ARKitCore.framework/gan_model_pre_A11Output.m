@interface gan_model_pre_A11Output
- (MLMultiArray)output;
- (NSSet)featureNames;
- (gan_model_pre_A11Output)initWithOutput:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setOutput:(id)a3;
@end

@implementation gan_model_pre_A11Output

- (gan_model_pre_A11Output)initWithOutput:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)gan_model_pre_A11Output;
  v6 = [(gan_model_pre_A11Output *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_output, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F125C068];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"output"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(gan_model_pre_A11Output *)self output];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)output
{
  return self->_output;
}

- (void)setOutput:(id)a3
{
}

- (void).cxx_destruct
{
}

@end