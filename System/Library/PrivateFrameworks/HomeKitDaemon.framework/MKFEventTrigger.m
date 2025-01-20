@interface MKFEventTrigger
@end

@implementation MKFEventTrigger

void __32___MKFEventTrigger_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_222479;
  homeRelation__hmf_once_v1_222479 = v0;
}

@end