@interface SNVGGishLaughterModelOutput
- (MLMultiArray)output1;
- (NSSet)featureNames;
- (SNVGGishLaughterModelOutput)initWithOutput1:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setOutput1:(id)a3;
@end

@implementation SNVGGishLaughterModelOutput

- (SNVGGishLaughterModelOutput)initWithOutput1:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNVGGishLaughterModelOutput;
  v6 = [(SNVGGishLaughterModelOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_output1, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3818F78];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"output1"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(SNVGGishLaughterModelOutput *)self output1];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MLMultiArray)output1
{
  return self->_output1;
}

- (void)setOutput1:(id)a3
{
}

- (void).cxx_destruct
{
}

@end