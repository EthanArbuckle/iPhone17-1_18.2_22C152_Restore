@interface MKFMatterLocalKeyValuePair
@end

@implementation MKFMatterLocalKeyValuePair

void __43___MKFMatterLocalKeyValuePair_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v2;
  homeRelation__hmf_once_v2 = v0;
}

@end