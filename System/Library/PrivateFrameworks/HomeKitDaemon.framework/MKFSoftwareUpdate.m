@interface MKFSoftwareUpdate
@end

@implementation MKFSoftwareUpdate

void __34___MKFSoftwareUpdate_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"accessory.home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_141611;
  homeRelation__hmf_once_v1_141611 = v0;
}

@end