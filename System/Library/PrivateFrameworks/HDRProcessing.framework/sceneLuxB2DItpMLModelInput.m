@interface sceneLuxB2DItpMLModelInput
- (MLMultiArray)feature_vector;
- (NSSet)featureNames;
- (id)featureValueForName:(id)a3;
- (sceneLuxB2DItpMLModelInput)initWithFeature_vector:(id)a3;
- (void)setFeature_vector:(id)a3;
@end

@implementation sceneLuxB2DItpMLModelInput

- (sceneLuxB2DItpMLModelInput)initWithFeature_vector:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)sceneLuxB2DItpMLModelInput;
  v6 = [(sceneLuxB2DItpMLModelInput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_feature_vector, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x263EFFA08] setWithArray:&unk_26D4B74B8];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"feature_vector"])
  {
    v4 = (void *)MEMORY[0x263F00D50];
    id v5 = [(sceneLuxB2DItpMLModelInput *)self feature_vector];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (MLMultiArray)feature_vector
{
  return self->_feature_vector;
}

- (void)setFeature_vector:(id)a3
{
}

- (void).cxx_destruct
{
}

@end