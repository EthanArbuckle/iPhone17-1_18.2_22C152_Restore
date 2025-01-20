@interface IAMPresentationPolicy
+ (int64_t)presentationPolicyGroupForGlobalPresentationPolicyGroup:(int)a3;
- (IAMPresentationPolicy)initWithMinimumIntervalBetweenPresentations:(double)a3 forPresentationPolicyGroup:(int64_t)a4;
- (double)minimumIntervalBetweenPresentations;
- (int64_t)policyGroup;
@end

@implementation IAMPresentationPolicy

- (IAMPresentationPolicy)initWithMinimumIntervalBetweenPresentations:(double)a3 forPresentationPolicyGroup:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)IAMPresentationPolicy;
  result = [(IAMPresentationPolicy *)&v7 init];
  if (result)
  {
    result->_minimumIntervalBetweenPresentations = a3;
    result->_policyGroup = a4;
  }
  return result;
}

+ (int64_t)presentationPolicyGroupForGlobalPresentationPolicyGroup:(int)a3
{
  return a3 == 1;
}

- (int64_t)policyGroup
{
  return self->_policyGroup;
}

- (double)minimumIntervalBetweenPresentations
{
  return self->_minimumIntervalBetweenPresentations;
}

@end