@interface LSEligibilityCacheEligibilityResolver
- (id)eligibilityForDomain:(unint64_t)a3 error:(id *)a4;
@end

@implementation LSEligibilityCacheEligibilityResolver

- (id)eligibilityForDomain:(unint64_t)a3 error:(id *)a4
{
  uint64_t v6 = LaunchServices::EligibilityCache::shared((LaunchServices::EligibilityCache *)self);
  unint64_t v7 = LaunchServices::EligibilityCache::cachedAnswerForDomain(v6, a3, a4);
  if (v8)
  {
    v9 = [NSNumber numberWithLongLong:v7];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end