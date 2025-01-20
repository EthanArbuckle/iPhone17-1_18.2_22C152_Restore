@interface MKFPhotosPerson
@end

@implementation MKFPhotosPerson

void __32___MKFPhotosPerson_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"user.home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_10587;
  homeRelation__hmf_once_v1_10587 = v0;
}

@end