@interface MKFHomeSetting
@end

@implementation MKFHomeSetting

void __31___MKFHomeSetting_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_57291;
  homeRelation__hmf_once_v1_57291 = v0;
}

@end