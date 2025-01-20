@interface HRERecommendableObjectTypeRule
+ (id)ruleWithRequiredType:(id)a3;
- (BOOL)passesWithHomeObjects:(id)a3;
- (BOOL)passesWithObject:(id)a3;
- (HRERecommendableObjectTypeRule)initWithRequiredType:(id)a3;
- (NSString)requiredType;
@end

@implementation HRERecommendableObjectTypeRule

- (HRERecommendableObjectTypeRule)initWithRequiredType:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRERecommendableObjectTypeRule;
  v5 = [(HRERule *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    requiredType = v5->_requiredType;
    v5->_requiredType = (NSString *)v6;
  }
  return v5;
}

+ (id)ruleWithRequiredType:(id)a3
{
  id v3 = a3;
  id v4 = [[HRERecommendableObjectTypeRule alloc] initWithRequiredType:v3];

  return v4;
}

- (BOOL)passesWithHomeObjects:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  v7 = [(HRERecommendableObjectTypeRule *)self requiredType];
  v12[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
  objc_super v9 = [v6 setWithArray:v8];
  v10 = [v5 _types:v9 notMatchedByObjects:v4];

  LOBYTE(self) = [v10 count] == 0;
  return (char)self;
}

- (BOOL)passesWithObject:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = (void *)MEMORY[0x263EFFA08];
  v7 = [(HRERecommendableObjectTypeRule *)self requiredType];
  v16[0] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
  objc_super v9 = [v6 setWithArray:v8];
  v10 = (void *)MEMORY[0x263EFFA08];
  id v15 = v4;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v15 count:1];
  v12 = [v10 setWithArray:v11];

  v13 = [v5 _types:v9 notMatchedByObjects:v12];
  LOBYTE(v4) = [v13 count] == 0;

  return (char)v4;
}

- (NSString)requiredType
{
  return self->_requiredType;
}

- (void).cxx_destruct
{
}

@end