@interface MKFEvent
@end

@implementation MKFEvent

void __25___MKFEvent_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"trigger.home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_135258;
  homeRelation__hmf_once_v1_135258 = v0;
}

@end