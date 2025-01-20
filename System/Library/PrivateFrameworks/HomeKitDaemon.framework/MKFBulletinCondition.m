@interface MKFBulletinCondition
@end

@implementation MKFBulletinCondition

void __37___MKFBulletinCondition_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"bulletinRegistration.user.home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_115204;
  homeRelation__hmf_once_v1_115204 = v0;
}

@end