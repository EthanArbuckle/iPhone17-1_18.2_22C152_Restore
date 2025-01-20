@interface MKFCharacteristic
@end

@implementation MKFCharacteristic

void __34___MKFCharacteristic_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"service.accessory.home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_117566;
  homeRelation__hmf_once_v1_117566 = v0;
}

@end