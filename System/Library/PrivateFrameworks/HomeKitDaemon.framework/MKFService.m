@interface MKFService
@end

@implementation MKFService

void __27___MKFService_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"accessory.home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_82300;
  homeRelation__hmf_once_v1_82300 = v0;
}

void __51___MKFService_pr_findCharacteristicWithInstanceID___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  v7 = [v9 instanceID];
  int v8 = [v7 isEqualToNumber:*(void *)(a1 + 32)];

  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

@end