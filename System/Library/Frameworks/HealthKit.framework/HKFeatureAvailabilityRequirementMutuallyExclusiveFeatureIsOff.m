@interface HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff
+ (BOOL)supportsSecureCoding;
+ (NSString)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff)initWithCoder:(id)a3;
- (HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff)initWithFeatureIdentifier:(id)a3;
- (NSString)context;
- (NSString)featureIdentifier;
- (NSString)requirementDescription;
- (id)initWithFeatureIdentifier:(void *)a3 context:;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (uint64_t)_isSatisfiedWithFeatureStatus:(uint64_t)a1;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff

- (HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff)initWithFeatureIdentifier:(id)a3
{
  return (HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff *)-[HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff initWithFeatureIdentifier:context:]((id *)&self->super.super.isa, a3, @"MutualExclusivityEnforcement");
}

- (id)initWithFeatureIdentifier:(void *)a3 context:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

+ (NSString)requirementIdentifier
{
  return (NSString *)@"MutuallyExclusiveFeatureIsOff";
}

- (NSString)requirementDescription
{
  return (NSString *)[NSString stringWithFormat:@"%@ must have at least one unsatisfied requirement in %@", self->_featureIdentifier, self->_context];
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  v5 = [a3 featureStatusForFeatureWithIdentifier:self->_featureIdentifier context:self->_context error:a4];
  if (v5)
  {
    id v6 = objc_msgSend(NSNumber, "numberWithBool:", -[HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff _isSatisfiedWithFeatureStatus:]((uint64_t)self, v5));
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (uint64_t)_isSatisfiedWithFeatureStatus:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = [a2 objectForKeyedSubscript:*(void *)(a1 + 16)];
  uint64_t v3 = [v2 areAllRequirementsSatisfied] ^ 1;

  return v3;
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [[HKFeatureIdentifierAndContext alloc] initWithFeatureIdentifier:self->_featureIdentifier context:self->_context];
  objc_super v10 = [v7 featureStatusProvidingDataSource];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff_registerObserver_forDataSource___block_invoke;
  v11[3] = &unk_1E58C2DD0;
  v11[4] = self;
  v11[5] = a2;
  [v10 registerObserver:v8 forKey:v9 newValueHandler:v11];
}

void __96__HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40), *(void *)(a1 + 32), @"HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff.m", 79, @"[%@] Feature status should never be nil", objc_opt_class() object file lineNumber description];
  }
  objc_msgSend(v7, "featureAvailabilityRequirement:didUpdateSatisfaction:", *(void *)(a1 + 32), -[HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff _isSatisfiedWithFeatureStatus:](*(void *)(a1 + 32), v5));
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = [[HKFeatureIdentifierAndContext alloc] initWithFeatureIdentifier:self->_featureIdentifier context:self->_context];
  id v8 = [v6 featureStatusProvidingDataSource];

  [v8 unregisterObserver:v7 forKey:v9];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(NSString *)self->_featureIdentifier isEqualToString:v5[1]]) {
      BOOL v6 = [(NSString *)self->_context isEqualToString:v5[2]];
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_featureIdentifier hash];
  return [(NSString *)self->_context hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  featureIdentifier = self->_featureIdentifier;
  id v5 = a3;
  [v5 encodeObject:featureIdentifier forKey:@"featureIdentifier"];
  [v5 encodeObject:self->_context forKey:@"context"];
}

- (HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureIdentifier"];
  BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];

  id v7 = (HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff *)-[HKFeatureAvailabilityRequirementMutuallyExclusiveFeatureIsOff initWithFeatureIdentifier:context:]((id *)&self->super.super.isa, v5, v6);
  return v7;
}

- (NSString)featureIdentifier
{
  return self->_featureIdentifier;
}

- (NSString)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_featureIdentifier, 0);
}

@end