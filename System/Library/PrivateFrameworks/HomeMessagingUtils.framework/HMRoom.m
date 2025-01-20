@interface HMRoom
@end

@implementation HMRoom

uint64_t __36__HMRoom_HMUAdditions__hmu_homePods__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hmu_isHomePod");
}

uint64_t __47__HMRoom_HMUAdditions__hmu_accessoriesInRooms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 accessories];
}

id __47__HMRoom_HMUAdditions__hmu_accessoriesInRooms___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __55__HMRoom_HMUAdditions__hmu_uniqueIdentifiersFromRooms___block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

BOOL __55__HMRoom_HMUAdditions__hmu_roomsWithHomePodsFromRooms___block_invoke(uint64_t a1, void *a2)
{
  id v2 = objc_msgSend(a2, "hmu_homePods");
  BOOL v3 = [v2 count] != 0;

  return v3;
}

BOOL __66__HMRoom_HMUAdditions__hmu_roomsWithAnnounceAccessoriesFromRooms___block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F0DF00];
  BOOL v3 = [a2 accessories];
  v4 = objc_msgSend(v2, "hmu_announceAccessoriesFromAccessories:", v3);
  BOOL v5 = [v4 count] != 0;

  return v5;
}

@end