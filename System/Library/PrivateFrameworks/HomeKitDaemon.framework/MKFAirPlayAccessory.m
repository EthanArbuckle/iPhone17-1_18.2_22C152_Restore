@interface MKFAirPlayAccessory
@end

@implementation MKFAirPlayAccessory

void __36___MKFAirPlayAccessory_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_68680;
  homeRelation__hmf_once_v1_68680 = v0;
}

@end