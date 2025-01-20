@interface FaceAestheticQualityFilterSVMDataScalerInput
- (FaceAestheticQualityFilterSVMDataScalerInput)initWithInput:(id)a3;
- (MLMultiArray)input;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setInput:(id)a3;
@end

@implementation FaceAestheticQualityFilterSVMDataScalerInput

- (FaceAestheticQualityFilterSVMDataScalerInput)initWithInput:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FaceAestheticQualityFilterSVMDataScalerInput;
  v6 = [(FaceAestheticQualityFilterSVMDataScalerInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_input, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26D9A9930];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"input"])
  {
    v4 = (void *)MEMORY[0x263F00D50];
    id v5 = [(FaceAestheticQualityFilterSVMDataScalerInput *)self input];
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