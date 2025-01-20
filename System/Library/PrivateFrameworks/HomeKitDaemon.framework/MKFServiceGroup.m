@interface MKFServiceGroup
@end

@implementation MKFServiceGroup

void __32___MKFServiceGroup_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1;
  homeRelation__hmf_once_v1 = v0;
}

@end