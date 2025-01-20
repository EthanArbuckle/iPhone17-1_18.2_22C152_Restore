@interface MKFNotificationRegistration
@end

@implementation MKFNotificationRegistration

void __44___MKFNotificationRegistration_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"user.home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_188135;
  homeRelation__hmf_once_v1_188135 = v0;
}

@end