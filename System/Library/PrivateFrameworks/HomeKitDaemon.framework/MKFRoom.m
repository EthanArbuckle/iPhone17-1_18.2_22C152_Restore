@interface MKFRoom
@end

@implementation MKFRoom

void __24___MKFRoom_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_75629;
  homeRelation__hmf_once_v1_75629 = v0;
}

uint64_t __75___MKFRoom_ResidentSyncCoding__shouldIncludeForRestrictedGuestWithContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  uint64_t v6 = [v5 shouldIncludeForRestrictedGuestWithContext:*(void *)(a1 + 32)];

  return v6;
}

@end