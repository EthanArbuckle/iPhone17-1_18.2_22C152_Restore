@interface AFAssistedDisambiguationRules
+ (id)defaultRules;
- (double)decisionAge;
- (double)decisionThreshold;
- (double)weightForEvent:(id)a3;
- (unint64_t)decisionDepth;
@end

@implementation AFAssistedDisambiguationRules

- (double)weightForEvent:(id)a3
{
  v4 = [a3 date];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  if (v6 <= -900.0) {
    return 1.0 / (double)[(AFAssistedDisambiguationRules *)self decisionDepth];
  }
  double result = 1.0;
  if (v6 >= 0.0) {
    return 1.0 / (double)[(AFAssistedDisambiguationRules *)self decisionDepth];
  }
  return result;
}

- (double)decisionThreshold
{
  return 1.0;
}

- (double)decisionAge
{
  return 480.0;
}

- (unint64_t)decisionDepth
{
  return 2;
}

+ (id)defaultRules
{
  v2 = objc_alloc_init(AFAssistedDisambiguationRules);
  return v2;
}

@end