@interface MKFRemovedUserAccessCode
@end

@implementation MKFRemovedUserAccessCode

void __41___MKFRemovedUserAccessCode_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_248217;
  homeRelation__hmf_once_v1_248217 = v0;
}

@end