@interface MKFAccessoryNetworkProtectionGroup
@end

@implementation MKFAccessoryNetworkProtectionGroup

void __51___MKFAccessoryNetworkProtectionGroup_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_190630;
  homeRelation__hmf_once_v1_190630 = v0;
}

@end