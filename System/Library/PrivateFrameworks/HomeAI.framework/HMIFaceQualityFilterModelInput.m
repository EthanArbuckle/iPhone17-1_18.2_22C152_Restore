@interface HMIFaceQualityFilterModelInput
- (HMIFaceQualityFilterModelInput)initWithInput:(id)a3 inputName:(id)a4;
- (MLMultiArray)input;
- (NSSet)featureNames;
- (NSString)inputName;
- (id)featureValueForName:(id)a3;
- (void)setInput:(id)a3;
@end

@implementation HMIFaceQualityFilterModelInput

- (HMIFaceQualityFilterModelInput)initWithInput:(id)a3 inputName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMIFaceQualityFilterModelInput;
  v9 = [(HMIFaceQualityFilterModelInput *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_input, a3);
    objc_storeStrong((id *)&v10->_inputName, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  v7[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(HMIFaceQualityFilterModelInput *)self inputName];
  v7[0] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  v5 = [v2 setWithArray:v4];

  return (NSSet *)v5;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  v5 = [(HMIFaceQualityFilterModelInput *)self inputName];
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x263F00D50];
    id v8 = [(HMIFaceQualityFilterModelInput *)self input];
    v9 = [v7 featureValueWithMultiArray:v8];
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (MLMultiArray)input
{
  return self->_input;
}

- (void)setInput:(id)a3
{
}

- (NSString)inputName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputName, 0);
  objc_storeStrong((id *)&self->_input, 0);
}

@end