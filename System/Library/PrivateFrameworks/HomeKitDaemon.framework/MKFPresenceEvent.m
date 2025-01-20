@interface MKFPresenceEvent
@end

@implementation MKFPresenceEvent

void __33___MKFPresenceEvent_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"trigger.home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_71640;
  homeRelation__hmf_once_v1_71640 = v0;
}

@end