@interface MKFAction
@end

@implementation MKFAction

void __26___MKFAction_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"actionSet.home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_103764;
  homeRelation__hmf_once_v1_103764 = v0;
}

@end