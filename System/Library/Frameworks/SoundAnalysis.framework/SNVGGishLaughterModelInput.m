@interface SNVGGishLaughterModelInput
- (MLMultiArray)input1;
- (NSSet)featureNames;
- (SNVGGishLaughterModelInput)initWithInput1:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setInput1:(id)a3;
@end

@implementation SNVGGishLaughterModelInput

- (SNVGGishLaughterModelInput)initWithInput1:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNVGGishLaughterModelInput;
  v6 = [(SNVGGishLaughterModelInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_input1, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3818F60];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"input1"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(SNVGGishLaughterModelInput *)self input1];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MLMultiArray)input1
{
  return self->_input1;
}

- (void)setInput1:(id)a3
{
}

- (void).cxx_destruct
{
}

@end