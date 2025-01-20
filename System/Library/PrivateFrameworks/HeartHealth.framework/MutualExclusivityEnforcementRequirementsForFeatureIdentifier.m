@interface MutualExclusivityEnforcementRequirementsForFeatureIdentifier
@end

@implementation MutualExclusivityEnforcementRequirementsForFeatureIdentifier

uint64_t ___MutualExclusivityEnforcementRequirementsForFeatureIdentifier_block_invoke()
{
  v0 = [(id)objc_opt_class() requirementIdentifier];
  uint64_t v1 = [v0 isEqualToString:*MEMORY[0x1E4F29CB0]] ^ 1;

  return v1;
}

@end