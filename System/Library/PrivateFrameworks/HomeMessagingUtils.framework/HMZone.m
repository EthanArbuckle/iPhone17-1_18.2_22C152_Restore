@interface HMZone
@end

@implementation HMZone

uint64_t __39__HMZone_HMUAdditions__hmu_accessories__block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessories];
}

id __39__HMZone_HMUAdditions__hmu_accessories__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __36__HMZone_HMUAdditions__hmu_homePods__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmu_homePods");
}

id __36__HMZone_HMUAdditions__hmu_homePods__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __47__HMZone_HMUAdditions__hmu_accessoriesInZones___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmu_accessories");
}

id __47__HMZone_HMUAdditions__hmu_accessoriesInZones___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __55__HMZone_HMUAdditions__hmu_uniqueIdentifiersFromZones___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

uint64_t __41__HMZone_HMUAdditions__hmu_roomsInZones___block_invoke(uint64_t a1, void *a2)
{
  return [a2 rooms];
}

id __41__HMZone_HMUAdditions__hmu_roomsInZones___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

BOOL __55__HMZone_HMUAdditions__hmu_zonesWithHomePodsFromZones___block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hmu_homePods");
  BOOL v3 = [v2 count] != 0;

  return v3;
}

BOOL __66__HMZone_HMUAdditions__hmu_zonesWithAnnounceAccessoriesFromZones___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F0DF00];
  BOOL v3 = objc_msgSend(a2, "hmu_accessories");
  v4 = objc_msgSend(v2, "hmu_announceAccessoriesFromAccessories:", v3);
  BOOL v5 = [v4 count] != 0;

  return v5;
}

@end