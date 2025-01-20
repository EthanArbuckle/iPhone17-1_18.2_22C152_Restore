@interface MKFResident
@end

@implementation MKFResident

void __28___MKFResident_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_99293;
  homeRelation__hmf_once_v1_99293 = v0;
}

@end