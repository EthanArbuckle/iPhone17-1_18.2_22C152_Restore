@interface MKFGuestAccessCode
@end

@implementation MKFGuestAccessCode

void __35___MKFGuestAccessCode_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_75121;
  homeRelation__hmf_once_v1_75121 = v0;
}

@end