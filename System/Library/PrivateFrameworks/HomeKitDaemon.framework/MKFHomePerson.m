@interface MKFHomePerson
@end

@implementation MKFHomePerson

void __30___MKFHomePerson_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_155013;
  homeRelation__hmf_once_v1_155013 = v0;
}

@end