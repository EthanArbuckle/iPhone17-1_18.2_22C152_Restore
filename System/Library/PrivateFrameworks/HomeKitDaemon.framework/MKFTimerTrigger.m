@interface MKFTimerTrigger
@end

@implementation MKFTimerTrigger

void __32___MKFTimerTrigger_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_127109;
  homeRelation__hmf_once_v1_127109 = v0;
}

@end