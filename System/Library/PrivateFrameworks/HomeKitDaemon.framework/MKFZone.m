@interface MKFZone
@end

@implementation MKFZone

uint64_t __75___MKFZone_ResidentSyncCoding__shouldIncludeForRestrictedGuestWithContext___block_invoke(uint64_t a1, void *a2)
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
  v6 = v5;
  if (v5) {
    uint64_t v7 = [v5 shouldIncludeForRestrictedGuestWithContext:*(void *)(a1 + 32)];
  }
  else {
    uint64_t v7 = 0;
  }

  return v7;
}

void __24___MKFZone_homeRelation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F08A98] predicateWithFormat:@"home.modelID == $HOMEMODELID"];
  v1 = (void *)homeRelation__hmf_once_v1_189327;
  homeRelation__hmf_once_v1_189327 = v0;
}

@end