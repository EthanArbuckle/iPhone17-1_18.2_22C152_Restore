@interface DOCFeatureRequirement
- (DOCFeatureRequirement)initWithName:(id)a3 requirementValidationBlock:(id)a4;
- (NSString)name;
- (id)requirementValidationBlock;
@end

@implementation DOCFeatureRequirement

- (DOCFeatureRequirement)initWithName:(id)a3 requirementValidationBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DOCFeatureRequirement;
  v9 = [(DOCFeatureRequirement *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    uint64_t v11 = MEMORY[0x21668ED30](v8);
    id requirementValidationBlock = v10->_requirementValidationBlock;
    v10->_id requirementValidationBlock = (id)v11;
  }
  return v10;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)requirementValidationBlock
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requirementValidationBlock, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end