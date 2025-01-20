@interface HMZone(HMUAdditions)
+ (id)hmu_accessoriesInZones:()HMUAdditions;
+ (id)hmu_roomsInZones:()HMUAdditions;
+ (id)hmu_roomsInZones:()HMUAdditions appendingRooms:;
+ (uint64_t)hmu_uniqueIdentifiersFromZones:()HMUAdditions;
+ (uint64_t)hmu_zonesWithAnnounceAccessoriesFromZones:()HMUAdditions;
+ (uint64_t)hmu_zonesWithHomePodsFromZones:()HMUAdditions;
- (id)hmu_accessories;
- (id)hmu_homePods;
@end

@implementation HMZone(HMUAdditions)

- (id)hmu_accessories
{
  v1 = [a1 rooms];
  v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_0);
  v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_3);

  return v3;
}

- (id)hmu_homePods
{
  v1 = [a1 rooms];
  v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_5);
  v3 = objc_msgSend(v2, "na_flatMap:", &__block_literal_global_7);

  return v3;
}

+ (id)hmu_accessoriesInZones:()HMUAdditions
{
  v3 = objc_msgSend(a3, "na_map:", &__block_literal_global_10);
  v4 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_12);

  return v4;
}

+ (uint64_t)hmu_uniqueIdentifiersFromZones:()HMUAdditions
{
  return objc_msgSend(a3, "na_map:", &__block_literal_global_14);
}

+ (id)hmu_roomsInZones:()HMUAdditions
{
  v3 = objc_msgSend(a3, "na_map:", &__block_literal_global_16);
  v4 = objc_msgSend(v3, "na_flatMap:", &__block_literal_global_18);

  return v4;
}

+ (id)hmu_roomsInZones:()HMUAdditions appendingRooms:
{
  v5 = (void *)MEMORY[0x263EFF9C0];
  v6 = (void *)MEMORY[0x263F0E8F8];
  id v7 = a4;
  v8 = objc_msgSend(v6, "hmu_roomsInZones:", a3);
  v9 = [v5 setWithArray:v8];

  [v9 addObjectsFromArray:v7];
  v10 = [v9 allObjects];

  return v10;
}

+ (uint64_t)hmu_zonesWithHomePodsFromZones:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_22);
}

+ (uint64_t)hmu_zonesWithAnnounceAccessoriesFromZones:()HMUAdditions
{
  return objc_msgSend(a3, "na_filter:", &__block_literal_global_24);
}

@end