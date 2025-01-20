@interface BKSTouchDeliveryPolicy
+ (BOOL)supportsSecureCoding;
+ (id)allocWithZone:(_NSZone *)a3;
+ (id)policyByCombiningPolicies:(id)a3;
+ (id)policyCancelingTouchesDeliveredToContextId:(unsigned int)a3 withInitialTouchTimestamp:(double)a4;
+ (id)policyRequiringSharingOfTouchesDeliveredToChildContextId:(unsigned int)a3 withHostContextId:(unsigned int)a4;
- (BKSTouchDeliveryPolicy)initWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (OS_xpc_object)assertionEndpoint;
- (id)description;
- (id)matchSharingTouchesPolicy:(id)a3 orCancelTouchesPolicy:(id)a4 orCombinedPolicy:(id)a5;
- (id)policyByMappingContainedPoliciesWithBlock:(id)a3;
- (id)policyExcludingPolicy:(id)a3;
- (id)policyExcludingPolicyIdenticalTo:(id)a3;
- (id)policyIncludingPolicy:(id)a3;
- (id)reducePolicyToObjectWithBlock:(id)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAssertionEndpoint:(id)a3;
@end

@implementation BKSTouchDeliveryPolicy

- (id)reducePolicyToObjectWithBlock:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __56__BKSTouchDeliveryPolicy_reducePolicyToObjectWithBlock___block_invoke;
  v9[3] = &unk_1E5440D38;
  id v10 = v4;
  id v5 = v4;
  v6 = [(BKSTouchDeliveryPolicy *)self policyByMappingContainedPoliciesWithBlock:v9];
  v7 = (*((void (**)(id, void *))v4 + 2))(v5, v6);

  return v7;
}

- (id)policyByMappingContainedPoliciesWithBlock:(id)a3
{
  id v4 = a3;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke;
  v11[3] = &unk_1E5440CC0;
  v11[4] = self;
  id v9 = v4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke_2;
  v10[3] = &unk_1E5440CE8;
  v10[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke_3;
  v8[3] = &unk_1E5440D10;
  id v5 = v4;
  v6 = [(BKSTouchDeliveryPolicy *)self matchSharingTouchesPolicy:v11 orCancelTouchesPolicy:v10 orCombinedPolicy:v8];

  return v6;
}

id __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = v3;
  v6 = v4;
  v7 = [MEMORY[0x1E4F1CA48] array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = v6[2](v6, *(void *)(*((void *)&v16 + 1) + 8 * i));
        if (v13) {
          objc_msgSend(v7, "addObject:", v13, (void)v16);
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  v14 = +[BKSTouchDeliveryPolicy policyByCombiningPolicies:v7];

  return v14;
}

+ (id)policyByCombiningPolicies:(id)a3
{
  id v3 = a3;
  id v4 = [[_BKSCombinedTouchDeliveryPolicy alloc] initWithPolicies:v3];

  return v4;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ([a1 isMemberOfClass:objc_opt_class()])
  {
    [a1 doesNotRecognizeSelector:a2];
    return 0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___BKSTouchDeliveryPolicy;
    return objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (id)policyExcludingPolicyIdenticalTo:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__BKSTouchDeliveryPolicy_policyExcludingPolicyIdenticalTo___block_invoke;
  v8[3] = &unk_1E5440D60;
  id v9 = v4;
  id v5 = v4;
  v6 = [(BKSTouchDeliveryPolicy *)self reducePolicyToObjectWithBlock:v8];

  return v6;
}

id __59__BKSTouchDeliveryPolicy_policyExcludingPolicyIdenticalTo___block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(a1 + 32) == a2) {
    return 0;
  }
  else {
    return a2;
  }
}

- (id)policyExcludingPolicy:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__BKSTouchDeliveryPolicy_policyExcludingPolicy___block_invoke;
  v8[3] = &unk_1E5440D60;
  id v9 = v4;
  id v5 = v4;
  v6 = [(BKSTouchDeliveryPolicy *)self reducePolicyToObjectWithBlock:v8];

  return v6;
}

id __48__BKSTouchDeliveryPolicy_policyExcludingPolicy___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  if ([v3 isEqual:v2]) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (id)policyIncludingPolicy:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  v6 = [v4 array];
  collectPolicies(self, v6);
  collectPolicies(v5, v6);

  objc_super v7 = +[BKSTouchDeliveryPolicy policyByCombiningPolicies:v6];

  return v7;
}

uint64_t __56__BKSTouchDeliveryPolicy_reducePolicyToObjectWithBlock___block_invoke(uint64_t a1, void *a2)
{
  return [a2 reducePolicyToObjectWithBlock:*(void *)(a1 + 32)];
}

id __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __68__BKSTouchDeliveryPolicy_policyByMappingContainedPoliciesWithBlock___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setAssertionEndpoint:(id)a3
{
}

- (OS_xpc_object)assertionEndpoint
{
  return 0;
}

- (id)matchSharingTouchesPolicy:(id)a3 orCancelTouchesPolicy:(id)a4 orCombinedPolicy:(id)a5
{
  return 0;
}

- (void)appendDescriptionToFormatter:(id)a3
{
}

- (id)description
{
  return (id)[MEMORY[0x1E4F4F720] descriptionForRootObject:self];
}

- (BOOL)isEqual:(id)a3
{
  return 0;
}

- (unint64_t)hash
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BKSTouchDeliveryPolicy)initWithCoder:(id)a3
{
  return 0;
}

+ (id)policyCancelingTouchesDeliveredToContextId:(unsigned int)a3 withInitialTouchTimestamp:(double)a4
{
  id v4 = [[_BKSCancelTouchesTouchDeliveryPolicy alloc] initWithContextId:*(void *)&a3 initialTouchTimestamp:a4];
  return v4;
}

+ (id)policyRequiringSharingOfTouchesDeliveredToChildContextId:(unsigned int)a3 withHostContextId:(unsigned int)a4
{
  id v4 = [[_BKSShareTouchesTouchDeliveryPolicy alloc] initWithChildContextId:*(void *)&a3 hostContextId:*(void *)&a4];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

@end