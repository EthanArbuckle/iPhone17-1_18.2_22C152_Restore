@interface HMHomeManager
@end

@implementation HMHomeManager

uint64_t __60__HMHomeManager_HMUAdditions__hmu_homeWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __48__HMHomeManager_HMUAdditions__hmu_homeWithName___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __65__HMHomeManager_HMUAdditions__hmu_homesContainingRoomsWithNames___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 rooms];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__HMHomeManager_HMUAdditions__hmu_homesContainingRoomsWithNames___block_invoke_2;
  v6[3] = &unk_2645452D0;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __65__HMHomeManager_HMUAdditions__hmu_homesContainingRoomsWithNames___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 name];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

uint64_t __65__HMHomeManager_HMUAdditions__hmu_homesContainingZonesWithNames___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 zones];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__HMHomeManager_HMUAdditions__hmu_homesContainingZonesWithNames___block_invoke_2;
  v6[3] = &unk_2645452F8;
  id v7 = *(id *)(a1 + 32);
  uint64_t v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

uint64_t __65__HMHomeManager_HMUAdditions__hmu_homesContainingZonesWithNames___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = [a2 name];
  uint64_t v4 = [v2 containsObject:v3];

  return v4;
}

BOOL __63__HMHomeManager_HMUAdditions__hmu_homesWithHomeLocationStatus___block_invoke(uint64_t a1, void *a2)
{
  return [a2 homeLocationStatus] == *(void *)(a1 + 32);
}

@end