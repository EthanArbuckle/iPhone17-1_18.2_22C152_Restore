@interface MKFActionSet
@end

@implementation MKFActionSet

void __29___MKFActionSet_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_203442;
  homeRelation__hmf_once_v1_203442 = v0;
}

@end