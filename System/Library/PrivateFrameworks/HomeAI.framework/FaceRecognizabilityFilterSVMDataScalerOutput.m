@interface FaceRecognizabilityFilterSVMDataScalerOutput
- (FaceRecognizabilityFilterSVMDataScalerOutput)initWithTransformed_features:(id)a3;
- (MLMultiArray)transformed_features;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (void)setTransformed_features:(id)a3;
@end

@implementation FaceRecognizabilityFilterSVMDataScalerOutput

- (FaceRecognizabilityFilterSVMDataScalerOutput)initWithTransformed_features:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FaceRecognizabilityFilterSVMDataScalerOutput;
  v6 = [(FaceRecognizabilityFilterSVMDataScalerOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_transformed_features, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26D9A9918];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"transformed_features"])
  {
    v4 = (void *)MEMORY[0x263F00D50];
    id v5 = [(FaceRecognizabilityFilterSVMDataScalerOutput *)self transformed_features];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)transformed_features
{
  return self->_transformed_features;
}

- (void)setTransformed_features:(id)a3
{
}

- (void).cxx_destruct
{
}

@end