@interface HDOntologyMedsScanningFeatureEvaluator
+ (double)minimumTimeToLive;
- (HDOntologyMedsScanningFeatureEvaluator)init;
- (NSString)featureIdentifier;
- (int64_t)requiresFeatureShardForProfile:(id)a3;
@end

@implementation HDOntologyMedsScanningFeatureEvaluator

- (NSString)featureIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4F2A2C8];
}

- (HDOntologyMedsScanningFeatureEvaluator)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (int64_t)requiresFeatureShardForProfile:(id)a3
{
  return 0;
}

+ (double)minimumTimeToLive
{
  HDOntologyFeatureDefaultMinimumTimeToLive();
  return v2 + v2;
}

@end