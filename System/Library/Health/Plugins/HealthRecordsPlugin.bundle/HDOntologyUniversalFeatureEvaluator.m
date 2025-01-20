@interface HDOntologyUniversalFeatureEvaluator
- (BOOL)canRequireShardWithError:(id *)a3;
- (NSString)featureIdentifier;
- (int64_t)requiresFeatureShardForProfile:(id)a3;
@end

@implementation HDOntologyUniversalFeatureEvaluator

- (NSString)featureIdentifier
{
  return (NSString *)HKOntologyShardIdentifierUniversal;
}

- (BOOL)canRequireShardWithError:(id *)a3
{
  return 1;
}

- (int64_t)requiresFeatureShardForProfile:(id)a3
{
  return 1;
}

@end