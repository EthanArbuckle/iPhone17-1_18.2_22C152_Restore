@interface HRERecommendableObjectTypeListRule
+ (id)ruleRequiringOneOfTypes:(id)a3;
- (BOOL)passesWithHomeObjects:(id)a3;
- (HRERecommendableObjectTypeListRule)initWithRequiredTypeGroup:(id)a3;
- (NSSet)typesSatisfyingRequirement;
@end

@implementation HRERecommendableObjectTypeListRule

- (HRERecommendableObjectTypeListRule)initWithRequiredTypeGroup:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HRERecommendableObjectTypeListRule;
  v5 = [(HRERule *)&v9 _init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    typesSatisfyingRequirement = v5->_typesSatisfyingRequirement;
    v5->_typesSatisfyingRequirement = (NSSet *)v6;
  }
  return v5;
}

+ (id)ruleRequiringOneOfTypes:(id)a3
{
  id v3 = a3;
  id v4 = [[HRERecommendableObjectTypeListRule alloc] initWithRequiredTypeGroup:v3];

  return v4;
}

- (BOOL)passesWithHomeObjects:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  uint64_t v6 = [(HRERecommendableObjectTypeListRule *)self typesSatisfyingRequirement];
  v7 = [v5 _types:v6 notMatchedByObjects:v4];

  unint64_t v8 = [v7 count];
  objc_super v9 = [(HRERecommendableObjectTypeListRule *)self typesSatisfyingRequirement];
  LOBYTE(v8) = v8 < [v9 count];

  return v8;
}

- (NSSet)typesSatisfyingRequirement
{
  return self->_typesSatisfyingRequirement;
}

- (void).cxx_destruct
{
}

@end