@interface CRKTrustEvaluationPolicies
+ (CRKTrustEvaluationPolicies)defaultPolicicesForServerEvaluation;
+ (CRKTrustEvaluationPolicies)defaultPoliciesForClientEvaluation;
- (CRKTrustEvaluationPolicies)init;
- (CRKTrustEvaluationPolicies)initWithPolicyRefs:(id)a3;
- (NSArray)policyRefs;
@end

@implementation CRKTrustEvaluationPolicies

+ (CRKTrustEvaluationPolicies)defaultPoliciesForClientEvaluation
{
  v2 = objc_opt_new();

  return (CRKTrustEvaluationPolicies *)v2;
}

+ (CRKTrustEvaluationPolicies)defaultPolicicesForServerEvaluation
{
  v2 = objc_opt_new();

  return (CRKTrustEvaluationPolicies *)v2;
}

- (CRKTrustEvaluationPolicies)init
{
  return [(CRKTrustEvaluationPolicies *)self initWithPolicyRefs:0];
}

- (CRKTrustEvaluationPolicies)initWithPolicyRefs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKTrustEvaluationPolicies;
  v5 = [(CRKTrustEvaluationPolicies *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    policyRefs = v5->_policyRefs;
    v5->_policyRefs = (NSArray *)v6;
  }
  return v5;
}

- (NSArray)policyRefs
{
  return self->_policyRefs;
}

- (void).cxx_destruct
{
}

@end